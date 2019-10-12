Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4125D4DB5
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2019 08:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE366E578;
	Sat, 12 Oct 2019 06:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30053.outbound.protection.outlook.com [40.107.3.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7B46E578
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 06:51:06 +0000 (UTC)
Received: from DB6PR0801CA0043.eurprd08.prod.outlook.com (2603:10a6:4:2b::11)
 by AM6PR08MB3672.eurprd08.prod.outlook.com (2603:10a6:20b:4d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.24; Sat, 12 Oct
 2019 06:51:03 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::207) by DB6PR0801CA0043.outlook.office365.com
 (2603:10a6:4:2b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Sat, 12 Oct 2019 06:51:02 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Sat, 12 Oct 2019 06:51:01 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Sat, 12 Oct 2019 06:50:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4224247899f995fa
X-CR-MTA-TID: 64aa7808
Received: from 5fb4bfd047cb.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.0.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 186475AA-0EB0-42F4-9655-2BCE654C7C06.1; 
 Sat, 12 Oct 2019 06:50:50 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5fb4bfd047cb.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 12 Oct 2019 06:50:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LozcLbUuWYfEYHJDdT+nDXRjQZT8Hs6T4iQn2TH6PRIzp6TwJKLmSM/rc2Yf8rQkXnIXtc+4oEPD+Nu1UbxMCt6alXby1IcQ5ajmehA2IpsNtcqAX7WWkTjGYs28tYkckRI6Vj2jvp3N/cNM9OdvHOYApwZUY8iuhXOUVgf6GvSI5ZPi7jeb4yD3pB+xhD854QnI8reaagUDEaPZz+KWui8Mf6UV5PQH1wEkErQUbD+mDRXdqMDw/TCoPMq18YyRNJN1PCNKNq1NuvnmrLg5YwShhgMvTaAHd79aM7db0n24QV0Itlr047ykrHMGeZkq+GQmZMNjd8Oz8t99weLC4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YiXdlszNeq8zE5ZFA1BjtPvDxy+u6gSNxo5w3PDwaT8=;
 b=bTzxzDGp4H1MGsyV3NDHmD3h+ysxeMt9s1MswZIAR7kDm6WGbHAYEKDrW7vvzU0lpTMyV5GiJ3IjshoM31/u+23Yt8wdv57CWPF8uajAmPPjhqYFTgDUQ4JKpW5iecyYQvUlcJrs02OtPlhB5fHGtdKavdPKY8xXWzOfQTs2u/7JANBrlWmSUwfvgaOgCMpMZSyK/YKKuldjaSQ2N4Wl6iFPr6T3/7Gf/HTz+NKoVnMet/wiim3gvSAnrqlxFRxQJGghgVVpgrXms1A+HN5DbSUZz1o3GrsXsN6I3rw4fHZ83ZkwtBpDIef3V3QQS+VdMKd5ir90ESMmtWGX7C2fuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3613.eurprd08.prod.outlook.com (20.177.61.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Sat, 12 Oct 2019 06:50:47 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e52a:a540:75ae:ced9]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e52a:a540:75ae:ced9%4]) with mapi id 15.20.2347.016; Sat, 12 Oct 2019
 06:50:47 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH] drm/komeda: Set output color depth for output
Thread-Topic: [PATCH] drm/komeda: Set output color depth for output
Thread-Index: AQHVgMlgRjNZSavPFUK1VMeh9loRYA==
Date: Sat, 12 Oct 2019 06:50:46 +0000
Message-ID: <20191012065030.12691-1-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0038.apcprd03.prod.outlook.com
 (2603:1096:203:2f::26) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f2756903-c0b9-4c38-2852-08d74ee08b60
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB3613:|VI1PR08MB3613:|AM6PR08MB3672:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3672FD48FAD2BE4B040B54029F960@AM6PR08MB3672.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:469;OLM:469;
x-forefront-prvs: 0188D66E61
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(189003)(199004)(26005)(14444005)(66066001)(1076003)(25786009)(14454004)(6512007)(256004)(36756003)(52116002)(186003)(6506007)(55236004)(476003)(486006)(386003)(2616005)(5660300002)(86362001)(4326008)(102836004)(2201001)(71190400001)(71200400001)(2501003)(7736002)(305945005)(54906003)(110136005)(6436002)(6486002)(50226002)(6636002)(66946007)(81156014)(81166006)(66556008)(66476007)(8676002)(66446008)(64756008)(8936002)(316002)(478600001)(2906002)(6116002)(3846002)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3613;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: EoC8Jfd1QCRuvseohmqPvjzMKmWxJPw8QQ0pLSbZk0MCjmXC2CcbTTDoRXmNt4WTiNFcngSt74jcsUcuCX2bU/Xe2RfsEW8CkoD5RyQhWpBm5c7Ox253MOUR8ZbATuHANM5/Q9YIebGSYD4u8s+zQw3s75dtf1A05QdZyfQRcrMf8XkeCtCjNMa5drGjtf97HeHlnfBdkImAZK3lxExRt29zHAVB8QuKOxlICLs+xqRQExqTlkQFLIvH37LiWlcMJ0982aGX94WPXYXS91ohViioFvS3y8cALOup3hlKP/rJPaMQ1hI+nDsdtENuKKNZk4atQycHObZYrHqrFN/BdIGsd0JGwSECU7bYfwQSPQHWghSpsyq/dV5jEaN8v0bVUepHG4mGpjx7ldHsXhNilUFEoIe6A577S2AxiX0moHY=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3613
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(136003)(396003)(189003)(199004)(2201001)(14444005)(2906002)(70586007)(5660300002)(22756006)(70206006)(3846002)(63350400001)(336012)(6116002)(23756003)(486006)(476003)(126002)(1076003)(2616005)(99286004)(26005)(6506007)(102836004)(386003)(186003)(50466002)(2501003)(86362001)(6486002)(47776003)(356004)(4326008)(76130400001)(6636002)(6512007)(7736002)(66066001)(305945005)(81156014)(8746002)(36756003)(26826003)(110136005)(54906003)(478600001)(14454004)(36906005)(25786009)(8936002)(81166006)(8676002)(316002)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3672;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: ddaaaea3-3ba9-4066-74f8-08d74ee08291
NoDisclaimer: True
X-Forefront-PRVS: 0188D66E61
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hPcyx2gUoyCxYJGxduLEsCdceZqUb7kXRtInf4iyLjLb4TDyRVPff50csWQx9mOG0LIlkqtClmQCc1GgA/xnu0C3+rIbNxWZUkFbFzUEkXF/5303y8Et3kZvTS45zKrzzf2pBEfZL8+CPEHSj8EkJSRSCx0sLZxUmeb7AeNFPVcmFqCJnHBvVMFcy5At8wRKLKTaR3ejbLyzcwuaD86oZ5JJsVBJp7n2cxha7LejOFqm0AGFbhcvwXVoRSBigNfiG45CfmBknFXUovltpqOAEIK+nbQXtBZ6plKHytchWMeGuyjt0PXhP/RBCucNKowHG+8hYXjzoYChhsYnVQXp88s2i1DOgvZTUnrN6vu3UWGqr22Au4EU3Os7V5cPjJ3pkXLSI5p9HtaHm78Z/Bxyed31joeS+Y4KQuTv6Dbi5AQ=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2019 06:51:01.3609 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2756903-c0b9-4c38-2852-08d74ee08b60
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3672
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YiXdlszNeq8zE5ZFA1BjtPvDxy+u6gSNxo5w3PDwaT8=;
 b=F29ohiygwgWSYkFtA7aE/iia2U9KI3MIXTfXAkYTLE2uWo2yQmi+9Ei32w6zsgmORxw1xIh/nKWoRmpvJQ8LwSA4I1rytRzDkrIHsvnRdcmsLzlnMQLaL4Wy++yTxJleB4Hr+5ppouKJXX6O0HeKP31vEkXtFuXCvg0anyeZ6Gk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YiXdlszNeq8zE5ZFA1BjtPvDxy+u6gSNxo5w3PDwaT8=;
 b=F29ohiygwgWSYkFtA7aE/iia2U9KI3MIXTfXAkYTLE2uWo2yQmi+9Ei32w6zsgmORxw1xIh/nKWoRmpvJQ8LwSA4I1rytRzDkrIHsvnRdcmsLzlnMQLaL4Wy++yTxJleB4Hr+5ppouKJXX6O0HeKP31vEkXtFuXCvg0anyeZ6Gk=
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2V0IGNvbG9yX2RlcHRoIGFjY29yZGluZyB0byBjb25uZWN0b3ItPmJwYy4KCkNoYW5nZXMgc2lu
Y2UgdjE6CiAtIEZpeGVkIG1pbl9icGMgaXMgZWZmZWN0aXZlbHkgc2V0IGJ1dCBub3QgdXNlZCBp
bgprb21lZGFfY3J0Y19nZXRfY29sb3JfY29uZmlnKCkuCgpDaGFuZ2VzIHNpbmNlIHYyOgogLSBB
bGlnbiB0aGUgY29kZS4KClNpZ25lZC1vZmYtYnk6IExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBD
aGluYSkgPGxvd3J5LmxpQGFybS5jb20+Ci0tLQogLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEv
ZDcxX2NvbXBvbmVudC5jICAgIHwgIDEgKwogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9jcnRjLmMgIHwgMjAgKysrKysrKysrKysrKysrKysrKwogLi4uL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaCAgIHwgIDIgKysKIC4uLi9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oICB8ICAxICsKIC4uLi9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfcGlwZWxpbmVfc3RhdGUuYyAgICB8IDE4ICsrKysrKysrKysrKysrKysrCiAuLi4vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYyAgfCAgNCArKysrCiA2IGZpbGVz
IGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKaW5kZXggYzNkMjljMGIwNTFi
Li4yN2NkYjAzNTczYzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKQEAgLTk1MSw2ICs5NTEsNyBAQCBzdGF0aWMg
dm9pZCBkNzFfaW1wcm9jX3VwZGF0ZShzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywKIAkJCSAg
ICAgICB0b19kNzFfaW5wdXRfaWQoc3RhdGUsIGluZGV4KSk7CiAKIAltYWxpZHBfd3JpdGUzMihy
ZWcsIEJMS19TSVpFLCBIVl9TSVpFKHN0LT5oc2l6ZSwgc3QtPnZzaXplKSk7CisJbWFsaWRwX3dy
aXRlMzIocmVnLCBJUFNfREVQVEgsIHN0LT5jb2xvcl9kZXB0aCk7CiB9CiAKIHN0YXRpYyB2b2lk
IGQ3MV9pbXByb2NfZHVtcChzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywgc3RydWN0IHNlcV9m
aWxlICpzZikKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2NydGMuYwppbmRleCA3NTI2M2Q4Y2QwYmQuLmZlMjk1YzRmY2E3MSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwpAQCAtMTcsNiArMTcs
MjYgQEAKICNpbmNsdWRlICJrb21lZGFfZGV2LmgiCiAjaW5jbHVkZSAia29tZWRhX2ttcy5oIgog
Cit2b2lkIGtvbWVkYV9jcnRjX2dldF9jb2xvcl9jb25maWcoc3RydWN0IGRybV9jcnRjX3N0YXRl
ICpjcnRjX3N0LAorCQkJCSAgdTMyICpjb2xvcl9kZXB0aHMpCit7CisJc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm47CisJc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3Q7CisJaW50
IGksIG1pbl9icGMgPSAzMSwgY29ubl9icGMgPSAwOworCisJZm9yX2VhY2hfbmV3X2Nvbm5lY3Rv
cl9pbl9zdGF0ZShjcnRjX3N0LT5zdGF0ZSwgY29ubiwgY29ubl9zdCwgaSkgeworCQlpZiAoY29u
bl9zdC0+Y3J0YyAhPSBjcnRjX3N0LT5jcnRjKQorCQkJY29udGludWU7CisKKwkJY29ubl9icGMg
PSBjb25uLT5kaXNwbGF5X2luZm8uYnBjID8gY29ubi0+ZGlzcGxheV9pbmZvLmJwYyA6IDg7CisK
KwkJaWYgKGNvbm5fYnBjIDwgbWluX2JwYykKKwkJCW1pbl9icGMgPSBjb25uX2JwYzsKKwl9CisK
KwkqY29sb3JfZGVwdGhzID0gR0VOTUFTSyhtaW5fYnBjLCAwKTsKK30KKwogc3RhdGljIHZvaWQg
a29tZWRhX2NydGNfdXBkYXRlX2Nsb2NrX3JhdGlvKHN0cnVjdCBrb21lZGFfY3J0Y19zdGF0ZSAq
a2NydGNfc3QpCiB7CiAJdTY0IHB4bGNsaywgYWNsazsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5oIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgKaW5kZXggNDVjNDk4ZTE1ZTdhLi5hNDI1MDM0
NTFiNWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2ttcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2ttcy5oCkBAIC0xNjYsNiArMTY2LDggQEAgc3RhdGljIGlubGluZSBib29sIGhhc19mbGlwX2go
dTMyIHJvdCkKIAkJcmV0dXJuICEhKHJvdGF0aW9uICYgRFJNX01PREVfUkVGTEVDVF9YKTsKIH0K
IAordm9pZCBrb21lZGFfY3J0Y19nZXRfY29sb3JfY29uZmlnKHN0cnVjdCBkcm1fY3J0Y19zdGF0
ZSAqY3J0Y19zdCwKKwkJCQkgIHUzMiAqY29sb3JfZGVwdGhzKTsKIHVuc2lnbmVkIGxvbmcga29t
ZWRhX2NydGNfZ2V0X2FjbGsoc3RydWN0IGtvbWVkYV9jcnRjX3N0YXRlICprY3J0Y19zdCk7CiAK
IGludCBrb21lZGFfa21zX3NldHVwX2NydGNzKHN0cnVjdCBrb21lZGFfa21zX2RldiAqa21zLCBz
dHJ1Y3Qga29tZWRhX2RldiAqbWRldik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaAppbmRleCBiMzIyZjUyYmE4ZjIuLjc2NTNm
MTM0YThlYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfcGlwZWxpbmUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9waXBlbGluZS5oCkBAIC0zMjMsNiArMzIzLDcgQEAgc3RydWN0IGtvbWVkYV9pbXBy
b2MgewogCiBzdHJ1Y3Qga29tZWRhX2ltcHJvY19zdGF0ZSB7CiAJc3RydWN0IGtvbWVkYV9jb21w
b25lbnRfc3RhdGUgYmFzZTsKKwl1OCBjb2xvcl9kZXB0aDsKIAl1MTYgaHNpemUsIHZzaXplOwog
fTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfcGlwZWxpbmVfc3RhdGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX3BpcGVsaW5lX3N0YXRlLmMKaW5kZXggMGJhOWM2YWEzNzA4Li5lNjRiZmVhYTA2Yzcg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3Bp
cGVsaW5lX3N0YXRlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfcGlwZWxpbmVfc3RhdGUuYwpAQCAtNzQzLDYgKzc0Myw3IEBAIGtvbWVkYV9pbXByb2Nf
dmFsaWRhdGUoc3RydWN0IGtvbWVkYV9pbXByb2MgKmltcHJvYywKIAkJICAgICAgIHN0cnVjdCBr
b21lZGFfZGF0YV9mbG93X2NmZyAqZGZsb3cpCiB7CiAJc3RydWN0IGRybV9jcnRjICpjcnRjID0g
a2NydGNfc3QtPmJhc2UuY3J0YzsKKwlzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3QgPSAm
a2NydGNfc3QtPmJhc2U7CiAJc3RydWN0IGtvbWVkYV9jb21wb25lbnRfc3RhdGUgKmNfc3Q7CiAJ
c3RydWN0IGtvbWVkYV9pbXByb2Nfc3RhdGUgKnN0OwogCkBAIC03NTYsNiArNzU3LDIzIEBAIGtv
bWVkYV9pbXByb2NfdmFsaWRhdGUoc3RydWN0IGtvbWVkYV9pbXByb2MgKmltcHJvYywKIAlzdC0+
aHNpemUgPSBkZmxvdy0+aW5fdzsKIAlzdC0+dnNpemUgPSBkZmxvdy0+aW5faDsKIAorCWlmIChk
cm1fYXRvbWljX2NydGNfbmVlZHNfbW9kZXNldChjcnRjX3N0KSkgeworCQl1MzIgb3V0cHV0X2Rl
cHRoczsKKwkJdTMyIGF2YWlsX2RlcHRoczsKKworCQlrb21lZGFfY3J0Y19nZXRfY29sb3JfY29u
ZmlnKGNydGNfc3QsICZvdXRwdXRfZGVwdGhzKTsKKworCQlhdmFpbF9kZXB0aHMgPSBvdXRwdXRf
ZGVwdGhzICYgaW1wcm9jLT5zdXBwb3J0ZWRfY29sb3JfZGVwdGhzOworCQlpZiAoYXZhaWxfZGVw
dGhzID09IDApIHsKKwkJCURSTV9ERUJVR19BVE9NSUMoIk5vIGF2YWlsYWJsZSBjb2xvciBkZXB0
aHMsIGNvbm4gZGVwdGhzOiAweCV4ICYgZGlzcGxheTogMHgleFxuIiwKKwkJCQkJIG91dHB1dF9k
ZXB0aHMsCisJCQkJCSBpbXByb2MtPnN1cHBvcnRlZF9jb2xvcl9kZXB0aHMpOworCQkJcmV0dXJu
IC1FSU5WQUw7CisJCX0KKworCQlzdC0+Y29sb3JfZGVwdGggPSBfX2ZscyhhdmFpbF9kZXB0aHMp
OworCX0KKwogCWtvbWVkYV9jb21wb25lbnRfYWRkX2lucHV0KCZzdC0+YmFzZSwgJmRmbG93LT5p
bnB1dCwgMCk7CiAJa29tZWRhX2NvbXBvbmVudF9zZXRfb3V0cHV0KCZkZmxvdy0+aW5wdXQsICZp
bXByb2MtPmJhc2UsIDApOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jCmluZGV4IDI4NTFjYWM5NGQ4Ni4uNzQw
YTgxMjUwNjMwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV93Yl9jb25uZWN0b3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYwpAQCAtMTQyLDYgKzE0Miw3IEBAIHN0YXRpYyBp
bnQga29tZWRhX3diX2Nvbm5lY3Rvcl9hZGQoc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprbXMsCiAJ
c3RydWN0IGtvbWVkYV9kZXYgKm1kZXYgPSBrbXMtPmJhc2UuZGV2X3ByaXZhdGU7CiAJc3RydWN0
IGtvbWVkYV93Yl9jb25uZWN0b3IgKmt3Yl9jb25uOwogCXN0cnVjdCBkcm1fd3JpdGViYWNrX2Nv
bm5lY3RvciAqd2JfY29ubjsKKwlzdHJ1Y3QgZHJtX2Rpc3BsYXlfaW5mbyAqaW5mbzsKIAl1MzIg
KmZvcm1hdHMsIG5fZm9ybWF0cyA9IDA7CiAJaW50IGVycjsKIApAQCAtMTcxLDYgKzE3Miw5IEBA
IHN0YXRpYyBpbnQga29tZWRhX3diX2Nvbm5lY3Rvcl9hZGQoc3RydWN0IGtvbWVkYV9rbXNfZGV2
ICprbXMsCiAKIAlkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQoJndiX2Nvbm4tPmJhc2UsICZrb21l
ZGFfd2JfY29ubl9oZWxwZXJfZnVuY3MpOwogCisJaW5mbyA9ICZrd2JfY29ubi0+YmFzZS5iYXNl
LmRpc3BsYXlfaW5mbzsKKwlpbmZvLT5icGMgPSBfX2ZscyhrY3J0Yy0+bWFzdGVyLT5pbXByb2Mt
PnN1cHBvcnRlZF9jb2xvcl9kZXB0aHMpOworCiAJa2NydGMtPndiX2Nvbm4gPSBrd2JfY29ubjsK
IAogCXJldHVybiAwOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
