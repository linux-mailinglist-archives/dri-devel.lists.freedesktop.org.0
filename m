Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDD16E81F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 17:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E97D6E843;
	Fri, 19 Jul 2019 15:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id A75C86E843;
 Fri, 19 Jul 2019 15:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id C02112A6045;
 Fri, 19 Jul 2019 17:44:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id Gk1MHVwshguw; Fri, 19 Jul 2019 17:44:05 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 00BA92A6042;
 Fri, 19 Jul 2019 17:44:04 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hoV3E-0004yg-4R; Fri, 19 Jul 2019 17:44:04 +0200
Subject: Re: [PATCH/RFT v1 0/6] drm/via: drop use of deprecated headers drmP.h
 and drm_os_linux.h
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>
References: <20190718153737.28657-1-sam@ravnborg.org>
 <20190719060712.GA26070@ravnborg.org>
 <e2a3b772-96e7-0fed-d269-bb103057cafe@daenzer.net>
 <20190719113212.GC3247@ravnborg.org>
 <CAKMK7uFgOOJ2DhaLnUaeCGHcfATtDxMsx6XsnSHtmdpc4DQeRw@mail.gmail.com>
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
Message-ID: <4bf5ad39-b37e-e7f4-63bb-71938b50a768@daenzer.net>
Date: Fri, 19 Jul 2019 17:44:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFgOOJ2DhaLnUaeCGHcfATtDxMsx6XsnSHtmdpc4DQeRw@mail.gmail.com>
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, openchrome-devel@lists.freedesktop.org,
 Kevin Brace <kevinbrace@gmx.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>, Ira Weiny <ira.weiny@intel.com>,
 Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0xOSAyOjM3IHAubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gRnJpLCBK
dWwgMTksIDIwMTkgYXQgMTozMiBQTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+IHdy
b3RlOgo+PiBPbiBGcmksIEp1bCAxOSwgMjAxOSBhdCAxMTowNTo0NEFNICswMjAwLCBNaWNoZWwg
RMOkbnplciB3cm90ZToKPj4+IE9uIDIwMTktMDctMTkgODowNyBhLm0uLCBTYW0gUmF2bmJvcmcg
d3JvdGU6Cj4+Pj4gT24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMDU6Mzc6MzFQTSArMDIwMCwgU2Ft
IFJhdm5ib3JnIHdyb3RlOgo+Pj4+PiBUaGlzIGlzIHNvbWUgamFuaXRvcmlhbCB1cGRhdGVzIHRv
IHRoZSB2aWEgZHJpdmVyCj4+Pj4+IHRoYXQgaXMgcmVxdWlyZWQgdG8gZ2V0IHJpZCBvZiBkZXBy
ZWNhdGVkIGhlYWRlcnMKPj4+Pj4gaW4gdGhlIGRybSBzdWJzeXN0ZW0uCj4+Pj4+Cj4+Pj4+IFRo
ZSBmaXJzdCB0aHJlZSBwYXRjaGVzIGFyZSB0cml2aWFsLCB3aGVyZQo+Pj4+PiB0aGUgZGVwZW5k
ZW5jaWVzIG9uIGRybVAuaCBhbmQgZHJtX29zX2xpbnV4IGFyZSBkcm9wcGVkLgo+Pj4+Pgo+Pj4+
PiBUaGUgcmVtYWluaW5nIHRocmVlIHBhdGNoZXMgZHJvcCB1c2Ugb2YgRFJNX1dBSVRfT04oKS4K
Pj4+Pj4gVGhleSBhcmUgcmVwbGFjZWQgYnkgd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlX3RpbWVv
dXQoKS4KPj4+Pj4gVGhlc2UgcGF0Y2hlcyBjb3VsZCB1c2UgYSBtb3JlIGNyaXRpY2FsIHJldmll
dy4KPj4+Pgo+Pj4+IFRoZSBkaWZmZXJlbmNlcyBiZXR3ZWVuIERSTV9XQUlUX09OKCkgYW5kCj4+
Pj4gd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlX3RpbWVvdXQoKSBhcmUgYmlnZ2VyIHRoYW4gYW50
aWNpcGF0ZWQuCj4+Pj4KPj4+PiBUaGUgY29udmVyc2lvbiBJIGRpZCBmb3IgZHJtX3ZibGFuay5j
IGlzIGJvZ3VzIHRodXMgSSBleHBlY3QKPj4+PiB0aGUgY29udmVyc2lvbiBkb25lIGZvciB2aWEg
aXMgYWxzbyBib2d1cy4KPj4+Cj4+PiBXaGF0IGV4YWN0bHkgaXMgdGhlIHByb2JsZW0gdGhvdWdo
PyBDYW4geW91IHNoYXJlIGluZm9ybWF0aW9uIGFib3V0IHRoZQo+Pj4gZmFpbHVyZXMgeW91J3Jl
IHNlZWluZz8KPj4+Cj4+PiBUaGVyZSB3YXMgc29tZSBkaXNjdXNzaW9uIGFib3V0IERSTV9XQUlU
X09OKCkgInBvbGxpbmciIG9uIElSQy4gSSBhc3N1bWUKPj4+IHRoYXQgcmVmZXJzIHRvIGl0IG9u
bHkgc2xlZXBpbmcgZm9yIHVwIHRvIDAuMDFzIGJlZm9yZSBjaGVja2luZyB0aGUKPj4+IGNvbmRp
dGlvbiBhZ2Fpbi4gSW4gY29udHJhc3QsIHdhaXRfZXZlbnRfaW50ZXJydXB0aWJsZV90aW1lb3V0
KCkgY2hlY2tzCj4+PiB0aGUgY29uZGl0aW9uIG9uY2UsIHRoZW4gc2xlZXBzIHVwIHRvIHRoZSBm
dWxsIHRpbWVvdXQgYmVmb3JlIGNoZWNraW5nCj4+PiBpdCBhZ2Fpbi4KPj4gQ29ycmVjdCAtIGl0
IHdhcyBiYXNlZCBvbiB0aGUgZmVlZGJhY2sgb24gaXJjIGZyb20gYWlybGllZCBhbmQgaWNrbGUK
Pj4gdGhhdCBtYWRlIG1lIGNvbmNsdWRlIHRoYXQgdGhlIHZpYSBwYXJ0IG1heSBub3QgYmUgZ29v
ZC4KPj4gSSBjYW5ub3Qgc2F5IGlmIHRoZSBwb2xsaW5nIHZlcnN1cyB0aW1lb3V0IGlzIHByb3Bl
cmx5IGRlYWx0IHdpdGggaW4gdGhlCj4+IHZpYSBkcml2ZXIgYW5kIEkgYW0gaW5jbGlkZWQgdG8g
anVzdCBtb3ZlIERSTV9XQUlUX09OKCkgdG8gdmlhX2Rydi5oIGFuZAo+PiBuYW1lIGl0IFZJQV9X
QUlUX09OKCkuCj4+IFRoZW4gdGhlIGNoYW5nZXMgdG8gdGhpcyBsZWdhY3kgZHJpdmVyIGlzIG1p
bmltYWwgYW5kIGl0IHdpbGwgbm90Cj4+IHByZXZlbnQgdXMgZnJvbSBnZXR0dGluZyByaWQgb2Yg
ZHJtX29zX2xpbnV4LmgKPj4KPj4+Cj4+PiBJZiB0aGF0IG1ha2VzIGEgZGlmZmVyZW5jZSBmb3Ig
ZHJtX3dhaXRfdmJsYW5rX2lvY3RsLCBpdCBpbmRpY2F0ZXMgdGhhdAo+Pj4gc29tZSBvdGhlciBj
b2RlIHdoaWNoIHVwZGF0ZXMgdGhlIHZibGFuayBjb3VudCBvciBjbGVhcnMgdmJsYW5rLT5lbmFi
bGVkCj4+PiBkb2Vzbid0IHdha2UgdXAgdGhlIHZibGFuay0+cXVldWUuCj4+IExldCBtZSBhbmFs
eXNlIGEgbGl0dGxlLi4uCj4+Cj4+IEluIGRybV9oYW5kbGVfdmJsYW5rKCkgdGhlcmUgaXMgYSBj
YWxsIHRvIHdha2VfdXAoJnZibGFuay0+cXVldWUpOwo+PiBBbmQgdGhpcyBpcyBjYWxsZWQgZnJv
bSBhbiBpbnRlcnJ1cHQgLSBPSy4KCkknbSBub3Qgc3VyZSB3aHkgaXQncyByZWxldmFudCB3aGV0
aGVyIG9yIG5vdCBhIGZ1bmN0aW9uIGNhbiBiZSBjYWxsZWQKZnJvbSBhbiBpbnRlcnJ1cHQgaGFu
ZGxlci4KCgo+PiBkcm1fdmJsYW5rX2VuYWJsZSgpIGlzIGNhbGxlZCBvdXRzaWRlIGFuIGludGVy
cnVwdCAtIG5vIG5lZWQgZm9yCj4+IHdha2VfdXAoKQoKVGhlcmUgaXMgbm8gbmVlZCBoZXJlIGJl
Y2F1c2UgdGhlcmUgY2FuIGJlIG5vIHNsZWVwaW5nIHdhaXRlcnMgaW4gdGhlCnF1ZXVlLCBiZWNh
dXNlIHZibGFuay0+ZW5hYmxlZCA9PSBmYWxzZSBpbW1lZGlhdGVseSB0ZXJtaW5hdGVzIGFueSB3
YWl0cy4KCgo+PiBkcm1fY3J0Y19hY2N1cmF0ZV92YmxhbmtfY291bnQoKSBpcyBjYWxsZWQgb3V0
c2lkZSBpbnRlcnJ1cHQgLSBubyBuZWVkCj4+IGZvciB3YWtlX3VwKCkKClRoaXMgaXMgY2FsbGVk
IGZyb20gaW50ZXJydXB0IGhhbmRsZXJzLCBhdCBsZWFzdCBmcm9tCmFtZGdwdV9kbS5jOmRtX3Bm
bGlwX2hpZ2hfaXJxKCkuIE5vdCBzdXJlIGl0IG5lZWRzIHRvIHdha2UgdXAgdGhlIHF1ZXVlCnRo
b3VnaCwgdGhlIGRyaXZlciBzaG91bGQgY2FsbCBkcm1fKGNydGNfKV9oYW5kbGVfdmJsYW5rIGFu
eXdheS4KCgo+PiBkcm1fdmJsYW5rX2Rpc2FibGVfYW5kX3NhdmUoKSBpcyBjYWxsZWQgb3V0c2lk
ZSBpbnRlcnJ1cHQgLSBubyBuZWVkIGZvcgo+PiB3YWtlX3VwKCknCgpJdCBjYW4gYmUgY2FsbGVk
IGZyb20gYW4gaW50ZXJydXB0LCB2aWEgZHJtX2hhbmRsZV92YmxhbmsgLT4KdmJsYW5rX2Rpc2Fi
bGVfZm4uIEhvd2V2ZXIsIHRoZSBvbmx5IHBsYWNlIHdoZXJlCmRybV92YmxhbmtfZGlzYWJsZV9h
bmRfc2F2ZSBjYW4gYmUgY2FsbGVkIHdpdGggc2xlZXBpbmcgd2FpdGVycyBpbiB0aGUKcXVldWUg
aXMgaW4gZHJtX2NydGNfdmJsYW5rX29mZiwgd2hpY2ggd2FrZXMgdXAgdGhlIHF1ZXVlIGFmdGVy
d2FyZHMKKHdoaWNoIHRlcm1pbmF0ZXMgYWxsIHdhaXRzLCBiZWNhdXNlIHZibGFuay0+ZW5hYmxl
ZCA9PSBmYWxzZSBhdCB0aGlzCnBvaW50KS4KCgo+PiBUaGF0IGlzIGFsbCBmdW5jdGlvbnMgSSBj
b3VsZCBkaWcgdXAgdGhhdCB1cGRhdGVzIHRoZSB2YmxhbmsgY291bnRlci4KCkkgYWdyZWUsIHRo
aXMgc2hvdWxkIGFsc28gY292ZXIgZXZlcnl0aGluZyB3aGljaCBjbGVhcnMgdmJsYW5rLT5lbmFi
bGVkLgoKClNvLCBhcmUgdGhlcmUgc3RpbGwgZmFpbHVyZXMgd2l0aCB2MiBvZiB0aGUgZHJtX3dh
aXRfdmJsYW5rX2lvY3RsIHBhdGNoCih3aGljaCBJIGhhdmVuJ3Qgc2VlbiBhZnRlciBhbGwgQlRX
KT8gSWYgeWVzLCBjYW4geW91IHNoYXJlIGluZm9ybWF0aW9uCmFib3V0IHRoZW0/IElmIG5vdCwg
d2h5IGRvIHlvdSB3YW50IHRvIHNlbmQgYSB2Mz8KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6Ru
emVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgaHR0cHM6Ly93d3cuYW1kLmNvbQpMaWJy
ZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQg
WCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
