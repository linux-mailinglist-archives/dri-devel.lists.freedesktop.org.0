Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EECF211DF5B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 09:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5EE36E2C0;
	Fri, 13 Dec 2019 08:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 012BF6E0D3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 17:21:07 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 25D8D80C0;
 Thu, 12 Dec 2019 17:21:46 +0000 (UTC)
Date: Thu, 12 Dec 2019 09:21:04 -0800
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 1/4] ARM: dts: am437x-gp-evm: add HDMI support
Message-ID: <20191212172104.GY35479@atomide.com>
References: <20191125131100.9839-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191125131100.9839-1-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Fri, 13 Dec 2019 08:22:24 +0000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

* Tomi Valkeinen <tomi.valkeinen@ti.com> [191125 05:11]:
> Add HDMI support for AM437x GP EVM. The HDMI uses SiI9022 HDMI encoder,
> and is mutually exclusive with the LCD. The choice between LCD and HDMI
> is made by booting either with am437x-gp-evm.dtb or
> am437x-gp-evm-hdmi.dtb.

So Linux kernel needs a new board device tree file to toggle a GPIO line
to switch between LCD mode and HDMI?

That does not sound very user friendly for something that's supposed
to be hot pluggabe :)

> +/* Override SelLCDorHDMI from am437x-gp-evm.dts to select HDMI */
> +&gpio5 {
> +	p8 {
> +		output-low;
> +	};
> +};

How about just leave the gpio unconfigured and document that a userspace
tool or /sys/kernel/debug/gpio is needed to toggle between the modes?

Regards,

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
