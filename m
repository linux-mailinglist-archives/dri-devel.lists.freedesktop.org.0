Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7158B0BF93
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 11:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFFE10E262;
	Mon, 21 Jul 2025 09:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HkOy6hTH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407E810E262
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 09:03:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 73C26A527D0;
 Mon, 21 Jul 2025 09:03:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91394C4CEED;
 Mon, 21 Jul 2025 09:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753088613;
 bh=2WyU0FIwwAaqd7wKJ14a9HbxLjKc9PEgGxTV9aHjfwE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HkOy6hTH5OkSNlT+Ks1wifmkI4AbOHdrXmvPN0zXOiYQEw8c30+iPdqSyFsAl2LKV
 gEIl4zbosH9WaOKEquHdrKFCkwi2vfa1AQKd6127Vl9woCogY6Yy6ZF/AE9wagCw7b
 YIJ0OvPYGoa3JLETOoM8wTwgqei4JM0gQ+3EzfGrcNbMuJbMcZOlkenp9Zv5NpdU4a
 vl5UmzhnsZ7a4Stjzkg47tMX82ydOP7X3YKDUIOQtTLwnGF3ySqhccVuPrIa2y6KL0
 9nabpSOiCrhhX+GCnafaIiYJLEvmYt84BSfIbaWorS58FnF+dSIoUX4Xdrz4PFw6i6
 9ssz9OAyrbFTQ==
Date: Mon, 21 Jul 2025 11:03:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, 
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v2 04/12] dt-bindings: display: sun4i: Add compatible
 strings for H616 TCON TOP
Message-ID: <20250721-heretic-solid-firefly-05ce87@kuoka>
References: <20250720085047.5340-1-ryan@testtoast.com>
 <20250720085047.5340-5-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250720085047.5340-5-ryan@testtoast.com>
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

On Sun, Jul 20, 2025 at 08:48:42PM +1200, Ryan Walklin wrote:
> Add compatible string for allwinner,sun50i-h616-tcon-top with a
> fallback string of allwinner,sun50i-h6-tcon-top.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> 
> --
> Changelog v1..v2:
> - Add H616 TCON TOP compatible.
> ---
>  .../display/allwinner,sun8i-r40-tcon-top.yaml       | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

