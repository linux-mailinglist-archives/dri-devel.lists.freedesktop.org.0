Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 990034964F5
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 19:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2C910E4BC;
	Fri, 21 Jan 2022 18:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B4610E2B9;
 Fri, 21 Jan 2022 18:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642789523; x=1674325523;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HlYgOiY7bxHXf8Wiz2iqH3x3x3kUrzbx6JtgSOM7prc=;
 b=WP0gyQm4Qk9/k/akCnhjF33Q0IDMZ2CCkGPhaiUMyAFmdtKxFo1DgDE0
 Mh2HlBvi+J4JQx9QVaY56uF64tF9IMjdvCZ9kyjRWCIHnPxeqISp6Kvnn
 0x8Eny5tsKdhm6Q+9Xfr8KlwtOKy9pOuJ9Toz9iRE8NVmcvGEsEE7NRAv k=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 21 Jan 2022 10:25:22 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 10:25:22 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 21 Jan 2022 10:25:22 -0800
Received: from [10.111.160.59] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Fri, 21 Jan
 2022 10:25:20 -0800
Message-ID: <c797223b-47cb-3fcd-0a1a-b12fd2c2c0da@quicinc.com>
Date: Fri, 21 Jan 2022 10:25:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] drm: add writeback pointers to drm_connector
Content-Language: en-US
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
References: <20220111101801.28310-1-suraj.kandpal@intel.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220111101801.28310-1-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: jani.nikula@intel.com, Kandpal@freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ laurent on this

Hi Suraj

On 1/11/2022 2:17 AM, Kandpal, Suraj wrote:
> Changing drm_connector and drm_encoder feilds to pointers in
> drm_writeback_connector as the elements of struct
> drm_writeback_connector are:
> struct drm_writeback_connector {
> 	struct drm_connector base;
> 	struct drm_encoder encoder;
> Similarly the elements of intel_encoder and intel_connector
> are:
> struct intel_encoder {
> 	struct drm_encoder base;
> 
> struct intel_connector {
> 	struct drm_connector base;
> 
> The function drm_writeback_connector_init() will initialize the
> drm_connector and drm_encoder and attach them as well.
> Since the drm_connector/encoder are both struct in
> drm_writeback_connector and intel_connector/encoder, we need
> one of them to be a pointer so we can reference them or else we
> will be pointing to 2 seprate instances.
> 
> Usually the struct defined in drm framework pointing to any
> struct will be pointer and allocating them and initialization
> will be done with the users.
> Like struct drm_connector and drm_encoder are part of drm
> framework and the users of these such as i915 have included them
> in their struct intel_connector and intel_encoder. Likewise
> struct drm_writeback_connector is a special connector and hence
> is not a user of drm_connector and hence this should be pointers.
> 
> Adding drm_writeback_connector to drm_connector so that
> writeback_connector can be fetched from drm_connector as the previous
> container_of method won't work due to change in the feilds of
> drm_connector and drm_encoder in drm_writeback_connector.
> 
> Note:The corresponding ripple effect due to the above changes namely in
> two drivers as I can see it komeda and vkms have been dealt with in the
> upcoming patches of this series.
> 
> Signed-off-by: Kandpal, Suraj <suraj.kandpal@intel.com>

Jani pointed me to this thread as i had posted something similar here : 
https://patchwork.freedesktop.org/patch/470296/ but since this thread 
was posted earlier, we can discuss further here.

Overall, its similar to what I had posted in the RFC and your commit 
text also covers my concerns too.

One question I have about your change is since you have changed 
wb_connector::encoder to be a pointer, i saw the other changes in the 
series but they do not allocate an encoder. Would this not affect the 
other drivers which are assuming that the encoder in wb_connector is
struct drm_encoder encoder and not struct drm_encoder* encoder.

Your changes fix the compilation issue but wouldnt this crash as encoder
wasnt allocated for other drivers.

> ---
>   drivers/gpu/drm/drm_writeback.c | 19 ++++++++++---------
>   include/drm/drm_connector.h     |  3 +++
>   include/drm/drm_writeback.h     |  6 +++---
>   3 files changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index dccf4504f1bb..47238db42363 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -87,7 +87,7 @@ static const char *drm_writeback_fence_get_driver_name(struct dma_fence *fence)
>   	struct drm_writeback_connector *wb_connector =
>   		fence_to_wb_connector(fence);
>   
> -	return wb_connector->base.dev->driver->name;
> +	return wb_connector->base->dev->driver->name;
>   }
>   
>   static const char *
> @@ -177,7 +177,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
>   				 const u32 *formats, int n_formats)
>   {
>   	struct drm_property_blob *blob;
> -	struct drm_connector *connector = &wb_connector->base;
> +	struct drm_connector *connector = wb_connector->base;
>   	struct drm_mode_config *config = &dev->mode_config;
>   	int ret = create_writeback_properties(dev);
>   
> @@ -189,14 +189,15 @@ int drm_writeback_connector_init(struct drm_device *dev,
>   	if (IS_ERR(blob))
>   		return PTR_ERR(blob);
>   
> -	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
> -	ret = drm_encoder_init(dev, &wb_connector->encoder,
> +	drm_encoder_helper_add(wb_connector->encoder, enc_helper_funcs);
> +	ret = drm_encoder_init(dev, wb_connector->encoder,
>   			       &drm_writeback_encoder_funcs,
>   			       DRM_MODE_ENCODER_VIRTUAL, NULL);
>   	if (ret)
>   		goto fail;
>   
>   	connector->interlace_allowed = 0;
> +	connector->wb_connector = wb_connector;
>   
>   	ret = drm_connector_init(dev, connector, con_funcs,
>   				 DRM_MODE_CONNECTOR_WRITEBACK);
> @@ -204,7 +205,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
>   		goto connector_fail;
>   
>   	ret = drm_connector_attach_encoder(connector,
> -						&wb_connector->encoder);
> +						wb_connector->encoder);
>   	if (ret)
>   		goto attach_fail;
>   
> @@ -233,7 +234,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
>   attach_fail:
>   	drm_connector_cleanup(connector);
>   connector_fail:
> -	drm_encoder_cleanup(&wb_connector->encoder);
> +	drm_encoder_cleanup(wb_connector->encoder);
>   fail:
>   	drm_property_blob_put(blob);
>   	return ret;
> @@ -263,7 +264,7 @@ int drm_writeback_prepare_job(struct drm_writeback_job *job)
>   {
>   	struct drm_writeback_connector *connector = job->connector;
>   	const struct drm_connector_helper_funcs *funcs =
> -		connector->base.helper_private;
> +		connector->base->helper_private;
>   	int ret;
>   
>   	if (funcs->prepare_writeback_job) {
> @@ -315,7 +316,7 @@ void drm_writeback_cleanup_job(struct drm_writeback_job *job)
>   {
>   	struct drm_writeback_connector *connector = job->connector;
>   	const struct drm_connector_helper_funcs *funcs =
> -		connector->base.helper_private;
> +		connector->base->helper_private;
>   
>   	if (job->prepared && funcs->cleanup_writeback_job)
>   		funcs->cleanup_writeback_job(connector, job);
> @@ -401,7 +402,7 @@ drm_writeback_get_out_fence(struct drm_writeback_connector *wb_connector)
>   {
>   	struct dma_fence *fence;
>   
> -	if (WARN_ON(wb_connector->base.connector_type !=
> +	if (WARN_ON(wb_connector->base->connector_type !=
>   		    DRM_MODE_CONNECTOR_WRITEBACK))
>   		return NULL;
>   
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index b501d0badaea..ec4657cfd7b9 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -44,6 +44,7 @@ struct drm_printer;
>   struct drm_privacy_screen;
>   struct edid;
>   struct i2c_adapter;
> +struct drm_writeback_connector;
>   
>   enum drm_connector_force {
>   	DRM_FORCE_UNSPECIFIED,
> @@ -1533,6 +1534,8 @@ struct drm_connector {
>   	 */
>   	struct drm_encoder *encoder;
>   
> +	struct drm_writeback_connector *wb_connector;
> +
>   #define MAX_ELD_BYTES	128
>   	/** @eld: EDID-like data, if present */
>   	uint8_t eld[MAX_ELD_BYTES];
> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> index 9697d2714d2a..078c9907219c 100644
> --- a/include/drm/drm_writeback.h
> +++ b/include/drm/drm_writeback.h
> @@ -22,7 +22,7 @@ struct drm_writeback_connector {
>   	/**
>   	 * @base: base drm_connector object
>   	 */
> -	struct drm_connector base;
> +	struct drm_connector *base;
>   
>   	/**
>   	 * @encoder: Internal encoder used by the connector to fulfill
> @@ -31,7 +31,7 @@ struct drm_writeback_connector {
>   	 * by passing the @enc_funcs parameter to drm_writeback_connector_init()
>   	 * function.
>   	 */
> -	struct drm_encoder encoder;
> +	struct drm_encoder *encoder;
>   
>   	/**
>   	 * @pixel_formats_blob_ptr:
> @@ -143,7 +143,7 @@ struct drm_writeback_job {
>   static inline struct drm_writeback_connector *
>   drm_connector_to_writeback(struct drm_connector *connector)
>   {
> -	return container_of(connector, struct drm_writeback_connector, base);
> +	return connector->wb_connector;
>   }
>   
>   int drm_writeback_connector_init(struct drm_device *dev,
