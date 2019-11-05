Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ACAEF9CD
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 10:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336556E979;
	Tue,  5 Nov 2019 09:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31A56E979
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 09:42:50 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-9eMiQHSrP6G1Rc65EktyGQ-1; Tue, 05 Nov 2019 04:42:46 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DE358017DE;
 Tue,  5 Nov 2019 09:42:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com
 [10.36.116.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 617BE1001B2D;
 Tue,  5 Nov 2019 09:42:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 59B5717535; Tue,  5 Nov 2019 10:42:43 +0100 (CET)
Date: Tue, 5 Nov 2019 10:42:43 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/9] drm/ast: Check video-mode requirements against VRAM
 size
Message-ID: <20191105094243.dug4ul2s6jquyv5z@sirius.home.kraxel.org>
References: <20191028154928.4058-1-tzimmermann@suse.de>
 <20191028154928.4058-3-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20191028154928.4058-3-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 9eMiQHSrP6G1Rc65EktyGQ-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572946970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Ctu7GkkD/tgu7ORxOZq79L6RinAjqngZQ0cyfHsT6c=;
 b=VzB1RWryfPOur/5hS58n/P6A0Dk+RbS2g/HqrKGHtoV3wxhcSbXi1mjrGMKtR4FESs+fUR
 qltIcL/CqXFKZJcR4FM7HhGfotqQ+Y492iYxtfK+0IFHYWhC1eZW86xbbl77ypusm/ZOE8
 5jMem3oYTV4nablNShhwLiv1oFOKmqw=
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

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMDQ6NDk6MjFQTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gRWFjaCB2aWRlbyBtb2RlJ3MgcHJpbWFyeSBwbGFuZSByZXF1aXJlcyBhIG1p
bmltdW0gYW1vdW50IG9mIHZpZGVvCj4gbWVtb3J5LiBGb3IgZG91YmxlIGJ1ZmZlcmluZywgdGhp
cyBpcyBhdCBtb3N0IGhhbGYgdGhlIGF2YWlsYWJsZQo+IFZSQU0uIENoZWNrIHRoaXMgY29uc3Ry
YWludC4KCkFja2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KCj4gCj4g
U2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYyB8IDI1ICsrKysrKysrKysrKysr
KysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jCj4gaW5kZXggM2E5YjRjYjczZjJmLi40OGQ1
N2FiNDI5NTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jCj4gQEAgLTM4Nyw4ICszODcsMzEg
QEAgc3RhdGljIGludCBhc3RfZ2V0X2RyYW1faW5mbyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQo+
ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gK2VudW0gZHJtX21vZGVfc3RhdHVzIGFzdF9tb2RlX2Nv
bmZpZ19tb2RlX3ZhbGlkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gKwkJCQkJCWNvbnN0IHN0
cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKQo+ICt7Cj4gKwlzdGF0aWMgY29uc3QgdW5zaWdu
ZWQgbG9uZyBtYXhfYnBwID0gNDsgLyogRFJNX0ZPUk1BVF9YUkdCQTg4ODggKi8KPiArCj4gKwlz
dHJ1Y3QgYXN0X3ByaXZhdGUgKmFzdCA9IGRldi0+ZGV2X3ByaXZhdGU7Cj4gKwl1bnNpZ25lZCBs
b25nIGZic2l6ZSwgZmJwYWdlcywgbWF4X2ZicGFnZXM7Cj4gKwo+ICsJLyogVG8gc3VwcG9ydCBk
b3VibGUgYnVmZmVyaW5nLCBhIGZyYW1lYnVmZmVyIG1heSBub3QKPiArCSAqIGNvbnN1bWUgbW9y
ZSB0aGFuIGhhbGYgb2YgdGhlIGF2YWlsYWJsZSBWUkFNLgo+ICsJICovCj4gKwltYXhfZmJwYWdl
cyA9IChhc3QtPnZyYW1fc2l6ZSAvIDIpID4+IFBBR0VfU0hJRlQ7Cj4gKwo+ICsJZmJzaXplID0g
bW9kZS0+aGRpc3BsYXkgKiBtb2RlLT52ZGlzcGxheSAqIG1heF9icHA7Cj4gKwlmYnBhZ2VzID0g
RElWX1JPVU5EX1VQKGZic2l6ZSwgUEFHRV9TSVpFKTsKPiArCj4gKwlpZiAoZmJwYWdlcyA+IG1h
eF9mYnBhZ2VzKQo+ICsJCXJldHVybiBNT0RFX01FTTsKPiArCj4gKwlyZXR1cm4gTU9ERV9PSzsK
PiArfQo+ICsKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fbW9kZV9jb25maWdfZnVuY3MgYXN0
X21vZGVfZnVuY3MgPSB7Cj4gLQkuZmJfY3JlYXRlID0gZHJtX2dlbV9mYl9jcmVhdGUKPiArCS5m
Yl9jcmVhdGUgPSBkcm1fZ2VtX2ZiX2NyZWF0ZSwKPiArCS5tb2RlX3ZhbGlkID0gYXN0X21vZGVf
Y29uZmlnX21vZGVfdmFsaWQsCj4gIH07Cj4gIAo+ICBzdGF0aWMgdTMyIGFzdF9nZXRfdnJhbV9p
bmZvKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCj4gLS0gCj4gMi4yMy4wCj4gCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
