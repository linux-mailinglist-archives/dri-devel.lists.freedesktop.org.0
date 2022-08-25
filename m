Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9D65A1107
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 14:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E6210E155;
	Thu, 25 Aug 2022 12:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF98F10E12E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 12:49:02 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id d23so23728039lfl.13
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 05:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=UJPLpT2XcBKMANzNpVXlkK/AnxD3KVjPku+NRJRnKeE=;
 b=k+G/oX+tvXRqJzetOeviAPzbgrL5egIXfBvmKIq5DAMokEGsJbf7+FjfewZPAKLxtG
 9A0ZwzR5cxdj1yVttE4Kjl5Zo+Kq9whxkrYyo0uPvZQbvcH5tqTauCnW8hVNXVto6QNY
 oVvf9FVo+kSjS48LgQeaAlUre1eAe5TWgkZ2kWwZ6Eon03gXCSNth9suEYho74Q2lUBs
 xHIHrjn8IazmmRIwdr+Sf9fzW5EmmBjEPM5gtHm0ndTYDJqX8oD5lE/Z7V2IVC75lvx9
 GvNyJC0ZNLt5CwCUpquEm9bVouh1W/dMU1xQgqrF+Y0nO8O0W+ZLCODsv9u59pMuoySu
 mVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=UJPLpT2XcBKMANzNpVXlkK/AnxD3KVjPku+NRJRnKeE=;
 b=49aHqDOd8AON+t9XyVEx5bi76qK+Z80zQqIo8HvCDTWNp62RSqYX2Aqbg3D4aKfp/5
 ctuswd/KAJ0t5+gMy+inuAyhX3nA5MOugdS1u6iNZjJ5dSMnrPVSaUwQLcydpce1XdfF
 DGMcvCTVyYXBVO5pVM0rtCArK9VgceVnChqwbXFZ5ZFqfaj7G/uKcWVTHASlSj40dj+n
 BQC5EnaHyHM5s1fOnfb7jP0tiYnVcIeWifVvxn5yTIxowUN3RkEMoS36GyM24MHw5u/V
 ZQ6sHD49gdoP2f4bMBWVLkxKmA8Zd9Hjv9dZAkrkR/sIid4myZajyhvk77bXlZKuA6IV
 wO3A==
X-Gm-Message-State: ACgBeo29ydv6fPTLlkl7/Lyk/+2Z5bzTeZ8WX4lC50bIiFFax7DrcjSk
 Xz+ivMRvfLw9OmJk7gNHlEX1aA==
X-Google-Smtp-Source: AA6agR6AgoXqICDhxJTbQc5viluo1tBN0fKOt4yUAyXgLOl/1YmAvzY3+oRl8yr7gVtpdjtYOrQmuw==
X-Received: by 2002:a05:6512:6d6:b0:492:b3df:a71 with SMTP id
 u22-20020a05651206d600b00492b3df0a71mr1250703lff.117.1661431741037; 
 Thu, 25 Aug 2022 05:49:01 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
 by smtp.gmail.com with ESMTPSA id
 y12-20020ac24e6c000000b00492cdba2903sm486980lfs.97.2022.08.25.05.48.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 05:49:00 -0700 (PDT)
Message-ID: <5db5da26-3689-928b-433e-72c690014b64@linaro.org>
Date: Thu, 25 Aug 2022 15:48:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH RESEND] dt-bindings: leds: qcom-wled: fix number of
 addresses
Content-Language: en-US
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220720163720.7099-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220720163720.7099-1-krzysztof.kozlowski@linaro.org>
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

On 20/07/2022 19:37, Krzysztof Kozlowski wrote:
> On PM660L, PMI8994 and PMI8998, the WLED has two address spaces.  This
> also fixes dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: leds@d800: reg: [[55296], [55552]] is too long
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/leds/backlight/qcom-wled.yaml    | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)


The resent was a month ago. I assume this won't go via LEDs tree, so I
will resend (again) without Rob's review, so it could go via Rob's tree.

Best regards,
Krzysztof
