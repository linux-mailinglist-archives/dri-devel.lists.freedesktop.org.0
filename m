Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EF149EA35
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 19:17:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5795910E225;
	Thu, 27 Jan 2022 18:17:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CDD10E225;
 Thu, 27 Jan 2022 18:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1643307431; x=1674843431;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LH/dLY3/xP57RI7hIyFyatowVgY9IFKrdHM0BLdG+BU=;
 b=ZdqGA8HPqUKYBKVgar+iVTNg3pxXAz5gvEgS1fxGphd2sl0wWcIg9WYc
 NYdaPwjg5QW9yGJx4sYbyRsyg2tZb1+x/y3NX+n7RX2jeVEvuqhx2STeU
 pcs3ii8ep0bj+RN2LQo0+VcKvZiENGKT3zYaMTV1VmTL7azrMpwh11UZR w=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 27 Jan 2022 10:17:10 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 10:17:09 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 27 Jan 2022 10:17:09 -0800
Received: from [10.111.163.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 27 Jan
 2022 10:17:07 -0800
Message-ID: <da26d67f-3212-2434-1b23-c5f9209dce41@quicinc.com>
Date: Thu, 27 Jan 2022 10:17:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] drm: add writeback pointers to drm_connector
Content-Language: en-US
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20220111101801.28310-1-suraj.kandpal@intel.com>
 <c797223b-47cb-3fcd-0a1a-b12fd2c2c0da@quicinc.com>
 <CY4PR11MB1352DAB3BD614093B5154C10E3219@CY4PR11MB1352.namprd11.prod.outlook.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CY4PR11MB1352DAB3BD614093B5154C10E3219@CY4PR11MB1352.namprd11.prod.outlook.com>
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "Kandpal@freedesktop.org" <Kandpal@freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Suraj

Thanks for the response.

I was not too worried about the intel driver as I am sure you must have 
validated this change with that :)

My question was more for the other vendor writeback drivers.

Thanks for looking into the others and providing the snippets.
After looking at those, yes I also think it should work.

So, if others do not have any concern with this change,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

On 1/27/2022 1:33 AM, Kandpal, Suraj wrote:
>>
>> + laurent on this
>>
>> Hi Suraj
>> Jani pointed me to this thread as i had posted something similar here :
>> https://patchwork.freedesktop.org/patch/470296/ but since this thread was
>> posted earlier, we can discuss further here.
>>
>> Overall, its similar to what I had posted in the RFC and your commit text also
>> covers my concerns too.
>>
>> One question I have about your change is since you have changed
>> wb_connector::encoder to be a pointer, i saw the other changes in the series
>> but they do not allocate an encoder. Would this not affect the other drivers
>> which are assuming that the encoder in wb_connector is struct drm_encoder
>> encoder and not struct drm_encoder* encoder.
>>
>> Your changes fix the compilation issue but wouldnt this crash as encoder
>> wasnt allocated for other drivers.
>>
> 
> Hi Abhinav,
> That shouldn't be an issue as normally drivers tend to have their own output
> structure which has drm_connector and drm_encoder embedded in it depending
> on the level of binding they have decided to give the connector and encoder in
> their respective output and the addresses of these are passed to the
> drm_connector* and drm_encoder* in drm_writeback_connector structure
> which then gets initialized in drm_writeback_connector_init().
> 
> In our i915 code we have intel_connector structure with drm_connector base
> field and intel_wd with a intel_encoder base which in turn has drm_encoder
> field and both intel_connector and intel_wd are initialized not requiring explicit
> alloc and dealloc for drm_encoder
> intel_wd = kzalloc(sizeof(*intel_wd), GFP_KERNEL);
> 
> intel_connector = intel_connector_alloc();
> wb_conn = &intel_connector->wb_conn;
> wb_conn->base = &intel_connector->base;
> wb_conn->encoder = &intel_wd->base.base;
> 
> Similary for komeda driver has
> struct komeda_wb_connector {
>          struct drm_connector conn;
>          /** @base: &drm_writeback_connector */
>          struct drm_writeback_connector base;
> 
>          /** @wb_layer: represents associated writeback pipeline of komeda */
>          struct komeda_layer *wb_layer;
> };
> 
> static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
>                                     struct komeda_crtc *kcrtc)
> {
> 	struct komeda_wb_connector *kwb_conn;
> 	struct drm_writeback_connector *wb_conn;
> 	
> 	kwb_conn = kzalloc(sizeof(*kwb_conn), GFP_KERNEL);
> 
> 	wb_conn = &kwb_conn->base;
>          	wb_conn->base = &kwb_conn->conn;
>        
> and they do not depend on the encoder binding so changes will work for them
> Also in vkms driver we have the
> struct vkms_output {
>          struct drm_crtc crtc;
>          struct drm_encoder encoder;
>          struct drm_connector connector;
>          struct drm_writeback_connector wb_connector;
>          struct hrtimer vblank_hrtimer;
>          ktime_t period_ns;
>          struct drm_pending_vblank_event *event;
>          /* ordered wq for composer_work */
>          struct workqueue_struct *composer_workq;
>          /* protects concurrent access to composer */
>          spinlock_t lock;
> 
>          /* protected by @lock */
>          bool composer_enabled;
>          struct vkms_crtc_state *composer_state;
> 
>          spinlock_t composer_lock;
> };
> 
> Which gets allocated covering for the drm_encoder alloc and dealloc
> 
> Regards,
> Suraj Kandpal
> 
