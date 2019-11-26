Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F92A109EE8
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:16:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945AD6E358;
	Tue, 26 Nov 2019 13:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00075.outbound.protection.outlook.com [40.107.0.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940DE6E353
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:29 +0000 (UTC)
Received: from VI1PR08CA0168.eurprd08.prod.outlook.com (2603:10a6:800:d1::22)
 by DB6PR0802MB2423.eurprd08.prod.outlook.com (2603:10a6:4:99::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.22; Tue, 26 Nov
 2019 13:16:27 +0000
Received: from VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::202) by VI1PR08CA0168.outlook.office365.com
 (2603:10a6:800:d1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:27 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT031.mail.protection.outlook.com (10.152.18.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:26 +0000
Received: ("Tessian outbound 37db47aaea47:v33");
 Tue, 26 Nov 2019 13:16:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e6da36db19957cc3
X-CR-MTA-TID: 64aa7808
Received: from c5906a3ff2ed.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 02DED840-D516-4059-A031-C07723D36163.1; 
 Tue, 26 Nov 2019 13:16:21 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c5906a3ff2ed.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EK5EOG0pXrOMdH44icjcy96SrlhhNeDB5sxHSqnhQvtldaw4hAZkrn3dofB7QA2ZdaeFnoi+GqtMU0ZoUBUGwS7BRlpZjmZh16JWv92FL5jrWV7+U8vbcAnm7Vj3TcxbEvlqTn/86VTXGC1GFVmk7bMjtycOFwW9E6hgc1r6Fsur7Ol/ReUALU2GVODipjpRwU+cpZWdsydd0m45VSMbKnkajO1jll6S+d3Ylx3TsCP8HQDJ4nxkO33d896fQaGJcotaA3+uSQ6Gsal8K+s/RJOMc5WL/Cxcaggi3xyfnVTLqa2L2LreilcO08XpVwA8wYrWZekFNmQw0CDeU/52Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Av9EoDIvHqCagseLb7iy4+qbCZH7UsR3146DKkdXRfQ=;
 b=I25MAtieLPrp6wSy9Jlmu9aPZg/I7A9FBLjEzoFoN0TOfq1xjhP1GOBC7+cYMj1FLNmZ2oCyxOtHb1EOOWumfN+LtZzdJr+uLb+ogM3yLsqKyNjAVwc+8Ojh2sYoXULbgDi3qXUv7YuHQdr0vAaLpN7u14ETBLZTBzja5O3e+bdQwG25zZWBMcDkiQ+qqiGgVnOSb1KClTV4CDjrin37yqWn3S3u1X7Y6Ga5bgPWzHL+Vr8gTThSBItBS2Hxyq6wt6ADoI0bi+vjogn9Quov7xwURxYq7Htj16v/o/joYsopY0SE85YelTbqAIotOnav45Svx4SL1QgD6bJEiARE/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:19 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:19 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 21/30] drm/bridge: ti-tfp410: Use drm_bridge_init()
Thread-Topic: [PATCH 21/30] drm/bridge: ti-tfp410: Use drm_bridge_init()
Thread-Index: AQHVpFuxc2cQozE9BUes8TaR0hE2Hw==
Date: Tue, 26 Nov 2019 13:16:19 +0000
Message-ID: <20191126131541.47393-22-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 111b1aff-f966-4997-1fd4-08d77272d7ac
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|DB6PR0802MB2423:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0802MB2423D5A02E6DA32C59D605F98F450@DB6PR0802MB2423.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:324;OLM:324;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(1496009)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(5640700003)(86362001)(6512007)(71200400001)(2616005)(6486002)(71190400001)(2906002)(4326008)(6916009)(44832011)(446003)(11346002)(54906003)(66946007)(316002)(66446008)(64756008)(66556008)(66476007)(6436002)(4744005)(8936002)(186003)(26005)(5660300002)(102836004)(305945005)(14454004)(25786009)(99286004)(81166006)(50226002)(478600001)(2501003)(7736002)(6116002)(2351001)(76176011)(1076003)(52116002)(66066001)(256004)(8676002)(81156014)(6506007)(3846002)(386003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4317;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ndO50CM+l0GKhxxnyxeuSVrebYpXs7pRiFDM2XisV1lGK7tpLoiL4bxxZVixbGic7EQ5tdQ/vGPWEluQYp5c9WAj7/8N3MfOU7L9+yrqQ5zUUH7p2PQcJ1GpVHdECyrkan9g+INvH4qLankKbF5a3x5udUdd9t1b2Mfds3kkqTtC9Mx3Igz2xEytMYZnHphELyVpPOVnHfU/VX4NKPg9hx2BbMxuurn+wTcOanYOjpsvcKEW2bmHSKBwb9mmMf7WGYk5462o85H5fsnCOdXvzlgDTnJVxxeab7K1Hj+fKYFuANN+TsKWO3uZCFQrMyVKeOFVoeH0f8xUhCio1CGI0UL8wy7741ub+G8Be8yNXBpEeouHsLzl/hh6yzzg4jd5MTDJnAiCCMXX8n+nZDTyx3s0/gpNDS2AlZTIfU4vbPr3WR5S5L6jbTiTNNBArQcA
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(136003)(396003)(189003)(199004)(2906002)(6116002)(3846002)(47776003)(86362001)(107886003)(66066001)(356004)(2501003)(14454004)(6916009)(2616005)(336012)(446003)(1076003)(11346002)(36756003)(6512007)(26005)(8746002)(8936002)(316002)(106002)(478600001)(2351001)(54906003)(102836004)(186003)(50226002)(386003)(26826003)(305945005)(6506007)(6486002)(4744005)(99286004)(76176011)(7736002)(50466002)(70206006)(22756006)(76130400001)(81156014)(5660300002)(4326008)(8676002)(70586007)(81166006)(5640700003)(23756003)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0802MB2423;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 388bcad2-3892-475c-c12b-08d77272d366
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NUV/XhA9kKmGpv5GpdzQRo4J1J/g5G7ne4ETgsOgQm/NpoUm9Tvu862Bn9/DZyEHHXvsWzAfmaJP72KMgrPTLvqoxMO/UAhlsIh/VEFtRMoTAWlVFXzzPEZg8OBpKbVrv/1heZTndAy0kJxCwI0Pa+jLDUwt9eaNxMJKQc+qfmKX4VZLV2gU+eWPar2TqiO7LdeD1XLfNyxUiBE4ktLlymvd6IuqAZsCf44xUPwPlQT/RRkmDdDsYNS9F68dmXMR8HSDT1m3cNkZ6WagHIMEV36C0a0Eeof0GNT/k7vDIuGr6teDSR+Pq5xi3UeEyrGzQ9EgTVJlIW/frVMkOGuwXmaU4tFDi2DDciQ9kuSbeimJZ+i/GeRX18Dgfr9yNxUyGHhtDpaGz8w9bbswC6+xCjjaUow/zHi/BMH69clnn22/6s+F312yEqeNhE70IxLZ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:26.5143 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 111b1aff-f966-4997-1fd4-08d77272d7ac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2423
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Av9EoDIvHqCagseLb7iy4+qbCZH7UsR3146DKkdXRfQ=;
 b=Zzhab33ACIG0b7lKAjD43tk6xVONdeMKIZUlh3BvSC63pSH5lGegjHFfvhN2GBSkXmueGAR3VuVXa78QJQ+neBIwJnlD5xtdEuFVbsl1oSGZB75OvZiMq5slqCqyL3QkEA8H4l5iMAsU0U/dIHGJXeBLtFuEmEkKC/ErCdpbQ/Q=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Av9EoDIvHqCagseLb7iy4+qbCZH7UsR3146DKkdXRfQ=;
 b=Zzhab33ACIG0b7lKAjD43tk6xVONdeMKIZUlh3BvSC63pSH5lGegjHFfvhN2GBSkXmueGAR3VuVXa78QJQ+neBIwJnlD5xtdEuFVbsl1oSGZB75OvZiMq5slqCqyL3QkEA8H4l5iMAsU0U/dIHGJXeBLtFuEmEkKC/ErCdpbQ/Q=
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
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10
ZnA0MTAuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAu
YyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMKaW5kZXggYWEzMTk4ZGM5OTAz
Li4zNzdlY2E5ODlmZjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZw
NDEwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYwpAQCAtMzI4LDkg
KzMyOCw4IEBAIHN0YXRpYyBpbnQgdGZwNDEwX2luaXQoc3RydWN0IGRldmljZSAqZGV2LCBib29s
IGkyYykKIAkJcmV0dXJuIC1FTk9NRU07CiAJZGV2X3NldF9kcnZkYXRhKGRldiwgZHZpKTsKIAot
CWR2aS0+YnJpZGdlLmZ1bmNzID0gJnRmcDQxMF9icmlkZ2VfZnVuY3M7Ci0JZHZpLT5icmlkZ2Uu
b2Zfbm9kZSA9IGRldi0+b2Zfbm9kZTsKLQlkdmktPmJyaWRnZS50aW1pbmdzID0gJmR2aS0+dGlt
aW5nczsKKwlkcm1fYnJpZGdlX2luaXQoJmR2aS0+YnJpZGdlLCBkZXYsICZ0ZnA0MTBfYnJpZGdl
X2Z1bmNzLCAmZHZpLT50aW1pbmdzLAorCQkJTlVMTCk7CiAJZHZpLT5kZXYgPSBkZXY7CiAKIAly
ZXQgPSB0ZnA0MTBfcGFyc2VfdGltaW5ncyhkdmksIGkyYyk7Ci0tIAoyLjIzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
