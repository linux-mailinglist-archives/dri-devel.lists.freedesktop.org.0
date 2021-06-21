Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5E23AE4B2
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 10:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1C289C93;
	Mon, 21 Jun 2021 08:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D34E89C93
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 08:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1624263730; x=1626855730;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j+xB7H9HGYdYGqce6ZAiCB34bLZKU7MahT3T7Ll1a8U=;
 b=T5mYIaf5CpVKoca1J6Z3n2iopRZ2SHHQF/pjoVZYqrB472sChRXVMDfhu1RDb2Xs
 nNnD6jhIRHE8O4Dhex1ZfK6mCO5bT/9undKc39TXdj59CPQPLIiGBsswEHoEgv2e
 ZYEf/V80W0nf+Qy6cdK1F0UZ3sr+H3nvJwEn+uF5xWI=;
X-AuditID: c39127d2-a77bc70000001c5e-0c-60d04c3223cd
Received: from florix.phytec.de (florix.phytec.de [172.16.0.118])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 8B.D2.07262.23C40D06;
 Mon, 21 Jun 2021 10:22:10 +0200 (CEST)
Received: from Berlix.phytec.de (172.16.0.117) by Florix.phytec.de
 (172.16.0.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 21 Jun
 2021 10:22:10 +0200
Received: from Berlix.phytec.de ([fe80::343f:7618:c7ce:97c9]) by
 berlix.phytec.de ([fe80::343f:7618:c7ce:97c9%3]) with mapi id 15.01.2176.009; 
 Mon, 21 Jun 2021 10:22:10 +0200
From: =?utf-8?B?U3RlZmFuIFJpZWRtw7xsbGVy?= <S.Riedmueller@phytec.de>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "airlied@linux.ie"
 <airlied@linux.ie>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/3] drm/panel: Add connector_type and bus_format for AUO
 G104SN02 V2 panel
Thread-Topic: [PATCH 1/3] drm/panel: Add connector_type and bus_format for AUO
 G104SN02 V2 panel
Thread-Index: AQHXMdf+y0dS36bcQE6gcAvYiVq17ar1fdqAgCjp/gA=
Date: Mon, 21 Jun 2021 08:22:10 +0000
Message-ID: <5942e9c67f7d50737536613b80a2cb42a3615b3d.camel@phytec.de>
References: <20210415091616.53415-1-s.riedmueller@phytec.de>
 <57bf547d95ba84f72d0f9da0e687fbe71311e5b8.camel@phytec.de>
In-Reply-To: <57bf547d95ba84f72d0f9da0e687fbe71311e5b8.camel@phytec.de>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.0.116]
Content-Type: text/plain; charset="utf-8"
Content-ID: <C7A4566DCC146349A87FC4C76A0BC936@phytec.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRmVeSWpSXmKPExsWyRoChTNfI50KCwYbfxha9504yWfzfNpHZ
 4srX92wWnROXsFtc3jWHzWLFz62MFj93zWNxYPfY+20Bi8fOWXfZPWZ3zGT12P7tAavH/e7j
 TB5Lpl1l8/i8SS6APYrLJiU1J7MstUjfLoEr49LFG8wF53gqzh7ayd7AuISni5GTQ0LARGLd
 6pVMXYxcHEICy5kkthzuY4dwHjJK9N6eAJXZxCjx6/48JpAWNgEXic9t39hAEiICGxglHu7e
 wwriMAtcZpRoObidHaRKWCBR4vKhrywgtohAksTUh49ZIWwrictHtrOB2CwCqhINjzYAxTk4
 eAXcJBq/Z4CEhQSqJJac7wcbwyngLjH7cRdYK6OArERnwzuwI5gFxCU2PfvOCvGDgMSSPeeZ
 IWxRiZeP/0HFFSTaejqZQMYzC2hKrN+lD2FaSGy6oAkxRVFiSvdDsE28AoISJ2c+YZnAKD4L
 yYJZCM2zEJpnIWmehaR5ASPrKkah3Mzk7NSizGy9gozKktRkvZTUTYzASD48Uf3SDsa+OR6H
 GJk4GA8xSnAwK4nwcmaeSRDiTUmsrEotyo8vKs1JLT7EKM3BoiTOu4G3JExIID2xJDU7NbUg
 tQgmy8TBKdXAKFbQHqJwrv3QfoXNy+V3nF22zp/5ReWrc/Xintp2/0+Y/7pc8NS2db72C81r
 aTtEmbROzrvsnrPjlVpyUfXslSWWTvaR9lGWprHPu9n+nN54RL3XdNPsIu+ZonErF+eeFLsY
 zcQ0Ly0vehWXuqLBVu0XEe0Kxxb5S7xT+GiqZeeyzs2pado2JZbijERDLeai4kQAvi9H/dIC
 AAA=
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
Cc: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNCmFub3RoZXIgZ2VudGxlIHBpbmcuDQoNCkFsc28gYWRkaW5nIExhdXJlbnQgUGluY2hh
cnQgdG8gQ0MuDQoNClJlZ2FyZHMsDQpTdGVmYW4NCg0KT24gV2VkLCAyMDIxLTA1LTI2IGF0IDA3
OjM0ICswMDAwLCBTdGVmYW4gUmllZG3DvGxsZXIgd3JvdGU6DQo+IEhpLA0KPiANCj4gZ2VudGxl
IHBpbmcgZm9yIHRoaXMgc21hbGwgc2VyaWVzLg0KPiANCj4gUmVnYXJkcywNCj4gU3RlZmFuDQo+
IA0KPiBPbiBUaHUsIDIwMjEtMDQtMTUgYXQgMTE6MTYgKzAyMDAsIFN0ZWZhbiBSaWVkbXVlbGxl
ciB3cm90ZToNCj4gPiBUaGUgQVVPIEcxMDRTTjAyIFYyIGlzIGFuIExWRFMgZGlzcGxheSB3aGlj
aCBzdXBwb3J0cyA2IGFuZCA4IGJwYyBQU1dHLg0KPiA+IEFkZCB0aGUgY29ycmVzcG9uZGluZyBj
b25uZWN0b3IgdHlwZSBhbmQgOCBicGMgYXMgZGVmYXVsdCBidXNfZm9ybWF0Lg0KPiA+IA0KPiA+
IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBSaWVkbXVlbGxlciA8cy5yaWVkbXVlbGxlckBwaHl0ZWMu
ZGU+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyB8
IDIgKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMNCj4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYw0KPiA+IGluZGV4IDRlMmRhZDMxNGM3
OS4uNDQ1ODNkMGVkOTAyIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9w
YW5lbC1zaW1wbGUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1w
bGUuYw0KPiA+IEBAIC0xMDk4LDYgKzEwOTgsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVs
X2Rlc2MgYXVvX2cxMDRzbjAyID0gew0KPiA+ICAJCS53aWR0aCA9IDIxMSwNCj4gPiAgCQkuaGVp
Z2h0ID0gMTU4LA0KPiA+ICAJfSwNCj4gPiArCS5idXNfZm9ybWF0ID0gTUVESUFfQlVTX0ZNVF9S
R0I4ODhfMVg3WDRfU1BXRywNCj4gPiArCS5jb25uZWN0b3JfdHlwZSA9IERSTV9NT0RFX0NPTk5F
Q1RPUl9MVkRTLA0KPiA+ICB9Ow0KPiA+ICANCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1f
ZGlzcGxheV9tb2RlIGF1b19nMTIxZWFuMDFfbW9kZSA9IHsNCg==
