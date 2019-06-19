Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8767B4B2A0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E7F6E2B2;
	Wed, 19 Jun 2019 07:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBFED6E281;
 Wed, 19 Jun 2019 02:32:13 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id C978D3E9FC;
 Wed, 19 Jun 2019 02:32:12 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: bjorn.andersson@linaro.org, agross@kernel.org, david.brown@linaro.org,
 robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org
Subject: [PATCH v2 1/6] dt-bindings: soc: qcom: add On Chip MEMory (OCMEM)
 bindings
Date: Tue, 18 Jun 2019 22:32:04 -0400
Message-Id: <20190619023209.10036-2-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190619023209.10036-1-masneyb@onstation.org>
References: <20190619023209.10036-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1560911533;
 bh=pEcPVfqTl/GxBCaCQsnvEry57usKGa0AqqX5MQfaDP8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gQVJyvOV4XEHwAuXUbr28YlyyMwZZauXJNZrso893JJu90bFmKZvFLuqWjk6hokbS
 Q5VQ8DCo+8vfArnhQjUVYXWqWbMzkq7COOTaeNThL+qwLTe66C3fxRuqVxd3iOqTV9
 Pooao7EF6U59U045cRxrWWcr3A/Oks3mixwR0MLc=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jonathan@marek.ca,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciB0aGUgT24gQ2hpcCBNZW1vcnkgKE9DTUVNKSB0
aGF0IGlzIHByZXNlbnQKb24gc29tZSBRdWFsY29tbSBTbmFwZHJhZ29uIFNvQ3MuCgpTaWduZWQt
b2ZmLWJ5OiBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4KLS0tCkNoYW5nZXMg
c2luY2UgdjE6Ci0gUmVuYW1lIHFjb20sb2NtZW0tbXNtODk3NCB0byBxY29tLG1zbTg5NzQtb2Nt
ZW0KLSBSZW5hbWVkIHJlZy1uYW1lcyB0byBjdHJsIGFuZCBtZW0KLSB1cGRhdGUgaGFyZHdhcmUg
ZGVzY3JpcHRpb24KLSBtb3ZlZCBmcm9tIHNvYyB0byBzcmFtIG5hbWVzcGFjZSBpbiB0aGUgZGV2
aWNlIHRyZWUgYmluZGluZ3MKCiAuLi4vYmluZGluZ3Mvc3JhbS9xY29tL3Fjb20sb2NtZW0ueWFt
bCAgICAgICAgfCA2NCArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNjQgaW5z
ZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9zcmFtL3Fjb20vcWNvbSxvY21lbS55YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NyYW0vcWNvbS9xY29tLG9jbWVtLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3JhbS9xY29tL3Fjb20sb2NtZW0ueWFtbApu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjFiZDE1ODI0OTY4ZQotLS0g
L2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcmFtL3Fj
b20vcWNvbSxvY21lbS55YW1sCkBAIC0wLDAgKzEsNjQgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NyYW0vcWNvbS9xY29tLG9jbWVtLnlhbWwjCisk
c2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwor
dGl0bGU6IE9uIENoaXAgTWVtb3J5IChPQ01FTSkgdGhhdCBpcyBwcmVzZW50IG9uIHNvbWUgUXVh
bGNvbW0gU25hcGRyYWdvbiBTb0NzLgorCittYWludGFpbmVyczoKKyAgLSBCcmlhbiBNYXNuZXkg
PG1hc25leWJAb25zdGF0aW9uLm9yZz4KKworZGVzY3JpcHRpb246IHwKKyAgVGhlIE9uIENoaXAg
TWVtb3J5IChPQ01FTSkgaXMgdHlwaWNhbGx5IHVzZWQgYnkgdGhlIEdQVSwgY2FtZXJhL3ZpZGVv
LCBhbmQKKyAgYXVkaW8gY29tcG9uZW50cyBvbiBzb21lIFNuYXBkcmFnb24gU29Dcy4KKworcHJv
cGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBjb25zdDogcWNvbSxtc204OTc0LW9jbWVtCisK
KyAgcmVnOgorICAgIGl0ZW1zOgorICAgICAgLSBkZXNjcmlwdGlvbjogQ29udHJvbCByZWdpc3Rl
cnMKKyAgICAgIC0gZGVzY3JpcHRpb246IE9DTUVNIGFkZHJlc3MgcmFuZ2UKKworICByZWctbmFt
ZXM6CisgICAgaXRlbXM6CisgICAgICAtIGNvbnN0OiBjdHJsCisgICAgICAtIGNvbnN0OiBtZW0K
KworICBjbG9ja3M6CisgICAgaXRlbXM6CisgICAgICAtIGRlc2NyaXB0aW9uOiBDb3JlIGNsb2Nr
CisgICAgICAtIGRlc2NyaXB0aW9uOiBJbnRlcmZhY2UgY2xvY2sKKworICBjbG9jay1uYW1lczoK
KyAgICBpdGVtczoKKyAgICAgIC0gY29uc3Q6IGNvcmUKKyAgICAgIC0gY29uc3Q6IGlmYWNlCisK
K3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKyAgLSByZWctbmFtZXMKKyAgLSBj
bG9ja3MKKyAgLSBjbG9jay1uYW1lcworCitleGFtcGxlczoKKyAgLSB8CisgICAgICAjaW5jbHVk
ZSA8ZHQtYmluZGluZ3MvY2xvY2svcWNvbSxycG1jYy5oPgorICAgICAgI2luY2x1ZGUgPGR0LWJp
bmRpbmdzL2Nsb2NrL3Fjb20sbW1jYy1tc204OTc0Lmg+CisKKyAgICAgIG9jbWVtOiBvY21lbUBm
ZGQwMDAwMCB7CisgICAgICAgIGNvbXBhdGlibGUgPSAicWNvbSxtc204OTc0LW9jbWVtIjsKKwor
ICAgICAgICByZWcgPSA8MHhmZGQwMDAwMCAweDIwMDA+LAorICAgICAgICAgICAgICA8MHhmZWMw
MDAwMCAweDE4MDAwMD47CisgICAgICAgIHJlZy1uYW1lcyA9ICJjdHJsIiwKKyAgICAgICAgICAg
ICAgICAgICAgIm1lbSI7CisKKyAgICAgICAgY2xvY2tzID0gPCZycG1jYyBSUE1fU01EX09DTUVN
R1hfQ0xLPiwKKyAgICAgICAgICAgICAgICAgPCZtbWNjIE9DTUVNQ1hfT0NNRU1OT0NfQ0xLPjsK
KyAgICAgICAgY2xvY2stbmFtZXMgPSAiY29yZSIsCisgICAgICAgICAgICAgICAgICAgICAgImlm
YWNlIjsKKyAgICAgIH07Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
