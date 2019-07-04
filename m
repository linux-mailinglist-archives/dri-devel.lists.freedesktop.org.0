Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1865F48D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 10:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8B66E2F3;
	Thu,  4 Jul 2019 08:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id EDB066E2F3
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 08:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 466A62A6045;
 Thu,  4 Jul 2019 10:26:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 6u5GaiUmoXCM; Thu,  4 Jul 2019 10:26:17 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 39FAF2A6042;
 Thu,  4 Jul 2019 10:26:17 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hix4K-0007wK-U0; Thu, 04 Jul 2019 10:26:16 +0200
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
To: =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
 <20190628103204.GJ2640@lahna.fi.intel.com>
 <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
 <20190628113415.GL2640@lahna.fi.intel.com>
 <ecebae84c91fa31a1207c30c0fe4ed907642dbb9.camel@gmail.com>
 <c3b38b60-7c1a-730d-8de0-e3c880902003@daenzer.net>
 <627b7fff64edcba0f8d8b5ced79a351821c419c7.camel@gmail.com>
 <792d0f36-b8ae-bef9-3b07-95677637ba00@daenzer.net>
 <f986d6687e2b1f1fc8a93f86cbc8fd1ab971663a.camel@gmail.com>
 <d1dfe289-8501-8848-6324-c43d6e66a77f@daenzer.net>
 <4ee5439cb01e355436d618f5d6f2e109410dc35e.camel@gmail.com>
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
Message-ID: <eee4eea0-ad27-9d05-192d-c1207da5d0bc@daenzer.net>
Date: Thu, 4 Jul 2019 10:26:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <4ee5439cb01e355436d618f5d6f2e109410dc35e.camel@gmail.com>
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
Cc: "michael.jamet@intel.com" <michael.jamet@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0wMyAxOjA0IHAubS4sIFRpbXVyIEtyaXN0w7NmIHdyb3RlOgo+IAo+Pj4gVGhl
cmUgbWF5IGJlIG90aGVyIGZhY3RvcnMsIHllcy4gSSBjYW4ndCBvZmZlciBhIGdvb2QgZXhwbGFu
YXRpb24KPj4+IG9uCj4+PiB3aGF0IGV4YWN0bHkgaXMgaGFwcGVuaW5nLCBidXQgaXQncyBwcmV0
dHkgY2xlYXIgdGhhdCBhbWRncHUgY2FuJ3QKPj4+IHRha2UKPj4+IGZ1bGwgYWR2YW50YWdlIG9m
IHRoZSBUQjMgbGluaywgc28gaXQgc2VlbWVkIGxpa2UgYSBnb29kIGlkZWEgdG8KPj4+IHN0YXJ0
Cj4+PiBpbnZlc3RpZ2F0aW5nIHRoaXMgZmlyc3QuCj4+Cj4+IFllYWgsIGFjdHVhbGx5IGl0IHdv
dWxkIGJlIGNvbnNpc3RlbnQgd2l0aCB+MTYtMzIgS0IgZ3JhbnVsYXJpdHkKPj4gdHJhbnNmZXJz
IGJhc2VkIG9uIHlvdXIgbWVhc3VyZW1lbnRzIGFib3ZlLCB3aGljaCBpcyBwbGF1c2libGUuIFNv
Cj4+IG1ha2luZyBzdXJlIHRoYXQgdGhlIGRyaXZlciBkb2Vzbid0IGFydGlmaWNpYWxseSBsaW1p
dCB0aGUgUENJZQo+PiBiYW5kd2lkdGggbWlnaHQgaW5kZWVkIGhlbHAuCj4gCj4gQ2FuIHlvdSBw
b2ludCBtZSB0byB0aGUgcGxhY2Ugd2hlcmUgYW1kZ3B1IGRlY2lkZXMgdGhlIFBDSWUgbGluayBz
cGVlZD8KPiBJJ2QgbGlrZSB0byB0cnkgdG8gdHdlYWsgaXQgYSBsaXR0bGUgYml0IHRvIHNlZSBp
ZiB0aGF0IGhlbHBzIGF0IGFsbC4KCkknbSBub3Qgc3VyZSBvZmZoYW5kLCBBbGV4IG9yIGFueW9u
ZT8KCgo+PiBPVE9IIHRoaXMgYWxzbyBpbmRpY2F0ZXMgYSBzaW1pbGFyIHBvdGVudGlhbCBmb3Ig
aW1wcm92ZW1lbnQgYnkgdXNpbmcKPj4gbGFyZ2VyIHRyYW5zZmVycyBpbiBNZXNhIGFuZC9vciB0
aGUga2VybmVsLgo+IAo+IFllcywgdGhhdCBzb3VuZHMgbGlrZSBpdCB3b3VsZCBiZSB3b3J0aCBs
b29raW5nIGludG8uCj4gCj4gT3V0IG9mIGN1cmlvc2l0eSwgaXMgdGhlcmUgYSBwZXJmb3JtYWNl
IGRlY3JlYXNlIHdpdGggc21hbGwgdHJhbnNmZXJzCj4gb24gYSAibm9ybWFsIiBQQ0llIHBvcnQg
dG9vLCBvciBpcyB0aGlzIHNwZWNpZmljIHRvIFRCMz8KCkl0J3Mgbm90IFRCMyBzcGVjaWZpYy4g
V2l0aCBhICJub3JtYWwiIDggR1QvcyB4MTYgcG9ydCwgSSBnZXQgYmV0d2Vlbgp+MjU2IE1CL3Mg
Zm9yIDQgS0IgdHJhbnNmZXJzIGFuZCB+MTIgR0IvcyBmb3IgNCBNQiB0cmFuc2ZlcnMgKGV2ZW4K
bGFyZ2VyIHRyYW5zZmVycyBzZWVtIHNsaWdodGx5IHNsb3dlciBhZ2FpbikuIFRoaXMgYWxzbyBs
b29rcyBjb25zaXN0ZW50CndpdGggeW91ciBtZWFzdXJlbWVudHMgaW4gdGhhdCB0aGUgcHJhY3Rp
Y2FsIGxpbWl0IHNlZW1zIHRvIGJlIGFyb3VuZAo3NSUgb2YgdGhlIHRoZW9yZXRpY2FsIGJhbmR3
aWR0aC4KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAgICAg
ICAgICAgICAgaHR0cHM6Ly93d3cuYW1kLmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAg
ICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
