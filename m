Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7D07EE847
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 21:25:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F6110E6DD;
	Thu, 16 Nov 2023 20:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877F710E6D9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 20:25:17 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3b5ff072fc4so730105b6e.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 12:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700166316; x=1700771116; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UcNBnGJB40dtZqLIC5fFsXSJbvtWbqeXkPg9KjlNVlg=;
 b=P3r2EXwkyUPwptTbSqZbRx3MK4Sl86LxxV4VoVFbrROshYpOZMztRZLfOqWCCoYpW4
 Qw2o3Vxx8a4ZBKFD1Fz1MU1XAOfyVCPJ5L88mCN/boC0XOkIWLYv55LceKlsUeKLuxd/
 aitKb3p3A8F+hMMkIu3AZr6H6XLp44S8CvM7qYHjd8U2hazGAfgdgoJ8ipOmHyyBrCTt
 sQopqOHmNTbs0MF35LLo52uam/D4bMBrzP8+cznz4st2oYdmGr31M7zNmyfZbpy8VGjw
 cVzpTeK5PqbG8pDsdfgPxFE+sWPg8V/MV66vnODbMWDF41uSqu2BJQe2+YfXdLMNwGqR
 PkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700166316; x=1700771116;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UcNBnGJB40dtZqLIC5fFsXSJbvtWbqeXkPg9KjlNVlg=;
 b=Dxw3+nQf8s98L1k+NwXWVb1SJmtRfeNZUz7MdkeoZoJ9FJAbDQvBhxUXt4sdBd6L0h
 6fJxtSEtMIKw6OuIH6mqqvj6PQT55BfK2S6h+eATcvvCEE+LpL2p0KlfPr4Ek5phcvyb
 vyeOrD/8ebU3CAdmh15QSgJ1qRTxc2WcACTR58/+vKhR4Ve2MTHVINIkdbDoVZrMnu5a
 AmVZrIyTwmFc0+Tm88Wa+mhH7jag3P2giSAFEIWkFwOLcPwWae2KC/i+rD1iIY9GyrWY
 GEeTt7Y9Zlom4QuyLgDNAt4JZWcq7lchg5rKSIztyZoQQxYjzrkh73By+VvXggspoVql
 cB0Q==
X-Gm-Message-State: AOJu0Ywu/4TN263jaV/LSCuzzogkrr5vzHaT/zaCGra55yeEg7iClcTY
 zVVLz98TdCWR1Har4AYGi13P1w==
X-Google-Smtp-Source: AGHT+IEptDLuiRXsLaoS1Vu8ochSLgZ8DrOKC7ayAfv2GChtvhM5v9hxn9HWjiDN3DvwjstMGfgyKA==
X-Received: by 2002:a05:6358:6f82:b0:16b:c58a:ce8 with SMTP id
 s2-20020a0563586f8200b0016bc58a0ce8mr11823560rwn.10.1700166316603; 
 Thu, 16 Nov 2023 12:25:16 -0800 (PST)
Received: from [10.44.189.251] ([12.161.6.169])
 by smtp.gmail.com with ESMTPSA id
 ee11-20020a0562140a4b00b0065d051fc445sm51695qvb.55.2023.11.16.12.25.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 12:25:16 -0800 (PST)
Message-ID: <fdd84042-4140-407c-9dc5-d5a56d3d3292@linaro.org>
Date: Thu, 16 Nov 2023 21:25:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/6] dt-bindings: display: panel: Update NewVision
 NV3051D compatibles
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>, linux-rockchip@lists.infradead.org
References: <20231116001742.2340646-1-macroalpha82@gmail.com>
 <20231116001742.2340646-2-macroalpha82@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231116001742.2340646-2-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/11/2023 01:17, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Update the NewVision NV3051D compatible strings by adding a new panel,
> the powkiddy,rk2023-panel, and removing another entry, the
> anbernic,rg353v-panel.
> 
> The rk2023-panel is similar to the rg353p-panel but has slightly
> different timings so it needs a new string.
> 
> The rg353v-panel is duplicate to the rg353p-panel, so remove it. No
> current devices use it and changes to the driver mean it is no longer
> valid as a compatible string.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

