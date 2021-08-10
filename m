Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2603E558D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 10:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7269789F3C;
	Tue, 10 Aug 2021 08:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B89789F2A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 08:35:22 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so1924868wmb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 01:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vMSBdoateZIgBwXLZF1A9XcC/9zqYgLH80lmcKQu37Q=;
 b=fTDl3pEOIsU2zfYCfPcWhCJl/MENDAApV8LcoWAEB7OWBlHrVQHH+FACqNwyJzTeIQ
 7tbjM8//gJgy7/1MzZnB0hz+pgLWSVV3kfbr/f0gyQBOAwdGuhpAtdtmjWkR3Q3rqvTC
 XSAzShMz/edMcrpV645291q8ReC1JL40pWVDh3b/UtTYN/X4a1+ptCn9iswZd6RhW/4X
 QNhmd7bBBZTkdHwH+C2FnqpKyHhThlR3tXnRwNZ9iD0cykn5pomOdaEFyD+00aed6xuf
 Rokj/R2LSgCyzI2pL9hEVs1CTseKk3Z42JBTaQgom+ldCBEG/ZSG+Ftr0hp5kc3DRTgU
 keAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vMSBdoateZIgBwXLZF1A9XcC/9zqYgLH80lmcKQu37Q=;
 b=CFVZr6Q0kRJY/B89PGwCAv4mY4pKHjd25UFDHMHtm+aK9P1YAHGUy8RZG3k+a2OymT
 PAfwGxpD3IzS67K6uMwpBGWcA37lg/upbV2n2BJdG+SYwQ8PmZq/kpOrfL7bKf1GSK2c
 BiDHi82Nw/w01P3S84Qv3/hZ/azpMSsK12Bqx5yE7H6m2PlxVKHLhwovDiWoI0ys8mvQ
 yRukJnClJ06gDU5kISbEcp7VaubiVUGl3Q5NUPO/TxT5Silm1dSduiB3IyHA1AajAioT
 kziKt6mWfkgYOWq6ONKbjexiXbKhzbcSD40oVcKHZVaVYLwqV+CsNFfnn8Yqviovz1Lt
 RbqA==
X-Gm-Message-State: AOAM530gfTM/K2nd/murn81SO8vg+bs+Szh1IpkG/zA0+oFc+pPHVaic
 0Os24AHmO+f5DP4DYStSn0c=
X-Google-Smtp-Source: ABdhPJzUXAmUIoBvvY+R2JQrcLjcY4L2lYlgSnC90VO+/hMRs+Zbn4ppJt0Vv7egumyYv0BGV/LSPw==
X-Received: by 2002:a05:600c:242:: with SMTP id
 2mr3322563wmj.167.1628584520679; 
 Tue, 10 Aug 2021 01:35:20 -0700 (PDT)
Received: from ziggy.stardust ([207.188.163.204])
 by smtp.gmail.com with ESMTPSA id e11sm2293695wrm.80.2021.08.10.01.35.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 01:35:19 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] drm/mediatek: Add support for main DDP path on
 MT8167
To: Fabien Parent <fparent@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20201023133130.194140-1-fparent@baylibre.com>
 <20201023133130.194140-6-fparent@baylibre.com>
 <CAAOTY_8ZgoQJFnEDDZ=JCy-3zLwn7yjk1EHVYgeSG2ufLxK04g@mail.gmail.com>
 <CAOwMV_wzp67zeiSvXP59OLMwd_8srfSTSqV9BwXagq5gFu6B3g@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <43fb2cda-5fed-f770-35d7-ed59db7dbae5@gmail.com>
Date: Tue, 10 Aug 2021 10:35:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAOwMV_wzp67zeiSvXP59OLMwd_8srfSTSqV9BwXagq5gFu6B3g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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



On 27/10/2020 17:08, Fabien Parent wrote:
> Hi Chun-Kuang,
> 
> On Fri, Oct 23, 2020 at 5:52 PM Chun-Kuang Hu <chunkuang.hu@kernel.org> wrote:
>>
>> Hi, Fabien:
>>
>> Fabien Parent <fparent@baylibre.com> 於 2020年10月23日 週五 下午9:31寫道：
>>>
>>> Add the main (DSI) drm display path for MT8167.
>>>
>>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
>>> ---
>>>
>>> Changelog:
>>>
>>> V2: No change
>>>
>>>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 38 ++++++++++++++++++++++++++
>>>  1 file changed, 38 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>> index 59c85c63b7cc..3952435093fe 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>> @@ -112,6 +112,17 @@ static const enum mtk_ddp_comp_id mt2712_mtk_ddp_third[] = {
>>>         DDP_COMPONENT_PWM2,
>>>  };
>>>
>>> +static enum mtk_ddp_comp_id mt8167_mtk_ddp_main[] = {
>>> +       DDP_COMPONENT_OVL0,
>>> +       DDP_COMPONENT_COLOR0,
>>> +       DDP_COMPONENT_CCORR,
>>> +       DDP_COMPONENT_AAL0,
>>> +       DDP_COMPONENT_GAMMA,
>>> +       DDP_COMPONENT_DITHER,
>>> +       DDP_COMPONENT_RDMA0,
>>> +       DDP_COMPONENT_DSI0,
>>> +};
>>> +
>>>  static const enum mtk_ddp_comp_id mt8173_mtk_ddp_main[] = {
>>>         DDP_COMPONENT_OVL0,
>>>         DDP_COMPONENT_COLOR0,
>>> @@ -163,6 +174,11 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>>>         .ext_len = ARRAY_SIZE(mt8173_mtk_ddp_ext),
>>>  };
>>>
>>> +static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data = {
>>> +       .main_path = mt8167_mtk_ddp_main,
>>> +       .main_len = ARRAY_SIZE(mt8167_mtk_ddp_main),
>>> +};
>>> +
>>>  static int mtk_drm_kms_init(struct drm_device *drm)
>>>  {
>>>         struct mtk_drm_private *private = drm->dev_private;
>>> @@ -401,26 +417,42 @@ static const struct component_master_ops mtk_drm_ops = {
>>>  static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>>>         { .compatible = "mediatek,mt2701-disp-ovl",
>>>           .data = (void *)MTK_DISP_OVL },
>>> +       { .compatible = "mediatek,mt8167-disp-ovl",
>>> +         .data = (void *)MTK_DISP_OVL },
>>>         { .compatible = "mediatek,mt8173-disp-ovl",
>>>           .data = (void *)MTK_DISP_OVL },
>>>         { .compatible = "mediatek,mt2701-disp-rdma",
>>>           .data = (void *)MTK_DISP_RDMA },
>>> +       { .compatible = "mediatek,mt8167-disp-rdma",
>>> +         .data = (void *)MTK_DISP_RDMA },
>>>         { .compatible = "mediatek,mt8173-disp-rdma",
>>>           .data = (void *)MTK_DISP_RDMA },
>>>         { .compatible = "mediatek,mt8173-disp-wdma",
>>>           .data = (void *)MTK_DISP_WDMA },
>>> +       { .compatible = "mediatek,mt8167-disp-ccorr",
>>> +         .data = (void *)MTK_DISP_CCORR },
>>>         { .compatible = "mediatek,mt2701-disp-color",
>>>           .data = (void *)MTK_DISP_COLOR },
>>> +       { .compatible = "mediatek,mt8167-disp-color",
>>> +         .data = (void *)MTK_DISP_COLOR },
>>>         { .compatible = "mediatek,mt8173-disp-color",
>>>           .data = (void *)MTK_DISP_COLOR },
>>> +       { .compatible = "mediatek,mt8167-disp-aal",
>>> +         .data = (void *)MTK_DISP_AAL},
>>>         { .compatible = "mediatek,mt8173-disp-aal",
>>>           .data = (void *)MTK_DISP_AAL},
>>> +       { .compatible = "mediatek,mt8167-disp-gamma",
>>> +         .data = (void *)MTK_DISP_GAMMA, },
>>>         { .compatible = "mediatek,mt8173-disp-gamma",
>>>           .data = (void *)MTK_DISP_GAMMA, },
>>> +       { .compatible = "mediatek,mt8167-disp-dither",
>>> +         .data = (void *)MTK_DISP_DITHER },
>>>         { .compatible = "mediatek,mt8173-disp-ufoe",
>>>           .data = (void *)MTK_DISP_UFOE },
>>>         { .compatible = "mediatek,mt2701-dsi",
>>>           .data = (void *)MTK_DSI },
>>> +       { .compatible = "mediatek,mt8167-dsi",
>>> +         .data = (void *)MTK_DSI },
>>>         { .compatible = "mediatek,mt8173-dsi",
>>>           .data = (void *)MTK_DSI },
>>>         { .compatible = "mediatek,mt2701-dpi",
>>> @@ -431,10 +463,14 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>>>           .data = (void *)MTK_DISP_MUTEX },
>>>         { .compatible = "mediatek,mt2712-disp-mutex",
>>>           .data = (void *)MTK_DISP_MUTEX },
>>> +       { .compatible = "mediatek,mt8167-disp-mutex",
>>> +         .data = (void *)MTK_DISP_MUTEX },
>>>         { .compatible = "mediatek,mt8173-disp-mutex",
>>>           .data = (void *)MTK_DISP_MUTEX },
>>>         { .compatible = "mediatek,mt2701-disp-pwm",
>>>           .data = (void *)MTK_DISP_BLS },
>>> +       { .compatible = "mediatek,mt8167-disp-pwm",
>>> +         .data = (void *)MTK_DISP_PWM },
>>>         { .compatible = "mediatek,mt8173-disp-pwm",
>>>           .data = (void *)MTK_DISP_PWM },
>>>         { .compatible = "mediatek,mt8173-disp-od",
>>> @@ -449,6 +485,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
>>>           .data = &mt7623_mmsys_driver_data},
>>>         { .compatible = "mediatek,mt2712-mmsys",
>>>           .data = &mt2712_mmsys_driver_data},
>>> +       { .compatible = "mediatek,mt8167-mmsys",
>>
>> This patch looks good to me, but it depend on another patch which
>> define the compatible "mediatek,mt8167-mmsys". Where is that patch?
> 
> You can find the patch there:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20201027160631.608503-2-fparent@baylibre.com/
> 

Driver is upstream since v5.13 with:
e7be7853ab1b ("dt-bindings: mediatek: mmsys: add mt8167 binding")

060f7875bd23 ("soc: mediatek: mmsys: Add support for MT8167 SoC")


Regards,
Matthias

>>
>> Regards,
>> Chun-Kuang.
>>
>>> +         .data = &mt8167_mmsys_driver_data},
>>>         { .compatible = "mediatek,mt8173-mmsys",
>>>           .data = &mt8173_mmsys_driver_data},
>>>         { }
>>> --
>>> 2.28.0
>>>
