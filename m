Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 553627308A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 16:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD136E55E;
	Wed, 24 Jul 2019 14:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9ADD6E554;
 Wed, 24 Jul 2019 14:01:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 1B970261114
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 04/24] drm: rockchip: Provide ddc symlink in rk3066_hdmi
 sysfs directory
Date: Wed, 24 Jul 2019 15:59:26 +0200
Message-Id: <a70ea570e0d560d3d90aa85e3934382b3c5f3b6a.1563960855.git.andrzej.p@collabora.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yazMwNjZfaGRtaS5jIHwgMjQgKysr
KysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwg
MTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3Jr
MzA2Nl9oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcmszMDY2X2hkbWkuYwppbmRl
eCA4NWZjNWYwMWY3NjEuLjA2NTExMjk2Y2VhYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3JvY2tjaGlwL3JrMzA2Nl9oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3Jr
MzA2Nl9oZG1pLmMKQEAgLTQ5LDcgKzQ5LDYgQEAgc3RydWN0IHJrMzA2Nl9oZG1pIHsKIAlzdHJ1
Y3QgZHJtX2VuY29kZXIgZW5jb2RlcjsKIAogCXN0cnVjdCByazMwNjZfaGRtaV9pMmMgKmkyYzsK
LQlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRkYzsKIAogCXVuc2lnbmVkIGludCB0bWRzY2xrOwogCkBA
IC00NzAsMTAgKzQ2OSwxMCBAQCBzdGF0aWMgaW50IHJrMzA2Nl9oZG1pX2Nvbm5lY3Rvcl9nZXRf
bW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIAlzdHJ1Y3QgZWRpZCAqZWRp
ZDsKIAlpbnQgcmV0ID0gMDsKIAotCWlmICghaGRtaS0+ZGRjKQorCWlmICghY29ubmVjdG9yLT5k
ZGMpCiAJCXJldHVybiAwOwogCi0JZWRpZCA9IGRybV9nZXRfZWRpZChjb25uZWN0b3IsIGhkbWkt
PmRkYyk7CisJZWRpZCA9IGRybV9nZXRfZWRpZChjb25uZWN0b3IsIGNvbm5lY3Rvci0+ZGRjKTsK
IAlpZiAoZWRpZCkgewogCQloZG1pLT5oZG1pX2RhdGEuc2lua19pc19oZG1pID0gZHJtX2RldGVj
dF9oZG1pX21vbml0b3IoZWRpZCk7CiAJCWRybV9jb25uZWN0b3JfdXBkYXRlX2VkaWRfcHJvcGVy
dHkoY29ubmVjdG9yLCBlZGlkKTsKQEAgLTU2NCw5ICs1NjMsMTAgQEAgcmszMDY2X2hkbWlfcmVn
aXN0ZXIoc3RydWN0IGRybV9kZXZpY2UgKmRybSwgc3RydWN0IHJrMzA2Nl9oZG1pICpoZG1pKQog
CiAJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZoZG1pLT5jb25uZWN0b3IsCiAJCQkJICZyazMw
NjZfaGRtaV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKLQlkcm1fY29ubmVjdG9yX2luaXQoZHJt
LCAmaGRtaS0+Y29ubmVjdG9yLAotCQkJICAgJnJrMzA2Nl9oZG1pX2Nvbm5lY3Rvcl9mdW5jcywK
LQkJCSAgIERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQSk7CisJZHJtX2Nvbm5lY3Rvcl9pbml0X3dp
dGhfZGRjKGRybSwgJmhkbWktPmNvbm5lY3RvciwKKwkJCQkgICAgJnJrMzA2Nl9oZG1pX2Nvbm5l
Y3Rvcl9mdW5jcywKKwkJCQkgICAgRFJNX01PREVfQ09OTkVDVE9SX0hETUlBLAorCQkJCSAgICBo
ZG1pLT5jb25uZWN0b3IuZGRjKTsKIAogCWRybV9jb25uZWN0b3JfYXR0YWNoX2VuY29kZXIoJmhk
bWktPmNvbm5lY3RvciwgZW5jb2Rlcik7CiAKQEAgLTc4OSwxMCArNzg5LDEwIEBAIHN0YXRpYyBp
bnQgcmszMDY2X2hkbWlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1h
c3RlciwKIAkvKiBpbnRlcm5hbCBoY2xrID0gaGRtaV9oY2xrIC8gMjUgKi8KIAloZG1pX3dyaXRl
YihoZG1pLCBIRE1JX0lOVEVSTkFMX0NMS19ESVZJREVSLCAyNSk7CiAKLQloZG1pLT5kZGMgPSBy
azMwNjZfaGRtaV9pMmNfYWRhcHRlcihoZG1pKTsKLQlpZiAoSVNfRVJSKGhkbWktPmRkYykpIHsK
LQkJcmV0ID0gUFRSX0VSUihoZG1pLT5kZGMpOwotCQloZG1pLT5kZGMgPSBOVUxMOworCWhkbWkt
PmNvbm5lY3Rvci5kZGMgPSByazMwNjZfaGRtaV9pMmNfYWRhcHRlcihoZG1pKTsKKwlpZiAoSVNf
RVJSKGhkbWktPmNvbm5lY3Rvci5kZGMpKSB7CisJCXJldCA9IFBUUl9FUlIoaGRtaS0+Y29ubmVj
dG9yLmRkYyk7CisJCWhkbWktPmNvbm5lY3Rvci5kZGMgPSBOVUxMOwogCQlnb3RvIGVycl9kaXNh
YmxlX2hjbGs7CiAJfQogCkBAIC04MjQsNyArODI0LDcgQEAgc3RhdGljIGludCByazMwNjZfaGRt
aV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAogCWhkbWkt
PmNvbm5lY3Rvci5mdW5jcy0+ZGVzdHJveSgmaGRtaS0+Y29ubmVjdG9yKTsKIAloZG1pLT5lbmNv
ZGVyLmZ1bmNzLT5kZXN0cm95KCZoZG1pLT5lbmNvZGVyKTsKIGVycl9kaXNhYmxlX2kyYzoKLQlp
MmNfcHV0X2FkYXB0ZXIoaGRtaS0+ZGRjKTsKKwlpMmNfcHV0X2FkYXB0ZXIoaGRtaS0+Y29ubmVj
dG9yLmRkYyk7CiBlcnJfZGlzYWJsZV9oY2xrOgogCWNsa19kaXNhYmxlX3VucHJlcGFyZShoZG1p
LT5oY2xrKTsKIApAQCAtODM5LDcgKzgzOSw3IEBAIHN0YXRpYyB2b2lkIHJrMzA2Nl9oZG1pX3Vu
YmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKIAloZG1pLT5j
b25uZWN0b3IuZnVuY3MtPmRlc3Ryb3koJmhkbWktPmNvbm5lY3Rvcik7CiAJaGRtaS0+ZW5jb2Rl
ci5mdW5jcy0+ZGVzdHJveSgmaGRtaS0+ZW5jb2Rlcik7CiAKLQlpMmNfcHV0X2FkYXB0ZXIoaGRt
aS0+ZGRjKTsKKwlpMmNfcHV0X2FkYXB0ZXIoaGRtaS0+Y29ubmVjdG9yLmRkYyk7CiAJY2xrX2Rp
c2FibGVfdW5wcmVwYXJlKGhkbWktPmhjbGspOwogfQogCi0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
