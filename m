Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB6AA09629
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 16:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C6E10F112;
	Fri, 10 Jan 2025 15:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Lic+hpVt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F9C10F112;
 Fri, 10 Jan 2025 15:43:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5D9D7A4256D;
 Fri, 10 Jan 2025 15:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44BC1C4CED6;
 Fri, 10 Jan 2025 15:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736523825;
 bh=TV8hH/0bAnpkstoi+VL/fkUNsub1wZaqlJIrE9SAU0w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lic+hpVt20oa1Er3C2FAYUyESVm4xI1R5bOB51Lwq0HcLGCnKiblgXYVwUJx+/x3a
 cUE5/C15iWRWcxYhQ7FuprRryHpctO62F6THJqi2kKfvk+Cas5eVF9GJond+7Czs0d
 Sq9ly8reE9HqyyBdXXjI0k88f1kqJDIhQFJiodC0JNkBeXYmpGF7K8ilc84gnppjoF
 SObGl+J0WXIvuLoL9DwLURXjeeO8Y9vQ6JFj9FQST227QrX0RRiLxlawuiBkm+o9PR
 EjrKls13caeEu3LbAmQPkHNAfWXJM9HbtT18cmZWIhTYGjs5UGCWbp1gXqVGH8hy5u
 3+HsR8OYmgQAw==
Date: Fri, 10 Jan 2025 09:43:44 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Lucas Stach <l.stach@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-amlogic@lists.infradead.org,
 Mahadevan <quic_mahap@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
 Robert Foss <rfoss@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
 freedreno@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jonathan Marek <jonathan@marek.ca>, Sascha Hauer <s.hauer@pengutronix.de>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH] dt-bindings: display: Correct indentation and style in
 DTS example
Message-ID: <173652382248.2923092.2349362703621090098.robh@kernel.org>
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


On Tue, 07 Jan 2025 13:58:51 +0100, Krzysztof Kozlowski wrote:
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
> 

Applied, thanks!

