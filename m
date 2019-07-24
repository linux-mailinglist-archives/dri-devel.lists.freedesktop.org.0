Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7877730C2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 16:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399816E581;
	Wed, 24 Jul 2019 14:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15326E570;
 Wed, 24 Jul 2019 14:03:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id F090726D598
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 12/24] drm/vc4: Provide ddc symlink in connector sysfs
 directory
Date: Wed, 24 Jul 2019 15:59:34 +0200
Message-Id: <1d5528427c33b586dcf7f5e921fc2aafc3a40806.1563960855.git.andrzej.p@collabora.com>
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
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYyB8IDI2ICsrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jCmluZGV4IGVlN2Q0ZTdiMGVlMy4uNjcxMDE4
YzllY2M5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jCkBAIC03Niw3ICs3Niw2IEBAIHN0cnVjdCB2
YzRfaGRtaSB7CiAKIAlzdHJ1Y3QgdmM0X2hkbWlfYXVkaW8gYXVkaW87CiAKLQlzdHJ1Y3QgaTJj
X2FkYXB0ZXIgKmRkYzsKIAl2b2lkIF9faW9tZW0gKmhkbWljb3JlX3JlZ3M7CiAJdm9pZCBfX2lv
bWVtICpoZF9yZWdzOwogCWludCBocGRfZ3BpbzsKQEAgLTIwNyw3ICsyMDYsNyBAQCB2YzRfaGRt
aV9jb25uZWN0b3JfZGV0ZWN0KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIGJvb2wg
Zm9yY2UpCiAJCXJldHVybiBjb25uZWN0b3Jfc3RhdHVzX2Rpc2Nvbm5lY3RlZDsKIAl9CiAKLQlp
ZiAoZHJtX3Byb2JlX2RkYyh2YzQtPmhkbWktPmRkYykpCisJaWYgKGRybV9wcm9iZV9kZGMoY29u
bmVjdG9yLT5kZGMpKQogCQlyZXR1cm4gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQ7CiAKIAlp
ZiAoSERNSV9SRUFEKFZDNF9IRE1JX0hPVFBMVUcpICYgVkM0X0hETUlfSE9UUExVR19DT05ORUNU
RUQpCkBAIC0yMzMsNyArMjMyLDcgQEAgc3RhdGljIGludCB2YzRfaGRtaV9jb25uZWN0b3JfZ2V0
X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiAJaW50IHJldCA9IDA7CiAJ
c3RydWN0IGVkaWQgKmVkaWQ7CiAKLQllZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3RvciwgdmM0
LT5oZG1pLT5kZGMpOworCWVkaWQgPSBkcm1fZ2V0X2VkaWQoY29ubmVjdG9yLCBjb25uZWN0b3It
PmRkYyk7CiAJY2VjX3NfcGh5c19hZGRyX2Zyb21fZWRpZCh2YzQtPmhkbWktPmNlY19hZGFwLCBl
ZGlkKTsKIAlpZiAoIWVkaWQpCiAJCXJldHVybiAtRU5PREVWOwpAQCAtMjY3LDcgKzI2Niw4IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MgdmM0X2hkbWlf
Y29ubmVjdG9yX2hlbHBlcl9mdW5jcyA9CiB9OwogCiBzdGF0aWMgc3RydWN0IGRybV9jb25uZWN0
b3IgKnZjNF9oZG1pX2Nvbm5lY3Rvcl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCi0JCQkJ
CQkgICAgIHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKKwkJCQkJCSAgICAgc3RydWN0IGRy
bV9lbmNvZGVyICplbmNvZGVyLAorCQkJCQkJICAgICBzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRkYykK
IHsKIAlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yOwogCXN0cnVjdCB2YzRfaGRtaV9j
b25uZWN0b3IgKmhkbWlfY29ubmVjdG9yOwpAQCAtMjgxLDggKzI4MSwxMCBAQCBzdGF0aWMgc3Ry
dWN0IGRybV9jb25uZWN0b3IgKnZjNF9oZG1pX2Nvbm5lY3Rvcl9pbml0KHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsCiAKIAloZG1pX2Nvbm5lY3Rvci0+ZW5jb2RlciA9IGVuY29kZXI7CiAKLQlkcm1f
Y29ubmVjdG9yX2luaXQoZGV2LCBjb25uZWN0b3IsICZ2YzRfaGRtaV9jb25uZWN0b3JfZnVuY3Ms
Ci0JCQkgICBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEpOworCWRybV9jb25uZWN0b3JfaW5pdF93
aXRoX2RkYyhkZXYsIGNvbm5lY3RvciwKKwkJCQkgICAgJnZjNF9oZG1pX2Nvbm5lY3Rvcl9mdW5j
cywKKwkJCQkgICAgRFJNX01PREVfQ09OTkVDVE9SX0hETUlBLAorCQkJCSAgICBkZGMpOwogCWRy
bV9jb25uZWN0b3JfaGVscGVyX2FkZChjb25uZWN0b3IsICZ2YzRfaGRtaV9jb25uZWN0b3JfaGVs
cGVyX2Z1bmNzKTsKIAogCS8qIENyZWF0ZSBhbmQgYXR0YWNoIFRWIG1hcmdpbiBwcm9wcyB0byB0
aGlzIGNvbm5lY3Rvci4gKi8KQEAgLTEyOTEsNiArMTI5Myw3IEBAIHN0YXRpYyBpbnQgdmM0X2hk
bWlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAq
ZGF0YSkKIAlzdHJ1Y3QgdmM0X2hkbWkgKmhkbWk7CiAJc3RydWN0IHZjNF9oZG1pX2VuY29kZXIg
KnZjNF9oZG1pX2VuY29kZXI7CiAJc3RydWN0IGRldmljZV9ub2RlICpkZGNfbm9kZTsKKwlzdHJ1
Y3QgaTJjX2FkYXB0ZXIgKmRkYzsKIAl1MzIgdmFsdWU7CiAJaW50IHJldDsKIApAQCAtMTMzOCw5
ICsxMzQxLDkgQEAgc3RhdGljIGludCB2YzRfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKQogCQlyZXR1cm4gLUVOT0RFVjsKIAl9
CiAKLQloZG1pLT5kZGMgPSBvZl9maW5kX2kyY19hZGFwdGVyX2J5X25vZGUoZGRjX25vZGUpOwor
CWRkYyA9IG9mX2ZpbmRfaTJjX2FkYXB0ZXJfYnlfbm9kZShkZGNfbm9kZSk7CiAJb2Zfbm9kZV9w
dXQoZGRjX25vZGUpOwotCWlmICghaGRtaS0+ZGRjKSB7CisJaWYgKGRkYykgewogCQlEUk1fREVC
VUcoIkZhaWxlZCB0byBnZXQgZGRjIGkyYyBhZGFwdGVyIGJ5IG5vZGVcbiIpOwogCQlyZXR1cm4g
LUVQUk9CRV9ERUZFUjsKIAl9CkBAIC0xMzk1LDcgKzEzOTgsNyBAQCBzdGF0aWMgaW50IHZjNF9o
ZG1pX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsIHZvaWQg
KmRhdGEpCiAJCQkgRFJNX01PREVfRU5DT0RFUl9UTURTLCBOVUxMKTsKIAlkcm1fZW5jb2Rlcl9o
ZWxwZXJfYWRkKGhkbWktPmVuY29kZXIsICZ2YzRfaGRtaV9lbmNvZGVyX2hlbHBlcl9mdW5jcyk7
CiAKLQloZG1pLT5jb25uZWN0b3IgPSB2YzRfaGRtaV9jb25uZWN0b3JfaW5pdChkcm0sIGhkbWkt
PmVuY29kZXIpOworCWhkbWktPmNvbm5lY3RvciA9IHZjNF9oZG1pX2Nvbm5lY3Rvcl9pbml0KGRy
bSwgaGRtaS0+ZW5jb2RlciwgZGRjKTsKIAlpZiAoSVNfRVJSKGhkbWktPmNvbm5lY3RvcikpIHsK
IAkJcmV0ID0gUFRSX0VSUihoZG1pLT5jb25uZWN0b3IpOwogCQlnb3RvIGVycl9kZXN0cm95X2Vu
Y29kZXI7CkBAIC0xNDUyLDcgKzE0NTUsNyBAQCBzdGF0aWMgaW50IHZjNF9oZG1pX2JpbmQoc3Ry
dWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsIHZvaWQgKmRhdGEpCiAJY2xr
X2Rpc2FibGVfdW5wcmVwYXJlKGhkbWktPmhzbV9jbG9jayk7CiAJcG1fcnVudGltZV9kaXNhYmxl
KGRldik7CiBlcnJfcHV0X2kyYzoKLQlwdXRfZGV2aWNlKCZoZG1pLT5kZGMtPmRldik7CisJcHV0
X2RldmljZSgmZGRjLT5kZXYpOwogCiAJcmV0dXJuIHJldDsKIH0KQEAgLTE0NjMsNiArMTQ2Niw3
IEBAIHN0YXRpYyB2b2lkIHZjNF9oZG1pX3VuYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVj
dCBkZXZpY2UgKm1hc3RlciwKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtID0gZGV2X2dldF9kcnZk
YXRhKG1hc3Rlcik7CiAJc3RydWN0IHZjNF9kZXYgKnZjNCA9IGRybS0+ZGV2X3ByaXZhdGU7CiAJ
c3RydWN0IHZjNF9oZG1pICpoZG1pID0gdmM0LT5oZG1pOworCXN0cnVjdCBpMmNfYWRhcHRlciAq
ZGRjID0gaGRtaS0+Y29ubmVjdG9yLT5kZGM7CiAKIAljZWNfdW5yZWdpc3Rlcl9hZGFwdGVyKGhk
bWktPmNlY19hZGFwKTsKIAl2YzRfaGRtaV9jb25uZWN0b3JfZGVzdHJveShoZG1pLT5jb25uZWN0
b3IpOwpAQCAtMTQ3MSw3ICsxNDc1LDcgQEAgc3RhdGljIHZvaWQgdmM0X2hkbWlfdW5iaW5kKHN0
cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAogCWNsa19kaXNhYmxlX3Vu
cHJlcGFyZShoZG1pLT5oc21fY2xvY2spOwogCXBtX3J1bnRpbWVfZGlzYWJsZShkZXYpOwogCi0J
cHV0X2RldmljZSgmaGRtaS0+ZGRjLT5kZXYpOworCXB1dF9kZXZpY2UoJmRkYy0+ZGV2KTsKIAog
CXZjNC0+aGRtaSA9IE5VTEw7CiB9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
