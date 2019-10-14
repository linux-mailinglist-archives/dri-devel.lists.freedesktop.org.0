Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DEAD5F7B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 11:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742BD6E221;
	Mon, 14 Oct 2019 09:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0a::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0B66E226
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 09:58:39 +0000 (UTC)
Received: from AM6PR08CA0040.eurprd08.prod.outlook.com (2603:10a6:20b:c0::28)
 by DB7PR08MB3514.eurprd08.prod.outlook.com (2603:10a6:10:49::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.18; Mon, 14 Oct
 2019 09:58:34 +0000
Received: from DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::208) by AM6PR08CA0040.outlook.office365.com
 (2603:10a6:20b:c0::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Mon, 14 Oct 2019 09:58:34 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT035.mail.protection.outlook.com (10.152.20.65) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 14 Oct 2019 09:58:33 +0000
Received: ("Tessian outbound 6481c7fa5a3c:v33");
 Mon, 14 Oct 2019 09:58:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 54d6b1fa817abca5
X-CR-MTA-TID: 64aa7808
Received: from f1647cb90e25.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.6.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EA8AE79E-0D56-4573-A218-75A3FF46F1D4.1; 
 Mon, 14 Oct 2019 09:58:22 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f1647cb90e25.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Oct 2019 09:58:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k31S/TY/JowacD01SCS4S7VxzYshPkVS6Hpwor7f13zT48cSPdmTpEwbMgRO+cskavEBYe+tEnYUQv26IrPzGSJGHMAn/4JCoCKQEgwQNz90yzd9nZ6ppNiCG2AUPzprsFoOInmsh+x/zE3c0dxj95BI06t5Zajy7NV65xPxVtdzhDACsyrTDPTToevhY2OvWAQ/yIO+GqNz4uflX1Rbn8G/p0xQSVSdtUI7cNNpQcNuP86hAG7TBIaa1MRuIG/5+JH80GZCHrIoLi80Thmuf0KI7IuBDhuStJ+hB2fAPYgkgY31dxpnWqtPqP3ffSzlMRdqpcsUKhTinZW/wSQ2pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivrX0W/rePfA0VjXeBSGhKgFT13jFR53YTHAi7w3ooc=;
 b=g9MOGDRX0Mz5I5DQ5UCMH8/PgMh3PyYElPkXe/v+9B0FTEvJJpDtpYpdyhRWrTA+hnv2Z27Xt6iRmZ7qycvq2rBddsAzwCLdK+XcbbvhNq0SLhdOoJHXW/3+L1hAvZKMCeytZnb9YhaLZhpAGha90ux60/GAOnSyCDZpOuGggI5BeLdKtesJaOEXthdMFFJheunfFF+GcvSWNPYr6IFNgqhWRsb328k3T2owgfYKU1OP6FOd2hMjFQIt4bJoOxtbuUXnGfRmXTrin9JVf9hCVw0Wm+dJD+D3vAYCMugHBoUudbgJmsqiDrJu1hBwCIaoAs+7K3+07NetYrCqp/HghA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5229.eurprd08.prod.outlook.com (10.255.114.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Mon, 14 Oct 2019 09:58:21 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.021; Mon, 14 Oct 2019
 09:58:21 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>, nd <nd@arm.com>, Ayan Halder
 <Ayan.Halder@arm.com>, "Oscar Zhang (Arm Technology China)"
 <Oscar.Zhang@arm.com>, "Tiannan Zhu (Arm Technology China)"
 <Tiannan.Zhu@arm.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>, "Jonathan
 Chai (Arm Technology China)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin (Arm Technology China)" <Julien.Yin@arm.com>, "Channing Chen (Arm
 Technology China)" <Channing.Chen@arm.com>, "Yiqi Kang (Arm Technology
 China)" <Yiqi.Kang@arm.com>, "Thomas Sun (Arm Technology China)"
 <thomas.Sun@arm.com>, "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Subject: Re: [PATCH v2 1/4] drm/komeda: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Topic: [PATCH v2 1/4] drm/komeda: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Index: AQHVf/bDNAzoDxuLVU+by7UkFix6lKdZ2n6AgAARXYA=
Date: Mon, 14 Oct 2019 09:58:20 +0000
Message-ID: <20191014095813.GA15227@jamwan02-TSP300>
References: <20191011054240.17782-1-james.qian.wang@arm.com>
 <20191011054240.17782-2-james.qian.wang@arm.com>
 <20191014085605.GF11828@phenom.ffwll.local>
In-Reply-To: <20191014085605.GF11828@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR04CA0051.apcprd04.prod.outlook.com
 (2603:1096:202:14::19) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6575840e-c769-4795-28aa-08d7508d12bf
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB5229:|VE1PR08MB5229:|DB7PR08MB3514:
X-MS-Exchange-PUrlCount: 3
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB3514C712B175CFE7259263B7B3900@DB7PR08MB3514.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4303;OLM:4303;
x-forefront-prvs: 01901B3451
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(136003)(376002)(346002)(396003)(366004)(189003)(199004)(478600001)(305945005)(7736002)(3846002)(966005)(256004)(6116002)(6636002)(99286004)(2906002)(14454004)(33716001)(8676002)(9686003)(1076003)(81156014)(6512007)(6306002)(81166006)(66066001)(25786009)(6246003)(33656002)(71200400001)(71190400001)(58126008)(316002)(6436002)(6486002)(64756008)(2501003)(5660300002)(2171002)(110136005)(6506007)(52116002)(26005)(76176011)(55236004)(386003)(102836004)(229853002)(66556008)(2201001)(476003)(446003)(11346002)(486006)(86362001)(186003)(66446008)(8936002)(66946007)(66476007)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5229;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: fnKNND30CDoY9OPkGf+wVKHjzfRvPBgVCI6gF/w1cow3qdVgWguiNKocdwP/86QexiiKJXp2EwZh4mbimnVzN2shxEtaf0pUxKl/TbSH4PWa73OrSPaQ8/i+0W3E86oYZSgSa4vM1k6GGbrn9Eydl8ArEevFDiUHYK0MMchHeXcmUL2kW+0KhZM9u0Ii7qp6kupxmGjRrZgqQy/7dL+N3LoL0TaKg893cMn85HF2Tj7WOGzOhOoDaeVdgnEbfGGGrHxf7BjUECUbL3jAWzzCFQH4YNi+HAEBqG95NHODywiwVZ6zR6pOViQqXqGx2df0/pejcuZPLwT4y05xQL8wjBgdSowkjbE4zcSaj+ZRybT/pq/lVJ6k41u78embbNrcaL7OVd6UEOye0Eg1vZjC8UbTZCK+biOO16ifmhbfKlTFytQv5UbnpNgkHQG1i7nwy2JhuOjVx/IKTFVkgKfnxg==
Content-ID: <E14DA5AE9F7FDB4CA94BF9940278DB15@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5229
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(39860400002)(346002)(376002)(136003)(189003)(199004)(40434004)(70206006)(70586007)(76176011)(486006)(446003)(22756006)(6512007)(1076003)(63350400001)(6306002)(66066001)(47776003)(6506007)(386003)(99286004)(9686003)(6636002)(966005)(6486002)(46406003)(336012)(2906002)(476003)(23726003)(14454004)(6116002)(3846002)(11346002)(76130400001)(126002)(26826003)(97756001)(478600001)(33716001)(58126008)(2201001)(33656002)(2501003)(305945005)(316002)(7736002)(110136005)(587094005)(229853002)(50466002)(5660300002)(186003)(8746002)(81166006)(81156014)(8676002)(356004)(8936002)(6246003)(86362001)(25786009)(26005)(2171002)(102836004)(14444005)(5024004)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3514;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 36981c5f-7317-4636-a4fb-08d7508d0b27
X-Forefront-PRVS: 01901B3451
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NcxDINKc15P9eBESd/8mH2po8Nd24H+ZXT3EgBBqwC2hq1rhaw7YBAh+QhqKfLQNOm35yOqviAxflHxtaoSGO+AZ2kIQDJ2mUZgpzfz8vFuA5Q1zxARKjTUwt9iWXIg2S3M3l9OD/Qxzbj1vyB6xgymZWyXelyiSdO4CcZXZqgbxa9afAzKnBbO0y6NT1D2SEWP1MmcYghYCPu0dci9RuJthhLpnbKi6KtDUvLNDp/6kEQ+4ev0HEBl+/GAZ/FC3pf+jcduo0XayC2/ZjHm3XIxXwE5wl+Nn5Wv+uHyFdzoj797WjMWCbE6kx0iIoFrpFFLqFLKQBWun5Gw4ziBQIEiej5SuNwvDLrUNj1Nq26+eeHQv7LX04lsBXIFIm2Ze39E6HS9DTT6OuwnW4lN5yJggxuOdD4EQbpI8KiWcUhDkmX3NMxOsF3UmBn4EeUbzsWl1hD5xE7xLpdaG4Qxnsw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2019 09:58:33.0832 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6575840e-c769-4795-28aa-08d7508d12bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3514
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xbmp5yY5l22KDnEiwvExVWxyRUqvXQysvfuvfmaDrCc=;
 b=ACl8x0ckSTf0I2FNQUUuw9yLvOrYf+SXg/Ac8glWMFCk0AMH3d3+SO4PYgrakeCL6mbhJYlVsimiu5P6Wi/BRKesOX9XoKnlptjP6Gw2k/DhB02zUPdX7vqqUa6M5VS7kn9yBt9wNEJKq5SSBfsheh1sriYV9Ys83unUJ6dL8dU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivrX0W/rePfA0VjXeBSGhKgFT13jFR53YTHAi7w3ooc=;
 b=HpNgouNa/ITGGMINpd3xHKJvR6Xgc5On9iSwJcebTfvQVDU2lOr+r1kOldOh7HhiSQAb446sHsCefBjb1r926Ebu17fzYForLIoP6MdAu8PUt0w9MYAtw0ZIIafqsh2gRxrNtBEfiUnxH+lT7FCIb0/P5voJjxOn1YuxBaTsBvM=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMTA6NTY6MDVBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIE9jdCAxMSwgMjAxOSBhdCAwNTo0MzowOUFNICswMDAwLCBqYW1lcyBx
aWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiA+IEFkZCBhIG5ldyBoZWxw
ZXIgZnVuY3Rpb24gZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9fcW1fbigpIGZvciBkcml2ZXIgdG8K
PiA+IGNvbnZlcnQgUzMxLjMyIHNpZ24tbWFnbml0dWRlIHRvIFFtLm4gMidzIGNvbXBsZW1lbnQg
dGhhdCBzdXBwb3J0ZWQgYnkKPiA+IGhhcmR3YXJlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IGph
bWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJt
LmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jIHwgMjMg
KysrKysrKysrKysrKysrKysrKysrKysKPiA+ICBpbmNsdWRlL2RybS9kcm1fY29sb3JfbWdtdC5o
ICAgICB8ICAyICsrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMKPiA+IGluZGV4IDRjZTVjNmQ4ZGU5OS4uM2Q1MzNk
MGI0NWFmIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMK
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jCj4gPiBAQCAtMTMyLDYg
KzEzMiwyOSBAQCB1aW50MzJfdCBkcm1fY29sb3JfbHV0X2V4dHJhY3QodWludDMyX3QgdXNlcl9p
bnB1dCwgdWludDMyX3QgYml0X3ByZWNpc2lvbikKPiA+ICB9Cj4gPiAgRVhQT1JUX1NZTUJPTChk
cm1fY29sb3JfbHV0X2V4dHJhY3QpOwo+ID4KPiA+ICsvKioKPiA+ICsgKiBkcm1fY29sb3JfY3Rt
X3MzMV8zMl90b19xbV9uCj4gPiArICoKPiA+ICsgKiBAdXNlcl9pbnB1dDogaW5wdXQgdmFsdWUK
PiA+ICsgKiBAbTogbnVtYmVyIG9mIGludGVnZXIgYml0cwo+ID4gKyAqIEBuOiBudW1iZXIgb2Yg
ZnJhY3RpbmFsIGJpdHMKPiA+ICsgKgo+ID4gKyAqIENvbnZlcnQgYW5kIGNsYW1wIFMzMS4zMiBz
aWduLW1hZ25pdHVkZSB0byBRbS5uIDIncyBjb21wbGVtZW50Lgo+Cj4gV2hhdCdzIHRoZSBRIG1l
YW5pbmcgaGVyZT8gQWxzbyBtYXliZSBzcGVjaWZ5IHRoYXQgdGhlIGhpZ2hlciBiaXRzIGFib3Zl
Cj4gbStuIGFyZSBjbGVhcmVkIHRvIGFsbCAwIG9yIGFsbCAxLiBVbml0IHRlc3Qgd291bGQgYmUg
bG92ZWx5IHRvby4gQW55d2F5OgoKVGhlIFEgdXNlZCB0byByZXByZXNlbnQgc2lnbmVkIHR3bydz
IGNvbXBsZW1lbnQuCgpGb3IgZGV0YWlsOiBodHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9R
XyhudW1iZXJfZm9ybWF0KQoKQW5kIGl0IFEgaXMgMidzIGNvbXBsZW1lbnQsIHNvIHRoZSB2YWx1
ZSBvZiBoaWdoZXIgYml0IGVxdWFsIHRvCnNpZ24tYml0LgpBbGwgMSBpZiBpdCBpcyBuZWdhdGl2
ZQowIGlmIGl0IGlzIHBvc2l0aXZlLgoKSmFtZXMKCj4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4KPiA+ICsgKi8KPiA+ICt1aW50NjRfdCBkcm1f
Y29sb3JfY3RtX3MzMV8zMl90b19xbV9uKHVpbnQ2NF90IHVzZXJfaW5wdXQsCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgbSwgdWludDMyX3QgbikKPiA+ICt7
Cj4gPiArICAgdTY0IG1hZyA9ICh1c2VyX2lucHV0ICYgfkJJVF9VTEwoNjMpKSA+PiAoMzIgLSBu
KTsKPiA+ICsgICBib29sIG5lZ2F0aXZlID0gISEodXNlcl9pbnB1dCAmIEJJVF9VTEwoNjMpKTsK
PiA+ICsgICBzNjQgdmFsOwo+ID4gKwo+ID4gKyAgIC8qIHRoZSByYW5nZSBvZiBzaWduZWQgMnMg
Y29tcGxlbWVudCBpcyBbLTJebittLCAyXm4rbSAtIDFdICovCj4gPiArICAgdmFsID0gY2xhbXBf
dmFsKG1hZywgMCwgbmVnYXRpdmUgPyBCSVQobiArIG0pIDogQklUKG4gKyBtKSAtIDEpOwo+ID4g
Kwo+ID4gKyAgIHJldHVybiBuZWdhdGl2ZSA/IDBsbCAtIHZhbCA6IHZhbDsKPiA+ICt9Cj4gPiAr
RVhQT1JUX1NZTUJPTChkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKTsKPiA+ICsKPiA+ICAv
KioKPiA+ICAgKiBkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdCAtIGVuYWJsZSBjb2xvciBtYW5h
Z2VtZW50IHByb3BlcnRpZXMKPiA+ICAgKiBAY3J0YzogRFJNIENSVEMKPiA+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2RybS9kcm1fY29sb3JfbWdtdC5oIGIvaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21n
bXQuaAo+ID4gaW5kZXggZDFjNjYyZDkyYWI3Li42MGZlYTU1MDE4ODYgMTAwNjQ0Cj4gPiAtLS0g
YS9pbmNsdWRlL2RybS9kcm1fY29sb3JfbWdtdC5oCj4gPiArKysgYi9pbmNsdWRlL2RybS9kcm1f
Y29sb3JfbWdtdC5oCj4gPiBAQCAtMzAsNiArMzAsOCBAQCBzdHJ1Y3QgZHJtX2NydGM7Cj4gPiAg
c3RydWN0IGRybV9wbGFuZTsKPiA+Cj4gPiAgdWludDMyX3QgZHJtX2NvbG9yX2x1dF9leHRyYWN0
KHVpbnQzMl90IHVzZXJfaW5wdXQsIHVpbnQzMl90IGJpdF9wcmVjaXNpb24pOwo+ID4gK3VpbnQ2
NF90IGRybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24odWludDY0X3QgdXNlcl9pbnB1dCwKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBtLCB1aW50MzJfdCBu
KTsKPiA+Cj4gPiAgdm9pZCBkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdChzdHJ1Y3QgZHJtX2Ny
dGMgKmNydGMsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludCBkZWdhbW1hX2x1
dF9zaXplLAo+ID4gLS0KPiA+IDIuMjAuMQo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+Cj4gLS0KPiBEYW5pZWwgVmV0dGVy
Cj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gaHR0cDovL2Jsb2cuZmZ3
bGwuY2gKSU1QT1JUQU5UIE5PVElDRTogVGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1haWwgYW5kIGFu
eSBhdHRhY2htZW50cyBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYWxzbyBiZSBwcml2aWxlZ2Vk
LiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ugbm90aWZ5IHRo
ZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRvIG5vdCBkaXNjbG9zZSB0aGUgY29udGVudHMgdG8g
YW55IG90aGVyIHBlcnNvbiwgdXNlIGl0IGZvciBhbnkgcHVycG9zZSwgb3Igc3RvcmUgb3IgY29w
eSB0aGUgaW5mb3JtYXRpb24gaW4gYW55IG1lZGl1bS4gVGhhbmsgeW91LgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
