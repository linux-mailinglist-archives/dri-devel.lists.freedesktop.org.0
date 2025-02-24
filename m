Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A653FA42DE2
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 21:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A15C10E433;
	Mon, 24 Feb 2025 20:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SpPUC/MN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F0210E413
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 20:33:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4322A611EA;
 Mon, 24 Feb 2025 20:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4F5C4CED6;
 Mon, 24 Feb 2025 20:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740429181;
 bh=GkLISPYYv7MHf+2XRcdkauAMMfvihArhSS/JM26Wlk0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SpPUC/MNxb4S9qhxCSK6x4tUp63wfrH1fgOsvPNILny2LanDLJyZTIgrgiu7/xQtX
 O5aUVEUcqlyG4BMcNvDLCYINAv+uLxhR4/dhnCRpdc6wQfI4YD92xr+BhVqJ02Obvv
 wLF29hb5o1JX+bhYumNmpjiRWxJE40eWYOcQtCTiq/9P+lFUWDZPEkACHcQLlwiLOk
 HVdfUdoFZ1YdJeWXMtZf+z43+iW7xslG3ueuc/GqMEH6I8mB2M4ORJVg1m/Wc2xeoh
 +nTUgVlmlMqq2kapHvxa6cgiMKWo6bxnCncKBKPTy18xQZBAQElatFG3LBz1k96W97
 tBV7fCVpjQ9dw==
Date: Mon, 24 Feb 2025 14:33:00 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>,
 David Airlie <airlied@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 imx@lists.linux.dev, Neil Armstrong <neil.armstrong@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 03/14] dt-bindings: arm: fsl: Add GOcontroll Moduline
 Display
Message-ID: <174042917969.4048644.15922990848676002211.robh@kernel.org>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
 <20250224-initial_display-v1-3-5ccbbf613543@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224-initial_display-v1-3-5ccbbf613543@gocontroll.com>
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


On Mon, 24 Feb 2025 14:50:53 +0100, Maud Spierings wrote:
> Document the compatible strings for the Moduline Display controller.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

