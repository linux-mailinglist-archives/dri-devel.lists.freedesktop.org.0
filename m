Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1198F10F158
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 21:11:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F008E6E328;
	Mon,  2 Dec 2019 20:11:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596976E31C;
 Mon,  2 Dec 2019 20:11:13 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Dec 2019 12:11:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,270,1571727600"; d="scan'208";a="235607868"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by fmsmga004.fm.intel.com with ESMTP; 02 Dec 2019 12:11:12 -0800
Date: Mon, 2 Dec 2019 11:59:54 -0800
From: Niranjan Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC 03/13] drm/i915/svm: Runtime (RT) allocator
 support
Message-ID: <20191202195953.GN14488@nvishwa1-DESK.sc.intel.com>
References: <20191122205734.15925-1-niranjana.vishwanathapura@intel.com>
 <20191122205734.15925-4-niranjana.vishwanathapura@intel.com>
 <157467597709.2314.3239893018411484277@skylake-alporthouse-com>
 <20191125164057.GH14488@nvishwa1-DESK.sc.intel.com>
 <157477677170.23952.10779405590776070095@jlahtine-desk.ger.corp.intel.com>
 <20191127192356.GJ14488@nvishwa1-DESK.sc.intel.com>
 <157494314994.8315.15687965334916976680@jlahtine-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157494314994.8315.15687965334916976680@jlahtine-desk.ger.corp.intel.com>
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

T24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgMDI6MTI6MzBQTSArMDIwMCwgSm9vbmFzIExhaHRpbmVu
IHdyb3RlOgo+UXVvdGluZyBOaXJhbmphbiBWaXNod2FuYXRoYXB1cmEgKDIwMTktMTEtMjcgMjE6
MjM6NTYpCj4+ID5XZSBzaG91bGQgdHJ5IHRvIGhhdmUgdGhlIHVBUEkgYXMgZmluYWwgYXMgZWFy
bHkgYXMgcG9zc2libGUuIFRoZQo+PiA+Y2hhbmdlIHByb2Nlc3MgaXMgaGFyZGVyIHRoZSBsYXRl
ciBpdCBpcyBkb25lLCBldmVuIGZvciBSRkMgOikKPj4gPgo+PiA+T24gdGhlIHNhbWUgbm90ZSwg
SSdtIGluY2xpbmVkIHRvIGhhdmUgSTkxNV9TVk1fTUlHUkFURSBjYWxsZWQKPj4gPkk5MTVfR0VN
X1ZNX1BSRUZBVUxUIGZyb20gdGhlIHN0YXJ0LCBhcyBJIGFscmVhZHkgaGF2ZSBnb3Qgc29tZQo+
PiA+Y29uZnVzZWQgcXVlc3Rpb25zIGZyb20gZm9sa3Mgd2hvIG1peCBpdCB3aXRoIG1lbW9yeSBw
cmVzc3VyZQo+PiA+aW5pdGlhdGVkIG1pZ3JhdGlvbi4gQW5kIGl0J3MgaW5oZXJlbnRseSByYWN5
IGFzIGFueWJvZHkgY291bGQKPj4gPnJhY2Ugd2l0aCBpdCwgc28gUFJFRkFVTFQgd291bGQgZ2l2
ZSBhbiBpbXByZXNzaW9uIG9mIHRoYXQuCj4+ID4KPj4gPkFuZCBJIHRoaW5rIEk5MTVfR0VNX1ZN
X1BSRUZBVUxUIHdvdWxkIGJlIGEgZ2VuZXJhbGx5IGFwcGxpY2FibGUKPj4gPmZ1bmN0aW9uLCBq
dXN0IGxpa2UgSTkxNV9HRU1fVk1fQklORC4gU28gd2Ugc2hvdWxkIHVzZSBhIHN0cnVjdAo+PiA+
bWVtYmVyIG5hbWVzIHRoYXQgYXJlIGNsb3NlIHRvIEk5MTVfR0VNX1ZNX0JJTkQuCj4+ID4KPj4g
PkJldHRlciBpZGVhcyBmb3IgbmFtZSB0byBlbXBoYXNpcyB0aGUgbmF0dXJlIG9mIHdoYXQgaXMg
YmVpbmcKPj4gPmRvbmU/IEk5MTVfR0VNX1ZNX0ZBVUxUL0k5MTVfR0VNX1ZNX3tNLH1BRFZJQ0Uu
Li4KPj4gPgo+Pgo+PiBUaG91Z2ggY3VycmVudCBwYXRjaHNldCBvbmx5IHN1cHBvcnRzIG1pZ3Jh
dGluZyBwYWdlcyBmcm9tCj4+IGhvc3QgdG8gZGV2aWNlIG1lbW9yeSwgSSBpbnRlbmQgdG8gc3Vw
cG9ydCBtaWdyYXRpbmcgZnJvbSBkZXZpY2UKPj4gdG8gaG9zdCBtZW1vcnkgYXMgd2VsbCB3aXRo
IHNhbWUgaW9jdGwuIFVzZXIgd291bGQgd2FudCB0aGF0Lgo+PiBOb3Qgc3VyZSB3aGF0IHdvdWxk
IGJlIGEgZ29vZCBuYW1lIHRoZW4sIF9NSUdSQVRFL19QUkVGRVRDSC9fTU9WRT8KPgo+SW4gdGhl
IEhNTSBjb25jZXB0IHRoZSBDUFUgYWNjZXNzIHdvdWxkIHRyaWdnZXIgZmF1bHQsIGFuZCB0cmln
Z2VyCj50aGUgdHJhbnNpdGlvbiwgd291bGRuJ3QgaXQ/IEJ1dCB5b3UncmUgY29ycmVjdCB0aGF0
IGl0IGlzIGtpbmQgb2YKPnRpZWQgdG8gdGhlIEhNTSBjb25jZXB0LCBhbmQgbWF5IGJlIGNvbmZ1
c2luZyBmb3IgQk9zLgo+CgpZZXMgaXQgZG9lcy4gQnV0IEkgdGhpbmsgd2Ugc2hvdWxkIGdpdmUg
dGhlIHVzZXIgbWVjaGFuaXNtIHRvIGV4cGxpY2l0bHkKbWlncmF0ZS9wcmVmZXRjaCBpdCBiYWNr
IHRvIHN5c3RlbSBtZW1vcnkuCgo+X1BSRUZFVENIIGlzIGEgZ29vZCBzdWdnZXN0aW9uIGZvciB0
aGUgdGVybSwgd2hpY2ggbGVhZCB0bwo+ZGlzY3Vzc2lvbiB0byBhdm9pZCBleHBsb3Npb24gb2Yg
SU9DVExzLCBDaHJpcyBzdWdnZXN0ZWQKPmNvbnNvbGlkYXRpb24sIG1heWJlIHdlIHNob3VsZCBo
YXZlIEk5MTVfR0VNX1ZNX3tNLH1BRFZJU0U/Cj4KPklmIHdlJ3JlIGxvb2tpbmcgYXQgY29ubmVj
dGlvbnMgdG8gZmFkdmlzZSgyKSwgd2UncmUgYmFzaWNhbGx5Cj50YWxraW5nIGFib3V0IGVxdWl2
YWxlbnQgb2YgRkFEVl9XSUxMTkVFRC4gVGhhdCBjb25jZXB0IHdvdWxkCj5iZSBxdWl0ZSBmYW1p
bGlhciB0byB1c2Vycy4gR0VNX1ZNX3tNLH1BRFZJU0Ugd2l0aCBXSUxMTkVFRAo+YW5kIGV4cGxp
Y2l0bHkgcGFzc2luZyB0aGUgbWVtb3J5IHJlZ2lvbj8gQmVjYXVzZSB3ZSBjYW4ndCBkZWNpcGhl
cgo+dGhhdCBmcm9tIHRoZSBydW5uaW5nIHRocmVhZCBsaWtlIENQVS4KPgo+VGhvdWdodHM/CgpZ
YWggaXQgaXMgY2xvc2VyIHRvIG1iaW5kIChpbnN0ZWFkIG9mIG5vZGVtYXNrLCB3ZSBzcGVjaWZ5
IG1lbW9yeSByZWdpb24vcykuClNvLCBJOTE1X0dFTV9WTV9NQklORD8gSSBhbSBvayB3aXRoIF9Q
UkVGRVRDSCBhbHNvLgoKPgo+PiBBbHNvLCBtaWdyYXRpbmcgZ2VtIG9iamVjdHMgaXMgY3VycmVu
dGx5IGhhbmRsZWQgYnkgc2VwYXJhdGUgaW9jdGwKPj4gd2hpY2ggaXMgcGFydCBvZiBMTUVNIHBh
dGNoIHNlcmllcy4gSSBhbSBvcGVuIHRvIG1lcmdpbmcgdGhlc2UKPj4gaW9jdGxzIHRvZ2V0aGVy
IChzaW1pbGFydCB0byBWTV9CSU5EKSBpbnRvIGEgc2luZ2xlIE1JR1JBVEUgaW9jdGwuCj4KPlRo
ZSBJT0NUTCBpbiB0aGUgTE1FTSBzZXJpZXMgaXMgYWJvdXQgc2V0dGluZyB0aGUgYWxsb3dlZCBi
YWNraW5nCj5zdG9yZSB0eXBlcyBvZiBhIEJPLCBub3QgYWJvdXQgdGhlIHJlc2lkZW5jeS4gVGhl
cmUgd2FzIHNvbWUKPmRpc2N1c3Npb24gYXJvdW5kIGRvaW5nIGV4cGxpY2l0IG1pZ3JhdGlvbnMg
YnkgY2hhbmdpbmcgdGhhdCBsaXN0Lgo+Q3VycmVudCB0aGlua2luZyBpcyB0aGF0IHdlIG9ubHkg
bmVlZCB0byBhbGxvdyBzZXR0aW5nIGl0IG9uY2UKPmF0IGNyZWF0aW9uLiBUaGF0IGFsc28gbWVh
bnMgaXQgbWlnaHQgYmUgY29udmVydGlibGUgdG8gY3JlYXRpb24KPnRpbWUgb25seSBwcm9wZXJ0
eS4KPgo+VGhhdCdkIGVsaW1pbmF0ZSB0aGUgbmVlZCBmb3IgQk8gZnJlZXplIElPQ1RMIHRoYXQg
d2FzIGRpc2N1c3NlZAo+d2l0aCBNZXNhIGZvbGtzLgo+CgpPay4KClRoYW5rcywKTmlyYW5qYW5h
Cgo+UmVnYXJkLCBKb29uYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
