Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD12710FA8E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 10:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC7E6E43D;
	Tue,  3 Dec 2019 09:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71A16E43D;
 Tue,  3 Dec 2019 09:16:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 01:16:07 -0800
X-IronPort-AV: E=Sophos;i="5.69,272,1571727600"; d="scan'208";a="204907667"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 01:16:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 07/14] video: omapfb: use const pointer for fb_ops
In-Reply-To: <dfa4376e219ffeef9175993eaff91b5fe7ecccab.1575022735.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1575022735.git.jani.nikula@intel.com>
 <dfa4376e219ffeef9175993eaff91b5fe7ecccab.1575022735.git.jani.nikula@intel.com>
Date: Tue, 03 Dec 2019 11:16:00 +0200
Message-ID: <877e3dkbvz.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyOSBOb3YgMjAxOSwgSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4g
d3JvdGU6Cj4gVXNlIGNvbnN0IGZvciBmYl9vcHMgdG8gbGV0IHVzIG1ha2UgdGhlIGluZm8tPmZi
b3BzIHBvaW50ZXIgY29uc3QgaW4gdGhlCj4gZnV0dXJlLgo+Cj4gQ2M6IGxpbnV4LWZiZGV2QHZn
ZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1vbWFwQHZnZXIua2VybmVsLm9yZwo+IFJldmlld2Vk
LWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IFNpZ25lZC1vZmYt
Ynk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+CgpQdXNoZWQgdXAgdG8gYW5k
IGluY2x1ZGluZyB0aGlzIHBhdGNoIHRvIGRybS1taXNjLW5leHQsIHRoYW5rcyBmb3IgdGhlCnJl
dmlld3MgYW5kIGFja3MuCgpJIG1heSBoYXZlIG1pc3NlZCBzb21lIHBvaW50ZXIgY2hhc2luZyB1
c2VzIG9mIGluZm8tPmZib3BzLCByZXBvcnRlZCBieQowZGF5LiBJJ2xsIG5lZWQgdG8gZG91Ymxl
IGNoZWNrIHRob3NlIGJlZm9yZSBwcm9jZWVkaW5nIHdpdGggdGhlIG5leHQKcGF0Y2guCgpCUiwK
SmFuaS4KCj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvb21hcC9vbWFwZmJfbWFpbi5jIHwg
MiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAvb21hcGZiX21haW4uYyBiL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvb21hcC9vbWFwZmJfbWFpbi5jCj4gaW5kZXggNzAyY2NhNTliZGEx
Li5lOGEzMDRmODRlYTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9vbWFwL29t
YXBmYl9tYWluLmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAvb21hcGZiX21haW4u
Ywo+IEBAIC0xMDUyLDcgKzEwNTIsNyBAQCBzdGF0aWMgaW50IG9tYXBmYl9pb2N0bChzdHJ1Y3Qg
ZmJfaW5mbyAqZmJpLCB1bnNpZ25lZCBpbnQgY21kLAo+ICB7Cj4gIAlzdHJ1Y3Qgb21hcGZiX3Bs
YW5lX3N0cnVjdCAqcGxhbmUgPSBmYmktPnBhcjsKPiAgCXN0cnVjdCBvbWFwZmJfZGV2aWNlCSpm
YmRldiA9IHBsYW5lLT5mYmRldjsKPiAtCXN0cnVjdCBmYl9vcHMJCSpvcHMgPSBmYmktPmZib3Bz
Owo+ICsJY29uc3Qgc3RydWN0IGZiX29wcyAqb3BzID0gZmJpLT5mYm9wczsKPiAgCXVuaW9uIHsK
PiAgCQlzdHJ1Y3Qgb21hcGZiX3VwZGF0ZV93aW5kb3cJdXBkYXRlX3dpbmRvdzsKPiAgCQlzdHJ1
Y3Qgb21hcGZiX3BsYW5lX2luZm8JcGxhbmVfaW5mbzsKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwg
T3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
