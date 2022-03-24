Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AC44E6964
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 20:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F58E10E88F;
	Thu, 24 Mar 2022 19:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1261 seconds by postgrey-1.36 at gabe;
 Thu, 24 Mar 2022 19:37:09 UTC
Received: from gateway22.websitewelcome.com (gateway22.websitewelcome.com
 [192.185.47.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB39210E88F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 19:37:09 +0000 (UTC)
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
 by gateway22.websitewelcome.com (Postfix) with ESMTP id 6A63B262E3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 14:16:08 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
 by cmsmtp with SMTP
 id XSwKn8snlXvvJXSwKnRdRe; Thu, 24 Mar 2022 14:16:08 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZPPzdWk6s/RXLNCY9qFj72xcElUOICSe4hFZHn0LYwo=; b=2gVqLkwGPJTOdqr0cgSfmsFHIm
 //I+by3GiPA5f+uaLvOy0jFg06sVnwvMfeXloN8Ub9PPust43mRQWozKx+/n+cMCV6FbTtZfsWH89
 Sy3yLBwdttt6lvfsW/xAA2tK+RO2aLzmMwTJm1mWky1UFp/M7n2hCpLe0J7Pm1ZiId+kD3Mo7DAHS
 Xo763c3pCsT09/1z+D3nZrDJRGujjs3zH7+RT+83ww7dVYOIs7RyPMH4NU+/NCLYFjFnG+uGQhFJb
 u+kUWA6fCe0HMsvx8tgAb0dX99IsQ7GAtZLkEwyczOHZLCC5iyJlFxzONinNs3FxL+AF4xFvnMNAN
 9Pail+Dg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:57650 helo=localhost)
 by bh-25.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@roeck-us.net>)
 id 1nXSwJ-002YBS-OP; Thu, 24 Mar 2022 19:16:07 +0000
Date: Thu, 24 Mar 2022 12:16:06 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [git pull] drm for 5.18-rc1
Message-ID: <20220324191606.GA1120460@roeck-us.net>
References: <CAPM=9tytg5jd_i3z3C5Y1dii2-cgO11Gjgvaq8qoWn3CGfCreg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9tytg5jd_i3z3C5Y1dii2-cgO11Gjgvaq8qoWn3CGfCreg@mail.gmail.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nXSwJ-002YBS-OP
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost)
 [108.223.40.66]:57650
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 12
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Mar 24, 2022 at 12:30:02PM +1000, Dave Airlie wrote:
> Hi Linus,
> 
> This is the main drm pull request for 5.18.
> 
> The summary changelog is below, lots of work all over,
> Intel improving DG2 support, amdkfd CRIU support, msm
> new hw support, and faster fbdev support.
> 
> Conflicts:
> I did a merge into your tree this morning, couple of Kconfig
> clashes, drm_cache.c needs an ioport.h include to avoid a build
> fail due to other header refactoring. I think you should be able
> to handle it.
> 
> External interactions:
> - dma-buf-map gets renamed to iosys-map
> - this adds a yes/no helper to the strings helpers, and it's used
>   in some other code.
> - platform driver for chromeos privacy screen
> 
> Let me know if there are any issues.
> 
[ ... ]
>       fbdev: Improve performance of cfb_imageblit()

As reported as reponse to the patch submission, this patch causes crashes
with qemu's mainstone, z2, and collie emulations. Reverting it fixes the
problem.

Unable to handle kernel paging request at virtual address e090d000
[e090d000] *pgd=c0c0b811c0c0b811, *pte=c0c0b000, *ppte=00000000
Internal error: Oops: 807 [#1] ARM
CPU: 0 PID: 1 Comm: swapper Not tainted 5.17.0-next-20220324 #1
Hardware name: Sharp-Collie
PC is at cfb_imageblit+0x58c/0x6e0

Guenter
