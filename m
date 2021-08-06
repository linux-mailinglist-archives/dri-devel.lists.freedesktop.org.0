Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A6A3E2A79
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 14:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB96889919;
	Fri,  6 Aug 2021 12:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1839B89919
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 12:20:25 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id z4so10818612wrv.11
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Aug 2021 05:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A3hjISml0T2j3AZ4ow7rntlRgVo6EH23YKt2vN9i1XM=;
 b=uc9PACY7UkTfCvNpeCltqB3yj+tQKgIid5Q+EwX4eExP3AIRra2BNmq2usvV0H6zn6
 snSCVjQieofOCcN4viyuOfKDhKqwNGMyNDI98Cyc6jCmmdzv++YthxRz9Ul8p7PDTiQN
 WPO7Gcv4QCTXPXaqygRN3MaIx2m567Muy8ZHqSg+loBXkWWBoEVrOXSSKSmTg2QO7OLs
 G6Z4RddRXwRD9vG59C6TWzk7Nxd64ZzYJHmf3E4FFiN24vmpAoe6TqKdrK4Smxdl40rf
 gAydpj59PyOWXhsh9/4qtYYKypVWMEcDZt6t4K4Flatt4R8Bj0wkGapBFtkIQnFTNlDs
 /fzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A3hjISml0T2j3AZ4ow7rntlRgVo6EH23YKt2vN9i1XM=;
 b=HbznLbj5c34Ygva6gP+TUvwNrxY0Nh4ksDYUL6r/NJu/9M86S2lpsLazCn3C+n0fdA
 OWZ7BeXge7ChIv+3T98xiQHnjesePjBzazkEe2R/yUJJ470w4F+MOVrS0B2WRADED6yj
 kA4qT/tCrYA1tEHJ/O2+0sf8nGlcs2K8YQ0TkVr7AAXFGA2j8jLg608mNJMRE7k/nU7z
 ePhFkIfEIFgB664UWOdZdOs6S894FLgnsuPsqKPHBK/gUSDTfMCjGf5fxOl16EpvXz0f
 2thwdPmFg2lAjnD85e2PUF5z79umXdmZq/s3RFW3O00DBmwLeR4gF4UmLCds9Xeztz7Q
 BX5w==
X-Gm-Message-State: AOAM532ptS23sI3ctJ7G1Ru/MKerllIUkhZIoe7KCtl4rPO8g5saHUmd
 vlfQGop/E26aYhS2qRBW4bg=
X-Google-Smtp-Source: ABdhPJyeZo0QzE3AFKY2RpXIMCN1UM5TIGOz5UFL0DMrkiG8m4ODTXvM3YNo5NSHBivh7ix5k8URqA==
X-Received: by 2002:a05:6000:227:: with SMTP id
 l7mr10079447wrz.289.1628252423348; 
 Fri, 06 Aug 2021 05:20:23 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id h9sm8154460wmb.35.2021.08.06.05.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 05:20:22 -0700 (PDT)
Subject: Re: [PATCH v2 07/14] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys1
To: "Nancy.Lin" <nancy.lin@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20210722094551.15255-1-nancy.lin@mediatek.com>
 <20210722094551.15255-8-nancy.lin@mediatek.com>
 <CAFqH_53UpoChfrhXf41YRMGGPzjC9N2g3yNQQxc-J=7uPE44Cw@mail.gmail.com>
 <48be9a4ebb455737bfd640c6339f2ce05d02d4cd.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <6c1891ed-178e-b589-1630-93d528276b17@gmail.com>
Date: Fri, 6 Aug 2021 14:20:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <48be9a4ebb455737bfd640c6339f2ce05d02d4cd.camel@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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



On 28/07/2021 07:34, Nancy.Lin wrote:
> Hi Enric,
> 
> Thanks for your review.
> 
> On Fri, 2021-07-23 at 13:05 +0200, Enric Balletbo Serra wrote:
>> Hi Nancy,
>>
>> Thank you for your patch.
>>
>> Missatge de Nancy.Lin <nancy.lin@mediatek.com> del dia dj., 22 de
>> jul.
>> 2021 a les 11:45:
>>>
>>> Add mt8195 vdosys1 clock driver name and routing table to
>>> the driver data of mtk-mmsys.
>>>
>>> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
>>> ---
>>>  drivers/soc/mediatek/mt8195-mmsys.h    | 83
>>> ++++++++++++++++++++++++--
>>>  drivers/soc/mediatek/mtk-mmsys.c       | 10 ++++
>>>  include/linux/soc/mediatek/mtk-mmsys.h |  2 +
>>>  3 files changed, 90 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
>>> b/drivers/soc/mediatek/mt8195-mmsys.h
>>> index 73e9e8286d50..104ba575f765 100644
>>> --- a/drivers/soc/mediatek/mt8195-mmsys.h
>>> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
>>> @@ -64,16 +64,16 @@
>>>  #define SOUT_TO_VPP_MERGE0_P1_SEL                              (1
>>> << 0)
>>>
>>>  #define
>>> MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL                      0xf40
>>> -#define SOUT_TO_HDR_VDO_FE0                                    (0
>>> << 0)
>>
>> This definition was introduced in this patch [1] that didn't land
>> yet.
>> And you're removing it now. Could you sync with Jason and only
>> introduce the bits that are needed for your patches. Also all the
>> comments I made to the Jason's patch apply here.
>>
>> [1] 
>> https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20210723090233.24007-3-jason-jh.lin@mediatek.com/__;!!CTRNKA9wMg0ARbw!0rDdPxfBPcZC9icK37sCxT55RMqwRngO0BF4-uDwgYZP7UwQkx7iidkINqLBb7yi$
>>  
>>
> OK, I will sync with Jason and modify it.
> 
>>> +#define SOUT_TO_MIXER_IN1_SEL                                  (1
>>> << 0)
>>>
>>>  #define
>>> MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL                      0xf44
>>> -#define SOUT_TO_HDR_VDO_FE1                                    (0
>>> << 0)
>>> +#define SOUT_TO_MIXER_IN2_SEL                                  (1
>>> << 0)
>>>
>>>  #define
>>> MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL                      0xf48
>>> -#define SOUT_TO_HDR_GFX_FE0                                    (0
>>> << 0)
>>> +#define SOUT_TO_MIXER_IN3_SEL                                  (1
>>> << 0)
>>>
>>>  #define
>>> MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL                      0xf4c
>>> -#define SOUT_TO_HDR_GFX_FE1                                    (0
>>> << 0)
>>> +#define SOUT_TO_MIXER_IN4_SEL                                  (1
>>> << 0)
>>>
>>>  #define
>>> MT8195_VDO1_MIXER_IN1_SOUT_SEL                         0xf58
>>>  #define MIXER_IN1_SOUT_TO_DISP_MIXER                           (0
>>> << 0)
>>> @@ -88,7 +88,7 @@
>>>  #define MIXER_IN4_SOUT_TO_DISP_MIXER                           (0
>>> << 0)
>>>
>>>  #define
>>> MT8195_VDO1_MIXER_OUT_SOUT_SEL                         0xf34
>>> -#define MIXER_SOUT_TO_HDR_VDO_BE0                              (0
>>> << 0)
>>> +#define MIXER_SOUT_TO_MERGE4_ASYNC_SEL                         (1
>>> << 0)
>>>
>>>  #define
>>> MT8195_VDO1_MERGE4_SOUT_SEL                            0xf18
>>>  #define MERGE4_SOUT_TO_VDOSYS0                                 (0
>>> << 0)
>>> @@ -185,6 +185,79 @@ static const struct mtk_mmsys_routes
>>> mmsys_mt8195_routing_table[] = {
>>>         }, {
>>>                 DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
>>>                 MT8195_VDO0_SEL_OUT,
>>> SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE
>>> +       },
>>> +       {
>>> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
>>> +               MT8195_VDO1_VPP_MERGE0_P0_SEL_IN,
>>> VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0
>>> +       },
>>> +       {
>>> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
>>> +               MT8195_VDO1_VPP_MERGE0_P1_SEL_IN,
>>> VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1
>>> +       },
>>> +       {
>>> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
>>> +               MT8195_VDO1_VPP_MERGE1_P0_SEL_IN,
>>> VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2
>>> +       },
>>> +       {
>>> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
>>> +               MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL,
>>> SOUT_TO_MIXER_IN1_SEL
>>> +       },
>>> +       {
>>> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
>>> +               MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL,
>>> SOUT_TO_MIXER_IN2_SEL
>>> +       },
>>> +       {
>>> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
>>> +               MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL,
>>> SOUT_TO_MIXER_IN3_SEL
>>> +       },
>>> +       {
>>> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
>>> +               MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL,
>>> SOUT_TO_MIXER_IN4_SEL
>>> +       },
>>> +       {
>>> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
>>> +               MT8195_VDO1_MIXER_OUT_SOUT_SEL,
>>> MIXER_SOUT_TO_MERGE4_ASYNC_SEL
>>> +       },
>>> +       {
>>> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
>>> +               MT8195_VDO1_MIXER_IN1_SEL_IN,
>>> MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT
>>> +       },
>>> +       {
>>> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
>>> +               MT8195_VDO1_MIXER_IN2_SEL_IN,
>>> MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT
>>> +       },
>>> +       {
>>> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
>>> +               MT8195_VDO1_MIXER_IN3_SEL_IN,
>>> MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT
>>> +       },
>>> +       {
>>> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
>>> +               MT8195_VDO1_MIXER_IN4_SEL_IN,
>>> MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT
>>> +       },
>>> +       {
>>> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
>>> +               MT8195_VDO1_MIXER_SOUT_SEL_IN,
>>> MIXER_SOUT_SEL_IN_FROM_DISP_MIXER
>>> +       },
>>> +       {
>>> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
>>> +               MT8195_VDO1_MERGE4_ASYNC_SEL_IN,
>>> MERGE4_ASYNC_SEL_IN_FROM_MIXER_OUT_SOUT
>>> +       },
>>> +       {
>>> +               DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
>>> +               MT8195_VDO1_DISP_DPI1_SEL_IN,
>>> DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT
>>> +       },
>>> +       {
>>> +               DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
>>> +               MT8195_VDO1_MERGE4_SOUT_SEL,
>>> MERGE4_SOUT_TO_DPI1_SEL
>>> +       },
>>> +       {
>>> +               DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
>>> +               MT8195_VDO1_DISP_DP_INTF0_SEL_IN,
>>> +               DISP_DP_INTF0_SEL_IN_FROM_VPP_MERGE4_MOUT
>>> +       },
>>> +       {
>>> +               DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
>>> +               MT8195_VDO1_MERGE4_SOUT_SEL,
>>> MERGE4_SOUT_TO_DP_INTF0_SEL
>>>         }
>>>  };
>>>
>>> diff --git a/drivers/soc/mediatek/mtk-mmsys.c
>>> b/drivers/soc/mediatek/mtk-mmsys.c
>>> index 1fb241750897..9e31aad6c5c8 100644
>>> --- a/drivers/soc/mediatek/mtk-mmsys.c
>>> +++ b/drivers/soc/mediatek/mtk-mmsys.c
>>> @@ -59,6 +59,12 @@ static const struct mtk_mmsys_driver_data
>>> mt8195_vdosys0_driver_data = {
>>>         .num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
>>>  };
>>>
>>> +static const struct mtk_mmsys_driver_data
>>> mt8195_vdosys1_driver_data = {
>>> +       .clk_driver = "clk-mt8195-vdo1",
>>> +       .routes = mmsys_mt8195_routing_table,
>>> +       .num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
>>> +};
>>> +
>>>  struct mtk_mmsys {
>>>         void __iomem *regs;
>>>         const struct mtk_mmsys_driver_data *data;
>>> @@ -168,6 +174,10 @@ static const struct of_device_id
>>> of_match_mtk_mmsys[] = {
>>>                 .compatible = "mediatek,mt8195-vdosys0",
>>>                 .data = &mt8195_vdosys0_driver_data,
>>>         },
>>> +       {
>>> +               .compatible = "mediatek,mt8195-vdosys1",
>>
>> Why do you need a second compatible, isn't this the same IP block? I
>> mean, I understand that you have 2 mmsys blocks, but both are the
>> same
>> IP block, right? or are they different?
>>
>> Thanks,
>>   Enric
>>
> They(vdosys0 and vdosys1) are different IP block.
> 

Please explain in what they are different. From what I see, you use the same
routing table for both compatibles and only register another platform device for
a second clock. Is that correct?

Regards,
Matthias

>>> +               .data = &mt8195_vdosys1_driver_data,
>>> +       },
>>>         { }
>>>  };
>>>
>>> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h
>>> b/include/linux/soc/mediatek/mtk-mmsys.h
>>> index 34cb605e5df9..338c71570aeb 100644
>>> --- a/include/linux/soc/mediatek/mtk-mmsys.h
>>> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
>>> @@ -49,6 +49,8 @@ enum mtk_ddp_comp_id {
>>>         DDP_COMPONENT_DSC1,
>>>         DDP_COMPONENT_DSC1_VIRTUAL0,
>>>         DDP_COMPONENT_DP_INTF0,
>>> +       DDP_COMPONENT_DP_INTF1,
>>> +       DDP_COMPONENT_PSEUDO_OVL,
>>>         DDP_COMPONENT_ID_MAX,
>>>  };
>>>
>>> --
>>> 2.18.0
>>>
