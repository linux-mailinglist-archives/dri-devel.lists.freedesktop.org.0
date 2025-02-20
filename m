Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A35DAA3D766
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 11:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF65510E93C;
	Thu, 20 Feb 2025 10:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WEDhaMCc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9EEA10E93E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 10:53:35 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5452c2805bcso938565e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 02:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740048814; x=1740653614; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=i4cNa1KAWhPy2izhnLaEb+31HFajh22g8Y95z+oCBBY=;
 b=WEDhaMCcDCLkaaUpcUcRk8EtgGxILnk4PR0DkOuLREtjScg3Kstcdq7O5Zg0QhSXB9
 0aNyTd6tLGeRDeIebdMd4L0av8y5RBsNOZUYQq06JMA+w9NuR3Ue+fIZh61VWnldTMhU
 EWTVSsCngUsfpS/lnwGlPlpVpSK94RZm2iak3Z/diurrXq3mrui672VmKx0wg3BMTpWG
 4Wnb4EjQSyWgMIHx7IyWvMP/yT3x6bk6BNDQRn7fAbQO6rVWVwic+9U+5XNoD/mPovpO
 BBaXyTzermaMfKCFpjwVJMZ1090XAPxzwnicf3XAsoTNpMk1hbouqW11WKTygufHsp8f
 7/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740048814; x=1740653614;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i4cNa1KAWhPy2izhnLaEb+31HFajh22g8Y95z+oCBBY=;
 b=s9Ud9ZLp/Uot0DiDozRz77NNj9dMbxUDTRsf0w+kccI8I9GAs5TZWKkwzKnlsCU5bG
 yMrNsHaxKbCOBo+L0loAtqfwjWDeFglw8O03CYFF0K5woP1e3bfddSs3a5i/TfqXwPsC
 ieIxTimX17vIcHT9t4WMBOtyhpxwFAJH2o9vA72cm6V9lST1LBE05hPJzN/zjEtTh+6g
 vC8f5x86+PVnbBK8QgGkpiQB5nTSR8LInOfBpitEjamr2CxYAjoXBfI9X7bU/poAL6En
 YjSM23rYZ27rpYfy2O0Z+iwZuf8S9hj2VwQD14yd0/cy+QXAuZ4rTGzCrvxC0d5VAsez
 M8Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxArFKy7faeG0OCgDRNxyVsyRter+yEguQzkdoXoxVcraycknNOIso2agQWA9vXMYZrlvLK9xdIcE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlyeLlg/WHIHypN04ZnUxbkJNXmWI2u6OuvjG9PkB/L+6DXy1h
 vjp0lnlOto5VSkF13icUzLeiOLVOxQ+BRabT9BzS30RMqQPUK8vX6KqlM0dLpPA=
X-Gm-Gg: ASbGncsGtlfN3afMZIF8FcMrR9inK3AVlZ2TmYK/w2OgJ4uMuuFghT/P30LBBwfPxRm
 /AvzM2W+aB0IDOol84jtwvHTsrgCofnuJphmGLnJxVXllwPBZagWbRc2EgXQtOhLnbZZwKhN9N5
 Q29D78SKZcwTvj1jYbh5fwQyCEs4adbxoflwiBaxPEYeZoesS6x5adUUW9H8aRlKsTu+MUybi87
 vEAldHa7rt7FhYdyVZUx9yPno8dEk8Y7EflELUEflOJWbZZ2Nu3jJxTSk/xK5LhQOiM14D6kfn4
 M2BCJTx7C4L6nqEKIexYacvlnX/hniMFkwho3SZAioAjGr09Xt1kW2A7GfTuuLWXdA2YXlo=
X-Google-Smtp-Source: AGHT+IGUa93DzQBNfWAgZCCcEoZ80+sJq5+WQjklkO36XME+Wd2aJ2kzORb+MvS9U9E5VlLr6XgUwQ==
X-Received: by 2002:a19:5e58:0:b0:546:2ff9:1539 with SMTP id
 2adb3069b0e04-5462ff91883mr1947710e87.52.1740048813729; 
 Thu, 20 Feb 2025 02:53:33 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54530a91179sm1748351e87.33.2025.02.20.02.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 02:53:32 -0800 (PST)
Date: Thu, 20 Feb 2025 12:53:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] dt-bindigs: display: extend the simple bridge
 with MStar TSUMU88ADT3-LF-1
Message-ID: <fqnaxziho63smog2adn27ypwoqrknbgbpe4xtgmj6xdbcavp3u@djbitfumfc6d>
References: <20250220094456.32818-1-clamor95@gmail.com>
 <20250220094456.32818-3-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220094456.32818-3-clamor95@gmail.com>
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

On Thu, Feb 20, 2025 at 11:44:55AM +0200, Svyatoslav Ryhel wrote:
> A simple bridge used in ASUS Transformer AiO P1801-T.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/display/bridge/simple-bridge.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
> index 43cf4df9811a..8308e833938d 100644
> --- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
> @@ -31,6 +31,7 @@ properties:
>            - ti,opa362
>            - ti,ths8134
>            - ti,ths8135
> +          - mstar,tsumu88adt3-lf-1

Please keep the list sorted.

>  
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
