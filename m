Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 041FCB4A4D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 11:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BDA6EB81;
	Tue, 17 Sep 2019 09:23:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id B1C966EB83;
 Tue, 17 Sep 2019 09:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id A69DA2AA162;
 Tue, 17 Sep 2019 11:23:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id XfOB3yiI8FrD; Tue, 17 Sep 2019 11:23:41 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 12B2C2AA0BD;
 Tue, 17 Sep 2019 11:23:41 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.92.2)
 (envelope-from <michel@daenzer.net>)
 id 1iA9hy-0006Lx-5D; Tue, 17 Sep 2019 11:23:38 +0200
Subject: Re: [PATCH] drm: add drm device name
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20190903214040.2386-1-sonny.jiang@amd.com>
 <CAAxE2A45N4gMYrcETDpznGKyxLztuwenFasL19a81QQmBkYiww@mail.gmail.com>
 <CAF6AEGvvUUOGujJC9P3t72N93AJuxiiVt0OAk8zf226Q8WmHvg@mail.gmail.com>
 <CAKMK7uHFNhdNY4Y9ZFMNuci7gssPWCT5f5y=e4npg8s5r_jBdQ@mail.gmail.com>
 <CAAxE2A6sESsKAi3K1etAZeCwAPgexn099G6g0aJQnavTkiH+mA@mail.gmail.com>
 <87woe7eanv.fsf@intel.com> <03d31464-3968-6923-5323-f63060d70f1f@gmail.com>
 <CAKMK7uEj4FZ3YQqG-cCTa4EEaJoAk09Zaz398F9Hmo+mdXCKiw@mail.gmail.com>
 <7540df63-e623-19b0-dde5-b89ff2b7fb89@amd.com>
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
Message-ID: <7535dcf4-413f-f06f-b3d1-dcffc86b43e0@daenzer.net>
Date: Tue, 17 Sep 2019 11:23:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7540df63-e623-19b0-dde5-b89ff2b7fb89@amd.com>
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
Cc: "Jiang, Sonny" <Sonny.Jiang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0xNyAxMDoyMyBhLm0uLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToKPiBBbSAx
Ny4wOS4xOSB1bSAxMDoxNyBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4+IE9uIFR1ZSwgU2VwIDE3
LCAyMDE5IGF0IDEwOjEyIEFNIENocmlzdGlhbiBLw7ZuaWcKPj4gPGNrb2VuaWcubGVpY2h0enVt
ZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPj4+IEFtIDE3LjA5LjE5IHVtIDA3OjQ3IHNjaHJpZWIg
SmFuaSBOaWt1bGE6Cj4+Pj4gT24gTW9uLCAxNiBTZXAgMjAxOSwgTWFyZWsgT2zFocOhayA8bWFy
YWVvQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4+IFRoZSBwdXJwb3NlIGlzIHRvIGdldCByaWQgb2Yg
YWxsIFBDSSBJRCB0YWJsZXMgZm9yIGFsbCBkcml2ZXJzIGluCj4+Pj4+IHVzZXJzcGFjZS4gKG9y
IGF0IGxlYXN0IHN0b3AgdXBkYXRpbmcgdGhlbSkKPj4+Pj4KPj4+Pj4gTWVzYSBjb21tb24gY29k
ZSBhbmQgbW9kZXNldHRpbmcgd2lsbCB1c2UgdGhpcy4KPj4+PiBJJ2QgdGhpbmsgdGhpcyB3b3Vs
ZCB3YXJyYW50IGEgaGlnaCBsZXZlbCBkZXNjcmlwdGlvbiBvZiB3aGF0IHlvdSB3YW50Cj4+Pj4g
dG8gYWNoaWV2ZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCj4+PiBBbmQgbWF5YmUgZXhwbGljaXRs
eSBjYWxsIGl0IHVhcGlfbmFtZSBvciBldmVuIHVhcGlfZHJpdmVyX25hbWUuCj4+IElmIGl0J3Mg
dWFwaV9uYW1lLCB0aGVuIHdoeSBkbyB3ZSBuZWVkIGEgbmV3IG9uZSBmb3IgZXZlcnkgZ2VuZXJh
dGlvbj8KPj4gVXNlcnNwYWNlIGRyaXZlcnMgdGVuZCB0byBzcGFuIGEgbG90IG1vcmUgdGhhbiBq
dXN0IDEgZ2VuZXJhdGlvbi4gQW5kCj4+IGlmIHlvdSB3YW50IHRvIGhhdmUgcGVyLWdlbmVyYXRp
b24gZGF0YSBmcm9tIHRoZSBrZXJuZWwgdG8gdXNlcnNwYWNlLAo+PiB0aGVuIGltbyB0aGF0J3Mg
bXVjaCBiZXR0ZXIgc3VpdGVkIGluIHNvbWUgYW1kZ3B1IGlvY3RsLCBpbnN0ZWFkIG9mCj4+IHRy
eWluZyB0byBlbmNvZGUgdGhhdCBpbnRvIHRoZSBkcml2ZXIgbmFtZS4KPiAKPiBXZWxsIHdlIGFs
cmVhZHkgaGF2ZSBhbiBJT0NUTCBmb3IgdGhhdCwgYnV0IEkgdGhvdWdodCB0aGUgaW50ZW50aW9u
IGhlcmUgCj4gd2FzIHRvIGdldCByaWQgb2YgdGhlIFBDSS1JRCB0YWJsZXMgaW4gdXNlcnNwYWNl
IHRvIGZpZ3VyZSBvdXQgd2hpY2ggCj4gZHJpdmVyIHRvIGxvYWQuCgpUaGF0J3MganVzdCB1bnJl
YWxpc3RpYyBpbiBnZW5lcmFsLCBJJ20gYWZyYWlkLiBTZWUgZS5nLiB0aGUgb25nb2luZwp0cmFu
c2l0aW9uIGZyb20gaTk2NSB0byBpcmlzIGZvciByZWNlbnQgSW50ZWwgaGFyZHdhcmUuIEhvdyBp
cyB0aGUKa2VybmVsIHN1cHBvc2VkIHRvIGtub3cgd2hpY2ggZHJpdmVyIGlzIHRvIGJlIHVzZWQ/
CgoKRm9yIHRoZSBYb3JnIG1vZGVzZXR0aW5nIGRyaXZlciwgdGhlcmUncyBhIHNpbXBsZSBzb2x1
dGlvbiwgc2VlCmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy94b3JnL3hzZXJ2ZXIvbWVy
Z2VfcmVxdWVzdHMvMjc4IC4KU29tZXRoaW5nIHNpbWlsYXIgY2FuIHByb2JhYmx5IGJlIGRvbmUg
aW4gTWVzYSBhcyB3ZWxsLgoKCi0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAgICAg
ICAgICB8ICAgICAgICAgICAgICAgaHR0cHM6Ly9yZWRoYXQuY29tCkxpYnJlIHNvZnR3YXJlIGVu
dGh1c2lhc3QgICAgICAgICAgICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3Blcgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
