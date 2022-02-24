Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A33ED4C2A14
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 12:01:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589E910F66D;
	Thu, 24 Feb 2022 11:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 401 seconds by postgrey-1.36 at gabe;
 Thu, 24 Feb 2022 11:01:20 UTC
Received: from mail-m121144.qiye.163.com (mail-m121144.qiye.163.com
 [115.236.121.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0348010F66D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 11:01:19 +0000 (UTC)
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m121144.qiye.163.com (Hmail) with ESMTPA id B891EAC0373;
 Thu, 24 Feb 2022 18:54:35 +0800 (CST)
Message-ID: <39f8f014-8d69-47e7-9004-b401ebb17e29@rock-chips.com>
Date: Thu, 24 Feb 2022 18:54:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 21/23] drm: rockchip: Add VOP2 driver
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>
References: <20220217082954.2967889-1-s.hauer@pengutronix.de>
 <e1eb945b-d7da-f21c-ee19-e19f7f1d9b04@rock-chips.com>
 <20220217135823.GR18637@pengutronix.de> <6072461.kR79ftKOrO@diego>
 <8c0b1d1e-6787-8edc-c1fd-e1b68b92e60e@rock-chips.com>
 <20220218080024.GU18637@pengutronix.de>
 <8a386dbf-645b-8054-368b-535ded778d71@rock-chips.com>
 <20220224081909.GS9136@pengutronix.de>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20220224081909.GS9136@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRkfQ0JWHU0aGU1IH0tMHR
 9OVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktITUpVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PTY6DQw*Pj5LT1ENNhksSQsM
 IigwCS1VSlVKTU9OTEtLS0xNSEtKVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBTU5DSDcG
X-HM-Tid: 0a7f2b5e5214b039kuuub891eac0373
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sascha:

On 2/24/22 16:19, Sascha Hauer wrote:
> On Sat, Feb 19, 2022 at 03:35:12PM +0800, Andy Yan wrote:
>> Hi Sascha:
>>
>> On 2/18/22 16:00, Sascha Hauer wrote:
>>> On Fri, Feb 18, 2022 at 11:50:32AM +0800, Andy Yan wrote:
>>>> Hi Sascha:
>>>>
>>>> On 2/17/22 22:06, Heiko Stübner wrote:
>>>>> Am Donnerstag, 17. Februar 2022, 14:58:23 CET schrieb Sascha Hauer:
>>>>>> Hi Andy,
>>>>>>
>>>>>> Please trim the context in your answers to the relevant parts, it makes
>>>>>> it easier to find the things you said.
>>>>>>
>>>>>> On Thu, Feb 17, 2022 at 08:00:11PM +0800, Andy Yan wrote:
>>>>>>> Hi Sascha:
>>>>>>>
>>>>>>>> +
>>>>>>>> +	drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->encoder_mask) {
>>>>>>>> +		struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
>>>>>>>> +		struct device_node *node, *parent;
>>>>>>>> +
>>>>>>>> +		parent = of_get_parent(rkencoder->port);
>>>>>>>> +
>>>>>>>> +		for_each_endpoint_of_node(parent, node) {
>>>>>>> Is there any hurt directly use our downstream vendor kernel method here: use
>>>>>>> vcstate->output_if set by encoder driver to get which interface we should
>>>>>>> enable here?
>>>>>> There is no vcstate->output_if in mainline currently. Ok, we could add
>>>>>> that. The other thing is that there are multiple HDMI interfaces and
>>>>>> the id of the HDMI encoder is encoded into output_if. Downstream kernel
>>>>>> adds OF aliases to the HDMI ports. I didn't want to go that route
>>>>>> because it doesn't seem to be very elegant to me.
>>>> aliases is a very comm strategy in device tree world.
>>> Yes, but not for retrieving bit offsets into registers. Normally aliases
>>> can be changed at board level without confusing drivers.
>>>
>>>> And your method also
>>>> add need additional dt binds to define RK3568_VOP2_EP_xxx
>>>>>>> You method is ok with device tree,  but it tied up this driver to device
>>>>>>> tree, we are now tring to extend vop2 driver work with ACPI, so we hope this
>>>>>>> driver can be much more flexible.
>>>>>> The current rockchip drm driver seems to be pretty much tied to device
>>>>>> tree. There are probably many other places that need parallel paths for
>>>>>> ACPI support, I think we can delay this particular part until we see the
>>>>>> whole picture. In the end we can still retrieve the output_if
>>>>>> information differently with ACPI while still retrieving the information
>>>>>> from the device tree the way we are doing currently.
>>>> The current driver only reference device thee at driver initial, we not wrap
>>>>
>>>> device tree related things in other parts, so if we extend it to support
>>>> ACPI,
>>>>
>>>> we just need modify the initial code, this make things easier.
>>> The device tree parsing could be moved out of vop2_crtc_atomic_enable()
>>> into some initialisation path. In the end it's static information,
>>> there's no need to do it repeatedly in atomic_enable.
>> This could be one solution, the repeatedly parsing device tree in
>> atomic_enable is also my concern.
>>
>> In addition, there are 2 HDMI, 2 eDP, 2 MIPI on the coming rk3588, so it's
>> better to consider give position
>>
>> for HDMI1, EDP1, in  include/dt-bindings/soc/rockchip,vop2.h
> The defines are rk3568 specific. rk3588 would use a set of rk3588
> specific defines along with a rk3588_set_intf_mux().


Why not try to share these RK3568_VOP2_EP_XXX across all vop2 even vop 
based rockchip socs?

If make these definition RK3568 specific, we need copy all of it and 
change 3568 to 3588 than add HDMI1, HDMI0, EDP1,EDP0

when rk3588 coming, if there is another rk35xx, we need to the same 
thing again.... but they share same code logic and number,

the only difference is the definition name.


Please take a look at the current upstream vop driver,  it support 13 
socs, when we add support for a new vop , most of

the work is just add registers definition in rockchip_vop_reg.c, we 
don't need to duplicate soc specific code in rockchip_drm_vop.c,

these make the upstream process much easier, and keep the vop driver 
tiny and clean.

> Sascha
>
