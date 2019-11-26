Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 805B1109EF0
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B4C6E3AA;
	Tue, 26 Nov 2019 13:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20068.outbound.protection.outlook.com [40.107.2.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10C96E353
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:36 +0000 (UTC)
Received: from DB6PR0802CA0035.eurprd08.prod.outlook.com (2603:10a6:4:a3::21)
 by AM6PR08MB3624.eurprd08.prod.outlook.com (2603:10a6:20b:51::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.19; Tue, 26 Nov
 2019 13:16:34 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::207) by DB6PR0802CA0035.outlook.office365.com
 (2603:10a6:4:a3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:34 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:34 +0000
Received: ("Tessian outbound f7868d7ede10:v33");
 Tue, 26 Nov 2019 13:16:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: aac1fcd0c00e6b7f
X-CR-MTA-TID: 64aa7808
Received: from ca8072fa316b.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AB9D895B-6E73-4B15-BF4B-B77228907F38.1; 
 Tue, 26 Nov 2019 13:16:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ca8072fa316b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SlxdArcN4CwjBPfBGURSgQ9XQMCL8f2W4sA2xCZDbmK9aR6PtdQbywvU2Q022Dvp8K7/0c3lBKf6ppRccuyCUA35gDSQU16UpWJ9ZjVg75JwpXRphF2LTHuC7UkT00F/Sgx07RMjEF7HU5l2tjtVQuKeSQnSPj5Li5WpbkFKFqxLnvc+9R7wOKHPcjfXEmKYPHrJAjzQT5uHiYJtbyfI2IqtfCgI/VzAeepHhSD0KsStnAxLA3yXdY/n0ZeivYS2grwtHmDlkrsubi91oQdWWk9KiVf16+VPzkX8kRjpIoVpPt/c39nIuChi+79B3uoxs+8oJuGXlgQisnJEyg448A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZaGqNH19yTAtwda+zKzHMpmANYqCLZgGbmyripuWOM=;
 b=laOOieiPnTczKtVdEHvPsv4apAfFMuK6NvrE0zuOM24pLBI3U0Bpf/wuOqPKU6WJKWSLl6oW93zP6zEmjq25hEeKtkZ4MIYd60UoUcR0GK2jEMfKTcJClUDuyucBHgA/lvjFN9ZNBCBwKWUu01VdoKQUpuSH22vvqMVYwQJ9YUxY/wATv6ia58g0YQX3Gs6ycferPIZpD5iCjSSmsz0IREi72NHYWZ9gOo1b+8tY7utNkbj+sBVe1swxvbfh/SLCDJqSlPajVUysCSGq+VXIU3OLVVv7V64IgkPKJ00vT9zYrldnoo/Fbf6pn+PtHAsF541bmBSb0ve6kIEpj0zmFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:26 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:26 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 28/30] drm/sti: sti_vdo: Use drm_bridge_init()
Thread-Topic: [PATCH 28/30] drm/sti: sti_vdo: Use drm_bridge_init()
Thread-Index: AQHVpFu0SLTgMcz7kE2lTsCMHso8OA==
Date: Tue, 26 Nov 2019 13:16:26 +0000
Message-ID: <20191126131541.47393-29-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3144c321-6df9-41b2-63ab-08d77272dc36
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|AM6PR08MB3624:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB36240B80ACBEDE4E98B54E9A8F450@AM6PR08MB3624.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:376;OLM:376;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(1496009)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(5640700003)(86362001)(6512007)(71200400001)(2616005)(6486002)(71190400001)(2906002)(4326008)(6916009)(44832011)(446003)(11346002)(54906003)(66946007)(316002)(66446008)(64756008)(66556008)(66476007)(6436002)(4744005)(8936002)(186003)(26005)(5660300002)(102836004)(305945005)(14454004)(25786009)(99286004)(81166006)(50226002)(478600001)(2501003)(7736002)(6116002)(2351001)(76176011)(1076003)(52116002)(66066001)(256004)(5024004)(8676002)(81156014)(6506007)(3846002)(386003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4317;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: sGQjoHsgMzSRZQ/1K0IR2Stc7E/EtCzd339tCrDNQp8dS/llzJd8dfDqNI3h7VC7dS3kPk5lS7PC46XKJEJTvgO5yhbn5nqw4+ZMcAnITnKpFFE4pnW4WBQoC+wWmtFwhChYjTVjG7HT+2099uakDaC58Y3I0COEMA6iem/E1AOg8uF2/E6HP9xqubyo93+2oqHpxOk+5anBCZ8ywQ/l08K4GfYFiYDIgK0CPF/C+YU9N00Y9xzgYBWkas/MYgcUw6N4oWNQosw+kZqCRZqYKiYCoVpLiz9SNmdZc03y/7fpeRdckAhNs9PTDRjuKnLbtgpQnqRF7QwncwSSYy+peTyigjZ3b/fd+SB05WSt7QyqksIhVHtYSm4Otog9zndWtMruYkGfBZVkAT/8OwcPy23JWX+k1pJHVa0JwsjoS7UhKKCbfGvZOa/Ah6ligOq8
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(39860400002)(376002)(199004)(189003)(6512007)(6486002)(5640700003)(386003)(107886003)(76176011)(102836004)(86362001)(186003)(6506007)(26005)(5660300002)(70586007)(70206006)(76130400001)(2501003)(2616005)(11346002)(336012)(446003)(81156014)(8676002)(1076003)(50226002)(305945005)(3846002)(6116002)(6916009)(7736002)(4744005)(25786009)(81166006)(8746002)(2906002)(4326008)(14454004)(8936002)(478600001)(26826003)(36756003)(2351001)(66066001)(47776003)(36906005)(5024004)(106002)(23756003)(54906003)(99286004)(50466002)(356004)(22756006)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3624;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0031a196-eeaf-4416-a93a-08d77272d730
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VwA9/yO4cSdKdJ6yKH1W1uHjclFa8sx4V9wpFh96rDl5nSHawUg1gk2Etgtge7Jz6WIQioRUT/NGZrwEwvqgNvsSoQIQ6++VYnFyab8hm4PkpA4gAubrSeaCpLL5LI1EdD/YIiN2kv8y62h6v6qAyO1BzrD3xuCzTuQLNBQ/GKXWtyxfEmiNXZdR8x/QGGbUaQwOXUbtoNjBPwDtkzcBVMufV8HSnhpVIktedi1LiK6BWNJlK50WdRwlqi5DA2YObrza319X7AKvYAB62+ckv8pcLtvLz/7S2EXDwZbEH8MmSOWdGGqmiUm9fjtICX8S0ocXPSNHb0dhV0ZyMxgrqTV0gJFkOw8EaRjLfNQAh7spdoQQ6H0Xpkh3IJ6HXBYrQfWE4mG0nowowfRZWfAvmoE//B4S1Uin6AXw09pO+44jitmfcgOQ/FgFoBQly7vM
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:34.1203 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3144c321-6df9-41b2-63ab-08d77272dc36
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3624
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZaGqNH19yTAtwda+zKzHMpmANYqCLZgGbmyripuWOM=;
 b=isZL5Hjp6fmEIShdRNqbtk1s9m8jLA2hguCixE6wSSDDJn60D99TuI3OrOvIn/8q+eTkZlpYW2jia6G8fdTt89qlFlLsZCsNVBguxseQOR4GMGm+a0XW/KWEgeCZZUay7EE2G7G4w/ofc5J/lKClbL4X9uJeaPHMq4IopxvwDWY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZaGqNH19yTAtwda+zKzHMpmANYqCLZgGbmyripuWOM=;
 b=isZL5Hjp6fmEIShdRNqbtk1s9m8jLA2hguCixE6wSSDDJn60D99TuI3OrOvIn/8q+eTkZlpYW2jia6G8fdTt89qlFlLsZCsNVBguxseQOR4GMGm+a0XW/KWEgeCZZUay7EE2G7G4w/ofc5J/lKClbL4X9uJeaPHMq4IopxvwDWY=
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, nd <nd@arm.com>,
 Vincent Abriou <vincent.abriou@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfZHZv
LmMgfCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9kdm8uYyBiL2RyaXZlcnMv
Z3B1L2RybS9zdGkvc3RpX2R2by5jCmluZGV4IDY4Mjg5YjBiMDYzYS4uMjBhMzk1NmIzM2JjIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9kdm8uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vc3RpL3N0aV9kdm8uYwpAQCAtNDYyLDkgKzQ2Miw3IEBAIHN0YXRpYyBpbnQgc3RpX2R2
b19iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpk
YXRhKQogCWlmICghYnJpZGdlKQogCQlyZXR1cm4gLUVOT01FTTsKIAotCWJyaWRnZS0+ZHJpdmVy
X3ByaXZhdGUgPSBkdm87Ci0JYnJpZGdlLT5mdW5jcyA9ICZzdGlfZHZvX2JyaWRnZV9mdW5jczsK
LQlicmlkZ2UtPm9mX25vZGUgPSBkdm8tPmRldi5vZl9ub2RlOworCWRybV9icmlkZ2VfaW5pdChi
cmlkZ2UsICZkdm8tPmRldiwgJnN0aV9kdm9fYnJpZGdlX2Z1bmNzLCBOVUxMLCBkdm8pOwogCWRy
bV9icmlkZ2VfYWRkKGJyaWRnZSk7CiAKIAllcnIgPSBkcm1fYnJpZGdlX2F0dGFjaChlbmNvZGVy
LCBicmlkZ2UsIE5VTEwpOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
