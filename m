Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC411E50C7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 18:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610A56EADF;
	Fri, 25 Oct 2019 16:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 472346EADF;
 Fri, 25 Oct 2019 16:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 295582A6046;
 Fri, 25 Oct 2019 18:06:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id O_7KpgKi-kVj; Fri, 25 Oct 2019 18:06:27 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id A1E0B2A6045;
 Fri, 25 Oct 2019 18:06:27 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92.3)
 (envelope-from <michel@daenzer.net>)
 id 1iO26c-0005b1-Qh; Fri, 25 Oct 2019 18:06:26 +0200
Subject: Re: [PATCH] drm/radeon: Handle workqueue allocation failure
To: Will Deacon <will@kernel.org>
References: <20191025110450.10474-1-will@kernel.org>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <5d6a88a2-2719-a859-04df-10b0d893ff39@daenzer.net>
Date: Fri, 25 Oct 2019 18:06:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191025110450.10474-1-will@kernel.org>
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
Cc: amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicolas Waisman <nico@semmle.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0yNSAxOjA0IHAubS4sIFdpbGwgRGVhY29uIHdyb3RlOgo+IEluIHRoZSBoaWdo
bHkgdW5saWtlbHkgZXZlbnQgdGhhdCB3ZSBmYWlsIHRvIGFsbG9jYXRlIHRoZSAicmFkZW9uLWNy
dGMiCj4gd29ya3F1ZXVlLCB3ZSBzaG91bGQgYmFpbCBjbGVhbmx5IHJhdGhlciB0aGFuIGJsaW5k
bHkgbWFyY2ggb24gd2l0aCBhCj4gTlVMTCBwb2ludGVyIGluc3RhbGxlZCBmb3IgdGhlICdmbGlw
X3F1ZXVlJyBmaWVsZCBvZiB0aGUgJ3JhZGVvbl9jcnRjJwo+IHN0cnVjdHVyZS4KPiAKPiBUaGlz
IHdhcyByZXBvcnRlZCBwcmV2aW91c2x5IGJ5IE5pY29sYXMsIGJ1dCBJIGRvbid0IHRoaW5rIGhp
cyBmaXggd2FzCj4gY29ycmVjdDoKCk5laXRoZXIgaXMgdGhpcyBvbmUgSSdtIGFmcmFpZC4gU2Vl
IG15IGZlZWRiYWNrIG9uCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8z
MzE1MzQvIC4KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAg
ICAgICAgICAgICAgIGh0dHBzOi8vcmVkaGF0LmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0
ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
