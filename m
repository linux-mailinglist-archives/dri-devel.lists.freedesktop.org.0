Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A116730F3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 16:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086626E570;
	Wed, 24 Jul 2019 14:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADBC6E570;
 Wed, 24 Jul 2019 14:05:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 0973527FB86
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 19/24] drm/bridge: dumb-vga-dac: Provide ddc symlink in
 connector sysfs directory
Date: Wed, 24 Jul 2019 15:59:41 +0200
Message-Id: <c8a09ecf0a72f2c5eb7141e291604ac2f398c436.1563960855.git.andrzej.p@collabora.com>
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
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Douglas Anderson <dianders@chromium.org>,
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvZHVtYi12Z2EtZGFjLmMgfCAyNSArKysr
KysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwg
MTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9kdW1i
LXZnYS1kYWMuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvZHVtYi12Z2EtZGFjLmMKaW5kZXgg
ZDMyODg1YjkwNmFlLi5lYzA0NDAyZWNhMzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvZHVtYi12Z2EtZGFjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9kdW1iLXZn
YS1kYWMuYwpAQCAtMjAsNyArMjAsNiBAQCBzdHJ1Y3QgZHVtYl92Z2EgewogCXN0cnVjdCBkcm1f
YnJpZGdlCWJyaWRnZTsKIAlzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcgljb25uZWN0b3I7CiAKLQlzdHJ1
Y3QgaTJjX2FkYXB0ZXIJKmRkYzsKIAlzdHJ1Y3QgcmVndWxhdG9yCSp2ZGQ7CiB9OwogCkBAIC00
MiwxMCArNDEsMTAgQEAgc3RhdGljIGludCBkdW1iX3ZnYV9nZXRfbW9kZXMoc3RydWN0IGRybV9j
b25uZWN0b3IgKmNvbm5lY3RvcikKIAlzdHJ1Y3QgZWRpZCAqZWRpZDsKIAlpbnQgcmV0OwogCi0J
aWYgKElTX0VSUih2Z2EtPmRkYykpCisJaWYgKElTX0VSUih2Z2EtPmNvbm5lY3Rvci5kZGMpKQog
CQlnb3RvIGZhbGxiYWNrOwogCi0JZWRpZCA9IGRybV9nZXRfZWRpZChjb25uZWN0b3IsIHZnYS0+
ZGRjKTsKKwllZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3RvciwgdmdhLT5jb25uZWN0b3IuZGRj
KTsKIAlpZiAoIWVkaWQpIHsKIAkJRFJNX0lORk8oIkVESUQgcmVhZG91dCBmYWlsZWQsIGZhbGxp
bmcgYmFjayB0byBzdGFuZGFyZCBtb2Rlc1xuIik7CiAJCWdvdG8gZmFsbGJhY2s7CkBAIC04NCw3
ICs4Myw3IEBAIGR1bWJfdmdhX2Nvbm5lY3Rvcl9kZXRlY3Qoc3RydWN0IGRybV9jb25uZWN0b3Ig
KmNvbm5lY3RvciwgYm9vbCBmb3JjZSkKIAkgKiB3aXJlIHRoZSBEREMgcGlucywgb3IgdGhlIEky
QyBidXMgbWlnaHQgbm90IGJlIHdvcmtpbmcgYXQKIAkgKiBhbGwuCiAJICovCi0JaWYgKCFJU19F
UlIodmdhLT5kZGMpICYmIGRybV9wcm9iZV9kZGModmdhLT5kZGMpKQorCWlmICghSVNfRVJSKHZn
YS0+Y29ubmVjdG9yLmRkYykgJiYgZHJtX3Byb2JlX2RkYyh2Z2EtPmNvbm5lY3Rvci5kZGMpKQog
CQlyZXR1cm4gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQ7CiAKIAlyZXR1cm4gY29ubmVjdG9y
X3N0YXR1c191bmtub3duOwpAQCAtMTExLDggKzExMCwxMCBAQCBzdGF0aWMgaW50IGR1bWJfdmdh
X2F0dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQogCiAJZHJtX2Nvbm5lY3Rvcl9oZWxw
ZXJfYWRkKCZ2Z2EtPmNvbm5lY3RvciwKIAkJCQkgJmR1bWJfdmdhX2Nvbl9oZWxwZXJfZnVuY3Mp
OwotCXJldCA9IGRybV9jb25uZWN0b3JfaW5pdChicmlkZ2UtPmRldiwgJnZnYS0+Y29ubmVjdG9y
LAotCQkJCSAmZHVtYl92Z2FfY29uX2Z1bmNzLCBEUk1fTU9ERV9DT05ORUNUT1JfVkdBKTsKKwly
ZXQgPSBkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMoYnJpZGdlLT5kZXYsICZ2Z2EtPmNvbm5l
Y3RvciwKKwkJCQkJICAmZHVtYl92Z2FfY29uX2Z1bmNzLAorCQkJCQkgIERSTV9NT0RFX0NPTk5F
Q1RPUl9WR0EsCisJCQkJCSAgdmdhLT5jb25uZWN0b3IuZGRjKTsKIAlpZiAocmV0KSB7CiAJCURS
TV9FUlJPUigiRmFpbGVkIHRvIGluaXRpYWxpemUgY29ubmVjdG9yXG4iKTsKIAkJcmV0dXJuIHJl
dDsKQEAgLTE5MCwxNCArMTkxLDE0IEBAIHN0YXRpYyBpbnQgZHVtYl92Z2FfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJZGV2X2RiZygmcGRldi0+ZGV2LCAiTm8gdmRkIHJl
Z3VsYXRvciBmb3VuZDogJWRcbiIsIHJldCk7CiAJfQogCi0JdmdhLT5kZGMgPSBkdW1iX3ZnYV9y
ZXRyaWV2ZV9kZGMoJnBkZXYtPmRldik7Ci0JaWYgKElTX0VSUih2Z2EtPmRkYykpIHsKLQkJaWYg
KFBUUl9FUlIodmdhLT5kZGMpID09IC1FTk9ERVYpIHsKKwl2Z2EtPmNvbm5lY3Rvci5kZGMgPSBk
dW1iX3ZnYV9yZXRyaWV2ZV9kZGMoJnBkZXYtPmRldik7CisJaWYgKElTX0VSUih2Z2EtPmNvbm5l
Y3Rvci5kZGMpKSB7CisJCWlmIChQVFJfRVJSKHZnYS0+Y29ubmVjdG9yLmRkYykgPT0gLUVOT0RF
VikgewogCQkJZGV2X2RiZygmcGRldi0+ZGV2LAogCQkJCSJObyBpMmMgYnVzIHNwZWNpZmllZC4g
RGlzYWJsaW5nIEVESUQgcmVhZG91dFxuIik7CiAJCX0gZWxzZSB7CiAJCQlkZXZfZXJyKCZwZGV2
LT5kZXYsICJDb3VsZG4ndCByZXRyaWV2ZSBpMmMgYnVzXG4iKTsKLQkJCXJldHVybiBQVFJfRVJS
KHZnYS0+ZGRjKTsKKwkJCXJldHVybiBQVFJfRVJSKHZnYS0+Y29ubmVjdG9yLmRkYyk7CiAJCX0K
IAl9CiAKQEAgLTIxNiw4ICsyMTcsOCBAQCBzdGF0aWMgaW50IGR1bWJfdmdhX3JlbW92ZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJZHJtX2JyaWRnZV9yZW1vdmUoJnZnYS0+YnJp
ZGdlKTsKIAotCWlmICghSVNfRVJSKHZnYS0+ZGRjKSkKLQkJaTJjX3B1dF9hZGFwdGVyKHZnYS0+
ZGRjKTsKKwlpZiAoIUlTX0VSUih2Z2EtPmNvbm5lY3Rvci5kZGMpKQorCQlpMmNfcHV0X2FkYXB0
ZXIodmdhLT5jb25uZWN0b3IuZGRjKTsKIAogCXJldHVybiAwOwogfQotLSAKMi4xNy4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
