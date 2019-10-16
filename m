Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA39D8ABB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 10:21:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA40894E3;
	Wed, 16 Oct 2019 08:21:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40062.outbound.protection.outlook.com [40.107.4.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501B5894E3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 08:21:41 +0000 (UTC)
Received: from DB7PR08CA0043.eurprd08.prod.outlook.com (2603:10a6:10:26::20)
 by DB6PR0801MB1973.eurprd08.prod.outlook.com (2603:10a6:4:73::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Wed, 16 Oct
 2019 08:21:36 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::209) by DB7PR08CA0043.outlook.office365.com
 (2603:10a6:10:26::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 16 Oct 2019 08:21:36 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Wed, 16 Oct 2019 08:21:35 +0000
Received: ("Tessian outbound 6481c7fa5a3c:v33");
 Wed, 16 Oct 2019 08:21:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 08b1ce87ffbcd7ef
X-CR-MTA-TID: 64aa7808
Received: from ea902729bbed.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.0.57]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F71D2B3E-0CDA-422C-AC07-43DB00D1E71C.1; 
 Wed, 16 Oct 2019 08:21:26 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2057.outbound.protection.outlook.com [104.47.0.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ea902729bbed.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Oct 2019 08:21:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZRVhuNPkfXliCO9IBECFd6tqRhKaUOT8e0raf0VtupcgtORYRxpEnCm1Gp52NYQMY5hnEG5GwQmv/hcpTaOB0YgWBX+HQ/XKRTv1/ksPDW7Qgi4vT0lVy+sNegdR4eONKPJMw/uIujMBvc9S+vyG0fAVTd8vC+Jyz7Wz0hEVgK9974U4K7nb6b0GaSQqCAhexkzq0D4pmltlucYa+x7b9oOOY5U1EzM2wm6H75nXBR5WE3CvFCOo5aBxfTdfuph2NDGZx4l2RV5GrH7nQrZHZum5takPUOMueM+5XQ42SVv+M1V1OWEzfiHlUAJtoX0O2uW7aRTJNsJUKAPNMJcZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sx8dmJezPpKue/92t1I5DN14Moel2ReZxXZfv3XRPfo=;
 b=VAyS3uHRbKC5CWKmg2ZO99nbdQoxCQVw5VyR2m7pQSfsKeCDOxSSL5Yz359aP07ByEg9MUlPFZ3ccZsvKiVC1v7Yo/YQB7hNf4ugj60E7lKZVMH5FjDLvjPGwqXEz2VgpEyuYiCODFD30jApuAAuCyPL8L6a27wYAt79jecqzwspFmoUb5GL3GNv8BuZl0yGv9PGso+/zB1wFNGug3L1rkMSxUnxkDAkSzUOwiX+jeb/HDm7/Gla1eSGC97KkiEC1cIqUrlsfBGq7mhNx8Z9z0xgoeHupe6wlpa5UQ0tbOAz0GnkEhXhdWhQ6CO6h/WuV13adKVFAXijU/nLy0p5Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5088.eurprd08.prod.outlook.com (10.255.158.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Wed, 16 Oct 2019 08:21:24 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 08:21:24 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: drm/komeda: Don't flush inactive pipes
Thread-Topic: drm/komeda: Don't flush inactive pipes
Thread-Index: AQHVg/qy9vCXt00JukKh3lKp5LBlUg==
Date: Wed, 16 Oct 2019 08:21:24 +0000
Message-ID: <20191016082117.GA18601@jamwan02-TSP300>
References: <20191010102950.56253-1-mihail.atanassov@arm.com>
In-Reply-To: <20191010102950.56253-1-mihail.atanassov@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0302CA0005.apcprd03.prod.outlook.com
 (2603:1096:202::15) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2916a10e-08be-40ef-a28a-08d75211dbbc
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB5088:|VE1PR08MB5088:|DB6PR0801MB1973:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB1973BA01A20238BA68C5A34CB3920@DB6PR0801MB1973.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:147;OLM:147;
x-forefront-prvs: 0192E812EC
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(136003)(396003)(346002)(376002)(366004)(199004)(189003)(64756008)(386003)(55236004)(66446008)(102836004)(66066001)(6506007)(33716001)(26005)(14444005)(71190400001)(25786009)(256004)(14454004)(186003)(71200400001)(11346002)(446003)(476003)(33656002)(5660300002)(486006)(2906002)(66946007)(66476007)(66556008)(229853002)(9686003)(86362001)(1076003)(6246003)(478600001)(4326008)(6486002)(7736002)(54906003)(58126008)(316002)(8676002)(305945005)(6862004)(81156014)(52116002)(76176011)(6512007)(8936002)(3846002)(6116002)(6636002)(99286004)(6436002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5088;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 3PaNHNE67Y+NHeSc1/clKHzj+U6HpvpQLovV+Xiepv9KmJZpUAgl0Nd7a9qjKKJ23DT1kWljq8f7PTlbwxMFgEnt5uPqHnRDLWjY0cOi0t4v7BcsUFC8r3NOPhZnn5Tx/X/nP2JcUrVLqzg7aiYosHn1Ute0gW7LVo8Lwpmxq33PQVAtnO4ha7CTeIovxBiXfg4ASGZOg7Wwn/poD0/t62E42nNv7IeKrXCyO5/ZFsFz6eRaxhLtf323Rt992IUxGuhxiok87e8aIQrqRd6wOy7JVPEaiyqvB8whEkYO2iTGmbZdLmQu1PbnrDndvtwKQhNIB8RY4KRAsWz0JZTJ49Zh1JfVL8qgWh3BNWSDJTekAFtMwu5ZVi9tWCUHcE7pL66lZ7poHcSJumt1/LfRda2fSDWGFdrPkMSINVISZTI=
Content-ID: <7A1DD0FEC62ADD4882EA118DD1D6989E@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5088
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(136003)(39860400002)(396003)(346002)(376002)(189003)(199004)(478600001)(11346002)(26005)(33716001)(336012)(14444005)(446003)(22756006)(6506007)(63350400001)(386003)(70586007)(76130400001)(14454004)(70206006)(97756001)(50466002)(66066001)(476003)(47776003)(126002)(486006)(2906002)(102836004)(25786009)(186003)(26826003)(5660300002)(33656002)(81166006)(6636002)(356004)(46406003)(4326008)(86362001)(3846002)(6862004)(36906005)(58126008)(8746002)(305945005)(1076003)(229853002)(9686003)(6486002)(6246003)(54906003)(316002)(6512007)(23726003)(8936002)(76176011)(8676002)(7736002)(99286004)(6116002)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB1973;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 652180b1-cfef-4c71-b29b-08d75211d554
NoDisclaimer: True
X-Forefront-PRVS: 0192E812EC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HuDtZwlvzT0gWsl2iIlsQDLmCRs/CnVB0DIvOVUXi8jPgxDVMba4Z0snEbTcsucNYNizsfscvisP39TQa9zSM99haw+/GqgEsTIIY7AfoPX+pbLGN5XTCw9JL6GhIXr8w9N6M9R0ZW4c4kjeCZn2SsYlFtPHNoSNqJuJlryDmvjbLUo3VqPrSfEy12/5zzfxkVDIYFacUfbR2EZVEHsmoRx0BZh0/1j7gGj/jg5+xA3TvdMu/a5XBxMzaMQUkeZnbIE3Bay7jDEPixBGu/Zbq+AI67dvS5lKX3jXI0ijpmTLqyH9/j1cFANrsgp6PGjkPN4dzxgR37kl+XUSHOIFbnpPhS4xy7JkLn3wz1yvPMULGolLtbSoPMG0Ui/PLP8EV5QJECttqC7pflg/qEEDIY6udscJU5ST20GXh3/lgUM=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2019 08:21:35.0148 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2916a10e-08be-40ef-a28a-08d75211dbbc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1973
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sx8dmJezPpKue/92t1I5DN14Moel2ReZxXZfv3XRPfo=;
 b=t9U6iJUcPavlzCmpFYaG5iCdyMDnMdNlCCiIO2WK0hxm7OWtQ+qSser3hue8cwAI6uJSPXs6pYZuRutlqtRl5cR8po02ZEFPOgp+XVM6+Mfz9Q3LKlO4nlR6aEOxXEcKp+Tro7DQn/fAy4W34hih8sPvB9Wo/xFjbXi2q1qaalE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sx8dmJezPpKue/92t1I5DN14Moel2ReZxXZfv3XRPfo=;
 b=t9U6iJUcPavlzCmpFYaG5iCdyMDnMdNlCCiIO2WK0hxm7OWtQ+qSser3hue8cwAI6uJSPXs6pYZuRutlqtRl5cR8po02ZEFPOgp+XVM6+Mfz9Q3LKlO4nlR6aEOxXEcKp+Tro7DQn/fAy4W34hih8sPvB9Wo/xFjbXi2q1qaalE=
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
Cc: David Airlie <airlied@linux.ie>, nd <nd@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMTA6MzA6MDdBTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBIVyBkb2Vzbid0IGFsbG93IGZsdXNoaW5nIGluYWN0aXZlIHBpcGVzIGFuZCBy
YWlzZXMgYW4gTUVSUiBpbnRlcnJ1cHQKPiBpZiB5b3UgdHJ5IHRvIGRvIHNvLiBTdG9wIHRyaWdn
ZXJpbmcgdGhlIE1FUlIgaW50ZXJydXB0IGluIHRoZQo+IG1pZGRsZSBvZiBhIGNvbW1pdCBieSBj
YWxsaW5nIGRybV9hdG9taWNfaGVscGVyX2NvbW1pdF9wbGFuZXMKPiB3aXRoIHRoZSBBQ1RJVkVf
T05MWSBmbGFnLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5h
dGFuYXNzb3ZAYXJtLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfa21zLmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfa21zLmMKPiBpbmRleCA4ODIwY2UxNWNlMzcuLmFlMjc0OTAyZmY5MiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9r
bXMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2tt
cy5jCj4gQEAgLTgyLDcgKzgyLDggQEAgc3RhdGljIHZvaWQga29tZWRhX2ttc19jb21taXRfdGFp
bChzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqb2xkX3N0YXRlKQo+ICAKPiAgCWRybV9hdG9taWNf
aGVscGVyX2NvbW1pdF9tb2Rlc2V0X2Rpc2FibGVzKGRldiwgb2xkX3N0YXRlKTsKPiAgCj4gLQlk
cm1fYXRvbWljX2hlbHBlcl9jb21taXRfcGxhbmVzKGRldiwgb2xkX3N0YXRlLCAwKTsKPiArCWRy
bV9hdG9taWNfaGVscGVyX2NvbW1pdF9wbGFuZXMoZGV2LCBvbGRfc3RhdGUsCj4gKwkJCQkJRFJN
X1BMQU5FX0NPTU1JVF9BQ1RJVkVfT05MWSk7Cj4KCkxvb2tzIGdvb2QgdG8gbWUuClJldmlld2Vk
LWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53
YW5nQGFybS5jb20+Cgo+ICAJZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X21vZGVzZXRfZW5hYmxl
cyhkZXYsIG9sZF9zdGF0ZSk7Cj4gIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
