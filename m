Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BB2A6159
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 08:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9EB8968D;
	Tue,  3 Sep 2019 06:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643D78968D;
 Tue,  3 Sep 2019 06:24:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E19D2C058CB8;
 Tue,  3 Sep 2019 06:24:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-67.ams2.redhat.com
 [10.36.117.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8068060A9F;
 Tue,  3 Sep 2019 06:24:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7926748E5; Tue,  3 Sep 2019 08:24:17 +0200 (CEST)
Date: Tue, 3 Sep 2019 08:24:17 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/5] drm/qxl: use drm_gem_object_funcs callbacks
Message-ID: <20190903062417.a4gpgaollk5jruas@sirius.home.kraxel.org>
References: <20190902124126.7700-1-kraxel@redhat.com>
 <20190902124126.7700-5-kraxel@redhat.com>
 <0a9d97c7-26a4-bee6-e9a2-120abbd5277c@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a9d97c7-26a4-bee6-e9a2-120abbd5277c@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Tue, 03 Sep 2019 06:24:19 +0000 (UTC)
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
 <virtualization@lists.linux-foundation.org>, Dave Airlie <airlied@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMDIsIDIwMTkgYXQgMDQ6MzQ6NDlQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhpcyBwYXRjaCBzZWVtcyB1bnJlbGF0ZWQuCgpXZWxsLCBwYXRjaCA1LzUg
ZGVwZW5kcyBvbiBpdCBiZWNhdXNlIGl0IGhvb2tzIHRoZQpkcm1fZ2VtX3R0bV9wcmludF9pbmZv
IGhlbHBlciBpbnRvIHRoZSBuZXcKcXhsX29iamVjdF9mdW5jcyBhZGRlZCBieSB0aGlzIHBhdGNo
LgoKPiBBbSAwMi4wOS4xOSB1bSAxNDo0MSBzY2hyaWViIEdlcmQgSG9mZm1hbm46Cj4gPiBTd2l0
Y2ggcXhsIHRvIHVzZSBkcm1fZ2VtX29iamVjdF9mdW5jcyBjYWxsYmFja3MKPiA+IGluc3RlYWQg
b2YgZHJtX2RyaXZlciBjYWxsYmFja3MuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEdlcmQgSG9m
Zm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL3F4
bC9xeGxfZHJ2LmMgICAgfCAgOCAtLS0tLS0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhs
X29iamVjdC5jIHwgMTIgKysrKysrKysrKysrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3F4bC9xeGxfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuYwo+ID4g
aW5kZXggMmI3MjZhNTFhMzAyLi45OTZkNDI4ZmE3ZTYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vcXhsL3F4bF9kcnYuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxf
ZHJ2LmMKPiA+IEBAIC0yNTgsMTYgKzI1OCw4IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBx
eGxfZHJpdmVyID0gewo+ID4gICNlbmRpZgo+ID4gIAkucHJpbWVfaGFuZGxlX3RvX2ZkID0gZHJt
X2dlbV9wcmltZV9oYW5kbGVfdG9fZmQsCj4gPiAgCS5wcmltZV9mZF90b19oYW5kbGUgPSBkcm1f
Z2VtX3ByaW1lX2ZkX3RvX2hhbmRsZSwKPiA+IC0JLmdlbV9wcmltZV9waW4gPSBxeGxfZ2VtX3By
aW1lX3BpbiwKPiA+IC0JLmdlbV9wcmltZV91bnBpbiA9IHF4bF9nZW1fcHJpbWVfdW5waW4sCj4g
PiAtCS5nZW1fcHJpbWVfZ2V0X3NnX3RhYmxlID0gcXhsX2dlbV9wcmltZV9nZXRfc2dfdGFibGUs
Cj4gPiAgCS5nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlID0gcXhsX2dlbV9wcmltZV9pbXBvcnRf
c2dfdGFibGUsCj4gPiAtCS5nZW1fcHJpbWVfdm1hcCA9IHF4bF9nZW1fcHJpbWVfdm1hcCwKPiA+
IC0JLmdlbV9wcmltZV92dW5tYXAgPSBxeGxfZ2VtX3ByaW1lX3Z1bm1hcCwKPiA+ICAJLmdlbV9w
cmltZV9tbWFwID0gcXhsX2dlbV9wcmltZV9tbWFwLAo+ID4gLQkuZ2VtX2ZyZWVfb2JqZWN0X3Vu
bG9ja2VkID0gcXhsX2dlbV9vYmplY3RfZnJlZSwKPiA+IC0JLmdlbV9vcGVuX29iamVjdCA9IHF4
bF9nZW1fb2JqZWN0X29wZW4sCj4gPiAtCS5nZW1fY2xvc2Vfb2JqZWN0ID0gcXhsX2dlbV9vYmpl
Y3RfY2xvc2UsCj4gPiAgCS5mb3BzID0gJnF4bF9mb3BzLAo+ID4gIAkuaW9jdGxzID0gcXhsX2lv
Y3RscywKPiA+ICAJLmlycV9oYW5kbGVyID0gcXhsX2lycV9oYW5kbGVyLAo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL3F4
bC9xeGxfb2JqZWN0LmMKPiA+IGluZGV4IDU0OGRmZTZmM2IyNi4uMjlhYWI3YjE0NTEzIDEwMDY0
NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmMKPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5jCj4gPiBAQCAtNzcsNiArNzcsMTcgQEAgdm9p
ZCBxeGxfdHRtX3BsYWNlbWVudF9mcm9tX2RvbWFpbihzdHJ1Y3QgcXhsX2JvICpxYm8sIHUzMiBk
b21haW4sIGJvb2wgcGlubmVkKQo+ID4gIAl9Cj4gPiAgfQo+ID4gIAo+ID4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MgcXhsX29iamVjdF9mdW5jcyA9IHsKPiA+ICsJ
LmZyZWUgPSBxeGxfZ2VtX29iamVjdF9mcmVlLAo+ID4gKwkub3BlbiA9IHF4bF9nZW1fb2JqZWN0
X29wZW4sCj4gPiArCS5jbG9zZSA9IHF4bF9nZW1fb2JqZWN0X2Nsb3NlLAo+ID4gKwkucGluID0g
cXhsX2dlbV9wcmltZV9waW4sCj4gPiArCS51bnBpbiA9IHF4bF9nZW1fcHJpbWVfdW5waW4sCj4g
PiArCS5nZXRfc2dfdGFibGUgPSBxeGxfZ2VtX3ByaW1lX2dldF9zZ190YWJsZSwKPiA+ICsJLnZt
YXAgPSBxeGxfZ2VtX3ByaW1lX3ZtYXAsCj4gPiArCS52dW5tYXAgPSBxeGxfZ2VtX3ByaW1lX3Z1
bm1hcCwKPiA+ICt9Owo+ID4gKwo+ID4gIGludCBxeGxfYm9fY3JlYXRlKHN0cnVjdCBxeGxfZGV2
aWNlICpxZGV2LAo+ID4gIAkJICB1bnNpZ25lZCBsb25nIHNpemUsIGJvb2wga2VybmVsLCBib29s
IHBpbm5lZCwgdTMyIGRvbWFpbiwKPiA+ICAJCSAgc3RydWN0IHF4bF9zdXJmYWNlICpzdXJmLAo+
ID4gQEAgLTEwMCw2ICsxMTEsNyBAQCBpbnQgcXhsX2JvX2NyZWF0ZShzdHJ1Y3QgcXhsX2Rldmlj
ZSAqcWRldiwKPiA+ICAJCWtmcmVlKGJvKTsKPiA+ICAJCXJldHVybiByOwo+ID4gIAl9Cj4gPiAr
CWJvLT50Ym8uYmFzZS5mdW5jcyA9ICZxeGxfb2JqZWN0X2Z1bmNzOwo+ID4gIAliby0+dHlwZSA9
IGRvbWFpbjsKPiA+ICAJYm8tPnBpbl9jb3VudCA9IHBpbm5lZCA/IDEgOiAwOwo+ID4gIAliby0+
c3VyZmFjZV9pZCA9IDA7Cj4gPiAKPiAKPiAtLSAKPiBUaG9tYXMgWmltbWVybWFubgo+IEdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXIKPiBTVVNFIExpbnV4IEdtYkgsIE1heGZlbGRzdHJhc3NlIDUs
IDkwNDA5IE51ZXJuYmVyZywgR2VybWFueQo+IEdGOiBGZWxpeCBJbWVuZMO2cmZmZXIsIE1hcnkg
SGlnZ2lucywgU3JpIFJhc2lhaAo+IEhSQiAyMTI4NCAoQUcgTsO8cm5iZXJnKQo+IAoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
