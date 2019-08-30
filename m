Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D57FA3364
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 11:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB75C6E286;
	Fri, 30 Aug 2019 09:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130045.outbound.protection.outlook.com [40.107.13.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A67F6E26C
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 09:09:14 +0000 (UTC)
Received: from VI1PR0802CA0003.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::13) by VI1PR0801MB1855.eurprd08.prod.outlook.com
 (2603:10a6:800:59::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.18; Fri, 30 Aug
 2019 09:09:09 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by VI1PR0802CA0003.outlook.office365.com
 (2603:10a6:800:aa::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.19 via Frontend
 Transport; Fri, 30 Aug 2019 09:09:09 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Fri, 30 Aug 2019 09:09:08 +0000
Received: ("Tessian outbound f83cc93ed55d:v27");
 Fri, 30 Aug 2019 09:09:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c226450c5ae5965a
X-CR-MTA-TID: 64aa7808
Received: from e94b51b8b2cd.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.5.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F99EBCDA-CFC7-44F6-A43C-9B5C12236A6A.1; 
 Fri, 30 Aug 2019 09:08:54 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2052.outbound.protection.outlook.com [104.47.5.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e94b51b8b2cd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Aug 2019 09:08:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixRs0yuHpliMB1IhDhzWmVAdMg+aWd7TbNJX1sLF9TTRWoK6WR7MRYKhFEULOxqb7vkUe57Bw9aTqOyj/DQVK7owjL6FxquZ8+XzRL5DrRGC/KKxyQk2lFekJb1caqs1rteU8KdRLAwTUpBMDMuFUTB2A87k581aeh49CQT/syglKIgYuDVBxX2Y+xT6hySoL9psFrdI5oqu44K4l6acDBVkNqCZ03YCbltJmaXapW8atArGzSyILlG9lEadUl/yiWE+dfJrcdztOqdeXDo/cZj9AsiALPelIRkWsQm5VzDQBH/HXf94ZLe2AofZCwie8r54JZMg35IZs/5U9vCt8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2YfttFwbe46fxWfeXwZ4kI2bD84XZ4DigU/++mKPNI=;
 b=b8WMW/9twhk2j4vQzup1Mma93n0DQ0/SZ9Sf8tiHiKZhyIVPl9UD5MfINdzrxMMUxUZt5JNj/+7YIpEPzrlXYvWGrfHUaEAiC5MB4yRVmISCrvA1qHY330K8wv1PU6T5VVBEwFzBr2SJrz0VxByk1yiRL/EGKuxpJ9jlJomxBeRm8sQDpkvm+k/kA/k7GH5f82+nwcwrJ8W8Lt2RqZ4fCbvcO7g8lI7CTAGeC9ik4QzB5wBP2IxPe7RTcEM9lMOnbzz0f+RqJn3syqZNper+9DmLx5cT6e0TQs1VybPKn6zGQv3myuWg7qcSNMXYwJvrH1yF+R6BJejfA/XCsVuQow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3968.eurprd08.prod.outlook.com (20.178.125.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Fri, 30 Aug 2019 09:08:52 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::d09e:254b:4d3b:456b]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::d09e:254b:4d3b:456b%3]) with mapi id 15.20.2220.013; Fri, 30 Aug 2019
 09:08:52 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH v1 0/2] drm/komeda: Add layer line size support
Thread-Topic: [PATCH v1 0/2] drm/komeda: Add layer line size support
Thread-Index: AQHVXxKKAEDUFXeRJ0igqjka6hFsHw==
Date: Fri, 30 Aug 2019 09:08:51 +0000
Message-ID: <20190830090835.8747-1-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0P153CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::14) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5e5b6931-dfe1-475c-88c9-08d72d29b70a
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3968; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB3968:|VI1PR08MB3968:|VI1PR0801MB1855:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB1855B8D76D72F05C88E5BD619FBD0@VI1PR0801MB1855.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 0145758B1D
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(199004)(189003)(4326008)(66446008)(2616005)(25786009)(476003)(8676002)(2906002)(6436002)(2201001)(66556008)(81156014)(81166006)(64756008)(99286004)(14454004)(66476007)(5660300002)(486006)(26005)(4744005)(50226002)(86362001)(7736002)(71200400001)(6636002)(66066001)(1076003)(66946007)(71190400001)(305945005)(186003)(53936002)(3846002)(6512007)(110136005)(6486002)(8936002)(2501003)(102836004)(316002)(54906003)(55236004)(478600001)(386003)(6506007)(52116002)(256004)(6116002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3968;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: kwPkVc7hiz36a8GBcz5lxCZk4p4zPuptjojihuEhsL4NTx0xJlzUZsMlesU1N70yfg3IfoPdcbxRYL0oQu1zNRHEUI6qfu6YNcBH4Cxs+xPbdCrYiLm9aQQILjaBRJ9AsQ8Lo/uVWZSDg87cat02q7MXC8A4uMSWkcCXaiMSVK7gnKgvnkK23u+/7acKCX/YO/IwdpQ+oOmJv+/VEgOD9MYwARVEgCfgfjUPP0NmV7elIqbkhupsoxUqPv5wfAFh7fHjs5UJ5FGKzD7sJKhx6ZTPgLxQJKGIO2SsQ3Sz5jH6gWAF41FzMS4/M2nNPwOXHrgtibOMRELAFM31MXlhIIvw3A3G+wgZWJKEZdilmY2O4lH93n1HiO911TvSu3UXPFB2Sosq9qUj324kl2LE2y571k+zT73aXryiKXKgkBw=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3968
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(136003)(396003)(2980300002)(189003)(199004)(86362001)(2201001)(3846002)(126002)(2501003)(2906002)(36756003)(6116002)(7736002)(6636002)(47776003)(305945005)(63370400001)(26005)(102836004)(50226002)(186003)(8676002)(110136005)(14454004)(1076003)(4326008)(81166006)(316002)(8936002)(8746002)(81156014)(36906005)(50466002)(386003)(6506007)(23756003)(25786009)(336012)(54906003)(6512007)(76130400001)(99286004)(356004)(63350400001)(478600001)(26826003)(4744005)(6486002)(22756006)(70586007)(70206006)(66066001)(5660300002)(476003)(486006)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0801MB1855;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6f28eadf-8ce2-4630-560e-08d72d29ad00
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0801MB1855; 
NoDisclaimer: True
X-Forefront-PRVS: 0145758B1D
X-Microsoft-Antispam-Message-Info: dsYkq3AX4O01ep9SHqfeGlubxqskEN2H2ZFrhRegwFqaSJElgKHS1K1EP93h+H1tAR4TdOV6FaM1pphfXSaNQjGsHUE8P8thVV82x1BoegUOYtAwMZz4+7ur1xrT8MkM3iZBH0hmbWdkq6bflr03U0zqmw9qzZsZVSzMUrTh+tmFnAoQInytqg1La48BVA5C3uqhaBRcpyWaqXrRNLZjwlbQcSMs9QPsbqXNqfD8lNCC3bKL/aitvqXccV6SQ+zQJBMUerfni/sVRGe0cMGHxLKl3Y6idgtpBsp6Wh0T+K0j81WM3z+Hbna9dzw9WBwIsb43m/ZBGV26oiAWmhgQA3Qg7lR8HZxvHrxnvfeVtq4LNyoEZSB63L12q759dugOfb1Bu8N2dJLgFb8qY8o7UZ7osIV96pJQmyE/bPyGS50=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2019 09:09:08.3283 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e5b6931-dfe1-475c-88c9-08d72d29b70a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1855
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2YfttFwbe46fxWfeXwZ4kI2bD84XZ4DigU/++mKPNI=;
 b=jMHVtTXhZPt3ekTifruid5AQ2UTZDkE+ZP/4FXIf1J3mO1RqlhwvMVVibH+qu9Rjoc1fsITyMOz8ryEHs2zZvcOBtqDZl1Eed8MsK6G7jknQfjHHfTyFJRDF515vqIbdflzUcfn1Zl6X1upcmareIM7F0TNmcuLc+3hE38cUwz8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2YfttFwbe46fxWfeXwZ4kI2bD84XZ4DigU/++mKPNI=;
 b=jMHVtTXhZPt3ekTifruid5AQ2UTZDkE+ZP/4FXIf1J3mO1RqlhwvMVVibH+qu9Rjoc1fsITyMOz8ryEHs2zZvcOBtqDZl1Eed8MsK6G7jknQfjHHfTyFJRDF515vqIbdflzUcfn1Zl6X1upcmareIM7F0TNmcuLc+3hE38cUwz8=
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

SGksCgpGcm9tIEQzMiBldmVyeSBjb21wb25lbnQgaGF2ZSBhIGxpbmUgc2l6ZSByZWdpc3RlciB0
byBpbmRpY2F0ZSBpbnRlcm5hbApmaWZvIHNpemUsIGluc3RlYWQgb2YgdXNpbmcgdGhlIGdsb2Jh
bCBsaW5lX3N6LgoKVGhpcyBzZXJpZSBhaW1zIGF0IGFkZGluZyB0aGUgbGF5ZXIgbGluZSBzaXpl
IHN1cHBvcnQgYW5kIGNoZWNrCmFjY29yZGluZ2x5IG9uIGJvdGggRDcxIGFuZCBEMzIgb3IgbmV3
ZXIuCgpMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpICgyKToKICBkcm0va29tZWRhOiBB
ZGQgbGluZSBzaXplIHN1cHBvcnQKICBkcm0va29tZWRhOiBBZGRzIGxheWVyIGhvcml6b250YWwg
aW5wdXQgc2l6ZSBsaW1pdGF0aW9uIGNoZWNrIGZvciBENzEKCiAuLi4vYXJtL2Rpc3BsYXkva29t
ZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgICAgfCAxMDUgKysrKysrKysrKysrKysrKy0tCiAuLi4v
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9yZWdzLmggfCAgIDggKy0KIC4uLi9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oICB8ICAgMiArCiAuLi4vZGlz
cGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMgICAgfCAgMTcgKysrCiA0IGZpbGVz
IGNoYW5nZWQsIDExNyBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
