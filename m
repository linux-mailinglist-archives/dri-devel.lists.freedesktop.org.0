Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D9516294B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 16:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FFE6EA24;
	Tue, 18 Feb 2020 15:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F59B6E31A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 15:20:00 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c9so24431619wrw.8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 07:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8z0yaGoyAgdcnLUjchh5tv/EstgR5ZfvSci8sH0PvQk=;
 b=rDtS4Y6fspc4lCL5INNBqTCHeyC8pSEReccwf8GxkygSOz3BfQ2fRD+w5iOEKn91/i
 afjqJ/eJcsdv+e6+opcsvUYypDOKv0ZdTdwjeD5j/d2PAIv61JEI7E/BGLn3ebZU2b0c
 ekas9deEIolIV1bODOZTY2fftl+wpzekVBxX6wVH+oP9EfTUV/98Llsscq3MslhrZ72w
 rAxPEGS0uLg5L2JPLOAGUvdF5WiaOT8vTlFT2ceWBdIf4WaMvO5iKl5mnLjZankkkjXT
 PsM66q6iiSO/qpls5ZsRbjG9ssTPE2BKJh/CTm3kz3+2KH/b+jnjYpUM7O/2dr83aCYe
 l0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=8z0yaGoyAgdcnLUjchh5tv/EstgR5ZfvSci8sH0PvQk=;
 b=MUxvpfa1JSyhdx8CAeqEMvGZl9MUxUzFJvfIyHqaXfItABvJQGv0n2ruuKJLbgntTN
 H9nRTFN8yfv55zUbOQOOLnQo/8+XU0d3VyY8T8m1UnWeiJZYaaDl3zcjUE4UqMRS+IT4
 gBCwGm33SfWlMdhSuJIwWnAEwbnHwCR3ltW2KXG5nXIgJ6/YWfYj4LqBkwu4o/+FHKIP
 7s21Jv+r1gONr1vSsIIiDzsvXCH737eX2wMEbGCvR4TlOXSvoWz7DtKaNL18vlQc2cez
 wsLmO0MuAwRACMYrf4Uer9f+CDiUAtRt8uJXpe3Mg9YBLAVtgXuvEiC+UxV3GQbRovSd
 SaEA==
X-Gm-Message-State: APjAAAWysHD+hPwO19EGBIA90C2LqbsgVSuB7nymKFf3FyJIivjfrwtS
 9OOjpGFeOFG1cBHKFKXWPdhAX4KJPBEadA==
X-Google-Smtp-Source: APXvYqxAQ/ISrbWbWTb/1i/wTRri0xllD04ubTYK15E3Mv8Jv5v3VRSAfSUQzp7ag+6sjlgNJlGBbw==
X-Received: by 2002:adf:e80e:: with SMTP id o14mr29187515wrm.212.1582039198730; 
 Tue, 18 Feb 2020 07:19:58 -0800 (PST)
Received: from [10.1.3.173]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t12sm6327205wrq.97.2020.02.18.07.19.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2020 07:19:58 -0800 (PST)
Subject: Re: [PATCH v2] drm/bridge: Fix the bridge kernel doc
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20200218151503.595825-1-boris.brezillon@collabora.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <43ee302c-39e2-00c2-01c5-9a238026ec64@baylibre.com>
Date: Tue, 18 Feb 2020 16:19:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200218151503.595825-1-boris.brezillon@collabora.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/02/2020 16:15, Boris Brezillon wrote:
> Commit 751465913f04 ("drm/bridge: Add a drm_bridge_state object")
> introduced new helpers and hooks but the kernel was slightly broken.
> Fix that now.
> 
> v2:
> * Fix the drm_atomic_add_encoder_bridges() doc
> 
> Fixes: 751465913f04 ("drm/bridge: Add a drm_bridge_state object")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/drm_atomic.c |  5 +++--
>  include/drm/drm_atomic.h     |  2 +-
>  include/drm/drm_bridge.h     | 15 ++++++++-------
>  3 files changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 65c46ed049c5..9ccfbf213d72 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1098,8 +1098,9 @@ EXPORT_SYMBOL(drm_atomic_get_new_bridge_state);
>   *
>   * This function adds all bridges attached to @encoder. This is needed to add
>   * bridge states to @state and make them available when
> - * &bridge_funcs.atomic_{check,pre_enable,enable,disable_post_disable}() are
> - * called
> + * &drm_bridge_funcs.atomic_check(), &drm_bridge_funcs.atomic_pre_enable(),
> + * &drm_bridge_funcs.atomic_enable(),
> + * &drm_bridge_funcs.atomic_disable_post_disable() are called.
>   *
>   * Returns:
>   * 0 on success or can fail with -EDEADLK or -ENOMEM. When the error is EDEADLK
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 52d65a055491..7b6cb4774e7d 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -1016,7 +1016,7 @@ struct drm_bus_cfg {
>  	 * @format: format used on this bus (one of the MEDIA_BUS_FMT_* format)
>  	 *
>  	 * This field should not be directly modified by drivers
> -	 * (&drm_atomic_bridge_chain_select_bus_fmts() takes care of the bus
> +	 * (drm_atomic_bridge_chain_select_bus_fmts() takes care of the bus
>  	 * format negotiation).
>  	 */
>  	u32 format;
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 45626ecf20f8..999faaaab9a1 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -349,9 +349,9 @@ struct drm_bridge_funcs {
>  	 * Duplicate the current bridge state object (which is guaranteed to be
>  	 * non-NULL).
>  	 *
> -	 * The atomic_duplicate_state() is optional. When not implemented the
> -	 * core allocates a drm_bridge_state object and calls
> -	 * &__drm_atomic_helper_bridge_duplicate_state() to initialize it.
> +	 * The atomic_duplicate_state() hook is optional. When not implemented
> +	 * the core allocates a drm_bridge_state object and calls
> +	 * __drm_atomic_helper_bridge_duplicate_state() to initialize it.
>  	 *
>  	 * RETURNS:
>  	 * A valid drm_bridge_state object or NULL if the allocation fails.
> @@ -407,11 +407,11 @@ struct drm_bridge_funcs {
>  	 * Formats listed in the returned array should be listed in decreasing
>  	 * preference order (the core will try all formats until it finds one
>  	 * that works). When the format is not supported NULL should be
> -	 * returned and *num_output_fmts should be set to 0.
> +	 * returned and num_output_fmts should be set to 0.
>  	 *
>  	 * This method is called on all elements of the bridge chain as part of
>  	 * the bus format negotiation process that happens in
> -	 * &drm_atomic_bridge_chain_select_bus_fmts().
> +	 * drm_atomic_bridge_chain_select_bus_fmts().
>  	 * This method is optional. When not implemented, the core will bypass
>  	 * bus format negotiation on this element of the bridge without
>  	 * failing, and the previous element in the chain will be passed
> @@ -478,9 +478,10 @@ struct drm_bridge_funcs {
>  	 *
>  	 * Note that the atomic_reset() semantics is not exactly matching the
>  	 * reset() semantics found on other components (connector, plane, ...).
> -	 * 1/ The reset operation happens when the bridge is attached, not when
> +	 *
> +	 * 1. The reset operation happens when the bridge is attached, not when
>  	 *    drm_mode_config_reset() is called
> -	 * 2/ It's meant to be used exclusively on bridges that have been
> +	 * 2. It's meant to be used exclusively on bridges that have been
>  	 *    converted to the ATOMIC API
>  	 *
>  	 * RETURNS:
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
