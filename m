Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9564DCC5B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 18:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C3810E6C3;
	Thu, 17 Mar 2022 17:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B616610E6C1;
 Thu, 17 Mar 2022 17:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647538002; x=1679074002;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oNdtywjN4wzilxDf/GW4L02rf9BXAh5ZMxQ36BCkUAE=;
 b=HZaqsqX4i3tOzmrqfYeYCGBx06NYJJiXX8EUU0zfKlOWDTKBJLc27J1H
 nsSoHMvNrNfbL7PCzEG1lXD/MiNWOfHdeQ1smTkvFGW4vxEQdV3Oe0z9m
 RYKMGpxdKXb0OPyqAGzj+uqETfXuhEfTDubuSuXuSbKc/n6KHupjfHnZG A=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 17 Mar 2022 10:26:42 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:26:41 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 17 Mar 2022 10:26:40 -0700
Received: from [10.110.116.22] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 17 Mar
 2022 10:26:39 -0700
Message-ID: <4576a13a-ab85-5e8b-dcce-4b4e3563115f@quicinc.com>
Date: Thu, 17 Mar 2022 10:26:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 1/3] drm: allow real encoder to be passed for
 drm_writeback_connector
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <1647456498-32533-1-git-send-email-quic_abhinavk@quicinc.com>
 <1647456498-32533-2-git-send-email-quic_abhinavk@quicinc.com>
 <YjL2ehsuQZwkBuBZ@pendragon.ideasonboard.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <YjL2ehsuQZwkBuBZ@pendragon.ideasonboard.com>
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
 rodrigosiqueiramelo@gmail.com, jani.nikula@intel.com, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, melissa.srw@gmail.com,
 nganji@codeaurora.org, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 james.qian.wang@arm.com, quic_aravindh@quicinc.com, mihail.atanassov@arm.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent

Thanks for the review.

On 3/17/2022 1:51 AM, Laurent Pinchart wrote:
> Hi Abhinav,
> 
> Thank you for the patch.
> 
> On Wed, Mar 16, 2022 at 11:48:16AM -0700, Abhinav Kumar wrote:
>> For some vendor driver implementations, display hardware can
>> be shared between the encoder used for writeback and the physical
>> display.
>>
>> In addition resources such as clocks and interrupts can
>> also be shared between writeback and the real encoder.
>>
>> To accommodate such vendor drivers and hardware, allow
>> real encoder to be passed for drm_writeback_connector using a new
>> drm_writeback_connector_init_with_encoder() API.
> 
> The commit message doesn't match the commit.
Sorry, while splitting the change , I missed this part of the commit 
text. Will fix it up.
> 
>> In addition, to preserve the same call flows for the existing
>> users of drm_writeback_connector_init(), also allow passing
>> possible_crtcs as a parameter so that encoder can be initialized
>> with it.
>>
>> changes in v3:
>> 	- allow passing possible_crtcs for existing users of
>> 	  drm_writeback_connector_init()
>> 	- squash the vendor changes into the same commit so
>> 	  that each patch in the series can compile individually
>>
>> Co-developed-by: Kandpal Suraj <suraj.kandpal@intel.com>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   .../drm/arm/display/komeda/komeda_wb_connector.c   |   3 +-
>>   drivers/gpu/drm/arm/malidp_mw.c                    |   5 +-
>>   drivers/gpu/drm/drm_writeback.c                    | 103 +++++++++++++--------
>>   drivers/gpu/drm/rcar-du/rcar_du_writeback.c        |   5 +-
>>   drivers/gpu/drm/vc4/vc4_txp.c                      |  19 ++--
>>   drivers/gpu/drm/vkms/vkms_writeback.c              |   3 +-
>>   include/drm/drm_writeback.h                        |  22 ++++-
>>   7 files changed, 103 insertions(+), 57 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
>> index e465cc4..40774e6 100644
>> --- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
>> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
>> @@ -155,7 +155,6 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
>>   	kwb_conn->wb_layer = kcrtc->master->wb_layer;
>>   
>>   	wb_conn = &kwb_conn->base;
>> -	wb_conn->encoder.possible_crtcs = BIT(drm_crtc_index(&kcrtc->base));
>>   
>>   	formats = komeda_get_layer_fourcc_list(&mdev->fmt_tbl,
>>   					       kwb_conn->wb_layer->layer_type,
>> @@ -164,7 +163,7 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
>>   	err = drm_writeback_connector_init(&kms->base, wb_conn,
>>   					   &komeda_wb_connector_funcs,
>>   					   &komeda_wb_encoder_helper_funcs,
>> -					   formats, n_formats);
>> +					   formats, n_formats, BIT(drm_crtc_index(&kcrtc->base)));
>>   	komeda_put_fourcc_list(formats);
>>   	if (err) {
>>   		kfree(kwb_conn);
>> diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
>> index f5847a7..b882066 100644
>> --- a/drivers/gpu/drm/arm/malidp_mw.c
>> +++ b/drivers/gpu/drm/arm/malidp_mw.c
>> @@ -208,11 +208,12 @@ int malidp_mw_connector_init(struct drm_device *drm)
>>   	struct malidp_drm *malidp = drm->dev_private;
>>   	u32 *formats;
>>   	int ret, n_formats;
>> +	uint32_t possible_crtcs;
>>   
>>   	if (!malidp->dev->hw->enable_memwrite)
>>   		return 0;
>>   
>> -	malidp->mw_connector.encoder.possible_crtcs = 1 << drm_crtc_index(&malidp->crtc);
>> +	possible_crtcs = 1 << drm_crtc_index(&malidp->crtc);
>>   	drm_connector_helper_add(&malidp->mw_connector.base,
>>   				 &malidp_mw_connector_helper_funcs);
>>   
>> @@ -223,7 +224,7 @@ int malidp_mw_connector_init(struct drm_device *drm)
>>   	ret = drm_writeback_connector_init(drm, &malidp->mw_connector,
>>   					   &malidp_mw_connector_funcs,
>>   					   &malidp_mw_encoder_helper_funcs,
>> -					   formats, n_formats);
>> +					   formats, n_formats, possible_crtcs);
> 
> Do you need the local variable ?

Yes, we can dtop this. I just used this instead of "1 << 
drm_crtc_index(&malidp->crtc)" to simplify it.
No strong preference.

> 
>>   	kfree(formats);
>>   	if (ret)
>>   		return ret;
>> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
>> index dccf4504..17c1471 100644
>> --- a/drivers/gpu/drm/drm_writeback.c
>> +++ b/drivers/gpu/drm/drm_writeback.c
>> @@ -149,36 +149,15 @@ static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
>>   	.destroy = drm_encoder_cleanup,
>>   };
>>   
>> -/**
>> - * drm_writeback_connector_init - Initialize a writeback connector and its properties
>> - * @dev: DRM device
>> - * @wb_connector: Writeback connector to initialize
>> - * @con_funcs: Connector funcs vtable
>> - * @enc_helper_funcs: Encoder helper funcs vtable to be used by the internal encoder
>> - * @formats: Array of supported pixel formats for the writeback engine
>> - * @n_formats: Length of the formats array
>> - *
>> - * This function creates the writeback-connector-specific properties if they
>> - * have not been already created, initializes the connector as
>> - * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
>> - * values. It will also create an internal encoder associated with the
>> - * drm_writeback_connector and set it to use the @enc_helper_funcs vtable for
>> - * the encoder helper.
>> - *
>> - * Drivers should always use this function instead of drm_connector_init() to
>> - * set up writeback connectors.
>> - *
>> - * Returns: 0 on success, or a negative error code
>> - */
>> -int drm_writeback_connector_init(struct drm_device *dev,
>> -				 struct drm_writeback_connector *wb_connector,
>> -				 const struct drm_connector_funcs *con_funcs,
>> -				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
>> -				 const u32 *formats, int n_formats)
>> +static int drm_writeback_connector_setup(struct drm_device *dev,
>> +		struct drm_writeback_connector *wb_connector,
>> +		const struct drm_connector_funcs *con_funcs, const u32 *formats,
>> +		int n_formats)
>>   {
>>   	struct drm_property_blob *blob;
>> -	struct drm_connector *connector = &wb_connector->base;
>>   	struct drm_mode_config *config = &dev->mode_config;
>> +	struct drm_connector *connector = &wb_connector->base;
>> +
>>   	int ret = create_writeback_properties(dev);
>>   
>>   	if (ret != 0)
>> @@ -186,15 +165,10 @@ int drm_writeback_connector_init(struct drm_device *dev,
>>   
>>   	blob = drm_property_create_blob(dev, n_formats * sizeof(*formats),
>>   					formats);
>> -	if (IS_ERR(blob))
>> -		return PTR_ERR(blob);
>> -
>> -	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
>> -	ret = drm_encoder_init(dev, &wb_connector->encoder,
>> -			       &drm_writeback_encoder_funcs,
>> -			       DRM_MODE_ENCODER_VIRTUAL, NULL);
>> -	if (ret)
>> -		goto fail;
>> +	if (IS_ERR(blob)) {
>> +		ret = PTR_ERR(blob);
>> +		return ret;
>> +	}
>>   
>>   	connector->interlace_allowed = 0;
>>   
>> @@ -204,7 +178,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
>>   		goto connector_fail;
>>   
>>   	ret = drm_connector_attach_encoder(connector,
>> -						&wb_connector->encoder);
>> +						wb_connector->encoder);
>>   	if (ret)
>>   		goto attach_fail;
>>   
>> @@ -233,11 +207,62 @@ int drm_writeback_connector_init(struct drm_device *dev,
>>   attach_fail:
>>   	drm_connector_cleanup(connector);
>>   connector_fail:
>> -	drm_encoder_cleanup(&wb_connector->encoder);
>> -fail:
>>   	drm_property_blob_put(blob);
>>   	return ret;
>>   }
>> +
>> +/**
>> + * drm_writeback_connector_init - Initialize a writeback connector and its properties
>> + * using an internal encoder
>> + *
>> + * @dev: DRM device
>> + * @wb_connector: Writeback connector to initialize
>> + * @con_funcs: Connector funcs vtable
>> + * @enc_helper_funcs: Encoder helper funcs vtable to be used by the internal encoder
>> + * @formats: Array of supported pixel formats for the writeback engine
>> + * @n_formats: Length of the formats array
>> + * @possible_crtcs: possible crtcs for the internal writeback encoder
>> + *
>> + * This function creates the writeback-connector-specific properties if they
>> + * have not been already created, initializes the connector as
>> + * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
>> + * values. It will also create an internal encoder associated with the
>> + * drm_writeback_connector and set it to use the @enc_helper_funcs vtable for
>> + * the encoder helper.
>> + *
>> + * Drivers should always use this function instead of drm_connector_init() to
>> + * set up writeback connectors.
>> + *
>> + * Returns: 0 on success, or a negative error code
>> + */
>> +int drm_writeback_connector_init(struct drm_device *dev,
>> +		struct drm_writeback_connector *wb_connector,
>> +		const struct drm_connector_funcs *con_funcs,
>> +		const struct drm_encoder_helper_funcs *enc_helper_funcs,
>> +		const u32 *formats, int n_formats, uint32_t possible_crtcs)
>> +{
>> +	int ret = 0;
>> +
>> +	wb_connector->encoder = &wb_connector->internal_encoder;
>> +
>> +	drm_encoder_helper_add(wb_connector->encoder, enc_helper_funcs);
>> +
>> +	wb_connector->encoder->possible_crtcs = possible_crtcs;
>> +
>> +	ret = drm_encoder_init(dev, wb_connector->encoder,
>> +			       &drm_writeback_encoder_funcs,
>> +			       DRM_MODE_ENCODER_VIRTUAL, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = drm_writeback_connector_setup(dev, wb_connector, con_funcs, formats,
>> +			n_formats);
>> +
>> +	if (ret)
>> +		drm_encoder_cleanup(wb_connector->encoder);
>> +
>> +	return ret;
>> +}
> 
> All this doesn't belong to this patch. Just add the possible_crtcs
> argument to drm_writeback_connector_init() in 1/3, nothing else. One
> functional change, one patch.

Ok, so let me re-factor the series like this:

1) possible_crtcs argument along with other vendor changes
2) changing encoder to a pointer with changes to vc4
3) adding a new API drm_writeback_connector_init_with_encoder() with the 
cleanup in the drm_writeback
4) changing vc4 to use the new API

Let me know what you think.

> 
>>   EXPORT_SYMBOL(drm_writeback_connector_init);
>>   
>>   int drm_writeback_set_fb(struct drm_connector_state *conn_state,
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
>> index c79d125..1a610c0 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
>> @@ -199,8 +199,9 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
>>   			   struct rcar_du_crtc *rcrtc)
>>   {
>>   	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
>> +	uint32_t possible_crtcs;
>>   
>> -	wb_conn->encoder.possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
>> +	possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
>>   	drm_connector_helper_add(&wb_conn->base,
>>   				 &rcar_du_wb_conn_helper_funcs);
>>   
>> @@ -208,7 +209,7 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
>>   					    &rcar_du_wb_conn_funcs,
>>   					    &rcar_du_wb_enc_helper_funcs,
>>   					    writeback_formats,
>> -					    ARRAY_SIZE(writeback_formats));
>> +					    ARRAY_SIZE(writeback_formats), possible_crtcs);
> 
> Same here, do you need the intermediate variable ?

> 
> And please add a line break after ARRAY_SIZE().
Ok will do
> 
>>   }
>>   
>>   void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
>> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
>> index 9809ca3..32c4fb0 100644
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
>> @@ -492,12 +495,14 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
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
>> -					   &vc4_txp_connector_funcs,
>> -					   &vc4_txp_encoder_helper_funcs,
>> -					   drm_fmts, ARRAY_SIZE(drm_fmts));
>> +	ret = drm_writeback_connector_init(drm, wb_conn,
>> +			&vc4_txp_connector_funcs, &vc4_txp_encoder_helper_funcs,
>> +			drm_fmts, ARRAY_SIZE(drm_fmts), 0);
> 
> Most of this also doesn't belong to this patch.
> 
>>   	if (ret)
>>   		return ret;
>>   
>> @@ -506,7 +511,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
>>   	if (ret)
>>   		return ret;
>>   
>> -	encoder = &txp->connector.encoder;
>> +	encoder = txp->connector.encoder;
>>   	encoder->possible_crtcs = drm_crtc_mask(crtc);
>>   
>>   	ret = devm_request_irq(dev, irq, vc4_txp_interrupt, 0,
>> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
>> index 8694227..381e7b7 100644
>> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
>> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
>> @@ -140,12 +140,11 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
>>   {
>>   	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
>>   
>> -	vkmsdev->output.wb_connector.encoder.possible_crtcs = 1;
>>   	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
>>   
>>   	return drm_writeback_connector_init(&vkmsdev->drm, wb,
>>   					    &vkms_wb_connector_funcs,
>>   					    &vkms_wb_encoder_helper_funcs,
>>   					    vkms_wb_formats,
>> -					    ARRAY_SIZE(vkms_wb_formats));
>> +					    ARRAY_SIZE(vkms_wb_formats), 1);
>>   }
>> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
>> index 9697d27..5e002bc 100644
>> --- a/include/drm/drm_writeback.h
>> +++ b/include/drm/drm_writeback.h
>> @@ -25,13 +25,29 @@ struct drm_writeback_connector {
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
>> +	 *
>> +	 */
>> +	struct drm_encoder *encoder;
>> +
>> +	/**
>> +	 * @internal_encoder: internal encoder used by writeback when
>> +	 * a real encoder is not provided by the vendor drm drivers.
>> +	 * @encoder will be assigned to this for those cases.
>>   	 */
>> -	struct drm_encoder encoder;
>> +	struct drm_encoder internal_encoder;
> 
> None of this belong here.
Alright, will split to the next patch.
> 
>>   
>>   	/**
>>   	 * @pixel_formats_blob_ptr:
>> @@ -150,7 +166,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
>>   				 struct drm_writeback_connector *wb_connector,
>>   				 const struct drm_connector_funcs *con_funcs,
>>   				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
>> -				 const u32 *formats, int n_formats);
>> +				 const u32 *formats, int n_formats, uint32_t possible_crtcs);
>>   
>>   int drm_writeback_set_fb(struct drm_connector_state *conn_state,
>>   			 struct drm_framebuffer *fb);
> 
