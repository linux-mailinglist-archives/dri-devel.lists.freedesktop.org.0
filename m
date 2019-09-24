Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C501CBC3A4
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 10:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE1089991;
	Tue, 24 Sep 2019 08:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140043.outbound.protection.outlook.com [40.107.14.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB4A8991E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 08:01:10 +0000 (UTC)
Received: from VE1PR08CA0025.eurprd08.prod.outlook.com (2603:10a6:803:104::38)
 by DB6PR0802MB2439.eurprd08.prod.outlook.com (2603:10a6:4:a0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20; Tue, 24 Sep
 2019 08:01:04 +0000
Received: from AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::201) by VE1PR08CA0025.outlook.office365.com
 (2603:10a6:803:104::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.21 via Frontend
 Transport; Tue, 24 Sep 2019 08:01:04 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT063.mail.protection.outlook.com (10.152.16.226) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25 via Frontend Transport; Tue, 24 Sep 2019 08:01:02 +0000
Received: ("Tessian outbound 968ab6b62146:v31");
 Tue, 24 Sep 2019 08:00:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 43709aea24852b2a
X-CR-MTA-TID: 64aa7808
Received: from 5795323429b6.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.0.55]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D03866E2-2541-4477-A523-3DBB1954CFBA.1; 
 Tue, 24 Sep 2019 08:00:53 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2055.outbound.protection.outlook.com [104.47.0.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5795323429b6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 24 Sep 2019 08:00:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k48E04jdjUIqICSRAhcpPVAC2A6VvOvk3Etuptg5BpK0r2kGgpoHyk8fRUXQEefa2ZOZFAtwVbtzOpODd2ABofit3hEDxjYTVJOHDkWvIEAwb+1z9WO/f8dgsj5dC17JJEUzxvX1Zf6XhxP1XVaHqqI9R6rlCHvcZyD22PMxT0b3WhhvqZSfgFNtXp1VjSLgtA03tlJuis8s7EPryZIhT3+xJC6Yr9U5yJVty/1L/FQ1EpAS9WQADKndcG9Em1ch51c1c3fW/kq+Q1C6F6xLjdD3yDXspdt6c/VmDK8VT2M5c43/5NvsS926ZFNLlz8pT9m8VooMnrDposliWA6GkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=432SZBl+XgNRowFEJpvuppz3A/j8ZcamL456V3bwWEE=;
 b=MyMcZOF6faL/3kO0L0z3snuGJwKR3W0bb21wJBMLVUVRLUCIbSLvWasscX9EDgtdIsq1+y17cZ0KlPy3lzVGO1IZqWvPJ6qDPLYmI23TMGamBBINoDwNGSY5NM5NuaOPfARKfjVjG1LTFk4Kc48zTY4CChZ0nhXTPCrA88+ppUxaDaDd80ytTmb8WfKCswvyEC5IIsxPmwXjpTW6NWnoYv+8ljunSMIktzudF124/LXO3aR/6OCRP8v6yyt4o10Iab1uHTQfQZRsv+MH5PMdlGkUEij+Rijj5lD+t1MISW0qsGy86fhb9Wk9P8/5R93oMlFwmYCwsgjSgYg3REEIfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3342.eurprd08.prod.outlook.com (52.134.31.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Tue, 24 Sep 2019 08:00:50 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::d09e:254b:4d3b:456b]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::d09e:254b:4d3b:456b%3]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 08:00:49 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH v2 2/2] drm/komeda: Adds layer horizontal input size
 limitation check for D71
Thread-Topic: [PATCH v2 2/2] drm/komeda: Adds layer horizontal input size
 limitation check for D71
Thread-Index: AQHVcq4tpEcv3GJQ1Eqd/4hiDuATxQ==
Date: Tue, 24 Sep 2019 08:00:49 +0000
Message-ID: <20190924080022.19250-3-lowry.li@arm.com>
References: <20190924080022.19250-1-lowry.li@arm.com>
In-Reply-To: <20190924080022.19250-1-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:203:92::34) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 318aa38c-6978-4d93-0a21-08d740c5581c
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3342; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB3342:|VI1PR08MB3342:|DB6PR0802MB2439:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0802MB2439721F3E87B639CDAB221F9F840@DB6PR0802MB2439.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4941;OLM:4941;
x-forefront-prvs: 0170DAF08C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(189003)(199004)(6116002)(66066001)(1076003)(81166006)(305945005)(71190400001)(14444005)(186003)(71200400001)(2906002)(25786009)(66946007)(52116002)(6512007)(446003)(8676002)(478600001)(64756008)(66556008)(11346002)(316002)(7736002)(386003)(6506007)(476003)(54906003)(2616005)(36756003)(6486002)(76176011)(486006)(66446008)(86362001)(110136005)(5660300002)(66476007)(14454004)(50226002)(6636002)(55236004)(81156014)(3846002)(8936002)(4326008)(2201001)(102836004)(26005)(99286004)(6436002)(256004)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3342;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: LGXSt/yIp7pcZUvNuKFxRz/srddymqUfYDNiKMCdsqJbPguqeOcHJZqo6LT5LgOFQTSC/Ty5tqxoLlsyS6HAm2Bz0AzTpR8OYyOJSIagYSShocHkdT8z8y1rXJMi/q75aqPe3H3LdSGgaPlF6QQFUbHS1deZ3TbQ6Ar+Eu3VbV9AU7YHqALH8CbD2WzvqaylHkIvcl67Y5macLPUC8RB7DfxsQru/tZm9INWdFBzy1dzPjCUp3gIJ5KwNAm4cLDYPg8zV0fDW4QvUiJynIIqjqhn0HTaDjcWxyrxlNt2qHhpTXJhylJKjn9+4JiLruaBu/OZM+sfuXBJaAgEOJTv4dx/xRguxJzhmSgKIRhv0pNz/0f5cTK8soN0f6deFMEY+JlGL3+frIjqvbBoWQOj+9D93o6R9zf7ysEgnxXy62s=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3342
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(346002)(136003)(189003)(199004)(14444005)(356004)(7736002)(76176011)(478600001)(86362001)(66066001)(6506007)(386003)(26826003)(36756003)(2201001)(3846002)(6116002)(70206006)(23756003)(70586007)(2501003)(1076003)(5660300002)(47776003)(76130400001)(336012)(11346002)(54906003)(63350400001)(486006)(126002)(6486002)(81156014)(25786009)(14454004)(22756006)(476003)(2616005)(2906002)(81166006)(6636002)(446003)(110136005)(36906005)(4326008)(8746002)(316002)(99286004)(8936002)(50466002)(186003)(6512007)(26005)(50226002)(305945005)(102836004)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0802MB2439;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8d72181d-ab46-4505-75e0-08d740c5504a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB6PR0802MB2439; 
NoDisclaimer: True
X-Forefront-PRVS: 0170DAF08C
X-Microsoft-Antispam-Message-Info: 9sEmTECTWRGBDtv/oRnCkh95bvFfShaeu8FYGlu4Qyo+iGEN9ipHo13+t63HeQ43yyuiEdY1tdK4e9Nxay/d2UPzHapYw72JZC9RR4vr6QZ3WxJ1emaprjwAgHfgivhmbyxKev+6s/rx7XL5N17zDqI2bS4RB7HS9HWoBVYiqgQKh3RGE2H+Tqy53wb+70CoNBV6pOXrbeX53LhrA+hpaY82huzA12aUsZdRtJ2A9vU+5+9DhEFFuYQajbzCROT6e+qh5eGaN5plNnek9KivUGCAZLvOg/fY4zVXBMy4XHYcAa2SAFyKptg4R5g/m/kTjHKGDMkZMPtxtYIf3s0qtEXg2k2S33nVWcQp9/QCUrXd1y1sZ8KnsCgF/mB8450vnv1lL5rkUavAnKgtu6LZ0Erp01q10mCpX0bbewC80vI=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2019 08:01:02.5770 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 318aa38c-6978-4d93-0a21-08d740c5581c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2439
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=432SZBl+XgNRowFEJpvuppz3A/j8ZcamL456V3bwWEE=;
 b=Ml5iZMVDZPxpeMG4PwAMZeC5oP8T0GktvNMruvTgW4ls+BRDdOiaebV2UXH1l9LegkpyS9bb/YZ/1NXAjV1aLz++pVfSXrp1/1jKSmDG1FoMOFgqc9yW/a4ZUxa0C4XpY/UGT5wnHQjmdAUgoml72qY+90ECjYA6RmxaoQXaVdg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=432SZBl+XgNRowFEJpvuppz3A/j8ZcamL456V3bwWEE=;
 b=Ml5iZMVDZPxpeMG4PwAMZeC5oP8T0GktvNMruvTgW4ls+BRDdOiaebV2UXH1l9LegkpyS9bb/YZ/1NXAjV1aLz++pVfSXrp1/1jKSmDG1FoMOFgqc9yW/a4ZUxa0C4XpY/UGT5wnHQjmdAUgoml72qY+90ECjYA6RmxaoQXaVdg=
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogIkxvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkiIDxMb3dyeS5MaUBhcm0uY29t
PgoKQWRkcyBtYXhpbXVtIGxpbmUgc2l6ZSBjaGVjayBhY2NvcmRpbmcgdG8gdGhlIEFGQkMgZGVj
b2RlciBsaW1pdGF0aW9uCmFuZCBzcGVjaWFsIExpbmUgc2l6ZSBsaW1pdGF0aW9uKDIwNDYpIGZv
ciBmb3JtYXQ6IFlVVjQyMF8xMEJJVCBhbmQgWDBMMi4KClNpZ25lZC1vZmYtYnk6IExvd3J5IExp
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGxvd3J5LmxpQGFybS5jb20+Ci0tLQogLi4uL2FybS9k
aXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jICAgIHwgNDkgKysrKysrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKaW5kZXgg
MzU3ODM3YjlkNmVkLi42NzQwYjg0MjJmMTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKQEAgLTM0OSw3ICszNDks
NTYgQEAgc3RhdGljIHZvaWQgZDcxX2xheWVyX2R1bXAoc3RydWN0IGtvbWVkYV9jb21wb25lbnQg
KmMsIHN0cnVjdCBzZXFfZmlsZSAqc2YpCiAJc2VxX3ByaW50ZihzZiwgIiVzQURfVl9DUk9QOlx0
XHQweCVYXG4iLCBwcmVmaXgsIHZbMl0pOwogfQogCitzdGF0aWMgaW50IGQ3MV9sYXllcl92YWxp
ZGF0ZShzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywKKwkJCSAgICAgIHN0cnVjdCBrb21lZGFf
Y29tcG9uZW50X3N0YXRlICpzdGF0ZSkKK3sKKwlzdHJ1Y3Qga29tZWRhX2xheWVyX3N0YXRlICpz
dCA9IHRvX2xheWVyX3N0KHN0YXRlKTsKKwlzdHJ1Y3Qga29tZWRhX2xheWVyICpsYXllciA9IHRv
X2xheWVyKGMpOworCXN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnBsYW5lX3N0OworCXN0cnVjdCBk
cm1fZnJhbWVidWZmZXIgKmZiOworCXUzMiBmb3VyY2MsIGxpbmVfc3osIG1heF9saW5lX3N6Owor
CisJcGxhbmVfc3QgPSBkcm1fYXRvbWljX2dldF9uZXdfcGxhbmVfc3RhdGUoc3RhdGUtPm9iai5z
dGF0ZSwKKwkJCQkJCSAgc3RhdGUtPnBsYW5lKTsKKwlmYiA9IHBsYW5lX3N0LT5mYjsKKwlmb3Vy
Y2MgPSBmYi0+Zm9ybWF0LT5mb3JtYXQ7CisKKwlpZiAoZHJtX3JvdGF0aW9uXzkwX29yXzI3MChz
dC0+cm90KSkKKwkJbGluZV9zeiA9IHN0LT52c2l6ZSAtIHN0LT5hZmJjX2Nyb3BfdCAtIHN0LT5h
ZmJjX2Nyb3BfYjsKKwllbHNlCisJCWxpbmVfc3ogPSBzdC0+aHNpemUgLSBzdC0+YWZiY19jcm9w
X2wgLSBzdC0+YWZiY19jcm9wX3I7CisKKwlpZiAoZmItPm1vZGlmaWVyKSB7CisJCWlmICgoZmIt
Pm1vZGlmaWVyICYgQUZCQ19GT1JNQVRfTU9EX0JMT0NLX1NJWkVfTUFTSykgPT0KKwkJCUFGQkNf
Rk9STUFUX01PRF9CTE9DS19TSVpFXzMyeDgpCisJCQltYXhfbGluZV9zeiA9IGxheWVyLT5saW5l
X3N6OworCQllbHNlCisJCQltYXhfbGluZV9zeiA9IGxheWVyLT5saW5lX3N6IC8gMjsKKworCQlp
ZiAobGluZV9zeiA+IG1heF9saW5lX3N6KSB7CisJCQlEUk1fREVCVUdfQVRPTUlDKCJhZmJjIHJl
cXVlc3QgbGluZV9zejogJWQgZXhjZWVkIHRoZSBtYXggYWZiYyBsaW5lX3N6OiAlZC5cbiIsCisJ
CQkJCSBsaW5lX3N6LCBtYXhfbGluZV9zeik7CisJCQlyZXR1cm4gLUVJTlZBTDsKKwkJfQorCX0K
KworCWlmIChmb3VyY2MgPT0gRFJNX0ZPUk1BVF9ZVVY0MjBfMTBCSVQgJiYgbGluZV9zeiA+IDIw
NDYgJiYgKHN0LT5hZmJjX2Nyb3BfbCAlIDQpKSB7CisJCURSTV9ERUJVR19BVE9NSUMoIllVVjQy
MF8xMEJJVCBpbnB1dF9oc2l6ZTogJWQgZXhjZWVkIHRoZSBtYXggc2l6ZSAyMDQ2LlxuIiwKKwkJ
CQkgbGluZV9zeik7CisJCXJldHVybiAtRUlOVkFMOworCX0KKworCWlmIChmb3VyY2MgPT0gRFJN
X0ZPUk1BVF9YMEwyICYmIGxpbmVfc3ogPiAyMDQ2ICYmIChzdC0+YWRkclswXSAlIDE2KSkgewor
CQlEUk1fREVCVUdfQVRPTUlDKCJYMEwyIGlucHV0X2hzaXplOiAlZCBleGNlZWQgdGhlIG1heCBz
aXplIDIwNDYuXG4iLAorCQkJCSBsaW5lX3N6KTsKKwkJcmV0dXJuIC1FSU5WQUw7CisJfQorCisJ
cmV0dXJuIDA7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudF9mdW5j
cyBkNzFfbGF5ZXJfZnVuY3MgPSB7CisJLnZhbGlkYXRlCT0gZDcxX2xheWVyX3ZhbGlkYXRlLAog
CS51cGRhdGUJCT0gZDcxX2xheWVyX3VwZGF0ZSwKIAkuZGlzYWJsZQk9IGQ3MV9sYXllcl9kaXNh
YmxlLAogCS5kdW1wX3JlZ2lzdGVyCT0gZDcxX2xheWVyX2R1bXAsCi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
