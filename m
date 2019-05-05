Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 074871452D
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 09:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1617D892B1;
	Mon,  6 May 2019 07:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9860A89150
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2019 13:04:28 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id BA15F45020;
 Sun,  5 May 2019 13:04:27 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com, sean@poorly.run, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 airlied@linux.ie, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 linus.walleij@linaro.org
Subject: [PATCH RFC 3/6] ARM: qcom_defconfig: add display-related options
Date: Sun,  5 May 2019 09:04:10 -0400
Message-Id: <20190505130413.32253-4-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190505130413.32253-1-masneyb@onstation.org>
References: <20190505130413.32253-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 May 2019 07:27:59 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1557061468;
 bh=v92AyPCn1P4raUZmqY/jYSVzVQHVlpLSuMVNF6JcSdM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gOGTKWDBiCwZH2EiDTCUMDDK1W7u5t8dbQPyOOzxK6+1X8Wn3CXE6esvzRTJyEHaU
 6IU+RVR0HM6ZTQ4zRTevXE24yWs/4cT4bujFDdTnZKnrNTbIW2+KZ1RBH4rX15A8Q6
 lSwk6J+g1JeY39kMwcNkuE6VFDe2Tp5WYwDY5Fsw=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHRoZSBDTUEgKENvbnRpZ3VvdXMgTWVtb3J5IEFsbG9jYXRvcikgZm9yIHRoZSBNU00gRFJN
IGRyaXZlciwgdGhlCnNpbXBsZSBwYW5lbCwgYW5kIHRoZSBUSSBMTTM2MzBBIGRyaXZlciBpbiBv
cmRlciB0byBzdXBwb3J0IHRoZSBkaXNwbGF5Cm9uIHRoZSBMRyBOZXh1cyA1IChoYW1tZXJoZWFk
KSBwaG9uZS4KClNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24u
b3JnPgotLS0KVGhlIHBhbmVsIGFuZCBiYWNrbGlnaHQgYXJlIGN1cnJlbnRseSBjb21waWxlZCBp
bnRvIHRoZSBrZXJuZWwsIGJ1dCB3aWxsCmJlIG1vdmVkIHRvIGJlIG1vZHVsZXMgb25jZSB0aGUg
ZGlzcGxheSBpcyBmdWxseSB3b3JraW5nIGluIGEgbGF0ZXIKdmVyaXNvbiBvZiB0aGlzIHBhdGNo
IHNlcmllcy4KCiBhcmNoL2FybS9jb25maWdzL3Fjb21fZGVmY29uZmlnIHwgNSArKysrKwogMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2NvbmZp
Z3MvcWNvbV9kZWZjb25maWcgYi9hcmNoL2FybS9jb25maWdzL3Fjb21fZGVmY29uZmlnCmluZGV4
IGMxODU0NzUxYzk5YS4uNGYwMjYzNmY4MzJlIDEwMDY0NAotLS0gYS9hcmNoL2FybS9jb25maWdz
L3Fjb21fZGVmY29uZmlnCisrKyBiL2FyY2gvYXJtL2NvbmZpZ3MvcWNvbV9kZWZjb25maWcKQEAg
LTM3LDYgKzM3LDcgQEAgQ09ORklHX0FSTV9DUFVJRExFPXkKIENPTkZJR19WRlA9eQogQ09ORklH
X05FT049eQogIyBDT05GSUdfQ09SRV9EVU1QX0RFRkFVTFRfRUxGX0hFQURFUlMgaXMgbm90IHNl
dAorQ09ORklHX0NNQT15CiBDT05GSUdfTkVUPXkKIENPTkZJR19QQUNLRVQ9eQogQ09ORklHX1VO
SVg9eQpAQCAtMTQ2LDEyICsxNDcsMTQgQEAgQ09ORklHX1JFR1VMQVRPUl9RQ09NX1NNRF9SUE09
eQogQ09ORklHX1JFR1VMQVRPUl9RQ09NX1NQTUk9eQogQ09ORklHX01FRElBX1NVUFBPUlQ9eQog
Q09ORklHX0RSTT15CitDT05GSUdfRFJNX1BBTkVMX1NJTVBMRT15CiBDT05GSUdfRkI9eQogQ09O
RklHX0ZSQU1FQlVGRkVSX0NPTlNPTEU9eQogQ09ORklHX0JBQ0tMSUdIVF9MQ0RfU1VQUE9SVD15
CiAjIENPTkZJR19MQ0RfQ0xBU1NfREVWSUNFIGlzIG5vdCBzZXQKIENPTkZJR19CQUNLTElHSFRf
Q0xBU1NfREVWSUNFPXkKICMgQ09ORklHX0JBQ0tMSUdIVF9HRU5FUklDIGlzIG5vdCBzZXQKK0NP
TkZJR19CQUNLTElHSFRfTE0zNjMwQT15CiBDT05GSUdfQkFDS0xJR0hUX0xQODU1WD15CiBDT05G
SUdfU09VTkQ9eQogQ09ORklHX1NORD15CkBAIC0yNjIsNiArMjY1LDggQEAgQ09ORklHX05MU19D
T0RFUEFHRV80Mzc9eQogQ09ORklHX05MU19BU0NJST15CiBDT05GSUdfTkxTX0lTTzg4NTlfMT15
CiBDT05GSUdfTkxTX1VURjg9eQorQ09ORklHX0RNQV9DTUE9eQorQ09ORklHX0NNQV9TSVpFX01C
WVRFUz0yNTYKIENPTkZJR19QUklOVEtfVElNRT15CiBDT05GSUdfRFlOQU1JQ19ERUJVRz15CiBD
T05GSUdfREVCVUdfSU5GTz15Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
