Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D479E11365F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 21:25:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5CB6EA2D;
	Wed,  4 Dec 2019 20:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E646EA2D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 20:25:46 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB4KPjJ9042364;
 Wed, 4 Dec 2019 14:25:45 -0600
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB4KPjO9105856;
 Wed, 4 Dec 2019 14:25:45 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Dec
 2019 14:25:44 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 4 Dec 2019 14:25:44 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB4KPgha031318;
 Wed, 4 Dec 2019 14:25:43 -0600
Subject: Re: [PATCH 2/2] drm/panel: simple: Add Rocktech RK101II01D-CT panel
To: Jyri Sarha <jsarha@ti.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1574959312.git.jsarha@ti.com>
 <b2b1d0c9cfab12012a9e63630a0659389529d5d5.1574959312.git.jsarha@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <21112b71-132d-ffa3-5169-3ac79141365c@ti.com>
Date: Wed, 4 Dec 2019 22:25:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <b2b1d0c9cfab12012a9e63630a0659389529d5d5.1574959312.git.jsarha@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575491145;
 bh=nro2eHe8tCkYOVWTLjgEhDase96RoZMg0HA1YwblDI4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=U2187HS9VqVgZ2+QsVYbPN6RKaUX4buLy8DL4sl/SXphUiga7EZi4cRz625iorl5X
 vvNElaAeofovkyjBOCa60Ht4SJwp/RIpkEBLoK84yU+fEAha32YaYZGrKpzNENtyxO
 WNLfoBuWMJfTOXorYo23PAO5PaqhrY0P1EMzZ74U=
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
Cc: thierry.reding@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjgvMTEvMjAxOSAxODo0NSwgSnlyaSBTYXJoYSB3cm90ZToKPiBBZGQgc3VwcG9ydCBmb3Ig
Um9ja3RlY2ggUksxMDFJSTAxRC1DVCwgMTAuMSIgMTI4MHg4MDAgVEZUIHdpdGggTFZEUwo+IGlu
dGVyZmFjZSwgTEVEIGJhY2tsaWdodCBhbmQgaW50ZWdyYXRlZCBHb29kaXggR1Q5MjggY2FwYWNp
dGl2ZSB0b3VjaAo+IHBhbmVsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp5cmkgU2FyaGEgPGpzYXJo
YUB0aS5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMg
fCAzMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgMzIg
aW5zZXJ0aW9ucygrKQoKUmV2aWV3ZWQtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5l
bkB0aS5jb20+CgogIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jr
a2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1
MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
