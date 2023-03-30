Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 330FC6CFCF7
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109D010ED13;
	Thu, 30 Mar 2023 07:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF77510ED13
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:38:02 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id k37so23421813lfv.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 00:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680161881;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zhmKb3uPIySGSXJ0VGQ911OR/xB/9Nx7pg9TyzMCVlk=;
 b=frTws3sj1H6l/pBsB9Acr718ABKu/SQSxqUUx1gmdpn9apoilq7bpSJNWyzr3PaIZC
 34MkNQ3DV+pD1t1mYjS5zAfFuA6LwFUKDu2ptcVybBhO/1vQRZq7rCQiPylk4zMrOKq3
 7m9LdXOwvktrvWWZSQmGK/qtb2Qp0o+1n4zvH6McKtYYSm/k05IrYLFlNs8JahbH8oh8
 IUP3En4IbWJtDeSbvwdTPJirMkLzTj/aHonbstBhp7eHVGVvP3pTMuTYBw+k4bj5oymj
 pB9IckDs3W3KYBMxzFDL/SHh0mxyUEhDxl6RB2MkXkQzxyT23PYSv62E81obmlIZshKK
 GTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680161881;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zhmKb3uPIySGSXJ0VGQ911OR/xB/9Nx7pg9TyzMCVlk=;
 b=HcEIsKFfd+dYGZ8xCGw4uCPZQVJTIPaCMJcXTGo4WqtqZ57TqxFkjaYpV4AjqdvdoH
 3fpfOmZlHv34x+oL74RY13ntVUUEE2Ulon+W668ONpKKliq7RJ2HQmn0wxrLg0q+EOoZ
 UuN9Z8cBUy2cX776niJzMv7qNiNvg0cC8wQkX8R6raCtA8uoCsK6KEMfn2I2AfDc5XHV
 ZauzNeHE2PxZ1OEZpVxkv4sEwRwbG5NH6GAnfLNutLuHqfC7ulvt/qBQ6j7iTLhvU9uj
 e6YvX5eoSr7SA1uLyQPuhQk1kLrK4126Bz+uTY61C7OhmfcPwpuSBmXly+kTqiIfF7zz
 AG3A==
X-Gm-Message-State: AAQBX9fsrHyGBkbWJvzivk43w5v3ED+ycwd9Zn7AxlGdoy0i5TFGchn3
 Fxq3SINDl8uSxU2fTuNn9pi2Rg==
X-Google-Smtp-Source: AKy350ZxUHzZgnTyodewFPy9tQt2p3eJU7SVhctNmCZ6gXVpL2MSzIJw0Eg8j/gZkXcFIPUMapU1bw==
X-Received: by 2002:ac2:5218:0:b0:4dc:828f:ef90 with SMTP id
 a24-20020ac25218000000b004dc828fef90mr5809497lfl.59.1680161881092; 
 Thu, 30 Mar 2023 00:38:01 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 n7-20020ac24907000000b004e85f7ec749sm5737260lfi.117.2023.03.30.00.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 00:38:00 -0700 (PDT)
Message-ID: <ff66c8b9-c7f7-1eb2-c730-4812b7ff6824@linaro.org>
Date: Thu, 30 Mar 2023 09:37:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] dt-bindings: display: exynos: dsim: Add
 'lane-polarities'
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>, neil.armstrong@linaro.org
References: <20230329144155.699196-1-festevam@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230329144155.699196-1-festevam@gmail.com>
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
Cc: marex@denx.de, devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jagan@amarulasolutions.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/03/2023 16:41, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The Samsung DSIM IP block allows the inversion of the clock and
> data lanes.
> 
> Add an optional property called 'lane-polarities' that describes the
> polarities of the MIPI DSI clock and data lanes.
> 
> This is property is useful for properly describing the hardware
> when the board designer decided to switch the polarities of the MIPI DSI
> clock and/or data lanes.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  .../devicetree/bindings/display/exynos/exynos_dsim.txt      | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> index 2a5f0889ec32..65ed8ef7aed7 100644
> --- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> +++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> @@ -29,6 +29,12 @@ Required properties:
>  
>  Optional properties:
>    - power-domains: a phandle to DSIM power domain node
> +  - lane-polarities: Array that describes the polarities of the clock and data lanes.
> +    1: inverted polarity
> +    0: normal polarity
> +    The first entry corresponds to the clock lanes. Subsequent entries correspond to the data lanes.
> +    Example of a 4-lane system with only the clock lanes inverted:
> +    lane-polarities = <1 0 0 0 0>;

First, please convert to DT schema.

Best regards,
Krzysztof

