Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCADC9122A0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 12:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230B810F15B;
	Fri, 21 Jun 2024 10:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pE2qb4Bo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95ABA10F147
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 10:41:23 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52cd8897c73so417923e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 03:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718966481; x=1719571281; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OlI8WG42tfYxEvg2uxEiUxZl/W5sVijloq/FzS1zkcs=;
 b=pE2qb4BoMC0zcK2zBVZPk3jSLbHm9AIFhj8GC7JWh3CzneX0jghD8i4UDXhBvnMR34
 VwNGs5LWm6mfOtpdVaJhKIII+XxtfzqPiM9P4Z2dGxjDifFuSSYcebzVSMpWgCXIHdvI
 U+LPLe011NaEm0i/GVikHuQkUVUtBID4lE35NQXm8VeVFsuMNwQH1uJFZQO4fvVTlATi
 1sqeBhBAGF1Kqa5+0rg8c6x2kmJP42yFRAVxlgMPDHq5WzcYOsZ9Ix8CPmQqemMuOGFY
 /T7WAtXgAIntb/ma+aVil1o+9y4ionFWcxvGO0LPcshRUEI43dOEJvhyS+uCytaHB4Vc
 s0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718966481; x=1719571281;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OlI8WG42tfYxEvg2uxEiUxZl/W5sVijloq/FzS1zkcs=;
 b=FIRPsevXCzL3HO77BNR6sSAt95CfHBhVnfz6nn1M/Xg4JbR8UgbSnpZanCCRvI+QVj
 AsIOlL7FwAbnPQBApsK+EPIC6AgVUzhhq2XT5rvNgNjLCWdHrknVafO9tjD98JucbANw
 LRlF8Vsq5YucRp0XJSdw37B9DCAReffK+1HV/pDjdRbG90OZwo0kA3pfQNTYmGxUHkh3
 wt0dVqnVsge2kpgVCmYujCQhV7uTQ6vacYBRuEsu245H0l21Tm2u7ioSDpaY9O3l3ZYO
 49FOb+a6l47nEA2sfDYSoW5vfyi54bhR0wVzpokCbivX0A6w4wTyrh/c/hU74bs3scxz
 +vuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQv3atGlG9UPsudMA44RDd8FszjTCF/Xz4UAAR5TuW70twzEotB4gYEmKTX9uyRpabVMZteRyj2wTQpMLBBWgwZBliufCm/jm9MDVKtsbe
X-Gm-Message-State: AOJu0Yzw6KVhbvCo8RuZVdjYFwY6A5SOiD/5apA7Cp4SuxT7VZ9IBKzU
 TiXFGCd9SAZfSR03WN17lIJNFMFtOUA1t6I4oSXwGpDWu4qBrpj4X5Ksjb1iEWg=
X-Google-Smtp-Source: AGHT+IEKqEanpP2Gb1L+htVVw75Q/jC9n63JsCue/e1Dww3+6vlxu4NwaXLBc2+Zx1U7PXEmAvMzvg==
X-Received: by 2002:ac2:505a:0:b0:52c:c156:15c5 with SMTP id
 2adb3069b0e04-52ccaa65800mr5359611e87.41.1718966481379; 
 Fri, 21 Jun 2024 03:41:21 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4248179d8e0sm23456835e9.3.2024.06.21.03.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 03:41:20 -0700 (PDT)
Date: Fri, 21 Jun 2024 11:41:19 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Jianhua Lu <lujianhua000@gmail.com>,
 Flavio Suligoi <f.suligoi@asem.it>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] backlight: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Message-ID: <20240621104119.GA285771@aspen.lan>
References: <20240619193558.2543645-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240619193558.2543645-2-u.kleine-koenig@baylibre.com>
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

On Wed, Jun 19, 2024 at 09:35:57PM +0200, Uwe Kleine-König wrote:
> These drivers don't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize this member.
>
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.
>
> While add it, also remove commas after the sentinel entries.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
