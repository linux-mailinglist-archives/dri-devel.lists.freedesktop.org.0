Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 387F5D085D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827796E109;
	Wed,  9 Oct 2019 07:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150088.outbound.protection.outlook.com [40.107.15.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE186E109
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 07:34:13 +0000 (UTC)
Received: from VI1PR08CA0139.eurprd08.prod.outlook.com (2603:10a6:800:d5::17)
 by DB7PR08MB3003.eurprd08.prod.outlook.com (2603:10a6:5:1b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.24; Wed, 9 Oct
 2019 07:34:09 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by VI1PR08CA0139.outlook.office365.com
 (2603:10a6:800:d5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 9 Oct 2019 07:34:09 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Wed, 9 Oct 2019 07:34:07 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Wed, 09 Oct 2019 07:34:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 89b7025407d70dc6
X-CR-MTA-TID: 64aa7808
Received: from 9834a8bad193.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.2.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 02F0C33D-A5F0-44EC-9D3E-1A49E6F61E0E.1; 
 Wed, 09 Oct 2019 07:33:55 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9834a8bad193.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Wed, 09 Oct 2019 07:33:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfpEUaDk2ZCNHuSN92+8Vfri/No6QllLkHn6Vr7S4L2yBmRT6sYjmAQalg3pazjai6su7wKWfo82t/G5eXhZ0B9fSstm79lt1Hvbsn4f1Bkh95Tn9Y3M73I4dtmYRZpXozb2utDPh313uxQvzxN0YZxvnAwSIh6Jd3zfo+gRP6M+AumYzoSg3gI17bAfgYA6TMdWgbV+JG82m2UZaSDUXuXeuXZ6TuyQWQ4LUB4J4nMNFjOQ5ZRXXH/O/D9Yg1Le1ljrMnz4w15hp8QTTlljsAA20otv3zM7dcRbYdFUeotOElmAqBWj4kKUDdEIAfpVNn5aE3o//L5F49FajdH/qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEI8NIVUsWJFXlYd6MRAcc7FR+LkQnseTgpc5WQHRyM=;
 b=MJQeVT9kGQG+/fkqeku/mDfYEM9TIYv+NU/Jd48P+Rj58ZWakCy8WyL/ERJzE18bQF1086vqE/MPh32jpPySW4zXWH8GZl+ZDzBC2myuzwhCnk+fvvjVStRUYkPYelDtfTuK09x/sLWmhbAauHXbWHgWKNpYEEyXd+sbb68iKmCO6q0RI7uWrdCyHo2z64ojui3TIa78OntTwa4ywcWPJ3aTRyjaXDOG+4Rnywf/M5urVdIA67pogSuFFfqW3byVSLrI1BOAZtFMmDZlFeH7JX7GLlS//Gh4kBnfolyZhMaIN1CdOnI7880k0pp4/GzlnEOP4vKcpqOB6FCgYS3+yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3997.eurprd08.prod.outlook.com (20.178.126.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Wed, 9 Oct 2019 07:33:53 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e52a:a540:75ae:ced9]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e52a:a540:75ae:ced9%4]) with mapi id 15.20.2347.016; Wed, 9 Oct 2019
 07:33:53 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH] drm/komeda: Set output color depth for output
Thread-Topic: [PATCH] drm/komeda: Set output color depth for output
Thread-Index: AQHVfblD7I+ubO1huUCp0qQz7Z0Q4adQfC0AgAAOlYCAAA4iAIABU24A
Date: Wed, 9 Oct 2019 07:33:53 +0000
Message-ID: <20191009073346.GA31246@lowli01-ThinkStation-P300>
References: <20191008091734.19509-1-lowry.li@arm.com>
 <20191008093608.eyr5ygc2lkkaaqia@DESKTOP-E1NTVVP.localdomain>
 <20191008102818.GB16398@lowli01-ThinkStation-P300>
 <3803267.CWkr2XGRCA@e123338-lin>
In-Reply-To: <3803267.CWkr2XGRCA@e123338-lin>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0108.apcprd03.prod.outlook.com
 (2603:1096:203:b0::24) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a7db6493-59ae-4ad4-7eba-08d74c8b11ad
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB3997:|VI1PR08MB3997:|DB7PR08MB3003:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB300360DC9ED6189295159B2D9F950@DB7PR08MB3003.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
x-forefront-prvs: 018577E36E
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(376002)(136003)(346002)(366004)(39860400002)(189003)(199004)(26005)(316002)(58126008)(6116002)(256004)(3846002)(14444005)(99286004)(25786009)(66066001)(486006)(55236004)(52116002)(33716001)(478600001)(76176011)(186003)(6506007)(102836004)(386003)(446003)(11346002)(54906003)(2906002)(71200400001)(71190400001)(476003)(6486002)(14454004)(6246003)(33656002)(6436002)(8936002)(81166006)(6512007)(66946007)(8676002)(9686003)(229853002)(6636002)(6862004)(1076003)(81156014)(64756008)(66556008)(66446008)(305945005)(7736002)(86362001)(66476007)(5660300002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3997;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: CBBNkElDIP1W2aMDdqOOE1TNS5cj8mzEkm4TB/z4Z4ha+9c2rArE7OWfJIZ0wchANe+dSAAR+yykfLotUQPxeh/edk1EZCyl+Au7Sm6GrHksdRfmvWA9sZHBYvcurwEV8faGfREONZQyHyUKHLwyGq/cZs+LByfhuv6wb6DnDA0OLFIo2lOc7tPr2dRCXs/M3lBKQtjf6cdVc/cdsX60/0I2pn7GK5+9PJH787W+2+B8PvSY8LX8O9DEacU7IfUfWI315ZQ6pBMdy6D6kFMh0xHSf/I0tK50RPza3ZgG1xYxSjBdcxt9VfcPPxbei0msio/OfQsaShq68wF7ES0hD/OdiUOqHJZ3UQ08v0kh8TbPwmlAaoB3NDiCPHGA8l//pf2zj0IstcoNsNMz50DQvR56ziQEgqYrYRj6eRVkc7U=
Content-ID: <76B450A400CBB243935D6642FC93D224@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3997
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(376002)(136003)(396003)(346002)(199004)(189003)(26005)(63350400001)(47776003)(36906005)(316002)(50466002)(58126008)(6116002)(3846002)(23726003)(14444005)(46406003)(99286004)(25786009)(66066001)(486006)(478600001)(76176011)(33716001)(186003)(26826003)(6506007)(102836004)(446003)(11346002)(386003)(54906003)(2906002)(476003)(126002)(336012)(8746002)(22756006)(70206006)(6486002)(14454004)(6246003)(33656002)(8936002)(6636002)(6512007)(8676002)(9686003)(81166006)(229853002)(6862004)(97756001)(81156014)(1076003)(70586007)(305945005)(7736002)(86362001)(5660300002)(4326008)(76130400001)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3003;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3fa566a4-9251-49c2-bda2-08d74c8b08f9
NoDisclaimer: True
X-Forefront-PRVS: 018577E36E
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cGd/Qod7mXdRWd1imb3KcebtLAcn9PZKXYI48ZJj2rwtKbgK/rlVokEvwbjOeGCADrVSrIfQ77clqJw4BWtuz+4Fw/i2L70Y6zGfebAAviHLt0QDBFaUj00wKm+Vl2gFwj63J9RCe34ANAUTbvAu56un+3Y9ZoR0NB+sw5Pv/vnixVY/OjplCDki2cagzdEfEKr5Uq5NO7tbNR+/8o2aJW7on8F1p6ftry4OReqZVicTIWj4/nyvn11xDTIm70s65kxrEKqDUtacPg483U1Yx5GXQ9GQu6zrSx9vQ3UWaND65mLJKVP6OD7uu2dPx0/MKjfAyq3qydxvlLn6lbTsS9O5xQ1RcbGTUI6xco2vWU4iWghnGLhICIKVwTRo5ep8ndrfPLRhYPCQC4m6s9CvaBlF7e3YMPxMqkZXPgaIqCg=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 07:34:07.6211 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7db6493-59ae-4ad4-7eba-08d74c8b11ad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3003
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEI8NIVUsWJFXlYd6MRAcc7FR+LkQnseTgpc5WQHRyM=;
 b=rK9edBonaH371U7Uh/50t+cMs7ONtKbz2tGP03hMhOgQzu9+tD2pgiLotfRp9PMHdNmzyKkl/HSgvO4dgXlziB6dJdyZRNf5bkdZi0uUZBKpZCsj93oZvpk3Ec0InFzvWab3x9rWaY+Cjbv0xfoV+uqcCw8UZX2I/AZB++2I9cM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEI8NIVUsWJFXlYd6MRAcc7FR+LkQnseTgpc5WQHRyM=;
 b=rK9edBonaH371U7Uh/50t+cMs7ONtKbz2tGP03hMhOgQzu9+tD2pgiLotfRp9PMHdNmzyKkl/HSgvO4dgXlziB6dJdyZRNf5bkdZi0uUZBKpZCsj93oZvpk3Ec0InFzvWab3x9rWaY+Cjbv0xfoV+uqcCw8UZX2I/AZB++2I9cM=
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
Cc: nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWloYWlsLApPbiBUdWUsIE9jdCAwOCwgMjAxOSBhdCAxMToxODo1NkFNICswMDAwLCBNaWhh
aWwgQXRhbmFzc292IHdyb3RlOgo+IE9uIFR1ZXNkYXksIDggT2N0b2JlciAyMDE5IDExOjI4OjI0
IEJTVCBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gSGkgQnJpYW4s
Cj4gPiBPbiBUdWUsIE9jdCAwOCwgMjAxOSBhdCAwOTozNjowOUFNICswMDAwLCBCcmlhbiBTdGFy
a2V5IHdyb3RlOgo+ID4gPiBIaSBMb3dyeSwKPiA+ID4gCj4gPiA+IE9uIFR1ZSwgT2N0IDA4LCAy
MDE5IGF0IDA5OjE3OjUyQU0gKzAwMDAsIExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkg
d3JvdGU6Cj4gPiA+ID4gU2V0IGNvbG9yX2RlcHRoIGFjY29yZGluZyB0byBjb25uZWN0b3ItPmJw
Yy4KPiA+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMb3dyeSBMaSAoQXJtIFRlY2hub2xv
Z3kgQ2hpbmEpIDxsb3dyeS5saUBhcm0uY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICAuLi4vYXJt
L2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgICAgfCAgMSArCj4gPiA+ID4gIC4u
Li9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jICB8IDIwICsrKysrKysr
KysrKysrKysrKysKPiA+ID4gPiAgLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9rbXMuaCAgIHwgIDIgKysKPiA+ID4gPiAgLi4uL2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX3BpcGVsaW5lLmggIHwgIDEgKwo+ID4gPiA+ICAuLi4vZGlzcGxheS9rb21lZGEva29tZWRh
X3BpcGVsaW5lX3N0YXRlLmMgICAgfCAxOSArKysrKysrKysrKysrKysrKysKPiA+ID4gPiAgLi4u
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMgIHwgIDQgKysrKwo+ID4g
PiA+ICA2IGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKykKPiA+ID4gPiAKPiA+ID4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Nv
bXBvbmVudC5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Nv
bXBvbmVudC5jCj4gPiA+ID4gaW5kZXggYzNkMjljMGIwNTFiLi4yN2NkYjAzNTczYzEgMTAwNjQ0
Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcx
X2NvbXBvbmVudC5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jCj4gPiA+ID4gQEAgLTk1MSw2ICs5NTEsNyBAQCBzdGF0
aWMgdm9pZCBkNzFfaW1wcm9jX3VwZGF0ZShzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywKPiA+
ID4gPiAgCQkJICAgICAgIHRvX2Q3MV9pbnB1dF9pZChzdGF0ZSwgaW5kZXgpKTsKPiA+ID4gPiAg
Cj4gPiA+ID4gIAltYWxpZHBfd3JpdGUzMihyZWcsIEJMS19TSVpFLCBIVl9TSVpFKHN0LT5oc2l6
ZSwgc3QtPnZzaXplKSk7Cj4gPiA+ID4gKwltYWxpZHBfd3JpdGUzMihyZWcsIElQU19ERVBUSCwg
c3QtPmNvbG9yX2RlcHRoKTsKPiA+ID4gPiAgfQo+ID4gPiA+ICAKPiA+ID4gPiAgc3RhdGljIHZv
aWQgZDcxX2ltcHJvY19kdW1wKHN0cnVjdCBrb21lZGFfY29tcG9uZW50ICpjLCBzdHJ1Y3Qgc2Vx
X2ZpbGUgKnNmKQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jcnRjLmMKPiA+ID4gPiBpbmRleCA3NTI2M2Q4Y2QwYmQuLmJhYTk4NmI3MDg3
NiAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9jcnRjLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9jcnRjLmMKPiA+ID4gPiBAQCAtMTcsNiArMTcsMjYgQEAKPiA+ID4gPiAg
I2luY2x1ZGUgImtvbWVkYV9kZXYuaCIKPiA+ID4gPiAgI2luY2x1ZGUgImtvbWVkYV9rbXMuaCIK
PiA+ID4gPiAgCj4gPiA+ID4gK3ZvaWQga29tZWRhX2NydGNfZ2V0X2NvbG9yX2NvbmZpZyhzdHJ1
Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3QsCj4gPiA+ID4gKwkJCQkgIHUzMiAqY29sb3JfZGVw
dGhzKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKwlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubjsKPiA+
ID4gPiArCXN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpjb25uX3N0Owo+ID4gPiA+ICsJaW50
IGksIG1pbl9icGMgPSAzMSwgY29ubl9icGMgPSAwOwo+ID4gPiA+ICsKPiA+ID4gPiArCWZvcl9l
YWNoX25ld19jb25uZWN0b3JfaW5fc3RhdGUoY3J0Y19zdC0+c3RhdGUsIGNvbm4sIGNvbm5fc3Qs
IGkpIHsKPiA+ID4gPiArCQlpZiAoY29ubl9zdC0+Y3J0YyAhPSBjcnRjX3N0LT5jcnRjKQo+ID4g
PiA+ICsJCQljb250aW51ZTsKPiA+ID4gPiArCj4gPiA+ID4gKwkJY29ubl9icGMgPSBjb25uLT5k
aXNwbGF5X2luZm8uYnBjID8gY29ubi0+ZGlzcGxheV9pbmZvLmJwYyA6IDg7Cj4gPiA+IAo+ID4g
PiBXZSBjYW4gaGF2ZSBtdWx0aXBsZSBjb25uZWN0b3JzIG9uIGEgc2luZ2xlIENSVEMgKGUuZy4g
bm9ybWFsICsKPiA+ID4gd3JpdGViYWNrKSwgc28gd2hhdCdzIHRoZSBleHBlY3RlZCBiZWhhdmlv
dXIgaGVyZSBpbiB0aGF0IGNhc2U/Cj4gPiA+IAo+ID4gPiA+ICsKPiA+ID4gPiArCQlpZiAoY29u
bl9icGMgPCBtaW5fYnBjKQo+ID4gPiA+ICsJCQltaW5fYnBjID0gY29ubl9icGM7Cj4gPiA+ID4g
Kwl9Cj4gPiA+ID4gKwo+ID4gPiA+ICsJKmNvbG9yX2RlcHRocyA9IEdFTk1BU0soY29ubl9icGMs
IDApOwo+ID4gPiA+ICt9Cj4gPiA+ID4gKwo+ID4gPiA+ICBzdGF0aWMgdm9pZCBrb21lZGFfY3J0
Y191cGRhdGVfY2xvY2tfcmF0aW8oc3RydWN0IGtvbWVkYV9jcnRjX3N0YXRlICprY3J0Y19zdCkK
PiA+ID4gPiAgewo+ID4gPiA+ICAJdTY0IHB4bGNsaywgYWNsazsKPiA+ID4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmggYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaAo+ID4gPiA+IGluZGV4
IDQ1YzQ5OGUxNWU3YS4uYTQyNTAzNDUxYjVkIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5oCj4gPiA+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgKPiA+ID4gPiBAQCAt
MTY2LDYgKzE2Niw4IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBoYXNfZmxpcF9oKHUzMiByb3QpCj4g
PiA+ID4gIAkJcmV0dXJuICEhKHJvdGF0aW9uICYgRFJNX01PREVfUkVGTEVDVF9YKTsKPiA+ID4g
PiAgfQo+ID4gPiA+ICAKPiA+ID4gPiArdm9pZCBrb21lZGFfY3J0Y19nZXRfY29sb3JfY29uZmln
KHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdCwKPiA+ID4gPiArCQkJCSAgdTMyICpjb2xv
cl9kZXB0aHMpOwo+ID4gPiA+ICB1bnNpZ25lZCBsb25nIGtvbWVkYV9jcnRjX2dldF9hY2xrKHN0
cnVjdCBrb21lZGFfY3J0Y19zdGF0ZSAqa2NydGNfc3QpOwo+ID4gPiA+ICAKPiA+ID4gPiAgaW50
IGtvbWVkYV9rbXNfc2V0dXBfY3J0Y3Moc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprbXMsIHN0cnVj
dCBrb21lZGFfZGV2ICptZGV2KTsKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgKPiA+ID4gPiBpbmRleCBiMzIyZjUy
YmE4ZjIuLjc2NTNmMTM0YThlYiAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oCj4gPiA+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaAo+ID4gPiA+IEBA
IC0zMjMsNiArMzIzLDcgQEAgc3RydWN0IGtvbWVkYV9pbXByb2Mgewo+ID4gPiA+ICAKPiA+ID4g
PiAgc3RydWN0IGtvbWVkYV9pbXByb2Nfc3RhdGUgewo+ID4gPiA+ICAJc3RydWN0IGtvbWVkYV9j
b21wb25lbnRfc3RhdGUgYmFzZTsKPiA+ID4gPiArCXU4IGNvbG9yX2RlcHRoOwo+ID4gPiA+ICAJ
dTE2IGhzaXplLCB2c2l6ZTsKPiA+ID4gPiAgfTsKPiA+ID4gPiAgCj4gPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0
YXRlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGlu
ZV9zdGF0ZS5jCj4gPiA+ID4gaW5kZXggMGJhOWM2YWEzNzA4Li5lNjhlOGY4NWFiMjcgMTAwNjQ0
Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
cGlwZWxpbmVfc3RhdGUuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMKPiA+ID4gPiBAQCAtNzQzLDYgKzc0Myw3
IEBAIGtvbWVkYV9pbXByb2NfdmFsaWRhdGUoc3RydWN0IGtvbWVkYV9pbXByb2MgKmltcHJvYywK
PiA+ID4gPiAgCQkgICAgICAgc3RydWN0IGtvbWVkYV9kYXRhX2Zsb3dfY2ZnICpkZmxvdykKPiA+
ID4gPiAgewo+ID4gPiA+ICAJc3RydWN0IGRybV9jcnRjICpjcnRjID0ga2NydGNfc3QtPmJhc2Uu
Y3J0YzsKPiA+ID4gPiArCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdCA9ICZrY3J0Y19z
dC0+YmFzZTsKPiA+ID4gPiAgCXN0cnVjdCBrb21lZGFfY29tcG9uZW50X3N0YXRlICpjX3N0Owo+
ID4gPiA+ICAJc3RydWN0IGtvbWVkYV9pbXByb2Nfc3RhdGUgKnN0Owo+ID4gPiA+ICAKPiA+ID4g
PiBAQCAtNzU2LDYgKzc1NywyNCBAQCBrb21lZGFfaW1wcm9jX3ZhbGlkYXRlKHN0cnVjdCBrb21l
ZGFfaW1wcm9jICppbXByb2MsCj4gPiA+ID4gIAlzdC0+aHNpemUgPSBkZmxvdy0+aW5fdzsKPiA+
ID4gPiAgCXN0LT52c2l6ZSA9IGRmbG93LT5pbl9oOwo+ID4gPiA+ICAKPiA+ID4gPiArCWlmIChk
cm1fYXRvbWljX2NydGNfbmVlZHNfbW9kZXNldChjcnRjX3N0KSkgewo+ID4gPiA+ICsJCXUzMiBv
dXRwdXRfZGVwdGhzOwo+ID4gPiA+ICsJCXUzMiBhdmFpbF9kZXB0aHM7Cj4gPiA+ID4gKwo+ID4g
PiA+ICsJCWtvbWVkYV9jcnRjX2dldF9jb2xvcl9jb25maWcoY3J0Y19zdCwKPiA+ID4gPiArCQkJ
CQkgICAgICZvdXRwdXRfZGVwdGhzKTsKPiA+ID4gPiArCj4gPiA+ID4gKwkJYXZhaWxfZGVwdGhz
ID0gb3V0cHV0X2RlcHRocyAmIGltcHJvYy0+c3VwcG9ydGVkX2NvbG9yX2RlcHRoczsKPiA+ID4g
PiArCQlpZiAoYXZhaWxfZGVwdGhzID09IDApIHsKPiA+ID4gPiArCQkJRFJNX0RFQlVHX0FUT01J
QygiTm8gYXZhaWxhYmxlIGNvbG9yIGRlcHRocywgY29ubiBkZXB0aHM6IDB4JXggJiBkaXNwbGF5
OiAweCV4XG4iLAo+ID4gPiA+ICsJCQkJCSBvdXRwdXRfZGVwdGhzLAo+ID4gPiA+ICsJCQkJCSBp
bXByb2MtPnN1cHBvcnRlZF9jb2xvcl9kZXB0aHMpOwo+ID4gPiA+ICsJCQlyZXR1cm4gLUVJTlZB
TDsKPiA+ID4gPiArCQl9Cj4gPiA+ID4gKwo+ID4gPiA+ICsJCXN0LT5jb2xvcl9kZXB0aCA9IF9f
ZmxzKGF2YWlsX2RlcHRocyk7Cj4gPiA+ID4gKwl9Cj4gPiA+ID4gKwo+ID4gPiA+ICAJa29tZWRh
X2NvbXBvbmVudF9hZGRfaW5wdXQoJnN0LT5iYXNlLCAmZGZsb3ctPmlucHV0LCAwKTsKPiA+ID4g
PiAgCWtvbWVkYV9jb21wb25lbnRfc2V0X291dHB1dCgmZGZsb3ctPmlucHV0LCAmaW1wcm9jLT5i
YXNlLCAwKTsKPiA+ID4gPiAgCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMKPiA+ID4gPiBpbmRleCAy
ODUxY2FjOTRkODYuLjc0MGE4MTI1MDYzMCAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYwo+ID4gPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rv
ci5jCj4gPiA+ID4gQEAgLTE0Miw2ICsxNDIsNyBAQCBzdGF0aWMgaW50IGtvbWVkYV93Yl9jb25u
ZWN0b3JfYWRkKHN0cnVjdCBrb21lZGFfa21zX2RldiAqa21zLAo+ID4gPiA+ICAJc3RydWN0IGtv
bWVkYV9kZXYgKm1kZXYgPSBrbXMtPmJhc2UuZGV2X3ByaXZhdGU7Cj4gPiA+ID4gIAlzdHJ1Y3Qg
a29tZWRhX3diX2Nvbm5lY3RvciAqa3diX2Nvbm47Cj4gPiA+ID4gIAlzdHJ1Y3QgZHJtX3dyaXRl
YmFja19jb25uZWN0b3IgKndiX2Nvbm47Cj4gPiA+ID4gKwlzdHJ1Y3QgZHJtX2Rpc3BsYXlfaW5m
byAqaW5mbzsKPiA+ID4gPiAgCXUzMiAqZm9ybWF0cywgbl9mb3JtYXRzID0gMDsKPiA+ID4gPiAg
CWludCBlcnI7Cj4gPiA+ID4gIAo+ID4gPiA+IEBAIC0xNzEsNiArMTcyLDkgQEAgc3RhdGljIGlu
dCBrb21lZGFfd2JfY29ubmVjdG9yX2FkZChzdHJ1Y3Qga29tZWRhX2ttc19kZXYgKmttcywKPiA+
ID4gPiAgCj4gPiA+ID4gIAlkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQoJndiX2Nvbm4tPmJhc2Us
ICZrb21lZGFfd2JfY29ubl9oZWxwZXJfZnVuY3MpOwo+ID4gPiA+ICAKPiA+ID4gPiArCWluZm8g
PSAma3diX2Nvbm4tPmJhc2UuYmFzZS5kaXNwbGF5X2luZm87Cj4gPiA+ID4gKwlpbmZvLT5icGMg
PSBfX2ZscyhrY3J0Yy0+bWFzdGVyLT5pbXByb2MtPnN1cHBvcnRlZF9jb2xvcl9kZXB0aHMpOwo+
ID4gPiA+ICsKPiA+ID4gCj4gPiA+IFRoZSBJUFMgY29sb3IgZGVwdGggZG9lc24ndCByZWFsbHkg
YXBwbHkgdG8gd3JpdGViYWNrLiBNYXliZSB3ZSBzaG91bGQKPiA+ID4ganVzdCBza2lwIHRoZSB3
cml0ZWJhY2sgY29ubmVjdG9yPwo+ID4gPiAKPiA+ID4gVGhhbmtzLAo+ID4gPiAtQnJpYW4KPiA+
ID4gCj4gPiBZZXMsIHRoZSBjb2xvciBkZXB0aCBub3QgYXBwbHkgdG8gd3JpdGViYWNrLiBXZSBh
ZGRzIGl0IGJlY2F1c2U6Cj4gPiAKPiA+IEluIHRoZSBrb21lZGFfY3J0Y19nZXRfY29sb3JfY29u
ZmlnKCkgd2lsbCBsb29wIGFsbCBjb25uZWN0b3JzIG9mIENSVEMKPiA+IGluY2x1ZGluZyB0aGUg
d2JfY29ubiwgc2luY2UgY3J0YyBhbHdheXMgaGFzIHdiX2Nvbm4uIElmIG5vdCBzZXR0aW5nCj4g
PiBoZXJlLCB3Yl9jb25uLT5icGMgd2lsbCBiZSBzZXQgaXQgdG8gOGJpdCBmb3JjZWx5IGluIGtv
bWVkYV9jcnRjX2dldF9jb2xvcl9jb25maWcoKSB3aGljaCB3aWxsIGxlYWQgY3J0YyBicGMgdG8g
OGJpdHMgYWxsIHRoZSB0aW1lLiBTbyB3ZSBhcmUgc2V0dGluZyB0aGUKPiA+IGxhcmdlc3Qgc3Vw
cG9ydGVkIGRlcHRoIHRvIGt3Yl9jb25uLT5icGMgaGVyZS4KPiA+IAo+IEkgYWdyZWUgd2l0aCBC
cmlhbiBoZXJlLCBpdCBzb3VuZHMgbGlrZSB5b3UgbmVlZCB0byBmaXgKPiBrb21lZGFfY3J0Y19n
ZXRfY29sb3JfY29uZmlnKCkgcmF0aGVyIHRoYW4gcHV0dGluZyBpbiBhcmNhbmUgYnBjCj4gdmFs
dWVzIGFuZCBpbnZva2luZyBzcG9va3kgYWN0aW9uLiBDb25uZWN0b3JzIGhhdmUgYSB0eXBlIFsx
XSwgc28KPiBpdCdzIGVhc3kgdG8gZmlsdGVyIFdCIGNvbm5lY3RvcnMgb3V0IG9mIHRoZSBsb29w
Lgo+IAo+IFsxXSBlLmcuIERSTV9NT0RFX0NPTk5FQ1RPUl9XUklURUJBQ0sgaW4gdGhpcyBjYXNl
Lgo+IApFdmVuIGZvciB3cml0ZWJhY2sgb25seSwgYXQgSC9XIHJlcXVpcmVtZW50LCB3ZSBzdGls
bCBuZWVkIHRvIHNldCBJUFMKZGVwdGggYW5kIG91dHB1dCBjb2xvciBmb3IgSVBTLgoKUmVnYXJk
cywKTG93cnkKPiA+ID4gPiAgCWtjcnRjLT53Yl9jb25uID0ga3diX2Nvbm47Cj4gPiA+ID4gIAo+
ID4gPiA+ICAJcmV0dXJuIDA7Cj4gPiAKPiAKPiAKPiAtLSAKPiBNaWhhaWwKPiAKPiAKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
