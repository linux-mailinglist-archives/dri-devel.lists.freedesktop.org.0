Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E91329D7
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 09:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09471896B0;
	Mon,  3 Jun 2019 07:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32AE7893D1
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2019 16:48:59 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 1/2] dt-bindings: display: Add King Display KD035G6-54NT panel
 documentation
Date: Sun,  2 Jun 2019 18:48:43 +0200
Message-Id: <20190602164844.15659-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 03 Jun 2019 07:40:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1559494136; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=vb7xsY48X0IRX6WU/JJNVZf+YbRONceHxAfWa0qnxCM=;
 b=UemrOozu4Rr/GzEu+cKFK/mOKU91ndgTzD9ExD9YClsejMyJmTvR7OPou7D0BOrtuzoztp
 M1CTSia3mAC3rXHuLtg3r9OUszmbj9NrOuV+stE/jTYl7SgoNLPZ6X+XCjC3VrVzBXfEr6
 wBpFhMHNjXsMc5E7UO+I+8dhfOjVSLU=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 od@zcrc.me, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEtEMDM1RzYtNTROVCBpcyBhIDMuNSIgMzIweDI0MCAyNC1iaXQgVEZUIExDRCBwYW5lbC4K
ClNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PgotLS0K
IC4uLi9wYW5lbC9raW5nZGlzcGxheSxrZDAzNWc2LTU0bnQudHh0ICAgICAgICB8IDI3ICsrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFu
ZWwva2luZ2Rpc3BsYXksa2QwMzVnNi01NG50LnR4dAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2tpbmdkaXNwbGF5LGtkMDM1ZzYt
NTRudC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5l
bC9raW5nZGlzcGxheSxrZDAzNWc2LTU0bnQudHh0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAwMC4uYTZlNGE5YWY0OTI1Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwva2luZ2Rpc3BsYXksa2QwMzVn
Ni01NG50LnR4dApAQCAtMCwwICsxLDI3IEBACitLaW5nIERpc3BsYXkgS0QwMzVHNi01NE5UIDMu
NSIgKDMyMHgyNDAgcGl4ZWxzKSAyNC1iaXQgVEZUIExDRCBwYW5lbAorCitSZXF1aXJlZCBwcm9w
ZXJ0aWVzOgorLSBjb21wYXRpYmxlOiBzaG91bGQgYmUgImtpbmdkaXNwbGF5LGtkMDM1ZzYtNTRu
dCIKKy0gcG93ZXItc3VwcGx5OiBTZWUgcGFuZWwtY29tbW9uLnR4dAorLSByZXNldC1ncGlvczog
U2VlIHBhbmVsLWNvbW1vbi50eHQKKworT3B0aW9uYWwgcHJvcGVydGllczoKKy0gYmFja2xpZ2h0
OiBzZWUgcGFuZWwtY29tbW9uLnR4dAorCitFeGFtcGxlOgorCismc3BpIHsKKwlkaXNwbGF5LXBh
bmVsIHsKKwkJY29tcGF0aWJsZSA9ICJraW5nZGlzcGxheSxrZDAzNWc2LTU0bnQiOworCQlyZWcg
PSA8MD47CisKKwkJc3BpLW1heC1mcmVxdWVuY3kgPSA8MzEyNTAwMD47CisJCXNwaS0zd2lyZTsK
KwkJc3BpLWNzLWhpZ2g7CisKKwkJcmVzZXQtZ3Bpb3MgPSA8JmdwZSAyIEdQSU9fQUNUSVZFX0xP
Vz47CisKKwkJYmFja2xpZ2h0ID0gPCZiYWNrbGlnaHQ+OworCQlwb3dlci1zdXBwbHkgPSA8Jmxk
bzY+OworCX07Cit9OwotLSAKMi4yMS4wLjU5My5nNTExZWMzNDVlMTgKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
