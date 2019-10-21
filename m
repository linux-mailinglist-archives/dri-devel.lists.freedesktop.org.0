Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43737DEEAE
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 16:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC296E049;
	Mon, 21 Oct 2019 14:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80050.outbound.protection.outlook.com [40.107.8.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E5C6E049
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 14:04:00 +0000 (UTC)
Received: from VI1PR0802CA0011.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::21) by DB6SPR00MB246.eurprd08.prod.outlook.com
 (2603:10a6:4:66::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.21; Mon, 21 Oct
 2019 14:03:56 +0000
Received: from AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::208) by VI1PR0802CA0011.outlook.office365.com
 (2603:10a6:800:aa::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.21 via Frontend
 Transport; Mon, 21 Oct 2019 14:03:56 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT009.mail.protection.outlook.com (10.152.16.110) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.23 via Frontend Transport; Mon, 21 Oct 2019 14:03:54 +0000
Received: ("Tessian outbound 0939a6bab6b1:v33");
 Mon, 21 Oct 2019 14:03:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: deb0673e18c02376
X-CR-MTA-TID: 64aa7808
Received: from 7f710b4e19ac.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.2.54]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BF963E55-1B4D-4DB7-AD40-47F4880E83E2.1; 
 Mon, 21 Oct 2019 14:03:49 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7f710b4e19ac.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Oct 2019 14:03:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WS166ByFYw/oJJfMbj+7rp7VAI3+fNTP8j/lMG0Yj3yzSdDkg36ld98mL6dNtxAwC4I6cg9EFbkZCMCAKsm7LGYv5u3NbAjh+r1zVu/Jyaq69ispsaeXbTJGRPSY7kgbD5mto0FoGlHHiPkKmSasCn3LL6TddcSgPYCVzI/lVzE0601214k8AznJHD1iHGGdXdme2w18h8ifqpY1mS0IM4dyDX56/Ey9nqORVHCq2iI9x52aEiSfKa8UCiuGsHhqTMiPIFZONhDyXQolELnZdwNta/Q85KJqOELStrNT9wojj0x9hdmcNEx7GIrym7pt0i4PjKsyoDdSYgztECYhAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsxpaGl0iXPX6O+vPrVzlmc6FU5s+0aVjjhbQk+L4pw=;
 b=dlQkl/ofmdFwwseMOcvv3xl8IXfSlYYcLp8hlEy0wuwV59EjouXv8ieXIEPlR6QddXQ6+B2DVxXqPjeWJYjSUf9ciUU9q7GNQbQZDXBMsOcnyIgltdVOlUvXxZdmbQyMZBx/qO+onw7/5A9MGZqU+pX/BSXtRJ3MhJEKr0uQEvzAFw4wIDWxxF+S3hP7zWwvPae8BKsPEMrsq0ZEmcv6iEsHwhjFXqnefl1UJL0BWKAWSYs3jj6rh4x32G5d0ZioQUBdA78hHoZj+tx573sfHXVI0vYdtf6s1REFXx3LFImXUw1dVIooByCgHNHjLYfM64WuXZd8IAkPy5z2UTVJpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3262.eurprd08.prod.outlook.com (52.133.15.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.22; Mon, 21 Oct 2019 14:03:48 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2367.022; Mon, 21 Oct 2019
 14:03:48 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: drm/komeda: Don't flush inactive pipes
Thread-Topic: drm/komeda: Don't flush inactive pipes
Thread-Index: AQHVg/q5HtMJ9aPBjkqhwpfRyiPcGKdlKMGA
Date: Mon, 21 Oct 2019 14:03:48 +0000
Message-ID: <4038026.EQVCqvRzMf@e123338-lin>
References: <20191010102950.56253-1-mihail.atanassov@arm.com>
 <20191016082117.GA18601@jamwan02-TSP300>
In-Reply-To: <20191016082117.GA18601@jamwan02-TSP300>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.51]
x-clientproxiedby: LO2P123CA0048.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::36)
 To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: dc8c7b7f-e88a-41fa-9e00-08d7562f825a
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB3262:|VI1PR08MB3262:|DB6SPR00MB246:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6SPR00MB246B283EE56D24CC56EB9BB8F690@DB6SPR00MB246.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:170;OLM:170;
x-forefront-prvs: 0197AFBD92
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(366004)(39860400002)(346002)(376002)(136003)(396003)(51914003)(199004)(189003)(14454004)(54906003)(9686003)(6512007)(6436002)(5660300002)(81156014)(33716001)(6246003)(305945005)(66066001)(7736002)(14444005)(256004)(6862004)(81166006)(8936002)(8676002)(2906002)(186003)(26005)(478600001)(71190400001)(71200400001)(446003)(11346002)(476003)(86362001)(316002)(6636002)(52116002)(6486002)(486006)(6506007)(99286004)(229853002)(76176011)(102836004)(386003)(3846002)(6116002)(66946007)(4326008)(66556008)(64756008)(25786009)(66476007)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3262;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: +MUz9LpuNA4fqRvIdNIYYqcAU/ADcCmqYQvfxg06UCCdBpGyL1/Fiu3Kvw9wVCbKOICnJhw4z5M7y7hQLJtVWxVGAJXD01EqV5P5L5PqKPV58cykoqxudW/X17HYy+1BEmSsRPuOIFAjw+KdqYZmmM9k5OoUpEj3OmJBHAf6C7lQlPDAmXRGFjZt/fx8IsZ6jPfU/SmGvmZnc8vZ7QuMGQWwKgmddTMhl3aOyIpUXChHRRD05gK+2kfx+N7vrb2E7rkzoUbXaNhKHUrvNLuP4uf2MgR7gpTfANmKXWU/nMGN7F0wF4KkHfCzdXQ/tsBeoNA1LSpZRE7rg5GDp8ip80x4pZyNukiE69GDVBZnmsaGy7JnwaTurRwun8cbV6tiqSuEHSxr+JW8Cya2eBxwrOpogO7QX1Ng2funxzwF4Dg=
Content-ID: <0533DF58170BF348BE6D64481660898F@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3262
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(136003)(346002)(396003)(376002)(39860400002)(189003)(199004)(51914003)(6486002)(478600001)(86362001)(26826003)(70206006)(356004)(70586007)(76130400001)(97756001)(3846002)(6116002)(2906002)(14454004)(25786009)(23726003)(7736002)(8746002)(8936002)(81166006)(81156014)(8676002)(305945005)(50466002)(36906005)(5660300002)(229853002)(54906003)(316002)(14444005)(6246003)(47776003)(186003)(6862004)(6636002)(76176011)(4326008)(99286004)(26005)(102836004)(33716001)(6506007)(386003)(66066001)(22756006)(446003)(11346002)(486006)(6512007)(9686003)(126002)(476003)(336012)(46406003)(63350400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6SPR00MB246;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8d2f8b61-df74-4eb9-e65e-08d7562f7e4e
NoDisclaimer: True
X-Forefront-PRVS: 0197AFBD92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OTj5Wv4jFBTaoAehzBcUQjXMZ2CuZVQKjrfCdmYgQyt8xfcx2BLSoaSqETGfmwJYuik/sYlphXaEERFSZIUs3OHyAXfPFb2vEJf2VXHQ6sx39GkeFEOal0zTcCKXbw3WQ6L3y7ZgF0ca33cfOo8734biYlB4JwhsmLt3gaGTywYvYluMI9RGBb8r39nqgYXU0h1Kl1SjHWIOWgT/FXph0luTV3P4cmPnocfJ/TUBZHEmJwA6T0NjaXx2i3RVQpjT0ZIf4nXUJLFCWYg29w6ZBO94NPzD5Oiglp7hK8YFnYAwy9/Qq71hY67RsdZlrxmzjMjdqOtIoWWo8JuHAeCusIaPN9yLP+INM8fgfGyWBoznvxaNtWgCATaMnbVKBBICzsV1PPbxKHW9LtZd8ahW3j+Q9JXAd0aK7Q165DN/StT6MoDYMdhWiUVQ8WUPvd9H
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2019 14:03:54.6062 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8c7b7f-e88a-41fa-9e00-08d7562f825a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6SPR00MB246
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsxpaGl0iXPX6O+vPrVzlmc6FU5s+0aVjjhbQk+L4pw=;
 b=txuicf139TZXXypkp/90sbrM9K7bZmrjVgxxn9MnS9qOhqFlmzVNI1okXlhq1k4oOyJ6I/IguCI/+o3sBGOqZDaY6CB9j+kU4d1KGP0e/tyLPEiI04A8ZE9ntHOXCD7M9MKMzEfwHD24eR/6I1eprO3oeePNJ35byti4JHYX8qk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsxpaGl0iXPX6O+vPrVzlmc6FU5s+0aVjjhbQk+L4pw=;
 b=txuicf139TZXXypkp/90sbrM9K7bZmrjVgxxn9MnS9qOhqFlmzVNI1okXlhq1k4oOyJ6I/IguCI/+o3sBGOqZDaY6CB9j+kU4d1KGP0e/tyLPEiI04A8ZE9ntHOXCD7M9MKMzEfwHD24eR/6I1eprO3oeePNJ35byti4JHYX8qk=
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
Cc: David Airlie <airlied@linux.ie>, nd <nd@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkbmVzZGF5LCAxNiBPY3RvYmVyIDIwMTkgMDk6MjE6MjQgQlNUIGphbWVzIHFpYW4gd2Fu
ZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+IE9uIFRodSwgT2N0IDEwLCAyMDE5IGF0
IDEwOjMwOjA3QU0gKzAwMDAsIE1paGFpbCBBdGFuYXNzb3Ygd3JvdGU6Cj4gPiBIVyBkb2Vzbid0
IGFsbG93IGZsdXNoaW5nIGluYWN0aXZlIHBpcGVzIGFuZCByYWlzZXMgYW4gTUVSUiBpbnRlcnJ1
cHQKPiA+IGlmIHlvdSB0cnkgdG8gZG8gc28uIFN0b3AgdHJpZ2dlcmluZyB0aGUgTUVSUiBpbnRl
cnJ1cHQgaW4gdGhlCj4gPiBtaWRkbGUgb2YgYSBjb21taXQgYnkgY2FsbGluZyBkcm1fYXRvbWlj
X2hlbHBlcl9jb21taXRfcGxhbmVzCj4gPiB3aXRoIHRoZSBBQ1RJVkVfT05MWSBmbGFnLgo+ID4g
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFy
bS5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9rbXMuYyB8IDMgKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9rbXMuYwo+ID4gaW5kZXggODgyMGNlMTVjZTM3Li5hZTI3NDkwMmZmOTIg
MTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9rbXMuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfa21zLmMKPiA+IEBAIC04Miw3ICs4Miw4IEBAIHN0YXRpYyB2b2lkIGtvbWVkYV9rbXNfY29t
bWl0X3RhaWwoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKm9sZF9zdGF0ZSkKPiA+ICAKPiA+ICAJ
ZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X21vZGVzZXRfZGlzYWJsZXMoZGV2LCBvbGRfc3RhdGUp
Owo+ID4gIAo+ID4gLQlkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfcGxhbmVzKGRldiwgb2xkX3N0
YXRlLCAwKTsKPiA+ICsJZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X3BsYW5lcyhkZXYsIG9sZF9z
dGF0ZSwKPiA+ICsJCQkJCURSTV9QTEFORV9DT01NSVRfQUNUSVZFX09OTFkpOwo+ID4KPiAKPiBM
b29rcyBnb29kIHRvIG1lLgo+IFJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNo
bm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+CgpUaGFua3MgZm9yIHRoZSBy
ZXZpZXcsIGFwcGxpZWQgdG8gZHJtLW1pc2MtZml4ZXMgLQpiODg2MzliOGUzODA4Yzk0ODE2OWFm
MzkwYmQ3ZTg0ZTkwOWJkZThkLgoKPiAKPiA+ICAJZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X21v
ZGVzZXRfZW5hYmxlcyhkZXYsIG9sZF9zdGF0ZSk7Cj4gPiAgCj4gCgoKLS0gCk1paGFpbAoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
