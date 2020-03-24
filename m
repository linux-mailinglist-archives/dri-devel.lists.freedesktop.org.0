Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F016C1919FC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 20:34:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C3F6E525;
	Tue, 24 Mar 2020 19:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B621C6E525
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 19:34:23 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id c20so14304696lfb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 12:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BuW1pgtMi1nFDluniTHUYAMhP+ECNJICP5kvAttrp90=;
 b=djAXMRGpfX/uYnxHJ3wl2qCQUySXiH6H9DG4JMMCYNMq+CNKLKGF43SapUWG/r/Sf4
 9jJQY9v5nX2vWjGcBkQV6PJN0djRJL8yL7kzP7wOERKNka2dR1DI6/7IZ1iDLorQSymH
 g4ha+k4Hg7vSp7GajygnZJtjf2DJuxcohHO4EZ6207TwbQg2DpmeWx425DGGClfDKQds
 9pl/yqXmqdStvtaXrMDpMHP/+g3ZF+mlT1jkDlTJN5lZ3clkfzHhb5YCor7FDdD7Q5R5
 ogEIx2Fuiom+0hLoUv/fY2iD3A3SXawE2a/bd3OenLkmaq6gxfuSXqBlTV1Hoxo5m1au
 dc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BuW1pgtMi1nFDluniTHUYAMhP+ECNJICP5kvAttrp90=;
 b=ZOjX8xhuFLyaU1xDrRvmibRiTWBIP1CD95JwZsqUAZ4gnnI9gwU3+OMajl/J8R/iq8
 3Ii6GmzXmQvY0mtsv3sAYd7o7Ao+5gCi1ONFJuTD7T6uqW/zuGWR1jxpjArHXX32E9LU
 VtIDPJjZrxymnSs1zR7UvMqIBqVcO2HsKxWgnzz1UYxpDcjuEf087uY+ZJg4OnQAp1xt
 Piafo3FByTKym75L0IJ7cyotTZF+puZw/4Oy4sN7cl3j7d7sB2BNfGbZfZCHvfFU3zip
 Kwvg1H+5+3xkNCwawR9dxWkc+Dsedtjg2ncTsQhZ8cdvHaIRKhha9dWeO97buQoLR8CP
 9HDg==
X-Gm-Message-State: ANhLgQ34cExDV4lNscPYjKCfp6JPiG0ELdy9GSFVA9a3rXjvQJL5GnA8
 JVXHk3NCOjXiLsDpriaZ84ej7dmKWewxg1PqgiY=
X-Google-Smtp-Source: ADFU+vtCUdIkmuQsY4QzJUMqNYV6lYZDkx1LNuGCgcfEy8vGbUSEMIGt5lO92LiWyGxs7J1Z7ulaFxz0Vq1YTqoUtYA=
X-Received: by 2002:a05:6512:3b7:: with SMTP id
 v23mr1260787lfp.66.1585078462025; 
 Tue, 24 Mar 2020 12:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584730033.git.agx@sigxcpu.org>
 <c7fd138e00608a108dae3651ab10d583a60040fc.1584730033.git.agx@sigxcpu.org>
In-Reply-To: <c7fd138e00608a108dae3651ab10d583a60040fc.1584730033.git.agx@sigxcpu.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 24 Mar 2020 16:34:13 -0300
Message-ID: <CAOMZO5Dhy7ahcR-S=QG=pumxXa8HnQoWpg0TdFyeu_Levdh9_Q@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: display/bridge: Add binding for NWL
 mipi dsi host controller
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Lee Jones <lee.jones@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, NXP Linux Team <linux-imx@nxp.com>,
 Robert Chiras <robert.chiras@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXIgMjAsIDIwMjAgYXQgMzo0OSBQTSBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hj
cHUub3JnPiB3cm90ZToKPgo+IFRoZSBOb3J0aHdlc3QgTG9naWMgTUlQSSBEU0kgSVAgY29yZSBj
YW4gYmUgZm91bmQgaW4gTlhQcyBpLk1YOCBTb0NzLgo+Cj4gU2lnbmVkLW9mZi1ieTogR3VpZG8g
R8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KPiBUZXN0ZWQtYnk6IFJvYmVydCBDaGlyYXMgPHJv
YmVydC5jaGlyYXNAbnhwLmNvbT4KPiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4KPiBBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgoKUmV2
aWV3ZWQtYnk6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
