Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F454BD85F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 09:54:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D46112683;
	Mon, 21 Feb 2022 08:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE8D1126A6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 08:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1645433669;
 bh=Z8EpCecM7RhGma2bC7EtfcMj8Tocmigz2nMw62yYXOI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=SGP/t2lI+xhMg/JrfB13WY4xxriDcSAHgJ6ylum/H9flWMPRdIgPX98DGQ/1h6i3Q
 qairigJXYCvXvVFnp/yDTP+h9lWb9PEJfSmaS5aqGry3mW27en1R96IHha5jvJWvL+
 qu5OOcNGUpraNYgoYe2Z5euBaUOZK40LBlFXjLxY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.156.188] ([217.61.156.188]) by web-mail.gmx.net
 (3c-app-gmx-bs60.server.lan [172.19.170.144]) (via HTTP); Mon, 21 Feb 2022
 09:54:28 +0100
MIME-Version: 1.0
Message-ID: <trinity-1fb35fb4-c954-46bc-ae87-02d5df121a01-1645433668183@3c-app-gmx-bs60>
From: Frank Wunderlich <frank-w@public-files.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Aw: [PATCH v6 17/23] arm64: dts: rockchip: rk356x: Add HDMI nodes
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Feb 2022 09:54:28 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20220217082954.2967889-18-s.hauer@pengutronix.de>
References: <20220217082954.2967889-1-s.hauer@pengutronix.de>
 <20220217082954.2967889-18-s.hauer@pengutronix.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:x3LBl6EdmehdGuwhuzd1xOiFb5z5EOYnOHMNPxoOy2rR8Mp7JmyFo1r/Het2WBDJ+/P/C
 MbmK1DBWnywY9nPp//MWoUl0xvSo2oFozeETajq/jVz0zEjHvB8ykHCkzW7YiAG74BlX4x6IKiyJ
 ykAnSyyPrbCPT438/Jx32+Zl/DaxIVQbl7p0P6yOye/7si/IiLDQ+qkkt+Dt7Ttsr2PEr1u0BJ0p
 cLwZzSo1tEct6iqdXWkPu3nprszone4sbWeWnDcadvyteaibWI8AbYRahHEstwIQjQWq74mTVvoZ
 fs=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DwdkB/65TKg=:HKvkpn7knmxoBuuiGPVqAX
 a52f8isbXjpRDRLNOGCNM74lVG9WMh/GmZaZqg1g2Y6WUvSocvo8X6OpfMrb+kH/epU2SqxaG
 Y7TUYu3SamCGVywdGnqbSey7MI0noKv+mmeTEXF2bKSnWsDz5BjcuaD6lNsxg7fWpLPWXqLdo
 q0YNDHYn4XZ/wNzVIC4jBKiJwM0w5UNRBDWiZ2WT0Hn73geP30gdDbfF/P3W5RHZpl3HUvOzI
 5gLlwXgOzajIyabSo57wTRTHeYjX/ll+Ev9WBKdiziKzt6UnhU695W5nWhWJtjtUjUFgg9Xtv
 u3kJVcG93Sqo0gkiXedAIiAgxNsg9pxhBAySNczCCgPfZhwahFsgNgMSkWQ/668LAmPtj3DMr
 PAkdnsiDMUHJ1VBUZBn9jVlQ2DteRFw3AjOxJq+fEF2HNA+T+L3z/EC7G9TW3lNaFgk4CeDjq
 rQmthDdyPzoVE+9N2QXeLkqTlvUvoDqYI0Op7Y92VWeSiODLkoOrzXL3TZDBVVx22jbpJ6bHR
 XGUcLyDTRau47Z7BUzzgjdWcYlwu6qJ1d9g/+5YhOVe63hEfy4xkCejUWVtRb7oqiaZnHd91T
 KmCQC5cYSjNz/m4sSFFdrb+EOa0A3P3rB4PkGm9stkHLg1e6d5Zd3VSIYQnO5+uDWaFt1Xpuj
 ztMk1+oqEUPnl1E0lV3o1Tm6H5msgDGQuHP8PbuV1JrzaUshTR2Qpif8slsHA/jwaYEt9BHTX
 uImMXEI9pDkYEp8rw3zxNI0Qc0TVj0AvIrLEaTJlvjO5BepPQqjpGxtVpwB+cU8Awj1tfX6dR
 4SoFCOx
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

> Gesendet: Donnerstag, 17. Februar 2022 um 09:29 Uhr
> Von: "Sascha Hauer" <s.hauer@pengutronix.de>

> --- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> @@ -10,7 +10,6 @@
>  #include <dt-bindings/pinctrl/rockchip.h>
>  #include <dt-bindings/power/rk3568-power.h>
>  #include <dt-bindings/soc/rockchip,boot-mode.h>
> -#include <dt-bindings/soc/rockchip,vop2.h>

why dropping this after adding in part 16?

>  #include <dt-bindings/thermal/thermal.h>

it looks like you moved this to board includes...imho this should stay in the rk356x.dtsi, because compilation will fail if a board without the vop2 (and missing the include) is derived from rk356x.dtsi.

regards Frank
