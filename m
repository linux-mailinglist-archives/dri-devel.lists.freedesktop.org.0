Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE557A00186
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 00:24:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE3510E37A;
	Thu,  2 Jan 2025 23:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="MObaNnWw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357C110E37A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 23:24:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B96E4101C7E2A; Fri,  3 Jan 2025 00:23:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1735860230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=//EZX9tB291dgvxJPupqEO2OxNoDgoYJ0gAp7zGGuXU=;
 b=MObaNnWw1Cm105VIEgb8mGHlBXm1+eDOkX4Vd1+8q4N0Oualhspq96FPVwL8VhAjCPPgGj
 oCpKxfj2m19J3epaMh0Fsv/BCYAL3HkowwdQdEPSpK+3ltJOjD95K3+9ae2m2k29jh7++X
 qX6zwOLs9Z/B+zWr6ifJbv2FtleOSMJwbLHPedsrz4xU+yO2B67x/G93Nul0dLbzBgvvfr
 kM+quR891CTAjH++1E8kYZtARZuLJAID7fxIfT4J9qYYSwLfyBT7t++sipHVAZQpxxxmtz
 IDvpTMa1L+SSXdARShnmCxo5O1QfF3lB0KAF+fzf4ZaWC8qmYMwetfya/Z2BOQ==
Message-ID: <549d96ee-a675-47fd-9af0-0dc05744591c@denx.de>
Date: Fri, 3 Jan 2025 00:22:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241231192925.97614-1-marex@denx.de>
 <20241231192925.97614-2-marex@denx.de>
 <sjyw3afx5qyrupf5tixgtubevmklgmstjvj3hjt5xukzmgluuv@47j6afzl5dp6>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <sjyw3afx5qyrupf5tixgtubevmklgmstjvj3hjt5xukzmgluuv@47j6afzl5dp6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

On 1/2/25 5:55 AM, Dmitry Baryshkov wrote:
> On Tue, Dec 31, 2024 at 08:28:49PM +0100, Marek Vasut wrote:
>> The dw-hdmi output_port is set to 1 in order to look for a connector
>> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
>> The output_port set to 1 makes the DW HDMI driver core look up the
>> next bridge in DT, where the next bridge is often the hdmi-connector .
>>
>> Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
>>
>> Note that looking at the upstream arch/arm64/boot/dts/freescale/imx8mp*dts ,
>> the oldest commit which adds HDMI support is commit:
>>
>> 3e67a1ddd56d ("arm64: dts: imx8mp: Enable HDMI on TQMa8MPxL/MBa8MPxL")
>>
>> That already contains the HDMI connector node. Most follow up additions
>> of HDMI support to another devices has been a variation of the same commit,
>> including connector node, which is the proper way of eanbling HDMI on the
>> i.MX8MP.
>>
>> The rest should be covered by output_port_optional which should make systems
>> with DTs without HDMI connector node work, but such DTs should be updated and
>> the HDMI connector node should be added.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Cc: Jonas Karlman <jonas@kwiboo.se>
>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>> Cc: Liu Ying <victor.liu@nxp.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Robert Foss <rfoss@kernel.org>
>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Stefan Agner <stefan@agner.ch>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: imx@lists.linux.dev
>> Cc: linux-arm-kernel@lists.infradead.org
>> ---
>> V2: No change
>> V3: - Update commit message
>>      - Move select DRM_DISPLAY_CONNECTOR to DRM_IMX8MP_DW_HDMI_BRIDGE
>>      - Enable output_port_optional
>> ---
>>   drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
>>   drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 2 ++
>>   2 files changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
>> index 9a480c6abb856..db5c8a76193ac 100644
>> --- a/drivers/gpu/drm/bridge/imx/Kconfig
>> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
>> @@ -17,6 +17,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>>   	tristate "Freescale i.MX8MP HDMI-TX bridge support"
>>   	depends on OF
>>   	depends on COMMON_CLK
>> +	select DRM_DISPLAY_CONNECTOR
> 
> I was going to write that it is not to be selected by anybody, but then
> I stumbled upon meson driver, which also selects the symbol.
> 
> I still think that it is not to be selected by your driver as there is
> no direct dependency (and there can be other bridges inbetween or the
> bridge chain can end up with some other bridge). Such decisions belong
> to defconfig or distribution's kernel config file.
Wouldn't that only lead to unnecessary surprises on user side ?
