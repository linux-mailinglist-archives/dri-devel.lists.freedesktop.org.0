Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDD331DEA3
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 18:53:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B646E9A9;
	Wed, 17 Feb 2021 17:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 491 seconds by postgrey-1.36 at gabe;
 Wed, 17 Feb 2021 17:53:21 UTC
Received: from libero.it (smtp-17-i2.italiaonline.it [213.209.12.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE276E9AA
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 17:53:21 +0000 (UTC)
Received: from oxapps-35-162.iol.local ([10.101.8.208])
 by smtp-17.iol.local with ESMTPA
 id CQstlfmUklChfCQstliNjk; Wed, 17 Feb 2021 18:45:07 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2014;
 t=1613583907; bh=zBqy723wOBBDSylIEHvgw0wi/3YgDj4qoD8G9JQ58LM=;
 h=From;
 b=Wn4H5yzYrvztBa3YxN9G+r9/C5PeRkBDoGOOysnN3s7m0K8y7b4QWRdiEt2tcCn9n
 9k0a3mWXVZ2le4dQ5MEAUIQ2A9s1hgS0z+8E6fIu9tEc1ISYo0mgt9pXr2Ysw2ZHTN
 GujkLW8Ozp3LYaOLHhvgymdk2B6cNjBWtHL9yuAt82mcRhNFe/uxoWeBbYtXnw8etu
 PfR33pEj5pjhd7MNmTtJLGQhxb/DJ2/ZP2+AqkQfM05aqN0gBiZ7IRy6dJpYYot8YX
 JH/yre7W7DVeECyiM1xnilmKwiCJMlLuVB1bExuLLyunT6fqHXNsKi3wrfc8jlhAo9
 W/YIGl/aetAFA==
X-CNFS-Analysis: v=2.4 cv=S6McfKgP c=1 sm=1 tr=0 ts=602d5623 cx=a_exe
 a=OCAZjQWm+uh9gf1btJle/A==:117 a=UPWQtH3J-JgA:10 a=IkcTkHD0fZMA:10
 a=_gZzKa99_6AA:10 a=P1BnusSwAAAA:8 a=e5mUnYsNAAAA:8 a=TPS9zQsonGm_BbHK3pAA:9
 a=QEXdDO2ut3YA:10 a=D0XLA9XvdZm18NrgonBM:22 a=Vxmtnl_E_bksehYqCbjh:22
Date: Wed, 17 Feb 2021 18:45:07 +0100 (CET)
From: Dario Binacchi <dariobin@libero.it>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, Jyri Sarha <jyri.sarha@iki.fi>
Message-ID: <1121866478.204588.1613583907193@mail1.libero.it>
In-Reply-To: <07f7a7c0-8016-bf32-92ad-b9de4aaed84c@ideasonboard.com>
References: <20210216202225.12861-1-dariobin@libero.it>
 <07f7a7c0-8016-bf32-92ad-b9de4aaed84c@ideasonboard.com>
Subject: Re: [RESEND PATCH] drm/tilcdc: fix raster control register setting
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev27
X-Originating-IP: 87.20.116.197
X-Originating-Client: open-xchange-appsuite
x-libjamsun: oP0GJDCylp8dfkkjPZa2j1JWQtWSQ61M
x-libjamv: GDjNrlyrYqE=
X-CMAE-Envelope: MS4xfOuOpzKBmd+dVP2XpVdv7VScfSsJTdTeRCvLqmRq6b7Rwpr0X4HI8pYOVUC5yDD7D+WiNn5KxJhS1gVvWCKwOT62vfwcj/RKmgCQAjbOIgNAOlUxOswD
 jkDlKHOE+PcjqiyJvmAKoaw2kVbHGwSeeoHMcFF/BYNdkc4W1q9fEpSE63/91grTFHfoYy01aDss7J/C37S28SGkLF8XU5Tf5azehWRCbNNwJC0797gWzgNa
 pKztHVwZ+w8/yze6CptETpo3CLvjlF40LWaF9ja53qHu/227cDOd0wwFpC1ZRJMHgExVdRfWW8EYvjQw6y+W8qKA9ep5gQmZW0r3uCWXqlK5Exc8vnEvI9Cp
 g0HmJB+F
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

> Il 17/02/2021 07:41 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> ha scritto:
> 
>  
> On 16/02/2021 22:22, Dario Binacchi wrote:
> > The fdd property of the tilcdc_panel_info structure must set the reqdly
> > bit field  (bit 12 to 19) of the raster control register. The previous
> > statement set the least significant bit instead.
> > 
> > Signed-off-by: Dario Binacchi <dariobin@libero.it>
> > 
> > ---
> > 
> >  drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> > index 30213708fc99..238068e28729 100644
> > --- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> > +++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> > @@ -393,7 +393,7 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
> >  			return;
> >  		}
> >  	}
> > -	reg |= info->fdd < 12;
> > +	reg |= info->fdd << 12;
> >  	tilcdc_write(dev, LCDC_RASTER_CTRL_REG, reg);
> >  
> >  	if (info->invert_pxl_clk)
> > 
> 
> This is interesting, looks like this has always been broken, and in many
> cases sets bits 0, which is the enable bit. So we enable LCDC before
> even setting the fb address. How does this not blow up LCDC totally?
> 
> The fix looks correct to me, but it will change the register value for
> boards that have apparently been working for years.
> 
> Dario, did you test this on actual HW, or did you just spot the error?

I tested it on Beaglebone Black + LCD cape (4.3inch).
I also checked the register value with devmem.

Regards,
Dario

> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
>  Tomi
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
