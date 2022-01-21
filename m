Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BACC495CA8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 10:17:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4140810E9A2;
	Fri, 21 Jan 2022 09:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EB910E9A2;
 Fri, 21 Jan 2022 09:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642756639; x=1674292639;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+vKN7iTjxod+Fyp3Notbf7x2rCsKmuFBBQG0spUXmBM=;
 b=KJ96fiYT2zQM45gJyaWTJrwRjMn0TeSnZ7ESmpHDH2P1V+bz7tLq6VY1
 qGaFWo0qfQgKVfGSS/KFkRuoi7PFFP9PfR4OEMX9vjHEJFIYYOf4H4TP0
 AzzTOlzRTw8dItZt+k7bHvGJ85zebXErgLJBxO7PeVGdp4uWg4m+w2RZW
 s09zbLJgOkIZKwelfXVOGSrF/9XI7EOEukruUcoQct6Bba+WcmoLUiVIt
 bp5xYAP4Ehyu8HktVXJRw6oulOxH9lFKWaBUSP8i1Ifu/a5If8zPg5de5
 ncBQmcHVZuJ0zwOXlQ7lSGiUQFMUtFcel/T4fsxP155VsCX6SqyYAry8f A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="331961046"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="331961046"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 01:17:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="533200849"
Received: from chandra2-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.104])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 01:17:14 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH] drm: allow passing a real encoder object for wb
 connector
In-Reply-To: <1642732195-25349-1-git-send-email-quic_abhinavk@quicinc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1642732195-25349-1-git-send-email-quic_abhinavk@quicinc.com>
Date: Fri, 21 Jan 2022 11:17:07 +0200
Message-ID: <87bl054fe4.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: suraj.kandpal@intel.com, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, swboyd@chromium.org,
 khsieh@codeaurora.org, nganji@codeaurora.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, dmitry.baryshkov@linaro.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Jan 2022, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> Instead of creating an internal encoder for the writeback
> connector to satisfy DRM requirements, allow the clients
> to pass a real encoder to it by changing the drm_writeback's
> encoder to a pointer.
>
> If a real encoder is not passed, drm_writeback_connector_init
> will internally allocate one.
>
> This will help the clients to manage the real encoder states
> better as they will allocate and maintain the encoder.

See also the thread starting at [1], and please try to coordinate.

I don't know what the end result should be like, I'm just saying please
collaborate instead of racing to get one set of changes in.

BR,
Jani.


[1] https://patchwork.freedesktop.org/patch/msgid/20220111101801.28310-1-suraj.kandpal@intel.com

>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/drm_writeback.c | 11 +++++++----
>  include/drm/drm_writeback.h     |  2 +-
>  2 files changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index dccf4504..fdb7381 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -189,8 +189,11 @@ int drm_writeback_connector_init(struct drm_device *dev,
>  	if (IS_ERR(blob))
>  		return PTR_ERR(blob);
>  
> -	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
> -	ret = drm_encoder_init(dev, &wb_connector->encoder,
> +	/* allocate the internal drm encoder if a real one wasnt passed */
> +	if (!wb_connector->encoder)
> +		wb_connector->encoder = devm_kzalloc(dev->dev, sizeof(struct drm_encoder), GFP_KERNEL);
> +	drm_encoder_helper_add(wb_connector->encoder, enc_helper_funcs);
> +	ret = drm_encoder_init(dev, wb_connector->encoder,
>  			       &drm_writeback_encoder_funcs,
>  			       DRM_MODE_ENCODER_VIRTUAL, NULL);
>  	if (ret)
> @@ -204,7 +207,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
>  		goto connector_fail;
>  
>  	ret = drm_connector_attach_encoder(connector,
> -						&wb_connector->encoder);
> +						wb_connector->encoder);
>  	if (ret)
>  		goto attach_fail;
>  
> @@ -233,7 +236,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
>  attach_fail:
>  	drm_connector_cleanup(connector);
>  connector_fail:
> -	drm_encoder_cleanup(&wb_connector->encoder);
> +	drm_encoder_cleanup(wb_connector->encoder);
>  fail:
>  	drm_property_blob_put(blob);
>  	return ret;
> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> index 9697d27..f0d8147 100644
> --- a/include/drm/drm_writeback.h
> +++ b/include/drm/drm_writeback.h
> @@ -31,7 +31,7 @@ struct drm_writeback_connector {
>  	 * by passing the @enc_funcs parameter to drm_writeback_connector_init()
>  	 * function.
>  	 */
> -	struct drm_encoder encoder;
> +	struct drm_encoder *encoder;
>  
>  	/**
>  	 * @pixel_formats_blob_ptr:

-- 
Jani Nikula, Intel Open Source Graphics Center
