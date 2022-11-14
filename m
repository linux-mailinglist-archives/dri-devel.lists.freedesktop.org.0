Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6965362833C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 15:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A999110E04A;
	Mon, 14 Nov 2022 14:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4B610E2C0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 14:52:32 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id i9so7480639qki.10
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 06:52:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3f1ub61Lsc6VCL4sa5BHifRavrKJ4212Dao8WWbZ+4g=;
 b=kYts66upFwoe6JPcXGPIXdhyTMS1+2vwQIRsdr5wv2gTlqoqVMVCf4F4BHlowtrmBx
 lxT5L0V6FPIOWXNA+EX4nYRZnQbRaYXEkPjUgFCmFmMK4yPDvyeFDBLHG+1Gpn0ovCxm
 2udIHb3q9pTLnM8GW4jlRCwNm7y5SVCZKi5ICZf8LuorfJrEy88C9n0SSf0FyGJrIBV9
 EXo82kU7FqLN7MoBWAWqVOXeheUztO+N0s/Dbw5LcDz9uUaDa/+vYyis2cQjlYARNPb9
 150NKr60G3hVJHhxnBDB/YiSSXe6ata5WfapoDJMgT+rdfvdZBxTV6CjZ7DuBw133iZg
 NsQw==
X-Gm-Message-State: ANoB5pmfMqCI0KK8sqf1EoYg/jKOtZYbTeopMCd0xMLR4HjLlr/yPfF4
 93GLIPrrF2NW7zUTfe2lDMvFap8LHCOW+A==
X-Google-Smtp-Source: AA0mqf4JRa1QnUoKX9U2h/tcVgiE9d/LF0/BHB2V/zkNOluHkJ9+McaQkpC93PvJtQ/7PmOZTPhW1A==
X-Received: by 2002:a05:620a:f0f:b0:6fa:df0:f326 with SMTP id
 v15-20020a05620a0f0f00b006fa0df0f326mr11540708qkl.23.1668437551496; 
 Mon, 14 Nov 2022 06:52:31 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com.
 [209.85.128.179]) by smtp.gmail.com with ESMTPSA id
 bm5-20020a05620a198500b006f474e6a715sm6341777qkb.131.2022.11.14.06.52.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 06:52:31 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-36ad4cf9132so108502267b3.6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 06:52:30 -0800 (PST)
X-Received: by 2002:a0d:dd81:0:b0:373:6180:dae5 with SMTP id
 g123-20020a0ddd81000000b003736180dae5mr12698961ywe.283.1668437550556; Mon, 14
 Nov 2022 06:52:30 -0800 (PST)
MIME-Version: 1.0
References: <20221001220342.5828-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWeZBzFM2Q8sLEqe_DfD74a1K+5qcPHADZnPfrQYqVXrg@mail.gmail.com>
 <Y3JO9NmEpS19Rt3D@pendragon.ideasonboard.com>
In-Reply-To: <Y3JO9NmEpS19Rt3D@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Nov 2022 15:52:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW80d1MSJbU8qFRYTwCaJVyyxiQrVykpuf9wYys8V6Hxw@mail.gmail.com>
Message-ID: <CAMuHMdW80d1MSJbU8qFRYTwCaJVyyxiQrVykpuf9wYys8V6Hxw@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Fix Kconfig dependency between RCAR_DU and
 RCAR_MIPI_DSI
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-renesas-soc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 Hi Laurent,

On Mon, Nov 14, 2022 at 3:22 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Nov 14, 2022 at 10:05:58AM +0100, Geert Uytterhoeven wrote:
> > On Sun, Oct 2, 2022 at 12:06 AM Laurent Pinchart wrote:
> > > When the R-Car MIPI DSI driver was added, it was a standalone encoder
> > > driver without any dependency to or from the R-Car DU driver. Commit
> > > 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence") then
> > > added a direct call from the DU driver to the MIPI DSI driver, without
> > > updating Kconfig to take the new dependency into account. Fix it the
> > > same way that the LVDS encoder is handled.
> > >
> > > Fixes: 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence")
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > Thanks for your patch, which is now commit a830a15678593948
> > ("drm: rcar-du: Fix Kconfig dependency between RCAR_DU
> > and RCAR_MIPI_DSI") in v6.1-rc5.
> >
> > > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > > @@ -44,12 +44,17 @@ config DRM_RCAR_LVDS
> > >         select OF_FLATTREE
> > >         select OF_OVERLAY
> > >
> > > +config DRM_RCAR_USE_MIPI_DSI
> > > +       bool "R-Car DU MIPI DSI Encoder Support"
> > > +       depends on DRM_BRIDGE && OF
> > > +       default DRM_RCAR_DU
> >
> > This means this driver is now enabled by default on systems that do not
> > have the MIPI DSI Encoder (e.g. R-Car Gen2), and that we should probably
> > disable it explicitly in shmobile_defconfig.  Is that intentional?
>
> I don't think so, no. Would you like to send a patch ? If so, it should
> enable the option in relevant defconfig files.

You mean just drop the "default DRM_RCAR_DU" here?

I'm wondering if we can solve this in a consistent way.
Currently we have:

    config DRM_RCAR_USE_CMM default DRM_RCAR_DU
    config DRM_RCAR_DW_HDMI default n
    config DRM_RCAR_USE_LVDS default DRM_RCAR_DU
    config DRM_RCAR_MIPI_DSI default n
    config DRM_RCAR_VSP default y if ARM64

HDMI is only used on R-Car Gen3 parts
MIPI_DSI is only used on R-Car Gen4 parts
LVDS is used on R-Car Gen2 and Gen3 parts

Thoughts?

> > > +       help
> > > +         Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
> > > +
> > >  config DRM_RCAR_MIPI_DSI
> > > -       tristate "R-Car DU MIPI DSI Encoder Support"
> > > -       depends on DRM && DRM_BRIDGE && OF
> > > +       def_tristate DRM_RCAR_DU
> > > +       depends on DRM_RCAR_USE_MIPI_DSI
> > >         select DRM_MIPI_DSI
> > > -       help
> > > -         Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
> > >
> > >  config DRM_RCAR_VSP
> > >         bool "R-Car DU VSP Compositor Support" if ARM

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
