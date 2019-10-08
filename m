Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB002CF61B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 11:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85EDD89F6D;
	Tue,  8 Oct 2019 09:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70043.outbound.protection.outlook.com [40.107.7.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D1B89F6D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 09:35:32 +0000 (UTC)
Received: from AM6PR08CA0024.eurprd08.prod.outlook.com (2603:10a6:20b:b2::36)
 by VI1PR08MB3181.eurprd08.prod.outlook.com (2603:10a6:803:3f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.24; Tue, 8 Oct
 2019 09:35:26 +0000
Received: from AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::208) by AM6PR08CA0024.outlook.office365.com
 (2603:10a6:20b:b2::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2327.24 via Frontend
 Transport; Tue, 8 Oct 2019 09:35:26 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT017.mail.protection.outlook.com (10.152.16.89) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 8 Oct 2019 09:35:25 +0000
Received: ("Tessian outbound 6481c7fa5a3c:v33");
 Tue, 08 Oct 2019 09:35:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2bf21b3adae9510c
X-CR-MTA-TID: 64aa7808
Received: from 8e943aff869d.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.12.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4DF80D64-ACC6-46B0-885E-B32C09DD3D0A.1; 
 Tue, 08 Oct 2019 09:35:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e943aff869d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Oct 2019 09:35:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KS5YhvvqN1V6f6ZG7/W68zVYsdso1zNJ8YaTZTSYtryvpQMdk39681GFHz3x/5pztjNf0dKnwNul8ONRJp5cXdtJWtWjZBSn+FMRvYUDk/pXaAK1VFXpbMAeRjlDOXpIH1FXIkxExgbL9q6WHyt82TyG7SrW4ze3tAQZVhOjoZtA9ssg7kpMWpeNaEOH32Gn/jlTwI/qP2900rO5vIScd6RLwbrkBsBFy1fAZAlcgLGuoj8CdCf6N7AmpuAMuvmP8/fq/A5O2eJLSmG0zkmSyyv+d00Z5js6BYf+SaTauAxT3nPb3LC8bUJ6/7jeWe+aGwBQcjH/++88BWe8mIVeNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9L3+imPDX/KEb8UvgiO9nbSknawneWULxiBOKHuxxI=;
 b=T5sl8I+Q8vGyu5KGSSVGFOim51BTEVO15FA3E1+6m14WNZnGBKyqzBrp+Kaz9idt9z1ZtJy+dYLDkL6HOR5BNuY7VnDBHZgs00IKfrhoOXQeU0m4QMHyk83JPMEIv5TDy/LR0Vrk9GR7+tepVFCPQ65KTaoB91Q3XMskIdJ/U54yt6ILKF3CAxWgzfzO4damVxEoXGkHsvD6SirZ1gY3ZVUKzEEFz/PVNsDFXTSsW0mWBBjor11e4MDkwj/E2kcJ7pDimelcKRumrCSYowL1Zfupt6Tcy4++1qt3yNOyBLIj/6dUFkOkSnvWo07Hxw08W11ovjo8ynfoaKgVgUGUZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2941.eurprd08.prod.outlook.com (10.170.238.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.23; Tue, 8 Oct 2019 09:35:15 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2327.026; Tue, 8 Oct 2019
 09:35:15 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [PATCH] drm/komeda: Set output color depth for output
Thread-Topic: [PATCH] drm/komeda: Set output color depth for output
Thread-Index: AQHVfblD7I+ubO1huUCp0qQz7Z0Q4adQe+uA
Date: Tue, 8 Oct 2019 09:35:15 +0000
Message-ID: <3337512.00vBK9FLud@e123338-lin.cambridge.arm.com>
References: <20191008091734.19509-1-lowry.li@arm.com>
In-Reply-To: <20191008091734.19509-1-lowry.li@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.52]
x-clientproxiedby: LO2P265CA0204.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::24) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3fdcccb2-26ae-4211-c16b-08d74bd2d972
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB2941:|VI1PR08MB2941:|VI1PR08MB3181:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB31817F2C0DBC8E0F23DB52E88F9A0@VI1PR08MB3181.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:418;OLM:418;
x-forefront-prvs: 01842C458A
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(189003)(199004)(81166006)(6636002)(8676002)(3846002)(81156014)(8936002)(6862004)(71190400001)(2906002)(6246003)(14444005)(6116002)(66066001)(256004)(14454004)(6436002)(6486002)(25786009)(4326008)(229853002)(99286004)(478600001)(476003)(11346002)(446003)(71200400001)(386003)(486006)(6506007)(54906003)(102836004)(6512007)(86362001)(76176011)(52116002)(316002)(26005)(186003)(305945005)(7736002)(66476007)(66556008)(64756008)(66446008)(5660300002)(66946007)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2941;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: gvV6HRjzV03bNVTVKi8DPYM+pgOxIB9mp/qjBSu11TOKpyoC4SD+eizZW7A1kfKt24tQaLusWkqBoL68kXzuE/ylMBkfB6aQP9DXeHKVizZHiSztSLuVbsqO/mT7erzFltzcXw7enu9IxebzB6sNl5MQ9v5zBNB/iuhH1lQEGq+Ux0nKrx+rEFeetEQXksasPX5Xrgbt3Imm2btTE9avpj75t0XLEiJhWYU8stK5Jouo/qKcjv/TceZl9J9FgRTSakXOa2q8De3YnsuuKVrXAPTAsV2IR7+cw90zu6swhqZUdcEk/CGG9U9kJLEiMdEMYbh/0LUWbmptW4lmwUSuygUMzd9sOLWfcprKUY58eWT6142qjOOtu+IrMxvCCSBethlG/KTClfJE4G+cyyIxVZulPonzYuafJaZRutg3yak=
Content-ID: <9B7F00DD901F17478EF1242A28829348@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2941
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(189003)(199004)(6512007)(2906002)(476003)(99286004)(126002)(6862004)(26005)(486006)(478600001)(186003)(26826003)(97756001)(11346002)(6506007)(86362001)(14444005)(6636002)(66066001)(47776003)(46406003)(76130400001)(102836004)(446003)(63350400001)(6486002)(25786009)(229853002)(386003)(8746002)(76176011)(8936002)(22756006)(50466002)(8676002)(6116002)(4326008)(3846002)(356004)(54906003)(36906005)(81166006)(23726003)(70206006)(316002)(7736002)(305945005)(336012)(6246003)(14454004)(70586007)(5660300002)(81156014)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3181;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4c9b7b64-07e1-4684-0d6f-08d74bd2d2f8
NoDisclaimer: True
X-Forefront-PRVS: 01842C458A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NrCaOU5IMyUvPW7126lqLfuEoIO+16XmRNel0OwEV3lQJ+EeBJ7yFuAxGPlIDzA7kkB1lbBj8vfhDQCFB+uXfAa0kCqA4oIqSrS1iKLL0IW2LyqKbvHTZAvUoovr/5vimssfSLhoBUlxnJMfHydctl1fVXQmjfyn2R2TXKAmqEyjPOv/uP5d+BtiRBV4sPQlAKsQjY8di9UW4KxtdCiOWZ48yzOm8gTpbSW/uQrfyENu/GQSv1JIfT67U/hdOdMrsHBFD4VZrMdpXSigicMY1P16HXThuHwtvyqp58qUkN8iwUL6l6+9+h2gJDxn55/zGMmDmqIU6OZKL5bvusJ2N51o3OhAVMYsnhuYKj+ly260yOXveQeZupCMwnNizGip7YhCvRX9XlKpcWhxfQOEzS+J5R1+7cVgLgq8QNmJQtg=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2019 09:35:25.9025 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fdcccb2-26ae-4211-c16b-08d74bd2d972
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3181
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9L3+imPDX/KEb8UvgiO9nbSknawneWULxiBOKHuxxI=;
 b=Yh8IKFTNPMLRno9041t5d6DM/H7R+MsXh7zCqti1w9elL7/fXPdKtqxFIzJqKZDvvNTf7YZcZ9mM4Tk0hzEMdlYWHxLsmPRlKhTgbC1rf9LJFah7ydHCIDG1bhKQhN62hOAj4OJErhjIvYGl523QsIRHK8mzqq4kGGpj91IUvis=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9L3+imPDX/KEb8UvgiO9nbSknawneWULxiBOKHuxxI=;
 b=Yh8IKFTNPMLRno9041t5d6DM/H7R+MsXh7zCqti1w9elL7/fXPdKtqxFIzJqKZDvvNTf7YZcZ9mM4Tk0hzEMdlYWHxLsmPRlKhTgbC1rf9LJFah7ydHCIDG1bhKQhN62hOAj4OJErhjIvYGl523QsIRHK8mzqq4kGGpj91IUvis=
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

SGkgTG93cnksCgpPbiBUdWVzZGF5LCA4IE9jdG9iZXIgMjAxOSAxMDoxNzo1MiBCU1QgTG93cnkg
TGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBTZXQgY29sb3JfZGVwdGggYWNjb3Jk
aW5nIHRvIGNvbm5lY3Rvci0+YnBjLgo+IAo+IFNpZ25lZC1vZmYtYnk6IExvd3J5IExpIChBcm0g
VGVjaG5vbG9neSBDaGluYSkgPGxvd3J5LmxpQGFybS5jb20+Cj4gLS0tCj4gIC4uLi9hcm0vZGlz
cGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyAgICB8ICAxICsKPiAgLi4uL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgIHwgMjAgKysrKysrKysrKysrKysrKysr
Kwo+ICAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5oICAgfCAgMiAr
Kwo+ICAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCAgfCAgMSAr
Cj4gIC4uLi9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYyAgICB8IDE5ICsr
KysrKysrKysrKysrKysrKwo+ICAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25u
ZWN0b3IuYyAgfCAgNCArKysrCj4gIDYgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9k
NzFfY29tcG9uZW50LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9k
NzFfY29tcG9uZW50LmMKPiBpbmRleCBjM2QyOWMwYjA1MWIuLjI3Y2RiMDM1NzNjMSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9u
ZW50LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFf
Y29tcG9uZW50LmMKPiBAQCAtOTUxLDYgKzk1MSw3IEBAIHN0YXRpYyB2b2lkIGQ3MV9pbXByb2Nf
dXBkYXRlKHN0cnVjdCBrb21lZGFfY29tcG9uZW50ICpjLAo+ICAJCQkgICAgICAgdG9fZDcxX2lu
cHV0X2lkKHN0YXRlLCBpbmRleCkpOwo+ICAKPiAgCW1hbGlkcF93cml0ZTMyKHJlZywgQkxLX1NJ
WkUsIEhWX1NJWkUoc3QtPmhzaXplLCBzdC0+dnNpemUpKTsKPiArCW1hbGlkcF93cml0ZTMyKHJl
ZywgSVBTX0RFUFRILCBzdC0+Y29sb3JfZGVwdGgpOwo+ICB9Cj4gIAo+ICBzdGF0aWMgdm9pZCBk
NzFfaW1wcm9jX2R1bXAoc3RydWN0IGtvbWVkYV9jb21wb25lbnQgKmMsIHN0cnVjdCBzZXFfZmls
ZSAqc2YpCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2NydGMuYwo+IGluZGV4IDc1MjYzZDhjZDBiZC4uYmFhOTg2YjcwODc2IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+IEBAIC0x
Nyw2ICsxNywyNiBAQAo+ICAjaW5jbHVkZSAia29tZWRhX2Rldi5oIgo+ICAjaW5jbHVkZSAia29t
ZWRhX2ttcy5oIgo+ICAKPiArdm9pZCBrb21lZGFfY3J0Y19nZXRfY29sb3JfY29uZmlnKHN0cnVj
dCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdCwKPiArCQkJCSAgdTMyICpjb2xvcl9kZXB0aHMpCj4g
K3sKPiArCXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uOwo+ICsJc3RydWN0IGRybV9jb25uZWN0
b3Jfc3RhdGUgKmNvbm5fc3Q7Cj4gKwlpbnQgaSwgbWluX2JwYyA9IDMxLCBjb25uX2JwYyA9IDA7
Cj4gKwo+ICsJZm9yX2VhY2hfbmV3X2Nvbm5lY3Rvcl9pbl9zdGF0ZShjcnRjX3N0LT5zdGF0ZSwg
Y29ubiwgY29ubl9zdCwgaSkgewo+ICsJCWlmIChjb25uX3N0LT5jcnRjICE9IGNydGNfc3QtPmNy
dGMpCj4gKwkJCWNvbnRpbnVlOwo+ICsKPiArCQljb25uX2JwYyA9IGNvbm4tPmRpc3BsYXlfaW5m
by5icGMgPyBjb25uLT5kaXNwbGF5X2luZm8uYnBjIDogODsKPiArCj4gKwkJaWYgKGNvbm5fYnBj
IDwgbWluX2JwYykKPiArCQkJbWluX2JwYyA9IGNvbm5fYnBjOwpTb21ldGhpbmcgZG9lc24ndCBh
ZGQgdXAgaGVyZS4gbWluX2JwYyBpcyBlZmZlY3RpdmVseSBzZXQgYnV0IG5vdCB1c2VkLgo+ICsJ
fQo+ICsKPiArCSpjb2xvcl9kZXB0aHMgPSBHRU5NQVNLKGNvbm5fYnBjLCAwKTsKPiArfQo+ICsK
PiAgc3RhdGljIHZvaWQga29tZWRhX2NydGNfdXBkYXRlX2Nsb2NrX3JhdGlvKHN0cnVjdCBrb21l
ZGFfY3J0Y19zdGF0ZSAqa2NydGNfc3QpCj4gIHsKPiAgCXU2NCBweGxjbGssIGFjbGs7Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5o
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgKPiBpbmRl
eCA0NWM0OThlMTVlN2EuLmE0MjUwMzQ1MWI1ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5oCj4gQEAgLTE2Niw2ICsxNjYsOCBAQCBz
dGF0aWMgaW5saW5lIGJvb2wgaGFzX2ZsaXBfaCh1MzIgcm90KQo+ICAJCXJldHVybiAhIShyb3Rh
dGlvbiAmIERSTV9NT0RFX1JFRkxFQ1RfWCk7Cj4gIH0KPiAgCj4gK3ZvaWQga29tZWRhX2NydGNf
Z2V0X2NvbG9yX2NvbmZpZyhzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3QsCj4gKwkJCQkg
IHUzMiAqY29sb3JfZGVwdGhzKTsKPiAgdW5zaWduZWQgbG9uZyBrb21lZGFfY3J0Y19nZXRfYWNs
ayhzdHJ1Y3Qga29tZWRhX2NydGNfc3RhdGUgKmtjcnRjX3N0KTsKPiAgCj4gIGludCBrb21lZGFf
a21zX3NldHVwX2NydGNzKHN0cnVjdCBrb21lZGFfa21zX2RldiAqa21zLCBzdHJ1Y3Qga29tZWRh
X2RldiAqbWRldik7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX3BpcGVsaW5lLmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9waXBlbGluZS5oCj4gaW5kZXggYjMyMmY1MmJhOGYyLi43NjUzZjEzNGE4ZWIg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
cGlwZWxpbmUuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX3BpcGVsaW5lLmgKPiBAQCAtMzIzLDYgKzMyMyw3IEBAIHN0cnVjdCBrb21lZGFfaW1wcm9j
IHsKPiAgCj4gIHN0cnVjdCBrb21lZGFfaW1wcm9jX3N0YXRlIHsKPiAgCXN0cnVjdCBrb21lZGFf
Y29tcG9uZW50X3N0YXRlIGJhc2U7Cj4gKwl1OCBjb2xvcl9kZXB0aDsKPiAgCXUxNiBoc2l6ZSwg
dnNpemU7Cj4gIH07Cj4gIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYwo+IGluZGV4IDBiYTljNmFhMzcw
OC4uZTY4ZThmODVhYjI3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jCj4gQEAgLTc0Myw2ICs3
NDMsNyBAQCBrb21lZGFfaW1wcm9jX3ZhbGlkYXRlKHN0cnVjdCBrb21lZGFfaW1wcm9jICppbXBy
b2MsCj4gIAkJICAgICAgIHN0cnVjdCBrb21lZGFfZGF0YV9mbG93X2NmZyAqZGZsb3cpCj4gIHsK
PiAgCXN0cnVjdCBkcm1fY3J0YyAqY3J0YyA9IGtjcnRjX3N0LT5iYXNlLmNydGM7Cj4gKwlzdHJ1
Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3QgPSAma2NydGNfc3QtPmJhc2U7Cj4gIAlzdHJ1Y3Qg
a29tZWRhX2NvbXBvbmVudF9zdGF0ZSAqY19zdDsKPiAgCXN0cnVjdCBrb21lZGFfaW1wcm9jX3N0
YXRlICpzdDsKPiAgCj4gQEAgLTc1Niw2ICs3NTcsMjQgQEAga29tZWRhX2ltcHJvY192YWxpZGF0
ZShzdHJ1Y3Qga29tZWRhX2ltcHJvYyAqaW1wcm9jLAo+ICAJc3QtPmhzaXplID0gZGZsb3ctPmlu
X3c7Cj4gIAlzdC0+dnNpemUgPSBkZmxvdy0+aW5faDsKPiAgCj4gKwlpZiAoZHJtX2F0b21pY19j
cnRjX25lZWRzX21vZGVzZXQoY3J0Y19zdCkpIHsKPiArCQl1MzIgb3V0cHV0X2RlcHRoczsKPiAr
CQl1MzIgYXZhaWxfZGVwdGhzOwo+ICsKPiArCQlrb21lZGFfY3J0Y19nZXRfY29sb3JfY29uZmln
KGNydGNfc3QsCj4gKwkJCQkJICAgICAmb3V0cHV0X2RlcHRocyk7Cj4gKwo+ICsJCWF2YWlsX2Rl
cHRocyA9IG91dHB1dF9kZXB0aHMgJiBpbXByb2MtPnN1cHBvcnRlZF9jb2xvcl9kZXB0aHM7Cj4g
KwkJaWYgKGF2YWlsX2RlcHRocyA9PSAwKSB7Cj4gKwkJCURSTV9ERUJVR19BVE9NSUMoIk5vIGF2
YWlsYWJsZSBjb2xvciBkZXB0aHMsIGNvbm4gZGVwdGhzOiAweCV4ICYgZGlzcGxheTogMHgleFxu
IiwKPiArCQkJCQkgb3V0cHV0X2RlcHRocywKPiArCQkJCQkgaW1wcm9jLT5zdXBwb3J0ZWRfY29s
b3JfZGVwdGhzKTsKPiArCQkJcmV0dXJuIC1FSU5WQUw7Cj4gKwkJfQo+ICsKPiArCQlzdC0+Y29s
b3JfZGVwdGggPSBfX2ZscyhhdmFpbF9kZXB0aHMpOwo+ICsJfQo+ICsKPiAgCWtvbWVkYV9jb21w
b25lbnRfYWRkX2lucHV0KCZzdC0+YmFzZSwgJmRmbG93LT5pbnB1dCwgMCk7Cj4gIAlrb21lZGFf
Y29tcG9uZW50X3NldF9vdXRwdXQoJmRmbG93LT5pbnB1dCwgJmltcHJvYy0+YmFzZSwgMCk7Cj4g
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV93Yl9jb25uZWN0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX3diX2Nvbm5lY3Rvci5jCj4gaW5kZXggMjg1MWNhYzk0ZDg2Li43NDBhODEyNTA2MzAgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2Jf
Y29ubmVjdG9yLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV93Yl9jb25uZWN0b3IuYwo+IEBAIC0xNDIsNiArMTQyLDcgQEAgc3RhdGljIGludCBrb21l
ZGFfd2JfY29ubmVjdG9yX2FkZChzdHJ1Y3Qga29tZWRhX2ttc19kZXYgKmttcywKPiAgCXN0cnVj
dCBrb21lZGFfZGV2ICptZGV2ID0ga21zLT5iYXNlLmRldl9wcml2YXRlOwo+ICAJc3RydWN0IGtv
bWVkYV93Yl9jb25uZWN0b3IgKmt3Yl9jb25uOwo+ICAJc3RydWN0IGRybV93cml0ZWJhY2tfY29u
bmVjdG9yICp3Yl9jb25uOwo+ICsJc3RydWN0IGRybV9kaXNwbGF5X2luZm8gKmluZm87Cj4gIAl1
MzIgKmZvcm1hdHMsIG5fZm9ybWF0cyA9IDA7Cj4gIAlpbnQgZXJyOwo+ICAKPiBAQCAtMTcxLDYg
KzE3Miw5IEBAIHN0YXRpYyBpbnQga29tZWRhX3diX2Nvbm5lY3Rvcl9hZGQoc3RydWN0IGtvbWVk
YV9rbXNfZGV2ICprbXMsCj4gIAo+ICAJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZ3Yl9jb25u
LT5iYXNlLCAma29tZWRhX3diX2Nvbm5faGVscGVyX2Z1bmNzKTsKPiAgCj4gKwlpbmZvID0gJmt3
Yl9jb25uLT5iYXNlLmJhc2UuZGlzcGxheV9pbmZvOwo+ICsJaW5mby0+YnBjID0gX19mbHMoa2Ny
dGMtPm1hc3Rlci0+aW1wcm9jLT5zdXBwb3J0ZWRfY29sb3JfZGVwdGhzKTsKPiArCj4gIAlrY3J0
Yy0+d2JfY29ubiA9IGt3Yl9jb25uOwo+ICAKPiAgCXJldHVybiAwOwo+IAoKCi0tIApNaWhhaWwK
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
