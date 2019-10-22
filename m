Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF39ADFBE7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 04:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9043D6E369;
	Tue, 22 Oct 2019 02:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C986E358
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 02:40:29 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-4KKH-D0uMUWkmlss76nB1A-1; Mon, 21 Oct 2019 22:40:24 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 622141005500;
 Tue, 22 Oct 2019 02:40:22 +0000 (UTC)
Received: from malachite.redhat.com (ovpn-120-98.rdu2.redhat.com
 [10.10.120.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79BAB60161;
 Tue, 22 Oct 2019 02:40:16 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 08/14] drm/dp_mst: Lessen indenting in
 drm_dp_mst_topology_mgr_resume()
Date: Mon, 21 Oct 2019 22:36:03 -0400
Message-Id: <20191022023641.8026-9-lyude@redhat.com>
In-Reply-To: <20191022023641.8026-1-lyude@redhat.com>
References: <20191022023641.8026-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 4KKH-D0uMUWkmlss76nB1A-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571712028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=db9/FSAmKT0MnuPKHIiAKkFAQGlG8AAFjVTq9TTRJZQ=;
 b=VvNvMH8RtJhfXRhgbaXoJCo8BodBsXsu2x7/raJChoPEmwnXri0U3aM7CXYNTmAanD1yMM
 RnWTW1aaRe/3BZKm0h8sTJrwAGHHiH30zTwgXjygV/x/zKr4FaDlO68uu0hy703cGonoyP
 KH8ayEV9mL74ALUwoXM+cJrwXXH3e+s=
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, Harry Wentland <hwentlan@amd.com>,
 Juston Li <juston.li@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG9lcyB3aGF0IGl0IHNheXMgb24gdGhlIHRpbi4KCkNjOiBKdXN0b24gTGkgPGp1c3Rvbi5saUBp
bnRlbC5jb20+CkNjOiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+CkNjOiBWaWxsZSBT
eXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogSGFycnkgV2VudGxh
bmQgPGh3ZW50bGFuQGFtZC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZm
d2xsLmNoPgpSZXZpZXdlZC1ieTogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+ClNpZ25lZC1v
ZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDU5ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4IGM4ZTIxOGI5MDJhZS4uZDQ4NmQxNWFh
MDAyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAgLTMyMTIsNDUgKzMy
MTIsNDQgQEAgRVhQT1JUX1NZTUJPTChkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9zdXNwZW5kKTsK
ICAqLwogaW50IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3Jlc3VtZShzdHJ1Y3QgZHJtX2RwX21z
dF90b3BvbG9neV9tZ3IgKm1ncikKIHsKLQlpbnQgcmV0ID0gMDsKKwlpbnQgcmV0OworCXU4IGd1
aWRbMTZdOwogCiAJbXV0ZXhfbG9jaygmbWdyLT5sb2NrKTsKKwlpZiAoIW1nci0+bXN0X3ByaW1h
cnkpCisJCWdvdG8gb3V0X2ZhaWw7CiAKLQlpZiAobWdyLT5tc3RfcHJpbWFyeSkgewotCQlpbnQg
c3JldDsKLQkJdTggZ3VpZFsxNl07CisJcmV0ID0gZHJtX2RwX2RwY2RfcmVhZChtZ3ItPmF1eCwg
RFBfRFBDRF9SRVYsIG1nci0+ZHBjZCwKKwkJCSAgICAgICBEUF9SRUNFSVZFUl9DQVBfU0laRSk7
CisJaWYgKHJldCAhPSBEUF9SRUNFSVZFUl9DQVBfU0laRSkgeworCQlEUk1fREVCVUdfS01TKCJk
cGNkIHJlYWQgZmFpbGVkIC0gdW5kb2NrZWQgZHVyaW5nIHN1c3BlbmQ/XG4iKTsKKwkJZ290byBv
dXRfZmFpbDsKKwl9CiAKLQkJc3JldCA9IGRybV9kcF9kcGNkX3JlYWQobWdyLT5hdXgsIERQX0RQ
Q0RfUkVWLCBtZ3ItPmRwY2QsIERQX1JFQ0VJVkVSX0NBUF9TSVpFKTsKLQkJaWYgKHNyZXQgIT0g
RFBfUkVDRUlWRVJfQ0FQX1NJWkUpIHsKLQkJCURSTV9ERUJVR19LTVMoImRwY2QgcmVhZCBmYWls
ZWQgLSB1bmRvY2tlZCBkdXJpbmcgc3VzcGVuZD9cbiIpOwotCQkJcmV0ID0gLTE7Ci0JCQlnb3Rv
IG91dF91bmxvY2s7Ci0JCX0KKwlyZXQgPSBkcm1fZHBfZHBjZF93cml0ZWIobWdyLT5hdXgsIERQ
X01TVE1fQ1RSTCwKKwkJCQkgRFBfTVNUX0VOIHwKKwkJCQkgRFBfVVBfUkVRX0VOIHwKKwkJCQkg
RFBfVVBTVFJFQU1fSVNfU1JDKTsKKwlpZiAocmV0IDwgMCkgeworCQlEUk1fREVCVUdfS01TKCJt
c3Qgd3JpdGUgZmFpbGVkIC0gdW5kb2NrZWQgZHVyaW5nIHN1c3BlbmQ/XG4iKTsKKwkJZ290byBv
dXRfZmFpbDsKKwl9CiAKLQkJcmV0ID0gZHJtX2RwX2RwY2Rfd3JpdGViKG1nci0+YXV4LCBEUF9N
U1RNX0NUUkwsCi0JCQkJCSBEUF9NU1RfRU4gfCBEUF9VUF9SRVFfRU4gfCBEUF9VUFNUUkVBTV9J
U19TUkMpOwotCQlpZiAocmV0IDwgMCkgewotCQkJRFJNX0RFQlVHX0tNUygibXN0IHdyaXRlIGZh
aWxlZCAtIHVuZG9ja2VkIGR1cmluZyBzdXNwZW5kP1xuIik7Ci0JCQlyZXQgPSAtMTsKLQkJCWdv
dG8gb3V0X3VubG9jazsKLQkJfQorCS8qIFNvbWUgaHVicyBmb3JnZXQgdGhlaXIgZ3VpZHMgYWZ0
ZXIgdGhleSByZXN1bWUgKi8KKwlyZXQgPSBkcm1fZHBfZHBjZF9yZWFkKG1nci0+YXV4LCBEUF9H
VUlELCBndWlkLCAxNik7CisJaWYgKHJldCAhPSAxNikgeworCQlEUk1fREVCVUdfS01TKCJkcGNk
IHJlYWQgZmFpbGVkIC0gdW5kb2NrZWQgZHVyaW5nIHN1c3BlbmQ/XG4iKTsKKwkJZ290byBvdXRf
ZmFpbDsKKwl9CisJZHJtX2RwX2NoZWNrX21zdGJfZ3VpZChtZ3ItPm1zdF9wcmltYXJ5LCBndWlk
KTsKIAotCQkvKiBTb21lIGh1YnMgZm9yZ2V0IHRoZWlyIGd1aWRzIGFmdGVyIHRoZXkgcmVzdW1l
ICovCi0JCXNyZXQgPSBkcm1fZHBfZHBjZF9yZWFkKG1nci0+YXV4LCBEUF9HVUlELCBndWlkLCAx
Nik7Ci0JCWlmIChzcmV0ICE9IDE2KSB7Ci0JCQlEUk1fREVCVUdfS01TKCJkcGNkIHJlYWQgZmFp
bGVkIC0gdW5kb2NrZWQgZHVyaW5nIHN1c3BlbmQ/XG4iKTsKLQkJCXJldCA9IC0xOwotCQkJZ290
byBvdXRfdW5sb2NrOwotCQl9Ci0JCWRybV9kcF9jaGVja19tc3RiX2d1aWQobWdyLT5tc3RfcHJp
bWFyeSwgZ3VpZCk7CisJbXV0ZXhfdW5sb2NrKCZtZ3ItPmxvY2spOwogCi0JCXJldCA9IDA7Ci0J
fSBlbHNlCi0JCXJldCA9IC0xOworCXJldHVybiAwOwogCi1vdXRfdW5sb2NrOgorb3V0X2ZhaWw6
CiAJbXV0ZXhfdW5sb2NrKCZtZ3ItPmxvY2spOwotCXJldHVybiByZXQ7CisJcmV0dXJuIC0xOwog
fQogRVhQT1JUX1NZTUJPTChkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9yZXN1bWUpOwogCi0tIAoy
LjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
