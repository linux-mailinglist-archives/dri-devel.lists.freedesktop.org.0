Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E04F48AE2D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 06:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0BF6E632;
	Tue, 13 Aug 2019 04:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30069.outbound.protection.outlook.com [40.107.3.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2A16E632
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 04:56:23 +0000 (UTC)
Received: from VI1PR08CA0133.eurprd08.prod.outlook.com (10.175.229.11) by
 VE1PR08MB4958.eurprd08.prod.outlook.com (10.255.158.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Tue, 13 Aug 2019 04:56:19 +0000
Received: from VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::200) by VI1PR08CA0133.outlook.office365.com
 (2603:10a6:800:d5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.13 via Frontend
 Transport; Tue, 13 Aug 2019 04:56:19 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT015.mail.protection.outlook.com (10.152.18.176) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 13 Aug 2019 04:56:17 +0000
Received: ("Tessian outbound 220137ab7b0b:v26");
 Tue, 13 Aug 2019 04:56:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5a4466e494ac27c0
X-CR-MTA-TID: 64aa7808
Received: from 48d282c98ec2.2 (cr-mta-lb-1.cr-mta-net [104.47.2.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3EA0245D-8345-4038-BA22-129FD4567396.1; 
 Tue, 13 Aug 2019 04:56:10 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 48d282c98ec2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 13 Aug 2019 04:56:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eodcI3b4cbg8foLpxrxIw4vzu6Xnt+gtPnTetX8YBVwRgO3BWbKO9jRZnl0uNB8BuFnhmOdGfqYNga+1kb7vE0m/6oQMOh/ckTulFV330kplrEnj/+RH680e37eXNDSxs4hqfkJ3DBSS8eTuyibg5psoWcjMMJI0dfjcR1bIrIGHImiGWSctyKqXEnwiL6XU4kUvwR3Z1edjFlssdJu2jEWlqArxQLPwe8pLUyJkympqMwB/hQrT6syt/7KB8JINLNBXn/d4AF26VL9NuF6V2a1NjdyeTleBQ/RahMbjbTpQ3JoubkyQS0Cs2kGlZKyxVluaypLdhBwcG2TXgUXfAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lht/FXnDUDdG/2htzFfQqSr71W++svRRJXgUnujKmXo=;
 b=ZP0XO+xqGF7wjwIdMEgTddKNI/rFv7VTv8R362eaF4bD+9hVjQCReE5/VMXM553WB/2EUsnEjDS7XOo1GBYJNsZg+1LBaF78lswed4R4MT6Ydo533FO29EouiiRLAh4HjKhKlGWbwQjxnIcfjxZBJZ6/k3UIF0nnpQ24sn8aQuRipSd+vH0T1lLSfyx+2IKV57b4XKd38t//EzJvlOynk+v67DCb6iCYqKuZiwT+IfS4SNJP9a2ADarEceqTmo0Klt7I4cRZcsAujdMzt1xXn27x9bt7j4+1lepFM2+Imx1isZIGwMac+hE7f7fVRCBRTXGKpzLQ17ZJUCcnkV6ulQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4752.eurprd08.prod.outlook.com (10.255.112.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Tue, 13 Aug 2019 04:56:07 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134%6]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 04:56:07 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH v2 2/4] drm/komeda: Introduce komeda_color_manager/state
Thread-Topic: [PATCH v2 2/4] drm/komeda: Introduce komeda_color_manager/state
Thread-Index: AQHVUZNrgGWWre2e4Eyh5LBkmfNYaA==
Date: Tue, 13 Aug 2019 04:56:07 +0000
Message-ID: <20190813045536.28239-3-james.qian.wang@arm.com>
References: <20190813045536.28239-1-james.qian.wang@arm.com>
In-Reply-To: <20190813045536.28239-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0070.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::34) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d12a69de-2b87-42d4-a5fc-08d71faa93ad
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4752; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4752:|VE1PR08MB4958:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB4958FC7E482C939917EFFC9BB3D20@VE1PR08MB4958.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3276;OLM:3276;
x-forefront-prvs: 01283822F8
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(366004)(346002)(396003)(199004)(189003)(50226002)(5660300002)(2201001)(110136005)(26005)(316002)(66066001)(6116002)(3846002)(305945005)(2906002)(7736002)(103116003)(71190400001)(71200400001)(8676002)(1076003)(54906003)(446003)(55236004)(66946007)(478600001)(81156014)(14454004)(386003)(6506007)(4326008)(36756003)(52116002)(2616005)(102836004)(25786009)(256004)(11346002)(14444005)(81166006)(186003)(76176011)(6486002)(64756008)(66556008)(66476007)(99286004)(2501003)(6512007)(6436002)(86362001)(66446008)(8936002)(486006)(476003)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4752;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 2gpb+2vaeXz6XazK4aNvYeXepjiL48SMVgwale7OvV6sP6itJz8pJSWjhgwA0iaqC21MnEmciDnkvU10wj4EZIJEudFNAfldzIoyww90TxW4XAdl/I3KMI4RzfBOhMk1Hx3XdVeOAEmjnmrUY5EW0D6cB5gQFi4qoL3f9Nz+ve/9b9Rc47VhrlWiW18NRHGSN9r+LEB/vdlRz3s7GtwiF/rzHVbp7JCw27H6Fi9EosieMsLytUkjNMCy+bsfEEW1AlZXTimNOkqrYtQzuFqm+qshr8IrRGvuQEo2utbSdd5LZiApG/SNWD3K9I9N/7Ag0fPKMWldih4/m5r90H41sRvPfCYZkhD4RRj4w9Scet3FvV0T4BJJWqrLVf+dW/GBPnIhv/Za+kBOU15mRZRBSItsHdR+jn6wS1EK64vCb3I=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4752
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(2980300002)(189003)(199004)(50226002)(81156014)(8746002)(5660300002)(26005)(36756003)(36906005)(102836004)(6486002)(8936002)(76176011)(6506007)(316002)(14444005)(386003)(54906003)(2616005)(476003)(336012)(81166006)(110136005)(47776003)(63350400001)(63370400001)(11346002)(446003)(66066001)(486006)(103116003)(76130400001)(70586007)(126002)(50466002)(1076003)(2201001)(22756006)(70206006)(6512007)(25786009)(4326008)(86362001)(14454004)(478600001)(26826003)(23756003)(7736002)(186003)(305945005)(8676002)(99286004)(6116002)(2906002)(3846002)(356004)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4958;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7f5b7130-b506-43d4-376a-08d71faa8d6c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VE1PR08MB4958; 
NoDisclaimer: True
X-Forefront-PRVS: 01283822F8
X-Microsoft-Antispam-Message-Info: NMhEabwKgi2YRrd4RnyDycTGE7Ml6PL9sY5K9BpbaMsRWvCBCjXnMC3+j1JP7ymgAlfQROX9rEK1QtBuxb6n3ELQGW9EUMcK4vUHz4QNv8EKU/0i8x9KIFB2L6HZPDO94oOSSpK+FDaKWWrCHRhyAkU4XYuN6WG4AUDwlQlpvdXhHV27QDqLOp4GReVAOaxRZ1gfInLDdHCIPELQwe3WDHJcVm7Nw1dB1jzssbDVPbiSLjU/HfNF6FT6bUaU/gPvY2vVTXHodyEq2GaRRWz2TxV+VC17M6RtrpEeH/DSQJN9mxzIhvtnJnA820Ovc3R+oJvfl2spN/uHicvaTNXmwd3TeR7rTG4gPzw2IC1VZzNE/aNcBfs28F0evmFbG/Vg7axl69fKpehMllj7HO0wnFMFLz3ylK1WGo0IDryUJF0=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2019 04:56:17.7425 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d12a69de-2b87-42d4-a5fc-08d71faa93ad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4958
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lht/FXnDUDdG/2htzFfQqSr71W++svRRJXgUnujKmXo=;
 b=68So3K9Z+gsyBSknXWc6z95iWaDo6fRYF0JVcEjN31Zu4OBo5deEHaaicxwJRavKsHc6MBIV3yRu30RrqoBypyKKIsUECaNLjNQUpxttpDpNrTCY4PNEnWBHiLptkbEp6Hm0gp2OgmDO3e/JBfAhHtcEBdrN3eTKYgvZ8cMPM7g=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lht/FXnDUDdG/2htzFfQqSr71W++svRRJXgUnujKmXo=;
 b=68So3K9Z+gsyBSknXWc6z95iWaDo6fRYF0JVcEjN31Zu4OBo5deEHaaicxwJRavKsHc6MBIV3yRu30RrqoBypyKKIsUECaNLjNQUpxttpDpNrTCY4PNEnWBHiLptkbEp6Hm0gp2OgmDO3e/JBfAhHtcEBdrN3eTKYgvZ8cMPM7g=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWFueSBrb21lZGEgY29tcG9uZW50IHN1cHBvcnQgY29sb3IgbWFuYWdlbWVudCBsaWtlIGxheWVy
IGFuZCBJUFMsIHNvCmtvbWVkYV9jb2xvcl9tYW5hZ2VyL3N0YXRlIGFyZSBpbnRyb2R1Y2VkIHRv
IG1hbmFnZXIgZ2FtbWEsIGNzYyBhbmQgZGVnYW1tYQp0b2dldGhlciBmb3IgZWFzaWx5IHNoYXJl
IGl0IHRvIG11bHRpcGxlIGNvbXBvbnBlbnQuCgpBbmQgZm9yIGtvbWVkYV9jb2xvcl9tYW5hZ2Vy
IHdoaWNoOgotIGNvbnZlcnQgZHJtIDNkIGdhbW1hIGx1dCB0byBrb21lZGEgc3BlY2lmaWMgZ2Ft
bWEgY29lZmZzCi0gZ2FtbWEgdGFibGUgbWFuYWdlbWVudCBhbmQgaGlkZSB0aGUgSFcgZGlmZmVy
ZW5jZSBmb3Iga29tZWRhLUNPUkUKClNpZ25lZC1vZmYtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJt
IFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KLS0tCiAuLi4vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMgICAgfCAxMjYgKysrKysrKysrKysr
KysrKysrCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmggICAgfCAg
MzIgKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTU2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfY29sb3JfbWdtdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfY29sb3JfbWdtdC5jCmluZGV4IDlkMTRhOTJkYmIxNy4uYmYyMzg4ZDY0MWI5IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3Jf
bWdtdC5jCkBAIC00LDcgKzQsOSBAQAogICogQXV0aG9yOiBKYW1lcy5RaWFuLldhbmcgPGphbWVz
LnFpYW4ud2FuZ0Bhcm0uY29tPgogICoKICAqLworI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4K
IAorI2luY2x1ZGUgIm1hbGlkcF91dGlscy5oIgogI2luY2x1ZGUgImtvbWVkYV9jb2xvcl9tZ210
LmgiCiAKIC8qIDEwYml0IHByZWNpc2lvbiBZVVYyUkdCIG1hdHJpeCAqLwpAQCAtNjUsMyArNjcs
MTI3IEBAIGNvbnN0IHMzMiAqa29tZWRhX3NlbGVjdF95dXYycmdiX2NvZWZmcyh1MzIgY29sb3Jf
ZW5jb2RpbmcsIHUzMiBjb2xvcl9yYW5nZSkKIAogCXJldHVybiBjb2VmZnM7CiB9CisKK3N0cnVj
dCBnYW1tYV9jdXJ2ZV9zZWN0b3IgeworCXUzMiBib3VuZGFyeV9zdGFydDsKKwl1MzIgbnVtX29m
X3NlZ21lbnRzOworCXUzMiBzZWdtZW50X3dpZHRoOworfTsKKworc3RydWN0IGdhbW1hX2N1cnZl
X3NlZ21lbnQgeworCXUzMiBzdGFydDsKKwl1MzIgZW5kOworfTsKKworc3RhdGljIHN0cnVjdCBn
YW1tYV9jdXJ2ZV9zZWN0b3Igc2VjdG9yX3RibFtdID0geworCXsgMCwgICAgNCwgIDQgICB9LAor
CXsgMTYsICAgNCwgIDQgICB9LAorCXsgMzIsICAgNCwgIDggICB9LAorCXsgNjQsICAgNCwgIDE2
ICB9LAorCXsgMTI4LCAgNCwgIDMyICB9LAorCXsgMjU2LCAgNCwgIDY0ICB9LAorCXsgNTEyLCAg
MTYsIDMyICB9LAorCXsgMTAyNCwgMjQsIDEyOCB9LAorfTsKKworc3RhdGljIHN0cnVjdCBnYW1t
YV9jdXJ2ZV9zZWN0b3IgaWdhbW1hX3NlY3Rvcl90YmxbXSA9IHsKKwl7MCwgNjQsIDY0fSwKK307
CisKK3N0YXRpYyB2b2lkCitkcm1fbHV0X3RvX2NvZWZmcyhzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Js
b2IgKmx1dF9ibG9iLCB1MzIgKmNvZWZmcywKKwkJICBzdHJ1Y3QgZ2FtbWFfY3VydmVfc2VjdG9y
ICpzZWN0b3JfdGJsLCB1MzIgbnVtX3NlY3RvcnMpCit7CisJc3RydWN0IGRybV9jb2xvcl9sdXQg
Kmx1dDsKKwl1MzIgaSwgaiwgaW4sIG51bSA9IDA7CisKKwlpZiAoIWx1dF9ibG9iKQorCQlyZXR1
cm47CisKKwlsdXQgPSBsdXRfYmxvYi0+ZGF0YTsKKworCWZvciAoaSA9IDA7IGkgPCBudW1fc2Vj
dG9yczsgaSsrKSB7CisJCWZvciAoaiA9IDA7IGogPCBzZWN0b3JfdGJsW2ldLm51bV9vZl9zZWdt
ZW50czsgaisrKSB7CisJCQlpbiA9IHNlY3Rvcl90YmxbaV0uYm91bmRhcnlfc3RhcnQgKworCQkJ
ICAgICBqICogc2VjdG9yX3RibFtpXS5zZWdtZW50X3dpZHRoOworCisJCQljb2VmZnNbbnVtKytd
ID0gZHJtX2NvbG9yX2x1dF9leHRyYWN0KGx1dFtpbl0ucmVkLAorCQkJCQkJS09NRURBX0NPTE9S
X1BSRUNJU0lPTik7CisJCX0KKwl9CisKKwljb2VmZnNbbnVtXSA9IEJJVChLT01FREFfQ09MT1Jf
UFJFQ0lTSU9OKTsKK30KKwordm9pZCBkcm1fbHV0X3RvX2lnYW1tYV9jb2VmZnMoc3RydWN0IGRy
bV9wcm9wZXJ0eV9ibG9iICpsdXRfYmxvYiwgdTMyICpjb2VmZnMpCit7CisJZHJtX2x1dF90b19j
b2VmZnMobHV0X2Jsb2IsIGNvZWZmcywKKwkJCSAgaWdhbW1hX3NlY3Rvcl90YmwsIEFSUkFZX1NJ
WkUoaWdhbW1hX3NlY3Rvcl90YmwpKTsKK30KKwordm9pZCBkcm1fbHV0X3RvX2ZnYW1tYV9jb2Vm
ZnMoc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpsdXRfYmxvYiwgdTMyICpjb2VmZnMpCit7CisJ
ZHJtX2x1dF90b19jb2VmZnMobHV0X2Jsb2IsIGNvZWZmcywKKwkJCSAgc2VjdG9yX3RibCwgQVJS
QVlfU0laRShzZWN0b3JfdGJsKSk7Cit9CisKK3ZvaWQgZHJtX2N0bV90b19jb2VmZnMoc3RydWN0
IGRybV9wcm9wZXJ0eV9ibG9iICpjdG1fYmxvYiwgdTMyICpjb2VmZnMpCit7CisJc3RydWN0IGRy
bV9jb2xvcl9jdG0gKmN0bTsKKwl1MzIgaTsKKworCWlmICghY3RtX2Jsb2IpCisJCXJldHVybjsK
KworCWN0bSA9IGN0bV9ibG9iLT5kYXRhOworCisJZm9yIChpID0gMDsgaSA8IEtPTUVEQV9OX0NU
TV9DT0VGRlM7ICsraSkgeworCQkvKiBDb252ZXJ0IGZyb20gUzMxLjMyIHRvIFEzLjEyLiAqLwor
CQlzNjQgdiA9IGN0bS0+bWF0cml4W2ldOworCisJCWNvZWZmc1tpXSA9IGNsYW1wX3ZhbCh2LCAx
IC0gKDFMTCA8PCAzNCksICgxTEwgPDwgMzQpIC0gMSkgPj4gMjA7CisJfQorfQorCit2b2lkIGtv
bWVkYV9jb2xvcl9kdXBsaWNhdGVfc3RhdGUoc3RydWN0IGtvbWVkYV9jb2xvcl9zdGF0ZSAqbmV3
LAorCQkJCSAgc3RydWN0IGtvbWVkYV9jb2xvcl9zdGF0ZSAqb2xkKQoreworCW5ldy0+aWdhbW1h
ID0ga29tZWRhX2NvZWZmc19nZXQob2xkLT5pZ2FtbWEpOworCW5ldy0+ZmdhbW1hID0ga29tZWRh
X2NvZWZmc19nZXQob2xkLT5mZ2FtbWEpOworfQorCit2b2lkIGtvbWVkYV9jb2xvcl9jbGVhbnVw
X3N0YXRlKHN0cnVjdCBrb21lZGFfY29sb3Jfc3RhdGUgKmNvbG9yX3N0KQoreworCWtvbWVkYV9j
b2VmZnNfcHV0KGNvbG9yX3N0LT5pZ2FtbWEpOworCWtvbWVkYV9jb2VmZnNfcHV0KGNvbG9yX3N0
LT5mZ2FtbWEpOworfQorCitpbnQga29tZWRhX2NvbG9yX3ZhbGlkYXRlKHN0cnVjdCBrb21lZGFf
Y29sb3JfbWFuYWdlciAqbWdyLAorCQkJICBzdHJ1Y3Qga29tZWRhX2NvbG9yX3N0YXRlICpzdCwK
KwkJCSAgc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICppZ2FtbWFfYmxvYiwKKwkJCSAgc3RydWN0
IGRybV9wcm9wZXJ0eV9ibG9iICpmZ2FtbWFfYmxvYikKK3sKKwl1MzIgY29lZmZzW0tPTUVEQV9O
X0dBTU1BX0NPRUZGU107CisKKwlrb21lZGFfY29sb3JfY2xlYW51cF9zdGF0ZShzdCk7CisKKwlp
ZiAoaWdhbW1hX2Jsb2IpIHsKKwkJZHJtX2x1dF90b19pZ2FtbWFfY29lZmZzKGlnYW1tYV9ibG9i
LCBjb2VmZnMpOworCQlzdC0+aWdhbW1hID0ga29tZWRhX2NvZWZmc19yZXF1ZXN0KG1nci0+aWdh
bW1hX21nciwgY29lZmZzKTsKKwkJaWYgKCFzdC0+aWdhbW1hKSB7CisJCQlEUk1fREVCVUdfQVRP
TUlDKCJyZXF1ZXN0IGlnYW1tYSB0YWJsZSBmYWlsZWQuXG4iKTsKKwkJCXJldHVybiAtRUJVU1k7
CisJCX0KKwl9CisKKwlpZiAoZmdhbW1hX2Jsb2IpIHsKKwkJZHJtX2x1dF90b19mZ2FtbWFfY29l
ZmZzKGZnYW1tYV9ibG9iLCBjb2VmZnMpOworCQlzdC0+ZmdhbW1hID0ga29tZWRhX2NvZWZmc19y
ZXF1ZXN0KG1nci0+ZmdhbW1hX21nciwgY29lZmZzKTsKKwkJaWYgKCFzdC0+ZmdhbW1hKSB7CisJ
CQlEUk1fREVCVUdfQVRPTUlDKCJyZXF1ZXN0IGZnYW1tYSB0YWJsZSBmYWlsZWQuXG4iKTsKKwkJ
CXJldHVybiAtRUJVU1k7CisJCX0KKwl9CisKKwlyZXR1cm4gMDsKK30KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuaAppbmRl
eCBhMmRmMjE4ZjU4ZTcuLjQxYTk2YjNiNTQwZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuaApAQCAtNCwxNCArNCw0
MiBAQAogICogQXV0aG9yOiBKYW1lcy5RaWFuLldhbmcgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29t
PgogICoKICAqLwotCiAjaWZuZGVmIF9LT01FREFfQ09MT1JfTUdNVF9IXwogI2RlZmluZSBfS09N
RURBX0NPTE9SX01HTVRfSF8KIAogI2luY2x1ZGUgPGRybS9kcm1fY29sb3JfbWdtdC5oPgorI2lu
Y2x1ZGUgImtvbWVkYV9jb2VmZnMuaCIKIAogI2RlZmluZSBLT01FREFfTl9ZVVYyUkdCX0NPRUZG
UwkJMTIKKyNkZWZpbmUgS09NRURBX05fUkdCMllVVl9DT0VGRlMJCTEyCisjZGVmaW5lIEtPTUVE
QV9DT0xPUl9QUkVDSVNJT04JCTEyCisjZGVmaW5lIEtPTUVEQV9OX0dBTU1BX0NPRUZGUwkJNjUK
KyNkZWZpbmUgS09NRURBX0NPTE9SX0xVVF9TSVpFCQlCSVQoS09NRURBX0NPTE9SX1BSRUNJU0lP
TikKKyNkZWZpbmUgS09NRURBX05fQ1RNX0NPRUZGUwkJOQorCitzdHJ1Y3Qga29tZWRhX2NvbG9y
X21hbmFnZXIgeworCXN0cnVjdCBrb21lZGFfY29lZmZzX21hbmFnZXIgKmlnYW1tYV9tZ3I7CisJ
c3RydWN0IGtvbWVkYV9jb2VmZnNfbWFuYWdlciAqZmdhbW1hX21ncjsKKwlib29sIGhhc19jdG07
Cit9OworCitzdHJ1Y3Qga29tZWRhX2NvbG9yX3N0YXRlIHsKKwlzdHJ1Y3Qga29tZWRhX2NvZWZm
c190YWJsZSAqaWdhbW1hOworCXN0cnVjdCBrb21lZGFfY29lZmZzX3RhYmxlICpmZ2FtbWE7Cit9
OworCit2b2lkIGtvbWVkYV9jb2xvcl9kdXBsaWNhdGVfc3RhdGUoc3RydWN0IGtvbWVkYV9jb2xv
cl9zdGF0ZSAqbmV3LAorCQkJCSAgc3RydWN0IGtvbWVkYV9jb2xvcl9zdGF0ZSAqb2xkKTsKK3Zv
aWQga29tZWRhX2NvbG9yX2NsZWFudXBfc3RhdGUoc3RydWN0IGtvbWVkYV9jb2xvcl9zdGF0ZSAq
Y29sb3Jfc3QpOworaW50IGtvbWVkYV9jb2xvcl92YWxpZGF0ZShzdHJ1Y3Qga29tZWRhX2NvbG9y
X21hbmFnZXIgKm1nciwKKwkJCSAgc3RydWN0IGtvbWVkYV9jb2xvcl9zdGF0ZSAqc3QsCisJCQkg
IHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqaWdhbW1hX2Jsb2IsCisJCQkgIHN0cnVjdCBkcm1f
cHJvcGVydHlfYmxvYiAqZmdhbW1hX2Jsb2IpOworCit2b2lkIGRybV9sdXRfdG9faWdhbW1hX2Nv
ZWZmcyhzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmx1dF9ibG9iLCB1MzIgKmNvZWZmcyk7Cit2
b2lkIGRybV9sdXRfdG9fZmdhbW1hX2NvZWZmcyhzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmx1
dF9ibG9iLCB1MzIgKmNvZWZmcyk7Cit2b2lkIGRybV9jdG1fdG9fY29lZmZzKHN0cnVjdCBkcm1f
cHJvcGVydHlfYmxvYiAqY3RtX2Jsb2IsIHUzMiAqY29lZmZzKTsKIAogY29uc3QgczMyICprb21l
ZGFfc2VsZWN0X3l1djJyZ2JfY29lZmZzKHUzMiBjb2xvcl9lbmNvZGluZywgdTMyIGNvbG9yX3Jh
bmdlKTsKIAotI2VuZGlmCisjZW5kaWYgLypfS09NRURBX0NPTE9SX01HTVRfSF8qLwotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
