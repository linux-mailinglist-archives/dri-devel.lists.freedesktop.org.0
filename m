Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DCFBACB9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 04:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2B16E0D5;
	Mon, 23 Sep 2019 02:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80057.outbound.protection.outlook.com [40.107.8.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DD96E0D5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 02:41:56 +0000 (UTC)
Received: from AM6PR08CA0044.eurprd08.prod.outlook.com (2603:10a6:20b:c0::32)
 by DB8SPR01MB0010.eurprd08.prod.outlook.com (2603:10a6:10:b6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.23; Mon, 23 Sep
 2019 02:41:52 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::206) by AM6PR08CA0044.outlook.office365.com
 (2603:10a6:20b:c0::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.20 via Frontend
 Transport; Mon, 23 Sep 2019 02:41:52 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2284.20 via Frontend Transport; Mon, 23 Sep 2019 02:41:51 +0000
Received: ("Tessian outbound 5061e1b5386c:v31");
 Mon, 23 Sep 2019 02:41:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c50fe50f55d8d82d
X-CR-MTA-TID: 64aa7808
Received: from b834343a3516.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 107CE416-B58F-48F5-A6CF-438BEAB61C3E.1; 
 Mon, 23 Sep 2019 02:41:45 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2056.outbound.protection.outlook.com [104.47.10.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b834343a3516.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 Sep 2019 02:41:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIcRSkXooMEMGldwle5rCEZi/epFX3PSUk8Te1aYmsXHmIti1igzWmoJM0U1IGR3CzF31Gaeq+sz6SJP32/kZ6+TIIR9I4n9mIywqEYij2WFUHWup55rE2eRi56H9b9p5jhtncCmIIXOZBpAQXrD/s9wgR2Wj7EwTWXaPpgA0Yk7r5YIZVKVB8lPIGURtNT7VsBAF0QipIjdIm2l99JVyECdAtRgFkYKsxVheW756kFZzpalnIh8xXmIVvM1XZ75vS5xOsyJ55zh3KX18X4O8qZVxrk0fEhEPJnPCzfkDnc5g07C5VbvJVUIXtntxQDI/wfZUKJRTa7fE8VGxyxZHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2DgwLJCXbGTdeksmaGP+tN0dRypjhhWSxtmJqV+b9I=;
 b=F+l10KV/UI0ItidqO5OHJJdOhpoK26Zaw0rndsoKzj7Hh7SasHmzUKPckOEA+7LijiIMlwraRGFgYpN6kBCifmn7Q9G2tZgmPRuiCCmKJpA0bIabFcFF0VCPGzq4oEa+04ZocUy5FbZCDDNJEH09E2cqB2IwVZ5j42CFkx2NHCezxZCXAESApUkK/saMfP1xilnUQP6+O+lGz9BPsWuQ6wKFPtAGHkfrLGGVzUvUvg3Y/lCMtg+zl1L4k3klHunsP3UDzPkyaMmjmZfmU7NqbKEcOhtgFqksUmDrapgBJiL4ggxd2VHtXKAhotLRj0IYpri8nVn0Z22cRUGbfwJs/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4814.eurprd08.prod.outlook.com (10.255.115.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Mon, 23 Sep 2019 02:41:44 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879%5]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 02:41:44 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH] drm/komeda: Use IRQ_RETVAL shorthand in d71_irq_handler
Thread-Topic: [PATCH] drm/komeda: Use IRQ_RETVAL shorthand in d71_irq_handler
Thread-Index: AQHVb8XpefZcvGvZNkuWrwlyThjxiKc4kUoA
Date: Mon, 23 Sep 2019 02:41:44 +0000
Message-ID: <20190923024136.GB24909@jamwan02-TSP300>
References: <20190920151247.25128-1-mihail.atanassov@arm.com>
In-Reply-To: <20190920151247.25128-1-mihail.atanassov@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0181.apcprd02.prod.outlook.com
 (2603:1096:201:21::17) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c1558616-a491-42e4-9da2-08d73fcf969e
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VE1PR08MB4814; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4814:|VE1PR08MB4814:|DB8SPR01MB0010:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8SPR01MB001038F8C4B91D6E94AC1D55B3850@DB8SPR01MB0010.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 0169092318
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(396003)(376002)(39860400002)(136003)(366004)(346002)(199004)(189003)(71200400001)(71190400001)(76176011)(7736002)(6436002)(229853002)(6486002)(52116002)(386003)(5660300002)(6506007)(14454004)(476003)(8676002)(81166006)(66476007)(66556008)(81156014)(55236004)(478600001)(186003)(26005)(446003)(102836004)(486006)(99286004)(8936002)(66446008)(64756008)(66946007)(11346002)(25786009)(6116002)(3846002)(33716001)(58126008)(1076003)(54906003)(316002)(2906002)(66066001)(6636002)(86362001)(6862004)(256004)(14444005)(6246003)(4326008)(305945005)(33656002)(6512007)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4814;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: Z4vWH7NSW9aK3+y6nSq7BiHbQnWaX2TioNaSBYo+uCvvznEq/ryTKx8AClQNdiPG4wiECm+11fcaBuDiBgBjN6jA8x0b622wicGPq0ahvdNsY2ZWvwOj8BrIjoAevfDIm3auPT/LPlOiVgFCUS/waksbfMLGw2SUOo1wGL8kgXHrz7SGq6iLUjk+x+spoRDeFC0iZVY2ua+bnvQ9e0wtjhkZDnsJ4fpReT5ecHhvW902gHtgFrV6S0ZWiW9Hqa0fQq9wn05GqqR39nA/OCoVDA4F0XGtl7R3sGEiRp+MHdikjBFL48fVvubzoeh7pqEDfEpkyDk/h9Fio2unbHUXmVfAQFlHkzjhj4q0f+CXmOGC2iwkwPSA7biJ2RjGKhpXalavxuk31tvEk+1A+MonyVClzHr7XLD1IOz7MOmWip4=
Content-ID: <30E3520BCE9D264C90B981147FEADACC@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4814
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(136003)(346002)(376002)(39850400004)(396003)(189003)(199004)(102836004)(6862004)(11346002)(336012)(9686003)(6512007)(99286004)(97756001)(63350400001)(478600001)(8746002)(8676002)(446003)(66066001)(486006)(356004)(305945005)(54906003)(86362001)(47776003)(14454004)(6636002)(126002)(186003)(8936002)(4326008)(81156014)(81166006)(1076003)(476003)(46406003)(26826003)(36906005)(7736002)(316002)(70206006)(33716001)(25786009)(6486002)(6116002)(33656002)(76176011)(76130400001)(3846002)(70586007)(50466002)(2906002)(58126008)(6246003)(6506007)(23726003)(107886003)(14444005)(229853002)(386003)(26005)(22756006)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8SPR01MB0010;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5c528f7d-0035-44a6-3902-08d73fcf9248
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DB8SPR01MB0010; 
NoDisclaimer: True
X-Forefront-PRVS: 0169092318
X-Microsoft-Antispam-Message-Info: LghDfgX4uCcUNzMfXvB64ijy5unBabEBWZPDVNRprRn4+JMi60Yx5sybgsLGaXQa9/46MXDdunjkehaNfWNtdVK9QrAVPuGFanfXzV6/hAcS47vCSvesnHPjwYxqSoa+ZqhxYhADykkuLzoMb1EKbo1pbA7+U4sOi27DyoMrbgIU7okhcvu3bVRPt2wKwnKL2aS9L53VLBjchCvm2QjQN9ucfo3IwjtvA8LFtT3xwyXhconc5PZNTkGi/lIAGlfMr9YnVaGOoRzZuxXf5t6SRokbeTOEYJU9/te26FfARsac7PDpD8biFWAqkeL+x5NC8E/FPpDFqGzMwhgMqklvBcvCMQuBIPW8X8djk2eIz/p93uITjMdq8WtA9ykzISs5BUquU+GGgTPoWBCNZv0nyf7eB+sz51vqclAJyle3NfA=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2019 02:41:51.3401 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1558616-a491-42e4-9da2-08d73fcf969e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8SPR01MB0010
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2DgwLJCXbGTdeksmaGP+tN0dRypjhhWSxtmJqV+b9I=;
 b=EfOwJX/0utets6xELeKyd2pnpsM9ZSFppdzrPVurmLW9D6oH2i6P7a5OI8QnMnMctbw4+I2q1J1c1W8pAWrqRDM3Cft8TMhv4/sgWNQv/7wwcSpTMM4DDA2uTps38aEyDQ6nAaK/feGXCcqswGVsCrTBDvoTRwHjNwE1LeT0cEY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2DgwLJCXbGTdeksmaGP+tN0dRypjhhWSxtmJqV+b9I=;
 b=EfOwJX/0utets6xELeKyd2pnpsM9ZSFppdzrPVurmLW9D6oH2i6P7a5OI8QnMnMctbw4+I2q1J1c1W8pAWrqRDM3Cft8TMhv4/sgWNQv/7wwcSpTMM4DDA2uTps38aEyDQ6nAaK/feGXCcqswGVsCrTBDvoTRwHjNwE1LeT0cEY=
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
Cc: "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjAsIDIwMTkgYXQgMDM6MTM6MDhQTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBObyBjaGFuZ2UgaW4gYmVoYXZpb3VyOyBJUlFfUkVUVkFMIGlzIGFib3V0IHR3
aWNlIGFzIHBvcHVsYXIgYXMKPiBtYW51YWxseSB3cml0aW5nIG91dCB0aGUgdGVybmFyeS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFybS5j
b20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9k
ZXYuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
ZDcxL2Q3MV9kZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3
MV9kZXYuYwo+IGluZGV4IGQ1NjdhYjdlZDMxNC4uMWI0MjA5NTk2OWU3IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYwo+IEBAIC0x
OTUsNyArMTk1LDcgQEAgZDcxX2lycV9oYW5kbGVyKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2LCBz
dHJ1Y3Qga29tZWRhX2V2ZW50cyAqZXZ0cykKPiAgCWlmIChnY3Vfc3RhdHVzICYgR0xCX0lSUV9T
VEFUVVNfUElQRTEpCj4gIAkJZXZ0cy0+cGlwZXNbMV0gfD0gZ2V0X3BpcGVsaW5lX2V2ZW50KGQ3
MS0+cGlwZXNbMV0sIGdjdV9zdGF0dXMpOwo+ICAKPiAtCXJldHVybiBnY3Vfc3RhdHVzID8gSVJR
X0hBTkRMRUQgOiBJUlFfTk9ORTsKPiArCXJldHVybiBJUlFfUkVUVkFMKGdjdV9zdGF0dXMpOwoK
SGkgTWloYWlsOgoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpSZXZpZXdlZC1ieTogSmFtZXMg
UWlhbiBXYW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29t
PgoKPiAgfQo+ICAKPiAgI2RlZmluZSBFTkFCTEVEX0dDVV9JUlFTCShHQ1VfSVJRX0NWQUwwIHwg
R0NVX0lSUV9DVkFMMSB8IFwKPiAtLSAKPiAyLjIzLjAKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
