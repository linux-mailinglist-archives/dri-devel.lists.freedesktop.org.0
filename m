Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 570949F4BA8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 14:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824E010E967;
	Tue, 17 Dec 2024 13:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vNlo9qLO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 74559 seconds by postgrey-1.36 at gabe;
 Tue, 17 Dec 2024 13:12:06 UTC
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FE910E967
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 13:12:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5F2075C63CA;
 Tue, 17 Dec 2024 13:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D1AC4CED3;
 Tue, 17 Dec 2024 13:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734441125;
 bh=D/SJURUuzN5/fZOaZjKkoURarq2fLgSwyYakD0IggJ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vNlo9qLORpH0vDQdyIaIIfK+qBScqcqEdglH/20lJBrIBjfATyJL0vKBgWcR1LPZI
 /PSuYzyFvcZVdyn/7dDUw0Yv+IkubGzxWPIeA0mJhrPO7bJQgwh7Km6RtIXumTr10b
 oi55thkRvdJZE+tIimhsXDKez+yBogZFnfbXt1jI97eoROf65z63bjP7+HI8+aTAOw
 eP/jTOn3m412AI7VpS0MaKJYuHbVG5+xCB0AZqiCmnqLnD1D0Ksp8kD8vqpHCuohyl
 qFKq6wxUOi3lQibB+lpVmNu+1T077LkPD15eVGWcXKDWPw7a951QUM43z3ZhbNZ7w7
 8SaJQ2hHh6xPA==
Date: Tue, 17 Dec 2024 07:12:03 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: devicetree@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, Daniel Thompson <danielt@kernel.org>,
 Andrew Davis <afd@ti.com>, Jingoo Han <jingoohan1@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: backlight: add TI LP8864/LP8866
 LED-backlight drivers
Message-ID: <173444111812.1260250.17926048342741894289.robh@kernel.org>
References: <20241209084602.1199936-1-alexander.sverdlin@siemens.com>
 <20241209084602.1199936-2-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209084602.1199936-2-alexander.sverdlin@siemens.com>
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


On Mon, 09 Dec 2024 09:45:53 +0100, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> Add bindings for Texas Instruments' LP8864/LP8866 LED-backlight drivers.
> Note that multiple channels in these models are used for load-balancing and
> brightness is controlled gobally, so from a user perspective it's only one
> LED.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
> Changelog:
> v3: no changes
> v2: ti,8860 has been decoupled from this series and converted to YAML separately
> 
>  .../bindings/leds/backlight/ti,lp8864.yaml    | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

