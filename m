Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8625E1974ED
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E96897EF;
	Mon, 30 Mar 2020 07:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com
 [210.131.2.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F24F897EF
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 07:11:16 +0000 (UTC)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 02U7Av3H029924
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 16:10:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 02U7Av3H029924
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1585552258;
 bh=hkMe26g7xlvZHHpLSXHK4NtsfOWPZ3tdB27BX4Gdox4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oPp+I+mz1Zy3dMJu1DG1J/OuZx6GQ0LKyyaftGbmcdZRQGSQhsRM5J7b9z04BimiF
 dVDQRd4VsNqQgAFxI8xrLtuOVZqzSR+afIeX2l7xiPTXvvFVBR8WqP8xrt73QX6p7B
 8iqWKVKKRNPrzbRnmAnD+riMmCBNwvT/oDHMHTlDvMD0CiKd6izFoDt2QOFT1NlblQ
 uRJ9HtSeioPn3Lfvq8BXaEYCEIDn9ufBulL9pxXgL2PgnWBJmRfNAwOCmYFsmzVwCd
 ZNmml/c32C2Ks2C4J76xjDPMTY/zFDHylpXzXxehTy9QoDn5U3g/GHwZg0RVUop0AL
 QIRc8+nDR/dVA==
X-Nifty-SrcIP: [209.85.221.176]
Received: by mail-vk1-f176.google.com with SMTP id p123so4402764vkg.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 00:10:58 -0700 (PDT)
X-Gm-Message-State: AGi0Puavbqfb0U1kX/9JSEIdaCn6sJO+8y3TbEXdvkz50IHVFRszvvRS
 yIHmcA1LMLQSWhMH7tZNhkzjo+kW417BCtYCMAs=
X-Google-Smtp-Source: APiQypLNZL0F1SjmrpxCYWMM92Tc2B289mmJ4nqnInP/lERMnXKF0z9Hs/o7lbsUDIM38rMhrwxOtOM94wAMTS6itNI=
X-Received: by 2002:a1f:3649:: with SMTP id d70mr6296693vka.12.1585552257254; 
 Mon, 30 Mar 2020 00:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200325220542.19189-1-robh@kernel.org>
 <20200325220542.19189-4-robh@kernel.org>
In-Reply-To: <20200325220542.19189-4-robh@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 30 Mar 2020 16:10:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNASHkBoOP_uGXLuO-UT1JL-rN3od_L+F4cB0SRPCzQCyKA@mail.gmail.com>
Message-ID: <CAK7LNASHkBoOP_uGXLuO-UT1JL-rN3od_L+F4cB0SRPCzQCyKA@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: Clean-up schema errors due to missing
 'addtionalProperties: false'
To: Rob Herring <robh@kernel.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Lee Jones <lee.jones@linaro.org>,
 linux-clk <linux-clk@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Zhang Rui <rui.zhang@intel.com>, Brian Masney <masneyb@onstation.org>,
 DTML <devicetree@vger.kernel.org>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Linux PM mailing list <linux-pm@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Stephen Boyd <sboyd@kernel.org>, Networking <netdev@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 26, 2020 at 7:06 AM Rob Herring <robh@kernel.org> wrote:
>
> Numerous schemas are missing 'additionalProperties: false' statements which
> ensures a binding doesn't have any extra undocumented properties or child
> nodes. Fixing this reveals various missing properties, so let's fix all
> those occurrences.
>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Hartmut Knaack <knaack.h@gmx.de>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Guillaume La Roque <glaroque@baylibre.com>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: netdev@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---



>  .../gpio/socionext,uniphier-gpio.yaml         |  2 ++


You may have already queue this up, but just in case.

Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>


-- 
Best Regards
Masahiro Yamada
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
