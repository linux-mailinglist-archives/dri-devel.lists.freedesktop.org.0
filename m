Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB53250E77F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 19:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B427410EEB3;
	Mon, 25 Apr 2022 17:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FE310EE94;
 Mon, 25 Apr 2022 17:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650908893; x=1682444893;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0ZvpV8VxwkjCppPySC1VNW3vdxcaHBUBniwqiWvvUkI=;
 b=dFRf0qZN+F6T6poTRBS0FvVvbqzONELxhqqHsTz856aV0Hl3a8gTqDmP
 htqVgYErF77GPIYqf749Gmcbbu9UrAuyVpHWKuDyMrc5gWxHu4dsFolN5
 2+/Yjf2msDPHXU5Nd7UQ975SkYrQzFi8uaS4fPGS3SlmY0wdZw89F5ZO1 c=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 25 Apr 2022 10:48:12 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 10:48:12 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 25 Apr 2022 10:48:11 -0700
Received: from [10.111.165.107] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 25 Apr
 2022 10:48:09 -0700
Message-ID: <36c5e99b-3df6-88b3-a567-f24ca249d028@quicinc.com>
Date: Mon, 25 Apr 2022 10:48:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v4 03/20] drm: allow real encoder to be passed
 for drm_writeback_connector
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <1650668815-7048-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650668815-7048-4-git-send-email-quic_abhinavk@quicinc.com>
 <YmVj0/XouEH0yfmT@pendragon.ideasonboard.com>
 <e924e564-e4e2-1f8f-4f5f-1cc0bc2084c3@quicinc.com>
 <eac58ee5-14ae-a9df-364d-d46da1fd64c3@quicinc.com>
 <YmWsLWnRa43hQ2sg@pendragon.ideasonboard.com>
 <CAA8EJppeH+qxUcU0OqLsAhHAMqd_ut1XwHKO7xUCyLj=m06_Zg@mail.gmail.com>
 <YmbbQfWP4PDr84pZ@pendragon.ideasonboard.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <YmbbQfWP4PDr84pZ@pendragon.ideasonboard.com>
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent

On 4/25/2022 10:32 AM, Laurent Pinchart wrote:
> On Mon, Apr 25, 2022 at 01:50:43PM +0300, Dmitry Baryshkov wrote:
>> On Sun, 24 Apr 2022 at 22:59, Laurent Pinchart wrote:
>>> On Sun, Apr 24, 2022 at 11:23:20AM -0700, Abhinav Kumar wrote:
>>>> On 4/24/2022 11:12 AM, Abhinav Kumar wrote:
>>>>> On 4/24/2022 7:50 AM, Laurent Pinchart wrote:
>>>>>> On Fri, Apr 22, 2022 at 04:06:38PM -0700, Abhinav Kumar wrote:
>>>>>>> For some vendor driver implementations, display hardware can
>>>>>>> be shared between the encoder used for writeback and the physical
>>>>>>> display.
>>>>>>>
>>>>>>> In addition resources such as clocks and interrupts can
>>>>>>> also be shared between writeback and the real encoder.
>>>>>>>
>>>>>>> To accommodate such vendor drivers and hardware, allow
>>>>>>> real encoder to be passed for drm_writeback_connector.
>>>>>>>
>>>>>>> For existing clients, drm_writeback_connector_init() will use
>>>>>>> an internal_encoder under the hood and hence no changes will
>>>>>>> be needed.
>>>>>>>
>>>>>>> changes in v7:
>>>>>>>      - move this change before the vc4 change in the series
>>>>>>>        to minimize the changes to vendor drivers in drm core
>>>>>>>        changes
>>>>>>
>>>>>> Why is this needed ? The drm_writeback_connector functions don't need
>>>>>> the drm_encoder after drm_writeback_connector_init() (or
>>>>>> drm_writeback_connector_init_with_encoder()) returns.
>>>>>>
>>>>>
>>>>> Sorry I didnt follow this comment. This change log is incorrect, so
>>>>> after changing the previous change in the series and modifying this, no
>>>>> further changes are needed to vc4, so I decided to drop the next change.
>>>>> So this change log is incorrect. I can remove this.
>>>>>
>>>>> Is that what you meant?
>>>>
>>>> So till the previous change, the only user of
>>>> drm_writeback_connector_init_with_encoder() was
>>>> drm_writeback_connector_init() which was still passing its own
>>>> internal_encoder.
>>>>
>>>> Only if the wb_connector->encoder is changed to a pointer, other vendor
>>>> drivers can pass their own encoder to
>>>> drm_writeback_connector_init_with_encoder().
>>>>
>>>> Hence you are right that drm_writeback_connector functions do not need
>>>> drm_encoder after init() returns, but till this change is done, other
>>>> vendor drivers cannot directly call
>>>> drm_writeback_connector_init_with_encoder() because the encoder will not
>>>> be valid till then.
>>>
>>> Users of drm_writeback_connector_init_with_encoder() handle the encoder
>>> themselves, they can simply ignore drm_writeback_connector.encoder. The
>>> documentation of the encoder field needs to be updated though (I'd do so
>>> in the previous patch), to clearly mention that the field is valid only
>>> when using drm_writeback_connector_init(), not when calling
>>> drm_writeback_connector_init_with_encoder().
>>
>> If we allow it to be unitialized, it might end with hard-to-trace
>> bugs, additional conditions, etc.
>> In my opnion we should:
>>   - either make drm_writeback_connector.encoder a valid pointer
>>   - or drop the field completely.
>>
>> And up to some point I'd vote for the second option. The code using
>> internal_encoder can continue using it directly. The code using
>> drm_writeback_connector_init_with_encoder() will manage encoder on
>> their own. We will loose a single entry point for wb's encoder, but do
>> we really need it? (Frankly speaking I didn't check.)
> 
> As far as I understand, we went for the second option as Abhinav dropped
> this patch for the next version.
> 

I dropped the patch as there was no agreement yet and I didnt want to 
block the series as its not really needed now but thats not option 2 
because wb_conn->encoder field remains there, just that its unused for 
users using drm_writeback_connector_init_with_encoder().

I guess what Dmitry is suggesting is just drop that 
wb_connector->encoder field completely.

>>>> Hope this clarifies it.
>>>>
>>>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/drm_writeback.c | 18 ++++++++++++------
>>>>>>>    drivers/gpu/drm/vc4/vc4_txp.c   |  4 ++--
>>>>>>>    include/drm/drm_writeback.h     | 22 ++++++++++++++++++++--
>>>>>>>    3 files changed, 34 insertions(+), 10 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/drm_writeback.c
>>>>>>> b/drivers/gpu/drm/drm_writeback.c
>>>>>>> index 92658ad..0538674 100644
>>>>>>> --- a/drivers/gpu/drm/drm_writeback.c
>>>>>>> +++ b/drivers/gpu/drm/drm_writeback.c
>>>>>>> @@ -180,21 +180,21 @@ int drm_writeback_connector_init(struct
>>>>>>> drm_device *dev,
>>>>>>>    {
>>>>>>>        int ret = 0;
>>>>>>> -    drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
>>>>>>> +    drm_encoder_helper_add(&wb_connector->internal_encoder, enc_helper_funcs);
>>>>>>> -    wb_connector->encoder.possible_crtcs = possible_crtcs;
>>>>>>> +    wb_connector->internal_encoder.possible_crtcs = possible_crtcs;
>>>>>>> -    ret = drm_encoder_init(dev, &wb_connector->encoder,
>>>>>>> +    ret = drm_encoder_init(dev, &wb_connector->internal_encoder,
>>>>>>>                       &drm_writeback_encoder_funcs,
>>>>>>>                       DRM_MODE_ENCODER_VIRTUAL, NULL);
>>>>>>>        if (ret)
>>>>>>>            return ret;
>>>>>>> -    ret = drm_writeback_connector_init_with_encoder(dev, wb_connector, &wb_connector->encoder,
>>>>>>> -            con_funcs, formats, n_formats);
>>>>>>> +    ret = drm_writeback_connector_init_with_encoder(dev, wb_connector,
>>>>>>> +            &wb_connector->internal_encoder, con_funcs, formats, n_formats);
>>>>>>>        if (ret)
>>>>>>> -        drm_encoder_cleanup(&wb_connector->encoder);
>>>>>>> +        drm_encoder_cleanup(&wb_connector->internal_encoder);
>>>>>>>        return ret;
>>>>>>>    }
>>>>>>> @@ -239,6 +239,12 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
>>>>>>>        struct drm_mode_config *config = &dev->mode_config;
>>>>>>>        int ret = create_writeback_properties(dev);
>>>>>>> +    /*
>>>>>>> +     * Assign the encoder passed to this API to the wb_connector's encoder.
>>>>>>> +     * For drm_writeback_connector_init(), this shall be the internal_encoder
>>>>>>> +     */
>>>>>>> +    wb_connector->encoder = enc;
>>>>>>> +
>>>>>>>        if (ret != 0)
>>>>>>>            return ret;
>>>>>>> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
>>>>>>> index 3447eb6..7e063a9 100644
>>>>>>> --- a/drivers/gpu/drm/vc4/vc4_txp.c
>>>>>>> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
>>>>>>> @@ -159,7 +159,7 @@ struct vc4_txp {
>>>>>>>    static inline struct vc4_txp *encoder_to_vc4_txp(struct drm_encoder *encoder)
>>>>>>>    {
>>>>>>> -    return container_of(encoder, struct vc4_txp, connector.encoder);
>>>>>>> +    return container_of(encoder, struct vc4_txp, connector.internal_encoder);
>>>>>>>    }
>>>>>>>    static inline struct vc4_txp *connector_to_vc4_txp(struct  drm_connector *conn)
>>>>>>> @@ -507,7 +507,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
>>>>>>>        if (ret)
>>>>>>>            return ret;
>>>>>>> -    encoder = &txp->connector.encoder;
>>>>>>> +    encoder = txp->connector.encoder;
>>>>>>>        encoder->possible_crtcs = drm_crtc_mask(crtc);
>>>>>>>        ret = devm_request_irq(dev, irq, vc4_txp_interrupt, 0,
>>>>>>> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
>>>>>>> index bb306fa..3fbae9d 100644
>>>>>>> --- a/include/drm/drm_writeback.h
>>>>>>> +++ b/include/drm/drm_writeback.h
>>>>>>> @@ -25,13 +25,31 @@ struct drm_writeback_connector {
>>>>>>>        struct drm_connector base;
>>>>>>>        /**
>>>>>>> -     * @encoder: Internal encoder used by the connector to fulfill
>>>>>>> +     * @encoder: handle to drm_encoder used by the connector to fulfill
>>>>>>>         * the DRM framework requirements. The users of the
>>>>>>>         * @drm_writeback_connector control the behaviour of the @encoder
>>>>>>>         * by passing the @enc_funcs parameter to drm_writeback_connector_init()
>>>>>>>         * function.
>>>>>>> +     *
>>>>>>> +     * For some vendor drivers, the hardware resources are shared between
>>>>>>> +     * writeback encoder and rest of the display pipeline.
>>>>>>> +     * To accommodate such cases, encoder is a handle to the real encoder
>>>>>>> +     * hardware.
>>>>>>> +     *
>>>>>>> +     * For current existing writeback users, this shall continue to be the
>>>>>>> +     * embedded encoder for the writeback connector.
>>>>>>> +     */
>>>>>>> +    struct drm_encoder *encoder;
>>>>>>> +
>>>>>>> +    /**
>>>>>>> +     * @internal_encoder: internal encoder used by writeback when
>>>>>>> +     * drm_writeback_connector_init() is used.
>>>>>>> +     * @encoder will be assigned to this for those cases
>>>>>>> +     *
>>>>>>> +     * This will be unused when drm_writeback_connector_init_with_encoder()
>>>>>>> +     * is used.
>>>>>>>         */
>>>>>>> -    struct drm_encoder encoder;
>>>>>>> +    struct drm_encoder internal_encoder;
>>>>>>>        /**
>>>>>>>         * @pixel_formats_blob_ptr:
> 
