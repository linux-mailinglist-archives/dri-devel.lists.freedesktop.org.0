Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 829DE7D585
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 08:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BED6E36F;
	Thu,  1 Aug 2019 06:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on0629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe08::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9446E36F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 06:31:40 +0000 (UTC)
Received: from DB6PR0801CA0054.eurprd08.prod.outlook.com (2603:10a6:4:2b::22)
 by DB8PR08MB4954.eurprd08.prod.outlook.com (2603:10a6:10:bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15; Thu, 1 Aug
 2019 06:31:34 +0000
Received: from DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::209) by DB6PR0801CA0054.outlook.office365.com
 (2603:10a6:4:2b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.14 via Frontend
 Transport; Thu, 1 Aug 2019 06:31:34 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT037.mail.protection.outlook.com (10.152.20.215) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 1 Aug 2019 06:31:32 +0000
Received: ("Tessian outbound cc8a947d4660:v26");
 Thu, 01 Aug 2019 06:31:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e7ed79dd6703c46f
X-CR-MTA-TID: 64aa7808
Received: from cd1acb502eed.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.58]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FAB0AB00-20FF-47CE-9DB6-416FA2ECAB9F.1; 
 Thu, 01 Aug 2019 06:31:18 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cd1acb502eed.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Aug 2019 06:31:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETMVQCRyE1xHr1cSe9KDsxqjbjyESS6otPYQmUzVnkVcpL51VXC29XvVgefkVBRmhEgkK0KF1vcrLhC9eJhMwi+0g2j7iyqwAJcdC2jO7COn2Z2Lp97ax1laCGz+Fn20YfOjkPt0jfBgVb5/7Nau8CIuFFhwraRckfZKkATTXR/nlzA8To0pEz8AkbHeNDlyzCggLLbvajGT7VDZ2cbBZZYaFUpBDfEF2MIwGEMeBbnUNHL+KnYAE+/CdBOowbS6UV229gQEhWYMHtPBF4bc3ar0Ko9Qt5ccqqs9AI/oSi87MeX+KrMqmwjg/cTtsY9YVcqJIcvEbZyh3gUGv45UZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bbwfes/lyRqb6nxkZeS56o0EP6hZyZ/dn8LHqtYLP9s=;
 b=CXP2sSKGM1UQGLT2mMJnzaqwS4MRglI/VCJBK/yBV6/XWsqOLL9dHhjvPpauo0vTOJ+Ky68r5mYThTa4fCGGdSDR6542LpUQCigAw1SICBdErDkWHuLlSqaobUEOxpve6w3pNVPLagKHTaC97MLhpp795XERm7kENHVGbJPpa6Bm036561R2Bc5XfjQ0nBamlHrGWYXQx1PwVw1hNYzoaSA8tdJS85Put4LoTfK7REKGZUwzZQ6ZmBnm8+oDmIbIEeoIw3ta/PEy2/evLGGyPVO0MC/6kKW9YRznh+btHCRDBTvbI3DSohHabp+elEo2wIwpIFq41bhp7mPLie8hlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.11; Thu, 1 Aug 2019 06:31:14 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236%2]) with mapi id 15.20.2115.005; Thu, 1 Aug 2019
 06:31:14 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
Thread-Topic: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
Thread-Index: AQHVR4/CyrPm3jrEukClo/Nxj8QL56bktOeAgAEhUYA=
Date: Thu, 1 Aug 2019 06:31:13 +0000
Message-ID: <20190801063055.GA17887@lowry.li@arm.com>
References: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
 <1564571048-15029-3-git-send-email-lowry.li@arm.com>
 <20190731131525.vjnkbnbatb5tbuzh@e110455-lin.cambridge.arm.com>
In-Reply-To: <20190731131525.vjnkbnbatb5tbuzh@e110455-lin.cambridge.arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.5.21 (2010-09-15)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:203:92::18) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4b709e6a-550a-4cd3-36bc-08d71649e511
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB4078; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB4078:|DB8PR08MB4954:
X-Microsoft-Antispam-PRVS: <DB8PR08MB49549233D1A0363B0D98A65E9FDE0@DB8PR08MB4954.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
x-forefront-prvs: 01165471DB
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(189003)(199004)(53936002)(36756003)(76176011)(9686003)(305945005)(61793004)(66066001)(256004)(6436002)(6486002)(4326008)(68736007)(71200400001)(71190400001)(6862004)(33656002)(8936002)(6512007)(186003)(25786009)(86362001)(6246003)(81156014)(66556008)(66446008)(8676002)(66476007)(6636002)(64756008)(14444005)(229853002)(478600001)(26005)(11346002)(14454004)(81166006)(2906002)(7736002)(446003)(55236004)(5660300002)(102836004)(58126008)(99286004)(66946007)(1076003)(3846002)(52116002)(54906003)(486006)(6116002)(476003)(7416002)(316002)(386003)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4078;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 64qVlEQBVKRtGrAOeBpkU0v9R3P26fog4/e5E/SbEfnTT3JBwjgm5YibTlHf5D7JntyHCPcEXNuxMP6wjXrs3oCj4D/qsHcptEZ+7HntQTuRMTaNHzR4Knd11obeOtsemo25TB4uBdljZnJBPJY9FuAXtUkt9c/STjSIOIphWZPb5G/Yx4xOMaQRWiSR2pDond3VUG2gvx/bcBfTAVzRHLkkV7SoknO/y4z9NswMPrN6SZWpjJrHUmjcY/AEG8vRTYwTq3XMZIccNDp2aNeT71tMPNB+Ly2HTBSaW6rQnSq4BEOqB6Yf5BhB6GylaamYMUx6vEwo0FAOv0BM3bXbAGrack+hSK9yeN6+azbjKbdPV7eWmMWiDHm1j6XGAQbDkLouPzHW0X8VnVtY9hibuHzA+V49OpT7H8RKiuQ0rW4=
Content-ID: <C0230B3BB48521409DDC0B85D55C2791@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4078
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(39860400002)(2980300002)(199004)(189003)(126002)(11346002)(26826003)(476003)(6486002)(2906002)(70206006)(54906003)(70586007)(86362001)(478600001)(7736002)(336012)(36756003)(14444005)(63350400001)(61793004)(63370400001)(6512007)(436003)(229853002)(5660300002)(6246003)(305945005)(446003)(9686003)(8676002)(81166006)(14454004)(76176011)(47776003)(2486003)(6636002)(3846002)(50466002)(1076003)(316002)(81156014)(6862004)(356004)(58126008)(6506007)(33656002)(66066001)(8936002)(99286004)(76130400001)(26005)(23676004)(486006)(22756006)(386003)(25786009)(186003)(6116002)(4326008)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB4954;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 95d8f34c-0547-4a9c-8824-08d71649d93c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB8PR08MB4954; 
NoDisclaimer: True
X-Forefront-PRVS: 01165471DB
X-Microsoft-Antispam-Message-Info: XyWupJvILicCOI2avZGDdBnPkteCO1pZzLnBhNNtXD8gsL9qORsCxtSoNk5wWVUfBCcS1rGytbTD2vLlZT+zKfG8UCqFM/31LmMnB71wVudl+Wsnet9PhUfR6j1BoXVzBphuTWBMqsggwfDaK67l1WcpG+CAN8piGZJQki7f5b5fqkFoc0Hev5sR5EYFT+N3+vao7jnGkq7mYGOQm87xAlbaIZjDc+JTiOVkh30i+5HE2cFSUyOuUmgfptLCaKO+EQm7t6/LfM+VOJzi4dlYh4Syy596Lj5YOPOn39Lx59s7Tcm8DgFT2m5J7vczJoev3D90xZKYTcAHAtDXPXBuu61MuFyLwOzAp2jzfuQGSr9P7kw+DH0ZHsCpdSnbQFaS2ea1Vbjl2qqm4uEA1QYfaodBYnrRperImsaJ49bD4DI=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2019 06:31:32.7198 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b709e6a-550a-4cd3-36bc-08d71649e511
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4954
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bbwfes/lyRqb6nxkZeS56o0EP6hZyZ/dn8LHqtYLP9s=;
 b=S/9Rx0aBC3JQyD0xLlx3rBC/eqJ9Dnsbqh/KfLq9WKCKgABe0XDH8xHThGGoRC/2d45QXE+Xc1ToJ+wFxXCXqeZloXHEdOdNg+hCA84p5te3Hpq6KvWwRcajbMQKCylqujB+FYjRW6+02sP5RdYqE0wqcjzt3PqbYTDT8n7/sOA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bbwfes/lyRqb6nxkZeS56o0EP6hZyZ/dn8LHqtYLP9s=;
 b=S/9Rx0aBC3JQyD0xLlx3rBC/eqJ9Dnsbqh/KfLq9WKCKgABe0XDH8xHThGGoRC/2d45QXE+Xc1ToJ+wFxXCXqeZloXHEdOdNg+hCA84p5te3Hpq6KvWwRcajbMQKCylqujB+FYjRW6+02sP5RdYqE0wqcjzt3PqbYTDT8n7/sOA=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=temperror action=none header.from=arm.com;
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
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>, "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGl2aXUsDQoNCk9uIFdlZCwgSnVsIDMxLCAyMDE5IGF0IDAxOjE1OjI1UE0gKzAwMDAsIExp
dml1IER1ZGF1IHdyb3RlOg0KPiBIaSBMb3dyeSwNCj4gDQo+IE9uIFdlZCwgSnVsIDMxLCAyMDE5
IGF0IDExOjA0OjQ1QU0gKzAwMDAsIExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3Jv
dGU6DQo+ID4gRHVyaW5nIGl0IHNpZ25hbHMgdGhlIGNvbXBsZXRpb24gb2YgYSB3cml0ZWJhY2sg
am9iLCBhZnRlciByZWxlYXNpbmcNCj4gPiB0aGUgb3V0X2ZlbmNlLCB3ZSdkIGNsZWFyIHRoZSBw
b2ludGVyLg0KPiA+IA0KPiA+IENoZWNrIGlmIGZlbmNlIGxlZnQgb3ZlciBpbiBkcm1fd3JpdGVi
YWNrX2NsZWFudXBfam9iKCksIHJlbGVhc2UgaXQuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTog
TG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8bG93cnkubGlAYXJtLmNvbT4NCj4gPiAt
LS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV93cml0ZWJhY2suYyB8IDIzICsrKysrKysrKysr
KysrKy0tLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3dy
aXRlYmFjay5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV93cml0ZWJhY2suYw0KPiA+IGluZGV4IGZm
MTM4YjYuLjQzZDllM2IgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV93cml0
ZWJhY2suYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMNCj4gPiBA
QCAtMzI0LDYgKzMyNCw5IEBAIHZvaWQgZHJtX3dyaXRlYmFja19jbGVhbnVwX2pvYihzdHJ1Y3Qg
ZHJtX3dyaXRlYmFja19qb2IgKmpvYikNCj4gPiAgCWlmIChqb2ItPmZiKQ0KPiA+ICAJCWRybV9m
cmFtZWJ1ZmZlcl9wdXQoam9iLT5mYik7DQo+ID4gIA0KPiA+ICsJaWYgKGpvYi0+b3V0X2ZlbmNl
KQ0KPiA+ICsJCWRtYV9mZW5jZV9wdXQoam9iLT5vdXRfZmVuY2UpOw0KPiA+ICsNCj4gPiAgCWtm
cmVlKGpvYik7DQo+ID4gIH0NCj4gDQo+IFRoaXMgY2hhbmdlIGxvb2tzIGdvb2QuDQo+IA0KPiA+
ICBFWFBPUlRfU1lNQk9MKGRybV93cml0ZWJhY2tfY2xlYW51cF9qb2IpOw0KPiA+IEBAIC0zNjYs
MjUgKzM2OSwyOSBAQCBzdGF0aWMgdm9pZCBjbGVhbnVwX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0
ICp3b3JrKQ0KPiA+ICB7DQo+ID4gIAl1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiA+ICAJc3RydWN0
IGRybV93cml0ZWJhY2tfam9iICpqb2I7DQo+ID4gKwlzdHJ1Y3QgZG1hX2ZlbmNlICpvdXRfZmVu
Y2U7DQo+ID4gIA0KPiA+ICAJc3Bpbl9sb2NrX2lycXNhdmUoJndiX2Nvbm5lY3Rvci0+am9iX2xv
Y2ssIGZsYWdzKTsNCj4gPiAgCWpvYiA9IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmd2JfY29u
bmVjdG9yLT5qb2JfcXVldWUsDQo+ID4gIAkJCQkgICAgICAgc3RydWN0IGRybV93cml0ZWJhY2tf
am9iLA0KPiA+ICAJCQkJICAgICAgIGxpc3RfZW50cnkpOw0KPiA+IC0JaWYgKGpvYikgew0KPiA+
ICsJaWYgKGpvYikNCj4gPiAgCQlsaXN0X2RlbCgmam9iLT5saXN0X2VudHJ5KTsNCj4gPiAtCQlp
ZiAoam9iLT5vdXRfZmVuY2UpIHsNCj4gPiAtCQkJaWYgKHN0YXR1cykNCj4gPiAtCQkJCWRtYV9m
ZW5jZV9zZXRfZXJyb3Ioam9iLT5vdXRfZmVuY2UsIHN0YXR1cyk7DQo+ID4gLQkJCWRtYV9mZW5j
ZV9zaWduYWwoam9iLT5vdXRfZmVuY2UpOw0KPiA+IC0JCQlkbWFfZmVuY2VfcHV0KGpvYi0+b3V0
X2ZlbmNlKTsNCj4gDQo+ICpIZXJlKg0KPiANCj4gPiAtCQl9DQo+ID4gLQl9DQo+ID4gKw0KPiA+
ICAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmd2JfY29ubmVjdG9yLT5qb2JfbG9jaywgZmxhZ3Mp
Ow0KPiA+ICANCj4gPiAgCWlmIChXQVJOX09OKCFqb2IpKQ0KPiA+ICAJCXJldHVybjsNCj4gPiAg
DQo+ID4gKwlvdXRfZmVuY2UgPSBqb2ItPm91dF9mZW5jZTsNCj4gPiArCWlmIChvdXRfZmVuY2Up
IHsNCj4gPiArCQlpZiAoc3RhdHVzKQ0KPiA+ICsJCQlkbWFfZmVuY2Vfc2V0X2Vycm9yKG91dF9m
ZW5jZSwgc3RhdHVzKTsNCj4gPiArCQlkbWFfZmVuY2Vfc2lnbmFsKG91dF9mZW5jZSk7DQo+ID4g
KwkJZG1hX2ZlbmNlX3B1dChvdXRfZmVuY2UpOw0KPiA+ICsJCWpvYi0+b3V0X2ZlbmNlID0gTlVM
TDsNCj4gPiArCX0NCj4gPiArDQo+IA0KPiBJIGRvbid0IGdldCB0aGUgcG9pbnQgb2YgdGhpcyBj
aGFuZ2UuIFdoeSBub3QganVzdCBhZGQgam9iLT5vdXRfZmVuY2UgPSBOVUxMDQo+IHdoZXJlICpI
ZXJlKiBpcz8NCj4NCj4gQmVzdCByZWdhcmRzLA0KPiBMaXZpdSANCkJlc2lkZXMgc2V0dGluZyBO
VUxMLCBhbHNvIGRpZCBhIHJlZmluZSBieSBtb3ZpbmcgdGhlIGZlbmNlIG9wZXJhdGlvbg0Kb3V0
IG9mIHRoZSBsb2NrIGJsb2NrLg0KDQpCZXN0IHJlZ2FyZHMsDQpMb3dyeSANCj4gPiAgCUlOSVRf
V09SSygmam9iLT5jbGVhbnVwX3dvcmssIGNsZWFudXBfd29yayk7DQo+ID4gIAlxdWV1ZV93b3Jr
KHN5c3RlbV9sb25nX3dxLCAmam9iLT5jbGVhbnVwX3dvcmspOw0KPiA+ICB9DQo+ID4gLS0gDQo+
ID4gMS45LjENCj4gPiANCj4gDQo+IC0tIA0KPiA9PT09PT09PT09PT09PT09PT09PQ0KPiB8IEkg
d291bGQgbGlrZSB0byB8DQo+IHwgZml4IHRoZSB3b3JsZCwgIHwNCj4gfCBidXQgdGhleSdyZSBu
b3QgfA0KPiB8IGdpdmluZyBtZSB0aGUgICB8DQo+ICBcIHNvdXJjZSBjb2RlISAgLw0KPiAgIC0t
LS0tLS0tLS0tLS0tLQ0KPiAgICAgwq9cXyjjg4QpXy/Crw0KDQotLSANClJlZ2FyZHMsDQpMb3dy
eQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
