Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5366D73718
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 20:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029516E629;
	Wed, 24 Jul 2019 18:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CDA6E629
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 18:59:37 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id C6393804C5;
 Wed, 24 Jul 2019 20:59:34 +0200 (CEST)
Date: Wed, 24 Jul 2019 20:59:33 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [PATCH] drm/panel: check failure cases in the probe func
Message-ID: <20190724185933.GE22640@ravnborg.org>
References: <20190724051700.GA22730@ravnborg.org>
 <20190724144845.4791-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724144845.4791-1-navid.emamdoost@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
 a=ONRsVvzFGko7FBthncQA:9 a=CjuIK1q_8ugA:10
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
Cc: secalert@redhat.com, David Airlie <airlied@linux.ie>, kjlu@umn.edu,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, smccaman@umn.edu, emamd001@umn.edu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmF2aWQuCgpUaGFua3MgZm9yIHlvdXIgcGF0Y2guCgpPbiBXZWQsIEp1bCAyNCwgMjAxOSBh
dCAwOTo0ODo0NEFNIC0wNTAwLCBOYXZpZCBFbWFtZG9vc3Qgd3JvdGU6Cj4gVGhlIGZvbGxvd2lu
ZyBmdW5jdGlvbiBjYWxscyBtYXkgZmFpbCBhbmQgcmV0dXJuIE5VTEwsIHNvIHRoZSBudWxsIGNo
ZWNrCj4gaXMgYWRkZWQuCj4gb2ZfZ3JhcGhfZ2V0X25leHRfZW5kcG9pbnQKPiBvZl9ncmFwaF9n
ZXRfcmVtb3RlX3BvcnRfcGFyZW50Cj4gb2ZfZ3JhcGhfZ2V0X3JlbW90ZV9wb3J0Cj4gCj4gU2ln
bmVkLW9mZi1ieTogTmF2aWQgRW1hbWRvb3N0IDxuYXZpZC5lbWFtZG9vc3RAZ21haWwuY29tPgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcmFzcGJlcnJ5cGktdG91Y2hzY3Jl
ZW4uYyB8IDkgKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJhc3BiZXJyeXBpLXRv
dWNoc2NyZWVuLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcmFzcGJlcnJ5cGktdG91
Y2hzY3JlZW4uYwo+IGluZGV4IDI4YzA2MjBkZmUwZi4uOTQ4NGZkYjYwZjY4IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNjcmVlbi5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJhc3BiZXJyeXBpLXRvdWNoc2Ny
ZWVuLmMKPiBAQCAtMzk5LDcgKzM5OSwxMyBAQCBzdGF0aWMgaW50IHJwaV90b3VjaHNjcmVlbl9w
cm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqaTJjLAo+ICAKPiAgCS8qIExvb2sgdXAgdGhlIERTSSBo
b3N0LiAgSXQgbmVlZHMgdG8gcHJvYmUgYmVmb3JlIHdlIGRvLiAqLwo+ICAJZW5kcG9pbnQgPSBv
Zl9ncmFwaF9nZXRfbmV4dF9lbmRwb2ludChkZXYtPm9mX25vZGUsIE5VTEwpOwo+ICsJaWYgKCFl
bmRwb2ludCkKPiArCQlyZXR1cm4gLUVOT0RFVjsKPiArCj4gIAlkc2lfaG9zdF9ub2RlID0gb2Zf
Z3JhcGhfZ2V0X3JlbW90ZV9wb3J0X3BhcmVudChlbmRwb2ludCk7Cj4gKwlpZiAoIWRzaV9ob3N0
X25vZGUpCj4gKwkJcmV0dXJuIC1FTk9ERVY7Cj4gKwpJZiB3ZSByZXR1cm4gaGVyZSB3ZSB3aWxs
IGxlYWsgZW5kcG9pbnQgLSBhIG9mX25vZGVfcHV0KCkgaXMgbWlzc2luZy4KVXNlIGdvdG8gdG8g
cmV3aW5kIHRoZSBhbGxvY2F0aW9ucyBpbiB0aGUgYm90dG9tIG9mIHRoaXMgZnVuY3Rpb24uCgo+
ICAJaG9zdCA9IG9mX2ZpbmRfbWlwaV9kc2lfaG9zdF9ieV9ub2RlKGRzaV9ob3N0X25vZGUpOwo+
ICAJb2Zfbm9kZV9wdXQoZHNpX2hvc3Rfbm9kZSk7Cj4gIAlpZiAoIWhvc3QpIHsKPiBAQCAtNDA4
LDYgKzQxNCw5IEBAIHN0YXRpYyBpbnQgcnBpX3RvdWNoc2NyZWVuX3Byb2JlKHN0cnVjdCBpMmNf
Y2xpZW50ICppMmMsCj4gIAl9Cj4gIAo+ICAJaW5mby5ub2RlID0gb2ZfZ3JhcGhfZ2V0X3JlbW90
ZV9wb3J0KGVuZHBvaW50KTsKPiArCWlmICghaW5mby5ub2RlKQo+ICsJCXJldHVybiAtRU5PREVW
OwpIZXJlIHdlIGFsc28gbGVhayBlbmRwb2ludCwgYnV0IG5vdCBkc2lfaG9zdF9ub2RlIGFzIHdl
IGFscmVhZHkgZGlkIGEKcHV0IGFib3ZlLgoKPiArCj4gIAlvZl9ub2RlX3B1dChlbmRwb2ludCk7
Cj4gIAo+ICAJdHMtPmRzaSA9IG1pcGlfZHNpX2RldmljZV9yZWdpc3Rlcl9mdWxsKGhvc3QsICZp
bmZvKTsKCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
