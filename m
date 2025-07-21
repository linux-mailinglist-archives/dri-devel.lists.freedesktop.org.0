Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2818B0BE09
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 09:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9814B10E23F;
	Mon, 21 Jul 2025 07:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tvxrz/oc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD04D10E23F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 07:48:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E7C7A600AE;
 Mon, 21 Jul 2025 07:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2AD1C4CEED;
 Mon, 21 Jul 2025 07:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753084090;
 bh=Yr2TAYBwVrywxclokIQQQXS7VDbp//K2qfzHen68C5I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tvxrz/ocTISY/RULSoMQJVnWYi8VUnTEb5m2CcEY/fe1tyReBYLJv3YCT8zW5gYCi
 wfqn6rRzKGh2iyM0QSh2pgWRZtKwtvVFKWMxMlh6laO8PlxIbukTvGM/bn7Swa3Mrr
 eDoWL3HY6lNoBHfiIYJQOX9KFIB0mr7YR9DxewIDoP20K+E6itZCUe+JecZ5lPqE2n
 xSn+FSHsoZmVFyQC3tx72lmJ1u1bwacdzxADTr2wZtp9TsXJxmwYY/7UEFmBMLZCHe
 rNoxyT5oXkylAbOs6WV8nqwxWX3s/U30v4oiDgM2ShT92CakQ4Tm85HqHdalh/QFFV
 2mwKk+1AkBMQg==
Date: Mon, 21 Jul 2025 09:48:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: document Synaptics
 TDDI panel
Message-ID: <20250721-vagabond-hidden-kangaroo-de93c2@kuoka>
References: <20250720-panel-synaptics-tddi-v3-0-43a5957f4b24@disroot.org>
 <20250720-panel-synaptics-tddi-v3-1-43a5957f4b24@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250720-panel-synaptics-tddi-v3-1-43a5957f4b24@disroot.org>
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

On Sun, Jul 20, 2025 at 05:31:54PM +0530, Kaustabh Chakraborty wrote:
> Document the Synaptics TDDI (Touch/Display Integration) panel hardware.
> Along with the MIPI-DSI panel, these devices also have an in-built LED
> backlight device and a touchscreen, all packed together in a single chip.
> 
> Also, add compatibles for supported panels - TD4101 and TD4300. Both
> have the '-panel' suffix so as to remove any ambiguity between the panel
> and touchscreen chips.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../display/panel/synaptics,td4300-panel.yaml      | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

