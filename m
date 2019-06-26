Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6B256626
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 12:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24FD86E34D;
	Wed, 26 Jun 2019 10:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 469BC6E34C;
 Wed, 26 Jun 2019 10:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 668E52AA13C;
 Wed, 26 Jun 2019 12:03:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id tqZLNA-yIXjk; Wed, 26 Jun 2019 12:03:19 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 2DC5D2AA107;
 Wed, 26 Jun 2019 12:03:19 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hg4lq-000144-Km; Wed, 26 Jun 2019 12:03:18 +0200
Subject: Re: [PATCH 1/1] drm/ttm: return -EBUSY if waiting for busy BO fails
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <20190626063958.19941-1-Felix.Kuehling@amd.com>
 <410e8232-4edc-78ea-dc5b-4385cda01266@amd.com>
 <33c2b0f0-6747-1a36-117f-8e7fe12cbef0@amd.com>
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
Message-ID: <5719b696-57d1-94d8-c7eb-48190149681c@daenzer.net>
Date: Wed, 26 Jun 2019 12:03:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <33c2b0f0-6747-1a36-117f-8e7fe12cbef0@amd.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0yNiA5OjA0IGEubS4sIEt1ZWhsaW5nLCBGZWxpeCB3cm90ZToKPiBPbiAyMDE5
LTA2LTI2IDI6NTQgYS5tLiwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4+IEFtIDI2LjA2LjE5
IHVtIDA4OjQwIHNjaHJpZWIgS3VlaGxpbmcsIEZlbGl4Ogo+Pj4gUmV0dXJuaW5nIC1FQUdBSU4g
cHJldmVudHMgdHRtX2JvX21lbV9zcGFjZSBmcm9tIHRyeWluZyBhbHRlcm5hdGUKPj4+IHBsYWNl
bWVudHMgYW5kIGNhbiBsZWFkIHRvIGxpdmUtbG9ja3MgaW4gYW1kZ3B1X2NzLCByZXRyeWluZwo+
Pj4gaW5kZWZpbml0ZWx5IGFuZCBuZXZlciBzdWNjZWVkaW5nLgo+Pj4KPj4+IEZpeGVzOiBjZmNj
NTJlNDc3ZTQgKCJkcm0vdHRtOiBmaXggYnVzeSBtZW1vcnkgdG8gZmFpbCBvdGhlciB1c2VyIHYx
MCIpCj4+PiBDQzogQ2hyaXN0aWFuIEtvZW5pZyA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPgo+
Pj4gU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+
Cj4+IENyYXAsIEkgZmVhcmVkIHRoYXQgdGhpcyBjb3VsZCBsaXZlLWxvY2sgdW5kZXIgc29tZSBj
aXJjdW1zdGFuY2VzLCBidXQKPj4gaG9wZWQgdGhhdCB0aGlzIHdvdWxkIGJlIGEgcmF0aGVyIHJh
cmUgY2FzZS4KPj4KPj4gSG93IGRpZCB5b3UgcmVwcm9kdWNlIHRoaXM/Cj4gCj4ga2ZkdGVzdCAt
LWd0ZXN0X2ZpbHRlcj1LRkRFdmljdFRlc3QuKiAtLWd0ZXN0X3JlcGVhdD0xMAo+IAo+IEl0IHJ1
bnMgdHdvIHByb2Nlc3NlcywgYm90aCBvZiB3aGljaCBkbyBncmFwaGljcyBDUyBhbmQgS0ZEIGNv
bXB1dGUgCj4gcXVldWVzIGF0IHRoZSBzYW1lIHRpbWUgd2l0aCBlbm91Z2ggbWVtb3J5IHByZXNz
dXJlIHRvIGNhdXNlIGZyZXF1ZW50IAo+IEtGRCBldmljdGlvbnMuIEl0J3MgbWVhbnQgdG8gdGVz
dCBLRkQgZXZpY3Rpb24gY29kZSBwYXRocywgYnV0IGVuZGVkIHVwIAo+IGZpbmRpbmcgYSBwcm9i
bGVtIHRoZSBncmFwaGljcyBDUyBjb2RlIHBhdGguIDovCj4gCj4gSSB3YXMgYWJsZSB0byByZXBy
b2R1Y2UgaXQgcmlnaHQgYWZ0ZXIgeW91ciBjaGFuZ2VzLiBXaXRoIHRoZSBsYXRlc3QgCj4gdmVy
c2lvbiBvZiB0aGUgYnJhbmNoIEkgY2FuJ3QgcmVwcm9kdWNlIGl0IGFueSBtb3JlLiBTb21lIG90
aGVyIGNvbW1pdCAKPiBtdXN0IGhhdmUgY2hhbmdlZCB0aGluZ3MgZW5vdWdoIHRvIGF2b2lkIHRo
ZSBsaXZlIGxvY2suCgpQcm9iYWJseSBqdXN0IGx1Y2ssIHVubGVzcyB0aGlzIHdhcyBhIHZlcnkg
cmVjZW50IGNoYW5nZS4gSSdkIGFsc28gYmVlbgpzZWVpbmcgbGl2ZS1sb2NrcyBiZXR3ZWVuIG1l
bW9yeS1oZWF2eSBwaWdsaXQgdGVzdHMsIGxhc3QgdGltZSBqdXN0IHRoaXMKTW9uZGF5LiBCdXQg
aXQgZGlkbid0IGhhcHBlbiBldmVyeSB0aW1lLgoKSSdkIGJlZW4gbWVhbmluZyB0byByZXBvcnQg
dGhpcywgYnV0IGtlcHQgZ2V0dGluZyBkaXN0cmFjdGVkIGJ5IG90aGVyCnN0dWZmLiBUaGFua3Mg
Zm9yIGJlYXRpbmcgbWUgdG8gaXQsIGFuZCBmb3IgZXZlbiBjb21pbmcgdXAgd2l0aCBhIHNvbHV0
aW9uIQoKCi0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAgICAgICAgICB8ICAgICAg
ICAgICAgICBodHRwczovL3d3dy5hbWQuY29tCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAg
ICAgICAgICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
