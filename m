Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52997AF874
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 11:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E2689F3C;
	Wed, 11 Sep 2019 09:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 971AD6EA61;
 Wed, 11 Sep 2019 09:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id B445D2A6042;
 Wed, 11 Sep 2019 11:04:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id mKQldX3cDoP2; Wed, 11 Sep 2019 11:04:36 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 198BF2A6016;
 Wed, 11 Sep 2019 11:04:36 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92.2)
 (envelope-from <michel@daenzer.net>)
 id 1i7yYE-0001Gp-69; Wed, 11 Sep 2019 11:04:34 +0200
Subject: Re: [PATCH] drm/radeon: Bail earlier when radeon.cik_/si_support=0 is
 passed
To: Hans de Goede <hdegoede@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>
References: <20190907203238.232005-1-hdegoede@redhat.com>
 <22da19aa-0ab4-ab48-ab70-037ec41c2f87@daenzer.net>
 <3c0eb318-6c30-fc98-4005-80b5c00b8f5e@redhat.com>
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
Message-ID: <43d7b52b-e5d1-7dcb-1106-ef121831e686@daenzer.net>
Date: Wed, 11 Sep 2019 11:04:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3c0eb318-6c30-fc98-4005-80b5c00b8f5e@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0xMCAxMTozNiBhLm0uLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+IE9uIDkvMTAv
MTkgOTo1MCBBTSwgTWljaGVsIETDpG56ZXIgd3JvdGU6Cj4+IE9uIDIwMTktMDktMDcgMTA6MzIg
cC5tLiwgSGFucyBkZSBHb2VkZSB3cm90ZToKPj4+IEJhaWwgZnJvbSB0aGUgcGNpX2RyaXZlciBw
cm9iZSBmdW5jdGlvbiBpbnN0ZWFkIG9mIGZyb20gdGhlIGRybV9kcml2ZXIKPj4+IGxvYWQgZnVu
Y3Rpb24uCj4+Pgo+Pj4gVGhpcyBhdm9pZCAvZGV2L2RyaS9jYXJkMCB0ZW1wb3JhcmlseSBnZXR0
aW5nIHJlZ2lzdGVyZWQgYW5kIHRoZW4KPj4+IHVucmVnaXN0ZXJlZCBhZ2Fpbiwgc2VuZGluZyB1
bndhbnRlZCBhZGQgLyByZW1vdmUgdWRldiBldmVudHMgdG8KPj4+IHVzZXJzcGFjZS4KPj4+Cj4+
PiBTcGVjaWZpY2FsbHkgdGhpcyBhdm9pZHMgdHJpZ2dlcmluZyB0aGUgKHVzZXJzcGFjZSkgYnVn
IGZpeGVkIGJ5IHRoaXMKPj4+IHBseW1vdXRoIG1lcmdlLXJlcXVlc3Q6Cj4+PiBodHRwczovL2dp
dGxhYi5mcmVlZGVza3RvcC5vcmcvcGx5bW91dGgvcGx5bW91dGgvbWVyZ2VfcmVxdWVzdHMvNTkK
Pj4+Cj4+PiBOb3RlIHRoYXQgZGVzcGl0ZSB0aGF0IGJlaW5nIGFuIHVzZXJzcGFjZSBidWcsIG5v
dCBzZW5kaW5nIHVubmVjZXNzYXJ5Cj4+PiB1ZGV2IGV2ZW50cyBpcyBhIGdvb2QgaWRlYSBpbiBn
ZW5lcmFsLgo+Pj4KPj4+IEJ1Z0xpbms6IGh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93
X2J1Zy5jZ2k/aWQ9MTQ5MDQ5MAo+Pj4gU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRl
Z29lZGVAcmVkaGF0LmNvbT4KPj4KPj4gUmV2aWV3ZWQtYnk6IE1pY2hlbCBEw6RuemVyIDxtZGFl
bnplckByZWRoYXQuY29tPgo+IAo+IFRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4gSSd2ZSBkcm0g
cHVzaCByaWdodHMsIGJ1dCBJIGd1ZXNzIHRoYXQgcmFkZW9uL2FtZAo+IEdQVSBwYXRjaGVzIGFy
ZSBjb2xsZWN0ZWQgYnkgc29tZW9uZSBAQU1ELCBzbyBJIGRvIG5vdCBuZWVkIHRvIC8gc2hvdWxk
IG5vdAo+IHB1c2ggdGhpcyBteXNlbGYsIHJpZ2h0PwoKSSB0aGluayBzbywgdW5sZXNzIG9uZSBv
ZiB0aGUgZHJpdmVyIG1haW50YWluZXJzIHNheXMgb3RoZXJ3aXNlLgoKCj4+IGFtZGdwdSBzaG91
bGQgYmUgY2hhbmdlZCBjb3JyZXNwb25kaW5nbHkgYXMgd2VsbC4KPiAKPiBHb29kIHBvaW50LiBJ
J20gY3VycmVudGx5IHRyYXZlbGxpbmcgKEBwbHVtYmVycykgSSBjYW4gZG8gdGhpcyB3aGVuIEkn
bQo+IGJhY2sgaG9tZSwKPiBidXQgZmVlbCBmcmVlIHRvIGJlYXQgbWUgdG8gaXQgKGlmIHlvdSBk
byBwbGVhc2UgQ2MgbWUgdG8gYXZvaWQgZG91YmxlCj4gd29yaykuCgpJJ20gaGFwcHkgdG8gbGVh
dmUgaXQgdG8geW91LCBpZiB5b3UgZG9uJ3QgbWluZC4KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBE
w6RuemVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgIGh0dHBzOi8vcmVkaGF0LmNvbQpM
aWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBh
bmQgWCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
