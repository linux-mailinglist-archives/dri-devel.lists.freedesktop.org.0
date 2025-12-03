Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6FDCA1DDE
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 23:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7232A10E14B;
	Wed,  3 Dec 2025 22:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NW+GTFvC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E48410E14B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 22:52:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 576CA60179;
 Wed,  3 Dec 2025 22:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F34C4CEF5;
 Wed,  3 Dec 2025 22:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764802355;
 bh=sI020P7qBWnq5Hq6FRxOGSZbde2bx3Zr3sKIJs+/pIQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NW+GTFvC0+oEcgbGRDu7WA0iwVy92MJ3dFIQsXlAWyCID8DnLoJ9dx946maZhUFWl
 SK5U04QG6D6jRDVUJr8CmLPyCnG+5goV7jVBdiwOkUcU5QsChUoQjCuUkByn61+3Oj
 EhjCoenHT2iHXMaKV2ZSshxaI81kVEcAB6hKntwHNHRPTuVHEtyr1xGkVMhW7VMC33
 pqvEyOer0oTpMgGZClIP9yX/jlF1Mi4Inr9BL3tFsIgnRZX1GTDAdZMNIBgL7wo9qS
 pk3TSaHoIpi+Rzzpdt12w3tbbceh+ji2BkO/q0i13Fm+heSXLZ32UmzNmlIMXwsUSR
 vjKwlX4WfpuWA==
Date: Wed, 3 Dec 2025 16:52:33 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>,
 Michael Tretter <m.tretter@pengutronix.de>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Harini Katakam <harini.katakam@amd.com>, dri-devel@lists.freedesktop.org,
 Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Michal Simek <michal.simek@amd.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-mmc@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: display/ti: Simplify dma-coherent
 property
Message-ID: <176480235071.4159178.4317055893040212478.robh@kernel.org>
References: <20251115122120.35315-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251115122120.35315-4-krzk@kernel.org>
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


On Sat, 15 Nov 2025 13:21:21 +0100, Krzysztof Kozlowski wrote:
> Common boolean properties need to be only allowed in the binding
> (":true"), because their type is already defined by core DT schema.
> Simplify dma-coherent property to match common syntax.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml | 3 +--
>  Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 

Applied, thanks!

