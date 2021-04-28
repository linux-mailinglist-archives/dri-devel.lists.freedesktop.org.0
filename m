Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B60736D4B3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 11:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC956E0B8;
	Wed, 28 Apr 2021 09:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E392A6E0B8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 09:24:42 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id k14so12339212wrv.5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 02:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ioKc11cv6S9u6nIGsfPbRiUgMeG8dW3WT7nmB1E6/9g=;
 b=xfop1ovXGGjq4I5xj1uCfmxCQBRvFUkhajnt/vb9FNQnYofXWBIvNSubsAc6ZfNvuc
 ki48WdsjRI8BhjO506aSVPg6SlFXtmCqCtD//sXarsxZsfpmhFDx50LFIDGx7lqUEiFN
 jqB7xhq16nzbOdymcNbhkCKosQhDxbysxVpxgby+PXIbFYJiRcs5l2aJkxw5+l8P4SIb
 gGgu5W+h/UwLY0+0i0egpBb52UNMsGDcvEUPj5nTVYoJU397eETkNLqe4QFPoXTCjL3d
 DrUEaTMFcyfh70I61L8DwrQSzZxCXXz2C8MEBnWU1vMWa3WyhEhBaMqu0Y+f+Dby4RZn
 t/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ioKc11cv6S9u6nIGsfPbRiUgMeG8dW3WT7nmB1E6/9g=;
 b=sdo2eVaGIbs1NxZknzwaSeuo5UO+LH+g48Qp26WYxOFFrFqUIeMsjaNwDASlJWC6sQ
 rBuy3NiqGvlCVgRSyl+Oa/YnRhHSOgYay4Rt+U5BGg/usO1imW3OBNpENZ7kKQ2aLC1g
 LBVcWKXPc32z0h+lTiduxsRAg3eFC3Z9MBd3TeWqqpwVWmqigrnVHLysRFDYWcFM6Dwt
 LiB5op3wF2TV1xfrEB6hH8yhm+LTTjMSbCl9vb2t5FhnmMk+8nbrMh6JtR0Gj32rfaXy
 i84+m3gxuReKGdY7C/2mSCXrI+wkZE/OgC8mmAfcfRvRRWsh4exMXuMPsJYtpuKRvedw
 7FNQ==
X-Gm-Message-State: AOAM533+LlTRuTrR3ZdGriw66zURoPwo+c6UYxGqv72djM29ybSEjqUa
 xCuTImaTi4bWx+OjHcV6lL8+EQ==
X-Google-Smtp-Source: ABdhPJyPjyaXmfkvvP3C/7CgWotmCL1AMjqW543OEFaYjVyP5KDzPgY3yIHO6TVQL7MafzeqIxPGNA==
X-Received: by 2002:adf:e906:: with SMTP id f6mr6626568wrm.200.1619601881506; 
 Wed, 28 Apr 2021 02:24:41 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:f4c4:ea1c:86bd:7a2b?
 ([2a01:e0a:90c:e290:f4c4:ea1c:86bd:7a2b])
 by smtp.gmail.com with ESMTPSA id f6sm7121306wrt.19.2021.04.28.02.24.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 02:24:40 -0700 (PDT)
Subject: Re: [PATCH V2 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
To: Loic Poulain <loic.poulain@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>
References: <20210421223122.112736-1-marex@denx.de>
 <20210421223122.112736-2-marex@denx.de>
 <f3b55e0b-20d2-0add-e097-e03a675a1169@kontron.de>
 <66386909-5b89-78ab-6fcc-5bef95a66035@kontron.de>
 <CAMZdPi8kuru4+tQ3Oz-rv+D5F--8LHWa+ppJ_ywH7MWz+auKYA@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <f4ad222e-3468-3bfd-8a37-45cef5ee5b47@baylibre.com>
Date: Wed, 28 Apr 2021 11:24:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAMZdPi8kuru4+tQ3Oz-rv+D5F--8LHWa+ppJ_ywH7MWz+auKYA@mail.gmail.com>
Content-Language: en-US
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
Cc: Marek Vasut <marex@denx.de>, ch@denx.de,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/04/2021 11:26, Loic Poulain wrote:
> On Wed, 28 Apr 2021 at 10:13, Frieder Schrempf
> <frieder.schrempf@kontron.de> wrote:
>>
>> On 28.04.21 09:51, Frieder Schrempf wrote:
>>> On 22.04.21 00:31, Marek Vasut wrote:
>>>> Add driver for TI SN65DSI83 Single-link DSI to Single-link LVDS bridge
>>>> and TI SN65DSI84 Single-link DSI to Dual-link or 2x Single-link LVDS
>>>> bridge. TI SN65DSI85 is unsupported due to lack of hardware to test on,
>>>> but easy to add.
>>>>
>>>> The driver operates the chip via I2C bus. Currently the LVDS clock are
>>>> always derived from DSI clock lane, which is the usual mode of operation.
>>>> Support for clock from external oscillator is not implemented, but it is
>>>> easy to add if ever needed. Only RGB888 pixel format is implemented, the
>>>> LVDS666 is not supported, but could be added if needed.
>>>>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>> Cc: Douglas Anderson <dianders@chromium.org>
>>>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>>>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>>> Cc: Philippe Schenker <philippe.schenker@toradex.com>
>>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>>> Cc: Stephen Boyd <swboyd@chromium.org>
>>>> Cc: Valentin Raevsky <valentin@compulab.co.il>
>>>> To: dri-devel@lists.freedesktop.org
>>>> Tested-by: Loic Poulain <loic.poulain@linaro.org>
>>>> ---
>>>> V2: - Use dev_err_probe()
>>>>      - Set REG_RC_RESET as volatile
>>>>      - Wait for PLL stabilization by polling REG_RC_LVDS_PLL
>>>>      - Use ctx->mode = *adj instead of *mode in sn65dsi83_mode_set
>>>>      - Add tested DSI84 support in dual-link mode
>>>>      - Correctly set VCOM
>>>>      - Fill in missing DSI CHB and LVDS CHB bits from DSI84 and DSI85
>>>>        datasheets, with that all the reserved bits make far more sense
>>>>        as the DSI83 and DSI84 seems to be reduced version of DSI85
>>>> ---
>>>>   drivers/gpu/drm/bridge/Kconfig        |  10 +
>>>>   drivers/gpu/drm/bridge/Makefile       |   1 +
>>>>   drivers/gpu/drm/bridge/ti-sn65dsi83.c | 617 ++++++++++++++++++++++++++
>>>>   3 files changed, 628 insertions(+)
>>>>   create mode 100644 drivers/gpu/drm/bridge/ti-sn65dsi83.c
>>>>
>>> [...]
>>>> +static int sn65dsi83_probe(struct i2c_client *client,
>>>> +               const struct i2c_device_id *id)
>>>> +{
>>>> +    struct device *dev = &client->dev;
>>>> +    enum sn65dsi83_model model;
>>>> +    struct sn65dsi83 *ctx;
>>>> +    int ret;
>>>> +
>>>> +    ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>>>> +    if (!ctx)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    ctx->dev = dev;
>>>> +
>>>> +    if (dev->of_node)
>>>> +        model = (enum sn65dsi83_model)of_device_get_match_data(dev);
>>>> +    else
>>>> +        model = id->driver_data;
>>>> +
>>>> +    /* Default to dual-link LVDS on all but DSI83. */
>>>> +    if (model != MODEL_SN65DSI83)
>>>> +        ctx->lvds_dual_link = true;
>>>
>>> What if I use the DSI84 with a single link LVDS? I can't see any way to
>>> configure that right now.
> 
> I assume the simplest way would be to use the "ti,sn65dsi83"
> compatible string in your dts, since the way you wired it is
> 'compatible' with sn65dsi83, right?

No this isn't the right way to to, if sn65dsi84 is supported and the bindings only support single lvds link,
the driver must only support single link on sn65dsi84, or add the dual link lvds in the bindings only for sn65dsi84.

> 
>>
>> I just saw the note in the header of the driver that says that single
>> link mode is unsupported for the DSI84.
>>
>> I have hardware with a single link display and if I set
>> ctx->lvds_dual_link = false it works just fine.
>>
>> How is this supposed to be selected? Does it need an extra devicetree
>> property? And would you mind adding single-link support in the next
>> version or do you prefer adding it in a follow-up patch?
> 
> If this has to be supported I think the proper way would be to support
> two output ports in the dts (e.g. lvds0_out, lvds1_out), in the same
> way as supported by the 'advantech,idk-2121wr' panel.

Yes, this is why I asked to have the dual-link lvds in the bindings.

Neil

> 
> Regards,
> Loic
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
