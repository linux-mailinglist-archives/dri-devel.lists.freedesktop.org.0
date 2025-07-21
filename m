Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D012B0BF97
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 11:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB22B10E266;
	Mon, 21 Jul 2025 09:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PcLdB/5O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6259410E266
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 09:05:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0EB0E45989;
 Mon, 21 Jul 2025 09:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB0FC4CEED;
 Mon, 21 Jul 2025 09:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753088710;
 bh=mPz06fvHGJS3IqG6pR8pv22PSERO2G5DHxglf8CS8S8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PcLdB/5OATdpifzdPVHBnD7jY4ntBYQ+RoyAN3kug0ppoeuK5wqX7nW6oK3Bntx70
 TeZan1U82ZkJOi7jjGEO8fmavhEDrS0r6H5n/VrgNXrhFyorNxACbd9Le+9k3h/gMO
 gdH/v+ENMDfI1202+ct9ZKBzuZBK5r5fWhzzibbPykeyYv5LeB2/lXXzioaHJZZcpQ
 fo5/x5z3lE0MsulrODgHIU+FtSdW42z6RDHqmFlVxUOrmFnJ10lOyAD41p7CPDSOeG
 bZyl1g3zv3de+tGcAQ5XBIa+9iYJImpTSgl7nBr0tqZvj5cxUOMaSET4u94Ha/EMLr
 3Mu77StA38p+A==
Date: Mon, 21 Jul 2025 11:05:08 +0200
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
Subject: Re: [PATCH v2 06/12] dt-bindings: sram: sunxi-sram: Add H616 SRAM C
 compatible
Message-ID: <20250721-spry-nifty-bandicoot-c7c4ad@kuoka>
References: <20250720085047.5340-1-ryan@testtoast.com>
 <20250720085047.5340-7-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250720085047.5340-7-ryan@testtoast.com>
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

On Sun, Jul 20, 2025 at 08:48:44PM +1200, Ryan Walklin wrote:
> Add a compatible string for the H616 SRAM C region which is
> functionally similar to the A64 SRAM C region.

h616 for the parent device is already documented in the top, right? This
should be one patch.

Post complete bindings for the device, not chunk by chunk.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

