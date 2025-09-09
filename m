Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97103B49E50
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 02:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C2210E337;
	Tue,  9 Sep 2025 00:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DEjAnFvV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA7110E337
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 00:49:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4941B60140;
 Tue,  9 Sep 2025 00:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5BB6C4CEF1;
 Tue,  9 Sep 2025 00:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757378980;
 bh=LQdIjGA0RNJfpAshsgQiaTl641ej9IcHvJemsA2HaVc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DEjAnFvVJV70t+cqG1zPZc4VDEw9jZdRlv2CZ/TQ7EMJDgLhMY9aOixn3O9fXn3pg
 rxycI98+T+nYtMg+ZZcx+/AystCGSWx24HU1WlQb1tgtlPEKHxiJTq97+cTueyysPI
 5I3TZeQ/YUoGGJP1cjGO9re3wn7pcxjoJijO/4W9AHJRT0IstYHGHVStUDW/F7L70Y
 43Htj9vxSPdhFgAvtbCuER+ORqS0ywMiOsa3qtsUeVpIUkf0FdGXvEmzSGJzCY7dro
 l7qzALqD3DkbHZFA9YC/b+vjGjpxZNOzYK9HOs7QRkFsqNV4e5bF9+o3MNWAmvHhaL
 J3UbkZ9LK/L5g==
Date: Mon, 8 Sep 2025 19:49:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-staging@lists.linux.dev,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Prashant Gaikwad <pgaikwad@nvidia.com>,
 linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-clk@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Dmitry Osipenko <digetx@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <treding@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jonas =?iso-8859-1?Q?Schw=F6bel?= <jonasschwoebel@yahoo.de>
Subject: Re: [PATCH v2 12/23] dt-bindings: display: tegra: move
 avdd-dsi-csi-supply from VI to CSI
Message-ID: <175737897848.2324392.4970104076561451474.robh@kernel.org>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <20250906135345.241229-13-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906135345.241229-13-clamor95@gmail.com>
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


On Sat, 06 Sep 2025 16:53:33 +0300, Svyatoslav Ryhel wrote:
> The avdd-dsi-csi-supply is CSI power supply, it has nothing to do with VI,
> like same supply is used with DSI and has nothing to do with DC. Move it
> to correct place.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml   | 3 ---
>  .../devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml | 3 +++
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

