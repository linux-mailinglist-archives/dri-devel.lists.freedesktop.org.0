Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEB19DB5CA
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 11:35:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C571810E323;
	Thu, 28 Nov 2024 10:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gjk0/dTl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C76210E323
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 10:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1732790096;
 bh=8/cahMhVf/beqnAO6kLkUhE7M+kthrjeqe+JCUIupMw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gjk0/dTllmF4oWUI/AM4UXuzGhdfyOMp27YAP+dWbyr0YrNlUMedBeAVW7IOU0M33
 jWw51irBhanWLgbhCyI5fCp0EaSibAdX9FqOQJbh0wNy9E+eLNUjZrytnJXq7pUzN1
 IXyVlwaIHBk9zDO3esLnOanDiCqAPUVjZJXKnQvc3TbXFHJX2yUdYQ4Du4hIWalG+m
 uS29lDPMr+F5F6fzrBdlIUYwykQmojAZ5I30CEcaZZP+zBJusMytMpqY9ZIZ6qYxPC
 ZBqbaDdlPGFpLsKQWvpvWs3mdK92HYW5n6kcqpnWa1AFL+39pmwZeBIT05viQPlOmf
 NW/V8hkIVgpqw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 063CB17E35F2;
 Thu, 28 Nov 2024 11:34:54 +0100 (CET)
Message-ID: <bf679eb0-91ff-4701-a43f-891a75db10dc@collabora.com>
Date: Thu, 28 Nov 2024 11:34:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] drm/mediatek: Add support for MT8195 Digital
 Parallel Interface
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
References: <20241120124420.133914-1-angelogioacchino.delregno@collabora.com>
 <20241120124420.133914-7-angelogioacchino.delregno@collabora.com>
 <1b966a136f02b5586749a9c3d0bcec6c75224e49.camel@mediatek.com>
 <33acccd3-e543-493e-a61c-282d894ef2b1@collabora.com>
 <fd48c582e99d6c07be4b66919fb6c309379ad752.camel@mediatek.com>
 <f1d16db0-a7e1-4cfd-85c6-8beef4385701@collabora.com>
 <a8ca9d1314f12dbb95ac4e4b9e8929adab35eaba.camel@mediatek.com>
 <8e70d921-1420-4a57-a994-dc28abda25b7@collabora.com>
 <c46751894d01194d89da6c164b47a59cd1e86bb6.camel@mediatek.com>
 <23563d73-7de1-4316-9dd8-25ae6d66a8de@collabora.com>
 <84e688fed290a112b3a95767c5ee1f0e5677ac06.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <84e688fed290a112b3a95767c5ee1f0e5677ac06.camel@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 28/11/24 04:08, CK Hu (胡俊光) ha scritto:
> On Wed, 2024-11-27 at 13:44 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> Il 27/11/24 10:04, CK Hu (胡俊光) ha scritto:
>>> On Wed, 2024-11-27 at 09:41 +0100, AngeloGioacchino Del Regno wrote:
>>>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>>>
>>>>
>>>> Il 27/11/24 08:02, CK Hu (胡俊光) ha scritto:
>>>>> On Tue, 2024-11-26 at 10:25 +0100, AngeloGioacchino Del Regno wrote:
>>>>>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>>>>>
>>>>>>
>>>>>> Il 26/11/24 04:07, CK Hu (胡俊光) ha scritto:
>>>>>>> On Mon, 2024-11-25 at 17:55 +0100, AngeloGioacchino Del Regno wrote:
>>>>>>>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>>>>>>>
>>>>>>>>
>>>>>>>> Il 22/11/24 08:23, CK Hu (胡俊光) ha scritto:
>>>>>>>>> Hi, Angelo:
>>>>>>>>>
>>>>>>>>> On Wed, 2024-11-20 at 13:44 +0100, AngeloGioacchino Del Regno wrote:
>>>>>>>>>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Add support for the DPI block found in the MT8195 and MT8188 SoCs.
>>>>>>>>>> Inside of the SoC, this block is directly connected to the HDMI IP.
>>>>>>>>>
>>>>>>>>> In MT8173, DPI0 is directly connected to HDMI.
>>>>>>>>> The first version of this driver is just for MT8173 DPI0.
>>>>>>>>> Does MT8173 DPI0 need this modification?
>>>>>>>>> Or this modification is just for MT8188 and MT8195, then the description should be more than 'directly connected'.
>>>>>>>>>
>>>>>>>>
>>>>>>>> This is only for MT8188 and MT8195, and MT8173 does *not* need any modification.
>>>>>>>>
>>>>>>>> Please, what would you like to see in the description of this commit?
>>>>>>>
>>>>>>> This patch does four jobs.
>>>>>>>
>>>>>>> 1. Enable/disable tvd_clk for MT8195/MT8188 DPI.
>>>>>>> 2. Do not set pixel clock for MT8195/MT8188 DPI.
>>>>>>> 3. New DPI_INPUT_XXX and DPI_OUTPUT_XXX control for MT8195/MT8188 DPI.
>>>>>>> 4. Do not power on/off for MT8195/MT8188 DPI.
>>>>>>>
>>>>>>> Maybe you should break into 4 patches and each one has different reason.
>>>>>>
>>>>>> Yeah I thought about that as well, but there's a fundamental issue with splitting
>>>>>> the thing in multiple patches...
>>>>>>
>>>>>> For enabling the tvd_clk in a separate patch, there's no problem - however, for the
>>>>>> others....
>>>>>>
>>>>>> 1. We need to introduce support for MT8195/88 DPI-HDMI, or the other patches would
>>>>>>        not make sense (nor apply, anyway); then
>>>>>> 2. We stop setting pixel clock with another patch; then
>>>>>> 3. we don't power on/off, etc etc
>>>>>>
>>>>>> The problem with doing it like so is that the patch #1 that I described would be
>>>>>> introducing *faulty code*, because the support for that really depends on all of
>>>>>> the others being present (otherwise the block won't work correctly).
>>>>>>
>>>>>> So... if you want, I can easily split out the tvd_clk enable/disable, but splitting
>>>>>> the rest wouldn't be clean.
>>>>>>
>>>>>> Besides, keep in mind that... actually... for anything else that is not MT8195/88
>>>>>> DPI0 (so, for other SoCs' DPI and for 95/88 DPINTF) the tvd_clk is already getting
>>>>>> enabled by its child.. so, for those ones, a call to enable tvd_clk does exactly
>>>>>> nothing apart from incrementing (enable) or decrementing (disable) the refcount for
>>>>>> this clock by 1.
>>>>>>
>>>>>> This means that the enablement/disablement of tvd_clk is actually important only
>>>>>> for the MT8195/88 DPI and has literally no effect on anything else that is
>>>>>> currently supported by the mtk_dpi driver anyway.
>>>>>>
>>>>>> Still - if you want me to split out the tvd_clk en/dis patch, just confirm and I
>>>>>> will split that one out...
>>>>>>
>>>>>>>
>>>>>>> For #1 and #2, I've not reviewed the HDMI driver. Is the clock control influenced by new HDMI driver.
>>>>>>
>>>>>> It kinda is - the HDMI-TX block gets its clock from the HDMI PHY's clock gen,
>>>>>> but eventually it is the HDMI driver that tells to the PHY driver what clock it
>>>>>> actually wants.
>>>>>>
>>>>>> For #1, clk_prepare_enable() is ungating the clock that would otherwise gate the
>>>>>> PHY's PLL output to the HDMI block.
>>>>>>
>>>>>>> If it is software reason, maybe we can modify the new HDMI driver and make DPI driver consistent with MT8173.
>>>>>>> If it is hardware reason. just describe the hardware reason.
>>>>>>
>>>>>> Alright - the hardware reason is that the HDMIPHY generates the clock for the HDMI
>>>>>> TX block, and that enabling the clock assigned to tvd_clk is necessary to ungate
>>>>>> the PHY's ckgen output to the HDMI-TX (and I think - but not sure as I haven't
>>>>>> analyzed that yet - that HDMI-RX should have the same gating technique, but that's
>>>>>> definitely out of scope for this submission).
>>>>>
>>>>> I think tvd_clk is the clock source of DPI, HDMI, and HDMI-PHY, so these hardware could work in the same frequency.
>>>>> That means drivers of DPI, HDMI, and HDMI-PHY are equal to control tvd_clk.
>>>>> In MT8173. software choose DPI driver to control tvd_clk.
>>>>> In MT8195, software choose HDMI-PHY driver to control tvd_clk.
>>>>
>>>> Yes, but in MT8195 the tvd is gated by a clock that is controller by the HDMI
>>>> driver only, and not by the PHY - so, PHY sets the frequency, mtk_hdmi_v2 ungates
>>>> that to the HDMITX block (with clk_prepare_enable(tvd_clk)).
>>>>
>>>>>
>>>>> I would like to have the same control flow.
>>>>> If "HDMI-PHY driver to control tvd_clk" is better, we could temporarily let MT8195 has different flow with MT8173.
>>>>> So, is "HDMI-PHY driver to control tvd_clk" better?
>>>>>
>>>>
>>>> I'm not sure I understand this last part, can you please rephrase?
>>>
>>> I would like MT8173 and MT8195 has the same control flow, so keep DPI driver to control tvd_clk in MT8195.
>>> If it's better to control tvd_clk by HDMI-PHY driver, both MT8173 and MT8195 control tvd_clk by HDMI-PHY driver.
>>> But we are not able to test MT8173. So MT8173 keep control tvd_clk by DPI driver.
>>> So control tvd_clk by HDMI-PHY driver is better?
>>>
>>
>> Oh. Okay now I understand what you mean.
>>
>> Unfortunately, we cannot control the tvd->hdmi gate from the PHY driver... this is
>> because we do really rely on a specific ungate sequence, and the DPI driver really
>> does need to control the gating of that CG on its own: when we want to bring up the
>> DPI+HDMI, we need to:
>>    - Start with *gated* clocks, so HW is OFF;
>>    - Call mtk_dpi_bridge_enable() (done by drm framework);
>>      - There, we now *ungate* the clocks
>>      - DPI HW is ON -> we reset and write config to DPI registers
>>        with function mtk_dpi_set_display_mode()
>>      - We enable the DPI output (set EN in DPI_EN register)
>>
>> If we move the CG to HDMI PHY, then we have to phy_configure() and phy_enable()
>> inside of the DPI driver, which is also not really possible and can only be done
>> in the HDMI driver - and that's because the HDMI driver reads EDID from DDC,
>> which gives us the wanted pixel clock, and feeds it to the PHY.
>>
>> In short, there's no way around that, the gating cannot be moved out of DPI driver.
>>
>>>>
>>>>>>
>>>>>>>
>>>>>>> For #4, I don't know why DPI do not control power by its self?
>>>>>>> Even though other driver may control the same power, power manager has reference count,
>>>>>>> so each driver could control the same power by its self.
>>>>>>
>>>>>> #4 is there both for a SW and for a HW reason.
>>>>>>
>>>>>> The HW reason is that the DPI shall be powered on in a specific sequence in regard
>>>>>> to HDMI-TX, due to the setup that is required by both (and ungating clocks before
>>>>>> full configuration happens would lock up the hw block).
>>>>>>
>>>>>> The SW reason is that mtk_crtc.c calls mtk_crtc_ddp_hw_init()->mtk_ddp_comp_start()
>>>>>> in its .atomic_enable() callback, which happens in the wrong sequence in regard to
>>>>>> HDMI because of the "natural" components order in the DRM framework (for MT8195/88!
>>>>>> because for the others it either is the inverse or it does not matter - so for
>>>>>> performance it's okay for it to be like that both on older SoCs and on DPINTF for
>>>>>> 95/88) and this means that we *must not* call dpi_power_on() at that time but
>>>>>> we must rather follow the atomic_enable()/bridge_enable() order imposed by DRM
>>>>>> *also* for the clock en/dis calls in DPI.
>>>>>
>>>>> It looks like the #4 could be a separate patch.
>>>>> The commit message is what you describe here.
>>>>> And
>>>>>
>>>>> if (!dpi->conf->support_hdmi_power_sequence)
>>>>>         mtk_dpi_power_on();
>>>>>
>>>>
>>>> This means that I'd have to introduce the "hdmi power sequence" before actually
>>>> introducing the real support for MT8195 HDMI....
>>>> I honestly don't like that "too much", but it's fine, I don't have *too strong*
>>>> opinions about that, so I will separate #4 as you suggested for v2.
>>>
>>> This DPI series modification is all about HDMI.
>>> Maybe merge this series with HDMI series and let the HDMI part in front of DPI part and it's more reasonable.
>>>
>>
>> I have sent the two separately only because I thought it'd be easier for you to
>> review them .. well, separately.
>> But .. yes, this series is 99% about HDMI - the only thing that's not related to
>> HDMI is patch [3/6] which is just a cleanup...
>>
>> So if you want I can merge the two series into one, that's not a problem at all;
>> in that case, do you want me to keep the patches as they are, or do you want me
>> to still split #4 away from this patch?
> 
> I think each part would use a different config variable to show which code is related to which part.
> So #4 could keep in this patch.
> The commit message should describe all these parts.
> 
> If breakdown, it would be:
> 
> Patch 1: Add config variable 1
> Patch 2: Add config variable 2
> ...
> Patch n: Add support for MT8195 DPI support (add MT8195 config table)
> 
> Both combine into one patch or breakdown to multiple patch is OK for me.
> 

Okay, since both ways are ok for you, I will keep the commits layout as it is,
which is something that I do prefer because it simply makes more sense in my
opinion.

Thank you for the feedback

Cheers!

> Regards,
> CK
> 
>>
>>> Regards,
>>> CK
>>>
>>>>
>>>> Cheers,
>>>> Angelo
>>>>
>>>>> Regards,
>>>>> CK
>>>>>
>>>>>>
>>>>>> Cheers,
>>>>>> Angelo
>>>>>>
>>>>>>>
>>>>>>> Regards,
>>>>>>> CK
>>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> Cheers,
>>>>>>>> Angelo
>>>>>>>>
>>>>>>>>> Regards,
>>>>>>>>> CK
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>>>>>>>> ---
>>>>>>>>
>>>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>
>>>>
>>>>
>>
>>

