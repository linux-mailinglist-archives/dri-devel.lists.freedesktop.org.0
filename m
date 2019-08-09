Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DC28737F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 09:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031FA6E1DE;
	Fri,  9 Aug 2019 07:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D966E1DE
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 07:53:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tomeu) with ESMTPSA id 0573728948A
Subject: Re: [PATCH] drm/panfrost: Implement per FD address spaces
To: Rob Herring <robh@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <20190808222918.15153-1-robh@kernel.org>
 <20190808231110.GA12294@kevin>
 <CAL_Jsq+Y0VfXZc4btc0A8toC+arcKLmtpRHfpQiPy=6Ckts=-w@mail.gmail.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Message-ID: <95246b44-3e1c-ea4b-8afa-73f89874402d@collabora.com>
Date: Fri, 9 Aug 2019 09:53:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+Y0VfXZc4btc0A8toC+arcKLmtpRHfpQiPy=6Ckts=-w@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC85LzE5IDU6MDEgQU0sIFJvYiBIZXJyaW5nIHdyb3RlOgo+IE9uIFRodSwgQXVnIDgsIDIw
MTkgYXQgNToxMSBQTSBBbHlzc2EgUm9zZW56d2VpZwo+IDxhbHlzc2Eucm9zZW56d2VpZ0Bjb2xs
YWJvcmEuY29tPiB3cm90ZToKPj4KPj4+IEBAIC00NDgsNiArNDUzLDcgQEAgc3RhdGljIGlycXJl
dHVybl90IHBhbmZyb3N0X2pvYl9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkYXRhKQo+Pj4g
ICAgICAgICAgICAgICAgfQo+Pj4KPj4+ICAgICAgICAgICAgICAgIGlmIChzdGF0dXMgJiBKT0Jf
SU5UX01BU0tfRE9ORShqKSkgewo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHBhbmZyb3N0X21t
dV9hc19wdXQocGZkZXYsICZwZmRldi0+am9ic1tqXS0+ZmlsZV9wcml2LT5tbXUpOwo+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICBwYW5mcm9zdF9kZXZmcmVxX3JlY29yZF90cmFuc2l0aW9uKHBm
ZGV2LCBqKTsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgZG1hX2ZlbmNlX3NpZ25hbChwZmRl
di0+am9ic1tqXS0+ZG9uZV9mZW5jZSk7Cj4+PiAgICAgICAgICAgICAgICB9Cj4+Cj4+IElzIHRo
ZSBpZGVhIHRvIHN3aXRjaCBBUydzIHdoZW4gYW4gSVJRIGlzIGZpcmVkIGNvcnJlc3BvbmRpbmcg
dG8gYQo+PiBwcm9jZXNzIHdpdGggYSBwYXJ0aWN1bGFyIGFkZHJlc3Mgc3NwYWNlPyAoV2hlcmUg
ZG8gd2Ugc3dpdGNoIGJhY2s/IE9yCj4+IGlzIHRoYXQgbm90IGhvdyB0aGUgTU1VIGFjdHVhbGx5
IHdvcmtzIGhlcmU/KQo+IAo+IE5vLiBUaGVyZSdzIDMgc3RhdGVzIGFuIEFTIGNhbiBiZSBpbjog
ZnJlZSwgYWxsb2NhdGVkLCBhbmQgaW4gdXNlLgo+IFdoZW4gYSBqb2IgcnVucywgaXQgcmVxdWVz
dHMgYW4gYWRkcmVzcyBzcGFjZSBhbmQgdGhlbiBtYXJrcyBpdCBub3QgaW4KPiB1c2Ugd2hlbiBq
b2IgaXMgY29tcGxldGUoYnV0IHN0YXlzIGFzc2lnbmVkKS4gVGhlIGZpcnN0IHRpbWUgdGhydSwg
d2UKPiBmaW5kIGEgZnJlZSBBUyBpbiB0aGUgYWxsb2NfbWFzayBhbmQgYXNzaWduIHRoZSBBUyB0
byB0aGUgRkQuIFRoZW4gdGhlCj4gbmV4dCB0aW1lIHRocnUsIHdlIG1vc3QgbGlrZWx5IGFscmVh
ZHkgaGF2ZSBvdXIgQVMgYW5kIHdlIGp1c3QgbWFyayBpdAo+IGluIHVzZSB3aXRoIGEgcmVmIGNv
dW50LiBXZSBuZWVkIGEgcmVmIGNvdW50IGJlY2F1c2Ugd2UgaGF2ZSBtdWx0aXBsZQo+IGpvYiBz
bG90cy4gSWYgdGhlIGpvYi9GRCBkb2Vzbid0IGhhdmUgYW4gQVMgYXNzaWduZWQgYW5kIHRoZXJl
IGFyZSBubwo+IGZyZWUgb25lcywgdGhlbiB3ZSBwaWNrIGFuIGFsbG9jYXRlZCBvbmUgbm90IGlu
IHVzZSBmcm9tIG91ciBMUlUgbGlzdAo+IGFuZCBzd2l0Y2ggdGhlIEFTIGZyb20gdGhlIG9sZCBG
RCB0byB0aGUgbmV3IG9uZS4KPiAKPiBTd2l0Y2hpbmcgYW4gQVMgZnJvbSBvbmUgRkQgdG8gYW5v
dGhlciB0dXJucyBvdXQgdG8gYmUgcXVpdGUgc2ltcGxlLgo+IFdlIHNpbXBseSB1cGRhdGUgdGhl
IEFTIHJlZ2lzdGVycyB0byBwb2ludCB0byBuZXcgcGFnZSB0YWJsZSBiYXNlCj4gYWRkcmVzcyBh
bmQgdGhhdCdzIGl0Lgo+IAo+PiBMb2dpY2FsbHkgaXQgc2VlbXMgc291bmQsIGp1c3QgYXJtY2hh
aXIgbmVydm91cyBhYm91dCBwb3RlbnRpYWwgcmFjZQo+PiBjb25kaXRpb25zIHdpdGggd2VpcmQg
bXVsdGl0aHJlYWRpbmcgc2V0dXBzLgo+IAo+IEJ1dCBXZWJHTCEgOikKPiAKPiBJIHdhcyB3b3Jy
aWVkIHRvby4gSXQgc2VlbXMgdG8gYmUgd29ya2luZyBwcmV0dHkgd2VsbCB0aG91Z2gsIGJ1dCBt
b3JlCj4gdGVzdGluZyB3b3VsZCBiZSBnb29kLgoKU29vbiB3ZSBzaG91bGQgYmUgc3dpdGNoaW5n
IG91ciBNZXNhIENJIHRvIHJ1biBkRVFQIHRlc3RzIGNvbmN1cnJlbnRseSwgCmFuZCB3ZSBtYXkg
ZmluZCBhbnkgc3VjaCBpc3N1ZXMuCgo+IEkgZG9uJ3QgdGhpbmsgdGhlcmUgYXJlIGEgbG90IG9m
IHVzZWNhc2VzIHRoYXQKPiB1c2UgbW9yZSBBUyB0aGFuIHRoZSBoL3cgaGFzICg4IG9uIFQ4NjAp
LCBidXQgSSdtIG5vdCBzdXJlLgoKWWVhaCwgSSB0aGluayB3ZSdsbCBzZWUgb2Z0ZW4gbW9yZSB0
aGFuIDggY2xpZW50cyBjb25uZWN0ZWQgYXQgdGhlIHNhbWUgCnRpbWUsIGJ1dCB2ZXJ5IHJhcmVs
eSB0aGV5IHdpbGwgYmUgYWxsIHN1Ym1pdHRpbmcgam9icyBzaW11bHRhbmVvdXNseS4KCkNoZWVy
cywKClRvbWV1Cgo+IEkgdHJpZWQgdG8gY29tZSB1cCB3aXRoIGEgbG9ja2xlc3MgZmFzdHBhdGgs
IGJ1dCB0aGVuIGp1c3QgZ2F2ZSB1cCBhbmQKPiBzdHVjayBhIHNwaW5sb2NrIGFyb3VuZCB0aGUg
d2hvbGUgdGhpbmcuCj4+Cj4+PiArICAgICAvKiBBc3NpZ24gdGhlIGZyZWUgb3IgcmVjbGFpbWVk
IEFTIHRvIHRoZSAgKi8KPj4KPj4gdG8gdGhlLi4uLj8KPiAKPiBGRAo+IAo+IFJvYgo+IApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
