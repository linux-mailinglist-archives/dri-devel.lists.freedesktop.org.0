Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB4767586D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 16:22:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F73810E0F4;
	Fri, 20 Jan 2023 15:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370F010E0F4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 15:22:14 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d2so5141049wrp.8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 07:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=e66wvT2cYhyX/VhocVEC2K4AIk/Eq3siPRf4a8anMOs=;
 b=MJOd3jW56sN+TtE2GfOLbP+U5xkl3RdCC9kDkRCaN7L7kCAMl1EzJg5j0QN/gPTxV5
 D2e3NaNE14+9Gw8lr0KHI4UR5WHy5Nawzg/ozemBWkNFUyGwVenKcx5cYpQUzedWFZWn
 lyn7FvPVoaFjx3+/M1CB71dYdgTzWFBzzNh5kvHSqCP4m1LHGItjhrR8gn9NmnCzzeS4
 3Y4guUqLEFAUhyDHeekzwLPhLvMM7LBCWNMDp3PaaBpROay90Hyv2fOI+KNK6EBSS0gj
 XqTlmEeCoG8qbwQNUyiQfc9EtsXw8AFlpWZCUHSTOPtHDD4N2q5sRp/bkxI4KBbgaZyI
 a3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e66wvT2cYhyX/VhocVEC2K4AIk/Eq3siPRf4a8anMOs=;
 b=Ne5hVMXMTBeql23Hhb9TysQpfEfQP4Voukl1v7rkh6vmCntjloheKqCCQblJ10JFiz
 3udQ8uMRgj69T9Zdt4UYbzKVp3yfuTjziNQ/DhaszxZwoJ/JFn2yIDl/N2qk1IOiAdd2
 p7sVkwj4H2wrVoNv5MjtoHeQ+i7x62u1mh7WPzUvrPSX95MrtW52cG2bq64QTywmHMvF
 mN4NI1b9HQsmM2ej49GlEfWYMGMw5YkRkz2MVFO6p8msGQDfKy+ITe4YI9PI8TeOT4mP
 9NNF33tnGqVAkukhEnOSmAtIYAUW9fuoNBRF8EA1WqJF4qU1hHJJ1vBjbi4mFaoIVLsr
 C72A==
X-Gm-Message-State: AFqh2koQb82K6dzd15l8DuXy52TwSQ1bWMePWI9xbZzGBINfQSDXQSjD
 kLpv0pidd13a1e9V3PwQyr84aVnSKkWjkib9U24=
X-Google-Smtp-Source: AMrXdXuOgJzWPQP060GD7ksOJ6DOg0wj3Av/2do2thSt0DkXEk0SqqqCOrzxE0k1EEUYd4bwLeOnoQ==
X-Received: by 2002:a05:6000:1c0e:b0:26f:6bf:348f with SMTP id
 ba14-20020a0560001c0e00b0026f06bf348fmr10175721wrb.6.1674228132480; 
 Fri, 20 Jan 2023 07:22:12 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 j14-20020adff00e000000b0024cb961b6aesm35433341wro.104.2023.01.20.07.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:22:11 -0800 (PST)
Date: Fri, 20 Jan 2023 15:22:09 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jianhua Lu <lujianhua000@gmail.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: leds: backlight: Add Kinetic KTZ8866
 backlight
Message-ID: <Y8qxofrfiQbRmsGZ@aspen.lan>
References: <20230120094728.19967-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120094728.19967-1-lujianhua000@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 20, 2023 at 05:47:27PM +0800, Jianhua Lu wrote:
> Add Kinetic KTZ8866 backlight binding documentation.
>
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> [...]
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> new file mode 100644
> index 000000000000..b1d0ade0dfb6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> @@ -0,0 +1,74 @@
> [...]
> +  current-ramping-time-ms:
> +    description: LED current ramping time in milliseconds.
> +    enum: [2, 4, 8, 16, 32, 64, 128, 192, 256, 320, 384, 448, 512, 576, 640]

This doesn't look like it goes low enough (wasn't there a value lower
than 2?).


Daniel.
