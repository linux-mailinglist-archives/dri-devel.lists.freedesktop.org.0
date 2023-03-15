Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A246BBAA1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 18:12:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C156110E054;
	Wed, 15 Mar 2023 17:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBB310E054
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 17:12:34 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id q16so17985393wrw.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 10:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678900353;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=FzaHht7C/yaf/hnRAYzcOCnlpLTocgudm9vAayanTsY=;
 b=wmQ+cp4gPZXYCM5yoB7sWyCUlpyvPM4e1IGgMSdoQXYN5oG0LqwzsBqfaH/GSGvcAb
 ES9vL5J87JwjUTPpo6eFWBzlWHNOon+BpDIyQD798y1tY8GPdTLRqaDqxOX2ntuFx1rG
 EZLtrGV5tD3W7hs5I43pmZxx0he0nSLnr/E5y4AuDNLRYy0PYpCqgDZueJGhk4wQdUMz
 OiHKRFGGmDDn6GHDkk3QbMKj0GeH76Y4sDJhJsuPGZu3qsFDJyuP2Obh0NRtgwNVcmLU
 AK87OI4qtUD81bELg8C9Pr4+Nv/+c4cy7uMy1MbXr4lN45c6QEM+HkY2VqxBoijXvSS8
 TeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678900353;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FzaHht7C/yaf/hnRAYzcOCnlpLTocgudm9vAayanTsY=;
 b=oWdrkthXITEoAtZvprGkvsjc4NZz0bOeZDNK6vmGNIx1wrhlQojb1z03fuYrW1EId8
 BklHeKd5NbIb5CSm6Hcoy0OTn19ByvW2ucJhC5U4CNFRQPktqwmMMdoXoUOmIDihoCXy
 lYBHa7jJ65aMELEdkup4WZeRt73rwu80+m8Y72dZb0FnHoALmJZQ+5f94XY1ILITXpCw
 NSk2rOPoF0BhALWZHRy5BuVZpq41/ZisUAzPrWvrkSlBQQcQPruk123CmnVTPUPQ9bpM
 +mZIXXBROvbj17SiAPg1jgvIkd5folStlyG3zE/HmH5dTJyQ7/BcfpADsOkAmnN3KBg/
 rOjA==
X-Gm-Message-State: AO0yUKVxn3uFCBfHsw4XrO4AJQdmmaYixPnlnuzTmYpt7howFYiSY7ml
 kWzedgiQoLcDjhyiHxLR+rzKUw==
X-Google-Smtp-Source: AK7set9i2/U3sGBpJsJyNrtAlPwSV8R/C0OdwZ8ZO0Qx5Hq/aD8kDRHCucxcOyP9OoigE3Bk2lLbkw==
X-Received: by 2002:adf:dfd0:0:b0:2ce:a703:1937 with SMTP id
 q16-20020adfdfd0000000b002cea7031937mr2521046wrn.50.1678900353430; 
 Wed, 15 Mar 2023 10:12:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5d2d:8427:397b:8fe7?
 ([2a01:e0a:982:cbb0:5d2d:8427:397b:8fe7])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a0560001a4400b002be5bdbe40csm5119855wry.27.2023.03.15.10.12.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 10:12:32 -0700 (PDT)
Message-ID: <39fccf61-2e48-abcf-9fd9-7bcc6ea32774@linaro.org>
Date: Wed, 15 Mar 2023 18:12:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 21/21] panel: startek-kd070fhfid015: add support of this
 display
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-21-45cbc68e188b@baylibre.com>
 <4b4d4749-c5ea-3a02-190e-3db703623977@linaro.org>
 <CAFGrd9pQJWYpdruUvbZNcQRZk5viyOAUCDpJcu5anA13E26Unw@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAFGrd9pQJWYpdruUvbZNcQRZk5viyOAUCDpJcu5anA13E26Unw@mail.gmail.com>
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
Reply-To: neil.armstrong@linaro.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-pwm@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, Xinlei Lee <xinlei.lee@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 15/03/2023 16:59, Alexandre Mergnat wrote:
> Hi Neil,
> 
> Le jeu. 9 mars 2023 à 15:51, Neil Armstrong
> <neil.armstrong@linaro.org> a écrit :
>>> +
>>> +#include <drm/drm_crtc.h>
>>
>> Is this include needed ?
> 
> Seems not, I remove it.
> 
>>> +     struct gpio_desc *enable_gpio;
>>> +     struct gpio_desc *reset_gpio;
>>> +     struct gpio_desc *dcdc_en_gpio;
>>
>> Isn't this "DCDC" a regulator ???
> 
> According to the panel datasheet, this is an input signal needed
> passing through TFT connector (PIN30):
> "Power IC supply enable, High active"

Ack, perhaps the name isn't the right one, or specify something like panel-dcdc.

> 
>>> +     /* Interface setting, video mode */
>>> +     ret = mipi_dsi_generic_write(dsi,
>>> +                     (u8[]){DSI_REG_IS, 0x14, 0x08, 0x00, 0x22, 0x00}, 6);
>>> +     if (ret < 0) {
>>> +             dev_err(dev, "failed to set display interface setting: %d\n",
>>> +                     ret);
>>> +             return ret;
>>> +     }
>>
>> Use mipi_dsi_generic_write_seq(dsi, DSI_REG_IS, 0x14, 0x08, 0x00, 0x22, 0x00); instead,
>> it's simpler and doesn't need explicit return check.
> 
> "mipi_dsi_generic_write_seq" doesn't exist but I will add it below
> "mipi_dsi_dcs_write_seq" in drm_mipi_dsi.h

It is now https://github.com/torvalds/linux/blob/master/include/drm/drm_mipi_dsi.h#L302 since a9015ce59320

> I must keep the return check to jump out of "stk_panel_init" if
> something goes wrong, but I can drop the error print.

The mipi_dsi_generic_write_seq & mipi_dsi_dcs_write_seq macros does the return check for free.

> 
>>> +static int stk_panel_enable(struct drm_panel *panel)
>>> +{
>>> +     struct stk_panel *stk = to_stk_panel(panel);
>>> +
>>> +     if (stk->enabled)
>>> +             return 0;
>>> +
>>> +     backlight_enable(stk->backlight);
>>> +
>>> +     stk->enabled = true;
>>> +
>>> +     return 0;
>>> +}
>>
>> Is this really needed ? the backlight core will enable it automatically.
> 
> Ok, it's managed by drm_panel.c driver.
> Then I can also remove stuff from stk_panel_disable.
> 
> 
> Regards,
> Alex

