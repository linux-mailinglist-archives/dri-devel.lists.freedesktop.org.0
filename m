Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C244D0E54
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 04:31:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1777010E4EC;
	Tue,  8 Mar 2022 03:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m121144.qiye.163.com (mail-m121144.qiye.163.com
 [115.236.121.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D8F10E4EC
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 03:31:25 +0000 (UTC)
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m121144.qiye.163.com (Hmail) with ESMTPA id 1E19CAC03A0;
 Tue,  8 Mar 2022 11:31:23 +0800 (CST)
Message-ID: <035f2dfd-bf35-abca-32bf-2be85cc88f8a@rock-chips.com>
Date: Tue, 8 Mar 2022 11:31:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 10/24] drm/rockchip: dw_hdmi: Add support for hclk
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Robin Murphy <robin.murphy@arm.com>,
 elaine.zhang@rock-chips.com
References: <20220225075150.2729401-1-s.hauer@pengutronix.de>
 <20220225075150.2729401-11-s.hauer@pengutronix.de>
 <47ddcaf3-4544-2b7c-a2f6-1f6346907f33@gmail.com>
 <20220225104924.GC19585@pengutronix.de>
 <78207d97-b5a1-9792-8ec9-11fcf2e00370@gmail.com>
 <90c61299-f02c-607b-4734-7134852ef0a6@arm.com>
 <20220225131154.GE19585@pengutronix.de>
 <20220228141921.GN19585@pengutronix.de>
 <5184ecf2-8734-3121-cbbc-5dcfcf0d02f8@arm.com>
 <20220302112528.GV19585@pengutronix.de>
 <20220304142235.GL22780@pengutronix.de>
 <9ea0134e-aac7-60e1-5c58-ae31b4e1c422@collabora.com>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <9ea0134e-aac7-60e1-5c58-ae31b4e1c422@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUlKS0tKN1dZLVlBSVdZDwkaFQgSH1lBWRpNSE5WSRhDHRpKGB
 hLGUpKVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PBQ6Ayo4PT5RNzItAx8xDhYL
 N1FPC0tVSlVKTU9NTEpLSUNIQk5LVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBQkNPQjcG
X-HM-Tid: 0a7f6794dd93b039kuuu1e19cac03a0
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
Cc: huangtao@rock-chips.com, devicetree@vger.kernel.org,
 algea.cao@rock-chips.com, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, Kever Yang <Kever.yang@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Dmitry Osipenko <digetx@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi :

On 3/5/22 07:55, Dmitry Osipenko wrote:
> On 3/4/22 17:22, Sascha Hauer wrote:
>> On Wed, Mar 02, 2022 at 12:25:28PM +0100, Sascha Hauer wrote:
>>> On Tue, Mar 01, 2022 at 01:39:31PM +0000, Robin Murphy wrote:
>>>> On 2022-02-28 14:19, Sascha Hauer wrote:
>>>>> On Fri, Feb 25, 2022 at 02:11:54PM +0100, Sascha Hauer wrote:
>>>>>> On Fri, Feb 25, 2022 at 12:41:23PM +0000, Robin Murphy wrote:
>>>>>>> On 2022-02-25 11:10, Dmitry Osipenko wrote:
>>>>>>>> 25.02.2022 13:49, Sascha Hauer пишет:
>>>>>>>>> On Fri, Feb 25, 2022 at 01:26:14PM +0300, Dmitry Osipenko wrote:
>>>>>>>>>> 25.02.2022 10:51, Sascha Hauer пишет:
>>>>>>>>>>> The rk3568 HDMI has an additional clock that needs to be enabled for the
>>>>>>>>>>> HDMI controller to work. The purpose of that clock is not clear. It is
>>>>>>>>>>> named "hclk" in the downstream driver, so use the same name.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
>>>>>>>>>>> ---
>>>>>>>>>>>
>>>>>>>>>>> Notes:
>>>>>>>>>>>        Changes since v5:
>>>>>>>>>>>        - Use devm_clk_get_optional rather than devm_clk_get
>>>>>>>>>>>
>>>>>>>>>>>     drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 16 ++++++++++++++++
>>>>>>>>>>>     1 file changed, 16 insertions(+)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>>>>>>>>>>> index fe4f9556239ac..c6c00e8779ab5 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>>>>>>>>>>> @@ -76,6 +76,7 @@ struct rockchip_hdmi {
>>>>>>>>>>>     	const struct rockchip_hdmi_chip_data *chip_data;
>>>>>>>>>>>     	struct clk *ref_clk;
>>>>>>>>>>>     	struct clk *grf_clk;
>>>>>>>>>>> +	struct clk *hclk_clk;
>>>>>>>>>>>     	struct dw_hdmi *hdmi;
>>>>>>>>>>>     	struct regulator *avdd_0v9;
>>>>>>>>>>>     	struct regulator *avdd_1v8;
>>>>>>>>>>> @@ -229,6 +230,14 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
>>>>>>>>>>>     		return PTR_ERR(hdmi->grf_clk);
>>>>>>>>>>>     	}
>>>>>>>>>>> +	hdmi->hclk_clk = devm_clk_get_optional(hdmi->dev, "hclk");
>>>>>>>>>>> +	if (PTR_ERR(hdmi->hclk_clk) == -EPROBE_DEFER) {
>>>>>>>>>> Have you tried to investigate the hclk? I'm still thinking that's not
>>>>>>>>>> only HDMI that needs this clock and then the hardware description
>>>>>>>>>> doesn't look correct.
>>>>>>>>> I am still not sure what you mean. Yes, it's not only the HDMI that
>>>>>>>>> needs this clock. The VOP2 needs it as well and the driver handles that.
>>>>>>>> I'm curious whether DSI/DP also need that clock to be enabled. If they
>>>>>>>> do, then you aren't modeling h/w properly AFAICS.
>>>>>>> Assuming nobody at Rockchip decided to make things needlessly inconsistent
>>>>>>> with previous SoCs, HCLK_VOP should be the clock for the VOP's AHB slave
>>>>>>> interface. Usually, if that affected anything other than accessing VOP
>>>>>>> registers, indeed it would smell of something being wrong in the clock tree,
>>>>>>> but in this case I'd also be suspicious of whether it might have ended up
>>>>>>> clocking related GRF registers as well (either directly, or indirectly via
>>>>>>> some gate that the clock driver hasn't modelled yet).
>>>>>> Ok, I am beginning to understand. I verified that hdmi, mipi and dp are
>>>>>> hanging when HCLK_VOP is disabled by disabling that clock via sysfs
>>>>>> using CLOCK_ALLOW_WRITE_DEBUGFS. When it's disabled then the registers
>>>>>> of that units can't be accessed. However, when I disable HCLK_VOP by
>>>>>> directly writing to the gate bit RK3568_CLKGATE_CON(20) then only
>>>>>> accessing VOP registers hangs, the other units stay functional.
>>>>>> So it seems it must be the parent clock which must be enabled. The
>>>>>> parent clock is hclk_vo. This clock should be handled as part of the
>>>>>> RK3568_PD_VO power domain:
>>>>>>
>>>>>> 	power-domain@RK3568_PD_VO {
>>>>>>                   reg = <RK3568_PD_VO>;
>>>>>>                   clocks = <&cru HCLK_VO>,
>>>>>>                            <&cru PCLK_VO>,
>>>>>>                            <&cru ACLK_VOP_PRE>;
>>>>>>                    pm_qos = <&qos_hdcp>,
>>>>>>                             <&qos_vop_m0>,
>>>>>>                             <&qos_vop_m1>;
>>>>>>                    #power-domain-cells = <0>;
>>>>>>           };
>>>>> Forget this. The clocks in this node are only enabled during enabling or
>>>>> disabling the power domain, they are disabled again immediately afterwards.
>>>>>
>>>>> OK, I need HCLK_VO to access the HDMI registers. I verified that by
>>>>> disabling HCLK_VO at register level (CRU_GATE_CON(20) BIT(1)). The
>>>>> HDMI registers become inaccessible then. This means I'll replace
>>>>> HCLK_VOP in the HDMI node with HCLK_VO. Does this sound sane?
>>>> Well, it's still a mystery hack overall, and in some ways it seems even more
>>>> suspect to be claiming a whole branch of the clock tree rather than a leaf
>>>> gate with a specific purpose. I'm really starting to think that the
>>>> underlying issue here is a bug in the clock driver, or a hardware mishap
>>>> that should logically be worked around by the clock driver, rather than
>>>> individual the consumers.
>>>>
>>>> Does it work if you hack the clock driver to think that PCLK_VO is a child
>>>> of HCLK_VO? Even if that's not technically true, it would seem to
>>>> effectively match the observed behaviour (i.e. all 3 things whose register
>>>> access apparently *should* be enabled by a gate off PCLK_VO, seem to also
>>>> require HCLK_VO).
>>> Yes, that works as expected. I am not sure though if we really want to
>>> go that path. The pclk rates will become completely bogus with this and
>>> should we have to play with the rates in the future we might regret this
>>> step.
>> How do we proceed here? I can include a patch which makes PCLK_VO a
>> child of HCLK_VO if that's what we agree upon.
> Couldn't Andy clarify the actual clock tree structure of the h/w for us?
>
> This will be the best option because datasheet doesn't give the clear
> answer, or at least I couldn't find it. Technically, PCLK indeed should
> be a child of the HCLK in general, so Robin could be right.


Add our clk expert Elaine, she will share some information about the 
actual clock structure.


> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
