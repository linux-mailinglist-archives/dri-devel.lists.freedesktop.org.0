Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B6DB1515F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 18:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94DC10E65A;
	Tue, 29 Jul 2025 16:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZSDzJN4q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A31E10E65A
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 16:32:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7BCE55C54E0;
 Tue, 29 Jul 2025 16:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3A9C4CEF4;
 Tue, 29 Jul 2025 16:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753806769;
 bh=4Q/A4r8d1ZQG3FbhyPguPVRCWfgSCwtAKYlECW9aL8U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZSDzJN4qfDySDa3inQAme1/5ohrxBxAW/m6YDS4aZWvssxOisP/Qrif3iXkCfvyVq
 gE1dlFv2TJ2qocOnrCdmyhnChms0rISSR/pkTd9pVUb+mJcQ5LJI4hsdauM4CsJc4T
 OGglGeFVQjf8GmrSN/16Bue5Jjap/Xm3SsersBB4klsxCfFjQcVBL4MWVqMyX4HxqR
 KOYNUkLjKrlIJ1y83HloS3aPL+q2T0xEbeDtfsjzrLKLC65OsF8LgsVhNwliWhFbRf
 EWD2G78Gs0vzKVg4B7mybseNtKrOtw5WdRdDTNSUaHKXVoixG0zu0p6kkiAsCdHyXX
 XBlae83qbcz+Q==
Date: Tue, 29 Jul 2025 11:32:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
 David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Simona Vetter <simona@ffwll.ch>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 05/12] dt-bindings: arm: stm32: add required #clock-cells
 property
Message-ID: <175380676749.513254.17364402562772205374.robh@kernel.org>
References: <20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com>
 <20250725-drm-misc-next-v1-5-a59848e62cf9@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725-drm-misc-next-v1-5-a59848e62cf9@foss.st.com>
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


On Fri, 25 Jul 2025 12:03:57 +0200, Raphael Gallais-Pou wrote:
> On STM32MP25 SoC, the syscfg peripheral provides a clock to the display
> subsystem through a multiplexer.  Since it only provides a single clock,
> the cell value is 0.
> 
> Doing so allows the clock consumers to reach the peripheral and gate the
> clock accordingly.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  .../bindings/arm/stm32/st,stm32-syscon.yaml        | 31 +++++++++++++++-------
>  1 file changed, 21 insertions(+), 10 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

