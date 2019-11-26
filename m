Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD560109EDE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:16:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD96B6E334;
	Tue, 26 Nov 2019 13:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::61a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EAA6E34C
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:23 +0000 (UTC)
Received: from AM6PR08CA0022.eurprd08.prod.outlook.com (2603:10a6:20b:b2::34)
 by AM4PR0802MB2195.eurprd08.prod.outlook.com (2603:10a6:200:5d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.21; Tue, 26 Nov
 2019 13:16:21 +0000
Received: from AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::205) by AM6PR08CA0022.outlook.office365.com
 (2603:10a6:20b:b2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:21 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT038.mail.protection.outlook.com (10.152.17.118) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:20 +0000
Received: ("Tessian outbound 512f710540da:v33");
 Tue, 26 Nov 2019 13:16:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 14a54b3d4b260c8d
X-CR-MTA-TID: 64aa7808
Received: from 1f05e3404f54.4 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A14B7087-685A-4C15-A8D8-618B226C6238.1; 
 Tue, 26 Nov 2019 13:16:15 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2056.outbound.protection.outlook.com [104.47.10.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1f05e3404f54.4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hg5HC5WqpZBW1W5iW7RgTmYyvLi3EzhqdcVteoTkP5/xjzG6jjSSFMeWhpRlPaZm71bZ01ntdPDblfC1dwLAUXHqMa+CP+N8g9cPrcPKxCmYRbmb1gS5+3Y8KKX9skTme715TEyssbGYjw8ebYykSTsTJbcxcxPj0PGJynW7rb8Fslf1Z2B8UukfyyR/v8DTWfbMRwlY27ztPCzkklrfe+voH1QsLkW8vTxEcTZHuIogrK6qvJWUHbfpEfurOOxdM9yN37vJlFV3oygxBCAcwmeOTsvtLoRuPfu3wYyhhyLxDoDDTdiCtuWU24AJSKDGnyUS5aVmHv/a5vGO1j5cHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vilsu5jMSNUi3GIXJ8OzL1XJBLxVssM7Swc8d5oAicw=;
 b=TU/wxXzc65EkjrwiL42/5l9dk4jHK4ZRy4j269QTSujLHQH+meUL/Nd2tod4dmPf3mi2ovdnHYqceZYKEugvHVED5jODPxhEkWLijyD8d1XtzSNrwwncW21F1aOFYUGHvuJtz47kQ4VNnm8fXZCayPF1kqiET7B6RQmuE84Emw+3VeXnfeK4QVDNf4Q5esPNMr8ifOWbKpaFkcnx3Sel6ZBfnPLTMvcpjxh+BesnpjDRVifjvPmYApnZBtzXa6IVOCw7HJvEinxhwE7UbdgNHmjqKsdaPpBnr3Ml3uYCm9H9j+SgereHOG+2SJTO57NaD2tdTfymkUXa6eV5d/z5CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:14 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:14 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 15/30] drm/bridge: dw-hdmi: Use drm_bridge_init()
Thread-Topic: [PATCH 15/30] drm/bridge: dw-hdmi: Use drm_bridge_init()
Thread-Index: AQHVpFutBY9NvXIj8kOLyzzzKOI9DA==
Date: Tue, 26 Nov 2019 13:16:13 +0000
Message-ID: <20191126131541.47393-16-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: e82555a3-a452-4228-2984-08d77272d44e
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|AM4PR0802MB2195:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM4PR0802MB21956CE672BB244AF37E84F38F450@AM4PR0802MB2195.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:176;OLM:176;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(1496009)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(5640700003)(86362001)(6512007)(71200400001)(2616005)(6486002)(71190400001)(2906002)(4326008)(6916009)(44832011)(446003)(11346002)(54906003)(66946007)(316002)(66446008)(64756008)(66556008)(66476007)(6436002)(7416002)(4744005)(8936002)(186003)(26005)(5660300002)(102836004)(305945005)(14454004)(25786009)(99286004)(81166006)(50226002)(478600001)(2501003)(7736002)(6116002)(2351001)(76176011)(1076003)(52116002)(66066001)(256004)(8676002)(81156014)(6506007)(3846002)(386003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4317;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 2zd+vT0h3SviPrE0eHCowk83FuOxGhECEAs6rMgVcYhXv1PHOItTfHL9b5myzw46+pzLBphmUctKLvvLu1Ih6aglWV785SRBc2vE6eRNhGv1rPcOJC9bcqfZG1uy1gGE31h6/GkDTE7s3lNE/jMbFeTzAqMzisXp+XrNX3ohmyY+0DH5bLY/hs7rTwq1UaOhzQ3+yl1ggQyvD+yjPJ2Go+/rRB0vxToM4JaVfmlsROdb7BxtTbMFETxHjstQ8EzUESTwZmf6k6WHh5o0wQIEicD2SFjnvec+ZczpOJldLHr/IVMUxE73pz0kYJDnK2zknnNAwLMqqgXqrUUawxl4Y3JS9pnjZb82Cbx/aMaQ1qnlNjDJ9JIEGeJuM1+k8P7PRBmfbYaF3LFJM+G3oQxTNJGypXM2oT5hz/DnvnzjVX0blhBZ9VB2sngLCRigeCeJ
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(376002)(189003)(199004)(386003)(6506007)(70206006)(8676002)(26005)(36756003)(102836004)(14454004)(50226002)(81166006)(26826003)(1076003)(4326008)(54906003)(6486002)(336012)(66066001)(36906005)(47776003)(50466002)(316002)(81156014)(76176011)(6512007)(446003)(11346002)(2616005)(23756003)(186003)(25786009)(356004)(3846002)(6116002)(4744005)(6916009)(70586007)(8746002)(86362001)(5660300002)(99286004)(5640700003)(106002)(76130400001)(8936002)(22756006)(2351001)(2501003)(478600001)(305945005)(2906002)(7736002)(107886003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR0802MB2195;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1f4c26f0-fb9a-48ec-f61a-08d77272cfef
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2/D24vIiudVlF8wymvLxtqCQsMdmQSXfDi7HCvPZgilF8ovybIxNn2oaQe0JYmkzKuFasb8+zN9QMiQJxIOgxyE0S+blD4hpkU7eV8qQDSbk0wbNnkntFZirAOEhf8MjYXr2TmsyPQZ5jc2Wxt8vHcTeMxepY1up9lO+lc/WfJlSc/7oUdkk5zkztK9xc9CfkCEwJWxZ4wYRs+Yh4rgSBFVB+j+9ezuSefRVjC6LbWiq/Gxu8F1YruvmnnqVp/us7m+KKquBd7Mx7u1YVrAEMEChA3W4DyfcvyBLTy0cmskSq1jpsyy7+KWQ92I+ndNRWm2O9V257CQDMtnsZuwaI5+1sRGwlMqS/WSCmtSp1NRYHCEB/P9KvmhNyXqUWvKy114dPIZuW46dCG+h3nSiO1HhuJ2Oje5pw9gOY2w7Crs1aWHHmW0BEyUrG9yBUqia
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:20.9344 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e82555a3-a452-4228-2984-08d77272d44e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2195
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vilsu5jMSNUi3GIXJ8OzL1XJBLxVssM7Swc8d5oAicw=;
 b=n6j5qno9iQAUpFoxgICFX2aqCqv76MB6uHcSJscFq5u10lFZ8t46hmHPUkT6XR8WwE/GVKay4mHNrp+pRhEDGRvM5WBLXRQ1XO0DLqaEkj3tOJZYXeYzP0wTmCWijILHT9EXnlYqfJ5k4+lYAXz96df1t9Gb/v9kGwAzFnx49dI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vilsu5jMSNUi3GIXJ8OzL1XJBLxVssM7Swc8d5oAicw=;
 b=n6j5qno9iQAUpFoxgICFX2aqCqv76MB6uHcSJscFq5u10lFZ8t46hmHPUkT6XR8WwE/GVKay4mHNrp+pRhEDGRvM5WBLXRQ1XO0DLqaEkj3tOJZYXeYzP0wTmCWijILHT9EXnlYqfJ5k4+lYAXz96df1t9Gb/v9kGwAzFnx49dI=
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
