Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4B5902C9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 15:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD0F6E356;
	Fri, 16 Aug 2019 13:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3A96E356
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 13:20:59 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7GDKnK4008280;
 Fri, 16 Aug 2019 08:20:49 -0500
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7GDKnI1086220
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 16 Aug 2019 08:20:49 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 08:20:48 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 16 Aug 2019 08:20:47 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7GDKkrI073381;
 Fri, 16 Aug 2019 08:20:46 -0500
Subject: Re: [PATCH 1/2] video: omapfb2: Make standard and custom panel
 drivers mutually exclusive
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
References: <20190816122228.9475-1-laurent.pinchart@ideasonboard.com>
 <20190816122228.9475-2-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <96dc63bc-92b4-6d55-bbf5-006aab111bec@ti.com>
Date: Fri, 16 Aug 2019 16:20:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816122228.9475-2-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1565961649;
 bh=ESsB0hxwDbrq2lvyM/4BKxwvpvTjNJZRsyiKzoQztDg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=qwbwYdCobczAIvFeWOo3/2mjztJZddqoTThHjZkTkzJeRJRW61s0gHOXZyAeIdHph
 lEpxqTNaKF3uQv+Q9Y8OfWbQ5xhjz/lzKh6tdMD1rQHbsZqyZVa30R4SCJhLrRJsxE
 LJfnscbwsNNm3cb4Mkwsfbp87fE3mUV4wG7nPcZ4=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTYvMDgvMjAxOSAxNToyMiwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBTdGFuZGFyZCBE
Uk0gcGFuZWwgZHJpdmVycyBmb3Igc2V2ZXJhbCBwYW5lbHMgdXNlZCBieSBvbWFwZmIyIGFyZSBu
b3cKPiBhdmFpbGFibGUuIFRoZWlyIG1vZHVsZSBuYW1lIGNsYXNoZXMgd2l0aCB0aGUgbW9kdWxl
cyBmcm9tCj4gZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZGlzcGxheXMvLCBwYXJ0IG9mIHRoZSBk
ZXByZWNhdGVkIG9tYXBmYjIgZmJkZXYKClNob3VsZG4ndCB0aGF0IHBhdGggYmUgZHJpdmVycy92
aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZGlzcGxheXM/Cgo+IGRyaXZlci4gQXMgb21hcGZiMiBj
YW4gb25seSBiZSBjb21waWxlZCB3aGVuIHRoZSBvbWFwZHJtIGRyaXZlciBpcwo+IGRpc2FibGVk
LCBhbmQgdGhlIERSTSBwYW5lbCBkcml2ZXJzIGFyZSB1c2VsZXNzIGluIHRoYXQgY2FzZSwgbWFr
ZSB0aGUKPiBvbWFwZmIyIHBhbmVscyBkZXBlbmQgb24gdGhlIHN0YW5kYXJkIERSTSBwYW5lbHMg
YmVpbmcgZGlzYWJsZWQgdG8gZml4Cj4gdGhlIG5hbWUgY2xhc2guCj4gCj4gU2lnbmVkLW9mZi1i
eTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+
IC0tLQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZGlzcGxheXMvS2NvbmZp
ZyB8IDUgKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCkNjJ2QgQmFy
dGxvbWllai4KClJldmlld2VkLWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGku
Y29tPgoKICBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFu
a2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQu
IEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
