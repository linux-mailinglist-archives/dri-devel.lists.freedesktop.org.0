Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BD584E00
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 15:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D6D6E6EE;
	Wed,  7 Aug 2019 13:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939326E6EE
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 13:55:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2019 06:55:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,357,1559545200"; d="scan'208";a="373775744"
Received: from unknown (HELO [10.252.52.138]) ([10.252.52.138])
 by fmsmga005.fm.intel.com with ESMTP; 07 Aug 2019 06:55:10 -0700
Subject: Re: [PATCH 0/2] drm/syncobj: add syncobj sideband payload for
 threaded submission
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20190807133745.4110-1-lionel.g.landwerlin@intel.com>
 <f007b126-cb87-b8b4-9c28-83ffb3fcfba9@amd.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <1f3555a6-0a15-f6b5-a6f7-2b101ddfdd64@intel.com>
Date: Wed, 7 Aug 2019 16:55:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f007b126-cb87-b8b4-9c28-83ffb3fcfba9@amd.com>
Content-Language: en-US
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
Cc: "jason@jlekstrand.net" <jason@jlekstrand.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcvMDgvMjAxOSAxNjo0OSwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4gV2VsbCBmaXJz
dCBvZiBhbGwgSSBzdHJvbmdseSBzdWdnZXN0IHRvIG1ha2UgdGhlIHNpZGViYW5kIGluZm9ybWF0
aW9uIGEKPiBzZXBhcmF0ZSBJT0NUTCBhbmQgbm90IHVzZSB0aGUgZXhpc3Rpbmcgc2lnbmFsL3F1
ZXJ5IElPQ1RMcyBmb3IgaXQuCgoKSXQgZmVsdCBsaWtlIGF0IGxlYXN0IHRoZSBxdWVyeSBpb2N0
bCB3YXMgdGhlIHJpZ2h0IHBsYWNlIHRvIGdldCB0aGUgCnNpZGViYW5kIHZhbHVlLgoKSSBjYW4g
Y2hhbmdlLgoKCj4KPiBUaGVuIGFzIGZhciBhcyBJIHNlZSB0aGlzIGJhc2ljYWxseSBzZXRzIGEg
c2VxdWVuY2UgbnVtYmVyIHRvIHVzZSBmb3IKPiBiaW5hcnkgc2VtYXBob3JlcywgaXMgdGhhdCBj
b3JyZWN0PyBJZiB5ZXMgdGhlbiB0aGF0IHdvdWxkIGJlIGEgcmF0aGVyCj4gZWxlZ2FudCBpZGVh
LgoKClllYWggdGhhdCdzIHByZXR0eSBtdWNoIGl0LiBGcm9tIHRoZSB2dWxrYW4gQVBJIHBvaW50
IHZpZXcsIHRoaXMgZG9lc24ndCAKZXZlbiBuZWVkIHRvIGJlIGF0b21pYywgaXQganVzdCBuZWVk
cyB0byBoYXBwZW4gd2l0aGluIHZrUXVldWVTdWJtaXQoKS4KCgpBZ2FpbiB0byBleHBsYWluIHRo
ZSBpc3N1ZSwgaXQncyB0aGF0IHN5bmNvYmogaXMgY29udGFpbmVyIGFuZCB3ZSBtaWdodCAKcmFj
ZSBwaWNraW5nIHVwIHRoZSBmZW5jZSBmcm9tIG9uZSB0aHJlYWQgd2hpbGUgdGhlIHN1Ym1pc3Np
b24gdGhyZWFkIAp1cGRhdGVzIHRoZSBmZW5jZS4KCkVzc2VudGlhbGx5IHJldXNpbmcgdGhlIGZl
bmNlIGNoYWluIG1lY2hhbmlzbSBzb2x2ZSB0aGUgaXNzdWUgYmVjYXVzZSB3ZSAKY2FuIHdhaXQg
b24gYSBwYXJ0aWN1bGFyIHJlcGxhY2VtZW50IHNlcXVlbmNlIG51bWJlciAobWF0Y2hpbmcgYSAK
dmtRdWV1ZVN1Ym1pdCgpIGNhbGwpLgoKCi1MaW9uZWwKCgo+Cj4gQ2hyaXN0aWFuLgo+Cj4gQW0g
MDcuMDguMTkgdW0gMTU6Mzcgc2NocmllYiBMaW9uZWwgTGFuZHdlcmxpbjoKPj4gSGksCj4+Cj4+
IFRoZSBnb2FsIG9mIHRoaXMgZmVhdHVyZSBpcyB0byBzb2x2ZSBhbiBpc3N1ZSB0aGF0IHdhcyBz
ZWVuIGluIG91cgo+PiB0ZXN0aW5nLiBBZnRlciBkaXNjdXNzaW5nIG9uIFsxXSBJIHRob3VnaHQg
d2UgY291bGQgc29sdmUgdGhpcyBwcm9ibGVtCj4+IHdpdGggc3RhbGxpbmcgdGhlIGFwcGxpY2F0
aW9uIHRocmVhZCBhZnRlciBlYWNoIHZrUXVldWVTdWJtaXQoKSBjYWxsCj4+IHdoZXJlIGEgYmlu
YXJ5IHNlbWFwaG9yZSBpcyBzaWduYWxlZCBidXQgSSBkb24ndCB0aGluayBpdCdzIGEgZ29vZAo+
PiBvcHRpb24gYmVjYXVzZSBvZiBwZXJmb3JtYW5jZSBpbXBhY3RzIG9uIHRoZSBhcHBsaWNhdGlv
bi4KPj4KPj4gVW5mb3J0dW5hdGVseSB0aGVyZSBpc24ndCBhIGdvb2Qgd2F5IHRvIHJlcHJvZHVj
ZSB0aGlzIHByb2JsZW0gMTAwJQo+PiBiZWNhdXNlIGl0IGVzc2VudGlhbGx5IGV4cG9zZXMgYSBy
YWNlIGJldHdlZW4gdGhlIGFwcGxpY2F0aW9uIHRocmVhZAo+PiBhbmQgdGhlIHN1Ym1pc3Npb24g
dGhyZWFkLgo+Pgo+PiBJJ3ZlIHVwbG9hZGVkIHRlc3RzIGluIHRoZSBLaHJvbm9zIHJlcG9zaXRv
cnkgdG8gdHJ5IHRvIGV4cG9zZSB0aGUKPj4gaXNzdWUuCj4+Cj4+IFRoYW5rcywKPj4KPj4gWzFd
IDogaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTkt
QXVndXN0LzIyOTE4OC5odG1sCj4+Cj4+IExpb25lbCBMYW5kd2VybGluICgyKToKPj4gICAgIGRy
bS9zeW5jb2JqOiBhZGQgc2lkZWJhbmQgcGF5bG9hZAo+PiAgICAgZHJtL3N5bmNvYmo6IGFkZCBz
dWJtaXQgcG9pbnQgcXVlcnkgY2FwYWJpbGl0eQo+Pgo+PiAgICBkcml2ZXJzL2dwdS9kcm0vZHJt
X3N5bmNvYmouYyB8IDEzMiArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4+ICAg
IGluY2x1ZGUvZHJtL2RybV9zeW5jb2JqLmggICAgIHwgICA5ICsrKwo+PiAgICBpbmNsdWRlL3Vh
cGkvZHJtL2RybS5oICAgICAgICB8ICAgNSArLQo+PiAgICAzIGZpbGVzIGNoYW5nZWQsIDEwMCBp
bnNlcnRpb25zKCspLCA0NiBkZWxldGlvbnMoLSkKPj4KPj4gLS0KPj4gMi4yMy4wLnJjMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
