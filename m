Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77413CFC759
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 08:53:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B442910E072;
	Wed,  7 Jan 2026 07:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="afnPrEGF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E635D10E072
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 07:53:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EF0AE60007;
 Wed,  7 Jan 2026 07:53:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21ACCC4CEF7;
 Wed,  7 Jan 2026 07:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767772418;
 bh=9eNqAcghF7tdAA/uOmVCKek4FSJK0Zrf0oL0B3duEBY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=afnPrEGFvVIadMcNUTUWGGnLzqSlm3aYmVcEzgMSZfp3lvcYiSLEOKVX+rMvzyMa7
 JGfHxFw71fhruvsnL8abYgCZlL6GbsK4hMStDJOU6I6QYiTmhiEe46RwiT/HXqaPsc
 oHcu4PtOwNzl9t6AV62Aqcz1ahl77a8xioIlr/RdhvDnpSwyvY0hJ4iMvI9EMj6aIJ
 hx16kke+fO1rSfTQu4/cSXWS5pDmT2fNkrOOBfRm8plI1H+wfe76RR2BKqBSXfdkqk
 5iDr5yNtwR/wHcxZYVT8NVA+h0iSkIOb0hitquarBOlpD1mPB7daMl5W4kum22G4gQ
 30bStwyDUPoqw==
Date: Wed, 7 Jan 2026 08:53:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Tony Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v3 01/22] dt-bindings: display: tilcdc: Convert to DT
 schema
Message-ID: <20260107-elegant-utopian-kangaroo-cdb0cd@quoll>
References: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
 <20260106-feature_tilcdc-v3-1-9bad0f742164@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260106-feature_tilcdc-v3-1-9bad0f742164@bootlin.com>
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

On Tue, Jan 06, 2026 at 06:42:17PM +0100, Kory Maincent (TI.com) wrote:
> Convert the device tree binding documentation for tilcdc
> from plain text to DT binding schema.
> 
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
> Change in v3:
> - Rename binding file to ti,am33xx-tilcdc.yaml.
> - Use generic node name and drop unused label.
> ---
>  .../bindings/display/tilcdc/ti,am33xx-tilcdc.yaml  | 100 +++++++++++++++++++++
>  .../devicetree/bindings/display/tilcdc/tilcdc.txt  |  82 -----------------
>  2 files changed, 100 insertions(+), 82 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

