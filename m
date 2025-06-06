Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CB3ACFB29
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 04:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85EF510E036;
	Fri,  6 Jun 2025 02:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mgI7oD4a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF2410E036
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 02:13:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 29E945C5AEA;
 Fri,  6 Jun 2025 02:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E5EAC4CEE7;
 Fri,  6 Jun 2025 02:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749175993;
 bh=cz6HkeP+ZJjaXp3JzlgxllT3hjtl/nBcoCl/9v5xo28=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mgI7oD4aBRedU0n12OSdUhdomkHZKYynmTdrj/fI5Rnp6Y+B7zRNvqOln6yuCDnyr
 uD4YXO2Kf3YfHrlRefYVjz2Ld0KMUklSIAs+RWVRIAEFFH6TG5FTQBLRHBEa05Ef3b
 x+y6xTJsGtAMX9E4GpzWGeUWtx5EFdR68Pcv0nnzQC+3NvxOWi9E71vaIIKcNH3BL3
 3fJ7POIMgoqQlVTDPi4dFNOeUuyHoKkVNGzmH6ynNUOHVZ0a5M0dUlbdY4GbJz3cKH
 WXYdBwaBdZsIf/KPg8Petd83jggcuBq1iub7u7QU6mdXMF+mgkE9C8ztAI90fHKMss
 bPDrUuWR0sGGQ==
Date: Thu, 5 Jun 2025 21:13:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 wahrenst@gmx.net, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: display: convert himax,hx8357d.txt
 to yaml format
Message-ID: <174917598948.3786836.9401848731451916203.robh@kernel.org>
References: <20250602152814.949671-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602152814.949671-1-Frank.Li@nxp.com>
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


On Mon, 02 Jun 2025 11:28:13 -0400, Frank Li wrote:
> Convert himax,hx8357d.txt to yaml format.
> 
> Additional changes:
> - add spi parent node in examples.
> - ref to spi-peripheral-props.yaml.
> - change himax,hx8357a to himax,hx8357 to align driver and existed dts.
> - add himax,hx8369a and fallback to himax,hx8369.
> - allow spi-cpha and spi-cpol to align existed dts.
> - add im-gpios for interface selections.
> - add reset-gpios.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - update MAINTANERS files
> - replace gpios-reset with reset-gpios, kernel have quirk for it.
> ---
>  .../bindings/display/himax,hx8357.yaml        | 78 +++++++++++++++++++
>  .../bindings/display/himax,hx8357d.txt        | 26 -------
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 79 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/himax,hx8357.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/himax,hx8357d.txt
> 

Applied, thanks!

