Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31156CBBCB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 15:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481AE6EB7F;
	Fri,  4 Oct 2019 13:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4856EB7F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 13:33:26 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x94DXHsZ011535;
 Fri, 4 Oct 2019 08:33:17 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x94DXHfK086791
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 4 Oct 2019 08:33:17 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 4 Oct
 2019 08:33:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 4 Oct 2019 08:33:15 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94DXDQw076936;
 Fri, 4 Oct 2019 08:33:14 -0500
Subject: Re: Should regulator core support parsing OF based fwnode?
To: Mark Brown <broonie@kernel.org>, Jacek Anaszewski
 <jacek.anaszewski@gmail.com>
References: <20191003082812.28491-1-jjhiblot@ti.com>
 <20191003082812.28491-3-jjhiblot@ti.com>
 <20191003104228.c5nho6eimwzqwxpt@earth.universe>
 <acd11fe1-1d51-eda5-f807-c16319514c3a@ti.com>
 <62591735-9082-1fd7-d791-07929ddaa223@gmail.com>
 <20191003183554.GA37096@sirena.co.uk>
 <25b9614f-d6be-9da5-0fe5-eb58c8c93850@gmail.com>
 <20191003194140.GE6090@sirena.co.uk>
 <a9f668f9-ad26-4e18-178a-8403b8b3b1db@gmail.com>
 <20191004113942.GB4866@sirena.co.uk>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <b6318ba5-e76e-dc1c-6921-a702abf6749c@ti.com>
Date: Fri, 4 Oct 2019 15:33:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191004113942.GB4866@sirena.co.uk>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570195997;
 bh=ICdFi7+va2YgW8u1kII9BM7D1dGZnBwB8N4tj2oyY6U=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=xm/cy/ZDQpxKlKJ+HJJJn6+nRj73V0KAzK9nRnc0pENSQCLduGunQFABQaxTHDLQ5
 JT0h7F76kq0dqVtFEUOaAn6n/gFylvUXKmrEV2mFDC1s2RsMcb2nyJFz9JE0DZ+Kpq
 MiFZCdf1n0DNgc0LfeHX1pmv3lY45z+x6k1YN1gI=
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org,
 Liam Girdwood <lgirdwood@gmail.com>, tomi.valkeinen@ti.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, dmurphy@ti.com, pavel@ucw.cz, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDA0LzEwLzIwMTkgMTM6MzksIE1hcmsgQnJvd24gd3JvdGU6Cj4gT24gVGh1LCBPY3QgMDMs
IDIwMTkgYXQgMTA6Mjc6MjZQTSArMDIwMCwgSmFjZWsgQW5hc3pld3NraSB3cm90ZToKPj4gT24g
MTAvMy8xOSA5OjQxIFBNLCBNYXJrIEJyb3duIHdyb3RlOgo+Pj4gV2h5IHdvdWxkIHdlIHdhbnQg
dG8gZG8gdGhhdD8gIFdlJ2QgY29udGludWUgdG8gc3VwcG9ydCBvbmx5IERUIHN5c3RlbXMsCj4+
PiBqdXN0IHdpdGggY29kZSB0aGF0J3MgbGVzcyBvYnZpb3VzbHkgRFQgb25seSBhbmQgd291bGQg
bmVlZCB0byBwdXQKPj4+IGNoZWNrcyBpbi4gIEknbSBub3Qgc2VlaW5nIGFuIHVwc2lkZSBoZXJl
Lgo+PiBGb3IgaW5zdGFuY2UgZmV3IHdlZWtzIGFnbyB3ZSBoYWQgYSBwYXRjaCBbMF0gaW4gdGhl
IExFRCBjb3JlIHN3aXRjaGluZwo+PiBmcm9tIHVzaW5nIHN0cnVjdCBkZXZpY2UncyBvZl9ub2Rl
IHByb3BlcnR5IHRvIGZ3bm9kZSBmb3IgY29udmV5aW5nCj4+IGRldmljZSBwcm9wZXJ0eSBkYXRh
LiBBbmQgdGhpcyB0cmFuc2l0aW9uIHRvIGZ3bm9kZSBwcm9wZXJ0eSBBUEkgY2FuIGJlCj4+IG9i
c2VydmVkIGFzIGEgZnJlcXVlbnQgcGF0dGVybiBhY3Jvc3Mgc3Vic3lzdGVtcy4KPiBGb3IgbW9z
dCBzdWJzeXN0ZW1zIHRoZSBpbnRlbnQgaXMgdG8gcmV1c2UgRFQgYmluZGluZ3Mgb24gZW1iZWRk
ZWQgQUNQSQo+IHN5c3RlbXMgdmlhIF9EU0QuCj4KPj4gUmVjZW50bHkgdGhlcmUgaXMgYW4gb25n
b2luZyBlZmZvcnQgYWltaW5nIHRvIGFkZCBnZW5lcmljIHN1cHBvcnQgZm9yCj4+IGhhbmRsaW5n
IHJlZ3VsYXRvcnMgaW4gdGhlIExFRCBjb3JlIFsxXSwgYnV0IGl0IHR1cm5zIG91dCB0byByZXF1
aXJlCj4+IGJyaW5naW5nIGJhY2sgaW5pdGlhbGl6YXRpb24gb2Ygb2Zfbm9kZSBwcm9wZXJ0eSBm
b3IKPj4gZGV2bV9yZWd1bGF0b3JfZ2V0X29wdGlvbmFsKCkgdG8gd29yayBwcm9wZXJseS4KPiBD
b25zdW1lcnMgc2hvdWxkIGp1c3QgYmUgYWJsZSB0byByZXF1ZXN0IGEgcmVndWxhdG9yIHdpdGhv
dXQgaGF2aW5nIHRvCj4gd29ycnkgYWJvdXQgaG93IHRoYXQncyBiZWluZyBwcm92aWRlZCAtIHRo
ZXkgc2hvdWxkIGhhdmUgbm8ga25vd2xlZGdlIGF0Cj4gYWxsIG9mIGZpcm13YXJlIGJpbmRpbmdz
IG9yIHBsYXRmb3JtIGRhdGEgZm9yIGRlZmluaW5nIHRoaXMuICBJZiB0aGV5Cj4gZG8gdGhhdCBz
dWdnZXN0cyB0aGVyZSdzIGFuIGFic3RyYWN0aW9uIGlzc3VlIHNvbWV3aGVyZSwgd2hhdCBtYWtl
cyB5b3UKPiB0aGluayB0aGF0IGRvaW5nIHNvbWV0aGluZyB3aXRoIG9mX25vZGUgaXMgcmVxdWly
ZWQ/CgpUaGUgcmVndWxhdG9yIGNvcmUgYWNjZXNzZXMgY29uc3VtZXItPm9mX25vZGUgdG8gZ2V0
IGEgcGhhbmRsZSB0byBhIApyZWd1bGF0b3IncyBub2RlLiBUaGUgdHJvdWJsZSBhcmlzZXMgZnJv
bSB0aGUgZmFjdCB0aGF0IHRoZSBMRUQgY29yZSAKZG9lcyBub3QgcG9wdWxhdGUgb2Zfbm9kZSBh
bnltb3JlLCBpbnN0ZWFkIGl0IHBvcHVsYXRlcyBmd25vZGUuIFRoaXMgCmFsbG93cyB0aGUgTEVE
IGNvcmUgdG8gYmUgYWdub3N0aWMgb2YgQUNQSSBvciBPRiB0byBnZXQgdGhlIHByb3BlcnRpZXMg
Cm9mIGEgTEVELgoKSU1PIGl0IGlzIGJldHRlciB0byBwb3B1bGF0ZSBib3RoIG9mX25vZGUgYW5k
IGZ3bm9kZSBpbiB0aGUgTEVEIGNvcmUgYXQgCnRoZSBtb21lbnQuIEl0IGhhcyBhbHJlYWR5IGJl
ZW4gZml4ZWQgdGhpcyB3YXkgZm9yIHRoZSBwbGF0Zm9ybSBkcml2ZXIgClswXSwgTVREIFsxXSBh
bmQgUENJLU9GIFsyXS4KCj4KPiBGdXJ0aGVyLCB1bmxlc3MgeW91IGhhdmUgTEVEcyB0aGF0IHdv
cmsgd2l0aG91dCBwb3dlciB5b3UgcHJvYmFibHkKPiBzaG91bGRuJ3QgYmUgdXNpbmcgX2dldF9v
cHRpb25hbCgpIGZvciB0aGVpciBzdXBwbHkuICBUaGF0IGludGVyZmFjZSBpcwo+IGludGVuZGVk
IG9ubHkgZm9yIHN1cHBsaWVzIHRoYXQgbWF5IGJlIHBoeXNpY2FsbHkgYWJzZW50LgoKTm90IGFs
bCBMRURzIGhhdmUgYSByZWd1bGF0b3IgdG8gcHJvdmlkZSB0aGUgcG93ZXIuIFRoZSBwb3dlciBj
YW4gYmUgCnN1cHBsaWVkIGJ5IHRoZSBMRUQgY29udHJvbGxlciBmb3IgZXhhbXBsZS4KCgpbMF0g
Zjk0Mjc3YWYwM2VhZDBkM2JmMiBvZi9wbGF0Zm9ybTogSW5pdGlhbGlzZSBkZXYtPmZ3bm9kZSBh
cHByb3ByaWF0ZWx5CgpbMV0gYzE3NmM2ZDdlOTMyNjYyNjY4IG1mZDogY29yZTogU2V0IGZ3bm9k
ZSBmb3IgY3JlYXRlZCBkZXZpY2VzCgpbMl0gOWIwOTlhNmM3NWU0ZGRjZWVhIFBDSTogT0Y6IElu
aXRpYWxpemUgZGV2LT5md25vZGUgYXBwcm9wcmlhdGVseQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
