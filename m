Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 417077895C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 12:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D201789C28;
	Mon, 29 Jul 2019 10:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-bgr052101135098.outbound.protection.outlook.com [52.101.135.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD2989CF1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 10:12:03 +0000 (UTC)
Received: from VI1PR08CA0169.eurprd08.prod.outlook.com (2603:10a6:800:d1::23)
 by VE1PR08MB4957.eurprd08.prod.outlook.com (2603:10a6:803:110::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.10; Mon, 29 Jul
 2019 10:11:56 +0000
Received: from DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::207) by VI1PR08CA0169.outlook.office365.com
 (2603:10a6:800:d1::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2115.14 via Frontend
 Transport; Mon, 29 Jul 2019 10:11:56 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT061.mail.protection.outlook.com (10.152.21.234) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 29 Jul 2019 10:11:54 +0000
Received: ("Tessian outbound 71602e13cd49:v26");
 Mon, 29 Jul 2019 10:11:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 20c6600d10faa3a6
X-CR-MTA-TID: 64aa7808
Received: from c021665daf1f.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.6.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5544BFE5-F71C-4EBB-8943-8A608FC2FA39.1; 
 Mon, 29 Jul 2019 10:11:42 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c021665daf1f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 29 Jul 2019 10:11:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7rfTUzx38V9kGI2gthfF5Im+Vw4t82k1RrisW9EDtCsF3OsZGaeoN0r+3izMdVoR3EHlvXcmFLAeVfVtxRZyOXMZ3QeaeMlktk7pjkVCIE+f2HwUVp78mVORlK/KDqLylrMHQUDogMQ6lmbPx/3F/JTK+bpofKXILcJgM+lpbFHpcnqY9dA3F8dpvTJyh6m0zzVQyfHVYiwtpiLswwo/MeASNO16v1YOizuKN0PAgdPRWHOdsGAmlH45ohJoXjA6zTu2NcQ92I2Ckjmf8/bU80f5kbjFjHMw7WBoCsaEFuSC77PsOXU1YtKlwQx0djcU6ZDcOI/85laPhCuXARC0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSvLt5UXl0HeCdlObKWdaIhK4YV7mcbqce06aOpdPcE=;
 b=TJNd08tblh6Ffqf91cmdh5LOzkkY4LyFurflGztWb59eLCbZzUwbAnzqWV83JeN4SZy86sgLr1rqgzQ9JuOjhbwhH9vGJDTzoL6lKXmz0Yf6KKJ6Lx4eqsXEQUJ0JIaTg1t+JhRqdNLLmwVo4QXplghtogqtVtogXvueI2GxPte7Nn/M5xGcYVgD7Hx+MnzYlLSO4CwTsHR0SwEusjVqgkHFC0vZf0UieKyuoBnXPOeptDQ1S11O9v7PT9wR5QsiAuQEg0lcAT9JxcShwiQgcrhqnkSi11R4ItAY8tKB5JUlkSNLm0pjbav2wod4mrtBgB64dhfqSQtupqchErz7LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3840.eurprd08.prod.outlook.com (20.178.80.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Mon, 29 Jul 2019 10:11:40 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236%2]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 10:11:40 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/komeda: Skips the invalid writeback job
Thread-Topic: [PATCH] drm/komeda: Skips the invalid writeback job
Thread-Index: AQHVQ4nw7K9FV7USuUuF4ik2yHSO+qbc9HAAgAAFvACAABmDAIAEUTKA
Date: Mon, 29 Jul 2019 10:11:39 +0000
Message-ID: <20190729101125.GA16854@lowry.li@arm.com>
References: <1564128758-23553-1-git-send-email-lowry.li@arm.com>
 <20190726142356.GI15868@phenom.ffwll.local>
 <20190726144428.tfwoaniidijchblt@DESKTOP-E1NTVVP.localdomain>
 <CAKMK7uFSK-Wx0TebrYvqD4z682gFTX69sFSj3+k_rZc+eLUpUA@mail.gmail.com>
In-Reply-To: <CAKMK7uFSK-Wx0TebrYvqD4z682gFTX69sFSj3+k_rZc+eLUpUA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.5.21 (2010-09-15)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR04CA0068.apcprd04.prod.outlook.com
 (2603:1096:202:15::12) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b2c681ef-cc97-4ae8-c88c-08d7140d2eab
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3840; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB3840:|VE1PR08MB4957:
X-MS-Exchange-PUrlCount: 2
X-Microsoft-Antispam-PRVS: <VE1PR08MB49571A52C1EAA00E18878CDC9FDD0@VE1PR08MB4957.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 01136D2D90
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(199004)(189003)(40434004)(8936002)(9686003)(587094005)(53936002)(3846002)(6116002)(386003)(305945005)(7736002)(81156014)(81166006)(229853002)(6916009)(61793004)(6512007)(53546011)(55236004)(11346002)(102836004)(1076003)(446003)(186003)(6506007)(14454004)(8676002)(66066001)(6486002)(33656002)(476003)(486006)(26005)(6306002)(25786009)(5660300002)(36756003)(66446008)(64756008)(66556008)(66476007)(68736007)(86362001)(4326008)(966005)(316002)(58126008)(54906003)(478600001)(256004)(99286004)(66946007)(6246003)(6436002)(71190400001)(71200400001)(53386004)(52116002)(76176011)(2906002)(5024004)(14444005)(15920700026);
 DIR:OUT; SFP:1501; SCL:1; SRVR:VI1PR08MB3840;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: hCRi2OlVCcbPME0TF3U2IkclxOKH9Zu9UISva4nm2rYnHjgY6ujATaOdoyAii7P5sAEM3oH+Eyvbk/qZYa+n1YzMpTpIEUXx2uWVHKVukpnGjvx0hQG9arcbC6HksDtZc+NrMJUgRDh6iAgOZinYMzU8LpdZFKYGfwG06FVcsq46wUQN701qvyt1yI42fJN3DTsnxDEbTeT5nU7QHM31GMd4PnTlPplJycwQQjFmerH8z+idhixIeL7pNKUI+HLPdoYGB1wuLs7frYRkTzpnuZ08D7FmCW0z2UCrGIWkD54ugpaH2HQ2A2eCUcb/zfNAkrxJrQkE5kCCirYe9xOib+RFxCY0zelaneE/WA5OF1TqKwrV1ChiCYXPpq8IMWuYV5nd4/BdCle38bhvSuzwWK3lBVufqirHo043GGv3Yzw=
Content-ID: <62B0EE14F90F3447B6AF7531E3447BAA@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3840
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: =?us-ascii?Q?CIP:63.35.35.123; IPV:CAL; SCL:-1;
 CTRY:IE; EFV:NLI; SFV:NSPM; SFS?=
 =?us-ascii?Q?:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(34?=
 =?us-ascii?Q?6002)(2980300002)(199004)(189003)(40434004)(496002)(8936002)?=
 =?us-ascii?Q?(8746002)(7736002)(126002)(305945005)(476003)(99286004)(8115?=
 =?us-ascii?Q?6014)(81166006)(2906002)(33656002)(58126008)(336012)(7020600?=
 =?us-ascii?Q?6)(14454004)(54906003)(47776003)(587094005)(8676002)(26005)(?=
 =?us-ascii?Q?70586007)(63370400001)(11346002)(446003)(6486002)(6335040000?=
 =?us-ascii?Q?1)(46406003)(486006)(61793004)(6306002)(6512007)(9686003)(76?=
 =?us-ascii?Q?130400001)(316002)(186003)(66066001)(23726003)(6116002)(2682?=
 =?us-ascii?Q?6003)(229853002)(966005)(6246003)(5660300002)(386003)(650600?=
 =?us-ascii?Q?7)(3846002)(478600001)(86362001)(53546011)(22756006)(1028360?=
 =?us-ascii?Q?04)(6862004)(14444005)(5024004)(97756001)(76176011)(356004)(?=
 =?us-ascii?Q?25786009)(4326008)(53386004)(36756003)(1076003)(50466002)(15?=
 =?us-ascii?Q?920700026);DIR:OUT;SFP:1501;SCL:1;SRVR:VE1PR08MB4957;H:64aa7?=
 =?us-ascii?Q?808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:TempError;?=
 =?us-ascii?Q?LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com?=
 =?us-ascii?Q?;A:1;MX:1;?=
X-MS-Office365-Filtering-Correlation-Id-Prvs: aeb9f50e-766f-4d40-182a-08d7140d259c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VE1PR08MB4957; 
NoDisclaimer: True
X-Forefront-PRVS: 01136D2D90
X-Microsoft-Antispam-Message-Info: JjXctqnlDXXSsuwz6V8wjBc/mvVP2gosKNS5M6DvCI9se0ccckrR2K0IN8VCjP4gWwF3hdggTzAr39i7aJ9Pkpm/kp7Ad4kXSnN+FL74YPllzPx0ok7RXzKYwW9JH/nPGBo/4ZdGdCq9xAfI5mlh8bwDZfh9GG+CK2tr+HMk12an8BxQ92qdvd7mnNiiImVrXioexmAG8+RZyRQWKGTewTS7m/yc4J7WNCLQY578QcPAKdOK2ffVV5SoyBUr1dC0G1o3Fnf77DdUrG+yzRKBkLBPireof8nEoHXzJTKdsz0oiv9i/RC1zLRsIJiarXLoK/+AXhPg7a/ImiD5OgyiBm/UNSRqhASGnlDCeFmv6Jic27Ea9pVf0uEjFCqp2L+Iki57kmT1/emKSbQVS3q2KXopcvrRq2yVdJHh88hB+F8=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2019 10:11:54.5794 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c681ef-cc97-4ae8-c88c-08d7140d2eab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4957
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSvLt5UXl0HeCdlObKWdaIhK4YV7mcbqce06aOpdPcE=;
 b=m4t0/w48EXWuJmbgbxulc9UP72pGuUi9usMdHaRNEHGNea7AM/+YFngnaIw/Aky9oZgjvHNw/JWKJOh+oiGTVIcYQ1Mzide8HVe8ZcrXJdIJEthFEJzOFjfoszSnmMKI3I3UwIIEbdyAjth9CIln775CJ0hPqMkBQRUrzYkBBOI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSvLt5UXl0HeCdlObKWdaIhK4YV7mcbqce06aOpdPcE=;
 b=m4t0/w48EXWuJmbgbxulc9UP72pGuUi9usMdHaRNEHGNea7AM/+YFngnaIw/Aky9oZgjvHNw/JWKJOh+oiGTVIcYQ1Mzide8HVe8ZcrXJdIJEthFEJzOFjfoszSnmMKI3I3UwIIEbdyAjth9CIln775CJ0hPqMkBQRUrzYkBBOI=
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

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMDY6MTU6NDZQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIEp1bCAyNiwgMjAxOSBhdCA0OjQ0IFBNIEJyaWFuIFN0YXJrZXkgPEJy
aWFuLlN0YXJrZXlAYXJtLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBKdWwgMjYsIDIwMTkg
YXQgMDQ6MjM6NTZQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4gT24gRnJpLCBK
dWwgMjYsIDIwMTkgYXQgMDg6MTM6MDBBTSArMDAwMCwgTG93cnkgTGkgKEFybSBUZWNobm9sb2d5
IENoaW5hKSB3cm90ZToKPiA+ID4gPiBDdXJyZW50IERSTS1DT1JFIGFjY2VwdHMgdGhlIHdyaXRl
YmFja19qb2Igd2l0aCBhIGVtcHR5IGZiLCBidXQgdGhhdAo+ID4gPiA+IGlzIGFuIGludmFsaWQg
am9iIGZvciBIVywgc28gbmVlZCB0byBza2lwIGl0IHdoZW4gY29tbWl0IGl0IHRvIEhXLgo+ID4g
PiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5h
KSA8bG93cnkubGlAYXJtLmNvbT4KPiA+ID4KPiA+ID4gSG0sIHRoaXMgc291bmRzIGEgYml0IGxp
a2UgYW4gb3ZlcnNpZ2h0IGluIGNvcmUgd3JpdGViYWNrIGNvZGU/IE5vdCBzdXJlCj4gPiA+IGhv
dyB0aGlzIGNhbiBldmVuIGhhcHBlbiwgc2V0dGluZyB1cCBhIHdyaXRlYmFjayBqb2Igd2l0aG91
dCBhbiBmYiBzb3VuZHMKPiA+ID4gYSBiaXQgbGlrZSBhIGJ1ZyB0byBtZSBhdCBsZWFzdCAuLi4K
PiA+ID4KPiA+ID4gSWYgd2UgZG9uJ3QgaGF2ZSBhIGdvb2QgcmVhc29uIGZvciB3aHkgb3RoZXIg
aHcgbmVlZHMgdG8gYWNjZXB0IHRoaXMsIHRoZW4KPiA+ID4gaW1vIHRoaXMgbmVlZHMgdG8gYmUg
cmVqZWN0ZWQgaW4gc2hhcmVkIGNvZGUuIEZvciBjb25zaXN0ZW50IGJlaGF2aW91cgo+ID4gPiBh
Y3Jvc3MgYWxsIHdyaXRlYmFjayBzdXBwb3J0aW5nIGRyaXZlcnMuCj4gPiA+IC1EYW5pZWwKPiA+
Cj4gPiBJIHRoaW5rIGl0J3Mgb25seSB0aGlzIHdheSB0byBzaW1wbGlmeSB0aGUgZHJtX3dyaXRl
YmFja19zZXRfZmIoKQo+ID4gaW1wbGVtZW50YXRpb24gaW4gdGhlIGNhc2Ugd2hlcmUgdGhlIHBy
b3BlcnR5IGlzIHNldCBtb3JlIHRoYW4gb25jZSBpbgo+ID4gdGhlIHNhbWUgY29tbWl0ICh0byBz
b21ldGhpbmcgdmFsaWQsIGFuZCB0aGVuIDApLgo+ID4KPiA+IFRoZSBjb3JlIGNvdWxkIGluZGVl
ZCBoYW5kbGUgaXQgLSBkcm1fd3JpdGViYWNrX3NldF9mYigpIHdvdWxkIGNoZWNrCj4gPiBmYi4g
SWYgaXQncyBOVUxMIGFuZCB0aGVyZSdzIG5vIHdyaXRlYmFjayBqb2IsIHRoZW4gaXQgY2FuIGp1
c3QgZWFybHkKPiA+IHJldHVybi4gSWYgaXQncyBOVUxMIGFuZCB0aGVyZSdzIGFscmVhZHkgYSB3
cml0ZWJhY2sgam9iIHRoZW4gaXQKPiA+IHNob3VsZCBkcm9wIHRoZSByZWZlcmVuY2Ugb24gdGhl
IGV4aXN0aW5nIGZiIGFuZCBmcmVlIHRoYXQgam9iLgo+ID4KPiA+IENvdWxkIGxlYWQgdG8gdGhl
IGpvYiBnZXR0aW5nIGFsbG9jL2ZyZWVkIG11bHRpcGxlIHRpbWVzIGlmIHVzZXJzcGFjZQo+ID4g
aXMgaW5zYW5lLCBidXQgbWVoLgo+IAo+IEdlbmVyYWxseSB0aGVzZSBjb25zaXN0ZW5jeSBjaGVj
a3MgbmVlZCB0byBiZSBpbiBpbiB0aGUgYXRvbWljX2NoZWNrCj4gcGhhc2UsIG5vdCB3aGVuIHdl
IHNldCBwcm9wZXJ0aWVzLiBTbyBlaXRoZXIgc29tZXdoZXJlIGluIHRoZSBoZWxwZXJzLAo+IG9y
IGluIGRybV9hdG9taWNfY29ubmVjdG9yX2NoZWNrKCkgaWYgd2Ugd2FudCBpdCBpbiBjb3JlLCBl
bmZvcmNlZCBmb3IKPiBldmVyeW9uZS4KPiAtRGFuaWVsCgpUaGFua3MgRGFuaWVsIGFuZCBCcmlh
bidzIGNvbW1lbnRzLiBBZ3JlZSB3aXRoIGl0IHRvIGFkZCB0aGUgY2hlY2sgaW4KYXRvbWljX2No
ZWNrIHBoYXNlLiBXaWxsIHNlbmQgYW4gdXBkYXRlIHBhdGNoLgoKLUxvd3J5Cj4gPgo+ID4gLUJy
aWFuCj4gPgo+ID4gPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgICAgICAgICB8IDIgKy0KPiA+ID4gPiAgZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMgfCA5ICsr
KysrKysrLQo+ID4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9jcnRjLmMKPiA+ID4gPiBpbmRleCAyZmVkMWY2Li4zNzJlOTlhIDEw
MDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2NydGMuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2NydGMuYwo+ID4gPiA+IEBAIC0yNjUsNyArMjY1LDcgQEAgdm9pZCBrb21lZGFf
Y3J0Y19oYW5kbGVfZXZlbnQoc3RydWN0IGtvbWVkYV9jcnRjICprY3J0YywKPiA+ID4gPiAga29t
ZWRhX3BpcGVsaW5lX3VwZGF0ZShzbGF2ZSwgb2xkLT5zdGF0ZSk7Cj4gPiA+ID4KPiA+ID4gPiAg
Y29ubl9zdCA9IHdiX2Nvbm4gPyB3Yl9jb25uLT5iYXNlLmJhc2Uuc3RhdGUgOiBOVUxMOwo+ID4g
PiA+IC1pZiAoY29ubl9zdCAmJiBjb25uX3N0LT53cml0ZWJhY2tfam9iKQo+ID4gPiA+ICtpZiAo
Y29ubl9zdCAmJiBjb25uX3N0LT53cml0ZWJhY2tfam9iICYmIGNvbm5fc3QtPndyaXRlYmFja19q
b2ItPmZiKQo+ID4gPiA+ICBkcm1fd3JpdGViYWNrX3F1ZXVlX2pvYigmd2JfY29ubi0+YmFzZSwg
Y29ubl9zdCk7Cj4gPiA+ID4KPiA+ID4gPiAgLyogc3RlcCAyOiBub3RpZnkgdGhlIEhXIHRvIGtp
Y2tvZmYgdGhlIHVwZGF0ZSAqLwo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jCj4gPiA+ID4gaW5kZXgg
OTc4Nzc0NS4uOGUyZWY2MyAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYwo+ID4gPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jCj4gPiA+
ID4gQEAgLTUyLDkgKzUyLDE2IEBACj4gPiA+ID4gIHN0cnVjdCBrb21lZGFfZGF0YV9mbG93X2Nm
ZyBkZmxvdzsKPiA+ID4gPiAgaW50IGVycjsKPiA+ID4gPgo+ID4gPiA+IC1pZiAoIXdyaXRlYmFj
a19qb2IgfHwgIXdyaXRlYmFja19qb2ItPmZiKQo+ID4gPiA+ICtpZiAoIXdyaXRlYmFja19qb2Ip
Cj4gPiA+ID4gIHJldHVybiAwOwo+ID4gPiA+Cj4gPiA+ID4gK2lmICghd3JpdGViYWNrX2pvYi0+
ZmIpIHsKPiA+ID4gPiAraWYgKHdyaXRlYmFja19qb2ItPm91dF9mZW5jZSkKPiA+ID4gPiArRFJN
X0RFQlVHX0FUT01JQygiT3V0IGZlbmNlIHJlcXVpcmVkIG9uIGEgaW52YWxpZCB3cml0ZWJhY2sg
am9iLlxuIik7Cj4gPiA+ID4gKwo+ID4gPiA+ICtyZXR1cm4gd3JpdGViYWNrX2pvYi0+b3V0X2Zl
bmNlID8gLUVJTlZBTCA6IDA7Cj4gPiA+ID4gK30KPiA+ID4gPiArCj4gPiA+ID4gIGlmICghY3J0
Y19zdC0+YWN0aXZlKSB7Cj4gPiA+ID4gIERSTV9ERUJVR19BVE9NSUMoIkNhbm5vdCB3cml0ZSB0
aGUgY29tcG9zaXRpb24gcmVzdWx0IG91dCBvbiBhIGluYWN0aXZlIENSVEMuXG4iKTsKPiA+ID4g
PiAgcmV0dXJuIC1FSU5WQUw7Cj4gPiA+ID4gLS0KPiA+ID4gPiAxLjkuMQo+ID4gPiA+Cj4gPiA+
ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4g
PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiA+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+ID4gPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCj4gPiA+Cj4gPiA+IC0tCj4gPiA+IERhbmllbCBWZXR0ZXIKPiA+ID4g
U29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gPiA+IGh0dHA6Ly9ibG9nLmZm
d2xsLmNoCj4gPiBJTVBPUlRBTlQgTk9USUNFOiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBh
bmQgYW55IGF0dGFjaG1lbnRzIGFyZSBjb25maWRlbnRpYWwgYW5kIG1heSBhbHNvIGJlIHByaXZp
bGVnZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3Rp
ZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50
cyB0byBhbnkgb3RoZXIgcGVyc29uLCB1c2UgaXQgZm9yIGFueSBwdXJwb3NlLCBvciBzdG9yZSBv
ciBjb3B5IHRoZSBpbmZvcm1hdGlvbiBpbiBhbnkgbWVkaXVtLiBUaGFuayB5b3UuCj4gPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gZHJpLWRldmVs
IG1haWxpbmcgbGlzdAo+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiAK
PiAKPiAKPiAtLSAKPiBEYW5pZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCj4gKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaAoK
LS0gClJlZ2FyZHMsCkxvd3J5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
