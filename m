Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC9C1BA55E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 15:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8A06E2D6;
	Mon, 27 Apr 2020 13:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E1B6E2D1;
 Mon, 27 Apr 2020 13:48:48 +0000 (UTC)
IronPort-SDR: UmbBYrB5pnh3VZadTIxb1z5TW7JijVw0pMSbvZ15kMz+sf6SuuDVHrT83lvgIouIlSkVTklwp5
 KberYFZVEc0Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 06:48:47 -0700
IronPort-SDR: s4oIVuVu3USfWnW80U/6zKOUmltoh8xzO52WmN/+qPMXyWhsz+Of1qcrWEQBhYSq2o6YbT/La6
 mPxnhwx3hxBg==
X-IronPort-AV: E=Sophos;i="5.73,324,1583222400"; d="scan'208";a="431781142"
Received: from mbrowarx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.47.15])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 06:48:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Guru Das Srinagesh <gurus@codeaurora.org>
Subject: Re: [PATCH v13 01/11] drm/i915: Use 64-bit division macro
In-Reply-To: <20200424221756.GB31118@codeaurora.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1587523702.git.gurus@codeaurora.org>
 <4a3acf8673c08308848fb7ae73d992b6feb758d3.1587523702.git.gurus@codeaurora.org>
 <87ftctbe5l.fsf@intel.com> <20200424221756.GB31118@codeaurora.org>
Date: Mon, 27 Apr 2020 16:48:39 +0300
Message-ID: <87y2qh9gzs.fsf@intel.com>
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
Cc: linux-pwm@vger.kernel.org, David Collins <collinsd@codeaurora.org>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyNCBBcHIgMjAyMCwgR3VydSBEYXMgU3JpbmFnZXNoIDxndXJ1c0Bjb2RlYXVyb3Jh
Lm9yZz4gd3JvdGU6Cj4gT24gRnJpLCBBcHIgMjQsIDIwMjAgYXQgMDk6MTc6NThBTSArMDMwMCwg
SmFuaSBOaWt1bGEgd3JvdGU6Cj4+IE9uIFR1ZSwgMjEgQXByIDIwMjAsIEd1cnUgRGFzIFNyaW5h
Z2VzaCA8Z3VydXNAY29kZWF1cm9yYS5vcmc+IHdyb3RlOgo+PiA+IFNpbmNlIHRoZSBQV00gZnJh
bWV3b3JrIGlzIHN3aXRjaGluZyBzdHJ1Y3QgcHdtX3N0YXRlLmR1dHlfY3ljbGUncwo+PiA+IGRh
dGF0eXBlIHRvIHU2NCwgcHJlcGFyZSBmb3IgdGhpcyB0cmFuc2l0aW9uIGJ5IHVzaW5nIERJVl9S
T1VORF9VUF9VTEwKPj4gPiB0byBoYW5kbGUgYSA2NC1iaXQgZGl2aWRlbmQuCj4+ID4KPj4gPiBU
bzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4KPj4gPiBDYzogSm9v
bmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tPgo+PiA+IENjOiBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KPj4gPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24u
Y28udWs+Cj4+ID4gQ2M6ICJWaWxsZSBTeXJqw6Rsw6QiIDx2aWxsZS5zeXJqYWxhQGxpbnV4Lmlu
dGVsLmNvbT4KPj4gPiBDYzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiA+IENj
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+ID4KPj4gCj4+IFN1cGVyZmx1b3Vz
IGJsYW5rIGxpbmUuCj4KPiBXaWxsIHJlbW92ZS4KPgo+PiAKPj4gQW55d2F5LCBwbGVhc2UgcHJl
c2VydmUgdGhlIGV4aXN0aW5nIGFja3MgYW5kIHJldmlld3MgWzFdIHNvIHBlb3BsZQo+PiBkb24n
dCBoYXZlIHRvIGRvIGl0IGFnYWluLgo+PiAKPj4gQlIsCj4+IEphbmkuCj4+IAo+PiBbMV0gaHR0
cDovL2xvcmUua2VybmVsLm9yZy9yLzg3aDd5bGViMGkuZnNmQGludGVsLmNvbQo+Cj4gSSBkcm9w
cGVkIHlvdXIgQWNrZWQtYnkgYXMgdGhlIHBhdGNoIGhhZCB0byBjaGFuZ2VkIHRvIHJlc29sdmUg
YSBtZXJnZQo+IGNvbmZsaWN0IHdoZW4gSSByZWJhc2VkIHRvIHRpcC4gQ291bGQgeW91IHBsZWFz
ZSByZS1yZXZpZXcgdGhpcyBwYXRjaD8KClJldmlld2VkLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5u
aWt1bGFAaW50ZWwuY29tPgpBY2tlZC1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVs
LmNvbT4KCgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRl
cgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
