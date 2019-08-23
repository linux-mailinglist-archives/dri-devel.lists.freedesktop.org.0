Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A08119AD7A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 12:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169826E063;
	Fri, 23 Aug 2019 10:42:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40061.outbound.protection.outlook.com [40.107.4.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F5D6E054
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 10:42:20 +0000 (UTC)
Received: from VI1PR08CA0187.eurprd08.prod.outlook.com (2603:10a6:800:d2::17)
 by DB8PR08MB4954.eurprd08.prod.outlook.com (2603:10a6:10:bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.18; Fri, 23 Aug
 2019 10:42:16 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::209) by VI1PR08CA0187.outlook.office365.com
 (2603:10a6:800:d2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.14 via Frontend
 Transport; Fri, 23 Aug 2019 10:42:16 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.13 via Frontend Transport; Fri, 23 Aug 2019 10:42:14 +0000
Received: ("Tessian outbound 3aa685aedf5f:v27");
 Fri, 23 Aug 2019 10:42:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: adf5da64737cd5b5
X-CR-MTA-TID: 64aa7808
Received: from f6e400b0c469.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A1ECB646-8F0F-4708-ABAE-CF45FA30FBB2.1; 
 Fri, 23 Aug 2019 10:42:07 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2051.outbound.protection.outlook.com [104.47.4.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f6e400b0c469.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 23 Aug 2019 10:42:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ju5GJDjQZCu5iKyaZjE0GsJwjhfJxnUy7IG0uWDwr/WJ8/GLnYD4P6kC55EkyzyKdSsSbrRCEpq8jVU2ULAIcpikP5FtjXkGXY+QLNZM+dFl8vU4/Wj+WJ3gJPAJSfrxIFlfNG1dxtSVXlmHtOy04483lX4ZhbaaZ+4GcDlFnbLwYfi30QQt+5upZqZPFjHpcd3qnM2+3g23ZzOAuIBc72NputUhorYUoMoJdfO+mKYMM3Z4g0xAwaW23O0QSoJGojUytXT0VVxDXwYMmrrantMFcGE2ZkCEU+gNRL5TrqaV9ErggAE0/11Gk+8MvL37ikcFs1jtmSdSDCnlnCHecQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qm1fGWizb/ofhSVFvcrNodhdKBtKzz4hQln2RMmx7rM=;
 b=QMr4gZHEeclGQQXkIdgk8ELSz6K2NdmhNnCzoBfx5k4MriZy71R9E7Jz/bcfsx4EyUJFfO2Tcruht/g36Qbx0s4JpeDgfUZX9Chq03eFS9wOzue0EhP8xlNLqCORyggsBMuUyGOCkpWVFAumz9P7SxGSL/VYL4F5EbECsel95T2ogRm/mtzUiD8vhJUuBgbWnFhMt+geIWxpaZDAcT1PwUmcCaeucdTQq0KQIn3rbHjMApGs/9sEY8I+dLSaM3i0V0MkZ5TAsziSzyzMEkGoXFYla+GO1hRBoX4eeAcJTX1znjHR0IHtxxjY2Iq/LoRTdbyDjig7LpNW0fslGD0gxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3021.eurprd08.prod.outlook.com (52.133.14.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 23 Aug 2019 10:42:04 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::2001:a268:ba50:fa51]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::2001:a268:ba50:fa51%3]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 10:42:04 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: Ayan Halder <Ayan.Halder@arm.com>
Subject: Re: [PATCH] drm/komeda: Reordered the komeda's de-init functions
Thread-Topic: [PATCH] drm/komeda: Reordered the komeda's de-init functions
Thread-Index: AQHVV38sxxLTSIs2FkGlnIkeXiN2EqcIj86A
Date: Fri, 23 Aug 2019 10:42:04 +0000
Message-ID: <8379636.aKIvcsjXCK@e123338-lin>
References: <20190820174606.1133-1-ayan.halder@arm.com>
In-Reply-To: <20190820174606.1133-1-ayan.halder@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.50]
x-clientproxiedby: LO2P265CA0215.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::35) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e8c65402-2c3a-43ae-c4c2-08d727b69041
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3021; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB3021:|DB8PR08MB4954:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB4954288BB9C82084639C04878FA40@DB8PR08MB4954.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:101;OLM:101;
x-forefront-prvs: 0138CD935C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(199004)(189003)(486006)(14444005)(5024004)(305945005)(66446008)(256004)(102836004)(478600001)(66066001)(52116002)(66946007)(66476007)(6246003)(66556008)(64756008)(99286004)(71190400001)(229853002)(7736002)(71200400001)(6862004)(33716001)(76176011)(5660300002)(476003)(81156014)(8676002)(81166006)(9686003)(6512007)(25786009)(6436002)(6116002)(14454004)(3846002)(446003)(2906002)(54906003)(186003)(53936002)(316002)(8936002)(26005)(4326008)(6506007)(386003)(86362001)(6636002)(11346002)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3021;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: B7IDKeYZ/rKx2ReyszoQGajjB/t4KXyiaLzXtdxOqyPAr1zSgqNFdv6rtjxl774DXMgCzkiXC/72mzYpU2HMkvdI2P5a5F9sr1uI1sizi5LUX6AHFCiH6stqO4Lw6DpL64KBb+Xyt7rNDCPsPbWgbjKvWMda6T55UAS7ZqHgl0SaRUVgz+tytReee31mrQ1CJPwH6VMfWyCa1BiPq/fJ5bWyzt36DrVAN6TtjLCmeitrMY68HYrdgN1cC5maWFDRtzgtRZCBcgOX8HbIW65yWjEeycFvxjqda8tiTGCLsLYKsVVt5P48qMPq6pkvzS3uLGnbKRy/kxUQGlO/awm7VnWYr1CUhNr/bQUt41k0TjOCTM/UJodfGJIXvLbrz233FVY0xz/TvU4o5+TL3zrOV+fm2MuT2sB9mlXSEM7X+J4=
Content-ID: <3D84151055F5D94C9E17C14BD66C5492@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3021
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(136003)(376002)(39860400002)(346002)(396003)(2980300002)(189003)(199004)(5660300002)(9686003)(316002)(99286004)(2906002)(6246003)(336012)(76176011)(54906003)(46406003)(76130400001)(486006)(4326008)(70586007)(6506007)(386003)(6862004)(6512007)(6636002)(102836004)(478600001)(6116002)(81166006)(33716001)(14454004)(5024004)(14444005)(70206006)(26005)(23726003)(476003)(50466002)(47776003)(26826003)(3846002)(81156014)(8676002)(126002)(22756006)(186003)(97756001)(63350400001)(446003)(11346002)(63370400001)(356004)(8746002)(86362001)(25786009)(229853002)(8936002)(305945005)(6486002)(36906005)(7736002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB4954;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: d588bd01-5e90-47a3-0e5c-08d727b6899a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(710020)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DB8PR08MB4954; 
NoDisclaimer: True
X-Forefront-PRVS: 0138CD935C
X-Microsoft-Antispam-Message-Info: iGW8Cnbyj8HEZ6J5rLzpaF2kZIR46KGytURvAu7MYMQ51qgqECriUygSzP0AFJZHls58SxFYqmaKbc0hRMwAM8P12gT9VTLT0XlDIGPtNu8gM2TmPTBo9ll/In7jZRArlyt5HJIggr5XP1z/T8g9oegs028ZFlsahqdIKF/x98ErR33w8uPGpAOyvXx4CNyVEgO/6Mp1Sgm3zQNQi7ijrqFu2LWdoO1orIw5pU6l/ugMvUdBnkmusfpgfrgAekSJ7fGsTtdqvI8AsR4m8mj9YyVfeHNjKO9KuAFnVs+ec1Adlh1sw0exkoplNSTX6Pio5moV6E34Ap0RbGFxUiedj2mNRMq8ASk54iMghanOwZC08Es/9tB/k+fw+vG8m+zqZthfw+UhbLt/ZufMqe4CpcJDD/qmJtkg740cHQydNOE=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2019 10:42:14.9791 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c65402-2c3a-43ae-c4c2-08d727b69041
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4954
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qm1fGWizb/ofhSVFvcrNodhdKBtKzz4hQln2RMmx7rM=;
 b=TOU0VTjDXXJn9qs6Fo+WpW9BjFb5q6o9/XeLsUpTUxDc2XvrFeQAnQYosObdH0Ujsl+fmylJ6NReOOE630uHOQWAn6DONRZcT5fZzYm6xKxgrjS3P6mCbshvM81l9n9pHqZeSnhu0VgjYLF0CUbgopIJjwoa+wt3+C5E89YbJPM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qm1fGWizb/ofhSVFvcrNodhdKBtKzz4hQln2RMmx7rM=;
 b=TOU0VTjDXXJn9qs6Fo+WpW9BjFb5q6o9/XeLsUpTUxDc2XvrFeQAnQYosObdH0Ujsl+fmylJ6NReOOE630uHOQWAn6DONRZcT5fZzYm6xKxgrjS3P6mCbshvM81l9n9pHqZeSnhu0VgjYLF0CUbgopIJjwoa+wt3+C5E89YbJPM=
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "malidp@foss.arm.com" <malidp@foss.arm.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlc2RheSwgMjAgQXVndXN0IDIwMTkgMTg6NDY6MTkgQlNUIEF5YW4gSGFsZGVyIHdyb3Rl
Ogo+IFRoZSBkZS1pbml0IHJvdXRpbmUgc2hvdWxkIGJlIGRvaW5nIHRoZSBmb2xsb3dpbmcgaW4g
b3JkZXI6LQo+IDEuIFVucmVnaXN0ZXIgdGhlIGRybSBkZXZpY2UKPiAyLiBTaHV0IGRvd24gdGhl
IGNydGNzIC0gZmFpbGluZyB0byBkbyB0aGlzIG1pZ2h0IGNhdXNlIGEgY29ubmVjdG9yIGxlYWth
Z2UKPiBTZWUgdGhlICdjb21taXQgMTA5YzRkMThlNTc0ICgiZHJtL2FybS9tYWxpZHA6IEVuc3Vy
ZSB0aGF0IHRoZSBjcnRjcyBhcmUKPiBzaHV0ZG93biBiZWZvcmUgcmVtb3ZpbmcgYW55IGVuY29k
ZXIvY29ubmVjdG9yIiknCj4gMy4gRGlzYWJsZSB0aGUgaW50ZXJydXB0cwo+IDQuIFVuYmluZCB0
aGUgY29tcG9uZW50cwo+IDUuIEZyZWUgdXAgRFJNIG1vZGVfY29uZmlnIGluZm8KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBeWFuIEt1bWFyIEhhbGRlciA8YXlhbi5oYWxkZXJAYXJtLmNvbT4KPiAtLS0K
PiAgLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYyAgIHwgMjAgKysr
KysrKysrKysrKy0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9rbXMuYwo+IGluZGV4IDg5MTkxYTU1NWM4NC4uZTIxOWQxYjY3MTAwIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMKPiBA
QCAtMTMsNiArMTMsNyBAQAo+ICAjaW5jbHVkZSA8ZHJtL2RybV9mYl9oZWxwZXIuaD4KPiAgI2lu
Y2x1ZGUgPGRybS9kcm1fZ2VtX2NtYV9oZWxwZXIuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fZ2Vt
X2ZyYW1lYnVmZmVyX2hlbHBlci5oPgo+ICsjaW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIu
aD4KQ2FuIHdlIGtlZXAgdGhlIGluY2x1ZGUgbGlzdCBpbiBhbHBoYWJldGljYWwgb3JkZXI/Cj4g
ICNpbmNsdWRlIDxkcm0vZHJtX2lycS5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV92YmxhbmsuaD4K
PiAgCj4gQEAgLTMwNCwyNCArMzA1LDMwIEBAIHN0cnVjdCBrb21lZGFfa21zX2RldiAqa29tZWRh
X2ttc19hdHRhY2goc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCj4gIAkJCSAgICAgICBrb21lZGFf
a21zX2lycV9oYW5kbGVyLCBJUlFGX1NIQVJFRCwKPiAgCQkJICAgICAgIGRybS0+ZHJpdmVyLT5u
YW1lLCBkcm0pOwo+ICAJaWYgKGVycikKPiAtCQlnb3RvIGNsZWFudXBfbW9kZV9jb25maWc7Cj4g
KwkJZ290byBmcmVlX2NvbXBvbmVudF9iaW5kaW5nOwo+ICAKPiAgCWVyciA9IG1kZXYtPmZ1bmNz
LT5lbmFibGVfaXJxKG1kZXYpOwo+ICAJaWYgKGVycikKPiAtCQlnb3RvIGNsZWFudXBfbW9kZV9j
b25maWc7Cj4gKwkJZ290byBmcmVlX2NvbXBvbmVudF9iaW5kaW5nOwo+ICAKPiAgCWRybS0+aXJx
X2VuYWJsZWQgPSB0cnVlOwo+ICAKPiAgCWVyciA9IGRybV9kZXZfcmVnaXN0ZXIoZHJtLCAwKTsK
PiAgCWlmIChlcnIpCj4gLQkJZ290byBjbGVhbnVwX21vZGVfY29uZmlnOwo+ICsJCWdvdG8gZnJl
ZV9pbnRlcnJ1cHRzOwo+ICAKPiAgCXJldHVybiBrbXM7Cj4gIAo+IC1jbGVhbnVwX21vZGVfY29u
ZmlnOgo+ICtmcmVlX2ludGVycnVwdHM6Cj4gIAlkcm0tPmlycV9lbmFibGVkID0gZmFsc2U7Cj4g
KwltZGV2LT5mdW5jcy0+ZGlzYWJsZV9pcnEobWRldik7Cj4gK2ZyZWVfY29tcG9uZW50X2JpbmRp
bmc6Cj4gKwljb21wb25lbnRfdW5iaW5kX2FsbChtZGV2LT5kZXYsIGRybSk7Cj4gK2NsZWFudXBf
bW9kZV9jb25maWc6Cj4gIAlkcm1fbW9kZV9jb25maWdfY2xlYW51cChkcm0pOwo+ICAJa29tZWRh
X2ttc19jbGVhbnVwX3ByaXZhdGVfb2JqcyhrbXMpOwo+ICsJZHJtLT5kZXZfcHJpdmF0ZSA9IE5V
TEw7Cj4gKwlkcm1fZGV2X3B1dChkcm0pOwo+ICBmcmVlX2ttczoKPiAgCWtmcmVlKGttcyk7Cj4g
IAlyZXR1cm4gRVJSX1BUUihlcnIpOwo+IEBAIC0zMzIsMTIgKzMzOSwxMyBAQCB2b2lkIGtvbWVk
YV9rbXNfZGV0YWNoKHN0cnVjdCBrb21lZGFfa21zX2RldiAqa21zKQo+ICAJc3RydWN0IGRybV9k
ZXZpY2UgKmRybSA9ICZrbXMtPmJhc2U7Cj4gIAlzdHJ1Y3Qga29tZWRhX2RldiAqbWRldiA9IGRy
bS0+ZGV2X3ByaXZhdGU7Cj4gIAo+ICsJZHJtX2Rldl91bnJlZ2lzdGVyKGRybSk7Cj4gKwlkcm1f
YXRvbWljX2hlbHBlcl9zaHV0ZG93bihkcm0pOwo+ICAJZHJtLT5pcnFfZW5hYmxlZCA9IGZhbHNl
Owo+ICAJbWRldi0+ZnVuY3MtPmRpc2FibGVfaXJxKG1kZXYpOwo+IC0JZHJtX2Rldl91bnJlZ2lz
dGVyKGRybSk7Cj4gIAljb21wb25lbnRfdW5iaW5kX2FsbChtZGV2LT5kZXYsIGRybSk7Cj4gLQlr
b21lZGFfa21zX2NsZWFudXBfcHJpdmF0ZV9vYmpzKGttcyk7Cj4gIAlkcm1fbW9kZV9jb25maWdf
Y2xlYW51cChkcm0pOwo+ICsJa29tZWRhX2ttc19jbGVhbnVwX3ByaXZhdGVfb2JqcyhrbXMpOwo+
ICAJZHJtLT5kZXZfcHJpdmF0ZSA9IE5VTEw7Cj4gIAlkcm1fZGV2X3B1dChkcm0pOwo+ICB9Cj4g
CgpUaGFua3MuIFNlZSBteSBpbmNsdWRlIG9yZGVyIGNvbW1lbnQgYWJvdmUsIHdpdGggdGhhdCBm
aXhlZDoKClJldmlld2VkLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFy
bS5jb20+CgotLSAKTWloYWlsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
