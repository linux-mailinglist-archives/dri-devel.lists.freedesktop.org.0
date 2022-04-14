Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D66500815
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 10:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B34C10E23C;
	Thu, 14 Apr 2022 08:15:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCD310E23C
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 08:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6YMpm44acphdMuRGEx9DBy3vdiDjBzEpIjiQ/MN8cI8=; b=V9L2VcKqDpUCMVFPhIRU+cC5lb
 oAwHcN+Gl9Km7FecMITzEBk68MACkuskRzc8YFegR19juSR6D5IlIy5TMpvyvvxryCW3ez4S9ohqW
 LCCE67T+Osu8LzvuSYSKaMbSy7iJByDg7CZ4WXB2mTnx6fIz2AHiV8wXfEoNWuRPB1Fc=;
Received: from p200300ccff1771001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff17:7100:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1neudp-0001ui-UW; Thu, 14 Apr 2022 10:15:50 +0200
Date: Thu, 14 Apr 2022 10:15:48 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [RFC PATCH 02/16] dt-bindings: display: rockchip: Add EBC binding
Message-ID: <20220414101548.2b9c3dad@aktux>
In-Reply-To: <20220413221916.50995-3-samuel@sholland.org>
References: <20220413221916.50995-1-samuel@sholland.org>
 <20220413221916.50995-3-samuel@sholland.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
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
Cc: David Airlie <airlied@linux.ie>, =?UTF-8?B?T25kxZllag==?= Jirman <x@xff.cz>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Liang Chen <cl@rock-chips.com>, devicetree@vger.kernel.org,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh+dt@kernel.org>,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Sandy Huang <hjc@rock-chips.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Samuel,

for comparison, here is my submission for the IMX EPDC bindings:

https://lore.kernel.org/linux-devicetree/20220206080016.796556-2-andreas@kemnade.info/

On Wed, 13 Apr 2022 17:19:02 -0500
Samuel Holland <samuel@sholland.org> wrote:

[...]
we have sy7636a driver in kernel which should be suitable for powering a EPD
and temperature measurement. So I would expect that to be 
> +  io-channels:
> +    maxItems: 1
> +    description: I/O channel for panel temperature measurement
> +
so how would I reference the hwmon/thermal(-zone) of the sy7636a here?

> +  panel-supply:
> +    description: Regulator supplying the panel's logic voltage
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  vcom-supply:
> +    description: Regulator supplying the panel's compensation voltage
> +
> +  vdrive-supply:
> +    description: Regulator supplying the panel's gate and source drivers
> +
SY7636a has only one logical regulator in kernel for for the latter two.

If we have a separate panel node, than maybe these regulators should go
there as they belong to the panel as they are powering the panel and
not the EBC.

> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: OF graph port for the attached display panel
> +
In my approach for the IMX EPDC, (I will send a better commented one
soon) I have no separate subnode to avoid messing with additional
display parameters. Not sure what is really better here.

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - power-domains
> +  - panel-supply
> +  - vcom-supply
> +  - vdrive-supply

If things differ how the different phyiscally existing regulators are
mapped into logical ones (even the vdrive supply is still a bunch of
physical regulators mapped into one logical one), then not everything
can be required.

Regards,
Andreas
