Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A031ACFA1F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 01:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF39710E14D;
	Thu,  5 Jun 2025 23:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U1Bqm2Dj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A3210E14D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 23:44:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C2CE5A4FF1E;
 Thu,  5 Jun 2025 23:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D478C4CEEF;
 Thu,  5 Jun 2025 23:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749167052;
 bh=ci1tb/wXcXuwrPfKM5LKaLeTe08xlJRjZvzDC9gp/jc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U1Bqm2DjqrbLuHTabKUdf6xvl3KXQiqUlfetXxrdz5ncjDsH0m8vUjilY2ecMylD3
 HrSVk8zr9NI3fE2rK2buaHCY1IVR15VXT8JepKXyCZvwDl2QnjVBirdHZuII7WenxP
 kpnXCHJeG3kon0P0+xv5YWCdlcztnKdSxGonNMfiHDvMXSxY5tEKIG/Iuw2bcyaBN5
 QDsT4xTDpDJwqyV36zq/l3ECN1MQ4sF3KdLPmPxu14UFKwz7X5ZE+j3aep53RSwedh
 YPPFG4cJ2Y5LDK1taVW57xYP1pK7M9ZSR70IfAoTq7HycjmquvQp0TGz2CWnOGVpsl
 xMUqNjaTdxU9A==
Date: Thu, 5 Jun 2025 18:44:10 -0500
From: Rob Herring <robh@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, David Lechner <david@lechnology.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: convert sitronix,st7586 to YAML
Message-ID: <20250605234410.GA3479190-robh@kernel.org>
References: <20250530-devicetree-convert-sitronix-st7586-to-yaml-v1-1-c132b512ec57@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-devicetree-convert-sitronix-st7586-to-yaml-v1-1-c132b512ec57@baylibre.com>
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

On Fri, May 30, 2025 at 06:05:42PM -0500, David Lechner wrote:
> Convert the sitronix,st7586 binding documentation from .txt to .yaml.
> 
> Also added a link to the datasheet while we are touching this.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>  .../bindings/display/sitronix,st7586.txt           | 22 --------
>  .../bindings/display/sitronix,st7586.yaml          | 61 ++++++++++++++++++++++
>  MAINTAINERS                                        |  2 +-
>  3 files changed, 62 insertions(+), 23 deletions(-)

Applied, thanks.

Rob
