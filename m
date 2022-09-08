Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C935B205E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 16:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C57D10EB20;
	Thu,  8 Sep 2022 14:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86BE10EB20
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 14:18:42 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id nc14so38383636ejc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 07:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=uqElwfgdSmRAbe1TxOgEvl0rGlU2m9x2RTPe61zpA7Y=;
 b=GQ1YLhDR+Js6JeGa+dmtWxbwMjFRcXEcSDp2cUdAhNThPTEy0/xPN4uWvWuT4U+HDL
 Tv/q/CyaTZntmCMLEjqeNnv97WYrHr6rxOR/yVg3PGUl0rmaOeAdti3Ur0fxekkTJ8/8
 yjmx/Xed42Qt7b7V+1XsVyb/fH4sw3dDcAeuQ2eR2Xo/U0pnKs7I5w+2cTEVZmnXn7sM
 joSGkZf1lGage7BsJOd33pUf7ELB9v/tN0Acic+U4CQ2c5xI19FuOc0I+CXFzY6UpQ6U
 YdFkg0igv0w5Af7PuCgf+/utcCDq22gHGdhZrfPbJ3fUjHK7s1mzPXXeytOQxH6RKi2f
 cynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=uqElwfgdSmRAbe1TxOgEvl0rGlU2m9x2RTPe61zpA7Y=;
 b=A9M0V2R8si77pneGtWgEjDHgEwtsYkDiEOJgY8na3j37Nd6bafW0rY1doi2YvZyh2c
 1/n31Tt0mx3M9bvWb/QD18RLxHuJecBJKorggosA7YTLhmy7RJr5qWmrfGJ71qrhsat1
 hojRO4fqc+rNlrvw7OPVn6Olr2qlMNpO274WH3CPiKyiJmeGIK4TDpE2iczCXNwGdI7m
 AWUjx8XCsRmWCooXIK+T+/okZiQ8DlgC/EhbqAtwZp6+D5Axy/LDd2VxmQ1JeS7wNM/g
 +M9l1MhNi2aF6yhgiQilvg90K8q87DXAFaOR3tcocbVRVkGhLJMjP0vvVb3RmIHKDY+g
 AcQg==
X-Gm-Message-State: ACgBeo1iiV2FvU+LZndX+9Es0v/Yb7MgoDICBYKnVRRXZrAwjuvM+3lQ
 lObPlSUTRUVMtCiQTYfWhYE=
X-Google-Smtp-Source: AA6agR7qDdqjQwHSmkOGWVFjGIbsnQAb7euDyigcbVZwCBgLje0vwmAqMisXPFAW+X+k+wUu7pa+1w==
X-Received: by 2002:a17:907:2c41:b0:741:4906:482b with SMTP id
 hf1-20020a1709072c4100b007414906482bmr6062420ejc.239.1662646721196; 
 Thu, 08 Sep 2022 07:18:41 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a1709060cc900b00764a76d5888sm1290016ejh.27.2022.09.08.07.18.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 07:18:39 -0700 (PDT)
Message-ID: <10a9c90d-aacf-5283-526d-b3ae42b86ea3@gmail.com>
Date: Thu, 8 Sep 2022 16:18:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] drm/mediatek: Fix wrong dither settings
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20220908141205.18256-1-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220908141205.18256-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08/09/2022 16:12, Allen-KH Cheng wrote:
> The width and height arguments in the cmdq packet for mtk_dither_config()
> are inverted. We fix the incorrect width and height for dither settings
> in mtk_dither_config().
> 
> Fixes: 73d3724745db ("drm/mediatek: Adjust to the alphabetic order for mediatek-drm")
> Co-developed-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 2d72cc5ddaba..6b6d5335c834 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -157,7 +157,7 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
>   {
>   	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
>   
> -	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_REG_DITHER_SIZE);
> +	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_REG_DITHER_SIZE);
>   	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs,
>   		      DISP_REG_DITHER_CFG);
>   	mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_REG_DITHER_CFG,
