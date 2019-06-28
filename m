Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EAA58F96
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 03:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D788A6E85A;
	Fri, 28 Jun 2019 01:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577546E85A;
 Fri, 28 Jun 2019 01:16:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jun 2019 18:16:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,425,1557212400"; d="scan'208";a="361358277"
Received: from brianwel-mobl1.amr.corp.intel.com (HELO [10.255.82.54])
 ([10.255.82.54])
 by fmsmga006.fm.intel.com with ESMTP; 27 Jun 2019 18:16:48 -0700
Subject: Re: [RFC PATCH v3 07/11] drm, cgroup: Add TTM buffer allocation stats
To: Daniel Vetter <daniel@ffwll.ch>, Kenny Ho <y2kenny@gmail.com>
References: <20190626150522.11618-1-Kenny.Ho@amd.com>
 <20190626150522.11618-8-Kenny.Ho@amd.com>
 <20190626161254.GS12905@phenom.ffwll.local>
 <CAOWid-f3kKnM=4oC5Bba5WW5WNV2MH5PvVamrhO6LBr5ydPJQg@mail.gmail.com>
 <20190627060113.GC12905@phenom.ffwll.local>
From: "Welty, Brian" <brian.welty@intel.com>
Message-ID: <01a6efa8-802c-b8b1-931e-4f0c1c63beca@intel.com>
Date: Thu, 27 Jun 2019 18:16:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <20190627060113.GC12905@phenom.ffwll.local>
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 jsparks@cray.com, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 lkaplan@cray.com, Alex Deucher <alexander.deucher@amd.com>, kraxel@redhat.com,
 joseph.greathouse@amd.com, Tejun Heo <tj@kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMjYvMjAxOSAxMTowMSBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBUaHUsIEp1
biAyNywgMjAxOSBhdCAxMjowNjoxM0FNIC0wNDAwLCBLZW5ueSBIbyB3cm90ZToKPj4gT24gV2Vk
LCBKdW4gMjYsIDIwMTkgYXQgMTI6MTIgUE0gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
PiB3cm90ZToKPj4+Cj4+PiBJIHRoaW5rIHdpdGggYWxsIHRoZSB0dG0gcmVmYWN0b3JpbmcgZ29p
bmcgb24gSSB0aGluayB3ZSBuZWVkIHRvIGRlLXR0bQo+Pj4gdGhlIGludGVyZmFjZSBmdW5jdGlv
bnMgaGVyZSBhIGJpdC4gV2l0aCBHZXJkIEhvZmZtYW5zIHNlcmllcyB5b3UgY2FuIGp1c3QKPj4+
IHVzZSBhIGdlbV9ibyBwb2ludGVyIGhlcmUsIHNvIHdoYXQncyBsZWZ0IHRvIGRvIGlzIGhhdmUg
c29tZSBleHRyYWN0ZWQKPj4+IHN0cnVjdHVyZSBmb3IgdHJhY2tpbmcgbWVtb3J5IHR5cGVzLiBJ
IHRoaW5rIEJyaWFuIFdlbHR5IGhhcyBzb21lIGlkZWFzCj4+PiBmb3IgdGhpcywgZXZlbiBpbiBw
YXRjaCBmb3JtLiBXb3VsZCBiZSBnb29kIHRvIGtlZXAgaGltIG9uIGNjIGF0IGxlYXN0IGZvcgo+
Pj4gdGhlIG5leHQgdmVyc2lvbi4gV2UnZCBuZWVkIHRvIGV4cGxpY2l0bHkgaGFuZCBpbiB0aGUg
dHRtX21lbV9yZWcgKG9yCj4+PiB3aGF0ZXZlciB0aGUgc3BlY2lmaWMgdGhpbmcgaXMgZ29pbmcg
dG8gYmUpLgo+Pgo+PiBJIGFzc3VtZSBHZXJkIEhvZmZtYW4ncyBzZXJpZXMgeW91IGFyZSByZWZl
cnJpbmcgdG8gaXMgdGhpcyBvbmU/Cj4+IGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2Ry
aS1kZXZlbC9tc2cyMTUwNTYuaHRtbAo+IAo+IFRoZXJlJ3MgYSBuZXdlciBvbmUsIG11Y2ggbW9y
ZSBjb21wbGV0ZSwgYnV0IHllcyB0aGF0J3MgdGhlIHdvcmsuCj4gCj4+IEkgY2FuIGNlcnRhaW5s
eSBrZWVwIGFuIGV5ZSBvdXQgZm9yIEdlcmQncyByZWZhY3RvcmluZyB3aGlsZQo+PiByZWZhY3Rv
cmluZyBvdGhlciBwYXJ0cyBvZiB0aGlzIFJGQy4KPj4KPj4gSSBoYXZlIGFkZGVkIEJyaWFuIGFu
ZCBHZXJkIHRvIHRoZSB0aHJlYWQgZm9yIGF3YXJlbmVzcy4KPiAKPiBidHcganVzdCByZWFsaXpl
ZCB0aGF0IG1heWJlIGJ1aWxkaW5nIHRoZSBpbnRlcmZhY2VzIG9uIHRvcCBvZiB0dG1fbWVtX3Jl
Zwo+IGlzIG1heWJlIG5vdCB0aGUgYmVzdC4gVGhhdCdzIHdoYXQgeW91J3JlIHVzaW5nIHJpZ2h0
IG5vdywgYnV0IGluIGEgd2F5Cj4gdGhhdCdzIGp1c3QgdGhlIHR0bSBpbnRlcm5hbCBkZXRhaWwg
b2YgaG93IHRoZSBiYWNraW5nIHN0b3JhZ2UgaXMKPiBhbGxvY2F0ZWQuIEkgdGhpbmsgdGhlIHN0
cnVjdHVyZSB3ZSBuZWVkIHRvIGFic3RyYWN0IGF3YXkgaXMKPiB0dG1fbWVtX3R5cGVfbWFuYWdl
ciwgd2l0aG91dCBhbnkgb2YgdGhlIGFjdHVhbCBtYW5hZ2VtZW50IGRldGFpbHMuCj4gCgpBbnkg
ZGUtdHRtIHJlZmFjdG9yaW5nIHNob3VsZCBwcm9iYWJseSBub3Qgc3BhbSBhbGwgdGhlIGNncm91
cHMgZm9sa3MuClNvIEkgcmVtb3ZlZCBjZ3JvdXBzIGxpc3QuCgpBcyBEYW5pZWwgbWVudGlvbmVk
LCBzb21lIG9mIHVzIGFyZSBsb29raW5nIGF0IHBvc3NpYmxlIHJlZmFjdG9yaW5nIG9mIFRUTQpm
b3IgcmV1c2UgaW4gaTkxNSBkcml2ZXIuCkhlcmUgaXMgYSBicmllZiBzdW1tYXJ5IG9mIHNvbWUg
aWRlYXMgdG8gYmUgY29uc2lkZXJlZDoKCiAxKSByZWZhY3RvciBwYXJ0IG9mIHR0bV9tZW1fdHlw
ZV9tYW5hZ2VyIGludG8gYSBuZXcgZHJtX21lbV90eXBlX3JlZ2lvbi4KICAgIFJlYWxseSwgc2hv
dWxkIHRoZW4gbW92ZSB0aGUgYXJyYXkgZnJvbSB0dG1fYm9fZGV2aWNlLm1hbltdIGludG8gZHJt
X2RldmljZS4KCiAgICBSZWxldmFudCB0byBkcm1fY2dyb3VwLCB5b3UgY291bGQgdGhlbiBwZXJo
YXBzIGFjY2VzcyB0aGVzZSBzdGF0cyB0aHJvdWdoCiAgICBkcm1fZGV2aWNlIGFuZCBkb24ndCBu
ZWVkIHRoZSBtZW1fc3RhdHMgYXJyYXkgaW4gZHJtY2dycF9kZXZpY2VfcmVzb3VyY2UuCgogIDFh
KSAgZG9pbmcgdGhpcyByaWdodCBtZWFucyByZXBsYWNpbmcgVFRNX1BMX1hYWCBtZW1vcnkgdHlw
ZXMgd2l0aCBuZXcgRFJNCiAgICAgZGVmaW5lcy4gIEJ1dCBjb3VsZCBrZWVwIHRoZSBUVE0gb25l
cyBhcyByZWRlZmluaXRpb24gb2YgKG5ldykgRFJNIG9uZXMuCiAgICAgUHJvYmFibHkgdGhvc2Ug
cHJpdmF0ZSBvbmVzIChUVE1fUExfUFJJVikgbWFrZSB0aGlzIGRpZmZpY3VsdC4KCiAgQWxsIG9m
IHRoZSBhYm92ZSBjb3VsZCBiZSBldmVudHVhbGx5IGxldmVyYWdlZCBieSB0aGUgdnJhbSBzdXBw
b3J0IGJlaW5nCiAgaW1wbGVtZW50ZWQgbm93IGluIGk5MTUgZHJpdmVyLgogIAogIDIpIHJlZmFj
dG9yIHR0bV9tZW1fcmVnICsgdHRtX2J1c19wbGFjZW1lbnQgaW50byBzb21ldGhpbmcgZ2VuZXJp
YyBmb3IKICAgICBhbnkgR0VNIG9iamVjdCwgIG1heWJlIGNhbGwgaXQgZHJtX2dlbV9vYmplY3Rf
cGxhY2VtZW50LgogICAgIHR0bV9tZW1fcmVnIGNvdWxkIHJlbWFpbiBhcyBhIHdyYXBwZXIgZm9y
IFRUTSBkcml2ZXJzLgogICAgIFRoaXMgaGFzbid0IGJlZW4gYnJvYWRseSBkaXNjdXNzZWQgd2l0
aCBpbnRlbC1nZnggZm9sa3MsIHNvIG5vdCBzdXJlCiAgICAgdGhpcyBmaXRzIHdlbGwgaW50byBp
OTE1IG9yIG5vdC4KCiAgICAgUmVsZXZhbnQgdG8gZHJtX2Nncm91cCwgbWF5YmUgdGhpcyBmdW5j
dGlvbjoKCWRybWNncnBfbWVtX3RyYWNrX21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpv
bGRfYm8sIGJvb2wgZXZpY3QsCgkJc3RydWN0IHR0bV9tZW1fcmVnICpuZXdfbWVtKQogICAgIGNv
dWxkIHBvdGVudGlhbGx5IGJlY29tZToKICAgICAgICBkcm1jZ3JwX21lbV90cmFja19tb3ZlKHN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqb2xkX2JvLCBib29sIGV2aWN0LAoJCXN0cnVjdCBkcm1fZ2Vt
X29iamVjdF9wbGFjZW1lbnQgKm5ld19wbGFjZSkKCiAgICAgVGhvdWdoIGZyb20gdHRtX21lbV9y
ZWcsIHlvdSBsb29rIHRvIG9ubHkgYmUgdXNpbmcgbWVtX3R5cGUgYW5kIHNpemUuCiAgICAgSSB0
aGluayBEYW5pZWwgaXMgbm90aW5nIHRoYXQgdHRtX21lbV9yZWcgd2Fzbid0IHRydWx5IG5lZWRl
ZCBoZXJlLCBzbwogICAgIHlvdSBjb3VsZCBqdXN0IHBhc3MgaW4gdGhlIG1lbV90eXBlIGFuZCBz
aXplIGluc3RlYWQuCgpXb3VsZCBhcHByZWNpYXRlIGFueSBmZWVkYmFjayAocG9zaXRpdmUgb3Ig
bmVnYXRpdmUpIG9uIGFib3ZlLi4uLgpQZXJoYXBzIHRoaXMgc2hvdWxkIG1vdmUgdG8gYSBuZXcg
dGhyZWFkPyAgIEkgY291bGQgc2VuZCBvdXQgYmFzaWMgUkZDCnBhdGNoZXMgZm9yICgxKSBpZiBo
ZWxwZnVsIGJ1dCBhcyBpdCB0b3VjaGVzIGFsbCB0aGUgVFRNIGRyaXZlcnMsIG5pY2UgdG8KaGVh
ciBzb21lIGZlZWRiYWNrIGZpcnN0LgpBbnl3YXksIHRoaXMgZG9lc24ndCBuZWNlc3NhcmlseSBu
ZWVkIHRvIGJsb2NrIGZvcndhcmQgcHJvZ3Jlc3Mgb24gZHJtX2Nncm91cCwKYXMgcmVmYWN0b3Jp
bmcgaW50byBjb21tb24gYmFzZSBzdHJ1Y3R1cmVzIGNvdWxkIGhhcHBlbiBpbmNyZW1lbnRhbGx5
LgoKVGhhbmtzLAotQnJpYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
