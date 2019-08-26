Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD019DEB5
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 09:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC7A897CD;
	Tue, 27 Aug 2019 07:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20073.outbound.protection.outlook.com [40.107.2.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03596E218;
 Mon, 26 Aug 2019 09:09:46 +0000 (UTC)
Received: from VI1PR08CA0216.eurprd08.prod.outlook.com (2603:10a6:802:15::25)
 by AM0PR08MB4947.eurprd08.prod.outlook.com (2603:10a6:208:158::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.19; Mon, 26 Aug
 2019 09:09:42 +0000
Received: from AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::208) by VI1PR08CA0216.outlook.office365.com
 (2603:10a6:802:15::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.14 via Frontend
 Transport; Mon, 26 Aug 2019 09:09:42 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT003.mail.protection.outlook.com (10.152.16.149) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.13 via Frontend Transport; Mon, 26 Aug 2019 09:09:39 +0000
Received: ("Tessian outbound 4f2e8f9f1994:v27");
 Mon, 26 Aug 2019 09:09:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e627b1d85db2e5a0
X-CR-MTA-TID: 64aa7808
Received: from 29e1085fe1c9.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 33CADD36-FFEC-4178-B4B6-0D70E81DC950.1; 
 Mon, 26 Aug 2019 09:09:18 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2056.outbound.protection.outlook.com [104.47.4.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 29e1085fe1c9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 26 Aug 2019 09:09:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guPoMZBNX1wrys1qJvG4BX8q87scqL/Uuqvxj1lxSjm2o8oS4yfLa5cifK268S67srA/0LsrWGgdoK4kgt/d865LL/R72YIVqOlOkXLYaaTqfjPMoSUhtBf+SAEVieUo6rWLjp1vVdxHVndZNCipgl7F+blZvbDYLyWOfIFfZWj3vVaHVS6F/XVXUozrzWi7ULy5bTfTLmEIJQhG4X+kYeYmOrms4MAW5jssnN8hCqWuftHz2BT+IcNprJ2kz/r173J2zTYGZ1SXS0Pxb66YM6s6gnIcRjcEn6+GVAmmXvy3c98jbc3Up9yaT2bJd+ST1XtxBc8p7pIYwxBgMnCn8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0744IVgR+lD4FADVLNbU/YWJvhkzBqVq7PHZ/B1yxI=;
 b=ax5jVm0vVW+eyAWY95AgVa11F/j31Mq//VkqGF+CT8HEnFGexHBYyR4HtQQLUrr/zMBTJZ+3e1VBhsle3lo3Z5z2m6ylZdBFef0IggGacDjpzPDJq8j9F1JJkOzY6UhAZSiTRQCaUi4wPhQ5AleXCp8Jd9FRlrb4VVyj/ILULMq/JHJyU0lLS+k7HeT1aHaBBUl+ynncy/eKpZOmq07yISQULifHjDbKx/x962c2+8MCB7xVPx+vTsVvS0KAED92GJE3mOm+Xkh9oqVIbGf8fjp33woyNAmDamnqSO43Bz1Pn1Kn0nnloMi4LUVDY+6fguHpaTy96N2YOUNSCIQ0Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM5PR0801MB1636.eurprd08.prod.outlook.com (10.169.246.150) by
 AM5PR0801MB2052.eurprd08.prod.outlook.com (10.168.158.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 26 Aug 2019 09:09:16 +0000
Received: from AM5PR0801MB1636.eurprd08.prod.outlook.com
 ([fe80::f165:3db2:5f04:faac]) by AM5PR0801MB1636.eurprd08.prod.outlook.com
 ([fe80::f165:3db2:5f04:faac%9]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 09:09:16 +0000
From: Amit Kachhap <Amit.Kachhap@arm.com>
To: Cristian Marussi <Cristian.Marussi@arm.com>, Andrey Konovalov
 <andreyknvl@google.com>
Subject: Re: [PATCH v18 15/15] selftests, arm64: add a selftest for passing
 tagged pointers to kernel
Thread-Topic: [PATCH v18 15/15] selftests, arm64: add a selftest for passing
 tagged pointers to kernel
Thread-Index: AQHVWbqSSW1sMYT9Nk6SlAKwFcW/8acI+XuAgAAJWYCABCWBgA==
Date: Mon, 26 Aug 2019 09:09:16 +0000
Message-ID: <40d92d23-052f-f8c7-13f1-c1a23f7be2a2@arm.com>
References: <cover.1561386715.git.andreyknvl@google.com>
 <0999c80cd639b78ae27c0674069d552833227564.1561386715.git.andreyknvl@google.com>
 <6af3f619-4356-2f67-ed76-92beceb1e0a0@arm.com>
 <CAAeHK+yhbUcuLhoetjGUbqM4j9fX84hbwmxzNPF+e1zXj6nKNw@mail.gmail.com>
 <d6bc5c4b-68b5-0a58-0f52-8bce20986dcf@arm.com>
In-Reply-To: <d6bc5c4b-68b5-0a58-0f52-8bce20986dcf@arm.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PN1PR0101CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:c::24) To AM5PR0801MB1636.eurprd08.prod.outlook.com
 (2603:10a6:203:3a::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Amit.Kachhap@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.105.40]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9a7d684d-742d-42d6-b1f7-08d72a05204b
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR0801MB2052; 
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2052:|AM0PR08MB4947:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB4947D8EFD0297645B584FA788CA10@AM0PR08MB4947.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4125;OLM:4125;
x-forefront-prvs: 01415BB535
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(189003)(51914003)(199004)(6506007)(386003)(5660300002)(66946007)(53936002)(966005)(7416002)(11346002)(476003)(14454004)(6306002)(30864003)(66476007)(6512007)(229853002)(71190400001)(71200400001)(76176011)(14444005)(66556008)(8936002)(256004)(52116002)(36756003)(8676002)(81166006)(81156014)(478600001)(446003)(99286004)(2616005)(44832011)(486006)(66066001)(6116002)(3846002)(26005)(54906003)(186003)(316002)(110136005)(31696002)(86362001)(66446008)(25786009)(6436002)(6246003)(305945005)(31686004)(64756008)(6486002)(53546011)(102836004)(7736002)(4326008)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0801MB2052;
 H:AM5PR0801MB1636.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: r3Dcri/FDJMmj92ymEWzbCqdcyd9OSG7+hlJmgMd6t0AXVG+ffH1oW2jv+fyGgYkwlAfP6Jugly63G8RNhBxpTVAyJgipHqXNQEd9YU4y0/PH5//ufi8zqSxzM/oKLnpdhtB66SKAH/66hPwZx7CBZJAORaYDgvJlACBEl6aMEJINUg83RMa3eyYA3g9TREouVmrMmkiAHmhTNkAfLHjws16nNtosKmzSXXnHbIQO3w+JWS2TGDBZSGaROA5StX9qu9s24gpjefi8bm7y2QcxR0o6wgyilg4+t9pwmHd4FLoWJpBi3TZJFMx66mzJS1Fe1a0CSzZqEKz0tv4cff33R284gCDOaN/aA5fNcTNPzr62DQ3q3RbPMN4lh9m2lOKbeAbbOMaYN8aTesrkuyxaHAdZPUFFuDPxxxQVgUO9sU=
Content-ID: <833E56E04CD5484ABD7D62010DCD757B@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2052
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Amit.Kachhap@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(346002)(396003)(2980300002)(199004)(189003)(51914003)(40434004)(14454004)(54906003)(36756003)(386003)(81166006)(50466002)(486006)(316002)(7736002)(25786009)(2486003)(23676004)(36906005)(336012)(81156014)(11346002)(2616005)(229853002)(99286004)(5660300002)(126002)(476003)(6246003)(31686004)(436003)(63370400001)(86362001)(2906002)(446003)(6512007)(31696002)(5024004)(26826003)(66066001)(305945005)(4326008)(76130400001)(76176011)(478600001)(14444005)(186003)(47776003)(8936002)(22756006)(6486002)(8676002)(6116002)(26005)(966005)(70206006)(70586007)(110136005)(356004)(450100002)(53546011)(107886003)(3846002)(63350400001)(30864003)(102836004)(6506007)(6306002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4947;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5eab439e-c258-4be0-0829-08d72a0511c1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB4947; 
X-Forefront-PRVS: 01415BB535
X-Microsoft-Antispam-Message-Info: GBtZrt6XvCXjneotbwNyTH0czrI9fGt8p9irucxai6gxH9BtFjXMx7Iqh9ggJYlwTrl9OujgHzQM4XX/3GzNJ/5oerbr0J1O1IG7J2BUvLtvPUnrCUQKVWd1cZA36Q9V8kIwZf13fDc8Z/baE5Q7nOTcYY2slxx9c9AuoTTK2ygmUOFwTkJ3bXteYklXVhZEZUsafyCGTcZD3GgzG938xd4kHCOqpkFQ5LvccEbtJq8OQ2dQf+9SNKaDA6qo3XL/cLU6Bft3Tstv+rMuu+XODGpAe+rZOzBGyBaBzeFIU+xQ18OQ201lCuHzMW9x7Qs1w6i6XjMor4i2xgYXlfMPMA1f7ZgvZNeFNXBrtSRta8s7jQ4LlT9azyMErCFNMdtwNFWbMfwQ1BP0dlQkoLKW5NeS4TzayI7oC+moiDHc5MI=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2019 09:09:39.9537 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a7d684d-742d-42d6-b1f7-08d72a05204b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4947
X-Mailman-Approved-At: Tue, 27 Aug 2019 07:29:19 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZdCgx7ej3ti8xtFfmmuwbU8sAI8D2SB0+zjU7SgcVE=;
 b=29AyabGOrRmZy+XNrky1wG8dZJCalQpUWgmdKJZT/jLxGRu2W2H2gtpITxHqkyVQIRCKF/fOHuDH8QohZcWKjA5xuPK59vCle9OTMVPyZ3bT/bpW2FkBDiyl7VkKLsgDcfnyVSE9tkJVq4ly1DMpg9J/pScqC8SqjoNk1jVZeZ0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0744IVgR+lD4FADVLNbU/YWJvhkzBqVq7PHZ/B1yxI=;
 b=+ATJm/KB33kO7wAUHy1JjmeQSKhZvgm9Qxqee821w8BvcLZQgi5l1e+dtGfKOrOs0LxLrMwOPKCjLQ3JhbvZtkXD7z/v+r7dR3vRHBtVhtP/WVm0hL1JfklHWS7tL8dqQxg65Pn7x3zcab++WLViRXaQ7XuBTLyOaJRkJAY926g=
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
Cc: Mark Rutland <Mark.Rutland@arm.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>, Lee Smith <Lee.Smith@arm.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Vincenzo Frascino <Vincenzo.Frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Dave P Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Kevin Brodsky <Kevin.Brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <Robin.Murphy@arm.com>, Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNCk9uIDgvMjMvMTkgMTE6MTkgUE0sIENyaXN0aWFuIE1hcnVzc2kgd3JvdGU6DQo+DQo+
IEhpDQo+DQo+IE9uIDIzLzA4LzIwMTkgMTg6MTYsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6DQo+
PiBPbiBGcmksIEF1ZyAyMywgMjAxOSBhdCAzOjU2IFBNIENyaXN0aWFuIE1hcnVzc2kNCj4+IDxj
cmlzdGlhbi5tYXJ1c3NpQGFybS5jb20+IHdyb3RlOg0KPj4+DQo+Pj4gSGkgQW5kcmV5DQo+Pj4N
Cj4+PiBPbiAyNC8wNi8yMDE5IDE1OjMzLCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOg0KPj4+PiBU
aGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMga2VybmVsIEFCSSB0
byBhbGxvdyB0byBwYXNzDQo+Pj4+IHRhZ2dlZCB1c2VyIHBvaW50ZXJzICh3aXRoIHRoZSB0b3Ag
Ynl0ZSBzZXQgdG8gc29tZXRoaW5nIGVsc2Ugb3RoZXIgdGhhbg0KPj4+PiAweDAwKSBhcyBzeXNj
YWxsIGFyZ3VtZW50cy4NCj4+Pj4NCj4+Pj4gVGhpcyBwYXRjaCBhZGRzIGEgc2ltcGxlIHRlc3Qs
IHRoYXQgY2FsbHMgdGhlIHVuYW1lIHN5c2NhbGwgd2l0aCBhDQo+Pj4+IHRhZ2dlZCB1c2VyIHBv
aW50ZXIgYXMgYW4gYXJndW1lbnQuIFdpdGhvdXQgdGhlIGtlcm5lbCBhY2NlcHRpbmcgdGFnZ2Vk
DQo+Pj4+IHVzZXIgcG9pbnRlcnMgdGhlIHRlc3QgZmFpbHMgd2l0aCBFRkFVTFQuDQo+Pj4+DQo+
Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNv
bT4NCj4+Pj4gLS0tDQo+Pj4+ICAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvLmdpdGln
bm9yZSAgICAgIHwgIDEgKw0KPj4+PiAgIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L01h
a2VmaWxlICAgICAgICB8IDExICsrKysrKysNCj4+Pj4gICAuLi4vdGVzdGluZy9zZWxmdGVzdHMv
YXJtNjQvcnVuX3RhZ3NfdGVzdC5zaCAgfCAxMiArKysrKysrKw0KPj4+PiAgIHRvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2FybTY0L3RhZ3NfdGVzdC5jICAgICB8IDI5ICsrKysrKysrKysrKysrKysr
KysNCj4+Pj4gICA0IGZpbGVzIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKykNCj4+Pj4gICBjcmVh
dGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvLmdpdGlnbm9yZQ0K
Pj4+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC9N
YWtlZmlsZQ0KPj4+PiAgIGNyZWF0ZSBtb2RlIDEwMDc1NSB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9hcm02NC9ydW5fdGFnc190ZXN0LnNoDQo+Pj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L3RhZ3NfdGVzdC5jDQo+Pj4NCj4+PiBBZnRlciBidWls
ZGluZyBhIGZyZXNoIEtlcm5lbCBmcm9tIGFybTY0L2Zvci1uZXh0LWNvcmUgZnJvbSBzY3JhdGNo
IGF0Og0KPj4+DQo+Pj4gY29tbWl0IDIzOWFiNjU4YmVhM2IzODc0MjQ1MDFlN2M0MTY2NDBkNjc1
MmRjMGMNCj4+PiBNZXJnZTogNmJmYTMxMzRiZDNhIDQyZDAzOGM0ZmIwMCAxMjQzY2I2YTY3NmYg
ZDU1YzVmMjhhZmFmIGQwNmZhNWExMThmMSAzNGI1NTYwZGI0MGQNCj4+PiBBdXRob3I6IFdpbGwg
RGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+DQo+Pj4gRGF0ZTogICBUaHUgQXVnIDIyIDE4OjIzOjUz
IDIwMTkgKzAxMDANCj4+Pg0KPj4+ICAgICAgTWVyZ2UgYnJhbmNoZXMgJ2Zvci1uZXh0L2Vycm9y
LWluamVjdGlvbicsICdmb3ItbmV4dC90YmknLCAnZm9yLW5leHQvcHNjaS1jcHVpZGxlJywgJ2Zv
ci1uZXh0L2NwdS10b3BvbG9neScgYW5kICdmb3ItbmV4dC81Mi1iaXQta3ZhJyBpbnRvIGZvci1u
ZXh0L2NvcmUNCj4+Pg0KPj4+DQo+Pj4gS1NGVCBhcm02NCB0ZXN0cyBidWlsZCBpcyBicm9rZW4g
Zm9yIG1lLCBib3RoIHNldHRpbmcgb3Igbm90IEtCVUlMRF9PVVRQVVQ9DQo+Pj4NCj4+PiAxMzoz
MCAkIG1ha2UgVEFSR0VUUz1hcm02NCBrc2VsZnRlc3QtY2xlYW4NCj4+PiBtYWtlWzFdOiBFbnRl
cmluZyBkaXJlY3RvcnkgJy9ob21lL2NyaW1hcjAxL0FSTS9kZXYvc3JjL3Bkc3cvb3V0X2xpbnV4
Jw0KPj4+IHJtIC1mIC1yIC9ob21lL2NyaW1hcjAxL0FSTS9kZXYvc3JjL3Bkc3cvb3V0X2xpbnV4
Ly9rc2VsZnRlc3QvYXJtNjQvdGFnc190ZXN0DQo+Pj4gbWFrZVsxXTogTGVhdmluZyBkaXJlY3Rv
cnkgJy9ob21lL2NyaW1hcjAxL0FSTS9kZXYvc3JjL3Bkc3cvb3V0X2xpbnV4Jw0KPj4+DQo+Pj4g
4pyUIH4vQVJNL2Rldi9zcmMvcGRzdy9saW51eCBbYXJtNjRfZm9yX25leHRfY29yZXzigKY44pqR
IDIzXQ0KPj4+DQo+Pj4gMTM6MzAgJCBtYWtlIFRBUkdFVFM9YXJtNjQga3NlbGZ0ZXN0DQo+Pj4g
bWFrZVsxXTogRW50ZXJpbmcgZGlyZWN0b3J5ICcvaG9tZS9jcmltYXIwMS9BUk0vZGV2L3NyYy9w
ZHN3L291dF9saW51eCcNCj4+PiBhcmNoL2FybTY0L01ha2VmaWxlOjU2OiBDUk9TU19DT01QSUxF
X0NPTVBBVCBub3QgZGVmaW5lZCBvciBlbXB0eSwgdGhlIGNvbXBhdCB2RFNPIHdpbGwgbm90IGJl
IGJ1aWx0DQo+Pj4gbWFrZSAtLW5vLWJ1aWx0aW4tcnVsZXMgSU5TVEFMTF9IRFJfUEFUSD0kQlVJ
TEQvdXNyIFwNCj4+PiAgICAgICAgICBBUkNIPWFybTY0IC1DIC4uLy4uLy4uIGhlYWRlcnNfaW5z
dGFsbA0KPj4+ICAgIEhPU1RDQyAgc2NyaXB0cy9iYXNpYy9maXhkZXANCj4+PiAgICBIT1NUQ0Mg
IHNjcmlwdHMvdW5pZmRlZg0KPj4+IC4uLg0KPj4+IC4uLg0KPj4+ICAgIEhEUklOU1QgdXNyL2lu
Y2x1ZGUvYXNtL21zZ2J1Zi5oDQo+Pj4gICAgSERSSU5TVCB1c3IvaW5jbHVkZS9hc20vc2htYnVm
LmgNCj4+PiAgICBJTlNUQUxMIC9ob21lL2NyaW1hcjAxL0FSTS9kZXYvc3JjL3Bkc3cvb3V0X2xp
bnV4Ly9rc2VsZnRlc3QvdXNyL2luY2x1ZGUNCj4+PiAvb3B0L3Rvb2xjaGFpbnMvZ2NjLWFybS04
LjMtMjAxOS4wMy14ODZfNjQtYWFyY2g2NC1saW51eC1nbnUvYmluL2FhcmNoNjQtbGludXgtZ251
LWdjYyAgICAgdGFnc190ZXN0LmMgIC1vIC9ob21lL2NyaW1hcjAxL0FSTS9kZXYvc3JjL3Bkc3cv
b3V0X2xpbnV4Ly9rc2VsZnRlc3QvYXJtNjQvdGFnc190ZXN0DQo+Pj4gdGFnc190ZXN0LmM6IElu
IGZ1bmN0aW9uIOKAmG1haW7igJk6DQo+Pj4gdGFnc190ZXN0LmM6MjE6MTI6IGVycm9yOiDigJhQ
Ul9TRVRfVEFHR0VEX0FERFJfQ1RSTOKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBm
dW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhQUl9HRVRfVElEX0FERFJFU1PigJk/DQo+Pj4gICAg
aWYgKHByY3RsKFBSX1NFVF9UQUdHRURfQUREUl9DVFJMLCBQUl9UQUdHRURfQUREUl9FTkFCTEUs
IDAsIDAsIDApID09IDApDQo+Pj4gICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
DQo+Pj4gICAgICAgICAgICAgIFBSX0dFVF9USURfQUREUkVTUw0KPj4+IHRhZ3NfdGVzdC5jOjIx
OjEyOiBub3RlOiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcyByZXBvcnRlZCBvbmx5IG9u
Y2UgZm9yIGVhY2ggZnVuY3Rpb24gaXQgYXBwZWFycyBpbg0KPj4+IHRhZ3NfdGVzdC5jOjIxOjM3
OiBlcnJvcjog4oCYUFJfVEFHR0VEX0FERFJfRU5BQkxF4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVz
ZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmFBSX0dFVF9EVU1QQUJMReKAmT8N
Cj4+PiAgICBpZiAocHJjdGwoUFJfU0VUX1RBR0dFRF9BRERSX0NUUkwsIFBSX1RBR0dFRF9BRERS
X0VOQUJMRSwgMCwgMCwgMCkgPT0gMCkNCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgUFJfR0VUX0RVTVBBQkxFDQo+Pj4gLi4vbGliLm1rOjEzODogcmVj
aXBlIGZvciB0YXJnZXQgJy9ob21lL2NyaW1hcjAxL0FSTS9kZXYvc3JjL3Bkc3cvb3V0X2xpbnV4
Ly9rc2VsZnRlc3QvYXJtNjQvdGFnc190ZXN0JyBmYWlsZWQNCj4+PiBtYWtlWzNdOiAqKiogWy9o
b21lL2NyaW1hcjAxL0FSTS9kZXYvc3JjL3Bkc3cvb3V0X2xpbnV4Ly9rc2VsZnRlc3QvYXJtNjQv
dGFnc190ZXN0XSBFcnJvciAxDQo+Pj4gTWFrZWZpbGU6MTM2OiByZWNpcGUgZm9yIHRhcmdldCAn
YWxsJyBmYWlsZWQNCj4+PiBtYWtlWzJdOiAqKiogW2FsbF0gRXJyb3IgMg0KPj4+IC9ob21lL2Ny
aW1hcjAxL0FSTS9kZXYvc3JjL3Bkc3cvbGludXgvTWFrZWZpbGU6MTIzNzogcmVjaXBlIGZvciB0
YXJnZXQgJ2tzZWxmdGVzdCcgZmFpbGVkDQo+Pj4gbWFrZVsxXTogKioqIFtrc2VsZnRlc3RdIEVy
cm9yIDINCj4+PiBtYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2hvbWUvY3JpbWFyMDEvQVJN
L2Rldi9zcmMvcGRzdy9vdXRfbGludXgnDQo+Pj4gTWFrZWZpbGU6MTc5OiByZWNpcGUgZm9yIHRh
cmdldCAnc3ViLW1ha2UnIGZhaWxlZA0KPj4+IG1ha2U6ICoqKiBbc3ViLW1ha2VdIEVycm9yIDIN
Cj4+Pg0KPj4+IERlc3BpdGUgc2VlaW5nIEtTRlQgaW5zdGFsbGluZyBLZXJuZWwgSGVhZGVycywg
dGhleSBjYW5ub3QgYmUgZm91bmQuDQo+Pj4NCj4+PiBGaXhpbmcgdGhpcyBwYXRjaCBsaWtlIHRo
aXMgbWFrZSBpdCB3b3JrIGZvciBtZToNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9hcm02NC9NYWtlZmlsZSBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Fy
bTY0L01ha2VmaWxlDQo+Pj4gaW5kZXggYTYxYjJlNzQzZTk5Li5mOWY3OWZiMjcyZjAgMTAwNjQ0
DQo+Pj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvTWFrZWZpbGUNCj4+PiAr
KysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC9NYWtlZmlsZQ0KPj4+IEBAIC00LDYg
KzQsNyBAQA0KPj4+ICAgQVJDSCA/PSAkKHNoZWxsIHVuYW1lIC1tIDI+L2Rldi9udWxsIHx8IGVj
aG8gbm90KQ0KPj4+DQo+Pj4gICBpZm5lcSAoLCQoZmlsdGVyICQoQVJDSCksYWFyY2g2NCBhcm02
NCkpDQo+Pj4gK0NGTEFHUyArPSAtSS4uLy4uLy4uLy4uL3Vzci9pbmNsdWRlLw0KPj4+ICAgVEVT
VF9HRU5fUFJPR1MgOj0gdGFnc190ZXN0DQo+Pj4gICBURVNUX1BST0dTIDo9IHJ1bl90YWdzX3Rl
c3Quc2gNCj4+PiAgIGVuZGlmDQo+Pj4NCj4+PiBidXQgaXMgbm90IHJlYWxseSBhIHByb3BlciBm
aXggc2luY2UgaXQgZG9lcyBOT1QgYWNjb3VudCBmb3IgY2FzZSBpbiB3aGljaCB5b3UgaGF2ZQ0K
Pj4+IGluc3RhbGxlZCB0aGUgS2VybmVsIEhlYWRlcnMgaW4gYSBub24gc3RhbmRhcmQgbG9jYXRp
b24gbGlrZSB3aGVuIHlvdSB1c2UgS0JVSUxEX09VVFBVVC4NCj4+Pg0KPj4+IEFtIEkgbWlzc2lu
ZyBzb21ldGhpbmcgPw0KPj4NCj4+IEhtLCBQUl9TRVRfVEFHR0VEX0FERFJfQ1RSTCBpcyBkZWZp
bmVkIGluIGluY2x1ZGUvdWFwaS9saW51eC9wcmN0bC5oLA0KPj4gYW5kIHRoZSB0ZXN0IGhhcyAj
aW5jbHVkZSA8c3lzL3ByY3RsLmg+IHNvIGFzIGxvbmcgYXMgeW91J3ZlIHVwZGF0ZWQNCj4+IHlv
dXIga2VybmVsIGhlYWRlcnMgdGhpcyBzaG91bGQgd29yay4NCj4+DQo+PiAoSSdtIE9PTyBuZXh0
IHdlZWssIEknbGwgc2VlIGlmIEkgY2FuIHJlcHJvZHVjZSB0aGlzIG9uY2UgSSdtIGJhY2spLg0K
Pg0KPiBPay4gVGhhbmtzIGZvciB0aGUgcmVwbHkuDQo+DQo+IEkgdGhpbmsgSSd2ZSBnb3QgaXQg
aW4gbXkgbG9jYWwgdHJlZSBoYXZpbmcgY2xvbmVkIGFybTY0L2Zvci1uZXh0LWNvcmU6DQo+DQo+
IDE4OjMyICQgZWdyZXAgLUEgMTAgUFJfU0VUX1RBRyAuL2luY2x1ZGUvdWFwaS9saW51eC9wcmN0
bC5oDQo+ICNkZWZpbmUgUFJfU0VUX1RBR0dFRF9BRERSX0NUUkwgICAgICAgICA1NQ0KPiAjZGVm
aW5lIFBSX0dFVF9UQUdHRURfQUREUl9DVFJMICAgICAgICAgNTYNCj4gIyBkZWZpbmUgUFJfVEFH
R0VEX0FERFJfRU5BQkxFICAgICAgICAgICgxVUwgPDwgMCkNCj4NCj4gI2VuZGlmIC8qIF9MSU5V
WF9QUkNUTF9IICovDQo+DQo+IGFuZCBLZXJuZWwgaGVhZGVyIGFyZSBsb2NhbGx5IGluc3RhbGxl
ZCBpbiBteSBrZXJuZWwgc3JjIGRpciAoYnkgS1NGVCBpbmRlZWQpDQo+DQo+IDE4OjM0ICQgZWdy
ZXAgLVJBIDEwIFBSX1NFVF9UQUcgdXNyL2luY2x1ZGUvDQo+IHVzci9pbmNsdWRlL2xpbnV4L3By
Y3RsLmg6I2RlZmluZSBQUl9TRVRfVEFHR0VEX0FERFJfQ1RSTCAgICAgICAgICAgICAgIDU1DQo+
IHVzci9pbmNsdWRlL2xpbnV4L3ByY3RsLmgtI2RlZmluZSBQUl9HRVRfVEFHR0VEX0FERFJfQ1RS
TCAgICAgICAgICAgICAgIDU2DQo+IHVzci9pbmNsdWRlL2xpbnV4L3ByY3RsLmgtIyBkZWZpbmUg
UFJfVEFHR0VEX0FERFJfRU5BQkxFICAgICAgICAgICAgICAgICgxVUwgPDwgMCkNCj4gdXNyL2lu
Y2x1ZGUvbGludXgvcHJjdGwuaC0NCj4gdXNyL2luY2x1ZGUvbGludXgvcHJjdGwuaC0jZW5kaWYg
LyogX0xJTlVYX1BSQ1RMX0ggKi8NCj4NCj4gYnV0IGhvdyBhcmUgdGhleSBzdXBwb3NlZCB0byBi
ZSBmb3VuZCBpZiBub3IgdGhlIHRlc3QgTWFrZWZpbGUNCj4gbmVpdGhlciB0aGUgS1NGVCBNYWtl
ZmlsZSB3aG8gaW5zdGFsbHMgdGhlbSBwYXNzIGFueSAtSSBvcHRpb25zIHRvIHRoZQ0KPiBjb21w
aWxlciA/DQo+IEkgc3VwcG9zZSA8c3lzL3ByY3RsLmg+IHRyaWVzIHRvIGluY2x1ZGUgYXJjaCBz
cGVjaWZpYyBoZWFkZXJzIGZyb20gdGhlIHJlZ3VsYXIgc3lzdGVtIHBhdGgsDQo+IGJ1dCB3aGVu
IHlvdSBhcmUgY3Jvc3MtY29tcGlsaW5nID8NCkkgZ3Vlc3MgZm9yIGNyb3NzLWNvbXBpbGluZyBp
dCBwaWNrcyBmcm9tIGNyb3NzX2NvbXBpbGVyIHBhdGggaW5jbHVkZQ0KaGVhZGVycyBwYXRoIHdp
dGhvdXQgZXhwbGljaXRseSBkaXNwbGF5aW5nIGl0IGluIGNvbXBpbGF0aW9uIGxvZ3MuDQo+DQo+
IDE4OjM0ICQgbWFrZSBUQVJHRVRTPWFybTY0IGtzZWxmdGVzdA0KPiBtYWtlWzFdOiBFbnRlcmlu
ZyBkaXJlY3RvcnkgJy9ob21lL2NyaW1hcjAxL0FSTS9kZXYvc3JjL3Bkc3cvb3V0X2xpbnV4Jw0K
PiBhcmNoL2FybTY0L01ha2VmaWxlOjU2OiBDUk9TU19DT01QSUxFX0NPTVBBVCBub3QgZGVmaW5l
ZCBvciBlbXB0eSwgdGhlIGNvbXBhdCB2RFNPIHdpbGwgbm90IGJlIGJ1aWx0DQo+IG1ha2UgLS1u
by1idWlsdGluLXJ1bGVzIElOU1RBTExfSERSX1BBVEg9JEJVSUxEL3VzciBcDQo+ICAgICAgICAg
IEFSQ0g9YXJtNjQgLUMgLi4vLi4vLi4gaGVhZGVyc19pbnN0YWxsDQo+ICAgIElOU1RBTEwgL2hv
bWUvY3JpbWFyMDEvQVJNL2Rldi9zcmMvcGRzdy9vdXRfbGludXgva3NlbGZ0ZXN0L3Vzci9pbmNs
dWRlDQo+IC9vcHQvdG9vbGNoYWlucy9nY2MtYXJtLTguMy0yMDE5LjAzLXg4Nl82NC1hYXJjaDY0
LWxpbnV4LWdudS9iaW4vYWFyY2g2NC1saW51eC1nbnUtZ2NjIC1XYWxsIC1PMiAtZyAgICB0YWdz
X3Rlc3QuYyAgLW8gL2hvbWUvY3JpbWFyMDEvQVJNL2Rldi9zcmMvcGRzdy9vdXRfbGludXgva3Nl
bGZ0ZXN0L2FybTY0L3RhZ3MvdGFnc190ZXN0DQo+IHRhZ3NfdGVzdC5jOiBJbiBmdW5jdGlvbiDi
gJhtYWlu4oCZOg0KPiB0YWdzX3Rlc3QuYzoyMDoxMjogZXJyb3I6IOKAmFBSX1NFVF9UQUdHRURf
QUREUl9DVFJM4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlk
IHlvdSBtZWFuIOKAmFBSX0dFVF9USURfQUREUkVTU+KAmT8NCj4gICAgaWYgKHByY3RsKFBSX1NF
VF9UQUdHRURfQUREUl9DVFJMLCBQUl9UQUdHRURfQUREUl9FTkFCTEUsIDAsIDAsIDApID09IDAp
DQo+ICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPiAgICAgICAgICAgICAg
UFJfR0VUX1RJRF9BRERSRVNTDQo+IHRhZ3NfdGVzdC5jOjIwOjEyOiBub3RlOiBlYWNoIHVuZGVj
bGFyZWQgaWRlbnRpZmllciBpcyByZXBvcnRlZCBvbmx5IG9uY2UgZm9yIGVhY2ggZnVuY3Rpb24g
aXQgYXBwZWFycyBpbg0KPiB0YWdzX3Rlc3QuYzoyMDozNzogZXJyb3I6IOKAmFBSX1RBR0dFRF9B
RERSX0VOQUJMReKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRp
ZCB5b3UgbWVhbiDigJhQUl9HRVRfRFVNUEFCTEXigJk/DQo+ICAgIGlmIChwcmN0bChQUl9TRVRf
VEFHR0VEX0FERFJfQ1RSTCwgUFJfVEFHR0VEX0FERFJfRU5BQkxFLCAwLCAwLCAwKSA9PSAwKQ0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+
fn5+fg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBSX0dFVF9EVU1Q
QUJMRQ0KPiAuLi8uLi9saWIubWs6MTM4OiByZWNpcGUgZm9yIHRhcmdldCAnL2hvbWUvY3JpbWFy
MDEvQVJNL2Rldi9zcmMvcGRzdy9vdXRfbGludXgva3NlbGZ0ZXN0L2FybTY0L3RhZ3MvdGFnc190
ZXN0JyBmYWlsZWQNCj4gbWFrZVs0XTogKioqIFsvaG9tZS9jcmltYXIwMS9BUk0vZGV2L3NyYy9w
ZHN3L291dF9saW51eC9rc2VsZnRlc3QvYXJtNjQvdGFncy90YWdzX3Rlc3RdIEVycm9yIDENCj4g
TWFrZWZpbGU6MTk6IHJlY2lwZSBmb3IgdGFyZ2V0ICdhbGwnIGZhaWxlZA0KPiBtYWtlWzNdOiAq
KiogW2FsbF0gRXJyb3IgMg0KPiBNYWtlZmlsZToxMzc6IHJlY2lwZSBmb3IgdGFyZ2V0ICdhbGwn
IGZhaWxlZA0KPiBtYWtlWzJdOiAqKiogW2FsbF0gRXJyb3IgMg0KPiAvaG9tZS9jcmltYXIwMS9B
Uk0vZGV2L3NyYy9wZHN3L2xpbnV4L01ha2VmaWxlOjEyMzY6IHJlY2lwZSBmb3IgdGFyZ2V0ICdr
c2VsZnRlc3QnIGZhaWxlZA0KPiBtYWtlWzFdOiAqKiogW2tzZWxmdGVzdF0gRXJyb3IgMg0KPiBt
YWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2hvbWUvY3JpbWFyMDEvQVJNL2Rldi9zcmMvcGRz
dy9vdXRfbGludXgnDQo+IE1ha2VmaWxlOjE3OTogcmVjaXBlIGZvciB0YXJnZXQgJ3N1Yi1tYWtl
JyBmYWlsZWQNCj4gbWFrZTogKioqIFtzdWItbWFrZV0gRXJyb3IgMg0KPg0KPg0KPiBJbiBmYWN0
IG1hbnkgS1NGVCB0ZXN0Y2FzZXMgc2VlbXMgdG8gYnJ1dGFsbHkgYWRkIGRlZmF1bHQgaGVhZGVy
cyBwYXRoOg0KPg0KPiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9tZW1mZC9NYWtlZmlsZTpDRkxB
R1MgKz0gLUkuLi8uLi8uLi8uLi9pbmNsdWRlL3VhcGkvDQo+IHRvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL21lbWZkL01ha2VmaWxlOkNGTEFHUyArPSAtSS4uLy4uLy4uLy4uL2luY2x1ZGUvDQo+IHRv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL21lbWZkL01ha2VmaWxlOkNGTEFHUyArPSAtSS4uLy4uLy4u
Ly4uL3Vzci9pbmNsdWRlLw0KPiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvTWFrZWZpbGU6
Q0ZMQUdTICs9IC1JLi4vLi4vLi4vLi4vdXNyL2luY2x1ZGUvDQo+IHRvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL21lbWJhcnJpZXIvTWFrZWZpbGU6Q0ZMQUdTICs9IC1nIC1JLi4vLi4vLi4vLi4vdXNy
L2luY2x1ZGUvDQpBZ3JlZSB3aXRoIENyaXN0aWFuIHRoYXQgaW5jbHVkaW5nIGxpa2UgdGhpcyBp
cyBiZXR0ZXIgYXMgaXQgYWxsb3dzDQpmcmVlZG9tIGZyb20gdG9vbGNoYWluIHdpdGggbGF0ZXN0
IGtlcm5lbCBoZWFkZXJzLiBBbnl3YXkgdGhlcmUgYXJlIG1hbnkNCnBsYWNlcyB3aGVyZSAiL3N5
cy9wcmN0bC5oIiBpcyB1c2VkLg0KDQovL0FtaXQNCj4gLi4uDQo+DQo+IENoZWVycw0KPg0KPiBD
cmlzdGlhbg0KPj4NCj4+DQo+Pg0KPj4+DQo+Pj4gVGhhbmtzDQo+Pj4NCj4+PiBDcmlzdGlhbg0K
Pj4+DQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02
NC8uZ2l0aWdub3JlIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvLmdpdGlnbm9yZQ0K
Pj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmU4ZmFl
OGQ2MWVkNg0KPj4+PiAtLS0gL2Rldi9udWxsDQo+Pj4+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2FybTY0Ly5naXRpZ25vcmUNCj4+Pj4gQEAgLTAsMCArMSBAQA0KPj4+PiArdGFnc190
ZXN0DQo+Pj4+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC9NYWtl
ZmlsZSBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L01ha2VmaWxlDQo+Pj4+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0DQo+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uYTYxYjJlNzQzZTk5DQo+
Pj4+IC0tLSAvZGV2L251bGwNCj4+Pj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJt
NjQvTWFrZWZpbGUNCj4+Pj4gQEAgLTAsMCArMSwxMSBAQA0KPj4+PiArIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMA0KPj4+PiArDQo+Pj4+ICsjIEFSQ0ggY2FuIGJlIG92ZXJyaWRk
ZW4gYnkgdGhlIHVzZXIgZm9yIGNyb3NzIGNvbXBpbGluZw0KPj4+PiArQVJDSCA/PSAkKHNoZWxs
IHVuYW1lIC1tIDI+L2Rldi9udWxsIHx8IGVjaG8gbm90KQ0KPj4+PiArDQo+Pj4+ICtpZm5lcSAo
LCQoZmlsdGVyICQoQVJDSCksYWFyY2g2NCBhcm02NCkpDQo+Pj4+ICtURVNUX0dFTl9QUk9HUyA6
PSB0YWdzX3Rlc3QNCj4+Pj4gK1RFU1RfUFJPR1MgOj0gcnVuX3RhZ3NfdGVzdC5zaA0KPj4+PiAr
ZW5kaWYNCj4+Pj4gKw0KPj4+PiAraW5jbHVkZSAuLi9saWIubWsNCj4+Pj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L3J1bl90YWdzX3Rlc3Quc2ggYi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC9ydW5fdGFnc190ZXN0LnNoDQo+Pj4+IG5ldyBmaWxlIG1v
ZGUgMTAwNzU1DQo+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNzQ1ZjExMzc5OTMwDQo+Pj4+IC0t
LSAvZGV2L251bGwNCj4+Pj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvcnVu
X3RhZ3NfdGVzdC5zaA0KPj4+PiBAQCAtMCwwICsxLDEyIEBADQo+Pj4+ICsjIS9iaW4vc2gNCj4+
Pj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4+Pj4gKw0KPj4+PiArZWNo
byAiLS0tLS0tLS0tLS0tLS0tLS0tLS0iDQo+Pj4+ICtlY2hvICJydW5uaW5nIHRhZ3MgdGVzdCIN
Cj4+Pj4gK2VjaG8gIi0tLS0tLS0tLS0tLS0tLS0tLS0tIg0KPj4+PiArLi90YWdzX3Rlc3QNCj4+
Pj4gK2lmIFsgJD8gLW5lIDAgXTsgdGhlbg0KPj4+PiArICAgICBlY2hvICJbRkFJTF0iDQo+Pj4+
ICtlbHNlDQo+Pj4+ICsgICAgIGVjaG8gIltQQVNTXSINCj4+Pj4gK2ZpDQo+Pj4+IGRpZmYgLS1n
aXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC90YWdzX3Rlc3QuYyBiL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2FybTY0L3RhZ3NfdGVzdC5jDQo+Pj4+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0DQo+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uMjJhMWIyNjZlMzczDQo+Pj4+IC0tLSAvZGV2
L251bGwNCj4+Pj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvdGFnc190ZXN0
LmMNCj4+Pj4gQEAgLTAsMCArMSwyOSBAQA0KPj4+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjANCj4+Pj4gKw0KPj4+PiArI2luY2x1ZGUgPHN0ZGlvLmg+DQo+Pj4+ICsjaW5j
bHVkZSA8c3RkbGliLmg+DQo+Pj4+ICsjaW5jbHVkZSA8dW5pc3RkLmg+DQo+Pj4+ICsjaW5jbHVk
ZSA8c3RkaW50Lmg+DQo+Pj4+ICsjaW5jbHVkZSA8c3lzL3ByY3RsLmg+DQo+Pj4+ICsjaW5jbHVk
ZSA8c3lzL3V0c25hbWUuaD4NCj4+Pj4gKw0KPj4+PiArI2RlZmluZSBTSElGVF9UQUcodGFnKSAg
ICAgICAgICAgICAgICgodWludDY0X3QpKHRhZykgPDwgNTYpDQo+Pj4+ICsjZGVmaW5lIFNFVF9U
QUcocHRyLCB0YWcpICAgICgoKHVpbnQ2NF90KShwdHIpICYgflNISUZUX1RBRygweGZmKSkgfCBc
DQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0hJRlRfVEFHKHRh
ZykpDQo+Pj4+ICsNCj4+Pj4gK2ludCBtYWluKHZvaWQpDQo+Pj4+ICt7DQo+Pj4+ICsgICAgIHN0
YXRpYyBpbnQgdGJpX2VuYWJsZWQgPSAwOw0KPj4+PiArICAgICBzdHJ1Y3QgdXRzbmFtZSAqcHRy
LCAqdGFnZ2VkX3B0cjsNCj4+Pj4gKyAgICAgaW50IGVycjsNCj4+Pj4gKw0KPj4+PiArICAgICBp
ZiAocHJjdGwoUFJfU0VUX1RBR0dFRF9BRERSX0NUUkwsIFBSX1RBR0dFRF9BRERSX0VOQUJMRSwg
MCwgMCwgMCkgPT0gMCkNCj4+Pj4gKyAgICAgICAgICAgICB0YmlfZW5hYmxlZCA9IDE7DQo+Pj4+
ICsgICAgIHB0ciA9IChzdHJ1Y3QgdXRzbmFtZSAqKW1hbGxvYyhzaXplb2YoKnB0cikpOw0KPj4+
PiArICAgICBpZiAodGJpX2VuYWJsZWQpDQo+Pj4+ICsgICAgICAgICAgICAgdGFnZ2VkX3B0ciA9
IChzdHJ1Y3QgdXRzbmFtZSAqKVNFVF9UQUcocHRyLCAweDQyKTsNCj4+Pj4gKyAgICAgZXJyID0g
dW5hbWUodGFnZ2VkX3B0cik7DQo+Pj4+ICsgICAgIGZyZWUocHRyKTsNCj4+Pj4gKw0KPj4+PiAr
ICAgICByZXR1cm4gZXJyOw0KPj4+PiArfQ0KPj4+Pg0KPj4+DQo+DQo+DQo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGxpbnV4LWFybS1rZXJuZWwg
bWFpbGluZyBsaXN0DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJu
ZWwNCj4NCklNUE9SVEFOVCBOT1RJQ0U6IFRoZSBjb250ZW50cyBvZiB0aGlzIGVtYWlsIGFuZCBh
bnkgYXR0YWNobWVudHMgYXJlIGNvbmZpZGVudGlhbCBhbmQgbWF5IGFsc28gYmUgcHJpdmlsZWdl
ZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIG5vdGlmeSB0
aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBkbyBub3QgZGlzY2xvc2UgdGhlIGNvbnRlbnRzIHRv
IGFueSBvdGhlciBwZXJzb24sIHVzZSBpdCBmb3IgYW55IHB1cnBvc2UsIG9yIHN0b3JlIG9yIGNv
cHkgdGhlIGluZm9ybWF0aW9uIGluIGFueSBtZWRpdW0uIFRoYW5rIHlvdS4NCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
