Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FD18769B3
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 18:21:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39747113930;
	Fri,  8 Mar 2024 17:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O71TsUHG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3E7113840;
 Fri,  8 Mar 2024 17:21:15 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-5d4a1e66750so1578236a12.0; 
 Fri, 08 Mar 2024 09:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709918475; x=1710523275; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k0qxuntNkcbVC7Fn83HWGHLvc9TEYSSVaA9/QNYBA4g=;
 b=O71TsUHGNwcsttomMw/17aMWOZ/t0qCvOW6lchzH1tclnKJ5rNW3L96F9oJSrpGBzl
 765mbD/LumLm4Wtl0MsBf/LUkE/fjJg+2aJmJto9vgG30a4o2M80R6zwYe8+P9efdXiV
 eLYFOpfpKSZX5pztnjmrWtPp55YIpyMc+8RpZwKL8i0cj8WNELieHc1EwGAPxGThbSxJ
 dAHfke8vcsPrja8nV68vctKGM/VoShzLJMHb2hqrI+c9JPS+Qy/n41xBLFY3Sn+3dBHj
 y7pLt9iQcrMHOmkXxjz7fAP3ee6Zt3CPtAtx4EkL/npVywucMr1My/gVOgvfREkczAZV
 mNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709918475; x=1710523275;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k0qxuntNkcbVC7Fn83HWGHLvc9TEYSSVaA9/QNYBA4g=;
 b=V1NPZ97d87+ySKzLVDe0qdxDjxhiozIinI4XCM1zDb5/5E0w6VNe71AVHpU745taDB
 SktfhhnAIWTPDQzZxuJtHvToIBayvQYpN45I2uOWl6fEJVD30ifM623dU+6s+igf9vQs
 IR8XFGj+3WhFXIyvoUV2ULLkbGu8GGzcgjqluPaCcu2GphX8GkujYR+PkTiT3fBwRtz+
 uh7cdh3Snw/5C+9qY3X1Fg2uPFJJ1Kk2Bb2V2Iugr7RVEjaElTkvuVNR4SkuJiwPTRvr
 8arPGY1RcHuKwxDyGr+IuHm54KP4GxHnMMfq/URCyE9iWpD8mqFjnia65DDzkdqM1GhY
 GgcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk6lc7UuXCw5VlDSv/bfsH8fhZU54+tD2465cF7YEX/MlkAFGUe8EHfVVhUdgxLKrZpMBDbIYcFq/PW6lLllWSB3CXB3kRidvEw+9AgVpWvhSIZA82xCVW2KiKLkF5kcYMQBe9Sa2Ee6lAUW2KaKw=
X-Gm-Message-State: AOJu0Yzm75AXjiSp9GQO80KvpUQak8Obs6+HObc2hY1f6/leCuOehqnY
 /fZAajXX1KX/aVzPJCIa8GUX0KasN3r3ehfXSTTjPz+lbzaMeE7c2t+CwZZcLBhh5U8E8dO5oo2
 omTq9SsL9fUrh622RLwnhrYKiS0E=
X-Google-Smtp-Source: AGHT+IGk7IOKeQWk9E5lsNO42nowEDoUOzycxvHTDvDoXo5PL+nZWTD0YsHKdoud2vwyWSFXnncyk6mPQvnmI/1KDnM=
X-Received: by 2002:a17:90a:fe8a:b0:29b:a4d9:b125 with SMTP id
 co10-20020a17090afe8a00b0029ba4d9b125mr640748pjb.30.1709918474773; Fri, 08
 Mar 2024 09:21:14 -0800 (PST)
MIME-Version: 1.0
References: <cover.1709898638.git.jani.nikula@intel.com>
 <19bc9672c8ae4f7aee235665a4d2360e8790193d.1709898638.git.jani.nikula@intel.com>
In-Reply-To: <19bc9672c8ae4f7aee235665a4d2360e8790193d.1709898638.git.jani.nikula@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Mar 2024 12:21:03 -0500
Message-ID: <CADnq5_N6GkDJu3Uq_cBQrDHRR7Fg8+pn3-acJxkYoKr14bP6Pg@mail.gmail.com>
Subject: Re: [PATCH v2 03/16] drm/encoder: improve drm_encoder_slave.h
 kernel-doc
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Masahiro Yamada <masahiroy@kernel.org>, lucas.demarchi@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Mar 8, 2024 at 7:08=E2=80=AFAM Jani Nikula <jani.nikula@intel.com> =
wrote:
>
> Document structs drm_encoder_slave_funcs, drm_encoder_slave, and
> drm_i2c_encoder_driver.
>
> v2: Actually document the structs instead of just silencing kernel-doc
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  include/drm/drm_encoder_slave.h | 91 +++++++++++++++++++++++++++------
>  1 file changed, 74 insertions(+), 17 deletions(-)
>
> diff --git a/include/drm/drm_encoder_slave.h b/include/drm/drm_encoder_sl=
ave.h
> index 7214101fd731..49172166a164 100644
> --- a/include/drm/drm_encoder_slave.h
> +++ b/include/drm/drm_encoder_slave.h
> @@ -34,12 +34,6 @@
>
>  /**
>   * struct drm_encoder_slave_funcs - Entry points exposed by a slave enco=
der driver
> - * @set_config:        Initialize any encoder-specific modesetting param=
eters.
> - *             The meaning of the @params parameter is implementation
> - *             dependent. It will usually be a structure with DVO port
> - *             data format settings or timings. It's not required for
> - *             the new parameters to take effect until the next mode
> - *             is set.
>   *
>   * Most of its members are analogous to the function pointers in
>   * &drm_encoder_helper_funcs and they can optionally be used to
> @@ -48,41 +42,85 @@
>   * if the encoder is the currently selected one for the connector.
>   */
>  struct drm_encoder_slave_funcs {
> +       /**
> +        * @set_config: Initialize any encoder-specific modesetting param=
eters.
> +        * The meaning of the @params parameter is implementation depende=
nt. It
> +        * will usually be a structure with DVO port data format settings=
 or
> +        * timings. It's not required for the new parameters to take effe=
ct
> +        * until the next mode is set.
> +        */
>         void (*set_config)(struct drm_encoder *encoder,
>                            void *params);
>
> +       /**
> +        * @destroy: Analogous to &drm_encoder_funcs @destroy callback.
> +        */
>         void (*destroy)(struct drm_encoder *encoder);
> +
> +       /**
> +        * @dpms: Analogous to &drm_encoder_helper_funcs @dpms callback. =
Wrapped
> +        * by drm_i2c_encoder_dpms().
> +        */
>         void (*dpms)(struct drm_encoder *encoder, int mode);
> +
> +       /**
> +        * @save: Save state. Wrapped by drm_i2c_encoder_save().
> +        */
>         void (*save)(struct drm_encoder *encoder);
> +
> +       /**
> +        * @restore: Restore state. Wrapped by drm_i2c_encoder_restore().
> +        */
>         void (*restore)(struct drm_encoder *encoder);
> +
> +       /**
> +        * @mode_fixup: Analogous to &drm_encoder_helper_funcs @mode_fixu=
p
> +        * callback. Wrapped by drm_i2c_encoder_mode_fixup().
> +        */
>         bool (*mode_fixup)(struct drm_encoder *encoder,
>                            const struct drm_display_mode *mode,
>                            struct drm_display_mode *adjusted_mode);
> +
> +       /**
> +        * @mode_valid: Analogous to &drm_encoder_helper_funcs @mode_vali=
d.
> +        */
>         int (*mode_valid)(struct drm_encoder *encoder,
>                           struct drm_display_mode *mode);
> +       /**
> +        * @mode_set: Analogous to &drm_encoder_helper_funcs @mode_set
> +        * callback. Wrapped by drm_i2c_encoder_mode_set().
> +        */
>         void (*mode_set)(struct drm_encoder *encoder,
>                          struct drm_display_mode *mode,
>                          struct drm_display_mode *adjusted_mode);
>
> +       /**
> +        * @detect: Analogous to &drm_encoder_helper_funcs @detect
> +        * callback. Wrapped by drm_i2c_encoder_detect().
> +        */
>         enum drm_connector_status (*detect)(struct drm_encoder *encoder,
>                                             struct drm_connector *connect=
or);
> +       /**
> +        * @get_modes: Get modes.
> +        */
>         int (*get_modes)(struct drm_encoder *encoder,
>                          struct drm_connector *connector);
> +       /**
> +        * @create_resources: Create resources.
> +        */
>         int (*create_resources)(struct drm_encoder *encoder,
>                                  struct drm_connector *connector);
> +       /**
> +        * @set_property: Set property.
> +        */
>         int (*set_property)(struct drm_encoder *encoder,
>                             struct drm_connector *connector,
>                             struct drm_property *property,
>                             uint64_t val);
> -
>  };
>
>  /**
>   * struct drm_encoder_slave - Slave encoder struct
> - * @base: DRM encoder object.
> - * @slave_funcs: Slave encoder callbacks.
> - * @slave_priv: Slave encoder private data.
> - * @bus_priv: Bus specific data.
>   *
>   * A &drm_encoder_slave has two sets of callbacks, @slave_funcs and the
>   * ones in @base. The former are never actually called by the common
> @@ -95,10 +133,24 @@ struct drm_encoder_slave_funcs {
>   * this.
>   */
>  struct drm_encoder_slave {
> +       /**
> +        * @base: DRM encoder object.
> +        */
>         struct drm_encoder base;
>
> +       /**
> +        * @slave_funcs: Slave encoder callbacks.
> +        */
>         const struct drm_encoder_slave_funcs *slave_funcs;
> +
> +       /**
> +        * @slave_priv: Slave encoder private data.
> +        */
>         void *slave_priv;
> +
> +       /**
> +        * @bus_priv: Bus specific data.
> +        */
>         void *bus_priv;
>  };
>  #define to_encoder_slave(x) container_of((x), struct drm_encoder_slave, =
base)
> @@ -112,16 +164,20 @@ int drm_i2c_encoder_init(struct drm_device *dev,
>  /**
>   * struct drm_i2c_encoder_driver
>   *
> - * Describes a device driver for an encoder connected to the GPU
> - * through an I2C bus. In addition to the entry points in @i2c_driver
> - * an @encoder_init function should be provided. It will be called to
> - * give the driver an opportunity to allocate any per-encoder data
> - * structures and to initialize the @slave_funcs and (optionally)
> - * @slave_priv members of @encoder.
> + * Describes a device driver for an encoder connected to the GPU through=
 an I2C
> + * bus.
>   */
>  struct drm_i2c_encoder_driver {
> +       /**
> +        * @i2c_driver: I2C device driver description.
> +        */
>         struct i2c_driver i2c_driver;
>
> +       /**
> +        * @encoder_init: Callback to allocate any per-encoder data struc=
tures
> +        * and to initialize the @slave_funcs and (optionally) @slave_pri=
v
> +        * members of @encoder.
> +        */
>         int (*encoder_init)(struct i2c_client *client,
>                             struct drm_device *dev,
>                             struct drm_encoder_slave *encoder);
> @@ -133,6 +189,7 @@ struct drm_i2c_encoder_driver {
>
>  /**
>   * drm_i2c_encoder_get_client - Get the I2C client corresponding to an e=
ncoder
> + * @encoder: The encoder
>   */
>  static inline struct i2c_client *drm_i2c_encoder_get_client(struct drm_e=
ncoder *encoder)
>  {
> --
> 2.39.2
>
