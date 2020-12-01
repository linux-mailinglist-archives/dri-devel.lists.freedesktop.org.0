Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2CC2CA330
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 13:55:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB826E519;
	Tue,  1 Dec 2020 12:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E5989F71;
 Tue,  1 Dec 2020 12:55:39 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23175816-1500050 for multiple; Tue, 01 Dec 2020 12:55:35 +0000
MIME-Version: 1.0
In-Reply-To: <20201127120718.454037-93-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-93-matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 092/162] drm/i915/uapi: introduce
 drm_i915_gem_create_ext
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 01 Dec 2020 12:55:35 +0000
Message-ID: <160682733503.4024.12763949700807658471@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBNYXR0aGV3IEF1bGQgKDIwMjAtMTEtMjcgMTI6MDY6MDgpCj4gU2FtZSBvbGQgZ2Vt
X2NyZWF0ZSBidXQgd2l0aCBub3cgd2l0aCBleHRlbnNpb25zIHN1cHBvcnQuIFRoaXMgaXMgbmVl
ZGVkCj4gdG8gc3VwcG9ydCB2YXJpb3VzIHVwY29taW5nIHVzZWNhc2VzLiBGb3Igbm93IHdlIHVz
ZSB0aGUgZXh0ZW5zaW9ucwo+IG1lY2hhbmlzbSB0byBzdXBwb3J0IHNldHRpbmcgYW4gaW1tdXRh
YmxlLXByaW9yaXR5LWxpc3Qgb2YgcG90ZW50aWFsCj4gcGxhY2VtZW50cywgYXQgY3JlYXRpb24g
dGltZS4KPiAKPiBJZiB3ZSB3aXNoIHRvIHNldCB0aGUgcGxhY2VtZW50cy9yZWdpb25zIHdlIGNh
biBzaW1wbHkgZG86Cj4gCj4gc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3RfcGFyYW0gcmVnaW9u
X3BhcmFtID0geyDigKYgfTsgLyogVW5jaGFuZ2VkICovCj4gc3RydWN0IGRybV9pOTE1X2dlbV9j
cmVhdGVfZXh0X3NldHBhcmFtIHNldHBhcmFtX3JlZ2lvbiA9IHsKPiAgICAgLmJhc2UgPSB7IC5u
YW1lID0gSTkxNV9HRU1fQ1JFQVRFX0VYVF9TRVRQQVJBTSB9LAo+ICAgICAucGFyYW0gPSByZWdp
b25fcGFyYW0sCj4gfQo+IAo+IHN0cnVjdCBkcm1faTkxNV9nZW1fY3JlYXRlX2V4dCBjcmVhdGVf
ZXh0ID0gewo+ICAgICAgICAgLnNpemUgPSAxNiAqIFBBR0VfU0laRSwKPiAgICAgICAgIC5leHRl
bnNpb25zID0gKHVpbnRwdHJfdCkmc2V0cGFyYW1fcmVnaW9uLAo+IH07Cj4gaW50IGVyciA9IGlv
Y3RsKGZkLCBEUk1fSU9DVExfSTkxNV9HRU1fQ1JFQVRFX0VYVCwgJmNyZWF0ZV9leHQpOwo+IGlm
IChlcnIpIC4uLgoKTG9va2luZyBhdCB0aGUgZXhpc3RpbmcgZ2VtX2NyZWF0ZSwgdGhlcmUgaXMg
bm8gZGV0ZWN0aW9uIG9mIGFuCnVuc3VwcG9ydGVkIGV4dGVuc2lvbi4gVGhhdCBpcyB0aGVyZSBp
cyBubyByZWplY3Rpb24gb2YgbmV3IHVzZXJzcGFjZQphc2tpbmcgZm9yIHBsYWNlbWVudCBvbiBh
biBvbGQga2VybmVsLiAoQXMgZXJyb25lb3VzIGFzIHRoYXQgd291bGQgYmUKZm9yIG1hbnkgb3Ro
ZXIgcmVhc29ucy4pCgpVbmxlc3MgSSd2ZSBtaXNzZWQgc29tZXRoaW5nLCB3ZSBuZWVkIGEgbmV3
IGlvY3RsIG51bWJlciBmb3IgQ1JFQVRFdjIuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
