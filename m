Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 810D54AE5A9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 00:52:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A73B10E2A2;
	Tue,  8 Feb 2022 23:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCDD10E2A2
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 23:52:14 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9060A83DDF;
 Wed,  9 Feb 2022 00:52:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1644364332;
 bh=H8eW9+3mcVmhpPeNP0jiKyHLs9rbfP6Pvo0wsJGq/FU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kV2DJWs9YsqiSDoFUClP46c4xNiSvSGUrs/4+Pyh3uKL0tNXIZrJ13paApM6SYCdc
 4cdQ52zzf07cNfKaQVX5L1oZb5cdzIqco4pXPnJrtflq9ifi+ScpnA6QEfldIA8FRa
 HVA4Nhu91w5Yq6K5kbMse/GusR2bnnwb3jQ0+FyhRMrbl+O/EIybXdOAhqqToUtf5Q
 qfyBTTqJhc0qqx4864R7oIkDxbIzaS/twkmhwfQRHH8G4RxiseECA0ZGsil/RY91jI
 wkrmfG7xzt3t7Kme6HscN5YrdUOrorjG9pm55LCDpn+OpPJvXM5osB/2GlXjVDukVc
 PUMtd6+5oezmg==
Message-ID: <bef41ee6-d070-109f-33c2-95103e7ef6a3@denx.de>
Date: Wed, 9 Feb 2022 00:52:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [RFC][PATCH] Revert "drm/panel-simple: drop use of data-mapping
 property"
Content-Language: en-US
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220201110717.3585-1-cniedermaier@dh-electronics.com>
 <YfsXt1lU6l9cSctX@pendragon.ideasonboard.com>
 <4a2f4707c03d4509aa5f3a388cbfbe04@dh-electronics.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <4a2f4707c03d4509aa5f3a388cbfbe04@dh-electronics.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/8/22 22:27, Christoph Niedermaier wrote:
> From: Laurent Pinchart [mailto:laurent.pinchart@ideasonboard.com]
> Sent: Thursday, February 3, 2022 12:46 AM
>>
>> Hi Christoph,
>>
> 
> Hi Laurent,
> 
>> On Tue, Feb 01, 2022 at 12:07:17PM +0100, Christoph Niedermaier wrote:
>>> Without the data-mapping devicetree property my display won't
>>> work properly. It is flickering, because the bus flags won't
>>> be assigned without a defined bus format by the imx parallel
>>> display driver. There was a discussion about the removal [1]
>>> and an agreement that a better solution is needed, but it is
>>> missing so far. So what would be the better approach?
>>>
>>> [1] https://patchwork.freedesktop.org/patch/357659/?series=74705&rev=1
>>>
>>> This reverts commit d021d751c14752a0266865700f6f212fab40a18c.
>>>
>>> Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
>>> Cc: Marek Vasut <marex@denx.de>
>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>>> Cc: David Airlie <airlied@linux.ie>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: Shawn Guo <shawnguo@kernel.org>
>>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>>> Cc: Fabio Estevam <festevam@gmail.com>
>>> Cc: NXP Linux Team <linux-imx@nxp.com>
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> To: dri-devel@lists.freedesktop.org
>>> ---
>>>   drivers/gpu/drm/panel/panel-simple.c | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
>>> index 3c08f9827acf..2c683d94a3f3 100644
>>> --- a/drivers/gpu/drm/panel/panel-simple.c
>>> +++ b/drivers/gpu/drm/panel/panel-simple.c
>>> @@ -453,6 +453,7 @@ static int panel_dpi_probe(struct device *dev,
>>>        struct panel_desc *desc;
>>>        unsigned int bus_flags;
>>>        struct videomode vm;
>>> +     const char *mapping;
>>>        int ret;
>>>
>>>        np = dev->of_node;
>>> @@ -477,6 +478,16 @@ static int panel_dpi_probe(struct device *dev,
>>>        of_property_read_u32(np, "width-mm", &desc->size.width);
>>>        of_property_read_u32(np, "height-mm", &desc->size.height);
>>>
>>> +     of_property_read_string(np, "data-mapping", &mapping);
>>> +     if (!strcmp(mapping, "rgb24"))
>>> +             desc->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
>>> +     else if (!strcmp(mapping, "rgb565"))
>>> +             desc->bus_format = MEDIA_BUS_FMT_RGB565_1X16;
>>> +     else if (!strcmp(mapping, "bgr666"))
>>> +             desc->bus_format = MEDIA_BUS_FMT_RGB666_1X18;
>>> +     else if (!strcmp(mapping, "lvds666"))
>>> +             desc->bus_format = MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
>>
>> You're right that there's an issue, but a revert isn't the right option.
>> The commit you're reverting never made it in a stable release, because
>> it was deemed to not be a good enough option.
>>
>> First of all, any attempt to fix this should include an update to the DT
>> binding. Second, as this is about DPI panels, the LVDS option should be
>> dropped. Finally, I've shared some initial thoughts in [1], maybe you
>> can reply to that e-mail to continue the discussion there ?
> 
> According to your thoughts in [1] you mean that the bus format should be
> build out of the devicetree properties bus-width and data-shift. It would
> be possible for evenly structured busses like RGB888_1X24 and RGB666_1X18,
> but what about a bus like RGB565_1X16, where each color has different
> bus width. Also the order of the colors should be defined to differ
> between busses like RGB888_1X24 and GBR888_1X24.
> Are there any ideas how can this be covered?

Maybe with props like these ?

channel-width -- width of each color channel
channel-shift -- shift of each color channel
channel-map -- mapping of each color channel

So for RGB888
channel-width = <8 8 8>;
channel-shift = <0 0 0>;
channel-map = "RGB"; // or something ?

For BGR565 panel connected to RGB24 scanout
channel-width = <5 6 5>;
channel-shift = <3 2 3>;
channel-map = "BGR"; // or something ?

For BGR565 panel connected to RGB565 scanout
channel-width = <5 6 5>;
channel-shift = <0 0 0>;
channel-map = "BGR"; // or something ?
