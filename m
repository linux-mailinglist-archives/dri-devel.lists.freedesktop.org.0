Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6053B2178B
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 13:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66862898E8;
	Fri, 17 May 2019 11:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFAD898E8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 11:17:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9EDC28553F;
 Fri, 17 May 2019 11:17:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
 [10.36.117.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C417F348CE;
 Fri, 17 May 2019 11:17:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CDE9C11AA3; Fri, 17 May 2019 13:17:03 +0200 (CEST)
Date: Fri, 17 May 2019 13:17:03 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/2] Add BO reservation to GEM VRAM
 pin/unpin/push_to_system
Message-ID: <20190517111703.j3qtk74awnnebupe@sirius.home.kraxel.org>
References: <20190516162746.11636-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190516162746.11636-1-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Fri, 17 May 2019 11:17:16 +0000 (UTC)
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

ICBIaSwKCj4gSXQgdHVybnMgb3V0IHRoYXQgdGhlIGJvY2hzIGFuZCB2Ym94IGRyaXZlcnMgYXV0
b21hdGljYWxseSByZXNlcnZlZCBhbmQKPiB1bnJlc2VydmVkIHRoZSBCTyBmcm9tIHdpdGhpbiB0
aGVpciBwaW4gYW5kIHVucGluIGZ1bmN0aW9ucy4gVGhlIG90aGVyCj4gZHJpdmVyczsgYXN0LCBo
aWJtYyBhbmQgbWdhZzIwMDsgcGVyZm9ybWVkIHJlc2VydmF0aW9uIGV4cGxpY2l0bHkuIFdpdGgg
dGhlCj4gR0VNIFZSQU0gY29udmVyc2lvbiwgYXV0b21hdGljIEJPIHJlc2VydmF0aW9uIHdpdGhp
biBwaW4gYW5kIHVucGluIGZ1bmN0aW9ucwo+IGFjY2lkZW50YWxseSBnb3QgbG9zdC4gU28gZm9y
IGJvY2hzIGFuZCB2Ym94LCB0dG1fYm9fdmFsaWRhdGUoKSB3b3JrZWQgb24KPiB1bmxvY2tlZCBC
T3MuCj4gCj4gVGhpcyBwYXRjaCBzZXQgZml4ZXMgdGhlIHByb2JsZW0gYnkgYWRkaW5nIGF1dG9t
YXRpYyByZXNlcnZhdGlvbiB0byB0aGUKPiBpbXBsZW1lbnRhdGlvbiBvZiBkcm1fZ2VtX3ZyYW1f
e3Bpbix1bnBpbixwdXNoX3RvX3N5c3RlbX0oKSB0byBmaXggYm9jaHMKPiBhbmQgdmJveC4gSXQg
cmVtb3ZlcyBleHBsaWNpdCBCTyByZXNlcnZhdGlvbiBhcm91bmQgdGhlIHBpbiwgdW5waW4gYW5k
Cj4gcHVzaC10by1zeXN0ZW0gY2FsbHMgaW4gdGhlIGFzdCwgaGlibWMgYW5kIG1nYWcyMDAgZHJp
dmVycy4KPiAKPiBUaGUgb25seSBleGNlcHRpb24gaXMgdGhlIGN1cnNvciBoYW5kbGluZyBvZiBt
Z2FnMjAwLiBJbiB0aGlzIGNhc2UsIHRoZQo+IG1nYWcyMDAgZHJpdmVyIG5vdyBjYWxscyBkcm1f
Z2VtX3ZyYW1fe3Bpbix1bnBpbn1fcmVzZXJ2ZWQoKSwgd2hpY2ggd29ya3MKPiB3aXRoIHJlc2Vy
dmVkIEJPcy4gVGhlIHJlc3BlY3RpdmUgY29kZSBzaG91bGQgYmUgcmVmYWN0b3JlZCBpbiBhIGZ1
dHVyZQo+IHBhdGNoIHRvIHdvcmsgd2l0aCB0aGUgcmVndWxhciBwaW4gYW5kIHVucGluIGZ1bmN0
aW9ucy4KCkxvb2tzIGdvb2QsIHB1c2hlZCB0byBkcm0tbWlzYy1uZXh0LgoKdGhhbmtzLAogIEdl
cmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
