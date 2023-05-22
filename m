Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C784170BDED
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 14:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A282F10E2F6;
	Mon, 22 May 2023 12:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C44010E2F6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 12:25:52 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D10826606E61;
 Mon, 22 May 2023 13:25:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1684758348;
 bh=eOVhcHEbGP5rclzgfYWP+S6Ejdrr+h19pmAg3f+xf+c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JKx/xVplO1ihYlBace0UmeZwdpBzN4J2si6SWj8BsqS5e6cAQrEhZDwltSBdG494Q
 GKBmj7E2hcedCAM25rNaJ9YfXt2MnmJv1cuwAGzmyMP0ov9w5yfqOuQND9SmMIvey6
 erIo3na6W8NOTb0IiAEdlzqPz56ZRuswPLBvGfJshp+LkpoA593IevE6W9akBGfGqK
 LXgihdZp/4KzsVec/6LGZohcY5se9B5Fmg1NZ6bKjHnjYUGGjYIRHkK4mc6vfo0gnK
 w+s/EiK0X1DZPnLUn4Y46U65HCppsX6J0P0AMF8PsEXfe71/rPW+w34MnWynMZIuAO
 YM25Lb3/5O/Sw==
Message-ID: <a28293b1-18d9-6a85-5325-3b7944d97a14@collabora.com>
Date: Mon, 22 May 2023 14:25:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4 05/11] drm/mediatek: gamma: Enable the Gamma LUT table
 only after programming
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
References: <20230518104857.124265-1-angelogioacchino.delregno@collabora.com>
 <20230518104857.124265-6-angelogioacchino.delregno@collabora.com>
 <51a5fbd349cce69d372f4ccfff7010ea9e6e8f75.camel@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <51a5fbd349cce69d372f4ccfff7010ea9e6e8f75.camel@mediatek.com>
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

Il 22/05/23 12:00, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Thu, 2023-05-18 at 12:48 +0200, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> Move the write to DISP_GAMMA_CFG to enable the Gamma LUT to after
>> programming the actual table to avoid potential visual glitches
>> during
>> table modification.
> 
> I think user could update the lut table frequently, so when do you
> disable the gamma function before next update? In addition, if we
> really care the glitches, update the register in vblank period which
> should use cmdq to update the register. But now, I think we do not care
> the glitches. You may skip this patch, or fix the problem I mention.
> 

If you disable the GAMMA function (either set RELAY mode or disable the
GAMMA_LUT_EN bit in GAMMA_CFG), there will be glitches during setting via
the GNOME Night Mode color temperature slider.

This commit prevents a glitch in the case in which the GAMMA LUT registers
are not zeroed before setting the expected LUT, for which reason I disagree
about skipping this patch.

Please note that, while I agree about updating the GAMMA LUT through CMDQ
setting and between vblanks, this requires a lot more effort to implement
and it's out of scope for this specific series; depending on my bandwidth,
this may come later and it would in any case require this patch to move
the LUT enablement to after LUT registers setting. Besides, I have already
tried to enable this through CMDQ, but didn't work as expected and since I
had no time to dig further, I deemed this to be essential for at least an
initial functionality implementation for MT8195, and a cleanup of this
driver.
Obviously, the *only* way to fix *all* of the corner cases of the problem
that you mentioned is to use CMDQ and trying to implement this purely with
cpu writes will in any case be prone to at least some glitches.

In any case, while your concern is valid, I'm sure that you agree with me
on the fact that enabling the LUT before actually programming it is something
that should not happen in principle. For this reason, and for the others that
I've just mentioned, I think that this patch is totally valid.

Regards,
Angelo

> Regards,
> CK
> 
>>
>> Signed-off-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>> Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 13 ++++++++-----
>>   1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
>> b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
>> index 60ccea8c1e1a..1592614b6de7 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
>> @@ -71,12 +71,12 @@ unsigned int mtk_gamma_get_lut_size(struct device
>> *dev)
>>   void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
>> struct drm_crtc_state *state)
>>   {
>>          struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
>> -       unsigned int i, reg;
>> +       unsigned int i;
>>          struct drm_color_lut *lut;
>>          void __iomem *lut_base;
>>          bool lut_diff;
>>          u16 lut_size;
>> -       u32 word;
>> +       u32 cfg_val, word;
>>
>>          /* If there's no gamma lut there's nothing to do here. */
>>          if (!state->gamma_lut)
>> @@ -90,9 +90,7 @@ void mtk_gamma_set_common(struct device *dev, void
>> __iomem *regs, struct drm_crt
>>                  lut_size = LUT_SIZE_DEFAULT;
>>          }
>>
>> -       reg = readl(regs + DISP_GAMMA_CFG);
>> -       reg = reg | GAMMA_LUT_EN;
>> -       writel(reg, regs + DISP_GAMMA_CFG);
>> +       cfg_val = readl(regs + DISP_GAMMA_CFG);
>>          lut_base = regs + DISP_GAMMA_LUT;
>>          lut = (struct drm_color_lut *)state->gamma_lut->data;
>>          for (i = 0; i < lut_size; i++) {
>> @@ -122,6 +120,11 @@ void mtk_gamma_set_common(struct device *dev,
>> void __iomem *regs, struct drm_crt
>>                  }
>>                  writel(word, (lut_base + i * 4));
>>          }
>> +
>> +       /* Enable the gamma table */
>> +       cfg_val = cfg_val | GAMMA_LUT_EN;
>> +
>> +       writel(cfg_val, regs + DISP_GAMMA_CFG);
>>   }
>>
>>   void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
>> --
>> 2.40.1
>>

