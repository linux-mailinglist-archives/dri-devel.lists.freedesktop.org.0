Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DB2730C4
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 16:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427226E56D;
	Wed, 24 Jul 2019 14:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E666E56D;
 Wed, 24 Jul 2019 14:03:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id B7C2E26D598
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 13/24] drm: zte: Provide ddc symlink in hdmi connector
 sysfs directory
Date: Wed, 24 Jul 2019 15:59:35 +0200
Message-Id: <acafbea21c1af8301afcfb8e56ea1a186163e39c.1563960855.git.andrzej.p@collabora.com>
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS96dGUvenhfaGRtaS5jIHwgMzEgKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDE4
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS96dGUvenhfaGRtaS5j
IGIvZHJpdmVycy9ncHUvZHJtL3p0ZS96eF9oZG1pLmMKaW5kZXggYTUwZjVhMWYwOWI4Li41MDJk
MzU3YjQwYTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS96dGUvenhfaGRtaS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS96dGUvenhfaGRtaS5jCkBAIC0yOSwxNSArMjksMTEgQEAKICNkZWZp
bmUgWlhfSERNSV9JTkZPRlJBTUVfU0laRQkJMzEKICNkZWZpbmUgRERDX1NFR01FTlRfQUREUgkJ
MHgzMAogCi1zdHJ1Y3QgenhfaGRtaV9pMmMgewotCXN0cnVjdCBpMmNfYWRhcHRlciBhZGFwOwot
CXN0cnVjdCBtdXRleCBsb2NrOwotfTsKLQogc3RydWN0IHp4X2hkbWkgewogCXN0cnVjdCBkcm1f
Y29ubmVjdG9yIGNvbm5lY3RvcjsKIAlzdHJ1Y3QgZHJtX2VuY29kZXIgZW5jb2RlcjsKLQlzdHJ1
Y3QgenhfaGRtaV9pMmMgKmRkYzsKKwkvKiBwcm90ZWN0cyBkZGMgYWNjZXNzICovCisJc3RydWN0
IG11dGV4IGRkY19sb2NrOwogCXN0cnVjdCBkZXZpY2UgKmRldjsKIAlzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZHJtOwogCXZvaWQgX19pb21lbSAqbW1pbzsKQEAgLTI2NCw3ICsyNjAsNyBAQCBzdGF0aWMg
aW50IHp4X2hkbWlfY29ubmVjdG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
bmVjdG9yKQogCXN0cnVjdCBlZGlkICplZGlkOwogCWludCByZXQ7CiAKLQllZGlkID0gZHJtX2dl
dF9lZGlkKGNvbm5lY3RvciwgJmhkbWktPmRkYy0+YWRhcCk7CisJZWRpZCA9IGRybV9nZXRfZWRp
ZChjb25uZWN0b3IsIGNvbm5lY3Rvci0+ZGRjKTsKIAlpZiAoIWVkaWQpCiAJCXJldHVybiAwOwog
CkBAIC0zMTksOCArMzE1LDEwIEBAIHN0YXRpYyBpbnQgenhfaGRtaV9yZWdpc3RlcihzdHJ1Y3Qg
ZHJtX2RldmljZSAqZHJtLCBzdHJ1Y3QgenhfaGRtaSAqaGRtaSkKIAogCWhkbWktPmNvbm5lY3Rv
ci5wb2xsZWQgPSBEUk1fQ09OTkVDVE9SX1BPTExfSFBEOwogCi0JZHJtX2Nvbm5lY3Rvcl9pbml0
KGRybSwgJmhkbWktPmNvbm5lY3RvciwgJnp4X2hkbWlfY29ubmVjdG9yX2Z1bmNzLAotCQkJICAg
RFJNX01PREVfQ09OTkVDVE9SX0hETUlBKTsKKwlkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMo
ZHJtLCAmaGRtaS0+Y29ubmVjdG9yLAorCQkJCSAgICAmenhfaGRtaV9jb25uZWN0b3JfZnVuY3Ms
CisJCQkJICAgIERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQSwKKwkJCQkgICAgaGRtaS0+Y29ubmVj
dG9yLmRkYyk7CiAJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZoZG1pLT5jb25uZWN0b3IsCiAJ
CQkJICZ6eF9oZG1pX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwogCkBAIC01NjIsMTAgKzU2MCw5
IEBAIHN0YXRpYyBpbnQgenhfaGRtaV9pMmNfeGZlcihzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXAs
IHN0cnVjdCBpMmNfbXNnICptc2dzLAogCQkJICAgIGludCBudW0pCiB7CiAJc3RydWN0IHp4X2hk
bWkgKmhkbWkgPSBpMmNfZ2V0X2FkYXBkYXRhKGFkYXApOwotCXN0cnVjdCB6eF9oZG1pX2kyYyAq
ZGRjID0gaGRtaS0+ZGRjOwogCWludCBpLCByZXQgPSAwOwogCi0JbXV0ZXhfbG9jaygmZGRjLT5s
b2NrKTsKKwltdXRleF9sb2NrKCZoZG1pLT5kZGNfbG9jayk7CiAKIAkvKiBFbmFibGUgRERDIG1h
c3RlciBhY2Nlc3MgKi8KIAloZG1pX3dyaXRlYl9tYXNrKGhkbWksIFRQSV9ERENfTUFTVEVSX0VO
LCBIV19ERENfTUFTVEVSLCBIV19ERENfTUFTVEVSKTsKQEAgLTU5MCw3ICs1ODcsNyBAQCBzdGF0
aWMgaW50IHp4X2hkbWlfaTJjX3hmZXIoc3RydWN0IGkyY19hZGFwdGVyICphZGFwLCBzdHJ1Y3Qg
aTJjX21zZyAqbXNncywKIAkvKiBEaXNhYmxlIEREQyBtYXN0ZXIgYWNjZXNzICovCiAJaGRtaV93
cml0ZWJfbWFzayhoZG1pLCBUUElfRERDX01BU1RFUl9FTiwgSFdfRERDX01BU1RFUiwgMCk7CiAK
LQltdXRleF91bmxvY2soJmRkYy0+bG9jayk7CisJbXV0ZXhfdW5sb2NrKCZoZG1pLT5kZGNfbG9j
ayk7CiAKIAlyZXR1cm4gcmV0OwogfQpAQCAtNjA4LDE3ICs2MDUsMTUgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBpMmNfYWxnb3JpdGhtIHp4X2hkbWlfYWxnb3JpdGhtID0gewogc3RhdGljIGludCB6
eF9oZG1pX2RkY19yZWdpc3RlcihzdHJ1Y3QgenhfaGRtaSAqaGRtaSkKIHsKIAlzdHJ1Y3QgaTJj
X2FkYXB0ZXIgKmFkYXA7Ci0Jc3RydWN0IHp4X2hkbWlfaTJjICpkZGM7CiAJaW50IHJldDsKIAot
CWRkYyA9IGRldm1fa3phbGxvYyhoZG1pLT5kZXYsIHNpemVvZigqZGRjKSwgR0ZQX0tFUk5FTCk7
Ci0JaWYgKCFkZGMpCisJYWRhcCA9IGRldm1fa3phbGxvYyhoZG1pLT5kZXYsIHNpemVvZigqYWRh
cCksIEdGUF9LRVJORUwpOworCWlmICghYWRhcCkKIAkJcmV0dXJuIC1FTk9NRU07CiAKLQloZG1p
LT5kZGMgPSBkZGM7Ci0JbXV0ZXhfaW5pdCgmZGRjLT5sb2NrKTsKKwloZG1pLT5jb25uZWN0b3Iu
ZGRjID0gYWRhcDsKKwltdXRleF9pbml0KCZoZG1pLT5kZGNfbG9jayk7CiAKLQlhZGFwID0gJmRk
Yy0+YWRhcDsKIAlhZGFwLT5vd25lciA9IFRISVNfTU9EVUxFOwogCWFkYXAtPmNsYXNzID0gSTJD
X0NMQVNTX0REQzsKIAlhZGFwLT5kZXYucGFyZW50ID0gaGRtaS0+ZGV2OwotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
