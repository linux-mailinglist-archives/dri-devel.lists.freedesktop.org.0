Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF938591B83
	for <lists+dri-devel@lfdr.de>; Sat, 13 Aug 2022 17:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B618BBAD;
	Sat, 13 Aug 2022 15:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28FD3BD42F
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Aug 2022 15:37:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 17949B8069B;
 Sat, 13 Aug 2022 15:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 928BEC433D6;
 Sat, 13 Aug 2022 15:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660405045;
 bh=YKS5k8HQOL4Skk22H+cxjJPrMUDWvdWUTz36jDqZAJY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cXROFHWGoInf1pK354gp5Gb9NyimQMtBez5XiY9JTc+SxkCr6CWCJe+n2oZqHfzlH
 wfzhWVtq6NHlL5/TjcUp4bmN36+oYBF5bh041xeTET3yfGzrenYrA0fDV7khptS650
 zb5W4MOzma2Xk26UWd8/VQLvRxwsrTO8C2J5P992bopRmg1EIpDz8gOorUsKv3Ii7F
 Qy+gg6gmNcisR4OqIC402ov2Evvymt2UYJXnySgcq0igmFxGrnoADcSwhpGGeuT+wA
 JccQ8kCw2Jy7xQMfLherw5k43kwBXycb4aj4+Rft3sWzV5XyMZrS3FQxr8QZW/NcNO
 qDKiTP1zMFlUw==
Date: Sat, 13 Aug 2022 16:47:48 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 06/13] dt-bindings: mfd: Add MediaTek MT6370
Message-ID: <20220813164748.0c5564c2@jic23-huawei>
In-Reply-To: <YvJdpq0MWNPQZw5c@google.com>
References: <20220805070610.3516-1-peterwu.pub@gmail.com>
 <20220805070610.3516-7-peterwu.pub@gmail.com>
 <YvJdpq0MWNPQZw5c@google.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
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
Cc: linux-fbdev@vger.kernel.org, heikki.krogerus@linux.intel.com,
 krzysztof.kozlowski+dt@linaro.org, alice_chen@richtek.com,
 linux-iio@vger.kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 cy_huang@richtek.com, pavel@ucw.cz, linux-leds@vger.kernel.org,
 daniel.thompson@linaro.org, deller@gmx.de, Lee Jones <lee@kernel.org>,
 andy.shevchenko@gmail.com, chunfeng.yun@mediatek.com, linux@roeck-us.net,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org, szunichen@gmail.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, matthias.bgg@gmail.com,
 ChiaEn Wu <peterwu.pub@gmail.com>, linux-arm-kernel@lists.infradead.org,
 jingoohan1@gmail.com, linux-usb@vger.kernel.org, sre@kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, chiaen_wu@richtek.com,
 gregkh@linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 9 Aug 2022 14:14:14 +0100
Lee Jones <lee.jones@linaro.org> wrote:

> On Fri, 05 Aug 2022, ChiaEn Wu wrote:
> 
> > From: ChiYuan Huang <cy_huang@richtek.com>
> > 
> > Add MediaTek MT6370 binding documentation.
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> > ---
> >  .../devicetree/bindings/mfd/mediatek,mt6370.yaml   | 280 +++++++++++++++++++++
> >  include/dt-bindings/iio/adc/mediatek,mt6370_adc.h  |  18 ++
> >  2 files changed, 298 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> >  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h  
> 
> Applied, thanks.
> 
Hi Lee,

The iio: adc: patch is dependent on this (due to the binding header) -
so either you should pick that up as well, or it'll get delayed until what
you've picked up is available upstream - or I guess some hackery to allow them
to go via different trees and flip to the header only once all the prior steps
are in place.

Note I'd messed up sending an Ack on the ADC patch which I've now fixed.

Thanks,

Jonathan


