Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E588116A03
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:47:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6114D6E3A8;
	Mon,  9 Dec 2019 09:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4ADB26FA59
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 16:33:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,285,1571670000"; d="scan'208";a="33477370"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 07 Dec 2019 01:33:26 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id EAAEA400D4D7;
 Sat,  7 Dec 2019 01:33:20 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v4 4/7] drm: rcar-du: lvds: Allow for even and odd pixels swap
Date: Fri,  6 Dec 2019 16:32:51 +0000
Message-Id: <1575649974-31472-5-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Mon, 09 Dec 2019 09:46:36 +0000
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 ebiharaml@si-linux.co.jp,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RFQgcHJvcGVydGllcyBkdWFsLWx2ZHMtZXZlbi1waXhlbHMgYW5kIGR1YWwtbHZkcy1vZGQtcGl4
ZWxzCmNhbiBiZSB1c2VkIHRvIHdvcmsgb3V0IGlmIHRoZSBkcml2ZXIgbmVlZHMgdG8gc3dhcCBl
dmVuCmFuZCBvZGQgcGl4ZWxzIGFyb3VuZC4KClRoaXMgcGF0Y2ggbWFrZXMgdXNlIG9mIHRoZSBy
ZXR1cm4gdmFsdWUgZnJvbSBmdW5jdGlvbgpkcm1fb2ZfbHZkc19nZXRfZHVhbF9saW5rX3BpeGVs
X29yZGVyIHRvIGRldGVybWluZSBpZiB3ZQpuZWVkIHRvIHN3YXAgb2RkIGFuZCBldmVuIHBpeGVs
cyBhcm91bmQgZm9yIHRoaW5ncyB0byB3b3JrCnByb3Blcmx5LgoKU2lnbmVkLW9mZi1ieTogRmFi
cml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+CgotLS0KdjMtPnY0
OgoqIE5ldyBwYXRjaCBleHRyYWN0ZWQgZnJvbSBwYXRjaDoKICAiZHJtOiByY2FyLWR1OiBsdmRz
OiBBZGQgZHVhbC1MVkRTIHBhbmVscyBzdXBwb3J0IgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yY2Fy
LWR1L3JjYXJfbHZkcy5jIHwgNDYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMgYi9kcml2ZXJzL2dw
dS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYwppbmRleCA2YzFmMTcxLi5jYjIxNDdjIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYwpAQCAtNzEsNiArNzEsNyBAQCBzdHJ1Y3QgcmNhcl9s
dmRzIHsKIAogCXN0cnVjdCBkcm1fYnJpZGdlICpjb21wYW5pb247CiAJYm9vbCBkdWFsX2xpbms7
CisJYm9vbCBzdHJpcGVfc3dhcF9kYXRhOwogfTsKIAogI2RlZmluZSBicmlkZ2VfdG9fcmNhcl9s
dmRzKGIpIFwKQEAgLTQ0MSwxMiArNDQyLDIwIEBAIHN0YXRpYyB2b2lkIHJjYXJfbHZkc19lbmFi
bGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKIAlyY2FyX2x2ZHNfd3JpdGUobHZkcywgTFZE
Q0hDUiwgbHZkaGNyKTsKIAogCWlmIChsdmRzLT5pbmZvLT5xdWlya3MgJiBSQ0FSX0xWRFNfUVVJ
UktfRFVBTF9MSU5LKSB7Ci0JCS8qCi0JCSAqIENvbmZpZ3VyZSB2ZXJ0aWNhbCBzdHJpcGUgYmFz
ZWQgb24gdGhlIG1vZGUgb2Ygb3BlcmF0aW9uIG9mCi0JCSAqIHRoZSBjb25uZWN0ZWQgZGV2aWNl
LgotCQkgKi8KLQkJcmNhcl9sdmRzX3dyaXRlKGx2ZHMsIExWRFNUUklQRSwKLQkJCQlsdmRzLT5k
dWFsX2xpbmsgPyBMVkRTVFJJUEVfU1RfT04gOiAwKTsKKwkJdTMyIGx2ZHN0cmlwZSA9IDA7CisK
KwkJaWYgKGx2ZHMtPmR1YWxfbGluaykKKwkJCS8qCisJCQkgKiBDb25maWd1cmUgdmVydGljYWwg
c3RyaXBlIGJhc2VkIG9uIHRoZSBtb2RlIG9mCisJCQkgKiBvcGVyYXRpb24gb2YgdGhlIGNvbm5l
Y3RlZCBkZXZpY2UuCisJCQkgKgorCQkJICogU1RfU1dBUCBmcm9tIExWRDFTVFJJUEUgaXMgcmVz
ZXJ2ZWQsIGRvIG5vdCBzZXQKKwkJCSAqIGluIHRoZSBjb21wYW5pb24gTFZEUworCQkJICovCisJ
CQlsdmRzdHJpcGUgPSBMVkRTVFJJUEVfU1RfT04gfAorCQkJCShsdmRzLT5jb21wYW5pb24gJiYg
bHZkcy0+c3RyaXBlX3N3YXBfZGF0YSA/CisJCQkJIExWRFNUUklQRV9TVF9TV0FQIDogMCk7CisJ
CXJjYXJfbHZkc193cml0ZShsdmRzLCBMVkRTVFJJUEUsIGx2ZHN0cmlwZSk7CiAJfQogCiAJLyoK
QEAgLTcwMiwxNyArNzExLDMzIEBAIHN0YXRpYyBpbnQgcmNhcl9sdmRzX3BhcnNlX2R0X2NvbXBh
bmlvbihzdHJ1Y3QgcmNhcl9sdmRzICpsdmRzKQogCWR1YWxfbGluayA9IGRybV9vZl9sdmRzX2dl
dF9kdWFsX2xpbmtfcGl4ZWxfb3JkZXIocDAsIHAxKTsKIAlvZl9ub2RlX3B1dChwMCk7CiAJb2Zf
bm9kZV9wdXQocDEpOwotCWlmIChkdWFsX2xpbmsgPj0gRFJNX0xWRFNfRFVBTF9MSU5LX0VWRU5f
T0REX1BJWEVMUykgeworCisJc3dpdGNoIChkdWFsX2xpbmspIHsKKwljYXNlIERSTV9MVkRTX0RV
QUxfTElOS19PRERfRVZFTl9QSVhFTFM6CisJCS8qCisJCSAqIEJ5IGRlZmF1bHQgd2UgZ2VuZXJh
dGUgZXZlbiBwaXhlbHMgZnJvbSB0aGlzIGVuY29kZXIgYW5kIG9kZAorCQkgKiBwaXhlbHMgZnJv
bSB0aGUgY29tcGFuaW9uIGVuY29kZXIsIGJ1dCBzaW5jZSBwMCBpcyBjb25uZWN0ZWQKKwkJICog
dG8gdGhlIHBvcnQgZXhwZWN0aW5nIG9vZCBwaXhlbHMsIGFuZCBwMSBpcyBjb25uZWN0ZWQgdG8g
dGhlCisJCSAqIHBvcnQgZXhwZWN0aW5nIGV2ZW4gcGl4ZWxzLCB3ZSBuZWVkIHRvIHN3YXAgZXZl
biBhbmQgb2RkCisJCSAqIHBpeGVscyBhcm91bmQuCisJCSAqLworCQlsdmRzLT5zdHJpcGVfc3dh
cF9kYXRhID0gdHJ1ZTsKKwkJbHZkcy0+ZHVhbF9saW5rID0gdHJ1ZTsKKwkJYnJlYWs7CisJY2Fz
ZSBEUk1fTFZEU19EVUFMX0xJTktfRVZFTl9PRERfUElYRUxTOgogCQlsdmRzLT5kdWFsX2xpbmsg
PSB0cnVlOwotCX0gZWxzZSBpZiAobHZkcy0+bmV4dF9icmlkZ2UgJiYgbHZkcy0+bmV4dF9icmlk
Z2UtPnRpbWluZ3MpIHsKKwkJYnJlYWs7CisJZGVmYXVsdDoKIAkJLyoKIAkJICogRWFybHkgZHVh
bC1saW5rIGJyaWRnZSBzcGVjaWZpYyBpbXBsZW1lbnRhdGlvbnMgcG9wdWxhdGUgdGhlCiAJCSAq
IHRpbWluZ3MgZmllbGQgb2YgZHJtX2JyaWRnZSwgcmVhZCB0aGUgZHVhbF9saW5rIGZsYWcgb2Zm
IHRoZQogCQkgKiBicmlkZ2UgZGlyZWN0bHkgZm9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkuCiAJ
CSAqLwotCQlsdmRzLT5kdWFsX2xpbmsgPSBsdmRzLT5uZXh0X2JyaWRnZS0+dGltaW5ncy0+ZHVh
bF9saW5rOworCQlpZiAobHZkcy0+bmV4dF9icmlkZ2UgJiYgbHZkcy0+bmV4dF9icmlkZ2UtPnRp
bWluZ3MpCisJCQlsdmRzLT5kdWFsX2xpbmsgPSBsdmRzLT5uZXh0X2JyaWRnZS0+dGltaW5ncy0+
ZHVhbF9saW5rOwogCX0KIAorCiAJaWYgKCFsdmRzLT5kdWFsX2xpbmspIHsKIAkJZGV2X2RiZyhk
ZXYsICJTaW5nbGUtbGluayBjb25maWd1cmF0aW9uIGRldGVjdGVkXG4iKTsKIAkJZ290byBkb25l
OwpAQCAtNzI4LDYgKzc1Myw5IEBAIHN0YXRpYyBpbnQgcmNhcl9sdmRzX3BhcnNlX2R0X2NvbXBh
bmlvbihzdHJ1Y3QgcmNhcl9sdmRzICpsdmRzKQogCQkiRHVhbC1saW5rIGNvbmZpZ3VyYXRpb24g
ZGV0ZWN0ZWQgKGNvbXBhbmlvbiBlbmNvZGVyICVwT0YpXG4iLAogCQljb21wYW5pb24pOwogCisJ
aWYgKGx2ZHMtPnN0cmlwZV9zd2FwX2RhdGEpCisJCWRldl9kYmcoZGV2LCAiRGF0YSBzd2FwcGlu
ZyByZXF1aXJlZFxuIik7CisKIAljb21wYW5pb25fbHZkcyA9IGJyaWRnZV90b19yY2FyX2x2ZHMo
bHZkcy0+Y29tcGFuaW9uKTsKIAogCS8qCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
