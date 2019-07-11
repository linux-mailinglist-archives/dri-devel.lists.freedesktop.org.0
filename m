Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AE965598
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 13:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6096E201;
	Thu, 11 Jul 2019 11:31:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A19A6E17E;
 Thu, 11 Jul 2019 11:31:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 7B08828B698
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 18/23] drm/bridge: dumb-vga-dac: Provide ddc symlink in
 connector sysfs directory
Date: Thu, 11 Jul 2019 13:26:45 +0200
Message-Id: <b039fbddc020d20457023bda631de8aacb5d061d.1562843413.git.andrzej.p@collabora.com>
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvZHVtYi12Z2EtZGFjLmMgfCAxOSArKysr
KysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxMCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2R1bWItdmdhLWRh
Yy5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9kdW1iLXZnYS1kYWMuYwppbmRleCBkMzI4ODVi
OTA2YWUuLmI0Y2MzMjM4NDAwYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9k
dW1iLXZnYS1kYWMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2R1bWItdmdhLWRhYy5j
CkBAIC0yMCw3ICsyMCw2IEBAIHN0cnVjdCBkdW1iX3ZnYSB7CiAJc3RydWN0IGRybV9icmlkZ2UJ
YnJpZGdlOwogCXN0cnVjdCBkcm1fY29ubmVjdG9yCWNvbm5lY3RvcjsKIAotCXN0cnVjdCBpMmNf
YWRhcHRlcgkqZGRjOwogCXN0cnVjdCByZWd1bGF0b3IJKnZkZDsKIH07CiAKQEAgLTQyLDEwICs0
MSwxMCBAQCBzdGF0aWMgaW50IGR1bWJfdmdhX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubmVjdG9yKQogCXN0cnVjdCBlZGlkICplZGlkOwogCWludCByZXQ7CiAKLQlpZiAoSVNf
RVJSKHZnYS0+ZGRjKSkKKwlpZiAoSVNfRVJSKHZnYS0+Y29ubmVjdG9yLmRkYykpCiAJCWdvdG8g
ZmFsbGJhY2s7CiAKLQllZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3RvciwgdmdhLT5kZGMpOwor
CWVkaWQgPSBkcm1fZ2V0X2VkaWQoY29ubmVjdG9yLCB2Z2EtPmNvbm5lY3Rvci5kZGMpOwogCWlm
ICghZWRpZCkgewogCQlEUk1fSU5GTygiRURJRCByZWFkb3V0IGZhaWxlZCwgZmFsbGluZyBiYWNr
IHRvIHN0YW5kYXJkIG1vZGVzXG4iKTsKIAkJZ290byBmYWxsYmFjazsKQEAgLTg0LDcgKzgzLDcg
QEAgZHVtYl92Z2FfY29ubmVjdG9yX2RldGVjdChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yLCBib29sIGZvcmNlKQogCSAqIHdpcmUgdGhlIEREQyBwaW5zLCBvciB0aGUgSTJDIGJ1cyBt
aWdodCBub3QgYmUgd29ya2luZyBhdAogCSAqIGFsbC4KIAkgKi8KLQlpZiAoIUlTX0VSUih2Z2Et
PmRkYykgJiYgZHJtX3Byb2JlX2RkYyh2Z2EtPmRkYykpCisJaWYgKCFJU19FUlIodmdhLT5jb25u
ZWN0b3IuZGRjKSAmJiBkcm1fcHJvYmVfZGRjKHZnYS0+Y29ubmVjdG9yLmRkYykpCiAJCXJldHVy
biBjb25uZWN0b3Jfc3RhdHVzX2Nvbm5lY3RlZDsKIAogCXJldHVybiBjb25uZWN0b3Jfc3RhdHVz
X3Vua25vd247CkBAIC0xOTAsMTQgKzE4OSwxNCBAQCBzdGF0aWMgaW50IGR1bWJfdmdhX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCWRldl9kYmcoJnBkZXYtPmRldiwgIk5v
IHZkZCByZWd1bGF0b3IgZm91bmQ6ICVkXG4iLCByZXQpOwogCX0KIAotCXZnYS0+ZGRjID0gZHVt
Yl92Z2FfcmV0cmlldmVfZGRjKCZwZGV2LT5kZXYpOwotCWlmIChJU19FUlIodmdhLT5kZGMpKSB7
Ci0JCWlmIChQVFJfRVJSKHZnYS0+ZGRjKSA9PSAtRU5PREVWKSB7CisJdmdhLT5jb25uZWN0b3Iu
ZGRjID0gZHVtYl92Z2FfcmV0cmlldmVfZGRjKCZwZGV2LT5kZXYpOworCWlmIChJU19FUlIodmdh
LT5jb25uZWN0b3IuZGRjKSkgeworCQlpZiAoUFRSX0VSUih2Z2EtPmNvbm5lY3Rvci5kZGMpID09
IC1FTk9ERVYpIHsKIAkJCWRldl9kYmcoJnBkZXYtPmRldiwKIAkJCQkiTm8gaTJjIGJ1cyBzcGVj
aWZpZWQuIERpc2FibGluZyBFRElEIHJlYWRvdXRcbiIpOwogCQl9IGVsc2UgewogCQkJZGV2X2Vy
cigmcGRldi0+ZGV2LCAiQ291bGRuJ3QgcmV0cmlldmUgaTJjIGJ1c1xuIik7Ci0JCQlyZXR1cm4g
UFRSX0VSUih2Z2EtPmRkYyk7CisJCQlyZXR1cm4gUFRSX0VSUih2Z2EtPmNvbm5lY3Rvci5kZGMp
OwogCQl9CiAJfQogCkBAIC0yMTYsOCArMjE1LDggQEAgc3RhdGljIGludCBkdW1iX3ZnYV9yZW1v
dmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCWRybV9icmlkZ2VfcmVtb3ZlKCZ2
Z2EtPmJyaWRnZSk7CiAKLQlpZiAoIUlTX0VSUih2Z2EtPmRkYykpCi0JCWkyY19wdXRfYWRhcHRl
cih2Z2EtPmRkYyk7CisJaWYgKCFJU19FUlIodmdhLT5jb25uZWN0b3IuZGRjKSkKKwkJaTJjX3B1
dF9hZGFwdGVyKHZnYS0+Y29ubmVjdG9yLmRkYyk7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
