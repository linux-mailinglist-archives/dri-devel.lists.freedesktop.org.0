Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73085B0CB86
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 22:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB36D10E2E8;
	Mon, 21 Jul 2025 20:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iqpacYis";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFAD10E2E8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 20:16:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 389C1A55DA3;
 Mon, 21 Jul 2025 20:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B06C4CEED;
 Mon, 21 Jul 2025 20:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753128996;
 bh=rlb86JkfwjH+a1EcbjIussFtPP3jc+ntSHacOmNEriI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iqpacYisUr5aLulE9iB3ZzI0lpF8sfZfVvVekT2i/3+AdZNiAHdVEmHEaeuQAa3FR
 YdlL6jDRawNCBMmME0h550kImdTdbdrR7OUgbFj2Qeb5A8fap8lc433K/85Awyk+R7
 6KjNRSnXqywGVtkUNX5Wwq1FtnY8smYZB05fkV7OZVzC1mg/SZDZBc/PKxFM3WZw2c
 mTsz0c6ap9AC7zhDtzX1U7rVJBIHthjnyw93VuOlIYtmwfQI+Za2Wq//byAfuiEbBc
 rnFdrZ+J6VrUyRw3Iw4XmNuxntsWYg0EniGnB21Ysx3F6edmtwIT9ns95gKAZtwTDA
 3/id/djRa8bwQ==
Date: Mon, 21 Jul 2025 15:16:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: display: sitronix,st7567: add
 optional inverted property
Message-ID: <175312899553.1254894.11188428006937246926.robh@kernel.org>
References: <20250721-st7571-format-v2-0-159f4134098c@gmail.com>
 <20250721-st7571-format-v2-3-159f4134098c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721-st7571-format-v2-3-159f4134098c@gmail.com>
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


On Mon, 21 Jul 2025 12:43:33 +0200, Marcus Folkesson wrote:
> Depending on which display that is connected to the controller, an "1"
> means either a black or a white pixel.
> 
> The supported format (R1) expects the pixels to map against:
>     0 => Black
>     1 => White
> 
> If this is not what the display map against, the controller has support
> to invert these values.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  Documentation/devicetree/bindings/display/sitronix,st7567.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

