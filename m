Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC9DF2DA2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 12:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3355D6F665;
	Thu,  7 Nov 2019 11:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe07::610])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 992C46F667
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 11:42:50 +0000 (UTC)
Received: from VE1PR08CA0009.eurprd08.prod.outlook.com (2603:10a6:803:104::22)
 by AM6PR08MB4833.eurprd08.prod.outlook.com (2603:10a6:20b:ce::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20; Thu, 7 Nov
 2019 11:42:47 +0000
Received: from DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::203) by VE1PR08CA0009.outlook.office365.com
 (2603:10a6:803:104::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20 via Frontend
 Transport; Thu, 7 Nov 2019 11:42:47 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT028.mail.protection.outlook.com (10.152.20.99) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.21 via Frontend Transport; Thu, 7 Nov 2019 11:42:47 +0000
Received: ("Tessian outbound 0939a6bab6b1:v33");
 Thu, 07 Nov 2019 11:42:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2becc7e6f318a98b
X-CR-MTA-TID: 64aa7808
Received: from c990ab8b960a.2 (cr-mta-lb-1.cr-mta-net [104.47.10.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A55E4A59-CB71-49AE-B389-EEA9751D9034.1; 
 Thu, 07 Nov 2019 11:42:42 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c990ab8b960a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Thu, 07 Nov 2019 11:42:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjL8f58YFKsPXiZL3S+VMSxOPvEuEAgLMjBN9LMo95uXRqWFs19iYYzrgFlsWp/RGjpabBNN9IpC/Q1vmbdWzUXkyv3Ahkdy9IwOzqrUV5BXr2X8vkmz9jyvk7s2whQIO4Er1rQugAby4kplQzd6iv0FH/qqiWQDQ3l4UAAgqy1rYycEHxdvfVETQ2DgxFMWM8gzxLwkxNUzW9AzClens/9cFobKJbDCOVfKCDI8L0l3fGS/sUEcaln3IA7uRfscfT6JXCw/Fa0pEB5radaZMzDEs0FTOrLo7m3jyuaErgjTwakNM1MXRyrxjfyNn6kR8OOqhV7joGsWyGDQJ10FxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdEv+rpc6/qvleFAe3PSD5v3Qd51wjznRg/0aKpB75s=;
 b=hF/N2w9jPzWVDVLhdCGq4aM36c+nPOrwe0lcJWE6TINJaRQPYiS510kZwaJ6fGKCWebrud6Ithq8GTOYLR41VJe67Xl5oBznmfOinhJc2eWGklJNwsPi7tQshuxA7RqMIcU48X1RfyExOSaaOfkRrgVOx711g9ev+2p4tb0rAcYvHm4LVBiPGQzomoLJ+rtPZogDy+HEYYFBvI3yd6cLV0ouRxn4l8V9X7hgVhy0febrbgTE87rQmXB8fRHZMgBqQpyT3hfMziQ9Wnt1yXiEvoF1tjt5G5L9AgMpFIyeZVSqXhBFofoh49zLPp6XWYBlj4EzDaUb3wtYo8kIlAYQrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4351.eurprd08.prod.outlook.com (20.179.27.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Thu, 7 Nov 2019 11:42:40 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2408.028; Thu, 7 Nov 2019
 11:42:40 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 4/5] drm/komeda: Add option to print WARN- and INFO-level
 IRQ events
Thread-Topic: [PATCH v2 4/5] drm/komeda: Add option to print WARN- and
 INFO-level IRQ events
Thread-Index: AQHVlWB1Q0f+vy2V1k2vOdtTiirrgQ==
Date: Thu, 7 Nov 2019 11:42:40 +0000
Message-ID: <20191107114155.54307-5-mihail.atanassov@arm.com>
References: <20191107114155.54307-1-mihail.atanassov@arm.com>
In-Reply-To: <20191107114155.54307-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0146.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::14) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4c5d27c1-78e8-465b-026f-08d763779c95
X-MS-TrafficTypeDiagnostic: VI1PR08MB4351:|VI1PR08MB4351:|AM6PR08MB4833:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB48339590056EE81A99454D6D8F780@AM6PR08MB4833.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1388;OLM:1388;
x-forefront-prvs: 0214EB3F68
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(189003)(199004)(11346002)(316002)(54906003)(446003)(476003)(50226002)(71200400001)(6512007)(305945005)(6916009)(2906002)(8936002)(2616005)(44832011)(4326008)(6436002)(66066001)(256004)(486006)(86362001)(26005)(71190400001)(36756003)(52116002)(2351001)(14444005)(6506007)(99286004)(6486002)(102836004)(2501003)(76176011)(386003)(186003)(6116002)(14454004)(66946007)(66476007)(66556008)(64756008)(66446008)(25786009)(478600001)(1076003)(3846002)(8676002)(81166006)(81156014)(7736002)(5640700003)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4351;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: elWFsN2V9a1CqgiI+GP4h/WKFoNbsOG3+MaqvodtFPnx2KJ6KQCrL3is6DZpaWjbpvllnAl6KSVpmrfmNRiOp2dYrKG9XeBqbWQrtTnhHHg7i85L9Lw3JjaeyAQjFhIZjugyDtU0xpSH3IYf2hykze7AD9o/jYNnZJJMnESqEL/uLzk4R+3bSRv77NRAs0K3FzgW+ons8+6EIt9pGkurUKzztACDen9TkdOcJS8CyBOjSv9H7m+dhhlXhTwVfPkdlmQLfByTIRSH6dJ8G0a88aqIhhVjv+PKlmdcMDp/Im9qhHV2S6gRKR0WK0cYc6QPU02OzoY+k1jmiXkWDk+HOmtjS0fQkfwi/s1um/8EMEA9BIz9FdvXJRud3gEOaT1v6gdHac4auSJZvIg7pRY1S5uL2Z3rC2NLNEDEgMWDHEP6LRLuofuJPGoB9QtSGlfm
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4351
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(136003)(1110001)(339900001)(189003)(199004)(8936002)(1076003)(2351001)(107886003)(25786009)(102836004)(36756003)(50466002)(14454004)(6916009)(4326008)(478600001)(76130400001)(23756003)(86362001)(99286004)(186003)(305945005)(5660300002)(6116002)(81166006)(76176011)(81156014)(8746002)(26005)(3846002)(50226002)(2501003)(7736002)(26826003)(8676002)(476003)(11346002)(14444005)(6512007)(6506007)(386003)(66066001)(2616005)(486006)(22756006)(47776003)(446003)(316002)(5640700003)(70206006)(2906002)(70586007)(356004)(54906003)(105606002)(126002)(6486002)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4833;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a90ed5b8-f7c6-46f0-6b5b-08d763779838
NoDisclaimer: True
X-Forefront-PRVS: 0214EB3F68
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WKBjJMH2UnB1KIqmRwWwg6dVKLHJOh78r7bTIEXjXUl6jS7DVOXUKq2O8Fs7lDfTMAXAePkc9heU/MOrJzCJhDUucBnaj6kHpgLI1LducH4KXopwa53aH7K+nXel7ZqK45zfZFwkjjfJr2yq3FGxUGJKdyWvy1RiCgfFAS2pt7VaU7WwvnKZM+L5W7stGocU+CU9m+RDMxJ1GsiHeSa7EbmA9exxsmTYgxiAcIMTgXuk7sHDV+nmhyKex7EDwRTWCzg7qo7Axx3tFKOJe1x8VFc7s57Z38WHtWgaa9KgzrCqbHGWOU6Vup6Sn3+18xf68Be4q1Z8D482fcCTjKd5fy6QCP2AcOdpikPcNH2AL50A9xaVkt7VztB9kq3IjF8lD5KgNKh59XWnFPHcIEZEvikEJvJ3GEHvFFVn+YyYcZwzujo3AQkCXD9XFjQpHaHh
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2019 11:42:47.4973 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c5d27c1-78e8-465b-026f-08d763779c95
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4833
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdEv+rpc6/qvleFAe3PSD5v3Qd51wjznRg/0aKpB75s=;
 b=DbhV45SVQ5sL8qYSzLQMIxD0HljUXf8wIRfthvGzTfpLQLwh5qjCJd1oqvEf3VKgip6FoJOJ/3e3ZHV7xMt6foWaS7HEt7zrsgT3I5ax15vAK4Re0iO3ZjTfoQrL4gi1OadYyVlsthr3wA5jt/FUfZPwEqHy/GvC3bk+CrbC7T0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdEv+rpc6/qvleFAe3PSD5v3Qd51wjznRg/0aKpB75s=;
 b=DbhV45SVQ5sL8qYSzLQMIxD0HljUXf8wIRfthvGzTfpLQLwh5qjCJd1oqvEf3VKgip6FoJOJ/3e3ZHV7xMt6foWaS7HEt7zrsgT3I5ax15vAK4Re0iO3ZjTfoQrL4gi1OadYyVlsthr3wA5jt/FUfZPwEqHy/GvC3bk+CrbC7T0=
X-Mailman-Original-Authentication-Results: spf=fail (sender IP is 63.35.35.123)
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
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>, nd <nd@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RXh0cmEgZGV0YWlsIChub3JtYWxseSBvZmYpIGFsbW9zdCBuZXZlciBodXJ0cy4KClJldmlld2Vk
LWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53
YW5nQGFybS5jb20+ClNpZ25lZC1vZmYtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFu
YXNzb3ZAYXJtLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9kZXYuaCAgIHwgMTEgKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2V2ZW50LmMgfCAgNCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE1IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9kZXYuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2Rldi5oCmluZGV4IDQ4MDkwMDBjMWVmYi4uZDlmYzljNDg4NTlhIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaAorKysgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaApAQCAtNTEsNiArNTEs
MTMgQEAKIAogI2RlZmluZSBLT01FREFfV0FSTl9FVkVOVFMJS09NRURBX0VSUl9DU0NFCiAKKyNk
ZWZpbmUgS09NRURBX0lORk9fRVZFTlRTICh7MCBcCisJCQkgICAgfCBLT01FREFfRVZFTlRfVlNZ
TkMgXAorCQkJICAgIHwgS09NRURBX0VWRU5UX0ZMSVAgXAorCQkJICAgIHwgS09NRURBX0VWRU5U
X0VPVyBcCisJCQkgICAgfCBLT01FREFfRVZFTlRfTU9ERSBcCisJCQkgICAgfSkKKwogLyogbWFs
aWRwIGRldmljZSBpZCAqLwogZW51bSB7CiAJTUFMSV9ENzEgPSAwLApAQCAtMjExLDYgKzIxOCwx
MCBAQCBzdHJ1Y3Qga29tZWRhX2RldiB7CiAJdTE2IGVycl92ZXJib3NpdHk7CiAJLyogUHJpbnQg
YSBzaW5nbGUgbGluZSBwZXIgZXJyb3IgcGVyIGZyYW1lIHdpdGggZXJyb3IgZXZlbnRzLiAqLwog
I2RlZmluZSBLT01FREFfREVWX1BSSU5UX0VSUl9FVkVOVFMgQklUKDApCisJLyogUHJpbnQgYSBz
aW5nbGUgbGluZSBwZXIgd2FybmluZyBwZXIgZnJhbWUgd2l0aCBlcnJvciBldmVudHMuICovCisj
ZGVmaW5lIEtPTUVEQV9ERVZfUFJJTlRfV0FSTl9FVkVOVFMgQklUKDEpCisJLyogUHJpbnQgYSBz
aW5nbGUgbGluZSBwZXIgaW5mbyBldmVudCBwZXIgZnJhbWUgd2l0aCBlcnJvciBldmVudHMuICov
CisjZGVmaW5lIEtPTUVEQV9ERVZfUFJJTlRfSU5GT19FVkVOVFMgQklUKDIpCiAJLyogRHVtcCBE
Uk0gc3RhdGUgb24gYW4gZXJyb3Igb3Igd2FybmluZyBldmVudC4gKi8KICNkZWZpbmUgS09NRURB
X0RFVl9QUklOVF9EVU1QX1NUQVRFX09OX0VWRU5UIEJJVCg4KQogfTsKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2V2ZW50LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9ldmVudC5jCmluZGV4IGRlOTlhNTg4
ZWQ3NS4uN2ZkNjI0NzYxYTJiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9ldmVudC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2V2ZW50LmMKQEAgLTEyNCw2ICsxMjQsMTAgQEAgdm9pZCBrb21lZGFf
cHJpbnRfZXZlbnRzKHN0cnVjdCBrb21lZGFfZXZlbnRzICpldnRzLCBzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2KQogCiAJaWYgKGVycl92ZXJib3NpdHkgJiBLT01FREFfREVWX1BSSU5UX0VSUl9FVkVO
VFMpCiAJCXByaW50X2V2dHMgfD0gS09NRURBX0VSUl9FVkVOVFM7CisJaWYgKGVycl92ZXJib3Np
dHkgJiBLT01FREFfREVWX1BSSU5UX1dBUk5fRVZFTlRTKQorCQlwcmludF9ldnRzIHw9IEtPTUVE
QV9XQVJOX0VWRU5UUzsKKwlpZiAoZXJyX3ZlcmJvc2l0eSAmIEtPTUVEQV9ERVZfUFJJTlRfSU5G
T19FVkVOVFMpCisJCXByaW50X2V2dHMgfD0gS09NRURBX0lORk9fRVZFTlRTOwogCiAJaWYgKGV2
dHNfbWFzayAmIHByaW50X2V2dHMpIHsKIAkJY2hhciBtc2dbMjU2XTsKLS0gCjIuMjMuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
