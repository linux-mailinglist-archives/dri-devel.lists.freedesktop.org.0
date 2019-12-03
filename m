Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD7710F81D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 07:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB3089B61;
	Tue,  3 Dec 2019 06:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130078.outbound.protection.outlook.com [40.107.13.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0CA89B61
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 06:52:39 +0000 (UTC)
Received: from VI1PR08CA0104.eurprd08.prod.outlook.com (2603:10a6:800:d3::30)
 by AM6PR08MB4391.eurprd08.prod.outlook.com (2603:10a6:20b:73::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.20; Tue, 3 Dec
 2019 06:52:37 +0000
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::203) by VI1PR08CA0104.outlook.office365.com
 (2603:10a6:800:d3::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.20 via Frontend
 Transport; Tue, 3 Dec 2019 06:52:37 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 3 Dec 2019 06:52:36 +0000
Received: ("Tessian outbound d55de055a19b:v37");
 Tue, 03 Dec 2019 06:52:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3ed28b09f4b939ee
X-CR-MTA-TID: 64aa7808
Received: from 69b938dc0441.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 072356FE-DE6A-4C0A-89CA-B26836869AA3.1; 
 Tue, 03 Dec 2019 06:52:29 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 69b938dc0441.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 03 Dec 2019 06:52:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MybZ8DJJKbKHpXHwD4dFWK7TBkmiM1LuAroZnpl6ZN16S5JLBzrYhzmW3tIS/XL2FvAdW6M1QP6n5Caz3lKoNDKqxM8LUGLp8jHgp12vDRntHK87suIvXBlhFbo/fbsjSqAep43qiSmzPYqRku/6XAADEAgyjlYSn2czlM6MVWaRNsDz5ifNNeMMW8N+nhkxUb4LzQdHoDmo5c/uXhgkcZ753ELbB6l7I5THiVU2YRhW/4g9V/YMwhNOjkUAn8I8zI3CPJtaKnpbGAUUiK9lzELZmVhmIqC1BugAiONj7lzcKLESd1FJ3JgWbqZLf6OdVnbZ/P/qdl3g9Uyz3fFZmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwPc1obzcvtFC7saYROwPrWBDqfQefMfeu8D/9WgGHM=;
 b=Nf+7erd3VJXf0nFuZAJw72ApXkl23Y3xig8QJsDjhpahG2V5FHz8R0l0V3VE1zF0NqjLuE/UXQUTIgS/I2Jv9lpUQargsHVvlcLxKFW0ant0My1F/KddkApmWfo/iMbcDyXdhZFZKeDr3hq1NYALGakNHLcz1LXN4V1uPM14dO2IHE7zWVchkPK7/xnUiQ7+e71IETIghWT/u9U4it21frIFJF831AZvOiLpjLMhFBYLKjrqBEYFaTIgU850lDqqdOEjeLPqUKpq2dxJgnMkpf3VPuVtS9u82O9e4dTt4xR7O8/7KUVbARB+WgFiisOAUMtPLE9BN0zuMWFdeUpYTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5151.eurprd08.prod.outlook.com (20.179.31.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.22; Tue, 3 Dec 2019 06:52:27 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e%2]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 06:52:27 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH v2 1/2] drm/komeda: Update the chip identify
Thread-Topic: [PATCH v2 1/2] drm/komeda: Update the chip identify
Thread-Index: AQHVoEQj/p8RiR47xEOSjyW11KmivaemwPQAgAFK74A=
Date: Tue, 3 Dec 2019 06:52:27 +0000
Message-ID: <20191203065221.GA17562@jamwan02-TSP300>
References: <20191121081717.29518-1-james.qian.wang@arm.com>
 <20191121081717.29518-2-james.qian.wang@arm.com>
 <5936016.qkgZygMIky@e123338-lin>
In-Reply-To: <5936016.qkgZygMIky@e123338-lin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:202:2e::28) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 41a0fd6c-dd09-4893-e7ed-08d777bd61c6
X-MS-TrafficTypeDiagnostic: VE1PR08MB5151:|VE1PR08MB5151:|AM6PR08MB4391:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB43911D45E09565F5DEF57C3DB3420@AM6PR08MB4391.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 02408926C4
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(199004)(189003)(71200400001)(6506007)(76176011)(6862004)(386003)(52116002)(6636002)(8676002)(99286004)(15650500001)(55236004)(6436002)(3846002)(33656002)(4326008)(2906002)(102836004)(305945005)(66066001)(8936002)(229853002)(6116002)(6246003)(6306002)(6512007)(9686003)(86362001)(1076003)(7736002)(6486002)(25786009)(54906003)(26005)(81156014)(81166006)(186003)(11346002)(446003)(14444005)(966005)(256004)(14454004)(33716001)(5660300002)(478600001)(66946007)(66446008)(64756008)(66476007)(66556008)(71190400001)(316002)(58126008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5151;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: fLG71J11TflBT2Uz6kbhv+wxrP8+mKsYG/5DMosiWHU/1hFu9INVWNgOY58thjL6oQqRxZyC8NYZQ8iKM87J1NckGYoPLHPmi80Xv75l5iF9KSZqnBU2Nc88H+mMQaIdwlnWTh3o+zACJpARgxBEoX5VkfqGzGDOecKL7fbZMl9i8qOeJitaYf3TDx2jyD7KPFJ904vlYNe4JC5NNuOazPjKsOII2I5q108BfI9pIW4cdT577zswRMYFvGQeyf15OyYiLJv1n9XepMdleqN2QR9T1krd0NwEaqU+OOeD7NPV7vDkUzpIjPhZU/3qn8hMyHAHYVoQzSJ5UmuH59Byr0d4/GrZ4q91E+3N/mo15fh8qz38ii2HXp1vnllW1FOIxqW3ICqHytDV12QC7oYnNg5uPVXTttEuKfTdqZvntIB/2+U5qzBkaHNCyG7Crz4EAJwpJAtvZvUI1LFSLERYIpkYGv89RSS8P1CGjBx0AN8=
Content-ID: <7AC3A9829D67BE4395A5DC9DEBA557F9@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5151
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(39860400002)(346002)(396003)(136003)(199004)(189003)(14444005)(50466002)(966005)(46406003)(14454004)(6636002)(386003)(305945005)(102836004)(22756006)(15650500001)(25786009)(76130400001)(70206006)(70586007)(6506007)(7736002)(97756001)(6862004)(5660300002)(478600001)(26826003)(4326008)(26005)(6246003)(186003)(1076003)(33716001)(66066001)(106002)(47776003)(11346002)(36906005)(58126008)(8676002)(316002)(99286004)(54906003)(6306002)(6512007)(9686003)(23726003)(2906002)(76176011)(6116002)(3846002)(86362001)(6486002)(33656002)(81156014)(81166006)(336012)(8936002)(8746002)(356004)(446003)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4391;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: b013925a-34cc-4d5a-1a95-08d777bd5c2a
NoDisclaimer: True
X-Forefront-PRVS: 02408926C4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g3vAJlJXAh8BFUzqDwvLeyp1THXSUqUZMCjJnOEXqtmAcSEDpTCHwTBnY9o+rO/PgkHsLXHTo6UUysOeph0daBW8WR38df/FHUeg1G+RE39I/MjefkFkDUw1cANiwZVYJWmWMQMOhqAxVyyMhnj9xplHoKAXHdSUKAEqu04DnOkV5Pz2E/epoQPac03QjDlLyE1YqDx7Mq8QdKcvjfQsoSzt6lMPb/Yltyvf8Ra1QlnhVGUT5fP3PLnMALyJ+NnOQlWi0cmLl3guGC0EbyOCqb8KYBosm+/cxyw8hPA3L1rTCdZdPz0q8+hjj/PLMaik1ZclT2PsiutEZetKyTsFiobr+Um4+Vdo6zE4dxzlRhr7kn4Dn9P5XrGl4dAabqk5Q9QH9g+G8MLOXclECW/ahArDVMdz+Ff7BNkXtXNB7dr+8KM39Ym7FyraBRqvObbgwBv8K+0GqsfJo2mgYboxqhER4uq5mq9DzFWnY84UQ00=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 06:52:36.7342 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a0fd6c-dd09-4893-e7ed-08d777bd61c6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4391
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwPc1obzcvtFC7saYROwPrWBDqfQefMfeu8D/9WgGHM=;
 b=gPdet3Drd2ryKn+1hZaTHsMb+cKrMYqTDbRsZSQkkVyQfFAt9iSSMtb1Rq0MBD2sfpImbrWGrOKmM9Yf2bLgt38wYcC9dDHXM6dVspLq+nacR6jZdWTA4dkxPekRS6wLevK0CaH7wl8/PU4e7E1vvaws6mYv6wXf0VFHBxQU4a0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwPc1obzcvtFC7saYROwPrWBDqfQefMfeu8D/9WgGHM=;
 b=gPdet3Drd2ryKn+1hZaTHsMb+cKrMYqTDbRsZSQkkVyQfFAt9iSSMtb1Rq0MBD2sfpImbrWGrOKmM9Yf2bLgt38wYcC9dDHXM6dVspLq+nacR6jZdWTA4dkxPekRS6wLevK0CaH7wl8/PU4e7E1vvaws6mYv6wXf0VFHBxQU4a0=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
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
 "Julien Yin
 \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "Thomas Sun \(Arm Technology
 China\)" <thomas.Sun@arm.com>, nd <nd@arm.com>, Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgMDIsIDIwMTkgYXQgMTE6MDc6NTRBTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBPbiBUaHVyc2RheSwgMjEgTm92ZW1iZXIgMjAxOSAwODoxNzozOSBHTVQgamFt
ZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gPiAxLiBEcm9wIGtv
bWVkYS1DT1JFIHByb2R1Y3QgaWQgY29tcGFyaXNvbiBhbmQgcHV0IGl0IGludG8gdGhlIGQ3MV9p
ZGVudGlmeQo+ID4gMi4gVXBkYXRlIHBpcGVsaW5lIG5vZGUgRFQtYmluZGluZzoKPiA+ICAgIChh
KS4gU2tpcCB0aGUgbmVlZGxlc3MgcGlwZWxpbmUgRFQgbm9kZS4KPiA+ICAgIChiKS4gUmV0dXJu
IGZhaWwgaWYgdGhlIGVzc2VudGlhbCBwaXBlbGluZSBEVCBub2RlIGlzIG1pc3NpbmcuCj4gPiAK
PiA+IFdpdGggdGhlc2UgY2hhbmdlcywgZm9yIG9uZSBmYW1pbHkgY2hpcHMgbm8gbmVlZCB0byBj
aGFuZ2UgdGhlIERULgo+ID4gCj4gPiB2MjogUmViYXNlCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6
IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdA
YXJtLmNvbT4KPiA+IC0tLQo+ID4gIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEv
ZDcxX2Rldi5jICB8IDI3ICsrKysrKystLQo+ID4gIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfZGV2LmMgICB8IDYwICsrKysrKysrKystLS0tLS0tLS0KPiA+ICAuLi4vZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oICAgfCAxNCArLS0tLQo+ID4gIC4u
Li9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMgICB8ICA5ICstLQo+ID4g
IDQgZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKSwgNTIgZGVsZXRpb25zKC0pCj4gPiAK
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9k
NzFfZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfZGV2
LmMKPiA+IGluZGV4IDgyMmIyM2ExY2U3NS4uOWIzYmYzNTNiNmNjIDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Rldi5jCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfZGV2LmMKPiA+IEBA
IC01OTQsMTAgKzU5NCwyNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGtvbWVkYV9kZXZfZnVuY3Mg
ZDcxX2NoaXBfZnVuY3MgPSB7Cj4gPiAgY29uc3Qgc3RydWN0IGtvbWVkYV9kZXZfZnVuY3MgKgo+
ID4gIGQ3MV9pZGVudGlmeSh1MzIgX19pb21lbSAqcmVnX2Jhc2UsIHN0cnVjdCBrb21lZGFfY2hp
cF9pbmZvICpjaGlwKQo+ID4gIHsKPiA+IC0JY2hpcC0+YXJjaF9pZAk9IG1hbGlkcF9yZWFkMzIo
cmVnX2Jhc2UsIEdMQl9BUkNIX0lEKTsKPiA+IC0JY2hpcC0+Y29yZV9pZAk9IG1hbGlkcF9yZWFk
MzIocmVnX2Jhc2UsIEdMQl9DT1JFX0lEKTsKPiA+IC0JY2hpcC0+Y29yZV9pbmZvCT0gbWFsaWRw
X3JlYWQzMihyZWdfYmFzZSwgR0xCX0NPUkVfSU5GTyk7Cj4gPiAtCWNoaXAtPmJ1c193aWR0aAk9
IEQ3MV9CVVNfV0lEVEhfMTZfQllURVM7Cj4gPiArCWNvbnN0IHN0cnVjdCBrb21lZGFfZGV2X2Z1
bmNzICpmdW5jczsKPiA+ICsJdTMyIHByb2R1Y3RfaWQ7Cj4gPiAgCj4gPiAtCXJldHVybiAmZDcx
X2NoaXBfZnVuY3M7Cj4gPiArCWNoaXAtPmNvcmVfaWQgPSBtYWxpZHBfcmVhZDMyKHJlZ19iYXNl
LCBHTEJfQ09SRV9JRCk7Cj4gPiArCj4gPiArCXByb2R1Y3RfaWQgPSBNQUxJRFBfQ09SRV9JRF9Q
Uk9EVUNUX0lEKGNoaXAtPmNvcmVfaWQpOwo+ID4gKwo+ID4gKwlzd2l0Y2ggKHByb2R1Y3RfaWQp
IHsKPiA+ICsJY2FzZSBNQUxJRFBfRDcxX1BST0RVQ1RfSUQ6Cj4gPiArCQlmdW5jcyA9ICZkNzFf
Y2hpcF9mdW5jczsKPiA+ICsJCWJyZWFrOwo+ID4gKwlkZWZhdWx0Ogo+ID4gKwkJZnVuY3MgPSBO
VUxMOwo+IAo+IFtiaWtlc2hlZF0gSSdkIGp1c3QgJ3JldHVybiBOVUxMOycgYWZ0ZXIgcHJpbnRp
bmcgdGhlIGVycm9yLi4uCgpHb29kIGlkZWEsIGFuZCB0aGVuIG5vIG5lZWQgdG8gY2hlY2sgdGhl
IGZ1bmMgaW4gdGhlIGZvbGxvd2luZyBjb2RlLgoKPiA+ICsJCURSTV9FUlJPUigiVW5zdXBwb3J0
ZWQgcHJvZHVjdDogMHgleFxuIiwgcHJvZHVjdF9pZCk7Cj4gPiArCX0KPiA+ICsKPiA+ICsJaWYg
KGZ1bmNzKSB7Cj4gCj4gLi4uIGFuZCBzYXZlIG15c2VsZiB0aGUgYnJhbmNoIGFuZCBpbmRlbnQg
bGV2ZWwgaGVyZS4KPiAKPiA+ICsJCWNoaXAtPmFyY2hfaWQJPSBtYWxpZHBfcmVhZDMyKHJlZ19i
YXNlLCBHTEJfQVJDSF9JRCk7Cj4gPiArCQljaGlwLT5jb3JlX2luZm8JPSBtYWxpZHBfcmVhZDMy
KHJlZ19iYXNlLCBHTEJfQ09SRV9JTkZPKTsKPiA+ICsJCWNoaXAtPmJ1c193aWR0aAk9IEQ3MV9C
VVNfV0lEVEhfMTZfQllURVM7Cj4gPiArCX0KPiA+ICsKPiA+ICsJcmV0dXJuIGZ1bmNzOwo+ID4g
IH0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9kZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rl
di5jCj4gPiBpbmRleCA0ZGQ0Njk5ZDRlM2QuLjhlMGJjZTQ2NTU1YiAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwo+ID4gQEAg
LTExNiwyMiArMTE2LDE0IEBAIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlX2dyb3VwIGtvbWVkYV9z
eXNmc19hdHRyX2dyb3VwID0gewo+ID4gIAkuYXR0cnMgPSBrb21lZGFfc3lzZnNfZW50cmllcywK
PiA+ICB9Owo+ID4gIAo+ID4gLXN0YXRpYyBpbnQga29tZWRhX3BhcnNlX3BpcGVfZHQoc3RydWN0
IGtvbWVkYV9kZXYgKm1kZXYsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCj4gPiArc3RhdGljIGlu
dCBrb21lZGFfcGFyc2VfcGlwZV9kdChzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICpwaXBlKQo+ID4g
IHsKPiA+IC0Jc3RydWN0IGtvbWVkYV9waXBlbGluZSAqcGlwZTsKPiA+ICsJc3RydWN0IGRldmlj
ZV9ub2RlICpucCA9IHBpcGUtPm9mX25vZGU7Cj4gPiAgCXN0cnVjdCBjbGsgKmNsazsKPiA+IC0J
dTMyIHBpcGVfaWQ7Cj4gPiAtCWludCByZXQgPSAwOwo+ID4gLQo+ID4gLQlyZXQgPSBvZl9wcm9w
ZXJ0eV9yZWFkX3UzMihucCwgInJlZyIsICZwaXBlX2lkKTsKPiA+IC0JaWYgKHJldCAhPSAwIHx8
IHBpcGVfaWQgPj0gbWRldi0+bl9waXBlbGluZXMpCj4gPiAtCQlyZXR1cm4gLUVJTlZBTDsKPiA+
IC0KPiA+IC0JcGlwZSA9IG1kZXYtPnBpcGVsaW5lc1twaXBlX2lkXTsKPiA+ICAKPiA+ICAJY2xr
ID0gb2ZfY2xrX2dldF9ieV9uYW1lKG5wLCAicHhjbGsiKTsKPiA+ICAJaWYgKElTX0VSUihjbGsp
KSB7Cj4gPiAtCQlEUk1fRVJST1IoImdldCBweGNsayBmb3IgcGlwZWxpbmUgJWQgZmFpbGVkIVxu
IiwgcGlwZV9pZCk7Cj4gPiArCQlEUk1fRVJST1IoImdldCBweGNsayBmb3IgcGlwZWxpbmUgJWQg
ZmFpbGVkIVxuIiwgcGlwZS0+aWQpOwo+ID4gIAkJcmV0dXJuIFBUUl9FUlIoY2xrKTsKPiA+ICAJ
fQo+ID4gIAlwaXBlLT5weGxjbGsgPSBjbGs7Cj4gPiBAQCAtMTQ1LDcgKzEzNyw2IEBAIHN0YXRp
YyBpbnQga29tZWRhX3BhcnNlX3BpcGVfZHQoc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYsIHN0cnVj
dCBkZXZpY2Vfbm9kZSAqbnApCj4gPiAgCQlvZl9ncmFwaF9nZXRfcG9ydF9ieV9pZChucCwgS09N
RURBX09GX1BPUlRfT1VUUFVUKTsKPiA+ICAKPiA+ICAJcGlwZS0+ZHVhbF9saW5rID0gcGlwZS0+
b2Zfb3V0cHV0X2xpbmtzWzBdICYmIHBpcGUtPm9mX291dHB1dF9saW5rc1sxXTsKPiA+IC0JcGlw
ZS0+b2Zfbm9kZSA9IG9mX25vZGVfZ2V0KG5wKTsKPiA+ICAKPiA+ICAJcmV0dXJuIDA7Cj4gPiAg
fQo+ID4gQEAgLTE1NCw3ICsxNDUsOSBAQCBzdGF0aWMgaW50IGtvbWVkYV9wYXJzZV9kdChzdHJ1
Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQo+ID4gIHsKPiA+ICAJc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiA9IHRvX3BsYXRmb3JtX2RldmljZShkZXYpOwo+ID4g
IAlzdHJ1Y3QgZGV2aWNlX25vZGUgKmNoaWxkLCAqbnAgPSBkZXYtPm9mX25vZGU7Cj4gPiAtCWlu
dCByZXQ7Cj4gPiArCXN0cnVjdCBrb21lZGFfcGlwZWxpbmUgKnBpcGU7Cj4gPiArCXUzMiBwaXBl
X2lkID0gVTMyX01BWDsKPiA+ICsJaW50IHJldCA9IC0xOwo+ID4gIAo+ID4gIAltZGV2LT5pcnEg
ID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKPiA+ICAJaWYgKG1kZXYtPmlycSA8IDApIHsK
PiA+IEBAIC0xNjksMzEgKzE2Miw0NCBAQCBzdGF0aWMgaW50IGtvbWVkYV9wYXJzZV9kdChzdHJ1
Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQo+ID4gIAlyZXQgPSAwOwo+
ID4gIAo+ID4gIAlmb3JfZWFjaF9hdmFpbGFibGVfY2hpbGRfb2Zfbm9kZShucCwgY2hpbGQpIHsK
PiA+IC0JCWlmIChvZl9ub2RlX2NtcChjaGlsZC0+bmFtZSwgInBpcGVsaW5lIikgPT0gMCkgewo+
ID4gLQkJCXJldCA9IGtvbWVkYV9wYXJzZV9waXBlX2R0KG1kZXYsIGNoaWxkKTsKPiA+IC0JCQlp
ZiAocmV0KSB7Cj4gPiAtCQkJCURSTV9FUlJPUigicGFyc2UgcGlwZWxpbmUgZHQgZXJyb3IhXG4i
KTsKPiA+IC0JCQkJb2Zfbm9kZV9wdXQoY2hpbGQpOwo+ID4gLQkJCQlicmVhazsKPiA+ICsJCWlm
IChvZl9ub2RlX25hbWVfZXEoY2hpbGQsICJwaXBlbGluZSIpKSB7Cj4gPiArCQkJb2ZfcHJvcGVy
dHlfcmVhZF91MzIoY2hpbGQsICJyZWciLCAmcGlwZV9pZCk7Cj4gPiArCQkJaWYgKHBpcGVfaWQg
Pj0gbWRldi0+bl9waXBlbGluZXMpIHsKPiA+ICsJCQkJRFJNX1dBUk4oIlNraXAgdGhlIHJlZHVu
ZGFudCBEVCBub2RlOiBwaXBlbGluZS0ldS5cbiIsCj4gPiArCQkJCQkgcGlwZV9pZCk7Cj4gPiAr
CQkJCWNvbnRpbnVlOwo+ID4gIAkJCX0KPiA+ICsJCQltZGV2LT5waXBlbGluZXNbcGlwZV9pZF0t
Pm9mX25vZGUgPSBvZl9ub2RlX2dldChjaGlsZCk7Cj4gPiAgCQl9Cj4gPiAgCX0KPiA+ICAKPiA+
ICsJZm9yIChwaXBlX2lkID0gMDsgcGlwZV9pZCA8IG1kZXYtPm5fcGlwZWxpbmVzOyBwaXBlX2lk
KyspIHsKPiA+ICsJCXBpcGUgPSBtZGV2LT5waXBlbGluZXNbcGlwZV9pZF07Cj4gPiArCj4gPiAr
CQlpZiAoIXBpcGUtPm9mX25vZGUpIHsKPiA+ICsJCQlEUk1fRVJST1IoIk9taXQgRFQgbm9kZSBm
b3IgcGlwZWxpbmUtJWQuXG4iLCBwaXBlLT5pZCk7Cj4gCj4gW25pdF0gIk9taXQgRFQgbm9kZSIg
ZG9lc24ndCBzb3VuZCBsaWtlIGFuIGVycm9yIGNvbmRpdGlvbi4gSG93IGFib3V0Ogo+IAo+ICJw
aXBlbGluZS0lZCBkb2Vzbid0IGhhdmUgYSBEVCBub2RlLiIKCldpbGwgZG8gaXQgaW4gdGhlIG5l
eHQgdmVyc2lvbi4KCj4gCj4gPiArCQkJcmV0dXJuIC1FSU5WQUw7Cj4gPiArCQl9Cj4gPiArCQly
ZXQgPSBrb21lZGFfcGFyc2VfcGlwZV9kdChwaXBlKTsKPiA+ICsJCWlmIChyZXQpCj4gPiArCQkJ
cmV0dXJuIHJldDsKPiA+ICsJfQo+ID4gKwo+ID4gIAltZGV2LT5zaWRlX2J5X3NpZGUgPSAhb2Zf
cHJvcGVydHlfcmVhZF91MzIobnAsICJzaWRlX2J5X3NpZGVfbWFzdGVyIiwKPiAKPiBMb29rcyBs
aWtlIHRoaXMgaXNuJ3QgYmFzZWQgb2ZmIGRybS1taXNjLW5leHQsIGFuZCBpcyBpbnN0ZWFkIGJh
c2VkIG9uCj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzM0MTg2Ny8K
PiAKPiA+ICAJCQkJCQkgICAmbWRldi0+c2lkZV9ieV9zaWRlX21hc3Rlcik7CgpPSywgd2lsbCBy
ZWJhc2UgdGhpcyBzZXJpZXMgZGlyZWN0bHkgdG8gZHJtLW1pc2MtbmV4dC4KCj4gPiAgCj4gPiAt
CXJldHVybiByZXQ7Cj4gPiArCXJldHVybiAwOwo+ID4gIH0KPiA+ICAKPiA+ICBzdHJ1Y3Qga29t
ZWRhX2RldiAqa29tZWRhX2Rldl9jcmVhdGUoc3RydWN0IGRldmljZSAqZGV2KQo+ID4gIHsKPiA+
ICAJc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiA9IHRvX3BsYXRmb3JtX2RldmljZShkZXYp
Owo+ID4gLQljb25zdCBzdHJ1Y3Qga29tZWRhX3Byb2R1Y3RfZGF0YSAqcHJvZHVjdDsKPiA+ICsJ
a29tZWRhX2lkZW50aWZ5X2Z1bmMga29tZWRhX2lkZW50aWZ5Owo+ID4gIAlzdHJ1Y3Qga29tZWRh
X2RldiAqbWRldjsKPiA+ICAJaW50IGVyciA9IDA7Cj4gPiAgCj4gPiAtCXByb2R1Y3QgPSBvZl9k
ZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsKPiA+IC0JaWYgKCFwcm9kdWN0KQo+ID4gKwlrb21l
ZGFfaWRlbnRpZnkgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsKPiA+ICsJaWYgKCFr
b21lZGFfaWRlbnRpZnkpCj4gPiAgCQlyZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKPiA+ICAKPiA+
ICAJbWRldiA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqbWRldiksIEdGUF9LRVJORUwpOwo+
ID4gQEAgLTIyMSwxMSArMjI3LDkgQEAgc3RydWN0IGtvbWVkYV9kZXYgKmtvbWVkYV9kZXZfY3Jl
YXRlKHN0cnVjdCBkZXZpY2UgKmRldikKPiA+ICAKPiA+ICAJY2xrX3ByZXBhcmVfZW5hYmxlKG1k
ZXYtPmFjbGspOwo+ID4gIAo+ID4gLQltZGV2LT5mdW5jcyA9IHByb2R1Y3QtPmlkZW50aWZ5KG1k
ZXYtPnJlZ19iYXNlLCAmbWRldi0+Y2hpcCk7Cj4gPiAtCWlmICgha29tZWRhX3Byb2R1Y3RfbWF0
Y2gobWRldiwgcHJvZHVjdC0+cHJvZHVjdF9pZCkpIHsKPiA+IC0JCURSTV9FUlJPUigiRFQgY29u
ZmlndXJlZCAleCBtaXNtYXRjaCB3aXRoIHJlYWwgSFcgJXguXG4iLAo+ID4gLQkJCSAgcHJvZHVj
dC0+cHJvZHVjdF9pZCwKPiA+IC0JCQkgIE1BTElEUF9DT1JFX0lEX1BST0RVQ1RfSUQobWRldi0+
Y2hpcC5jb3JlX2lkKSk7Cj4gPiArCW1kZXYtPmZ1bmNzID0ga29tZWRhX2lkZW50aWZ5KG1kZXYt
PnJlZ19iYXNlLCAmbWRldi0+Y2hpcCk7Cj4gPiArCWlmICghbWRldi0+ZnVuY3MpIHsKPiA+ICsJ
CURSTV9FUlJPUigiRmFpbGVkIHRvIGlkZW50aWZ5IHRoZSBIVy5cbiIpOwo+ID4gIAkJZXJyID0g
LUVOT0RFVjsKPiA+ICAJCWdvdG8gZGlzYWJsZV9jbGs7Cj4gPiAgCX0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaCBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oCj4gPiBpbmRleCA0NzE2
MDRiNDI0MzEuLmRhY2RiMDAxNTNlOSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaAo+ID4gQEAgLTU4LDExICs1OCw2IEBACj4g
PiAgCQkJICAgIHwgS09NRURBX0VWRU5UX01PREUgXAo+ID4gIAkJCSAgICApCj4gPiAgCj4gPiAt
LyogbWFsaWRwIGRldmljZSBpZCAqLwo+ID4gLWVudW0gewo+ID4gLQlNQUxJX0Q3MSA9IDAsCj4g
PiAtfTsKPiA+IC0KPiA+ICAvKiBwaXBlbGluZSBEVCBwb3J0cyAqLwo+ID4gIGVudW0gewo+ID4g
IAlLT01FREFfT0ZfUE9SVF9PVVRQVVQJCT0gMCwKPiA+IEBAIC03NiwxMiArNzEsNiBAQCBzdHJ1
Y3Qga29tZWRhX2NoaXBfaW5mbyB7Cj4gPiAgCXUzMiBidXNfd2lkdGg7Cj4gPiAgfTsKPiA+ICAK
PiA+IC1zdHJ1Y3Qga29tZWRhX3Byb2R1Y3RfZGF0YSB7Cj4gPiAtCXUzMiBwcm9kdWN0X2lkOwo+
ID4gLQljb25zdCBzdHJ1Y3Qga29tZWRhX2Rldl9mdW5jcyAqKCppZGVudGlmeSkodTMyIF9faW9t
ZW0gKnJlZywKPiA+IC0JCQkJCSAgICAgc3RydWN0IGtvbWVkYV9jaGlwX2luZm8gKmluZm8pOwo+
ID4gLX07Cj4gPiAtCj4gPiAgc3RydWN0IGtvbWVkYV9kZXY7Cj4gPiAgCj4gPiAgc3RydWN0IGtv
bWVkYV9ldmVudHMgewo+ID4gQEAgLTI0Myw2ICsyMzIsOSBAQCBrb21lZGFfcHJvZHVjdF9tYXRj
aChzdHJ1Y3Qga29tZWRhX2RldiAqbWRldiwgdTMyIHRhcmdldCkKPiA+ICAJcmV0dXJuIE1BTElE
UF9DT1JFX0lEX1BST0RVQ1RfSUQobWRldi0+Y2hpcC5jb3JlX2lkKSA9PSB0YXJnZXQ7Cj4gPiAg
fQo+ID4gIAo+ID4gK3R5cGVkZWYgY29uc3Qgc3RydWN0IGtvbWVkYV9kZXZfZnVuY3MgKgo+ID4g
Kygqa29tZWRhX2lkZW50aWZ5X2Z1bmMpKHUzMiBfX2lvbWVtICpyZWcsIHN0cnVjdCBrb21lZGFf
Y2hpcF9pbmZvICpjaGlwKTsKPiA+ICsKPiA+ICBjb25zdCBzdHJ1Y3Qga29tZWRhX2Rldl9mdW5j
cyAqCj4gPiAgZDcxX2lkZW50aWZ5KHUzMiBfX2lvbWVtICpyZWcsIHN0cnVjdCBrb21lZGFfY2hp
cF9pbmZvICpjaGlwKTsKPiA+ICAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2Rydi5jCj4gPiBpbmRleCBkNmMyMjIyYzVkMzMuLmI3YTEwOTdjNDVj
NCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2Rydi5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9kcnYuYwo+ID4gQEAgLTEyMywxNSArMTIzLDggQEAgc3RhdGljIGludCBrb21lZGFfcGxh
dGZvcm1fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgCXJldHVybiAw
Owo+ID4gIH0KPiA+ICAKPiA+IC1zdGF0aWMgY29uc3Qgc3RydWN0IGtvbWVkYV9wcm9kdWN0X2Rh
dGEga29tZWRhX3Byb2R1Y3RzW10gPSB7Cj4gPiAtCVtNQUxJX0Q3MV0gPSB7Cj4gPiAtCQkucHJv
ZHVjdF9pZCA9IE1BTElEUF9ENzFfUFJPRFVDVF9JRCwKPiA+IC0JCS5pZGVudGlmeSA9IGQ3MV9p
ZGVudGlmeSwKPiA+IC0JfSwKPiA+IC19Owo+ID4gLQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkIGtvbWVkYV9vZl9tYXRjaFtdID0gewo+ID4gLQl7IC5jb21wYXRpYmxlID0g
ImFybSxtYWxpLWQ3MSIsIC5kYXRhID0gJmtvbWVkYV9wcm9kdWN0c1tNQUxJX0Q3MV0sIH0sCj4g
PiArCXsgLmNvbXBhdGlibGUgPSAiYXJtLG1hbGktZDcxIiwgLmRhdGEgPSBkNzFfaWRlbnRpZnks
IH0sCj4gPiAgCXt9LAo+ID4gIH07Cj4gPiAgCj4gPiAKPiAKPiBXaXRoIHRoZSBhYm92ZSB0d28g
Zml4ZWQgKGkuZS4gZmVlbCBmcmVlIHRvIGlnbm9yZSB0aGUgYmlrZXNoZWQpLAo+IFJldmlld2Vk
LWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+Cj4gCj4gLS0g
Cj4gTWloYWlsCj4gCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
