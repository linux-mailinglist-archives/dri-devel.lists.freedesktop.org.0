Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9A99D9349
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 09:27:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CCA510E7E9;
	Tue, 26 Nov 2024 08:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V/9nhKi/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4181D10E12A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 08:43:34 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-7eae96e6624so3256727a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 00:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732524214; x=1733129014; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pI8BQQ/T5SVzIWF61zZavJ6P7DIvRK0aGvjhr4khLmI=;
 b=V/9nhKi/XvLBX4GKFss+YYpBuzEUzT5jGYhdJinv26iy19bptwNaiVY/V624dOhToG
 fcm/n3pI+rd+a08wTHgRmZJyM1Sg86jNNrYHaZJeU+EOwj9UUThhL2Za8o1ZP6CtuKkJ
 PAJ0O5si3nQPi4WH1kkGG4Ggf92XbCaZn7PfkASsNQCm1UtbH0meFcbhLREg5B8ZNCZ4
 7fEIIDy69lHiST/PuEiK9NWNhZATAgiUZdNrGfcwW89Hxxzpry09xEbT+HYuIb26piNu
 VYvkRKrXhN3U3iWi3d3wQpszHrFGn9BEXV5nkEYk40RyuNd2hqHC6ZVyLkzODpYCx8kF
 93Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732524214; x=1733129014;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pI8BQQ/T5SVzIWF61zZavJ6P7DIvRK0aGvjhr4khLmI=;
 b=HuWyqt6V28j7N+pUU6c99yT0WYztyQm8hQ8tjk79K31VH0pmVmVVtKO4/C5CzINhx/
 GM231PFLqp2r1+dJTMvmAOPyupB5qYA1yCwQsR6S03hhbvss8hVHmWjaiHlL8BTB2zoN
 t1uERqE9cyMU0iDvF4l6+2/Zn7Re4bRgGIbefpyLdPVB3G4F0tiXGUcztSJk0w/usm8l
 cJq02d0Cs0wh+S4JWPtIOU9kz0LakLcVxBFMamFKZyRvfNw+WPErNhY1YNNj0sNynYyJ
 Mp0oRClh+OnA+2VflJk21ICyxyWgxCkzFunXInyne+Ns7Gckx+RWRb2iWx6nKyIRAT8r
 FnLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJfx/D91Sx8bP3ZSH3WpR1k+DbzllXG2l9e7LzzgwbiogNTDNs9+iWis0gfOrI0ijWSJ7MCfZaExE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGYXcNAd51QHnI6dSjFDO0b5ffwiRT8zlm7mwXQl25rvsFGC4s
 I9WPFSZwACpAgzhvAJHotXSQOhuUUP07u3TIBiyTq26a5Sxs96A9
X-Gm-Gg: ASbGnctPuiybwWyw0LJVMYZ8q8mLt0mNvhWbvbibBxHR6U4X9CWfu5qpND5ESfNO/L2
 q2yalbmYbKDK7iFOF8vBKAKdpSdleQOopc0GcyUIHBJTvMELazLIcugItwKfTR9nrpxclfRNXSs
 hgIG1TB14iWHlEJz+F1hWkEuKb4LUcLAQCFzXhw17oQFY59CXZ4OOaClh93f3ndl+nqyFXMVl53
 EimTdpmgT8a9XncZPQ5oMaAf9va9C7cH6/H+nAtyS50fnN+LdqGP9cX9Ho2Pnhuo5wN
X-Google-Smtp-Source: AGHT+IGhgxcXQ0ft9/Za4vorVCq/dkomo2GMsbGwiP5RlHt6aZtAoqt6aKppLpP3grbtnbLAwPJzMA==
X-Received: by 2002:a05:6a21:7881:b0:1e0:c92a:c838 with SMTP id
 adf61e73a8af0-1e0c92ac9e8mr5471906637.35.1732524213648; 
 Mon, 25 Nov 2024 00:43:33 -0800 (PST)
Received: from [192.168.0.115] ([59.188.211.160])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2129db9fdd5sm59524145ad.58.2024.11.25.00.43.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 00:43:33 -0800 (PST)
Message-ID: <4a3c832b-0c8d-4487-b1bc-122450a57516@gmail.com>
Date: Mon, 25 Nov 2024 16:43:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: apple: Add touchbar screen nodes
To: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Janne Grunau <j@jannau.net>
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-4-3191d8e6e49a@gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20241124-adpdrm-v1-4-3191d8e6e49a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Nov 2024 08:26:46 +0000
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



Sasha Finkelstein via B4 Relay 於 2024/11/25 早上6:29 寫道:

[...]
> diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
> index 1666e6ab250bc0be9b8318e3c8fc903ccd3f3760..726b11376692580abb129b9be35107bee1550a93 100644
> --- a/arch/arm64/boot/dts/apple/t8112.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8112.dtsi
> @@ -379,6 +379,31 @@ cpufreq_p: cpufreq@211e20000 {
>  			#performance-domain-cells = <0>;
>  		};
>  
> +		display_dfr: display-pipe@228200000 {
> +			compatible = "apple,t8112-display-pipe", "apple,h7-display-pipe";
> +			reg-names = "be", "fe", "mipi";
> +			reg = <0x2 0x28200000 0x0 0xc000>,
> +				<0x2 0x28400000 0x0 0x4000>,
> +				<0x2 0x28600000 0x0 0x100000>;
> +			power-domains = <&ps_dispdfr_fe>, <&ps_dispdfr_be>, <&ps_mipi_dsi>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 614 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 618 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "be", "fe";
> +			status = "disabled";

Forgot to add, status should go after other properties here as well.
> +			iommus = <&displaydfr_dart 0>;
> +		};
[...]

Nick Chan
