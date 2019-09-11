Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EC5B005D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 17:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F716EB42;
	Wed, 11 Sep 2019 15:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38BB6EB42;
 Wed, 11 Sep 2019 15:40:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2BCB53084029;
 Wed, 11 Sep 2019 15:40:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C6FA5C21E;
 Wed, 11 Sep 2019 15:40:35 +0000 (UTC)
Received: from zmail25.collab.prod.int.phx2.redhat.com
 (zmail25.collab.prod.int.phx2.redhat.com [10.5.83.31])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id A9C2118089C8;
 Wed, 11 Sep 2019 15:40:34 +0000 (UTC)
Date: Wed, 11 Sep 2019 11:40:34 -0400 (EDT)
From: Frediano Ziglio <fziglio@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <964578816.11586547.1568216434638.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190805105401.29874-1-kraxel@redhat.com>
References: <20190805105401.29874-1-kraxel@redhat.com>
Subject: Re: [PATCH v2] drm/qxl: get vga ioports
MIME-Version: 1.0
X-Originating-IP: [10.33.32.18, 10.4.195.2]
Thread-Topic: drm/qxl: get vga ioports
Thread-Index: d9HGlWxFC1mjLzRge3s5uc+6p+5ECg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Wed, 11 Sep 2019 15:40:37 +0000 (UTC)
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
 dri-devel@lists.freedesktop.org, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAKPiBxeGwgaGFzIHR3byBtb2RlczogIm5hdGl2ZSIgKHVzZWQgYnkgdGhlIGRybSBkcml2ZXIp
IGFuZCAidmdhIiAodmdhCj4gY29tcGF0aWJpbGl0eSBtb2RlLCB0eXBpY2FsbHkgdXNlZCBmb3Ig
Ym9vdCBkaXNwbGF5IGFuZCBmaXJtd2FyZQo+IGZyYW1lYnVmZmVycykuCj4gCj4gQWNjZXNzaW5n
IGFueSB2Z2EgaW9wb3J0IHdpbGwgc3dpdGNoIHRoZSBxeGwgZGV2aWNlIGludG8gdmdhIG1vZGUu
Cj4gVGhlIHF4bCBkcml2ZXIgbmV2ZXIgZG9lcyB0aGF0LCBidXQgb3RoZXIgZHJpdmVycyBhY2Nl
c3NpbmcgdmdhIHBvcnRzCj4gY2FuIHRyaWdnZXIgdGhhdCB0b28gYW5kIHRoZXJlZm9yZSBkaXN0
dXJiIHF4bCBvcGVyYXRpb24uICBTbyBhcXVpcmUKPiB0aGUgbGVnYWN5IHZnYSBpb3BvcnRzIGZy
b20gdmdhYXJiIHRvIGF2b2lkIHRoYXQuCj4gCj4gUmVwcm9kdWNlcjogQm9vdCBrdm0gZ3Vlc3Qg
d2l0aCBib3RoIHF4bCBhbmQgaTkxNSB2Z3B1LCB3aXRoIHF4bCBiZWluZwo+IGZpcnN0IGluIHBj
aSBzY2FuIG9yZGVyLgo+IAo+IHYyOiBTa2lwIHRoaXMgZm9yIHNlY29uZGFyeSBxeGwgY2FyZHMg
d2hpY2ggZG9uJ3QgaGF2ZSB2Z2EgbW9kZSBpbiB0aGUKPiAgICAgZmlyc3QgcGxhY2UgKEZyZWRp
YW5vKS4KPiAKPiBDYzogRnJlZGlhbm8gWmlnbGlvIDxmemlnbGlvQHJlZGhhdC5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CgpBY2tlZC1ieTog
RnJlZGlhbm8gWmlnbGlvIDxmemlnbGlvQHJlZGhhdC5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vcXhsL3F4bF9kcnYuYyB8IDIwICsrKysrKysrKysrKysrKysrKystCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxf
ZHJ2LmMKPiBpbmRleCBiNTdhMzc1NDM2MTMuLmZjYjQ4YWM2MDU5OCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwv
cXhsX2Rydi5jCj4gQEAgLTYzLDYgKzYzLDExIEBAIG1vZHVsZV9wYXJhbV9uYW1lZChudW1faGVh
ZHMsIHF4bF9udW1fY3J0YywgaW50LCAwNDAwKTsKPiAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVy
IHF4bF9kcml2ZXI7Cj4gIHN0YXRpYyBzdHJ1Y3QgcGNpX2RyaXZlciBxeGxfcGNpX2RyaXZlcjsK
PiAgCj4gK3N0YXRpYyBib29sIGlzX3ZnYShzdHJ1Y3QgcGNpX2RldiAqcGRldikKPiArewo+ICsJ
cmV0dXJuIHBkZXYtPmNsYXNzID09IFBDSV9DTEFTU19ESVNQTEFZX1ZHQSA8PCA4Owo+ICt9Cj4g
Kwo+ICBzdGF0aWMgaW50Cj4gIHF4bF9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGNv
bnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICplbnQpCj4gIHsKPiBAQCAtODcsOSArOTIsMTcgQEAg
cXhsX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgY29uc3Qgc3RydWN0Cj4gcGNpX2Rl
dmljZV9pZCAqZW50KQo+ICAJaWYgKHJldCkKPiAgCQlnb3RvIGRpc2FibGVfcGNpOwo+ICAKPiAr
CWlmIChpc192Z2EocGRldikpIHsKPiArCQlyZXQgPSB2Z2FfZ2V0X2ludGVycnVwdGlibGUocGRl
diwgVkdBX1JTUkNfTEVHQUNZX0lPKTsKPiArCQlpZiAocmV0KSB7Cj4gKwkJCURSTV9FUlJPUigi
Y2FuJ3QgZ2V0IGxlZ2FjeSB2Z2EgaW9wb3J0c1xuIik7Cj4gKwkJCWdvdG8gZGlzYWJsZV9wY2k7
Cj4gKwkJfQo+ICsJfQo+ICsKPiAgCXJldCA9IHF4bF9kZXZpY2VfaW5pdChxZGV2LCAmcXhsX2Ry
aXZlciwgcGRldik7Cj4gIAlpZiAocmV0KQo+IC0JCWdvdG8gZGlzYWJsZV9wY2k7Cj4gKwkJZ290
byBwdXRfdmdhOwo+ICAKPiAgCXJldCA9IHF4bF9tb2Rlc2V0X2luaXQocWRldik7Cj4gIAlpZiAo
cmV0KQo+IEBAIC0xMDksNiArMTIyLDkgQEAgcXhsX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAq
cGRldiwgY29uc3Qgc3RydWN0Cj4gcGNpX2RldmljZV9pZCAqZW50KQo+ICAJcXhsX21vZGVzZXRf
ZmluaShxZGV2KTsKPiAgdW5sb2FkOgo+ICAJcXhsX2RldmljZV9maW5pKHFkZXYpOwo+ICtwdXRf
dmdhOgo+ICsJaWYgKGlzX3ZnYShwZGV2KSkKPiArCQl2Z2FfcHV0KHBkZXYsIFZHQV9SU1JDX0xF
R0FDWV9JTyk7Cj4gIGRpc2FibGVfcGNpOgo+ICAJcGNpX2Rpc2FibGVfZGV2aWNlKHBkZXYpOwo+
ICBmcmVlX2RldjoKPiBAQCAtMTI2LDYgKzE0Miw4IEBAIHF4bF9wY2lfcmVtb3ZlKHN0cnVjdCBw
Y2lfZGV2ICpwZGV2KQo+ICAKPiAgCXF4bF9tb2Rlc2V0X2ZpbmkocWRldik7Cj4gIAlxeGxfZGV2
aWNlX2ZpbmkocWRldik7Cj4gKwlpZiAoaXNfdmdhKHBkZXYpKQo+ICsJCXZnYV9wdXQocGRldiwg
VkdBX1JTUkNfTEVHQUNZX0lPKTsKPiAgCj4gIAlkZXYtPmRldl9wcml2YXRlID0gTlVMTDsKPiAg
CWtmcmVlKHFkZXYpOwoKRnJlZGlhbm8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
