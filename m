Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC24963F4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 17:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75C86E40E;
	Tue, 20 Aug 2019 15:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00048.outbound.protection.outlook.com [40.107.0.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914C46E40E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 15:17:14 +0000 (UTC)
Received: from DB6PR0802CA0042.eurprd08.prod.outlook.com (2603:10a6:4:a3::28)
 by DB6PR0801MB1847.eurprd08.prod.outlook.com (2603:10a6:4:3c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Tue, 20 Aug
 2019 15:17:11 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::205) by DB6PR0802CA0042.outlook.office365.com
 (2603:10a6:4:a3::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Tue, 20 Aug 2019 15:17:11 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 20 Aug 2019 15:17:09 +0000
Received: ("Tessian outbound cc8a947d4660:v26");
 Tue, 20 Aug 2019 15:17:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 16b669ec263041b4
X-CR-MTA-TID: 64aa7808
Received: from 96d95517a1a1.2 (cr-mta-lb-1.cr-mta-net [104.47.5.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E43D436E-4F98-4309-9A8F-E1AB5297BC29.1; 
 Tue, 20 Aug 2019 15:17:00 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2051.outbound.protection.outlook.com [104.47.5.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 96d95517a1a1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 20 Aug 2019 15:17:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3ceUuh0xU513PtpLtJ2DKNAGkEgo8/zep/q42Wh0iYaVmTiiOzBS+Mgx/GmE9HWrJKptIP4B4s1tmyozD/SiudXTdspUw/5dxxBuQY61ma+vveqNPhIcI2s5rPdqrrJhB1qQJkpBkW6tYUPljkB8rbkbyJmNsAUvc/EEltMXnTDO2loZxxMH+Jv+aeSm/rFjtnlzRbGpnLC7zMXTxXnn4o4NusV8TV5aiXTvfDGSXwlFEQpY4CC4bIsgWa/joJALghqF0JjzF3Gx3S2TRQuQV4/bCFTUBSJnRV6zMug3xzorG48LmdpnnZmKVNTUZhJ75ykVl/U3ZlcIdh9i+mTIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzEqZ7CC9OoVY5Ey3yEm1NH7WJvxczad09nO/5ZPgi0=;
 b=O58Usro5a/PUA4WhU0KoQLcodhF7LSgTcKblMu5m8NFZKtuXsRDRix1gaQkX08MjFfD18i5k7ijoUhno+85AVQgQDN1BH5lrcyJ/LybYEvGaz0qN8Fv20N1gUMTcRcOXBZbJztaSN9kvugONW8xlgAHLDrycQPsqGiPcxZvh+UP556cT9axMjvytmwWPskFMJ+jmr+nOY5K9vVffagFNdSV5H5jTn8c0snDChysx3VFp0fLjPpLF2t0M2pYj3d/3AR9y2re1ZJkykkfi72KCpQL2FfSGu0sTo8kBf922wt+lOk5As4SubtmzmfRiF01uQ7d/q5djxu3Qk1DoMpGALQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4477.eurprd08.prod.outlook.com (20.179.26.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 20 Aug 2019 15:16:58 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::2001:a268:ba50:fa51]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::2001:a268:ba50:fa51%3]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 15:16:58 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH] drm/komeda: Add missing of_node_get() call
Thread-Topic: [PATCH] drm/komeda: Add missing of_node_get() call
Thread-Index: AQHVV2pPVPebZtWZiUahUiy3IZo+Pg==
Date: Tue, 20 Aug 2019 15:16:58 +0000
Message-ID: <20190820151357.22324-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.50]
x-clientproxiedby: LO2P265CA0017.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::29) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.22.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6499ac73-8d5e-4b2e-329d-08d72581781d
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB4477; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB4477:|DB6PR0801MB1847:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB1847132D397CD4D5C602D8ED8FAB0@DB6PR0801MB1847.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:30;OLM:30;
x-forefront-prvs: 013568035E
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(189003)(199004)(6116002)(256004)(1671002)(2906002)(6506007)(14444005)(186003)(54906003)(478600001)(4744005)(26005)(102836004)(66446008)(7736002)(71200400001)(305945005)(66066001)(25786009)(66946007)(64756008)(6486002)(53936002)(66476007)(71190400001)(109986005)(66556008)(36756003)(50226002)(6436002)(81166006)(3846002)(6512007)(5660300002)(81156014)(8676002)(4326008)(386003)(14454004)(44832011)(52116002)(2616005)(476003)(316002)(86362001)(8936002)(486006)(99286004)(59246006)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4477;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: xdXJ73KPUk7mNIXgI6RrSpGccvOTiyyKcUWYTixMmj2AQrngfuJt7NPiucaC+N6oIsu1aNIlidb/SeZxNuxL4SdI1iCtOdxt/XZFc8txJK5HQ/MPZFF4ZiA8+ttc+sDEyy/eWQXnNKhizhsf8te0ig57jjsXEVSd721m/gIih42XXVs/N3w9/3S/CHpXPptVtyfFFyY8vprzZXLSu3IzCZemh8JOZjaQh0FUEhsd0HKNpetLO6ylgO3XINIZ4RZoAO07NVuaV6JdH8P9N40c9aNyRNltHhyAM4ixMfFXup8oMMJC0VEprUNFX7dSn6psDHnELoOBhz9chcdPTWt3i18ITy4Ty8S2B5kAM2QsleND8WJC4YlrIxf76T6FRR0sND6e3q1p9Hbx1PysXwtArehHuAHJRrjGnEvYIz+6y08=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4477
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(346002)(39860400002)(2980300002)(199004)(189003)(86362001)(36756003)(66066001)(5660300002)(478600001)(99286004)(6506007)(102836004)(386003)(63350400001)(126002)(476003)(63370400001)(336012)(2616005)(26005)(186003)(14444005)(26826003)(23756003)(14454004)(4326008)(109986005)(107886003)(305945005)(50226002)(50466002)(7736002)(76130400001)(47776003)(1076003)(70586007)(70206006)(356004)(486006)(2906002)(25786009)(4744005)(59246006)(8676002)(8746002)(1671002)(54906003)(36906005)(81166006)(81156014)(6486002)(8936002)(316002)(6512007)(6116002)(3846002)(22756006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB1847;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8b57ba38-c0eb-484f-0e7b-08d72581716d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(710020)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DB6PR0801MB1847; 
NoDisclaimer: True
X-Forefront-PRVS: 013568035E
X-Microsoft-Antispam-Message-Info: EeBQ4hyx5mrnNL5LdrZ1eL7fdjqBEXxYe71sJxsiONA8evZEeu1h1YDoYP3c5XYdxspWrBw42+KrADs/wY0u54121BcNRXsp+6/Oc2Fc6gvGMR1JNERq7ryQoCJ88xdM3wDvL+DuuSPZ7z3tXVDu8RwqL5uk6cF4tBP0w38qlEWQRLs5/5ZSDoN0bio78z0UhqInl8Rn2hL3h/MTEcJFo6j9yn7JZuJYwqQtPd3frh7cbjO/pR/ZcT8rhktTw6zsT+deivhqYFbK66rnPiKwHITLtwCxC9bBVmfCQWB3HtpejYiI2MeYgwC5G5JVZqwabLehjC/Y3/rHHH8hjoXe3PBbymYND372se888BAsxfjlzJb8JfI62SZV32peDeIWgL/DlxZz0nvYkvjFplhu/uC+7IlianBnvyIqGwJ17+o=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2019 15:17:09.1622 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6499ac73-8d5e-4b2e-329d-08d72581781d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1847
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzEqZ7CC9OoVY5Ey3yEm1NH7WJvxczad09nO/5ZPgi0=;
 b=s3DlH9q5uwjw0KdoIRo5/vBLN1DE0fVvaxLWRdyqg/KG6ZClB5dEerBzfeXwFo/vY56dTtk93UVvns0/YI8yaDFu+iZHrgnnM5XbDMSpJ7I3x0SFzyEZeXCLYsUNX5XowYs7TkZfLMpDDRVALBQ9ZV90iI9c/Wsar9B1LNaT3sc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzEqZ7CC9OoVY5Ey3yEm1NH7WJvxczad09nO/5ZPgi0=;
 b=s3DlH9q5uwjw0KdoIRo5/vBLN1DE0fVvaxLWRdyqg/KG6ZClB5dEerBzfeXwFo/vY56dTtk93UVvns0/YI8yaDFu+iZHrgnnM5XbDMSpJ7I3x0SFzyEZeXCLYsUNX5XowYs7TkZfLMpDDRVALBQ9ZV90iI9c/Wsar9B1LNaT3sc=
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "james qian
 wang \(Arm Technology China\)" <james.qian.wang@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

a29tZWRhX3BpcGVsaW5lX2Rlc3Ryb3kgaGFzIHRoZSBtYXRjaGluZyBvZl9ub2RlX3B1dCgpLgoK
Rml4ZXM6IDI5ZTU2YWVjOTExZGQgKCJkcm0va29tZWRhOiBBZGQgRFQgcGFyc2luZyIpClNpZ25l
ZC1vZmYtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMKaW5kZXggMDE0MmVl
OTkxOTU3Li5jYTY0YTEyOWM1OTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2Rldi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2Rldi5jCkBAIC0xMzAsNyArMTMwLDcgQEAgc3RhdGljIGludCBrb21l
ZGFfcGFyc2VfcGlwZV9kdChzdHJ1Y3Qga29tZWRhX2RldiAqbWRldiwgc3RydWN0IGRldmljZV9u
b2RlICpucCkKIAkJb2ZfZ3JhcGhfZ2V0X3BvcnRfYnlfaWQobnAsIEtPTUVEQV9PRl9QT1JUX09V
VFBVVCk7CiAKIAlwaXBlLT5kdWFsX2xpbmsgPSBwaXBlLT5vZl9vdXRwdXRfbGlua3NbMF0gJiYg
cGlwZS0+b2Zfb3V0cHV0X2xpbmtzWzFdOwotCXBpcGUtPm9mX25vZGUgPSBucDsKKwlwaXBlLT5v
Zl9ub2RlID0gb2Zfbm9kZV9nZXQobnApOwogCiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjIyLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
