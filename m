Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3BF6CCC4
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 12:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967F589EA9;
	Thu, 18 Jul 2019 10:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id EC44589EA9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 10:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 20B552E2002;
 Thu, 18 Jul 2019 12:29:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id QiPJf-HGb-Jr; Thu, 18 Jul 2019 12:29:39 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 537A02A6016;
 Thu, 18 Jul 2019 12:29:39 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1ho3fO-0003xD-Ba; Thu, 18 Jul 2019 12:29:38 +0200
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
To: =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
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
 <CAAxE2A4hgaJ6+AoOGz=b+1aRQEb+eKB88N82KGkcU1w_dnffOQ@mail.gmail.com>
 <ba05faee86fd702f0ba9baa2322a5e32c27432d7.camel@gmail.com>
 <CAAxE2A6K-oaZqOJr+k0fZfwCmrPO+tfygu8EjDwk9PNgk4qU=Q@mail.gmail.com>
 <8f0c2d7780430d40dd1e17a82484d236eae3f981.camel@gmail.com>
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
Message-ID: <9d3e2499-e55d-c095-e73e-392440e2bf47@daenzer.net>
Date: Thu, 18 Jul 2019 12:29:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8f0c2d7780430d40dd1e17a82484d236eae3f981.camel@gmail.com>
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
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0xOCAxMTowNiBhLm0uLCBUaW11ciBLcmlzdMOzZiB3cm90ZToKPj4+IFRoYW5r
cyBNYXJlaywgSSBkaWRuJ3Qga25vdyBhYm91dCB0aGF0IG9wdGlvbi4KPj4+IFRyaWVkIGl0LCBo
ZXJlIGlzIHRoZSBvdXRwdXQ6IGh0dHBzOi8vcGFzdGViaW4uY29tL3Jhdy85U0FBYmJBQQo+Pj4K
Pj4+IEknbSBub3QgcXVpdGUgc3VyZSBob3cgdG8gaW50ZXJwcmV0IHRoZSBudW1iZXJzLCB0aGV5
IGFyZQo+Pj4gaW5jb25zaXN0ZW50Cj4+PiB3aXRoIHRoZSByZXN1bHRzIGZyb20gYm90aCBwY2ll
X2J3IGFuZCBhbWRncHUuYmVuY2htYXJrLCBmb3IKPj4+IGV4YW1wbGUKPj4+IEdUVC0+VlJBTSBh
dCBhIDEyOCBLQiBpcyBhcm91bmQgMTQwMCBNQi9zIChJIGFzc3VtZSB0aGF0IGlzCj4+PiBtZWdh
Ynl0ZXMgLwo+Pj4gc2VjLCByaWdodD8pLgo+Pgo+PiBCYXNlZCBvbiB0aGUgU0RNQSByZXN1bHRz
LCB5b3UgaGF2ZSAyLjQgR0Ivcy4gRm9yIDEyOEtCLCBpdCdzIDIuMgo+PiBHQi9zIGZvciBHVFQt
PlZSQU0gY29waWVzLgo+IAo+IEluIHRoZSBtZWFudGltZSBJIGhhZCBhIGNoYXQgd2l0aCBNaWNo
ZWwgb24gSVJDIGFuZCBoZSBzdWdnZXN0ZWQgdGhhdAo+IG1heWJlIGFtZGdwdS5iZW5jaG1hcms9
MyBnaXZlcyBsb3dlciByZXN1bHRzIGJlY2F1c2UgaXQgdXNlcyBhIGxlc3MKPiB0aGFuIG9wdGlt
YWwgd2F5IHRvIGRvIHRoZSBiZW5jaG1hcmsuCj4gCj4gTG9va2luZyBhdCB0aGUgcmVzdWx0cyBm
cm9tIHRoZSBtZXNhIGJlbmNobWFyayBhIGJpdCBtb3JlIGNsb3NlbHksIEkKPiBzZWUgdGhhdCB0
aGUgU0RNQSBjYW4gZG86Cj4gVlJBTS0+R1RUOiAzMDg3IE1CL3MgPSAyNCBHYml0L3NlYwo+IEdU
VC0+VlJBTTogMjQzMyBNQi9zID0gMTkgR2JpdC9zZWMKPiAKPiBTbyBvbiBQb2xhcmlzIGF0IGxl
YXN0LCB0aGUgU0RNQSBpcyB0aGUgZmFzdGVzdCwgYW5kIHRoZSBvdGhlciB0cmFuc2Zlcgo+IG1l
dGhvZHMgY2FuJ3QgbWF0Y2ggaXQuIEkgYWxzbyBkaWQgdGhlIHNhbWUgdGVzdCBvbiBOYXZpLCB3
aGVyZSBpdCdzCj4gZGlmZmVyZW50OiBhbGwgb3RoZXIgdHJhbnNmZXIgbWV0aG9kcyBhcmUgbXVj
aCBjbG9zZXIgdG8gdGhlIFNETUEsIGJ1dAo+IHRoZSBtYXggc3BlZWQgaXMgc3RpbGwgYXJvdW5k
IDIwLTI0IEdiaXQgLyBzZWMuCj4gCj4gSSBzdGlsbCBoYXZlIGEgZmV3IHF1ZXN0aW9uczoKPiAK
PiAxLiBXaHkgaXMgdGhlIEdUVC0+VlJBTSBjb3B5IHNvIG11Y2ggc2xvd2VyIHRoYW4gdGhlIFZS
QU0tPkdUVCBjb3B5Pwo+IAo+IDIuIFdoeSBpcyB0aGUgYnVzIGxpbWl0ZWQgdG8gMjQgR2JpdC9z
ZWM/IEkgd291bGQgZXhwZWN0IHRoZQo+IFRodW5kZXJib2x0IHBvcnQgdG8gZ2l2ZSBtZSBhdCBs
ZWFzdCAzMiBHYml0L3NlYyBmb3IgUENJZSB0cmFmZmljLgoKVGhhdCdzIHVucmVhbGlzdGljIEkn
bSBhZnJhaWQuIEFzIEkgc2FpZCBvbiBJUkMsIGZyb20gdGhlIEdQVSBQT1YKdGhlcmUncyBhbiA4
IEdUL3MgeDQgUENJZSBsaW5rLCBzbyB+MjkuOCBHYml0L3MgKD0gMzIgYmlsbGlvbiBiaXQvczsg
SQptaXNzZWQgdGhpcyBudWFuY2Ugb24gSVJDKSBpcyB0aGUgdGhlb3JldGljYWwgcmF3IGJhbmR3
aWR0aC4gSG93ZXZlciwgaW4KcHJhY3RpY2UgdGhhdCdzIG5vdCBhY2hpZXZhYmxlIGR1ZSB0byB2
YXJpb3VzIG92ZXJoZWFkWzBdLCBhbmQgSSdtIG9ubHkKc2VlaW5nIHVwIHRvIH45MCUgdXRpbGl6
YXRpb24gb2YgdGhlIHRoZW9yZXRpY2FsIGJhbmR3aWR0aCB3aXRoIGEKIm5vcm1hbCIgeDE2IGxp
bmsgYXMgd2VsbC4gSSB3b3VsZG4ndCBleHBlY3QgaGlnaGVyIHV0aWxpemF0aW9uIHdpdGhvdXQK
c2VlaW5nIHNvbWUgZXZpZGVuY2UgdG8gc3VnZ2VzdCBpdCdzIHBvc3NpYmxlLgoKClswXSBBY2Nv
cmRpbmcgdG8KaHR0cHM6Ly93d3cudGVzdGVkLmNvbS90ZWNoLzQ1NzQ0MC10aGVvcmV0aWNhbC12
cy1hY3R1YWwtYmFuZHdpZHRoLXBjaS1leHByZXNzLWFuZC10aHVuZGVyYm9sdC8KLCBQQ0llIDMu
MCB1c2VzIDEuNTQlIG9mIHRoZSByYXcgYmFuZHdpZHRoIGZvciBpdHMgaW50ZXJuYWwgZW5jb2Rp
bmcuCkFsc28ga2VlcCBpbiBtaW5kIGFsbCBDUFU8LT5HUFUgY29tbXVuaWNhdGlvbiBoYXMgdG8g
Z28gdGhyb3VnaCB0aGUgUENJZQpsaW5rLCBlLmcuIGZvciBwcm9ncmFtbWluZyB0aGUgdHJhbnNm
ZXJzLCBpbi1iYW5kIHNpZ25hbGxpbmcgZnJvbSB0aGUKR1BVIHRvIHRoZSBQQ0llIHBvcnQgd2hl
cmUgdGhlIGRhdGEgaXMgYmVpbmcgdHJhbnNmZXJyZWQgdG8vZnJvbSwgLi4uCgotLSAKRWFydGhs
aW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgaHR0cHM6Ly93
d3cuYW1kLmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAg
ICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
