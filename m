Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44E5505E4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 11:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CC68984E;
	Mon, 24 Jun 2019 09:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3AFDF8984E;
 Mon, 24 Jun 2019 09:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 138F02AA128;
 Mon, 24 Jun 2019 11:37:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id njmjWG6_cvoD; Mon, 24 Jun 2019 11:37:15 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 648E12AA040;
 Mon, 24 Jun 2019 11:37:15 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hfLPW-0005rm-T2; Mon, 24 Jun 2019 11:37:14 +0200
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
To: Daniel Vetter <daniel@ffwll.ch>
References: <9cad6e74-4751-0b0a-35d1-e8f0ac4d3efc@amd.com>
 <20190621090953.GZ12905@phenom.ffwll.local>
 <be9f38f5-6bb5-9535-f3d9-bafa83370e0f@amd.com>
 <CAKMK7uE5qO4q3RYNDp22gkMSSJGgz9ChxhuWPYqXO6D1UUvy6Q@mail.gmail.com>
 <20190621102015.GA21486@arch-x1c3>
 <d241fab3-b6f0-d38a-b83f-03b70736b355@amd.com>
 <CAKMK7uEVziNZJES9=JFBUu=LpmubS8=-A654cMN+QqhEmc8Fvw@mail.gmail.com>
 <c92dc683-6815-dc5a-dc2b-54517cc027de@gmail.com>
 <CAKMK7uHsv3HOXOQq=GGRkx6f+ssRg7dO7qEoBqRS9V_KiTN3Hg@mail.gmail.com>
 <b182c8e3-c060-71f0-2b3b-62600d825c9f@daenzer.net>
 <20190621154416.GE12905@phenom.ffwll.local>
 <13024821-4767-eeaf-86eb-9ae1056f8931@daenzer.net>
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
Message-ID: <b03e8977-c51a-9606-383f-cf4ba674dcdd@daenzer.net>
Date: Mon, 24 Jun 2019 11:37:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <13024821-4767-eeaf-86eb-9ae1056f8931@daenzer.net>
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
Cc: David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0yMSA1OjUyIHAubS4sIE1pY2hlbCBEw6RuemVyIHdyb3RlOgo+IE9uIDIwMTkt
MDYtMjEgNTo0NCBwLm0uLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+PiBPbiBGcmksIEp1biAyMSwg
MjAxOSBhdCAwNToxNToyMlBNICswMjAwLCBNaWNoZWwgRMOkbnplciB3cm90ZToKPj4+IE9uIDIw
MTktMDYtMjEgMTo1MCBwLm0uLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+Pj4+IE9uIEZyaSwgSnVu
IDIxLCAyMDE5IGF0IDE6MzcgUE0gQ2hyaXN0aWFuIEvDtm5pZwo+Pj4+IDxja29lbmlnLmxlaWNo
dHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4+IEFtIDIxLjA2LjE5IHVtIDEzOjAzIHNj
aHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+Pj4+IFNvIGlmIHlvdSB3YW50IHRvIGRlcHJhY2F0ZSBy
ZW5kZXIgZnVuY3Rpb25hbGl0eSBvbiBwcmltYXJ5IG5vZGVzLCB5b3UKPj4+Pj4+IF9oYXZlXyB0
byBkbyB0aGF0IGhpZGluZyBpbiB1c2Vyc3BhY2UuIE9yIHlvdSdsbCBicmVhayBhIGxvdCBvZgo+
Pj4+Pj4gY29tcG9zaXRvcnMgZXZlcnl3aGVyZS4gSnVzdCB0ZXN0aW5nIC1hbWRncHUgZG9lc24n
dCByZWFsbHkgcHJvdmUKPj4+Pj4+IGFueXRoaW5nIGhlcmUuIFNvIHlvdSB3b24ndCBtb3ZlIHRo
ZSBsYXJnZXIgZWNvc3lzdGVtIHdpdGggdGhpcyBhdAo+Pj4+Pj4gYWxsLCB0aGF0IHNoaXAgc2Fp
bGVkLgo+Pj4+Pgo+Pj4+PiBTbyB3aGF0IGVsc2UgY2FuIHdlIGRvPyBUaGF0IHNvdW5kcyBsaWtl
IHlvdSBzdWdnZXN0IHdlIHNob3VsZAo+Pj4+PiBjb21wbGV0ZWx5IGRyb3AgcmVuZGVyIG5vZGUg
ZnVuY3Rpb25hbGl0eS4KPj4+Pj4KPj4+Pj4gSSBtZWFuIGl0J3Mgbm90IG15IHByZWZlcnJlZCBv
cHRpb24sIGJ1dCBjZXJ0YWlubHkgc29tZXRoaW5nIHRoYXQKPj4+Pj4gZXZlcnlib2R5IGNvdWxk
IGRvLgo+Pj4+Pgo+Pj4+PiBNeSBwcmltYXJ5IGNvbmNlcm4gaXMgdGhhdCB3ZSBzb21laG93IG5l
ZWQgdG8gZ2V0IHJpZCBvZiB0aGlua3MgbGlrZSBHRU0KPj4+Pj4gZmxpbmsgYW5kIGFsbCB0aGF0
IG90aGVyIGNydWZ0eSBzdHVmZiB3ZSBzdGlsbCBoYXZlIGFyb3VuZCBvbiB0aGUKPj4+Pj4gcHJp
bWFyeSBub2RlICh3ZSBzaG91bGQgcHJvYmFibHkgbWFrZSBhIGxpc3Qgb2YgdGhhdCkuCj4+Pj4+
Cj4+Pj4+IFN3aXRjaGluZyBldmVyeXRoaW5nIG92ZXIgdG8gcmVuZGVyIG5vZGVzIGp1c3Qgc291
bmRlZCBsaWtlIHRoZSBiZXN0Cj4+Pj4+IGFsdGVybmF0aXZlIHNvIGZhciB0byBhcmNoaXZlIHRo
YXQuCj4+Pj4KPj4+PiB0YmggSSBkbyBsaWtlIHRoYXQgcGxhbiB0b28sIGJ1dCBpdCdzIGEgbG90
IG1vcmUgd29yay4gQW5kIEkgdGhpbmsgdG8KPj4+PiBoYXZlIGFueSBwdXNoIHdoYXRzb2V2ZXIg
d2UgcHJvYmFibHkgbmVlZCB0byByb2xsIGl0IG91dCBpbiBnYm0gYXMgYQo+Pj4+IGhhY2sgdG8g
a2VlcCB0aGluZ3MgZ29pbmcuIEJ1dCBwcm9iYWJseSBub3QgZW5vdWdoLgo+Pj4+Cj4+Pj4gSSBh
bHNvIHRoaW5rIHRoYXQgYXQgbGVhc3Qgc29tZSBjb21wb3NpdG9ycyB3aWxsIGJvdGhlciB0byBk
byB0aGUKPj4+PiByaWdodCB0aGluZywgYW5kIGFjdHVhbGx5IGJvdGhlciB3aXRoIHJlbmRlciBu
b2RlcyBhbmQgYWxsIHRoYXQKPj4+PiBjb3JyZWN0bHkuIEl0J3MganVzdCB0aGF0IHRoZXJlJ3Mg
d2F5IG1vcmUgd2hpY2ggZG9udC4KPj4+Cj4+PiBXaXRoIGFtZGdwdSwgd2UgY2FuIG1ha2UgdXNl
cnNwYWNlIGFsd2F5cyB1c2UgcmVuZGVyIG5vZGVzIGZvciByZW5kZXJpbmcKPj4+IHdpdGggY2hh
bmdlcyB0byBsaWJkcm1fYW1kZ3B1L3JhZGVvbnNpL3hmODYtdmlkZW8tYW1kZ3B1IChhbmQgbWF5
YmUgc29tZQo+Pj4gYW1kZ3B1LXBybyBjb21wb25lbnRzKSBvbmx5LiBObyBHQk0vY29tcG9zaXRv
ciBjaGFuZ2VzIG5lZWRlZC4KPj4KPj4gVGhpcyBpcyBhIHZlcnkgbm9uLWV4aGF1c3RpdmUgbGlz
dCBvZiB1c2Vyc3BhY2UgdGhhdCBydW5zIG9uIHlvdXIgZHJpdmVyCj4+IC4uLiBUaGlzIHdheWxh
bmQgY29tcG9zaXRvciB0aGluZywgYWN0dWFsbHkgc2hpcHBpbmcgbm93LCBhbmQgdGhlcmUncyBt
YW55IDotKQo+IAo+IFlvdSBkb24ndCBzZWVtIHRvIHVuZGVyc3RhbmQgd2hhdCBJIHdyb3RlLiBF
dmVyeXRoaW5nIHdpbGwgd29yayBhdCBsZWFzdAo+IGFzIHdlbGwgYXMgbm93LCB3aXRob3V0IGFu
eSBvdGhlciBjaGFuZ2VzLgo+IAo+IFsuLi5dCj4gCj4+IFRoYXQgd2FzIHRoZSBlbnRpcmUgcG9p
bnQgb2Yga21zLCBhbmQgaXQgc3VjY2VlZCByZWFsbHkgd2VsbC4gVGhhdCdzCj4+IHdoeSBJIGRv
bid0IHRoaW5rIGFtZGdwdSBkb2luZyB0aGVpciBvd24gZmxhdm91ciBwaWNrIGlzIGdvaW5nIHRv
IGhlbHAKPj4gYW55b25lIGhlcmUsCj4gT3RoZXIgZHJpdmVycyBhcmUgd2VsY29tZSB0byBlbXVs
YXRlIGFtZGdwdSdzIGRlc2lnbiBtYWtpbmcgdGhlIGFib3ZlCj4gcG9zc2libGUuIDopCgpTZXJp
b3VzbHkgdGhvdWdoLCBJIGRvbid0IHRoaW5rIGFueSBjaGFuZ2VzIG91dHNpZGUgb2YgbGliZHJt
L01lc2EKc2hvdWxkIGJlIG5lZWRlZCB3aXRoIG90aGVyIGRyaXZlcnMgZWl0aGVyLiBGdW5kYW1l
bnRhbGx5IHRoZXJlJ3MKbm90aGluZyBtYWdpYyBhYm91dCBpdCwganVzdCBzaGFyaW5nIEJPcyB2
aWEgUFJJTUUgYmV0d2VlbiB0aGUgcmVuZGVyCm5vZGUgZmlsZSBkZXNjcmlwdGlvbiBhbmQgdGhh
dCBwYXNzZWQgaW4gdmlhIHRoZSBFR0wvR0JNLy4uLiBBUEkuCgoKLS0gCkVhcnRobGluZyBNaWNo
ZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgIGh0dHBzOi8vd3d3LmFtZC5j
b20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1l
c2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
