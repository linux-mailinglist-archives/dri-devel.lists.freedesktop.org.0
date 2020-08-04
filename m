Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7706F23B313
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953A26E402;
	Tue,  4 Aug 2020 02:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4466E402
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:58:53 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-vzjYIQeKOtapnTAo_xGShg-1; Mon, 03 Aug 2020 22:58:48 -0400
X-MC-Unique: vzjYIQeKOtapnTAo_xGShg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C79F1005504;
 Tue,  4 Aug 2020 02:58:47 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F31FA90E68;
 Tue,  4 Aug 2020 02:58:45 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 52/59] drm/amdgpu/ttm: remove man->bdev references.
Date: Tue,  4 Aug 2020 12:56:25 +1000
Message-Id: <20200804025632.3868079-53-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-1-airlied@gmail.com>
References: <20200804025632.3868079-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
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
Cc: sroland@vmware.com, christian.koenig@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KCkp1c3Qgc3RvcmUgdGhlIGRl
dmljZSBpbiB0aGUgcHJpdmF0ZSBzbyB0aGUgbGluawpjYW4gYmUgcmVtb3ZlZCBmcm9tIHRoZSBt
YW5hZ2VyCgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jIHwgNyArKysr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMKaW5kZXggMmIzN2Y0
MjY2ZGNiLi5iYmM1MjhjMGVkM2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV92cmFtX21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92cmFtX21nci5jCkBAIC0zNCw2ICszNCw3IEBAIHN0cnVjdCBhbWRncHVfdnJhbV9tZ3Ig
ewogCXNwaW5sb2NrX3QgbG9jazsKIAlhdG9taWM2NF90IHVzYWdlOwogCWF0b21pYzY0X3Qgdmlz
X3VzYWdlOworCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2OwogfTsKIAogc3RhdGljIGlubGlu
ZSBzdHJ1Y3QgYW1kZ3B1X3ZyYW1fbWdyICp0b192cmFtX21ncihzdHJ1Y3QgdHRtX21lbV90eXBl
X21hbmFnZXIgKm1hbikKQEAgLTE5Niw2ICsxOTcsOCBAQCBpbnQgYW1kZ3B1X3ZyYW1fbWdyX2lu
aXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJZHJtX21tX2luaXQoJm1nci0+bW0sIDAs
IG1hbi0+c2l6ZSk7CiAJc3Bpbl9sb2NrX2luaXQoJm1nci0+bG9jayk7CiAKKwltZ3ItPmFkZXYg
PSBhZGV2OworCiAJLyogQWRkIHRoZSB0d28gVlJBTS1yZWxhdGVkIHN5c2ZzIGZpbGVzICovCiAJ
cmV0ID0gc3lzZnNfY3JlYXRlX2ZpbGVzKCZhZGV2LT5kZXYtPmtvYmosIGFtZGdwdV92cmFtX21n
cl9hdHRyaWJ1dGVzKTsKIAlpZiAocmV0KQpAQCAtMzIzLDggKzMyNiw4IEBAIHN0YXRpYyBpbnQg
YW1kZ3B1X3ZyYW1fbWdyX25ldyhzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwKIAkJ
CSAgICAgICBjb25zdCBzdHJ1Y3QgdHRtX3BsYWNlICpwbGFjZSwKIAkJCSAgICAgICBzdHJ1Y3Qg
dHRtX21lbV9yZWcgKm1lbSkKIHsKLQlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGFtZGdw
dV90dG1fYWRldihtYW4tPmJkZXYpOwogCXN0cnVjdCBhbWRncHVfdnJhbV9tZ3IgKm1nciA9IHRv
X3ZyYW1fbWdyKG1hbik7CisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBtZ3ItPmFkZXY7
CiAJc3RydWN0IGRybV9tbSAqbW0gPSAmbWdyLT5tbTsKIAlzdHJ1Y3QgZHJtX21tX25vZGUgKm5v
ZGVzOwogCWVudW0gZHJtX21tX2luc2VydF9tb2RlIG1vZGU7CkBAIC00MzksOCArNDQyLDggQEAg
c3RhdGljIGludCBhbWRncHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdl
ciAqbWFuLAogc3RhdGljIHZvaWQgYW1kZ3B1X3ZyYW1fbWdyX2RlbChzdHJ1Y3QgdHRtX21lbV90
eXBlX21hbmFnZXIgKm1hbiwKIAkJCQlzdHJ1Y3QgdHRtX21lbV9yZWcgKm1lbSkKIHsKLQlzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGFtZGdwdV90dG1fYWRldihtYW4tPmJkZXYpOwogCXN0
cnVjdCBhbWRncHVfdnJhbV9tZ3IgKm1nciA9IHRvX3ZyYW1fbWdyKG1hbik7CisJc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYgPSBtZ3ItPmFkZXY7CiAJc3RydWN0IGRybV9tbV9ub2RlICpub2Rl
cyA9IG1lbS0+bW1fbm9kZTsKIAl1aW50NjRfdCB1c2FnZSA9IDAsIHZpc191c2FnZSA9IDA7CiAJ
dW5zaWduZWQgcGFnZXMgPSBtZW0tPm51bV9wYWdlczsKLS0gCjIuMjYuMgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
