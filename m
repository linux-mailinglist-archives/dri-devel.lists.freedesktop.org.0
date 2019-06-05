Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B276235AAB
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 12:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B22892D2;
	Wed,  5 Jun 2019 10:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id EECF4892D2;
 Wed,  5 Jun 2019 10:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 16FCA2AA02B;
 Wed,  5 Jun 2019 12:50:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id OJAOeRmgfiwu; Wed,  5 Jun 2019 12:50:42 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 583132A6016;
 Wed,  5 Jun 2019 12:50:42 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hYTVA-0001Y3-Nn; Wed, 05 Jun 2019 12:50:40 +0200
Subject: Re: [PATCH] drm/ioctl: Ditch DRM_UNLOCKED except for the legacy
 vblank ioctl
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20190529093038.27911-1-daniel.vetter@ffwll.ch>
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
Message-ID: <6a854762-0cd9-0c09-dadb-f3d8694a697f@daenzer.net>
Date: Wed, 5 Jun 2019 12:50:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529093038.27911-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0yOSAxMTozMCBhLm0uLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IFRoaXMgY29t
cGxldGVzIEVtaWwncyBzZXJpZXMgb2YgcmVtb3ZpbmcgRFJNX1VOTE9DS0VEIGZyb20gbW9kZXJu
Cj4gZHJpdmVycy4gSXQncyBlbnRpcmVseSBjYXJnby1jdWx0ZWQgc2luY2Ugd2UgaWdub3JlIGl0
IG9uCj4gbm9uLURSSVZFUl9MRUdBQ1kgZHJpdmVycyBzaW5jZToKPiAKPiBjb21taXQgZWE0ODc4
MzVlODg3NmFiZjdhZDkwOTYzNmUzMDhjODAxYTJiY2RhNgo+IEF1dGhvcjogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBEYXRlOiAgIE1vbiBTZXAgMjggMjE6NDI6NDAg
MjAxNSArMDIwMAo+IAo+ICAgICBkcm06IEVuZm9yY2UgdW5sb2NrZWQgaW9jdGwgb3BlcmF0aW9u
IGZvciBrbXMgZHJpdmVyIGlvY3Rscwo+IAo+IE5vdyBqdXN0aWZ5aW5nIHdoeSB3ZSBjYW4gZG8g
dGhpcyBmb3IgbGVnYWN5IGRyaXZlcyB0b28gKGFuZCBoZW5jZQo+IGNsb3NlIHRoZSBzb3VyY2Ug
b2YgYWxsIHRoZSBib2d1cyBjb3B5cGFzdGluZykgaXMgYSBiaXQgbW9yZSBpbnZvbHZlZC4KPiBE
Uk1fVU5MT0NLRUQgd2FzIGludHJvZHVjZWQgaW46Cj4gCj4gY29tbWl0IGVkOGI2NzA0MDk2NWU0
ZmU2OTVkYjMzM2Q1OTE0ZTE4ZWE1ZjE0NmYKPiBBdXRob3I6IEFybmQgQmVyZ21hbm4gPGFybmRA
YXJuZGIuZGU+Cj4gRGF0ZTogICBXZWQgRGVjIDE2IDIyOjE3OjA5IDIwMDkgKzAwMDAKPiAKPiAg
ICAgZHJtOiBjb252ZXJ0IGRybV9pb2N0bCB0byB1bmxvY2tlZF9pb2N0bAo+IAo+IEFzIGEgaW1t
ZWRpYXRlIGhhY2sgdG8ga2VlcCBpODEwIGhhcHB5LCB3aGljaCB3b3VsZCBoYXZlIGRlYWRsb2Nr
ZWQKPiB3aXRob3V0IHRoaXMgdHJpY2tlcnkuIFRoZSBvbGQgQktMIGlzIGF1dG9tYXRpY2FsbHkg
ZHJvcHBlZCBpbgo+IHNjaGVkdWxlKCksIGFuZCBoZW5jZSB0aGUgaTgxMCB2cy4gbW1hcF9zZW0g
ZGVhZGxvY2sgZGlkbid0IGFjdHVhbGx5Cj4gY2F1c2UgYSByZWFsIGRlYWRsb2NrLiBCdXQgd2l0
aCBhIG11dGV4IGl0IHdvdWxkLiBUaGUgc29sdXRpb24gd2FzIHRvCj4gYW5ub3RhdGUgdGhlc2Ug
YXMgRFJNX1VOTE9DS0VEIGFuZCBtYXJrIGk4MTAgdW5zYWZlIG9uIFNNUCBtYWNoaW5lcy4KPiAK
PiBUaGlzIGNvbnZlcnNpb24gY2F1c2VkIGEgcmVncmVzc2lvbiwgYmVjYXVzZSB1bmxpa2UgdGhl
IEJLTCBhIG11dGV4Cj4gaXNuJ3QgZHJvcHBlZCBvdmVyIHNjaGVkdWxlICh0aGF0IHRoaW5nIGFn
YWluKSwgd2hpY2ggY2F1c2VkIGEgdmJsYW5rCj4gd2FpdCBpbiBvbmUgdGhyZWFkIHRvIGJsb2Nr
IHRoZSBlbnRpcmUgZGVza3RvcCBhbmQgYWxsIGl0cyBhcHBzLiBCYWNrCj4gdGhlbiB3ZSBkaWQg
dmJsYW5rIHNjaGVkdWxpbmcgYnkgYmxvY2tpbmcgaW4gdGhlIGNsaWVudCwgYXdlc29tZSBpc24n
dAo+IGl0LiBUaGlzIHdhcyBmaXhlZCBxdWlja2x5IGluIChvayBub3Qgc28gcXVpY2tseSwgdG9v
ayAyIHllYXJzKToKPiAKPiBjb21taXQgOGY0ZmYyYjA2YWZjZDZmMTUxODY4NDc0YTQzMmM2MDMw
NTdlYWY1Ngo+IEF1dGhvcjogSWxpamEgSGFkemljIDxpaGFkemljQHJlc2VhcmNoLmJlbGwtbGFi
cy5jb20+Cj4gRGF0ZTogICBNb24gT2N0IDMxIDE3OjQ2OjE4IDIwMTEgLTA0MDAKPiAKPiAgICAg
ZHJtOiBkbyBub3Qgc2xlZXAgb24gdmJsYW5rIHdoaWxlIGhvbGRpbmcgYSBtdXRleAo+IAo+IEFs
bCB0aGUgb3RoZXIgRFJNX1VOTE9DS0VEIGFubm90YXRpb25zIGZvciBhbGwgdGhlIGNvcmUgaW9j
dGxzIHdhcwo+IHdvcmsgdG8gcmVhY2ggZmluZXItZ3JhaW5lZCBsb2NraW5nIGZvciBtb2Rlcm4g
ZHJpdmVycy4gVGhpcyB0b29rCj4geWVhcnMsIGFuZCBjdWxtaW5hdGVkIGluOgo+IAo+IGNvbW1p
dCBmZGQ1Yjg3N2U5ZWJjMjAyOWUxMzczYjRhM2NkMDU3MzI5YTlhYjdhCj4gQXV0aG9yOiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IERhdGU6ICAgU2F0IERlYyAxMCAy
Mjo1Mjo1NCAyMDE2ICswMTAwCj4gCj4gICAgIGRybTogRW5mb3JjZSBCS0wtbGVzcyBpb2N0bHMg
Zm9yIG1vZGVybiBkcml2ZXJzCj4gCj4gRFJNX1VOTE9DS0VEIHdhcyBuZXZlciByZXF1aXJlZCBi
eSBhbnkgbGVnYWN5IGRyaXZlcnMsIGV4Y2VwdCBmb3IgdGhlCj4gdmJsYW5rX3dhaXQgSU9DVEwu
IFRoZXJlZm9yZSB3ZSB3aWxsIG5vdCByZWdyZXNzIHRoZXNlIG9sZCBkcml2ZXJzIGJ5Cj4gZ29p
bmcgYmFjayB0byB3aGVyZSB3ZSd2ZSBiZWVuIGluIDIwMTEuIEZvciBhbGwgbW9kZXJuIGRyaXZl
cnMgbm90aGluZwo+IHdpbGwgY2hhbmdlLgo+IAo+IFRvIG1ha2UgdGhpcyBwZXJmZWN0bHkgY2xl
YXIsIGFsc28gYWRkIGEgY29tbWVudCB0byBEUk1fVU5MT0NLRUQuCj4gCj4gQ2M6IEVtaWwgVmVs
aWtvdiA8ZW1pbC5sLnZlbGlrb3ZAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2lvY3RsLmMgfCAxMzkgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCj4g
IGluY2x1ZGUvZHJtL2RybV9pb2N0bC5oICAgICB8ICAgMyArCj4gIDIgZmlsZXMgY2hhbmdlZCwg
NzIgaW5zZXJ0aW9ucygrKSwgNzAgZGVsZXRpb25zKC0pCgpEaWQgeW91IG1pc3MgZHJpdmVycy9n
cHUvZHJtL2RybV9pb2MzMi5jID8KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAg
ICAgICAgICAgfCAgICAgICAgICAgICAgaHR0cHM6Ly93d3cuYW1kLmNvbQpMaWJyZSBzb2Z0d2Fy
ZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9w
ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
