Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4F1D39DE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 09:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578F86EBA9;
	Fri, 11 Oct 2019 07:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80089.outbound.protection.outlook.com [40.107.8.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B0F6EBA9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 07:12:40 +0000 (UTC)
Received: from AM6PR08CA0045.eurprd08.prod.outlook.com (2603:10a6:20b:c0::33)
 by DB6PR0802MB2136.eurprd08.prod.outlook.com (2603:10a6:4:81::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Fri, 11 Oct
 2019 07:12:34 +0000
Received: from DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::203) by AM6PR08CA0045.outlook.office365.com
 (2603:10a6:20b:c0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 07:12:34 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT037.mail.protection.outlook.com (10.152.20.215) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 11 Oct 2019 07:12:31 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Fri, 11 Oct 2019 07:12:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a014936e94c80f0e
X-CR-MTA-TID: 64aa7808
Received: from aa8d4a768246.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A82A7821-9633-4A47-9D58-4CF82F8FADF4.1; 
 Fri, 11 Oct 2019 07:12:17 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2052.outbound.protection.outlook.com [104.47.9.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aa8d4a768246.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 11 Oct 2019 07:12:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=coPrA+y67JeHmmXPbrAv2wMjYjlMCmXr+DyDtcnuAkeJ6aqVRGmhEkbtOFjnVWG4s18+s0OG1859MM1J/phL71nCJmvs0v4Zgyv7wZ7DgaC8VPG3A7HyEXAQy8k/EbR68nJyqxytjnHx0DA9yoWx+3rBdJ8wyWqszzq4tgaAb4Ff+7jiAP8SasViyvopEhOcjWXOOFLn3ACbBVfLnLIp/JaCviOuU3aOvFDEorbwSKWb4aszx5ojeuwWYVOtii+GRniX+HfnzcKo4d5wHGQsF0jqXxxv5nYuVxXuBYATYiRLvstVGVZc8uM/nBvqUFvSoFnaf9LDuXmNrUr0HtTmOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fm3vnN5HbePm4A6Yc7Jwys5RWeIR7P8tKLdqlMvfyIE=;
 b=Px0E/QQvOlGNoJq+VsDSZuEs6+H8GdKqP3x4EuL6bcUugjykfRYPcLwGPcaSyjfzw78zhuCi0iHhD6ZOlWFAo9twZKi2pfwfhhTSg39jnRDKsE96SVF6Y1IE7/88DscQ5+drKJplYsJT++KDKykYJNFEmDHgJmiH2oZNz14M338CzRPiO7yX0J6/5tRZhbYW5eCWzHetKp3ctnmPUhnyjmKNg6x/F4aWTqD5QOLocuCv+zjiOD2f9gnclW/wIIBTpj8Ez07YTf7+435fzFQ0L9Nw06jLWUa9+Dj3WFvyWc15IhnzTTIOk0jl5AcwBdw4tSZMuLjSzazDSGmgPITw9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4638.eurprd08.prod.outlook.com (10.255.27.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 07:12:13 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 07:12:13 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: sandy.huang <hjc@rock-chips.com>
Subject: Re: [PATCH v2 4/4] drm/komeda: Adds gamma and color-transform support
 for DOU-IPS
Thread-Topic: [PATCH v2 4/4] drm/komeda: Adds gamma and color-transform
 support for DOU-IPS
Thread-Index: AQHVf/bQ8wvdbeg7lUSqVOfgqlbTpKdU+FqAgAAOGAA=
Date: Fri, 11 Oct 2019 07:12:13 +0000
Message-ID: <20191011071206.GA20025@jamwan02-TSP300>
References: <20191011054240.17782-1-james.qian.wang@arm.com>
 <20191011054240.17782-5-james.qian.wang@arm.com>
 <08492df8-11d9-c580-94f6-7868602c12c3@rock-chips.com>
In-Reply-To: <08492df8-11d9-c580-94f6-7868602c12c3@rock-chips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2P15301CA0024.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::34) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2bd25e84-0f40-44ab-c178-08d74e1a6203
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4638:|VE1PR08MB4638:|DB6PR0802MB2136:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0802MB2136C23A67E916416DE2DFC5B3970@DB6PR0802MB2136.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 0187F3EA14
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(376002)(366004)(136003)(396003)(346002)(199004)(189003)(76176011)(86362001)(486006)(54906003)(33716001)(99286004)(102836004)(476003)(11346002)(316002)(446003)(52116002)(58126008)(5660300002)(6506007)(2906002)(14444005)(256004)(55236004)(71200400001)(71190400001)(1076003)(66446008)(66556008)(66476007)(64756008)(386003)(6916009)(81156014)(81166006)(6246003)(6486002)(33656002)(25786009)(26005)(186003)(66946007)(305945005)(8936002)(4326008)(7736002)(66066001)(3846002)(6116002)(229853002)(8676002)(6512007)(9686003)(6436002)(14454004)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4638;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 5M1QrJbqEODcWZAxnnYhXkKBeRt3SU2z/Vf+hbpPjbUez3YflZjrEA9z1gl9dOFMia+ICk2EyxWjwgJ04ZexxFppR/cAcmMPaTTjd5cUQyQMP6ByWScuUeWg63ipfRTOx/0rgZCwhE82JMlZvc24Zm0nZknkEWQCsO4WrulmJWm8ctYBc2ywfYXPPDqaSwYCho2l2rQiz0LaHS7akf3+FJ2mW09GDGUZT5/ZH2Xee5R288E0nDVze4WhBGQP3dw+Zpkood4z2+R8WWaWf0qz5eGYO0KyvxHVmw95e/cy013i7I//zf5wIXHZkxGh5kt8aceW5tA7tGBIBjKJQ6O1SsjPGB3F11Yrc1mqP1nFGtew8rD1BtGQdr+uYY4CaxOW5lWUFkLCzZlsv2dx3EN0smlg2tIO/AZq0OvqP989Kyc=
Content-ID: <5DD93598BBB24F47903753863994DC69@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4638
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(136003)(396003)(376002)(346002)(39860400002)(199004)(189003)(70206006)(6862004)(6246003)(50466002)(33656002)(76130400001)(54906003)(70586007)(58126008)(316002)(14454004)(6512007)(9686003)(6486002)(356004)(25786009)(26826003)(7736002)(478600001)(22756006)(66066001)(47776003)(4326008)(126002)(14444005)(305945005)(6506007)(386003)(63350400001)(2906002)(6116002)(11346002)(99286004)(26005)(486006)(476003)(446003)(3846002)(81166006)(8676002)(81156014)(436003)(8936002)(76176011)(86362001)(1076003)(2486003)(336012)(23676004)(229853002)(102836004)(186003)(5660300002)(33716001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0802MB2136;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5365cbab-d7ee-4793-a693-08d74e1a56ed
NoDisclaimer: True
X-Forefront-PRVS: 0187F3EA14
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ucDOJMLLGIc+B47CQV7UWtBymF3GPFKWDIVW4J/PxWbaQVttCtKCO4UO7FSIu5A8mu67AzaxL4x0YeJ/VCaP0GwiSOdotLbNmqTZJ65wdSKX/HY4EXX+ESFQ0Bd2gGdyVMgAkIOMcc41YHFNn030PuDP7LGGCHzuwVDJTLze8PoC1KrZtG7XxHvYn/FatSZnvTZAVPvAd35IUMJS5lMpeC4piAFFZlYZVS5Nw1LHBe1fS+PYB+QEXzRdjk8DjI5N58Z/HXVdID+SO8deXSOQZAvLWdl2RXWSofwu3d9rXu/2AIJHOwnVJKQkIXY1rrnkvBjQqm1YKNyTPAaLzp8rWEjUT+4OTEL/h2rIG0c0wnOt6LWZ7nL13R09kDSEeEh9mW7GsNX5Ps63x0Ar5KmgMi5PwekkMOkHjnAc9BM4m5w=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 07:12:31.6093 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd25e84-0f40-44ab-c178-08d74e1a6203
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2136
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fm3vnN5HbePm4A6Yc7Jwys5RWeIR7P8tKLdqlMvfyIE=;
 b=1wUqfct6A7RAAYzYb43RdDOwOEiYkNwxHxvWoGc0rH5w56fep9ZplXzia3AXLs9oIo2KF89jQVm93rBQEOUh6/CKLqxlVCTuXi3GvyC6Tbexevq9IGXrCGsi0xlDjKEZrvAETYPW7DolyH8uVSUjOn5bHkEX6x3Oeqv9yrmGUv4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fm3vnN5HbePm4A6Yc7Jwys5RWeIR7P8tKLdqlMvfyIE=;
 b=1wUqfct6A7RAAYzYb43RdDOwOEiYkNwxHxvWoGc0rH5w56fep9ZplXzia3AXLs9oIo2KF89jQVm93rBQEOUh6/CKLqxlVCTuXi3GvyC6Tbexevq9IGXrCGsi0xlDjKEZrvAETYPW7DolyH8uVSUjOn5bHkEX6x3Oeqv9yrmGUv4=
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
Cc: Ayan Halder <Ayan.Halder@arm.com>,
 "Oscar Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "Yiqi Kang \(Arm Technology
 China\)" <Yiqi.Kang@arm.com>, Ben Davis <Ben.Davis@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>, nd <nd@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMDI6MjE6MzlQTSArMDgwMCwgc2FuZHkuaHVhbmcgd3Jv
dGU6DQo+IA0KPiDlnKggMjAxOS8xMC8xMSDkuIvljYgxOjQzLCBqYW1lcyBxaWFuIHdhbmcgKEFy
bSBUZWNobm9sb2d5IENoaW5hKSDlhpnpgZM6DQo+ID4gRnJvbTogIkxvd3J5IExpIChBcm0gVGVj
aG5vbG9neSBDaGluYSkiIDxMb3dyeS5MaUBhcm0uY29tPg0KPiA+IA0KPiA+IEFkZHMgZ2FtbWEg
YW5kIGNvbG9yLXRyYW5zZm9ybSBzdXBwb3J0IGZvciBET1UtSVBTLg0KPiA+IEFkZHMgdHdvIGNh
cHMgbWVtYmVycyBmZ2FtbWFfY29lZmZzIGFuZCBjdG1fY29lZmZzIHRvIGtvbWVkYV9pbXByb2Nf
c3RhdGUuDQo+ID4gSWYgY29sb3IgbWFuYWdlbWVudCBjaGFuZ2VkLCBzZXQgZ2FtbWEgYW5kIGNv
bG9yLXRyYW5zZm9ybSBhY2NvcmRpbmdseS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBMb3dy
eSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxsb3dyeS5saUBhcm0uY29tPg0KPiA+IC0tLQ0K
PiA+ICAgLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jICAgIHwgMjQg
KysrKysrKysrKysrKysrKysrKw0KPiA+ICAgLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9jcnRjLmMgIHwgIDIgKysNCj4gPiAgIC4uLi9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9waXBlbGluZS5oICB8ICAzICsrKw0KPiA+ICAgLi4uL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9waXBlbGluZV9zdGF0ZS5jICAgIHwgIDYgKysrKysNCj4gPiAgIDQgZmlsZXMgY2hhbmdl
ZCwgMzUgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMNCj4gPiBpbmRleCBjM2Qy
OWMwYjA1MWIuLmU3ZTVhOGU0NDMwZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMNCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMNCj4gPiBAQCAt
OTQyLDE1ICs5NDIsMzkgQEAgc3RhdGljIGludCBkNzFfbWVyZ2VyX2luaXQoc3RydWN0IGQ3MV9k
ZXYgKmQ3MSwNCj4gPiAgIHN0YXRpYyB2b2lkIGQ3MV9pbXByb2NfdXBkYXRlKHN0cnVjdCBrb21l
ZGFfY29tcG9uZW50ICpjLA0KPiA+ICAgCQkJICAgICAgc3RydWN0IGtvbWVkYV9jb21wb25lbnRf
c3RhdGUgKnN0YXRlKQ0KPiA+ICAgew0KPiA+ICsJc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRj
X3N0ID0gc3RhdGUtPmNydGMtPnN0YXRlOw0KPiA+ICAgCXN0cnVjdCBrb21lZGFfaW1wcm9jX3N0
YXRlICpzdCA9IHRvX2ltcHJvY19zdChzdGF0ZSk7DQo+ID4gKwlzdHJ1Y3QgZDcxX3BpcGVsaW5l
ICpwaXBlID0gdG9fZDcxX3BpcGVsaW5lKGMtPnBpcGVsaW5lKTsNCj4gPiAgIAl1MzIgX19pb21l
bSAqcmVnID0gYy0+cmVnOw0KPiA+ICAgCXUzMiBpbmRleDsNCj4gPiArCXUzMiBtYXNrID0gMCwg
Y3RybCA9IDA7DQo+ID4gICAJZm9yX2VhY2hfY2hhbmdlZF9pbnB1dChzdGF0ZSwgaW5kZXgpDQo+
ID4gICAJCW1hbGlkcF93cml0ZTMyKHJlZywgQkxLX0lOUFVUX0lEMCArIGluZGV4ICogNCwNCj4g
PiAgIAkJCSAgICAgICB0b19kNzFfaW5wdXRfaWQoc3RhdGUsIGluZGV4KSk7DQo+ID4gICAJbWFs
aWRwX3dyaXRlMzIocmVnLCBCTEtfU0laRSwgSFZfU0laRShzdC0+aHNpemUsIHN0LT52c2l6ZSkp
Ow0KPiA+ICsNCj4gPiArCWlmIChjcnRjX3N0LT5jb2xvcl9tZ210X2NoYW5nZWQpIHsNCj4gPiAr
CQltYXNrIHw9IElQU19DVFJMX0ZUIHwgSVBTX0NUUkxfUkdCOw0KDQpOT1RFOiBvbmx5IHdoZW4g
Y29sb3JfbWdtdF9jaGFuZ2VkIHdlIG1hcmsgdGhlIG1hc2sNCg0KPiA+ICsNCj4gPiArCQlpZiAo
Y3J0Y19zdC0+Z2FtbWFfbHV0KSB7DQo+ID4gKwkJCW1hbGlkcF93cml0ZV9ncm91cChwaXBlLT5k
b3VfZnRfY29lZmZfYWRkciwgRlRfQ09FRkYwLA0KPiA+ICsJCQkJCSAgIEtPTUVEQV9OX0dBTU1B
X0NPRUZGUywNCj4gPiArCQkJCQkgICBzdC0+ZmdhbW1hX2NvZWZmcyk7DQo+ID4gKwkJCWN0cmwg
fD0gSVBTX0NUUkxfRlQ7IC8qIGVuYWJsZSBnYW1tYSAqLw0KDQpIZXJlIHdlIGVuYWJsZSB0aGUg
Z2FtbWEsIGlmIHRoZSBjaGFuZ2UgaW5jbHVkZSBnYW1tYV9sdXQgdXBkYXRpbmcsDQphbmQgaWYg
Z2FtbXVfbHV0IGlzIE5VTEwsIHRoZSBFbi1HYW1tYSBiaXQgaXMgMCwgYW5kIGdhbW1hIHdpbGwg
YmUNCmRpc2FibGVkDQoNCj4gPiArCQl9DQo+ID4gKw0KPiA+ICsJCWlmIChjcnRjX3N0LT5jdG0p
IHsNCj4gPiArCQkJbWFsaWRwX3dyaXRlX2dyb3VwKHJlZywgSVBTX1JHQl9SR0JfQ09FRkYwLA0K
PiA+ICsJCQkJCSAgIEtPTUVEQV9OX0NUTV9DT0VGRlMsDQo+ID4gKwkJCQkJICAgc3QtPmN0bV9j
b2VmZnMpOw0KPiA+ICsJCQljdHJsIHw9IElQU19DVFJMX1JHQjsgLyogZW5hYmxlIGdhbXV0ICov
DQo+ID4gKwkJfQ0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCWlmIChtYXNrKQ0KPiA+ICsJCW1hbGlk
cF93cml0ZTMyX21hc2socmVnLCBCTEtfQ09OVFJPTCwgbWFzaywgY3RybCk7DQoNCldlIGRvIGhh
dmUgdGhlIHN1cHBvcnQgdG8gZGlzYWJsZSBnYW1tYS9nYW11dC4NCg0KdGhlIGN0cmwgaXMgZm9y
IGVuL2RpcyBnYW1tYS9nYW11dCwgdGhlIG1hc2sgaXMgZm9yIGluZGljYXRpbmcgd2hpY2ggY3Ry
bA0KYml0cyBuZWVkIHRvIGJlIHVwZGF0ZWQuDQpTZWUgbXkgY29tbWVudHMgaW4gdGhlIGNvZGUu
DQoNClRoYW5rcw0KamFtZXMNCg0KPiA+ICAgfQ0KPiBUaGVyZSBpcyBubyBuZWVkIG9yIG5vIG1l
dGhvZCB0byBkaXNhYmxlL2J5cGFzcyB0aGUgZ2FtbWEgYW5kIGdhbXV0Pw0KPiA+ICAgc3RhdGlj
IHZvaWQgZDcxX2ltcHJvY19kdW1wKHN0cnVjdCBrb21lZGFfY29tcG9uZW50ICpjLCBzdHJ1Y3Qg
c2VxX2ZpbGUgKnNmKQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jcnRjLmMNCj4gPiBpbmRleCA5YmVlZGEwNDgxOGIuLjQwNmI5ZDBjYTA1OCAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9jcnRjLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9jcnRjLmMNCj4gPiBAQCAtNTkwLDYgKzU5MCw4IEBAIHN0YXRpYyBpbnQga29tZWRhX2Ny
dGNfYWRkKHN0cnVjdCBrb21lZGFfa21zX2RldiAqa21zLA0KPiA+ICAgCWNydGMtPnBvcnQgPSBr
Y3J0Yy0+bWFzdGVyLT5vZl9vdXRwdXRfcG9ydDsNCj4gPiArCWRybV9jcnRjX2VuYWJsZV9jb2xv
cl9tZ210KGNydGMsIDAsIHRydWUsIEtPTUVEQV9DT0xPUl9MVVRfU0laRSk7DQo+ID4gKw0KPiA+
ICAgCXJldHVybiBlcnI7DQo+ID4gICB9DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmggYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oDQo+ID4gaW5kZXggYjMyMmY1MmJh
OGYyLi5jNWFiODA5NmM4NWQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgNCj4gPiBAQCAtMTEsNiArMTEs
NyBAQA0KPiA+ICAgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljLmg+DQo+ID4gICAjaW5jbHVkZSA8
ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+DQo+ID4gICAjaW5jbHVkZSAibWFsaWRwX3V0aWxzLmgi
DQo+ID4gKyNpbmNsdWRlICJrb21lZGFfY29sb3JfbWdtdC5oIg0KPiA+ICAgI2RlZmluZSBLT01F
REFfTUFYX1BJUEVMSU5FUwkJMg0KPiA+ICAgI2RlZmluZSBLT01FREFfUElQRUxJTkVfTUFYX0xB
WUVSUwk0DQo+ID4gQEAgLTMyNCw2ICszMjUsOCBAQCBzdHJ1Y3Qga29tZWRhX2ltcHJvYyB7DQo+
ID4gICBzdHJ1Y3Qga29tZWRhX2ltcHJvY19zdGF0ZSB7DQo+ID4gICAJc3RydWN0IGtvbWVkYV9j
b21wb25lbnRfc3RhdGUgYmFzZTsNCj4gPiAgIAl1MTYgaHNpemUsIHZzaXplOw0KPiA+ICsJdTMy
IGZnYW1tYV9jb2VmZnNbS09NRURBX05fR0FNTUFfQ09FRkZTXTsNCj4gPiArCXUzMiBjdG1fY29l
ZmZzW0tPTUVEQV9OX0NUTV9DT0VGRlNdOw0KPiA+ICAgfTsNCj4gPiAgIC8qIGRpc3BsYXkgdGlt
aW5nIGNvbnRyb2xsZXIgKi8NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMNCj4gPiBpbmRleCAwYmE5
YzZhYTM3MDguLjRhNDBiMzdlYjFhNiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jDQo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYw0K
PiA+IEBAIC03NTYsNiArNzU2LDEyIEBAIGtvbWVkYV9pbXByb2NfdmFsaWRhdGUoc3RydWN0IGtv
bWVkYV9pbXByb2MgKmltcHJvYywNCj4gPiAgIAlzdC0+aHNpemUgPSBkZmxvdy0+aW5fdzsNCj4g
PiAgIAlzdC0+dnNpemUgPSBkZmxvdy0+aW5faDsNCj4gPiArCWlmIChrY3J0Y19zdC0+YmFzZS5j
b2xvcl9tZ210X2NoYW5nZWQpIHsNCj4gPiArCQlkcm1fbHV0X3RvX2ZnYW1tYV9jb2VmZnMoa2Ny
dGNfc3QtPmJhc2UuZ2FtbWFfbHV0LA0KPiA+ICsJCQkJCSBzdC0+ZmdhbW1hX2NvZWZmcyk7DQo+
ID4gKwkJZHJtX2N0bV90b19jb2VmZnMoa2NydGNfc3QtPmJhc2UuY3RtLCBzdC0+Y3RtX2NvZWZm
cyk7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICAgCWtvbWVkYV9jb21wb25lbnRfYWRkX2lucHV0KCZz
dC0+YmFzZSwgJmRmbG93LT5pbnB1dCwgMCk7DQo+ID4gICAJa29tZWRhX2NvbXBvbmVudF9zZXRf
b3V0cHV0KCZkZmxvdy0+aW5wdXQsICZpbXByb2MtPmJhc2UsIDApOw0KPiANCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
