Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DE6CC062
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 18:22:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373A96EBDF;
	Fri,  4 Oct 2019 16:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F766EBDF
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 16:21:59 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iGQL7-0007LQ-13; Fri, 04 Oct 2019 16:21:57 +0000
From: Colin King <colin.king@canonical.com>
To: James Wang <james.qian.wang@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Brian Starkey <brian.starkey@arm.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/komeda: remove redundant assignment to pointer
 disable_done
Date: Fri,  4 Oct 2019 17:21:56 +0100
Message-Id: <20191004162156.325-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSBwb2lu
dGVyIGRpc2FibGVfZG9uZSBpcyBiZWluZyBpbml0aWFsaXplZCB3aXRoIGEgdmFsdWUgdGhhdApp
cyBuZXZlciByZWFkIGFuZCBpcyBiZWluZyByZS1hc3NpZ25lZCBhIGxpdHRsZSBsYXRlciBvbi4g
VGhlCmFzc2lnbm1lbnQgaXMgcmVkdW5kYW50IGFuZCBoZW5jZSBjYW4gYmUgcmVtb3ZlZC4KCkFk
ZHJlc3Nlcy1Db3Zlcml0eTogKCJVbnVzZWQgdmFsdWUiKQpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJ
YW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwppbmRleCA3NTI2M2Q4Y2QwYmQuLjliZWVkYTA0
ODE4YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2NydGMuYwpAQCAtMjk2LDcgKzI5Niw3IEBAIGtvbWVkYV9jcnRjX2F0b21pY19kaXNhYmxlKHN0
cnVjdCBkcm1fY3J0YyAqY3J0YywKIAlzdHJ1Y3Qga29tZWRhX2NydGNfc3RhdGUgKm9sZF9zdCA9
IHRvX2tjcnRjX3N0KG9sZCk7CiAJc3RydWN0IGtvbWVkYV9waXBlbGluZSAqbWFzdGVyID0ga2Ny
dGMtPm1hc3RlcjsKIAlzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICpzbGF2ZSAgPSBrY3J0Yy0+c2xh
dmU7Ci0Jc3RydWN0IGNvbXBsZXRpb24gKmRpc2FibGVfZG9uZSA9ICZjcnRjLT5zdGF0ZS0+Y29t
bWl0LT5mbGlwX2RvbmU7CisJc3RydWN0IGNvbXBsZXRpb24gKmRpc2FibGVfZG9uZTsKIAlib29s
IG5lZWRzX3BoYXNlMiA9IGZhbHNlOwogCiAJRFJNX0RFQlVHX0FUT01JQygiQ1JUQyVkX0RJU0FC
TEU6IGFjdGl2ZV9waXBlczogMHgleCwgYWZmZWN0ZWQ6IDB4JXhcbiIsCi0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
