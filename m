Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E69F9A3A2A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 11:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F6010E27C;
	Fri, 18 Oct 2024 09:38:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="sIOmjlZt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8AF10E27C
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 09:38:46 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D501888FE4;
 Fri, 18 Oct 2024 11:38:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1729244324;
 bh=+VS7STIkwsPw7S3kW+v2YTd1lj/k2vEqYHwS1JqUrwM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sIOmjlZt9HnILFO9pk9w+ssaX716q+cyXB0gkq/Ob20Gvh0kLoiO5RSJnE/aJe+dF
 OhWLXwT4BlGAc2bYOo8nw0Htymc3P+zq1B69v1ndNV5ashmnIWRCTv0dkn1nEhLQ3l
 0V8YdcC46RUlu/lPALqb2T+JCAlHLbzfDCMw+Gs/dPdypzrUpD6wMVpaGm6e+r4RAs
 Jej5kERU9YTvZLxZtWgz5RX1eOBVuCkdtRpuyQKFEFakhp0/m7teHXggxNKCD0aY68
 VLQ6CHdaaSh54yPs96/c1QluH3ETdcLUhCXj0lh8yIYhF9l0LR6wqIpmtcAIQTqlHV
 FRbO/1XpuIIEA==
Message-ID: <06bb1733-1742-4847-8436-8f9d8d4b7c46@denx.de>
Date: Fri, 18 Oct 2024 11:35:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: imx8mp-msc-sm2s-ep1: Add HDMI connector
To: Liu Ying <victor.liu@nxp.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 stefan@agner.ch, dmitry.baryshkov@linaro.org
References: <20241018064813.2750016-1-victor.liu@nxp.com>
 <20241018064813.2750016-4-victor.liu@nxp.com>
 <69cc9c59-99c0-479d-8143-63698cc56111@denx.de>
 <4d1c434e-e7bd-4e53-b110-1f26eb06c59c@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <4d1c434e-e7bd-4e53-b110-1f26eb06c59c@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/18/24 11:00 AM, Liu Ying wrote:
> On 10/18/2024, Marek Vasut wrote:
>> On 10/18/24 8:48 AM, Liu Ying wrote:
>>> Add a HDMI connector to connect with i.MX8MP HDMI TX output.
>>> This is a preparation for making the i.MX8MP LCDIF driver use
>>> drm_bridge_connector which requires the DRM_BRIDGE_ATTACH_NO_CONNECTOR
>>> flag.  With that flag, the DW HDMI bridge core driver would
>>> try to attach the next bridge which is the HDMI connector.
>>>
>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>> ---
>>>    .../dts/freescale/imx8mp-msc-sm2s-ep1.dts     | 19 +++++++++++++++++++
>>>    1 file changed, 19 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts b/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts
>>> index 83194ea7cb81..b776646a258a 100644
>>> --- a/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts
>>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts
>>> @@ -15,6 +15,17 @@ / {
>>>                 "avnet,sm2s-imx8mp-14N0600E", "avnet,sm2s-imx8mp",
>>>                 "fsl,imx8mp";
>>>    +    hdmi-connector {
>>> +        compatible = "hdmi-connector";
>>> +        type = "a";
>> Shouldn't this also have a 'label' property ?
> 
> 'label' property is not required by hdmi-connector.yaml and there
> are in-tree hdmi-connector nodes that haven't got it.
> I tried to find schematics for the board online, but failed.
> I don't have the board to see the label printed in silk layer, either.
> 
> If anyone can provide a valid label name, I may add it.
For the Kontron board, Frieder might be able to look it up for you ?

For the MSC one, hmmm, I am not sure. Anyone ?
