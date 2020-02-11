Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0AD159C97
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 23:52:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888E26E040;
	Tue, 11 Feb 2020 22:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1569 seconds by postgrey-1.36 at gabe;
 Tue, 11 Feb 2020 22:52:15 UTC
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75C56E040
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 22:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FTbc6NWScTx2sMAyMo0DXlq+GgMPVN13Zi2VFXkQ5NQ=; b=osmpEyybgIujO885bvEjDsmCfE
 rKPM5qtQkwuJ5S+jzyGh+X20JBzUCJpD4L5chAuCV6Iq3sfnOmZxf4P6XDBSfCY7Y5FK938LtFVLV
 4dZYvibf2P2pNxgItfmFVMP53Y0y3/4hNROve54Z1zPdzOG60mvjXVFxbyni7oVcZ7pg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
 (envelope-from <andrew@lunn.ch>)
 id 1j1dxq-0003J4-92; Tue, 11 Feb 2020 23:25:06 +0100
Date: Tue, 11 Feb 2020 23:25:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 03/14] net: davicom: dm9000: allow to pass MAC address
 through mac_addr module parameter
Message-ID: <20200211222506.GP19213@lunn.ch>
References: <cover.1581457290.git.hns@goldelico.com>
 <4e11dd4183da55012198824ca7b8933b1eb57e4a.1581457290.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4e11dd4183da55012198824ca7b8933b1eb57e4a.1581457290.git.hns@goldelico.com>
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
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 James Hogan <jhogan@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Richard Fontana <rfontana@redhat.com>, linux-i2c@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Andi Kleen <ak@linux.intel.com>,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alex Smith <alex.smith@imgtec.com>,
 Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>, devicetree@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, letux-kernel@openphoenux.org,
 Allison Randal <allison@lohutok.net>, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 kernel@pyra-handheld.com, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 11, 2020 at 10:41:20PM +0100, H. Nikolaus Schaller wrote:
> This is needed to give the MIPS Ingenic CI20 board a stable MAC address
> which can be optionally provided by vendor U-Boot.
> 
> For get_mac_addr() we use an adapted copy of from ksz884x.c which
> has very similar functionality.
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

Hi Nikolaus

Please split these patches by subsystem. So this one patch needs to go
via netdev.

> +static char *mac_addr = ":";
> +module_param(mac_addr, charp, 0);
> +MODULE_PARM_DESC(mac_addr, "MAC address");

Module parameters are not liked.

Can it be passed via device tree? The driver already has code to get
it out of the device tree.

   Andrew
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
