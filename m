Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD07862AE7
	for <lists+dri-devel@lfdr.de>; Sun, 25 Feb 2024 16:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7E710E16A;
	Sun, 25 Feb 2024 15:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rsvZt4MQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC0610E166
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 15:03:03 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dc6d24737d7so1878783276.0
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 07:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708873383; x=1709478183; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=faFOjMhg3whR1q3Zl3nbnWECNda17A0JdqR1pG6C/DY=;
 b=rsvZt4MQJOvZ6WpYnYdxU742f6sFIIs+qsgfRh+H1aoOpeBKVpR/HZbn8U7aYGZbhD
 wmqKpb6CjvXlkMhIifnVdkjLkywbsDFgYWZ4NmzZP4qs7BBMu3PA2w7Niw+HKKzlhVaK
 edzAl4iVSsl1g4upkBsorLI4ovUdayZcZ7LhKVgsU5NyZmddZk8C58p5plM098eT6Vh6
 q2wYZzrfKZDgeI/gk5sLDq3th6oWt3ojcXJPIxlmZt4toT0HJ5NrJATHChcV7VPVZ5JN
 Qd8AsxrTp7UQat5ThEwQppOv81tDRq5/Brfgs3qTv2yDGyrd79/BZwEcQYFrjbL4WJDs
 eoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708873383; x=1709478183;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=faFOjMhg3whR1q3Zl3nbnWECNda17A0JdqR1pG6C/DY=;
 b=u2Rk7hM5SDtrQJFSR2uHcox8e8Bbex8K0EyPYFOJ4ZbRC/fTmVx43b0H7ARyrX/2qj
 IPFCKJ+WrexUHRN71KgWWiIyTu2Afntlv6I+iUaAQSpSWPgPFEMllaTJTx4zJgo+rAL/
 cXdsn40ppSl7AEwtJ9OtXxGSylJcJ46AgL2WMe+aMVLD78d+ocqntHH7NlWe8rIkxLMZ
 Axeudo0DU4NWJX3haibwIwSPcvvTRpZaBXmQkFnlVKfCgSmzalDUle6ltacsGKOdXVxK
 nN7jNp1UzAanMS278skWi9W+JPHDZ7gejPLbxz7AThzbh1p4XtW6KVx2xw5ERA4YvMb/
 ppnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyUtmEHZf+ALJ3fFva75+iVzUL/9Ds/qxnhqfGwkXO6cIUl3Pa53VjAlDkOtfNadcdpvxYnbaAUB1PceUbv3oauRQBrJ6zJw8IXmeDYLs3
X-Gm-Message-State: AOJu0YxXkFXPHZR7eNUWA4XcjbiSlQ4XDJy2lwkLMsun8sFjdh+KAqGh
 3FfDkP8EvevjQVyUQ92WuHlu+nwuuNHRBQTdcuEdnHq0dtT4KCX2fHVOsqBdlvnD9UkaP/mYCBP
 7/GD7l3cbLy6VH8bFBQDd49hpJfYBEUHYnWp7rQ==
X-Google-Smtp-Source: AGHT+IGF6tSTVSmx/nue6196LShIEPuDlwumqw4nFRiW5mz2TOWS7vwzh2wN/1H/gF/U+2v0pnaC+pj9FaHasuy0xB0=
X-Received: by 2002:a25:2e07:0:b0:dcd:6a02:c111 with SMTP id
 u7-20020a252e07000000b00dcd6a02c111mr2567700ybu.11.1708873382564; Sun, 25 Feb
 2024 07:03:02 -0800 (PST)
MIME-Version: 1.0
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-25-8f4af575fce2@kernel.org>
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-25-8f4af575fce2@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 25 Feb 2024 17:02:51 +0200
Message-ID: <CAA8EJpri_whY8YfX2BsBjMN_4JvFsU-ogfr1W-KUKrasRoH-WQ@mail.gmail.com>
Subject: Re: [PATCH v7 25/36] drm/connector: hdmi: Add Infoframes generation
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
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

On Thu, 22 Feb 2024 at 20:16, Maxime Ripard <mripard@kernel.org> wrote:
>
> Infoframes in KMS is usually handled by a bunch of low-level helpers
> that require quite some boilerplate for drivers. This leads to
> discrepancies with how drivers generate them, and which are actually
> sent.
>
> Now that we have everything needed to generate them in the HDMI
> connector state, we can generate them in our common logic so that
> drivers can simply reuse what we precomputed.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/Kconfig                            |   1 +
>  drivers/gpu/drm/drm_atomic_state_helper.c          | 327 +++++++++++++++++++++
>  drivers/gpu/drm/drm_connector.c                    |  16 +
>  .../gpu/drm/tests/drm_atomic_state_helper_test.c   |   1 +
>  drivers/gpu/drm/tests/drm_connector_test.c         |  12 +
>  include/drm/drm_atomic_state_helper.h              |   8 +
>  include/drm/drm_connector.h                        | 133 +++++++++
>  7 files changed, 498 insertions(+)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 872edb47bb53..ad9c467e20ce 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -99,6 +99,7 @@ config DRM_KUNIT_TEST
>  config DRM_KMS_HELPER
>         tristate
>         depends on DRM
> +       select DRM_DISPLAY_HDMI_HELPER
>         help
>           CRTC helpers for KMS drivers.
>
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index e66272c0d006..46d9fd2ea8fa 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -38,6 +38,8 @@
>  #include <drm/drm_vblank.h>
>  #include <drm/drm_writeback.h>
>
> +#include <drm/display/drm_hdmi_helper.h>
> +
>  #include <linux/slab.h>
>  #include <linux/dma-fence.h>
>
> @@ -914,6 +916,142 @@ hdmi_compute_config(const struct drm_connector *connector,
>         return -EINVAL;
>  }
>
> +static int hdmi_generate_avi_infoframe(const struct drm_connector *connector,
> +                                      struct drm_connector_state *state)
> +{
> +       const struct drm_display_mode *mode =
> +               connector_state_get_mode(state);
> +       struct drm_connector_hdmi_infoframe *infoframe =
> +               &state->hdmi.infoframes.avi;
> +       struct hdmi_avi_infoframe *frame =
> +               &infoframe->data.avi;
> +       bool is_full_range = state->hdmi.is_full_range;
> +       enum hdmi_quantization_range rgb_quant_range =
> +               is_full_range ? HDMI_QUANTIZATION_RANGE_FULL : HDMI_QUANTIZATION_RANGE_LIMITED;
> +       int ret;
> +
> +       ret = drm_hdmi_avi_infoframe_from_display_mode(frame, connector, mode);
> +       if (ret)
> +               return ret;
> +
> +       frame->colorspace = state->hdmi.output_format;
> +
> +       drm_hdmi_avi_infoframe_quant_range(frame, connector, mode, rgb_quant_range);
> +       drm_hdmi_avi_infoframe_colorimetry(frame, state);
> +       drm_hdmi_avi_infoframe_bars(frame, state);
> +
> +       infoframe->set = true;
> +
> +       return 0;
> +}
> +
> +static int hdmi_generate_spd_infoframe(const struct drm_connector *connector,
> +                                      struct drm_connector_state *state)
> +{
> +       struct drm_connector_hdmi_infoframe *infoframe =
> +               &state->hdmi.infoframes.spd;
> +       struct hdmi_spd_infoframe *frame =
> +               &infoframe->data.spd;
> +       int ret;
> +
> +       ret = hdmi_spd_infoframe_init(frame,
> +                                     connector->hdmi.vendor,
> +                                     connector->hdmi.product);
> +       if (ret)
> +               return ret;
> +
> +       frame->sdi = HDMI_SPD_SDI_PC;
> +
> +       infoframe->set = true;
> +
> +       return 0;
> +}
> +
> +static int hdmi_generate_hdr_infoframe(const struct drm_connector *connector,
> +                                      struct drm_connector_state *state)
> +{
> +       struct drm_connector_hdmi_infoframe *infoframe =
> +               &state->hdmi.infoframes.hdr_drm;
> +       struct hdmi_drm_infoframe *frame =
> +               &infoframe->data.drm;
> +       int ret;
> +
> +       if (connector->max_bpc < 10)
> +               return 0;
> +
> +       if (!state->hdr_output_metadata)
> +               return 0;
> +
> +       ret = drm_hdmi_infoframe_set_hdr_metadata(frame, state);
> +       if (ret)
> +               return ret;
> +
> +       infoframe->set = true;
> +
> +       return 0;
> +}
> +
> +static int hdmi_generate_hdmi_vendor_infoframe(const struct drm_connector *connector,
> +                                              struct drm_connector_state *state)
> +{
> +       const struct drm_display_mode *mode =
> +               connector_state_get_mode(state);
> +       struct drm_connector_hdmi_infoframe *infoframe =
> +               &state->hdmi.infoframes.hdmi;
> +       struct hdmi_vendor_infoframe *frame =
> +               &infoframe->data.vendor.hdmi;
> +       int ret;
> +
> +       ret = drm_hdmi_vendor_infoframe_from_display_mode(frame, connector, mode);
> +       if (ret) {
> +               if (ret == -EINVAL)
> +                       return 0;
> +
> +               return ret;
> +       }
> +
> +       infoframe->set = true;
> +
> +       return 0;
> +}
> +
> +static int
> +hdmi_generate_infoframes(const struct drm_connector *connector,
> +                        struct drm_connector_state *state)
> +{
> +       const struct drm_display_info *info = &connector->display_info;
> +       int ret;
> +
> +       if (!info->is_hdmi)
> +               return 0;
> +
> +       if (!info->has_hdmi_infoframe)
> +               return 0;
> +
> +       ret = hdmi_generate_avi_infoframe(connector, state);
> +       if (ret)
> +               return ret;
> +
> +       ret = hdmi_generate_spd_infoframe(connector, state);
> +       if (ret)
> +               return ret;
> +
> +       /*
> +        * Audio Infoframes will be generated by ALSA, and updated by
> +        * drm_atomic_helper_connector_hdmi_update_audio_infoframe().
> +        */
> +
> +       ret = hdmi_generate_hdr_infoframe(connector, state);
> +       if (ret)
> +               return ret;
> +
> +       ret = hdmi_generate_hdmi_vendor_infoframe(connector, state);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
>  /**
>   * drm_atomic_helper_connector_hdmi_check() - Helper to check HDMI connector atomic state
>   * @connector: DRM Connector
> @@ -943,6 +1081,10 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
>         if (ret)
>                 return ret;
>
> +       ret = hdmi_generate_infoframes(connector, new_state);
> +       if (ret)
> +               return ret;
> +
>         if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb ||
>             old_state->hdmi.output_bpc != new_state->hdmi.output_bpc ||
>             old_state->hdmi.output_format != new_state->hdmi.output_format) {
> @@ -960,6 +1102,191 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
>
> +#define HDMI_MAX_INFOFRAME_SIZE                29
> +
> +static int clear_device_infoframe(struct drm_connector *connector,
> +                                 enum hdmi_infoframe_type type)
> +{
> +       const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
> +
> +       if (!funcs || !funcs->clear_infoframe)
> +               return 0;
> +
> +       return funcs->clear_infoframe(connector, type);
> +}
> +
> +static int clear_infoframe(struct drm_connector *connector,
> +                          struct drm_connector_hdmi_infoframe *conn_frame,
> +                          struct drm_connector_hdmi_infoframe *old_frame)
> +{
> +       int ret;
> +
> +       ret = clear_device_infoframe(connector, old_frame->data.any.type);
> +       if (ret)
> +               return ret;
> +
> +       memset(old_frame, 0, sizeof(*old_frame));
> +
> +       return 0;
> +}
> +
> +static int write_device_infoframe(struct drm_connector *connector,
> +                                 union hdmi_infoframe *frame)
> +{
> +       const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
> +       u8 buffer[HDMI_MAX_INFOFRAME_SIZE];
> +       int len;
> +
> +       if (!funcs || !funcs->write_infoframe)
> +               return -ENOSYS;
> +
> +       len = hdmi_infoframe_pack(frame, buffer, sizeof(buffer));
> +       if (len < 0)
> +               return len;
> +
> +       return funcs->write_infoframe(connector, frame->any.type, buffer, len);
> +}
> +
> +static int write_infoframe(struct drm_connector *connector,
> +                          struct drm_connector_hdmi_infoframe *conn_frame,
> +                          struct drm_connector_hdmi_infoframe *new_frame)
> +{
> +       int ret;
> +
> +       ret = write_device_infoframe(connector, &new_frame->data);
> +       if (ret)
> +               return ret;
> +
> +       if (conn_frame)
> +               memcpy(conn_frame, new_frame, sizeof(*conn_frame));
> +
> +       return 0;
> +}
> +
> +static int write_or_clear_infoframe(struct drm_connector *connector,
> +                                   struct drm_connector_hdmi_infoframe *conn_frame,
> +                                   struct drm_connector_hdmi_infoframe *old_frame,
> +                                   struct drm_connector_hdmi_infoframe *new_frame)
> +{
> +       if (new_frame->set)
> +               return write_infoframe(connector, conn_frame, new_frame);
> +
> +       if (old_frame->set && !new_frame->set)
> +               return clear_infoframe(connector, conn_frame, old_frame);
> +
> +       return 0;
> +}
> +
> +#define UPDATE_INFOFRAME(c, os, ns, i)                         \
> +       write_or_clear_infoframe(c,                             \
> +                                &(c)->hdmi.infoframes.i,       \
> +                                &(os)->hdmi.infoframes.i,      \
> +                                &(ns)->hdmi.infoframes.i)
> +
> +/**
> + * drm_atomic_helper_connector_hdmi_update_infoframes - Update the Infoframes
> + * @connector: A pointer to the HDMI connector
> + * @state: The HDMI connector state to generate the infoframe from
> + *
> + * This function is meant for HDMI connector drivers to write their
> + * infoframes. It will typically be used in a
> + * @drm_connector_helper_funcs.atomic_enable implementation.
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
> +                                                      struct drm_atomic_state *state)
> +{
> +       struct drm_connector_state *old_state =
> +               drm_atomic_get_old_connector_state(state, connector);
> +       struct drm_connector_state *new_state =
> +               drm_atomic_get_new_connector_state(state, connector);
> +       struct drm_display_info *info = &connector->display_info;
> +       int ret;
> +
> +       if (!info->is_hdmi)
> +               return 0;
> +
> +       if (!info->has_hdmi_infoframe)
> +               return 0;
> +
> +       mutex_lock(&connector->hdmi.infoframes.lock);
> +
> +       ret = UPDATE_INFOFRAME(connector, old_state, new_state, avi);
> +       if (ret)
> +               goto out;
> +
> +       if (connector->hdmi.infoframes.audio.set) {
> +               ret = write_infoframe(connector,
> +                                     NULL,
> +                                     &connector->hdmi.infoframes.audio);
> +               if (ret)
> +                       goto out;
> +       }
> +
> +       ret = UPDATE_INFOFRAME(connector, old_state, new_state, hdr_drm);
> +       if (ret)
> +               goto out;
> +
> +       ret = UPDATE_INFOFRAME(connector, old_state, new_state, spd);
> +       if (ret)
> +               goto out;
> +
> +       ret = UPDATE_INFOFRAME(connector, old_state, new_state, hdmi);
> +       if (ret)
> +               goto out;
> +
> +out:
> +       mutex_unlock(&connector->hdmi.infoframes.lock);
> +       return ret;
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update_infoframes);
> +
> +#undef UPDATE_INFOFRAME
> +#undef UPDATE_INFOFRAME_TOGGLE
> +
> +/**
> + * drm_atomic_helper_connector_hdmi_update_audio_infoframe - Update the Audio Infoframe
> + * @connector: A pointer to the HDMI connector
> + * @frame: A pointer to the audio infoframe to write
> + *
> + * This function is meant for HDMI connector drivers to update their
> + * audio infoframe. It will typically be used in one of the ALSA hooks
> + * (most likely prepare).
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int
> +drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *connector,
> +                                                       struct hdmi_audio_infoframe *frame)
> +{
> +       struct drm_connector_hdmi_infoframe infoframe = {};
> +       struct drm_display_info *info = &connector->display_info;
> +       int ret;
> +
> +       if (!info->is_hdmi)
> +               return 0;
> +
> +       if (!info->has_hdmi_infoframe)
> +               return 0;
> +
> +       memcpy(&infoframe.data, frame, sizeof(infoframe.data));
> +       infoframe.set = true;
> +
> +       mutex_lock(&connector->hdmi.infoframes.lock);
> +
> +       ret = write_infoframe(connector,
> +                             &connector->hdmi.infoframes.audio,
> +                             &infoframe);
> +
> +       mutex_unlock(&connector->hdmi.infoframes.lock);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update_audio_infoframe);
> +
>  /**
>   * __drm_atomic_helper_connector_duplicate_state - copy atomic connector state
>   * @connector: connector object
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 6ffe59d01698..6cfc301096ef 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -456,6 +456,8 @@ EXPORT_SYMBOL(drmm_connector_init);
>   * drmm_connector_hdmi_init - Init a preallocated HDMI connector
>   * @dev: DRM device
>   * @connector: A pointer to the HDMI connector to init
> + * @vendor: HDMI Controller Vendor name
> + * @product: HDMI Controller Product name
>   * @funcs: callbacks for this connector
>   * @hdmi_funcs: HDMI-related callbacks for this connector
>   * @connector_type: user visible type of the connector
> @@ -476,6 +478,7 @@ EXPORT_SYMBOL(drmm_connector_init);
>   */
>  int drmm_connector_hdmi_init(struct drm_device *dev,
>                              struct drm_connector *connector,
> +                            const char *vendor, const char *product,
>                              const struct drm_connector_funcs *funcs,
>                              const struct drm_connector_hdmi_funcs *hdmi_funcs,
>                              int connector_type,
> @@ -485,6 +488,13 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>  {
>         int ret;
>
> +       if (!vendor || !product)
> +               return -EINVAL;
> +
> +       if ((strlen(vendor) > DRM_CONNECTOR_HDMI_VENDOR_LEN) ||
> +           (strlen(product) > DRM_CONNECTOR_HDMI_PRODUCT_LEN))
> +               return -EINVAL;
> +
>         if (!(connector_type == DRM_MODE_CONNECTOR_HDMIA ||
>               connector_type == DRM_MODE_CONNECTOR_HDMIB))
>                 return -EINVAL;
> @@ -500,6 +510,12 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>                 return ret;
>
>         connector->hdmi.supported_formats = supported_formats;
> +       strtomem_pad(connector->hdmi.vendor, vendor, 0);
> +       strtomem_pad(connector->hdmi.product, product, 0);
> +
> +       ret = drmm_mutex_init(dev, &connector->hdmi.infoframes.lock);

I'd suggest moving this call to the generic __drm_connector_init().
This way no matter how the rest of the drm code (mis)uses the
connector, the lock is always present and valid.

> +       if (ret)
> +               return ret;
>
>         /*
>          * drm_connector_attach_max_bpc_property() requires the
> diff --git a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
> index dcc0f7486f49..b28409fe65dd 100644
> --- a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
> @@ -203,6 +203,7 @@ drm_atomic_helper_connector_hdmi_init(struct kunit *test,
>
>         conn = &priv->connector;
>         ret = drmm_connector_hdmi_init(drm, conn,
> +                                      "Vendor", "Product",
>                                        &dummy_connector_funcs,
>                                        &dummy_connector_hdmi_funcs,
>                                        DRM_MODE_CONNECTOR_HDMIA,
> diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
> index 6a3651b08c81..b9c80d282380 100644
> --- a/drivers/gpu/drm/tests/drm_connector_test.c
> +++ b/drivers/gpu/drm/tests/drm_connector_test.c
> @@ -189,6 +189,7 @@ static void drm_test_connector_hdmi_init_valid(struct kunit *test)
>         int ret;
>
>         ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +                                      "Vendor", "Product",
>                                        &dummy_funcs,
>                                        &dummy_hdmi_funcs,
>                                        DRM_MODE_CONNECTOR_HDMIA,
> @@ -208,6 +209,7 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
>         int ret;
>
>         ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +                                      "Vendor", "Product",
>                                        &dummy_funcs,
>                                        &dummy_hdmi_funcs,
>                                        DRM_MODE_CONNECTOR_HDMIA,
> @@ -227,6 +229,7 @@ static void drm_test_connector_hdmi_init_bpc_invalid(struct kunit *test)
>         int ret;
>
>         ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +                                      "Vendor", "Product",
>                                        &dummy_funcs,
>                                        &dummy_hdmi_funcs,
>                                        DRM_MODE_CONNECTOR_HDMIA,
> @@ -246,6 +249,7 @@ static void drm_test_connector_hdmi_init_bpc_null(struct kunit *test)
>         int ret;
>
>         ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +                                      "Vendor", "Product",
>                                        &dummy_funcs,
>                                        &dummy_hdmi_funcs,
>                                        DRM_MODE_CONNECTOR_HDMIA,
> @@ -269,6 +273,7 @@ static void drm_test_connector_hdmi_init_bpc_8(struct kunit *test)
>         int ret;
>
>         ret = drmm_connector_hdmi_init(&priv->drm, connector,
> +                                      "Vendor", "Product",
>                                        &dummy_funcs,
>                                        &dummy_hdmi_funcs,
>                                        DRM_MODE_CONNECTOR_HDMIA,
> @@ -304,6 +309,7 @@ static void drm_test_connector_hdmi_init_bpc_10(struct kunit *test)
>         int ret;
>
>         ret = drmm_connector_hdmi_init(&priv->drm, connector,
> +                                      "Vendor", "Product",
>                                        &dummy_funcs,
>                                        &dummy_hdmi_funcs,
>                                        DRM_MODE_CONNECTOR_HDMIA,
> @@ -339,6 +345,7 @@ static void drm_test_connector_hdmi_init_bpc_12(struct kunit *test)
>         int ret;
>
>         ret = drmm_connector_hdmi_init(&priv->drm, connector,
> +                                      "Vendor", "Product",
>                                        &dummy_funcs,
>                                        &dummy_hdmi_funcs,
>                                        DRM_MODE_CONNECTOR_HDMIA,
> @@ -370,6 +377,7 @@ static void drm_test_connector_hdmi_init_formats_empty(struct kunit *test)
>         int ret;
>
>         ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +                                      "Vendor", "Product",
>                                        &dummy_funcs,
>                                        &dummy_hdmi_funcs,
>                                        DRM_MODE_CONNECTOR_HDMIA,
> @@ -389,6 +397,7 @@ static void drm_test_connector_hdmi_init_formats_no_rgb(struct kunit *test)
>         int ret;
>
>         ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +                                      "Vendor", "Product",
>                                        &dummy_funcs,
>                                        &dummy_hdmi_funcs,
>                                        DRM_MODE_CONNECTOR_HDMIA,
> @@ -409,6 +418,7 @@ static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
>         int ret;
>
>         ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +                                      "Vendor", "Product",
>                                        &dummy_funcs,
>                                        &dummy_hdmi_funcs,
>                                        connector_type,
> @@ -443,6 +453,7 @@ static void drm_test_connector_hdmi_init_type_invalid(struct kunit *test)
>         int ret;
>
>         ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +                                      "Vendor", "Product",
>                                        &dummy_funcs,
>                                        &dummy_hdmi_funcs,
>                                        connector_type,
> @@ -708,6 +719,7 @@ static void drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector(
>         int ret;
>
>         ret = drmm_connector_hdmi_init(&priv->drm, connector,
> +                                      "Vendor", "Product",
>                                        &dummy_funcs,
>                                        &dummy_hdmi_funcs,
>                                        DRM_MODE_CONNECTOR_HDMIA,
> diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
> index d59d2b3aef9a..22f083968aa8 100644
> --- a/include/drm/drm_atomic_state_helper.h
> +++ b/include/drm/drm_atomic_state_helper.h
> @@ -40,6 +40,8 @@ struct drm_private_state;
>  struct drm_modeset_acquire_ctx;
>  struct drm_device;
>
> +struct hdmi_audio_infoframe;
> +
>  void __drm_atomic_helper_crtc_state_reset(struct drm_crtc_state *state,
>                                           struct drm_crtc *crtc);
>  void __drm_atomic_helper_crtc_reset(struct drm_crtc *crtc,
> @@ -88,6 +90,12 @@ void
>  __drm_atomic_helper_connector_destroy_state(struct drm_connector_state *state);
>  void drm_atomic_helper_connector_destroy_state(struct drm_connector *connector,
>                                           struct drm_connector_state *state);
> +
> +int drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *connector,
> +                                                           struct hdmi_audio_infoframe *frame);
> +int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
> +                                                      struct drm_atomic_state *state);
> +
>  void __drm_atomic_helper_private_obj_duplicate_state(struct drm_private_obj *obj,
>                                                      struct drm_private_state *state);
>
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 3eaf4d54364d..5964ef283022 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -914,6 +914,21 @@ struct drm_tv_connector_state {
>         unsigned int hue;
>  };
>
> +/**
> + * struct drm_connector_hdmi_infoframe - HDMI Infoframe container
> + */
> +struct drm_connector_hdmi_infoframe {
> +       /**
> +        * @data: HDMI Infoframe structure
> +        */
> +       union hdmi_infoframe data;
> +
> +       /**
> +        * @set: Is the content of @data valid?
> +        */
> +       bool set;
> +};
> +
>  /**
>   * struct drm_connector_state - mutable connector state
>   */
> @@ -1070,6 +1085,35 @@ struct drm_connector_state {
>                  */
>                 enum drm_hdmi_broadcast_rgb broadcast_rgb;
>
> +               /**
> +                * @infoframes: HDMI Infoframes matching that state
> +                */
> +               struct {
> +                       /**
> +                        * @avi: AVI Infoframes structure matching our
> +                        * state.
> +                        */
> +                       struct drm_connector_hdmi_infoframe avi;
> +
> +                       /**
> +                        * @hdr_drm: DRM (Dynamic Range and Mastering)
> +                        * Infoframes structure matching our state.
> +                        */
> +                       struct drm_connector_hdmi_infoframe hdr_drm;
> +
> +                       /**
> +                        * @spd: SPD Infoframes structure matching our
> +                        * state.
> +                        */
> +                       struct drm_connector_hdmi_infoframe spd;
> +
> +                       /**
> +                        * @vendor: HDMI Vendor Infoframes structure
> +                        * matching our state.
> +                        */
> +                       struct drm_connector_hdmi_infoframe hdmi;
> +               } infoframes;
> +
>                 /**
>                  * @is_full_range: Is the output supposed to use a full
>                  * RGB Quantization Range or not?
> @@ -1115,6 +1159,41 @@ struct drm_connector_hdmi_funcs {
>         (*tmds_char_rate_valid)(const struct drm_connector *connector,
>                                 const struct drm_display_mode *mode,
>                                 unsigned long long tmds_rate);
> +
> +       /**
> +        * @clear_infoframe:
> +        *
> +        * This callback is invoked through
> +        * @drm_atomic_helper_hdmi_connector_update_infoframes during a
> +        * commit to clear the infoframes into the hardware. It will be
> +        * called multiple times, once for every disabled infoframe
> +        * type.
> +        *
> +        * The @clear_infoframe callback is optional.
> +        *
> +        * Returns:
> +        * 0 on success, a negative error code otherwise
> +        */
> +       int (*clear_infoframe)(struct drm_connector *connector,
> +                              enum hdmi_infoframe_type type);
> +
> +       /**
> +        * @write_infoframe:
> +        *
> +        * This callback is invoked through
> +        * @drm_atomic_helper_hdmi_connector_update_infoframes during a
> +        * commit to program the infoframes into the hardware. It will
> +        * be called multiple times, once for every updated infoframe
> +        * type.
> +        *
> +        * The @write_infoframe callback is mandatory.
> +        *
> +        * Returns:
> +        * 0 on success, a negative error code otherwise
> +        */
> +       int (*write_infoframe)(struct drm_connector *connector,
> +                              enum hdmi_infoframe_type type,
> +                              const u8 *buffer, size_t len);
>  };
>
>  /**
> @@ -1986,6 +2065,18 @@ struct drm_connector {
>          * @hdmi: HDMI-related variable and properties.
>          */
>         struct {
> +#define DRM_CONNECTOR_HDMI_VENDOR_LEN  8
> +               /**
> +                * @vendor: HDMI Controller Vendor Name
> +                */
> +               unsigned char vendor[DRM_CONNECTOR_HDMI_VENDOR_LEN] __nonstring;
> +
> +#define DRM_CONNECTOR_HDMI_PRODUCT_LEN 16
> +               /**
> +                * @product: HDMI Controller Product Name
> +                */
> +               unsigned char product[DRM_CONNECTOR_HDMI_PRODUCT_LEN] __nonstring;
> +
>                 /**
>                  * @supported_formats: Bitmask of @hdmi_colorspace
>                  * supported by the controller.
> @@ -1996,6 +2087,47 @@ struct drm_connector {
>                  * @funcs: HDMI connector Control Functions
>                  */
>                 const struct drm_connector_hdmi_funcs *funcs;
> +
> +               /**
> +                * @infoframes: Current Infoframes output by the connector
> +                */
> +               struct {
> +                       /**
> +                        * @lock: Mutex protecting against concurrent access to
> +                        * the infoframes, most notably between KMS and ALSA.
> +                        */
> +                       struct mutex lock;
> +
> +                       /**
> +                        * @audio: Current Audio Infoframes structure. Protected
> +                        * by @lock.
> +                        */
> +                       struct drm_connector_hdmi_infoframe audio;
> +
> +                       /**
> +                        * @avi: Current AVI Infoframes structure. Protected by
> +                        * @lock.
> +                        */
> +                       struct drm_connector_hdmi_infoframe avi;
> +
> +                       /**
> +                        * @hdr_drm: Current DRM (Dynamic Range and Mastering)
> +                        * Infoframes structure. Protected by @lock.
> +                        */
> +                       struct drm_connector_hdmi_infoframe hdr_drm;
> +
> +                       /**
> +                        * @spd: Current SPD Infoframes structure. Protected by
> +                        * @lock.
> +                        */
> +                       struct drm_connector_hdmi_infoframe spd;
> +
> +                       /**
> +                        * @vendor: Current HDMI Vendor Infoframes structure.
> +                        * Protected by @lock.
> +                        */
> +                       struct drm_connector_hdmi_infoframe hdmi;
> +               } infoframes;
>         } hdmi;
>  };
>
> @@ -2017,6 +2149,7 @@ int drmm_connector_init(struct drm_device *dev,
>                         struct i2c_adapter *ddc);
>  int drmm_connector_hdmi_init(struct drm_device *dev,
>                              struct drm_connector *connector,
> +                            const char *vendor, const char *product,
>                              const struct drm_connector_funcs *funcs,
>                              const struct drm_connector_hdmi_funcs *hdmi_funcs,
>                              int connector_type,
>
> --
> 2.43.2
>


-- 
With best wishes
Dmitry
