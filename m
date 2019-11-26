Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC395109EE1
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:16:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CCF6E34D;
	Tue, 26 Nov 2019 13:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe05::612])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C176E34D
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:23 +0000 (UTC)
Received: from HE1PR0802CA0012.eurprd08.prod.outlook.com (2603:10a6:3:bd::22)
 by AM0PR08MB3172.eurprd08.prod.outlook.com (2603:10a6:208:66::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17; Tue, 26 Nov
 2019 13:16:21 +0000
Received: from VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::205) by HE1PR0802CA0012.outlook.office365.com
 (2603:10a6:3:bd::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:20 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT060.mail.protection.outlook.com (10.152.19.187) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:20 +0000
Received: ("Tessian outbound af6b7800e6cb:v33");
 Tue, 26 Nov 2019 13:16:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ea8e42550e4fef53
X-CR-MTA-TID: 64aa7808
Received: from 0334c95094c9.6 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C4D41ABE-9CCF-41DE-94CE-807225FF2535.1; 
 Tue, 26 Nov 2019 13:16:13 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2050.outbound.protection.outlook.com [104.47.10.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0334c95094c9.6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igidyPR1rNyjclJgme61ZLyM8jf4rQ/pyj/T6loM9lz7cWYmVqrVIgWLUfC+Ukqe29tw8DC4JnOIOmUvkVYIPRNGJ5F1PbkZTmeMf+HHcuClqNbs1agBWCRX+5CjEYAzHBp1K98LNnBCGmdKNEZ8EV49U1PAtqd+SOes9q9Jx1Cax4izzGE2Lc7X0Mmpr44YrrqRpXL4G6qlfFwzf5FbkHHWHftRSQSaraMhExef7bLG8DOwMmXwubTrF4bGq5+NIBZzEJIg52Qt8DLOrCin5gltOPrT2fMBVeZ8NzkPDiJIc8wFZv71uJo5qy4FFLqBdBcgzzynt52wivfb2G67uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pok0SSk5Bh8w7qG9tzg8paAi0CtuxpzJ5qzAThY9f2U=;
 b=m13zfBdn1omJvt8a0NgPLHfFAv2pv0GhqXFdrlJOxBMIQVaIDieBgTjk6YUtEoO811N+PIaM8+AGkA7SrYoJAR/bBTPEhjbv48j55zalO3US6dthPlVcFXkTPt/0dNmgXsDLu/ra0Adrk+KiQ31emAK8CXvs8McWcec6rremhLtC0kyrPB1ctwfPkzry8g80BfC69n1vAf658/L4Fky6jMGC0wrOK8z9pHqwFByn3Ls3OtRcwvnfMqPys7PLXrV6CBHyBhrw2l465Y47EPR7mEYqkEq2xY6ylgJoFvBzDLt6RDLfV1AAIhHH5y5e7tF5Lh2Y/BPT57vr69NJgRm7Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:11 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:11 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 13/30] gpu: drm: bridge: sii9234: Use drm_bridge_init()
Thread-Topic: [PATCH 13/30] gpu: drm: bridge: sii9234: Use drm_bridge_init()
Thread-Index: AQHVpFusNtuVOQ8qhEu+Sa4u9CDFbw==
Date: Tue, 26 Nov 2019 13:16:11 +0000
Message-ID: <20191126131541.47393-14-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5ccf5a02-0a6b-4e27-2f68-08d77272d40f
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|AM0PR08MB3172:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB317214D71EA8D7DE538092178F450@AM0PR08MB3172.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:949;OLM:949;
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
X-Microsoft-Antispam-Message-Info-Original: jwTV1iyVExg5PHBt5Eop33DsUoWpNxg5dNg3PvKPbXnW/MJ0BMWX5lEzP3LX7rdtpYVvLKIYI2Fc/TlzF4X+FhVUH0kOHN/WmNJZKFaH+8XS+8ochp4iuJHOijNEYwfFCnaY11jwBM+kWOCFOHp4ykMbrpJp0f1XeX9Icc4oU54ax0OX8L+OZ7479HEy+Jp+89QuyNyvMOpbecCdPDn4KoHYuNEpC3JxGliBdwn04IPGGjIBq2gX4JvnhyVonrTqb7JA0cWVSwBAbpKEha5uu6tThJyEOrFWZSNuqkXDQ6KkYBYXbNj1cWJTE28ErGzDO91DL0WmILHhy6qabQaaieoyWKMz14kKIQt5Q0FT4MArzfIcUW+Q1PY1sWAdNOlW06yDWvhQiWQa8PJBSYUgRHoT9JlhwZIvyJAMLB2HCUQlE2V8KRlY5P/g+1RMxKKy
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(39860400002)(396003)(189003)(199004)(107886003)(76130400001)(5660300002)(36756003)(8936002)(50226002)(8746002)(50466002)(81166006)(70206006)(4744005)(23756003)(8676002)(6116002)(3846002)(305945005)(14454004)(7736002)(25786009)(81156014)(70586007)(26826003)(22756006)(1076003)(478600001)(66066001)(47776003)(2501003)(2906002)(2351001)(356004)(6512007)(5640700003)(6486002)(86362001)(11346002)(336012)(316002)(106002)(54906003)(186003)(36906005)(99286004)(2616005)(26005)(446003)(102836004)(4326008)(386003)(6506007)(6916009)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3172;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 812b9369-7264-40d5-c9f6-08d77272ce83
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5KoCs5eGJKBw451O/a6+xxCa6qzwrTIxvUTKd/H/TfV37F6Y+UItEVE4K6gJTw2ZtSIaW9+1X+wzpydDph+JumTNM/bLHsfbNYmV8wY0YMJyeVu38ddkXybXRvmKjUFbkR+PKOgMgW/gOQ3vkBdMzywjvANgBXEQr+v4ZpQ8LTqQdXzE6MwMR1IpUX/lv6bH7CHSFMBWj8c0JWKWF1jfztEfhN4D9DaMd/f+cAl88s6J2sisQ6bsN7N/yzUhhXNp8KrNWhuN4GjbCl+js5q3p7fvpj1uGXIiVamvjar6yHlx0mEI9nKqryRyKjOmnRRXkk7uwBhvCFRaefKojXyDaiQ0vV+7jGdMa8/x9ZW2sod3Q0otEsGQ6R2wva9nsj5CaEArt7c7rw6a+DLGgzysDkh0JITwx1e+a7ccsfoqCAsJzx5BrQyuDXq2yBa8oIVT
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:20.4736 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ccf5a02-0a6b-4e27-2f68-08d77272d40f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3172
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pok0SSk5Bh8w7qG9tzg8paAi0CtuxpzJ5qzAThY9f2U=;
 b=pusOmscyYufEpFSCf+1JxVugEIYknT9wzLJze/QxPGJ1neaqXGoNuuo/bUCPQ9nzrZY/YoiEbEvMwucCdGK67E1hAcWNy3eeUwype5UAe7QRWL+M5/36LOue/KaWoowLN2XMgAkLA72eYKNKUkQpjbMzyRNA9QKOWUWB0Cg3QeU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pok0SSk5Bh8w7qG9tzg8paAi0CtuxpzJ5qzAThY9f2U=;
 b=pusOmscyYufEpFSCf+1JxVugEIYknT9wzLJze/QxPGJ1neaqXGoNuuo/bUCPQ9nzrZY/YoiEbEvMwucCdGK67E1hAcWNy3eeUwype5UAe7QRWL+M5/36LOue/KaWoowLN2XMgAkLA72eYKNKUkQpjbMzyRNA9QKOWUWB0Cg3QeU=
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
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5
MjM0LmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTIzNC5jIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MjM0LmMKaW5kZXggZjgxZjgxYjcwNTFmLi5iZmQzODMy
YmFhMWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTIzNC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTIzNC5jCkBAIC05MjUsOCArOTI1LDcgQEAgc3Rh
dGljIGludCBzaWk5MjM0X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsCiAKIAlpMmNf
c2V0X2NsaWVudGRhdGEoY2xpZW50LCBjdHgpOwogCi0JY3R4LT5icmlkZ2UuZnVuY3MgPSAmc2lp
OTIzNF9icmlkZ2VfZnVuY3M7Ci0JY3R4LT5icmlkZ2Uub2Zfbm9kZSA9IGRldi0+b2Zfbm9kZTsK
Kwlkcm1fYnJpZGdlX2luaXQoJmN0eC0+YnJpZGdlLCBkZXYsICZzaWk5MjM0X2JyaWRnZV9mdW5j
cywgTlVMTCwgTlVMTCk7CiAJZHJtX2JyaWRnZV9hZGQoJmN0eC0+YnJpZGdlKTsKIAogCXNpaTky
MzRfY2FibGVfaW4oY3R4KTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
