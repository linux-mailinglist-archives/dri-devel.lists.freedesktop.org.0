Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C28940FFD
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 12:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3D510E0E2;
	Tue, 30 Jul 2024 10:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="Ji5EBno3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 638 seconds by postgrey-1.36 at gabe;
 Tue, 30 Jul 2024 10:53:55 UTC
Received: from mail-m19731109.qiye.163.com (mail-m19731109.qiye.163.com
 [220.197.31.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8A610E0E2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 10:53:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Ji5EBno34KVBn4cIN7fJNW33764fRb+m+/S3XA5oQf5bWYjeBBgEdqM4mTQupAaYccDWi2D+tiswiBnvTwbk/3vi+eX3hm5jx1IpqPV92K3emI4SHp24HB6ivAoKYxhSa/O4hHNvFGOblq9fnlYOOQPPpsFLS2nXxbgWGM4mV2U=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=18DQziCvmy50QjAWEsci8q1/bqwwQYzRrrjHAn6ZKSo=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTPA id B3382840772;
 Tue, 30 Jul 2024 18:43:05 +0800 (CST)
Message-ID: <7d998e4c-e1d3-4e8b-af76-c5bc83b43647@rock-chips.com>
Date: Tue, 30 Jul 2024 18:43:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rockchip/drm: vop2: add support for gamma LUT
To: Piotr Zalewski <pZ010001011111@proton.me>
Cc: "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "heiko@sntech.de" <heiko@sntech.de>, "hjc@rock-chips.com"
 <hjc@rock-chips.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
References: <TkgKVivuaLFLILPY-n3iZo_8KF-daKdqdu-0_e0HP-5Ar_8DALDeNWog2suwWKjX7eomcbGET0KZe7DlzdhK2YM6CbLbeKeFZr-MJzJMtw0=@proton.me>
 <ec283a7c-845b-4c58-8d86-cdd07862a0dc@rock-chips.com>
 <KbOjWzFKMM_fwDora8CjaLFBHWypRP1Mk6nPzHkwNAGxFHzJIynx3W8_jyZvbygH99lRAXDdrJmdFEQuY8M2Ao-a8F42zt8no4B1DCBiQIs=@proton.me>
 <48249708-8c05-40d2-a5d8-23de960c5a77@rock-chips.com>
 <y_bpV0FizWkAqq0XPIKrauaZ07r_Ds-MnDr696Y1qFTLNiLsx7pL4C-Zsu-K9TzVBJ85L5cdkzDQOExcXXTf0owUYramMHdZd4erMRpJUXI=@proton.me>
Content-Language: en-US
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <y_bpV0FizWkAqq0XPIKrauaZ07r_Ds-MnDr696Y1qFTLNiLsx7pL4C-Zsu-K9TzVBJ85L5cdkzDQOExcXXTf0owUYramMHdZd4erMRpJUXI=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQklMQlZKT00fGkoaGkJOSR9WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJNSE
 pVSktLVUtZBg++
X-HM-Tid: 0a91033c8fda03a4kunmb3382840772
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PQw6FCo5MTI3KTUyDUg#CCgz
 IhJPFB5VSlVKTElJSEhNSkNNQk9NVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBTUNOTTcG
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Piotr,

On 7/30/24 05:20, Piotr Zalewski wrote:
> Hi Andy
> 
> On Monday, July 29th, 2024 at 4:35 AM, Andy Yan <andy.yan@rock-chips.com> wrote:
> 
>>>>> +
>>>>> +static void vop2_crtc_gamma_set(struct vop2 *vop2, struct drm_crtc *crtc,
>>>>> + struct drm_crtc_state *old_state)
>>>>> +{
>>>>> + struct drm_crtc_state *state = crtc->state;
>>>>> + struct vop2_video_port *vp = to_vop2_video_port(crtc);
>>>>> + u32 dsp_ctrl;
>>>>> + int ret;
>>>>> +
>>>>> + if (!vop2->lut_regs)
>>>>> + return;
>>>>> +
>>>>> + if (!state->gamma_lut) {
>>>>
>>>> What's the purpose of checking !state->gamma_lut here,
>>>>
>>>> and you check it again at the end for return.
>>>> This makes me very confused.
>>>
>>> I understood it this way - since the vop2 lock is unlocked after disabling
>>> gamma LUT, the CRTC state can change while waiting for DSP_LUT_EN bit to
>>> be unset. With the change I sent in response to Daniel's reply, gamma LUT
>>> state modification should now be fully atomic so there shouldn't be a need
>>> for the second state check there anymore (if my logic is incorrect please
>>> explain).
>>
>>
>> After reading the commit message for adding gamma control for rk3399[0] i understand
>> what is going on here:
>>
>> we should run into the if block in two cases:
>>
>> (1) if the state->gamma_lut is null, we just need to disable dsp_lut and return,
>>
>> this is why vop1 code check !state->gamma_lut again at the end.
>>
>> (2) for platform unlinke rk3399(rk3566/8), we also need to disable dsp_lut befor we
>> write gamma_lut data, for platform like rk3399(rk3588), we don't need do the disable,
>> this is why vop1 code also has a !VOP_HAS_REG(vop, common, update_gamma_lut) check.
>>
>> so we also need a similary check here:
>> (1) if the state->gamma_lut is null, disable dsp lut and return directly.
>>
>> (1) if the state has a gamma_lut, we shoud dsiable dsp_lut than write gamma lut data on rk3566/8,
>> buf for rk3588, we should not disable dsp_lut before write gamma
>>
>>
>> [0]https://lists.infradead.org/pipermail/linux-rockchip/2021-October/028132.html
>>
> 
> Ok I see it. So In my patch it doesn't make sense at all to check it again
> (forgot about that extra if statement condition there, which I cut out
> when porting to VOP2). I reworked my patch further for it to handle RK3588
> case and to better utilize DRM atomic updates. It's contained in the
> response to Daniel's review [1]. I experienced some problems so I'm waiting
> for his response/comment on that.
> 
> Regarding RK3588, I checked RK3588 TRM v1.0 part2. In its VOP2 section I
> found:
>    - SYS_CTRL_LUT_PORT_SEL: gamma_ahb_write_sel (seems to represent the
>      same concept as LUT_PORT_SEL in case of RK356x)

  We should also setting it to she VP id we want write gamma, this is used for selet
  ahb bus.

>    - VOP2_POST0_DSP_CTRL: gamma_update_en (seems to represent the same
>      concept as in VOP1 in case of RK3399)
we also need to set it every time we update the gamma lut.

>    - I also found dsp_lut_en but I presume it is a bug in documentation.

No, it is not a bug, we should set it when we enable gamma lut, we just don't
need to disable it before we update gamma lut.

Here is some code you can take as reference [0]
[0]:https://github.com/radxa/kernel/blob/linux-6.1-stan-rkr1/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c#L3437
> 
> Should RK3588 be handled as RK3399? (gamma LUT can be written directly but
> gamma_update_en bit has to be set before). What about gamma_ahb_write_sel?
>   
> [1] https://lkml.org/lkml/2024/7/27/293
> 
> Best Regards, Piotr Zalewski
