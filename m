Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0317F950B
	for <lists+dri-devel@lfdr.de>; Sun, 26 Nov 2023 20:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A93310E0FB;
	Sun, 26 Nov 2023 19:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2D610E0FB
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 19:30:14 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-3b83398cfc7so2272497b6e.3
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 11:30:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701027013; x=1701631813;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cF5iPL+UoN0pmz/Mf8oI3xqxZwEF9KwzO7lwyRU7zig=;
 b=QAkO3OcF4iosUSjhdwt/sOBx/XPVGfARZHbVQc6IsxqhyB1z4ZsphVa/XQmIAiBhZb
 q4dSPKYkPdZM3AhD30ttDNfAUHXJVqE1AHAenEta99VThjLfktuxIyca6tecpALWU37F
 J2/yPuWElziNiFji4aoh3XcjmidDu69IuyKu7DIerKEYYRqmAewF5RvM6n5QdAAIqysN
 WBascXeld0t9azTUVoCQ3CAZVLNwQHfJr0gK9M3mrv0jrPd/HVJqtD5aIm7+8yE9zedY
 ShqHSuPQMF5jDa3ETxfMgi8v0+iifOMfcvHr2VhwoRPwsoeglhHXBnB5jm/Dkp5Ro5OY
 TKvQ==
X-Gm-Message-State: AOJu0Yw+af6ah7FcaU3Pc/VISvNyscUUJ9/57eq5oeXzfxTHt09vU2kf
 I6AcZ2D+utZbzTFn3nDY/Q==
X-Google-Smtp-Source: AGHT+IFN9FkllIs8NwE5M+5eMxZJDjxYTM7WvxpxuS0JRkvWMdLvzypLXD2zs6vmagC6jGp16eXjRQ==
X-Received: by 2002:a05:6808:1250:b0:3b5:6533:d2cb with SMTP id
 o16-20020a056808125000b003b56533d2cbmr9895625oiv.46.1701027013354; 
 Sun, 26 Nov 2023 11:30:13 -0800 (PST)
Received: from herring.priv ([2607:fb91:9e5:15e5:aee2:7746:1955:d879])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a0568080d4d00b003b85bd22147sm642373oik.49.2023.11.26.11.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Nov 2023 11:30:12 -0800 (PST)
Received: (nullmailer pid 76358 invoked by uid 1000);
 Sun, 26 Nov 2023 19:30:05 -0000
Date: Sun, 26 Nov 2023 12:30:05 -0700
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v9 04/12] dt-bindings: phy:
 amlogic,g12a-mipi-dphy-analog: drop unneeded reg property and example
Message-ID: <170102700475.76284.1528867317482713371.robh@kernel.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
 <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-4-95256ed139e6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-4-95256ed139e6@linaro.org>
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jagan Teki <jagan@amarulasolutions.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Ripard <mripard@kernel.org>, Remi Pommarel <repk@triplefau.lt>,
 linux-amlogic@lists.infradead.org, Nicolas Belin <nbelin@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 24 Nov 2023 09:41:15 +0100, Neil Armstrong wrote:
> The amlogic,g12a-mipi-dphy-analog is a feature of the simple-mfd
> amlogic,meson-axg-hhi-sysctrl system control register zone which is an
> intermixed registers zone, thus it's very hard to define clear ranges for
> each SoC controlled features even if possible.
> 
> The amlogic,g12a-mipi-dphy-analog was wrongly documented as an independent
> register range, which is not the reality, thus fix the bindings by dropping
> the reg property now it's referred from amlogic,meson-gx-hhi-sysctrl.yaml
> and documented as a subnode of amlogic,meson-axg-hhi-sysctrl.
> 
> Also drop the unnecessary example, the top level bindings example should
> be enough.
> 
> Fixes: 76ab79f9726c ("dt-bindings: phy: add Amlogic G12A Analog MIPI D-PHY bindings")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml          | 12 ------------
>  1 file changed, 12 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

