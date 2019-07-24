Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AD3730FF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 16:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225366E58A;
	Wed, 24 Jul 2019 14:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A426E58A;
 Wed, 24 Jul 2019 14:05:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 85226283CC1
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 21/24] drm/bridge: ti-tfp410: Provide ddc symlink in
 connector sysfs directory
Date: Wed, 24 Jul 2019 15:59:43 +0200
Message-Id: <87b9340ea88713b8b715fcf8234dd07d77f8bc9a.1563960855.git.andrzej.p@collabora.com>
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
 Alexios Zavras <alexios.zavras@intel.com>,
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMgfCAyNSArKysrKysr
KysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0
MTAuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMKaW5kZXggZGJmMzVjN2Jj
ODVlLi5jYThlMmYzODI4NTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGkt
dGZwNDEwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYwpAQCAtMjYs
NyArMjYsNiBAQCBzdHJ1Y3QgdGZwNDEwIHsKIAl1bnNpZ25lZCBpbnQJCWNvbm5lY3Rvcl90eXBl
OwogCiAJdTMyCQkJYnVzX2Zvcm1hdDsKLQlzdHJ1Y3QgaTJjX2FkYXB0ZXIJKmRkYzsKIAlzdHJ1
Y3QgZ3Bpb19kZXNjCSpocGQ7CiAJaW50CQkJaHBkX2lycTsKIAlzdHJ1Y3QgZGVsYXllZF93b3Jr
CWhwZF93b3JrOwpAQCAtNTUsMTAgKzU0LDEwIEBAIHN0YXRpYyBpbnQgdGZwNDEwX2dldF9tb2Rl
cyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCXN0cnVjdCBlZGlkICplZGlkOwog
CWludCByZXQ7CiAKLQlpZiAoIWR2aS0+ZGRjKQorCWlmICghZHZpLT5jb25uZWN0b3IuZGRjKQog
CQlnb3RvIGZhbGxiYWNrOwogCi0JZWRpZCA9IGRybV9nZXRfZWRpZChjb25uZWN0b3IsIGR2aS0+
ZGRjKTsKKwllZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3RvciwgZHZpLT5jb25uZWN0b3IuZGRj
KTsKIAlpZiAoIWVkaWQpIHsKIAkJRFJNX0lORk8oIkVESUQgcmVhZCBmYWlsZWQuIEZhbGxiYWNr
IHRvIHN0YW5kYXJkIG1vZGVzXG4iKTsKIAkJZ290byBmYWxsYmFjazsKQEAgLTk4LDggKzk3LDgg
QEAgdGZwNDEwX2Nvbm5lY3Rvcl9kZXRlY3Qoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rv
ciwgYm9vbCBmb3JjZSkKIAkJCXJldHVybiBjb25uZWN0b3Jfc3RhdHVzX2Rpc2Nvbm5lY3RlZDsK
IAl9CiAKLQlpZiAoZHZpLT5kZGMpIHsKLQkJaWYgKGRybV9wcm9iZV9kZGMoZHZpLT5kZGMpKQor
CWlmIChkdmktPmNvbm5lY3Rvci5kZGMpIHsKKwkJaWYgKGRybV9wcm9iZV9kZGMoZHZpLT5jb25u
ZWN0b3IuZGRjKSkKIAkJCXJldHVybiBjb25uZWN0b3Jfc3RhdHVzX2Nvbm5lY3RlZDsKIAkJZWxz
ZQogCQkJcmV0dXJuIGNvbm5lY3Rvcl9zdGF0dXNfZGlzY29ubmVjdGVkOwpAQCAtMTM0LDggKzEz
MywxMCBAQCBzdGF0aWMgaW50IHRmcDQxMF9hdHRhY2goc3RydWN0IGRybV9icmlkZ2UgKmJyaWRn
ZSkKIAogCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgmZHZpLT5jb25uZWN0b3IsCiAJCQkJICZ0
ZnA0MTBfY29uX2hlbHBlcl9mdW5jcyk7Ci0JcmV0ID0gZHJtX2Nvbm5lY3Rvcl9pbml0KGJyaWRn
ZS0+ZGV2LCAmZHZpLT5jb25uZWN0b3IsCi0JCQkJICZ0ZnA0MTBfY29uX2Z1bmNzLCBkdmktPmNv
bm5lY3Rvcl90eXBlKTsKKwlyZXQgPSBkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMoYnJpZGdl
LT5kZXYsICZkdmktPmNvbm5lY3RvciwKKwkJCQkJICAmdGZwNDEwX2Nvbl9mdW5jcywKKwkJCQkJ
ICBkdmktPmNvbm5lY3Rvcl90eXBlLAorCQkJCQkgIGR2aS0+Y29ubmVjdG9yLmRkYyk7CiAJaWYg
KHJldCkgewogCQlkZXZfZXJyKGR2aS0+ZGV2LCAiZHJtX2Nvbm5lY3Rvcl9pbml0KCkgZmFpbGVk
OiAlZFxuIiwgcmV0KTsKIAkJcmV0dXJuIHJldDsKQEAgLTI5Nyw4ICsyOTgsOCBAQCBzdGF0aWMg
aW50IHRmcDQxMF9nZXRfY29ubmVjdG9yX3Byb3BlcnRpZXMoc3RydWN0IHRmcDQxMCAqZHZpKQog
CWlmICghZGRjX3BoYW5kbGUpCiAJCWdvdG8gZmFpbDsKIAotCWR2aS0+ZGRjID0gb2ZfZ2V0X2ky
Y19hZGFwdGVyX2J5X25vZGUoZGRjX3BoYW5kbGUpOwotCWlmIChkdmktPmRkYykKKwlkdmktPmNv
bm5lY3Rvci5kZGMgPSBvZl9nZXRfaTJjX2FkYXB0ZXJfYnlfbm9kZShkZGNfcGhhbmRsZSk7CisJ
aWYgKGR2aS0+Y29ubmVjdG9yLmRkYykKIAkJZGV2X2luZm8oZHZpLT5kZXYsICJDb25uZWN0b3In
cyBkZGMgaTJjIGJ1cyBmb3VuZFxuIik7CiAJZWxzZQogCQlyZXQgPSAtRVBST0JFX0RFRkVSOwpA
QCAtMzY3LDcgKzM2OCw3IEBAIHN0YXRpYyBpbnQgdGZwNDEwX2luaXQoc3RydWN0IGRldmljZSAq
ZGV2LCBib29sIGkyYykKIAogCXJldHVybiAwOwogZmFpbDoKLQlpMmNfcHV0X2FkYXB0ZXIoZHZp
LT5kZGMpOworCWkyY19wdXRfYWRhcHRlcihkdmktPmNvbm5lY3Rvci5kZGMpOwogCWlmIChkdmkt
PmhwZCkKIAkJZ3Bpb2RfcHV0KGR2aS0+aHBkKTsKIAlyZXR1cm4gcmV0OwpAQCAtMzgyLDggKzM4
Myw4IEBAIHN0YXRpYyBpbnQgdGZwNDEwX2Zpbmkoc3RydWN0IGRldmljZSAqZGV2KQogCiAJZHJt
X2JyaWRnZV9yZW1vdmUoJmR2aS0+YnJpZGdlKTsKIAotCWlmIChkdmktPmRkYykKLQkJaTJjX3B1
dF9hZGFwdGVyKGR2aS0+ZGRjKTsKKwlpZiAoZHZpLT5jb25uZWN0b3IuZGRjKQorCQlpMmNfcHV0
X2FkYXB0ZXIoZHZpLT5jb25uZWN0b3IuZGRjKTsKIAlpZiAoZHZpLT5ocGQpCiAJCWdwaW9kX3B1
dChkdmktPmhwZCk7CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
