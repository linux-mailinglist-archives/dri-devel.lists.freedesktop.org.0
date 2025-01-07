Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AADA04C2C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 23:23:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E191F10E11E;
	Tue,  7 Jan 2025 22:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UClP3+xO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B0F10E11E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 22:23:27 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53e384e3481so15196040e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 14:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736288546; x=1736893346; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6ESQnJJ6RaWplIB/jgPT0AvvoPiUybJLXeZ80lh+Xy4=;
 b=UClP3+xOOr7leCKT9qtZxilqZDgzZ5g2+XoGUUVzwRGEFGWz6J3AGYIw6EFn6H794Q
 3NmvI4zoCnU9QPXW3Ars9Y68HG7nFyF2e+XKuuL13Z5XX0eK6mUw9n1pA2+g7x9Ix336
 0AxMk+Vot0Di/eo3+uvCp6Wcd9GG0O6Yp2/r2BkWr2iYG5rqe8gKVLJO15MJOvz4IJev
 zgsU6trbyBwNql2XzGMTMvAQD8A+uqePqiaZNMpwA8W+6ywjfB2EF0ZjxhikWHsuaI8o
 OyCixvYB0r8DtXP4vszAoplWubrfqAhWvrzeKO53M/7CFx8LRwGx4dSkliidsPn7B2xf
 FVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736288546; x=1736893346;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ESQnJJ6RaWplIB/jgPT0AvvoPiUybJLXeZ80lh+Xy4=;
 b=fTFkd+zsvO+HCfH0C/4SFxsTr2AL0f47+4Si+6oUKVbHeX1nTaWgke6URxMCHtzUWb
 gmEf8dNw5NvhvpbdpmobXA/tX3XnKbxR9Yi1/83/8KnZDQRh/PPBiPzWpVNpk7Fpl+BS
 jVBoQnO7EVrIbAWtHSCh4bCsFioANLqFli+aPxiSonYgnvqggCnbja5lDuIzApOFuJDX
 kbbirnkcJRhXG6ZickS812kuG2AtajbJu7terswBsd/ru0BxmBkoDOp9nilR5DnEntxg
 qddsVIsyi6V24qtdPzXPF9sUWyoj/Z13eSAmHaa13pa3ixII4AnnGAtKSqQXzuTmQnj9
 tXOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX682nbijTyCMwHZ2uQ9UuvS7JLZIMLzxvosYhi2lL7ofvEEzafLQqo8nl48FoG6lFu6vYrB6FCXSg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygnTD6bOHo3xfNbRXAPCP2zpLgsrin+KJY677nIEsvO0xT18Pb
 4I8cENmkHDjTGGVLHnOuzKsheh8AWjUha1SxTmerXDCa63yyUoe2/aELP0ItLYM=
X-Gm-Gg: ASbGnctg0ERfXNNfnQDIFTvCldVyMYkdMdvJGHMJDFQis1Hkg3P5SXvqcabt7pdvPcd
 6EwGFKK8BbKBqYyrLiTMfaWrIg4PLzWMcG/T72CIq92IxvGNdBUYyAXi45Jnt83bgY1Ccm0lKTK
 HPEY26fkMIXe3HxGuj/Y/Tak1o1YaLPO5yRD/NNdhvgRtNUxtXagi4Rdm/RhYe5jV7z8zPjW9Em
 b3NyvBW7/o5hZPkFXRN8ax1ec3RQtZQ49OwX3TzisRQDRfzQ+48KVGeQPilhijh8w22yzQVjzDs
 HwdnK8XgsPBLfBiZqp5R+WvqVTQDBwl2dgGw
X-Google-Smtp-Source: AGHT+IFnS+89P+R20rxSVwXMFgmVIida5oAviwnvCG7UgPRL6sqycM/IAnw4EINYUJaJOUGjeMeCug==
X-Received: by 2002:a05:6512:23aa:b0:540:358d:d9b5 with SMTP id
 2adb3069b0e04-542844ad98bmr149812e87.0.1736288546084; 
 Tue, 07 Jan 2025 14:22:26 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223832b6csm5379607e87.273.2025.01.07.14.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 14:22:24 -0800 (PST)
Date: Wed, 8 Jan 2025 00:22:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Mahadevan <quic_mahap@quicinc.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: Correct indentation and style in
 DTS example
Message-ID: <g5u4xazpsgoxes3bwowufrdd266uhwqw2qidqs3tm4wq2qbk6h@bpzh4cnwybaj>
References: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
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

On Tue, Jan 07, 2025 at 01:58:51PM +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../display/amlogic,meson-dw-hdmi.yaml        |  8 +-
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 28 +++---
>  .../display/bridge/samsung,mipi-dsim.yaml     | 66 ++++++-------
>  .../display/mediatek/mediatek,aal.yaml        | 46 ++++-----
>  .../display/msm/dsi-controller-main.yaml      | 98 +++++++++----------
>  .../bindings/display/msm/dsi-phy-10nm.yaml    | 40 ++++----
>  .../bindings/display/msm/dsi-phy-14nm.yaml    | 34 +++----
>  .../bindings/display/msm/dsi-phy-20nm.yaml    | 36 +++----
>  .../bindings/display/msm/dsi-phy-28nm.yaml    | 34 +++----
>  .../bindings/display/msm/dsi-phy-7nm.yaml     | 34 +++----
>  .../display/msm/qcom,sa8775p-mdss.yaml        |  7 +-
>  .../bindings/display/renesas,cmm.yaml         | 12 +--
>  12 files changed, 221 insertions(+), 222 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm

I think we can take it through drm-misc-next (or even
drm-misc-next-fixes) once we get acks from Renesas and iMX maintainers.

-- 
With best wishes
Dmitry
