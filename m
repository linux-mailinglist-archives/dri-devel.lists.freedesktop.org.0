Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED96AA149A0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 07:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2941B10EA63;
	Fri, 17 Jan 2025 06:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="weC3t+Qp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C812E10EA63
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 06:20:43 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-54024aa9febso1864175e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 22:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737094782; x=1737699582; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=N9G5cxSlR5YBFwU/eUuLY9N25X6DuyoN1Okh0hbYmgM=;
 b=weC3t+QpV4aNvFzsUtqK7LuJrnSYfkBzJKh/LTO5op6K9mjt1nxcUEwY1AIp+Zu1Vz
 PPBn6hLnIpVRJsOENwKzo+ClFpaCJbrhPyAnJJdrHVyQxd+wzXwKs/bcwXzQBz1Ugvx1
 VWhQozw6fvK/0UlJXLTFze5fG9L76NipuVrdWvzCBl4QSsQi4sDHszF1eiQT/pW15HxM
 +V9jdV7IUNofjU6M5Vi1dcfvuXuYwWSYuXVNvM/PG1gTuoqAfxa94jf3yBvBLQK9xxP+
 ILOdEBFuXLlfT0czb3GvFdtirH02+vJJaC8FuYa5SUWnhiEwVss/M58LSBLdvu+9qr/L
 kv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737094782; x=1737699582;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N9G5cxSlR5YBFwU/eUuLY9N25X6DuyoN1Okh0hbYmgM=;
 b=k85NGYNVtZkGuihbIz8jJb+PzHnR9z1Gy/TG8OMZoyFpiFLNXUjxDCloOkUYASQFt6
 IZtIg3Siyz+vV9hi1wMy1FQDeeuwLU1J08A+fQNjDLtbjPkkEIdZQWeVelUgbwU56eqK
 tUfBKqzVBb9TNN1WFmtFudIaIGcHwwq4kgExoQIOgjpvRGoN/Cwvw6y8hA/67bdcyrDE
 pr2kh8nhAn5akCSk/LLhrGOuxRR8d86oTbeXq7EWN2omWd3hHCycvxAavhz8Z24gU5v/
 8igYioDJGV04LuU8Fj7kC8dJ+Q4kVNUTDSbK9VCvbUu0H4lP0ZLgckbaP5FZJ/uKDcNk
 lA1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyjfhBggP+zWQTIzUwvOr/hlBGaF0KbDMh/b5DDOLo5y2jlea6zjB71mRvHoVTsTta8gm4wLrjx2E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSdQD7WZm7tAlIcJg1iOOPnF5s54/eRHXfuzl/2O9Xvfnb5Bt8
 T8+NZcbGcZ7UOhH+SUdTvw7dYVp8uuQrDEEOVXNqmvIupSXJN3tJS7AsZhfy3n8=
X-Gm-Gg: ASbGncsl+kEQgeb18UgwqGVgP1frPJF0opd7PvEdazvpNM8GINW+npgl28tRffAIkhT
 FpTCDOlNMtdNirRE5iybjPgZqUn5gBkqfYFCa2/jI/62gQPFDWmifMueDE5MiHRFJ/Bk15bj+9W
 nPKEmL9NwkzOTcNrgCehxRARSK3DILRozwMUKRUchKHvyn1fSwS6FBQpF01KnGo0slUPHXHGt4C
 ROf19qrXD23LpnFJ1wypIj/gCf/9eonkO87mP/4Kmd6ibyeI+zjLOl84OIbmbbyoo3/6ltIkX+G
 GXy+X2MJu5Vukzchqt2l41WhLq218TTdPXs8
X-Google-Smtp-Source: AGHT+IEJcWvGLg+GvbH7HiVdhqIhB5eiEtCnFnsFal9FrU6c+QsRH9lRZSF7n/Vcgn1ilxoImv4Onw==
X-Received: by 2002:ac2:5110:0:b0:542:2943:db06 with SMTP id
 2adb3069b0e04-5439c282d06mr318195e87.33.1737094782211; 
 Thu, 16 Jan 2025 22:19:42 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af733f2sm234200e87.192.2025.01.16.22.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 22:19:41 -0800 (PST)
Date: Fri, 17 Jan 2025 08:19:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, arun.r.murthy@intel.com
Subject: Re: [PATCH 2/2] drm/i915/lttpr: Enable Extended Wake Timeout
Message-ID: <ztphlheh43abwngqvk7a2ht3bk2njytxlijykzf5ucuc3hrg5h@s22pn3wfdpai>
References: <20250117054850.1189650-1-suraj.kandpal@intel.com>
 <20250117054850.1189650-3-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117054850.1189650-3-suraj.kandpal@intel.com>
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

On Fri, Jan 17, 2025 at 11:18:50AM +0530, Suraj Kandpal wrote:
> Usually retimers take around 30 to 40ms to exit all devices from
> sleep state. Extended wake timeout request helps to give additional
> time by reading the DPCD register through which sink requests the
> minimal amount of time required to wake the sink up.
> Source  device shall keep retying  the AUX tansaction till the extended
> timeout that is being granted for LTTPRs from the sink device
> 
> --v2
> -Grant the requested time only if greater than 1ms [Arun]
> -Reframe commit message [Arun]
> 
> Spec: DP v2.1 Section 3.6.12.3
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c      |  2 +
>  .../drm/i915/display/intel_dp_link_training.c | 49 +++++++++++++++++++
>  .../drm/i915/display/intel_dp_link_training.h |  1 +
>  3 files changed, 52 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index acb986bc1f33..96cabe618678 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -2645,6 +2645,8 @@ static void mtl_ddi_pre_enable_dp(struct intel_atomic_state *state,
>  	if (!is_mst)
>  		intel_dp_set_power(intel_dp, DP_SET_POWER_D0);
>  
> +	intel_dp_lttpr_wake_timeout_setup(intel_dp);
> +
>  	intel_dp_configure_protocol_converter(intel_dp, crtc_state);
>  	if (!is_mst)
>  		intel_dp_sink_enable_decompression(state,
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index 8b1977cfec50..c113b0be259e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -135,6 +135,55 @@ static bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
>  		DP_PHY_REPEATER_MODE_TRANSPARENT;
>  }
>  
> +void intel_dp_lttpr_wake_timeout_setup(struct intel_dp *intel_dp)

Please move this function to drivers/gpu/drm/display/drm_dp_helper.c
Except for the intel_dp_lttpr_transparent_mode_enabled() call there is
nothing Intel-specific there.

> +{
> +	struct intel_display *display = to_intel_display(intel_dp);
> +	u8 val = 1;
> +	int ret;
> +
> +	if (intel_dp_lttpr_transparent_mode_enabled(intel_dp)) {
> +		static const u8 timeout_mapping[] = {
> +			[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_1_MS] = 1,
> +			[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_20_MS] = 20,
> +			[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_40_MS] = 40,
> +			[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_20_MS] = 20,
> +			[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_80_MS] = 80,
> +			[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_100_MS] = 100,
> +		};
> +
> +		ret = drm_dp_dpcd_readb(&intel_dp->aux,
> +					DP_EXTENDED_DPRX_SLEEP_WAKE_TIMEOUT_REQUEST, &val);
> +		if (ret != 1) {
> +			drm_dbg_kms(display->drm,
> +				    "Failed to read Extended sleep wake timeout request\n");
> +			return;
> +		}
> +
> +		val = (val < sizeof(timeout_mapping) && timeout_mapping[val]) ?
> +			timeout_mapping[val] : 1;
> +
> +		if (val > 1)
> +			drm_dp_dpcd_writeb(&intel_dp->aux,
> +					   DP_EXTENDED_DPRX_SLEEP_WAKE_TIMEOUT_GRANT,
> +					   DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_GRANTED);
> +	} else {
> +		ret = drm_dp_dpcd_readb(&intel_dp->aux,
> +					DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT, &val);
> +		if (ret != 1) {
> +			drm_dbg_kms(display->drm,
> +				    "Failed to read Extended sleep wake timeout request\n");
> +			return;
> +		}
> +
> +		val = (val & DP_EXTENDED_WAKE_TIMEOUT_REQUEST_MASK) ?
> +			(val & DP_EXTENDED_WAKE_TIMEOUT_REQUEST_MASK) * 10 : 1;
> +
> +		if (val > 1)
> +			drm_dp_dpcd_writeb(&intel_dp->aux, DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT,
> +					   DP_EXTENDED_WAKE_TIMEOUT_GRANT);
> +	}
> +}
> +
>  /*
>   * Read the LTTPR common capabilities and switch the LTTPR PHYs to
>   * non-transparent mode if this is supported. Preserve the
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.h b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> index 2066b9146762..cd4e0d6db6ed 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> @@ -15,6 +15,7 @@ struct intel_dp;
>  
>  int intel_dp_read_dprx_caps(struct intel_dp *intel_dp, u8 dpcd[DP_RECEIVER_CAP_SIZE]);
>  int intel_dp_init_lttpr_and_dprx_caps(struct intel_dp *intel_dp);
> +void intel_dp_lttpr_wake_timeout_setup(struct intel_dp *intel_dp);
>  
>  void intel_dp_link_training_set_mode(struct intel_dp *intel_dp,
>  				     int link_rate, bool is_vrr);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
