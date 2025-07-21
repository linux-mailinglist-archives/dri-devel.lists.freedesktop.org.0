Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8F3B0CB83
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 22:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF66E10E117;
	Mon, 21 Jul 2025 20:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WzunUEsq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA7010E117
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 20:16:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 384255C62FC;
 Mon, 21 Jul 2025 20:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC8A7C4CEED;
 Mon, 21 Jul 2025 20:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753128972;
 bh=fTSn/Sv4qArtz++sMbcoZ8ek+PmQQYja+lqgn+b/W4w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WzunUEsqwxpuwQgEca4OI+FIlVz5ORZ2sBMXjovqNc0/b19F1pVZ2cgX3kE7XURrZ
 5AP+C4XZSST0Xim/UkxZ+3IaaYiCyvnapDw+BembHZF7uJEC0tXlPdIPR7DDuK4qeW
 eWSQk06E+OjEWEVrb2CI88Ibo4I5HXozwiiPU51rTEik+TKb34xgGHLcI1zVsxsI1y
 SEShEW1+BVMHxpu3crNvuSSDLIlKM2BnZNisff7UTRg3tKlh9XnHwJkXFKJOGZ86bA
 yec+bO3HQ0+S7sKAxdk8+m6P9X8mQwIQvmEtqV6ZmXLk2ME9vosumlNDzjFwNb77IK
 XcpKFw5DLUGOA==
Date: Mon, 21 Jul 2025 15:16:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: display: sitronix,st7571: add
 optional inverted property
Message-ID: <175312897159.1251067.10084528761404344067.robh@kernel.org>
References: <20250721-st7571-format-v2-0-159f4134098c@gmail.com>
 <20250721-st7571-format-v2-2-159f4134098c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721-st7571-format-v2-2-159f4134098c@gmail.com>
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


On Mon, 21 Jul 2025 12:43:32 +0200, Marcus Folkesson wrote:
> Depending on which display that is connected to the controller, an "1"
> means either a black or a white pixel.
> 
> The supported formats (R1/R2/XRGB8888) expects the pixels
> to map against (4bit):
> 00 => Black
> 01 => Dark Gray
> 10 => Light Gray
> 11 => White
> 
> If this is not what the display map against, the controller has support
> to invert these values.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  Documentation/devicetree/bindings/display/sitronix,st7571.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

