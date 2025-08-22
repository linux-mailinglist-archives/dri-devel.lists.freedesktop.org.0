Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBFDB32073
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 18:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22B710EB68;
	Fri, 22 Aug 2025 16:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UfZEfi65";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B2E10EB68
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 16:26:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9FBA3402A9;
 Fri, 22 Aug 2025 16:26:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652C6C4CEED;
 Fri, 22 Aug 2025 16:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755879996;
 bh=gqeBbcxNavI1L2mbvgc6p1M/POMGsZs1Pur53RdU1zM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UfZEfi65V81DWiABQvuX9GVUFfEBh5DX1N//+22SzsOvF7mKscQvJktc1iiW1+kkk
 2r24TzHuOfqhYjwgWu+p8B7ghwOtlV2pwR0Kr6JJ3BRYWLBskO13LZcQ78Ff27Y1Om
 63pPAPFFO3kD7cZLG+ST8G6mujcjXfAPSMPVdFJuy7/Y4U6wvTOulLvWSZy3zqfinv
 Duzw6UxrqEgevFlDHG3bQ3LW53Hmsk1dv2+bqpjuGz9rhj5DdNNR2YnHIbO1Q3221f
 NTL70yCogjD6O1IvAk5+RnhAXucniMeW6SvWioa2sBeGMMjYKMEuZa7nVLeRge7JSh
 ARMfUAJ/aUG8w==
Date: Fri, 22 Aug 2025 11:26:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: devicetree@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Simona Vetter <simona@ffwll.ch>, Fabio Estevam <festevam@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: arm: fsl: add compatible for Skov
 i.MX8MP variant
Message-ID: <175587999529.3977942.15581850893122892977.robh@kernel.org>
References: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de>
 <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-4-b492ef807d12@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-4-b492ef807d12@pengutronix.de>
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


On Thu, 21 Aug 2025 09:55:31 +0200, Steffen Trumtrar wrote:
> In preparation for adding a new device tree variant with a different
> panel, describe the DT compatible in the binding.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

