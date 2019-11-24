Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E531089BD
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 09:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F0689668;
	Mon, 25 Nov 2019 08:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p03-ob.smtp.rzone.de (mo6-p03-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5303::11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5016E0FE
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2019 11:40:47 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH4HEaKeuIV"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
 with ESMTPSA id L09db3vAOBeUwES
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Sun, 24 Nov 2019 12:40:30 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Paul Cercueil <paul@crapouillou.net>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>
Subject: [PATCH v3 2/8] ARM: DTS: am33xx: add sgx gpu child node
Date: Sun, 24 Nov 2019 12:40:22 +0100
Message-Id: <2ae609d6958727723ebaea2cfb62b547b38c23ee.1574595627.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1574595627.git.hns@goldelico.com>
References: <cover.1574595627.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 Nov 2019 08:07:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1574595646; 
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=ZYQzlQVMDmnVrRYXkfhAI7LtxZT/3zaRWYdCXsxRj0I=;
 b=PRGxWQ34+7I6P9zXeA+Ql4h+YWTIeFXYbqcmgx+qR0QvJ5an6TutnCcX/1LzMyRKzQ
 KUR0Rvb3Vr9lpqVW3oXOR6DioqdeseCrmUFek547vUeCOD08trkIdbSqBWuXZcALmBKd
 s9Yq25EJc80pP2i8DB1tvBrEp379Udv2Nsz3jOzntQ66tERFklrOqw/mHJ7HhIvz3FwY
 EdK3K+SZ42WVGtjz+FMkN2VF/dJOK7QAQGSk6IlUssygItTnpFBAmlTNznEFX3oc6DOe
 +8LnJAPtSR8NgS0j0smJGtK3MyN06NAzq70k5pwOLL+lxfBS43wx5HjNuV3lYDxJHf9U
 B+hQ==
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
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 "H. Nikolaus Schaller" <hns@goldelico.com>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YW5kIGFkZCB0aW1lciBhbmQgaW50ZXJydXB0CgpUZXN0ZWQtYnk6IEguIE5pa29sYXVzIFNjaGFs
bGVyIDxobnNAZ29sZGVsaWNvLmNvbT4gIyBCZWFnbGVCb25lIEJsYWNrClNpZ25lZC1vZmYtYnk6
IEguIE5pa29sYXVzIFNjaGFsbGVyIDxobnNAZ29sZGVsaWNvLmNvbT4KLS0tCiBhcmNoL2FybS9i
b290L2R0cy9hbTMzeHguZHRzaSB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9hbTMzeHguZHRzaSBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL2FtMzN4eC5kdHNpCmluZGV4IGE5ZDg0OGQ1MGIyMC4uMWZiYzhhMmNjN2ZkIDEwMDY0NAot
LS0gYS9hcmNoL2FybS9ib290L2R0cy9hbTMzeHguZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0
cy9hbTMzeHguZHRzaQpAQCAtNDgwLDEzICs0ODAsNDMgQEAKIAkJCSNzaXplLWNlbGxzID0gPDE+
OwogCQkJcmFuZ2VzID0gPDAgMHg1NjAwMDAwMCAweDEwMDAwMDA+OwogCi0JCQkvKgotCQkJICog
Q2xvc2VkIHNvdXJjZSBQb3dlclZSIGRyaXZlciwgbm8gY2hpbGQgZGV2aWNlCi0JCQkgKiBiaW5k
aW5nIG9yIGRyaXZlciBpbiBtYWlubGluZQotCQkJICovCisJCQlzZ3g6IGdwdUAwIHsKKwkJCQlj
b21wYXRpYmxlID0gInRpLGFtMzM1Mi1zZ3g1MzAtMTI1IiwgImltZyxzZ3g1MzAtMTI1IiwgImlt
ZyxzZ3g1MzAiOworCQkJCXJlZyA9IDwweDAwIDB4MTAwMDAwMD47CS8qIDE2IE1CICovCisJCQkJ
aW50ZXJydXB0cyA9IDwzNz47CisJCQl9OwogCQl9OwogCX07CiB9OwogCiAjaW5jbHVkZSAiYW0z
M3h4LWw0LmR0c2kiCiAjaW5jbHVkZSAiYW0zM3h4LWNsb2Nrcy5kdHNpIgorCismcHJjbSB7CisJ
cHJtX3BlcjogcHJtQGMwMCB7CisJCWNvbXBhdGlibGUgPSAidGksYW0zLXBybS1pbnN0IjsKKwkJ
cmVnID0gPDB4YzAwIDB4MTAwPjsKKwkJI3Jlc2V0LWNlbGxzID0gPDE+OworCQljbG9ja3MgPSA8
JnBydXNzX29jcF9jbGtjdHJsIEFNM19QUlVTU19PQ1BfUFJVU1NfQ0xLQ1RSTCAwPjsKKwl9Owor
CisJcHJtX3drdXA6IHBybUBkMDAgeworCQljb21wYXRpYmxlID0gInRpLGFtMy1wcm0taW5zdCI7
CisJCXJlZyA9IDwweGQwMCAweDEwMD47CisJCSNyZXNldC1jZWxscyA9IDwxPjsKKwkJY2xvY2tz
ID0gPCZsNF93a3VwX2Nsa2N0cmwgQU0zX1dLVVBfTTNfQ0xLQ1RSTCAwPjsKKwl9OworCisJcHJt
X2RldmljZTogcHJtQGYwMCB7CisJCWNvbXBhdGlibGUgPSAidGksYW0zLXBybS1pbnN0IjsKKwkJ
cmVnID0gPDB4ZjAwIDB4MTAwPjsKKwkJI3Jlc2V0LWNlbGxzID0gPDE+OworCX07CisKKwlwcm1f
Z2Z4OiBwcm1AMTEwMCB7CisJCWNvbXBhdGlibGUgPSAidGksYW0zLXBybS1pbnN0IjsKKwkJcmVn
ID0gPDB4MTEwMCAweDEwMD47CisJCSNyZXNldC1jZWxscyA9IDwxPjsKKwkJY2xvY2tzID0gPCZn
ZnhfbDNfY2xrY3RybCBBTTNfR0ZYX0NMS0NUUkwgMD47CisJfTsKK307Ci0tIAoyLjIzLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
