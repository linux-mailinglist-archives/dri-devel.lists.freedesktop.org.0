Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFED50E45D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 17:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB1710F08D;
	Mon, 25 Apr 2022 15:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC49C10F08D
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 15:27:34 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id h83so16204998iof.8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 08:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nYsiunOUmFwZ8o8GT74juEfa6oLm3zN9Ibj3gVa3bhU=;
 b=i77OZZbZby0nwayMxGseETzr9Nj7J6fX5a++xq03SVhVqRw1UzRVEFc2taTVeAwKIx
 bpvm7uM3vRs39zX0rrxk5JDfUWPopToIhRBrDI+o4mAuHvh3vFBZupK5zorHVe/CmH+u
 vyFzmNAsKrnn+xdUsiFFpZlPY+NZEygZg5XCeHV51KiCqTj00m5DiEP+e+DnYHXQHART
 h1Zphjo3zCVJueWZVhkfeYvQk2BGyHdlT/ujK+BZc6F7STAC3GVIK4fd389QU+E3CWYZ
 WgAQhDs9ANzbCD4mOfXtByWpJFFyk+yN6QxirF8aFCaVelBhgkxpLlYf5lARzkvP5tZT
 cS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nYsiunOUmFwZ8o8GT74juEfa6oLm3zN9Ibj3gVa3bhU=;
 b=k9tap1Lmy1RmHbwEvR0/M/pvJFK8pZ2P2HWk/QemhRQS0jeWdpTKTRxOn1qAStUdtr
 LZw5JRem0n1VqhYh4vTYSP9b+YHr/MgSfBFkNr1WoYPhQ+/IeOhhJt/QWUQZ+LE0nZK9
 OgtCdrOh5Yu94IfTguuS/Glw1AzxuGmdi5kPoSxJrB4/xabYSkIVSkDFiG6Y2kVK+D8y
 Z3ysoRi8cftM7NqZm9NN/Yx9ktjENxs9oJGkHpTiBfuWGpCsHZYT5Vl0HtXcSKVgbAku
 uzrGPOENy8sSusjY17dqnqPeXJv1Gmnrt9efUA7gVbeCZjFVF5/WfA5fIAA0CpQ9W6tb
 xeFQ==
X-Gm-Message-State: AOAM5321bNpRVkbgUmDTu817oE3pSFjQ6l5CbZybJO0+DpAgYKIzMS7n
 utWFJjeOcSQgwuuIieSR1Jo=
X-Google-Smtp-Source: ABdhPJzaOOhKV4BPWVeNOg0tWQ6bvh+gsUzBd/G0AXF40GnUFg0YdN6YZlGg+EFWAsS/57V61YrvNQ==
X-Received: by 2002:a05:6638:1352:b0:321:547b:daa2 with SMTP id
 u18-20020a056638135200b00321547bdaa2mr7317700jad.128.1650900453788; 
 Mon, 25 Apr 2022 08:27:33 -0700 (PDT)
Received: from [192.168.0.43] (static-35-180-85-188.ipcom.comunitel.net.
 [188.85.180.35]) by smtp.gmail.com with ESMTPSA id
 b11-20020a6be70b000000b00654b3a46b5esm7499151ioh.53.2022.04.25.08.27.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 08:27:33 -0700 (PDT)
Message-ID: <7faa6c9a-9ace-d1eb-0bca-8e8d7c3ae7ec@gmail.com>
Date: Mon, 25 Apr 2022 17:27:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v17 11/21] drm/mediatek: add display merge start/stop API
 for cmdq support
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20220416020749.29010-1-nancy.lin@mediatek.com>
 <20220416020749.29010-12-nancy.lin@mediatek.com>
 <2cd07faf-e903-e55b-85c1-ce7a823ddb8b@gmail.com>
 <CAAOTY_8Ei1e+Y==y+e7LoHBH3-SZEiz4M0SSqecRfWVMsLKH3Q@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAAOTY_8Ei1e+Y==y+e7LoHBH3-SZEiz4M0SSqecRfWVMsLKH3Q@mail.gmail.com>
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
Cc: DTML <devicetree@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>, "Nancy.Lin" <nancy.lin@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, wim@linux-watchdog.org,
 singo.chang@mediatek.com, linux@roeck-us.net,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 25/04/2022 15:32, Chun-Kuang Hu wrote:
> Hi, Matthias:
> 
> Matthias Brugger <matthias.bgg@gmail.com> 於 2022年4月22日 週五 下午7:48寫道：
>>
>>
>>
>> On 16/04/2022 04:07, Nancy.Lin wrote:
>>> Add merge start/stop API for cmdq support. The ovl_adaptor merges
>>> are configured with each drm plane update. Need to enable/disable
>>> merge with cmdq making sure all the settings taken effect in the
>>> same vblank.
>>>
>>> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
>>> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> ---
>>>    drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  2 ++
>>>    drivers/gpu/drm/mediatek/mtk_disp_merge.c | 20 +++++++++++++++++---
>>>    2 files changed, 19 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
>>> index 53aa988dde3b..43a412525b75 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
>>> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
>>> @@ -66,6 +66,8 @@ void mtk_merge_stop(struct device *dev);
>>>    void mtk_merge_advance_config(struct device *dev, unsigned int l_w, unsigned int r_w,
>>>                              unsigned int h, unsigned int vrefresh, unsigned int bpc,
>>>                              struct cmdq_pkt *cmdq_pkt);
>>> +void mtk_merge_start_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt);
>>> +void mtk_merge_stop_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt);
>>>
>>>    void mtk_ovl_bgclr_in_on(struct device *dev);
>>>    void mtk_ovl_bgclr_in_off(struct device *dev);
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
>>> index 40da0555416d..c0d9b43b2a66 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
>>> @@ -67,17 +67,31 @@ struct mtk_disp_merge {
>>>    };
>>>
>>>    void mtk_merge_start(struct device *dev)
>>
>> Probably not my call, but wouldn't it make sense to enhance mtk_merge_start to
>> pass 'struct cmdq_pkt *cmdq_pkt' directly instead of adding this 'adapter'?
> 
> In [1], mtk_merge_start() should match the function prototype of
> mtk_ddp_comp_funcs.start, so keep the non-cmdq interface.

Well other callbacks, namely config hass cmdq_pkt. So we could change the 
callback in a similar way is was done in
d0afe37f5209 ("drm/mediatek: support CMDQ interface in ddp component")


But as i said it's up to you. You are the maintainer.

Regards,
Matthias

> 
> static const struct mtk_ddp_comp_funcs ddp_merge = {
>   .clk_enable = mtk_merge_clk_enable,
>   .clk_disable = mtk_merge_clk_disable,
>   .start = mtk_merge_start,
>   .stop = mtk_merge_stop,
>   .config = mtk_merge_config,
> };
> 
> [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220419094143.9561-5-jason-jh.lin@mediatek.com/
> 
> Regards,
> Chun-Kuang.
> 
>>
>> In the end this is up to Chun-Kuang.
>>
>> Regards,
>> Matthias
>>
>>> +{
>>> +     mtk_merge_start_cmdq(dev, NULL);
>>> +}
>>> +
>>> +void mtk_merge_stop(struct device *dev)
>>>    {
>>>        struct mtk_disp_merge *priv = dev_get_drvdata(dev);
>>>
>>> -     writel(MERGE_EN, priv->regs + DISP_REG_MERGE_CTRL);
>>> +     mtk_merge_stop_cmdq(dev, NULL);
>>>    }
>>>
>>> -void mtk_merge_stop(struct device *dev)
>>> +void mtk_merge_start_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt)
>>> +{
>>> +     struct mtk_disp_merge *priv = dev_get_drvdata(dev);
>>> +
>>> +     mtk_ddp_write(cmdq_pkt, 1, &priv->cmdq_reg, priv->regs,
>>> +                   DISP_REG_MERGE_CTRL);
>>> +}
>>> +
>>> +void mtk_merge_stop_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt)
>>>    {
>>>        struct mtk_disp_merge *priv = dev_get_drvdata(dev);
>>>
>>> -     writel(0x0, priv->regs + DISP_REG_MERGE_CTRL);
>>> +     mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
>>> +                   DISP_REG_MERGE_CTRL);
>>>    }
>>>
>>>    static void mtk_merge_fifo_setting(struct mtk_disp_merge *priv,
