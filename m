Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9469B2C4614
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 17:56:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F40E6EA4B;
	Wed, 25 Nov 2020 16:56:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 00E816EA4B;
 Wed, 25 Nov 2020 16:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id B8B4E2A6042;
 Wed, 25 Nov 2020 17:56:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id B6Gm77S-7hs2; Wed, 25 Nov 2020 17:56:42 +0100 (CET)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 6CF582A6016;
 Wed, 25 Nov 2020 17:56:42 +0100 (CET)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1khy5y-000omM-09; Wed, 25 Nov 2020 17:56:42 +0100
To: christian.koenig@amd.com, Daniel Vetter <daniel@ffwll.ch>
References: <1605936082-3099-6-git-send-email-andrey.grodzovsky@amd.com>
 <28332cf0-612c-10bd-c64e-fff6e1f18653@gmail.com>
 <320ff94c-78f4-b9a5-4c6f-40f7ce162bd3@amd.com>
 <41b35672-2dd6-13e2-8383-c65279fdb648@gmail.com>
 <e2f4f1dc-2a2a-face-87b2-6d61ed7d3305@amd.com>
 <01280cba-56b8-77c6-b40f-d7e69a5ad4c6@amd.com>
 <0ceca974-80f8-feb3-d5e9-5182f35bb2c4@amd.com>
 <20288c45-270c-3ed7-2ac4-eeb6e5c50776@amd.com>
 <2df98c1a-8ed4-fb87-f8f7-e3962e8d9c52@amd.com>
 <041210e5-e237-b72e-dcbc-17027d057c55@gmail.com>
 <20201125104021.GV401619@phenom.ffwll.local>
 <71683ae7-f443-c15a-7003-6ba4ad3d4b15@gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
Message-ID: <6669f4ca-bfca-e54e-6d24-ee1bff0c17db@daenzer.net>
Date: Wed, 25 Nov 2020 17:56:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <71683ae7-f443-c15a-7003-6ba4ad3d4b15@gmail.com>
Content-Language: en-CA
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0xMS0yNSAxOjU3IHAubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gCj4gV2Vs
bCB0aGlua2luZyBtb3JlIGFib3V0IHRoaXMsIGl0IHNlZW1zIHRvIGJlIGEgYW5vdGhlciByZWFs
bHkgZ29vZCAKPiBhcmd1bWVudCB3aHkgbWFwcGluZyBwYWdlcyBmcm9tIERNQS1idWZzIGludG8g
YXBwbGljYXRpb24gYWRkcmVzcyBzcGFjZSAKPiBkaXJlY3RseSBpcyBhIHZlcnkgYmFkIGlkZWEg
OikKCkFwb2xvZ2llcyBmb3IgZ29pbmcgb2ZmIG9uIGEgdGFuZ2VudCBoZXJlLi4uCgpTaW5jZSBh
bGxvd2luZyB1c2Vyc3BhY2UgbW1hcCB3aXRoIGRtYS1idWYgZmRzIHNlZW1zIHRvIGJlIGEgdHJh
cCBpbiAKZ2VuZXJhbFswXSwgSSB3b25kZXIgaWYgdGhlcmUncyBhbnkgd2F5IHdlIGNvdWxkIHN0
b3Agc3VwcG9ydGluZyB0aGF0PwoKClswXSBFLmcuIG11dHRlciBoYWQgdG8gZGlzYWJsZSBoYW5k
aW5nIG91dCBkbWEtYnVmcyBmb3Igc2NyZWVuIGNhcHR1cmUgCmJ5IGRlZmF1bHQgd2l0aCBub24t
aTkxNSBmb3Igbm93LCBiZWNhdXNlIGluIHBhcnRpY3VsYXIgd2l0aCBkaXNjcmV0ZSAKR1BVcywg
ZGlyZWN0IENQVSByZWFkcyBjYW4gYmUgdW51c2FibHkgc2xvdyAodGhpbmsgc2luZ2xlLWRpZ2l0
IGZyYW1lcyAKcGVyIHNlY29uZCksIGFuZCBvZiBjb3Vyc2UgdGhlcmUncyBvdGhlciB1c2Vyc3Bh
Y2Ugd2hpY2ggZ29lcyAib29oLCAKZG1hLWJ1ZiwgbGV0J3MgbWFwIGFuZCByZWFkISIuCgoKLS0g
CkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICBo
dHRwczovL3JlZGhhdC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAgICB8
ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
