Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DFA181667
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 12:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53A26E42D;
	Wed, 11 Mar 2020 11:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048B26E42D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 11:00:30 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id d5so1644721wrc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 04:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b25sp8qI66/j49iyqNBdtNtMfSxMP1oLNv9A/qaCM54=;
 b=sb18lLKdSNSbxGqA+zyYirj10S+4pAyx5q2T4myXQBQU5GcQIXieK/Wa1x7PNYPY4z
 7S3WsqR8o1HJK5iidQd31GRWt0YLv6l2TVdNAfYlCGjfx6n5S4zA6+7Kp56GCoWuy7Us
 5GGaRq24RthbtueJWxMCdoK/tPQxEfx6YhnL8CRXAu8oGZb6VDTUBCIoDToMgyH+X0zo
 P3ffXXHuqgFED6uQqq3pCVDoDtmdnRByLxzmi4F07ZZICycw010EMcIvH5P905/BMMQf
 +FRmiOjR21i00obejzRA+xY27ZTjg2rIedoDvdDtEjMUeWKAwgZPgxAgNahJCpnGpopP
 4seQ==
X-Gm-Message-State: ANhLgQ1W6hKF42IEjgjm24vTpkVDE4Qy9Aso634W5KYthHQZBjIf0hSN
 EdrMYPJabrZUCXO+R6HaL5I=
X-Google-Smtp-Source: ADFU+vvNZicSP57FUXBCc+PbAP0dQa6QnWWOb5Ff7mqH6aO33TLcIKh9t9fDtFxYFTEo8QnHyZAzlw==
X-Received: by 2002:adf:e485:: with SMTP id i5mr4104528wrm.81.1583924428712;
 Wed, 11 Mar 2020 04:00:28 -0700 (PDT)
Received: from debian (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id z19sm8187551wma.41.2020.03.11.04.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 04:00:27 -0700 (PDT)
Date: Wed, 11 Mar 2020 11:00:25 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH -next 019/491] Hyper-V CORE AND DRIVERS: Use fallthrough;
Message-ID: <20200311110025.lycn35o7zvvmohvu@debian>
References: <cover.1583896344.git.joe@perches.com>
 <84677022b8ec4ad14bddab57d871dcbfc0b4a1bf.1583896348.git.joe@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84677022b8ec4ad14bddab57d871dcbfc0b4a1bf.1583896348.git.joe@perches.com>
User-Agent: NeoMutt/20180716
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
Cc: Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, "K. Y. Srinivasan" <kys@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 10, 2020 at 09:51:33PM -0700, Joe Perches wrote:
> Convert the various uses of fallthrough comments to fallthrough;
> 
> Done via script
> Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe.com/
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Reviewed-by: Wei Liu <wei.liu@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
