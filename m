Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 247D9C2562
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 18:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191956E49F;
	Mon, 30 Sep 2019 16:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70043.outbound.protection.outlook.com [40.107.7.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A98A6E49F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 16:45:00 +0000 (UTC)
Received: from DB6PR0802CA0034.eurprd08.prod.outlook.com (2603:10a6:4:a3::20)
 by AM0PR08MB3540.eurprd08.prod.outlook.com (2603:10a6:208:e3::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Mon, 30 Sep
 2019 16:44:57 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::200) by DB6PR0802CA0034.outlook.office365.com
 (2603:10a6:4:a3::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.15 via Frontend
 Transport; Mon, 30 Sep 2019 16:44:57 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 30 Sep 2019 16:44:55 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Mon, 30 Sep 2019 16:44:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1fb8d32b80e5cacf
X-CR-MTA-TID: 64aa7808
Received: from f24e1f42cc6d.3 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.58]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4F678C47-68D6-4648-BBF8-9F1141784315.1; 
 Mon, 30 Sep 2019 16:44:42 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2058.outbound.protection.outlook.com [104.47.4.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f24e1f42cc6d.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Mon, 30 Sep 2019 16:44:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLHYCHl+fWxvt+2kETGVoauXFmWY5gg+TR1HNPVJMEuWQcVxqKt9CjtGcmQoRO+mL2pavW1P2U1MVy0XZBBIJrJdvANlfsTewipSCf8+BTCW5E8TU7Ug4JR2Hovvnx90hDVnn8bxeA28lV71/lCtnX0k6Z+MJLitq0A4JBqeq2WZbewaycSp8hRgV7Fty7olY39GP1uFJaJyl04ZVMBJEvSeix6S9GukpETN4m3x+z3QZkzGImCmpi8oBhnvyznxD5oQy7x1NFg+W5qQTXRWroDIzowrgS443BS8pPoQQZZiel84nDRYXM9xvRTFp2ZAMJtVRHKiSzVPg9urLLhmvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0hCAxunk1g1TCBVqy7T3+YW73qmUeUrNNk6KoNXGQY=;
 b=BtZtHfM622n9OufIu65gkIkgOQJhPqeKFjaj23v58T2H37PrxnCsuIEJk4KwALWbtW63WZ07YkmUmRGjclJaJvMoRkt0/k4VirPU6PdVbYYsg9fFok1Hz0HEXDacygW1+qtL/e7w4I1sTe8GyRqPmtNqox3vplGhf8KlnQ+U+U14hhTQMTg03+1L3UAgvGWV0c1mRn2UH9u3BMXuX+L5KGDNMfiMmQ8NQhUP6GFSTi370CwuaheraTfDFIpRiskOwBLJzIEz+eUPq7rONdFa95WjVe14njdb7rYBomP7psmLjTQcZBde8fCUbTqYYWJ/ti3bjYHmaugN7spnDGo63g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM7PR08MB5352.eurprd08.prod.outlook.com (10.141.172.139) by
 AM7PR08MB5301.eurprd08.prod.outlook.com (10.141.171.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 16:44:39 +0000
Received: from AM7PR08MB5352.eurprd08.prod.outlook.com
 ([fe80::1c78:bb51:3634:9cf0]) by AM7PR08MB5352.eurprd08.prod.outlook.com
 ([fe80::1c78:bb51:3634:9cf0%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 16:44:39 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: Ayan Halder <Ayan.Halder@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Brian Starkey <Brian.Starkey@arm.com>, "malidp@foss.arm.com"
 <malidp@foss.arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "sean@poorly.run"
 <sean@poorly.run>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yuq825@gmail.com" <yuq825@gmail.com>
Subject: [PATCH v2] drm/fourcc: Add Arm 16x16 block modifier
Thread-Topic: [PATCH v2] drm/fourcc: Add Arm 16x16 block modifier
Thread-Index: AQHVd65ZjChaP0zoZUGEUL74H9varg==
Date: Mon, 30 Sep 2019 16:44:38 +0000
Message-ID: <20190930164425.20282-1-ayan.halder@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0253.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::25) To AM7PR08MB5352.eurprd08.prod.outlook.com
 (2603:10a6:20b:106::11)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [217.140.106.50]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 85abe8e5-7567-403b-5db2-08d745c58647
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM7PR08MB5301:|AM7PR08MB5301:|AM0PR08MB3540:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB3540385547A96289C4956C50E4820@AM0PR08MB3540.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3968;OLM:3968;
x-forefront-prvs: 01762B0D64
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(189003)(199004)(6512007)(305945005)(2501003)(7736002)(2906002)(316002)(99286004)(66446008)(64756008)(66556008)(66476007)(66946007)(6486002)(6436002)(110136005)(2201001)(50226002)(86362001)(54906003)(14454004)(8936002)(478600001)(4326008)(256004)(14444005)(44832011)(1076003)(8676002)(81166006)(71200400001)(71190400001)(476003)(2616005)(386003)(6506007)(6116002)(25786009)(102836004)(186003)(26005)(5660300002)(36756003)(52116002)(66066001)(3846002)(81156014)(486006)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM7PR08MB5301;
 H:AM7PR08MB5352.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: O/4tSPnfEs7KGeSpaW1Un1FWzBVPBqRQGEkz0kRM6g8UVWUgVrEqK+GjXn9turlwdc7JW5mthKcLpb9xizVCeMaQAMX6Xq5V8T2s0YiXuk9bAAWlOv6rgOFJu2UiEe1SrF5APDopQNgVC+Vka9B9SbfGhNIl2wn+fnYFjdr9uH4AHyfuXPFeiGLULJQhe0SgSzpyNNhx0bP+zuyuQafAstsH7976VzjrgBdmZN1bAKyAAdi9WNKVT3RR+MdZQ6vsaorP/9VSSRHtKS8ov+kiizONe2s6Lx5sllcKOmXmn7RFljLlNnJIWZPaK2bfn8HcM2Nrf88YrStGzJCY4iJej33bD7RpCMhr6V8Gd11qQ7g6mY9q9dyGG9erZk9l92tmGuAgw9ZglpVaNyrKPd19lBKkjfLZ6670xdGPpb7wGyk=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5301
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(396003)(376002)(189003)(199004)(81166006)(2201001)(6506007)(81156014)(76130400001)(4326008)(25786009)(8676002)(486006)(6116002)(3846002)(478600001)(26826003)(8746002)(8936002)(50466002)(26005)(110136005)(54906003)(186003)(14454004)(102836004)(86362001)(22756006)(36756003)(386003)(336012)(476003)(70206006)(2616005)(126002)(2501003)(99286004)(2906002)(63350400001)(70586007)(50226002)(6486002)(14444005)(305945005)(7736002)(356004)(23756003)(36906005)(5660300002)(47776003)(66066001)(316002)(6512007)(1076003)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3540;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 111ed03c-9ec6-4160-d097-08d745c57c16
NoDisclaimer: True
X-Forefront-PRVS: 01762B0D64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yLlOiC/MTpNunW0ftri0Q2o/pJErWnF4/mAFVCXNMK9k9oHyUZPSscJCI2bKmp4lAlCwS8kvjnF1+F7yo9k624Dt55NRzurE1+2Q0qnRx43+BNyZIM5Wrlp4p5FGwa/I1LTYA2eL11YU4ath/9/+BSnBgfxDc+Stb+Ha3YOBaTWjLnA2t0haqdsE8Me0ZYqWxHEKToltA9RuiHOcO4OuzmMxICM+E9ZTPHILYG1kIwhV//XfMBHu4KUsoByBdeuENT1MtCz0T27f8IauC1Sc4KXsR40e+xMJ9AZ+b0h1wiLScg8Gh7DQzK2vcV97vu+YeE4iX3j7jo4Tlnap+vprpexFcQcGXDw3MFU+KNkaadvCDmDNnMy99C6bzPd4Y9/5oevb0W+5EbtpcWc/ozDIe5bzsJIhQLsbRQzEudYG0yU=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2019 16:44:55.8911 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85abe8e5-7567-403b-5db2-08d745c58647
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3540
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0hCAxunk1g1TCBVqy7T3+YW73qmUeUrNNk6KoNXGQY=;
 b=V9dDU36Sg4Hz72SRBpAR0ZTDTRaztCRD5ovXZsGSq9O/cdwxvxPa37jLu32RZc7IFihgVKGq40vClgRNr53eDAPc0Zo4X0/aSNg5F3hbJWWly7Q9iJDNoKd2ZGzR/tsdCHjnH+ZhFrQcwikR8xjpI/VUrswBe0AjkIFV3U+QctU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0hCAxunk1g1TCBVqy7T3+YW73qmUeUrNNk6KoNXGQY=;
 b=V9dDU36Sg4Hz72SRBpAR0ZTDTRaztCRD5ovXZsGSq9O/cdwxvxPa37jLu32RZc7IFihgVKGq40vClgRNr53eDAPc0Zo4X0/aSNg5F3hbJWWly7Q9iJDNoKd2ZGzR/tsdCHjnH+ZhFrQcwikR8xjpI/VUrswBe0AjkIFV3U+QctU=
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
Cc: nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHRoZSBEUk1fRk9STUFUX01PRF9BUk1fMTZYMTZfQkxPQ0tfVV9JTlRFUkxFQVZFRCBtb2Rp
ZmllciB0bwpkZW5vdGUgdGhlIDE2eDE2IGJsb2NrIHUtaW50ZXJsZWF2ZWQgZm9ybWF0IHVzZWQg
aW4gQXJtIFV0Z2FyZCBhbmQKTWlkZ2FyZCBHUFVzLgoKQ2hhbmdlcyBmcm9tIHYxOi0KMS4gUmVz
ZXJ2ZWQgdGhlIHVwcGVyIGZvdXIgYml0cyAob3V0IG9mIHRoZSA1NiBiaXRzIGFzc2lnbmVkIHRv
IGVhY2ggdmVuZG9yKQp0byBkZW5vdGUgdGhlIGNhdGVnb3J5IG9mIEFybSBzcGVjaWZpYyBtb2Rp
ZmllcnMuIEN1cnJlbnRseSwgd2UgaGF2ZSB0d28KY2F0ZWdvcmllcyBpZSBBRkJDIGFuZCBNSVND
LgoKU2lnbmVkLW9mZi1ieTogUmF5bW9uZCBTbWl0aCA8cmF5bW9uZC5zbWl0aEBhcm0uY29tPgpT
aWduZWQtb2ZmLWJ5OiBBeWFuIGt1bWFyIGhhbGRlciA8YXlhbi5oYWxkZXJAYXJtLmNvbT4KLS0t
CiBpbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaCB8IDI3ICsrKysrKysrKysrKysrKysrKysr
KysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaCBiL2luY2x1ZGUvdWFw
aS9kcm0vZHJtX2ZvdXJjYy5oCmluZGV4IDNmZWVhYTNmOTg3YS4uYjFkM2RlOTYxMTA5IDEwMDY0
NAotLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAorKysgYi9pbmNsdWRlL3VhcGkv
ZHJtL2RybV9mb3VyY2MuaApAQCAtNjQ4LDcgKzY0OCwyMSBAQCBleHRlcm4gIkMiIHsKICAqIEZ1
cnRoZXIgaW5mb3JtYXRpb24gb24gdGhlIHVzZSBvZiBBRkJDIG1vZGlmaWVycyBjYW4gYmUgZm91
bmQgaW4KICAqIERvY3VtZW50YXRpb24vZ3B1L2FmYmMucnN0CiAgKi8KLSNkZWZpbmUgRFJNX0ZP
Uk1BVF9NT0RfQVJNX0FGQkMoX19hZmJjX21vZGUpCWZvdXJjY19tb2RfY29kZShBUk0sIF9fYWZi
Y19tb2RlKQorCisvKgorICogVGhlIHRvcCA0IGJpdHMgKG91dCBvZiB0aGUgNTYgYml0cyBhbGxv
dGVkIGZvciBzcGVjaWZ5aW5nIHZlbmRvciBzcGVjaWZpYworICogbW9kaWZpZXJzKSBkZW5vdGUg
dGhlIGNhdGVnb3J5IGZvciBtb2RpZmllcnMuIEN1cnJlbnRseSB3ZSBoYXZlIG9ubHkgdHdvCisg
KiBjYXRlZ29yaWVzIG9mIG1vZGlmaWVycyBpZSBBRkJDIGFuZCBNSVNDLiBXZSBjYW4gaGF2ZSBh
IG1heGltdW0gb2Ygc2l4dGVlbgorICogZGlmZmVyZW50IGNhdGVnb3JpZXMuCisgKi8KKyNkZWZp
bmUgRFJNX0ZPUk1BVF9NT0RfQVJNX0NPREUodHlwZSwgdmFsKSBcCisJZm91cmNjX21vZF9jb2Rl
KEFSTSwgKChfX3U2NCl0eXBlIDw8IDUyKSB8ICgodmFsKSAmIDB4MDAwZmZmZmZmZmZmZmZmZlVM
TCkpCisKKyNkZWZpbmUgRFJNX0ZPUk1BVF9NT0RfQVJNX1RZUEVfQUZCQyAweDAwCisjZGVmaW5l
IERSTV9GT1JNQVRfTU9EX0FSTV9UWVBFX01JU0MgMHgwMQorCisjZGVmaW5lIERSTV9GT1JNQVRf
TU9EX0FSTV9BRkJDKF9fYWZiY19tb2RlKSBcCisJRFJNX0ZPUk1BVF9NT0RfQVJNX0NPREUoRFJN
X0ZPUk1BVF9NT0RfQVJNX1RZUEVfQUZCQywgX19hZmJjX21vZGUpCiAKIC8qCiAgKiBBRkJDIHN1
cGVyYmxvY2sgc2l6ZQpAQCAtNzQyLDYgKzc1NiwxNyBAQCBleHRlcm4gIkMiIHsKICAqLwogI2Rl
ZmluZSBBRkJDX0ZPUk1BVF9NT0RfQkNIICAgICAoMVVMTCA8PCAxMSkKIAorLyoKKyAqIEFybSAx
NngxNiBCbG9jayBVLUludGVybGVhdmVkIG1vZGlmaWVyCisgKgorICogVGhpcyBpcyB1c2VkIGJ5
IEFybSBNYWxpIFV0Z2FyZCBhbmQgTWlkZ2FyZCBHUFVzLiBJdCBkaXZpZGVzIHRoZSBpbWFnZQor
ICogaW50byAxNngxNiBwaXhlbCBibG9ja3MuIEJsb2NrcyBhcmUgc3RvcmVkIGxpbmVhcmx5IGlu
IG9yZGVyLCBidXQgcGl4ZWxzCisgKiBpbiB0aGUgYmxvY2sgYXJlIHJlb3JkZXJlZC4KKyAqLwor
I2RlZmluZSBEUk1fRk9STUFUX01PRF9BUk1fMTZYMTZfQkxPQ0tfVV9JTlRFUkxFQVZFRCBcCisJ
RFJNX0ZPUk1BVF9NT0RfQVJNX0NPREUoRFJNX0ZPUk1BVF9NT0RfQVJNX1RZUEVfTUlTQywgMVVM
TCkKKworCiAvKgogICogQWxsd2lubmVyIHRpbGVkIG1vZGlmaWVyCiAgKgotLSAKMi4yMy4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
