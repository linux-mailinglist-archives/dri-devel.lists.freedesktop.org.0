Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1F8D93E3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 16:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D6389DEC;
	Wed, 16 Oct 2019 14:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70084.outbound.protection.outlook.com [40.107.7.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29966E06B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 14:30:40 +0000 (UTC)
Received: from VE1PR08CA0010.eurprd08.prod.outlook.com (2603:10a6:803:104::23)
 by DB7PR08MB3098.eurprd08.prod.outlook.com (2603:10a6:5:1e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.18; Wed, 16 Oct
 2019 14:30:36 +0000
Received: from VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::203) by VE1PR08CA0010.outlook.office365.com
 (2603:10a6:803:104::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 16 Oct 2019 14:30:36 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT018.mail.protection.outlook.com (10.152.18.135) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15 via Frontend Transport; Wed, 16 Oct 2019 14:30:34 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Wed, 16 Oct 2019 14:30:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 74536b999e862091
X-CR-MTA-TID: 64aa7808
Received: from 2f357e2889b7.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.6.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A338AB45-1DB7-44B9-9395-50C32E5FEEA7.1; 
 Wed, 16 Oct 2019 14:30:22 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2f357e2889b7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Oct 2019 14:30:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grTBNUqgG5JKDOqC93uL0qFlV4ZYDWug40tJhw2Pof9wkVGT/riyJW6UVBVUNc6pBALNcxjb+BqI+NQsh1ZqNqpkrHFZ1hxjjmILqwJkEX2L1inWBxxOk1ebpiqGwe7RvdQR49fCtBVKwhfMJSRplYEIsccq+UfhvkvLOjleJXo3FtUmNF4pC0RLf+d0qgscZqikeB+C/5lZ5A3nGFtxNWPVUf0f53PnxoI7Y+7Y1j4RtwpCbiUiSCfYz1ADKB9IIegthlZEbkg5NBZoOr1x/qbd22z56Nq9NfOtpjnIbmHyk0pRfbtpBHE3Y5daF6EHeQelerKLTc9wk0SeqU89aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7OyTbyPqqj6409GWtJSyNvSMmG5Bzi2MmDOwmsFIT8=;
 b=QIklvV+5HyzrPIGtBcns+j04S4ELaOHekkjJ5iFoaHk/eymSPkynraDrDekZahzdYMaBluvh/aaq/NJxiI3ldY2/shc8Agm1OKLu3+sYXgdNuCY4tfelXGnEGdTTHp3YoLBhiKJVl+tb0e2aw0F+dG5DselBh/iWXRu2b1S7OSX19oiApBAZ3VwUNktrS45vFoVA37YaQijmR5qIny90kGy0yx73vcdKht7EKCT11Ore3lryv6lS5wfgh/DPWSey0fwETqv2VfnGIQtyHAIWqk+wBgTIxebPlGFm3XYGpXLOlzCHo7TEOC7o6kt0hVpNs/UP/svjBggb7uXq+/nV1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2973.eurprd08.prod.outlook.com (10.171.182.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 16 Oct 2019 14:30:20 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 14:30:20 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH v5 4/4] drm/komeda: Adds gamma and color-transform support
 for DOU-IPS
Thread-Topic: [PATCH v5 4/4] drm/komeda: Adds gamma and color-transform
 support for DOU-IPS
Thread-Index: AQHVhA1TRCL0eNp/dE2Lu5eXcmRLQqddVFwA
Date: Wed, 16 Oct 2019 14:30:20 +0000
Message-ID: <1854916.b3CkKF7cjY@e123338-lin>
References: <20191016103339.25858-1-james.qian.wang@arm.com>
 <20191016103339.25858-5-james.qian.wang@arm.com>
In-Reply-To: <20191016103339.25858-5-james.qian.wang@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.51]
x-clientproxiedby: AM3PR05CA0094.eurprd05.prod.outlook.com
 (2603:10a6:207:1::20) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: cf37bc9b-a41e-412a-0ff9-08d7524567e4
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB2973:|VI1PR08MB2973:|DB7PR08MB3098:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB30983DADAB1C4FA9288D35678F920@DB7PR08MB3098.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2958;OLM:2958;
x-forefront-prvs: 0192E812EC
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(376002)(396003)(366004)(346002)(136003)(189003)(199004)(99286004)(11346002)(54906003)(6246003)(71190400001)(8936002)(6436002)(102836004)(81166006)(3846002)(8676002)(86362001)(6512007)(4326008)(9686003)(26005)(6862004)(316002)(81156014)(229853002)(446003)(186003)(6486002)(14444005)(486006)(256004)(71200400001)(476003)(66946007)(52116002)(66556008)(64756008)(66446008)(66476007)(6506007)(2906002)(478600001)(76176011)(33716001)(6116002)(66066001)(7736002)(6636002)(305945005)(25786009)(386003)(14454004)(5660300002)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2973;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: pWo5+rDYiTe5Se5A4qECUFjU/+1/ofLx2oYAHR0edfMdsDquLt1gIX805SlgjEKom7Z9Vp31J8MyDYEFkOamLev1J2M0BTEp5+35iRDuh8Ty5yikixHjzj+Hc8KnKmJAlRKhKwdaIji+CItu34j6ADWaWWI4RoTB6Llq18INXDcmxDHH+xYvzebQldvLON3zc0iB6R8ysnKNmHS1VTiKE5y88FZsDLmRBbJMpZQqeqzyOcXPCUTIKsGF/BFPCVUbj7XpJ9Ch+IF5sohitZA0UF9NGqraMCS/qdwHVDzvrdtFXhDGnhF5T0LWF/L9dhpxrDK+NhooJqNIdCIUZ4JhZ/Aamt1HUcSAH1vlpUFsbEDomuY3GI9hUzwuUHqaFX2TaJ1v2nJ7CDdnwy+FSykaVBVLh0XXRil1y/269Blt47c=
Content-ID: <08618AA940EB2B419FDA5FCF1B25186D@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2973
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(136003)(396003)(346002)(39860400002)(199004)(189003)(316002)(386003)(99286004)(6246003)(81156014)(26005)(6636002)(6506007)(356004)(14444005)(14454004)(81166006)(22756006)(76176011)(8746002)(8936002)(50466002)(186003)(2906002)(5660300002)(6116002)(25786009)(6862004)(4326008)(8676002)(36906005)(97756001)(3846002)(46406003)(102836004)(86362001)(23726003)(47776003)(66066001)(70206006)(70586007)(229853002)(6486002)(9686003)(478600001)(486006)(54906003)(26826003)(6512007)(7736002)(63350400001)(446003)(11346002)(126002)(305945005)(476003)(76130400001)(336012)(33716001)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3098;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4e1394fb-8733-4c30-b6d6-08d752455f46
NoDisclaimer: True
X-Forefront-PRVS: 0192E812EC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t0nj+0iLOgcRSJroWfy7uKDsVyydSN52RdUR6RTjfWyGh0ShvUfBtv3E4hkl2bscDLy+mwD4mDtNhGUCaLpTfvUTRwP4Ucf8jUHMg4nv0XxZr3pbwThg3X5X6tWvXi+LXH6kjGuwrKA6rJG4E+EFKy24HPap0lgT534oMnlHgQxRGKCEw22WcjHeofpR/0IhRr0Ct9F0PA64abfgwl/+lC6mL/1oLC40WHZrgAaORA5CerSt0l4jQQdv2i/lW0OtpzRjbOys9m44LDXNxJ2oxboc636n8ccNx/FgRfQwhgSUytz29ZfDluKSng99FoVn/pfDlS+hR1b08hItR4xzv9UiDLK01senLcVhr/RT2QQeZ9ZW9x69YLk11AGBvydrqOuMCFk2eqpzgOwuapl3B4OF/DyNaMCW0Z2AiAeo4d4=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2019 14:30:34.4364 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf37bc9b-a41e-412a-0ff9-08d7524567e4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3098
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7OyTbyPqqj6409GWtJSyNvSMmG5Bzi2MmDOwmsFIT8=;
 b=922MCy7kARXTwgBqFkRXT3sjcjc9+9jgBu4ve6HvOuey/8KA7rjgkrGgGWx7iKwZk3a38ydNXERkoeD5kXF4TdT+tKbn0xcEpeolUeFArzd/xS5hxU5/qf0ElYJCiWb33hLLmKBJca+zE7i5Ep6zH08432mCkAwJHzRHXWMGpZk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7OyTbyPqqj6409GWtJSyNvSMmG5Bzi2MmDOwmsFIT8=;
 b=922MCy7kARXTwgBqFkRXT3sjcjc9+9jgBu4ve6HvOuey/8KA7rjgkrGgGWx7iKwZk3a38ydNXERkoeD5kXF4TdT+tKbn0xcEpeolUeFArzd/xS5hxU5/qf0ElYJCiWb33hLLmKBJca+zE7i5Ep6zH08432mCkAwJHzRHXWMGpZk=
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

T24gV2VkbmVzZGF5LCAxNiBPY3RvYmVyIDIwMTkgMTE6MzQ6MzAgQlNUIGphbWVzIHFpYW4gd2Fu
ZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+IEZyb206ICJMb3dyeSBMaSAoQXJtIFRl
Y2hub2xvZ3kgQ2hpbmEpIiA8TG93cnkuTGlAYXJtLmNvbT4KPiAKPiBBZGRzIGdhbW1hIGFuZCBj
b2xvci10cmFuc2Zvcm0gc3VwcG9ydCBmb3IgRE9VLUlQUy4KPiBBZGRzIHR3byBjYXBzIG1lbWJl
cnMgZmdhbW1hX2NvZWZmcyBhbmQgY3RtX2NvZWZmcyB0byBrb21lZGFfaW1wcm9jX3N0YXRlLgo+
IElmIGNvbG9yIG1hbmFnZW1lbnQgY2hhbmdlZCwgc2V0IGdhbW1hIGFuZCBjb2xvci10cmFuc2Zv
cm0gYWNjb3JkaW5nbHkuCj4gCj4gdjU6IFJlYmFzZSB3aXRoIGRybS1taXNjLW5leHQKPiAKPiBT
aWduZWQtb2ZmLWJ5OiBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxsb3dyeS5saUBh
cm0uY29tPgo+IC0tLQo+ICAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50
LmMgICAgfCAyMCArKysrKysrKysrKysrKysrKysrCj4gIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfY3J0Yy5jICB8ICAyICsrCj4gIC4uLi9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9waXBlbGluZS5oICB8ICAzICsrKwo+ICAuLi4vZGlzcGxheS9rb21lZGEva29t
ZWRhX3BpcGVsaW5lX3N0YXRlLmMgICAgfCAgNiArKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAz
MSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwo+IGluZGV4IDY3NDBiODQyMmYxMS4uNjNh
MWI2ZjljYmJhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEvZDcxL2Q3MV9jb21wb25lbnQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwo+IEBAIC0xMDMyLDcgKzEwMzIsOSBAQCBzdGF0
aWMgaW50IGQ3MV9tZXJnZXJfaW5pdChzdHJ1Y3QgZDcxX2RldiAqZDcxLAo+ICBzdGF0aWMgdm9p
ZCBkNzFfaW1wcm9jX3VwZGF0ZShzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywKPiAgCQkJICAg
ICAgc3RydWN0IGtvbWVkYV9jb21wb25lbnRfc3RhdGUgKnN0YXRlKQo+ICB7Cj4gKwlzdHJ1Y3Qg
ZHJtX2NydGNfc3RhdGUgKmNydGNfc3QgPSBzdGF0ZS0+Y3J0Yy0+c3RhdGU7Cj4gIAlzdHJ1Y3Qg
a29tZWRhX2ltcHJvY19zdGF0ZSAqc3QgPSB0b19pbXByb2Nfc3Qoc3RhdGUpOwo+ICsJc3RydWN0
IGQ3MV9waXBlbGluZSAqcGlwZSA9IHRvX2Q3MV9waXBlbGluZShjLT5waXBlbGluZSk7Cj4gIAl1
MzIgX19pb21lbSAqcmVnID0gYy0+cmVnOwo+ICAJdTMyIGluZGV4LCBtYXNrID0gMCwgY3RybCA9
IDA7Cj4gIAo+IEBAIC0xMDQzLDYgKzEwNDUsMjQgQEAgc3RhdGljIHZvaWQgZDcxX2ltcHJvY191
cGRhdGUoc3RydWN0IGtvbWVkYV9jb21wb25lbnQgKmMsCj4gIAltYWxpZHBfd3JpdGUzMihyZWcs
IEJMS19TSVpFLCBIVl9TSVpFKHN0LT5oc2l6ZSwgc3QtPnZzaXplKSk7Cj4gIAltYWxpZHBfd3Jp
dGUzMihyZWcsIElQU19ERVBUSCwgc3QtPmNvbG9yX2RlcHRoKTsKPiAgCj4gKwlpZiAoY3J0Y19z
dC0+Y29sb3JfbWdtdF9jaGFuZ2VkKSB7Cj4gKwkJbWFzayB8PSBJUFNfQ1RSTF9GVCB8IElQU19D
VFJMX1JHQjsKPiArCj4gKwkJaWYgKGNydGNfc3QtPmdhbW1hX2x1dCkgewo+ICsJCQltYWxpZHBf
d3JpdGVfZ3JvdXAocGlwZS0+ZG91X2Z0X2NvZWZmX2FkZHIsIEZUX0NPRUZGMCwKPiArCQkJCQkg
ICBLT01FREFfTl9HQU1NQV9DT0VGRlMsCj4gKwkJCQkJICAgc3QtPmZnYW1tYV9jb2VmZnMpOwo+
ICsJCQljdHJsIHw9IElQU19DVFJMX0ZUOyAvKiBlbmFibGUgZ2FtbWEgKi8KPiArCQl9Cj4gKwo+
ICsJCWlmIChjcnRjX3N0LT5jdG0pIHsKPiArCQkJbWFsaWRwX3dyaXRlX2dyb3VwKHJlZywgSVBT
X1JHQl9SR0JfQ09FRkYwLAo+ICsJCQkJCSAgIEtPTUVEQV9OX0NUTV9DT0VGRlMsCj4gKwkJCQkJ
ICAgc3QtPmN0bV9jb2VmZnMpOwo+ICsJCQljdHJsIHw9IElQU19DVFJMX1JHQjsgLyogZW5hYmxl
IGdhbXV0ICovCj4gKwkJfQo+ICsJfQo+ICsKPiAgCW1hc2sgfD0gSVBTX0NUUkxfWVVWIHwgSVBT
X0NUUkxfQ0hENDIyIHwgSVBTX0NUUkxfQ0hENDIwOwo+ICAKPiAgCS8qIGNvbmZpZyBjb2xvciBm
b3JtYXQgKi8KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfY3J0Yy5jCj4gaW5kZXggMjUyMDE1MjEwZmJjLi4xYzQ1MmVhNzU5OTkgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gQEAg
LTYxNyw2ICs2MTcsOCBAQCBzdGF0aWMgaW50IGtvbWVkYV9jcnRjX2FkZChzdHJ1Y3Qga29tZWRh
X2ttc19kZXYgKmttcywKPiAgCj4gIAljcnRjLT5wb3J0ID0ga2NydGMtPm1hc3Rlci0+b2Zfb3V0
cHV0X3BvcnQ7Cj4gIAo+ICsJZHJtX2NydGNfZW5hYmxlX2NvbG9yX21nbXQoY3J0YywgMCwgdHJ1
ZSwgS09NRURBX0NPTE9SX0xVVF9TSVpFKTsKPiArCj4gIAlyZXR1cm4gZXJyOwo+ICB9Cj4gIAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9w
aXBlbGluZS5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlw
ZWxpbmUuaAo+IGluZGV4IGJkNmNhN2M4NzAzNy4uYWM4NzI1ZTI0ODUzIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5o
Cj4gQEAgLTExLDYgKzExLDcgQEAKPiAgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljLmg+Cj4gICNp
bmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4KPiAgI2luY2x1ZGUgIm1hbGlkcF91dGls
cy5oIgo+ICsjaW5jbHVkZSAia29tZWRhX2NvbG9yX21nbXQuaCIKPiAgCj4gICNkZWZpbmUgS09N
RURBX01BWF9QSVBFTElORVMJCTIKPiAgI2RlZmluZSBLT01FREFfUElQRUxJTkVfTUFYX0xBWUVS
Uwk0Cj4gQEAgLTMyNyw2ICszMjgsOCBAQCBzdHJ1Y3Qga29tZWRhX2ltcHJvY19zdGF0ZSB7Cj4g
IAlzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudF9zdGF0ZSBiYXNlOwo+ICAJdTggY29sb3JfZm9ybWF0
LCBjb2xvcl9kZXB0aDsKPiAgCXUxNiBoc2l6ZSwgdnNpemU7Cj4gKwl1MzIgZmdhbW1hX2NvZWZm
c1tLT01FREFfTl9HQU1NQV9DT0VGRlNdOwo+ICsJdTMyIGN0bV9jb2VmZnNbS09NRURBX05fQ1RN
X0NPRUZGU107Cj4gIH07Cj4gIAo+ICAvKiBkaXNwbGF5IHRpbWluZyBjb250cm9sbGVyICovCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3Bp
cGVsaW5lX3N0YXRlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9waXBlbGluZV9zdGF0ZS5jCj4gaW5kZXggNDJiZGM2M2RjZmZhLi4wOTMwMjM0YWJiOWQgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlw
ZWxpbmVfc3RhdGUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX3BpcGVsaW5lX3N0YXRlLmMKPiBAQCAtODAyLDYgKzgwMiwxMiBAQCBrb21lZGFfaW1w
cm9jX3ZhbGlkYXRlKHN0cnVjdCBrb21lZGFfaW1wcm9jICppbXByb2MsCj4gIAkJc3QtPmNvbG9y
X2Zvcm1hdCA9IEJJVChfX2ZmcyhhdmFpbF9mb3JtYXRzKSk7Cj4gIAl9Cj4gIAo+ICsJaWYgKGtj
cnRjX3N0LT5iYXNlLmNvbG9yX21nbXRfY2hhbmdlZCkgewo+ICsJCWRybV9sdXRfdG9fZmdhbW1h
X2NvZWZmcyhrY3J0Y19zdC0+YmFzZS5nYW1tYV9sdXQsCj4gKwkJCQkJIHN0LT5mZ2FtbWFfY29l
ZmZzKTsKPiArCQlkcm1fY3RtX3RvX2NvZWZmcyhrY3J0Y19zdC0+YmFzZS5jdG0sIHN0LT5jdG1f
Y29lZmZzKTsKPiArCX0KPiArCj4gIAlrb21lZGFfY29tcG9uZW50X2FkZF9pbnB1dCgmc3QtPmJh
c2UsICZkZmxvdy0+aW5wdXQsIDApOwo+ICAJa29tZWRhX2NvbXBvbmVudF9zZXRfb3V0cHV0KCZk
Zmxvdy0+aW5wdXQsICZpbXByb2MtPmJhc2UsIDApOwo+ICAKPiAKWW91IG11c3QndmUgbWlzc2Vk
IGl0LCBidXQgSSBoYWQgYQoKUmV2aWV3ZWQtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5h
dGFuYXNzb3ZAYXJtLmNvbT4KCihncmFudGVkLCBpdCB3YXMgZGVlcGVyIGluIGEgdGhyZWFkIGFu
ZCBxdWl0ZSBpbmZvcm1hbGx5IHdyaXR0ZW4KYXMgJ3ItYiBtZScpCgotLSAKTWloYWlsCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
