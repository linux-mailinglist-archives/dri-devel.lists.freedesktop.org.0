Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF1F120105
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 10:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4536E1A4;
	Mon, 16 Dec 2019 09:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 570 seconds by postgrey-1.36 at gabe;
 Mon, 16 Dec 2019 09:29:03 UTC
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C88B36E1A4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 09:29:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E706B1007;
 Mon, 16 Dec 2019 01:19:32 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7AF93F6CF;
 Mon, 16 Dec 2019 01:19:32 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 8C753682956; Mon, 16 Dec 2019 09:19:31 +0000 (GMT)
Date: Mon, 16 Dec 2019 09:19:31 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 02/10] drm/malidp: plane_state->fb iff plane_state->crtc
Message-ID: <20191216091931.3hojrjyecdmihlya@e110455-lin.cambridge.arm.com>
References: <20191213172612.1514842-1-daniel.vetter@ffwll.ch>
 <20191213172612.1514842-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213172612.1514842-2-daniel.vetter@ffwll.ch>
User-Agent: NeoMutt/20180716
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBEZWMgMTMsIDIwMTkgYXQgMDY6MjY6MDRQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBDaGVja2luZyBib3RoIGlzIG9uZSB0b28gbXVjaCwgc28gd3JhcCBhIFdBUk5fT04g
YXJvdW5kIGl0IHRvIHN0b3BlCj4gdGhlIGNvcHlwYXN0YS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogTGl2aXUgRHVkYXUg
PGxpdml1LmR1ZGF1QGFybS5jb20+CgpBY2tlZC1ieTogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1
QGFybS5jb20+CgpCZXN0IHJlZ2FyZHMsCkxpdml1Cgo+IENjOiBCcmlhbiBTdGFya2V5IDxicmlh
bi5zdGFya2V5QGFybS5jb20+Cj4gQ2M6Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vbWFs
aWRwX3BsYW5lcy5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBf
cGxhbmVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9wbGFuZXMuYwo+IGluZGV4IDNj
NzBhNTM4MTNiZi4uMzc3MTVjYzYwNjRlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
cm0vbWFsaWRwX3BsYW5lcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfcGxh
bmVzLmMKPiBAQCAtNTEyLDcgKzUxMiw3IEBAIHN0YXRpYyBpbnQgbWFsaWRwX2RlX3BsYW5lX2No
ZWNrKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAo+ICAJaW50IGksIHJldDsKPiAgCXVuc2lnbmVk
IGludCBibG9ja193LCBibG9ja19oOwo+ICAKPiAtCWlmICghc3RhdGUtPmNydGMgfHwgIXN0YXRl
LT5mYikKPiArCWlmICghc3RhdGUtPmNydGMgfHwgV0FSTl9PTighc3RhdGUtPmZiKSkKPiAgCQly
ZXR1cm4gMDsKPiAgCj4gIAlmYiA9IHN0YXRlLT5mYjsKPiAtLSAKPiAyLjI0LjAKPiAKCi0tIAo9
PT09PT09PT09PT09PT09PT09PQp8IEkgd291bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3JsZCwg
IHwKfCBidXQgdGhleSdyZSBub3QgfAp8IGdpdmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBjb2Rl
ISAgLwogIC0tLS0tLS0tLS0tLS0tLQogICAgwq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
