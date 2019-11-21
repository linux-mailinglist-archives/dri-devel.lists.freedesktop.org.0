Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DD3104DAF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 09:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4D46E196;
	Thu, 21 Nov 2019 08:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40080.outbound.protection.outlook.com [40.107.4.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23986E196
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 08:17:51 +0000 (UTC)
Received: from VI1PR08CA0194.eurprd08.prod.outlook.com (2603:10a6:800:d2::24)
 by DB8PR08MB5130.eurprd08.prod.outlook.com (2603:10a6:10:e9::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.30; Thu, 21 Nov
 2019 08:17:48 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::205) by VI1PR08CA0194.outlook.office365.com
 (2603:10a6:800:d2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Thu, 21 Nov 2019 08:17:48 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Thu, 21 Nov 2019 08:17:48 +0000
Received: ("Tessian outbound 512f710540da:v33");
 Thu, 21 Nov 2019 08:17:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 68236fe4c5645d19
X-CR-MTA-TID: 64aa7808
Received: from e6ad9d4a2a70.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 86D7F68A-C55A-474C-88CB-635C05D0CFF2.1; 
 Thu, 21 Nov 2019 08:17:41 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e6ad9d4a2a70.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Nov 2019 08:17:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtaMiEmbtDMEnGnekvsOvGTX5TOC8RYd2ih69tEdCfoiZQH0/5G9Z8OQk0ZmtXGdZjWDjjP0QKuXXo0L+KdJYqn4Qvlbf3I22/zApWjtd8TcfKHaiaMPhHB++F/hb6FJKsJVSYASFp3G+ahoHkUjrT2kABUhjsSB/GtIHlWnPDnwIP7OA/wdMufB6BEXXBPLbsFNwJA27N2T/nBbiaVAfqA1vw5DwoQWiLXkRwnQkWO+Xw/vtrSjzDOQ/YrfV/ftYVCfVSJjJVW3aBrFjixGQO6EOJGR/3hE1bkBrqHFGriyFqg+V/Fr6noG1qPiLl8jpLDIbXBS1icP/hFGeNe9qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lAQlM/MhNbuQGxmnX34Fv0G6hKdyUmVSxsfm5aa6sQ=;
 b=Re5/4Iz3D0p7YPWsHI925hZGnYbxYf/OD5bwk8s4XHV7U6IN1I2DROiWHO1qCw8dkGnyY+FQjQj7PSJ45VN+quBeb0bss10IABUmdnfu8FWX3HqGLKD+K3UL2ChrVwuwAHbxMBo9aI9iiOd1Fq0mI6DFZ2eM8sm+c6iFtnD3TIy9yfu8aJ23c1SM2iZ4mIPR9LwUy3Bm/pbB5W3s0pfnYHifJXQB0jufO2ZOU9PeSWDExhV+hGOqskXDpYPq8dWRk9WWbM5C+PBo4CGPPv+uWd2dSWzvY1JKvswC7uc5NR6W/uZuftwGjRxA+RfAOlc8fwGGnunBp0A6qUTmRU2hVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4910.eurprd08.prod.outlook.com (10.255.114.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Thu, 21 Nov 2019 08:17:39 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2474.019; Thu, 21 Nov 2019
 08:17:39 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, Mihail Atanassov
 <Mihail.Atanassov@arm.com>
Subject: [PATCH v2 1/2] drm/komeda: Update the chip identify
Thread-Topic: [PATCH v2 1/2] drm/komeda: Update the chip identify
Thread-Index: AQHVoEQj/p8RiR47xEOSjyW11KmivQ==
Date: Thu, 21 Nov 2019 08:17:39 +0000
Message-ID: <20191121081717.29518-2-james.qian.wang@arm.com>
References: <20191121081717.29518-1-james.qian.wang@arm.com>
In-Reply-To: <20191121081717.29518-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR03CA0056.apcprd03.prod.outlook.com
 (2603:1096:202:17::26) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 589c2002-80c2-4cb3-6e51-08d76e5b4bb3
X-MS-TrafficTypeDiagnostic: VE1PR08MB4910:|VE1PR08MB4910:|DB8PR08MB5130:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB5130BE5BEB336DD231ADCC06B34E0@DB8PR08MB5130.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4125;OLM:4125;
x-forefront-prvs: 0228DDDDD7
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(366004)(136003)(39850400004)(189003)(199004)(6116002)(3846002)(2616005)(6486002)(478600001)(86362001)(4326008)(446003)(102836004)(6636002)(71190400001)(26005)(71200400001)(54906003)(110136005)(14454004)(186003)(2501003)(11346002)(6436002)(316002)(6512007)(99286004)(25786009)(2906002)(66946007)(64756008)(7736002)(66556008)(66066001)(305945005)(15650500001)(1076003)(66476007)(256004)(14444005)(36756003)(52116002)(76176011)(386003)(6506007)(55236004)(81166006)(81156014)(8676002)(50226002)(103116003)(66446008)(8936002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4910;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 5uuTMF1hHNDz2ddxeirpR7kF1Oh3TFLuKeoa6inyNwO8o+M9w9dSvnQ3ij4Qt4PPxgo6sgxhMwFj/xi+VjyaCdORIve7wGD1u+T26njUW3c3repc4SC2Iyf+7rgSFABibvoxi4k3iWfbGekjrVDJ8PNaCn+eUGopk3uNcKTW4lZoJnsfAt+ydhZDJvBsx94Vkp0lPE+eoontqyn/uVMOxsbbxz4vueRpBAfecfneNEYDqde3Jd1/AhSThOy2Tq3Jn1SBWXqNx8NQNyWnXY1OeERsYhr7Y+RebMzVWU4xnjyDoMGCpQVLo9+pUVp/0UpECfRIWJDgYsIGTM9ipAXoSaakBP+zP7l6VhZ35iOxgs7LbVkdwlUKS8vD21yD82ooyNoOsZwTHmNG9wva/r0ROlWlKPjfBeFYm5rVdE9ASUXgph0TW+YQCED0Fu1fgzHA
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4910
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(136003)(346002)(1110001)(339900001)(189003)(199004)(6506007)(386003)(14454004)(26826003)(356004)(26005)(81156014)(81166006)(478600001)(8676002)(66066001)(186003)(8746002)(86362001)(50226002)(11346002)(446003)(47776003)(8936002)(102836004)(50466002)(336012)(76176011)(36756003)(2616005)(105606002)(1076003)(7736002)(15650500001)(6116002)(3846002)(305945005)(54906003)(316002)(14444005)(36906005)(6486002)(6636002)(6512007)(70206006)(70586007)(2906002)(2501003)(5660300002)(25786009)(110136005)(22756006)(99286004)(4326008)(23756003)(103116003)(76130400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB5130;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: db5bdc58-c6cb-42cd-9cb9-08d76e5b462a
NoDisclaimer: True
X-Forefront-PRVS: 0228DDDDD7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +6nBXbrV7s2zurJxoDK4SSoBBF/kdsUweKKQ9u0VzrKF2cM6ig6WCEveK9talppQHJ55Bm2V54x1qFhUm9xxXhwHclhZ58Wa85P9t87ASXId8UjRSzF1UeBHqKOAJhajJSRGYYQpNr7neJdYxRtj8jaebdfwoQYvaN3n2vUdNbmXURPDZXPWDzec/Mo5ozMyHx2xs7KxYGBp26VPcIijLbiHkJb22FcNaoKID/z9b6kjGafkeYX7owKQZnFm/ln+dJ7YY+AAeIpmL+EHtOk+VMGrhaoQ95d/cYBIY5aPCRUEOdZjPEclr+F2keIk8ncWUT/GVw5HsejX4gCT1GgJaO1mDTHQPV8bXCfJl0NG4MscyF9EH3L8pjD38A3YD0+mKZD4eqG3HPIv176qiSUmca6l+Bj1fnWdOehCG6PoiLo3B90egLxi/pMc5RCKaZDe
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2019 08:17:48.6593 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 589c2002-80c2-4cb3-6e51-08d76e5b4bb3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5130
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lAQlM/MhNbuQGxmnX34Fv0G6hKdyUmVSxsfm5aa6sQ=;
 b=JrYaVlb30A3DB7aIw/Lsie1WuLiMOtsgwv6m7e2h8XRuZSk0LJa5t5SgYaZrZFKGEDKLQ1tgp3S9+hAR1a87tSx9UzWzymOWQmDf6DPo0kss7NW2SfbNHqW0kX9uR3EE0NND58KpV2bxPO1Ku5awfHhGiSBZKBVHRU7FAcjVnkA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lAQlM/MhNbuQGxmnX34Fv0G6hKdyUmVSxsfm5aa6sQ=;
 b=JrYaVlb30A3DB7aIw/Lsie1WuLiMOtsgwv6m7e2h8XRuZSk0LJa5t5SgYaZrZFKGEDKLQ1tgp3S9+hAR1a87tSx9UzWzymOWQmDf6DPo0kss7NW2SfbNHqW0kX9uR3EE0NND58KpV2bxPO1Ku5awfHhGiSBZKBVHRU7FAcjVnkA=
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
Cc: nd <nd@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>, "Thomas Sun \(Arm Technology
 China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MS4gRHJvcCBrb21lZGEtQ09SRSBwcm9kdWN0IGlkIGNvbXBhcmlzb24gYW5kIHB1dCBpdCBpbnRv
IHRoZSBkNzFfaWRlbnRpZnkKMi4gVXBkYXRlIHBpcGVsaW5lIG5vZGUgRFQtYmluZGluZzoKICAg
KGEpLiBTa2lwIHRoZSBuZWVkbGVzcyBwaXBlbGluZSBEVCBub2RlLgogICAoYikuIFJldHVybiBm
YWlsIGlmIHRoZSBlc3NlbnRpYWwgcGlwZWxpbmUgRFQgbm9kZSBpcyBtaXNzaW5nLgoKV2l0aCB0
aGVzZSBjaGFuZ2VzLCBmb3Igb25lIGZhbWlseSBjaGlwcyBubyBuZWVkIHRvIGNoYW5nZSB0aGUg
RFQuCgp2MjogUmViYXNlCgpTaWduZWQtb2ZmLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNo
bm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Ci0tLQogLi4uL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfZGV2LmMgIHwgMjcgKysrKysrKy0tCiAuLi4vZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jICAgfCA2MCArKysrKysrKysrLS0t
LS0tLS0tCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oICAgfCAx
NCArLS0tLQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kcnYuYyAgIHwg
IDkgKy0tCiA0IGZpbGVzIGNoYW5nZWQsIDU4IGluc2VydGlvbnMoKyksIDUyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3
MV9kZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYu
YwppbmRleCA4MjJiMjNhMWNlNzUuLjliM2JmMzUzYjZjYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Rldi5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYwpAQCAtNTk0LDEwICs1OTQsMjcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBrb21lZGFfZGV2X2Z1bmNzIGQ3MV9jaGlwX2Z1bmNzID0g
ewogY29uc3Qgc3RydWN0IGtvbWVkYV9kZXZfZnVuY3MgKgogZDcxX2lkZW50aWZ5KHUzMiBfX2lv
bWVtICpyZWdfYmFzZSwgc3RydWN0IGtvbWVkYV9jaGlwX2luZm8gKmNoaXApCiB7Ci0JY2hpcC0+
YXJjaF9pZAk9IG1hbGlkcF9yZWFkMzIocmVnX2Jhc2UsIEdMQl9BUkNIX0lEKTsKLQljaGlwLT5j
b3JlX2lkCT0gbWFsaWRwX3JlYWQzMihyZWdfYmFzZSwgR0xCX0NPUkVfSUQpOwotCWNoaXAtPmNv
cmVfaW5mbwk9IG1hbGlkcF9yZWFkMzIocmVnX2Jhc2UsIEdMQl9DT1JFX0lORk8pOwotCWNoaXAt
PmJ1c193aWR0aAk9IEQ3MV9CVVNfV0lEVEhfMTZfQllURVM7CisJY29uc3Qgc3RydWN0IGtvbWVk
YV9kZXZfZnVuY3MgKmZ1bmNzOworCXUzMiBwcm9kdWN0X2lkOwogCi0JcmV0dXJuICZkNzFfY2hp
cF9mdW5jczsKKwljaGlwLT5jb3JlX2lkID0gbWFsaWRwX3JlYWQzMihyZWdfYmFzZSwgR0xCX0NP
UkVfSUQpOworCisJcHJvZHVjdF9pZCA9IE1BTElEUF9DT1JFX0lEX1BST0RVQ1RfSUQoY2hpcC0+
Y29yZV9pZCk7CisKKwlzd2l0Y2ggKHByb2R1Y3RfaWQpIHsKKwljYXNlIE1BTElEUF9ENzFfUFJP
RFVDVF9JRDoKKwkJZnVuY3MgPSAmZDcxX2NoaXBfZnVuY3M7CisJCWJyZWFrOworCWRlZmF1bHQ6
CisJCWZ1bmNzID0gTlVMTDsKKwkJRFJNX0VSUk9SKCJVbnN1cHBvcnRlZCBwcm9kdWN0OiAweCV4
XG4iLCBwcm9kdWN0X2lkKTsKKwl9CisKKwlpZiAoZnVuY3MpIHsKKwkJY2hpcC0+YXJjaF9pZAk9
IG1hbGlkcF9yZWFkMzIocmVnX2Jhc2UsIEdMQl9BUkNIX0lEKTsKKwkJY2hpcC0+Y29yZV9pbmZv
CT0gbWFsaWRwX3JlYWQzMihyZWdfYmFzZSwgR0xCX0NPUkVfSU5GTyk7CisJCWNoaXAtPmJ1c193
aWR0aAk9IEQ3MV9CVVNfV0lEVEhfMTZfQllURVM7CisJfQorCisJcmV0dXJuIGZ1bmNzOwogfQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwppbmRl
eCA0ZGQ0Njk5ZDRlM2QuLjhlMGJjZTQ2NTU1YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMKQEAgLTExNiwyMiArMTE2LDE0IEBAIHN0YXRp
YyBzdHJ1Y3QgYXR0cmlidXRlX2dyb3VwIGtvbWVkYV9zeXNmc19hdHRyX2dyb3VwID0gewogCS5h
dHRycyA9IGtvbWVkYV9zeXNmc19lbnRyaWVzLAogfTsKIAotc3RhdGljIGludCBrb21lZGFfcGFy
c2VfcGlwZV9kdChzdHJ1Y3Qga29tZWRhX2RldiAqbWRldiwgc3RydWN0IGRldmljZV9ub2RlICpu
cCkKK3N0YXRpYyBpbnQga29tZWRhX3BhcnNlX3BpcGVfZHQoc3RydWN0IGtvbWVkYV9waXBlbGlu
ZSAqcGlwZSkKIHsKLQlzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICpwaXBlOworCXN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbnAgPSBwaXBlLT5vZl9ub2RlOwogCXN0cnVjdCBjbGsgKmNsazsKLQl1MzIgcGlw
ZV9pZDsKLQlpbnQgcmV0ID0gMDsKLQotCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5wLCAi
cmVnIiwgJnBpcGVfaWQpOwotCWlmIChyZXQgIT0gMCB8fCBwaXBlX2lkID49IG1kZXYtPm5fcGlw
ZWxpbmVzKQotCQlyZXR1cm4gLUVJTlZBTDsKLQotCXBpcGUgPSBtZGV2LT5waXBlbGluZXNbcGlw
ZV9pZF07CiAKIAljbGsgPSBvZl9jbGtfZ2V0X2J5X25hbWUobnAsICJweGNsayIpOwogCWlmIChJ
U19FUlIoY2xrKSkgewotCQlEUk1fRVJST1IoImdldCBweGNsayBmb3IgcGlwZWxpbmUgJWQgZmFp
bGVkIVxuIiwgcGlwZV9pZCk7CisJCURSTV9FUlJPUigiZ2V0IHB4Y2xrIGZvciBwaXBlbGluZSAl
ZCBmYWlsZWQhXG4iLCBwaXBlLT5pZCk7CiAJCXJldHVybiBQVFJfRVJSKGNsayk7CiAJfQogCXBp
cGUtPnB4bGNsayA9IGNsazsKQEAgLTE0NSw3ICsxMzcsNiBAQCBzdGF0aWMgaW50IGtvbWVkYV9w
YXJzZV9waXBlX2R0KHN0cnVjdCBrb21lZGFfZGV2ICptZGV2LCBzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5wKQogCQlvZl9ncmFwaF9nZXRfcG9ydF9ieV9pZChucCwgS09NRURBX09GX1BPUlRfT1VUUFVU
KTsKIAogCXBpcGUtPmR1YWxfbGluayA9IHBpcGUtPm9mX291dHB1dF9saW5rc1swXSAmJiBwaXBl
LT5vZl9vdXRwdXRfbGlua3NbMV07Ci0JcGlwZS0+b2Zfbm9kZSA9IG9mX25vZGVfZ2V0KG5wKTsK
IAogCXJldHVybiAwOwogfQpAQCAtMTU0LDcgKzE0NSw5IEBAIHN0YXRpYyBpbnQga29tZWRhX3Bh
cnNlX2R0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCiB7CiAJ
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiA9IHRvX3BsYXRmb3JtX2RldmljZShkZXYpOwog
CXN0cnVjdCBkZXZpY2Vfbm9kZSAqY2hpbGQsICpucCA9IGRldi0+b2Zfbm9kZTsKLQlpbnQgcmV0
OworCXN0cnVjdCBrb21lZGFfcGlwZWxpbmUgKnBpcGU7CisJdTMyIHBpcGVfaWQgPSBVMzJfTUFY
OworCWludCByZXQgPSAtMTsKIAogCW1kZXYtPmlycSAgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYs
IDApOwogCWlmIChtZGV2LT5pcnEgPCAwKSB7CkBAIC0xNjksMzEgKzE2Miw0NCBAQCBzdGF0aWMg
aW50IGtvbWVkYV9wYXJzZV9kdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBrb21lZGFfZGV2
ICptZGV2KQogCXJldCA9IDA7CiAKIAlmb3JfZWFjaF9hdmFpbGFibGVfY2hpbGRfb2Zfbm9kZShu
cCwgY2hpbGQpIHsKLQkJaWYgKG9mX25vZGVfY21wKGNoaWxkLT5uYW1lLCAicGlwZWxpbmUiKSA9
PSAwKSB7Ci0JCQlyZXQgPSBrb21lZGFfcGFyc2VfcGlwZV9kdChtZGV2LCBjaGlsZCk7Ci0JCQlp
ZiAocmV0KSB7Ci0JCQkJRFJNX0VSUk9SKCJwYXJzZSBwaXBlbGluZSBkdCBlcnJvciFcbiIpOwot
CQkJCW9mX25vZGVfcHV0KGNoaWxkKTsKLQkJCQlicmVhazsKKwkJaWYgKG9mX25vZGVfbmFtZV9l
cShjaGlsZCwgInBpcGVsaW5lIikpIHsKKwkJCW9mX3Byb3BlcnR5X3JlYWRfdTMyKGNoaWxkLCAi
cmVnIiwgJnBpcGVfaWQpOworCQkJaWYgKHBpcGVfaWQgPj0gbWRldi0+bl9waXBlbGluZXMpIHsK
KwkJCQlEUk1fV0FSTigiU2tpcCB0aGUgcmVkdW5kYW50IERUIG5vZGU6IHBpcGVsaW5lLSV1Llxu
IiwKKwkJCQkJIHBpcGVfaWQpOworCQkJCWNvbnRpbnVlOwogCQkJfQorCQkJbWRldi0+cGlwZWxp
bmVzW3BpcGVfaWRdLT5vZl9ub2RlID0gb2Zfbm9kZV9nZXQoY2hpbGQpOwogCQl9CiAJfQogCisJ
Zm9yIChwaXBlX2lkID0gMDsgcGlwZV9pZCA8IG1kZXYtPm5fcGlwZWxpbmVzOyBwaXBlX2lkKysp
IHsKKwkJcGlwZSA9IG1kZXYtPnBpcGVsaW5lc1twaXBlX2lkXTsKKworCQlpZiAoIXBpcGUtPm9m
X25vZGUpIHsKKwkJCURSTV9FUlJPUigiT21pdCBEVCBub2RlIGZvciBwaXBlbGluZS0lZC5cbiIs
IHBpcGUtPmlkKTsKKwkJCXJldHVybiAtRUlOVkFMOworCQl9CisJCXJldCA9IGtvbWVkYV9wYXJz
ZV9waXBlX2R0KHBpcGUpOworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsKKwl9CisKIAltZGV2
LT5zaWRlX2J5X3NpZGUgPSAhb2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICJzaWRlX2J5X3NpZGVf
bWFzdGVyIiwKIAkJCQkJCSAgICZtZGV2LT5zaWRlX2J5X3NpZGVfbWFzdGVyKTsKIAotCXJldHVy
biByZXQ7CisJcmV0dXJuIDA7CiB9CiAKIHN0cnVjdCBrb21lZGFfZGV2ICprb21lZGFfZGV2X2Ny
ZWF0ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
diA9IHRvX3BsYXRmb3JtX2RldmljZShkZXYpOwotCWNvbnN0IHN0cnVjdCBrb21lZGFfcHJvZHVj
dF9kYXRhICpwcm9kdWN0OworCWtvbWVkYV9pZGVudGlmeV9mdW5jIGtvbWVkYV9pZGVudGlmeTsK
IAlzdHJ1Y3Qga29tZWRhX2RldiAqbWRldjsKIAlpbnQgZXJyID0gMDsKIAotCXByb2R1Y3QgPSBv
Zl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsKLQlpZiAoIXByb2R1Y3QpCisJa29tZWRhX2lk
ZW50aWZ5ID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRldik7CisJaWYgKCFrb21lZGFfaWRl
bnRpZnkpCiAJCXJldHVybiBFUlJfUFRSKC1FTk9ERVYpOwogCiAJbWRldiA9IGRldm1fa3phbGxv
YyhkZXYsIHNpemVvZigqbWRldiksIEdGUF9LRVJORUwpOwpAQCAtMjIxLDExICsyMjcsOSBAQCBz
dHJ1Y3Qga29tZWRhX2RldiAqa29tZWRhX2Rldl9jcmVhdGUoc3RydWN0IGRldmljZSAqZGV2KQog
CiAJY2xrX3ByZXBhcmVfZW5hYmxlKG1kZXYtPmFjbGspOwogCi0JbWRldi0+ZnVuY3MgPSBwcm9k
dWN0LT5pZGVudGlmeShtZGV2LT5yZWdfYmFzZSwgJm1kZXYtPmNoaXApOwotCWlmICgha29tZWRh
X3Byb2R1Y3RfbWF0Y2gobWRldiwgcHJvZHVjdC0+cHJvZHVjdF9pZCkpIHsKLQkJRFJNX0VSUk9S
KCJEVCBjb25maWd1cmVkICV4IG1pc21hdGNoIHdpdGggcmVhbCBIVyAleC5cbiIsCi0JCQkgIHBy
b2R1Y3QtPnByb2R1Y3RfaWQsCi0JCQkgIE1BTElEUF9DT1JFX0lEX1BST0RVQ1RfSUQobWRldi0+
Y2hpcC5jb3JlX2lkKSk7CisJbWRldi0+ZnVuY3MgPSBrb21lZGFfaWRlbnRpZnkobWRldi0+cmVn
X2Jhc2UsICZtZGV2LT5jaGlwKTsKKwlpZiAoIW1kZXYtPmZ1bmNzKSB7CisJCURSTV9FUlJPUigi
RmFpbGVkIHRvIGlkZW50aWZ5IHRoZSBIVy5cbiIpOwogCQllcnIgPSAtRU5PREVWOwogCQlnb3Rv
IGRpc2FibGVfY2xrOwogCX0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2Rldi5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfZGV2LmgKaW5kZXggNDcxNjA0YjQyNDMxLi5kYWNkYjAwMTUzZTkgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oCkBAIC01OCwx
MSArNTgsNiBAQAogCQkJICAgIHwgS09NRURBX0VWRU5UX01PREUgXAogCQkJICAgICkKIAotLyog
bWFsaWRwIGRldmljZSBpZCAqLwotZW51bSB7Ci0JTUFMSV9ENzEgPSAwLAotfTsKLQogLyogcGlw
ZWxpbmUgRFQgcG9ydHMgKi8KIGVudW0gewogCUtPTUVEQV9PRl9QT1JUX09VVFBVVAkJPSAwLApA
QCAtNzYsMTIgKzcxLDYgQEAgc3RydWN0IGtvbWVkYV9jaGlwX2luZm8gewogCXUzMiBidXNfd2lk
dGg7CiB9OwogCi1zdHJ1Y3Qga29tZWRhX3Byb2R1Y3RfZGF0YSB7Ci0JdTMyIHByb2R1Y3RfaWQ7
Ci0JY29uc3Qgc3RydWN0IGtvbWVkYV9kZXZfZnVuY3MgKigqaWRlbnRpZnkpKHUzMiBfX2lvbWVt
ICpyZWcsCi0JCQkJCSAgICAgc3RydWN0IGtvbWVkYV9jaGlwX2luZm8gKmluZm8pOwotfTsKLQog
c3RydWN0IGtvbWVkYV9kZXY7CiAKIHN0cnVjdCBrb21lZGFfZXZlbnRzIHsKQEAgLTI0Myw2ICsy
MzIsOSBAQCBrb21lZGFfcHJvZHVjdF9tYXRjaChzdHJ1Y3Qga29tZWRhX2RldiAqbWRldiwgdTMy
IHRhcmdldCkKIAlyZXR1cm4gTUFMSURQX0NPUkVfSURfUFJPRFVDVF9JRChtZGV2LT5jaGlwLmNv
cmVfaWQpID09IHRhcmdldDsKIH0KIAordHlwZWRlZiBjb25zdCBzdHJ1Y3Qga29tZWRhX2Rldl9m
dW5jcyAqCisoKmtvbWVkYV9pZGVudGlmeV9mdW5jKSh1MzIgX19pb21lbSAqcmVnLCBzdHJ1Y3Qg
a29tZWRhX2NoaXBfaW5mbyAqY2hpcCk7CisKIGNvbnN0IHN0cnVjdCBrb21lZGFfZGV2X2Z1bmNz
ICoKIGQ3MV9pZGVudGlmeSh1MzIgX19pb21lbSAqcmVnLCBzdHJ1Y3Qga29tZWRhX2NoaXBfaW5m
byAqY2hpcCk7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfZHJ2LmMKaW5kZXggZDZjMjIyMmM1ZDMzLi5iN2ExMDk3YzQ1YzQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5jCkBAIC0xMjMsMTUgKzEy
Myw4IEBAIHN0YXRpYyBpbnQga29tZWRhX3BsYXRmb3JtX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgY29uc3Qgc3RydWN0IGtvbWVk
YV9wcm9kdWN0X2RhdGEga29tZWRhX3Byb2R1Y3RzW10gPSB7Ci0JW01BTElfRDcxXSA9IHsKLQkJ
LnByb2R1Y3RfaWQgPSBNQUxJRFBfRDcxX1BST0RVQ1RfSUQsCi0JCS5pZGVudGlmeSA9IGQ3MV9p
ZGVudGlmeSwKLQl9LAotfTsKLQogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQga29t
ZWRhX29mX21hdGNoW10gPSB7Ci0JeyAuY29tcGF0aWJsZSA9ICJhcm0sbWFsaS1kNzEiLCAuZGF0
YSA9ICZrb21lZGFfcHJvZHVjdHNbTUFMSV9ENzFdLCB9LAorCXsgLmNvbXBhdGlibGUgPSAiYXJt
LG1hbGktZDcxIiwgLmRhdGEgPSBkNzFfaWRlbnRpZnksIH0sCiAJe30sCiB9OwogCi0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
