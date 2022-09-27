Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3EC5EC3E6
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 15:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CD210E335;
	Tue, 27 Sep 2022 13:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB26010E323
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 13:13:31 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id d24so9050410pls.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 06:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:from:to:cc:subject:date;
 bh=uw1gvMh/1zxeYeQnV6wZiimhJI0pYdqIU/T7gR133DU=;
 b=KGZxffdgEWrc+nIKZQdWmZ3shdGF0hcnG/eimwyIfxhrmALI1rYCYrjvI7h/XUgVGA
 AC6SvAtl53+/uRBU3anLk1UvpVRaNBemAR7Oyh2pHvX7bjmJNbSDXufs8hRYtyXsG5vQ
 jd3iWOu4rVRR/EnzQp9aaeBmal/AfKg+NmoFOYFIDeJe+wLcey51NCuMUbD1u2T1V94U
 R0nuad1PG+imVaMqobj/rIzM1PIjkWlf6o0msI+SnoIU3CpMuPKph0lfdyOcWwBg0vLZ
 dTGoMaNPB1H8WboG58vSq5A7eIOFKcqFwcw4AAp8tg8XHTSKsuUNf6zQOBzI1wa4MP6X
 qvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:x-gm-message-state:from:to:cc:subject:date;
 bh=uw1gvMh/1zxeYeQnV6wZiimhJI0pYdqIU/T7gR133DU=;
 b=yFbl3uvXWfdle3YoiQlFC/02uMmAZfECfqeK8LkR2G4/yu5VzV+Vn025IqLaNn92MG
 BGkC4v4P4HOD/XVjyXcEQWwAUo1m0RX1mjuIyzGCpj9tWlJCiVj6g4jR/fHs2ftquvOd
 x7cJzyjrUH9UuUY1YFR4aEDLfRxvJIP42EHuhsMbQfwbikpv0ND0BFmGhlaB1yZdl8Lp
 Hx9pFaDpYlBKv8bvSDmqmTH6qgN8wJ1NJbwYIA1VFqZLF0qoyxPNfqfQjZgJAyCjew7l
 SqKB39hhsv6uYGHXJj4h2vY1GXfiptM6iRczI2JJEQLK0Wm264j3Dh3Xp3mtaHO1XKjG
 aFdA==
X-Gm-Message-State: ACrzQf31U0Y3BxOcRQ2CpHagCktayW2hwi24phHHHz6RL0Jrai45b6ma
 hSsZrJVOwuEfc0yN7Y16mORUjN53uPevKoLg31HYOw==
X-Google-Smtp-Source: AMsMyM5foO9hRFfJNeJsExDA4MlTDjL11pmea0BPzSUwTLsGAoVk8kBgQmDpzSWwATR1ZA70FE3cdWBnn6SlAjNkjO4=
X-Received: by 2002:a17:902:f710:b0:178:a692:b1f7 with SMTP id
 h16-20020a170902f71000b00178a692b1f7mr27434461plo.112.1664284411364; Tue, 27
 Sep 2022 06:13:31 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Sep 2022 06:13:30 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-12-4844816c9808@baylibre.com>
 <b05f8687-8f34-c425-ed8e-56c8aeccdaf9@collabora.com>
In-Reply-To: <b05f8687-8f34-c425-ed8e-56c8aeccdaf9@collabora.com>
MIME-Version: 1.0
Date: Tue, 27 Sep 2022 06:13:30 -0700
Message-ID: <CABnWg9tidG-HHhJ-nbE0UD2=EUCqF4WkdQ__j+2sarmSm=MsAQ@mail.gmail.com>
Subject: Re: [PATCH v1 12/17] drm/mediatek: hdmi: mt8195: add audio support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>
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
Cc: devicetree@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, Pablo Sun <pablo.sun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 20 Sep 2022 13:11, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>Il 19/09/22 18:56, Guillaume Ranquet ha scritto:
>> Add HDMI audio support for mt8195
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
>> index 39e07a6dd490..bb7593ea4c86 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
>> @@ -215,6 +215,26 @@ static void mtk_hdmi_hw_vid_black(struct mtk_hdmi *hdmi, bool black)
>>   		mtk_hdmi_mask(hdmi, TOP_VMUTE_CFG1, 0, REG_VMUTE_EN);
>>   }
>>
>> +static void mtk_hdmi_hw_aud_mute(struct mtk_hdmi *hdmi)
>> +{
>> +	u32 val;
>> +
>> +	val = mtk_hdmi_read(hdmi, AIP_CTRL, &val);
>> +
>
>val_tx = AUD_MUTE_FIFO_EN;
>if (val & DSD_EN)
>	val_tx |= DSD_MUTE_DATA;
>
>regmap_set_bits(regmap, AIP_TXCTRL, val_tx);
>
>Easier, shorter.

Thx for the tip.

>
>> +	if (val & DSD_EN)
>> +		mtk_hdmi_mask(hdmi, AIP_TXCTRL,
>> +			      DSD_MUTE_DATA | AUD_MUTE_FIFO_EN,
>> +			      DSD_MUTE_DATA | AUD_MUTE_FIFO_EN);
>> +	else
>> +		mtk_hdmi_mask(hdmi, AIP_TXCTRL, AUD_MUTE_FIFO_EN,
>> +			      AUD_MUTE_FIFO_EN);
>> +}
>
>Regards,
>Angelo
>
