Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B784F2C447
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 12:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F50189CF6;
	Tue, 28 May 2019 10:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F3C89CF6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 10:32:53 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4SAWir0024513;
 Tue, 28 May 2019 05:32:44 -0500
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4SAWiAY015404
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 05:32:44 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 05:32:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 05:32:43 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4SAWfN4034016;
 Tue, 28 May 2019 05:32:41 -0500
Subject: Re: [PATCHv6 0/4] omapdrm: DSI command mode panel support
To: Tony Lindgren <tony@atomide.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
 <60c45d23-de2f-d94a-c3d7-146a2bee538f@ti.com>
 <20190527112122.GJ5447@atomide.com>
 <e507c415-38de-86fe-9265-4b0aed0d7224@ti.com>
 <20190528093952.GM5447@atomide.com>
 <14c6c702-844b-756d-2d97-44e8f5a169df@ti.com>
 <20190528101847.GN5447@atomide.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <c2eaee25-a0d3-2632-fdea-3a81ac7085af@ti.com>
Date: Tue, 28 May 2019 13:32:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528101847.GN5447@atomide.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559039564;
 bh=McxG6qXOV6aRVRHUHTwTeJqgXjBwYLgFzusvSu8toTI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=teL/QmkddaZ+JzvBP0kX3Zm+hUB2eEut+CxRyf1eliUYVy2PPqICzksu1aHHx7X2O
 Fk4/Aanx/SAHDeW89PaVQ3q7A+XPnUWEp/I9coniBud2KIaEQO7WNpW9KfghmQ7NHn
 JOfGXAu1q/V2yvRu7cxIdjt6xOETDdqQDOoiSKR0=
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
Cc: kernel@collabora.com, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Keerthy <j-keerthy@ti.com>,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjgvMDUvMjAxOSAxMzoxOCwgVG9ueSBMaW5kZ3JlbiB3cm90ZToKCj4+IFRoaXMgY2hhbmdl
IGxldHMgbWUgYm9vdC4gSSBkb24ndCBrbm93IHRoYXQncyB0aGUgY29ycmVjdCBwbGFjZSwgdGhv
dWdoOgo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvYW01NzI4LmR0c2kgYi9h
cmNoL2FybS9ib290L2R0cy9hbTU3MjguZHRzaQo+PiBpbmRleCA4MmU1NDI3ZWY2YTkuLmM3Nzhm
OWE4NmIzYSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvYW01NzI4LmR0c2kKPj4g
KysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvYW01NzI4LmR0c2kKPj4gQEAgLTMxLDMgKzMxLDcgQEAK
Pj4gJmF0bF90bSB7Cj4+ICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsKPj4gfTsKPj4gKwo+
PiArJnRpbWVyMTIgewo+PiArICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4+ICt9Owo+IAo+
IE9LIHdlIHNob3VsZCBkaXNhYmxlIGl0IGF0IHRoZSB0YXJnZXQtbW9kdWxlIGxldmVsIHRob3Vn
aC4gSW50ZXJlc3RpbmcKPiB0aGF0IHJlYWRpbmcgdGhlIHJldmlzaW9uIHJlZ2lzdGVyIHdvcmtz
IHdpdGggdGhlIGFib3ZlLCBvciBtYXliZSB5b3UKPiBzdGlsbCBnZXQgc29tZSB3YXJuaW5nPwoK
SSBkb24ndCBzZWUgYW55dGhpbmcgb2RkIGluIHRoZSBib290IGxvZyB3aXRoIHRoZSBhYm92ZSBj
aGFuZ2UuIEF0IGxlYXN0IApubyBrZXJuZWwgV0FSTnMsIG5vciBhbnl0aGluZyB3aXRoIGdyZXBw
aW5nICJ0aW1lciIsICJlcnIiLCBvciAid2FybiIuCgpJIGp1c3QgdmVyaWZpZWQgd2l0aCBjbGVh
biA1LjItcmMyLCB0aGF0IGl0IGRvZXNuJ3QgYm9vdCwgYW5kIHdpdGggdGhlIAphYm92ZSBjaGFu
Z2UsIGJvb3RzLgoKPj4gTXkgYm9hcmQgaXMgeDE1IHJldiBBMywgYXR0YWNoZWQgdG8gQU01IEVW
TS4gSSd2ZSBhbHNvIGF0dGFjaGVkIG15IGtlcm5lbAo+PiBjb25maWcuCj4gCj4gU3RyYW5nZSB0
aGF0IHRoaXMgaXMgbm90IGFmZmVjdGluZyBvdGhlciB4MTU/IEkgdGhpbmsgdGltZXIxMiB3b3Vs
ZAo+IGJlIGJsb2NrZWQgb24gSFMgZGV2aWNlcyB0aG91Z2g/CgpJIGRvbid0IGtub3cuLi4gSSBj
YW4ndCBiZWxpZXZlIG15IHgxNSB3b3VsZCBiZSB1bmlxdWUgPSkuIENhbiBpdCBiZSAKc29tZXRo
aW5nIGluIHRoZSBrZXJuZWwgY29uZmlnPyB1LWJvb3Q/CgpQZXRlciBzaG91bGQgaGF2ZSB0aGUg
c2FtZSBBMy4gUGV0ZXIsIGNhbiB5b3UgdHJ5IHdpdGggbXkgY29uZmlnPwoKICBUb21pCgotLSAK
VGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVs
c2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNp
bGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
