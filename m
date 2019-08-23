Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCDE9B715
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 21:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBA66E051;
	Fri, 23 Aug 2019 19:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4996E051
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 19:33:01 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98FB233D;
 Fri, 23 Aug 2019 21:32:57 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/panel: Add missing drm_panel_init() in panel
 drivers
Date: Fri, 23 Aug 2019 22:32:42 +0300
Message-Id: <20190823193245.23876-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190823193245.23876-1-laurent.pinchart@ideasonboard.com>
References: <20190823193245.23876-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566588779;
 bh=RPDXjz0kZyGgufwuSWIsnoyPWbNh4DqCVRaBTyrZ+4k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AjJ6jn6DCO9B6f8HUPnb/AchYmmjf8F4IxheCD1ojm6jolTRTW8Ouk0QvGjrcF6NY
 T10JorsCWO2Qmavsx44O5gvGgwgP3RZhtsyckMUXi0I57Ab7h+LmWCS/8JU5GPuXQa
 vk5F9QYNeo1VksTdw+LR3OVdD9HV10l+Fr189lJo=
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
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Philippe Cornu <philippe.cornu@st.com>, Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Yannick Fertre <yannick.fertre@st.com>, Stefan Mavrodiev <stefan@olimex.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jyri Sarha <jsarha@ti.com>,
 Sean Paul <sean@poorly.run>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Purism Kernel Team <kernel@puri.sm>, Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGFuZWxzIG11c3QgYmUgaW5pdGlhbGlzZWQgd2l0aCBkcm1fcGFuZWxfaW5pdCgpLiBBZGQgdGhl
IG1pc3NpbmcKZnVuY3Rpb24gY2FsbCBpbiB0aGUgcGFuZWwtcmFzcGJlcnJ5cGktdG91Y2hzY3Jl
ZW4uYyBhbmQKcGFuZWwtc2l0cm9uaXgtc3Q3Nzg5di5jIGRyaXZlcnMuCgpTaWduZWQtb2ZmLWJ5
OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJhc3BiZXJyeXBpLXRvdWNoc2NyZWVuLmMg
fCAxICsKIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaXRyb25peC1zdDc3ODl2LmMgICAg
ICAgIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNjcmVlbi5jIGIv
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJhc3BiZXJyeXBpLXRvdWNoc2NyZWVuLmMKaW5k
ZXggYjViMTRhYTA1OWVhLi4yYWE4OWVhZWNmNmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNjcmVlbi5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNjcmVlbi5jCkBAIC00MjYsNiArNDI2
LDcgQEAgc3RhdGljIGludCBycGlfdG91Y2hzY3JlZW5fcHJvYmUoc3RydWN0IGkyY19jbGllbnQg
KmkyYywKIAkJcmV0dXJuIFBUUl9FUlIodHMtPmRzaSk7CiAJfQogCisJZHJtX3BhbmVsX2luaXQo
JnRzLT5iYXNlKTsKIAl0cy0+YmFzZS5kZXYgPSBkZXY7CiAJdHMtPmJhc2UuZnVuY3MgPSAmcnBp
X3RvdWNoc2NyZWVuX2Z1bmNzOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtc2l0cm9uaXgtc3Q3Nzg5di5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNp
dHJvbml4LXN0Nzc4OXYuYwppbmRleCA1ZTNlOTJlYTllYTYuLjNiMjYxMmFlOTMxZSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpdHJvbml4LXN0Nzc4OXYuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2l0cm9uaXgtc3Q3Nzg5di5jCkBAIC0zODEs
NiArMzgxLDcgQEAgc3RhdGljIGludCBzdDc3ODl2X3Byb2JlKHN0cnVjdCBzcGlfZGV2aWNlICpz
cGkpCiAJc3BpX3NldF9kcnZkYXRhKHNwaSwgY3R4KTsKIAljdHgtPnNwaSA9IHNwaTsKIAorCWRy
bV9wYW5lbF9pbml0KCZjdHgtPnBhbmVsKTsKIAljdHgtPnBhbmVsLmRldiA9ICZzcGktPmRldjsK
IAljdHgtPnBhbmVsLmZ1bmNzID0gJnN0Nzc4OXZfZHJtX2Z1bmNzOwogCi0tIApSZWdhcmRzLAoK
TGF1cmVudCBQaW5jaGFydAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
