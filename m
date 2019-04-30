Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5E1105CA
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2019 09:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74A68936E;
	Wed,  1 May 2019 07:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D0189105
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 18:05:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: gportay) with ESMTPSA id 67D3F282FE4
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@collabora.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [RFC 4/4] arm64: dts: rockchip: Set the display-subsystem devfreq
Date: Tue, 30 Apr 2019 14:05:24 -0400
Message-Id: <20190430180524.22710-5-gael.portay@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190430180524.22710-1-gael.portay@collabora.com>
References: <20190430180524.22710-1-gael.portay@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 01 May 2019 07:18:43 +0000
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
Cc: Lin Huang <hl@rock-chips.com>, Derek Basehore <dbasehore@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSBEeW5hbWljIE1lbW9yeSBDb250cm9sbGVyIGFzIHRoZSBkaXNwbGF5LXN1YnN5c3Rl
bSdzIGRldmZyZXEKZGV2aWNlLgoKU2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBv
cnRheUBjb2xsYWJvcmEuY29tPgotLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmsz
Mzk5LWdydS5kdHNpIHwgNCArKysrCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzM5
OS5kdHNpICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazMz
OTktZ3J1LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzM5OS1ncnUuZHRz
aQppbmRleCA0MGU3ODE4NjU2MGIuLmE1Y2JiYzA4ZjdlMSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02
NC9ib290L2R0cy9yb2NrY2hpcC9yazMzOTktZ3J1LmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290
L2R0cy9yb2NrY2hpcC9yazMzOTktZ3J1LmR0c2kKQEAgLTM3NSw2ICszNzUsMTAgQEAKIAkJPDIw
MDAwMDAwMD47CiB9OwogCismZGlzcGxheV9zdWJzeXN0ZW0geworCWRldmZyZXEgPSA8JmRtYz47
Cit9OworCiAmZW1tY19waHkgewogCXN0YXR1cyA9ICJva2F5IjsKIH07CmRpZmYgLS1naXQgYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzM5OS5kdHNpIGIvYXJjaC9hcm02NC9ib290
L2R0cy9yb2NrY2hpcC9yazMzOTkuZHRzaQppbmRleCA4N2VlMDg0ZmFjODkuLjI1M2I0NzYxNjNm
ZCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazMzOTkuZHRzaQor
KysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzM5OS5kdHNpCkBAIC0xNTUsNyAr
MTU1LDcgQEAKIAkJfTsKIAl9OwogCi0JZGlzcGxheS1zdWJzeXN0ZW0geworCWRpc3BsYXlfc3Vi
c3lzdGVtOiBkaXNwbGF5LXN1YnN5c3RlbSB7CiAJCWNvbXBhdGlibGUgPSAicm9ja2NoaXAsZGlz
cGxheS1zdWJzeXN0ZW0iOwogCQlwb3J0cyA9IDwmdm9wbF9vdXQ+LCA8JnZvcGJfb3V0PjsKIAl9
OwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
