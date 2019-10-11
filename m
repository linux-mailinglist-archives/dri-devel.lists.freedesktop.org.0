Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C23FD397D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 08:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE6A6EBA1;
	Fri, 11 Oct 2019 06:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130058.outbound.protection.outlook.com [40.107.13.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855686EB9D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 06:44:57 +0000 (UTC)
Received: from AM6PR08CA0012.eurprd08.prod.outlook.com (2603:10a6:20b:b2::24)
 by AM6PR08MB4852.eurprd08.prod.outlook.com (2603:10a6:20b:cc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.24; Fri, 11 Oct
 2019 06:44:53 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::202) by AM6PR08CA0012.outlook.office365.com
 (2603:10a6:20b:b2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.21 via Frontend
 Transport; Fri, 11 Oct 2019 06:44:53 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 11 Oct 2019 06:44:51 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Fri, 11 Oct 2019 06:44:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8eff81d73b05b996
X-CR-MTA-TID: 64aa7808
Received: from 1326578ba90f.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.6.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D4401038-CA9A-4CA8-A219-7CDC9A4A6E49.1; 
 Fri, 11 Oct 2019 06:44:42 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1326578ba90f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Oct 2019 06:44:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2RNy8ib4w5uVVMSpebbXBe6LKgspJXOZHN2Lh+tD7jiycbODj7Pw2rA89mfMcYmDdQqcfChwh0ld/RS7zAGrTMrpdhYVWN2wDEDHEAG1rnfbrs9vUyAQcVMoLdSM/IWO6ZGHigp4IR0kUaz0LS4zAPbPf8XFfqAEeMKxWO/vDna+erJ3UtTWP4cgRcCu57/fu40VTGw1AvZq7GT1kvwSo/ZWSOtpnstaRHmACXILpZSKM23sXt0f2/lGnTOyyl507XbqNJQx/a3zvfuj5LtFnpKtlMXgHzsnOrM01GzLdIH5BCP+tClB+9rMZvSUSSpQXeKXm8Kd0XHT/CfCZHYsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARSOVHUTlt72uureZ3oGlKd+rC9WWhZYO7OQLkTDp4w=;
 b=h0DZLUi45glj7FduuvuXrCF3ZMjoRd1EBChl/XsdRrGkUicNDeP7wFbs+CiQW3Kt+f8aIT4INoZE4fJHpJtzhZcpDd5FE9xV8mMRz9C6dQMhhfZrTyYYcgHgehucxLynx0KwFduGTByjdSMz3dwDtrneyGUX6h+Mx+fuB0OkpJeOcGaZIvxg1TsU1jTv/8BNxWhNabr4f4sSdz1geAvevgR85+cJzn1tTx1C+yP7PEvrfzu8trBDQivmOohbckekL/32yQ+4tF5bTbxmmaL8z8erS6cvtkkv+AI2KWl7fGPVycOhDIEeWcmpbG7KTlPdS54VDZYh4Ys4KqRjKalF+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4800.eurprd08.prod.outlook.com (10.255.114.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 06:44:40 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 06:44:40 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: sandy.huang <hjc@rock-chips.com>
Subject: Re: [PATCH v2 1/3] drm: Add some new format DRM_FORMAT_NVXX_10
Thread-Topic: [PATCH v2 1/3] drm: Add some new format DRM_FORMAT_NVXX_10
Thread-Index: AQHVf+UEvXY5sygcqEqo20kfNNidrqdU/uOA
Date: Fri, 11 Oct 2019 06:44:40 +0000
Message-ID: <20191011064433.GA18503@jamwan02-TSP300>
References: <1569486289-152061-1-git-send-email-hjc@rock-chips.com>
 <1569486289-152061-2-git-send-email-hjc@rock-chips.com>
 <20190930104849.GA1208@intel.com>
 <2c46d532-f810-392d-b9c0-3b9aaccae7f4@rock-chips.com>
 <20191008113338.GP1208@intel.com>
 <a5fa3d8e-9e8e-8aa8-8abb-f00e8357acb5@rock-chips.com>
 <eafa5b37-e132-ad37-3876-384ac5ec9584@rock-chips.com>
In-Reply-To: <eafa5b37-e132-ad37-3876-384ac5ec9584@rock-chips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0169.apcprd02.prod.outlook.com
 (2603:1096:201:1f::29) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c645ed68-7490-4165-9a1b-08d74e1684b4
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4800:|AM6PR08MB4852:
X-MS-Exchange-PUrlCount: 2
X-Microsoft-Antispam-PRVS: <AM6PR08MB485267D267436227A37F547BB3970@AM6PR08MB4852.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 0187F3EA14
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(136003)(346002)(396003)(39860400002)(366004)(376002)(189003)(199004)(6486002)(478600001)(11346002)(229853002)(71190400001)(71200400001)(6436002)(305945005)(7736002)(486006)(14444005)(64756008)(446003)(66446008)(476003)(966005)(66556008)(25786009)(81156014)(8676002)(81166006)(55236004)(6916009)(386003)(6506007)(256004)(316002)(8936002)(66476007)(66946007)(9686003)(6512007)(6306002)(26005)(186003)(102836004)(52116002)(5660300002)(33716001)(99286004)(1076003)(76176011)(54906003)(6246003)(14454004)(33656002)(58126008)(86362001)(4326008)(66574012)(66066001)(6116002)(3846002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4800;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: +4yCRx6wrR7Vxc7H07YE2b8j9hAwkrEvPcSR4g5qQhgcUWQhuX6qFn8LXQpRSB2DpTEnjScFMVxCsCpo5+cmn4F1HEsv+3u3roIA9h5w5aUB3ts+90UQdnRpafzUVs5EFDhuhD8B1jGN9GpFRE5MYGuF5XJhZAxdlVnyjdfd8Pl1hPxtAh85e+xZNfyXPZbtoneqOE7olDM0wdUiPOZFJE+q1NswCVERBnYpR1oatDnHTEnHNm6w55fuiwdzIwjXWiMJClpKtSFg9BwYIJMvfpQIJfydAcSHRBGljlomcRHT0DEb5XnCVpM9HF3HEQLmMBk9b2/jFXTHHQEPG/4XyZzmcaRJgiYNoCmjFJpsf9wOdHjndOsbGebOlMT4XJV4F9Y5OxJu2GX8bFZYJsRTsVXxAbTPEib3zRnvtVwZGQHLWRr5RZrSdZjCgddnRnlrOol9aRx38baTrlSjIzhY/A==
x-ms-exchange-transport-forked: True
Content-ID: <8CFBCEB37E2B8B41BE448FB9425E2FE5@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4800
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(346002)(39860400002)(376002)(396003)(136003)(189003)(199004)(63350400001)(70206006)(2906002)(86362001)(446003)(7736002)(478600001)(186003)(2486003)(436003)(33716001)(476003)(11346002)(126002)(486006)(26005)(70586007)(336012)(23676004)(66574012)(66066001)(26826003)(76176011)(356004)(1076003)(99286004)(305945005)(14444005)(6486002)(54906003)(229853002)(6862004)(58126008)(81156014)(25786009)(8936002)(8676002)(6306002)(6246003)(33656002)(47776003)(9686003)(22756006)(14454004)(102836004)(316002)(966005)(5660300002)(386003)(6506007)(6512007)(6116002)(3846002)(50466002)(4326008)(76130400001)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4852;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: d441f57b-5a90-4d08-1dc6-08d74e167dc7
NoDisclaimer: True
X-Forefront-PRVS: 0187F3EA14
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7axMfhVC8khexbsaMPd+lx0weCvbsCdMLoe3S+jIzZn1IemWdkIo5VR2qXh79yZI3vJbHbRiuSUnlbrSE2znsxKzaH9RN6cYCsG+mGiruJOzrPZ/xlc4wYcE4+vk7+XI30YXnFGIlM/bXmlw6MxkXdcuw3fFLotwaeHl4cG9D1AVRQlM13XXUWq5wn2QAsbEwDV0aAsoF4vsxL1WWcDkl76pRyQXMVqCNY4AbzUNBz1Ba5fvh4yf9HsD+HsvpjHru+LXx6MjSVWOBP99y3A1ScGULLoRjtc7Dy5733UTkDG5bBIgEndhiYis6/yXhg+G7ktO+C34XJaBQusjF0ZNiviC0AojBndRvWI9fFfNOqhouPb0tLg7pLYYAxc/YTWsoWuHC1FH0Za/jc7W8vtgqyraIW4eDYqMntoTKkYnTIHrybMxVdHP9Mvh9yyEiL0b3hHlcnLsACXDbQdiV5YPow==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 06:44:51.8219 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c645ed68-7490-4165-9a1b-08d74e1684b4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4852
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARSOVHUTlt72uureZ3oGlKd+rC9WWhZYO7OQLkTDp4w=;
 b=bPFXi3BlmSLzLxKPgsr4WhgfKA5hzHTS7n/WFhZ3X4bagNas8c0/0xA9aZ9wkoFWowntVP2ldtM5rMSYqa2q8VXYEU6maxZ286XUlyaAutkGvV2+xcIORYr37Jwxpom5ShoJGbrgQOUjn/H2n2LoQdvc50ZRTS+0/UeCN+wlB5k=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARSOVHUTlt72uureZ3oGlKd+rC9WWhZYO7OQLkTDp4w=;
 b=bPFXi3BlmSLzLxKPgsr4WhgfKA5hzHTS7n/WFhZ3X4bagNas8c0/0xA9aZ9wkoFWowntVP2ldtM5rMSYqa2q8VXYEU6maxZ286XUlyaAutkGvV2+xcIORYr37Jwxpom5ShoJGbrgQOUjn/H2n2LoQdvc50ZRTS+0/UeCN+wlB5k=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, nd <nd@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMTE6MzU6NTNBTSArMDgwMCwgc2FuZHkuaHVhbmcgd3Jv
dGU6DQo+IEhpIGphbWVzLnFpYW4ud2FuZywNCj4gDQo+IMKgwqDCoCBUaGFuayBmb3IgeW91IHJl
bWluZCwgZm91IHNvbWUgdW5rbm93IHJlYXNvbiwgaSBtaXNzIHRoZSB0aGUgbWFpbCBmcm9tDQo+
IHlvdTooLCBpIGdldCB0aGlzIG1lc3NhZ2UgZnJvbSBodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3BhdGNoLzExMTYxOTM3Lw0KPiANCj4gc29ycnkgYWJvdXQgdGhhdC4NCj4gDQo+IMKgwqDC
oCBBYm91dCB0aGUgZm9ybWF0IGJsb2NrIGRlc2NyaWJlLCBJIGFsc28gZm91bmQgc29tZSB1bnJl
YXNvbmFibGUswqAgdGhpcw0KPiBmb3JtYXQgbmVlZCAyIGxpbmUgYWxpZ25lZCwgc28gdGhlIGJs
b2NrX2ggbmVlZCB0byBzZWQgYXMgMiwgYW5kIHRoZQ0KPiBjaGFyX3Blcl9ibG9jayBuZWVkIHNl
dCBhcyB3ICogaCAqIDEwIGZvciB5IHBsYW5lLCBhbmQgdyAqIGggKiAyICogMTAgZm9yIHV2DQo+
IHBsYW5lLCBzbyB0aGUgZm9sbG93aW5nIGRlc2NyaWJlIG1heWJlIG1vcmUgY29ycmVjdCwgdGhh
bmtzLg0KPiANCj4gwqDCoMKgIMKgwqDCoCB7IC5mb3JtYXQgPSBEUk1fRk9STUFUX05WMTJfMTAs
wqDCoMKgIMKgwqDCoCAuZGVwdGggPSAwLCAubnVtX3BsYW5lcyA9IDIsDQo+IMKgwqDCoCDCoMKg
wqAgwqAgLmNoYXJfcGVyX2Jsb2NrID0geyAxMCwgMTAsIDAgfSwgLmJsb2NrX3cgPSB7IDQsIDIs
IDAgfSwgLmJsb2NrX2gNCj4gPSB7IDIsIDIsIDAgfSwNCj4gwqDCoMKgIMKgwqDCoCDCoCAuaHN1
YiA9IDIsIC52c3ViID0gMiwgLmlzX3l1diA9IHRydWV9LA0KDQpIaSBTYW5keToNCkkgdGhpbmsg
Zm9yIHN1Y2ggTlYxMiBZVVYtNDIyIChoc3ViID0gMiwgdnN1YiA9IDIpIDJ4MiBzdWJzYW1wbGVk
IGZvcm1hdA0KdGhlIGJsb2NrIHNpemUgY2FuIGJlOg0KDQp0aGUgWSBwbGFuZTogIDJ4MjsNClRo
ZSBVViBwbGFuZTogMXgyOyAoSCBkaXJlY3Rpb24gc2FtcGxlIDEgQ2IgYW5kIDFDciwgViBkaXJl
Y3Rpb24gMiBsaW5lcyBnb3QgMikNCg0KVGhlbjoNCg0KLmNoYXJfcGVyX2Jsb2NrID0gezUsIDUs
IDB9IGJsb2NrX3cgPSB7MiwgMSwgMH0uIGJsb2NrX2ggPSB7MiwgMiwgMH07DQoNClRoYW5rcw0K
SmFtZXMNCg0KPiDCoMKgwqAgwqDCoMKgIMKgIC5oc3ViID0gMiwgLnZzdWIgPSAyLCAuaXNfeXV2
ID0gdHJ1ZX0sDQo+IMKgwqDCoCDCoMKgwqAgeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9OVjIxXzEw
LMKgwqDCoCDCoMKgwqAgLmRlcHRoID0gMCwgLm51bV9wbGFuZXMgPSAyLA0KPiDCoMKgwqAgwqDC
oMKgIMKgIC5jaGFyX3Blcl9ibG9jayA9IHsgMTAsIDEwLCAwIH0sIC5ibG9ja193ID0geyA0LCAy
LCAwIH0sIC5ibG9ja19oDQo+ID0geyAyLCAyLCAwIH0sDQo+IMKgwqDCoCDCoMKgwqAgwqAgLmhz
dWIgPSAyLCAudnN1YiA9IDIsIC5pc195dXYgPSB0cnVlfSwNCj4gwqDCoMKgIMKgwqDCoCB7IC5m
b3JtYXQgPSBEUk1fRk9STUFUX05WMTZfMTAswqDCoMKgIMKgwqDCoCAuZGVwdGggPSAwLCAubnVt
X3BsYW5lcyA9IDIsDQo+IMKgwqDCoCDCoMKgwqAgwqAgLmNoYXJfcGVyX2Jsb2NrID0geyAxMCwg
MTAsIDAgfSwgLmJsb2NrX3cgPSB7IDQsIDIsIDAgfSwgLmJsb2NrX2gNCj4gPSB7IDIsIDIsIDAg
fSwNCj4gwqDCoMKgIMKgwqDCoCDCoCAuaHN1YiA9IDIsIC52c3ViID0gMSwgLmlzX3l1diA9IHRy
dWV9LA0KPiDCoMKgwqAgwqDCoMKgIHsgLmZvcm1hdCA9IERSTV9GT1JNQVRfTlY2MV8xMCzCoMKg
wqAgwqDCoMKgIC5kZXB0aCA9IDAsIC5udW1fcGxhbmVzID0gMiwNCj4gwqDCoMKgIMKgwqDCoCDC
oCAuY2hhcl9wZXJfYmxvY2sgPSB7IDEwLCAxMCwgMCB9LCAuYmxvY2tfdyA9IHsgNCwgMiwgMCB9
LCAuYmxvY2tfaA0KPiA9IHsgMiwgMiwgMCB9LA0KPiDCoMKgwqAgwqDCoMKgIMKgIC5oc3ViID0g
MiwgLnZzdWIgPSAxLCAuaXNfeXV2ID0gdHJ1ZX0sDQo+IMKgwqDCoCDCoMKgwqAgeyAuZm9ybWF0
ID0gRFJNX0ZPUk1BVF9OVjI0XzEwLMKgwqDCoCDCoMKgwqAgLmRlcHRoID0gMCwgLm51bV9wbGFu
ZXMgPSAyLA0KPiDCoMKgwqAgwqDCoMKgIMKgIC5jaGFyX3Blcl9ibG9jayA9IHsgMTAsIDEwLCAw
IH0sIC5ibG9ja193ID0geyA0LCAyLCAwIH0sIC5ibG9ja19oDQo+ID0geyAyLCAyLCAwIH0sDQo+
IMKgwqDCoCDCoMKgwqAgwqAgLmhzdWIgPSAxLCAudnN1YiA9IDEsIC5pc195dXYgPSB0cnVlfSwN
Cj4gwqDCoMKgIMKgwqDCoCB7IC5mb3JtYXQgPSBEUk1fRk9STUFUX05WNDJfMTAswqDCoMKgIMKg
wqDCoCAuZGVwdGggPSAwLCAubnVtX3BsYW5lcyA9IDIsDQo+IMKgwqDCoCDCoMKgwqAgwqAgLmNo
YXJfcGVyX2Jsb2NrID0geyAxMCwgMTAsIDAgfSwgLmJsb2NrX3cgPSB7IDQsIDIsIDAgfSwgLmJs
b2NrX2gNCj4gPSB7IDIsIDIsIDAgfSwNCj4gwqDCoMKgIMKgwqDCoCDCoCAuaHN1YiA9IDEsIC52
c3ViID0gMSwgLmlzX3l1diA9IHRydWV9LA0KPiANCj4gDQo+ID4gPsKgIMKgwqDCoCDCoMKgwqAg
eyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9QMDE2LMKgwqDCoCDCoMKgwqAgLmRlcHRoID0gMCzCoCAu
bnVtX3BsYW5lcyA9DQo+IDIsDQo+ID4gPsKgIMKgwqDCoCDCoMKgwqAgwqAgLmNoYXJfcGVyX2Js
b2NrID0geyAyLCA0LCAwIH0sIC5ibG9ja193ID0geyAxLCAwLCAwIH0sDQo+IC5ibG9ja19oID0g
eyAxLCAwLCAwIH0sDQo+ID4gPsKgIMKgwqDCoCDCoMKgwqAgwqAgLmhzdWIgPSAyLCAudnN1YiA9
IDIsIC5pc195dXYgPSB0cnVlfSwNCj4gPiA+ICvCoMKgwqAgwqDCoMKgIHsgLmZvcm1hdCA9IERS
TV9GT1JNQVRfTlYxMl8xMCzCoMKgwqAgwqDCoMKgIC5kZXB0aCA9IDAswqAgLm51bV9wbGFuZXMN
Cj4gPSAyLA0KPiA+ID4gK8KgwqDCoCDCoMKgwqAgwqAgLmNoYXJfcGVyX2Jsb2NrID0geyA1LCAx
MCwgMCB9LCAuYmxvY2tfdyA9IHsgNCwgNCwgMCB9LA0KPiAuYmxvY2tfaCA9IHsgNCwgNCwgMCB9
LA0KPiANCj4gPiBIaSBTYW5keToNCj4gPiBUaGVpciBpcyBhIHByb2JsZW0gaGVyZSBmb3IgY2hh
cl9wZXJfYmxvY2sgc2l6ZSBvZiBwbGFuZVswXToNCj4gPiBTaW5jZTogNSAqIDggIT0gNCAqIDQg
KiAxMDsNCj4gPiBTZWVtcyB5b3UgbWlzLXNldCB0aGUgYmxvY2tfdy9oLCBwZXIgeW91ciBibG9j
ayBzaXplIHRoZSBibG9jayBpcyAyeDIsIGFuZA0KPiBpdCBzaG91bGQgYmU6DQo+ID7CoCAuY2hh
cl9wZXJfYmxvY2sgPSB7IDUsIDEwLCAwIH0sIC5ibG9ja193ID0geyAyLCAyLCAwIH0sIC5ibG9j
a19oID0geyAyLA0KPiAyLCAwIH0sDQo+IA0KPiA+IEJlc3QgUmVnYXJkczoNCj4gPiBKYW1lcw0K
PiANCj4gDQo+IA0KPiANCj4gDQo+IA0KPiDlnKggMjAxOS8xMC84IOS4i+WNiDc6NDksIHNhbmR5
Lmh1YW5nIOWGmemBkzoNCj4gPiANCj4gPiDlnKggMjAxOS8xMC84IOS4i+WNiDc6MzMsIFZpbGxl
IFN5cmrDpGzDpCDlhpnpgZM6DQo+ID4gPiBPbiBUdWUsIE9jdCAwOCwgMjAxOSBhdCAxMDo0MDoy
MEFNICswODAwLCBzYW5keS5odWFuZyB3cm90ZToNCj4gPiA+ID4gSGkgdmlsbGUgc3lyamFsYSwN
Cj4gPiA+ID4gDQo+ID4gPiA+IOWcqCAyMDE5LzkvMzAg5LiL5Y2INjo0OCwgVmlsbGUgU3lyasOk
bMOkIOWGmemBkzoNCj4gPiA+ID4gPiBPbiBUaHUsIFNlcCAyNiwgMjAxOSBhdCAwNDoyNDo0N1BN
ICswODAwLCBTYW5keSBIdWFuZyB3cm90ZToNCj4gPiA+ID4gPiA+IFRoZXNlIG5ldyBmb3JtYXQg
aXMgc3VwcG9ydGVkIGJ5IHNvbWUgcm9ja2NoaXAgc29jczoNCj4gPiA+ID4gPiA+IA0KPiA+ID4g
PiA+ID4gRFJNX0ZPUk1BVF9OVjEyXzEwL0RSTV9GT1JNQVRfTlYyMV8xMA0KPiA+ID4gPiA+ID4g
RFJNX0ZPUk1BVF9OVjE2XzEwL0RSTV9GT1JNQVRfTlY2MV8xMA0KPiA+ID4gPiA+ID4gRFJNX0ZP
Uk1BVF9OVjI0XzEwL0RSTV9GT1JNQVRfTlY0Ml8xMA0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPg0KPiA+ID4g
PiA+ID4gLS0tDQo+ID4gPiA+ID4gPiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmPC
oCB8IDE4ICsrKysrKysrKysrKysrKysrKw0KPiA+ID4gPiA+ID4gwqDCoCBpbmNsdWRlL3VhcGkv
ZHJtL2RybV9mb3VyY2MuaCB8IDE0ICsrKysrKysrKysrKysrDQo+ID4gPiA+ID4gPiDCoMKgIDIg
ZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mb3VyY2MuYw0KPiA+ID4gPiA+ID4g
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJjYy5jDQo+ID4gPiA+ID4gPiBpbmRleCBjNjMwMDY0
Li5jY2Q3OGEzIDEwMDY0NA0KPiA+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9m
b3VyY2MuYw0KPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mb3VyY2MuYw0K
PiA+ID4gPiA+ID4gQEAgLTI2MSw2ICsyNjEsMjQgQEAgY29uc3Qgc3RydWN0IGRybV9mb3JtYXRf
aW5mbw0KPiA+ID4gPiA+ID4gKl9fZHJtX2Zvcm1hdF9pbmZvKHUzMiBmb3JtYXQpDQo+ID4gPiA+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCB7IC5mb3JtYXQgPSBEUk1fRk9STUFUX1AwMTYswqDC
oMKgwqDCoMKgwqAgLmRlcHRoID0NCj4gPiA+ID4gPiA+IDAswqAgLm51bV9wbGFuZXMgPSAyLA0K
PiA+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5jaGFyX3Blcl9ibG9jayA9IHsg
MiwgNCwgMCB9LCAuYmxvY2tfdyA9IHsNCj4gPiA+ID4gPiA+IDEsIDAsIDAgfSwgLmJsb2NrX2gg
PSB7IDEsIDAsIDAgfSwNCj4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuaHN1
YiA9IDIsIC52c3ViID0gMiwgLmlzX3l1diA9IHRydWV9LA0KPiA+ID4gPiA+ID4gK8KgwqDCoMKg
wqDCoMKgIHsgLmZvcm1hdCA9IERSTV9GT1JNQVRfTlYxMl8xMCzCoMKgwqDCoMKgwqDCoCAuZGVw
dGggPQ0KPiA+ID4gPiA+ID4gMCzCoCAubnVtX3BsYW5lcyA9IDIsDQo+ID4gPiA+ID4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgIC5jaGFyX3Blcl9ibG9jayA9IHsgNSwgMTAsIDAgfSwgLmJsb2NrX3cg
PSB7DQo+ID4gPiA+ID4gPiA0LCA0LCAwIH0sIC5ibG9ja19oID0geyA0LCA0LCAwIH0sDQo+ID4g
PiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgIC5oc3ViID0gMiwgLnZzdWIgPSAyLCAuaXNfeXV2
ID0gdHJ1ZX0sDQo+ID4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAgeyAuZm9ybWF0ID0gRFJNX0ZP
Uk1BVF9OVjIxXzEwLMKgwqDCoMKgwqDCoMKgIC5kZXB0aCA9DQo+ID4gPiA+ID4gPiAwLMKgIC5u
dW1fcGxhbmVzID0gMiwNCj4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLmNoYXJfcGVy
X2Jsb2NrID0geyA1LCAxMCwgMCB9LCAuYmxvY2tfdyA9IHsNCj4gPiA+ID4gPiA+IDQsIDQsIDAg
fSwgLmJsb2NrX2ggPSB7IDQsIDQsIDAgfSwNCj4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqAgLmhzdWIgPSAyLCAudnN1YiA9IDIsIC5pc195dXYgPSB0cnVlfSwNCj4gPiA+ID4gPiA+ICvC
oMKgwqDCoMKgwqDCoCB7IC5mb3JtYXQgPSBEUk1fRk9STUFUX05WMTZfMTAswqDCoMKgwqDCoMKg
wqAgLmRlcHRoID0NCj4gPiA+ID4gPiA+IDAswqAgLm51bV9wbGFuZXMgPSAyLA0KPiA+ID4gPiA+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoCAuY2hhcl9wZXJfYmxvY2sgPSB7IDUsIDEwLCAwIH0sIC5i
bG9ja193ID0gew0KPiA+ID4gPiA+ID4gNCwgNCwgMCB9LCAuYmxvY2tfaCA9IHsgNCwgNCwgMCB9
LA0KPiA+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoCAuaHN1YiA9IDIsIC52c3ViID0gMSwg
LmlzX3l1diA9IHRydWV9LA0KPiA+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgIHsgLmZvcm1hdCA9
IERSTV9GT1JNQVRfTlY2MV8xMCzCoMKgwqDCoMKgwqDCoCAuZGVwdGggPQ0KPiA+ID4gPiA+ID4g
MCzCoCAubnVtX3BsYW5lcyA9IDIsDQo+ID4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgIC5j
aGFyX3Blcl9ibG9jayA9IHsgNSwgMTAsIDAgfSwgLmJsb2NrX3cgPSB7DQo+ID4gPiA+ID4gPiA0
LCA0LCAwIH0sIC5ibG9ja19oID0geyA0LCA0LCAwIH0sDQo+ID4gPiA+ID4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgIC5oc3ViID0gMiwgLnZzdWIgPSAxLCAuaXNfeXV2ID0gdHJ1ZX0sDQo+ID4gPiA+
ID4gPiArwqDCoMKgwqDCoMKgwqAgeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9OVjI0XzEwLMKgwqDC
oMKgwqDCoMKgIC5kZXB0aCA9DQo+ID4gPiA+ID4gPiAwLMKgIC5udW1fcGxhbmVzID0gMiwNCj4g
PiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLmNoYXJfcGVyX2Jsb2NrID0geyA1LCAxMCwg
MCB9LCAuYmxvY2tfdyA9IHsNCj4gPiA+ID4gPiA+IDQsIDQsIDAgfSwgLmJsb2NrX2ggPSB7IDQs
IDQsIDAgfSwNCj4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLmhzdWIgPSAxLCAudnN1
YiA9IDEsIC5pc195dXYgPSB0cnVlfSwNCj4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCB7IC5m
b3JtYXQgPSBEUk1fRk9STUFUX05WNDJfMTAswqDCoMKgwqDCoMKgwqAgLmRlcHRoID0NCj4gPiA+
ID4gPiA+IDAswqAgLm51bV9wbGFuZXMgPSAyLA0KPiA+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoCAuY2hhcl9wZXJfYmxvY2sgPSB7IDUsIDEwLCAwIH0sIC5ibG9ja193ID0gew0KPiA+ID4g
PiA+ID4gNCwgNCwgMCB9LCAuYmxvY2tfaCA9IHsgNCwgNCwgMCB9LA0KPiA+ID4gPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoCAuaHN1YiA9IDEsIC52c3ViID0gMSwgLmlzX3l1diA9IHRydWV9LA0K
PiA+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9Q
MjEwLMKgwqDCoMKgwqDCoMKgIC5kZXB0aCA9IDAsDQo+ID4gPiA+ID4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLm51bV9wbGFuZXMgPSAyLCAuY2hhcl9wZXJfYmxvY2sgPSB7IDIsIDQsIDAg
fSwNCj4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuYmxvY2tfdyA9IHsgMSwg
MCwgMCB9LCAuYmxvY2tfaCA9IHsgMSwgMCwNCj4gPiA+ID4gPiA+IDAgfSwgLmhzdWIgPSAyLA0K
PiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oDQo+
ID4gPiA+ID4gPiBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oDQo+ID4gPiA+ID4gPiBp
bmRleCAzZmVlYWEzLi4wOGUyMjIxIDEwMDY0NA0KPiA+ID4gPiA+ID4gLS0tIGEvaW5jbHVkZS91
YXBpL2RybS9kcm1fZm91cmNjLmgNCj4gPiA+ID4gPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0v
ZHJtX2ZvdXJjYy5oDQo+ID4gPiA+ID4gPiBAQCAtMjM4LDYgKzIzOCwyMCBAQCBleHRlcm4gIkMi
IHsNCj4gPiA+ID4gPiA+IMKgwqAgI2RlZmluZSBEUk1fRk9STUFUX05WNDLCoMKgwqDCoMKgwqDC
oCBmb3VyY2NfY29kZSgnTicsICdWJywNCj4gPiA+ID4gPiA+ICc0JywgJzInKSAvKiBub24tc3Vi
c2FtcGxlZCBDYjpDciBwbGFuZSAqLw0KPiA+ID4gPiA+ID4gwqDCoCDCoMKgIC8qDQo+ID4gPiA+
ID4gPiArICogMiBwbGFuZSBZQ2JDcg0KPiA+ID4gPiA+ID4gKyAqIGluZGV4IDAgPSBZIHBsYW5l
LCBZMzpZMjpZMTpZMCAxMDoxMDoxMDoxMA0KPiA+ID4gPiA+ID4gKyAqIGluZGV4IDEgPSBDYjpD
ciBwbGFuZSwNCj4gPiA+ID4gPiA+IENiMzpDcjM6Q2IyOkNyMjpDYjE6Q3IxOkNiMDpDcjAgMTA6
MTA6MTA6MTA6MTA6MTA6MTA6MTANCj4gPiA+ID4gPiA+ICsgKiBvcg0KPiA+ID4gPiA+ID4gKyAq
IGluZGV4IDEgPSBDcjpDYiBwbGFuZSwNCj4gPiA+ID4gPiA+IENyMzpDYjM6Q3IyOkNiMjpDcjE6
Q2IxOkNyMDpDYjAgMTA6MTA6MTA6MTA6MTA6MTA6MTA6MTANCj4gPiA+ID4gPiBTbyBub3cgeW91
J3JlIGRlZmluaW5nIGl0IGFzIHNvbWUga2luZCBvZiBieXRlIGFsaWduZWQgYmxvY2suDQo+ID4g
PiA+ID4gV2l0aCB0aGF0IHNwZWNpZnlpbmcgZW5kaWFubmVzcyB3b3VsZCBub3cgbWFrZSBzZW5z
ZSBzaW5jZQ0KPiA+ID4gPiA+IG90aGVyd2lzZSB0aGlzIHRlbGxzIHVzIGFic29sdXRlbHkgbm90
aGluZyBhYm91dCB0aGUgbWVtb3J5DQo+ID4gPiA+ID4gbGF5b3V0Lg0KPiA+ID4gPiA+IA0KPiA+
ID4gPiA+IFNvIEknZCBlaXRoZXIgZG8gdGhhdCwgb3IgZ28gYmFjayB0byBub3Qgc3BlY2lmeWlu
ZyBhbnl0aGluZyBhbmQNCj4gPiA+ID4gPiB1c2Ugc29tZSB3ZWFzZWwgd29yZHMgbGlrZSAibWFt
b3J5IGxheW91dCBpcyBpbXBsZW1lbnRhdGlvbiBkZWZpbmVkIg0KPiA+ID4gPiA+IHdoaWNoIG9m
IGNvdXJzZSBtZWFucyBubyBvbmUgY2FuIHVzZSBpdCBmb3IgYW55dGhpbmcgdGhhdCBpbnZvbHZl
cw0KPiA+ID4gPiA+IGFueSBraW5kIG9mIGNyb3NzIHZlbmRvciBzdHVmZi4NCj4gPiA+ID4gLyoN
Cj4gPiA+ID4gwqAgwqAqIDIgcGxhbmUgWUNiQ3INCj4gPiA+ID4gwqAgwqAqIGluZGV4IDAgPSBZ
IHBsYW5lLCBbMzk6IDBdIFkzOlkyOlkxOlkwIDEwOjEwOjEwOjEwIGxpdHRsZSBlbmRpYW4NCj4g
PiA+ID4gwqAgwqAqIGluZGV4IDEgPSBDYjpDciBwbGFuZSwgWzc5OiAwXSBDYjM6Q3IzOkNiMjpD
cjI6Q2IxOkNyMTpDYjA6Q3IwDQo+ID4gPiA+IDEwOjEwOjEwOjEwOjEwOjEwOjEwOjEwwqAgbGl0
dGxlIGVuZGlhbg0KPiA+ID4gPiDCoCDCoCogb3INCj4gPiA+ID4gwqAgwqAqIGluZGV4IDEgPSBD
cjpDYiBwbGFuZSwgWzc5OiAwXSBDcjM6Q2IzOkNyMjpDYjI6Q3IxOkNiMTpDcjA6Q2IwDQo+ID4g
PiA+IDEwOjEwOjEwOjEwOjEwOjEwOjEwOjEwwqAgbGl0dGxlIGVuZGlhbg0KPiA+ID4gPiDCoCDC
oCovDQo+ID4gPiA+IA0KPiA+ID4gPiBJcyB0aGlzIGRlc2NyaXB0aW9uIG9rPw0KPiA+ID4gU2Vl
bXMgT0sgdG8gbWUsIGlmIGl0IGFjdHVhbGx5IGRlc2NyaWJlcyB0aGUgZm9ybWF0IGNvcnJlY3Rs
eS4NCj4gPiA+IA0KPiA+ID4gVGhvdWdoIEknbSBub3Qgc3VyZSB3aHkgdGhlIENiQ3IgaXMgZGVm
aW5lcyBhcyBhbiA4MGJpdCBibG9jaw0KPiA+ID4gYW5kIFkgaGFzIGEgNDBiaXQgYmxvY2suIDQw
Yml0cyBzaG91bGQgYmUgZW5vdWdoIGZvciBDYkNyIGFzIHdlbGwuDQo+ID4gPiANCj4gPiB3ZWxs
LCB0aGlzIGlzIHRha2VuIGludG8gYWNjb3VudCB5dXY0NDQswqAgNCB5IHBvaW50IGNvcnJlc3Bv
bmRpbmcgd2l0aCA0DQo+ID4gdXYgcG9pbnQuDQo+ID4gDQo+ID4gaWYgb25seSBkZXNjcmliZXMg
dGhlIGxheW91dCBtZW1vcnksIGhlcmUgY2FuIGNoYW5nZSB0byA0MGJpdCBibG9jay4NCj4gPiAN
Cj4gPiB0aGFua3MuDQo+ID4gDQo+ID4gPiA+ID4gPiArICovDQo+ID4gPiA+ID4gPiArI2RlZmlu
ZSBEUk1fRk9STUFUX05WMTJfMTDCoMKgwqAgZm91cmNjX2NvZGUoJ04nLCAnQScsDQo+ID4gPiA+
ID4gPiAnMScsICcyJykgLyogMngyIHN1YnNhbXBsZWQgQ3I6Q2IgcGxhbmUgKi8NCj4gPiA+ID4g
PiA+ICsjZGVmaW5lIERSTV9GT1JNQVRfTlYyMV8xMMKgwqDCoCBmb3VyY2NfY29kZSgnTicsICdB
JywNCj4gPiA+ID4gPiA+ICcyJywgJzEnKSAvKiAyeDIgc3Vic2FtcGxlZCBDYjpDciBwbGFuZSAq
Lw0KPiA+ID4gPiA+ID4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9OVjE2XzEwwqDCoMKgIGZvdXJjY19j
b2RlKCdOJywgJ0EnLA0KPiA+ID4gPiA+ID4gJzEnLCAnNicpIC8qIDJ4MSBzdWJzYW1wbGVkIENy
OkNiIHBsYW5lICovDQo+ID4gPiA+ID4gPiArI2RlZmluZSBEUk1fRk9STUFUX05WNjFfMTDCoMKg
wqAgZm91cmNjX2NvZGUoJ04nLCAnQScsDQo+ID4gPiA+ID4gPiAnNicsICcxJykgLyogMngxIHN1
YnNhbXBsZWQgQ2I6Q3IgcGxhbmUgKi8NCj4gPiA+ID4gPiA+ICsjZGVmaW5lIERSTV9GT1JNQVRf
TlYyNF8xMMKgwqDCoCBmb3VyY2NfY29kZSgnTicsICdBJywNCj4gPiA+ID4gPiA+ICcyJywgJzQn
KSAvKiBub24tc3Vic2FtcGxlZCBDcjpDYiBwbGFuZSAqLw0KPiA+ID4gPiA+ID4gKyNkZWZpbmUg
RFJNX0ZPUk1BVF9OVjQyXzEwwqDCoMKgIGZvdXJjY19jb2RlKCdOJywgJ0EnLA0KPiA+ID4gPiA+
ID4gJzQnLCAnMicpIC8qIG5vbi1zdWJzYW1wbGVkIENiOkNyIHBsYW5lICovDQo+ID4gPiA+ID4g
PiArDQo+ID4gPiA+ID4gPiArLyoNCj4gPiA+ID4gPiA+IMKgwqDCoCAqIDIgcGxhbmUgWUNiQ3Ig
TVNCIGFsaWduZWQNCj4gPiA+ID4gPiA+IMKgwqDCoCAqIGluZGV4IDAgPSBZIHBsYW5lLCBbMTU6
MF0gWTp4IFsxMDo2XSBsaXR0bGUgZW5kaWFuDQo+ID4gPiA+ID4gPiDCoMKgwqAgKiBpbmRleCAx
ID0gQ3I6Q2IgcGxhbmUsIFszMTowXSBDcjp4OkNiOngNCj4gPiA+ID4gPiA+IFsxMDo2OjEwOjZd
IGxpdHRsZSBlbmRpYW4NCj4gPiA+ID4gPiA+IC0tIA0KPiA+ID4gPiA+ID4gMi43LjQNCj4gPiA+
ID4gPiA+IA0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gPiA+ID4gPiBkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0DQo+ID4gPiA+ID4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+ID4gPiA+ID4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA0KPiA+IA0KPiA+IA0KPiA+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gZHJpLWRldmVsIG1haWxpbmcgbGlzdA0K
PiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA0KPiANCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
