Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61969B694C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 19:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8746F5BF;
	Wed, 18 Sep 2019 17:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7146F5C1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 17:32:44 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7847C208C0;
 Wed, 18 Sep 2019 17:32:38 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>, Matt Mackall <mpm@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-tegra@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-crypto@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v2 6/8] dt-bindings: watchdog: Add missing clocks requirement
 in Samsung SoC watchdog
Date: Wed, 18 Sep 2019 19:31:39 +0200
Message-Id: <20190918173141.4314-6-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190918173141.4314-1-krzk@kernel.org>
References: <20190918173141.4314-1-krzk@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568827964;
 bh=842m/JSo8zkhqWTjvGIQQMCBzFCNxClDHEXRC5hvQrU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=imfD8ZeFL3JfbWKLBOl0g4IXKqnOv8ebaSBXNzLB3QMI1t3nujlYdNlQj2AOElGSK
 0sGzh2M1gdLRgj3EtYl3FCRICCDfqgMC9IAmAXXD6Y8ZDjz66yLkYxctPPVkSNPwwe
 djNwKk2ojpcu/k/biiusrFHlZ5VLQm3LpFj3nQDI=
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFNhbXN1bmcgU29DIHdhdGNoZG9nIGRyaXZlciBhbHdheXMgcmVxdWlyZWQgcHJvdmlkaW5n
IGEgY2xvY2sKKGVpdGhlciB0aHJvdWdoIHBsYXRmb3JtIGRhdGEgb3IgZnJvbSBEVCkuICBIb3dl
dmVyIHdoZW4gYmluZGluZ3Mgd2VyZQphZGRlZCBpbiBjb21taXQgOTQ4N2E5Y2M3MTQwICgid2F0
Y2hkb2c6IHMzYzI0MTA6IEFkZCBzdXBwb3J0IGZvciBkZXZpY2UKdHJlZSBiYXNlZCBwcm9iZSIp
LCB0aGV5IG1pc3NlZCB0aGUgcmVxdWlyZW1lbnQgb2YgY2xvY2suCgpTaWduZWQtb2ZmLWJ5OiBL
cnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+ClJldmlld2VkLWJ5OiBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPgoKLS0tCgpDaGFuZ2VzIHNpbmNlIHYxOgoxLiBJbmRlbnQg
ZXhhbXBsZSB3aXRoIGZvdXIgc3BhY2VzIChtb3JlIHJlYWRhYmxlKSwKMi4gQWRkIGFsc28gbWlz
c2luZyByZXF1aXJlZCBlbnRyaWVzIGZvciBjbG9ja3MuCi0tLQogLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3Mvd2F0Y2hkb2cvc2Ftc3VuZy13ZHQueWFtbCAgICAgICAgfCA5ICsrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9zYW1zdW5nLXdkdC55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL3NhbXN1bmctd2R0LnlhbWwKaW5kZXgg
M2VhM2M5ZmU4MzkwLi4zMTFmOWRjODNmZGIgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9zYW1zdW5nLXdkdC55YW1sCisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9zYW1zdW5nLXdkdC55YW1sCkBAIC0y
Niw2ICsyNiwxMyBAQCBwcm9wZXJ0aWVzOgogICByZWc6CiAgICAgbWF4SXRlbXM6IDEKIAorICBj
bG9ja3M6CisgICAgbWF4SXRlbXM6IDEKKworICBjbG9jay1uYW1lczoKKyAgICBpdGVtczoKKyAg
ICAgIC0gY29uc3Q6IHdhdGNoZG9nCisKICAgaW50ZXJydXB0czoKICAgICBtYXhJdGVtczogMQog
CkBAIC00MCw2ICs0Nyw4IEBAIHByb3BlcnRpZXM6CiAKIHJlcXVpcmVkOgogICAtIGNvbXBhdGli
bGUKKyAgLSBjbG9ja3MKKyAgLSBjbG9jay1uYW1lcwogICAtIGludGVycnVwdHMKICAgLSByZWcK
IAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
