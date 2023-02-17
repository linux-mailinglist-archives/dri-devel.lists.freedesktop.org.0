Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7655F69AA67
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 12:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D02910EF7E;
	Fri, 17 Feb 2023 11:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD8910EF81
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 11:30:51 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id co2so2597443edb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 03:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v92NiBIjYWfziymAkr6wLKbvWDe+7TdVnIlek7VWKg4=;
 b=aehxZ5CykYoBS2jaabbw30nhDFy3UgG8JrMBcuCW9O+YfUDXX6pii39H9ZcsznmI1T
 qf0FIqy5nT4Vtyt1PUYw0p0mdjCqrE194s+qPTnYjcz9lOHEv0JFVI5Ft/E78PGv+znL
 tMbqplbJwSJuUQAtUvbt1K60YRqjtbk19LcPXiSL+Iz8lwR3vDrrKUgtWCyOoYdeYKnz
 iHccbkLF8IwPh0kXY67uIoE6niDS8GrW1gClhouoUQLTgDh3eo7A8H2e12XT5WR/rSIB
 F8NxsCcQc/OCfpVjei6rL8Z9wY7V3JX0fgvTzUcVD4d3Plimk8AUeQh+r3Cf6NAdf6WO
 j5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v92NiBIjYWfziymAkr6wLKbvWDe+7TdVnIlek7VWKg4=;
 b=j+W53pFq9ptO+vpEulW8zbygsxQziJDmBIHc2oY7YwcphOE304XrEexwVCutrd+heN
 wXd9L34EoREocWzjQ9ZjZ1PGAb9o6UUxwtqP3VF9sLFHCl1WEyT/8CjpoZNuhrltuk32
 JmvvBGtqg1XPn5BTS+Wz17WC7NUIfyYuyYy0hysFPDcGIOn2c5hsoJmhlwLPYQt4ED0l
 NpD670ry5H8fFgvk9zn2zlwzx1OjIqHzgGnFeWFRltjgvUky+zTiHLYLvXpq+uDqnUbH
 DjcX7C0P/iBe+DxrZl84g76w5C0Ptfgud+q3Z7fjWzKy+nVMBs7lRvt3wPZ6Y6EnHkc8
 +BGg==
X-Gm-Message-State: AO0yUKU60k61IgNxvwJJH1XclFSFqyV5iasCbkZxXaV1C6gMzp+u6tZl
 nVElwUt5xAHicsj1XO5r06hW6Q==
X-Google-Smtp-Source: AK7set9c3OK+BsvdM7YtkZ7FTNv0/+Gz+O1m241k5kxQLoB5GvCYK2NYpdilFc927EHUrqk1h15vqQ==
X-Received: by 2002:a17:907:6743:b0:879:d438:4d1c with SMTP id
 qm3-20020a170907674300b00879d4384d1cmr11441762ejc.21.1676633449765; 
 Fri, 17 Feb 2023 03:30:49 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a170906529600b0088c224bf5adsm2039261ejm.147.2023.02.17.03.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 03:30:49 -0800 (PST)
Message-ID: <0284de96-0dba-9336-67f2-d70b5bede8a1@linaro.org>
Date: Fri, 17 Feb 2023 12:30:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/2] dt-bindings: display: msm: sm6115-mdss: Fix DSI
 compatible
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230217111316.306241-1-konrad.dybcio@linaro.org>
 <20230217111316.306241-2-konrad.dybcio@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230217111316.306241-2-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/02/2023 12:13, Konrad Dybcio wrote:
> Since the DSI autodetection is bound to work correctly on 6115 now,
> switch to using the correct per-SoC + generic fallback compatible
> combo.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Depends on (and should have been a part of):
> 
> https://lore.kernel.org/linux-arm-msm/20230213121012.1768296-1-konrad.dybcio@linaro.org/
> 
> v1 -> v2:
> - Deprecate the old compatible instead of removing it (Krzysztof)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

