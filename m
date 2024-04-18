Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 640FC8AA599
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 01:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D048310F1B6;
	Thu, 18 Apr 2024 23:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="o8wBWpvP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE25610EF9B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 23:04:50 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-5ce07cf1e5dso958620a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 16:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713481490; x=1714086290; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=cSRxbDm9eRcYsgpOAF3L6ZbI9LzmxpWl8JR/uimnOO8=;
 b=o8wBWpvPhl6tNQpd9WGEpFHodnTzhDA+go1AsWjJgd1UcyUBeSnRECbwv297nzEZVY
 u0vKodz8hrl6XEiQG13Q7F08yjRoILHAnyLKIJKoeR4k8Vkvph1xOwz43E2diCtjuwV+
 mZYCxglag4/i44uUdMbjNsiWv0IECH80WwVKC6oQjcDHc3UtXcFPL/hgT0e1Gr6JEOAI
 CwMhfg+rP1l5vro7hpBa3sOx8n11mrt5NNKPnJIRpJgIAXHV/ccuvZASpWQ4Yan1iFKK
 hwA6R6vcX7QBh3OB9qaVwnG0Xivp87y9xUaKVK5+qo1KcTLPF2rWj/XRPx2wqRjjJYWf
 Vivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713481490; x=1714086290;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cSRxbDm9eRcYsgpOAF3L6ZbI9LzmxpWl8JR/uimnOO8=;
 b=w16wLZDKil5gW+ZjH4E4XLywD1HV7OsCWBohm9IANZxqgyPXZZsWgBxsdMtkKEqytv
 sVBLdOIdmhXT5DbZABUCi//wrEanJiQBhWtQu7GU1io9ldtAUhFuz1xHiDhX9k5ZRN+q
 UVTqT0kok6OrhDI4cjLhS/9i4dXbrq/yNZD1fA99MFZzczGhU+bfQzFz/rdlcMD7Luyj
 Uy9nGpjazrb2oWNrJQkZ/j7xMk1JFSBw4u9f4R8ytyz25nwKwDj056GiYK1coNLqp4mZ
 NNuqorlI8nGbZUDpA/YvZrhRe9NLEtMTBGCpWXsSJ7W/QAXifTqUTmtcMfb3rmaV2X23
 igtg==
X-Gm-Message-State: AOJu0YzCG/E1RUtHXDFfi8I3gTif4iMIjz8sop7sfFMObqRCgg5bYwhl
 7+mex1kGHI5DN6qtsGeRvtnr5tAz6Ve+1R/dB1FUf34w4P5l7DOfzmjMV3H51bU=
X-Google-Smtp-Source: AGHT+IGWSEGrJUSHpMRZQLEhk/JeUtHmmp5mTuNYqwUq/Qzt29DXzBa8vUG8bWcP5F4MwANeTcE6dQ==
X-Received: by 2002:a05:6a20:7f84:b0:1a9:68c6:c0a7 with SMTP id
 d4-20020a056a207f8400b001a968c6c0a7mr862610pzj.9.1713481490165; 
 Thu, 18 Apr 2024 16:04:50 -0700 (PDT)
Received: from [10.36.51.174] ([24.75.208.146])
 by smtp.gmail.com with ESMTPSA id
 i193-20020a636dca000000b005f7ff083182sm33322pgc.36.2024.04.18.16.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 16:04:49 -0700 (PDT)
Message-ID: <c739a512-9a75-4f48-b5ef-801191c298f5@linaro.org>
Date: Fri, 19 Apr 2024 01:04:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: panel-simple-dsi: Add generic panel-dsi
To: Johan Adolfsson <johan.adolfsson@axis.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@axis.com
References: <20240418-foo-fix-v1-0-461bcc8f5976@axis.com>
 <20240418-foo-fix-v1-2-461bcc8f5976@axis.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240418-foo-fix-v1-2-461bcc8f5976@axis.com>
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

On 18/04/2024 16:01, Johan Adolfsson wrote:
> panel-dsi is similar to panel-dpi with overridable timings

???

> 
> Signed-off-by: Johan Adolfsson <johan.adolfsson@axis.com>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> index f9160d7bac3c..4c9dd4f66a8f 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> @@ -56,6 +56,8 @@ properties:
>        - samsung,sofef00
>          # Shangai Top Display Optoelectronics 7" TL070WSH30 1024x600 TFT LCD panel
>        - tdo,tl070wsh30
> +        # Generic dsi panel with timing overridable
> +      - panel-dsi

? Devices are not generic. This is very confusing and commit msg does
not help me. Compatibles *must* be specific, see writing-bindings.

Best regards,
Krzysztof

