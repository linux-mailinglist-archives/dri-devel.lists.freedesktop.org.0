Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3616E8994
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 14:32:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EAB56E356;
	Tue, 29 Oct 2019 13:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2816E32E;
 Tue, 29 Oct 2019 13:32:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Oct 2019 06:32:46 -0700
X-IronPort-AV: E=Sophos;i="5.68,244,1569308400"; d="scan'208";a="193605954"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Oct 2019 06:32:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/dp: Increase link status size
In-Reply-To: <20191029111006.358963-1-thierry.reding@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191029111006.358963-1-thierry.reding@gmail.com>
Date: Tue, 29 Oct 2019 15:32:41 +0200
Message-ID: <875zk7ad8m.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 coverity-bot <keescook+coverity-bot@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyOSBPY3QgMjAxOSwgVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWls
LmNvbT4gd3JvdGU6Cj4gRnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4K
Pgo+IFRoZSBjdXJyZW50IGxpbmsgc3RhdHVzIGNvbnRhaW5zIGJ5dGVzIDB4MjAyIHRocm91Z2gg
MHgyMDcsIGJ1dCB3ZSBhbHNvCj4gd2FudCB0byBtYWtlIHN1cmUgdG8gaW5jbHVkZSB0aGUgRFBf
QURKVVNUX1JFUVVFU1RfUE9TVF9DVVJTT1IyICgweDIwYykKPiBzbyB0aGF0IHRoZSBwb3N0LWN1
cnNvciBhZGp1c3RtZW50IGNhbiBiZSBxdWVyaWVkIGR1cmluZyBsaW5rIHRyYWluaW5nLgoKV2Ug
ZG9uJ3QgY3VycmVudGx5IHVzZSB0aGlzIGluIGk5MTUgKHdlIHByb2JhYmx5IHNob3VsZCksIHNv
IHRoZSBpbXBhY3QKaGVyZSBpcyB0aGF0IHdlJ2xsIGp1c3QgcmVhZCBtb3JlIERQQ0QgdGhhbiBi
ZWZvcmUuIEkgcXVpY2tseSBwZXJ1c2VkCmk5MTUsIGFuZCB0aGlzIGRvZXMgbm90IGFwcGVhciB0
byBkaXJlY3RseSBicmVhayBhbnl0aGluZy4gSSB0aGluayB0aGUKY2hhbmdlIGlzIHByb2JhYmx5
IGZpbmUsIGJ1dCBhdCB0aGUgc2FtZSB0aW1lIGl0IGZyZWFrcyBtZSBvdXQgYSBiaXQuLi4KCklm
IHlvdSBkb24ndCBtaW5kLCBwbGVhc2UgcmVzZW5kIHRoaXMgd2l0aCBDYzoKaW50ZWwtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZyB0byBoYXZlIG91ciBDSSBjcnVuY2ggdGhyb3VnaCBpdCBhY3Jv
c3MKYSBudW1iZXIgb2YgcGxhdGZvcm1zLiBXb3VsZCBnaXZlIG1lIGEgd2FybSBmdXp6eSBmZWVs
aW5nLiA6KQoKV2l0aCB0aGUgY2F2ZWF0IHRoYXQgSSBkaWRuJ3QgbG9vayBhdCBhbnkgb3RoZXIg
ZHJpdmVycyBiZXNpZGVzIGk5MTUsCgpSZXZpZXdlZC1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlr
dWxhQGludGVsLmNvbT4KCgo+Cj4gUmVwb3J0ZWQtYnk6IGNvdmVyaXR5LWJvdCA8a2Vlc2Nvb2sr
Y292ZXJpdHktYm90QGNocm9taXVtLm9yZz4KPiBBZGRyZXNzZXMtQ292ZXJpdHktSUQ6IDE0ODcz
NjYgKCJNZW1vcnkgLSBjb3JydXB0aW9ucyIpCj4gRml4ZXM6IDc5NDY1ZTBmZmViOSAoImRybS9k
cDogQWRkIGhlbHBlciB0byBnZXQgcG9zdC1jdXJzb3IgYWRqdXN0bWVudHMiKQo+IFNpZ25lZC1v
ZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gLS0tCj4gSSB2YWd1
ZWx5IHJlY2FsbCBvbmNlIGNhcnJ5aW5nIGEgcGF0Y2ggdG8gZG8gdGhpcywgYnV0IEkgY2FuJ3Qg
ZmluZCBhbnkKPiB0cmFjZSBvZiBpdC4KPgo+ICBpbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgg
fCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJt
L2RybV9kcF9oZWxwZXIuaAo+IGluZGV4IDUxZWNiNTExMmVmOC4uOTU4MWRlYzkwMGJhIDEwMDY0
NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAo+ICsrKyBiL2luY2x1ZGUvZHJt
L2RybV9kcF9oZWxwZXIuaAo+IEBAIC0xMTIxLDcgKzExMjEsNyBAQAo+ICAjZGVmaW5lIERQX01T
VF9QSFlTSUNBTF9QT1JUXzAgMAo+ICAjZGVmaW5lIERQX01TVF9MT0dJQ0FMX1BPUlRfMCA4Cj4g
IAo+IC0jZGVmaW5lIERQX0xJTktfU1RBVFVTX1NJWkUJICAgNgo+ICsjZGVmaW5lIERQX0xJTktf
U1RBVFVTX1NJWkUJICAgMTEKPiAgYm9vbCBkcm1fZHBfY2hhbm5lbF9lcV9vayhjb25zdCB1OCBs
aW5rX3N0YXR1c1tEUF9MSU5LX1NUQVRVU19TSVpFXSwKPiAgCQkJICBpbnQgbGFuZV9jb3VudCk7
Cj4gIGJvb2wgZHJtX2RwX2Nsb2NrX3JlY292ZXJ5X29rKGNvbnN0IHU4IGxpbmtfc3RhdHVzW0RQ
X0xJTktfU1RBVFVTX1NJWkVdLAoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBH
cmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
