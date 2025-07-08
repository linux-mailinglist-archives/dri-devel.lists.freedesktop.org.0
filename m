Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A67CFAFD9A2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 23:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0360910E6E3;
	Tue,  8 Jul 2025 21:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ceLa8LDc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0230510E1E3
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 21:21:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B725844137;
 Tue,  8 Jul 2025 21:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42891C4CEED;
 Tue,  8 Jul 2025 21:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752009690;
 bh=BD45fOSIJuFMBAgIlSkATWlSQYal73zlmew1ys0nEOw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ceLa8LDcpUhuLf+TCrHxLAH1fLRwQgCP7HUiw3erLFEnnmi5ucOx8mzDUfhGxVCxJ
 1SiJuTWo577zuuNDx+YuZ2wjDzayqvIAU1OEz3u3h7CFn4KAID2ef9Teg0cMY1C+WA
 /5+YE0PrrhWE/6nIhAK12bMt+2PHz/FBue60O38wno5DNf3RxcwdhFvRcG3ldfr7ax
 lg9PXvX40G3mpjacx7sycLPDYHelmuurrhjuTgoqjPkUvDdAa0zu9FOxJPX0rtW5cY
 yoBtswoYsblAYTRoMoZtOXD382/XQhcGAl+kMLZo1D2SlSoa7ku7aC1P5mhpZUEkmI
 o54yV+XskZadA==
Date: Tue, 8 Jul 2025 16:21:28 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Wig Cheng <onlywig@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 3/3] dt-bindings: display: Add Mayqueen Pixpaper e-ink
 panel
Message-ID: <175200964552.1075683.215921884605311329.robh@kernel.org>
References: <20250708-drm-v1-0-45055fdadc8a@gmail.com>
 <20250708-drm-v1-3-45055fdadc8a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708-drm-v1-3-45055fdadc8a@gmail.com>
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


On Tue, 08 Jul 2025 18:06:46 +0800, LiangCheng Wang wrote:
> The binding is for the Mayqueen Pixpaper e-ink display panel,
> controlled via an SPI interface.
> 
> Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
> ---
>  .../bindings/display/mayqueen,pixpaper.yaml        | 63 ++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 

This should be patch 2. Bindings come before users of them.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

