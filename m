Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5303A23CBFF
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 18:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4086C6E824;
	Wed,  5 Aug 2020 16:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5741D6E824
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 16:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 5DE2E2A6045;
 Wed,  5 Aug 2020 18:16:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id Boa7OE2xIJAz; Wed,  5 Aug 2020 18:16:21 +0200 (CEST)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 225E22A6016;
 Wed,  5 Aug 2020 18:16:21 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1k3M5T-000JdK-Hg; Wed, 05 Aug 2020 18:16:19 +0200
Subject: Re: [2/2] drm/ttm: make TT creation purely optional v3
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20200629151925.2096-2-christian.koenig@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <a1ba1387-1270-32e3-960f-f98495d92c11@daenzer.net>
Date: Wed, 5 Aug 2020 18:16:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200629151925.2096-2-christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNi0yOSA1OjE5IHAubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gV2Ugb25s
eSBuZWVkIHRoZSBwYWdlIGFycmF5IHdoZW4gdGhlIEJPIGlzIGFib3V0IHRvIGJlIGFjY2Vzc2Vk
Lgo+IAo+IFNvIG5vdCBvbmx5IHBvcHVsYXRlLCBidXQgYWxzbyBjcmVhdGUgaXQgb24gZGVtYW5k
Lgo+IAo+IHYyOiBtb3ZlIE5VTEwgY2hlY2sgaW50byB0dG1fdHRfY3JlYXRlKCkKPiB2MzogZml4
IHRoZSBvY2N1cnJlbmNlIGluIHR0bV9ib19rbWFwX3R0bSBhcyB3ZWxsCgpUaGlzIGJyb2tlIGFt
ZGdwdSB1c2VycHRyIGZ1bmN0aW9uYWxpdHkgZm9yIG1lLCBpbiBwYXJ0aWN1bGFyIGFsbApHTF9B
TURfcGlubmVkX21lbW9yeSBwaWdsaXQgdGVzdHMsIGUuZy4KCi4uLi9waWdsaXQvYmluL2FtZF9w
aW5uZWRfbWVtb3J5IGRlY3JlbWVudC1vZmZzZXQgLWF1dG8gLWZibwpPZmZzZXQgaXMgZGVjcmVt
ZW50ZWQsIG5vIHdhaXQuCk1lc2E6IFVzZXIgZXJyb3I6IEdMX0lOVkFMSURfT1BFUkFUSU9OIGlu
IGdsQnVmZmVyRGF0YQpbLi4uXQpVbmV4cGVjdGVkIEdMIGVycm9yOiBHTF9JTlZBTElEX09QRVJB
VElPTiAweDUwMgooRXJyb3IgYXQgdGVzdHMvc3BlYy9hbWRfcGlubmVkX21lbW9yeS90ZXN0LmM6
MjE0KQpQSUdMSVQ6IHsicmVzdWx0IjogImZhaWwiIH0KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBE
w6RuemVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgIGh0dHBzOi8vcmVkaGF0LmNvbQpM
aWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBh
bmQgWCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
