Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F36DF1089D3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 09:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95E189FF7;
	Mon, 25 Nov 2019 08:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p03-ob.smtp.rzone.de (mo6-p03-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5303::10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DAF6E0FC
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2019 11:40:46 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH4HEaKeuIV"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
 with ESMTPSA id L09db3vAOBeWwEY
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Sun, 24 Nov 2019 12:40:32 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Paul Cercueil <paul@crapouillou.net>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>
Subject: [PATCH v3 7/8] ARM: DTS: omap5: add sgx gpu child node
Date: Sun, 24 Nov 2019 12:40:27 +0100
Message-Id: <9ab7e1877e813029fd92f91135454d8ee180b3b2.1574595627.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1574595627.git.hns@goldelico.com>
References: <cover.1574595627.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 Nov 2019 08:07:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1574595645; 
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=VMVIJu/XXEpdP7ZA4d5TPlNUaERKpJJo1E7qNg8ZUEQ=;
 b=A1iixFL8YB674kkB5W0eAPEcn4xAgdNyTkCmJudXAg/3EKjtKiS7xD6bkrqmYyIA/u
 BFjBmATDvRTTm/wf9UPGG07rkwo2dRippzdrEEvahwIMGoOrMZwl0YTqA2fmLwYjeXNi
 FJYbKvVgDbAyq5982XO05hfw9nZ78iQGdgQYOWl+sUMw7WSBYHXzd/B0E7asiigftfdq
 IOERJIPeDSFVHHpATnipbg0itE3ZKlqQihkPtTQORUKOJTbO+C/3Ibz12WLFDhX/crcT
 6MqE/rUezgvTvUmEkrawVFrwy80d/idOvVa01yISD3GBVbZOsy8ZctuwEglJbL/wl6sr
 xaCA==
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

YW5kIGFkZCBpbnRlcnJ1cHQuCgpUZXN0ZWQtYnk6IEguIE5pa29sYXVzIFNjaGFsbGVyIDxobnNA
Z29sZGVsaWNvLmNvbT4gIyBQeXJhLUhhbmRoZWxkLgpTaWduZWQtb2ZmLWJ5OiBILiBOaWtvbGF1
cyBTY2hhbGxlciA8aG5zQGdvbGRlbGljby5jb20+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvb21h
cDUuZHRzaSB8IDkgKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL29tYXA1LmR0c2kg
Yi9hcmNoL2FybS9ib290L2R0cy9vbWFwNS5kdHNpCmluZGV4IDFmYjc5Mzc2MzhmMC4uMzMzZGE0
Nzg4MDg4IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9vbWFwNS5kdHNpCisrKyBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL29tYXA1LmR0c2kKQEAgLTI3NCwxMCArMjc0LDExIEBACiAJCQkjc2l6
ZS1jZWxscyA9IDwxPjsKIAkJCXJhbmdlcyA9IDwwIDB4NTYwMDAwMDAgMHgyMDAwMDAwPjsKIAot
CQkJLyoKLQkJCSAqIENsb3NlZCBzb3VyY2UgUG93ZXJWUiBkcml2ZXIsIG5vIGNoaWxkIGRldmlj
ZQotCQkJICogYmluZGluZyBvciBkcml2ZXIgaW4gbWFpbmxpbmUKLQkJCSAqLworCQkJc2d4OiBn
cHVAMCB7CisJCQkJY29tcGF0aWJsZSA9ICJ0aSxvbWFwNS1zZ3g1NDQtMTE2IiwgImltZyxzZ3g1
NDQtMTE2IiwgImltZyxzZ3g1NDQiOworCQkJCXJlZyA9IDwweDAgMHgxMDAwMD47CisJCQkJaW50
ZXJydXB0cyA9IDxHSUNfU1BJIDIxIElSUV9UWVBFX0xFVkVMX0hJR0g+OworCQkJfTsKIAkJfTsK
IAogCQlkc3M6IGRzc0A1ODAwMDAwMCB7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
