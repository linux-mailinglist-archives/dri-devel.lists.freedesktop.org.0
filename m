Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 661255024D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 08:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F47898A3;
	Mon, 24 Jun 2019 06:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5645F898A3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 06:33:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C3FF236899;
 Mon, 24 Jun 2019 06:32:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFB9D10013D9;
 Mon, 24 Jun 2019 06:32:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 02CBB16E19; Mon, 24 Jun 2019 08:32:49 +0200 (CEST)
Date: Mon, 24 Jun 2019 08:32:49 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Hellstrom <thomas@shipmail.org>
Subject: Re: [PATCH v2 00/18] drm/ttm: make ttm bo a gem bo subclass
Message-ID: <20190624063249.x6q5wxq2lrqfoyuw@sirius.home.kraxel.org>
References: <20190621115755.8481-1-kraxel@redhat.com>
 <8e022cff-604c-457a-7b85-c1233ac3a2fe@shipmail.org>
 <20190621155737.GH12905@phenom.ffwll.local>
 <a34afbbb-e2d0-299b-872f-e322f05c7ac3@shipmail.org>
 <CAKMK7uHpmddF8Bg7q1jyQt7MKrrBR=Fxi+rm6K-dgYDjfekLSA@mail.gmail.com>
 <7c156174-30ee-84c8-6252-70207df4c4fe@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7c156174-30ee-84c8-6252-70207df4c4fe@shipmail.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Mon, 24 Jun 2019 06:33:00 +0000 (UTC)
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
Cc: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gWWVhaCwgbXkgcG9pbnQgd2FzIG5vdCByZWFsbHkgc3VnZ2VzdGluZyB0aGF0IHdl
IGRvIHRoaXMsIGJ1dCByYXRoZXIgdGhhdAo+IHBlb3BsZSB3b3VsZCByaWdodGZ1bGx5IGdldCB1
cHNldCBiZWNhdXNlIHRoZSBzdHJ1Y3QgY29udGFpbnMgdW51c2VkIHN0dWZmLgoKV2VsbCwgc3Ry
dWN0IGRybV9nZW1fb2JqZWN0IGlzbid0IHRoYXQgYmlnLCBsZXRzIGhhdmUgYSBsb29rOgoKMzIw
IGJ5dGVzIGluIHRvdGFsLCBvZiB3aGljaCBhcmU6CiAgMTg0IGJ5dGVzIHRoZSBlbWJlZGRlZCB2
bWFfbW9kZQogICA2NCBieXRlcyB0aGUgZW1iZWRkZWQgX3Jlc3Ygc3RydWN0CiAgICA4IGJ5dGVz
IHRoZSByZXN2IHBvaW50ZXIuCiAgIDY0IGJ5dGVzIGV2ZXJ5dGhpbmcgZWxzZS4KClNvLCBhZnRl
ciBhcHBseWluZyB0aGlzIHNlcmllcyBpdCdzIDY0IGJ5dGVzIG1vcmUgcGVyIGJvIGZvciB2bXdn
ZngsCmR1ZSB0byBzb21lIHVudXNlZCBmaWVsZHMgYmVpbmcgYWRkZWQuCgpBbmQgaXQncyAyNTYg
Ynl0ZXMgbGVzcyBwZXIgYm8gZm9yIGFsbCB0dG0rZ2VtIGRyaXZlcnMsIGJlY2F1c2UgdGhleQpk
b24ndCBoYXZlIHZtYV9tb2RlICsgcmVzdiBzdHJ1Y3QgKyByZXN2IHBvaW50ZXIgdHdpY2UgYW55
IG1vcmUuCgpBbmQgdGhhdCBpcyBqdXN0IHRoZSBsb3ctaGFuZ2luZyBmcnVpdCwgdGhlcmUgaXMg
cm9vbSBmb3IgbW9yZQp0dG1fYnVmZmVyX29iamVjdCBlbGVtZW50cyBiZWluZyByZW1vdmVkIGJ5
IHVzaW5nIHRoZSBkcm1fZ2VtX29iamVjdApzdHJ1Y3QgZWxlbWVudHMgaW5zdGVhZC4gIG51bV9w
YWdlcywga3JlZiwgbWF5YmUgbW9yZS4KCj4gQWxzbyBhIHRyYXAgd2UgbWlnaHQgZW5kIHVwIHdp
dGggaW4gdGhlIGZ1dHVyZSBpcyB0aGF0IHdpdGggdGhlIGRlc2lnbgo+IHN1Z2dlc3RlZCBpbiB0
aGlzIHBhdGNoIHNlcmllcyBpcyB0aGF0IHBlb3BsZSBzdGFydCBhc3N1bWluZyB0aGF0IHRoZQo+
IGVtYmVkZGVkIGdlbSBvYmplY3QgaXMgYWN0dWFsbHkgaW5pdGlhbGl6ZWQgYW5kIHdvcmtpbmcs
IHdoaWNoIGNvdWxkIGxlYWQgdG8KPiBwcmV0dHkgc2V2ZXJlIHByb2JsZW1zIGZvciB2bXdnZngu
Li4KCkkgZ3Vlc3MgSSBzaG91bGQgcmV3b3JkIHBhdGNoICMxIHRoZW4sIG1ha2luZyBjbGVhciB0
aGF0IHRoZQp0dG1fYm9fdXNlc19lbWJlZGRlZF9nZW1fb2JqZWN0KCkgaGVscGVyIGZ1bmN0aW9u
IGlzIGdvaW5nIHRvIHN0YXkuCgpXaGF0IGlzIHRoZSByZWFzb24gZm9yIHZtd2dmeCB0byBub3Qg
dXNlIGdlbSBidHc/Cgo+ID4gZm9yIGFsbCB0aGUgdHRtK2dlbSBkcml2ZXJzLCBvbmUgcG9pbnRl
ciB0aGV5IGRvbid0IG5lZWQgdHdpY2UpLiBXaXRoCj4gPiB0aGUgc2lkZS1ieS1zaWRlLCB3aGlj
aCBpcyB0aGUgZGVzaWduIGFsbCBnZW0rdHRtIGRyaXZlcnMgdXNlZCB0aGUKPiA+IHBhc3QgZmV3
IHllYXJzLCB3ZSBzdGlsbCBuZWVkIHRoYXQgZHVwbGljYXRpb24uIFNhbWUgZm9yIHRoZSB2bWEg
bm9kZQo+ID4gdGhpbmcsIHdoaWNoIGlzIGFsc28gZHVwbGljYXRlZC4KPiAKPiBUbyBiZW1vcmUg
cHJlY2lzZSBJJ2QgcHJvYmFibHkgZGVmaW5lIGEKPiAKPiBzdHJ1Y3QgZHJtX2JvX2NvbW1vbiB7
Cj4gwqDCoMKgIHN0cnVjdCByZXNlcnZhdGlvbl9vYmplY3QgcjsKPiDCoMKgwqAgc3RydWN0IGRy
bV92bWFfbm9kZSB2Owo+IH07Cj4gCj4gRW1iZWQgaXQgaW4gYSBzdHJ1Y3QgZHJtX2dlbV9vYmpl
Y3QgKGFuZCBpbiBhIHN0cnVjdCB2bXdnZnhfYnVmZmVyX29iamVjdCkKPiBhbmQgdGhlbiBoYXZl
IGEgcG9pbnRlciB0byBhIHN0cnVjdCBkcm1fYm9fY29tbW9uIGluIHRoZSBzdHJ1Y3QKPiB0dG1f
YnVmZmVyX29iamVjdC4KCkEgcG9pbnRlciBkb2Vzbid0IGN1dCBpdC4KCkJlc2lkZSByZW1vdmlu
ZyB0aGUgZHVwbGljYXRpb24gdGhlIG90aGVyIHRoaW5nIEkgd2FudCBpcyB0byBoYXZlIGEKc3Rh
bmRhcmQgd2F5IG9mIGZpbmRpbmcgdGhlIHR0bV9idWZmZXJfb2JqZWN0IGZvciBhIGdpdmVuIGRy
bV9nZW1fb2JqZWN0CmZvciBhbGwgdGhlIHR0bStnZW0gZHJpdmVycy4gIFdpdGggc3RydWN0IGRy
bV9nZW1fb2JqZWN0IGJlaW5nIGVtYmVkZGVkCnRoZSB1c3VhbCBjb250YWludGVyX29mKCkgd2ls
bCB3b3JrLgoKVGhhdCdsbCBhbGxvdyB0byBjcmVhdGUgZHJtX2dlbV90dG1faGVscGVyLmMgd2l0
aCBoZWxwZXIgZnVuY3Rpb25zIGZvcgpzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MuICBGb3Ig
c3RhcnRlcnMgc29tZSBvZiB0aGUgY3VycmVudCB2cmFtCmhlbHBlcnMgY2FuIGJlY29tZSBnZW5l
cmljIHR0bSBoZWxwZXJzIGJlY2F1c2UgdGhleSBsb29zZSB0aGUgZGVwZW5kZW5jeQpvbiBzdHJ1
Y3QgZHJtX2dlbV92cmFtX29iamVjdCBmb3IgZmluZGluZyB0dG1fYnVmZmVyX29iamVjdC4KCj4g
PiA+IFRoZSB2bXdnZnggZHJpdmVyIGlzIGRvaW5nIHdoYXQgaXQgZG9lcyBtb3N0bHkgYmVjYXVz
ZSBhbGwgYnVmZmVyCj4gPiA+IG9iamVjdHMgZG8gbm90IG5lZWQgdG8gYmUgdXNlci1zcGFjZSB2
aXNpYmxlLCBhbmQgZG8gbm90IG5lZWQgdG8gYmUKPiA+ID4gbWFwcGVkIGJ5IHVzZXItc3BhY2Uu
IEFuZCB0aGVyZSBhcmUgb3RoZXIgdHlwZXMgb2Ygb2JqZWN0cyB0aGF0IERPIG5lZWQKPiA+ID4g
dG8gYmUgdXNlci1zcGFjZSB2aXNpYmxlLCBhbmQgdGhhdCBkbyBuZWVkIHRvIGJlIHNoYXJlZCBi
eSBwcm9jZXNzZXMuCj4gPiA+IEhlbmNlIHVzZXItc3BhY2UgdmlzaWJpbGl0eSBpcyBzb21ldGhp
bmcgdGhhdCBzaG91bGQgYmUgYWJzdHJhY3RlZCBhbmQKPiA+ID4gbWFkZSBhdmFpbGFibGUgdG8g
dGhvc2Ugb2JqZWN0cy4gTm90IGx1bXBlZCB0b2dldGhlciB3aXRoIGFsbCBvdGhlcgo+ID4gPiBw
b3RlbnRpYWwgYnVmZmVyIG9iamVjdCBmdW5jdGlvbmFsaXR5LgoKV2VsbCwgdHRtX2J1ZmZlcl9v
YmplY3QgaGFzIGEgdm1hX25vZGUgZW1iZWRkZWQsIHNvIGl0IGFscmVhZHkgaXMKImx1bXBlZCB0
b2dldGhlciIuICBUaGlzIHBhdGNoIHNlcmllcyBvbmx5IG1vdmVzIGl0IGFyb3VuZCAuLi4KCmNo
ZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
