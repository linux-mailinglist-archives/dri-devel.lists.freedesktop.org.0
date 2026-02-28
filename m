Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLzkOjH1ommG8QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 15:01:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED431C3695
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 15:01:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3137310E2AF;
	Sat, 28 Feb 2026 14:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tuxon.dev header.i=@tuxon.dev header.b="hW/AeDzw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D38510E2AE
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 14:01:17 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4836f363ad2so34466805e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 06:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1772287276; x=1772892076; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RS6B8HKz3lfStaChpHPRyrCXmTOfflogCUXEfzC9Seg=;
 b=hW/AeDzwr8VVVIXdXEXp1+DgXX2+p4QdyIm79cmanGUrWa36CdjD4qG9n7jsja+/8i
 x16gP5zbkSS7gGdrOyueGw3YYdnudsIqPCWabZ5w9fzZhHYW9uoY/zsH/+HyGyrxOlvC
 /i6b4KEOexCxcwZ4lnhBexbQorhG5T5Vz55hHXBYX8WAeL9bbKhxNq3buJvUq8u4RB5A
 6FhkyXCITRR1gY75eQCvyB72x1pK5vXNTmZDMECXbQY9a9ugWun1AUPUsW+5Kt9KeGu1
 RTnQBzwieztHjTNn7KKX4XB8RPeKFkwWcjqIwaiPkdENG5mHzaYbDfFTN37pOmNe8VSZ
 cq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772287276; x=1772892076;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RS6B8HKz3lfStaChpHPRyrCXmTOfflogCUXEfzC9Seg=;
 b=kMNA9iR2zg6bQRTXKxLBOwaOCBPb5bPkEcTEjvU7jCl5CIk3uyfMRGfPFFGWaE5Xhm
 EbXNprTB4ysrPqBi9Zo57ogLEPsopg18l25DfNcV18IkgdCE9mv9LGHhBajprtIOGvPL
 LvSSQzxzg8CAi9cmGYfCGdPgXlDTvu3JovEHGfLYRkECizY+PSrKYxgKb7TU1hhfMymk
 scEjbECMGrpbmYqNKu7Zasu0ym+d9QW/6T2DRExd9Bxyx2nZJj+z9HFlfl8UF/dredh8
 M709Es1u1HgDN1cSG365Vr+I9tURtMJeMc5++PqtXNWcALufy0T0M7HgKihymY9j3nW0
 +HVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsKcrZGy8mhy46I2x5ZZ/tSkhTVJtL26Ovg3OqEKqp1WvodypnJ7E1vdcm3AiMlG43ilsSV4z52gs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0yjmvaCC0fL69fY+ERNKheDBCgq8UpWNS5ApFdJTj1D/9NStr
 W1JLcOXbCzGQC8O1xB5uqXqoyuubDZO/+6hVZL/LeDxkAB0KrteU6WNNs3deT9kSYx1J4+9zXkB
 EXe34
X-Gm-Gg: ATEYQzwJhStp29PB1GI6debEnPiM7iS4c/qjb4IH82HzuzPLQL0BWTX9FuPqRwdkjVP
 yH0thniUGwIC3vPwVHc8bGPSa66kH/1wekevN7+v/9wHsnvRPyWX4OOXS9uRSQ6lZuy/n/ojiA4
 Actu2dVRf7okWdpkqCbzXsQpJQ1QYcngNLBJf3XN4qQP6v0GomvHz2+uNO+uwHeniLK9qGmWtqk
 lOv6hbriElzHCps5T6w5F2QQ2GtPHyiqQWKj5wQEmFhKr2aArigEI+XTzoTYaxCCBMrJKuYZbBD
 gKqpYRYI8taDFcva65sO39zNysMcf5tTv5c6H3sk4eloAXx6wy4arJKc5ou0ifXBppHRW9cI2Xh
 r3Myn59rkQdItiqgmrg9F83UfM8grtz527S5LEnWU2hfofANVQusW6CC7dLuV4qiPzMxNs2v84g
 wzx7Sj05rN3b/blYHaAYbCi4BKJxo9pHt41HGCyn6k
X-Received: by 2002:a05:600c:3108:b0:483:709e:f238 with SMTP id
 5b1f17b1804b1-483c9c1d177mr99483705e9.29.1772287275961; 
 Sat, 28 Feb 2026 06:01:15 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.73])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd765604sm246812765e9.15.2026.02.28.06.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Feb 2026 06:01:15 -0800 (PST)
Message-ID: <0e2b745b-c76d-4b53-b5fc-9991c943e603@tuxon.dev>
Date: Sat, 28 Feb 2026 16:01:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] ARM: dts: microchip: sama7d65: add LCD controller
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 linux@armlinux.org.uk, ebiggers@google.com, martin.petersen@oracle.com,
 ardb@kernel.org, tytso@mit.edu, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Ryan Wanner <Ryan.Wanner@microchip.com>
References: <20260225085430.480052-1-manikandan.m@microchip.com>
 <20260225085430.480052-2-manikandan.m@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260225085430.480052-2-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:manikandan.m@microchip.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:linux@armlinux.org.uk,m:ebiggers@google.com,m:martin.petersen@oracle.com,m:ardb@kernel.org,m:tytso@mit.edu,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:Ryan.Wanner@microchip.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[tuxon.dev];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[claudiu.beznea@tuxon.dev,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_TO(0.00)[microchip.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,bootlin.com,armlinux.org.uk,google.com,oracle.com,mit.edu,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,tuxon.dev:mid,tuxon.dev:dkim,tuxon.dev:email,e1400000:email,microchip.com:email]
X-Rspamd-Queue-Id: 4ED431C3695
X-Rspamd-Action: no action



On 2/25/26 10:54, Manikandan Muralidharan wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add support for LCD controller node
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>   arch/arm/boot/dts/microchip/sama7d65.dtsi | 26 +++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index e21556f46384..b2fe76115aec 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -278,6 +278,32 @@ sdmmc1: mmc@e1208000 {
>   			status = "disabled";
>   		};
>   
> +		xlcdc: lcd-controller@e1400000{

Missing a space here -------------------------^

I can adjust it while applying.

Other than that:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> +			compatible = "microchip,sama7d65-xlcdc";
> +			reg = <0xe1400000 0x2000>;
> +			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 56>, <&pmc PMC_TYPE_GCK 56>, <&clk32k 1>;
> +			clock-names = "periph_clk", "sys_clk", "slow_clk";
> +			status = "disabled";
> +
> +			display-controller {
> +				compatible = "atmel,hlcdc-display-controller";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +				};
> +			};
> +
> +			pwm {
> +				compatible = "atmel,hlcdc-pwm";
> +				#pwm-cells = <3>;
> +			};
> +		};
> +
>   		aes: crypto@e1600000 {
>   			compatible = "microchip,sama7d65-aes", "atmel,at91sam9g46-aes";
>   			reg = <0xe1600000 0x100>;

