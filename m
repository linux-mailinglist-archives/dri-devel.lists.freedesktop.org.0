Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2825F6E3
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 12:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9326E2EF;
	Thu,  4 Jul 2019 10:57:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id E5B916E316;
 Thu,  4 Jul 2019 10:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 183212A6045;
 Thu,  4 Jul 2019 12:56:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id Ev-MEh71JS6B; Thu,  4 Jul 2019 12:56:57 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 8E31A2A6042;
 Thu,  4 Jul 2019 12:56:57 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hizQ3-0000jx-MQ; Thu, 04 Jul 2019 12:56:51 +0200
Subject: Re: [PATCH] drm: allow render capable master with DRM_AUTH ioctls
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
References: <20190703133104.3211-1-emil.l.velikov@gmail.com>
 <20190703171001.20474-1-emil.l.velikov@gmail.com>
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
Message-ID: <ab5666f6-f35d-b63d-c03f-fa295e1c2908@daenzer.net>
Date: Thu, 4 Jul 2019 12:56:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190703171001.20474-1-emil.l.velikov@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0wMyA3OjEwIHAubS4sIEVtaWwgVmVsaWtvdiB3cm90ZToKPiBGcm9tOiBFbWls
IFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+IAo+IFRoZXJlIGFyZSBjYXNl
cyAoaW4gbWVzYSBhbmQgYXBwbGljYXRpb25zKSB3aGVyZSBvbmUgd291bGQgb3BlbiB0aGUKPiBw
cmltYXJ5IG5vZGUgd2l0aG91dCBwcm9wZXJseSBhdXRoZW50aWNhdGluZyB0aGUgY2xpZW50Lgo+
IAo+IFNvbWV0aW1lcyB3ZSBkb24ndCBjaGVjayBpZiB0aGUgYXV0aGVudGljYXRpb24gc3VjY2Vl
ZHMsIGJ1dCB0aGVyZSdzCj4gYWxzbyBjYXNlcyB3ZSBzaW1wbHkgZm9yZ2V0IHRvIGRvIGl0Lgo+
IAo+IFRoZSBmb3JtZXIgd2FzIGEgY2FzZSBmb3IgTWVzYSB3aGVyZSBpdCBkaWQgbm90IG5vdCBj
aGVjayB0aGUgcmV0dXJuCj4gdmFsdWUgb2YgZHJtR2V0TWFnaWMoKSBbMV0uIFRoYXQgd2FzIGZp
eGVkIHJlY2VudGx5IGFsdGhvdWdoLCB0aGVyZSdzCj4gdGhlIHF1ZXN0aW9uIG9mIG9sZGVyIGRy
aXZlcnMgb3Igb3RoZXIgYXBwcyB0aGF0IGV4YmliaXQgdGhpcyBiZWhhdmlvdXIuCj4gCj4gV2hp
bGUgb21pdHRpbmcgdGhlIGNhbGwgcmVzdWx0cyBpbiBpc3N1ZXMgYXMgc2VlbiBpbiBbMl0gYW5k
IFszXS4KPiAKPiBJbiB0aGUgbGlidmEgY2FzZSwgbGlidmEgaXRzZWxmIGRvZXNuJ3QgYXV0aGVu
dGljYXRlIHRoZSBEUk0gY2xpZW50IGFuZAo+IHRoZSB2YUdldERpc3BsYXlEUk0gZG9jdW1lbnRh
dGlvbiBkb2Vzbid0IG1lbnRpb24gaWYgdGhlIGFwcCBzaG91bGQKPiBlaXRoZXIuCj4gCj4gQXMg
b2YgdG9kYXksIHRoZSBvZmZpY2lhbCB2YWluZm8gdXRpbGl0eSBkb2Vzbid0IGF1dGhlbnRpY2F0
ZS4KPiAKPiBUbyB3b3JrYXJvdW5kIGlzc3VlcyBsaWtlIHRoZXNlLCBzb21lIHVzZXJzIHJlc29y
dCB0byBydW5uaW5nIHRoZWlyIGFwcHMKPiB1bmRlciBzdWRvLiBXaGljaCBhZG1pdHRlZGx5IGlz
bid0IGFsd2F5cyBhIGdvb2QgaWRlYS4KPiAKPiBTaW5jZSBhbnkgRFJJVkVSX1JFTkRFUiBkcml2
ZXIgaGFzIHN1ZmZpY2llbnQgaXNvbGF0aW9uIGJldHdlZW4gY2xpZW50cywKPiB3ZSBjYW4gdXNl
IHRoYXQsIGZvciB1bmF1dGhlbnRpY2F0ZWQgW3ByaW1hcnkgbm9kZV0gaW9jdGxzIHRoYXQgcmVx
dWlyZQo+IERSTV9BVVRILiBCdXQgb25seSBpZiB0aGUgcmVzcGVjdGl2ZSBpb2N0bCBpcyB0YWdn
ZWQgYXMgRFJNX1JFTkRFUl9BTExPVy4KPiAKPiB2MjoKPiAtIFJld29yay9zaW1wbGlmeSBpZiBj
aGVjayAoRGFuaWVsIFYpCj4gLSBBZGQgZXhhbXBsZXMgdG8gY29tbWl0IG1lc3NhZ2VzLCBlbGFi
b3JhdGUuIChEYW5pZWwgVikKPiAKPiB2MzoKPiAtIFVzZSBzaW5nbGUgdW5saWtlbHkgKERhbmll
bCBWKQo+IAo+IHY0Ogo+IC0gUmVhcHBseSBwYXRjaCwgY2hlY2sgZm9yIGFtZGdwdS9yYWRlb24g
aW5saW5lLgo+IAo+IFsxXSBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNh
L2Jsb2IvMmJjMWY1YzJlNzBmZTNiNGQ0MWYwNjBhZjk4NTliYzJhOTRjNWI2Mi9zcmMvZWdsL2Ry
aXZlcnMvZHJpMi9wbGF0Zm9ybV93YXlsYW5kLmMjTDExMzYKPiBbMl0gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvbGlidmEvMjAxNi1KdWx5LzAwNDE4NS5odG1sCj4gWzNd
IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL2ttc2N1YmUvaXNzdWVzLzEKPiBU
ZXN0Y2FzZTogaWd0L2NvcmVfdW5hdXRoX3ZzX3JlbmRlcgo+IENjOiBpbnRlbC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwu
Y2g+Cj4gU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3Jh
LmNvbT4KPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4KCkFzIGRpc2N1c3NlZCBvbiBJUkMsIElNSE8gdGhpcyBjaGFuZ2UgcmVxdWlyZXMgbW9yZSBq
dXN0aWZpY2F0aW9uLgoKVGhlIHN5c3RlbSBJJ20gd3JpdGluZyB0aGlzIG9uIGhhcyB2YWluZm8g
Mi40LjAgaW5zdGFsbGVkLCB3aGljaCBvcGVucyBhCnJlbmRlciBub2RlIGFuZCB3b3JrcyBmaW5l
IHdpdGhvdXQgdGhpcyBjaGFuZ2UuCgpTaW1pbGFybHksIGlmIGttc2N1YmUgaGFzbid0IGJlZW4g
Zml4ZWQgdG8gdXNlIGEgcmVuZGVyIG5vZGUgeWV0LCBzdXJlbHkKaXQgZWFzaWx5IGNhbi4KCllv
dSdyZSBhc3NlcnRpbmcgdGhhdCB0aGUgcHJvYmxlbSBpcyB3aWRlLXNwcmVhZCwgYW5kIHRoYXQg
Zml4aW5nIGFsbApicm9rZW4gdXNlcnNwYWNlIGlzbid0IGZlYXNpYmxlLCBidXQgSSBoYXZlbid0
IHNlZW4gYW55IGV2aWRlbmNlCnN1cHBvcnRpbmcgdGhhdC4KClNpbmNlIHRoaXMgY2hhbmdlIGlz
IGVzc2VudGlhbGx5IGEgd29ya2Fyb3VuZCBmb3IgYnJva2VuIHVzZXJzcGFjZSB3aGljaApjYW4g
bmV2ZXIgaGF2ZSB3b3JrZWQsIGFuZCBoYXMgdGhlIHBvdGVudGlhbCBvZiBzdWJ2ZXJ0aW5nIHRo
ZSBvbmdvaW5nCnRyYW5zaXRpb24gZnJvbSB1c2luZyBwcmltYXJ5IG5vZGVzIHRvIHJlbmRlciBu
b2RlcyBpbiB1c2Vyc3BhY2UgY29kZSwKdGhlcmUgbmVlZHMgdG8gYmUgZXZpZGVuY2Ugc3VwcG9y
dGluZyB0aGF0IHRoZSBiZW5lZml0IG91dHdlaWdocyB0aGUgcmlzay4KCgotLSAKRWFydGhsaW5n
IE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgaHR0cHM6Ly93d3cu
YW1kLmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAg
ICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
