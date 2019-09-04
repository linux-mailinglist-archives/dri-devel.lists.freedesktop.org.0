Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E36D2A7E8B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 10:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8EED892EA;
	Wed,  4 Sep 2019 08:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id EF9A3892E7;
 Wed,  4 Sep 2019 08:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id CC7A12A6042;
 Wed,  4 Sep 2019 10:55:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 0IACsxtVyKVm; Wed,  4 Sep 2019 10:55:12 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id D8D472A6016;
 Wed,  4 Sep 2019 10:55:11 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92.1)
 (envelope-from <michel@daenzer.net>)
 id 1i5R4I-0004yY-Dc; Wed, 04 Sep 2019 10:55:10 +0200
Subject: Re: [PATCH AUTOSEL 4.19 044/167] drm/amdgpu: validate user pitch
 alignment
To: Daniel Vetter <daniel@ffwll.ch>, Sasha Levin <sashal@kernel.org>,
 Dave Airlie <airlied@linux.ie>
References: <20190903162519.7136-1-sashal@kernel.org>
 <20190903162519.7136-44-sashal@kernel.org>
 <7957107d-634f-4771-327e-99fdd5e6474e@daenzer.net>
 <20190903170347.GA24357@kroah.com> <20190903200139.GJ5281@sasha-vm>
 <CAKMK7uFpBnkF4xABdkDMZ8TYhL4jg6ZuGyHGyVeBxc9rkyUtXQ@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Openpgp: preference=signencrypt
Autocrypt: addr=michel@daenzer.net; prefer-encrypt=mutual; keydata=
 mQGiBDsehS8RBACbsIQEX31aYSIuEKxEnEX82ezMR8z3LG8ktv1KjyNErUX9Pt7AUC7W3W0b
 LUhu8Le8S2va6hi7GfSAifl0ih3k6Bv1Itzgnd+7ZmSrvCN8yGJaHNQfAevAuEboIb+MaVHo
 9EMJj4ikOcRZCmQWw7evu/D9uQdtkCnRY9iJiAGxbwCguBHtpoGMxDOINCr5UU6qt+m4O+UD
 /355ohBBzzyh49lTj0kTFKr0Ozd20G2FbcqHgfFL1dc1MPyigej2gLga2osu2QY0ObvAGkOu
 WBi3LTY8Zs8uqFGDC4ZAwMPoFy3yzu3ne6T7d/68rJil0QcdQjzzHi6ekqHuhst4a+/+D23h
 Za8MJBEcdOhRhsaDVGAJSFEQB1qLBACOs0xN+XblejO35gsDSVVk8s+FUUw3TSWJBfZa3Imp
 V2U2tBO4qck+wqbHNfdnU/crrsHahjzBjvk8Up7VoY8oT+z03sal2vXEonS279xN2B92Tttr
 AgwosujguFO/7tvzymWC76rDEwue8TsADE11ErjwaBTs8ZXfnN/uAANgPLQjTWljaGVsIERh
 ZW56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD6IXgQTEQIAHgUCQFXxJgIbAwYLCQgHAwIDFQID
 AxYCAQIeAQIXgAAKCRBaga+OatuyAIrPAJ9ykonXI3oQcX83N2qzCEStLNW47gCeLWm/QiPY
 jqtGUnnSbyuTQfIySkK5AQ0EOx6FRRAEAJZkcvklPwJCgNiw37p0GShKmFGGqf/a3xZZEpjI
 qNxzshFRFneZze4f5LhzbX1/vIm5+ZXsEWympJfZzyCmYPw86QcFxyZflkAxHx9LeD+89Elx
 bw6wT0CcLvSv8ROfU1m8YhGbV6g2zWyLD0/naQGVb8e4FhVKGNY2EEbHgFBrAAMGA/0VktFO
 CxFBdzLQ17RCTwCJ3xpyP4qsLJH0yCoA26rH2zE2RzByhrTFTYZzbFEid3ddGiHOBEL+bO+2
 GNtfiYKmbTkj1tMZJ8L6huKONaVrASFzLvZa2dlc2zja9ZSksKmge5BOTKWgbyepEc5qxSju
 YsYrX5xfLgTZC5abhhztpYhGBBgRAgAGBQI7HoVFAAoJEFqBr45q27IAlscAn2Ufk2d6/3p4
 Cuyz/NX7KpL2dQ8WAJ9UD5JEakhfofed8PSqOM7jOO3LCA==
Message-ID: <829c5912-cf80-81d0-7400-d01d286861fc@daenzer.net>
Date: Wed, 4 Sep 2019 10:55:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFpBnkF4xABdkDMZ8TYhL4jg6ZuGyHGyVeBxc9rkyUtXQ@mail.gmail.com>
Content-Language: en-CA
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
Cc: Yu Zhao <yuzhao@google.com>, Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0wMyAxMDoxNiBwLm0uLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFR1ZSwg
U2VwIDMsIDIwMTkgYXQgMTA6MDEgUE0gU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPiB3
cm90ZToKPj4gT24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDc6MDM6NDdQTSArMDIwMCwgR3JlZyBL
SCB3cm90ZToKPj4+IE9uIFR1ZSwgU2VwIDAzLCAyMDE5IGF0IDA2OjQwOjQzUE0gKzAyMDAsIE1p
Y2hlbCBEw6RuemVyIHdyb3RlOgo+Pj4+IE9uIDIwMTktMDktMDMgNjoyMyBwLm0uLCBTYXNoYSBM
ZXZpbiB3cm90ZToKPj4+Pj4gRnJvbTogWXUgWmhhbyA8eXV6aGFvQGdvb2dsZS5jb20+Cj4+Pj4+
Cj4+Pj4+IFsgVXBzdHJlYW0gY29tbWl0IDg5ZjIzYjZlZmVmNTU0NzY2MTc3YmY1MWFhNzU0YmNl
MTRjM2U3ZGEgXQo+Pj4+Cj4+Pj4gSG9sZCB5b3VyIGhvcnNlcyEKPj4+Pgo+Pj4+IFRoaXMgY29t
bWl0IGFuZCBjNGEzMmIyNjZkYTdiYjcwMmU2MDM4MWNhMGMzNWVhZGRiYzg5YTZjIGhhZCB0byBi
ZQo+Pj4+IHJldmVydGVkLCBhcyB0aGV5IGNhdXNlZCByZWdyZXNzaW9ucy4gU2VlIGNvbW1pdHMK
Pj4+PiAyNWVjNDI5ZTg2YmI3OTBlNDAzODdhNTUwZjA1MDFkMGFjNTVhNDdjICYKPj4+PiA5MmIw
NzMwZWFmMmQ1NDlmZGZiMTBlY2M4YjcxZjM0YjlmNDcyYzEyIC4KPj4+Pgo+Pj4+Cj4+Pj4gVGhp
cyBpc24ndCBib2xzdGVyaW5nIGNvbmZpZGVuY2UgaW4gaG93IHRoZXNlIHBhdGNoZXMgYXJlIHNl
bGVjdGVkLi4uCj4+Pgo+Pj4gVGhlIHBhdGNoIF9pdHNlbGZfIHNhaWQgdG8gYmUgYmFja3BvcnRl
ZCB0byB0aGUgc3RhYmxlIHRyZWVzIGZyb20gNC4yCj4+PiBhbmQgbmV3ZXIuICBXaHkgd291bGRu
J3Qgd2UgYmUgY29uZmlkZW50IGluIGRvaW5nIHRoaXM/Cj4+Pgo+Pj4gSWYgdGhlIHBhdGNoIGRv
ZXNuJ3Qgd2FudCB0byBiZSBiYWNrcG9ydGVkLCB0aGVuIGRvIG5vdCBhZGQgdGhlIGNjOgo+Pj4g
c3RhYmxlIGxpbmUgdG8gaXQuLi4KPj4KPj4gVGhpcyBwYXRjaCB3YXMgcGlja2VkIGJlY2F1c2Ug
aXQgaGFzIGEgc3RhYmxlIHRhZywgd2hpY2ggeW91IHByZXN1bWFibHkKPj4gc2F3IGFzIHlvdXIg
UmV2aWV3ZWQtYnkgdGFnIGlzIGluIHRoZSBwYXRjaC4gVGhpcyBpcyB3aHkgaXQgd2FzCj4+IGJh
Y2twb3J0ZWQ7IGl0IGRvZXNuJ3QgdGFrZSBBSSB0byBiYWNrcG9ydCBwYXRjaGVzIHRhZ2dlZCBm
b3Igc3RhYmxlLi4uCgpUaGUgcGF0Y2hlcyBkaWQgcG9pbnQgdG8gZ2FwcyBpbiB2YWxpZGF0aW9u
IG9mIGlvY3RsIHBhcmFtZXRlcnMgcGFzc2VkCmluIGJ5IHVzZXJzcGFjZS4gVW5mb3J0dW5hdGVs
eSwgdGhleSB0dXJuZWQgb3V0IHRvIGJlIHRvbyBzdHJpY3QsCmNhdXNpbmcgdmFsaWQgcGFyYW1l
dGVycyB0byBzcHVyaW91c2x5IGZhaWwuIElmIHRoYXQgd2Fzbid0IHRoZSBjYXNlLAphbmQgdGhl
IHBhdGNoZXMgZGlkbid0IGhhdmUgc3RhYmxlIHRhZ3MsIG1heWJlIHdlJ2QgYmUgaGF2aW5nIGEK
ZGlzY3Vzc2lvbiBhYm91dCB3aHkgdGhleSBkaWRuJ3QgaGF2ZSB0aGUgdGFncyBub3cuLi4KCgo+
PiBUaGUgcmV2ZXJ0IG9mIHRoaXMgcGF0Y2gsIGhvd2V2ZXI6Cj4+Cj4+ICAxLiBEaWRuJ3QgaGF2
ZSBhIHN0YWJsZSB0YWcuCgpJIGd1ZXNzIGl0IGRpZG4ndCBvY2N1ciB0byBtZSB0aGF0IHdhcyBu
ZWNlc3NhcnksIGFzIHRoZSBwYXRjaGVzIGdvdApyZXZlcnRlZCB3aXRoaW4gZGF5cy4KCgo+PiAg
Mi4gRGlkbid0IGhhdmUgYSAiRml4ZXM6IiB0YWcuCj4+ICAzLiBEaWRuJ3QgaGF2ZSB0aGUgdXN1
YWwgInRoZSByZXZlcnRzIGNvbW1pdCAuLi4iIHN0cmluZyBhZGRlZCBieSBnaXQKPj4gIHdoZW4g
b25lIGRvZXMgYSByZXZlcnQuCgpJIHN1c3BlY3QgdGhhdCdzIGJlY2F1c2UgdGhlcmUgd2VyZSBu
byBzdGFibGUgY29tbWl0IGhhc2hlcyB0bwpyZWZlcmVuY2UsIHNlZSBiZWxvdy4KCgo+PiBXaGlj
aCBpcyB3aHkgd2Ugc3RpbGwga2ljayBwYXRjaGVzIGZvciByZXZpZXcsIGV2ZW4gdGhvdWdoIHRo
ZXkgaGFkIGEKPj4gc3RhYmxlIHRhZywganVzdCBzbyBwZW9wbGUgY291bGQgdGFrZSBhIGxvb2sg
YW5kIGNvbmZpcm0gd2UncmUgbm90Cj4+IG1pc3NpbmcgYW55dGhpbmcgLSBsaWtlIHdlIGRpZCBo
ZXJlLgo+Pgo+PiBJJ20gbm90IHN1cmUgd2hhdCB5b3UgZXhwZWN0ZWQgbWUgdG8gZG8gZGlmZmVy
ZW50bHkgaGVyZS4KClllYWgsIHNvcnJ5LCBJIGRpZG4ndCByZWFsaXplIGl0J3MgdHJpY2t5IGZv
ciBzY3JpcHRzIHRvIHJlY29nbml6ZSB0aGF0CnRoZSBwYXRjaGVzIGhhdmUgYmVlbiByZXZlcnRl
ZCBpbiB0aGlzIGNhc2UuCgoKPiBZZWFoIHRoaXMgbG9va3MgbGlrZSBmYWlsIG9uIHRoZSByZXZl
cnQgc2lkZSwgdGhleSBuZWVkIHRvIHJlZmVyZW5jZQo+IHRoZSByZXZlcnRlZCBjb21taXQgc29t
ZWhvdyAuLi4KPiAKPiBBbGV4LCB3aHkgZ290IHRoaXMgZHJvcHBlZD8gSXMgdGhpcyBtb3JlIGZh
bGxvdXQgZnJvbSB0aGUgYmFjayZmb3J0aAo+IHNodWZmbGluZyB5b3UncmUgZG9pbmcgYmV0d2Vl
biB5b3VyIGludGVybmFsIGJyYW5jaGVzIGJlaGluZCB0aGUKPiBmaXJld2FsbCwgYW5kIHRoZSBw
dWJsaWMgaGlzdG9yeT8KCkkgZG8gc3VzcGVjdCB0aGF0IHdhcyBhdCBsZWFzdCBhIGNvbnRyaWJ1
dGluZyBmYWN0b3IuCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAg
IHwgICAgICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVz
aWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
