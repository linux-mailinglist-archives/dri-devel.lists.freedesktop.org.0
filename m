Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F57B682588
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 08:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631AE10E33C;
	Tue, 31 Jan 2023 07:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F98010E33C
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 07:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1675150070; x=1706686070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xNwizkJY+v60PNO9GG4mkHO1ahzr03HqLvbQsMxs1tQ=;
 b=phVEuMVaNlKjfXq2NakXUBX7HNOTYfaUIfOY7YwdcIgKplEVIuCh7QmW
 JKYqgpn0f6R+gzUJJvg43fYIRXvvY6i24kzcsW4IIdcwS5xc3F9hibyEN
 Lj+k53qIXGcfp8Jh74vEHY3U1WKlmq5grrVNan3fW4B/067f3qGnWBKCG
 eAUtwAaBH+RKANmkh2mEzOM368WlA6e3tmFguz3nSR1AxdFLv6pQ7OUSH
 Rj3usPfRaZogPipn66onZ6mIMsWjH/899HElFxkqBY1wPs4jNDLlZYdBW
 5ru2D9y5/+SW+qTXGm8BZ0ouzVpbr3ryHG5cVTRmGQF9bPXi57FrQFAUW g==;
X-IronPort-AV: E=Sophos;i="5.97,259,1669071600"; d="scan'208";a="28758465"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 31 Jan 2023 08:27:48 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 31 Jan 2023 08:27:48 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 31 Jan 2023 08:27:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1675150068; x=1706686068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xNwizkJY+v60PNO9GG4mkHO1ahzr03HqLvbQsMxs1tQ=;
 b=krbHB8bD1twLxw4NPWwxL7tuxe05ZDg4cVx300IjLc2qmrNXbf7AOsn1
 TpN7ctjIYorY9n3HIfny1Ar3BwBWOKZyHjGWuRpiAhWr8Fq0i2s9To3pK
 hZ0nGY0I/uI6Y+xVuNd6qidOUiqK5TDCLoZ+V0Vl4ZJpObEWbE6gF/Qmh
 jOpchq9ZGcZPmJpE+WlFzdkjCvwhMDp/xHrjSRWa7cZuT5NpOyZghdF/i
 NDR3BEt2QLm+I6W6jMnN4QvhA/ZbUOmtSmUdSXzzQ/5B+CSR3GX8u5HsL
 F59HeK35gXgdb9MFTkp9Xz7zQcp1JGDYtq8qs3kmf5Rj9Pl6ZbbNCZiqE Q==;
X-IronPort-AV: E=Sophos;i="5.97,259,1669071600"; d="scan'208";a="28758463"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 31 Jan 2023 08:27:48 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 2B58B280056;
 Tue, 31 Jan 2023 08:27:48 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
Date: Tue, 31 Jan 2023 08:27:45 +0100
Message-ID: <4811510.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <f6cea911-783c-f59d-503c-1576358ae7cb@prevas.dk>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <31ccc974-4b01-ae47-9505-626617f07758@denx.de>
 <f6cea911-783c-f59d-503c-1576358ae7cb@prevas.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 matteo.lisi@engicam.com, linux-amarula@amarulasolutions.com,
 sw0312.kim@samsung.com, linux-imx@nxp.com, dri-devel@lists.freedesktop.org,
 frieder.schrempf@kontron.de, kyungmin.park@samsung.com,
 Jagan Teki <jagan@amarulasolutions.com>, andrzej.hajda@intel.com,
 m.szyprowski@samsung.com, aford173@gmail.com,
 linux-arm-kernel@lists.infradead.org, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rasmus,

Am Montag, 30. Januar 2023, 13:45:38 CET schrieb Rasmus Villemoes:
> On 27/01/2023 12.30, Marek Vasut wrote:
> > On 1/27/23 12:04, Jagan Teki wrote:
> >>> Thanks, but that's exactly what I'm doing, and I don't see any
> >>> modification of imx8mp.dtsi in that branch. I'm basically looking for
> >>> help to do the equivalent of
> >>> 
> >>>    88775338cd58 - arm64: dts: imx8mm: Add MIPI DSI pipeline
> >>>    f964f67dd6ee - arm64: dts: imx8mm: Add eLCDIF node support
> >>> 
> >>> for imx8mp in order to test those patches on our boards (we have two
> >>> variants).
> >> 
> >> Marek, any help here, thanks.
> > 
> > Try attached patch.
> 
> Thanks. I removed the lcdif2 and ldb nodes I had added from Alexander's
> patch (94e6197dadc9 in linux-next) in order to apply it. I get a couple
> of errors during boot:
> 
>   clk: /soc@0/bus@32c00000/mipi_dsi@32e60000: failed to reparent
> media_apb to sys_pll1_266m: -22
> 
> and enabling a pr_debug in clk_core_set_parent_nolock() shows that this
> is because
> 
>   clk_core_set_parent_nolock: clk sys_pll1_266m can not be parent of clk
> media_apb
> 
> Further, the mipi_dsi fails to probe due to
> 
>   /soc@0/bus@32c00000/mipi_dsi@32e60000: failed to get
> 'samsung,burst-clock-frequency' property
> 
> All other .dtsi files seem to have those samsung,burst-clock-frequency
> and samsung,esc-clock-frequency properties, so I suppose those should
> also go into the imx8mp.dtsi and are not something that the board .dts
> file should supply(?).
> 
> 
> [There's also some differences between your patch and Alexander's
> regarding the lcdif2 and ldb nodes, so while my lvds display still sorta
> works, I get
> 
>   fsl-ldb 32ec0000.blk-ctrl:lvds-ldb: Configured LDB clock (297000000
> Hz) does not match requested LVDS clock: 346500000 Hz
> 
> and the image is oddly distorted/shifted. But I suppose that's
> orthogonal to getting the lcdif1 -> mipi-dsi -> ... pipeline working.]

It seems my patch indicates exactly what's your problem here. Your clock rate 
configuration for LCDIF2 and LDB are not compatible (ratio 1:7). For now 
manual clock config is necessary in this case.
Check the clock tree in debugfs how your root clocks are configured and if it 
affects lcdif1 and lcdif2.

Best regards
Alexander


