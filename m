Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FB3362F7
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 19:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06593892AE;
	Wed,  5 Jun 2019 17:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6B9892AE
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 17:50:07 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 6E42F200EA;
 Wed,  5 Jun 2019 19:50:05 +0200 (CEST)
Date: Wed, 5 Jun 2019 19:50:03 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Dingchen Zhang <dingchen.zhang@amd.com>
Subject: Re: [PATCH 1/2] drm: not to read outside the boundary for CRC source
 name.
Message-ID: <20190605175003.GA20307@ravnborg.org>
References: <20190605170639.8368-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190605170639.8368-1-dingchen.zhang@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=zd2uoN0lAAAA:8
 a=y-NfGLYRBgjJ3sDuFHQA:9 a=CjuIK1q_8ugA:10
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGluZ2NoZW4uCgpUaGFua3MgZm9yIHRoZSBwYXRjaCEKCk9uIFdlZCwgSnVuIDA1LCAyMDE5
IGF0IDAxOjA2OjM4UE0gLTA0MDAsIERpbmdjaGVuIFpoYW5nIHdyb3RlOgo+ICduLTEnIGlzIHRo
ZSBpbmRleCB0byBhY2Nlc3MgdGhlIGxhc3QgY2hhcmFjdGVyIG9mIENSQyBzb3VyY2UgbmFtZS4K
PiAKPiBDYzpMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4sIEhhcnJ5IFdlbnRsYW5kPEhhcnJ5
LldlbnRsYW5kQGFtZC5jb20+ClBsZWFzZSBhZGQgb25seSBvbmUgcGVyc29uIChtYWlsIGFkZHJl
c3MpIHBlciBDYzogbGluZQoKSSBkdW5ubyBpZiB0aGlzIGlzIGEgaGFyZCBydWxlLCBidXQgdGhp
cyBpcyB3aGF0IHdlIGFsd2F5cyBkby4KCj4gU2lnbmVkLW9mZi1ieTogRGluZ2NoZW4gWmhhbmcg
PGRpbmdjaGVuLnpoYW5nQGFtZC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZGVi
dWdmc19jcmMuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVn
ZnNfY3JjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKPiBpbmRleCA1ODUx
NjlmMGRjYzUuLmUyMGFkZWY5ZDYyMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RlYnVnZnNfY3JjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMK
PiBAQCAtMTMxLDggKzEzMSw4IEBAIHN0YXRpYyBzc2l6ZV90IGNyY19jb250cm9sX3dyaXRlKHN0
cnVjdCBmaWxlICpmaWxlLCBjb25zdCBjaGFyIF9fdXNlciAqdWJ1ZiwKPiAgCWlmIChJU19FUlIo
c291cmNlKSkKPiAgCQlyZXR1cm4gUFRSX0VSUihzb3VyY2UpOwo+ICAKPiAtCWlmIChzb3VyY2Vb
bGVuXSA9PSAnXG4nKQo+IC0JCXNvdXJjZVtsZW5dID0gJ1wwJzsKPiArCWlmIChzb3VyY2VbbGVu
LTFdID09ICdcbicpCj4gKwkJc291cmNlW2xlbi0xXSA9ICdcMCc7CkluIHRoZSBrZXJuZWwgY29k
ZSB3ZSBhZGQgc3BhY2VzIGFyb3VuZCBvcGVyYXRvcnMuClNvIHRoZSBhYm92ZSBzaG91bGQgYmU6
ICBzb3VyY2VbbGVuIC0gMV0KCkRldGFpbHMgYXNpZGUuCm1lbWR1cF91c2VyX251bCgpIHdoaWNo
IGlzIGNhbGxlZCBndXJhbnRlZSB0aGF0IHRoZSBidWZmZXIgaXMgbnVsbAp0ZXJtaW5hdGVkLiBU
aGUgYnVmZmVyIGFsbG9jYXRlZCBpcyBsZW4gKyAxIGFuZCB0aGUgbGFzdCBieXRlIGluIHRoZQpi
dWZmZXIgaXMgc2V0IHRvICdcMCcgaW4gbWVtZHVwX3VzZXJfbnVsKCkuCgpTbyB0aGUgcmlnaHQg
Zml4IGlzIHRvIGtpbGwgdGhlIHR3byBsaW5lcyBzaW5jZSB0aGV5IGhhdmUgbm8gZWZmZWN0LgpD
b3VsZCB5b3UgcGxlYXNlIHZlcmlmeSBteSBhbmFseXNpcywgYW5kIGlmIHlvdSBhZ3JlZSBzdWJt
aXQgYSBuZXcKcGF0Y2guCgpUaGFua3MsCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
