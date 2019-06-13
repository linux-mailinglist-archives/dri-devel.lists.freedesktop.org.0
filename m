Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6D3455D2
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A174689798;
	Fri, 14 Jun 2019 07:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB04E89AB7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 14:32:05 +0000 (UTC)
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:45250 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1hbQlF-0003Xw-5l; Thu, 13 Jun 2019 15:31:29 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim
 4.82_1-5b7a7c0-XX) (envelope-from <rmk@armlinux.org.uk>)
 id 1hbQlC-0007zT-99; Thu, 13 Jun 2019 15:31:26 +0100
In-Reply-To: <20190613142943.vhgiy6yvyjz6uqlp@shell.armlinux.org.uk>
References: <20190613142943.vhgiy6yvyjz6uqlp@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: Sven Van Asbroeck <thesven73@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>
Subject: [PATCH v2 07/13] drm/i2c: tda998x: configure both fields of
 AIP_CLKSEL together
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1hbQlC-0007zT-99@rmk-PC.armlinux.org.uk>
Date: Thu, 13 Jun 2019 15:31:26 +0100
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HOh697Gz626rhtC+OeqgOCIq7pVPUO8SMqYBMWmm6qI=; b=Ya6VL6k6WzkTn7BpRHfDe9THqu
 mkMGfPc5SFoICwcWVzhCj4klV6HHoOhQW0haZ6ZJmy4F2l2TBPygbqiRBi/3g08e4QG5CNwzQESoq
 2A+/VMwlGSUJ1g4UqT4equwE0Lc5nANvqoXLl57JMRZW8mAvGkAalX7MIJAHUK50VaHWQ/40RCc7d
 2UIjrhRzbKJByvGthxz0R18+IUTUuf3iB/EkDwscaG4Ve4lR4xxSkxV+TKnSB1V9yPDfV33qEh8Pz
 fofwydOCih6SulagLgHwjnK6zretMmzychvpujdMDm1J8zEd+3+EY6VmpKIyiPl7CdLIczRvH7dkl
 uBWUfihg==;
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgY2FuIGNvbmZpZ3VyZSBib3RoIGZpZWxkcyBvZiB0aGUgQUlQX0NMS1NFTCByZWdpc3RlciB3
aXRoIGEgc2luZ2xlCndyaXRlLCB0aGVyZSBpcyBubyBuZWVkIHRvIGRlbGF5IHRoZSBzZXR0aW5n
IG9mIHRoZSBDVFMgcmVmZXJlbmNlLgoKU2lnbmVkLW9mZi1ieTogUnVzc2VsbCBLaW5nIDxybWsr
a2VybmVsQGFybWxpbnV4Lm9yZy51az4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5OHhf
ZHJ2LmMgfCAxMyArKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4
eF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYwppbmRleCA5MWI4YWQx
ZGE5MjMuLmIxYTBlNDFjYTNlMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2kyYy90ZGE5
OTh4X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYwpAQCAtOTYw
LDcgKzk2MCw3IEBAIHN0YXRpYyB2b2lkIHRkYTk5OHhfYXVkaW9fbXV0ZShzdHJ1Y3QgdGRhOTk4
eF9wcml2ICpwcml2LCBib29sIG9uKQogc3RhdGljIGludCB0ZGE5OTh4X2NvbmZpZ3VyZV9hdWRp
byhzdHJ1Y3QgdGRhOTk4eF9wcml2ICpwcml2LAogCQkJCSBjb25zdCBzdHJ1Y3QgdGRhOTk4eF9h
dWRpb19zZXR0aW5ncyAqc2V0dGluZ3MpCiB7Ci0JdTggYnVmWzZdLCBjbGtzZWxfYWlwLCBjbGtz
ZWxfZnMsIGFkaXY7CisJdTggYnVmWzZdLCBhaXBfY2xrc2VsLCBhZGl2OwogCXUzMiBuOwogCiAJ
LyogSWYgYXVkaW8gaXMgbm90IGNvbmZpZ3VyZWQsIHRoZXJlIGlzIG5vdGhpbmcgdG8gZG8uICov
CkBAIC05NzcsMTUgKzk3NywxMyBAQCBzdGF0aWMgaW50IHRkYTk5OHhfY29uZmlndXJlX2F1ZGlv
KHN0cnVjdCB0ZGE5OTh4X3ByaXYgKnByaXYsCiAJY2FzZSBBRk1UX1NQRElGOgogCQlyZWdfd3Jp
dGUocHJpdiwgUkVHX0VOQV9BQ0xLLCAwKTsKIAkJcmVnX3dyaXRlKHByaXYsIFJFR19NVVhfQVAs
IE1VWF9BUF9TRUxFQ1RfU1BESUYpOwotCQljbGtzZWxfYWlwID0gQUlQX0NMS1NFTF9BSVBfU1BE
SUY7Ci0JCWNsa3NlbF9mcyA9IEFJUF9DTEtTRUxfRlNfRlM2NFNQRElGOworCQlhaXBfY2xrc2Vs
ID0gQUlQX0NMS1NFTF9BSVBfU1BESUYgfCBBSVBfQ0xLU0VMX0ZTX0ZTNjRTUERJRjsKIAkJYnJl
YWs7CiAKIAljYXNlIEFGTVRfSTJTOgogCQlyZWdfd3JpdGUocHJpdiwgUkVHX0VOQV9BQ0xLLCAx
KTsKIAkJcmVnX3dyaXRlKHByaXYsIFJFR19NVVhfQVAsIE1VWF9BUF9TRUxFQ1RfSTJTKTsKLQkJ
Y2xrc2VsX2FpcCA9IEFJUF9DTEtTRUxfQUlQX0kyUzsKLQkJY2xrc2VsX2ZzID0gQUlQX0NMS1NF
TF9GU19BQ0xLOworCQlhaXBfY2xrc2VsID0gQUlQX0NMS1NFTF9BSVBfSTJTIHwgQUlQX0NMS1NF
TF9GU19BQ0xLOwogCQlicmVhazsKIAogCWRlZmF1bHQ6CkBAIC05OTQsNyArOTkyLDcgQEAgc3Rh
dGljIGludCB0ZGE5OTh4X2NvbmZpZ3VyZV9hdWRpbyhzdHJ1Y3QgdGRhOTk4eF9wcml2ICpwcml2
LAogCX0KIAogCXJlZ193cml0ZShwcml2LCBSRUdfSTJTX0ZPUk1BVCwgc2V0dGluZ3MtPmkyc19m
b3JtYXQpOwotCXJlZ193cml0ZShwcml2LCBSRUdfQUlQX0NMS1NFTCwgY2xrc2VsX2FpcCk7CisJ
cmVnX3dyaXRlKHByaXYsIFJFR19BSVBfQ0xLU0VMLCBhaXBfY2xrc2VsKTsKIAlyZWdfY2xlYXIo
cHJpdiwgUkVHX0FJUF9DTlRSTF8wLCBBSVBfQ05UUkxfMF9MQVlPVVQgfAogCQkJCQlBSVBfQ05U
UkxfMF9BQ1JfTUFOKTsJLyogYXV0byBDVFMgKi8KIAlyZWdfd3JpdGUocHJpdiwgUkVHX0NUU19O
LCBzZXR0aW5ncy0+Y3RzX24pOwpAQCAtMTAxNSw5ICsxMDEzLDYgQEAgc3RhdGljIGludCB0ZGE5
OTh4X2NvbmZpZ3VyZV9hdWRpbyhzdHJ1Y3QgdGRhOTk4eF9wcml2ICpwcml2LAogCWJ1Zls1XSA9
IG4gPj4gMTY7CiAJcmVnX3dyaXRlX3JhbmdlKHByaXYsIFJFR19BQ1JfQ1RTXzAsIGJ1ZiwgNik7
CiAKLQkvKiBTZXQgQ1RTIGNsb2NrIHJlZmVyZW5jZSAqLwotCXJlZ193cml0ZShwcml2LCBSRUdf
QUlQX0NMS1NFTCwgY2xrc2VsX2FpcCB8IGNsa3NlbF9mcyk7Ci0KIAkvKiBSZXNldCBDVFMgZ2Vu
ZXJhdG9yICovCiAJcmVnX3NldChwcml2LCBSRUdfQUlQX0NOVFJMXzAsIEFJUF9DTlRSTF8wX1JT
VF9DVFMpOwogCXJlZ19jbGVhcihwcml2LCBSRUdfQUlQX0NOVFJMXzAsIEFJUF9DTlRSTF8wX1JT
VF9DVFMpOwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
