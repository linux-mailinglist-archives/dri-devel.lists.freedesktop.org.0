Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B317CD6D1B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 04:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB436E31E;
	Tue, 15 Oct 2019 02:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50060.outbound.protection.outlook.com [40.107.5.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33CAC6E31E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 02:10:57 +0000 (UTC)
Received: from DB6PR0801CA0049.eurprd08.prod.outlook.com (2603:10a6:4:2b::17)
 by HE1PR0802MB2522.eurprd08.prod.outlook.com (2603:10a6:3:dc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Tue, 15 Oct
 2019 02:10:51 +0000
Received: from DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::204) by DB6PR0801CA0049.outlook.office365.com
 (2603:10a6:4:2b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Tue, 15 Oct 2019 02:10:51 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT033.mail.protection.outlook.com (10.152.20.76) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 15 Oct 2019 02:10:50 +0000
Received: ("Tessian outbound e4042aced47b:v33");
 Tue, 15 Oct 2019 02:10:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2a09fdb8b27f0855
X-CR-MTA-TID: 64aa7808
Received: from bac45403aab5.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6E88ABB7-A4AB-45F2-8561-53E65A73E125.1; 
 Tue, 15 Oct 2019 02:10:40 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2052.outbound.protection.outlook.com [104.47.9.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bac45403aab5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 15 Oct 2019 02:10:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tx+LM6dJblu3vTc7kI30eBXHWwx+tKuIxj2IFeFNMTK2afc8MYSS2MnW8a2pfcXQbuJzheRrgJHj0QdUgpGJ00xEoUNno5zKwuwEZ+jSXgGZmXp1dRo7NXgodkFALI3WUxeoc3rzG8Jhpf7ONC69qN3vC/eXKJqp7dRMI4XoI97U2W9i9tpMMnKuwSfEBhdRaSAb2mN0MsE3hRmt6bHzkYf6/a5WzGGNoPaz+sSIjs6su521jkGhd58/6gXXnUmEpv/+380Ma15zN+McPplcc/d8r9lxHTuzSinThwFQ7qx5YsxuyDFsYHp2jepewDJhyRi34hipwUNsiSttB3cfZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5HRz67eijzeWYcpzNtgVdq0TE9Z8vNJMmkqaVkQzqw=;
 b=Sm13nW8G9K4v/9+o08tuADUz4cMvbWZlNzkKGysUe6ebVXzPiDULKNCZvfxEA03jtSbvGbN5K4ve/cOGwm2k7mYFQFsq4zHf1Rc+CL34bhqk4LAA0vgKaX1k+FptlTznsT37N9WAMbi3jGI3xufX+woM36Bj5or/+n2gs0z1Arim4aESXjuZMwMYFTiACSEhBxNwCuTgLZMOlScXRqhJJgvh5C2A00s86s2AH0J9IlQH5d9xoJlMNKN0hOEPIqOn7fQh2wdacuP4CxRctwZrCrPoH99Yyx2wBTE8GP6Y/Q3tJgSLnV3ObogiVoXSCRQe0UEvW8f2EiFH2lNqmo6bzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4799.eurprd08.prod.outlook.com (10.255.115.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Tue, 15 Oct 2019 02:10:37 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 02:10:37 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: [PATCH v2 0/4] drm/komeda: Enable CRTC color-mgmt
Thread-Topic: [PATCH v2 0/4] drm/komeda: Enable CRTC color-mgmt
Thread-Index: AQHVgv289rsMbYlLHUGqAFFZi7hqtg==
Date: Tue, 15 Oct 2019 02:10:37 +0000
Message-ID: <20191015021016.327-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3e::18) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ae40b4f3-7e00-400d-98dd-08d75114e6a8
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4799:|VE1PR08MB4799:|HE1PR0802MB2522:
X-MS-Exchange-PUrlCount: 3
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0802MB25227F499EC9EAAD55EF133BB3930@HE1PR0802MB2522.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
x-forefront-prvs: 01917B1794
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(189003)(199004)(66066001)(476003)(110136005)(54906003)(66946007)(64756008)(66476007)(66446008)(71200400001)(66556008)(26005)(103116003)(2201001)(86362001)(6512007)(186003)(71190400001)(316002)(6306002)(36756003)(6506007)(386003)(2616005)(486006)(2906002)(256004)(52116002)(14444005)(55236004)(102836004)(2171002)(8936002)(14454004)(478600001)(6486002)(81156014)(81166006)(305945005)(50226002)(966005)(2501003)(4326008)(8676002)(7736002)(5660300002)(1076003)(6116002)(3846002)(25786009)(99286004)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4799;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: MuaZOcTFiyAAWqz0ivCSWQa2MVBc3ak1ofXvCDlFlHAlZwbcn147SPYDcnYHEaS8rdMXfvK5pJMxsB5NkQzBLE+lIsg78qIzP90T+nzW6Sxt56KHlguQE7D5O63JRX8dw4tyhyNzA1zhxG8t2X8+3VsNcjhv3+/hYFKnJHRCIp0+yI7/RKguMwUXmTgPbKxW5n6k+1azdanJFZrvUFSjoH51/A8FNKoQEUxqpTRcCMcZ7anhYw15lyE3S3sc//NylBaj0ORnr7GsXNgNgeCDItIF+5ZO2XxVcviwNFONqOQOJDM4T8CZaOT1V+yg0itSVuw/NZAzo9OJ/ccCBIVuFxnh3SRDqqB7AJajVOuwdLiqQczcvwE/KLoQsBMvtTGgjJzAs/HETz38nTWUjLRubiwrtfPFEwOrKG5QrupM2E54JRPCe/yUA7uUweYEJFTmxuoFQJbnjdO9hPyanEX36Q==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4799
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(396003)(136003)(199004)(189003)(2201001)(2171002)(8746002)(70586007)(6486002)(86362001)(6512007)(3846002)(6116002)(103116003)(8936002)(14454004)(81166006)(6306002)(70206006)(81156014)(8676002)(50226002)(76130400001)(14444005)(7736002)(4326008)(23756003)(305945005)(22756006)(25786009)(99286004)(336012)(2906002)(50466002)(356004)(186003)(47776003)(2501003)(5660300002)(966005)(66066001)(476003)(63350400001)(486006)(26826003)(478600001)(316002)(102836004)(6506007)(386003)(110136005)(54906003)(36756003)(2616005)(126002)(26005)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0802MB2522;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3784d254-b0ea-4db3-944b-08d75114de9d
NoDisclaimer: True
X-Forefront-PRVS: 01917B1794
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S/GGCUJBFC7UA4iQxOu69tHs7Ans/60mMqBqElvvjpReNvAtA2nxdV7qf4AASGmWmrGSUzN+pxOs03SdIxGj0D05j2GpxpzZ1wec56F4ox/2GgCp+VvU68fI21ff5RBDRaPee2K+gczTcjWOIPEDvf49f1VFVatZOBcOfjCTImQkrtLd+xOqFL4xLo99VL3Hqa1tfVcbrIPxJIf+Jry67epzydevrgzyHIfiq7nsZKWMaOUzDtiUtXB3PZpfVCdQXtKpgNatjZruAIwMIsFbax0YsVRkS4LKZjRnK1LQipdq86geyZgF+kowpYhlrYgDdC/WAp2PHIdYJcsBuqmFhgJ6fPs7AETUmPG8PZCfkBDK41cHf+P8SsxfKw+oqHNipTOJpMOIW4vbmlePxYEwD2xOY3/qm6KV9cxbCbQdsqW6Y/TkhbccNuj3R3OC1a3waGJmfmjwPUWezNkSyDALkA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2019 02:10:50.6728 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae40b4f3-7e00-400d-98dd-08d75114e6a8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2522
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5HRz67eijzeWYcpzNtgVdq0TE9Z8vNJMmkqaVkQzqw=;
 b=Izm72rhmSwJlDJIpjd0npx8k7dUCmLJT/1IignRi6sbTeDr8j+5WXAeL7ZdDhyAe+OaWkXj4crBG4/Y67OZF9FVYVyKc7+YF2ro16cSnKdphlBr7wEopgIjDMkMIoVLfMvrA0td9xX/uJE9Mafr4cxk9nV8f+K+nTQsrZYG2mSk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5HRz67eijzeWYcpzNtgVdq0TE9Z8vNJMmkqaVkQzqw=;
 b=Izm72rhmSwJlDJIpjd0npx8k7dUCmLJT/1IignRi6sbTeDr8j+5WXAeL7ZdDhyAe+OaWkXj4crBG4/Y67OZF9FVYVyKc7+YF2ro16cSnKdphlBr7wEopgIjDMkMIoVLfMvrA0td9xX/uJE9Mafr4cxk9nV8f+K+nTQsrZYG2mSk=
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

VGhpcyBzZXJpZXMgZW5hYmxlIENSVEMgY29sb3ItbWdtdCBmb3Iga29tZWRhIGRyaXZlciwgZm9y
IGN1cnJlbnQga29tZWRhIEhXCndoaWNoIG9ubHkgc3VwcG9ydHMgY29sb3IgY29udmVyc2lvbiBh
bmQgZm9yd2FyZCBnYW1tYSBmb3IgQ1JUQy4KClRoaXMgc2VyaWVzIGFjdHVhbGx5IGFyZSByZWdy
b3VwZWQgZnJvbToKLSBkcm0va29tZWRhOiBFbmFibGUgbGF5ZXIvcGxhbmUgY29sb3ItbWdtdDoK
ICBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzYwODkzLwoKLSBkcm0v
a29tZWRhOiBFbmFibGUgQ1JUQyBjb2xvci1tZ210CiAgaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3Nlcmllcy82MTM3MC8KCkZvciByZW1vdmluZyB0aGUgZGVwZW5kZW5jZSBvbjoK
LSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzMwODc2LwoKTG93cnkg
TGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSAoMSk6CiAgZHJtL2tvbWVkYTogQWRkcyBnYW1tYSBh
bmQgY29sb3ItdHJhbnNmb3JtIHN1cHBvcnQgZm9yIERPVS1JUFMKCmphbWVzIHFpYW4gd2FuZyAo
QXJtIFRlY2hub2xvZ3kgQ2hpbmEpICgzKToKICBkcm0va29tZWRhOiBBZGQgYSBuZXcgaGVscGVy
IGRybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24oKQogIGRybS9rb21lZGE6IEFkZCBkcm1fbHV0
X3RvX2ZnYW1tYV9jb2VmZnMoKQogIGRybS9rb21lZGE6IEFkZCBkcm1fY3RtX3RvX2NvZWZmcygp
Cgp2MjoKICBNb3ZlIHRoZSBmaXhwb2ludCBjb252ZXJzaW9uIGZ1bmN0aW9uIHMzMV8zMl90b19x
Ml8xMigpIHRvIGRybSBjb3JlCiAgYXMgYSBzaGFyZWQgaGVscGVyLgoKdjQ6CiAgQWRkcmVzcyBy
ZXZpZXcgY29tbWVudHMgZnJvbSBNaWhhaSwgRGFuaWVsIGFuZCBJbGlhLgoKTG93cnkgTGkgKEFy
bSBUZWNobm9sb2d5IENoaW5hKSAoMSk6CiAgZHJtL2tvbWVkYTogQWRkcyBnYW1tYSBhbmQgY29s
b3ItdHJhbnNmb3JtIHN1cHBvcnQgZm9yIERPVS1JUFMKCmphbWVzIHFpYW4gd2FuZyAoQXJtIFRl
Y2hub2xvZ3kgQ2hpbmEpICgzKToKICBkcm06IEFkZCBhIG5ldyBoZWxwZXIgZHJtX2NvbG9yX2N0
bV9zMzFfMzJfdG9fcW1fbigpCiAgZHJtL2tvbWVkYTogQWRkIGRybV9sdXRfdG9fZmdhbW1hX2Nv
ZWZmcygpCiAgZHJtL2tvbWVkYTogQWRkIGRybV9jdG1fdG9fY29lZmZzKCkKCiAuLi4vYXJtL2Rp
c3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgICAgfCAyNCArKysrKysrCiAuLi4vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMgICAgfCA2NiArKysrKysrKysrKysr
KysrKysrCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmggICAgfCAx
MCArKy0KIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jICB8ICAy
ICsKIC4uLi9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oICB8ICAzICsK
IC4uLi9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYyAgICB8ICA2ICsrCiBk
cml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9yX21nbXQuYyAgICAgICAgICAgICAgfCAyNiArKysrKysr
KwogaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaCAgICAgICAgICAgICAgICAgIHwgIDIgKwog
OCBmaWxlcyBjaGFuZ2VkLCAxMzggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKLS0KMi4y
MC4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
