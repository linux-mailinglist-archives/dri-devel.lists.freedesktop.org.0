Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1E477047
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 19:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA556EE17;
	Fri, 26 Jul 2019 17:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491986EE17;
 Fri, 26 Jul 2019 17:29:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 30AA227EA8C
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 24/24] drm/i915: Provide ddc symlink in hdmi connector
 sysfs directory
Date: Fri, 26 Jul 2019 19:23:18 +0200
Message-Id: <e2dd9c085e889f827ac281f9d9ce2a8916ae0200.1564161140.git.andrzej.p@collabora.com>
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
 David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>,
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
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jIHwgMTIg
KysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRt
aS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMKaW5kZXggOWJm
MjhkZTEwNDAxLi4yNjhmMWJkMjBiOTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfaGRtaS5jCkBAIC0zMDY3LDYgKzMwNjcsNyBAQCB2b2lkIGludGVsX2hkbWlfaW5pdF9j
b25uZWN0b3Ioc3RydWN0IGludGVsX2RpZ2l0YWxfcG9ydCAqaW50ZWxfZGlnX3BvcnQsCiAJc3Ry
dWN0IGludGVsX2VuY29kZXIgKmludGVsX2VuY29kZXIgPSAmaW50ZWxfZGlnX3BvcnQtPmJhc2U7
CiAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGludGVsX2VuY29kZXItPmJhc2UuZGV2OwogCXN0
cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IHRvX2k5MTUoZGV2KTsKKwlzdHJ1Y3Qg
aTJjX2FkYXB0ZXIgKmRkYzsKIAllbnVtIHBvcnQgcG9ydCA9IGludGVsX2VuY29kZXItPnBvcnQ7
CiAKIAlEUk1fREVCVUdfS01TKCJBZGRpbmcgSERNSSBjb25uZWN0b3Igb24gcG9ydCAlY1xuIiwK
QEAgLTMwNzcsOCArMzA3OCwxMyBAQCB2b2lkIGludGVsX2hkbWlfaW5pdF9jb25uZWN0b3Ioc3Ry
dWN0IGludGVsX2RpZ2l0YWxfcG9ydCAqaW50ZWxfZGlnX3BvcnQsCiAJCSBpbnRlbF9kaWdfcG9y
dC0+bWF4X2xhbmVzLCBwb3J0X25hbWUocG9ydCkpKQogCQlyZXR1cm47CiAKLQlkcm1fY29ubmVj
dG9yX2luaXQoZGV2LCBjb25uZWN0b3IsICZpbnRlbF9oZG1pX2Nvbm5lY3Rvcl9mdW5jcywKLQkJ
CSAgIERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQSk7CisJaW50ZWxfaGRtaS0+ZGRjX2J1cyA9IGlu
dGVsX2hkbWlfZGRjX3BpbihkZXZfcHJpdiwgcG9ydCk7CisJZGRjID0gaW50ZWxfZ21idXNfZ2V0
X2FkYXB0ZXIoZGV2X3ByaXYsIGludGVsX2hkbWktPmRkY19idXMpOworCisJZHJtX2Nvbm5lY3Rv
cl9pbml0X3dpdGhfZGRjKGRldiwgY29ubmVjdG9yLAorCQkJCSAgICAmaW50ZWxfaGRtaV9jb25u
ZWN0b3JfZnVuY3MsCisJCQkJICAgIERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQSwKKwkJCQkgICAg
ZGRjKTsKIAlkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQoY29ubmVjdG9yLCAmaW50ZWxfaGRtaV9j
b25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKIAogCWNvbm5lY3Rvci0+aW50ZXJsYWNlX2FsbG93ZWQg
PSAxOwpAQCAtMzA4OCw4ICszMDk0LDYgQEAgdm9pZCBpbnRlbF9oZG1pX2luaXRfY29ubmVjdG9y
KHN0cnVjdCBpbnRlbF9kaWdpdGFsX3BvcnQgKmludGVsX2RpZ19wb3J0LAogCWlmIChJTlRFTF9H
RU4oZGV2X3ByaXYpID49IDEwIHx8IElTX0dFTUlOSUxBS0UoZGV2X3ByaXYpKQogCQljb25uZWN0
b3ItPnljYmNyXzQyMF9hbGxvd2VkID0gdHJ1ZTsKIAotCWludGVsX2hkbWktPmRkY19idXMgPSBp
bnRlbF9oZG1pX2RkY19waW4oZGV2X3ByaXYsIHBvcnQpOwotCiAJaWYgKFdBUk5fT04ocG9ydCA9
PSBQT1JUX0EpKQogCQlyZXR1cm47CiAJaW50ZWxfZW5jb2Rlci0+aHBkX3BpbiA9IGludGVsX2hw
ZF9waW5fZGVmYXVsdChkZXZfcHJpdiwgcG9ydCk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
