Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2217A90D27
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 22:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCE510E9B3;
	Wed, 16 Apr 2025 20:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kGEOJyqU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0924510E9B3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 20:29:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F3FB45C3FBA;
 Wed, 16 Apr 2025 20:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E2CCC4CEE2;
 Wed, 16 Apr 2025 20:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744835340;
 bh=olh5zWLQlvOARfiL6LVnt5POpCWHhONm64CLOfODiW0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kGEOJyqUM5d2bCDOWGpshoNxJ9AClt18sbuP7WSDiM1mHLyp705IDkRH3yQMShBc+
 ehDMrPSxtD2+sqMvioXwVThNoc+BM72vBjWrVy9uYQqb8CqEpfgWopsrzgK6btTsjk
 VwJfIjamecPeMMbCycLEKJnqazdVdsbIdngwPW1+auI/GLLDFR8qghKQIiKTffUAHE
 VKCqKiRbfvEFkl6cx6xB6EpC3Tjrt2trcoNLzQGnLg9ddLnd9xKNbjp9PeLzEGpGOH
 ns2ttCTEpibfcO2mawSsD+m8NLrOQzAgdyuZXRxFFvefC7Cv0ntsBxHOPGo6vz+xTF
 g2vXKldiG6/sA==
Date: Wed, 16 Apr 2025 15:28:58 -0500
From: Rob Herring <robh@kernel.org>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: backlight: add TI LP8864/LP8866
 LED-backlight drivers
Message-ID: <20250416202858.GA3838008-robh@kernel.org>
References: <20241218210829.73191-1-alexander.sverdlin@siemens.com>
 <20241218210829.73191-2-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218210829.73191-2-alexander.sverdlin@siemens.com>
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

On Wed, Dec 18, 2024 at 10:08:26PM +0100, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> Add bindings for Texas Instruments' LP8864/LP8866 LED-backlight drivers.
> Note that multiple channels in these models are used for load-balancing and
> brightness is controlled gobally, so from a user perspective it's only one
> LED.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
> v5: no changes
> v4: no changes
> v3: no changes
> v2: ti,8860 has been decoupled from this series and converted to YAML separately
> 
>  .../bindings/leds/backlight/ti,lp8864.yaml    | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml

Applied as it seems this was missed by Lee.

In the future, you can resend without my ack/review tag and ask me to 
apply if something gets missed.

Rob
