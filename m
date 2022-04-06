Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 246A94F6688
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 19:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3602110E0FF;
	Wed,  6 Apr 2022 17:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA0E10E0FF;
 Wed,  6 Apr 2022 17:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649265247; x=1680801247;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oJcejQMpD56oLbnhaMNadtSEJh3AxoMHGoXN1+OAB4U=;
 b=AbUqqsIk6z/VQOmqS63Ok4N5s1zbKrK0oyqOrczlPYjlNIVsR6cdNXg/
 jMLVrOzNQkfaZzKiTtLZGGxjGiuuTfvdue2L3fEOzB6+1CXhessnUi7zl
 9abOrfRbfZEis7cvmxUxyo1NDEeD4igbgRixyEZY5XYZd9+TIIJQwmorD A=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 06 Apr 2022 10:14:06 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 10:14:05 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 6 Apr 2022 10:14:05 -0700
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 6 Apr 2022
 10:14:04 -0700
Message-ID: <896084c8-6d75-bad7-121a-eec5bce406af@quicinc.com>
Date: Wed, 6 Apr 2022 10:14:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v6 2/4] drm: introduce
 drm_writeback_connector_init_with_encoder() API
Content-Language: en-US
To: Liviu Dudau <liviu.dudau@arm.com>
References: <1648771933-18512-1-git-send-email-quic_abhinavk@quicinc.com>
 <1648771933-18512-3-git-send-email-quic_abhinavk@quicinc.com>
 <Yk2p3q5EWd4P9u83@e110455-lin.cambridge.arm.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <Yk2p3q5EWd4P9u83@e110455-lin.cambridge.arm.com>
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
Cc: hamohammed.sa@gmail.com, suraj.kandpal@intel.com, emma@anholt.net,
 rodrigosiqueiramelo@gmail.com, jani.nikula@intel.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, melissa.srw@gmail.com,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 dmitry.baryshkov@linaro.org, james.qian.wang@arm.com,
 quic_aravindh@quicinc.com, mihail.atanassov@arm.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liviu

Thank you for your reviews. They were very useful to get this in shape.

Some comments below.

Abhinav

On 4/6/2022 7:55 AM, Liviu Dudau wrote:
> Hi Abhinav,
> 
> On Thu, Mar 31, 2022 at 05:12:11PM -0700, Abhinav Kumar wrote:
>> For vendors drivers which pass an already allocated and
>> initialized encoder especially for cases where the encoder
>> hardware is shared OR the writeback encoder shares the resources
>> with the rest of the display pipeline introduce a new API,
>> drm_writeback_connector_init_with_encoder() which expects
>> an initialized encoder as a parameter and only sets up the
>> writeback connector.
>>
>> changes in v6:
>> 	- remove drm_writeback_connector_setup() and instead
>> 	  directly call drm_writeback_connector_init_with_encoder()
>> 	- fix a drm_writeback_connector typo and function doc which
>> 	  incorrectly shows that the function accepts enc_helper_funcs
>> 	- pass encoder as a parameter explicitly to the new API
>> 	  for better readability
> 
> Side comment: if you plan to have the log of changes in the commit message then I
> would keep a list of all the changes. Otherwise, putting the log after the -- line
> below would still convey the information but will also ensure that when merged it
> will not show up in the commit message.

For DRM, I believe the convention was to have it above the --- ?

But yes, I will certainly include the full change log across the 
revisions. Still waiting for the reviews on the next 2 patches to reach 
a conclusion and when I post it again I will add it.

> 
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/drm_writeback.c | 72 +++++++++++++++++++++++++++++++++--------
>>   include/drm/drm_writeback.h     |  6 ++++
>>   2 files changed, 64 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
>> index dc2ef12..797223c 100644
>> --- a/drivers/gpu/drm/drm_writeback.c
>> +++ b/drivers/gpu/drm/drm_writeback.c
>> @@ -177,6 +177,62 @@ int drm_writeback_connector_init(struct drm_device *dev,
>>   				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
>>   				 const u32 *formats, int n_formats, uint32_t possible_crtcs)
>>   {
>> +	int ret = 0;
>> +
>> +	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
>> +
>> +	wb_connector->encoder.possible_crtcs = possible_crtcs;
>> +
>> +	ret = drm_encoder_init(dev, &wb_connector->encoder,
>> +			       &drm_writeback_encoder_funcs,
>> +			       DRM_MODE_ENCODER_VIRTUAL, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = drm_writeback_connector_init_with_encoder(dev, wb_connector, &wb_connector->encoder,
>> +			con_funcs, formats, n_formats);
>> +
>> +	if (ret)
>> +		drm_encoder_cleanup(&wb_connector->encoder);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(drm_writeback_connector_init);
>> +
>> +/**
>> + * drm_writeback_connector_init_with_encoder - Initialize a writeback connector and its properties
>> + * using the encoder which already assigned and initialized
>> + *
>> + * @dev: DRM device
>> + * @wb_connector: Writeback connector to initialize
>> + * @enc: handle to the already initialized drm encoder
>> + * @con_funcs: Connector funcs vtable
>> + * @formats: Array of supported pixel formats for the writeback engine
>> + * @n_formats: Length of the formats array
>> + *
>> + * This function creates the writeback-connector-specific properties if they
>> + * have not been already created, initializes the connector as
>> + * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
>> + * values.
>> + *
>> + * This function assumes that the drm_writeback_connector's encoder has already been
>> + * created and initialized before invoking this function.
>> + *
>> + * In addition, this function also assumes that callers of this API will manage
>> + * assigning the encoder helper functions, possible_crtcs and any other encoder
>> + * specific operation which is otherwise handled by drm_writeback_connector_init().
> 
> I would stop after "... specific operation".
Alright, will do. Thanks.
> 
> Otherwise, looks good to me.
> 
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> 
> Best regards,
> Liviu
> 
> 
>> + *
>> + * Drivers should always use this function instead of drm_connector_init() to
>> + * set up writeback connectors if they want to manage themselves the lifetime of the
>> + * associated encoder.
>> + *
>> + * Returns: 0 on success, or a negative error code
>> + */
>> +int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
>> +		struct drm_writeback_connector *wb_connector, struct drm_encoder *enc,
>> +		const struct drm_connector_funcs *con_funcs, const u32 *formats,
>> +		int n_formats)
>> +{
>>   	struct drm_property_blob *blob;
>>   	struct drm_connector *connector = &wb_connector->base;
>>   	struct drm_mode_config *config = &dev->mode_config;
>> @@ -190,15 +246,6 @@ int drm_writeback_connector_init(struct drm_device *dev,
>>   	if (IS_ERR(blob))
>>   		return PTR_ERR(blob);
>>   
>> -	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
>> -
>> -	wb_connector->encoder.possible_crtcs = possible_crtcs;
>> -
>> -	ret = drm_encoder_init(dev, &wb_connector->encoder,
>> -			       &drm_writeback_encoder_funcs,
>> -			       DRM_MODE_ENCODER_VIRTUAL, NULL);
>> -	if (ret)
>> -		goto fail;
>>   
>>   	connector->interlace_allowed = 0;
>>   
>> @@ -207,8 +254,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
>>   	if (ret)
>>   		goto connector_fail;
>>   
>> -	ret = drm_connector_attach_encoder(connector,
>> -						&wb_connector->encoder);
>> +	ret = drm_connector_attach_encoder(connector, enc);
>>   	if (ret)
>>   		goto attach_fail;
>>   
>> @@ -237,12 +283,10 @@ int drm_writeback_connector_init(struct drm_device *dev,
>>   attach_fail:
>>   	drm_connector_cleanup(connector);
>>   connector_fail:
>> -	drm_encoder_cleanup(&wb_connector->encoder);
>> -fail:
>>   	drm_property_blob_put(blob);
>>   	return ret;
>>   }
>> -EXPORT_SYMBOL(drm_writeback_connector_init);
>> +EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
>>   
>>   int drm_writeback_set_fb(struct drm_connector_state *conn_state,
>>   			 struct drm_framebuffer *fb)
>> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
>> index db6214f..4795024 100644
>> --- a/include/drm/drm_writeback.h
>> +++ b/include/drm/drm_writeback.h
>> @@ -152,6 +152,12 @@ int drm_writeback_connector_init(struct drm_device *dev,
>>   				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
>>   				 const u32 *formats, int n_formats, uint32_t possible_crtcs);
>>   
>> +int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
>> +				struct drm_writeback_connector *wb_connector,
>> +				struct drm_encoder *enc,
>> +				const struct drm_connector_funcs *con_funcs, const u32 *formats,
>> +				int n_formats);
>> +
>>   int drm_writeback_set_fb(struct drm_connector_state *conn_state,
>>   			 struct drm_framebuffer *fb);
>>   
>> -- 
>> 2.7.4
>>
> 
