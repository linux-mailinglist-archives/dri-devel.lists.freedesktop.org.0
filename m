Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9572DE53A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 09:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FCB899FF;
	Mon, 21 Oct 2019 07:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70071.outbound.protection.outlook.com [40.107.7.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2F0899FF
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 07:23:47 +0000 (UTC)
Received: from VI1PR08CA0103.eurprd08.prod.outlook.com (2603:10a6:800:d3::29)
 by DB8PR08MB5194.eurprd08.prod.outlook.com (2603:10a6:10:e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.21; Mon, 21 Oct
 2019 07:23:42 +0000
Received: from VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::203) by VI1PR08CA0103.outlook.office365.com
 (2603:10a6:800:d3::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2367.21 via Frontend
 Transport; Mon, 21 Oct 2019 07:23:42 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT039.mail.protection.outlook.com (10.152.19.196) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 21 Oct 2019 07:23:42 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Mon, 21 Oct 2019 07:23:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c6431d9452722dc9
X-CR-MTA-TID: 64aa7808
Received: from 2dca2d14250f.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.8.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9E25DFA7-8A86-47C2-BFAB-E534FC3623DB.1; 
 Mon, 21 Oct 2019 07:23:31 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2056.outbound.protection.outlook.com [104.47.8.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2dca2d14250f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Mon, 21 Oct 2019 07:23:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=erdC2wv+Sk068iTSZKwt1ZIs8ZI1m1m5wL+ZNiXzOARLB/kaxFjCmDYQ6BM4ODpRim1c7vjIbgwHwa8DMTfpr6+a3esxW0eTJKOPvXPHcgXEAiFItyKzKCoucrShVEYG8UhMIk8ykgN1Fq/abbduGQn5MvvK9vLVW3r9o/t/9sNqqOKL7iYXCpfVBCZsQdOi9uuy/G2TM6+Lu+7DtswkF3qv/aSJYSlMUn5Wyrl5r2jiIfmFPGANXl75AVy6NgcGSFYC+giXdwiN675OUd2yHe9+AamScNNo9kaZu1SwKlFP6ftaSfHJZxIuWzq4nWCfTAvodYhIbZU0MffgRWRf7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vC99I3Z56ZuZCx4QJHgqK2QJ3GtYUvtyOKpAuzBHzXI=;
 b=Kd+Vk53rxD9uyUg86err7dQdA2R+bsOMSbbCCjxoeBsgOiL5N+b/Na8VZXPSyMaDoFog9kDWv8KnGHjJHaotXNW+Bwny0K7KmXiftOlbyJMT0pGWgxTiE15Ii7O5rVrZ99sEwp66gwrSTC3YqhmfhCIl6vQzEUh+7/bDHiloHrIOp1s2HYVH6sSUwq9i/CbJxsEv8PTCW4Ifse0Wj3A/AcgLuOrY3k/TbNvHRmhTSNe4cJK97zgEc9KkRbLad37yZOy/go8hSYQsSaQwtNZinnmhfjo9cNSiF4GLm0gvPyYEAVyWkICRIx3QlsWgfkZzLulf1LHWnJ9537Ptrc/W0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4831.eurprd08.prod.outlook.com (10.255.115.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Mon, 21 Oct 2019 07:23:29 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.028; Mon, 21 Oct 2019
 07:23:29 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: [PATCH v6 4/4] drm/komeda: Adds gamma and color-transform support for
 DOU-IPS
Thread-Topic: [PATCH v6 4/4] drm/komeda: Adds gamma and color-transform
 support for DOU-IPS
Thread-Index: AQHVh+Bv2LYjVeuTFU+5R6eahc8s7w==
Date: Mon, 21 Oct 2019 07:23:29 +0000
Message-ID: <20191021072215.3993-5-james.qian.wang@arm.com>
References: <20191021072215.3993-1-james.qian.wang@arm.com>
In-Reply-To: <20191021072215.3993-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0401CA0019.apcprd04.prod.outlook.com
 (2603:1096:202:2::29) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: da36ee62-4549-4579-a02d-08d755f799c3
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4831:|VE1PR08MB4831:|DB8PR08MB5194:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB519434D482E24FD36E4508E1B3690@DB8PR08MB5194.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2582;OLM:2582;
x-forefront-prvs: 0197AFBD92
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(39850400004)(396003)(136003)(376002)(199004)(189003)(110136005)(6506007)(6486002)(386003)(66066001)(4326008)(8676002)(66946007)(54906003)(99286004)(103116003)(36756003)(6512007)(6436002)(66446008)(64756008)(66556008)(66476007)(55236004)(2171002)(102836004)(2501003)(26005)(14454004)(186003)(81156014)(81166006)(2201001)(478600001)(11346002)(446003)(316002)(2906002)(7736002)(86362001)(71190400001)(71200400001)(256004)(6116002)(25786009)(305945005)(14444005)(486006)(3846002)(76176011)(52116002)(5660300002)(8936002)(2616005)(476003)(1076003)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4831;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Lu2D4UUses/4lCKQk721tUCiG6ME66/kITIOaXGNE7My1e4U4EGFNiiIezn1NGdj0chHNuSrkj4kOzNqjgxYDGJK10Wxptz1ECMKGTKCstY7cDQBxggLFDMgOQYz15SVMHAEtCNcHUUB3lg7q8gC1Es3OZNtEpX3swU+kzvWdxK19D9vFRBLz3/2/eKMduXfwLHuA3iW7Ve4qpWUwX/Ua2sAVqSDz6par/8SChZtELHaMZ3uXhbM9mtyH0JBsKjxg8hH5dsjcm4xOzpJeOIYhyXpMyipyhb18a7kEkEd3cOKGsffmIguB0WPqA3z9ezGc5FchA9kg5tqUnHrAbG6J11IOwe6XeGrrxqbedYL6bFEjilI/kAxfl5PVbojb1Y9XgoFFvB0l3r4Gy7aaDeHmh6t3JJ3exejgMecnJKCrjo=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4831
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(396003)(346002)(199004)(189003)(3846002)(50226002)(76176011)(316002)(8676002)(81166006)(6506007)(386003)(8746002)(102836004)(1076003)(446003)(8936002)(25786009)(50466002)(81156014)(6486002)(6116002)(126002)(110136005)(476003)(11346002)(14444005)(2616005)(99286004)(486006)(356004)(54906003)(22756006)(36906005)(14454004)(2501003)(23756003)(186003)(26005)(26826003)(76130400001)(305945005)(7736002)(103116003)(336012)(2171002)(2201001)(86362001)(70586007)(5660300002)(6512007)(4326008)(70206006)(36756003)(2906002)(47776003)(63350400001)(66066001)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB5194;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6071ebe0-6ddb-4be9-6bf8-08d755f791c5
NoDisclaimer: True
X-Forefront-PRVS: 0197AFBD92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7w35rtaYnh93uRku6cDlXTiCEZH5u1o6wVdVdy6OhUJt8/xy6Dk0jB6+6ETgc2iSkzXZL1IYhdl7OMzWRfXYdaSyMZjWoqRAzgxZWaKSYXb4H8oJF6t3JhFPQHpMJ8wGVsBciq7tfSRS09VhWQT8dlVnJO5cZe73ybKruiW5CJspwzmh43Qt9/w57XdcnaGq4K0DjkeYbedNBWRbhHpvJSV1thMWUKei+9uqVq2CYA/ZxzaFYluMJcDAkc82WTjGBWKpfLSPnavt16grQ4J3HczXz2zArxIONIIcR0/mun7ZNV+E2Z+VNRmxxJC81NLCkpIzGmDuw+LfZXpLP6nBPAH63XX8r3SGm3Qo9x/BToVRLu/7/TvPwq62u6MOMCUWZO0a/DBnsEJBFIzYBzXXARGZMWtdmNWF6I+2WJzMTmBdBdKxlKIjLAAPTzaAVLEB
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2019 07:23:42.0161 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da36ee62-4549-4579-a02d-08d755f799c3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5194
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vC99I3Z56ZuZCx4QJHgqK2QJ3GtYUvtyOKpAuzBHzXI=;
 b=j3k6pGn1gP80nCdACc3YDwKlcmyiLaEVALHjz0b7PI4IqPE1vZ33HG71eh9TyUgZmK9FRcc7SSM+GGalkvGjTit1ToLwxAkMiIHy+sEyY0dSSZGhZwmuq1stOA0KYKL7Me+qxYAwTnsTUAPihSxKzDPRYjcVindif7Cx/tydxXk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vC99I3Z56ZuZCx4QJHgqK2QJ3GtYUvtyOKpAuzBHzXI=;
 b=j3k6pGn1gP80nCdACc3YDwKlcmyiLaEVALHjz0b7PI4IqPE1vZ33HG71eh9TyUgZmK9FRcc7SSM+GGalkvGjTit1ToLwxAkMiIHy+sEyY0dSSZGhZwmuq1stOA0KYKL7Me+qxYAwTnsTUAPihSxKzDPRYjcVindif7Cx/tydxXk=
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
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogIkxvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkiIDxMb3dyeS5MaUBhcm0uY29t
PgoKQWRkcyBnYW1tYSBhbmQgY29sb3ItdHJhbnNmb3JtIHN1cHBvcnQgZm9yIERPVS1JUFMuCkFk
ZHMgdHdvIGNhcHMgbWVtYmVycyBmZ2FtbWFfY29lZmZzIGFuZCBjdG1fY29lZmZzIHRvIGtvbWVk
YV9pbXByb2Nfc3RhdGUuCklmIGNvbG9yIG1hbmFnZW1lbnQgY2hhbmdlZCwgc2V0IGdhbW1hIGFu
ZCBjb2xvci10cmFuc2Zvcm0gYWNjb3JkaW5nbHkuCgp2NTogUmViYXNlIHdpdGggZHJtLW1pc2Mt
bmV4dAoKU2lnbmVkLW9mZi1ieTogTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8bG93
cnkubGlAYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFu
YXNzb3ZAYXJtLmNvbT4KLS0tCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9u
ZW50LmMgICAgfCAyMCArKysrKysrKysrKysrKysrKysrCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2NydGMuYyAgfCAgMiArKwogLi4uL2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX3BpcGVsaW5lLmggIHwgIDMgKysrCiAuLi4vZGlzcGxheS9rb21lZGEva29tZWRh
X3BpcGVsaW5lX3N0YXRlLmMgICAgfCAgNiArKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMzEgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEvZDcxL2Q3MV9jb21wb25lbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEvZDcxL2Q3MV9jb21wb25lbnQuYwppbmRleCA2NzQwYjg0MjJmMTEuLjYzYTFiNmY5Y2JiYSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Nv
bXBvbmVudC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3
MV9jb21wb25lbnQuYwpAQCAtMTAzMiw3ICsxMDMyLDkgQEAgc3RhdGljIGludCBkNzFfbWVyZ2Vy
X2luaXQoc3RydWN0IGQ3MV9kZXYgKmQ3MSwKIHN0YXRpYyB2b2lkIGQ3MV9pbXByb2NfdXBkYXRl
KHN0cnVjdCBrb21lZGFfY29tcG9uZW50ICpjLAogCQkJICAgICAgc3RydWN0IGtvbWVkYV9jb21w
b25lbnRfc3RhdGUgKnN0YXRlKQogeworCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdCA9
IHN0YXRlLT5jcnRjLT5zdGF0ZTsKIAlzdHJ1Y3Qga29tZWRhX2ltcHJvY19zdGF0ZSAqc3QgPSB0
b19pbXByb2Nfc3Qoc3RhdGUpOworCXN0cnVjdCBkNzFfcGlwZWxpbmUgKnBpcGUgPSB0b19kNzFf
cGlwZWxpbmUoYy0+cGlwZWxpbmUpOwogCXUzMiBfX2lvbWVtICpyZWcgPSBjLT5yZWc7CiAJdTMy
IGluZGV4LCBtYXNrID0gMCwgY3RybCA9IDA7CiAKQEAgLTEwNDMsNiArMTA0NSwyNCBAQCBzdGF0
aWMgdm9pZCBkNzFfaW1wcm9jX3VwZGF0ZShzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywKIAlt
YWxpZHBfd3JpdGUzMihyZWcsIEJMS19TSVpFLCBIVl9TSVpFKHN0LT5oc2l6ZSwgc3QtPnZzaXpl
KSk7CiAJbWFsaWRwX3dyaXRlMzIocmVnLCBJUFNfREVQVEgsIHN0LT5jb2xvcl9kZXB0aCk7CiAK
KwlpZiAoY3J0Y19zdC0+Y29sb3JfbWdtdF9jaGFuZ2VkKSB7CisJCW1hc2sgfD0gSVBTX0NUUkxf
RlQgfCBJUFNfQ1RSTF9SR0I7CisKKwkJaWYgKGNydGNfc3QtPmdhbW1hX2x1dCkgeworCQkJbWFs
aWRwX3dyaXRlX2dyb3VwKHBpcGUtPmRvdV9mdF9jb2VmZl9hZGRyLCBGVF9DT0VGRjAsCisJCQkJ
CSAgIEtPTUVEQV9OX0dBTU1BX0NPRUZGUywKKwkJCQkJICAgc3QtPmZnYW1tYV9jb2VmZnMpOwor
CQkJY3RybCB8PSBJUFNfQ1RSTF9GVDsgLyogZW5hYmxlIGdhbW1hICovCisJCX0KKworCQlpZiAo
Y3J0Y19zdC0+Y3RtKSB7CisJCQltYWxpZHBfd3JpdGVfZ3JvdXAocmVnLCBJUFNfUkdCX1JHQl9D
T0VGRjAsCisJCQkJCSAgIEtPTUVEQV9OX0NUTV9DT0VGRlMsCisJCQkJCSAgIHN0LT5jdG1fY29l
ZmZzKTsKKwkJCWN0cmwgfD0gSVBTX0NUUkxfUkdCOyAvKiBlbmFibGUgZ2FtdXQgKi8KKwkJfQor
CX0KKwogCW1hc2sgfD0gSVBTX0NUUkxfWVVWIHwgSVBTX0NUUkxfQ0hENDIyIHwgSVBTX0NUUkxf
Q0hENDIwOwogCiAJLyogY29uZmlnIGNvbG9yIGZvcm1hdCAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCmluZGV4IDI1MjAxNTIxMGZiYy4u
MWM0NTJlYTc1OTk5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jcnRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfY3J0Yy5jCkBAIC02MTcsNiArNjE3LDggQEAgc3RhdGljIGludCBrb21lZGFfY3J0
Y19hZGQoc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprbXMsCiAKIAljcnRjLT5wb3J0ID0ga2NydGMt
Pm1hc3Rlci0+b2Zfb3V0cHV0X3BvcnQ7CiAKKwlkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdChj
cnRjLCAwLCB0cnVlLCBLT01FREFfQ09MT1JfTFVUX1NJWkUpOworCiAJcmV0dXJuIGVycjsKIH0K
IApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
cGlwZWxpbmUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3Bp
cGVsaW5lLmgKaW5kZXggYmQ2Y2E3Yzg3MDM3Li5hYzg3MjVlMjQ4NTMgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaApAQCAt
MTEsNiArMTEsNyBAQAogI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljLmg+CiAjaW5jbHVkZSA8ZHJt
L2RybV9hdG9taWNfaGVscGVyLmg+CiAjaW5jbHVkZSAibWFsaWRwX3V0aWxzLmgiCisjaW5jbHVk
ZSAia29tZWRhX2NvbG9yX21nbXQuaCIKIAogI2RlZmluZSBLT01FREFfTUFYX1BJUEVMSU5FUwkJ
MgogI2RlZmluZSBLT01FREFfUElQRUxJTkVfTUFYX0xBWUVSUwk0CkBAIC0zMjcsNiArMzI4LDgg
QEAgc3RydWN0IGtvbWVkYV9pbXByb2Nfc3RhdGUgewogCXN0cnVjdCBrb21lZGFfY29tcG9uZW50
X3N0YXRlIGJhc2U7CiAJdTggY29sb3JfZm9ybWF0LCBjb2xvcl9kZXB0aDsKIAl1MTYgaHNpemUs
IHZzaXplOworCXUzMiBmZ2FtbWFfY29lZmZzW0tPTUVEQV9OX0dBTU1BX0NPRUZGU107CisJdTMy
IGN0bV9jb2VmZnNbS09NRURBX05fQ1RNX0NPRUZGU107CiB9OwogCiAvKiBkaXNwbGF5IHRpbWlu
ZyBjb250cm9sbGVyICovCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYwppbmRleCA0MmJkYzYzZGNmZmEuLjA5
MzAyMzRhYmI5ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jCkBAIC04MDIsNiArODAyLDEyIEBAIGtv
bWVkYV9pbXByb2NfdmFsaWRhdGUoc3RydWN0IGtvbWVkYV9pbXByb2MgKmltcHJvYywKIAkJc3Qt
PmNvbG9yX2Zvcm1hdCA9IEJJVChfX2ZmcyhhdmFpbF9mb3JtYXRzKSk7CiAJfQogCisJaWYgKGtj
cnRjX3N0LT5iYXNlLmNvbG9yX21nbXRfY2hhbmdlZCkgeworCQlkcm1fbHV0X3RvX2ZnYW1tYV9j
b2VmZnMoa2NydGNfc3QtPmJhc2UuZ2FtbWFfbHV0LAorCQkJCQkgc3QtPmZnYW1tYV9jb2VmZnMp
OworCQlkcm1fY3RtX3RvX2NvZWZmcyhrY3J0Y19zdC0+YmFzZS5jdG0sIHN0LT5jdG1fY29lZmZz
KTsKKwl9CisKIAlrb21lZGFfY29tcG9uZW50X2FkZF9pbnB1dCgmc3QtPmJhc2UsICZkZmxvdy0+
aW5wdXQsIDApOwogCWtvbWVkYV9jb21wb25lbnRfc2V0X291dHB1dCgmZGZsb3ctPmlucHV0LCAm
aW1wcm9jLT5iYXNlLCAwKTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
