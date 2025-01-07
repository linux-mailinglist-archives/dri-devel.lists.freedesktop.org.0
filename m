Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C29A03D8A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 12:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F74C10E406;
	Tue,  7 Jan 2025 11:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="RTRWgK8M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A9110E406
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 11:24:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1CF61101ECB24; Tue,  7 Jan 2025 12:24:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1736249096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r2ff0HaCcjmmj9KnhUdBh5w7Yu5An6vyL+EnPFzNUxM=;
 b=RTRWgK8MQwcxk8DstoWOZvN2/3kvry5mG8JD2y5yOxA82ctZZp6KWEPNEDoXWsNkRCxPK9
 kK1yUy0mcKomy/pLdtu34wp/qBQLj06fK3+hhFedORfXEvPglXKnhk3wDBR9/1bIrj7ArB
 OI2Gi5edckf4vOG2KjWaWu+P6f9vIbMuVDg6/v6mglbrQWFw0T4QNNTZUK1gZomy83NqsC
 ftDYnHdWjlAcmxOpSFRZzEVd6ch+K6IalzRuHt3hy9ZEradm/uQkophOkQ8lIk4uhiWbKg
 /ar4bJIYqR0nefQKmR4kFGQxyau7P4yEHom8Hnuh+rYPqpxWzm2L0EcVpS/9CA==
Message-ID: <c02d8298-28dd-4e48-8899-7316bd60dddb@denx.de>
Date: Tue, 7 Jan 2025 12:08:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie
 <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250105190659.99941-1-marex@denx.de>
 <20250105190659.99941-2-marex@denx.de>
 <0b1c9897-2769-4ca0-9927-ac930b4c634b@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <0b1c9897-2769-4ca0-9927-ac930b4c634b@nxp.com>
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

On 1/7/25 6:38 AM, Liu Ying wrote:
> On 01/06/2025, Marek Vasut wrote:
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
>> V4: - Remove select DRM_DISPLAY_CONNECTOR
>> ---
>>   drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>> index 1e7a789ec2890..3d63200e468bf 100644
>> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>> @@ -101,6 +101,8 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
>>   	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
>>   	plat_data->priv_data = hdmi;
>>   	plat_data->phy_force_vendor = true;
>> +	plat_data->output_port = 1;
> 
> How would you keep the behaviour of the connector after adding
> DRM_BRIDGE_ATTACH_NO_CONNECTOR in display controller driver?
> dw_hdmi_connector_create() implements CEC support at least.  This was pointed
> out in v2 and v3 comments.
> 
> https://lore.kernel.org/all/vvsj6ri2ke25nzocbq736yv7rphzma6pn3yk2uh7iu43zfe2sa@2fwye4k4w6he/
As far as I understand it, the CEC is being worked on separately already ?
