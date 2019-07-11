Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0614365575
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 13:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DC589233;
	Thu, 11 Jul 2019 11:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60D489233;
 Thu, 11 Jul 2019 11:30:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 54ECF28B554
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 13/23] drm: zte: Provide ddc symlink in vga connector sysfs
 directory
Date: Thu, 11 Jul 2019 13:26:40 +0200
Message-Id: <9cdd2fc46dbcb6b596786e5a12b7176c77a38d78.1562843413.git.andrzej.p@collabora.com>
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
 linux-arm-kernel@lists.infradead.org, Enrico Weigelt <info@metux.net>,
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS96dGUvenhfdmdhLmMgfCAyNSArKysrKysrKystLS0t
LS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0venRlL3p4X3ZnYS5jIGIvZHJpdmVy
cy9ncHUvZHJtL3p0ZS96eF92Z2EuYwppbmRleCAxNjM0YTA4NzA3ZmIuLmEzYTRkNjk4Mjg4OCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3p0ZS96eF92Z2EuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0venRlL3p4X3ZnYS5jCkBAIC0yMywxNSArMjMsMTEgQEAgc3RydWN0IHp4X3ZnYV9wd3Jj
dHJsIHsKIAl1MzIgbWFzazsKIH07CiAKLXN0cnVjdCB6eF92Z2FfaTJjIHsKLQlzdHJ1Y3QgaTJj
X2FkYXB0ZXIgYWRhcDsKLQlzdHJ1Y3QgbXV0ZXggbG9jazsKLX07Ci0KIHN0cnVjdCB6eF92Z2Eg
ewogCXN0cnVjdCBkcm1fY29ubmVjdG9yIGNvbm5lY3RvcjsKIAlzdHJ1Y3QgZHJtX2VuY29kZXIg
ZW5jb2RlcjsKLQlzdHJ1Y3QgenhfdmdhX2kyYyAqZGRjOworCS8qIHByb3RlY3RzIGRkYyBhY2Nl
c3MgKi8KKwlzdHJ1Y3QgbXV0ZXggZGRjX2xvY2s7CiAJc3RydWN0IGRldmljZSAqZGV2OwogCXZv
aWQgX19pb21lbSAqbW1pbzsKIAlzdHJ1Y3QgY2xrICppMmNfd2NsazsKQEAgLTg2LDcgKzgyLDcg
QEAgc3RhdGljIGludCB6eF92Z2FfY29ubmVjdG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5l
Y3RvciAqY29ubmVjdG9yKQogCSAqLwogCXp4X3dyaXRlbCh2Z2EtPm1taW8gKyBWR0FfQVVUT19E
RVRFQ1RfU0VMLCAwKTsKIAotCWVkaWQgPSBkcm1fZ2V0X2VkaWQoY29ubmVjdG9yLCAmdmdhLT5k
ZGMtPmFkYXApOworCWVkaWQgPSBkcm1fZ2V0X2VkaWQoY29ubmVjdG9yLCBjb25uZWN0b3ItPmRk
Yyk7CiAJaWYgKCFlZGlkKSB7CiAJCS8qCiAJCSAqIElmIEVESUQgcmVhZGluZyBmYWlscywgd2Ug
c2V0IHRoZSBkZXZpY2Ugc3RhdGUgaW50bwpAQCAtMjgyLDExICsyNzgsMTAgQEAgc3RhdGljIGlu
dCB6eF92Z2FfaTJjX3hmZXIoc3RydWN0IGkyY19hZGFwdGVyICphZGFwLCBzdHJ1Y3QgaTJjX21z
ZyAqbXNncywKIAkJCSAgIGludCBudW0pCiB7CiAJc3RydWN0IHp4X3ZnYSAqdmdhID0gaTJjX2dl
dF9hZGFwZGF0YShhZGFwKTsKLQlzdHJ1Y3QgenhfdmdhX2kyYyAqZGRjID0gdmdhLT5kZGM7CiAJ
aW50IHJldCA9IDA7CiAJaW50IGk7CiAKLQltdXRleF9sb2NrKCZkZGMtPmxvY2spOworCW11dGV4
X2xvY2soJnZnYS0+ZGRjX2xvY2spOwogCiAJZm9yIChpID0gMDsgaSA8IG51bTsgaSsrKSB7CiAJ
CWlmIChtc2dzW2ldLmZsYWdzICYgSTJDX01fUkQpCkBAIC0zMDEsNyArMjk2LDcgQEAgc3RhdGlj
IGludCB6eF92Z2FfaTJjX3hmZXIoc3RydWN0IGkyY19hZGFwdGVyICphZGFwLCBzdHJ1Y3QgaTJj
X21zZyAqbXNncywKIAlpZiAoIXJldCkKIAkJcmV0ID0gbnVtOwogCi0JbXV0ZXhfdW5sb2NrKCZk
ZGMtPmxvY2spOworCW11dGV4X3VubG9jaygmdmdhLT5kZGNfbG9jayk7CiAKIAlyZXR1cm4gcmV0
OwogfQpAQCAtMzIwLDE3ICszMTUsMTUgQEAgc3RhdGljIGludCB6eF92Z2FfZGRjX3JlZ2lzdGVy
KHN0cnVjdCB6eF92Z2EgKnZnYSkKIHsKIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSB2Z2EtPmRldjsK
IAlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXA7Ci0Jc3RydWN0IHp4X3ZnYV9pMmMgKmRkYzsKIAlp
bnQgcmV0OwogCi0JZGRjID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpkZGMpLCBHRlBfS0VS
TkVMKTsKLQlpZiAoIWRkYykKKwlhZGFwID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCphZGFw
KSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFhZGFwKQogCQlyZXR1cm4gLUVOT01FTTsKIAotCXZnYS0+
ZGRjID0gZGRjOwotCW11dGV4X2luaXQoJmRkYy0+bG9jayk7CisJdmdhLT5jb25uZWN0b3IuZGRj
ID0gYWRhcDsKKwltdXRleF9pbml0KCZ2Z2EtPmRkY19sb2NrKTsKIAotCWFkYXAgPSAmZGRjLT5h
ZGFwOwogCWFkYXAtPm93bmVyID0gVEhJU19NT0RVTEU7CiAJYWRhcC0+Y2xhc3MgPSBJMkNfQ0xB
U1NfRERDOwogCWFkYXAtPmRldi5wYXJlbnQgPSBkZXY7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
