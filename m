Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF4298BB2A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 13:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2B810E16B;
	Tue,  1 Oct 2024 11:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="AcYsMt/L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BED10E16B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 11:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727782395;
 bh=7Mt3V0k4aRzDBUrXL/7pCXO5/s8xTYlqJUHAsA011LQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AcYsMt/LHBxwxCf0x5xfODlOdva0Rui5xZQGSChkM7B6o6i4QakrvO+tRvjHH2k6T
 SsCVaEThf6rSM5iRbJ/2XQ/5x3Ux6sV9ClJr97/GnUrIH1yXVrwtBK240uQrSYtn65
 knu+1X8+TuNP8j18HaPLdJ9cfsWAb5jzMx4uKAuljcoTxBmESdc0IK1TRyY1Uo2PoN
 Qxw/zqIiJGqveoSmkKLMcMtFrNlzhLMJHzlozI0ALQjeKQ9C6TUBWtLiR12NM0pNM+
 DFabfFmhVRVU/sRJ02Mbr50puDlI3Pl1kAiCVF+44b7JY5fShjwoHqjX6er058U3Jv
 Zviu+pWaQ59YA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3DBD917E0F7D;
 Tue,  1 Oct 2024 13:33:14 +0200 (CEST)
Message-ID: <56c4e87c-6774-4542-8ae7-dab89750081c@collabora.com>
Date: Tue, 1 Oct 2024 13:33:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/3] drm/mediatek: Implement OF graphs support for
 display paths
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "sui.jingfeng@linux.dev" <sui.jingfeng@linux.dev>,
 "wenst@chromium.org" <wenst@chromium.org>,
 Sjoerd Simons <sjoerd@collabora.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "michael@walle.cc" <michael@walle.cc>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?WXUtY2hhbmcgTGVlICjmnY7nprnnkosp?= <Yu-chang.Lee@mediatek.com>,
 "mwalle@kernel.org" <mwalle@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Alexandre Mergnat <amergnat@baylibre.com>
References: <20240910105054.125005-1-angelogioacchino.delregno@collabora.com>
 <01020191db8f22cd-0f5d733b-420e-453c-8607-a3e9f70f32d6-000000@eu-west-1.amazonses.com>
 <e3953947f5cf05e8e6a2ec3448cf0c08a8c39c1c.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <e3953947f5cf05e8e6a2ec3448cf0c08a8c39c1c.camel@mediatek.com>
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

Il 01/10/24 12:07, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Tue, 2024-09-10 at 10:51 +0000, AngeloGioacchino Del Regno wrote:
>> It is impossible to add each and every possible DDP path combination
>> for each and every possible combination of SoC and board: right now,
>> this driver hardcodes configuration for 10 SoCs and this is going to
>> grow larger and larger, and with new hacks like the introduction of
>> mtk_drm_route which is anyway not enough for all final routes as the
>> DSI cannot be connected to MERGE if it's not a dual-DSI, or enabling
>> DSC preventively doesn't work if the display doesn't support it, or
>> others.
>>
>> Since practically all display IPs in MediaTek SoCs support being
>> interconnected with different instances of other, or the same, IPs
>> or with different IPs and in different combinations, the final DDP
>> pipeline is effectively a board specific configuration.
>>
>> Implement OF graphs support to the mediatek-drm drivers, allowing to
>> stop hardcoding the paths, and preventing this driver to get a huge
>> amount of arrays for each board and SoC combination, also paving the
>> way to share the same mtk_mmsys_driver_data between multiple SoCs,
>> making it more straightforward to add support for new chips.
>>
>> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
>> Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
>> Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>
>> Tested-by: Michael Walle <mwalle@kernel.org> # on kontron-sbc-i1200
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
> 
> [snip]
> 
>> +
>> +bool mtk_ovl_adaptor_is_comp_present(struct device_node *node)
>> +{
>> +	enum mtk_ovl_adaptor_comp_type type;
>> +	int ret;
>> +
>> +	ret = ovl_adaptor_of_get_ddp_comp_type(node, &type);
>> +	if (ret)
>> +		return false;
>> +
>> +	if (type >= OVL_ADAPTOR_TYPE_NUM)
>> +		return false;
>> +
>> +	/*
>> +	 * ETHDR and Padding are used exclusively in OVL Adaptor: if this
>> +	 * component is not one of those, it's likely not an OVL Adaptor path.
>> +	 */
> 
> I don't know your logic here.
> The OVL Adaptor pipeline is:
> 
> mdp_rdma -> padding ---+      +-------+
>                       Merge -> |       |
> mdp_rdma -> padding ---+      |       |
>                                |       |
> mdp_rdma -> padding ---+      |       |
>                       Merge -> |       |
> mdp_rdma -> padding ---+      |       |
>                                | ETHDR |
> mdp_rdma -> padding ---+      |       |
>                       Merge -> |       |
> mdp_rdma -> padding ---+      |       |
>                                |       |
> mdp_rdma -> padding ---+      |       |
>                       Merge -> |       |
> mdp_rdma -> padding ---+      +-------+
> 
> So mdp_rdma and merge is not OVL Adaptor?
> 

Yes, and in device tree, you express that exactly like you just pictured.

OVL Adaptor is treated like a software component internally, and manages
its own merge pipes exactly like before this commit.

In case there will be any need to express OVL Adaptor as hardware component,
it will be possible to do so with no modification to the bindings.

> 
>> +	return type == OVL_ADAPTOR_TYPE_ETHDR || type == OVL_ADAPTOR_TYPE_PADDING;
>> +}
>> +
>>   
> 
> [snip]
> 
>> +
>> +/**
>> + * mtk_drm_of_ddp_path_build_one - Build a Display HW Pipeline for a CRTC Path
>> + * @dev:          The mediatek-drm device
>> + * @cpath:        CRTC Path relative to a VDO or MMSYS
>> + * @out_path:     Pointer to an array that will contain the new pipeline
>> + * @out_path_len: Number of entries in the pipeline array
>> + *
>> + * MediaTek SoCs can use different DDP hardware pipelines (or paths) depending
>> + * on the board-specific desired display configuration; this function walks
>> + * through all of the output endpoints starting from a VDO or MMSYS hardware
>> + * instance and builds the right pipeline as specified in device trees.
>> + *
>> + * Return:
>> + * * %0       - Display HW Pipeline successfully built and validated
>> + * * %-ENOENT - Display pipeline was not specified in device tree
>> + * * %-EINVAL - Display pipeline built but validation failed
>> + * * %-ENOMEM - Failure to allocate pipeline array to pass to the caller
>> + */
>> +static int mtk_drm_of_ddp_path_build_one(struct device *dev, enum mtk_crtc_path cpath,
>> +					 const unsigned int **out_path,
>> +					 unsigned int *out_path_len)
>> +{
>> +	struct device_node *next, *prev, *vdo = dev->parent->of_node;
>> +	unsigned int temp_path[DDP_COMPONENT_DRM_ID_MAX] = { 0 };
>> +	unsigned int *final_ddp_path;
>> +	unsigned short int idx = 0;
>> +	bool ovl_adaptor_comp_added = false;
>> +	int ret;
>> +
>> +	/* Get the first entry for the temp_path array */
>> +	ret = mtk_drm_of_get_ddp_ep_cid(vdo, 0, cpath, &next, &temp_path[idx]);
>> +	if (ret) {
>> +		if (next && temp_path[idx] == DDP_COMPONENT_DRM_OVL_ADAPTOR) {
> 
> mdp_rdma would not be DDP_COMPONENT_DRM_OVL_ADAPTOR.

This piece of code just avoids adding OVL_ADAPTOR more than once to the pipeline.

> 
>> +			dev_dbg(dev, "Adding OVL Adaptor for %pOF\n", next);
>> +			ovl_adaptor_comp_added = true;
>> +		} else {
>> +			if (next)
>> +				dev_err(dev, "Invalid component %pOF\n", next);
>> +			else
>> +				dev_err(dev, "Cannot find first endpoint for path %d\n", cpath);
>> +
>> +			return ret;
>> +		}
>> +	}
>> +	idx++;
>> +
>> +	/*
>> +	 * Walk through port outputs until we reach the last valid mediatek-drm component.
>> +	 * To be valid, this must end with an "invalid" component that is a display node.
>> +	 */
>> +	do {
>> +		prev = next;
>> +		ret = mtk_drm_of_get_ddp_ep_cid(next, 1, cpath, &next, &temp_path[idx]);
>> +		of_node_put(prev);
>> +		if (ret) {
>> +			of_node_put(next);
>> +			break;
>> +		}
>> +
>> +		/*
>> +		 * If this is an OVL adaptor exclusive component and one of those
>> +		 * was already added, don't add another instance of the generic
>> +		 * DDP_COMPONENT_OVL_ADAPTOR, as this is used only to decide whether
>> +		 * to probe that component master driver of which only one instance
>> +		 * is needed and possible.
>> +		 */
>> +		if (temp_path[idx] == DDP_COMPONENT_DRM_OVL_ADAPTOR) {
> 
> merge would not be DDP_COMPONENT_DRM_OVL_ADAPTOR.
> Finally, the path would be:
> 
> mdp_rdma -> ovl adaptor (padding) -> merge -> (ethdr is skipped here) ...
> 

Again, the path in the OF graph is expressed exactly like you said.

Regards,
Angelo

> Regards,
> CK
> 
>> +			if (!ovl_adaptor_comp_added)
>> +				ovl_adaptor_comp_added = true;
>> +			else
>> +				idx--;
>> +		}
>> +	} while (++idx < DDP_COMPONENT_DRM_ID_MAX);
>> +
>> +	/*
>> +	 * The device component might not be enabled: in that case, don't
>> +	 * check the last entry and just report that the device is missing.
>> +	 */
>> +	if (ret == -ENODEV)
>> +		return ret;
>> +
>> +	/* If the last entry is not a final display output, the configuration is wrong */
>> +	switch (temp_path[idx - 1]) {
>> +	case DDP_COMPONENT_DP_INTF0:
>> +	case DDP_COMPONENT_DP_INTF1:
>> +	case DDP_COMPONENT_DPI0:
>> +	case DDP_COMPONENT_DPI1:
>> +	case DDP_COMPONENT_DSI0:
>> +	case DDP_COMPONENT_DSI1:
>> +	case DDP_COMPONENT_DSI2:
>> +	case DDP_COMPONENT_DSI3:
>> +		break;
>> +	default:
>> +		dev_err(dev, "Invalid display hw pipeline. Last component: %d (ret=%d)\n",
>> +			temp_path[idx - 1], ret);
>> +		return -EINVAL;
>> +	}
>> +
>> +	final_ddp_path = devm_kmemdup(dev, temp_path, idx * sizeof(temp_path[0]), GFP_KERNEL);
>> +	if (!final_ddp_path)
>> +		return -ENOMEM;
>> +
>> +	dev_dbg(dev, "Display HW Pipeline built with %d components.\n", idx);
>> +
>> +	/* Pipeline built! */
>> +	*out_path = final_ddp_path;
>> +	*out_path_len = idx;
>> +
>> +	return 0;
>> +}
>> +



