Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA627A400E6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 21:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8821E10E0C6;
	Fri, 21 Feb 2025 20:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bjumTcQE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63F110E0C6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 20:29:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C3FC05C6D9C;
 Fri, 21 Feb 2025 20:28:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BFE3C4CED6;
 Fri, 21 Feb 2025 20:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740169752;
 bh=dVquMpewX/+NkVDUur45gc/Yc+Kf01Dyu5/+irO3VQQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bjumTcQEe3AkEx1htsLx8vIkarGUhMuyiJN/Y7/yuFH+aEk9JVLZiXlUQpoxscDQN
 nl1JurFoUMGGamq0lPlyRGP6+oQHdTFJ5PLY41+fhsD3Yf0islbtygj1mqFHnsG7mU
 OjZFMU3TJTJql8pF5wZfMXW3l7v4PNUFJHxPaBFz95rYCk0QSyHL9gcJ2Ma6+NGTyl
 bu6TKCukf1mcoD7Qkj5rA2i4jmvxmzH+2+d/egMUqjS8NlcItPdhALD23WPl/DvWLT
 GVREGNQjzhE7gVSIOgnIIWS3yqe9qhJyg8gWLSO/WBRnWhhPakwnjGcYk3mULXRUI9
 XpGW5nhWfYGSQ==
Date: Fri, 21 Feb 2025 14:29:10 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-renesas-soc@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 devicetree@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: gpu: mali-bifrost: Add compatible for
 RZ/V2H(P) SoC
Message-ID: <174016975012.24654.2096409843196384969.robh@kernel.org>
References: <20250218115922.407816-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250218115922.407816-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218115922.407816-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


On Tue, 18 Feb 2025 11:59:20 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add a compatible string for the Renesas RZ/V2H(P) SoC variants that
> include a Mali-G31 GPU. These variants share the same restrictions on
> interrupts, clocks, and power domains as the RZ/G2L SoC, so extend
> the existing schema validation accordingly.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!

