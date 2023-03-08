Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E866B054C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 12:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBED10E665;
	Wed,  8 Mar 2023 11:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E1210E665
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 11:03:23 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id g18so16183544ljl.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 03:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678273401;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c0ktoYXDYataVjP7ajflebW7wQwIQSEUi8W+XgUX6Uc=;
 b=p0SeZU485J/5Xp6XJ61Iox9/Wcq0Bt5vZZL75ahJLr2WZIeXcG0slSR1NpFgB5zIrr
 TGtTyvlNjx0U5afGR6Z6p0bt3/opkY4hBK/2yoNNHQ/guwDkh5dXr+8rWcY8dfcUuXo/
 tku7mC0+i3SVA9ZlwO4TZ2ZKjlmSYjFOlxs0cOfW2t0Rgdz1+zCbDWBTLVsFa5c1znK2
 C2r+hJRu7g2AjLyLMXoHLW7U9zYmpZDI82kWN4TY0UtcvKbUKm+DOclB0W/Efbac60PX
 o6AerUWByY88lpr6sN9/8WRuTUAIo87YQTfDctYGwzfAY44tjodV7tSFNMc3lU40/m1m
 GRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678273401;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c0ktoYXDYataVjP7ajflebW7wQwIQSEUi8W+XgUX6Uc=;
 b=ppK0eO806RQyxqrEPfFRI9zQ838WPVxL8pO2oVzgiYp7B908nETWJMBuQPGzckgexK
 P5VbGXNnLgnay6u5cI0Rtn6p4ipSt2us+JeZ6h/GjQo6bgDTFPdXNOyF6Nfu6zC+PdY4
 RLnwGUO6xhoJV0JoKa7Jxk9Fylt0Hfu0swq8OCOzI5TQSJ231eM4X/YHeNUIGD7r+lIf
 g4PRKV/HzUk/1Eqs6YCm1euX2PbhAmqXLK0C9Ayo694sKuVggMKfbeLFgCNiR5koWFHA
 vblKuJwpgXp7MWLQ1Zh+VfkT8iOaBUUD4zUz24EF9JH8yf8pxaskacj95cfc+WtnsKPj
 47Rw==
X-Gm-Message-State: AO0yUKX+zigiCVtwIk8YLNz1mM2covAZmgM/qM7NYP3opTl+oZOO9Dvp
 p6v2ioMyLYtSRmAbLLSlNC9HsA==
X-Google-Smtp-Source: AK7set9Z4ZGOP6Fsh7liszYtVH27S1FUcTMnqPjPIib1BGTpW/anBmkQ+ECe7xGhGTVowgP0g69g1g==
X-Received: by 2002:a05:651c:221a:b0:295:b0c6:834c with SMTP id
 y26-20020a05651c221a00b00295b0c6834cmr6673532ljq.41.1678273401426; 
 Wed, 08 Mar 2023 03:03:21 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a2e8e2a000000b002934d555783sm2528022ljk.6.2023.03.08.03.03.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 03:03:21 -0800 (PST)
Message-ID: <9dc9814e-22ae-7b89-80cc-dc1d92898a2f@linaro.org>
Date: Wed, 8 Mar 2023 12:03:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] gpu/drm/panel: Add Lenovo NT36523W BOE panel
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 Jianhua Lu <lujianhua000@gmail.com>
References: <20230217-topic-lenovo-panel-v2-0-2e2c64729330@linaro.org>
 <20230217-topic-lenovo-panel-v2-2-2e2c64729330@linaro.org>
 <CACRpkdZ8RvFrieWXhx1WGO71M10H0-b3WbDXM7=xnngX7uWT6Q@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CACRpkdZ8RvFrieWXhx1WGO71M10H0-b3WbDXM7=xnngX7uWT6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7.03.2023 23:18, Linus Walleij wrote:
> On Tue, Mar 7, 2023 at 2:26 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> 
>> Introduce support for the BOE panel with a NT36523W touch/driver IC
>> found on some Lenovo Tab P11 devices. It's a 2000x1200, 24bit RGB
>> MIPI DSI panel with integrated DCS-controlled backlight (that expects
>> big-endian communication).
>>
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> I will think this is some variant of the Novatek NT36523 display
> controller packaged up with Lenovo electronics until proven how
> wrong I am.
> 
> I will listen to reason if it can be demonstrated that NT36523 and
> NT36523W are considerably different and need very different
> drivers, but I seriously doubt it. (For reasons see below.)
> 
>>  drivers/gpu/drm/panel/panel-lenovo-nt36523w-boe.c | 747 ++++++++++++++++++++++
> 
> We usually share code with different displays using the
> same display controller, so panel-novatek-nt36523.c should
> be used as name.
> 
>> +config DRM_PANEL_LENOVO_NT36523W_BOE
>> +       tristate "Lenovo NT36523W BOE panel"
> 
> Name it after the display controller like the other examples
> in the Kconfig, DRM_PANEL_NOVATEK_NT36523
> 
>> +       mipi_dsi_dcs_write_seq(dsi, 0xff, 0x20);
>> +       mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
>> +       mipi_dsi_dcs_write_seq(dsi, 0x05, 0xd9);
>> +       mipi_dsi_dcs_write_seq(dsi, 0x07, 0x78);
>> +       mipi_dsi_dcs_write_seq(dsi, 0x08, 0x5a);
>> +       mipi_dsi_dcs_write_seq(dsi, 0x0d, 0x63);
>> +       mipi_dsi_dcs_write_seq(dsi, 0x0e, 0x91);
>> +       mipi_dsi_dcs_write_seq(dsi, 0x0f, 0x73);
>> +       mipi_dsi_dcs_write_seq(dsi, 0x95, 0xeb);
>> +       mipi_dsi_dcs_write_seq(dsi, 0x96, 0xeb);
>> +       mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS, 0x11);
> 
> I think it looks very similar to Jianhua:s driver:
> https://lore.kernel.org/lkml/20230220121258.10727-1-lujianhua000@gmail.com/T/
> 
> Can't you just add this special magic sequence into
> that driver instead?
Yeah I'll try doing that.

> 
> Would it help if we merge Jianhua's driver first so you can patch on
> top of it?
Definitely.

Konrad
> 
> Yours,
> Linus Walleij
