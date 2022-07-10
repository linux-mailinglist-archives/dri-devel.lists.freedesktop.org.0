Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A9E56CEF3
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 14:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E8A12B98A;
	Sun, 10 Jul 2022 12:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D25512B989
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 12:15:16 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id i2so72191qkm.8
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 05:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F1KzBsU3dYtsZFK6b+RdFFLCXpDrBVzqa3+rOWwQJzE=;
 b=XrL9cL3Ufi810rT3UXSlxhLu6Zb7FziPusYeQCtvpk21b0KouPG6hfxjRuLZDCFerH
 ONzJ3enR1wvvS2V/Kl0DopgJgAUCALDYCD4064FrSGJanZROM3nDKq/oSz0fz5M3gqla
 5stgvtMeWtP92dFV1qwplP/SkFxnNgnQ2UC+8KXPBiYNGB6uTOPZXp3GOYHWu/y5JWnd
 r72vLx68dew2sU2v3KbOKk+3MWJRcAOcqnbu5gEnrRtl9Wkq413723LjEcD+3hygamG2
 kJSyG49F19awVZIZlMgFLzAVwiC9T0+ZSCkA8X6FM15APM6wYQP+vr0jqB93younSOLu
 jhTw==
X-Gm-Message-State: AJIora/Qvx8Xtkn/PtDFxeG4Gb68JMPQQuD/+ewoWfoXZ1I+EkHbEUX2
 MGoqGWQP0XULdX/fCwZcQwlwuhXYXCjjKw==
X-Google-Smtp-Source: AGRyM1sFixiSCBP8HiTfRHSKWyjmzZZE+eDQmcNNRN0tMBKzyuQp2ojcX/eeJ0nEHGZtwK/HLzQJ7w==
X-Received: by 2002:a37:464b:0:b0:6b5:77ee:c3a7 with SMTP id
 t72-20020a37464b000000b006b577eec3a7mr3065822qka.83.1657455313797; 
 Sun, 10 Jul 2022 05:15:13 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 bq11-20020a05620a468b00b006af6f0893c6sm3502351qkb.91.2022.07.10.05.15.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Jul 2022 05:15:13 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-31c86fe1dddso25865097b3.1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 05:15:13 -0700 (PDT)
X-Received: by 2002:a0d:dd09:0:b0:31c:e3b9:7442 with SMTP id
 g9-20020a0ddd09000000b0031ce3b97442mr14223988ywe.47.1657455313118; Sun, 10
 Jul 2022 05:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657302034.git.geert@linux-m68k.org>
 <Ysqsm6l9z09n0PRq@ravnborg.org>
In-Reply-To: <Ysqsm6l9z09n0PRq@ravnborg.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 10 Jul 2022 14:15:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXa=Qkq_vp_FhNCa9jY7XrfCbtFf8wBEqkYGTUEO=SWjg@mail.gmail.com>
Message-ID: <CAMuHMdXa=Qkq_vp_FhNCa9jY7XrfCbtFf8wBEqkYGTUEO=SWjg@mail.gmail.com>
Subject: Re: [PATCH libdrm v2 00/10] Add support for low-color frame buffer
 formats
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Sun, Jul 10, 2022 at 12:40 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> On Fri, Jul 08, 2022 at 08:21:30PM +0200, Geert Uytterhoeven wrote:
> > A long outstanding issue with the DRM subsystem has been the lack of
> > support for low-color displays, as used typically on older desktop
> > systems, and on small embedded displays.
> >
> > This patch series adds support for color-indexed frame buffer formats
> > with 2, 4, and 16 colors.  It has been tested on ARAnyM using a
> > work-in-progress Atari DRM driver.
> >
> > Changes compared to v1:
> >   - SMPTE color LUT accuracy,
> >   - Factor out smpte color LUT,
> >   - Restructure patches,
> >   - Improve descriptions.
> >   - Store number of colors for indexed formats,
> >   - Add SMPTE pattern support for the C1 and C2 formats.
> >
> > Please refer to [2] for related Linux DRM patches and background
> > information.
> >
> > Thanks for your comments!
> >
> > [1] "[PATCH libdrm 0/3] Add support for low-color frame buffer formats"
> >     https://lore.kernel.org/r/cover.1646683737.git.geert@linux-m68k.org
> > [2] "[PATCH v3 00/10] drm: Add support for low-color frame buffer formats"
> >     https://lore.kernel.org/r/cover.1657294931.git.geert@linux-m68k.org
> >
> > Geert Uytterhoeven (10):
> >   util: Improve SMPTE color LUT accuracy
> >   util: Factor out and optimize C8 SMPTE color LUT
> >   [RFC] drm_fourcc: Add DRM_FORMAT_C[124]
> >   util: Add support for DRM_FORMAT_C[124]
> >   util: Store number of colors for indexed formats
> >   util: Add SMPTE pattern support for C4 format
> >   util: Add SMPTE pattern support for C1 format
> >   util: Add SMPTE pattern support for C2 format
> >   modetest: Add support for DRM_FORMAT_C[124]
> >   modetest: Add SMPTE pattern support for C4 format
>
> I have browsed the patches - everything looked good.
> The parts with Floyd-Steinberg dithering did get less
> attention as I do not know it.

As a picture says more than 10000 words, I shared screenshots of
modetest showing the SMPTE pattern in C1 (monochrome FS-dithered
[1]), C2 (PenTile RG-GB FS-dithered [2]), and C4 ([3]).
And Wikipedia[4] is your friend for the algorithm ;-)

> But everything looked good and the series is:
>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Thanks!

[1] https://drive.google.com/file/d/1waJczErrIaEKRhBCCU1ynxRG8agpo0Xx/view?usp=sharing
[2] https://drive.google.com/file/d/1g5O8XeacrjrC8rgaVENvR65YeI6QvmtO/view?usp=sharing
[3] https://drive.google.com/file/d/1VIMqz_OkjJbbFS2OCX1O8GBm4bag6y2n/view?usp=sharing
[4] https://en.wikipedia.org/wiki/Floyd%E2%80%93Steinberg_dithering

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
