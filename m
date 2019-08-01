Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6847D833
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 11:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14E66E423;
	Thu,  1 Aug 2019 09:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957106E41D;
 Thu,  1 Aug 2019 09:05:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Aug 2019 02:05:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,333,1559545200"; d="scan'208";a="191578020"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 01 Aug 2019 02:05:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm/panel: make drm_panel.h self-contained
In-Reply-To: <20190630081602.GB5081@ravnborg.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190627110103.7539-1-jani.nikula@intel.com>
 <20190630081602.GB5081@ravnborg.org>
Date: Thu, 01 Aug 2019 12:09:46 +0300
Message-ID: <87mugtmeud.fsf@intel.com>
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
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 intel-gfx@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAzMCBKdW4gMjAxOSwgU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPiB3cm90
ZToKPiBIaSBKYW5pLgo+Cj4gT24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMDI6MDE6MDNQTSArMDMw
MCwgSmFuaSBOaWt1bGEgd3JvdGU6Cj4+IEZpeCBidWlsZCB3YXJuaW5nIGlmIGRybV9wYW5lbC5o
IGlzIGJ1aWx0IHdpdGggQ09ORklHX09GPW4gb3IKPj4gQ09ORklHX0RSTV9QQU5FTD1uIGFuZCBp
bmNsdWRlZCB3aXRob3V0IHRoZSBwcmVyZXF1aXNpdGUgZXJyLmg6Cj4+IAo+PiAuL2luY2x1ZGUv
ZHJtL2RybV9wYW5lbC5oOiBJbiBmdW5jdGlvbiDigJhvZl9kcm1fZmluZF9wYW5lbOKAmToKPj4g
Li9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaDoyMDM6OTogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0
aW9uIG9mIGZ1bmN0aW9uIOKAmEVSUl9QVFLigJkgWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24t
ZGVjbGFyYXRpb25dCj4+ICAgcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7Cj4+ICAgICAgICAgIF5+
fn5+fn4KPj4gLi9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaDoyMDM6OTogZXJyb3I6IHJldHVybmlu
ZyDigJhpbnTigJkgZnJvbSBhIGZ1bmN0aW9uIHdpdGggcmV0dXJuIHR5cGUg4oCYc3RydWN0IGRy
bV9wYW5lbCAq4oCZIG1ha2VzIHBvaW50ZXIgZnJvbSBpbnRlZ2VyIHdpdGhvdXQgYSBjYXN0IFst
V2Vycm9yPWludC1jb252ZXJzaW9uXQo+PiAgIHJldHVybiBFUlJfUFRSKC1FTk9ERVYpOwo+PiAg
ICAgICAgICBefn5+fn5+fn5+fn5+fn5+Cj4+IAo+PiBGaXhlczogNWZhOGU0YTIyMTgyICgiZHJt
L3BhbmVsOiBNYWtlIG9mX2RybV9maW5kX3BhbmVsKCkgcmV0dXJuIGFuIEVSUl9QVFIoKSBpbnN0
ZWFkIG9mIE5VTEwiKQo+PiBDYzogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AYm9v
dGxpbi5jb20+Cj4+IENjOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+PiBT
aWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgo+IFJldmll
d2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4KPiBXaGVuIHdlIHN0YXJ0
IHRvIGRlcGxveSBoZWFkZXJzLXRlc3QgSSBleHBlY3QgdXMgdG8gZmluZCBtYW55IG1vcmUgb2YK
PiB0aGlzIGNsYXNzIG9mIGlzc3Vlcy4KPiBCdXQgbGV0cyBnZXQgdGhlbSBmaXhlZCBzbyB3ZSBk
byBub3Qgc2VlIHNwb3JhZGljIGJ1aWxkIGVycm9ycyBkdWUKPiB0byBtaXNzaW5nIGRlcGVuZGVu
Y2llcyBpbiB0aGUgaGVhZGVyIGZpbGVzLgo+Cj4gSSBhc3N1bWUgeW91IHdpbGwgY29tbWl0IHRo
ZSBmaXguCgpUaGFua3MgZm9yIHBpY2tpbmcgdXAgdGhlIGJhbGwgSSBkcm9wcGVkLCBhbmQgY29t
bWl0dGluZyB0aGlzIQoKQlIsCkphbmkuCgoKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBT
b3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
