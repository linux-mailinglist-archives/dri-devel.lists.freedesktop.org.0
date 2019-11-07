Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D39E2F292F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 09:34:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5FA6EEED;
	Thu,  7 Nov 2019 08:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B281A6EEEC
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 08:34:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2C098B130;
 Thu,  7 Nov 2019 08:34:07 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, sam@ravnborg.org,
 yc_chen@aspeedtech.com
Subject: [PATCH v2 3/9] drm/ast: Don't clear base address and offset with
 default values
Date: Thu,  7 Nov 2019 09:33:58 +0100
Message-Id: <20191107083404.6852-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107083404.6852-1-tzimmermann@suse.de>
References: <20191107083404.6852-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNvbnRlbnQgb2YgdGhlIGJhc2UtYWRkcmVzcyBhbmQgb2Zmc2V0IHJlZ2lzdGVycyBhcmUg
c3RhdGUgb2YKdGhlIHByaW1hcnkgcGxhbmUuIENsZWFyaW5nIGl0IHRvIGRlZmF1bHQgdmFsdWVz
IHdpbGwgaW50ZXJmZXJlIHdpdGgKcGxhbmUgZnVuY3Rpb25zIGZvciBhdG9taWMgbW9kZSBzZXR0
aW5nLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+CkFja2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgfCA4ICsrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hc3QvYXN0X21vZGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYwppbmRl
eCBiMTNlYWEyNjE5YWIuLmIzZjgyYzJkMjc0ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FzdC9hc3RfbW9kZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYwpAQCAt
MjUzLDkgKzI1MywxMyBAQCBzdGF0aWMgdm9pZCBhc3Rfc2V0X3N0ZF9yZWcoc3RydWN0IGRybV9j
cnRjICpjcnRjLCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZQogCQlhc3Rfc2V0X2luZGV4
X3JlZyhhc3QsIEFTVF9JT19TRVFfUE9SVCwgKGkgKyAxKSAsIGpyZWcpOwogCX0KIAotCS8qIFNl
dCBDUlRDICovCisJLyogU2V0IENSVEM7IGV4Y2VwdCBiYXNlIGFkZHJlc3MgYW5kIG9mZnNldCAq
LwogCWFzdF9zZXRfaW5kZXhfcmVnX21hc2soYXN0LCBBU1RfSU9fQ1JUQ19QT1JULCAweDExLCAw
eDdmLCAweDAwKTsKLQlmb3IgKGkgPSAwOyBpIDwgMjU7IGkrKykKKwlmb3IgKGkgPSAwOyBpIDwg
MTI7IGkrKykKKwkJYXN0X3NldF9pbmRleF9yZWcoYXN0LCBBU1RfSU9fQ1JUQ19QT1JULCBpLCBz
dGR0YWJsZS0+Y3J0Y1tpXSk7CisJZm9yIChpID0gMTQ7IGkgPCAxOTsgaSsrKQorCQlhc3Rfc2V0
X2luZGV4X3JlZyhhc3QsIEFTVF9JT19DUlRDX1BPUlQsIGksIHN0ZHRhYmxlLT5jcnRjW2ldKTsK
Kwlmb3IgKGkgPSAyMDsgaSA8IDI1OyBpKyspCiAJCWFzdF9zZXRfaW5kZXhfcmVnKGFzdCwgQVNU
X0lPX0NSVENfUE9SVCwgaSwgc3RkdGFibGUtPmNydGNbaV0pOwogCiAJLyogc2V0IEFSICovCi0t
IAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
