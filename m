Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4944B76FEE
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 19:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263A36EDE5;
	Fri, 26 Jul 2019 17:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF706EDE5;
 Fri, 26 Jul 2019 17:25:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id C6A8927EA8C
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 09/24] drm/tegra: Provide ddc symlink in output connector
 sysfs directory
Date: Fri, 26 Jul 2019 19:23:03 +0200
Message-Id: <e48025c100e419c4f467da764c79bfc92ca16449.1564161140.git.andrzej.p@collabora.com>
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
 linux-arm-msm@vger.kernel.org, Mamta Shukla <mamtashukla555@gmail.com>,
 linux-mediatek@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9oZG1pLmMgfCA3ICsrKystLS0KIGRyaXZl
cnMvZ3B1L2RybS90ZWdyYS9zb3IuYyAgfCA3ICsrKystLS0KIDIgZmlsZXMgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS90ZWdyYS9oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvaGRtaS5jCmluZGV4IDMzNGM0
ZDdkMjM4Yi4uNDE2YTI4NjJhODRiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEv
aGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9oZG1pLmMKQEAgLTE0MjUsOSArMTQy
NSwxMCBAQCBzdGF0aWMgaW50IHRlZ3JhX2hkbWlfaW5pdChzdHJ1Y3QgaG9zdDF4X2NsaWVudCAq
Y2xpZW50KQogCiAJaGRtaS0+b3V0cHV0LmRldiA9IGNsaWVudC0+ZGV2OwogCi0JZHJtX2Nvbm5l
Y3Rvcl9pbml0KGRybSwgJmhkbWktPm91dHB1dC5jb25uZWN0b3IsCi0JCQkgICAmdGVncmFfaGRt
aV9jb25uZWN0b3JfZnVuY3MsCi0JCQkgICBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEpOworCWRy
bV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYyhkcm0sICZoZG1pLT5vdXRwdXQuY29ubmVjdG9yLAor
CQkJCSAgICAmdGVncmFfaGRtaV9jb25uZWN0b3JfZnVuY3MsCisJCQkJICAgIERSTV9NT0RFX0NP
Tk5FQ1RPUl9IRE1JQSwKKwkJCQkgICAgaGRtaS0+b3V0cHV0LmRkYyk7CiAJZHJtX2Nvbm5lY3Rv
cl9oZWxwZXJfYWRkKCZoZG1pLT5vdXRwdXQuY29ubmVjdG9yLAogCQkJCSAmdGVncmFfaGRtaV9j
b25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKIAloZG1pLT5vdXRwdXQuY29ubmVjdG9yLmRwbXMgPSBE
Uk1fTU9ERV9EUE1TX09GRjsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3Iu
YyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYwppbmRleCA0ZmZlMzc5NGU2ZDMuLjNhNjll
Mzg3YzYyZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYwpAQCAtMjgzMiw5ICsyODMyLDEwIEBAIHN0YXRpYyBp
bnQgdGVncmFfc29yX2luaXQoc3RydWN0IGhvc3QxeF9jbGllbnQgKmNsaWVudCkKIAogCXNvci0+
b3V0cHV0LmRldiA9IHNvci0+ZGV2OwogCi0JZHJtX2Nvbm5lY3Rvcl9pbml0KGRybSwgJnNvci0+
b3V0cHV0LmNvbm5lY3RvciwKLQkJCSAgICZ0ZWdyYV9zb3JfY29ubmVjdG9yX2Z1bmNzLAotCQkJ
ICAgY29ubmVjdG9yKTsKKwlkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMoZHJtLCAmc29yLT5v
dXRwdXQuY29ubmVjdG9yLAorCQkJCSAgICAmdGVncmFfc29yX2Nvbm5lY3Rvcl9mdW5jcywKKwkJ
CQkgICAgY29ubmVjdG9yLAorCQkJCSAgICBzb3ItPm91dHB1dC5kZGMpOwogCWRybV9jb25uZWN0
b3JfaGVscGVyX2FkZCgmc29yLT5vdXRwdXQuY29ubmVjdG9yLAogCQkJCSAmdGVncmFfc29yX2Nv
bm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwogCXNvci0+b3V0cHV0LmNvbm5lY3Rvci5kcG1zID0gRFJN
X01PREVfRFBNU19PRkY7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
