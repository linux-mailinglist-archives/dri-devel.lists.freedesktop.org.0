Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0176109EDF
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:16:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5326E34A;
	Tue, 26 Nov 2019 13:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe07::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089CE6E32B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:20 +0000 (UTC)
Received: from VI1PR08CA0167.eurprd08.prod.outlook.com (2603:10a6:800:d1::21)
 by DB6PR0801MB2087.eurprd08.prod.outlook.com (2603:10a6:4:77::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16; Tue, 26 Nov
 2019 13:16:15 +0000
Received: from VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::209) by VI1PR08CA0167.outlook.office365.com
 (2603:10a6:800:d1::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:14 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT031.mail.protection.outlook.com (10.152.18.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:14 +0000
Received: ("Tessian outbound a8f166c1f585:v33");
 Tue, 26 Nov 2019 13:16:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d50e3995147f7ce0
X-CR-MTA-TID: 64aa7808
Received: from 687810ec6074.14 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8B2EC3F5-2F8E-43AF-9D08-FBFB3D31EECF.1; 
 Tue, 26 Nov 2019 13:16:05 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 687810ec6074.14 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QsFnUarmYnR30lUpDJ2zKvZgTqf5Hp5g8HlZ3axlWoxWTZyzQsEXUswYerm7jHSTluOrUBpyUa89yR8/fgCNxJdWhtwn+aJBXE5vQSUX/IsWmpazXnermmlaEIVlFpaXpy8POtk4S4LJZdKhETMFJE5FytnOvjYk6hrkxyi4/PAU8ZZO+nDj0Emvdsp9ZST68wezjQGL6127iOx8z8F2WbR4q9qewydRLt5v2ABuHN+JypyaPGMQJsHFFUWoLW1aEYC9gnYwB0V+cWAu7HZ1KgJbTCWbknpvtIrpee7xAAMsW8E+1L4w3ymqdYR9FodftBCy5PnGKrFlk/zCfu/VCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsj1ZwfMocxMmhXuaRq5ay7fcHZ5bq2hDSJxGG7/gpQ=;
 b=LRodKbJI6dRvC8KiyYU2vtfexTtTuKYzEmsrMFEKEkaOBoEfGQVbxp96SN+aTzXwoelYFNahw175TEDsZdWYsQH4a0jMweVtlbP2QGGZ/Kp9Nbw02ppRo1pPbZOG/yh96kgtT+wSTHS02YxxmMXOo4D8KTZ61/Q/1jdg8xJ+KC1p4urZ7GGE8HVwGRLz6yrawk3KWMkDq/BYcyNOLtRYSwvSZZMtd7Om4fh8E/WJgPD91R+xUlWUnXXGwRQZyjjyPzVqA5zqvhlioEjhfOiSpvyjWL+6ExKWaQXFAy23zO8d5mucazvRcvqvAm+8QUgSW+v8YQ66lkaax04xHsViUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:04 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:04 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/30] drm/bridge: dumb-vga-dac: Use drm_bridge_init()
Thread-Topic: [PATCH 06/30] drm/bridge: dumb-vga-dac: Use drm_bridge_init()
Thread-Index: AQHVpFunvVd9IdaLvkq8Buf75d1N+A==
Date: Tue, 26 Nov 2019 13:16:04 +0000
Message-ID: <20191126131541.47393-7-mihail.atanassov@arm.com>
References: <20191126131541.47393-1-mihail.atanassov@arm.com>
In-Reply-To: <20191126131541.47393-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0453.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::33) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6535f8ac-d37a-486a-d096-08d77272d0b4
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|DB6PR0801MB2087:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB2087DAB61AAD2C1B088DC3C58F450@DB6PR0801MB2087.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:46;OLM:46;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(5640700003)(86362001)(6512007)(71200400001)(2616005)(6486002)(71190400001)(2906002)(4326008)(6916009)(44832011)(446003)(11346002)(54906003)(66946007)(316002)(66446008)(64756008)(66556008)(66476007)(6436002)(4744005)(8936002)(186003)(26005)(5660300002)(102836004)(305945005)(14454004)(25786009)(99286004)(81166006)(50226002)(478600001)(2501003)(7736002)(6116002)(2351001)(76176011)(1076003)(52116002)(66066001)(256004)(8676002)(81156014)(6506007)(3846002)(386003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4317;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: J9ToH+3qHLnxdOwX9CZA9rKmsXO6+evl51q4zjLdNcDKHrhIRYssK7ccZF8qIZ/A+ze6TJf07uJF1gEBwCALL85HlusXEv1OmJbqcvx2V4uUBdaw9J3m0HtXpW4Dg9oQNtCNUvabiZx/D34LYLqTHGgTr9IQjyuIeBE4GKIZsZTsWq30NqG1fsXNIBZ6fNYhq1tVmUX7/hSkLoWQ6fk21475Xjo/y2glB8bGZLBj9kth7yf66HiX3JtWe0FgBQ0qiihF/ahMouetuSIqeQkglP2NSYvDgdD1llvYqQVxfNcXtiu6CNxMu+lvIRVdQ8bR49iht7wW8Z44KtmVyoyTmUA2wFjVZFHiNIW9/DDDvBbtmk0R+krhscPdk6SYGWQURdD2pZddvqGpflGeSuA61vr0H4HCKennm/1Czt10njnCJJHGVagQ7LmWXT2BGLwe
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(376002)(396003)(189003)(199004)(8746002)(36906005)(446003)(54906003)(5660300002)(26005)(8936002)(2616005)(186003)(6512007)(50226002)(76176011)(86362001)(7736002)(107886003)(6486002)(99286004)(316002)(36756003)(50466002)(356004)(47776003)(66066001)(305945005)(6506007)(386003)(6916009)(106002)(3846002)(2351001)(2501003)(22756006)(2906002)(336012)(1076003)(4326008)(70206006)(81166006)(70586007)(81156014)(14454004)(11346002)(5640700003)(8676002)(102836004)(76130400001)(478600001)(4744005)(23756003)(26826003)(25786009)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB2087;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: dde9866e-7058-470e-4971-08d77272ca46
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V4j5Z1ra3QyVAbUh8H7bK19j/N6xhBtJzYJ18kXLzJ/igIJJVJ+VhGavfc02nyzZIQ1XDdgE0TdoTwJBoa1qdE6sYRf4+Q4/0XChOMu1YgDug22K7ffUANuD0K0B/j+dAP4uYtUVc+ITMdTfee15rj9tV8fhwtDX2g8LpfMWVacUfDs7aF9505bzhuIQfwrq0K8st8q2kWUkmYTv7R6iXk2kGF7ym/gAaIoV/BfvB1pKrtXHSeVM0Gyx67KYPa13lz8Ln+L5NoRasjcYQ1YdmEFr+CR2aHXW4+FSqvLmasXEybaXV61zjghDxhIuv0KRBILcPB9Q5jQzSvpUsmTqz3EmsheK646ppRCwwOluAUQyHVVdgxE6K3wB4RKDLJYa5+2z+S9XPT1dj1XRhL9dmVAc8Fw8XVtgDBMCr5S4Y0LpBes9c9/MRzwAB1mKfAbS
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:14.8292 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6535f8ac-d37a-486a-d096-08d77272d0b4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2087
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsj1ZwfMocxMmhXuaRq5ay7fcHZ5bq2hDSJxGG7/gpQ=;
 b=MoOxntQ9NBrdex9YXgZ/fvjvXPv3EvezXcm9Q1NG1a1f63nJAx7PrDeOPmlxausWAUT7zEW05BswiKzxhxnhOignJmRolEUPT/lbuhgvdF81e0uVOUsYptKzJ7OE8DHEe6VwFN+3S+vtHutm8UOIfVK1xUo5+1PMgPHt5q02j9w=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsj1ZwfMocxMmhXuaRq5ay7fcHZ5bq2hDSJxGG7/gpQ=;
 b=MoOxntQ9NBrdex9YXgZ/fvjvXPv3EvezXcm9Q1NG1a1f63nJAx7PrDeOPmlxausWAUT7zEW05BswiKzxhxnhOignJmRolEUPT/lbuhgvdF81e0uVOUsYptKzJ7OE8DHEe6VwFN+3S+vtHutm8UOIfVK1xUo5+1PMgPHt5q02j9w=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9kdW1i
LXZnYS1kYWMuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvZHVtYi12
Z2EtZGFjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2R1bWItdmdhLWRhYy5jCmluZGV4IGNj
MzNkYzQxMWI5ZS4uODk2ZjI3MjcyZTM4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2R1bWItdmdhLWRhYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvZHVtYi12Z2Et
ZGFjLmMKQEAgLTIwNSwxMCArMjA1LDggQEAgc3RhdGljIGludCBkdW1iX3ZnYV9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQl9CiAJfQogCi0JdmdhLT5icmlkZ2UuZnVuY3Mg
PSAmZHVtYl92Z2FfYnJpZGdlX2Z1bmNzOwotCXZnYS0+YnJpZGdlLm9mX25vZGUgPSBwZGV2LT5k
ZXYub2Zfbm9kZTsKLQl2Z2EtPmJyaWRnZS50aW1pbmdzID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9k
YXRhKCZwZGV2LT5kZXYpOwotCisJZHJtX2JyaWRnZV9pbml0KCZ2Z2EtPmJyaWRnZSwgJnBkZXYt
PmRldiwgJmR1bWJfdmdhX2JyaWRnZV9mdW5jcywKKwkJCW9mX2RldmljZV9nZXRfbWF0Y2hfZGF0
YSgmcGRldi0+ZGV2KSwgTlVMTCk7CiAJZHJtX2JyaWRnZV9hZGQoJnZnYS0+YnJpZGdlKTsKIAog
CXJldHVybiAwOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
