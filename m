Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AEC65542
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 13:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42926E1B4;
	Thu, 11 Jul 2019 11:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94756E185;
 Thu, 11 Jul 2019 11:28:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 8792328B58A
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 04/23] drm: rockchip: Provide ddc symlink in inno_hdmi
 sysfs directory
Date: Thu, 11 Jul 2019 13:26:31 +0200
Message-Id: <5ce8b3cf60575b515368d9184e7fd7d4306eddc5.1562843413.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1562843413.git.andrzej.p@collabora.com>
References: <cover.1562843413.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1562843413.git.andrzej.p@collabora.com>
References: <cover.1562843413.git.andrzej.p@collabora.com>
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
 Maxime Ripard <maxime.ripard@bootlin.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>,
 intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Mamta Shukla <mamtashukla555@gmail.com>,
 linux-mediatek@lists.infradead.org, Jyri Sarha <jsarha@ti.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, amd-gfx@lists.freedesktop.org,
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9pbm5vX2hkbWkuYyB8IDE3ICsrKysr
KysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9pbm5vX2hkbWkuYyBi
L2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9pbm5vX2hkbWkuYwppbmRleCBmOGNhOThkMjk0ZDAu
LmQ2NGIxMTljMjY0OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2lubm9f
aGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9pbm5vX2hkbWkuYwpAQCAtNTks
NyArNTksNiBAQCBzdHJ1Y3QgaW5ub19oZG1pIHsKIAlzdHJ1Y3QgZHJtX2VuY29kZXIJZW5jb2Rl
cjsKIAogCXN0cnVjdCBpbm5vX2hkbWlfaTJjICppMmM7Ci0Jc3RydWN0IGkyY19hZGFwdGVyICpk
ZGM7CiAKIAl1bnNpZ25lZCBpbnQgdG1kc19yYXRlOwogCkBAIC01NTIsMTAgKzU1MSwxMCBAQCBz
dGF0aWMgaW50IGlubm9faGRtaV9jb25uZWN0b3JfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVj
dG9yICpjb25uZWN0b3IpCiAJc3RydWN0IGVkaWQgKmVkaWQ7CiAJaW50IHJldCA9IDA7CiAKLQlp
ZiAoIWhkbWktPmRkYykKKwlpZiAoIWhkbWktPmNvbm5lY3Rvci5kZGMpCiAJCXJldHVybiAwOwog
Ci0JZWRpZCA9IGRybV9nZXRfZWRpZChjb25uZWN0b3IsIGhkbWktPmRkYyk7CisJZWRpZCA9IGRy
bV9nZXRfZWRpZChjb25uZWN0b3IsIGhkbWktPmNvbm5lY3Rvci5kZGMpOwogCWlmIChlZGlkKSB7
CiAJCWhkbWktPmhkbWlfZGF0YS5zaW5rX2lzX2hkbWkgPSBkcm1fZGV0ZWN0X2hkbWlfbW9uaXRv
cihlZGlkKTsKIAkJaGRtaS0+aGRtaV9kYXRhLnNpbmtfaGFzX2F1ZGlvID0gZHJtX2RldGVjdF9t
b25pdG9yX2F1ZGlvKGVkaWQpOwpAQCAtODUwLDEwICs4NDksMTAgQEAgc3RhdGljIGludCBpbm5v
X2hkbWlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKIAog
CWlubm9faGRtaV9yZXNldChoZG1pKTsKIAotCWhkbWktPmRkYyA9IGlubm9faGRtaV9pMmNfYWRh
cHRlcihoZG1pKTsKLQlpZiAoSVNfRVJSKGhkbWktPmRkYykpIHsKLQkJcmV0ID0gUFRSX0VSUiho
ZG1pLT5kZGMpOwotCQloZG1pLT5kZGMgPSBOVUxMOworCWhkbWktPmNvbm5lY3Rvci5kZGMgPSBp
bm5vX2hkbWlfaTJjX2FkYXB0ZXIoaGRtaSk7CisJaWYgKElTX0VSUihoZG1pLT5jb25uZWN0b3Iu
ZGRjKSkgeworCQlyZXQgPSBQVFJfRVJSKGhkbWktPmNvbm5lY3Rvci5kZGMpOworCQloZG1pLT5j
b25uZWN0b3IuZGRjID0gTlVMTDsKIAkJZ290byBlcnJfZGlzYWJsZV9jbGs7CiAJfQogCkBAIC04
ODYsNyArODg1LDcgQEAgc3RhdGljIGludCBpbm5vX2hkbWlfYmluZChzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKIAloZG1pLT5jb25uZWN0b3IuZnVuY3MtPmRlc3Ry
b3koJmhkbWktPmNvbm5lY3Rvcik7CiAJaGRtaS0+ZW5jb2Rlci5mdW5jcy0+ZGVzdHJveSgmaGRt
aS0+ZW5jb2Rlcik7CiBlcnJfcHV0X2FkYXB0ZXI6Ci0JaTJjX3B1dF9hZGFwdGVyKGhkbWktPmRk
Yyk7CisJaTJjX3B1dF9hZGFwdGVyKGhkbWktPmNvbm5lY3Rvci5kZGMpOwogZXJyX2Rpc2FibGVf
Y2xrOgogCWNsa19kaXNhYmxlX3VucHJlcGFyZShoZG1pLT5wY2xrKTsKIAlyZXR1cm4gcmV0OwpA
QCAtOTAwLDcgKzg5OSw3IEBAIHN0YXRpYyB2b2lkIGlubm9faGRtaV91bmJpbmQoc3RydWN0IGRl
dmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsCiAJaGRtaS0+Y29ubmVjdG9yLmZ1bmNz
LT5kZXN0cm95KCZoZG1pLT5jb25uZWN0b3IpOwogCWhkbWktPmVuY29kZXIuZnVuY3MtPmRlc3Ry
b3koJmhkbWktPmVuY29kZXIpOwogCi0JaTJjX3B1dF9hZGFwdGVyKGhkbWktPmRkYyk7CisJaTJj
X3B1dF9hZGFwdGVyKGhkbWktPmNvbm5lY3Rvci5kZGMpOwogCWNsa19kaXNhYmxlX3VucHJlcGFy
ZShoZG1pLT5wY2xrKTsKIH0KIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
