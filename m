Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9C1452DE5
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 10:23:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241956EE5A;
	Tue, 16 Nov 2021 09:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1031A6EE5A
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 09:23:56 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso1732899pji.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 01:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JdEMwmLbE8ijaOcyvInpNB1TS9ZsRB8t990UrAoOL8A=;
 b=fe0ZGJQeN7Url5AKk+j2zdvAGruKSYNai39pEaFWqHnJIOnKJfV/kTo8Wh8lh59xiH
 8/o1hU4Yz7FcLQ9rcWAjYaCZODWFNhVJ2EGY/q/jBeNmYO6Ca+Vmaqd7CP8vlWdE4tU+
 jLCk7z7BdgnZOFjo2wg7H8JTkzMqm3Yk/7jnN4o24X/YVKjSUPnzhIbY6Knb4cWejE00
 HPJ8NTmmPeI8G4YIGLPNUIFi8FA/KGcD8Acpgy3ewMqijMqOE1Ks/XzF49rBq3v3YJia
 MnEtL4HctRPmUJ/8hu6Ey8ymUpkD/lcR877YuoKVogHqp8TaazOvhjA8Bw960iKP9D7E
 UXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JdEMwmLbE8ijaOcyvInpNB1TS9ZsRB8t990UrAoOL8A=;
 b=b4nCSpAMWb4RU5DhBE27U7ARDciC1YU1X5s2dVCAA1UG2axrj1J2uyki0Sgbj+hrVR
 Y9oK7CEAlz/YezCaJxLEV1SNAgQmO26puqF6Qwo9WbIu05aJi2SobHs4Hb9mE9M1PFwm
 zFyim8weYoOFE3+VzjGu+3WuLYvFInTt6fFe+OgMCwy8BCknQuJ4RMD3VPuCX6q7OoGX
 q99tCNLVycy2d+h+DoN5v6YLUE8PAHWPObx5CdxSQufurLE8C8GrXboCsG7kER7BdlLG
 ln46z8XIBlgshUlxoOURk0oG4mCgPZXuRs1KYQGr16yYxPMzt3q6Qp8ctpYkBlT5BBIu
 3MQw==
X-Gm-Message-State: AOAM532u48AF7d8LDHTsvhlFJJZKszsrXWyyt358HYuIJoIcc3ALE6Q3
 QjiDrIAEBSThqgeSIDteDihyiA==
X-Google-Smtp-Source: ABdhPJy5ql8s235iv7snHx2jySPMAYbzM52dbYj6ER4JLWiOJSaMhOef0AUaH+R8AtGl27WB7+3O7w==
X-Received: by 2002:a17:90b:4b09:: with SMTP id
 lx9mr74396151pjb.100.1637054635286; 
 Tue, 16 Nov 2021 01:23:55 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:f590:685a:7893:90be])
 by smtp.gmail.com with ESMTPSA id p2sm1760784pja.55.2021.11.16.01.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 01:23:54 -0800 (PST)
Date: Tue, 16 Nov 2021 17:23:49 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Subject: Re: [PATCH v10, 06/19] media: mtk-vcodec: Manage multi hardware
 information
Message-ID: <YZN4pVLDfAU2O893@google.com>
References: <20211111041500.17363-1-yunfei.dong@mediatek.com>
 <20211111041500.17363-7-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211111041500.17363-7-yunfei.dong@mediatek.com>
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Tomasz Figa <tfiga@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 11, 2021 at 12:14:47PM +0800, Yunfei Dong wrote:
> Register each hardware(subdev) as platform device used to manage each
> hardware information which includes irq/power/clk. The hardware includes
> LAT0, LAT1 and CORE. And call of_platform_populate in main device.
> 
> Using subdev_bitmap to record whether each device is register done. Then check
> whether all subdev are register done before open main device.

I can somehow understand what the patch is trying to do but the commit message needs to be rephrased for people to understand the patch.

> --- a/drivers/media/platform/mtk-vcodec/Makefile
> +++ b/drivers/media/platform/mtk-vcodec/Makefile
> @@ -2,7 +2,8 @@
>  
>  obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) += mtk-vcodec-dec.o \
>  				       mtk-vcodec-enc.o \
> -				       mtk-vcodec-common.o
> +				       mtk-vcodec-common.o \
> +					   mtk-vcodec-dec-hw.o

Looks better to align to previous lines.

> +static int mtk_vcodec_subdev_device_check(struct mtk_vcodec_ctx *ctx)
> +{
> +	struct mtk_vcodec_dev *vdec_dev = ctx->dev;

ctx isn't used in other places.  Looks like the function can accept "struct mtk_vcodec_dev *vdec_dev" as the only argument.

> +	for (i = 0; i < ARRAY_SIZE(mtk_vdec_hw_match); i++) {
> +		of_id = &mtk_vdec_hw_match[i];
> +		subdev_node = of_find_compatible_node(NULL, NULL,
> +			of_id->compatible);
> +		if (!subdev_node)
> +			continue;

Does it really need to continue if one of the sub-devices is not ready?

It depends on whether mtk_vdec_hw_match is a must list or not.  For example, if mtk_vdec_hw_match has 4 entries but the DT only has 2 entries, shall it return an error about the entry count mismatch?

> +		if (!of_device_is_available(subdev_node)) {
> +			of_node_put(subdev_node);
> +			dev_err(&pdev->dev, "Fail to get subdev node\n");
> +			continue;

The error message shouldn't be "Fail to get ...".  Also the same question: does it really need to continue?

> +		hw_idx = (enum mtk_vdec_hw_id)(uintptr_t)of_id->data;
> +		vdec_dev->subdev_node[hw_idx] = subdev_node;

I am wondering if it wouldn't need subdev_node.  Isn't vdec_dev->subdev_dev sufficient to clue all the things?

> +		if (!test_bit(hw_idx, vdec_dev->subdev_bitmap)) {
> +			of_node_put(subdev_node);
> +			dev_err(&pdev->dev, "Vdec %d is not ready", hw_idx);
> +			return -EAGAIN;
> +		}
> +		of_node_put(subdev_node);
> +	}
> +
> +	return 0;
> +}

In addition to the question for subdev_node.  The function calls of_node_put() for every paths.  I am not sure if the function should call of_node_put() in non-error-handling paths (i.e. I thought it needs someone to hold the reference count).

By reading [v10,11/19] media: mtk-vcodec: Generalize power and clock on/off interfaces[1], the mtk_vcodec_get_hw_dev() calls of_node_put() after it gets the hw_pdev.  Looks like the code is meant to borrow the reference count to mtk_vcodec_get_hw_dev().

In short, if the subdev_node is designed to borrow reference count to others, mtk_vcodec_subdev_device_check() shouldn't call of_node_put() in non-error-handling paths.

[1]: https://patchwork.linuxtv.org/project/linux-media/patch/20211111041500.17363-12-yunfei.dong@mediatek.com/

> @@ -249,32 +322,10 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
[...]
> +	ret = mtk_vcodec_init_dec_resources(dev);
>  	if (ret) {
> -		dev_err(&pdev->dev, "Failed to install dev->dec_irq %d (%d)",
> -			dev->dec_irq,
> -			ret);
> -		goto err_res;
> +		dev_err(&pdev->dev, "Failed to init pm and registers");

The error message makes less sense about mentioning pm and registers.

> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
[...]
> +static int mtk_vdec_hw_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_vdec_hw_dev *subdev_dev;
> +	struct mtk_vcodec_dev *main_dev;
> +	const struct of_device_id *of_id;
> +	int hw_idx;
> +	int ret;
> +
> +	if (!dev->parent)
> +		return -EPROBE_DEFER;

IIUC, it shouldn't happen because the deivce is populated from main device.  Moreover, would it help to defer the probe if dev->parent is NULL?

> +	main_dev = dev_get_drvdata(dev->parent);
> +	if (!main_dev)
> +		return -EPROBE_DEFER;

Share the same concern with comment above.

> +static struct platform_driver mtk_vdec_driver = {
> +	.probe	= mtk_vdec_hw_probe,
> +	.driver	= {
> +		.name	= "mtk-vdec-comp",
> +		.of_match_table = mtk_vdec_hw_match,
> +	},
> +};
> +
> +module_platform_driver(mtk_vdec_driver);

I prefer to remove the blank line in between mtk_vdec_driver and module_platform_driver.

> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
[...]
> @@ -423,6 +436,11 @@ struct mtk_vcodec_enc_pdata {
>   * @pm: power management control
>   * @dec_capability: used to identify decode capability, ex: 4k
>   * @enc_capability: used to identify encode capability
> + *
> + * @subdev_dev: subdev hardware device
> + * @subdev_node: subdev node
> + *
> + * @subdev_bitmap: used to record hardware is ready or not
>   */
>  struct mtk_vcodec_dev {
>  	struct v4l2_device v4l2_dev;
> @@ -460,6 +478,11 @@ struct mtk_vcodec_dev {
>  	struct mtk_vcodec_pm pm;
>  	unsigned int dec_capability;
>  	unsigned int enc_capability;
> +
> +	void *subdev_dev[MTK_VDEC_HW_MAX];
> +	struct device_node *subdev_node[MTK_VDEC_HW_MAX];

The same question: if it already has subdev_dev, does it still need subdev_node?
