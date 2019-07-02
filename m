Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EB15CAE5
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 10:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CF5896D8;
	Tue,  2 Jul 2019 08:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5651C89015
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 08:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 7BDBE2AA120;
 Tue,  2 Jul 2019 10:09:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id EEI-sV328GtU; Tue,  2 Jul 2019 10:09:14 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 8D58C2AA0D0;
 Tue,  2 Jul 2019 10:09:14 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hiDqi-0000iF-Df; Tue, 02 Jul 2019 10:09:12 +0200
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
To: =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
 <20190628103204.GJ2640@lahna.fi.intel.com>
 <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
 <20190628113415.GL2640@lahna.fi.intel.com>
 <ecebae84c91fa31a1207c30c0fe4ed907642dbb9.camel@gmail.com>
 <c3b38b60-7c1a-730d-8de0-e3c880902003@daenzer.net>
 <627b7fff64edcba0f8d8b5ced79a351821c419c7.camel@gmail.com>
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
Message-ID: <792d0f36-b8ae-bef9-3b07-95677637ba00@daenzer.net>
Date: Tue, 2 Jul 2019 10:09:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <627b7fff64edcba0f8d8b5ced79a351821c419c7.camel@gmail.com>
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

T24gMjAxOS0wNy0wMSA2OjAxIHAubS4sIFRpbXVyIEtyaXN0w7NmIHdyb3RlOgo+IE9uIE1vbiwg
MjAxOS0wNy0wMSBhdCAxNjo1NCArMDIwMCwgTWljaGVsIETDpG56ZXIgd3JvdGU6Cj4+IE9uIDIw
MTktMDYtMjggMjoyMSBwLm0uLCBUaW11ciBLcmlzdMOzZiB3cm90ZToKPj4+IEkgaGF2ZW4ndCBm
b3VuZCBhIGdvb2Qgd2F5IHRvIG1lYXN1cmUgdGhlIG1heGltdW0gUENJZSB0aHJvdWdocHV0Cj4+
PiBiZXR3ZWVuIHRoZSBDUFUgYW5kIEdQVSwKPj4KPj4gYW1kZ3B1LmJlbmNobWFyaz0zCj4+Cj4+
IG9uIHRoZSBrZXJuZWwgY29tbWFuZCBsaW5lIHdpbGwgbWVhc3VyZSB0aHJvdWdocHV0IGZvciB2
YXJpb3VzCj4+IHRyYW5zZmVyCj4+IHNpemVzIGR1cmluZyBkcml2ZXIgaW5pdGlhbGl6YXRpb24u
Cj4gCj4gVGhhbmtzLCBJIHdpbGwgZGVmaW5pdGVseSB0cnkgdGhhdC4KPiBJcyB0aGlzIHRoZSBv
bmx5IHdheSB0byBkbyB0aGlzLCBvciBpcyB0aGVyZSBhIHdheSB0byBiZW5jaG1hcmsgaXQKPiBh
ZnRlciBpdCBhbHJlYWR5IGJvb3RlZD8KClRoZSBmb3JtZXIuIEF0IGxlYXN0IGluIHRoZW9yeSwg
aXQncyBwb3NzaWJsZSB0byB1bmxvYWQgdGhlIGFtZGdwdQptb2R1bGUgd2hpbGUgbm90aGluZyBp
cyB1c2luZyBpdCwgdGhlbiBsb2FkIGl0IGFnYWluLgoKCj4+PiBidXQgSSBkaWQgdGFrZSBhIGxv
b2sgYXQgQU1EJ3Mgc3lzZnMgaW50ZXJmYWNlIGF0Cj4+PiAvc3lzL2NsYXNzL2RybS9jYXJkMS9k
ZXZpY2UvcGNpZV9idyB3aGljaCB3aGlsZSBydW5uaW5nIHRoZQo+Pj4gYm90dGxlbmVja2VkCj4+
PiBnYW1lLiBUaGUgaGlnaGVzdCB0aHJvdWdocHV0IEkgc2F3IHRoZXJlIHdhcyBvbmx5IDIuNDMg
R2JpdCAvc2VjLgo+Pgo+PiBQQ0llIGJhbmR3aWR0aCBnZW5lcmFsbHkgaXNuJ3QgYSBib3R0bGVu
ZWNrIGZvciBnYW1lcywgc2luY2UgdGhleQo+PiBkb24ndAo+PiBjb25zdGFudGx5IHRyYW5zZmVy
IGxhcmdlIGRhdGEgdm9sdW1lcyBhY3Jvc3MgUENJZSwgYnV0IHN0b3JlIHRoZW0gaW4KPj4gdGhl
IEdQVSdzIGxvY2FsIFZSQU0sIHdoaWNoIGlzIGNvbm5lY3RlZCBhdCBtdWNoIGhpZ2hlciBiYW5k
d2lkdGguCj4gCj4gVGhlcmUgYXJlIHJlYXNvbnMgd2h5IEkgdGhpbmsgdGhlIHByb2JsZW0gaXMg
dGhlIGJhbmR3aWR0aDoKPiAxLiBUaGUgc2FtZSBpc3N1ZXMgZG9uJ3QgaGFwcGVuIHdoZW4gdGhl
IEdQVSBpcyBub3QgdXNlZCB3aXRoIGEgVEIzCj4gZW5jbG9zdXJlLgo+IDIuIEluIGNhc2Ugb2Yg
cmFkZW9uc2ksIHRoZSBwcm9ibGVtIHdhcyBtaXRpZ2F0ZWQgb25jZSBNYXJlaydzIFNETUEKPiBw
YXRjaCB3YXMgbWVyZ2VkLCB3aGljaCBodWdlbHkgcmVkdWNlcyB0aGUgUENJZSBiYW5kd2lkdGgg
dXNlLgo+IDMuIEluIGxlc3Mgb3B0aW1pemVkIGNhc2VzIChmb3IgZXhhbXBsZSBEOVZLKSwgdGhl
IHByb2JsZW0gaXMgc3RpbGwKPiB2ZXJ5IG5vdGljYWJsZS4KCkhvd2V2ZXIsIHNpbmNlIHlvdSBz
YXcgYXMgbXVjaCBhcyB+MjAgR2JpdC9zIHVuZGVyIGRpZmZlcmVudApjaXJjdW1zdGFuY2VzLCB0
aGUgMi40MyBHYml0L3MgdXNlZCBieSB0aGlzIGdhbWUgY2xlYXJseSBpc24ndCBhIGhhcmQKbGlt
aXQ7IHRoZXJlIG11c3QgYmUgb3RoZXIgbGltaXRpbmcgZmFjdG9ycy4KCgotLSAKRWFydGhsaW5n
IE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgaHR0cHM6Ly93d3cu
YW1kLmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAg
ICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
