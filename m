Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C9C1A96E
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2019 22:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B2589A83;
	Sat, 11 May 2019 20:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984B489A83
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2019 20:36:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A74C12B6;
 Sat, 11 May 2019 22:36:27 +0200 (CEST)
Date: Sat, 11 May 2019 23:36:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH/RFC 04/15] drm: bridge: Add dual_link field to the
 drm_bridge_timings structure
Message-ID: <20190511203611.GP13043@pendragon.ideasonboard.com>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190306232345.23052-5-laurent.pinchart+renesas@ideasonboard.com>
 <eed9204e-a54e-98d8-99f0-cdc8675704e1@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eed9204e-a54e-98d8-99f0-cdc8675704e1@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1557606987;
 bh=SbZkJJ8vo4OmG062o90zpWv9Wbc8FQI5/YgNhE98pMQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iQxFzWoN6xY9ohSfoGcSlnwE3CDwK+P0KddF3kjK5HNoQtSoXRYa3YjtYy1D2RMFf
 NYRjDGlkwihsVrK5piWG6pqldDZZ05MHFNTIoHCaUG2rX+GHcLb+HHw6GJMbp/0U7a
 JsyGMBt/js4301y2fBXWPMN5YrW8LahIq3Zc7g9Y=
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
Cc: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS2llcmFuLAoKT24gV2VkLCBBcHIgMjQsIDIwMTkgYXQgMDk6MTI6NDhBTSArMDEwMCwgS2ll
cmFuIEJpbmdoYW0gd3JvdGU6Cj4gT24gMDYvMDMvMjAxOSAyMzoyMywgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiA+IEV4dGVuZCB0aGUgZHJtX2JyaWRnZV90aW1pbmdzIHN0cnVjdHVyZSB3aXRo
IGEgbmV3IGR1YWxfbGluayBmaWVsZCB0bwo+ID4gaW5kaWNhdGUgdGhhdCB0aGUgYnJpZGdlJ3Mg
aW5wdXQgYnVzIGNhcnJpZXMgZGF0YSBvbiB0d28gc2VwYXJhdGUKPiA+IHBoeXNpY2FsIGxpbmtz
LiBUaGUgZmlyc3QgdXNlIGNhc2UgaXMgTFZEUyBkdWFsLWxpbmsgbW9kZSB3aGVyZSBldmVuLQo+
ID4gYW5kIG9kZC1udW1iZXJlZCBwaXhlbHMgYXJlIHRyYW5zZmVycmVkIG9uIHNlcGFyYXRlIExW
RFMgbGlua3MuCj4gCj4gRG8geW91IGZvcmVzZWUgdGhpcyBiZWNvbWluZyBhIGJpdGZpZWxkIGlu
IHRoZSBmdXR1cmUgaWYgdGhlcmUgYXJlIG1vcmUKPiBvcHRpb25zPwo+IAo+IEkgZG9uJ3QgdGhp
bmsgdGhhdCBhZmZlY3RzIHRoaXMgcmlnaHQgbm93IHRob3VnaCwgYW5kIGl0J3MgZmluZSBhcyBh
IGJvb2wuCgpJIGRvbid0IGtub3cgeWV0LiBNYXliZSB3ZSdsbCBjb21iaW5lIHRoaXMgd2l0aCBv
dGhlciBmbGFncywgbWF5YmUgbm90LgpJdCdzIGEgYml0IG9mIGEgYWQtaG9jIHBhcmFtZXRlciwg
aWYvd2hlbiBvdGhlciBsaW5rIHR5cGVzIHJlcXVpcmUgYQpzaW1pbGFyIGZlYXR1cmUsIHdlJ2xs
IGxpa2VseSByZWZhY3RvciB0aGlzLgoKPiA+IFNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hh
cnQgPGxhdXJlbnQucGluY2hhcnQrcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgo+IAo+IFJldmll
d2VkLWJ5OiBLaWVyYW4gQmluZ2hhbSA8a2llcmFuLmJpbmdoYW0rcmVuZXNhc0BpZGVhc29uYm9h
cmQuY29tPgo+IAo+ID4gLS0tCj4gPiAgaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oIHwgOCArKysr
KysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaCBiL2luY2x1ZGUvZHJtL2RybV9icmlkZ2Uu
aAo+ID4gaW5kZXggZDQ0Mjg5MTNhNGUxLi5hZWExZmNmZDkyYTcgMTAwNjQ0Cj4gPiAtLS0gYS9p
bmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKPiA+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9icmlkZ2Uu
aAo+ID4gQEAgLTI2NSw2ICsyNjUsMTQgQEAgc3RydWN0IGRybV9icmlkZ2VfdGltaW5ncyB7Cj4g
PiAgCSAqIGlucHV0IHNpZ25hbCBhZnRlciB0aGUgY2xvY2sgZWRnZS4KPiA+ICAJICovCj4gPiAg
CXUzMiBob2xkX3RpbWVfcHM7Cj4gPiArCS8qKgo+ID4gKwkgKiBAZHVhbF9saW5rOgo+ID4gKwkg
Kgo+ID4gKwkgKiBUcnVlIGlmIHRoZSBidXMgb3BlcmF0ZXMgaW4gZHVhbC1saW5rIG1vZGUuIFRo
ZSBleGFjdCBtZWFuaW5nIGlzCj4gPiArCSAqIGRlcGVuZGVudCBvbiB0aGUgYnVzIHR5cGUuIEZv
ciBMVkRTIGJ1c2VzLCB0aGlzIGluZGljYXRlcyB0aGF0IGV2ZW4tCj4gPiArCSAqIGFuZCBvZGQt
bnVtYmVyZWQgcGl4ZWxzIGFyZSByZWNlaXZlZCBvbiBzZXBhcmF0ZSBsaW5rcy4KPiA+ICsJICov
Cj4gPiArCWJvb2wgZHVhbF9saW5rOwo+ID4gIH07Cj4gPiAgCj4gPiAgLyoqCgotLSAKUmVnYXJk
cywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
