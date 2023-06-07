Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6802A7261CB
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 15:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01A010E07C;
	Wed,  7 Jun 2023 13:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DA710E07C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 13:57:12 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-514953b3aa6so1346684a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 06:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686146229; x=1688738229;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kKpvPu5Rm/nURTMMsBy+tWBtqwgLaFCv5S24g6y4mow=;
 b=lMeYAGAQIoc851Xz0eJb0PtiX9acHzzCcIRcU/RyTCtJylY8kOce+BtmAAlbchfgaM
 ux+d4RvKhJql1f2hncN91Yae4vn9KVyIXDZvMApIjJJqotSYy9KErr8ln1HSA9AqQyLj
 QIxdWloAaOUglN1CJzxmEbLFF6S9bmUUeF5KZLKtDC8W5pY5ZG07/IBa480wngvl+pgw
 21f3vyl4N40oShuNEk1gxWHWooKKFb6NMW8ElfrfxNAKnFR4Nt+Hn3BGGE354AXtFJmQ
 UlwcouKzzYJNk++/7CYeYPcBZFy1JC6M3V2I5fXnuIaT5kb6gF26yMald57+QMWk4rjA
 DHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686146229; x=1688738229;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kKpvPu5Rm/nURTMMsBy+tWBtqwgLaFCv5S24g6y4mow=;
 b=eIuynYagTrN+H2bBsM6jrXezasLdne0PbwN9AYNcWD38Etn+mfhl5X8WIbM7BR8mNE
 7gmYoFx1KZvsTBkPv1YckxRUwjo2uLpXTJLDSi8THJPVRUvY3Qrqk8KxMrcpAA5cnPrN
 kXRgl+Tojn6aCXvsDlOc7zv8wEWpxvX4nVINq/oI23xn3EhpyLognTAbUefpDVXg4vQ8
 0ITiiSTF1KkIrjC9VV2XStaD4jQgKu7yDJkUuy4sSVUlsKTIn7eKZJGA3agOf6PLzd1Y
 cthN9o1vr5N6hJJQBLn2CbZWL6lpGyn/jJWzpmV5TrXBBFyy/vsw69I9VKScfpl9b3Xe
 WXCw==
X-Gm-Message-State: AC+VfDzhwtkXjGLpk39HQsgXcCtv8V0SqOoAHWQ/MD69S0EI23BdWuJZ
 daL+kdDFZQE3PqOxeDQJNQZQklnTII6PC1dVu14=
X-Google-Smtp-Source: ACHHUZ7EcYvo+spZ1Zu2vN1Sav3wheuQzpa99azcDZ/IzhZp4uRXdRVAhEfFaElWL4x4m1MwMFpu5Q==
X-Received: by 2002:a05:6402:2142:b0:514:9edb:185a with SMTP id
 bq2-20020a056402214200b005149edb185amr4634692edb.9.1686146229452; 
 Wed, 07 Jun 2023 06:57:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 p19-20020aa7cc93000000b005166779bfd2sm2893476edt.6.2023.06.07.06.57.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 06:57:08 -0700 (PDT)
Message-ID: <14fab6aa-2f9a-c3bc-5ed4-0d4fb20b20d6@linaro.org>
Date: Wed, 7 Jun 2023 15:57:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 3/3] drm/panel-fannal-c3004: Add fannal c3004 DSI panel
Content-Language: en-US
To: Paulo Pavacic <pavacic.p@gmail.com>
References: <20230606140757.818705-1-pavacic.p@gmail.com>
 <20230606140757.818705-4-pavacic.p@gmail.com>
 <dfe2c108-0268-c4d0-226e-b3d2bc8c3369@linaro.org>
 <CAO9szn3PyQQRKsxdsOrmVNMP2xuvN4_dHwb1_TWEqmhnr3TLPA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAO9szn3PyQQRKsxdsOrmVNMP2xuvN4_dHwb1_TWEqmhnr3TLPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/06/2023 15:38, Paulo Pavacic wrote:
> Hello,
> 
> uto, 6. lip 2023. u 16:45 Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> napisao je:
>>
>> On 06/06/2023 16:07, Paulo Pavacic wrote:
>>> Fannal C3004 is a 480x800 display made by fannal that requires
>>> DCS initialization sequences.
>>>
>>> Signed-off-by: Paulo Pavacic <pavacic.p@gmail.com>
>>> ---
>>> v4 changelog:
>>>  - formatting and style changes
>>
>> Are you sure? I see other changes - removal of some code, handling
>> errors and GPIO.
>>
>>>  - change community room
>>
>> What does it mean? Where is this change in this patch?
>>
>> ...
>>
>>> +
>>> +static const struct drm_panel_funcs fannal_panel_funcs = {
>>> +     .prepare = fannal_panel_prepare,
>>> +     .unprepare = fannal_panel_unprepare,
>>> +     .enable = fannal_panel_enable,
>>> +     .disable = fannal_panel_disable,
>>> +     .get_modes = fannal_panel_get_modes,
>>> +};
>>> +
>>> +static int fannal_panel_probe(struct mipi_dsi_device *dsi)
>>> +{
>>> +     struct device *dev = &dsi->dev;
>>> +     struct fannal_panel_data *panel_data;
>>> +     int ret;
>>> +
>>> +     panel_data = devm_kzalloc(&dsi->dev, sizeof(*panel_data), GFP_KERNEL);
>>> +
>>
>> Drop blank line.
>>
>>> +     if (!panel_data)
>>> +             return -ENOMEM;
>>> +
>>> +     panel_data->reset =
>>
>> You have wrong wrapping here. devm_gpiod_get_optional() goes after =.
> 
> I'm not sure why, but clang-format makes it that way. I'm using this
> style: https://raw.githubusercontent.com/torvalds/linux/master/.clang-format
> Do you have some other style?

Linux kernel coding style.

https://elixir.bootlin.com/linux/v6.4-rc5/source/Documentation/process/coding-style.rst

Don't use clang or other non-kernel formatters.


Best regards,
Krzysztof

