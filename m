Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5444F4F62
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 04:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3759A10EB71;
	Wed,  6 Apr 2022 02:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17637.qiye.163.com (mail-m17637.qiye.163.com
 [59.111.176.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A92010EB83
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 02:03:02 +0000 (UTC)
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m17637.qiye.163.com (Hmail) with ESMTPA id F0DA798048A;
 Wed,  6 Apr 2022 10:02:59 +0800 (CST)
Message-ID: <12a8c0ef-90ee-cf7e-50a0-e00add8af147@rock-chips.com>
Date: Wed, 6 Apr 2022 10:02:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v9 00/23] drm/rockchip: RK356x VOP2 support
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>
References: <20220328151116.2034635-1-s.hauer@pengutronix.de>
 <FB201567-AE5A-4242-82F1-7C55D8F111EA@gmail.com>
 <20220401125205.GL4012@pengutronix.de>
 <1c0fbf4f-2e17-29f9-5c69-c80b53ff3d2f@rock-chips.com>
 <20220405093700.GQ4012@pengutronix.de>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20220405093700.GQ4012@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUlKS0tKN1dZLVlBSVdZDwkaFQgSH1lBWRlIGEtWGE1LSkpOGB
 oYSkhIVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MRA6GCo5Aj4MHUsIMBYxFThK
 NDYwCjNVSlVKTU9CSUpLTkNLTUxIVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBTklNSjcG
X-HM-Tid: 0a7ffc9c5db9d992kuwsf0da798048a
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Peter Geis <pgwipeout@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi:

On 4/5/22 17:37, Sascha Hauer wrote:
> On Sat, Apr 02, 2022 at 09:37:17AM +0800, Andy Yan wrote:
>> Hi Sacha:
>>
>> On 4/1/22 20:52, Sascha Hauer wrote:
>>> -- 
>>> >From cbc03073623a7180243331ac24c3afaf9dec7522 Mon Sep 17 00:00:00 2001
>>> From: Sascha Hauer<s.hauer@pengutronix.de>
>>> Date: Fri, 1 Apr 2022 14:48:49 +0200
>>> Subject: [PATCH] fixup! drm: rockchip: Add VOP2 driver
>>>
>>> ---
>>>    drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 14 ++++++++++++++
>>>    1 file changed, 14 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>> index 7dba7b9b63dc6..1421bf2f133f1 100644
>>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>> @@ -2287,6 +2287,20 @@ static int vop2_create_crtc(struct vop2 *vop2)
>>>    			}
>>>    		}
>>> +		if (vop2->data->soc_id == 3566) {
>>> +			/*
>>> +			 * On RK3566 these windows don't have an independent
>>> +			 * framebuffer. They share the framebuffer with smart0,
>>> +			 * esmart0 and cluster0 respectively.
>>> +			 */
>>> +			switch (win->data->phys_id) {
>>> +			case ROCKCHIP_VOP2_SMART1:
>>> +			case ROCKCHIP_VOP2_ESMART1:
>>> +			case ROCKCHIP_VOP2_CLUSTER1:
>>> +				continue;
>>> +			}
>>
>> Think about this , there maybe other upcoming vop2 base soc, they may only
>> have
>>
>> mirror window Smart1 Esmart1, or Smart1, Esmart1, Esmart2, Cluster1.
>>
>> I think this should add WIN_FEATURE at the platform description file
>> rockchip_vop2_reg.c, then
>>
>> check the FEATURE to decide whether the driver should give this window a
>> special treatment.
>>
>> this can make one code run for different soc with different platform
>> description. or we should add
>>
>> the same code logic for different soc again and again.
> You mean like done in the downstream Kernel? Here indeed we have a
> WIN_FEATURE_MIRROR flag added to the platform description. This is then
> evaluated with:
>
> static bool vop2_is_mirror_win(struct vop2_win *win)
> {
>          return soc_is_rk3566() && (win->feature & WIN_FEATURE_MIRROR);
> }
>
> So a flag is added and afterwards its evaluation is SoC specific. That
> doesn't help at all and only obfuscates things.
>
> Besides, experience shows that you can't predict a good abstraction for

This is not a  predict,  this is an IP feature, so it will appeared on 
upcoming SOC.

We have rk3588 with 8 windows(4 Cluster + 4 Esmart, no Smart window), and

also have a entry level soc which only have 4 windows, they both have 
this feature.

> future hardware revisions, the hardware guys are just too creative in
> creating hardware that breaks existing abstractions.
>
> Sascha
>
