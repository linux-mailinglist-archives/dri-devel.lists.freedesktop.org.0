Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E28644EBAD
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 17:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118C76E8D9;
	Fri, 21 Jun 2019 15:15:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9832E6E8D9;
 Fri, 21 Jun 2019 15:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 7DB072A6045;
 Fri, 21 Jun 2019 17:15:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id qffyfxHdmFEI; Fri, 21 Jun 2019 17:15:52 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id B1A792A6042;
 Fri, 21 Jun 2019 17:15:51 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1heLGH-0001wh-F0; Fri, 21 Jun 2019 17:15:33 +0200
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190614120927.GA32412@arch-x1c3>
 <9dbdda6c-8916-e5ae-1676-86828b9890e7@amd.com>
 <20190614155325.GC32412@arch-x1c3>
 <84b3337c-0cdc-44d4-02c6-c56bd729ed47@amd.com>
 <20190620163012.GF1896@arch-x1c3>
 <9cad6e74-4751-0b0a-35d1-e8f0ac4d3efc@amd.com>
 <20190621090953.GZ12905@phenom.ffwll.local>
 <be9f38f5-6bb5-9535-f3d9-bafa83370e0f@amd.com>
 <CAKMK7uE5qO4q3RYNDp22gkMSSJGgz9ChxhuWPYqXO6D1UUvy6Q@mail.gmail.com>
 <20190621102015.GA21486@arch-x1c3>
 <d241fab3-b6f0-d38a-b83f-03b70736b355@amd.com>
 <CAKMK7uEVziNZJES9=JFBUu=LpmubS8=-A654cMN+QqhEmc8Fvw@mail.gmail.com>
 <c92dc683-6815-dc5a-dc2b-54517cc027de@gmail.com>
 <CAKMK7uHsv3HOXOQq=GGRkx6f+ssRg7dO7qEoBqRS9V_KiTN3Hg@mail.gmail.com>
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
Message-ID: <b182c8e3-c060-71f0-2b3b-62600d825c9f@daenzer.net>
Date: Fri, 21 Jun 2019 17:15:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHsv3HOXOQq=GGRkx6f+ssRg7dO7qEoBqRS9V_KiTN3Hg@mail.gmail.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0yMSAxOjUwIHAubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gRnJpLCBK
dW4gMjEsIDIwMTkgYXQgMTozNyBQTSBDaHJpc3RpYW4gS8O2bmlnCj4gPGNrb2VuaWcubGVpY2h0
enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPj4gQW0gMjEuMDYuMTkgdW0gMTM6MDMgc2Nocmll
YiBEYW5pZWwgVmV0dGVyOgo+Pj4gU28gaWYgeW91IHdhbnQgdG8gZGVwcmFjYXRlIHJlbmRlciBm
dW5jdGlvbmFsaXR5IG9uIHByaW1hcnkgbm9kZXMsIHlvdQo+Pj4gX2hhdmVfIHRvIGRvIHRoYXQg
aGlkaW5nIGluIHVzZXJzcGFjZS4gT3IgeW91J2xsIGJyZWFrIGEgbG90IG9mCj4+PiBjb21wb3Np
dG9ycyBldmVyeXdoZXJlLiBKdXN0IHRlc3RpbmcgLWFtZGdwdSBkb2Vzbid0IHJlYWxseSBwcm92
ZQo+Pj4gYW55dGhpbmcgaGVyZS4gU28geW91IHdvbid0IG1vdmUgdGhlIGxhcmdlciBlY29zeXN0
ZW0gd2l0aCB0aGlzIGF0Cj4+PiBhbGwsIHRoYXQgc2hpcCBzYWlsZWQuCj4+Cj4+IFNvIHdoYXQg
ZWxzZSBjYW4gd2UgZG8/IFRoYXQgc291bmRzIGxpa2UgeW91IHN1Z2dlc3Qgd2Ugc2hvdWxkCj4+
IGNvbXBsZXRlbHkgZHJvcCByZW5kZXIgbm9kZSBmdW5jdGlvbmFsaXR5Lgo+Pgo+PiBJIG1lYW4g
aXQncyBub3QgbXkgcHJlZmVycmVkIG9wdGlvbiwgYnV0IGNlcnRhaW5seSBzb21ldGhpbmcgdGhh
dAo+PiBldmVyeWJvZHkgY291bGQgZG8uCj4+Cj4+IE15IHByaW1hcnkgY29uY2VybiBpcyB0aGF0
IHdlIHNvbWVob3cgbmVlZCB0byBnZXQgcmlkIG9mIHRoaW5rcyBsaWtlIEdFTQo+PiBmbGluayBh
bmQgYWxsIHRoYXQgb3RoZXIgY3J1ZnR5IHN0dWZmIHdlIHN0aWxsIGhhdmUgYXJvdW5kIG9uIHRo
ZQo+PiBwcmltYXJ5IG5vZGUgKHdlIHNob3VsZCBwcm9iYWJseSBtYWtlIGEgbGlzdCBvZiB0aGF0
KS4KPj4KPj4gU3dpdGNoaW5nIGV2ZXJ5dGhpbmcgb3ZlciB0byByZW5kZXIgbm9kZXMganVzdCBz
b3VuZGVkIGxpa2UgdGhlIGJlc3QKPj4gYWx0ZXJuYXRpdmUgc28gZmFyIHRvIGFyY2hpdmUgdGhh
dC4KPiAKPiB0YmggSSBkbyBsaWtlIHRoYXQgcGxhbiB0b28sIGJ1dCBpdCdzIGEgbG90IG1vcmUg
d29yay4gQW5kIEkgdGhpbmsgdG8KPiBoYXZlIGFueSBwdXNoIHdoYXRzb2V2ZXIgd2UgcHJvYmFi
bHkgbmVlZCB0byByb2xsIGl0IG91dCBpbiBnYm0gYXMgYQo+IGhhY2sgdG8ga2VlcCB0aGluZ3Mg
Z29pbmcuIEJ1dCBwcm9iYWJseSBub3QgZW5vdWdoLgo+IAo+IEkgYWxzbyB0aGluayB0aGF0IGF0
IGxlYXN0IHNvbWUgY29tcG9zaXRvcnMgd2lsbCBib3RoZXIgdG8gZG8gdGhlCj4gcmlnaHQgdGhp
bmcsIGFuZCBhY3R1YWxseSBib3RoZXIgd2l0aCByZW5kZXIgbm9kZXMgYW5kIGFsbCB0aGF0Cj4g
Y29ycmVjdGx5LiBJdCdzIGp1c3QgdGhhdCB0aGVyZSdzIHdheSBtb3JlIHdoaWNoIGRvbnQuCgpX
aXRoIGFtZGdwdSwgd2UgY2FuIG1ha2UgdXNlcnNwYWNlIGFsd2F5cyB1c2UgcmVuZGVyIG5vZGVz
IGZvciByZW5kZXJpbmcKd2l0aCBjaGFuZ2VzIHRvIGxpYmRybV9hbWRncHUvcmFkZW9uc2kveGY4
Ni12aWRlby1hbWRncHUgKGFuZCBtYXliZSBzb21lCmFtZGdwdS1wcm8gY29tcG9uZW50cykgb25s
eS4gTm8gR0JNL2NvbXBvc2l0b3IgY2hhbmdlcyBuZWVkZWQuCgoKPj4+IEF0IHRoYXQgcG9pbnQg
dGhpcyBhbGwgZmVlbHMgbGlrZSBhIGJpa2VzaGVkLCBhbmQgZm9yIGEgYmlrZXNoZWQgSQo+Pj4g
ZG9uJ3QgY2FyZSB3aGF0IHRoZSBjb2xvciBpcyB3ZSBwaWNrLCBhcyBsb25nIGFzIHRoZXkncmUg
YWxsIHBhaW50ZWQKPj4+IHRoZSBzYW1lLgoKVGhlbiBzb21lIHNoZWRzIHNob3VsZG4ndCBoYXZl
IGJlZW4gcmUtcGFpbnRlZCB3aXRob3V0IERSTV9BVVRIIGFscmVhZHkuLi4KCgo+Pj4gT25jZSB3
ZSBwaWNrZWQgYSBjb2xvciBpdCdzIGEgc2ltcGxlIHRlY2huaWNhbCBtYXR0ZXIgb2YgaG93IHRv
IHJvbGwKPj4+IGl0IG91dCwgdXNpbmcgS2NvbmZpZyBvcHRpb25zLCBvciBvbmx5IGVuYWJsaW5n
IG9uIG5ldyBodywgb3IgIm1lcmdlCj4+PiBhbmQgZml4IHRoZSByZWdyZXNzaW9ucyBhcyB0aGV5
IGNvbWUiIG9yIGFueSBvZiB0aGUgb3RoZXIgd2VsbCBwcm92ZW4KPj4+IHBhdGhzIGZvcndhcmQu
Cj4+Cj4+IFllYWgsIHRoZSBwcm9ibGVtIGlzIEkgZG9uJ3Qgc2VlIGFuIG9wdGlvbiB3aGljaCBj
dXJyZW50bHkgd29ya3MgZm9yCj4+IGV2ZXJ5b25lLgo+Pgo+PiBJIGFic29sdXRlbHkgbmVlZCBh
IGdyYWNlIHRpbWUgb2YgbXVsdGlwbGUgeWVhcnMgdW50aWwgd2UgY2FuIGFwcGx5IHRoaXMKPj4g
dG8gYW1kZ3B1L3JhZGVvbi4KPiAKPiBZZWFoIHRoYXQncyB3aGF0IEkgbWVhbnQgd2l0aCAicGlj
ayBhIGNvbG9yLCBwaWNrIGEgd2F5IHRvIHJvbGwgaXQKPiBvdXQiLiAiZW5hYmxlIGZvciBuZXcg
aHcsIHJvbGwgb3V0IHllYXJzIGFuZCB5ZWFycyBsYXRlciIgaXMgb25lIG9mCj4gdGhlIG9wdGlv
bnMgZm9yIHJvbGwgb3V0LgoKT25lIGdvdGNoYSBiZWluZyB0aGF0IGdlbmVyaWMgdXNlcnNwYWNl
IHN1Y2ggYXMgdGhlIFhvcmcgbW9kZXNldHRpbmcKZHJpdmVyIG1heSBzdGlsbCB0cnkgdG8gdXNl
IHBoYXNlZCBvdXQgZnVuY3Rpb25hbGl0eSBzdWNoIGFzIERSSTIgd2l0aApuZXcgaGFyZHdhcmUu
CgoKPj4gSG93IGFib3V0IHRoaXM6Cj4+IDEuIFdlIGtlZXAgRFJNX0FVVEggYXJvdW5kIGZvciBh
bWRncHUvcmFkZW9uIGZvciBub3cuCj4+IDIuIFdlIGFkZCBhIEtjb25maWcgb3B0aW9uIHRvIGln
bm9yZSBEUk1fQVVUSCwgY3VycmVudGx5IGRlZmF1bHQgdG8gTi4KPj4gVGhpcyBhbHNvIHdvcmtz
IGFzIGEgd29ya2Fyb3VuZCBmb3Igb2xkIFJBRFYuCj4+IDMuIFdlIHN0YXJ0IHRvIHdvcmsgb24g
ZnVydGhlciByZW1vdmluZyBvbGQgY3J1ZnQgZnJvbSB0aGUgcHJpbWFyeSBub2RlLgo+PiBQb3Nz
aWJsZSB0aGUgS2NvbmZpZyBvcHRpb24gSSBzdWdnZXN0ZWQgdG8gZGlzYWJsZSBHRU0gZmxpbmsu
Cj4gCj4gSG0gSSdtIG5vdCB3b3JyaWVkIGFib3V0IGZsaW5rIHJlYWxseS4gSXQncyBnZW1fb3Bl
biB3aGljaCBpcyB0aGUKPiBzZWN1cml0eSBnYXAsIGFuZCB0aGF0IG9uZSBoYXMgdG8gc3RheSBt
YXN0ZXItb25seSBmb3JldmVyLgoKR0VNX09QRU4gaXMgdXNlZCBieSBEUkkyIGNsaWVudHMsIGl0
IGNhbid0IGJlIG1hc3Rlci1vbmx5LiBJdCdzIHByb2JhYmx5Cm9uZSBvZiB0aGUgbWFpbiByZWFz
b25zIGZvciB0aGUgZXhpc3RlbmNlIG9mIERSTV9BVVRILgoKCi0tIApFYXJ0aGxpbmcgTWljaGVs
IETDpG56ZXIgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICBodHRwczovL3d3dy5hbWQuY29t
CkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAgICAgfCAgICAgICAgICAgICBNZXNh
IGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
