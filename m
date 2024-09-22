Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D925997E37F
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 22:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE0210E02B;
	Sun, 22 Sep 2024 20:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JvO3jHbs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A313410E02B
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 20:52:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9020AA4107E;
 Sun, 22 Sep 2024 20:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5E6C4CEC3;
 Sun, 22 Sep 2024 20:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727038327;
 bh=KwpcBLZJuz/IFUx3YzGkLkjPmwp09+c4661du4ZCO0E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JvO3jHbsSazItW/axOaPAiPivUaWzqbEewfZixUk6sJfk3MfknzS5Dw1gDDiXgeGQ
 yMxO6T3I1VrHMqxeeaJr3LfaGdroeDP2XpSfqsP9evyCFIR6SO7wxtRXoVKz1aZHGI
 s4y0LyQs3ewWJYlrXvwZVvc9Oac8kQm1g5LFdqTJQ2ZHF6xZDddn6wuvLeMQYBV5F7
 2+lYys86MW6ihh2Imn/BnP0KlIQaxVNnpr7G/6fZOt33FVW2czEoX68+GxyjvLkk65
 n81sHbVGIer5fSucbKGggOQagcU0YyBYQ3ZTQO0toqkGM6YFb6a1Rr01MekAtS/QmC
 dFg4vmcUMfoPA==
Date: Sun, 22 Sep 2024 22:52:02 +0200
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
Subject: Re: [PATCH v4 21/26] dt-bindings: allwinner: add H616 DE33 mixer
 binding
Message-ID: <wma4hpidn353lsika3a5t7qf3ochmtbowhp4g4vuqrvgzthltc@yfwp5qastn7f>
References: <20240921095153.213568-1-ryan@testtoast.com>
 <20240921095153.213568-22-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240921095153.213568-22-ryan@testtoast.com>
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

On Sat, Sep 21, 2024 at 09:46:10PM +1200, Ryan Walklin wrote:
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
> 
> The mixer configuration registers are significantly different to the DE3
> and DE2 revisions, being split into separate top and display blocks,
> therefore a fallback for the mixer compatible is not provided.
> 
> Add a display engine mixer binding for the DE33.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> 
> --

That's not a delimiter and you would see checkpatch warning (because it
is quite confused).

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run  and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

Best regards,
Krzysztof

