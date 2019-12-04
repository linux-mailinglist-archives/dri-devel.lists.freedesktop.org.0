Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD578112A95
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:48:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D166F4A1;
	Wed,  4 Dec 2019 11:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50057.outbound.protection.outlook.com [40.107.5.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540016E8D2
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:48:27 +0000 (UTC)
Received: from VI1PR0801CA0075.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::19) by HE1PR08MB2892.eurprd08.prod.outlook.com
 (2603:10a6:7:30::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.22; Wed, 4 Dec
 2019 11:48:23 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::202) by VI1PR0801CA0075.outlook.office365.com
 (2603:10a6:800:7d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:23 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:23 +0000
Received: ("Tessian outbound 15590139dbb5:v37");
 Wed, 04 Dec 2019 11:48:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: aff8d852d7b057c0
X-CR-MTA-TID: 64aa7808
Received: from cee6bfb0cd5a.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BB0E1048-3CA9-4E60-8D8F-500B2DE3F9C6.1; 
 Wed, 04 Dec 2019 11:48:17 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cee6bfb0cd5a.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9Tzayu0YvEHowV76imO9YBN/LMc5dqfDtDz2qaN5rIvpeIHZyyRR57WhIsq1lfve5XZ2ERSiJ27b8UZa4rM3hHlUytJE+ZmK2NP3TJH/yhW6F2tejlPQA6ZBDNWD10mnL1pNWU8GzkZZW9BmvgwMQP/+dHvJcG0nX6l4Y+XUlFyYfjXCGcccDkMMbK8/x5Wy2JLt8dNRmueudt8JuF8X1kYlDfUOT3cWSg+I7ONV8E1jn+kvHFbFaYZqhUm8zOtkFEn4nvwWfgtLgIdJ9PmH0L00iVIdJpfu+3wG5YO/Kcy2fXGzBjz93FRpOZEvLTDdqUJFObtZqznz/yQlMJYVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=277eEL94M2rHw20NJBX8K+BY/jR4YETRuPROMMFpHfU=;
 b=iiMHoW838J6LdTs7mQpESHb/TRiEqFWC5zyIjyilj9T3hPwlCJN4moiv5mIvbk/4eE773QX+Ya9DdkfUI6TImaNmBesSeMwSdOaerKv/LcWQIFQB35c7+3E35qjD9AlulRYRlESJArjy7jKNK4CdcrBBpAieV2u0ZfCLrXAe7DFO3Ub780VVDOiQ2T7nuifvRDsUMr9TALrbYxYqvdz/KkuLa3SC8W/yipa/2i83n8OyA+FYsYcucbr4DSCtP6t8JvBCgG+V5P/mReeM07/7/8/rmtOJ9lg/OTgdyCDQmhgZCPMVOjHUN8r7llFSjhn1Y+zRX1gq2KcUio7prkFmhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3085.eurprd08.prod.outlook.com (52.133.15.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Wed, 4 Dec 2019 11:48:15 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:15 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 15/28] drm/bridge/synopsys: dsi: Use drm_bridge_init()
Thread-Topic: [PATCH v2 15/28] drm/bridge/synopsys: dsi: Use drm_bridge_init()
Thread-Index: AQHVqpi20m8UMeuMP0uFEkKVZse2Uw==
Date: Wed, 4 Dec 2019 11:48:15 +0000
Message-ID: <20191204114732.28514-16-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: ce2bd35b-3277-4719-26f3-08d778afdddf
X-MS-TrafficTypeDiagnostic: VI1PR08MB3085:|VI1PR08MB3085:|HE1PR08MB2892:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR08MB2892A37FDD32F20EA0D702E48F5D0@HE1PR08MB2892.eurprd08.prod.outlook.com>
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
X-Microsoft-Antispam-Message-Info-Original: W1f1kzgPQZHNASqNUNXsfvB/q+87dp0YqHKVJDkkMvQDuMaUXqPJ7jTznn94zseOZHWE3ZB7arcZP3jb3j5JhihF4LJq4+2HZGJHDmaBkmOhw5bYVU++QzV/Zg3lHGvgeS26fcoSGmA8O/0G0aDzDlTUxYYZELsRqSFQFV0gQVfIyLaFD5nV7ja0U4bRX+lSTBMc8gSL8+mf1VIgwT3E/xx4cGQAqdlBOXvWli+x4DAGyG5AOJVhrD1jicqaSOPTuFb81vMwbISHe+40YiQaUfjuflcDahZrMqE1ghAoOXpqXm+3afsId1PMwVwKzD4rcBKMco3Aw+FpT3gTINheKVcYurC5Q2yLeNOLTdFz9HwfegACW6Ex/oSYCXE1wL1qRtZrYzRfaZCQ1iwwoAqmAeBoHjrohkrNoMPwhU/ZxidZwY3KCA/0sFN9rScf3e4q
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3085
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(199004)(189003)(76130400001)(6506007)(76176011)(336012)(2501003)(26005)(25786009)(81166006)(81156014)(1076003)(186003)(4744005)(36906005)(99286004)(36756003)(54906003)(86362001)(11346002)(2616005)(70206006)(356004)(107886003)(5640700003)(4326008)(22756006)(6486002)(8936002)(6512007)(305945005)(7736002)(14454004)(8676002)(6116002)(478600001)(50466002)(3846002)(50226002)(8746002)(102836004)(26826003)(2351001)(23756003)(6916009)(70586007)(2906002)(316002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR08MB2892;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6daec329-5048-4b17-6dc6-08d778afd918
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dc92GA+Fw8qB/bR94nIRxhNj97J+q5mgeWOxVh3iGiO5+pPB8bzulgfEh311lSc+0uztGNhBpAZ9md9jB/WQssIfMb/MAR16TIkvvyYHfttyBcEbACN/skPQTE7x1O+SkyaUXXGtDeeDCcMzDizoM8tDf9TbdJBFAMSEZDecYCJKQQyKQMM/TNrTIGUKXwklTC8WQsKToAPjiUemP0r+U939efWdeYcFdTgp0+rqDivvtkt8Ps/MyriYmk112gLQ5LLoyWJ5HDWaL8jOCkVBazFVv9SnEp7+sUdoUxdirkt6kZ1jVmeSJK9ueGg10JtT6KZMnjoiq5pQcvvmzSslJCO6nJCbP/uVNmYTr/sbw7D73qe2XuHCYxFBIJjgnkVte5mF4a2T05h3Aw1PxZt2vWJcMA5Q3kX0eYVDjJxzLEsRtTV+QZ/LGWUfUDQGwNlK
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:23.2613 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2bd35b-3277-4719-26f3-08d778afdddf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2892
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=277eEL94M2rHw20NJBX8K+BY/jR4YETRuPROMMFpHfU=;
 b=9OEguOUSXrUhree8CriPiY6s3c9MizKcJJ5E3NAkkGnfDoXiwPhbJ+eAeoTN+6AxpPey4UJSB1u5K1rF9vEHQxq1g4AxpAWnqP2L+KEU8PgqcYl6GVz4KCeBxNhLAkwDp7q02wHfwVV2xl3CwBZk7nkrb4nLGxFu9ttBZ8qYAzg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=277eEL94M2rHw20NJBX8K+BY/jR4YETRuPROMMFpHfU=;
 b=9OEguOUSXrUhree8CriPiY6s3c9MizKcJJ5E3NAkkGnfDoXiwPhbJ+eAeoTN+6AxpPey4UJSB1u5K1rF9vEHQxq1g4AxpAWnqP2L+KEU8PgqcYl6GVz4KCeBxNhLAkwDp7q02wHfwVV2xl3CwBZk7nkrb4nLGxFu9ttBZ8qYAzg=
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
 =?iso-8859-1?Q?Yannick_Fertr=E9?= <yannick.fertre@st.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>, Matt Redfearn <matt.redfearn@thinci.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1taXBpLWRzaS5jIHwgNyArKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3Bz
eXMvZHctbWlwaS1kc2kuYwppbmRleCBiNmU3OTNiYjY1M2MuLjA1MWY5YWFmNTg2NyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYwpAQCAtMTA1Miwx
MSArMTA1Miw4IEBAIF9fZHdfbWlwaV9kc2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldiwKIAkJcmV0dXJuIEVSUl9QVFIocmV0KTsKIAl9CiAKLQlkc2ktPmJyaWRnZS5kcml2ZXJf
cHJpdmF0ZSA9IGRzaTsKLQlkc2ktPmJyaWRnZS5mdW5jcyA9ICZkd19taXBpX2RzaV9icmlkZ2Vf
ZnVuY3M7Ci0jaWZkZWYgQ09ORklHX09GCi0JZHNpLT5icmlkZ2Uub2Zfbm9kZSA9IHBkZXYtPmRl
di5vZl9ub2RlOwotI2VuZGlmCisJZHJtX2JyaWRnZV9pbml0KCZkc2ktPmJyaWRnZSwgJnBkZXYt
PmRldiwgJmR3X21pcGlfZHNpX2JyaWRnZV9mdW5jcywKKwkJCU5VTEwsIGRzaSk7CiAKIAlyZXR1
cm4gZHNpOwogfQotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
