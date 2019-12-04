Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CB8112A90
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:48:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36856F46B;
	Wed,  4 Dec 2019 11:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150050.outbound.protection.outlook.com [40.107.15.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5043F6E8DD
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:48:33 +0000 (UTC)
Received: from VE1PR08CA0012.eurprd08.prod.outlook.com (2603:10a6:803:104::25)
 by DB6PR0801MB1942.eurprd08.prod.outlook.com (2603:10a6:4:75::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13; Wed, 4 Dec
 2019 11:48:30 +0000
Received: from DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::203) by VE1PR08CA0012.outlook.office365.com
 (2603:10a6:803:104::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:30 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT048.mail.protection.outlook.com (10.152.21.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:30 +0000
Received: ("Tessian outbound 691822eda51f:v37");
 Wed, 04 Dec 2019 11:48:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e66cdd9bd9eea70f
X-CR-MTA-TID: 64aa7808
Received: from cee6bfb0cd5a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 777A467F-22C9-4DD3-BBE5-9F6B3BC039EE.1; 
 Wed, 04 Dec 2019 11:48:16 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cee6bfb0cd5a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ffq7qRuoNNe85BzJrfbPOhggkt58RN8Xz/8fEwKHpR/d70NV5U9ruC5rK0HzKov5OjbSsYOW39z9YJyhJj3O8Kzld7+MhlCUW8mwX7pO+nCnzjlDpPa5PjZDxMgPVYbjpwd2h9HZZ8NrxV0CqW7l78WXy36tvfGV5IDbkeDPQiF2NoMJN8VinMveDqzvkp9nmafswXVRdb4TvADDCTJz/OA2yY4UdLVUyeHgyppre4tUjuagDwcahkjviA1KuTdJa6OId5S0zhSUfG5c+lrItqp2J3QOrmEWy/7MPOJ72HZcWhxlaiAATIDWtSkAogHrMdIaIEO63k8RQTwTro0BuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vilsu5jMSNUi3GIXJ8OzL1XJBLxVssM7Swc8d5oAicw=;
 b=H2vkkwa8s24Ngq3TT7KzaKLeIR4NTJrmCsGyCtRL4ZG82dXfnNUwZGttn1hGIq4EE/YxWYbRaN1GzOMqa0ItfoU1ijbFVxQKpo1i1aJK+V3xysO+q56rcd3katfsCplHRi+sSD4ushvtUE6/Uzaa1aM0vc6OGypnulxi618IJD6jJvTvgB0FCj2PkEH4ssFGa8asUpw1KMseP7bIN11dCijeaTPzOm/vvykb1B2aWDy/D0DFLozJuIsAwOiUCurt39uwQiJuk5bq5gB5ubROgII3ppo8Gn6PBe4V+vpXmWnGVFt95ch4zrv3cUZ6uX8HkJe1b2Fx3cjakit9320/3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3085.eurprd08.prod.outlook.com (52.133.15.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Wed, 4 Dec 2019 11:48:14 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:14 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 14/28] drm/bridge/synopsys: dw-hdmi: Use drm_bridge_init()
Thread-Topic: [PATCH v2 14/28] drm/bridge/synopsys: dw-hdmi: Use
 drm_bridge_init()
Thread-Index: AQHVqpi2+tPFYpee1UK43mAvBMAzdw==
Date: Wed, 4 Dec 2019 11:48:14 +0000
Message-ID: <20191204114732.28514-15-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7dcd65c3-b314-48c4-b4e4-08d778afe21b
X-MS-TrafficTypeDiagnostic: VI1PR08MB3085:|VI1PR08MB3085:|DB6PR0801MB1942:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB1942E3C8E18B278B010F35408F5D0@DB6PR0801MB1942.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:176;OLM:176;
x-forefront-prvs: 0241D5F98C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(199004)(189003)(2501003)(1076003)(478600001)(4744005)(6436002)(6512007)(8936002)(6486002)(54906003)(44832011)(4326008)(316002)(50226002)(8676002)(5660300002)(2906002)(81156014)(81166006)(7416002)(6116002)(3846002)(66946007)(66476007)(66556008)(66446008)(64756008)(11346002)(186003)(2616005)(14454004)(52116002)(76176011)(99286004)(2351001)(25786009)(86362001)(26005)(5640700003)(6916009)(102836004)(71200400001)(305945005)(7736002)(71190400001)(6506007)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3085;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 7X9raZhesPa4vWBmDbtMBjSmS+9S3y9DHMxpfVm7gcDnS60H40AFGKeD5l5okTTCZOnn3rz7hSINbTyXUvTTT8Eml3Fz7EfVLdhAh/Ml71840msXhGiC6PlIq8+t0BiiJzMw+CF+HZNIHAtI14Ow4n1kHI9E63oMrW6G6GIHtiaKeScfVQdi/JJc4b3LD4OqoGnRZEEpIpyplVcnFeAqhQgkrqvFjat9IHZwruV7plo7iDbPq3Pfmf/2XlbhRRiGkTxdFRuz43fcU+UufIXkSe/4YRG23nzOB9V2t5LychQDRbE/MyPT+4Dlobf3xTXD+p5pK6vysU8j7Wm5/5lBkvLNyOC8kQdUTr3ycN5EbIh8scplG1d51dcNoNmJTz25ZzxxjghO4b434IgNMl92zbR4pFrtkNu7LGiURfItDEjJxDh1GXh7xXC9njhJxb2f
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3085
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(136003)(396003)(199004)(189003)(2501003)(50466002)(23756003)(86362001)(6116002)(2906002)(22756006)(478600001)(14454004)(3846002)(26826003)(50226002)(81156014)(81166006)(8676002)(305945005)(6916009)(7736002)(8746002)(8936002)(356004)(4744005)(2351001)(5640700003)(6486002)(54906003)(6512007)(4326008)(76176011)(70586007)(99286004)(107886003)(76130400001)(70206006)(36756003)(5660300002)(6506007)(26005)(336012)(1076003)(102836004)(186003)(25786009)(11346002)(2616005)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB1942;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2fa7aed1-e5fa-4da5-86a3-08d778afd870
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3to+sJ6cYfW3/TZR25mF1gtHrGG7+PpaXd8scYSg//q0CHxuv8IEvZMb2VGdsvKmIPLDE5djiu0UljorGU+jZP8s6kBUWNgBpKa1CZTOGHf3Wg7yEFA0IDGNkKrccoBV59fgN4OJX22g5nMz3OW9cmn0i7GxYCoJQDBL2WmhANdRVNJsm1ueOa5z7afdzpiwI+sstkpuT/v621snDbktjot+wvGK5A5jp69MFQ1MOlSkrAU7pRScSjwYIyNwEsgBwK+cml4crHFXj6eIjg8HEwGvNiUr3XY/mciDB7AahWLR8x4Ph4pobhGpcMBu+gXADpq0DefZ1TgRa/vermrEyliPGx4Iap1jDjwcpXAgSUwvjTzaCVF+6ulZ94cq9grCaM7UeasRVzexQrWZPhNal7pzoy0sQiBZkYqRYgAwUg81QwSCEAaORzLokl4kh5Kb
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:30.3760 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dcd65c3-b314-48c4-b4e4-08d778afe21b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1942
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vilsu5jMSNUi3GIXJ8OzL1XJBLxVssM7Swc8d5oAicw=;
 b=R2WcMyjpHFGGnIO9nOrQqTlLV10FDsMiYelxwwCkZYdcBveiyJmwEHrXOSi6EcGu7NlsIdN4GRRK0xe5EHVYxrLEyMg34/ZuIhQE5PGyiEwnRdUknMuosxu+z06gDU1V+X3Cl6sp5aVjzDEhJTKMdwvyCWYiBWWo5yBN/MxzdmE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vilsu5jMSNUi3GIXJ8OzL1XJBLxVssM7Swc8d5oAicw=;
 b=R2WcMyjpHFGGnIO9nOrQqTlLV10FDsMiYelxwwCkZYdcBveiyJmwEHrXOSi6EcGu7NlsIdN4GRRK0xe5EHVYxrLEyMg34/ZuIhQE5PGyiEwnRdUknMuosxu+z06gDU1V+X3Cl6sp5aVjzDEhJTKMdwvyCWYiBWWo5yBN/MxzdmE=
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
 Douglas Anderson <dianders@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Dariusz Marcinkiewicz <darekm@google.com>, nd <nd@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1oZG1pLmMgfCA3ICsrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9z
eW5vcHN5cy9kdy1oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhk
bWkuYwppbmRleCBkYmUzOGE1NDg3MGIuLjZjNzFmZmM5ZGY1YSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKQEAgLTI4OTgsMTEgKzI4OTgsOCBAQCBfX2R3X2hk
bWlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKIAkJCWhkbWktPmRkYyA9IE5V
TEw7CiAJfQogCi0JaGRtaS0+YnJpZGdlLmRyaXZlcl9wcml2YXRlID0gaGRtaTsKLQloZG1pLT5i
cmlkZ2UuZnVuY3MgPSAmZHdfaGRtaV9icmlkZ2VfZnVuY3M7Ci0jaWZkZWYgQ09ORklHX09GCi0J
aGRtaS0+YnJpZGdlLm9mX25vZGUgPSBwZGV2LT5kZXYub2Zfbm9kZTsKLSNlbmRpZgorCWRybV9i
cmlkZ2VfaW5pdCgmaGRtaS0+YnJpZGdlLCAmcGRldi0+ZGV2LCAmZHdfaGRtaV9icmlkZ2VfZnVu
Y3MsCisJCQlOVUxMLCBoZG1pKTsKIAogCW1lbXNldCgmcGRldmluZm8sIDAsIHNpemVvZihwZGV2
aW5mbykpOwogCXBkZXZpbmZvLnBhcmVudCA9IGRldjsKLS0gCjIuMjMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
