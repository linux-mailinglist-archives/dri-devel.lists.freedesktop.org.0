Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C684BD8BE
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 10:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A173810E2AC;
	Mon, 21 Feb 2022 09:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209AF10E2AA
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 09:54:02 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id j15so17490969lfe.11
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 01:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FBQCAwLGItt59fBHH1fMX/rXCxY4p1v9wuPJWfMr/EE=;
 b=OMjFpUKSoI/8tDW559i/11H2ijvy+X7Cyy6+WRTh9BpYhAd0ESthUOs21QFcduRLUX
 tGwZzFtj90IC1hBoKntcyQvsn11UKiofViSoSA/V7l/NNjHPUvvL4b9XTN6qSrbYDpLs
 gbdjvTfYbe7a8VYjZFTFv0/F88nhCwe5RCFWeRMN79SOD+ga3jJgJPl85LdsYhffSx9O
 f0KieNs5r3M64JzpMGPsA6JxAEaFgRZUxnb+MT8MmRvmkHQVofikUxrarsiCe+saU+TX
 qmZ7towRvoIrZdYqqnFpWmWme6fYEZVk2g784cMY0LEkmtGG9Zj/XjfRtzaUPbkWq6VZ
 9gtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FBQCAwLGItt59fBHH1fMX/rXCxY4p1v9wuPJWfMr/EE=;
 b=4icy+0JQdjV1k/kOF92Wj5GhL69XTE233MZXx8+saqdNV8LYw8sbF+S2+VSTIrKuFM
 yeIvJh3Z8v/z9KKHtLeY9vRq7kix7QsoyEMmIOUE5KNsGoeGwfH9gCztg0TxptbUMi1S
 gQaTW1KSneRuHZ0KqVP3JFUKM/YMS3wspClnO3GRxNmEBoStjshWMjySiaOaTDDP1uBX
 yCWRI6R3xOCiaJqUvetlrtqSSp6nWsUSRq5VtyDPbzFkIHP1kWDoHZ4adr1uS3jLIqqG
 zTJnlTkJ470zsbrAbAI2Rx8lIn4iqQ3S+RIBUrjUANtjNS7aCOwNBZ30DaLG7OXDu21p
 XYYQ==
X-Gm-Message-State: AOAM531sXp/il9MK5iwM8OBXUfkxOQJrxF8gyxjZuoej2kHQgKEALtQe
 Lmfit+BBB4uwcnmUlxKn/pI=
X-Google-Smtp-Source: ABdhPJyjpoLC4dkht2ubnC2fLVCm11jEQES+SqN3/jJaPUC4j1RTjBwAfYihJh/DiezuaKLTQVLqDw==
X-Received: by 2002:a19:4f02:0:b0:441:39df:161c with SMTP id
 d2-20020a194f02000000b0044139df161cmr13408076lfb.504.1645437240280; 
 Mon, 21 Feb 2022 01:54:00 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru.
 [109.252.138.165])
 by smtp.googlemail.com with ESMTPSA id q12sm1066973lfr.157.2022.02.21.01.53.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 01:53:59 -0800 (PST)
Message-ID: <677beebd-5a16-297f-c09a-fa4b72c001c9@gmail.com>
Date: Mon, 21 Feb 2022 12:53:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v16 21/40] pwm: tegra: Add runtime PM and OPP support
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20211130232347.950-1-digetx@gmail.com>
 <20211130232347.950-22-digetx@gmail.com>
 <20220221081727.jeq2jff5ewjzubxv@pengutronix.de>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220221081727.jeq2jff5ewjzubxv@pengutronix.de>
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
Cc: Nishanth Menon <nm@ti.com>, linux-pwm@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Heidelberg <david@ixit.cz>,
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Uwe,

21.02.2022 11:17, Uwe Kleine-König пишет:
>> @@ -344,7 +387,10 @@ static const struct of_device_id tegra_pwm_of_match[] = {
>>  MODULE_DEVICE_TABLE(of, tegra_pwm_of_match);
>>  
>>  static const struct dev_pm_ops tegra_pwm_pm_ops = {
>> -	SET_SYSTEM_SLEEP_PM_OPS(tegra_pwm_suspend, tegra_pwm_resume)
>> +	SET_RUNTIME_PM_OPS(tegra_pwm_runtime_suspend, tegra_pwm_runtime_resume,
>> +			   NULL)
>> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>> +				pm_runtime_force_resume)
>>  };
>>  
>>  static struct platform_driver tegra_pwm_driver = {
> I admit to not completely understand the effects of this patch, but I
> don't see a problem either. So for me this patch is OK:
> 
> Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> I spot a problem, it's not introduced by this patch however: If the
> consumer of the PWM didn't stop the hardware, the suspend should IMHO be
> prevented.

Why? The PWM driver itself will stop the h/w on suspend.

> I wonder if the patches in this series go in in one go via an ARM or
> Tegra tree, or each patch via its respective maintainer tree.

This series, including this patch, was already applied to 5.17 via the
tegra/soc tree. No action is needed anymore.
