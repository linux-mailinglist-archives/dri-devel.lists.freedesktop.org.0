Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93152B32935
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 16:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0407410E1E3;
	Sat, 23 Aug 2025 14:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="yjODS2TT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4683410E1E3
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 14:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=b4szslA7ZyoDYxRL5lU3Ry83YPf61pXDu12N9fYlNnU=; b=yjODS2TTZXqlklgLHaiMWcDNiQ
 3h58mSclKn2EB8t/kPEwPboVfbiLiaNI1DsvIUWrQeJF8TIO935nUGCdEnaQXc80l6y43X1q7klkO
 Hl1DVJ7H/bH6d7s0Mp9YI921h58yRV08oisb7YhIZER4JwC/dbjT8q+73mIGtUJUZkVmVHWjJoCiR
 /rRszLMs/LBnxb6Loqq9EqqL7/QtBXWnEgVt9Y6n6zD/Pxg/FC8pcV5L2C4Jk19z92D/4l7Q79fvG
 Sx9rVGFZ9g28SI9pnX77Fnx7edcRqwxO3W+jKsbziQ24WfQgHVQF2DKYoA3QwwX7p9N5/MOROvwnJ
 V7MRdiCw==;
Received: from i53875b90.versanet.de ([83.135.91.144] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uppMF-0000aK-Bv; Sat, 23 Aug 2025 16:36:39 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: dmitry.baryshkov@oss.qualcomm.com, Andy Yan <andyshrk@163.com>
Cc: hjc@rock-chips.com, mripard@kernel.org, naoki@radxa.com,
 stephen@radxa.com, cristian.ciocaltea@collabora.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 yubing.zhang@rock-chips.com, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh@kernel.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v7 03/10] drm/rockchip: Add RK3588 DPTX output support
Date: Sat, 23 Aug 2025 16:36:38 +0200
Message-ID: <3723317.0YcMNavOfZ@diego>
In-Reply-To: <20250822063959.692098-4-andyshrk@163.com>
References: <20250822063959.692098-1-andyshrk@163.com>
 <20250822063959.692098-4-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Am Freitag, 22. August 2025, 08:39:47 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> Add driver extension for Synopsys DesignWare DPTX IP used
> on Rockchip RK3588 SoC.
>=20
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Acked-by: Dmitry Baryshkov <lumag@kernel.org>
> Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


