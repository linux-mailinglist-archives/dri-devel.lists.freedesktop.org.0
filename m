Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D875379A96E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 17:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE5E10E309;
	Mon, 11 Sep 2023 15:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EA710E1B2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 15:08:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 83BCD61208;
 Mon, 11 Sep 2023 15:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA0AC433C9;
 Mon, 11 Sep 2023 15:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694444901;
 bh=QQhUsR8kda3/hj6CcImnvWnHoUxICmdWDtUfw+d0L2k=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=oMnmqdvCbB/b9eUNHcCKrZgBIXAfEa4l3Ut8F+Krr/A+TO4Qp5xFRdmhtzOYMkOQW
 98qwiW7ihtvdhmXn9/JMY3cAkCWfkf2RS329FQiqevC0xj5zMYEDcJaG1IoD/tdcm4
 kpZWOr1Vyd7e3Vmm3u4QL91seR/p4ZlqPgFodnlHBoxj1eBGPhSgK/yrDWOIq40+f5
 aUnUpUTw2aMPaIA27iibLEyT3mePx5Lnjot6mQy4HcSMzruUmZLyKo9qd8lzteD46Z
 2M1fvO80IowMc9BrQIeMCwHpPKkPdDJZ3fzLDWpXm32vUmqUZe+eAU80MyQvPY7gmH
 AOdhADl4GZdow==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Julia Lawall <Julia.Lawall@inria.fr>
In-Reply-To: <20230907095521.14053-1-Julia.Lawall@inria.fr>
References: <20230907095521.14053-1-Julia.Lawall@inria.fr>
Subject: Re: (subset) [PATCH 00/11] add missing of_node_put
Message-Id: <169444489227.1851820.10212594180854433279.b4-ty@kernel.org>
Date: Mon, 11 Sep 2023 16:08:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
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
Cc: linux-pm@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Amit Kucheria <amitk@kernel.org>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-mediatek@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mmc@vger.kernel.org,
 Zhang Rui <rui.zhang@intel.com>, linux-media@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 07 Sep 2023 11:55:10 +0200, Julia Lawall wrote:
> Add of_node_put on a break out of an of_node loop.
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[10/11] ASoC: rsnd: add missing of_node_put
        commit: 28115b1c4f2bb76e786436bf6597c5eb27638a5c

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

