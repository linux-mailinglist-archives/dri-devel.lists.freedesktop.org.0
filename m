Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD26109EE4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17886E393;
	Tue, 26 Nov 2019 13:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::610])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43AB6E354
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:33 +0000 (UTC)
Received: from HE1PR0802CA0014.eurprd08.prod.outlook.com (2603:10a6:3:bd::24)
 by DBBPR08MB4425.eurprd08.prod.outlook.com (2603:10a6:10:cc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.19; Tue, 26 Nov
 2019 13:16:30 +0000
Received: from VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::200) by HE1PR0802CA0014.outlook.office365.com
 (2603:10a6:3:bd::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:30 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT060.mail.protection.outlook.com (10.152.19.187) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:30 +0000
Received: ("Tessian outbound af6b7800e6cb:v33");
 Tue, 26 Nov 2019 13:16:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d2dc0a92ed9cf500
X-CR-MTA-TID: 64aa7808
Received: from 398b5090f33a.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C2A6510B-80A7-41B4-B358-8DC4C502AFBF.1; 
 Tue, 26 Nov 2019 13:16:18 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2056.outbound.protection.outlook.com [104.47.10.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 398b5090f33a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/I1it62zpUWML41Zila59UIuH/3hDErEp0xNatJzZPHWA/0YmGXqjk0yUoZ3pVJICfI10P5c1Zu4QeaTpS73gVsSdDCiaAN7ivxW2ErYXO1Hv2Zd0LFMMmbKjW0EdwCoiQGjMMLa9dyOP1ssunzXumXEzXNkUVvydA/2Ph8/rEGJqRP5h69IZZ+6QSDAJC1rG0+6rKJWpOA/bvtd0wwmbJrIcBSNHR6gViYK3a75Xn9aqGTNmLCbO+5hMFTibBuTVBIK7Nb8M9HBN+yvr3sg8fW/v3ZMdHJ2SYXyuHAXmirmowXfxxDGGNrPttTesK9EmBy0mr0tvS67qI6dMDkgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GM8A9kiLcrCKYySajRO3pEQWg5CmJV0PJmVUtGtc3s=;
 b=CWL5tHkqblAQGzjmX9otyD2uxT+BNmXfzPeJXCF85zisopRyHfpQkDgROcOppsDYjwRnwl2ZfKjOo6DdXBBO1BK6XyPOIRJ5HBtMIhhh6Td0OgZQNknG9nkmdIYsO1D3+ys5mlgPHdKdpDsjnJPwI4KBcZLtdo7STnm551xkscA6UBecThY021+NBQLJDYUkAtfiXTmVWXh11d7XAJ2lMBAAEGh2fOmfYepCC11+oPliBnz3jNfoEBGdsWI5zXsOLOnFum7hlXXgEdYfsAwzU3p8tcbGr39MCKzlZmSrPFSh2XrSFZzO9HFZTZI4uIx6GNWPdi4tKTbLYsa08gnJYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:17 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:16 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 18/30] drm/bridge: tc358767: Use drm_bridge_init()
Thread-Topic: [PATCH 18/30] drm/bridge: tc358767: Use drm_bridge_init()
Thread-Index: AQHVpFuvzbECXsJ4qkOALbl4JgCF4g==
Date: Tue, 26 Nov 2019 13:16:16 +0000
Message-ID: <20191126131541.47393-19-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: a3bba850-802a-450f-7ff8-08d77272d9db
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|DBBPR08MB4425:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB442555C22F29314F70B065358F450@DBBPR08MB4425.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:376;OLM:376;
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
X-Microsoft-Antispam-Message-Info-Original: 8IWsceGY/aN95lJcl04ZEfdyoxpPUY0+AKQDjyOLPdXeZlgE3D3ED7DcL4/6STtUoEvKqtEPZXH69ioQTL3pEGd5oE3atGVJw/V5PS52UZdhozR2q9AKNxOQ19AtjBTGe7QAthvx77GQQ2WTv0MmwoCByXHCyuCYMnWTOr2CQ4fHQH1y/vFvQwD2UKTv1681WysRhMye8ko2BP0DS6jQNjsG1S242TpuIhzZsMBno0sF17Ryb3VQ096dO7xkwYUvxejfYMhpB0p8xGwljymmD8i0RgHNgJZGTEzBHYiOpL7AA0h/c/aNPQvHwGzIuByeaVqS62tb6NW+jyphw/ToUz/dwz0OFCtTmfReUI0V05eJjKPcyEH2LxRQDHKwPFJxP1zBq1AynxDBr+ZXeZXZpnxskWPbPs4Hv/ZOmZW7qgrY159onnpKTl9fpjqFN4sY
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(39860400002)(189003)(199004)(36756003)(106002)(22756006)(107886003)(54906003)(316002)(14454004)(23756003)(6916009)(102836004)(76176011)(478600001)(6506007)(26005)(386003)(186003)(4744005)(50466002)(81166006)(81156014)(8746002)(8676002)(1076003)(6512007)(6486002)(25786009)(2906002)(86362001)(66066001)(47776003)(5660300002)(356004)(50226002)(70586007)(70206006)(2501003)(4326008)(2351001)(99286004)(305945005)(6116002)(3846002)(336012)(7736002)(11346002)(76130400001)(446003)(5640700003)(2616005)(8936002)(26826003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4425;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a9b3a778-d2be-4064-d6d6-08d77272d1b1
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C96pkVpFxpX4as4M2mKiIMao2a7TqVtYLUwZAe9GK1Hj5lAbAtUZsxtVqrfIkjtT6I6r5xUe6Hu++LiDnAOnQwmiwDE1k1OBcVMka+ImfSJfE96i3xCrNGORuGKreismGBvcCnmOrgdIElVjW2e3VfwhLmdIXAM2L/BvfBC6VqkpUxARWGA0FE+/t+Aoz72xc5m/em8CSi4TCWYohUGEn8tPZBsE9hi/2ynxOecWYmYaALH/k28eSPrTLXHobYimtlYHv3dXQGpR0PsptM7OB5Ku0H25Q6+QCIxY5RHozMXxWpMLC2bELPznOepFsZYlAZCLMEEHScoO4Pu8NEDj9Fwo7MrCA6krbp2yjP+iVvgsehkZL4FadQieKRyIAsfznHAXIyV/uin8aNc9gISE1wtBimhHwzu+ly+9lI43yy8ZIjvnW46NRshhECr6SX+4
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:30.2012 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3bba850-802a-450f-7ff8-08d77272d9db
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4425
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GM8A9kiLcrCKYySajRO3pEQWg5CmJV0PJmVUtGtc3s=;
 b=m0/WXGV7+WeK7dFJRaRAB8RiT8iuPY2WAcn05vUzE7KGTlxtO1lHY0zvAFABq4Wrl8cnwZyEVsMVjqbXufWFMA61yzp2Wu+UWBsyJmeOuHZqUB2GgYjdf9Gosb5QZkDlJB3pYUhxGbKAq+LD1cENt9NYJ87t6bwhirCNCQLP69Q=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GM8A9kiLcrCKYySajRO3pEQWg5CmJV0PJmVUtGtc3s=;
 b=m0/WXGV7+WeK7dFJRaRAB8RiT8iuPY2WAcn05vUzE7KGTlxtO1lHY0zvAFABq4Wrl8cnwZyEVsMVjqbXufWFMA61yzp2Wu+UWBsyJmeOuHZqUB2GgYjdf9Gosb5QZkDlJB3pYUhxGbKAq+LD1cENt9NYJ87t6bwhirCNCQLP69Q=
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
