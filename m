Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D1D811B90
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 18:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30B710E808;
	Wed, 13 Dec 2023 17:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86CBA10E7F2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 17:53:51 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id
 006d021491bc7-5906e03a7a4so4106949eaf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 09:53:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702490031; x=1703094831;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ik457hD1S5HlN6UXVZUgeJxpu7wQOeGH5KzQB0C5eQs=;
 b=tLg+xPZIIoVeQ7Yj3FXqNz7ZcgH9bfIiAn7hzKNZ2/nZinsxmfoKT7eemnlEBa3JpA
 6m25JvSDcXChLNpi09Xa/5NA87/ZQyE+X03mJB57lPbDOYZI43j9DzI7SNFgMUWkYfpv
 0ya+VhGLYwPfiGABUG9j2+cDboGmSeSQ6X7Pwx84a5i1tX+csUdAUvSQ9k7QCXNiKgGp
 TZUKa9fBKDPREvA0mIcyhZTywYHoyL1rRZdAK8vBfNDKHMZhbHVefkHgb9JUzBXaLeIz
 Slz75XtU3ez24tYmbZ5XzfZxSiQGRfM/Ro3Tj+DGP1pWaCqm85Fc8S5rOQ1kvlqhN10Z
 9EDA==
X-Gm-Message-State: AOJu0YzsWX3w5qZO7qNSlaqoPy/owSdytc4O6t9/lkPOJwXsTf2X5/18
 deg/8XQv/ivOpHviC1EqUg==
X-Google-Smtp-Source: AGHT+IFQdhMh1dSsniMj2RNwPjv0B28HP5zPIeWWFOApyiATpZiK/dIcArxyl75Ywe09m3an1QfhbQ==
X-Received: by 2002:a4a:385a:0:b0:590:8d23:34f0 with SMTP id
 o26-20020a4a385a000000b005908d2334f0mr5050443oof.10.1702490030707; 
 Wed, 13 Dec 2023 09:53:50 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b30-20020a4a98e1000000b00590ded91500sm2027111ooj.47.2023.12.13.09.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 09:53:50 -0800 (PST)
Received: (nullmailer pid 1588510 invoked by uid 1000);
 Wed, 13 Dec 2023 17:53:48 -0000
Date: Wed, 13 Dec 2023 11:53:48 -0600
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH v6 3/4] dt-bindings: display: panel: Add synaptics r63353
 panel controller
Message-ID: <170249002767.1588438.13395249907934528672.robh@kernel.org>
References: <20231213140437.2769508-1-dario.binacchi@amarulasolutions.com>
 <20231213140437.2769508-4-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213140437.2769508-4-dario.binacchi@amarulasolutions.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 13 Dec 2023 15:03:44 +0100, Dario Binacchi wrote:
> From: Michael Trimarchi <michael@amarulasolutions.com>
> 
> Add documentation for "synaptics,r63353" panel.
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> (no changes since v3)
> 
> Changes in v3:
> - Add 'Reviewed-by' tag of Krzysztof Kozlowski.
> - Replace "synaptics,r63353" compatible with "syna,r63353", as
>   required by vendor-prefixes.yaml.
> 
> Changes in v2:
> - Add $ref to panel-common.yaml
> - Drop port, reset-gpios, and backlight
> - Set port and backlight ad required
> - Replace additionalProperties with unevaluatedProperties
> 
>  .../display/panel/synaptics,r63353.yaml       | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
> 

Applied, thanks!

