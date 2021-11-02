Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A494432C8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77AB2731AC;
	Tue,  2 Nov 2021 16:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1AF731AD
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 16:33:32 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d24so3646130wra.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 09:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LAvIC90H2Q09upFWDw++dDK4c8sFoQjuntZhnvDGSjc=;
 b=c0mbANBt9R9oj2N98L18a2I8SDKA/gipnKrWs4hd1qLDydb9Sm8p0Tcn6pVUrcNZYS
 0YO3WLlDbYN9LkPXt9oDJl6yHVNsRc/ZsbJO9SKBnFILFlOP3mGcsfylFiqzMlw2UqnT
 YK29EU54tvJhS6nmvqPUWmde/+VU0IeseY5lGZcxiujlOLNV4AjDG5pzVCa0ln+/aCSm
 dC2PM5dknbACWIF0UteQJKH32XlB45eSytkJNuBTEBSSscH8Ui1Aoi/AbUA/acW/jYmG
 dItZ9cExxmcMcfe+F9ZlzG16Fvcdwy5icX9D78B+l+EgvI0PHndwL0Ww0EwxWl26H6Oi
 Ziag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LAvIC90H2Q09upFWDw++dDK4c8sFoQjuntZhnvDGSjc=;
 b=nDMsvDplhYWc2Lfatyzq+mZlLRqNfm8uCWEiBbTnH4Y+DCYmUfyvEVH2CxbCKWWnTM
 48vivCQD2MCBCBR6ymGQqkpldTmjB0XQIxq8dzLv0q1m4x/n/rhpMyTx1Hp6Fd1O+tAT
 msFcKGsAqEnp/gTiw884Fvbh7v+KpRUyQShScGngL0WlNktG6tQ+zW/glTVW0oLVzxs0
 E5sG+YJOlIAHvk2zVJd5ou8UJ9xTZJUaXrXK4ghAYZVbydzlyv8pgpCqDbjkT7Ivi44q
 dAqA9LictyhIgpAKaQ5jrXfhisemWWOhlMJQbdXigcL0f4wKJsPOuaXcBCaRKicnhIwa
 wZdg==
X-Gm-Message-State: AOAM530v62q4rBwnma336zvwoBJiV5+NyL15OBenMW7HTwlWReWi/ueJ
 g7AzUjD8LwHz7S7wEpr1M1PmPrNAnSWFAaBoEdHM7A==
X-Google-Smtp-Source: ABdhPJzWC/vow5AFfmXW2psyst7Pv3WXP5/d12dixg/4qM4EsHpPOXqX8KOpobyDj89zmTTPgtf8ds+xSsuvmiW+gcM=
X-Received: by 2002:adf:a143:: with SMTP id r3mr48509272wrr.8.1635870810754;
 Tue, 02 Nov 2021 09:33:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211025152903.1088803-1-maxime@cerno.tech>
 <20211025152903.1088803-7-maxime@cerno.tech>
In-Reply-To: <20211025152903.1088803-7-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 2 Nov 2021 16:33:14 +0000
Message-ID: <CAPY8ntBKMr8RRCSq2xY-_uji-d=4Vr4BG53VoXzSd2dKJF-0ww@mail.gmail.com>
Subject: Re: [PATCH v8 06/10] drm/vc4: crtc: Add some logging
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
> The encoder retrieval code has been a source of bugs and glitches in the
> past and the crtc <-> encoder association been wrong in a number of
> different ways.
>
> Add some logging to quickly spot issues if they occur.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index fbc1d4638650..6decaa12a078 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -541,6 +541,9 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
>         struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, old_state);
>         struct drm_device *dev = crtc->dev;
>
> +       drm_dbg(dev, "Disabling CRTC %s (%u) connected to Encoder %s (%u)",
> +               crtc->name, crtc->base.id, encoder->name, encoder->base.id);
> +
>         require_hvs_enabled(dev);
>
>         /* Disable vblank irq handling before crtc is disabled. */
> @@ -572,6 +575,9 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
>         struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, new_state);
>         struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
>
> +       drm_dbg(dev, "Enabling CRTC %s (%u) connected to Encoder %s (%u)",
> +               crtc->name, crtc->base.id, encoder->name, encoder->base.id);
> +
>         require_hvs_enabled(dev);
>
>         /* Enable vblank irq handling before crtc is started otherwise
> --
> 2.31.1
>
