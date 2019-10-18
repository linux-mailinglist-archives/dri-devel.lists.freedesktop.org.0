Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 398A0DC0EF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 11:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4536E060;
	Fri, 18 Oct 2019 09:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150049.outbound.protection.outlook.com [40.107.15.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2446E060
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 09:30:33 +0000 (UTC)
Received: from VI1PR08CA0218.eurprd08.prod.outlook.com (2603:10a6:802:15::27)
 by AM0PR08MB4948.eurprd08.prod.outlook.com (2603:10a6:208:163::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 18 Oct
 2019 09:30:29 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::204) by VI1PR08CA0218.outlook.office365.com
 (2603:10a6:802:15::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 18 Oct 2019 09:30:29 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 18 Oct 2019 09:30:27 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Fri, 18 Oct 2019 09:30:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1045642e34c096b1
X-CR-MTA-TID: 64aa7808
Received: from 6312e6fad71b.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C633BFF0-38A8-4B34-9E6B-B76729B49A19.1; 
 Fri, 18 Oct 2019 09:30:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6312e6fad71b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Oct 2019 09:30:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y530bNxIVPplknihrT/MYZC46BKAiSn1BlRU+7O6VLzU3uEwYj4TEcFegC4s+0KSerihvA6WHqFnhY/H3ov2M3XG3a/kpsFvpY/A0gGSo+R/7e5jIARqKbaWEhNPkqpaul6ABagiCem8IImRQR5xCDElDmEJdJazBhBG0XnKvVPlCAguGbVbSS1hGuacvjsLeISwUqJhzwImbAfvjnWqfj7BhxcIQtGVKYMS1GgX43mWYjqSQNCs6CvsiMF4a/ycm2s4HulwBKKSMWzpQDUc6DgM7sDtNn3k4QKRHXEV3KUrbO2/hJc51dqpL0YX4Sk+GpMSYLJWZGa1S2rnaRe72Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5foMB7HxV+Jsn5OCccMwSBlv9vljQyjtu7dKK0/hr68=;
 b=HBU+F26XUx42xsQzZihWItUGGH1LG2jTTLwdix2qx1l3KcVpXz3wV9VKU98/Opl2AHWrkbj6T259Hasp5CbtrCIBxTZuKWDQNw8413AGH07rAODeIwE0Z2VZFCADWtYY4pwjbcTz+gHxOwFWldzulVnyRxWqtOlg0+qy9MKrntwZysYOkpuUBKPhY26PreCiYgaX8D3GVyomVoI2wMTMttyh3pw1x4hmQwS0G6hYl6psrJh7W7yKMZbwBXcSQWS+uEBqEbIMWMMSSAEmi1JvHc+U3eK1xM1MPdznMeMLwy5M0oM/6bR5AWp8qCullvloRF7LXICXa77A9DrcPuZm3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2864.eurprd08.prod.outlook.com (10.175.243.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Fri, 18 Oct 2019 09:30:11 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2347.024; Fri, 18 Oct 2019
 09:30:11 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH v5 1/4] drm: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Topic: [PATCH v5 1/4] drm: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Index: AQHVhA1Dae0PEifxdEmUeEe4shI0vKddKu6AgALekoCAABupgA==
Date: Fri, 18 Oct 2019 09:30:11 +0000
Message-ID: <4381055.oiViQHVQgJ@e123338-lin>
References: <20191016103339.25858-1-james.qian.wang@arm.com>
 <2404938.QDdPyV61sH@e123338-lin> <20191018075101.GA19928@jamwan02-TSP300>
In-Reply-To: <20191018075101.GA19928@jamwan02-TSP300>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.51]
x-clientproxiedby: LO2P265CA0338.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::14) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d6978d5a-f189-469a-a17a-08d753adcfc5
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB2864:|VI1PR08MB2864:|AM0PR08MB4948:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB4948D73002334CC795ECD1E98F6C0@AM0PR08MB4948.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 01949FE337
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(346002)(136003)(39860400002)(366004)(396003)(376002)(189003)(199004)(6436002)(6636002)(256004)(7736002)(9686003)(66066001)(229853002)(305945005)(6512007)(6246003)(33716001)(14454004)(5660300002)(478600001)(316002)(54906003)(6486002)(14444005)(52116002)(66946007)(66446008)(6116002)(66556008)(71190400001)(71200400001)(76176011)(386003)(6506007)(26005)(186003)(8676002)(81156014)(11346002)(486006)(86362001)(99286004)(476003)(64756008)(6862004)(25786009)(4326008)(8936002)(102836004)(66476007)(2906002)(81166006)(3846002)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2864;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: RT7sMBE4lnHF6lkJ5W6A1qDI0+lJSKnd//8BIrijHfMSbQWGxTIHzeQ88vlcSozbU+WDx1sIX4NsOkW9Rx6UY47eKv1wRpD5Tr2UxQ/EFBSjbzPFVffHQPpIjlubH4J6qBH9Q26FiwSD2uT2+ePgczwnliPop50M4m+nHnlkvXkfnwnoqng6KPpOYd+yIxfgHwOws/KkaRwitaA019wlswzQXCQJuTnidDWiuOF8faYlXLUH4ZB/sZSLNVibCxREhmtwVIsc+SnzrU4/N2yE2uA8NYNT8+hZQX2k3exFJ0PFvYO+OR3dIQFKcR7sWiQAl+QzkHl0CUqGeORwE39IXp2s+ZomRu4seKrWJThHw6KXuSYc/7NPa9iQXgMMz706ZWpocu8WAc2hmuWF1j9fs4uwrTGBBBr4dr331FqmGXg=
Content-ID: <FFA6730941821047B99D83655A1352B2@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2864
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(136003)(396003)(376002)(346002)(39860400002)(199004)(189003)(99286004)(33716001)(2906002)(47776003)(6486002)(76176011)(26005)(5660300002)(356004)(66066001)(70586007)(70206006)(8746002)(26826003)(76130400001)(8936002)(14454004)(478600001)(6506007)(386003)(9686003)(6512007)(25786009)(229853002)(7736002)(305945005)(102836004)(46406003)(86362001)(186003)(81156014)(81166006)(22756006)(50466002)(4326008)(11346002)(446003)(63350400001)(97756001)(336012)(486006)(8676002)(316002)(36906005)(54906003)(6862004)(476003)(126002)(107886003)(6636002)(6246003)(3846002)(23726003)(6116002)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4948;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0bba1a9b-4ae8-47c3-16f6-08d753adc5ce
NoDisclaimer: True
X-Forefront-PRVS: 01949FE337
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i1DW8Lyqp4gqARWklORJcvPcYH95ujexD1eM/Djf1D5aHZNxSkc2DfMFvZ8irOkV/S9kxo7RKSzCEJkTYqLaC8Q9i32DPDBzkqj3J0UhPzYyTwvk+JoPmPFDOkE8iWrfkwOhOWmDq4jvnlOPvE1/K7NfLZLTjSLR5G9Xi/fvT/1gRJZIpTDV0fansV4EI9fxnjWywnl/h8DaJbp9I+Wusfbh/rNtfQkHpaXIAI5Sc/N4bKpXS2XXeY1CTMj/9CUP/cz9D3xCc4BGszh3SwV3GPNzTqT4ax5ANh5TXIcMwteo6LGO2vTZStw+S4Zyf5vY4pOtukW7cYxflB5c8n51U3XLKoIsbgaJj0BnaisZ0Yymy1ZD5FKlOPMEuTbr+QZ+DvxA3C5EsH5baKJ6nf9K8l87uY2n/5aHyHhjd9pS5Ig=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2019 09:30:27.5757 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6978d5a-f189-469a-a17a-08d753adcfc5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4948
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5foMB7HxV+Jsn5OCccMwSBlv9vljQyjtu7dKK0/hr68=;
 b=X1tlgdFWgz/4JxM40StXGO4n+1h/iZPZLh4UwZo+EcQ5rNKTagz5UVvjUbBpJrNA90g4rPFoYMOijX5i0uWP7WNEEPMKIkk7NMzkfVgoFTPKM8vbhV79QUwUuixesVt+qUZ9sQ94bkNPaJy7cmMNKuteyFOXprZQbgLaRFU7Afw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5foMB7HxV+Jsn5OCccMwSBlv9vljQyjtu7dKK0/hr68=;
 b=X1tlgdFWgz/4JxM40StXGO4n+1h/iZPZLh4UwZo+EcQ5rNKTagz5UVvjUbBpJrNA90g4rPFoYMOijX5i0uWP7WNEEPMKIkk7NMzkfVgoFTPKM8vbhV79QUwUuixesVt+qUZ9sQ94bkNPaJy7cmMNKuteyFOXprZQbgLaRFU7Afw=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 Ben Davis <Ben.Davis@arm.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpZGF5LCAxOCBPY3RvYmVyIDIwMTkgMDg6NTE6MDkgQlNUIGphbWVzIHFpYW4gd2FuZyAo
QXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+IE9uIFdlZCwgT2N0IDE2LCAyMDE5IGF0IDEx
OjAyOjAzQU0gKzAwMDAsIE1paGFpbCBBdGFuYXNzb3Ygd3JvdGU6Cj4gPiBPbiBXZWRuZXNkYXks
IDE2IE9jdG9iZXIgMjAxOSAxMTozNDowOCBCU1QgamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5v
bG9neSBDaGluYSkgd3JvdGU6Cj4gPiA+IEFkZCBhIG5ldyBoZWxwZXIgZnVuY3Rpb24gZHJtX2Nv
bG9yX2N0bV9zMzFfMzJfdG9fcW1fbigpIGZvciBkcml2ZXIgdG8KPiA+ID4gY29udmVydCBTMzEu
MzIgc2lnbi1tYWduaXR1ZGUgdG8gUW0ubiAyJ3MgY29tcGxlbWVudCB0aGF0IHN1cHBvcnRlZCBi
eQo+ID4gPiBoYXJkd2FyZS4KPiA+ID4gCj4gPiA+IFY0OiBBZGRyZXNzIE1paGFpLCBEYW5pZWwg
YW5kIElsaWEncyByZXZpZXcgY29tbWVudHMuCj4gPiA+IFY1OiBJbmNsdWRlcyB0aGUgc2lnbiBi
aXQgaW4gdGhlIHZhbHVlIG9mIG0gKFFtLm4pLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTog
amFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bh
cm0uY29tPgo+ID4gPiBSZXZpZXdlZC1ieTogTWloYWlsIEF0YW5hc3NvdiA8bWloYWlsLmF0YW5h
c3NvdkBhcm0uY29tPgo+ID4gPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9y
X21nbXQuYyB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiAgaW5jbHVkZS9k
cm0vZHJtX2NvbG9yX21nbXQuaCAgICAgfCAgMiArKwo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAy
OSBpbnNlcnRpb25zKCspCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9jb2xvcl9tZ210LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9yX21nbXQuYwo+ID4g
PiBpbmRleCA0Y2U1YzZkOGRlOTkuLmQzMTNmMTk0ZjFlYyAxMDA2NDQKPiA+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9jb2xvcl9tZ210LmMKPiA+ID4gQEAgLTEzMiw2ICsxMzIsMzMgQEAgdWludDMyX3QgZHJt
X2NvbG9yX2x1dF9leHRyYWN0KHVpbnQzMl90IHVzZXJfaW5wdXQsIHVpbnQzMl90IGJpdF9wcmVj
aXNpb24pCj4gPiA+ICB9Cj4gPiA+ICBFWFBPUlRfU1lNQk9MKGRybV9jb2xvcl9sdXRfZXh0cmFj
dCk7Cj4gPiA+ICAKPiA+ID4gKy8qKgo+ID4gPiArICogZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9f
cW1fbgo+ID4gPiArICoKPiA+ID4gKyAqIEB1c2VyX2lucHV0OiBpbnB1dCB2YWx1ZQo+ID4gPiAr
ICogQG06IG51bWJlciBvZiBpbnRlZ2VyIGJpdHMsIGluY2x1ZGUgdGhlIHNpZ24tYml0LCBzdXBw
b3J0IHJhbmdlIGlzIFsxLCAzMl0KPiA+IAo+ID4gQW55IHJlYXNvbiB3aHkgbnVtYmVycyBsaWtl
IFEwLjMyIGFyZSBkaXNhbGxvd2VkPyBJbiB0aG9zZSBjYXNlcywgdGhlCj4gPiAnc2lnbicgYml0
IGFuZCB0aGUgZmlyc3QgZnJhY3Rpb25hbCBiaXQganVzdCBoYXBwZW4gdG8gYmUgdGhlIHNhbWUg
Yml0Lgo+ID4gVGhlIGxvbmdlciBJIGxvb2sgYXQgaXQsIHRoZSBtb3JlIEkgdGhpbmsgbWVudGlv
bmluZyBhICdzaWduLWJpdCcgaGVyZQo+ID4gbWlnaHQgY29uZnVzZSBwZW9wbGUgbW9yZSwgc2lu
Y2UgMidzIGNvbXBsZW1lbnQgZG9lc24ndCBoYXZlIGEKPiA+IGRlZGljYXRlZCBiaXQganVzdCBm
b3IgdGhlIHNpZ24uIEhvdyBhYm91dCByZWR1Y2luZyBpdCBzaW1wbHkgdG86Cj4gCj4gTm8sIHNp
bmNlIHRoZSB2YWx1ZSBpcyBzaWduZWQgdGhlcmUgbXVzdCBiZSBkZWRpY2F0ZWQgc2lnbi1iaXQu
CgpBcyBJJ3ZlIHNhaWQgYSBmZXcgdGltZXMgYmVmb3JlIGluIHRoaXMgcmV2aWV3LCAyJ3MgY29t
cGxlbWVudCBoYXMgbm8KZGVkaWNhdGVkIHNpZ24gYml0LCB0aGF0J3MgdGhlIHdob2xlIHJlYXNv
biAyJ3MgY29tcGxlbWVudCBleGlzdHMgaW4KdGhlIGZpcnN0IHBsYWNlLiBUaGUgc2lnbiBpcyBp
bXBsZW1lbnRlZCBieSBuZWdhdGluZyB0aGUgd2VpZ2h0IG9mCnRoZSBtb3N0IHNpZ25pZmljYW50
IGJpdC4gVGhpcyBpc24ndCBhIGRlZGljYXRlZCArLy0gZmllbGQhCgo+IAo+IGNvbnNpZGVyIHZl
cnkgc2ltcGxlIDIgYml0IHNpZ25lZCwgUTEuMQo+IAo+ICAwLjUgIGlzIDAxCj4gIDAgICAgaXMg
MDAKPiAtMC41ICBpcyAxMQo+IC0xLjAgIGlzIDEwLCBzaWduLWJpdCBhbmQgdmFsdWUgc2hhcmUg
c2FtZSBiaXQsIGJ1dCBpdCBpcyBpbnRlZ2VyIHBhcnQuCgpBbmQgYSB2ZXJ5IHNpbXBsZSAyLWJp
dCBzaWduZWQgUTAuMiB3b3VsZCBsb29rIGxpa2UgdGhpczoKCndlaWdodHM6ICgtMl4tMSkqYjEg
KyAoMl4tMikqYjAKICAgICAgICAgIF4KICAgICAgICAgIEwtPiBub3RlIG5lZ2F0aXZlIHdlaWdo
dCBhdCBtb3N0IHNpZ25pZmljYW50IGJpdCBwb3NpdGlvbgoKKy0tLS0tLS0tLS0tLS0rLS0tLS0t
LS0tLS0tLS0tKwovIGJpdCBwYXR0ZXJuIHwgZGVjaW1hbCB2YWx1ZSB8CistLS0tLS0tLS0tLS0t
Ky0tLS0tLS0tLS0tLS0tLSsKXCAgICAgMDAgICAgICB8ICAgICAwLjAgICAgICAgfAovICAgICAw
MSAgICAgIHwgICAgIDAuMjUgICAgICB8ClwgICAgIDEwICAgICAgfCAgICAtMC41ICAgICAgIHwK
LyAgICAgMTEgICAgICB8ICAgIC0wLjI1ICAgICAgfAorLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0t
LS0tLS0rCgooQXBvbG9naWVzIGZvciB0aGUgcmFnZ2VkIGxlZnQgYm9yZGVyIG9uIHRoZSB0YWJs
ZSA6LykKCkkgZ2VudWluZWx5IGRvbid0IHNlZSB3aHkgeW91IHJlYWxseSB3YW50IHRvIGhhdmUg
dGhhdCBpbnRlZ2VyIHBhcnQgYmUKc3RyaWN0bHkgbm9uLXplcm8gaW4gc2l6ZSwgaXQgY2FuIHZl
cnkgd2VsbCBiZSBhbGwgZnJhY3Rpb25hbC4KCj4gCj4gU2VlIHRoZSB3aWtpOgo+IAo+IE9uZSBj
b252ZW50aW9uIGluY2x1ZGVzIHRoZSBzaWduIGJpdCBpbiB0aGUgdmFsdWUgb2YgbSxbMV1bMl0g
YW5kIHRoZSBvdGhlciBjb252ZW50aW9uCj4gZG9lcyBub3QuIFRoZSBjaG9pY2Ugb2YgY29udmVu
dGlvbiBjYW4gYmUgZGV0ZXJtaW5lZCBieSBzdW1taW5nIG0rbi4gSWYgdGhlIHZhbHVlIGlzIGVx
dWFsCj4gdG8gdGhlIHJlZ2lzdGVyIHNpemUsIHRoZW4gdGhlIHNpZ24gYml0IGlzIGluY2x1ZGVk
IGluIHRoZSB2YWx1ZSBvZiBtLiBJZiBpdCBpcyBvbmUKPiBsZXNzIHRoYW4gdGhlIHJlZ2lzdGVy
IHNpemUsIHRoZSBzaWduIGJpdCBpcyBub3QgaW5jbHVkZWQgaW4gdGhlIHZhbHVlIG9mIG0uCgpU
aGlzIGlzIHZlcnkgbXVjaCBvZmYgdGhlIG1hcmsuIFNlZSBhYm92ZSBmb3IgbXkgc2lnbiBiaXQg
aW4gMidzCmNvbXBsZW1lbnQgcmFudC4gV2l0aCB0aGF0IGNhdmVhdCwgd2hhdCB5b3UgcmVmZXIg
dG8gYXMgdGhlIHNpZ24KYml0IGlzIHNpbXBseSB0aGUgdG9wIGJpdC4gSWYgbStuIGlzIDE2LCB0
aGVuIHdoYXQgeW91IHJlZmVyIHRvIGFzCnRoZSBzaWduIGJpdCBpcyBpbiBiaXQgcG9zaXRpb24g
MTUgd2l0aCBhIHdlaWdodCBvZiAtMl4obS0xKS4gSWYKbStuIGlzIGluc3RlYWQgMTMsIHRoZW4g
YWxsIHRoYXQgY2hhbmdlcyBpcyB0aGF0IHRoZSBiaXQgd2l0aCB0aGUKd2VpZ2h0IG9mIC0yXiht
LTEpIGlzIGF0IHBvc2l0aW9uIDEyLgoKTW9zdCBpbXBvcnRhbnRseSwgdGhlcmUgaXMgbm90aGlu
ZyBzcGVjaWFsIGFib3V0IG0gKyBuID09IHJlZ3NpemUsCnRoZSBsYWNrIG9mIHNpZ24tZXh0ZW5z
aW9uIGFzaWRlLgoKV2hhdCBJIHRoaW5rIGlzIHRoZSBzb3VyY2Ugb2YgY29uZnVzaW9uIGlzIHRo
YXQgd2hlbiB5b3UgZXhwYW5kLCBzYXksClE0LjQgaW50byBhIFE4LjgsIHlvdSBuZWVkIHRvIGRv
IHNpZ24gZXh0ZW5zaW9uLCBzbyBiaXQgcG9zaXRpb24gNwppbiB0aGUgb3JpZ2luYWwgUTQuNCBu
ZWVkcyB0byBiZSByZXBsaWNhdGVkIGludG8gcG9zaXRpb25zIDEyLTE1IGluCmFkZGl0aW9uIHRv
IG1vdmluZyBpdCB0byBwb3NpdGlvbiAxMSBpbiB0aGUgZGVzdGluYXRpb24gZm9ybWF0LiBCdXQK
dGhlbiB0aG9zZSBhcmUgbm8gbG9uZ2VyIHNpZ24gYml0cywgdGhlIHNpZ25lZG5lc3MgaXMgZW5j
b2RlZCBpbiBiaXQKMTUgYXMgYSB3ZWlnaHQgb2YgLTJeNyA6KS4KCj4gCj4gU28gZm9yIHRoZSAz
MmJpdCB2YWx1ZSwgYWxsIGZyYWN0aW9uYWw6Cj4gCj4gYSkgTSBpbmNsdWRlIHNpZ24tYml0OiBR
MS4zMQoKVGhpcyBpcyBhIDMyLWJpdCBudW1iZXIgd2l0aCByYW5nZSBbLTEsIDEgLSAyXi0zMV0g
YW5kIHByZWNpc2lvbiAyXi0zMS4KVGhlIHdlaWdodCBvZiBiaXQgMzEgaXMgc2ltcGx5IC0yXjAg
KGkuZS4gLTEpLiBUaGlzIGhhcyAxIGludGVnZXIgYml0LgoKPiBiKSBNIGRvZXNuJ3QgaW5jbHVk
ZSBzaWduLWJpdDogUTAuMzEKClRoaXMgaXMgYSAzMS1iaXQgbnVtYmVyIHdpdGggcmFuZ2UgWy0w
LjUsIDEgLSAyXi0zMV0uIFNhbWUgcHJlY2lzaW9uIGFzCmFib3ZlIGJ1dCBzbWFsbGVyIHJhbmdl
LiBUaGlzIGlzIGFsbCBmcmFjdGlvbmFsIGJ1dCBub3QgYSAzMi1iaXQgdmFsdWUuCkkgdGhpbmsg
eW91J3JlIGxvb2tpbmcgZm9yIFEwLjMyLCB3aGljaCBoYXMgYWxtb3N0IHRoZSBzYW1lIHJhbmdl
IGJ1dApkb3VibGUgdGhlIHByZWNpc2lvbi4KCj4gCj4gPiAKPiA+ICAqIEBtOiBudW1iZXIgb2Yg
aW50ZWdlciBiaXRzLCBtIDw9IDMyLgo+ID4gCj4gPiA+ICsgKiBAbjogbnVtYmVyIG9mIGZyYWN0
aW9uYWwgYml0cywgb25seSBzdXBwb3J0IG4gPD0gMzIKPiA+ID4gKyAqCj4gPiA+ICsgKiBDb252
ZXJ0IGFuZCBjbGFtcCBTMzEuMzIgc2lnbi1tYWduaXR1ZGUgdG8gUW0ubiAoc2lnbmVkIDIncyBj
b21wbGVtZW50KS4gVGhlCj4gPiA+ICsgKiBoaWdoZXIgYml0cyB0aGF0IGFib3ZlIG0gKyBuIGFy
ZSBjbGVhcmVkIG9yIGVxdWFsIHRvIHNpZ24tYml0IEJJVChtK24pLgo+ID4gCj4gPiBbbml0XSBC
SVQobSArIG4gLSAxKSBpZiB3ZSBjb3VudCBmcm9tIDAuCj4gCj4gZG8gd2UgcmVhbCBuZWVkIHRv
IGNvbnNpZGVyIHRoaXMsIGNvbnZlcnQgdG8gKFExLjApIDopCj4gSSB0aGluayBpdCBjYW4gYmUg
ZWFzaWx5IGNhdWdodCBieSByZXZpZXcuCgpRMS4wIGhhcyBhIHJhbmdlIG9mIFstMSwgMF0gYW5k
IHByZWNpc2lvbiBvZiAxLCBidXQgSSBkb24ndCBnZXQgaG93CnRoaXMgaXMgcmVsZXZhbnQuIEkg
d2FzIGp1c3QgcmVmZXJyaW5nIHRvIGNvbnZlbnRpb24gdGhhdCBiaXRzIGdldApjb3VudGVkIGZy
b20gMCwgc28gdGhlIG1vc3Qgc2lnbmlmaWNhbnQgYml0IGlzIHNpbXBseSBhdCBwb3NpdGlvbgpt
ICsgbiAtIDEgYW5kIG5vdCBtICsgbi4KbSArIG4gaW4sIHNheSwgUTE2LjE2IHdvdWxkIGJlIGJp
dCAzMiwgd2hpY2ggaXMganVzdCBwYXN0IHRoZSB2YWxpZApbMC4uMzFdIGJpdHMuCgpJIHdhcyBo
b3BpbmcgdGhhdCBieSBleHBsaWNpdGx5IHRhZ2dpbmcgdGhlIGNvbW1lbnQgd2l0aCAnW25pdF0n
IHdvdWxkCmhlbHAgY29udmV5IGl0cyBsb3cgaW1wb3J0YW5jZSA6KS4KCj4gPiAKPiA+ID4gKyAq
Lwo+ID4gPiArdWludDY0X3QgZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9fcW1fbih1aW50NjRfdCB1
c2VyX2lucHV0LAo+ID4gPiArCQkJCSAgICAgIHVpbnQzMl90IG0sIHVpbnQzMl90IG4pCj4gPiA+
ICt7Cj4gPiA+ICsJdTY0IG1hZyA9ICh1c2VyX2lucHV0ICYgfkJJVF9VTEwoNjMpKSA+PiAoMzIg
LSBuKTsKPiA+ID4gKwlib29sIG5lZ2F0aXZlID0gISEodXNlcl9pbnB1dCAmIEJJVF9VTEwoNjMp
KTsKPiA+ID4gKwlzNjQgdmFsOwo+ID4gPiArCj4gPiA+ICsJV0FSTl9PTihtIDwgMSB8fCBtID4g
MzIgfHwgbiA+IDMyKTsKPiA+ID4gKwo+ID4gPiArCS8qIHRoZSByYW5nZSBvZiBzaWduZWQgMidz
IGNvbXBsZW1lbnQgaXMgWy0yXihtLTEpLCAyXihtLTEpIC0gMl4tbl0gKi8KPiA+ID4gKwl2YWwg
PSBjbGFtcF92YWwobWFnLCAwLCBuZWdhdGl2ZSA/Cj4gPiA+ICsJCQkJQklUX1VMTChuICsgbSAt
IDEpIDogQklUX1VMTChuICsgbSAtIDEpIC0gMSk7Cj4gPiA+ICsKPiA+ID4gKwlyZXR1cm4gbmVn
YXRpdmUgPyAtdmFsIDogdmFsOwo+ID4gPiArfQo+ID4gPiArRVhQT1JUX1NZTUJPTChkcm1fY29s
b3JfY3RtX3MzMV8zMl90b19xbV9uKTsKPiA+ID4gKwo+ID4gPiAgLyoqCj4gPiA+ICAgKiBkcm1f
Y3J0Y19lbmFibGVfY29sb3JfbWdtdCAtIGVuYWJsZSBjb2xvciBtYW5hZ2VtZW50IHByb3BlcnRp
ZXMKPiA+ID4gICAqIEBjcnRjOiBEUk0gQ1JUQwo+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
cm0vZHJtX2NvbG9yX21nbXQuaCBiL2luY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmgKPiA+ID4g
aW5kZXggZDFjNjYyZDkyYWI3Li42MGZlYTU1MDE4ODYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2luY2x1
ZGUvZHJtL2RybV9jb2xvcl9tZ210LmgKPiA+ID4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2NvbG9y
X21nbXQuaAo+ID4gPiBAQCAtMzAsNiArMzAsOCBAQCBzdHJ1Y3QgZHJtX2NydGM7Cj4gPiA+ICBz
dHJ1Y3QgZHJtX3BsYW5lOwo+ID4gPiAgCj4gPiA+ICB1aW50MzJfdCBkcm1fY29sb3JfbHV0X2V4
dHJhY3QodWludDMyX3QgdXNlcl9pbnB1dCwgdWludDMyX3QgYml0X3ByZWNpc2lvbik7Cj4gPiA+
ICt1aW50NjRfdCBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKHVpbnQ2NF90IHVzZXJfaW5w
dXQsCj4gPiA+ICsJCQkJICAgICAgdWludDMyX3QgbSwgdWludDMyX3Qgbik7Cj4gPiA+ICAKPiA+
ID4gIHZvaWQgZHJtX2NydGNfZW5hYmxlX2NvbG9yX21nbXQoc3RydWN0IGRybV9jcnRjICpjcnRj
LAo+ID4gPiAgCQkJCXVpbnQgZGVnYW1tYV9sdXRfc2l6ZSwKPiA+ID4gCj4gPiAKPiA+IAo+IAoK
Ci0tIApNaWhhaWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
