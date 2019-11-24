Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A961089BB
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 09:08:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A00A4894D7;
	Mon, 25 Nov 2019 08:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p03-ob.smtp.rzone.de (mo6-p03-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5303::6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252006E0FE
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2019 11:40:43 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH4HEaKeuIV"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
 with ESMTPSA id L09db3vAOBeVwEV
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Sun, 24 Nov 2019 12:40:31 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Paul Cercueil <paul@crapouillou.net>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>
Subject: [PATCH v3 4/8] ARM: DTS: omap3: add sgx gpu child node
Date: Sun, 24 Nov 2019 12:40:24 +0100
Message-Id: <deaddbf0d29f30bfe675314e03e59cfc4749fad6.1574595627.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1574595627.git.hns@goldelico.com>
References: <cover.1574595627.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 Nov 2019 08:07:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1574595641; 
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=Rm4WywRiqIu8Cpj8mxp5+uUPO7vBAXz/YHalWG/YWBE=;
 b=J35Xj07/KGms8IibOJzSAUOH9jwQ2I+uHGBsCgg4l4NI48dvnhMfXjb5ef0WkvY31t
 ZfA5GkRg4NdlgkzAukqMAGNB70v/ULnvJ/NVL8eCBm2S49hIbG1K9m5h5pHJBWgAhkj9
 8qAv4db1/JMLCVMc0CKAJNFnzWTwu1ffvpjJHgazYDkwfa1v4u4i+hOCSxYuDB4W/ohd
 7xXIqpauKK3dg2qwyUo2LKDZZWbHCLYcqZSMXlfl36EgvXQJZx89yOIQQYsPATPVBdHf
 QTVgqj3XCDvNPbQSgABSbSrQ7jsrFHnnkrLVjRr8I5DnUR6RivZiB/94pcRln+YEMWKB
 qq3A==
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

YW5kIGFkZCBpbnRlcnJ1cHQKClRlc3RlZC1ieTogSC4gTmlrb2xhdXMgU2NoYWxsZXIgPGhuc0Bn
b2xkZWxpY28uY29tPiAjIE9wZW5QYW5kb3JhIDYwMCBNSHouClNpZ25lZC1vZmYtYnk6IEguIE5p
a29sYXVzIFNjaGFsbGVyIDxobnNAZ29sZGVsaWNvLmNvbT4KLS0tCiBhcmNoL2FybS9ib290L2R0
cy9vbWFwMzR4eC5kdHNpIHwgMTEgKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMv
b21hcDM0eHguZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL29tYXAzNHh4LmR0c2kKaW5kZXggN2Iw
OWNiZWU4YmI4Li45YjA1MGQ3MTg0OWIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL29t
YXAzNHh4LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvb21hcDM0eHguZHRzaQpAQCAtMTEx
LDcgKzExMSw3IEBACiAJCSAqIGFyZSBhbHNvIGRpZmZlcmVudCBjbG9ja3MsIGJ1dCB3ZSBkbyBu
b3QgaGF2ZSBhbnkgZHRzIHVzZXJzCiAJCSAqIGZvciBpdC4KIAkJICovCi0JCXNneF9tb2R1bGU6
IHRhcmdldC1tb2R1bGVANTAwMDAwMDAgeworCQl0YXJnZXQtbW9kdWxlQDUwMDAwMDAwIHsKIAkJ
CWNvbXBhdGlibGUgPSAidGksc3lzYy1vbWFwMiIsICJ0aSxzeXNjIjsKIAkJCXJlZyA9IDwweDUw
MDAwMDE0IDB4ND47CiAJCQlyZWctbmFtZXMgPSAicmV2IjsKQEAgLTEyMSwxMCArMTIxLDExIEBA
CiAJCQkjc2l6ZS1jZWxscyA9IDwxPjsKIAkJCXJhbmdlcyA9IDwwIDB4NTAwMDAwMDAgMHg0MDAw
PjsKIAotCQkJLyoKLQkJCSAqIENsb3NlZCBzb3VyY2UgUG93ZXJWUiBkcml2ZXIsIG5vIGNoaWxk
IGRldmljZQotCQkJICogYmluZGluZyBvciBkcml2ZXIgaW4gbWFpbmxpbmUKLQkJCSAqLworCQkJ
c2d4OiBncHVAMCB7CisJCQkJY29tcGF0aWJsZSA9ICJ0aSxvbWFwMy1zZ3g1MzAtMTIxIiwgImlt
ZyxzZ3g1MzAtMTIxIiwgImltZyxzZ3g1MzAiOworCQkJCXJlZyA9IDwweDAgMHg0MDAwPjsJLyog
NjRrQiAqLworCQkJCWludGVycnVwdHMgPSA8MjE+OworCQkJfTsKIAkJfTsKIAl9OwogCi0tIAoy
LjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
