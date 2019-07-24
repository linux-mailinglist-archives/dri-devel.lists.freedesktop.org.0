Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 330E57308E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 16:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2816E566;
	Wed, 24 Jul 2019 14:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1C86E558;
 Wed, 24 Jul 2019 14:01:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 024AB263B01
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 05/24] drm: rockchip: Provide ddc symlink in inno_hdmi
 sysfs directory
Date: Wed, 24 Jul 2019 15:59:27 +0200
Message-Id: <401193c0294a42adf30724058a41340fc537a98f.1563960855.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1563960855.git.andrzej.p@collabora.com>
References: <cover.1563960855.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1563960855.git.andrzej.p@collabora.com>
References: <cover.1563960855.git.andrzej.p@collabora.com>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Alexios Zavras <alexios.zavras@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9pbm5vX2hkbWkuYyB8IDIzICsrKysr
KysrKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTEg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2lubm9f
aGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2lubm9faGRtaS5jCmluZGV4IGVkMzQ0
YTc5NWI0ZC4uMGY3ZWQ2NjQ2MDBmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2No
aXAvaW5ub19oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2lubm9faGRtaS5j
CkBAIC01OCw3ICs1OCw2IEBAIHN0cnVjdCBpbm5vX2hkbWkgewogCXN0cnVjdCBkcm1fZW5jb2Rl
cgllbmNvZGVyOwogCiAJc3RydWN0IGlubm9faGRtaV9pMmMgKmkyYzsKLQlzdHJ1Y3QgaTJjX2Fk
YXB0ZXIgKmRkYzsKIAogCXVuc2lnbmVkIGludCB0bWRzX3JhdGU7CiAKQEAgLTU1MSwxMCArNTUw
LDEwIEBAIHN0YXRpYyBpbnQgaW5ub19oZG1pX2Nvbm5lY3Rvcl9nZXRfbW9kZXMoc3RydWN0IGRy
bV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIAlzdHJ1Y3QgZWRpZCAqZWRpZDsKIAlpbnQgcmV0ID0g
MDsKIAotCWlmICghaGRtaS0+ZGRjKQorCWlmICghaGRtaS0+Y29ubmVjdG9yLmRkYykKIAkJcmV0
dXJuIDA7CiAKLQllZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3RvciwgaGRtaS0+ZGRjKTsKKwll
ZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3RvciwgaGRtaS0+Y29ubmVjdG9yLmRkYyk7CiAJaWYg
KGVkaWQpIHsKIAkJaGRtaS0+aGRtaV9kYXRhLnNpbmtfaXNfaGRtaSA9IGRybV9kZXRlY3RfaGRt
aV9tb25pdG9yKGVkaWQpOwogCQloZG1pLT5oZG1pX2RhdGEuc2lua19oYXNfYXVkaW8gPSBkcm1f
ZGV0ZWN0X21vbml0b3JfYXVkaW8oZWRpZCk7CkBAIC02MjQsOCArNjIzLDEwIEBAIHN0YXRpYyBp
bnQgaW5ub19oZG1pX3JlZ2lzdGVyKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHN0cnVjdCBpbm5v
X2hkbWkgKmhkbWkpCiAKIAlkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQoJmhkbWktPmNvbm5lY3Rv
ciwKIAkJCQkgJmlubm9faGRtaV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKLQlkcm1fY29ubmVj
dG9yX2luaXQoZHJtLCAmaGRtaS0+Y29ubmVjdG9yLCAmaW5ub19oZG1pX2Nvbm5lY3Rvcl9mdW5j
cywKLQkJCSAgIERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQSk7CisJZHJtX2Nvbm5lY3Rvcl9pbml0
X3dpdGhfZGRjKGRybSwgJmhkbWktPmNvbm5lY3RvciwKKwkJCQkgICAgJmlubm9faGRtaV9jb25u
ZWN0b3JfZnVuY3MsCisJCQkJICAgIERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQSwKKwkJCQkgICAg
aGRtaS0+Y29ubmVjdG9yLmRkYyk7CiAKIAlkcm1fY29ubmVjdG9yX2F0dGFjaF9lbmNvZGVyKCZo
ZG1pLT5jb25uZWN0b3IsIGVuY29kZXIpOwogCkBAIC04NDksMTAgKzg1MCwxMCBAQCBzdGF0aWMg
aW50IGlubm9faGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFz
dGVyLAogCiAJaW5ub19oZG1pX3Jlc2V0KGhkbWkpOwogCi0JaGRtaS0+ZGRjID0gaW5ub19oZG1p
X2kyY19hZGFwdGVyKGhkbWkpOwotCWlmIChJU19FUlIoaGRtaS0+ZGRjKSkgewotCQlyZXQgPSBQ
VFJfRVJSKGhkbWktPmRkYyk7Ci0JCWhkbWktPmRkYyA9IE5VTEw7CisJaGRtaS0+Y29ubmVjdG9y
LmRkYyA9IGlubm9faGRtaV9pMmNfYWRhcHRlcihoZG1pKTsKKwlpZiAoSVNfRVJSKGhkbWktPmNv
bm5lY3Rvci5kZGMpKSB7CisJCXJldCA9IFBUUl9FUlIoaGRtaS0+Y29ubmVjdG9yLmRkYyk7CisJ
CWhkbWktPmNvbm5lY3Rvci5kZGMgPSBOVUxMOwogCQlnb3RvIGVycl9kaXNhYmxlX2NsazsKIAl9
CiAKQEAgLTg4NSw3ICs4ODYsNyBAQCBzdGF0aWMgaW50IGlubm9faGRtaV9iaW5kKHN0cnVjdCBk
ZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAogCWhkbWktPmNvbm5lY3Rvci5mdW5j
cy0+ZGVzdHJveSgmaGRtaS0+Y29ubmVjdG9yKTsKIAloZG1pLT5lbmNvZGVyLmZ1bmNzLT5kZXN0
cm95KCZoZG1pLT5lbmNvZGVyKTsKIGVycl9wdXRfYWRhcHRlcjoKLQlpMmNfcHV0X2FkYXB0ZXIo
aGRtaS0+ZGRjKTsKKwlpMmNfcHV0X2FkYXB0ZXIoaGRtaS0+Y29ubmVjdG9yLmRkYyk7CiBlcnJf
ZGlzYWJsZV9jbGs6CiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGhkbWktPnBjbGspOwogCXJldHVy
biByZXQ7CkBAIC04OTksNyArOTAwLDcgQEAgc3RhdGljIHZvaWQgaW5ub19oZG1pX3VuYmluZChz
dHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKIAloZG1pLT5jb25uZWN0
b3IuZnVuY3MtPmRlc3Ryb3koJmhkbWktPmNvbm5lY3Rvcik7CiAJaGRtaS0+ZW5jb2Rlci5mdW5j
cy0+ZGVzdHJveSgmaGRtaS0+ZW5jb2Rlcik7CiAKLQlpMmNfcHV0X2FkYXB0ZXIoaGRtaS0+ZGRj
KTsKKwlpMmNfcHV0X2FkYXB0ZXIoaGRtaS0+Y29ubmVjdG9yLmRkYyk7CiAJY2xrX2Rpc2FibGVf
dW5wcmVwYXJlKGhkbWktPnBjbGspOwogfQogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
