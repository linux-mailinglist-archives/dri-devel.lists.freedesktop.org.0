Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C81E9FC685
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 21:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1C710E39A;
	Wed, 25 Dec 2024 20:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="XUtzIYse";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482AB10E39A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 20:50:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 98BA8101ECBAB; Wed, 25 Dec 2024 21:49:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1735159804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j1aKFcorootUYVtMFPW/mgDVu+jID0c/UKLZ3rEjMkg=;
 b=XUtzIYseNKvVglNpfrWy4JZf5UDR0LygYVLIYjGMWIURe2VGSw9m0BROpIjFW2GcVwxZRT
 oNwxXTpw+o6ZmvcOXTds7frgeDq7nNDDYth7iqUblMu674db0ZH7ePk0lzc5yj7NEbWQlP
 3jtFBLB8O01UirBg9mgK4ogojhovYOFt9G+S9MO+qWXcS7fqhj6ELZH/zsXZkpoeCddi3m
 VKHgyOGExi6RlKiCfKju+ViFFe9s55r6XyVnt/sb58M/QvOL7VbJ6o2QO72deVIDebzHgE
 PhRUAwHy/97CxNBvsiTZ83BoJ5V0Wn3ExPJNKc9wbSlAMkXsaLP8Tk8WAiHRzQ==
Message-ID: <75dc6f74-f828-49ac-8bf6-41fd4e197855@denx.de>
Date: Wed, 25 Dec 2024 21:40:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/bridge: imx8mp-hdmi-tx: switch to bridge
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
References: <20241224014701.253490-1-marex@denx.de>
 <nehmmkv22ortkw6ngzlhjqo7emxsptt2dzoulln5ili52uswfp@h3acrwrad2y5>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <nehmmkv22ortkw6ngzlhjqo7emxsptt2dzoulln5ili52uswfp@h3acrwrad2y5>
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

On 12/24/24 5:21 AM, Dmitry Baryshkov wrote:
> On Tue, Dec 24, 2024 at 02:46:14AM +0100, Marek Vasut wrote:
>> The dw-hdmi output_port is set to 1 in order to look for a connector
>> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
>> The output_port set to 1 makes the DW HDMI driver core look up the
>> next bridge in DT, where the next bridge is often the hdmi-connector .
>>
>> Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
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
>> ---
>>   drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
>>   drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 +
>>   2 files changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
>> index 9a480c6abb856..d8e9fbf75edbb 100644
>> --- a/drivers/gpu/drm/bridge/imx/Kconfig
>> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
>> @@ -27,6 +27,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>>   config DRM_IMX8MP_HDMI_PVI
>>   	tristate "Freescale i.MX8MP HDMI PVI bridge support"
>>   	depends on OF
>> +	select DRM_DISPLAY_CONNECTOR
>>   	help
>>   	  Choose this to enable support for the internal HDMI TX Parallel
>>   	  Video Interface found on the Freescale i.MX8MP SoC.
>> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>> index 1e7a789ec2890..4ebae5ad072ad 100644
>> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>> @@ -101,6 +101,7 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
>>   	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
>>   	plat_data->priv_data = hdmi;
>>   	plat_data->phy_force_vendor = true;
>> +	plat_data->output_port = 1;
> 
> Quoting my feedback to a similar Liu's patch:
> 
> This will break compatibility with older DT files, which don't have
> output port. I think you need to add output_port_optional flag to
> dw_hdmi_plat_data and still return 0 from dw_hdmi_parse_dt() if the flag
> is set, but there is no remote node.
Looking at the upstream imx8mp*dts , the oldest commit which adds HDMI 
support is commit:

3e67a1ddd56d ("arm64: dts: imx8mp: Enable HDMI on TQMa8MPxL/MBa8MPxL")

That already contains the HDMI connector node. Every follow up addition 
of HDMI to another device has been a copy of the same commit, with 
connector, so I think it is safe to say, no upstream DT is going to be 
broken by this change. Do we care about hypothetical downstream DTs 
which may be missing the connector ?
