Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21777269078
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 17:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB636E51D;
	Mon, 14 Sep 2020 15:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id B63D36E51D;
 Mon, 14 Sep 2020 15:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 21DB22A6042;
 Mon, 14 Sep 2020 17:44:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 8sDrs4Sr8jNy; Mon, 14 Sep 2020 17:44:31 +0200 (CEST)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id A7E942A6016;
 Mon, 14 Sep 2020 17:44:31 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1kHqed-000aE6-7u; Mon, 14 Sep 2020 17:44:31 +0200
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Harry Wentland <hwentlan@amd.com>
References: <20200821165758.1106210-1-michel@daenzer.net>
 <20200904104304.41246-1-michel@daenzer.net>
 <20200907075716.GO2352366@phenom.ffwll.local>
 <d0c95272-9a1c-f9f0-f1b9-4e7ce1f319c7@daenzer.net>
 <c64d591b-8f3c-5384-f103-3283bcf15c9d@amd.com>
 <2c090b33-2709-1f83-41ec-56fc5cc9e2ce@daenzer.net>
 <26ce07b5-d225-547d-cec6-b2f87bdd9f12@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH v2] drm/amdgpu/dc: Require primary plane to be enabled
 whenever the CRTC is
Message-ID: <6fe69e5e-853a-0ea4-8ef7-0754bc25e43d@daenzer.net>
Date: Mon, 14 Sep 2020 17:44:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <26ce07b5-d225-547d-cec6-b2f87bdd9f12@amd.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wOS0xNCA1OjMzIHAubS4sIEthemxhdXNrYXMsIE5pY2hvbGFzIHdyb3RlOgo+IE9u
IDIwMjAtMDktMTQgMTE6MjIgYS5tLiwgTWljaGVsIETDpG56ZXIgd3JvdGU6Cj4+IE9uIDIwMjAt
MDktMTQgNDozNyBwLm0uLCBLYXpsYXVza2FzLCBOaWNob2xhcyB3cm90ZToKPj4+IE9uIDIwMjAt
MDktMTQgMzo1MiBhLm0uLCBNaWNoZWwgRMOkbnplciB3cm90ZToKPj4+Pgo+Pj4+IFAuUy4gU2lu
Y2UgRENOIGRvZXNuJ3QgbWFrZSBhIGRpc3RpbmN0aW9uIGJldHdlZW4gcHJpbWFyeSBvciBvdmVy
bGF5IAo+Pj4+IHBsYW5lcyBpbiBoYXJkd2FyZSwgY291bGQgQ2hyb21pdW1PUyBhY2hpZXZlIHRo
ZSBzYW1lIGVmZmVjdCB3aXRoIAo+Pj4+IG9ubHkgdGhlIHByaW1hcnkgcGxhbmUgaW5zdGVhZCBv
ZiBvbmx5IGFuIG92ZXJsYXkgcGxhbmU/IElmIHNvLCAKPj4+PiBtYXliZSB0aGVyZSdzIG5vIG5l
ZWQgZm9yIHRoZSAiYmxhY2sgcGxhbmUgaGFjayIuCj4+Pj4KPj4+Pgo+Pj4KPj4+IEkgb25seSBr
bm93IHRoYXQgYXRvbWljdGVzdCB0cmllcyB0byBlbmFibGUgdGhpcyBjb25maWd1cmF0aW9uLiBO
b3QgCj4+PiBzdXJlIGlmIENocm9taXVtT1Mgb3Igb3RoZXIgInJlYWwiIHVzZXJzcGFjZSB0cmll
cyB0aGlzIGNvbmZpZ3VyYXRpb24uCj4+Cj4+IFNvbWVvbmUgbWVudGlvbmVkIHRoYXQgQ2hyb21p
dW1PUyB1c2VzIHRoaXMgZm9yIHZpZGVvIHBsYXliYWNrIHdpdGggCj4+IGJsYWNrIGJhcnMgKHdo
ZW4gdGhlIHZpZGVvIGFzcGVjdCByYXRpbyBkb2Vzbid0IG1hdGNoIHRoZSBkaXNwbGF5J3MpLgo+
IAo+IFdlIG9ubHkgZXhwb3NlIHN1cHBvcnQgZm9yIE5WMTIgb24gdGhlIHByaW1hcnkgcGxhbmUg
c28gd2Ugd291bGRuJ3QgYmUgCj4gaGl0dGluZyB0aGlzIGNhc2UgYXQgbGVhc3QuCgpJbnRlcmVz
dGluZywgc28gaWYgd2UncmUgbHVja3kgdGhpcyByZWFsbHkgd29uJ3QgYWZmZWN0IGFueSByZWFs
LXdvcmxkIGFwcHMuCgoKPj4+IFdlIGNhbiBhbHdheXMgZ28gYmFjayB0byBseWluZyB0byB1c2Vy
c3BhY2UgYWJvdXQgdGhlIGN1cnNvciBiZWluZwo+Pj4gdmlzaWJsZSBpZiB0aGUgY29tbWl0IGZh
aWxzIGluIHRoYXQgY2FzZSBJIGd1ZXNzIFsuLi5dCj4+Cj4+IEknbSBub3Qgc3VyZSB3aGF0IHlv
dSBtZWFuIGJ5IHRoYXQgLyBob3cgaXQgY291bGQgd29yay4KPiAKPiBEcm9wcGluZyB0aGUgY2hl
Y2sgeW91IGFkZGVkIGluIHRoaXMgcGF0Y2g6Cj4gCj4gK8KgwqDCoCBpZiAoc3RhdGUtPmVuYWJs
ZSAmJgo+ICvCoMKgwqDCoMKgwqDCoCAhKHN0YXRlLT5wbGFuZV9tYXNrICYgZHJtX3BsYW5lX21h
c2soY3J0Yy0+cHJpbWFyeSkpKQo+ICDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+
IAo+IFRoYXQgd2F5IHdlIGNhbiBzdGlsbCBhbGxvdyB0aGUgY3Vyc29yIHBsYW5lIHRvIGJlIGVu
YWJsZWQgd2hpbGUgCj4gcHJpbWFyeS9vdmVybGF5IGFyZSBub3QsIGl0J3MganVzdCBub3QgZ29p
bmcgdG8gYmUgYWN0dWFsbHkgdmlzaWJsZSBvbiAKPiB0aGUgc2NyZWVuLiBJdCdsbCBmYWlsIHNv
bWUgSUdUIHRlc3RzIGJ1dCBub3RoaW5nIHJlYWxseSB1c2VzIHRoaXMgCj4gY29uZmlndXJhdGlv
biBhcyBtb3JlIHRoYW4ganVzdCBhIHRlbXBvcmFyeSBzdGF0ZS4KCkFzIERhbmllbCBwb2ludGVk
IG91dCBpbiA8MjAyMDA5MDEwNzU0MzIuR1cyMzUyMzY2QHBoZW5vbS5mZndsbC5sb2NhbD4gCmlu
IHRoZSB2MSBwYXRjaCB0aHJlYWQsIHRoYXQgd29uJ3QgZmx5LCBzaW5jZSBhdG9taWMgdXNlcnNw
YWNlIGNhbiAKbGVnaXRpbWF0ZWx5IGV4cGVjdCB0aGUgY3Vyc29yIHBsYW5lIHRvIGJlIHZpc2li
bGUgaW4gdGhhdCBjYXNlLgoKCi0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAgICAg
ICAgICB8ICAgICAgICAgICAgICAgaHR0cHM6Ly9yZWRoYXQuY29tCkxpYnJlIHNvZnR3YXJlIGVu
dGh1c2lhc3QgICAgICAgICAgICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3Blcgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
