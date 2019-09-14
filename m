Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FACB2D27
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2019 23:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4886F55E;
	Sat, 14 Sep 2019 21:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047CA6F55E
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Sep 2019 21:35:25 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Sep 2019 14:35:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,506,1559545200"; d="scan'208";a="201299675"
Received: from nwadhera-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.252.3.97])
 by fmsmga001.fm.intel.com with ESMTP; 14 Sep 2019 14:35:23 -0700
Date: Sat, 14 Sep 2019 22:35:22 +0100
From: Eric Engestrom <eric.engestrom@intel.com>
To: Alan Coopersmith <alan.coopersmith@oracle.com>
Subject: Re: [PATCH libdrm] meson: Fix sys/mkdev.h detection on Solaris
Message-ID: <20190914213522.j3b5jau7w7c3laab@intel.com>
References: <20190909235116.19290-1-alan.coopersmith@oracle.com>
 <20190910125520.skda23msaby6otdp@intel.com>
 <857dc94f-5356-842f-fcc1-f143d63b88eb@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <857dc94f-5356-842f-fcc1-f143d63b88eb@oracle.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. 1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpZGF5LCAyMDE5LTA5LTEzIDE2OjI2OjU1IC0wNzAwLCBBbGFuIENvb3BlcnNtaXRoIHdy
b3RlOgo+IE9uIDkvMTAvMTkgNTo1NSBBTSwgRXJpYyBFbmdlc3Ryb20gd3JvdGU6Cj4gPiBPbiBN
b25kYXksIDIwMTktMDktMDkgMTY6NTE6MTYgLTA3MDAsIEFsYW4gQ29vcGVyc21pdGggd3JvdGU6
Cj4gPiA+IE9uIFNvbGFyaXMsIHN5cy9zeXNtYWNyb3MuaCBoYXMgbG9uZy1kZXByZWNhdGVkIGNv
cGllcyBvZiBtYWpvcigpICYgbWlub3IoKQo+ID4gPiBidXQgbm90IG1ha2VkZXYoKS4gIHN5cy9t
a2Rldi5oIGhhcyBhbGwgdGhyZWUgYW5kIGlzIHRoZSBwcmVmZXJyZWQgY2hvaWNlLgo+ID4gPiAK
PiA+ID4gU28gd2UgY2hlY2sgZm9yIHN5cy9ta2Rldi5oIGZpcnN0LCBhcyBhdXRvY29uZidzIEFD
X0hFQURFUl9NQUpPUiBkb2VzLgo+ID4gCj4gPiBSZXZpZXdlZC1ieTogRXJpYyBFbmdlc3Ryb20g
PGVyaWMuZW5nZXN0cm9tQGludGVsLmNvbT4KPiA+IAo+ID4gQWx0ZXJuYXRpdmVseSwgaG93IGFi
b3V0IHRoaXM/Cj4gPiAtLS04PC0tLQo+ID4gZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVz
b24uYnVpbGQKPiA+IGluZGV4IGJjNWNmYzU4OGQwYzYyMWE5NzI1Li4yNjNmNjkxYWIyYjkxMDdm
NWJlMSAxMDA2NDQKPiA+IC0tLSBhL21lc29uLmJ1aWxkCj4gPiArKysgYi9tZXNvbi5idWlsZAo+
ID4gQEAgLTE4Myw5ICsxODMsMTQgQEAgZm9yZWFjaCBoZWFkZXIgOiBbJ3N5cy9zeXNjdGwuaCcs
ICdzeXMvc2VsZWN0LmgnLCAnYWxsb2NhLmgnXQo+ID4gICAgIGNvbmZpZy5zZXQoJ0hBVkVfJyAr
IGhlYWRlci51bmRlcnNjb3JpZnkoKS50b191cHBlcigpLAo+ID4gICAgICAgY2MuY29tcGlsZXMo
JyNpbmNsdWRlIDxAMEA+Jy5mb3JtYXQoaGVhZGVyKSwgbmFtZSA6ICdAMEAgd29ya3MnLmZvcm1h
dChoZWFkZXIpKSkKPiA+ICAgZW5kZm9yZWFjaAo+ID4gLWlmIGNjLmhhc19oZWFkZXJfc3ltYm9s
KCdzeXMvc3lzbWFjcm9zLmgnLCAnbWFqb3InKQo+ID4gK2lmIChjYy5oYXNfaGVhZGVyX3N5bWJv
bCgnc3lzL3N5c21hY3Jvcy5oJywgJ21ham9yJykgYW5kCj4gPiArICBjYy5oYXNfaGVhZGVyX3N5
bWJvbCgnc3lzL3N5c21hY3Jvcy5oJywgJ21pbm9yJykgYW5kCj4gPiArICBjYy5oYXNfaGVhZGVy
X3N5bWJvbCgnc3lzL3N5c21hY3Jvcy5oJywgJ21ha2VkZXYnKSkKPiA+ICAgICBjb25maWcuc2V0
MTAoJ01BSk9SX0lOX1NZU01BQ1JPUycsIHRydWUpCj4gPiAtZWxpZiBjYy5oYXNfaGVhZGVyX3N5
bWJvbCgnc3lzL21rZGV2LmgnLCAnbWFqb3InKQo+ID4gK2VuZGlmCj4gPiAraWYgKGNjLmhhc19o
ZWFkZXJfc3ltYm9sKCdzeXMvbWtkZXYuaCcsICdtYWpvcicpIGFuZAo+ID4gKyAgY2MuaGFzX2hl
YWRlcl9zeW1ib2woJ3N5cy9ta2Rldi5oJywgJ21pbm9yJykgYW5kCj4gPiArICBjYy5oYXNfaGVh
ZGVyX3N5bWJvbCgnc3lzL21rZGV2LmgnLCAnbWFrZWRldicpKQo+ID4gICAgIGNvbmZpZy5zZXQx
MCgnTUFKT1JfSU5fTUtERVYnLCB0cnVlKQo+ID4gICBlbmRpZgo+ID4gICBjb25maWcuc2V0MTAo
J0hBVkVfT1BFTl9NRU1TVFJFQU0nLCBjYy5oYXNfZnVuY3Rpb24oJ29wZW5fbWVtc3RyZWFtJykp
Cj4gPiAtLS0+OC0tLQo+ID4gCj4gPiBNYWtlcyBib3RoIGNoZWNrcyBpbmRlcGVuZGVudCBhbmQg
cmVwcmVzZW50IHRoZSByZWFsaXR5IG9mIHdoYXQncyB3YW50ZWQKPiA+IG1vcmUgYWNjdXJhdGVs
eSAoZGVzcGl0ZSB0aGUgaGlzdG9yaWNhbCBuYW1lIG9mIHRoZSBtYWNybykuCj4gCj4gVGhhdCB3
b3JrczoKPiAKPiBIZWFkZXIgPHN5cy9zeXNtYWNyb3MuaD4gaGFzIHN5bWJvbCAibWFqb3IiIDog
WUVTIChjYWNoZWQpCj4gSGVhZGVyIDxzeXMvc3lzbWFjcm9zLmg+IGhhcyBzeW1ib2wgIm1pbm9y
IiA6IFlFUwo+IEhlYWRlciA8c3lzL3N5c21hY3Jvcy5oPiBoYXMgc3ltYm9sICJtYWtlZGV2IiA6
IE5PCj4gSGVhZGVyIDxzeXMvbWtkZXYuaD4gaGFzIHN5bWJvbCAibWFqb3IiIDogWUVTCj4gSGVh
ZGVyIDxzeXMvbWtkZXYuaD4gaGFzIHN5bWJvbCAibWlub3IiIDogWUVTCj4gSGVhZGVyIDxzeXMv
bWtkZXYuaD4gaGFzIHN5bWJvbCAibWFrZWRldiIgOiBZRVMKPiAKPiBXb3VsZCB5b3UgbGlrZSBt
ZSB0byByZXN1Ym1pdCB3aXRoIHRoYXQsIG9yIGRvIHlvdSB3YW50IHRvIHN1Ym1pdCBpdD8KPiAK
PiBJZiB5b3Ugd2FudCB0byBnbyBhaGVhZCwgdGhlbjoKPiAKPiBSZXZpZXdlZC1ieTogQWxhbiBD
b29wZXJzbWl0aCA8YWxhbi5jb29wZXJzbWl0aEBvcmFjbGUuY29tPgo+IFRlc3RlZC1ieTogQWxh
biBDb29wZXJzbWl0aCA8YWxhbi5jb29wZXJzbWl0aEBvcmFjbGUuY29tPgoKSnVzdCBwdXNoZWQg
aXQgYXMgODI3YTJhMjA0MjM1OWFjOTNhOWIwODJlZTk1ODRiNDNiYWExYTNmNzsgdGhhbmtzIGZv
cgp0ZXN0aW5nIGl0IQoKSSd2ZSBhbHNvIHRhZ2dlZCB5b3Ugb24gYSBNZXNhIE1SIHRvIHRoZSBz
YW1lIGVmZmVjdCwgaW4gY2FzZSB5b3Ugd2FudAp0byBnaXZlIGl0IGEgZ28gOikKCj4gCj4gLS0g
Cj4gCS1BbGFuIENvb3BlcnNtaXRoLSAgICAgICAgICAgICAgIGFsYW4uY29vcGVyc21pdGhAb3Jh
Y2xlLmNvbQo+IAkgT3JhY2xlIFNvbGFyaXMgRW5naW5lZXJpbmcgLSBodHRwczovL2Jsb2dzLm9y
YWNsZS5jb20vYWxhbmMKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
