Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBADBAE08
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 08:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6B16E0EA;
	Mon, 23 Sep 2019 06:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70041.outbound.protection.outlook.com [40.107.7.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5926E0EA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 06:54:31 +0000 (UTC)
Received: from DB7PR08CA0005.eurprd08.prod.outlook.com (2603:10a6:5:16::18) by
 DBBPR08MB4728.eurprd08.prod.outlook.com (2603:10a6:10:d6::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Mon, 23 Sep 2019 06:54:27 +0000
Received: from DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::200) by DB7PR08CA0005.outlook.office365.com
 (2603:10a6:5:16::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Mon, 23 Sep 2019 06:54:27 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT064.mail.protection.outlook.com (10.152.21.199) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25 via Frontend Transport; Mon, 23 Sep 2019 06:54:26 +0000
Received: ("Tessian outbound 968ab6b62146:v31");
 Mon, 23 Sep 2019 06:54:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4ed9bbb742a6d71f
X-CR-MTA-TID: 64aa7808
Received: from dedbbdc7622c.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.12.57]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 28BC0D02-DC55-4C7C-BDD0-584ACABE3532.1; 
 Mon, 23 Sep 2019 06:54:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dedbbdc7622c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 Sep 2019 06:54:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QA44zHr9fZNWgcNlmMR82KkkeXMW79Y+FANWWxtffiC2BCNhDfuORfgxxRAAe1NugzeC18LLesbxUx3zdh9nWMTHDRfklnaoPO9fFVNta5e8aWbwksOEHdgZpbfJEXi6mTm2fWwV5cf+AgVypeg4IAdZwQeDMmo4FcKKKWWLt0ZDTNilh2daFPZ/k3xnBDcakGi0Cnp8SJu90FUIAiwGDdwM/SkQt1osWhShjVww+4YwYku4KYIOq8CQiiqov/cvwlFTh0J5thUFFqlY/y9jy+DNF2zReAYUql6KBCmmr6HEUtP9mBTYDJaA35CNCI7FsA5r94NeLNvnaAsEMRo6dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wr/UOvffhiEOEfzGlp/vSELCtLmA3aBVac6SW6glkAQ=;
 b=js6TgIP9lkJc02r0RTwXENPkUQUyvzxJ2yOvoa4fKQUnWOj6d3+nh36Ntgy5gvaO3eYCrvSqeRuJa3qQ1pevTHNC3AvKbVu74eULHv0hw8nnMBmVvxEjAQN3MP2yOdm2iB27XJ+0Pqt1zjrU3gDbKoa0OchSkRmNxiexJyj4FdEI0BgDAU/x6Ug0/+HcBQXtKn4G+K+vm53naj68tAqmovV79rLjeoRcI52bcxivIaENUVsev3oV3LMi9NnBXZ0MJS9G9aAVJSSWmL/uU4P9A8qp/hkNs+HbvwOtArnjM2EAq0e1uZH2MLDyG8AeavKmZ/nS4nTWiaulAF5xwitkNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4752.eurprd08.prod.outlook.com (10.255.112.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Mon, 23 Sep 2019 06:54:18 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879%5]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 06:54:18 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] drm/komeda: Use devm_platform_ioremap_resource() in
 komeda_dev_create()
Thread-Topic: [PATCH] drm/komeda: Use devm_platform_ioremap_resource() in
 komeda_dev_create()
Thread-Index: AQHVcKUcmq8GSSSejEasIcMzV2KNa6c41h2A
Date: Mon, 23 Sep 2019 06:54:18 +0000
Message-ID: <20190923065411.GA29903@jamwan02-TSP300>
References: <64a6ea39-3e4b-2ebe-74f7-98720e581e3e@web.de>
In-Reply-To: <64a6ea39-3e4b-2ebe-74f7-98720e581e3e@web.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0214.apcprd02.prod.outlook.com
 (2603:1096:201:20::26) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9ea33415-3c30-4e01-c69f-08d73ff2dff4
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4752; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4752:|VE1PR08MB4752:|DBBPR08MB4728:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB4728BB6389A16ECE4D4EAB45B3850@DBBPR08MB4728.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 0169092318
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(136003)(366004)(396003)(376002)(39860400002)(346002)(199004)(189003)(4326008)(81156014)(66946007)(2906002)(6512007)(9686003)(11346002)(476003)(256004)(14444005)(66066001)(71190400001)(33716001)(33656002)(64756008)(8676002)(66446008)(14454004)(66476007)(66556008)(478600001)(486006)(6246003)(7736002)(305945005)(1076003)(446003)(52116002)(5660300002)(6436002)(6916009)(316002)(76176011)(6486002)(71200400001)(186003)(55236004)(386003)(6506007)(102836004)(26005)(229853002)(8936002)(54906003)(25786009)(86362001)(58126008)(81166006)(99286004)(3846002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4752;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: NY1OuCZ2BIcKpCt0Sl6gG1UDhSwahwjbSqplYnu3fbLoKMbboMEOCOyXfa582hf65wWg69XPUOjTrGZkhFLq/RwFiUr0H1N97Q6V87QxlWnhNmS0h3fmeo29v9Seolgqn4CxZbkYaqFtCjrSBySkxQIi1gQqEw4Yzok6VnI1v+6vzcKuZREDcnCfhT5ULPniZLVuKxobkYd6AzgioSP88H20/I/g4U2SmmBKDmOWuYrsmT13La6wP4BgDvjWrhgUCGBJ3qxKvcZDjkIkRWLmjDjhzPqZR2CFlzZB/de7/tqX7PGTpNLSgg6IShx1cfL/HfwaUCpWLgZ6VYWPNuvMn/QOKMnkA60lUoUT7rkRdpYTOBPDfoK9gr7rZbY5jbLRnybGvBrtfnQvytb+U7tJ8NrKU3Exjr/pLK0MSOHZ4wg=
Content-ID: <F4D6190879F7344895855F7CC4AB2ACE@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4752
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(136003)(376002)(39850400004)(346002)(189003)(199004)(70206006)(76176011)(70586007)(476003)(8936002)(81156014)(9686003)(6486002)(50466002)(81166006)(86362001)(46406003)(478600001)(26826003)(305945005)(7736002)(97756001)(336012)(356004)(63350400001)(8676002)(2906002)(6512007)(486006)(446003)(11346002)(229853002)(99286004)(316002)(22756006)(23726003)(58126008)(54906003)(8746002)(6862004)(33716001)(47776003)(6246003)(1076003)(6506007)(102836004)(76130400001)(14454004)(186003)(5660300002)(26005)(386003)(126002)(4326008)(14444005)(25786009)(66066001)(33656002)(3846002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4728;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9bdd355b-6fb7-4e9d-17cb-08d73ff2daec
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DBBPR08MB4728; 
NoDisclaimer: True
X-Forefront-PRVS: 0169092318
X-Microsoft-Antispam-Message-Info: Rs0XouUCMBGVMfqtzkKwJlKySluz00uAOuK/MbcC6IIoKwvh0xR9bnYWmYKmNfgn43xT0r0i2F5yIs1AoUwoqnGlkuUtSy7nCPhI5HKUKGDq+WP5K5Un3VVnVvLlO/JWEWdozJFpmcX7OHClLaq4gUeZUUodoU0y9jqu+4OOUdh9mwUPtAAPZw4UU2iTfS2R+nKbgnFbJ60jSV3MGxV8oGhzj1ap8zW/uSpBGp35VHK1TXnqgOHkrkwiI/Rj1mVQY/vVZG3EmQK+a724j8eTUFmigOSrNB6b65CDGEUu0dSKwFUdHjfObWmWHOhlxGEFamXwPwPfYgrFEMyWD+g2H5f/2aYFXm4XSLv3mGRgxjKfY99aoAMiImg2BoD647RhCSAIGDcqCcTGbvWuy23KHlxEo9bPscfuHGK3lDzobWw=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2019 06:54:26.7720 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea33415-3c30-4e01-c69f-08d73ff2dff4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4728
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wr/UOvffhiEOEfzGlp/vSELCtLmA3aBVac6SW6glkAQ=;
 b=xL1Xl3962NvpWnvNqScgWnqp+HHmFhGe9+g2DbfN+OM4+0e9BfCbqDSBLf/cCgsYmlmkVTPfjj2s4DZObK0pxOy/jWQiD9F0HsYky0j7ppVk4Tqd46VHfW2dwbTiNqnSzUynmyo5tinB9smt65hqtL2BvGVxxm/B1/Ar5+3FFXs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wr/UOvffhiEOEfzGlp/vSELCtLmA3aBVac6SW6glkAQ=;
 b=xL1Xl3962NvpWnvNqScgWnqp+HHmFhGe9+g2DbfN+OM4+0e9BfCbqDSBLf/cCgsYmlmkVTPfjj2s4DZObK0pxOy/jWQiD9F0HsYky0j7ppVk4Tqd46VHfW2dwbTiNqnSzUynmyo5tinB9smt65hqtL2BvGVxxm/B1/Ar5+3FFXs=
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
Cc: David Airlie <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 Liviu Dudau <Liviu.Dudau@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBTZXAgMjEsIDIwMTkgYXQgMDc6NTA6NDZQTSArMDIwMCwgTWFya3VzIEVsZnJpbmcg
d3JvdGU6Cj4gRnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2Uu
bmV0Pgo+IERhdGU6IFNhdCwgMjEgU2VwIDIwMTkgMTk6NDM6NTEgKzAyMDAKPiAKPiBTaW1wbGlm
eSB0aGlzIGZ1bmN0aW9uIGltcGxlbWVudGF0aW9uIGJ5IHVzaW5nIGEga25vd24gd3JhcHBlciBm
dW5jdGlvbi4KPiAKPiBUaGlzIGlzc3VlIHdhcyBkZXRlY3RlZCBieSB1c2luZyB0aGUgQ29jY2lu
ZWxsZSBzb2Z0d2FyZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJrdXMgRWxmcmluZyA8ZWxmcmlu
Z0B1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2Rldi5jIHwgOSArLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jCj4gaW5kZXggY2E2NGExMjljNTk0Li5h
Mzg3ZDkyMzk2MmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfZGV2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9kZXYuYwo+IEBAIC0xNzIsMTkgKzE3MiwxMiBAQCBzdHJ1Y3Qga29tZWRhX2Rl
diAqa29tZWRhX2Rldl9jcmVhdGUoc3RydWN0IGRldmljZSAqZGV2KQo+ICAJc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldiA9IHRvX3BsYXRmb3JtX2RldmljZShkZXYpOwo+ICAJY29uc3Qgc3Ry
dWN0IGtvbWVkYV9wcm9kdWN0X2RhdGEgKnByb2R1Y3Q7Cj4gIAlzdHJ1Y3Qga29tZWRhX2RldiAq
bWRldjsKPiAtCXN0cnVjdCByZXNvdXJjZSAqaW9fcmVzOwo+ICAJaW50IGVyciA9IDA7Cj4gCj4g
IAlwcm9kdWN0ID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRldik7Cj4gIAlpZiAoIXByb2R1
Y3QpCj4gIAkJcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7Cj4gCj4gLQlpb19yZXMgPSBwbGF0Zm9y
bV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOwo+IC0JaWYgKCFpb19yZXMp
IHsKPiAtCQlEUk1fRVJST1IoIk5vIHJlZ2lzdGVycyBkZWZpbmVkLlxuIik7Cj4gLQkJcmV0dXJu
IEVSUl9QVFIoLUVOT0RFVik7Cj4gLQl9Cj4gLQo+ICAJbWRldiA9IGRldm1fa3phbGxvYyhkZXYs
IHNpemVvZigqbWRldiksIEdGUF9LRVJORUwpOwo+ICAJaWYgKCFtZGV2KQo+ICAJCXJldHVybiBF
UlJfUFRSKC1FTk9NRU0pOwo+IEBAIC0xOTIsNyArMTg1LDcgQEAgc3RydWN0IGtvbWVkYV9kZXYg
KmtvbWVkYV9kZXZfY3JlYXRlKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgCW11dGV4X2luaXQoJm1k
ZXYtPmxvY2spOwo+IAo+ICAJbWRldi0+ZGV2ID0gZGV2Owo+IC0JbWRldi0+cmVnX2Jhc2UgPSBk
ZXZtX2lvcmVtYXBfcmVzb3VyY2UoZGV2LCBpb19yZXMpOwo+ICsJbWRldi0+cmVnX2Jhc2UgPSBk
ZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCk7CgpIaSBNYXJrdXM6CgpUaGFu
ayB5b3UgZm9yIHRoZSBwYXRjaC4KClJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+CgoKPiAgCWlmIChJU19F
UlIobWRldi0+cmVnX2Jhc2UpKSB7Cj4gIAkJRFJNX0VSUk9SKCJNYXAgcmVnaXN0ZXIgc3BhY2Ug
ZmFpbGVkLlxuIik7Cj4gIAkJZXJyID0gUFRSX0VSUihtZGV2LT5yZWdfYmFzZSk7Cj4gLS0KPiAy
LjIzLjAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
