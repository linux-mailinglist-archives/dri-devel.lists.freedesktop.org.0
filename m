Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 947D33B596F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 09:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E1689FA9;
	Mon, 28 Jun 2021 07:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D256E02F
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jun 2021 08:48:26 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id q16so11463887lfr.4
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jun 2021 01:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Dr7IlCFxFMjzD5ZoiWZkQrtRVuiEBN/27kUtcpWfMU=;
 b=TI3aLnYRD0arKqMnRsDNfa/vCBd+Y0g1C5LivRwwsMLRUzUasYfwVo84CC2nFbxR24
 fhHPFLaop/O7TnCXlmdBKuZ2dVxcliIfIeXm60w+g8tbxvByi8kGWz//SguzkuXGKi3e
 hXsczrECSS/p45p3JFODhJYp1SVfWHVNClHNU3kDyy5v8MRF3W4qmwmsdXfCtRwl/USm
 u7anhww0TYZ6mWGFScQibL/ofbOsLVkmpWUqHkcwoYyGNHvfjBPdosFyx2XezOXGzTZk
 442gVwS0SglQ7JkDiucb0FPREfd58fRHflgDLQHfa7pK03paeVeJZWGxDG4uzXHffGMF
 RsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Dr7IlCFxFMjzD5ZoiWZkQrtRVuiEBN/27kUtcpWfMU=;
 b=M4qGi0Wj8yfGbICvSvjMBocqhp6N9E71aIj/AtY7DLmYxXAhDKJGpbFfh79slYaA9V
 a9VHjX5cBENT3ODjkFz06rpvGCGpmHINcsQk01rurx9RdkWWOCft4mSzQv/0Ab4lhHVV
 hVhY75IjCi5KA89mw1uyzmlVajUy3pnTSsMFMa0dq5Wa9uLUjUWEBqZ1E4Gi9yQ3XaSp
 u0gBwE08sg0c0nXteEFPcGHCnkdp2oOmbGHTrrJhoDZ94+SRYB/p8q+umWWMYISIz2Ht
 Bpv9gcN2uGEOPrrha+tk5PpAV3CwlC6/+lBg0/mJ14hIPKM3k3mWKNd1fHQ4fM2fiUGE
 n5XA==
X-Gm-Message-State: AOAM530z6N5r4hr+vgrXw2U+Rzi/pLfucpGuSsYrAPP1N3yqO/DbwPCV
 b1JEn7TQiM9NcmsHxk5IMqM=
X-Google-Smtp-Source: ABdhPJzR+MkVprcpoGGzZSSVXUV+lH5UnwMEPYmOcsb2fn4Bud+wu9dT2w8b64laAvqaUxWHv5HElw==
X-Received: by 2002:a05:6512:32a6:: with SMTP id
 q6mr15279057lfe.308.1624783705197; 
 Sun, 27 Jun 2021 01:48:25 -0700 (PDT)
Received: from localhost.localdomain ([185.215.60.89])
 by smtp.gmail.com with ESMTPSA id b7sm982604lfb.121.2021.06.27.01.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jun 2021 01:48:24 -0700 (PDT)
Date: Sun, 27 Jun 2021 11:48:16 +0300
From: Pavel Skripkin <paskripkin@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH] OMAP: DSS2: OMAPFB: fix potential GPF
Message-ID: <20210627114816.5e9d042b@gmail.com>
In-Reply-To: <20210626231423.GA38365@macbook.musicnaut.iki.fi>
References: <20210625223323.13930-1-paskripkin@gmail.com>
 <20210626231423.GA38365@macbook.musicnaut.iki.fi>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 28 Jun 2021 07:06:06 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 gustavoars@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomi.valkeinen@ti.com,
 linux-omap@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 27 Jun 2021 02:14:23 +0300
Aaro Koskinen <aaro.koskinen@iki.fi> wrote:

> Hi,
> 
> On Sat, Jun 26, 2021 at 01:33:23AM +0300, Pavel Skripkin wrote:
> > In case of allocation failures, all code paths was jumping
> > to this code:
> > 
> > err:
> > 	kfree(fbi);
> > 	kfree(var);
> > 	kfree(fbops);
> > 
> > 	return r;
> > 
> > Since all 3 pointers placed on stack and don't initialized, they
> > will be filled with some random values, which leads to
> > deferencing random pointers in kfree(). Fix it by rewriting
> > error handling path.
> 
> They are initialized before the first goto:
> 
> [...]
> 	fbi = NULL;
> 	var = NULL;
> 	fbops = NULL;
> 
> 	fbi = kzalloc(sizeof(*fbi), GFP_KERNEL);
> 	if (fbi == NULL) {
> 		r = -ENOMEM;
> 		goto err;
> 	}
> [...]
> 

Hi! 

Im sorry for this, I should not stay to late night reviewing the code
next time :(




With regards,
Pavel Skripkin
