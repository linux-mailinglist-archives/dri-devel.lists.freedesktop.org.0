Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC495B123
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 20:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86BEC89CCE;
	Sun, 30 Jun 2019 18:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB06B6E95B;
 Fri, 28 Jun 2019 16:04:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 9083C280AB5
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 02/22] drm/exynos: Provide ddc symlink in connector's sysfs
Date: Fri, 28 Jun 2019 18:01:16 +0200
Message-Id: <3f7bbe3420bbd30a21c771b7c9c24d9a23c85000.1561735433.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1561735433.git.andrzej.p@collabora.com>
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
 <cover.1561735433.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1561735433.git.andrzej.p@collabora.com>
References: <cover.1561735433.git.andrzej.p@collabora.com>
X-Mailman-Approved-At: Sun, 30 Jun 2019 18:26:11 +0000
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
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>,
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
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

U3dpdGNoIHRvIHVzaW5nIHRoZSBkZGMgcHJvdmlkZWQgYnkgdGhlIGdlbmVyaWMgY29ubmVjdG9y
LgoKU2lnbmVkLW9mZi1ieTogQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29sbGFi
b3JhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMgfCAxMSAr
KysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMKaW5kZXggODk0YTk5NzkzNjMzLi42
ODE2ZTM3ODYxYjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2hk
bWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMKQEAgLTEyNiw3
ICsxMjYsNiBAQCBzdHJ1Y3QgaGRtaV9jb250ZXh0IHsKIAl2b2lkIF9faW9tZW0JCQkqcmVnczsK
IAl2b2lkIF9faW9tZW0JCQkqcmVnc19oZG1pcGh5OwogCXN0cnVjdCBpMmNfY2xpZW50CQkqaGRt
aXBoeV9wb3J0OwotCXN0cnVjdCBpMmNfYWRhcHRlcgkJKmRkY19hZHB0OwogCXN0cnVjdCBncGlv
X2Rlc2MJCSpocGRfZ3BpbzsKIAlpbnQJCQkJaXJxOwogCXN0cnVjdCByZWdtYXAJCQkqcG11cmVn
OwpAQCAtODcyLDEwICs4NzEsMTAgQEAgc3RhdGljIGludCBoZG1pX2dldF9tb2RlcyhzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCXN0cnVjdCBlZGlkICplZGlkOwogCWludCByZXQ7
CiAKLQlpZiAoIWhkYXRhLT5kZGNfYWRwdCkKKwlpZiAoIWNvbm5lY3Rvci0+ZGRjKQogCQlyZXR1
cm4gLUVOT0RFVjsKIAotCWVkaWQgPSBkcm1fZ2V0X2VkaWQoY29ubmVjdG9yLCBoZGF0YS0+ZGRj
X2FkcHQpOworCWVkaWQgPSBkcm1fZ2V0X2VkaWQoY29ubmVjdG9yLCBjb25uZWN0b3ItPmRkYyk7
CiAJaWYgKCFlZGlkKQogCQlyZXR1cm4gLUVOT0RFVjsKIApAQCAtMTg5Myw3ICsxODkyLDcgQEAg
c3RhdGljIGludCBoZG1pX2dldF9kZGNfYWRhcHRlcihzdHJ1Y3QgaGRtaV9jb250ZXh0ICpoZGF0
YSkKIAkJcmV0dXJuIC1FUFJPQkVfREVGRVI7CiAJfQogCi0JaGRhdGEtPmRkY19hZHB0ID0gYWRw
dDsKKwloZGF0YS0+Y29ubmVjdG9yLmRkYyA9IGFkcHQ7CiAKIAlyZXR1cm4gMDsKIH0KQEAgLTIw
NDUsNyArMjA0NCw3IEBAIHN0YXRpYyBpbnQgaGRtaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQogCWlmIChoZGF0YS0+cmVnc19oZG1pcGh5KQogCQlpb3VubWFwKGhkYXRhLT5y
ZWdzX2hkbWlwaHkpOwogZXJyX2RkYzoKLQlwdXRfZGV2aWNlKCZoZGF0YS0+ZGRjX2FkcHQtPmRl
dik7CisJcHV0X2RldmljZSgmaGRhdGEtPmNvbm5lY3Rvci5kZGMtPmRldik7CiAKIAlyZXR1cm4g
cmV0OwogfQpAQCAtMjA3Miw3ICsyMDcxLDcgQEAgc3RhdGljIGludCBoZG1pX3JlbW92ZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWlmIChoZGF0YS0+cmVnc19oZG1pcGh5KQogCQlp
b3VubWFwKGhkYXRhLT5yZWdzX2hkbWlwaHkpOwogCi0JcHV0X2RldmljZSgmaGRhdGEtPmRkY19h
ZHB0LT5kZXYpOworCXB1dF9kZXZpY2UoJmhkYXRhLT5jb25uZWN0b3IuZGRjLT5kZXYpOwogCiAJ
bXV0ZXhfZGVzdHJveSgmaGRhdGEtPm11dGV4KTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
