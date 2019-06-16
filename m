Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5354750A
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515D289262;
	Sun, 16 Jun 2019 14:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65DDC89127;
 Sun, 16 Jun 2019 13:29:47 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 004503E9CF;
 Sun, 16 Jun 2019 13:29:45 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com,
 sean@poorly.run, robh+dt@kernel.org
Subject: [PATCH 1/6] dt-bindings: soc: qcom: add On Chip MEMory (OCMEM)
 bindings
Date: Sun, 16 Jun 2019 09:29:25 -0400
Message-Id: <20190616132930.6942-2-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190616132930.6942-1-masneyb@onstation.org>
References: <20190616132930.6942-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1560691786;
 bh=irgUB032exacl9EYA4xT+dfR2io7zD/c3uZsKSwgy5I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OYoKc4HqpLshtGnVB7kd7XWU+6L07I0PT7ssQvmpyTma5MSXOAKSCL5arcC1EkP2b
 kW8jRyta7vpWqvCWgs+Mz2uBN+4/uRtnYDwtp5kmGhz98EawK7u4C7x0c1JopNbB8t
 +VUAh/E/+yeAG/TQP09owKC+zqjKpLrb0Eyd6BYc=
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
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciB0aGUgT24gQ2hpcCBNZW1vcnkgKE9DTUVNKSB0
aGF0IGlzIHByZXNlbnQKb24gc29tZSBRdWFsY29tbSBTbmFwZHJhZ29uIFNvQ3MuCgpTaWduZWQt
b2ZmLWJ5OiBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4KLS0tCiAuLi4vYmlu
ZGluZ3Mvc29jL3Fjb20vcWNvbSxvY21lbS55YW1sICAgICAgICAgfCA2NiArKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvcWNvbS9xY29tLG9jbWVt
LnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29j
L3Fjb20vcWNvbSxvY21lbS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3NvYy9xY29tL3Fjb20sb2NtZW0ueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwMDAwMDAuLjVlM2FlNjMxMWExNgotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvcWNvbS9xY29tLG9jbWVtLnlhbWwKQEAgLTAsMCArMSw2
NiBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNl
KQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvc29j
L3Fjb20vcWNvbSxvY21lbS55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21l
dGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBPbiBDaGlwIE1lbW9yeSAoT0NNRU0pIHRo
YXQgaXMgcHJlc2VudCBvbiBzb21lIFF1YWxjb21tIFNuYXBkcmFnb24gU29Dcy4KKworbWFpbnRh
aW5lcnM6CisgIC0gQnJpYW4gTWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+CisKK2Rlc2Ny
aXB0aW9uOiB8CisgIFRoZSBPbiBDaGlwIE1lbW9yeSAoT0NNRU0pIGFsbG9jYXRvciBhbGxvd3Mg
dmFyaW91cyBjbGllbnRzIHRvIGFsbG9jYXRlIG1lbW9yeQorICBmcm9tIE9DTUVNIGJhc2VkIG9u
IHBlcmZvcm1hbmNlLCBsYXRlbmN5IGFuZCBwb3dlciByZXF1aXJlbWVudHMuIFRoaXMgaXMKKyAg
dHlwaWNhbGx5IHVzZWQgYnkgdGhlIEdQVSwgY2FtZXJhL3ZpZGVvLCBhbmQgYXVkaW8gY29tcG9u
ZW50cyBvbiBzb21lCisgIFNuYXBkcmFnb24gU29Dcy4KKworcHJvcGVydGllczoKKyAgY29tcGF0
aWJsZToKKyAgICBjb25zdDogcWNvbSxvY21lbS1tc204OTc0CisKKyAgcmVnOgorICAgIGl0ZW1z
OgorICAgICAgLSBkZXNjcmlwdGlvbjogQ29udHJvbCByZWdpc3RlcnMKKyAgICAgIC0gZGVzY3Jp
cHRpb246IE9DTUVNIGFkZHJlc3MgcmFuZ2UKKworICByZWctbmFtZXM6CisgICAgaXRlbXM6Cisg
ICAgICAtIGNvbnN0OiBvY21lbV9jdHJsX3BoeXNpY2FsCisgICAgICAtIGNvbnN0OiBvY21lbV9w
aHlzaWNhbAorCisgIGNsb2NrczoKKyAgICBpdGVtczoKKyAgICAgIC0gZGVzY3JpcHRpb246IENv
cmUgY2xvY2sKKyAgICAgIC0gZGVzY3JpcHRpb246IEludGVyZmFjZSBjbG9jaworCisgIGNsb2Nr
LW5hbWVzOgorICAgIGl0ZW1zOgorICAgICAgLSBjb25zdDogY29yZQorICAgICAgLSBjb25zdDog
aWZhY2UKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHJlZworICAtIHJlZy1uYW1l
cworICAtIGNsb2NrcworICAtIGNsb2NrLW5hbWVzCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICAg
ICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9xY29tLHJwbWNjLmg+CisgICAgICAjaW5jbHVk
ZSA8ZHQtYmluZGluZ3MvY2xvY2svcWNvbSxtbWNjLW1zbTg5NzQuaD4KKworICAgICAgb2NtZW06
IG9jbWVtQGZkZDAwMDAwIHsKKyAgICAgICAgY29tcGF0aWJsZSA9ICJxY29tLG9jbWVtLW1zbTg5
NzQiOworCisgICAgICAgIHJlZyA9IDwweGZkZDAwMDAwIDB4MjAwMD4sCisgICAgICAgICAgICAg
ICA8MHhmZWMwMDAwMCAweDE4MDAwMD47CisgICAgICAgIHJlZy1uYW1lcyA9ICJvY21lbV9jdHJs
X3BoeXNpY2FsIiwKKyAgICAgICAgICAgICAgICAgICAgIm9jbWVtX3BoeXNpY2FsIjsKKworICAg
ICAgICBjbG9ja3MgPSA8JnJwbWNjIFJQTV9TTURfT0NNRU1HWF9DTEs+LAorICAgICAgICAgICAg
ICAgICAgPCZtbWNjIE9DTUVNQ1hfT0NNRU1OT0NfQ0xLPjsKKyAgICAgICAgY2xvY2stbmFtZXMg
PSAiY29yZSIsCisgICAgICAgICAgICAgICAgICAgICAgImlmYWNlIjsKKyAgICAgIH07Ci0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
