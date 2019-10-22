Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1999DFF01
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 10:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF6D6E436;
	Tue, 22 Oct 2019 08:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F076E432
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:05:55 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-yq8PqrZiMIu0kX-iL-wLUw-1; Tue, 22 Oct 2019 04:05:51 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2063F800D4E;
 Tue, 22 Oct 2019 08:05:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E4865C219;
 Tue, 22 Oct 2019 08:05:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7BE489D69; Tue, 22 Oct 2019 10:05:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/virtio: print a single line with device features
Date: Tue, 22 Oct 2019 10:05:42 +0200
Message-Id: <20191022080546.19769-2-kraxel@redhat.com>
In-Reply-To: <20191022080546.19769-1-kraxel@redhat.com>
References: <20191022080546.19769-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: yq8PqrZiMIu0kX-iL-wLUw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571731554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UJBqHCwpIBtwLyrKpDMAXOjT9q0eBo6gpCpHT0A5CYs=;
 b=OfzZYsIxoTZL5FU4Ec5ah5XCRWgHYtDEGlfKna81CPHTJ/rZ5q5hseBTpV++d2yslGrHeq
 FDw9Ioqb8UmG4AF0ftfaIuG2mOlw/aEiJuNbMe6c0sOQZEdnhLP+zQeup5brqPYpbow/m1
 d7VamujHSQSk3M0eN4p0w/JLwypqC/U=
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2ttcy5jIHwgOSArKysrLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRp
by92aXJ0Z3B1X2ttcy5jCmluZGV4IDBiM2NkYjBkODNiMC4uMmY1NzczZTQzNTU3IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfa21zLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2ttcy5jCkBAIC0xNTUsMTYgKzE1NSwxNSBAQCBpbnQgdmly
dGlvX2dwdV9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAjaWZkZWYgX19MSVRUTEVfRU5E
SUFOCiAJaWYgKHZpcnRpb19oYXNfZmVhdHVyZSh2Z2Rldi0+dmRldiwgVklSVElPX0dQVV9GX1ZJ
UkdMKSkKIAkJdmdkZXYtPmhhc192aXJnbF8zZCA9IHRydWU7Ci0JRFJNX0lORk8oInZpcmdsIDNk
IGFjY2VsZXJhdGlvbiAlc1xuIiwKLQkJIHZnZGV2LT5oYXNfdmlyZ2xfM2QgPyAiZW5hYmxlZCIg
OiAibm90IHN1cHBvcnRlZCBieSBob3N0Iik7Ci0jZWxzZQotCURSTV9JTkZPKCJ2aXJnbCAzZCBh
Y2NlbGVyYXRpb24gbm90IHN1cHBvcnRlZCBieSBndWVzdFxuIik7CiAjZW5kaWYKIAlpZiAodmly
dGlvX2hhc19mZWF0dXJlKHZnZGV2LT52ZGV2LCBWSVJUSU9fR1BVX0ZfRURJRCkpIHsKIAkJdmdk
ZXYtPmhhc19lZGlkID0gdHJ1ZTsKLQkJRFJNX0lORk8oIkVESUQgc3VwcG9ydCBhdmFpbGFibGUu
XG4iKTsKIAl9CiAKKwlEUk1fSU5GTygiZmVhdHVyZXM6ICVjdmlyZ2wgJWNlZGlkXG4iLAorCQkg
dmdkZXYtPmhhc192aXJnbF8zZCA/ICcrJyA6ICctJywKKwkJIHZnZGV2LT5oYXNfZWRpZCAgICAg
PyAnKycgOiAnLScpOworCiAJcmV0ID0gdmlydGlvX2ZpbmRfdnFzKHZnZGV2LT52ZGV2LCAyLCB2
cXMsIGNhbGxiYWNrcywgbmFtZXMsIE5VTEwpOwogCWlmIChyZXQpIHsKIAkJRFJNX0VSUk9SKCJm
YWlsZWQgdG8gZmluZCB2aXJ0IHF1ZXVlc1xuIik7Ci0tIAoyLjE4LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
