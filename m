Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 018FC10A197
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 16:55:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6096E425;
	Tue, 26 Nov 2019 15:55:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150049.outbound.protection.outlook.com [40.107.15.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276E96E425
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 15:55:18 +0000 (UTC)
Received: from AM6PR08CA0015.eurprd08.prod.outlook.com (2603:10a6:20b:b2::27)
 by VI1PR0801MB1663.eurprd08.prod.outlook.com (2603:10a6:800:4f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.21; Tue, 26 Nov
 2019 15:55:14 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::206) by AM6PR08CA0015.outlook.office365.com
 (2603:10a6:20b:b2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.19 via Frontend
 Transport; Tue, 26 Nov 2019 15:55:14 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 15:55:14 +0000
Received: ("Tessian outbound 712c40e503a7:v33");
 Tue, 26 Nov 2019 15:55:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bbab109c25cdd2e1
X-CR-MTA-TID: 64aa7808
Received: from cbdcfc79fc0a.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.57]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DBFDCEC5-ECC3-4359-A5F1-B0B0204F0192.1; 
 Tue, 26 Nov 2019 15:55:08 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2057.outbound.protection.outlook.com [104.47.10.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cbdcfc79fc0a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 15:55:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hijr9BiQBd30cS5BmYKrz8lT4fTfLjU8gXKOPNNyF3pXLx7Ju1q/NCRoNHsA3W2Ml7b4UjajZILjs5FJol6GoDJecaeFYSfMSfNAbbqwre6NY3UJjNKa05jz/7gR/FwrfSBKYz+Wd1Ubhx7Zm+8RKmLaDUv3AQdoaQjvVJgm3o+lsX5sFu6i85RJNA9S4h4vBVMZGFFp3tyvRQl16ounpAUkfPST9QDnuoAvoNbTyUXDpY/TGznlTUckL9l2T4XzNDhZzfeyXdeYr2iZpV5GDNAFuMYILVLQ7KNuccoZXm6vxZY+7atUHWxtCaUPWIqc/+7JVaxDk9SWUVe2YtsW8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBb9avuoa4Kg0rTlZNVeuyqM8pKEjrFj5UnjOtQhfzc=;
 b=iQ+QuCj9Tupw86fwTz3yLjtb81t/Jn7yVms4djPda+z0ssKEg5dFOQvJV3f8THUXHsO+Xfg3SuMDN60SHV55qVw3orgZ/oLjfwYj74lrCgL4hYpwDnu7fXRfroqkJTJ9G1bZvO6B0N713GB+pcAv2W3icaLo+9wxM/N2vjeiT2LcdHy2XCoBJForVu/uQke3gvul7LDzGSgI++AVeR5K8SfRg2y0Qfn3bVr5QtAbnBGkhMQsTYJ+d7kHP88oeMPy52n7W8UtnQP0gY2qf6X2eYT+zdWhaHL0RxouE09KPknwfHMs2SBkRkTA1ROwC15PIOcv+IpYA1oOVrgNF8FVRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2910.eurprd08.prod.outlook.com (10.175.245.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 15:55:06 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 15:55:06 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 29/30] drm/bridge: add support for device links to bridge
Thread-Topic: [PATCH 29/30] drm/bridge: add support for device links to bridge
Thread-Index: AQHVpFu1iHJCIvZyo0WUUQNtpUlix6edhM4AgAAWJ4A=
Date: Tue, 26 Nov 2019 15:55:06 +0000
Message-ID: <1817506.VEjLu2jiqi@e123338-lin>
References: <20191126131541.47393-1-mihail.atanassov@arm.com>
 <20191126131541.47393-30-mihail.atanassov@arm.com>
 <20191126143534.GW29965@phenom.ffwll.local>
In-Reply-To: <20191126143534.GW29965@phenom.ffwll.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LNXP123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::17) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a10a09bf-f6e7-409a-bf77-08d772890678
X-MS-TrafficTypeDiagnostic: VI1PR08MB2910:|VI1PR0801MB1663:
X-Microsoft-Antispam-PRVS: <VI1PR0801MB16632D622000CB483F6C06918F450@VI1PR0801MB1663.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(189003)(199004)(52314003)(6246003)(86362001)(81156014)(81166006)(66946007)(8936002)(110136005)(66476007)(5660300002)(2906002)(5024004)(316002)(6116002)(3846002)(14444005)(66066001)(386003)(66446008)(6436002)(14454004)(446003)(6486002)(99286004)(11346002)(229853002)(71190400001)(26005)(8676002)(64756008)(256004)(25786009)(478600001)(71200400001)(54906003)(66556008)(6506007)(33716001)(4326008)(76176011)(186003)(6512007)(305945005)(7736002)(102836004)(52116002)(9686003)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2910;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: PA4itfa/2Si2NMx2+lcHXMnRKCfXPY7K8OjtG4OUqjt+8UBV+y5uP0RmREI1gTJCJSsS4v9w+T2FaSMtfKQx/ufUloa/HrPopi/YJJmp3Jar1XgPD6v8eaAV3aXBo4maJl2rXMFfBURVp+4s7BwQyssVx7MBZSWAq9VWkTUxFSrI7r/BuNmBCW6aKlDcreu51/mJXaPPayZiwXjNTv5bpH4xLtpSS8ZGYg0PUJBdRXhgbUGLhJFOPtzkmuskw+y/wNLgFAKhA4rUjxUqibpKzB/E85S9R3q9RT6Pot3TO0NiL9GdgIl0wKJ6pZmlUEYqVAtIumrnP9Zn9dEJjgmUr/3ULZ1eqS0yh2X0l2ZEf0BSmN9K4kfY1z3ExtoNfs5TGLrXBLJcnJpD9JeRfVtTkyEBiaWpKUUw2BWShCOADzbSHAAruWJZI3jMtZHhtoi5
x-ms-exchange-transport-forked: True
Content-ID: <052B63C321E52E458F3A46BE0A2BFCB4@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2910
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(136003)(376002)(39860400002)(396003)(189003)(199004)(52314003)(478600001)(76130400001)(33716001)(76176011)(50466002)(11346002)(26005)(99286004)(336012)(97756001)(229853002)(110136005)(22756006)(356004)(46406003)(102836004)(6246003)(70206006)(9686003)(107886003)(6506007)(386003)(66066001)(5660300002)(4326008)(47776003)(6512007)(6486002)(14444005)(36906005)(14454004)(7736002)(5024004)(106002)(70586007)(25786009)(26826003)(316002)(86362001)(305945005)(23726003)(6116002)(81156014)(8676002)(2906002)(3846002)(8746002)(8936002)(81166006)(186003)(54906003)(446003)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0801MB1663;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1c34ce03-23a8-4523-8e91-08d7728901ec
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vFCsi0HKhq7HcYnZDgtAO4lCFOyLV1zp0MSrkYcl0YyGW8V8ZFzMCuQHVYiWCOrav0qMdRJYsjKRiKlTLo+cXZ1B4YCYCsWTfCjAbugxvr+yLYOhptBlSRWpGbenlUfg1dAHMiYImniAtDCCXUw94bOEpMeYWlbH5Xm6jEWVloV1+0jA8DchM10l2vkwoX+AuNBlyc/YP3yqWuK+wgRpru4G/l7n+XYs60zDPS0tbbOMz0wlHfHPmJMjtWQljLYSSQL/dK2OOC4FGew++7f7U7jJmnyvkau0Hox1LBIZ05pmo8hGuPNJBBz3BfAL+D72jKQv6RRrbAo/q2T5Mwvr9r3PYkNKmz/7B2oS3g/fdAqwYnhXPpA6HzMTwhCQudHeVXTNbMoMt59AJYs9hHLwBGL9MFfp/f9nHs6+jo4m+C55Z9aJr1vsZN3Yui0DJl59
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 15:55:14.0286 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a10a09bf-f6e7-409a-bf77-08d772890678
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1663
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBb9avuoa4Kg0rTlZNVeuyqM8pKEjrFj5UnjOtQhfzc=;
 b=oScgG/IuHe8Z3PTA0ro1EdqWnae6QdorxgVSrIae5jaLdSt4fHPrz7oZ22xrcMjQBSt9XUWtiNuZhtvKdldFi9uWvN6zXH4VdFcHUenMcT/wyzGflZxm6ujCUcJWOkj1iA7K4M/eaFnfpXpGssartnklQqQgU4J3JOp9brHPNyk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBb9avuoa4Kg0rTlZNVeuyqM8pKEjrFj5UnjOtQhfzc=;
 b=oScgG/IuHe8Z3PTA0ro1EdqWnae6QdorxgVSrIae5jaLdSt4fHPrz7oZ22xrcMjQBSt9XUWtiNuZhtvKdldFi9uWvN6zXH4VdFcHUenMcT/wyzGflZxm6ujCUcJWOkj1iA7K4M/eaFnfpXpGssartnklQqQgU4J3JOp9brHPNyk=
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlc2RheSwgMjYgTm92ZW1iZXIgMjAxOSAxNDozNTozNCBHTVQgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIE5vdiAyNiwgMjAxOSBhdCAwMToxNjoyNlBNICswMDAwLCBNaWhhaWwg
QXRhbmFzc292IHdyb3RlOgo+ID4gRnJvbTogUnVzc2VsbCBLaW5nIDxybWsra2VybmVsQGFybWxp
bnV4Lm9yZy51az4KPiA+IAo+ID4gQnJpZGdlIGRldmljZXMgaGF2ZSBiZWVuIGEgcG90ZW50aWFs
IGZvciBrZXJuZWwgb29wcyBhcyB0aGVpciBsaWZldGltZQo+ID4gaXMgaW5kZXBlbmRlbnQgb2Yg
dGhlIERSTSBkZXZpY2UgdGhhdCB0aGV5IGFyZSBib3VuZCB0by4gIEhlbmNlLCBpZiBhCj4gPiBi
cmlkZ2UgZGV2aWNlIGlzIHVuYm91bmQgd2hpbGUgdGhlIHBhcmVudCBEUk0gZGV2aWNlIGlzIHVz
aW5nIHRoZW0sIHRoZQo+ID4gcGFyZW50IGhhcHBpbHkgY29udGludWVzIHRvIHVzZSB0aGUgYnJp
ZGdlIGRldmljZSwgY2FsbGluZyB0aGUgZHJpdmVyCj4gPiBhbmQgYWNjZXNzaW5nIGl0cyBvYmpl
Y3RzIHRoYXQgaGF2ZSBiZWVuIGZyZWVkLgo+ID4gCj4gPiBUaGlzIGNhbiBjYXVzZSBrZXJuZWwg
bWVtb3J5IGNvcnJ1cHRpb24gYW5kIGtlcm5lbCBvb3BzLgo+ID4gCj4gPiBUbyBjb250cm9sIHRo
aXMsIHVzZSBkZXZpY2UgbGlua3MgdG8gZW5zdXJlIHRoYXQgdGhlIHBhcmVudCBEUk0gZGV2aWNl
Cj4gPiBpcyB1bmJvdW5kIHdoZW4gdGhlIGJyaWRnZSBkZXZpY2UgaXMgdW5ib3VuZCwgYW5kIHdo
ZW4gdGhlIGJyaWRnZQo+ID4gZGV2aWNlIGlzIHJlLWJvdW5kLCBhdXRvbWF0aWNhbGx5IHJlYmlu
ZCB0aGUgcGFyZW50IERSTSBkZXZpY2UuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwg
S2luZyA8cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+Cj4gPiBUZXN0ZWQtYnk6IE1paGFpbCBB
dGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KPiA+IFtyZXdvcmtlZCB0byB1c2Ug
ZHJtX2JyaWRnZV9pbml0KCkgZm9yIHNldHRpbmcgYnJpZGdlLT5kZXZpY2VdCj4gPiBTaWduZWQt
b2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+Cj4gCj4g
U28gSSB0aG91Z2h0IHRoZSBiaWcgcGxhbiB3YXMgdG8gcHV0IHRoZSBkZXZpY2VfbGluayBzZXR1
cCBpbnRvCj4gZHJtX2JyaWRnZV9hdHRhY2gsIHNvIHRoYXQgaXQncyBkb25lIGZvciBldmVyeW9u
ZS4gQW5kIHdlIGNvdWxkIHRoZW4KPiBzbG93bHkgZ28gdGhyb3VnaCB0aGUgZXhpc3RpbmcgZHJp
dmVycyB0aGF0IHVzZSB0aGUgY29tcG9uZW50IGZyYW1ld29yayB0bwo+IGdldCB0aGlzIGhhbmRs
ZWQgY29ycmVjdGx5Lgo+IAo+IFNvIG15IHF1ZXN0aW9uczoKPiAtIGlzIHRoZXJlIGEgcHJvYmxl
bSBpZiB3ZSBhZGQgdGhlIGRldmljZV9saW5rIGZvciBldmVyeW9uZT8KClBvc3NpYmx5IG5vdCwg
YnV0IEkgZGlkbid0IHdhbnQgdG8gc3RpciB0aGUgZW50aXJlIHBvdCA6KS4gVGhpcyBpcwpzYWZl
ciBpbiB0aGUgc2Vuc2UgdGhhdCBpdCdzIGFuIG9wdC1pbiwgc28gYSBsb3dlciBjaGFuY2Ugb2YK
cmVncmVzc2lvbnMgaW4gY29kZSBhbmQgc2V0dXBzIHRoYXQgSSBjYW4ndCBwb3NzaWJseSB0ZXN0
LiBJZiB5b3UKdGhpbmsgaXQncyB3b3J0aCBzdGlja2luZyBpdCBpbiB0aGUgZXhpc3RpbmcgY29k
ZSBwYXRocywgSSBjYW4KY2VydGFpbmx5IGRvIHRoYXQgdG9vLgoKPiAtIGlzIHRoZXJlIGFuIGlz
c3VlIGlmIHdlIG9ubHkgYWRkIGl0IGF0IGRybV9icmlkZ2VfYXR0YWNoIHRpbWU/IEkga2luZGEK
PiAgIGFzc3VtZWQgdGhhdCBpdCdzIG5vdCBuZWVkZWQgYmVmb3JlIHRoYXQgKEVQUk9CRV9ERUZF
UiBzaG91bGQgaGFuZGxlCj4gICBsb2FkIGRlcGVuZGVuY2llcyBhcyBiZWZvcmUpLCBidXQgaXQg
Y291bGQgYmUgdGhhdCBzb21lIGRyaXZlcnMgYXNrIGZvcgo+ICAgYSBicmlkZ2UgYW5kIHRoZW4g
Y2hlY2sgbW9yZSBzdHVmZiBhbmQgdGhlbiBkcm9wIHRoZSBicmlkZ2Ugd2l0aG91dAo+ICAgY2Fs
bGluZyBkcm1fYnJpZGdlX2F0dGFjaC4gV2UgcHJvYmFibHkgZG9uJ3QgaGF2ZSBhIGNhc2UgbGlr
ZSB0aGlzIHlldCwKPiAgIGJ1dCBiZXR0ZXIgcm9idXN0IHRoYW4gc29ycnkuCgpJIHRoaW5rIHRo
ZXJlIHdvdWxkIGJlIGEgcmFjZSB0aGVyZToKCi0gYnJpZGdlIGRyaXZlciBjYWxscyBkcm1fYnJp
ZGdlX2FkZCgpIGluIHRoZWlyIHByb2JlKCkKLSBjbGllbnQgZHJpdmVyIGNhbGxzIG9mX2RybV9m
aW5kX2JyaWRnZSgpIGluIHRoZWlyIHByb2JlKCkKLSBicmlkZ2UgZHJpdmVyIGdldHMgcmVtb3Zl
ZCwgY2FsbHMgZHJtX2JyaWRnZV9yZW1vdmUoKQotIGNsaWVudCBkcml2ZXIgdXNlcyB0aGUgbm93
IGludmFsaWQgZHJtX2JyaWRnZSBwb2ludGVyIGZyb20gYWJvdmUgdG8KICBkbyBkcm1fYnJpZGdl
X2F0dGFjaCgpCgpXaXRoIG9mX2RybV9icmlkZ2VfZmluZF9kZXZsaW5rKCksIHlvdSBnZXQgdGhl
IGRldmljZV9saW5rIGluc2lkZSB0aGUKYnJpZGdlX2xvY2sgc28gdGhlIHJlZmVyZW5jZSB0byB0
aGUgZHJtX2JyaWRnZSB3aWxsIGVpdGhlciBiZSB2YWxpZCwgb3IKeW91ciBkcml2ZXIgZ2V0cyBy
ZW1vdmVkIHJpZ2h0IGFmdGVyIGl0J3MgcHJvYmVkLCBzbyB0aGF0IHRoZSBicmlkZ2UKY2FuIGJl
IHJlbW92ZWQsIHRvby4KCkluIHBhdGNoIDMwLzMwIEkgdXNlIGJvdGggdGhlIF9kZXZsaW5rIGFu
ZCB0aGUgbm9uLV9kZXZsaW5rIHZlcnNpb25zCm9mIG9mX2RybV9maW5kX2JyaWRnZSgpLCBidXQg
SSBndWVzcyB0aGVyZSdzIG5vIGhhcm0gYWRkaW5nIGFub3RoZXIKcmVmY291bnQgb24gdGhlIGxp
bmssIGl0J2xsIGdldCBkZXN0cm95ZWQgaWYgdGhlIGJyaWRnZSBpcyByZW1vdmVkCnJlZ2FyZGxl
c3MsIGFsdGhvdWdoIHRoYXQgbWF5IG5lZWQgYSBETF9GTEFHX0FVVE9SRU1PVkVfQ09OU1VNRVIu
Cgo+IAo+IEFueXdheSwgSSBzY3JvbGxlZCB0aHJvdWdoIHRoZSBicmlkZ2UgcGF0Y2hlcywgbG9v
a2VkIGFsbCBnb29kLCBodWdlCj4gdGhhbmtzIGZvciB0YWNrbGluZyB0aGlzISBPbmNlIHdlIGhh
dmUgc29tZSBhZ3JlZW1lbnQgb24gdGhlIGJpZ2dlcgo+IHF1ZXN0aW9ucyBoZXJlIEknbGwgdHJ5
IHRvIGdvIHRocm91Z2ggdGhlbSBhbmQgcmV2aWV3Lgo+IAo+IENoZWVycywgRGFuaWVsCj4gPiAt
LS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jIHwgNDkgKysrKysrKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tCj4gPiAgaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oICAgICB8
ICA0ICsrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRp
b25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYwo+ID4gaW5kZXggY2JlNjgwYWE2ZWFjLi5l
MWY4ZGI4NDY1MWEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5j
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jCj4gPiBAQCAtMjYsNiArMjYs
NyBAQAo+ID4gICNpbmNsdWRlIDxsaW51eC9tdXRleC5oPgo+ID4gIAo+ID4gICNpbmNsdWRlIDxk
cm0vZHJtX2JyaWRnZS5oPgo+ID4gKyNpbmNsdWRlIDxkcm0vZHJtX2RldmljZS5oPgo+ID4gICNp
bmNsdWRlIDxkcm0vZHJtX2VuY29kZXIuaD4KPiA+ICAKPiA+ICAjaW5jbHVkZSAiZHJtX2NydGNf
aW50ZXJuYWwuaCIKPiA+IEBAIC0xMDksNiArMTEwLDcgQEAgdm9pZCBkcm1fYnJpZGdlX2luaXQo
c3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwgc3RydWN0IGRldmljZSAqZGV2LAo+ID4gIAlicmlk
Z2UtPmVuY29kZXIgPSBOVUxMOwo+ID4gIAlicmlkZ2UtPm5leHQgPSBOVUxMOwo+ID4gIAo+ID4g
KwlicmlkZ2UtPmRldmljZSA9IGRldjsKPiA+ICAjaWZkZWYgQ09ORklHX09GCj4gPiAgCWJyaWRn
ZS0+b2Zfbm9kZSA9IGRldi0+b2Zfbm9kZTsKPiA+ICAjZW5kaWYKPiA+IEBAIC00OTIsNiArNDk0
LDMyIEBAIHZvaWQgZHJtX2F0b21pY19icmlkZ2VfZW5hYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpi
cmlkZ2UsCj4gPiAgRVhQT1JUX1NZTUJPTChkcm1fYXRvbWljX2JyaWRnZV9lbmFibGUpOwo+ID4g
IAo+ID4gICNpZmRlZiBDT05GSUdfT0YKPiA+ICtzdGF0aWMgc3RydWN0IGRybV9icmlkZ2UgKmRy
bV9icmlkZ2VfZmluZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ID4gKwkJCQkJICBzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5wLCBib29sIGxpbmspCj4gPiArewo+ID4gKwlzdHJ1Y3QgZHJtX2JyaWRn
ZSAqYnJpZGdlLCAqZm91bmQgPSBOVUxMOwo+ID4gKwlzdHJ1Y3QgZGV2aWNlX2xpbmsgKmRsOwo+
ID4gKwo+ID4gKwltdXRleF9sb2NrKCZicmlkZ2VfbG9jayk7Cj4gPiArCj4gPiArCWxpc3RfZm9y
X2VhY2hfZW50cnkoYnJpZGdlLCAmYnJpZGdlX2xpc3QsIGxpc3QpCj4gPiArCQlpZiAoYnJpZGdl
LT5vZl9ub2RlID09IG5wKSB7Cj4gPiArCQkJZm91bmQgPSBicmlkZ2U7Cj4gPiArCQkJYnJlYWs7
Cj4gPiArCQl9Cj4gPiArCj4gPiArCWlmIChmb3VuZCAmJiBsaW5rKSB7Cj4gPiArCQlkbCA9IGRl
dmljZV9saW5rX2FkZChkZXYtPmRldiwgZm91bmQtPmRldmljZSwKPiA+ICsJCQkJICAgICBETF9G
TEFHX0FVVE9QUk9CRV9DT05TVU1FUik7Cj4gPiArCQlpZiAoIWRsKW11dGV4Cj4gPiArCQkJZm91
bmQgPSBOVUxMOwo+ID4gKwl9Cj4gPiArCj4gPiArCW11dGV4X3VubG9jaygmYnJpZGdlX2xvY2sp
Owo+ID4gKwo+ID4gKwlyZXR1cm4gZm91bmQ7Cj4gPiArfQo+ID4gKwo+ID4gIC8qKgo+ID4gICAq
IG9mX2RybV9maW5kX2JyaWRnZSAtIGZpbmQgdGhlIGJyaWRnZSBjb3JyZXNwb25kaW5nIHRvIHRo
ZSBkZXZpY2Ugbm9kZSBpbgo+ID4gICAqCQkJdGhlIGdsb2JhbCBicmlkZ2UgbGlzdAo+ID4gQEAg
LTUwMywyMSArNTMxLDE2IEBAIEVYUE9SVF9TWU1CT0woZHJtX2F0b21pY19icmlkZ2VfZW5hYmxl
KTsKPiA+ICAgKi8KPiA+ICBzdHJ1Y3QgZHJtX2JyaWRnZSAqb2ZfZHJtX2ZpbmRfYnJpZGdlKHN0
cnVjdCBkZXZpY2Vfbm9kZSAqbnApCj4gPiAgewo+ID4gLQlzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJp
ZGdlOwo+ID4gLQo+ID4gLQltdXRleF9sb2NrKCZicmlkZ2VfbG9jayk7Cj4gPiAtCj4gPiAtCWxp
c3RfZm9yX2VhY2hfZW50cnkoYnJpZGdlLCAmYnJpZGdlX2xpc3QsIGxpc3QpIHsKPiA+IC0JCWlm
IChicmlkZ2UtPm9mX25vZGUgPT0gbnApIHsKPiA+IC0JCQltdXRleF91bmxvY2soJmJyaWRnZV9s
b2NrKTsKPiA+IC0JCQlyZXR1cm4gYnJpZGdlOwo+ID4gLQkJfQo+ID4gLQl9Cj4gPiAtCj4gPiAt
CW11dGV4X3VubG9jaygmYnJpZGdlX2xvY2spOwo+ID4gLQlyZXR1cm4gTlVMTDsKPiA+ICsJcmV0
dXJuIGRybV9icmlkZ2VfZmluZChOVUxMLCBucCwgZmFsc2UpOwo+ID4gIH0KPiA+ICBFWFBPUlRf
U1lNQk9MKG9mX2RybV9maW5kX2JyaWRnZSk7Cj4gPiArCj4gPiArc3RydWN0IGRybV9icmlkZ2Ug
Km9mX2RybV9maW5kX2JyaWRnZV9kZXZsaW5rKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gPiAr
CQkJCQkgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQo+ID4gK3sKPiA+ICsJcmV0dXJuIGRy
bV9icmlkZ2VfZmluZChkZXYsIG5wLCB0cnVlKTsKPiA+ICt9Cj4gPiArRVhQT1JUX1NZTUJPTChv
Zl9kcm1fZmluZF9icmlkZ2VfZGV2bGluayk7Cj4gPiAgI2VuZGlmCj4gPiAgCj4gPiAgTU9EVUxF
X0FVVEhPUigiQWpheSBLdW1hciA8YWpheWt1bWFyLnJzQHNhbXN1bmcuY29tPiIpOwo+ID4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaCBiL2luY2x1ZGUvZHJtL2RybV9icmlk
Z2UuaAo+ID4gaW5kZXggZDZkOWQ1MzAxNTUxLi42OGIyN2M2OWNjM2QgMTAwNjQ0Cj4gPiAtLS0g
YS9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKPiA+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9icmlk
Z2UuaAo+ID4gQEAgLTM4Miw2ICszODIsOCBAQCBzdHJ1Y3QgZHJtX2JyaWRnZSB7Cj4gPiAgCXN0
cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsKPiA+ICAJLyoqIEBuZXh0OiB0aGUgbmV4dCBicmlk
Z2UgaW4gdGhlIGVuY29kZXIgY2hhaW4gKi8KPiA+ICAJc3RydWN0IGRybV9icmlkZ2UgKm5leHQ7
Cj4gPiArCS8qKiBAZGV2aWNlOiBMaW51eCBkcml2ZXIgbW9kZWwgZGV2aWNlICovCj4gPiArCXN0
cnVjdCBkZXZpY2UgKmRldmljZTsKPiA+ICAjaWZkZWYgQ09ORklHX09GCj4gPiAgCS8qKiBAb2Zf
bm9kZTogZGV2aWNlIG5vZGUgcG9pbnRlciB0byB0aGUgYnJpZGdlICovCj4gPiAgCXN0cnVjdCBk
ZXZpY2Vfbm9kZSAqb2Zfbm9kZTsKPiA+IEBAIC00MDcsNiArNDA5LDggQEAgdm9pZCBkcm1fYnJp
ZGdlX2luaXQoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwgc3RydWN0IGRldmljZSAqZGV2LAo+
ID4gIAkJICAgICBjb25zdCBzdHJ1Y3QgZHJtX2JyaWRnZV90aW1pbmdzICp0aW1pbmdzLAo+ID4g
IAkJICAgICB2b2lkICpkcml2ZXJfcHJpdmF0ZSk7Cj4gPiAgc3RydWN0IGRybV9icmlkZ2UgKm9m
X2RybV9maW5kX2JyaWRnZShzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKTsKPiA+ICtzdHJ1Y3QgZHJt
X2JyaWRnZSAqb2ZfZHJtX2ZpbmRfYnJpZGdlX2Rldmxpbmsoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwKPiA+ICsJCQkJCSAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApOwo+ID4gIGludCBkcm1f
YnJpZGdlX2F0dGFjaChzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsIHN0cnVjdCBkcm1fYnJp
ZGdlICpicmlkZ2UsCj4gPiAgCQkgICAgICBzdHJ1Y3QgZHJtX2JyaWRnZSAqcHJldmlvdXMpOwo+
ID4gIAo+IAo+IAoKCi0tIApNaWhhaWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
