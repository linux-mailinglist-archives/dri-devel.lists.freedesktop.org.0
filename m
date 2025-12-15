Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E971FCBE26D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 14:57:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F69E10E4C1;
	Mon, 15 Dec 2025 13:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="BbC6Z7lJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB5910E264
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 13:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=WkV3ZYGagO+HflHRU/1YPFeSRHTuGtO52SiUwSKKXFA=; b=BbC6Z7lJ2XItOn0bfXcTYh28bz
 IZKwRg+T0kQqhWqbpfkDUH4ezLHE4P2yoE5FKsxECBBEduda6kKAAQhIPfWAE/Gw85DALaqPsRvFf
 tpkvPaDdhbO/z1juZdJXdJcr0F7mbwl3mVUJXiwt7V2lFIwDQCHequvzBl827mrXOC9DcRChIgk0h
 fqmhDs64qOjKSwxGlr0kVIJy1+GtNNrDsS0DjiP+wk5bxp/2LuWSRge53zvP2bG/32edtNdyFTcc6
 rbj45SkE4OtHtTJ6wloVS5QJLuB7akl9QDTaKHnuFtPzPEiG+fvAKz5vx0mMqiCJGzPznuwkNG5ec
 /94ExG+w==;
Received: from [192.76.154.229] (helo=phil.dip.tu-dresden.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vV94f-0001YU-Sa; Mon, 15 Dec 2025 14:57:17 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quentin.schulz@cherry.de, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, cn.liweihao@gmail.com
Subject: Re: (subset) [PATCH v2 0/9] General RK3368 HDMI support and 2 outputs
 for RK3368-Lion
Date: Mon, 15 Dec 2025 14:57:15 +0100
Message-ID: <176580702585.1452104.11896620179705853130.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251021074254.87065-1-heiko@sntech.de>
References: <20251021074254.87065-1-heiko@sntech.de>
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


On Tue, 21 Oct 2025 09:42:45 +0200, Heiko Stuebner wrote:
> This series adds the necessary bits for HDMI output on RK3368 and enables
> this on RK3368-Lion. At the same time, use the recently added DSI support
> to enable the generic Video-Demo-adapter as an overlay on Lion as well.
> 
> 
> The reason I'm shaving this Yak is that the recently added DSI support
> created DTC warnings about a single endpoint with an address.
> 
> [...]

Applied, thanks!

[1/9] dt-bindings: display: rockchip: dw-hdmi: Add compatible for RK3368 HDMI
      commit: 0edbd43e0c149152b917c0cde61e4bd34a5bd118
[2/9] drm/rockchip: hdmi: add RK3368 controller variant
      commit: e7a943f0824b584e42847ad9642d7fb751022cf6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
