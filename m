Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 286084E2FC1
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 19:15:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1D510E2D7;
	Mon, 21 Mar 2022 18:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C865410E2D7;
 Mon, 21 Mar 2022 18:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647886532; x=1679422532;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=b0kzpAGotY9JdCCSVKfCb1jHSbSMXFTsZea/xGiGkhY=;
 b=RlMh0VapOVe82gBOm0F1lRIrnJTUoICY8dfcZ8uR2PCb4tXz8rLjpEFM
 yexF64lpbcJVJeCMnJ4xqNt9k6W9vT6HB2WgeBzzZYDOOysaoMJ/8BtM5
 GoYITmT4JBZKaRgTHbdH4PRZxT+rTqaecR+JYLiOd7ayZgG6V8rq5V6xc 8=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 21 Mar 2022 11:15:32 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 11:15:31 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 21 Mar 2022 11:15:30 -0700
Received: from [10.110.84.83] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 21 Mar
 2022 11:15:29 -0700
Message-ID: <8cb81e9d-6c3a-628a-b7b4-9aff200e09b8@quicinc.com>
Date: Mon, 21 Mar 2022 11:15:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4 2/4] drm: allow real encoder to be passed for
 drm_writeback_connector
Content-Language: en-US
To: Liviu Dudau <liviu.dudau@arm.com>
References: <1647567936-11971-1-git-send-email-quic_abhinavk@quicinc.com>
 <1647567936-11971-3-git-send-email-quic_abhinavk@quicinc.com>
 <Yji06AeNokYeiOPq@e110455-lin.cambridge.arm.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <Yji06AeNokYeiOPq@e110455-lin.cambridge.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
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

Hi Livid

Thanks for your review.

All your comments are valid. I think I should re-order the patches like 
you have suggested. That should address all comments.

Thanks

Abhinav

On 3/21/2022 10:24 AM, Liviu Dudau wrote:
> On Thu, Mar 17, 2022 at 06:45:34PM -0700, Abhinav Kumar wrote:
>> For some vendor driver implementations, display hardware can
>> be shared between the encoder used for writeback and the physical
>> display.
>>
>> In addition resources such as clocks and interrupts can
>> also be shared between writeback and the real encoder.
>>
>> To accommodate such vendor drivers and hardware, allow
>> real encoder to be passed for drm_writeback_connector.
>>
>> changes in v4:
>> 	- split the possible_crtcs change and the parts which should
>> 	  belong to the addition of new API to the next change
>>
>> Co-developed-by: Kandpal Suraj <suraj.kandpal@intel.com>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/drm_writeback.c | 12 +++++++-----
>>   drivers/gpu/drm/vc4/vc4_txp.c   | 14 ++++++++++----
>>   include/drm/drm_writeback.h     | 18 ++++++++++++++++--
>>   3 files changed, 33 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
>> index dc2ef12..a4c17d6 100644
>> --- a/drivers/gpu/drm/drm_writeback.c
>> +++ b/drivers/gpu/drm/drm_writeback.c
>> @@ -190,11 +190,13 @@ int drm_writeback_connector_init(struct drm_device *dev,
>>   	if (IS_ERR(blob))
>>   		return PTR_ERR(blob);
>>   
>> -	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
>> +	drm_encoder_helper_add(wb_connector->encoder, enc_helper_funcs);
>>   
>> -	wb_connector->encoder.possible_crtcs = possible_crtcs;
>> +	wb_connector->encoder = &wb_connector->internal_encoder;
> 
> You need to check here that the wb_connector doesn't have already an attached encoder
> before you overwrite the pointer with the internal encoder.
> 
>>   
>> -	ret = drm_encoder_init(dev, &wb_connector->encoder,
>> +	wb_connector->encoder->possible_crtcs = possible_crtcs;
>> +
>> +	ret = drm_encoder_init(dev, wb_connector->encoder,
>>   			       &drm_writeback_encoder_funcs,
>>   			       DRM_MODE_ENCODER_VIRTUAL, NULL);
> 
> Here you have initialised the encoder pointed at by wb_connector->encoder, which is
> always wb_connector->internal_encoder with your code.
> 
>>   	if (ret)
>> @@ -208,7 +210,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
>>   		goto connector_fail;
>>   
>>   	ret = drm_connector_attach_encoder(connector,
>> -						&wb_connector->encoder);
>> +						wb_connector->encoder);
>>   	if (ret)
>>   		goto attach_fail;
>>   
>> @@ -237,7 +239,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
>>   attach_fail:
>>   	drm_connector_cleanup(connector);
>>   connector_fail:
>> -	drm_encoder_cleanup(&wb_connector->encoder);
>> +	drm_encoder_cleanup(wb_connector->encoder);
>>   fail:
>>   	drm_property_blob_put(blob);
>>   	return ret;
>> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
>> index 3447eb6..341a9be5 100644
>> --- a/drivers/gpu/drm/vc4/vc4_txp.c
>> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
>> @@ -151,6 +151,8 @@ struct vc4_txp {
>>   
>>   	struct platform_device *pdev;
>>   
>> +	struct drm_encoder drm_enc;
>> +
>>   	struct drm_writeback_connector connector;
>>   
>>   	void __iomem *regs;
>> @@ -159,7 +161,7 @@ struct vc4_txp {
>>   
>>   static inline struct vc4_txp *encoder_to_vc4_txp(struct drm_encoder *encoder)
>>   {
>> -	return container_of(encoder, struct vc4_txp, connector.encoder);
>> +	return container_of(encoder, struct vc4_txp, drm_enc);
>>   }
>>   
>>   static inline struct vc4_txp *connector_to_vc4_txp(struct drm_connector *conn)
>> @@ -467,6 +469,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
>>   	struct vc4_txp *txp;
>>   	struct drm_crtc *crtc;
>>   	struct drm_encoder *encoder;
>> +	struct drm_writeback_connector *wb_conn;
>>   	int ret, irq;
>>   
>>   	irq = platform_get_irq(pdev, 0);
>> @@ -492,9 +495,12 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
>>   	txp->regset.regs = txp_regs;
>>   	txp->regset.nregs = ARRAY_SIZE(txp_regs);
>>   
>> -	drm_connector_helper_add(&txp->connector.base,
>> +	wb_conn = &txp->connector;
>> +	wb_conn->encoder = &txp->drm_enc;
>> +
>> +	drm_connector_helper_add(&wb_conn->base,
>>   				 &vc4_txp_connector_helper_funcs);
>> -	ret = drm_writeback_connector_init(drm, &txp->connector,
>> +	ret = drm_writeback_connector_init(drm, wb_conn,
>>   					   &vc4_txp_connector_funcs,
>>   					   &vc4_txp_encoder_helper_funcs,
>>   					   drm_fmts, ARRAY_SIZE(drm_fmts),
> 
> This call will never initialise the txp->drm_enc, as per my comments above. However
> if this was the intent, it's fine, but then you need to add a drm_encoder_init() call
> here for txp->drm_enc. Otherwise, you need to stop overwriting the pointer in
> drm_writeback_connector_init().
> 
>> @@ -507,7 +513,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
>>   	if (ret)
>>   		return ret;
>>   
>> -	encoder = &txp->connector.encoder;
>> +	encoder = txp->connector.encoder;
>>   	encoder->possible_crtcs = drm_crtc_mask(crtc);
>>   
>>   	ret = devm_request_irq(dev, irq, vc4_txp_interrupt, 0,
>> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
>> index db6214f..c525b60 100644
>> --- a/include/drm/drm_writeback.h
>> +++ b/include/drm/drm_writeback.h
>> @@ -25,15 +25,29 @@ struct drm_writeback_connector {
>>   	struct drm_connector base;
>>   
>>   	/**
>> -	 * @encoder: Internal encoder used by the connector to fulfill
>> +	 * @encoder: handle to drm_encoder used by the connector to fulfill
>>   	 * the DRM framework requirements. The users of the
>>   	 * @drm_writeback_connector control the behaviour of the @encoder
>>   	 * by passing the @enc_funcs parameter to drm_writeback_connector_init()
>>   	 * function.
>> +	 *
>> +	 * For some vendor drivers, the hardware resources are shared between
>> +	 * writeback encoder and rest of the display pipeline.
>> +	 * To accommodate such cases, encoder is a handle to the real encoder
>> +	 * hardware.
>> +	 *
>> +	 * For current existing writeback users, this shall continue to be the
>> +	 * embedded encoder for the writeback connector.
>>   	 */
>> -	struct drm_encoder encoder;
>> +	struct drm_encoder *encoder;
>>   
>>   	/**
>> +	 * @internal_encoder: internal encoder used by writeback when
>> +	 * a real encoder is not provided by the vendor drm drivers.
>> +	 * @encoder will be assigned to this for those cases.
>> +	 */
>> +	struct drm_encoder internal_encoder;
>> +	/**
>>   	 * @pixel_formats_blob_ptr:
>>   	 *
>>   	 * DRM blob property data for the pixel formats list on writeback
>> -- 
>> 2.7.4
>>
> 
> You need to come up with a bit more sophisticated algorithm for allowing drivers to
> pass on a connector with a pre-allocated encoder. If the encoder is pre-populated
> then you need to decide if drm_writeback_connector_init() will initialise the encoder
> too or if it's going to assume that it has been already initialised (in which case
> the error path where we call drm_encoder_cleanup() also needs to know if we're using
> the internal encoder or not and act accordingly).
> 
> Otherwise the code looks pretty good, thanks for the improvements.
> 
> Best regards,
> Liviu
> 
> 
> 
