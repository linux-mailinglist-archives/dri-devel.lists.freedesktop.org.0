Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DAFD38C4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 07:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D566E9C2;
	Fri, 11 Oct 2019 05:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80082.outbound.protection.outlook.com [40.107.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551E96E9C2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 05:43:47 +0000 (UTC)
Received: from VI1PR0802CA0001.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::11) by AM6PR08MB4999.eurprd08.prod.outlook.com
 (2603:10a6:20b:e7::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 11 Oct
 2019 05:43:43 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::204) by VI1PR0802CA0001.outlook.office365.com
 (2603:10a6:800:aa::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 05:43:43 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 11 Oct 2019 05:43:41 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Fri, 11 Oct 2019 05:43:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 38a8f3ea0075de2c
X-CR-MTA-TID: 64aa7808
Received: from a6bf254ba81f.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.0.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A2C02209-4D5F-415B-9689-BDE2A69C4FAE.1; 
 Fri, 11 Oct 2019 05:43:27 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2053.outbound.protection.outlook.com [104.47.0.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a6bf254ba81f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 11 Oct 2019 05:43:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJ3STHbc5tZUBv+Kba2WQ30cFt4QmpNO4XXkgfK36Tw7woiKe5/FZ6T6fnNVQ2k1WhSzbZOYIzg3TPMjIUcMJg/UehwnehokGqukoG6g/CPLaOXYLNabBA0ySMVrWI7G6nu9abKS/P95r2i29LXv/3rSil2uOWK3kseKPLetBt56RYpi8pFu4XXU8nysPsdM+N6nRPIvl7Pjkez9VysJJOysFrde4IFcI46LijW1lDqtt4tpuIB+B+M71BmUxCcM3LyF+48Oo4SC2Fpxx4eE6W8U90Ppzo7wFf1MnZum3rYZFwtXBpumSUBUzbQNaPt1FVamZabakNAQlg1NJsT5+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwjboglvKAq6uiIJDn2YUD84pCdj+UuHqWJb/1SqjLc=;
 b=XWeZzTv+LjceiGyOtK37RKQDnMyfL2W4Z1Rkab8NBA6j+cDbzx6qdki6tTmlJ2eZ6nmwsWYAz4rrKMXNGucULMDgXD88r/ht0zNcB0UXxLvwSIeSjDfa/Xla8x3pbvYoE6Pp5FuxniYnzaJEojtSQ5JxKSDD8RpArKSomyLsC2AObZKe5VTyhzW9CIdV9+jLy2Jvc0HmZ6ZV4ENrkxOvJbbRzSdvcHdwVU5G3pEgQzN9Mf5uL0+oo9WGglerLReLSJd6LsKjDWVaNpwmGqTcUEChYy9aYdmaOaIDpE5JQQFt3O7aeZs7GQL8SEU2b34WTBF/ZqlYBTtHaE5lStFW2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5134.eurprd08.prod.outlook.com (10.255.158.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 05:43:23 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 05:43:23 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: [PATCH v2 3/4] drm/komeda: Add drm_ctm_to_coeffs()
Thread-Topic: [PATCH v2 3/4] drm/komeda: Add drm_ctm_to_coeffs()
Thread-Index: AQHVf/bLcMR8w2F0B0+It1k1COYv8Q==
Date: Fri, 11 Oct 2019 05:43:23 +0000
Message-ID: <20191011054240.17782-4-james.qian.wang@arm.com>
References: <20191011054240.17782-1-james.qian.wang@arm.com>
In-Reply-To: <20191011054240.17782-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2P15301CA0005.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::15) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ce175f51-af8c-4f34-bdb5-08d74e0df8da
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB5134:|VE1PR08MB5134:|AM6PR08MB4999:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4999F77CCA65B6335B96FD70B3970@AM6PR08MB4999.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3513;OLM:3513;
x-forefront-prvs: 0187F3EA14
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(189003)(199004)(66066001)(486006)(386003)(6506007)(64756008)(99286004)(50226002)(52116002)(81156014)(6486002)(8936002)(81166006)(66946007)(102836004)(8676002)(305945005)(55236004)(26005)(66476007)(71200400001)(6116002)(3846002)(66556008)(6436002)(71190400001)(7736002)(76176011)(36756003)(186003)(2906002)(256004)(476003)(6512007)(2616005)(66446008)(446003)(11346002)(54906003)(25786009)(14454004)(2501003)(103116003)(110136005)(316002)(4326008)(5660300002)(86362001)(478600001)(2201001)(1076003)(2171002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5134;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: JkZ/G8Hi75jgNaZzV2Wi1x311SjgBaNPNvFUGMP9hBk/mOdNCR3R9BMx7qStzRT2fbLE5nBFylhX4gw9AJ4zTeatqO6FG7LG+1HAF/oZKbuFp0EqLqkGL/r4XE7cx7xx4zCKXOjcK9iBj6hWNkHJaxbQGrU2UGHu6+Q4Bc0uv2FSI6aOTPk6YvjoKBOrdDs5acd0a+GqvgEWlw0v9jEf6DeGkVil2CzON+bDsGeT4LU8nIzqIhMULT+DetZji0OliewPQ4NlmlZq6cxIeHa4MUcoB2YnHNyimaWDEIE3t4s/CxHObKcT3xGJ+6Z67iIUnbycK4zYvxiKpAdLTV0+GAEt17R0ky4L9mIjIixUdBRYkdVp/n/Stmc/f7hejKbntfyQKaR/1qU+h3ei1pLyuC7jMOj+QADKswwpQ66C8AY=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5134
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(376002)(39860400002)(189003)(199004)(356004)(102836004)(76130400001)(2171002)(1076003)(76176011)(5660300002)(4326008)(7736002)(26826003)(478600001)(25786009)(70206006)(81166006)(99286004)(70586007)(186003)(26005)(81156014)(8936002)(8746002)(8676002)(50226002)(3846002)(6116002)(36906005)(386003)(6506007)(2906002)(36756003)(103116003)(22756006)(23756003)(110136005)(50466002)(54906003)(305945005)(126002)(316002)(14454004)(63350400001)(6512007)(446003)(47776003)(336012)(66066001)(486006)(11346002)(2616005)(476003)(86362001)(2501003)(6486002)(2201001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4999;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e6fe4a50-761d-4487-2052-08d74e0dee2f
NoDisclaimer: True
X-Forefront-PRVS: 0187F3EA14
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3J9QGcSjdwotWOxQQSI2X4mDdG2LevrI0EzdmqyTnGP2EPfTu9R8euvYaz6li9ECch+CBsrB8SXBPL6IquBFL9/PZSrhdnFuqW6CSSKA44/TGZlMIdSZ7uMchxpXIWMAQ7/GiRcjwT0Ialsvd0RMvEoRYyMghk0OU/mPp0P3UWFRL43fA+aKPNsdFdNtggW0hGkhdQ11ahr/zhkh5L4+kl0koK993YOUgYLSAShz2ub3p8RJqjCzZV2Pl205WCRlIxBpqspA0ciVhnKD3u22z5go0qb2dJ0QHomvtnFgrenJd+dDq2VvfCEoLE/uVH3NIBne5Nlft+hklK4oCouE0JXIFuK2kPy9qiEmwxL9bzpfRZyMk1yBarwlRxVxOISgfahMqI+fZrltNVnrQ/DZXM6ukHLiNvPoN+hSvaDrttU=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 05:43:41.2300 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce175f51-af8c-4f34-bdb5-08d74e0df8da
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4999
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwjboglvKAq6uiIJDn2YUD84pCdj+UuHqWJb/1SqjLc=;
 b=in6AxU8ACzOUEDCj04ROWClmtYWC9G/qA0bErD8NSzd7BazPS5sp3wixIOk9RILJhjAexJm7AEpDEMPcuxdmCb8m4e7bzgm98Kqebk3M9tdwbwYptWzhGRPEu2+I0MmZSPyBMIKzxayZehzCFspAy2WBGws+vZq4iuSMYJVdjpo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwjboglvKAq6uiIJDn2YUD84pCdj+UuHqWJb/1SqjLc=;
 b=in6AxU8ACzOUEDCj04ROWClmtYWC9G/qA0bErD8NSzd7BazPS5sp3wixIOk9RILJhjAexJm7AEpDEMPcuxdmCb8m4e7bzgm98Kqebk3M9tdwbwYptWzhGRPEu2+I0MmZSPyBMIKzxayZehzCFspAy2WBGws+vZq4iuSMYJVdjpo=
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

VGhpcyBmdW5jdGlvbiBpcyBmb3IgY29udmVydGluZyBkcm1fY29sb3JfY3RtIG1hdHJpeCB0byBr
b21lZGEgaGFyZHdhcmUKcmVxdWlyZWQgcmVxdWlyZWQgUTIuMTIgMidzIGNvbXBsZW1lbnQgQ1ND
IG1hdHJpeC4KCnYyOgogIE1vdmUgdGhlIGZpeHBvaW50IGNvbnZlcnNpb24gZnVuY3Rpb24gczMx
XzMyX3RvX3EyXzEyKCkgdG8gZHJtIGNvcmUKICBhcyBhIHNoYXJlZCBoZWxwZXIuCgpTaWduZWQt
b2ZmLWJ5OiBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlh
bi53YW5nQGFybS5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9jb2xvcl9tZ210LmMgfCAxNCArKysrKysrKysrKysrKwogLi4uL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmggfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDE1
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMKaW5kZXggYzE4MGNlNzBjMjZjLi5hZDY2OGFjY2Jk
ZjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2NvbG9yX21nbXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9jb2xvcl9tZ210LmMKQEAgLTExNywzICsxMTcsMTcgQEAgdm9pZCBkcm1fbHV0X3RvX2Zn
YW1tYV9jb2VmZnMoc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpsdXRfYmxvYiwgdTMyICpjb2Vm
ZnMpCiB7CiAJZHJtX2x1dF90b19jb2VmZnMobHV0X2Jsb2IsIGNvZWZmcywgc2VjdG9yX3RibCwg
QVJSQVlfU0laRShzZWN0b3JfdGJsKSk7CiB9CisKK3ZvaWQgZHJtX2N0bV90b19jb2VmZnMoc3Ry
dWN0IGRybV9wcm9wZXJ0eV9ibG9iICpjdG1fYmxvYiwgdTMyICpjb2VmZnMpCit7CisJc3RydWN0
IGRybV9jb2xvcl9jdG0gKmN0bTsKKwl1MzIgaTsKKworCWlmICghY3RtX2Jsb2IpCisJCXJldHVy
bjsKKworCWN0bSA9IGN0bV9ibG9iLT5kYXRhOworCisJZm9yIChpID0gMDsgaSA8IEtPTUVEQV9O
X0NUTV9DT0VGRlM7IGkrKykKKwkJY29lZmZzW2ldID0gZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9f
cW1fbihjdG0tPm1hdHJpeFtpXSwgMiwgMTIpOworfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5oCmluZGV4IDA4YWI2OTI4
MTY0OC4uMmY0NjY4NDY2MTEyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5oCkBAIC0xOCw2ICsxOCw3IEBACiAjZGVm
aW5lIEtPTUVEQV9OX0NUTV9DT0VGRlMJCTkKIAogdm9pZCBkcm1fbHV0X3RvX2ZnYW1tYV9jb2Vm
ZnMoc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpsdXRfYmxvYiwgdTMyICpjb2VmZnMpOwordm9p
ZCBkcm1fY3RtX3RvX2NvZWZmcyhzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmN0bV9ibG9iLCB1
MzIgKmNvZWZmcyk7CiAKIGNvbnN0IHMzMiAqa29tZWRhX3NlbGVjdF95dXYycmdiX2NvZWZmcyh1
MzIgY29sb3JfZW5jb2RpbmcsIHUzMiBjb2xvcl9yYW5nZSk7CiAKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
