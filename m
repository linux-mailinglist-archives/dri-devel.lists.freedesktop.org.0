Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E5CC31FA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 13:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074806E610;
	Tue,  1 Oct 2019 11:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50074.outbound.protection.outlook.com [40.107.5.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24436E610
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 11:06:40 +0000 (UTC)
Received: from DB7PR08CA0062.eurprd08.prod.outlook.com (2603:10a6:10:26::39)
 by VI1PR08MB3390.eurprd08.prod.outlook.com (2603:10a6:803:7b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Tue, 1 Oct
 2019 11:06:37 +0000
Received: from AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::208) by DB7PR08CA0062.outlook.office365.com
 (2603:10a6:10:26::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.17 via Frontend
 Transport; Tue, 1 Oct 2019 11:06:37 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT040.mail.protection.outlook.com (10.152.17.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 1 Oct 2019 11:06:35 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Tue, 01 Oct 2019 11:06:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 79718c682a6069bf
X-CR-MTA-TID: 64aa7808
Received: from 523e2a29ea3a.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.2.54]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9A716C71-C38C-402E-8493-B1C51E1EFC45.1; 
 Tue, 01 Oct 2019 11:06:27 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 523e2a29ea3a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 01 Oct 2019 11:06:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VoX7g6S2lY2ZHueVmL3RU6tf4g7Afhz8/9iEpXeTAlm16zySGlgjD3GqoCVqS8Hcg+bu8wPleyYi9xoeMLHy0kN787Nu3IdHjY6UNABhrGwKK/2MPNHTv0ouBuDv+qgPLuaeedpV0AB0SYWKTxskDJd70ygO0TWrz7yFyl4c/NImaexbXLSJLm6m7OJXdIDSzbFrucVE0mkANuFmBiAKYwi64lJPpJcjTxcCDIXwWYJHcCvJhfNzc//AV0kcXxcMsszZGHz4maitbhRgmiEygPpFrzMyqAA5aYUfCEuNzbCyaTCY2dk9xFv56bIJlYE03oYkHhKZAcZM9/z06Gaq+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPbdsl91p57gKwQNkVs94dzoFvXrmXL0I73f3wh5vOU=;
 b=KqlnUAQBlmkY603D2+iv4PZQc/gyM3VH85JizWvn9WQ7E+WO+k3imdKRaNwQbWfELbOPExam171IV6g7JcfcAmiwwvT7r2L/6qPtZVOwXaf+wLpr/VoHqlQIhJ+yZGRpkYxMNCiuC3luvvypt/gVV4LdKWCICOKJuI+vHoF5HdUKxP9iIZMJlJrBJ7f2/qImjSFe6ip+HU8kJAFZeFGGRaEW2sy04g/xMzLzKP/B0tvP1nlvoXKSwisNGXXRSoapPuZevLfOKplM9QeyQXgbXz1XkwnRQVSPTAhrpStdwUEDMEUWlUtpHqb/A1YGYeBLg9OC5LaQ9Am2n7OqzOe2kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM7PR08MB5352.eurprd08.prod.outlook.com (10.141.172.139) by
 AM7PR08MB5509.eurprd08.prod.outlook.com (10.141.175.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Tue, 1 Oct 2019 11:06:26 +0000
Received: from AM7PR08MB5352.eurprd08.prod.outlook.com
 ([fe80::1c78:bb51:3634:9cf0]) by AM7PR08MB5352.eurprd08.prod.outlook.com
 ([fe80::1c78:bb51:3634:9cf0%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 11:06:25 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH] drm/komeda: Use IRQ_RETVAL shorthand in d71_irq_handler
Thread-Topic: [PATCH] drm/komeda: Use IRQ_RETVAL shorthand in d71_irq_handler
Thread-Index: AQHVb8XpefZcvGvZNkuWrwlyThjxiKc4kUoAgA0fsoA=
Date: Tue, 1 Oct 2019 11:06:25 +0000
Message-ID: <20191001110624.GA5422@arm.com>
References: <20190920151247.25128-1-mihail.atanassov@arm.com>
 <20190923024136.GB24909@jamwan02-TSP300>
In-Reply-To: <20190923024136.GB24909@jamwan02-TSP300>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0105.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::21) To AM7PR08MB5352.eurprd08.prod.outlook.com
 (2603:10a6:20b:106::11)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.50]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: fd3a73a1-59d6-410b-6770-08d7465f6cac
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM7PR08MB5509:|AM7PR08MB5509:|VI1PR08MB3390:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB339089611D33155C93CF68B1E49D0@VI1PR08MB3390.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5797;
x-forefront-prvs: 0177904E6B
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(189003)(199004)(64756008)(305945005)(6116002)(2906002)(81156014)(8936002)(229853002)(3846002)(66946007)(476003)(66476007)(66556008)(36756003)(81166006)(8676002)(76176011)(11346002)(25786009)(66066001)(5660300002)(99286004)(2616005)(6512007)(446003)(486006)(478600001)(966005)(66446008)(6306002)(256004)(14444005)(102836004)(6862004)(6246003)(52116002)(6636002)(71190400001)(4326008)(316002)(386003)(186003)(71200400001)(14454004)(37006003)(54906003)(1076003)(6486002)(86362001)(26005)(6436002)(7736002)(33656002)(6506007)(44832011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM7PR08MB5509;
 H:AM7PR08MB5352.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: CRW5dQhSX44aSYN/21hZsJ4G08SWJ93cGjg/Xih7YuUzGcFvy8XmNtGtN9U66Pyj/ieMP2YFMT9TYI6+MA3FNiX6njq0QhnrI/7wXFRk2okw2Bya6NGslcx760zBsESQv91uFr+h3VNGhigoEKygAeJ1p3Jj77ccy+2arYLuizMgk9KG3JHlRe290pvG1FpwUwPME2XfG2YE3BeP9l9sjJ1Qft2TgnybRV9q6yQrCrybZwOgHjdaCNdOzP7vdf4QcRStw5ATY9G9w5SIL81P5oyJamwSbWLXbYILGV9KXR7US1IFgLiwYWAaSXFZ8TZm/pQ0wgaMqNLcbV/VeqqYqjHXGQyL3T9rKU/mMeB5F8ZqQJFJt1TvQasmnCjVkna2e+9kK0n+dMO4LDhFyFgbl8SJM+nSHW20xfZq0fGWgisnf9MWpbW6auqBfBppQaFUCfzqvtDGiKq62/oQbfai5g==
Content-ID: <3C705ACD005EF445A19252DD78E49E98@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5509
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(136003)(199004)(189003)(33656002)(229853002)(6306002)(36906005)(86362001)(186003)(6246003)(70586007)(70206006)(23726003)(336012)(47776003)(25786009)(81166006)(6116002)(26005)(316002)(46406003)(37006003)(4326008)(6512007)(54906003)(6506007)(356004)(50466002)(76176011)(386003)(6862004)(2616005)(22756006)(11346002)(99286004)(8936002)(8746002)(478600001)(81156014)(76130400001)(476003)(1076003)(66066001)(63350400001)(446003)(486006)(2906002)(14454004)(26826003)(3846002)(966005)(126002)(6636002)(7736002)(36756003)(6486002)(305945005)(8676002)(102836004)(5660300002)(97756001)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3390;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 662f1e4d-1361-4c4e-45f4-08d7465f66b6
NoDisclaimer: True
X-Forefront-PRVS: 0177904E6B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QdnkN+0KtARHGVdyUdmXTx6b7JoNWZRMBVdkHIx843h5HhSp1ew/4gt+yHaAjab5FcCk+HCjJREopnUgUu83ODpO5q3NL9cdG7MEoCD48BtJWI92BkM8MvPL6mhH+8oXandT4r6ClJaguuyHJhSJsrAHqa6+jMhqVlQ6PfQgduekOyKPJZ2iZtKN6zzuiAHxnUpxHI498izTPx4t4VacIU5NnsO7dcHM2gEHR1DCbknZFTmT5JinJccqVUpIGUF151V9QJeDbGA4BHS9E0ilJ9aLoQhxP5uC1YwZUOmhJDGNvmZoo5KTL84tLVUihtGLIT+uOomTRMfEnup8+6Je6TEChoZWFsNQQdgVdkHuuSysF4501qF7aI7yN1we+U4LH011HilVNxUJgCqOZZVi8Hm2Gt0YEbwvpp5yaoBMUO8I7UC8GTHQes65AClYAo4WZ8AKPJlQ7dXfmAG6IWXy0Q==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2019 11:06:35.4659 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3a73a1-59d6-410b-6770-08d7465f6cac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3390
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPbdsl91p57gKwQNkVs94dzoFvXrmXL0I73f3wh5vOU=;
 b=B3cyGJ0qUjhjK76e2OiD9F43bSvNHFiwfgXCZtKHgqlun6yr23NgOUiIf29M1OF2lV+47Gq/UL3mc6LCjCJwSGvS899JcDYJIyRbE9b4wVhpvitB6tUriYAZV63FcVAdAWYgPuzmjkaJ5uIzXEwqqE77j8YvLd3l7rFgbwkmThU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPbdsl91p57gKwQNkVs94dzoFvXrmXL0I73f3wh5vOU=;
 b=B3cyGJ0qUjhjK76e2OiD9F43bSvNHFiwfgXCZtKHgqlun6yr23NgOUiIf29M1OF2lV+47Gq/UL3mc6LCjCJwSGvS899JcDYJIyRbE9b4wVhpvitB6tUriYAZV63FcVAdAWYgPuzmjkaJ5uIzXEwqqE77j8YvLd3l7rFgbwkmThU=
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
Cc: nd <nd@arm.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDI6NDE6NDRBTSArMDAwMCwgamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gT24gRnJpLCBTZXAgMjAsIDIwMTkgYXQg
MDM6MTM6MDhQTSArMDAwMCwgTWloYWlsIEF0YW5hc3NvdiB3cm90ZToKPiA+IE5vIGNoYW5nZSBp
biBiZWhhdmlvdXI7IElSUV9SRVRWQUwgaXMgYWJvdXQgdHdpY2UgYXMgcG9wdWxhciBhcwo+ID4g
bWFudWFsbHkgd3JpdGluZyBvdXQgdGhlIHRlcm5hcnkuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6
IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KPiA+IC0tLQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYyB8IDIgKy0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3
MV9kZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYu
Ywo+ID4gaW5kZXggZDU2N2FiN2VkMzE0Li4xYjQyMDk1OTY5ZTcgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfZGV2LmMKPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYwo+ID4gQEAg
LTE5NSw3ICsxOTUsNyBAQCBkNzFfaXJxX2hhbmRsZXIoc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYs
IHN0cnVjdCBrb21lZGFfZXZlbnRzICpldnRzKQo+ID4gIAlpZiAoZ2N1X3N0YXR1cyAmIEdMQl9J
UlFfU1RBVFVTX1BJUEUxKQo+ID4gIAkJZXZ0cy0+cGlwZXNbMV0gfD0gZ2V0X3BpcGVsaW5lX2V2
ZW50KGQ3MS0+cGlwZXNbMV0sIGdjdV9zdGF0dXMpOwo+ID4gIAo+ID4gLQlyZXR1cm4gZ2N1X3N0
YXR1cyA/IElSUV9IQU5ETEVEIDogSVJRX05PTkU7Cj4gPiArCXJldHVybiBJUlFfUkVUVkFMKGdj
dV9zdGF0dXMpOwo+IAo+IEhpIE1paGFpbDoKPiAKPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4K
PiAKPiBSZXZpZXdlZC1ieTogSmFtZXMgUWlhbiBXYW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkg
PGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgoKUHVzaGVkIHRvIGRybS1taXNjLW5leHQgLSA0YjM5
NTgyYThmYjNjNzQ5ZjBmYTk2ZWM5MjBkMTM4ZjYxYmYwMGQ2Cj4gCj4gPiAgfQo+ID4gIAo+ID4g
ICNkZWZpbmUgRU5BQkxFRF9HQ1VfSVJRUwkoR0NVX0lSUV9DVkFMMCB8IEdDVV9JUlFfQ1ZBTDEg
fCBcCj4gPiAtLSAKPiA+IDIuMjMuMAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
