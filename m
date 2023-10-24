Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB867D4CD5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 11:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E330210E30D;
	Tue, 24 Oct 2023 09:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C168910E30D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 09:47:32 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4084de32db5so36678845e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 02:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698140851; x=1698745651;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x6MWUd7aqJU+RyKZEkGxK6HLsZy1LBZI2NHtQ/z43aI=;
 b=OY0D/jp9au179dpyJFkETRhA4z0BLa03fwuKFhCTGV2iVn8ojY+7SXV3FaPrmgieWs
 b9cSaHxmAXvqh76ExPYIa4L0OOPmfvJ3ibBkNfTwmZmGV8mKWVO7VAnmfznA5FrF6c0l
 aUJB0ubEem6mN/ca8pF9PL3Orhr/1RVwEdb+RAuD4Hj5eeXS8Cq5shewPwgjqrE1AESt
 tltuHKjnroP4MWvO3ruC0HECblIVrC0GfF+4OpoiX3EgKS8VfkM0zvgN66KoEscq6TM7
 29g8pmmV2DHFt1zF8BWQkuR/RvtUDVnKxmWPkRNcgEjfkRlnKb6iwONmFv5dfz05RZGA
 c85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698140851; x=1698745651;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x6MWUd7aqJU+RyKZEkGxK6HLsZy1LBZI2NHtQ/z43aI=;
 b=uay/fQjcbC16jsj1Sf3vChqtv1Y12Iyr0Dtijag6LAhYIv2/vzHpf2FWNaTZOrDnLE
 t/FIMV9wSv5NRWbtwUNSJSWfiNODyzlgknR13F6GNDr8BYxFrzvcbq8/nVsVu3aShsCx
 L48DNypxN02Jnre3TYpd5nt78EUyUyDjzL9cqHTEIRkv3aiSLyDhcw7fs13PD2L1R9ql
 I5XGJbMghgWDYvq3Y5vSbhd0xiFQW2ZfoAJWcAjNpXmRtIqgD2tH5SW9o0EPYZ+sHvfk
 1nzxwOTlTMR7tpX4M/RPbg7WrI5hfhLSFUV619Yk/PCd8ah8M+B7omfRtEnFX045tzmY
 c39Q==
X-Gm-Message-State: AOJu0YydMOQgsbGqkw49lIRTCwCyUhysV7+7Rc5qhAZ7W6CtA7AL3znX
 XyNoGIYZGFmn5CNBuwm5L44w8g==
X-Google-Smtp-Source: AGHT+IEQBKgigKRTPFTRZ1HUumAXzBLooE6sUMLZ71bOwGt4iZlfl+uviaSnAYq2eru3B4WrrZD2NQ==
X-Received: by 2002:a05:600c:1907:b0:408:6fae:1aae with SMTP id
 j7-20020a05600c190700b004086fae1aaemr6443536wmq.31.1698140851135; 
 Tue, 24 Oct 2023 02:47:31 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 r8-20020adff108000000b0032db1d741a6sm9602052wro.99.2023.10.24.02.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 02:47:30 -0700 (PDT)
Message-ID: <037d24b9-38ea-4da5-a1d2-8ace4d9dfa5c@baylibre.com>
Date: Tue, 24 Oct 2023 11:47:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/18] dt-bindings: display: mediatek: color: add binding
 for MT8365 SoC
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
 <20231023-display-support-v1-3-5c860ed5c33b@baylibre.com>
 <CAGXv+5Hwe8jhgthnxwXEPezhwvhfcE=WMp_My3W8FisRagRTKQ@mail.gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <CAGXv+5Hwe8jhgthnxwXEPezhwvhfcE=WMp_My3W8FisRagRTKQ@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, linux-pwm@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 24/10/2023 11:40, Chen-Yu Tsai wrote:
> On Mon, Oct 23, 2023 at 10:40 PM Alexandre Mergnat
> <amergnat@baylibre.com> wrote:
>>
>> Display Color for MT8365 is compatible with another SoC.
>> Then, add MT8365 binding along with MT8183 SoC.
> 
> This unfortunately doesn't match what the patch is doing.

Yeah, I fixed it for v2.

> 
> ChenYu
> 
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>   Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
>> index f21e44092043..fbf15242af52 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
>> @@ -39,6 +39,7 @@ properties:
>>                 - mediatek,mt8188-disp-color
>>                 - mediatek,mt8192-disp-color
>>                 - mediatek,mt8195-disp-color
>> +              - mediatek,mt8365-disp-color
>>             - const: mediatek,mt8173-disp-color
>>     reg:
>>       maxItems: 1
>>
>> --
>> 2.25.1
>>
>>

-- 
Regards,
Alexandre
