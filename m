Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C3AB2C66B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 16:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E964110E1B2;
	Tue, 19 Aug 2025 14:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lmfdVUEr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B869910E1B2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 14:00:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2A40E5C5D9D;
 Tue, 19 Aug 2025 14:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE42C113CF;
 Tue, 19 Aug 2025 14:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755612056;
 bh=v2bxLEdMiFhvVeDk2VKDc+laagxhg9z8Eu0qAxJIl7o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lmfdVUErvstxofMsyj58so3K6FN/i+YTaRTO5Jdsk3hoE2/J5nLYCgWa5YidwvM4C
 seymARtPPdkn19XQuu0a6MCL/ACSKM/nJ4AQebb3Y1AjoGyWigt817XVq1bscEqDYy
 1HxbrMmEo4xctC7SEyMD45hTgTqPqFXC/tJOqF9c90gvqt+cs+1LLW6y1Li8SknSVE
 QoE2tS8VIeu7K6Z+EJrTxXtGPVE6AArjv7RqSBYWde89QA21Pqo9zquBJ81Nf1t9fl
 45e7niWw65Fg3s/gvJwnSr7GTG9j+XmhnQuYGvjkels+cBANGm6iQlZP+lBKBd6KZa
 gdrZN8G/Bay+A==
Date: Tue, 19 Aug 2025 09:00:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Simona Vetter <simona@ffwll.ch>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, Philippe Cornu <philippe.cornu@foss.st.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Ripard <mripard@kernel.org>, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v3 01/13] dt-bindings: display: st: add new compatible to
 LTDC device
Message-ID: <175561205474.128167.15765669735400801632.robh@kernel.org>
References: <20250819-drm-misc-next-v3-0-04153978ebdb@foss.st.com>
 <20250819-drm-misc-next-v3-1-04153978ebdb@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-drm-misc-next-v3-1-04153978ebdb@foss.st.com>
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


On Tue, 19 Aug 2025 11:15:54 +0200, Raphael Gallais-Pou wrote:
> The new STMicroelectronics SoC features a display controller similar to
> the one used in previous SoCs.  Because there is additional registers,
> it is incompatible with existing IPs.
> 
> Add the new name to the list of compatible string.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  .../devicetree/bindings/display/st,stm32-ltdc.yaml | 30 ++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

