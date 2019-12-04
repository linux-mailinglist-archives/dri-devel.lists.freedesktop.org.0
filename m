Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59249112A7E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:48:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D616E8CE;
	Wed,  4 Dec 2019 11:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30059.outbound.protection.outlook.com [40.107.3.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD806E175
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:48:16 +0000 (UTC)
Received: from VI1PR08CA0162.eurprd08.prod.outlook.com (2603:10a6:800:d1::16)
 by AM6PR08MB3144.eurprd08.prod.outlook.com (2603:10a6:209:48::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.21; Wed, 4 Dec
 2019 11:48:13 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::204) by VI1PR08CA0162.outlook.office365.com
 (2603:10a6:800:d1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:13 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:13 +0000
Received: ("Tessian outbound a8ced1463995:v37");
 Wed, 04 Dec 2019 11:48:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6d6903a92b05bcc9
X-CR-MTA-TID: 64aa7808
Received: from b2b246179d1c.6
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1C65C39C-92E1-4B29-9DE1-4CFDFB0AA921.1; 
 Wed, 04 Dec 2019 11:48:07 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b2b246179d1c.6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OqpCeYv+pC8Wv75GQIgMx8N8gYEQocqMdEvU/R5jaXFbhaRpDYhfgjhkQmIb4VjienVOcnyhisEBqPlO+CirqGTcKEFDKyvhGNeSpv9PK2gtXuKFlNKVYxDyZBHkn0i5XeLa4MHQtttGXShHBrWtgap7isims0Wg6VDzI3M1hNFt5oLBYY5MRaGjeBYDuiWhxaAJw/qwULARso3MF1FJ9sybZ+9vCa4Vs/fNEGMirb9sLfmk0kjkzAuI7q33wGjqRovAQbVYZPUvett1hFaH/gShr0mANlGeEAS9RonkZF8ZaktqwphDAL0CD1nsYcm/Z+lpDF5iRcTuhW5JvUU4TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdtA94mAshVXUemmMQnmXJ2MlYnOXP7KGT14dEW+wMo=;
 b=Zvai6gVyBwfFpTEFfB0qAu1JqqAn4B9SyOYngFsyg9RhJKHc4nARd+ABArxqlqd7h+oT8VqJULb9ay2xHH/8irslpeNoVVsAd1DMw5HVMmPzLQdiQSkGWeCO4plhxSELSCnHK9ve3oc06Ont9eutZF1HsUOKkuUD7Xny6nlj3OaPafs0av7gH9Gs4F3Rtmy1arJVjjilJokhN+LVV5Ln4My3yCB2/2se1HP77Wp8txvQSRbuKE1k57ZO14jboV7GWJzp+vhD4hZ2HUy3CnhKMk5J2cY1FrBS4QcmzWTUnPrRcgfNKl/j9X+H+OsN19QRNjI8l2CxtuLQ37XprVNRQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3085.eurprd08.prod.outlook.com (52.133.15.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Wed, 4 Dec 2019 11:48:05 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:05 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 04/28] drm/bridge: cdns: Use drm_bridge_init()
Thread-Topic: [PATCH v2 04/28] drm/bridge: cdns: Use drm_bridge_init()
Thread-Index: AQHVqpiwW/k2p/w8QUKECC27jnK8Tg==
Date: Wed, 4 Dec 2019 11:48:05 +0000
Message-ID: <20191204114732.28514-5-mihail.atanassov@arm.com>
References: <20191204114732.28514-1-mihail.atanassov@arm.com>
In-Reply-To: <20191204114732.28514-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LNXP265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::19) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d4278031-11f4-43fd-7566-08d778afd80c
X-MS-TrafficTypeDiagnostic: VI1PR08MB3085:|VI1PR08MB3085:|AM6PR08MB3144:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB314475B410FE477DB8EB89C38F5D0@AM6PR08MB3144.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:669;OLM:669;
x-forefront-prvs: 0241D5F98C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(199004)(189003)(2501003)(1076003)(478600001)(4744005)(6436002)(6512007)(8936002)(6486002)(54906003)(44832011)(4326008)(316002)(50226002)(8676002)(5660300002)(2906002)(81156014)(81166006)(6116002)(3846002)(66946007)(66476007)(66556008)(66446008)(64756008)(11346002)(186003)(2616005)(14454004)(52116002)(76176011)(99286004)(2351001)(25786009)(86362001)(26005)(5640700003)(6916009)(102836004)(71200400001)(305945005)(7736002)(71190400001)(6506007)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3085;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: PNvEq7imDomNeIWunAfEN2y9iqsit1BitK0C75mETaqlLBQj0rgKQgA8DQXYRwQGQM639RCdlWmxUCsoGW4bdczbWGJWrGNIYazlMtaoHW2KS6Q0SOhuFm/Ze05LdUkweiYOWdXhoXZ/GNR6oS12i6hSM6YgUtRwj+6gsFemEoWjqM92EffLfi6Qyz5FSGHhakuYtH1knxFxAe7O+W4Xm02RPgPj3XVdwLwGIyjS+jCEFLrSdXL2jvnUj7N25e19IZlOkFc6xrXuN/f6EpW5vlXJHixEFDOT/c2ryX8WOKXcw7M3ShYfh7kKzK5dWTIrVMfz6isYQQvAinjBb3EmDfFObL9owi8tSbmLv+f2pP3aLEiOsUinYrLvW/h3LocqFfP3aDUH9/MmRSM8lJ5uyi5vHKOXsMuyKygTyASOOLBsdji5Zc/cMErImCA2Dv4P
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3085
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(39860400002)(136003)(199004)(189003)(8676002)(356004)(2616005)(107886003)(7736002)(186003)(54906003)(11346002)(336012)(76176011)(25786009)(8936002)(8746002)(50226002)(1076003)(305945005)(6512007)(102836004)(26005)(2906002)(22756006)(81156014)(4744005)(6506007)(81166006)(6486002)(76130400001)(316002)(36906005)(3846002)(36756003)(70206006)(5640700003)(2501003)(4326008)(70586007)(99286004)(6916009)(23756003)(14454004)(26826003)(86362001)(2351001)(5660300002)(6116002)(50466002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3144;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: d668845e-e3b3-4ca4-2684-08d778afd331
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5JVhq/OxhgZ3aOQDiCZKtpDqwtCnC6pFPSc42DJQyXVaEMQBqQDlfQUiQYgt/o85HHLbbdNkMsdHai/kx6s76+DC3S6sFintJifmpSwrrW0J5JUJOL2cagMmdwgRvuwSDI3qX6Fhqm2yzrVVIcV5CE1QWI94C1FRbfhORQkGj1M4qogAyCpEmXUkSYmkkEHDt/EICRxO145kWqpWe8zELJEPOMS0wlbmjrfk8qTVct31KbysI7FATnJ/w940ljsXxB7amrE1NybLm1Bw9cC9gF2a3EffZ/CCkxlTW0MRCX11J9Y995/ZBdtqn8Jix7qhGupkE3GRaDAVElusA8KvSqJvpdfw9iHUFi9qGDF0gT9qHMCuZtDKLSvhisHCPhyqrBiCviRmbB3uOZVYkao8CEboCOKLBmjMB6GUtol5bsOXOraxMs44kcCEHCrwr0xU
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:13.4969 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4278031-11f4-43fd-7566-08d778afd80c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3144
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdtA94mAshVXUemmMQnmXJ2MlYnOXP7KGT14dEW+wMo=;
 b=wDTcT+GiRb3Rjto8H9ONU/TWpWcdFlyoy4D99uhWgnSPQ03ACzUoCsj+whvfJPSrW/8g9r8QXZt6pp3p4nLOfJf9CaW2kd5Vy7CYIs+75NS+JL/Jw8XqmTVn/M0bExrFuIYoy14Wm3fhdaGc6gmptX6t/ElRJ72UFQaF2GRmp3I=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdtA94mAshVXUemmMQnmXJ2MlYnOXP7KGT14dEW+wMo=;
 b=wDTcT+GiRb3Rjto8H9ONU/TWpWcdFlyoy4D99uhWgnSPQ03ACzUoCsj+whvfJPSrW/8g9r8QXZt6pp3p4nLOfJf9CaW2kd5Vy7CYIs+75NS+JL/Jw8XqmTVn/M0bExrFuIYoy14Wm3fhdaGc6gmptX6t/ElRJ72UFQaF2GRmp3I=
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
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jZG5z
LWRzaS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvY2Rucy1kc2kuYyBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvY2Rucy1kc2kuYwppbmRleCAzYTViZDRlN2ZkMWUuLjU4
YjJhYThiNmMyNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jZG5zLWRzaS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvY2Rucy1kc2kuYwpAQCAtMTIzMyw4ICsxMjMz
LDggQEAgc3RhdGljIGludCBjZG5zX2RzaV9kcm1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKIAkgKiBDRE5TX0RQSV9JTlBVVC4KIAkgKi8KIAlpbnB1dC0+aWQgPSBDRE5TX0RQ
SV9JTlBVVDsKLQlpbnB1dC0+YnJpZGdlLmZ1bmNzID0gJmNkbnNfZHNpX2JyaWRnZV9mdW5jczsK
LQlpbnB1dC0+YnJpZGdlLm9mX25vZGUgPSBwZGV2LT5kZXYub2Zfbm9kZTsKKwlkcm1fYnJpZGdl
X2luaXQoJmlucHV0LT5icmlkZ2UsICZwZGV2LT5kZXYsICZjZG5zX2RzaV9icmlkZ2VfZnVuY3Ms
CisJCQlOVUxMLCBOVUxMKTsKIAogCS8qIE1hc2sgYWxsIGludGVycnVwdHMgYmVmb3JlIHJlZ2lz
dGVyaW5nIHRoZSBJUlEgaGFuZGxlci4gKi8KIAl3cml0ZWwoMCwgZHNpLT5yZWdzICsgTUNUTF9N
QUlOX1NUU19DVEwpOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
