Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83954D29D8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 14:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602B26E262;
	Thu, 10 Oct 2019 12:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B1F6E262
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 12:46:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Oct 2019 05:46:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,280,1566889200"; d="scan'208";a="184400005"
Received: from pashteka-mobl.ger.corp.intel.com (HELO [10.252.41.207])
 ([10.252.41.207])
 by orsmga007.jf.intel.com with ESMTP; 10 Oct 2019 05:46:27 -0700
Subject: Re: [PATCH] drm/plane: Clarify our expectations for src/dst rectangles
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20191010112918.15724-1-maarten.lankhorst@linux.intel.com>
 <20191010123624.GD1208@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <8c14f6fc-d6d6-9bad-9fe7-cab119e2fec2@linux.intel.com>
Date: Thu, 10 Oct 2019 14:46:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191010123624.GD1208@intel.com>
Content-Language: en-US
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3AgMTAtMTAtMjAxOSBvbSAxNDozNiBzY2hyZWVmIFZpbGxlIFN5cmrDpGzDpDoKPiBPbiBUaHUs
IE9jdCAxMCwgMjAxOSBhdCAwMToyOToxN1BNICswMjAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToKPj4gVGhlIHJlY3RhbmdsZXMgYXJlIHVzdWFsbHkgY2xpcHBlZCwgYnV0IGl0IGNhbiBiZSB1
c2VmdWwgdG8gaGF2ZQo+PiB0aGVtIHVuY2xpcHBlZCwgZm9yIGV4YW1wbGUgZm9yIGN1cnNvciBw
bGFuZXMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxh
bmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4+IC0tLQo+PiAgaW5jbHVkZS9kcm0vZHJtX3BsYW5l
LmggfCAyMiArKysrKysrKysrKysrKysrKysrKy0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
L2RybV9wbGFuZS5oIGIvaW5jbHVkZS9kcm0vZHJtX3BsYW5lLmgKPj4gaW5kZXggY2Q1OTAzYWQz
M2Y3Li45NGJiYmYyMTUxMDAgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9wbGFuZS5o
Cj4+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9wbGFuZS5oCj4+IEBAIC0xODMsOCArMTgzLDI2IEBA
IHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgewo+PiAgCSAqLwo+PiAgCXN0cnVjdCBkcm1fcHJvcGVy
dHlfYmxvYiAqZmJfZGFtYWdlX2NsaXBzOwo+PiAgCj4+IC0JLyoqIEBzcmM6IGNsaXBwZWQgc291
cmNlIGNvb3JkaW5hdGVzIG9mIHRoZSBwbGFuZSAoaW4gMTYuMTYpICovCj4+IC0JLyoqIEBkc3Q6
IGNsaXBwZWQgZGVzdGluYXRpb24gY29vcmRpbmF0ZXMgb2YgdGhlIHBsYW5lICovCj4+ICsJLyoq
Cj4+ICsJICogQHNyYzoKPj4gKwkgKgo+PiArCSAqIHNvdXJjZSBjb29yZGluYXRlcyBvZiB0aGUg
cGxhbmUgKGluIDE2LjE2KS4KPj4gKwkgKgo+PiArCSAqIFdoZW4gdXNpbmcgZHJtX2F0b21pY19o
ZWxwZXJfY2hlY2tfcGxhbmVfc3RhdGUoKSwKPj4gKwkgKiB0aGUgY29vcmRpbmF0ZXMgYXJlIGNs
aXBwZWQsIGJ1dCB0aGUgZHJpdmVyIG1heSBjaG9vc2UKPj4gKwkgKiB0byB1c2UgdW5jbGlwcGVk
IGNvb3JkaW5hdGVzIGluc3RlYWQuCj4+ICsJICoKPj4gKwkgKiBUaGlzIGNhbiBiZSB1c2VmdWwg
d2hlbiB1c2luZyBhIGhhcmRjb2RlZCBzaXplIGluIGEgY3Vyc29yIHBsYW5lLgo+IEkgd291bGQg
aW5zdGVhZCBzYXkgc29tZXRoaW5nIGxpa2UgIndoZW4gdGhlIGhhcmR3YXJlIHBlcmZvcm1zCj4g
dGhlIGNsaXBwaW5nIGF1dG9tYWdpY2FsbHkiLgoKCldpdGggdGhhdCBmaXhlZCwgci1iPwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
