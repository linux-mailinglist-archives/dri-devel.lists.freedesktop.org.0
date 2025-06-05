Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D93ACFA25
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 01:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62AA310E318;
	Thu,  5 Jun 2025 23:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nVavJEEy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C38F10E318
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 23:44:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 679EAA50546;
 Thu,  5 Jun 2025 23:44:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB881C4CEE7;
 Thu,  5 Jun 2025 23:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749167087;
 bh=FdPpkkiyTjrRf1k9kXD8FW3k60ZDUpf8wSRXYAtaJek=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nVavJEEyPDh4SmnZlblEpJ1MOh4t/AdHhrRShrX8jso6gmGzRjllq6fx7z9Hqh44s
 MgOWF2oF6+bGCDN5BZ9fiIOxzZd0MGhbfjDW6yI90C9+bewe38nvCUmGO7vNVbc6dp
 cPk6vVqq5e7jgb40CEjasC3/nCJxHQdHSUNeAWqc2f4kzRo1hnQnDwcRMTYpNcSrYS
 rsU1vjqGUzQxXEe+WxjW1CWavgmpGPlS/YuwqJFHRdelq8u5GktSozVwEDvpErrGyp
 Xff377qHTjEgQ/x99Xo7FsrzjYqmsbxXbDSZrwhgdBSEID2Qm0Jo9cIkNknBz7G1lD
 UnBoUXeM4j6cw==
Date: Thu, 5 Jun 2025 18:44:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>,
 Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
 Stefan Agner <stefan@agner.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/1] dt-bindings: lcdif: add lcd panel related property
 for imx28
Message-ID: <174916129118.3337875.11119960463173583665.robh@kernel.org>
References: <20250529200520.798117-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529200520.798117-1-Frank.Li@nxp.com>
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


On Thu, 29 May 2025 16:05:19 -0400, Frank Li wrote:
> Allow lcd panel related property for imx28 and keep the same restriction
> for other platform. It is legancy platform and set these property to
> deprecated.
> 
> Fix below CHECK_DTB warnings:
> arch/arm/boot/dts/nxp/mxs/imx28-apx4devkit.dtb: lcdif@80030000 (fsl,imx28-lcdif): 'display', 'display0' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/display/fsl,lcdif.yaml           | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 

Applied, thanks!

