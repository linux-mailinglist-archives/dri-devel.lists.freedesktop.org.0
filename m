Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 713743527A7
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 10:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE666EE38;
	Fri,  2 Apr 2021 08:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68816EE38
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 08:57:03 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id 12so2200645wmf.5
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Apr 2021 01:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=S7ce0Vxpg2sR3Lixx6Rl5vj4I10NemweROF9R1wsVX4=;
 b=YsObxn3+33f0x47mw+a2YdWHzIAq5V3WcbiNe7j7zNPdwdnowgW+oxga2m7hqNvI+B
 7rU41kLGQlBEYigBn89HOt0+v80Cmajma8pI6iY347QTK9XQdFbKIoDO/vrvQoJLpHqO
 obXkXNg6VuOLbLbqHSaOpl1pdPXVN8P2YmOQysruh8fNhO/vCv3HnxA5xiu0NPu9/aG/
 fMD1paRHHJg4uHgZj2hvLNSlbizzZpRH2Ec+uz6klP56c4BzTIwQCvlYOAkgC7s7xoRd
 mlLBMWwaqxEOMZ+lH6qZVGj74qd9ehpoTcmROC5A968tecDYHLrm+ea8CwkghCMr10AT
 8f0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S7ce0Vxpg2sR3Lixx6Rl5vj4I10NemweROF9R1wsVX4=;
 b=PzcgRxvCaQwy2Htmv4Oq2vuNi+TXYdVli3bPMcKn2GcdqJsQwj14Xc0lC5slwWPO+2
 hFrSKAd8yBk1IdIxeGrlLJlOj6dWBdne1cMDszB/YApL0Cu9XHvHqMha7T24mDvX21MG
 pUJdeZ8vc9B7rhWZhLabsGeUr/iUJZxiBVGVKGjsJ113CzgffaGy+rY6vYxZgZHr4cPi
 7Nkg4uiftzH1VNuCr0zB6wJFBpi+Uj+laLoWYgpzKqEUFIQU4jE5t0YVCzCpNOuL3aLP
 /j9/iGe5F8dU1za/B7Y+RtkZKx6nvXbNU3uMC2j3T26NM3f3R2aBJFOCgSeU+gKv1h1i
 zQ/A==
X-Gm-Message-State: AOAM533Vr8S6BEWa2TkHDQEwSOfeKb2drLEa3+s0xf8sXL1LrZqv+MIU
 Yxva8D48UmlnhgFw+SPXuF3JoE54JGf5Q8Q/O4c=
X-Google-Smtp-Source: ABdhPJyubigy03RcapzbnkfaAKQTZy3/TqkRV465izj294G5yfa90DXKok09jfrNBuiR9P3XMwdkZw==
X-Received: by 2002:a1c:3d46:: with SMTP id k67mr11724458wma.188.1617353822549; 
 Fri, 02 Apr 2021 01:57:02 -0700 (PDT)
Received: from equinox
 (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:dfde:e1a0::2])
 by smtp.gmail.com with ESMTPSA id h8sm13874239wrt.94.2021.04.02.01.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 01:57:02 -0700 (PDT)
Date: Fri, 2 Apr 2021 09:57:00 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] zero-fill colormap in drivers/video/fbdev/core/fbcmap.c
Message-ID: <YGbcXMfP5pbCkG/9@equinox>
References: <20210331220719.1499743-1-phil@philpotter.co.uk>
 <CAMuHMdVh9JPZKphSi5+KR+BMJL7cQpVifrPBzhR3ees8QBhBXw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVh9JPZKphSi5+KR+BMJL7cQpVifrPBzhR3ees8QBhBXw@mail.gmail.com>
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
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 01, 2021 at 11:55:50AM +0200, Geert Uytterhoeven wrote:
> On Thu, Apr 1, 2021 at 12:09 AM Phillip Potter <phil@philpotter.co.uk> wrote:
> > Use kzalloc() rather than kmalloc() for the dynamically allocated parts
> > of the colormap in fb_alloc_cmap_gfp, to prevent a leak of random kernel
> > data to userspace under certain circumstances.
> >
> > Fixes a KMSAN-found infoleak bug reported by syzbot at:
> > https://syzkaller.appspot.com/bug?id=741578659feabd108ad9e06696f0c1f2e69c4b6e
> >
> > Reported-by: syzbot+47fa9c9c648b765305b9@syzkaller.appspotmail.com
> > Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

Dear Geert

Thank you for your review :-)

Regards,
Phil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
