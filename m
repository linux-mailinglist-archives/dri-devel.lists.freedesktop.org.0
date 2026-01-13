Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CB9D169C9
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 05:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A4810E216;
	Tue, 13 Jan 2026 04:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="agmbxvE7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1137910E216
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 04:45:31 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-81e9d0cd082so2729383b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 20:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768279530; x=1768884330; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Iy6S9q8/CD1KaKEpgdKuwKLpEadDje8AFP0pfPr3/5I=;
 b=agmbxvE7h1DsSZNnTx4f8PgWavNOUby0sYuLNe76m8fPILBHlP2v6s3fEVcqDvn2bf
 +m3gb2cpF7sPvbWpOeje2orKysK5lOuhOMhcFJJDyBKfYhP4W5UgcHUe5bMZONJGd7jP
 AJpAxsYigELrWKqcTLQaRI64DkXSd/gZDuO+XAQwDS5JCYiZMKAa6YKteWN4JcJl3c17
 G1Z8M1aFpd2yufM3oDEluq6Wq+xoJwJ26L+3NDAMR//p5mdRp1FIxGURM50Ks90LKiUr
 DZiOJYCveC5G6K2HEAEHFe0LJ5XlIepmy59XlFQTIAJP8+hnQ79NPiT4Uv5zyhQ/+MtY
 aImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768279530; x=1768884330;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Iy6S9q8/CD1KaKEpgdKuwKLpEadDje8AFP0pfPr3/5I=;
 b=bGMaLRcFSUub+kWgMNllcw0FESA6t7j4dLBxAIHDAlnukrFcLu+lHRI6X6GH/Hr8vk
 LEeSn+kmS4ljFfX7fAHHZTGf69WB7rBBsXXuplJczT34ea8tsvsXBgVStT55TN9hknRv
 8xfLcP70bJODpL3S7BzBPN5zwJbA0QdZ3fJYDar2TfnTMPWiEnjo0pppn/4vmpwiAgJe
 HxCgMCsvw2DcvBWd3+ZTrKi/pv7POF+H8sBAKj91eBouqMt/T9uDl5zQErTyA62vNrGa
 LhcjPgDp8NK+nEJ9KF88cd0FwbGYpNhhkKSPpQh4MTuWHNRm/UyrHw7iDSK8A1BH6Ows
 vkrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMzo+kbGkZyR8juX0g4bbdePHNPieAfGmz0LSorQMw2trhfzvCKJI+BTVZdNwgi6kHLwfDi47WPws=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuNXJJq0xSB/2kXpdxDByVIKxq0mhisNbNr+DqNM3jjgqWe3ME
 B7qVtQkEA9haO55J6GP6/gTbUKaJwpSAAQwOdnBUTY27OvsEP+Jo0lXZ
X-Gm-Gg: AY/fxX4zHt8vTehj1ulaEKIYHfLf7+gFM4zP2m9yRAZDIQOa4NTa7T1LjNhpSJM8QhR
 90/j1Or3e4Wm3Q8c5y9qZJJ2eHde/M0Wp/WhygW1LJya/oAXfy5lA1a6pPoisDJ9jBViXtcSR3W
 kvyFtRr1egVQFUYqMWgG34O/vGnnog87Xh7hAbBD10V0c1lYw7sm5c3aGFsLVqLIIhEW+N+mXC/
 aVaoEf239DVB0ZGsl8MQ1QJr2xzoyxv4K+nfm6aFLh+THRDdvFs7MOSAfAJZmAjji3s9MnDtkn9
 Xs9X0dAyoezfziIQ8SE+2hHUn9bZuCrcOLLIHAE10TWDB+vd88foVW/RWgoQsY7OrWv45Ub4dsN
 xap7DzhjUa0WKlqffiRyOH24wBJOUpCr1VBAIiZqzhq6IczvHmUguLAnHGax9C7evCLCYf1/56f
 daW+Hm83PVuu1fMeyLIzTE1aPYb3LzPN1vmA==
X-Google-Smtp-Source: AGHT+IFqbGus3DZt4vurEFth5/Rb5XoyKQRcXgMFVDwspPX6ajf+F0/ZgCzEPgnpPLFp0Bu5b44dew==
X-Received: by 2002:a05:6a00:438a:b0:81f:4ce8:d641 with SMTP id
 d2e1a72fcca58-81f4ce8f745mr5760972b3a.37.1768279530424; 
 Mon, 12 Jan 2026 20:45:30 -0800 (PST)
Received: from [172.16.20.12] ([136.226.253.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81f36f88f4bsm8338351b3a.36.2026.01.12.20.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 20:45:29 -0800 (PST)
Message-ID: <c182df66-8503-49cf-8d1d-7da17214b843@gmail.com>
Date: Tue, 13 Jan 2026 10:15:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: backlight: gpio-backlight: allow
 multiple GPIOs
To: Daniel Thompson <daniel@riscstar.com>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260105085120.230862-1-tessolveupstream@gmail.com>
 <20260105085120.230862-2-tessolveupstream@gmail.com>
 <aVuKdAyXfWLs-WJI@aspen.lan>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <aVuKdAyXfWLs-WJI@aspen.lan>
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



On 05-01-2026 15:25, Daniel Thompson wrote:
> On Mon, Jan 05, 2026 at 02:21:19PM +0530, Sudarshan Shetty wrote:
>> Update the gpio-backlight binding to support configurations that require
>> more than one GPIO for enabling/disabling the backlight.
>>
>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>> ---
>>  .../bindings/leds/backlight/gpio-backlight.yaml      | 12 +++++++++++-
>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
>> index 584030b6b0b9..1483ce4a3480 100644
>> --- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
>> +++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
>> @@ -17,7 +17,8 @@ properties:
>>
>>    gpios:
>>      description: The gpio that is used for enabling/disabling the backlight.
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 2
> 
> Why 2?
> 

In the current design, the LVDS panel has a single backlight that
is controlled by two GPIOs. Initially, It described as two separate 
backlight devices using the same gpio-backlight driver, since the 
existing driver supports only one GPIO per instance.

So the maintainer suggested to extend the gpio-backlight driver 
and bindings to support multiple GPIOs.
https://lore.kernel.org/all/q63bdon55app4gb2il5e7skyc6z2amcnaiqbqlhen7arkxphtb@3jejbelji2ti/
> 
> Daniel.

