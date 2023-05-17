Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F44706429
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 11:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2F310E3D2;
	Wed, 17 May 2023 09:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5979110E3D2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 09:30:32 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-50db7f0a1b4so787351a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 02:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684315830; x=1686907830;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VUzdy3IaIQzq5nRdBRJ4CCJrcCkR0OgrgjQsv52hwAU=;
 b=CZ7BnvfTcqeadMIEosUB0CY2OnrUMg/Ehng1E1VqtBnK9yAmX0uAwuQdsG/PpCY0QW
 X9T1qgHSZFuBdCKRUw85xOimKQrSTenDDzHyAlw8QUsFLPbiqzPd4nTdhOGFCN0E6e3o
 yHp/OYWOc9Y+FJTDW/YFeroAPF2X6L3Eh6g0ILWT9jxV6coUllbFlixpTFoyTU10g8w6
 +yoDIQ/24mPl4CLGBb+hrXrhDUby9CWrghH/91vO4n4yb0tdqd7RB/CzhaZE3ZyUSUA8
 VGN5Ba7aaxKynTrusMWkGPY7JWcP6psylDj+s3An+1o1t+BDnqxAI/oozDdlmCSc/eFL
 VRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684315830; x=1686907830;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VUzdy3IaIQzq5nRdBRJ4CCJrcCkR0OgrgjQsv52hwAU=;
 b=iK36YqepPhRwQSUNT+UuDe1oLyNWI+WKa5dWohs/eOTK52YOKn6fjbP7PFS9HZ+bqV
 gFcRLZ72pcLa3x+Ka8ODadyibpDi0tNgQp+tR6coPkfCI2rjDUc40aUiXghn01D70NWI
 2MO6Oa6chTr5uJMqgsCieMaXYm9oFPALDWY2LR0/9TkFMXm5gs9gALFmIBcN/0daMe2a
 4dn7gUs+ekbX01lSHittsnQEDxfG2oQVF7XJx+bGAygXG1RLpKSfJn+VJrpC2S7tmfSD
 mfzv8FaD1SYltFuqoD5WCkPt6hRcl6APJT/I8BjdrBRpGhYvSbMoq179OtQn08A0yOUN
 0uZg==
X-Gm-Message-State: AC+VfDwE9GZlKCzo60Nec810KYp1k6bsbHKHNjIg8eP/PVTuO4Mwey/P
 NC9/xUJTbnR/aag4AAjkjxkNTQ==
X-Google-Smtp-Source: ACHHUZ5iJ/zDI6dvKaZaIEoptXlHraI7FVmNbrkIBVv6R3E5jqonyVRZBV8CAklmUB4izFMLbbYIng==
X-Received: by 2002:a50:fe93:0:b0:508:3b23:d84c with SMTP id
 d19-20020a50fe93000000b005083b23d84cmr1560294edt.1.1684315830281; 
 Wed, 17 May 2023 02:30:30 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c9ff:4c84:dd21:568d?
 ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a05640208cb00b0050bd4b8ca8fsm9005293edz.14.2023.05.17.02.30.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 02:30:29 -0700 (PDT)
Message-ID: <2a1b81da-39c8-4111-7e42-18f5f2f557c4@linaro.org>
Date: Wed, 17 May 2023 11:30:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RESEND PATCH] drm/i915: constify pointers to hwmon_channel_info
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230511175446.282041-1-krzysztof.kozlowski@linaro.org>
 <87cz2zgvdd.fsf@intel.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <87cz2zgvdd.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/05/2023 11:28, Jani Nikula wrote:
> On Thu, 11 May 2023, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>> Statically allocated array of pointers to hwmon_channel_info can be made
>> const for safety.
>>
>> Acked-by: Jani Nikula <jani.nikula@intel.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> FYI we'll merge this once we've done a backmerge to get the hwmon
> changes to our tree.

There are no dependencies. hwmon changes are already in rc1.

Best regards,
Krzysztof

