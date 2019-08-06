Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D9482BAF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 08:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1ECA89DA4;
	Tue,  6 Aug 2019 06:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140085.outbound.protection.outlook.com [40.107.14.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E4D89DA4
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 06:32:17 +0000 (UTC)
Received: from VI1PR0802CA0011.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::21) by DB6PR0802MB2598.eurprd08.prod.outlook.com
 (2603:10a6:4:97::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.12; Tue, 6 Aug
 2019 06:32:14 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::204) by VI1PR0802CA0011.outlook.office365.com
 (2603:10a6:800:aa::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.14 via Frontend
 Transport; Tue, 6 Aug 2019 06:32:14 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 6 Aug 2019 06:32:12 +0000
Received: ("Tessian outbound 1e6e633a5b56:v26");
 Tue, 06 Aug 2019 06:32:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1dc7c2af83c44a27
X-CR-MTA-TID: 64aa7808
Received: from 310830fd9a82.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.13.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8BF8C2CC-FDCB-4037-9A17-FEE038CB7D2A.1; 
 Tue, 06 Aug 2019 06:32:02 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 310830fd9a82.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Aug 2019 06:32:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oc0fC0e6b3QnpyzaYSvIA0l6pkTXrQn7AudENQv3fJnQRqKZv2IwgZK/HB7sCc/no99L2XFD3QSmsUINTl4y4OznSwOtvXVpxNY7v9scnxkBqvJGRbZ+SHOZBpU2vFD/OpvjqLeq7fiY48LGSxierk9MgGkzuDqtJh1O5i4Xjh3IFymtvLXdP/6nbpVH9X8FotwP2VY4ayuCpJ4hXIaK94Kvwtmy/kK45FcrujOX7KhcphkGLIiPMwElIbNKDXSV3cmpSaHMJLR2n7AwPT4xvFjyeNrNJSFHxqdu21LRsUyeBn8Jv7UFK/LdjykhITxw6Tj6xslbvIuPnGh5D+KW/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0VVT2eU3D2sKLwNOSEdmVusF+uJxLrn88fc+KWl1XM=;
 b=RW/gVMqFEU2QOnirD5qSJ6Mu2a18fJ9cL8fp6qoGBUzJphbbDlx9PH+d0p+KdSqSclpv7Yt9tAGESAUnC9UcanjRHQHoSrsTCpwufShmZWg3T3YdvHOpx8v1oThP0q3unKRjBFbIZspSt7qMkERpENQwVvLwvIP4yXqfR5aJq7ieTOgQF3G5RlqIIhojOHp7dX9WGfJDymKLIEa/Pw4y56ONjot5ZI4IDT87KqRIXCP31071WQUN5PXGLWRSGxhMqMGBHniL6YNY0HwyintGHuWhdJagxGaV9UaBJcNRz9TWx7Zk9Tw71oueJ+lFgHV8pM53HfxSgxcUA6wNrpMuSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3598.eurprd08.prod.outlook.com (20.177.61.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Tue, 6 Aug 2019 06:31:56 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236%2]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 06:31:56 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>
Subject: [PATCH] drm/komeda: Adds internal bpp computing for arm afbc only
 format YU08 YU10
Thread-Topic: [PATCH] drm/komeda: Adds internal bpp computing for arm afbc
 only format YU08 YU10
Thread-Index: AQHVTCCkV8nwhj7hV0i5q+YUMqL9nw==
Date: Tue, 6 Aug 2019 06:31:56 +0000
Message-ID: <1565073104-24047-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR03CA0057.apcprd03.prod.outlook.com
 (2603:1096:202:17::27) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f07cf5d7-e295-4c91-714b-08d71a37d0f7
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3598; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB3598:|DB6PR0802MB2598:
X-Microsoft-Antispam-PRVS: <DB6PR0802MB2598B27CF7EC36AFA8B4BED09FD50@DB6PR0802MB2598.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3826;OLM:3826;
x-forefront-prvs: 0121F24F22
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(189003)(199004)(25786009)(478600001)(2616005)(476003)(6506007)(6636002)(36756003)(14454004)(66946007)(86362001)(2501003)(4326008)(386003)(316002)(2201001)(81156014)(55236004)(102836004)(50226002)(110136005)(305945005)(7736002)(5660300002)(6512007)(3846002)(71200400001)(14444005)(71190400001)(6116002)(186003)(99286004)(64756008)(6486002)(8936002)(486006)(53936002)(8676002)(66556008)(54906003)(66476007)(66446008)(81166006)(66066001)(68736007)(2906002)(6436002)(52116002)(26005)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3598;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: I7hIuDbOcBD0Q9CXIyVvVMZFu5rRHlDeuRTEyaEmv74mw3BZLlpu6l1xykmp4/V65UoPygO44lQ1UIGtO5iKi6QHWR4keBI0YTOFiTN3dQZth6kraP00vub0npL7FnLZ4PixZz758+ZWy8Zh9S7XLXI/w16Kkoi+JpgRi4XqlNKEgJ6z87sEmy3SdWYkbVaORMa/MZyjltC1xYPu9FJeTf+zZzwfJjKBTwjMAXT0Hy9Sg/IkbXHAcH+Dz6mxn7gecYyjF7dOSy6xsvlndRzoOMuT8FeG+EAHzqkdqMtXyCSR7pTQxZa67Jd+A/j71iBnt9uM+TZeW1Mjrq5bIatH8wCaIzH21crj47QnLiZ+rlX/jLJK42u8hRPp2NAsc/abn1NZP3egPBQ3Xz2qGJLXAa10urgwWa4Kn4d5jGGRZlI=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3598
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(396003)(346002)(2980300002)(189003)(199004)(36906005)(54906003)(102836004)(110136005)(8746002)(316002)(99286004)(4326008)(6506007)(386003)(7736002)(305945005)(81166006)(81156014)(22756006)(186003)(26005)(8676002)(6116002)(3846002)(50466002)(2906002)(126002)(476003)(66066001)(14444005)(86362001)(63370400001)(47776003)(76130400001)(63350400001)(486006)(6512007)(25786009)(23756003)(5660300002)(356004)(6486002)(6636002)(36756003)(26826003)(2616005)(336012)(14454004)(2201001)(70206006)(50226002)(2501003)(478600001)(8936002)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0802MB2598;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: edba3253-9b86-48e7-2d57-08d71a37c6f8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB6PR0802MB2598; 
NoDisclaimer: True
X-Forefront-PRVS: 0121F24F22
X-Microsoft-Antispam-Message-Info: cgTlw7WlwSqge4F/dMxyFI4/KzqRNGGQWcP7VYCRXJS6J6p6S35nriXZryKGlJBknhVZUvSkoqNIB+kVmI9EpzF/7GT1ZI3ITTZq4MM7MQCOQ4c3+wTSdu4T0yjeeG2F0o8a7ORXEdP1quzeqEWP/CpoZ6O7n64VCVBXnORQwe3qthbTqD8zNH7ESqqJvPm+XV286CsdObj8Bca51V/29L75B1x57WafZWHqKktmn1sA7ssjRzfxo7ZIRjWiKFUR1aYBcJXPKBbp+rKOlYlCskNlR3d0qIQSxaiKlUGjRHCPE1Bkwu2dRxH3b9GBFIorPff4kVevmFXIu94nC8GE6xA6wzde68xZk3yS4wx/LgWGvEnxbv8WdZLxjtuh2/8cZkckODPyhRKFz1lk/1Zd/tl5Sun1rDhx00hoXv+Fk14=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2019 06:32:12.6294 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f07cf5d7-e295-4c91-714b-08d71a37d0f7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2598
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0VVT2eU3D2sKLwNOSEdmVusF+uJxLrn88fc+KWl1XM=;
 b=lqagpC5wEd8SodC/4g9wFckJBqvXqZbVMRHbCUn+8RBZ4jy8+WObb2aIMQDCKjMSAS6LZV5/i0JhG91N3muel5i2M+uKsCJglCP4p8Hnc7ijVhrM61qySsgiziGNn7VJ94PZkSRFoTSGlGyIkUXdyjYoHCRGfGvng8ADE1BmJ90=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0VVT2eU3D2sKLwNOSEdmVusF+uJxLrn88fc+KWl1XM=;
 b=lqagpC5wEd8SodC/4g9wFckJBqvXqZbVMRHbCUn+8RBZ4jy8+WObb2aIMQDCKjMSAS6LZV5/i0JhG91N3muel5i2M+uKsCJglCP4p8Hnc7ijVhrM61qySsgiziGNn7VJ94PZkSRFoTSGlGyIkUXdyjYoHCRGfGvng8ADE1BmJ90=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=temperror action=none header.from=arm.com;
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogIkxvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkiIDxMb3dyeS5MaUBhcm0uY29t
PgoKVGhlIGRybV9mb3JtYXRfaW5mbyBkb2Vzbid0IGhhdmUgYW55IGNwcCBvciBibG9ja19zaXpl
IChib3RoIGFyZSB6ZXJvKQppbmZvcm1hdGlvbiBmb3IgYXJtIG9ubHkgYWZiYyBmb3JtYXQgWVUw
OC9ZVTEwLiB3ZSBuZWVkIHRvIGNvbXB1dGUgaXQKYnkgb3Vyc2VsdmVzLgoKQ2hhbmdlcyBzaW5j
ZSB2MToKMS4gUmVtb3ZlZCByZWR1bmRhbnQgd2FybmluZyBjaGVjayBpbiBrb21lZGFfZ2V0X2Fm
YmNfZm9ybWF0X2JwcCgpOwoyLiBSZW1vdmVkIGEgcmVkdW5kYW50IGVtcHR5IGxpbmU7CjMuIFJl
YmFzZWQgdGhlIGJyYW5jaC4KClNpZ25lZC1vZmYtYnk6IExvd3J5IExpIChBcm0gVGVjaG5vbG9n
eSBDaGluYSkgPGxvd3J5LmxpQGFybS5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9mb3JtYXRfY2Fwcy5jICAgfCAxOSArKysrKysrKysrKysrKysrKysrCiAu
Li4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmggICB8ICAz
ICsrKwogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mcmFtZWJ1ZmZlci5j
ICAgfCAgNSArKystLQogMyBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2Zvcm1hdF9jYXBzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9mb3JtYXRfY2Fwcy5jCmluZGV4IGNkNGQ5ZjUuLmM5YTFlZGIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZm9ybWF0X2Nh
cHMuYwpAQCAtMzUsNiArMzUsMjUgQEAKIAlyZXR1cm4gTlVMTDsKIH0KIAordTMyIGtvbWVkYV9n
ZXRfYWZiY19mb3JtYXRfYnBwKGNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKmluZm8sIHU2
NCBtb2RpZmllcikKK3sKKwl1MzIgYnBwOworCisJc3dpdGNoIChpbmZvLT5mb3JtYXQpIHsKKwlj
YXNlIERSTV9GT1JNQVRfWVVWNDIwXzhCSVQ6CisJCWJwcCA9IDEyOworCQlicmVhazsKKwljYXNl
IERSTV9GT1JNQVRfWVVWNDIwXzEwQklUOgorCQlicHAgPSAxNTsKKwkJYnJlYWs7CisJZGVmYXVs
dDoKKwkJYnBwID0gaW5mby0+Y3BwWzBdICogODsKKwkJYnJlYWs7CisJfQorCisJcmV0dXJuIGJw
cDsKK30KKwogLyogVHdvIGFzc3VtcHRpb25zCiAgKiAxLiBSR0IgYWx3YXlzIGhhcyBZVFIKICAq
IDIuIFRpbGVkIFJHQiBhbHdheXMgaGFzIFNDCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mb3JtYXRfY2Fwcy5oIGIvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZm9ybWF0X2NhcHMuaAppbmRleCAzNjMxOTEwLi4z
MjI3M2NmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9mb3JtYXRfY2Fwcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2Zvcm1hdF9jYXBzLmgKQEAgLTk3LDYgKzk3LDkgQEAgc3RhdGljIGlubGluZSBj
b25zdCBjaGFyICprb21lZGFfZ2V0X2Zvcm1hdF9uYW1lKHUzMiBmb3VyY2MsIHU2NCBtb2RpZmll
cikKIGtvbWVkYV9nZXRfZm9ybWF0X2NhcHMoc3RydWN0IGtvbWVkYV9mb3JtYXRfY2Fwc190YWJs
ZSAqdGFibGUsCiAJCSAgICAgICB1MzIgZm91cmNjLCB1NjQgbW9kaWZpZXIpOwogCit1MzIga29t
ZWRhX2dldF9hZmJjX2Zvcm1hdF9icHAoY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqaW5m
bywKKwkJCSAgICAgICB1NjQgbW9kaWZpZXIpOworCiB1MzIgKmtvbWVkYV9nZXRfbGF5ZXJfZm91
cmNjX2xpc3Qoc3RydWN0IGtvbWVkYV9mb3JtYXRfY2Fwc190YWJsZSAqdGFibGUsCiAJCQkJICB1
MzIgbGF5ZXJfdHlwZSwgdTMyICpuX2ZtdHMpOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mcmFtZWJ1ZmZlci5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYwppbmRleCAzYjBhNzBl
Li4xYjAxYTYyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9mcmFtZWJ1ZmZlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmMKQEAgLTQzLDcgKzQzLDcgQEAgc3RhdGljIGludCBr
b21lZGFfZmJfY3JlYXRlX2hhbmRsZShzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwKIAlzdHJ1
Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiA9ICZrZmItPmJhc2U7CiAJY29uc3Qgc3RydWN0IGRybV9m
b3JtYXRfaW5mbyAqaW5mbyA9IGZiLT5mb3JtYXQ7CiAJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpv
Ymo7Ci0JdTMyIGFsaWdubWVudF93ID0gMCwgYWxpZ25tZW50X2ggPSAwLCBhbGlnbm1lbnRfaGVh
ZGVyLCBuX2Jsb2NrczsKKwl1MzIgYWxpZ25tZW50X3cgPSAwLCBhbGlnbm1lbnRfaCA9IDAsIGFs
aWdubWVudF9oZWFkZXIsIG5fYmxvY2tzLCBicHA7CiAJdTY0IG1pbl9zaXplOwogCiAJb2JqID0g
ZHJtX2dlbV9vYmplY3RfbG9va3VwKGZpbGUsIG1vZGVfY21kLT5oYW5kbGVzWzBdKTsKQEAgLTg4
LDggKzg4LDkgQEAgc3RhdGljIGludCBrb21lZGFfZmJfY3JlYXRlX2hhbmRsZShzdHJ1Y3QgZHJt
X2ZyYW1lYnVmZmVyICpmYiwKIAlrZmItPm9mZnNldF9wYXlsb2FkID0gQUxJR04obl9ibG9ja3Mg
KiBBRkJDX0hFQURFUl9TSVpFLAogCQkJCSAgICBhbGlnbm1lbnRfaGVhZGVyKTsKIAorCWJwcCA9
IGtvbWVkYV9nZXRfYWZiY19mb3JtYXRfYnBwKGluZm8sIGZiLT5tb2RpZmllcik7CiAJa2ZiLT5h
ZmJjX3NpemUgPSBrZmItPm9mZnNldF9wYXlsb2FkICsgbl9ibG9ja3MgKgotCQkJIEFMSUdOKGlu
Zm8tPmNwcFswXSAqIEFGQkNfU1VQRVJCTEtfUElYRUxTLAorCQkJIEFMSUdOKGJwcCAqIEFGQkNf
U1VQRVJCTEtfUElYRUxTIC8gOCwKIAkJCSAgICAgICBBRkJDX1NVUEVSQkxLX0FMSUdOTUVOVCk7
CiAJbWluX3NpemUgPSBrZmItPmFmYmNfc2l6ZSArIGZiLT5vZmZzZXRzWzBdOwogCWlmIChtaW5f
c2l6ZSA+IG9iai0+c2l6ZSkgewotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
