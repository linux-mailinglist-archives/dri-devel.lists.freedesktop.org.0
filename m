Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3371A06F
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 17:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BD589701;
	Fri, 10 May 2019 15:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id EB76689701;
 Fri, 10 May 2019 15:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 4BBA02A604C;
 Fri, 10 May 2019 17:46:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id cS2C7Py210gw; Fri, 10 May 2019 17:46:44 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id E844B2A604A;
 Fri, 10 May 2019 17:46:43 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hP7jP-0002wL-Ib; Fri, 10 May 2019 17:46:43 +0200
Subject: Re: [PATCH] Revert "vgaarb: Keep adding VGA device in queue"
To: Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexdeucher@gmail.com>
References: <20190510142958.28017-1-alexander.deucher@amd.com>
 <20190510154208.GL17751@phenom.ffwll.local>
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
Message-ID: <58ea5dae-be17-af97-0066-48feab80497e@daenzer.net>
Date: Fri, 10 May 2019 17:46:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190510154208.GL17751@phenom.ffwll.local>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Aaron Ma <aaron.ma@canonical.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0xMCA1OjQyIHAubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gRnJpLCBN
YXkgMTAsIDIwMTkgYXQgMDk6Mjk6NThBTSAtMDUwMCwgQWxleCBEZXVjaGVyIHdyb3RlOgo+PiBU
aGlzIGJyZWFrcyBtdWx0aXBsZSBncmFwaGljcyBjYXJkcyBpbiB0aGUgQW1pZ2FvbmUgeDUwMDAK
Pj4gb24gUFBDLgo+Pgo+PiBUaGlzIHJldmVydHMgY29tbWl0IDNkNDJmMWRkYzQ3YTY5YzBjZTE1
NWY5ZjMwZDc2NGM0ZDY4OWE1ZmEuCj4+Cj4+IEJ1ZzogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9w
Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA5MzQ1Cj4+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPj4gQ0M6IEFhcm9uIE1hIDxhYXJvbi5tYUBj
YW5vbmljYWwuY29tPgo+IAo+IEdpdmVuIHRoYXQgdGhlIGJ1ZyBpcyBhIGJpdCBhIG1lc3MgSSB0
aGluayB3ZSBuZWVkIHRvIGFkZCBhIGJpdCBtb3JlCj4gY29udGV4dCBoZXJlIGluIHRoZSBjb21t
aXQgbWVzc2FnZS4gTXkgdW5kZXJzdGFuZGluZzoKPiAKPiBHb2FsIG9mIHRoZSByZXZlcnQgY29t
bWl0IHdhcyB0byBtYWtlIHRoZSBpbnRlZ3JhdGVkIGJvb3QgZGV2aWNlIHRoZQo+IHByaW1hcnkg
b25lLCBpZiB3ZSBjYW4ndCBkZXRlY3Qgd2hpY2ggb25lIGlzIHRoZSBib290IGRldmljZSwgaW5z
dGVhZCBvZgo+IHRoZSBsYXN0IG9uZS4gV2hpY2ggbWFrZXMgc29tZSBzZW5zZS4KPiAKPiBOb3cg
cGVvcGxlIGhhdmUgcmVsaWVkIG9uIHRoZSBrZXJuZWwgcGlja2luZyB0aGUgbGFzdCBvbmUsIHdo
aWNoIHVzdWFsbHkKPiBpcyBhbiBhZGQtb24gY2FyZCwgYW5kIHRoZXJlZm9yZSBzaW1wbHkgcGx1
Z2dpbmcgaW4gYW4gYWRkLW9uIGNhcmQgYWxsb3dzCj4gdGhlbSB0byBvdmVyd3JpdGUgdGhlIGRl
ZmF1bHQgY2hvaWNlLiBXaGljaCBhbHNvIG1ha2VzIHNlbnNlLCBhbmQgc2luY2UKPiBpdCdzIHRo
ZSBvbGRlciBiZWhhdmlvdXIsIHdpbnMuCj4gCj4gSSB0aGluayBpdCdkIGJlIGdvb2QgdG8gYWRk
IGEgY29tbWVudCBoZXJlIHRoYXQgdGhpcyBiZWhhdmlvdXIgaGFzIGJlY29tZQo+IHVhcGksIGUu
Zy4KPiAKPiAJLyogQWRkIGF0IHRoZSBmcm9udCBzbyB0aGF0IHdlIHBpY2sgdGhlIGxhc3QgZGV2
aWNlIGFzIGZhbGxiYWNrCj4gCSAqIGRlZmF1bHQsIHdpdGggdGhlIHVzdWFsIHJlc3VsdCB0aGF0
IHBsdWcgaW4gY2FyZHMgYXJlIHByZWZlcnJlZAo+IAkgKiBvdmVyIGludGVncmF0ZWQgZ3JhcGhp
Y3MuICovCj4gCj4gV2l0aCB0aGF0IChvciBzaW1pbGFyKSBhbmQgbW9yZSBjb21taXQgbWVzc2Fn
ZSBjb250ZXh0OgoKVGhlIGJ1ZyByZXBvcnRlcidzIHN5c3RlbSBkb2Vzbid0IGhhdmUgaW50ZWdy
YXRlZCBncmFwaGljcyB0aG91Z2gsIGp1c3QKdHdvIHBsdWctaW4gY2FyZHMuIEl0J3Mgbm90IGNs
ZWFyIHRvIG1lIHlldCB0aGF0IHRoZWlyIGV4cGVjdGF0aW9uIG9mClhvcmcgdG8gcGljayBhbnkg
cGFydGljdWxhciBvbmUgb2YgdGhlbSB3aXRob3V0IGNvbmZpZ3VyYXRpb24gd2FzIGp1c3RpZmll
ZC4KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAgICAgICAg
ICAgICAgaHR0cHM6Ly93d3cuYW1kLmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAg
ICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
