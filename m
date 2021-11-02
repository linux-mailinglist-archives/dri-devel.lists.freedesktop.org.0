Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2031F443482
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 18:25:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8690273438;
	Tue,  2 Nov 2021 17:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0357573438
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 17:25:24 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id i5so26816377wrb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 10:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sxYXMf5BMsZ6bcDoB6IgyyPOcUbnu1N7v5mY6qvSF18=;
 b=YW5YjiJKTFdkL4xfBdbwyJhiCgtfRio0vHn6KKEM3uQ/s2OfI04B9QaHEBp0BlhNwI
 YXVHXnC0gujQDMz7bPBRZS39Zl88vA90UGqAPS1EniZLnwQqsQP8etwjaqL/briUAU/o
 RFlVrpSaPC8P763gHCkrxXi/HIjrAfZ157aZIyfQMWqeFXelkk4eNSv75CDOHTi12EAR
 7fo5/36H8+mZNqZviuC4BVo7av/BU8b3MnJZwq2gFA4iFCDbNJ8ucmRMtYnPNSd1t3D9
 AywdgnkFMTI3riq8nDNpQc8ForBXhrJ4hgJvsS7bd0/VKxcr/BZyimLXtjffXGeHSFom
 QhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sxYXMf5BMsZ6bcDoB6IgyyPOcUbnu1N7v5mY6qvSF18=;
 b=fxpLqOfbnpPrxzW8jkQUTQ1nXW1aaf/vNyn7y99KsJO2exarkMzMW4ofnu8xNRgGfQ
 5HVBHGLGJAdkQscTt77xTn17/QCnVoP6au/dSC4uLvenMKKtJECorx9C8G3rfFuK+Kpd
 T2lkFNE6cPJuO+Hcsy9OFBwYVakdxMmxEbsyZ+z8SxNzDBifcgcYivhMmvwiEq1APs1j
 KZieIbjww2A+YjL6o5dQFH/m+chC/OtRhjtSmXTPdF0LRwiN56HPJwrY2Up2IsiVlybt
 sixd08A66p3Aw9dwTFlxQbJTkJnUWEQ8so8OTg+5/PseFBuVFGfHjChlARA6DtyHiAbr
 3WRA==
X-Gm-Message-State: AOAM531L/RG8rlKV+oTlr/3vKIHzg13jIobJUiyjJbxMbY5lM8wTuY49
 roCoE/gV3NugktipJ1L2h6Fy7/OYZBQ3vGhgCxLf+g==
X-Google-Smtp-Source: ABdhPJyxhSk7CapvB3FHdUy3neyiWf4j7xsFGO4PQlz5UNPAlxPnqqj0NFdsJwnqG2+u9K83sXF4a8WfgwIB0+Rhm3A=
X-Received: by 2002:adf:a143:: with SMTP id r3mr48892885wrr.8.1635873923581;
 Tue, 02 Nov 2021 10:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211025152903.1088803-1-maxime@cerno.tech>
 <20211025152903.1088803-2-maxime@cerno.tech>
In-Reply-To: <20211025152903.1088803-2-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 2 Nov 2021 17:25:07 +0000
Message-ID: <CAPY8ntCOX33OYxSo87vNu2-OfAYDbJGOGhNwsA4yR+sL4kPeyQ@mail.gmail.com>
Subject: Re: [PATCH v8 01/10] drm/vc4: hdmi: Remove the DDC probing for status
 detection
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Tim Gover <tim.gover@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Oct 2021 at 16:29, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Commit 9d44abbbb8d5 ("drm/vc4: Fall back to using an EDID probe in the
> absence of a GPIO.") added some code to read the EDID through DDC in the
> HDMI driver detect hook since the Pi3 had no HPD GPIO back then.
> However, commit b1b8f45b3130 ("ARM: dts: bcm2837: Add missing GPIOs of
> Expander") changed that a couple of years later.
>
> This causes an issue though since some TV (like the LG 55C8) when it
> comes out of standy will deassert the HPD line, but the EDID will
> remain readable.
>
> It causes an issues nn platforms without an HPD GPIO, like the Pi4,
> where the DDC probing will be our primary mean to detect a display, and
> thus we will never detect the HPD pulse. This was fine before since the
> pulse was small enough that we would never detect it, and we also didn't
> have anything (like the scrambler) that needed to be set up in the
> display.
>
> However, now that we have both, the display during the HPD pulse will
> clear its scrambler status, and since we won't detect the
> disconnect/reconnect cycle we will never enable the scrambler back.
>
> As our main reason for that DDC probing is gone, let's just remove it.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

A quick conversation with Dom does conclude that the old code was odd
in that DDC read attempt was before we checked the Pi4 HPD. If there
is a need to read the DDC, then it should be after HPD (in whatever
form it exists) has been checked.
No need for that to be reinstated at this point, so this patch is fine
as it stands.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 7b0cb08e6563..338968275724 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -193,8 +193,6 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
>         if (vc4_hdmi->hpd_gpio &&
>             gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio)) {
>                 connected = true;
> -       } else if (drm_probe_ddc(vc4_hdmi->ddc)) {
> -               connected = true;
>         } else {
>                 unsigned long flags;
>                 u32 hotplug;
> --
> 2.31.1
>
