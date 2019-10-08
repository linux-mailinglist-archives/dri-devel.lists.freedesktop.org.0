Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25122CF625
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 11:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13CB96E0D8;
	Tue,  8 Oct 2019 09:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50082.outbound.protection.outlook.com [40.107.5.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6DF6E0D8
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 09:36:29 +0000 (UTC)
Received: from VI1PR08CA0253.eurprd08.prod.outlook.com (2603:10a6:803:dc::26)
 by VI1PR08MB5533.eurprd08.prod.outlook.com (2603:10a6:803:12d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.24; Tue, 8 Oct
 2019 09:36:25 +0000
Received: from VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::205) by VI1PR08CA0253.outlook.office365.com
 (2603:10a6:803:dc::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Tue, 8 Oct 2019 09:36:25 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT028.mail.protection.outlook.com (10.152.18.88) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 8 Oct 2019 09:36:24 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Tue, 08 Oct 2019 09:36:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 325ce9b1d1615056
X-CR-MTA-TID: 64aa7808
Received: from d1a38d61bde0.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 45A2E712-6474-42AE-A206-D92D326E6655.1; 
 Tue, 08 Oct 2019 09:36:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d1a38d61bde0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Oct 2019 09:36:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VapN4JiVHPLuJzRskgaH7WAbHtRb2Uqstlr/4blVZrKEJy9wEXrbVe7Z5QOvwlN+yMjeDmP149SS1Txg2Q1vHIa2BpFq4A4Cbl6ohkF8VtryA7IJPan13egHEbSqWZbVaEMBEBL0qJ9/idCjLFaMsIkRKW1mHfH1n1JEnnOgLwmwuUt0XWUE6InDy9dwDqbARzki9CV8lTF8znnvOoDrITgemjjD0kGkyiqtNj4F22sPrancstGHOg1VRpI+7gnSPczVcM8bajZITw248XIqM9m4K1JWNHqG9QGC9FwgZnvd5zEfDTwV1yLFUpoXDygU8w5k/+9X1xNj0O9QatBxQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9u3fsA7IgHO3lkDUiux/XCJy1VY+fTxvvhg4ueY+n/Q=;
 b=CbpReX5Kc1B5VX+Bqq04YzD67/hAIESnolr0F5ATLsXYpieyYTuc4Akum7+AAIPzCGXRLkqyt1i+z2CTxhKhcjmkXPSkxZGbx2BVaEUv6dspMxDiVa5hhbwRDbjdV70V7MIFGL42S1FDimKlDq8bbqOjM/K4Nd8VmNyOcTqWikMUiNdcDa4u8HZZUVO8ab8t/k48728qyLInBeze3rGfZzmVvTUjeWDvTT/Y+VAZg1kTFuHvWB2e9RIyM34Ugz+idoFpt7BAOqJgO6o0cLCByZJgISks37Umw5WHhbTKOD1EwN7iprB7mF1CRenl8fc1dLLrArYpW72Ur1xwLSgJPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB3143.eurprd08.prod.outlook.com (52.135.163.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Tue, 8 Oct 2019 09:36:09 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a%5]) with mapi id 15.20.2347.016; Tue, 8 Oct 2019
 09:36:09 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [PATCH] drm/komeda: Set output color depth for output
Thread-Topic: [PATCH] drm/komeda: Set output color depth for output
Thread-Index: AQHVfblD7I+ubO1huUCp0qQz7Z0Q4adQfC0A
Date: Tue, 8 Oct 2019 09:36:09 +0000
Message-ID: <20191008093608.eyr5ygc2lkkaaqia@DESKTOP-E1NTVVP.localdomain>
References: <20191008091734.19509-1-lowry.li@arm.com>
In-Reply-To: <20191008091734.19509-1-lowry.li@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.54]
x-clientproxiedby: LO2P265CA0365.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::17) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ead338f3-d9e0-42df-a879-08d74bd2fc48
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM6PR08MB3143:|AM6PR08MB3143:|VI1PR08MB5533:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB55337DDF4DB80951BF9B00F5F09A0@VI1PR08MB5533.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4714;OLM:4714;
x-forefront-prvs: 01842C458A
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(199004)(189003)(6116002)(6862004)(4326008)(25786009)(66946007)(2906002)(6512007)(9686003)(66066001)(58126008)(6506007)(6636002)(316002)(11346002)(71200400001)(8676002)(476003)(71190400001)(44832011)(6486002)(305945005)(386003)(81166006)(66476007)(66556008)(64756008)(66446008)(1076003)(81156014)(486006)(446003)(54906003)(6246003)(7736002)(86362001)(256004)(52116002)(14454004)(14444005)(76176011)(26005)(99286004)(5660300002)(229853002)(8936002)(102836004)(478600001)(186003)(3846002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3143;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: /mHMHO+fxnaO8KfMEKwlTXG1vAir0pi3lyypcmqtl8C3r3Jcynyn2j8vBsvDjZgu/PzFeJ35zpdhkGhBqEJ2phcXydmkHQoy/+7nLAlAm5aFsmjlC8qFLONMdqjf/yVkQnEW5pG0tM2RWLf6UNlaSowWU6d19oF4UFoSt1yxGO0tttOisoewgi3xn7EMGuAJzIItWhcz+Icooi1McDsGpHh6ZWNqGrzY7h3w1cqad3D5OVA63tPXTJKDeGJSsdkEw1v7PzJcbyS4gdhTfZmu64wLOxMj6wHVvHKwMcr4VsM3/p7hzznkGkYGHcHeKzsY1t+66GjwF4S4r9XkVX1AVu/jVJTnQiMvWLu1Azcsd6GgGu7JHUcfLrYiA1Bn2PEDNTO0OVINYjHOJl/ed0z8sqhyHgniMpSieVR0zn0HlcA=
Content-ID: <280E1A7559980D48B01470CD2513E1D7@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3143
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(376002)(39860400002)(199004)(189003)(126002)(476003)(486006)(11346002)(63350400001)(316002)(6636002)(36906005)(58126008)(50466002)(97756001)(446003)(81166006)(81156014)(8746002)(54906003)(8676002)(229853002)(6512007)(9686003)(7736002)(66066001)(305945005)(6486002)(47776003)(356004)(14454004)(8936002)(86362001)(336012)(186003)(6862004)(102836004)(26005)(478600001)(1076003)(6246003)(4326008)(6506007)(386003)(25786009)(76176011)(6116002)(22756006)(26826003)(14444005)(76130400001)(70586007)(23726003)(99286004)(3846002)(70206006)(5660300002)(2906002)(46406003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB5533;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: f45ce3ad-cc85-4994-857f-08d74bd2f359
NoDisclaimer: True
X-Forefront-PRVS: 01842C458A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B02AD+UaIkuSe2lyfE2XSdzWBeftaNJd1GU2x85KHZZTWgThpeqowk8/jbTEBtX+HFL9nuFbllveDsJi0jN248EB2v6KUomRqVbQoUvBMKwwhWT+OY86rTDCaVUs9D485xx41ekEHtQ4T3iokvDXB6+IfK9U4EymBUga9ooXL8kTPgUusQ6vnp59ih8jw/gpkAauq5gumONn2u28ZdsAnTTfvlJ5pdnwxKOC3S0q9mJDWHPffHnaByK8oQOGdh7YaUAGMaSpCAj9HZLO4XqhAHLDqoGC9hAgCTP1VNyJwyGKA3yHb7gDXm/ryI57kmqYzpZmluBqbMw1ZpV0Urb21vmvxDvzcXs++XoaqIM9JVbbrFuDGA2yAsu+aa3otMrkY1pi5Vy8O6/M8HVV/s9eMSBSetJCNWn2c9IdqtOO4Xg=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2019 09:36:24.3039 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ead338f3-d9e0-42df-a879-08d74bd2fc48
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5533
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9u3fsA7IgHO3lkDUiux/XCJy1VY+fTxvvhg4ueY+n/Q=;
 b=G7scHcWgdN3Gvmmm2z/JmJyWelMER3b7VNn9QuMhMIrqsh3q0G3li7nGnzOZybX//Ba8v9vYWcgqB5kHf0s/GvG45etS8WYWZrEPWVncRO59xDOgz/ydUprOO+EScXL5uvGoaDEA43VUMFAnQbbKIPAqEaWbwdbKKJqahdZQAMA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9u3fsA7IgHO3lkDUiux/XCJy1VY+fTxvvhg4ueY+n/Q=;
 b=G7scHcWgdN3Gvmmm2z/JmJyWelMER3b7VNn9QuMhMIrqsh3q0G3li7nGnzOZybX//Ba8v9vYWcgqB5kHf0s/GvG45etS8WYWZrEPWVncRO59xDOgz/ydUprOO+EScXL5uvGoaDEA43VUMFAnQbbKIPAqEaWbwdbKKJqahdZQAMA=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTG93cnksCgpPbiBUdWUsIE9jdCAwOCwgMjAxOSBhdCAwOToxNzo1MkFNICswMDAwLCBMb3dy
eSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+IFNldCBjb2xvcl9kZXB0aCBhY2Nv
cmRpbmcgdG8gY29ubmVjdG9yLT5icGMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTG93cnkgTGkgKEFy
bSBUZWNobm9sb2d5IENoaW5hKSA8bG93cnkubGlAYXJtLmNvbT4KPiAtLS0KPiAgLi4uL2FybS9k
aXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jICAgIHwgIDEgKwo+ICAuLi4vZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyAgfCAyMCArKysrKysrKysrKysrKysr
KysrCj4gIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmggICB8ICAy
ICsrCj4gIC4uLi9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oICB8ICAx
ICsKPiAgLi4uL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jICAgIHwgMTkg
KysrKysrKysrKysrKysrKysrCj4gIC4uLi9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nv
bm5lY3Rvci5jICB8ICA0ICsrKysKPiAgNiBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcx
L2Q3MV9jb21wb25lbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcx
L2Q3MV9jb21wb25lbnQuYwo+IGluZGV4IGMzZDI5YzBiMDUxYi4uMjdjZGIwMzU3M2MxIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21w
b25lbnQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3
MV9jb21wb25lbnQuYwo+IEBAIC05NTEsNiArOTUxLDcgQEAgc3RhdGljIHZvaWQgZDcxX2ltcHJv
Y191cGRhdGUoc3RydWN0IGtvbWVkYV9jb21wb25lbnQgKmMsCj4gIAkJCSAgICAgICB0b19kNzFf
aW5wdXRfaWQoc3RhdGUsIGluZGV4KSk7Cj4gIAo+ICAJbWFsaWRwX3dyaXRlMzIocmVnLCBCTEtf
U0laRSwgSFZfU0laRShzdC0+aHNpemUsIHN0LT52c2l6ZSkpOwo+ICsJbWFsaWRwX3dyaXRlMzIo
cmVnLCBJUFNfREVQVEgsIHN0LT5jb2xvcl9kZXB0aCk7Cj4gIH0KPiAgCj4gIHN0YXRpYyB2b2lk
IGQ3MV9pbXByb2NfZHVtcChzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywgc3RydWN0IHNlcV9m
aWxlICpzZikKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfY3J0Yy5jCj4gaW5kZXggNzUyNjNkOGNkMGJkLi5iYWE5ODZiNzA4NzYgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gQEAg
LTE3LDYgKzE3LDI2IEBACj4gICNpbmNsdWRlICJrb21lZGFfZGV2LmgiCj4gICNpbmNsdWRlICJr
b21lZGFfa21zLmgiCj4gIAo+ICt2b2lkIGtvbWVkYV9jcnRjX2dldF9jb2xvcl9jb25maWcoc3Ry
dWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0LAo+ICsJCQkJICB1MzIgKmNvbG9yX2RlcHRocykK
PiArewo+ICsJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm47Cj4gKwlzdHJ1Y3QgZHJtX2Nvbm5l
Y3Rvcl9zdGF0ZSAqY29ubl9zdDsKPiArCWludCBpLCBtaW5fYnBjID0gMzEsIGNvbm5fYnBjID0g
MDsKPiArCj4gKwlmb3JfZWFjaF9uZXdfY29ubmVjdG9yX2luX3N0YXRlKGNydGNfc3QtPnN0YXRl
LCBjb25uLCBjb25uX3N0LCBpKSB7Cj4gKwkJaWYgKGNvbm5fc3QtPmNydGMgIT0gY3J0Y19zdC0+
Y3J0YykKPiArCQkJY29udGludWU7Cj4gKwo+ICsJCWNvbm5fYnBjID0gY29ubi0+ZGlzcGxheV9p
bmZvLmJwYyA/IGNvbm4tPmRpc3BsYXlfaW5mby5icGMgOiA4OwoKV2UgY2FuIGhhdmUgbXVsdGlw
bGUgY29ubmVjdG9ycyBvbiBhIHNpbmdsZSBDUlRDIChlLmcuIG5vcm1hbCArCndyaXRlYmFjayks
IHNvIHdoYXQncyB0aGUgZXhwZWN0ZWQgYmVoYXZpb3VyIGhlcmUgaW4gdGhhdCBjYXNlPwoKPiAr
Cj4gKwkJaWYgKGNvbm5fYnBjIDwgbWluX2JwYykKPiArCQkJbWluX2JwYyA9IGNvbm5fYnBjOwo+
ICsJfQo+ICsKPiArCSpjb2xvcl9kZXB0aHMgPSBHRU5NQVNLKGNvbm5fYnBjLCAwKTsKPiArfQo+
ICsKPiAgc3RhdGljIHZvaWQga29tZWRhX2NydGNfdXBkYXRlX2Nsb2NrX3JhdGlvKHN0cnVjdCBr
b21lZGFfY3J0Y19zdGF0ZSAqa2NydGNfc3QpCj4gIHsKPiAgCXU2NCBweGxjbGssIGFjbGs7Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2tt
cy5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgKPiBp
bmRleCA0NWM0OThlMTVlN2EuLmE0MjUwMzQ1MWI1ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5oCj4gQEAgLTE2Niw2ICsxNjYsOCBA
QCBzdGF0aWMgaW5saW5lIGJvb2wgaGFzX2ZsaXBfaCh1MzIgcm90KQo+ICAJCXJldHVybiAhIShy
b3RhdGlvbiAmIERSTV9NT0RFX1JFRkxFQ1RfWCk7Cj4gIH0KPiAgCj4gK3ZvaWQga29tZWRhX2Ny
dGNfZ2V0X2NvbG9yX2NvbmZpZyhzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3QsCj4gKwkJ
CQkgIHUzMiAqY29sb3JfZGVwdGhzKTsKPiAgdW5zaWduZWQgbG9uZyBrb21lZGFfY3J0Y19nZXRf
YWNsayhzdHJ1Y3Qga29tZWRhX2NydGNfc3RhdGUgKmtjcnRjX3N0KTsKPiAgCj4gIGludCBrb21l
ZGFfa21zX3NldHVwX2NydGNzKHN0cnVjdCBrb21lZGFfa21zX2RldiAqa21zLCBzdHJ1Y3Qga29t
ZWRhX2RldiAqbWRldik7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9waXBlbGluZS5oCj4gaW5kZXggYjMyMmY1MmJhOGYyLi43NjUzZjEzNGE4
ZWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfcGlwZWxpbmUuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX3BpcGVsaW5lLmgKPiBAQCAtMzIzLDYgKzMyMyw3IEBAIHN0cnVjdCBrb21lZGFfaW1w
cm9jIHsKPiAgCj4gIHN0cnVjdCBrb21lZGFfaW1wcm9jX3N0YXRlIHsKPiAgCXN0cnVjdCBrb21l
ZGFfY29tcG9uZW50X3N0YXRlIGJhc2U7Cj4gKwl1OCBjb2xvcl9kZXB0aDsKPiAgCXUxNiBoc2l6
ZSwgdnNpemU7Cj4gIH07Cj4gIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYwo+IGluZGV4IDBiYTljNmFh
MzcwOC4uZTY4ZThmODVhYjI3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jCj4gQEAgLTc0Myw2
ICs3NDMsNyBAQCBrb21lZGFfaW1wcm9jX3ZhbGlkYXRlKHN0cnVjdCBrb21lZGFfaW1wcm9jICpp
bXByb2MsCj4gIAkJICAgICAgIHN0cnVjdCBrb21lZGFfZGF0YV9mbG93X2NmZyAqZGZsb3cpCj4g
IHsKPiAgCXN0cnVjdCBkcm1fY3J0YyAqY3J0YyA9IGtjcnRjX3N0LT5iYXNlLmNydGM7Cj4gKwlz
dHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3QgPSAma2NydGNfc3QtPmJhc2U7Cj4gIAlzdHJ1
Y3Qga29tZWRhX2NvbXBvbmVudF9zdGF0ZSAqY19zdDsKPiAgCXN0cnVjdCBrb21lZGFfaW1wcm9j
X3N0YXRlICpzdDsKPiAgCj4gQEAgLTc1Niw2ICs3NTcsMjQgQEAga29tZWRhX2ltcHJvY192YWxp
ZGF0ZShzdHJ1Y3Qga29tZWRhX2ltcHJvYyAqaW1wcm9jLAo+ICAJc3QtPmhzaXplID0gZGZsb3ct
PmluX3c7Cj4gIAlzdC0+dnNpemUgPSBkZmxvdy0+aW5faDsKPiAgCj4gKwlpZiAoZHJtX2F0b21p
Y19jcnRjX25lZWRzX21vZGVzZXQoY3J0Y19zdCkpIHsKPiArCQl1MzIgb3V0cHV0X2RlcHRoczsK
PiArCQl1MzIgYXZhaWxfZGVwdGhzOwo+ICsKPiArCQlrb21lZGFfY3J0Y19nZXRfY29sb3JfY29u
ZmlnKGNydGNfc3QsCj4gKwkJCQkJICAgICAmb3V0cHV0X2RlcHRocyk7Cj4gKwo+ICsJCWF2YWls
X2RlcHRocyA9IG91dHB1dF9kZXB0aHMgJiBpbXByb2MtPnN1cHBvcnRlZF9jb2xvcl9kZXB0aHM7
Cj4gKwkJaWYgKGF2YWlsX2RlcHRocyA9PSAwKSB7Cj4gKwkJCURSTV9ERUJVR19BVE9NSUMoIk5v
IGF2YWlsYWJsZSBjb2xvciBkZXB0aHMsIGNvbm4gZGVwdGhzOiAweCV4ICYgZGlzcGxheTogMHgl
eFxuIiwKPiArCQkJCQkgb3V0cHV0X2RlcHRocywKPiArCQkJCQkgaW1wcm9jLT5zdXBwb3J0ZWRf
Y29sb3JfZGVwdGhzKTsKPiArCQkJcmV0dXJuIC1FSU5WQUw7Cj4gKwkJfQo+ICsKPiArCQlzdC0+
Y29sb3JfZGVwdGggPSBfX2ZscyhhdmFpbF9kZXB0aHMpOwo+ICsJfQo+ICsKPiAgCWtvbWVkYV9j
b21wb25lbnRfYWRkX2lucHV0KCZzdC0+YmFzZSwgJmRmbG93LT5pbnB1dCwgMCk7Cj4gIAlrb21l
ZGFfY29tcG9uZW50X3NldF9vdXRwdXQoJmRmbG93LT5pbnB1dCwgJmltcHJvYy0+YmFzZSwgMCk7
Cj4gIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV93Yl9jb25uZWN0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX3diX2Nvbm5lY3Rvci5jCj4gaW5kZXggMjg1MWNhYzk0ZDg2Li43NDBhODEyNTA2MzAg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
d2JfY29ubmVjdG9yLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV93Yl9jb25uZWN0b3IuYwo+IEBAIC0xNDIsNiArMTQyLDcgQEAgc3RhdGljIGludCBr
b21lZGFfd2JfY29ubmVjdG9yX2FkZChzdHJ1Y3Qga29tZWRhX2ttc19kZXYgKmttcywKPiAgCXN0
cnVjdCBrb21lZGFfZGV2ICptZGV2ID0ga21zLT5iYXNlLmRldl9wcml2YXRlOwo+ICAJc3RydWN0
IGtvbWVkYV93Yl9jb25uZWN0b3IgKmt3Yl9jb25uOwo+ICAJc3RydWN0IGRybV93cml0ZWJhY2tf
Y29ubmVjdG9yICp3Yl9jb25uOwo+ICsJc3RydWN0IGRybV9kaXNwbGF5X2luZm8gKmluZm87Cj4g
IAl1MzIgKmZvcm1hdHMsIG5fZm9ybWF0cyA9IDA7Cj4gIAlpbnQgZXJyOwo+ICAKPiBAQCAtMTcx
LDYgKzE3Miw5IEBAIHN0YXRpYyBpbnQga29tZWRhX3diX2Nvbm5lY3Rvcl9hZGQoc3RydWN0IGtv
bWVkYV9rbXNfZGV2ICprbXMsCj4gIAo+ICAJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZ3Yl9j
b25uLT5iYXNlLCAma29tZWRhX3diX2Nvbm5faGVscGVyX2Z1bmNzKTsKPiAgCj4gKwlpbmZvID0g
Jmt3Yl9jb25uLT5iYXNlLmJhc2UuZGlzcGxheV9pbmZvOwo+ICsJaW5mby0+YnBjID0gX19mbHMo
a2NydGMtPm1hc3Rlci0+aW1wcm9jLT5zdXBwb3J0ZWRfY29sb3JfZGVwdGhzKTsKPiArCgpUaGUg
SVBTIGNvbG9yIGRlcHRoIGRvZXNuJ3QgcmVhbGx5IGFwcGx5IHRvIHdyaXRlYmFjay4gTWF5YmUg
d2Ugc2hvdWxkCmp1c3Qgc2tpcCB0aGUgd3JpdGViYWNrIGNvbm5lY3Rvcj8KClRoYW5rcywKLUJy
aWFuCgo+ICAJa2NydGMtPndiX2Nvbm4gPSBrd2JfY29ubjsKPiAgCj4gIAlyZXR1cm4gMDsKPiAt
LSAKPiAyLjE3LjEKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
