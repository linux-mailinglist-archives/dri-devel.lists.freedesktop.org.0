Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9AADF38A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 18:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741FE6E18E;
	Mon, 21 Oct 2019 16:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0a::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4BA6E187
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 16:47:44 +0000 (UTC)
Received: from VI1PR08CA0150.eurprd08.prod.outlook.com (2603:10a6:800:d5::28)
 by AM5PR0801MB1987.eurprd08.prod.outlook.com (2603:10a6:203:47::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.19; Mon, 21 Oct
 2019 16:47:40 +0000
Received: from DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::202) by VI1PR08CA0150.outlook.office365.com
 (2603:10a6:800:d5::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2367.21 via Frontend
 Transport; Mon, 21 Oct 2019 16:47:40 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT015.mail.protection.outlook.com (10.152.20.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 21 Oct 2019 16:47:39 +0000
Received: ("Tessian outbound 0cf06bf5c60e:v33");
 Mon, 21 Oct 2019 16:47:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 89bd12e1453a1bd7
X-CR-MTA-TID: 64aa7808
Received: from 26dbf25f3ac7.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9AA667B3-BC90-4D48-A6C9-F3A33A3B69B5.1; 
 Mon, 21 Oct 2019 16:47:27 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 26dbf25f3ac7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Oct 2019 16:47:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpLw7VCKGQF0I9Wxbi3OUepmlFpgjF4OUW++aSWsnYNeWr726at2Fk5fvYRikwgVgbye95LxX6JWjZFIcbRF2LUZ/PXLPdgUmKGKcJEweyY1O8VV3k0XQjEXykL51egjLwykskbXJ+9s0sRo1+g2muX6pajGB6RnxCdw2mwXDRhWaedxjKO2Sjz+gUWzQWNEDlqbVW0p+swpiWqIdXaBe4t05cUXtc2qM/+9+MusX1G5dzafmRzH8YWoxxlAB6zJZw7T3tt4tlPYpgbGHamgXPsnSEntiAN5wQXmd1NhfcsoD/bS48xxdodL5d0lDiWLCNjyR1wRDdY+LyefnehGmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2yjDsqDr+TeKkIanekjVyEis3xaMX3qJidSclXgt24=;
 b=b0dLeeo3FYwc4fpZyiBOrhwv02z2EuvlGoRXyQ77cLwLwc8DNktN3J/GiefLEFIFPUxzx9xnelQHFlt0ZbL85GfYOjBQWhXFz2tGgdy91JSZlrCE2Ua6IAYcG0cLH3idWBcsHr48+qaiIhBX+xUjKzQzSmCIfKifwi7YFS9gGFq0jEmfjc6+r/qsgXUTdy3eAcT+ZrfIEdwQ3gUtvjbo1fb1balEPW+rSWctsc5bBH+OkGMSGrdtS2blZB3t+Gy5MweYJ0iwbYkXjrX0F6y/26ts9N6yC2L1SalIDGj6u3nR52yxCCdJ5RY93bATySz1DBV+4Lm004XBr4kC6fne1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3693.eurprd08.prod.outlook.com (20.178.13.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Mon, 21 Oct 2019 16:47:24 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2367.022; Mon, 21 Oct 2019
 16:47:24 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/5] drm/komeda: Optionally dump DRM state on interrupts
Thread-Topic: [PATCH 3/5] drm/komeda: Optionally dump DRM state on interrupts
Thread-Index: AQHViC82sr9B7tdJG0SX6V/x8vl4Ug==
Date: Mon, 21 Oct 2019 16:47:24 +0000
Message-ID: <20191021164654.9642-4-mihail.atanassov@arm.com>
References: <20191021164654.9642-1-mihail.atanassov@arm.com>
In-Reply-To: <20191021164654.9642-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.51]
x-clientproxiedby: LO2P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::15) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c96deefc-311b-4ce8-29f5-08d756466237
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB3693:|VI1PR08MB3693:|AM5PR0801MB1987:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1987939C853B33445608904B8F690@AM5PR0801MB1987.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 0197AFBD92
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(199004)(189003)(11346002)(6436002)(316002)(54906003)(256004)(8936002)(6512007)(14444005)(2501003)(71200400001)(5640700003)(71190400001)(50226002)(486006)(2906002)(446003)(6486002)(2616005)(44832011)(5660300002)(8676002)(476003)(305945005)(66066001)(36756003)(86362001)(25786009)(14454004)(186003)(478600001)(6506007)(386003)(102836004)(26005)(4326008)(2351001)(81156014)(1076003)(6116002)(3846002)(66946007)(81166006)(66556008)(52116002)(66476007)(7736002)(64756008)(66446008)(99286004)(76176011)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3693;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: fI5DFA0OaEvwUGRfBjUPpzYFwp6+qufH86B3IzpDme/hNcrwas42rl1RYOzrMJPeIZ2q6f8U3D1D8ndhzgGxG8dLQWv3tNPFRM5aPCF+97FZ53Pv/ZJovdyEHv4T7jieGQKUwp92S/AHF3ySlxHg5iduTFhpjRKhz6jexhe+dLSGsg98p9R17dPnrbEtXOB1NoRZih9H4MuVBmrnDAtsfP7YCrFT5eYb+okQRDGJVuJs3OV24WiliUsQ+aTppItNJCUD82IxN0mNCPTvybzSxrfXvvgn25NFZgC+XZBRUt67ouRZJeEPqsHCIz72POzorwIxPRwmsQCAUB+ySdaq07ySxkmttrXa5lNe8vTf2eaQbhZt+TCsCrk8apbgHqlEGlb+1AyYPkbJbkz5NQ3Spiq3Xc+GTcv0exOBHgXc3U+mHPgsDNMsHWJA+r6bm4zw
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3693
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(346002)(396003)(199004)(189003)(99286004)(6916009)(22756006)(14444005)(356004)(25786009)(76176011)(102836004)(386003)(6506007)(14454004)(2351001)(5660300002)(66066001)(6512007)(1076003)(47776003)(5640700003)(63350400001)(336012)(305945005)(7736002)(486006)(446003)(126002)(476003)(4326008)(26005)(2616005)(11346002)(26826003)(8746002)(6486002)(36756003)(70586007)(76130400001)(478600001)(2906002)(81156014)(186003)(81166006)(8676002)(3846002)(54906003)(6116002)(70206006)(2501003)(8936002)(86362001)(50466002)(107886003)(50226002)(23756003)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0801MB1987;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: b784c45c-298f-4e8e-90b0-08d75646595f
NoDisclaimer: True
X-Forefront-PRVS: 0197AFBD92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XEv93rUfbNutz8Yv3V1JnWYqCbTSV281tSUnonYMsmXnDlr7P6OGQa8u4yIgIKmKFvNQn11S/5peCFNe0nZYDiOdlu3KbZuj4mQcTIaz1B6liDp8bxmGOF2E5O2ljsV/9DeUP7calPPvXx3SsQAmCWQhwg6CLHjOyaHCKKrouRIRwE6+gkjMOlamx3H8QN9jwuhG94V/UNYWcFjtV3xcTNEWZYeOdNPEc2HsTN51dXPc7swegRret8xGNEBN06zRAfuhfrIf59qKZ4arfJl812Hr6x+ucs4cA8cfkbczoeZfGZLjDvBuO3qKULsQv0YozPpcGT4DMEQIfprtFJMG+fTbnPZDx9QeRuEo9C41fxAnCV4YWzKmulnnvcdMZ/7tN7ECJ9bkoVLtG8RQsbCXcdao4ABha0FsD3i88wAQOE+WfMu+eyUBfYex0AjZkeLO
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2019 16:47:39.1175 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c96deefc-311b-4ce8-29f5-08d756466237
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1987
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2yjDsqDr+TeKkIanekjVyEis3xaMX3qJidSclXgt24=;
 b=QqpqHXPcUBjttmeWlYY57e05gCm61hv5Lljdi6SfJw6DQJnqtdexMLY7YSyTYnpNq7fvfWKTKffp9idrN843Pmb+Bi/G7bnEh7TcOIT4XhNgnnAV6MGCul7upB2JUm3fyaW2qZZ3gf3hWpSoMODzyCUe6H6D6d9SzhvXygoMO7s=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2yjDsqDr+TeKkIanekjVyEis3xaMX3qJidSclXgt24=;
 b=QqpqHXPcUBjttmeWlYY57e05gCm61hv5Lljdi6SfJw6DQJnqtdexMLY7YSyTYnpNq7fvfWKTKffp9idrN843Pmb+Bi/G7bnEh7TcOIT4XhNgnnAV6MGCul7upB2JUm3fyaW2qZZ3gf3hWpSoMODzyCUe6H6D6d9SzhvXygoMO7s=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=none
 action=none header.from=arm.com;
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
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "james qian wang \(Arm
 Technology China\)" <james.qian.wang@arm.com>, "Lowry Li \(Arm Technology
 China\)" <Lowry.Li@arm.com>, nd <nd@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQncyBwb3RlbnRpYWxseSB1c2VmdWwgaW5mb3JtYXRpb24gd2hlbiBkaWFnbm9zaW5nIGVycm9y
L3dhcm4gSVJRcywgc28KZHVtcCBpdCB0byBkbWVzZyB3aXRoIGEgZHJtX2luZm9fcHJpbnRlci4g
SGlkZSB0aGlzIGV4dHJhIGRlYnVnIGR1bXBpbmcKYmVoaW5kIGFub3RoZXIga29tZWRhX2Rldi0+
ZXJyX3ZlcmJvc2l0eSBiaXQuCgpOb3RlIHRoYXQgdGhlcmUncyBub3QgbXVjaCBzZW5zZSBpbiBk
dW1waW5nIGl0IGZvciBJTkZPIGV2ZW50cywKc2luY2UgdGhlIFZTWU5DIGV2ZW50IHdpbGwgc3dh
bXAgdGhlIGxvZy4KClNpZ25lZC1vZmYtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFu
YXNzb3ZAYXJtLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9kZXYuaCAgIHwgNSArKysrLQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfZXZlbnQuYyB8IDggKysrKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2Rldi5oCmluZGV4IDgzMWMzNzUxODBmOC4uNDgwOTAwMGMxZWZiIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYu
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaApA
QCAtMjA1LDExICsyMDUsMTQgQEAgc3RydWN0IGtvbWVkYV9kZXYgewogCS8qKgogCSAqIEBlcnJf
dmVyYm9zaXR5OiBiaXRtYXNrIGZvciBob3cgbXVjaCBleHRyYSBpbmZvIHRvIHByaW50IG9uIGVy
cm9yCiAJICoKLQkgKiBTZWUgS09NRURBX0RFVl8qIG1hY3JvcyBmb3IgZGV0YWlscy4KKwkgKiBT
ZWUgS09NRURBX0RFVl8qIG1hY3JvcyBmb3IgZGV0YWlscy4gTG93IGJ5dGUgY29udGFpbnMgdGhl
IGRlYnVnCisJICogbGV2ZWwgY2F0ZWdvcmllcywgdGhlIGhpZ2ggYnl0ZSBjb250YWlucyBleHRy
YSBkZWJ1ZyBvcHRpb25zLgogCSAqLwogCXUxNiBlcnJfdmVyYm9zaXR5OwogCS8qIFByaW50IGEg
c2luZ2xlIGxpbmUgcGVyIGVycm9yIHBlciBmcmFtZSB3aXRoIGVycm9yIGV2ZW50cy4gKi8KICNk
ZWZpbmUgS09NRURBX0RFVl9QUklOVF9FUlJfRVZFTlRTIEJJVCgwKQorCS8qIER1bXAgRFJNIHN0
YXRlIG9uIGFuIGVycm9yIG9yIHdhcm5pbmcgZXZlbnQuICovCisjZGVmaW5lIEtPTUVEQV9ERVZf
UFJJTlRfRFVNUF9TVEFURV9PTl9FVkVOVCBCSVQoOCkKIH07CiAKIHN0YXRpYyBpbmxpbmUgYm9v
bApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
ZXZlbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2V2ZW50
LmMKaW5kZXggNTc1ZWQ0ZGY3NGVkLi41ZGE2MWU3ZDc1ZDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2V2ZW50LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZXZlbnQuYwpAQCAtNCw2ICs0LDcgQEAK
ICAqIEF1dGhvcjogSmFtZXMuUWlhbi5XYW5nIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KICAq
CiAgKi8KKyNpbmNsdWRlIDxkcm0vZHJtX2F0b21pYy5oPgogI2luY2x1ZGUgPGRybS9kcm1fcHJp
bnQuaD4KIAogI2luY2x1ZGUgImtvbWVkYV9kZXYuaCIKQEAgLTExMyw2ICsxMTQsNyBAQCB2b2lk
IGtvbWVkYV9wcmludF9ldmVudHMoc3RydWN0IGtvbWVkYV9ldmVudHMgKmV2dHMsIHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYpCiAJc3RhdGljIGJvb2wgZW5fcHJpbnQgPSB0cnVlOwogCXN0cnVjdCBr
b21lZGFfZGV2ICptZGV2ID0gZGV2LT5kZXZfcHJpdmF0ZTsKIAl1MTYgY29uc3QgZXJyX3ZlcmJv
c2l0eSA9IG1kZXYtPmVycl92ZXJib3NpdHk7CisJdTY0IGV2dHNfbWFzayA9IGV2dHMtPmdsb2Jh
bCB8IGV2dHMtPnBpcGVzWzBdIHwgZXZ0cy0+cGlwZXNbMV07CiAKIAkvKiByZWR1Y2UgdGhlIHNh
bWUgbXNnIHByaW50LCBvbmx5IHByaW50IHRoZSBmaXJzdCBldnQgZm9yIG9uZSBmcmFtZSAqLwog
CWlmIChldnRzLT5nbG9iYWwgfHwgaXNfbmV3X2ZyYW1lKGV2dHMpKQpAQCAtMTIzLDkgKzEyNSwx
MCBAQCB2b2lkIGtvbWVkYV9wcmludF9ldmVudHMoc3RydWN0IGtvbWVkYV9ldmVudHMgKmV2dHMs
IHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAJaWYgKGVycl92ZXJib3NpdHkgJiBLT01FREFfREVW
X1BSSU5UX0VSUl9FVkVOVFMpCiAJCXByaW50X2V2dHMgfD0gS09NRURBX0VSUl9FVkVOVFM7CiAK
LQlpZiAoKGV2dHMtPmdsb2JhbCB8IGV2dHMtPnBpcGVzWzBdIHwgZXZ0cy0+cGlwZXNbMV0pICYg
cHJpbnRfZXZ0cykgeworCWlmIChldnRzX21hc2sgJiBwcmludF9ldnRzKSB7CiAJCWNoYXIgbXNn
WzI1Nl07CiAJCXN0cnVjdCBrb21lZGFfc3RyIHN0cjsKKwkJc3RydWN0IGRybV9wcmludGVyIHAg
PSBkcm1faW5mb19wcmludGVyKGRldi0+ZGV2KTsKIAogCQlzdHIuc3RyID0gbXNnOwogCQlzdHIu
c3ogID0gc2l6ZW9mKG1zZyk7CkBAIC0xMzksNiArMTQyLDkgQEAgdm9pZCBrb21lZGFfcHJpbnRf
ZXZlbnRzKHN0cnVjdCBrb21lZGFfZXZlbnRzICpldnRzLCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
KQogCQlldnRfc3RyKCZzdHIsIGV2dHMtPnBpcGVzWzFdKTsKIAogCQlEUk1fRVJST1IoImVyciBk
ZXRlY3Q6ICVzXG4iLCBtc2cpOworCQlpZiAoKGVycl92ZXJib3NpdHkgJiBLT01FREFfREVWX1BS
SU5UX0RVTVBfU1RBVEVfT05fRVZFTlQpCisJCSAgICAmJiAoZXZ0c19tYXNrICYgKEtPTUVEQV9F
UlJfRVZFTlRTIHwgS09NRURBX1dBUk5fRVZFTlRTKSkpCisJCQlkcm1fc3RhdGVfZHVtcChkZXYs
ICZwKTsKIAogCQllbl9wcmludCA9IGZhbHNlOwogCX0KLS0gCjIuMjMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
