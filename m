Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D125E113E34
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 10:39:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7BA06F62F;
	Thu,  5 Dec 2019 09:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6476F62F;
 Thu,  5 Dec 2019 09:39:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Dec 2019 01:39:00 -0800
X-IronPort-AV: E=Sophos;i="5.69,280,1571727600"; d="scan'208";a="201721282"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Dec 2019 01:38:56 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Bruno =?utf-8?Q?Pr=C3=A9mont?= <bonbons@linux-vserver.org>
Subject: Re: [PATCH v2 11/14] HID: picoLCD: constify fb ops
In-Reply-To: <20191202094047.34525a7d@aether.lan.sysophe.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1575022735.git.jani.nikula@intel.com>
 <8678a9a3566279c881bb4db944850eef35d0a4bb.1575022735.git.jani.nikula@intel.com>
 <20191202094047.34525a7d@aether.lan.sysophe.eu>
Date: Thu, 05 Dec 2019 11:38:53 +0200
Message-ID: <871rtji02a.fsf@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, Jiri Kosina <jikos@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAwMiBEZWMgMjAxOSwgQnJ1bm8gUHLDqW1vbnQgPGJvbmJvbnNAbGludXgtdnNlcnZl
ci5vcmc+IHdyb3RlOgo+IEhpIEphbmksCj4KPiBPbiBGcmksIDI5IE5vdiAyMDE5IDEyOjI5OjQx
IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+IHdyb3RlOgo+PiBOb3cgdGhhdCB0
aGUgZmJvcHMgbWVtYmVyIG9mIHN0cnVjdCBmYl9pbmZvIGlzIGNvbnN0LCB3ZSBjYW4gc3RhcnQK
Pj4gbWFraW5nIHRoZSBvcHMgY29uc3QgYXMgd2VsbC4KPj4KPj4gdjI6IGZpeAl0eXBvIChDaHJp
c3RvcGhlIGRlIERpbmVjaGluKQo+Cj4gRmluZSB3aXRoIG1lLgo+IEkgZG9uJ3QgdGhpbmsgZ29p
bmcgdGhyb3VnaCBkcm0tbWlzYyB3b3VsZCB0cmlnZ2VyIGFueSBjb25mbGljdCwgYnV0Cj4gYWRk
aW5nIEppcmkgdG8gQ0MgZm9yIHRoZSBjYXNlIHRoZXJlIHdhcyBhbnkgcHJlZmVyZW5jZS4KPgo+
IEFja2VkLWJ5OiBCcnVubyBQcsOpbW9udCA8Ym9uYm9uc0BsaW51eC12c2VydmVyLm9yZz4KCk5v
IHJlc3BvbnNlLCBtYXkgSSBwcm9jZWVkIHdpdGggbWVyZ2luZyB0aGlzIHRocm91Z2ggZHJtLW1p
c2MgcGxlYXNlPwoKQlIsCkphbmkuCgo+Cj4+IENjOiBCcnVubyBQcsOpbW9udCA8Ym9uYm9uc0Bs
aW51eC12c2VydmVyLm9yZz4KPj4gQ2M6IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9yZwo+PiBS
ZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPj4gU2ln
bmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KPj4gLS0tCj4+
ICBkcml2ZXJzL2hpZC9oaWQtcGljb2xjZF9mYi5jIHwgMyArLS0KPj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2hpZC9oaWQtcGljb2xjZF9mYi5jIGIvZHJpdmVycy9oaWQvaGlkLXBpY29sY2RfZmIuYwo+
PiBpbmRleCBlMTYyYTY2OGZiN2UuLmE1NDljNDJlOGM5MCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9oaWQvaGlkLXBpY29sY2RfZmIuYwo+PiArKysgYi9kcml2ZXJzL2hpZC9oaWQtcGljb2xjZF9m
Yi5jCj4+IEBAIC00MTcsOCArNDE3LDcgQEAgc3RhdGljIGludCBwaWNvbGNkX3NldF9wYXIoc3Ry
dWN0IGZiX2luZm8gKmluZm8pCj4+ICAJcmV0dXJuIDA7Cj4+ICB9Cj4+ICAKPj4gLS8qIE5vdGUg
dGhpcyBjYW4ndCBiZSBjb25zdCBiZWNhdXNlIG9mIHN0cnVjdCBmYl9pbmZvIGRlZmluaXRpb24g
Ki8KPj4gLXN0YXRpYyBzdHJ1Y3QgZmJfb3BzIHBpY29sY2RmYl9vcHMgPSB7Cj4+ICtzdGF0aWMg
Y29uc3Qgc3RydWN0IGZiX29wcyBwaWNvbGNkZmJfb3BzID0gewo+PiAgCS5vd25lciAgICAgICAg
PSBUSElTX01PRFVMRSwKPj4gIAkuZmJfZGVzdHJveSAgID0gcGljb2xjZF9mYl9kZXN0cm95LAo+
PiAgCS5mYl9yZWFkICAgICAgPSBmYl9zeXNfcmVhZCwKPgoKLS0gCkphbmkgTmlrdWxhLCBJbnRl
bCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
