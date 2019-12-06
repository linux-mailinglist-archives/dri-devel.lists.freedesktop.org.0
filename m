Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29952116A06
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:47:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE506E37F;
	Mon,  9 Dec 2019 09:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1CED26FA5E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 16:33:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,285,1571670000"; d="scan'208";a="33693117"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 07 Dec 2019 01:33:20 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2DA3B400D0EC;
 Sat,  7 Dec 2019 01:33:14 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v4 3/7] drm: rcar-du: lvds: Get dual link configuration from DT
Date: Fri,  6 Dec 2019 16:32:50 +0000
Message-Id: <1575649974-31472-4-git-send-email-fabrizio.castro@bp.renesas.com>
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

Rm9yIGR1YWwtTFZEUyBjb25maWd1cmF0aW9ucywgaXQgaXMgbm93IHBvc3NpYmxlIHRvIG1hcmsg
dGhlCkRUIHBvcnQgbm9kZXMgZm9yIHRoZSBzaW5rIHdpdGggYm9vbGVhbiBwcm9wZXJ0aWVzIChs
aWtlCmR1YWwtbHZkcy1ldmVuLXBpeGVscyBhbmQgZHVhbC1sdmRzLW9kZC1waXhlbHMpIHRvIGxl
dCBkcml2ZXJzCmtub3cgdGhlIGVuY29kZXJzIG5lZWQgdG8gYmUgY29uZmlndXJlZCBpbiBkdWFs
LUxWRFMgbW9kZS4KClJld29yayB0aGUgaW1wbGVtZW50YXRpb24gb2YgcmNhcl9sdmRzX3BhcnNl
X2R0X2NvbXBhbmlvbgp0byBtYWtlIHVzZSBvZiB0aGUgRFQgbWFya2VycyB3aGlsZSBrZWVwaW5n
IGJhY2t3YXJkCmNvbXBhdGliaWxpdHkuCgpTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8g
PGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KCi0tLQp2My0+djQ6CiogTmV3IHBhdGNo
IGV4dHJhY3RlZCBmcm9tIHBhdGNoOgogICJkcm06IHJjYXItZHU6IGx2ZHM6IEFkZCBkdWFsLUxW
RFMgcGFuZWxzIHN1cHBvcnQiCi0tLQogZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRz
LmMgfCA1NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1
L3JjYXJfbHZkcy5jCmluZGV4IDNjYjBhODMuLjZjMWYxNzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1
L3JjYXJfbHZkcy5jCkBAIC02NjksOCArNjY5LDEwIEBAIEVYUE9SVF9TWU1CT0xfR1BMKHJjYXJf
bHZkc19kdWFsX2xpbmspOwogc3RhdGljIGludCByY2FyX2x2ZHNfcGFyc2VfZHRfY29tcGFuaW9u
KHN0cnVjdCByY2FyX2x2ZHMgKmx2ZHMpCiB7CiAJY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCAq
bWF0Y2g7Ci0Jc3RydWN0IGRldmljZV9ub2RlICpjb21wYW5pb247CisJc3RydWN0IGRldmljZV9u
b2RlICpjb21wYW5pb24sICpwMCwgKnAxOworCXN0cnVjdCByY2FyX2x2ZHMgKmNvbXBhbmlvbl9s
dmRzOwogCXN0cnVjdCBkZXZpY2UgKmRldiA9IGx2ZHMtPmRldjsKKwlpbnQgZHVhbF9saW5rOwog
CWludCByZXQgPSAwOwogCiAJLyogTG9jYXRlIHRoZSBjb21wYW5pb24gTFZEUyBlbmNvZGVyIGZv
ciBkdWFsLWxpbmsgb3BlcmF0aW9uLCBpZiBhbnkuICovCkBAIC02ODksMTMgKzY5MSw1NSBAQCBz
dGF0aWMgaW50IHJjYXJfbHZkc19wYXJzZV9kdF9jb21wYW5pb24oc3RydWN0IHJjYXJfbHZkcyAq
bHZkcykKIAkJZ290byBkb25lOwogCX0KIAorCS8qCisJICogV2UgbmVlZCB0byB3b3JrIG91dCBp
ZiB0aGUgc2luayBpcyBleHBlY3RpbmcgdXMgdG8gZnVuY3Rpb24gaW4KKwkgKiBkdWFsLWxpbmsg
bW9kZS4gV2UgZG8gdGhpcyBieSBsb29raW5nIGF0IHRoZSBEVCBwb3J0IG5vZGVzIHdlIGFyZQor
CSAqIGNvbm5lY3RlZCB0bywgaWYgdGhleSBhcmUgbWFya2VkIGFzIGV4cGVjdGluZyBldmVuIHBp
eGVscyBhbmQKKwkgKiBvZGQgcGl4ZWxzIHRoYW4gd2UgbmVlZCB0byBlbmFibGUgdmVydGljYWwg
c3RyaXBlIG91dHB1dC4KKwkgKi8KKwlwMCA9IG9mX2dyYXBoX2dldF9wb3J0X2J5X2lkKGRldi0+
b2Zfbm9kZSwgMSk7CisJcDEgPSBvZl9ncmFwaF9nZXRfcG9ydF9ieV9pZChjb21wYW5pb24sIDEp
OworCWR1YWxfbGluayA9IGRybV9vZl9sdmRzX2dldF9kdWFsX2xpbmtfcGl4ZWxfb3JkZXIocDAs
IHAxKTsKKwlvZl9ub2RlX3B1dChwMCk7CisJb2Zfbm9kZV9wdXQocDEpOworCWlmIChkdWFsX2xp
bmsgPj0gRFJNX0xWRFNfRFVBTF9MSU5LX0VWRU5fT0REX1BJWEVMUykgeworCQlsdmRzLT5kdWFs
X2xpbmsgPSB0cnVlOworCX0gZWxzZSBpZiAobHZkcy0+bmV4dF9icmlkZ2UgJiYgbHZkcy0+bmV4
dF9icmlkZ2UtPnRpbWluZ3MpIHsKKwkJLyoKKwkJICogRWFybHkgZHVhbC1saW5rIGJyaWRnZSBz
cGVjaWZpYyBpbXBsZW1lbnRhdGlvbnMgcG9wdWxhdGUgdGhlCisJCSAqIHRpbWluZ3MgZmllbGQg
b2YgZHJtX2JyaWRnZSwgcmVhZCB0aGUgZHVhbF9saW5rIGZsYWcgb2ZmIHRoZQorCQkgKiBicmlk
Z2UgZGlyZWN0bHkgZm9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkuCisJCSAqLworCQlsdmRzLT5k
dWFsX2xpbmsgPSBsdmRzLT5uZXh0X2JyaWRnZS0+dGltaW5ncy0+ZHVhbF9saW5rOworCX0KKwor
CWlmICghbHZkcy0+ZHVhbF9saW5rKSB7CisJCWRldl9kYmcoZGV2LCAiU2luZ2xlLWxpbmsgY29u
ZmlndXJhdGlvbiBkZXRlY3RlZFxuIik7CisJCWdvdG8gZG9uZTsKKwl9CisKIAlsdmRzLT5jb21w
YW5pb24gPSBvZl9kcm1fZmluZF9icmlkZ2UoY29tcGFuaW9uKTsKIAlpZiAoIWx2ZHMtPmNvbXBh
bmlvbikgewogCQlyZXQgPSAtRVBST0JFX0RFRkVSOwogCQlnb3RvIGRvbmU7CiAJfQogCi0JZGV2
X2RiZyhkZXYsICJGb3VuZCBjb21wYW5pb24gZW5jb2RlciAlcE9GXG4iLCBjb21wYW5pb24pOwor
CWRldl9kYmcoZGV2LAorCQkiRHVhbC1saW5rIGNvbmZpZ3VyYXRpb24gZGV0ZWN0ZWQgKGNvbXBh
bmlvbiBlbmNvZGVyICVwT0YpXG4iLAorCQljb21wYW5pb24pOworCisJY29tcGFuaW9uX2x2ZHMg
PSBicmlkZ2VfdG9fcmNhcl9sdmRzKGx2ZHMtPmNvbXBhbmlvbik7CisKKwkvKgorCSAqIEZJWE1F
OiBXZSBzaG91bGQgbm90IGJlIG1lc3Npbmcgd2l0aCB0aGUgY29tcGFuaW9uIGVuY29kZXIgcHJp
dmF0ZQorCSAqIGRhdGEgZnJvbSB0aGUgcHJpbWFyeSBlbmNvZGVyLCB3ZSBzaG91bGQgcmF0aGVy
IGxldCB0aGUgY29tcGFuaW9uCisJICogZW5jb2RlciB3b3JrIHRoaW5ncyBvdXQgb24gaXRzIG93
bi4gSG93ZXZlciwgdGhlIGNvbXBhbmlvbiBlbmNvZGVyCisJICogZG9lc24ndCBob2xkIGEgcmVm
ZXJlbmNlIHRvIHRoZSBwcmltYXJ5IGVuY29kZXIsIGFuZAorCSAqIGRybV9vZl9sdmRzX2dldF9k
dWFsX2xpbmtfcGl4ZWxfb3JkZXIgbmVlZHMgdG8gYmUgZ2l2ZW4gcmVmZXJlbmNlcworCSAqIHRv
IHRoZSBvdXRwdXQgcG9ydHMgb2YgYm90aCBlbmNvZGVycywgdGhlcmVmb3JlIGxlYXZlIGl0IGxp
a2UgdGhpcworCSAqIGZvciB0aGUgdGltZSBiZWluZy4KKwkgKi8KKwljb21wYW5pb25fbHZkcy0+
ZHVhbF9saW5rID0gdHJ1ZTsKIAogZG9uZToKIAlvZl9ub2RlX3B1dChjb21wYW5pb24pOwpAQCAt
NzM5LDEzICs3ODMsNyBAQCBzdGF0aWMgaW50IHJjYXJfbHZkc19wYXJzZV9kdChzdHJ1Y3QgcmNh
cl9sdmRzICpsdmRzKQogCWlmIChyZXQpCiAJCWdvdG8gZG9uZTsKIAotCWlmICgobHZkcy0+aW5m
by0+cXVpcmtzICYgUkNBUl9MVkRTX1FVSVJLX0RVQUxfTElOSykgJiYKLQkgICAgbHZkcy0+bmV4
dF9icmlkZ2UpCi0JCWx2ZHMtPmR1YWxfbGluayA9IGx2ZHMtPm5leHRfYnJpZGdlLT50aW1pbmdz
Ci0JCQkJPyBsdmRzLT5uZXh0X2JyaWRnZS0+dGltaW5ncy0+ZHVhbF9saW5rCi0JCQkJOiBmYWxz
ZTsKLQotCWlmIChsdmRzLT5kdWFsX2xpbmspCisJaWYgKGx2ZHMtPmluZm8tPnF1aXJrcyAmIFJD
QVJfTFZEU19RVUlSS19EVUFMX0xJTkspCiAJCXJldCA9IHJjYXJfbHZkc19wYXJzZV9kdF9jb21w
YW5pb24obHZkcyk7CiAKIGRvbmU6Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
