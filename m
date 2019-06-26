Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1372957CD5
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCFC6E5CC;
	Thu, 27 Jun 2019 07:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9DD6E472
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 15:10:12 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5QFA9b8033991;
 Wed, 26 Jun 2019 10:10:09 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5QFA9Rr096790
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 26 Jun 2019 10:10:09 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 26
 Jun 2019 10:10:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 26 Jun 2019 10:10:09 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5QFA8U9053384;
 Wed, 26 Jun 2019 10:10:09 -0500
Subject: Re: [PATCH 1/2] dt-bindings: backlight: fix vendor prefix for
 ArcticSand arcxcnn driver bindings
To: Pavel Machek <pavel@ucw.cz>, Daniel Thompson <daniel.thompson@linaro.org>
References: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
 <1561435529-7835-2-git-send-email-bdodge09@gmail.com>
 <20190625085534.xf2ullyju3ewbgik@holly.lan>
 <CAFaGBPnH=75=wJRM4EX9MYR8MSehEa2_hBEOsqo-DZvD6c6f_A@mail.gmail.com>
 <20190626105614.ujmryi7qou2ra7aq@holly.lan>
 <20190626145624.GC22348@xo-6d-61-c0.localdomain>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <fd27a6a5-c4c6-6ddb-7faf-b866a58e0794@ti.com>
Date: Wed, 26 Jun 2019 10:09:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190626145624.GC22348@xo-6d-61-c0.localdomain>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 27 Jun 2019 07:11:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1561561809;
 bh=7KzFLKKOy6sse6dOzr9SLHFoRrhwMJ74FIgRt9HW4LA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=yrrOpOMGJusC7cM0Sm02xR5f7W6WS5Ve8/F6HNqewPM0jQFmd4Ob4F/67Avp7FR7g
 UFnsRKWwtpp+xYeaYG9CiTsDcbLUQJVt4NWxiYdA2WVZIa0ud+7llLBqNLi0jJJ/6F
 RQwg6ytpbUUgVbjebfko2xrHPc0LgUASWi8yEApg=
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
Cc: devicetree@vger.kernel.org, Brian Dodge <bdodge09@gmail.com>,
 jingoohan1@gmail.com, dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, pbacon@psemi.com, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMjYvMTkgOTo1NiBBTSwgUGF2ZWwgTWFjaGVrIHdyb3RlOgo+IE9uIFdlZCAyMDE5LTA2
LTI2IDExOjU2OjE0LCBEYW5pZWwgVGhvbXBzb24gd3JvdGU6Cj4+IE9uIFR1ZSwgSnVuIDI1LCAy
MDE5IGF0IDA3OjQ0OjA2QU0gLTA0MDAsIEJyaWFuIERvZGdlIHdyb3RlOgo+Pj4gSSB3b3VsZCBs
aWtlIHRvIGRlcHJlY2F0ZSB0aGUgb2xkIHByZWZpeCBpbiB0aGUgZnV0dXJlIGFmdGVyIGNvbW11
bmljYXRpbmcKPj4+IHdpdGggYWxsIGNoaXAgY3VzdG9tZXJzLCB3aGljaCBpcyB3aHkgdGhlIG9s
ZCBwcmVmaXggaXMgbm90IGRvY3VtZW50ZWQgaW4KPj4+IHRoZSBuZXcgYmluZGluZ3MuCj4+IERl
cHJlY2F0aW9uIGlzIGZpbmUgKGJ5IG1lIGF0IGxlYXN0KSBpdCdzIGp1c3QgdGhhdCBJJ20gbm90
IHN1cmUgdGhhdAo+PiByZW1vdmluZyB0aGUgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIGRlcHJlY2F0
ZWQgYmluZGluZ3MgaXMgdGhlIHJpZ2h0IHdheQo+PiB0byBkbyBpdC4gV2hhdCBpcyB0aGUgcHJp
b3IgYXJ0IGhlcmU/Cj4gSSBiZWxpZXZlIHdlIHNob3VsZCBrZWVwIHRoZSBkb2NzLgoKSSBhZ3Jl
ZSB3aXRoIFBhdmVsIG9uIGtlZXBpbmcgdGhlIGRvY3MuCgpLZWVwIHRoZSBkb2MgYnV0IG1hcmsg
dGhlIHByb3BlcnRpZXMgYXMgZGVwcmVjYXRlZCBzaW5jZSB0aGV5IGFyZSBub3QgCnJlbW92ZWQg
ZnJvbQoKdGhlIGNvZGUKCkRhbgoKCj4gCQkJCQkJCQlQYXZlbApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
