Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF66B346CF
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 18:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E834810E4F5;
	Mon, 25 Aug 2025 16:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cQ7VlgxH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E5F10E4FD
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 16:12:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 200436023C;
 Mon, 25 Aug 2025 16:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F2DC4CEED;
 Mon, 25 Aug 2025 16:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756138321;
 bh=lRmwIXXuuVxuUeGAauGH9Bx39v/B949+O0RVAstjSuk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cQ7VlgxHju8BEVWwXx8S5s9QO0VAGvXQFLrv/Uk7vG//TkWLtQ958x6s8s27sBA9K
 ZcC+Vqlxi7SLRsijcAT4VR40IpnOE02lPJoJxRdH4JLlfsembYa20HUZxxM4Ykvuhd
 gR9Ewz0C17+TNmcjSvn8rsyUEZ3eHGOfihpu+yQUtN2eQgqTq4UevTo4hW53DjKucR
 RcfXKEtkDNMjSmnffIYVrTmNpy0yJ+On9axRFVmIFarvx0PpkxtcTqBkLOK2JQ/CFW
 UV/FEDmGacDp6s4U8xtBgsmf+FYq4bHcugm4JlhafhGE0dBr3Z/OCxvHsJZPXPRon0
 vH/QeTkJt0PjQ==
Date: Mon, 25 Aug 2025 09:11:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Jaehoon Chung <jh80.chung@samsung.com>, Ulf
 Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Shreeya
 Patel <shreeya.patel@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Sandy Huang <hjc@rock-chips.com>, Andy Yan
 <andy.yan@rock-chips.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, Nicolas Frattaroli
 <frattaroli.nicolas@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Shawn Lin
 <shawn.lin@rock-chips.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>, Manivannan
 Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Qin
 Jian <qinjian@cqplus1.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3 15/20] net: stmmac: dwmac-rk: switch to
 FIELD_PREP_WM16 macro
Message-ID: <20250825091158.07893b12@kernel.org>
In-Reply-To: <20250825-byeword-update-v3-15-947b841cdb29@collabora.com>
References: <20250825-byeword-update-v3-0-947b841cdb29@collabora.com>
 <20250825-byeword-update-v3-15-947b841cdb29@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 25 Aug 2025 10:28:35 +0200 Nicolas Frattaroli wrote:
> The era of hand-rolled HIWORD_UPDATE macros is over, at least for those
> drivers that use constant masks.
> 
> Like many other Rockchip drivers, dwmac-rk has its own HIWORD_UPDATE
> macro. Its semantics allow us to redefine it as a wrapper to the shared
> hw_bitfield.h FIELD_PREP_WM16 macros though.
> 
> Replace the implementation of this driver's very own HIWORD_UPDATE macro
> with an instance of FIELD_PREP_WM16 from hw_bitfield.h. This keeps the
> diff easily reviewable, while giving us more compile-time error
> checking.
> 
> The related GRF_BIT macro is left alone for now; any attempt to rework
> the code to not use its own solution here would likely end up harder to
> review and less pretty for the time being.

Acked-by: Jakub Kicinski <kuba@kernel.org>
