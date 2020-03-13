Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B95F21842D6
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 09:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193FC6EB94;
	Fri, 13 Mar 2020 08:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD366EB9C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 08:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584088920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Q1pZ4Lhma5LPVEqgVqJfCI4f3LH9j99dnRUjzZXge/Y=;
 b=eI+P4eEJD1fNr+BtsiMn2A9T2MAT3EpMWLxHRZpbhF9QrwQhty3nKTnEq85Vl/8spSnzM0
 0JyKfClKCAUwtejYL2sFthGYfYPJEYSYzZ/OXvKYsUgMVPI7vMU0FYa50AgLF3wbf8YOzp
 s5PFPJMofVyBQnCbXn317+7IStp1dIw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-Jmc8h6G_PcarGr57YALgWQ-1; Fri, 13 Mar 2020 04:41:58 -0400
X-MC-Unique: Jmc8h6G_PcarGr57YALgWQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E45B18C8C00;
 Fri, 13 Mar 2020 08:41:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-117.ams2.redhat.com
 [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC24160C99;
 Fri, 13 Mar 2020 08:41:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C8AC717444; Fri, 13 Mar 2020 09:41:52 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/bochs: downgrade pci_request_region failure from error
 to warning
Date: Fri, 13 Mar 2020 09:41:52 +0100
Message-Id: <20200313084152.2734-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Y2hzL2JvY2hzX2h3LmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9j
aHNfaHcuYyBiL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19ody5jCmluZGV4IDk1MjE5OWNj
MDQ2Mi4uZGNlNDY3MmUzZmM4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9j
aHNfaHcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfaHcuYwpAQCAtMTU3LDEw
ICsxNTcsOCBAQCBpbnQgYm9jaHNfaHdfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCQlz
aXplID0gbWluKHNpemUsIG1lbSk7CiAJfQogCi0JaWYgKHBjaV9yZXF1ZXN0X3JlZ2lvbihwZGV2
LCAwLCAiYm9jaHMtZHJtIikgIT0gMCkgewotCQlEUk1fRVJST1IoIkNhbm5vdCByZXF1ZXN0IGZy
YW1lYnVmZmVyXG4iKTsKLQkJcmV0dXJuIC1FQlVTWTsKLQl9CisJaWYgKHBjaV9yZXF1ZXN0X3Jl
Z2lvbihwZGV2LCAwLCAiYm9jaHMtZHJtIikgIT0gMCkKKwkJRFJNX1dBUk4oIkNhbm5vdCByZXF1
ZXN0IGZyYW1lYnVmZmVyLCBib290IGZiIHN0aWxsIGFjdGl2ZT9cbiIpOwogCiAJYm9jaHMtPmZi
X21hcCA9IGlvcmVtYXAoYWRkciwgc2l6ZSk7CiAJaWYgKGJvY2hzLT5mYl9tYXAgPT0gTlVMTCkg
ewotLSAKMi4xOC4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
