Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A84891F5D3B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 22:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C312A6E85F;
	Wed, 10 Jun 2020 20:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C566E85F;
 Wed, 10 Jun 2020 20:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 2F8993F9F0;
 Wed, 10 Jun 2020 22:30:50 +0200 (CEST)
Authentication-Results: pio-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="lf4+HQBR";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gBsXFt-N9Gg6; Wed, 10 Jun 2020 22:30:49 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 59F513F669;
 Wed, 10 Jun 2020 22:30:47 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 7D5A9360369;
 Wed, 10 Jun 2020 22:30:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1591821047; bh=6rN9tAI4W+mOXGNE+5SlKqjT/MCSQgzWdil/Irs4tKw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lf4+HQBRA3xYGdtmQZsQjtZuS+iLavqWJUerXHiYX2IHhCvrPf9T/yG90MUiTfpcj
 lsz+i0EuqzaIMgEX5uJjt+lBR0tfx5+gmkWIrXEZMMzwZ+C1HiiUOTqVoZGy8z7MLp
 OoQf2E+kDbywngY3aeyWJqLTV6rK43hckKrS/Iz4=
Subject: Re: [PATCH 1/6] drm/ttm: Add unampping of the entire device address
 space
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <f36c1fa1-bbee-477a-9cb2-ed2726f27eef@email.android.com>
 <eb9e5896-1f16-2102-350a-1e64d9af7ea8@shipmail.org>
 <b415e3d1-eed9-9b11-b8c1-c85c7b57eb93@amd.com>
 <ce6f6109-67df-e3d0-d56e-3f5c27df40a0@amd.com>
 <20200610153020.GZ20149@phenom.ffwll.local>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <715ad9d4-7763-382e-237e-8daab42eff46@shipmail.org>
Date: Wed, 10 Jun 2020 22:30:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610153020.GZ20149@phenom.ffwll.local>
Content-Language: en-US
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
Cc: "michel@daenzer.net" <michel@daenzer.net>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMTAvMjAgNTozMCBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBXZWQsIEp1biAx
MCwgMjAyMCBhdCAwNDowNTowNFBNICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+PiBB
bSAxMC4wNi4yMCB1bSAxNTo1NCBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4KPj4+IE9u
IDYvMTAvMjAgNjoxNSBBTSwgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKSB3cm90ZToKPj4+Pgo+
Pj4+IE9uIDYvOS8yMCA3OjIxIFBNLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToKPj4+Pj4KPj4+
Pj4gQW0gMDkuMDYuMjAyMCAxODozNyBzY2hyaWViICJHcm9kem92c2t5LCBBbmRyZXkiCj4+Pj4+
IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQuY29tPjoKPj4+Pj4KPj4+Pj4KPj4+Pj4gICAgICBPbiA2
LzUvMjAgMjo0MCBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4gICAgICA+IEFtIDA1
LjA2LjIwIHVtIDE2OjI5IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+ICAgICAgPj4K
Pj4+Pj4gICAgICA+PiBPbiA1LzExLzIwIDI6NDUgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6
Cj4+Pj4+ICAgICAgPj4+IEFtIDA5LjA1LjIwIHVtIDIwOjUxIHNjaHJpZWIgQW5kcmV5IEdyb2R6
b3Zza3k6Cj4+Pj4+ICAgICAgPj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8
YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPj4+Pj4gICAgICA+Pj4+IC0tLQo+Pj4+PiAgICAg
ID4+Pj4gZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uY8KgwqDCoCB8IDIyICsrKysrKysrKysr
KysrKysrKysrKy0KPj4+Pj4gICAgICA+Pj4+IGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVy
LmggfMKgIDIgKysKPj4+Pj4gICAgICA+Pj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4+PiAgICAgID4+Pj4KPj4+Pj4gICAgICA+Pj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+Pj4+ICAgICAgPj4+PiBi
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4+Pj4gICAgICA+Pj4+IGluZGV4IGM1YjUx
NmYuLmVhZTYxY2MgMTAwNjQ0Cj4+Pj4+ICAgICAgPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jCj4+Pj4+ICAgICAgPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9iby5jCj4+Pj4+ICAgICAgPj4+PiBAQCAtMTc1MCw5ICsxNzUwLDI5IEBAIHZvaWQgdHRtX2Jv
X3VubWFwX3ZpcnR1YWwoc3RydWN0Cj4+Pj4+ICAgICAgPj4+PiB0dG1fYnVmZmVyX29iamVjdCAq
Ym8pCj4+Pj4+ICAgICAgPj4+PiB0dG1fYm9fdW5tYXBfdmlydHVhbF9sb2NrZWQoYm8pOwo+Pj4+
PiAgICAgID4+Pj4gdHRtX21lbV9pb191bmxvY2sobWFuKTsKPj4+Pj4gICAgICA+Pj4+IMKgIH0K
Pj4+Pj4gICAgICA+Pj4+ICtFWFBPUlRfU1lNQk9MKHR0bV9ib191bm1hcF92aXJ0dWFsKTsKPj4+
Pj4gICAgICA+Pj4+IMKgICt2b2lkIHR0bV9ib191bm1hcF92aXJ0dWFsX2FkZHJlc3Nfc3BhY2Uo
c3RydWN0Cj4+Pj4+ICAgICAgdHRtX2JvX2RldmljZSAqYmRldikKPj4+Pj4gICAgICA+Pj4+ICt7
Cj4+Pj4+ICAgICAgPj4+PiArwqDCoMKgIHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFu
Owo+Pj4+PiAgICAgID4+Pj4gK8KgwqDCoCBpbnQgaTsKPj4+Pj4gICAgICA+Pj4+IC1FWFBPUlRf
U1lNQk9MKHR0bV9ib191bm1hcF92aXJ0dWFsKTsKPj4+Pj4gICAgICA+Pj4KPj4+Pj4gICAgICA+
Pj4+ICvCoMKgwqAgZm9yIChpID0gMDsgaSA8IFRUTV9OVU1fTUVNX1RZUEVTOyBpKyspIHsKPj4+
Pj4gICAgICA+Pj4+ICvCoMKgwqDCoMKgwqDCoCBtYW4gPSAmYmRldi0+bWFuW2ldOwo+Pj4+PiAg
ICAgID4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChtYW4tPmhhc190eXBlICYmIG1hbi0+dXNlX3R5
cGUpCj4+Pj4+ICAgICAgPj4+PiArIHR0bV9tZW1faW9fbG9jayhtYW4sIGZhbHNlKTsKPj4+Pj4g
ICAgICA+Pj4+ICvCoMKgwqAgfQo+Pj4+PiAgICAgID4+Pgo+Pj4+PiAgICAgID4+PiBZb3Ugc2hv
dWxkIGRyb3AgdGhhdCBpdCB3aWxsIGp1c3QgcmVzdWx0IGluIGEgZGVhZGxvY2sKPj4+Pj4gICAg
ICB3YXJuaW5nIGZvcgo+Pj4+PiAgICAgID4+PiBOb3V2ZWF1IGFuZCBoYXMgbm8gZWZmZWN0IGF0
IGFsbC4KPj4+Pj4gICAgICA+Pj4KPj4+Pj4gICAgICA+Pj4gQXBhcnQgZnJvbSB0aGF0IGxvb2tz
IGdvb2QgdG8gbWUsCj4+Pj4+ICAgICAgPj4+IENocmlzdGlhbi4KPj4+Pj4gICAgICA+Pgo+Pj4+
PiAgICAgID4+Cj4+Pj4+ICAgICAgPj4gQXMgSSBhbSBjb25zaWRlcmluZyB0byByZS1pbmNsdWRl
IHRoaXMgaW4gVjIgb2YgdGhlCj4+Pj4+ICAgICAgcGF0Y2hzZXRzLCBjYW4KPj4+Pj4gICAgICA+
PiB5b3UgY2xhcmlmeSBwbGVhc2Ugd2h5IHRoaXMgd2lsbCBoYXZlIG5vIGVmZmVjdCBhdCBhbGwg
Pwo+Pj4+PiAgICAgID4KPj4+Pj4gICAgICA+IFRoZSBsb2NrcyBhcmUgZXhjbHVzaXZlIGZvciBO
b3V2ZWF1IHRvIGFsbG9jYXRlL2ZyZWUgdGhlIGlvCj4+Pj4+ICAgICAgYWRkcmVzcwo+Pj4+PiAg
ICAgID4gc3BhY2UuCj4+Pj4+ICAgICAgPgo+Pj4+PiAgICAgID4gU2luY2Ugd2UgZG9uJ3QgZG8g
dGhpcyBoZXJlIHdlIGRvbid0IG5lZWQgdGhlIGxvY2tzLgo+Pj4+PiAgICAgID4KPj4+Pj4gICAg
ICA+IENocmlzdGlhbi4KPj4+Pj4KPj4+Pj4KPj4+Pj4gICAgICBTbyBiYXNpY2FsbHkgY2FsbGlu
ZyB1bm1hcF9tYXBwaW5nX3JhbmdlIGRvZXNuJ3QgcmVxdWlyZSBhbnkgZXh0cmEKPj4+Pj4gICAg
ICBsb2NraW5nIGFyb3VuZCBpdCBhbmQgd2hhdGV2ZXIgbG9ja3MgYXJlIHRha2VuIHdpdGhpbiB0
aGUgZnVuY3Rpb24KPj4+Pj4gICAgICBzaG91bGQgYmUgZW5vdWdoID8KPj4+Pj4KPj4+Pj4KPj4+
Pj4KPj4+Pj4gSSB0aGluayBzbywgeWVzLgo+Pj4+Pgo+Pj4+PiBDaHJpc3RpYW4uCj4+Pj4gWWVz
LCB0aGF0J3MgdHJ1ZS4gSG93ZXZlciwgd2l0aG91dCB0aGUgYm8gcmVzZXJ2YXRpb24sIG5vdGhp
bmcgc3RvcHMKPj4+PiBhIFBURSBmcm9tIGJlaW5nIGltbWVkaWF0ZWx5IHJlLWZhdWx0ZWQgYmFj
ayBhZ2Fpbi4gRXZlbiB3aGlsZQo+Pj4+IHVubWFwX21hcHBpbmdfcmFuZ2UoKSBpcyBydW5uaW5n
Lgo+Pj4+Cj4+PiBDYW4geW91IGV4cGxhaW4gbW9yZSBvbiB0aGlzIC0gc3BlY2lmaWNhbGx5LCB3
aGljaCBmdW5jdGlvbiB0byByZXNlcnZlCj4+PiB0aGUgQk8sIHdoeSBCTyByZXNlcnZhdGlvbiB3
b3VsZCBwcmV2ZW50IHJlLWZhdWx0IG9mIHRoZSBQVEUgPwo+Pj4KPj4gVGhvbWFzIGlzIHRhbGtp
bmcgYWJvdXQgdHRtX2JvX3Jlc2VydmVyKCkvdHRtX2JvX3VucmVzZXJ2ZSgpLCBidXQgd2UgZG9u
J3QKPj4gbmVlZCB0aGlzIGJlY2F1c2Ugd2UgdW5tYXAgZXZlcnl0aGluZyBiZWNhdXNlIHRoZSB3
aG9sZSBkZXZpY2UgaXMgZ29uZSBhbmQKPj4gbm90IGp1c3QgbWFuaXB1bGF0ZSBhIHNpbmdsZSBC
Ty4KPj4KPj4+PiBTbyB0aGUgZGV2aWNlIHJlbW92ZWQgZmxhZyBuZWVkcyB0byBiZSBhZHZlcnRp
emVkIGJlZm9yZSB0aGlzCj4+Pj4gZnVuY3Rpb24gaXMgcnVuLAo+Pj4+Cj4+PiBJIGluZGVlZCBp
bnRlbmQgdG8gY2FsbCB0aGlzwqAgcmlnaHQgYWZ0ZXIgY2FsbGluZyBkcm1fZGV2X3VucGx1ZyBm
cm9tCj4+PiBhbWRncHVfcGNpX3JlbW92ZSB3aGlsZSBhZGRpbmcgZHJtX2Rldl9lbnRlci9leGl0
IGluIHR0bV9ib192bV9mYXVsdCAob3IKPj4+IGluIGFtZGdwdSBzcGVjaWZpYyB3cmFwcGVyIHNp
bmNlIEkgZG9uJ3Qgc2VlIGhvdyBjYW4gSSBhY2Nlc3Mgc3RydWN0Cj4+PiBkcm1fZGV2aWNlIGZy
b20gdHRtX2JvX3ZtX2ZhdWx0KSBhbmQgdGhpcyBpbiBteSB1bmRlcnN0YW5kaW5nIHNob3VsZAo+
Pj4gc3RvcCBhIFBURSBmcm9tIGJlaW5nIHJlLWZhdWx0ZWQgYmFjayBhcyB5b3UgcG9pbnRlZCBv
dXQgLSBzbyBhZ2FpbiBJCj4+PiBkb24ndCBzZWUgaG93wqAgYm8gcmVzZXJ2YXRpb24gd291bGQg
cHJldmVudCBpdCBzbyBpdCBsb29rcyBsaWtlIEkgYW0KPj4+IG1pc3Npbmcgc29tZXRoaW5nLi4u
Cj4+Pgo+Pj4KPj4+PiAocGVyaGFwcyB3aXRoIGEgbWVtb3J5IGJhcnJpZXIgcGFpcikuCj4+Pj4K
Pj4+IGRybV9kZXZfdW5wbHVnIGFuZCBkcm1fZGV2X2VudGVyL2V4aXQgYXJlIFJDVSBzeW5jaHJv
bml6ZWQgYW5kIHNvIEkKPj4+IGRvbid0IHRoaW5rIHJlcXVpcmUgYW55IGV4dHJhIG1lbW9yeSBi
YXJyaWVycyBmb3IgdmlzaWJpbGl0eSBvZiB0aGUKPj4+IHJlbW92ZWQgZmxhZyBiZWluZyBzZXQK
Pj4+Cj4+IEFzIGZhciBhcyBJIGNhbiBzZWUgdGhhdCBzaG91bGQgYmUgcGVyZmVjdGx5IHN1ZmZp
Y2llbnQuCj4gT25seSBpZiB5b3UgaGF2ZSBhIGRybV9kZXZfZW50ZXIvZXhpdCBwYWlyIGluIHlv
dXIgZmF1bHQgaGFuZGxlci4KPiBPdGhlcndpc2UgeW91J3JlIHN0aWxsIG9wZW4gdG8gdGhlIHJh
Y2VzIFRob21hcyBkZXNjcmliZWQuIEJ1dCBhc2lkZSBmcm9tCj4gdGhhdCB0aGUgZHJtX2Rldl91
bnBsdWcgc3R1ZmYgaGFzIGFsbCB0aGUgYmFycmllcnMgYW5kIHN0dWZmIHRvIG1ha2Ugc3VyZQo+
IG5vdGhpbmcgZXNjYXBlcy4KPgo+IEZhaWx1cmUgdG8gZHJtX2Rldl9lbnRlciBjb3VsZCB0aGVu
IGFsc28gdHJpZ2dlciB0aGUgc3BlY2lhbCBjYXNlIHdoZXJlIHdlCj4gcHV0IGEgZHVtbXkgcGFn
ZSBpbiBwbGFjZS4KPiAtRGFuaWVsCgpIbW0sIFllcywgaW5kZWVkIGFkdmVydGl6aW5nIHRoZSBm
bGFnIGJlZm9yZSB0aGUgY2FsbCB0byAKdW5tYXBfbWFwcGluZ19yYW5nZSBpc24ndCBlbm91Z2gs
IHNpbmNlIHRoZXJlIG1pZ2h0IGJlIGZhdWx0IGhhbmRsZXJzIApydW5uaW5nIHRoYXQgaGF2ZW4n
dCBwaWNrZWQgdXAgdGhlIGZsYWcgd2hlbiB1bm1hcF9tYXBwaW5nX3JhbmdlIGlzIApsYXVuY2hl
ZC4KCkZvciB0aGUgc3BlY2lhbCBjYXNlIG9mIHN5bmNpbmcgYSBmdWxsIGFkZHJlc3Mtc3BhY2Ug
CnVubWFwX21hcHBpbmdfcmFuZ2UoKSB3aXRoIGZhdWx0IGhhbmRsZXJzIHJlZ2FyZGxlc3Mgb2Yg
dGhlIHJlYXNvbiBmb3IgCnRoZSBmdWxsIGFkZHJlc3Mtc3BhY2UgdW5tYXBfbWFwcGluZ19yYW5n
ZSgpIG9uZSBjb3VsZCBlaXRoZXIgdHJhdmVyc2UgCnRoZSBhZGRyZXNzIHNwYWNlIChkcm1fdm1h
X21hbmFnZXIpIGFuZCBncmFiICphbGwqIGJvIHJlc2VydmF0aW9ucyAKYXJvdW5kIHRoZSB1bm1h
cF9tYXBwaW5nX3JhbmdlKCksIG9yIGdyYWIgdGhlIGlfbW1hcF9sb2NrIGluIHJlYWQgbW9kZSAK
aW4gdGhlIGZhdWx0IGhhbmRsZXIuIChJdCdzIHRha2VuIGluIHdyaXRlIG1vZGUgaW4gdW5tYXBf
bWFwcGluZ19yYW5nZSkuIApXaGlsZSB0aGUgbGF0dGVyIG1heSBzZWVtIGxpa2UgYSBzaW1wbGUg
c29sdXRpb24sIG9uZSBzaG91bGQgcHJvYmFibHkgCmNvbnNpZGVyIHRoZSBvdmVyaGVhZCBib3Ro
IGluIHJ1bi10aW1lIGFuZCBzY2FsaW5nIGFiaWxpdHkuCgovVGhvbWFzCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
