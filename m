Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B984CCC35FD
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 14:56:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB1710E2DC;
	Tue, 16 Dec 2025 13:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uy60xRSU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF8510E2DC
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 13:56:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 25BD16001D;
 Tue, 16 Dec 2025 13:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7CBC4CEF1;
 Tue, 16 Dec 2025 13:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765893398;
 bh=cCyl1GPMdqGVBfdBvKiuIVvMj6Pu2aFTMCmNf78d8Rw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uy60xRSUaZAMcyYPFge1ofcg3ah+qbdYctzuVNMjbDHEInAxucDSDtJjawpAkfI/r
 vCFTyzbE93hjThDVWbcLlujf4U3QhKZUODTl7Fiv3I7xp5J7kHphdb1ioF5BtkRfG9
 MYpaMB0Gn+eDVqmfi9sQG3LD07DMwtM4iDdp/WXHa4NqrEdUpFpfK3LCch9fBT5wrF
 /M3ReZtKfBMNNhM5+jQgemqWD2T7+9qa+oK47afs0acSw0vLcYZqwU8M3aM0dU5awS
 ugW5R+Ka9kO7G+t50zjuBHAbgKJe68O4hf6n6oEeqj+KNRxo/8oZhSDDWU+DUnKw+x
 57/urMQC/IqoA==
Date: Tue, 16 Dec 2025 07:56:36 -0600
From: Rob Herring <robh@kernel.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpu: img,powervr-rogue: Add Renesas R-Car V3U
Message-ID: <20251216135636.GA2080685-robh@kernel.org>
References: <20251215133839.15133-2-wsa+renesas@sang-engineering.com>
 <20251215142253.GA1324977@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251215142253.GA1324977@ragnatech.se>
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

On Mon, Dec 15, 2025 at 03:22:53PM +0100, Niklas Söderlund wrote:
> Hi Wolfram,
> 
> This is posted already here [1], not sure why it have not been merged 
> yet :-)

Because the powervr maintainers don't know they are supposed to pick it 
up? Or if it is only a binding change, it can go with the .dts changes.
 
Anyways, I'll go apply it now.

Rob

> 
> 1.  https://lore.kernel.org/linux-renesas-soc/20251106212342.2771579-2-niklas.soderlund%2Brenesas@ragnatech.se/
