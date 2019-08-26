Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C61FF9D6B6
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 21:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E169C6E2DE;
	Mon, 26 Aug 2019 19:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EED6E2CC;
 Mon, 26 Aug 2019 19:28:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 3AC23283D3B
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND 13/14] drm/tilcdc: Provide ddc symlink in connector
 sysfs directory
Date: Mon, 26 Aug 2019 21:25:55 +0200
Message-Id: <0a88317adc94dc5c3a8f24c5e0b152b4870a6aac.1566845537.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1566845537.git.andrzej.p@collabora.com>
References: <cover.1566845537.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1566845537.git.andrzej.p@collabora.com>
References: <cover.1566845537.git.andrzej.p@collabora.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Anthony Koo <Anthony.Koo@amd.com>, linux-samsung-soc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, David Francis <David.Francis@amd.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Mamta Shukla <mamtashukla555@gmail.com>,
 linux-mediatek@lists.infradead.org, Jyri Sarha <jsarha@ti.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx@lists.freedesktop.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgpBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpSZXZpZXdlZC1i
eTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vdGlsY2RjL3RpbGNkY190ZnA0MTAuYyB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS90aWxjZGMvdGlsY2RjX3RmcDQxMC5jIGIvZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90
aWxjZGNfdGZwNDEwLmMKaW5kZXggNTI1ZGMxYzBmMWMxLi40NmQxYjMwY2MxNjQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX3RmcDQxMC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS90aWxjZGMvdGlsY2RjX3RmcDQxMC5jCkBAIC0yMTMsOCArMjEzLDEwIEBAIHN0YXRp
YyBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqdGZwNDEwX2Nvbm5lY3Rvcl9jcmVhdGUoc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwKIAogCWNvbm5lY3RvciA9ICZ0ZnA0MTBfY29ubmVjdG9yLT5iYXNlOwog
Ci0JZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgY29ubmVjdG9yLCAmdGZwNDEwX2Nvbm5lY3Rvcl9m
dW5jcywKLQkJCURSTV9NT0RFX0NPTk5FQ1RPUl9EVklEKTsKKwlkcm1fY29ubmVjdG9yX2luaXRf
d2l0aF9kZGMoZGV2LCBjb25uZWN0b3IsCisJCQkJICAgICZ0ZnA0MTBfY29ubmVjdG9yX2Z1bmNz
LAorCQkJCSAgICBEUk1fTU9ERV9DT05ORUNUT1JfRFZJRCwKKwkJCQkgICAgbW9kLT5pMmMpOwog
CWRybV9jb25uZWN0b3JfaGVscGVyX2FkZChjb25uZWN0b3IsICZ0ZnA0MTBfY29ubmVjdG9yX2hl
bHBlcl9mdW5jcyk7CiAKIAljb25uZWN0b3ItPnBvbGxlZCA9IERSTV9DT05ORUNUT1JfUE9MTF9D
T05ORUNUIHwKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
