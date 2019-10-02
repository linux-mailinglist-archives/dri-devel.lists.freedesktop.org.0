Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FB0C4A23
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 11:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321C98912D;
	Wed,  2 Oct 2019 09:00:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549B78912D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 08:59:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 818F84E924;
 Wed,  2 Oct 2019 08:59:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-252.ams2.redhat.com
 [10.36.117.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0EAD60605;
 Wed,  2 Oct 2019 08:59:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9407511AAA; Wed,  2 Oct 2019 10:59:55 +0200 (CEST)
Date: Wed, 2 Oct 2019 10:59:55 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 0/5] drm/ast: Place cursor BOs at VRAM high-end
Message-ID: <20191002085955.gy33j4rt454hjgcg@sirius.home.kraxel.org>
References: <20190927090309.10254-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190927090309.10254-1-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Wed, 02 Oct 2019 08:59:58 +0000 (UTC)
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
Cc: airlied@linux.ie, sam@ravnborg.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMTE6MDM6MDRBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gKHdhczogZHJtL2FzdC9tZ2FnMjAwOiBQbGFjZSBjdXJzb3IgQk9zIGF0IFZS
QU0gaGlnaC1lbmQpCj4gCj4gVGhpcyBwYXRjaHNldCBjbGVhbnMgdXAgdGhlIG1lbW9yeSBtYW5h
Z2VtZW50IG9mIEhXIGN1cnNvcnMgaW4gYXN0LiBJdAo+IGZ1cnRoZXIgbW92ZXMgdGhlIGFsbG9j
YXRlZCBjdXJzb3IgQk9zIHRvIHRoZSBvZiB0aGUgdmlkZW8gUkFNIHRvIHJlZHVjZQo+IG1lbW9y
eSBmcmFnbWVudGF0aW9uLgo+IAo+IFRoZSBhc3QgZHJpdmVyIG1hbmFnZXMgY3Vyc29yIG1lbW9y
eSBpbiBhIGRlZGljYXRlZCBHRU0gVlJBTSBidWZmZXIKPiBvYmplY3QuIEl0IHVzZXMgYSBkb3Vi
bGUtYnVmZmVyaW5nIHNjaGVtZSBvZiBhbHRlcm5hdGluZyBiZXR3ZWVuIG9mZnNldHMKPiB3aXRo
aW4gdGhlIEdFTSBCTy4gVGhlIGNvZGUgaXMgY29udm9sdXRlZCBhbmQgY2FuIGxlYWQgdG8gbWVt
b3J5Cj4gZnJhZ21lbnRhdGlvbiBpZiB0aGUgQk8gaXMgc3RvcmVkIHRoZSBtaWRkbGUgb2YgVlJB
TS4gVGhpcyBpcyBlc3BlY2lhbGx5Cj4gYSBwcm9ibGVtIGFzIGFzdCBkZXZpY2VzIG9ubHkgaGF2
ZSBhIHNtYWxsIGFtb3VudCBvZiB2aWRlbyBtZW1vcnkgKGUuZy4sCj4gOCBNaUIpLgo+IAo+IFdp
dGggdGhpcyBwYXRjaHNldCwgdGhlIGN1cnNvciBoYW5kbGluZyBpbiBhc3QgaXMgZmlyc3Qgc3Bs
aXQgdXAgaW50bwo+IHNlcGFyYXRlIGZ1bmN0aW9ucyBmb3IgY29weWluZyBjdXJzb3IgaW1hZ2Vz
LCBtYW5hZ2luZyBidWZmZXIgb2JqZWN0cywKPiBzZXR0aW5nIHNjYW5vdXQgYWRkcmVzc2VzLCBh
bmQgbW92aW5nIGFuZCBoaWRpbmcgdGhlIGN1cnNvci4gRnVydGhlcm1vcmUsCj4gdGhlIGRyaXZl
ciBkZWRpY2F0ZXMgYSBmZXcgS2lCIGF0IHRoZSBoaWdoIGVuZCBvZiB0aGUgZGV2aWNlJ3Mgdmlk
ZW8KPiBtZW1vcnkgdG8gc3RvcmluZyB0aGUgY3Vyc29yJ3MgYnVmZmVyIG9iamVjdHMuIFRoaXMg
cHJldmVudHMgbWVtb3J5Cj4gZnJhZ21lbnRhdGlvbi4KPiAKPiBUaGUgcGF0Y2hzZXQgaGFzIGJl
ZW4gdGVzdGVkIG9uIGFzdCBoYXJkd2FyZS4KPiAKPiB2MzoKPiAJKiBzcGxpdC1vZmYgYXN0IHBh
dGNoZXMgaW50byBzZXBhcmF0ZSBzZXJpZXMKPiAJKiBtb3ZlIGFyb3VuZCBhc3Rfe3Nob3csaGlk
ZX1fY3Vyc29yIGluIGEgc2VwYXJhdGUgcGF0Y2gKPiAJKiBmaXggc3BhY2UtYmVmb3JlLXRhYiBl
cnJvciBuZWFyIEFTVF9IV0NfU0lHTkFUVVJFX0NIRUNLU1VNCj4gdjI6Cj4gCSogcmVtb3ZlIFZS
QU0gYnVmZmVycyBpbiBmYXZvciBvZiBHRU0gQk9zCj4gCSogbWFuYWdlIEJPIHBsYWNlbWVudCB3
aXRoIHBpbiBmbGFnCgpMb29rcyBhbGwgc2FuZSB0byBtZSwgc2VyaWVzIGlzCkFja2VkLWJ5OiBH
ZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KCj4gCj4gCj4gVGhvbWFzIFppbW1lcm1h
bm4gKDUpOgo+ICAgZHJtL2FzdDogRG9uJ3QgY2FsbCBhc3Rfc2hvd19jdXJzb3IoKSBmcm9tIGFz
dF9jdXJzb3JfbW92ZSgpCj4gICBkcm0vYXN0OiBNb3ZlIGFzdF97c2hvdyxoaWRlfV9jdXJzb3Io
KSB3aXRoaW4gc291cmNlIGZpbGUKPiAgIGRybS9hc3Q6IE1vdmUgY3Vyc29yIHVwZGF0ZSBjb2Rl
IHRvIGFzdF9zaG93X2N1cnNvcigpCj4gICBkcm0vYXN0OiBNb3ZlIGN1cnNvciBvZmZzZXQgc3dh
cHBpbmcgaW50byBhc3Rfc2hvd19jdXJzb3IoKQo+ICAgZHJtL2FzdDogQWxsb2NhdGUgY3Vyc29y
IEJPcyBhdCBoaWdoIGVuZCBvZiB2aWRlbyBtZW1vcnkKPiAKPiAgZHJpdmVycy9ncHUvZHJtL2Fz
dC9hc3RfZHJ2LmggIHwgIDQzICsrKy0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2Rl
LmMgfCAyMzUgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hh
bmdlZCwgMTU4IGluc2VydGlvbnMoKyksIDEyMCBkZWxldGlvbnMoLSkKPiAKPiAtLQo+IDIuMjMu
MAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
