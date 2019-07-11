Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C68765554
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 13:28:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BCF6E1AA;
	Thu, 11 Jul 2019 11:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961606E1A4;
 Thu, 11 Jul 2019 11:28:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 43D1228B554
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 07/23] drm/mediatek: Provide ddc symlink in hdmi connector
 sysfs directory
Date: Thu, 11 Jul 2019 13:26:34 +0200
Message-Id: <8ff08f7aa7cbd9b264c564382b8206ec5fd21f74.1562843413.git.andrzej.p@collabora.com>
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
 Maxime Ripard <maxime.ripard@bootlin.com>,
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
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIHwgOSArKysrLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwppbmRleCA1ZDZhOWYwOTRkZjUuLjZjNTMyMWRjYzRi
OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKQEAgLTE0Niw3ICsxNDYsNiBAQCBz
dHJ1Y3QgbXRrX2hkbWkgewogCXN0cnVjdCBkZXZpY2UgKmRldjsKIAlzdHJ1Y3QgcGh5ICpwaHk7
CiAJc3RydWN0IGRldmljZSAqY2VjX2RldjsKLQlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRkY19hZHB0
OwogCXN0cnVjdCBjbGsgKmNsa1tNVEtfSERNSV9DTEtfQ09VTlRdOwogCXN0cnVjdCBkcm1fZGlz
cGxheV9tb2RlIG1vZGU7CiAJYm9vbCBkdmlfbW9kZTsKQEAgLTEyMTMsMTAgKzEyMTIsMTAgQEAg
c3RhdGljIGludCBtdGtfaGRtaV9jb25uX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAq
Y29ubikKIAlzdHJ1Y3QgZWRpZCAqZWRpZDsKIAlpbnQgcmV0OwogCi0JaWYgKCFoZG1pLT5kZGNf
YWRwdCkKKwlpZiAoIWNvbm4tPmRkYykKIAkJcmV0dXJuIC1FTk9ERVY7CiAKLQllZGlkID0gZHJt
X2dldF9lZGlkKGNvbm4sIGhkbWktPmRkY19hZHB0KTsKKwllZGlkID0gZHJtX2dldF9lZGlkKGNv
bm4sIGNvbm4tPmRkYyk7CiAJaWYgKCFlZGlkKQogCQlyZXR1cm4gLUVOT0RFVjsKIApAQCAtMTUw
OSw5ICsxNTA4LDkgQEAgc3RhdGljIGludCBtdGtfaGRtaV9kdF9wYXJzZV9wZGF0YShzdHJ1Y3Qg
bXRrX2hkbWkgKmhkbWksCiAJfQogCW9mX25vZGVfcHV0KHJlbW90ZSk7CiAKLQloZG1pLT5kZGNf
YWRwdCA9IG9mX2ZpbmRfaTJjX2FkYXB0ZXJfYnlfbm9kZShpMmNfbnApOworCWhkbWktPmNvbm4u
ZGRjID0gb2ZfZmluZF9pMmNfYWRhcHRlcl9ieV9ub2RlKGkyY19ucCk7CiAJb2Zfbm9kZV9wdXQo
aTJjX25wKTsKLQlpZiAoIWhkbWktPmRkY19hZHB0KSB7CisJaWYgKCFoZG1pLT5jb25uLmRkYykg
ewogCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBnZXQgZGRjIGkyYyBhZGFwdGVyIGJ5IG5vZGVc
biIpOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
