Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3F477001
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 19:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B76B6EDF1;
	Fri, 26 Jul 2019 17:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13E46EDF5;
 Fri, 26 Jul 2019 17:26:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 8C17D28C551
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 12/24] drm/vc4: Provide ddc symlink in connector sysfs
 directory
Date: Fri, 26 Jul 2019 19:23:06 +0200
Message-Id: <7ae097437b118fdd6bafc3f561b000952c873c7c.1564161140.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1564161140.git.andrzej.p@collabora.com>
References: <cover.1564161140.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1564161140.git.andrzej.p@collabora.com>
References: <cover.1564161140.git.andrzej.p@collabora.com>
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
Cc: amd-gfx@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 linux-samsung-soc@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>,
 intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Alexios Zavras <alexios.zavras@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYyB8IDEyICsrKysrKysrLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0v
dmM0L3ZjNF9oZG1pLmMKaW5kZXggZWU3ZDRlN2IwZWUzLi5lYjU3YzkwN2EyNTYgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
dmM0L3ZjNF9oZG1pLmMKQEAgLTI2Nyw3ICsyNjcsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRy
bV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzIHZjNF9oZG1pX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3Mg
PQogfTsKIAogc3RhdGljIHN0cnVjdCBkcm1fY29ubmVjdG9yICp2YzRfaGRtaV9jb25uZWN0b3Jf
aW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAotCQkJCQkJICAgICBzdHJ1Y3QgZHJtX2VuY29k
ZXIgKmVuY29kZXIpCisJCQkJCQkgICAgIHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwKKwkJ
CQkJCSAgICAgc3RydWN0IGkyY19hZGFwdGVyICpkZGMpCiB7CiAJc3RydWN0IGRybV9jb25uZWN0
b3IgKmNvbm5lY3RvcjsKIAlzdHJ1Y3QgdmM0X2hkbWlfY29ubmVjdG9yICpoZG1pX2Nvbm5lY3Rv
cjsKQEAgLTI4MSw4ICsyODIsMTAgQEAgc3RhdGljIHN0cnVjdCBkcm1fY29ubmVjdG9yICp2YzRf
aGRtaV9jb25uZWN0b3JfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCiAJaGRtaV9jb25u
ZWN0b3ItPmVuY29kZXIgPSBlbmNvZGVyOwogCi0JZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgY29u
bmVjdG9yLCAmdmM0X2hkbWlfY29ubmVjdG9yX2Z1bmNzLAotCQkJICAgRFJNX01PREVfQ09OTkVD
VE9SX0hETUlBKTsKKwlkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMoZGV2LCBjb25uZWN0b3Is
CisJCQkJICAgICZ2YzRfaGRtaV9jb25uZWN0b3JfZnVuY3MsCisJCQkJICAgIERSTV9NT0RFX0NP
Tk5FQ1RPUl9IRE1JQSwKKwkJCQkgICAgZGRjKTsKIAlkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQo
Y29ubmVjdG9yLCAmdmM0X2hkbWlfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7CiAKIAkvKiBDcmVh
dGUgYW5kIGF0dGFjaCBUViBtYXJnaW4gcHJvcHMgdG8gdGhpcyBjb25uZWN0b3IuICovCkBAIC0x
Mzk1LDcgKzEzOTgsOCBAQCBzdGF0aWMgaW50IHZjNF9oZG1pX2JpbmQoc3RydWN0IGRldmljZSAq
ZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsIHZvaWQgKmRhdGEpCiAJCQkgRFJNX01PREVfRU5D
T0RFUl9UTURTLCBOVUxMKTsKIAlkcm1fZW5jb2Rlcl9oZWxwZXJfYWRkKGhkbWktPmVuY29kZXIs
ICZ2YzRfaGRtaV9lbmNvZGVyX2hlbHBlcl9mdW5jcyk7CiAKLQloZG1pLT5jb25uZWN0b3IgPSB2
YzRfaGRtaV9jb25uZWN0b3JfaW5pdChkcm0sIGhkbWktPmVuY29kZXIpOworCWhkbWktPmNvbm5l
Y3RvciA9CisJCXZjNF9oZG1pX2Nvbm5lY3Rvcl9pbml0KGRybSwgaGRtaS0+ZW5jb2RlciwgaGRt
aS0+ZGRjKTsKIAlpZiAoSVNfRVJSKGhkbWktPmNvbm5lY3RvcikpIHsKIAkJcmV0ID0gUFRSX0VS
UihoZG1pLT5jb25uZWN0b3IpOwogCQlnb3RvIGVycl9kZXN0cm95X2VuY29kZXI7Ci0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
