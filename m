Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A3ADA9D3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 12:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1326EA41;
	Thu, 17 Oct 2019 10:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40040.outbound.protection.outlook.com [40.107.4.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2006EA41
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 10:21:17 +0000 (UTC)
Received: from DB7PR08CA0007.eurprd08.prod.outlook.com (2603:10a6:5:16::20) by
 VI1PR0801MB1661.eurprd08.prod.outlook.com (2603:10a6:800:56::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.22; Thu, 17 Oct
 2019 10:21:13 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::207) by DB7PR08CA0007.outlook.office365.com
 (2603:10a6:5:16::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.22 via Frontend
 Transport; Thu, 17 Oct 2019 10:21:13 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Thu, 17 Oct 2019 10:21:11 +0000
Received: ("Tessian outbound 851a1162fca7:v33");
 Thu, 17 Oct 2019 10:21:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6da32e8c48f5518c
X-CR-MTA-TID: 64aa7808
Received: from 05b673008291.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.6.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BD2A9E65-89EA-4F96-8E41-C1A81B57481D.1; 
 Thu, 17 Oct 2019 10:21:05 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2051.outbound.protection.outlook.com [104.47.6.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 05b673008291.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 17 Oct 2019 10:21:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mRMcULz8ceahvCO4TaRUgPsOPpypWEVRbQwK4nO3balanlnEbjZdeW3+Ez+jSJe7ugnP6G3r/tYV0j7WD1uadnNVEzIDbppUqUi0V+wPQvZnxGLHe4jKCTDa/r69a7CXjpJtH2wxDN12LUUx0IgaztcMmHEgASqX3b1ARcWts4pCml1d7Ar+qy9GHkXvfZ9AybU0Eyr30cyOUQlA79QZA3qoSw3L/qNoJj4HyAr4ztG6iCfQUWAJ1ctvRVZpNjCE4otjd2ClX7pds6I5sYoSr85u2rKU6xwd2d1tsqWBE/lcAv7crH3Zj6DT5vV6rNBf4tTsI29vhhStzCmViuHXmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHOCG4g14g9I82Tgawbo8Uuxf673x4zWA7hdx+/rFe0=;
 b=UZlwrv61r8+7AbarAEIxvHy9A3yexPw5oNXLzaxjBU6k0TqAlRgZXYscM8+3rsT1+uvk6yKCznvd61IZTlHjYvq22O8TVXRi40toAWpRmCEG2vQFZXtQYiBrYxNRKGdEE3zOWu6uM8n8PtrasuCbYPS9FsCS5xpsnLtbJk/O4MN/l+v7c13BDlYAzPkTPR62mCQlDgXN5PK0uAJnvXT1+S/BQEUs+E82l/p/tzLoyjYdjLRfu59HawWDUDbVA0vV3PxV6aqSdP1eM3cfyAu4s2L+eKADWcdyxpcGDrGjcAAvHB0v3STtPzdGjl8dFk8rZGFlY+yx7cRZMMWjwF5djw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4751.eurprd08.prod.outlook.com (10.255.113.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Thu, 17 Oct 2019 10:21:03 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 10:21:03 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Brian Starkey <Brian.Starkey@arm.com>
Subject: Re: [RFC,3/3] drm/komeda: Allow non-component drm_bridge only
 endpoints
Thread-Topic: [RFC,3/3] drm/komeda: Allow non-component drm_bridge only
 endpoints
Thread-Index: AQHVfmX7+sBzYHhR8EiYyRUjNjETp6dddmWAgAAIg4CAALRsAIAAV3gAgAAhhoA=
Date: Thu, 17 Oct 2019 10:21:03 +0000
Message-ID: <20191017102055.GA8308@jamwan02-TSP300>
References: <20191004143418.53039-4-mihail.atanassov@arm.com>
 <20191009055407.GA3082@jamwan02-TSP300> <5390495.Gzyn2rW8Nj@e123338-lin>
 <20191016162206.u2yo37rtqwou4oep@DESKTOP-E1NTVVP.localdomain>
 <20191017030752.GA3109@jamwan02-TSP300>
 <20191017082043.bpiuvfr3r4jngxtu@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20191017082043.bpiuvfr3r4jngxtu@DESKTOP-E1NTVVP.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0182.apcprd02.prod.outlook.com
 (2603:1096:201:21::18) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a02a1032-b8a0-4479-47f0-08d752ebbb96
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4751:|VE1PR08MB4751:|VI1PR0801MB1661:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB1661B2ED25CE61BDB58A3AFBB36D0@VI1PR0801MB1661.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 01930B2BA8
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(199004)(189003)(66066001)(52116002)(476003)(102836004)(6862004)(11346002)(71190400001)(446003)(256004)(26005)(71200400001)(1076003)(186003)(386003)(66446008)(66476007)(14444005)(64756008)(316002)(55236004)(6506007)(66946007)(3846002)(4326008)(66556008)(86362001)(6512007)(9686003)(6116002)(76176011)(14454004)(5660300002)(25786009)(8676002)(2906002)(229853002)(81156014)(8936002)(7736002)(6636002)(305945005)(486006)(6486002)(54906003)(99286004)(6246003)(58126008)(81166006)(33656002)(478600001)(6436002)(33716001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4751;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: urF/W+RrRCjgIXqkHPR4S2PXu4lziqeS/k23ViucitRQ79KqLjqKzetthDuaNgIZdcu1PHhZsmy3NIDHermIwdWYUsVpF9Uu8icXjNrtd/DmRfqWYoL5ZpjTjeljyvJ5fCmeNz0O8S+4yP3VrtDhEFDFRdZQn3Mi7+hze1rwoqUy+LasTc825Zezsrk6lOSl++3mlRTpBofIzf/z6B16s0ieBsJAHsibwWlhYXfEdlKyXCeTsmuWrir2ynn9eqv7P0X3bnnu/4sud+fIMnBwnYFB8rQ2QgtC/qGv8h5+lJ1OJyElq4NZyKIvgl1/qo/JV/QE7ZtIw3UZJ56YD9My5sAEZLzvujQThOJ0doF1bVmbj8R/Zqn/Q5YdRJPz+JoS9uZXyf1PEtsnQKy6EzIVa+4FmDsn8CLV8EbeFpjW7Mk=
Content-ID: <9E816EBE59B03C4C9685BB5552ED9FBF@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4751
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(136003)(396003)(346002)(376002)(199004)(189003)(7736002)(476003)(107886003)(2906002)(76130400001)(47776003)(33716001)(6636002)(126002)(11346002)(446003)(5660300002)(58126008)(63350400001)(46406003)(305945005)(70586007)(14444005)(486006)(54906003)(70206006)(66066001)(6486002)(14454004)(478600001)(8746002)(6246003)(36906005)(26826003)(229853002)(8936002)(102836004)(4326008)(386003)(86362001)(3846002)(23726003)(6862004)(316002)(356004)(76176011)(6116002)(50466002)(99286004)(97756001)(22756006)(6512007)(9686003)(186003)(6506007)(8676002)(25786009)(81156014)(1076003)(81166006)(33656002)(26005)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0801MB1661;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: ae12bc4e-ea00-44a1-5cab-08d752ebb68f
NoDisclaimer: True
X-Forefront-PRVS: 01930B2BA8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BPU/ogwRRRdK2srizl4gjNeLa4chqlyk8Z7/y/EmKZD0hSbyf92CGhthB6RUAi4a21hO138vUuBljLC3ZX+HpH1mMyJ2k2gmhh30llt+zFCiardsWCPc830+kdOeQpo1vmWdHAzJNHri9WGQGkLiVr9V5Xt22/Ac3i/u3mQa+CEIwj9QE6Wmy7172HqYh7Z7ZbNBneZioU0sF9wZdD2KyjOT+ZA2nLaazhu4x0GdX0+NU7VTfsIi3orq/w0F4Z6GDk7Wv1FGAo2Rg48fKrQHrnsTf9YA5vrJzM9uljhDJ48Af/KZ/vi/dYOZKm2Nym/1EwAMwk3A8/lPhGxnRpc2S1M5Cxz+urMQ3RaRIQuarnWkQNcHpdify/hThKDKffcEMX/MQ6KY1vpL+yoZm/iWUHt46MFrDx4fwZ3lSbJt90k=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 10:21:11.2974 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a02a1032-b8a0-4479-47f0-08d752ebbb96
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1661
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHOCG4g14g9I82Tgawbo8Uuxf673x4zWA7hdx+/rFe0=;
 b=Xz2aNYzobNJDYdN6bERQ+moPCyBw815OVan/SDufJ1aNa2IMaeYXVx/COOCKqJYahoaClOZc04EslUVJpy0xzbuMyhmgCYpQ0Qd39+ye2ssUf0EnIUyIt3sf04Zm3dJUoNiDwc7Aq/52+xr5ACFyJrxNDAveuFZ+fjCqAiLQKmw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHOCG4g14g9I82Tgawbo8Uuxf673x4zWA7hdx+/rFe0=;
 b=Xz2aNYzobNJDYdN6bERQ+moPCyBw815OVan/SDufJ1aNa2IMaeYXVx/COOCKqJYahoaClOZc04EslUVJpy0xzbuMyhmgCYpQ0Qd39+ye2ssUf0EnIUyIt3sf04Zm3dJUoNiDwc7Aq/52+xr5ACFyJrxNDAveuFZ+fjCqAiLQKmw=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=none
 action=none header.from=arm.com;
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
Cc: nd <nd@arm.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Russell King <linux@armlinux.org.uk>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMDg6MjA6NTZBTSArMDAwMCwgQnJpYW4gU3RhcmtleSB3
cm90ZToKPiBPbiBUaHUsIE9jdCAxNywgMjAxOSBhdCAwMzowNzo1OUFNICswMDAwLCBqYW1lcyBx
aWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiA+IE9uIFdlZCwgT2N0IDE2
LCAyMDE5IGF0IDA0OjIyOjA3UE0gKzAwMDAsIEJyaWFuIFN0YXJrZXkgd3JvdGU6Cj4gPiA+IAo+
ID4gPiBJZiBKYW1lcyBpcyBzdHJvbmdseSBhZ2FpbnN0IG1lcmdpbmcgdGhpcywgbWF5YmUgd2Ug
anVzdCBzd2FwCj4gPiA+IHdob2xlc2FsZSB0byBicmlkZ2U/IEJ1dCBmb3IgbWUsIHRoZSBwcmFn
bWF0aWMgYXBwcm9hY2ggd291bGQgYmUgdGhpcwo+ID4gPiBzdG9wLWdhcC4KPiA+ID4KPiA+IAo+
ID4gVGhpcyBpcyBhIGdvb2QgaWRlYSwgYW5kIEkgdm90ZSArVUxPTkdfTUFYIDopCj4gPiAKPiA+
IGFuZCBJIGFsc28gY2hlY2tlZCB0ZGE5OTh4IGRyaXZlciwgaXQgc3VwcG9ydHMgYnJpZGdlLiBz
byBzd2FwIHRoZQo+ID4gd2hvbGVzYWxlIHRvIGJyaWdlIGlzIHBlcmZlY3QuIDopCj4gPiAKPiAK
PiBXZWxsLCBhcyBNaWhhaWwgd3JvdGUsIGl0J3MgZGVmaW5pdGVseSBub3QgcGVyZmVjdC4KPiAK
PiBUb2RheSwgaWYgeW91IHJtbW9kIHRkYTk5OHggd2l0aCB0aGUgRFBVIGRyaXZlciBzdGlsbCBs
b2FkZWQsCj4gZXZlcnl0aGluZyB3aWxsIGJlIHVuYm91bmQgZ3JhY2VmdWxseS4KPiAKPiBJZiB3
ZSBzd2FwIHRvIGJyaWRnZSwgdGhlbiBybW1vZCdpbmcgdGRhOTk4eCAob3IgYW55IG90aGVyIGJy
aWRnZQo+IGRyaXZlciB0aGUgRFBVIGlzIHVzaW5nKSB3aXRoIHRoZSBEUFUgZHJpdmVyIHN0aWxs
IGxvYWRlZCB3aWxsIHJlc3VsdAo+IGluIGEgY3Jhc2guCgpJIGhhdmVuJ3QgcmVhZCB0aGUgYnJp
ZGdlIGNvZGUsIGJ1dCBzZWVtcyB0aGlzIGlzIGEgYnVnIG9mIGRybV9icmlkZ2UsCnNpbmNlIGlm
IHRoZSBicmlkZ2UgaXMgc3RpbGwgaW4gdXNpbmcgYnkgb3RoZXJzLCB0aGUgcm1tb2Qgc2hvdWxk
IGZhaWwKCkFuZCBwZXJzb25hbGx5IG9waW5pb24sIGlmIHRoZSBicmlkZ2UgZG9lc24ndCBoYW5k
bGUgdGhlIGRlcGVuZGVuY2UuCmZvciB1czoKCi0gYWRkIHN1Y2ggc3VwcG9ydCB0byBicmlkZ2UK
ICBvcgotIGp1c3QgZG8gdGhlIGluc21vZC9ybW1vZCBpbiBjb3JyZWN0IG9yZGVyLgoKPiBTbywg
dGhlcmUgcmVhbGx5IGFyZSBwcm9wZXIgYmVuZWZpdHMgdG8gc3RpY2tpbmcgd2l0aCB0aGUgY29t
cG9uZW50Cj4gY29kZSBmb3IgdGRhOTk4eCwgd2hpY2ggaXMgd2h5IEknZCBsaWtlIHRvIHVuZGVy
c3RhbmQgd2h5IHlvdSdyZSBzbwo+IGFnYWluc3QgdGhpcyBwYXRjaD8KPgoKVGhpcyBjaGFuZ2Ug
aGFuZGxlcyB0d28gZGlmZmVyZW50IGNvbm5lY3RvcnMgaW4ga29tZWRhIGludGVybmFsbHksIGNv
bXBhcmUKd2l0aCBvbmUgaW50ZXJmYWNlLCBpdCBpbmNyZWFzZXMgdGhlIGNvbXBsZXhpdHksIG1v
cmUgcmlzayBvZiBidWcgYW5kIG1vcmUKY29zdCBvZiBtYWludGFpbmFuY2UuCgpTbyBteSBzdWdn
ZXN0aW9uIGlzIGtlZXBpbmcgb24gb25lIHNpbmdsZSBpbnRlcmZhY2UgaW4ga29tZWRhLCBubwpt
YXR0ZXIgaXQgaXMgYnJpZGdlIG9yIGNvbXBvbmVudCwgYnV0IEknZCBsaWtlIGl0IG9ubHkgb25l
LCBidXQgbm90CnRoZW0gYm90aCBpbiBrb21lZGEuCgpUaGFua3MKSmFtZXMKCj4gVGhhbmtzLAo+
IC1CcmlhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
