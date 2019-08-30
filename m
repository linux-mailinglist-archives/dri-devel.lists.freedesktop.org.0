Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 121BEA3368
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 11:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1D56E29D;
	Fri, 30 Aug 2019 09:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70081.outbound.protection.outlook.com [40.107.7.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5B06E286
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 09:09:20 +0000 (UTC)
Received: from VI1PR0802CA0001.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::11) by VE1PR08MB4959.eurprd08.prod.outlook.com
 (2603:10a6:803:110::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.18; Fri, 30 Aug
 2019 09:09:16 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::209) by VI1PR0802CA0001.outlook.office365.com
 (2603:10a6:800:aa::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.19 via Frontend
 Transport; Fri, 30 Aug 2019 09:09:15 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Fri, 30 Aug 2019 09:09:14 +0000
Received: ("Tessian outbound f83cc93ed55d:v27");
 Fri, 30 Aug 2019 09:09:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 33a83909e35bc09e
X-CR-MTA-TID: 64aa7808
Received: from b8f5e11fa501.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E6D07AB8-7E5C-4BB6-8533-857B34935776.1; 
 Fri, 30 Aug 2019 09:09:04 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2059.outbound.protection.outlook.com [104.47.4.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b8f5e11fa501.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Aug 2019 09:09:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0Q+hoHo73AcGsGA5vIaMzqnY1k/BzibpKp7qskepjgYnGw+S232JWIBPG44DF6D/pI6ZvdtySvCK8gd96EphIG3AmJwZr5AExOKBZwaIQ/RgxeYQguqqQnt3iT2Xh8Us6F+X0ay42vb6aLTVzW4B4PmktcuOKyIgh6QFCXao0rShu+6U2+3hsj+521wwJvVpyYhUjSHgOHxOxg3YBA5Gv/xX7GJYRAjU7tX4MrmeMnu+maFoQgjFLuqws21HSEV81T9+wZNVOyccbkUb6Rg9s7qn8cUZdtrRB7ocDpJPbMav5rbfzM4mHOa3leUoWVdf46hKVUKpL8Hde8icZ9c9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSMc1HqSU+dzendcqlE9OfD9/c0XihGFHJVU3k7trI8=;
 b=T7HNRA4RhQagVLyX0VHsjJZmOpmG7RIDBYC0p/KZ32fCveb9PUMcuhejcWGIgNuHIBGZ9SvAf43b8v2I/lJ5XbJHDUkQlXJPKE/nw5+eXKSjTybAiVAzsIPPwXCpbH7tCL2bVT/aDs8Pc0LF3eNa779FOTUOdqTBiY1qT4uqA7T/EobsoGlZZwsap2E5mg2tbbCHS/FiqxnYkMKP50NbwQ9e4mdOu+Es0pYZ3hbu2fkdnfrzCBIfYbP/A8wAdsF6tKlnY8h/qms13sIhg89H4+bNQA1qtBNxo9pOrgvJXUHCzEdLgwN5SsoedYAaABmYUKRVidTsZYtO+Gk7XH/YBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3968.eurprd08.prod.outlook.com (20.178.125.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Fri, 30 Aug 2019 09:09:02 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::d09e:254b:4d3b:456b]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::d09e:254b:4d3b:456b%3]) with mapi id 15.20.2220.013; Fri, 30 Aug 2019
 09:09:02 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH v1 2/2] drm/komeda: Adds layer horizontal input size
 limitation check for D71
Thread-Topic: [PATCH v1 2/2] drm/komeda: Adds layer horizontal input size
 limitation check for D71
Thread-Index: AQHVXxKQ/pMPgbpj00WfLBjX5GisAQ==
Date: Fri, 30 Aug 2019 09:09:02 +0000
Message-ID: <20190830090835.8747-3-lowry.li@arm.com>
References: <20190830090835.8747-1-lowry.li@arm.com>
In-Reply-To: <20190830090835.8747-1-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0P153CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::14) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d26cdcf4-0ea1-4f86-645d-08d72d29ba9a
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3968; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB3968:|VI1PR08MB3968:|VE1PR08MB4959:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB4959DEC27581AD55879A58979FBD0@VE1PR08MB4959.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4941;OLM:4941;
x-forefront-prvs: 0145758B1D
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(199004)(189003)(4326008)(66446008)(2616005)(25786009)(476003)(8676002)(2906002)(6436002)(2201001)(66556008)(81156014)(81166006)(64756008)(11346002)(99286004)(14454004)(66476007)(5660300002)(486006)(26005)(76176011)(50226002)(86362001)(7736002)(71200400001)(6636002)(66066001)(1076003)(66946007)(71190400001)(446003)(305945005)(186003)(53936002)(3846002)(14444005)(6512007)(110136005)(6486002)(8936002)(2501003)(102836004)(316002)(54906003)(55236004)(478600001)(386003)(6506007)(52116002)(256004)(6116002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3968;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: H2PdfDSjdup/gutTsHBBmHRHR8kawuYE/5qji4XmhRlJsd7/Dx8EUm9JuZ8Wpq5syZmeyuUMBFXX01+qE+gstfOWNQCdY13R+6cn9uWKdXSaYxFRcOUpcCEv5irdgCAzxeBtC7K2Gs/ATsBTx5wfn7tpeZ35+U9EI3vB8UW1swmDTKjqM56QGh665RvQqMtRD/33fd6+LWgt8MkfzWNs/8JFhUAUcfwQUZ4uW4gUTeq/5NhhHKPcgb1f24clWKwMuZj+jKZ1dgqDvoqHdQvoqjvRlOuFQSga2RR9Bs0DEr8G8uY6m4wm6b+I9RcAe00BMTpEd7oUVzQWJkp2llRFAdOSOqrEAEwszvj2mlM+5HHfvaroBM0YMZh1oGsnpNhC6QPKvQtQQTs4tQ7sVF7asrVVUSj6ioQiWryOd20U0LA=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3968
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(2980300002)(199004)(189003)(2906002)(478600001)(8746002)(76130400001)(6486002)(26005)(8676002)(2616005)(11346002)(446003)(63350400001)(6636002)(36906005)(14444005)(54906003)(3846002)(50466002)(99286004)(102836004)(76176011)(305945005)(7736002)(25786009)(386003)(6506007)(63370400001)(4326008)(336012)(186003)(14454004)(2501003)(2201001)(1076003)(26826003)(8936002)(70206006)(47776003)(316002)(70586007)(6116002)(50226002)(110136005)(126002)(6512007)(476003)(486006)(5660300002)(356004)(66066001)(36756003)(81156014)(81166006)(22756006)(23756003)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4959;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 75274041-b547-41ab-da49-08d72d29b312
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4959; 
NoDisclaimer: True
X-Forefront-PRVS: 0145758B1D
X-Microsoft-Antispam-Message-Info: nGj7pXue01WXZqEm444/ApjNba123fHH3R+T9Htll7S+w7fdmanR2OPZ9L8/pUChBoIEB+MnCYOZa9uwDRc4+JNcs0s6ro1mL2bRjXrWG5+jygp+JcrKwFruCl06uN1CvDFXglZlznDHENfeXn3oQ/ogDJ5C6kpzcMgW0/vm//Guio/ZSd4YrDW5uRakC+kNTk80Heu9HYnNGHEdWIyCOpboac7DY39Pwxf9EA8CjqwNtnFSOmbuX96wluYDozBEUdTJBG9nxrK40+kNJHAwSdFUO4kctzA+ZhcpSnpL6JD2PxqhAO0PkD/y2JoPaLcNp7dIpWjNlGmKAiDDoLRLkreAta4/Keu0iDkHD/ex1oh99+aSViybvEPgIe2VXA4zV6eWITDwuD8+G+rG+GyXL5r1kJsiU/uIofDnhZOjFlI=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2019 09:09:14.3033 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d26cdcf4-0ea1-4f86-645d-08d72d29ba9a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4959
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSMc1HqSU+dzendcqlE9OfD9/c0XihGFHJVU3k7trI8=;
 b=MWfexYje0ICxVEZwVm2Lu/JyrRkKBu6JTwLWMzsBs4cgv5DPPD8lFoPEP611QodrR9wqgMHvVbqWtqIzTuBy4QsoZfQkM4t3FTqcwH9KD+liB2PrhZiX+gHRrZhZE/hhkHfvDvuSVTuzDdlTX16XOD5WN3JAyXre0TmjRseCiGI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSMc1HqSU+dzendcqlE9OfD9/c0XihGFHJVU3k7trI8=;
 b=MWfexYje0ICxVEZwVm2Lu/JyrRkKBu6JTwLWMzsBs4cgv5DPPD8lFoPEP611QodrR9wqgMHvVbqWtqIzTuBy4QsoZfQkM4t3FTqcwH9KD+liB2PrhZiX+gHRrZhZE/hhkHfvDvuSVTuzDdlTX16XOD5WN3JAyXre0TmjRseCiGI=
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkcyBtYXhpbXVtIGxpbmUgc2l6ZSBjaGVjayBhY2NvcmRpbmcgdG8gdGhlIEFGQkMgZGVjb2Rl
ciBsaW1pdGF0aW9uCmFuZCBzcGVjaWFsIExpbmUgc2l6ZSBsaW1pdGF0aW9uKDIwNDYpIGZvciBm
b3JtYXQ6IFlVVjQyMF8xMEJJVCBhbmQgWDBMMi4KClNpZ25lZC1vZmYtYnk6IExvd3J5IExpIChB
cm0gVGVjaG5vbG9neSBDaGluYSkgPGxvd3J5LmxpQGFybS5jb20+Ci0tLQogLi4uL2FybS9kaXNw
bGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jICAgIHwgNDkgKysrKysrKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKaW5kZXggYTU2
ZGM1NmE3MmZiLi40MWI1YmZjYmQwMjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKQEAgLTQwMSw3ICs0MDEsNTYg
QEAgc3RhdGljIHZvaWQgZDcxX2xheWVyX2R1bXAoc3RydWN0IGtvbWVkYV9jb21wb25lbnQgKmMs
IHN0cnVjdCBzZXFfZmlsZSAqc2YpCiAJc2VxX3ByaW50ZihzZiwgIiVzQURfVl9DUk9QOlx0XHQw
eCVYXG4iLCBwcmVmaXgsIHZbMl0pOwogfQogCitzdGF0aWMgaW50IGQ3MV9sYXllcl92YWxpZGF0
ZShzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywKKwkJCSAgICAgIHN0cnVjdCBrb21lZGFfY29t
cG9uZW50X3N0YXRlICpzdGF0ZSkKK3sKKwlzdHJ1Y3Qga29tZWRhX2xheWVyX3N0YXRlICpzdCA9
IHRvX2xheWVyX3N0KHN0YXRlKTsKKwlzdHJ1Y3Qga29tZWRhX2xheWVyICpsYXllciA9IHRvX2xh
eWVyKGMpOworCXN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnBsYW5lX3N0OworCXN0cnVjdCBkcm1f
ZnJhbWVidWZmZXIgKmZiOworCXUzMiBmb3VyY2MsIGxpbmVfc3osIG1heF9saW5lX3N6OworCisJ
cGxhbmVfc3QgPSBkcm1fYXRvbWljX2dldF9uZXdfcGxhbmVfc3RhdGUoc3RhdGUtPm9iai5zdGF0
ZSwKKwkJCQkJCSAgc3RhdGUtPnBsYW5lKTsKKwlmYiA9IHBsYW5lX3N0LT5mYjsKKwlmb3VyY2Mg
PSBmYi0+Zm9ybWF0LT5mb3JtYXQ7CisKKwlpZiAoZHJtX3JvdGF0aW9uXzkwX29yXzI3MChzdC0+
cm90KSkKKwkJbGluZV9zeiA9IHN0LT52c2l6ZSAtIHN0LT5hZmJjX2Nyb3BfdCAtIHN0LT5hZmJj
X2Nyb3BfYjsKKwllbHNlCisJCWxpbmVfc3ogPSBzdC0+aHNpemUgLSBzdC0+YWZiY19jcm9wX2wg
LSBzdC0+YWZiY19jcm9wX3I7CisKKwlpZiAoZmItPm1vZGlmaWVyKSB7CisJCWlmICgoZmItPm1v
ZGlmaWVyICYgQUZCQ19GT1JNQVRfTU9EX0JMT0NLX1NJWkVfTUFTSykgPT0KKwkJCUFGQkNfRk9S
TUFUX01PRF9CTE9DS19TSVpFXzMyeDgpCisJCQltYXhfbGluZV9zeiA9IGxheWVyLT5saW5lX3N6
OworCQllbHNlCisJCQltYXhfbGluZV9zeiA9IGxheWVyLT5saW5lX3N6IC8gMjsKKworCQlpZiAo
bGluZV9zeiA+IG1heF9saW5lX3N6KSB7CisJCQlEUk1fREVCVUdfQVRPTUlDKCJhZmJjIHJlcXVl
c3QgbGluZV9zejogJWQgZXhjZWVkIHRoZSBtYXggYWZiYyBsaW5lX3N6OiAlZC5cbiIsCisJCQkJ
CSBsaW5lX3N6LCBtYXhfbGluZV9zeik7CisJCQlyZXR1cm4gLUVJTlZBTDsKKwkJfQorCX0KKwor
CWlmIChmb3VyY2MgPT0gRFJNX0ZPUk1BVF9ZVVY0MjBfMTBCSVQgJiYgbGluZV9zeiA+IDIwNDYg
JiYgKHN0LT5hZmJjX2Nyb3BfbCAlIDQpKSB7CisJCURSTV9ERUJVR19BVE9NSUMoIllVVjQyMF8x
MEJJVCBpbnB1dF9oc2l6ZTogJWQgZXhjZWVkIHRoZSBtYXggc2l6ZSAyMDQ2LlxuIiwKKwkJCQkg
bGluZV9zeik7CisJCXJldHVybiAtRUlOVkFMOworCX0KKworCWlmIChmb3VyY2MgPT0gRFJNX0ZP
Uk1BVF9YMEwyICYmIGxpbmVfc3ogPiAyMDQ2ICYmIChzdC0+YWRkclswXSAlIDE2KSkgeworCQlE
Uk1fREVCVUdfQVRPTUlDKCJYMEwyIGlucHV0X2hzaXplOiAlZCBleGNlZWQgdGhlIG1heCBzaXpl
IDIwNDYuXG4iLAorCQkJCSBsaW5lX3N6KTsKKwkJcmV0dXJuIC1FSU5WQUw7CisJfQorCisJcmV0
dXJuIDA7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudF9mdW5jcyBk
NzFfbGF5ZXJfZnVuY3MgPSB7CisJLnZhbGlkYXRlCT0gZDcxX2xheWVyX3ZhbGlkYXRlLAogCS51
cGRhdGUJCT0gZDcxX2xheWVyX3VwZGF0ZSwKIAkuZGlzYWJsZQk9IGQ3MV9sYXllcl9kaXNhYmxl
LAogCS5kdW1wX3JlZ2lzdGVyCT0gZDcxX2xheWVyX2R1bXAsCi0tIAoyLjE3LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
