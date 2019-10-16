Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D58D8AC5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 10:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914056E8F2;
	Wed, 16 Oct 2019 08:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50087.outbound.protection.outlook.com [40.107.5.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43486E8F5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 08:23:17 +0000 (UTC)
Received: from HE1PR0802CA0019.eurprd08.prod.outlook.com (2603:10a6:3:bd::29)
 by AM0PR08MB4290.eurprd08.prod.outlook.com (2603:10a6:208:138::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.18; Wed, 16 Oct
 2019 08:23:12 +0000
Received: from DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::207) by HE1PR0802CA0019.outlook.office365.com
 (2603:10a6:3:bd::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 16 Oct 2019 08:23:11 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT058.mail.protection.outlook.com (10.152.20.255) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Wed, 16 Oct 2019 08:23:10 +0000
Received: ("Tessian outbound 0cf06bf5c60e:v33");
 Wed, 16 Oct 2019 08:23:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 39db470f410efa4d
X-CR-MTA-TID: 64aa7808
Received: from 84e95bfba6bf.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.0.54]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E98B294B-E23E-4045-9D39-6504C6096F75.1; 
 Wed, 16 Oct 2019 08:23:04 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2054.outbound.protection.outlook.com [104.47.0.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 84e95bfba6bf.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Oct 2019 08:23:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFX9VY4C0huG5Qo8oq/tz0A/iy6fnRkVZtEmucfJZVPzS61VjUR8dJnPbVFpT9+KsricGgro8p1F5X6IoFiva4RYD+TyVYJwHkq0rfUtybNw6Wa9fUn+nZ7TeEfIg/yrlde6JR/wXSm5xEaS/plwwyqZl4zBmIu3UMgWf1TZraNl0I85yStHu1aSKzysdfHlu6kxqXFMWiJpc/4Xml+B1R0/H2+SMpJZgW3kzElakRUQsyTE385qfWF7QQvX8xAq25uHUVpujmK2oxzQmsAPgsiOUMVdyYhw6VmTJKwiiYf/gqZvzGtryw5AUFOkTsnOBca0PWuLe3jx1QbsK5tt0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZbofYpIDbV28hSpTOVjYlizA67F1XAVucWkprlnXVk=;
 b=bQqL/8D4YCWlGEuBFluCRCaWvK1HFdkhsQmu/jbYwNdrtA0ALGCv7TWxlbhyKHiBMxjQC2jFU6ZlF64HLVnEi7SJBTLHKaMI+W+eynSxq0DRXM2SedpjkLTxfzJzBQUH4fdGLkN4uquawFtckKw0iA5ONETdhWQ3Snsim2tpneUeob6XNW/jRVMhfZBQ9QmZURCcZ5mY5rN5OHVickC73Mr1NWtTNB/JAqH7EFRdpSCjCgQqqTiVsEcU4hU9GAcOVZd+GryA11y9n+kNnnzq7v7f3EOm0EwVy2f720tbqKVranGXuHtpYChyr0pt1SK3mH1oDQeV+j/b7phnavKHeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5088.eurprd08.prod.outlook.com (10.255.158.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Wed, 16 Oct 2019 08:23:03 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 08:23:03 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [v2] drm/komeda: Fix typos in komeda_splitter_validate
Thread-Topic: [v2] drm/komeda: Fix typos in komeda_splitter_validate
Thread-Index: AQHVg/rtmkxsWyZ8v0y88TcuY0W0UQ==
Date: Wed, 16 Oct 2019 08:23:03 +0000
Message-ID: <20191016082255.GA18768@jamwan02-TSP300>
References: <20190930122231.33029-1-mihail.atanassov@arm.com>
In-Reply-To: <20190930122231.33029-1-mihail.atanassov@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0207.apcprd02.prod.outlook.com
 (2603:1096:201:20::19) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 392905ec-49bd-4744-5c9f-08d752121476
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB5088:|VE1PR08MB5088:|AM0PR08MB4290:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB429097FC60803D63D79A0346B3920@AM0PR08MB4290.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5797;
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
X-Microsoft-Antispam-Message-Info-Original: h+5X2EOJHF+qY6OSItPbuTngr4dd+QeyaoW9AEfCWRuOTvmhvXbN6Z4NtBJ3H0jiiY79qWJVxmp623ZLdni6SXiTgdNsFH2PJ009z55yBf3leagOCJFVy6VWpHaDzF6HgfW0ASL/KwOEC6vSyvYItoJsiEmBTX7VFwlzW/jdYsqGkn5DGF1xDvMwNR0ICtqo1gGLKqKVXb7UMiOxSMDESaebYVSLdxPPhfU1iLcpUPrkfr9yeBgxMGZo8M8Bj/RLyNZV6WhRMzZvgRikp+/EKO/w/+YXq7Ww7ZROh3qOvaGAv4X9qI/9R0o9zS4K/AngByKr6prsveajnR8nkYRD+MLtngy8XzrJuD05l4unsz8JEmv/JygvCwECXnvMA30cMQSwOHG1JUesgWfSo9bae6nonO7NFgTDfG1wEE5O4ss=
Content-ID: <29C5E991405FA343889E64DAC9A0060F@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5088
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(346002)(396003)(39860400002)(136003)(189003)(199004)(22756006)(102836004)(478600001)(66066001)(5660300002)(476003)(9686003)(7736002)(305945005)(14444005)(81156014)(50466002)(99286004)(14454004)(26826003)(70586007)(76130400001)(47776003)(46406003)(70206006)(26005)(186003)(1076003)(76176011)(386003)(6506007)(356004)(486006)(6512007)(8676002)(81166006)(6636002)(126002)(8746002)(11346002)(8936002)(23726003)(6116002)(6246003)(2906002)(97756001)(4326008)(86362001)(33716001)(6862004)(3846002)(58126008)(6486002)(25786009)(54906003)(446003)(336012)(63350400001)(316002)(229853002)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4290;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 61267cee-ef87-48f1-8cf4-08d752121011
NoDisclaimer: True
X-Forefront-PRVS: 0192E812EC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WgV+eZJuPM5xh2/f91YdE9f+GkZzZlM98o+54M2gyErcKWhBYY4qwXnA8tcwJgdMIhgrZvTCkwtROMKebxREG08XQnwldtsbvI+fzY7uKI6QzDx3TbwZNK6VT9B9+yqMFYMqSMLBC0oh8Sv7UMxb1lNOfgJE1nm8jEj3tHTJC+BiO0ntCOYbk8aHTCIJJy4vlg6SM4e+qbnje/zCH6dBst8N6s4xaLf9DwlEhrup6HqFQhK3F9F6nokSLmSAVp2j8POUnMZzezDM75NichyK4uY/z9bmboEbudfT087FkZFNKdKHRAh9LMqg2qfMNsZTYi3Ht/ny6bUjgOnTTDdO+CeyX5Uh4zhlGrwZ2srYSHCw+4dCJbW1Sezefz6QArJr4C/30wlP/VATEARpuj6G0qoBiyixPk/SlJ0l1BYbHj0=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2019 08:23:10.1874 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 392905ec-49bd-4744-5c9f-08d752121476
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4290
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZbofYpIDbV28hSpTOVjYlizA67F1XAVucWkprlnXVk=;
 b=3thg8Yaaur1/xi+m0yeUN6lTh5meMhUtQJG4lqkR39bP33nhCuTvHYpmkOjAPiAS3uN8rTs7eNgi9AMYJtBk1GJDxAdTUGYzNK23BKLuvd54ZatFQAQP9ZiFCyWKb0HDgqVE0y5xSqlleg5yyZOw6wseTPcoCxHuaiO2iA1hVNg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZbofYpIDbV28hSpTOVjYlizA67F1XAVucWkprlnXVk=;
 b=3thg8Yaaur1/xi+m0yeUN6lTh5meMhUtQJG4lqkR39bP33nhCuTvHYpmkOjAPiAS3uN8rTs7eNgi9AMYJtBk1GJDxAdTUGYzNK23BKLuvd54ZatFQAQP9ZiFCyWKb0HDgqVE0y5xSqlleg5yyZOw6wseTPcoCxHuaiO2iA1hVNg=
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

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMTI6MjM6MDdQTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBGaXggYm90aCB0aGUgc3RyaW5nIGFuZCB0aGUgc3RydWN0IG1lbWJlciBiZWlu
ZyBwcmludGVkLgo+IAo+IENoYW5nZXMgc2luY2UgdjE6Cj4gIC0gTm93IHdpdGggYSBib251cyBn
cmFtbWFyIGZpeCwgdG9vLgo+IAo+IEZpeGVzOiAyNjRiOTQzNmQyM2IgKCJkcm0va29tZWRhOiBF
bmFibGUgd3JpdGViYWNrIHNwbGl0IHN1cHBvcnQiKQo+IFNpZ25lZC1vZmYtYnk6IE1paGFpbCBB
dGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYyB8IDQgKystLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBl
bGluZV9zdGF0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
cGlwZWxpbmVfc3RhdGUuYwo+IGluZGV4IDk1MDIzNWFmMWU3OS4uMmI2MjRiZmUxNzUxIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVs
aW5lX3N0YXRlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9waXBlbGluZV9zdGF0ZS5jCj4gQEAgLTU2NCw4ICs1NjQsOCBAQCBrb21lZGFfc3BsaXR0
ZXJfdmFsaWRhdGUoc3RydWN0IGtvbWVkYV9zcGxpdHRlciAqc3BsaXR0ZXIsCj4gIAl9Cj4gIAo+
ICAJaWYgKCFpbl9yYW5nZSgmc3BsaXR0ZXItPnZzaXplLCBkZmxvdy0+aW5faCkpIHsKPiAtCQlE
Uk1fREVCVUdfQVRPTUlDKCJzcGxpdCBpbl9pbjogJWQgZXhjZWVkIHRoZSBhY2NlcHRhYmxlIHJh
bmdlLlxuIiwKPiAtCQkJCSBkZmxvdy0+aW5fdyk7Cj4gKwkJRFJNX0RFQlVHX0FUT01JQygic3Bs
aXQgaW5faDogJWQgZXhjZWVkcyB0aGUgYWNjZXB0YWJsZSByYW5nZS5cbiIsCj4gKwkJCQkgZGZs
b3ctPmluX2gpOwoKUmV2aWV3ZWQtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kg
Q2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAg
CX0KPiAgCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
