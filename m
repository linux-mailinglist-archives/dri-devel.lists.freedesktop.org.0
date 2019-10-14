Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6E9D5F75
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 11:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1036E227;
	Mon, 14 Oct 2019 09:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20065.outbound.protection.outlook.com [40.107.2.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A556E227
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 09:55:16 +0000 (UTC)
Received: from DB7PR08CA0046.eurprd08.prod.outlook.com (2603:10a6:10:26::23)
 by VE1PR08MB4768.eurprd08.prod.outlook.com (2603:10a6:802:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Mon, 14 Oct
 2019 09:55:12 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::203) by DB7PR08CA0046.outlook.office365.com
 (2603:10a6:10:26::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Mon, 14 Oct 2019 09:55:12 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 14 Oct 2019 09:55:10 +0000
Received: ("Tessian outbound 0939a6bab6b1:v33");
 Mon, 14 Oct 2019 09:55:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6fd901d59fb9c6bd
X-CR-MTA-TID: 64aa7808
Received: from dee179f10278.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.6.55]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 98325F3E-F3E9-4E4D-AB6C-639A8CAAEE33.1; 
 Mon, 14 Oct 2019 09:55:01 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2055.outbound.protection.outlook.com [104.47.6.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dee179f10278.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Oct 2019 09:55:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F69uU0Me8LAoNzLkuo6YkTHMCOq4Ma0PXP8N8JXC0EVOf2eqxXyTs25PuJ4LZ7FzuHIEBunAbiFqCOB6j3/qEHE7LAOTPxyYBR8Swfx2rzEAlNUHQ+7rtSRVzvPlvQ3VPFaQynY3OfrwzRnV9NJBMKd6dIpx9u+q29Drdcs044cBwAorL7c7KARvjd2BrJwI2vKOSx7CF1sf7YNI0Ck6tJD7e1yOew5rbw2/+4sgSNT32sqTAeg/W78oxbQQkZt+DJK/OscJ1iAiPyu9XQl/1PcrSKrkdXOhyEjcujyHvW46+62h6QSPFt/lym8Ym68L6MtOoC/6kFuHYBTrPGUV9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Klz+9hMdl8fouUUvlSsItuNHFkyXDK66yx8iuW8dFo=;
 b=hgAPc5S5j1n7roR8MGegn6176AxLxFWjqdLkzNiJboBi1MZOCp+5I7dy50BhSdu/Mf/9dse9Ep2lPDklcRxGlWwqo7gvfmDg2Qgb/YVjGQukPkTVpe1KSHD3CX3lWAJD3ft3E6KYDAy49mh5nwmD3a/L28lPGV9MsV6n/4+h/sXzMYpPaWt1Y3bEZRbb3/QBEN+pOioG13i0YIS+otDrBFv4jso7QIp3t5UskZwAfdUlnCDwTywNAXgTE+maHkonNViPIPVhkYIHDZp16lIAZEwnJo6V2tkEwb+H7oLjQegtJLXt8AfgXOmyWYyFHVtjRrj0QQlgcRZiPaykMdEDlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2893.eurprd08.prod.outlook.com (10.170.239.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Mon, 14 Oct 2019 09:54:58 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2347.021; Mon, 14 Oct 2019
 09:54:58 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [PATCH] drm/komeda: Set output color depth for output
Thread-Topic: [PATCH] drm/komeda: Set output color depth for output
Thread-Index: AQHVgMlgRjNZSavPFUK1VMeh9loRYKdZ6UoA
Date: Mon, 14 Oct 2019 09:54:57 +0000
Message-ID: <2096697.gnXSny8DX0@e123338-lin>
References: <20191012065030.12691-1-lowry.li@arm.com>
In-Reply-To: <20191012065030.12691-1-lowry.li@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.49]
x-clientproxiedby: LO2P265CA0139.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::31) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 96063823-5e47-42f2-46c9-08d7508c9a1e
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB2893:|VI1PR08MB2893:|VE1PR08MB4768:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB476833A5A4A835E17993C5D48F900@VE1PR08MB4768.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4714;OLM:4714;
x-forefront-prvs: 01901B3451
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(199004)(189003)(5660300002)(386003)(11346002)(6636002)(446003)(71200400001)(476003)(6116002)(71190400001)(6246003)(14454004)(6506007)(486006)(186003)(26005)(54906003)(316002)(8676002)(66476007)(66946007)(8936002)(64756008)(66446008)(66556008)(3846002)(81156014)(81166006)(6486002)(14444005)(102836004)(256004)(99286004)(4326008)(86362001)(66066001)(33716001)(229853002)(7736002)(305945005)(52116002)(6512007)(9686003)(25786009)(6436002)(76176011)(6862004)(2906002)(478600001)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2893;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 3ShnrpKYNbaH/DA6hNB9LW7g2eAMckAxL+eAvgyMkoTqPCHk+1soyrzySF1L0fLLT+YL8BahpK3NR6mMGxQW1hSYi5NCPMANAOo62tZzxa0lFSr2/CVsmxgaUqymuw3jRwyjsZhv90AGQxEBtcd6FvNIU2XLGn0ug3cEXMxlAbM0tisSc/KR2MMi1ytwGjxw+Ul6iBQWeQ5bmApViRy867Uomxm7srUTfD7EZS+ClTj6B/hd11t+xgyPFTg0xpjfffZUhX4L8yT5EtHcYHRHYW92knHo5V5BVQw1DIvLI1M13vgHIIqGX9A/37tE4atGHTvhxZ5enzGDRFWGELGxDMywDpPHiuBhjBg4BWKHvkaydD2RWIFD3j/pNgIhgVlOKZEFzTiSz3fpuA1U+zAckwap5HrNa9nd2tdif//PMYI=
Content-ID: <14A88B7A30E7704C8BA8278A63477613@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2893
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(346002)(396003)(136003)(39860400002)(189003)(199004)(97756001)(63350400001)(336012)(11346002)(446003)(102836004)(26005)(14444005)(22756006)(33716001)(386003)(6506007)(186003)(50466002)(70586007)(76130400001)(70206006)(14454004)(26826003)(478600001)(66066001)(476003)(47776003)(126002)(486006)(25786009)(2906002)(5660300002)(356004)(46406003)(6636002)(6862004)(3846002)(4326008)(86362001)(229853002)(6486002)(6246003)(6512007)(9686003)(54906003)(8676002)(23726003)(316002)(76176011)(7736002)(8936002)(99286004)(6116002)(81166006)(8746002)(81156014)(305945005)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4768;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 59f51bc8-1df2-4089-33cb-08d7508c9242
NoDisclaimer: True
X-Forefront-PRVS: 01901B3451
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bGYgxZDHJxwLbWceO/HuJtkUS+lFjPMxTi/Lq9srGhe0KuPZb+e7l5XdwJrCzzi0oSkksgMiufP/opNQmnl8Hi1Hws6p/TEbVifSeaLiA/KnrvPbKZyFq2d3K7J9dJ8rGEciRlnRfim8xi8JuHUbYVXZlXJuPDrQKaYPUR1aNHvvxhC+6vpyXH8fB9Eu1OCVJ7x6LMh/qrX1G2X9vtiD1eB6NLpJkUnFjl2IF15OKsywBAgp8sUDeSF0wmmiU9ydjRS6N2uDBUwIugzakWscViYcAxstwLoDc0TpChmsVx2apzx/QbcPK/61MymdxeYNkeYxXEHHvW+0O+uzp3i5hzgX4WupAE4qvyA5HPFPJOZB0X+ghIUe81rBA6fGZJXBbqGYKRVFBF6wIg4/rsWRcKFkajpfZkKEBGxATPSvWug=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2019 09:55:10.7013 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96063823-5e47-42f2-46c9-08d7508c9a1e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4768
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Klz+9hMdl8fouUUvlSsItuNHFkyXDK66yx8iuW8dFo=;
 b=1Rme2eM/C3fxHBOoP936ybruw7yQbJFgT8kgBVwesF/FuHvc+gHQHUdPqlbm0L/k5KSeGSUDTWlwu2sZeBQNZBtTL48KI+jq9NZcgxkUyFlil9X5NPmm9qrAJYmHooORcpx5zZ7qmlC9s+3z75ND5n/68c4jiY/ergCt0B1VZso=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Klz+9hMdl8fouUUvlSsItuNHFkyXDK66yx8iuW8dFo=;
 b=1Rme2eM/C3fxHBOoP936ybruw7yQbJFgT8kgBVwesF/FuHvc+gHQHUdPqlbm0L/k5KSeGSUDTWlwu2sZeBQNZBtTL48KI+jq9NZcgxkUyFlil9X5NPmm9qrAJYmHooORcpx5zZ7qmlC9s+3z75ND5n/68c4jiY/ergCt0B1VZso=
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
Cc: nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTG93cnksCgpGb3IgZnV0dXJlIHJlZmVyZW5jZSwgaXQncyBxdWl0ZSB1c2VmdWwgZm9yIHRo
ZSByZWFkZXIgaWYgeW91IHB1dCB0aGUKcGF0Y2ggdmVyc2lvbiBpbiB0aGUgc3ViamVjdCBsaW5l
IChlLmcuIFtQQVRDSCB2M10gLi4uKSA6KS4KCgpPbiBTYXR1cmRheSwgMTIgT2N0b2JlciAyMDE5
IDA3OjUwOjQ2IEJTVCBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+IFNl
dCBjb2xvcl9kZXB0aCBhY2NvcmRpbmcgdG8gY29ubmVjdG9yLT5icGMuCj4gCj4gQ2hhbmdlcyBz
aW5jZSB2MToKPiAgLSBGaXhlZCBtaW5fYnBjIGlzIGVmZmVjdGl2ZWx5IHNldCBidXQgbm90IHVz
ZWQgaW4KPiBrb21lZGFfY3J0Y19nZXRfY29sb3JfY29uZmlnKCkuCj4gCj4gQ2hhbmdlcyBzaW5j
ZSB2MjoKPiAgLSBBbGlnbiB0aGUgY29kZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMb3dyeSBMaSAo
QXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxsb3dyeS5saUBhcm0uY29tPgo+IC0tLQo+ICAuLi4vYXJt
L2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgICAgfCAgMSArCj4gIC4uLi9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jICB8IDIwICsrKysrKysrKysrKysr
KysrKysKPiAgLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaCAgIHwg
IDIgKysKPiAgLi4uL2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmggIHwg
IDEgKwo+ICAuLi4vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMgICAgfCAx
OCArKysrKysrKysrKysrKysrKwo+ICAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9j
b25uZWN0b3IuYyAgfCAgNCArKysrCj4gIDYgZmlsZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygr
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3
MS9kNzFfY29tcG9uZW50LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3
MS9kNzFfY29tcG9uZW50LmMKPiBpbmRleCBjM2QyOWMwYjA1MWIuLjI3Y2RiMDM1NzNjMSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29t
cG9uZW50LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9k
NzFfY29tcG9uZW50LmMKPiBAQCAtOTUxLDYgKzk1MSw3IEBAIHN0YXRpYyB2b2lkIGQ3MV9pbXBy
b2NfdXBkYXRlKHN0cnVjdCBrb21lZGFfY29tcG9uZW50ICpjLAo+ICAJCQkgICAgICAgdG9fZDcx
X2lucHV0X2lkKHN0YXRlLCBpbmRleCkpOwo+ICAKPiAgCW1hbGlkcF93cml0ZTMyKHJlZywgQkxL
X1NJWkUsIEhWX1NJWkUoc3QtPmhzaXplLCBzdC0+dnNpemUpKTsKPiArCW1hbGlkcF93cml0ZTMy
KHJlZywgSVBTX0RFUFRILCBzdC0+Y29sb3JfZGVwdGgpOwo+ICB9Cj4gIAo+ICBzdGF0aWMgdm9p
ZCBkNzFfaW1wcm9jX2R1bXAoc3RydWN0IGtvbWVkYV9jb21wb25lbnQgKmMsIHN0cnVjdCBzZXFf
ZmlsZSAqc2YpCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2NydGMuYwo+IGluZGV4IDc1MjYzZDhjZDBiZC4uZmUyOTVjNGZjYTcxIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+IEBA
IC0xNyw2ICsxNywyNiBAQAo+ICAjaW5jbHVkZSAia29tZWRhX2Rldi5oIgo+ICAjaW5jbHVkZSAi
a29tZWRhX2ttcy5oIgo+ICAKPiArdm9pZCBrb21lZGFfY3J0Y19nZXRfY29sb3JfY29uZmlnKHN0
cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdCwKPiArCQkJCSAgdTMyICpjb2xvcl9kZXB0aHMp
Cj4gK3sKPiArCXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uOwo+ICsJc3RydWN0IGRybV9jb25u
ZWN0b3Jfc3RhdGUgKmNvbm5fc3Q7Cj4gKwlpbnQgaSwgbWluX2JwYyA9IDMxLCBjb25uX2JwYyA9
IDA7Cj4gKwo+ICsJZm9yX2VhY2hfbmV3X2Nvbm5lY3Rvcl9pbl9zdGF0ZShjcnRjX3N0LT5zdGF0
ZSwgY29ubiwgY29ubl9zdCwgaSkgewo+ICsJCWlmIChjb25uX3N0LT5jcnRjICE9IGNydGNfc3Qt
PmNydGMpCj4gKwkJCWNvbnRpbnVlOwo+ICsKPiArCQljb25uX2JwYyA9IGNvbm4tPmRpc3BsYXlf
aW5mby5icGMgPyBjb25uLT5kaXNwbGF5X2luZm8uYnBjIDogODsKPiArCj4gKwkJaWYgKGNvbm5f
YnBjIDwgbWluX2JwYykKPiArCQkJbWluX2JwYyA9IGNvbm5fYnBjOwo+ICsJfQo+ICsKPiArCSpj
b2xvcl9kZXB0aHMgPSBHRU5NQVNLKG1pbl9icGMsIDApOwo+ICt9Cj4gKwo+ICBzdGF0aWMgdm9p
ZCBrb21lZGFfY3J0Y191cGRhdGVfY2xvY2tfcmF0aW8oc3RydWN0IGtvbWVkYV9jcnRjX3N0YXRl
ICprY3J0Y19zdCkKPiAgewo+ICAJdTY0IHB4bGNsaywgYWNsazsKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmggYi9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaAo+IGluZGV4IDQ1YzQ5OGUxNWU3
YS4uYTQyNTAzNDUxYjVkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2ttcy5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfa21zLmgKPiBAQCAtMTY2LDYgKzE2Niw4IEBAIHN0YXRpYyBpbmxpbmUg
Ym9vbCBoYXNfZmxpcF9oKHUzMiByb3QpCj4gIAkJcmV0dXJuICEhKHJvdGF0aW9uICYgRFJNX01P
REVfUkVGTEVDVF9YKTsKPiAgfQo+ICAKPiArdm9pZCBrb21lZGFfY3J0Y19nZXRfY29sb3JfY29u
ZmlnKHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdCwKPiArCQkJCSAgdTMyICpjb2xvcl9k
ZXB0aHMpOwo+ICB1bnNpZ25lZCBsb25nIGtvbWVkYV9jcnRjX2dldF9hY2xrKHN0cnVjdCBrb21l
ZGFfY3J0Y19zdGF0ZSAqa2NydGNfc3QpOwo+ICAKPiAgaW50IGtvbWVkYV9rbXNfc2V0dXBfY3J0
Y3Moc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprbXMsIHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KTsK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
cGlwZWxpbmUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3Bp
cGVsaW5lLmgKPiBpbmRleCBiMzIyZjUyYmE4ZjIuLjc2NTNmMTM0YThlYiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUu
aAo+IEBAIC0zMjMsNiArMzIzLDcgQEAgc3RydWN0IGtvbWVkYV9pbXByb2Mgewo+ICAKPiAgc3Ry
dWN0IGtvbWVkYV9pbXByb2Nfc3RhdGUgewo+ICAJc3RydWN0IGtvbWVkYV9jb21wb25lbnRfc3Rh
dGUgYmFzZTsKPiArCXU4IGNvbG9yX2RlcHRoOwo+ICAJdTE2IGhzaXplLCB2c2l6ZTsKPiAgfTsK
PiAgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX3BpcGVsaW5lX3N0YXRlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jCj4gaW5kZXggMGJhOWM2YWEzNzA4Li5lNjRiZmVhYTA2
YzcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfcGlwZWxpbmVfc3RhdGUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMKPiBAQCAtNzQzLDYgKzc0Myw3IEBAIGtvbWVk
YV9pbXByb2NfdmFsaWRhdGUoc3RydWN0IGtvbWVkYV9pbXByb2MgKmltcHJvYywKPiAgCQkgICAg
ICAgc3RydWN0IGtvbWVkYV9kYXRhX2Zsb3dfY2ZnICpkZmxvdykKPiAgewo+ICAJc3RydWN0IGRy
bV9jcnRjICpjcnRjID0ga2NydGNfc3QtPmJhc2UuY3J0YzsKPiArCXN0cnVjdCBkcm1fY3J0Y19z
dGF0ZSAqY3J0Y19zdCA9ICZrY3J0Y19zdC0+YmFzZTsKPiAgCXN0cnVjdCBrb21lZGFfY29tcG9u
ZW50X3N0YXRlICpjX3N0Owo+ICAJc3RydWN0IGtvbWVkYV9pbXByb2Nfc3RhdGUgKnN0Owo+ICAK
PiBAQCAtNzU2LDYgKzc1NywyMyBAQCBrb21lZGFfaW1wcm9jX3ZhbGlkYXRlKHN0cnVjdCBrb21l
ZGFfaW1wcm9jICppbXByb2MsCj4gIAlzdC0+aHNpemUgPSBkZmxvdy0+aW5fdzsKPiAgCXN0LT52
c2l6ZSA9IGRmbG93LT5pbl9oOwo+ICAKPiArCWlmIChkcm1fYXRvbWljX2NydGNfbmVlZHNfbW9k
ZXNldChjcnRjX3N0KSkgewo+ICsJCXUzMiBvdXRwdXRfZGVwdGhzOwo+ICsJCXUzMiBhdmFpbF9k
ZXB0aHM7Cj4gKwo+ICsJCWtvbWVkYV9jcnRjX2dldF9jb2xvcl9jb25maWcoY3J0Y19zdCwgJm91
dHB1dF9kZXB0aHMpOwo+ICsKPiArCQlhdmFpbF9kZXB0aHMgPSBvdXRwdXRfZGVwdGhzICYgaW1w
cm9jLT5zdXBwb3J0ZWRfY29sb3JfZGVwdGhzOwo+ICsJCWlmIChhdmFpbF9kZXB0aHMgPT0gMCkg
ewo+ICsJCQlEUk1fREVCVUdfQVRPTUlDKCJObyBhdmFpbGFibGUgY29sb3IgZGVwdGhzLCBjb25u
IGRlcHRoczogMHgleCAmIGRpc3BsYXk6IDB4JXhcbiIsCj4gKwkJCQkJIG91dHB1dF9kZXB0aHMs
Cj4gKwkJCQkJIGltcHJvYy0+c3VwcG9ydGVkX2NvbG9yX2RlcHRocyk7Cj4gKwkJCXJldHVybiAt
RUlOVkFMOwo+ICsJCX0KPiArCj4gKwkJc3QtPmNvbG9yX2RlcHRoID0gX19mbHMoYXZhaWxfZGVw
dGhzKTsKPiArCX0KPiArCj4gIAlrb21lZGFfY29tcG9uZW50X2FkZF9pbnB1dCgmc3QtPmJhc2Us
ICZkZmxvdy0+aW5wdXQsIDApOwo+ICAJa29tZWRhX2NvbXBvbmVudF9zZXRfb3V0cHV0KCZkZmxv
dy0+aW5wdXQsICZpbXByb2MtPmJhc2UsIDApOwo+ICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYwo+IGluZGV4
IDI4NTFjYWM5NGQ4Ni4uNzQwYTgxMjUwNjMwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMKPiBAQCAt
MTQyLDYgKzE0Miw3IEBAIHN0YXRpYyBpbnQga29tZWRhX3diX2Nvbm5lY3Rvcl9hZGQoc3RydWN0
IGtvbWVkYV9rbXNfZGV2ICprbXMsCj4gIAlzdHJ1Y3Qga29tZWRhX2RldiAqbWRldiA9IGttcy0+
YmFzZS5kZXZfcHJpdmF0ZTsKPiAgCXN0cnVjdCBrb21lZGFfd2JfY29ubmVjdG9yICprd2JfY29u
bjsKPiAgCXN0cnVjdCBkcm1fd3JpdGViYWNrX2Nvbm5lY3RvciAqd2JfY29ubjsKPiArCXN0cnVj
dCBkcm1fZGlzcGxheV9pbmZvICppbmZvOwo+ICAJdTMyICpmb3JtYXRzLCBuX2Zvcm1hdHMgPSAw
Owo+ICAJaW50IGVycjsKPiAgCj4gQEAgLTE3MSw2ICsxNzIsOSBAQCBzdGF0aWMgaW50IGtvbWVk
YV93Yl9jb25uZWN0b3JfYWRkKHN0cnVjdCBrb21lZGFfa21zX2RldiAqa21zLAo+ICAKPiAgCWRy
bV9jb25uZWN0b3JfaGVscGVyX2FkZCgmd2JfY29ubi0+YmFzZSwgJmtvbWVkYV93Yl9jb25uX2hl
bHBlcl9mdW5jcyk7Cj4gIAo+ICsJaW5mbyA9ICZrd2JfY29ubi0+YmFzZS5iYXNlLmRpc3BsYXlf
aW5mbzsKPiArCWluZm8tPmJwYyA9IF9fZmxzKGtjcnRjLT5tYXN0ZXItPmltcHJvYy0+c3VwcG9y
dGVkX2NvbG9yX2RlcHRocyk7Cj4gKwo+ICAJa2NydGMtPndiX2Nvbm4gPSBrd2JfY29ubjsKPiAg
Cj4gIAlyZXR1cm4gMDsKPiAKClJldmlld2VkLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwu
YXRhbmFzc292QGFybS5jb20+CgotLSAKTWloYWlsCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
