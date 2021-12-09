Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B1E46F60D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 22:36:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF84210E391;
	Thu,  9 Dec 2021 21:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by gabe.freedesktop.org (Postfix) with ESMTP id 42F4810E38E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 21:36:32 +0000 (UTC)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1mvR5U-0006qc-00; Thu, 09 Dec 2021 22:36:24 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id C2D81C02CD; Thu,  9 Dec 2021 18:11:09 +0100 (CET)
Date: Thu, 9 Dec 2021 18:11:09 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v11 0/8] MIPS: JZ4780 and CI20 HDMI
Message-ID: <20211209171109.GA18973@alpha.franken.de>
References: <cover.1638470392.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1638470392.git.hns@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Liam Girdwood <lgirdwood@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 02, 2021 at 07:39:45PM +0100, H. Nikolaus Schaller wrote:
> [..] 
> This series adds HDMI support for JZ4780 and CI20 board
> 
> 
> 
> H. Nikolaus Schaller (3):
>   drm/ingenic: prepare ingenic drm for later addition of JZ4780
>   MIPS: defconfig: CI20: configure for DRM_DW_HDMI_JZ4780
>   [RFC] MIPS: DTS: Ingenic: adjust register size to available registers
> 
> Paul Boddie (4):
>   drm/ingenic: Add support for JZ4780 and HDMI output
>   drm/ingenic: Add dw-hdmi driver for jz4780
>   MIPS: DTS: jz4780: Account for Synopsys HDMI driver and LCD
>     controllers
>   MIPS: DTS: CI20: Add DT nodes for HDMI setup
> 
> Sam Ravnborg (1):
>   dt-bindings: display: Add ingenic,jz4780-dw-hdmi DT Schema
> 
>  .../display/bridge/ingenic,jz4780-hdmi.yaml   |  78 ++++++++++
>  .../display/bridge/synopsys,dw-hdmi.yaml      |   3 +
>  arch/mips/boot/dts/ingenic/ci20.dts           |  72 +++++++++-
>  arch/mips/boot/dts/ingenic/jz4725b.dtsi       |   2 +-
>  arch/mips/boot/dts/ingenic/jz4740.dtsi        |   2 +-
>  arch/mips/boot/dts/ingenic/jz4770.dtsi        |   2 +-
>  arch/mips/boot/dts/ingenic/jz4780.dtsi        |  40 ++++++
>  arch/mips/configs/ci20_defconfig              |   6 +
>  drivers/gpu/drm/ingenic/Kconfig               |   9 ++
>  drivers/gpu/drm/ingenic/Makefile              |   1 +
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  62 +++++++-
>  drivers/gpu/drm/ingenic/ingenic-drm.h         |  38 +++++
>  drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c     | 136 ++++++++++++++++++
>  13 files changed, 443 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
>  create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c

applied patches 5-8 to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
