Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24087A72ADF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 08:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B23710E03B;
	Thu, 27 Mar 2025 07:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bcz0RfUU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D52F10E03B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 07:56:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 20C01A41BDA;
 Thu, 27 Mar 2025 07:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E03C4CEDD;
 Thu, 27 Mar 2025 07:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743062157;
 bh=XwCGCufdAWY9+XJt03fhUGbNeZ4m9tswVxZeGzrbztM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bcz0RfUU2oa+EZHU2Vp0WF0C2DVMOMzOMUwEtb7hV1R4SacNCyvy/2GIb97V+uKtb
 BidzlLAIKlWG6R1wPA+K7DOFCQCwT6iNSOBFFRSbwgoCI/H0TJkqESKdxMU6BJ/+jK
 6LFOdaEKlV1275mkmIt04r4cUsTZGMACGN28QzaPWBMUYBGX6F8s/oHpDK8H0KlvFB
 ahnNpwQnmpdGFja9fOdgEwKkNmgFwLM/DnmaNZFtApJ5H9bLprpDpRtwLBH+iAzLKs
 wfquhQ5C8xGa2hRcz48VNQOh2dMweFDr6RPXbM4SK2TOPGKF1yFAqQ+9+gziI0MGBk
 HVIcZgydh0Jjw==
Date: Thu, 27 Mar 2025 08:55:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Randolph Sapp <rs@ti.com>,
 Darren Etheridge <detheridge@ti.com>, 
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Alessio Belle <alessio.belle@imgtec.com>, 
 Alexandru Dadu <alexandru.dadu@imgtec.com>
Subject: Re: [PATCH v5 01/18] dt-bindings: gpu: img: Future-proofing
 enhancements
Message-ID: <20250327-pragmatic-lemon-flounder-e2936a@krzk-bin>
References: <20250326-sets-bxs-4-64-patch-v1-v5-0-e4c46e8280a9@imgtec.com>
 <20250326-sets-bxs-4-64-patch-v1-v5-1-e4c46e8280a9@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250326-sets-bxs-4-64-patch-v1-v5-1-e4c46e8280a9@imgtec.com>
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

On Wed, Mar 26, 2025 at 04:48:21PM +0000, Matt Coster wrote:
> The first compatible strings added for the AXE-1-16M are not sufficient to
> accurately describe all the IMG Rogue GPUs. The current "img,img-axe"
> string refers to the entire family of Series AXE GPUs, but this is
> primarily a marketing term and does not denote a level of hardware
> similarity any greater than just "Rogue".
> 
> The more specific "img,img-axe-1-16m" string refers to individual AXE-1-16M
> GPU. For example, unlike the rest of the Series AXE GPUs, the AXE-1-16M
> only uses a single power domain.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

