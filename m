Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BFAB0B8FB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 00:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E8510E39C;
	Sun, 20 Jul 2025 22:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fDsGwMVL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DA910E39C
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 22:53:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DDBD35C59B0;
 Sun, 20 Jul 2025 22:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0F5C4CEED;
 Sun, 20 Jul 2025 22:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753051999;
 bh=gu826IvHRyAEWn/2JNRgozBZ7hiQUBpc3/l9ysf5qJs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fDsGwMVLiI/LTDwH9ycnBG01VZ4rAmsujISgGH9RmHDDA9qmo8RMftEgKdWNT67L2
 eFI/lNigL9sGmVdBpkyDoTTGju7E6s7voB6+dJW0JhAEzrocdxKVh01D+m2yEgNAxy
 kL5ndJMIs4Jfznltnkv8ohMxjWnGfDqxihlR4U3QU91YOKf3IttWj7kUSt+nuiZa2W
 Fr5XpRpxfQUUW6F4yLT4qHopDHxLmIWOLStanqssPXmi89Bu2OJze8is4mirxd1l0m
 gCNn3Bv45fKjjqGxkOYBmA9e5DZFWflvdlerbtgEtr36UqCCKyGxtTiIvCK7szh8CF
 kVHaNNgUVLqLw==
Date: Sun, 20 Jul 2025 17:53:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Robert Foss <rfoss@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-kernel@vger.kernel.org, victor.liu@nxp.com,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: display: panel: Add waveshare DPI panel
 support
Message-ID: <175305199815.3017932.12028214384187991932.robh@kernel.org>
References: <20250716-waveshare-v1-0-81cb03fb25a3@nxp.com>
 <20250716-waveshare-v1-2-81cb03fb25a3@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716-waveshare-v1-2-81cb03fb25a3@nxp.com>
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


On Wed, 16 Jul 2025 16:08:30 +0900, Joseph Guo wrote:
> Add dt-binding documentation for waveshare DPI panel
> 
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

