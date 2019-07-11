Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F50B6556A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 13:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0EE6E1B5;
	Thu, 11 Jul 2019 11:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B766E1B5;
 Thu, 11 Jul 2019 11:29:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id E9C8128B681
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 11/23] drm/vc4: Provide ddc symlink in connector sysfs
 directory
Date: Thu, 11 Jul 2019 13:26:38 +0200
Message-Id: <5066b656e50cbdb3b0721778ced761c4a96bf720.1562843413.git.andrzej.p@collabora.com>
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYyB8IDIxICsrKysrKysrKysr
Ky0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jIGIvZHJpdmVy
cy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jCmluZGV4IGVlN2Q0ZTdiMGVlMy4uYWJhY2Q0OGExNDYy
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jCkBAIC03Niw3ICs3Niw2IEBAIHN0cnVjdCB2YzRfaGRt
aSB7CiAKIAlzdHJ1Y3QgdmM0X2hkbWlfYXVkaW8gYXVkaW87CiAKLQlzdHJ1Y3QgaTJjX2FkYXB0
ZXIgKmRkYzsKIAl2b2lkIF9faW9tZW0gKmhkbWljb3JlX3JlZ3M7CiAJdm9pZCBfX2lvbWVtICpo
ZF9yZWdzOwogCWludCBocGRfZ3BpbzsKQEAgLTIwNyw3ICsyMDYsNyBAQCB2YzRfaGRtaV9jb25u
ZWN0b3JfZGV0ZWN0KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIGJvb2wgZm9yY2Up
CiAJCXJldHVybiBjb25uZWN0b3Jfc3RhdHVzX2Rpc2Nvbm5lY3RlZDsKIAl9CiAKLQlpZiAoZHJt
X3Byb2JlX2RkYyh2YzQtPmhkbWktPmRkYykpCisJaWYgKGRybV9wcm9iZV9kZGMoY29ubmVjdG9y
LT5kZGMpKQogCQlyZXR1cm4gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQ7CiAKIAlpZiAoSERN
SV9SRUFEKFZDNF9IRE1JX0hPVFBMVUcpICYgVkM0X0hETUlfSE9UUExVR19DT05ORUNURUQpCkBA
IC0yMzMsNyArMjMyLDcgQEAgc3RhdGljIGludCB2YzRfaGRtaV9jb25uZWN0b3JfZ2V0X21vZGVz
KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiAJaW50IHJldCA9IDA7CiAJc3RydWN0
IGVkaWQgKmVkaWQ7CiAKLQllZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3RvciwgdmM0LT5oZG1p
LT5kZGMpOworCWVkaWQgPSBkcm1fZ2V0X2VkaWQoY29ubmVjdG9yLCBjb25uZWN0b3ItPmRkYyk7
CiAJY2VjX3NfcGh5c19hZGRyX2Zyb21fZWRpZCh2YzQtPmhkbWktPmNlY19hZGFwLCBlZGlkKTsK
IAlpZiAoIWVkaWQpCiAJCXJldHVybiAtRU5PREVWOwpAQCAtMjY3LDcgKzI2Niw4IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MgdmM0X2hkbWlfY29ubmVj
dG9yX2hlbHBlcl9mdW5jcyA9CiB9OwogCiBzdGF0aWMgc3RydWN0IGRybV9jb25uZWN0b3IgKnZj
NF9oZG1pX2Nvbm5lY3Rvcl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCi0JCQkJCQkgICAg
IHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKKwkJCQkJCSAgICAgc3RydWN0IGRybV9lbmNv
ZGVyICplbmNvZGVyLAorCQkJCQkJICAgICBzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRkYykKIHsKIAlz
dHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yOwogCXN0cnVjdCB2YzRfaGRtaV9jb25uZWN0
b3IgKmhkbWlfY29ubmVjdG9yOwpAQCAtMjgwLDYgKzI4MCw3IEBAIHN0YXRpYyBzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqdmM0X2hkbWlfY29ubmVjdG9yX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwKIAljb25uZWN0b3IgPSAmaGRtaV9jb25uZWN0b3ItPmJhc2U7CiAKIAloZG1pX2Nvbm5lY3Rv
ci0+ZW5jb2RlciA9IGVuY29kZXI7CisJY29ubmVjdG9yLT5kZGMgPSBkZGM7CiAKIAlkcm1fY29u
bmVjdG9yX2luaXQoZGV2LCBjb25uZWN0b3IsICZ2YzRfaGRtaV9jb25uZWN0b3JfZnVuY3MsCiAJ
CQkgICBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEpOwpAQCAtMTI5MSw2ICsxMjkyLDcgQEAgc3Rh
dGljIGludCB2YzRfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAq
bWFzdGVyLCB2b2lkICpkYXRhKQogCXN0cnVjdCB2YzRfaGRtaSAqaGRtaTsKIAlzdHJ1Y3QgdmM0
X2hkbWlfZW5jb2RlciAqdmM0X2hkbWlfZW5jb2RlcjsKIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKmRk
Y19ub2RlOworCXN0cnVjdCBpMmNfYWRhcHRlciAqZGRjOwogCXUzMiB2YWx1ZTsKIAlpbnQgcmV0
OwogCkBAIC0xMzM4LDkgKzEzNDAsOSBAQCBzdGF0aWMgaW50IHZjNF9oZG1pX2JpbmQoc3RydWN0
IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsIHZvaWQgKmRhdGEpCiAJCXJldHVy
biAtRU5PREVWOwogCX0KIAotCWhkbWktPmRkYyA9IG9mX2ZpbmRfaTJjX2FkYXB0ZXJfYnlfbm9k
ZShkZGNfbm9kZSk7CisJZGRjID0gb2ZfZmluZF9pMmNfYWRhcHRlcl9ieV9ub2RlKGRkY19ub2Rl
KTsKIAlvZl9ub2RlX3B1dChkZGNfbm9kZSk7Ci0JaWYgKCFoZG1pLT5kZGMpIHsKKwlpZiAoZGRj
KSB7CiAJCURSTV9ERUJVRygiRmFpbGVkIHRvIGdldCBkZGMgaTJjIGFkYXB0ZXIgYnkgbm9kZVxu
Iik7CiAJCXJldHVybiAtRVBST0JFX0RFRkVSOwogCX0KQEAgLTEzOTUsNyArMTM5Nyw3IEBAIHN0
YXRpYyBpbnQgdmM0X2hkbWlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Ug
Km1hc3Rlciwgdm9pZCAqZGF0YSkKIAkJCSBEUk1fTU9ERV9FTkNPREVSX1RNRFMsIE5VTEwpOwog
CWRybV9lbmNvZGVyX2hlbHBlcl9hZGQoaGRtaS0+ZW5jb2RlciwgJnZjNF9oZG1pX2VuY29kZXJf
aGVscGVyX2Z1bmNzKTsKIAotCWhkbWktPmNvbm5lY3RvciA9IHZjNF9oZG1pX2Nvbm5lY3Rvcl9p
bml0KGRybSwgaGRtaS0+ZW5jb2Rlcik7CisJaGRtaS0+Y29ubmVjdG9yID0gdmM0X2hkbWlfY29u
bmVjdG9yX2luaXQoZHJtLCBoZG1pLT5lbmNvZGVyLCBkZGMpOwogCWlmIChJU19FUlIoaGRtaS0+
Y29ubmVjdG9yKSkgewogCQlyZXQgPSBQVFJfRVJSKGhkbWktPmNvbm5lY3Rvcik7CiAJCWdvdG8g
ZXJyX2Rlc3Ryb3lfZW5jb2RlcjsKQEAgLTE0NTIsNyArMTQ1NCw3IEBAIHN0YXRpYyBpbnQgdmM0
X2hkbWlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9p
ZCAqZGF0YSkKIAljbGtfZGlzYWJsZV91bnByZXBhcmUoaGRtaS0+aHNtX2Nsb2NrKTsKIAlwbV9y
dW50aW1lX2Rpc2FibGUoZGV2KTsKIGVycl9wdXRfaTJjOgotCXB1dF9kZXZpY2UoJmhkbWktPmRk
Yy0+ZGV2KTsKKwlwdXRfZGV2aWNlKCZkZGMtPmRldik7CiAKIAlyZXR1cm4gcmV0OwogfQpAQCAt
MTQ2Myw2ICsxNDY1LDcgQEAgc3RhdGljIHZvaWQgdmM0X2hkbWlfdW5iaW5kKHN0cnVjdCBkZXZp
Y2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAogCXN0cnVjdCBkcm1fZGV2aWNlICpkcm0g
PSBkZXZfZ2V0X2RydmRhdGEobWFzdGVyKTsKIAlzdHJ1Y3QgdmM0X2RldiAqdmM0ID0gZHJtLT5k
ZXZfcHJpdmF0ZTsKIAlzdHJ1Y3QgdmM0X2hkbWkgKmhkbWkgPSB2YzQtPmhkbWk7CisJc3RydWN0
IGkyY19hZGFwdGVyICpkZGMgPSBoZG1pLT5jb25uZWN0b3ItPmRkYzsKIAogCWNlY191bnJlZ2lz
dGVyX2FkYXB0ZXIoaGRtaS0+Y2VjX2FkYXApOwogCXZjNF9oZG1pX2Nvbm5lY3Rvcl9kZXN0cm95
KGhkbWktPmNvbm5lY3Rvcik7CkBAIC0xNDcxLDcgKzE0NzQsNyBAQCBzdGF0aWMgdm9pZCB2YzRf
aGRtaV91bmJpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsCiAJ
Y2xrX2Rpc2FibGVfdW5wcmVwYXJlKGhkbWktPmhzbV9jbG9jayk7CiAJcG1fcnVudGltZV9kaXNh
YmxlKGRldik7CiAKLQlwdXRfZGV2aWNlKCZoZG1pLT5kZGMtPmRldik7CisJcHV0X2RldmljZSgm
ZGRjLT5kZXYpOwogCiAJdmM0LT5oZG1pID0gTlVMTDsKIH0KLS0gCjIuMTcuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
