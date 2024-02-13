Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA834852FD3
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 12:51:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4C310E417;
	Tue, 13 Feb 2024 11:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Sjsm1wiY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC74710E417
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 11:51:11 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-411bf7e5c6bso3267775e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 03:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707825070; x=1708429870; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=KCJUUo4NY8H1iJowVwWL5uTUekQPIffQFSEsxY0BDG8=;
 b=Sjsm1wiY0OVlZTd2zYayQJOQ9pt9lNf2egZcb8eKkkajzIp9uFumzXeU9gdmLTBQ25
 ecT/KwMrAXqwlNLoEcIZANcwa1uXIC2aHaXquPDIUyTVWTPbk/CpN76nZi1F0YqZTVdq
 zQANzhqLnbXSCThIZhSgvFF+xAkDVEXOKH0+G3Rf9u/L7ata6gGea/zY7hxGyDA+sIf2
 zi9kqm4laZAxl+ZY7yQtVenWWPCMOAeDffmItYs/C7SliEy1szsIFa7rom4pMDeqjXSV
 RzmAvnjB3jwRpM3wRc/AQIXIaAweC2aRtQdYFxkU7RGduzghgP1fz4z2wNH3nJJqjVnY
 s6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707825070; x=1708429870;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KCJUUo4NY8H1iJowVwWL5uTUekQPIffQFSEsxY0BDG8=;
 b=I3vySLsqf50zJXSqgZVd2M9uJO1FcGC93OVk/GyG8hAfqWxei5UP041DUkfpdyuRla
 g4rm/J0QZwH2nlP5ayltMmkWmo4beUcDijPMngIe+P/AobhscidD5CySP1T0zPYWuHee
 UvNF2Cp3y7cYyYQd9fExLMdgNOBPSESazbQ0WuDT0yo2uhskA+nR69iTtNe25eH2JPHY
 NZkFuGJqj1LdVDBLlLUPHSeKdASnbsebc+T7vqsTj0MsJPTYjazIXDTIlGYevvSMddqR
 tEtrHmUf2mxuIO8HpNqVZRk3hsSwcMP2I3QGZ1s+okaArjbXeLR1d4T8bOfSxZLF4syu
 xVWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwAvsNx2Cs3W4XMJ1licQSveeeX3L1SGPUu5F7WZiVi03hcflyDOGrW54wr2P5XcQdKB2NomBai0nU8VQhDBBEFqaVWkp4RaDiEioE5jLw
X-Gm-Message-State: AOJu0YzD2jIzFfCddlYDWXEiuwaHCHbfEVSPLQUFQDW7szeetumzK80u
 2atXSdJvZhELcFuF1HsYwodCdsjxbIqDhDxDhwc2E0XJEwELSatSQRmfDkxOSnM=
X-Google-Smtp-Source: AGHT+IEnrKObr5hq2yICYsBQYVK4BBhB9K7XzXqG4lCfv3DJwJUjXYEQmv8obG0ucBf+pSFKQNJy5g==
X-Received: by 2002:a5d:53c2:0:b0:33b:876f:b7d8 with SMTP id
 a2-20020a5d53c2000000b0033b876fb7d8mr2697559wrw.42.1707825070298; 
 Tue, 13 Feb 2024 03:51:10 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ4/81GGNGYeGVI0uJVMAHZzGFpiB2/ulmLhkks6BholmwE53sv1Elt5CYUNaSK+3eSOKAG8PobsfaiJWPDQBh4lmZGnBgJC/g2WyvTTenDNuoPUvRLbD81KfoLUnudAN0M3BrX4h1kFYyPYGHojz9BKFliqy7h0qFN4nPj6doeao1ZHjwFAXGAyfzDFPdJne52JagoGJfr6KrwcJu8QsOWm79BQWRGR05cSvk/oOVSUM6fSIgVh0nQE4sOaJ9RgS5H7/a/bFv83IKYxQI42wOe6WN1t1QjKfRnEbN9F8FAmZEune27N39cRsJYkTE10FS8fp/uBbtYQ1nvbR0jg7270KiTcrFPTQ2DUvNGs3YgTsOwNdiEbuvo5ALZrwO8vrJ24RrX3XpcZuuoqCFNhSsOWyeEtKlRKUqUNXXZYEZ2T8JbUQx/q4x74W6+J/s6neGI1NfR2OL2xIAKxfEziWzDPCe/a8Knsc6hLYAAzLM6rfTVW0+yMmDDzttaBiWqwx7A0CefrISR1vFMAQd6PntCBZazYvpR8JeSl5t6lGGeKIWFQrDLjm/ajTXq2qGbXLBjaYU19Y9+z3iGVaAyOMJUpy0IrsbHve6aKRM0508
Received: from [192.168.1.20] ([178.197.223.6])
 by smtp.gmail.com with ESMTPSA id
 ce9-20020a5d5e09000000b0033cddadde6esm1090631wrb.80.2024.02.13.03.51.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 03:51:09 -0800 (PST)
Message-ID: <d39c2186-026f-4326-b666-5a90422a5d68@linaro.org>
Date: Tue, 13 Feb 2024 12:51:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: display: st7703: Add Powkiddy RGB10MAX3
 panel
To: Chris Morgan <macroalpha82@gmail.com>, linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org,
 quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, megi@xff.cz,
 kernel@puri.sm, agx@sigxcpu.org, heiko@sntech.de, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
References: <20240212184950.52210-1-macroalpha82@gmail.com>
 <20240212184950.52210-2-macroalpha82@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240212184950.52210-2-macroalpha82@gmail.com>
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

On 12/02/2024 19:49, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The RGB10MAX3 panel is a panel specific to the Powkiddy RGB10MAX3
> handheld device that measures 5 inches diagonally with a resolution
> of 720x1280.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

