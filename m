Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB224A45E4F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 13:14:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7DA10E8D1;
	Wed, 26 Feb 2025 12:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="GKis/B3g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD67710E8D1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 12:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1740572058;
 bh=rqCCBNqXwX4V8aDAu9AF4qY0OGm7CseWGja67coCy5c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GKis/B3gCV2Up4PlhYkjHwnXjxI4wulD5+R8haxATHmM1XWM5j3pG1Oo5ecM+L7BY
 SeGBHRjt5DN7jdPAaFVvszr5Op7oi8IYYybFHxmcg2enbtntBGBJzShX8T6t1sGOKb
 oPcHLF1XDTcL3OPr6jlFfUVuQXX62MhQOa8JWGoDYxTjGBpzzXduhmsKQGtJpAkct+
 ZDdyw35Sv+uw5zvIWJB5MMf0yeRyUVLsoqHIyLHtwrrNcF2KGaNguFHV7Xb9tnO6zU
 /R6qn5KWHpBXVGPHV+T7iGG35R7UbkCdg681ly6oWWIRiuqEAIlqiaH1QU3KthG9f2
 jKDdpN7GJIHfw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6D8AE17E0649;
 Wed, 26 Feb 2025 13:14:17 +0100 (CET)
Message-ID: <cfb97821-d202-4bd6-99d6-059178b6ad00@collabora.com>
Date: Wed, 26 Feb 2025 13:14:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/mediatek: Add CCORR component support for MT8196
To: =?UTF-8?B?SmF5IExpdSAo5YiY5Y2aKQ==?= <Jay.Liu@mediatek.com>,
 =?UTF-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?=
 <yongqiang.niu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20250219092040.11227-1-jay.liu@mediatek.com>
 <20250219092040.11227-2-jay.liu@mediatek.com>
 <779b0915-f0fa-46b6-8c5b-57745114252f@collabora.com>
 <18ea04bde26b9cbc22609d621eea1cd65a0f1109.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <18ea04bde26b9cbc22609d621eea1cd65a0f1109.camel@mediatek.com>
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

Il 26/02/25 12:36, Jay Liu (刘博) ha scritto:
> On Wed, 2025-02-19 at 13:49 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> Il 19/02/25 10:20, Jay Liu ha scritto:
>>> Add CCORR component support for MT8196.
>>>
>>> CCORR is a hardware module that optimizes the visual effects of
>>> images by adjusting the color matrix, enabling features such as
>>> night light.
>>>
>>> The 8196 hardware platform includes two CCORR (Color Correction)
>>> units.
>>> However, the `mtk_ccorr_ctm_set` API only utilizes one of these
>>> units.
>>> To prevent the unused CCORR unit from inadvertently taking effect,
>>> we need to block it by adding mandatory_ccorr flag in the
>>> driver_data.
>>>
>>> Signed-off-by: Jay Liu <jay.liu@mediatek.com>
>>
>> This is yet another thing that can be resolved by using OF Graph for
>> defining the
>> display pipeline: by using that, I don't see how can CCORR1 be used
>> instead of
>> CCORR0, if the latter is in the pipeline, but not the former.
>>
>> NACK.
>>
>> Regards,
>> Angelo
>>
> hi Angelo, thank you for your review,
> 
> The 8196 IC has two CCORRs, and they must be chained together in a
> fixed order, for example: MDP_RSZ0->DISP_TDSHP0->DISP_CCORR0-
>> DISP_CC0RR1->DISP_GAMMA0->DISP_POSTMASK0->DISP_DITHER0. Among them,
> DISP_CCORR0 is used for ctm_set, and DISP_CCORR1 was originally for PQ
> functions, but the current project does not have PQ functions, so relay
> can be used. Moreover, ctm_set only needs to configure one CCORR, so
> currently, mandatory_ccorr is set. Considering that previous ICs, such
> as 8195, only have one CCORR, so mandatory_ccorr is set to DISP_CCORR0.
> This is the current practice. Do you have any other suggestions to
> achieve similar things? For example, adding a property in the dts to

Really, just use OF graphs to set the display controller path, you can like that
guarantee that the exact path that you define will be respected.

This means that you can simply:
- Point the output endpoint of TDSHP0 to the input endpoint of CCORR0
- Point the input endpoint of CCORR0 to TDSHP0
- Point the output endpoint of CCORR0 to CCORR1
- etc

Check the upstream bindings, and also check MT8195 and MT8188 device trees on
the current linux-next (starting from next-20250226).

Cheers,
Angelo

> set mandatory_ccorr, but this will inevitably change the dts of past
> ICs, and we are worried that such changes will be significant.
> 
> Thanks a lot
> JAY
> 
> 
>>> ---
>>>    drivers/gpu/drm/mediatek/mtk_ddp_comp.c   |  3 ++-
>>>    drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 16 ++++++++++++++++
>>>    2 files changed, 18 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
>>> b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
>>> index edc6417639e6..d7e230bac53e 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
>>> @@ -457,7 +457,8 @@ static const struct mtk_ddp_comp_match
>>> mtk_ddp_matches[DDP_COMPONENT_DRM_ID_MAX]
>>>        [DDP_COMPONENT_AAL0]            = {
>>> MTK_DISP_AAL,               0, &ddp_aal },
>>>        [DDP_COMPONENT_AAL1]            = {
>>> MTK_DISP_AAL,               1, &ddp_aal },
>>>        [DDP_COMPONENT_BLS]             = {
>>> MTK_DISP_BLS,               0, NULL },
>>> -     [DDP_COMPONENT_CCORR]           = {
>>> MTK_DISP_CCORR,             0, &ddp_ccorr },
>>> +     [DDP_COMPONENT_CCORR0]          = {
>>> MTK_DISP_CCORR,             0, &ddp_ccorr },
>>> +     [DDP_COMPONENT_CCORR1]          = {
>>> MTK_DISP_CCORR,             1, &ddp_ccorr },
>>>        [DDP_COMPONENT_COLOR0]          = {
>>> MTK_DISP_COLOR,             0, &ddp_color },
>>>        [DDP_COMPONENT_COLOR1]          = {
>>> MTK_DISP_COLOR,             1, &ddp_color },
>>>        [DDP_COMPONENT_DITHER0]         = {
>>> MTK_DISP_DITHER,            0, &ddp_dither },
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
>>> b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
>>> index 10d60d2c2a56..94e82b3fa2d8 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
>>> @@ -31,11 +31,13 @@
>>>
>>>    struct mtk_disp_ccorr_data {
>>>        u32 matrix_bits;
>>> +     enum mtk_ddp_comp_id mandatory_ccorr;
>>>    };
>>>
>>>    struct mtk_disp_ccorr {
>>>        struct clk *clk;
>>>        void __iomem *regs;
>>> +     enum mtk_ddp_comp_id comp_id;
>>>        struct cmdq_client_reg cmdq_reg;
>>>        const struct mtk_disp_ccorr_data        *data;
>>>    };
>>> @@ -115,6 +117,9 @@ void mtk_ccorr_ctm_set(struct device *dev,
>>> struct drm_crtc_state *state)
>>>        if (!blob)
>>>                return;
>>>
>>> +     if (ccorr->comp_id != ccorr->data->mandatory_ccorr)
>>> +             return;
>>> +
>>>        ctm = (struct drm_color_ctm *)blob->data;
>>>        input = ctm->matrix;
>>>
>>> @@ -154,6 +159,7 @@ static int mtk_disp_ccorr_probe(struct
>>> platform_device *pdev)
>>>        struct device *dev = &pdev->dev;
>>>        struct mtk_disp_ccorr *priv;
>>>        int ret;
>>> +     enum mtk_ddp_comp_id comp_id;
>>>
>>>        priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>>>        if (!priv)
>>> @@ -169,6 +175,14 @@ static int mtk_disp_ccorr_probe(struct
>>> platform_device *pdev)
>>>                return dev_err_probe(dev, PTR_ERR(priv->regs),
>>>                                     "failed to ioremap ccorr\n");
>>>
>>> +     comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DISP_CCORR);
>>> +     if (comp_id < 0) {
>>> +             dev_err(dev, "Failed to identify by alias: %d\n",
>>> comp_id);
>>> +             return comp_id;
>>> +     }
>>> +
>>> +     priv->comp_id = comp_id;
>>> +
>>>    #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>>>        ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
>>>        if (ret)
>>> @@ -192,10 +206,12 @@ static void mtk_disp_ccorr_remove(struct
>>> platform_device *pdev)
>>>
>>>    static const struct mtk_disp_ccorr_data mt8183_ccorr_driver_data
>>> = {
>>>        .matrix_bits = 10,
>>> +     .mandatory_ccorr = DDP_COMPONENT_CCORR0,
>>>    };
>>>
>>>    static const struct mtk_disp_ccorr_data mt8192_ccorr_driver_data
>>> = {
>>>        .matrix_bits = 11,
>>> +     .mandatory_ccorr = DDP_COMPONENT_CCORR0,
>>>    };
>>>
>>>    static const struct of_device_id mtk_disp_ccorr_driver_dt_match[]
>>> = {
>>
>>

