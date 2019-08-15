Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A04F691183
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C92F6EA2F;
	Sat, 17 Aug 2019 15:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id DCAB66E17C
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 11:05:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,388,1559487600"; d="scan'208";a="24088303"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 15 Aug 2019 20:05:09 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id B1BF1417763E;
 Thu, 15 Aug 2019 20:05:04 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 4/9] drm/timings: Add link flags
Date: Thu, 15 Aug 2019 12:04:28 +0100
Message-Id: <1565867073-24746-5-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
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
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Simon Horman <horms@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgbmVlZCBtb3JlIGluZm9ybWF0aW9uIHRvIGRlc2NyaWJlIGR1YWwtTFZEUyBsaW5rcywgdGhl
cmVmb3JlCmludHJvZHVjZSBsaW5rX2ZsYWdzLgoKU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2Fz
dHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+CgotLS0KdjEtPnYyOgoqIG5ldyBw
YXRjaAoKIGluY2x1ZGUvZHJtL2RybV90aW1pbmdzLmggfCAyNiArKysrKysrKysrKysrKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9p
bmNsdWRlL2RybS9kcm1fdGltaW5ncy5oIGIvaW5jbHVkZS9kcm0vZHJtX3RpbWluZ3MuaAppbmRl
eCA0YWY4ODE0Li41OGZiZjFiIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fdGltaW5ncy5o
CisrKyBiL2luY2x1ZGUvZHJtL2RybV90aW1pbmdzLmgKQEAgLTEsNCArMSw2IEBACiAvKgorICog
Q29weXJpZ2h0IChDKSAyMDE5IFJlbmVzYXMgRWxlY3Ryb25pY3MgQ29ycG9yYXRpb24KKyAqCiAg
KiBQZXJtaXNzaW9uIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBkaXN0cmlidXRlLCBhbmQgc2VsbCB0
aGlzIHNvZnR3YXJlIGFuZCBpdHMKICAqIGRvY3VtZW50YXRpb24gZm9yIGFueSBwdXJwb3NlIGlz
IGhlcmVieSBncmFudGVkIHdpdGhvdXQgZmVlLCBwcm92aWRlZCB0aGF0CiAgKiB0aGUgYWJvdmUg
Y29weXJpZ2h0IG5vdGljZSBhcHBlYXIgaW4gYWxsIGNvcGllcyBhbmQgdGhhdCBib3RoIHRoYXQg
Y29weXJpZ2h0CkBAIC0yMSw2ICsyMywyNCBAQAogI2lmbmRlZiBfX0RSTV9USU1JTkdTX0hfXwog
I2RlZmluZSBfX0RSTV9USU1JTkdTX0hfXwogCisjaW5jbHVkZSA8bGludXgvYml0cy5oPgorCisv
KioKKyAqIGVudW0gZHJtX2xpbmtfZmxhZ3MgLSBsaW5rX2ZsYWdzIGZvciAmZHJtX3RpbWluZ3MK
KyAqCisgKiBUaGlzIGVudW0gZGVmaW5lcyB0aGUgZGV0YWlscyBvZiB0aGUgbGluay4KKyAqCisg
KiBARFJNX0xJTktfRFVBTF9MVkRTX09ERF9FVkVOOglEdWFsLUxWRFMgbGluaywgd2l0aCBvZGQg
cGl4ZWxzICgxLDMsNSwKKyAqCQkJCQlldGMuKSBjb21pbmcgdGhyb3VnaCB0aGUgZmlyc3QgcG9y
dCwgYW5kCisgKgkJCQkJZXZlbiBwaXhlbHMgKDAsMiw0LGV0Yy4pIGNvbWluZyB0aHJvdWdoCisg
KgkJCQkJdGhlIHNlY29uZCBwb3J0LiBJZiBub3Qgc3BlY2lmaWVkIGZvciBhCisgKgkJCQkJZHVh
bC1MVkRTIHBhbmVsLCBpdCBpcyBhc3N1bWVkIHRoYXQgZXZlbgorICoJCQkJCXBpeGVscyBhcmUg
Y29taW5nIHRocm91Z2ggdGhlIGZpcnN0IHBvcnQKKyAqLworZW51bSBkcm1fbGlua19mbGFncyB7
CisJRFJNX0xJTktfRFVBTF9MVkRTX09ERF9FVkVOID0gQklUKDApLAorfTsKKwogLyoqCiAgKiBz
dHJ1Y3QgZHJtX3RpbWluZ3MgLSB0aW1pbmcgaW5mb3JtYXRpb24KICAqLwpAQCAtNTUsNiArNzUs
MTIgQEAgc3RydWN0IGRybV90aW1pbmdzIHsKIAkgKiBhbmQgb2RkLW51bWJlcmVkIHBpeGVscyBh
cmUgcmVjZWl2ZWQgb24gc2VwYXJhdGUgbGlua3MuCiAJICovCiAJYm9vbCBkdWFsX2xpbms7CisJ
LyoqCisJICogQGxpbmtfZmxhZ3MKKwkgKgorCSAqIFByb3ZpZGVzIGRldGFpbGVkIGluZm9ybWF0
aW9uIGFib3V0IHRoZSBsaW5rLgorCSAqLworCWVudW0gZHJtX2xpbmtfZmxhZ3MgbGlua19mbGFn
czsKIH07CiAKICNlbmRpZiAvKiBfX0RSTV9USU1JTkdTX0hfXyAqLwotLSAKMi43LjQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
