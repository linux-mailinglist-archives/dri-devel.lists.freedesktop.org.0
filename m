Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D253A5EC3BB
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 15:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895BD10E31E;
	Tue, 27 Sep 2022 13:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8083D10E31E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 13:08:44 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id z20so2147956plb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 06:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:from:to:cc:subject:date;
 bh=YoaKPGbtL0W6yKop2Q5GqUbFMulbchm58vJX4E+Hvss=;
 b=Y3O5T8rz166uc6HJ4FhMI44NIUgz7yP8NiLJa38oQ3iQqcCvEf1JKUSMRRQjUmvMTd
 4ctpIh9zL2BGVRzkWihc/0+zJA0vvqQaNIcdLVBGBjlJgpCdtH9UA6CaIZ8fAsMB7Qa5
 MAmXOYJLBFGb76dyw/0GYl4Ud9bQLwonphTsObGEXWQEk9eA57oxtDSmPKQJHfic3A3j
 HkZqwW/hayyIYLR1Y0kHnLheguF50xHZLRtrPOgrjZtl0trmUGTA+HLEUWgduM2GBkWu
 ThZ/NjoYcg+Qh9SrbLP+UhAR4BHGL1ZL/OyBADAi8nYVZqFUBSIRwmAXmM7f9rMGutH+
 2GAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:x-gm-message-state:from:to:cc:subject:date;
 bh=YoaKPGbtL0W6yKop2Q5GqUbFMulbchm58vJX4E+Hvss=;
 b=e2pq6Dq++KYBMO1MfM86KRmJgl3fhNlpBRvcaWA+buTSa32M/Dfqsl/cLq7Sy41PmJ
 knELwtAABTdPGBt9fpydLdjxRjoY2ru0eRRZzlqEHgOja5sGavxkqlaIua5oiUX0EYM8
 Q+J5Y5T7ObGFUY3D5mgqk70ggebNoQ7uZ3tYE+WMub3JQKafrtbzePl8ykeeBxj0Peo2
 BZLXF7JE1Ecflj/qditeOsFluTgNvZonPYHGF0dZqMLIJT8ULNshBqkJhc7CdVnJE0TE
 Y8zaKLdTYtF01ozhzl0ldlXYHTrYmcPINibbHMM/7XIH0DGsDDA84LC32q111wsXy+ns
 SuaA==
X-Gm-Message-State: ACrzQf1AWxMj56ikR1Q4w+MtxzpFMnwpXtdNZJaDIsxqXDh5ZbB2gNP+
 bIwrWvf1MD3W5mRTpXdGea+yYIGgtZTG2e6RFd3ZIQ==
X-Google-Smtp-Source: AMsMyM6X8Fa6ezRZqL7m/lEJjF3Bh5CG2glAPpLeLqQI0M9YdLpt4yB4B9sD/oFbG2+k4WA70xAHEax+sQbaSKsrxhc=
X-Received: by 2002:a17:90b:3807:b0:205:d746:93a0 with SMTP id
 mq7-20020a17090b380700b00205d74693a0mr3635933pjb.188.1664284124030; Tue, 27
 Sep 2022 06:08:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Sep 2022 06:08:43 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-7-4844816c9808@baylibre.com>
 <153dcb4f-4583-427e-83c7-bdd33e3b11aa@collabora.com>
In-Reply-To: <153dcb4f-4583-427e-83c7-bdd33e3b11aa@collabora.com>
MIME-Version: 1.0
Date: Tue, 27 Sep 2022 06:08:43 -0700
Message-ID: <CABnWg9uDo_P7FKzL7zjsZbfrhjT7MtWinhy5pKvDbNp_R5oJPg@mail.gmail.com>
Subject: Re: [PATCH v1 07/17] drm/mediatek: extract common functions from the
 mtk hdmi driver
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

On Tue, 20 Sep 2022 12:25, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>Il 19/09/22 18:56, Guillaume Ranquet ha scritto:
>> Create a common "framework" that can be used to add support for
>> different hdmi IPs within the mediatek range of products.
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>
>> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
>> index d4d193f60271..008ec69da67b 100644
>> --- a/drivers/gpu/drm/mediatek/Makefile
>> +++ b/drivers/gpu/drm/mediatek/Makefile
>> @@ -22,7 +22,8 @@ obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
>>
>>   mediatek-drm-hdmi-objs := mtk_cec.o \
>>   			  mtk_hdmi.o \
>
>abcd ... mtk_hdmi_common.o goes here :-)
>
>> -			  mtk_hdmi_ddc.o
>> +			  mtk_hdmi_ddc.o \
>> +			  mtk_hdmi_common.o \
>>
>>   obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> index 5cd05d4fe1a9..837d36ec4d64 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> @@ -32,187 +32,18 @@
>>   #include <drm/drm_probe_helper.h>
>>
>>   #include "mtk_cec.h"
>> -#include "mtk_hdmi.h"
>>   #include "mtk_hdmi_regs.h"
>> +#include "mtk_hdmi_common.h"
>>
>>   #define NCTS_BYTES	7
>>
>> -enum mtk_hdmi_clk_id {
>> -	MTK_HDMI_CLK_HDMI_PIXEL,
>> -	MTK_HDMI_CLK_HDMI_PLL,
>> -	MTK_HDMI_CLK_AUD_BCLK,
>> -	MTK_HDMI_CLK_AUD_SPDIF,
>> -	MTK_HDMI_CLK_COUNT
>> +const char * const mtk_hdmi_clk_names_mt8183[MTK_MT8183_HDMI_CLK_COUNT] = {
>
>Why MT8183? This can be either MT8167 or MT2701... or, IMO more appropriately, you
>should name the IP version.
>Example: MTK_HDMIV123_CLK_COUNT (I don't know what IP version would that be!).

You're right, the naming isn't great.
I'll ask mediatek if they have a good name that would regroup the "legacy"
HDMI IP and the new IP in mt8195.

Thx,
Guillaume.

>
>> +	[MTK_MT8183_HDMI_CLK_HDMI_PIXEL] = "pixel",
>> +	[MTK_MT8183_HDMI_CLK_HDMI_PLL] = "pll",
>> +	[MTK_MT8183_HDMI_CLK_AUD_BCLK] = "bclk",
>> +	[MTK_MT8183_HDMI_CLK_AUD_SPDIF] = "spdif",
>>   };
>>
>
>Regards,
>Angelo
>
>
