Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F07905839
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 18:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A490310E8B4;
	Wed, 12 Jun 2024 16:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FeAMissc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4863510E8B4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 16:11:30 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-630640c1e14so376497b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 09:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718208689; x=1718813489; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gOoigUiWi2W7n5woJq40vy1DYwRrIONrusBeetpSozw=;
 b=FeAMisscNqPpqOZU0k8xw+LAamrZx78q++kcbQcGNLIZH4VCG52dE1g3gaceOWS1Ls
 QpXD3BPSK+j14QHIjswBHFjM1EQC26On2AoDO+J0kNMxBnD12f8OYODpx2GezgjqcdJ3
 Nn59pPIyDFtqk0rHfFkQ5kcF1FqMuHkmBgmA6JlVO5bbjj8uyj1D01rkXJgD31c/qYGw
 yPfwrEdQ4MMFoBHn6FyBwavxDAXx1yWR0Ioe8SGMrooN1C970tJI4uzEpkwL4fZCEQ16
 HVJtKWwN5wbWTDnUbyFNjrcWO/h94/eCo3Z5LL+xxZm2jArofyFUusw6XxshkxPKSzZb
 vNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718208689; x=1718813489;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gOoigUiWi2W7n5woJq40vy1DYwRrIONrusBeetpSozw=;
 b=d+upbXuMwBIkB4uPn0y3akU4pKi5Ac2OCFnJB3i8aIf/vnjKUPgwI21t7HVnmXG1fS
 bsBte6r+mg3c1U3pJlZRzVu8C2oO3h37sXqvKlLoLkqg3ZaNsn4HsBK4UZIMrHii+9nk
 zEO6XA37LacBFOoG7OdbPN5BwSK7FqoM2jaJ9wsAjZp1ymQBn6itejl7LeviCMSUoUG0
 dj5HyASPYr/FtMSzkFBMnyPnIM0D3caTOL8fmfFxEVZ7Qfo+nhn8Fwu7Hjk+fCvrcUmR
 IZ4/jh8lJCYKmCNLoRt3rAkzjET01iX3o7dn2ocb2zb9rHFAQN3lhMvatOzmGBKzQpcG
 bJXA==
X-Gm-Message-State: AOJu0Yyz8kzYdK3fOQWZHHkdAaRO0IpsVxxSnWnswCRt4NsELfgIQlBd
 CzMJ2pGzbCzjTXXzbS2h06/s46CN0qTbgvtXskBTuR49Pfaa9OhcckCu2xUyyerdxrmmeOBuGOd
 eWpr+PaNgHQ2SMBOuKeMr5E8hPZtmdF4bRSXZzg==
X-Google-Smtp-Source: AGHT+IHlOBiCOwsEdTeyBW0302LzAiulyg+iO39vZJw6Ljx1eLRfWsX56kbNstM7ATlVLCvYBDU4mOihYmDFhztz4Jw=
X-Received: by 2002:a81:a086:0:b0:615:3858:d154 with SMTP id
 00721157ae682-62fbc3da51bmr21511487b3.30.1718208688901; Wed, 12 Jun 2024
 09:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240612143553.915966-1-mripard@kernel.org>
In-Reply-To: <20240612143553.915966-1-mripard@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 12 Jun 2024 19:11:17 +0300
Message-ID: <CAA8EJprAZhHJ7RMQLa6sP0jspFxwSRghS+Ryemsk=rSUEZugqg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/todo: Create a TODO item for additional HDMI work
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Javier Martinez Canillas <javierm@redhat.com>
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

On Wed, 12 Jun 2024 at 17:35, Maxime Ripard <mripard@kernel.org> wrote:
>
> We recently added some infrastructure to deal with HDMI but we're still
> lacking a couple of things. Add a TODO entry with the remaining items.
>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  Documentation/gpu/todo.rst | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 2ea6ffc9b22b..52fd8672fb6d 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -633,10 +633,39 @@ long as that supports DMA. Otherwise importing can still needlessly fail.
>
>  Contact: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter
>
>  Level: Advanced
>
> +Improve HDMI Infrastructure
> +---------------------------
> +
> +We have a bunch of helpers to handle HDMI and reduce the boilerplate in
> +drivers. Support so far includes HDMI 1.4 support, but we need to extend
> +it with:
> +
> +  - CEC handling support. CEC requires a bit of integration into every
> +    HDMI driver to set the device physical address according to the EDID
> +    in `.get_modes`, and to clear/reset it in the hotplug detection
> +    path. We should create the ``drm_atomic_helper_connector_hdmi_get_modes()``
> +    and ``drm_atomic_helper_connector_hdmi_handle_hotplug()`` helpers to handle
> +    this properly, and convert drivers to use them.
> +
> +  - In order to support HDMI 2.0 properly, the scrambler parameters need
> +    to be moved into the state. This includes figuring out in
> +    drm_atomic_helper_connector_hdmi_check() if the scrambler and TMDS ratio
> +    need to be changed, and make the
> +    ``drm_atomic_helper_connector_hdmi_handle_hotplug()`` helper reset the
> +    scrambler status when the device is plugged and unplugged.
> +
> +  - We need to support YUV420 too.

- HDMI audio improvements:
  - Implement the get_eld() and possibly hook_plugged_cb() functions
for hdmi_codec_ops in a generic way. Maybe implementing generic HDMI
hdmi_codec_ops and then providing device-specific hooks to prepare /
shutdown / mute stream.
  - provide helpers to determine ACR / N / CTS params

A different, but closely related topic is HDCP support in a generic
way. https://lore.kernel.org/dri-devel/20230419154321.1993419-1-markyacoub@google.com/

> +
> +The `vc4` driver is a good example for all this.
> +
> +Contact: Maxime Ripard <mripard@kernel.org>
> +
> +Level: Intermediate
> +
>
>  Better Testing
>  ==============
>
>  Add unit tests using the Kernel Unit Testing (KUnit) framework
> --
> 2.45.2
>


-- 
With best wishes
Dmitry
