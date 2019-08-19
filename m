Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA40691E89
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 10:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6604A6E0C6;
	Mon, 19 Aug 2019 08:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20047.outbound.protection.outlook.com [40.107.2.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C53E6E0C6
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 08:02:21 +0000 (UTC)
Received: from VI1PR08CA0260.eurprd08.prod.outlook.com (2603:10a6:803:dc::33)
 by HE1PR0801MB1851.eurprd08.prod.outlook.com (2603:10a6:3:7b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Mon, 19 Aug
 2019 08:02:16 +0000
Received: from AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::209) by VI1PR08CA0260.outlook.office365.com
 (2603:10a6:803:dc::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 08:02:15 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT053.mail.protection.outlook.com (10.152.16.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 08:02:14 +0000
Received: ("Tessian outbound 40a263b748b4:v26");
 Mon, 19 Aug 2019 08:02:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 01780a3e984ff5af
X-CR-MTA-TID: 64aa7808
Received: from 8dd404e3159b.2 (cr-mta-lb-1.cr-mta-net [104.47.1.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C1A31012-B687-4043-846C-2C30033FD0C5.1; 
 Mon, 19 Aug 2019 08:02:01 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2054.outbound.protection.outlook.com [104.47.1.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8dd404e3159b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Mon, 19 Aug 2019 08:02:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LufmhRifwAgbUDRMyf/6dVQYNYjD2chE1GPappTYMTsgTBexmH7vR+g+9ORiCblDpB9FSNaCRUBbq4i5vDrkHv0pjmXYBomx9uXXg+eJXWJgxTfR2Mazk20lT9j7fOZBamX1q9lh9JRRlyOOsZyMSs+Ltsxz711w7BvNt84rsX3kLliYCbsDVlVPngAqBXJAt++I5Jl0+6NBOlhbOaKZxBm+p27Ahosc2VdCH+j5vlSVagZ/DI6EkGn+wGqcY2aaicTjnCYlX/dj2ss6XyaIcQBB+l5oMbWgw9D2Aee8qlds/MulFYGzX25hvHIyMY1copB0VBJyqlZZpT3EIdNCfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/DME25WuBsi2PYPqZ0U2awKfR4yd6JAznpebH428no=;
 b=FY0WKoJGmieDRkq33SuPxZKo4cYWH6OxjyxJLxfmQvkufxzLaSvjy+BU3RrTUz0V+SWWcYwDhXfWC8sEqQA4MJhndq+2AXWxpbw9IBRFss/geMMjkdZKfoy3iqFlofAgcxLeuoyPenJW8pLt5eprf+Xu0+ZqVZDuT1y//PuxpZec3++Gi54FrwVrfkErkbI+wUILjWSnSBUn2B93hNoDuO4rqLUZTPXCBK7TXrxgKdLuEfADI/aQKJjwfUqcRjBOXBSeOZ16DaOAkxikO0xNiT7QUqEsrwlZlhwB/oA7oX2uLGO8KuK8bWFBjavPU2MqNjbzU/iHcgHQUgoL4Yoirg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4831.eurprd08.prod.outlook.com (10.255.113.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 08:01:57 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134%6]) with mapi id 15.20.2157.022; Mon, 19 Aug 2019
 08:01:57 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Subject: [PATCH] drm/komeda: Fix error: not allocating enough data 1592 vs 1584
Thread-Topic: [PATCH] drm/komeda: Fix error: not allocating enough data 1592
 vs 1584
Thread-Index: AQHVVmRfb2zs0H17zEmg1qVsSJCUdg==
Date: Mon, 19 Aug 2019 08:01:57 +0000
Message-ID: <20190819080136.10190-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0064.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::28) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 988be80d-0648-4e53-b13c-08d7247b8bc5
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4831; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4831:|HE1PR0801MB1851:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0801MB18517352DD8FA812F6C80693B3A80@HE1PR0801MB1851.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:5516;OLM:5516;
x-forefront-prvs: 0134AD334F
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(199004)(189003)(8676002)(36756003)(81166006)(81156014)(26005)(6506007)(386003)(103116003)(186003)(102836004)(55236004)(2906002)(86362001)(14444005)(256004)(52116002)(6116002)(3846002)(110136005)(14454004)(2201001)(478600001)(316002)(7736002)(305945005)(8936002)(71190400001)(71200400001)(54906003)(66946007)(2501003)(99286004)(66556008)(66476007)(64756008)(1076003)(66446008)(50226002)(4326008)(6512007)(6486002)(25786009)(5660300002)(53936002)(66066001)(2616005)(476003)(6436002)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4831;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: +u1Sgzi4RBdn7Zyh9VPwY+Mm+1SRaz33Pss/a82G/cROyJgokc5Bu9D2u9vekIRkAKo4/6rYtuXAJ7ztSztKjb3gJy4wEKWokUuK0pRqo6lq8DfS3mui1BVBqPtJ+JYdghoWruCjuKJ91hV2ytWIrvl7n3PwvaoNtk9+ROhRZYydfNyj+9w1dgTeN8w427tEscCH36sY++yaAjnQueWB5Lh7+ScBuQZhWuf0WqneWyf1lvEJP2sbV6KQc7rfYlZwqEBFVle5t3rWY1BCGbg/W+hM75nHOb0ta0MNPw7uuyhf8qEXA8oAN5eIKJ27B2/q+Ia+HK+tcf5kJAzXrSG7RHAPERZ6Y6I98H2zX/dIUq8I3OFz6sEepZ7D6t7M2nxARqble/cd8nyGCqifQ+YSJS4Gd23zDh9iCF0uloZqsMc=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4831
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(136003)(39860400002)(2980300002)(189003)(199004)(99286004)(186003)(47776003)(316002)(356004)(305945005)(2201001)(86362001)(50466002)(2501003)(22756006)(66066001)(6512007)(23756003)(63370400001)(336012)(2616005)(486006)(476003)(126002)(50226002)(36756003)(110136005)(81166006)(81156014)(8676002)(8746002)(8936002)(54906003)(76130400001)(3846002)(6116002)(4326008)(2906002)(63350400001)(103116003)(70586007)(25786009)(14454004)(478600001)(70206006)(26826003)(7736002)(14444005)(26005)(36906005)(1076003)(5660300002)(6506007)(386003)(6486002)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0801MB1851;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: b0c9aa84-d6e6-4c91-d537-08d7247b8163
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:HE1PR0801MB1851; 
NoDisclaimer: True
X-Forefront-PRVS: 0134AD334F
X-Microsoft-Antispam-Message-Info: HLxj5soyNntRiSLYPojYgN3oOmgBG25CtEuHsmagqersFYXBIyhbZzjOaZfMcVf96sW0ep0dQWXuE292MT1LnDixEJ2iZDDOVSjE39BfU5apvGVyOrOmR3slpb+nxrQwxDPHgDw73nHvL+s1q4nQhV9FTxRksdwLZB8WSfgeBz9gZip/EAHdkOVUCIhXKBfN/GAwnrSNJQIs8Ue2Q1Bd9U8NCC4N5Zv0YRUp1iWd4mt9Zo2RVnfHJh1jxlmUlIWfTAVKydzK3TrtzPE5yiTVVzZhVz10NCs+XXB70m72DNFkHrLQMz4u+jTvt7K6b45RbqsnjN2KhVy327a2JSF1++r0n6o4lFwQrlf59rnHsq/lx7EnG1bIW3Zs+V6/XREpYXvi0Dw7ImpnV+I/BaZ60//Q8VQcIyMXxF8H25azqVc=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 08:02:14.0030 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 988be80d-0648-4e53-b13c-08d7247b8bc5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1851
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/DME25WuBsi2PYPqZ0U2awKfR4yd6JAznpebH428no=;
 b=CEssCSTIorzkZMt1Wy6hEcqynDE5E8naCoTZKO7fCHpvFuw+CY6jyAZaQTEZWO5Xam/tbpD8yiQJK37rYDpeWIbwR3llP7m5TreVO1Qg3+OlvBdvaSwsh6hoRD90cLydlKW3dxmwF0b5bJTMkh3GiL1syUsgR5RuSk8FXmEPAH0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/DME25WuBsi2PYPqZ0U2awKfR4yd6JAznpebH428no=;
 b=CEssCSTIorzkZMt1Wy6hEcqynDE5E8naCoTZKO7fCHpvFuw+CY6jyAZaQTEZWO5Xam/tbpD8yiQJK37rYDpeWIbwR3llP7m5TreVO1Qg3+OlvBdvaSwsh6hoRD90cLydlKW3dxmwF0b5bJTMkh3GiL1syUsgR5RuSk8FXmEPAH0=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHBhdGNoIDVkNTFmNmMwZGExYjogImRybS9rb21lZGE6IEFkZCB3cml0ZWJhY2sgc3VwcG9y
dCIgZnJvbSBNYXkKMjMsIDIwMTksIGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcgc3RhdGljIGNoZWNr
ZXIgd2FybmluZzoKCiAgICAgICAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfd2JfY29ubmVjdG9yLmM6MTUxIGtvbWVkYV93Yl9jb25uZWN0b3JfYWRkKCkKICAgICAg
ICBlcnJvcjogbm90IGFsbG9jYXRpbmcgZW5vdWdoIGRhdGEgMTU5MiB2cyAxNTg0CgpUaGlzIGlz
IGEgdHlwbyB3aGljaCBtaXN1c2UgIndiX2Nvbm4iIGJ1dCB3aGljaCBzaG91bGQgYmUgImt3Yl9j
b25uIiB0bwphbGxvY2F0ZSB0aGUgbWVtb3J5LgoKUmVwb3J0ZWQtYnk6IERhbiBDYXJwZW50ZXIg
PGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KU2lnbmVkLW9mZi1ieTogamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29u
bmVjdG9yLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9j
b25uZWN0b3IuYwppbmRleCA2MTdlMWY3Yjg0NzIuLjI4NTFjYWM5NGQ4NiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVj
dG9yLmMKQEAgLTE0OCw3ICsxNDgsNyBAQCBzdGF0aWMgaW50IGtvbWVkYV93Yl9jb25uZWN0b3Jf
YWRkKHN0cnVjdCBrb21lZGFfa21zX2RldiAqa21zLAogCWlmICgha2NydGMtPm1hc3Rlci0+d2Jf
bGF5ZXIpCiAJCXJldHVybiAwOwogCi0Ja3diX2Nvbm4gPSBremFsbG9jKHNpemVvZigqd2JfY29u
biksIEdGUF9LRVJORUwpOworCWt3Yl9jb25uID0ga3phbGxvYyhzaXplb2YoKmt3Yl9jb25uKSwg
R0ZQX0tFUk5FTCk7CiAJaWYgKCFrd2JfY29ubikKIAkJcmV0dXJuIC1FTk9NRU07CiAKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
