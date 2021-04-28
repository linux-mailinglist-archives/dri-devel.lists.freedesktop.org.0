Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2667736D499
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 11:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C13E6EAD8;
	Wed, 28 Apr 2021 09:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 387 seconds by postgrey-1.36 at gabe;
 Wed, 28 Apr 2021 09:13:39 UTC
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id BC7C86EAD8;
 Wed, 28 Apr 2021 09:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 74775202038;
 Wed, 28 Apr 2021 11:07:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id A5l0k2D_Vs5n; Wed, 28 Apr 2021 11:07:11 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 28A9220202F;
 Wed, 28 Apr 2021 11:07:11 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1lbgA1-001JU0-UY; Wed, 28 Apr 2021 11:07:09 +0200
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 Dave Airlie <airlied@gmail.com>
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rMn_gabTdZpHGQVa16Log8xFe8fvhcL_WSC6tyOMvmY=w@mail.gmail.com>
 <CAOFGe96c1SxHiUBzapbVFx1h0aOwF=X8hcStVZmrw4OjrrG+Zg@mail.gmail.com>
 <CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com>
 <CAKMK7uHyTiFWwQWdxVk1am+KoFA9DsTnJ658CAhzBYOyg7AdsA@mail.gmail.com>
 <CAPj87rM=qf78kUvys1irnR8Djh=CLjRdQJt1V4je82-=+yPWYw@mail.gmail.com>
 <CAKMK7uEAu4FgYwN9t9AMCqD2nVbkSRbGP3tST4nY1nKP26+vxA@mail.gmail.com>
 <CAPj87rOfv0w8jF4CO8PUHQXTfq+2GE=BDmRRWjOMkQ0wH3CPAA@mail.gmail.com>
 <CAAxE2A5pJ-D7AFbDJLKPDztr=yzOSDSm=3HrnJOWr3r96_KOQQ@mail.gmail.com>
 <YIfFC3YST0cfzd3l@phenom.ffwll.local>
 <CAAxE2A6APcJBwnbq58HOqc5bkHMsrzpiNnrso85kfBkRowwz+g@mail.gmail.com>
 <fada1543-612d-369e-765c-f90b718c2cfa@gmail.com>
 <CAPM=9tzz2u_qUXU9LMvtH_NDr1_wzunPo7Mt6NkrwAuowWTp7Q@mail.gmail.com>
 <CAAxE2A55Te6DjabYH8ELyfM03x2ZDaLsCsNC4Zqkrq0ExdpeHA@mail.gmail.com>
 <153487a3-082b-faf7-2a4d-ae15993b2a5d@gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
Message-ID: <d6fbc1a3-ee69-d53e-0a60-9a313be19cac@daenzer.net>
Date: Wed, 28 Apr 2021 11:07:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <153487a3-082b-faf7-2a4d-ae15993b2a5d@gmail.com>
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
Cc: ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMS0wNC0yOCA4OjU5IGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gSGkgRGF2
ZSwKPiAKPiBBbSAyNy4wNC4yMSB1bSAyMToyMyBzY2hyaWViIE1hcmVrIE9sxaHDoWs6Cj4+IFN1
cHBvcnRpbmcgaW50ZXJvcCB3aXRoIGFueSBkZXZpY2UgaXMgYWx3YXlzIHBvc3NpYmxlLiBJdCBk
ZXBlbmRzIG9uIHdoaWNoIGRyaXZlcnMgd2UgbmVlZCB0byBpbnRlcm9wZXJhdGUgd2l0aCBhbmQg
dXBkYXRlIHRoZW0uIFdlJ3ZlIGFscmVhZHkgZm91bmQgdGhlIHBhdGggZm9yd2FyZCBmb3IgYW1k
Z3B1LiBXZSBqdXN0IG5lZWQgdG8gZmluZCBvdXQgaG93IG1hbnkgb3RoZXIgZHJpdmVycyBuZWVk
IHRvIGJlIHVwZGF0ZWQgYW5kIGV2YWx1YXRlIHRoZSBjb3N0L2JlbmVmaXQgYXNwZWN0Lgo+Pgo+
PiBNYXJlawo+Pgo+PiBPbiBUdWUsIEFwciAyNywgMjAyMSBhdCAyOjM4IFBNIERhdmUgQWlybGll
IDxhaXJsaWVkQGdtYWlsLmNvbSA8bWFpbHRvOmFpcmxpZWRAZ21haWwuY29tPj4gd3JvdGU6Cj4+
Cj4+ICAgICBPbiBUdWUsIDI3IEFwciAyMDIxIGF0IDIyOjA2LCBDaHJpc3RpYW4gS8O2bmlnCj4+
ICAgICA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20gPG1haWx0bzpja29lbmlnLmxl
aWNodHp1bWVya2VuQGdtYWlsLmNvbT4+IHdyb3RlOgo+PiAgICAgPgo+PiAgICAgPiBDb3JyZWN0
LCB3ZSB3b3VsZG4ndCBoYXZlIHN5bmNocm9uaXphdGlvbiBiZXR3ZWVuIGRldmljZSB3aXRoIGFu
ZCB3aXRob3V0IHVzZXIgcXVldWVzIGFueSBtb3JlLgo+PiAgICAgPgo+PiAgICAgPiBUaGF0IGNv
dWxkIG9ubHkgYmUgYSBwcm9ibGVtIGZvciBBK0kgTGFwdG9wcy4KPj4KPj4gICAgIFNpbmNlIEkg
dGhpbmsgeW91IG1lbnRpb25lZCB5b3UnZCBvbmx5IGJlIGVuYWJsaW5nIHRoaXMgb24gbmV3ZXIK
Pj4gICAgIGNoaXBzZXRzLCB3b24ndCBpdCBiZSBhIHByb2JsZW0gZm9yIEErQSB3aGVyZSBvbmUg
QSBpcyBhIGdlbmVyYXRpb24KPj4gICAgIGJlaGluZCB0aGUgb3RoZXI/Cj4+Cj4gCj4gQ3JhcCwg
dGhhdCBpcyBhIGdvb2QgcG9pbnQgYXMgd2VsbC4KPiAKPj4KPj4gICAgIEknbSBub3QgcmVhbGx5
IGxpa2luZyB3aGVyZSB0aGlzIGlzIGdvaW5nIGJ0dywgc2VlbXMgbGlrZSBhIGlsbAo+PiAgICAg
dGhvdWdodCBvdXQgY29uY2VwdCwgaWYgQU1EIGlzIHJlYWxseSBnb2luZyBkb3duIHRoZSByb2Fk
IG9mIGRlc2lnbmluZwo+PiAgICAgaHcgdGhhdCBpcyBjdXJyZW50bHkgTGludXggaW5jb21wYXRp
YmxlLCB5b3UgYXJlIGdvaW5nIHRvIGhhdmUgdG8KPj4gICAgIGFjY2VwdCBhIGJpZyBwYXJ0IG9m
IHRoZSBidXJkZW4gaW4gYnJpbmdpbmcgdGhpcyBzdXBwb3J0IGluIHRvIG1vcmUKPj4gICAgIHRo
YW4ganVzdCBhbWQgZHJpdmVycyBmb3IgdXBjb21pbmcgZ2VuZXJhdGlvbnMgb2YgZ3B1Lgo+Pgo+
IAo+IFdlbGwgd2UgZG9uJ3QgcmVhbGx5IGxpa2UgdGhhdCBlaXRoZXIsIGJ1dCB3ZSBoYXZlIG5v
IG90aGVyIG9wdGlvbiBhcyBmYXIgYXMgSSBjYW4gc2VlLgoKSSBkb24ndCByZWFsbHkgdW5kZXJz
dGFuZCB3aGF0ICJmdXR1cmUgaHcgbWF5IHJlbW92ZSBzdXBwb3J0IGZvciBrZXJuZWwgcXVldWVz
IiBtZWFucyBleGFjdGx5LiBXaGlsZSB0aGUgcGVyLWNvbnRleHQgcXVldWVzIGNhbiBiZSBtYXBw
ZWQgdG8gdXNlcnNwYWNlIGRpcmVjdGx5LCB0aGV5IGRvbid0ICpoYXZlKiB0byBiZSwgZG8gdGhl
eT8gSS5lLiB0aGUga2VybmVsIGRyaXZlciBzaG91bGQgYmUgYWJsZSB0byBlaXRoZXIgaW50ZXJj
ZXB0IHVzZXJzcGFjZSBhY2Nlc3MgdG8gdGhlIHF1ZXVlcywgb3IgaW4gdGhlIHdvcnN0IGNhc2Ug
ZG8gaXQgYWxsIGl0c2VsZiwgYW5kIHByb3ZpZGUgdGhlIGV4aXN0aW5nIHN5bmNocm9uaXphdGlv
biBzZW1hbnRpY3MgYXMgbmVlZGVkPwoKU3VyZWx5IHRoZXJlIGFyZSByZXNvdXJjZSBsaW1pdHMg
Zm9yIHRoZSBwZXItY29udGV4dCBxdWV1ZXMsIHNvIHRoZSBrZXJuZWwgZHJpdmVyIG5lZWRzIHRv
IGRvIHNvbWUga2luZCBvZiB2aXJ0dWFsaXphdGlvbiAvIG11bHRpLXBsZXhpbmcgYW55d2F5LCBv
ciB3ZSdsbCBnZXQgc2FkIHVzZXIgZmFjZXMgd2hlbiB0aGVyZSdzIG5vIHF1ZXVlIGF2YWlsYWJs
ZSBmb3IgPGN1cnJlbnQgaG90IGdhbWU+LgoKSSdtIHByb2JhYmx5IG1pc3Npbmcgc29tZXRoaW5n
IHRob3VnaCwgYXdhaXRpbmcgZW5saWdodGVubWVudC4gOikKCgotLSAKRWFydGhsaW5nIE1pY2hl
bCBEw6RuemVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgIGh0dHBzOi8vcmVkaGF0LmNv
bQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVz
YSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
