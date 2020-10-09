Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9475928830D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 08:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546776EC36;
	Fri,  9 Oct 2020 06:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52686EC34
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 06:55:44 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j2so9059652wrx.7
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Oct 2020 23:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=0DIIkikDzDpqw7QIcfNPLZr1NLPJnYzyVy6xbInQ09c=;
 b=khw75Y3YtoatbpZVz+cYlQNIYPP8MqfVV7IpxED67l9Qfc8LAS2oHH0Jd2SNMQgiZ3
 EJoTkuwiYjvE3HPmjOcoklrOfVHPec5S3UElMoIIHZqso/7vHn1peubwJd9OHIHRPA54
 FKjsiVisTn5lcQLzrxi2NYsyCDZ5HYItNXEKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=0DIIkikDzDpqw7QIcfNPLZr1NLPJnYzyVy6xbInQ09c=;
 b=mDbgr2A2XCWk026SsBgEK9PhvNIJ+sGdGG8L+HLe3dg+t2ZLxbsJ6BhB0wRQuTsnh+
 bKQHcm5/nlztSuO7nOUn7vcOv8brXPWu7dfO8EfJtc+/UTzo5P3XBnasJNf27Ahc6h95
 EAeO3t6e5MZYM457gyZNfc+m7fAjOoBZmawc/D4yfH5CCP3OoQSAABn+D2RGIjtn6EMO
 mq23v8Y1vsQGwKL40OPHZ+8OwytR88X09EM+okAgY44tRFynkb8u8mTKeWNWHKh0bKtI
 iavIaTBR6e1Hv4thTSkVQ4Hq+VCOO69UQeNiJr+nf3Mq48ayKm0dBQqoB5yltE9dbdnS
 pk3Q==
X-Gm-Message-State: AOAM530iADDWaKy/rOVYxvdtwDKeXwJz2Zdc7dGwfBFULU57vwErfprf
 iQJvfBGiXuwPMHKEUbFloow+pQ==
X-Google-Smtp-Source: ABdhPJwINWBtAcBqqUULl8SGGW4lyULdu1/AzvHe7YnRNfs22ucQoPSdKC0g+OrLnW4upZaZaYCbMw==
X-Received: by 2002:adf:ed09:: with SMTP id a9mr12994550wro.407.1602226543511; 
 Thu, 08 Oct 2020 23:55:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k190sm10332534wme.33.2020.10.08.23.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 23:55:42 -0700 (PDT)
Date: Fri, 9 Oct 2020 08:55:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update entry for st7703 driver after the
 rename
Message-ID: <20201009065540.GJ438822@phenom.ffwll.local>
Mail-Followup-To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Ondrej Jirman <megous@megous.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>,
 Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>
References: <20200701184640.1674969-1-megous@megous.com>
 <alpine.DEB.2.21.2010090623060.15995@felia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2010090623060.15995@felia>
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
Cc: Ondrej Jirman <megous@megous.com>, Purism Kernel Team <kernel@puri.sm>,
 David Airlie <airlied@linux.ie>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 09, 2020 at 06:27:46AM +0200, Lukas Bulwahn wrote:
> =

> =

> On Wed, 1 Jul 2020, Ondrej Jirman wrote:
> =

> > The driver was renamed, change the path in the MAINTAINERS file.
> > =

> > Signed-off-by: Ondrej Jirman <megous@megous.com>
> =

> This minor non-urgent cleanup patch has not been picked up yet by anyone.
> =

> Hence, ./scripts/get_maintainers.pl --self-test=3Dpatterns continues to =

> complain:
> =

>   warning: no file matches  F:	Documentation/devicetree/bindings/display/=
panel/rocktech,jh057n00900.txt
>   warning: no file matches  F:	drivers/gpu/drm/panel/panel-rocktech-jh057=
n00900.c
> =

> This patch cleanly applies on next-20201008 and resolves the issue above.

Generally after 2-3 weeks a patch is lost and unfortunately needs to be
resend. Please do that next time around instead of waiting.

Patch queued up now for 5.10, thanks.
-Daniel

> Reviewed-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> =

> =

> Lukas
> =

> > ---
> >  MAINTAINERS | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > =

> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5f186a661a9b..f5183eae08df 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5487,12 +5487,13 @@ S:	Maintained
> >  F:	Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
> >  F:	drivers/gpu/drm/panel/panel-raydium-rm67191.c
> >  =

> > -DRM DRIVER FOR ROCKTECH JH057N00900 PANELS
> > +DRM DRIVER FOR SITRONIX ST7703 PANELS
> >  M:	Guido G=FCnther <agx@sigxcpu.org>
> >  R:	Purism Kernel Team <kernel@puri.sm>
> > +R:	Ondrej Jirman <megous@megous.com>
> >  S:	Maintained
> > -F:	Documentation/devicetree/bindings/display/panel/rocktech,jh057n0090=
0.txt
> > -F:	drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
> > +F:	Documentation/devicetree/bindings/display/panel/rocktech,jh057n0090=
0.yaml
> > +F:	drivers/gpu/drm/panel/panel-sitronix-st7703.c
> >  =

> >  DRM DRIVER FOR SAVAGE VIDEO CARDS
> >  S:	Orphan / Obsolete
> > -- =

> > 2.27.0
> > =

> > =



-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
