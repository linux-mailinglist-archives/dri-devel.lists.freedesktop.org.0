Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAC314996
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 14:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677158986D;
	Mon,  6 May 2019 12:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868858986D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 12:31:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C47DE30833A5;
 Mon,  6 May 2019 12:31:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
 [10.36.116.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EABF60851;
 Mon,  6 May 2019 12:31:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7621116E0A; Mon,  6 May 2019 14:31:14 +0200 (CEST)
Date: Mon, 6 May 2019 14:31:14 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 01/19] drm: Add |struct drm_gem_vram_object| and helpers
Message-ID: <20190506123114.hzyl2hkix7lvqjyx@sirius.home.kraxel.org>
References: <20190506082649.942-1-tzimmermann@suse.de>
 <20190506082649.942-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190506082649.942-2-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Mon, 06 May 2019 12:31:18 +0000 (UTC)
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, z.liuxinliang@hisilicon.com,
 hdegoede@redhat.com, kong.kongxinwei@hisilicon.com, ray.huang@amd.com,
 zourongrong@gmail.com, sam@ravnborg.org, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiArLyoqCj4gKyAqIGRybV9nZW1fdnJhbV91bnBpbigpIC0gVW5waW5zIGEgR0VNIFZSQU0gb2Jq
ZWN0Cj4gKyAqIEBnYm86CXRoZSBHRU0gVlJBTSBvYmplY3QKPiArICoKPiArICogUmV0dXJuczoK
PiArICogMCBvbiBzdWNjZXNzLCBvcgo+ICsgKiBhIG5lZ2F0aXZlIGVycm9yIGNvZGUgb3RoZXJ3
aXNlLgo+ICsgKi8KPiAraW50IGRybV9nZW1fdnJhbV91bnBpbihzdHJ1Y3QgZHJtX2dlbV92cmFt
X29iamVjdCAqZ2JvKQo+ICt7Cj4gKwlpbnQgaSwgcmV0Owo+ICsJc3RydWN0IHR0bV9vcGVyYXRp
b25fY3R4IGN0eCA9IHsgZmFsc2UsIGZhbHNlIH07Cj4gKwo+ICsJaWYgKCFnYm8tPnBpbl9jb3Vu
dCkKPiArCQlyZXR1cm4gMDsKCldBUk5fT05fT05DRSgpIGhlcmU/ICBUaGF0IHNob3VsZCBub3Qg
aGFwcGVuIC4uLgoKPiArLyoqCj4gKyAqIGRybV9nZW1fdnJhbV9wdXNoX3RvX3N5c3RlbSgpIC0g
XAo+ICsJVW5waW5zIGEgR0VNIFZSQU0gb2JqZWN0IGFuZCBtb3ZlcyBpdCB0byBzeXN0ZW0gbWVt
b3J5Cj4gKyAqIEBnYm86CXRoZSBHRU0gVlJBTSBvYmplY3QKPiArICoKPiArICogVGhpcyBvcGVy
YXRpb24gb25seSB3b3JrcyBpZiB0aGUgY2FsbGVyIGhvbGRzIHRoZSBmaW5hbCBwaW4gb24gdGhl
Cj4gKyAqIGJ1ZmZlciBvYmplY3QuCj4gKyAqCj4gKyAqIFJldHVybnM6Cj4gKyAqIDAgb24gc3Vj
Y2Vzcywgb3IKPiArICogYSBuZWdhdGl2ZSBlcnJvciBjb2RlIG90aGVyd2lzZS4KPiArICovCj4g
K2ludCBkcm1fZ2VtX3ZyYW1fcHVzaF90b19zeXN0ZW0oc3RydWN0IGRybV9nZW1fdnJhbV9vYmpl
Y3QgKmdibykKPiArewo+ICsJaW50IGksIHJldDsKPiArCXN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0
eCBjdHggPSB7IGZhbHNlLCBmYWxzZSB9Owo+ICsKPiArCWlmICghZ2JvLT5waW5fY291bnQpCj4g
KwkJcmV0dXJuIDA7CgpMaWtld2lzZS4KCj4gKwktLWdiby0+cGluX2NvdW50Owo+ICsJaWYgKGdi
by0+cGluX2NvdW50KQo+ICsJCXJldHVybiAwOwo+ICsKPiArCWlmIChnYm8tPmttYXAudmlydHVh
bCkKPiArCQl0dG1fYm9fa3VubWFwKCZnYm8tPmttYXApOwo+ICsKPiArCWRybV9nZW1fdnJhbV9w
bGFjZW1lbnQoZ2JvLCBUVE1fUExfRkxBR19TWVNURU0pOwo+ICsJZm9yIChpID0gMDsgaSA8IGdi
by0+cGxhY2VtZW50Lm51bV9wbGFjZW1lbnQgOyArK2kpCj4gKwkJZ2JvLT5wbGFjZW1lbnRzW2ld
LmZsYWdzIHw9IFRUTV9QTF9GTEFHX05PX0VWSUNUOwo+ICsKPiArCXJldCA9IHR0bV9ib192YWxp
ZGF0ZSgmZ2JvLT5ibywgJmdiby0+cGxhY2VtZW50LCAmY3R4KTsKPiArCWlmIChyZXQpCj4gKwkJ
cmV0dXJuIHJldDsKPiArCj4gKwlyZXR1cm4gMDsKPiArfQo+ICtFWFBPUlRfU1lNQk9MKGRybV9n
ZW1fdnJhbV9wdXNoX3RvX3N5c3RlbSk7CgpWZXJ5IHNpbWxpYXIgdG8gZHJtX2dlbV92cmFtX3Vu
cGluLCBjYW4ndCB3ZSBqdXN0IGNhbGwgdGhhdCBmdW5jdGlvbj8KClNvbWV0aGluZyBsaWtlIHRo
aXM6CgoJZHJtX2dlbV92cmFtX3B1c2hfdG9fc3lzdGVtKCkKCXsKCQlpZiAoZ2JvLT5waW5fY291
bnQgPT0gMSAmJiBnYm8tPmttYXAudmlydHVhbCkKCQkJdHRtX2JvX2t1bm1hcCgmZ2JvLT5rbWFw
KTsKCQlyZXR1cm4gZHJtX2dlbV92cmFtX3VucGluKCk7Cgl9Cgo+ICtzdHJ1Y3QgZHJtX2dlbV92
cmFtX29iamVjdCB7Cj4gKwkvKiBTdXBwb3J0ZWQgcGxhY2VtZW50cyBhcmUgJVRUTV9QTF9WUkFN
IGFuZCAlVFRNX1BMX1NZU1RFTSAqLwo+ICsJc3RydWN0IHR0bV9wbGFjZW1lbnQgcGxhY2VtZW50
Owo+ICsJc3RydWN0IHR0bV9wbGFjZSBwbGFjZW1lbnRzWzNdOwoKcGxhY2VtZW50c1syXSBzaG91
bGQgYmUgZW5vdWdoIEkgZ3Vlc3M/CgpjaGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
