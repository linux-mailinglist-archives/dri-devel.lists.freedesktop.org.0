Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4F3BF1B88
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 16:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0719B10E44D;
	Mon, 20 Oct 2025 14:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="UjckIrLk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E39910E44D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 14:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=Pflb5s+SJUFaJBxo0UKXFW7gXNOuL5Iw15aBc9AITb8=; b=UjckIrLksIfw9rYYkmWqAmVSIo
 rTyZFqdvbheIOnWfSV5jlPjiq6ydD7k2N5zlbS0qQUjsW2xRr0jbxdOHnkBQBLaA8ZQZeaZJb4/eb
 YjiTSWuWIktubek2jlZm4KVyKM8/19QqCvzBrjmuQ8wJxJRvWwhXOejTzMKidvGBAqx2XrEQNdc2q
 +sQhtx5Eqo0g+Cav2OtV6IE4oTlEXW6HgFJusgH3SsrU5oglwCMVaavJZN6alTbkRx6BVc+vuu+8U
 6pIF+QMIDgUwrJqyZZqHV1GWzDQ4ZwJHVjsD1nguzj1m33Elbf/feRQP1hNIRcXwAFOcDPYLGWdMD
 jAWH3zmA==;
Received: from [212.111.240.218] (helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vAqX0-000213-GG; Mon, 20 Oct 2025 16:06:38 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Brian Masney <bmasney@redhat.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v2 8/9] phy: rockchip: phy-rockchip-samsung-hdptx: convert
 from round_rate() to determine_rate()
Date: Mon, 20 Oct 2025 16:06:37 +0200
Message-ID: <3378525.aeNJFYEL58@phil>
In-Reply-To: <20250810-phy-clk-round-rate-v2-8-9162470bb9f2@redhat.com>
References: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
 <20250810-phy-clk-round-rate-v2-8-9162470bb9f2@redhat.com>
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

Am Montag, 11. August 2025, 00:45:36 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Brian Masney:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>


Reviewed-by: Heiko Stuebner <heiko@sntech.de>


