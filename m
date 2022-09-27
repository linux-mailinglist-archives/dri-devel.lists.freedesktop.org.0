Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7085EC4A5
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 15:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C2310E32B;
	Tue, 27 Sep 2022 13:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75B610E32B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 13:38:45 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 h8-20020a17090a054800b00205ccbae31eso3057934pjf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 06:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:from:to:cc:subject:date;
 bh=kcqezBbHJffozFbEyx9wjhl1YSdIHaVumsP0lVEuZtQ=;
 b=zu0LDMWaZ2IiyJWen0shu8EVhyMeZSD0OIiKtU1o5V962A7jwSkPn4CMMQ0vz96Vth
 tmuzCaRlrru7doTeuXHFqIBlelgapdbTo80FoYEtNoYoaEZL+RORowAW5TQG758voXAB
 /qK4nyJaMel2BpXPOS+vQr8yEpETmpuh9xmFJL3bbdiLCPx3mFskJioDlySfvlYLDiz+
 5l4LD9rzPtofDwJzV7W1kwC3nRoiXAq20n8O9pp9eXpfcWtVB3QDe/+q+6K/KnMeAnfw
 i0uPy9j1+kZk4vpNwuHSzu0wEoCWjqtwlybaZfNOtus5P9tVWa7xP7C9GRMIprbloz4T
 aSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:x-gm-message-state:from:to:cc:subject:date;
 bh=kcqezBbHJffozFbEyx9wjhl1YSdIHaVumsP0lVEuZtQ=;
 b=JGmTcdHY3xc9xlcp/xrUZuiOtNDv6pOz5QZ/jJlzeH892X8B5ysv+pnqynY6pIYiZM
 6Yf6u8bczBekP9ir7JH7vYFXsKCRXkajMGaENegC7xH2ppAx21eeirHVmyJwp3nM9Dcu
 P7IAArn6r7MlhGJZQG0dB7aMP0o64KITi6bJw1w9i4OQoWczSohVmsb7KPGyVRWxBE5G
 YCFZhTsGvvLldgDAr0GyQRT7hvm/Z07Oh8URarRun37VCNNVlgAmWwz0d8TvwWZtDucI
 G7v36NNisr/BqDMbQ/u8X8jAdV3EJA5xM3tOdtQ2xTqtrLF2CRuAGnaeutI6+4XbFR+8
 Pi+Q==
X-Gm-Message-State: ACrzQf026yTtU3oc4EROXise/3bELDEOKH24XhjVvb4Znw+ezwnUyCqT
 iFqN6g5mj1J4XDpz6DfPfxK2opw+DR52G6W9cIZNsw==
X-Google-Smtp-Source: AMsMyM5rGXrkhuQrQe7LgcjEDdTHK+6y7t6lOaHNCTQ9hNJXjzQRFavvC9zWHs1/i1ytYfodZBY430bKtOUYXAKndGU=
X-Received: by 2002:a17:90b:2643:b0:205:bd0d:bdff with SMTP id
 pa3-20020a17090b264300b00205bd0dbdffmr4550660pjb.99.1664285925438; Tue, 27
 Sep 2022 06:38:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Sep 2022 06:38:44 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-16-4844816c9808@baylibre.com>
 <11592bcd-eec7-7cc0-86c6-8f440b6af447@linaro.org>
In-Reply-To: <11592bcd-eec7-7cc0-86c6-8f440b6af447@linaro.org>
MIME-Version: 1.0
Date: Tue, 27 Sep 2022 06:38:44 -0700
Message-ID: <CABnWg9twi6inBOeLY=BOQ+o_CwbSW=L49_A+9VMy0L6vbokhXg@mail.gmail.com>
Subject: Re: [PATCH v1 16/17] drm/mediatek: dpi: Add mt8195 hdmi to DPI driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
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

On Thu, 22 Sep 2022 09:22, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>On 19/09/2022 18:56, Guillaume Ranquet wrote:
>> Add the DPI1 hdmi path support in mtk dpi driver
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> index 630a4e301ef6..91212b7610e8 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> @@ -15,7 +15,10 @@
>>  #include <linux/of_graph.h>
>>  #include <linux/pinctrl/consumer.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/reset.h>
>>  #include <linux/types.h>
>> +#include <linux/regmap.h>
>> +#include <linux/mfd/syscon.h>
>
>Why do you need these headers in this patch?
>
>Best regards,
>Krzysztof
>

reset is used for reset_control but regmap and syscon are not used.
Those are leftover from a previous iteration of the patch, will drop
these in V2.

Thx,
Guillaume.
