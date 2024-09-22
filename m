Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B56F97E384
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 22:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE3710E239;
	Sun, 22 Sep 2024 20:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vAkQkxL4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8114310E239
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 20:52:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 802B55C560E;
 Sun, 22 Sep 2024 20:52:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D30CC4CEC3;
 Sun, 22 Sep 2024 20:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727038351;
 bh=8JrG0Uk0kZt0pPnpYEAf3tP6cQIGfmWcka0ttvTK1t4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vAkQkxL4rcNHWlT6M1CEWN3M+1s3E+OXtDX6LlnCnYtx8bG81bgDEpF9o55hD0Sqm
 32rXi9dn+AL+LCIkwPajLCPIIy1R43q2PK/D8UpKuxvOkvHZe4l7wBorGKE8d9MXTb
 RBN6wJB35L490ZQiDJwm5yUimwXUnOgnz/RugSi7cT4Y2wv7BQv7wjniUJIEa+aaj1
 f1LbQdTM8BP8PKa6z/sYi+aeCNsOESZ15/4iBuYaSxwOMIh/BRHNcoigUKpYuhXftK
 WhiFt7JgdLBc/eSiJ/Tvt4OFmvgJNJ+hpfvGPynEosVt7lpSG607REbER+hk5HOOUK
 Vc038O5X8q7xA==
Date: Sun, 22 Sep 2024 22:52:27 +0200
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
Subject: Re: [PATCH v4 20/26] dt-bindings: allwinner: add H616 DE33 clock
 binding
Message-ID: <stdck3whwhbiyryo7uwv22piaktfr6ibawl4ckjnbuxanpcmsf@7o5hybvzyrnw>
References: <20240921095153.213568-1-ryan@testtoast.com>
 <20240921095153.213568-21-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240921095153.213568-21-ryan@testtoast.com>
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

On Sat, Sep 21, 2024 at 09:46:09PM +1200, Ryan Walklin wrote:
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
> 
> Add a clock binding for the DE33.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> 
> --

Ditto

Best regards,
Krzysztof

