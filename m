Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8575A54E1
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 21:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C4C10E5B2;
	Mon, 29 Aug 2022 19:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E4710E59D;
 Mon, 29 Aug 2022 19:55:10 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-11c5505dba2so11736159fac.13; 
 Mon, 29 Aug 2022 12:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=1Fx0hyhLEgesMduKS6YaoV8lOy13f0toONYZ7JFMUI8=;
 b=pm6SEWBR1ooGgNQbCrRf5z0gmB28PNA53M7ke5YXaXo4HazislKMAwUpm9BsNONwLH
 9dxw94lLob38sIuetl/sfCEVGBV8BfBfwT+yt+3vDbiFOn7UZFw8DD8jsRrjD6KgLyLn
 eBvnSZ3QJRpxQL2WH1iKXygIdiksgobHOfLVafbuVdnPulmtlNaGu3O9tqDySi6usXMk
 SNbELdqN6P9ZH6TF6Hieuq+tzgDzcvJDJ9yRJVqEZ/uqNRxCKlx7mKVc+6lIe2muB5y0
 oET7UGQKKx+hXtH86lyLALjdw1A7M8AoSjxYuTCGIbhb6/JRmKvdBmV7nPd/zMNCLjqx
 1wnw==
X-Gm-Message-State: ACgBeo2pS7xYFaZ/EdRmKTr9YM6TUqejTBAWxHTcoitk5ESUsZvJ/DBZ
 tNj++rDUgQw1Jt0mu9LZ9Ge3VOU8/A==
X-Google-Smtp-Source: AA6agR79LCtTkBPjMXGth4L11I5KqYCZQN4ePEGJGOaoom7y5jjfLynZ1x4N82eBlETw0i+IO6OPwQ==
X-Received: by 2002:aca:d17:0:b0:344:bea0:8c83 with SMTP id
 23-20020aca0d17000000b00344bea08c83mr7497679oin.104.1661802909040; 
 Mon, 29 Aug 2022 12:55:09 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a16-20020a0568300b9000b0063975d170a8sm5068102otv.7.2022.08.29.12.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 12:55:08 -0700 (PDT)
Received: (nullmailer pid 2310401 invoked by uid 1000);
 Mon, 29 Aug 2022 19:55:07 -0000
Date: Mon, 29 Aug 2022 14:55:07 -0500
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: Add missing
 (unevaluated|additional)Properties on child nodes
Message-ID: <20220829195507.GA2310372-robh@kernel.org>
References: <20220823145649.3118479-11-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823145649.3118479-11-robh@kernel.org>
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
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-samsung-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Andre Przywara <andre.przywara@arm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 Aug 2022 09:56:42 -0500, Rob Herring wrote:
> In order to ensure only documented properties are present, node schemas
> must have unevaluatedProperties or additionalProperties set to false
> (typically).
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/arm,komeda.yaml        | 1 +
>  Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
>  Documentation/devicetree/bindings/display/msm/gpu.yaml           | 1 +
>  .../bindings/display/samsung/samsung,exynos7-decon.yaml          | 1 +
>  .../devicetree/bindings/display/samsung/samsung,fimd.yaml        | 1 +
>  5 files changed, 5 insertions(+)
> 

Applied, thanks!
