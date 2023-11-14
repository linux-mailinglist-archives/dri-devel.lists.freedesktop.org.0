Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 402457EB4C9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 17:31:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826F710E472;
	Tue, 14 Nov 2023 16:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFDF10E472
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 16:31:35 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-da37522a363so5950633276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 08:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699979494; x=1700584294; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fr9fBrNQghS3PnJBIgxqFuQ3YV89v+EkFP5jOeoN9BI=;
 b=VW3eH1CaG+X+Pep8QpwW82S0ZHabH3Dasw0Mzb2FRu/BPYwskQmLdqll/AcX/jdyL5
 JVEOf8as8SzC0RG0S0ET5OYMY7aQgy/hiXX6bmJPw/PJz/6awpbZAR1x+5u5v++hRH3W
 fQkjW+XSBSCnV+9tkULAnka11snX2YB3ZDf9LxAkM0HGBwQYWgv8HYhXGCW0RCed7ML0
 mhLJ8FVeBVanyZ77SQVQ7aGfyCK8q7jw92SakoE/xwjaa9xuiD/QYZtAbDgXqdsIDUJz
 osmipsHLb/z5By9LafnCOgpl8HzIEhrlQbLq+c8pa68/98LfLP9VeTdo2M7i2Wdi92us
 I4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699979494; x=1700584294;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fr9fBrNQghS3PnJBIgxqFuQ3YV89v+EkFP5jOeoN9BI=;
 b=POcQxblNL/4C+DwhtNTjtzStCQ+lpSoOHcH+zUc4n1qg2cIqrkpfnw6TNnoolsf6iV
 kEfyYFwNbIff/NvZvpXGJFcp+jQk8MXPZNQPx7f4gOBJFdrsMHVSPbyXiO2gytZhD9hK
 3zk1gn0BSAJe3fRlNn5fHN08yws8w1cdeHsVBHw6PWu5OrX3Ce2X3eRuJqwYn6tf8qTc
 WWHmIvWEfHXwnwluUOPLGtNjdQYnUyqpElqSQhmfdBtSiIw52NCdlO1r35eeTXl/Xpon
 Dn5/L5DcJVuW6C1xo15x49w4BgTzcE0iJvwtSpuLN8+yv+g7boB7jrkhq188fUw9nphv
 p7LQ==
X-Gm-Message-State: AOJu0Yxl8SaL5PuwRxTmoHx4XNOHZymIkdrxZL4n8Pi78b5a8If463Sa
 kjgE7NcYZOjsZmBjSvA4IpQ5D9k535xO73mkY+zcjg==
X-Google-Smtp-Source: AGHT+IE5JRixOjxRGUF+c61qIeYY24wdOAvccV78T4FRZCSUWSvo//Cy7fL+VTmLpOHSicQnDTECRUPpp9z3C1BQ8uY=
X-Received: by 2002:a25:1646:0:b0:daf:579a:79cd with SMTP id
 67-20020a251646000000b00daf579a79cdmr7364262ybw.27.1699979494683; Tue, 14 Nov
 2023 08:31:34 -0800 (PST)
MIME-Version: 1.0
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-5-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231108104343.24192-5-krzysztof.kozlowski@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 14 Nov 2023 17:30:58 +0100
Message-ID: <CAPDyKFrynEEd+y6Qkv_9aTSJy1iLO4bhg-Jg8hEP0CZiWnRJ0w@mail.gmail.com>
Subject: Re: [PATCH 04/17] dt-bindings: mmc: samsung,exynos-dw-mshc: add
 specific compatibles for existing SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Jiri Slaby <jirislaby@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, linux-rtc@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 alsa-devel@alsa-project.org, Maxime Ripard <mripard@kernel.org>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-sound@vger.kernel.org, Sam Protsenko <semen.protsenko@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 8 Nov 2023 at 11:44, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
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
> While re-indenting the first enum, put also axis,artpec8-dw-mshc in
> alphabetical order.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

>
> ---
>
> I propose to take the patch through Samsung SoC (me). See cover letter
> for explanation.
> ---
>  .../bindings/mmc/samsung,exynos-dw-mshc.yaml  | 25 ++++++++++++-------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
> index 6ee78a38bd74..5fe65795f796 100644
> --- a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
> @@ -14,15 +14,22 @@ maintainers:
>
>  properties:
>    compatible:
> -    enum:
> -      - samsung,exynos4210-dw-mshc
> -      - samsung,exynos4412-dw-mshc
> -      - samsung,exynos5250-dw-mshc
> -      - samsung,exynos5420-dw-mshc
> -      - samsung,exynos5420-dw-mshc-smu
> -      - samsung,exynos7-dw-mshc
> -      - samsung,exynos7-dw-mshc-smu
> -      - axis,artpec8-dw-mshc
> +    oneOf:
> +      - enum:
> +          - axis,artpec8-dw-mshc
> +          - samsung,exynos4210-dw-mshc
> +          - samsung,exynos4412-dw-mshc
> +          - samsung,exynos5250-dw-mshc
> +          - samsung,exynos5420-dw-mshc
> +          - samsung,exynos5420-dw-mshc-smu
> +          - samsung,exynos7-dw-mshc
> +          - samsung,exynos7-dw-mshc-smu
> +      - items:
> +          - enum:
> +              - samsung,exynos5433-dw-mshc-smu
> +              - samsung,exynos7885-dw-mshc-smu
> +              - samsung,exynos850-dw-mshc-smu
> +          - const: samsung,exynos7-dw-mshc-smu
>
>    reg:
>      maxItems: 1
> --
> 2.34.1
>
