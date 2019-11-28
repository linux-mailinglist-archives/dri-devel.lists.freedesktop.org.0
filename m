Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 123B410C69E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 11:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14826E798;
	Thu, 28 Nov 2019 10:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008566E798
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 10:26:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Nov 2019 02:26:13 -0800
X-IronPort-AV: E=Sophos;i="5.69,253,1571727600"; d="scan'208";a="203394816"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Nov 2019 02:26:09 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Eric Anholt <eric@anholt.net>,
 Shawn Guo <shawnguo@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: Next round of associating ddc adapters with connectors
In-Reply-To: <00af93c8-4e59-3ff0-6bd0-69289b34846c@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <00af93c8-4e59-3ff0-6bd0-69289b34846c@collabora.com>
Date: Thu, 28 Nov 2019 12:26:06 +0200
Message-ID: <874kyonvpd.fsf@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMiBOb3YgMjAxOSwgQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29s
bGFib3JhLmNvbT4gd3JvdGU6Cj4gRGVhciBNYWludGFpbmVycywKPgo+IENhbiB5b3UgcGxlYXNl
IGV4cHJlc3MgeW91ciBvcGluaW9uIG9uIHRoZXNlIHBhdGNoZXM6Cj4KPiBbdGVncmFdIGh0dHBz
Oi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8zMjcwOTkvP3Nlcmllcz02NTgzMSZy
ZXY9MQo+IFt2YzRdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8zMjcx
MDIvP3Nlcmllcz02NTgzMSZyZXY9MQo+IFt6dGVdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9wYXRjaC8zMjcxMDYvP3Nlcmllcz02NTgzMSZyZXY9MQo+IFt6dGVdIGh0dHBzOi8v
cGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8zMjcxMTIvP3Nlcmllcz02NTgzMSZyZXY9
MQo+IFtpOTE1XSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzI3MTIw
Lz9zZXJpZXM9NjU4MzEmcmV2PTEKCkkndmUgZXhwcmVzc2VkIG15IG9waW5pb24gaW4gWzFdIGFu
ZCB0aGF0IGhhc24ndCBjaGFuZ2VkLiBJIGRvbid0IGxpa2UKdGhlIGludGVyZmFjZSwgYW5kIGEg
ZmV3IHllYXJzIGRvd24gdGhlIGxpbmUgSSBleHBlY3QgdGhlcmUncyBnb2luZyB0bwpiZSBhIHBh
dGNoIHNlcmllcyByZW5hbWluZyBkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMoKSBiYWNrIHRv
CmRybV9jb25uZWN0b3JfaW5pdCgpIHdpdGggYW4gZXh0cmEgcGFyYW1ldGVyLCBhbmQgTlVMTCB3
aWxsIGJlIHBhc3NlZAp3aGVyZSBkZGMgaXMgbm90IHJlbGV2YW50LgoKQW55d2F5LCB0aGF0IHNo
aXAgaGFzIHNhaWxlZCwgeW91IGRpZG4ndCBldmVuIGNhcmUgdG8gcmVwbHksIGFuZCBub2JvZHkK
ZWxzZSBzZWVtcyB0byBtaW5kLCBzbyBtZWgsIGFuZCBhY2sgb24gdGhlIHBhdGNoLiBJbmRlZWQg
SSB3b3VsZCd2ZQphcHBsaWVkIGl0IGFscmVhZHksIGJ1dCBpdCBubyBsb25nZXIgYXBwbGllcywg
c28gcGxlYXNlIHNlbmQgdGhlIHJlYmFzZWQKaTkxNSBwYXRjaCBpbmRpdmlkdWFsbHkgdG8gaW50
ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyBzbyB3ZSdsbCBhbHNvCmdldCBDSSBjb3ZlcmFn
ZSBhZ2FpbnN0IHRoZSBjdXJyZW50IGRybS10aXAgdHJlZS4KCkJSLApKYW5pLgoKClsxXSBodHRw
Oi8vbG9yZS5rZXJuZWwub3JnL3IvODc1em5scDZ5ay5mc2ZAaW50ZWwuY29tCgoKPgo+ID8KPgo+
IE9mIHRoZSBvcmlnaW5hbGx5IHBvc3RlZCBwYXRjaGVzOgo+Cj4gaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82Mjc2NC8KPgo+IG9ubHkgdGhlIGFib3ZlIGFyZSBzdGls
bCBvdXRzdGFuZGluZywgdGhlIG90aGVycyBoYXZlIGJlZW4gYXBwbGllZAo+IHRvIGF0IGxlYXN0
IGRybS1taXNjLW5leHQgb3IgYXJlIGFscmVhZHkgdXBzdHJlYW0uCj4KPiBSZWdhcmRzLAo+Cj4g
QW5kcnplagoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50
ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
