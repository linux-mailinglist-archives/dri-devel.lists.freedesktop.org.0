Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DC410C868
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 13:12:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C68F898C7;
	Thu, 28 Nov 2019 12:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08FD896E7;
 Thu, 28 Nov 2019 12:12:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Nov 2019 04:12:36 -0800
X-IronPort-AV: E=Sophos;i="5.69,253,1571727600"; d="scan'208";a="203418629"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.21.120])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Nov 2019 04:12:32 -0800
MIME-Version: 1.0
To: Niranjan Vishwanathapura <niranjana.vishwanathapura@intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
In-Reply-To: <20191127192356.GJ14488@nvishwa1-DESK.sc.intel.com>
References: <20191122205734.15925-1-niranjana.vishwanathapura@intel.com>
 <20191122205734.15925-4-niranjana.vishwanathapura@intel.com>
 <157467597709.2314.3239893018411484277@skylake-alporthouse-com>
 <20191125164057.GH14488@nvishwa1-DESK.sc.intel.com>
 <157477677170.23952.10779405590776070095@jlahtine-desk.ger.corp.intel.com>
 <20191127192356.GJ14488@nvishwa1-DESK.sc.intel.com>
Message-ID: <157494314994.8315.15687965334916976680@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.7
Subject: Re: [Intel-gfx] [RFC 03/13] drm/i915/svm: Runtime (RT) allocator
 support
Date: Thu, 28 Nov 2019 14:12:30 +0200
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBOaXJhbmphbiBWaXNod2FuYXRoYXB1cmEgKDIwMTktMTEtMjcgMjE6MjM6NTYpCj4g
PldlIHNob3VsZCB0cnkgdG8gaGF2ZSB0aGUgdUFQSSBhcyBmaW5hbCBhcyBlYXJseSBhcyBwb3Nz
aWJsZS4gVGhlCj4gPmNoYW5nZSBwcm9jZXNzIGlzIGhhcmRlciB0aGUgbGF0ZXIgaXQgaXMgZG9u
ZSwgZXZlbiBmb3IgUkZDIDopCj4gPgo+ID5PbiB0aGUgc2FtZSBub3RlLCBJJ20gaW5jbGluZWQg
dG8gaGF2ZSBJOTE1X1NWTV9NSUdSQVRFIGNhbGxlZAo+ID5JOTE1X0dFTV9WTV9QUkVGQVVMVCBm
cm9tIHRoZSBzdGFydCwgYXMgSSBhbHJlYWR5IGhhdmUgZ290IHNvbWUKPiA+Y29uZnVzZWQgcXVl
c3Rpb25zIGZyb20gZm9sa3Mgd2hvIG1peCBpdCB3aXRoIG1lbW9yeSBwcmVzc3VyZQo+ID5pbml0
aWF0ZWQgbWlncmF0aW9uLiBBbmQgaXQncyBpbmhlcmVudGx5IHJhY3kgYXMgYW55Ym9keSBjb3Vs
ZAo+ID5yYWNlIHdpdGggaXQsIHNvIFBSRUZBVUxUIHdvdWxkIGdpdmUgYW4gaW1wcmVzc2lvbiBv
ZiB0aGF0Lgo+ID4KPiA+QW5kIEkgdGhpbmsgSTkxNV9HRU1fVk1fUFJFRkFVTFQgd291bGQgYmUg
YSBnZW5lcmFsbHkgYXBwbGljYWJsZQo+ID5mdW5jdGlvbiwganVzdCBsaWtlIEk5MTVfR0VNX1ZN
X0JJTkQuIFNvIHdlIHNob3VsZCB1c2UgYSBzdHJ1Y3QKPiA+bWVtYmVyIG5hbWVzIHRoYXQgYXJl
IGNsb3NlIHRvIEk5MTVfR0VNX1ZNX0JJTkQuCj4gPgo+ID5CZXR0ZXIgaWRlYXMgZm9yIG5hbWUg
dG8gZW1waGFzaXMgdGhlIG5hdHVyZSBvZiB3aGF0IGlzIGJlaW5nCj4gPmRvbmU/IEk5MTVfR0VN
X1ZNX0ZBVUxUL0k5MTVfR0VNX1ZNX3tNLH1BRFZJQ0UuLi4KPiA+Cj4gCj4gVGhvdWdoIGN1cnJl
bnQgcGF0Y2hzZXQgb25seSBzdXBwb3J0cyBtaWdyYXRpbmcgcGFnZXMgZnJvbQo+IGhvc3QgdG8g
ZGV2aWNlIG1lbW9yeSwgSSBpbnRlbmQgdG8gc3VwcG9ydCBtaWdyYXRpbmcgZnJvbSBkZXZpY2UK
PiB0byBob3N0IG1lbW9yeSBhcyB3ZWxsIHdpdGggc2FtZSBpb2N0bC4gVXNlciB3b3VsZCB3YW50
IHRoYXQuCj4gTm90IHN1cmUgd2hhdCB3b3VsZCBiZSBhIGdvb2QgbmFtZSB0aGVuLCBfTUlHUkFU
RS9fUFJFRkVUQ0gvX01PVkU/CgpJbiB0aGUgSE1NIGNvbmNlcHQgdGhlIENQVSBhY2Nlc3Mgd291
bGQgdHJpZ2dlciBmYXVsdCwgYW5kIHRyaWdnZXIKdGhlIHRyYW5zaXRpb24sIHdvdWxkbid0IGl0
PyBCdXQgeW91J3JlIGNvcnJlY3QgdGhhdCBpdCBpcyBraW5kIG9mCnRpZWQgdG8gdGhlIEhNTSBj
b25jZXB0LCBhbmQgbWF5IGJlIGNvbmZ1c2luZyBmb3IgQk9zLgoKX1BSRUZFVENIIGlzIGEgZ29v
ZCBzdWdnZXN0aW9uIGZvciB0aGUgdGVybSwgd2hpY2ggbGVhZCB0bwpkaXNjdXNzaW9uIHRvIGF2
b2lkIGV4cGxvc2lvbiBvZiBJT0NUTHMsIENocmlzIHN1Z2dlc3RlZApjb25zb2xpZGF0aW9uLCBt
YXliZSB3ZSBzaG91bGQgaGF2ZSBJOTE1X0dFTV9WTV97TSx9QURWSVNFPwoKSWYgd2UncmUgbG9v
a2luZyBhdCBjb25uZWN0aW9ucyB0byBmYWR2aXNlKDIpLCB3ZSdyZSBiYXNpY2FsbHkKdGFsa2lu
ZyBhYm91dCBlcXVpdmFsZW50IG9mIEZBRFZfV0lMTE5FRUQuIFRoYXQgY29uY2VwdCB3b3VsZApi
ZSBxdWl0ZSBmYW1pbGlhciB0byB1c2Vycy4gR0VNX1ZNX3tNLH1BRFZJU0Ugd2l0aCBXSUxMTkVF
RAphbmQgZXhwbGljaXRseSBwYXNzaW5nIHRoZSBtZW1vcnkgcmVnaW9uPyBCZWNhdXNlIHdlIGNh
bid0IGRlY2lwaGVyCnRoYXQgZnJvbSB0aGUgcnVubmluZyB0aHJlYWQgbGlrZSBDUFUuCgpUaG91
Z2h0cz8KCj4gQWxzbywgbWlncmF0aW5nIGdlbSBvYmplY3RzIGlzIGN1cnJlbnRseSBoYW5kbGVk
IGJ5IHNlcGFyYXRlIGlvY3RsCj4gd2hpY2ggaXMgcGFydCBvZiBMTUVNIHBhdGNoIHNlcmllcy4g
SSBhbSBvcGVuIHRvIG1lcmdpbmcgdGhlc2UKPiBpb2N0bHMgdG9nZXRoZXIgKHNpbWlsYXJ0IHRv
IFZNX0JJTkQpIGludG8gYSBzaW5nbGUgTUlHUkFURSBpb2N0bC4KClRoZSBJT0NUTCBpbiB0aGUg
TE1FTSBzZXJpZXMgaXMgYWJvdXQgc2V0dGluZyB0aGUgYWxsb3dlZCBiYWNraW5nCnN0b3JlIHR5
cGVzIG9mIGEgQk8sIG5vdCBhYm91dCB0aGUgcmVzaWRlbmN5LiBUaGVyZSB3YXMgc29tZQpkaXNj
dXNzaW9uIGFyb3VuZCBkb2luZyBleHBsaWNpdCBtaWdyYXRpb25zIGJ5IGNoYW5naW5nIHRoYXQg
bGlzdC4KQ3VycmVudCB0aGlua2luZyBpcyB0aGF0IHdlIG9ubHkgbmVlZCB0byBhbGxvdyBzZXR0
aW5nIGl0IG9uY2UKYXQgY3JlYXRpb24uIFRoYXQgYWxzbyBtZWFucyBpdCBtaWdodCBiZSBjb252
ZXJ0aWJsZSB0byBjcmVhdGlvbgp0aW1lIG9ubHkgcHJvcGVydHkuCgpUaGF0J2QgZWxpbWluYXRl
IHRoZSBuZWVkIGZvciBCTyBmcmVlemUgSU9DVEwgdGhhdCB3YXMgZGlzY3Vzc2VkCndpdGggTWVz
YSBmb2xrcy4KClJlZ2FyZCwgSm9vbmFzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
