Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A6BE846A
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 10:27:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57336E181;
	Tue, 29 Oct 2019 09:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA856E195;
 Tue, 29 Oct 2019 09:27:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Oct 2019 02:27:25 -0700
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; d="scan'208";a="193549943"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Oct 2019 02:27:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH RESEND 6/8] drm/print: convert debug category
 macros into an enum
In-Reply-To: <157233975222.4967.10493169909668288037@jlahtine-desk.ger.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1572258935.git.jani.nikula@intel.com>
 <96582479e7829d92b89adb805f829e23043ca85c.1572258936.git.jani.nikula@intel.com>
 <157233975222.4967.10493169909668288037@jlahtine-desk.ger.corp.intel.com>
Date: Tue, 29 Oct 2019 11:27:20 +0200
Message-ID: <87d0efaolj.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyOSBPY3QgMjAxOSwgSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGlu
dXguaW50ZWwuY29tPiB3cm90ZToKPiBRdW90aW5nIEphbmkgTmlrdWxhICgyMDE5LTEwLTI4IDEy
OjM4OjIwKQo+PiBNb3N0bHkgZm9yIGltcHJvdmVkIGRvY3VtZW50YXRpb24sIGNvbnZlcnQgdGhl
IGRlYnVnIGNhdGVnb3J5IG1hY3Jvcwo+PiBpbnRvIGFuIGVudW0uIERyb3AgdW51c2VkIERSTV9V
VF9OT05FLiBEb2N1bWVudCBwcmV2aW91c2x5IHVuZG9jdW1lbnRlZAo+PiBjYXRlZ29yaWVzLgo+
PiAKPj4gU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4K
Pgo+IDxTTklQPgo+Cj4+ICtlbnVtIGRybV9kZWJ1Z19jYXRlZ29yeSB7Cj4+ICsgICAgICAgLyoq
Cj4+ICsgICAgICAgICogQERSTV9VVF9DT1JFOiBVc2VkIGluIHRoZSBnZW5lcmljIGRybSBjb2Rl
OiBkcm1faW9jdGwuYywgZHJtX21tLmMsCj4+ICsgICAgICAgICogZHJtX21lbW9yeS5jLCAuLi4K
Pj4gKyAgICAgICAgKi8KPj4gKyAgICAgICBEUk1fVVRfQ09SRSAgICAgICAgICAgICA9IDB4MDEs
Cj4KPiBXaGlsZSBoZXJlLCB3aHkgbm90IEJJVCgpCgpUaG91Z2h0IGFib3V0IGl0LCBidXQgc2lu
Y2UgdGhpcyBpcyB3aGF0IGZvbGtzIGxvb2sgYXQgd2hlbiBhZGRpbmcgdGhlCmRybS5kZWJ1ZyBt
b2R1bGUgcGFyYW1ldGVyLCBpdCdzIHBlcmhhcHMgZWFzaWVyIHRvIGNvbWJpbmUgdGhlIGhleAp2
YWx1ZXMgdGhhbiBqdXN0IHRoZSBiaXQgcG9zaXRpb25zPyAqc2hydWcqIENvdWxkIGdvIGVpdGhl
ciB3YXkuCgpCUiwKSmFuaS4KCgo+Cj4gUmV2aWV3ZWQtYnk6IEpvb25hcyBMYWh0aW5lbiA8am9v
bmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT4KPgo+IFJlZ2FyZHMsIEpvb25hcwoKLS0gCkph
bmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
