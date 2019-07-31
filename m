Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 565C27C317
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 15:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59A089CE3;
	Wed, 31 Jul 2019 13:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1444289CE3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 13:15:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B068C344;
 Wed, 31 Jul 2019 06:15:26 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B5E03F575;
 Wed, 31 Jul 2019 06:15:26 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 2D5EC680205; Wed, 31 Jul 2019 14:15:25 +0100 (BST)
Date: Wed, 31 Jul 2019 14:15:25 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
Message-ID: <20190731131525.vjnkbnbatb5tbuzh@e110455-lin.cambridge.arm.com>
References: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
 <1564571048-15029-3-git-send-email-lowry.li@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564571048-15029-3-git-send-email-lowry.li@arm.com>
User-Agent: NeoMutt/20180716
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
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>, "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTG93cnksCgpPbiBXZWQsIEp1bCAzMSwgMjAxOSBhdCAxMTowNDo0NUFNICswMDAwLCBMb3dy
eSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+IER1cmluZyBpdCBzaWduYWxzIHRo
ZSBjb21wbGV0aW9uIG9mIGEgd3JpdGViYWNrIGpvYiwgYWZ0ZXIgcmVsZWFzaW5nCj4gdGhlIG91
dF9mZW5jZSwgd2UnZCBjbGVhciB0aGUgcG9pbnRlci4KPiAKPiBDaGVjayBpZiBmZW5jZSBsZWZ0
IG92ZXIgaW4gZHJtX3dyaXRlYmFja19jbGVhbnVwX2pvYigpLCByZWxlYXNlIGl0Lgo+IAo+IFNp
Z25lZC1vZmYtYnk6IExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGxvd3J5LmxpQGFy
bS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMgfCAyMyArKysr
KysrKysrKysrKystLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwg
OCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV93cml0
ZWJhY2suYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMKPiBpbmRleCBmZjEzOGI2
Li40M2Q5ZTNiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3dyaXRlYmFjay5jCj4gQEAgLTMyNCw2ICszMjQs
OSBAQCB2b2lkIGRybV93cml0ZWJhY2tfY2xlYW51cF9qb2Ioc3RydWN0IGRybV93cml0ZWJhY2tf
am9iICpqb2IpCj4gIAlpZiAoam9iLT5mYikKPiAgCQlkcm1fZnJhbWVidWZmZXJfcHV0KGpvYi0+
ZmIpOwo+ICAKPiArCWlmIChqb2ItPm91dF9mZW5jZSkKPiArCQlkbWFfZmVuY2VfcHV0KGpvYi0+
b3V0X2ZlbmNlKTsKPiArCj4gIAlrZnJlZShqb2IpOwo+ICB9CgpUaGlzIGNoYW5nZSBsb29rcyBn
b29kLgoKPiAgRVhQT1JUX1NZTUJPTChkcm1fd3JpdGViYWNrX2NsZWFudXBfam9iKTsKPiBAQCAt
MzY2LDI1ICszNjksMjkgQEAgc3RhdGljIHZvaWQgY2xlYW51cF93b3JrKHN0cnVjdCB3b3JrX3N0
cnVjdCAqd29yaykKPiAgewo+ICAJdW5zaWduZWQgbG9uZyBmbGFnczsKPiAgCXN0cnVjdCBkcm1f
d3JpdGViYWNrX2pvYiAqam9iOwo+ICsJc3RydWN0IGRtYV9mZW5jZSAqb3V0X2ZlbmNlOwo+ICAK
PiAgCXNwaW5fbG9ja19pcnFzYXZlKCZ3Yl9jb25uZWN0b3ItPmpvYl9sb2NrLCBmbGFncyk7Cj4g
IAlqb2IgPSBsaXN0X2ZpcnN0X2VudHJ5X29yX251bGwoJndiX2Nvbm5lY3Rvci0+am9iX3F1ZXVl
LAo+ICAJCQkJICAgICAgIHN0cnVjdCBkcm1fd3JpdGViYWNrX2pvYiwKPiAgCQkJCSAgICAgICBs
aXN0X2VudHJ5KTsKPiAtCWlmIChqb2IpIHsKPiArCWlmIChqb2IpCj4gIAkJbGlzdF9kZWwoJmpv
Yi0+bGlzdF9lbnRyeSk7Cj4gLQkJaWYgKGpvYi0+b3V0X2ZlbmNlKSB7Cj4gLQkJCWlmIChzdGF0
dXMpCj4gLQkJCQlkbWFfZmVuY2Vfc2V0X2Vycm9yKGpvYi0+b3V0X2ZlbmNlLCBzdGF0dXMpOwo+
IC0JCQlkbWFfZmVuY2Vfc2lnbmFsKGpvYi0+b3V0X2ZlbmNlKTsKPiAtCQkJZG1hX2ZlbmNlX3B1
dChqb2ItPm91dF9mZW5jZSk7CgoqSGVyZSoKCj4gLQkJfQo+IC0JfQo+ICsKPiAgCXNwaW5fdW5s
b2NrX2lycXJlc3RvcmUoJndiX2Nvbm5lY3Rvci0+am9iX2xvY2ssIGZsYWdzKTsKPiAgCj4gIAlp
ZiAoV0FSTl9PTigham9iKSkKPiAgCQlyZXR1cm47Cj4gIAo+ICsJb3V0X2ZlbmNlID0gam9iLT5v
dXRfZmVuY2U7Cj4gKwlpZiAob3V0X2ZlbmNlKSB7Cj4gKwkJaWYgKHN0YXR1cykKPiArCQkJZG1h
X2ZlbmNlX3NldF9lcnJvcihvdXRfZmVuY2UsIHN0YXR1cyk7Cj4gKwkJZG1hX2ZlbmNlX3NpZ25h
bChvdXRfZmVuY2UpOwo+ICsJCWRtYV9mZW5jZV9wdXQob3V0X2ZlbmNlKTsKPiArCQlqb2ItPm91
dF9mZW5jZSA9IE5VTEw7Cj4gKwl9Cj4gKwoKSSBkb24ndCBnZXQgdGhlIHBvaW50IG9mIHRoaXMg
Y2hhbmdlLiBXaHkgbm90IGp1c3QgYWRkIGpvYi0+b3V0X2ZlbmNlID0gTlVMTAp3aGVyZSAqSGVy
ZSogaXM/CgpCZXN0IHJlZ2FyZHMsCkxpdml1IAoKPiAgCUlOSVRfV09SSygmam9iLT5jbGVhbnVw
X3dvcmssIGNsZWFudXBfd29yayk7Cj4gIAlxdWV1ZV93b3JrKHN5c3RlbV9sb25nX3dxLCAmam9i
LT5jbGVhbnVwX3dvcmspOwo+ICB9Cj4gLS0gCj4gMS45LjEKPiAKCi0tIAo9PT09PT09PT09PT09
PT09PT09PQp8IEkgd291bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3JsZCwgIHwKfCBidXQgdGhl
eSdyZSBub3QgfAp8IGdpdmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBjb2RlISAgLwogIC0tLS0t
LS0tLS0tLS0tLQogICAgwq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
