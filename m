Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF682605EF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 22:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7285D6E563;
	Mon,  7 Sep 2020 20:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D97B6E55C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 20:47:14 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-Yb1BQKHpPK2T1pE5fhBYKQ-1; Mon, 07 Sep 2020 16:47:09 -0400
X-MC-Unique: Yb1BQKHpPK2T1pE5fhBYKQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B9DC1074646;
 Mon,  7 Sep 2020 20:47:08 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-45.bne.redhat.com
 [10.64.54.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD1D360BE2;
 Mon,  7 Sep 2020 20:47:06 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/13] drm/ttm/agp: drop back end bindings from agp
Date: Tue,  8 Sep 2020 06:46:27 +1000
Message-Id: <20200907204630.1406528-11-airlied@gmail.com>
In-Reply-To: <20200907204630.1406528-1-airlied@gmail.com>
References: <20200907204630.1406528-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: gmail.com
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
Cc: kraxel@redhat.com, sroland@vmware.com, bskeggs@redhat.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KClRoZXNlIGFyZW4ndCB1c2Vk
IGFueW1vcmUuCgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2FncF9iYWNrZW5kLmMgfCA3IC0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2FncF9iYWNrZW5kLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9hZ3Bf
YmFja2VuZC5jCmluZGV4IGZiZjk4Y2QxYTNlNS4uODA3MmZiN2M1YmM4IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9hZ3BfYmFja2VuZC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2FncF9iYWNrZW5kLmMKQEAgLTExMiwxMiArMTEyLDYgQEAgdm9pZCB0dG1fYWdw
X2Rlc3Ryb3koc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCiB9CiBFWFBPUlRfU1lNQk9MKHR0
bV9hZ3BfZGVzdHJveSk7CiAKLXN0YXRpYyBzdHJ1Y3QgdHRtX2JhY2tlbmRfZnVuYyB0dG1fYWdw
X2Z1bmMgPSB7Ci0JLmJpbmQgPSB0dG1fYWdwX2JpbmQsCi0JLnVuYmluZCA9IHR0bV9hZ3BfdW5i
aW5kLAotCS5kZXN0cm95ID0gdHRtX2FncF9kZXN0cm95LAotfTsKLQogc3RydWN0IHR0bV90dCAq
dHRtX2FncF90dF9jcmVhdGUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAkJCQkgc3Ry
dWN0IGFncF9icmlkZ2VfZGF0YSAqYnJpZGdlLAogCQkJCSB1aW50MzJfdCBwYWdlX2ZsYWdzKQpA
QCAtMTMwLDcgKzEyNCw2IEBAIHN0cnVjdCB0dG1fdHQgKnR0bV9hZ3BfdHRfY3JlYXRlKHN0cnVj
dCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAKIAlhZ3BfYmUtPm1lbSA9IE5VTEw7CiAJYWdwX2Jl
LT5icmlkZ2UgPSBicmlkZ2U7Ci0JYWdwX2JlLT50dG0uZnVuYyA9ICZ0dG1fYWdwX2Z1bmM7CiAK
IAlpZiAodHRtX3R0X2luaXQoJmFncF9iZS0+dHRtLCBibywgcGFnZV9mbGFncykpIHsKIAkJa2Zy
ZWUoYWdwX2JlKTsKLS0gCjIuMjcuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
