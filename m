Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DDC9AE10
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 13:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61376E06B;
	Fri, 23 Aug 2019 11:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4606E06B
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 11:26:24 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B1CA328D4E8;
 Fri, 23 Aug 2019 12:26:21 +0100 (BST)
Date: Fri, 23 Aug 2019 13:26:18 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH 1/2] drm/panel: Add and fill drm_panel type field
Message-ID: <20190823132618.18523da8@collabora.com>
In-Reply-To: <01887051-7cf7-cf52-65d1-85d60c3dd02c@microchip.com>
References: <20190823014033.2971-1-laurent.pinchart@ideasonboard.com>
 <01887051-7cf7-cf52-65d1-85d60c3dd02c@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: alexandre.belloni@bootlin.com, narmstrong@baylibre.com, agx@sigxcpu.org,
 dri-devel@lists.freedesktop.org, paul@crapouillou.net,
 thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, sam@ravnborg.org,
 stefan@olimex.com, Tudor.Ambarus@microchip.com,
 Ludovic.Desroches@microchip.com, tomi.valkeinen@ti.com,
 jagan@amarulasolutions.com, robert.chiras@nxp.com, alexandre.torgue@st.com,
 jonas@kwiboo.se, jsarha@ti.com, vincent.abriou@st.com, jernej.skrabec@siol.net,
 kernel@puri.sm, philippe.cornu@st.com, yannick.fertre@st.com,
 kieran.bingham+renesas@ideasonboard.com, mcoquelin.stm32@gmail.com,
 Claudiu.Beznea@microchip.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMyBBdWcgMjAxOSAwNzozMDowNyArMDAwMAo8Tmljb2xhcy5GZXJyZUBtaWNyb2No
aXAuY29tPiB3cm90ZToKCj4gSGkgTGF1cmVudCwKPiAKPiBPbiAyMy8wOC8yMDE5IGF0IDAzOjQw
LCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4gQWRkIGEgdHlwZSBmaWVsZCB0byB0aGUgZHJt
X3BhbmVsIHN0cnVjdHVyZSB0byByZXBvcnQgdGhlIHBhbmVsIHR5cGUsCj4gPiB1c2luZyBEUk1f
TU9ERV9DT05ORUNUT1JfKiBtYWNyb3MgKHRoZSB2YWx1ZXMgdGhhdCBtYWtlIHNlbnNlIGFyZSBM
VkRTLAo+ID4gZURQLCBEU0kgYW5kIERQSSkuIFRoaXMgd2lsbCBiZSB1c2VkIHRvIGluaXRpYWxp
c2UgdGhlIGNvcnJlc3BvbmRpbmcKPiA+IGNvbm5lY3RvciB0eXBlLiAgCj4gCj4gV2l0aCBNaWNy
b2NoaXAvQXRtZWwgZHJpdmVyLCB3ZSBtYWlubHkgKG9ubHkpIHVzZSB0aGUgIlVua25vd24iIHR5
cGUgb2YgCj4gY29ubmVjdG9yIGJlY2F1c2Ugb3VyIGhhcmR3YXJlIHNpbXBseSB1c2VzIFJHQiB3
aXJlcyBpbiBwYXJhbGxlbC4KPiAKPiBTaG91bGQgd2UgbW92ZSB0byBhbm90aGVyIGNvbm5lY3Rv
ciB0eXBlIChtYXliZSBub3cgdGhhdCBpdCdzIGNyZWF0ZWQgCj4gYW5kIGl0IHdhcyBub3QsIGJh
Y2sgd2hlbiB3ZSBjaG9zZSB0aGUgIlVua25vd24iIG9uZSk/CgpJIGNvbmZpcm0sIERSTV9NT0RF
X0VOQ09ERVJfRFBJIHdhcyBub3QgZGVmaW5lZCB3aGVuIEkgc3dpdGNoZWQgZnJvbQpfTFZEUyAo
d2hpY2ggd2FzIHdyb25nKSB0byBfVW5rbm93bi4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
