Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFEAA9F7AB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 19:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CA610E21B;
	Mon, 28 Apr 2025 17:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="m/Pcwqr9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A13610E21B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 17:48:15 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-7086dcab64bso17438037b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 10:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1745862494; x=1746467294;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Br89HP6MhUe/ahwBGiB5/BbIYpp/iTR1g5Mpqa7I33k=;
 b=m/Pcwqr92sD5xX+T65S3seCabkRpw5PExHXWg0qHwOYOUJS0BLyC0pEk0KSzA9IJFm
 WE0fVuZkux214Qt+eHZnawfL8udeST9tC3x4itLeIP7/lDwIyqWJAa+kYDIyVa78PpA2
 3SJ0xLSXUiYc/XtR8DFoYIL+RsS+EtE9lvQZa0GhmhLc/bT2CMv8Pzw6hQF21UlHNWjE
 mGh/1IFtQkz/ENVYq6Xcrltqa59Oe4pHKsuzbgxkvoeKS+KHcXdOlJVHe7srGT8TrHpW
 oJYkodvcgfsY/bFEhtOFdY+KiUdfLL6BQ26kJGreZFVj3R2i9YZsLUc3z4x9Lxf99vrN
 bkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745862494; x=1746467294;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Br89HP6MhUe/ahwBGiB5/BbIYpp/iTR1g5Mpqa7I33k=;
 b=jiCNzI5xIiMmvcMbsd1JzLyKQUgUeeAYB3YRQdcBdv/yXl4oqdCwkJQmB2BbVj4Npq
 cP6gq3zPZtbLLpt9ZG+bNOayr8oWExY5O08j6e67gaycIIGeOyruhZXFWeWs8oOt9BfS
 TjgR3Ki7lVoRZfZ1Q6oAvjtKOCUhBzuFQyu05V6/QlCs+tkHxq5yKXrmlu1TueSCK7cE
 f+J1P1UPdD0M0IFoEMAADwXTc9x4jwFBzW9E9WzyPJFcN+S6T42T8aS8AfHadpV6Yp9+
 SUse/ShbccUNQx8E4F26Y1IuSaXV5nvGNI5SXaQVWb9Rf/teE/vAZTWKE/PAy1CbUtvD
 wvRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDmmeXLSXrWOCI+HyJEZoK3g1Z7tEcTbUpES06HfCSpgH03Yo1UMkLKTKpYwnJTNl6DxT9XeIA/c8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLbpu0I+4CGu4IT4Xew2Om724PdHOuqpw2Sb822Vau6+DMPzT9
 7X7NDntD/RiF+jB2GyX8Xo3tT4PrB6HIofDAymYoKJ9/7jfULrQfmcPK9jpsuE1f15KZXvrTuPP
 +WJ1OyOurz2zTgxxFI+lekPVRQJQvdFeE0bvssA==
X-Gm-Gg: ASbGncu3WPCLMZsaWxZtxOaR+8eRlVaY4gRQvVTsZMkZpyiUarHADUmLg+It7xya6Om
 HFkxzZac7y3GnamdmRpW3RgKj2nlmO+LGNEy5pAkWD8uddW/04qr3RcFAeRLRWO1wECPDUfTddp
 qsIiqKJ4Hg+gYPVKAJTFjDjDf9cUPB3krpZ5IFaS1FLWrb1ZHK3Xcg
X-Google-Smtp-Source: AGHT+IGqT38ux5vaBWGblzcdGmBhZyaMpSO70W/U+56Y5rFaiMiEKupGmQkwT4XDzj6P2STWaAz7Pgso32FQ1wf1fIw=
X-Received: by 2002:a05:690c:6d01:b0:708:3a47:3d2c with SMTP id
 00721157ae682-7089965c286mr10536507b3.13.1745862494536; Mon, 28 Apr 2025
 10:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250426-vc4-audio-inf-probe-v1-1-a500785b71df@gmail.com>
In-Reply-To: <20250426-vc4-audio-inf-probe-v1-1-a500785b71df@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 28 Apr 2025 18:47:58 +0100
X-Gm-Features: ATxdqUGhyN8MsnmzldLq3CrZVM8rsc0UmD66HlBXP3YuWCGQVL9or9qwouRQw84
Message-ID: <CAPY8ntDqKBBt-uOb9m58jKhCn79RE26890X0EdxKiwWrypXN4Q@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: fix infinite EPROBE_DEFER loop
To: Gabriel Dalimonte <gabriel.dalimonte@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gabriel

On Sat, 26 Apr 2025 at 07:23, Gabriel Dalimonte
<gabriel.dalimonte@gmail.com> wrote:
>
> `vc4_hdmi_audio_init` calls `devm_snd_dmaengine_pcm_register` which may
> return EPROBE_DEFER. Calling `drm_connector_hdmi_audio_init` adds a
> child device. The driver model docs[1] state that adding a child device
> prior to returning EPROBE_DEFER may result in an infinite loop.
>
> [1] https://www.kernel.org/doc/html/v6.14/driver-api/driver-model/driver.html
>
> Signed-off-by: Gabriel Dalimonte <gabriel.dalimonte@gmail.com>
> ---
> Starting with v6.14, my Raspberry Pi 4B on the mainline kernel started seeing
> the vc4 driver looping during probe with:
>
> vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> Registered IR keymap rc-cec
> rc rc0: vc4-hdmi-0 as /devices/platform/soc/fef00700.hdmi/rc/rc0
> input: vc4-hdmi-0 as /devices/platform/soc/fef00700.hdmi/rc/rc0/input3503
> vc4_hdmi fef00700.hdmi: Could not register PCM component: -517
>
> repeating several times per second.
>
> From my understanding, this happens due to the mainline kernel missing the
> patches to support audio portion of the HDMI interface. In this case, or
> other cases where the sound subsystem can't create a device, it returns
> -517 (EPROBE_DEFER). All of this is consistent with what I experienced prior
> to 6.14 as well. However, prior to 6.14 it did not try to probe infinitely.

Mainline should have all the bits for HDMI audio on Pi4.
It doesn't have the bits for Pi5 as it needs the newer DMA controller.

> Bisecting 6.13 -> 6.14, it looks like
> 9640f1437a88d8c617ff5523f1f9dc8c3ff29121 [1] moved HDMI audio connector
> initialization from audio vc4 audio initialization to vc4 connector
> initialization. If my understanding is correct, this change causes a child
> device to be added before EPROBE_DEFER is returned and queues the device probe
> to happen when a new device is added, which happens immediately because the
> audio child device was added earlier in the probe.

cc Dmitry as the author of that patch.

However I don't see an issue with moving the init back to vc4_hdmi_audio_init.
I'm not an expert on the sequencing of things around the audio side
though, so I wonder if Dmitry or Maxime could comment.

The patch could do with a Fixes: tag if 9640f1437a88 if it is
definitely the commit that breaks things.

Thanks
  Dave

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9640f1437a88d8c617ff5523f1f9dc8c3ff29121
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index a29a6ef266f9a5952af53030a9a2d313e2ecdfce..163d092bd973bb3dfc5ea61187ec5fdf4f4f6029 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -560,12 +560,6 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
>         if (ret)
>                 return ret;
>
> -       ret = drm_connector_hdmi_audio_init(connector, dev->dev,
> -                                           &vc4_hdmi_audio_funcs,
> -                                           8, false, -1);
> -       if (ret)
> -               return ret;
> -
>         drm_connector_helper_add(connector, &vc4_hdmi_connector_helper_funcs);
>
>         /*
> @@ -2291,6 +2285,12 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
>                 return ret;
>         }
>
> +       ret = drm_connector_hdmi_audio_init(&vc4_hdmi->connector, dev,
> +                                           &vc4_hdmi_audio_funcs, 8, false,
> +                                           -1);
> +       if (ret)
> +               return ret;
> +
>         dai_link->cpus          = &vc4_hdmi->audio.cpu;
>         dai_link->codecs        = &vc4_hdmi->audio.codec;
>         dai_link->platforms     = &vc4_hdmi->audio.platform;
>
> ---
> base-commit: b60301774a8fe6c30b14a95104ec099290a2e904
> change-id: 20250426-vc4-audio-inf-probe-f67a8aa2a180
>
> Best regards,
> --
> Gabriel Dalimonte <gabriel.dalimonte@gmail.com>
>
