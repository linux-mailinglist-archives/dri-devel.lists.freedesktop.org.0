Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 220D04D9C7B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 14:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF9910E39F;
	Tue, 15 Mar 2022 13:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0678110E39F;
 Tue, 15 Mar 2022 13:41:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9DA44B81684;
 Tue, 15 Mar 2022 13:41:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A13C340E8;
 Tue, 15 Mar 2022 13:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647351662;
 bh=gvl9SFrDd+2JfY4XpOU21w5Fgp3RnrxgO3xzRNMW3ig=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FpIzPAInqwcWVe7lVXyZMo10uysAvQH5/+0FSS06nOQud/sjKtVu2eXUrgVVwDtnS
 K9saXWWZ1hCdhU07mL3gP1lbyLMM5ncodj0hAGG1sCe8guzPWwUCxCvCMd4UnYk0ij
 MiKnX5ElR8cklFLsknUpJxfH63KChYC/OCTeoHADKe2d7sJJxnj+KlqJSXMWCfA0RW
 7IMl8VYJBtsy0LvBdpwYawlVvfm1y/uovTsdBOXZktA8NvrkBJg6F9XHpbVdi97yvv
 ktn0TMEJDT+qVku5scquwwLC4arp4ujY52Gxd5XtzcUD53EHdZUC9sEswg4SOYFru/
 p422dM8tR7ngQ==
From: Mark Brown <broonie@kernel.org>
To: Julia Lawall <Julia.Lawall@inria.fr>, linux-can@vger.kernel.org
In-Reply-To: <20220314115354.144023-1-Julia.Lawall@inria.fr>
References: <20220314115354.144023-1-Julia.Lawall@inria.fr>
Subject: Re: (subset) [PATCH 00/30] fix typos in comments
Message-Id: <164735165474.3687547.1964402001196947729.b4-ty@kernel.org>
Date: Tue, 15 Mar 2022 13:40:54 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, linux-sunxi@lists.linux.dev,
 linux-media@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-mediatek@lists.infradead.org, Namhyung Kim <namhyung@kernel.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>,
 Jiri Olsa <jolsa@kernel.org>, linux-power@fi.rohmeurope.com,
 Shayne Chen <shayne.chen@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 14 Mar 2022 12:53:24 +0100, Julia Lawall wrote:
> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[21/30] spi: sun4i: fix typos in comments
        commit: 2002c13243d595e211c0dad6b8e2e87f906f474b

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
