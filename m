Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 985DF26DE99
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 16:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE2B6EC27;
	Thu, 17 Sep 2020 14:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 84AC16EC27
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 14:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 5709A2A6042;
 Thu, 17 Sep 2020 16:44:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id Q4NW0xYCSMye; Thu, 17 Sep 2020 16:44:41 +0200 (CEST)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 0546C2A6016;
 Thu, 17 Sep 2020 16:44:41 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1kIv9M-001DnB-7M; Thu, 17 Sep 2020 16:44:40 +0200
To: christian.koenig@amd.com, =?UTF-8?Q?Thomas_Hellstr=c3=b6m?=
 <thomas.hellstrom@intel.com>, Daniel Vetter <daniel@ffwll.ch>
References: <fabf5079-6c39-7c8f-2973-5b32494f852a@gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: Why can't ttm_tt_swapout() handle uncached or WC BOs?
Message-ID: <5fb55684-c797-a104-253f-bf43634f0cec@daenzer.net>
Date: Thu, 17 Sep 2020 16:44:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <fabf5079-6c39-7c8f-2973-5b32494f852a@gmail.com>
Content-Language: en-CA
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wOS0xNyAyOjIwIHAubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gSGkgZ3V5
cywKPiAKPiBNaWNoZWwgb25jZSBzdWJtaXR0ZWQgYSBwYXRjaCB0byBmaXggdHJpZ2dlcmluZyB0
aGlzIEJVR19PTiBpbiAKPiB0dG1fdHRfc3dhcG91dCgpOgo+IAo+PiBCVUdfT04odHRtLT5jYWNo
aW5nX3N0YXRlICE9IHR0X2NhY2hlZCk7Cj4gCj4gTm93IG15IHF1ZXN0aW9uIGlzIGRvZXMgYW55
Ym9keSBrbm93IHdoeSB3ZSBoYXZlIHRoYXQgaW4gdGhlIGZpcnN0IHBsYWNlPwo+IAo+IFRoZSBv
bmx5IHByb2JsZW1hdGljIHRoaW5nIEkgY2FuIHNlZSBpcyBjYWxsaW5nIGNvcHlfaGlnaHBhZ2Uo
KSBhbmQgdGhhdCAKPiBvbmUgaXMganVzdCBkb2luZyBhIGttYXBfYXRvbWljKCkva3VubWFwX2F0
b21pYygpIG9uIHRoZSBzb3VyY2UgYW5kIAo+IGRlc3RpbmF0aW9uLgo+IAo+IEkgY2FuJ3Qgc2Vl
IHdoeSBpdCBzaG91bGQgYmUgcHJvYmxlbWF0aWMgZm9yIHRoaXMgdGVtcG9yYXJ5IG1hcHBpbmcg
dG8gCj4gYmUgY2FjaGVkIGluc3RlYWQgb2YgdW5jYWNoZWQgb3IgV0M/Cj4gCj4gRG9lcyBhbnli
b2R5IGhhcyBhbnkgaWRlYT8KCk9uZSB0aGluZyBpcyB0aGF0IEFGQUlLIHNvbWUgKEFSTT8pIENQ
VXMgY2FuIGdldCB2ZXJ5IHVwc2V0IHdoZW4gdGhlcmUncyAKYm90aCBhIGNhY2hlZCBhbmQgdW5j
YWNoZWFibGUgbWFwcGluZyBmb3IgdGhlIHNhbWUgcGh5c2ljYWwgcGFnZS4KCgotLSAKRWFydGhs
aW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgIGh0dHBzOi8v
cmVkaGF0LmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAg
ICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
