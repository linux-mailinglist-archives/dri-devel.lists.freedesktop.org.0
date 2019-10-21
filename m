Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D0CDE82D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 11:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8129E89BAF;
	Mon, 21 Oct 2019 09:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140047.outbound.protection.outlook.com [40.107.14.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2436589BAF
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 09:36:10 +0000 (UTC)
Received: from VI1PR08CA0199.eurprd08.prod.outlook.com (2603:10a6:800:d2::29)
 by AM0PR08MB5202.eurprd08.prod.outlook.com (2603:10a6:208:166::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.20; Mon, 21 Oct
 2019 09:36:04 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::207) by VI1PR08CA0199.outlook.office365.com
 (2603:10a6:800:d2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2367.21 via Frontend
 Transport; Mon, 21 Oct 2019 09:36:04 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 21 Oct 2019 09:36:02 +0000
Received: ("Tessian outbound e4042aced47b:v33");
 Mon, 21 Oct 2019 09:35:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bf1f4b46523fda7b
X-CR-MTA-TID: 64aa7808
Received: from e9272839d8bd.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.8.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A72AB2B4-4951-4FBA-A50E-3435E7CAC6AB.1; 
 Mon, 21 Oct 2019 09:35:48 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2056.outbound.protection.outlook.com [104.47.8.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e9272839d8bd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Oct 2019 09:35:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=abzsq8HoMVWdPo2jRUdmRNmqUMAk4EUAbnEeMbQ5sw2AjamK3m3Av/tD17uMyltD5WERT4Ju2edQU3t2Y5t+KauveyzdEUm9+Jcgar/aokfY2Qkh13INUa8WbQELcOW6b5iqNzCZJEOdgvUOSmMAYfZ4fsR++MhdcOLbE11blEYnZd7FEKCNMeW9eCe5VeWen/NnLrsVjnX2cQxYsxn09emFNvxt8BSUojCU+A7fHic3nHwlSlyuH489Ueg6fNNC7JoKBySMZPoUbC4zngD5+4gxBmMFlvRsnAw4rT4iSrFKq0eS14sGjnhTePU5IIpbDj1ajB9k1a8oBDC+QwOisA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rAK0qrWsQJfVzaeV5IOCPL0Lc3OpotsBHL35RbbrTk=;
 b=Ry0Z8NkMTohuN+Z8xwWLyzIWr26iwwA4/05rAZH2yirItAf/gLZeG+LCz/uzrpRLC+DAoFpDZgwB4mLHRZtbobmkkUUljGRe6pzVVJOehCa3s1oqtdBNxTbvB1TghfkOVES1wDwAaF5eOe4U/FHffpt+tMobndgtyV6X34K1tIjaHCNE6rcr8v/NokfcmNsuIQdzYBzgUReHE4lg5DQFvXz+UHgHhGHLYZ32zWBNyalg5OaV3a0kLWkBFUXwtFplIqWfPtCLNOime1ixU1R+FMMyw/EwEnl8zfDvFGa7op4MSo52oTH6eQOZoicxjib8wNYq+9mDLi1PCbG2jSOC9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB3461.eurprd08.prod.outlook.com (20.177.113.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Mon, 21 Oct 2019 09:35:47 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a%5]) with mapi id 15.20.2347.029; Mon, 21 Oct 2019
 09:35:47 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v12 1/5] dma-buf: Add dma-buf heaps framework
Thread-Topic: [PATCH v12 1/5] dma-buf: Add dma-buf heaps framework
Thread-Index: AQHVhXQuL0D7Z4fi0UChemDv0BA9l6dgQKQAgAB3rACABCKcAA==
Date: Mon, 21 Oct 2019 09:35:47 +0000
Message-ID: <20191021093546.m5hgpjadtpu7d4km@DESKTOP-E1NTVVP.localdomain>
References: <20191018052323.21659-1-john.stultz@linaro.org>
 <20191018052323.21659-2-john.stultz@linaro.org>
 <20191018111832.o7wx3x54jm3ic6cq@DESKTOP-E1NTVVP.localdomain>
 <CALAqxLUVLP0ujB0SHyWHMncRMHkBvVj1+CpBgGUD8Xg3RexQ8w@mail.gmail.com>
In-Reply-To: <CALAqxLUVLP0ujB0SHyWHMncRMHkBvVj1+CpBgGUD8Xg3RexQ8w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.51]
x-clientproxiedby: LNXP265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::23) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b59a0315-c8f1-4ff3-a8a9-08d7560a16c2
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM6PR08MB3461:|AM6PR08MB3461:|AM0PR08MB5202:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB5202BFAFD7AC1F9F43A4295FF0690@AM0PR08MB5202.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 0197AFBD92
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(199004)(189003)(26005)(53546011)(186003)(44832011)(99286004)(446003)(52116002)(76176011)(6506007)(476003)(386003)(102836004)(486006)(14454004)(25786009)(11346002)(86362001)(478600001)(6916009)(7416002)(7736002)(305945005)(2906002)(3846002)(6116002)(6436002)(5660300002)(9686003)(6246003)(6512007)(71200400001)(71190400001)(6486002)(66556008)(66446008)(58126008)(316002)(54906003)(4326008)(66066001)(14444005)(256004)(1076003)(81166006)(81156014)(8676002)(66946007)(66476007)(8936002)(229853002)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3461;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: rV/hhwpAN/K0cl9qaj4ztqsuPxt6ReqFp2cAgM2GOOyTbcXD6/OVZ1MgxVa0XUzQQLwFLTWSkw9PTi26m/NPxp1MZd+zn85BX5+4+kO9oeSBBgf6l54O3J7t+V91I4ChG7DIKYv9a+CwFTS6481xl/FR4tAR5DxxW54Qc5j2zChqYp3I2XQ5bsJDru0jeAjzQLTSENFYc/YHu7D2nIB79Stl40RN0ksnYiu0AvrThGGa29168QxKjJ9mEDHnOpm4enbtRfpzlBhtb1j72SCmq5HN5jDC7lCRL+OOuJHHx2OZPyBmRzf0IpM69OO7USIs4SdwdStWWY1ySDxK46xqHCikixsYodfparcBQQ58B9if6ZmEX4G4JlbLoWDIr1bg91szNN40SZC1LAH2rh6wPwyVfPHhxWd05JSP3nNSNJ825i0kYRvUdlPRdv496Rc7
Content-ID: <CBF6FB093390EE4A8C2F9994C62124D3@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3461
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(346002)(136003)(199004)(189003)(46406003)(47776003)(97756001)(81166006)(8746002)(6862004)(5660300002)(6486002)(9686003)(6512007)(6246003)(229853002)(478600001)(50466002)(8936002)(25786009)(8676002)(14454004)(66066001)(4326008)(81156014)(26826003)(86362001)(70206006)(70586007)(446003)(336012)(11346002)(316002)(53546011)(26005)(6506007)(126002)(476003)(63350400001)(1076003)(356004)(54906003)(186003)(386003)(14444005)(2906002)(23726003)(6116002)(3846002)(76176011)(486006)(22756006)(102836004)(99286004)(7736002)(305945005)(76130400001)(58126008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB5202;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: f30ad39a-47bf-4626-b00e-08d7560a0d50
NoDisclaimer: True
X-Forefront-PRVS: 0197AFBD92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0AaRQNOuBtFHVVdVsNM9J3p5O+OOZpu3Me+4BTDzAfv+P4Eg0hP1sjJq5GBR3qdMyszQNamnMpmD83i23V/3L4u6mijppktGccMGF6VJMdISaHtKud4fLC8bVuEFHRgF+iHZHEj2wPME6J4qPVn3wN9SBbE4vJSIMvV+XWdMzgLVeOIb759y+6rNAKKpSzm6AfBbZQaEFuLozwl7t1FUjth5RCZmjbLammE7ETFrFTw/b7fXxaxjl77kAES1GDvgLbX5yI0QvD8gBixMJFumyy/g1z05XUTxlwRlB2k37VgXHNa35q9Fmo6vAKHrKoBWWe3MCC6ylLYTyp/zrDHGmH9a4KLRS9L+5PxXRgYzYqFdNMGa16kfJR1N8R/echi3yT4HqyzmALcBOYNGN/4pa/gLjVr2mn7C03YNStY2/ihccfcrTmxZjVlCMGineXLV
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2019 09:36:02.7251 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b59a0315-c8f1-4ff3-a8a9-08d7560a16c2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5202
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rAK0qrWsQJfVzaeV5IOCPL0Lc3OpotsBHL35RbbrTk=;
 b=DH/Ov/JbGdxj430612TQuf+JLFya30EhGzcT2oPKXgdgAB1McE9K4FMYo+QGSGJgPGNU3D+UttICB+sSgYuqEFrg6nV+AgjCkcDpNYdUDtrgifHDzHb2zOH+F0mP2SaIXCgEI9dTI+B0NFlnwLAQ6HYFIu1Hg/Gmdpk5ARmZ0kQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rAK0qrWsQJfVzaeV5IOCPL0Lc3OpotsBHL35RbbrTk=;
 b=DH/Ov/JbGdxj430612TQuf+JLFya30EhGzcT2oPKXgdgAB1McE9K4FMYo+QGSGJgPGNU3D+UttICB+sSgYuqEFrg6nV+AgjCkcDpNYdUDtrgifHDzHb2zOH+F0mP2SaIXCgEI9dTI+B0NFlnwLAQ6HYFIu1Hg/Gmdpk5ARmZ0kQ=
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
Cc: Hillf Danton <hdanton@sina.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F. Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 nd <nd@arm.com>, Alistair Strachan <astrachan@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMTE6MjY6NTJBTSAtMDcwMCwgSm9obiBTdHVsdHogd3Jv
dGU6Cj4gT24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgNDoxOCBBTSBCcmlhbiBTdGFya2V5IDxCcmlh
bi5TdGFya2V5QGFybS5jb20+IHdyb3RlOgo+ID4gT24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMDU6
MjM6MTlBTSArMDAwMCwgSm9obiBTdHVsdHogd3JvdGU6Cj4gPgo+ID4gQXMgaW4gdjM6Cj4gPgo+
ID4gICogQXZvaWQgRVhQT1JUX1NZTUJPTCB1bnRpbCB3ZSBmaW5hbGl6ZSBtb2R1bGVzIChzdWdn
ZXN0ZWQgYnkKPiA+ICAgIEJyaWFuKQo+IAo+IEhlaC4gSSBndWVzcyBpdCBoYXMgYmVlbiBhd2hp
bGUuICA6KQo+IAo+ID4gRGlkIHNvbWV0aGluZyBjaGFuZ2UgaW4gdGhhdCByZWdhcmQ/IEkgc3Rp
bGwgdGhpbmsgbGV0dGluZyBtb2R1bGVzCj4gPiByZWdpc3RlciBoZWFwcyB3aXRob3V0IGEgd2F5
IHRvIHJlbW92ZSB0aGVtIGlzIGEgcmVjaXBlIGZvciBpc3N1ZXMuCj4gCj4gU28geWVhLCBpbiBy
ZWNlbnQgbW9udGhzLCB3b3JrIGFyb3VuZCBBbmRyb2lkIHdpdGggdGhlaXIgR0tJIGVmZm9ydAo+
IGhhcyBtYWRlIGl0IG5lY2Vzc2FyeSBmb3IgSU9OIGhlYXBzIHRvIGJlIGxvYWRhYmxlIGZyb20g
bW9kdWxlcy4gSSBoYWQKPiBzb21lIHBhdGNoZXMgaW4gV0lQIHRyZWUgdG8gZW5hYmxlIHRoaXMs
IGFuZCBpbiB0aGUgcmV3b3JrIEkgZGlkCj4geWVzdGVyZGF5IGZvciB0aGUgQ01BIG1vZHVsZSB0
cml2aWFsbHkgY29sbGlkZWQgd2l0aCBwYXJ0cywgYW5kCj4gZm9yZ2V0dGluZyB0aGUgZGlzY3Vz
c2lvbiBiYWNrIGluIHYzLCBJIGZpZ3VyZWQgSSdkIGp1c3QgZm9sZCB0aG9zZQo+IGJpdHMgaW4g
YmVmb3JlIEkgcmVzdWJtaXR0ZWQgZm9yIHYxMi4KCkFoIHllcywgSSBjYW4gc2VlIHRoYXQgd291
bGQgYmUgbmVlZGVkLgoKPiAKPiBJZiBpdCdzIGFuIGlzc3VlLCBJIGNhbiBwdWxsIGl0IG91dCwg
YnV0IEknbSBnb2luZyB0byBiZSBzdWJtaXR0aW5nCj4gbW9kdWxlIGVuYWJsZW1lbnQgZm9yIHJl
dmlldyBhcyBzb29uIGFzIHRoZSBjb3JlIGJpdHMgYXJlIHF1ZXVlZCwgYXMKPiBpdHMgZ29pbmcg
dG8gYmUgaW1wb3J0YW50IHRvIHN1cHBvcnQgZm9yIEFuZHJvaWQgdG8gc3dpdGNoIHRvIHRoaXMK
PiBmcm9tIElPTi4KPiAKCkkgZG9uJ3Qga25vdyBob3cgdG8gZGVjaWRlIGlmIGl0J3MgYW4gaXNz
dWUuIE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdAppZiB5b3Ugcm1tb2Qgc29tZXRoaW5nIHdoaWNo
IGhhcyBleHBvcnRlZCBidWZmZXJzLCB2YXJpb3VzIEJhZCBUaGluZ3MKbWlnaHQgaGFwcGVuOyBJ
IGJlbGlldmUgaW5jbHVkaW5nIGRhdGEgbGVha3MsIGNvcnJ1cHRpb24gb3IgY3Jhc2hpbmcKdGhl
IGtlcm5lbC4gVGhlcmUncyBwcm9iYWJseSBwbGVudHkgb2Ygc2NvcGUgZm9yIHRoYXQgd2l0aCBk
bWEtYnVmCmV4cG9ydGVycyBhbHJlYWR5LCBzbyBpdCdzIG5vdCBleGFjdGx5ICJuZXciIGJ1dCBp
dCBpcyBhIGJpdAp1bmZvcnR1bmF0ZS4KCklmICJwZW9wbGUiIGFyZSBPSyB3aXRoIGFkZGluZyBu
ZXcgY29kZSB3aGljaCBoYXMgdGhlIHNhbWUgaXNzdWUsIHRoZW4KSSdtIG5vdCBnb2luZyB0byBt
YWtlIGFueSBtb3JlIG9mIGEgZnVzcywgYmVjYXVzZSBwZXJmZWN0aW9uIGlzIHRoZQplbmVteSBv
ZiBwcm9ncmVzcy4gUGVyaGFwcyBhbiBvYnZpb3VzIGNvbW1lbnQgcG9pbnRpbmcgb3V0IHRoZSBp
c3N1ZQp3b3VsZCBiZSBwcnVkZW50LCB0aG91Z2ggLSBhcyBhIHJlbWluZGVyIHRvIHBlb3BsZSB0
aGF0IGFkZCBoZWFwcyBmcm9tCnRoZWlyIGNvZGUgKGFuZCB3b25kZXIgd2h5IHRoZXJlJ3Mgbm8g
ImRtYV9oZWFwX3JlbW92ZSIgZnVuY3Rpb24pLgoKQ2hlZXJzLAotQnJpYW4KCj4gdGhhbmtzCj4g
LWpvaG4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
