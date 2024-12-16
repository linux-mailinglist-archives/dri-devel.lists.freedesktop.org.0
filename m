Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1993B9F2DD9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 11:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926E410E571;
	Mon, 16 Dec 2024 10:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lUBnWPAF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B823710E571
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 10:09:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 058A95C5BAD;
 Mon, 16 Dec 2024 10:08:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD18C4CED0;
 Mon, 16 Dec 2024 10:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734343780;
 bh=Nay/Ysj46T8nFAC58Fcxr/oYYq+V5mUidfXinNesmug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lUBnWPAFmlPAhyJcJoHSApDI4vg2Wumq7oNXOalqY5m3EqfjPFvLLwEWF2n8Fj3jF
 ZVmnJaoBj5+H7x+IyiSbHd2FrnJQDCJXciqBKhPZ5G5d1+lFSESDAldYxfS6oLaFq8
 BHgy2W1fJQMWd1XoxZPIJRiTKi44/4gMIdMyhQYaaQ8Rgtfzjfbz5NMiB4tuy3GC4m
 ctiVg4XZV6TGI9R4siYyTu71qfYefpwDMPhdsz4odAJwCqBovV1425ddnFyrXL8sBg
 dEvlW0YgMADbCxUzhYk84LtGL5BDku+hNQ5Lq8zvidnm9YxHfPydId/MasgfIdkAFV
 o8XZH5JSvWluw==
Date: Mon, 16 Dec 2024 11:09:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add Tianma
 TM070JDHG34-00 panel
Message-ID: <egqtfrmretlglzhizdgq32bioxqtydcz7ftv7j6ftj2or6vhch@tre2xmuz3pry>
References: <20241210-tianma_tm070jdhg34-v1-0-9fb7fe6b6cf0@bootlin.com>
 <20241210-tianma_tm070jdhg34-v1-1-9fb7fe6b6cf0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210-tianma_tm070jdhg34-v1-1-9fb7fe6b6cf0@bootlin.com>
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

On Tue, Dec 10, 2024 at 06:28:03PM +0100, Luca Ceresoli wrote:
> Add the Tianma Micro-electronics TM070JDHG34-00 7.0" LVDS LCD TFT panel.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 18b63f356bb4bbf6d2c8e58b13ebb14c5f4004ad..30f655e82666bb1aa227edd26bd8d3621a39e74f 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -281,6 +281,8 @@ properties:
>          # Tianma Micro-electronics TM070JDHG30 7.0" WXGA TFT LCD panel
>        - tianma,tm070jdhg30
>          # Tianma Micro-electronics TM070JVHG33 7.0" WXGA TFT LCD panel
> +      - tianma,tm070jdhg34-00

So tm070jdhg34 or tm070jvhg33? Comment says one, implementation different.

Best regards,
Krzysztof

