Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 401894F3CC0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 19:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB74210EB62;
	Tue,  5 Apr 2022 17:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5D410EB56;
 Tue,  5 Apr 2022 17:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649178547; x=1680714547;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+WkvRz9xhxVa2nBqQFhWGIy3W3UoTIivbtJ/lAmDipM=;
 b=p/s5kxRFYVBt1VlwhZ7QfZ1M2vofhR6kkPN9ZJYYmB1AGZ3p9aJMFm1K
 wdhbfAgty3bJWj6kj59OGT8iM9COutV/psb4y8TKKyxwWyU4xlgJ8ONkr
 H+X5jQeITt7lf1fcxHmDXNMfz9nYEZ6zzGha2a2OV8SGUC9vRw1H4PdCh M=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 05 Apr 2022 10:09:06 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:09:05 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 5 Apr 2022 10:09:05 -0700
Received: from [10.38.244.111] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 5 Apr 2022
 10:09:01 -0700
Message-ID: <3866a04b-7dcc-7754-d14e-93f2ff947299@quicinc.com>
Date: Tue, 5 Apr 2022 10:08:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v6 4/4] drm: allow real encoder to be passed
 for drm_writeback_connector
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <1648771933-18512-1-git-send-email-quic_abhinavk@quicinc.com>
 <1648771933-18512-5-git-send-email-quic_abhinavk@quicinc.com>
 <YkccZgD+f0enx2aV@pendragon.ideasonboard.com>
 <CAF6AEGu6dE_47DZm9ZcF54mkHpAXGY30WuSP3LCRjtf5bNvjtw@mail.gmail.com>
 <YkxymKepTBq1MsWG@pendragon.ideasonboard.com>
 <65a349f6-3978-bad0-1e64-2c4ccc22d075@quicinc.com>
 <Ykx2M0gUvG5fcLJ4@pendragon.ideasonboard.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <Ykx2M0gUvG5fcLJ4@pendragon.ideasonboard.com>
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
Cc: hamohammed.sa@gmail.com, Kandpal Suraj <suraj.kandpal@intel.com>,
 Emma Anholt <emma@anholt.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, Liviu
 Dudau <liviu.dudau@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, melissa.srw@gmail.com,
 nganji@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, james.qian.wang@arm.com,
 quic_aravindh@quicinc.com, Mihail Atanassov <mihail.atanassov@arm.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent

On 4/5/2022 10:02 AM, Laurent Pinchart wrote:
> Hi Abhinav,
> 
> On Tue, Apr 05, 2022 at 09:53:57AM -0700, Abhinav Kumar wrote:
>> On 4/5/2022 9:47 AM, Laurent Pinchart wrote:
>>> On Mon, Apr 04, 2022 at 11:43:37AM -0700, Rob Clark wrote:
>>>> On Fri, Apr 1, 2022 at 8:38 AM Laurent Pinchart wrote:
>>>>> On Thu, Mar 31, 2022 at 05:12:13PM -0700, Abhinav Kumar wrote:
>>>>>> For some vendor driver implementations, display hardware can
>>>>>> be shared between the encoder used for writeback and the physical
>>>>>> display.
>>>>>>
>>>>>> In addition resources such as clocks and interrupts can
>>>>>> also be shared between writeback and the real encoder.
>>>>>>
>>>>>> To accommodate such vendor drivers and hardware, allow
>>>>>> real encoder to be passed for drm_writeback_connector.
>>>>>>
>>>>>> changes in v6:
>>>>>>         - assign the encoder inside
>>>>>>           drm_writeback_connector_init_with_encoder() for
>>>>>>           better readability
>>>>>>         - improve some documentation for internal encoder
>>>>>>
>>>>>> Co-developed-by: Kandpal Suraj <suraj.kandpal@intel.com>
>>>>>> Signed-off-by: Kandpal Suraj <suraj.kandpal@intel.com>
>>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/drm_writeback.c | 18 ++++++++++++------
>>>>>>    drivers/gpu/drm/vc4/vc4_txp.c   | 14 ++++++++------
>>>>>>    include/drm/drm_writeback.h     | 21 +++++++++++++++++++--
>>>>>
>>>>> Please split this in two patches, one for the DRM core and one for the
>>>>> VC4 driver. This applies to most patches as a general rule, with the
>>>>> main exception being API refactoring that requires changing the
>>>>> implementation and all its users in a single patch.
>>>>
>>>> But this *is* API refactoring ;-)
>>>
>>> Partly at least :-) Looking at the API change itself, wouldn't we
>>> minimize the extra changes to vc4 if we moved this patch before 3/4 ?
>>
>> I can move all the changes done in vc4 except below part to the change
>> 3/4 itself because that way I can show usage of vc4->drm_enc with the
>> new API. Let me know if that works.
> 
> What I meant is moving the API refactoring from 4/4 before the current
> 3/4, with minimal changes to vc4 there (only to avoid introducing a
> bisection breakge), and then move most of the vc4 changes from this
> patch to the current 3/4 (which will become 4/4). If that's what you
> meant too, it sounds good to me.

The API refactoring part in this patch is tied closely with changing the 
wb_connector's encoder to a pointer which breaks vc4.

I have not made any additional refactoring changes here.

So I am not sure how to decouple this more.

Thanks

Abhinav


> 
>> The only part which will remain is the below one:
>>
>> @@ -523,7 +525,7 @@  static int vc4_txp_bind(struct device *dev, struct
>> device *master, void *data)
>>    	if (ret)
>>    		return ret;
>>
>> -	encoder = &txp->connector.encoder;
>> +	encoder = txp->connector.encoder;
>>    	encoder->possible_crtcs = drm_crtc_mask(crtc);
>>
>> Since i dont know vc4 driver very well, I was not sure of a good way to
>> decouple this dependency.
>>
>> Let me know if that works.
>>
>>>>>>    3 files changed, 39 insertions(+), 14 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
>>>>>> index 797223c..7f72109 100644
>>>>>> --- a/drivers/gpu/drm/drm_writeback.c
>>>>>> +++ b/drivers/gpu/drm/drm_writeback.c
>>>>>> @@ -179,21 +179,21 @@ int drm_writeback_connector_init(struct drm_device *dev,
>>>>>>    {
>>>>>>         int ret = 0;
>>>>>>
>>>>>> -     drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
>>>>>> +     drm_encoder_helper_add(&wb_connector->internal_encoder, enc_helper_funcs);
>>>>>>
>>>>>> -     wb_connector->encoder.possible_crtcs = possible_crtcs;
>>>>>> +     wb_connector->internal_encoder.possible_crtcs = possible_crtcs;
>>>>>>
>>>>>> -     ret = drm_encoder_init(dev, &wb_connector->encoder,
>>>>>> +     ret = drm_encoder_init(dev, &wb_connector->internal_encoder,
>>>>>>                                &drm_writeback_encoder_funcs,
>>>>>>                                DRM_MODE_ENCODER_VIRTUAL, NULL);
>>>>>>         if (ret)
>>>>>>                 return ret;
>>>>>>
>>>>>> -     ret = drm_writeback_connector_init_with_encoder(dev, wb_connector, &wb_connector->encoder,
>>>>>> -                     con_funcs, formats, n_formats);
>>>>>> +     ret = drm_writeback_connector_init_with_encoder(dev, wb_connector,
>>>>>> +                     &wb_connector->internal_encoder, con_funcs, formats, n_formats);
>>>>>>
>>>>>>         if (ret)
>>>>>> -             drm_encoder_cleanup(&wb_connector->encoder);
>>>>>> +             drm_encoder_cleanup(&wb_connector->internal_encoder);
>>>>>>
>>>>>>         return ret;
>>>>>>    }
>>>>>> @@ -238,6 +238,12 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
>>>>>>         struct drm_mode_config *config = &dev->mode_config;
>>>>>>         int ret = create_writeback_properties(dev);
>>>>>>
>>>>>> +     /*
>>>>>> +      * Assign the encoder passed to this API to the wb_connector's encoder.
>>>>>> +      * For drm_writeback_connector_init(), this shall be the internal_encoder
>>>>>> +      */
>>>>>> +     wb_connector->encoder = enc;
>>>>>> +
>>>>>>         if (ret != 0)
>>>>>>                 return ret;
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
>>>>>> index 5e53f02..a9b4f83 100644
>>>>>> --- a/drivers/gpu/drm/vc4/vc4_txp.c
>>>>>> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
>>>>>> @@ -151,6 +151,8 @@ struct vc4_txp {
>>>>>>
>>>>>>         struct platform_device *pdev;
>>>>>>
>>>>>> +     struct drm_encoder drm_enc;
>>>>>> +
>>>>>>         struct drm_writeback_connector connector;
>>>>>>
>>>>>>         void __iomem *regs;
>>>>>> @@ -159,7 +161,7 @@ struct vc4_txp {
>>>>>>
>>>>>>    static inline struct vc4_txp *encoder_to_vc4_txp(struct drm_encoder *encoder)
>>>>>>    {
>>>>>> -     return container_of(encoder, struct vc4_txp, connector.encoder);
>>>>>> +     return container_of(encoder, struct vc4_txp, drm_enc);
>>>>>>    }
>>>>>>
>>>>>>    static inline struct vc4_txp *connector_to_vc4_txp(struct drm_connector *conn)
>>>>>> @@ -499,9 +501,9 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
>>>>>>
>>>>>>         wb_conn = &txp->connector;
>>>>>>
>>>>>> -     drm_encoder_helper_add(&wb_conn->encoder, &vc4_txp_encoder_helper_funcs);
>>>>>> +     drm_encoder_helper_add(&txp->drm_enc, &vc4_txp_encoder_helper_funcs);
>>>>>>
>>>>>> -     ret = drm_encoder_init(drm, &wb_conn->encoder,
>>>>>> +     ret = drm_encoder_init(drm, &txp->drm_enc,
>>>>>>                         &vc4_txp_encoder_funcs,
>>>>>>                         DRM_MODE_ENCODER_VIRTUAL, NULL);
>>>>>>
>>>>>> @@ -511,10 +513,10 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
>>>>>>         drm_connector_helper_add(&wb_conn->base,
>>>>>>                                  &vc4_txp_connector_helper_funcs);
>>>>>>
>>>>>> -     ret = drm_writeback_connector_init_with_encoder(drm, wb_conn, &wb_conn->encoder,
>>>>>> +     ret = drm_writeback_connector_init_with_encoder(drm, wb_conn, &txp->drm_enc,
>>>>>>                         &vc4_txp_connector_funcs, drm_fmts, ARRAY_SIZE(drm_fmts));
>>>>>>         if (ret) {
>>>>>> -             drm_encoder_cleanup(&wb_conn->encoder);
>>>>>> +             drm_encoder_cleanup(&txp->drm_enc);
>>>>>>                 return ret;
>>>>>>         }
>>>>>>
>>>>>> @@ -523,7 +525,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
>>>>>>         if (ret)
>>>>>>                 return ret;
>>>>>>
>>>>>> -     encoder = &txp->connector.encoder;
>>>>>> +     encoder = txp->connector.encoder;
>>>>>>         encoder->possible_crtcs = drm_crtc_mask(crtc);
>>>>>>
>>>>>>         ret = devm_request_irq(dev, irq, vc4_txp_interrupt, 0,
>>>>>> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
>>>>>> index 4795024..3f5c330 100644
>>>>>> --- a/include/drm/drm_writeback.h
>>>>>> +++ b/include/drm/drm_writeback.h
>>>>>> @@ -25,15 +25,32 @@ struct drm_writeback_connector {
>>>>>>         struct drm_connector base;
>>>>>>
>>>>>>         /**
>>>>>> -      * @encoder: Internal encoder used by the connector to fulfill
>>>>>> +      * @encoder: handle to drm_encoder used by the connector to fulfill
>>>>>>          * the DRM framework requirements. The users of the
>>>>>>          * @drm_writeback_connector control the behaviour of the @encoder
>>>>>>          * by passing the @enc_funcs parameter to drm_writeback_connector_init()
>>>>>>          * function.
>>>>>> +      *
>>>>>> +      * For some vendor drivers, the hardware resources are shared between
>>>>>> +      * writeback encoder and rest of the display pipeline.
>>>>>> +      * To accommodate such cases, encoder is a handle to the real encoder
>>>>>> +      * hardware.
>>>>>> +      *
>>>>>> +      * For current existing writeback users, this shall continue to be the
>>>>>> +      * embedded encoder for the writeback connector.
>>>>>>          */
>>>>>> -     struct drm_encoder encoder;
>>>>>> +     struct drm_encoder *encoder;
>>>>>>
>>>>>>         /**
>>>>>> +      * @internal_encoder: internal encoder used by writeback when
>>>>>> +      * drm_writeback_connector_init() is used.
>>>>>> +      * @encoder will be assigned to this for those cases
>>>>>> +      *
>>>>>> +      * This will be unused when drm_writeback_connector_init_with_encoder()
>>>>>> +      * is used.
>>>>>> +      */
>>>>>> +     struct drm_encoder internal_encoder;
>>>>>> +     /**
>>>>>>          * @pixel_formats_blob_ptr:
>>>>>>          *
>>>>>>          * DRM blob property data for the pixel formats list on writeback
> 
