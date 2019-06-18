Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9844AAA3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 21:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942746E21E;
	Tue, 18 Jun 2019 19:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302226E21D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 19:05:49 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D84F21530;
 Tue, 18 Jun 2019 19:05:44 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kukjin Kim <kgene@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Olof Johansson <olof@lixom.net>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [RFT 01/10] dt-bindings: gpu: mali: Add Samsung compatibles for
 Midgard and Utgard
Date: Tue, 18 Jun 2019 21:05:25 +0200
Message-Id: <20190618190534.4951-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618190534.4951-1-krzk@kernel.org>
References: <20190618190534.4951-1-krzk@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560884749;
 bh=BvA/9DF1WByazKjkGl4tvLr+zpiufLyyUe+O5JplvCg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LyfwHlcxCBc3ms/kUd8Tw2+f+1Fe1vVA+hpUQYSD0AUGW94f1PXLud4tgspSo49op
 dLx48kyh+AjY1of6Sb9Qz196Bhsr9V9W8BqjVph+o/W5MvPpWmaLlYKMRl54OqbTUx
 +F1eDDmt5xil1fyM1R92vxlvoo2DwhSW7SU6tw0o=
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHZlbmRvciBjb21wYXRpYmxlcyBmb3Igc3BlY2lmaWMgaW1wbGVtZW50YXRpb24gb2YgTWFs
aSBVdGdhcmQKKEV4eW5vczMyNTAsIEV4eW5vczQtZmFtaWx5KSBhbmQgTWlkZ2FyZCAoRXh5bm9z
NTQzMywgRXh5bm9zNykuCgpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnpr
QGtlcm5lbC5vcmc+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9h
cm0sbWFsaS1taWRnYXJkLnR4dCB8IDEgKwogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2dwdS9hcm0sbWFsaS11dGdhcmQudHh0ICB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZ3B1L2FybSxtYWxpLW1pZGdhcmQudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJkLnR4dAppbmRleCBlNWFkM2IyYWZlMTcuLjliMjk4
ZWRlYzViMiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dw
dS9hcm0sbWFsaS1taWRnYXJkLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZ3B1L2FybSxtYWxpLW1pZGdhcmQudHh0CkBAIC0xNyw2ICsxNyw3IEBAIFJlcXVpcmVk
IHByb3BlcnRpZXM6CiAgICogd2hpY2ggbXVzdCBiZSBwcmVjZWRlZCBieSBvbmUgb2YgdGhlIGZv
bGxvd2luZyB2ZW5kb3Igc3BlY2lmaWNzOgogICAgICsgImFsbHdpbm5lcixzdW41MGktaDYtbWFs
aSIKICAgICArICJhbWxvZ2ljLG1lc29uLWd4bS1tYWxpIgorICAgICsgInNhbXN1bmcsZXh5bm9z
NTQzMy1tYWxpIgogICAgICsgInJvY2tjaGlwLHJrMzI4OC1tYWxpIgogICAgICsgInJvY2tjaGlw
LHJrMzM5OS1tYWxpIgogCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZ3B1L2FybSxtYWxpLXV0Z2FyZC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZ3B1L2FybSxtYWxpLXV0Z2FyZC50eHQKaW5kZXggYWU2M2YwOWZkYTdkLi41MTkw
MThjYjg2MGIgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9n
cHUvYXJtLG1hbGktdXRnYXJkLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZ3B1L2FybSxtYWxpLXV0Z2FyZC50eHQKQEAgLTE3LDYgKzE3LDcgQEAgUmVxdWlyZWQg
cHJvcGVydGllczoKICAgICAgICsgYW1sb2dpYyxtZXNvbjhiLW1hbGkKICAgICAgICsgYW1sb2dp
YyxtZXNvbi1neGJiLW1hbGkKICAgICAgICsgYW1sb2dpYyxtZXNvbi1neGwtbWFsaQorICAgICAg
KyBzYW1zdW5nLGV4eW5vczMyNTAtbWFsaQogICAgICAgKyByb2NrY2hpcCxyazMwMzYtbWFsaQog
ICAgICAgKyByb2NrY2hpcCxyazMwNjYtbWFsaQogICAgICAgKyByb2NrY2hpcCxyazMxODgtbWFs
aQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
