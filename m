Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE927F8F23
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 21:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21EE910E042;
	Sat, 25 Nov 2023 20:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEAC10E042
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 20:48:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 87E12B83459;
 Sat, 25 Nov 2023 20:48:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 487CBC433C8;
 Sat, 25 Nov 2023 20:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700945313;
 bh=MP615DG3faCXFei6ez6/qbJ2Qn+AxlK3zXjwrEKNgcs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V3H6UDq7A3kCMLfHpZpSX7FXfzHuWMOtsplTH0sNtXsZgArz+P0U4eBCtxi3NSFFd
 /Qh78hVGqFA0WqXtaEMTLiv8fodY0nCNwQemnzy2nkPIc8A948DHrbP8ShAHXs9JEh
 DZSd65o2b/ffSmFfCaSmhQJlMgtpbBWoxv52RCHkCAWexYJeYwHrGLN9suMTTHOnuk
 DdSGqivh1nxdaSurglxzzB29rEdm+mzoC6D5xHsCr4gfSyRMDlvOZaKdKmw5u63wzf
 fjwHu1uh7qGvuEyyEExZqT+BueoGfafWluF3pHxDvInU7XHZpnYl45oF6XMQNbYQcP
 bHLD2kxsjKD7g==
Date: Sat, 25 Nov 2023 20:48:14 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 10/17] dt-bindings: iio: samsung,exynos-adc: add
 specific compatibles for existing SoC
Message-ID: <20231125204814.10fe16fa@jic23-huawei>
In-Reply-To: <20231108104343.24192-11-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-11-krzysztof.kozlowski@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Jiri Slaby <jirislaby@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, linux-rtc@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 alsa-devel@alsa-project.org, Maxime Ripard <mripard@kernel.org>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-sound@vger.kernel.org, Sam Protsenko <semen.protsenko@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Nov 2023 11:43:36 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> Samsung Exynos SoC reuses several devices from older designs, thus
> historically we kept the old (block's) compatible only.  This works fine
> and there is no bug here, however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:
> 1. Compatibles should be specific.
> 2. We should add new compatibles in case of bugs or features.
> 
> Add compatibles specific to each SoC in front of all old-SoC-like
> compatibles.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> ---
> 
> I propose to take the patch through Samsung SoC (me). See cover letter
> for explanation.
> ---
>  .../bindings/iio/adc/samsung,exynos-adc.yaml  | 29 +++++++++++--------
>  1 file changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> index 582d0a03b814..4e40f6bed5db 100644
> --- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> @@ -11,18 +11,23 @@ maintainers:
>  
>  properties:
>    compatible:
> -    enum:
> -      - samsung,exynos-adc-v1                 # Exynos5250
> -      - samsung,exynos-adc-v2
> -      - samsung,exynos3250-adc
> -      - samsung,exynos4212-adc                # Exynos4212 and Exynos4412
> -      - samsung,exynos7-adc
> -      - samsung,s3c2410-adc
> -      - samsung,s3c2416-adc
> -      - samsung,s3c2440-adc
> -      - samsung,s3c2443-adc
> -      - samsung,s3c6410-adc
> -      - samsung,s5pv210-adc
> +    oneOf:
> +      - enum:
> +          - samsung,exynos-adc-v1                 # Exynos5250
> +          - samsung,exynos-adc-v2
> +          - samsung,exynos3250-adc
> +          - samsung,exynos4212-adc                # Exynos4212 and Exynos4412
> +          - samsung,exynos7-adc
> +          - samsung,s3c2410-adc
> +          - samsung,s3c2416-adc
> +          - samsung,s3c2440-adc
> +          - samsung,s3c2443-adc
> +          - samsung,s3c6410-adc
> +          - samsung,s5pv210-adc
> +      - items:
> +          - enum:
> +              - samsung,exynos5433-adc
> +          - const: samsung,exynos7-adc
>  
>    reg:
>      maxItems: 1

