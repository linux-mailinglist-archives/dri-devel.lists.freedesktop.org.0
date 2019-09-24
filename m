Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B12BC3A0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 10:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878D4897C8;
	Tue, 24 Sep 2019 08:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20052.outbound.protection.outlook.com [40.107.2.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D948897C8
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 08:00:56 +0000 (UTC)
Received: from VI1PR0802CA0011.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::21) by VI1PR08MB5517.eurprd08.prod.outlook.com
 (2603:10a6:803:139::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.19; Tue, 24 Sep
 2019 08:00:51 +0000
Received: from DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::204) by VI1PR0802CA0011.outlook.office365.com
 (2603:10a6:800:aa::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.23 via Frontend
 Transport; Tue, 24 Sep 2019 08:00:51 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT039.mail.protection.outlook.com (10.152.21.120) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20 via Frontend Transport; Tue, 24 Sep 2019 08:00:49 +0000
Received: ("Tessian outbound 96594883d423:v31");
 Tue, 24 Sep 2019 08:00:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bf83f19d794a2f1c
X-CR-MTA-TID: 64aa7808
Received: from 7f18e8879431.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BC20BACA-8626-461D-A5A0-C6D906BDF088.1; 
 Tue, 24 Sep 2019 08:00:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7f18e8879431.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 24 Sep 2019 08:00:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvUGJxETwrbm6K0q3ycpR3wu2j4n0IHtO9kQti/sd6CaXqVO2/fds2NaNIMdcTH2w4bUp+tqM/d0+cDWYJjGGa079+8PIebPNQ0urr/epT8n33KWXA5sXrsGVvw+CuMMYD3wRGBqzlSGhwatKaXSuxV12Bn9BWFGlQPJTD33ef+zZXhN5hBFmCMAKveiEAZYLIVVuTMNfgUY5mQjkRmc7L79rz0SBLPeyU5gDz5rcBbymYosq+gyulpDIBilk3c63UkCSaMY/VIs0GXzWGJEgh6aUEOaqn8hi0A0VkTOKoYV7rzgVglFYYcGjp6PkNiR3R4lOl2UY/RofQufUL1VFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDeY3yrLXKxZ6ZJjHvIhB+5kXK6vvx+mi9GVwSuEm20=;
 b=hAw3aVUNqH4rnYupjjBs4vfTWvdfl0eod6er46+Ysmw/AMZccPjF+2sPrQjYyms/ij9o3+asUnMyglgWrTsmWc6jnNfAX/V0Y/WA3mkoI6UyYXRoZIFoCU15UB83Hqnyy4hPHe8+YguwyGapSacIakEnczKJR7IkIzR3pp8FA+nmcFfAgafEeO3I7I6eymoOcHhsni/J0rLy135ry3Zvl7uGPlvnLaIZkicX/kg959W1gw2AqSAByWWArVrN6HxnWielZr1ovigy95LX5iUDlYlO95E6v1rxr2FA10pi/07Yc162x2QU1/JYapFGQJ26n7RcGSLd4ozQCaWpcxoMdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3165.eurprd08.prod.outlook.com (52.133.15.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Tue, 24 Sep 2019 08:00:39 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::d09e:254b:4d3b:456b]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::d09e:254b:4d3b:456b%3]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 08:00:39 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH v2 0/2] drm/komeda: Add layer line size support
Thread-Topic: [PATCH v2 0/2] drm/komeda: Add layer line size support
Thread-Index: AQHVcq4n2NTPDT8buUeD7qC/mk6snA==
Date: Tue, 24 Sep 2019 08:00:39 +0000
Message-ID: <20190924080022.19250-1-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:203:92::34) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 8bc8e6f1-dd86-4516-7991-08d740c55070
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR08MB3165; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB3165:|VI1PR08MB3165:|VI1PR08MB5517:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB5517C84F8C060B3A6F6112439F840@VI1PR08MB5517.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 0170DAF08C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(189003)(199004)(186003)(54906003)(81166006)(81156014)(71190400001)(8676002)(4326008)(99286004)(14454004)(110136005)(66066001)(66946007)(66556008)(25786009)(66446008)(26005)(486006)(66476007)(478600001)(316002)(64756008)(8936002)(7736002)(52116002)(36756003)(50226002)(476003)(2616005)(5660300002)(6116002)(2201001)(6512007)(86362001)(6436002)(102836004)(3846002)(256004)(6636002)(55236004)(1076003)(2501003)(305945005)(386003)(2906002)(4744005)(6486002)(71200400001)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3165;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: VsQloRHI3HAgmCciJZt+8SGTz6hT9Y8ID4mFhEYNVya59qNbQBdpTPQ+nHe2G2LoIaubc41feZEVjxfjDQb93A13TwL4q0UyNMCeHjivS/lgawx33TZHF1Uqc1vYOAD6mubPR2xtlJulj1CdMfEfj6EQdmP7y7nCKDkefcop01XN4pwqRv9IRJ9zg1j7CfqqDceUHXn4KA10M/0hs0iHOYOFZO8OynmYU6UQ0RXK6ygp0Ix8mlqo2Yr8UIkFp2BP0xQZLrxFQRoFNFzo89krbAAixfL0mcMkEwO6I4eiVUV+jY3IGjGjpGzZAl63hBWf8NGRi00wy8ZQzdGJLv85Z51SCsi59Bsb9OJkxS3V3IKKi0TB6gvNgnWhf7huKUyhQQGA16Y+YHnk9m88AO6notN3OSlqpYoIgBci3oolWYk=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3165
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(346002)(136003)(199004)(189003)(2501003)(305945005)(2201001)(4326008)(356004)(7736002)(23756003)(316002)(110136005)(70586007)(336012)(66066001)(70206006)(47776003)(86362001)(6636002)(6116002)(54906003)(6512007)(50466002)(76130400001)(1076003)(6506007)(99286004)(25786009)(26005)(36756003)(22756006)(386003)(3846002)(81156014)(8746002)(8676002)(81166006)(102836004)(2906002)(186003)(8936002)(486006)(5660300002)(478600001)(126002)(26826003)(14454004)(2616005)(63350400001)(4744005)(6486002)(476003)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB5517;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a3603b8b-040d-4bb1-72c1-08d740c549c1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB5517; 
NoDisclaimer: True
X-Forefront-PRVS: 0170DAF08C
X-Microsoft-Antispam-Message-Info: Vjj9wE2yXwt4jbETX/FH4bSOS5XHRdQMzH17fFaIJFPOm0B5N3slouKGtEy2Qk/PKyt7GzESQ6svT5u/xKNb4Krb8jFSUAnDUZvU6fK7AdnGn72tWg/WGkNfVKp7d+jWrHkZyTvWiv1CDsb3TWbJ9SFcAn38sA3UXUhOT8g0ScZom10kv4TU84d/DKbPLdC45hnHAKucHckEOs6Lypa1I4ehAX7Z3j8BY7E1jlC5rHBcX5hV6bRXjEb5cy2eXwUB5Ynp42FwWmg8za0iLUnyiummkvKy1rquBvE4RKLuLdfl2LDRNu9/tbGONRrBOaMny3rPSJJWPG/jZVe7F8UdOC3fcGhDOxS/a8TY7AVMPn7OdBfvoccCnNbfLA42inAYVRdNgb5fJ3QRaQoexNDXQhru5P1pMDd5wqw9/840wvc=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2019 08:00:49.8007 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc8e6f1-dd86-4516-7991-08d740c55070
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5517
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDeY3yrLXKxZ6ZJjHvIhB+5kXK6vvx+mi9GVwSuEm20=;
 b=WiHfFHey67RKfm0gApqkx7cpui6HBIamOOBo5PhxRF6+ie9DF60ojE8DuB6V4hz5TkjT6aw8ydg9yqxhayQgSfuVqkvb2triH2Ia2L2Zd8SPOOSlUMw4cr+FGmMB4gIoyBpDTvhBamA39Nui/IWGDeAGF9+m6Ejl9RFTxlus+tk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDeY3yrLXKxZ6ZJjHvIhB+5kXK6vvx+mi9GVwSuEm20=;
 b=WiHfFHey67RKfm0gApqkx7cpui6HBIamOOBo5PhxRF6+ie9DF60ojE8DuB6V4hz5TkjT6aw8ydg9yqxhayQgSfuVqkvb2triH2Ia2L2Zd8SPOOSlUMw4cr+FGmMB4gIoyBpDTvhBamA39Nui/IWGDeAGF9+m6Ejl9RFTxlus+tk=
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpGcm9tIEQzMiBldmVyeSBjb21wb25lbnQgaGF2ZSBhIGxpbmUgc2l6ZSByZWdpc3RlciB0
byBpbmRpY2F0ZSBpbnRlcm5hbApmaWZvIHNpemUsIGluc3RlYWQgb2YgdXNpbmcgdGhlIGdsb2Jh
bCBsaW5lX3N6LgoKVGhpcyBzZXJpZSBhaW1zIGF0IGFkZGluZyB0aGUgbGF5ZXIgbGluZSBzaXpl
IHN1cHBvcnQgYW5kIGNoZWNrCmFjY29yZGluZ2x5IG9uIGJvdGggRDcxIGFuZCBEMzIgb3IgbmV3
ZXIuCgpDaGFuZ2VzIHNpbmNlIHYxOgpSZWJhc2VzIHRvIGRybS1taXNjLW5leHQgYnJhbmNoLgoK
TG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSAoMik6CiAgZHJtL2tvbWVkYTogQWRkIGxp
bmUgc2l6ZSBzdXBwb3J0CiAgZHJtL2tvbWVkYTogQWRkcyBsYXllciBob3Jpem9udGFsIGlucHV0
IHNpemUgbGltaXRhdGlvbiBjaGVjayBmb3IgRDcxCgogLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9k
NzEvZDcxX2NvbXBvbmVudC5jICAgIHwgMTA2ICsrKysrKysrKysrKysrKystLQogLi4uL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfcmVncy5oIHwgICA5ICstCiAuLi4vZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCAgfCAgIDIgKwogLi4uL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jICAgIHwgIDE3ICsrKwogNCBmaWxlcyBjaGFu
Z2VkLCAxMTkgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgotLSAKMi4xNy4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
