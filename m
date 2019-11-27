Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF3B10B6DB
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 20:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB8F6E5B0;
	Wed, 27 Nov 2019 19:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7F76E5AE;
 Wed, 27 Nov 2019 19:35:20 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 11:35:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,250,1571727600"; d="scan'208";a="206867702"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by fmsmga008.fm.intel.com with ESMTP; 27 Nov 2019 11:35:18 -0800
Date: Wed, 27 Nov 2019 11:23:56 -0800
From: Niranjan Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC 03/13] drm/i915/svm: Runtime (RT) allocator
 support
Message-ID: <20191127192356.GJ14488@nvishwa1-DESK.sc.intel.com>
References: <20191122205734.15925-1-niranjana.vishwanathapura@intel.com>
 <20191122205734.15925-4-niranjana.vishwanathapura@intel.com>
 <157467597709.2314.3239893018411484277@skylake-alporthouse-com>
 <20191125164057.GH14488@nvishwa1-DESK.sc.intel.com>
 <157477677170.23952.10779405590776070095@jlahtine-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157477677170.23952.10779405590776070095@jlahtine-desk.ger.corp.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: intel-gfx@lists.freedesktop.org, sanjay.k.kumar@intel.com,
 dri-devel@lists.freedesktop.org, dave.hansen@intel.com, jglisse@redhat.com,
 jgg@mellanox.com, daniel.vetter@intel.com, dan.j.williams@intel.com,
 ira.weiny@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDM6NTk6MzFQTSArMDIwMCwgSm9vbmFzIExhaHRpbmVu
IHdyb3RlOgo+UXVvdGluZyBOaXJhbmphbiBWaXNod2FuYXRoYXB1cmEgKDIwMTktMTEtMjUgMTg6
NDA6NTcpCj4+IE9uIE1vbiwgTm92IDI1LCAyMDE5IGF0IDA5OjU5OjM3QU0gKzAwMDAsIENocmlz
IFdpbHNvbiB3cm90ZToKPj4gPlF1b3RpbmcgTmlyYW5qYW5hIFZpc2h3YW5hdGhhcHVyYSAoMjAx
OS0xMS0yMiAyMDo1NzoyNCkKPj4gPj4gU2hhcmVkIFZpcnR1YWwgTWVtb3J5IChTVk0pIHJ1bnRp
bWUgYWxsb2NhdG9yIHN1cHBvcnQgYWxsb3dzCj4+ID4+IGJpbmRpbmcgYSBzaGFyZWQgdmlydHVh
bCBhZGRyZXNzIHRvIGEgYnVmZmVyIG9iamVjdCAoQk8pIGluIHRoZQo+PiA+PiBkZXZpY2UgcGFn
ZSB0YWJsZSB0aHJvdWdoIGFuIGlvY3RsIGNhbGwuCj4+ID4KPj4gPlRoZSBpb2N0bCB0aG91Z2gg
aXMgbm90IHN2bSBzcGVjaWZpYywgaXQgaXMgdG8gZG8gd2l0aCAiYnVsayByZXNpZGVuY3kiCj4+
ID5hbmQgY2FuIGJlIHVzZWQgdG8gcmVkdWNlIGV4ZWNidWYgdHJhZmZpYyB0byBwcm92aWRlIHZp
cnR1YWwgYWRkcmVzcwo+PiA+bGF5b3V0IGNvbnRyb2xzIHRvIGUuZy4gVnVsa2FuIGNsaWVudHMu
Cj4+ID4KPj4gPkk5MTVfVk1fQklORCB7Cj4+ID4gICAgICAgdWludDMyX3Qgdm1faWQ7Cj4+ID4g
ICAgICAgaW50MzJfdCBmZDsgLyogb3IgLTEgZm9yIGFub24sIG9yIGJ1ZiBkZXBlbmRpbmcgb24g
ZmxhZ3MgKi8KPj4gPiAgICAgICB1aW50NjRfdCBmbGFnczsKPj4gPiAgICAgICB1aW50NjRfdCBv
ZmZzZXQ7IC8qIG9mZnNldCBpbmZvIGZkIFtwYWdlIGFsaWduZWRdICovCj4+ID4gICAgICAgdWlu
dDY0X3QgbGVuZ3RoOyAvKiBwYWdlIGFsaWduZWQgKi8KPj4gPiAgICAgICB1aW50NjRfdCBpb3Zh
OyAvKiBwYWdlIGFsaWduZWQgKi8KPj4gPiAgICAgICB1aW50NjRfdCBleHRlbnNpb25zOwo+PiA+
fTsgLyogd2hlcmUgcGFnZSBhbGlnbmVkIGlzIGFjdHVhbGx5IG1vcmUgSTkxNV9HVFRfUEFHRV9B
TElHTk1FTlQgKi8KPj4gPgo+PiA+YXMgSSByZWNhbGwuIEkgYWxzbyByZWNhbGwgaXQgYmVpbmcg
cGFydCBvZiBhIGZ1dHVyZSBjb21tYW5kIHN0cmVhbQo+PiA+aW50ZXJmYWNlIHRvIHJlZHVjZSBp
b2N0bHMsIGJ1dCB0aGF0IGlzIGFub3RoZXIgc3RvcnkuCj4+Cj4+IFRoYW5rcyBDaHJpcy4KPj4g
SSB3aWxsIGNoYW5nZSBJOTE1X0JJTkQgdG8gSTkxNV9WTV9CSU5ELgo+Cj5XZSdyZSB2ZXJ5IG11
Y2ggZGVwZW5kaW5nIG9uIEdFTSBWTSBldmVuIGlmIEJPcyB3b3VsZG4ndCBiZSB1c2VkLAo+c28g
dGhpcyBpcyBiZXN0IGNhbGxlZCBJOTE1X0dFTV9WTV9CSU5EIHRvIG1hdGNoIEk5MTVfR0VNX1ZN
X0NSRUFURQo+YW5kIGF2b2lkIHVzZXIgY29uZnVzaW9uLgo+CgpUaGFua3MgSm9vbmFzLgpPaywg
bWFrZXMgc2Vuc2UuIEkgd2lsbCBtYWtlIGl0IGFzIHN1Y2guCgo+PiBDdXJyZW50bHksIGl0IGlz
IG9ubHkgYWRkcmVzc2luZyBiaW5kaW5nIFNWTSBzeXN0ZW0gKGJ1ZmZlcikgYW5kIHJ1bnRpbWUg
KEJPcykKPj4gYWxsb2NhdGlvbnMuIEJ1dCBpdCBjYW4gYmUgZXhwYW5kZWQgZm9yIG90aGVyIGJp
bmRpbmdzLiBJIGhhdmUgJ3R5cGUnIGZpZWxkCj4+IGluc3RlYWQgb2YgJ2ZkJyBhbmQgJ2V4dGVu
c2lvbnMnICYgJ2lvdicgY2FuIGJlIGFkZGVkIGxhdGVyIGlmIHJlcXVpcmVkLgo+Cj5XZSBzaG91
bGQgdHJ5IHRvIGhhdmUgdGhlIHVBUEkgYXMgZmluYWwgYXMgZWFybHkgYXMgcG9zc2libGUuIFRo
ZQo+Y2hhbmdlIHByb2Nlc3MgaXMgaGFyZGVyIHRoZSBsYXRlciBpdCBpcyBkb25lLCBldmVuIGZv
ciBSRkMgOikKPgo+T24gdGhlIHNhbWUgbm90ZSwgSSdtIGluY2xpbmVkIHRvIGhhdmUgSTkxNV9T
Vk1fTUlHUkFURSBjYWxsZWQKPkk5MTVfR0VNX1ZNX1BSRUZBVUxUIGZyb20gdGhlIHN0YXJ0LCBh
cyBJIGFscmVhZHkgaGF2ZSBnb3Qgc29tZQo+Y29uZnVzZWQgcXVlc3Rpb25zIGZyb20gZm9sa3Mg
d2hvIG1peCBpdCB3aXRoIG1lbW9yeSBwcmVzc3VyZQo+aW5pdGlhdGVkIG1pZ3JhdGlvbi4gQW5k
IGl0J3MgaW5oZXJlbnRseSByYWN5IGFzIGFueWJvZHkgY291bGQKPnJhY2Ugd2l0aCBpdCwgc28g
UFJFRkFVTFQgd291bGQgZ2l2ZSBhbiBpbXByZXNzaW9uIG9mIHRoYXQuCj4KPkFuZCBJIHRoaW5r
IEk5MTVfR0VNX1ZNX1BSRUZBVUxUIHdvdWxkIGJlIGEgZ2VuZXJhbGx5IGFwcGxpY2FibGUKPmZ1
bmN0aW9uLCBqdXN0IGxpa2UgSTkxNV9HRU1fVk1fQklORC4gU28gd2Ugc2hvdWxkIHVzZSBhIHN0
cnVjdAo+bWVtYmVyIG5hbWVzIHRoYXQgYXJlIGNsb3NlIHRvIEk5MTVfR0VNX1ZNX0JJTkQuCj4K
PkJldHRlciBpZGVhcyBmb3IgbmFtZSB0byBlbXBoYXNpcyB0aGUgbmF0dXJlIG9mIHdoYXQgaXMg
YmVpbmcKPmRvbmU/IEk5MTVfR0VNX1ZNX0ZBVUxUL0k5MTVfR0VNX1ZNX3tNLH1BRFZJQ0UuLi4K
PgoKVGhvdWdoIGN1cnJlbnQgcGF0Y2hzZXQgb25seSBzdXBwb3J0cyBtaWdyYXRpbmcgcGFnZXMg
ZnJvbQpob3N0IHRvIGRldmljZSBtZW1vcnksIEkgaW50ZW5kIHRvIHN1cHBvcnQgbWlncmF0aW5n
IGZyb20gZGV2aWNlCnRvIGhvc3QgbWVtb3J5IGFzIHdlbGwgd2l0aCBzYW1lIGlvY3RsLiBVc2Vy
IHdvdWxkIHdhbnQgdGhhdC4KTm90IHN1cmUgd2hhdCB3b3VsZCBiZSBhIGdvb2QgbmFtZSB0aGVu
LCBfTUlHUkFURS9fUFJFRkVUQ0gvX01PVkU/CgpBbHNvLCBtaWdyYXRpbmcgZ2VtIG9iamVjdHMg
aXMgY3VycmVudGx5IGhhbmRsZWQgYnkgc2VwYXJhdGUgaW9jdGwKd2hpY2ggaXMgcGFydCBvZiBM
TUVNIHBhdGNoIHNlcmllcy4gSSBhbSBvcGVuIHRvIG1lcmdpbmcgdGhlc2UKaW9jdGxzIHRvZ2V0
aGVyIChzaW1pbGFydCB0byBWTV9CSU5EKSBpbnRvIGEgc2luZ2xlIE1JR1JBVEUgaW9jdGwuCgpO
aXJhbmphbmEKCj5SZWdhcmRzLCBKb29uYXMKPgo+PiBJcyB0aGF0IE9LPwo+Pgo+PiA+LUNocmlz
Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IElu
dGVsLWdmeCBtYWlsaW5nIGxpc3QKPj4gSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdm
eApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
