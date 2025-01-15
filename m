Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A698A12598
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 15:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001B210E504;
	Wed, 15 Jan 2025 14:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jte3bF7z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93AB010E04B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 14:08:50 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-21628b3fe7dso117185405ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 06:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736950070; x=1737554870; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5vCPLadSTG0XNEadulJx4woFN95JwHE+lHWPlfdFjqo=;
 b=Jte3bF7zgDgMdipXlUTRBoS9dnK1ydTfRKyYFkAecezNzHu0AaxkV70/bdx0NRppqB
 W0FtPztKYDglrje8Ds4Lw8BkeCSP93w4N0DejRYiYxztQTvfsXUcuHPirI0XmOfFN0dU
 Jr3MNqBhfblqUhelIitO4HAl++T8F6pJ/VAUmTpLBb5s70oqy4n+C2HQbDqWqaqTqA6I
 mae5CIA4e3Cq9LBXNkPGkkAkrfLs68BPv3ZfKedjsal9EEshGoio7lrn5ZPnNzzT2BJu
 s2xoef/JMmK9fp8M9/3gfOz1Qkea+tORK++kWoXxVh8Osnd96yyS0zUMb8fKo2xwbcfX
 vlzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736950070; x=1737554870;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5vCPLadSTG0XNEadulJx4woFN95JwHE+lHWPlfdFjqo=;
 b=gd6/zQCY5YHWGoQthpjKDp+5E8ZBGtbRUeAJ0jVLp9Ql6ggbZn7rLnRwOTSzHvsTlQ
 hywH1EsUr56/D9ko52kZBTkLFNQ+KvipHL0djNJ5TJbs0ytt7dbtDsBIlNvIDqxCAvPV
 M+hqo5OwcTYFQsxrgbQzkxC+7hDJ/CAdCYZwBVUPgIRcsYImN9068A081peciVWxINMW
 kMkGrXkEZEMRGZxYJq3S2r08FqA4fkWHkugih7HZx3YkOLwGupISEWOtSqBIwRVK1kYt
 C+wdYP0nlD+jrt9QOpKPwb2V18n+aYxYkwNerRXOFXFD3bY1UySUeAZzCNfwqUhBNxBa
 S1bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV//Xf8t3ytR2dfZOMDE25Y6fKnbWAoRqtGULqf9T3MABBBBCzXYtgqbllGXWwxIcB0L2rw+O6P+pQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcB8iPHVzcm+OukIDSVP3Df8wpv28yh7qSevTahlmez0ztPaON
 G9IgtyACHbtAgT5Q4pXjHdia+NSwaQDmdzRtMY8ZYoIUvYVcCJgy
X-Gm-Gg: ASbGncuYu7mHe3lKNkgD0IPJZkXmdDswLxvIL5RIApcqv3ieXv97uETfB1DaPU7AXJM
 wB7AS1ABdlKpfMao5Kjw0blMiVGT2sz3FghQOGcaGbXOrLf/wYcwfS9UEgEhgg4xuMaefnhq1sE
 DN4tB6G4ujR1Lyu6sSnmHAzMXJVC6buymji1tJwckDMUUZ6Kxw66DoIJ9NO1TmgEcWodbA+KXt3
 ClnrxE5Gn4beRJp6mTJKq2J/uNt/cxL6ZSclVJZxzJI5u0NHNrki0bNbNmeXFhH
X-Google-Smtp-Source: AGHT+IEOHm6oG8q2/VBX+YnEUddFnG0FmgHB02S4iMBT+29EuCT2i15IMPwhfxsK6EdgDfF5iHJflA==
X-Received: by 2002:a05:6a00:368d:b0:727:99a8:cd31 with SMTP id
 d2e1a72fcca58-72d21f47fc5mr39933032b3a.14.1736950070133; 
 Wed, 15 Jan 2025 06:07:50 -0800 (PST)
Received: from [192.168.0.116] ([59.188.211.160])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-a317a07cce2sm9929464a12.4.2025.01.15.06.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 06:07:49 -0800 (PST)
Message-ID: <00863806-d481-44a1-b97f-ead0fc6f9581@gmail.com>
Date: Wed, 15 Jan 2025 22:07:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] arm64: dts: apple: Add touchbar screen nodes
Content-Language: en-MW
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
 Alyssa Ross <hi@alyssa.is>, Janne Grunau <j@jannau.net>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
 <20250114-adpdrm-v4-4-e9b5260a39f1@gmail.com>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250114-adpdrm-v4-4-e9b5260a39f1@gmail.com>
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



On 15/1/2025 05:38, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Adds device tree entries for the touchbar screen
> 
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  arch/arm64/boot/dts/apple/t8103-j293.dts | 31 ++++++++++++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi     | 60 +++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112-j493.dts | 31 ++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112.dtsi     | 61 ++++++++++++++++++++++++++++++++
>  4 files changed, 183 insertions(+)
> 
[...]
> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
> index 9b0dad6b618444ac6b1c9735c50cccfc3965f947..9b088f74e0cb9f42fbc8df822fca6451dcd1b717 100644
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> @@ -356,6 +356,66 @@ cpufreq_p: performance-controller@211e20000 {
[...]
> +
> +		displaydfr_mipi: dsi@228600000 {
> +			compatible = "apple,t8103-display-pipe-mipi", "apple,h7-display-pipe-mipi";
> +			reg = <0x2 0x28600000 0x0 0x100000>;
> +			power-domains = <&ps_mipi_dsi>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";

Missing empty line.
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				dfr_mipi_in: port@0 {
> +					reg = <0>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					dfr_mipi_in_adp: endpoint@0 {
> +						reg = <0>;
> +						remote-endpoint = <&dfr_adp_out_mipi>;
> +					};
> +				};
> +
> +				dfr_mipi_out: port@1 {
> +					reg = <1>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +				};
> +			};
> +		};
> +
[...]

With that in mind,

Reviewed-by: Nick Chan <towinchenmi@gmail.com>
