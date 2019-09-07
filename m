Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16815AC520
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2019 09:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B64589C94;
	Sat,  7 Sep 2019 07:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A9989C94;
 Sat,  7 Sep 2019 07:25:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Sep 2019 00:25:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,477,1559545200"; d="scan'208";a="195659404"
Received: from dk-thinkpad-x260.jf.intel.com ([10.165.21.139])
 by orsmga002.jf.intel.com with ESMTP; 07 Sep 2019 00:25:06 -0700
Message-ID: <f51af87fb0c00180e6ac75ce1b0c3fa3d22f3843.camel@intel.com>
Subject: Re: [PATCH 1/2] drm/framebuffer: Format modifier for Intel Gen-12
 render compression
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Sat, 07 Sep 2019 00:25:04 -0700
In-Reply-To: <20190907072111.31132-1-dhinakaran.pandiyan@intel.com>
References: <20190907072111.31132-1-dhinakaran.pandiyan@intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
Reply-To: dhinakaran.pandiyan@intel.com
Cc: Nanley G Chery <nanley.g.chery@intel.com>, dri-devel@lists.freedesktop.org,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDE5LTA5LTA3IGF0IDAwOjIxIC0wNzAwLCBEaGluYWthcmFuIFBhbmRpeWFuIHdy
b3RlOgo+IEdlbi0xMiBoYXMgYSBuZXcgY29tcHJlc3Npb24gZm9ybWF0LCBhZGQgYSBuZXcgbW9k
aWZpZXIgdG8gaW5kaWNhdGUgdGhhdC4KPiAKPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBDYzogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVy
QGludGVsLmNvbT4KPiBDYzogTmFubGV5IEcgQ2hlcnkgPG5hbmxleS5nLmNoZXJ5QGludGVsLmNv
bT4KPiBDYzogSmFzb24gRWtzdHJhbmQgPGphc29uQGpsZWtzdHJhbmQubmV0PgpDYzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZyAKCj4gU2lnbmVkLW9mZi1ieTogRGhpbmFrYXJhbiBQ
YW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
THVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+Cj4gLS0tCj4gIGluY2x1
ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIHwgMTEgKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDExIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9k
cm1fZm91cmNjLmggYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+IGluZGV4IDNmZWVh
YTNmOTg3YS4uMWYwZmJmMDM5OGY2IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJt
X2ZvdXJjYy5oCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgKPiBAQCAtNDEw
LDYgKzQxMCwxNyBAQCBleHRlcm4gIkMiIHsKPiAgI2RlZmluZSBJOTE1X0ZPUk1BVF9NT0RfWV9U
SUxFRF9DQ1MJZm91cmNjX21vZF9jb2RlKElOVEVMLCA0KQo+ICAjZGVmaW5lIEk5MTVfRk9STUFU
X01PRF9ZZl9USUxFRF9DQ1MJZm91cmNjX21vZF9jb2RlKElOVEVMLCA1KQo+ICAKPiArLyoKPiAr
ICogSW50ZWwgY29sb3IgY29udHJvbCBzdXJmYWNlcyAoQ0NTKSBmb3IgR2VuLTEyIHJlbmRlciBj
b21wcmVzc2lvbi4KPiArICoKPiArICogVGhlIG1haW4gc3VyZmFjZSBpcyBZLXRpbGVkIGFuZCBh
dCBwbGFuZSBpbmRleCAwLCB0aGUgQ0NTIGlzIGxpbmVhciBhbmQKPiArICogYXQgaW5kZXggMS4g
QSA2NEIgQ0NTIGNhY2hlIGxpbmUgY29ycmVzcG9uZHMgdG8gYW4gYXJlYSBvZiA0eDEgdGlsZXMg
aW4KPiArICogbWFpbiBzdXJmYWNlLiBJbiBvdGhlciB3b3JkcywgNCBiaXRzIGluIENDUyBtYXAg
dG8gYSBtYWluIHN1cmZhY2UgY2FjaGUKPiArICogbGluZSBwYWlyLiBUaGUgbWFpbiBzdXJmYWNl
IHBpdGNoIGlzIHJlcXVpcmVkIHRvIGJlIGEgbXVsdGlwbGUgb2YgZm91cgo+ICsgKiBZLXRpbGUg
d2lkdGhzLgo+ICsgKi8KPiArI2RlZmluZSBJOTE1X0ZPUk1BVF9NT0RfWV9USUxFRF9HRU4xMl9S
Q19DQ1MgZm91cmNjX21vZF9jb2RlKElOVEVMLCA2KQo+ICsKPiAgLyoKPiAgICogVGlsZWQsIE5W
MTJNVCwgZ3JvdXBlZCBpbiA2NCAocGl4ZWxzKSB4IDMyIChsaW5lcykgLXNpemVkIG1hY3JvYmxv
Y2tzCj4gICAqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
