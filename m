Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 239688503AF
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 10:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2455210F42B;
	Sat, 10 Feb 2024 09:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gROZrDXH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907E510F42B
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 09:37:26 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-dc755afdecfso1290439276.2
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 01:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707557846; x=1708162646; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=traMzP3X3ap8UfhwxLc+Vo63DS4xV+/qhFdckzPcq8g=;
 b=gROZrDXHCVG9NUtXrQIdCvDQW9rv+8GyAhoQbRopFWc0cCSkXp9xIZN5JDCK+qDBPk
 ii/aDlr0eUEmlnNmNqt6DWELbF8D5S+xbfW19mfNYnZcKHGOzSjCiGOdPJpqNFDRi3Hz
 DJxbaK/x7qzmk2TpnnV0QPJGu6VIJLbDuOhLoUnHDxnDAr2KOpKYmtSJDGFKG2AKm5GQ
 XLNPEJ7YCLiiGklo5GbmxwU4pe6q6yw6U32edi+xs8peZaivVdWKcPhSM8iVa3euwUHW
 rKMdDIA5DL583gYqpoP1fDaf2Z5pWUxmG+W/8YMFfSpUGj5mrjwAKLn4AjdXqx1K1uB0
 3TMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707557846; x=1708162646;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=traMzP3X3ap8UfhwxLc+Vo63DS4xV+/qhFdckzPcq8g=;
 b=eFlk2x/zOdo27OwVgv2ue802Fz+z60zuJwS6ERevIXutWpTcchDmbeYgMb5MbKcjAU
 j/20pk06x7jTmh51KcuTUj2d+vWcuN/W/oQUCsrO2HaKNIh1tJeJapcKkCY6Jajy0xnx
 i/5/Ecyhuhqlc6RbyEPDK0iK7NI/IQ9NVPLsBjy7cbgKjdiLW8rFB2l5N3g9akXQhBpI
 p6W4ATTXKKGYFj/A/vbm0kUQwrVYNNFAtVgc5Z8o/+ckmMb/DtfLRIGFIvflVaPST3zF
 BU8EcaeNzyV0BEEWrNPWLYZz/eYegV4ebnXRZsRmyjvquRN13yB62OE0LMWSywFkWrzS
 kPmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1A8oleDLFKQqUEEy1rTEzhHUrV/18SRTX5vw0hWu3SQ5uEmLzAH0aFYjusSfIa4Y6JcuOyoO+JKOsHH3q7zECHZUxNQmXoY+rog5NWMj2
X-Gm-Message-State: AOJu0Yz9r+x/Ubf5xLvSDaIfNXUO4uC0P/OXClFmQk/yIejUkZd14pRO
 TKrvghafShoZSCyxHilgtrEyHkHBbmvmhm/2uvormIqE3xJHNgQFwQCa4Ou2spLejkvuNdIKEwf
 OC+S/VD5vXWO6qOlmZ7ZbT1TjS7ZJ6fYENtKwYQ==
X-Google-Smtp-Source: AGHT+IF6CfRLisdVWfw44qvUlYpfj1ay0gD+tPXDhRLqsK2QrMb/MELbcxS5tQsxDr0PefjjkG/NJ46XbAkjEJ5+HGM=
X-Received: by 2002:a25:d348:0:b0:dc7:43bb:51f6 with SMTP id
 e69-20020a25d348000000b00dc743bb51f6mr1365579ybf.7.1707557845977; Sat, 10 Feb
 2024 01:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-3-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-3-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 11:37:15 +0200
Message-ID: <CAA8EJponSr=EgVe6m-KBWxvjz1bL-0Tczj=fGKZZrevJ3DZzbQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/19] drm/msm/dp: add an API to indicate if sink
 supports VSC SDP
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

On Sat, 10 Feb 2024 at 03:53, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> YUV420 format is supported only in the VSC SDP packet and not through
> MSA. Hence add an API which indicates the sink support which can be used
> by the rest of the DP programming.
>
> Changes in v2:
>         - Move VSC SDP support check API from dp_panel.c to
>           drm_dp_helper.c
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 21 +++++++++++++++++++++
>  include/drm/display/drm_dp_helper.h     |  1 +
>  2 files changed, 22 insertions(+)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index d72b6f9a352c1..c6ee0f9ab5f8f 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2917,6 +2917,27 @@ void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
>  }
>  EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
>
> +/**
> + * drm_dp_vsc_sdp_supported() - check if vsc sdp is supported
> + * @aux: DisplayPort AUX channel
> + * @dpcd: DisplayPort configuration data
> + *
> + * Returns true if vsc sdp is supported, else returns false
> + */
> +bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> +{
> +       u8 rx_feature;
> +
> +       if (drm_dp_dpcd_readb(aux, DP_DPRX_FEATURE_ENUMERATION_LIST, &rx_feature) != 1) {
> +               drm_dbg_dp(aux->drm_dev, "failed to read DP_DPRX_FEATURE_ENUMERATION_LIST\n");
> +               return false;
> +       }
> +
> +       return (dpcd[DP_DPCD_REV] >= DP_DPCD_REV_13) &&
> +               !!(rx_feature & DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED);

Nit: we don't even need  the `!!` here. I'll probably drop it while applying.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> +}
> +EXPORT_SYMBOL(drm_dp_vsc_sdp_supported);
> +
>  /**
>   * drm_dp_get_pcon_max_frl_bw() - maximum frl supported by PCON
>   * @dpcd: DisplayPort configuration data
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 863b2e7add29e..948381b2b0b1b 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -100,6 +100,7 @@ struct drm_dp_vsc_sdp {
>
>  void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
>                         const struct drm_dp_vsc_sdp *vsc);
> +bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
>
>  int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);
>
> --
> 2.39.2
>


-- 
With best wishes
Dmitry
