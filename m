Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B24FB114293
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 15:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965B56E106;
	Thu,  5 Dec 2019 14:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE0A6E106
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 14:25:22 +0000 (UTC)
Received: from VI1PR08CA0251.eurprd08.prod.outlook.com (2603:10a6:803:dc::24)
 by AM6PR08MB5192.eurprd08.prod.outlook.com (2603:10a6:20b:d6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.21; Thu, 5 Dec
 2019 14:25:11 +0000
Received: from DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::203) by VI1PR08CA0251.outlook.office365.com
 (2603:10a6:803:dc::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12 via Frontend
 Transport; Thu, 5 Dec 2019 14:25:11 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT056.mail.protection.outlook.com (10.152.21.124) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Thu, 5 Dec 2019 14:25:11 +0000
Received: ("Tessian outbound 64ac59f2ee79:v37");
 Thu, 05 Dec 2019 14:25:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 27f4d37a2bbfa0b4
X-CR-MTA-TID: 64aa7808
Received: from 6099433ef415.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 768036F3-B177-4B3C-8C09-429EB040D10A.1; 
 Thu, 05 Dec 2019 14:25:05 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6099433ef415.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 05 Dec 2019 14:25:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WjCfKkHXbe2LOqZF2cgPG/grdG+TxfdL6eqDpmSaj7xA0iOtOThWtQo6+FqbJubhz3KIQRvdFeVGEMbVEAW5S9XZ5nwzqpeNhYJ3AldWafvqvKatvOL50Irj3XicSoppX5/TwqhlXi2DrfkJftw4FF4sJ+dPC1NrU8TUbpasurHNqCLsK9sPN3q+niDV3pJ3XIfVe2LCf/TQCKKUGvoqWez9FBOxxuD08dGiUvV1GcE3J7obBxRUH4mglUCeG8XRQDK/egqgcJjRF+7F2iBSxS9VhGEj3IJSvTh2JkP76LbbrhcaFKm/yGrd85sBSeQRKlhrcBS1awNn9JYdCp5tKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2gaSfS/AOSUARqmaSAtHyZlb0ZkH1PSkNBEEWPwFYs=;
 b=LRCBnfr8gq7SPMxBqDll/XMObV8l3Wyn7K1odZQbxyyK0+RwYvo8uFGIIPYSVTwNkBPCe/UU52fHBat6OdSltMad1c2YhszzxKyeemh6BYpDzvUYWT64rcI4xcjlVKPZsPGFyCQi5+NRcJIpeW1E8G8LcM47B5kTLno2R5ktoWHWt31QTLbMAMiod+glF9YrRpdVOgr2DJpawi6Dix4/P6yNqw+WoxDyNgqI7UYqaaBEE1wJE/cQWkhRk5JBg6zUTS0/8E6iaWDblWkCxSyoGi2Ld5axiNUVfKlZ0t0D6wYkvbaS2opi7JO3Xpt+ybwEm93HQm3vUjvQ9SaRZtWGSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4462.eurprd08.prod.outlook.com (20.179.26.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.22; Thu, 5 Dec 2019 14:25:04 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2516.014; Thu, 5 Dec 2019
 14:25:04 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 12/28] gpu: drm: bridge: sii9234: Use drm_bridge_init()
Thread-Topic: [PATCH v2 12/28] gpu: drm: bridge: sii9234: Use drm_bridge_init()
Thread-Index: AQHVqpi1nuxUXRNmNkWRvMMZxB0aZaerdNCAgAAYNIA=
Date: Thu, 5 Dec 2019 14:25:04 +0000
Message-ID: <3778483.nNFBiIlyVN@e123338-lin>
References: <20191204114732.28514-1-mihail.atanassov@arm.com>
 <20191204114732.28514-13-mihail.atanassov@arm.com>
 <a0727a3d-ccc5-7d09-9567-cf7fb68b1240@baylibre.com>
In-Reply-To: <a0727a3d-ccc5-7d09-9567-cf7fb68b1240@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LNXP265CA0076.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::16) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f193af37-8647-4802-5797-08d7798eefec
X-MS-TrafficTypeDiagnostic: VI1PR08MB4462:|AM6PR08MB5192:
X-Microsoft-Antispam-PRVS: <AM6PR08MB5192CE8BBCEE1F58BEAE43FD8F5C0@AM6PR08MB5192.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 02426D11FE
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(346002)(136003)(366004)(396003)(376002)(189003)(199004)(14454004)(99286004)(5660300002)(9686003)(71200400001)(71190400001)(66556008)(186003)(66476007)(52116002)(33716001)(11346002)(66446008)(6512007)(54906003)(316002)(86362001)(229853002)(2906002)(478600001)(81166006)(25786009)(102836004)(8676002)(6506007)(81156014)(305945005)(6486002)(53546011)(64756008)(66946007)(4326008)(6916009)(26005)(8936002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4462;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: iGq0hdsMEPTUerphJcJj1bAAgzrpWwizwnaFUllBIG6qycT1zSqMfwOlUTK02/ZUeKtNS69VAdhlrFTiPP71MraF/yK5ZZfZZeaReOIWbMdrCj6ZuN95Xq9Rid0YTece7FVjSpFGCcnr0BUdE5E2Wjo+tHcJGLhzqPtvl9voi7BQkcgjL4ChJENMPboldSqW6eUsa4vyk6fkX4iRa6qXDYRHnTqumwY3eLEkEvDpwn0TMUVvpfTBTby1dxxPes7cKisnDA3vSpNF4npvG2p04a9fwclyeNO10xLRb8VKo8Nw+ZltroFUlfPnGhKqhuXFu5m/PM3gJpwa0qxOXFAbv4LRPJlJfK7/xpD/R2nP027Kc71Sx8DOooa5HnO+FRIQFqOqJRJSUziydcXG4ZbTE/OyB/dij16x0e7Yop5Td91V2DYv90XyHNhkb69qnrkY
x-ms-exchange-transport-forked: True
Content-ID: <C9B1579D1646684EA33FC0BE4AF02DDB@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4462
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(396003)(39860400002)(346002)(136003)(189003)(199004)(8936002)(26005)(86362001)(76176011)(336012)(50466002)(6506007)(25786009)(2906002)(4326008)(305945005)(23726003)(107886003)(6862004)(186003)(22756006)(76130400001)(229853002)(81166006)(81156014)(26826003)(33716001)(8676002)(11346002)(70206006)(14454004)(316002)(9686003)(6512007)(46406003)(356004)(6486002)(478600001)(5660300002)(97756001)(70586007)(54906003)(102836004)(99286004)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB5192;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c460b271-1314-41fb-23f6-08d7798eeba1
NoDisclaimer: True
X-Forefront-PRVS: 02426D11FE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R4Yy44ijpUJ+zV40Y/KSrn+2wJC+4D02qbS/tRWvmkrdDPsbwrb8QBVYcOo2yDc7anDgESNs9L4Lg6HDKm/atSoAzsU8Ark1oIShEEa7eiYjWSTmG1IBYpP2/9qKTCzL0NZS4yL/oNUNNVw5AKLhREgyuIcWbeSY0VZgbYHHZRNb46VrRKUhsOyZ0tRkZWZArSXvGlHEwEXC5w2zqzFbEOGxVN3F/UL3wgfQiuMujmQ9SfA8gTahT4JEN4AYXi2HNqmgtYVjQvGC3fz3JDXBZafQ/LupbPuNPDyjEZ2RxrLikwFnzFF+fbJ0UkvVMalgwrRPQqu+QSIp1S/h4rra3hv2XnZJyPlNtp16p20ZntqkjKShoDhUeC0gbf5N3YBZFsCrtC29LzUCThVkarhMs+vWUgBdVXIpIkxYSZxqUw6qqoWASQ9XaoQa1g+C73wt
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2019 14:25:11.3244 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f193af37-8647-4802-5797-08d7798eefec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5192
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2gaSfS/AOSUARqmaSAtHyZlb0ZkH1PSkNBEEWPwFYs=;
 b=MooxaA5VOG6LHihqG+CetmiiRq4pYX6i98bvsblRW5q9MJStlOoCTKtusrxp/3WE+SLr+aYkYfP7ph40gPIKJO1yQhV5yv07uk6t+yMsSDb13l2oiDZiLETDq8M96YGkiuClMViEK3j1pQnqY8v3uerAJ90FuUu1hrAaCa9gcEc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2gaSfS/AOSUARqmaSAtHyZlb0ZkH1PSkNBEEWPwFYs=;
 b=MooxaA5VOG6LHihqG+CetmiiRq4pYX6i98bvsblRW5q9MJStlOoCTKtusrxp/3WE+SLr+aYkYfP7ph40gPIKJO1yQhV5yv07uk6t+yMsSDb13l2oiDZiLETDq8M96YGkiuClMViEK3j1pQnqY8v3uerAJ90FuUu1hrAaCa9gcEc=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmVpbCwKCk9uIFRodXJzZGF5LCA1IERlY2VtYmVyIDIwMTkgMTI6MTA6MzcgR01UIE5laWwg
QXJtc3Ryb25nIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDA0LzEyLzIwMTkgMTI6NDgsIE1paGFpbCBB
dGFuYXNzb3Ygd3JvdGU6Cj4gPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiA+IAo+IAo+IFdoeSB0
aGlzIHBhcnRpY3VsYXIgb25lIGhhcyAiZ3B1OiBkcm06IGJyaWRnZSIgdW5saWtlIHRoZSBvdGhl
ciBwYXRjaGVzIG9mIHRoZSBzZXJpZSA/Cj4gCgpJIHRvb2sgdGhlICJsb29rIGF0IHRoZSBmaWxl
J3MgZ2l0IGxvZyIgYXBwcm9hY2ggdG8gZGV0ZXJtaW5pbmcgdGhlIHByZWZpeC4KSSBjYW4gY2hh
bmdlIGl0IGlmIHlvdSBwcmVmZXIgYSAiZHJtL2JyaWRnZTogc2lpOTIzNCIgcHJlZml4IGluc3Rl
YWQuCgo+IE5laWwKPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFp
bC5hdGFuYXNzb3ZAYXJtLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c2lpOTIzNC5jIHwgMyArLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIg
ZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3NpaTkyMzQuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTIzNC5jCj4gPiBpbmRleCBm
ODFmODFiNzA1MWYuLmJmZDM4MzJiYWExYSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc2lpOTIzNC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTky
MzQuYwo+ID4gQEAgLTkyNSw4ICs5MjUsNyBAQCBzdGF0aWMgaW50IHNpaTkyMzRfcHJvYmUoc3Ry
dWN0IGkyY19jbGllbnQgKmNsaWVudCwKPiA+ICAKPiA+ICAJaTJjX3NldF9jbGllbnRkYXRhKGNs
aWVudCwgY3R4KTsKPiA+ICAKPiA+IC0JY3R4LT5icmlkZ2UuZnVuY3MgPSAmc2lpOTIzNF9icmlk
Z2VfZnVuY3M7Cj4gPiAtCWN0eC0+YnJpZGdlLm9mX25vZGUgPSBkZXYtPm9mX25vZGU7Cj4gPiAr
CWRybV9icmlkZ2VfaW5pdCgmY3R4LT5icmlkZ2UsIGRldiwgJnNpaTkyMzRfYnJpZGdlX2Z1bmNz
LCBOVUxMLCBOVUxMKTsKPiA+ICAJZHJtX2JyaWRnZV9hZGQoJmN0eC0+YnJpZGdlKTsKPiA+ICAK
PiA+ICAJc2lpOTIzNF9jYWJsZV9pbihjdHgpOwo+ID4gCj4gCj4gCgoKLS0gCk1paGFpbAoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
