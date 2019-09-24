Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A63BCC56
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C7489CDB;
	Tue, 24 Sep 2019 16:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00041.outbound.protection.outlook.com [40.107.0.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0215E89CDB
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 16:22:35 +0000 (UTC)
Received: from DB6PR0801CA0047.eurprd08.prod.outlook.com (2603:10a6:4:2b::15)
 by DB8PR08MB4059.eurprd08.prod.outlook.com (2603:10a6:10:a9::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20; Tue, 24 Sep
 2019 16:22:32 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::200) by DB6PR0801CA0047.outlook.office365.com
 (2603:10a6:4:2b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.20 via Frontend
 Transport; Tue, 24 Sep 2019 16:22:32 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2284.20 via Frontend Transport; Tue, 24 Sep 2019 16:22:31 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Tue, 24 Sep 2019 16:22:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4b454cbef0f6f92a
X-CR-MTA-TID: 64aa7808
Received: from b305b4b39e61.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.0.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DAF65AD1-8B78-4CE5-96BC-85BD31B798EB.1; 
 Tue, 24 Sep 2019 16:22:20 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b305b4b39e61.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 24 Sep 2019 16:22:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSpibYBt8e+ZwFkFUPtzxlMv6T1g752EP+ck24Bi3BnfEpTU9PzZwqLTzGwI9hjU6g/V65616WKF6DFlzPhR4tLXOmA2fzI4TIVUW4aKe2WsLbz3q2y+bAUoNb28FvNzUuvtF1FVLuNeWJOzBTGLpCwzEGaNXVVT1Oi9eu0beZBpbsxoaCjWyMPv3AYXMBv1gWb4rcyduHHqOkrpFquldJUYm6A6kfCY2K/BMRnEMcggQ7waO0PVA66H9+vOusOcxbb2mGPOZ9QW0A1xBUdw14Vf2/3TB0cOD7BJW7+GMehJFdA7LtkGqfeQxFsrX2s2Q0RfHOnnszAD8nGha0DHYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOXRJknPluHn02sDXkhj0zC/r48jxe5T1U4QR0BlsiM=;
 b=JUM212AIBc9XiZ5Ao18cE8zZJljKoFEy8/FQvCtYL3De1yRbHPPNEttux5fhDKd/nEk5h+tQVCjS4XvMmzwgHbRZeUMeRzgZ6OWwADRVE/RB5XZV9g4pr/7GeAnY1QiP5u+C/fx17zIyGZT5M+Txmed5L2R2yzdpEYL/SCUPhFH8AqzIKbG5I7Jb5DFGeJMhV06HxC6L5ByUug1cLipDH+0g8uIzzDCUcNm6ZCgR5Bea3fgPWEugEqHOP0zsPrB8sE4plBSX9VhBSnghCzb/1UH1EWggR3ns490n2ypBNWxT+6/6+TR6aDemRDye/UBExjbCo5gmBFFYLdMdk9uf9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM7PR08MB5352.eurprd08.prod.outlook.com (10.141.172.139) by
 AM7PR08MB5495.eurprd08.prod.outlook.com (10.141.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Tue, 24 Sep 2019 16:22:18 +0000
Received: from AM7PR08MB5352.eurprd08.prod.outlook.com
 ([fe80::c81a:63b1:5826:cf74]) by AM7PR08MB5352.eurprd08.prod.outlook.com
 ([fe80::c81a:63b1:5826:cf74%2]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 16:22:18 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
Thread-Topic: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
Thread-Index: AQHVZOOF+0BJBq1hEUK86gknnLECMKczS0sAgAfTZIA=
Date: Tue, 24 Sep 2019 16:22:18 +0000
Message-ID: <20190924162217.GA12974@arm.com>
References: <20190906184712.91980-1-john.stultz@linaro.org>
 <CAO_48GFHx4uK6cWwJ4oGdJ8HNZNZYDzdD=yR3VK0EXQ86ya9-g@mail.gmail.com>
In-Reply-To: <CAO_48GFHx4uK6cWwJ4oGdJ8HNZNZYDzdD=yR3VK0EXQ86ya9-g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR0701CA0037.eurprd07.prod.outlook.com
 (2603:10a6:200:42::47) To AM7PR08MB5352.eurprd08.prod.outlook.com
 (2603:10a6:20b:106::11)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.54]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 08fa8cba-241a-424d-431a-08d7410b6685
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM7PR08MB5495; 
X-MS-TrafficTypeDiagnostic: AM7PR08MB5495:|AM7PR08MB5495:|DB8PR08MB4059:
X-MS-Exchange-PUrlCount: 3
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB405904F2F069AD30B11993BFE4840@DB8PR08MB4059.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 0170DAF08C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(199004)(189003)(102836004)(476003)(14444005)(256004)(316002)(71200400001)(6486002)(44832011)(305945005)(6916009)(2906002)(2616005)(486006)(11346002)(7416002)(6246003)(7736002)(4326008)(6116002)(1076003)(3846002)(71190400001)(66066001)(5660300002)(478600001)(446003)(81166006)(8676002)(64756008)(66446008)(81156014)(66476007)(6512007)(6306002)(52116002)(33656002)(25786009)(86362001)(36756003)(8936002)(66556008)(66946007)(6436002)(14454004)(966005)(26005)(99286004)(6506007)(76176011)(186003)(229853002)(386003)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM7PR08MB5495;
 H:AM7PR08MB5352.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: DMpcsOQIcs9vL8eos0uyNwu8vpvWWbJ5XS5Gtgin0yB7ULfH+x5xFtBPxaO57vGCnthb4C69F3hcFY0OIEjb3sKvx+dje9GeL5W8/wMpoxSHKo5YjTUxiLleEVC2G2e0HOvFdozBtPdPWcBvzYM99QBX7bdXoxLzbFZQOkAFUxFXuwg9Bko+oLUKJZuezTsE7Z3sdosyS82/+qcwyHQpA+Y0xa+vPQhpcPSl4hV+3WcI1edBL6NGrxii94SPRPmyuMg36YidzCaotPP1DBzNYvtd4SlkbtsORsUmSNrhAs3BFIyksTi3WmXawOckdI40xp32bJvqUgp/2ZLyU3g3RfDRKLUaolJx3RGIAMidJ/XfN4f50+/HXVWUXs5Rudm7Iu01+U3ktZ6VZ1wiRdOUfYu+WtuhMPE1Typ1b0bf38Oq7S6an8VE6Wjo9NGQpMhuA2oASzXYahTsl6ynBipzMQ==
Content-ID: <973560B28D0AFC44A283B782CB3534B6@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5495
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(396003)(346002)(199004)(189003)(436003)(446003)(2616005)(102836004)(478600001)(76130400001)(70586007)(76176011)(186003)(2486003)(23676004)(47776003)(25786009)(11346002)(4326008)(316002)(476003)(99286004)(6862004)(66066001)(126002)(63350400001)(26005)(386003)(6506007)(54906003)(33656002)(5660300002)(229853002)(8936002)(966005)(14444005)(356004)(6116002)(3846002)(14454004)(70206006)(486006)(22756006)(50466002)(1076003)(8676002)(336012)(81156014)(6512007)(26826003)(2906002)(6306002)(305945005)(7736002)(81166006)(86362001)(6246003)(36756003)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB4059;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3c2acb74-25d2-4090-3237-08d7410b5e62
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DB8PR08MB4059; 
NoDisclaimer: True
X-Forefront-PRVS: 0170DAF08C
X-Microsoft-Antispam-Message-Info: qE5o8s+0pY+aTOBpxbea5hZuBlaynGhybgEl9I1F4Hi//OkVh6hyqP4xvhJcdsR6iLKC1gvI36j7v32wqHS2chlGSNglCBPzvkkgCIX5EvkWi9+/OjYLf6Vlcu92eA61feta7pKLt6apiTytJeZrm044m4/tyRgWMThpJ8LKugPwjvX51DBQVIHTnEhzQPJ96kLUG2MAYhP/AcbkOAnr4FrrlWNhftUs/K/kGpUsmJ8Ou+AhwqUOEyUEqr7WBdq1/vPbX8y24dBH5gYhHN76EauJguf55P+ctPC9bGc7GPrFbfEc528SNqoKQwxMVOQfq1Agr53QviWsRQ5OqoCcI13rWMskXZ+6bvXwy1veOu22TC8ByFV3ftsie2M4t28kdQpDuq48F1ilKNQR0r72M7k+hF72FTtrwPk/BfL7ZLI=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2019 16:22:31.6017 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08fa8cba-241a-424d-431a-08d7410b6685
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4059
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOXRJknPluHn02sDXkhj0zC/r48jxe5T1U4QR0BlsiM=;
 b=jqMEabtzsx5LLxqWbCHahBWjAiqgZfkS+BH1rCwXCbn4OcbFZMj3Ez2NSZnbyOGZhC6iB1XtFrcdGYdJUyMEWw90qcG/yXDEjy5iMGWDd9X06mNI4VXAL6O35UJxd8IVGJOjUhFA5tqSa/NjC2LFZwrDXOy1V17z0kY9T5In7u8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOXRJknPluHn02sDXkhj0zC/r48jxe5T1U4QR0BlsiM=;
 b=jqMEabtzsx5LLxqWbCHahBWjAiqgZfkS+BH1rCwXCbn4OcbFZMj3Ez2NSZnbyOGZhC6iB1XtFrcdGYdJUyMEWw90qcG/yXDEjy5iMGWDd9X06mNI4VXAL6O35UJxd8IVGJOjUhFA5tqSa/NjC2LFZwrDXOy1V17z0kY9T5In7u8=
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
Cc: nd <nd@arm.com>, Alistair Strachan <astrachan@google.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F . Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgMTA6MjE6NTJQTSArMDUzMCwgU3VtaXQgU2Vtd2FsIHdy
b3RlOg0KPiBIZWxsbyBDaHJpc3RvcGgsIGV2ZXJ5b25lLA0KPiANCj4gT24gU2F0LCA3IFNlcCAy
MDE5IGF0IDAwOjE3LCBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4gd3JvdGU6
DQo+ID4NCj4gPiBIZXJlIGlzIHlldCBhbm90aGVyIHBhc3MgYXQgdGhlIGRtYS1idWYgaGVhcHMg
cGF0Y2hzZXQgQW5kcmV3DQo+ID4gYW5kIEkgaGF2ZSBiZWVuIHdvcmtpbmcgb24gd2hpY2ggdHJp
ZXMgdG8gZGVzdGFnZSBhIGZhaXIgY2h1bmsNCj4gPiBvZiBJT04gZnVuY3Rpb25hbGl0eS4NCj4g
Pg0KPiA+IFRoZSBwYXRjaHNldCBpbXBsZW1lbnRzIHBlci1oZWFwIGRldmljZXMgd2hpY2ggY2Fu
IGJlIG9wZW5lZA0KPiA+IGRpcmVjdGx5IGFuZCB0aGVuIGFuIGlvY3RsIGlzIHVzZWQgdG8gYWxs
b2NhdGUgYSBkbWFidWYgZnJvbSB0aGUNCj4gPiBoZWFwLg0KPiA+DQo+ID4gVGhlIGludGVyZmFj
ZSBpcyBzaW1pbGFyLCBidXQgbXVjaCBzaW1wbGVyIHRoZW4gSU9Ocywgb25seQ0KPiA+IHByb3Zp
ZGluZyBhbiBBTExPQyBpb2N0bC4NCj4gPg0KPiA+IEFsc28sIEkndmUgcHJvdmlkZWQgcmVsYXRp
dmVseSBzaW1wbGUgc3lzdGVtIGFuZCBjbWEgaGVhcHMuDQo+ID4NCj4gPiBJJ3ZlIGJvb3RlZCBh
bmQgdGVzdGVkIHRoZXNlIHBhdGNoZXMgd2l0aCBBT1NQIG9uIHRoZSBIaUtleTk2MA0KPiA+IHVz
aW5nIHRoZSBrZXJuZWwgdHJlZSBoZXJlOg0KPiA+ICAgaHR0cHM6Ly9naXQubGluYXJvLm9yZy9w
ZW9wbGUvam9obi5zdHVsdHovYW5kcm9pZC1kZXYuZ2l0L2xvZy8/aD1kZXYvZG1hLWJ1Zi1oZWFw
DQo+ID4NCj4gPiBBbmQgdGhlIHVzZXJzcGFjZSBjaGFuZ2VzIGhlcmU6DQo+ID4gICBodHRwczov
L2FuZHJvaWQtcmV2aWV3Lmdvb2dsZXNvdXJjZS5jb20vYy9kZXZpY2UvbGluYXJvL2hpa2V5Lysv
OTA5NDM2DQo+ID4NCj4gPiBDb21wYXJlZCB0byBJT04sIHRoaXMgcGF0Y2hzZXQgaXMgbWlzc2lu
ZyB0aGUgc3lzdGVtLWNvbnRpZywNCj4gPiBjYXJ2ZW91dCBhbmQgY2h1bmsgaGVhcHMsIGFzIEkg
ZG9uJ3QgaGF2ZSBhIGRldmljZSB0aGF0IHVzZXMNCj4gPiB0aG9zZSwgc28gSSdtIHVuYWJsZSB0
byBkbyBtdWNoIHVzZWZ1bCB2YWxpZGF0aW9uIHRoZXJlLg0KPiA+IEFkZGl0aW9uYWxseSB3ZSBo
YXZlIG5vIHVwc3RyZWFtIHVzZXJzIG9mIGNodW5rIG9yIGNhcnZlb3V0LA0KPiA+IGFuZCB0aGUg
c3lzdGVtLWNvbnRpZyBoYXMgYmVlbiBkZXByZWNhdGVkIGluIHRoZSBjb21tb24vYW5kb2lkLSoN
Cj4gPiBrZXJuZWxzLCBzbyB0aGlzIHNob3VsZCBiZSBvay4NCj4gPg0KPiA+IEkndmUgYWxzbyBy
ZW1vdmVkIHRoZSBzdGF0cyBhY2NvdW50aW5nLCBzaW5jZSBhbnkgc3VjaCBhY2NvdW50aW5nDQo+
ID4gc2hvdWxkIGJlIGltcGxlbWVudGVkIGJ5IGRtYS1idWYgY29yZSBvciB0aGUgaGVhcHMgdGhl
bXNlbHZlcy4NCj4gPg0KPiA+IE1vc3Qgb2YgdGhlIGNoYW5nZXMgaW4gdGhpcyByZXZpc2lvbiBh
cmUgYWRkZHJlc3NpbmcgdGhlIG1vcmUNCj4gPiBjb25jcmV0ZSBmZWVkYmFjayBmcm9tIENocmlz
dG9waCAobWFueSB0aGFua3MhKS4gVGhvdWdoIEknbSBub3QNCj4gPiBzdXJlIGlmIHNvbWUgb2Yg
dGhlIGxlc3Mgc3BlY2lmaWMgZmVlZGJhY2sgd2FzIGNvbXBsZXRlbHkgcmVzb2x2ZWQNCj4gPiBp
biBkaXNjdXNzaW9uIGxhc3QgdGltZSBhcm91bmQuIFBsZWFzZSBsZXQgbWUga25vdyENCj4gDQo+
IEl0IGxvb2tzIGxpa2UgbW9zdCBvZiB0aGUgZmVlZGJhY2sgaGFzIGJlZW4gdGFrZW4gY2FyZSBv
Zi4gSWYgdGhlcmUncw0KPiBubyBtb3JlIG9iamVjdGlvbiB0byB0aGlzIHNlcmllcywgSSdkIGxp
a2UgdG8gbWVyZ2UgaXQgaW4gc29vbi4NCj4gDQo+IElmIHRoZXJlIGFyZSBhbnkgbW9yZSByZXZp
ZXcgY29tbWVudHMsIG1heSBJIHJlcXVlc3QgeW91IHRvIHBsZWFzZSBwcm92aWRlIHRoZW0/DQoN
CkkgdGVzdGVkIHRoZXNlIHBhdGNoZXMgdXNpbmcgb3VyIGludGVybmFsIHRlc3Qgc3VpdGUgd2l0
aCBBcm0sa29tZWRhDQpkcml2ZXIgYW5kIHRoZSBmb2xsb3dpbmcgbm9kZSBpbiBkdHMNCg0KICAg
ICAgICByZXNlcnZlZC1tZW1vcnkgew0KICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0g
PDB4Mj47DQogICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MHgyPjsNCiAgICAgICAgICAg
ICAgICByYW5nZXM7DQoNCiAgICAgICAgICAgICAgICBmcmFtZWJ1ZmZlckA2MDAwMDAwMCB7DQog
ICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNoYXJlZC1kbWEtcG9vbCI7DQog
ICAgICAgICAgICAgICAgICAgICAgICBsaW51eCxjbWEtZGVmYXVsdDsNCiAgICAgICAgICAgICAg
ICAgICAgICAgIHJlZyA9IDwweDAgMHg2MDAwMDAwMCAweDAgMHg4MDAwMDAwPjsNCiAgICAgICAg
ICAgICAgICB9Ow0KICAgICAgICB9DQoNClRoZSB0ZXN0cyB3ZW50IGZpbmUuIE91ciB0ZXN0cyBh
bGxvY2F0ZXMgZnJhbWVidWZmZXJzIG9mIGRpZmZlcmVudA0Kc2l6ZXMsIHBvc3RzIHRoZW0gb24g
c2NyZWVuIGFuZCB0aGUgZHJpdmVyIHdyaXRlcyBiYWNrIHRvIG9uZSBvZiB0aGUNCmZyYW1lYnVm
ZmVycy4gSSBoYXZlbm90IHRlc3RlZCBmb3IgYW55IHBlcmZvcm1hbmNlLCBsYXRlbmN5IG9yDQpj
YWNoZSBtYW5hZ2VtZW50IHJlbGF0ZWQgc3R1ZmYuIFNvLCBpdCB0aGF0IGxvb2tzIGFwcHJvcHJp
YXRlLCBmZWVsDQpmcmVlIHRvIGFkZDotDQpUZXN0ZWQtYnk6LSBBeWFuIEt1bWFyIEhhbGRlciA8
YXlhbi5oYWxkZXJAYXJtLmNvbT4NCg0KQXJlIHlvdSBwbGFubmluZyB0byB3cml0ZSBzb21lIGln
dCB0ZXN0cyBmb3IgaXQgPw0KPiANCj4gPg0KPiA+IE5ldyBpbiB2ODoNCj4gPiAqIE1ha2Ugc3Ry
dWN0IGRtYV9oZWFwX29wcyBjb25zdHMgKFN1Z2dlc3RlZCBieSBDaHJpc3RvcGgpDQo+ID4gKiBB
ZGQgZmx1c2hfa2VybmVsX3ZtYXBfcmFuZ2UvaW52YWxpZGF0ZV9rZXJuZWxfdm1hcF9yYW5nZSBj
YWxscw0KPiA+ICAgKHN1Z2dlc3RlZCBieSBDaHJpc3RvcGgpDQo+ID4gKiBDb25kZW5zZSBkbWFf
aGVhcF9idWZmZXIgYW5kIGhlYXBfaGVscGVyX2J1ZmZlciAoc3VnZ2VzdGVkIGJ5DQo+ID4gICBD
aHJpc3RvcGgpDQo+ID4gKiBHZXQgcmlkIG9mIG5lZWRsZXNzIHN0cnVjdCBzeXN0ZW1faGVhcCAo
c3VnZ2VzdGVkIGJ5IENocmlzdG9waCkNCj4gPiAqIEZpeCBpbmRlbnRhdGlvbiBieSB1c2luZyBz
aG9ydGVyIGFyZ3VtZW50IG5hbWVzIChzdWdnZXN0ZWQgYnkNCj4gPiAgIENocmlzdG9waCkNCj4g
PiAqIFJlbW92ZSB1bnVzZWQgcHJpdmF0ZV9mbGFncyB2YWx1ZQ0KPiA+ICogQWRkIGZvcmdvdHRl
biBpbmNsdWRlIGZpbGUgdG8gZml4IGJ1aWxkIGlzc3VlIG9uIHg4Ng0KPiA+ICogQ2hlY2twYXRj
aCB3aGl0ZXNwYWNlIGZpeHVwcw0KPiA+DQo+ID4gVGhvdWdodHMgYW5kIGZlZWRiYWNrIHdvdWxk
IGJlIGdyZWF0bHkgYXBwcmVjaWF0ZWQhDQo+ID4NCj4gPiB0aGFua3MNCj4gPiAtam9obg0KPiBC
ZXN0LA0KPiBTdW1pdC4NCj4gPg0KPiA+IENjOiBMYXVyYSBBYmJvdHQgPGxhYmJvdHRAcmVkaGF0
LmNvbT4NCj4gPiBDYzogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFy
by5vcmc+DQo+ID4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+DQo+
ID4gQ2M6IExpYW0gTWFyayA8bG1hcmtAY29kZWF1cm9yYS5vcmc+DQo+ID4gQ2M6IFByYXRpayBQ
YXRlbCA8cHJhdGlrcEBjb2RlYXVyb3JhLm9yZz4NCj4gPiBDYzogQnJpYW4gU3RhcmtleSA8QnJp
YW4uU3RhcmtleUBhcm0uY29tPg0KPiA+IENjOiBWaW5jZW50IERvbm5lZm9ydCA8VmluY2VudC5E
b25uZWZvcnRAYXJtLmNvbT4NCj4gPiBDYzogU3VkaXB0byBQYXVsIDxTdWRpcHRvLlBhdWxAYXJt
LmNvbT4NCj4gPiBDYzogQW5kcmV3IEYuIERhdmlzIDxhZmRAdGkuY29tPg0KPiA+IENjOiBDaHJp
c3RvcGggSGVsbHdpZyA8aGNoQGluZnJhZGVhZC5vcmc+DQo+ID4gQ2M6IENoZW5ibyBGZW5nIDxm
ZW5nY0Bnb29nbGUuY29tPg0KPiA+IENjOiBBbGlzdGFpciBTdHJhY2hhbiA8YXN0cmFjaGFuQGdv
b2dsZS5jb20+DQo+ID4gQ2M6IEhyaWR5YSBWYWxzYXJhanUgPGhyaWR5YUBnb29nbGUuY29tPg0K
PiA+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4NCj4gPg0KPiA+IEFu
ZHJldyBGLiBEYXZpcyAoMSk6DQo+ID4gICBkbWEtYnVmOiBBZGQgZG1hLWJ1ZiBoZWFwcyBmcmFt
ZXdvcmsNCj4gPg0KPiA+IEpvaG4gU3R1bHR6ICg0KToNCj4gPiAgIGRtYS1idWY6IGhlYXBzOiBB
ZGQgaGVhcCBoZWxwZXJzDQo+ID4gICBkbWEtYnVmOiBoZWFwczogQWRkIHN5c3RlbSBoZWFwIHRv
IGRtYWJ1ZiBoZWFwcw0KPiA+ICAgZG1hLWJ1ZjogaGVhcHM6IEFkZCBDTUEgaGVhcCB0byBkbWFi
dWYgaGVhcHMNCj4gPiAgIGtzZWxmdGVzdHM6IEFkZCBkbWEtaGVhcCB0ZXN0DQo+ID4NCj4gPiAg
TUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDE4ICsrDQo+
ID4gIGRyaXZlcnMvZG1hLWJ1Zi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICB8ICAxMSAr
DQo+ID4gIGRyaXZlcnMvZG1hLWJ1Zi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICB8ICAg
MiArDQo+ID4gIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtaGVhcC5jICAgICAgICAgICAgICAgICAgICB8
IDI1MCArKysrKysrKysrKysrKysrDQo+ID4gIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9LY29uZmln
ICAgICAgICAgICAgICAgICB8ICAxNCArDQo+ID4gIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9NYWtl
ZmlsZSAgICAgICAgICAgICAgICB8ICAgNCArDQo+ID4gIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9j
bWFfaGVhcC5jICAgICAgICAgICAgICB8IDE2NCArKysrKysrKysrKw0KPiA+ICBkcml2ZXJzL2Rt
YS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmMgICAgICAgICAgfCAyNjkgKysrKysrKysrKysrKysr
KysrDQo+ID4gIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9oZWFwLWhlbHBlcnMuaCAgICAgICAgICB8
ICA1NSArKysrDQo+ID4gIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jICAgICAg
ICAgICB8IDEyMiArKysrKysrKw0KPiA+ICBpbmNsdWRlL2xpbnV4L2RtYS1oZWFwLmggICAgICAg
ICAgICAgICAgICAgICAgfCAgNTkgKysrKw0KPiA+ICBpbmNsdWRlL3VhcGkvbGludXgvZG1hLWhl
YXAuaCAgICAgICAgICAgICAgICAgfCAgNTUgKysrKw0KPiA+ICB0b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9kbWFidWYtaGVhcHMvTWFrZWZpbGUgfCAgIDkgKw0KPiA+ICAuLi4vc2VsZnRlc3RzL2Rt
YWJ1Zi1oZWFwcy9kbWFidWYtaGVhcC5jICAgICAgfCAyMzAgKysrKysrKysrKysrKysrDQo+ID4g
IDE0IGZpbGVzIGNoYW5nZWQsIDEyNjIgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9kbWEtYnVmL2RtYS1oZWFwLmMNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9LY29uZmlnDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2RtYS1idWYvaGVhcHMvTWFrZWZpbGUNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZG1hLWJ1Zi9oZWFwcy9jbWFfaGVhcC5jDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2RtYS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmMNCj4gPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9oZWFwLWhlbHBlcnMuaA0KPiA+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9kbWEtYnVmL2hlYXBzL3N5c3RlbV9oZWFwLmMNCj4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvZG1hLWhlYXAuaA0KPiA+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgaW5jbHVkZS91YXBpL2xpbnV4L2RtYS1oZWFwLmgNCj4gPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2RtYWJ1Zi1oZWFwcy9NYWtlZmlsZQ0KPiA+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZG1hYnVmLWhlYXBzL2Rt
YWJ1Zi1oZWFwLmMNCj4gPg0KPiA+IC0tDQo+ID4gMi4xNy4xDQo+ID4NCj4gDQo+IA0KPiAtLSAN
Cj4gVGhhbmtzIGFuZCByZWdhcmRzLA0KPiANCj4gU3VtaXQgU2Vtd2FsDQo+IExpbmFybyBDb25z
dW1lciBHcm91cCAtIEtlcm5lbCBUZWFtIExlYWQNCj4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3Vy
Y2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
