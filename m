Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7356C730BA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 16:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4066E568;
	Wed, 24 Jul 2019 14:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FEB6E568;
 Wed, 24 Jul 2019 14:03:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 85290263BB0
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 11/24] drm/imx: imx-tve: Provide ddc symlink in connector's
 sysfs
Date: Wed, 24 Jul 2019 15:59:33 +0200
Message-Id: <fb36c2cd9245bef6bb96d9b9e9928c3083a26ff2.1563960855.git.andrzej.p@collabora.com>
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
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 Enrico Weigelt <info@metux.net>, Jernej Skrabec <jernej.skrabec@siol.net>,
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pbXgvaW14LXR2ZS5jIHwgMTQgKysrKysrKy0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2lteC9pbXgtdHZlLmMgYi9kcml2ZXJzL2dwdS9kcm0v
aW14L2lteC10dmUuYwppbmRleCA2NDk1MTU4NjhmODYuLmUyNWRmOWJiYTM5MyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2lteC9pbXgtdHZlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2lt
eC9pbXgtdHZlLmMKQEAgLTExMSw3ICsxMTEsNiBAQCBzdHJ1Y3QgaW14X3R2ZSB7CiAKIAlzdHJ1
Y3QgcmVnbWFwICpyZWdtYXA7CiAJc3RydWN0IHJlZ3VsYXRvciAqZGFjX3JlZzsKLQlzdHJ1Y3Qg
aTJjX2FkYXB0ZXIgKmRkYzsKIAlzdHJ1Y3QgY2xrICpjbGs7CiAJc3RydWN0IGNsayAqZGlfc2Vs
X2NsazsKIAlzdHJ1Y3QgY2xrX2h3IGNsa19od19kaTsKQEAgLTIyMCwxNCArMjE5LDEzIEBAIHN0
YXRpYyBpbnQgdHZlX3NldHVwX3ZnYShzdHJ1Y3QgaW14X3R2ZSAqdHZlKQogCiBzdGF0aWMgaW50
IGlteF90dmVfY29ubmVjdG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yKQogewotCXN0cnVjdCBpbXhfdHZlICp0dmUgPSBjb25fdG9fdHZlKGNvbm5lY3Rvcik7CiAJ
c3RydWN0IGVkaWQgKmVkaWQ7CiAJaW50IHJldCA9IDA7CiAKLQlpZiAoIXR2ZS0+ZGRjKQorCWlm
ICghY29ubmVjdG9yLT5kZGMpCiAJCXJldHVybiAwOwogCi0JZWRpZCA9IGRybV9nZXRfZWRpZChj
b25uZWN0b3IsIHR2ZS0+ZGRjKTsKKwllZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3RvciwgY29u
bmVjdG9yLT5kZGMpOwogCWlmIChlZGlkKSB7CiAJCWRybV9jb25uZWN0b3JfdXBkYXRlX2VkaWRf
cHJvcGVydHkoY29ubmVjdG9yLCBlZGlkKTsKIAkJcmV0ID0gZHJtX2FkZF9lZGlkX21vZGVzKGNv
bm5lY3RvciwgZWRpZCk7CkBAIC00ODQsOCArNDgyLDEwIEBAIHN0YXRpYyBpbnQgaW14X3R2ZV9y
ZWdpc3RlcihzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCBzdHJ1Y3QgaW14X3R2ZSAqdHZlKQogCiAJ
ZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZ0dmUtPmNvbm5lY3RvciwKIAkJCSZpbXhfdHZlX2Nv
bm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwotCWRybV9jb25uZWN0b3JfaW5pdChkcm0sICZ0dmUtPmNv
bm5lY3RvciwgJmlteF90dmVfY29ubmVjdG9yX2Z1bmNzLAotCQkJICAgRFJNX01PREVfQ09OTkVD
VE9SX1ZHQSk7CisJZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKGRybSwgJnR2ZS0+Y29ubmVj
dG9yLAorCQkJCSAgICAmaW14X3R2ZV9jb25uZWN0b3JfZnVuY3MsCisJCQkJICAgIERSTV9NT0RF
X0NPTk5FQ1RPUl9WR0EsCisJCQkJICAgIHR2ZS0+Y29ubmVjdG9yLmRkYyk7CiAKIAlkcm1fY29u
bmVjdG9yX2F0dGFjaF9lbmNvZGVyKCZ0dmUtPmNvbm5lY3RvciwgJnR2ZS0+ZW5jb2Rlcik7CiAK
QEAgLTU1Myw3ICs1NTMsNyBAQCBzdGF0aWMgaW50IGlteF90dmVfYmluZChzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKIAogCWRkY19ub2RlID0g
b2ZfcGFyc2VfcGhhbmRsZShucCwgImRkYy1pMmMtYnVzIiwgMCk7CiAJaWYgKGRkY19ub2RlKSB7
Ci0JCXR2ZS0+ZGRjID0gb2ZfZmluZF9pMmNfYWRhcHRlcl9ieV9ub2RlKGRkY19ub2RlKTsKKwkJ
dHZlLT5jb25uZWN0b3IuZGRjID0gb2ZfZmluZF9pMmNfYWRhcHRlcl9ieV9ub2RlKGRkY19ub2Rl
KTsKIAkJb2Zfbm9kZV9wdXQoZGRjX25vZGUpOwogCX0KIAotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
