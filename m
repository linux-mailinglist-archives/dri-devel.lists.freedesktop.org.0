Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 089C516F8FC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5598E6E162;
	Wed, 26 Feb 2020 08:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD9F6E8B7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 10:56:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id AD0AC2942E3
Subject: Re: [PATCH v8 0/6] arm/arm64: mediatek: Fix mmsys device probing
To: CK Hu <ck.hu@mediatek.com>
References: <20200220172147.919996-1-enric.balletbo@collabora.com>
 <1582259996.1846.7.camel@mtksdaap41>
 <7a87b486-1622-7f27-f5af-427b94a14c00@collabora.com>
 <1582277229.25992.9.camel@mtksdaap41>
 <1393a8c5-065f-cccb-2563-8b159c951d4b@suse.com>
 <1582283518.5889.10.camel@mtksdaap41>
 <6deab0a4-44a6-a15f-ac01-374f818b267c@collabora.com>
 <6eb9da70-9a0c-27fc-6c31-3ac62ede5a35@suse.com>
 <d9ad35c0-57df-ebb2-67e8-4aae55dd2fcb@collabora.com>
 <1582523544.25316.2.camel@mtksdaap41>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <688f6c85-0063-9458-858c-de7bbfb8a530@collabora.com>
Date: Tue, 25 Feb 2020 11:56:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1582523544.25316.2.camel@mtksdaap41>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 26 Feb 2020 08:08:26 +0000
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
Cc: mark.rutland@arm.com, Kate Stewart <kstewart@linuxfoundation.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>, laurent.pinchart@ideasonboard.com,
 ulrich.hecht+renesas@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-clk@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Weiyi Lu <weiyi.lu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 wens@csie.org, Allison Randal <allison@lohutok.net>,
 mtk01761 <wendell.lin@mediatek.com>, Owen Chen <owen.chen@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
 sean.wang@mediatek.com, Houlong Wei <houlong.wei@mediatek.com>,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>,
 Fabien Parent <fparent@baylibre.com>, sboyd@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 24/2/20 6:52, CK Hu wrote:
> 
> Hi,
> 
> On Fri, 2020-02-21 at 18:10 +0100, Enric Balletbo i Serra wrote:
>> Hi,
>>
>> On 21/2/20 12:53, Matthias Brugger wrote:
>>>
>>>
>>> On 21/02/2020 12:37, Enric Balletbo i Serra wrote:
>>>> Hi CK and Matthias,
>>>>
>>>> On 21/2/20 12:11, CK Hu wrote:
>>>>> Hi, Matthias:
>>>>>
>>>>> On Fri, 2020-02-21 at 11:24 +0100, Matthias Brugger wrote:
>>>>>>
>>>>>> On 21/02/2020 10:27, CK Hu wrote:
>>>>>>> Hi, Enric:
>>>>>>>
>>>>>>> On Fri, 2020-02-21 at 09:56 +0100, Enric Balletbo i Serra wrote:
>>>>>>>> Hi CK,
>>>>>>>>
>>>>>>>> Thanks for your quick answer.
>>>>>>>>
>>>>>>>> On 21/2/20 5:39, CK Hu wrote:
>>>>>>>>> Hi, Enric:
>>>>>>>>>
>>>>>>>>> On Thu, 2020-02-20 at 18:21 +0100, Enric Balletbo i Serra wrote:
>>>>>>>>>> Dear all,
>>>>>>>>>>
>>>>>>>>>> Those patches are intended to solve an old standing issue on some
>>>>>>>>>> Mediatek devices (mt8173, mt2701 and mt2712) in a slightly different way
>>>>>>>>>> to the precedent series.
>>>>>>>>>>
>>>>>>>>>> Up to now both drivers, clock and drm are probed with the same device tree
>>>>>>>>>> compatible. But only the first driver get probed, which in effect breaks
>>>>>>>>>> graphics on those devices.
>>>>>>>>>>
>>>>>>>>>> The version eight of the series tries to solve the problem with a
>>>>>>>>>> different approach than the previous series but similar to how is solved
>>>>>>>>>> on other Mediatek devices.
>>>>>>>>>>
>>>>>>>>>> The MMSYS (Multimedia subsystem) in Mediatek SoCs has some registers to
>>>>>>>>>> control clock gates (which is used in the clk driver) and some registers
>>>>>>>>>> to set the routing and enable the differnet blocks of the display
>>>>>>>>>> and MDP (Media Data Path) subsystem. On this series the clk driver is
>>>>>>>>>> not a pure clock controller but a system controller that can provide
>>>>>>>>>> access to the shared registers between the different drivers that need
>>>>>>>>>> it (mediatek-drm and mediatek-mdp). And the biggest change is, that in
>>>>>>>>>> this version, clk driver is the entry point (parent) which will trigger
>>>>>>>>>> the probe of the corresponding mediatek-drm driver and pass its MMSYS
>>>>>>>>>> platform data for display configuration.
>>>>>>>>>
>>>>>>>>> When mmsys is a system controller, I prefer to place mmsys in
>>>>>>>>> drivers/soc/mediatek, and it share registers for clock, display, and mdp
>>>>>>>>> driver. This means the probe function is placed in
>>>>>>>>> drivers/soc/mediatek ,its display clock function, mdp clock function are
>>>>>>>>> placed in drivers/clk, display routing are placed in drivers/gpu/drm,
>>>>>>>>> and mdp routing are placed in dirvers/video.
>>>>>>>>>
>>>>>>>>
>>>>>>>> I understand what you mean but I am not sure this makes the code clearer and
>>>>>>>> useful. The driver in drivers/soc/mediatek will be a simple dummy implementation
>>>>>>>> of a "simple-mfd" device (a driver that simply matches with
>>>>>>>> "mediatek,mt8173-mmsys" and instantiates the "clk-mt8173-mm" and the
>>>>>>>> "mediatek-drm" driver (note that mediatek-mdp" is already instantiated via
>>>>>>>> device-tree).
>>>>>>>>
>>>>>>>
>>>>>>> It's clear that mmsys is neither a pure clock controller nor a pure
>>>>>>> routing controller for display and mdp. 
>>>>>>>
>>>>>>>> It'd be nice had a proper device-tree with a "simple-mfd" for mmsys from the
>>>>>>>> beginning representing how really hardwware is, but I think that, change this
>>>>>>>> now, will break backward compatibility.
>>>>>>>
>>>>>>> Maybe this is a solution. Current device tree would work only on old
>>>>>>> kernel version with a bug, so this mean there is no any device tree
>>>>>>> works on kernel version without bug. Why do we compatible with such
>>>>>>> device tree?
>>>>>>>
>>>>>>
>>>>
>>>> So the only reason why current DT worked at some point is because there was a
>>>> kernel bug?
>>>>
>>>
>>> I'd say you can call it a kernel bug:
>>> https://patchwork.kernel.org/patch/10367877/#22078767
>>>
>>>
>>>> If that's the case I think we shouldn't worry about break DT compatibility (I'm
>>>> sorry for those that having a buggy kernel makes display working)
>>>>
>>>>>> The idea behind this is, that the device-tree could be passed by some boot
>>>>>> firmware, so that the OS do not care about it. For this we need a stable DTS as
>>>>>> otherwise newer kernel with older FW would break.
>>>>>>
>>>>>> DTS is supposed to be just a different description of the HW like ACPI. So it
>>>>>> has to be compatible (newer kernel with older DTS and if possible vice versa).
>>>>>
>>>>> In my view, there is no FW (except some bug-inside FW) which works on
>>>>> this dts, so this dts is in a initial state. I think the compatibility
>>>>> is based on that dts correctly describe the HW. If we find this dts does
>>>>> not correctly describe the HW and it's in a initial state, should we
>>>>> still make it compatible?
>>>>>
>>>>
>>>> In this case I think we don't need to worry about buggy kernels, the only thing
>>>> that we need to take in consideration is that mmsys is instantiated on both (the
>>>> old DT and the new DT), we shouldn't expect display working (because never
>>>> worked, right?)
>>>>
>>>> With that in mind, I agree that is a good opportunity to fix properly the HW
>>>> topology.
>>>>
>>>> What thing that worries me is that I see this pattern on all Mediatek SoCs, does
>>>> this mean that display was never well supported for Mediatek SoCs?
>>>>
>>>
>>> That's exactly the case. Actually there were some patches for mt762x (can't
>>> remember if mt7623 or mt7622) whcih got pushed back, because we would need to
>>> fix the mmsys problem first.
>>>
>>> Ok, so if we come to the conclusion that this actually only worked because of a
>>> bug, then we can remodel the whole thing.
>>> In this case, I think the best would be to do what CK proposed:
>>> https://patchwork.kernel.org/patch/11381201/#23158169
>>>
>>> Making everything below 0x14000000 a subdevice of mmsys (mdp, ovl, rdma, you
>>> name it).
>>>
>>
>>
>> I see the MMSYS space as config registers to route the different ports in the
>> drm and video subsystem, so, as phandle of the display (drivers/gpur/drm) and
>> video (drivers/video) subsystem. What about something like this?
>>
>> mmsys: syscon@14000000 {
>> 	compatible = "mediatek,mt8173-mmsys", "syscon";
>> 	reg = <0 0x14000000 0 0x1000>;
>> 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>> 	assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
>> 	assigned-clock-rates = <400000000>;
>> 	#clock-cells = <1>;
>> };
>>
>> Basically is what we have with
>>
>> * [PATCH v8 4/6] clk: mediatek: mt8173: Switch MMSYS to platform driver
>>
>> And
>>
>> display-subsystem {
>> 	compatible = "mediatek,display-subsystem";
>> 	mediatek,mmsys = <&mmsys>; /* phandle to the routing config registers */
>> 	ports = <&ovl0>, <&ovl1>, < ... >
>> }
>>
>> We are introducing a new compatible that is not describing hardware but how
>> hardware is grouped, which I think is fine.
>>
>> The mediatek-drm driver will need a bit of rework but not much I guess.
>>
>> What is still not clear to me is the mdp part because doesn't seem to have an
>> entry point like the display part, instead it uses one port as entry point.
>>
>> 	mdp_rdma0: rdma@14001000 {
>> 		compatible = "mediatek,mt8173-mdp-rdma",
>> 			     "mediatek,mt8173-mdp";
>>
>> AFAICS that driver is not touching MMSYS config registers to route the mdp path,
>> only is getting the clocks, but I assume it will do in the future. In such case,
>> maybe we could do something similar to the display-subsystem node?
>>
> 
> Your proposal is to probe clock driver by mmsys device and probe display driver by another device. You have two choice to probe display driver: one is to create a virtual device that group display devices and probe display driver by this device. Another one is to choose one display device, such as OVL, to probe display driver.
> 
> I do not like a virtual device solution. In some Mediatek SoC, the routing is so flexible that one function block could be placed in display pipe or mdp pipe by different routing.
> 
> mmsys device control the display routing and display clock. OVL control. display overlay function. Both devices control partial display function, so probing display driver by which one looks the same for me.
> 
> I prefer to probe display driver by mmsys device because it has more information of display pipe line and OVL just focus on overlay function. Only when it's difficult to probe display driver by mmsys device, we have to probe display driver by OVL.
> 
> I think mmsys is really a multi-function device, and the device tree description may look like:
> 
> mmsys: system-controller@14000000 {
> 	compatible = "mediatek,mt8173-mmsys", "syscon", "simple-mfd";
> 	reg = <0 0x14000000 0 0x1000>;
> 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
> 	assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
> 	assigned-clock-rates = <400000000>;
> 	#clock-cells = <1>;
> 
> 	route {
> 		compatible = "mediatek,mt8173-mmsys-route";

Are you suggesting move the mediatek-drm routing to a new mt8173-mmsys-route
driver? Or this is a more generic routing device? Is this routing device already
implemented somewhere?

> 	};
> 
> 	clock {
> 		compatible = "mediatek,mt8173-mmsys-clk";
> 	};
> };
> 
> But from mt6797 register map [1], mmsys have many function such as fake engine, memory delay, reset,....
> Should we break each function into a sub device?
> Or we do not break any function (include clock and routing) into sub device?
> Or just break these two function into device, remove "simple-mfd" from mmsys, so the rest control is in mmsys top device?
> 

How do you see move mmsys to drivers/soc/mediatek and instantiate the clk and
mediatek-drm driver

 mmsys: syscon@14000000 {
 	compatible = "mediatek,mt8173-mmsys", "syscon", "simple-mfd";
 	reg = <0 0x14000000 0 0x1000>;
 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;

	clock-controller {
		compatible = "mediatek,clk-mt8173-mm"
		assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
	 	assigned-clock-rates = <400000000>;
 		#clock-cells = <1>;
	};

	display-subsystem {
		compatible = "mediatek,display-subsystem";
	};
 };


Regards,
 Enric

> [1] https://www.96boards.org/documentation/consumer/mediatekx20/additional-docs/docs/MT6797_Register_Table_Part_2.pdf
> 
> Regards,
> CK
> 
> 
>> Regards,
>>  Enric
>>
>>
>>> Regards,
>>> Matthias
>>>
>>>> Thanks.
>>>>
>>>>> If you have better solution, just let's forget this.
>>>>>
>>>>> Regards,
>>>>> CK
>>>>>
>>>>>>
>>>>>> Regards,
>>>>>> Matthias
>>>>>>
>>>>>>> Regards,
>>>>>>> CK
>>>>>>>
>>>>>>>>
>>>>>>>> IMHO I think that considering the clk driver as entry point is fine, but this is
>>>>>>>> something that the clock maintainers should decide.
>>>>>>>>
>>>>>>>> Also note that this is not only a MT8173 problem I am seeing the same problem on
>>>>>>>> all other Mediatek SoCs.
>>>>>>>>
>>>>>>>> Thanks.
>>>>>>>>
>>>>>>>>> Regards,
>>>>>>>>> CK
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> All this series was tested on the Acer R13 Chromebook only.
>>>>>>>>>>
>>>>>>>>>> For reference, here are the links to the old discussions:
>>>>>>>>>>
>>>>>>>>>> * v7: https://patchwork.kernel.org/project/linux-mediatek/list/?series=241217
>>>>>>>>>> * v6: https://patchwork.kernel.org/project/linux-mediatek/list/?series=213219
>>>>>>>>>> * v5: https://patchwork.kernel.org/project/linux-mediatek/list/?series=44063
>>>>>>>>>> * v4:
>>>>>>>>>>   * https://patchwork.kernel.org/patch/10530871/
>>>>>>>>>>   * https://patchwork.kernel.org/patch/10530883/
>>>>>>>>>>   * https://patchwork.kernel.org/patch/10530885/
>>>>>>>>>>   * https://patchwork.kernel.org/patch/10530911/
>>>>>>>>>>   * https://patchwork.kernel.org/patch/10530913/
>>>>>>>>>> * v3:
>>>>>>>>>>   * https://patchwork.kernel.org/patch/10367857/
>>>>>>>>>>   * https://patchwork.kernel.org/patch/10367861/
>>>>>>>>>>   * https://patchwork.kernel.org/patch/10367877/
>>>>>>>>>>   * https://patchwork.kernel.org/patch/10367875/
>>>>>>>>>>   * https://patchwork.kernel.org/patch/10367885/
>>>>>>>>>>   * https://patchwork.kernel.org/patch/10367883/
>>>>>>>>>>   * https://patchwork.kernel.org/patch/10367889/
>>>>>>>>>>   * https://patchwork.kernel.org/patch/10367907/
>>>>>>>>>>   * https://patchwork.kernel.org/patch/10367909/
>>>>>>>>>>   * https://patchwork.kernel.org/patch/10367905/
>>>>>>>>>> * v2: No relevant discussion, see v3
>>>>>>>>>> * v1:
>>>>>>>>>>   * https://patchwork.kernel.org/patch/10016497/
>>>>>>>>>>   * https://patchwork.kernel.org/patch/10016499/
>>>>>>>>>>   * https://patchwork.kernel.org/patch/10016505/
>>>>>>>>>>   * https://patchwork.kernel.org/patch/10016507/
>>>>>>>>>>
>>>>>>>>>> Best regards,
>>>>>>>>>>  Enric
>>>>>>>>>>
>>>>>>>>>> Changes in v8:
>>>>>>>>>> - Be a builtin_platform_driver like other mediatek mmsys drivers.
>>>>>>>>>> - New patches introduced in this series.
>>>>>>>>>>
>>>>>>>>>> Changes in v7:
>>>>>>>>>> - Add R-by from CK
>>>>>>>>>> - Add R-by from CK
>>>>>>>>>> - Fix check of return value of of_clk_get
>>>>>>>>>> - Fix identation
>>>>>>>>>> - Free clk_data->clks as well
>>>>>>>>>> - Get rid of private data structure
>>>>>>>>>>
>>>>>>>>>> Enric Balletbo i Serra (2):
>>>>>>>>>>   drm/mediatek: Move MMSYS configuration to include/linux/platform_data
>>>>>>>>>>   clk/drm: mediatek: Fix mediatek-drm device probing
>>>>>>>>>>
>>>>>>>>>> Matthias Brugger (4):
>>>>>>>>>>   drm/mediatek: Use regmap for register access
>>>>>>>>>>   drm/mediatek: Omit warning on probe defers
>>>>>>>>>>   media: mtk-mdp: Check return value of of_clk_get
>>>>>>>>>>   clk: mediatek: mt8173: Switch MMSYS to platform driver
>>>>>>>>>>
>>>>>>>>>>  drivers/clk/mediatek/Kconfig                  |   6 +
>>>>>>>>>>  drivers/clk/mediatek/Makefile                 |   1 +
>>>>>>>>>>  drivers/clk/mediatek/clk-mt2701-mm.c          |  30 +++
>>>>>>>>>>  drivers/clk/mediatek/clk-mt2712-mm.c          |  44 +++++
>>>>>>>>>>  drivers/clk/mediatek/clk-mt8173-mm.c          | 172 ++++++++++++++++++
>>>>>>>>>>  drivers/clk/mediatek/clk-mt8173.c             | 104 -----------
>>>>>>>>>>  drivers/gpu/drm/mediatek/mtk_disp_color.c     |   5 +-
>>>>>>>>>>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |   5 +-
>>>>>>>>>>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   5 +-
>>>>>>>>>>  drivers/gpu/drm/mediatek/mtk_dpi.c            |  12 +-
>>>>>>>>>>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |   4 +-
>>>>>>>>>>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c        |  53 +++---
>>>>>>>>>>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h        |   4 +-
>>>>>>>>>>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  56 +-----
>>>>>>>>>>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 113 +-----------
>>>>>>>>>>  drivers/gpu/drm/mediatek/mtk_drm_drv.h        |  13 +-
>>>>>>>>>>  drivers/gpu/drm/mediatek/mtk_dsi.c            |   8 +-
>>>>>>>>>>  drivers/gpu/drm/mediatek/mtk_hdmi.c           |   4 +-
>>>>>>>>>>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c |   6 +
>>>>>>>>>>  include/linux/platform_data/mtk_mmsys.h       |  73 ++++++++
>>>>>>>>>>  20 files changed, 401 insertions(+), 317 deletions(-)
>>>>>>>>>>  create mode 100644 drivers/clk/mediatek/clk-mt8173-mm.c
>>>>>>>>>>  create mode 100644 include/linux/platform_data/mtk_mmsys.h
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>
>>>>>>>> _______________________________________________
>>>>>>>> Linux-mediatek mailing list
>>>>>>>> Linux-mediatek@lists.infradead.org
>>>>>>>> http://lists.infradead.org/mailman/listinfo/linux-mediatek
>>>>>>>
>>>>>>
>>>>>> _______________________________________________
>>>>>> Linux-mediatek mailing list
>>>>>> Linux-mediatek@lists.infradead.org
>>>>>> http://lists.infradead.org/mailman/listinfo/linux-mediatek
>>>>>
>>>
>>
>> _______________________________________________
>> Linux-mediatek mailing list
>> Linux-mediatek@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
