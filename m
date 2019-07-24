Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06446730B6
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 16:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1DA6E577;
	Wed, 24 Jul 2019 14:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E9F6E56D;
 Wed, 24 Jul 2019 14:02:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id B0CAD263BB0
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 10/24] drm/imx: imx-ldb: Provide ddc symlink in connector's
 sysfs
Date: Wed, 24 Jul 2019 15:59:32 +0200
Message-Id: <8e79f715659cbf092e4a79631bdd940c9a036d14.1563960855.git.andrzej.p@collabora.com>
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Armijn Hemel <armijn@tjaldur.nl>, kernel@collabora.com,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
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
 linux-arm-kernel@lists.infradead.org, Enrico Weigelt <info@metux.net>,
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pbXgvaW14LWxkYi5jIHwgMjAgKysrKysrKysrKy0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW14L2lteC1sZGIuYyBiL2RyaXZlcnMv
Z3B1L2RybS9pbXgvaW14LWxkYi5jCmluZGV4IGRlNjJhNGNkNDgyNy4uOTQ5NDVkZDkzN2NjIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaW14L2lteC1sZGIuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vaW14L2lteC1sZGIuYwpAQCAtNTcsNyArNTcsNiBAQCBzdHJ1Y3QgaW14X2xkYl9jaGFu
bmVsIHsKIAlzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlOwogCiAJc3RydWN0IGRldmljZV9ub2Rl
ICpjaGlsZDsKLQlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRkYzsKIAlpbnQgY2hubzsKIAl2b2lkICpl
ZGlkOwogCWludCBlZGlkX2xlbjsKQEAgLTEzMyw4ICsxMzIsOCBAQCBzdGF0aWMgaW50IGlteF9s
ZGJfY29ubmVjdG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQog
CQkJcmV0dXJuIG51bV9tb2RlczsKIAl9CiAKLQlpZiAoIWlteF9sZGJfY2gtPmVkaWQgJiYgaW14
X2xkYl9jaC0+ZGRjKQotCQlpbXhfbGRiX2NoLT5lZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3Rv
ciwgaW14X2xkYl9jaC0+ZGRjKTsKKwlpZiAoIWlteF9sZGJfY2gtPmVkaWQgJiYgY29ubmVjdG9y
LT5kZGMpCisJCWlteF9sZGJfY2gtPmVkaWQgPSBkcm1fZ2V0X2VkaWQoY29ubmVjdG9yLCBjb25u
ZWN0b3ItPmRkYyk7CiAKIAlpZiAoaW14X2xkYl9jaC0+ZWRpZCkgewogCQlkcm1fY29ubmVjdG9y
X3VwZGF0ZV9lZGlkX3Byb3BlcnR5KGNvbm5lY3RvciwKQEAgLTQ2Miw5ICs0NjEsMTAgQEAgc3Rh
dGljIGludCBpbXhfbGRiX3JlZ2lzdGVyKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sCiAJCSAqLwog
CQlkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQoJmlteF9sZGJfY2gtPmNvbm5lY3RvciwKIAkJCQkm
aW14X2xkYl9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKLQkJZHJtX2Nvbm5lY3Rvcl9pbml0KGRy
bSwgJmlteF9sZGJfY2gtPmNvbm5lY3RvciwKLQkJCQkmaW14X2xkYl9jb25uZWN0b3JfZnVuY3Ms
Ci0JCQkJRFJNX01PREVfQ09OTkVDVE9SX0xWRFMpOworCQlkcm1fY29ubmVjdG9yX2luaXRfd2l0
aF9kZGMoZHJtLCAmaW14X2xkYl9jaC0+Y29ubmVjdG9yLAorCQkJCQkgICAgJmlteF9sZGJfY29u
bmVjdG9yX2Z1bmNzLAorCQkJCQkgICAgRFJNX01PREVfQ09OTkVDVE9SX0xWRFMsCisJCQkJCSAg
ICBpbXhfbGRiX2NoLT5jb25uZWN0b3IuZGRjKTsKIAkJZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfZW5j
b2RlcigmaW14X2xkYl9jaC0+Y29ubmVjdG9yLCBlbmNvZGVyKTsKIAl9CiAKQEAgLTU1MiwxNSAr
NTUyLDE1IEBAIHN0YXRpYyBpbnQgaW14X2xkYl9wYW5lbF9kZGMoc3RydWN0IGRldmljZSAqZGV2
LAogCiAJZGRjX25vZGUgPSBvZl9wYXJzZV9waGFuZGxlKGNoaWxkLCAiZGRjLWkyYy1idXMiLCAw
KTsKIAlpZiAoZGRjX25vZGUpIHsKLQkJY2hhbm5lbC0+ZGRjID0gb2ZfZmluZF9pMmNfYWRhcHRl
cl9ieV9ub2RlKGRkY19ub2RlKTsKKwkJY2hhbm5lbC0+Y29ubmVjdG9yLmRkYyA9IG9mX2ZpbmRf
aTJjX2FkYXB0ZXJfYnlfbm9kZShkZGNfbm9kZSk7CiAJCW9mX25vZGVfcHV0KGRkY19ub2RlKTsK
LQkJaWYgKCFjaGFubmVsLT5kZGMpIHsKKwkJaWYgKCFjaGFubmVsLT5jb25uZWN0b3IuZGRjKSB7
CiAJCQlkZXZfd2FybihkZXYsICJmYWlsZWQgdG8gZ2V0IGRkYyBpMmMgYWRhcHRlclxuIik7CiAJ
CQlyZXR1cm4gLUVQUk9CRV9ERUZFUjsKIAkJfQogCX0KIAotCWlmICghY2hhbm5lbC0+ZGRjKSB7
CisJaWYgKCFjaGFubmVsLT5jb25uZWN0b3IuZGRjKSB7CiAJCS8qIGlmIG5vIEREQyBhdmFpbGFi
bGUsIGZhbGxiYWNrIHRvIGhhcmRjb2RlZCBFRElEICovCiAJCWRldl9kYmcoZGV2LCAibm8gZGRj
IGF2YWlsYWJsZVxuIik7CiAKQEAgLTcyNyw3ICs3MjcsNyBAQCBzdGF0aWMgdm9pZCBpbXhfbGRi
X3VuYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKIAkJCWRy
bV9wYW5lbF9kZXRhY2goY2hhbm5lbC0+cGFuZWwpOwogCiAJCWtmcmVlKGNoYW5uZWwtPmVkaWQp
OwotCQlpMmNfcHV0X2FkYXB0ZXIoY2hhbm5lbC0+ZGRjKTsKKwkJaTJjX3B1dF9hZGFwdGVyKGNo
YW5uZWwtPmNvbm5lY3Rvci5kZGMpOwogCX0KIH0KIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
