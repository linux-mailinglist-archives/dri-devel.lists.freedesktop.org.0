Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8844E77022
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 19:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B146EE09;
	Fri, 26 Jul 2019 17:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D617D6EDFF;
 Fri, 26 Jul 2019 17:27:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id B11F127EA8C
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 18/24] drm/ast: Provide ddc symlink in connector sysfs
 directory
Date: Fri, 26 Jul 2019 19:23:12 +0200
Message-Id: <ff968add8074d109aeed02f0708edd85138246c3.1564161140.git.andrzej.p@collabora.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
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
Y29tPgpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jIHwgMTMgKysrKysrKystLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9tb2RlLmMKaW5kZXggYzc5MjM2MjAyNGE1Li4xYzg5OWE2ZTg3YjcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9tb2RlLmMKQEAgLTg2Nyw3ICs4NjcsMTQgQEAgc3RhdGljIGludCBhc3RfY29ubmVjdG9y
X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAkJcmV0dXJuIC1FTk9NRU07CiAKIAljb25u
ZWN0b3IgPSAmYXN0X2Nvbm5lY3Rvci0+YmFzZTsKLQlkcm1fY29ubmVjdG9yX2luaXQoZGV2LCBj
b25uZWN0b3IsICZhc3RfY29ubmVjdG9yX2Z1bmNzLCBEUk1fTU9ERV9DT05ORUNUT1JfVkdBKTsK
Kwlhc3RfY29ubmVjdG9yLT5pMmMgPSBhc3RfaTJjX2NyZWF0ZShkZXYpOworCWlmICghYXN0X2Nv
bm5lY3Rvci0+aTJjKQorCQlEUk1fRVJST1IoImZhaWxlZCB0byBhZGQgZGRjIGJ1cyBmb3IgY29u
bmVjdG9yXG4iKTsKKworCWRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYyhkZXYsIGNvbm5lY3Rv
ciwKKwkJCQkgICAgJmFzdF9jb25uZWN0b3JfZnVuY3MsCisJCQkJICAgIERSTV9NT0RFX0NPTk5F
Q1RPUl9WR0EsCisJCQkJICAgICZhc3RfY29ubmVjdG9yLT5pMmMtPmFkYXB0ZXIpOwogCiAJZHJt
X2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKGNvbm5lY3RvciwgJmFzdF9jb25uZWN0b3JfaGVscGVyX2Z1
bmNzKTsKIApAQCAtODgxLDEwICs4ODgsNiBAQCBzdGF0aWMgaW50IGFzdF9jb25uZWN0b3JfaW5p
dChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCWVuY29kZXIgPSBsaXN0X2ZpcnN0X2VudHJ5KCZk
ZXYtPm1vZGVfY29uZmlnLmVuY29kZXJfbGlzdCwgc3RydWN0IGRybV9lbmNvZGVyLCBoZWFkKTsK
IAlkcm1fY29ubmVjdG9yX2F0dGFjaF9lbmNvZGVyKGNvbm5lY3RvciwgZW5jb2Rlcik7CiAKLQlh
c3RfY29ubmVjdG9yLT5pMmMgPSBhc3RfaTJjX2NyZWF0ZShkZXYpOwotCWlmICghYXN0X2Nvbm5l
Y3Rvci0+aTJjKQotCQlEUk1fRVJST1IoImZhaWxlZCB0byBhZGQgZGRjIGJ1cyBmb3IgY29ubmVj
dG9yXG4iKTsKLQogCXJldHVybiAwOwogfQogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
