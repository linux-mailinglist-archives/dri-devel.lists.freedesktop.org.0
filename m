Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B7ACBEC2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 17:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956BE6EB12;
	Fri,  4 Oct 2019 15:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6286EB12
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 15:14:25 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4017F207FF;
 Fri,  4 Oct 2019 15:14:21 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Lee Jones <lee.jones@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maciej Falkowski <m.falkowski@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-serial@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: arm: samsung: Force clkoutN names to be
 unique in PMU
Date: Fri,  4 Oct 2019 17:14:12 +0200
Message-Id: <20191004151414.8458-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570202065;
 bh=At7Vw3YFrrg3TOqKMg8f1TsgKNBKoiEKL7wq9XiiUKk=;
 h=From:To:Subject:Date:From;
 b=BeGHmF7Rbd6pkfOjo2uCfn8OcrdTdcDJynBCXDiHZNqmgwIE1+aRy4wZQW23eUGGP
 U+RHRG2J0ZC+B7hAvb/Ik0Nsr00FdebTvb84NysQA4HHgL8yfGWaQ2VW+9bCdu7zMd
 kUWdVsOOM75RFDTU0Ja0JGS5R4l69pzZnlhyyzYs=
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNsa291dE4gbmFtZXMgb2YgY2xvY2tzIG11c3QgYmUgdW5pcXVlIGJlY2F1c2UgdGhleSBy
ZXByZXNlbnQKdW5pcXVlIGlucHV0cyBvZiBjbG9jayBtdWx0aXBsZXhlci4KClNpZ25lZC1vZmYt
Ynk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KLS0tCiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3NhbXN1bmcvcG11LnlhbWwgfCA2ICsrKystLQog
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3NhbXN1bmcvcG11Lnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3NhbXN1bmcvcG11Lnlh
bWwKaW5kZXggNzNiNTZmYzViZjU4Li5kOGUwMzcxNmY1ZDIgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc2Ftc3VuZy9wbXUueWFtbAorKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3NhbXN1bmcvcG11LnlhbWwKQEAgLTUz
LDggKzUzLDEwIEBAIHByb3BlcnRpZXM6CiAgICAgICBMaXN0IG9mIGNsb2NrIG5hbWVzIGZvciBw
YXJ0aWN1bGFyIENMS09VVCBtdXggaW5wdXRzCiAgICAgbWluSXRlbXM6IDEKICAgICBtYXhJdGVt
czogMzIKLSAgICBpdGVtczoKLSAgICAgIHBhdHRlcm46ICdeY2xrb3V0KFswLTldfFsxMl1bMC05
XXwzWzAtMV0pJCcKKyAgICBhbGxPZjoKKyAgICAgIC0gaXRlbXM6CisgICAgICAgICAgcGF0dGVy
bjogJ15jbGtvdXQoWzAtOV18WzEyXVswLTldfDNbMC0xXSkkJworICAgICAgLSB1bmlxdWVJdGVt
czogdHJ1ZQogCiAgIGNsb2NrczoKICAgICBtaW5JdGVtczogMQotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
