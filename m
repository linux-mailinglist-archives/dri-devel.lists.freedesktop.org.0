Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7FEBBE5A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 00:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A4B6E9A7;
	Mon, 23 Sep 2019 22:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20058.outbound.protection.outlook.com [40.107.2.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A823E6E9A7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 22:12:17 +0000 (UTC)
Received: from VI1PR08CA0265.eurprd08.prod.outlook.com (2603:10a6:803:dc::38)
 by HE1PR0802MB2409.eurprd08.prod.outlook.com (2603:10a6:3:dc::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.25; Mon, 23 Sep
 2019 22:12:11 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::205) by VI1PR08CA0265.outlook.office365.com
 (2603:10a6:803:dc::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.22 via Frontend
 Transport; Mon, 23 Sep 2019 22:12:11 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20 via Frontend Transport; Mon, 23 Sep 2019 22:12:10 +0000
Received: ("Tessian outbound 5061e1b5386c:v31");
 Mon, 23 Sep 2019 22:12:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 394ef2e6d5723c5b
X-CR-MTA-TID: 64aa7808
Received: from 6adc40626b39.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.0.58]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 551BFE9E-9BF3-4F35-BA78-ED7BE706112A.1; 
 Mon, 23 Sep 2019 22:11:59 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6adc40626b39.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 Sep 2019 22:11:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJxSWvo3isi2rScM4EWK+R+ZSLube5YTwe1clPtFCpEXnkonb1U5x9qovDG4UH4Lp1iiH/4CQQQZ//hkdkVOoiXSlfMV4DQO2sq3cjlYHn+xBbu6RskMUhFJzA9s2R/ucoLJsZQqqmGleccL6MimK3QF5dZfdt8oql7FaZ2f3L/9Ddekq/Sd/lIZiqxzUKNztZzXsf2yM/VLy7EHwJ2Y3EZfX22qwuB8GFb7OG4w5LskUVJPKab7hyrD8lndx0dTh+v20O9HOLhXUOBPkiEWygi5Exa+D6+aR4IZJwg3NlgcNl+zrXYZxN2shQoGkzWhq8CpaXTDY4237oSnpWPf1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urxPYmK7WFuEBQebz6cMFWBH5/jJqKOTcrsaDyaE8ls=;
 b=OEaX/60YWtNUt6SWsrsGfSMqSyOZ40CdAeHDLmeSlLPl0Do6/uCzMsLOuHEjMcHls21r3xcYjtPoDHiwK2XLbt8bR3M3OiAy2iC4puPBlYp0Luo1m9vnSsUXsQE6A48uDn049d4TCKDpUdFVx9kePB4kZhceWtjHAtPfvZMgTQChW+AXPtJNdGvcY/dZIZJ+UnNOqXXB5O/mWDtkJ9GciMacgkFQindGtUZ4XImwcg9CzN3yDPga6vWrty0hTiubEahnH5KvkuNxIl/OC1ShpMnU8Ei/+3YWI/a08TGSXLYMcxGa2C7v9VRd8f8xT1NITaSkz2A7GLIBb8Umd5XDXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Mon, 23 Sep 2019 22:11:56 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::3d72:3e6c:cb97:8976]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::3d72:3e6c:cb97:8976%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 22:11:56 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RESEND][PATCH v8 5/5] kselftests: Add dma-heap test
Thread-Topic: [RESEND][PATCH v8 5/5] kselftests: Add dma-heap test
Thread-Index: AQHVZOOJZ3fRkDl+s0aCkKKSUkpz7qc57gQA
Date: Mon, 23 Sep 2019 22:11:56 +0000
Message-ID: <20190923221150.lolc72yvuyazqhr6@DESKTOP-E1NTVVP.localdomain>
References: <20190906184712.91980-1-john.stultz@linaro.org>
 <20190906184712.91980-6-john.stultz@linaro.org>
In-Reply-To: <20190906184712.91980-6-john.stultz@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [195.233.151.165]
x-clientproxiedby: MRXP264CA0029.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::17) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 0557261c-dcab-41c6-d148-08d740731440
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM6PR08MB3829; 
X-MS-TrafficTypeDiagnostic: AM6PR08MB3829:|AM6PR08MB3829:|HE1PR0802MB2409:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0802MB240904343B15ED9E51E3C77AF0850@HE1PR0802MB2409.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1186;OLM:1186;
x-forefront-prvs: 0169092318
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(39850400004)(346002)(376002)(189003)(199004)(6506007)(26005)(7736002)(81166006)(186003)(52116002)(316002)(99286004)(64756008)(66476007)(66446008)(229853002)(66946007)(4326008)(25786009)(66556008)(446003)(9686003)(386003)(76176011)(6512007)(6246003)(102836004)(7416002)(58126008)(305945005)(476003)(6436002)(11346002)(5660300002)(2906002)(14454004)(71200400001)(71190400001)(54906003)(14444005)(6486002)(486006)(81156014)(256004)(44832011)(1076003)(6916009)(8676002)(6116002)(478600001)(8936002)(66066001)(86362001)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3829;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: y4wcpHbwn05Mh5/yTpViLC5sZUkdpN2NBz9UlgppBlkaXMQZ5dUjUQtzDWbufKxy7gPZ9G37qsfYPndpxQRfvbeaHP7MGoCI9VcfujFE23I81mVAnKOTeD8qDZxLTaTNThUb7+EJqy3ABgqeJ1rK9YRJQV+uIfPFhJLlh/EiFUDwZ8Ch7G8Jj2mwkopLcIth9jZ1keL9TZbwkI2LesFwOlMBMWhErJ/kXS5qXqX9fLe3EeTscM6o3O3eB5M0kqPtKMDqpmhRuBwXlFajwF0eu5GCmQO0VsFRbQpNsQM79gWpwDZGR8PiHY6d96/lmgXyAKsurb9D0xE4qd9Ytm8xD2FeiA50GZMPTWVRzYjaPVxxK4XkPRCifI4u7CN2NDUOPug9IDAxVOSMDgqjWCeyzdwaw3NBjgXfFWFqzWncFAQ=
Content-ID: <199E28AC96A5E743936B9CFDD040D20F@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3829
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(199004)(189003)(25786009)(1076003)(8676002)(229853002)(26826003)(386003)(126002)(11346002)(14444005)(102836004)(476003)(6862004)(97756001)(76130400001)(58126008)(6506007)(9686003)(6116002)(6512007)(50466002)(36906005)(8746002)(6486002)(47776003)(478600001)(3846002)(316002)(54906003)(486006)(66066001)(99286004)(22756006)(26005)(46406003)(336012)(86362001)(8936002)(4326008)(23726003)(305945005)(14454004)(70206006)(2906002)(356004)(76176011)(5660300002)(70586007)(446003)(6246003)(81166006)(63350400001)(7736002)(81156014)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0802MB2409;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 53729a3a-6f55-4478-0b3b-08d740730bc6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:HE1PR0802MB2409; 
NoDisclaimer: True
X-Forefront-PRVS: 0169092318
X-Microsoft-Antispam-Message-Info: 5lAdo0V7Y6quv5FygPci7fmHQyYFGEIEt1HrjQxPNY21Aw6bbNDdb/ULhR0xyWBCk77zb19jcRDaqnxNB8lNLH3fnUngu+qpXP9h5nSZc3dRfQznhMvpAw2peCmlbNCLvsQiZbbrBsySYi9XWSzpBaVh4d7tHw3Pt8VlG7joFoF+aVDc58Yl3CrTsqBOXPSsbjuSM4WAMZed91pzod3sEbgt3e6zgR/vh/QEuVYpopI2E1xNp5kVdUNB6bd0RK/q5r9m7fqvdM9T29py4QVSwON0rPZcqU5+3AD99xegnLe5F69ZCQKfMHRuNkiIHPnAIboIwwroxe/UaSBPgnhv1SyjZNvJKY5VSkg5qkv3wKnuGVPz9bt8a3+LNxLst8uMycf6drgenFkthjynqtugvb2yOxYj81OTneJ5fyywYzI=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2019 22:12:10.0078 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0557261c-dcab-41c6-d148-08d740731440
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2409
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urxPYmK7WFuEBQebz6cMFWBH5/jJqKOTcrsaDyaE8ls=;
 b=Fsp3h3Dkvq/8GUDhnVrjnYVuZqLPbiMALObxfLAWB7vSwQFV5syG7Zc/csSG+DNO9wF0O8vq/Tusjfc6IdchWnKhh4bUT1EAhuPVW7mQqWblKdycHT9mT+Jpc1V8P2k+3YhKOpsHvJrGrvnJRq60K7MFzql/asXoN3URRULaLDA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urxPYmK7WFuEBQebz6cMFWBH5/jJqKOTcrsaDyaE8ls=;
 b=Fsp3h3Dkvq/8GUDhnVrjnYVuZqLPbiMALObxfLAWB7vSwQFV5syG7Zc/csSG+DNO9wF0O8vq/Tusjfc6IdchWnKhh4bUT1EAhuPVW7mQqWblKdycHT9mT+Jpc1V8P2k+3YhKOpsHvJrGrvnJRq60K7MFzql/asXoN3URRULaLDA=
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
Cc: nd <nd@arm.com>, Alistair Strachan <astrachan@google.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F . Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9obiwKCkkgZGlkbid0IHNlZSBhbnkgcmVzcG9uc2UgYWJvdXQgdXNpbmcgdGhlIHRlc3Qg
aGFybmVzcy4gRGlkIHlvdSBkZWNpZGUKYWdhaW5zdCBpdD8KCk9uIEZyaSwgU2VwIDA2LCAyMDE5
IGF0IDA2OjQ3OjEyUE0gKzAwMDAsIEpvaG4gU3R1bHR6IHdyb3RlOgo+IEFkZCB2ZXJ5IHRyaXZp
YWwgYWxsb2NhdGlvbiBhbmQgaW1wb3J0IHRlc3QgZm9yIGRtYS1oZWFwcywKPiB1dGlsaXppbmcg
dGhlIHZnZW0gZHJpdmVyIGFzIGEgdGVzdCBpbXBvcnRlci4KPiAKPiBBIGdvb2QgY2h1bmsgb2Yg
dGhpcyBjb2RlIHRha2VuIGZyb206Cj4gICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hbmRyb2lk
L2lvbi9pb25tYXBfdGVzdC5jCj4gICBPcmlnaW5hbGx5IGJ5IExhdXJhIEFiYm90dCA8bGFiYm90
dEByZWRoYXQuY29tPgo+IAo+IENjOiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25h
cmRAbGluYXJvLm9yZz4KPiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9y
Zz4KPiBDYzogTGlhbSBNYXJrIDxsbWFya0Bjb2RlYXVyb3JhLm9yZz4KPiBDYzogUHJhdGlrIFBh
dGVsIDxwcmF0aWtwQGNvZGVhdXJvcmEub3JnPgo+IENjOiBCcmlhbiBTdGFya2V5IDxCcmlhbi5T
dGFya2V5QGFybS5jb20+Cj4gQ2M6IFZpbmNlbnQgRG9ubmVmb3J0IDxWaW5jZW50LkRvbm5lZm9y
dEBhcm0uY29tPgo+IENjOiBTdWRpcHRvIFBhdWwgPFN1ZGlwdG8uUGF1bEBhcm0uY29tPgo+IENj
OiBBbmRyZXcgRi4gRGF2aXMgPGFmZEB0aS5jb20+Cj4gQ2M6IENocmlzdG9waCBIZWxsd2lnIDxo
Y2hAaW5mcmFkZWFkLm9yZz4KPiBDYzogQ2hlbmJvIEZlbmcgPGZlbmdjQGdvb2dsZS5jb20+Cj4g
Q2M6IEFsaXN0YWlyIFN0cmFjaGFuIDxhc3RyYWNoYW5AZ29vZ2xlLmNvbT4KPiBDYzogSHJpZHlh
IFZhbHNhcmFqdSA8aHJpZHlhQGdvb2dsZS5jb20+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBSZXZpZXdlZC1ieTogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdh
aWduYXJkQGxpbmFyby5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHogPGpvaG4uc3R1
bHR6QGxpbmFyby5vcmc+Cj4gLS0tCj4gdjI6Cj4gKiBTd2l0Y2hlZCB0byB1c2UgcmV3b3JrZWQg
ZG1hLWhlYXAgYXBpcwo+IHYzOgo+ICogQWRkIHNpbXBsZSBtbWFwCj4gKiBVdGlsaXplIGRtYS1i
dWYgdGVzdGRldiB0byB0ZXN0IGltcG9ydGluZwo+IHY0Ogo+ICogUmV3b3JrIHRvIHVzZSB2Z2Vt
Cj4gKiBQYXNzIGluIGZkX2ZsYWdzIHRvIG1hdGNoIGludGVyZmFjZSBjaGFuZ2VzCj4gKiBTa2lw
IC4gYW5kIC4uIGRpcnMKPiB2NjoKPiAqIE51bWJlciBvZiBzdHlsZS9jbGVhbnVwcyBzdWdnZXN0
ZWQgYnkgQnJpYW4KPiB2NzoKPiAqIFdoaXRlc3BhY2UgZml4dXAgZm9yIGNoZWNrcGF0Y2gKPiB2
ODoKPiAqIE1vcmUgY2hlY2twYXRjaCB3aGl0ZXNwYWNlIGZpeHVwcwo+IC0tLQo+ICB0b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9kbWFidWYtaGVhcHMvTWFrZWZpbGUgfCAgIDkgKwo+ICAuLi4vc2Vs
ZnRlc3RzL2RtYWJ1Zi1oZWFwcy9kbWFidWYtaGVhcC5jICAgICAgfCAyMzAgKysrKysrKysrKysr
KysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjM5IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2RtYWJ1Zi1oZWFwcy9NYWtlZmlsZQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZG1hYnVmLWhlYXBz
L2RtYWJ1Zi1oZWFwLmMKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
ZG1hYnVmLWhlYXBzL01ha2VmaWxlIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZG1hYnVmLWhl
YXBzL01ha2VmaWxlCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAu
LjhjNGMzNmUyOTcyZAo+IC0tLSAvZGV2L251bGwKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9kbWFidWYtaGVhcHMvTWFrZWZpbGUKPiBAQCAtMCwwICsxLDkgQEAKPiArIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICtDRkxBR1MgKz0gLXN0YXRpYyAtTzMgLVdsLC1u
by1hcy1uZWVkZWQgLVdhbGwKPiArI0xETElCUyArPSAtbHJ0IC1scHRocmVhZCAtbG0KPiArCj4g
KyMgdGhlc2UgYXJlIGFsbCAic2FmZSIgdGVzdHMgdGhhdCBkb24ndCBtb2RpZnkKPiArIyBzeXN0
ZW0gdGltZSBvciByZXF1aXJlIGVzY2FsYXRlZCBwcml2aWxlZ2VzCj4gK1RFU1RfR0VOX1BST0dT
ID0gZG1hYnVmLWhlYXAKPiArCj4gK2luY2x1ZGUgLi4vbGliLm1rCj4gZGlmZiAtLWdpdCBhL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2RtYWJ1Zi1oZWFwcy9kbWFidWYtaGVhcC5jIGIvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvZG1hYnVmLWhlYXBzL2RtYWJ1Zi1oZWFwLmMKPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uZTQzOWQ2Y2YzZDgxCj4gLS0tIC9kZXYv
bnVsbAo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2RtYWJ1Zi1oZWFwcy9kbWFidWYt
aGVhcC5jCj4gQEAgLTAsMCArMSwyMzAgQEAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAKPiArCj4gKyNpbmNsdWRlIDxkaXJlbnQuaD4KPiArI2luY2x1ZGUgPGVycm5vLmg+
Cj4gKyNpbmNsdWRlIDxmY250bC5oPgo+ICsjaW5jbHVkZSA8c3RkaW8uaD4KPiArI2luY2x1ZGUg
PHN0ZGxpYi5oPgo+ICsjaW5jbHVkZSA8c3RkaW50Lmg+Cj4gKyNpbmNsdWRlIDxzdHJpbmcuaD4K
PiArI2luY2x1ZGUgPHVuaXN0ZC5oPgo+ICsjaW5jbHVkZSA8c3lzL2lvY3RsLmg+Cj4gKyNpbmNs
dWRlIDxzeXMvbW1hbi5oPgo+ICsjaW5jbHVkZSA8c3lzL3R5cGVzLmg+Cj4gKwo+ICsjaW5jbHVk
ZSA8bGludXgvZG1hLWJ1Zi5oPgo+ICsjaW5jbHVkZSA8ZHJtL2RybS5oPgo+ICsKPiArI2luY2x1
ZGUgIi4uLy4uLy4uLy4uL2luY2x1ZGUvdWFwaS9saW51eC9kbWEtaGVhcC5oIgo+ICsKPiArI2Rl
ZmluZSBERVZQQVRIICIvZGV2L2RtYV9oZWFwIgo+ICsKPiArc3RhdGljIGludCBjaGVja192Z2Vt
KGludCBmZCkKPiArewo+ICsJZHJtX3ZlcnNpb25fdCB2ZXJzaW9uID0geyAwIH07Cj4gKwljaGFy
IG5hbWVbNV07Cj4gKwlpbnQgcmV0Owo+ICsKPiArCXZlcnNpb24ubmFtZV9sZW4gPSA0Owo+ICsJ
dmVyc2lvbi5uYW1lID0gbmFtZTsKPiArCj4gKwlyZXQgPSBpb2N0bChmZCwgRFJNX0lPQ1RMX1ZF
UlNJT04sICZ2ZXJzaW9uKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIDA7Cj4gKwo+ICsJcmV0
dXJuICFzdHJjbXAobmFtZSwgInZnZW0iKTsKPiArfQo+ICsKPiArc3RhdGljIGludCBvcGVuX3Zn
ZW0odm9pZCkKPiArewo+ICsJaW50IGksIGZkOwo+ICsJY29uc3QgY2hhciAqZHJtc3RyID0gIi9k
ZXYvZHJpL2NhcmQiOwo+ICsKPiArCWZkID0gLTE7Cj4gKwlmb3IgKGkgPSAwOyBpIDwgMTY7IGkr
Kykgewo+ICsJCWNoYXIgbmFtZVs4MF07Cj4gKwo+ICsJCXNwcmludGYobmFtZSwgIiVzJXUiLCBk
cm1zdHIsIGkpOwo+ICsKPiArCQlmZCA9IG9wZW4obmFtZSwgT19SRFdSKTsKPiArCQlpZiAoZmQg
PCAwKQo+ICsJCQljb250aW51ZTsKPiArCj4gKwkJaWYgKCFjaGVja192Z2VtKGZkKSkgewo+ICsJ
CQljbG9zZShmZCk7CgpJIGRpZG4ndCBzcG90IHRoaXMgbGFzdCB0aW1lLCBidXQgdGhlcmUncyBh
biAodW5saWtlbHkpIGVycm9yIHNjZW5hcmlvCmhlcmUgaWYgdGhlcmUncyA+PSAxNiBEUk0gZGV2
aWNlcyBhbmQgbm9uZSBvZiB0aGVtIGFyZSB2Z2VtLCB0aGVuCnlvdSdsbCByZXR1cm4gYSBzdGFs
ZSBmZC4KCj4gKwkJCWNvbnRpbnVlOwo+ICsJCX0gZWxzZSB7Cj4gKwkJCWJyZWFrOwo+ICsJCX0K
PiArCX0KPiArCXJldHVybiBmZDsKPiArfQo+ICsKPiArc3RhdGljIGludCBpbXBvcnRfdmdlbV9m
ZChpbnQgdmdlbV9mZCwgaW50IGRtYV9idWZfZmQsIHVpbnQzMl90ICpoYW5kbGUpCj4gK3sKPiAr
CXN0cnVjdCBkcm1fcHJpbWVfaGFuZGxlIGltcG9ydF9oYW5kbGUgPSB7Cj4gKwkJLmZkID0gZG1h
X2J1Zl9mZCwKPiArCQkuZmxhZ3MgPSAwLAo+ICsJCS5oYW5kbGUgPSAwLAo+ICsJIH07Cj4gKwlp
bnQgcmV0Owo+ICsKPiArCXJldCA9IGlvY3RsKHZnZW1fZmQsIERSTV9JT0NUTF9QUklNRV9GRF9U
T19IQU5ETEUsICZpbXBvcnRfaGFuZGxlKTsKPiArCWlmIChyZXQgPT0gMCkKPiArCQkqaGFuZGxl
ID0gaW1wb3J0X2hhbmRsZS5oYW5kbGU7Cj4gKwlyZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICtzdGF0
aWMgdm9pZCBjbG9zZV9oYW5kbGUoaW50IHZnZW1fZmQsIHVpbnQzMl90IGhhbmRsZSkKPiArewo+
ICsJc3RydWN0IGRybV9nZW1fY2xvc2UgY2xvc2UgPSB7Cj4gKwkJLmhhbmRsZSA9IGhhbmRsZSwK
PiArCX07Cj4gKwo+ICsJaW9jdGwodmdlbV9mZCwgRFJNX0lPQ1RMX0dFTV9DTE9TRSwgJmNsb3Nl
KTsKPiArfQo+ICsKPiArc3RhdGljIGludCBkbWFidWZfaGVhcF9vcGVuKGNoYXIgKm5hbWUpCj4g
K3sKPiArCWludCByZXQsIGZkOwo+ICsJY2hhciBidWZbMjU2XTsKPiArCj4gKwlyZXQgPSBzcHJp
bnRmKGJ1ZiwgIiVzLyVzIiwgREVWUEFUSCwgbmFtZSk7CgpzbnByaW50ZigpLCBqdXN0IGJlY2F1
c2Ugd2h5IG5vdD8KCj4gKwlpZiAocmV0IDwgMCkgewo+ICsJCXByaW50Zigic3ByaW50ZiBmYWls
ZWQhXG4iKTsKPiArCQlyZXR1cm4gcmV0Owo+ICsJfQo+ICsKPiArCWZkID0gb3BlbihidWYsIE9f
UkRXUik7Cj4gKwlpZiAoZmQgPCAwKQo+ICsJCXByaW50Zigib3BlbiAlcyBmYWlsZWQhXG4iLCBi
dWYpOwo+ICsJcmV0dXJuIGZkOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IGRtYWJ1Zl9oZWFwX2Fs
bG9jKGludCBmZCwgc2l6ZV90IGxlbiwgdW5zaWduZWQgaW50IGZsYWdzLAo+ICsJCQkgICAgIGlu
dCAqZG1hYnVmX2ZkKQo+ICt7Cj4gKwlzdHJ1Y3QgZG1hX2hlYXBfYWxsb2NhdGlvbl9kYXRhIGRh
dGEgPSB7Cj4gKwkJLmxlbiA9IGxlbiwKPiArCQkuZmRfZmxhZ3MgPSBPX1JEV1IgfCBPX0NMT0VY
RUMsCj4gKwkJLmhlYXBfZmxhZ3MgPSBmbGFncywKPiArCX07Cj4gKwlpbnQgcmV0Owo+ICsKPiAr
CWlmICghZG1hYnVmX2ZkKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKPiArCXJldCA9IGlvY3Rs
KGZkLCBETUFfSEVBUF9JT0NfQUxMT0MsICZkYXRhKTsKPiArCWlmIChyZXQgPCAwKQo+ICsJCXJl
dHVybiByZXQ7Cj4gKwkqZG1hYnVmX2ZkID0gKGludClkYXRhLmZkOwo+ICsJcmV0dXJuIHJldDsK
PiArfQo+ICsKPiArc3RhdGljIHZvaWQgZG1hYnVmX3N5bmMoaW50IGZkLCBpbnQgc3RhcnRfc3Rv
cCkKPiArewo+ICsJc3RydWN0IGRtYV9idWZfc3luYyBzeW5jID0gewo+ICsJCS5mbGFncyA9IHN0
YXJ0X3N0b3AgfCBETUFfQlVGX1NZTkNfUlcsCj4gKwl9Owo+ICsJaW50IHJldDsKPiArCj4gKwly
ZXQgPSBpb2N0bChmZCwgRE1BX0JVRl9JT0NUTF9TWU5DLCAmc3luYyk7Cj4gKwlpZiAocmV0KQo+
ICsJCXByaW50Zigic3luYyBmYWlsZWQgJWRcbiIsIGVycm5vKTsKPiArfQo+ICsKPiArI2RlZmlu
ZSBPTkVfTUVHICgxMDI0ICogMTAyNCkKPiArCj4gK3N0YXRpYyB2b2lkIGRvX3Rlc3QoY2hhciAq
aGVhcF9uYW1lKQo+ICt7Cj4gKwlpbnQgaGVhcF9mZCA9IC0xLCBkbWFidWZfZmQgPSAtMSwgaW1w
b3J0ZXJfZmQgPSAtMTsKPiArCXVpbnQzMl90IGhhbmRsZSA9IDA7Cj4gKwl2b2lkICpwID0gTlVM
TDsKPiArCWludCByZXQ7Cj4gKwo+ICsJcHJpbnRmKCJUZXN0aW5nIGhlYXA6ICVzXG4iLCBoZWFw
X25hbWUpOwo+ICsKPiArCWhlYXBfZmQgPSBkbWFidWZfaGVhcF9vcGVuKGhlYXBfbmFtZSk7Cj4g
KwlpZiAoaGVhcF9mZCA8IDApCj4gKwkJcmV0dXJuOwo+ICsKPiArCXByaW50ZigiQWxsb2NhdGlu
ZyAxIE1FR1xuIik7Cj4gKwlyZXQgPSBkbWFidWZfaGVhcF9hbGxvYyhoZWFwX2ZkLCBPTkVfTUVH
LCAwLCAmZG1hYnVmX2ZkKTsKPiArCWlmIChyZXQpIHsKPiArCQlwcmludGYoIkFsbG9jYXRpb24g
RmFpbGVkIVxuIik7Cj4gKwkJZ290byBvdXQ7Cj4gKwl9Cj4gKwkvKiBtbWFwIGFuZCB3cml0ZSBh
IHNpbXBsZSBwYXR0ZXJuICovCj4gKwlwID0gbW1hcChOVUxMLAo+ICsJCSBPTkVfTUVHLAo+ICsJ
CSBQUk9UX1JFQUQgfCBQUk9UX1dSSVRFLAo+ICsJCSBNQVBfU0hBUkVELAo+ICsJCSBkbWFidWZf
ZmQsCj4gKwkJIDApOwo+ICsJaWYgKHAgPT0gTUFQX0ZBSUxFRCkgewo+ICsJCXByaW50ZigibW1h
cCgpIGZhaWxlZDogJW1cbiIpOwo+ICsJCWdvdG8gb3V0Owo+ICsJfQo+ICsJcHJpbnRmKCJtbWFw
IHBhc3NlZFxuIik7Cj4gKwo+ICsJZG1hYnVmX3N5bmMoZG1hYnVmX2ZkLCBETUFfQlVGX1NZTkNf
U1RBUlQpOwo+ICsKPiArCW1lbXNldChwLCAxLCBPTkVfTUVHIC8gMik7Cj4gKwltZW1zZXQoKGNo
YXIgKilwICsgT05FX01FRyAvIDIsIDAsIE9ORV9NRUcgLyAyKTsKPiArCWRtYWJ1Zl9zeW5jKGRt
YWJ1Zl9mZCwgRE1BX0JVRl9TWU5DX0VORCk7Cj4gKwo+ICsJaW1wb3J0ZXJfZmQgPSBvcGVuX3Zn
ZW0oKTsKPiArCWlmIChpbXBvcnRlcl9mZCA8IDApIHsKPiArCQlyZXQgPSBpbXBvcnRlcl9mZDsK
PiArCQlwcmludGYoIkZhaWxlZCB0byBvcGVuIHZnZW1cbiIpOwo+ICsJCWdvdG8gb3V0Owo+ICsJ
fQo+ICsKPiArCXJldCA9IGltcG9ydF92Z2VtX2ZkKGltcG9ydGVyX2ZkLCBkbWFidWZfZmQsICZo
YW5kbGUpOwo+ICsJaWYgKHJldCA8IDApIHsKPiArCQlwcmludGYoIkZhaWxlZCB0byBpbXBvcnQg
YnVmZmVyXG4iKTsKPiArCQlnb3RvIG91dDsKPiArCX0KPiArCXByaW50ZigiaW1wb3J0IHBhc3Nl
ZFxuIik7Cj4gKwo+ICsJZG1hYnVmX3N5bmMoZG1hYnVmX2ZkLCBETUFfQlVGX1NZTkNfU1RBUlQp
Owo+ICsJbWVtc2V0KHAsIDB4ZmYsIE9ORV9NRUcpOwo+ICsJZG1hYnVmX3N5bmMoZG1hYnVmX2Zk
LCBETUFfQlVGX1NZTkNfRU5EKTsKPiArCXByaW50Zigic3luY3MgcGFzc2VkXG4iKTsKPiArCj4g
KwljbG9zZV9oYW5kbGUoaW1wb3J0ZXJfZmQsIGhhbmRsZSk7Cj4gKwo+ICtvdXQ6Cj4gKwlpZiAo
cCkKPiArCQltdW5tYXAocCwgT05FX01FRyk7Cj4gKwlpZiAoaW1wb3J0ZXJfZmQgPj0gMCkKPiAr
CQljbG9zZShpbXBvcnRlcl9mZCk7Cj4gKwlpZiAoZG1hYnVmX2ZkID49IDApCj4gKwkJY2xvc2Uo
ZG1hYnVmX2ZkKTsKPiArCWlmIChoZWFwX2ZkID49IDApCj4gKwkJY2xvc2UoaGVhcF9mZCk7Cj4g
K30KPiArCj4gK2ludCBtYWluKHZvaWQpCj4gK3sKPiArCURJUiAqZDsKPiArCXN0cnVjdCBkaXJl
bnQgKmRpcjsKPiArCj4gKwlkID0gb3BlbmRpcihERVZQQVRIKTsKPiArCWlmICghZCkgewo+ICsJ
CXByaW50ZigiTm8gJXMgZGlyZWN0b3J5P1xuIiwgREVWUEFUSCk7Cj4gKwkJcmV0dXJuIC0xOwo+
ICsJfQo+ICsKPiArCXdoaWxlICgoZGlyID0gcmVhZGRpcihkKSkgIT0gTlVMTCkgewo+ICsJCWlm
ICghc3RybmNtcChkaXItPmRfbmFtZSwgIi4iLCAyKSkKPiArCQkJY29udGludWU7Cj4gKwkJaWYg
KCFzdHJuY21wKGRpci0+ZF9uYW1lLCAiLi4iLCAzKSkKPiArCQkJY29udGludWU7Cj4gKwo+ICsJ
CWRvX3Rlc3QoZGlyLT5kX25hbWUpOwoKQXMgZmFyIGFzIEkgdW5kZXJzdGFuZCBpdCwgaWYgbWFp
bigpIGFsd2F5cyByZXR1cm5zIHplcm8sIHRoaXMgdGVzdCB3aWxsCmFsd2F5cyBiZSBpbmRpY2F0
ZWQgYXMgYSAicGFzcyIgLSBzaG91bGRuJ3QgdGhlcmUgYmUgYXQgbGVhc3Qgc29tZQpmYWlsdXJl
IHNjZW5hcmlvcz8KCkNoZWVycywKLUJyaWFuCgo+ICsJfQo+ICsJY2xvc2VkaXIoZCk7Cj4gKwo+
ICsJcmV0dXJuIDA7Cj4gK30KPiAtLSAKPiAyLjE3LjEKPiAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
