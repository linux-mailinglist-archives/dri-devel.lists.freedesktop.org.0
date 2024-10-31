Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E849B80A5
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 17:54:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC02810E0AE;
	Thu, 31 Oct 2024 16:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eQ7s9rDk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4BC10E417
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 16:54:30 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2fb559b0b00so9800021fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 09:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730393668; x=1730998468; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LcG1Cptwud8AIi8pa0Ca3S8gnx7zEHdaWmbNdickIkk=;
 b=eQ7s9rDkH7x/9tbsRPbw07Jf/D54ws+RfTZX4yHAdEuFowzvfMTzR4QB9QL1D4WLA2
 ApZ9+XijHoSiPzZ89IvZOd6rN4M3p8bRdo4+1Xppl9XlHTwoHJqhK5q0aN1gi51Cgh6O
 WaVhSrbu/AnV247ilCRpZHE/ZI2Iw/bkuJkWsK0qLsFe3goly5hdVEE8omG8tH164ABj
 6X9xj5Qlerime4L8KKoCtSXl+y0CGio9+JFrlWKpktwJxHcju2iuVjGOA0WlrrggwRGi
 eAQvCnvUjAaUHSjIBr7k9atiXgb3Gc0fUef+nt3ZsgjQTks73eWOq/7uHnFJ2Byas9mb
 IOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730393668; x=1730998468;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LcG1Cptwud8AIi8pa0Ca3S8gnx7zEHdaWmbNdickIkk=;
 b=Qk3OO44Vuo1toGt3b8cD3ntJu8VhdYMfqF8CbsL8P2Wr5Vtw3Y2bS1eX/ptlpVGL0L
 g50MKXCycQPyo6O8Me4xeB2wAtA9e052TmATtLfw3R6CGd7Arjuqz5zdBVbp6qnPOr7e
 5RG9MEyFyanYvK4NmQI5sZw0DlTOz+BwxVsK6rD96V8nwOhy1XZK/OwZWAPH0el2Vxod
 I/Z1KenUn3v1Rr3PQG29xiI8EsvKm3/arfvAR5HN1uCiaNvg1hMBxDt/RxyJ+wf72LcU
 Iip5TuGJ6QCrioRjto8xms3Frz6LcyUeijf0v2i5BVUvzLZixBXHAhGGiJjIKHnoDM7U
 yjqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUON0NO8Wljbw8RRg5T+UvOp9ATxYFhTXd5STApy0EE/WdVWd+GkL21Ffrgh6z6FiTFMSmMBcgAQMY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZrsGdPS+WhvIPrt8GYczM313QMI6OBFeYP1Ulw9scVy5hPLMx
 CsnP2E4ZTw9o04rXCtSeZQFymBEOBTntlLfjLvTJceqmrbcHXCEvRuSZNA9EuE4=
X-Google-Smtp-Source: AGHT+IFbZzedgv73FPhHSopZrrz16kElbA7K8+QBYnMOAyeDwtCyC0BGEf/LrmGOrhd3qp//daS0zw==
X-Received: by 2002:a05:651c:1541:b0:2fb:5688:55a4 with SMTP id
 38308e7fff4ca-2fedb7a2fe0mr3529681fa.17.1730393668492; 
 Thu, 31 Oct 2024 09:54:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fdef6182dfsm2668051fa.71.2024.10.31.09.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 09:54:27 -0700 (PDT)
Date: Thu, 31 Oct 2024 18:54:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 4/4] drm/msm/dp: Add support for LTTPR handling
Message-ID: <6lpeexb5menpwrzcnmr367x4lmhvzyovhdybn54mnwk55ieehy@mos4oso67boo>
References: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
 <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-4-cafbb9855f40@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-4-cafbb9855f40@linaro.org>
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

On Thu, Oct 31, 2024 at 05:12:48PM +0200, Abel Vesa wrote:
> Link Training Tunable PHY Repeaters (LTTPRs) are defined in DisplayPort
> 1.4a specification. As the name suggests, these PHY repeaters are
> capable of adjusting their output for link training purposes.
> 
> The msm DP driver is currently lacking any handling of LTTPRs.
> This means that if at least one LTTPR is found between DPTX and DPRX,
> the link training would fail if that LTTPR was not already configured
> in transparent mode.

It might be nice to mention what is the transparent mode, especially for
those who do not have the standard at hand.

> The section 3.6.6.1 from the DisplayPort v2.0 specification mandates
> that before link training with the LTTPR is started, the DPTX may place
> the LTTPR in non-transparent mode by first switching to transparent mode
> and then to non-transparent mode. This operation seems to be needed only
> on first link training and doesn't need to be done again until device is
> unplugged.
> 
> It has been observed on a few X Elite-based platforms which have
> such LTTPRs in their board design that the DPTX needs to follow the
> procedure described above in order for the link training to be successful.
> 
> So add support for reading the LTTPR DPCD caps to figure out the number
> of such LTTPRs first. Then, for platforms (or Type-C dongles) that have
> at least one such an LTTPR, set its operation mode to transparent mode
> first and then to non-transparent, just like the mentioned section of
> the specification mandates.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index f01980b0888a40b719d3958cb96c6341feada077..5d3d318d7b87ce3bf567d8b7435931d8e087f713 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -107,6 +107,8 @@ struct dp_display_private {
>  	struct dp_event event_list[DP_EVENT_Q_MAX];
>  	spinlock_t event_lock;
>  
> +	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
> +
>  	bool wide_bus_supported;
>  
>  	struct dp_audio *audio;
> @@ -367,12 +369,35 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
>  	return 0;
>  }
>  
> +static void dp_display_lttpr_init(struct dp_display_private *dp)
> +{
> +	int lttpr_count;
> +
> +	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd,
> +					  dp->lttpr_caps))
> +		return;
> +
> +	lttpr_count = drm_dp_lttpr_count(dp->lttpr_caps);
> +
> +	if (lttpr_count) {
> +		drm_dp_lttpr_set_transparent_mode(dp->aux, true);
> +
> +		if (lttpr_count > 0) {
> +			if (drm_dp_lttpr_set_transparent_mode(dp->aux, false) != 1)
> +				drm_dp_lttpr_set_transparent_mode(dp->aux, true);
> +		}
> +	}
> +}
> +
>  static int dp_display_process_hpd_high(struct dp_display_private *dp)
>  {
>  	struct drm_connector *connector = dp->dp_display.connector;
>  	const struct drm_display_info *info = &connector->display_info;
>  	int rc = 0;
>  
> +	if (!dp->dp_display.is_edp)
> +		dp_display_lttpr_init(dp);

Why is it limited to non-eDP cases only.

> +
>  	rc = dp_panel_read_sink_caps(dp->panel, connector);
>  	if (rc)
>  		goto end;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
