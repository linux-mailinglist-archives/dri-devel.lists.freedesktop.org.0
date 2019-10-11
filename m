Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00913D3BB2
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 10:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9766EBE5;
	Fri, 11 Oct 2019 08:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827456EBE5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 08:55:16 +0000 (UTC)
Received: from VI1PR08CA0172.eurprd08.prod.outlook.com (2603:10a6:800:d1::26)
 by AM6PR08MB3128.eurprd08.prod.outlook.com (2603:10a6:209:45::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Fri, 11 Oct
 2019 08:55:11 +0000
Received: from DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::207) by VI1PR08CA0172.outlook.office365.com
 (2603:10a6:800:d1::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 08:55:11 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT064.mail.protection.outlook.com (10.152.21.199) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 11 Oct 2019 08:55:09 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Fri, 11 Oct 2019 08:54:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ae2371e16ef1e3e9
X-CR-MTA-TID: 64aa7808
Received: from 9daac585a64f.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FFF47F46-42B7-4CF6-A767-354E206E5CD0.1; 
 Fri, 11 Oct 2019 08:54:06 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9daac585a64f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 11 Oct 2019 08:54:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpoBJMYur4yWifqv8XWj9fAB/FwRaJVYjXjgZ1P/Qmv3eQHGuYhSZdydYsdCTDddKQzNP77pGAjjcYIiR0fcx/cisof+bftwhrApz04U87YRWfS7uWbMDbZzeuR3xUMU5hgPUwP93+FZMZBmWHOVaDCnvIkwj7i4XEWjxl/fCCZgJgtTVT4ZQB1vc1Myqp5NDU/RFisOFek1Ca6S8fuqLgoj3EdAexJBAAQiOrrQRdI8o7S5kIx2zv7dt0UwyurWXa2xoTEmuMySwqCBgiAyJwxUu88vieVfjrRhNTctsK3ir46VWZvXkHFHlZwcXlZbyMUQ4YZTXE3m89O4bX7dfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+B7Vv51tFQW1fv//oCz414JiDh7MEdFMxM/duBp8wZA=;
 b=I4IfATNnxV8ior43zD/nymKzJDCSxOIazxfeErBdsjvlwAkVmLtcdXTnsEfj1JhnON5VCXnras/v3Lz8rN/7IyGDKOrWW7jjRvdtZyKY+TbXIEg8LYMwmZj9y0wRR3A+YYfkl1o+7GTpQurTxE/DEGG2G6x8wZPxYZEqjHLG3Kk5/qha8SHsPFwmKswGsh44w2WHL9kFN07s0aRM94Tae0lAtHkYpvu0oKA4hOlR6/UAfbp92uMHzy1i6xKlOrQATMWRyR5cYAlhSEpz22uy/1Lpj3qrN4/vwDBOVCU5BS2zddM+xKYgOkVpzG9+ha/7qYwRwT7fiPKKky2M9XRukQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2960.eurprd08.prod.outlook.com (52.133.14.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 08:54:03 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2347.016; Fri, 11 Oct 2019
 08:54:03 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH v2 4/4] drm/komeda: Adds gamma and color-transform support
 for DOU-IPS
Thread-Topic: [PATCH v2 4/4] drm/komeda: Adds gamma and color-transform
 support for DOU-IPS
Thread-Index: AQHVf/cp1ECrFKcx7E6lw4dO6fyhYKdVIuuA
Date: Fri, 11 Oct 2019 08:54:03 +0000
Message-ID: <8416585.jh9292Gg6g@e123338-lin>
References: <20191011054459.17984-1-james.qian.wang@arm.com>
 <20191011054459.17984-5-james.qian.wang@arm.com>
In-Reply-To: <20191011054459.17984-5-james.qian.wang@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.54]
x-clientproxiedby: LO2P265CA0287.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::35) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 0be049e5-fb37-4760-e259-08d74e28b8a9
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB2960:|VI1PR08MB2960:|AM6PR08MB3128:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB312849C0D902D3B5CCF413478F970@AM6PR08MB3128.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 0187F3EA14
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(136003)(39860400002)(396003)(366004)(346002)(199004)(189003)(81156014)(14454004)(316002)(8676002)(66066001)(486006)(52116002)(14444005)(256004)(81166006)(25786009)(7736002)(66446008)(64756008)(386003)(102836004)(8936002)(6506007)(99286004)(305945005)(76176011)(478600001)(66476007)(66556008)(66946007)(186003)(26005)(6862004)(2906002)(33716001)(71200400001)(71190400001)(6116002)(11346002)(446003)(476003)(3846002)(86362001)(6436002)(6246003)(54906003)(5660300002)(229853002)(4326008)(9686003)(6486002)(6512007)(6636002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2960;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: otgFmMo3t5ofd/bZOtm7x8SaQrIyDKqehdPlsQNq+DtJ425dgRRnhk/cYx4IKfjWl6IRZ2FTQ3I7vAOENfL+lwtj5rfFwLEBjkOslMcslvEbxm94xd94/VKMhcIbCuaZYwy0v9aGivq2Im7gmVf24Z9YSdCyjaUaQg8AJzfI+P5GiGN3FYZVFELk1DLzdTLfr5SzkHLc9a2tvpDBzjyHf28K3ewA8jSgPuEWbJtCfXA3M7doRFgxPcUB74t3iyP3wcPKP3Dqptyk31HFeUI0BlGAMOMf8lFmMxPme/jz2qVlGZ9wzqiZmu63x4M9G5PCjicWAZBQt9YO3sbm9SN6BHtsBoPRTPN2e7iEpp1JkJ8yS2KQNsn3f8jMhe0ctPWfwSKqdleSs65mOUr6/YiaqBrhdPOc4uUGsKvLH9+ukl0=
Content-ID: <51DD38C7F75A844181E5A31B96409527@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2960
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(376002)(136003)(346002)(396003)(199004)(189003)(356004)(70206006)(6246003)(6862004)(50466002)(76130400001)(54906003)(70586007)(316002)(14454004)(6512007)(9686003)(6486002)(25786009)(26826003)(7736002)(478600001)(22756006)(97756001)(46406003)(66066001)(47776003)(4326008)(126002)(305945005)(6506007)(386003)(14444005)(63350400001)(2906002)(6116002)(11346002)(6636002)(99286004)(26005)(486006)(229853002)(476003)(3846002)(446003)(81166006)(8676002)(81156014)(76176011)(8936002)(8746002)(86362001)(336012)(23726003)(102836004)(186003)(5660300002)(33716001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3128;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 999b8171-b08c-449b-add2-08d74e2890e5
NoDisclaimer: True
X-Forefront-PRVS: 0187F3EA14
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hqw/F2TfJShV6o5/H05jJz6b5w5uzpAV0nmYmnTE/4eskX+5K+GmuhFfhrXNdvg0x0IEBt7tie1KQGTCDeClkoiAu3iSNaJaIkI68ZJKjtps7DQ2tOHzRQBk/DF6XLdOHLGLOHeokKu3CvmaTPhLlEURZ1WxC2wlqBllqbLCHS/2nvgUHDYkwtv0YeXi2M4P3S7WWhhId0h/ji7R0j64i0Dsmy3cKepTDGe/Z3Kmhp4qnsm8kG9kqsfFbD8UXn8XvXoTrSDp5ZmwoQ8mGEvSTqVc2j6epUbkY5DKj8gyhm+o0ExxmlydQ3B3JSRmacHUUDKblMFzd2Iem0JfgIoiwA2CugFvkRySRY0vcq8f0HOj08QP7x+MvGTm6WJQvzN/nuR8dpAw9yOJ6jmH7zXNReajS2DHSF2xD8lxBve6CM8=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 08:55:09.9493 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be049e5-fb37-4760-e259-08d74e28b8a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3128
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+B7Vv51tFQW1fv//oCz414JiDh7MEdFMxM/duBp8wZA=;
 b=b/pUuXLa6cwJwmDp9UtUPhEKJC6oa55bfvUOT2a5eITUHO8JII4taFzR6NRUWhmv/9I+Rwcx3DviEHzP/WHcU4kayTlS0+iDs0CTAkylWt3MJcT2eR48sRq/xj2s71sKCz8TftZsFPQotYQT6P6NR/ZCdNR+BWdZwjS0k6c//6I=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+B7Vv51tFQW1fv//oCz414JiDh7MEdFMxM/duBp8wZA=;
 b=b/pUuXLa6cwJwmDp9UtUPhEKJC6oa55bfvUOT2a5eITUHO8JII4taFzR6NRUWhmv/9I+Rwcx3DviEHzP/WHcU4kayTlS0+iDs0CTAkylWt3MJcT2eR48sRq/xj2s71sKCz8TftZsFPQotYQT6P6NR/ZCdNR+BWdZwjS0k6c//6I=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 Ben Davis <Ben.Davis@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFtZXMsIExvd3J5LAoKT24gRnJpZGF5LCAxMSBPY3RvYmVyIDIwMTkgMDY6NDU6NTAgQlNU
IGphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+IEZyb206ICJM
b3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIiA8TG93cnkuTGlAYXJtLmNvbT4KPiAKPiBB
ZGRzIGdhbW1hIGFuZCBjb2xvci10cmFuc2Zvcm0gc3VwcG9ydCBmb3IgRE9VLUlQUy4KPiBBZGRz
IHR3byBjYXBzIG1lbWJlcnMgZmdhbW1hX2NvZWZmcyBhbmQgY3RtX2NvZWZmcyB0byBrb21lZGFf
aW1wcm9jX3N0YXRlLgo+IElmIGNvbG9yIG1hbmFnZW1lbnQgY2hhbmdlZCwgc2V0IGdhbW1hIGFu
ZCBjb2xvci10cmFuc2Zvcm0gYWNjb3JkaW5nbHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogTG93cnkg
TGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8bG93cnkubGlAYXJtLmNvbT4KPiAtLS0KPiAgLi4u
L2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jICAgIHwgMjQgKysrKysrKysr
KysrKysrKysrKwo+ICAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMu
YyAgfCAgMiArKwo+ICAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUu
aCAgfCAgMyArKysKPiAgLi4uL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5j
ICAgIHwgIDYgKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9j
b21wb25lbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9j
b21wb25lbnQuYwo+IGluZGV4IGMzZDI5YzBiMDUxYi4uZTdlNWE4ZTQ0MzBlIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21w
b25lbnQuYwo+IEBAIC05NDIsMTUgKzk0MiwzOSBAQCBzdGF0aWMgaW50IGQ3MV9tZXJnZXJfaW5p
dChzdHJ1Y3QgZDcxX2RldiAqZDcxLAo+ICBzdGF0aWMgdm9pZCBkNzFfaW1wcm9jX3VwZGF0ZShz
dHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywKPiAgCQkJICAgICAgc3RydWN0IGtvbWVkYV9jb21w
b25lbnRfc3RhdGUgKnN0YXRlKQo+ICB7Cj4gKwlzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNf
c3QgPSBzdGF0ZS0+Y3J0Yy0+c3RhdGU7CkknbSBub3Qgc3VyZSBpdCdzIGEgZ29vZCBpZGVhIHRv
IGludHJvZHVjZSBhIGRlcGVuZGVuY3kgb24gZHJtIHN0YXRlCnNvIGZhciBkb3duIGluIHRoZSBI
VyBmdW5jcywgaXMgdGhlcmUgYSBnb29kIHJlYXNvbiBmb3IgdGhlIGRpcmVjdCBwcm9kPwo+ICAJ
c3RydWN0IGtvbWVkYV9pbXByb2Nfc3RhdGUgKnN0ID0gdG9faW1wcm9jX3N0KHN0YXRlKTsKPiAr
CXN0cnVjdCBkNzFfcGlwZWxpbmUgKnBpcGUgPSB0b19kNzFfcGlwZWxpbmUoYy0+cGlwZWxpbmUp
Owo+ICAJdTMyIF9faW9tZW0gKnJlZyA9IGMtPnJlZzsKPiAgCXUzMiBpbmRleDsKPiArCXUzMiBt
YXNrID0gMCwgY3RybCA9IDA7Cj4gIAo+ICAJZm9yX2VhY2hfY2hhbmdlZF9pbnB1dChzdGF0ZSwg
aW5kZXgpCj4gIAkJbWFsaWRwX3dyaXRlMzIocmVnLCBCTEtfSU5QVVRfSUQwICsgaW5kZXggKiA0
LAo+ICAJCQkgICAgICAgdG9fZDcxX2lucHV0X2lkKHN0YXRlLCBpbmRleCkpOwo+ICAKPiAgCW1h
bGlkcF93cml0ZTMyKHJlZywgQkxLX1NJWkUsIEhWX1NJWkUoc3QtPmhzaXplLCBzdC0+dnNpemUp
KTsKPiArCj4gKwlpZiAoY3J0Y19zdC0+Y29sb3JfbWdtdF9jaGFuZ2VkKSB7Cj4gKwkJbWFzayB8
PSBJUFNfQ1RSTF9GVCB8IElQU19DVFJMX1JHQjsKPiArCj4gKwkJaWYgKGNydGNfc3QtPmdhbW1h
X2x1dCkgewo+ICsJCQltYWxpZHBfd3JpdGVfZ3JvdXAocGlwZS0+ZG91X2Z0X2NvZWZmX2FkZHIs
IEZUX0NPRUZGMCwKPiArCQkJCQkgICBLT01FREFfTl9HQU1NQV9DT0VGRlMsCj4gKwkJCQkJICAg
c3QtPmZnYW1tYV9jb2VmZnMpOwo+ICsJCQljdHJsIHw9IElQU19DVFJMX0ZUOyAvKiBlbmFibGUg
Z2FtbWEgKi8KPiArCQl9Cj4gKwo+ICsJCWlmIChjcnRjX3N0LT5jdG0pIHsKPiArCQkJbWFsaWRw
X3dyaXRlX2dyb3VwKHJlZywgSVBTX1JHQl9SR0JfQ09FRkYwLAo+ICsJCQkJCSAgIEtPTUVEQV9O
X0NUTV9DT0VGRlMsCj4gKwkJCQkJICAgc3QtPmN0bV9jb2VmZnMpOwo+ICsJCQljdHJsIHw9IElQ
U19DVFJMX1JHQjsgLyogZW5hYmxlIGdhbXV0ICovCj4gKwkJfQo+ICsJfQo+ICsKPiArCWlmICht
YXNrKQo+ICsJCW1hbGlkcF93cml0ZTMyX21hc2socmVnLCBCTEtfQ09OVFJPTCwgbWFzaywgY3Ry
bCk7Cj4gIH0KPiAgCj4gIHN0YXRpYyB2b2lkIGQ3MV9pbXByb2NfZHVtcChzdHJ1Y3Qga29tZWRh
X2NvbXBvbmVudCAqYywgc3RydWN0IHNlcV9maWxlICpzZikKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gaW5kZXggOWJlZWRhMDQ4MThi
Li40MDZiOWQwY2EwNTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gQEAgLTU5MCw2ICs1OTAsOCBAQCBzdGF0aWMgaW50IGtv
bWVkYV9jcnRjX2FkZChzdHJ1Y3Qga29tZWRhX2ttc19kZXYgKmttcywKPiAgCj4gIAljcnRjLT5w
b3J0ID0ga2NydGMtPm1hc3Rlci0+b2Zfb3V0cHV0X3BvcnQ7Cj4gIAo+ICsJZHJtX2NydGNfZW5h
YmxlX2NvbG9yX21nbXQoY3J0YywgMCwgdHJ1ZSwgS09NRURBX0NPTE9SX0xVVF9TSVpFKTsKPiAr
Cj4gIAlyZXR1cm4gZXJyOwo+ICB9Cj4gIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaAo+IGluZGV4IGIzMjJmNTJiYThmMi4u
YzVhYjgwOTZjODVkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX3BpcGVsaW5lLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oCj4gQEAgLTExLDYgKzExLDcgQEAKPiAgI2luY2x1
ZGUgPGRybS9kcm1fYXRvbWljLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIu
aD4KPiAgI2luY2x1ZGUgIm1hbGlkcF91dGlscy5oIgo+ICsjaW5jbHVkZSAia29tZWRhX2NvbG9y
X21nbXQuaCIKPiAgCj4gICNkZWZpbmUgS09NRURBX01BWF9QSVBFTElORVMJCTIKPiAgI2RlZmlu
ZSBLT01FREFfUElQRUxJTkVfTUFYX0xBWUVSUwk0Cj4gQEAgLTMyNCw2ICszMjUsOCBAQCBzdHJ1
Y3Qga29tZWRhX2ltcHJvYyB7Cj4gIHN0cnVjdCBrb21lZGFfaW1wcm9jX3N0YXRlIHsKPiAgCXN0
cnVjdCBrb21lZGFfY29tcG9uZW50X3N0YXRlIGJhc2U7Cj4gIAl1MTYgaHNpemUsIHZzaXplOwo+
ICsJdTMyIGZnYW1tYV9jb2VmZnNbS09NRURBX05fR0FNTUFfQ09FRkZTXTsKPiArCXUzMiBjdG1f
Y29lZmZzW0tPTUVEQV9OX0NUTV9DT0VGRlNdOwo+ICB9Owo+ICAKPiAgLyogZGlzcGxheSB0aW1p
bmcgY29udHJvbGxlciAqLwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYwo+IGluZGV4IDBiYTljNmFhMzcw
OC4uNGE0MGIzN2ViMWE2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jCj4gQEAgLTc1Niw2ICs3
NTYsMTIgQEAga29tZWRhX2ltcHJvY192YWxpZGF0ZShzdHJ1Y3Qga29tZWRhX2ltcHJvYyAqaW1w
cm9jLAo+ICAJc3QtPmhzaXplID0gZGZsb3ctPmluX3c7Cj4gIAlzdC0+dnNpemUgPSBkZmxvdy0+
aW5faDsKPiAgCj4gKwlpZiAoa2NydGNfc3QtPmJhc2UuY29sb3JfbWdtdF9jaGFuZ2VkKSB7Cj4g
KwkJZHJtX2x1dF90b19mZ2FtbWFfY29lZmZzKGtjcnRjX3N0LT5iYXNlLmdhbW1hX2x1dCwKPiAr
CQkJCQkgc3QtPmZnYW1tYV9jb2VmZnMpOwo+ICsJCWRybV9jdG1fdG9fY29lZmZzKGtjcnRjX3N0
LT5iYXNlLmN0bSwgc3QtPmN0bV9jb2VmZnMpOwo+ICsJfQo+ICsKPiAgCWtvbWVkYV9jb21wb25l
bnRfYWRkX2lucHV0KCZzdC0+YmFzZSwgJmRmbG93LT5pbnB1dCwgMCk7Cj4gIAlrb21lZGFfY29t
cG9uZW50X3NldF9vdXRwdXQoJmRmbG93LT5pbnB1dCwgJmltcHJvYy0+YmFzZSwgMCk7Cj4gIAo+
IAoKCi0tIApNaWhhaWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
