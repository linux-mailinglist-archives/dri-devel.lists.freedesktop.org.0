Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F13B1008
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 15:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477E16ED60;
	Thu, 12 Sep 2019 13:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39E56ED60;
 Thu, 12 Sep 2019 13:33:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Sep 2019 06:33:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; d="scan'208";a="360457749"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.251.95.218])
 by orsmga005.jf.intel.com with ESMTP; 12 Sep 2019 06:33:13 -0700
MIME-Version: 1.0
To: Dave Airlie <airlied@gmail.com>, Matthew Auld <matthew.auld@intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
In-Reply-To: <CAPM=9tzCOmRNGKjJ1K+VUWLNK5kvJFRSqLABnGxafxgPWfTM5w@mail.gmail.com>
References: <20190809222643.23142-1-matthew.auld@intel.com>
 <CAPM=9tzCOmRNGKjJ1K+VUWLNK5kvJFRSqLABnGxafxgPWfTM5w@mail.gmail.com>
Message-ID: <156829519246.7396.15397531126017115428@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.7
Subject: Re: [Intel-gfx] [PATCH v3 00/37] Introduce memory region concept
 (including device local memory)
Date: Thu, 12 Sep 2019 16:33:12 +0300
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBEYXZlIEFpcmxpZSAoMjAxOS0wOC0xMyAyMjoyMDo1MikKPiBPbiBTYXQsIDEwIEF1
ZyAyMDE5IGF0IDA4OjI2LCBNYXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+IHdy
b3RlOgo+ID4KPiA+IEluIHByZXBhcmF0aW9uIGZvciB1cGNvbWluZyBkZXZpY2VzIHdpdGggZGV2
aWNlIGxvY2FsIG1lbW9yeSwgaW50cm9kdWNlIHRoZQo+ID4gY29uY2VwdCBvZiBkaWZmZXJlbnQg
bWVtb3J5IHJlZ2lvbnMsIGFuZCBhIHNpbXBsZSBidWRkeSBhbGxvY2F0b3IgdG8gbWFuYWdlCj4g
PiB0aGVtIGluIGk5MTUuCj4gPgo+ID4gT25lIG9mIHRoZSBjb25jZXJucyByYWlzZWQgZnJvbSB2
MSB3YXMgYXJvdW5kIG5vdCB1c2luZyBlbm91Z2ggb2YgVFRNLCB3aGljaCBpcwo+ID4gYSBmYWly
IGNyaXRpY2lzbSwgc28gdHJ5aW5nIHRvIGdldCBiZXR0ZXIgYWxpZ25tZW50IGhlcmUgaXMgc29t
ZXRoaW5nIHdlIGFyZQo+ID4gaW52ZXN0aWdhdGluZywgdGhvdWdoIGN1cnJlbnRseSB0aGF0IGlz
IHN0aWxsIFdJUCBzbyBpbiB0aGUgbWVhbnRpbWUgdjMgc3RpbGwKPiA+IGNvbnRpbnVlcyB0byBw
dXNoIG1vcmUgb2YgdGhlIGxvdy1sZXZlbCBkZXRhaWxzIGZvcndhcmQsIGJ1dCBub3QgeWV0IHRo
ZSBUVE0KPiA+IGludGVyYWN0aW9ucy4KPiAKPiBDYW4gd2UgYnVtcCB0aGUgVFRNIHdvcmsgdXAg
dGhlIGxhZGRlciBoZXJlLCBhcyBpcyBJJ20gbm90IHdpbGxpbmcgdG8KPiBhY2NlcHQgYW55IG9m
IHRoaXMgY29kZSB1cHN0cmVhbSB3aXRob3V0IHNvbWUgc2VyaW91cyBhbmFseXNpcywgdGhpcwo+
IGlzbid0IGEgY2FzZSBvZiBtZSBtYWtpbmcgYSBuaWNlIHN1Z2dlc3Rpb24gYW5kIHlvdSBoYXZp
bmcgdGhlIG9wdGlvbgo+IHRvIGlnbm9yZSBpdC4gRG9uJ3QgbWFrZSBtZSBzaG91dC4KClRoYW5r
cyBmb3IgYSByZW1pbmRlci4gVFRNIGFuYWx5c2lzIHdhcyBvbmdvaW5nIG9uIHRoZSBiYWNrZ3Jv
dW5kCmFuZCB3ZSBub3cgcmVzZXJ2ZWQgZW5vdWdoIHRpbWUgdG8gY29uY2x1ZGUgb24gaG93IHRv
IGJlc3QgYWxpZ24Kd2l0aCBUVE0gaW4gc2hvcnQtdGVybSBhbmQgbG9uZy10ZXJtLgoKV2UgZGVj
aWRlZCB0byBiaXRlIHRoZSBidWxsZXQgYW5kIGFwcGx5IGRtYV9yZXN2IGFzIHRoZSBvdXRlci1t
b3N0CmxvY2tpbmcgaW4gaTkxNSBjb2RlcGF0aHMgdG8gYWxpZ24gd2l0aCB0aGUgVFRNIGxvY2tp
bmcuIEFzIGEKY29uY2x1c2lvbiB0byB0aG9zZSBkaXNjdXNzaW9ucyB3ZSBkb2N1bWVudGVkIGd1
aWRlbGluZXMgaG93IHRvCmFsaWduIHdpdGggVFRNIGxvY2tpbmc6CgpodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzI4MjY2LwoKQXMgcmVmYWN0b3Jpbmcgb2YgbG9ja2lu
ZyBmdW5kYW1lbnRhbHMgb2YgdGhlIGRyaXZlciBpcyBhIG1hc3NpdmUKdW5kZXJnb2luZyB3aXRo
IG1hbnkgb3BlbnMgYWxvbmcgdGhlIHBhdGgsIHdlJ2QgbGlrZSB0byBwcm9wb3NlIGEKc3RhZ2Vk
IGFwcHJvYWNoIHRvIGF2b2lkIHN0YWxsaW5nIHRoZSB1cHN0cmVhbSB3b3JrIHdoaWxlIGl0J3MK
YmVpbmcgZG9uZS4KCk91ciBmaXJzdCBzdWdnZXN0ZWQgc3RlcCB3b3VsZCBiZSBtZXJnaW5nIHRo
ZSBpOTE1IGxvY2FsIG1lbW9yeQpyZWxhdGVkIGludGVybmFsIGNvZGUgcmV3b3JrcyB0byB1bmJs
b2NrIHRoZSBkaXNwbGF5IHdvcmsuIFRoaXMKc3RlcCBzaG91bGQgbm90IGNhdXNlIGFueSBjb25m
bGljdHMgd2l0aCBUVE0uCgpGb2xsb3dpbmcgc3RlcCB3b3VsZCBiZSB0byBtZXJnZSBwcm9wb3Nl
ZCBtZW1vcnkgYWxsb2NhdGlvbi8KbWFuYWdlbWVudCB1QVBJcyB3aXRoIFRUTSByZWxhdGVkIGZ1
bmN0aW9uYWxpdHkgYmVoaW5kIHRoZW0gZm9yCmVhcmx5IGRlYnVnLiBUaGV5IHdvdWxkIGJlIHBy
b3RlY3RlZCBieSBEUk1fSTkxNV9ERUJVR19FQVJMWV9BUEkKa2VybmVsIGNvbmZpZyBmbGFnIChk
ZXBlbmRpbmcgb24gRVhQRVJUICYgU1RBR0lORyAmIEJST0tFTikuCgpUaGlzIHdvdWxkIGFsbG93
IHVzIHRvIGtlZXAgZGVidWdnaW5nIHRoZXNlIG5ldyBJT0NUTHMgd2l0aCBNZXNhCmV0Yy4gd2hp
bGUgd2UgcmV3b3JrIHRoZSBsb2NraW5nLiBUaGUgcHJvdGVjdGlvbiBzdGlsbCBsZWF2aW5nIHVz
CmEgcG9zc2liaWxpdHkgdG8gY29ycmVjdGluZyB0aGUgdUFQSXMgaWYvd2hlbiB0aGVyZSBpcyBu
ZWVkIGFmdGVyCnJld29ya2luZyB0aGUgbG9ja2luZyBhcm91bmQgZG1hX3Jlc3YgcHJvZ3Jlc3Nl
cy4gRHJhZnQgb2Ygc3VjaApwcm9wb3NhbCBoZXJlOgoKaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3BhdGNoLzMyNzkwOC8KClRoZSBmaW5hbCBzdGVwIChhIHJhdGhlciBsb25nIG9u
ZSkgd291bGQgYmUgdGhlbiB0byBjb21wbGV0ZSB0aGUKbG9ja2luZyByZXdvcmsgaW4gdGhlIGRy
aXZlciBhbmQgbGlmdCB0aGUgREVCVUdfRUFSTFlfQVBJCnByb3RlY3Rpb24gb25jZSB0aGUgbG9j
a2luZyBoYXMgYmVlbiBzb3J0ZWQuCgpJZiB5b3UgY291bGQgY29uZmlybSB0aGUgYWJvdmUgcGxh
biBzb3VuZHMgcmVhc29uYWJsZSB0byB5b3UsIHdlCm1heSB0aGVuIHByb2NlZWQgd2l0aCBpdC4K
ClJlZ2FyZHMsIEpvb25hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
