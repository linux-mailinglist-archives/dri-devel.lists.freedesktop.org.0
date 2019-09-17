Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA48B506C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 16:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B046E090;
	Tue, 17 Sep 2019 14:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6E2746E090;
 Tue, 17 Sep 2019 14:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 9557B322005;
 Tue, 17 Sep 2019 16:33:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id EScLsJbmhX9L; Tue, 17 Sep 2019 16:33:41 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id DE0EA322004;
 Tue, 17 Sep 2019 16:33:40 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.92.2)
 (envelope-from <michel@daenzer.net>)
 id 1iAEXv-0008Kf-Oe; Tue, 17 Sep 2019 16:33:35 +0200
Subject: Re: [PATCH] drm: add drm device name
To: christian.koenig@amd.com, Daniel Vetter <daniel@ffwll.ch>
References: <20190903214040.2386-1-sonny.jiang@amd.com>
 <CAAxE2A45N4gMYrcETDpznGKyxLztuwenFasL19a81QQmBkYiww@mail.gmail.com>
 <CAF6AEGvvUUOGujJC9P3t72N93AJuxiiVt0OAk8zf226Q8WmHvg@mail.gmail.com>
 <CAKMK7uHFNhdNY4Y9ZFMNuci7gssPWCT5f5y=e4npg8s5r_jBdQ@mail.gmail.com>
 <CAAxE2A6sESsKAi3K1etAZeCwAPgexn099G6g0aJQnavTkiH+mA@mail.gmail.com>
 <87woe7eanv.fsf@intel.com> <03d31464-3968-6923-5323-f63060d70f1f@gmail.com>
 <CAKMK7uEj4FZ3YQqG-cCTa4EEaJoAk09Zaz398F9Hmo+mdXCKiw@mail.gmail.com>
 <7540df63-e623-19b0-dde5-b89ff2b7fb89@amd.com>
 <7535dcf4-413f-f06f-b3d1-dcffc86b43e0@daenzer.net>
 <5d0a8619-7073-fac2-cdd6-83b55221140b@daenzer.net>
 <b61ec704-894d-092a-253c-961ff2ea01a2@gmail.com>
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
Message-ID: <4d255e1c-1d4a-a754-afe0-b18776a11a7e@daenzer.net>
Date: Tue, 17 Sep 2019 16:33:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b61ec704-894d-092a-253c-961ff2ea01a2@gmail.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0xNyAxOjIwIHAubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMTcu
MDkuMTkgdW0gMTE6Mjcgc2NocmllYiBNaWNoZWwgRMOkbnplcjoKPj4gT24gMjAxOS0wOS0xNyAx
MToyMyBhLm0uLCBNaWNoZWwgRMOkbnplciB3cm90ZToKPj4+IE9uIDIwMTktMDktMTcgMTA6MjMg
YS5tLiwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4+Pj4gQW0gMTcuMDkuMTkgdW0gMTA6MTcg
c2NocmllYiBEYW5pZWwgVmV0dGVyOgo+Pj4+PiBPbiBUdWUsIFNlcCAxNywgMjAxOSBhdCAxMDox
MiBBTSBDaHJpc3RpYW4gS8O2bmlnCj4+Pj4+IDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWls
LmNvbT4gd3JvdGU6Cj4+Pj4+PiBBbSAxNy4wOS4xOSB1bSAwNzo0NyBzY2hyaWViIEphbmkgTmlr
dWxhOgo+Pj4+Pj4+IE9uIE1vbiwgMTYgU2VwIDIwMTksIE1hcmVrIE9sxaHDoWsgPG1hcmFlb0Bn
bWFpbC5jb20+IHdyb3RlOgo+Pj4+Pj4+PiBUaGUgcHVycG9zZSBpcyB0byBnZXQgcmlkIG9mIGFs
bCBQQ0kgSUQgdGFibGVzIGZvciBhbGwgZHJpdmVycyBpbgo+Pj4+Pj4+PiB1c2Vyc3BhY2UuIChv
ciBhdCBsZWFzdCBzdG9wIHVwZGF0aW5nIHRoZW0pCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IE1lc2EgY29t
bW9uIGNvZGUgYW5kIG1vZGVzZXR0aW5nIHdpbGwgdXNlIHRoaXMuCj4+Pj4+Pj4gSSdkIHRoaW5r
IHRoaXMgd291bGQgd2FycmFudCBhIGhpZ2ggbGV2ZWwgZGVzY3JpcHRpb24gb2Ygd2hhdCB5b3UK
Pj4+Pj4+PiB3YW50Cj4+Pj4+Pj4gdG8gYWNoaWV2ZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCj4+
Pj4+PiBBbmQgbWF5YmUgZXhwbGljaXRseSBjYWxsIGl0IHVhcGlfbmFtZSBvciBldmVuIHVhcGlf
ZHJpdmVyX25hbWUuCj4+Pj4+IElmIGl0J3MgdWFwaV9uYW1lLCB0aGVuIHdoeSBkbyB3ZSBuZWVk
IGEgbmV3IG9uZSBmb3IgZXZlcnkgZ2VuZXJhdGlvbj8KPj4+Pj4gVXNlcnNwYWNlIGRyaXZlcnMg
dGVuZCB0byBzcGFuIGEgbG90IG1vcmUgdGhhbiBqdXN0IDEgZ2VuZXJhdGlvbi4gQW5kCj4+Pj4+
IGlmIHlvdSB3YW50IHRvIGhhdmUgcGVyLWdlbmVyYXRpb24gZGF0YSBmcm9tIHRoZSBrZXJuZWwg
dG8gdXNlcnNwYWNlLAo+Pj4+PiB0aGVuIGltbyB0aGF0J3MgbXVjaCBiZXR0ZXIgc3VpdGVkIGlu
IHNvbWUgYW1kZ3B1IGlvY3RsLCBpbnN0ZWFkIG9mCj4+Pj4+IHRyeWluZyB0byBlbmNvZGUgdGhh
dCBpbnRvIHRoZSBkcml2ZXIgbmFtZS4KPj4+PiBXZWxsIHdlIGFscmVhZHkgaGF2ZSBhbiBJT0NU
TCBmb3IgdGhhdCwgYnV0IEkgdGhvdWdodCB0aGUgaW50ZW50aW9uCj4+Pj4gaGVyZQo+Pj4+IHdh
cyB0byBnZXQgcmlkIG9mIHRoZSBQQ0ktSUQgdGFibGVzIGluIHVzZXJzcGFjZSB0byBmaWd1cmUg
b3V0IHdoaWNoCj4+Pj4gZHJpdmVyIHRvIGxvYWQuCj4+PiBUaGF0J3MganVzdCB1bnJlYWxpc3Rp
YyBpbiBnZW5lcmFsLCBJJ20gYWZyYWlkLiBTZWUgZS5nLiB0aGUgb25nb2luZwo+Pj4gdHJhbnNp
dGlvbiBmcm9tIGk5NjUgdG8gaXJpcyBmb3IgcmVjZW50IEludGVsIGhhcmR3YXJlLiBIb3cgaXMg
dGhlCj4+PiBrZXJuZWwgc3VwcG9zZWQgdG8ga25vdyB3aGljaCBkcml2ZXIgaXMgdG8gYmUgdXNl
ZD8KPiAKPiBXZWxsIGhvdyBpcyB1c2Vyc3BhY2UgY3VycmVudGx5IGhhbmRsaW5nIHRoYXQ/IFRo
ZSBrZXJuZWwgc2hvdWxkIE5PVCBzYXkKPiB3aGljaCBkcml2ZXIgdG8gdXNlIGluIHVzZXJzcGFj
ZSwgYnV0IHJhdGhlciB3aGljaCBvbmUgaXMgdXNlZCBpbiB0aGUKPiBrZXJuZWwuCgpXb3VsZCB0
aGF0IHJlYWxseSBoZWxwIHRob3VnaD8gRS5nLiB0aGUgcmFkZW9uIGtlcm5lbCBkcml2ZXIgc3Vw
cG9ydHMKcmFkZW9uL3IyMDAvcjMwMC9yNjAwL3JhZGVvbnNpIERSSSBkcml2ZXJzLCB0aGUgaTkx
NSBvbmUgaTkxNS9pOTY1L2lyaXMKKGFuZCB0aGUgYW1kZ3B1IG9uZSByYWRlb25zaS9hbWRncHUp
LgoKVGhlIEhXIGdlbmVyYXRpb24gaWRlbnRpZmllciBwcm9wb3NlZCBpbiB0aGVzZSBwYXRjaGVz
IG1pZ2h0IGJlIHVzZWZ1bCwKYnV0IEkgc3VzcGVjdCB0aGVyZSdsbCBhbHdheXMgYmUgY2FzZXMg
d2hlcmUgdXNlcnNwYWNlIG5lZWRzIHRvIGtub3cKbW9yZSBwcmVjaXNlbHkuCgoKPiBNYXBwaW5n
IHRoYXQgaW5mb3JtYXRpb24gdG8gYW4gdXNlcnNwYWNlIGRyaXZlciBzdGlsbCBuZWVkcyB0byBi
ZSBkb25lCj4gc29tZXdoZXJlIGVsc2UsIGJ1dCB0aGUgZGlmZmVyZW5jZSBpcyB0aGF0IHlvdSBk
b24ndCBuZWVkIHRvIGFkZCBhbGwKPiBQQ0ktSURzIHR3aWNlLgoKSXQgc2hvdWxkIG9ubHkgcmVh
bGx5IGJlIG5lY2Vzc2FyeSBpbiBNZXNhLgoKCk9uIDIwMTktMDktMTcgMTozMiBwLm0uLCBEYW5p
ZWwgVmV0dGVyIHdyb3RlOgo+IEhvdyBhcmUgb3RoZXIgY29tcG9zaXRvcnMgc29sdmluZyB0aGlz
PyBJIGRvbid0IGV4cGVjdCB0aGV5IGhhdmUgYQo+IHBjaWlkIHRhYmxlIGxpa2UgbW9kZXNldHRp
bmcgY29waWVkIHRvIGFsbCBvZiB0aGVtIC4uLgoKVGhleSBkb24ndCBuZWVkIGFueSBvZiB0aGlz
LiBUaGUgWG9yZyBtb2Rlc2V0dGluZyBkcml2ZXIgb25seSBkaWQgZm9yCmRldGVybWluaW5nIHRo
ZSBjbGllbnQgZHJpdmVyIG5hbWUgdG8gYWR2ZXJ0aXNlIHZpYSB0aGUgRFJJMiBleHRlbnNpb24u
CgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAgICAg
ICAgICBodHRwczovL3JlZGhhdC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAg
ICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
