Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A943F15573D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 12:58:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768B16EA95;
	Fri,  7 Feb 2020 11:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351E76EA95
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 11:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581076673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=l9Om1VdDqKQp4D0lip8cfLl2U7Dg5Wq0M3QVMJgD+1I=;
 b=E0XlqrGZKCxabNi9xji375bvgj4tiglvKYxpJYVGdhg0VxiT9xIedeP14MAJmxT2MJp1YJ
 U7VnTpesSJ5BVrUhnjtR5wFsDCnai7OCbrdSwEZw7+6DQrxlvqFbuqv1KYZl62fbQ+fE0q
 YIJAFxkXXxLvydB4LG8KQR02Ulhu2S4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-Wx585QMENKWhZ0HmxUjXYA-1; Fri, 07 Feb 2020 06:57:49 -0500
X-MC-Unique: Wx585QMENKWhZ0HmxUjXYA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30061DBA3;
 Fri,  7 Feb 2020 11:57:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 606D4790F2;
 Fri,  7 Feb 2020 11:57:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A26201747D; Fri,  7 Feb 2020 12:57:44 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/bochs: downgrade pci_request_region failure from error
 to warning
Date: Fri,  7 Feb 2020 12:57:44 +0100
Message-Id: <20200207115744.4559-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: marmarek@invisiblethingslab.com, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2h1dGRvd24gb2YgZmlybXdhcmUgZnJhbWVidWZmZXIgaGFzIGEgYnVuY2ggb2YgcHJvYmxlbXMu
ICBCZWNhdXNlCm9mIHRoaXMgdGhlIGZyYW1lYnVmZmVyIHJlZ2lvbiBtaWdodCBzdGlsbCBiZSBy
ZXNlcnZlZCBldmVuIGFmdGVyCmRybV9mYl9oZWxwZXJfcmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9m
cmFtZWJ1ZmZlcnMoKSByZXR1cm5lZC4KCkRvbid0IGNvbnNpZGVyIHBjaV9yZXF1ZXN0X3JlZ2lv
bigpIGZhaWx1cmUgZm9yIHRoZSBmcmFtZWJ1ZmZlcgpyZWdpb24gYXMgZmF0YWwgZXJyb3IgdG8g
d29ya2Fyb3VuZCB0aGlzIGlzc3VlLgoKUmVwb3J0ZWQtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1H
w7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KU2lnbmVkLW9mZi1ieTog
R2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Jv
Y2hzL2JvY2hzX2h3LmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19o
dy5jIGIvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2h3LmMKaW5kZXggYjYxNWI3ZGZkZDlk
Li5hMzg3ZWZhOWU1NTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19o
dy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19ody5jCkBAIC0xNTcsOCArMTU3
LDcgQEAgaW50IGJvY2hzX2h3X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAl9CiAKIAlp
ZiAocGNpX3JlcXVlc3RfcmVnaW9uKHBkZXYsIDAsICJib2Nocy1kcm0iKSAhPSAwKSB7Ci0JCURS
TV9FUlJPUigiQ2Fubm90IHJlcXVlc3QgZnJhbWVidWZmZXJcbiIpOwotCQlyZXR1cm4gLUVCVVNZ
OworCQlEUk1fV0FSTigiQ2Fubm90IHJlcXVlc3QgZnJhbWVidWZmZXIsIGJvb3QgZnJhbWVidWZm
ZXIgc3RpbGwgYWN0aXZlP1xuIik7CiAJfQogCiAJYm9jaHMtPmZiX21hcCA9IGlvcmVtYXAoYWRk
ciwgc2l6ZSk7Ci0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
