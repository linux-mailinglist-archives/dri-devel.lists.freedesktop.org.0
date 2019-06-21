Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D69C4EBEA
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 17:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BCD6E8DC;
	Fri, 21 Jun 2019 15:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id C7EE96E8DC;
 Fri, 21 Jun 2019 15:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 1E0852A6045;
 Fri, 21 Jun 2019 17:24:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id LBM2VZpgo5yK; Fri, 21 Jun 2019 17:24:26 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 32DBC2A6042;
 Fri, 21 Jun 2019 17:24:26 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1heLOr-00022Z-To; Fri, 21 Jun 2019 17:24:25 +0200
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
To: Emil Velikov <emil.l.velikov@gmail.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <84b3337c-0cdc-44d4-02c6-c56bd729ed47@amd.com>
 <20190620163012.GF1896@arch-x1c3>
 <9cad6e74-4751-0b0a-35d1-e8f0ac4d3efc@amd.com>
 <20190621090953.GZ12905@phenom.ffwll.local>
 <be9f38f5-6bb5-9535-f3d9-bafa83370e0f@amd.com>
 <CAKMK7uE5qO4q3RYNDp22gkMSSJGgz9ChxhuWPYqXO6D1UUvy6Q@mail.gmail.com>
 <20190621102015.GA21486@arch-x1c3>
 <d241fab3-b6f0-d38a-b83f-03b70736b355@amd.com>
 <20190621105347.GB21486@arch-x1c3>
 <338bb519-05f1-cb76-d965-81237f432937@amd.com>
 <20190621115845.GC21486@arch-x1c3>
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
Message-ID: <38e0da2b-829a-3aa8-b25f-e10662ada099@daenzer.net>
Date: Fri, 21 Jun 2019 17:24:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190621115845.GC21486@arch-x1c3>
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
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0yMSAxOjU4IHAubS4sIEVtaWwgVmVsaWtvdiB3cm90ZToKPiBPbiAyMDE5LzA2
LzIxLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToKPj4gQW0gMjEuMDYuMTkgdW0gMTI6NTMgc2No
cmllYiBFbWlsIFZlbGlrb3Y6Cj4+PiBPbiAyMDE5LzA2LzIxLCBLb2VuaWcsIENocmlzdGlhbiB3
cm90ZToKPiAKPj4+Pj4gSW4gcGFydGljdWxhciwgdGhhdCB1c2VyLXNwYWNlIHdpbGwgInJlbW92
ZSIgcmVuZGVyIG5vZGVzLgo+Pj4+IFllcywgdGhhdCBpcyBteSBtYWluIGNvbmNlcm4gaGVyZS4g
WW91IGJhc2ljYWxseSBtYWtlIHJlbmRlciBub2Rlcwo+Pj4+IHN1cGVyZmx1b3VzbHkuIFRoYXQg
Z2l2ZXMgdXNlcnNwYWNlIGFsbCBsZWdpdGltaXphdGlvbiB0byBhbHNvIHJlbW92ZQo+Pj4+IHN1
cHBvcnQgZm9yIHRoZW0uIFRoYXQgaXMgbm90IHN0dXBpZCBvciBldmlsIG9yIHdoYXRldmVyLCB1
c2Vyc3BhY2UKPj4+PiB3b3VsZCBqdXN0IGZvbGxvdyB0aGUga2VybmVsIGRlc2lnbi4KPj4+Pgo+
Pj4gRG8geW91IGhhdmUgYW4gZXhhbXBsZSBvZiB1c2Vyc3BhY2UgZG9pbmcgc3VjaCBhbiBleHRy
ZW1lbHkgc2lsbHkgdGhpbmc/Cj4+PiBJdCBkb2VzIHNlZW0gbGlrZSBzdXNwZWN0IHlvdSdyZSBh
IGNvdXBsZSBvZiBzdGVwcyBiZXlvbmQgb3ZlcmNhdXRpb3VzLAo+Pj4gcGVyaGFwcyByaWdodGZ1
bGx5IHNvLiBNYXliZSB5b3UndmUgc2VlbiBzb21lIGNsb3NlZC1zb3VyY2UgdXNlci1zcGFjZQo+
Pj4gZ29pbmcgY3Jhenk/IE9yIGFueSBvdGhlciBwcm9qZWN0cz8KPj4KPj4gVGhlIGtleSBwb2lu
dCBpcyB0aGF0IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBzaWxseSBvciBzdHJhbmdlIG9yIGNyYXp5
IGF0IAo+PiBhbGwuIFNlZSB0aGUga2VybmVsIGRlZmluZXMgdGhlIGludGVyZmFjZSB1c2Vyc3Bh
Y2UgY2FuIGFuZCBzaG91bGQgdXNlLgo+Pgo+PiBXaGVuIHRoZSBrZXJuZWwgZGVmaW5lcyB0aGF0
IGV2ZXJ5dGhpbmcgd2lsbCB3b3JrIHdpdGggdGhlIHByaW1hcnkgbm9kZSAKPj4gaXQgaXMgcGVy
ZmVjdGx5IHZhbGlkIGZvciB1c2Vyc3BhY2UgdG8gZHJvcCBzdXBwb3J0IGZvciB0aGUgcmVuZGVy
IG5vZGUuCj4+Cj4+IEkgbWVhbiB3aHkgc2hvdWxkIHRoZXkga2VlcCB0aGlzPyBKdXN0IGJlY2F1
c2Ugd2UgdGVsbCB0aGVtIG5vdCB0byBkbyB0aGlzPwo+Pgo+IEZyb20geW91ciBleHBlcmllbnNl
LCBkbyB1c2VyLXNwYWNlIGRldmVsb3BlcnMgY2FyZSBhYm91dCBkb2luZyAob3IKPiBnZW5lcmFs
bHkgZG8pIHRoZSByaWdodCB0aGluZz8KPiAKPiBJbiBlaXRoZXIgY2FzZSwgYXMgcG9pbnRlZCBh
bHJlYWR5IHRoZSBjYXQgaXMgb3V0IG9mIHRoZSBiYWcgLSBoYXMgYmVlbgo+IGZvciB5ZWFycywg
YW5kIGlmIGRldmVsb3BlcnMgZGlkIGJlaGF2ZSBhcyB5b3UgZGVzY3JpYmUgdGhlbSB0aGV5IHdv
dWxkCj4gaGF2ZSAicmVtb3ZlZCIgcmVuZGVyIG5vZGVzIGFscmVhZHkuCgpUaGF0IG1heSBiZSB0
aGUgY2FzZSB3aXRoIHVzZXJzcGFjZSBzcGVjaWZpYyB0byBEUk1fQVVUSC1sZXNzIGtlcm5lbApk
cml2ZXJzLCBidXQgc3VjaCB1c2Vyc3BhY2UgY291bGRuJ3Qgd29yayB3aXRoIGFsbCB0aGUgb3Ro
ZXIgZHJpdmVycy4gU28KSSdkIGFyZ3VlIHRoYXQgd2hpbGUgdGhlIGJhZyBtYXkgYmUgb3BlbiBh
bmQgdGhlIGNhdCdzIHRhaWwgbWF5IGV2ZW4gYmUKc3RpY2tpbmcgb3V0IGFscmVhZHksIHRoZSBj
YXQgaXMgc3RpbGwgZmlybWx5IGluIHRoZSBiYWcuIDopCgoKLS0gCkVhcnRobGluZyBNaWNoZWwg
RMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgIGh0dHBzOi8vd3d3LmFtZC5jb20K
TGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2Eg
YW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
