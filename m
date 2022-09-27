Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C4F5EC48F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 15:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977B489B66;
	Tue, 27 Sep 2022 13:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8CA89B66
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 13:34:35 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id 129so7999391pgc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 06:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:from:to:cc:subject:date;
 bh=5KO5UAD2T7DgoYPQgFD91UfqIRE232yyISaSFCJ9s3Q=;
 b=SoU+eGuksQQhlnS7N57Z73aJoRcn1Yf2NhRhsCodkYOiV7LO9opJ5E2VCYREe5jIix
 Oek/U1yUHENSgLff5LPnC8g96rDkpkyHkyN8K4ng0t6VFbZFhaiBdfyEbni+0RGn8Bvq
 Xr0f0Eoqt6tUwJZdRxqQtkBIbO01YSyEzs/YfPOplLElabdw79du1/QP496W/K521tAO
 KKfJLi1VzArX+CrDYSiZD5o0f3yZ/lI0HMD3tk0S9NVt07KumdMGtpOn2kdj3DfJ9Blo
 P1h+q5XNmMceyQpXed0kBCLxxC8hoyH9lz/GILiJzcJK3VEBQWlBG8Gm4O571ponUsdt
 IIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:x-gm-message-state:from:to:cc:subject:date;
 bh=5KO5UAD2T7DgoYPQgFD91UfqIRE232yyISaSFCJ9s3Q=;
 b=yIZtPIRZum9Mqj/x/wYRZtVvybBqCx7/Je6rBqy5WIvZtpYZtjleZCLgY8d0VGuAfr
 FC919Yc7DG1uLDzkwnE3LDc+CFu93DGur7QcRVzwhdrnWf1EOnUxs6PIF/2fwIVPSVRf
 vITxVV9mIBlylh7727Aq2QAXNN1SKcfx0jJ0jX9OGwlqJfBVQc6ILNm8o99tVHKD53dF
 qCzbtny4p8sSBgz8bZrLfPWNzShjML3pn6iq0r4QoIqyH1XJbMMyE6xL+R4oYBVXWFlj
 hR3chN2c/7j6v0z6b45DlydIbM+cO5fymSM+SSTR/1eMW6RNjPrA1wFVEFZJPMj5NmBJ
 rUbg==
X-Gm-Message-State: ACrzQf2uN5/zlXetbbfLxAuSIAi6Ocv4Eh3IjOsqxCFp/pfTLP8RcMYe
 91yhMHFYpMBxJfhPYo4cjHgL/HzJg9rz2sdqVvPFxQ==
X-Google-Smtp-Source: AMsMyM4YIhFYJqfTMqQFxzcbSAJDenFpMeYijY6ikC/aRvNNUlM8pp9LqLPwxTZew8CdZonFZQtK3Mf4GpGS1w183Kg=
X-Received: by 2002:a63:b55d:0:b0:439:7a97:b89 with SMTP id
 u29-20020a63b55d000000b004397a970b89mr24899166pgo.70.1664285675305; Tue, 27
 Sep 2022 06:34:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Sep 2022 06:34:34 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-16-4844816c9808@baylibre.com>
 <812a5de2-dbe3-2f0d-492c-16ea004c996a@collabora.com>
In-Reply-To: <812a5de2-dbe3-2f0d-492c-16ea004c996a@collabora.com>
MIME-Version: 1.0
Date: Tue, 27 Sep 2022 06:34:34 -0700
Message-ID: <CABnWg9sSbtXYLpcCoEts73CAsciKMEeMMRwfcfGng8H-rGYvkA@mail.gmail.com>
Subject: Re: [PATCH v1 16/17] drm/mediatek: dpi: Add mt8195 hdmi to DPI driver
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

On Tue, 20 Sep 2022 14:22, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>Il 19/09/22 18:56, Guillaume Ranquet ha scritto:
>> Add the DPI1 hdmi path support in mtk dpi driver
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> index 630a4e301ef6..91212b7610e8 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> @@ -15,7 +15,10 @@
>>   #include <linux/of_graph.h>
>>   #include <linux/pinctrl/consumer.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/reset.h>
>>   #include <linux/types.h>
>> +#include <linux/regmap.h>
>> +#include <linux/mfd/syscon.h>
>>
>>   #include <video/videomode.h>
>>
>> @@ -66,10 +69,14 @@ struct mtk_dpi {
>>   	struct drm_bridge *next_bridge;
>>   	struct drm_connector *connector;
>>   	void __iomem *regs;
>> +	struct reset_control *reset_ctl;
>>   	struct device *dev;
>>   	struct clk *engine_clk;
>> +	struct clk *dpi_ck_cg;
>>   	struct clk *pixel_clk;
>> +	struct clk *dpi_sel_clk;
>>   	struct clk *tvd_clk;
>> +	struct clk *hdmi_cg;
>
>
>You're adding new clocks and then you're making *all clocks*, including the
>already existing ones... optional.
>
>That looks seriously odd.... can you please give a devicetree example for
>MT8195 in the next version, perhaps in the cover letter?
>
>Would also make it easier to test this entire big series.
>
>Regards,
>Angelo
>

The clock names are different for MT8195 HDMI than for the legacy DP.
Making everything optional might not have been a smart move.
I'll try to think of something else to make it look less odd.

The device tree I'm using to test things is rather "hackish" and has a bunch of
changes from what is found on linux-next.
I think Jason and Nancy are due to upstream those patches.

I'll try to include something minimal for you to test.
Otherwise would a public branch containing everything work for you?

Thx,
Guillaume.
