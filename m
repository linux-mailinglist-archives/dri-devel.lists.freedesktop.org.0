Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4662DA426
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 05:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A4289E35;
	Thu, 17 Oct 2019 03:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00051.outbound.protection.outlook.com [40.107.0.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F373189E35
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 03:08:13 +0000 (UTC)
Received: from DB7PR08CA0031.eurprd08.prod.outlook.com (2603:10a6:5:16::44) by
 AM6PR08MB4311.eurprd08.prod.outlook.com (2603:10a6:20b:b4::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 17 Oct 2019 03:08:09 +0000
Received: from AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by DB7PR08CA0031.outlook.office365.com
 (2603:10a6:5:16::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.18 via Frontend
 Transport; Thu, 17 Oct 2019 03:08:09 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT050.mail.protection.outlook.com (10.152.17.47) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15 via Frontend Transport; Thu, 17 Oct 2019 03:08:07 +0000
Received: ("Tessian outbound 6481c7fa5a3c:v33");
 Thu, 17 Oct 2019 03:08:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1d455d727c1ca7d6
X-CR-MTA-TID: 64aa7808
Received: from 14a2a1833df7.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.57]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E637B13B-7FA7-41DA-98BD-3E76CF9EB6C8.1; 
 Thu, 17 Oct 2019 03:08:02 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 14a2a1833df7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Thu, 17 Oct 2019 03:08:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UcFMCLTmcgrnKhRrsDipnCOd61uZ8PGJcdnZXrwEVLazcC9bo9s2T1j1qkRc4ru8/GpxLQlZESo5y2E4j4vxGBp4c0b/NHaK1J3Yo+IMQNwh7vWCZ3UBYNdhjiqwln0HCPVMMYSeEFeG+Hprkcv3r1+zT5/Xign7UkjxWO3aS3yBeZL0Ohgrq9xyWEDNXZTkqfFdlE7PRNEF8eJAhMMb4SUQYFxlVKzCD9WPSgDEmp00sZR32w93ekkkOym4vlQv08ymgIsbSIgoNLL3M9SPWPhynvzYjiWi1qrkYQt7pY40tQ+pCv4t4iCX5l8lugQrp0DUcM9lw0jE5MJ/4PeyLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YK5T9lqaEMmbAY1/p8Kv6ayAzyAhiFFVil3VzbJtgqs=;
 b=kh72TuVqgOYX678z9tY9rdTpTTDkHM7KXeMaAmxWBhp/30ss8DbWnTA7FEhyKC/+Qi61J7FQTbKMtBnXZpCrE8FvHyfU/TNwosOQ0UgvVloWM4FPy0NAtP94/igV7BmC5htG5PR0GZpyN1MSy68Is2+boo2CDOS+AavYLnSZ38i2bDLIrnonIM51xemMEawMvjQ/RrVtyGTcujLtr4bTOECTJRftbF7mYHVu4W5KaLxu6KDLr/JTggVh6hssF+iWNROmMz8/5ym6x/NEDUqL+KeJTpEVS0ohk4jaTeNCZ4eE3A37n8Jwel8HjBSFJzs2hc416OtsmHQIHQBZNWthuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5117.eurprd08.prod.outlook.com (20.179.30.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 17 Oct 2019 03:07:59 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 03:07:59 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Brian Starkey <Brian.Starkey@arm.com>
Subject: Re: [RFC,3/3] drm/komeda: Allow non-component drm_bridge only
 endpoints
Thread-Topic: [RFC,3/3] drm/komeda: Allow non-component drm_bridge only
 endpoints
Thread-Index: AQHVfmX7+sBzYHhR8EiYyRUjNjETp6dddmWAgAAIg4CAALRsAA==
Date: Thu, 17 Oct 2019 03:07:59 +0000
Message-ID: <20191017030752.GA3109@jamwan02-TSP300>
References: <20191004143418.53039-4-mihail.atanassov@arm.com>
 <20191009055407.GA3082@jamwan02-TSP300> <5390495.Gzyn2rW8Nj@e123338-lin>
 <20191016162206.u2yo37rtqwou4oep@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20191016162206.u2yo37rtqwou4oep@DESKTOP-E1NTVVP.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:202:2e::22) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ad7f2614-5bb5-4e12-2805-08d752af3c16
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB5117:|VE1PR08MB5117:|AM6PR08MB4311:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4311F3D5E8138E3196CEAAC0B36D0@AM6PR08MB4311.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 01930B2BA8
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(189003)(199004)(9686003)(8936002)(386003)(6512007)(229853002)(6486002)(6116002)(66946007)(5660300002)(3846002)(52116002)(1076003)(66446008)(64756008)(66556008)(66476007)(6436002)(55236004)(102836004)(76176011)(186003)(478600001)(26005)(6506007)(33656002)(316002)(446003)(11346002)(4326008)(256004)(5024004)(6246003)(476003)(81156014)(14454004)(33716001)(6636002)(2906002)(8676002)(7736002)(71190400001)(71200400001)(486006)(58126008)(66066001)(81166006)(54906003)(99286004)(305945005)(6862004)(25786009)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5117;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: T/Twa6JiLN1M7H1Aoiz1fCb5J9aKLR0tOSZ/uryze05Arc+8SCe/YRFfAHQE9Z32Ag9BRPED0cMxW5RhroI4aEpXVIgKY3qbV3F8jtQTZAVmuC7DFxixobs7Ba6ecj6CWmgylwRuBWf3vInHot4JqgrsCen2njQ9KPx16YcIYHfb1cQzzkRwKRE7Yp7C4eVO3/fJ+EmwalddQEZfChfwXCJCo41ItVblWdPV7wUwopXu30i5mMmkc/U8XKaVHvz8n4hkg1YRbdxCMmJFVwR53qcRB9xFCxrlF1RHfTv+6bDI1VES0BjAF30WLoRx4kabZ3hndGTll9ofdUoRZ2ftfHlAYmPupZIR+dTpB21zi0zD6k0RPDOeTWF98+p86Z6SAaWAPI8eGJ81dlYUqhNJyinyTjaoPypmtPbb5/UpIIA=
Content-ID: <7B18A2B58726BD49AB01AA6B36E63070@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5117
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(376002)(39860400002)(346002)(136003)(189003)(199004)(8746002)(63350400001)(476003)(6862004)(11346002)(186003)(6636002)(26005)(7736002)(305945005)(97756001)(6506007)(9686003)(107886003)(6512007)(33656002)(6246003)(102836004)(336012)(446003)(8936002)(26826003)(2906002)(86362001)(14454004)(386003)(6486002)(4326008)(50466002)(66066001)(478600001)(3846002)(70206006)(70586007)(99286004)(25786009)(486006)(126002)(33716001)(47776003)(8676002)(76176011)(23726003)(76130400001)(1076003)(81166006)(5024004)(6116002)(22756006)(81156014)(229853002)(46406003)(316002)(5660300002)(58126008)(36906005)(54906003)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4311;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c219b026-b6b4-48e7-55f9-08d752af36b3
NoDisclaimer: True
X-Forefront-PRVS: 01930B2BA8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tO+9AbRrIVDpOwk+O87SXRSp8womqIXNgibbEA9iaNqNH+TQYHXgeOls5TsTg0XN7wpOZZX9weZqX+wemE1wym8t5mY3z9J+Dnsiog59/Qzctu06kY0F8BqHWmFIe9DbWdiI9gzS4yAKPtpmBZCA/lVScsQU6bdKwOzxXCNqSe3q9uWuSSxBELt8CPqNHdFrqK4Fm4frCIna8Yp2EiSWpQvSmcJkqHcBEmqLf+ThWIAa3/AjJJxpllx5XbtIp1Zsz9+KpYCFDKE5IkovF569n+QQ57KBPWGxIFYO/IRmu/3faoYIJv8pBud2Dq/U5FxLewWJeTmgtch+DJuiwaK1zlD2rRsT+efScgtpSHOAdaTz8ZvMq3r01Wtr4UwN4yEiZl7MLf8c/KT96m1q/df2X8bJemJIARaB4xi7sLvN4TE=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 03:08:07.6353 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7f2614-5bb5-4e12-2805-08d752af3c16
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4311
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YK5T9lqaEMmbAY1/p8Kv6ayAzyAhiFFVil3VzbJtgqs=;
 b=c6Br0+7XdpUT/5OXSYQeugEPjgDoEMXtT2XMCezoSeNkm3UuZxaiFgnryf3EOVn9Z7qbRTOroDY/Im5YN6cWpkNRcmf0cXEcxfZc6GgwE87j9Vk/iEZ2dwVX4dQGp1jeSD+k80EsRP4RF5quWg9aTmsrl6IDyzgZrpPTLkwFkyI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YK5T9lqaEMmbAY1/p8Kv6ayAzyAhiFFVil3VzbJtgqs=;
 b=c6Br0+7XdpUT/5OXSYQeugEPjgDoEMXtT2XMCezoSeNkm3UuZxaiFgnryf3EOVn9Z7qbRTOroDY/Im5YN6cWpkNRcmf0cXEcxfZc6GgwE87j9Vk/iEZ2dwVX4dQGp1jeSD+k80EsRP4RF5quWg9aTmsrl6IDyzgZrpPTLkwFkyI=
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

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMDQ6MjI6MDdQTSArMDAwMCwgQnJpYW4gU3RhcmtleSB3
cm90ZToKPiBIaSwKPiAKPiBPbiBXZWQsIE9jdCAxNiwgMjAxOSBhdCAwMzo1MTozOVBNICswMDAw
LCBNaWhhaWwgQXRhbmFzc292IHdyb3RlOgo+ID4gSGkgSmFtZXMsCj4gPiAKPiA+IE9uIFdlZG5l
c2RheSwgOSBPY3RvYmVyIDIwMTkgMDY6NTQ6MTUgQlNUIGphbWVzIHFpYW4gd2FuZyAoQXJtIFRl
Y2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gPiBPbiBGcmksIE9jdCAwNCwgMjAxOSBhdCAwMjoz
NDo0MlBNICswMDAwLCBNaWhhaWwgQXRhbmFzc292IHdyb3RlOgo+ID4gPiA+IFRvIHN1cHBvcnQg
dHJhbnNtaXR0ZXJzIG90aGVyIHRoYW4gdGhlIHRkYTk5OHgsIHdlIG5lZWQgdG8gYWxsb3cKPiA+
ID4gPiBub24tY29tcG9uZW50IGZyYW1ld29yayBicmlkZ2VzIHRvIGJlIGF0dGFjaGVkIHRvIGEg
ZHVtbXkgZHJtX2VuY29kZXIgaW4KPiA+ID4gPiBvdXIgZHJpdmVyLgo+ID4gPiA+IAo+ID4gPiA+
IEZvciB0aGUgZXhpc3Rpbmcgc3VwcG9ydGVkIGVuY29kZXIgKHRkYTk5OHgpLCBrZWVwIHRoZSBi
ZWhhdmlvdXIgYXMtaXMsCj4gPiA+ID4gc2luY2UgdGhlcmUncyBubyB3YXkgdG8gdW5iaW5kIGlm
IGEgZHJtX2JyaWRnZSBtb2R1bGUgZ29lcyBhd2F5IHVuZGVyCj4gPiA+ID4gb3VyIGZlZXQuCj4g
PiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTWloYWlsIEF0YW5hc3NvdiA8bWloYWlsLmF0
YW5hc3NvdkBhcm0uY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICAuLi4vZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2Rldi5oICAgfCAgIDUgKwo+ID4gPiA+ICAuLi4vZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5jICAgfCAgNTggKysrKysrLS0KPiA+ID4gPiAg
Li4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYyAgIHwgMTMzICsrKysr
KysrKysrKysrKysrLQo+ID4gPiA+ICAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2ttcy5oICAgfCAgIDUgKwo+ID4gPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDE4NyBpbnNlcnRp
b25zKCspLCAxNCBkZWxldGlvbnMoLSkKPiA+ID4gPiAKPiA+ID4gPiBbc25pcF0KPiA+ID4gPiAg
Cj4gPiA+ID4gK3N0YXRpYyB2b2lkIGtvbWVkYV9lbmNvZGVyX2Rlc3Ryb3koc3RydWN0IGRybV9l
bmNvZGVyICplbmNvZGVyKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKwlkcm1fZW5jb2Rlcl9jbGVhbnVw
KGVuY29kZXIpOwo+ID4gPiA+ICt9Cj4gPiA+ID4gKwo+ID4gPiA+ICtzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRybV9lbmNvZGVyX2Z1bmNzIGtvbWVkYV9kdW1teV9lbmNfZnVuY3MgPSB7Cj4gPiA+ID4g
KwkuZGVzdHJveSA9IGtvbWVkYV9lbmNvZGVyX2Rlc3Ryb3ksCj4gPiA+ID4gK307Cj4gPiA+ID4g
Kwo+ID4gPiA+ICtib29sIGtvbWVkYV9yZW1vdGVfZGV2aWNlX2lzX2NvbXBvbmVudChzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKmxvY2FsLAo+ID4gPiA+ICsJCQkJICAgICAgIHUzMiBwb3J0LCB1MzIgZW5k
cG9pbnQpCj4gPiA+ID4gK3sKPiA+ID4gPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqcmVtb3RlOwo+
ID4gPiA+ICsJY2hhciBjb25zdCAqIGNvbnN0IGNvbXBvbmVudF9kZXZpY2VzW10gPSB7Cj4gPiA+
ID4gKwkJIm54cCx0ZGE5OTh4IiwKPiA+ID4gCj4gPiA+IEkgcmVhbGx5IGRvbid0IHRoaW5rIHB1
dCB0aGlzIGR1bW15X2VuY29kZXIgaW50byBrb21lZGEgaXMgYSBnb29kCj4gPiA+IGlkZWEuCj4g
PiA+IAo+ID4gPiBBbmQgSSBzdWdnZXN0IHRvIHNlcGVyYXRlIHRoaXMgZHVtbXlfZW5jb2RlciB0
byBhIGluZGl2aWR1YWwgbW9kdWxlCj4gPiA+IHdoaWNoIHdpbGwgYnVpbGQgdGhlIGRybV9yaWRn
ZSB0byBhIHN0YW5kYXJkIGRybSBlbmNvZGVyIGFuZCBjb21wb25lbnQKPiA+ID4gYmFzZWQgbW9k
dWxlLCB3aGljaCB3aWxsIGJlIGVuYWJsZSBieSBEVCwgdG90YWxseSB0cmFuc3BhcmVudCBmb3Ig
a29tZWRhLgo+ID4gPiAKPiA+ID4gQlRXOgo+ID4gPiBJIHJlYWxseSBkb24ndCBsaWtlIHN1Y2gg
bG9naWM6IGRpc3Rpbmd1c2ggdGhlIFNZU1RFTSBjb25maWd1cmF0aW9uCj4gPiA+IGJ5IGNoZWNr
IHRoZSBjb25uZWN0ZWQgZGV2aWNlIG5hbWUsIGl0J3MgaGFyZCB0byBtYWludGFpbiBhbmQgY29k
ZQo+ID4gPiBzaGFyaW5nLCBhbmQgdGhhdCdzIHdoeSBOT1cgd2UgaGF2ZSB0aGUgZGV2aWNlLXRy
ZWUuCj4gCj4gSXQncyBub3QgaWRlYWwgdG8gaGF2ZSBzdWNoIHNwZWNpYWwgY2FzZXMsIGZvciBz
dXJlLiBIb3dldmVyLCBJIGRvbid0Cj4gc2VlIHRoaXMgYXBwcm9hY2ggY2F1c2luZyB1cyBhbnkg
aXNzdWVzLiB0ZGE5OTh4IHJlYWxseSBpcyAic3BlY2lhbCIsCj4gYW5kIGFzIGZhciBhcyBJIGNh
biBzZWUgdGhlIGNvZGUgaGVyZSBzY2FsZXMgdG8gb3RoZXIgZGV2aWNlcyBwcmV0dHkKPiBlYXNp
bHkuCj4gCj4gPiAKPiA+ICtDYyBCcmlhbgo+ID4gCj4gPiBJIGRpZG4ndCB0aGluayBEVCBpcyB0
aGUgcmlnaHQgcGxhY2UgZm9yIHBzZXVkby1kZXZpY2VzLgo+IAo+IEkgYWdyZWUuIERUIHNob3Vs
ZCByZXByZXNlbnQgdGhlIEhXLCBub3QgdGhlIHN0cnVjdHVyZSBvZiB0aGUKPiBsaW51eCBrZXJu
ZWwgc3Vic3lzdGVtLgo+IAo+ID4gVGhlIHRkYTk5OHgKPiA+IGxvb2tzIHRvIGJlIGluIGEgc21h
bGwgZ3JvdXAgb2YgZHJpdmVycyB0aGF0IGNvbnRhaW4gZW5jb2RlciArCj4gPiBicmlkZ2UgKyBj
b25uZWN0b3I7IG15IGltcHJlc3Npb24gb2YgdGhlIGN1cnJlbnQgc3RhdGUgb2YgYWZmYWlycyBp
cwo+ID4gdGhhdCB0aGUgZHJtX2VuY29kZXIgdGVuZHMgdG8gbGl2ZSB3aGVyZSB0aGUgQ1JUQyBw
cm92aWRlciBpcyByYXRoZXIKPiA+IHRoYW4gcmVwcmVzZW50aW5nIGEgSFcgZW50aXR5IChoZW5j
ZSB3aHkgZHJtX2JyaWRnZSBiYXNlZCBkcml2ZXJzCj4gPiBleGlzdCBpbiBkcml2ZXJzL2dwdS9k
cm0vYnJpZGdlKS4gU2VlIHRoZSBvdmVydmlldyBET0MgY29tbWVudCBpbgo+ID4gZHJtX2VuY29k
ZXIuYyAoImRyaXZlcnMgYXJlIGZyZWUgdG8gdXNlIFtkcm1fZW5jb2Rlcl0gaG93ZXZlciB0aGV5
Cj4gPiB3aXNoIikuIEkgbWF5IGJlIGNvbXBsZXRlbHkgd3JvbmcsIHNvIHdvdWxkIGFwcHJlY2lh
dGUgc29tZQo+ID4gY29udGV4dCBhbmQgY29tbWVudCBmcm9tIG90aGVycyBvbiB0aGUgQ2MgbGlz
dC4KPiA+IAo+ID4gSW4gYW55IGNhc2UsIGNvbnZlcnRpbmcgYSBkby1ub3RoaW5nIGR1bW15IGVu
Y29kZXIgaW50byBpdHMgb3duCj4gPiBjb21wb25lbnQtbW9kdWxlIHdpbGwgYWRkIGEgbG90IG1v
cmUgYmxvYXQgY29tcGFyZWQgdG8gdGhlIGN1cnJlbnQKPiA+IH4xMCBTTG9DIGltcGxlbWVudGF0
aW9uIG9mIHRoZSBkcm1fZW5jb2Rlci4gcHJvYmUvcmVtb3ZlL2JpbmQvdW5iaW5kLAo+ID4gYSBm
ZXcgZXh0cmEgc3RydWN0cyBoZXJlIGFuZCB0aGVyZSwgeWV0IGFub3RoZXIgb2JqZWN0IGZpbGUs
IERUCj4gPiBiaW5kaW5ncywgZG9jcyBmb3IgdGhlIHNhbWUsIGFuZCBtYWludGFpbmluZyBhbGwg
b2YgdGhhdD8gSXQncyBhIGhhcmQKPiA+IHNlbGwgZm9yIG1lLiBJJ2QgcHJlZmVyIGlmIHdlIHdl
bnQgYWhlYWQgd2l0aCB0aGUgY29kZSBhcy1pcyBhbmQgZml4IGl0Cj4gPiB1cCBsYXRlciBpZiBp
dCByZWFsbHkgcHJvdmVzIHVud2llbGR5IGFuZCB0b28gaGFyZCB0byBtYWludGFpbi4gQ291bGQK
PiA+IHRoaXMgcGF0Y2ggYmUgaW1wcm92ZWQ/IFN1cmUhIENhbiB3ZSBpbXByb3ZlIGl0IGluIGZv
bGxvdy11cCB3b3JrCj4gPiB0aG91Z2gsIGFzIEkgdGhpbmsgdGhpcyBpcyB2YWx1YWJsZSBlbm91
Z2ggb24gaXRzIG93biB3aXRob3V0IGFueSBtYWpvcgo+ID4gZHJhd2JhY2tzPwo+ID4gCj4gCj4g
RXZlbiBpZiB3ZSBpbXBsZW1lbnRlZCBhIHNlcGFyYXRlIGNvbXBvbmVudCBlbmNvZGVyLCBhcyBm
YXIgYXMgSSBjYW4KPiB0ZWxsIHRoZXJlJ3Mgbm8gd2F5IHRvIHVzZSBpdCB3aXRob3V0IGVpdGhl
cjoKPiAKPiBhKSBzdGlja2luZyBpdCBpbiBEVAo+IGIpIGludm9raW5nIGl0IGZyb20ga29tZWRh
IGJhc2VkIG9uIGEgIm9mX2RldmljZV9pc19jb21wYXRpYmxlIiBsaXN0Cj4gCj4gSU1PIGEpIGlz
bid0IGFjY2VwdGFibGUsIGFuZCBiKSBkb2Vzbid0IGhhdmUgYW55IGFkdmFudGFnZXMgb3ZlciB0
aGlzCj4gYXBwcm9hY2guCj4gCj4gPiBBcyBwZXIgbXkgY292ZXIgbGV0dGVyLCBpbiBhbiBpZGVh
bCB3b3JsZCB3ZSdkIGhhdmUgdGhlIGVuY29kZXIgbG9jYWxseQo+ID4gYW5kIGRvIGRybV9icmlk
Z2VfYXR0YWNoKCkgZXZlbiBmb3IgdGRhOTk4eCwgYnV0IHRoZSBsaWZldGltZSBpc3N1ZXMKPiA+
IGFyb3VuZCBicmlkZ2VzIGluc2lkZSBtb2R1bGVzIG1lYW4gdGhhdCBkb2luZyB0aGF0IG5vdyBp
cyBhIGJpdCBvZiBhCj4gPiBzdGVwIGJhY2sgZm9yIHRoaXMgc3BlY2lmaWMgY2FzZS4KPiA+IAo+
IAo+IFllYWgsIG15IGZlZWxpbmcgaXMgdGhhdCBiZWluZyBhYmxlIHRvIGtlZXAgdGRhOTk4eCBh
cyBhIGNvbXBvbmVudAo+IChmb3IgdGhlIHN1cGVyaW9yIGJpbmQvdW5iaW5kIGJlaGF2aW91cikg
aXMgd29ydGggdGhlIHNsaWdodCB1Z2xpbmVzcywKPiBhdCBsZWFzdCB1bnRpbCBicmlkZ2VzIGdl
dCB0aGUgc2FtZSBmdW5jdGlvbmFsaXR5Lgo+IAo+IElmIEphbWVzIGlzIHN0cm9uZ2x5IGFnYWlu
c3QgbWVyZ2luZyB0aGlzLCBtYXliZSB3ZSBqdXN0IHN3YXAKPiB3aG9sZXNhbGUgdG8gYnJpZGdl
PyBCdXQgZm9yIG1lLCB0aGUgcHJhZ21hdGljIGFwcHJvYWNoIHdvdWxkIGJlIHRoaXMKPiBzdG9w
LWdhcC4KPgoKVGhpcyBpcyBhIGdvb2QgaWRlYSwgYW5kIEkgdm90ZSArVUxPTkdfTUFYIDopCgph
bmQgSSBhbHNvIGNoZWNrZWQgdGRhOTk4eCBkcml2ZXIsIGl0IHN1cHBvcnRzIGJyaWRnZS4gc28g
c3dhcCB0aGUKd2hvbGVzYWxlIHRvIGJyaWdlIGlzIHBlcmZlY3QuIDopCgpUaGFua3MKSmFtZXMu
Cgo+IENoZWVycywKPiAtQnJpYW4KPiAKPiA+ID4gCj4gPiA+IFRoYW5rcwo+ID4gPiBKYW1lcwo+
ID4gPiAKPiA+ID4gPiBbc25pcF0KPiA+ID4gCj4gPiAKPiA+IC0tIAo+ID4gTWloYWlsCj4gPiAK
PiA+IAo+ID4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
