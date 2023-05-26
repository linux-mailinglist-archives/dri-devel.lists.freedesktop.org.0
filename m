Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7BA7124CA
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 12:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F52B10E1BE;
	Fri, 26 May 2023 10:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3490210E1BE
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 10:35:32 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-30addbb1b14so14002f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 03:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685097330; x=1687689330;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nBqku5q9vZ6Xc8ZaZQnGRftVBfKjrmfStPvoq/Z7tIE=;
 b=smTVu85CUKKohcCM2dZok368NM60if6zrxbJOJps1F1bJe9WsF6ZMP9AKyWLYKyR2c
 FvFdAH4nZbStiwbdSje5qJ62m1Kg2b5XtOu7XtCd5NmXXcQabQPO+bBUlJbDAK1z7uSi
 c353VExyqov5R5cn6Sj2mpS45ggaPoATZkdeeTuekTZgBC/BjYWo9DHcZ+4HVSbDqiXX
 8BU/BFg5PGdzFXmH1XmGKjC/gnKbdfO123jEYaGG1cVca4F7DZ0Fq2Wb0Lh3CM4IxQw/
 1NA5mnOjuuElJAuKP2duGE/NLnQUAi0z10IuuipjreNrATHcpQzAKrdG8p1P5UqgYqHg
 W4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685097330; x=1687689330;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nBqku5q9vZ6Xc8ZaZQnGRftVBfKjrmfStPvoq/Z7tIE=;
 b=AnCVj56BoEQe8y8urLrPdOITnxAYJO4QC6uAVls/jwE9RM/EwV36cNaJyi+F3Tcx3E
 IG7ZcuqfOjjmtAndm9Tn9fo5Zm0MP6oah8l8jWXR0IRmwERBzIdn7qcHIat3fgjxwWOp
 YyuSs1HK+QbSqnSAdkL7bL3o8D1tDrHVN8v0JQNSbSlwpwW5LGuOkqsLgEQVszkebvpv
 2KCH38kPTRvl4NlNtmWgvoOvXwWLQTk/ahLSqre7IYaZmhjfl3YLYUOzij/1L90A/nGJ
 5L5Y2jfGgaUk8MiURdEVBBwCPERFVbS0mbrSetLltXENRJ/jso2grma9URPpx0F5lPrW
 sBFg==
X-Gm-Message-State: AC+VfDxZNFbcPxu9ei3H/cvDF3R5rdn2g8M0JqvO15HIRW2VA2W3H65o
 gXNVJl60O9ecex/sccfNo9Ldhw==
X-Google-Smtp-Source: ACHHUZ6AYKcJLt+byatanAoL/NXFYaied7fayFtzagQ+4cmKoccBEbRSJIIocsCnjrEb67L30dbJDA==
X-Received: by 2002:a5d:6aca:0:b0:30a:dcb9:a0b9 with SMTP id
 u10-20020a5d6aca000000b0030adcb9a0b9mr429105wrw.46.1685097330287; 
 Fri, 26 May 2023 03:35:30 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 b14-20020adff90e000000b00307972e46fasm4520818wrr.107.2023.05.26.03.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 03:35:29 -0700 (PDT)
Date: Fri, 26 May 2023 11:35:27 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: backlight: lp855x: convert to YAML
 and modernize
Message-ID: <20230526103527.GD626291@aspen.lan>
References: <20230519180728.2281-1-aweber.kernel@gmail.com>
 <20230519180728.2281-2-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519180728.2281-2-aweber.kernel@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 linux-tegra@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 19, 2023 at 08:07:25PM +0200, Artur Weber wrote:
> Notable changes:
> - ROM child nodes use dashes instead of underscores; the driver
>   reads all child nodes regardless of their names, so this doesn't
>   break ABI.
> - pwm-period argument is deprecated, as it effectively duplicates
>   the period value provided in pwms. The driver continues to accept
>   the property, so this should not break ABI.
>
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
