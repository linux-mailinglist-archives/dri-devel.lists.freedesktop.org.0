Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B34675AF0F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 15:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8090210E157;
	Thu, 20 Jul 2023 13:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F93510E157
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 13:03:04 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4faaaa476a9so1211576e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 06:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689858182; x=1690462982; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rUTFNNzxpz9uwH1NN747Wn6G7mosnJMsS5OABZdxOY0=;
 b=mYbSu1BjEcQ0to09bRKOeden10c8fmf60Z14TNO5q4AxtKBMUgSXli7MvsscGdm9Iu
 QKnaueckfNnGNRBSEw/YLQX1zgzGec0p4FGihilxzeujQFIKv7oOu/Im1mebBhjUoaOv
 X8N9PvNSLEn6TtBwtgKOQLw8HHIADQg8SXCZCgMVBCBLAXhfzV73vZIX+43mss3TBzyL
 EbK99wcmYDmGoXjyZciyMv7P4W/SRIIcOTsu9laugpFvErRohtA6H7JMSgAQ9VGWlqh3
 nFm9Y4G2KtqFOUCkutoQfAPyOZzutkuozCLOG4BbtBo/LZdiRFHJSVgLs/wVyTMMfLLs
 5Byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689858182; x=1690462982;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rUTFNNzxpz9uwH1NN747Wn6G7mosnJMsS5OABZdxOY0=;
 b=kQpRw/YLFYfvbgrZ0h82XvQQGDV0iRCbJ5hHDbSLTM/TO2dQ64Gx+M/+7OkI4gIanj
 yBzTAsWA3XnRV9avfejXDANhKW7OdYokuIRBLiXT63w4VKgmYqx+goNIhCi2QX+D2ID5
 Z8tEK9+6WnhWbbVFVRX9xRdQtMFeaFULE547s+ZKBKSkzmX7F2iAHmxZNFve5U0mXNdV
 SfjBcJkoSwMTRpbKhAnI36+FTkakOwVzqSLIGvJ6iIeUZ1lxCUBOBp3w4Rf8ZnKDSAXr
 Tu74Y4HyVslTWbNAhIRJz6dbIPiPg7Nk2x4rKAiTjDBSHC42qSrz9yGtEwdzHLCBjBSX
 lGYA==
X-Gm-Message-State: ABy/qLbplkCaaEUTjM8euycprBEeSM+v/K3f97oVG9Y/+jleXO1EUcQe
 U7N4RSZLgX2EqW9UwOuhOs2keg==
X-Google-Smtp-Source: APBJJlFkZFwqh4iAS4OEASUge9kO88VgdxXGm+cXnF0tKyKqeN44zff9Ug6bPKAeL6TZe9IEhiyqtw==
X-Received: by 2002:ac2:5b85:0:b0:4f8:770f:1b01 with SMTP id
 o5-20020ac25b85000000b004f8770f1b01mr1499575lfn.19.1689858182181; 
 Thu, 20 Jul 2023 06:03:02 -0700 (PDT)
Received: from [10.1.3.131]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 s2-20020aa7c542000000b0051a2d2f82fdsm745547edr.6.2023.07.20.06.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jul 2023 06:03:01 -0700 (PDT)
Message-ID: <7822b114-0ccd-0344-cea0-760b892c85e1@baylibre.com>
Date: Thu, 20 Jul 2023 15:03:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 06/11] drm/mediatek: dp: Enable event interrupt only
 when bridge attached
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
 <20230717141438.274419-7-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230717141438.274419-7-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: nfraprado@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17/07/2023 16:14, AngeloGioacchino Del Regno wrote:
> It is useless and error-prone to enable the DisplayPort event interrupt
> before finishing to probe and install the driver, as the DP training
> cannot happen before the entire pipeline is correctly set up, as the
> interrupt handler also requires the full hardware to be initialized by
> mtk_dp_bridge_attach().
> 
> Anyway, depending in which state the controller is left from the
> bootloader, this may cause an interrupt storm and consequently hang
> the kernel during boot, so, avoid enabling the interrupt until we
> reach a clean state by adding the IRQ_NOAUTOEN flag before requesting
> it at probe time and manage the enablement of the ISR in the .attach()
> and .detach() handlers for the DP bridge.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre
