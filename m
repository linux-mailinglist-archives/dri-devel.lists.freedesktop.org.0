Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2804027813B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 09:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4A86EC19;
	Fri, 25 Sep 2020 07:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FF76E442
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 14:25:35 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id bb1so1775850plb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 07:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BhjXs0X1T6fyEGbqATV3iAKCYDUTserBVGQfsds99Q8=;
 b=lZ2IHLOvUlSzofjJzppCZLACHPsTpIecrUUi9yAxP/p2GvombkArlU1xTZQhAGnnjK
 g2GebQ/478ooEg8r5LWavf20tfUHnei0vBc51EApwiUQoShSyH+V6dwxfT2qcl8s0iSS
 /qXQEn0URynfGfyTDlit78GesAM221oMd2R25Hi9nVYzscs9+9GmmaflqLcEp5ACCvT/
 q2mNkYlPDdTJPfqnwcNgEyRQxXy4CapItbbfWtij9i+M1fCht3TSleY5p+Zb5vH+e6cl
 tghZdra5yDIl1eJHDG5d1wXzyMT90qrJwYHZO22BNM6r+7AMsLHgWTizzxRn/54oshsA
 YJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BhjXs0X1T6fyEGbqATV3iAKCYDUTserBVGQfsds99Q8=;
 b=KuRWvhOu6bIZhr+Ta/aOee0EoIebRQPZgInvtMDQ0x2+ZBvkO5H1VGAlHk/9RhY/FU
 srBW0JWMeGmEu/LUWDndqdMs64ppEQSKfu0+i8XCzWm7PTaBsf4VmttR/wUvS6TfETqV
 AORnFKy/BwuSgqkqwOyGNsLdsppR/anR9HS2vnvYVdpU4uqKi5Gozco+pzN2ApJRLaXu
 WhMBcKmsRwoolZt0DQ2W1Jz2KYpN2NdZLVnvg8Q8fRwDyxFzB9l0EGH+qN/cPmFsE7oH
 cmmzuLTIVlGybytgdiwh2SnSkLAgF0Yu59KD7Ws4ZiHob/7w3kC0/cgCJ959kDqscroQ
 79Kg==
X-Gm-Message-State: AOAM531IO5aPf+rsjVjPrr0kyH91b+ZPNwPjfzzziyqXVdmfCWxg0ruA
 7Bmi5vmj1L4wtxpVVnSP3w==
X-Google-Smtp-Source: ABdhPJylzhyMM4ZubAhCo7dYA3YL2otZrpcXevMiKCn9wIriHYocj00wslJC0GNCVDoN5qMmkBz98A==
X-Received: by 2002:a17:90b:796:: with SMTP id
 l22mr4254744pjz.199.1600957534641; 
 Thu, 24 Sep 2020 07:25:34 -0700 (PDT)
Received: from PWN (n11212042027.netvigator.com. [112.120.42.27])
 by smtp.gmail.com with ESMTPSA id gb17sm2667794pjb.15.2020.09.24.07.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 07:25:33 -0700 (PDT)
Date: Thu, 24 Sep 2020 10:25:25 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/3] Prevent out-of-bounds access for built-in font data
 buffers
Message-ID: <20200924142525.GA879276@PWN>
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <20200924140937.GA749208@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200924140937.GA749208@kroah.com>
X-Mailman-Approved-At: Fri, 25 Sep 2020 07:09:24 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jiri Slaby <jirislaby@kernel.org>, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 24, 2020 at 04:09:37PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Sep 24, 2020 at 09:38:22AM -0400, Peilin Ye wrote:
> > Peilin Ye (3):
> >   fbdev, newport_con: Move FONT_EXTRA_WORDS macros into linux/font.h
> >   Fonts: Support FONT_EXTRA_WORDS macros for built-in fonts
> >   fbcon: Fix global-out-of-bounds read in fbcon_get_font()
> > 
> >  drivers/video/console/newport_con.c     |  7 +------
> >  drivers/video/fbdev/core/fbcon.c        | 12 ++++++++++++
> >  drivers/video/fbdev/core/fbcon.h        |  7 -------
> >  drivers/video/fbdev/core/fbcon_rotate.c |  1 +
> >  drivers/video/fbdev/core/tileblit.c     |  1 +
> >  include/linux/font.h                    | 13 +++++++++++++
> >  lib/fonts/font_10x18.c                  |  9 ++++-----
> >  lib/fonts/font_6x10.c                   |  9 +++++----
> >  lib/fonts/font_6x11.c                   |  9 ++++-----
> >  lib/fonts/font_7x14.c                   |  9 ++++-----
> >  lib/fonts/font_8x16.c                   |  9 ++++-----
> >  lib/fonts/font_8x8.c                    |  9 ++++-----
> >  lib/fonts/font_acorn_8x8.c              |  9 ++++++---
> >  lib/fonts/font_mini_4x6.c               |  8 ++++----
> >  lib/fonts/font_pearl_8x8.c              |  9 ++++-----
> >  lib/fonts/font_sun12x22.c               |  9 ++++-----
> >  lib/fonts/font_sun8x16.c                |  7 ++++---
> >  lib/fonts/font_ter16x32.c               |  9 ++++-----
> >  18 files changed, 79 insertions(+), 67 deletions(-)
> 
> Gotta love going backwards in arrays :)
> 
> Nice work, whole series is:
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thank you for reviewing it!

Peilin Ye

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
