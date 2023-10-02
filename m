Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFAC7B502F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 12:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E594410E042;
	Mon,  2 Oct 2023 10:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177F710E042
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 10:23:36 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EF2266607038;
 Mon,  2 Oct 2023 11:23:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1696242214;
 bh=ToRh/ISd/gxtCYAZ6mSqZdgNWox9j5WdKAq9Ron8cEY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FQemsHx0RrG7eGmZCFdlKAHRn3yQ23PLvL3ViLfnkyPwKnZngEzZHrJL7k0K5BKXs
 arjck/3Zb1rjGKDBBpi6QG+DbxtbzX1OGDBypeo7s+SCybOkgeLkt/NMsF4etSkZhC
 mTWoknjiHucxkxfOeeziyzloaNKW4b954f673H2f2xL1MUJ6RPPCa+C9lIzByOHpXz
 SR7ca40dL3rhjshg1A2iw6NZg/kw/Qzu5PYSmyAUfI+sPspuoH+XDxAoiagFknAVJN
 a+CyxMoqSRT/hpENkMJh47QGpqWyOZTOjIvqu3v8NLlox4pSyqCr3LP7lr0ZZ2xKgs
 Oh/+fRjxcsqPw==
Message-ID: <4303dcfd-4dc1-18da-8884-1cb9b0bfa0a9@collabora.com>
Date: Mon, 2 Oct 2023 12:23:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v10 5/9] drm/mediatek: Add connector dynamic selection
 capability
Content-Language: en-US
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
References: <20230927153833.23583-1-jason-jh.lin@mediatek.com>
 <20230927153833.23583-6-jason-jh.lin@mediatek.com>
 <891fe60a-cee9-29ab-3214-848b1161a0a7@collabora.com>
 <1780d283425dea81e894fc75eeb893ab7a1faff2.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1780d283425dea81e894fc75eeb893ab7a1faff2.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?B?TmF0aGFuIEx1ICjlkYLmnbHpnJYp?= <Nathan.Lu@mediatek.com>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?UTF-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 02/10/23 09:14, Jason-JH Lin (林睿祥) ha scritto:
> Hi Angelo,
> 
> Thanks for the reviews.
> 
> On Thu, 2023-09-28 at 12:00 +0200, AngeloGioacchino Del Regno wrote:
>> Il 27/09/23 17:38, Jason-JH.Lin ha scritto:
>>> Add dynamic select available connector flow in
>>> mtk_drm_crtc_create()
>>> and mtk_drm_crtc_atomic_enable().
>>>
>>> In mtk_drm_crtc_create(), if there is a connector routes array in
>>> drm
>>> driver data, all components definded in the connector routes array
>>> will
>>> be checked and their encoder_index will be set.
>>>
>>> In mtk_drm_crtc_atomic_enable(), crtc will check its encoder_index
>>> to
>>> identify which componet in the connector routes array should
>>> append.
>>>
>>> Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
>>> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
>>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>>> Tested-by: Fei Shao <fshao@chromium.org>
>>> ---
>>>    drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 78
>>> ++++++++++++++++++++-
>>>    drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  5 +-
>>>    drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 27 ++++++-
>>>    drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 13 +++-
>>>    drivers/gpu/drm/mediatek/mtk_drm_drv.h      |  7 ++
>>>    5 files changed, 123 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>> b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>> index b6fa4ad2f94d..8eb4d2646a76 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>> @@ -63,6 +63,8 @@ struct mtk_drm_crtc {
>>>    	struct mtk_mutex		*mutex;
>>>    	unsigned int			ddp_comp_nr;
>>>    	struct mtk_ddp_comp		**ddp_comp;
>>> +	unsigned int			num_conn_routes;
>>> +	const struct mtk_drm_route	*conn_routes;
>>>    
>>>    	/* lock for display hardware access */
>>>    	struct mutex			hw_lock;
>>> @@ -647,6 +649,45 @@ static void mtk_drm_crtc_disable_vblank(struct
>>> drm_crtc *crtc)
>>>    	mtk_ddp_comp_disable_vblank(comp);
>>>    }
>>>    
>>> +static void mtk_drm_crtc_update_output(struct drm_crtc *crtc,
>>> +				       struct drm_atomic_state *state)
>>> +{
>>> +	int crtc_index = drm_crtc_index(crtc);
>>> +	int i;
>>> +	struct device *dev;
>>> +	struct drm_crtc_state *crtc_state = state-
>>>> crtcs[crtc_index].new_state;
>>> +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
>>> +	struct mtk_drm_private *priv = crtc->dev->dev_private;
>>> +	unsigned int comp_id;
>>
>> You're not using comp_id globally in this function....
> 
> OK, I'll move it to the for loop below.
> 
>>
>>> +	unsigned int encoder_mask = crtc_state->encoder_mask;
>>> +
>>> +	if (!crtc_state->connectors_changed)
>>> +		return;
>>> +
>>> +	if (!mtk_crtc->num_conn_routes)
>>> +		return;
>>> +
>>> +	priv = priv->all_drm_private[crtc_index];
>>
>> This is a bit confusing. You're reassigning priv: please avoid that.
>> I would prefer directly seeing the final assignment, or otherwise two
>> pointers.
>>
>> 	struct mtk_drm_private *priv;
>>
>> 	if ....
>> 	...........
>>
>> 	priv = crtc->dev->dev_private->all_drm_private[crtc_index];
>>
> 
> OK, because the type of dev_private is void*. I'll change the
> assignment to:
> 
> priv = ((struct mtk_drm_private *)crtc->dev->dev_private)-
>> all_drm_private[crtc_index];
> 
>>> +	dev = priv->dev;
>>> +
>>> +	dev_dbg(dev, "connector change:%d, encoder mask:0x%x for
>>> crtc:%d\n",
>>> +		crtc_state->connectors_changed, encoder_mask,
>>> crtc_index);
>>> +
>>> +	for (i = 0; i < mtk_crtc->num_conn_routes; i++) {
>>> +		struct mtk_ddp_comp *comp;
>>
>> ...so you can move it here...
> 
> OK, I'll move it here.
> 
>> 		unsigned int comp_id = mtk_crtc-
>>> conn_routes[i].route_ddp;
>> 		struct mtk_ddp_comp *comp = &priv->ddp_comp[comp_id];
>>
>>> +
>>> +		comp_id = mtk_crtc->conn_routes[i].route_ddp;
>>> +		comp = &priv->ddp_comp[comp_id];
>>> +		if (comp->encoder_index >= 0 &&
>>> +		    encoder_mask & BIT(comp->encoder_index)) {
>>
>> For readability, I would prefer to see
>>
>> 		if (comp->encoder_index >= 0 &&
>> 		    (encoder_mask & BIT(comp->encoder_index))) {
>>
>> ...but I don't have strong opinions on that.
>>
> 
> OK, I'll modify it.
> 
>>> +			mtk_crtc->ddp_comp[mtk_crtc->ddp_comp_nr - 1] =
>>> comp;
>>> +			dev_dbg(dev, "Add comp_id: %d at path index
>>> %d\n",
>>> +				comp->id, mtk_crtc->ddp_comp_nr - 1);
>>> +			break;
>>> +		}
>>> +	}
>>> +}
>>> +
>>>    int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct
>>> drm_plane *plane,
>>>    			     struct mtk_plane_state *state)
>>>    {
>>> @@ -679,6 +720,8 @@ static void mtk_drm_crtc_atomic_enable(struct
>>> drm_crtc *crtc,
>>>    
>>>    	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
>>>    
>>> +	mtk_drm_crtc_update_output(crtc, state);
>>> +
>>
>> What's the point of updating the output before
>> pm_runtime_resume_and_get()?
>> If PM resume fails we're not enabling the CRTC so the update is
>> actually useless.
>>
>> Please move this after PM resume: that will also possibly come handy
>> in the future.
> 
> OK, I'll move this after pm_runtime_resume_and_get().
> 
>>
>>
>>>    	ret = pm_runtime_resume_and_get(comp->dev);
>>>    	if (ret < 0) {
>>>    		DRM_DEV_ERROR(comp->dev, "Failed to enable power
>>> domain: %d\n", ret);
>>> @@ -884,7 +927,8 @@ struct device *mtk_drm_crtc_dma_dev_get(struct
>>> drm_crtc *crtc)
>>>    
>>>    int mtk_drm_crtc_create(struct drm_device *drm_dev,
>>>    			const unsigned int *path, unsigned int
>>> path_len,
>>> -			int priv_data_index)
>>> +			int priv_data_index, const struct mtk_drm_route
>>> *conn_routes,
>>> +			unsigned int num_conn_routes)
>>>    {
>>>    	struct mtk_drm_private *priv = drm_dev->dev_private;
>>>    	struct device *dev = drm_dev->dev;
>>> @@ -935,7 +979,8 @@ int mtk_drm_crtc_create(struct drm_device
>>> *drm_dev,
>>>    
>>>    	mtk_crtc->mmsys_dev = priv->mmsys_dev;
>>>    	mtk_crtc->ddp_comp_nr = path_len;
>>> -	mtk_crtc->ddp_comp = devm_kmalloc_array(dev, mtk_crtc-
>>>> ddp_comp_nr,
>>> +	mtk_crtc->ddp_comp = devm_kmalloc_array(dev,
>>> +						mtk_crtc->ddp_comp_nr +
>>> (conn_routes ? 1 : 0),
>>>    						sizeof(*mtk_crtc-
>>>> ddp_comp),
>>>    						GFP_KERNEL);
>>>    	if (!mtk_crtc->ddp_comp)
>>> @@ -1038,5 +1083,34 @@ int mtk_drm_crtc_create(struct drm_device
>>> *drm_dev,
>>>    		init_waitqueue_head(&mtk_crtc->cb_blocking_queue);
>>>    	}
>>>    #endif
>>> +
>>> +	if (conn_routes) {
>>> +		struct device_node *node;
>>> +		struct mtk_ddp_comp *comp;
>>> +		unsigned int comp_id;
>>> +
>>> +		for (i = 0; i < num_conn_routes; i++) {
>>
>> Same here, you're locally using comp_id, node and comp *only* in the
>> for loop....
>>
> 
> OK I'll move it here.
> 
>> 			unsigned int comp_id =
>> conn_routes[i].route_ddp;
>> 			struct device_node *node = priv-
>>> comp_node[comp_id];
>> 			struct mtk_ddp_comp *comp = &priv-
>>> ddp_comp[comp_id];
>>
>>> +			comp_id = conn_routes[i].route_ddp;
>>> +			node = priv->comp_node[comp_id];
>>> +			comp = &priv->ddp_comp[comp_id];
>>> +
>>> +			if (!comp->dev) {
>>> +				dev_dbg(dev, "comp_id:%d, Component
>>> %pOF not initialized\n",
>>> +					comp_id, node);
>>> +				/* mark encoder_index to -1, if route
>>> comp device is not enabled */
>>> +				comp->encoder_index = -1;
>>> +				continue;
>>> +			}
>>> +
>>> +			mtk_ddp_comp_encoder_index_set(&priv-
>>>> ddp_comp[comp_id]);
>>> +		}
>>> +
>>> +		mtk_crtc->num_conn_routes = num_conn_routes;
>>> +		mtk_crtc->conn_routes = conn_routes;
>>> +
>>> +		/* increase ddp_comp_nr at the end of
>>> mtk_drm_crtc_create */
>>> +		mtk_crtc->ddp_comp_nr++;
>>> +	}
>>> +
>>>    	return 0;
>>>    }
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
>>> b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
>>> index 3e9046993d09..3c224595fa71 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
>>> @@ -8,6 +8,7 @@
>>>    
>>>    #include <drm/drm_crtc.h>
>>>    #include "mtk_drm_ddp_comp.h"
>>> +#include "mtk_drm_drv.h"
>>>    #include "mtk_drm_plane.h"
>>>    
>>>    #define MTK_LUT_SIZE	512
>>> @@ -18,7 +19,9 @@ void mtk_drm_crtc_commit(struct drm_crtc *crtc);
>>>    int mtk_drm_crtc_create(struct drm_device *drm_dev,
>>>    			const unsigned int *path,
>>>    			unsigned int path_len,
>>> -			int priv_data_index);
>>> +			int priv_data_index,
>>> +			const struct mtk_drm_route *conn_routes,
>>> +			unsigned int num_conn_routes);
>>>    int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct
>>> drm_plane *plane,
>>>    			     struct mtk_plane_state *state);
>>>    void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct
>>> drm_plane *plane,
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
>>> b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
>>> index 771f4e173353..4ddb5e561116 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
>>> @@ -507,6 +507,23 @@ static bool mtk_drm_find_comp_in_ddp(struct
>>> device *dev,
>>>    	return false;
>>>    }
>>>    
>>> +static int mtk_drm_find_comp_in_ddp_conn_path(struct device *dev,
>>> +					      const struct
>>> mtk_drm_route *routes,
>>> +					      unsigned int num_routes,
>>> +					      struct mtk_ddp_comp
>>> *ddp_comp)
>>> +{
>>> +	unsigned int i;
>>> +
>>> +	if (!routes)
>>> +		return -EINVAL;
>>> +
>>> +	for (i = 0; i < num_routes; i++)
>>> +		if (dev == ddp_comp[routes[i].route_ddp].dev)
>>> +			return BIT(routes[i].crtc_id);
>>> +
>>> +	return -ENODEV;
>>> +}
>>> +
>>>    int mtk_ddp_comp_get_id(struct device_node *node,
>>>    			enum mtk_ddp_comp_type comp_type)
>>>    {
>>> @@ -538,7 +555,15 @@ unsigned int
>>> mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
>>>    					  private->data->third_len,
>>> private->ddp_comp))
>>>    		ret = BIT(2);
>>>    	else
>>> -		DRM_INFO("Failed to find comp in ddp table\n");
>>> +		ret = mtk_drm_find_comp_in_ddp_conn_path(dev,
>>> +							 private->data-
>>>> conn_routes,
>>> +							 private->data-
>>>> num_conn_routes,
>>> +							 private-
>>>> ddp_comp);
>>> +
>>> +	if (ret <= 0) {
>>> +		DRM_INFO("Failed to find comp in ddp table, ret =%d\n",
>>> ret);
>>> +		ret = 0;
>>
>> Why are you returning 0 for error here?!
> 
> Because this function return 0 means not found any valid crtc bits.
> Should I change this?
> 

Yes, please, return a relevant error code instead.

Thanks,
Angelo

> Regards,
> Jason-JH.Lin
> 
>>
>>> +	}
>>>    
>>>    	return ret;
>>>    }
>>
>> Regards,
>> Angelo
>>



