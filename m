Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D55633FAA
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3290889711;
	Tue,  4 Jun 2019 07:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6AB589243
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 15:41:21 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Hans Verkuil <hansverk@cisco.com>
Subject: [PATCH v4 2/3] media: uapi: Add RGB bus format for the GiantPlus
 GPM940B0 panel
Date: Mon,  3 Jun 2019 17:35:10 +0200
Message-Id: <20190603153511.24384-2-paul@crapouillou.net>
In-Reply-To: <20190603153511.24384-1-paul@crapouillou.net>
References: <20190603153511.24384-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 04 Jun 2019 07:14:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1559576120; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7r5nkRsqjWYhBqtk66cNgvdETdf2nddmTlBNaVS+Hvw=;
 b=n8bhRenSLUwqZGKRST5uOAdZKmzDRc5PXo2s8jCW/xIXSZPP+3UrbJEDobxr7ZK97m9qay
 m8XvMNVabHubdQoqxdJoutIWKGfo1AdnjVlEfheehLdSXw+r3i2K645DRs+dwTD7mmS821
 yWGohoQtlZ0rgj5WiJvHEpLrqSyMY+Y=
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
 od@zcrc.me, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEdpYW50UGx1cyBHUE05NDBCMCBpcyBhIDI0LWJpdCBURlQgcGFuZWwgd2hlcmUgdGhlIFJH
QiBjb21wb25lbnRzCmFyZSB0cmFuc2ZlcnJlZCBzZXF1ZW50aWFsbHkgb24gYSA4LWJpdCBidXMu
CgpTaWduZWQtb2ZmLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4KLS0t
CgpOb3RlczoKICAgIHYyOiBOZXcgcGF0Y2gKICAgIAogICAgdjM6IE5vIGNoYW5nZQogICAgCiAg
ICB2NDogQWRkIG9ubHkgTUVESUFfQlVTX0ZNVF9SR0I4ODhfM1g4LCBhcyB3ZSBkb24ndCBoYXZl
IHRvIGNhcmUgYWJvdXQKICAgICAgICBlbmRpYW5uZXNzCgogaW5jbHVkZS91YXBpL2xpbnV4L21l
ZGlhLWJ1cy1mb3JtYXQuaCB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L21lZGlhLWJ1
cy1mb3JtYXQuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9tZWRpYS1idXMtZm9ybWF0LmgKaW5kZXgg
MmE2YjI1M2NmYjA1Li4xNmMxZmEyZDg5YTQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9saW51
eC9tZWRpYS1idXMtZm9ybWF0LmgKKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L21lZGlhLWJ1cy1m
b3JtYXQuaApAQCAtMzQsNyArMzQsNyBAQAogCiAjZGVmaW5lIE1FRElBX0JVU19GTVRfRklYRUQJ
CQkweDAwMDEKIAotLyogUkdCIC0gbmV4dCBpcwkweDEwMWMgKi8KKy8qIFJHQiAtIG5leHQgaXMJ
MHgxMDFkICovCiAjZGVmaW5lIE1FRElBX0JVU19GTVRfUkdCNDQ0XzFYMTIJCTB4MTAxNgogI2Rl
ZmluZSBNRURJQV9CVVNfRk1UX1JHQjQ0NF8yWDhfUEFESElfQkUJMHgxMDAxCiAjZGVmaW5lIE1F
RElBX0JVU19GTVRfUkdCNDQ0XzJYOF9QQURISV9MRQkweDEwMDIKQEAgLTU1LDYgKzU1LDcgQEAK
ICNkZWZpbmUgTUVESUFfQlVTX0ZNVF9SR0I4ODhfMVgyNAkJMHgxMDBhCiAjZGVmaW5lIE1FRElB
X0JVU19GTVRfUkdCODg4XzJYMTJfQkUJCTB4MTAwYgogI2RlZmluZSBNRURJQV9CVVNfRk1UX1JH
Qjg4OF8yWDEyX0xFCQkweDEwMGMKKyNkZWZpbmUgTUVESUFfQlVTX0ZNVF9SR0I4ODhfM1g4CQkw
eDEwMWMKICNkZWZpbmUgTUVESUFfQlVTX0ZNVF9SR0I4ODhfMVg3WDRfU1BXRwkJMHgxMDExCiAj
ZGVmaW5lIE1FRElBX0JVU19GTVRfUkdCODg4XzFYN1g0X0pFSURBCTB4MTAxMgogI2RlZmluZSBN
RURJQV9CVVNfRk1UX0FSR0I4ODg4XzFYMzIJCTB4MTAwZAotLSAKMi4yMS4wLjU5My5nNTExZWMz
NDVlMTgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
