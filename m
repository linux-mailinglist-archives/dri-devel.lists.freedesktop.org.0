Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3338165559
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 13:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F028A6E1BA;
	Thu, 11 Jul 2019 11:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D013D6E1B1;
 Thu, 11 Jul 2019 11:29:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 77EBF28B554
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 08/23] drm/tegra: Provide ddc symlink in output connector
 sysfs directory
Date: Thu, 11 Jul 2019 13:26:35 +0200
Message-Id: <3cdef66e1360570b48d7b74b512262f4081037e3.1562843413.git.andrzej.p@collabora.com>
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uaCAgICB8ICAxIC0KIGRyaXZlcnMv
Z3B1L2RybS90ZWdyYS9vdXRwdXQuYyB8IDEyICsrKysrKy0tLS0tLQogZHJpdmVycy9ncHUvZHJt
L3RlZ3JhL3Nvci5jICAgIHwgIDYgKysrLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3Jh
L2RybS5oIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5oCmluZGV4IDg2ZGFhMTlmY2YyNC4u
OWJmNzJiY2QzZWMxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmgKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5oCkBAIC0xMjAsNyArMTIwLDYgQEAgc3RydWN0
IHRlZ3JhX291dHB1dCB7CiAJc3RydWN0IGRldmljZSAqZGV2OwogCiAJc3RydWN0IGRybV9wYW5l
bCAqcGFuZWw7Ci0Jc3RydWN0IGkyY19hZGFwdGVyICpkZGM7CiAJY29uc3Qgc3RydWN0IGVkaWQg
KmVkaWQ7CiAJc3RydWN0IGNlY19ub3RpZmllciAqY2VjOwogCXVuc2lnbmVkIGludCBocGRfaXJx
OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL291dHB1dC5jIGIvZHJpdmVycy9n
cHUvZHJtL3RlZ3JhL291dHB1dC5jCmluZGV4IDI3NGNiOTU1ZTJlMS4uMGI1MDM3YTI5YzYzIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvb3V0cHV0LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3RlZ3JhL291dHB1dC5jCkBAIC0zMCw4ICszMCw4IEBAIGludCB0ZWdyYV9vdXRwdXRf
Y29ubmVjdG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCiAJ
aWYgKG91dHB1dC0+ZWRpZCkKIAkJZWRpZCA9IGttZW1kdXAob3V0cHV0LT5lZGlkLCBzaXplb2Yo
KmVkaWQpLCBHRlBfS0VSTkVMKTsKLQllbHNlIGlmIChvdXRwdXQtPmRkYykKLQkJZWRpZCA9IGRy
bV9nZXRfZWRpZChjb25uZWN0b3IsIG91dHB1dC0+ZGRjKTsKKwllbHNlIGlmIChjb25uZWN0b3It
PmRkYykKKwkJZWRpZCA9IGRybV9nZXRfZWRpZChjb25uZWN0b3IsIGNvbm5lY3Rvci0+ZGRjKTsK
IAogCWNlY19ub3RpZmllcl9zZXRfcGh5c19hZGRyX2Zyb21fZWRpZChvdXRwdXQtPmNlYywgZWRp
ZCk7CiAJZHJtX2Nvbm5lY3Rvcl91cGRhdGVfZWRpZF9wcm9wZXJ0eShjb25uZWN0b3IsIGVkaWQp
OwpAQCAtMTExLDggKzExMSw4IEBAIGludCB0ZWdyYV9vdXRwdXRfcHJvYmUoc3RydWN0IHRlZ3Jh
X291dHB1dCAqb3V0cHV0KQogCiAJZGRjID0gb2ZfcGFyc2VfcGhhbmRsZShvdXRwdXQtPm9mX25v
ZGUsICJudmlkaWEsZGRjLWkyYy1idXMiLCAwKTsKIAlpZiAoZGRjKSB7Ci0JCW91dHB1dC0+ZGRj
ID0gb2ZfZmluZF9pMmNfYWRhcHRlcl9ieV9ub2RlKGRkYyk7Ci0JCWlmICghb3V0cHV0LT5kZGMp
IHsKKwkJb3V0cHV0LT5jb25uZWN0b3IuZGRjID0gb2ZfZmluZF9pMmNfYWRhcHRlcl9ieV9ub2Rl
KGRkYyk7CisJCWlmICghb3V0cHV0LT5jb25uZWN0b3IuZGRjKSB7CiAJCQllcnIgPSAtRVBST0JF
X0RFRkVSOwogCQkJb2Zfbm9kZV9wdXQoZGRjKTsKIAkJCXJldHVybiBlcnI7CkBAIC0xNzQsOCAr
MTc0LDggQEAgdm9pZCB0ZWdyYV9vdXRwdXRfcmVtb3ZlKHN0cnVjdCB0ZWdyYV9vdXRwdXQgKm91
dHB1dCkKIAlpZiAob3V0cHV0LT5ocGRfZ3BpbykKIAkJZnJlZV9pcnEob3V0cHV0LT5ocGRfaXJx
LCBvdXRwdXQpOwogCi0JaWYgKG91dHB1dC0+ZGRjKQotCQlwdXRfZGV2aWNlKCZvdXRwdXQtPmRk
Yy0+ZGV2KTsKKwlpZiAob3V0cHV0LT5jb25uZWN0b3IuZGRjKQorCQlwdXRfZGV2aWNlKCZvdXRw
dXQtPmNvbm5lY3Rvci5kZGMtPmRldik7CiB9CiAKIGludCB0ZWdyYV9vdXRwdXRfaW5pdChzdHJ1
Y3QgZHJtX2RldmljZSAqZHJtLCBzdHJ1Y3QgdGVncmFfb3V0cHV0ICpvdXRwdXQpCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEv
c29yLmMKaW5kZXggNGZmZTM3OTRlNmQzLi43N2U2MWY5OGRlMDcgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS90ZWdyYS9zb3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMK
QEAgLTIzMTEsNyArMjMxMSw3IEBAIHN0YXRpYyB2b2lkIHRlZ3JhX3Nvcl9oZG1pX2Rpc2FibGVf
c2NyYW1ibGluZyhzdHJ1Y3QgdGVncmFfc29yICpzb3IpCiAKIHN0YXRpYyB2b2lkIHRlZ3JhX3Nv
cl9oZG1pX3NjZGNfZGlzYWJsZShzdHJ1Y3QgdGVncmFfc29yICpzb3IpCiB7Ci0Jc3RydWN0IGky
Y19hZGFwdGVyICpkZGMgPSBzb3ItPm91dHB1dC5kZGM7CisJc3RydWN0IGkyY19hZGFwdGVyICpk
ZGMgPSBzb3ItPm91dHB1dC5jb25uZWN0b3IuZGRjOwogCiAJZHJtX3NjZGNfc2V0X2hpZ2hfdG1k
c19jbG9ja19yYXRpbyhkZGMsIGZhbHNlKTsKIAlkcm1fc2NkY19zZXRfc2NyYW1ibGluZyhkZGMs
IGZhbHNlKTsKQEAgLTIzMzksNyArMjMzOSw3IEBAIHN0YXRpYyB2b2lkIHRlZ3JhX3Nvcl9oZG1p
X2VuYWJsZV9zY3JhbWJsaW5nKHN0cnVjdCB0ZWdyYV9zb3IgKnNvcikKIAogc3RhdGljIHZvaWQg
dGVncmFfc29yX2hkbWlfc2NkY19lbmFibGUoc3RydWN0IHRlZ3JhX3NvciAqc29yKQogewotCXN0
cnVjdCBpMmNfYWRhcHRlciAqZGRjID0gc29yLT5vdXRwdXQuZGRjOworCXN0cnVjdCBpMmNfYWRh
cHRlciAqZGRjID0gc29yLT5vdXRwdXQuY29ubmVjdG9yLmRkYzsKIAogCWRybV9zY2RjX3NldF9o
aWdoX3RtZHNfY2xvY2tfcmF0aW8oZGRjLCB0cnVlKTsKIAlkcm1fc2NkY19zZXRfc2NyYW1ibGlu
ZyhkZGMsIHRydWUpOwpAQCAtMjM1MCw3ICsyMzUwLDcgQEAgc3RhdGljIHZvaWQgdGVncmFfc29y
X2hkbWlfc2NkY19lbmFibGUoc3RydWN0IHRlZ3JhX3NvciAqc29yKQogc3RhdGljIHZvaWQgdGVn
cmFfc29yX2hkbWlfc2NkY193b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKIHsKIAlzdHJ1
Y3QgdGVncmFfc29yICpzb3IgPSBjb250YWluZXJfb2Yod29yaywgc3RydWN0IHRlZ3JhX3Nvciwg
c2NkYy53b3JrKTsKLQlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRkYyA9IHNvci0+b3V0cHV0LmRkYzsK
KwlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRkYyA9IHNvci0+b3V0cHV0LmNvbm5lY3Rvci5kZGM7CiAK
IAlpZiAoIWRybV9zY2RjX2dldF9zY3JhbWJsaW5nX3N0YXR1cyhkZGMpKSB7CiAJCURSTV9ERUJV
R19LTVMoIlNDREMgbm90IHNjcmFtYmxlZFxuIik7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
