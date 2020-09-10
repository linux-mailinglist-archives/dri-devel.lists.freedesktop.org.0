Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C720264D67
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 20:41:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2986E115;
	Thu, 10 Sep 2020 18:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10D06E115
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 18:41:46 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 180CB20039;
 Thu, 10 Sep 2020 20:41:42 +0200 (CEST)
Date: Thu, 10 Sep 2020 20:41:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH v9 0/5] Add support for iMX8MQ Display Controller Subsystem
Message-ID: <20200910184141.GD893045@ravnborg.org>
References: <20200731081836.3048-1-laurentiu.palcu@oss.nxp.com>
 <20200828083620.6m5yhcv7rg5tckzh@fsr-ub1864-141>
 <e882838158cb9e81440c8cdeb25d80bf3310e8a8.camel@pengutronix.de>
 <20200831112445.t4xfz33avdyx5w6p@fsr-ub1864-141>
 <f46d44f38008d214951994a340814570c182cc15.camel@pengutronix.de>
 <CAKMK7uG7s1j+k0WPq8H4OcTD0jP2_LpTy0SBw0RtP-ij1OS7Mw@mail.gmail.com>
 <20200910080432.26dleo5wxybsacvl@fsr-ub1864-141>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910080432.26dleo5wxybsacvl@fsr-ub1864-141>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=CaYmGojl c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=EC8lkJN9LEwtObD5xQsA:9 a=CjuIK1q_8ugA:10
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, lukas@mntmn.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>, Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurentiu

> > > I've tested this together with a hacked up eDP bridge driver stack on
> > > my boards. The testing hasn't been really in-depth, but things seem to
> > > work fine. I have now pushed the whole series into drm-misc-next.
> > 
> > Something doesn't compile too well
> > 
> > ERROR: modpost: "__aeabi_ldivmod"
> > [drivers/gpu/drm/imx/dcss/imx-dcss.ko] undefined!
> > ERROR: modpost: "__aeabi_uldivmod"
> > [drivers/gpu/drm/imx/dcss/imx-dcss.ko] undefined!
> 
> Oops... :/ I guess we need an ARM64 dependency in Kconfig. No
> 32bit NXP SoC uses this particular display controller. So, that should
> fix the compilation issue on 32bit.

Build coverage for ARM64 is an OK short term fix.

Please fix the driver so we can build test it for all architectures.
The chance to miss something when refactoring if only build for ARM64
is too high. The fix can land when it is ready, and is not urgent.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
