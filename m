Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2CE1645D8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 14:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4556EBE9;
	Wed, 19 Feb 2020 13:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7556EBE9;
 Wed, 19 Feb 2020 13:42:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 373EA2F9;
 Wed, 19 Feb 2020 14:42:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582119750;
 bh=Vj5km22DilG6lLN1W8MwSdVZrM6pcwEUJXUQKWC5SSA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OxRm/1cKnh014p3/E9fvFZE4WWkNDsmk/tfTvm2yckPkaojrtg1cuG1e9kZPY6EBU
 JtWCDkyL64MUd73OQgclkU9oUBfCXw8irrEereRUVtw7wRRhiJWbKsJRgsvR879s5n
 pFZWGVOe60/Yn424V2M0qTtAs1TVe2iQWHlaieXA=
Date: Wed, 19 Feb 2020 15:42:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 07/52] drm/udl: Use drmm_add_final_kfree
Message-ID: <20200219134211.GF5070@pendragon.ideasonboard.com>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-8-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219102122.1607365-8-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBXZWQsIEZlYiAxOSwgMjAy
MCBhdCAxMToyMDozN0FNICswMTAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IFdpdGggdGhpcyB3
ZSBjYW4gZHJvcCB0aGUgZmluYWwga2ZyZWUgZnJvbSB0aGUgcmVsZWFzZSBmdW5jdGlvbi4KPiAK
PiB2MjogV2UgbmVlZCBkcm1fZGV2X3B1dCB0byB1bnJvbGwgdGhlIGRyaXZlciBjcmVhdGlvbiAo
b25jZQo+IGRybV9kZXZfaW5pdCBhbmQgZHJtbV9hZGRfZmluYWxfa2ZyZWUgc3VjZWVkZWQpLCBv
dGhlcndpc2UKPiB0aGUgZHJtbV8gbWFnaWMgZG9lc24ndCBoYXBwZW4uCj4gCj4gU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CgpEaWQgeW91IG1l
YW4gdG8gc3F1YXNoIHRoaXMgd2l0aCB0aGUgcHJldmlvdXMgY29tbWl0ID8KCj4gQ2M6IERhdmUg
QWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Cj4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHku
cnVuPgo+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiBDYzog
RW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+Cj4gQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gQ2M6ICJOb3JhbGYgVHLDuG5uZXMiIDxub3Jh
bGZAdHJvbm5lcy5vcmc+Cj4gQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRl
Pgo+IENjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS91ZGwvdWRsX2Rydi5jIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dWRsL3VkbF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5jCj4gaW5kZXggZDVi
ODk3MTFhYjFlLi42YTU1OTQ5NDYwOTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Vk
bC91ZGxfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuYwo+IEBAIC04
MSw4ICs4MSw3IEBAIHN0YXRpYyBzdHJ1Y3QgdWRsX2RldmljZSAqdWRsX2RyaXZlcl9jcmVhdGUo
c3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGVyZmFjZSkKPiAgCj4gIAlyID0gdWRsX2luaXQodWRs
KTsKPiAgCWlmIChyKSB7Cj4gLQkJZHJtX2Rldl9maW5pKCZ1ZGwtPmRybSk7Cj4gLQkJa2ZyZWUo
dWRsKTsKPiArCQlkcm1fZGV2X3B1dCgmdWRsLT5kcm0pOwo+ICAJCXJldHVybiBFUlJfUFRSKHIp
Owo+ICAJfQo+ICAKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
