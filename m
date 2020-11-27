Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DDD2C6886
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 16:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A764B6EE2E;
	Fri, 27 Nov 2020 15:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6856EE2E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 15:14:41 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s8so5910397wrw.10
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 07:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZMzwoE0Dd6fGdbZptz4gO2+Eta2edZWtpfnfREQIYBk=;
 b=iNafPJ5ywOWSDkzoa418mygS+Pu6j0+b0FZhr6dG9lb3JOScnAd3oHUlc0LVjAmD3g
 exwlJ3BhHTSl3vuBryhe7Kgc56fC1N5rj6jJWeqihvbS3H0kM3HY57LQzY/0PqTshM70
 wHuQWaqK5Fxc12etXg9s39a4GbCEOsotO/7GU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=ZMzwoE0Dd6fGdbZptz4gO2+Eta2edZWtpfnfREQIYBk=;
 b=OSQwvZblV5+WDdyux6H9/lwfMFEb8ENxE1f9Zgz0xgMCwwKr6anhHVEMHPfDoxxgSv
 lGmRj/8A/l7/iGWQwH748iywjRBu94rgj4GKo+FjEYWuND/rHyeLsdK8DAE7I80B08cH
 A1GkBzJsilhAjdz71/+qOF1mn2Vv36izDYGGFFXdQwvd8IzP2BFnxGLoy8nKQarkOGiu
 nvZ4WEMcfe7vkifNhuW9uymM+OoaFEYoaWaPMANG29GFRBsDs7AOFrDG/XQ64pwM/8Nn
 bYmQVNEF6Vi9+vDXarURJmcpX6m4xqAN0/f2mMifNX8yCiZQ1qtdev+BN9RGxuXXMaww
 okuQ==
X-Gm-Message-State: AOAM531d2ru/5rHK84gDdfvy3ysg3Qehute1zhbV85okjGOgztgNuWSl
 U20gIXxV8dau/BnOJ2CWu2Ff4g==
X-Google-Smtp-Source: ABdhPJzeFZUg0q2fzZp1cBShV/TYpSR++GJRHPfRmFTBFUpON/ZCauJL86rwWuavStjri4mOLdoRew==
X-Received: by 2002:adf:e444:: with SMTP id t4mr11341858wrm.152.1606490080594; 
 Fri, 27 Nov 2020 07:14:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j13sm8370481wrp.70.2020.11.27.07.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 07:14:39 -0800 (PST)
Date: Fri, 27 Nov 2020 16:14:37 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] fbdev: aty: SPARC64 requires FB_ATY_CT
Message-ID: <20201127151437.GH401619@phenom.ffwll.local>
Mail-Followup-To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 sparclinux <sparclinux@vger.kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <20201127031752.10371-1-rdunlap@infradead.org>
 <CAMuHMdWup4D9A-giF9xDEhva8PPH4Yhg2NHYx3+0q_=Uoi+iRA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdWup4D9A-giF9xDEhva8PPH4Yhg2NHYx3+0q_=Uoi+iRA@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 sparclinux <sparclinux@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 27, 2020 at 10:15:49AM +0100, Geert Uytterhoeven wrote:
> On Fri, Nov 27, 2020 at 4:18 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> > It looks like SPARC64 requires FB_ATY_CT to build without errors,
> > so have FB_ATY select FB_ATY_CT if both SPARC64 and PCI are enabled
> > instead of using "default y if SPARC64 && PCI", which is not strong
> > enough to prevent build errors.
> >
> > As it currently is, FB_ATY_CT can be disabled, resulting in build
> > errors:
> >
> > ERROR: modpost: "aty_postdividers" [drivers/video/fbdev/aty/atyfb.ko] undefined!
> > ERROR: modpost: "aty_ld_pll_ct" [drivers/video/fbdev/aty/atyfb.ko] undefined!
> >
> > Fixes: f7018c213502 ("video: move fbdev to drivers/video/fbdev")
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to drm-misc-next, thanks for the patch&review.
-Daniel

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

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
