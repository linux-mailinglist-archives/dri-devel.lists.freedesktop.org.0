Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E72D0296E28
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 14:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8F86E505;
	Fri, 23 Oct 2020 12:04:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2A1876E505
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 12:04:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87366101E;
 Fri, 23 Oct 2020 05:04:15 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 676B53F66B;
 Fri, 23 Oct 2020 05:04:15 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 27C6C683248; Fri, 23 Oct 2020 13:04:14 +0100 (BST)
Date: Fri, 23 Oct 2020 13:04:14 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Qinglang Miao <miaoqinglang@huawei.com>
Subject: Re: [PATCH -next v2] drm/komeda: Convert to DEFINE_SHOW_ATTRIBUTE
Message-ID: <20201023120414.GJ1008493@e110455-lin.cambridge.arm.com>
References: <20200917123949.101925-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917123949.101925-1-miaoqinglang@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, James Qian Wang <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTcsIDIwMjAgYXQgMDg6Mzk6NDlQTSArMDgwMCwgUWluZ2xhbmcgTWlhbyB3
cm90ZToKPiBVc2UgREVGSU5FX1NIT1dfQVRUUklCVVRFIG1hY3JvIHRvIHNpbXBsaWZ5IHRoZSBj
b2RlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFFpbmdsYW5nIE1pYW8gPG1pYW9xaW5nbGFuZ0BodWF3
ZWkuY29tPgo+IC0tLQo+IHYyOiBiYXNlZCBvbiBsaW51eC1uZXh0KDIwMjAwOTE3KSwgYW5kIGNh
biBiZSBhcHBsaWVkIHRvCj4gICAgIG1haW5saW5lIGNsZWFubHkgbm93Lgo+IAo+ICBkcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyB8IDEzICstLS0tLS0tLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMiBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
ZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwo+
IGluZGV4IDFkNzY3NDczYi4uNGExMGU2YjllIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMKPiBAQCAtNDEsMTggKzQxLDcgQEAgc3Rh
dGljIGludCBrb21lZGFfcmVnaXN0ZXJfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKnNmLCB2b2lkICp4
KQo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gLXN0YXRpYyBpbnQga29tZWRhX3JlZ2lzdGVyX29w
ZW4oc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpbGUgKmZpbHApCj4gLXsKPiAtCXJldHVy
biBzaW5nbGVfb3BlbihmaWxwLCBrb21lZGFfcmVnaXN0ZXJfc2hvdywgaW5vZGUtPmlfcHJpdmF0
ZSk7Cj4gLX0KPiAtCj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGtvbWVk
YV9yZWdpc3Rlcl9mb3BzID0gewo+IC0JLm93bmVyCQk9IFRISVNfTU9EVUxFLAo+IC0JLm9wZW4J
CT0ga29tZWRhX3JlZ2lzdGVyX29wZW4sCj4gLQkucmVhZAkJPSBzZXFfcmVhZCwKPiAtCS5sbHNl
ZWsJCT0gc2VxX2xzZWVrLAo+IC0JLnJlbGVhc2UJPSBzaW5nbGVfcmVsZWFzZSwKPiAtfTsKPiAr
REVGSU5FX1NIT1dfQVRUUklCVVRFKGtvbWVkYV9yZWdpc3Rlcik7CgpIaSBRaW5nbGFuZywKClNv
cnJ5IGZvciB0aGUgYmVsYXRlZCByZXNwb25zZSEKCkFja2VkLWJ5OiBMaXZpdSBEdWRhdSA8bGl2
aXUuZHVkYXVAYXJtLmNvbT4KCkJlc3QgcmVnYXJkcywKTGl2aXUKCj4gIAo+ICAjaWZkZWYgQ09O
RklHX0RFQlVHX0ZTCj4gIHN0YXRpYyB2b2lkIGtvbWVkYV9kZWJ1Z2ZzX2luaXQoc3RydWN0IGtv
bWVkYV9kZXYgKm1kZXYpCj4gLS0gCj4gMi4yMy4wCj4gCgotLSAKPT09PT09PT09PT09PT09PT09
PT0KfCBJIHdvdWxkIGxpa2UgdG8gfAp8IGZpeCB0aGUgd29ybGQsICB8CnwgYnV0IHRoZXkncmUg
bm90IHwKfCBnaXZpbmcgbWUgdGhlICAgfAogXCBzb3VyY2UgY29kZSEgIC8KICAtLS0tLS0tLS0t
LS0tLS0KICAgIMKvXF8o44OEKV8vwq8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
