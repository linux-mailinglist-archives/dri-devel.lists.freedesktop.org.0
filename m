Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E435C109EED
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CABD6E397;
	Tue, 26 Nov 2019 13:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00059.outbound.protection.outlook.com [40.107.0.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE5C6E354
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:32 +0000 (UTC)
Received: from VI1PR08CA0139.eurprd08.prod.outlook.com (2603:10a6:800:d5::17)
 by VI1PR08MB2957.eurprd08.prod.outlook.com (2603:10a6:803:43::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17; Tue, 26 Nov
 2019 13:16:29 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::207) by VI1PR08CA0139.outlook.office365.com
 (2603:10a6:800:d5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:29 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:28 +0000
Received: ("Tessian outbound dbe0f0961e8c:v33");
 Tue, 26 Nov 2019 13:16:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5abc290fc018b9a6
X-CR-MTA-TID: 64aa7808
Received: from 223e0bbf9727.4 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3AD3AEE3-B596-499B-8A3B-8DE6CDD0521F.1; 
 Tue, 26 Nov 2019 13:16:23 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 223e0bbf9727.4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHmC/3xlBs4H+U9yFJbr7VqEuT21DjEjyLGsx6ImCUgXCe84xvzq6M5MMgp3rbJ0jA5jKkaIoiUhPDUYVlFAf/8qLOfUAybUvx09zk/sQwhCbp4EU5Qq+6MmaGEcmFDmxwkaz7yX9wt1FUsFdaBtEBYSMq3SuDzU+za6ibMuhDXmrYFELZVDLHYiG6DS4cokTTq8J7OG16m8QVB5veB3THy249Qcqj/Xac7PnwW20LmMHqY8zIB6IFw+x8u9BxlvxPzAWooR6YzTuuuz2arWm9j2/BJhrszzrhbb0krBsjZ+8Gv1BE2IpUplNEl7V1D1wJQ1JY4Ke9bo6183hkKXtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zMoKcmV7qGGAHECqCXtHZ6E+T/kRsQLeMnNAZQSxW0=;
 b=AuXKNJ2G9NiNuRR+bgVibmZAgVJ0xhLQS7MJEWLxqXv//kgHFeDh2uKtFHnrVvHh+5fgAamQ6X8JXL5gZsMOP68ZxhVHiFg3CIJSokEwmr7oZ75tSDu7F+bsHZnr3cr819TgoUDymghMWVFSOgrsxwVhQgFs2yaMQhIhptvDhXdsNcbq04puf3niZgC3E7YyOvPe3NiegqFKafENfwYIIZ8KcplV8Q0UMQh7cNDDtaCrB3zFpYc5M+u/GRsE4au9ryGGm3+oUCptT5PmumFFNeEwW8WOEtX8W3iM2ydiEc+CKL7Uxsv1sQ6npOPen7XS3hnIZeL6/eyJg6mjVTVbwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:22 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:22 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 24/30] drm/mcde: dsi: Use drm_bridge_init()
Thread-Topic: [PATCH 24/30] drm/mcde: dsi: Use drm_bridge_init()
Thread-Index: AQHVpFuyLEx86o52+U6S5iv7phXr1Q==
Date: Tue, 26 Nov 2019 13:16:22 +0000
Message-ID: <20191126131541.47393-25-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 99754c23-1359-4697-e589-08d77272d922
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|VI1PR08MB2957:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB295723F112D90D7D3772F25D8F450@VI1PR08MB2957.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1360;OLM:1360;
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
X-Microsoft-Antispam-Message-Info-Original: Mwb09yBnAQ1AKYBxzs6/EOlsSXTOLo1iyGcv4NRBAhwli7ARpLaN9YIjWHVDd720KtqijgqB2KqC/q1PPfBLR1HoRq3vwVqpRaIP9fpo+6ZXAEQ7gNacLYRHbTrHsH4kt/nnPsozPdvPThwCqopxGgTLYPXEgIt7j3LezxIGMjUJLNdVFHUqThejJTetdrG/ifsKX8tkRYD0AphuMbv6cWB1NJ4/ySNtVgywGyKmJ1RNBq+6tg+uaPz6PpGFnNu3wbuC2s6ev6LG4t2k+nB68ka/fJekcwsL4iT/qNZyTIqsfDD2Q++rqqjacMvIq0gYAAcdOyb6cy70W24g3pfpuKox4xlFsqA2IJbrUU76Fvjkj1zUJDiU4GiMxJpReDFFywYmeGIu65/Z/oBYrnfzoniwl7LzuBrdYZ93MCwHI/0S3NFQGmQLBgSJL0FbPYG/
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(136003)(346002)(199004)(189003)(3846002)(50466002)(14454004)(8676002)(6116002)(66066001)(8746002)(81166006)(81156014)(8936002)(50226002)(36756003)(54906003)(5660300002)(47776003)(4744005)(99286004)(26826003)(478600001)(23756003)(106002)(2351001)(22756006)(316002)(1076003)(36906005)(2616005)(7736002)(70206006)(76176011)(70586007)(11346002)(446003)(86362001)(25786009)(76130400001)(6506007)(386003)(6916009)(186003)(6486002)(336012)(6512007)(102836004)(2501003)(26005)(356004)(2906002)(5640700003)(4326008)(107886003)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2957;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 16584345-d1b9-4596-dcc6-08d77272d505
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ivJZsUKq34msVdLmsb4avmPGvsSpORyDkGKFZT5v1fUIkJVQ0f+DtO6VaRfEgLd+w1cqYU8Qe0B6l5B8H0xTzOWBsKwLTbgNfq7u5rdtAH9LJowJn162WdhmsJSJzEApMViFg1EnzOd9HdvlXq3yXmzT6EqdZUigUCprESJO/ZFcujkZvaDy+M1PoJanL5OaO526qwpjxhqA/0hzepMPvPgQrMbHk9HuZM9ygaYZN0L6eLkyGApVfn7OyopM/COJ4rYNm+toQJAm+3eDICfXPJOIaMsB3wNzvdacGZ71fPAuSJQRIdRopyRM4i12NZHMBPVjk+BOS2rd0y8dsjcU1MvIQx6UyLUxf4ChRcoeQUyXLNoYei8PvxF/L5bYaXYiS3SaiHrnnUHjPHxRqbhmVHWa9b0WUmiCeuePwv1XCt+BVxzgAur74/gox2t7tkAB
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:28.9344 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99754c23-1359-4697-e589-08d77272d922
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2957
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zMoKcmV7qGGAHECqCXtHZ6E+T/kRsQLeMnNAZQSxW0=;
 b=rXfPspVHtHuZXtim4gO8brkWcLT2CkBwYWPwYMReqVEC4tmtgnR4qhZVY+qb3/4mvuaiuYSOtS1gRVAMOst1W001pjL4EQYV+vt7m33oKiSkhKcPsWd5OBHpv7EqeahvOb1fZyZHL8YW7H2XTuFN4hutmnoFBjzfYOwr5zyoU5U=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zMoKcmV7qGGAHECqCXtHZ6E+T/kRsQLeMnNAZQSxW0=;
 b=rXfPspVHtHuZXtim4gO8brkWcLT2CkBwYWPwYMReqVEC4tmtgnR4qhZVY+qb3/4mvuaiuYSOtS1gRVAMOst1W001pjL4EQYV+vt7m33oKiSkhKcPsWd5OBHpv7EqeahvOb1fZyZHL8YW7H2XTuFN4hutmnoFBjzfYOwr5zyoU5U=
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9k
c2kuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kc2kuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tY2RlL21jZGVfZHNpLmMKaW5kZXggNDJmZmY4MTE2NTNlLi5kOWI5MjUzYWNj
Y2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHNpLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL21jZGUvbWNkZV9kc2kuYwpAQCAtOTU1LDggKzk1NSw3IEBAIHN0YXRpYyBp
bnQgbWNkZV9kc2lfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rl
ciwKIAlkLT5icmlkZ2Vfb3V0ID0gYnJpZGdlOwogCiAJLyogQ3JlYXRlIGEgYnJpZGdlIGZvciB0
aGlzIERTSSBjaGFubmVsICovCi0JZC0+YnJpZGdlLmZ1bmNzID0gJm1jZGVfZHNpX2JyaWRnZV9m
dW5jczsKLQlkLT5icmlkZ2Uub2Zfbm9kZSA9IGRldi0+b2Zfbm9kZTsKKwlkcm1fYnJpZGdlX2lu
aXQoJmQtPmJyaWRnZSwgZGV2LCAmbWNkZV9kc2lfYnJpZGdlX2Z1bmNzLCBOVUxMLCBOVUxMKTsK
IAlkcm1fYnJpZGdlX2FkZCgmZC0+YnJpZGdlKTsKIAogCS8qIFRPRE86IGZpcnN0IGNvbWUgZmly
c3Qgc2VydmUsIHVzZSBhIGxpc3QgKi8KLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
