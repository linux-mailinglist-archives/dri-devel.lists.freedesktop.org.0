Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E59EF9CB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 10:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8147A6E977;
	Tue,  5 Nov 2019 09:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2821E6E977
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 09:42:39 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-tB0VaxeEMMSa6GgsFWzBIA-1; Tue, 05 Nov 2019 04:42:35 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C7861005500;
 Tue,  5 Nov 2019 09:42:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com
 [10.36.116.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8DCC1001B2D;
 Tue,  5 Nov 2019 09:42:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CB62F17535; Tue,  5 Nov 2019 10:42:32 +0100 (CET)
Date: Tue, 5 Nov 2019 10:42:32 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/9] drm/ast: Remove last traces of struct ast_gem_object
Message-ID: <20191105094232.bjbqu64sgi7447ub@sirius.home.kraxel.org>
References: <20191028154928.4058-1-tzimmermann@suse.de>
 <20191028154928.4058-2-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20191028154928.4058-2-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: tB0VaxeEMMSa6GgsFWzBIA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572946958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rf3isFmDZdgmccjbHclYrH57lAgPe3NUYv+yik58A2U=;
 b=dHbr1NzLbC1JzGNaD2Veq3I/c/9udDBPgGcVayq9MeMMsUFCnp2y8/uDNvFPdPM3hNRd6k
 bPFePfhGlh3EEES+0AM0tKEXU2Ndt9WsDEPIg5RrXOKxdoFth8TnZ/I8bfL+BWIujEedW4
 gCcj5FstxLjpcX8CwX5zsjgIwLfrmGs=
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
Cc: airlied@redhat.com, chen@aspeedtech.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMDQ6NDk6MjBQTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhlIGFzdCBkcml2ZXIgaGFzIHN3aXRjaGVkIHRvIHN0cnVjdCBkcm1fdnJh
bV9nZW1fb2JqZWN0IGEgd2hpbGUgYWdvLgo+IFRoaXMgcGF0Y2ggcmVtb3ZlcyBhIGZ1bmN0aW9u
IGFuZCBmb3J3YXJkIGRlY2xhcmF0aW9uIHRoYXQgd2VyZSBmb3Jnb3R0ZW4KPiBiZWZvcmUuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
CgpBY2tlZC1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaCAgfCAgNiAtLS0tLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL2FzdC9hc3RfbWFpbi5jIHwgMjQgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMzAgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hc3QvYXN0X2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmgKPiBpbmRl
eCBmZjE2MWJkNjIyZjMuLmY0NDE1MGZmNTQ4MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYXN0L2FzdF9kcnYuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5oCj4g
QEAgLTEzNyw4ICsxMzcsNiBAQCBzdHJ1Y3QgYXN0X3ByaXZhdGUgewo+ICBpbnQgYXN0X2RyaXZl
cl9sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGxvbmcgZmxhZ3MpOwo+ICB2
b2lkIGFzdF9kcml2ZXJfdW5sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOwo+ICAKPiAtc3Ry
dWN0IGFzdF9nZW1fb2JqZWN0Owo+IC0KPiAgI2RlZmluZSBBU1RfSU9fQVJfUE9SVF9XUklURQkJ
KDB4NDApCj4gICNkZWZpbmUgQVNUX0lPX01JU0NfUE9SVF9XUklURQkJKDB4NDIpCj4gICNkZWZp
bmUgQVNUX0lPX1ZHQV9FTkFCTEVfUE9SVAkJKDB4NDMpCj4gQEAgLTI4OSwxMCArMjg3LDYgQEAg
ZXh0ZXJuIHZvaWQgYXN0X21vZGVfZmluaShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KTsKPiAgaW50
IGFzdF9tbV9pbml0KHN0cnVjdCBhc3RfcHJpdmF0ZSAqYXN0KTsKPiAgdm9pZCBhc3RfbW1fZmlu
aShzdHJ1Y3QgYXN0X3ByaXZhdGUgKmFzdCk7Cj4gIAo+IC1pbnQgYXN0X2dlbV9jcmVhdGUoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwKPiAtCQkgICB1MzIgc2l6ZSwgYm9vbCBpc2tlcm5lbCwKPiAt
CQkgICBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKipvYmopOwo+IC0KPiAgLyogYXN0IHBvc3QgKi8K
PiAgdm9pZCBhc3RfZW5hYmxlX3ZnYShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KTsKPiAgdm9pZCBh
c3RfZW5hYmxlX21taW8oc3RydWN0IGRybV9kZXZpY2UgKmRldik7Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21h
aW4uYwo+IGluZGV4IDIxNzE1ZDZhOWI1Ni4uM2E5YjRjYjczZjJmIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3Qv
YXN0X21haW4uYwo+IEBAIC01MzUsMjcgKzUzNSwzIEBAIHZvaWQgYXN0X2RyaXZlcl91bmxvYWQo
c3RydWN0IGRybV9kZXZpY2UgKmRldikKPiAgCXBjaV9pb3VubWFwKGRldi0+cGRldiwgYXN0LT5y
ZWdzKTsKPiAgCWtmcmVlKGFzdCk7Cj4gIH0KPiAtCj4gLWludCBhc3RfZ2VtX2NyZWF0ZShzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LAo+IC0JCSAgIHUzMiBzaXplLCBib29sIGlza2VybmVsLAo+IC0J
CSAgIHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqKm9iaikKPiAtewo+IC0Jc3RydWN0IGRybV9nZW1f
dnJhbV9vYmplY3QgKmdibzsKPiAtCWludCByZXQ7Cj4gLQo+IC0JKm9iaiA9IE5VTEw7Cj4gLQo+
IC0Jc2l6ZSA9IHJvdW5kdXAoc2l6ZSwgUEFHRV9TSVpFKTsKPiAtCWlmIChzaXplID09IDApCj4g
LQkJcmV0dXJuIC1FSU5WQUw7Cj4gLQo+IC0JZ2JvID0gZHJtX2dlbV92cmFtX2NyZWF0ZShkZXYs
ICZkZXYtPnZyYW1fbW0tPmJkZXYsIHNpemUsIDAsIGZhbHNlKTsKPiAtCWlmIChJU19FUlIoZ2Jv
KSkgewo+IC0JCXJldCA9IFBUUl9FUlIoZ2JvKTsKPiAtCQlpZiAocmV0ICE9IC1FUkVTVEFSVFNZ
UykKPiAtCQkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gYWxsb2NhdGUgR0VNIG9iamVjdFxuIik7Cj4g
LQkJcmV0dXJuIHJldDsKPiAtCX0KPiAtCSpvYmogPSAmZ2JvLT5iby5iYXNlOwo+IC0JcmV0dXJu
IDA7Cj4gLX0KPiAtLSAKPiAyLjIzLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
