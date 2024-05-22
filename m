Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB568CC10A
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 14:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B58310EF94;
	Wed, 22 May 2024 12:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zg8tmty3ljk5ljewns4xndka.icoremail.net
 (zg8tmty3ljk5ljewns4xndka.icoremail.net [167.99.105.149])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8231810EF94
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 12:14:10 +0000 (UTC)
Received: from [172.38.8.164] (unknown [219.141.235.82])
 by mail (Coremail) with SMTP id AQAAfwA36Nhu4U1mKeeuAA--.46576S2;
 Wed, 22 May 2024 20:13:36 +0800 (CST)
Message-ID: <665202d7-46be-4dc8-a6be-3579e1ec078f@bosc.ac.cn>
Date: Wed, 22 May 2024 20:13:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5,3/3] drm/mediatek: Implement OF graphs support for display
 paths
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com,
 Alexandre Mergnat <amergnat@baylibre.com>
References: <20240521075717.50330-4-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, en-AU
From: Sui Jingfeng <suijingfeng@bosc.ac.cn>
Organization: bosc
In-Reply-To: <20240521075717.50330-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAfwA36Nhu4U1mKeeuAA--.46576S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFW3CFWkXFy5Ww4kur1xZrb_yoW8Aw1Dpr
 WUWFZxArWj9r47Wr4vqF45Aryq9r40v3y3X34UWa4Ik3Z8XFyfZr1Ig34Yvw4fKrZ7ua48
 Aa1ktan8W3y8trDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUv2b7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
 c2xSY4AK67AK6ryUMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
 0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8
 ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
 CY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
 wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
 7IU0wL05UUUUU==
X-CM-SenderInfo: xvxlyxpqjiv03j6e02nfoduhdfq/
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

Hi,


On 5/21/24 15:57, AngeloGioacchino Del Regno wrote:
> +static int mtk_drm_of_get_ddp_comp_type(struct device_node *node, enum mtk_ddp_comp_type *ctype)
> +{
> +	const struct of_device_id *of_id = of_match_node(mtk_ddp_comp_dt_ids, node);
> +
> +	if (!of_id)
> +		return -EINVAL;
> +
> +	*ctype = (enum mtk_ddp_comp_type)((uintptr_t)of_id->data);
> +
> +	return 0;
> +}
> +
> +static int mtk_drm_of_get_ddp_ep_cid(struct device_node *node,
> +				     int output_port, enum mtk_crtc_path crtc_path,
> +				     struct device_node **next, unsigned int *cid)
> +{
> +	struct device_node *ep_dev_node, *ep_out;
> +	enum mtk_ddp_comp_type comp_type;
> +	int ret;
> +
> +	ep_out = of_graph_get_endpoint_by_regs(node, output_port, crtc_path);
> +	if (!ep_out)
> +		return -ENOENT;
> +
> +	ep_dev_node = of_graph_get_remote_port_parent(ep_out);

below here, 'ep_out' will not be used anymore.

of_node_put(ep_out);

Maybe we should call it under a error handling tag?
But this is trivial problem.

> +	if (!ep_dev_node)
> +		return -EINVAL;
> +
> +	/*
> +	 * Pass the next node pointer regardless of failures in the later code
> +	 * so that if this function is called in a loop it will walk through all
> +	 * of the subsequent endpoints anyway.
> +	 */
> +	*next = ep_dev_node;
> +
> +	if (!of_device_is_available(ep_dev_node))
> +		return -ENODEV;
> +
> +	ret = mtk_drm_of_get_ddp_comp_type(ep_dev_node, &comp_type);
> +	if (ret) {
> +		if (mtk_ovl_adaptor_is_comp_present(ep_dev_node)) {
> +			*cid = (unsigned int)DDP_COMPONENT_DRM_OVL_ADAPTOR;
> +			return 0;
> +		}
> +		return ret;
> +	}
> +
> +	ret = mtk_ddp_comp_get_id(ep_dev_node, comp_type);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* All ok! Pass the Component ID to the caller. */
> +	*cid = (unsigned int)ret;
> +
> +	return 0;
> +}
> +

-- 
Best regards
Sui Jingfeng

