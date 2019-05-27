Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B302B273
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 12:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3378984D;
	Mon, 27 May 2019 10:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4198984D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 10:51:23 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4RAp5e6003020;
 Mon, 27 May 2019 05:51:05 -0500
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4RAp5Q1037617
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 May 2019 05:51:05 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 27
 May 2019 05:51:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 27 May 2019 05:51:04 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4RAp2gC087418;
 Mon, 27 May 2019 05:51:02 -0500
Subject: Re: [PATCHv6 0/4] omapdrm: DSI command mode panel support
To: Sebastian Reichel <sebastian.reichel@collabora.com>, Sebastian Reichel
 <sre@kernel.org>, Tony Lindgren <tony@atomide.com>, Pavel Machek
 <pavel@ucw.cz>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <60c45d23-de2f-d94a-c3d7-146a2bee538f@ti.com>
Date: Mon, 27 May 2019 13:51:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523200756.25314-1-sebastian.reichel@collabora.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1558954265;
 bh=JrfdFuLps/wHBCl3PPKJylhuDG/GtLNZB8BGn4i9Njw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=tigu461trGyiuT0TlRN5C1lHPqzrrZKwO1Tq3bJjFQ1mt/4Eon/wHG+6dGlIwHUsf
 d9tgY3aDjo/X82zi2jn2u4dWgeLIujSPHJueBjAK3yYBVDODRLcc+g6o/VgADzZNlo
 WZE7Z3JUqxs9STSd02lydCJC50MgI7J07cIIOi9M=
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
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, linux-omap@vger.kernel.org,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAyMy8wNS8yMDE5IDIzOjA3LCBTZWJhc3RpYW4gUmVpY2hlbCB3cm90ZToKPiBIaSwK
PiAKPiBIZXJlIGlzIGFub3RoZXIgcm91bmQgb2YgdGhlIERTSSBjb21tYW5kIG1vZGUgcGFuZWwg
cGF0Y2hzZXQKPiBpbnRlZ3JhdGluZyB0aGUgZmVlZGJhY2sgZnJvbSBQQVRDSHY1LiBUaGUgcGF0
Y2hlcyBhcmUgYmFzZWQKPiBvbiB2NS4yLXJjMSB0YWcuIEl0IGRvZXMgbm90IGNvbnRhaW4gdGhl
IHBhdGNoZXMgcmVxdWlyZWQgZm9yCj4gT01BUDMgc3VwcG9ydCAoaXQgbmVlZHMgYSB3b3JrYXJv
dW5kIGZvciBhIGhhcmR3YXJlIGJ1ZykgYW5kCj4gZm9yIGF1dG9tYXRpYyBkaXNwbGF5IHJvdGF0
aW9uLiBUaGV5IHNob3VsZCBnZXQgdGhlaXIgb3duIHNlcmllcywKPiBvbmNlIGFmdGVyIGV2ZXJ5
dGhpbmcgaGFzIGJlZW4gbW92ZWQgdG8gRFJNIHBhbmVsIEFQSS4gSSB0aGluawo+IERSTSBwYW5l
bCBjb252ZXJzaW9uIHNob3VsZCBoYXBwZW4gX2FmdGVyXyB0aGlzIHNlcmllcywgc2luY2UKPiBv
dGhlcndpc2UgdGhlcmUgaXMgYSBoaWdoIHJpc2sgb2YgYnJpY2tpbmcgRFNJIHN1cHBvcnQgY29t
cGxldGVseS4KPiBJIGFscmVhZHkgc3RhcnRlZCBhIFdJUCBicmFuY2ggZm9yIGNvbnZlcnRpbmcg
RFNJIHRvIHRoZSBEUk0gcGFuZWwKPiBBUEkgb24gdG9wIG9mIHRoaXMgcGF0Y2hzZXQuCgpMb29r
cyBnb29kIHRvIG1lLiBGb3Igc29tZSByZWFzb24gSSBjYW4ndCBib290IDUuMi1yYzIgKG9uIHgx
NSkgc28gSSAKaGF2ZW4ndCBiZWVuIGFibGUgdG8gdGVzdCB5ZXQuIEknbGwgcGljayB0aGUgc2Vy
aWVzIHVwIGluIGFueSBjYXNlLCBhbmQgCkknbGwgdGVzdCBpdCB3aGVuIEkgZ2V0IHRoZSBrZXJu
ZWwgYm9vdGluZy4KCiAgVG9taQoKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBv
cmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYx
NTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
