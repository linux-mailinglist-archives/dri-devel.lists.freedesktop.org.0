Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F94134FDF3
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 12:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA936EA43;
	Wed, 31 Mar 2021 10:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF7486EA3F;
 Wed, 31 Mar 2021 10:21:20 +0000 (UTC)
IronPort-SDR: Rqof0yPQNxAOEV3Z5NFLgf0wiKxVy7r98SfszgPlOnfiMFt+Tm/2/nieuPQylYKI7JwysOkwRH
 J67uXdP+lHpQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="191453712"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="191453712"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 03:21:20 -0700
IronPort-SDR: kLih70asBiJXC30Ae2/AjGr5cgnD4BdX86yJbjg9ZGA0I/+Dy6DiD8Q3gXxspyBG72nVnF9QIZ
 ZMIHN30Mqg7A==
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="418603129"
Received: from ebilea-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.32.112])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 03:21:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [Intel-gfx] [PATCH v5 1/2] drm/dp_helper: Define options for FRL
 training for HDMI2.1 PCON
In-Reply-To: <20210326145937.wfyxm4harrdi43c3@gilmour>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210323112422.1211-1-ankit.k.nautiyal@intel.com>
 <20210323112422.1211-2-ankit.k.nautiyal@intel.com> <87a6qq2qlt.fsf@intel.com>
 <20210326145937.wfyxm4harrdi43c3@gilmour>
Date: Wed, 31 Mar 2021 13:21:14 +0300
Message-ID: <87h7kroc85.fsf@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyNiBNYXIgMjAyMSwgTWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRlY2g+IHdy
b3RlOgo+IEhpLAo+Cj4gT24gRnJpLCBNYXIgMjYsIDIwMjEgYXQgMTE6NDc6NThBTSArMDIwMCwg
SmFuaSBOaWt1bGEgd3JvdGU6Cj4+IE9uIFR1ZSwgMjMgTWFyIDIwMjEsIEFua2l0IE5hdXRpeWFs
IDxhbmtpdC5rLm5hdXRpeWFsQGludGVsLmNvbT4gd3JvdGU6Cj4+ID4gQ3VycmVudGx5IHRoZSBG
UkwgdHJhaW5pbmcgbW9kZSAoQ29uY3VycmVudCwgU2VxdWVudGlhbCkgYW5kCj4+ID4gdHJhaW5p
bmcgdHlwZSAoTm9ybWFsLCBFeHRlbmRlZCkgYXJlIG5vdCBkZWZpbmVkIHByb3Blcmx5IGFuZAo+
PiA+IGFyZSBwYXNzZWQgYXMgYm9vbCB2YWx1ZXMgaW4gZHJtX2hlbHBlcnMgZm9yIHBjb24KPj4g
PiBjb25maWd1cmF0aW9uIGZvciBGUkwgdHJhaW5pbmcuCj4+ID4KPj4gPiBUaGlzIHBhdGNoOgo+
PiA+IC1BZGQgcmVnaXN0ZXIgbWFza3MgZm9yIFNlcXVlbnRpYWwgYW5kIE5vcm1hbCBGUkwgdHJh
aW5pbmcgb3B0aW9ucy4KPj4gPiAtRml4ZXMgdGhlIGRybV9oZWxwZXJzIGZvciBGUkwgVHJhaW5p
bmcgY29uZmlndXJhdGlvbiB0byB1c2UgdGhlCj4+ID4gIGFwcHJvcHJpYXRlIG1hc2tzLgo+PiA+
IC1Nb2RpZmllcyB0aGUgY2FsbHMgdG8gdGhlIGFib3ZlIGRybV9oZWxwZXJzIGluIGk5MTUvaW50
ZWxfZHAgYXMgcGVyCj4+ID4gIHRoZSBhYm92ZSBjaGFuZ2UuCj4+ID4KPj4gPiB2MjogUmUtdXNl
ZCB0aGUgcmVnaXN0ZXIgbWFza3MgZm9yIHRoZXNlIG9wdGlvbnMsIGluc3RlYWQgb2YgZW51bS4g
KFZpbGxlKQo+PiA+Cj4+ID4gU2lnbmVkLW9mZi1ieTogQW5raXQgTmF1dGl5YWwgPGFua2l0Lmsu
bmF1dGl5YWxAaW50ZWwuY29tPgo+PiA+IFJldmlld2VkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+PiAKPj4gTWFhcnRlbiwgTWF4aW1lLCBUaG9t
YXMgLQo+PiAKPj4gQ2FuIEkgZ2V0IGFuIGFjayBmb3IgbWVyZ2luZyB0aGlzIHZpYSBkcm0taW50
ZWwtbmV4dCwgcGxlYXNlPwo+Cj4gSSB3YXMgaG9waW5nIHRoYXQgc29tZW9uZSB3aXRoIGVpdGhl
ciBpOTE1IG9yIERQIGtub3dsZWRnZSB3b3VsZAo+IGNvbW1lbnQsIGJ1dCB0aGUgcGF0Y2ggbG9v
a3MgZmluZSB0byBtZSwgeW91IGNhbiBnbyBhaGVhZCBJIGd1ZXNzIDopCgpUaGFua3MgZm9yIHRo
ZSBwYXRjaCwgcmV2aWV3LCBhbmQgYWNrLCBwdXNoZWQgdGhlIGxvdCB0byBkcm0taW50ZWwtbmV4
dC4KCkJSLApKYW5pLgoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGlj
cyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
