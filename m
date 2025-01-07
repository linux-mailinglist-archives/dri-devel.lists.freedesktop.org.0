Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B28FCA04B0F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 21:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093B010E31D;
	Tue,  7 Jan 2025 20:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="WR3wzyoD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BF110E31D;
 Tue,  7 Jan 2025 20:37:31 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-21a7ed0155cso16557655ad.3; 
 Tue, 07 Jan 2025 12:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1736282191; x=1736886991;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k5J+gh+iXgRwyFdRk/bfAnhtBt/J24ElglqD+pzBrcM=;
 b=WR3wzyoD4suiq5fMpxCXN9gg4no2Mu2QIZkG1UZm5+dUqAdN/6UX1NX6oGRu6D6Bmn
 tn2vt4poX5QLmdmbl8ngUqcwgiW2pnb4+KAq59+N+IV6P5RQZB4VeOY5SGlvDDSGdaPj
 dDRL0P47Q4CdopGTfpMQMEKSUvalbNgD7Xge+DybcFZWu5MgaqyhV2ukZJPTjbLR+Ge2
 Px//GShLBK7Y0VF50d+HrioEIlg5eDi/RhPWno/k5cXQ7JdJ4S1XsNoBPbok50c9xbrP
 LLNw8rYY1jOe2ApCOy66e/VxsuBDVhhn4NMnTMcSxsPA/pU+TojFpvtAhPEZTJngE2w6
 n/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736282191; x=1736886991;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k5J+gh+iXgRwyFdRk/bfAnhtBt/J24ElglqD+pzBrcM=;
 b=fN0Hv3rby2xwyuzDnHlTNT3d1AP8tUjZ/o+2IX6jBQxiVqopqSXH7QARy8jsTygWU3
 z4x5edHE3+Am2UiqB3fIszTdJje0Caji4IO44zhnIUm+lA1iTh9wkBS0tv/zKxWvk63v
 kdP2NzcNtHDxHVQDYkVDaa1riYm3jUGsqgqZeIzKPjYwqTqtK4rcJA1DBqLK/oKq3Hnz
 yuynRicDADzJPvLex3Ag78QoLL3XGD5x8k/03vOlKmqU1yIKYd/YlKJRfRMGp+EPYxAV
 IRbiIVW8/HmJ2jFJThk9BJsx8j6lJHnHRDi1n/IRS/q/vnRHkXLQybMemoTPmGwrWoSf
 EpDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6vbUwfGillDWYhJz1d1bWT4vN2C5ytrzrh+KmsCsxdO/VZlQ4PVKuo3mDSihYz2HSKqBeJWyz7f2z@lists.freedesktop.org,
 AJvYcCXGXiTvlrsveqe/wqNs67XsfDxDzI972l605FaHl9W8JJij39jwwkZorbX48zQZI3nRyjeBjTgrXbw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDYEBJ4V2kl8FKMvTpRibxPxAMFofCX4dxFcagXI5KizO2ztbF
 aBafim7kWqWrM5sAhdbxUt55aAobKWbmvDdF6Uqqnsy9Ps4As2j8hiEHA/9aPZugG5BgGxWwDfp
 N08FC4HrJxBgkYIiFa2Cdby+Cwxs=
X-Gm-Gg: ASbGncvK2gDJfBzhrp+Njq+jXXUyyEN3zgTi0v0OIGO7mfeAN1tt7/DvWQ9pXIU/e0y
 bsTvW0Llwx+X1aB0SnncBMCcudiHSYRyUEItyODhivPyNuJS3hHeU
X-Google-Smtp-Source: AGHT+IHgiQDN0G5/PdDd430gJpVrEIqkV02owORB8V1V6tlHZDq0VmXjlHDjVTSTRjC3ezsidQtyveZkFyttC72Msfc=
X-Received: by 2002:a17:902:f70a:b0:216:8319:2949 with SMTP id
 d9443c01a7336-21a84000ae2mr5997805ad.56.1736282191527; Tue, 07 Jan 2025
 12:36:31 -0800 (PST)
MIME-Version: 1.0
References: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jan 2025 21:36:20 +0100
X-Gm-Features: AbW1kvat2n17hvPwDrGQUj8U_8QFAMpbYP8hJMpXB_xRYGmIfR0aXMkOm1WMYyw
Message-ID: <CAFBinCCqekcg75YPnck5NEiLftpiDR5KhX7Ngc2xuRKpbMik+A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: Correct indentation and style in
 DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
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
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jan 7, 2025 at 1:58=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
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
For amlogic,meson-dw-hdmi.yaml:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
