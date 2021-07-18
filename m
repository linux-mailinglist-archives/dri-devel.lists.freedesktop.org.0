Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D75813CCA99
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jul 2021 22:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D4C89F45;
	Sun, 18 Jul 2021 20:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3131A89F45
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jul 2021 20:22:20 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id d9970e3e-e805-11eb-9082-0050568c148b;
 Sun, 18 Jul 2021 20:22:18 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 1F2EA194B06;
 Sun, 18 Jul 2021 22:22:30 +0200 (CEST)
Date: Sun, 18 Jul 2021 22:22:14 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v2 4/4] ARM: dts: add SKOV imx6q and imx6dl based boards
Message-ID: <YPSNdvUhQ6fCTUjj@ravnborg.org>
References: <20210714045349.10963-1-o.rempel@pengutronix.de>
 <20210714045349.10963-5-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210714045349.10963-5-o.rempel@pengutronix.de>
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
Cc: Ulrich =?iso-8859-1?Q?=D6lmann?= <u.oelmann@pengutronix.de>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, Juergen Borleis <jbe@pengutronix.de>,
 Marco Felsch <m.felsch@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?iso-8859-1?Q?S=F8ren?= Andersen <san@skov.dk>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Oleksij,
On Wed, Jul 14, 2021 at 06:53:49AM +0200, Oleksij Rempel wrote:
> From: Sam Ravnborg <sam@ravnborg.org>

The real author one these dts files are Juergen Borleis IIRC.
I made some internal refactoring / renaming which is why I thing git
says otherwise.
So onless Juergen says otherwise we should give him the author credit.

Arnd - would it be OK if I take the bindings patches through
drm-misc-next, and then you can take the DTS files via arm-soc?

	Sam


> 
> Add SKOV imx6q/dl LT2, LT6 and mi1010ait-1cp1 boards.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Søren Andersen <san@skov.dk>
> Signed-off-by: Juergen Borleis <jbe@pengutronix.de>
> Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  arch/arm/boot/dts/Makefile                    |   5 +
>  arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts    |  13 +
>  arch/arm/boot/dts/imx6dl-skov-revc-lt6.dts    | 108 ++++
>  arch/arm/boot/dts/imx6q-skov-revc-lt2.dts     |  36 ++
>  arch/arm/boot/dts/imx6q-skov-revc-lt6.dts     | 128 +++++
>  .../dts/imx6q-skov-reve-mi1010ait-1cp1.dts    | 127 +++++
>  arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi  |  54 ++
>  arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi       | 475 ++++++++++++++++++
>  8 files changed, 946 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts
>  create mode 100644 arch/arm/boot/dts/imx6dl-skov-revc-lt6.dts
>  create mode 100644 arch/arm/boot/dts/imx6q-skov-revc-lt2.dts
>  create mode 100644 arch/arm/boot/dts/imx6q-skov-revc-lt6.dts
>  create mode 100644 arch/arm/boot/dts/imx6q-skov-reve-mi1010ait-1cp1.dts
>  create mode 100644 arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi
>  create mode 100644 arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi
...
