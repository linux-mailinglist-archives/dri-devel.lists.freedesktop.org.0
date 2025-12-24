Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF91ECDD180
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 22:53:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18457112D48;
	Wed, 24 Dec 2025 21:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C7KSL8HL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C896112D46
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 21:53:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 94C4960010;
 Wed, 24 Dec 2025 21:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154BDC4CEF7;
 Wed, 24 Dec 2025 21:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766613227;
 bh=jBtUeNJRO+RbhNPQJjWLbiBQiPsGJ9VvONJQVLV0Q1c=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=C7KSL8HLRTy1Rk1rIfQkwTEDk+GAA7eqse4JiJ11JBbVPOp9zcd+4E+g3RRAUbTs4
 KinvoQ/FKT32X7ZJqskw6uFUnCH0qXEATSskCo7yhDmKB7Hm5uHr/XBb8jY2q5K0ck
 jSyXCbdZO5E2aetjKXi/ns+jPd1X1ZpQr6og2NXOYv0RGZuBp0X4SeEf3B0TAatLnS
 vMzH9uvgjAv+1qTEY3KS/4SuX9KN/B70QJ6ix/RhVGURosukgDjftpbxLO6g2WBCjS
 gtOJesCpyd1vP8p1pVqS2UqZuOUAt8f4toWDUdbha5uTIJD/a17dQ2JKVFPXHvtv5g
 uKeORvnnmAZyw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <176656156358.817806.16966474957670370356.b4-ty@kernel.org>
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
 <176656156358.817806.16966474957670370356.b4-ty@kernel.org>
Subject: Re: [PATCH v3 0/9] phy: convert from clk round_rate() to
 determine_rate()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Brian Masney <bmasney@redhat.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Heiko Stuebner <heiko@sntech.de>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
Date: Wed, 24 Dec 2025 11:53:43 -1000
Message-ID: <176661322399.4169.14248756511703978007@lazor>
User-Agent: alot/0.11
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

Quoting Vinod Koul (2025-12-23 21:32:43)
>=20
> Applied, thanks!
>=20

Thanks Vinod! Can you provide a tag or immutable branch so I can remove
round rate from the clk core in linux-next?
