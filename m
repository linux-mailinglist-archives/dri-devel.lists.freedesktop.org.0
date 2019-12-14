Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC20711F167
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 11:32:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EAD6E0F4;
	Sat, 14 Dec 2019 10:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95DA6E029;
 Sat, 14 Dec 2019 10:32:02 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19576956-1500050 for multiple; Sat, 14 Dec 2019 10:31:39 +0000
MIME-Version: 1.0
To: Jason Ekstrand <jason@jlekstrand.net>,
 Niranjan Vishwanathapura <niranjana.vishwanathapura@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <CAOFGe97yh5CGTwoP-f3wRGWoTLuWMvMwYFc5Hx3KOkT9XkOxkw@mail.gmail.com>
References: <20191213215614.24558-1-niranjana.vishwanathapura@intel.com>
 <20191213215614.24558-3-niranjana.vishwanathapura@intel.com>
 <CAOFGe95rC8A4SuwWtd1tbikw8HGm-TU52_O8iBSJKpDyY0gWNw@mail.gmail.com>
 <20191213231322.GS14488@nvishwa1-DESK.sc.intel.com>
 <CAOFGe97yh5CGTwoP-f3wRGWoTLuWMvMwYFc5Hx3KOkT9XkOxkw@mail.gmail.com>
Message-ID: <157631949753.7535.12359359451927943176@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [RFC v2 02/12] drm/i915/svm: Runtime (RT) allocator
 support
Date: Sat, 14 Dec 2019 10:31:37 +0000
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
Cc: "Graunke, Kenneth W" <kenneth.w.graunke@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>, sanjay.k.kumar@intel.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason.ekstrand@intel.com>, dave.hansen@intel.com,
 jglisse@redhat.com, jgg@mellanox.com, Daniel Vetter <daniel.vetter@intel.com>,
 dan.j.williams@intel.com, ira.weiny@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBKYXNvbiBFa3N0cmFuZCAoMjAxOS0xMi0xNCAwMDozNjoxOSkKPiBPbiBGcmksIERl
YyAxMywgMjAxOSBhdCA1OjI0IFBNIE5pcmFuamFuIFZpc2h3YW5hdGhhcHVyYSA8Cj4gbmlyYW5q
YW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+IHdyb3RlOgo+IAo+ICAgICBPbiBGcmksIERl
YyAxMywgMjAxOSBhdCAwNDo1ODo0MlBNIC0wNjAwLCBKYXNvbiBFa3N0cmFuZCB3cm90ZToKPiAg
ICAgPgo+ICAgICA+wqAgwqAgwqArLyoqCj4gICAgID7CoCDCoCDCoCsgKiBzdHJ1Y3QgZHJtX2k5
MTVfZ2VtX3ZtX2JpbmQKPiAgICAgPsKgIMKgIMKgKyAqCj4gICAgID7CoCDCoCDCoCsgKiBCaW5k
IGFuIG9iamVjdCBpbiBhIHZtJ3MgcGFnZSB0YWJsZS4KPiAgICAgPgo+ICAgICA+wqAgwqBGaXJz
dCBvZmYsIHRoaXMgaXMgc29tZXRoaW5nIEkndmUgd2FudGVkIGZvciBhIHdoaWxlIGZvciBWdWxr
YW4sIGl0J3MKPiAgICAganVzdAo+ICAgICA+wqAgwqBuZXZlciBtYWRlIGl0cyB3YXkgaGlnaCBl
bm91Z2ggdXAgdGhlIHByaW9yaXR5IGxpc3QuwqAgSG93ZXZlciwgaXQncwo+ICAgICBnb2luZwo+
ICAgICA+wqAgwqB0byBoYXZlIHRvIGNvbWUgb25lIHdheSBvciBhbm90aGVyIHNvb24uwqAgSSdt
IGdsYWQgdG8gc2VlIGtlcm5lbCBBUEkKPiAgICAgZm9yCj4gICAgID7CoCDCoHRoaXMgYmVpbmcg
cHJvcG9zZWQuCj4gICAgID7CoCDCoEkgZG8sIGhvd2V2ZXIsIGhhdmUgYSBmZXcgaGlnaC1sZXZl
bCBjb21tZW50cy9xdWVzdGlvbnMgYWJvdXQgdGhlIEFQSToKPiAgICAgPsKgIMKgIDEuIEluIG9y
ZGVyIHRvIGJlIHVzZWZ1bCBmb3Igc3BhcnNlIG1lbW9yeSBzdXBwb3J0LCB0aGUgQVBJIGhhcyB0
byBnbwo+ICAgICB0aGUKPiAgICAgPsKgIMKgb3RoZXIgd2F5IGFyb3VuZCBzbyB0aGF0IGl0IGJp
bmRzIGEgVkEgcmFuZ2UgdG8gYSByYW5nZSB3aXRoaW4gdGhlIEJPLsKgCj4gICAgIEl0Cj4gICAg
ID7CoCDCoGFsc28gbmVlZHMgdG8gYmUgYWJsZSB0byBoYW5kbGUgb3ZlcmxhcHBpbmcgd2hlcmUg
dHdvIGRpZmZlcmVudCBWQQo+ICAgICByYW5nZXMKPiAgICAgPsKgIMKgbWF5IG1hcCB0byB0aGUg
c2FtZSB1bmRlcmx5aW5nIGJ5dGVzIGluIHRoZSBCTy7CoCBUaGlzIGxpa2VseSBtZWFucyB0aGF0
Cj4gICAgID7CoCDCoHVuYmluZCBuZWVkcyB0byBhbHNvIHRha2UgYSBWQSByYW5nZSBhbmQgb25s
eSB1bmJpbmQgdGhhdCByYW5nZS4KPiAgICAgPsKgIMKgIDIuIElmIHRoaXMgaXMgZ29pbmcgdG8g
YmUgdXNlZnVsIGZvciBtYW5hZ2luZyBHTCdzIGFkZHJlc3Mgc3BhY2Ugd2hlcmUKPiAgICAgd2UK
PiAgICAgPsKgIMKgaGF2ZSBsb3RzIG9mIEJPcywgd2UgcHJvYmFibHkgd2FudCBpdCB0byB0YWtl
IGEgbGlzdCBvZiByYW5nZXMgc28gd2UKPiAgICAgPsKgIMKgYXJlbid0IG1ha2luZyBvbmUgaW9j
dGwgZm9yIGVhY2ggdGhpbmcgd2Ugd2FudCB0byBiaW5kLgo+IAo+ICAgICBIaSBKYXNvbiwKPiAK
PiAgICAgWWFoLCBzb21lIG9mIHRoZXNlIHJlcXVpcmVtZW50cyBjYW1lIHVwLgo+IAo+IMKgCj4g
WWVzLCBJIGhhdmUgcmFpc2VkIHRoZW0gZXZlcnkgc2luZ2xlIHRpbWUgYW4gQVBJIGxpa2UgdGhp
cyBoYXMgY29tZSBhY3Jvc3MgbXkKPiBlLW1haWwgaW5ib3ggZm9yIHllYXJzIGFuZCB0aGV5IGNv
bnRpbnVlIHRvIGdldCBpZ25vcmVkLsKgIFdoeSBhcmUgd2UgbGFuZGluZyBhbgo+IEFQSSB0aGF0
IHdlIGtub3cgaXNuJ3QgdGhlIEFQSSB3ZSB3YW50IGVzcGVjaWFsbHkgd2hlbiBpdCdzIHByZXR0
eSBvYnZpb3VzCj4gcm91Z2hseSB3aGF0IHRoZSBBUEkgd2Ugd2FudCBpcz/CoCBJdCBtYXkgYmUg
bGVzcyB0aW1lIGluIHRoZSBzaG9ydCB0ZXJtLCBidXQKPiBsb25nLXRlcm0gaXQgbWVhbnMgdHdv
IGlvY3RscyBhbmQgdHdvIGltcGxlbWVudGF0aW9ucyBpbiBpOTE1LCBJR1QgdGVzdHMgZm9yCj4g
Ym90aCBjb2RlIHBhdGhzLCBhbmQgY29kZSBpbiBhbGwgVU1EcyB0byBjYWxsIG9uZSBvciB0aGUg
b3RoZXIgZGVwZW5kaW5nIG9uCj4gd2hhdCBrZXJuZWwgeW91J3JlIHJ1bm5pbmcgb24sIGFuZCB3
ZSBoYXZlIHRvIG1haW50YWluIGFsbCB0aGF0IGNvZGUgZ29pbmcKPiBmb3J3YXJkIGZvcmV2ZXIu
wqAgU3VyZSwgdGhhdCdzIGEgcHJpY2Ugd2UgcGF5IHRvZGF5IGZvciBhIHZhcmlldHkgb2YgdGhp
bmdzIGJ1dAo+IHRoYXQncyBiZWNhdXNlIHRoZXkgYWxsIHNlZW1lZCBsaWtlIHRoZSByaWdodCB0
aGluZyBhdCB0aGUgdGltZS7CoCBMYW5kaW5nIHRoZQo+IHdyb25nIEFQSSB3aGVuIHdlIGtub3cg
aXQncyB0aGUgd3JvbmcgQVBJIHNlZW1zIGZvb2xpc2guCgpFeGFjdGx5LiBUaGlzIGlzIG5vdCBl
dmVuIGNsb3NlIHRvIHRoZSB1QVBJIHdlIG5lZWQuIFJlcG9zdGluZyBhbiBSRkMKd2l0aG91dCB0
YWtpbmcgaW4gdGhlIGNvbmNlcm5zIGxhc3QgdGltZSAob3IgdGhlIHRpbWUgYmVmb3JlIHRoYXQs
IG9yCnRoZSB0aW1lIGJlZm9yZSB0aGF0Li4uKSBzdWdnZXN0cyB0aGF0IHlvdSBhcmVuJ3QgcmVh
bGx5IHJlcXVlc3RpbmcgZm9yCmNvbW1lbnRzIGF0IGFsbC4KLUNocmlzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
