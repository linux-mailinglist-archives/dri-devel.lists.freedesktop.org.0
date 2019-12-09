Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A3E116BD1
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 12:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB50C6E3B2;
	Mon,  9 Dec 2019 11:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80089.outbound.protection.outlook.com [40.107.8.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C3E6E0F7;
 Mon,  9 Dec 2019 11:08:50 +0000 (UTC)
Received: from HE1PR08CA0043.eurprd08.prod.outlook.com (2603:10a6:7:2a::14) by
 AM6PR08MB3704.eurprd08.prod.outlook.com (2603:10a6:20b:80::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.17; Mon, 9 Dec 2019 11:08:48 +0000
Received: from VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::204) by HE1PR08CA0043.outlook.office365.com
 (2603:10a6:7:2a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Mon, 9 Dec 2019 11:08:48 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT031.mail.protection.outlook.com (10.152.18.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Mon, 9 Dec 2019 11:08:47 +0000
Received: ("Tessian outbound 5574dd7ffaa4:v37");
 Mon, 09 Dec 2019 11:08:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ce6e759f3d951b5c
X-CR-MTA-TID: 64aa7808
Received: from 99659ef87d22.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 69F66424-0E93-4006-9F26-971950A802A7.1; 
 Mon, 09 Dec 2019 11:08:40 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 99659ef87d22.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 09 Dec 2019 11:08:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLU/lG0C4SveixcWptv+ykkBp2GEJiov9kF6HBmAdPVvGqRGdMZlfVuqDV8tkblwulrBcDfQl1cxTuZf3qfQClKodr3eFdomFtOJP1QHia7AeLV9XddLIEB2gVm55JGH/3fnqrHWy//GMGi6vNnFLyt6AeKcOqrqUhLB/u/cB+CUtcxgef/i78Dnf0Ney3d/9aqAnPEB6Cs0hSAU7HFYkyEOZQ0yGMBoS42fP1qkiaNw/tcAD/YY2IgobwxtyKLwAyr5bb451A1S/MZ4NSlBiZdx6w7WROWeCuWCgM6JACylgutVEBuEC5UIV4wDPRJUb+9WxVHdEH90/ATKguMMYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KObIKmOul30/wdgaaLfLddlLWgevjRSvoR4urKSF5Oo=;
 b=XCVmCakkxuXWD/2cWb2KCNDdwVvO2OySLKXui05uzSFL8DvYL5/RDUHoArxQh00I1UKQfjEG682dc+GfrVaIvtf44h5hlhTjinfOZH9FGB8Olwfo1g9J6J3k7Wsj1FjZ9I/UJxGUiYNSJaUyCc0fg/ndQVQMPmxqBW9j8dZjVz3QL0/5GgJlG7FPMGhpgdYY1xdTr8uF8PdcHt7cFxHJ85MY7CtGfx3OU4S4n5XqQDz87/Ej8/oJsLXLbxnGMKoonepUOTmhpOvBq7nE0Skc/NawjXCpeRkvIRKz9NpbvwbYeD7B3n3dm5FRFS3UMRPvD/1FNvQzCXkKeaC1k0ZnIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4206.eurprd08.prod.outlook.com (20.178.204.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Mon, 9 Dec 2019 11:08:36 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2516.018; Mon, 9 Dec 2019
 11:08:35 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 00/28] drm/bridge: Consolidate initialization
Thread-Topic: [PATCH v2 00/28] drm/bridge: Consolidate initialization
Thread-Index: AQHVqpiuNcYsgGgOskGx3fwlqVtM9aexpJKAgAAIAIA=
Date: Mon, 9 Dec 2019 11:08:35 +0000
Message-ID: <2634531.l7d0rgvqDW@e123338-lin>
References: <20191204114732.28514-1-mihail.atanassov@arm.com>
 <2989c044-8134-bb7c-a7e0-c518334bf4a6@baylibre.com>
In-Reply-To: <2989c044-8134-bb7c-a7e0-c518334bf4a6@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.54]
x-clientproxiedby: LO2P123CA0044.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::32)
 To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 333b1da2-6fe7-4c8f-3756-08d77c982a1f
X-MS-TrafficTypeDiagnostic: VI1PR08MB4206:|AM6PR08MB3704:
X-Microsoft-Antispam-PRVS: <AM6PR08MB37049B28CE56AC63D64325918F580@AM6PR08MB3704.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:298;OLM:298;
x-forefront-prvs: 02462830BE
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(51914003)(199004)(189003)(53754006)(7416002)(229853002)(6512007)(2906002)(186003)(5660300002)(7406005)(966005)(8936002)(71190400001)(52116002)(9686003)(8676002)(6486002)(66556008)(53546011)(316002)(305945005)(71200400001)(6506007)(33716001)(66476007)(81166006)(81156014)(54906003)(64756008)(4326008)(86362001)(110136005)(66946007)(478600001)(26005)(66446008)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4206;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 8z/I4+ZeXMvRgLBU8q8Do1Fop3db4YUeAUvfDy5fw+fv7moLU4/xWtv9ZHAFvBAIpMb/GNuQBBUtsXO6o4muxdwHtH/W7TvRVsmSgIOtTxndPkGc1awIe4I88H3qkEjM/CJgKNtDLzR8iQj6R4I+c5VHhIn/Z4GoPF3DmfR43CcQC5BmW1zW4cJSUJQNV7OedCmjfB2j6eHZNxluaYJY0vQuy2Wjvs3a8MyBIHBLvJjj8RM+naSwsIDSKsQ+CCOWHXJcOGk4heZmLbL95z/0URrdXoZ402QeXIdZCcmksocrOg3w9qKgFh35+GhKTLS1BFf2qQpn+S7BUJfHsYsNHZO1UKtd8dgT0xAc08gWeTlayKXmf/XkPQtRpVibWnx760BTdhe3L0XBlGIC/BHPC1M6zbkoI2xDYx1tUAJQPsURv7WiB/Ir9s3XmKIMjdL9N/1ExRC/7HtMo/CRp0UR85mb1OHSItjnmw3i5aGRU1gMpHOTy9xOevMp+9zw3HgrfdNheZIKNVctKkSgQ1uAwxtBIEmOpFhOxYSpkPGgCUuUaVF/jhWErL8x1UlFjLVjq9/Vys8/86s1zeVwAQBhvA==
x-ms-exchange-transport-forked: True
Content-ID: <6DE8CEF268029D48A1091A9874B0AA3F@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4206
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(396003)(346002)(136003)(39860400002)(51914003)(53754006)(189003)(199004)(26005)(186003)(2906002)(6506007)(53546011)(54906003)(5660300002)(966005)(305945005)(70586007)(70206006)(478600001)(26826003)(110136005)(76130400001)(36906005)(8936002)(33716001)(6486002)(336012)(4326008)(316002)(81156014)(81166006)(450100002)(8676002)(229853002)(86362001)(356004)(6512007)(9686003)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3704;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: bb56fc6b-b4c8-4697-d8a5-08d77c9822af
NoDisclaimer: True
X-Forefront-PRVS: 02462830BE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y8EpmY0gfPOSmUqvNMooAkaqOaIX7PWHJ72MghES4aNGRXQwBXdCDzGAIi4JLUW+IAhCoCeHLXPhUyiIbnunj+vxo4+VD/aPepvw6jNsiurXA9XCx6u5Vb49YKFH49RY6I+qX4xgt1+i9hvuD3y+DbNZ9PZim0BNLVplUMx394ngpZibzqCHUUBQk6wKQtLQt7Z4E7ndawmcnIf9/O3Ar/o7ijQKxZ4LVUWU8x9GheRSDObODSdFWEuWQtLknq93GQzjh3D3C1tvYlwVDFeYYgjdtHbFAvXQpfBuc3IOWlNmtiJgDZSYoBi4Bu/exINwXA7Ka9vog++8GF7zx6l7HiWckztBClgh3OfFPXAu9WwdDGYMOr9E2F1COGO38EZDM6SHMcUHbAd0971gov6sGpeQPYigmyi6yJVISL8au1WLtIfC4urKKi3PBx6CZ+5dix8t5fbhw+EKfMyrnFpro3+vKrv/8Jb1iZG3xWnSmxBMzlgWn1z4tOZvTQt1oxo0KzWqYbUUZ2tjGCjzEYeY1UAuwTxmWkW0q+P78aRyiLAqVB3H9b0hkOkNmTe1B4W1g/Zkh/yPnzKsxyHwDpIeuQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2019 11:08:47.8305 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 333b1da2-6fe7-4c8f-3756-08d77c982a1f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3704
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KObIKmOul30/wdgaaLfLddlLWgevjRSvoR4urKSF5Oo=;
 b=o0V5fQ8lmIL/mzjEJUsMLuJjrhwzVtVo40UUC+jM7S7t99vndJV1lXkNuNrmc38+1kSHMfgCzc66BaddmROQHkt+m5L/TBRIcirndXg7FiQOllbuy5Q3N4KfjvIuMJwzbIQRkwvFrd2EPUYAD4ej8gm/mEQbND+YASdAxjKHfYQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KObIKmOul30/wdgaaLfLddlLWgevjRSvoR4urKSF5Oo=;
 b=o0V5fQ8lmIL/mzjEJUsMLuJjrhwzVtVo40UUC+jM7S7t99vndJV1lXkNuNrmc38+1kSHMfgCzc66BaddmROQHkt+m5L/TBRIcirndXg7FiQOllbuy5Q3N4KfjvIuMJwzbIQRkwvFrd2EPUYAD4ej8gm/mEQbND+YASdAxjKHfYQ=
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
Cc: Martyn Welch <martyn.welch@collabora.co.uk>,
 David Airlie <airlied@linux.ie>, Peter Senna Tschudin <peter.senna@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jerome Brunet <jbrunet@baylibre.com>,
 =?iso-8859-1?Q?Yannick_Fertr=E9?= <yannick.fertre@st.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Kukjin Kim <kgene@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
 Jonas Karlman <jonas@kwiboo.se>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, nd <nd@arm.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Dariusz Marcinkiewicz <darekm@google.com>,
 Martin Donnelly <martin.donnelly@ge.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Douglas Anderson <dianders@chromium.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Brian Masney <masneyb@onstation.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uZGF5LCA5IERlY2VtYmVyIDIwMTkgMTA6Mzk6MDcgR01UIE5laWwgQXJtc3Ryb25nIHdy
b3RlOgo+IEhpIE1paGFpbCwKCkhpIE5laWwsCgo+IAo+IE9uIDA0LzEyLzIwMTkgMTI6NDgsIE1p
aGFpbCBBdGFuYXNzb3Ygd3JvdGU6Cj4gPiBIaSBhbGwsCj4gPiAKPiA+IEkndmUgZHJvcHBlZCB0
aGUgZnVuIHBhcnRzIG9mIHRoaXMgc2VyaWVzIHNpbmNlIHRoZXkgbmVlZCBtb3JlIHdvcmssIGJ1
dAo+ID4gZmlndXJlZCBkcm1fYnJpZGdlX2luaXQoKSBhcyBhIGNvbmNlcHQgaXMgc3RpbGwgdmFs
dWFibGUgb24gaXRzIG93biAoYW5kCj4gPiBJIHRoaW5rIEknbGwgbmVlZCBpdCB0byByb2xsIG91
dCBkZXZpY2UgbGlua3MgZm9yIHJlZ2lzdGVyZWQgYnJpZGdlcyksCj4gPiBzbyBoZXJlIGdvZXMu
Cj4gPiAKPiA+IHYyOgo+ID4gIC0gZXhwYW5kZWQgY29tbWl0IG1lc3NhZ2VzIGFuZCBhZGRlZCBz
b21lIGV4dHJhIGJyaWRnZS1yZWxhdGVkCj4gPiAgICBkb2N1bWVudGF0aW9uIChEYW5pZWwpCj4g
PiAgLSBkcm9wcGVkIHYxIHBhdGNoZXMgMjkgYW5kIDMwOiAyOSBuZWVkcyBtb3JlIHdvcmssIGFu
ZCAzMCBkZXBlbmRzIG9uCj4gPiAgICBpdAo+ID4gIC0gYWRkZWQgYWxsIHJlbWFpbmluZyBkcm1f
YnJpZGdlIGltcGxlbWVudGVycywgZm91bmQgYnkgc2VhcmNoaW5nIGZvcgo+ID4gICAgZHJtX2Jy
aWRnZV9mdW5jcyB3aGljaCBpcyBtYW5kYXRvcnkgZm9yIGFueSBicmlkZ2U7IG5ldyB1c2VzIGlu
Cj4gPiAgICBwYXRjaGVzIDMsIDI3LCBhbmQgMjggKFNhbSkKPiA+ICAtIGR1ZSB0byB0aGUgYWJv
dmUsIEkndmUgZGVjaWRlZCB0byBzcXVhc2ggYWxsIGFuYWxvZ2l4IGNoYW5nZXMgaW50bwo+ID4g
ICAgb25lIHBhdGNoCj4gPiAKPiA+IC0tLQo+ID4gdjEgW2h0dHBzOi8vcGF0Y2h3b3JrLmZyZWVk
ZXNrdG9wLm9yZy9zZXJpZXMvNzAwMzkvXSBjb3ZlciB0ZXh0IGJlbG93Ogo+ID4gCj4gPiBUaGlz
IHNlcmllcyBhZGRzIGRldmljZSBsaW5rcyBzdXBwb3J0IHRvIGRybV9icmlkZ2UuIFRoZSBtb3Rp
dmF0aW9uCj4gPiBiZWhpbmQgaXQgaXMgdGhhdCBhIGRybV9icmlkZ2UgaW4gYSBtb2R1bGUgY291
bGQgZ2V0IHJlbW92ZWQgdW5kZXIgdGhlCj4gPiBmZWV0IG9mIHRoZSBicmlkZ2UgdXNlciB3aXRo
b3V0IHdhcm5pbmcsIHNvIHdlIG5lZWQgYSB3YXkgdG8gcmVtb3ZlIGFuZAo+ID4gcmVwcm9iZSB0
aGUgY2xpZW50IGFzIG5lZWRlZCB0byBhdm9pZCBwZWVyaW5nIGludG8gdGhlIHZvaWQuCj4gPiAK
PiA+IDE6IEFkZCBhIGRybV9icmlkZ2VfaW5pdCgpIGZ1bmN0aW9uIHdoaWNoIHdyYXBzIGFsbCBp
bml0aWFsaXNhdGlvbiBvZgo+ID4gdGhlIHN0cnVjdHVyZSBwcmlvciB0byBjYWxsaW5nIGRybV9i
cmlkZ2VfYWRkKCkuCj4gPiAKPiA+IDItMjYsMjg6IEFwcGx5IHRoZSBkcm1fYnJpZGdlX2luaXQo
KSByZWZhY3RvciB0byBldmVyeSBicmlkZ2UgdGhhdCB1c2VzCj4gPiBkcm1fYnJpZGdlX2FkZCgp
Lgo+ID4gCj4gPiAyNzogTWlub3IgY2xlYW51cCBpbiByY2FyLWR1Lgo+ID4gCj4gPiAyOTogQWRk
IG9mX2RybV9maW5kX2JyaWRnZV9kZXZsaW5rKCkgd2hpY2ggZnVuY3Rpb25zIHRoZSBzYW1lIGFz
Cj4gPiBvZl9kcm1fZmluZF9icmlkZ2UoKSBwbHVzIGFkZHMgYSBkZXZpY2UgZGV2aWNlIGxpbmsg
ZnJvbSB0aGUgb3duaW5nCj4gPiBkcm1fZGV2aWNlIHRvIHRoZSBicmlkZ2UgZGV2aWNlLgo+ID4g
Cj4gPiAzMDogQXMgYSBtb3RpdmF0aW5nIGV4YW1wbGUsIGNvbnZlcnQga29tZWRhIHRvIGV4Y2x1
c2l2ZWx5IHVzZQo+ID4gZHJtX2JyaWRnZSBmb3IgaXRzIHBpcGUgb3V0cHV0czsgdGhpcyBpc24n
dCBhIHJlZ3Jlc3Npb24gaW4gdXNhYmlsaXR5Cj4gPiBhbnkgbW9yZSBzaW5jZSBkZXZpY2UgbGlu
a3MgYnJpbmcgdGhlIHNhbWUgYXV0b21hdGljIHJlbW92ZS9yZXByb2JlCj4gPiBmZWF0dXJlIGFz
IGNvbXBvbmVudHMuCj4gPiAKPiA+IE1paGFpbCBBdGFuYXNzb3YgKDI4KToKPiA+ICAgZHJtOiBJ
bnRyb2R1Y2UgZHJtX2JyaWRnZV9pbml0KCkKPiA+ICAgZHJtL2JyaWRnZTogYWR2NzUxMTogVXNl
IGRybV9icmlkZ2VfaW5pdCgpCj4gPiAgIGRybS9icmlkZ2UvYW5hbG9naXg6IFVzZSBkcm1fYnJp
ZGdlX2luaXQoKQo+ID4gICBkcm0vYnJpZGdlOiBjZG5zOiBVc2UgZHJtX2JyaWRnZV9pbml0KCkK
PiA+ICAgZHJtL2JyaWRnZTogZHVtYi12Z2EtZGFjOiBVc2UgZHJtX2JyaWRnZV9pbml0KCkKPiA+
ICAgZHJtL2JyaWRnZTogbHZkcy1lbmNvZGVyOiBVc2UgZHJtX2JyaWRnZV9pbml0KCkKPiA+ICAg
ZHJtL2JyaWRnZTogbWVnYWNoaXBzLXN0ZHB4eHh4LWdlLWI4NTB2My1mdzogVXNlIGRybV9icmlk
Z2VfaW5pdCgpCj4gPiAgIGRybS9icmlkZ2U6IG54cC1wdG4zNDYwOiBVc2UgZHJtX2JyaWRnZV9p
bml0KCkKPiA+ICAgZHJtL2JyaWRnZTogcGFuZWw6IFVzZSBkcm1fYnJpZGdlX2luaXQoKQo+ID4g
ICBkcm0vYnJpZGdlOiBwczg2MjI6IFVzZSBkcm1fYnJpZGdlX2luaXQoKQo+ID4gICBkcm0vYnJp
ZGdlOiBzaWk5MDJ4OiBVc2UgZHJtX2JyaWRnZV9pbml0KCkKPiA+ICAgZ3B1OiBkcm06IGJyaWRn
ZTogc2lpOTIzNDogVXNlIGRybV9icmlkZ2VfaW5pdCgpCj4gPiAgIGRybS9icmlkZ2U6IHNpbF9z
aWk4NjIwOiBVc2UgZHJtX2JyaWRnZV9pbml0KCkKPiA+ICAgZHJtL2JyaWRnZTogZHctaGRtaTog
VXNlIGRybV9icmlkZ2VfaW5pdCgpCj4gPiAgIGRybS9icmlkZ2Uvc3lub3BzeXM6IGRzaTogVXNl
IGRybV9icmlkZ2VfaW5pdCgpCj4gPiAgIGRybS9icmlkZ2U6IHRjMzU4NzY0OiBVc2UgZHJtX2Jy
aWRnZV9pbml0KCkKPiA+ICAgZHJtL2JyaWRnZTogdGMzNTg3Njc6IFVzZSBkcm1fYnJpZGdlX2lu
aXQoKQo+ID4gICBkcm0vYnJpZGdlOiB0aGM2MzogVXNlIGRybV9icmlkZ2VfaW5pdCgpCj4gPiAg
IGRybS9icmlkZ2U6IHRpLXNuNjVkc2k4NjogVXNlIGRybV9icmlkZ2VfaW5pdCgpCj4gPiAgIGRy
bS9icmlkZ2U6IHRpLXRmcDQxMDogVXNlIGRybV9icmlkZ2VfaW5pdCgpCj4gPiAgIGRybS9leHlu
b3M6IG1pYzogVXNlIGRybV9icmlkZ2VfaW5pdCgpCj4gPiAgIGRybS9pMmM6IHRkYTk5OHg6IFVz
ZSBkcm1fYnJpZGdlX2luaXQoKQo+ID4gICBkcm0vbWNkZTogZHNpOiBVc2UgZHJtX2JyaWRnZV9p
bml0KCkKPiA+ICAgZHJtL21lZGlhdGVrOiBoZG1pOiBVc2UgZHJtX2JyaWRnZV9pbml0KCkKPiA+
ICAgZHJtOiByY2FyLWR1OiBsdmRzOiBVc2UgZHJtX2JyaWRnZV9pbml0KCkKPiA+ICAgZHJtOiBy
Y2FyLWR1OiBsdmRzOiBEb24ndCBzZXQgZHJtX2JyaWRnZSBwcml2YXRlIHBvaW50ZXIKPiA+ICAg
ZHJtL3N0aTogVXNlIGRybV9icmlkZ2VfaW5pdCgpCj4gPiAgIGRybS9tc206IFVzZSBkcm1fYnJp
ZGdlX2luaXQoKQo+ID4gCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1
MTFfZHJ2LmMgIHwgIDUgKystCj4gPiAgLi4uL2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgt
YW54NjM0NS5jICAgIHwgIDUgKystCj4gPiAgLi4uL2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9n
aXgtYW54Nzh4eC5jICAgIHwgIDggKystLS0KPiA+ICAuLi4vZHJtL2JyaWRnZS9hbmFsb2dpeC9h
bmFsb2dpeF9kcF9jb3JlLmMgICAgfCAgNSArKy0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2NkbnMtZHNpLmMgICAgICAgICAgICAgfCAgNCArLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2R1bWItdmdhLWRhYy5jICAgICAgICAgfCAgNiArKy0tCj4gPiAgZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9sdmRzLWVuY29kZXIuYyAgICAgICAgIHwgIDcgKystLQo+ID4gIC4uLi9icmlkZ2Uv
bWVnYWNoaXBzLXN0ZHB4eHh4LWdlLWI4NTB2My1mdy5jICB8ICA0ICstLQo+ID4gIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvbnhwLXB0bjM0NjAuYyAgICAgICAgICB8ICA0ICstLQo+ID4gIGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYyAgICAgICAgICAgICAgICB8ICA3ICsrLS0KPiA+ICBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhcmFkZS1wczg2MjIuYyAgICAgICAgfCAgMyArLQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jICAgICAgICAgICAgICB8ICA1ICsrLQo+
ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTIzNC5jICAgICAgICAgICAgICB8ICAzICst
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWwtc2lpODYyMC5jICAgICAgICAgIHwgIDMg
Ky0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyAgICAgfCAg
NyArKy0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5j
IHwgIDcgKystLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjQuYyAgICAgICAg
ICAgICB8ICA0ICstLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyAgICAg
ICAgICAgICB8ICAzICstCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aGM2M2x2ZDEwMjQu
YyAgICAgICAgIHwgIDcgKystLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRz
aTg2LmMgICAgICAgICB8ICA1ICsrLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZw
NDEwLmMgICAgICAgICAgICB8ICA1ICsrLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdl
LmMgICAgICAgICAgICAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKy0KPiA+ICBkcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fbWljLmMgICAgICAgfCAgOCArLS0tLQo+ID4gIGRy
aXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYyAgICAgICAgICAgICB8ICA2ICstLS0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2RzaS5jICAgICAgICAgICAgICAgfCAgMyArLQo+
ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jICAgICAgICAgICB8ICA0ICst
LQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9tYW5hZ2VyLmMgICAgICAgICB8ICA0
ICstLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZWRwL2VkcF9icmlkZ2UuYyAgICAgICAgICB8
ICAzICstCj4gPiAgZHJpdmVycy9ncHUvZHJtL21zbS9oZG1pL2hkbWlfYnJpZGdlLmMgICAgICAg
IHwgIDQgKy0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMgICAgICAg
ICAgIHwgIDUgKystCj4gPiAgZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfZHZvLmMgICAgICAgICAg
ICAgICAgIHwgIDQgKy0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfaGRhLmMgICAgICAg
ICAgICAgICAgIHwgIDMgKy0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmMgICAg
ICAgICAgICAgICAgfCAgMyArLQo+ID4gIGluY2x1ZGUvZHJtL2RybV9icmlkZ2UuaCAgICAgICAg
ICAgICAgICAgICAgICB8IDE1ICsrKysrKystCj4gPiAgMzQgZmlsZXMgY2hhbmdlZCwgMTAwIGlu
c2VydGlvbnMoKyksIDEwMyBkZWxldGlvbnMoLSkKPiA+IAo+IAo+IENhbiB5b3UgY2hlY2sgaXQg
ZG9lc24ndCBjb2xsaWRlcyB3aXRoIEJvcmlzIDEtNyBvZiAiZHJtOiBBZGQgc3VwcG9ydCBmb3Ig
YnVzLWZvcm1hdCBuZWdvdGlhdGlvbiIgcGF0Y2hlcyBoZSBqdXN0IHB1c2hlZCBvbiBkcm0tbWlz
Yy1uZXh0ID8KClRoYW5rcyBmb3IgdGhlIGhlYWRzLXVwLiBUaGVyZSdzIG5vIHRlY2huaWNhbCBj
b25mbGljdCBidXQgdGhlIGJ1aWxkIGZhaWxzLgpJJ2xsIGZpeCBpdCBmb3IgdjMgYWZ0ZXIgSSBn
ZXQgdGhlIGRlLW1pZGxheWVyaW5nIG9mIGRybV9icmlkZ2UgZG9uZQooc2VlIGh0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8zNDM2NDMvP3Nlcmllcz03MDQzMiZyZXY9MSBm
b3IKY29udGV4dCkgYW5kIHRoZSBzL2JyaWRnZS0+ZGV2L2JyaWRnZS0+ZHJtLyBwYXRjaCBtZXJn
ZWQKKGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8zNDM4MjQvKS4KCj4g
Cj4gTmVpbAo+IAoKLS0gCk1paGFpbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
