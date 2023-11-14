Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C547EB365
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 16:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E57D10E44D;
	Tue, 14 Nov 2023 15:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F203D10E44C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 15:21:55 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-5842ea6f4d5so3630734eaf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 07:21:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699975315; x=1700580115;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J15sEa7zSm5u7jaEkjftn3VCZWspXJk6JRoiiJKaDmk=;
 b=wPGVMGa8fEaipVEnlhrfrShvCbQO8QpQs5B3KxXGyD5PYrEuOd8/OdWbfzAzbCPfwA
 60Tgoq2wYKudrILOZisRYohjywvWW5tAJ3wnbVf00M2qK9I2dsKJ024O5avvb1xT9Yc0
 OKMhJG3C4x4uipB8yYVzZs0+RYhf3kWPJp01bjbHy/wm1d2ppiAaz1DTt9P9c8P5WE5l
 /0X1m5ImRI86I6Kxjs4iuH60lEVhhheyIfSonRt5barmETKtJtJZKGtJTRQhjqL8lNNE
 MzPnuKSU/WLkv054BRRS5bm/MpZ/GBwQ/dM9Jp12x2AFzMX4p8YDJvS12LPc7lI4Cxu3
 HKyQ==
X-Gm-Message-State: AOJu0Yz/PImtoJ5ri/ZX2tu66sPHSD6JOXZUDmCvBaYKpcscaOwQDLcS
 aCuOON1gJ085JCFmqEt+pw==
X-Google-Smtp-Source: AGHT+IHMXoKiyNylaIR+nukyu3BetutomYr9uKiRQo/BwHNE+zS/4TczHyQs3K2bQgl/iosqC+11wQ==
X-Received: by 2002:a4a:b588:0:b0:58a:67b1:47ca with SMTP id
 t8-20020a4ab588000000b0058a67b147camr2790634ooo.6.1699975315188; 
 Tue, 14 Nov 2023 07:21:55 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 u188-20020a4a57c5000000b00587bf56d2desm281035ooa.26.2023.11.14.07.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 07:21:54 -0800 (PST)
Received: (nullmailer pid 1872956 invoked by uid 1000);
 Tue, 14 Nov 2023 15:21:53 -0000
Date: Tue, 14 Nov 2023 09:21:53 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/5] dt-bindings: gpu: samsung-rotator: drop redundant
 quotes
Message-ID: <20231114152153.GA1704371-robh@kernel.org>
References: <20231112184403.3449-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231112184403.3449-1-krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 12, 2023 at 07:43:59PM +0100, Krzysztof Kozlowski wrote:
> Compatibles should not use quotes in the bindings.

Unfortunately yamllint skips checking these due to a bug handling 
bracketed lists. There's an open issue for it[1].

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/gpu/samsung-rotator.yaml         | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>

[1] https://github.com/adrienverge/yamllint/issues/516
