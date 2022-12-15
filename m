Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB44764D9D2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 11:56:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443F010E520;
	Thu, 15 Dec 2022 10:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D209B10E520
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 10:55:23 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id m14so2605217wrh.7
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 02:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YVfxD1MBUhNgZkYjJXTuJj50Usd6vuqo8PUyRW/DPqw=;
 b=Rovc/adL8ryJGF2Rb8+0qItrNjRUrrAakxffimr5raexS4FfS/98fTDNgmldAfjZ4h
 RaKeX08msvj5pHrorQ8iJpmAnYw1HrLYadrW3bd/L0i8E4smPzOy2MsOkbNpVJFsZqvH
 03Op2zd7vjPmHT5qcEDJcTgFVHEE5GRkZObYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YVfxD1MBUhNgZkYjJXTuJj50Usd6vuqo8PUyRW/DPqw=;
 b=Dv2XtvfedShRaqLx01poWROYk/pUf9lRyBWCjp5jNXlWLqzXTW/fRVK0sjLtjK4y84
 hMNMdmvgPwiAXifaO/viXIhrtPkBgkS290HhZ5vWq2vrTOlxtIq9AIXdwmHOtqBPINil
 uHtYeEm0kUb1nCqy2ImabxsDy4+MKFaVnm4Ih+n3HPBqD7l1hjVu3wQa0ImfyDuG0eLL
 5UJ8GGytXOOFTf5osdt2p1cRGC8HzSNP56qVdtDnnzwTx7TdCjHoEXjNvvAokWBh/DuX
 ftQ01E5nkdk9SEY6OVzC0Ym6y3nRGEuMb/ActK2ZcxQaZXQEsTHjDxnLSAwdbDrbFkex
 AFzg==
X-Gm-Message-State: ANoB5pk64NtcxRYpQ7CNlz0dwFBOehjjTM0Pp4B599z/kfUOh+53XxQ0
 MbcE3fzhZzM89d0IYD3eTnrgIQ==
X-Google-Smtp-Source: AA0mqf4AQNoGAsyHIpqoHi9iLfUOzCP+gbYPkEZIwNs/JXCAUE9vepSGFAOAtvv60Gqc6so5rmajNw==
X-Received: by 2002:a05:6000:1f15:b0:242:6588:3aa9 with SMTP id
 bv21-20020a0560001f1500b0024265883aa9mr26534486wrb.32.1671101721886; 
 Thu, 15 Dec 2022 02:55:21 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 bw26-20020a0560001f9a00b00241c6729c2bsm5610093wrb.26.2022.12.15.02.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 02:55:20 -0800 (PST)
Date: Thu, 15 Dec 2022 11:55:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [RFC 1/2] drm/connector: add connector list iteration with
 filtering
Message-ID: <Y5r9FjVJldoGwiCm@phenom.ffwll.local>
References: <cover.1664966047.git.jani.nikula@intel.com>
 <8d92019b6ae730d6dc019e03fbc103645a2cf203.1664966047.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d92019b6ae730d6dc019e03fbc103645a2cf203.1664966047.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: intel-gfx@lists.freedesktop.org, Suraj Kandpal <suraj.kandpal@intel.com>,
 dri-devel@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 05, 2022 at 01:51:43PM +0300, Jani Nikula wrote:
> Add new function drm_connector_list_iter_filter_begin() to initialize
> connector list iterator with a filter function. Subsequent iteration on
> the list will only return connectors on which the filter function
> returns true.
> 
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 57 ++++++++++++++++++++++++++-------
>  include/drm/drm_connector.h     |  9 ++++++
>  2 files changed, 54 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index e3142c8142b3..d54b4b54cecb 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -762,6 +762,29 @@ static struct lockdep_map connector_list_iter_dep_map = {
>  };
>  #endif
>  
> +/**
> + * drm_connector_list_iter_filter_begin - initialize a connector_list iterator with filter
> + * @dev: DRM device
> + * @iter: connector_list iterator
> + * @filter: connector filter function
> + * @filter_context: context to be passed to the filter function
> + *
> + * Same as drm_connector_list_iter_begin(), but sets up the iterator to only
> + * return connectors where filter(connector) returns true.
> + */
> +void drm_connector_list_iter_filter_begin(struct drm_device *dev,
> +					  struct drm_connector_list_iter *iter,
> +					  drm_connector_list_iter_filter_fn filter,
> +					  void *filter_context)
> +{
> +	iter->dev = dev;
> +	iter->conn = NULL;
> +	iter->filter = filter;
> +	iter->filter_context = filter_context;
> +	lock_acquire_shared_recursive(&connector_list_iter_dep_map, 0, 1, NULL, _RET_IP_);
> +}
> +EXPORT_SYMBOL(drm_connector_list_iter_filter_begin);

So maybe I'm missing the obvious, but can't we just put a for_each_fi
right after the for_each_connector_iter?

And then maybe provide a default filter to kick out connectors and maybe a
macro that does the filtered iteration? The iter_begin/next/end is already
fairly tricky pattern compared to plain for_each macro, I think we should
try hard to not complicate it further with lots of variants if that's not
absolutely necessary.
-Daniel


> +
>  /**
>   * drm_connector_list_iter_begin - initialize a connector_list iterator
>   * @dev: DRM device
> @@ -775,9 +798,7 @@ static struct lockdep_map connector_list_iter_dep_map = {
>  void drm_connector_list_iter_begin(struct drm_device *dev,
>  				   struct drm_connector_list_iter *iter)
>  {
> -	iter->dev = dev;
> -	iter->conn = NULL;
> -	lock_acquire_shared_recursive(&connector_list_iter_dep_map, 0, 1, NULL, _RET_IP_);
> +	drm_connector_list_iter_filter_begin(dev, iter, NULL, NULL);
>  }
>  EXPORT_SYMBOL(drm_connector_list_iter_begin);
>  
> @@ -800,15 +821,8 @@ __drm_connector_put_safe(struct drm_connector *conn)
>  	schedule_work(&config->connector_free_work);
>  }
>  
> -/**
> - * drm_connector_list_iter_next - return next connector
> - * @iter: connector_list iterator
> - *
> - * Returns: the next connector for @iter, or NULL when the list walk has
> - * completed.
> - */
> -struct drm_connector *
> -drm_connector_list_iter_next(struct drm_connector_list_iter *iter)
> +static struct drm_connector *
> +__drm_connector_list_iter_next(struct drm_connector_list_iter *iter)
>  {
>  	struct drm_connector *old_conn = iter->conn;
>  	struct drm_mode_config *config = &iter->dev->mode_config;
> @@ -836,6 +850,25 @@ drm_connector_list_iter_next(struct drm_connector_list_iter *iter)
>  
>  	return iter->conn;
>  }
> +
> +/**
> + * drm_connector_list_iter_next - return next connector
> + * @iter: connector_list iterator
> + *
> + * Returns: the next connector for @iter, or NULL when the list walk has
> + * completed.
> + */
> +struct drm_connector *
> +drm_connector_list_iter_next(struct drm_connector_list_iter *iter)
> +{
> +	struct drm_connector *connector;
> +
> +	while ((connector = __drm_connector_list_iter_next(iter)) &&
> +	       iter->filter && !iter->filter(connector, iter->filter_context))
> +		;
> +
> +	return connector;
> +}
>  EXPORT_SYMBOL(drm_connector_list_iter_next);
>  
>  /**
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 56aee949c6fa..497b98197d3a 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1868,6 +1868,9 @@ struct drm_tile_group *drm_mode_get_tile_group(struct drm_device *dev,
>  void drm_mode_put_tile_group(struct drm_device *dev,
>  			     struct drm_tile_group *tg);
>  
> +typedef bool (*drm_connector_list_iter_filter_fn)(const struct drm_connector *connector,
> +						  void *filter_context);
> +
>  /**
>   * struct drm_connector_list_iter - connector_list iterator
>   *
> @@ -1886,10 +1889,16 @@ struct drm_connector_list_iter {
>  /* private: */
>  	struct drm_device *dev;
>  	struct drm_connector *conn;
> +	drm_connector_list_iter_filter_fn filter;
> +	void *filter_context;
>  };
>  
>  void drm_connector_list_iter_begin(struct drm_device *dev,
>  				   struct drm_connector_list_iter *iter);
> +void drm_connector_list_iter_filter_begin(struct drm_device *dev,
> +					  struct drm_connector_list_iter *iter,
> +					  drm_connector_list_iter_filter_fn filter,
> +					  void *filter_context);
>  struct drm_connector *
>  drm_connector_list_iter_next(struct drm_connector_list_iter *iter);
>  void drm_connector_list_iter_end(struct drm_connector_list_iter *iter);
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
