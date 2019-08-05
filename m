Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F27E81789
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 12:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9C06E3EF;
	Mon,  5 Aug 2019 10:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20072.outbound.protection.outlook.com [40.107.2.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7886E3EF
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 10:51:22 +0000 (UTC)
Received: from VI1PR08CA0202.eurprd08.prod.outlook.com (2603:10a6:800:d2::32)
 by AM6PR08MB4949.eurprd08.prod.outlook.com (2603:10a6:20b:e1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.17; Mon, 5 Aug
 2019 10:51:18 +0000
Received: from AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by VI1PR08CA0202.outlook.office365.com
 (2603:10a6:800:d2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.16 via Frontend
 Transport; Mon, 5 Aug 2019 10:51:17 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT027.mail.protection.outlook.com (10.152.16.138) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 5 Aug 2019 10:51:16 +0000
Received: ("Tessian outbound a1fd2c3cfdb0:v26");
 Mon, 05 Aug 2019 10:51:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 89d3ce80520094a3
X-CR-MTA-TID: 64aa7808
Received: from ec15a0420cc0.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.6.58]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AF883D48-FC23-4FBC-9719-306D82443E68.1; 
 Mon, 05 Aug 2019 10:51:07 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2058.outbound.protection.outlook.com [104.47.6.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ec15a0420cc0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Aug 2019 10:51:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GaBDYDqREIVQP8g/BB8SxsW7QwLBPmUZXfw40+0tYr22ZRazQXqxjnGzzw9YnKdOcV+ODXc+oAspcZzXPxQQxMNyteyPzVcuG3B5S774VQ51Me6wqrUG8rIHOQl4NLoaHu5TqXdjYji04ayq2s+df852MAowB0RHGIdHiQXbY8bjJjAtO51Caub3XfAgz31C9yLybJrsOIGzwZwFXqPHOmgnrWC2RREkbchc2Q1fcsPB8FQ/h7NSfx7giMzzSspMYRjxeQFsQ6nDUq7U/cBDkZ6fVmUm+E8yPfIhUDPeS4Yw52f6CTrrllhvhCMZlqZoxN464+yE9CfAe6sR7LsPxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Qispqwdf93MAfQ9KIIb6CQTRB/sz+7W15etrJpUK3s=;
 b=fxxuGftAh5XUe5vj/0Xg43wnnZpfZyQDGKwm1WncGSuwAfbOTfLALugvrjJTLylzKjYjkvTToTOzEuSQlCQOHmf4mUWI+uTy91yXNE82nujF6r9SLZpOGLFwyNmZ4IhPLTa+vvYuKGcDsVDieL8Hlyxcy25cBsshwLdcyfB6V2DY6qoPT1CaXEqfDwfFcxzZdvmrmBRGgroxkObgc5FZPhGpg50RXPrPR9buZ+TedwD0DB3S4KG8nszaiBwwLjcL5ZEZeyA2IRgmGce9SlKrpFKNt8e5eCOYlbcizqpVwVnpzAz179kdcM7EGJz/zrc29qMTrxqdKqi+lgY7OuMDvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB2925.eurprd08.prod.outlook.com (10.170.239.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 10:51:04 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236%2]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 10:51:04 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH] drm/komeda: Adds internal bpp computing for arm afbc only
 format YU08 YU10
Thread-Topic: [PATCH] drm/komeda: Adds internal bpp computing for arm afbc
 only format YU08 YU10
Thread-Index: AQHVQ4beFTTy2Dg0kUOV3ws9alTcfqbc31qAgA+Q6oA=
Date: Mon, 5 Aug 2019 10:51:04 +0000
Message-ID: <20190805105057.GA19942@lowry.li@arm.com>
References: <1564127450-22601-1-git-send-email-lowry.li@arm.com>
 <20190726130822.GO15612@e110455-lin.cambridge.arm.com>
In-Reply-To: <20190726130822.GO15612@e110455-lin.cambridge.arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.5.21 (2010-09-15)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0116.apcprd03.prod.outlook.com
 (2603:1096:203:b0::32) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 003a6ea5-7b8f-4bab-c6ee-08d71992d744
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB2925; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB2925:|AM6PR08MB4949:
X-Microsoft-Antispam-PRVS: <AM6PR08MB494943BD404FF4DFD153967D9FDA0@AM6PR08MB4949.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 01208B1E18
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(199004)(189003)(51914003)(316002)(6246003)(6506007)(33656002)(55236004)(478600001)(6862004)(68736007)(386003)(2906002)(53936002)(1076003)(102836004)(81166006)(8936002)(81156014)(256004)(14454004)(5660300002)(25786009)(305945005)(7736002)(86362001)(71190400001)(71200400001)(8676002)(6116002)(3846002)(99286004)(6636002)(66476007)(66556008)(64756008)(66446008)(66946007)(186003)(4326008)(54906003)(36756003)(58126008)(6436002)(6486002)(446003)(9686003)(6512007)(52116002)(11346002)(486006)(476003)(76176011)(61793004)(66066001)(26005)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2925;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: V7ASc+IdxYBBiCcdJP3nqa7RZNbp0BKrIQptHV3urJO9glM0+zTaS2cUEOuLxaGEutuX4IaMa8GlFJZF7Y65JMxa6G3FbhKEaioKLy0QudPcqrL+0Mn8Eoc6F9hsau+/neku7X5W8pcmB0ygHMtrQPJ9TH/udWqTFmK88++6Oa3APsuZ/uoWv9os5Hx5tLTc/L4V8U/IJt5zyCmi8bOjKMBjnu/S5uOrpywFu8fpPoo3HewkCH3Wf69i4qxrhqN5KzJ2nKSLmXpjezBh60vlPXFqiTSLi4OkV2PADaJ5SYtxudfDdQU1EvNP/Nn+XXxclDH2AM0iW8JJVvsroEuxmJq/mkEUGUaH+Hwm8a23WDjjZkTEZN106I8AHOfvYgtnF0UWoGJWunkomBiN5qrO2REJeZPTyqY4RcbDADRItU4=
Content-ID: <D9438CEDD1B78144BA5E9EA3EE75400B@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2925
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(346002)(136003)(2980300002)(189003)(199004)(51914003)(26826003)(316002)(76176011)(6486002)(63350400001)(229853002)(26005)(76130400001)(63370400001)(36906005)(356004)(6506007)(386003)(2906002)(70206006)(70586007)(436003)(102836004)(6512007)(9686003)(61793004)(58126008)(1076003)(25786009)(22756006)(14454004)(33656002)(66066001)(6862004)(81156014)(81166006)(126002)(11346002)(6636002)(476003)(336012)(6246003)(7736002)(36756003)(446003)(54906003)(99286004)(8676002)(305945005)(2486003)(23676004)(5660300002)(50466002)(478600001)(47776003)(8936002)(486006)(86362001)(4326008)(3846002)(186003)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4949;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8b82bc3b-4e5c-4144-b8a4-08d71992cfe7
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR08MB4949; 
NoDisclaimer: True
X-Forefront-PRVS: 01208B1E18
X-Microsoft-Antispam-Message-Info: A2i2ZT2kZErDGz4B+1V2V63n7IQ5nYSIhqssJLPjZqLbeO5Mtqbztx1WCLgD6favszV5I6al1nE1Kqbsth9ybQ0CBLBFWEMYgVsCfW8UmlTadoBt8EaCk9pYgH4mm7GWOF1tP6Ag17X1sSWCaahJ14YyGnmHR1afbqkUQMv2W9oAPNfHLckwy1Ygm9JFlhIa3oPixbBxPdro9XjQKfR03Nd4ueKv8gap4O12gL6Y6et6rvX5kSpt+YuVHNrTq9Y8pQ7Cb0kBnesuBBY1eXGgda1a+gPLtWiR1WnYFtSb2BRRfUmoX5OA1n/c8pWp2mpEKy222gYlN4vwIaYeyAabFC37sp5fn1w0EzCn0QwOyquPlq5/PYYpAlnPumOmFmCShwRJzbFAvZiG6opEhWFy58XfJZblN+56LODICdJjfbY=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2019 10:51:16.2822 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 003a6ea5-7b8f-4bab-c6ee-08d71992d744
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4949
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Qispqwdf93MAfQ9KIIb6CQTRB/sz+7W15etrJpUK3s=;
 b=YRr+LtQ9Vze+8vuUhg61Ud9iATMK8cog9LR3h3WJphmEWT2F/kI0Zmhl8Au2hOTDPmOFXFU4wZWYeZae1KqmpSrLQ3+sBghWulBHxzDrNiRneIEH2igewDR/vPqbIBdX2A3oTcisR1R9JBH1GD7n7MUXq4Wi8cxh6S6VAh942qs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Qispqwdf93MAfQ9KIIb6CQTRB/sz+7W15etrJpUK3s=;
 b=YRr+LtQ9Vze+8vuUhg61Ud9iATMK8cog9LR3h3WJphmEWT2F/kI0Zmhl8Au2hOTDPmOFXFU4wZWYeZae1KqmpSrLQ3+sBghWulBHxzDrNiRneIEH2igewDR/vPqbIBdX2A3oTcisR1R9JBH1GD7n7MUXq4Wi8cxh6S6VAh942qs=
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
Cc: nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGl2aXUsDQoNCk9uIEZyaSwgSnVsIDI2LCAyMDE5IGF0IDAxOjA4OjIzUE0gKzAwMDAsIExp
dml1IER1ZGF1IHdyb3RlOg0KPiBIaSBMb3dyeSwNCj4gDQo+IE9uIEZyaSwgSnVsIDI2LCAyMDE5
IGF0IDA3OjUxOjAyQU0gKzAwMDAsIExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3Jv
dGU6DQo+ID4gVGhlIGRybV9mb3JtYXRfaW5mbyBkb2Vzbid0IGhhdmUgYW55IGNwcCBvciBibG9j
a19zaXplIChib3RoIGFyZSB6ZXJvKQ0KPiA+IGluZm9ybWF0aW9uIGZvciBhcm0gb25seSBhZmJj
IGZvcm1hdCBZVTA4L1lVMTAuIHdlIG5lZWQgdG8gY29tcHV0ZSBpdA0KPiA+IGJ5IG91cnNlbHZl
cy4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hp
bmEpIDxsb3dyeS5saUBhcm0uY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfZm9ybWF0X2NhcHMuYyAgICB8IDIzICsrKysrKysrKysrKysrKysrKysr
KysNCj4gPiAgLi4uL2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmgg
ICAgfCAgMyArKysNCj4gPiAgLi4uL2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1l
YnVmZmVyLmMgICAgfCAgNiArKysrLS0NCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mb3JtYXRfY2Fwcy5jIGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZm9ybWF0X2NhcHMuYw0KPiA+IGluZGV4
IGNkNGQ5ZjUuLjNjOWUwNjAgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfZm9ybWF0X2NhcHMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmMNCj4gPiBAQCAtMzUs
NiArMzUsMjkgQEANCj4gPiAgCXJldHVybiBOVUxMOw0KPiA+ICB9DQo+ID4gIA0KPiA+ICt1MzIg
a29tZWRhX2dldF9hZmJjX2Zvcm1hdF9icHAoY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAq
aW5mbywgdTY0IG1vZGlmaWVyKQ0KPiA+ICt7DQo+ID4gKwl1MzIgYnBwOw0KPiA+ICsNCj4gPiAr
CVdBUk5fT04obW9kaWZpZXIgPT0gRFJNX0ZPUk1BVF9NT0RfTElORUFSKTsNCj4gDQo+IElzIGl0
IG5vdCBiZXR0ZXIgdG8gcmV0dXJuIHRoZSB2YWx1ZSBmcm9tIGluZm8tPmNoYXJfcGVyX2Jsb2Nr
IGlmIG1vZGlmaWVyIGlzDQo+IERSTV9GT1JNQVRfTU9EX0xJTkVBUj8gT3IgcmV0dXJuIDA/DQpU
aGlzIGZ1bmN0aW9uIGlzIG9ubHkgd29ya2luZyBmb3IgdGhlIGFmYmMgZm9ybWF0IGFuZCB3aWxs
IHJlbW92ZSB0aGlzDQpXQVJOX09OIGNoZWNrLg0KPiA+ICsNCj4gPiArCXN3aXRjaCAoaW5mby0+
Zm9ybWF0KSB7DQo+ID4gKwljYXNlIERSTV9GT1JNQVRfWVVWNDIwXzhCSVQ6DQo+ID4gKwkJYnBw
ID0gMTI7DQo+ID4gKwkJYnJlYWs7DQo+ID4gKwljYXNlIERSTV9GT1JNQVRfWVVWNDIwXzEwQklU
Og0KPiA+ICsJCWJwcCA9IDE1Ow0KPiA+ICsJCWJyZWFrOw0KPiA+ICsJZGVmYXVsdDoNCj4gPiAr
CQlicHAgPSBpbmZvLT5jcHBbMF0gKiA4Ow0KPiA+ICsJCWJyZWFrOw0KPiA+ICsJfQ0KPiA+ICsN
Cj4gPiArCVdBUk5fT04oYnBwID09IDApOw0KPiA+ICsNCj4gPiArCXJldHVybiBicHA7DQo+ID4g
K30NCj4gPiArDQo+ID4gIC8qIFR3byBhc3N1bXB0aW9ucw0KPiA+ICAgKiAxLiBSR0IgYWx3YXlz
IGhhcyBZVFINCj4gPiAgICogMi4gVGlsZWQgUkdCIGFsd2F5cyBoYXMgU0MNCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZm9ybWF0X2Nh
cHMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Zvcm1hdF9j
YXBzLmgNCj4gPiBpbmRleCAzNjMxOTEwLi4zMjI3M2NmIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmgNCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mb3JtYXRfY2Fw
cy5oDQo+ID4gQEAgLTk3LDYgKzk3LDkgQEAgc3RhdGljIGlubGluZSBjb25zdCBjaGFyICprb21l
ZGFfZ2V0X2Zvcm1hdF9uYW1lKHUzMiBmb3VyY2MsIHU2NCBtb2RpZmllcikNCj4gPiAga29tZWRh
X2dldF9mb3JtYXRfY2FwcyhzdHJ1Y3Qga29tZWRhX2Zvcm1hdF9jYXBzX3RhYmxlICp0YWJsZSwN
Cj4gPiAgCQkgICAgICAgdTMyIGZvdXJjYywgdTY0IG1vZGlmaWVyKTsNCj4gPiAgDQo+ID4gK3Uz
MiBrb21lZGFfZ2V0X2FmYmNfZm9ybWF0X2JwcChjb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZv
ICppbmZvLA0KPiA+ICsJCQkgICAgICAgdTY0IG1vZGlmaWVyKTsNCj4gPiArDQo+ID4gIHUzMiAq
a29tZWRhX2dldF9sYXllcl9mb3VyY2NfbGlzdChzdHJ1Y3Qga29tZWRhX2Zvcm1hdF9jYXBzX3Rh
YmxlICp0YWJsZSwNCj4gPiAgCQkJCSAgdTMyIGxheWVyX3R5cGUsIHUzMiAqbl9mbXRzKTsNCj4g
PiAgDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2ZyYW1lYnVmZmVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9mcmFtZWJ1ZmZlci5jDQo+ID4gaW5kZXggMTBiZjYzZS4uOTY2ZDBjNyAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mcmFt
ZWJ1ZmZlci5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfZnJhbWVidWZmZXIuYw0KPiA+IEBAIC00NCw3ICs0NCw3IEBAIHN0YXRpYyBpbnQga29t
ZWRhX2ZiX2NyZWF0ZV9oYW5kbGUoc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsDQo+ID4gIAlj
b25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICppbmZvID0gZmItPmZvcm1hdDsNCj4gPiAgCXN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqOw0KPiA+ICAJdTMyIGFsaWdubWVudF93ID0gMCwgYWxp
Z25tZW50X2ggPSAwLCBhbGlnbm1lbnRfaGVhZGVyOw0KPiA+IC0JdTMyIG5fYmxvY2tzID0gMCwg
bWluX3NpemUgPSAwOw0KPiA+ICsJdTMyIG5fYmxvY2tzID0gMCwgbWluX3NpemUgPSAwLCBicHA7
DQo+ID4gIA0KPiA+ICAJb2JqID0gZHJtX2dlbV9vYmplY3RfbG9va3VwKGZpbGUsIG1vZGVfY21k
LT5oYW5kbGVzWzBdKTsNCj4gPiAgCWlmICghb2JqKSB7DQo+ID4gQEAgLTg2LDEwICs4NiwxMiBA
QCBzdGF0aWMgaW50IGtvbWVkYV9mYl9jcmVhdGVfaGFuZGxlKHN0cnVjdCBkcm1fZnJhbWVidWZm
ZXIgKmZiLA0KPiA+ICAJa2ZiLT5vZmZzZXRfcGF5bG9hZCA9IEFMSUdOKG5fYmxvY2tzICogQUZC
Q19IRUFERVJfU0laRSwNCj4gPiAgCQkJCSAgICBhbGlnbm1lbnRfaGVhZGVyKTsNCj4gPiAgDQo+
ID4gKwlicHAgPSBrb21lZGFfZ2V0X2FmYmNfZm9ybWF0X2JwcChpbmZvLCBmYi0+bW9kaWZpZXIp
Ow0KPiA+ICAJa2ZiLT5hZmJjX3NpemUgPSBrZmItPm9mZnNldF9wYXlsb2FkICsgbl9ibG9ja3Mg
Kg0KPiA+IC0JCQkgQUxJR04oaW5mby0+Y3BwWzBdICogQUZCQ19TVVBFUkJMS19QSVhFTFMsDQo+
ID4gKwkJCSBBTElHTihicHAgKiBBRkJDX1NVUEVSQkxLX1BJWEVMUyAvIDgsDQo+ID4gIAkJCSAg
ICAgICBBRkJDX1NVUEVSQkxLX0FMSUdOTUVOVCk7DQo+ID4gIAltaW5fc2l6ZSA9IGtmYi0+YWZi
Y19zaXplICsgZmItPm9mZnNldHNbMF07DQo+ID4gKw0KPiA+ICAJaWYgKG1pbl9zaXplID4gb2Jq
LT5zaXplKSB7DQo+ID4gIAkJRFJNX0RFQlVHX0tNUygiYWZiYyBzaXplIGNoZWNrIGZhaWxlZCwg
b2JqX3NpemU6IDB4JWx4LiBtaW5fc2l6ZSAweCV4LlxuIiwNCj4gPiAgCQkJICAgICAgb2JqLT5z
aXplLCBtaW5fc2l6ZSk7DQo+IA0KPiBQYXRjaCBkb2Vzbid0IGFwcGx5IHRvIHRpcCBvZiBkcm0t
bWlzYy1uZXh0LiBXaGF0IGlzIHRoaXMgcGF0Y2ggZGVwZW5kaW5nIG9uPw0KPiANCj4gQmVzdCBy
ZWdhcmRzLA0KPiBMaXZpdQ0KV2lsbCByZWJhc2UgYW5kIHNlbmQgYWdhaW4uIFRoYW5rcyBmb3Ig
dGhlIHJldmlldy4NCg0KQmVzdCByZWdhcmRzLA0KTG93cnkNCj4gPiAtLSANCj4gPiAxLjkuMQ0K
PiA+IA0KPiANCj4gLS0gDQo+ID09PT09PT09PT09PT09PT09PT09DQo+IHwgSSB3b3VsZCBsaWtl
IHRvIHwNCj4gfCBmaXggdGhlIHdvcmxkLCAgfA0KPiB8IGJ1dCB0aGV5J3JlIG5vdCB8DQo+IHwg
Z2l2aW5nIG1lIHRoZSAgIHwNCj4gIFwgc291cmNlIGNvZGUhICAvDQo+ICAgLS0tLS0tLS0tLS0t
LS0tDQo+ICAgICDCr1xfKOODhClfL8KvDQoNCi0tIA0KUmVnYXJkcywNCkxvd3J5DQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
