Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 473B183D4B8
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 09:32:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F14E10EDD5;
	Fri, 26 Jan 2024 08:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E3010E1E6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 08:32:18 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id 185BD6042F;
 Fri, 26 Jan 2024 08:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1706257937;
 bh=jlmG1wzP0u2ArENwmDLoBVgwPoZ/B4FgKHD1TWOBq7E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sIqksMLTCXWb8YUFNG8ewkvN10ILCXI1aOGTilVIg35IPVz+WJkoCE8estBQG+FAi
 Ki7xAhTnIBvmU7OT5pDVYwupm0MNdBVikCkHmOMS9zEnkFYc+p+Rv439YyW0wezQ1m
 AQm1UrgeSR3ciAJ3BUe5fRPWvd1aD73HTbeyQcR6/w7KFSGosKYgBRYmLPOjEu2v0g
 mVdpTvoPRdfSwfRtXaknFwhfG7tSnHQ2Nw7J0GGffMSE7mDHmuKgl3dLTRVj+R2bCQ
 FPbBMatNFsfpZfk6sdEu7p4PAQn8v0x91DqeXdCxoUqSYY1vMnecRDXgdstAf4F0rd
 G/IDhnoyGsmvg==
Date: Fri, 26 Jan 2024 10:31:17 +0200
From: Tony Lindgren <tony@atomide.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 02/11] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
Message-ID: <20240126083117.GU5185@atomide.com>
References: <20240109171950.31010-1-afd@ti.com>
 <20240109171950.31010-3-afd@ti.com>
 <e2fce141-4966-4e70-9a5c-865a2737174c@linaro.org>
 <20240110083857.GB5185@atomide.com>
 <20240119174815.GA633343-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119174815.GA633343-robh@kernel.org>
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Matt Coster <matt.coster@imgtec.com>,
 linux-omap@vger.kernel.org, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Tero Kristo <kristo@kernel.org>,
 linux-kernel@vger.kernel.org, Andrew Davis <afd@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Rob Herring <robh@kernel.org> [240119 17:48]:
> On Wed, Jan 10, 2024 at 10:38:57AM +0200, Tony Lindgren wrote:
> > So for merging these, as many of the changes touch the omap variants, I
> > could set up an immutable branch with all the changes after -rc1. Or I can
> > ack the patches too if somebody has better ideas.
> 
> Just take all but patches 10 and 11. I don't think it matters if the 
> binding is there for them as long as it is all there in next. No one is 
> paying that close attention to the warnings I think.

OK I've now applied these except patches 10 and 11 into a sgx-for-v6.9
branch [0].

Regards,

Tony

[0] https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git/log/?h=sgx-for-v6.9
