Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A1B7AB0A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 16:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2CC6E578;
	Tue, 30 Jul 2019 14:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id BEF516E578;
 Tue, 30 Jul 2019 14:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 951CC2AA137;
 Tue, 30 Jul 2019 16:30:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id KJ8MtqMiR12P; Tue, 30 Jul 2019 16:30:58 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 0158C2AA0DA;
 Tue, 30 Jul 2019 16:30:57 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hsT9V-0002WR-Hy; Tue, 30 Jul 2019 16:30:57 +0200
Subject: Re: [RFC PATCH 0/3] Propose new struct drm_mem_region
To: Daniel Vetter <daniel@ffwll.ch>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <20190730003225.322-1-brian.welty@intel.com>
 <951e9e42-96bc-fc8d-0153-3ca7ac5f1e74@amd.com>
 <20190730093847.GP15868@phenom.ffwll.local>
 <ee600bcd-d880-7199-21d0-df6e51f5adfa@amd.com>
 <CAKMK7uHrGgn7FqSBD+qDYYHxyPLvv5OqzwLTACWuqbjANKFuQA@mail.gmail.com>
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
Message-ID: <743ab99e-95cb-f6fa-6903-5556d5050f6d@daenzer.net>
Date: Tue, 30 Jul 2019 16:30:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHrGgn7FqSBD+qDYYHxyPLvv5OqzwLTACWuqbjANKFuQA@mail.gmail.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Brian Welty <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0zMCAxMjo0NSBwLm0uLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFR1ZSwg
SnVsIDMwLCAyMDE5IGF0IDEyOjI0IFBNIEtvZW5pZywgQ2hyaXN0aWFuCj4gPENocmlzdGlhbi5L
b2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4+IEFtIDMwLjA3LjE5IHVtIDExOjM4IHNjaHJpZWIgRGFu
aWVsIFZldHRlcjoKPj4+IE9uIFR1ZSwgSnVsIDMwLCAyMDE5IGF0IDA4OjQ1OjU3QU0gKzAwMDAs
IEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOgo+IAo+Pj4+PiArI2RlZmluZSBEUk1fTUVNX1NZU1RF
TSAgICAgMAo+Pj4+PiArI2RlZmluZSBEUk1fTUVNX1NUT0xFTiAgICAgMQo+Pj4+IEkgdGhpbmsg
d2UgbmVlZCBhIGJldHRlciBuYW1pbmcgZm9yIHRoYXQuCj4+Pj4KPj4+PiBTVE9MRU4gc291bmRz
IHdheSB0byBtdWNoIGxpa2Ugc3RvbGVuIFZSQU0gZm9yIGludGVncmF0ZWQgR1BVcywgYnV0IGF0
Cj4+Pj4gbGVhc3QgZm9yIFRUTSB0aGlzIGlzIHRoZSBzeXN0ZW0gbWVtb3J5IGN1cnJlbnRseSBH
UFUgYWNjZXNzaWJsZS4KPj4+IFl1cCB0aGlzIGlzIHdyb25nLCBmb3IgaTkxNSB3ZSB1c2UgdGhp
cyBhcyBzdG9sZW4sIGZvciB0dG0gaXQncyB0aGUgZ3B1Cj4+PiB0cmFuc2xhdGlvbiB0YWJsZSB3
aW5kb3cgaW50byBzeXN0ZW0gbWVtb3J5LiBOb3QgdGhlIHNhbWUgdGhpbmcgYXQgYWxsLgo+Pgo+
PiBUaG91Z2h0IHNvLiBUaGUgY2xvc2VzdCBJIGhhdmUgaW4gbWluZCBpcyBHVFQsIGJ1dCBldmVy
eXRoaW5nIGVsc2Ugd29ya3MKPj4gYXMgd2VsbC4KPiAKPiBXb3VsZCB5b3VyIEdQVV9NQVBQRUQg
YWJvdmUgd29yayBmb3IgVFQ/IEkgdGhpbmsgd2UnbGwgYWxzbyBuZWVkCj4gU1RPTEVOLCBJJ20g
ZXZlbiBoZWFyaW5nIG5vaXNlcyB0aGF0IHRoZXJlJ3MgZ29pbmcgdG8gYmUgc3RvbGVuIGZvcgo+
IGRpc2NyZXRlIHZyYW0gZm9yIHVzIC4uLgoKQ291bGQgaTkxNSB1c2UgRFJNX01FTV9QUklWIGZv
ciBzdG9sZW4/IE9yIGlzIHRoZXJlIG90aGVyIGhhcmR3YXJlIHdpdGgKc29tZXRoaW5nIHNpbWls
YXI/CgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAg
ICAgICAgIGh0dHBzOi8vd3d3LmFtZC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAg
ICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
