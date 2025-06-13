Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 528E8AD8841
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 11:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545BA10E94F;
	Fri, 13 Jun 2025 09:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aCQ+ArOM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A8910E94F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 09:45:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9FE655C5D0C;
 Fri, 13 Jun 2025 09:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7727C4CEEB;
 Fri, 13 Jun 2025 09:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749807936;
 bh=KZ0BWcWO/Nnu1q5NglmWAod4+nGJ2WWcd5CNjfdsUO4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aCQ+ArOMfZ8sj9/trk2RN4zzQmNDRm57UcCwHqzSNmBb3apdfrSNyzaknWyYLRPjh
 6E3L22twogCDgusyUyZzDGlDING27CHkfgVwL7Qfe5BDfSkbBp55e6vFTCsUCYhfWa
 iFB8yIknypSzugsOXAz7FH6q/xY/0xFIUp7GlroH+Qbv1fuibs4wDOAL+dnSd7SmBh
 PUekiEcVEkwP6WVmzgXHMenCSFCR5E17+KZjgA7/phOXpz9JEn4cTHyKgpHeTYwm+V
 Fhc+PM/4QdvEhSmY2I4S88xQ+fYARMAcOlJnmoU94LA5kiKThUq2MTXDYd0v0NZdZI
 bcsXM5H49D58w==
Date: Fri, 13 Jun 2025 11:45:22 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 17/20] PCI: dw-rockchip: switch to HWORD_UPDATE macro
Message-ID: <aEvzMnxgsjfryCOo@ryzen>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
 <20250612-byeword-update-v1-17-f4afb8f6313f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-byeword-update-v1-17-f4afb8f6313f@collabora.com>
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

Hello Nicolas,

On Thu, Jun 12, 2025 at 08:56:19PM +0200, Nicolas Frattaroli wrote:
> 
> PCIE_CLIENT_RC_MODE/PCIE_CLIENT_EP_MODE was another field that wasn't
> super clear on what the bit field modification actually is. As far as I
> can tell, switching to RC mode doesn't actually write the correct value
> to the field if any of its bits have been set previously, as it only
> updates one bit of a 4 bit field.
> 
> Replace it by actually writing the full values to the field, using the
> new HWORD_UPDATE macro, which grants us the benefit of better
> compile-time error checking.

The current code looks like this:
#define  PCIE_CLIENT_RC_MODE            HIWORD_UPDATE_BIT(0x40)
#define  PCIE_CLIENT_EP_MODE            HIWORD_UPDATE(0xf0, 0x0)

The device_type field is defined like this:
4'h0: PCI Express endpoint
4'h1: Legacy PCI Express endpoint
4'h4: Root port of PCI Express root complex

The reset value of the device_type field is 0x0 (EP mode).

So switching between RC mode / EP mode should be fine.

But I agree, theoretically there could be a bug if e.g. bootloader
has set the device_type to 0x1 (Legacy EP).

So if you want, you could send a patch:
-#define  PCIE_CLIENT_RC_MODE            HIWORD_UPDATE_BIT(0x40)
+#define  PCIE_CLIENT_RC_MODE            HIWORD_UPDATE(0xf0, 0x40)

With:
Fixes: 0e898eb8df4e ("PCI: rockchip-dwc: Add Rockchip RK356X host controller driver")

But I also think that your current patch is fine as-is.

I do however think that you can drop this line:
+#define  PCIE_CLIENT_MODE_LEGACY       0x1U

Since the define is never used.


Also, is there any point in adding the U suffix?

Usually you see UL or ULL suffix, when that is needed, but there actually
seems to be extremely few hits of simply U suffix:
$ git grep 0x1U | grep -v UL


Kind regards,
Niklas
