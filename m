Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 560D71FEC26
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 09:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93196EAA3;
	Thu, 18 Jun 2020 07:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFD86E944
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 12:50:10 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05HCo4X6095317;
 Wed, 17 Jun 2020 07:50:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1592398204;
 bh=BXXLlXyiZ34Pa+skFKuCFmgnUEithsnyVV/ercr7hMg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=g48g+UOOzBxkV+1nKxOOKDEkHZOSrWF5cwzwCmXc3ket7nwIC2fo6XxfS/2UG8iLd
 q9MZK5aYhm3zhEnYh/JlgIPwoU3kll0336ljll0hrFOy+XzHuYjyh2GQVhO3QQhsyi
 kPwkG4NynPsW3rZEK7BHJhfTWI4YRrJ7dVX/zufo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05HCo4Nl128396
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 17 Jun 2020 07:50:04 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 17
 Jun 2020 07:50:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 17 Jun 2020 07:50:04 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05HCnxCX006519;
 Wed, 17 Jun 2020 07:50:00 -0500
Subject: Re: [PATCH 1/5] drm/omap: Fix suspend resume regression after
 platform data removal
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Tony Lindgren <tony@atomide.com>
References: <20200531193941.13179-1-tony@atomide.com>
 <20200531193941.13179-2-tony@atomide.com>
 <16ba1808-5c7f-573d-8dd0-c80cac2f476e@ti.com>
 <20200603140639.GG37466@atomide.com>
 <47e286dd-f87a-4440-5bde-1f7b53e8b672@ti.com>
 <20200609151943.GL37466@atomide.com>
 <9ed70121-2a53-d2b3-051a-88eb83e6c53f@ti.com>
 <d03dd04f-6f2c-25ba-fe1f-d5fc0dfb5c68@ti.com>
 <592501c9-2d94-b266-ae76-e383d3bffa29@ti.com>
 <20200616153042.GZ37466@atomide.com>
 <3f2855cc-48b8-ecb8-5d92-beeabe344b26@ti.com>
 <d0488631-e2d8-115f-9900-5838147ec674@ti.com>
From: Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <8404d47b-33bb-499f-4d50-33501e7c5921@ti.com>
Date: Wed, 17 Jun 2020 15:49:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <d0488631-e2d8-115f-9900-5838147ec674@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 18 Jun 2020 07:17:31 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
 Suman Anna <s-anna@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
 Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Andrew F . Davis" <afd@ti.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAxNy8wNi8yMDIwIDA5OjA0LCBUb21pIFZhbGtlaW5lbiB3cm90ZToKPiBPbiAxNi8wNi8y
MDIwIDE5OjU2LCBHcnlnb3JpaSBTdHJhc2hrbyB3cm90ZToKPj4KPj4KPj4gT24gMTYvMDYvMjAy
MCAxODozMCwgVG9ueSBMaW5kZ3JlbiB3cm90ZToKPj4+ICogVG9taSBWYWxrZWluZW4gPHRvbWku
dmFsa2VpbmVuQHRpLmNvbT4gWzIwMDYxNiAxMzowMl06Cj4+Pj4gT24gMTEvMDYvMjAyMCAxNzow
MCwgR3J5Z29yaWkgU3RyYXNoa28gd3JvdGU6Cj4+Pj4+IEkgdGhpbmssIHN1c3BlbmQgbWlnaHQg
YmUgZml4ZWQgaWYgYWxsIGRldmljZXMsIHdoaWNoIGFyZSBub3cgY2hpbGQgb2YgdGktc3lzYywg
d2lsbCBkbwo+Pj4+PiBwbV9ydW50aW1lX2ZvcmNlX3h4eCgpIGNhbGxzIGF0IG5vaXJxIHN1c3Bl
bmQgc3RhZ2UgYnkgYWRkaW5nOgo+Pj4+Pgo+Pj4+PiDCoCDCoMKgwqDCoFNFVF9OT0lSUV9TWVNU
RU1fU0xFRVBfUE1fT1BTKHBtX3J1bnRpbWVfZm9yY2Vfc3VzcGVuZCwKPj4+Pj4gwqAgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBtX3J1bnRpbWVfZm9yY2VfcmVz
dW1lKQo+Pj4+Pgo+Pj4+PiBBbSBJIG1pc3Npbmcgc210aD8KPj4+Pgo+Pj4+IElzbid0IHRoaXMg
YWxtb3N0IGV4YWN0bHkgdGhlIHNhbWUgbXkgcGF0Y2ggZG9lcz8gSSBqdXN0IHVzZWQgc3VzcGVu
ZF9sYXRlCj4+Pj4gYW5kIHJlc3VtZV9lYXJseS4gSXMgbm9pcnEgcGhhc2UgYmV0dGVyIHRoYW4g
bGF0ZSAmIGVhcmx5Pwo+Pj4KPj4+IFdlbGwgdXAgdG8geW91IGFzIGZhciBhcyBJJ20gY29uY2Vy
bmVkLiBUaGUgbm9pcnEgcGhhc2UgY29tZXMgd2l0aCBzZXJpb3VzCj4+PiBsaW1pdGF0aW9ucywg
Zm9yIGxldCdzIHNheSBpMmMgYnVzIHVzYWdlIGlmIG5lZWRlZC4gUHJvYmFibHkgYWxzbyBoYXJk
ZXIKPj4+IHRvIGRlYnVnIGZvciBzdXNwZW5kIGFuZCByZXN1bWUuCj4+Cj4+IFVuZm9ydHVuYXRl
bHksIHlvdSBjYW4ndCB1c2UgUE0gcnVudGltZSBmb3JjZSBBUEkgYXQgLnN1c3BlbmQoKSBzdGFn
ZSBhcyBwbV9ydW50aW1lX2dldCB3aWxsIHN0aWxsIHdvcmsgYW5kCj4+IHRoZXJlIGlzIG5vIHN5
bmMgYmV0d2VlbiBzdXNwZW5kIGFuZCBwbV9ydW50aW1lLgo+PiBUaGUgUE0gcnVudGltZSBmb3Jj
ZSBBUEkgY2FuIGJlIHVzZWQgb25seSBkdXJpbmcgbGF0ZS9ub2lycSBhcyBhdCB0aGlzIHRpbWUg
cG1fcnVudGltZSBpcyBkaXNhYmxlZC4KPiAKPiBZZXMsIGJ1dCB3aGljaCBvbmUuLi4gRG8geW91
IGtub3cgd2hhdCB0aGUgZGlmZiBpcyB3aXRoIGxhdGUvbm9pcnEgZnJvbSBkcml2ZXIncyBwZXJz
cGVjdGl2ZT8gSSBndWVzcyBub2lycSBpcyBhdG9taWMgY29udGV4dCwgbGF0ZSBpcyBudG8/Cgpu
b2lycSBpcyAqbm90KiBhdG9taWMsIGp1cyBJUlFzIChub24td2FrZXVwKSB3aWxsIGJlIGRpc2Fi
bGVkIChkaXNiYWxlX2lycSgpKQoKPiAKPiBEaXNwYydzIHN1c3BlbmQgdXNlcyBzeW5jaHJvbml6
ZV9pcnEoKSwgc28gdGhhdCBydWxlcyBvdXQgbm9pcnEuIEFsdGhvdWdoIHRoZSBjYWxsIGlzIG5v
dCBuZWVkZWQgaWYgdXNpbmcgbm9pcnEgdmVyc2lvbiwgc28gdGhhdCBjb3VsZCBhbHNvIGJlIG1h
bmFnZWQgd2l0aCBzbWFsbCBjaGFuZ2UuIEJ1dCBJIHdvbmRlciBpZiB0aGVyZSdzIGFueSBiZW5l
Zml0IGluIHVzaW5nIG5vaXJxIHZlcnN1cyBsYXRlLgoKCgoKLS0gCkJlc3QgcmVnYXJkcywKZ3J5
Z29yaWkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
