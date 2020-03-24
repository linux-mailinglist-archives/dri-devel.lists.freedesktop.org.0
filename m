Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DABDD1919FE
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 20:35:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8842B6E523;
	Tue, 24 Mar 2020 19:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D896E523
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 19:35:04 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 19so19886917ljj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 12:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=e0wTObJ08RVlnsiArj9gwShr2d4p9qtkVTHwSjLAzow=;
 b=DK2S9+6j9KGtB+U8ylYOlNV2DVU70arttAXObYJ0oTXa6BOrLf9+gbnyj/PqN3X0mt
 RjjtcailfvOx5tUiFPKTJUGP7rWdHY24ZVQqaamiy/JF82tIAI/V71JtbY//N2BlJNP4
 OZpyzlmPdfcfisxOkGgJc0m+yfqTvbEuaAp7ZPXu+Ygs63V+tBXgi7mp8CeuH8RxaBVs
 eNHas9j3FuVOFysmaI3aTA2xkFi8t3ksU3AXqi5DSpRz/NoeEfiJjrxrlSXkZ5nq3Fwx
 KGLl6ThOEcQOg/Tm1LKmg+GfIx0KsT/WFnzvyf3ofAgXBNSzV9js8J/VPiK3JWh1VUDv
 CNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=e0wTObJ08RVlnsiArj9gwShr2d4p9qtkVTHwSjLAzow=;
 b=ozsGwOsXxzx3HS0Nxy9BQ+67hidMYRS7DqM2TTT5/7p/Ub4pvDvUpTMLR9g6EqRMVF
 jF0xw4rjvPCvj1N0AnCWlkkZ00zLt3FIqSA0EY7at0pMxbdBeKd58k+AHZs3Dkh3Y8nn
 kb5MIb87iLIi1mM1G8FwlLtCwVa4keUA601VIiWAyxeh8sq3i/c762BEAABAJEnIVHCr
 LPLxfdRim2JSHmpstzAzCyDbiJZS+8eXXUc/t+HNXlKjyyM3WUZc7/5T/XmAKzvdZiaH
 0QUvTtm520gKBfjJFevDEjitWRptKYn6OpSdBhoXQ4dSXfSIzx+UCW74UEuSODaVPfVi
 ET+Q==
X-Gm-Message-State: ANhLgQ1JtCUXTmlLscHAqpbTpbb5g2isAB56FTyWIQxsCcUsRiaJfGUD
 DEp2VZH6KWMIIHvVOECoXvVFKDE/laeGwweE8Oo=
X-Google-Smtp-Source: ADFU+vtR0T6QWse42XxH9cPngbBhP7L+wmNFP2DjiGQUffZhWB/3y876D0GfC4X3TViS4JAgfxSBjxgnaT5p6bewcwk=
X-Received: by 2002:a05:651c:30b:: with SMTP id
 a11mr7059917ljp.164.1585078502370; 
 Tue, 24 Mar 2020 12:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584730033.git.agx@sigxcpu.org>
 <22f34fb7cf7ee4262cf63372aee90bc8e5ae3f35.1584730033.git.agx@sigxcpu.org>
In-Reply-To: <22f34fb7cf7ee4262cf63372aee90bc8e5ae3f35.1584730033.git.agx@sigxcpu.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 24 Mar 2020 16:34:53 -0300
Message-ID: <CAOMZO5Du-ZP7Wxm2eh8WaFoCk_kWomgH57ayJrBB0PzhuAA+mw@mail.gmail.com>
Subject: Re: [PATCH v10 2/2] drm/bridge: Add NWL MIPI DSI host controller
 support
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
cHUub3JnPiB3cm90ZToKPgo+IFRoaXMgYWRkcyBpbml0aWFsIHN1cHBvcnQgZm9yIHRoZSBOV0wg
TUlQSSBEU0kgSG9zdCBjb250cm9sbGVyIGZvdW5kIG9uCj4gaS5NWDggU29Dcy4KPgo+IEl0IGFk
ZHMgc3VwcG9ydCBmb3IgdGhlIGkuTVg4TVEgYnV0IHRoZSBzYW1lIElQIGNhbiBiZSBmb3VuZCBv
bgo+IGUuZy4gdGhlIGkuTVg4UVhQLgo+Cj4gSXQgaGFzIGJlZW4gdGVzdGVkIG9uIHRoZSBMaWJy
ZW0gNSBkZXZraXQgdXNpbmcgbXhzZmIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBHdWlkbyBHw7xudGhl
ciA8YWd4QHNpZ3hjcHUub3JnPgo+IENvLWRldmVsb3BlZC1ieTogUm9iZXJ0IENoaXJhcyA8cm9i
ZXJ0LmNoaXJhc0BueHAuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFJvYmVydCBDaGlyYXMgPHJvYmVy
dC5jaGlyYXNAbnhwLmNvbT4KPiBUZXN0ZWQtYnk6IFJvYmVydCBDaGlyYXMgPHJvYmVydC5jaGly
YXNAbnhwLmNvbT4KPiBUZXN0ZWQtYnk6IE1hcnRpbiBLZXBwbGluZ2VyIDxtYXJ0aW4ua2VwcGxp
bmdlckBwdXJpLnNtPgoKUmV2aWV3ZWQtYnk6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWls
LmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
