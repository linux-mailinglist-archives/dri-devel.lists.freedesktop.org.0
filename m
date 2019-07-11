Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6F165565
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 13:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A136E1BC;
	Thu, 11 Jul 2019 11:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2F76E17E;
 Thu, 11 Jul 2019 11:29:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id E207D28B554
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 10/23] drm/imx: imx-tve: Provide ddc symlink in connector's
 sysfs
Date: Thu, 11 Jul 2019 13:26:37 +0200
Message-Id: <f19b4279d73c64a55aa27955fdbb20f34e42125d.1562843413.git.andrzej.p@collabora.com>
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
 Enrico Weigelt <info@metux.net>, amd-gfx@lists.freedesktop.org,
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pbXgvaW14LXR2ZS5jIHwgOCArKystLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaW14L2lteC10dmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9pbXgvaW14
LXR2ZS5jCmluZGV4IGU3MjVhZjhhMDAyNS4uYjhiZWU0ZTFmMTY5IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaW14L2lteC10dmUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaW14L2lteC10
dmUuYwpAQCAtMTA5LDcgKzEwOSw2IEBAIHN0cnVjdCBpbXhfdHZlIHsKIAogCXN0cnVjdCByZWdt
YXAgKnJlZ21hcDsKIAlzdHJ1Y3QgcmVndWxhdG9yICpkYWNfcmVnOwotCXN0cnVjdCBpMmNfYWRh
cHRlciAqZGRjOwogCXN0cnVjdCBjbGsgKmNsazsKIAlzdHJ1Y3QgY2xrICpkaV9zZWxfY2xrOwog
CXN0cnVjdCBjbGtfaHcgY2xrX2h3X2RpOwpAQCAtMjE4LDE0ICsyMTcsMTMgQEAgc3RhdGljIGlu
dCB0dmVfc2V0dXBfdmdhKHN0cnVjdCBpbXhfdHZlICp0dmUpCiAKIHN0YXRpYyBpbnQgaW14X3R2
ZV9jb25uZWN0b3JfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiB7
Ci0Jc3RydWN0IGlteF90dmUgKnR2ZSA9IGNvbl90b190dmUoY29ubmVjdG9yKTsKIAlzdHJ1Y3Qg
ZWRpZCAqZWRpZDsKIAlpbnQgcmV0ID0gMDsKIAotCWlmICghdHZlLT5kZGMpCisJaWYgKCFjb25u
ZWN0b3ItPmRkYykKIAkJcmV0dXJuIDA7CiAKLQllZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3Rv
ciwgdHZlLT5kZGMpOworCWVkaWQgPSBkcm1fZ2V0X2VkaWQoY29ubmVjdG9yLCBjb25uZWN0b3It
PmRkYyk7CiAJaWYgKGVkaWQpIHsKIAkJZHJtX2Nvbm5lY3Rvcl91cGRhdGVfZWRpZF9wcm9wZXJ0
eShjb25uZWN0b3IsIGVkaWQpOwogCQlyZXQgPSBkcm1fYWRkX2VkaWRfbW9kZXMoY29ubmVjdG9y
LCBlZGlkKTsKQEAgLTU1MSw3ICs1NDksNyBAQCBzdGF0aWMgaW50IGlteF90dmVfYmluZChzdHJ1
Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKIAogCWRk
Y19ub2RlID0gb2ZfcGFyc2VfcGhhbmRsZShucCwgImRkYy1pMmMtYnVzIiwgMCk7CiAJaWYgKGRk
Y19ub2RlKSB7Ci0JCXR2ZS0+ZGRjID0gb2ZfZmluZF9pMmNfYWRhcHRlcl9ieV9ub2RlKGRkY19u
b2RlKTsKKwkJdHZlLT5jb25uZWN0b3IuZGRjID0gb2ZfZmluZF9pMmNfYWRhcHRlcl9ieV9ub2Rl
KGRkY19ub2RlKTsKIAkJb2Zfbm9kZV9wdXQoZGRjX25vZGUpOwogCX0KIAotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
