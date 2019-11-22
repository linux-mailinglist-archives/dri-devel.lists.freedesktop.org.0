Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2FD107966
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 21:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE5E06F563;
	Fri, 22 Nov 2019 20:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12646F563;
 Fri, 22 Nov 2019 20:23:10 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Nov 2019 12:23:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,231,1571727600"; d="scan'208";a="382185478"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by orsmga005.jf.intel.com with ESMTP; 22 Nov 2019 12:23:09 -0800
Date: Fri, 22 Nov 2019 12:11:43 -0800
From: Niranjan Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [RFC 06/13] drm/i915/svm: Page table mirroring support
Message-ID: <20191122201143.GB14488@nvishwa1-DESK.sc.intel.com>
References: <20191122195452.14346-1-niranjana.vishwanathapura@intel.com>
 <20191122195452.14346-7-niranjana.vishwanathapura@intel.com>
 <20191122200116.GA14488@nvishwa1-DESK.sc.intel.com>
 <20191122201448.GY7481@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122201448.GY7481@mellanox.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "sanjay.k.kumar@intel.com" <sanjay.k.kumar@intel.com>,
 "sudeep.dutt@intel.com" <sudeep.dutt@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "jon.bloomfield@intel.com" <jon.bloomfield@intel.com>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "ira.weiny@intel.com" <ira.weiny@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMDg6MTQ6NTFQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMTI6MDE6MTdQTSAtMDgwMCwgTmlyYW5q
YW4gVmlzaHdhbmF0aGFwdXJhIHdyb3RlOgo+PiBPbiBGcmksIE5vdiAyMiwgMjAxOSBhdCAxMTo1
NDo0NUFNIC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhIHdyb3RlOgo+PiA+IFVzZSBI
TU0gcGFnZSB0YWJsZSBtaXJyb3Jpbmcgc3VwcG9ydCB0byBidWlsZCBkZXZpY2UgcGFnZSB0YWJs
ZS4KPj4gPiBJbXBsZW1lbnQgdGhlIGJpbmQgaW9jdGwgYW5kIGJpbmQgdGhlIHByb2Nlc3MgYWRk
cmVzcyByYW5nZSBpbiB0aGUKPj4gPiBzcGVjaWZpZWQgY29udGV4dCdzIHBwZ3R0Lgo+PiA+IEhh
bmRsZSBpbnZhbGlkYXRpb24gbm90aWZpY2F0aW9ucyBieSB1bmJpbmRpbmcgdGhlIGFkZHJlc3Mg
cmFuZ2UuCj4+ID4KPj4gPiBDYzogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGlu
dXguaW50ZWwuY29tPgo+PiA+IENjOiBKb24gQmxvb21maWVsZCA8am9uLmJsb29tZmllbGRAaW50
ZWwuY29tPgo+PiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4K
Pj4gPiBDYzogU3VkZWVwIER1dHQgPHN1ZGVlcC5kdXR0QGludGVsLmNvbT4KPj4gPiBTaWduZWQt
b2ZmLWJ5OiBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhIDxuaXJhbmphbmEudmlzaHdhbmF0aGFw
dXJhQGludGVsLmNvbT4KPj4gPiAraW50IGk5MTVfc3ZtX2JpbmRfbW0oc3RydWN0IGk5MTVfYWRk
cmVzc19zcGFjZSAqdm0pCj4+ID4gK3sKPj4gPiArCXN0cnVjdCBpOTE1X3N2bSAqc3ZtOwo+PiA+
ICsJc3RydWN0IG1tX3N0cnVjdCAqbW07Cj4+ID4gKwlpbnQgcmV0ID0gMDsKPj4gPiArCj4+ID4g
KwltbSA9IGdldF90YXNrX21tKGN1cnJlbnQpOwo+PiA+ICsJZG93bl93cml0ZSgmbW0tPm1tYXBf
c2VtKTsKPj4gPiArCW11dGV4X2xvY2soJnZtLT5zdm1fbXV0ZXgpOwo+PiA+ICsJaWYgKHZtLT5z
dm0pCj4+ID4gKwkJZ290byBiaW5kX291dDsKPj4gPiArCj4+ID4gKwlzdm0gPSBremFsbG9jKHNp
emVvZigqc3ZtKSwgR0ZQX0tFUk5FTCk7Cj4+ID4gKwlpZiAoIXN2bSkgewo+PiA+ICsJCXJldCA9
IC1FTk9NRU07Cj4+ID4gKwkJZ290byBiaW5kX291dDsKPj4gPiArCX0KPj4gPiArCXN2bS0+bWly
cm9yLm9wcyA9ICZpOTE1X21pcnJvcl9vcHM7Cj4+ID4gKwltdXRleF9pbml0KCZzdm0tPm11dGV4
KTsKPj4gPiArCWtyZWZfaW5pdCgmc3ZtLT5yZWYpOwo+PiA+ICsJc3ZtLT5tbSA9IG1tOwo+PiA+
ICsJc3ZtLT52bSA9IHZtOwo+PiA+ICsKPj4gPiArCXJldCA9IGhtbV9taXJyb3JfcmVnaXN0ZXIo
JnN2bS0+bWlycm9yLCBtbSk7Cj4+Cj4+IEkgc2F3IHRoYXQgdGhlc2UgQVBJcyBoYXZlIGJlZW4g
cmVtb3ZlZC4KPj4gSSB3aWxsIHVwZGF0ZSBvbmNlIGl0IGdldHMgaW5jbHVkZWQgaW4ga2VybmVs
IHJlbGVhc2UuCj4KPkkgd291bGQgbGlrZSB0byBzZWUgYWxsIHRoZSBtbXUgbm90aWZpZXIgdXNl
IGluIGk5MTYgdXBkYXRlZCB0byB1c2UKPnRoZSBuZXcgQVBJcyA6KQo+Cj5QbGVhc2UgY2MgbWUg
d2hlbiB5b3UgcG9zdCBwYXRjaGVzIHVzaW5nIHRoZSBuZXcgQVBJcywgSSdkIGxpa2UgdG8gc2Vl
Cj5ob3cgdGhleSBhcmUgYmVpbmcgdXNlZC4KPgoKT2ssIHN1cmUsIHdpbGwgZG8uCgpUaGFua3Ms
Ck5pcmFuamFuYQoKPlJlZ2FyZHMsCj5KYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
