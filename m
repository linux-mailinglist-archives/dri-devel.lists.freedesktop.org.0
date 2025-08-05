Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1E9B1AE77
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 08:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5717C10E5E4;
	Tue,  5 Aug 2025 06:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="HLMeHboF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Tue, 05 Aug 2025 06:37:32 UTC
Received: from mail-m15572.qiye.163.com (mail-m15572.qiye.163.com
 [101.71.155.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2809C10E5E4
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 06:37:31 +0000 (UTC)
Received: from [172.16.12.153]
 (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 1e545294d;
 Tue, 5 Aug 2025 14:32:18 +0800 (GMT+08:00)
Message-ID: <f726862a-bd18-43ee-b307-8daef2451e6b@rock-chips.com>
Date: Tue, 5 Aug 2025 14:32:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Add Type-C DP support for RK3399 EVB IND board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20250729090032.97-1-kernel@airkyi.com>
 <3kefqzjewmsyzfvyi33kvlgjd6jphjg3fsnixb3of7yb3xkgs2@hgi6xfkgd653>
 <63ec11cf-7927-431a-995e-a5fc35ef1ba7@rock-chips.com>
 <pk5wecbbpxn7v4bdwtghhdnm76fmrmglelytljwfb4cgvpu2i6@rk5turgyt5xq>
 <0207826d-a987-4464-b306-29bdbfac45bc@rock-chips.com>
 <3e880194-5ac8-4056-929c-ac103bedc737@oss.qualcomm.com>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <3e880194-5ac8-4056-929c-ac103bedc737@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9878ee449203abkunm21aca6f168f34c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR1OQlZNGE9ITU9JS0kYThhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
 xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=HLMeHboFPO9wilguf8Zww8hXY4kbZfK9VFChLUgfBMO8X5hUaMfgVTyd06GEiVyB5KDQckmsuLy2uIYRxl3vsF4giA/oylz5ntb+gbaaVKjwwRowlrEkDLe/4llvgSnl7ioQdUFDYOTlUb1y1uFWNDDmWoAcEGyenpvv0wyxVLo=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=OBvhoezUSc7NI8tAcl9t1xhx6CLTBuvUQsqUuAHfhvo=;
 h=date:mime-version:subject:message-id:from;
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

Hi Dmitry,

On 8/5/2025 12:26 PM, Dmitry Baryshkov wrote:
> On 05/08/2025 09:13, Chaoyi Chen wrote:
>> Hi Dmitry,
>>
>> On 8/2/2025 5:55 PM, Dmitry Baryshkov wrote:
>>
>> [...]
>>
>>
>>>> Currently, the software simply selects the first available port. So 
>>>> if user
>>>> plugs in DP dongles in both USB-C ports, the DP driver will select 
>>>> the first
>>>> port. This process is implemented in cdn_dp_connected_port() .
>>>>
>>> I think Stephen Boyd has been looking on similar issues for 
>>> Chromebooks,
>>> which were sharing DP controller between several USB-C ports. I don't
>>> remember what was his last status. I think there it was easier since 
>>> the
>>> bifurcation point was the EC.
>>
>> I think the latest progress should be here: [0]. It seems that it 
>> hasn't been updated for a while.
>
> Might be :-(
>
>>
>> [0]: https://lore.kernel.org/all/20240901040658.157425-1- 
>> swboyd@chromium.org/
>>
>>
>>>
>>> I think, CDN-DP needs to register up to two encoders and up to two
>>> connectors, having a separate drm_bridge chain for each of the DP
>>> signals paths (in the end, you can not guarantee that both branches 
>>> will
>>> have the same simple CDN-DP -> PHY -> USB-C configuration: there can be
>>> different retimers, etc).
>>>
>>> Both encoders should list the same CRTC in possible_crtcs, etc. Of
>>> course, it should not be possible to enable both of them.
>>>
>>> This way if the user plugs in two DP dongles, it would be possible to
>>> select, which output actually gets a signal.
>>
>> That makes sense, but this might make the DP driver quite complex. I 
>> will see if I can make it happen.
>
> I think it's trading one burden for another, because CDN-DP currently 
> has a complication of calling cdn_dp_get_port_lanes() / 
> cdn_dp_enable_phy() in a loop rather than just enabling one instance.

Yep, I will give it a try.


>
>>
>>
>>>
>>>>
>>>>>> BTW, one of the important things to do is to implement extcon-like
>>>>>> notifications. I found include/drm/bridge/aux-bridge.h , but if the
>>>>>> aux-bridge is used, the bridge chain would look like this:
>>>>>>
>>>>>> PHY0 aux-bridge ---+
>>>>>>                      | ----> CDN-DP bridge
>>>>>> PHY1 aux-bridge ---+
>>>>>>
>>>>>> Oh, CDN-DP bridge has two previous aux-bridge!
>>>>>>
>>>>>> Now, I try to use drm_connector_oob_hotplug_event() to notify HPD
>>>>>> state between PHY and CDN-DP controller.
>>>>> Does it actually work? The OOB HPD event will be repoted for the 
>>>>> usb-c
>>>>> connector's fwnode, but the DP controller isn't connected to that 
>>>>> node
>>>>> anyhow. If I'm not mistaken, the HPD signal will not reach DP 
>>>>> driver in
>>>>> this case.
>>>> Yes.  What you mentioned is the case in
>>>> drivers/usb/typec/altmodes/displayport.c . I have also added a new 
>>>> OOB event
>>>> notify in the PHY driver in Patch 3, where the expected fwnode is 
>>>> used in
>>>> the PHY. So now we have two OOB HPD events, one from altmodes/ 
>>>> displayport.c
>>>> and the other from PHY. Only the HPD from PHY is eventually passed 
>>>> to the DP
>>>> driver.
>>> This way you will loose IRQ_HPD pulse events from the DP. They are used
>>> by DPRX (aka DP Sink) to signal to DPTX (DP Source) that there was a
>>> change on the DPRX side and the DPTX should reread link params and 
>>> maybe
>>> retrain the link.
>>
>> Sorry, I still don't quite understand your point. I think the entire 
>> notification path is as follows:
>>
>> Type-C mux callback -> RK3399 USBDP PHY -> PHY calls 
>> drm_connector_oob_hotplug_event() -> DP driver
>>
>> Are you concerned that the IRQ_HPD event is not being handled 
>> somewhere along the path? Is it that the Type-C mux callback didn't 
>> notify the PHY, or that after the PHY passed the event to the DP 
>> driver via the OOB event, the DP driver didn't handle it?
>
> The IRQ_HPD is an event coming from DPRX, it is delivered as a part of 
> the attention VDM, see DP_STATUS_IRQ_HPD. It's being handled by the 
> altmode displayport.c driver and is then delivered as an OOB hotplug 
> call. However, it's not a mux event, so it is not (and it should not) 
> being broadcasted over the typec_mux devices.
>
> The way we were handling that is by having a chain of drm_aux_bridges 
> for all interim devices, ending up with a drm_dp_hpd_bridge registered 
> by the TCPM. This way when the DPRX triggers the IRQ_HPD event, it is 
> being handled by the displayport.c and then delivered through that 
> bridge to the DP driver.

I think the issue goes back to the beginning. The key is to reuse the 
logic in displayport.c, and the previous approach of directly setting 
the fwnode has already been rejected. Is it a good idea to register the 
aux hpd bridge in displayport.c? In this way, we don't need to register 
it with a bunch of PD drivers (such as fusb302), which seems like a more 
generic solution.


