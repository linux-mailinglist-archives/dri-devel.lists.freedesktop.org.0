Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9EB1BDDB1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 15:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2E76ED2A;
	Wed, 29 Apr 2020 13:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADD96ED2A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 13:33:25 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id d15so2566460wrx.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 06:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=57KpVyxFiIynSOtLWM5S1qu9oG0E8FFGMRYGzL0PtQs=;
 b=ABiQRIwnnGgnP7DXwh5VSPW3qFWj2FcDVAgkYap4Sep2VKflFx4N/3UKNVOrNvHK5f
 XttYZI0S7MqVMonv8SzdRLVL+QgpFNksG1Ov1gH0sBsnm5ZwXkWWcglAUcDoecIgVDKv
 TA0d/5OOhCjf3aeu0+ukRzQme0Pof1jHr0s9VmSqQOJvxLkVzvgmNqXBhnQsf82RuGh5
 nGSfyDjdej/n9WKXpFKfkTK6vAHyrSmyZq5RjjElWNgoasSIQINoQRnst/8pUz0RBefl
 wxUHuhRndYMqGu/IE9TR5h6FOdCU4eI/gcjp+NLfWE4HjmePW2eoEhj4KASneqM8iCPE
 U6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=57KpVyxFiIynSOtLWM5S1qu9oG0E8FFGMRYGzL0PtQs=;
 b=fGIcbx29WACzLcUcgLUlTBHaXI5fByzzvGhXj6RarOEEsxPKui4ev6b/NvK678Ccm8
 9UYYhv/cKqLQ4d2Ey35pccqUcNEOW6tOym7qGlPZtFAWp5sCjLXhvzb4FIM4HpW2z03H
 BGpcrUFkUmkgMnvf1/WnDlOTRVziR7M9y0PT1BOt0+qjVSZ5p19KHOgxMoPwhIN2UUi0
 tOP6qBsnshCnSNQnGBPN1+emIqplA8KmRZ6teerpMMWQhFhw8wISMmAddCXO9nYiouN4
 INDqyOpfLYkA8YHA9Dgupf+N0fQpAERwqvLObDpHmB0Wrya6qpyf9rn+U04EF6aLYSX5
 N5vQ==
X-Gm-Message-State: AGi0Publ2ykmJXmZrslmk6pmE2/UDeHtGrCD4ff140wWCCp1nXCQL4Vp
 K33I6mNNb0OZTV2Hf98WPC8Nkw==
X-Google-Smtp-Source: APiQypLeL8JXb5wg6K5NkhgJTycyIPyVnsKkihsopNfL2tb7HT1xgcWccOBeuwpneP2REnFZ67aTSw==
X-Received: by 2002:a5d:4e02:: with SMTP id p2mr42130290wrt.302.1588167203674; 
 Wed, 29 Apr 2020 06:33:23 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:4460:3fd3:382:4a71?
 ([2a01:e35:2ec0:82b0:4460:3fd3:382:4a71])
 by smtp.gmail.com with ESMTPSA id s17sm7644244wmc.48.2020.04.29.06.33.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2020 06:33:22 -0700 (PDT)
Subject: Re: [PATCH v2] drm/meson: add mode selection limits against specific
 SoC revisions
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20200428092147.13698-1-narmstrong@baylibre.com>
 <CAFBinCBb=FTH6aken5K9zoedBPYBJUCSj0eA+_Eghv+mnU_3vg@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <f7aadb74-4351-3c55-7d99-afabc34b0712@baylibre.com>
Date: Wed, 29 Apr 2020 15:33:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCBb=FTH6aken5K9zoedBPYBJUCSj0eA+_Eghv+mnU_3vg@mail.gmail.com>
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 29/04/2020 00:03, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Tue, Apr 28, 2020 at 11:21 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> The Amlogic S805X/Y uses the same die as the S905X, but with more
>> limited graphics capabilities.
>>
>> This adds a soc version detection adding specific limitations on the HDMI
>> mode selections.
>>
>> Here, we limit to HDMI 1.3a max HDMI PHY clock frequency.
> for my own education: 1.65GHz from the PLL will be divided down to 165MHz
> isn't this more like the limit of HDMI 1.2a?

indeed from [1] :
```
HDMI 1.3 / 1.3a:
- Higher speed: HDMI 1.3 increases its single-link bandwidth to 340 MHz (10.2 Gbps) to support the
demands of future HD display devices, such as higher resolutions, Deep Color and high frame rates.
In addition, built into the HDMI 1.3 specification is the technical foundations that will let future
versions of HDMI reach significantly higher speeds.
```

So yes, it must be HDMI 1.2a, I'll fixup while applying.

> 
>> Changes sinces v1:
>> - Moved frequency check in the vclk code, and also checks DMT modes
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> This looks good to me based on the current limitations of meson_vclk.c
> If we switch to CCF based VPU clock rate changes then we should do
> this in the clock driver by calling clk_hw_set_rate_range(hdmi_pll, 0,
> 1.65GHz)
> 
> The good thing is: we can re-use struct meson_drm_soc_limits even
> after switching to CCF.
> We will just need to set the max PHY freq using
> clk_round_rate(hdmi_pll, ULONG_MAX)

Exact !

Neil

> 
> 
> Martin
> 

[1] https://denon.custhelp.com/app/answers/detail/a_id/192/~/differences-between-hdmi-versions-1.1%2C-1.2%2C-1.3a%2C-1.4-and-2.0%3F
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
