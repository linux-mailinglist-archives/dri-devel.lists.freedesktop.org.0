Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 927E67DF2B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 17:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27EBB6E6F6;
	Thu,  1 Aug 2019 15:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453F06E6F6
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 15:34:19 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17792212-1500050 for multiple; Thu, 01 Aug 2019 16:34:11 +0100
MIME-Version: 1.0
To: Rob Clark <robdclark@gmail.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <CAF6AEGu8K+PwRyY738aFyv+fdZ_UZDhY3XcFY-w4uLMW+w6X9Q@mail.gmail.com>
References: <20190717211542.30482-1-robdclark@gmail.com>
 <20190719092153.GJ15868@phenom.ffwll.local>
 <20190731192331.GT104440@art_vandelay>
 <156466322613.6045.7313079853087889718@skylake-alporthouse-com>
 <CAF6AEGu8K+PwRyY738aFyv+fdZ_UZDhY3XcFY-w4uLMW+w6X9Q@mail.gmail.com>
Message-ID: <156467364918.6045.9820603183181141608@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/vgem: fix cache synchronization on arm/arm64
Date: Thu, 01 Aug 2019 16:34:09 +0100
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
Cc: Deepak Sharma <deepak.sharma@amd.com>, Rob Clark <robdclark@chromium.org>,
 Eric Biggers <ebiggers@google.com>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBSb2IgQ2xhcmsgKDIwMTktMDgtMDEgMTY6MTg6NDUpCj4gT24gVGh1LCBBdWcgMSwg
MjAxOSBhdCA1OjQwIEFNIENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPiB3
cm90ZToKPiA+Cj4gPiBRdW90aW5nIFNlYW4gUGF1bCAoMjAxOS0wNy0zMSAyMDoyMzozMSkKPiA+
ID4gT24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMTE6MjE6NTNBTSArMDIwMCwgRGFuaWVsIFZldHRl
ciB3cm90ZToKPiA+ID4gPiBPbiBXZWQsIEp1bCAxNywgMjAxOSBhdCAwMjoxNTozN1BNIC0wNzAw
LCBSb2IgQ2xhcmsgd3JvdGU6Cj4gPiA+ID4gPiBGcm9tOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0Bj
aHJvbWl1bS5vcmc+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gZHJtX2NmbHVzaF9wYWdlcygpIGlzIG5v
LW9wIG9uIGFybS9hcm02NC4gIEJ1dCBpbnN0ZWFkIHdlIGNhbiB1c2UKPiA+ID4gPiA+IGRtYV9z
eW5jIEFQSS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBGaXhlcyBmYWlsdXJlcyB3LyB2Z2VtX3Rlc3Qu
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtA
Y2hyb21pdW0ub3JnPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiBBbiBhbHRlcm5hdGl2ZSBhcHBy
b2FjaCB0byB0aGUgc2VyaWVzWzFdIEkgc2VudCB5ZXN0ZXJkYXkKPiA+ID4gPiA+Cj4gPiA+ID4g
PiBPbiB0aGUgcGx1cyBzaWRlLCBpdCBrZWVwcyB0aGUgV0MgYnVmZmVycyBhbmQgYXZvaWRzIGFu
eSBkcm0gY29yZQo+ID4gPiA+ID4gY2hhbmdlcy4gIE9uIHRoZSBtaW51cyBzaWRlLCBJIGRvbid0
IHRoaW5rIGl0IHdpbGwgd29yayAoYXQgbGVhc3QKPiA+ID4gPiA+IG9uIGFybTY0KSBwcmlvciB0
byB2NS4wWzJdLCBzbyB0aGUgZml4IGNhbid0IGJlIGJhY2twb3J0ZWQgdmVyeQo+ID4gPiA+ID4g
ZmFyLgo+ID4gPiA+Cj4gPiA+ID4gWWVhaCBzZWVtcyBhIGxvdCBtb3JlIHJlYXNvbmFibGUuCj4g
PiA+ID4KPiA+ID4gPiBBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZnds
bC5jaD4KPiA+ID4KPiA+ID4gQXBwbGllZCB0byBkcm0tbWlzYy1maXhlcywgdGhhbmtzIQo+ID4K
PiA+IEJ1dCBpdCBkaWRuJ3QgYWN0dWFsbHkgZml4IHRoZSBmYWlsdXJlcyBpbiBDSS4KPiAKPiBI
bW0sIHRoYXQgaXMgdW5mb3J0dW5hdGUsIEknZCBhc3N1bWVkIHRoYXQgc2lsZW5jZSBtZWFudCBs
YXRlc3QKPiB2ZXJzaW9uIHdhcyB3b3JraW5nIGluIENJLi4KCkFoLCB0YWtlcyBhIGludGVsLWdm
eEAgZm9yIENJIHRvIHBpY2sgdXAgcGF0Y2hlcyBhdG0uCiAKPiBkbWFfc3luY19zZ18qIGRvZXNu
J3Qgd29yayBvbiB4ODY/ICBJdCB3b3VsZCBiZSBraW5kYSB1bmZvcnR1bmF0ZSB0bwo+IGhhdmUg
dmdlbSBvbmx5IHdvcmsgb24geDg2ICpvciogYXJtLi4gIG1heWJlIGJyaW5naW5nIGJhY2sKPiBk
cm1fY2ZsdXNoX3BhZ2VzKCkgY291bGQgbWFrZSBpdCB3b3JrIGluIGJvdGggY2FzZXMKCkkgdGhp
bmsgaXQgc3RlbXMgZnJvbSB0aGUgZXhwZWN0YXRpb24gdGhhdCB2Z2VtIHByb3ZpZGVzICJkZXZp
Y2UKY29oZXJlbmN5IiBmb3IgQ1BVIGFjY2Vzcy4gRnJvbSB0aGUgdGVzdGluZyBwZXJzcGVjdGl2
ZSwgaXQncyBuaWNlIHRvCmVtdWxhdGUgSFcgaW50ZXJhY3Rpb25zOyBidXQgbWF5YmUgdGhhdCBp
cyBqdXN0IGJleW9uZCB0aGUgZ2VuZXJhbApjYXBhYmlsaXRpZXMgYW5kIHdlIGNhbm5vdCBzaW1w
bHkgdXNlIHZnZW0gYXMgd2UgZG8gY3VycmVudGx5LiBUaGF0CndvdWxkIGxlYXZlIGEgaG9sZSBm
b3IgbW9ja2luZyBwcmltZSBpbiBDSSB0aGF0IG5lZWRzIGZpbGxpbmcgOigKLUNocmlzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
