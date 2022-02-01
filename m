Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 084734A54C1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 02:42:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C76410E4E3;
	Tue,  1 Feb 2022 01:42:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A6310E4D6;
 Tue,  1 Feb 2022 01:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1643679764; x=1675215764;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=ARxs6Siaik7Hb0T1RxTOkACw5y3/pq9r1rIyQ1TtUu0=;
 b=T7mJVALx6uDmKAAYDabInr+vgoAsDbaneb6CGMZd4u74UJ+k3SWThZ5k
 FwuzpOlLPnmZf1RMAfmVPbVvZILmy+TudeZaycm2Pv1JhvyN4BDsPSFjo
 v5SQnrJY72qzaqY9D5f4BOW0RrJMOzQy99ibYi41Fm2SmDIm1+IkPXOqI g=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 31 Jan 2022 17:42:42 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 17:42:41 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 31 Jan 2022 17:42:40 -0800
Received: from [10.111.160.150] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 31 Jan
 2022 17:42:38 -0800
Message-ID: <d944e4f2-9412-1908-6f13-a6e1a7730cfd@quicinc.com>
Date: Mon, 31 Jan 2022 17:42:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] drm: add writeback pointers to drm_connector
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20220111101801.28310-1-suraj.kandpal@intel.com>
 <c797223b-47cb-3fcd-0a1a-b12fd2c2c0da@quicinc.com>
 <CY4PR11MB1352DAB3BD614093B5154C10E3219@CY4PR11MB1352.namprd11.prod.outlook.com>
 <da26d67f-3212-2434-1b23-c5f9209dce41@quicinc.com>
In-Reply-To: <da26d67f-3212-2434-1b23-c5f9209dce41@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "Kandpal@freedesktop.org" <Kandpal@freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Suraj

I think there are more places affected with this change. I can get below 
compilation issues while trying to compile my branch:

drivers/gpu/drm/vc4/vc4_txp.c: In function ‘encoder_to_vc4_txp’:
./include/linux/build_bug.h:78:41: error: static assertion failed: 
"pointer type mismatch in container_of()"
  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                          ^
./include/linux/build_bug.h:77:34: note: in expansion of macro 
‘__static_assert’
  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, 
#expr)
                                   ^
./include/linux/container_of.h:19:2: note: in expansion of macro 
‘static_assert’
   static_assert(__same_type(*(ptr), ((type *)0)->member) || \
   ^
drivers/gpu/drm/vc4/vc4_txp.c:162:9: note: in expansion of macro 
‘container_of’
   return container_of(encoder, struct vc4_txp, connector.encoder);
          ^
drivers/gpu/drm/vc4/vc4_txp.c: In function ‘connector_to_vc4_txp’:
./include/linux/build_bug.h:78:41: error: static assertion failed: 
"pointer type mismatch in container_of()"
  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                          ^
./include/linux/build_bug.h:77:34: note: in expansion of macro 
‘__static_assert’
  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, 
#expr)
                                   ^
./include/linux/container_of.h:19:2: note: in expansion of macro 
‘static_assert’
   static_assert(__same_type(*(ptr), ((type *)0)->member) || \
   ^
drivers/gpu/drm/vc4/vc4_txp.c:167:9: note: in expansion of macro 
‘container_of’
   return container_of(conn, struct vc4_txp, connector.base);
          ^
drivers/gpu/drm/vc4/vc4_txp.c: In function ‘vc4_txp_bind’:
drivers/gpu/drm/vc4/vc4_txp.c:495:27: error: passing argument 1 of 
‘drm_connector_helper_add’ from incompatible pointer type 
[-Werror=incompatible-pointer-types]
   drm_connector_helper_add(&txp->connector.base,
                            ^
In file included from ./include/drm/drm_atomic_helper.h:32:0,
                  from drivers/gpu/drm/vc4/vc4_txp.c:17:
./include/drm/drm_modeset_helper_vtables.h:1153:20: note: expected 
‘struct drm_connector *’ but argument is of type ‘struct drm_connector **’
  static inline void drm_connector_helper_add(struct drm_connector 
*connector,
                     ^
drivers/gpu/drm/vc4/vc4_txp.c:509:10: error: assignment from 
incompatible pointer type [-Werror=incompatible-pointer-types]
   encoder = &txp->connector.encoder;
           ^
drivers/gpu/drm/vc4/vc4_txp.c: In function ‘vc4_txp_unbind’:
drivers/gpu/drm/vc4/vc4_txp.c:532:28: error: passing argument 1 of 
‘vc4_txp_connector_destroy’ from incompatible pointer type 
[-Werror=incompatible-pointer-types]
   vc4_txp_connector_destroy(&txp->connector.base);
                             ^
drivers/gpu/drm/vc4/vc4_txp.c:333:13: note: expected ‘struct 
drm_connector *’ but argument is of type ‘struct drm_connector **’
  static void vc4_txp_connector_destroy(struct drm_connector *connector)


Looks like vc4 doesnt have its own encoder so we might have to move it
to have its own?

struct vc4_txp {
     struct vc4_crtc base;

     struct platform_device *pdev;

     struct drm_writeback_connector connector;

     void __iomem *regs;
     struct debugfs_regset32 regset;
};

static inline struct vc4_txp *encoder_to_vc4_txp(struct drm_encoder 
*encoder)
{
     return container_of(encoder, struct vc4_txp, connector.encoder);
}

static inline struct vc4_txp *connector_to_vc4_txp(struct drm_connector 
*conn)
{
     return container_of(conn, struct vc4_txp, connector.base);
}


One more thing, it looks like to me, we need to do one more thing.

Like intel does and what MSM will do, the encoder pointer of the wb 
connector has to point to the encoder struct .

 >> wb_conn = &intel_connector->wb_conn;
 >> wb_conn->base = &intel_connector->base;
 >> wb_conn->encoder = &intel_wd->base.base;

Thanks

Abhinav
On 1/27/2022 10:17 AM, Abhinav Kumar wrote:
> Hi Suraj
> 
> Thanks for the response.
> 
> I was not too worried about the intel driver as I am sure you must have 
> validated this change with that :)
> 
> My question was more for the other vendor writeback drivers.
> 
> Thanks for looking into the others and providing the snippets.
> After looking at those, yes I also think it should work.
> 
> So, if others do not have any concern with this change,
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> On 1/27/2022 1:33 AM, Kandpal, Suraj wrote:
>>>
>>> + laurent on this
>>>
>>> Hi Suraj
>>> Jani pointed me to this thread as i had posted something similar here :
>>> https://patchwork.freedesktop.org/patch/470296/ but since this thread 
>>> was
>>> posted earlier, we can discuss further here.
>>>
>>> Overall, its similar to what I had posted in the RFC and your commit 
>>> text also
>>> covers my concerns too.
>>>
>>> One question I have about your change is since you have changed
>>> wb_connector::encoder to be a pointer, i saw the other changes in the 
>>> series
>>> but they do not allocate an encoder. Would this not affect the other 
>>> drivers
>>> which are assuming that the encoder in wb_connector is struct 
>>> drm_encoder
>>> encoder and not struct drm_encoder* encoder.
>>>
>>> Your changes fix the compilation issue but wouldnt this crash as encoder
>>> wasnt allocated for other drivers.
>>>
>>
>> Hi Abhinav,
>> That shouldn't be an issue as normally drivers tend to have their own 
>> output
>> structure which has drm_connector and drm_encoder embedded in it 
>> depending
>> on the level of binding they have decided to give the connector and 
>> encoder in
>> their respective output and the addresses of these are passed to the
>> drm_connector* and drm_encoder* in drm_writeback_connector structure
>> which then gets initialized in drm_writeback_connector_init().
>>
>> In our i915 code we have intel_connector structure with drm_connector 
>> base
>> field and intel_wd with a intel_encoder base which in turn has 
>> drm_encoder
>> field and both intel_connector and intel_wd are initialized not 
>> requiring explicit
>> alloc and dealloc for drm_encoder
>> intel_wd = kzalloc(sizeof(*intel_wd), GFP_KERNEL);
>>
>> intel_connector = intel_connector_alloc();
>> wb_conn = &intel_connector->wb_conn;
>> wb_conn->base = &intel_connector->base;
>> wb_conn->encoder = &intel_wd->base.base;
>>
>> Similary for komeda driver has
>> struct komeda_wb_connector {
>>          struct drm_connector conn;
>>          /** @base: &drm_writeback_connector */
>>          struct drm_writeback_connector base;
>>
>>          /** @wb_layer: represents associated writeback pipeline of 
>> komeda */
>>          struct komeda_layer *wb_layer;
>> };
>>
>> static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
>>                                     struct komeda_crtc *kcrtc)
>> {
>>     struct komeda_wb_connector *kwb_conn;
>>     struct drm_writeback_connector *wb_conn;
>>
>>     kwb_conn = kzalloc(sizeof(*kwb_conn), GFP_KERNEL);
>>
>>     wb_conn = &kwb_conn->base;
>>              wb_conn->base = &kwb_conn->conn;
>> and they do not depend on the encoder binding so changes will work for 
>> them
>> Also in vkms driver we have the
>> struct vkms_output {
>>          struct drm_crtc crtc;
>>          struct drm_encoder encoder;
>>          struct drm_connector connector;
>>          struct drm_writeback_connector wb_connector;
>>          struct hrtimer vblank_hrtimer;
>>          ktime_t period_ns;
>>          struct drm_pending_vblank_event *event;
>>          /* ordered wq for composer_work */
>>          struct workqueue_struct *composer_workq;
>>          /* protects concurrent access to composer */
>>          spinlock_t lock;
>>
>>          /* protected by @lock */
>>          bool composer_enabled;
>>          struct vkms_crtc_state *composer_state;
>>
>>          spinlock_t composer_lock;
>> };
>>
>> Which gets allocated covering for the drm_encoder alloc and dealloc
>>
>> Regards,
>> Suraj Kandpal
>>
