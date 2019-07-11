Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 635AA6552F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 13:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F49C6E191;
	Thu, 11 Jul 2019 11:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F9B6E190;
 Thu, 11 Jul 2019 11:27:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 5F65428B58A
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 01/23] drm: Include ddc adapter pointer in struct
 drm_connector
Date: Thu, 11 Jul 2019 13:26:28 +0200
Message-Id: <5957ae96ee20eed5cfcb8a9619e2f61d71fe227e.1562843413.git.andrzej.p@collabora.com>
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
 Maxime Ripard <maxime.ripard@bootlin.com>, Liviu Dudau <liviu.dudau@arm.com>,
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

QWRkIGdlbmVyaWMgY29kZSB3aGljaCBjcmVhdGVzIHN5bWJvbGljIGxpbmtzIGluIHN5c2ZzLCBw
b2ludGluZyB0byBkZGMKaW50ZXJmYWNlIHVzZWQgYnkgYSBwYXJ0aWN1bGFyIHZpZGVvIG91dHB1
dC4gRm9yIGV4YW1wbGU6CgpscyAtbCAvc3lzL2NsYXNzL2RybS9jYXJkMC1IRE1JLUEtMS9kZGMK
bHJ3eHJ3eHJ3eCAxIHJvb3Qgcm9vdCAwIEp1biAyNCAxMDo0MiAvc3lzL2NsYXNzL2RybS9jYXJk
MC1IRE1JLUEtMS9kZGMgXAoJLT4gLi4vLi4vLi4vLi4vc29jLzEzODgwMDAwLmkyYy9pMmMtMgoK
VGhpcyBtYWtlcyBpdCBlYXN5IGZvciB1c2VyIHRvIGFzc29jaWF0ZSBhIGRpc3BsYXkgd2l0aCBp
dHMgZGRjIGFkYXB0ZXIKYW5kIHVzZSBlLmcuIGRkY3V0aWwgdG8gY29udHJvbCB0aGUgY2hvc2Vu
IG1vbml0b3IuCgpUaGlzIHBhdGNoIGFkZHMgYW4gaTJjX2FkYXB0ZXIgcG9pbnRlciB0byBzdHJ1
Y3QgZHJtX2Nvbm5lY3Rvci4gUGFydGljdWxhcgpkcml2ZXJzIGNhbiB0aGVuIHVzZSBpdCBpbnN0
ZWFkIG9mIHVzaW5nIHRoZWlyIG93biBwcml2YXRlIGluc3RhbmNlLiBJZiBhCmNvbm5lY3RvciBj
b250YWlucyBhIGRkYywgdGhlbiBjcmVhdGUgYSBzeW1ib2xpYyBsaW5rIGluIHN5c2ZzLgoKU2ln
bmVkLW9mZi1ieTogQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29sbGFib3JhLmNv
bT4KQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+ClJldmll
d2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9kcm1fc3lzZnMuYyB8ICA3ICsrKysrKysKIGluY2x1ZGUvZHJtL2RybV9jb25uZWN0
b3IuaCB8IDExICsrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX3N5c2ZzLmMKaW5kZXggYWQxMDgxMGJjOTcyLi4yNmQzNTliMzk3ODUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3lzZnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X3N5c2ZzLmMKQEAgLTI5NCw2ICsyOTQsOSBAQCBpbnQgZHJtX3N5c2ZzX2Nvbm5lY3Rvcl9hZGQo
c3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIAkvKiBMZXQgdXNlcnNwYWNlIGtub3cg
d2UgaGF2ZSBhIG5ldyBjb25uZWN0b3IgKi8KIAlkcm1fc3lzZnNfaG90cGx1Z19ldmVudChkZXYp
OwogCisJaWYgKGNvbm5lY3Rvci0+ZGRjKQorCQlyZXR1cm4gc3lzZnNfY3JlYXRlX2xpbmsoJmNv
bm5lY3Rvci0+a2Rldi0+a29iaiwKKwkJCQkgJmNvbm5lY3Rvci0+ZGRjLT5kZXYua29iaiwgImRk
YyIpOwogCXJldHVybiAwOwogfQogCkBAIC0zMDEsNiArMzA0LDEwIEBAIHZvaWQgZHJtX3N5c2Zz
X2Nvbm5lY3Rvcl9yZW1vdmUoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIHsKIAlp
ZiAoIWNvbm5lY3Rvci0+a2RldikKIAkJcmV0dXJuOworCisJaWYgKGNvbm5lY3Rvci0+ZGRjKQor
CQlzeXNmc19yZW1vdmVfbGluaygmY29ubmVjdG9yLT5rZGV2LT5rb2JqLCAiZGRjIik7CisKIAlE
Uk1fREVCVUcoInJlbW92aW5nIFwiJXNcIiBmcm9tIHN5c2ZzXG4iLAogCQkgIGNvbm5lY3Rvci0+
bmFtZSk7CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCBiL2luY2x1
ZGUvZHJtL2RybV9jb25uZWN0b3IuaAppbmRleCBjYTc0NWQ5ZmVhZjUuLjFhZDNkMWQ1NGJhNyAx
MDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCisrKyBiL2luY2x1ZGUvZHJt
L2RybV9jb25uZWN0b3IuaApAQCAtMjMsNiArMjMsNyBAQAogI2lmbmRlZiBfX0RSTV9DT05ORUNU
T1JfSF9fCiAjZGVmaW5lIF9fRFJNX0NPTk5FQ1RPUl9IX18KIAorI2luY2x1ZGUgPGxpbnV4L2ky
Yy5oPgogI2luY2x1ZGUgPGxpbnV4L2xpc3QuaD4KICNpbmNsdWRlIDxsaW51eC9sbGlzdC5oPgog
I2luY2x1ZGUgPGxpbnV4L2N0eXBlLmg+CkBAIC0xMzA4LDYgKzEzMDksMTYgQEAgc3RydWN0IGRy
bV9jb25uZWN0b3IgewogCSAqIFswXTogcHJvZ3Jlc3NpdmUsIFsxXTogaW50ZXJsYWNlZAogCSAq
LwogCWludCBhdWRpb19sYXRlbmN5WzJdOworCisJLyoqCisJICogQGRkYzogYXNzb2NpYXRlZCBk
ZGMgYWRhcHRlci4KKwkgKiBBIGNvbm5lY3RvciB1c3VhbGx5IGhhcyBpdHMgYXNzb2NpYXRlZCBk
ZGMgYWRhcHRlci4gSWYgYSBkcml2ZXIgdXNlcworCSAqIHRoaXMgZmllbGQsIHRoZW4gYW4gYXBw
cm9wcmlhdGUgc3ltYm9saWMgbGluayBpcyBjcmVhdGVkIGluIGNvbm5lY3RvcgorCSAqIHN5c2Zz
IGRpcmVjdG9yeSB0byBtYWtlIGl0IGVhc3kgZm9yIHRoZSB1c2VyIHRvIHRlbGwgd2hpY2ggaTJj
CisJICogYWRhcHRlciBpcyBmb3IgYSBwYXJ0aWN1bGFyIGRpc3BsYXkuCisJICovCisJc3RydWN0
IGkyY19hZGFwdGVyICpkZGM7CisKIAkvKioKIAkgKiBAbnVsbF9lZGlkX2NvdW50ZXI6IHRyYWNr
IHNpbmtzIHRoYXQgZ2l2ZSB1cyBhbGwgemVyb3MgZm9yIHRoZSBFRElELgogCSAqIE5lZWRlZCB0
byB3b3JrYXJvdW5kIHNvbWUgSFcgYnVncyB3aGVyZSB3ZSBnZXQgYWxsIDBzCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
