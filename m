Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E71E710201D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 10:22:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576E66F3C9;
	Tue, 19 Nov 2019 09:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10064.outbound.protection.outlook.com [40.107.1.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440D26F3D5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 09:22:20 +0000 (UTC)
Received: from DB6PR0802CA0038.eurprd08.prod.outlook.com (2603:10a6:4:a3::24)
 by AM6PR08MB3141.eurprd08.prod.outlook.com (2603:10a6:209:4a::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23; Tue, 19 Nov
 2019 09:22:17 +0000
Received: from AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::209) by DB6PR0802CA0038.outlook.office365.com
 (2603:10a6:4:a3::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16 via Frontend
 Transport; Tue, 19 Nov 2019 09:22:17 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT042.mail.protection.outlook.com (10.152.17.168) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23 via Frontend Transport; Tue, 19 Nov 2019 09:22:17 +0000
Received: ("Tessian outbound e4042aced47b:v33");
 Tue, 19 Nov 2019 09:22:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8ca61f1f0f2b2958
X-CR-MTA-TID: 64aa7808
Received: from fce982040cec.2 (cr-mta-lb-1.cr-mta-net [104.47.5.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C1ECA74E-1743-49BA-A672-7010E434EFA6.1; 
 Tue, 19 Nov 2019 09:22:10 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fce982040cec.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 19 Nov 2019 09:22:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWMcFkUNExDO3dip/4hpEUVecJ5DyezdeM4vLrASZ/iCdNTnaTLKHbyI/GrTVH+7dTg6+F67ukHRr+7L/DdN7boayQOi/KcuMAhm2Q9DInfEAXq7sVGX/IbJCpC7liWZKwLWF/RpmnBVGYVNlo0j0TA/rLfpJ1JGN2SLh0r24C2me8/cyues/kJ3Tn3q4BQRRbX0c15eYo5xHi3fDRRdR++YFMjbz8trHZ1li3QMUdepzzxShPxhUQV6v0/UwHOjYWK6bYXrOcsB3OFzCeBEFxyuwWyiUcIIIC8/CjXCFOMlsRPXn4BMSVLKzPQHyxvsD5w7szDPfrq5+8+8zH38Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhHu+aLMdQ/MYK8ualj+Qe0oxyBaY+ZAjF5v2hRFMOc=;
 b=elvRVG38FdMiih3ayXhQ0VbuTbLu1yel0uP4177YWyvtcynpXOf/pP4goQDoK6lqlw4nM3mN0s+6Lua1/NSvlD8CiX8rhnN8GtdNzDsujRmQSk0s2fOzE56ugxKU6pb9KeWiJeoyq/DU7iHnAdNC3uR33H6Fx75STpKsCa52PYinRhgLs0LeqaghYWjApwayA7YJ6Xp3mabmmlcs1mYC+UlAmsFzz2peLB+sltlkYR+oXhVLGivDbM4pLZ0Sc98cZT/FX6qAo6qD6pVq7moY7FhzgmkMt1Vr7BgZI/pZG4K1wArEBtvEz5TdIxJxIVw0cE3SFqhrEPxrBNs5BjljzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4782.eurprd08.prod.outlook.com (10.255.115.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.29; Tue, 19 Nov 2019 09:22:07 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2451.031; Tue, 19 Nov 2019
 09:22:07 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH v3 1/6] drm/komeda: Add side by side assembling
Thread-Topic: [PATCH v3 1/6] drm/komeda: Add side by side assembling
Thread-Index: AQHVmsa9UkYGk9o7O0O+920wharNZKeLWkAAgAbly4A=
Date: Tue, 19 Nov 2019 09:22:07 +0000
Message-ID: <20191119092201.GC2881@jamwan02-TSP300>
References: <20191114083658.27237-1-james.qian.wang@arm.com>
 <20191114083658.27237-2-james.qian.wang@arm.com>
 <6478126.Gfiuz5foDL@e123338-lin>
In-Reply-To: <6478126.Gfiuz5foDL@e123338-lin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0P153CA0040.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::28) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d854fa8b-7328-4efa-4e4d-08d76cd1f8e6
X-MS-TrafficTypeDiagnostic: VE1PR08MB4782:|VE1PR08MB4782:|AM6PR08MB3141:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3141B18289282F8D94F6C278B34C0@AM6PR08MB3141.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:308;OLM:308;
x-forefront-prvs: 022649CC2C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(376002)(136003)(346002)(396003)(366004)(199004)(189003)(99286004)(71190400001)(2906002)(33656002)(6116002)(6862004)(86362001)(33716001)(4326008)(76176011)(26005)(25786009)(6512007)(11346002)(316002)(386003)(6506007)(6246003)(476003)(14454004)(6486002)(54906003)(5660300002)(66446008)(186003)(66946007)(66476007)(64756008)(66556008)(7736002)(1076003)(6436002)(6636002)(305945005)(229853002)(58126008)(446003)(3846002)(52116002)(55236004)(478600001)(102836004)(8936002)(71200400001)(9686003)(486006)(256004)(14444005)(8676002)(81156014)(81166006)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4782;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: QqV4qW9t36e7fVRwPULIcbwUjlkbiI/p/UmM/3avT6L3C8h+SG5sDS/tGbN26N3dJFngQVjX49eNi8O7H3QF7QGIr8KMFauXjVvVq0sH+An2XvmMK3Fw/yz7w08+KuzCBJDQf56+WYCxQJ8xN5rugOcHbnVPMvtrM/FoW8iFfSN7hxxxLQA8JqH8CzJ72CpoX6m5M/n+8yWdj/gBNPMhSFy8u7x/4J8M50HQFZklqOAOm5nnl/+NxIYxl1visr+TWZlhsn603xP5yJzF5sjben5i7F6Ev5DGp+A0plS3b3P379PuVSF4yURZyalm6/UIU0LZGtnbjGToonU/rW5zNR/z6dwYI71+whcXtl5f6xpTHioKHY3UepBQB5mPibtp8YjekZEndJ2++g0otM+Yr7DprYLV80ya8UlnkZyRhoZy8dAjcZKEno4rCnPd4OWJ
Content-ID: <C45671F45F9E054291B46CF9C8F27CEF@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4782
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(396003)(136003)(346002)(376002)(1110001)(339900001)(189003)(199004)(26005)(1076003)(7736002)(2906002)(6506007)(386003)(102836004)(25786009)(3846002)(186003)(26826003)(229853002)(23726003)(97756001)(6116002)(6486002)(305945005)(478600001)(54906003)(6636002)(76130400001)(8676002)(81156014)(81166006)(8746002)(9686003)(8936002)(70206006)(99286004)(76176011)(6246003)(4326008)(5660300002)(6862004)(33716001)(105606002)(46406003)(50466002)(47776003)(86362001)(70586007)(6512007)(356004)(66066001)(476003)(22756006)(486006)(58126008)(446003)(11346002)(14444005)(33656002)(336012)(14454004)(316002)(36906005)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3141;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a338e57e-5a17-4375-2ebc-08d76cd1f2a9
NoDisclaimer: True
X-Forefront-PRVS: 022649CC2C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7q7J07i/OqzNu+t0DN1w9vWeWvxFyk2HcYrz5VcxBbhonuzYzDfVLyyZbB3rujmK5BrEeP9dN0VkZMawDJvIkAbqtBVLsTmYhpDkdQ03JMO/ZUUVgT37/PB6/afDFzxQcKhu9zyx0YpMIaJBI7d+oVqZGZDUBXmQ1b2+itSreeXZUIJPf6NVW4O1xNf8A4d1d8h1YMHdzYeu8bTWTvfrbEDBKF4HQUeASWLwZfq/3654nNZxLTXMKuq+ux10EI0jX9kbaPhwR2puqqb7zujnrQvTqSC6OcPe6BBCCH9EkAQc0jhHju71YPuXYw5myZps3ir5RIngViUh0ZQgMVE9HH4q5297VB+xmp0UVSmLo3e6jemBgWUq/o5k5YDXdMHgs62m2S3N/HiFTjlSFNiEcwEJe9hCQqKjSyM4s4f19j3bmJ7YCo7gXJcG0QAHYRhF
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2019 09:22:17.5251 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d854fa8b-7328-4efa-4e4d-08d76cd1f8e6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3141
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhHu+aLMdQ/MYK8ualj+Qe0oxyBaY+ZAjF5v2hRFMOc=;
 b=S5ft5BzVLp0B3Bz1AJLAwGtNJIg1aKPlDnWky4QfuppQA8UuUwuUNbsFmjxt2RN4NgG8IzvX7wp6iStESAI+KWs/0mS5NBe41XKTaIZfyHG6tSvCzwEg4pEsUi3gwC011W5Z6Xm5S73hwrhXxFg4jk4DI/W2Vb9NcYwFafXysmg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhHu+aLMdQ/MYK8ualj+Qe0oxyBaY+ZAjF5v2hRFMOc=;
 b=S5ft5BzVLp0B3Bz1AJLAwGtNJIg1aKPlDnWky4QfuppQA8UuUwuUNbsFmjxt2RN4NgG8IzvX7wp6iStESAI+KWs/0mS5NBe41XKTaIZfyHG6tSvCzwEg4pEsUi3gwC011W5Z6Xm5S73hwrhXxFg4jk4DI/W2Vb9NcYwFafXysmg=
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
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>, nd <nd@arm.com>,
 "sean@poorly.run" <sean@poorly.run>, Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMTI6MDI6MDBBTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBIaSBKYW1lcywKPiAKPiBPbiBUaHVyc2RheSwgMTQgTm92ZW1iZXIgMjAxOSAw
ODozNzoyNCBHTVQgamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6
Cj4gPiBLb21lZGEgSFcgY2FuIHN1cHBvcnQgc2lkZSBieSBzaWRlLCB3aGljaCBzcGxpdHMgdGhl
IGludGVybmFsIGRpc3BsYXkKPiA+IHByb2Nlc3NpbmcgdG8gdHdvIHNpbmdsZSBoYWx2ZXMgKExF
RlQvUklHSFQpIGFuZCBoYW5kbGUgdGhlbSBieSB0d28KPiA+IHBpcGVsaW5lcyBzZXBhcmF0ZWx5
Lgo+ID4ga29tZWRhICJzaWRlIGJ5IHNpZGUiIGlzIGVuYWJsZWQgYnkgRFQgcHJvcGVydHk6ICJz
aWRlX2J5X3NpZGVfbWFzdGVyIiwKPiA+IG9uY2UgRFQgY29uZmlndXJlZCBzaWRlIGJ5IHNpZGUs
IGtvbWVkYSBuZWVkIHRvIHZlcmlmeSBpdCB3aXRoIEhXJ3MKPiA+IGNvbmZpZ3VyYXRpb24sIGFu
ZCBhc3NlbWJsZSBpdCBmb3IgdGhlIGZ1cnRoZXIgdXNhZ2UuCj4gCj4gQSBmZXcgcHJvYmxlbXMg
SSBzZWUgd2l0aCB0aGlzIGFwcHJvYWNoOgo+ICAtIFRoaXMgcHJvcGVydHkgZG9lc24ndCBzY2Fs
ZSB0byA+MiBwaXBlczsKPiAgLSBPdXIgSFcgaXMgY2FwYWJsZSBvZiBkeW5hbWljYWxseSBzd2l0
Y2hpbmcgYmV0d2VlbiBTQlMgYW5kIG5vbi1TQlMKPiBtb2Rlcywgd2l0aCB0aGlzIERUIHByb3Bl
cnR5IHlvdSdyZSBlZmZlY3RpdmVseSBkZW55aW5nIHRoZSBvcHBvcnR1bml0eQo+IHRvIHVzZSB0
aGUgc2Vjb25kIHBpcGUgd2hlbiB0aGUgZmlyc3Qgb25lIGNhbiBiZSBzYXRpc2ZpZWQgd2l0aAo+
IDQgcGxhbmVzIGFuZCAxcHgvY2xrLgo+IAo+IElmIHdlIG9ubHkgd2FudCB0byBmaXggdGhlIGZp
cnN0IHByb2JsZW0sIHRoZW4gYXQgbGVhc3Qgd2UgbmVlZCB0aGlzCj4gdG8gYmUgYSBwcm9wZXJ0
eSBvZiB0aGUgcGlwZWxpbmUgbm9kZSB3aXRoIGEgcGhhbmRsZSBsaW5raW5nIHNsYXZlIHRvCj4g
bWFzdGVyIChvciBiaWRpcmVjdGlvbmFsKS4KCkkgaGFkIGNvbnNpZGVyIHRoaXMgd2F5IGJlZm9y
ZSwgYnV0IGNvbnNpZGVyIHdlIGhhdmUgbm8gcHJvZHVjdCAobm93CmFuZCBpbiBuZXh0IDIvMyB5
ZWFycykgY2FuIHN1cHBvcnQgPjIgcGlwZXMuIFNvIGZvciBEVCBJIGRlY2lkZSB0bwpmb2N1cyBv
biBjdXJyZW50LCBidXQgeW91IG1heSBzZWUgSSBhZGQgdHdvIHNpZGVfYnlfc2lkZSBmbGFncy4K
CiAgLSBtZGV2LT5zaWRlX2J5X3NpZGUuCiAgLSBjcnRjLT5zaWRlX2J5X3NpZGUuCgpBbmQgYmVz
aWRlIHRoZSBEVCBwYXJzZSB3ZSB1c2UgbWRldi0+c2lkZV9ieV9zaWRlLCB0aGUgcmVhbCBTQlMK
b3BlcmF0aW9uIGFjdHVhbGx5IGJhc2VkIG9uIGNydGMtPnNpZGVfYnlfc2lkZSwgdGhlbiBvbmNl
IHRoZSBIVwpjaGFuZ2VkLCB3ZSBvbmx5IG5lZWQgdG8gdXBkYXRlIHRoZSBTQlMgYXNzZW1ibGUv
ZGVjaXNpb24gY29kZSwgYnV0IG5vCm5lZWQgdG8gdXBkYXRlIHRoZSByZWFsIHNicyBsb2dpYy4K
CnRoYW5rcwpKYW1lcwoKPiBGb3IgdGhlIHNlY29uZCwgd2h5IG5vdCBkbyB0aGUgU0JTIGRlY2lz
aW9uIGF0IG1vZGVzZXQgdGltZT8KPiBJZiB0aGUgZmlyc3QgQ1JUQyBoYXMgZHVhbC1saW5rIG91
dHB1dCBhbmQgdGhlIGNvbW1pdDoKPiAgLSBvbmx5IGRyaXZlcyBvbmUgQ1JUQwo+ICAtIHVzZXMg
dXAgdG8gNCBwbGFuZXMKPiAgLSBkb2Vzbid0IG1lZXQgY2xrIHJlcXVpcmVtZW50cyB3aXRob3V0
IFNCUyBidXQgZG9lcyB3aXRoIFNCUwo+IHRoZW4gd2UgY2FuIHN3aXRjaCBTQlMgb24gZHluYW1p
Y2FsbHkuCj4gQW5kIHdlIGNhbiB0d2VhayB0aGF0IGRlY2lzaW9uIHdpdGggcG93ZXIgdXNlIGlu
IG1pbmQgbGF0ZXIgb24gc2luY2UKPiB0aGVyZSdzIG5vIHVzZXItdmlzaWJsZSBrbm9iLgoKWWVz
LCB5b3UncmUgcmlnaHQsIGN1cnJlbnQgaW1wbGVtZW50YXRpb24ganVzdCB1c2Ugc2ltcGxlc3Qg
d2F5IHRvCnNob3cgdGhlIGZlYXR1cmUsIGFuZCBmb3IgZHluYW1pYyBlbmFibGUvZGlzYWJsZSBz
YnMgd2lsbCBiZSBhZGRlZAp3aGVuIHdlIGhhdmUgdGhlIHJlYWwgdXNhZ2UgY2FzZS4KCj4gV2Ug
Y2FuIHN0aWxsIGtlZXAgYSBEVCBwcm9wZXJ0eSBpZiB3ZSBoYXZlIGEgdXNlIGNhc2UgZm9yIGl0
IChlLmcuCj4gZm9yY2luZyBTQlMgb24gZm9yIHNvbWUgcmVhc29uKSwgYnV0IHdlIG1pZ2h0IHdh
bnQgdG8gbmFtZSBpdCBzbGlnaHRseQo+IG1vcmUgY29uc2VydmF0aXZlbHkgdGhlbiwgc28gaXQg
ZG9lc24ndCBpbXBseSB0aGF0IHdlIG5ldmVyIGRvIFNCUwo+IHdoZW4gaXQncyBub3QgdGhlcmUu
Cj4gCj4gTGFzdGx5LCBtYWludGFpbmluZyB0aGF0IHByb3BlcnR5IGluIGNvbWJpbmF0aW9uIHdp
dGggdGhlIGR5bmFtaWMKPiBtb2Rlc2V0LXRpbWUgU0JTIGRlY2lzaW9uIHRyZWUgbWVhbnMgZXh0
cmEgY29kZSBmb3IgbW9yZSBvciBsZXNzIHRoZQo+IHNhbWUgZnVuY3Rpb25hbGl0eS4gPDJjPkkn
bSBub3QgMTAwJSBzdXJlIGl0J3Mgd29ydGggaXQuPC8yYz4KCkkgdGhpbmsgd2UnZCBhZGQgc3Vj
aCBzdXBwb3J0IHdoZW4gd2UgaGF2ZSB0aGUgcmVhbCB1c2UgY2FzZS4gOikKCj4gPiAKPiA+IHYz
OiBDb3JyZWN0IGEgdHlwby4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMgUWlhbiBXYW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgo+ID4gLS0t
Cj4gPiAgLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgIHwgMTMg
KysrKy0KPiA+ICAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jICAg
fCAgMyArKwo+ID4gIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2Lmgg
ICB8ICA5ICsrKysKPiA+ICAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2tt
cy5oICAgfCAgMyArKwo+ID4gIC4uLi9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBl
bGluZS5jICB8IDUwICsrKysrKysrKysrKysrKysrLS0KPiA+ICAuLi4vZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCAgfCAgMSArCj4gPiAgNiBmaWxlcyBjaGFuZ2VkLCA3
MyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jIGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gPiBpbmRleCAxYzQ1MmVh
NzU5OTkuLmNlZTlhMTY5MmU3MSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gPiBAQCAtNTYxLDIxICs1NjEsMzAgQEAg
aW50IGtvbWVkYV9rbXNfc2V0dXBfY3J0Y3Moc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprbXMsCj4g
PiAgCWttcy0+bl9jcnRjcyA9IDA7Cj4gPiAgCj4gPiAgCWZvciAoaSA9IDA7IGkgPCBtZGV2LT5u
X3BpcGVsaW5lczsgaSsrKSB7Cj4gPiArCQkvKiBpZiBzYnMsIG9uZSBrb21lZGFfZGV2IG9ubHkg
Y2FuIHJlcHJlc2VudCBvbmUgQ1JUQyAqLwo+ID4gKwkJaWYgKG1kZXYtPnNpZGVfYnlfc2lkZSAm
JiBpICE9IG1kZXYtPnNpZGVfYnlfc2lkZV9tYXN0ZXIpCj4gPiArCQkJY29udGludWU7Cj4gPiAr
Cj4gPiAgCQljcnRjID0gJmttcy0+Y3J0Y3Nba21zLT5uX2NydGNzXTsKPiA+ICAJCW1hc3RlciA9
IG1kZXYtPnBpcGVsaW5lc1tpXTsKPiA+ICAKPiA+ICAJCWNydGMtPm1hc3RlciA9IG1hc3RlcjsK
PiA+ICAJCWNydGMtPnNsYXZlICA9IGtvbWVkYV9waXBlbGluZV9nZXRfc2xhdmUobWFzdGVyKTsK
PiA+ICsJCWNydGMtPnNpZGVfYnlfc2lkZSA9IG1kZXYtPnNpZGVfYnlfc2lkZTsKPiA+ICAKPiA+
ICAJCWlmIChjcnRjLT5zbGF2ZSkKPiA+ICAJCQlzcHJpbnRmKHN0ciwgInBpcGUtJWQiLCBjcnRj
LT5zbGF2ZS0+aWQpOwo+ID4gIAkJZWxzZQo+ID4gIAkJCXNwcmludGYoc3RyLCAiTm9uZSIpOwo+
ID4gIAo+ID4gLQkJRFJNX0lORk8oIkNSVEMtJWQ6IG1hc3RlcihwaXBlLSVkKSBzbGF2ZSglcyku
XG4iLAo+ID4gLQkJCSBrbXMtPm5fY3J0Y3MsIG1hc3Rlci0+aWQsIHN0cik7Cj4gPiArCQlEUk1f
SU5GTygiQ1JUQy0lZDogbWFzdGVyKHBpcGUtJWQpIHNsYXZlKCVzKSBzYnMoJXMpLlxuIiwKPiA+
ICsJCQkga21zLT5uX2NydGNzLCBtYXN0ZXItPmlkLCBzdHIsCj4gPiArCQkJIGNydGMtPnNpZGVf
Ynlfc2lkZSA/ICJPbiIgOiAiT2ZmIik7Cj4gPiAgCj4gPiAgCQlrbXMtPm5fY3J0Y3MrKzsKPiA+
ICsKPiA+ICsJCWlmIChtZGV2LT5zaWRlX2J5X3NpZGUpCj4gPiArCQkJYnJlYWs7Cj4gPiAgCX0K
PiA+ICAKPiA+ICAJcmV0dXJuIDA7Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9kZXYuYwo+ID4gaW5kZXggNGU0NmY2NTBmZGRmLi5jM2ZhNDgzNWNi
OGQgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9kZXYuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfZGV2LmMKPiA+IEBAIC0xNzgsNiArMTc4LDkgQEAgc3RhdGljIGludCBrb21lZGFfcGFy
c2VfZHQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qga29tZWRhX2RldiAqbWRldikKPiA+ICAJ
CX0KPiA+ICAJfQo+ID4gIAo+ID4gKwltZGV2LT5zaWRlX2J5X3NpZGUgPSAhb2ZfcHJvcGVydHlf
cmVhZF91MzIobnAsICJzaWRlX2J5X3NpZGVfbWFzdGVyIiwKPiA+ICsJCQkJCQkgICAmbWRldi0+
c2lkZV9ieV9zaWRlX21hc3Rlcik7Cj4gPiArCj4gPiAgCXJldHVybiByZXQ7Cj4gPiAgfQo+ID4g
IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2Rldi5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2
LmgKPiA+IGluZGV4IGQ0MDZhNGQ4MzM1Mi4uNDcxNjA0YjQyNDMxIDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmgKPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oCj4gPiBAQCAt
MTgzLDYgKzE4MywxNSBAQCBzdHJ1Y3Qga29tZWRhX2RldiB7Cj4gPiAgCj4gPiAgCS8qKiBAaXJx
OiBpcnEgbnVtYmVyICovCj4gPiAgCWludCBpcnE7Cj4gPiArCS8qKgo+ID4gKwkgKiBAc2lkZV9i
eV9zaWRlOgo+ID4gKwkgKgo+ID4gKwkgKiBvbiBzYnMgdGhlIHdob2xlIGRpc3BsYXkgZnJhbWUg
d2lsbCBiZSBzcGxpdCB0byB0d28gaGFsdmVzICgxOjIpLAo+ID4gKwkgKiBtYXN0ZXIgcGlwZWxp
bmUgaGFuZGxlcyB0aGUgbGVmdCBwYXJ0LCBzbGF2ZSBmb3IgdGhlIHJpZ2h0IHBhcnQKPiA+ICsJ
ICovCj4gPiArCWJvb2wgc2lkZV9ieV9zaWRlOwo+IAo+IFRoYXQncyBhIGR1cGxpY2F0ZSBvZiB0
aGUgb25lIGluIGtvbWVkYV9jcnRjLiBZb3UgZG9uJ3QgbmVlZCBib3RoLgo+IAo+ID4gKwkvKiog
QHNpZGVfYnlfc2lkZV9tYXN0ZXI6IG1hc3RlciBwaXBlIGlkIGZvciBzaWRlIGJ5IHNpZGUgKi8K
PiA+ICsJaW50IHNpZGVfYnlfc2lkZV9tYXN0ZXI7Cj4gCj4gQXMgSSBkZXRhaWxlZCBhYm92ZSwg
dGhpcyBzaG91bGQgYmUgb24gdGhlIGNydGMsIG90aGVyd2lzZSB3ZSBjYW4ndAo+IHNjYWxlIHRv
ID4yIHBpcGVzLgo+IAo+ID4gIAo+ID4gIAkvKiogQGxvY2s6IHVzZWQgdG8gcHJvdGVjdCBkcG1v
ZGUgKi8KPiA+ICAJc3RydWN0IG11dGV4IGxvY2s7Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmggYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaAo+ID4gaW5kZXggNDU2ZjNjNDM1NzE5Li5h
ZTY2NTRmZTk1ZTIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9rbXMuaAo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfa21zLmgKPiA+IEBAIC03Niw2ICs3Niw5IEBAIHN0cnVjdCBrb21lZGFf
Y3J0YyB7Cj4gPiAgCSAqLwo+ID4gIAlzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICpzbGF2ZTsKPiA+
ICAKPiA+ICsJLyoqIEBzaWRlX2J5X3NpZGU6IGlmIHRoZSBtYXN0ZXIgYW5kIHNsYXZlIHdvcmtz
IG9uIHNpZGUgYnkgc2lkZSBtb2RlICovCj4gPiArCWJvb2wgc2lkZV9ieV9zaWRlOwo+ID4gKwo+
ID4gIAkvKiogQHNsYXZlX3BsYW5lczoga29tZWRhIHNsYXZlIHBsYW5lcyBtYXNrICovCj4gPiAg
CXUzMiBzbGF2ZV9wbGFuZXM7Cj4gPiAgCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmMKPiA+IGluZGV4IDQ1MmU1MDVhMWZk
My4uMTA0ZTI3Y2MxZGMzIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuYwo+ID4gQEAgLTMyNiwxNCArMzI2LDU2
IEBAIHN0YXRpYyB2b2lkIGtvbWVkYV9waXBlbGluZV9hc3NlbWJsZShzdHJ1Y3Qga29tZWRhX3Bp
cGVsaW5lICpwaXBlKQo+ID4gIHN0cnVjdCBrb21lZGFfcGlwZWxpbmUgKgo+ID4gIGtvbWVkYV9w
aXBlbGluZV9nZXRfc2xhdmUoc3RydWN0IGtvbWVkYV9waXBlbGluZSAqbWFzdGVyKQo+ID4gIHsK
PiA+IC0Jc3RydWN0IGtvbWVkYV9jb21wb25lbnQgKnNsYXZlOwo+ID4gKwlzdHJ1Y3Qga29tZWRh
X2RldiAqbWRldiA9IG1hc3Rlci0+bWRldjsKPiA+ICsJc3RydWN0IGtvbWVkYV9jb21wb25lbnQg
KmNvbXAsICpzbGF2ZTsKPiA+ICsJdTMyIGF2YWlsX2lucHV0czsKPiA+ICsKPiA+ICsJLyogb24g
U0JTLCBzbGF2ZSBwaXBlbGluZSBtZXJnZSB0byBtYXN0ZXIgdmlhIGltYWdlIHByb2Nlc3NvciAq
Lwo+ID4gKwlpZiAobWRldi0+c2lkZV9ieV9zaWRlKSB7Cj4gPiArCQljb21wID0gJm1hc3Rlci0+
aW1wcm9jLT5iYXNlOwo+ID4gKwkJYXZhaWxfaW5wdXRzID0gS09NRURBX1BJUEVMSU5FX0lNUFJP
Q1M7Cj4gPiArCX0gZWxzZSB7Cj4gPiArCQljb21wID0gJm1hc3Rlci0+Y29tcGl6LT5iYXNlOwo+
ID4gKwkJYXZhaWxfaW5wdXRzID0gS09NRURBX1BJUEVMSU5FX0NPTVBJWlM7Cj4gPiArCX0KPiA+
ICAKPiA+IC0Jc2xhdmUgPSBrb21lZGFfY29tcG9uZW50X3BpY2t1cF9pbnB1dCgmbWFzdGVyLT5j
b21waXotPmJhc2UsCj4gPiAtCQkJCQkgICAgICBLT01FREFfUElQRUxJTkVfQ09NUElaUyk7Cj4g
PiArCXNsYXZlID0ga29tZWRhX2NvbXBvbmVudF9waWNrdXBfaW5wdXQoY29tcCwgYXZhaWxfaW5w
dXRzKTsKPiA+ICAKPiA+ICAJcmV0dXJuIHNsYXZlID8gc2xhdmUtPnBpcGVsaW5lIDogTlVMTDsK
PiA+ICB9Cj4gPiAgCj4gPiArc3RhdGljIGludCBrb21lZGFfYXNzZW1ibGVfc2lkZV9ieV9zaWRl
KHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQo+ID4gK3sKPiA+ICsJc3RydWN0IGtvbWVkYV9waXBl
bGluZSAqbWFzdGVyLCAqc2xhdmU7Cj4gPiArCWludCBpOwo+ID4gKwo+ID4gKwlpZiAoIW1kZXYt
PnNpZGVfYnlfc2lkZSkKPiA+ICsJCXJldHVybiAwOwo+ID4gKwo+ID4gKwlpZiAobWRldi0+c2lk
ZV9ieV9zaWRlX21hc3RlciA+PSBtZGV2LT5uX3BpcGVsaW5lcykgewo+ID4gKwkJRFJNX0VSUk9S
KCJEVCBjb25maWd1cmVkIHNpZGUgYnkgc2lkZSBtYXN0ZXItJWQgaXMgaW52YWxpZC5cbiIsCj4g
PiArCQkJICBtZGV2LT5zaWRlX2J5X3NpZGVfbWFzdGVyKTsKPiA+ICsJCXJldHVybiAtRUlOVkFM
Owo+ID4gKwl9Cj4gPiArCj4gPiArCW1hc3RlciA9IG1kZXYtPnBpcGVsaW5lc1ttZGV2LT5zaWRl
X2J5X3NpZGVfbWFzdGVyXTsKPiA+ICsJc2xhdmUgPSBrb21lZGFfcGlwZWxpbmVfZ2V0X3NsYXZl
KG1hc3Rlcik7Cj4gPiArCWlmICghc2xhdmUgfHwgc2xhdmUtPm5fbGF5ZXJzICE9IG1hc3Rlci0+
bl9sYXllcnMpIHsKPiA+ICsJCURSTV9FUlJPUigiQ3VycmVudCBIVyBkb2Vzbid0IHN1cHBvcnQg
c2lkZSBieSBzaWRlLlxuIik7Cj4gPiArCQlyZXR1cm4gLUVJTlZBTDsKPiA+ICsJfQo+ID4gKwo+
ID4gKwlpZiAoIW1hc3Rlci0+ZHVhbF9saW5rKSB7Cj4gPiArCQlEUk1fREVCVUdfQVRPTUlDKCJT
QlMgY2FuIG5vdCB3b3JrIHdpdGhvdXQgZHVhbCBsaW5rLlxuIik7Cj4gPiArCQlyZXR1cm4gLUVJ
TlZBTDsKPiA+ICsJfQo+ID4gKwo+ID4gKwlmb3IgKGkgPSAwOyBpIDwgbWFzdGVyLT5uX2xheWVy
czsgaSsrKQo+ID4gKwkJbWFzdGVyLT5sYXllcnNbaV0tPnNic19zbGF2ZSA9IHNsYXZlLT5sYXll
cnNbaV07Cj4gPiArCj4gPiArCXJldHVybiAwOwo+ID4gK30KPiA+ICsKPiA+ICBpbnQga29tZWRh
X2Fzc2VtYmxlX3BpcGVsaW5lcyhzdHJ1Y3Qga29tZWRhX2RldiAqbWRldikKPiA+ICB7Cj4gPiAg
CXN0cnVjdCBrb21lZGFfcGlwZWxpbmUgKnBpcGU7Cj4gPiBAQCAtMzQ2LDcgKzM4OCw3IEBAIGlu
dCBrb21lZGFfYXNzZW1ibGVfcGlwZWxpbmVzKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQo+ID4g
IAkJa29tZWRhX3BpcGVsaW5lX2R1bXAocGlwZSk7Cj4gPiAgCX0KPiA+ICAKPiA+IC0JcmV0dXJu
IDA7Cj4gPiArCXJldHVybiBrb21lZGFfYXNzZW1ibGVfc2lkZV9ieV9zaWRlKG1kZXYpOwo+ID4g
IH0KPiA+ICAKPiA+ICB2b2lkIGtvbWVkYV9waXBlbGluZV9kdW1wX3JlZ2lzdGVyKHN0cnVjdCBr
b21lZGFfcGlwZWxpbmUgKnBpcGUsCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgKPiA+IGluZGV4IGFjODcyNWUyNDg1My4u
MjBhMDc2Y2NlNjM1IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaAo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaAo+ID4gQEAgLTIzNyw2ICsyMzcsNyBAQCBz
dHJ1Y3Qga29tZWRhX2xheWVyIHsKPiA+ICAJICogbm90IHRoZSBzb3VyY2UgYnVmZmVyLgo+ID4g
IAkgKi8KPiA+ICAJc3RydWN0IGtvbWVkYV9sYXllciAqcmlnaHQ7Cj4gPiArCXN0cnVjdCBrb21l
ZGFfbGF5ZXIgKnNic19zbGF2ZTsKPiA+ICB9Owo+ID4gIAo+ID4gIHN0cnVjdCBrb21lZGFfbGF5
ZXJfc3RhdGUgewo+ID4gCj4gCj4gCj4gLS0gCj4gTWloYWlsCj4gCj4gCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
