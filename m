Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D947FDFEF5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 10:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335716E434;
	Tue, 22 Oct 2019 08:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9826E432
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:05:55 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-77PzIexSM6mR5SNpUUJk3Q-1; Tue, 22 Oct 2019 04:05:50 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDA0147B;
 Tue, 22 Oct 2019 08:05:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AA871001B2B;
 Tue, 22 Oct 2019 08:05:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 648EC16E08; Tue, 22 Oct 2019 10:05:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] drm/virtio: various cleanups
Date: Tue, 22 Oct 2019 10:05:41 +0200
Message-Id: <20191022080546.19769-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 77PzIexSM6mR5SNpUUJk3Q-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571731554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=V1UyKnhYXSPmEND2YuZnt8te64dwxPpdFVX/IvrJu9k=;
 b=Qb19WYMozaunfk+NkFTKAj7aqKeJd+jYuIcDcFv0d1hKoRnlXAGzaJRPJ+6RtPrjfrUYp4
 cGj0V2YS4Mj260XJxcGGphwylk1e7KxakV9iifsHUJzMkK7/HQt5bJQgYdZK5nd6U2qtSD
 Cg7UUuo8e0dK3k1Pzs+TWyTLbhTbn24=
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGl0dGxlIHBhdGNoIHNlcmllcyBkb2luZyBzb21lIGNsZWFudXBzIGluIHRoZSB2aXJ0aW8gZHJp
dmVyLgpQYXRjaGVzICMxICsgIzIgaGF2ZSBiZWVuIG9uIHRoZSBsaXN0IGJlZm9yZSBhcyBzaW5n
bGUgcGF0Y2hlcywKaW5jbHVkZXMgaGVyZSBhZ2FpbiBmb3IgcGF0Y2ggZGVwZW5kZW5jeSByZWFz
b25zLgoKcGxlYXNlIHJldmlldywKICBHZXJkCgpHZXJkIEhvZmZtYW5uICg1KToKICBkcm0vdmly
dGlvOiBwcmludCBhIHNpbmdsZSBsaW5lIHdpdGggZGV2aWNlIGZlYXR1cmVzCiAgZHJtL3ZpcnRp
bzogbW92ZSBieXRlb3JkZXIgaGFuZGxpbmcgaW50bwogICAgdmlydGlvX2dwdV9jbWRfdHJhbnNm
ZXJfdG9faG9zdF8yZCBmdW5jdGlvbgogIGRybS92aXJ0aW86IGZpeCBieXRlb3JkZXIgaGFuZGxp
bmcgaW4KICAgIHZpcnRpb19ncHVfY21kX3RyYW5zZmVyX3tmcm9tLHRvfV9ob3N0XzNkIGZ1bmN0
aW9ucwogIGRybS92aXJ0aW86IFNpbXBsaWZ5IHZpcnRpb19ncHVfcHJpbWFyeV9wbGFuZV91cGRh
dGUgd29ya2Zsb3cuCiAgZHJtL3ZpcnRpbzogZmFjdG9yIG91dCB2aXJ0aW9fZ3B1X3VwZGF0ZV9k
dW1iX2JvCgogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oICAgfCAgNCArLQog
ZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2ttcy5jICAgfCAgOSArKy0tCiBkcml2ZXJz
L2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcGxhbmUuYyB8IDc0ICsrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdnEuYyAgICB8IDI2ICsrKysr
Ky0tLQogNCBmaWxlcyBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspLCA0NyBkZWxldGlvbnMoLSkK
Ci0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
