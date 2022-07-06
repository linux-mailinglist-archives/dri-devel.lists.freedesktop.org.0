Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A92C567DF7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 07:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72E510EB73;
	Wed,  6 Jul 2022 05:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB4910E1D2
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 05:45:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A2660B817F4;
 Wed,  6 Jul 2022 05:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99381C3411C;
 Wed,  6 Jul 2022 05:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657086320;
 bh=3D6JnTyqnPP2jiPpHSlGQDcx4nSOuFUKoMkf/By5jzs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=beHWBKQE3jSY94shQkm5jd1+RuTdBb2ueweYw6N0sIMjpCw2iwAnt8svfD5/V1CtD
 +vfgei5ddElQG65X38w3m5VNNcfCgo93Bxb9axxKSjaZrjE1ecnx67Gne94S1fa7jc
 wCrKVt0N9qXQAmLWQyTSdhELrOsNNpHSnPVlYEKGNE7Ha10OJunLksj9WryWN3ijBE
 ywM0gzVZ+2vvLmJJwJaquNZXVnS5i2rFXFTdSnvcIP8HVrRhMVJBBqY7txkB5zrP7B
 3FpKbIw7odrseCf9io6Ui7Jc+cDP1wMWpf4ONB+s6Vto9h3LgpizR6VrjUSLAufLYC
 xHpUiJRr4WxMw==
Date: Wed, 6 Jul 2022 11:15:16 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH v5 03/13] dt-bindings: dma: dw-axi-dmac: extend the
 number of interrupts
Message-ID: <YsUhbD0zJk43/4oa@matsya>
References: <20220705215213.1802496-1-mail@conchuod.ie>
 <20220705215213.1802496-4-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220705215213.1802496-4-mail@conchuod.ie>
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Dillon Min <dillon.minfei@gmail.com>, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 dmaengine@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05-07-22, 22:52, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
> controller, but according to the documentation & devicetree it has 6
> interrupts rather than the standard one. Support the 6 interrupt
> configuration by unconditionally extending the binding to a maximum of
> 8 per-channel interrupts thereby matching the number of possible
> channels.

Applied, thanks

-- 
~Vinod
