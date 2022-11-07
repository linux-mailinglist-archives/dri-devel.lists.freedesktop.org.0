Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F45B61F6EC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C0E10E39D;
	Mon,  7 Nov 2022 14:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18B010E39D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 14:57:21 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id g7so17120473lfv.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 06:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AQlxwrQ9+SAIJlBHFz/WVtqfuSsX8479gf+InmNYkZs=;
 b=1eTJqEXUCN6TpV6RPCjctxazLVjc44ZvzsBItOrs8d80EmK/RTm5KYkB5ehzSFcSap
 0Ia4QJxum/15AedJZzgTedYWblULvJ2HWn6NIOVO0kLVUGzxxNuXTNkUbSKEiihYW5uY
 eI9c/r5MpYt9th3ARFOLRYCWL8+OX7E7r5QjWjQT9gbVW+CjhHoH7P5pnYbE+s3Ht/BS
 ZpQxbAlG3a2Q6BXdz03VLJbB2BAE4WHiC0ArV3yEpnSEla0c1RJ8q72c1z9KjXtBDvuA
 r5eCbX117hzvliriCVcObFn6wp63MG/Om9IFx0pHFFyRetN5uD76XxvKlFE9BmmzVAs3
 XGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AQlxwrQ9+SAIJlBHFz/WVtqfuSsX8479gf+InmNYkZs=;
 b=7ACQDmZIh1uQxVULtY/cCJomSbJBr1YS6p3tMb5rDEVQdPuYmItPpcH7DRyg49XHYp
 W/pth7EovrsgKNLvoOXGE8Z0Z2sgAODMLiJA1g4BnCa2Nkm+pBhI8rwpT4FMcmjvzsuo
 FF0eXVApHTPVwVmS2HczXOxa7xml2dAwtKBmW7H6WyNVsIG3rj0KwUK2yksQD2btNkWL
 xgno/7DZ7R/KvPJuEarD8diQwjh5vQTStp9H00oN6nGfHrJZS9TTOEnxvIpsDBztR7eG
 AItSgdJ29zMepIq4JijBokGVIMGCpXsvcRbkJokL8EzMpB2KLj2wCusCmK4rs3oS7UVk
 Bhfg==
X-Gm-Message-State: ACrzQf2rk2K8ZoNA+LDvHFpqRNPOtgcpA3KHqvDAoW4SCplz+NkehKpf
 M62WQQjVx4+eMjSgmqiJXA1Ey3a3XvZXTQpT4ubIpQ==
X-Google-Smtp-Source: AMsMyM5u67xgoVRbvAl2jo49umhno4Yx8nKrhd8saRcif/bR8rpMZwMhWdL1nVFsqasbfxpjnO2MfcuNIfWTUazhbyA=
X-Received: by 2002:a05:6512:a93:b0:4a2:a5b3:fbb4 with SMTP id
 m19-20020a0565120a9300b004a2a5b3fbb4mr17313440lfu.346.1667833039925; Mon, 07
 Nov 2022 06:57:19 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 7 Nov 2022 14:57:19 +0000
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v3-0-a803f2660127@baylibre.com>
 <20220919-v3-6-a803f2660127@baylibre.com>
 <a3472c42-ccac-7c98-a0b6-57556a348ac1@collabora.com>
In-Reply-To: <a3472c42-ccac-7c98-a0b6-57556a348ac1@collabora.com>
MIME-Version: 1.0
Date: Mon, 7 Nov 2022 14:57:19 +0000
Message-ID: <CABnWg9uPL0qCat4Sw2uqj6-KN-OxPqGOjw+SR1bBVvGrmCBTZQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/12] drm/mediatek: hdmi: add frame_colorimetry flag
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Vinod Koul <vkoul@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
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
 dri-devel@lists.freedesktop.org, mac.shen@mediatek.com,
 stuart.lee@mediatek.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 07 Nov 2022 12:09, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>Il 04/11/22 15:09, Guillaume Ranquet ha scritto:
>> Add a flag to indicate support for frame colorimetry.
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 11 +++++++++++
>>   drivers/gpu/drm/mediatek/mtk_hdmi_common.h |  1 +
>>   2 files changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> index 3635ca66817b..933c51b5f6d7 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> @@ -120,6 +120,17 @@ int mtk_hdmi_setup_avi_infoframe(struct mtk_hdmi *hdmi, u8 *buffer, size_t bufsz
>>   		return err;
>>   	}
>>
>> +	if (hdmi->conf->has_frame_colorimetry) {
>> +		frame.colorimetry = hdmi->colorimtery;
>
>Typo: s/colorimtery/colorimetry/g
>
>...also, I don't see this being really used? In hdmi-v2 you're setting this param
>to HDMI_COLORIMETRY_NONE and quantization ranges to always the same default value.
>
>I wonder if this is really needed at this point.
>
>Regards,
>Angelo

I'll see if I can make something work without this boolean.

Thx,
Guillaume.
