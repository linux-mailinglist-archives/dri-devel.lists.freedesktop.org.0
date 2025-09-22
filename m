Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9F3B91F35
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 17:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6DE10E4C7;
	Mon, 22 Sep 2025 15:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OajqGgjL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786A410E4C7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 15:34:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1A519432AB;
 Mon, 22 Sep 2025 15:34:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2C4C4CEF0;
 Mon, 22 Sep 2025 15:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758555243;
 bh=e4OTGDJCAO9WCDKw8GXo7WVD6AKTZudff/hkCl+fuLI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OajqGgjLQNLqt3/dDhmP+KsZnHUg59XIdFt3g723Vqri46eTURkZq8nq91C7B9s6v
 yf7dT/pNPl04oN6JimHeKpHptTBAVjZBdsaoXOfUqiGmlkdcvE1QseFAGH2+e5QdX7
 qLjKGDqqXWqyHC45LUrQbEPUf2jJhsYHPHkHho5fgAuCh2HrPiP12NLgOcZk6P8xFf
 mjKn8MXturv8+r4Mi5FfpD5bV/gSoWBMGRTwoqnKU/OPMsWfHOEiLkqNiTJBpPZB6f
 +qywvUjhPKWUqLUfNyC28PdlyGCYCWxJHQ+FOmEt68doxes+5XkcvQ3rHNzDWXI0bS
 KrlcbDP/FhdBg==
Date: Mon, 22 Sep 2025 10:34:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v1] dt-bindings: gpu: arm,mali-midgard: add
 exynos8890-mali compatible
Message-ID: <175855524067.4170586.7705155168461392581.robh@kernel.org>
References: <20250914131452.2622609-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914131452.2622609-1-ivo.ivanov.ivanov1@gmail.com>
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


On Sun, 14 Sep 2025 16:14:52 +0300, Ivaylo Ivanov wrote:
> The exynos8890 uses the ARM Mali T880 GPU, document its compatible
> string with the appropriate fallback.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Applied, thanks!

