Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98234344C3
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 12:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C564894EA;
	Tue,  4 Jun 2019 10:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id D5879893E8;
 Tue,  4 Jun 2019 10:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id B9B4B2AA120;
 Tue,  4 Jun 2019 12:51:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id RHS4NG6dm5a5; Tue,  4 Jun 2019 12:51:04 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id B199E2A6016;
 Tue,  4 Jun 2019 12:51:02 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hY71v-0002LX-L5; Tue, 04 Jun 2019 12:50:59 +0200
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <3c9b5688-5e83-f173-00e3-6e139e05d466@amd.com>
 <20190527132041.GP21222@phenom.ffwll.local>
 <20190527132607.GH15067@arch-x1c3>
 <0426fb3e-e7bc-2464-cb42-4d5753956d23@amd.com>
 <CAKMK7uE_pRro8PxTwUq+pC_1GVVT7nUxan1T-kqSYT=BMHTf2g@mail.gmail.com>
 <d12a7dd4-595b-d0aa-a87d-527392fb0384@amd.com>
 <CAKMK7uE1ZWjCeg3q7qDrbcj89+DuPQwfjMqC8hTjDAMU5bhh-w@mail.gmail.com>
 <98c3d891-6966-2043-9709-4e718dbc6bac@amd.com>
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
Message-ID: <ee1b8980-3d78-aa6d-fe46-2c0d45c2bbdd@daenzer.net>
Date: Tue, 4 Jun 2019 12:50:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <98c3d891-6966-2043-9709-4e718dbc6bac@amd.com>
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0yOCAxMDowMyBhLm0uLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToKPiAKPiBJ
IHJhdGhlciB0aGluayB0aGF0IHdlIHNob3VsZCBnbyBkb3duIHRoZSByb3V0ZSBvZiBjb21wbGV0
ZWx5IGRyb3BwaW5nIAo+IGNvbW1hbmQgc3VibWlzc2lvbiBhbmQgYnVmZmVyIGFsbG9jYXRpb24g
dGhyb3VnaCB0aGUgcHJpbWFyeSBub2RlIGZvciAKPiBub24gbWFzdGVyIGNsaWVudHMuIEFuZCB0
aGVuIGFzIG5leHQgc3RlcCBhdCBzb21lIHBvaW50IGRyb3Agc3VwcG9ydCBmb3IgCj4gYXV0aGVu
dGljYXRpb24vZmxpbmsuCgpLZWVwIGluIG1pbmQgdGhhdCBldmVuIGRpc3BsYXkgc2VydmVycyBh
cmVuJ3QgRFJNIG1hc3RlciB3aGlsZSB0aGVpciBWVAppc24ndCBhY3RpdmUsIHNvIHRoaXMgbWln
aHQgYmUgcHJvYmxlbWF0aWMgaWYgYSBkaXNwbGF5IHNlcnZlciBuZWVkcyB0bwpkbyBzb21lIGNv
bW1hbmQgc3VibWlzc2lvbiAvIGJ1ZmZlciBhbGxvY2F0aW9uIGR1cmluZyB0aGF0IHRpbWUuCgoK
LS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAg
IGh0dHBzOi8vd3d3LmFtZC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAg
ICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
