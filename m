Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 369228CC14B
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 14:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B282510E0D6;
	Wed, 22 May 2024 12:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1158 seconds by postgrey-1.36 at gabe;
 Wed, 22 May 2024 12:33:08 UTC
Received: from zg8tmtyylji0my4xnjqunzqa.icoremail.net
 (zg8tmtyylji0my4xnjqunzqa.icoremail.net [162.243.164.74])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2887310E0D6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 12:33:07 +0000 (UTC)
Received: from [172.38.8.164] (unknown [219.141.235.82])
 by mail (Coremail) with SMTP id AQAAfwD3yiD15U1mzP2uAA--.51920S2;
 Wed, 22 May 2024 20:32:54 +0800 (CST)
Message-ID: <eca4d113-ba59-45aa-9224-22235fb09ddc@bosc.ac.cn>
Date: Wed, 22 May 2024 20:32:53 +0800
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
X-CM-TRANSID: AQAAfwD3yiD15U1mzP2uAA--.51920S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFW3Cw15GF1UJw4DKryrCrg_yoW8Wr4rpa
 yUuFWrZrZ7Jrs7W3y0vr4DCrZYkr10yF9xXw1fGF10yrsIqr9aka1kKrWjvrsIkryDurn2
 qw48Kaya9ws5AFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
> +static int mtk_drm_of_ddp_path_build(struct device *dev, struct device_node *node,
> +				     struct mtk_mmsys_driver_data *data)
> +{
> +	struct device_node *ep_node;
> +	struct of_endpoint of_ep;
> +	bool output_present[MAX_CRTC] = { false };
> +	int ret;
> +
> +	for_each_endpoint_of_node(node, ep_node) {
> +		ret = of_graph_parse_endpoint(ep_node, &of_ep);
> +		of_node_put(ep_node);

There is going to *double* decline the reference counter, as the 
__of_get_next_child() will decrease the reference counter for us
on the next iteration.


> +		if (ret) {
> +			dev_err_probe(dev, ret, "Cannot parse endpoint\n");
> +			break;
> +		}

Move the 'of_node_put(ep_node)' into brace '{}' here, if we really cares
about the reference count.

> +
> +		if (of_ep.id >= MAX_CRTC) {

ditto ?

> +			ret = dev_err_probe(dev, -EINVAL,
> +					    "Invalid endpoint%u number\n", of_ep.port);
> +			break;
> +		}
> +
> +		output_present[of_ep.id] = true;
> +	}
> +
> +	if (ret)
> +		return ret;
> +
> +	if (output_present[CRTC_MAIN]) {
> +		ret = mtk_drm_of_ddp_path_build_one(dev, CRTC_MAIN,
> +						    &data->main_path, &data->main_len);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (output_present[CRTC_EXT]) {
> +		ret = mtk_drm_of_ddp_path_build_one(dev, CRTC_EXT,
> +						    &data->ext_path, &data->ext_len);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (output_present[CRTC_THIRD]) {
> +		ret = mtk_drm_of_ddp_path_build_one(dev, CRTC_THIRD,
> +						    &data->third_path, &data->third_len);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +

-- 
Best regards
Sui Jingfeng

