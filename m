Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0F2D3B28
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 10:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C106EBD7;
	Fri, 11 Oct 2019 08:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130042.outbound.protection.outlook.com [40.107.13.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCCD6EBD7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 08:31:08 +0000 (UTC)
Received: from HE1PR08CA0065.eurprd08.prod.outlook.com (2603:10a6:7:2a::36) by
 VI1PR0802MB2159.eurprd08.prod.outlook.com (2603:10a6:800:a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.19; Fri, 11 Oct
 2019 08:31:04 +0000
Received: from DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::205) by HE1PR08CA0065.outlook.office365.com
 (2603:10a6:7:2a::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 08:31:04 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT038.mail.protection.outlook.com (10.152.21.84) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 11 Oct 2019 08:31:02 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Fri, 11 Oct 2019 08:30:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 68e6a326f6d64bf2
X-CR-MTA-TID: 64aa7808
Received: from b8ac5cc8525d.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.12.54]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D47967A5-922A-49B0-970D-B7D8BFE0AD2C.1; 
 Fri, 11 Oct 2019 08:30:49 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b8ac5cc8525d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Oct 2019 08:30:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XiCdfVf81Pu8oCFEA3uNK6zlRncaKdZPEO4XMTtUcw6AM2z4Zx/vbnDQ6rI8IOcApvvZ5um6iU6kltFey+KB4EvAkt1jhn+TJ8Zz2J4priaM/AZHv8tJJWpJ8imwsYQpJGYoBkXuIOGmckxCa28zdDcz0oVr4JpmCYKqgQ+sLOd05PEOML8G8s68xs1Sdkd5PSsuMHIJeZYIfTEgph2EV8Zd+slr6NxoZix16noqhFGtqSTKUfY7L2no997q+ChmZjhX2T/+oqLEnNQPgAxwH1AJfiqa805E1tVp/YSOM4oy1gKpm3B/YPk+kbSAcZKL8stf5LwO8hxYaxneW+elNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vc5EzkiT6pm5A7kfwvn7ljic7GPKetn1aiDrllkA8qA=;
 b=kX/PZsTqQsejQdN5Onn7ElE5mcjDpgNaU8u2+jVRRdpjF1uQqKHkwUmgAmRId9SK6REdEFik48NRMG0Qvnp/Lx8oU4jYmi4c8663jrQiVAAXcPd88fHmLiiLtEMq4f9zWpc16a0MBjzJMHhsELumrDAhRyVbf+HceBK4d2V39VZb4nrMEvkZ66WW/aiNISAXyoMd3U1htvbJ5ez+iwFQVvM6/uEvZjoMOgb0HZhsoYUNV7SuxPHtcxK1FmpMnOn4DYAa/NDmu21Hw3CPjAyv0KHufP6miytL7S9H9YtV00funmlIkNb2XGCaRg3WTZKAe0TPjeeN1CMXIK8Gm74pTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2910.eurprd08.prod.outlook.com (10.175.245.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Fri, 11 Oct 2019 08:30:47 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2347.016; Fri, 11 Oct 2019
 08:30:47 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH v2 2/4] drm/komeda: Add drm_lut_to_fgamma_coeffs()
Thread-Topic: [PATCH v2 2/4] drm/komeda: Add drm_lut_to_fgamma_coeffs()
Thread-Index: AQHVf/cgyUi1BihLGUqjRrTFJfR086dVHGuA
Date: Fri, 11 Oct 2019 08:30:47 +0000
Message-ID: <2583309.pvr1AVrQub@e123338-lin>
References: <20191011054459.17984-1-james.qian.wang@arm.com>
 <20191011054459.17984-3-james.qian.wang@arm.com>
In-Reply-To: <20191011054459.17984-3-james.qian.wang@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.54]
x-clientproxiedby: CWLP123CA0016.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:56::28) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f307e545-7762-4ed3-3b63-08d74e2559d4
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB2910:|VI1PR08MB2910:|VI1PR0802MB2159:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0802MB21594A3F27988A3FA85144808F970@VI1PR0802MB2159.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5797;
x-forefront-prvs: 0187F3EA14
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(189003)(199004)(54906003)(6246003)(6506007)(76176011)(6486002)(6436002)(305945005)(476003)(7736002)(6116002)(386003)(186003)(102836004)(14454004)(52116002)(2906002)(9686003)(26005)(3846002)(25786009)(229853002)(256004)(14444005)(99286004)(486006)(316002)(33716001)(86362001)(6512007)(66066001)(5660300002)(66446008)(478600001)(71200400001)(71190400001)(4326008)(11346002)(6862004)(66476007)(66946007)(446003)(81156014)(81166006)(64756008)(6636002)(8936002)(8676002)(66556008)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2910;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: v3HSXOnWBvbx/rHxYcbssxlPTwtInk5jUjn6udN7OLHDWycfstavx0RIu5NDDM/W69P2MUreQxq7Yjb1sSX7BoRnNcgjnq49+U2wTpY50bEl0Q385kpHQuUhjqwCC9dx+mg1mJoaJ8XOLU/rAD622C+0TJqAA7kXS75jLayVY3J781L0vJwCMYqjc1lEZjWPE4QoKhDWPJfL0iYeV49iE5fIIMHIjnYePhsUfKJmrKGtybtn0eizdI+aN9E5X5VfKZQd6s+ePwXWjCqY8oBb1dv13D56pjftfFDl+JMR35W4E2Flf5tVozMr9gF1lzdTHlP7F9tyakrSplFCZVJzjw1P2HZAH6J4BLcg508P43E4bO4+pVA9o/m4RByBUOeIpZ+waPJHqc1NYM3J+UjJz5lqtpTCZ+DCTkupmI57Zds=
Content-ID: <FAD8E2F806A05C4497900F5001DA7AA2@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2910
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(346002)(39860400002)(396003)(136003)(189003)(199004)(47776003)(478600001)(6506007)(76176011)(7736002)(486006)(14454004)(22756006)(33716001)(6116002)(6862004)(23726003)(54906003)(316002)(305945005)(70206006)(26826003)(70586007)(5660300002)(8676002)(8936002)(81156014)(8746002)(81166006)(386003)(46406003)(66066001)(229853002)(6486002)(50466002)(76130400001)(97756001)(102836004)(25786009)(26005)(9686003)(6512007)(446003)(63350400001)(186003)(6246003)(86362001)(11346002)(476003)(14444005)(4326008)(6636002)(3846002)(356004)(2906002)(99286004)(336012)(126002)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2159;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: d53e749e-0c48-4ba4-f78d-08d74e255094
NoDisclaimer: True
X-Forefront-PRVS: 0187F3EA14
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +8jFluvMez6inB3dQ3vxEcuTnHaTpkxdZ5elWNxbPvnhrI5FXEnBj6n9OHeJ9u7DytxEPMgQIe9oTqKxIabbPgFfPWGRPBaIBlYbQiW2IfYUl3Op31IhmC67/LgTmZQTMSI9TA6RsAIXyVXFLI2dQSU9FS0o6jNj7t+JX6RZSge33JZenj/EzsTZncXs4RSTI9BBwnY389IXozxb6OG0klhQ2Dva1vbjMSusrdUIllbZNJ8yLKHrwZb72NWdbYRMlXsgJXnlwGtXURAtQ0ZuBtbp0CI0mHm+50QKCC9b9EPF3m8x3QSUYVxVFZmQNbx6GGCVuRb38WMmJjHZGH7fXCzvBE5CV5yYjcSF6efNTFigV3yRAjw5qVENzOW/ianH/YshQhpJQ8240S7POOvDxMYZa4WR6KwgTuAzpWM8npY=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 08:31:02.3561 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f307e545-7762-4ed3-3b63-08d74e2559d4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2159
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vc5EzkiT6pm5A7kfwvn7ljic7GPKetn1aiDrllkA8qA=;
 b=BkTC3HDYzI/BegczSywSYKJNP4wpz+04vj7acM9Zy2QMlH7wZuUTbnxNmpW4bxZr3axmB4XYPI/DNm1T4UvJCH6mme7XjuqkwAkLK2yOD9s8NCpHYbqfhYLzJ+MNSZytqGmfIeHpe1FXtMZcVKRld5GvaHeNUG6PzEf0r4Wwkvc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vc5EzkiT6pm5A7kfwvn7ljic7GPKetn1aiDrllkA8qA=;
 b=BkTC3HDYzI/BegczSywSYKJNP4wpz+04vj7acM9Zy2QMlH7wZuUTbnxNmpW4bxZr3axmB4XYPI/DNm1T4UvJCH6mme7XjuqkwAkLK2yOD9s8NCpHYbqfhYLzJ+MNSZytqGmfIeHpe1FXtMZcVKRld5GvaHeNUG6PzEf0r4Wwkvc=
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
 Ben Davis <Ben.Davis@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpZGF5LCAxMSBPY3RvYmVyIDIwMTkgMDY6NDU6MzUgQlNUIGphbWVzIHFpYW4gd2FuZyAo
QXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+IFRoaXMgZnVuY3Rpb24gaXMgdXNlZCB0byBj
b252ZXJ0IGRybSAzZGx1dCB0byBrb21lZGEgSFcgcmVxdWlyZWQgMWQgY3VydmUKPiBjb2VmZnMg
dmFsdWVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IGphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xv
Z3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KPiAtLS0KPiAgLi4uL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5jICAgIHwgNTIgKysrKysrKysrKysrKysrKysr
Kwo+ICAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmggICAgfCAgOSAr
KystCj4gIDIgZmlsZXMgY2hhbmdlZCwgNjAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9jb2xvcl9tZ210LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9jb2xvcl9tZ210LmMKPiBpbmRleCA5ZDE0YTkyZGJiMTcuLmMxODBjZTcwYzI2YyAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9t
Z210LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9j
b2xvcl9tZ210LmMKPiBAQCAtNjUsMyArNjUsNTUgQEAgY29uc3QgczMyICprb21lZGFfc2VsZWN0
X3l1djJyZ2JfY29lZmZzKHUzMiBjb2xvcl9lbmNvZGluZywgdTMyIGNvbG9yX3JhbmdlKQo+ICAK
PiAgCXJldHVybiBjb2VmZnM7Cj4gIH0KPiArCj4gK3N0cnVjdCBnYW1tYV9jdXJ2ZV9zZWN0b3Ig
ewo+ICsJdTMyIGJvdW5kYXJ5X3N0YXJ0Owo+ICsJdTMyIG51bV9vZl9zZWdtZW50czsKPiArCXUz
MiBzZWdtZW50X3dpZHRoOwo+ICt9Owo+ICsKPiArc3RydWN0IGdhbW1hX2N1cnZlX3NlZ21lbnQg
ewo+ICsJdTMyIHN0YXJ0Owo+ICsJdTMyIGVuZDsKPiArfTsKPiArCj4gK3N0YXRpYyBzdHJ1Y3Qg
Z2FtbWFfY3VydmVfc2VjdG9yIHNlY3Rvcl90YmxbXSA9IHsKW2Jpa2VzaGVkXSBJJ2QgbmFtZSB0
aGlzIGZnYW1tYV9zZWN0b3JfdGJsIChkaWRuJ3QgdGhlIHByZXZpb3VzIHZlcnNpb24Kb2YgdGhp
cyBwYXRjaCBzdGFjayBoYXZlIGFuIGdhbW1hX2N1cnZlX3NlY3RvciBmb3IgaWdhbW1hPykuCj4g
Kwl7IDAsICAgIDQsICA0ICAgfSwKPiArCXsgMTYsICAgNCwgIDQgICB9LAo+ICsJeyAzMiwgICA0
LCAgOCAgIH0sCj4gKwl7IDY0LCAgIDQsICAxNiAgfSwKPiArCXsgMTI4LCAgNCwgIDMyICB9LAo+
ICsJeyAyNTYsICA0LCAgNjQgIH0sCj4gKwl7IDUxMiwgIDE2LCAzMiAgfSwKPiArCXsgMTAyNCwg
MjQsIDEyOCB9LAo+ICt9Owo+ICsKPiArc3RhdGljIHZvaWQKPiArZHJtX2x1dF90b19jb2VmZnMo
c3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpsdXRfYmxvYiwgdTMyICpjb2VmZnMsCj4gKwkJICBz
dHJ1Y3QgZ2FtbWFfY3VydmVfc2VjdG9yICpzZWN0b3JfdGJsLCB1MzIgbnVtX3NlY3RvcnMpCj4g
K3sKPiArCXN0cnVjdCBkcm1fY29sb3JfbHV0ICpsdXQ7Cj4gKwl1MzIgaSwgaiwgaW4sIG51bSA9
IDA7Cj4gKwo+ICsJaWYgKCFsdXRfYmxvYikKPiArCQlyZXR1cm47Cj4gKwo+ICsJbHV0ID0gbHV0
X2Jsb2ItPmRhdGE7Cj4gKwo+ICsJZm9yIChpID0gMDsgaSA8IG51bV9zZWN0b3JzOyBpKyspIHsK
PiArCQlmb3IgKGogPSAwOyBqIDwgc2VjdG9yX3RibFtpXS5udW1fb2Zfc2VnbWVudHM7IGorKykg
ewo+ICsJCQlpbiA9IHNlY3Rvcl90YmxbaV0uYm91bmRhcnlfc3RhcnQgKwo+ICsJCQkgICAgIGog
KiBzZWN0b3JfdGJsW2ldLnNlZ21lbnRfd2lkdGg7Cj4gKwo+ICsJCQljb2VmZnNbbnVtKytdID0g
ZHJtX2NvbG9yX2x1dF9leHRyYWN0KGx1dFtpbl0ucmVkLAo+ICsJCQkJCQlLT01FREFfQ09MT1Jf
UFJFQ0lTSU9OKTsKPiArCQl9Cj4gKwl9Cj4gKwo+ICsJY29lZmZzW251bV0gPSBCSVQoS09NRURB
X0NPTE9SX1BSRUNJU0lPTik7Cj4gK30KPiArCj4gK3ZvaWQgZHJtX2x1dF90b19mZ2FtbWFfY29l
ZmZzKHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqbHV0X2Jsb2IsIHUzMiAqY29lZmZzKQo+ICt7
Cj4gKwlkcm1fbHV0X3RvX2NvZWZmcyhsdXRfYmxvYiwgY29lZmZzLCBzZWN0b3JfdGJsLCBBUlJB
WV9TSVpFKHNlY3Rvcl90YmwpKTsKPiArfQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmggYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmgKPiBpbmRleCBhMmRmMjE4ZjU4
ZTcuLjA4YWI2OTI4MTY0OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmgKPiBAQCAtMTEsNyArMTEsMTQgQEAK
PiAgI2luY2x1ZGUgPGRybS9kcm1fY29sb3JfbWdtdC5oPgo+ICAKPiAgI2RlZmluZSBLT01FREFf
Tl9ZVVYyUkdCX0NPRUZGUwkJMTIKPiArI2RlZmluZSBLT01FREFfTl9SR0IyWVVWX0NPRUZGUwkJ
MTIKPiArI2RlZmluZSBLT01FREFfQ09MT1JfUFJFQ0lTSU9OCQkxMgo+ICsjZGVmaW5lIEtPTUVE
QV9OX0dBTU1BX0NPRUZGUwkJNjUKPiArI2RlZmluZSBLT01FREFfQ09MT1JfTFVUX1NJWkUJCUJJ
VChLT01FREFfQ09MT1JfUFJFQ0lTSU9OKQo+ICsjZGVmaW5lIEtPTUVEQV9OX0NUTV9DT0VGRlMJ
CTkKW25pdF0gVGhlIGFsaWdubWVudCB3aXRoIHRoZSBncm91cCBhYm92ZSBzZWVtcyBhIGJpdCBv
ZmYuCj4gKwo+ICt2b2lkIGRybV9sdXRfdG9fZmdhbW1hX2NvZWZmcyhzdHJ1Y3QgZHJtX3Byb3Bl
cnR5X2Jsb2IgKmx1dF9ibG9iLCB1MzIgKmNvZWZmcyk7Cj4gIAo+ICBjb25zdCBzMzIgKmtvbWVk
YV9zZWxlY3RfeXV2MnJnYl9jb2VmZnModTMyIGNvbG9yX2VuY29kaW5nLCB1MzIgY29sb3JfcmFu
Z2UpOwo+ICAKPiAtI2VuZGlmCj4gKyNlbmRpZiAvKl9LT01FREFfQ09MT1JfTUdNVF9IXyovCj4g
ClJldmlld2VkLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+
CgotLSAKTWloYWlsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
