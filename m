Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFD1D38CA
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 07:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D195E89D4D;
	Fri, 11 Oct 2019 05:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::620])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C181B89D4D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 05:45:45 +0000 (UTC)
Received: from DB7PR08CA0020.eurprd08.prod.outlook.com (2603:10a6:5:16::33) by
 AM0PR08MB4563.eurprd08.prod.outlook.com (2603:10a6:208:131::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.18; Fri, 11 Oct
 2019 05:45:39 +0000
Received: from AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::207) by DB7PR08CA0020.outlook.office365.com
 (2603:10a6:5:16::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 05:45:38 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT043.mail.protection.outlook.com (10.152.17.43) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 11 Oct 2019 05:45:36 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Fri, 11 Oct 2019 05:45:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ec8458e84ace2f81
X-CR-MTA-TID: 64aa7808
Received: from 36f599f7557f.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.55]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B07F8312-C76D-4081-A373-B0BCCB85C7E3.1; 
 Fri, 11 Oct 2019 05:45:23 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2055.outbound.protection.outlook.com [104.47.9.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 36f599f7557f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 11 Oct 2019 05:45:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+4rHj7ILP5YC79spbCb4x4eKQcE+Dc90oYrPKmSPTooM+kTaWs4dPSF/l0f1oVO73mNv9mwaQevBI4PgZrBrr+XXYXmZxqRWKy0jjm/P9Q1nM6nv6A5Y7kdSxCiuO6znJ376MFzgnDzxpRH5AxJLAhNLBS0oqN0jpXrqnNeC/bcAHNkAPWkaRqkG+TJsEW8QqjbgR5AyOJAvk+LWu4kOIN8ghPeCktRIHCDY+KALSXa9qeZGGwkwHRv7qEYyakIQ6sIyJ9u8Gu2fnfsLXOcrDNpkxFHCvdF2iH9+39iKliI/SNn6a0ApYSAP6DxwWfXwCXo2/G2yTf0Bn0X3AXFLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3exUIpO43eg+isG5bikJNfuF7PWKS/F5BOA9HkurNU=;
 b=OOXaMzfJXgZbPgqJmG2GrsPuIYRrI5n+e2mNwjg62aAHZJT4xHNJySZyrbTUOWn+tdj5VXex7NmH6ScAnwgpQpdVbAn4N8gNw/CRJztpz96ECHZ6OYY0eBYLfbbqKd1x9M0rhswmyNNIcByO/cUdA546A4MbwqwOKuIeJxGe4gXsRIOigg3/QwN4aoPVhlD2J7mbMJOKNrViiYRI2JgBsHs8WiNlh70UmSMjCk7VqyY0tptvoPCddP7I3tccSLKujzrhYtqrvaKn8kNK/w8HPW5xbq1uYo7fsV7C8rQmM0hMhOMLDzDysJYVtSgdVuZorzRUwSOWSj5B3A/jLk3AcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4816.eurprd08.prod.outlook.com (10.255.112.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 05:45:20 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 05:45:20 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: [PATCH v2 0/4] drm/komeda: Enable CRTC color-mgmt
Thread-Topic: [PATCH v2 0/4] drm/komeda: Enable CRTC color-mgmt
Thread-Index: AQHVf/cRaSCszxE5iUaQkwz7EKs12Q==
Date: Fri, 11 Oct 2019 05:45:19 +0000
Message-ID: <20191011054459.17984-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0011.apcprd03.prod.outlook.com
 (2603:1096:203:2e::23) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 269b5ff4-a794-4271-cd28-08d74e0e3d59
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4816:|VE1PR08MB4816:|AM0PR08MB4563:
X-MS-Exchange-PUrlCount: 3
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB4563B2A46D16C2C82ABFC0A1B3970@AM0PR08MB4563.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
x-forefront-prvs: 0187F3EA14
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(199004)(189003)(4326008)(2201001)(2171002)(86362001)(2906002)(103116003)(36756003)(6512007)(1076003)(316002)(110136005)(81156014)(81166006)(8936002)(6436002)(54906003)(99286004)(50226002)(6306002)(305945005)(7736002)(8676002)(3846002)(6116002)(5660300002)(52116002)(6486002)(66476007)(6506007)(386003)(66556008)(966005)(66446008)(64756008)(14454004)(186003)(14444005)(256004)(26005)(102836004)(71200400001)(2616005)(476003)(486006)(66946007)(55236004)(25786009)(71190400001)(2501003)(66066001)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4816;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: xnvdI4j8N6+ek0kDj/6enfPQtiL80Gotqv4FKyPeI974DIYN3i7DQ0HwqENN62SkDAu4ChPkFiRGUxQYflLvoIs3eTp8Wa8Qu+NJVJ1m/nuyOiEkarlNQFF0RGfPWF03bsE8NKo1qmbd1H7lRAThL1LM7eQXKX5wAs+AkX0i8LVip1r8+edNZFrbbxVWBI2lqX2nRYp3c04hSs3rNKCMXYECOpIjm4no8BGNg0s22wOc0n66haaYAj/U6UGdo/f2StrlGu6SvGSM88bBWGoDlaucAogpP4nJRpKyZKEtV5tx90Wii3SFroQm0VtFiBr7/3kFyyRXjTF+ahEem3JfCmP5LqykGIZ3tjI12ScgmmapEFQCe+awOJau6GKFY2xqlMwkhZi5IUKvt0o/rgxQmpOxOYNgPAQ2YmeAl1CERBeMwPX4VlLWCeNOXj0bNyZK5OaejQ0W5TI0V7Av4hTWQw==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4816
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(136003)(189003)(199004)(2171002)(6306002)(6512007)(8676002)(50466002)(25786009)(356004)(6486002)(1076003)(76130400001)(47776003)(22756006)(7736002)(305945005)(110136005)(54906003)(70206006)(66066001)(386003)(2501003)(316002)(14454004)(86362001)(26826003)(99286004)(2906002)(36756003)(6506007)(126002)(966005)(103116003)(486006)(14444005)(36906005)(102836004)(8936002)(8746002)(81166006)(3846002)(81156014)(4326008)(23756003)(70586007)(50226002)(476003)(478600001)(6116002)(186003)(63350400001)(5660300002)(2616005)(26005)(2201001)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4563;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 70506e76-8f38-4749-d321-08d74e0e3368
NoDisclaimer: True
X-Forefront-PRVS: 0187F3EA14
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WdjNq4psf0JYQt+A7t4OeFOXwl0Tq8GUlgmVr54UnJ4weIJ4W0Fr5X4CN/dF8Ku4xjCW1Y/NM4/QESIFChd3vzyPaaJRUaOWYnKdkdqcQY4uHDXHLf1EgNnuNcaH5elScoQiYAJvCDQywrXux6BnLooShjP06zDU5xo4atW8EW0K8qNclqUZFDm+GtS8r2bQE0UfQmCnXqkEfcHfgWFyrUkJEHlR5irY17TNUJoa019tuF1b9pA+sHCq4pniws8KxNRp3AHBoE8AH/9H8Mo/sw0UKfsIHC0bZQbV3Sm+rZzx77VI7z7u/A0hxvOLUDobnJbvdiljB5Vk/47XN4nYnV+2DdEugTe+WtIeQXPsT4f+R5DiLqznSvWy+5ssUegelEJOm3ybw2659OW9+rZx66bwZih0087seqLmJDfR0Nbe11xR9CO4tf2Cev2DyAtO3Q+J9F7me7miWwXDWYy4Eg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 05:45:36.1318 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 269b5ff4-a794-4271-cd28-08d74e0e3d59
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4563
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3exUIpO43eg+isG5bikJNfuF7PWKS/F5BOA9HkurNU=;
 b=Cx6QLADbRPY5lNWIYeLS1CFys9z3izxennI/uI1nv6lRTE4zWtcb79FBftlxFjvtzd5BUjavW14AcZBcdnsGPPnitoAUmx8tFKrLt2MheaRvmj995E2jfBA1F9C6uA1y68lplQpooB+y3zY1Kt/gKahZW50lQHo/gDdvBA4WH3g=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3exUIpO43eg+isG5bikJNfuF7PWKS/F5BOA9HkurNU=;
 b=Cx6QLADbRPY5lNWIYeLS1CFys9z3izxennI/uI1nv6lRTE4zWtcb79FBftlxFjvtzd5BUjavW14AcZBcdnsGPPnitoAUmx8tFKrLt2MheaRvmj995E2jfBA1F9C6uA1y68lplQpooB+y3zY1Kt/gKahZW50lQHo/gDdvBA4WH3g=
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

VGhpcyBzZXJpZXMgZW5hYmxlIENSVEMgY29sb3ItbWdtdCBmb3Iga29tZWRhIGRyaXZlciwgZm9y
IGN1cnJlbnQga29tZWRhIEhXCndoaWNoIG9ubHkgc3VwcG9ydHMgY29sb3IgY29udmVyc2lvbiBh
bmQgZm9yd2FyZCBnYW1tYSBmb3IgQ1JUQy4KClRoaXMgc2VyaWVzIGFjdHVhbGx5IGFyZSByZWdy
b3VwZWQgZnJvbToKLSBkcm0va29tZWRhOiBFbmFibGUgbGF5ZXIvcGxhbmUgY29sb3ItbWdtdDoK
ICBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzYwODkzLwoKLSBkcm0v
a29tZWRhOiBFbmFibGUgQ1JUQyBjb2xvci1tZ210CiAgaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3Nlcmllcy82MTM3MC8KCkZvciByZW1vdmluZyB0aGUgZGVwZW5kZW5jZSBvbjoK
LSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzMwODc2LwoKTG93cnkg
TGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSAoMSk6CiAgZHJtL2tvbWVkYTogQWRkcyBnYW1tYSBh
bmQgY29sb3ItdHJhbnNmb3JtIHN1cHBvcnQgZm9yIERPVS1JUFMKCmphbWVzIHFpYW4gd2FuZyAo
QXJtIFRlY2hub2xvZ3kgQ2hpbmEpICgzKToKICBkcm0va29tZWRhOiBBZGQgYSBuZXcgaGVscGVy
IGRybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24oKQogIGRybS9rb21lZGE6IEFkZCBkcm1fbHV0
X3RvX2ZnYW1tYV9jb2VmZnMoKQogIGRybS9rb21lZGE6IEFkZCBkcm1fY3RtX3RvX2NvZWZmcygp
Cgp2MjoKICBNb3ZlIHRoZSBmaXhwb2ludCBjb252ZXJzaW9uIGZ1bmN0aW9uIHMzMV8zMl90b19x
Ml8xMigpIHRvIGRybSBjb3JlCiAgYXMgYSBzaGFyZWQgaGVscGVyLgoKIC4uLi9hcm0vZGlzcGxh
eS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyAgICB8IDI0ICsrKysrKysKIC4uLi9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuYyAgICB8IDY2ICsrKysrKysrKysrKysrKysr
KysKIC4uLi9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuaCAgICB8IDEwICsr
LQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgIHwgIDIgKwog
Li4uL2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmggIHwgIDMgKwogLi4u
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jICAgIHwgIDYgKysKIGRyaXZl
cnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jICAgICAgICAgICAgICB8IDIzICsrKysrKysKIGlu
Y2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmggICAgICAgICAgICAgICAgICB8ICAyICsKIDggZmls
ZXMgY2hhbmdlZCwgMTM1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCi0tCjIuMjAuMQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
