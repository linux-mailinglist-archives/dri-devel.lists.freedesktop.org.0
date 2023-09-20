Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 384727A755F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 10:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338CA10E167;
	Wed, 20 Sep 2023 08:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1D010E167
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 08:08:26 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 78A0366028F5;
 Wed, 20 Sep 2023 09:08:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695197305;
 bh=xWTJKdiQL/zsJInvZzW3QMO4ZtXOI8FVcEemZ/E7TgY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KSRRJP2AFK0D/W7GRW1VVZDFdvt4hACRxlJv1JhWU0dWe8vmy89VwBzxbH9ThOcYD
 YoMYNnjHJ4yA/0yk8b8KV45b8XtkhW0ZreCg1q39UhrqZeTn7wafaiZO6jBGt0aUh4
 JAkv/97mWVpyG0BA6bTRT/dBdsq4puOyUb4n6fp9MZ0iRyE4x78m3dFr663WWdUcvs
 bR2XFt+7ww08dUiBI+sArdZX5DPhyv16HdvIYe9epBsSO2nsNGnBvgaQwyH47wSFtg
 IooxKtFD6gRZJIUYSsPCN+HGgpPQlxHeQ5TSLMdjP1XODALawfTrgJA0sa12MSmDxy
 4KWYWgGB8ehLg==
Message-ID: <4b1b3614-6a76-1ce9-7274-b5bb4deb6b74@collabora.com>
Date: Wed, 20 Sep 2023 10:08:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v10 03/16] drm/mediatek: gamma: Support SoC specific LUT
 size
Content-Language: en-US
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
References: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
 <20230804072850.89365-4-angelogioacchino.delregno@collabora.com>
 <ab2981b2f2278a7e9a02c4f3f9aa5b6c9677c1b9.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ab2981b2f2278a7e9a02c4f3f9aa5b6c9677c1b9.camel@mediatek.com>
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
Cc: "amergnat@baylibre.com" <amergnat@baylibre.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "ehristev@collabora.com" <ehristev@collabora.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 18/09/23 04:30, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Fri, 2023-08-04 at 09:28 +0200, AngeloGioacchino Del Regno wrote:
>> Newer SoCs support a bigger Gamma LUT table: wire up a callback
>> to retrieve the correct LUT size for each different Gamma IP.
>>
>> Co-developed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>> [Angelo: Rewritten commit message/description + porting]
>> Signed-off-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>> Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_disp_aal.c     | 17 ++++++++++++++-
>>   drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  2 ++
>>   drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 23 ++++++++++++++++++-
>> --
>>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  8 +++++--
>>   drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  1 -
>>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  2 ++
>>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  9 ++++++++
>>   7 files changed, 55 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
>> b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
>> index 2f602f1f1c49..e2e4155faf01 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
>> @@ -19,7 +19,7 @@
>>   #define AAL_EN						BIT(0)
>>   #define DISP_AAL_SIZE				0x0030
>>   #define DISP_AAL_OUTPUT_SIZE			0x04d8
>> -
>> +#define DISP_AAL_LUT_SIZE			512
>>   
>>   struct mtk_disp_aal_data {
>>   	bool has_gamma;
>> @@ -61,6 +61,21 @@ void mtk_aal_config(struct device *dev, unsigned
>> int w,
>>   	mtk_ddp_write(cmdq_pkt, w << 16 | h, &aal->cmdq_reg, aal->regs,
>> DISP_AAL_OUTPUT_SIZE);
>>   }
>>   
>> +/**
>> + * mtk_aal_gamma_get_lut_size() - Get gamma LUT size for AAL
>> + * @dev: Pointer to struct device
>> + *
>> + * Return: 0 if gamma control not supported in AAL or gamma LUT size
>> + */
>> +unsigned int mtk_aal_gamma_get_lut_size(struct device *dev)
>> +{
>> +	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
>> +
>> +	if (aal->data && aal->data->has_gamma)
>> +		return DISP_AAL_LUT_SIZE;
>> +	return 0;
>> +}
>> +
>>   void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state
>> *state)
>>   {
>>   	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
>> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
>> b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
>> index 75045932353e..ca377265e5eb 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
>> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
>> @@ -17,6 +17,7 @@ void mtk_aal_clk_disable(struct device *dev);
>>   void mtk_aal_config(struct device *dev, unsigned int w,
>>   		    unsigned int h, unsigned int vrefresh,
>>   		    unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
>> +unsigned int mtk_aal_gamma_get_lut_size(struct device *dev);
>>   void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state
>> *state);
>>   void mtk_aal_start(struct device *dev);
>>   void mtk_aal_stop(struct device *dev);
>> @@ -53,6 +54,7 @@ void mtk_gamma_clk_disable(struct device *dev);
>>   void mtk_gamma_config(struct device *dev, unsigned int w,
>>   		      unsigned int h, unsigned int vrefresh,
>>   		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
>> +unsigned int mtk_gamma_get_lut_size(struct device *dev);
>>   void mtk_gamma_set(struct device *dev, struct drm_crtc_state
>> *state);
>>   void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
>> struct drm_crtc_state *state);
>>   void mtk_gamma_start(struct device *dev);
>> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
>> b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
>> index 47751864bd5c..7575237625d2 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
>> @@ -24,10 +24,12 @@
>>   #define DISP_GAMMA_LUT				0x0700
>>   
>>   #define LUT_10BIT_MASK				0x03ff
>> +#define LUT_SIZE_DEFAULT			512
>>   
>>   struct mtk_disp_gamma_data {
>>   	bool has_dither;
>>   	bool lut_diff;
>> +	u16 lut_size;
>>   };
>>   
>>   /*
>> @@ -54,6 +56,15 @@ void mtk_gamma_clk_disable(struct device *dev)
>>   	clk_disable_unprepare(gamma->clk);
>>   }
>>   
>> +unsigned int mtk_gamma_get_lut_size(struct device *dev)
>> +{
>> +	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
>> +
>> +	if (gamma && gamma->data)
>> +		return gamma->data->lut_size;
>> +	return LUT_SIZE_DEFAULT;
>> +}
>> +
>>   void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
>> struct drm_crtc_state *state)
>>   {
>>   	struct mtk_disp_gamma *gamma;
>> @@ -61,6 +72,7 @@ void mtk_gamma_set_common(struct device *dev, void
>> __iomem *regs, struct drm_crt
>>   	struct drm_color_lut *lut;
>>   	void __iomem *lut_base;
>>   	bool lut_diff;
>> +	u16 lut_size;
>>   	u32 word;
>>   	u32 diff[3] = {0};
>>   
>> @@ -71,17 +83,20 @@ void mtk_gamma_set_common(struct device *dev,
>> void __iomem *regs, struct drm_crt
>>   	/* If we're called from AAL, dev is NULL */
>>   	gamma = dev ? dev_get_drvdata(dev) : NULL;
>>   
>> -	if (gamma && gamma->data)
>> +	if (gamma && gamma->data) {
>>   		lut_diff = gamma->data->lut_diff;
>> -	else
>> +		lut_size = gamma->data->lut_size;
>> +	} else {
>>   		lut_diff = false;
>> +		lut_size = LUT_SIZE_DEFAULT;
> 
> Only AAL use this definiton. As previous discussion,
> mtk_gamm_set_common() would not be common and has gamma version and AAL
> version.
> 

Hello CK,

Yes, that's true, but every patch has to work on its own: this means that
I forcefully have to add this here to avoid breaking functionality!

Please check patch [08/16] where I de-commonize the gamma_set function, as
there I am removing the AAL-only definition and adding a AAL-specific
gamma_set() callback.

I've done it this way for multiple reasons, one of which is to show why a
de-commonization of this function is required.

Regards,
Angelo

> Regards,
> CK
> 

