Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3797A500D7
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:44:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CF710E766;
	Wed,  5 Mar 2025 13:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="mQFr02Xf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com
 [95.215.58.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DBF10E766
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 13:43:57 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1741182235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QO9qKoULzoYWBABgf51NjYdGSNxXU0EMfpVjVSk9Mzc=;
 b=mQFr02Xf/PCIkBtVH8ROPNcA1j26gf1sXqPL3epIxfHi3UC8BpWHrc0qm5fGbxC8Lt0gG8
 GI4jfqo5mTnEFtPDiKPxgu8apCWZdIjwKidneo36lLjI6HV6/BTGBTK7fzMjA3E7yISf6T
 NPpeqG3Fruhu2vc2vx1977bIZA863Mptjma1YcjBPPyZbAWm+EL2FoEu8nYdn0D5IYDcRw
 i0Ijl0xPRfwQcG68W0K3b8j477UEcxEtQr8X9hzUfeWrLToGPkjY15Ii0OZtNaH6VM7Qjw
 OotUMUUDicGWrvuiygnZd/pmxp64+g3AI36H0egvb1zWG0a9Ze3Ee/MOX/q68Q==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>, Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alyssa Ross <hi@alyssa.is>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250224-adpdrm-v8-0-cccf96710f0f@gmail.com>
References: <20250224-adpdrm-v8-0-cccf96710f0f@gmail.com>
Subject: Re: [PATCH v8 0/5] Driver for pre-DCP apple display controller.
Message-Id: <174118223158.156873.6982508045942987984.b4-ty@rosenzweig.io>
Date: Wed, 05 Mar 2025 08:43:51 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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


On Mon, 24 Feb 2025 12:02:15 +0100, Sasha Finkelstein wrote:
> This patch series adds support for a secondary display controller
> present on Apple M1/M2 chips and used to drive the display of the
> "touchbar" touch panel present on those.
> 
> 

Applied, thanks!

[1/5] dt-bindings: display: Add Apple pre-DCP display controller
      commit: 7a108b930a84e71be71c3370eef6dd96fbb8f618
[2/5] drm: adp: Add Apple Display Pipe driver
      commit: 332122eba628d537a1b7b96b976079753fd03039
[3/5] drm: panel: Add a panel driver for the Summit display
      (no commit info)
[4/5] arm64: dts: apple: Add touchbar screen nodes
      (no commit info)
[5/5] MAINTAINERS: Add entries for touchbar display driver
      commit: 4d2a877cc0efefa815648f1ed5f5b2b796f55bab

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>

