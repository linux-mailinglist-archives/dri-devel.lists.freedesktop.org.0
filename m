Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FBA97E381
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 22:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1174810E1AC;
	Sun, 22 Sep 2024 20:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tN4JMxKE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3575E10E1AC
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 20:52:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6A2ABA40EA1;
 Sun, 22 Sep 2024 20:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856E4C4CEC3;
 Sun, 22 Sep 2024 20:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727038342;
 bh=uN5prV2zXq5e0gOnXEUkWyF7g1wrmftUQs3tUHdtCAs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tN4JMxKEdLst5ymxG9/DaCuXUErphUlZc60D4paWVBR3bpr+Krqw001D1qEdmcmIw
 r95zi3RBY1mA6kfFBTvNlNbk5fnErDTDB9I0p4NcJYwc9UMcLI5NhbHBqPGCWT+Czz
 nkJbHRUSpPoDQi1WsSRrzL0jaTUEa1Quz/pc5FTRKqp2itg1uPAiPOcki/TszvZStn
 wlU7arMOsNZASOOThnHXB6sW4ZFYqOX+iq+SSqEZ+iqVYunwn2mNws8AZOLeBCxKhI
 DwZHmYTL3DQDmcBY+hnEIxlf+jZ8HZvdJn7pPi2DsCasQ8DMGZM4PSHuo4oSWvFTL7
 TBRhiWkdK4kLA==
Date: Sun, 22 Sep 2024 22:52:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
 Chris Morgan <macroalpha82@gmail.com>, John Watts <contact@jookia.org>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 19/26] dt-bindings: allwinner: add H616 DE33 bus binding
Message-ID: <qxudqhcsulj2jfewhi32ymd4dhds34zk5f2mhks3bckhfqhko7@wzj23fkatjxg>
References: <20240921095153.213568-1-ryan@testtoast.com>
 <20240921095153.213568-20-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240921095153.213568-20-ryan@testtoast.com>
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

On Sat, Sep 21, 2024 at 09:46:08PM +1200, Ryan Walklin wrote:
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
> 
> Add a display engine bus binding for the DE33.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> 
> --

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run  and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.


Best regards,
Krzysztof

