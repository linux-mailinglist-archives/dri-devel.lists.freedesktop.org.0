Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 437EB52E47B
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 07:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2670A11B259;
	Fri, 20 May 2022 05:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA4F11B259
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 05:44:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 460CDB82A4F;
 Fri, 20 May 2022 05:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DAAC385AA;
 Fri, 20 May 2022 05:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1653025457;
 bh=mseK8CCtepf2Ga20exHmxu8FEYO1RmDnTjp8MjgdFRo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xYQFxcBwfiillvnR2YKUZ8gbgnTwQyAJJxpaGGzJOukd56oPWr1Du+d1srmJCKtj2
 7oZa6c45zqDAektaqNIUJ829XMqRGecoN4n0fKBIwco80slIt8P0OujNaPJtnVVBX3
 bbERy5dCVloC9oE6+7fBd6lE38vBJsV2OXRulLcI=
Date: Fri, 20 May 2022 07:44:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neal Liu <neal_liu@aspeedtech.com>
Subject: Re: [PATCH v3 1/3] usb: gadget: add Aspeed ast2600 udc driver
Message-ID: <YocqrTHm29g9qU69@kroah.com>
References: <20220518062043.1075360-1-neal_liu@aspeedtech.com>
 <20220518062043.1075360-2-neal_liu@aspeedtech.com>
 <YoZoouI4EbnNYE6h@kroah.com>
 <HK0PR06MB32020AEF88CFFD4296762B2880D39@HK0PR06MB3202.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <HK0PR06MB32020AEF88CFFD4296762B2880D39@HK0PR06MB3202.apcprd06.prod.outlook.com>
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
Cc: Felipe Balbi <balbi@kernel.org>, kernel test robot <lkp@intel.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Li Yang <leoyang.li@nxp.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 20, 2022 at 02:29:36AM +0000, Neal Liu wrote:
> > -----Original Message-----
> > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Sent: Thursday, May 19, 2022 11:56 PM
> > To: Neal Liu <neal_liu@aspeedtech.com>
> > Cc: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> > <krzysztof.kozlowski+dt@linaro.org>; Joel Stanley <joel@jms.id.au>; Andrew
> > Jeffery <andrew@aj.id.au>; Felipe Balbi <balbi@kernel.org>; Sumit Semwal
> > <sumit.semwal@linaro.org>; Christian König <christian.koenig@amd.com>;
> > Geert Uytterhoeven <geert@linux-m68k.org>; Li Yang <leoyang.li@nxp.com>;
> > linux-aspeed@lists.ozlabs.org; linux-usb@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org; linux-media@vger.kernel.org;
> > dri-devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org; kernel test
> > robot <lkp@intel.com>
> > Subject: Re: [PATCH v3 1/3] usb: gadget: add Aspeed ast2600 udc driver
> > 
> > On Wed, May 18, 2022 at 02:20:41PM +0800, Neal Liu wrote:
> > > Aspeed udc is compliant with USB2.0, supports USB High Speed and Full
> > > Speed, backward compatible with USB1.1.
> > >
> > > Supports independent DMA channel for each generic endpoint.
> > > Supports 32/256 stages descriptor mode for all generic endpoints.
> > >
> > > This driver supports full functionality including single/multiple
> > > stages descriptor mode, and exposes 1 UDC gadget driver.
> > >
> > > Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> > > Reported-by: kernel test robot <lkp@intel.com>
> > 
> > The kernel test robot did not report that you needed to add a new driver :(
> 
> I had received auto build test WARNING on usb/usb-testing reported from kernel test robot.
> It still mentioned that if the issue is fixed, I can kindly add this tag.
> Would you prefer not to add this tag for the first coming driver?

Please do not add tags that do not make sense to.

thanks,

greg k-h
