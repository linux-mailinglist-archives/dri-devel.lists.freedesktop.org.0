Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA318503D7
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 11:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9961126AD;
	Sat, 10 Feb 2024 10:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GFvYFppb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803B11126A8
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 10:16:58 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dc755afdecfso1307159276.2
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 02:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707560217; x=1708165017; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=C3MtzCYDqA/NU9qAlKY3Nym0nximObQq5aVuIq2lscI=;
 b=GFvYFppbehmTuFtp9I42icFt+NvEa6i0RIOIBb4Mv5+DbUJa/JzSrjEGddydgKfEhj
 39T3HD5rG50K4zYPoZKOab9oRJd8qClcrCstDtGrcAwHnUL4jvLM/J7g54ib1rphwj1X
 seIVV8qwXMZlAZ+q3D+0jVZlzMvxX4O9U5yg9PMVo50SOmPObEwkqbVhI8x45Pe1ybt0
 1oTGW77cJ3n/TsnBpVt7o39FkZB5Ktt6hImuPVhVzJarujFMyARUi6cf8ImLnN+nOEFX
 PdktFPsUxuL5NISQQ+e3Q/HXPO4YjcZtG6SEKVMfh1qeaXSQJqf2UH/Ny87EjyYhIIbv
 DGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707560217; x=1708165017;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C3MtzCYDqA/NU9qAlKY3Nym0nximObQq5aVuIq2lscI=;
 b=tlg+SIPzF7v5BvigxAvUa2mEdQUDeFxAU9/do0C3Sa3nDP9k6TocsLJBgHbhvFal3B
 vdWSazVKa9UqLtO/8jaJ4uwBaOgGUwc/FiWKHirjGsoHKBXKsHQaxLtV121KHgYglQEr
 zG0frLdmsxo3ZHAzCXNfbqbm6RE17A8Sl8UYE37f3/xlMJnPVDokFpuVPDGZDv0QWCvG
 E2HlBhlGOUcvIoBhwvzV5OaQhv2BNJaNPb/nSySwTAyysgILMhsFuKTSmlLrWe4TlRkL
 nmLoNmCgFlDwK6AAqt5rCXGJE1SxJC0FcsnxVGweGzkH8jU0upKLaS19uXRdJDkyp/ng
 hNFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/BQ4qsKrzQm1nRJro3tU8/+GkNcPcNlM5JS82qv2dC8GrzOr1e2gJwCNWpk9v7D7Zdif0IH/j3ePoz46M1VksjsV0CrLVnvLkocnR8JWN
X-Gm-Message-State: AOJu0Yyo3MQ5oXWlnFQi8Km6Z2mfpbLxlqYcxyexyH88c098DPEyF5K/
 W+NmE+ScSMw9fxK2V2ymRTd6/iYpLbs718ylKY1jFNVdXMYuadn++I6VVTcb7qWMPm59bQYcju7
 jr7trW3sgK5F8r0Px1C+dpl1INkuyKgggJ7v9/g==
X-Google-Smtp-Source: AGHT+IHdeAwmz3vGqp+XhFSJbc9rlyCFILsXvjJJGq4rBxVBKBCiDLH6H086hg5mXLncPgLUg/Kv5DUESDy6lfLssVs=
X-Received: by 2002:a25:fc02:0:b0:dc6:4b66:2636 with SMTP id
 v2-20020a25fc02000000b00dc64b662636mr1324733ybd.19.1707560217563; Sat, 10 Feb
 2024 02:16:57 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-16-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-16-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 12:16:46 +0200
Message-ID: <CAA8EJpqq+H1gdy2pJo0Up=5w0mYTPRu2_1swEBNfyAMXztQanA@mail.gmail.com>
Subject: Re: [PATCH v2 15/19] drm/msm/dp: enable SDP and SDE periph flush
 update
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
 swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
 neil.armstrong@linaro.org
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

On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> DP controller can be setup to operate in either SDP update flush mode or
> peripheral flush mode based on the DP controller hardware version.
>
> Starting in DP v1.2, the hardware documents require the use of
> peripheral flush mode for SDP packets such as PPS OR VSC SDP packets.
>
> In-line with this guidance, lets program the DP controller to use
> peripheral flush mode starting DP v1.2
>
> Changes in v2:
>         - Use the original dp_catalog_hw_revision() function to
>           correctly check the DP HW version
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  1 +
>  drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
>  4 files changed, 21 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 0f28a4897b7b7..bc64dde5b7459 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -440,6 +440,23 @@ void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog,
>         dp_write_link(catalog, REG_DP_MISC1_MISC0, misc_val);
>  }
>
> +void dp_catalog_setup_peripheral_flush(struct dp_catalog *dp_catalog)
> +{
> +       u32 mainlink_ctrl, hw_revision;
> +       struct dp_catalog_private *catalog = container_of(dp_catalog,
> +                               struct dp_catalog_private, dp_catalog);
> +
> +       mainlink_ctrl = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
> +
> +       hw_revision = dp_catalog_hw_revision(dp_catalog);
> +       if (hw_revision >= DP_HW_VERSION_1_2)
> +               mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
> +       else
> +               mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
> +
> +       dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
> +}
> +
>  void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
>                                         u32 rate, u32 stream_rate_khz,
>                                         bool fixed_nvid, bool is_ycbcr_420)
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 5b3a7ba40d55f..9e2b05544f610 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -98,6 +98,7 @@ void dp_catalog_ctrl_config_ctrl(struct dp_catalog *dp_catalog, u32 config);
>  void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog);
>  void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog, bool enable);
>  void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog *dp_catalog, bool enable);
> +void dp_catalog_setup_peripheral_flush(struct dp_catalog *dp_catalog);
>  void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
>  void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
>                                 u32 stream_rate_khz, bool fixed_nvid, bool is_ycbcr_420);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index beef86b1aaf81..f1e7b0a5ee5d1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -170,6 +170,7 @@ static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
>
>         dp_catalog_ctrl_lane_mapping(ctrl->catalog);
>         dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
> +       dp_catalog_setup_peripheral_flush(ctrl->catalog);
>
>         dp_ctrl_config_ctrl(ctrl);
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 2983756c125cd..6ac66532b47a4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -102,6 +102,8 @@
>  #define DP_MAINLINK_CTRL_ENABLE                        (0x00000001)
>  #define DP_MAINLINK_CTRL_RESET                 (0x00000002)
>  #define DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER   (0x00000010)
> +#define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP      (0x00800000)
> +#define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE       (0x01800000)

Just one bit here, please.

>  #define DP_MAINLINK_FB_BOUNDARY_SEL            (0x02000000)
>
>  #define REG_DP_STATE_CTRL                      (0x00000004)
> --
> 2.39.2
>


-- 
With best wishes
Dmitry
