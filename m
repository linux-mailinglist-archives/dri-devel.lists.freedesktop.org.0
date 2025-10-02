Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D20BB2725
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 05:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717FA10E05B;
	Thu,  2 Oct 2025 03:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YZtgHK7x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E0C10E05B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 03:37:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1FED363D39;
 Thu,  2 Oct 2025 03:37:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B69C4CEF9;
 Thu,  2 Oct 2025 03:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759376270;
 bh=5KafbAB7/NJXwoTixCHSHk43VoeUSel+4sYcOzmnuwE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YZtgHK7xZH4wEbt8+g2vs/Gwxt3MXurqW83BM26iTzuxi2Osb/Ufl5Il9gw0odhrE
 1VtqiraAqUgDTAab6U/eak/zzZON3m54XCjqmLgrXNz3cnphQsu7TfCuUxvZhEEfWN
 rKxkR77p8oJQaWXTo1co0vWvl9ytBjJQHy2q0BXxsVl3uPCtltgE9E3k49Q0TQCeT/
 22E3LPZMZJb7NMJmXj65ruDKUwZUNY9f7VeMB/98FvHe4HocNhGokVHPzIwkQWRjHn
 6YhxqQVBWWNBfI42PqvDbwGhNZ1Kd36F12ZFpPnRSPl4pY8LYqR1frRuz2xTdbaN6t
 t7I7Pcnf80d2A==
Date: Wed, 1 Oct 2025 22:37:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: steven.price@arm.com, devicetree@vger.kernel.org, tzimmermann@suse.de,
 marek.vasut@mailbox.org, krzk+dt@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 imx@lists.linux.dev, dri-devel@lists.freedesktop.org,
 liviu.dudau@arm.com, conor+dt@kernel.org,
 Rain Yang <jiyu.yang@nxp.com>, simona@ffwll.ch, airlied@gmail.co,
 boris.brezillon@collabora.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: mali-valhall: make mali-supply
 optional
Message-ID: <175937626733.3023972.12745078904801093915.robh@kernel.org>
References: <20250928090334.35389-1-jiyu.yang@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928090334.35389-1-jiyu.yang@oss.nxp.com>
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


On Sun, 28 Sep 2025 17:03:33 +0800, Rain Yang wrote:
> From: Rain Yang <jiyu.yang@nxp.com>
> 
> Not all platforms require the mali-supply regulator. This change removes
> it from the required list in the binding schema, and make mali-supply
> required for rk3588 only.
> 
> Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
> ---
>  .../devicetree/bindings/gpu/arm,mali-valhall-csf.yaml          | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

