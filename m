Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E306A55398
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 18:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46FB10EA67;
	Thu,  6 Mar 2025 17:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tvyeca8q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D6B10EA5A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 17:54:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 91361A4506C;
 Thu,  6 Mar 2025 17:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B22CEC4CEE4;
 Thu,  6 Mar 2025 17:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741283690;
 bh=qdm0HXf809KweRtwUqUjuGRSBGOGTK1ZwZaRFgirYRE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tvyeca8qxs7P3W1cB3g1bfO7xa34ZgU6UzS/2Xw2Ke8Y5C+SHP42WUYKTCA/XDjSz
 FjbkFpLBkmJ68b7CEwE9qW2Iz0u9aFlQbYa7hPxav/f5BwY+9xjfwIjSM80HNOTp1q
 deE5Xv3bzsptGL79GvA31/lWGAxZiQ4mVAsy2U2VB5QLW6En9wYGDzl0lBFgxgXKcd
 HtICT7lmTGARxxeBF/1IN/Bx1ztga1oBogdPLEmauOzTMIrybmbYCgGdnLPuVx+HOi
 eKDaqhfLtiO+g7wrIFMgzJz12m3R0G+Bh6USaIIo3MCOvBUS/2U9lUgHjU7AHeNsYd
 bT/69fw5lyhTQ==
Date: Thu, 6 Mar 2025 11:54:47 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: mitsubishi,aa104xd12: Allow
 jeida-18 for data-mapping
Message-ID: <174128367535.567143.5317524679699355354.robh@kernel.org>
References: <20250225210316.3043357-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225210316.3043357-1-robh@kernel.org>
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


On Tue, 25 Feb 2025 15:03:14 -0600, Rob Herring (Arm) wrote:
> There's both a user and the datasheet[1] indicate that 6-bpp is supported
> as well.
> 
> [1] https://agdisplays.com/pub/media/catalog/datasheet/Mitsubishi/AA104XD12.pdf
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/display/panel/mitsubishi,aa104xd12.yaml          | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Applied, thanks!

