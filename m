Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0D35EC389
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 15:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F4E10E32F;
	Tue, 27 Sep 2022 13:04:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B12E10E92B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 13:04:13 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 s14-20020a17090a6e4e00b0020057c70943so15506909pjm.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 06:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:from:to:cc:subject:date;
 bh=5A9tE5XjShKgk0dp4mGM6QaE+oB3gw3GtO9g42ZRvK8=;
 b=K6t+GiDMxCE5PqXx9M7wnOxrmVe8RhMGvnDnBYG8NOKa2YssCusIkZAF4W4yvOQESA
 grgJhoRBvxxax0+eCuPKh8p2W5rWUX6HXDrfWlnt3QOGcvz2Z0pKWEx5bc2keTzCKDPA
 EFNonbeyTfJxCD6F40ovXsaSvZaA6ciUzimvjumUgzudbGcVF+jQjdL0HxEI5YO8kDxR
 uaL+FNOyGJVlqjEpMvpc2MXt9w63j7o81b3Y3ky55r6MbLY0d+jh1dOdyFrtP5/68Jsh
 ZON8Od6QdsueW9v6KQ7nfWtM/RdVCng56yDGIVeLLVpq3zbI72tvF/vuGVGpBIBmWRps
 bqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:x-gm-message-state:from:to:cc:subject:date;
 bh=5A9tE5XjShKgk0dp4mGM6QaE+oB3gw3GtO9g42ZRvK8=;
 b=YQrUCVTNXd8llronOJ/Bi6FKTNIezcmedPJ80FPNmqbiqPpTRCWjOLd4tEYI//6gNZ
 KWe9O3QdevujGShb6ogt7O6MvGD2hU4AFVUmyLPQ1gTyh38luwp7ZcJUWmk0cZTTec9m
 lQnMJVxTZw8v9Zm71Dn9/0m1aSvol6dAhSTZzNt4hD6uvo80jGl49ehYoMiOOUGlKatu
 IeCsoshaeDpU04Nl+vzHi6knH17stKAnXGW2wTwvET1FWuWF25/RliBDHtZDkjqAM8mm
 wKpvOLZNYI2gL2B0nioxsSomyH4YzavnwNKeZbx+BLAPPfaRkLSOLUO9nKR/tvDB+bpc
 pN/A==
X-Gm-Message-State: ACrzQf32qFWl6g+veNYHNf6bXoGXNcK6RhRYPsxg3aDU0X6bVEde54O6
 XoQpT7uSJpHgUZ5SgiwkqXwyuyBdrgSFNamZ5kuvNw==
X-Google-Smtp-Source: AMsMyM5gawCoKKBTAHhXh48htU73+kqaFhoDJNb7qglhir+j3HxUZ0tCej0iXrKwzR9+MRTcHiP7gPgmwpcjXrYibm8=
X-Received: by 2002:a17:90b:33c9:b0:200:a0ca:e6c8 with SMTP id
 lk9-20020a17090b33c900b00200a0cae6c8mr4481943pjb.147.1664283852916; Tue, 27
 Sep 2022 06:04:12 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Sep 2022 06:04:12 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-17-4844816c9808@baylibre.com>
 <a0a3c427-c851-ae5d-4010-e94740bf9f6e@linaro.org>
In-Reply-To: <a0a3c427-c851-ae5d-4010-e94740bf9f6e@linaro.org>
MIME-Version: 1.0
Date: Tue, 27 Sep 2022 06:04:11 -0700
Message-ID: <CABnWg9s3N_Ua9g0S3x0uj8PN4FtOX6DO+zQcBzGFqoLTL1J24A@mail.gmail.com>
Subject: Re: [PATCH v1 17/17] drm/mediatek: Add mt8195-dpi support to drm_drv
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

On Thu, 22 Sep 2022 09:20, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>On 19/09/2022 18:56, Guillaume Ranquet wrote:
>> Add dpi support to enable the HDMI path.
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> index 72049a530ae1..27f029ca760b 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> @@ -820,6 +820,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>>  	  .data = (void *)MTK_DPI },
>>  	{ .compatible = "mediatek,mt8192-dpi",
>>  	  .data = (void *)MTK_DPI },
>> +	{ .compatible = "mediatek,mt8195-dpi",
>> +	  .data = (void *)MTK_DPI },
>
>It's compatible with the others. You don't need more compatibles.

Hi Krzysztof,

It's a bit confusing, because this compatible is used in both
mtk_drm_drv.c and in mtk_dpi.c

Albeit it's entirely the same thing regarding the mtk_drm_drv module,
it's pretty different
regarding the mtk_dpi module.

Thx,
Guillaume.
>
>Best regards,
>Krzysztof
>
