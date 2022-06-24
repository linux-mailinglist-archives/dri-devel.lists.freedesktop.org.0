Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7AF5598BA
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 13:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C2C10EE6B;
	Fri, 24 Jun 2022 11:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3023A10EE6B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 11:44:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7054D6222C;
 Fri, 24 Jun 2022 11:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47759C34114;
 Fri, 24 Jun 2022 11:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1656071093;
 bh=SXL5zN2nwEilLgVy+817nWe3mGqIkwJPf3KT5KtK610=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QqleerCUtjShMpTKt40R3Xw5bJcBgWctuyJJpVXDDC8yUC+px+coDFuFGOhsDclBm
 dg838WtwC4BaQ3bpEalZRbi71buK3vIaBJx8ZVhWnGCY1l7wOcJedOmOBaxgTuvbE9
 l08jW1kWCHcm0hwgtV4GmlCbpSkA1mpGB+nGFXvo=
Date: Fri, 24 Jun 2022 13:33:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Subject: Re: [PATCH v3 08/14] usb: typec: tcpci_mt6370: Add Mediatek MT6370
 tcpci driver
Message-ID: <YrWhIMGjUeRkpHkB@kroah.com>
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-9-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623115631.22209-9-peterwu.pub@gmail.com>
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
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lgirdwood@gmail.com, cy_huang@richtek.com, pavel@ucw.cz, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, daniel.thompson@linaro.org, deller@gmx.de,
 robh+dt@kernel.org, chunfeng.yun@mediatek.com, linux@roeck-us.net,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org, szunichen@gmail.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, jingoohan1@gmail.com,
 linux-usb@vger.kernel.org, sre@kernel.org, linux-kernel@vger.kernel.org,
 chiaen_wu@richtek.com, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 23, 2022 at 07:56:25PM +0800, ChiaEn Wu wrote:
> --- /dev/null
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> @@ -0,0 +1,212 @@
> +// SPDX-License-Identifier: GPL-2.0+

Are you sure you mean "+" here?

I have to ask, sorry.

And no copyright line?  Your company is ok with that, nice!  :)

thanks,

greg k-h
