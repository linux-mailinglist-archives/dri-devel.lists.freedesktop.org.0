Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0990C9548B1
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 14:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822DB10E476;
	Fri, 16 Aug 2024 12:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u4K44YJF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692C310E476
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 12:24:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A70F362137;
 Fri, 16 Aug 2024 12:24:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0982BC32782;
 Fri, 16 Aug 2024 12:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723811078;
 bh=BHvv3tQ/qH7itDrWANJ9OnwJU3uS5u76IJ2JNjIhTqM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=u4K44YJF2Qc1nQLB8q3V8ADeGVb2TyoGJv2zIL7cfKS3KqZJ0zkIdMFSYyla2KOmL
 hzw162U3RzlB5v4XhilnoFD4feol2Vic/anaTfK7+qHF+2iYG1SjPioz87hgHdRgaZ
 aBQC1jy693cWkpivc9o0Nwu0+/jJn5LajFiUd8QeqB/HMYOZTDAjyZjle8boa2Ln7w
 pzBF9FfH9LdV2giP2tWEPu5EHGM/tVFegQoRTjaBHDjO588tsEQoCwVCKoklWUwUxc
 oM2SvxwuU2r6un731UcP3m+vUF3bqpLjoPATnxZHFKIk0uuNbHT4vNlRfc8OurOf6T
 o0yapb+Z50NHQ==
Message-ID: <b247a843-0918-4cd1-b6f8-66caca3ecae3@kernel.org>
Date: Fri, 16 Aug 2024 14:24:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 2/2] drm/bridge: imx: Add i.MX93 parallel
 display format configuration support
To: Liu Ying <victor.liu@nxp.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 peng.fan@nxp.com
References: <20240816080933.440594-1-victor.liu@nxp.com>
 <20240816080933.440594-3-victor.liu@nxp.com>
 <faf56b73-2143-4f5d-8e35-5cfe5f8d72d5@kernel.org>
 <613b4eb4-dbac-48a9-bcdd-79b4e94a7b66@nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <613b4eb4-dbac-48a9-bcdd-79b4e94a7b66@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 16/08/2024 11:44, Liu Ying wrote:
> On 08/16/2024, Krzysztof Kozlowski wrote:
>> On 16/08/2024 10:09, Liu Ying wrote:
>>> NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
>>> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
>>> field. Add a DRM bridge driver to support the display format configuration.
>>>
>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>> ---
>>
>> ...
>>
>>> +
>>> +static int imx93_pdfc_bridge_probe(struct platform_device *pdev)
>>> +{
>>> +	struct device *dev = &pdev->dev;
>>> +	struct imx93_pdfc *pdfc;
>>> +	int ret;
>>> +
>>> +	pdfc = devm_kzalloc(dev, sizeof(*pdfc), GFP_KERNEL);
>>> +	if (!pdfc)
>>> +		return -ENOMEM;
>>> +
>>> +	pdfc->regmap = syscon_node_to_regmap(dev->of_node->parent);
>>> +	if (IS_ERR(pdfc->regmap)) {
>>> +		ret = PTR_ERR(pdfc->regmap);
>>> +		if (ret != -EPROBE_DEFER)
>>> +			DRM_DEV_ERROR(dev, "failed to get regmap: %d\n", ret);
>>> +		return ret;
>>
>> Nope, you just open-coded dev_err_probe. Syntax is - return
>> dev_err_probe(). if you need wrapper for DRM, add such.
> 
> Will use dev_err_probe().
> 
>>
>>> +	}
>>> +
>>> +	pdfc->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
>>> +	if (IS_ERR(pdfc->next_bridge)) {
>>> +		ret = PTR_ERR(pdfc->next_bridge);
>>> +		if (ret != -EPROBE_DEFER)
>>> +			DRM_DEV_ERROR(dev, "failed to get next bridge: %d\n", ret);
>>> +		return ret;
>>
>> Ditto
> 
> Will use dev_err_probe().
> 
>>
>>
>>> +	}
>>> +
>>
>> ...
>>
>>> +MODULE_DESCRIPTION("NXP i.MX93 parallel display format configuration driver");
>>> +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
>>> +MODULE_LICENSE("GPL v2");
>>> +MODULE_ALIAS("platform:" DRIVER_NAME);
>>
>> Which other driver needs this platform alias?
> 
> Quote include/linux/module.h:
> 
> "
> /* For userspace: you can also call me... */                                     
> #define MODULE_ALIAS(_alias) MODULE_INFO(alias, _alias)   
> "
> 
> Anything wrong with using MODULE_ALIAS() here?

Yes, it redundant. Do not answer with question to the question.

Are you adding random code that you cannot justify? It looks like this
if you cannot answer why do you need it.

Form letter:

You should not need MODULE_ALIAS() in normal cases. If you need it,
usually it means your device ID table is wrong (e.g. misses either
entries or MODULE_DEVICE_TABLE()). MODULE_ALIAS() is not a substitute
for incomplete ID table.

Best regards,
Krzysztof

