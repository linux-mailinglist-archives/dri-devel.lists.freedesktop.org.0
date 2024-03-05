Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6B08718E8
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 10:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B9B11295B;
	Tue,  5 Mar 2024 09:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WWNJSwN4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FEE3112813
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 09:05:38 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-412eeb018ffso1437755e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 01:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709629536; x=1710234336; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iVyff6pSUeH7eXbrIj/i6abg3oo4j85mjc8PEacBjjE=;
 b=WWNJSwN4ZcDHrPork2d5p6/7pSmJkZhzFVMjiWb8KkDovmLZpjRSyH98v/Q/flrEAD
 G5LfFU/q+TKLYMdGTIukDmh5X0WawnEF/FnBc6Bhe9YYpV4vkjiYTwflOrAxQu37TplG
 8bMuhinPejp0QIRg6DqlCSGxoZctDy5TJLLkhcQ5dbgZSH6T23KIUOUy+BAkUIsXejYW
 J1dEHodgyPSCh2qpzlsQ3D5s+4KSfdwTfeykUELsk9Of7gnTgatt3NV/qy//Vm17T6Ai
 blTuZyVrtrPB7/OQnUa6wSOq5bmyI3ftg1/Yj8EVzirmZbrhloKOwhW2B11HgRpSXsEL
 HpAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709629536; x=1710234336;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iVyff6pSUeH7eXbrIj/i6abg3oo4j85mjc8PEacBjjE=;
 b=KaIbtkLbESkMRKDxQMG9Iaxe8756EvQR59B/k7hleFj1+jidS+DEbjKuzWK7ObqbOB
 NnNuqEHIE2MitDPFLOKDrTv7EJQlLKnFm2u3cgtp/qpQSMnt60VoMm6pyjHOW+9iCJeP
 EFtarGtg8DFN0s70fDyR3iJ1Neqm2PoMFkYTHfflPJQlZxsnsVemH+mmPPBsUAGz+QvE
 YTndn+VCmucZe9IM4apGHC9Zofvk3WggfHsCIdCt8WPrp1cgEOm4QwTLFUVftWOj7bBw
 OVL34baqvHWW/2iCLTmcCnyJKtvZdT99eP5tQIMlRXR+T+pLvEpx9VNttdpKAiY7KIiZ
 I+vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcJtcmx3YpMDwYRt085VquIaVelhPPbtJ6idZUETi4rXjGDTSsfa8lmKTLuaPk78X4pI1IJONrD9RZlYD8l/2bq6tawqWfAKwWesG5jKFW
X-Gm-Message-State: AOJu0YxG0fU6Ty2mVGwqjj/nuhu03pieVdjLziuv39mg44vRO0cB6J8R
 g/zC9S3CFjGidmug+zDAzHo9BMYOYBJ8Kw4kc7Vb3i+e0NCJTufzaAmmVQK7vLcKVHwwSHM3NVC
 OCb0=
X-Google-Smtp-Source: AGHT+IE3V7x03ggowAKVgcziDcq2QmZUnrNLZGdToxQ4bVq1RxNhNEasbMMg5KQP4v70Va8u3fFnoQ==
X-Received: by 2002:a05:600c:474c:b0:412:c9e5:b2d7 with SMTP id
 w12-20020a05600c474c00b00412c9e5b2d7mr7368975wmo.19.1709629536061; 
 Tue, 05 Mar 2024 01:05:36 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ay37-20020a05600c1e2500b00412e7dde7d9sm3637450wmb.15.2024.03.05.01.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 01:05:35 -0800 (PST)
Date: Tue, 5 Mar 2024 09:05:36 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] backlight: gpio: Simplify with dev_err_probe()
Message-ID: <20240305090536.GJ102563@aspen.lan>
References: <20240305-backlight-probe-v2-0-609b0cf24bde@linaro.org>
 <20240305-backlight-probe-v2-1-609b0cf24bde@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305-backlight-probe-v2-1-609b0cf24bde@linaro.org>
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

On Tue, Mar 05, 2024 at 09:11:56AM +0100, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
