Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02BBDF384
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 18:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8252E6E180;
	Mon, 21 Oct 2019 16:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60086.outbound.protection.outlook.com [40.107.6.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080736E180
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 16:47:22 +0000 (UTC)
Received: from VI1PR08CA0161.eurprd08.prod.outlook.com (2603:10a6:800:d1::15)
 by AM6PR08MB4868.eurprd08.prod.outlook.com (2603:10a6:20b:c5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.19; Mon, 21 Oct
 2019 16:47:17 +0000
Received: from VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::205) by VI1PR08CA0161.outlook.office365.com
 (2603:10a6:800:d1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.20 via Frontend
 Transport; Mon, 21 Oct 2019 16:47:17 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT028.mail.protection.outlook.com (10.152.18.88) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.23 via Frontend Transport; Mon, 21 Oct 2019 16:47:16 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Mon, 21 Oct 2019 16:47:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 09200a0bbc1e8812
X-CR-MTA-TID: 64aa7808
Received: from ac021f889559.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.54]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BCAA7B54-562D-48D5-967C-A88CD68B50C2.1; 
 Mon, 21 Oct 2019 16:47:10 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ac021f889559.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Oct 2019 16:47:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxZ2q/T8c7sho3PVJCnqS5y55lUfVGtFW7FgUIjCxGU6lk6eIe9NgCEkbw1wScA9t2vO7m8buBND0vyAOoPakujdoU086E4SgQe/M7KWUAqW9DU8g6OtU+Jw9Wyotv33zycUpVQUHJgOuKD6JDZ8iMng70tjmNOj8uSYXPlCSRKmRZKZj6CMW493g1PiIamI75lq56nA1728itWsrHaLouKPhxPufYuHhVCr9UKjfZBZXAejioX7wnKHOinC+cTFmqGeZr8bAbqVIoY7YQC6MT/0buo00LEB3OWv4IamFncF5GbalghS1QLRRy+sMA6OT8U+sirx4b+yPEkQMH3Alw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9J64zuHWOx4EgCVB0EXqWQuVwvJWaiUGokgqOGlFcHs=;
 b=O+S6ve4ahFoMosxfuUUkqTkz4/3wQPPkF5UZTtesqE0N7vB8reu5UegxdH+2H23ODiEhB3PCJwteoWzaRQBsjDWAfnQWz98AqzMP3DtlZug6b4bTwouVzwrc/24v7AsK0uK8kuLsvGrg1Hi8M7sGyUDRRHpm/FcFys5v/HjcBUkDZFU146ZyWPCPAGePzkrrQ6/dDyW9G/FTaOZ3Lv0M9AvX782Y8SImEGujj155RdoeA/BPqN1Ob1PigavfzIvXfi1LwWF2h3NTbPsxg3dZBRFx+1e0+SwPNJdALG8ea4hgqeGqYgPRVoogm5RLI38EyIYzqiIyiLMsFgRFg9H3JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3693.eurprd08.prod.outlook.com (20.178.13.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Mon, 21 Oct 2019 16:47:07 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2367.022; Mon, 21 Oct 2019
 16:47:07 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/5] drm/komeda: Improve IRQ error event prints
Thread-Topic: [PATCH 0/5] drm/komeda: Improve IRQ error event prints
Thread-Index: AQHViC8s1KqImT9XXEOlhsY8a6GCNA==
Date: Mon, 21 Oct 2019 16:47:06 +0000
Message-ID: <20191021164654.9642-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.51]
x-clientproxiedby: LO2P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::15) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 93d2793e-557e-4696-6fb1-08d756465491
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB3693:|VI1PR08MB3693:|AM6PR08MB4868:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4868183C89E149CBAD228B598F690@AM6PR08MB4868.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0197AFBD92
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(53754006)(199004)(189003)(6436002)(316002)(54906003)(256004)(8936002)(6512007)(14444005)(2501003)(71200400001)(5640700003)(71190400001)(50226002)(486006)(2906002)(6486002)(2616005)(44832011)(5660300002)(8676002)(476003)(305945005)(66066001)(36756003)(86362001)(25786009)(14454004)(186003)(478600001)(6506007)(386003)(102836004)(26005)(4326008)(2351001)(81156014)(1076003)(6116002)(3846002)(66946007)(81166006)(66556008)(52116002)(66476007)(7736002)(64756008)(66446008)(99286004)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3693;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Q+H/W29S9wSshMyTd5bwXyZwC32skH2JBr7WmRnO6giwOntgnsg3Tk6y3HuBOUOJ4qoeEAb9cFC9tKviONfbnh2SJxbXCq+G8yA8ltOMcQvO3XFqbEVwnt6fE4msM0lQxRSATKwYz+QFvUNXvLRQS/fkpFlGHbNpKH4alfo1FqXpLtWmKRky7AtDGbwSJL2r0eQnK9dHY6VF4XOSt7iqsybnhCB9KiIkJHaLEMfCychY76s5b5pgIy2Y4ZZBvxZh2f2v6DBHgiKIP0gaCacLe3sqPtxUORMI3mK/jgrT65BjMXcvHN5W66uRg7dm0HesqYCgIW0DthB/paaTOE1rPiONy94Y7ey4jrDYoov7ZLQr+DsO2gfDP7s3PDaF7Uthp8a4gSgQFXq+dCukbTSqUvhZUvZNU9DMqnTlf7dRYstQVvtVg021TtPQwHcDGTum
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3693
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(189003)(199004)(53754006)(50226002)(8936002)(8746002)(356004)(76130400001)(316002)(36906005)(22756006)(478600001)(8676002)(26826003)(86362001)(54906003)(70586007)(2351001)(70206006)(66066001)(2501003)(81156014)(81166006)(47776003)(6916009)(14454004)(99286004)(6116002)(36756003)(6512007)(25786009)(5640700003)(63350400001)(5660300002)(3846002)(486006)(2616005)(1076003)(476003)(126002)(4326008)(6486002)(336012)(107886003)(50466002)(7736002)(102836004)(23756003)(26005)(186003)(6506007)(386003)(14444005)(305945005)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4868;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: dd382067-8a03-4867-78d2-08d756464ee2
NoDisclaimer: True
X-Forefront-PRVS: 0197AFBD92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8VufEA+ez6TXgLprE45dfMkW6IwNsABs2MfFbpZ4NWcnqYUE9ZSszmoMlPnP1ogkmVNANxoOfENVIs9LwnlQPgPPEXUfC7aUkLgykHCqbQK+X8T0PY6lYnl2Hbb1xUtpqbuf7AHxTFUCo4wmwXlqz33S4sb+IisVQ9VcLwWrNS4EpvPtoVpW0/n0rZIq5T8JFGhRRwvPxbln8A4SVFSevkXe3el3Rv/YDQP6ZPdrxN56eQspn4dJWP6HELxsdkLu+YQigAAvN4XLCS0D/ycVW/iwMNCS9WyTBqyf4SgwS7973MepfBXDkOXnfCTvvfZIlU00lVb907yyNP0ccS2Xcf/IauCbEdUKOnaSdDA4QC8HdmWnjvSwPFCw36Aqkx5mqaJvxyo4WQy1wtheMb6dXwrvYbfgBQfrp00S9ZfXKGXWYVNhT4AiMz+JWqqQzx8O
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2019 16:47:16.1620 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d2793e-557e-4696-6fb1-08d756465491
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4868
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9J64zuHWOx4EgCVB0EXqWQuVwvJWaiUGokgqOGlFcHs=;
 b=DQQfD/9x1Wk5cOP4QuPEq2jbg1peJD0owTGknc60DJGQ2oMd24ejC6VIzcpNQqLD8o6ZPx5iVcU2nSHz+2BLp3zQCM0gYyRToj/8nlDyPILJz+H1q1uJsIGWm+xgcPIdjmhjsvwBn6mZoJThE8XLvc3sEuwl2IKtqcQWNbqkhn4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9J64zuHWOx4EgCVB0EXqWQuVwvJWaiUGokgqOGlFcHs=;
 b=DQQfD/9x1Wk5cOP4QuPEq2jbg1peJD0owTGknc60DJGQ2oMd24ejC6VIzcpNQqLD8o6ZPx5iVcU2nSHz+2BLp3zQCM0gYyRToj/8nlDyPILJz+H1q1uJsIGWm+xgcPIdjmhjsvwBn6mZoJThE8XLvc3sEuwl2IKtqcQWNbqkhn4=
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
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "james qian wang \(Arm
 Technology China\)" <james.qian.wang@arm.com>, "Lowry Li \(Arm Technology
 China\)" <Lowry.Li@arm.com>, nd <nd@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgZXZlcnlvbmUsCgpUaGlzIGlzIGEgc21hbGxpc2ggc2VyaWVzIHRoYXQgdHJpZXMgdG8gcmVt
b3ZlIHNvbWUgYnVpbGQtdGltZQpjb25maWd1cmFiaWxpdHkgaW4ga29tZWRhIGFuZCByZXBsYWNl
IGl0IHdpdGggYSBkZWJ1Z2ZzIGNvbnRyb2wuIExhdGVyCnBhdGNoZXMgaW4gdGhlIHNlcmllcyBh
ZGQgc29tZSBleHRyYSBmdW5jdGlvbmFsaXR5IHdoaWNoIEkgZm91bmQgdXNlZnVsCmR1cmluZyBt
eSBkZWJ1Z2dpbmcgc2Vzc2lvbnMsIHNvIEkgZmlndXJlZCBJJ2QgYmFrZSBpdCBpbi4KCkkndmUg
cHJlc2VydmVkIHRoZSBkZWZhdWx0IGJlaGF2aW91ciBhcyBpZiBDT05GSUdfS09NRURBX0VSUk9S
X1BSSU5UCndlcmUgZW5hYmxlZCwgc28gcHJvZHVjdGlvbiBrZXJuZWxzIGNhbiBoYXZlIHNvbWUg
ZmVlZGJhY2sgZnJvbSB0aGUKZHJpdmVyIHdoZW4gdGhpbmdzIGFyZSBnb2luZyBzb3V0aC4KCjE6
IEludHJvZHVjZSB0aGUgZXJyX3ZlcmJvc2l0eSBkZWJ1Z2ZzIG5vZGUgZm9yIGtvbWVkYTsgdGhp
cyBrZWVwcyB0aGUKICAgZGVmYXVsdCBvZiBwcmludGluZyBlcnJvciBldmVudHMgb25jZSBwZXIg
ZnJhbWUuCjI6IERyb3AgQ09ORklHX0tPTUVEQV9FUlJPUl9QUklOVCBzaW5jZSBvdXRwdXQgY2Fu
IGJlIGRpc2FibGVkIGF0CiAgIHJ1bnRpbWUKMzogQWRkIGEgZHJtIHN0YXRlIGR1bXAgb24gZXZl
bnQuIEl0J3MgcXVpdGUgY2hhdHR5IHNvIEkgbGVmdCBpdCBvbmx5CiAgIGZvciBlcnJvciBldmVu
dHM7IHByaW50aW5nIGFsbCB0aGF0IG9uY2UgcGVyIGZyYW1lIGV2ZXJ5IHZzeW5jIGZsb29kcyBt
eQogICBzZXJpYWwgdGVybWluYWwsIHNvIG5vIGluZm8gKyBzdGF0ZSBjb21iaW5hdGlvbi4KNDog
QWRkIGxvd2VyLXNldmVyaXR5IGNhdGVnb3JpZXMgdG8gdGhlIGV2ZW50IHByaW50ZXIKNTogTm9y
bWFsbHkgdGhlc2UgZXZlbnRzIGZpcmUgb25seSBvbmNlIHBlciBwYWdlZmxpcCwgYnV0IHNvbWV0
aW1lcyBpdCdzCiAgIHVzZWZ1bCB0byBzZWUgdGhlbSBhbGwgYXMgdGhleSBjb21lIGluLgoKVGhl
c2UgcGF0Y2hlcyBhcmUgb3ZlcmFsbCBxdWl0ZSB0aW55LCBhbmQgSSB3YXMgY29uc2lkZXJpbmcg
anVzdApzcXVhc2hpbmcgdGhlbSBpbnRvIG9uZSwgYnV0IEkgb3B0ZWQgdG8ga2VlcCB0aGVtIHNl
cGFyYXRlIGZvciBhbiBlYXNpZXIKcmV2aWV3IGV4cGVyaWVuY2U7IHBsZWFzZSBsZXQgbWUga25v
dyB3aGV0aGVyIHlvdSBwcmVmZXIgYSBzaW5nbGUgcGF0Y2guClRoYW5rcyEKCk1paGFpbCBBdGFu
YXNzb3YgKDUpOgogIGRybS9rb21lZGE6IEFkZCBkZWJ1Z2ZzIG5vZGUgdG8gY29udHJvbCBlcnJv
ciB2ZXJib3NpdHkKICBkcm0va29tZWRhOiBSZW1vdmUgQ09ORklHX0tPTUVEQV9FUlJPUl9QUklO
VAogIGRybS9rb21lZGE6IE9wdGlvbmFsbHkgZHVtcCBEUk0gc3RhdGUgb24gaW50ZXJydXB0cwog
IGRybS9rb21lZGE6IEFkZCBvcHRpb24gdG8gcHJpbnQgV0FSTi0gYW5kIElORk8tbGV2ZWwgSVJR
IGV2ZW50cwogIGRybS9rb21lZGE6IGFkZCByYXRlIGxpbWl0aW5nIGRpc2FibGUgdG8gZXJyX3Zl
cmJvc2l0eQoKIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9LY29uZmlnICAgICAgICAgICB8
ICA2IC0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvTWFrZWZpbGUgICB8
ICA1ICsrLS0KIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMgICB8
ICA0ICsrKwogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaCAgIHwg
MzAgKysrKysrKysrKysrKysrLS0tLQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9ldmVudC5jIHwgMjQgKysrKysrKysrKysrLS0tCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2ttcy5jICAgfCAgMiArLQogNiBmaWxlcyBjaGFuZ2VkLCA1MiBpbnNl
cnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
