Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092B64DA621
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 00:13:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DC110E44D;
	Tue, 15 Mar 2022 23:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0C110E453;
 Tue, 15 Mar 2022 23:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647386011; x=1678922011;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=eWjCojix21CuSs2nNwQd4tk2QbCnWTkgycj4IaowDDU=;
 b=GJ59YL7+5rrC4S+/Gp0xroXbEc7t9nkHq8I8UgkuPdO/d8JTJH8CQAlL
 SUWkZlEegwmpffjOs/n/X1Or6ZM8aPDikDr88Y8hF6woxteJAPd3l6ePO
 quruedg9nzINekvVGykwgV/W/yV1gPcEdlG5/FRgL1A5YyWzjVsQxf96u I=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Mar 2022 16:13:31 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 16:13:30 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Mar 2022 16:13:30 -0700
Received: from [10.110.56.216] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 15 Mar
 2022 16:13:29 -0700
Message-ID: <cb614a1c-7383-ce43-2e00-79b70e9dfe82@quicinc.com>
Date: Tue, 15 Mar 2022 16:13:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 5/6] drm/rcar_du: use drm_encoder pointer for
 drm_writeback_connector
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <1646963400-25606-1-git-send-email-quic_abhinavk@quicinc.com>
 <1646963400-25606-6-git-send-email-quic_abhinavk@quicinc.com>
 <Yir6M150BkXPyH2b@pendragon.ideasonboard.com>
 <e31334cf-7e3b-e330-98af-545a07ebff33@quicinc.com>
 <Yi4EmSDj04KdslxP@pendragon.ideasonboard.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <Yi4EmSDj04KdslxP@pendragon.ideasonboard.com>
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
 rodrigosiqueiramelo@gmail.com, jani.nikula@intel.com, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, melissa.srw@gmail.com,
 nganji@codeaurora.org, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 james.qian.wang@arm.com, quic_aravindh@quicinc.com, mihail.atanassov@arm.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent

Thank you for your inputs.

I liked all the suggestions, hence I have incorporated those and pushed 
a v2.

Thanks

Abhinav

On 3/13/2022 7:50 AM, Laurent Pinchart wrote:
> Hi Abhinav
> 
> On Fri, Mar 11, 2022 at 09:47:17AM -0800, Abhinav Kumar wrote:
>> On 3/10/2022 11:28 PM, Laurent Pinchart wrote:
>>> On Thu, Mar 10, 2022 at 05:49:59PM -0800, Abhinav Kumar wrote:
>>>> Make changes to rcar_du driver to start using drm_encoder pointer
>>>> for drm_writeback_connector.
>>>>
>>>> Co-developed-by: Kandpal Suraj <suraj.kandpal@intel.com>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/rcar-du/rcar_du_writeback.c | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
>>>> index c79d125..03930ad 100644
>>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
>>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
>>>> @@ -200,7 +200,8 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
>>>>    {
>>>>    	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
>>>>    
>>>> -	wb_conn->encoder.possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
>>>> +	wb_conn->encoder = kzalloc(sizeof(struct drm_encoder), GFP_KERNEL);
>>>
>>> Where is this freed ?
>>
>> You are right, this isnt. Looking more into this, it seems like moving
>> the allocation of encoder to drm_writeback.c for cases which dont pass a
>> real encoder is much better so that I will not have to add alloc() /
>> free() code for all the vendor driver changes which is what I originally
>> thought in my RFC but changed my mind because of below.
> 
> Yes, I think that would be better indeed. You could even skip the
> dynamic allocation, you could have
> 
> 	struct drm_encoder *encoder;
> 	struct drm_encoder internal_encoder;
> 
> in drm_writeback_connector, and set
> 
> 	wb->encoder = &wb->internal_encoder;
> 
> when the user doesn't pass an encoder.
> 
>>>> +	wb_conn->encoder->possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
>>
>> Do you think we can just move usage of wb_conn->encoder->possible_crtcs
>> just right after drm_writeback_connector_init() so that it wont crash?
> 
> How about adding a possible_crtcs argument to
> drm_writeback_connector_init() (to cover existing use cases), and adding
> a new drm_writeback_connector_init_with_encoder() that would get an
> encoder pointer (and expect possible_crtcs, as well as all the other
> appropriate encoder fields, having been initialized) ?
> 
>> 198 int rcar_du_writeback_init(struct rcar_du_device *rcdu,
>> 199 			   struct rcar_du_crtc *rcrtc)
>> 200 {
>> 201 	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
>> 202
>> 203 	wb_conn->encoder.possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
>> 204 	drm_connector_helper_add(&wb_conn->base,
>> 205 				 &rcar_du_wb_conn_helper_funcs);
>> 206
>> 207 	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
>> 208 					    &rcar_du_wb_conn_funcs,
>> 209 					    &rcar_du_wb_enc_helper_funcs,
>> 210 					    writeback_formats,
>> 211 					    ARRAY_SIZE(writeback_formats));
>> 212 }
>>
>>>>    	drm_connector_helper_add(&wb_conn->base,
>>>>    				 &rcar_du_wb_conn_helper_funcs);
>>>>    
> 
