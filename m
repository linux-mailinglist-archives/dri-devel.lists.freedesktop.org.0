Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6EE5DF4B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 10:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6716E0CC;
	Wed,  3 Jul 2019 08:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7EC526E0CC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 08:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id C72912A6042;
 Wed,  3 Jul 2019 10:07:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id ImSU4WcU7iBe; Wed,  3 Jul 2019 10:07:24 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id B0D8C2A6016;
 Wed,  3 Jul 2019 10:07:23 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hiaIV-0002Kf-Cl; Wed, 03 Jul 2019 10:07:23 +0200
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
 <792d0f36-b8ae-bef9-3b07-95677637ba00@daenzer.net>
 <f986d6687e2b1f1fc8a93f86cbc8fd1ab971663a.camel@gmail.com>
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
Message-ID: <d1dfe289-8501-8848-6324-c43d6e66a77f@daenzer.net>
Date: Wed, 3 Jul 2019 10:07:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <f986d6687e2b1f1fc8a93f86cbc8fd1ab971663a.camel@gmail.com>
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

T24gMjAxOS0wNy0wMiAxMTo0OSBhLm0uLCBUaW11ciBLcmlzdMOzZiB3cm90ZToKPiBPbiBUdWUs
IDIwMTktMDctMDIgYXQgMTA6MDkgKzAyMDAsIE1pY2hlbCBEw6RuemVyIHdyb3RlOgo+PiBPbiAy
MDE5LTA3LTAxIDY6MDEgcC5tLiwgVGltdXIgS3Jpc3TDs2Ygd3JvdGU6Cj4+PiBPbiBNb24sIDIw
MTktMDctMDEgYXQgMTY6NTQgKzAyMDAsIE1pY2hlbCBEw6RuemVyIHdyb3RlOgo+Pj4+IE9uIDIw
MTktMDYtMjggMjoyMSBwLm0uLCBUaW11ciBLcmlzdMOzZiB3cm90ZToKPj4+Pj4gSSBoYXZlbid0
IGZvdW5kIGEgZ29vZCB3YXkgdG8gbWVhc3VyZSB0aGUgbWF4aW11bSBQQ0llCj4+Pj4+IHRocm91
Z2hwdXQKPj4+Pj4gYmV0d2VlbiB0aGUgQ1BVIGFuZCBHUFUsCj4+Pj4KPj4+PiBhbWRncHUuYmVu
Y2htYXJrPTMKPj4+Pgo+Pj4+IG9uIHRoZSBrZXJuZWwgY29tbWFuZCBsaW5lIHdpbGwgbWVhc3Vy
ZSB0aHJvdWdocHV0IGZvciB2YXJpb3VzCj4+Pj4gdHJhbnNmZXIKPj4+PiBzaXplcyBkdXJpbmcg
ZHJpdmVyIGluaXRpYWxpemF0aW9uLgo+Pj4KPj4+IFRoYW5rcywgSSB3aWxsIGRlZmluaXRlbHkg
dHJ5IHRoYXQuCj4+PiBJcyB0aGlzIHRoZSBvbmx5IHdheSB0byBkbyB0aGlzLCBvciBpcyB0aGVy
ZSBhIHdheSB0byBiZW5jaG1hcmsgaXQKPj4+IGFmdGVyIGl0IGFscmVhZHkgYm9vdGVkPwo+Pgo+
PiBUaGUgZm9ybWVyLiBBdCBsZWFzdCBpbiB0aGVvcnksIGl0J3MgcG9zc2libGUgdG8gdW5sb2Fk
IHRoZSBhbWRncHUKPj4gbW9kdWxlIHdoaWxlIG5vdGhpbmcgaXMgdXNpbmcgaXQsIHRoZW4gbG9h
ZCBpdCBhZ2Fpbi4KPiAKPiBPa2F5LCBzbyBJIGJvb3RlZCBteSBzeXN0ZW0gd2l0aCBhbWRncHUu
YmVuY2htYXJrPTMKPiBZb3UgY2FuIGZpbmQgdGhlIGZ1bGwgZG1lc2cgbG9nIGhlcmU6IGh0dHBz
Oi8vcGFzdGViaW4uY29tL3pOOUZZR3c0Cj4gCj4gVGhlIHJlc3VsdCBpcyBiZXR3ZWVuIDEtNSBH
Yml0IC8gc2VjIGRlcGVuZGluZyBvbiB0aGUgdHJhbnNmZXIgc2l6ZQo+ICh0aGUgaGlnaGVyIHRo
ZSBiZXR0ZXIpLCB3aGljaCBjb3JyZXNwb25kcyB0byBuZWl0aGVyIHRoZSA4IEdiaXQgLyBzZWMK
PiB0aGF0IHRoZSBrZXJuZWwgdGhpbmtzIGl0IGlzIGxpbWl0ZWQgdG8sIG5vciB0aGUgMjAgR2Jp
dCAvIHNlYyB3aGljaCBJCj4gbWVhc3VyZWQgZWFybGllciB3aXRoIHBjaWVfYncuCgo1IEdiaXQv
cyB0aHJvdWdocHV0IGNvdWxkIGJlIGNvbnNpc3RlbnQgd2l0aCA4IEdiaXQvcyB0aGVvcmV0aWNh
bApiYW5kd2lkdGgsIGR1ZSB0byB2YXJpb3VzIG92ZXJoZWFkLgoKCj4gU2luY2UgcGNpZV9idyBv
bmx5IHNob3dzIHRoZSBtYXhpbXVtIFBDSWUgcGFja2V0IHNpemUgKGFuZCBub3QgdGhlCj4gYWN0
dWFsIHNpemUpLCBjb3VsZCBpdCBiZSB0aGF0IGl0J3Mgc28gaW5hY2N1cmF0ZSB0aGF0IHRoZSAy
MCBHYml0IC8KPiBzZWMgaXMgYSBmbHVrZT8KClNlZW1zIGxpa2VseSBvciBhdCBsZWFzdCBwbGF1
c2libGUuCgoKPj4+Pj4gYnV0IEkgZGlkIHRha2UgYSBsb29rIGF0IEFNRCdzIHN5c2ZzIGludGVy
ZmFjZSBhdAo+Pj4+PiAvc3lzL2NsYXNzL2RybS9jYXJkMS9kZXZpY2UvcGNpZV9idyB3aGljaCB3
aGlsZSBydW5uaW5nIHRoZQo+Pj4+PiBib3R0bGVuZWNrZWQKPj4+Pj4gZ2FtZS4gVGhlIGhpZ2hl
c3QgdGhyb3VnaHB1dCBJIHNhdyB0aGVyZSB3YXMgb25seSAyLjQzIEdiaXQKPj4+Pj4gL3NlYy4K
Pj4+Pgo+Pj4+IFBDSWUgYmFuZHdpZHRoIGdlbmVyYWxseSBpc24ndCBhIGJvdHRsZW5lY2sgZm9y
IGdhbWVzLCBzaW5jZSB0aGV5Cj4+Pj4gZG9uJ3QKPj4+PiBjb25zdGFudGx5IHRyYW5zZmVyIGxh
cmdlIGRhdGEgdm9sdW1lcyBhY3Jvc3MgUENJZSwgYnV0IHN0b3JlCj4+Pj4gdGhlbSBpbgo+Pj4+
IHRoZSBHUFUncyBsb2NhbCBWUkFNLCB3aGljaCBpcyBjb25uZWN0ZWQgYXQgbXVjaCBoaWdoZXIK
Pj4+PiBiYW5kd2lkdGguCj4+Pgo+Pj4gVGhlcmUgYXJlIHJlYXNvbnMgd2h5IEkgdGhpbmsgdGhl
IHByb2JsZW0gaXMgdGhlIGJhbmR3aWR0aDoKPj4+IDEuIFRoZSBzYW1lIGlzc3VlcyBkb24ndCBo
YXBwZW4gd2hlbiB0aGUgR1BVIGlzIG5vdCB1c2VkIHdpdGggYSBUQjMKPj4+IGVuY2xvc3VyZS4K
Pj4+IDIuIEluIGNhc2Ugb2YgcmFkZW9uc2ksIHRoZSBwcm9ibGVtIHdhcyBtaXRpZ2F0ZWQgb25j
ZSBNYXJlaydzIFNETUEKPj4+IHBhdGNoIHdhcyBtZXJnZWQsIHdoaWNoIGh1Z2VseSByZWR1Y2Vz
IHRoZSBQQ0llIGJhbmR3aWR0aCB1c2UuCj4+PiAzLiBJbiBsZXNzIG9wdGltaXplZCBjYXNlcyAo
Zm9yIGV4YW1wbGUgRDlWSyksIHRoZSBwcm9ibGVtIGlzIHN0aWxsCj4+PiB2ZXJ5IG5vdGljYWJs
ZS4KPj4KPj4gSG93ZXZlciwgc2luY2UgeW91IHNhdyBhcyBtdWNoIGFzIH4yMCBHYml0L3MgdW5k
ZXIgZGlmZmVyZW50Cj4+IGNpcmN1bXN0YW5jZXMsIHRoZSAyLjQzIEdiaXQvcyB1c2VkIGJ5IHRo
aXMgZ2FtZSBjbGVhcmx5IGlzbid0IGEgaGFyZAo+PiBsaW1pdDsgdGhlcmUgbXVzdCBiZSBvdGhl
ciBsaW1pdGluZyBmYWN0b3JzLgo+IAo+IFRoZXJlIG1heSBiZSBvdGhlciBmYWN0b3JzLCB5ZXMu
IEkgY2FuJ3Qgb2ZmZXIgYSBnb29kIGV4cGxhbmF0aW9uIG9uCj4gd2hhdCBleGFjdGx5IGlzIGhh
cHBlbmluZywgYnV0IGl0J3MgcHJldHR5IGNsZWFyIHRoYXQgYW1kZ3B1IGNhbid0IHRha2UKPiBm
dWxsIGFkdmFudGFnZSBvZiB0aGUgVEIzIGxpbmssIHNvIGl0IHNlZW1lZCBsaWtlIGEgZ29vZCBp
ZGVhIHRvIHN0YXJ0Cj4gaW52ZXN0aWdhdGluZyB0aGlzIGZpcnN0LgoKWWVhaCwgYWN0dWFsbHkg
aXQgd291bGQgYmUgY29uc2lzdGVudCB3aXRoIH4xNi0zMiBLQiBncmFudWxhcml0eQp0cmFuc2Zl
cnMgYmFzZWQgb24geW91ciBtZWFzdXJlbWVudHMgYWJvdmUsIHdoaWNoIGlzIHBsYXVzaWJsZS4g
U28KbWFraW5nIHN1cmUgdGhhdCB0aGUgZHJpdmVyIGRvZXNuJ3QgYXJ0aWZpY2lhbGx5IGxpbWl0
IHRoZSBQQ0llCmJhbmR3aWR0aCBtaWdodCBpbmRlZWQgaGVscC4KCk9UT0ggdGhpcyBhbHNvIGlu
ZGljYXRlcyBhIHNpbWlsYXIgcG90ZW50aWFsIGZvciBpbXByb3ZlbWVudCBieSB1c2luZwpsYXJn
ZXIgdHJhbnNmZXJzIGluIE1lc2EgYW5kL29yIHRoZSBrZXJuZWwuCgoKLS0gCkVhcnRobGluZyBN
aWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgIGh0dHBzOi8vd3d3LmFt
ZC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAg
IE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
