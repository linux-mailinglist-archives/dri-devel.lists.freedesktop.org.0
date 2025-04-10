Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51108A83D4B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 10:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 704B810E7C9;
	Thu, 10 Apr 2025 08:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="ve0ivaWY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0069810E7DC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 08:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=EHWyZdcB8AA39zvrCK43NnP1NWZcGM90EVQitgCTQTw=; b=ve0ivaWYSEJlTm2rZRZFbfJSDo
 zTHcwz4xnyJL5ObuBLQAdC9QZ6SxkGhmjzL2hvFbD7Z+7t+JSw23lcqkpH37QfIlHHWsJ+gzKCwEJ
 lDg6fqDR26LXtGCaXX1g1XKfduFssg/6HJDxLXUtAJDoikJWnpqM0t8q4wxOgj8yWgQy8qzVGJWry
 BaUWlxDY9bLvfpPdX0Kbvk1lK1qy6fkm98GAzIVf8iUf1C7IllRHJNKZkrGLHDHDaOkUVuH7uF3YA
 8jt50uXIVw+jMDPOfDvfT/qciVDto++T7cyTVb90miGeLACLR09jWyMV3PFsgi0d2+/Gkx7b29HO+
 icxduvsg==;
Received: from i53875b95.versanet.de ([83.135.91.149]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1u2nTw-0002qP-KD; Thu, 10 Apr 2025 10:41:56 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: rockchip,vop: Drop assigned-clocks
Date: Thu, 10 Apr 2025 10:41:45 +0200
Message-ID: <174427445691.820310.13105802044398378268.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250404214030.401629-1-robh@kernel.org>
References: <20250404214030.401629-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Fri, 04 Apr 2025 16:40:29 -0500, Rob Herring (Arm) wrote:
> assigned-clock properties are implicitly allowed in any node with
> 'clocks' and don't have to be specified. The max here also appears to be
> wrong as there's a case with 4 entries.
> 
> 

Applied, thanks!

[1/1] dt-bindings: display: rockchip,vop: Drop assigned-clocks
      commit: 64e6121dc1b18a8208faf5b26efb50206722fd8e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
