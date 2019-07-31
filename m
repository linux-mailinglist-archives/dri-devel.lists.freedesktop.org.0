Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E947BEEB
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 13:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF58189B5F;
	Wed, 31 Jul 2019 11:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-bgr052101133090.outbound.protection.outlook.com [52.101.133.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FAC89B5F
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 11:08:32 +0000 (UTC)
Received: from VI1PR0801CA0071.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::15) by DB8PR08MB4954.eurprd08.prod.outlook.com
 (2603:10a6:10:bf::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15; Wed, 31 Jul
 2019 11:08:29 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::209) by VI1PR0801CA0071.outlook.office365.com
 (2603:10a6:800:7d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2115.14 via Frontend
 Transport; Wed, 31 Jul 2019 11:08:29 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Wed, 31 Jul 2019 11:08:27 +0000
Received: ("Tessian outbound 71602e13cd49:v26");
 Wed, 31 Jul 2019 11:08:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0809f83b1cd6d667
X-CR-MTA-TID: 64aa7808
Received: from 9c07455b607e.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7978AD71-FB53-47B6-8EF9-B860511D36E6.1; 
 Wed, 31 Jul 2019 11:08:16 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2056.outbound.protection.outlook.com [104.47.9.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9c07455b607e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 31 Jul 2019 11:08:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gc0TrxoYcNW1Q7qGjdRlDitYauv3os7cOCp4VCdx6hPzRCDrXMQPUf6BcxrrY+axxrVUoQ8qX+/QgfyV2D00ZrlfU5kuIaOtVFsm4Y+Rn8DR0yTgv3ZqlK2Auv7DKgSLj5wYgJQruKB+U5vG1A/0rZATPbBllU0MoBHvhACzwnXPzM4RD9S1OKZ+zHDzhuwYWvIYC5RuI1fpJ7up4ZnsUHrIPK4m8rT5ypwBdDRXh0W2uwE+pDAtzyC2D21/T+bkVmwYX9mDpRii2opgC1u2tLMjdubdn/9tT+0+YDhsyOc8KfOpB9Bhh5Zk2OMeBSM5tI1bb+p5tHX7BqTpL+YqyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1rLDFp3xB+oPx6qPFzB4xtyfgNrXhvoeRK2c1xQcUJQ=;
 b=GNwq/3azOdjjlo20OQsPekx9UUon4pUgbPeAWnAoazMPvQao+Lgurx0t7K/7fLzQE6Hvciwfn/rFLto9W5/taopve2a1uJbQcpt4j0jkHvdTvlB76bQpyrq58lfrEtqS/jYxTq0AhZcDfBs5Hgzl0Jc4exQDBjMYKJJ6ldESVbSnO5EPchdBbiIBziMy8Fm1KpuAB2SK2+YcGTcHaDBAvMjJkcwwfL4jOBkEKutqz+/qDMbu5o6X3arzRqSIKYfe4KBzczKMjAEejBcR655apyrvCEjKjt3GnIKLSDag5n0jKIf6dZcegfYC83pvtTS57hFjW5DtVXspPXVbTbDmWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3405.eurprd08.prod.outlook.com (20.177.58.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Wed, 31 Jul 2019 11:08:13 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236%2]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 11:08:13 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/komeda: Skips the invalid writeback job
Thread-Topic: [PATCH] drm/komeda: Skips the invalid writeback job
Thread-Index: AQHVQ4nw7K9FV7USuUuF4ik2yHSO+qbc9HAAgAAFvACAABmDAIAEUTKAgAM0cQA=
Date: Wed, 31 Jul 2019 11:08:12 +0000
Message-ID: <20190731110754.GA15075@lowry.li@arm.com>
References: <1564128758-23553-1-git-send-email-lowry.li@arm.com>
 <20190726142356.GI15868@phenom.ffwll.local>
 <20190726144428.tfwoaniidijchblt@DESKTOP-E1NTVVP.localdomain>
 <CAKMK7uFSK-Wx0TebrYvqD4z682gFTX69sFSj3+k_rZc+eLUpUA@mail.gmail.com>
 <20190729101125.GA16854@lowry.li@arm.com>
In-Reply-To: <20190729101125.GA16854@lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.5.21 (2010-09-15)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: SG2PR01CA0103.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::29) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 515e0e2e-f7dc-49c2-d415-08d715a769d4
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR08MB3405; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB3405:|DB8PR08MB4954:
X-MS-Exchange-PUrlCount: 3
X-Microsoft-Antispam-PRVS: <DB8PR08MB4954C17EA60DD16B8F8CA3C09FDF0@DB8PR08MB4954.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 011579F31F
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(40434004)(199004)(189003)(476003)(5660300002)(76176011)(1076003)(53386004)(6116002)(99286004)(6436002)(81166006)(5024004)(68736007)(86362001)(4326008)(3846002)(81156014)(26005)(8676002)(446003)(52116002)(256004)(8936002)(305945005)(14444005)(11346002)(7736002)(6486002)(66476007)(6512007)(71190400001)(66946007)(54906003)(9686003)(66066001)(386003)(6306002)(71200400001)(6506007)(61793004)(587094005)(6916009)(6246003)(486006)(102836004)(316002)(58126008)(25786009)(33656002)(53546011)(2906002)(55236004)(64756008)(229853002)(53936002)(478600001)(36756003)(966005)(186003)(66556008)(66446008)(14454004)(15920700026);
 DIR:OUT; SFP:1501; SCL:1; SRVR:VI1PR08MB3405;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 1h988sdoGLeO0T6rWoQQVAQo3QM5uuBL2r1KDNyJEsIn8UHrwrQUxLxqE4Hofz/dmzUxx/UbCIgyzvoQiOMk9QM2BjjlPN3vvm67yBVnSr4jZZlL6isyQgT3IOJ1xWS4+z7SE+qHk8B3eIqNQX2inlqLCXk3vbvVo3ebbmg1LaTg2IEJNOi+PfxdfirVDOjK56uNcGd1YJrhpdc5EKgvokJF7ioVTWIbCvqB3wiIBFdRhIaytu+51tw/wEysNzMPNv33/QKGISjIq/TiNIk+iPSZzi2hJ1wPOnNucUjnCMHPsaaR9W1sHhDdcFmHww45BQq12RgCj3jjjw3HpOBsX3w4bUli/J/x9f4CKp8V68LotCpCVy8NtdfgoIDUf6GScGRmqpVLAxgQtWC0OX2CcEJYjT6B4ujWoOFNeNntMrU=
Content-ID: <F8BCFF00673548428FB2C71BD205808C@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3405
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: =?us-ascii?Q?CIP:63.35.35.123; IPV:CAL; SCL:-1;
 CTRY:IE; EFV:NLI; SFV:NSPM; SFS?=
 =?us-ascii?Q?:(10009020)(4636009)(39860400002)(376002)(396003)(346002)(13?=
 =?us-ascii?Q?6003)(2980300002)(40434004)(199004)(189003)(486006)(6512007)?=
 =?us-ascii?Q?(2906002)(14454004)(26005)(99286004)(9686003)(1076003)(47776?=
 =?us-ascii?Q?003)(186003)(61793004)(33656002)(66066001)(58126008)(6116002?=
 =?us-ascii?Q?)(229853002)(305945005)(102836004)(76176011)(46406003)(31600?=
 =?us-ascii?Q?2)(36906005)(587094005)(54906003)(6506007)(6486002)(6306002)?=
 =?us-ascii?Q?(356004)(53546011)(23726003)(3846002)(22756006)(6246003)(811?=
 =?us-ascii?Q?56014)(446003)(81166006)(8746002)(14444005)(5024004)(3675600?=
 =?us-ascii?Q?3)(8676002)(386003)(76130400001)(478600001)(26826003)(893600?=
 =?us-ascii?Q?2)(53386004)(25786009)(966005)(86362001)(63350400001)(773600?=
 =?us-ascii?Q?2)(97756001)(336012)(63370400001)(496002)(11346002)(56603000?=
 =?us-ascii?Q?02)(6862004)(4326008)(476003)(70586007)(126002)(50466002)(70?=
 =?us-ascii?Q?206006)(15920700026);DIR:OUT;SFP:1501;SCL:1;SRVR:DB8PR08MB49?=
 =?us-ascii?Q?54;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:?=
 =?us-ascii?Q?TempError;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.ama?=
 =?us-ascii?Q?zonaws.com;A:1;MX:1;?=
X-MS-Office365-Filtering-Correlation-Id-Prvs: bb0114ba-064d-4f0e-b512-08d715a7605b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB8PR08MB4954; 
NoDisclaimer: True
X-Forefront-PRVS: 011579F31F
X-Microsoft-Antispam-Message-Info: 9EK9rLlQXzFSpqrOymBJgt/9cLL9Wn9TPqNNVtnwLoXdJ1DPFqW3JH6fRW00oHkc1BN1lalmLCIqhrHLSheXfd1vYPkuoHCnJ4SkqPIvq1w6BONStId3G/V/9d0yD3jd0fLgxIhRcpM1fNxKUX6cqA6EaOFxR08+1iS9RZMRPvO3LXlNqaHE4OPgWWP+kMIJ1TF+qvsFrwFUyYVggWX3eqOGoeKOLFzCbWOg2VrEHZTWyPfxdAvppR7Fe/FKkztvKVYZDmWMYIImAe0pUWRX+cFn6STJfBoNoxSLr4K0FJ3yUK0OMbn8hPTTJVqw5BqVjEG5jiO2ul3HBp5cagX9udf6ui97ds348/w7JGI87uOVJcnq+83mTWPXNRcXKJeQP1ZZaNG4aBYlB5N7THjPzxV9oTBb1AlJiTIlkzUXkjc=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2019 11:08:27.4100 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 515e0e2e-f7dc-49c2-d415-08d715a769d4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4954
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1rLDFp3xB+oPx6qPFzB4xtyfgNrXhvoeRK2c1xQcUJQ=;
 b=0XP+DDw2wLQssxdHCF2wB+0sbJSVdLd08cQ5kD1v/JnLzpsvw7yCzQjV02JDUph0fPcr16bIC4h5bK5XNnctSF20KowGAsNNJm0QhuA82oeNYgfZ8IAv6exU6+AwcycLuVlGoaPI+KOcVhjbbsumTa9xUSLm1zZKVsHqLvHDckk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1rLDFp3xB+oPx6qPFzB4xtyfgNrXhvoeRK2c1xQcUJQ=;
 b=0XP+DDw2wLQssxdHCF2wB+0sbJSVdLd08cQ5kD1v/JnLzpsvw7yCzQjV02JDUph0fPcr16bIC4h5bK5XNnctSF20KowGAsNNJm0QhuA82oeNYgfZ8IAv6exU6+AwcycLuVlGoaPI+KOcVhjbbsumTa9xUSLm1zZKVsHqLvHDckk=
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
 Liviu Dudau <Liviu.Dudau@arm.com>, "Jonathan Chai \(Arm
 Technology China\)" <Jonathan.Chai@arm.com>,
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

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMDY6MTE6MjVQTSArMDgwMCwgTG93cnkgTGkgd3JvdGU6
Cj4gT24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMDY6MTU6NDZQTSArMDIwMCwgRGFuaWVsIFZldHRl
ciB3cm90ZToKPiA+IE9uIEZyaSwgSnVsIDI2LCAyMDE5IGF0IDQ6NDQgUE0gQnJpYW4gU3Rhcmtl
eSA8QnJpYW4uU3RhcmtleUBhcm0uY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gRnJpLCBKdWwg
MjYsIDIwMTkgYXQgMDQ6MjM6NTZQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4g
PiBPbiBGcmksIEp1bCAyNiwgMjAxOSBhdCAwODoxMzowMEFNICswMDAwLCBMb3dyeSBMaSAoQXJt
IFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gPiA+ID4gQ3VycmVudCBEUk0tQ09SRSBhY2Nl
cHRzIHRoZSB3cml0ZWJhY2tfam9iIHdpdGggYSBlbXB0eSBmYiwgYnV0IHRoYXQKPiA+ID4gPiA+
IGlzIGFuIGludmFsaWQgam9iIGZvciBIVywgc28gbmVlZCB0byBza2lwIGl0IHdoZW4gY29tbWl0
IGl0IHRvIEhXLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IExvd3J5IExpIChB
cm0gVGVjaG5vbG9neSBDaGluYSkgPGxvd3J5LmxpQGFybS5jb20+Cj4gPiA+ID4KPiA+ID4gPiBI
bSwgdGhpcyBzb3VuZHMgYSBiaXQgbGlrZSBhbiBvdmVyc2lnaHQgaW4gY29yZSB3cml0ZWJhY2sg
Y29kZT8gTm90IHN1cmUKPiA+ID4gPiBob3cgdGhpcyBjYW4gZXZlbiBoYXBwZW4sIHNldHRpbmcg
dXAgYSB3cml0ZWJhY2sgam9iIHdpdGhvdXQgYW4gZmIgc291bmRzCj4gPiA+ID4gYSBiaXQgbGlr
ZSBhIGJ1ZyB0byBtZSBhdCBsZWFzdCAuLi4KPiA+ID4gPgo+ID4gPiA+IElmIHdlIGRvbid0IGhh
dmUgYSBnb29kIHJlYXNvbiBmb3Igd2h5IG90aGVyIGh3IG5lZWRzIHRvIGFjY2VwdCB0aGlzLCB0
aGVuCj4gPiA+ID4gaW1vIHRoaXMgbmVlZHMgdG8gYmUgcmVqZWN0ZWQgaW4gc2hhcmVkIGNvZGUu
IEZvciBjb25zaXN0ZW50IGJlaGF2aW91cgo+ID4gPiA+IGFjcm9zcyBhbGwgd3JpdGViYWNrIHN1
cHBvcnRpbmcgZHJpdmVycy4KPiA+ID4gPiAtRGFuaWVsCj4gPiA+Cj4gPiA+IEkgdGhpbmsgaXQn
cyBvbmx5IHRoaXMgd2F5IHRvIHNpbXBsaWZ5IHRoZSBkcm1fd3JpdGViYWNrX3NldF9mYigpCj4g
PiA+IGltcGxlbWVudGF0aW9uIGluIHRoZSBjYXNlIHdoZXJlIHRoZSBwcm9wZXJ0eSBpcyBzZXQg
bW9yZSB0aGFuIG9uY2UgaW4KPiA+ID4gdGhlIHNhbWUgY29tbWl0ICh0byBzb21ldGhpbmcgdmFs
aWQsIGFuZCB0aGVuIDApLgo+ID4gPgo+ID4gPiBUaGUgY29yZSBjb3VsZCBpbmRlZWQgaGFuZGxl
IGl0IC0gZHJtX3dyaXRlYmFja19zZXRfZmIoKSB3b3VsZCBjaGVjawo+ID4gPiBmYi4gSWYgaXQn
cyBOVUxMIGFuZCB0aGVyZSdzIG5vIHdyaXRlYmFjayBqb2IsIHRoZW4gaXQgY2FuIGp1c3QgZWFy
bHkKPiA+ID4gcmV0dXJuLiBJZiBpdCdzIE5VTEwgYW5kIHRoZXJlJ3MgYWxyZWFkeSBhIHdyaXRl
YmFjayBqb2IgdGhlbiBpdAo+ID4gPiBzaG91bGQgZHJvcCB0aGUgcmVmZXJlbmNlIG9uIHRoZSBl
eGlzdGluZyBmYiBhbmQgZnJlZSB0aGF0IGpvYi4KPiA+ID4KPiA+ID4gQ291bGQgbGVhZCB0byB0
aGUgam9iIGdldHRpbmcgYWxsb2MvZnJlZWQgbXVsdGlwbGUgdGltZXMgaWYgdXNlcnNwYWNlCj4g
PiA+IGlzIGluc2FuZSwgYnV0IG1laC4KPiA+IAo+ID4gR2VuZXJhbGx5IHRoZXNlIGNvbnNpc3Rl
bmN5IGNoZWNrcyBuZWVkIHRvIGJlIGluIGluIHRoZSBhdG9taWNfY2hlY2sKPiA+IHBoYXNlLCBu
b3Qgd2hlbiB3ZSBzZXQgcHJvcGVydGllcy4gU28gZWl0aGVyIHNvbWV3aGVyZSBpbiB0aGUgaGVs
cGVycywKPiA+IG9yIGluIGRybV9hdG9taWNfY29ubmVjdG9yX2NoZWNrKCkgaWYgd2Ugd2FudCBp
dCBpbiBjb3JlLCBlbmZvcmNlZCBmb3IKPiA+IGV2ZXJ5b25lLgo+ID4gLURhbmllbAo+IAo+IFRo
YW5rcyBEYW5pZWwgYW5kIEJyaWFuJ3MgY29tbWVudHMuIEFncmVlIHdpdGggaXQgdG8gYWRkIHRo
ZSBjaGVjayBpbgo+IGF0b21pY19jaGVjayBwaGFzZS4gV2lsbCBzZW5kIGFuIHVwZGF0ZSBwYXRj
aC4KPiAKPiAtTG93cnkKVGhlIG5ldyBwYXRjaHNldCBoYXMgYmVlbiBjb21taXR0ZWQgYXQ6Cmh0
dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjQ0OTMvClRoYW5rcyBhZ2Fp
biBmb3IgdGhlIGNvbW1lbnRzIGFuZCB0aGlzIHBhdGNoIHdpbGwgYmUgZHJvcGVkLgoKQmVzdCBy
ZWdhcmRzLApMb3dyeQo+ID4gPgo+ID4gPiAtQnJpYW4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+ID4g
LS0tCj4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
Y3J0Yy5jICAgICAgICAgfCAyICstCj4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMgfCA5ICsrKysrKysrLQo+ID4gPiA+ID4g
IDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPiA+
ID4KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9jcnRjLmMKPiA+ID4gPiA+IGluZGV4IDJmZWQxZjYuLjM3MmU5OWEgMTAwNjQ0Cj4gPiA+
ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRj
LmMKPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2NydGMuYwo+ID4gPiA+ID4gQEAgLTI2NSw3ICsyNjUsNyBAQCB2b2lkIGtvbWVkYV9jcnRj
X2hhbmRsZV9ldmVudChzdHJ1Y3Qga29tZWRhX2NydGMgKmtjcnRjLAo+ID4gPiA+ID4gIGtvbWVk
YV9waXBlbGluZV91cGRhdGUoc2xhdmUsIG9sZC0+c3RhdGUpOwo+ID4gPiA+ID4KPiA+ID4gPiA+
ICBjb25uX3N0ID0gd2JfY29ubiA/IHdiX2Nvbm4tPmJhc2UuYmFzZS5zdGF0ZSA6IE5VTEw7Cj4g
PiA+ID4gPiAtaWYgKGNvbm5fc3QgJiYgY29ubl9zdC0+d3JpdGViYWNrX2pvYikKPiA+ID4gPiA+
ICtpZiAoY29ubl9zdCAmJiBjb25uX3N0LT53cml0ZWJhY2tfam9iICYmIGNvbm5fc3QtPndyaXRl
YmFja19qb2ItPmZiKQo+ID4gPiA+ID4gIGRybV93cml0ZWJhY2tfcXVldWVfam9iKCZ3Yl9jb25u
LT5iYXNlLCBjb25uX3N0KTsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgLyogc3RlcCAyOiBub3RpZnkg
dGhlIEhXIHRvIGtpY2tvZmYgdGhlIHVwZGF0ZSAqLwo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMK
PiA+ID4gPiA+IGluZGV4IDk3ODc3NDUuLjhlMmVmNjMgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYwo+
ID4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
d2JfY29ubmVjdG9yLmMKPiA+ID4gPiA+IEBAIC01Miw5ICs1MiwxNiBAQAo+ID4gPiA+ID4gIHN0
cnVjdCBrb21lZGFfZGF0YV9mbG93X2NmZyBkZmxvdzsKPiA+ID4gPiA+ICBpbnQgZXJyOwo+ID4g
PiA+ID4KPiA+ID4gPiA+IC1pZiAoIXdyaXRlYmFja19qb2IgfHwgIXdyaXRlYmFja19qb2ItPmZi
KQo+ID4gPiA+ID4gK2lmICghd3JpdGViYWNrX2pvYikKPiA+ID4gPiA+ICByZXR1cm4gMDsKPiA+
ID4gPiA+Cj4gPiA+ID4gPiAraWYgKCF3cml0ZWJhY2tfam9iLT5mYikgewo+ID4gPiA+ID4gK2lm
ICh3cml0ZWJhY2tfam9iLT5vdXRfZmVuY2UpCj4gPiA+ID4gPiArRFJNX0RFQlVHX0FUT01JQygi
T3V0IGZlbmNlIHJlcXVpcmVkIG9uIGEgaW52YWxpZCB3cml0ZWJhY2sgam9iLlxuIik7Cj4gPiA+
ID4gPiArCj4gPiA+ID4gPiArcmV0dXJuIHdyaXRlYmFja19qb2ItPm91dF9mZW5jZSA/IC1FSU5W
QUwgOiAwOwo+ID4gPiA+ID4gK30KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICBpZiAoIWNydGNfc3Qt
PmFjdGl2ZSkgewo+ID4gPiA+ID4gIERSTV9ERUJVR19BVE9NSUMoIkNhbm5vdCB3cml0ZSB0aGUg
Y29tcG9zaXRpb24gcmVzdWx0IG91dCBvbiBhIGluYWN0aXZlIENSVEMuXG4iKTsKPiA+ID4gPiA+
ICByZXR1cm4gLUVJTlZBTDsKPiA+ID4gPiA+IC0tCj4gPiA+ID4gPiAxLjkuMQo+ID4gPiA+ID4K
PiA+ID4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gPiA+ID4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiA+ID4gPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gPiA+ID4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+ID4gPiA+Cj4gPiA+ID4gLS0KPiA+ID4gPiBE
YW5pZWwgVmV0dGVyCj4gPiA+ID4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9u
Cj4gPiA+ID4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKPiA+ID4gSU1QT1JUQU5UIE5PVElDRTogVGhl
IGNvbnRlbnRzIG9mIHRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUgY29uZmlkZW50
aWFsIGFuZCBtYXkgYWxzbyBiZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5k
ZWQgcmVjaXBpZW50LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRv
IG5vdCBkaXNjbG9zZSB0aGUgY29udGVudHMgdG8gYW55IG90aGVyIHBlcnNvbiwgdXNlIGl0IGZv
ciBhbnkgcHVycG9zZSwgb3Igc3RvcmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24gaW4gYW55IG1l
ZGl1bS4gVGhhbmsgeW91Lgo+ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+ID4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiA+IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiA+IAo+ID4gCj4gPiAKPiA+IC0tIAo+ID4g
RGFuaWVsIFZldHRlcgo+ID4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4g
PiArNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCj4gCj4gLS0gCj4g
UmVnYXJkcywKPiBMb3dyeQoKLS0gClJlZ2FyZHMsCkxvd3J5Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
