Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEAE712271
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 10:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6001E10E7BE;
	Fri, 26 May 2023 08:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7199510E7BE
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 08:42:45 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AED846606E83;
 Fri, 26 May 2023 09:42:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1685090563;
 bh=i6rzAfODVwC2ZUVbGiudZ2RiX0ONSGFLeLMYfiESWFk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LcaxJtN4Dv248ZgNRCWAO050gswDW4ffJhmG2nKdfuoAV8SO3kdulJ6MvmuZIzzgF
 ODSubkkIe3fLBnbUzBvbFr8wd9mKxGrSiMMP79WFF8cE2sIiCyOsRwEzKBGhLZ4OsR
 mzkKoIrSvhMh+5utSEYpxXZyRr1R0+kOFyPMkte+3+RG281ZjbgboTfnzoJ5AzUTWY
 yANJdb4v+/C7Px4kDbFxjwXsXhPII5VzC4ibe2wj7k1wR9TRP8cknwqmvozsKfmpyD
 Yh4mYqdyuX9JGuhHWJm9YO4pnElcuw8AXas0CyKKukm3WoH5d4LDTd1bMLk/m0BKJ0
 Gcw9eei9hDM1w==
Message-ID: <0430808a-6180-e9e4-adbd-dd891f86c6ec@collabora.com>
Date: Fri, 26 May 2023 10:42:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4 03/11] drm/mediatek: gamma: Support SoC specific LUT
 size
Content-Language: en-US
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
References: <20230518104857.124265-1-angelogioacchino.delregno@collabora.com>
 <20230518104857.124265-4-angelogioacchino.delregno@collabora.com>
 <135f8b6829585632f81d9c4da9a3b6211a8e0bfa.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <135f8b6829585632f81d9c4da9a3b6211a8e0bfa.camel@mediatek.com>
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
Cc: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 26/05/23 07:20, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Thu, 2023-05-18 at 12:48 +0200, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> Newer SoCs support a bigger Gamma LUT table: wire up a callback
>> to retrieve the correct LUT size for each different Gamma IP.
>>
>> Co-developed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>> [Angelo: Rewritten commit message/description + porting]
>> Signed-off-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>> Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  1 +
>>   drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 25 ++++++++++++++++++-
>> --
>>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  4 ++--
>>   drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  1 -
>>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  1 +
>>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  9 ++++++++
>>   6 files changed, 35 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
>> b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
>> index 75045932353e..e554b19f4830 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
>> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
>> @@ -53,6 +53,7 @@ void mtk_gamma_clk_disable(struct device *dev);
>>   void mtk_gamma_config(struct device *dev, unsigned int w,
>>                        unsigned int h, unsigned int vrefresh,
>>                        unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
>> +unsigned int mtk_gamma_get_lut_size(struct device *dev);
>>   void mtk_gamma_set(struct device *dev, struct drm_crtc_state
>> *state);
>>   void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
>> struct drm_crtc_state *state);
>>   void mtk_gamma_start(struct device *dev);
>> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
>> b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
>> index ce6f2499b891..d194d9bc2e2b 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
>> @@ -25,10 +25,12 @@
>>   #define DISP_GAMMA_LUT                         0x0700
>>
>>   #define LUT_10BIT_MASK                         0x03ff
>> +#define LUT_SIZE_DEFAULT                       512 /* for setting
>> gamma lut from AAL */
> 
> I would like to place AAL definition in AAL driver and pass it to gamma
> driver.
> 

This is not only for AAL, actually; I should remove that comment as it
may actually be misleading.

The default LUT size (512) is relevant for both the AAL case and the
older SoCs, where the LUT size is 512 and no multi-register.

I'll remove that comment in the next version

Regards,
Angelo

