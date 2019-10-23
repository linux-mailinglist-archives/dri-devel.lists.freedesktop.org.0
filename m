Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A87DE1260
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 08:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C386E963;
	Wed, 23 Oct 2019 06:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe05::621])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D060D6E963
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 06:43:30 +0000 (UTC)
Received: from DB7PR08CA0017.eurprd08.prod.outlook.com (2603:10a6:5:16::30) by
 VE1PR08MB4895.eurprd08.prod.outlook.com (2603:10a6:802:ac::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Wed, 23 Oct 2019 06:43:27 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::209) by DB7PR08CA0017.outlook.office365.com
 (2603:10a6:5:16::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.24 via Frontend
 Transport; Wed, 23 Oct 2019 06:43:27 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.23 via Frontend Transport; Wed, 23 Oct 2019 06:43:26 +0000
Received: ("Tessian outbound 6481c7fa5a3c:v33");
 Wed, 23 Oct 2019 06:43:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 694ce0f428c59884
X-CR-MTA-TID: 64aa7808
Received: from 7a56dd4b3f30.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.8.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D311E4CE-2C2D-4326-9E18-76F81C9B48E4.1; 
 Wed, 23 Oct 2019 06:43:18 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2051.outbound.protection.outlook.com [104.47.8.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7a56dd4b3f30.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 23 Oct 2019 06:43:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rh6O9JCL0bFJYusmLKOQntTNngI2cXSQUmBnoAHcKa3Al2j28pRAhmOQZ2UzntBGnHszU2mUUtx5xBrNA/J8qh1vWiTL/TZnUPxBf0Xo3ZOm5bG/USSbX4Ib7V6LrwVHzwK6E1IQDD0KXVMqRYIttuyxO2K3+SQbyCbrBgG2WRMwPtwQzIAceDu7Za0vZD03TwR/IG/3jylwKgNL2/zAsFBCoRIyKOpBrquYbTyheRFl5KNZuTtl0DnA5G2MXkI/BsX15tF5DXeINUz4L1WE/cez0QQywmI9VO+DYriW2DYt7aBrmRU7v3Awvjc6xmIEA2dz/mIg8O/BQn5ieutJ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TQq3bHNRrYQiNPP2nRVJpod47h6p3GxLvGsKKnTnHo=;
 b=MG8PsjMd2TzJntkTevOXT36eUd0sHiyS5NnrKmhY1R1EErMKtEIF3Hct2blolrZm884Z+8n+A5QY/wXRLNURoRtDDDjeCthEdhA0aTMNFdJVlK+7n3JuN2DYm7Xpws6T2H5X2Nz+rTzVpTXFULG8Hl/s9amP9CGbWQrXAu9RH4bXBkJwgc44rWh2QXGaWEXfP/boxHWkp6blSQ/LF8+7etB5YQrDlUi4z8qc8Z8fIOAmjfHeAstpQn0gqB9XqssdFzo85GQ3/FkTSaq/Ni5v14INPnBvIPxw40tPO0uwYrys/dsNcxcOQjkGdHMfvGrAlb6+mn8GuNRZ//d3Fwke1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4672.eurprd08.prod.outlook.com (10.255.112.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.22; Wed, 23 Oct 2019 06:43:17 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2367.022; Wed, 23 Oct 2019
 06:43:17 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: [PATCH v7 4/4] drm/komeda: Adds gamma and color-transform support for
 DOU-IPS
Thread-Topic: [PATCH v7 4/4] drm/komeda: Adds gamma and color-transform
 support for DOU-IPS
Thread-Index: AQHViW0mF05EqmyI+keSzxdB9PsPEA==
Date: Wed, 23 Oct 2019 06:43:16 +0000
Message-ID: <20191023064226.10969-5-james.qian.wang@arm.com>
References: <20191023064226.10969-1-james.qian.wang@arm.com>
In-Reply-To: <20191023064226.10969-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0184.apcprd02.prod.outlook.com
 (2603:1096:201:21::20) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a4d36d65-dad0-472e-f57a-08d757844f02
X-MS-TrafficTypeDiagnostic: VE1PR08MB4672:|VE1PR08MB4672:|VE1PR08MB4895:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB48957D671A10511B57FE9BEEB36B0@VE1PR08MB4895.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2582;OLM:2582;
x-forefront-prvs: 019919A9E4
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(189003)(199004)(7736002)(25786009)(2906002)(386003)(71200400001)(4326008)(36756003)(305945005)(6506007)(66066001)(2201001)(71190400001)(102836004)(5660300002)(26005)(478600001)(52116002)(14444005)(55236004)(316002)(86362001)(186003)(6116002)(76176011)(3846002)(256004)(2171002)(66446008)(66946007)(103116003)(64756008)(6512007)(1076003)(66556008)(50226002)(66476007)(476003)(6436002)(8936002)(446003)(2501003)(11346002)(2616005)(6486002)(14454004)(486006)(54906003)(99286004)(81166006)(8676002)(81156014)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4672;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: fr4sq5cyeDTqUyanruBlqcfjFbzp+rl5EPRQIcJtfKkD3L9k8Jy2fHsHAvN36ut3U8Nhf2SDhbDOTJCpqHOkkuY4u7exGsNS/J6zbGfUMXZfM/XNxrzP2eUBy+4QcyvaznW6IgFFJcNU3pAGQqZZsy4QwBl09gqML31+eeroGQQDDsNabuzQhFYpN09fT6i+GdI0LtS6VagiAUcx8mnx7Goaa/qdS9Zrb5w3N5WkQrmAxSYIwRm+BjouO55tZXYRBPxUInY3hSmjg1FDQg3Ilx2FYV145I7ulaP0kOBbyvURA68EdN7MDIpKpYnavuz18eUcTWHOKgHOuVxBWRqF1DZjh2Qbke/mXhuWAK8UWYKdMlXiO/qdpCP4uvfqUOB42ZGnLbZAjhPrCY7RNpgkwdM9NEmxUfo3bFT317LUvE4=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4672
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(1110001)(339900001)(199004)(189003)(66066001)(8676002)(25786009)(47776003)(3846002)(2501003)(110136005)(316002)(356004)(50226002)(81166006)(6116002)(36756003)(5660300002)(81156014)(8936002)(8746002)(2906002)(2171002)(14444005)(22756006)(1076003)(26005)(186003)(105606002)(70206006)(103116003)(476003)(86362001)(102836004)(2201001)(76130400001)(26826003)(7736002)(4326008)(76176011)(336012)(386003)(70586007)(486006)(6512007)(23756003)(36906005)(14454004)(6506007)(54906003)(305945005)(478600001)(99286004)(126002)(2616005)(11346002)(446003)(50466002)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4895;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: fdc9e2a7-bc07-41eb-ac1c-08d7578448e9
NoDisclaimer: True
X-Forefront-PRVS: 019919A9E4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LBLoUpDTiaabnc7dUFYWDcRQHf1B6SXe6DZgCmXn5SpvWTZ8UqwmLlDblj9PY0YI53t+DztQwJ6shI/FQdEY6yAdBCMXmRUULJfBMYDQya34yULX7ntWSQarkvDX7BRSDwROpzdSwc/XPtlQWEe2wSjXEJN6NsOD0n7CA2EZL3zm2xBzaG9TEh+6eW1bp6zzLQ+LGchdjFRnbPna5loNJiHvvvtQLnzN2hDIVQ1buK7uQPQG2aDQyF952hZ3WPzXwXFw2Dmq7/MCjVxqGDlPutpebpkzWkExNsCxuUCx4qD5NWA7UUG1YDfUdAxq21PpAdHisoDI2G2vANBTWqXj9dXXkWxZbAQEoFGzIm9fGU7LfxxIPrvI64pbAlxUJa8jWs0laKOxKjm8IL7/EGOpWU+D3ggZyNTKYiz45wV6l/MRRxzqIK82BO0pQgsstP3t
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2019 06:43:26.8027 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d36d65-dad0-472e-f57a-08d757844f02
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4895
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TQq3bHNRrYQiNPP2nRVJpod47h6p3GxLvGsKKnTnHo=;
 b=u0Vxxxn19sEdzZ575YT13vQ6Fo+s4PIqdft6DWrL65FMiFFGAG+SnGMPqcByiQIvuobVl63i9HDFfDpy/BVMdG/d8L5Oz9L2v/GnvHAR/YX0xV7yLfadxr/P3/CxKLmBM7yq1IfmF6JxUfhlXVVKPIR+WV/rRBwBjf5+RVCL8v8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TQq3bHNRrYQiNPP2nRVJpod47h6p3GxLvGsKKnTnHo=;
 b=u0Vxxxn19sEdzZ575YT13vQ6Fo+s4PIqdft6DWrL65FMiFFGAG+SnGMPqcByiQIvuobVl63i9HDFfDpy/BVMdG/d8L5Oz9L2v/GnvHAR/YX0xV7yLfadxr/P3/CxKLmBM7yq1IfmF6JxUfhlXVVKPIR+WV/rRBwBjf5+RVCL8v8=
X-Mailman-Original-Authentication-Results: spf=fail (sender IP is 63.35.35.123)
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogIkxvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkiIDxMb3dyeS5MaUBhcm0uY29t
PgoKQWRkcyBnYW1tYSBhbmQgY29sb3ItdHJhbnNmb3JtIHN1cHBvcnQgZm9yIERPVS1JUFMuCkFk
ZHMgdHdvIGNhcHMgbWVtYmVycyBmZ2FtbWFfY29lZmZzIGFuZCBjdG1fY29lZmZzIHRvIGtvbWVk
YV9pbXByb2Nfc3RhdGUuCklmIGNvbG9yIG1hbmFnZW1lbnQgY2hhbmdlZCwgc2V0IGdhbW1hIGFu
ZCBjb2xvci10cmFuc2Zvcm0gYWNjb3JkaW5nbHkuCgp2NTogUmViYXNlIHdpdGggZHJtLW1pc2Mt
bmV4dAoKU2lnbmVkLW9mZi1ieTogTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8bG93
cnkubGlAYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFu
YXNzb3ZAYXJtLmNvbT4KLS0tCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9u
ZW50LmMgICAgfCAyMCArKysrKysrKysrKysrKysrKysrCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2NydGMuYyAgfCAgMiArKwogLi4uL2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX3BpcGVsaW5lLmggIHwgIDMgKysrCiAuLi4vZGlzcGxheS9rb21lZGEva29tZWRh
X3BpcGVsaW5lX3N0YXRlLmMgICAgfCAgNiArKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMzEgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEvZDcxL2Q3MV9jb21wb25lbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEvZDcxL2Q3MV9jb21wb25lbnQuYwppbmRleCBmMGJhMjZlMjgyYzMuLmI2NTE3YzQ2ZTY3MCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Nv
bXBvbmVudC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3
MV9jb21wb25lbnQuYwpAQCAtMTA0NCw3ICsxMDQ0LDkgQEAgc3RhdGljIGludCBkNzFfbWVyZ2Vy
X2luaXQoc3RydWN0IGQ3MV9kZXYgKmQ3MSwKIHN0YXRpYyB2b2lkIGQ3MV9pbXByb2NfdXBkYXRl
KHN0cnVjdCBrb21lZGFfY29tcG9uZW50ICpjLAogCQkJICAgICAgc3RydWN0IGtvbWVkYV9jb21w
b25lbnRfc3RhdGUgKnN0YXRlKQogeworCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdCA9
IHN0YXRlLT5jcnRjLT5zdGF0ZTsKIAlzdHJ1Y3Qga29tZWRhX2ltcHJvY19zdGF0ZSAqc3QgPSB0
b19pbXByb2Nfc3Qoc3RhdGUpOworCXN0cnVjdCBkNzFfcGlwZWxpbmUgKnBpcGUgPSB0b19kNzFf
cGlwZWxpbmUoYy0+cGlwZWxpbmUpOwogCXUzMiBfX2lvbWVtICpyZWcgPSBjLT5yZWc7CiAJdTMy
IGluZGV4LCBtYXNrID0gMCwgY3RybCA9IDA7CiAKQEAgLTEwNTUsNiArMTA1NywyNCBAQCBzdGF0
aWMgdm9pZCBkNzFfaW1wcm9jX3VwZGF0ZShzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywKIAlt
YWxpZHBfd3JpdGUzMihyZWcsIEJMS19TSVpFLCBIVl9TSVpFKHN0LT5oc2l6ZSwgc3QtPnZzaXpl
KSk7CiAJbWFsaWRwX3dyaXRlMzIocmVnLCBJUFNfREVQVEgsIHN0LT5jb2xvcl9kZXB0aCk7CiAK
KwlpZiAoY3J0Y19zdC0+Y29sb3JfbWdtdF9jaGFuZ2VkKSB7CisJCW1hc2sgfD0gSVBTX0NUUkxf
RlQgfCBJUFNfQ1RSTF9SR0I7CisKKwkJaWYgKGNydGNfc3QtPmdhbW1hX2x1dCkgeworCQkJbWFs
aWRwX3dyaXRlX2dyb3VwKHBpcGUtPmRvdV9mdF9jb2VmZl9hZGRyLCBGVF9DT0VGRjAsCisJCQkJ
CSAgIEtPTUVEQV9OX0dBTU1BX0NPRUZGUywKKwkJCQkJICAgc3QtPmZnYW1tYV9jb2VmZnMpOwor
CQkJY3RybCB8PSBJUFNfQ1RSTF9GVDsgLyogZW5hYmxlIGdhbW1hICovCisJCX0KKworCQlpZiAo
Y3J0Y19zdC0+Y3RtKSB7CisJCQltYWxpZHBfd3JpdGVfZ3JvdXAocmVnLCBJUFNfUkdCX1JHQl9D
T0VGRjAsCisJCQkJCSAgIEtPTUVEQV9OX0NUTV9DT0VGRlMsCisJCQkJCSAgIHN0LT5jdG1fY29l
ZmZzKTsKKwkJCWN0cmwgfD0gSVBTX0NUUkxfUkdCOyAvKiBlbmFibGUgZ2FtdXQgKi8KKwkJfQor
CX0KKwogCW1hc2sgfD0gSVBTX0NUUkxfWVVWIHwgSVBTX0NUUkxfQ0hENDIyIHwgSVBTX0NUUkxf
Q0hENDIwOwogCiAJLyogY29uZmlnIGNvbG9yIGZvcm1hdCAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCmluZGV4IDI1MjAxNTIxMGZiYy4u
MWM0NTJlYTc1OTk5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jcnRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfY3J0Yy5jCkBAIC02MTcsNiArNjE3LDggQEAgc3RhdGljIGludCBrb21lZGFfY3J0
Y19hZGQoc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprbXMsCiAKIAljcnRjLT5wb3J0ID0ga2NydGMt
Pm1hc3Rlci0+b2Zfb3V0cHV0X3BvcnQ7CiAKKwlkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdChj
cnRjLCAwLCB0cnVlLCBLT01FREFfQ09MT1JfTFVUX1NJWkUpOworCiAJcmV0dXJuIGVycjsKIH0K
IApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
cGlwZWxpbmUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3Bp
cGVsaW5lLmgKaW5kZXggYmQ2Y2E3Yzg3MDM3Li5hYzg3MjVlMjQ4NTMgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaApAQCAt
MTEsNiArMTEsNyBAQAogI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljLmg+CiAjaW5jbHVkZSA8ZHJt
L2RybV9hdG9taWNfaGVscGVyLmg+CiAjaW5jbHVkZSAibWFsaWRwX3V0aWxzLmgiCisjaW5jbHVk
ZSAia29tZWRhX2NvbG9yX21nbXQuaCIKIAogI2RlZmluZSBLT01FREFfTUFYX1BJUEVMSU5FUwkJ
MgogI2RlZmluZSBLT01FREFfUElQRUxJTkVfTUFYX0xBWUVSUwk0CkBAIC0zMjcsNiArMzI4LDgg
QEAgc3RydWN0IGtvbWVkYV9pbXByb2Nfc3RhdGUgewogCXN0cnVjdCBrb21lZGFfY29tcG9uZW50
X3N0YXRlIGJhc2U7CiAJdTggY29sb3JfZm9ybWF0LCBjb2xvcl9kZXB0aDsKIAl1MTYgaHNpemUs
IHZzaXplOworCXUzMiBmZ2FtbWFfY29lZmZzW0tPTUVEQV9OX0dBTU1BX0NPRUZGU107CisJdTMy
IGN0bV9jb2VmZnNbS09NRURBX05fQ1RNX0NPRUZGU107CiB9OwogCiAvKiBkaXNwbGF5IHRpbWlu
ZyBjb250cm9sbGVyICovCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYwppbmRleCA0MmJkYzYzZGNmZmEuLjA5
MzAyMzRhYmI5ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jCkBAIC04MDIsNiArODAyLDEyIEBAIGtv
bWVkYV9pbXByb2NfdmFsaWRhdGUoc3RydWN0IGtvbWVkYV9pbXByb2MgKmltcHJvYywKIAkJc3Qt
PmNvbG9yX2Zvcm1hdCA9IEJJVChfX2ZmcyhhdmFpbF9mb3JtYXRzKSk7CiAJfQogCisJaWYgKGtj
cnRjX3N0LT5iYXNlLmNvbG9yX21nbXRfY2hhbmdlZCkgeworCQlkcm1fbHV0X3RvX2ZnYW1tYV9j
b2VmZnMoa2NydGNfc3QtPmJhc2UuZ2FtbWFfbHV0LAorCQkJCQkgc3QtPmZnYW1tYV9jb2VmZnMp
OworCQlkcm1fY3RtX3RvX2NvZWZmcyhrY3J0Y19zdC0+YmFzZS5jdG0sIHN0LT5jdG1fY29lZmZz
KTsKKwl9CisKIAlrb21lZGFfY29tcG9uZW50X2FkZF9pbnB1dCgmc3QtPmJhc2UsICZkZmxvdy0+
aW5wdXQsIDApOwogCWtvbWVkYV9jb21wb25lbnRfc2V0X291dHB1dCgmZGZsb3ctPmlucHV0LCAm
aW1wcm9jLT5iYXNlLCAwKTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
