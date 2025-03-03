Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 591B7A4CE9E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 23:43:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5A410E2E8;
	Mon,  3 Mar 2025 22:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="aDnmYlnm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C5B10E2EB
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 22:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AVKxuo1W1BxE3FJKf7YbMkOhKpBvK2Ol0T0KlNBKv7o=; b=aDnmYlnmuYrhIaA0ONYcTOUxRY
 KZ7m8hrWZnAkSc/n4H5qBIjO2jzAITieERvYwcbgNsC4HJv6piGgoWLvrHd4WZ1lc25QWfFwcgXcC
 KgrI0KQ5BSzpUXxPF1Mvlrms/K0lNbBNLgJmHB7ne0/52hnujUALKrWqF4TSTalaRCCr4upJ5Q9u8
 Bt2a0hojXOOlm7Bzd24GXk0CKbp1jUmMa1OE/cEcYW6WGyjQdUHAu8mbMQ18aj6mbr8PlTPehwi4q
 Mc1e//pi1ncYZlLsURNMjw2K0ed9G4Lh+9S/BGXKzEe5o7yfDHhIF55gN/jz3MRXEeJFalp06uhh2
 pIE9G4RQ==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tpEVK-0005z3-Hk; Mon, 03 Mar 2025 23:43:18 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/rockchip: vop2: add missing bitfield.h include
Date: Mon,  3 Mar 2025 23:43:16 +0100
Message-ID: <174104179297.19992.1129192365556530821.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250303182256.1727178-1-heiko@sntech.de>
References: <20250303182256.1727178-1-heiko@sntech.de>
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


On Mon, 03 Mar 2025 19:22:56 +0100, Heiko Stuebner wrote:
> Commit 328e6885996c ("drm/rockchip: vop2: Add platform specific callback")
> moved per soc configuration code to the other per-soc data into
> rockchip_vop2_reg.c, but forgot to also include bitfield.h for the used
> FIELD_PREP macro. Add this missing include.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: vop2: add missing bitfield.h include
      commit: 95a5c9d197bb22a506913acb330a926d4e51aa95

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
