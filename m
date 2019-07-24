Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E56217482C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 09:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948B66E67C;
	Thu, 25 Jul 2019 07:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp09.smtpout.orange.fr
 [80.12.242.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1676E65A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 21:38:39 +0000 (UTC)
Received: from localhost.localdomain ([92.140.204.221]) by mwinf5d44 with ME
 id gleY200114n7eLC03leZD3; Wed, 24 Jul 2019 23:38:37 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 24 Jul 2019 23:38:37 +0200
X-ME-IP: 92.140.204.221
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 b.zolnierkie@samsung.com
Subject: [PATCH] backlight: lms283gf05: Fix a typo in the description passed
 to 'devm_gpio_request_one()'
Date: Wed, 24 Jul 2019 23:38:28 +0200
Message-Id: <20190724213828.16916-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 25 Jul 2019 07:29:33 +0000
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRlc2NyaXB0aW9uIHBhc3NlZCB0byAnZGV2bV9ncGlvX3JlcXVlc3Rfb25lKCknIHNob3Vs
ZCBiZSByZWxhdGVkIHRvCkxNUzI4M0dGMDUsIG5vdCBMTVMyODVHRjA1LgoKU2lnbmVkLW9mZi1i
eTogQ2hyaXN0b3BoZSBKQUlMTEVUIDxjaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRvby5mcj4KLS0t
CiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbXMyODNnZjA1LmMgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9sbXMyODNnZjA1LmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9s
bXMyODNnZjA1LmMKaW5kZXggNDIzN2FhYTdmMjY5Li40YjYyZWQ3ZTU4YzAgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtczI4M2dmMDUuYworKysgYi9kcml2ZXJzL3ZpZGVv
L2JhY2tsaWdodC9sbXMyODNnZjA1LmMKQEAgLTE2MSw3ICsxNjEsNyBAQCBzdGF0aWMgaW50IGxt
czI4M2dmMDVfcHJvYmUoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkKIAkJcmV0ID0gZGV2bV9ncGlv
X3JlcXVlc3Rfb25lKCZzcGktPmRldiwgcGRhdGEtPnJlc2V0X2dwaW8sCiAJCQkJR1BJT0ZfRElS
X09VVCB8ICghcGRhdGEtPnJlc2V0X2ludmVydGVkID8KIAkJCQlHUElPRl9JTklUX0hJR0ggOiBH
UElPRl9JTklUX0xPVyksCi0JCQkJIkxNUzI4NUdGMDUgUkVTRVQiKTsKKwkJCQkiTE1TMjgzR0Yw
NSBSRVNFVCIpOwogCQlpZiAocmV0KQogCQkJcmV0dXJuIHJldDsKIAl9Ci0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
