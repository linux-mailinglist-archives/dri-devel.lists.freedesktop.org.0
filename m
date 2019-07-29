Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD28E78757
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 10:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B4189A76;
	Mon, 29 Jul 2019 08:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C4789A76
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 08:27:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jul 2019 01:22:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,322,1559545200"; d="scan'208";a="190497224"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 29 Jul 2019 01:22:06 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: OLED panel brightness support
In-Reply-To: <28D3097A-5295-4445-BD73-1A338EFA546D@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <28D3097A-5295-4445-BD73-1A338EFA546D@canonical.com>
Date: Mon, 29 Jul 2019 11:26:30 +0300
Message-ID: <87d0htp7pl.fsf@intel.com>
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
Cc: Anthony Wong <anthony.wong@canonical.com>,
 Mario Limonciello <mario.limonciello@dell.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMyBKdWwgMjAxOSwgS2FpLUhlbmcgRmVuZyA8a2FpLmhlbmcuZmVuZ0BjYW5vbmlj
YWwuY29tPiB3cm90ZToKPiBIaSwKPgo+IEN1cnJlbnRseSwgT0xFRCBwYW5lbCBicmlnaHRuZXNz
IFsxXSBpcyBub3Qgc3VwcG9ydGVkLgoKQXMgYSBnZW5lcmFsIHN0YXRlbWVudCB0aGlzIGlzIG5v
dCB0cnVlLCBhbmQgbm90IGJhY2tlZCB1cCBieSB0aGUKcmVmZXJlbmNlZCBidWcuIFdlIGp1c3Qg
ZG9uJ3Qga25vdyBob3cgYnJpZ2h0bmVzcyBpcyBjb250cm9sbGVkIG9uIHRoYXQKcGFydGljdWxh
ciBsYXB0b3AsIGJlY2F1c2UgaXQgYXBwYXJlbnRseSB1c2VzIGEgcHJvcGVyaWV0YXJ5IG1lY2hh
bmlzbS4KCklmIGl0IHVzZWQgdGhlIGJyaWdodG5lc3MgY29udHJvbCBtZWNoYW1pc20gc3BlY2lm
aWVkIGluIHRoZSBWRVNBIGVEUApzcGVjLCBpdCBzaG91bGQgd29yayBqdXN0IGZpbmUgd2l0aCB0
aGUgaTkxNSBhdXggYmFja2xpZ2h0IHN1cHBvcnQsIGFuZAp3ZSBzaG91bGQgYWxzbyBleHBvcnQg
dGhlIHJlZ3VsYXIgYmFja2xpZ2h0IHN5c2ZzIGZvciB0aGlzLgoKQlIsCkphbmkuCgoKPiBXZSBo
YXZlIGEgc2ltaWxhciBEZWxsIHN5c3RlbSB0aGF0IGFsc28gYWZmZWN0IGJ5IGxhY2sgb2YgT0xF
RCBicmlnaHRuZXNzICAKPiBzdXBwb3J0Lgo+Cj4gSeKAmXZlIGludmVzdGlnYXRlZCBib3RoIGtl
cm5lbCBhbmQgdXNlciBzcGFjZSBidXQgSSBoYXZlbuKAmXQgZm91bmQgYSBnb29kICAKPiBnZW5l
cmFsIHNvbHV0aW9uIHlldC4KPiBEZWxsIHN5c3RlbXMgdXNlIEVESUQgZGVzY3JpcHRvciA0IGFz
IERlbGwgc3BlY2lmaWMgZGVzY3JpcHRvciwgd2hpY2ggIAo+IHJlcG9ydHMgaXRzIHBhbmVsIHR5
cGUgYW5kIHdlIGNhbiBrbm93IGl04oCZcyBhbiBPTEVEIHBhbmVsIG9yIG5vdC4KPgo+IE15IGlu
aXRpYWwgdGhvdWdodCBpcyB0byBhZGQgYSBuZXcgYXR0cmlidXRlIOKAnG9sZWQiIGluIGRybV9z
eXNmcy5jIFsyXSB0byAgCj4gbGV0IHVzZXJzcGFjZSBsaWtlIGNsdXR0ZXIgWzNdIHRvIGNvbnRy
b2wgdGhlIGJyaWdodG5lc3MuCj4gSG93ZXZlciBvdGhlciBERXMgbWF5IG5lZWQgdG8gaW1wbGVt
ZW50IHRoZWlyIG93biBPTEVEIGJyaWdodG5lc3Mgc3VwcG9ydCAgCj4gd2hpY2ggaXNu4oCZdCBp
ZGVhbC4KPgo+IFNvIEnigJlkIGxpa2UgdG8ga25vdyBpZiB0aGVyZeKAmXMgYW55IGdvb2Qgd2F5
IHRvIHN1cHBvcnQgT0xFRCBicmlnaHRuZXNzIGluICAKPiBnb29kIG9sZCBiYWNrbGlnaHQgc3lz
ZnMsIHRvIGxldCB1c2Vyc3BhY2Uga2VlcCB0byB0aGUgY3VycmVudCBpbnRlcmZhY2UuCj4KPiBb
MV0gaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9OTc4ODMKPiBb
Ml0gaHR0cHM6Ly9wYXN0ZWJpbi51YnVudHUuY29tL3AvUVlyUkJwcFZUOS8KPiBbM10gIAo+IGh0
dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9jbHV0dGVyL2Jsb2IvbWFzdGVyL2NsdXR0ZXIv
Y2x1dHRlci1icmlnaHRuZXNzLWNvbnRyYXN0LWVmZmVjdC5jI0w1NTkKPgo+IEthaS1IZW5nCgot
LSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
