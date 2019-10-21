Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 085B9DF0B6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 17:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372CC6E149;
	Mon, 21 Oct 2019 15:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE726E149
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 15:02:09 +0000 (UTC)
Received: from VI1PR08CA0143.eurprd08.prod.outlook.com (2603:10a6:800:d5::21)
 by HE1PR0801MB2010.eurprd08.prod.outlook.com (2603:10a6:3:4b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.18; Mon, 21 Oct
 2019 15:02:04 +0000
Received: from AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::206) by VI1PR08CA0143.outlook.office365.com
 (2603:10a6:800:d5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.20 via Frontend
 Transport; Mon, 21 Oct 2019 15:02:04 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT041.mail.protection.outlook.com (10.152.17.186) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.23 via Frontend Transport; Mon, 21 Oct 2019 15:02:03 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Mon, 21 Oct 2019 15:02:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f603f75de94af4e4
X-CR-MTA-TID: 64aa7808
Received: from 3788f471119f.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.8.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 94B43E00-7530-447C-9DC1-60C77ACB54AD.1; 
 Mon, 21 Oct 2019 15:01:57 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2051.outbound.protection.outlook.com [104.47.8.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3788f471119f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Oct 2019 15:01:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMzbpEHw+av+EXWF8qQyjiodHa0HnXMX3vnppnJ/S8e99jHL28lUo3ZjJRzUucUSbmfETrpa8opU85sYHRrsM6khizd1Z4fR75rrHqwJM7yZV5f16oUK4Iuecxb4KRUYOwTBqfmZTbHAEPyyJELK+rCHdxyLhTarIiCsT/6llZNDDEYm8+U0+0ynOUvMWU8fA/E53WrrBKOpJ3Jx05rOzCR9S3LnJE9BoxNhU2pR1Av5MRRk5o+9DYOyCNkKbGtl20lkWohgivXpzHnQShmPp6e3djuZZeuQ6nuHuYMF7cXAToot7bxa982WRfnojyzbiTXCLf5xgr1tbB9JthpryQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYumAecp+Rc/UXQzDGtL4a2IhNxeYQpPPiaKw0q6ZbM=;
 b=Jf4NnPOFSCCRa1zcmc6bB3lL7wMVYgzH4a3trsXkf+Ash+1M9CW4BBAKDHC4egCLYCWYLgWbvuWLWNnrCGpTh3OugttyVViHDtHlDPNPOL2ZmXyhGcO3xWDvVq8LEotL8VV84t3AM339MK54pWDQtmdU25pMzGwmutLi2UcugQP10g0/D/XuhrupgRdafwKCQRs1WReD6h/IdrLd+EUkRm5A2YDDLkl/z2DwUOMHixrGZ2Txz3i95g5Is8AceeGK8u87HHpEXncM7hPhqQwXZ7K89pdnBfSKWK4LiexCBa6TlYej8W4ujxNHhIqyg8nZj6gQRj41WNhu9FWeIkWjiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4383.eurprd08.prod.outlook.com (20.179.28.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Mon, 21 Oct 2019 15:01:56 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2367.022; Mon, 21 Oct 2019
 15:01:56 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH] MAINTAINERS: Add Mihail to Komeda DRM driver
Thread-Topic: [PATCH] MAINTAINERS: Add Mihail to Komeda DRM driver
Thread-Index: AQHViCB7QBCpqKK/Z0mgls76GftRfw==
Date: Mon, 21 Oct 2019 15:01:56 +0000
Message-ID: <20191021150123.19570-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.51]
x-clientproxiedby: LO2P123CA0044.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::32)
 To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 50a36421-4a83-4cf7-0faf-08d75637a217
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB4383:|VI1PR08MB4383:|HE1PR0801MB2010:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0801MB201076C2E603079CE943AC518F690@HE1PR0801MB2010.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:873;OLM:873;
x-forefront-prvs: 0197AFBD92
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(189003)(199004)(5660300002)(50226002)(8676002)(6486002)(81156014)(1076003)(6512007)(256004)(81166006)(478600001)(4326008)(476003)(66066001)(71190400001)(5640700003)(4744005)(25786009)(8936002)(2616005)(36756003)(14454004)(71200400001)(6436002)(54906003)(66476007)(66446008)(64756008)(66556008)(3846002)(52116002)(186003)(386003)(6506007)(7736002)(66946007)(99286004)(44832011)(6116002)(305945005)(86362001)(6916009)(102836004)(486006)(26005)(7416002)(2906002)(316002)(2351001)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4383;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 9sxBhaLoNaI027xoS+g1M19RiQYc6piQOcQocqKg6CQTnh0Murhs0fU9z4yqRv15g7M1LCp/IDIeUDVAogodxNOI2g5mA12amAEENXN67xTqD5WIN/0AeJgpQp09U17yRWSFfetTJwFWarCAxetkLVCsfQ4Yif+JX+WMJvcrnKnGTTaRau4rGOUi1oLpHhiAmCDgf41kaLl8/je6BhqvcMNKAgHkDEhUJqG1kVSGXa5LQTCJo8QV6+kp3J7R6wrYQXoz3fH7eFoDJMQRhkIz+pg2asqND/1SWpt2QlvWpouOsdUFS+ji8vhF5MM93qFbmpZFDDU0mirk6fZsMMlUbsdNVCe5Fahn64MKvN8+jAjqOf8NqwGH3brfiwGuqqW2G4P1vhgbQc2gD/PmKmmfNTE94SlaKbUGwaqNIC4qaN/nJFucZC+dyZ+xeYIEkP0F
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4383
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(346002)(136003)(199004)(189003)(81156014)(476003)(6512007)(81166006)(102836004)(3846002)(70206006)(76130400001)(126002)(486006)(4326008)(2906002)(86362001)(2616005)(70586007)(63350400001)(6116002)(26005)(8936002)(6486002)(8746002)(5660300002)(22756006)(107886003)(50226002)(8676002)(1076003)(4744005)(36756003)(6506007)(386003)(356004)(2501003)(14454004)(36906005)(50466002)(26826003)(316002)(99286004)(25786009)(5640700003)(478600001)(54906003)(2351001)(23756003)(6916009)(336012)(186003)(66066001)(47776003)(305945005)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0801MB2010;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 25f36aad-e55d-4187-1bbe-08d756379d70
NoDisclaimer: True
X-Forefront-PRVS: 0197AFBD92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WFB1oKiZMSEQaM3yNiB4EJTpGmAlQLjlNyJJh0+9Dyr3DJMxPSG05xXBzUYrTLQJeT+wwGgOIP6TE3+qhMh0+wRR3KLDq/Sl7ijsdj8XLY/PNKfA8YhONwIaqauyazx8mbIMzAC1iHTKI0PcXfk57YTpazhPcFsQFv5ITtSEhYbX6bpfW0k3eJPny9kFU+rOoWmSPYem5IEwTnlO+YD+v3GDo2MuSq6wLojO9n6ehl/xgybjt15BvWShZTfiz4rRUa7398LCm8EFwiCL4ZBFMgM6tj4WGa0388gys9nenpUdHGkgLQby6C9/WWyAlx+aQRMKhEh+DUprZ3EuOnx1Itd8YEmZ/OYleyY+joPkA93T16xem35vxY5vWQVwK54lGh5e6bNzDFficOwcK3WTbWfuSoMRNmqUghQRT0Dqz+o=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2019 15:02:03.8204 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a36421-4a83-4cf7-0faf-08d75637a217
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2010
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYumAecp+Rc/UXQzDGtL4a2IhNxeYQpPPiaKw0q6ZbM=;
 b=vs05PJI9gL1jIUlC2tmA3gwWj+i4aNqVFA1cUdx2rthNEAdWkkho9t4YzAGQVfldDmAdtJX1/0UueKOFBr6dWgaqKE3BCw4SGe+WYlZiqw9lwNXP+cippZJ1HuLpGYd/ty0mNTnvtt7XK9EL+TPse19e78Rk0U6oCQM0rkcAq1o=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYumAecp+Rc/UXQzDGtL4a2IhNxeYQpPPiaKw0q6ZbM=;
 b=vs05PJI9gL1jIUlC2tmA3gwWj+i4aNqVFA1cUdx2rthNEAdWkkho9t4YzAGQVfldDmAdtJX1/0UueKOFBr6dWgaqKE3BCw4SGe+WYlZiqw9lwNXP+cippZJ1HuLpGYd/ty0mNTnvtt7XK9EL+TPse19e78Rk0U6oCQM0rkcAq1o=
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, nd <nd@arm.com>,
 Sean Paul <sean@poorly.run>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSdsbCBiZSB0aGUgbWFpbiBwb2ludCBvZiBjb250YWN0LgoKQ2M6IEphbWVzIFFpYW4gV2FuZyAo
QXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KQ2M6IExpdml1
IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFz
c292IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogTUFJTlRBSU5FUlMgfCAxICsKIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIv
TUFJTlRBSU5FUlMKaW5kZXggOTRmYjA3N2MwODE3Li5kMzJmMjYzZjAwMjIgMTAwNjQ0Ci0tLSBh
L01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC0xMjUxLDYgKzEyNTEsNyBAQCBGOglE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hcm0saGRsY2QudHh0CiBB
Uk0gS09NRURBIERSTS1LTVMgRFJJVkVSCiBNOglKYW1lcyAoUWlhbikgV2FuZyA8amFtZXMucWlh
bi53YW5nQGFybS5jb20+CiBNOglMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KK006
CU1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KIEw6CU1hbGkgRFAg
TWFpbnRhaW5lcnMgPG1hbGlkcEBmb3NzLmFybS5jb20+CiBTOglTdXBwb3J0ZWQKIFQ6CWdpdCBn
aXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MKLS0gCjIuMjMuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
