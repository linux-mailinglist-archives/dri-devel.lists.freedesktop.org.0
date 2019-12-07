Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7321A115F95
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 23:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1001F6E28E;
	Sat,  7 Dec 2019 22:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73C36E28E
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 22:48:58 +0000 (UTC)
Received: from ziggy.de (unknown [95.169.229.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E7D402467B;
 Sat,  7 Dec 2019 22:48:53 +0000 (UTC)
From: matthias.bgg@kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Subject: [resend PATCH v6 11/12] clk: mediatek: mt8173: switch mmsys to
 platform device probing
Date: Sat,  7 Dec 2019 23:47:39 +0100
Message-Id: <20191207224740.24536-12-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207224740.24536-1-matthias.bgg@kernel.org>
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1575758938;
 bh=JSPEnmIDkobd2bvgU/0fVPQfLB35GOvh84DoJ03YQtA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xRNWDRcrxBWatU0mYCZ/bQCA2Sx1J9ELv0b+8QQIDYu/2iRklhA6BHVCwFCkLtABm
 f4U9Ni/4irWC2wton2yVqNXQnWFuJptWlKr2+j4HOVO0UymtSMpQEBPRHsxpxEAVki
 0QZ36lLj/pSLZzpmE5y1sKBhQQt0zxeQJm+M1p7A=
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
Cc: devicetree@vger.kernel.org, rdunlap@infradead.org, matthias.bgg@kernel.org,
 frank-w@public-files.de, sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sean.wang@kernel.org, wens@csie.org,
 drinkcat@chromium.org, linux-mediatek@lists.infradead.org, mbrugger@suse.com,
 hsinyi@chromium.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWF0dGhpYXMgQnJ1Z2dlciA8bWJydWdnZXJAc3VzZS5jb20+CgpTd2l0Y2ggcHJvYmlu
ZyBmb3IgdGhlIE1NU1lTIHRvIHN1cHBvcnQgaW52b2NhdGlvbiB0byBhCnBsYWluIHBhbHRmb3Jt
IGRldmljZS4gVGhlIGRyaXZlciB3aWxsIGJlIHByb2JlZCBieSB0aGUgRFJNIHN1YnN5c3RlbS4K
ClNpZ25lZC1vZmYtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1icnVnZ2VyQHN1c2UuY29tPgotLS0K
IGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxNzMuYyB8IDUxICsrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxNzMuYyBi
L2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxNzMuYwppbmRleCA1MzdhN2Y0OWIwZjcuLjFl
NmEzOTA1MzRlNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE3My5j
CisrKyBiL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxNzMuYwpAQCAtNSw4ICs1LDExIEBA
CiAgKi8KIAogI2luY2x1ZGUgPGxpbnV4L2Nsay5oPgorI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5o
PgogI2luY2x1ZGUgPGxpbnV4L29mLmg+CiAjaW5jbHVkZSA8bGludXgvb2ZfYWRkcmVzcy5oPgor
I2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgorI2luY2x1ZGUgPGxpbnV4L3NsYWIu
aD4KIAogI2luY2x1ZGUgImNsay1tdGsuaCIKICNpbmNsdWRlICJjbGstZ2F0ZS5oIgpAQCAtNzgz
LDcgKzc4Niw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2dhdGVfcmVncyBtbTFfY2dfcmVn
cyBfX2luaXRjb25zdCA9IHsKIAkJLm9wcyA9ICZtdGtfY2xrX2dhdGVfb3BzX3NldGNsciwJCVwK
IAl9CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2dhdGUgbW1fY2xrc1tdIF9faW5pdGNvbnN0
ID0geworc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZ2F0ZSBtbV9jbGtzW10gPSB7CiAJLyogTU0w
ICovCiAJR0FURV9NTTAoQ0xLX01NX1NNSV9DT01NT04sICJtbV9zbWlfY29tbW9uIiwgIm1tX3Nl
bCIsIDApLAogCUdBVEVfTU0wKENMS19NTV9TTUlfTEFSQjAsICJtbV9zbWlfbGFyYjAiLCAibW1f
c2VsIiwgMSksCkBAIC0xMTQ0LDIyICsxMTQ3LDU2IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBtdGtf
aW1nc3lzX2luaXQoc3RydWN0IGRldmljZV9ub2RlICpub2RlKQogfQogQ0xLX09GX0RFQ0xBUkUo
bXRrX2ltZ3N5cywgIm1lZGlhdGVrLG10ODE3My1pbWdzeXMiLCBtdGtfaW1nc3lzX2luaXQpOwog
Ci1zdGF0aWMgdm9pZCBfX2luaXQgbXRrX21tc3lzX2luaXQoc3RydWN0IGRldmljZV9ub2RlICpu
b2RlKQoteworc3RydWN0IG10a19tbXN5c19wcml2IHsKIAlzdHJ1Y3QgY2xrX29uZWNlbGxfZGF0
YSAqY2xrX2RhdGE7Cit9OworCitzdGF0aWMgaW50IG10a19tbXN5c19wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQorewogCWludCByOworCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9k
ZTsKKwlzdHJ1Y3QgbXRrX21tc3lzX3ByaXYgKnByaXZhdGU7CisKKwlub2RlID0gcGRldi0+ZGV2
LnBhcmVudC0+b2Zfbm9kZTsKIAotCWNsa19kYXRhID0gbXRrX2FsbG9jX2Nsa19kYXRhKENMS19N
TV9OUl9DTEspOworCXByaXZhdGUgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpw
cml2YXRlKSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFwcml2YXRlKQorCQlyZXR1cm4gLUVOT01FTTsK
KworCXByaXZhdGUtPmNsa19kYXRhID0gbXRrX2FsbG9jX2Nsa19kYXRhKENMS19NTV9OUl9DTEsp
OworCisJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgcHJpdmF0ZSk7CiAKIAltdGtfY2xrX3Jl
Z2lzdGVyX2dhdGVzKG5vZGUsIG1tX2Nsa3MsIEFSUkFZX1NJWkUobW1fY2xrcyksCi0JCQkJCQlj
bGtfZGF0YSk7CisJCQkJCXByaXZhdGUtPmNsa19kYXRhKTsKIAotCXIgPSBvZl9jbGtfYWRkX3By
b3ZpZGVyKG5vZGUsIG9mX2Nsa19zcmNfb25lY2VsbF9nZXQsIGNsa19kYXRhKTsKKwlyID0gb2Zf
Y2xrX2FkZF9wcm92aWRlcihub2RlLCBvZl9jbGtfc3JjX29uZWNlbGxfZ2V0LAorCQkJCQlwcml2
YXRlLT5jbGtfZGF0YSk7CiAJaWYgKHIpCiAJCXByX2VycigiJXMoKTogY291bGQgbm90IHJlZ2lz
dGVyIGNsb2NrIHByb3ZpZGVyOiAlZFxuIiwKIAkJCV9fZnVuY19fLCByKTsKKworCXJldHVybiBy
OworfQorCitzdGF0aWMgaW50IG10a19tbXN5c19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKK3sKKwlzdHJ1Y3QgbXRrX21tc3lzX3ByaXYgKnByaXZhdGU7CisJcHJpdmF0ZSA9
IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOworCisJa2ZyZWUocHJpdmF0ZS0+Y2xrX2RhdGEp
OworCisJcmV0dXJuIDA7CiB9Ci1DTEtfT0ZfREVDTEFSRShtdGtfbW1zeXMsICJtZWRpYXRlayxt
dDgxNzMtbW1zeXMiLCBtdGtfbW1zeXNfaW5pdCk7CisKK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1f
ZHJpdmVyIGNsa19tdDgxNzNfbW1fZHJ2ID0geworCS5wcm9iZSA9IG10a19tbXN5c19wcm9iZSwK
KwkucmVtb3ZlID0gbXRrX21tc3lzX3JlbW92ZSwKKwkuZHJpdmVyID0geworCQkubmFtZSA9ICJj
bGstbXQ4MTczLW1tIiwKKwl9LAorfTsKK21vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoY2xrX210ODE3
M19tbV9kcnYpOwogCiBzdGF0aWMgdm9pZCBfX2luaXQgbXRrX3ZkZWNzeXNfaW5pdChzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5vZGUpCiB7Ci0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
