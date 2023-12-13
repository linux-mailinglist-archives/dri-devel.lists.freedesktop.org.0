Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 259A381152C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 15:46:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B70410E008;
	Wed, 13 Dec 2023 14:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E32A10E008
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 14:46:51 +0000 (UTC)
Received: from i53875b61.versanet.de ([83.135.91.97] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rDQVN-0000JI-AG; Wed, 13 Dec 2023 15:46:33 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Subject: Re: (subset) [PATCH v5 00/16] Add VOP2 support on rk3588
Date: Wed, 13 Dec 2023 15:46:31 +0100
Message-Id: <170247871959.753029.11166929824242336708.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231211115547.1784587-1-andyshrk@163.com>
References: <20231211115547.1784587-1-andyshrk@163.com>
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
Cc: devicetree@vger.kernel.org, hjc@rock-chips.com,
 linux-kernel@vger.kernel.org, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, kever.yang@rock-chips.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Andy Yan <andy.yan@rock-chips.com>,
 chris.obbard@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Dec 2023 19:55:47 +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> This patch sets aims at enable the VOP2 support on rk3588.
> 
> Main feature of VOP2 on rk3588:
> Four video ports:
> VP0 Max 4096x2160
> VP1 Max 4096x2160
> VP2 Max 4096x2160
> VP3 Max 2048x1080
> 
> [...]

Applied, thanks!

[10/16] dt-bindings: display: vop2: Add rk3588 support
        commit: 4ccdc92c1fea732fac8f3438d6288719055fa141
[11/16] dt-bindings: rockchip,vop2: Add more endpoint definition
        commit: dc7226acacc6502291446f9e33cf96246ec49a30
[12/16] drm/rockchip: vop2: Add support for rk3588
        commit: 5a028e8f062fc862f051f8e62a0d5a1abac91955
[13/16] drm/rockchip: vop2: rename VOP_FEATURE_OUTPUT_10BIT to VOP2_VP_FEATURE_OUTPUT_10BIT
        commit: 9d7fe7704d534c2d043aff2987f10671a8b4373d
[16/16] MAINTAINERS: Add myself as a reviewer for rockchip drm
        commit: 6c3ab21f37a97a868193ccbeb8a492e51210ff31


I skipped the debugfs patch for now, as I need to look at that separately
and of course the dts patch as that needs to wait for iommu maintainers
to pick up the binding addition.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
