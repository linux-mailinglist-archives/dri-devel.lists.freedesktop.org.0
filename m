Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8B110E947
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 12:08:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DCF089B9E;
	Mon,  2 Dec 2019 11:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40073.outbound.protection.outlook.com [40.107.4.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C840089B9E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 11:08:07 +0000 (UTC)
Received: from HE1PR0802CA0007.eurprd08.prod.outlook.com (2603:10a6:3:bd::17)
 by VI1PR08MB4142.eurprd08.prod.outlook.com (2603:10a6:803:e0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.19; Mon, 2 Dec
 2019 11:08:05 +0000
Received: from DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::206) by HE1PR0802CA0007.outlook.office365.com
 (2603:10a6:3:bd::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.17 via Frontend
 Transport; Mon, 2 Dec 2019 11:08:05 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT025.mail.protection.outlook.com (10.152.20.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Mon, 2 Dec 2019 11:08:05 +0000
Received: ("Tessian outbound 92d30e517f5d:v37");
 Mon, 02 Dec 2019 11:08:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 91a759785ff5d9df
X-CR-MTA-TID: 64aa7808
Received: from bf2ae185c3a3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 11DDD53B-265F-49F8-B565-DB949433867F.1; 
 Mon, 02 Dec 2019 11:07:57 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bf2ae185c3a3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 02 Dec 2019 11:07:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTHL0G0eX0WrqbuQ3vz48vKdG145SPo64Y5aYKkQKBgNrtzMqChyDJmWkgsaHMXNkWo937TWG2SzPxYN4PV+T3XD0pEz2yaz/ZI95Zuc6IHjFxlFAuit/eEfcHWlpVegCMS9zmBUzaYKN+QDM8N5GQSfq0Y0XkmEAS24kEOYEHzp6VRT7/9XNO9elEenADfS4o4WDhK5U5/SOIN6GJl/RNnTL+7uhcjDtqE0ivvKqBFBeaiiZQ3vkjvgztzcW10Yh8nPuUCRC1eRD/QGuw1VcvsM6mhL/PxrwvhgG6qPtm913Y/Hb0CX2ZM1ELmb8uDjI6ZWc1mmnst1/kMUXEQFqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x46SGUYbChbNZhOioJboUKiksWbe8CeM3LF8dtiTIHM=;
 b=cKGKM4AWGSZX59wWJYXIyyegWgGMQ8zVCS7evV040NVXJFmymapT8bHrzirP6QDfMsCsQ3NgS2q2zCh4CauEo57y89q4a5LD2JuLA6DK6va/V2Gd865QPPhq0CFhZSVmu5Cu7SNCmGbuglw9Znhqw3lnLlnkfNi7mLQhoWKOpdk62ZTBnwnDdUgzkPDxAlQ7irBAFdmxXlyNWsCtZA18X8P79/YW6rGOumdJNPEzMtAkEQWjrpgiSS7fMQX7ksEKRlQiMtk4os8egMUVN1SKeq9FrSyXR1tln+g/48+/oektqYXKLbMtAUZdpXzFM2FbFDWsuv+gHtF2HfwOyeVbIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3280.eurprd08.prod.outlook.com (52.134.30.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Mon, 2 Dec 2019 11:07:54 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 11:07:54 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH v2 1/2] drm/komeda: Update the chip identify
Thread-Topic: [PATCH v2 1/2] drm/komeda: Update the chip identify
Thread-Index: AQHVoEQrMqZJ0HCZ4UqX8rLOYPxJhaemu7gA
Date: Mon, 2 Dec 2019 11:07:54 +0000
Message-ID: <5936016.qkgZygMIky@e123338-lin>
References: <20191121081717.29518-1-james.qian.wang@arm.com>
 <20191121081717.29518-2-james.qian.wang@arm.com>
In-Reply-To: <20191121081717.29518-2-james.qian.wang@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0122.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::14) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 60797d61-3283-4634-fd6e-08d77717e7b2
X-MS-TrafficTypeDiagnostic: VI1PR08MB3280:|VI1PR08MB3280:|VI1PR08MB4142:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB41427D5F72605AB4D5B57D128F430@VI1PR08MB4142.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4941;OLM:4941;
x-forefront-prvs: 0239D46DB6
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(366004)(346002)(396003)(376002)(136003)(189003)(199004)(6486002)(15650500001)(316002)(54906003)(2906002)(305945005)(8936002)(33716001)(7736002)(25786009)(81166006)(3846002)(26005)(99286004)(8676002)(6116002)(81156014)(66066001)(14444005)(256004)(11346002)(446003)(4326008)(6436002)(6246003)(71200400001)(71190400001)(6636002)(6862004)(186003)(478600001)(229853002)(86362001)(966005)(66446008)(66556008)(66476007)(66946007)(76176011)(52116002)(386003)(6506007)(64756008)(102836004)(5660300002)(6306002)(6512007)(9686003)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3280;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: MaZEKlblcXxKIbSngSZ/FSHkuQTjraWzROO0yO5NuHtCqo0qqaCnHrne8LJ+c/LTl5YV/JwyM90Ks1fc+hffUePwOxLN23/QmuED7OklFd1I8WLL51rP6XXJHbp/PDghAxXiNM9ifed3pb01OUsYnUt3ftneEeCq1bX0XBbXhmEWZKpiri9a3OCCxvQp0/CWeHpNP4cAgBWR3FnFff43FWDkF76Vg4l6WmtvxeabiA7e2uGtZjZIUl+Ms0HQSg6tc3EyJvSrThdvyVrShVu0kKhLIttt5v0RQLantUHbLpFYWow9YVgnCQDoLyx9/DHw3kihrLsg0HFctx6RbT9Sy1NzvmpMdp6HPyxtLzxj5yJdXln5Bxcd0IxDFH5MLrr39DMrqlD8ZXROnsgohKdK8olFirfZO89tw82inj+t3axORt6BFpw5HP92PBey9oYeab32vXbe0KPsKmSkXqXdUkm0NZZl6A3HOd0Qz8iPGzM=
Content-ID: <6D5F7CD1749ACA428CFCB36AE835F99C@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3280
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(346002)(39860400002)(396003)(136003)(376002)(199004)(189003)(4326008)(9686003)(966005)(7736002)(6512007)(54906003)(5660300002)(50466002)(14444005)(316002)(70206006)(22756006)(14454004)(6246003)(478600001)(70586007)(46406003)(26826003)(76130400001)(229853002)(97756001)(6486002)(106002)(15650500001)(6862004)(6306002)(26005)(102836004)(86362001)(47776003)(336012)(446003)(305945005)(23726003)(186003)(386003)(6506007)(6116002)(2906002)(11346002)(81166006)(81156014)(8676002)(8936002)(8746002)(25786009)(356004)(6636002)(99286004)(76176011)(33716001)(3846002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4142;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2ba07f93-b31d-4438-6f9a-08d77717e156
NoDisclaimer: True
X-Forefront-PRVS: 0239D46DB6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ve2pzydcHlgQqfI5L6PpBftDcqcjpafteJPxaSQucN8a0TVFDn93RCUCf0wH5mg4RXhc7SioJNaaWezB3/847H5NRV3Ymqc18dmOD6jPUyxOSuPe22dLVzu6LobWVQ2pNswc6edNYX7fWW3f0gyZmjuJrDII2kghGknOGyh55nmqnlvRmqfp+R2G9Rz3WIQUQA5dtEVhRPlvB0OgJFLTwP75COjlF5yTsMviEa68vUrLUAm/Z9XrgvK7GdMmbiZmCPrWJ3LlEQDNI3a0M+JPowPeG87E0CR4iwPhWCfAQ3WyQGkhZSBOcpmZMMRip8bX25M2qUBCG11bnT7tnDkm2nquwWhNqnMt1QwpIYffXNww2aipwegFYE0WEteIfGljg9duVYHIBb2zmyS9GHOKc12buFRjvsDUBT65qEs2/TmN9tspvMJ2Fdakeirg6e60C9b8p/sds0qg0oll8PoC8Ncc1ZVqylmlEOeIU/Ip3sQ=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2019 11:08:05.0744 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60797d61-3283-4634-fd6e-08d77717e7b2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4142
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x46SGUYbChbNZhOioJboUKiksWbe8CeM3LF8dtiTIHM=;
 b=47kEleDOnZl1xQYHfg8t/7nLaVacARRyJskW3Fc3m84lTAoh5DHHCvqniVTTKP2PcAYHoeZVDelrsL2eqYz0QxuQjGZM3CwHzKuGF9rbhkP0bAMM26LxCpIlI/x3jJV53MttuX3qG5NooUjpB5JabiJ/2UGLeJsx7gdv7Ijt1uU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x46SGUYbChbNZhOioJboUKiksWbe8CeM3LF8dtiTIHM=;
 b=47kEleDOnZl1xQYHfg8t/7nLaVacARRyJskW3Fc3m84lTAoh5DHHCvqniVTTKP2PcAYHoeZVDelrsL2eqYz0QxuQjGZM3CwHzKuGF9rbhkP0bAMM26LxCpIlI/x3jJV53MttuX3qG5NooUjpB5JabiJ/2UGLeJsx7gdv7Ijt1uU=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
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
Cc: "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin
 \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "Thomas Sun \(Arm Technology
 China\)" <thomas.Sun@arm.com>, nd <nd@arm.com>, Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1cnNkYXksIDIxIE5vdmVtYmVyIDIwMTkgMDg6MTc6MzkgR01UIGphbWVzIHFpYW4gd2Fu
ZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+IDEuIERyb3Aga29tZWRhLUNPUkUgcHJv
ZHVjdCBpZCBjb21wYXJpc29uIGFuZCBwdXQgaXQgaW50byB0aGUgZDcxX2lkZW50aWZ5Cj4gMi4g
VXBkYXRlIHBpcGVsaW5lIG5vZGUgRFQtYmluZGluZzoKPiAgICAoYSkuIFNraXAgdGhlIG5lZWRs
ZXNzIHBpcGVsaW5lIERUIG5vZGUuCj4gICAgKGIpLiBSZXR1cm4gZmFpbCBpZiB0aGUgZXNzZW50
aWFsIHBpcGVsaW5lIERUIG5vZGUgaXMgbWlzc2luZy4KPiAKPiBXaXRoIHRoZXNlIGNoYW5nZXMs
IGZvciBvbmUgZmFtaWx5IGNoaXBzIG5vIG5lZWQgdG8gY2hhbmdlIHRoZSBEVC4KPiAKPiB2Mjog
UmViYXNlCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgUWlhbiBXYW5nIChBcm0gVGVjaG5vbG9n
eSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgo+IC0tLQo+ICAuLi4vZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYyAgfCAyNyArKysrKysrLS0KPiAgLi4uL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyAgIHwgNjAgKysrKysrKysrKy0t
LS0tLS0tLQo+ICAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oICAg
fCAxNCArLS0tLQo+ICAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5j
ICAgfCAgOSArLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspLCA1MiBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9kNzEvZDcxX2Rldi5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9k
NzEvZDcxX2Rldi5jCj4gaW5kZXggODIyYjIzYTFjZTc1Li45YjNiZjM1M2I2Y2MgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Rldi5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Rldi5jCj4g
QEAgLTU5NCwxMCArNTk0LDI3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga29tZWRhX2Rldl9mdW5j
cyBkNzFfY2hpcF9mdW5jcyA9IHsKPiAgY29uc3Qgc3RydWN0IGtvbWVkYV9kZXZfZnVuY3MgKgo+
ICBkNzFfaWRlbnRpZnkodTMyIF9faW9tZW0gKnJlZ19iYXNlLCBzdHJ1Y3Qga29tZWRhX2NoaXBf
aW5mbyAqY2hpcCkKPiAgewo+IC0JY2hpcC0+YXJjaF9pZAk9IG1hbGlkcF9yZWFkMzIocmVnX2Jh
c2UsIEdMQl9BUkNIX0lEKTsKPiAtCWNoaXAtPmNvcmVfaWQJPSBtYWxpZHBfcmVhZDMyKHJlZ19i
YXNlLCBHTEJfQ09SRV9JRCk7Cj4gLQljaGlwLT5jb3JlX2luZm8JPSBtYWxpZHBfcmVhZDMyKHJl
Z19iYXNlLCBHTEJfQ09SRV9JTkZPKTsKPiAtCWNoaXAtPmJ1c193aWR0aAk9IEQ3MV9CVVNfV0lE
VEhfMTZfQllURVM7Cj4gKwljb25zdCBzdHJ1Y3Qga29tZWRhX2Rldl9mdW5jcyAqZnVuY3M7Cj4g
Kwl1MzIgcHJvZHVjdF9pZDsKPiAgCj4gLQlyZXR1cm4gJmQ3MV9jaGlwX2Z1bmNzOwo+ICsJY2hp
cC0+Y29yZV9pZCA9IG1hbGlkcF9yZWFkMzIocmVnX2Jhc2UsIEdMQl9DT1JFX0lEKTsKPiArCj4g
Kwlwcm9kdWN0X2lkID0gTUFMSURQX0NPUkVfSURfUFJPRFVDVF9JRChjaGlwLT5jb3JlX2lkKTsK
PiArCj4gKwlzd2l0Y2ggKHByb2R1Y3RfaWQpIHsKPiArCWNhc2UgTUFMSURQX0Q3MV9QUk9EVUNU
X0lEOgo+ICsJCWZ1bmNzID0gJmQ3MV9jaGlwX2Z1bmNzOwo+ICsJCWJyZWFrOwo+ICsJZGVmYXVs
dDoKPiArCQlmdW5jcyA9IE5VTEw7CgpbYmlrZXNoZWRdIEknZCBqdXN0ICdyZXR1cm4gTlVMTDsn
IGFmdGVyIHByaW50aW5nIHRoZSBlcnJvci4uLgoKPiArCQlEUk1fRVJST1IoIlVuc3VwcG9ydGVk
IHByb2R1Y3Q6IDB4JXhcbiIsIHByb2R1Y3RfaWQpOwo+ICsJfQo+ICsKPiArCWlmIChmdW5jcykg
ewoKLi4uIGFuZCBzYXZlIG15c2VsZiB0aGUgYnJhbmNoIGFuZCBpbmRlbnQgbGV2ZWwgaGVyZS4K
Cj4gKwkJY2hpcC0+YXJjaF9pZAk9IG1hbGlkcF9yZWFkMzIocmVnX2Jhc2UsIEdMQl9BUkNIX0lE
KTsKPiArCQljaGlwLT5jb3JlX2luZm8JPSBtYWxpZHBfcmVhZDMyKHJlZ19iYXNlLCBHTEJfQ09S
RV9JTkZPKTsKPiArCQljaGlwLT5idXNfd2lkdGgJPSBENzFfQlVTX1dJRFRIXzE2X0JZVEVTOwo+
ICsJfQo+ICsKPiArCXJldHVybiBmdW5jczsKPiAgfQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jCj4gaW5kZXggNGRkNDY5OWQ0ZTNkLi44ZTBi
Y2U0NjU1NWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfZGV2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9kZXYuYwo+IEBAIC0xMTYsMjIgKzExNiwxNCBAQCBzdGF0aWMgc3RydWN0IGF0dHJp
YnV0ZV9ncm91cCBrb21lZGFfc3lzZnNfYXR0cl9ncm91cCA9IHsKPiAgCS5hdHRycyA9IGtvbWVk
YV9zeXNmc19lbnRyaWVzLAo+ICB9Owo+ICAKPiAtc3RhdGljIGludCBrb21lZGFfcGFyc2VfcGlw
ZV9kdChzdHJ1Y3Qga29tZWRhX2RldiAqbWRldiwgc3RydWN0IGRldmljZV9ub2RlICpucCkKPiAr
c3RhdGljIGludCBrb21lZGFfcGFyc2VfcGlwZV9kdChzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICpw
aXBlKQo+ICB7Cj4gLQlzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICpwaXBlOwo+ICsJc3RydWN0IGRl
dmljZV9ub2RlICpucCA9IHBpcGUtPm9mX25vZGU7Cj4gIAlzdHJ1Y3QgY2xrICpjbGs7Cj4gLQl1
MzIgcGlwZV9pZDsKPiAtCWludCByZXQgPSAwOwo+IC0KPiAtCXJldCA9IG9mX3Byb3BlcnR5X3Jl
YWRfdTMyKG5wLCAicmVnIiwgJnBpcGVfaWQpOwo+IC0JaWYgKHJldCAhPSAwIHx8IHBpcGVfaWQg
Pj0gbWRldi0+bl9waXBlbGluZXMpCj4gLQkJcmV0dXJuIC1FSU5WQUw7Cj4gLQo+IC0JcGlwZSA9
IG1kZXYtPnBpcGVsaW5lc1twaXBlX2lkXTsKPiAgCj4gIAljbGsgPSBvZl9jbGtfZ2V0X2J5X25h
bWUobnAsICJweGNsayIpOwo+ICAJaWYgKElTX0VSUihjbGspKSB7Cj4gLQkJRFJNX0VSUk9SKCJn
ZXQgcHhjbGsgZm9yIHBpcGVsaW5lICVkIGZhaWxlZCFcbiIsIHBpcGVfaWQpOwo+ICsJCURSTV9F
UlJPUigiZ2V0IHB4Y2xrIGZvciBwaXBlbGluZSAlZCBmYWlsZWQhXG4iLCBwaXBlLT5pZCk7Cj4g
IAkJcmV0dXJuIFBUUl9FUlIoY2xrKTsKPiAgCX0KPiAgCXBpcGUtPnB4bGNsayA9IGNsazsKPiBA
QCAtMTQ1LDcgKzEzNyw2IEBAIHN0YXRpYyBpbnQga29tZWRhX3BhcnNlX3BpcGVfZHQoc3RydWN0
IGtvbWVkYV9kZXYgKm1kZXYsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCj4gIAkJb2ZfZ3JhcGhf
Z2V0X3BvcnRfYnlfaWQobnAsIEtPTUVEQV9PRl9QT1JUX09VVFBVVCk7Cj4gIAo+ICAJcGlwZS0+
ZHVhbF9saW5rID0gcGlwZS0+b2Zfb3V0cHV0X2xpbmtzWzBdICYmIHBpcGUtPm9mX291dHB1dF9s
aW5rc1sxXTsKPiAtCXBpcGUtPm9mX25vZGUgPSBvZl9ub2RlX2dldChucCk7Cj4gIAo+ICAJcmV0
dXJuIDA7Cj4gIH0KPiBAQCAtMTU0LDcgKzE0NSw5IEBAIHN0YXRpYyBpbnQga29tZWRhX3BhcnNl
X2R0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCj4gIHsKPiAg
CXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYgPSB0b19wbGF0Zm9ybV9kZXZpY2UoZGV2KTsK
PiAgCXN0cnVjdCBkZXZpY2Vfbm9kZSAqY2hpbGQsICpucCA9IGRldi0+b2Zfbm9kZTsKPiAtCWlu
dCByZXQ7Cj4gKwlzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICpwaXBlOwo+ICsJdTMyIHBpcGVfaWQg
PSBVMzJfTUFYOwo+ICsJaW50IHJldCA9IC0xOwo+ICAKPiAgCW1kZXYtPmlycSAgPSBwbGF0Zm9y
bV9nZXRfaXJxKHBkZXYsIDApOwo+ICAJaWYgKG1kZXYtPmlycSA8IDApIHsKPiBAQCAtMTY5LDMx
ICsxNjIsNDQgQEAgc3RhdGljIGludCBrb21lZGFfcGFyc2VfZHQoc3RydWN0IGRldmljZSAqZGV2
LCBzdHJ1Y3Qga29tZWRhX2RldiAqbWRldikKPiAgCXJldCA9IDA7Cj4gIAo+ICAJZm9yX2VhY2hf
YXZhaWxhYmxlX2NoaWxkX29mX25vZGUobnAsIGNoaWxkKSB7Cj4gLQkJaWYgKG9mX25vZGVfY21w
KGNoaWxkLT5uYW1lLCAicGlwZWxpbmUiKSA9PSAwKSB7Cj4gLQkJCXJldCA9IGtvbWVkYV9wYXJz
ZV9waXBlX2R0KG1kZXYsIGNoaWxkKTsKPiAtCQkJaWYgKHJldCkgewo+IC0JCQkJRFJNX0VSUk9S
KCJwYXJzZSBwaXBlbGluZSBkdCBlcnJvciFcbiIpOwo+IC0JCQkJb2Zfbm9kZV9wdXQoY2hpbGQp
Owo+IC0JCQkJYnJlYWs7Cj4gKwkJaWYgKG9mX25vZGVfbmFtZV9lcShjaGlsZCwgInBpcGVsaW5l
IikpIHsKPiArCQkJb2ZfcHJvcGVydHlfcmVhZF91MzIoY2hpbGQsICJyZWciLCAmcGlwZV9pZCk7
Cj4gKwkJCWlmIChwaXBlX2lkID49IG1kZXYtPm5fcGlwZWxpbmVzKSB7Cj4gKwkJCQlEUk1fV0FS
TigiU2tpcCB0aGUgcmVkdW5kYW50IERUIG5vZGU6IHBpcGVsaW5lLSV1LlxuIiwKPiArCQkJCQkg
cGlwZV9pZCk7Cj4gKwkJCQljb250aW51ZTsKPiAgCQkJfQo+ICsJCQltZGV2LT5waXBlbGluZXNb
cGlwZV9pZF0tPm9mX25vZGUgPSBvZl9ub2RlX2dldChjaGlsZCk7Cj4gIAkJfQo+ICAJfQo+ICAK
PiArCWZvciAocGlwZV9pZCA9IDA7IHBpcGVfaWQgPCBtZGV2LT5uX3BpcGVsaW5lczsgcGlwZV9p
ZCsrKSB7Cj4gKwkJcGlwZSA9IG1kZXYtPnBpcGVsaW5lc1twaXBlX2lkXTsKPiArCj4gKwkJaWYg
KCFwaXBlLT5vZl9ub2RlKSB7Cj4gKwkJCURSTV9FUlJPUigiT21pdCBEVCBub2RlIGZvciBwaXBl
bGluZS0lZC5cbiIsIHBpcGUtPmlkKTsKCltuaXRdICJPbWl0IERUIG5vZGUiIGRvZXNuJ3Qgc291
bmQgbGlrZSBhbiBlcnJvciBjb25kaXRpb24uIEhvdyBhYm91dDoKCiJwaXBlbGluZS0lZCBkb2Vz
bid0IGhhdmUgYSBEVCBub2RlLiIKCj4gKwkJCXJldHVybiAtRUlOVkFMOwo+ICsJCX0KPiArCQly
ZXQgPSBrb21lZGFfcGFyc2VfcGlwZV9kdChwaXBlKTsKPiArCQlpZiAocmV0KQo+ICsJCQlyZXR1
cm4gcmV0Owo+ICsJfQo+ICsKPiAgCW1kZXYtPnNpZGVfYnlfc2lkZSA9ICFvZl9wcm9wZXJ0eV9y
ZWFkX3UzMihucCwgInNpZGVfYnlfc2lkZV9tYXN0ZXIiLAoKTG9va3MgbGlrZSB0aGlzIGlzbid0
IGJhc2VkIG9mZiBkcm0tbWlzYy1uZXh0LCBhbmQgaXMgaW5zdGVhZCBiYXNlZCBvbgpodHRwczov
L3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzQxODY3LwoKPiAgCQkJCQkJICAgJm1k
ZXYtPnNpZGVfYnlfc2lkZV9tYXN0ZXIpOwo+ICAKPiAtCXJldHVybiByZXQ7Cj4gKwlyZXR1cm4g
MDsKPiAgfQo+ICAKPiAgc3RydWN0IGtvbWVkYV9kZXYgKmtvbWVkYV9kZXZfY3JlYXRlKHN0cnVj
dCBkZXZpY2UgKmRldikKPiAgewo+ICAJc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiA9IHRv
X3BsYXRmb3JtX2RldmljZShkZXYpOwo+IC0JY29uc3Qgc3RydWN0IGtvbWVkYV9wcm9kdWN0X2Rh
dGEgKnByb2R1Y3Q7Cj4gKwlrb21lZGFfaWRlbnRpZnlfZnVuYyBrb21lZGFfaWRlbnRpZnk7Cj4g
IAlzdHJ1Y3Qga29tZWRhX2RldiAqbWRldjsKPiAgCWludCBlcnIgPSAwOwo+ICAKPiAtCXByb2R1
Y3QgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsKPiAtCWlmICghcHJvZHVjdCkKPiAr
CWtvbWVkYV9pZGVudGlmeSA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YShkZXYpOwo+ICsJaWYg
KCFrb21lZGFfaWRlbnRpZnkpCj4gIAkJcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7Cj4gIAo+ICAJ
bWRldiA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqbWRldiksIEdGUF9LRVJORUwpOwo+IEBA
IC0yMjEsMTEgKzIyNyw5IEBAIHN0cnVjdCBrb21lZGFfZGV2ICprb21lZGFfZGV2X2NyZWF0ZShz
dHJ1Y3QgZGV2aWNlICpkZXYpCj4gIAo+ICAJY2xrX3ByZXBhcmVfZW5hYmxlKG1kZXYtPmFjbGsp
Owo+ICAKPiAtCW1kZXYtPmZ1bmNzID0gcHJvZHVjdC0+aWRlbnRpZnkobWRldi0+cmVnX2Jhc2Us
ICZtZGV2LT5jaGlwKTsKPiAtCWlmICgha29tZWRhX3Byb2R1Y3RfbWF0Y2gobWRldiwgcHJvZHVj
dC0+cHJvZHVjdF9pZCkpIHsKPiAtCQlEUk1fRVJST1IoIkRUIGNvbmZpZ3VyZWQgJXggbWlzbWF0
Y2ggd2l0aCByZWFsIEhXICV4LlxuIiwKPiAtCQkJICBwcm9kdWN0LT5wcm9kdWN0X2lkLAo+IC0J
CQkgIE1BTElEUF9DT1JFX0lEX1BST0RVQ1RfSUQobWRldi0+Y2hpcC5jb3JlX2lkKSk7Cj4gKwlt
ZGV2LT5mdW5jcyA9IGtvbWVkYV9pZGVudGlmeShtZGV2LT5yZWdfYmFzZSwgJm1kZXYtPmNoaXAp
Owo+ICsJaWYgKCFtZGV2LT5mdW5jcykgewo+ICsJCURSTV9FUlJPUigiRmFpbGVkIHRvIGlkZW50
aWZ5IHRoZSBIVy5cbiIpOwo+ICAJCWVyciA9IC1FTk9ERVY7Cj4gIAkJZ290byBkaXNhYmxlX2Ns
azsKPiAgCX0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfZGV2LmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9kZXYuaAo+IGluZGV4IDQ3MTYwNGI0MjQzMS4uZGFjZGIwMDE1M2U5IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmgKPiBAQCAtNTgs
MTEgKzU4LDYgQEAKPiAgCQkJICAgIHwgS09NRURBX0VWRU5UX01PREUgXAo+ICAJCQkgICAgKQo+
ICAKPiAtLyogbWFsaWRwIGRldmljZSBpZCAqLwo+IC1lbnVtIHsKPiAtCU1BTElfRDcxID0gMCwK
PiAtfTsKPiAtCj4gIC8qIHBpcGVsaW5lIERUIHBvcnRzICovCj4gIGVudW0gewo+ICAJS09NRURB
X09GX1BPUlRfT1VUUFVUCQk9IDAsCj4gQEAgLTc2LDEyICs3MSw2IEBAIHN0cnVjdCBrb21lZGFf
Y2hpcF9pbmZvIHsKPiAgCXUzMiBidXNfd2lkdGg7Cj4gIH07Cj4gIAo+IC1zdHJ1Y3Qga29tZWRh
X3Byb2R1Y3RfZGF0YSB7Cj4gLQl1MzIgcHJvZHVjdF9pZDsKPiAtCWNvbnN0IHN0cnVjdCBrb21l
ZGFfZGV2X2Z1bmNzICooKmlkZW50aWZ5KSh1MzIgX19pb21lbSAqcmVnLAo+IC0JCQkJCSAgICAg
c3RydWN0IGtvbWVkYV9jaGlwX2luZm8gKmluZm8pOwo+IC19Owo+IC0KPiAgc3RydWN0IGtvbWVk
YV9kZXY7Cj4gIAo+ICBzdHJ1Y3Qga29tZWRhX2V2ZW50cyB7Cj4gQEAgLTI0Myw2ICsyMzIsOSBA
QCBrb21lZGFfcHJvZHVjdF9tYXRjaChzdHJ1Y3Qga29tZWRhX2RldiAqbWRldiwgdTMyIHRhcmdl
dCkKPiAgCXJldHVybiBNQUxJRFBfQ09SRV9JRF9QUk9EVUNUX0lEKG1kZXYtPmNoaXAuY29yZV9p
ZCkgPT0gdGFyZ2V0Owo+ICB9Cj4gIAo+ICt0eXBlZGVmIGNvbnN0IHN0cnVjdCBrb21lZGFfZGV2
X2Z1bmNzICoKPiArKCprb21lZGFfaWRlbnRpZnlfZnVuYykodTMyIF9faW9tZW0gKnJlZywgc3Ry
dWN0IGtvbWVkYV9jaGlwX2luZm8gKmNoaXApOwo+ICsKPiAgY29uc3Qgc3RydWN0IGtvbWVkYV9k
ZXZfZnVuY3MgKgo+ICBkNzFfaWRlbnRpZnkodTMyIF9faW9tZW0gKnJlZywgc3RydWN0IGtvbWVk
YV9jaGlwX2luZm8gKmNoaXApOwo+ICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9kcnYuYwo+IGluZGV4IGQ2YzIyMjJjNWQzMy4uYjdhMTA5N2M0NWM0
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
ZHJ2LmMKPiBAQCAtMTIzLDE1ICsxMjMsOCBAQCBzdGF0aWMgaW50IGtvbWVkYV9wbGF0Zm9ybV9y
ZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCXJldHVybiAwOwo+ICB9Cj4g
IAo+IC1zdGF0aWMgY29uc3Qgc3RydWN0IGtvbWVkYV9wcm9kdWN0X2RhdGEga29tZWRhX3Byb2R1
Y3RzW10gPSB7Cj4gLQlbTUFMSV9ENzFdID0gewo+IC0JCS5wcm9kdWN0X2lkID0gTUFMSURQX0Q3
MV9QUk9EVUNUX0lELAo+IC0JCS5pZGVudGlmeSA9IGQ3MV9pZGVudGlmeSwKPiAtCX0sCj4gLX07
Cj4gLQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBrb21lZGFfb2ZfbWF0Y2hb
XSA9IHsKPiAtCXsgLmNvbXBhdGlibGUgPSAiYXJtLG1hbGktZDcxIiwgLmRhdGEgPSAma29tZWRh
X3Byb2R1Y3RzW01BTElfRDcxXSwgfSwKPiArCXsgLmNvbXBhdGlibGUgPSAiYXJtLG1hbGktZDcx
IiwgLmRhdGEgPSBkNzFfaWRlbnRpZnksIH0sCj4gIAl7fSwKPiAgfTsKPiAgCj4gCgpXaXRoIHRo
ZSBhYm92ZSB0d28gZml4ZWQgKGkuZS4gZmVlbCBmcmVlIHRvIGlnbm9yZSB0aGUgYmlrZXNoZWQp
LApSZXZpZXdlZC1ieTogTWloYWlsIEF0YW5hc3NvdiA8bWloYWlsLmF0YW5hc3NvdkBhcm0uY29t
PgoKLS0gCk1paGFpbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
