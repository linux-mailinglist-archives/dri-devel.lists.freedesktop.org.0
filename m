Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C64F177035
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 19:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7BC6EE07;
	Fri, 26 Jul 2019 17:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2369F6EE07;
 Fri, 26 Jul 2019 17:28:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 04F3227EA8C
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 21/24] drm/bridge: ti-tfp410: Provide ddc symlink in
 connector sysfs directory
Date: Fri, 26 Jul 2019 19:23:15 +0200
Message-Id: <3b61da77a6456805db0deffe6d1a2343dd784730.1564161140.git.andrzej.p@collabora.com>
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMgfCA2ICsrKystLQog
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS90aS10ZnA0MTAuYwppbmRleCBkYmYzNWM3YmM4NWUuLjYxY2MyMzU0ZWYxYiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jCkBAIC0xMzQsOCArMTM0LDEwIEBAIHN0YXRpYyBp
bnQgdGZwNDEwX2F0dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQogCiAJZHJtX2Nvbm5l
Y3Rvcl9oZWxwZXJfYWRkKCZkdmktPmNvbm5lY3RvciwKIAkJCQkgJnRmcDQxMF9jb25faGVscGVy
X2Z1bmNzKTsKLQlyZXQgPSBkcm1fY29ubmVjdG9yX2luaXQoYnJpZGdlLT5kZXYsICZkdmktPmNv
bm5lY3RvciwKLQkJCQkgJnRmcDQxMF9jb25fZnVuY3MsIGR2aS0+Y29ubmVjdG9yX3R5cGUpOwor
CXJldCA9IGRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYyhicmlkZ2UtPmRldiwgJmR2aS0+Y29u
bmVjdG9yLAorCQkJCQkgICZ0ZnA0MTBfY29uX2Z1bmNzLAorCQkJCQkgIGR2aS0+Y29ubmVjdG9y
X3R5cGUsCisJCQkJCSAgZHZpLT5kZGMpOwogCWlmIChyZXQpIHsKIAkJZGV2X2VycihkdmktPmRl
diwgImRybV9jb25uZWN0b3JfaW5pdCgpIGZhaWxlZDogJWRcbiIsIHJldCk7CiAJCXJldHVybiBy
ZXQ7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
