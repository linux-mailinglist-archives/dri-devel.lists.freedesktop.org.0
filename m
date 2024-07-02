Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8319248B4
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 22:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B9810E104;
	Tue,  2 Jul 2024 20:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iWUdlH1a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A7610E104
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 20:02:30 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-57ccd1111aeso2748946a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 13:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719950548; x=1720555348; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3Pg/7/y0EFr0qym6npwJSRe3aSLtAiBDqbT1OWBwL6c=;
 b=iWUdlH1anlX+YWtwHHUYsQ1enCjzVkihmc/6uDSKLOlge7l/ForEHJlII3V1jjCYK8
 DWeMVNM6CiQjKJ1kmEucAefN8GiLF7K1WLmVOMsNOBCTYGbyP8iTJHcu3j1zBTCiSDzq
 IZszZpckFe9rXOFrjeLDjTiLIcvQW6ZENvQY9iJyGFDmlaxsarL8jwA0ogHw1p39qDuc
 8fjxdzAUzhFAM8evXBr7XjdfYXlj+chBp+f7pSWr229lYAYuH7nStZNfz8cGCh5O2l+O
 9lj4Q1uHaPDEBmEky4zNC/wa2y91b4dqxP5s0raz1VXZy/17JATVs3NEZlDj/EkgGI85
 P+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719950548; x=1720555348;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Pg/7/y0EFr0qym6npwJSRe3aSLtAiBDqbT1OWBwL6c=;
 b=CxtaHXPQZoHSjof84FqEIfVxDi17H1DABtGMD0plXjFB1jUN+fo7cbzPJedqkcLnO9
 QhzIsxaOsahXO6n7lLAWCKYHRMFXM4+eKgVdv9lWXByYmGNr62yw2Xrf15+7rJZHoJG7
 TA8YQ98BqL3I2mbTKDNCE9SwCFD9lv3EfHE82042Wbeoa6VjrDOtMSgC8rEIz7JRIF7e
 GsYmu2Bw3oUsjFWmgn8CLKnFHTmsHzk1Ta5k0Q8fHQgI9VaDkR8QzA/viv1PS0FQuPvE
 7sbvQaepppWpN/I0h2lftzxjiMOdgFBdHqPgsL834VUqrcBNoRNmagf1pCQxP0xAD3Tg
 qmCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn6nNboCNXn84jcHn8sl90YvhjDPPf63KknNcIz+NJ3hG3YQFotEDRTa6gjzkNv0BaXOqM7EK0lzr5D+9VbnE+iTjRTK9Oe0TxGOJFAkgJ
X-Gm-Message-State: AOJu0YzhU2kLQ2L97cwJUJzr4lu6q1sW1y1Dft6D82dTCnjjNELDaD+h
 2Y4fbRj/31RoROHiehNpCuJkDJcjprKbxnWa2QC5DBilvXikLMy7vRGEmbfZ0mBFcPEfw0QCmhI
 Ct4PMcyl+B5rLm7T0oxwTRA66rEA=
X-Google-Smtp-Source: AGHT+IErxlYpYjfRcRB5QMt7MSaZ5l3hizvYH11QkFqGX9oRaokGttb3uuyPnhbm4/zJYyWoC3TDeO2AFSWSTp5Tgyc=
X-Received: by 2002:a05:6402:51c6:b0:58b:a92f:2917 with SMTP id
 4fb4d7f45d1cf-58ba92f2c06mr1496921a12.36.1719950548285; Tue, 02 Jul 2024
 13:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240630153652.318882-1-wahrenst@gmx.net>
 <20240630153652.318882-8-wahrenst@gmx.net>
In-Reply-To: <20240630153652.318882-8-wahrenst@gmx.net>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Tue, 2 Jul 2024 21:02:16 +0100
Message-ID: <CALeDE9OpdUntjW61i=Ge2b9uOyPKWRmeP+2ybxoNA2CR4DHWXg@mail.gmail.com>
Subject: Re: [PATCH 07/11] drm/vc4: hdmi: Disable connector status polling
 during suspend
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Jiri Slaby <jirislaby@kernel.org>, 
 Minas Harutyunyan <hminas@synopsys.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>, 
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 linux-pm@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-list@raspberrypi.com
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

Hi Stefan,

> Suspend of VC4 HDMI will likely triggers a warning from
> vc4_hdmi_connector_detect_ctx() during poll of connector status.
> The power management will prevent the resume and keep the relevant
> power domain disabled.
>
> Since there is no reason to poll the connector status during
> suspend, the polling should be disabled during this.

What about HDMI-CEC? I don't know well enough how CEC integrates at
this level but CEC can wake up the device over HDMI from a TV display
for example so if this affects that, while it's maybe not required for
first pass, I know the rpi is used in a lot of media use cases so the
ability to wake up via CEC would certainly be welcomed.

> It not possible to use drm_mode_config_helper_suspend() here,
> because the callbacks might be called during bind phase and not all
> components are fully initialized.
>
> Link: https://lore.kernel.org/dri-devel/7003512d-7303-4f41-b0d6-a8af5bf8e497@gmx.net/
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index b3a42b709718..e80495cea6ac 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -3106,6 +3106,13 @@ static int vc5_hdmi_init_resources(struct drm_device *drm,
>  static int vc4_hdmi_runtime_suspend(struct device *dev)
>  {
>         struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
> +       struct drm_device *drm = vc4_hdmi->connector.dev;
> +
> +       /*
> +        * Don't disable polling if it was never initialized
> +        */
> +       if (drm && drm->mode_config.poll_enabled)
> +               drm_kms_helper_poll_disable(drm);
>
>         clk_disable_unprepare(vc4_hdmi->hsm_clock);
>
> @@ -3115,6 +3122,7 @@ static int vc4_hdmi_runtime_suspend(struct device *dev)
>  static int vc4_hdmi_runtime_resume(struct device *dev)
>  {
>         struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
> +       struct drm_device *drm = vc4_hdmi->connector.dev;
>         unsigned long __maybe_unused flags;
>         u32 __maybe_unused value;
>         unsigned long rate;
> @@ -3159,6 +3167,9 @@ static int vc4_hdmi_runtime_resume(struct device *dev)
>         }
>  #endif
>
> +       if (drm && drm->mode_config.poll_enabled)
> +               drm_kms_helper_poll_enable(drm);
> +
>         return 0;
>
>  err_disable_clk:
> --
> 2.34.1
>
