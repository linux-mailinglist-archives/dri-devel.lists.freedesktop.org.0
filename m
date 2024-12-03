Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEE19E211D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 16:07:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D1B10E25B;
	Tue,  3 Dec 2024 15:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uAxWGJQU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B1F10E22B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 15:07:44 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53df7f6a133so5921607e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 07:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733238462; x=1733843262; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lWbH3zMSdms9NO7AAsx3IbTvYjORoi36HukYDYRA/nA=;
 b=uAxWGJQUciy6cZjY0bOcEkK5SdjTko45UyxFNhdKcUBjwdKsbtLW1ilfgmrK7WK53X
 HHFpF+VRKPWvVTjUBZWDzKE6rqAmDsD42/0Z8dW8TZ7G0/S8j3qlkAujxlTnn6gXa0nA
 7iWgBBMOnDrs0N5ZrBZB3JXmxuGGIoOFlTRpx2vwz+HqQxAVzUqL8K7AJiT6rnTNS1cd
 r938nqCeLR2kzoh2jwECHif1T35s0oYPoql/pcjm23Unw6RPRo1aUBY3LDHJuPIAVHKq
 7BkZ/EW7/WAEnFE0KtPHzazV5rBktU7lk+Wkx94HIruQ0RTHWFrQKAgbfCiDKPLs5IzJ
 pqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733238462; x=1733843262;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lWbH3zMSdms9NO7AAsx3IbTvYjORoi36HukYDYRA/nA=;
 b=oezx0lR5CTW8iaJu2ncNrupwegWvgsk0zhPxQyZqE1ulTdimXGG0yQKRo3febQ+Q0N
 u/Y7UttyhMGy7iRTjitjuqfU2hX0OqfK0bZATQdBxTDBKFcbKbRTy6ZDNiQSCxn71HE/
 00G6w0rbJN+ug4d8D8R/rinkt+xV5IaErePf/GHsXspa0QkzxivRNOLL6y2tNzsu7uqX
 ODv2/FC69CGO+p8BRtS9YDFlmubf8s/mXMGkz+ge6bZ2K9XSnxnTaPIrqNfT30LQHjYs
 T+gXsciH2Wal+g+cl/6I4zWIOpTp/3gNievmIWJeQIqzRboLix7XvUDE0JtdPxFwG/+c
 XqSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLWnIRPNZsA1OnlrjPU5OHV4pjgBiAbRgsY1GSFFpgY7sOSrA1D2YtaWl8S/bM3vZASys2Eo5hF6s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeICfpFTii7T4N7kG4bPv+cTnqRWH8MK7xO1/Edn+ApMqvWy+G
 ItjBEs+AxV079ODBq6wS8HGVLCM91vy9sRIFeulNnTP61JGJz3t7iGee221E4Oo=
X-Gm-Gg: ASbGnctWQ7JoZnZv/AFt7q2ymwnyvpu8Hh+Qf9FykdE0wUQFyJFcA9Kn79Tj6tzyUMW
 2dei52jWy1Z3hqBpHhvftZxl+j1Ho748UryUBijJsMDX7bFrvFXnrmSJGUniIjx+3zPwr7gT20y
 uugbp7R4nILK2X8o+dCHtxeBq+xmA1pTWDPvqZUwNQeDJIFgBr1O5A+MpdQd2torpEVsrFFrssY
 AQiQlfPV1mz9X4vQhgvoCkf96pCcECKwGZq4ghqG+oWxXf3i0/OQFTwoXZkrAVjTEvck9V7Ehnp
 iWJ+Byl5AcNP/FlnGQSvMyIemvfSbQ==
X-Google-Smtp-Source: AGHT+IE4op0fBfSMViWwf+uR6hh75A1LB20yneF2jOu95urNsdHGrHXCDhe9Wzm0x5CGD2AF/fabrw==
X-Received: by 2002:ac2:521c:0:b0:53e:1ba2:ee19 with SMTP id
 2adb3069b0e04-53e1ba2efc6mr211770e87.20.1733238462177; 
 Tue, 03 Dec 2024 07:07:42 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df647020dsm1845829e87.132.2024.12.03.07.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 07:07:40 -0800 (PST)
Date: Tue, 3 Dec 2024 17:07:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 01/10] drm/crtc: Add histogram properties
Message-ID: <4vedftgyu3wp77uz4kjdnn5yxzahiftx3hallgez4mcol7tcdv@cbxeme2khujn>
References: <20241203055520.1704661-1-arun.r.murthy@intel.com>
 <20241203055520.1704661-2-arun.r.murthy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203055520.1704661-2-arun.r.murthy@intel.com>
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

On Tue, Dec 03, 2024 at 11:25:11AM +0530, Arun R Murthy wrote:
> Add variables for histogram drm_property, its corrsponding crtc_state
> variables and define the structure pointed by the blob property.

Missing description of the data format. How can other drivers implememt
it if the format is not documented?

> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  include/drm/drm_crtc.h      | 48 +++++++++++++++++++++++++++++++++++++
>  include/uapi/drm/drm_mode.h | 11 +++++++++
>  2 files changed, 59 insertions(+)
> 
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 8b48a1974da3..3984cfa00cbf 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -274,6 +274,38 @@ struct drm_crtc_state {
>  	 */
>  	struct drm_property_blob *gamma_lut;
>  
> +	/**
> +	 * @histogram_enable:
> +	 *
> +	 * This will be set if histogram is enabled for the CRTC.
> +	 */
> +	bool histogram_enable;
> +
> +	/**
> +	 * @histogram_data:
> +	 *
> +	 * This will hold the pointer to the struct drm_histogram.
> +	 * The element data in drm_histogram will hold the pointer to the
> +	 * histogram data generated by the hardware.
> +	 */
> +	struct drm_property_blob *histogram_data;
> +
> +	/**
> +	 * @histogram_-iet:
> +	 *
> +	 * This will hold the pointer to the struct drm_histogram.
> +	 * The element data in drm_histogram will hold the pointer to the
> +	 * histogram image enhancement generated by the algorithm that is to
> +	 * be fed back to the hardware.
> +	 */
> +	struct drm_property_blob *histogram_iet;
> +	/**
> +	 * @histogram_iet_updates:
> +	 *
> +	 * Convey that the image enhanced data has been updated by the user
> +	 */
> +	bool histogram_iet_updated;
> +
>  	/**
>  	 * @target_vblank:
>  	 *
> @@ -1088,6 +1120,22 @@ struct drm_crtc {
>  	 */
>  	struct drm_property *scaling_filter_property;
>  
> +	/**
> +	 * @histogram_enable_property: Optional CRTC property for enabling or
> +	 * disabling global histogram.
> +	 */
> +	struct drm_property *histogram_enable_property;
> +	/**
> +	 * @histogram_data_proeprty: Optional CRTC property for getting the
> +	 * histogram blob data.
> +	 */
> +	struct drm_property *histogram_data_property;
> +	/**
> +	 * @histogram_iet_proeprty: Optional CRTC property for writing the
> +	 * image enhanced blob data
> +	 */
> +	struct drm_property *histogram_iet_property;
> +
>  	/**
>  	 * @state:
>  	 *
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index c082810c08a8..da4396f57ed1 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -1355,6 +1355,17 @@ struct drm_mode_closefb {
>  	__u32 pad;
>  };
>  
> +/**
> + * struct drm_histogram
> + * data_ptr: pointer to the array fo u32 data. This data can be histogram
> + * raw data or image enhanced data
> + * nr_elements: number of elements pointed by the data @data_ptr
> + */
> +struct drm_histogram {
> +	__u64 data_ptr;
> +	__u32 nr_elements;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
