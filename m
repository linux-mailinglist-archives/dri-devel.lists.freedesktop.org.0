Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FE334E1FD
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 09:21:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8A16E863;
	Tue, 30 Mar 2021 07:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4161B6E863
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 07:21:16 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso6459917pjh.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 00:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6AWbxRR3ovKhPy18pgbZKBcDCZkiPi+DKCTyfvtM7OQ=;
 b=tCQyB5y1N77+8Q36EAUCWIGXIzQF9hYVvqt72xdiMsbKKnFj+ANMSu7P++cPZ44zJ4
 mXE1NTOT5f2y077eiIMW20zimj9W3iogu10R7hnZ2Nk8GeCEp57wlceeNGs8XRicVY0d
 abaUvudh37KQ3MewnpJ1q0pv2Y9BvXIoKR2yfd2HiHjcoEyqeiXZ+FH0av/qHwTGshq0
 AtNxZJUq44ddyvMXg0ug6MXhY0rSNvw7XrbsmTpNG/JviJHCsInHcnMffaB+wbvtPCAE
 JczRuEu2s2nwh3hWLw2ndiZoGxDTYUafMxceogKZlKDCUPjG1BN0zRUdl2AqCwZWsrxE
 IDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6AWbxRR3ovKhPy18pgbZKBcDCZkiPi+DKCTyfvtM7OQ=;
 b=ubh6gGvezob6RKOjWetjsuV3/LyYWbopPEdAJR5HdCqTjCFb/72PGlh7LkUaRtGGQU
 1EbyMSQFpEFDRazEp7duG7zoORLJV3PeVoygA0X/C2oWJU4frTq1EBTJSK1Gvl/fHTOP
 vgivD+ZCjOt1bXP/md6F9SRYA8UIamnz9zFHE1CVCoW2o2TDDf8K4XSNZMHpbjBVOPOU
 SSZ3hqHHsNDGeZ/NSplX6vgo3I+igCZXJ6ikrBkYeORmB4e+0t9SPscKaK039/Q/crXk
 LIb3coDL6MdaXNkIJxrFAkx4+bwM6HCIHmxQqcV0M7DNiGpjVnCT4sd311t1AmHOBtgN
 DuCA==
X-Gm-Message-State: AOAM533e/NEmCJBfry2Nq8RCi+NmK7Ss5Ig9mU5tpV1PG07lu7EKb6wZ
 ABfFNUtlFNLCzU2QiJCbFyg=
X-Google-Smtp-Source: ABdhPJyDMXJU2SJetxKoq5cxCluKKPwaxsnUPUUHVlYIANFEgi3tRfSOi5Cfg/mZCwFy1GN7I9PBuw==
X-Received: by 2002:a17:90a:eac7:: with SMTP id
 ev7mr3038224pjb.158.1617088875921; 
 Tue, 30 Mar 2021 00:21:15 -0700 (PDT)
Received: from localhost ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id x19sm19449315pfc.152.2021.03.30.00.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 00:21:15 -0700 (PDT)
Date: Tue, 30 Mar 2021 15:21:10 +0800
From: carlis <zhangxuezhi3@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] staging: fbtft: fix a typo
Message-ID: <20210330152110.0000006c@gmail.com>
In-Reply-To: <YF3bpuh8RVg+3Nx3@kroah.com>
References: <1616763351-7433-1-git-send-email-zhangxuezhi3@gmail.com>
 <YF3bpuh8RVg+3Nx3@kroah.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: zhangxuezhi1@yulong.com, linux-staging@lists.linux.dev,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 26 Mar 2021 14:03:34 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Fri, Mar 26, 2021 at 08:55:51PM +0800, Carlis wrote:
> > From: Xuezhi Zhang <zhangxuezhi1@yulong.com>
> > 
> > Change 'tft' to 'TFT'  
> 
> That says what you did, but not _why_ you did it.
> 
> And this is not a "typo", as it is not misspelled and really is just
> fine as-is.
> 
> thanks,
> 
> greg k-h

Ok,i will undo this patch.

thanks,

Xuezhi Zhang
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
