Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA3E112A8C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:48:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D4B6E8D7;
	Wed,  4 Dec 2019 11:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60060.outbound.protection.outlook.com [40.107.6.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00206E8D5
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:48:27 +0000 (UTC)
Received: from VI1PR08CA0171.eurprd08.prod.outlook.com (2603:10a6:800:d1::25)
 by DB6PR0801MB2054.eurprd08.prod.outlook.com (2603:10a6:4:77::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13; Wed, 4 Dec
 2019 11:48:25 +0000
Received: from AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by VI1PR08CA0171.outlook.office365.com
 (2603:10a6:800:d1::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:25 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT040.mail.protection.outlook.com (10.152.17.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:25 +0000
Received: ("Tessian outbound 224ffa173bf0:v37");
 Wed, 04 Dec 2019 11:48:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cbe77d516b08bb0e
X-CR-MTA-TID: 64aa7808
Received: from b7ecf5d06a39.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0A30D741-3C09-4891-B968-A660C3920F5A.1; 
 Wed, 04 Dec 2019 11:48:19 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b7ecf5d06a39.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIs68CFEmrv8UUftW+jAA3qE035ydmR++vNsn6Knleupy9CfC+egE5xSSJwogDm6pyPd3E6mzIAaykU/wKYGG5a6ux0SBWQWeSVmkh5LTeZBKAlpSC+vk1yaJcF3jDrpleiHhgZtqWIh1fdz8ODpP2woozKVUD49rDK+aD2WliUXAurgODrujfzOgMDXD0nSybySMOzCH4uuPkXS8O7foLn6SOK2FGNZYj+80QxsX/TuIKMVaBjyplKuUIoPCcKrcTKvIPqogFlFEuyF1W6YdXYEXDmVDeONOqPkE/aRtERUqu4JNSJOBiKgQPsotIKMqqbR6611e7EQdbqj/XMSrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GM8A9kiLcrCKYySajRO3pEQWg5CmJV0PJmVUtGtc3s=;
 b=KnSuTJBFzNrkeB9zKnF3Qe/98AWI62opULSlDdrKH5VQDyL+7jFn3igg2mZzsrhYZ4+KyoRPn0pgkTsNVVP7nxUip0ux/tWKoBVuTEJN9IhtHOkG0lbmCKJM/73Y13Ps7k+YDIHPcwY8bMSRjFcLxeUAmV0BV5Yh98ebRHIVdVrVkvEuPrxee/76IljmH9OSvnbA9iLKx/4kix0RcWj8zmDG0ssI4RfUD95Jas0qfm6BpjT+I4RZAUb6U0S1naX0DzHku0/+ZVQjZo5NobWATv7pf0Z0v1CnimYvraCNGgQnKMABxImSCSSdAIQiwwclMhcVfA23b3WTcT3TcS0dIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3085.eurprd08.prod.outlook.com (52.133.15.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Wed, 4 Dec 2019 11:48:17 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:17 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 17/28] drm/bridge: tc358767: Use drm_bridge_init()
Thread-Topic: [PATCH v2 17/28] drm/bridge: tc358767: Use drm_bridge_init()
Thread-Index: AQHVqpi36/4eTQFiyki2i0rMuhwe7A==
Date: Wed, 4 Dec 2019 11:48:17 +0000
Message-ID: <20191204114732.28514-18-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0cd8959c-3abf-4a48-3e66-08d778afdf46
X-MS-TrafficTypeDiagnostic: VI1PR08MB3085:|VI1PR08MB3085:|DB6PR0801MB2054:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB20541A5CD781FC9218A3D74B8F5D0@DB6PR0801MB2054.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:376;OLM:376;
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
X-Microsoft-Antispam-Message-Info-Original: YlxB+HTpQ4d9EpTK+RSJPv3G+F6EDMxwJvpbctT4rgskUowZNTTNmOBedeBwVq0w/DcbkSMwOKViLSC3lnIU/IT4E/dyqiXwwiBeO/6uMY47cnjhywuzboBMpugtvA5cIy3Pmvh5+r2EPUeHwyHgC6nxiLxiFxXrrVocYMn4H7Dq7uyFQoL0K2pSdPY+MjWVqLM2+OkbMj/2RJpiiiuFec/I2W6D6wZSB6j2JEoUIVuvGGdIB5Hlr6OBE/upaZttazMfk25eX8rj8vOkR0kAAi5p8AybFxeYtdvMhgatebmZkvuAcE2jB93zxwGOohnnTwR5UR3Tnxu4YdtKCt7RbSvk8GekQM9hRIq1yiBohFHoTXGBFGpb/s4S24GFQINC6yt4uPpnyMqkSKEdogQuRXFbWCNlHiaUblcsjz0E5w08LhTmmlpVEHF3awfWzOq9
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3085
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(396003)(346002)(189003)(199004)(76176011)(1076003)(4744005)(26826003)(6512007)(36756003)(81166006)(107886003)(50226002)(81156014)(4326008)(6116002)(3846002)(5660300002)(478600001)(305945005)(2501003)(6916009)(86362001)(8936002)(25786009)(8746002)(76130400001)(14454004)(22756006)(7736002)(99286004)(5640700003)(8676002)(2351001)(102836004)(186003)(6486002)(356004)(2906002)(54906003)(23756003)(6506007)(316002)(36906005)(70586007)(336012)(11346002)(2616005)(50466002)(70206006)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB2054;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9514c0e7-2049-4344-f783-08d778afda1d
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XErp8L9V+cxxyo1IQnMMd4eu3qyvKvnqZaJgp5hS5sIxCzCls6yYYpp34vrv+NhZD9eK51cBL1o+rxS0VTHR3S1rz0QHS1/im+wmFVy1ZmRxj+5CzMjua+epKzMkJ7HllbeRp2eGTBa2rQZQFkPiAGAm+ysHZB4R+bUsAe5l32SFQZ4fX1BLFs4AOAa7ijQ5OscR0q9vwNHm8GhDOYVMM4X8juZAcmMd1crHYhTfzTfmH3Q0d8hDtJ5KmFSK1bU012UFMJ9jw007lwCiXWDUj7K0F18C6kiHQReI/XB8b0/tUnQVHzom3V3oa955atvxzJD3iKIo4HB/H//uliRVXnMzHXIgFSDBQVvF1H32Bsev2kym7nxKbtoklMpCf0lHZVn3TGHAU73d28fKlLrGeWP6S46Fiymaj3J4Ph/9fGuYD9olvsoEoclViv3pcDYS
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:25.5906 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd8959c-3abf-4a48-3e66-08d778afdf46
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2054
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GM8A9kiLcrCKYySajRO3pEQWg5CmJV0PJmVUtGtc3s=;
 b=sX5I477CZHpR2Bb0boh0vHzyqhOsyiTxM+ow0TrtpyZSdX2HcRl2ybL7ojxAItM7gTTH6tpa/iVVb+OR6lspM1WjKxWOsev4Exjpo5+U/re/nCTavMZrCaD3+si/fEHns+R9cZeJbrLZytCHiZHcfrmcmvUN5Ko8MbRqynuqbQE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GM8A9kiLcrCKYySajRO3pEQWg5CmJV0PJmVUtGtc3s=;
 b=sX5I477CZHpR2Bb0boh0vHzyqhOsyiTxM+ow0TrtpyZSdX2HcRl2ybL7ojxAItM7gTTH6tpa/iVVb+OR6lspM1WjKxWOsev4Exjpo5+U/re/nCTavMZrCaD3+si/fEHns+R9cZeJbrLZytCHiZHcfrmcmvUN5Ko8MbRqynuqbQE=
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
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1
ODc2Ny5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKaW5kZXggODAyOTQ3OGZmZWJiLi43ODQ2
YzE5MjVjYmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKQEAgLTE2NzEsOCArMTY3MSw3
IEBAIHN0YXRpYyBpbnQgdGNfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwgY29uc3Qg
c3RydWN0IGkyY19kZXZpY2VfaWQgKmlkKQogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKLQl0
Yy0+YnJpZGdlLmZ1bmNzID0gJnRjX2JyaWRnZV9mdW5jczsKLQl0Yy0+YnJpZGdlLm9mX25vZGUg
PSBkZXYtPm9mX25vZGU7CisJZHJtX2JyaWRnZV9pbml0KCZ0Yy0+YnJpZGdlLCBkZXYsICZ0Y19i
cmlkZ2VfZnVuY3MsIE5VTEwsIE5VTEwpOwogCWRybV9icmlkZ2VfYWRkKCZ0Yy0+YnJpZGdlKTsK
IAogCWkyY19zZXRfY2xpZW50ZGF0YShjbGllbnQsIHRjKTsKLS0gCjIuMjMuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
