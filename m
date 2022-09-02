Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3F35AA8E1
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 09:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B27A10E798;
	Fri,  2 Sep 2022 07:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C938F10E798;
 Fri,  2 Sep 2022 07:41:32 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id cb8so929017qtb.0;
 Fri, 02 Sep 2022 00:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=I0BzN+oySEF5bQ4YY03gLnpAlLeJEFGcm1NmTucRGdY=;
 b=KiUYQvJfwOGkrlXys8zaKcKzrXfK/hNdWehXu4SMjrlralSbOJZXYX2MDrtAzFhpZo
 AjMpMZcwhWPFEKoOyB0gGZC2Qnn5nfhHsEbLiqwLWkOSSEgBSAwdk/2DymABUoDn/OSY
 /ij9m1wAvT+pAJGDF++Ky7Mq0GNRgqeLgJogFVJRyj2ihkEfZWkiSNPy9tI2rl+7tysh
 w7/tS8INSsQlQUgeqVG4cvBdfAtqYjPkP5OEZysOnZ+J157mRBbaLikL2JUGIQgaJ5qV
 VPVJyDnnQsbxUBEL8tzOazOHvFF+jGWGOibW7zwIMmp/XrkJ3TK7H7W5cBtt3kveX+jE
 t+yw==
X-Gm-Message-State: ACgBeo0TVYVheIRBw2X/cNB84XpoU1onEzm7PTollz342kTfQTQbZVMK
 yeWZpXH/S24Yx3lDpd+Lxn5grpbQhiRiTQ==
X-Google-Smtp-Source: AA6agR7O5CON4AQ4e9nIUYhcf/XTd2qv00X1f/5WbvImB2Ux8rytNROk3LgNPTkDn5gglsx55MXEtw==
X-Received: by 2002:a05:622a:653:b0:344:88fd:1f9a with SMTP id
 a19-20020a05622a065300b0034488fd1f9amr27655537qtb.183.1662104491689; 
 Fri, 02 Sep 2022 00:41:31 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178]) by smtp.gmail.com with ESMTPSA id
 bm39-20020a05620a19a700b006b97151d2b3sm837819qkb.67.2022.09.02.00.41.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Sep 2022 00:41:31 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id p204so2031862yba.3;
 Fri, 02 Sep 2022 00:41:31 -0700 (PDT)
X-Received: by 2002:a81:750b:0:b0:341:10ef:2c37 with SMTP id
 q11-20020a81750b000000b0034110ef2c37mr20502429ywc.316.1662104131692; Fri, 02
 Sep 2022 00:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-9-459522d653a7@cerno.tech>
 <30a9d7cd-d9ff-3177-ac6c-e7c1f966d89a@gmail.com>
In-Reply-To: <30a9d7cd-d9ff-3177-ac6c-e7c1f966d89a@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Sep 2022 09:35:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_yfr1ybNM9Dyk6n34Cqv5WJv1wZxQ_ZGJ_T8JCOeB2g@mail.gmail.com>
Message-ID: <CAMuHMdU_yfr1ybNM9Dyk6n34Cqv5WJv1wZxQ_ZGJ_T8JCOeB2g@mail.gmail.com>
Subject: Re: [PATCH v2 09/41] drm/connector: Add TV standard property
To: Mateusz Kwiatkowski <kfyatek@gmail.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Ben Skeggs <bskeggs@redhat.com>, linux-sunxi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mateusz,

On Fri, Sep 2, 2022 at 12:00 AM Mateusz Kwiatkowski <kfyatek@gmail.com> wrote:
> W dniu 29.08.2022 o 15:11, Maxime Ripard pisze:
> > The TV mode property has been around for a while now to select and get the
> > current TV mode output on an analog TV connector.
> >
> > Despite that property name being generic, its content isn't and has been
> > driver-specific which makes it hard to build any generic behaviour on top
> > of it, both in kernel and user-space.
> >
> > Let's create a new bitmask tv norm property, that can contain any of the
> > analog TV standards currently supported by kernel drivers. Each driver can
> > then pass in a bitmask of the modes it supports.
>
> This is not a bitmask property anymore, you've just changed it to an enum.
> The commit message is now misleading.
>
> > +static const struct drm_prop_enum_list drm_tv_mode_enum_list[] = {
> > +    { DRM_MODE_TV_MODE_NTSC_443, "NTSC-443" },
> > +    { DRM_MODE_TV_MODE_NTSC_J, "NTSC-J" },
> > +    { DRM_MODE_TV_MODE_NTSC_M, "NTSC-M" },
> > +    { DRM_MODE_TV_MODE_PAL_60, "PAL-60" },
> > +    { DRM_MODE_TV_MODE_PAL_B, "PAL-B" },
> > +    { DRM_MODE_TV_MODE_PAL_D, "PAL-D" },
> > +    { DRM_MODE_TV_MODE_PAL_G, "PAL-G" },
> > +    { DRM_MODE_TV_MODE_PAL_H, "PAL-H" },
> > +    { DRM_MODE_TV_MODE_PAL_I, "PAL-I" },
> > +    { DRM_MODE_TV_MODE_PAL_M, "PAL-M" },
> > +    { DRM_MODE_TV_MODE_PAL_N, "PAL-N" },
> > +    { DRM_MODE_TV_MODE_PAL_NC, "PAL-Nc" },
> > +    { DRM_MODE_TV_MODE_SECAM_60, "SECAM-60" },
> > +    { DRM_MODE_TV_MODE_SECAM_B, "SECAM-B" },
> > +    { DRM_MODE_TV_MODE_SECAM_D, "SECAM-D" },
> > +    { DRM_MODE_TV_MODE_SECAM_G, "SECAM-G" },
> > +    { DRM_MODE_TV_MODE_SECAM_K, "SECAM-K" },
> > +    { DRM_MODE_TV_MODE_SECAM_K1, "SECAM-K1" },
> > +    { DRM_MODE_TV_MODE_SECAM_L, "SECAM-L" },
> > +};
>
> I did not comment on it the last time, but this list looks a little bit random.
>
> Compared to the standards defined by V4L2, you also define SECAM-60 (a good
> thing to define, because why not), but don't define PAL-B1, PAL-D1, PAL-K,
> SECAM-H, SECAM-LC (whatever that is - probably just another name for SECAM-L,
> see my comment about PAL-Nc below), or NTSC-M-KR (a Korean variant of NTSC).
>
> Like I mentioned previously, I'm personally not a fan of including all those
> CCIR/ITU system variants, as they don't mean any difference to the output unless
> there is an RF modulator involved. But I get it that they have already been used
> and regressing probably wouldn't be a very good idea. But in that case keeping
> it consistent with the set of values used by V4L2 would be wise, I think.

Exactly. Anything outputting RGB (e.g. through a SCART or VGA connector)
doesn't care about the color subcarrier or modulator parts.  Likewise,
anything outputting CVBS doesn't care about the modulator part.

Perhaps "generic" variants of NSTC and PAL/SECAM should be added, which
would really just mean 525/60 resp. 625/50.

Alternatively, the tv_mode field could be split in two parts (either
two separate fields, or bitwise), to maintain a clear separation between
lines/fields versus color encoding and RF modulation (with zero for the
latter meaning a generic version)? That would also keep the door open
for TV_MODE_405_50, TV_MODE_819_50, TV_MODE_750_50, TV_MODE_750_60, ...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
