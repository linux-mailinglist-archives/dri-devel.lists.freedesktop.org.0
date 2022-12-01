Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6850163EB4F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 09:41:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F7710E563;
	Thu,  1 Dec 2022 08:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71C610E568
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 08:41:33 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id x6so1059159lji.10
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 00:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8rfgJ9QknK0MbQgAWzuzypV2KA7EE9D4Q3QePGfyw50=;
 b=pLqeTL9I8Ynl8+m01CI3TXOD5Clc683rk/kTgYPB10lPttqq5wrYZX5fy6uMB5bcIL
 Q9Cb+uuHbCU29BY7VnV5c9c69dyrKJiOnX4lfdoiwJzkpBzuhjQ/nxNKBjj0pVGuLdQ7
 6seh9XDNhhFvBwvrnGxskhFy6Y+sC0oSkhj4BgVTNukF3vRb0uDCjqcvJNHfkR58Nkky
 kxxc8DZAtnzYvLyEHkISrnL58ujEEXgprNI/o3vEHSLOl1hfgc3FdMLTIeeLbjk0gR4C
 pIRFGfV2eTjEDvpiUBihngsh3eLZddfnQzMcMFidHqGQFE7ZMGKPR7JyGXSUaZGt65jX
 b/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8rfgJ9QknK0MbQgAWzuzypV2KA7EE9D4Q3QePGfyw50=;
 b=lTwSO+PU4bZhLt+97EKL88ApjG37zsgg2L5HrmzwLiu+uVP0fuZrKinlTkWbHaT2kk
 +CTMESzCac3H3HS5jN/amPcchoN7Q8h/EviMbrdw6e1zeYPqxa7UkSvwr9G5s2J31OXv
 K+1ME0yI63TTDU/CQK0WW4GbN9hL4Okl/lglrgUl2jwyTQRhsboQgFRNQ/pPDSoYYJyP
 GupEul5KOhAjXqDL9S0KsQb9RgAgK9yXnD5k8SWX8C5yJ0e3Zh/ZsO6aupD5i0WmZL9H
 WsOum2Tegh2gD+tkl4wcKVusgDdNhWEv33J8KMSP7LY3v9fKTlJGcUc3o2KgVpFYIAHR
 VnHw==
X-Gm-Message-State: ANoB5pmfp32AMHzl/fXk6cpZwUaO1ZeAvprTmeaPQZlzm4kkq+vLcnlE
 BTShC7A1znSuQlNIJA7ln9Q=
X-Google-Smtp-Source: AA0mqf7ITWlTk3AHP9k4F31qto94qdeue5OQdSgwjEJSBqfseuIyGBBoGz2T5XLny7Dg0nkeIcHEmQ==
X-Received: by 2002:a2e:7e0a:0:b0:277:6f0:5239 with SMTP id
 z10-20020a2e7e0a000000b0027706f05239mr15945498ljc.186.1669884092070; 
 Thu, 01 Dec 2022 00:41:32 -0800 (PST)
Received: from ?IPV6:2001:14ba:16f3:4a00::b?
 (dc75zzyyyyyyyyyyyyygt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::b])
 by smtp.gmail.com with ESMTPSA id
 t27-20020ac2549b000000b0049a4862966fsm568047lfk.146.2022.12.01.00.41.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 00:41:31 -0800 (PST)
Message-ID: <2e4f97e9-a8e7-8afc-612d-a9d2c2e47ce6@gmail.com>
Date: Thu, 1 Dec 2022 10:41:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH RESEND2 v4 2/2] drm/meson: dw-hdmi: Use
 devm_regulator_*get_enable*()
To: neil.armstrong@linaro.org,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
References: <cover.1669799805.git.mazziesaccount@gmail.com>
 <df0096b5aea2a18d1540cde379c5abf589ccd7c4.1669799805.git.mazziesaccount@gmail.com>
 <7b7a7e34-af6a-cb09-e094-e42e45f45b8b@linaro.org>
Content-Language: en-US
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <7b7a7e34-af6a-cb09-e094-e42e45f45b8b@linaro.org>
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/1/22 10:38, Neil Armstrong wrote:
> On 30/11/2022 10:23, Matti Vaittinen wrote:
>> Simplify using the devm_regulator_get_enable_optional(). Also drop the
>> now unused struct member 'hdmi_supply'.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>> Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> Missing Acked-by, I'll add it while applying.

Oh, well spotted. I should've been more careful.. Sorry and thanks for 
sorting it out!

--Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

