Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ECBC36FB
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 16:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD8989EFF;
	Tue,  1 Oct 2019 14:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130054.outbound.protection.outlook.com [40.107.13.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13D789EFF
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 14:21:53 +0000 (UTC)
Received: from HE1PR0802CA0014.eurprd08.prod.outlook.com (2603:10a6:3:bd::24)
 by DB8PR08MB5050.eurprd08.prod.outlook.com (2603:10a6:10:e2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Tue, 1 Oct
 2019 14:21:50 +0000
Received: from DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::206) by HE1PR0802CA0014.outlook.office365.com
 (2603:10a6:3:bd::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.17 via Frontend
 Transport; Tue, 1 Oct 2019 14:21:49 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT038.mail.protection.outlook.com (10.152.21.84) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 1 Oct 2019 14:21:48 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Tue, 01 Oct 2019 14:21:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b0146f8dab5cec7e
X-CR-MTA-TID: 64aa7808
Received: from 8e07f4a7b67a.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.0.55]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 61B73AB9-26D4-4915-92E6-F645E6A410B8.1; 
 Tue, 01 Oct 2019 14:21:42 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2055.outbound.protection.outlook.com [104.47.0.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e07f4a7b67a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 01 Oct 2019 14:21:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3yA57ehSL/PNAvmjtzej3gyYX91Fc7beDpzoVA7WN0+wGhx5eevXexwjRW49g9Jog3fWg42DwBTFYeTn3nGPIXUusF800TZC0AWAnyn+uHh/FWsyx+zQWYxqe1MZx6q5xh4dLaBaMOUeGWIJwz+q5qJOpiph6Xqbnk+hQD8iv11XPuTZLnRQDhGzATdlkJ8mB1Z0/g5PS0DLxUP+Fr1dP0xNqSsoxnZR3/MCx4ZXk1/2fwHNqszZjOM6hy3o1+QjDVOEwynr3pjNZZzpI81XYBio9A/LIyBQWpxLembMftQGwRgcSwYI0st6T7lKhSg0kUPMiYdMd5hiSRwT8aJrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfw2sf2si3Nv0iHorWaRwlKjiK8IurKK498KgNpOP6Y=;
 b=GDzLaA2aJV09XDjIgU4qL2bHO6sdemCU2974ibDIWj8YOr2YjR+2DtiQ0xuBGMzOcsrS3uXLrsqLcD+kh8W20fmTtaJZaxghnMrxXleGqAhgkdl8S0rUDf4VrNOmOFW7ugNcFDV35xO4W1tXdjDSvX5FWy1jRDQ5oclWx8mkjjcgKT2Ec2HNATv/UWx2dEmpZAynyyB8XSoSrVRh/JGtoasqS0ut7bGU3vAKVAyMwuzVMchFZO5Rp5LPMjHJZ1MVy8TzBoqZXaaB4g88EoBoiRB53r3XbjCMgPb8uMDLY72w2/5QvRBgb1dtT1nvhlAloy2jQI7EaoD5Vl91OWczmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4350.eurprd08.prod.outlook.com (20.179.27.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 14:21:40 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2305.017; Tue, 1 Oct 2019
 14:21:40 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 RESEND] drm/komeda: Workaround for broken FLIP_COMPLETE
 timestamps
Thread-Topic: [PATCH v2 RESEND] drm/komeda: Workaround for broken
 FLIP_COMPLETE timestamps
Thread-Index: AQHVeGOLfzM60ocEQ0aSA9ftqtg50Q==
Date: Tue, 1 Oct 2019 14:21:40 +0000
Message-ID: <20191001142121.13939-1-mihail.atanassov@arm.com>
References: <20190923101017.35114-1-mihail.atanassov@arm.com>
In-Reply-To: <20190923101017.35114-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0235.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::31) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 786e935d-b6ab-4bde-705c-08d7467ab20e
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB4350:|VI1PR08MB4350:|DB8PR08MB5050:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB50505ACBE221868844908BE08F9D0@DB8PR08MB5050.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 0177904E6B
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(189003)(199004)(6512007)(305945005)(66066001)(446003)(2501003)(11346002)(2906002)(36756003)(54906003)(7736002)(6486002)(316002)(4326008)(6306002)(2616005)(5640700003)(476003)(2351001)(486006)(44832011)(256004)(14444005)(478600001)(6436002)(52116002)(1076003)(99286004)(6916009)(76176011)(66946007)(64756008)(66446008)(66556008)(8936002)(66476007)(386003)(102836004)(71190400001)(71200400001)(5660300002)(50226002)(6116002)(3846002)(26005)(86362001)(186003)(6506007)(8676002)(14454004)(81156014)(81166006)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4350;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: tpz8KFK97e9mXWTPAuP5J0bXrMPhWCtDSm18DJXiwrQwtEdhnjVqWAzXoOoZn1bqEO+0rgMyBk3r6N4JZAS+rw4JZY0tknM7TV7o0yF+jJYTiPnegEDSKn3QiwLzsx9W79QWAHyRvcP7MXc3zAUTfDIJ5lFBie3+PScl9Cxy4HVjEzyfmurvl4JIapvI+q86feKUTvNjz/C15BoRb4R9BblWeopTAhGFX9H1tysvbgvUB0hrOTLchk3F//u11GtZJ8SylhO3dr36x1PdqKIQydYjQztD/QihFFBQmYb2oc3NCT7XiTGXkqbl0LWeM3KuWqqCRrRegzo9/FeFT/h5NxhmqboUpv4h6KTr/oq7r81WtDFGY0CbqJzXlqGRrvfjHOJl/EI/s2WLyGdhsxHVxEJSC5QX9YRBlfsVYhpOJJQ6mEfHHU+46iD6VQM+7Ud0F5t9L00eWgBXn+WOERTG5w==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4350
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(346002)(199004)(189003)(81166006)(50466002)(63350400001)(54906003)(76130400001)(3846002)(4326008)(6306002)(6506007)(107886003)(7736002)(6116002)(23756003)(8746002)(305945005)(6512007)(99286004)(70206006)(70586007)(102836004)(47776003)(5640700003)(2906002)(316002)(66066001)(386003)(8936002)(186003)(8676002)(76176011)(26005)(5660300002)(26826003)(81156014)(126002)(336012)(486006)(6916009)(22756006)(2616005)(2501003)(6486002)(14454004)(446003)(356004)(478600001)(50226002)(25786009)(1076003)(14444005)(11346002)(36756003)(2351001)(86362001)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB5050;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 985c1580-a18c-43f5-77e2-08d7467aad68
NoDisclaimer: True
X-Forefront-PRVS: 0177904E6B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /WV/Z9embXghCp6Zqiy9ghxq/Y7CPd5qD7eOJyS3CVDRboWxdDwmwm/u3bigq7bZDykU7hqWIEr5vS5leEPhhkWfdhc+kw5rC6F+NNiKqr74Z+ZGuNE7JYe893D6utmgVtAinOtz2CPxpdym3y2DnJOEveVX6LmrVmOuaW8ZiRx+z2Wo+46sA6rGZoaWtBKrTvOKDyKrJUZyG9zb4VQ8EfbBcrcLlusJnCWkMvWTQsACF7ok3WOc+ZJh8kedEB2O8D8FJa73SnOR1z3f1F2XaUjgV70F8UXjG5P3Unre9Duhr2D5K+TBE7YYH5LY6srJCIKdzruVvTTXPToEmEGqEOrPn48emSBKLNeERSLVeya18iOlqU9Gg+rgnTVFZjyw4C12ycNrAjvr59vTtMjk2mJQ7m1vNHu1lESHsJNl3DjXSi8rsBRnLoZNcwGLj2Tsxjd/V0+su/+fGyco3fYFhw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2019 14:21:48.2879 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 786e935d-b6ab-4bde-705c-08d7467ab20e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5050
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfw2sf2si3Nv0iHorWaRwlKjiK8IurKK498KgNpOP6Y=;
 b=Ss9vkVBMXO2QGntX2fvGSQdIL8AQT/I/CT4hr8DrKYWLXudKFgg5Rvwkqf9wB7u/tIY2vZBxwBbcuk81MaQ4dFIoLRheBeNI7NXP7tTKHUtXk4DvuSdtoMJZHXBQfQ9DhNg7OTf0NkuG7RM/SNr6m+jzmCfDOOVRCAkBQ2wmdbA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfw2sf2si3Nv0iHorWaRwlKjiK8IurKK498KgNpOP6Y=;
 b=Ss9vkVBMXO2QGntX2fvGSQdIL8AQT/I/CT4hr8DrKYWLXudKFgg5Rvwkqf9wB7u/tIY2vZBxwBbcuk81MaQ4dFIoLRheBeNI7NXP7tTKHUtXk4DvuSdtoMJZHXBQfQ9DhNg7OTf0NkuG7RM/SNr6m+jzmCfDOOVRCAkBQ2wmdbA=
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
 "james qian wang
 \(Arm Technology China\)" <james.qian.wang@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBpbml0aWFsbHkgdHVybmluZyBhIGNydGMgb24sIGRybV9yZXNldF92YmxhbmtfdGltZXN0
YW1wIHdpbGwKc2V0IHRoZSB2YmxhbmsgdGltZXN0YW1wIHRvIDAgZm9yIGFueSBkcml2ZXIgdGhh
dCBkb2Vzbid0IHByb3ZpZGUKYSAtPmdldF92YmxhbmtfdGltZXN0YW1wKCkgaG9vay4KClVuZm9y
dHVuYXRlbHksIHRoZSBGTElQX0NPTVBMRVRFIGV2ZW50IGRlcGVuZHMgb24gdGhhdCB0aW1lc3Rh
bXAsCmFuZCB0aGUgb25seSB3YXkgdG8gcmVnZW5lcmF0ZSBhIHZhbGlkIG9uZSBpcyB0byBoYXZl
IHZibGFuawppbnRlcnJ1cHRzIGVuYWJsZWQgYW5kIGhhdmUgYSB2YWxpZCBpbi1JU1IgY2FsbCB0
bwpkcm1fY3J0Y19oYW5kbGVfdmJsYW5rLgoKQWRkaXRpb25hbGx5LCBpZiB0aGUgdXNlciBkb2Vz
bid0IHJlcXVlc3QgdmJsYW5rcyBidXQgX2RvZXNfIHJlcXVlc3QKRkxJUF9DT01QTEVURSBldmVu
dHMsIHdlIHN0aWxsIGRvbid0IGhhdmUgYSBnb29kIHRpbWVzdGFtcDogaXQnbGwgYmUgdGhlCnNh
bWUgc3RhbXAgYXMgdGhlIGxhc3QgdmJsYW5rIG9uZS4KCldvcmsgYXJvdW5kIHRoZSBpc3N1ZSBi
eSBhbHdheXMgZW5hYmxpbmcgdmJsYW5rcyB3aGVuIHRoZSBDUlRDIGlzIG9uLgpSZWR1Y2luZyB0
aGUgYW1vdW50IG9mIHRpbWUgdGhhdCBQTDAgaGFzIHRvIGJlIHVubWFza2VkIHdvdWxkIGJlIG5p
Y2UgdG8KZml4IGF0IGEgbGF0ZXIgdGltZS4KCkNoYW5nZXMgc2luY2UgdjEgW2h0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8zMzE3MjcvXToKIC0gbW92ZWQgZHJtX2NydGNf
dmJsYW5rX3B1dCBjYWxsIHRvIHRoZSAtPmF0b21pY19kaXNhYmxlKCkgaG9vawoKQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IExpdml1IER1ZGF1IDxMaXZpdS5EdWRhdUBh
cm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292
QGFybS5jb20+ClJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENo
aW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2NydGMuYwppbmRleCA5Y2E1ZGJmZDA3MjMuLjc1MjYzZDhjZDBiZCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwpAQCAtMjQ5LDYg
KzI0OSw3IEBAIGtvbWVkYV9jcnRjX2F0b21pY19lbmFibGUoc3RydWN0IGRybV9jcnRjICpjcnRj
LAogewogCWtvbWVkYV9jcnRjX3ByZXBhcmUodG9fa2NydGMoY3J0YykpOwogCWRybV9jcnRjX3Zi
bGFua19vbihjcnRjKTsKKwlXQVJOX09OKGRybV9jcnRjX3ZibGFua19nZXQoY3J0YykpOwogCWtv
bWVkYV9jcnRjX2RvX2ZsdXNoKGNydGMsIG9sZCk7CiB9CiAKQEAgLTM0MSw2ICszNDIsNyBAQCBr
b21lZGFfY3J0Y19hdG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJCWtvbWVk
YV9jcnRjX2ZsdXNoX2FuZF93YWl0X2Zvcl9mbGlwX2RvbmUoa2NydGMsIGRpc2FibGVfZG9uZSk7
CiAJfQogCisJZHJtX2NydGNfdmJsYW5rX3B1dChjcnRjKTsKIAlkcm1fY3J0Y192Ymxhbmtfb2Zm
KGNydGMpOwogCWtvbWVkYV9jcnRjX3VucHJlcGFyZShrY3J0Yyk7CiB9Ci0tIAoyLjIzLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
