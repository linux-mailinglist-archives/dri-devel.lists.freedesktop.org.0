Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9359DE29
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 08:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B3089A0E;
	Tue, 27 Aug 2019 06:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81A689A0E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 06:38:29 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7R6cLGB102658;
 Tue, 27 Aug 2019 01:38:21 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7R6cLRo025152
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 27 Aug 2019 01:38:21 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 27
 Aug 2019 01:38:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 27 Aug 2019 01:38:20 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7R6cIoV014529;
 Tue, 27 Aug 2019 01:38:19 -0500
Subject: Re: [PATCH 13/60] drm/bridge: tfp410: Don't include drmP.h
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-10-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <3bb82dc4-434a-aaac-8ea1-3aff0991e790@ti.com>
Date: Tue, 27 Aug 2019 09:38:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190707181937.6250-10-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1566887901;
 bh=+6UrsMkyB3O2J6mScXfip5mdM5O+kDldPK9A2k3Fj4U=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=YPLy/BvrkcHQqLV6E5AsYgf3WWJQa97OmOzjhcyrXbVqh+Ac0B2TX1cUyZSLZtCk1
 hAGzzIO04Wr/S192WgovyWrQgOjW0IU2PDAb/iTfoKmnExBu5bbRaRVtbaXvGgKbGZ
 UH8wWF9yQ9VZaZnsPxp59yC2C94pMGd+KMrInevU=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcvMDcvMjAxOSAyMToxOCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBUaGUgZHJtUC5o
IGhlYWRlciBpcyBkZXByZWNhdGVkLCByZXBsYWNlIGl0IHdpdGggdGhlIGhlYWRlcnMKPiBzcGVj
aWZpY2FsbHkgbmVlZGVkIGJ5IHRoZSB0ZnA0MTAgZHJpdmVyLiBXaGlsZSBhdCBpdCwgcmVwbGFj
ZSB0aGUgRFJNCj4gcHJpbnQgbWFjcm9zIHdpdGggZGV2X2luZm8oKSBhbmQgZGV2X2VycigpIGlu
c3RlYWQgb2YgaW5jbHVkaW5nCj4gZHJtX3ByaW50LmgKPiAKPiBTaWduZWQtb2ZmLWJ5OiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gLS0tCj4g
ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jIHwgNiArKysrLS0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3RpLXRmcDQxMC5jCj4gaW5kZXggOGQ0NjkwZTQzNmMzLi5hMWNhZDc3N2IwNTcgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMKPiBAQCAtMTgsNiArMTgsNyBAQAo+ICAg
I2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ICAgCj4gICAjaW5jbHVkZSA8ZHJt
L2RybV9hdG9taWNfaGVscGVyLmg+Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX2JyaWRnZS5oPgo+ICAg
I2luY2x1ZGUgPGRybS9kcm1fY3J0Yy5oPgo+ICAgI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4K
PiAgICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgoKWW91J3JlIG5vdCBhY3R1YWxs
eSByZW1vdmluZyBkcm1QLmguIFNvIGlzIHRoZSBkcm1fYnJpZGdlLmggbmVlZGVkPwoKICBUb21p
CgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAx
ODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2Ev
RG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
