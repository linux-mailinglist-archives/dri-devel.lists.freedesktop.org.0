Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0614EE06D
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 20:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C208894B7;
	Thu, 31 Mar 2022 18:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C0410E433;
 Thu, 31 Mar 2022 18:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648751363; x=1680287363;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TxSLsYqCcZgjlED35Rr7O0xeei1GfsU8jtJUvA0nzJ4=;
 b=tOIZachzjRGYdqqCLswlrWRCFzGeJ20RIrv5cB7+Ksxw+BciUHLQFB5l
 by/nDwqGXuyeR3yd8G85h91v3NJOAjmzcyNb8ZjTEjvsjcQ97DNN/pzd2
 GfmnKk/k4vr3pE3keYkdbvbNRF2DU1plU0JdW/xzHL/29YFcylR6ucHWK Q=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 31 Mar 2022 11:29:22 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 11:29:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 31 Mar 2022 11:29:21 -0700
Received: from [10.110.103.252] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 31 Mar
 2022 11:29:20 -0700
Message-ID: <95c4e68f-0f54-fe2a-48f1-97a1e0a802ce@quicinc.com>
Date: Thu, 31 Mar 2022 11:29:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v5 2/4] drm: introduce
 drm_writeback_connector_init_with_encoder() API
Content-Language: en-US
To: Liviu Dudau <liviu.dudau@arm.com>
References: <1647907005-27004-1-git-send-email-quic_abhinavk@quicinc.com>
 <1647907005-27004-3-git-send-email-quic_abhinavk@quicinc.com>
 <YjtO3o3gchzEPCBD@e110455-lin.cambridge.arm.com>
 <0cde82fb-a93c-5b94-6330-74916085e9af@quicinc.com>
 <YjxD8rIlt3e3thul@e110455-lin.cambridge.arm.com>
 <17dde844-5230-7ed7-e96b-963da4f2050c@quicinc.com>
 <Yj2XO6sD1U0IvIZW@e110455-lin.cambridge.arm.com>
 <f07a6c5f-629f-dbb4-5230-3f9345f5b5be@quicinc.com>
 <YkV7+ogRRg7sokPQ@e110455-lin.cambridge.arm.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <YkV7+ogRRg7sokPQ@e110455-lin.cambridge.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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
 nganji@codeaurora.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, dmitry.baryshkov@linaro.org,
 james.qian.wang@arm.com, quic_aravindh@quicinc.com, mihail.atanassov@arm.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liviu

Thanks for the response.

Let me fix up and spin a new version.

Abhinav


On 3/31/2022 3:01 AM, Liviu Dudau wrote:
> On Fri, Mar 25, 2022 at 09:31:35AM -0700, Abhinav Kumar wrote:
>> Hi Liviu
> 
> Hi Abhinav,
> 
> Sorry for the delay, got busy with other things at the beginning of the week.
> 
>>
>> On 3/25/2022 3:19 AM, Liviu Dudau wrote:
>>> On Thu, Mar 24, 2022 at 09:36:50AM -0700, Abhinav Kumar wrote:
>>>> Hi Liviu
>>>
>>> Hello,
>>>
>>>>
>>>> Thanks for the response.
>>>>
>>>> On 3/24/2022 3:12 AM, Liviu Dudau wrote:
>>>>> On Wed, Mar 23, 2022 at 11:28:56AM -0700, Abhinav Kumar wrote:
>>>>>> Hi Liviu
>>>>>
>>>>> Hello,
>>>>>
>>>>>>
>>>>>> Thanks for the review.
>>>>>>
>>>>>> On 3/23/2022 9:46 AM, Liviu Dudau wrote:
>>>>>>> On Mon, Mar 21, 2022 at 04:56:43PM -0700, Abhinav Kumar wrote:
>>>>>>>> For vendors drivers which pass an already allocated and
>>>>>>>> initialized encoder especially for cases where the encoder
>>>>>>>> hardware is shared OR the writeback encoder shares the resources
>>>>>>>> with the rest of the display pipeline introduce a new API,
>>>>>>>> drm_writeback_connector_init_with_encoder() which expects
>>>>>>>> an initialized encoder as a parameter and only sets up the
>>>>>>>> writeback connector.
>>>>>>>>
>>>>>>>> changes in v5:
>>>>>>>> 	- reorder this change to come before in the series
>>>>>>>> 	  to avoid incorrect functionality in subsequent changes
>>>>>>>> 	- continue using struct drm_encoder instead of
>>>>>>>> 	  struct drm_encoder * and switch it in next change
>>>>>>>>
>>>>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>>>
>>>>>>> Hi Abhinav,
>>>>>>>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/drm_writeback.c | 143 ++++++++++++++++++++++++++++------------
>>>>>>>>      include/drm/drm_writeback.h     |   5 ++
>>>>>>>>      2 files changed, 106 insertions(+), 42 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
>>>>>>>> index dc2ef12..abe78b9 100644
>>>>>>>> --- a/drivers/gpu/drm/drm_writeback.c
>>>>>>>> +++ b/drivers/gpu/drm/drm_writeback.c
>>>>>>>> @@ -149,37 +149,15 @@ static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
>>>>>>>>      	.destroy = drm_encoder_cleanup,
>>>>>>>>      };
>>>>>>>> -/**
>>>>>>>> - * drm_writeback_connector_init - Initialize a writeback connector and its properties
>>>>>>>> - * @dev: DRM device
>>>>>>>> - * @wb_connector: Writeback connector to initialize
>>>>>>>> - * @con_funcs: Connector funcs vtable
>>>>>>>> - * @enc_helper_funcs: Encoder helper funcs vtable to be used by the internal encoder
>>>>>>>> - * @formats: Array of supported pixel formats for the writeback engine
>>>>>>>> - * @n_formats: Length of the formats array
>>>>>>>> - * @possible_crtcs: possible crtcs for the internal writeback encoder
>>>>>>>> - *
>>>>>>>> - * This function creates the writeback-connector-specific properties if they
>>>>>>>> - * have not been already created, initializes the connector as
>>>>>>>> - * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
>>>>>>>> - * values. It will also create an internal encoder associated with the
>>>>>>>> - * drm_writeback_connector and set it to use the @enc_helper_funcs vtable for
>>>>>>>> - * the encoder helper.
>>>>>>>> - *
>>>>>>>> - * Drivers should always use this function instead of drm_connector_init() to
>>>>>>>> - * set up writeback connectors.
>>>>>>>> - *
>>>>>>>> - * Returns: 0 on success, or a negative error code
>>>>>>>> - */
>>>>>>>> -int drm_writeback_connector_init(struct drm_device *dev,
>>>>>>>> -				 struct drm_writeback_connector *wb_connector,
>>>>>>>> -				 const struct drm_connector_funcs *con_funcs,
>>>>>>>> -				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
>>>>>>>> -				 const u32 *formats, int n_formats, uint32_t possible_crtcs)
>>>>>>>> +static int drm_writeback_connector_setup(struct drm_device *dev,
>>>>>>>> +		struct drm_writeback_connector *wb_connector,
>>>>>>>> +		const struct drm_connector_funcs *con_funcs, const u32 *formats,
>>>>>>>> +		int n_formats)
>>>>>>>>      {
>>>>>>>>      	struct drm_property_blob *blob;
>>>>>>>> -	struct drm_connector *connector = &wb_connector->base;
>>>>>>>>      	struct drm_mode_config *config = &dev->mode_config;
>>>>>>>> +	struct drm_connector *connector = &wb_connector->base;
>>>>>>>> +
>>>>>>>
>>>>>>> Point of this reordering the statements is...?
>>>>>> This diff can be avoided. There was no reason to reorder this. I will remove
>>>>>> this re-order.
>>>>>>>
>>>>>>>>      	int ret = create_writeback_properties(dev);
>>>>>>>>      	if (ret != 0)
>>>>>>>> @@ -187,18 +165,10 @@ int drm_writeback_connector_init(struct drm_device *dev,
>>>>>>>>      	blob = drm_property_create_blob(dev, n_formats * sizeof(*formats),
>>>>>>>>      					formats);
>>>>>>>> -	if (IS_ERR(blob))
>>>>>>>> -		return PTR_ERR(blob);
>>>>>>>> -
>>>>>>>> -	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
>>>>>>>> -
>>>>>>>> -	wb_connector->encoder.possible_crtcs = possible_crtcs;
>>>>>>>> -
>>>>>>>> -	ret = drm_encoder_init(dev, &wb_connector->encoder,
>>>>>>>> -			       &drm_writeback_encoder_funcs,
>>>>>>>> -			       DRM_MODE_ENCODER_VIRTUAL, NULL);
>>>>>>>> -	if (ret)
>>>>>>>> -		goto fail;
>>>>>>>> +	if (IS_ERR(blob)) {
>>>>>>>> +		ret = PTR_ERR(blob);
>>>>>>>> +		return ret;
>>>>>>>> +	}
>>>>>>>
>>>>>>> I don't see why you have changed the earlier code to store the result of PTR_ERR into
>>>>>>> ret other than to help your debugging. I suggest that you keep the existing code that
>>>>>>> returns PTR_ERR(blob) directly and you will have a nicer diff stat as well.
>>>>>> Sure, i can fix this for a smaller diff stat.
>>>>>>>
>>>>>>>>      	connector->interlace_allowed = 0;
>>>>>>>> @@ -237,13 +207,102 @@ int drm_writeback_connector_init(struct drm_device *dev,
>>>>>>>>      attach_fail:
>>>>>>>>      	drm_connector_cleanup(connector);
>>>>>>>>      connector_fail:
>>>>>>>> -	drm_encoder_cleanup(&wb_connector->encoder);
>>>>>>>> -fail:
>>>>>>>>      	drm_property_blob_put(blob);
>>>>>>>>      	return ret;
>>>>>>>>      }
>>>>>>>> +
>>>>>>>> +/**
>>>>>>>> + * drm_writeback_connector_init - Initialize a writeback connector and its properties
>>>>>>>> + * @dev: DRM device
>>>>>>>> + * @wb_connector: Writeback connector to initialize
>>>>>>>> + * @con_funcs: Connector funcs vtable
>>>>>>>> + * @enc_helper_funcs: Encoder helper funcs vtable to be used by the internal encoder
>>>>>>>> + * @formats: Array of supported pixel formats for the writeback engine
>>>>>>>> + * @n_formats: Length of the formats array
>>>>>>>> + * @possible_crtcs: possible crtcs for the internal writeback encoder
>>>>>>>> + *
>>>>>>>> + * This function creates the writeback-connector-specific properties if they
>>>>>>>> + * have not been already created, initializes the connector as
>>>>>>>> + * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
>>>>>>>> + * values. It will also create an internal encoder associated with the
>>>>>>>> + * drm_writeback_connector and set it to use the @enc_helper_funcs vtable for
>>>>>>>> + * the encoder helper.
>>>>>>>> + *
>>>>>>>> + * Drivers should always use this function instead of drm_connector_init() to
>>>>>>>> + * set up writeback connectors.
>>>>>>>> + *
>>>>>>>> + * Returns: 0 on success, or a negative error code
>>>>>>>> + */
>>>>>>>> +int drm_writeback_connector_init(struct drm_device *dev,
>>>>>>>> +		struct drm_writeback_connector *wb_connector,
>>>>>>>> +		const struct drm_connector_funcs *con_funcs,
>>>>>>>> +		const struct drm_encoder_helper_funcs *enc_helper_funcs,
>>>>>>>> +		const u32 *formats, int n_formats, uint32_t possible_crtcs)
>>>>>>>> +{
>>>>>>>> +	int ret = 0;
>>>>>>>> +
>>>>>>>> +	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
>>>>>>>> +
>>>>>>>> +	wb_connector->encoder.possible_crtcs = possible_crtcs;
>>>>>>>> +
>>>>>>>> +	ret = drm_encoder_init(dev, &wb_connector->encoder,
>>>>>>>> +			       &drm_writeback_encoder_funcs,
>>>>>>>> +			       DRM_MODE_ENCODER_VIRTUAL, NULL);
>>>>>>>> +	if (ret)
>>>>>>>> +		return ret;
>>>>>>>> +
>>>>>>>> +	ret = drm_writeback_connector_setup(dev, wb_connector, con_funcs, formats,
>>>>>>>> +			n_formats);
>>>>>>>> +
>>>>>>>> +	if (ret)
>>>>>>>> +		drm_encoder_cleanup(&wb_connector->encoder);
>>>>>>>> +
>>>>>>>> +	return ret;
>>>>>>>> +}
>>>>>>>>      EXPORT_SYMBOL(drm_writeback_connector_init);
>>>>>>>> +/**
>>>>>>>> + * drm_writeback_connector_init_with_encoder - Initialize a writeback connector and its properties
>>>>>>>> + * using the encoder which already assigned and initialized
>>>>>>>> + *
>>>>>>>> + * @dev: DRM device
>>>>>>>> + * @wb_connector: Writeback connector to initialize
>>>>>>>> + * @con_funcs: Connector funcs vtable
>>>>>>>> + * @enc_helper_funcs: Encoder helper funcs vtable to be used by the internal encoder
> 
> This is the encoder helper funcs that I was talking about. Maybe it is better if you
> send a new, cleaner version and we can continue the conversation/review there?
> 
> Best regards,
> Liviu
The doc is wrong here, I will fix this and spin a new version.
> 
> 
>>>>>>>> + * @formats: Array of supported pixel formats for the writeback engine
>>>>>>>> + * @n_formats: Length of the formats array
>>>>>>>> + *
>>>>>>>> + * This function creates the writeback-connector-specific properties if they
>>>>>>>> + * have not been already created, initializes the connector as
>>>>>>>> + * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
>>>>>>>> + * values.
>>>>>>>> + *
>>>>>>>> + * This function assumes that the drm_writebac_connector's encoder has already been
>>>>>>>
>>>>>>> spelling: writeback
>>>>>> Ack. will fix this.
>>>>>>>
>>>>>>>> + * created and initialized before invoking this function.
>>>>>>>> + *
>>>>>>>> + * In addition, this function also assumes that callers of this API will manage
>>>>>>>> + * assigning the encoder helper functions, possible_crtcs and any other encoder
>>>>>>>> + * specific operation which is otherwise handled by drm_writeback_connector_init().
>>>>>>>> + *
>>>>>>>> + * Drivers should always use this function instead of drm_connector_init() to
>>>>>>>> + * set up writeback connectors.
>>>>>>>
>>>>>>> .... if they want to manage themselves the lifetime of the associated encoder.
>>>>>>>
>>>>>>> We're not trying to replace drm_writeback_connector_init() function here, only to
>>>>>>> provide an alternative function to call for special cases.
>>>>>>
>>>>>> Yes, we are trying to provide an alternative function call for special case
>>>>>> where the encoder is a shared encoder and/or where the resources of the
>>>>>> writeback encoder are shared with other hardware blocks.
>>>>>>
>>>>>> I can add that comment to this function's doc.
>>>>>>
>>>>>>>
>>>>>>>> + *
>>>>>>>> + * Returns: 0 on success, or a negative error code
>>>>>>>> + */
>>>>>>>> +int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
>>>>>>>> +		struct drm_writeback_connector *wb_connector,
>>>>>>>> +		const struct drm_connector_funcs *con_funcs, const u32 *formats,
>>>>>>>> +		int n_formats)
>>>>>>>
>>>>>>> Where is the encoder parameter? Isn't that the reason why the function is called
>>>>>>> `_with_encoder`?
>>>>>> The encoder parameter is skipped here because this function assumes that
>>>>>> wb_connector->encoder has already been initialized, setup with functions and
>>>>>> its possible_crts have already been set prior to calling this function like
>>>>>> the vc4 example shows. So this function doesnt need an explicit encoder
>>>>>> parameter. Let me know if thats a concern.
>>>>>>>
>>>>>>> I think there might have been too many version of these patchsets and things are
>>>>>>> starting to be confusing. Please revisit the series without rushing and come up with
>>>>>>> a plan of action. My understanding of watching this series has been that you're
>>>>>>> trying to come up with a function that does *connector* initialisation but skips the
>>>>>>> *encoder* initialisation because it might have been already done by the driver. The
>>>>>>> idea will be then to have a function `drm_writeback_connector_init_with_encoder()`
>>>>>>> that does *all* the work that `drm_writeback_connector_init()` does at the moment minus
>>>>>>> the encoder initialisation part. Then `drm_writeback_connector_init()` only
>>>>>>> initialises the internal encoder and calls `drm_writeback_connector_init_with_encoder()`.
>>>>>>> There is no need to have the `drm_writeback_connector_setup()` function at all.
>>>>>>>
>>>>>>> Best regards,
>>>>>>> Liviu
>>>>>>>
>>>>>>
>>>>>> I agree there have been a 4 revisions prior to this because of the way this
>>>>>> affects the existing writeback drivers. So initial revision was a bit
>>>>>> intrusive into other drivers (which was just mostly a take over from the
>>>>>> previous patchset posted by the Co-developer ) and since rev3 we have
>>>>>> decided to have a separate API drm_writeback_connector_init_with_encoder()
>>>>>> so that existing clients are unaffected and it works seamlessly under the
>>>>>> hood.
>>>>>>
>>>>>> Only clients which already embed an encoder (vc4) and the new ones which
>>>>>> have special encoder requirements like the MSM driver for which I am
>>>>>> preparing these changes for will use the new API.
>>>>>>
>>>>>> Apologies for the revisions, but thanks to some great feedback from you and
>>>>>> laurent its shaping up nicely and reaching its conclusion I feel.
>>>>>
>>>>> I think it is only natural that there will be some iterations. If I remember
>>>>> correctly, the initial writeback series has something like 13 revisions :)
>>>>>
>>>>>>
>>>>>> So i think this revision is pretty close to being clean thanks to the
>>>>>> feedback you gave on rev4. Between rev4 and this one I didnt drastically
>>>>>> change the design other than re-ordering the changes to avoid the
>>>>>> intermediate patches having an incorrect state for the vc4 encoder. So all
>>>>>> your comments related to the encoder_cleanup() and vc4's encoder not getting
>>>>>> initialized would have gotten addressed but overall concept remained same.
>>>>>>
>>>>>> You are right, we are trying to come up with a function which does connector
>>>>>> initialization but skips the encoder part because that has already been done
>>>>>> in the client side of this API ( hence _with_encoder() name ). The
>>>>>> "_with_encoder" indicates that the caller already has an encoder for the
>>>>>> writeback connector which is being passed so there is no need to pass the
>>>>>> encoder again.
>>>>>>
>>>>>> I thought this addresses all the concerns posted in the previous series.
>>>>>>
>>>>>> So are you suggesting something like below?
>>>>>>
>>>>>> 1) rename drm_writeback_connector_setup() to
>>>>>> drm_writeback_connector_init_with_encoder()
>>>>>> (essentially thats what will end up happening )
>>>>>
>>>>> Correct. Without the pointless reordering of code it should be about 3 lines of code
>>>>> that get removed (the calls to drm_encoder_helper_add() and drm_encoder_init()).
>>>>>
>>>>
>>>> But isnt thats how it already looks.
>>>>
>>>> int drm_writeback_connector_init(struct drm_device *dev,
>>>>           struct drm_writeback_connector *wb_connector,
>>>>           const struct drm_connector_funcs *con_funcs,
>>>>           const struct drm_encoder_helper_funcs *enc_helper_funcs,
>>>>           const u32 *formats, int n_formats, uint32_t possible_crtcs)
>>>> {
>>>>       int ret = 0;
>>>>
>>>>       wb_connector->encoder = &wb_connector->internal_encoder;
>>>>
>>>>       drm_encoder_helper_add(wb_connector->encoder, enc_helper_funcs);
>>>>
>>>>       wb_connector->encoder->possible_crtcs = possible_crtcs;
>>>>
>>>>       ret = drm_encoder_init(dev, wb_connector->encoder,
>>>>                      &drm_writeback_encoder_funcs,
>>>>                      DRM_MODE_ENCODER_VIRTUAL, NULL);
>>>>       if (ret)
>>>>           return ret;
>>>>
>>>>       ret = drm_writeback_connector_setup(dev, wb_connector, con_funcs,
>>>> formats,
>>>>               n_formats);
>>>>
>>>> So the only change you are requesting is that, instead of having a new
>>>> drm_writeback_connector_setup(), just call
>>>> drm_writeback_connector_init_with_encoder().
>>>>
>>>> It will essentially look like
>>>>
>>>> int drm_writeback_connector_init(struct drm_device *dev,
>>>>           struct drm_writeback_connector *wb_connector,
>>>>           const struct drm_connector_funcs *con_funcs,
>>>>           const struct drm_encoder_helper_funcs *enc_helper_funcs,
>>>>           const u32 *formats, int n_formats, uint32_t possible_crtcs)
>>>> {
>>>>       int ret = 0;
>>>>
>>>>       wb_connector->encoder = &wb_connector->internal_encoder;
>>>
>>> (1)
>>>
>>>>
>>>>       drm_encoder_helper_add(wb_connector->encoder, enc_helper_funcs);
>>>>
>>>>       wb_connector->encoder->possible_crtcs = possible_crtcs;
>>>>
>>>>       ret = drm_encoder_init(dev, wb_connector->encoder,
>>>>                      &drm_writeback_encoder_funcs,
>>>>                      DRM_MODE_ENCODER_VIRTUAL, NULL);
>>>>       if (ret)
>>>>           return ret;
>>>>
>>>>       ret = drm_writeback_connector_init_with_encoder(dev, wb_connector,
>>>> con_funcs, formats,
>>>>               n_formats);
>>>
>>> Yes, this is exactly what I had in mind.
>>
>> Thank you for confirming.
>>
>>>
>>>
>>>>
>>>> drm_writeback_connector_init_with_encoder() will still not have an encoder
>>>> parameter because of what I wrote previously.
>>>
>>> But in your patch drm_writeback_connector_init_with_encoder() still has an
>>> encoder_funcs pointer which is useless, as the expectations are (AFAII) that the
>>> whole encoder init dance has already happened. And while you have a point that you
>>> can set the encoder pointer in the connector before calling
>>> drm_writeback_connector_init_with_encoder() I think it would be easier to read if you
>>> pass the encoder explicitly in the parameter list and skip the assignment in (1) and
>>> do it inside drm_writeback_connector_init_with_encoder(). Again, your code is not
>>> wrong, I just think we should be explicit so that code is easier to read.
>>
>> Sorry, but I am missing something here.
>>
>> Where is the encoder_funcs pointer in
>> drm_writeback_connector_init_with_encoder()? It only has drm_connector_funcs
>> pointer. Because, like I mentioned in the earlier comment, the callers of
>> this API would have already setup the encoder with the required
>> functions/possible_crtcs etc.
>>
>> int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
>>          struct drm_writeback_connector *wb_connector,
>>          const struct drm_connector_funcs *con_funcs, const u32 *formats,
>>          int n_formats)
>> {
>>      int ret = 0;
>>
>>      ret = drm_writeback_connector_setup(dev, wb_connector, con_funcs,
>> formats,
>>              n_formats);
>>
>>      return ret;
>> }
>>
>>
>> So are you suggesting I pass the drm_encoder as a parameter to
>> drm_writeback_connector_init_with_encoder as well?
>>
>> That has two potential issues:
>>
>> 1) If we move just the assignment of wb_connector->encoder to inside
>> drm_writeback_connector_init_with_encoder, we cannot do these before calling
>> drm_writeback_connector_init_with_encoder() as wb_connector->encoder will be
>> NULL for the cases which use internal_encoder
>>
>> drm_encoder_helper_add(wb_connector->encoder, enc_helper_funcs);
>>
>> wb_connector->encoder->possible_crtcs = possible_crtcs;
>>
>> ret = drm_encoder_init(dev, wb_connector->encoder,
>>                     &drm_writeback_encoder_funcs,
>>                     DRM_MODE_ENCODER_VIRTUAL, NULL);
> 
> Where can you not do this? Inside drm_writeback_connector_init_with_encoder() you
> don't need to do that, as the function is intended to initialise a writeback
> connector using a provided encoder that has been already initialised. Inside
> drm_writeback_connector_init() you will call these functions using the internal
> encoder pointer that you have added in the series.
> 
>>
>> 2) We can only do these changes once wb_connector->encoder has been changed
>> to a pointer which happens in patch 4 of this series
>> https://patchwork.freedesktop.org/patch/479084/?series=101260&rev=5
>>
>> I was told to split the functionality of adding the new API in a separate
>> patch by laurent.
>>
>> To keep changes independent and functionally correct I thought this is the
>> best split.
>>
>> So the cleanup you are suggesting can be done in patch 4 of this series but
>> still I am not sure how to get around concern (1) because the encoder has to
>> be fully initialized before attaching to a wb_connector.
> 
> I think if you keep the vc4 patch in patch 4 and move the rest in here it will make
> more sense. Again, I think a new series cleaned up might help others to review as
> well (specially Laurent).
> 
> Best regards,
> Liviu
> 
> 
>>
>>
>>>
>>>>
>>>> Hope this is what you had in mind as well.
>>>>
>>>>>>
>>>>>> 2) Inside drm_writeback_connector_init() check:
>>>>>>
>>>>>> drm_writeback_connector_init(.....)
>>>>>> {
>>>>>>       if (!wb_conn->encoder)
>>>>>> 	initialize the encoder
>>>>>
>>>>> No, the assumption of drm_writeback_connector_init() is that we will provide the
>>>>> encoder, so no need to check that one is already provided. What you could do is:
>>>>>
>>>>>         WARN_ON(wb_conn->encoder);
>>>>>
>>>>
>>>> Got it, i will add a warning inside drm_writeback_connector_init() to
>>>> emphasize that its only meant for cases where an encoder is not provided.
>>>>
>>>>> before we overwrite the encoder. That way we will get a nice warning in the kernel
>>>>> log if someone tries to call drm_writeback_connector_init() with a preset encoder.
>>>>>
>>>>>>
>>>>>>       call drm_writeback_**_init_with_encoder() 				
>>>>>> }
>>>>>>
>>>>>> This will also work but have the foll concerns/questions:
>>>>>>
>>>>>> 1) Will drm_writeback_connector_init_with_encoder() be exported if we change
>>>>>> as per your suggestion or will all clients continue to use
>>>>>> drm_writeback_connector_init() only? We wanted to have a separate function
>>>>>> for new clients.
>>>>>
>>>>> Yes, we will need to export drm_writeback_connector_init_with_encoder() as well.
>>>>>
>>>> Alright, so vc4 and new vendors which provide their own encoder will use
>>>> this one. So no changes to the rest of the series.
>>>>
>>>>>>
>>>>>> 2) How will we detect that encoder needs to be initialized without it being
>>>>>> a pointer which happens in the later change. So ordering becomes an issue.
>>>>>
>>>>> I think the init problem is simple. You either call drm_writeback_connector_init()
>>>>> and the framework provides you with an encoder, or you call
>>>>> drm_writeback_connector_init_with_encoder() and the framework will use yours. The
>>>>> problems will show up on the cleanup and exit codes, where we need to be able to skip
>>>>> the cleanup if the encoder pointer is not the internal one. I think a simple
>>>>>
>>>>>        if (connector->encoder == &connector->internal_encoder)
>>>>>              do_encoder_cleanup_work_here()
>>>>>
>>>>> should work.
>>>>
>>>> Sorry, I am missing something here.
>>>>
>>>> Even in this current patch, the drm_encoder_cleanup() is done only inside
>>>> drm_writeback_connector_init() where internal_encoder is used.
>>>>
>>>> For drm_writeback_connector_init_with_encoder(), we dont do the cleanup and
>>>> expect the caller to do it like vc4 does in the next patch.
>>>>
>>>> So why do we need such a condition?
>>>
>>> You're right. I was thinking that at cleanup time we also need to do work with the
>>> right encoder, but that should accomplished by passing the right .destroy hook in the
>>> drm_encoder_funcs pointer via drm_encoder_init. So if the special drivers to the
>>> initialisation correctly it should all work fine, please disregard my comments.
>>>
>>> Best regards,
>>> Liviu
>>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>> Thats why I thought this is the best way to address the comments and keep
>>>>>> the functionality intact with each change.
>>>>>>
>>>>>> Let me know if I have misunderstood some comment or idea.
>>>>>
>>>>> I hope that with these clarifications we are both on the same page.
>>>>>
>>>>> Best regards,
>>>>> Liviu
>>>>>
>>>>>
>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>>
>>>>>>>> +{
>>>>>>>> +	int ret = 0;
>>>>>>>> +
>>>>>>>> +	ret = drm_writeback_connector_setup(dev, wb_connector, con_funcs, formats,
>>>>>>>> +			n_formats);
>>>>>>>> +
>>>>>>>> +	return ret;
>>>>>>>> +}
>>>>>>>> +EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
>>>>>>>> +
>>>>>>>>      int drm_writeback_set_fb(struct drm_connector_state *conn_state,
>>>>>>>>      			 struct drm_framebuffer *fb)
>>>>>>>>      {
>>>>>>>> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
>>>>>>>> index db6214f..0093bab 100644
>>>>>>>> --- a/include/drm/drm_writeback.h
>>>>>>>> +++ b/include/drm/drm_writeback.h
>>>>>>>> @@ -152,6 +152,11 @@ int drm_writeback_connector_init(struct drm_device *dev,
>>>>>>>>      				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
>>>>>>>>      				 const u32 *formats, int n_formats, uint32_t possible_crtcs);
>>>>>>>> +int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
>>>>>>>> +				struct drm_writeback_connector *wb_connector,
>>>>>>>> +				const struct drm_connector_funcs *con_funcs, const u32 *formats,
>>>>>>>> +				int n_formats);
>>>>>>>> +
>>>>>>>>      int drm_writeback_set_fb(struct drm_connector_state *conn_state,
>>>>>>>>      			 struct drm_framebuffer *fb);
>>>>>>>> -- 
>>>>>>>> 2.7.4
>>>>>>>>
>>>>>>>
>>>>>
>>>
> 
