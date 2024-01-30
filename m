Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FA4842D76
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 21:01:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2432A113519;
	Tue, 30 Jan 2024 20:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A841113516
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 20:00:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EE57ECE1C85;
 Tue, 30 Jan 2024 19:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0755BC433F1;
 Tue, 30 Jan 2024 19:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706644799;
 bh=DLB6R95v5Kld/5URKjV4Xvg/XJ4NDDV4ZCrgbS55T18=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=huW+FrgGPDvXzbNGsyv0QIZyqg7hkmu3FC/PzcRaoEkDcU7BFV1gtrNU9JbHRunLo
 SLMoQUsuRFLffpRS22+RR1aBpDuHqvpnZIgdGgAasZ+gD9JMdpGrwvYiCGvSQlTKpw
 vuLGPIOqyYIOK4HzxK9KN0oyeyfPfGKORXeKmK4w+Jr19rc0G/2M0Q929Mewv35LtQ
 eJw8fmORITKtHiBCl0Zv+rp1iUnXLeWoB3nIKdodS3UXvr6mwLTUFjBQMdAnLVIYoA
 Y5wLeZaBL73vm6aI37k27nEz1LZtCXmig+aH8B2tVRoRWc+xKIG82PI74oCVPFQzSg
 SZ93ue2gSrtEQ==
Date: Tue, 30 Jan 2024 13:59:56 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: nxp,tda998x: Fix 'audio-ports'
 constraints
Message-ID: <170664479278.2235793.18378217102274241986.robh@kernel.org>
References: <20240122204959.1665970-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240122204959.1665970-1-robh@kernel.org>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Thomas Zimmermann <tzimmermann@suse.de>,
 Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 22 Jan 2024 14:49:58 -0600, Rob Herring wrote:
> The constraints for 'audio-ports' don't match the description. There can
> be 1 or 2 DAI entries and each entry is exactly 2 values. Also, the
> values' sizes are 32-bits, not 8-bits. Move the size constraints to the
> outer dimension (number of DAIs) and add constraints on inner array
> values.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/display/bridge/nxp,tda998x.yaml    | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Applied, thanks!

