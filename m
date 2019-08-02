Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FE57F101
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 11:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CBF6ED7F;
	Fri,  2 Aug 2019 09:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::622])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFDDD6ED7F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 09:35:03 +0000 (UTC)
Received: from DB6PR0802CA0034.eurprd08.prod.outlook.com (2603:10a6:4:a3::20)
 by AM0PR08MB4945.eurprd08.prod.outlook.com (2603:10a6:208:157::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.14; Fri, 2 Aug
 2019 09:34:59 +0000
Received: from VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::209) by DB6PR0802CA0034.outlook.office365.com
 (2603:10a6:4:a3::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.12 via Frontend
 Transport; Fri, 2 Aug 2019 09:34:58 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT059.mail.protection.outlook.com (10.152.19.60) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Fri, 2 Aug 2019 09:34:57 +0000
Received: ("Tessian outbound 40a263b748b4:v26");
 Fri, 02 Aug 2019 09:34:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 70049f393c129473
X-CR-MTA-TID: 64aa7808
Received: from b5195ec63c2e.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D6D64A20-04AF-44B9-B404-F18AEDD7E0C5.1; 
 Fri, 02 Aug 2019 09:34:51 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b5195ec63c2e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Aug 2019 09:34:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cflkuyaqJ1SAaojt8v1OnNJGUoDg/yeedXrYMydp/qohdaty05A8Ky0Csc2A7iHNY5B0R2qL6ANqsz/eSntBKn66C8u0u4qXkNWScKbWdqe8boExhJemgkky0LjKDVHihrC5xCHalhghq354h+Ccq5TwfJbHPR/JZawKY3TpG46PSfs0Sx1joeom3t8dvcjlnGwfyxw9/0UigR7k7EP/2Ajekvqns59uAyErabcRJeHbN2iO5Tdsh+BFqG1E5C3R+NugsN7PXDnsRBl3Ca6MC2xHkk3D3Xun87zGba4lKXbcpZTrAVjYsapL8IYyjdGfogrnn8KvtRr8zJc87AOx/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=df3DVkSvHaOOIHI3WAVoIFllnA87gGMgY2Evu1hPW2w=;
 b=FBTb6l9JrdYduV/1ddLXHzx+jxI1Euv81S7NeHXWoghls56heN+Y6QVnbw/ukReJvqXeAB7H3F6z2z2khrbfgU27FxiMrP4GFnbZorwePvItQV6mqckUUIj04dH04WYxBMBrsMMio6laryVn7r89TCQfVZQeHMrm85tPVX+GVo8pwPN0M71aRcMulK3nJMlyv76erbWno6tUJlTHIBQnz6vUioLuIvTGT5zT6cmw+KdyLOHjDt6nSOupsg+PWW7zNBHB9Z2YP7ZuAylLc5PDSH0yCmogOPqZJDqUGvPVs8zxNDMqd423vcgXMLzTASqTgi2O3M7uwNXAflCXd+g0nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB5504.eurprd08.prod.outlook.com (52.133.246.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Fri, 2 Aug 2019 09:34:49 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236%2]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 09:34:49 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH] drm/komeda: Adds error event print functionality
Thread-Topic: [PATCH] drm/komeda: Adds error event print functionality
Thread-Index: AQHVSF13B+//d/diR06VTAGnMwmj+KbmX7KAgAE6mIA=
Date: Fri, 2 Aug 2019 09:34:48 +0000
Message-ID: <20190802093441.GA4926@lowry.li@arm.com>
References: <1564659415-14548-1-git-send-email-lowry.li@arm.com>
 <3215981.n852bepVxH@e123338-lin>
In-Reply-To: <3215981.n852bepVxH@e123338-lin>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.5.21 (2010-09-15)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0302CA0024.apcprd03.prod.outlook.com
 (2603:1096:202::34) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d6e87a3f-7f7e-45f0-2962-08d7172caeb8
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB5504; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB5504:|AM0PR08MB4945:
X-Microsoft-Antispam-PRVS: <AM0PR08MB494542BD035E9846EB14DA229FD90@AM0PR08MB4945.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 011787B9DD
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(189003)(199004)(6486002)(14454004)(5660300002)(6116002)(305945005)(66066001)(7736002)(2906002)(1076003)(54906003)(58126008)(3846002)(6512007)(99286004)(9686003)(102836004)(61793004)(8936002)(386003)(76176011)(53936002)(52116002)(6506007)(26005)(55236004)(186003)(256004)(8676002)(81166006)(86362001)(486006)(446003)(14444005)(81156014)(33656002)(6862004)(66556008)(66476007)(66946007)(66446008)(476003)(11346002)(71190400001)(71200400001)(6636002)(4326008)(36756003)(6436002)(64756008)(68736007)(6246003)(478600001)(25786009)(229853002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB5504;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: s0TYpRnGU2rsBlucduTfPltZ7OtJoFb2hit+8yaqEwaDwO24wf5cN8BPCsOVSFXrjB1JqMCba3NwfGW5M2TgYmYA0JuoMvJOw/Lm2EjE5aZ9CdDd4L7OCRBsSK/6XasCvLK3YE6YtfyUyNaTGpU3EJ0TuwmTnjf6OHw2wAKUNUZQguRtomrRL7QxkR+sV8wDt8fxXkmQmce5W1a2SA0Ug+xXphwenHP0lfOVkOakf8BZo7waJ3bH0XJAR1ZnTgPh92806Dp/xjViNkZhvxWh8T5OC3h2HyQzlz4MuYK9nSOX34rcJ6MjeIdGJxZoMBVGtWZQ7n5XswWKJSasyKwM8ESnRvkEAZAOIO48W/LjHaWR3E0Q+5TNXe4ofiJRJULbGG2rQT4PG02W6ZdmsDO4O0v8+mqOjiHsM0B30BqlFM8=
Content-ID: <CF95AE0BE8BB764A95907C219997F866@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5504
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(136003)(2980300002)(189003)(199004)(5660300002)(6862004)(6246003)(316002)(356004)(6636002)(305945005)(6486002)(33656002)(36906005)(4326008)(25786009)(229853002)(26826003)(446003)(46406003)(11346002)(63350400001)(478600001)(99286004)(22756006)(8676002)(126002)(23726003)(486006)(476003)(336012)(63370400001)(14454004)(70586007)(8936002)(70206006)(2906002)(76176011)(14444005)(81156014)(50466002)(8746002)(6116002)(3846002)(81166006)(47776003)(386003)(6506007)(66066001)(1076003)(36756003)(54906003)(6512007)(102836004)(9686003)(7736002)(61793004)(97756001)(76130400001)(26005)(186003)(86362001)(58126008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4945;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: fda46bf7-87e9-4255-a234-08d7172ca976
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(710020)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR08MB4945; 
NoDisclaimer: True
X-Forefront-PRVS: 011787B9DD
X-Microsoft-Antispam-Message-Info: SeC8iOAYurUeNe6+923oXvNpg8UtPV4ZXObCvIhq0hk8YKDl5/wKAQ6dwJLAxgE+CYYvaNCfdoSwxKS+TFBgAQl5pcyviSEE1T7htTQNBtGCUnic61B5P1EnoPJf3qdXHMtumz0eiA3YM/YFC5xi9sTTIYdkkZlQVvtqYfWj4OARPuV+UeO/5OIMyjbPh20OXuITMQJ2Jk3uRZpYjEjNYBTkoT0TsyfWDeNeoEan7GMDSA9Az1y4FMMBvu5J5VKDTI6mX+WzNQVWtvXNd+WByO6okJXGjEFsr6rGdxSfca/9oZAD7nUaDugzgORpRtfi4bCM4R4xT/KyT81XNNntzNXf98jtFFvPwmCfvT9netFpSrp4wPjIU9IPIEHw8jRsFAmT6pSN/3PCOmAUFj2He9ZgYNv3voomTGewZ5IiIIM=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2019 09:34:57.1817 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e87a3f-7f7e-45f0-2962-08d7172caeb8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4945
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=df3DVkSvHaOOIHI3WAVoIFllnA87gGMgY2Evu1hPW2w=;
 b=B8VxgwvHX0Dv4hXpvQzHh4uuCkHzdbr8OK+ngdBzcuWtYIpWbOSiDDNZbI+7An0GDPAAcab4Z1TJRaWaUSZSzLy+dqDBvZzu5mewe7+I294sLa30yy0U3v5vUvkGOMztj6HwnWC4tgARJCoAscWbuf7KzA05K0aP/pGYNQeLY64=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=df3DVkSvHaOOIHI3WAVoIFllnA87gGMgY2Evu1hPW2w=;
 b=B8VxgwvHX0Dv4hXpvQzHh4uuCkHzdbr8OK+ngdBzcuWtYIpWbOSiDDNZbI+7An0GDPAAcab4Z1TJRaWaUSZSzLy+dqDBvZzu5mewe7+I294sLa30yy0U3v5vUvkGOMztj6HwnWC4tgARJCoAscWbuf7KzA05K0aP/pGYNQeLY64=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=temperror action=none header.from=arm.com;
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
 Liviu Dudau <Liviu.Dudau@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
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

SGkgTWloYWlsLApPbiBUaHUsIEF1ZyAwMSwgMjAxOSBhdCAxMDo0ODo0NVBNICswODAwLCBNaWhh
aWwgQXRhbmFzc292IHdyb3RlOgo+IEhpIExvd3J5LAo+IAo+IE9uIFRodXJzZGF5LCAxIEF1Z3Vz
dCAyMDE5IDEyOjM3OjE1IEJTVCBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3Rl
Ogo+ID4gRnJvbTogIkxvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkiIDxMb3dyeS5MaUBh
cm0uY29tPgo+ID4gCj4gPiBBZGRzIHRvIHByaW50IHRoZSBldmVudCBtZXNzYWdlIHdoZW4gZXJy
b3IgaGFwcGVucyBhbmQgdGhlIHNhbWUgZXZlbnQKPiA+IHdpbGwgbm90IGJlIHByaW50ZWQgdW50
aWwgbmV4dCB2c3luYy4KPiA+IAo+ID4gQ2hhbmdlcyBzaW5jZSB2MToKPiA+IDEuIEhhbmRsaW5n
IHRoZSBldmVudCBwcmludCBieSBDT05GSUdfS09NRURBX0VSUk9SX1BSSU5UOwo+ID4gMi4gQ2hh
bmdpbmcgdGhlIG1heCBzdHJpbmcgc2l6ZSB0byAyNTYuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6
IExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGxvd3J5LmxpQGFybS5jb20+Cj4gPiAt
LS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkvS2NvbmZpZyAgICAgICAgICAgICAg
IHwgICA2ICsKPiA+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL01ha2VmaWxl
ICAgICAgIHwgICAyICsKPiA+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9kZXYuaCAgIHwgIDE1ICsrKwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2V2ZW50LmMgfCAxNDEKPiA+ICsrKysrKysrKysrKysrKysrKysrKysgZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMgICB8IAo+ID4gIDQg
Kwo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgMTY4IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZXZlbnQu
Ywo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L0tjb25m
aWcKPiA+IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L0tjb25maWcgaW5kZXggY2VjMDYz
OS4uZTg3ZmY4NiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9L
Y29uZmlnCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkvS2NvbmZpZwo+ID4g
QEAgLTEyLDMgKzEyLDkgQEAgY29uZmlnIERSTV9LT01FREEKPiA+ICAJICBQcm9jZXNzb3IgZHJp
dmVyLiBJdCBzdXBwb3J0cyB0aGUgRDcxIHZhcmlhbnRzIG9mIHRoZSBoYXJkd2FyZS4KPiA+IAo+
ID4gIAkgIElmIGNvbXBpbGVkIGFzIGEgbW9kdWxlIGl0IHdpbGwgYmUgY2FsbGVkIGtvbWVkYS4K
PiA+ICsKPiA+ICtjb25maWcgRFJNX0tPTUVEQV9FUlJPUl9QUklOVAo+ID4gKwlib29sICJFbmFi
bGUga29tZWRhIGVycm9yIHByaW50Igo+ID4gKwlkZXBlbmRzIG9uIERSTV9LT01FREEKPiA+ICsJ
aGVscAo+ID4gKwkgIENob29zZSB0aGlzIG9wdGlvbiB0byBlbmFibGUgZXJyb3IgcHJpbnRpbmcu
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9NYWtl
ZmlsZQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL01ha2VmaWxlIGlu
ZGV4IDVjMzkwMGMuLmYwOTVhMWMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL01ha2VmaWxlCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL01ha2VmaWxlCj4gPiBAQCAtMjIsNCArMjIsNiBAQCBrb21lZGEteSArPSBc
Cj4gPiAgCWQ3MS9kNzFfZGV2Lm8gXAo+ID4gIAlkNzEvZDcxX2NvbXBvbmVudC5vCj4gPiAKPiA+
ICtrb21lZGEtJChDT05GSUdfRFJNX0tPTUVEQV9FUlJPUl9QUklOVCkgKz0ga29tZWRhX2V2ZW50
Lm8KPiA+ICsKPiA+ICBvYmotJChDT05GSUdfRFJNX0tPTUVEQSkgKz0ga29tZWRhLm8KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYu
aAo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaCBp
bmRleCBkMWM4NmI2Li5lMjhlN2U2Cj4gPiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaAo+ID4gQEAgLTQwLDYgKzQwLDE3IEBA
Cj4gPiAgI2RlZmluZSBLT01FREFfRVJSX1RUTkcJCQlCSVRfVUxMKDMwKQo+ID4gICNkZWZpbmUg
S09NRURBX0VSUl9UVEYJCQlCSVRfVUxMKDMxKQo+ID4gCj4gPiArI2RlZmluZSBLT01FREFfRVJS
X0VWRU5UUwlcCj4gPiArCShLT01FREFfRVZFTlRfVVJVTgl8IEtPTUVEQV9FVkVOVF9JQlNZCXwg
S09NRURBX0VWRU5UX09WUiB8Cj4gXAo+ID4gKwlLT01FREFfRVJSX1RFVE8JCXwgS09NRURBX0VS
Ul9URU1SCXwgCj4gS09NRURBX0VSUl9USVRSIHxcCj4gPiArCUtPTUVEQV9FUlJfQ1BFCQl8IEtP
TUVEQV9FUlJfQ0ZHRQl8IAo+IEtPTUVEQV9FUlJfQVhJRSB8XAo+ID4gKwlLT01FREFfRVJSX0FD
RTAJCXwgS09NRURBX0VSUl9BQ0UxCXwgCj4gS09NRURBX0VSUl9BQ0UyIHxcCj4gPiArCUtPTUVE
QV9FUlJfQUNFMwkJfCBLT01FREFfRVJSX0RSSUZUVE8JfCAKPiBLT01FREFfRVJSX0ZSQU1FVE8g
fFwKPiA+ICsJS09NRURBX0VSUl9aTUUJCXwgS09NRURBX0VSUl9NRVJSCXwgCj4gS09NRURBX0VS
Ul9UQ0YgfFwKPiA+ICsJS09NRURBX0VSUl9UVE5HCQl8IEtPTUVEQV9FUlJfVFRGKQo+ID4gKwo+
ID4gKyNkZWZpbmUgS09NRURBX1dBUk5fRVZFTlRTCUtPTUVEQV9FUlJfQ1NDRQo+ID4gKwo+ID4g
IC8qIG1hbGlkcCBkZXZpY2UgaWQgKi8KPiA+ICBlbnVtIHsKPiA+ICAJTUFMSV9ENzEgPSAwLAo+
ID4gQEAgLTIwNyw0ICsyMTgsOCBAQCBzdHJ1Y3Qga29tZWRhX2RldiB7Cj4gPiAKPiA+ICBzdHJ1
Y3Qga29tZWRhX2RldiAqZGV2X3RvX21kZXYoc3RydWN0IGRldmljZSAqZGV2KTsKPiA+IAo+ID4g
KyNpZmRlZiBDT05GSUdfRFJNX0tPTUVEQV9FUlJPUl9QUklOVAo+ID4gK3ZvaWQga29tZWRhX3By
aW50X2V2ZW50cyhzdHJ1Y3Qga29tZWRhX2V2ZW50cyAqZXZ0cyk7Cj4gPiArI2VuZGlmCj4gPiAr
Cj4gPiAgI2VuZGlmIC8qX0tPTUVEQV9ERVZfSF8qLwo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2V2ZW50LmMKPiA+IGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZXZlbnQuYyBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+ID4gaW5kZXggMDAwMDAwMC4uNTdiNjBjZAo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZXZlbnQuYwo+ID4g
QEAgLTAsMCArMSwxNDEgQEAKPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MAo+ID4gKy8qCj4gPiArICogKEMpIENPUFlSSUdIVCAyMDE5IEFSTSBMaW1pdGVkLiBBbGwgcmln
aHRzIHJlc2VydmVkLgo+ID4gKyAqIEF1dGhvcjogSmFtZXMuUWlhbi5XYW5nIDxqYW1lcy5xaWFu
LndhbmdAYXJtLmNvbT4KPiA+ICsgKgo+ID4gKyAqLwo+ID4gKyNpbmNsdWRlIDxkcm0vZHJtX3By
aW50Lmg+Cj4gPiArCj4gPiArI2luY2x1ZGUgImtvbWVkYV9kZXYuaCIKPiA+ICsKPiA+ICtzdHJ1
Y3Qga29tZWRhX3N0ciB7Cj4gPiArCWNoYXIgKnN0cjsKPiA+ICsJdTMyIHN6Owo+ID4gKwl1MzIg
bGVuOwo+ID4gK307Cj4gPiArCj4gPiArLyogcmV0dXJuIDAgb24gc3VjY2VzcywgIDwgMCBvbiBu
byBzcGFjZS4KPiA+ICsgKi8KPiA+ICtzdGF0aWMgaW50IGtvbWVkYV9zcHJpbnRmKHN0cnVjdCBr
b21lZGFfc3RyICpzdHIsIGNvbnN0IGNoYXIgKmZtdCwgLi4uKQo+IFRoZSBsYWNrIG9mICdcMCct
dGVybWluYXRpb24gaW4gdGhlIHRydW5jYXRpb24gY2FzZSBpcyBxdWl0ZSBkaXNjb25jZXJ0aW5n
LCAKPiBlc3BlY2lhbGx5IHNpbmNlIHZzbnByaW50ZiBkb2VzIGl0LiBUaGlzIHdvdWxkIGJlIHF1
aXRlIHN1cnByaXNpbmcgdG8gdGhlIAo+IGNhc3VhbCBwYXNzZXItYnkuClRoYW5rcyBhIGxvdCBm
b3IgdGhlIGNvbW1lbnRzLiBXaWxsIHJlZmluZSBhY2NvcmRpbmdseSBhbmQgc2VuZCBhIG5ldwpw
YXRjaC4KPiA+ICt7Cj4gPiArCXZhX2xpc3QgYXJnczsKPiA+ICsJaW50IG51bSwgZnJlZV9zejsK
PiA+ICsJaW50IGVycjsKPiA+ICsKPiA+ICsJZnJlZV9zeiA9IHN0ci0+c3ogLSBzdHItPmxlbjsK
PiBUaGF0J3Mgb2ZmIGJ5IDEsIHlvdSBuZWVkIHRvIGFjY291bnQgZm9yIHRoZSBudWxsIGJ5dGUu
Cj4gPiArCWlmIChmcmVlX3N6IDw9IDApCj4gPiArCQlyZXR1cm4gLUVOT1NQQzsKPiA+ICsKPiA+
ICsJdmFfc3RhcnQoYXJncywgZm10KTsKPiA+ICsKPiA+ICsJbnVtID0gdnNucHJpbnRmKHN0ci0+
c3RyICsgc3RyLT5sZW4sIGZyZWVfc3osIGZtdCwgYXJncyk7Cj4gPiArCj4gPiArCXZhX2VuZChh
cmdzKTsKPiA+ICsKPiA+ICsJaWYgKG51bSA8PSBmcmVlX3N6KSB7Cj4gU3RyaWN0bHkgbGVzcyB0
aGFuLiBUbyBxdW90ZSBmcm9tIHRoZSBkb2Mgb2YgdnNucHJpbnRmOiAKPiAiIiIgWy4uLl0gSWYg
dGhlIHJldHVybiBpcyBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gQHNpemUsIHRoZSByZXN1bHRp
bmcgCj4gc3RyaW5nIGlzIHRydW5jYXRlZC4gIiIiCj4gPiArCQlzdHItPmxlbiArPSBudW07Cj4g
PiArCQllcnIgPSAwOwo+ID4gKwl9IGVsc2Ugewo+ID4gKwkJc3RyLT5sZW4gPSBzdHItPnN6Owo+
IE9mZiBieSAxIGhlcmUsIHRvby4KPiA+ICsJCWVyciA9IC1FTk9TUEM7Cj4gVGhhdCBlcnJvciBj
b2RlIGlzbid0IHVzZWQgYW55d2hlcmUsIHNvIHRoZXJlJ3Mgbm8gdmFsdWUgdG8gaGF2aW5nIGl0
IGluIHRoZSAKPiBjdXJyZW50IHZlcnNpb24gb2YgdGhpcyBwYXRjaC4gRWl0aGVyIGNoZWNrIHRo
ZSBlcnJvciBjb2RlIHNvbWV3aGVyZSAKPiBkb3duc3RyZWFtIGFuZCBoYW5kbGUgaXQsIG9yIGNo
YW5nZSB0aGF0IHRvIGFuIGFjdGlvbmFibGUgbWVzc2FnZSBmb3IgdGhlIAo+IHBlcnNvbiByZWFk
aW5nIHRoZSBrZXJuZWwgbG9nLiBBcyBpdCBzdGFuZHMgdHJ1bmNhdGlvbiBpcyBjb21wbGV0ZWx5
IHNpbGVudC4KQmV0dGVyIGtlZXAgdGhpcyBjb2RlIGFuZCB0cmVhdCBhcyBhbiBiYXNpYyB1dGls
IGZ1bmMuIEZvciB0aGlzIGNhc2UsCnRoZSBzdHJpbmcgc2l6ZSBpcyBiaWcgZW5vdWdoLiBJIHRy
aWVkIHRvIHByaW50IGEgZXJyIG1zZy9sb2cgYXQKY2FsbGluZyBwbGFjZSwgYnV0IGl0IGlzIGEg
ZGVhZCBjb2RlIHdoaWNoIHdpbGwgbm90IGdvIGludG8uIFNvIHN0aWxsCnN1Z2dlc3Qga2VlcCB0
aGUgY3VycmVudC4KPiA+ICsJfQo+ID4gKwo+ID4gKwlyZXR1cm4gZXJyOwo+ID4gK30KPiA+ICsK
PiA+ICtzdGF0aWMgdm9pZCBldnRfc3ByaW50ZihzdHJ1Y3Qga29tZWRhX3N0ciAqc3RyLCB1NjQg
ZXZ0LCBjb25zdCBjaGFyICptc2cpCj4gPiArewo+ID4gKwlpZiAoZXZ0KQo+ID4gKwkJa29tZWRh
X3NwcmludGYoc3RyLCBtc2cpOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgdm9pZCBldnRfc3Ry
KHN0cnVjdCBrb21lZGFfc3RyICpzdHIsIHU2NCBldmVudHMpCj4gPiArewo+ID4gKwlpZiAoZXZl
bnRzID09IDBVTEwpIHsKPiA+ICsJCWV2dF9zcHJpbnRmKHN0ciwgMSwgIk5vbmUiKTsKPiBbbml0
XSBDYWxsIGBrb21lZGFfc3ByaW50ZihzdHIsICJOb25lIilgIGRpcmVjdGx5PwpZZXMsIHdpbGwg
Y2hhbmdlIHRvIGl0IDotKQo+ID4gKwkJcmV0dXJuOwo+ID4gKwl9Cj4gPiArCj4gPiArCWV2dF9z
cHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VWRU5UX1ZTWU5DLCAiVlNZTkN8Iik7Cj4gPiAr
CWV2dF9zcHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VWRU5UX0ZMSVAsICJGTElQfCIpOwo+
ID4gKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FVkVOVF9FT1csICJFT1d8Iik7
Cj4gPiArCWV2dF9zcHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VWRU5UX01PREUsICJPUC1N
T0RFfCIpOwo+ID4gKwo+ID4gKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FVkVO
VF9VUlVOLCAiVU5ERVJSVU58Iik7Cj4gPiArCWV2dF9zcHJpbnRmKHN0ciwgZXZlbnRzICYgS09N
RURBX0VWRU5UX09WUiwgIk9WRVJSVU58Iik7Cj4gPiArCj4gPiArCS8qIEdMQiBlcnJvciAqLwo+
ID4gKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfTUVSUiwgIk1FUlJ8Iik7
Cj4gPiArCWV2dF9zcHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VSUl9GUkFNRVRPLCAiRlJB
TUVUT3wiKTsKPiA+ICsKPiA+ICsJLyogRE9VIGVycm9yICovCj4gPiArCWV2dF9zcHJpbnRmKHN0
ciwgZXZlbnRzICYgS09NRURBX0VSUl9EUklGVFRPLCAiRFJJRlRUT3wiKTsKPiA+ICsJZXZ0X3Nw
cmludGYoc3RyLCBldmVudHMgJiBLT01FREFfRVJSX0ZSQU1FVE8sICJGUkFNRVRPfCIpOwo+ID4g
KwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfVEVUTywgIlRFVE98Iik7Cj4g
PiArCWV2dF9zcHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VSUl9DU0NFLCAiQ1NDRXwiKTsK
PiA+ICsKPiA+ICsJLyogTFBVIGVycm9ycyBvciBldmVudHMgKi8KPiA+ICsJZXZ0X3NwcmludGYo
c3RyLCBldmVudHMgJiBLT01FREFfRVZFTlRfSUJTWSwgIklCU1l8Iik7Cj4gPiArCWV2dF9zcHJp
bnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VSUl9BWElFLCAiQVhJRXwiKTsKPiA+ICsJZXZ0X3Nw
cmludGYoc3RyLCBldmVudHMgJiBLT01FREFfRVJSX0FDRTAsICJBQ0UwfCIpOwo+ID4gKwlldnRf
c3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfQUNFMSwgIkFDRTF8Iik7Cj4gPiArCWV2
dF9zcHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VSUl9BQ0UyLCAiQUNFMnwiKTsKPiA+ICsJ
ZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBLT01FREFfRVJSX0FDRTMsICJBQ0UzfCIpOwo+ID4g
Kwo+ID4gKwkvKiBMUFUgVEJVIGVycm9ycyovCj4gPiArCWV2dF9zcHJpbnRmKHN0ciwgZXZlbnRz
ICYgS09NRURBX0VSUl9UQ0YsICJUQ0Z8Iik7Cj4gPiArCWV2dF9zcHJpbnRmKHN0ciwgZXZlbnRz
ICYgS09NRURBX0VSUl9UVE5HLCAiVFROR3wiKTsKPiA+ICsJZXZ0X3NwcmludGYoc3RyLCBldmVu
dHMgJiBLT01FREFfRVJSX1RJVFIsICJUSVRSfCIpOwo+ID4gKwlldnRfc3ByaW50ZihzdHIsIGV2
ZW50cyAmIEtPTUVEQV9FUlJfVEVNUiwgIlRFTVJ8Iik7Cj4gPiArCWV2dF9zcHJpbnRmKHN0ciwg
ZXZlbnRzICYgS09NRURBX0VSUl9UVEYsICJUVEZ8Iik7Cj4gPiArCj4gPiArCS8qIENVIGVycm9y
cyovCj4gPiArCWV2dF9zcHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VSUl9DUEUsICJDT1BS
T0N8Iik7Cj4gPiArCWV2dF9zcHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VSUl9aTUUsICJa
TUV8Iik7Cj4gPiArCWV2dF9zcHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VSUl9DRkdFLCAi
Q0ZHRXwiKTsKPiA+ICsJZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBLT01FREFfRVJSX1RFTVIs
ICJURU1SfCIpOwo+ID4gKwo+ID4gKwlpZiAoc3RyLT5sZW4gPiAwICYmIChzdHItPnN0cltzdHIt
PmxlbiAtIDFdID09ICd8JykpIHsKPiA+ICsJCXN0ci0+c3RyW3N0ci0+bGVuIC0gMV0gPSAwOwo+
ID4gKwkJc3RyLT5sZW4tLTsKPiA+ICsJfQo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgYm9vbCBp
c19uZXdfZnJhbWUoc3RydWN0IGtvbWVkYV9ldmVudHMgKmEpCj4gPiArewo+ID4gKwlyZXR1cm4g
KGEtPnBpcGVzWzBdIHwgYS0+cGlwZXNbMV0pICYKPiA+ICsJICAgICAgIChLT01FREFfRVZFTlRf
RkxJUCB8IEtPTUVEQV9FVkVOVF9FT1cpOwo+ID4gK30KPiA+ICsKPiA+ICt2b2lkIGtvbWVkYV9w
cmludF9ldmVudHMoc3RydWN0IGtvbWVkYV9ldmVudHMgKmV2dHMpCj4gPiArewo+ID4gKwl1NjQg
cHJpbnRfZXZ0cyA9IEtPTUVEQV9FUlJfRVZFTlRTOwo+ID4gKwlzdGF0aWMgYm9vbCBlbl9wcmlu
dCA9IHRydWU7Cj4gPiArCj4gPiArCS8qIHJlZHVjZSB0aGUgc2FtZSBtc2cgcHJpbnQsIG9ubHkg
cHJpbnQgdGhlIGZpcnN0IGV2dCBmb3Igb25lIAo+IGZyYW1lICovCj4gPiArCWlmIChldnRzLT5n
bG9iYWwgfHwgaXNfbmV3X2ZyYW1lKGV2dHMpKQo+ID4gKwkJZW5fcHJpbnQgPSB0cnVlOwo+ID4g
KwlpZiAoIWVuX3ByaW50KQo+ID4gKwkJcmV0dXJuOwo+ID4gKwo+ID4gKwlpZiAoKGV2dHMtPmds
b2JhbCB8IGV2dHMtPnBpcGVzWzBdIHwgZXZ0cy0+cGlwZXNbMV0pICYgcHJpbnRfZXZ0cykgCj4g
ewo+ID4gKwkJI2RlZmluZSBTVFJfU1oJCTI1Ngo+IFtuaXRdIEknZCB1bmRlZiB0aGF0IG9uY2Ug
aXQncyBubyBsb25nZXIgbmVlZGVkCldpbGwgbm90IHVzZSBtYWNybyBoZXJlLgo+ID4gKwkJY2hh
ciBtc2dbU1RSX1NaXTsKPiA+ICsJCXN0cnVjdCBrb21lZGFfc3RyIHN0cjsKPiA+ICsKPiA+ICsJ
CXN0ci5zdHIgPSBtc2c7Cj4gPiArCQlzdHIuc3ogID0gU1RSX1NaOwo+ID4gKwkJc3RyLmxlbiA9
IDA7Cj4gPiArCj4gPiArCQlrb21lZGFfc3ByaW50Zigmc3RyLCAiZ2N1OiAiKTsKPiA+ICsJCWV2
dF9zdHIoJnN0ciwgZXZ0cy0+Z2xvYmFsKTsKPiA+ICsJCWtvbWVkYV9zcHJpbnRmKCZzdHIsICIs
IHBpcGVzWzBdOiAiKTsKPiA+ICsJCWV2dF9zdHIoJnN0ciwgZXZ0cy0+cGlwZXNbMF0pOwo+ID4g
KwkJa29tZWRhX3NwcmludGYoJnN0ciwgIiwgcGlwZXNbMV06ICIpOwo+ID4gKwkJZXZ0X3N0cigm
c3RyLCBldnRzLT5waXBlc1sxXSk7Cj4gPiArCj4gPiArCQlEUk1fRVJST1IoImVyciBkZXRlY3Q6
ICVzXG4iLCBtc2cpOwo+ID4gKwo+ID4gKwkJZW5fcHJpbnQgPSBmYWxzZTsKPiA+ICsJfQo+ID4g
K30KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9rbXMuYwo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9rbXMuYyBpbmRleCA0MTlhOGIwLi4wZmFmYzM2Cj4gPiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYwo+ID4gQEAgLTQ3LDYg
KzQ3LDEwIEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBrb21lZGFfa21zX2lycV9oYW5kbGVyKGludCBp
cnEsIHZvaWQKPiA+ICpkYXRhKSBtZW1zZXQoJmV2dHMsIDAsIHNpemVvZihldnRzKSk7Cj4gPiAg
CXN0YXR1cyA9IG1kZXYtPmZ1bmNzLT5pcnFfaGFuZGxlcihtZGV2LCAmZXZ0cyk7Cj4gPiAKPiA+
ICsjaWZkZWYgQ09ORklHX0RSTV9LT01FREFfRVJST1JfUFJJTlQKPiA+ICsJa29tZWRhX3ByaW50
X2V2ZW50cygmZXZ0cyk7Cj4gPiArI2VuZGlmCj4gPiArCj4gPiAgCS8qIE5vdGlmeSB0aGUgY3J0
YyB0byBoYW5kbGUgdGhlIGV2ZW50cyAqLwo+ID4gIAlmb3IgKGkgPSAwOyBpIDwga21zLT5uX2Ny
dGNzOyBpKyspCj4gPiAgCQlrb21lZGFfY3J0Y19oYW5kbGVfZXZlbnQoJmttcy0+Y3J0Y3NbaV0s
ICZldnRzKTsKPiAKPiBCUiwKPiBNaWhhaWwKPiAKCi0tIApSZWdhcmRzLApMb3dyeQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
