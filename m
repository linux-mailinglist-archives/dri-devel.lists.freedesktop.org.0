Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D341A9828
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 11:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAEC6E926;
	Wed, 15 Apr 2020 09:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BCB6E926
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 09:15:29 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id r24so2868924ljd.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 02:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=69T9ZGqlIy7aImGgwrs75/hfGvsilwincFfwWiQFobg=;
 b=QmYfPFaxi91fzgnYBmzUnbNLZxOG0Qvv9XHtQXYm/D+sTky/Yc25iONfxBlY/7wqsB
 fRtQYUCgyxgK4p3vjoCdR1E4K1nsTfSz3bWGNyVBA7FGlzJ7W7xAZUor5i5MsgsA0hU6
 1sVmcbUlUP1cDxtb+3jC+HIaRfadnrNzRFcNUoV22EicSEE5dlVf6RJieO6E9yC3PemP
 qMb4hRiVMAXxE1MiwCuSopLulXmT+VCKUbpRSEH+BCrvLMZ4tKOYKabhdtdCWnXgNuRk
 9lpcy+vti6/lVgJJk2gVDZg/BOarCjaD0Ak6NlGy7RcdUdyYk3SImWtP+7AMtEZqo2NA
 +piQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=69T9ZGqlIy7aImGgwrs75/hfGvsilwincFfwWiQFobg=;
 b=SksDefeozySv7WKqLLEmlyDU6IUNCUMatoegsbuRUWdo3e3mT74xFGPjIK1DcsNLJ1
 9DHzv7DBJEHA6T9W6VYXSrGoApD3X/c0XM7YQloysLWGGAP8txzNLE/MPsxt8ODYA50p
 3racyPNFc2yGHEgKA9xj7JaFIxUMTuMpIDcsPVeKiO+i0nHZ+DW9qhQAT6/vbKKi/ri+
 yF0mITanbDrcIfhe6zPtMWHXc3aEOr8U3LU0IWSPsxFB0nOMn8jh6IbYY2ec9uENOLsw
 EsLQfi+VPYINJFpqW5YwtkJHxpqwwtasr8Tnk8FIWHg0YI/KJLMZ6PTmmNg4B28Zqmw9
 rPew==
X-Gm-Message-State: AGi0PubOqnIgQyF6M+krFIF72sOScrhfIz7FmmcPafOnaNpH3GfrZ14A
 gvjgtRejOaaeDykx1JUy4+vZAw==
X-Google-Smtp-Source: APiQypJt4bgg1yrZutHX1jnCNUTiEGk5PA6dcO1xYRoqGEwzcnoywOgKJNgJRfEssnCyTOQijG6tmA==
X-Received: by 2002:a2e:6c0a:: with SMTP id h10mr2542581ljc.195.1586942127891; 
 Wed, 15 Apr 2020 02:15:27 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:81b:6e8d:a1dd:9870:4166:dead?
 ([2a00:1fa0:81b:6e8d:a1dd:9870:4166:dead])
 by smtp.gmail.com with ESMTPSA id m13sm12192031lfk.12.2020.04.15.02.15.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 02:15:27 -0700 (PDT)
Subject: Re: [PATCH v6 08/12] arm: dts: s5pv210: Add G3D node
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Paul Cercueil <paul@crapouillou.net>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <cover.1586939718.git.hns@goldelico.com>
 <b6733f80546bf3e6b3799f716b9c8e0f407de03d.1586939718.git.hns@goldelico.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b6ffa74a-acef-f329-0d9e-981483499e16@cogentembedded.com>
Date: Wed, 15 Apr 2020 12:15:17 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b6733f80546bf3e6b3799f716b9c8e0f407de03d.1586939718.git.hns@goldelico.com>
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, letux-kernel@openphoenux.org,
 Philipp Rossak <embed3d@gmail.com>, Jonathan Bakker <xc-racer2@live.ca>,
 openpvrsgx-devgroup@letux.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, kernel@pyra-handheld.com,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

On 15.04.2020 11:35, H. Nikolaus Schaller wrote:

> From: Jonathan Bakker <xc-racer2@live.ca>
> 
> to add support for SGX540 GPU.
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>   arch/arm/boot/dts/s5pv210.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
> index 2ad642f51fd9..e7fc709c0cca 100644
> --- a/arch/arm/boot/dts/s5pv210.dtsi
> +++ b/arch/arm/boot/dts/s5pv210.dtsi
> @@ -512,6 +512,21 @@ vic3: interrupt-controller@f2300000 {
>   			#interrupt-cells = <1>;
>   		};
>   
> +		g3d: g3d@f3000000 {

    Should be named generically, "gpu@f3000000", according to the DT spec 0.2, 
section 2.2.2. It's either "gpu" or "display" TTBOMK...

[...]

MBR, Sergei
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
