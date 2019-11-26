Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4011109EEF
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:17:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34A06E39E;
	Tue, 26 Nov 2019 13:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe07::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48ADA6E358
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:34 +0000 (UTC)
Received: from VI1PR08CA0258.eurprd08.prod.outlook.com (2603:10a6:803:dc::31)
 by AM6PR08MB3192.eurprd08.prod.outlook.com (2603:10a6:209:4b::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.19; Tue, 26 Nov
 2019 13:16:32 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::207) by VI1PR08CA0258.outlook.office365.com
 (2603:10a6:803:dc::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:32 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:31 +0000
Received: ("Tessian outbound 512f710540da:v33");
 Tue, 26 Nov 2019 13:16:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 54495c6cc4f08a7f
X-CR-MTA-TID: 64aa7808
Received: from f4b123a35b0f.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2C2F2565-C22B-4BD8-9147-90B0661C3173.1; 
 Tue, 26 Nov 2019 13:16:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f4b123a35b0f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3YLhHGCaG87oEYNSlxiibDSBe0JkXKy2rslCutmWZOB1MMliAP0pgCAvTOzRS0bmtYZxXVoQYsqfffgquKGLK2UZM5glX1waZtwmO71iT9INDj5RJNehPINl8rf0GILP6TqYRSpz9isiKh4LI4hYKccOxOzo4qntGvBT1d5LoTUnXflCqaIXb04xXaFCz0TwgULOIIGozm4bBNtiI1dKkH07j33nJzOP80j99ulVLsd9Wl75id4rA3SCyEPoHMNGsNsCTDHkR0HiTm5NslyOqrlsXViDt3X/vKvUEHwTfrgK/lYt6Fqz1lqiWCiEiFHVHuDhtUh0suzE0A9E3frbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXiSa2cDPynqi1pZWZTQXR63peA1QHF+7CCWR6/itq8=;
 b=Vv44870OD5WjXkk5naSmOHeYWeubwVXtaQe3iWXRgyx546vAimAZC8EC2xchHZO6zIA2GAPs2L7ZDxQpbYyqEdNTI1YwIV/4hbkzAHgZIifIdcDTSK8YuLi95U1nrV2axQ8I5eTwQSAh0iChulUpIQWhCV7AdZkCwLAMFJogoYPQrwrWIGHmo/ii+5Oi+yr7F7L02+Z/mew3LokT4U7ayaFpDVhkWI1zcWQvGucfEwgKoRybHcHlXsbeAq3ywf9pK4gtVzQoF+cSz7bwlMcz5adb3y7cXKVJK+hie2bjINijFF5aG8qUxG60Hry4awj35nkrnsvHC9I8w+R7WPdiLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:25 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:25 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 27/30] drm: rcar-du: lvds: Don't set drm_bridge private pointer
Thread-Topic: [PATCH 27/30] drm: rcar-du: lvds: Don't set drm_bridge private
 pointer
Thread-Index: AQHVpFu0AaX4+WqtW0efGC3rTYsu4g==
Date: Tue, 26 Nov 2019 13:16:25 +0000
Message-ID: <20191126131541.47393-28-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: de0431a9-d2d9-49b8-0c35-08d77272dae6
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|AM6PR08MB3192:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB31925C398269C49D415BDFCB8F450@AM6PR08MB3192.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:546;OLM:546;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(1496009)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(5640700003)(86362001)(6512007)(71200400001)(2616005)(6486002)(71190400001)(2906002)(4326008)(6916009)(44832011)(446003)(11346002)(54906003)(66946007)(316002)(66446008)(64756008)(66556008)(66476007)(6436002)(4744005)(8936002)(186003)(26005)(5660300002)(102836004)(305945005)(14454004)(25786009)(99286004)(81166006)(50226002)(478600001)(2501003)(7736002)(6116002)(2351001)(76176011)(1076003)(52116002)(66066001)(256004)(14444005)(8676002)(81156014)(6506007)(3846002)(386003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4317;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 0bplAz7M7EOz1UCgRq3RawokjrsTXRkN6Ft61+dbUbyp9wpzugB/oCg163ScqVsA8ICjwn3KmSACh31sqsqN3H3jrewsMvgR+Og7tRsyxNNO/dtlC9FiaMKWIIbSeZJiJHm5kbhKRrCE+a1E/YDDGc1F+96Ipk7MMESBs40P9GFUexQJQE8zj+yTrEFxzTwzWWT2w9NrdyFHwCjB+29dW9LYBcEcNGxSQfh29c2hdk/8z/3e2Af8Zr+ADahI3JfRMG165hl+JwderTs7pwjsrQO80daI+hvJzEVyS2nUuljT/0tctT9mLRcqGYvFWaKjnYAWeJIh4RSx2eq1B9su6jLTLqv/n1g30QIUyI6vfw87LjZCNTxHs0JnExXSIvP5deZBJrHtOWth31f/hYN0DSkA/HChnaEdHHMsCi+1RYWm9KUmaf3zR1YwqGsvi+DW
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(376002)(136003)(199004)(189003)(14454004)(356004)(8746002)(2906002)(186003)(54906003)(316002)(4326008)(336012)(11346002)(81166006)(50226002)(2616005)(5640700003)(478600001)(25786009)(26826003)(446003)(6512007)(8676002)(8936002)(36756003)(3846002)(6116002)(7736002)(66066001)(305945005)(1076003)(76130400001)(23756003)(5660300002)(14444005)(47776003)(81156014)(2351001)(76176011)(50466002)(26005)(22756006)(6506007)(386003)(6916009)(2501003)(70206006)(4744005)(107886003)(6486002)(106002)(70586007)(86362001)(99286004)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3192;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6bb0853c-f121-4134-b1f5-08d77272d6b2
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g+R9yjk69JuyLcnOlFWcupnzL2cc6um0qWS4ROFNZO2ryGX8yE9Jf7O9YXwkyUkR8WukxpidK7pkbT4uCt+dNKR2I09oNPhg1mLm7pJ51m9fWZAnGClPvJVBLXp7X8LUC+8lgNFg2FL44aDbispW03BB115ZoPe7QSw7J+P4vrA+7uGAzWoeV9/V6clRIesgpRtLN8PNEouxbtlqMq3FXfyk0wy8KYmfBEfsaMpdL9QZTkxUBKDhSx7OYdw3GKbSG++/lJwTejVtAhl+rdGot4nzc2WZGYEPHztEuqfWP91zVjEd18TKLQ+Pc6Ic74WyM/UtGwEWRXyJuY+gzGphebYCjtEqmeEejkyjKBiIkzvjn0oQdl2edv251XPMUNgnj7q7HJ3jGw94Y39c6IDC0EcqSp22a1pILOHyOvdCZqMh17aP1m25pVsHT8ds2ve1
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:31.9811 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de0431a9-d2d9-49b8-0c35-08d77272dae6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3192
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXiSa2cDPynqi1pZWZTQXR63peA1QHF+7CCWR6/itq8=;
 b=69d5vRmKAwZ5E5i2SfbFOrjsvu7rBi4QG12K9hYv0OIXrAPvbAlRlKm7EOJWZ+jOQ/OUea1ALgrMOkrCJUs0NLkRqXu93Tuf923YAUYzbXvFIXx0pp7IDi7u1J/EnCNfNkAolru4QB5Q3itdmCtxtGF+w54W0ZONhCTX8KtToQk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXiSa2cDPynqi1pZWZTQXR63peA1QHF+7CCWR6/itq8=;
 b=69d5vRmKAwZ5E5i2SfbFOrjsvu7rBi4QG12K9hYv0OIXrAPvbAlRlKm7EOJWZ+jOQ/OUea1ALgrMOkrCJUs0NLkRqXu93Tuf923YAUYzbXvFIXx0pp7IDi7u1J/EnCNfNkAolru4QB5Q3itdmCtxtGF+w54W0ZONhCTX8KtToQk=
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2U6IGl0J3Mgbm90IHVzZWQgYW55d2hlcmUuCgpTaWduZWQtb2Zm
LWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vcmNhci1kdS9yY2FyX2x2ZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZk
cy5jCmluZGV4IGFjMWYyOWJhY2ZjYi4uMTY4YTcxOGNiY2JkIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1k
dS9yY2FyX2x2ZHMuYwpAQCAtODgyLDcgKzg4Miw3IEBAIHN0YXRpYyBpbnQgcmNhcl9sdmRzX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCXJldHVybiByZXQ7CiAKIAlkcm1f
YnJpZGdlX2luaXQoJmx2ZHMtPmJyaWRnZSwgJnBkZXYtPmRldiwgJnJjYXJfbHZkc19icmlkZ2Vf
b3BzLAotCQkJTlVMTCwgbHZkcyk7CisJCQlOVUxMLCBOVUxMKTsKIAogCW1lbSA9IHBsYXRmb3Jt
X2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7CiAJbHZkcy0+bW1pbyA9IGRl
dm1faW9yZW1hcF9yZXNvdXJjZSgmcGRldi0+ZGV2LCBtZW0pOwotLSAKMi4yMy4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
