Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF42EE2EE4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 12:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9686E216;
	Thu, 24 Oct 2019 10:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30088.outbound.protection.outlook.com [40.107.3.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13AFB6E209
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 10:29:39 +0000 (UTC)
Received: from VI1PR08CA0111.eurprd08.prod.outlook.com (2603:10a6:800:d4::13)
 by AM6PR08MB3352.eurprd08.prod.outlook.com (2603:10a6:209:4c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17; Thu, 24 Oct
 2019 10:29:36 +0000
Received: from DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::204) by VI1PR08CA0111.outlook.office365.com
 (2603:10a6:800:d4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.20 via Frontend
 Transport; Thu, 24 Oct 2019 10:29:36 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT040.mail.protection.outlook.com (10.152.20.243) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.23 via Frontend Transport; Thu, 24 Oct 2019 10:29:36 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Thu, 24 Oct 2019 10:29:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e37256e9fd77938c
X-CR-MTA-TID: 64aa7808
Received: from 1de29da3d394.2 (cr-mta-lb-1.cr-mta-net [104.47.10.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5BE48767-E7FD-493F-AFF1-67D287FED492.1; 
 Thu, 24 Oct 2019 10:29:28 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2052.outbound.protection.outlook.com [104.47.10.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1de29da3d394.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Thu, 24 Oct 2019 10:29:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q33deolQNpjrwhaAa+PBHloZpiq2A15esXE7zm6sWcJtm0J2TEwU7Q++jg27oNKWAfxbampgzgshHNp3EDXji0lBuXEGHRlr79WAer8be7bg5himNth/vz8DWvV/uWMrfKyrUsQDJdpkxtHyzJmW4p2bSB4I9+OqYebTdRPyqhnbfuhl34DdwTWNYHz8XrIVD90E1LJ5acabODmF8AfDB3bApZRnK6yWN9ueOKfLJqel1Dpx4dnkzUZY3gbPYunDYSyWVpSNu7XVpEyvoe2t5Xq/uuz6fK4rg5AVCyTu8xaFMy5IDjdEWdPvpkxy8NxYQZZ+bOr0HQnxzq9hJ3GCMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWgs3sbC16cn7inaJPJyqJyzSrdVIOpy+Oz7YRfzMBw=;
 b=APk5+4ssos9fhUxxUVMOlZpgiYs23KC3vtG9bIl9ytfJWvaOxefuc6AAvn9mWYQeR1Q/v1SmhozT7+b2OFYAuJ+/tNU2pQ1QgygakdJIWrVO0yWstCsDM1iorn1BGlZ368v/woRB0JOMrcliN23+byjx70hc1nF4wsFbCb+QNNKIC4ylep8w3kubn5Z5hqXJhmcgk0Y0cB9B37OFGm9aA0dMpuU+zqdbV264q4bMX/+9b31FPNqVzs1DPlUFm+yKEB9EtHdDb/4M2l8+z/FNgPfGAfQy7G7PhuM/Di8ZdRQ76HqD4B+IB6qZmvybDvoPdaWEc171RXzKfIRwTDNAgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB5535.eurprd08.prod.outlook.com (10.255.196.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Thu, 24 Oct 2019 10:29:26 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2387.023; Thu, 24 Oct 2019
 10:29:26 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH v7 1/4] drm: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Topic: [PATCH v7 1/4] drm: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Index: AQHViW0fItuU7WZLdkGpC7zJtSS7AadpmFSA
Date: Thu, 24 Oct 2019 10:29:25 +0000
Message-ID: <13265658.8ZLHS0ihAi@e123338-lin>
References: <20191023064226.10969-1-james.qian.wang@arm.com>
 <20191023064226.10969-2-james.qian.wang@arm.com>
In-Reply-To: <20191023064226.10969-2-james.qian.wang@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.51]
x-clientproxiedby: LNXP265CA0041.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::29) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5e0f3bff-fbad-48fe-6489-08d7586d1169
X-MS-TrafficTypeDiagnostic: VI1PR08MB5535:|VI1PR08MB5535:|AM6PR08MB3352:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB335211AC02C58DE8FE01C48E8F6A0@AM6PR08MB3352.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 0200DDA8BE
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(366004)(396003)(346002)(136003)(376002)(189003)(199004)(2906002)(81166006)(81156014)(3846002)(6116002)(316002)(6436002)(8936002)(229853002)(6512007)(4326008)(71190400001)(71200400001)(86362001)(6486002)(9686003)(66446008)(5660300002)(66476007)(66556008)(64756008)(66946007)(54906003)(6506007)(14454004)(386003)(486006)(99286004)(52116002)(11346002)(476003)(478600001)(186003)(76176011)(25786009)(7736002)(305945005)(66066001)(6246003)(6862004)(6636002)(26005)(33716001)(102836004)(256004)(14444005)(8676002)(446003)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB5535;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: WZs7VudCRGUZwCOtpOQ1GXoNknlGfQNoe/YoS8bFWXuAWc9/IJeuOjPuW5EBI0fU+i5ceqg6IO+pvXFRgShyN9ys4IUIsKlZ67nxGdAYayuyoXIajkhfDPJ+o3XjcwZXNlTxrNY/y03ipty6NFIXj6XT2d4r04PRCdOs98bW8AxLL5vc6Q8UaxSCKHzeiIjRwSG76s2qSZdlxHp1auJ88pM3FsvyNY3bo+GEF5Ux6EkgDTJXm4M7xOM/YVauLZKzmWBrhMNd2RMCRMisGLFQWmoqFobT3W44S0VseaCjXe4n7FFtha2t6cLkmnjjrDWJG9FhFf1JKwi1sLSEPA9LY1yVIKLW/IatCuedJRcNI75UTTs44stDBSoSmO0rM5ZDDYdrZfs9XtU9XpHqClwxtucn6E9p5pC7yjncEPaO1pmnlGO3dR2gAGrnf3YUtUij
Content-ID: <F6395156436986419B3320FA6FDDA39F@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5535
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(396003)(136003)(346002)(376002)(1110001)(339900001)(199004)(189003)(25786009)(22756006)(47776003)(8676002)(81156014)(81166006)(7736002)(305945005)(8936002)(86362001)(54906003)(66066001)(14454004)(3846002)(6512007)(336012)(6486002)(76130400001)(229853002)(6116002)(2906002)(9686003)(70586007)(70206006)(50466002)(23676004)(2486003)(76176011)(4326008)(186003)(6636002)(476003)(126002)(486006)(105606002)(6862004)(99286004)(356004)(316002)(26826003)(107886003)(6246003)(33716001)(478600001)(102836004)(436003)(11346002)(446003)(26005)(5660300002)(386003)(14444005)(6506007)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3352;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c6b920f1-f768-4359-7fe3-08d7586d0b2a
NoDisclaimer: True
X-Forefront-PRVS: 0200DDA8BE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zcYLd6JfYSzOE3ab6eNG/ABZ67Np8CqzZdxpwGHhcuBwSjeSfS5yFAtCbZhdJeTywcGTdO8cNx/ZVJ2CyTT1wH4o1gpmLcavt7Vqk5I4nja3yKigX7QKJvphkY2jMPhRIqNVkOX/WVGVD6++q9cnEaFOhow3iNE4Y7tl/TAQMMj4eXaKwGRHX4y28gqCXwq/eJ9Us6t0CI/E3TV5I1K1Hb+Fka9/v46b26SyepcDqpXWgKkmpatY7yjoyVfqf4fq8VMMzdqk2GNj9iXZ3K30g7iQgRPlwzZa1WAeeVn+rz1e587/CL8twl10v67m5dGedDUsDiZ8EdwECvjffWfdObaJb+341cYywb3t0yWSFfpLA+fhPK5kqdFUWAWm9r/MYS7YUm+2dJvmlfZerIlLo6TB0WMyibGwI/GNkMCjD/KMUsENu9w/3JeuQAzTt6S0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2019 10:29:36.2473 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e0f3bff-fbad-48fe-6489-08d7586d1169
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3352
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWgs3sbC16cn7inaJPJyqJyzSrdVIOpy+Oz7YRfzMBw=;
 b=TfHpue/Nck5N+8cdhIrv3+HsT1F4kzylROBaopmny3IB+QSZWxRN65UoZfQFVp5XIsThaj8DgGC8gbIMtVJ6fhK2CfhFzQCP6FD7YbR9UP9IxeCDF0RZ7ebB7OW1JL7n5PDGtIrjzwEN8BHm6ytRRuc2VEppQ+GbTpk0cgtppIs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWgs3sbC16cn7inaJPJyqJyzSrdVIOpy+Oz7YRfzMBw=;
 b=TfHpue/Nck5N+8cdhIrv3+HsT1F4kzylROBaopmny3IB+QSZWxRN65UoZfQFVp5XIsThaj8DgGC8gbIMtVJ6fhK2CfhFzQCP6FD7YbR9UP9IxeCDF0RZ7ebB7OW1JL7n5PDGtIrjzwEN8BHm6ytRRuc2VEppQ+GbTpk0cgtppIs=
X-Mailman-Original-Authentication-Results: spf=fail (sender IP is 63.35.35.123)
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
Cc: "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 Ben Davis <Ben.Davis@arm.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>, nd <nd@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFtZXMsDQoNCllvdSBhbHJlYWR5IGhhdmUgbXkgci1iIG9uIHRoZSBwYXRjaCwgc28gZm9y
IHBvc3Rlcml0eTogbm8gZnVydGhlcg0KaW1wb3J0YW50IGNvbW1lbnRzIGZyb20gbXkgc2lkZS4N
Cg0KT24gV2VkbmVzZGF5LCAyMyBPY3RvYmVyIDIwMTkgMDc6NDI6NTUgQlNUIGphbWVzIHFpYW4g
d2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOg0KPiBBZGQgYSBuZXcgaGVscGVyIGZ1
bmN0aW9uIGRybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24oKSBmb3IgZHJpdmVyIHRvDQo+IGNv
bnZlcnQgUzMxLjMyIHNpZ24tbWFnbml0dWRlIHRvIFFtLm4gMidzIGNvbXBsZW1lbnQgdGhhdCBz
dXBwb3J0ZWQgYnkNCj4gaGFyZHdhcmUuDQo+IA0KPiBWNDogQWRkcmVzcyBNaWhhaSwgRGFuaWVs
IGFuZCBJbGlhJ3MgcmV2aWV3IGNvbW1lbnRzLg0KPiBWNTogSW5jbHVkZXMgdGhlIHNpZ24gYml0
IGluIHRoZSB2YWx1ZSBvZiBtIChRbS5uKS4NCj4gVjY6IEFsbG93cyBtID0gMCBhY2NvcmRpbmcg
dG8gTWloYWlsJ3MgY29tbWVudHMuDQo+IFY2OiBBZGRyZXNzIE1paGFpbCdzIGNvbW1lbnRzLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGlu
YSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPg0KPiBSZXZpZXdlZC1ieTogTWloYWlsIEF0YW5h
c3NvdiA8bWloYWlsLmF0YW5hc3NvdkBhcm0uY29tPg0KPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2NvbG9yX21nbXQuYyB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+
ICBpbmNsdWRlL2RybS9kcm1fY29sb3JfbWdtdC5oICAgICB8ICAyICsrDQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDM4IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2NvbG9yX21nbXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jDQo+
IGluZGV4IDRjZTVjNmQ4ZGU5OS4uZjVmYmE1ODAyYTA3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2NvbG9yX21nbXQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nv
bG9yX21nbXQuYw0KPiBAQCAtMTMyLDYgKzEzMiw0MiBAQCB1aW50MzJfdCBkcm1fY29sb3JfbHV0
X2V4dHJhY3QodWludDMyX3QgdXNlcl9pbnB1dCwgdWludDMyX3QgYml0X3ByZWNpc2lvbikNCj4g
IH0NCj4gIEVYUE9SVF9TWU1CT0woZHJtX2NvbG9yX2x1dF9leHRyYWN0KTsNCj4gIA0KPiArLyoq
DQo+ICsgKiBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uDQo+ICsgKg0KPiArICogQHVzZXJf
aW5wdXQ6IGlucHV0IHZhbHVlDQo+ICsgKiBAbTogbnVtYmVyIG9mIGludGVnZXIgYml0cywgb25s
eSBzdXBwb3J0IG0gPD0gMzIsIGluY2x1ZGUgdGhlIHNpZ24tYml0DQo+ICsgKiBAbjogbnVtYmVy
IG9mIGZyYWN0aW9uYWwgYml0cywgb25seSBzdXBwb3J0IG4gPD0gMzINCj4gKyAqDQo+ICsgKiBD
b252ZXJ0IGFuZCBjbGFtcCBTMzEuMzIgc2lnbi1tYWduaXR1ZGUgdG8gUW0ubiAoc2lnbmVkIDIn
cyBjb21wbGVtZW50KS4NCj4gKyAqIFRoZSBzaWduLWJpdCBCSVQobStuKSBhbmQgYWJvdmUgYXJl
IDAgZm9yIHBvc2l0aXZlIHZhbHVlIGFuZCAxIGZvciBuZWdhdGl2ZS4NCg0KW3JlYWxseSBwZWRh
bnRpY10gbStuLTEgOikNCg0KPiArICogdGhlIHJhbmdlIG9mIHZhbHVlIGlzIFstMl4obS0xKSwg
Ml4obS0xKSAtIDJeLW5dDQo+ICsgKg0KPiArICogRm9yIGV4YW1wbGUNCj4gKyAqIEEgUTMuMTIg
Zm9ybWF0IG51bWJlcjoNCj4gKyAqIC0gcmVxdWlyZWQgYml0OiAzICsgMTIgPSAxNWJpdHMNCj4g
KyAqIC0gcmFuZ2U6IFstMl4yLCAyXjIgLSAyXuKIkjE1XQ0KPiArICoNCj4gKyAqIE5PVEU6IHRo
ZSBtIGNhbiBiZSB6ZXJvIGlmIGFsbCBiaXRfcHJlY2lzaW9uIGFyZSB1c2VkIHRvIHByZXNlbnQg
ZnJhY3Rpb25hbA0KPiArICogICAgICAgYml0cyBsaWtlIFEwLjMyDQo+ICsgKi8NCj4gK3VpbnQ2
NF90IGRybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24odWludDY0X3QgdXNlcl9pbnB1dCwNCj4g
KwkJCQkgICAgICB1aW50MzJfdCBtLCB1aW50MzJfdCBuKQ0KPiArew0KPiArCXU2NCBtYWcgPSAo
dXNlcl9pbnB1dCAmIH5CSVRfVUxMKDYzKSkgPj4gKDMyIC0gbik7DQo+ICsJYm9vbCBuZWdhdGl2
ZSA9ICEhKHVzZXJfaW5wdXQgJiBCSVRfVUxMKDYzKSk7DQo+ICsJczY0IHZhbDsNCj4gKw0KPiAr
CVdBUk5fT04obSA+IDMyIHx8IG4gPiAzMik7DQo+ICsNCj4gKw0KPiArCXZhbCA9IGNsYW1wX3Zh
bChtYWcsIDAsIG5lZ2F0aXZlID8NCj4gKwkJCQlCSVRfVUxMKG4gKyBtIC0gMSkgOiBCSVRfVUxM
KG4gKyBtIC0gMSkgLSAxKTsNCj4gKw0KPiArCXJldHVybiBuZWdhdGl2ZSA/IC12YWwgOiB2YWw7
DQo+ICt9DQo+ICtFWFBPUlRfU1lNQk9MKGRybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24pOw0K
PiArDQo+ICAvKioNCj4gICAqIGRybV9jcnRjX2VuYWJsZV9jb2xvcl9tZ210IC0gZW5hYmxlIGNv
bG9yIG1hbmFnZW1lbnQgcHJvcGVydGllcw0KPiAgICogQGNydGM6IERSTSBDUlRDDQo+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2RybS9kcm1fY29sb3JfbWdtdC5oIGIvaW5jbHVkZS9kcm0vZHJtX2Nv
bG9yX21nbXQuaA0KPiBpbmRleCBkMWM2NjJkOTJhYjcuLjYwZmVhNTUwMTg4NiAxMDA2NDQNCj4g
LS0tIGEvaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaA0KPiArKysgYi9pbmNsdWRlL2RybS9k
cm1fY29sb3JfbWdtdC5oDQo+IEBAIC0zMCw2ICszMCw4IEBAIHN0cnVjdCBkcm1fY3J0YzsNCj4g
IHN0cnVjdCBkcm1fcGxhbmU7DQo+ICANCj4gIHVpbnQzMl90IGRybV9jb2xvcl9sdXRfZXh0cmFj
dCh1aW50MzJfdCB1c2VyX2lucHV0LCB1aW50MzJfdCBiaXRfcHJlY2lzaW9uKTsNCj4gK3VpbnQ2
NF90IGRybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24odWludDY0X3QgdXNlcl9pbnB1dCwNCj4g
KwkJCQkgICAgICB1aW50MzJfdCBtLCB1aW50MzJfdCBuKTsNCj4gIA0KPiAgdm9pZCBkcm1fY3J0
Y19lbmFibGVfY29sb3JfbWdtdChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsDQo+ICAJCQkJdWludCBk
ZWdhbW1hX2x1dF9zaXplLA0KPiAtLSANCj4gMi4yMC4xDQo+IA0KPiANCg0KDQotLSANCk1paGFp
bA0KDQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
