Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8099AACFB1D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 04:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403BF10E140;
	Fri,  6 Jun 2025 02:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n0qgeNSA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962A910E140
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 02:08:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B92E9A4F1F9;
 Fri,  6 Jun 2025 02:08:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30390C4CEE7;
 Fri,  6 Jun 2025 02:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749175699;
 bh=YTdf3xm7wZ7lUC4dCzd5973Ix6qiOcyX9BbD6pAEsLs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n0qgeNSAQ2lpHZ3DG2HYw6oyiOZfMZlU33z+/XIvr5hvN8XLfZnw1JeeF3RWPVPYS
 Oin/+k2n/tJjx2XNCJPPCeiIZP7nXGGKHxqFRxmcTqdFL2fy219MQzBcXYKTson/A1
 ri2mjCJI/nnfe8ht4RkXYys8S+3r054PzTQs6ecrJDkXIaiCjHbPwX8eXkSlp0pAqu
 rF1AT3Rlg0VO3faQvRaKi60C7Wr+gHuMyvvtSf0FVbzV+bkrD28+H6BKSAaZ5Xb+3S
 aaTFpX+9mPMCkXOiBhsEx73LhSrAYwv2k9c5VPqzj/HxsLBoxx48CSTwktgBVhjj4Z
 478AOOBP5Z8Vw==
Date: Thu, 5 Jun 2025 21:08:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
 Maxime Ripard <mripard@kernel.org>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Simona Vetter <simona@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andre Przywara <andre.przywara@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/1] dt-bindings: display: allow resets  property
Message-ID: <174917569478.3779604.1149263045871881557.robh@kernel.org>
References: <20250602144906.944866-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602144906.944866-1-Frank.Li@nxp.com>
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


On Mon, 02 Jun 2025 10:49:06 -0400, Frank Li wrote:
> Allow resets property to fix below CHECK_DTB warning:
>   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: lcd-controller@40008000 (arm,pl111): 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/display/arm,pl11x.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks!

