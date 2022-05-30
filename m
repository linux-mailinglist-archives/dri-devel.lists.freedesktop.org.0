Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C23537459
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 08:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C91910E40C;
	Mon, 30 May 2022 06:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F06C10E40C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 06:24:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 706756103B;
 Mon, 30 May 2022 06:24:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24427C34119;
 Mon, 30 May 2022 06:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1653891876;
 bh=2YgSIJ3CE+xe2Ajc1vpcGq3Gs3/6x2CvG5Mak/cA7L8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jyxYb9+z2P1WLZlZFPTJ5XDW/T/yY/HCs50OBkPXyRKjIVAfk5/+HxhUvyUs0vQFF
 9rqptQZmTd/NhKQSM8kfwdUdcRxb486x9tGGb8t9bnW0654f36NWSzO8/ta7vfbdG5
 MTcPaI9y5Ev5EqvbMlUAtx6JeP/l9xAJagrEJa8k=
Date: Mon, 30 May 2022 08:24:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neal Liu <neal_liu@aspeedtech.com>
Subject: Re: [PATCH v5 1/3] usb: gadget: add Aspeed ast2600 udc driver
Message-ID: <YpRjIXaJ2ZeuuWJ8@kroah.com>
References: <20220523030134.2977116-1-neal_liu@aspeedtech.com>
 <20220523030134.2977116-2-neal_liu@aspeedtech.com>
 <TY2PR06MB3213611D7D9DD6F9B47DBB4080DD9@TY2PR06MB3213.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY2PR06MB3213611D7D9DD6F9B47DBB4080DD9@TY2PR06MB3213.apcprd06.prod.outlook.com>
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
Cc: Felipe Balbi <balbi@kernel.org>,
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

On Mon, May 30, 2022 at 01:27:16AM +0000, Neal Liu wrote:
> Gentle ping on this path, thanks.

Please never top-post.

Also, it is the middle of the merge window and we can not do anything
with new submissions.  Please wait until next week at the earliest
before we can even start to look at stuff like this.

What is the rush?

thanks,

greg k-h
