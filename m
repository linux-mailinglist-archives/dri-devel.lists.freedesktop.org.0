Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 814ACC0782
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 16:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D37F6E8D6;
	Fri, 27 Sep 2019 14:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69276E8D6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 14:28:25 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8RES9Jl032239;
 Fri, 27 Sep 2019 09:28:09 -0500
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RES9c0058683;
 Fri, 27 Sep 2019 09:28:09 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 27
 Sep 2019 09:28:01 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 27 Sep 2019 09:28:08 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RES34L065306;
 Fri, 27 Sep 2019 09:28:03 -0500
Subject: Re: DRM_MODE_CONNECTOR_PANEL? [Was: drm/panel: Add and fill drm_panel
 type field]
To: Daniel Stone <daniel@fooishbar.org>, Linus Walleij
 <linus.walleij@linaro.org>
References: <20190823193245.23876-1-laurent.pinchart@ideasonboard.com>
 <20190823193245.23876-4-laurent.pinchart@ideasonboard.com>
 <20190824095421.GC30584@ravnborg.org>
 <CACRpkdYk8S271X7pV_Vxe7BhL_mScV69Xbet2xyOqF0fFsRdcg@mail.gmail.com>
 <CAPj87rN3Dh1ANz=rZD=EMOfRXce7cc7v3M6TR2P0VJhyrT4-yw@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <45dd0859-b5e7-534f-48ab-6dd4a16f38af@ti.com>
Date: Fri, 27 Sep 2019 17:28:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAPj87rN3Dh1ANz=rZD=EMOfRXce7cc7v3M6TR2P0VJhyrT4-yw@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569594489;
 bh=AgBcjNcXGzzrpxBiI4zbXw5YwGmpSxqGXGisof47tVA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=QEqGttNS2Wn1SahXPk9C3/zqnU76FXe0jONNdScNbExatx/civFPfbKjMLQxbyzRL
 1tr/KdF8eoXHpVkcOeWfX36z7jcdnbvoy5BTbCyjqkfuRdOGl1aR7aCGxHOLW9GgQQ
 WTtYUuAikYuEHNZrdFa6mW/WFiWoXqroOrh0JBs0=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Stefan Mavrodiev <stefan@olimex.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jyri Sarha <jsarha@ti.com>,
 Sean Paul <sean@poorly.run>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Purism Kernel Team <kernel@puri.sm>, Boris Brezillon <bbrezillon@kernel.org>,
 Philippe Cornu <philippe.cornu@st.com>, Yannick Fertre <yannick.fertre@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjcvMDkvMjAxOSAxNTo0NCwgRGFuaWVsIFN0b25lIHdyb3RlOgo+IEhpIExpbnVzLAo+IAo+
IE9uIEZyaSwgMjcgU2VwIDIwMTkgYXQgMTM6MzcsIExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxl
aWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4+IEFsc28gdGhlIElMSTkzMjIgY2FuIGFjdHVhbGx5IHNl
dCB1cCBnYW1tYSBjb3JyZWN0aW9uIHdoaWNoIGlzCj4+IHZlcnkgbmljZSBmb3IgcHJvZmVzc2lv
bmFsIGFwcGxpY2F0aW9ucy4gSSBoYXZlbid0IHNlZW4gYW55IHdheSBmb3IKPj4gRFJNIHRvIGRv
IGdhbW1hIGNvcnJlY3Rpb24gcHJvcGVybHkgb3IgYW55IGZyYW1ld29yayBmb3IgaXQKPj4gdG8g
YWRqdXN0IGFuZCBwcm9wYWdhdGUgZ2FtbWEgdG8vZnJvbSB1c2Vyc3BhY2UgKHNlZW1zIGxpa2UK
Pj4gYW5vdGhlciBlbm9ybW91cyB0YXNrKSwgYnV0IEkgYW0gcHJldHR5IHN1cmUgaXQgd2lsbCBi
ZSB0aGVyZSBvbmUKPj4gb2YgdGhlc2UgZGF5cyBzbyBJIHB1dCBpbiBzb21lIGNvbW1lbnRzIGFu
ZCBwbGFjZWhvbGRlcnMuCj4gCj4gR2FtbWEgY29ycmVjdGlvbiBoYXMgYmVlbiBzdXBwb3J0ZWQg
c2luY2UgYXBwcm94aW1hdGVseSB0aGUgZGF3biBvZgo+IHRpbWUgd2l0aCBhIDN4OC1iaXQgTFVU
LgoKQnV0LCBhZmFpaywgb25seSBpbiB0aGUgZGlzcGxheSBjb250cm9sbGVyIHNpZGUuIEkgZG9u
J3QgdGhpbmsgd2UgaGF2ZSAKbWVhbnMgdG8gaGF2ZSBhbnkgcHJvcGVydGllcyBmb3IgdGhlIHBh
bmVscyBvciBicmlkZ2VzLgoKICBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBP
eSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElE
OiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
