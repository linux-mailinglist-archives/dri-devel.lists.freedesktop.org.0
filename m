Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEC2C2222
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 15:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5252B6E432;
	Mon, 30 Sep 2019 13:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40077.outbound.protection.outlook.com [40.107.4.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8667689CE1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 13:35:46 +0000 (UTC)
Received: from VI1PR08CA0242.eurprd08.prod.outlook.com (2603:10a6:803:dc::15)
 by DB6PR0802MB2454.eurprd08.prod.outlook.com (2603:10a6:4:9f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.17; Mon, 30 Sep
 2019 13:35:41 +0000
Received: from DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::203) by VI1PR08CA0242.outlook.office365.com
 (2603:10a6:803:dc::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.15 via Frontend
 Transport; Mon, 30 Sep 2019 13:35:40 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT035.mail.protection.outlook.com (10.152.20.65) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 30 Sep 2019 13:35:39 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Mon, 30 Sep 2019 13:35:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a9e45afd18e2b331
X-CR-MTA-TID: 64aa7808
Received: from 7731501daa42.3 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 439C5BA4-82AF-42B8-944A-F8B927D84136.1; 
 Mon, 30 Sep 2019 13:35:26 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7731501daa42.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Mon, 30 Sep 2019 13:35:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQYO4ehsxVlyRmfxZLIOmyP/cdJ7TQak0BgTwkWvJQGVRPKBn5pNThGqY2/G34NfQ3FE0KAYD76lePdSWhbidEVqqtbjFNORXQ3cLzO8enQnU0+6NELIeWR7bYfMLHecjcaNC+UoOkYMmH4wLtUlWqicHk0sknm431w826ESs5HGCQLb9KNAM7ZKub4EaPBVa6ufFQSZa0NHXcN2LZOUwtGYDhXXfyhMLflLGU74xAYXdvAAgqsOJnPlLyLl5lwNG1KLYlx31d3pZ/llhmM8Mv9BLLbNhZWOHPRo0tN/WB0A215RwXxe5i6m3670RcMoLHx7QereMIksCtm43kYdbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5jmlvwPkuFbr0EWMejam7XNhucxB12IcTSM91PwwgU=;
 b=Sn5tLSooqiJZmmwE4HSk9xBOiDvTvYHSiw102vCW3896uCkYS135fkPHtdNQjyOXVVqOohuwplJ9DPfLpm/ulq7CQz/KPJeOVc/bi3dMiPU1YngkBk6bOimTNB+agKEZwaZGaa9WqRGrFGAFjH/qGp9d5pDw/iNDg0i8yDv+RxIar1/e7TTQapI644EYtU1hBUM32Bu9T74Z+eYroXKLyniIw6UXewgByTaXm3yshD5h2SVLXfh/cNnqSHglasY7OyF5T84/H2QX3oieWN14GMUdW+oXyVoHh1bKeq37zSGTJoFrpoDTWTcvDE8trVxmQEYFBxfJIKU+twaj3bCpsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from DB8PR08MB5354.eurprd08.prod.outlook.com (52.133.240.216) by
 DB8PR08MB5194.eurprd08.prod.outlook.com (10.255.18.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 13:35:23 +0000
Received: from DB8PR08MB5354.eurprd08.prod.outlook.com
 ([fe80::14ad:d417:d811:387]) by DB8PR08MB5354.eurprd08.prod.outlook.com
 ([fe80::14ad:d417:d811:387%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 13:35:23 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: Qiang Yu <yuq825@gmail.com>
Subject: Re: [PATCH] drm/fourcc: Add Arm 16x16 block modifier
Thread-Topic: [PATCH] drm/fourcc: Add Arm 16x16 block modifier
Thread-Index: AQHVKBsKBvRwqAaS30eXmbt21cTJQqamO1MAgART94CAAAdigIAAF3uAgAOs2ACAhgdkgIAQdTcA
Date: Mon, 30 Sep 2019 13:35:23 +0000
Message-ID: <20190930133522.GA16273@arm.com>
References: <1561112433-5308-1-git-send-email-raymond.smith@arm.com>
 <CAKMK7uEjh+GrSy5AgbVLVQd1S5oJ8KFiWEUmxtMMVdcMSBtdCQ@mail.gmail.com>
 <20190624093233.73f3tcshewlbogli@DESKTOP-E1NTVVP.localdomain>
 <CAKMK7uG02qAqH8MMpE6kzRO99HTjnadTFDrY1vVr9RmAiFPvJA@mail.gmail.com>
 <20190624112301.dmczf2vofxnpzqqi@DESKTOP-E1NTVVP.localdomain>
 <CAKMK7uEotYyRaa4WqNKRGc0nfwcyGccRpX2YzZmETrPdgXkAKA@mail.gmail.com>
 <CAKGbVbvLv6MDYapr5Oo5ZvJh+GV3-LU_ok2a8tpYGWOpw8hBBA@mail.gmail.com>
In-Reply-To: <CAKGbVbvLv6MDYapr5Oo5ZvJh+GV3-LU_ok2a8tpYGWOpw8hBBA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0171.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::15) To DB8PR08MB5354.eurprd08.prod.outlook.com
 (2603:10a6:10:114::24)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.50]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4a7b8889-6e27-4b1f-c061-08d745ab1539
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: DB8PR08MB5194:|DB8PR08MB5194:|DB6PR0802MB2454:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0802MB2454CCA65CA72C7E7DB51441E4820@DB6PR0802MB2454.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3513;OLM:3513;
x-forefront-prvs: 01762B0D64
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(199004)(189003)(6486002)(486006)(6916009)(11346002)(33656002)(76176011)(476003)(66066001)(446003)(6436002)(6246003)(3846002)(6116002)(256004)(53546011)(44832011)(386003)(229853002)(6506007)(71200400001)(71190400001)(2616005)(8676002)(81156014)(4326008)(14444005)(1411001)(478600001)(99286004)(966005)(64756008)(36756003)(8936002)(25786009)(6306002)(86362001)(2906002)(316002)(587094005)(5660300002)(6512007)(54906003)(7736002)(66476007)(66446008)(102836004)(66946007)(52116002)(66556008)(186003)(305945005)(81166006)(14454004)(26005)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB5194;
 H:DB8PR08MB5354.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: MutUI6imcE5FVN8TMhmfMR97lJgr9oUH6ATZDGDZAHbOQc4wKHmJCrFGrqXwonDtTw6nQc7ImR/K8QxMW9e0nbrQb5Evd0LJ6QCdQbNBGuxCEggyxELBUI1onGE+GFRn9DMyFq8jn4bcewWnl6dqG67IwHUyOQhwpof4+NSxyGY3M2OzpchuCA15WyEe2jA3nXCjYcrxdJzmbE6V04WLWJioUYVEAN4LHLBDvSQ7r7/12picu8ekZHwdCObVO1dnVLa/90+l69qN8/OgKXNLUrEqrymxPW266ElAd8lxp2S6VSR0YC5bRm7JXqSg2mA873VVmPDqfo8z4rRDuypw2BwxsC9zb5t4Yf+mOwbs6wr9fqJhXBUSvqw9LGRc5P2GiAYtZ1fs+V3o9qyt85ZFzVNhLYWRORXe9SsYLx16J79bA7LfwPpfGkaGbPVkxD0NS1dAPUDatItsaUMRvGqFyQ==
Content-ID: <C7887580DC92394C923CCB570263C67D@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5194
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(39860400002)(136003)(199004)(189003)(2906002)(6116002)(3846002)(8676002)(102836004)(446003)(476003)(33656002)(8936002)(8746002)(63350400001)(99286004)(2616005)(76176011)(26005)(229853002)(1076003)(6486002)(186003)(53546011)(6506007)(336012)(386003)(486006)(23726003)(126002)(5660300002)(81156014)(81166006)(587094005)(6862004)(25786009)(11346002)(47776003)(4326008)(46406003)(478600001)(26826003)(14444005)(6246003)(14454004)(966005)(70206006)(50466002)(86362001)(356004)(305945005)(66066001)(22756006)(6512007)(6306002)(316002)(97756001)(7736002)(54906003)(76130400001)(36756003)(1411001)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0802MB2454;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7b3d0998-0288-4549-80f0-08d745ab0b69
NoDisclaimer: True
X-Forefront-PRVS: 01762B0D64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iN7vKUxICH6WVl0KIGHCHEwDymKYq8IbX7NiNRYDyHttgGyH6mjR3C2Pb65sHnXxyGF1Yy12dHfgC2Q0YO6A+1+lbI/hfDwVIGqVeUvRsQkNBoUZgzJGL2n4/crBcjuCllmtjwFjAQwHXfDS9jmte0YkKGjcGns8qJwU3zrsXpCdUSjwJ93tm6gkby9zwYMsHPGRB66sVA7hL2bPshvQC20UZY0XZE4zttW6uVv3N8vkrQiBSgCxFva6nQioJTcKRYlteVDiyJdL9No1PaXFNZtvEBCgF16gSoJaklFFtqWMnll5m/+EdmxDJ6r8RhixVMG2aNeuy38UGs2PkbAQLzRGkid+CXiCNtkZzemfUsD9ob+7iJdQqxaEMYhaqKYMGvqEdhR4yqBBY11ZWp5a3IcSL0Ug4D+bmEJQYBoOs/FQp3fHbc/5IbNDVZH2+e3f86O0aXOhh0uwbTuJ2JUubg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2019 13:35:39.3534 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7b8889-6e27-4b1f-c061-08d745ab1539
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2454
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5jmlvwPkuFbr0EWMejam7XNhucxB12IcTSM91PwwgU=;
 b=Bg9pmEQugvcdriWPvMUlO2f5MO3meeztGrkVz/SOultGYEhtv02uY0KRd9jvWcBl/OgRt23/Lhtpm54/ckM2zSEP1Cxb5t2kAEyQAvSTV2qTR/RJthvSBiMFPZZlmnH03nl4AEQG24EQwMi3PPjDhhsm8YepsBuEuRRyynEBVak=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5jmlvwPkuFbr0EWMejam7XNhucxB12IcTSM91PwwgU=;
 b=Bg9pmEQugvcdriWPvMUlO2f5MO3meeztGrkVz/SOultGYEhtv02uY0KRd9jvWcBl/OgRt23/Lhtpm54/ckM2zSEP1Cxb5t2kAEyQAvSTV2qTR/RJthvSBiMFPZZlmnH03nl4AEQG24EQwMi3PPjDhhsm8YepsBuEuRRyynEBVak=
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
Cc: "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "malidp@foss.arm.com" <malidp@foss.arm.com>, nd <nd@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjAsIDIwMTkgYXQgMTA6MTU6NDFBTSArMDgwMCwgUWlhbmcgWXUgd3JvdGU6
Cj4gSGkgZ3V5cywKPiAKPiBJJ2QgbGlrZSB0byBrbm93IHRoZSBzdGF0dXMgb2YgdGhpcyBwYXRj
aD8gSSBleHBlY3QgYSB2MiBhZGRpbmcgc29tZQo+IGNvbW1lbnRzL21hY3JvcyBhYm91dCB0aGUg
aGlnaCBiaXQgcGxhbiB3b3VsZCBiZSBlbm91Z2g/Cj4gCj4gQFJheW1vbmQgJiBAQnJpYW4gZG8g
eW91IHN0aWxsIG5lZWQgYW5vdGhlciBsb25nIHByb2Nlc3MgdG8gc2VuZCBvdXQgYQo+IHYyIHBh
dGNoPyBJZiBzbywgSSBjYW4gaGVscCB0byBwcmVwYXJlIGEgdjIgcGF0Y2ggYWNjb3JkaW5nIHRv
IHlvdXIKPiBwcmV2aW91cyBtYWlsLgoKQXBvbG9naWVzIGZvciB0aGUgbG9uZyB3YWl0LgpAUmF5
bW9uZCBoYXMgbGVmdCB0aGUgY29tcGFueSwgc28gbm93IEkgd2lsbCBiZSBsb29raW5nIGludG8g
aXQuIEkKd2lsbCByZXNwaW4gdGhlIHBhdGNoIGluIGEgZGF5IG9yIHR3by4KIAo+IFRoYW5rcywK
PiBRaWFuZwo+IAo+IE9uIFRodSwgSnVuIDI3LCAyMDE5IGF0IDM6MzAgQU0gRGFuaWVsIFZldHRl
ciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIEp1biAyNCwgMjAxOSBh
dCAxOjIzIFBNIEJyaWFuIFN0YXJrZXkgPEJyaWFuLlN0YXJrZXlAYXJtLmNvbT4gd3JvdGU6Cj4g
PiA+Cj4gPiA+IE9uIE1vbiwgSnVuIDI0LCAyMDE5IGF0IDExOjU4OjU5QU0gKzAyMDAsIERhbmll
bCBWZXR0ZXIgd3JvdGU6Cj4gPiA+ID4gT24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMTE6MzIgQU0g
QnJpYW4gU3RhcmtleSA8QnJpYW4uU3RhcmtleUBhcm0uY29tPiB3cm90ZToKPiA+ID4gPiA+Cj4g
PiA+ID4gPiBIaSBEYW5pZWwsCj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gRnJpLCBKdW4gMjEsIDIw
MTkgYXQgMDU6Mjc6MDBQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4gPiA+ID4g
T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMTI6MjEgUE0gUmF5bW9uZCBTbWl0aCA8UmF5bW9uZC5T
bWl0aEBhcm0uY29tPiB3cm90ZToKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IEFkZCB0aGUg
RFJNX0ZPUk1BVF9NT0RfQVJNXzE2WDE2X0JMT0NLX1VfSU5URVJMRUFWRUQgbW9kaWZpZXIgdG8K
PiA+ID4gPiA+ID4gPiBkZW5vdGUgdGhlIDE2eDE2IGJsb2NrIHUtaW50ZXJsZWF2ZWQgZm9ybWF0
IHVzZWQgaW4gQXJtIFV0Z2FyZCBhbmQKPiA+ID4gPiA+ID4gPiBNaWRnYXJkIEdQVXMuCj4gPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBSYXltb25kIFNtaXRoIDxyYXlt
b25kLnNtaXRoQGFybS5jb20+Cj4gPiA+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiA+ID4gIGluY2x1
ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIHwgMTAgKysrKysrKysrKwo+ID4gPiA+ID4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIGIvaW5jbHVkZS91
YXBpL2RybS9kcm1fZm91cmNjLmgKPiA+ID4gPiA+ID4gPiBpbmRleCAzZmVlYWEzLi44ZWQ3ZWNm
IDEwMDY0NAo+ID4gPiA+ID4gPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5o
Cj4gPiA+ID4gPiA+ID4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgKPiA+ID4g
PiA+ID4gPiBAQCAtNzQzLDYgKzc0MywxNiBAQCBleHRlcm4gIkMiIHsKPiA+ID4gPiA+ID4gPiAg
I2RlZmluZSBBRkJDX0ZPUk1BVF9NT0RfQkNIICAgICAoMVVMTCA8PCAxMSkKPiA+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiA+ICAvKgo+ID4gPiA+ID4gPiA+ICsgKiBBcm0gMTZ4MTYgQmxvY2sgVS1J
bnRlcmxlYXZlZCBtb2RpZmllcgo+ID4gPiA+ID4gPiA+ICsgKgo+ID4gPiA+ID4gPiA+ICsgKiBU
aGlzIGlzIHVzZWQgYnkgQXJtIE1hbGkgVXRnYXJkIGFuZCBNaWRnYXJkIEdQVXMuIEl0IGRpdmlk
ZXMgdGhlIGltYWdlCj4gPiA+ID4gPiA+ID4gKyAqIGludG8gMTZ4MTYgcGl4ZWwgYmxvY2tzLiBC
bG9ja3MgYXJlIHN0b3JlZCBsaW5lYXJseSBpbiBvcmRlciwgYnV0IHBpeGVscwo+ID4gPiA+ID4g
PiA+ICsgKiBpbiB0aGUgYmxvY2sgYXJlIHJlb3JkZXJlZC4KPiA+ID4gPiA+ID4gPiArICovCj4g
PiA+ID4gPiA+ID4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9NT0RfQVJNXzE2WDE2X0JMT0NLX1VfSU5U
RVJMRUFWRUQgXAo+ID4gPiA+ID4gPiA+ICsgICAgICAgZm91cmNjX21vZF9jb2RlKEFSTSwgKCgx
VUxMIDw8IDU1KSB8IDEpKQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBUaGlzIHNlZW1zIHRvIGJl
IGFuIGV4dHJlbWVseSByYW5kb20gcGljayBmb3IgYSBuZXcgbnVtYmVyLiBXaGF0J3MgdGhlCj4g
PiA+ID4gPiA+IHRoaW5raW5nIGhlcmU/IEFzaWRlIGZyb20gImRvZXNudCBtYXRjaCBhbnkgb2Yg
dGhlIGFmYmMgY29tYm9zIiBvZmMuCj4gPiA+ID4gPiA+IElmIHlvdSdyZSBhbHJlYWR5IHVwIHRv
IGhhdmluZyB0aHJvd24gYXdheSA1NWJpdHMsIHRoZW4gaXQncyBub3QgZ29pbmcKPiA+ID4gPiA+
ID4gdG8gbGFzdCBsb25nIHJlYWxseSA6LSkKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSSB0aGlu
ayBhIGdvb2QgaWRlYSB3b3VsZCBiZSB0byByZXNlcnZlIGEgYnVuY2ggb2YgdGhlIGhpZ2ggYml0
cyBhcwo+ID4gPiA+ID4gPiBzb21lIGZvcm0gb2YgaW5kZXggKGFmYmMgd291bGQgZ2V0IGluZGV4
IDAgZm9yIGJhY2t3YXJkcyBjb21wYXQpLiBBbmQKPiA+ID4gPiA+ID4gdGhlbiB0aGUgbG93ZXIg
Yml0cyB3b3VsZCBiZSBmb3IgZnJlZSB1c2UgZm9yIGEgZ2l2ZW4gaW5kZXgvbW9kZS4gQW5kCj4g
PiA+ID4gPiA+IHRoZSBmaXJzdCBtb2RlIGlzIHByb2JhYmx5IGFuIGVudW1lcmF0aW9uLCB3aGVy
ZSBwb3NzaWJsZSBtb2RlcyBzaW1wbGUKPiA+ID4gPiA+ID4gZ2V0IGVudW1lcmF0ZWQgd2l0aG91
dCBmdXJ0aGVyIGZsYWdzIG9yIGFueXRoaW5nLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFl1cCwgdGhh
dCdzIHRoZSBwbGFuOgo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICAgICAgKDAgPDwgNTUpOiBBRkJD
Cj4gPiA+ID4gPiAgICAgICAgICgxIDw8IDU1KTogVGhpcyAibm9uLWNhdGVnb3J5IiBmb3IgVS1J
bnRlcmxlYXZlZAo+ID4gPiA+ID4gICAgICAgICAoMSA8PCA1NCk6IFdoYXRldmVyIHRoZSBuZXh0
IGNhdGVnb3J5IGlzCj4gPiA+ID4gPiAgICAgICAgICgzIDw8IDU0KTogV2hhdGV2ZXIgY29tZXMg
YWZ0ZXIgdGhhdAo+ID4gPiA+ID4gICAgICAgICAoMSA8PCA1Myk6IE1heWJlIHdlJ2xsIGdldCBo
ZXJlIHNvbWVkYXkKPiA+ID4gPgo+ID4gPiA+IFVoLCBzbyB0aGUgaW5kZXggd291bGQgYmUgZW5j
b2RlZCB3aXRoIGxlYXN0LXNpZ25pZmljYW50IGJpdCBmaXJzdCwKPiA+ID4gPiBzdGFydGluZyBm
cm9tIGJpdDU1IGRvd253YXJkcz8KPiA+ID4KPiA+ID4gWWVhaC4KPiA+ID4KPiA+ID4gPiBDbGV2
ZXIgaWRlYSwgYnV0IEkgdGhpbmsgdGhpcyBuZWVkcyBhCj4gPiA+ID4gbWFjcm8gKG9yIGF0IGxl
YXN0IGEgY29tbWVudCkuIE5vdCBzdXJlIHRoZXJlJ3MgYSByZWFkeS1tYWRlIGJpdG1hc2sKPiA+
ID4gPiBtaXJyb3IgZnVuY3Rpb24gZm9yIHRoaXMgc3R1ZmYsIHdvcmtzIGNhc2Ugd2UgY2FuIGhh
bmQtY29kZSBpdCBhbmQKPiA+ID4gPiBleHRlbmQgZXZlcnkgdGltZSB3ZSBuZWVkIG9uZSBtb3Jl
IGJpdCBlbmNvZGVkLiBTb21ldGhpbmcgbGlrZToKPiA+ID4gPgo+ID4gPiA+IE1JUlJPUl9VMzIo
KHUgJiAoQklUKDApKSA8PCAzMSB8ICh1ICYgQklUKDEpIDw8IDMwIHwgLi4uKQo+ID4gPiA+Cj4g
PiA+Cj4gPiA+IElzIGl0IHJlYWxseSB3b3J0aCBpdD8gUGVvcGxlIGNhbiBqdXN0IHVzZSB0aGUg
ZGVmaW5pdGlvbnMgYXMgd3JpdHRlbgo+ID4gPiBpbiBkcm1fZm91cmNjLmguIEkgYWdyZWUgdGhh
dCB3ZSBzaG91bGQgaGF2ZSB0aGUgaGlnaCBiaXRzIGRlc2NyaWJlZAo+ID4gPiBpbiBhIGNvbW1l
bnQgdGhvdWdoLgo+ID4gPgo+ID4gPiA+IEFuZCB0aGVuIHNoaWZ0IHRoYXQgdG8gdGhlIGNvcnJl
Y3QgcGxhY2UuIFByb2JhYmx5IHdhbnQgYW4KPiA+ID4gPgo+ID4gPiA+IEFSTV9NT0RJRklFUl9F
TkNPREUoc3BhY2VfaWR4LCBmbGFncykgbWFjcm8gd2hpY2ggYXNzZW1ibGVzIGV2ZXJ5dGhpbmcu
Cj4gPiA+ID4KPiA+ID4gPiA+ICAgICAgICAgLi4uCj4gPiA+ID4gPgo+ID4gPiA+ID4gSSBkaWRu
J3Qgd2FudCB0byBleHBsaWNpdGx5IHJlc2VydmUgc29tZSBoaWdoIGJpdHMsIGJlY2F1c2Ugd2Un
dmUgbm8KPiA+ID4gPiA+IGlkZWEgaG93IG1hbnkgdG8gcmVzZXJ2ZS4gVGhpcyB3YXksIHdlIGNh
biBhc3NpZ24gZXhhY3RseSBhcyBtYW55Cj4gPiA+ID4gPiBoaWdoIGJpdHMgYXMgd2UgbmVlZCwg
d2hlbiB3ZSBuZWVkIHRoZW0uIElmIGFueSBvZiB0aGUgIm1vZGVzIiBzdGFydAo+ID4gPiA+ID4g
ZW5jcm9hY2hpbmcgdG93YXJkcyB0aGUgaGlnaCBiaXRzLCB3ZSdsbCBoYXZlIHRvIG1ha2UgYSBk
ZWNpc2lvbiBhdAo+ID4gPiA+ID4gdGhhdCBwb2ludC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBBbHNv
LCB0aGlzIGlzIHRoZSBvbmx5IFUtSW50ZXJsZWF2ZWQgZm9ybWF0ICh0aGF0IEkga25vdyBvZiks
IHNvIGl0J3MKPiA+ID4gPiA+IG5vdCB3b3J0aCBjYWxsaW5nIGJpdCA1NSAiVGhlIFUtSW50ZXJs
ZWF2ZWQgYml0IiBiZWNhdXNlIHRoYXQgd291bGQgYmUKPiA+ID4gPiA+IGEgd2FzdGUgb2Ygc3Bh
Y2UuIEl0J3MgbW9yZSBsaWtlIHRoZSAibWlzYyIgYml0LCBidXQgdGhhdCdzIG5vdCBhCj4gPiA+
ID4gPiB1c2VmdWwgbmFtZSB0byBlbnNocmluZSBpbiBVQVBJLgo+ID4gPiA+Cj4gPiA+ID4gWWVh
aCB0aGF0J3Mgd2hhdCBJIG1lYW50LiBBbHNvIGJldHRlciB0byBleHBsaWNpdGx5IHJlc2VydmUg
dGhpcywgaS5lLgo+ID4gPiA+Cj4gPiA+ID4gI2RlZmluZSBBUk1fRkJDX01PRElGSUVSX1NQQUNF
IDAKPiA+ID4gPiAjZGVmaW5lIEFSTV9NSVNDX01PRElGSUVSX1NQQUNFIDEKPiA+ID4gPgo+ID4g
PiA+IGFuZCB0aGVuIGVuY29kZSB3aXRoIHRoZSBtaXJyb3IgdHJpY2tlcnkuCj4gPiA+ID4KPiA+
ID4KPiA+ID4gSSBkb24ndCByZWFsbHkgc2VlIHRoZSB2YWx1ZSBpbiB0aGF0IGVpdGhlciwgaXQn
cyBqdXN0IGdpdmluZwo+ID4gPiB1c2Vyc3BhY2UgdGhlIG9wcG9ydHVuaXR5IHRvIGRlcGVuZCBv
biBtb3JlIHN0dWZmOiBtb3JlIGZ1dHVyZQo+ID4gPiBoZWFkYWNoZXMuIFNvIGxvbmcgYXMgdGhl
IDY0LWJpdCB2YWx1ZXMgYXJlIHN0YWJsZSwgdGhhdCBzaG91bGQgYmUKPiA+ID4gZW5vdWdoLgo+
ID4KPiA+IElmIHlvdSB0aGluayB5b3UgbmVlZCB0byBzYXZlIHRoZSBmZXcgYml0cyB0aGlzIHBv
dGVudGlhbGx5IHNhdmVzIHlvdQo+ID4gb3ZlciBqdXN0IGVuY29kaW5nIDhiaXQgZW51bSBsaWtl
IGluIFFpYW5nJ3Mgb3JpZ2luYWwgcGF0Y2ggSSB0aGluawo+ID4geW91IGdldCB0byB0eXBlIGEg
ZmV3IG1hY3JvcyBhbmQgY29tbWVudHMgLi4uCj4gPgo+ID4gPiA+ID4gTm90ZSB0aGF0IGlzbid0
IHRoZSBzYW1lIGFzIHRoZSAibm90LUFGQkMgYml0IiwgYmVjYXVzZSB3ZSBtYXkgd2VsbAo+ID4g
PiA+ID4gaGF2ZSBzb21ldGhpbmcgaW4gdGhlIGZ1dHVyZSB3aGljaCBpcyBuZWl0aGVyIEFGQkMg
bm9yICJtaXNjIi4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBXZSd2ZSBiZWVuIHZlcnkgY2FyZWZ1bCBp
biBvdXIgY29kZSB0byBlbmZvcmNlIGFsbAo+ID4gPiA+ID4gdW5kZWZpbmVkL3VucmVjb2duaXNl
ZCBiaXRzIHRvIGJlIHplcm8sIHRvIGVuc3VyZSB0aGF0IHRoaXMgd29ya3MuCj4gPiA+ID4gPgo+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBUaGUgb3RoZXIgYml0OiBXb3VsZCBiZSByZWFsIGdvb2Qg
dG8gZGVmaW5lIHRoZSBmb3JtYXQgYSBiaXQgbW9yZQo+ID4gPiA+ID4gPiBwcmVjaXNlbHksIGlu
Y2x1ZGluZyB0aGUgbGF5b3V0IHdpdGhpbiB0aGUgdGlsZS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJ
dCdzIFUtSW50ZXJsZWF2ZWQsIG9idmlvdXNseSA7LSkKPiA+ID4gPgo+ID4gPiA+IDotKSBJIG1l
YW4gZnVsbCBjb2RlIGV4aXN0cyBpbiBwYW5mcm9zdC9saW1hLCBzbyB0aGlzIHdvbid0IGNoYW5n
ZQo+ID4gPiA+IGFueXRoaW5nIHJlYWxseSAuLi4KPiA+ID4KPiA+ID4gWWVhaCwgc28gZm9yIHVz
IHRvIHByb3ZpZGUgYSBtb3JlIGRldGFpbGVkIGRlc2NyaXB0aW9uIHdvdWxkIHJlcXVpcmUKPiA+
ID4gYW5vdGhlciBsZW5ndGh5IGxvb3AgdGhyb3VnaCBvdXIgbGVnYWwgYXBwcm92YWwgcHJvY2Vz
cywgYW5kIEknbSBub3QKPiA+ID4gc3VyZSB3ZSBjYW4gbWFrZSBhIHN0cm9uZyBidXNpbmVzcyBj
YXNlICh3aGljaCBpcyB3aGF0IHdlIG5lZWQpIGZvcgo+ID4gPiB3aHkgdGhpcyBpcyBuZWVkZWQu
Cj4gPiA+Cj4gPiA+IE9mIGNvdXJzZSwgaWYgc29tZW9uZSBoYXBwZW5zIHRvIGtub3cgdGhlIGxh
eW91dCBhbmQgd2FudHMgdG8KPiA+ID4gY29udHJpYnV0ZSB0byB0aGlzIGZpbGUuLi4gVGhlbiBJ
IGRvbid0IGtub3cgaG93IGFjay9yLWIgd291bGQgd29yayBpbgo+ID4gPiB0aGF0IGNhc2UsIGJ1
dCBJIGltYWdpbmUgdGhlIHN1YnN5c3RlbSBtYWludGFpbmVyKHMpIG1pZ2h0IHRha2UgaXNzdWUK
PiA+ID4gd2l0aCB1cyBhdHRlbXB0aW5nIHRvIGJsb2NrIHRoYXQgY29udHJpYnV0aW9uLgo+ID4K
PiA+IFdlbGwgY2FuJ3QgcmVhbGx5IHRha2UgYSBtb2RpZmllciB3aXRob3V0IGtub3dpbmcgd2hh
dCBpdCdzIGZvciwgSQo+ID4gZ3Vlc3MgdGhpcyBpcyB1cCB0byBsaW1hL3BhbmZyb3N0IGZvbGtz
IHRoZW4gdG8gZmlndXJlIG91dCA6LVAKPiA+IC1EYW5pZWwKPiA+Cj4gPiA+Cj4gPiA+IFRoYW5r
cywKPiA+ID4gLUJyaWFuCj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBDaGVlcnMsIERhbmllbAo+ID4g
PiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gLUJyaWFuCj4gPiA+ID4gPgo+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiBBbHNvIG9mYyBuZWVkcyBhY2tzIGZyb20gbGltYS9wYW5mcm9zdCBwZW9wbGUgc2lu
Y2UgSSBhc3N1bWUgdGhleSdsbAo+ID4gPiA+ID4gPiBiZSB1c2luZyB0aGlzLCB0b28uCj4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+IFRoYW5rcywgRGFuaWVsCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
ID4gKwo+ID4gPiA+ID4gPiA+ICsvKgo+ID4gPiA+ID4gPiA+ICAgKiBBbGx3aW5uZXIgdGlsZWQg
bW9kaWZpZXIKPiA+ID4gPiA+ID4gPiAgICoKPiA+ID4gPiA+ID4gPiAgICogVGhpcyB0aWxpbmcg
bW9kZSBpcyBpbXBsZW1lbnRlZCBieSB0aGUgVlBVIGZvdW5kIG9uIGFsbCBBbGx3aW5uZXIgcGxh
dGZvcm1zLAo+ID4gPiA+ID4gPiA+IC0tCj4gPiA+ID4gPiA+ID4gMi43LjQKPiA+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAtLQo+ID4gPiA+ID4gPiBEYW5p
ZWwgVmV0dGVyCj4gPiA+ID4gPiA+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlv
bgo+ID4gPiA+ID4gPiArNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNo
Cj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gLS0KPiA+ID4gPiBEYW5pZWwgVmV0dGVy
Cj4gPiA+ID4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gPiA+ID4gKzQx
ICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaAo+ID4KPiA+Cj4gPgo+ID4g
LS0KPiA+IERhbmllbCBWZXR0ZXIKPiA+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgo+ID4gKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
