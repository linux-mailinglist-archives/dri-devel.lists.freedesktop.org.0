Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 356C72D7733
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 14:58:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2786F6EDFD;
	Fri, 11 Dec 2020 13:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 821196EDFD;
 Fri, 11 Dec 2020 13:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 6B38C2A6042;
 Fri, 11 Dec 2020 14:58:43 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id UhlCbaORl3rS; Fri, 11 Dec 2020 14:58:43 +0100 (CET)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 18D9B2A6016;
 Fri, 11 Dec 2020 14:58:43 +0100 (CET)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1kniwU-00036U-Cx; Fri, 11 Dec 2020 14:58:42 +0100
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20201210184823.285415-1-aurabindo.pillai@amd.com>
 <MC46k2jDYAeDTZaSlv6T5iIq5ibkh2yYwW3KZ-XLXLwoRByjkWsEr6-6eQM4iZqmkiLoleyh84S290ytAub0bK-esJje1OGKIEilcz_iikY=@emersion.fr>
 <0b7132b8-a890-b4f0-0a0c-260015fa0bbb@amd.com>
 <20201211115549.32ade81b@eldfell>
 <53f5b48c-c2b5-ed66-0c0e-bba0b22dba03@gmail.com>
 <20201211142019.19dae2aa@eldfell>
 <c262b694-fb5d-accd-2582-4adb967ea890@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH v2 0/3] Experimental freesync video mode optimization
Message-ID: <14768d9f-0813-75c7-458d-2ced46ded4cd@daenzer.net>
Date: Fri, 11 Dec 2020 14:58:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <c262b694-fb5d-accd-2582-4adb967ea890@amd.com>
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
Cc: stylon.wang@amd.com, Shashank Sharma <shashank.sharma@amd.com>,
 thong.thai@amd.com, DRI Development <dri-devel@lists.freedesktop.org>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org,
 wayne.lin@amd.com, alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0xMi0xNCA5OjU3IHAubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMTEu
MTIuMjAgdW0gMTM6MjAgc2NocmllYiBQZWtrYSBQYWFsYW5lbjoKPj4gT24gRnJpLCAxMSBEZWMg
MjAyMCAxMToyODozNiArMDEwMAo+PiBDaHJpc3RpYW4gS8O2bmlnIDxja29lbmlnLmxlaWNodHp1
bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+PiBJIHRoaW5rIHRoZSBnZW5lcmFsIGlkZWEg
d2Ugc2V0dGxlZCBvbiBpcyB0aGF0IHdlIHNwZWNpZnkgYW4gZWFybGllc3QKPj4+IGRpc3BsYXkg
dGltZSBmb3IgZWFjaCBmcmFtZSBhbmQgZ2l2ZSBmZWVkYmFjayB0byB0aGUgYXBwbGljYXRpb24g
d2hlbiBhCj4+PiBmcmFtZSB3YXMgYWN0dWFsbHkgZGlzcGxheWVkLgo+PiBUaGF0IGlzIGluZGVl
ZCBzb21ldGhpbmcgY29tcGxldGVseSBkaWZmZXJlbnQsIGFuZCBmZWVscyBsaWtlIGl0IHdvdWxk
Cj4+IGJlIHNldmVyYWwgeWVhcnMgaW4gdGhlIGZ1dHVyZSwgd2hpbGUgdGhlIHByb3Bvc2VkIHNj
aGVtZSBvciB0aGUKPj4gbWluL21heCBwcm9wZXJ0aWVzIGNvdWxkIGJlIGRvbmUgZmFpcmx5IHF1
aWNrbHkuIEJ1dCBJJ20gbm90IGluIGEgaHVycnkuCj4gCj4gWDExIGFscmVhZHkgc3VwcG9ydHMg
dGhhdCB3aXRoIHRoZSBEUkkzIGV4dGVuc2lvbi4gQWxzbyBzZWUgVkRQQVUgCj4gcHJlc2VudCBh
bmQgdGhlIFZ1bGthbiBleHRlbnNpb24gZm9yIHJlZmVyZW5jZSBhcHBsaWNhdGlvbiBBUEkgCj4g
aW1wbGVtZW50YXRpb25zLCBzbyB0aGF0IHN0dWZmIGlzIGFscmVhZHkgcHJlc2VudC4KCkkgc3Vz
cGVjdCB5b3UgbWVhbiB0aGUgUHJlc2VudCBleHRlbnNpb24sIHNwZWNpZmljYWxseSBQcmVzZW50
T3B0aW9uVVNULiAKVGhlcmUgaXMgbm8gd29ya2luZyBpbXBsZW1lbnRhdGlvbiBvZiB0aGlzIHll
dCAodGhlIHhzZXJ2ZXIgdHJlZSBoYXMgCm5ldmVyIGhhZCBhbnkgY29kZSB3aGljaCB3b3VsZCBl
dmVuIGFkdmVydGlzZSBQcmVzZW50Q2FwYWJpbGl0eVVTVCwgbGV0IAphbG9uZSBkbyBhbnl0aGlu
ZyB3aXRoIGEgdGltZXN0YW1wIHBhc3NlZCBpbiBieSB0aGUgY2xpZW50KS4KCgotLSAKRWFydGhs
aW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgIGh0dHBzOi8v
cmVkaGF0LmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAg
ICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
