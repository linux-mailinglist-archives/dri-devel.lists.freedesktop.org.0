Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F335F6B0554
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 12:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0185B10E66E;
	Wed,  8 Mar 2023 11:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F7E10E670
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 11:04:23 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id by8so16161376ljb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 03:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678273461;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8VV/rTwRnKU6UEDzet7JK45QLgODlSkCmiX3BH1I/DM=;
 b=HQOU5vTycAVVSRYho/hu0pGY10vRB6gem4HEXKnxf+e6Kio8lh9290+DjmqanEo/uR
 SUTVd0ixFCjUXhTI20G0c1OSsRFE7mlHOfggVuhtY/EzovMdj+jiTql//MUHgNnK/RSN
 6++wErjIBKvMsB12VTgOlvoFOOC4mlQuCFexib4jJ50fFEE/Uh10luiQ/wVoV/oOHwrI
 HgZSDpJYAJm6v9ySVAaz76eohfO4qADYgjPuA7zww4CQDB/QbKjeP0d2bQS9s/OFcMv/
 8WRdwNGoiP+q5MFW5HQ8IlSZE8dRZg+nwW7hmz1G+HX7XAbgWu/VXw05s6AXM5LMhvJc
 3cyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678273461;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8VV/rTwRnKU6UEDzet7JK45QLgODlSkCmiX3BH1I/DM=;
 b=BH6dJihl9x4oGcS1L2h5c4g9y3YnL7bP54jCTVNlD/jPn1inzAZw8oJpp+qtL9k22F
 BR1WPBcKuaBLHcPAnEWzpW+z6nCSv3uFxtX4Dgos6QeSmlTARC570zLMo9A/PsuQnB6j
 Ag/gH7biVRSVqq1LPAMkmviFm5bgeHC5qY9n9dd6oHa5x6UjV1ReQeg36CN0skjYX/rf
 u0bznYv6lYtbLAq51RQir/h+4B0I8LhQwjHp0P3imU1inMF2A4qwoXIArXl+hmxPywYj
 l7ZnpMEvIBZo7aEfJymEfJIq+D50f6Jq0ewfBX1L9zEBktKMdlgfrnS6Yf5Gm+NaS3CV
 II4w==
X-Gm-Message-State: AO0yUKXyizlJc50lrn00easZ1GVcLUMIqiEl8pgECQy2tCcXfLN6/XLy
 mP8B9bTJoe+7Jt8BOhNx/EmG+g==
X-Google-Smtp-Source: AK7set8sOg8LE4msTJbUjDfsJsqcsmqcDij63xRlHars6UR3HN5ROaMU5DoLkueW01X5wuMKUb1Q9Q==
X-Received: by 2002:a2e:3002:0:b0:295:a8fa:c627 with SMTP id
 w2-20020a2e3002000000b00295a8fac627mr5389644ljw.14.1678273461605; 
 Wed, 08 Mar 2023 03:04:21 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a2e8893000000b002934fe524d2sm2527508lji.83.2023.03.08.03.04.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 03:04:21 -0800 (PST)
Message-ID: <dff4732c-df1f-0df8-b414-b039ab34c54b@linaro.org>
Date: Wed, 8 Mar 2023 12:04:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] drm/panel: Add driver for Novatek NT36523
Content-Language: en-US
To: Jianhua Lu <lujianhua000@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20230220121258.10727-1-lujianhua000@gmail.com>
 <20230220121258.10727-2-lujianhua000@gmail.com>
 <CACRpkdbZCZiMM_qeqMd9=txVvPVHEzM4szOnPR-gCYdiXW_9eA@mail.gmail.com>
 <ZAfasb9aKTgyjbFc@Gentoo>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZAfasb9aKTgyjbFc@Gentoo>
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8.03.2023 01:45, Jianhua Lu wrote:
> On Tue, Mar 07, 2023 at 11:34:55PM +0100, Linus Walleij wrote:
>> Hi Jianhua,
>>
>> thanks for your patch!
>>
>> It appears Konrad is working on a very similar driver, so I suggest merging
>> them into one Novatek NT36523 driver.
>>
>> Possibly we can fix this up first and then add Konrads Lenovo-panel with
>> a patch on top.
>>
>> On Mon, Feb 20, 2023 at 1:13 PM Jianhua Lu <lujianhua000@gmail.com> wrote:
>>
>>> Add a driver for panels using the Novatek NT36523 display driver IC.
>>>
>>> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
>>
>> (...)
>>
>> I like how you abstract the panel with init commands in the panel info.
>>
>>> +enum dsi_cmd_type {
>>> +       INIT_DCS_CMD,
>>> +       DELAY_CMD,
>>> +};
>>> +
>>> +struct panel_init_cmd {
>>> +       enum dsi_cmd_type type;
>>> +       size_t len;
>>> +       const char *data;
>>> +};
>>> +
>>> +#define _INIT_DCS_CMD(...) { \
>>> +       .type = INIT_DCS_CMD, \
>>> +       .len = sizeof((char[]){__VA_ARGS__}), \
>>> +       .data = (char[]){__VA_ARGS__} }
>>> +
>>> +#define _INIT_DELAY_CMD(...) { \
>>> +       .type = DELAY_CMD,\
>>> +       .len = sizeof((char[]){__VA_ARGS__}), \
>>> +       .data = (char[]){__VA_ARGS__} }
>>
>> I have seen this type of reinvented wheels a few times now. Don't do this.
>>
>> Look into other recently merged drivers and look how they do it, for example
>> drivers/gpu/drm/panel/panel-himax-hx8394.c
>>
>> For example:
>>
>> - Use mipi_dsi_dcs_write_seq()
>>
>> - If the delay is just used at one point in the sequence, do not invent
>>   a command language like above for it, open code the delay instead
>>
>> - Try to decode as much magic as possible, if you look in Konrads
>>   driver you clearly see some standard MIPI commands, I bet you have
>>   some too.
>>
>> - Maybe use callbacks to send sequences instead of tables, like in
>>   the himax driver?
> Maybe I should create a wrapper of mipi_dsi_dcs_write_seq() for sync dual dsi mode.
Yes please, it'll come in useful.

Konrad
>>
>> Other than that it seems like something that could also handle the Lenovo
>> display, or the other way around, I don't know which driver is the best
>> starting point, but this one has the right Novatek name at least.
>>
>> Yours,
>> Linus Walleij
