Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F6C1023A1
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 12:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C63E6E075;
	Tue, 19 Nov 2019 11:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA606E075
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 11:52:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Nov 2019 03:52:26 -0800
X-IronPort-AV: E=Sophos;i="5.68,322,1569308400"; d="scan'208";a="200327269"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Nov 2019 03:52:22 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thierry Reding <thierry.reding@gmail.com>, zhengbin <zhengbin13@huawei.com>,
 Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH 0/2] drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code
In-Reply-To: <87wobwxf95.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1574077572-59152-1-git-send-email-zhengbin13@huawei.com>
 <20191118132357.GC2246533@ulmo> <87wobwxf95.fsf@intel.com>
Date: Tue, 19 Nov 2019 13:52:19 +0200
Message-ID: <87tv70xevg.fsf@intel.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-tegra@vger.kernel.org,
 treding@nvidia.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxOSBOb3YgMjAxOSwgSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVs
LmNvbT4gd3JvdGU6Cj4gT24gTW9uLCAxOCBOb3YgMjAxOSwgVGhpZXJyeSBSZWRpbmcgPHRoaWVy
cnkucmVkaW5nQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IE9uIE1vbiwgTm92IDE4LCAyMDE5IGF0IDA3
OjQ2OjEwUE0gKzA4MDAsIHpoZW5nYmluIHdyb3RlOgo+Pj4gemhlbmdiaW4gKDIpOgo+Pj4gICBk
cm0vdGVncmE6IFVzZSBQVFJfRVJSX09SX1pFUk8oKSB0byBzaW1wbGlmeSBjb2RlIGluCj4+PiAg
ICAgdGVncmFfYm9fZHVtYl9jcmVhdGUKPj4+ICAgZHJtL3RlZ3JhOiBVc2UgUFRSX0VSUl9PUl9a
RVJPKCkgdG8gc2ltcGxpZnkgY29kZSBpbiB0ZWdyYV9nZW1fY3JlYXRlCj4+PiAKPj4+ICBkcml2
ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMgfCA1ICstLS0tCj4+PiAgZHJpdmVycy9ncHUvZHJtL3Rl
Z3JhL2dlbS5jIHwgNSArLS0tLQo+Pj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCA4IGRlbGV0aW9ucygtKQo+Pgo+PiBBcyBJIGV4cGxhaW5lZCBpbiByZXNwb25zZSB0byB0aGUg
c2FtZSBwYXRjaGVzIHNlbnQgZm9yIG90aGVyIGRyaXZlcnMKPj4gYWxyZWFkeSwgSSBkb24ndCB0
aGluayB0aGlzIGhhcyBhbnkgbWVyaXQuCj4KPiBJIGFncmVlIGNvbXBsZXRlbHkuCj4KPiBBcHBh
cmVudGx5IHRoZXJlJ3MgYSBjb2NjaWNoZWNrIGZsYWdnaW5nIGNvbnN0cnVjdHMgbGlrZSB0aGlz
OyBwZXJoYXBzCj4gdGhhdCBzaG91bGQgYmUgYWRkcmVzc2VkLiBKdWxpYT8KPgo+IFRoaW5ncyBs
aWtlOgo+Cj4gZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jOjQ1NzoxLTM6IFdBUk5JTkc6IFBU
Ul9FUlJfT1JfWkVSTyBjYW4gYmUgdXNlZAo+Cj4gbGVhZGluZyB0bzoKPgo+ICAtCWlmIChJU19F
UlIoYm8pKQo+ICAtCQlyZXR1cm4gUFRSX0VSUihibyk7Cj4gIC0KPiAgLQlyZXR1cm4gMDsKPiAg
KwlyZXR1cm4gUFRSX0VSUl9PUl9aRVJPKGJvKTsKPgo+IEkgdGhpbmsgd2UgaGF2ZSBjb25zZW5z
dXMgdGhlIGVycm9yIHBhdGggYW5kIHRoZSBoYXBweSBkYXkgc2NlbmFyaW9zCj4gc2hvdWxkIHJl
bWFpbiBkaXN0aW5jdC4gTW9yZW92ZXIsIEkgZmluZCBQVFJfRVJSX09SX1pFUk8oKSBjYXVzZXMg
bWUgdG8KPiBwYXVzZSBmb3IgYSBtb21lbnQgd2hpbGUgdGhlIG9yaWdpbmFsIGlzIGEgY3J5c3Rh
bCBjbGVhciBpbW1lZGlhdGVseS4KClJlIGNvbnNlbnN1cywgWzFdWzJdIGFuZCBwcm9iYWJseSBt
b3JlLiBQZXIgYW4gZW1haWwgc2VhcmNoLCB0aGlzIHBvcHMKdXAgZm9yIHRoZSBzYW1lIHN0dWZm
IG92ZXIgYW5kIG92ZXIgYWdhaW4uIENhbiB3ZSBwbGVhc2UganVzdCByZW1vdmUgdGhlCmNvY2Np
IGNoZWNrPwoKQlIsCkphbmkuCgoKWzFdIGh0dHA6Ly9taWQubWFpbC1hcmNoaXZlLmNvbS9kYWFk
ZTUyZC0wZGZjLTkzNjUtYjE3Yy0wMmU3ZTc4NWFmYWRAdGkuY29tClsyXSBodHRwOi8vbWlkLm1h
aWwtYXJjaGl2ZS5jb20vMjAxOTExMTgxMzAwMjIuR000MzQ1QGdpbG1vdXIubGFuCgotLSAKSmFu
aSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
