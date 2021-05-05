Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DF73734FD
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 08:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB1F6E427;
	Wed,  5 May 2021 06:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A976E252;
 Wed,  5 May 2021 06:33:05 +0000 (UTC)
IronPort-SDR: 10aLeruTZJdhaK19ZPU9t9RO0u7FSMSGM1ijfTp1FcJ9j6m0RXYlBAD1s+ew9J6FYYvyKzlMrv
 cZ21ph17llLQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="198201753"
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; d="scan'208";a="198201753"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 23:33:04 -0700
IronPort-SDR: /nspZ60y87dXV5HZ9VrAkfjSFIeGwahmc/Hk44SXbKb9a4PJc8wW0uFcne9a0Rj3CtebkdTytN
 fnjKfZZIptkQ==
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; d="scan'208";a="433662449"
Received: from weberral-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.249.45.238])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 23:33:01 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH] i915: Increase *_latency array size
In-Reply-To: <20210505033737.1282652-1-ak@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210505033737.1282652-1-ak@linux.intel.com>
Date: Wed, 05 May 2021 09:32:58 +0300
Message-ID: <87r1ily9k5.fsf@intel.com>
MIME-Version: 1.0
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Kleen <andi@firstfloor.org>,
 rodrigo.vivi@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAwNCBNYXkgMjAyMSwgQW5kaSBLbGVlbiA8YWtAbGludXguaW50ZWwuY29tPiB3cm90
ZToKPiBGcm9tOiBBbmRpIEtsZWVuIDxhbmRpQGZpcnN0Zmxvb3Iub3JnPgo+Cj4gTmV3ZXIgZ2Nj
IHByaW50cyB0aGUgZm9sbG93aW5nIHdhcm5pbmc6Cj4KPiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9p
bnRlbF9wbS5jOjMwNTc6OTogd2FybmluZzog4oCYaW50ZWxfcHJpbnRfd21fbGF0ZW5jeeKAmSBy
ZWFkaW5nIDE2IGJ5dGVzIGZyb20gYSByZWdpb24gb2Ygc2l6ZSAxMCBbLVdzdHJpbmdvcC1vdmVy
cmVhZF0KPiBhbmQgc29tZSBvdGhlciByZWxhdGVkIHdhcm5pbmdzIGluIHNpbWlsYXIgZnVuY3Rp
b25zLgo+Cj4gZ2NjIGhhcyBhIHBvaW50IGhlcmUuIFNvbWUgb2YgdGhlIGxhdGVuY3kgYXJyYXlz
IG9ubHkgaGF2ZSA1IG1lbWJlcnMsCj4gYnV0IHByaW50X3dtX2xhdGVuY3kgbWF5IHJlYWQgdXAg
dG8gbWF4X2xldmVsIHJldHVybmVkIGJ5IGlsa193bV9tYXhfbGV2ZWwsCj4gd2hpY2ggY2FuIGJl
IHVwdG8gNyBmb3IgdGhlID49IEdFTjkgY2FzZS4KPgo+IFNvIGl0IHdpbGwgcmVhZCBzb21lIGZp
ZWxkcyBiZXlvbmQgdGhlIGFycmF5Lgo+Cj4gSW5jcmVhc2UgYWxsIHRoZSBsYXRlbmN5IGZpZWxk
cyB0byA4IG1lbWJlcnMsIHdoaWNoIGlzIGVub3VnaCBmb3IgU0tMLgo+Cj4gSSBkb24ndCBrbm93
IGlmIHRoZXkgYXJlIGNvcnJlY3RseSBpbml0aWFsaXplZCB1cHRvIDgsIGJ1dCBkZXZfcHJpdgo+
IHNob3VsZCBzdGFydCBvdXQgYXMgemVybywgc28gcHJlc3VtYWJseSB0aGV5IHdpbGwgYmUgemVy
by4KClRoYW5rcywgdGhlIHdhcm5pbmcgc2hvdWxkIGJlIGZpeGVkIGJ5IGNvbW1pdAoKYzZkZWI1
ZTk3ZGVkICgiZHJtL2k5MTUvcG06IE1ha2UgdGhlIHdtIHBhcmFtZXRlciBvZiBwcmludF93bV9s
YXRlbmN5IGEgcG9pbnRlciIpCgppbiBkcm0taW50ZWwtbmV4dC4KClRoZXJlIGRvZXNuJ3QgYWN0
dWFsbHkgc2VlbSB0byBiZSBhIGJ1ZyBoZXJlLCBidXQgSSB3b25kZXIgaWYgd2Ugc2hvdWxkCnNl
bmQgdGhhdCB0byBzdGFibGUgb3IgdjUuMTMtcmMxKyBhbnl3YXkgdG8gc3RvcCBwZW9wbGUgc3Bl
bmRpbmcgdGltZSBvbgp0aGUgc2FtZSBpc3N1ZS4KCkJSLApKYW5pLgoKPgo+IFNpZ25lZC1vZmYt
Ynk6IEFuZGkgS2xlZW4gPGFuZGlAZmlyc3RmbG9vci5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTVfZHJ2LmggfCA2ICsrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2k5MTVfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oCj4gaW5k
ZXggY2I2MmRkYmEyMDM1Li5jODBhZGQ1ZjZkMzMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV9kcnYuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2
LmgKPiBAQCAtMTA5NSwxMSArMTA5NSwxMSBAQCBzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSB7Cj4g
IAkJICogaW4gMC41dXMgdW5pdHMgZm9yIFdNMSsuCj4gIAkJICovCj4gIAkJLyogcHJpbWFyeSAq
Lwo+IC0JCXUxNiBwcmlfbGF0ZW5jeVs1XTsKPiArCQl1MTYgcHJpX2xhdGVuY3lbOF07Cj4gIAkJ
Lyogc3ByaXRlICovCj4gLQkJdTE2IHNwcl9sYXRlbmN5WzVdOwo+ICsJCXUxNiBzcHJfbGF0ZW5j
eVs4XTsKPiAgCQkvKiBjdXJzb3IgKi8KPiAtCQl1MTYgY3VyX2xhdGVuY3lbNV07Cj4gKwkJdTE2
IGN1cl9sYXRlbmN5WzhdOwo+ICAJCS8qCj4gIAkJICogUmF3IHdhdGVybWFyayBtZW1vcnkgbGF0
ZW5jeSB2YWx1ZXMKPiAgCQkgKiBmb3IgU0tMIGZvciBhbGwgOCBsZXZlbHMKCi0tIApKYW5pIE5p
a3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
