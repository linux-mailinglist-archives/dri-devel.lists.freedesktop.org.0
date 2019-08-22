Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C725990D8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 12:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C399289349;
	Thu, 22 Aug 2019 10:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20053.outbound.protection.outlook.com [40.107.2.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F9489349
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 10:30:39 +0000 (UTC)
Received: from VI1PR08CA0174.eurprd08.prod.outlook.com (10.175.227.28) by
 HE1PR0801MB1850.eurprd08.prod.outlook.com (10.168.149.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Thu, 22 Aug 2019 10:30:34 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::208) by VI1PR08CA0174.outlook.office365.com
 (2603:10a6:800:d1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.15 via Frontend
 Transport; Thu, 22 Aug 2019 10:30:34 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.13 via Frontend Transport; Thu, 22 Aug 2019 10:30:32 +0000
Received: ("Tessian outbound cc8a947d4660:v26");
 Thu, 22 Aug 2019 10:30:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 63311a90e55a20b4
X-CR-MTA-TID: 64aa7808
Received: from 6dcade16447e.2 (cr-mta-lb-1.cr-mta-net [104.47.5.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 11F24F8A-6648-4A99-9531-716E11F69783.1; 
 Thu, 22 Aug 2019 10:30:23 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2052.outbound.protection.outlook.com [104.47.5.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6dcade16447e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 22 Aug 2019 10:30:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOsW8OPrZfEJDnnRzTqgLgiB4BKOGpQBKSrtL84YH3G39TlESIJmXggXKeKthUNAYjWGNjC0/mPjTyyi4cxWHpNRl8u3hrpB46JIgXjYqnyOaeuU2MHRxpAYOYfwMnys7pK+0iVPWOnlEPtBi/z/Yolv2PFOTyuxmcQPB9bpxAe9JE8ydhUBhwz2MG4oTuF8jCTjdpzfJCdCl966lC6MO9yPbkGBP1z3LNOTKCHqmnS2LRUxCg58hjzmzutv1JZ8uNU3CkFPDInAuaBUj3TaqcltJYkLK3vuKknP0THoQyOWei0yZuquqgjW56ipycTe3dMcd0cXICYVWXfe9Qd8jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7znNrORe7K2E4g8Ak/f67K9czZCH920lpE4LgQYYC0=;
 b=bt/t9ZEKu3ExGENn/a6lq3PIW/dhPFfg8tPPg5W9HV1sbKjcGsg4pdqiP6VV9eEDNvxNyxQy0biPoJhW2c9pBiR4izq9bBP3YwItexTAnZLffAp39IceQnUIUUgHK0EzV/mmN1sI4DEVTf0Guo+JqW7GcE6AHXx8kmEx0sgmMuEHhYzWwV9MV50FtnVYRm9+VpgKgrOLISGW+v687Wtl+p3zXxlV1wHshkF97doepx3hYYRCdYm8OEwcPgj3zEeBvVgnGnoMH8f/y7z2nlgLI9tB9gX9ZQ9CJ6SEDdyfFsPunY8pGUI3XON9CknBwKwXzGxAF+PQYFaNodl9Cthu6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com (52.132.212.135) by
 AM0PR08MB5106.eurprd08.prod.outlook.com (10.255.30.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Thu, 22 Aug 2019 10:30:19 +0000
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::7532:a9e4:63b6:6a55]) by AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::7532:a9e4:63b6:6a55%4]) with mapi id 15.20.2178.020; Thu, 22 Aug 2019
 10:30:19 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH] drm/komeda: Fix warning -Wunused-but-set-variable
Thread-Topic: [PATCH] drm/komeda: Fix warning -Wunused-but-set-variable
Thread-Index: AQHVUQBlSm03MEg+uUyspl7GAMnBG6cHBy4A
Date: Thu, 22 Aug 2019 10:30:18 +0000
Message-ID: <20190822103018.GB29026@arm.com>
References: <20190812112322.15990-1-james.qian.wang@arm.com>
In-Reply-To: <20190812112322.15990-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0003.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::15) To AM0PR08MB5345.eurprd08.prod.outlook.com
 (2603:10a6:208:17f::7)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.54]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 161b78d6-7929-4a3a-c8a3-08d726ebc327
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR08MB5106; 
X-MS-TrafficTypeDiagnostic: AM0PR08MB5106:|HE1PR0801MB1850:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0801MB1850704A7890183141A0435CE4A50@HE1PR0801MB1850.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1247;OLM:1247;
x-forefront-prvs: 01371B902F
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(189003)(199004)(102836004)(76176011)(71190400001)(71200400001)(446003)(11346002)(2616005)(81156014)(66066001)(81166006)(99286004)(2906002)(486006)(86362001)(52116002)(256004)(33656002)(8936002)(14444005)(476003)(44832011)(478600001)(316002)(7736002)(6116002)(3846002)(305945005)(6486002)(5660300002)(229853002)(64756008)(66556008)(66446008)(66946007)(66476007)(6436002)(6636002)(36756003)(37006003)(54906003)(14454004)(6512007)(25786009)(186003)(4326008)(26005)(6862004)(53936002)(6246003)(386003)(6506007)(1076003)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB5106;
 H:AM0PR08MB5345.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 598MGX8akVcSkQYkFFySblHALcL3gFAUwR+2od7x25OQbfMsVUMDkwrsEOOS0M7eLe5+q4RCwVBjJlKUEcJoPqSPru9jdHq3RdZ9TrYyg45tueSLAx2sdOloesK33Cz967bfgeuSidSarTRnJXmowwqE3Ie13EhkiAuJEQuBYEw+1rk0+d49KU9XJj1KkoYFj/xeCfbboX/KzJpFwMZ80oI3+BBUCXKKLvDH3xAMvjZ3iiWUtYZPSJqTwsaiOJ+5lPkH3d2W99ORPe7wOMNDBadEJKzGnqtigrJg01OkNmG6nHqxi1l1kBtbi4pe2eFQu2CL6Cf6PtJjRyJvjglpM7pnwrLl4stkhwQsdZETVgfyn9JsONBUOdRDlx++K08avU8Bs+QLUD5ROGspi5qzgw1Uz9Vp3iKgWZ5rnHkKbr8=
Content-ID: <C258CA59D2A19B41A9E74A3DC9736233@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5106
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(376002)(39860400002)(2980300002)(189003)(199004)(6486002)(33656002)(5660300002)(6862004)(76130400001)(6512007)(7736002)(305945005)(6246003)(1076003)(86362001)(6506007)(386003)(22756006)(102836004)(26005)(476003)(436003)(63350400001)(486006)(11346002)(186003)(336012)(2616005)(63370400001)(70206006)(126002)(70586007)(446003)(356004)(229853002)(76176011)(6636002)(2486003)(316002)(4326008)(8676002)(25786009)(37006003)(36756003)(81156014)(81166006)(26826003)(99286004)(23676004)(3846002)(14454004)(66066001)(47776003)(50466002)(478600001)(14444005)(2906002)(6116002)(8936002)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0801MB1850;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 02b1fb97-79a5-4b84-d73c-08d726ebbaa7
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(710020)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:HE1PR0801MB1850; 
NoDisclaimer: True
X-Forefront-PRVS: 01371B902F
X-Microsoft-Antispam-Message-Info: 8RIMbudqH5UT3HpEI4zJyRdwA3dG+cnRtihOFQmXU6VF5AePh++x53cTyKA6PfGzMjEdPM4cBGpM7bZGy7y3BTa8FiN+N7W/ZdmTc8LaRdPdPxzMujsrhs5xxr4l2OLtTQ7KGqPsDXN+qE1seh0h2wVfBdAZ0WvYDg6aItQqAYjkBSbFyU2DzXY5Gj6oR0Hh5vl5gTr4nQO+miqfaOcybAUhCNyIhl7WmCXoz21w16s6vmRf1X1uT4Kofl5J/SEBYYHzv45wn8H7s73/P7JTzK/p0tTIpxUHl54O3mW0l0Jm13EpjDfuet2KCLUCa8z/sJON8OkjhGOzLZZ+DWxBk3UIStrWDJx7nChpySpEvZO4l6n9QP9feTMkUvfmtGOLxDHJBUxxxTmHY/biW7p8Xa6Af9QC0VZ9z5ZixlDxsLs=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2019 10:30:32.8998 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 161b78d6-7929-4a3a-c8a3-08d726ebc327
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1850
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7znNrORe7K2E4g8Ak/f67K9czZCH920lpE4LgQYYC0=;
 b=v07kl0fRJDC8jMyY9o/dp4RwSEAIb5jwzd/PhSRepoTBCIjVJFgjdZoErPQjPszTtWrVA9fnNmLXpjK7Zwxo33uyTOkibDGdGuTz0nwXrCnL73n4nn94vh0yvLICh0yQ4PEzJPfLqsrLOro5U6SR6tQiQoN9yLFI9oQYxzQVvYM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7znNrORe7K2E4g8Ak/f67K9czZCH920lpE4LgQYYC0=;
 b=v07kl0fRJDC8jMyY9o/dp4RwSEAIb5jwzd/PhSRepoTBCIjVJFgjdZoErPQjPszTtWrVA9fnNmLXpjK7Zwxo33uyTOkibDGdGuTz0nwXrCnL73n4nn94vh0yvLICh0yQ4PEzJPfLqsrLOro5U6SR6tQiQoN9yLFI9oQYxzQVvYM=
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
Cc: nd <nd@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin
 \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>, Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMTE6MjM6NDFBTSArMDAwMCwgamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6DQo+IEZpeGVkIHR3byAtV3VudXNlZC1idXQt
c2V0LXZhcmlhYmxlIHdhcm5pbmdzOg0KPiANCj4gL2FybS9saW51eC9kaXNwbGF5L2Fvc3AtNC4x
NC1kcm0tbmV4dC9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMu
YzogSW4gZnVuY3Rpb24g4oCYa29tZWRhX2NydGNfbm9ybWFsaXplX3pwb3PigJk6DQo+IC9hcm0v
bGludXgvZGlzcGxheS9hb3NwLTQuMTQtZHJtLW5leHQvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfa21zLmM6MTUwOjI2OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhmYuKA
mSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQ0KPiAgIHN0cnVj
dCBkcm1fZnJhbWVidWZmZXIgKmZiOw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+DQo+
IC9hcm0vbGludXgvZGlzcGxheS9hb3NwLTQuMTQtZHJtLW5leHQvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmM6IEluIGZ1bmN0aW9uIOKAmGtvbWVkYV9rbXNf
Y2hlY2vigJk6DQo+IC9hcm0vbGludXgvZGlzcGxheS9hb3NwLTQuMTQtZHJtLW5leHQvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmM6MjA5OjI1OiB3YXJuaW5n
OiB2YXJpYWJsZSDigJhvbGRfY3J0Y19zdOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1i
dXQtc2V0LXZhcmlhYmxlXQ0KPiAgIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqb2xkX2NydGNfc3Qs
ICpuZXdfY3J0Y19zdDsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+DQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5h
KSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMgfCA2ICsrLS0tLQ0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jDQo+IGluZGV4IGQ1MGU3NWYw
YjJiZC4uMWYwZTNmNGU4ZDc0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYw0KPiBAQCAtMTQ3LDcgKzE0Nyw2IEBAIHN0YXRpYyBp
bnQga29tZWRhX2NydGNfbm9ybWFsaXplX3pwb3Moc3RydWN0IGRybV9jcnRjICpjcnRjLA0KPiAg
CXN0cnVjdCBrb21lZGFfY3J0Y19zdGF0ZSAqa2NydGNfc3QgPSB0b19rY3J0Y19zdChjcnRjX3N0
KTsNCj4gIAlzdHJ1Y3Qga29tZWRhX3BsYW5lX3N0YXRlICprcGxhbmVfc3Q7DQo+ICAJc3RydWN0
IGRybV9wbGFuZV9zdGF0ZSAqcGxhbmVfc3Q7DQo+IC0Jc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAq
ZmI7DQo+ICAJc3RydWN0IGRybV9wbGFuZSAqcGxhbmU7DQo+ICAJc3RydWN0IGxpc3RfaGVhZCB6
b3JkZXJfbGlzdDsNCj4gIAlpbnQgb3JkZXIgPSAwLCBlcnI7DQo+IEBAIC0xNzMsNyArMTcyLDYg
QEAgc3RhdGljIGludCBrb21lZGFfY3J0Y19ub3JtYWxpemVfenBvcyhzdHJ1Y3QgZHJtX2NydGMg
KmNydGMsDQo+ICANCj4gIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KGtwbGFuZV9zdCwgJnpvcmRlcl9s
aXN0LCB6bGlzdF9ub2RlKSB7DQo+ICAJCXBsYW5lX3N0ID0gJmtwbGFuZV9zdC0+YmFzZTsNCj4g
LQkJZmIgPSBwbGFuZV9zdC0+ZmI7DQo+ICAJCXBsYW5lID0gcGxhbmVfc3QtPnBsYW5lOw0KPiAg
DQo+ICAJCXBsYW5lX3N0LT5ub3JtYWxpemVkX3pwb3MgPSBvcmRlcisrOw0KPiBAQCAtMjA2LDcg
KzIwNCw3IEBAIHN0YXRpYyBpbnQga29tZWRhX2ttc19jaGVjayhzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LA0KPiAgCQkJICAgIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkNCj4gIHsNCj4g
IAlzdHJ1Y3QgZHJtX2NydGMgKmNydGM7DQo+IC0Jc3RydWN0IGRybV9jcnRjX3N0YXRlICpvbGRf
Y3J0Y19zdCwgKm5ld19jcnRjX3N0Ow0KPiArCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqbmV3X2Ny
dGNfc3Q7DQo+ICAJaW50IGksIGVycjsNCj4gIA0KPiAgCWVyciA9IGRybV9hdG9taWNfaGVscGVy
X2NoZWNrX21vZGVzZXQoZGV2LCBzdGF0ZSk7DQo+IEBAIC0yMTcsNyArMjE1LDcgQEAgc3RhdGlj
IGludCBrb21lZGFfa21zX2NoZWNrKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ICAJICogc28g
bmVlZCB0byBhZGQgYWxsIGFmZmVjdGVkX3BsYW5lcyAoZXZlbiB1bmNoYW5nZWQpIHRvDQo+ICAJ
ICogZHJtX2F0b21pY19zdGF0ZS4NCj4gIAkgKi8NCj4gLQlmb3JfZWFjaF9vbGRuZXdfY3J0Y19p
bl9zdGF0ZShzdGF0ZSwgY3J0Yywgb2xkX2NydGNfc3QsIG5ld19jcnRjX3N0LCBpKSB7DQo+ICsJ
Zm9yX2VhY2hfbmV3X2NydGNfaW5fc3RhdGUoc3RhdGUsIGNydGMsIG5ld19jcnRjX3N0LCBpKSB7
DQo+ICAJCWVyciA9IGRybV9hdG9taWNfYWRkX2FmZmVjdGVkX3BsYW5lcyhzdGF0ZSwgY3J0Yyk7
DQo+ICAJCWlmIChlcnIpDQo+ICAJCQlyZXR1cm4gZXJyOw0KPiAtLSANCkxvb2tzIGdvb2QgdG8g
bWUuDQpSZXZpZXdlZC1ieTogQXlhbiBLdW1hciBIYWxkZXIgPGF5YW4uaGFsZGVyQGFybS5jb20+
DQoNCj4gMi4yMC4xDQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
