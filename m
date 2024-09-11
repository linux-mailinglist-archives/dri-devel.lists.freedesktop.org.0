Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C8B9756CB
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 17:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC99010E15A;
	Wed, 11 Sep 2024 15:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nG/Oi8WS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB1710E15A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 15:19:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C27755C06DE;
 Wed, 11 Sep 2024 15:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8A4C4CEC0;
 Wed, 11 Sep 2024 15:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726067954;
 bh=cSb4CB+p3svhD9W83Ai81pItfERhLziRxmos5X+V7zs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nG/Oi8WS0wa/mQHwyhqf/ToC0P5uZCRfa9LB7OGh+BkN0wBvMZECjzDve8CebSm5O
 /0ctI8bnAM6qdnnIZEFSQqhV88Q3tojzY3Zdkq3CbH8NY3SwQ3zJX4pbmA90TLdqWG
 O2CsBkvfxEjhFrLaODX3K/aFHn4zGcXXIHD7mVO800t5hGvRcBL4I7wPpBEFO+KXd/
 nCWEEjP/2wTPA6zbiIo3koZ5ZfRanos8krXsgvyey3+qEVEBk1n/4bdaVZVG8Ldrdr
 jvkktjgJXG+GG48by1uyHxL2Idab86vQt3I1IXeiguBa8QAS0VqZRTsNdgTgtzcCEM
 hRKoU1+yMKtRg==
Date: Wed, 11 Sep 2024 10:19:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Ripard <mripard@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Vishal Sagar <vishal.sagar@amd.com>,
 Jaroslav Kysela <perex@perex.cz>, Rob Herring <robh+dt@kernel.org>,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@gmail.com>,
 Michal Simek <michal.simek@amd.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: display/xlnx/zynqmp-dpsub: Add audio
 DMAs
Message-ID: <172606795201.325596.766778615878256783.robh@kernel.org>
References: <20240910-xilinx-dp-audio-v3-0-75560793f4d0@ideasonboard.com>
 <20240910-xilinx-dp-audio-v3-1-75560793f4d0@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910-xilinx-dp-audio-v3-1-75560793f4d0@ideasonboard.com>
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


On Tue, 10 Sep 2024 14:19:19 +0300, Tomi Valkeinen wrote:
> The DP subsystem for ZynqMP supports audio via two channels, and the DP
> DMA has dma-engines for those channels. For some reason the DT binding
> has not specified those channels, even if the picture included in
> xlnx,zynqmp-dpsub.yaml shows "2 x aud" DMAs.
> 
> This hasn't caused any issues as the drivers have not supported audio,
> and has thus gone unnoticed.
> 
> To make it possible to add the audio support to the driver, add the two
> audio DMAs to the binding. While strictly speaking this is an ABI break,
> there should be no regressions caused by this as we're adding new
> entries at the end of the dmas list, and, after the audio support has
> been added in "arm64: dts: zynqmp: Add DMA for DP audio",  the driver
> will treat the audio DMAs as optional to also support the old bindings.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml    | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

