Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD18B31047
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 09:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5860910EA7A;
	Fri, 22 Aug 2025 07:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="V99LzugZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F25510EA7A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 07:26:28 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-45a1b00e4a1so14674455e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 00:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755847587; x=1756452387;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lK3kj6aT+uG8TNpObwIxTe+g6r92LKlTq+gjwtDBVRk=;
 b=V99LzugZzwp32tN7o6XBLtVN9CKmrpEhtwNVi+VfF7SIBMjUOpz2S+B4RGZueBMFhN
 JwiGJ631OiK12UQ5FhplQUflGz9Y4ZdoFup+kMsqVlRc7A8WajWZt6lDvT8Wk7Nw1ThS
 IxVR8qRDYhlrB9RxIQaamDDaNPcIAi7c3sCIv+wd1ITuyh1SHfG1gayFHpuRH/bXtJ6c
 /vywLVjGv5uPnORYO76D2cwusEsRBkmEE1GTxwjAxkWBREOO84EL1anc4R3TT6RSkbeL
 i+Xy5pA5G1Aedx3c1j06+zm8mSZTnE4yeS0HMjv+7nXBdUTmD573Srv3r+DTsUIrQhGx
 xi+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755847587; x=1756452387;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lK3kj6aT+uG8TNpObwIxTe+g6r92LKlTq+gjwtDBVRk=;
 b=tVdkySVQf75P434zT2MWJ1goG3QAhENQ/Av6Y64oDNTLasQ1SOV6CGNPbZGsDjz2/t
 a0sTFNwh9lXMkNr1sjZYe9QDglg78GwtlPDBsFwrRS2EqSK5hAsY+W6vkPw1h5CBWpfc
 FTj4xXiO9dKmxuHk867sP/yrGGnQua5aA2e9g5CzsyxclyrrHeepx+uvYfFMqLO07sd4
 UgWRQSXHSPsn9JuHV0dH+L20zebs4HmMpwXpZasou1LSrbQuL8p41VCKfLqsLbuPBIgO
 hmT9L5kUqc9TXykikMUK8VmQJfzx9DQxmwD8mt6sFOpSBZlIztRYtFY7Q9qjV49QIHsa
 OfrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBfcd9Ph75rY6Xa3hILY6vRiQAeM0K40OyOtKsczi6RNs9CP74L6G6FRoQsDRELQgUcCzmQAQIrR8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdmWCMgRfEWJu4SwWGIFtB5bMAuWy9jYUr1i7bPdAzKWHSYsyB
 dTufYZAVHy7heDXjHRw2SXkNmo/GZ4uct9gYIdqE+Q3ZmFP5VJ2K0JIsBMajfLPQAkg=
X-Gm-Gg: ASbGncsbeoLICVs3/rbeDDxKmeHj93bILF1q6goZVKTdOrP0Kq307Ix4kpF4xmuMSOc
 ZGxYazbxQfo0hrmaRnw3wYpTTfJk4Z3tp7moLPYUmXZfVZ5aiM0IRi0pXY15ymIEWaUlpj/jpiN
 L+vmJNd1lVNjahtQ+Krxu2UA7sLdkXhZKonN0g5Ny18OhbGxZGiG3rWLR5GOeZoPdoax14R8Har
 ubj4Qvca6+xaxqnGXeCGP46tMDbrVO9pCkOwyFiGdrwsxFT8F3b1YH59ojXMpNgUhPpFfohpTxj
 3FHgL7/v68AGXTFez5DLN2oObfKZY85jh2gDBapM7iCXKSyJjIDyXXPWMguYckWh7/3zYD+86LD
 t0qCr0PXOIZNlloEPeUMtjGOLADzfHyc5DLnfYTFBEtS5jSGda11WzVA16JXNV5nDwVp7HzTiQP
 wb2dpK+Q==
X-Google-Smtp-Source: AGHT+IHDuHRP55niLwTskQO1m/b/5ctH5UZu5kjoy3BiQ8RvkZmMD4Fr6kF/PognPgs2X/R938TpUw==
X-Received: by 2002:a05:600c:1c28:b0:459:d780:3604 with SMTP id
 5b1f17b1804b1-45b51798fb1mr14095255e9.3.1755847586840; 
 Fri, 22 Aug 2025 00:26:26 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b50e2f0adsm25076255e9.13.2025.08.22.00.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 00:26:26 -0700 (PDT)
Date: Fri, 22 Aug 2025 08:26:24 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: maudspierings@gocontroll.com
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: backlight: Add max25014 bindings
Message-ID: <aKgboFjwjtZsanWb@aspen.lan>
References: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com>
 <20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com>
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

On Tue, Aug 19, 2025 at 12:58:59PM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with intgrated boost controller.
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  .../bindings/leds/backlight/maxim,max25014.yaml    | 79 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 84 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..30b591152fa31d5e43243cac44c72028b05b5f8a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim max25014 backlight controller
> +
> +maintainers:
> +  - Maud Spierings <maudspierings@gocontroll.com>
> +
> +allOf:
> +  - $ref: common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - maxim,max25014
> +
> +  reg:
> +    maxItems: 1
> +
> +  enable-gpios:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1

Is the interrupt useful for anything?

AFAIK its perfectly OK for DT bindings to describe hardware features the
driver does not use... but is the driver missing out on error reporting
(for example) by not using this interrupt for anything?


Daniel.
