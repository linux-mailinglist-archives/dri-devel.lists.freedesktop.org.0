Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFA6AF06D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 19:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819906E948;
	Tue, 10 Sep 2019 17:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E72C6E039;
 Tue, 10 Sep 2019 17:25:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A2684AE2F;
 Tue, 10 Sep 2019 17:25:54 +0000 (UTC)
Date: Tue, 10 Sep 2019 19:25:53 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH RFC v4 00/16] new cgroup controller for gpu/drm subsystem
Message-ID: <20190910172553.GA4023@dhcp22.suse.cz>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190831042857.GD2263813@devbig004.ftw2.facebook.com>
 <20190903075550.GJ2112@phenom.ffwll.local>
 <20190903185013.GI2263813@devbig004.ftw2.facebook.com>
 <CAKMK7uE5Bj-3cJH895iqnLpwUV+GBDM1Y=n4Z4A3xervMdJKXg@mail.gmail.com>
 <20190906152320.GM2263813@devbig004.ftw2.facebook.com>
 <CAKMK7uEXP7XLFB2aFU6+E0TH_DepFRkfCoKoHwkXtjZRDyhHig@mail.gmail.com>
 <20190906154539.GP2263813@devbig004.ftw2.facebook.com>
 <20190910115448.GT2063@dhcp22.suse.cz>
 <20190910160329.GR2263813@devbig004.ftw2.facebook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190910160329.GR2263813@devbig004.ftw2.facebook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "Greathouse, Joseph" <joseph.greathouse@amd.com>,
 Kenny Ho <Kenny.Ho@amd.com>, "Kuehling, Felix" <felix.kuehling@amd.com>,
 jsparks@cray.com, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 lkaplan@cray.com, Kenny Ho <y2kenny@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlIDEwLTA5LTE5IDA5OjAzOjI5LCBUZWp1biBIZW8gd3JvdGU6Cj4gSGVsbG8sIE1pY2hh
bC4KPiAKPiBPbiBUdWUsIFNlcCAxMCwgMjAxOSBhdCAwMTo1NDo0OFBNICswMjAwLCBNaWNoYWwg
SG9ja28gd3JvdGU6Cj4gPiA+IFNvLCB3aGlsZSBpdCdkIGdyZWF0IHRvIGhhdmUgc2hyaW5rZXJz
IGluIHRoZSBsb25nZXIgdGVybSwgaXQncyBub3QgYQo+ID4gPiBzdHJpY3QgcmVxdWlyZW1lbnQg
dG8gYmUgYWNjb3VudGVkIGluIG1lbWNnLiAgSXQgYWxyZWFkeSBhY2NvdW50cyBhCj4gPiA+IGxv
dCBvZiBtZW1vcnkgd2hpY2ggaXNuJ3QgcmVjbGFpbWFibGUgKGEgbG90IG9mIHNsYWJzIGFuZCBz
b2NrZXQKPiA+ID4gYnVmZmVyKS4KPiA+IAo+ID4gWWVhaCwgaGF2aW5nIGEgc2hyaW5rZXIgaXMg
cHJlZmVycmVkIGJ1dCB0aGUgbWVtb3J5IHNob3VsZCBiZXR0ZXIgYmUKPiA+IHJlY2xhaW1hYmxl
IGluIHNvbWUgZm9ybS4gSWYgbm90IGJ5IGFueSBvdGhlciBtZWFucyB0aGVuIGF0IGxlYXN0IGJv
dW5kCj4gPiB0byBhIHVzZXIgcHJvY2VzcyBjb250ZXh0IHNvIHRoYXQgaXQgZ29lcyBhd2F5IHdp
dGggYSB0YXNrIGJlaW5nIGtpbGxlZAo+ID4gYnkgdGhlIE9PTSBraWxsZXIuIElmIHRoYXQgaXMg
bm90IHRoZSBjYXNlIHRoZW4gd2UgY2Fubm90IHJlYWxseSBjaGFyZ2UKPiA+IGl0IGJlY2F1c2Ug
dGhlbiB0aGUgbWVtY2cgY29udHJvbGxlciBpcyBvZiBubyB1c2UuIFdlIGNhbiB0b2xlcmF0ZSBp
dCB0bwo+ID4gc29tZSBkZWdyZWUgaWYgdGhlIGFtb3VudCBvZiBtZW1vcnkgY2hhcmdlZCBsaWtl
IHRoYXQgaXMgbmVnbGlnaWJsZSB0bwo+ID4gdGhlIG92ZXJhbGwgc2l6ZS4gQnV0IGZyb20gdGhl
IGRpc2N1c3Npb24gaXQgc2VlbXMgdGhhdCB0aGVzZSBidWZmZXJzCj4gPiBhcmUgcmVhbGx5IGxh
cmdlLgo+IAo+IFllYWgsIG9vbSBraWxscyBzaG91bGQgYmUgYWJsZSB0byByZWR1Y2UgdGhlIHVz
YWdlOyBob3dldmVyLCBwbGVhc2UKPiBub3RlIHRoYXQgdG1wZnMsIGFtb25nIG90aGVyIHRoaW5n
cywgY2FuIGFscmVhZHkgZXNjYXBlIHRoaXMKPiByZXN0cmljdGlvbiBhbmQgd2UgY2FuIGhhdmUg
Y2dyb3VwcyB3aGljaCBhcmUgb3ZlciBtYXggYW5kIGVtcHR5Lgo+IEl0J3Mgb2J2aW91c2x5IG5v
dCBpZGVhbCBidXQgdGhlIHN5c3RlbSBkb2Vzbid0IG1lbHQgZG93biBmcm9tIGl0Cj4gZWl0aGVy
LgoKUmlnaHQsIGFuZCB0aGF0IGlzIGEgcmVhc29uIHdoeSBhbiBhY2Nlc3MgdG8gdG1wZnMgc2hv
dWxkIGJlIHJlc3RyaWN0ZWQKd2hlbiBjb250YWluaW5nIGEgd29ya2xvYWQgYnkgbWVtY2cuIE15
IHVuZGVyc3RhbmRpbmcgb2YgdGhpcyBwYXJ0aWN1bGFyCmZlYXR1cmUgaXMgdGhhdCBtZW1jZyBz
aG91bGQgYmUgdGhlIHByaW1hcnkgY29udGFpbm1lbnQgbWV0aG9kIGFuZAp0aGF0J3Mgd2h5IEkg
YnJvdWdodCB0aGlzIHVwLgoKLS0gCk1pY2hhbCBIb2NrbwpTVVNFIExhYnMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
