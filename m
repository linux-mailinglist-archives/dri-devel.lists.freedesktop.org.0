Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F108202D5
	for <lists+dri-devel@lfdr.de>; Sat, 30 Dec 2023 00:37:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96A610E297;
	Fri, 29 Dec 2023 23:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F44C10E297
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 23:37:05 +0000 (UTC)
Received: from i53875a56.versanet.de ([83.135.90.86] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rJMPN-0004lD-SV; Sat, 30 Dec 2023 00:36:53 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Alex Bee <knaerzche@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: (subset) [PATCH v4 00/29] Add HDMI support for RK3128
Date: Sat, 30 Dec 2023 00:36:52 +0100
Message-Id: <170389300283.2698513.7009749210069050452.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231222174220.55249-1-knaerzche@gmail.com>
References: <20231222174220.55249-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Dec 2023 18:41:51 +0100, Alex Bee wrote:
> This is version 4 of my series that aims to add support for the display
> controller (VOP) and the HDMI controller block of RK3128 (which is very
> similar to the one found in RK3036). The original intention of this series
> was to add support for this slightly different integration but is by now,
> driven by maintainer's feedback, exploded to be a rework of inno-hdmi
> driver in large parts. It is, however, a change for the better.
> 
> [...]

Applied, thanks!

[02/29] drm/rockchip: vop: Add output selection registers for RK312x
        commit: 407eaa4aa64a8429094fa75fac00fff5e471138d
[03/29] drm/rockchip: inno_hdmi: Fix video timing
        commit: 47a145c03484d33e65d773169d5ca1b9fe2a492e
[04/29] drm/rockchip: inno_hdmi: Remove useless mode_fixup
        commit: 099be7b6718685ebafb417e74bb637abf992474a
[05/29] drm/rockchip: inno_hdmi: Remove useless copy of drm_display_mode
        commit: 8f0df2012b8a94aed0cc450016f7592c24e92cfb
[06/29] drm/rockchip: inno_hdmi: Switch encoder hooks to atomic
        commit: ff4d4fa76fcc19f7d5d261f717121f0a88ec4e30
[07/29] drm/rockchip: inno_hdmi: Get rid of mode_set
        commit: d3e040f450ec8e46ff42fa495a433b976ab47686
[08/29] drm/rockchip: inno_hdmi: no need to store vic
        commit: d7ba3d711cf537ef0ece14cd85d2113ca338a00b
[09/29] drm/rockchip: inno_hdmi: Remove unneeded has audio flag
        commit: f8723484e045ff2d176124484907ec0199c55a0c
[10/29] drm/rockchip: inno_hdmi: Remove useless input format
        commit: c1ceee3248742149d1a602fd913bd88857da1d52
[11/29] drm/rockchip: inno_hdmi: Remove YUV-based csc coefficents
        commit: 139771b8239c43ad1bd6c2976aa12788096a5483
[12/29] drm/rockchip: inno_hdmi: Remove tmds rate from structure
        commit: 5f92474844a4fcb7997da20dd1de2031aed1d794

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
