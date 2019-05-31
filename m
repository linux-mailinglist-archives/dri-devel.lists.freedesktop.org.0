Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 547BA315BF
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 21:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5089898F1;
	Fri, 31 May 2019 19:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5D18921B;
 Fri, 31 May 2019 09:46:32 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 674EB45089;
 Fri, 31 May 2019 09:46:31 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com, sean@poorly.run, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 airlied@linux.ie, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 linus.walleij@linaro.org, jonathan@marek.ca, robh@kernel.org,
 jeffrey.l.hugo@gmail.com
Subject: [PATCH v3 3/6] ARM: qcom_defconfig: add display-related options
Date: Fri, 31 May 2019 05:46:16 -0400
Message-Id: <20190531094619.31704-4-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190531094619.31704-1-masneyb@onstation.org>
References: <20190531094619.31704-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 31 May 2019 19:58:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1559295991;
 bh=GfSdmq3XfKPVisM175rcc6VtQUZljvT4gXjyX0xcI2U=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=vJmnZN7Me1oWPD6ETPN6lypSi4hRmEhZMfiqd+SGabybfHG8C5JATXKvWyxng8XfC
 3JqOo6y1rOKQjOKcgQi0NhxVais/esj18VEXHfGdUmbpbir9q1Xclg7OuRdqQSetXd
 Uefc/r0EBBJ2pLn12ahYg17aEuieQ3w9S0scx4LY=
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
L0tNUyBkcml2ZXIsCnRoZSBzaW1wbGUgcGFuZWwsIGFuZCB0aGUgVEkgTE0zNjMwQSBkcml2ZXIg
aW4gb3JkZXIgdG8gc3VwcG9ydCB0aGUKZGlzcGxheSBvbiB0aGUgTEcgTmV4dXMgNSAoaGFtbWVy
aGVhZCkgcGhvbmUuCgpTaWduZWQtb2ZmLWJ5OiBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0
aW9uLm9yZz4KUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJv
Lm9yZz4KLS0tCiBhcmNoL2FybS9jb25maWdzL3Fjb21fZGVmY29uZmlnIHwgNSArKysrKwogMSBm
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
