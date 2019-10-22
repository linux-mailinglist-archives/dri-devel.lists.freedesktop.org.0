Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9101EE051D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 15:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB93E6E7BD;
	Tue, 22 Oct 2019 13:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20082.outbound.protection.outlook.com [40.107.2.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8D06E7BD;
 Tue, 22 Oct 2019 13:32:23 +0000 (UTC)
Received: from HE1PR0802CA0022.eurprd08.prod.outlook.com (2603:10a6:3:bd::32)
 by HE1PR0802MB2348.eurprd08.prod.outlook.com (2603:10a6:3:c5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Tue, 22 Oct
 2019 13:32:18 +0000
Received: from DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::202) by HE1PR0802CA0022.outlook.office365.com
 (2603:10a6:3:bd::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.21 via Frontend
 Transport; Tue, 22 Oct 2019 13:32:17 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT030.mail.protection.outlook.com (10.152.20.144) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.23 via Frontend Transport; Tue, 22 Oct 2019 13:32:16 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Tue, 22 Oct 2019 13:32:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 822a82baa29b5e53
X-CR-MTA-TID: 64aa7808
Received: from b779838ed719.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.2.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E5D5FC95-25E8-401C-A97C-39AC7694EEF0.1; 
 Tue, 22 Oct 2019 13:32:11 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b779838ed719.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Oct 2019 13:32:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQWCPA8l7It6L3WZpWT58czUe2VFvCzfa2esHyYxqN4x0G2TROKFGzdKeyCllFltWmM7aAOUHJPVX08i3HZhvgD5OqDhmOUQwn+XGdKoH9cyQImAXLxXhLGeOa4A8KvBoFBBysukHmjvhb8JwQPMFFsT9Dg6be9OzX607/N8DRLXRaqlw+T9ZFcmTPaAsWgFE7gC7RsUIPCsqkD8qby4OCmfSmOytedoK/GeRw3EeAPrgbIge+x+TRTCioykbIxUOZJ+bR14cDxVB60851zdPZnhKlx96P0LqKNeW4cBnhEmBki4uOS8NXsXMZp/e5HM1UlQvlBPsyvlAHmYZ2d4Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2O0BjeyggHR160FSrF3iODkFeKWGs16+CI7GdPXb+Y=;
 b=MdNPM4myc2kajIEoDEWeJtah4AIQSnsAhHIC7iyRnS7YfWNhO6mrZq0XLXLfiJFYDsTIXknMUmM0a0b3/yqjC+WfiR5rqaHk8Js2UyFeD7JSKJfh4wLGsBcDkwrqhZe036SXUrWKRml0sjRZtGZAgG951a6+8XIzBUVnaimtpBsnDNJw9XfsJTa3zVxQpnQ+g/TultZDjAGni4Ed350Pe/0MF4GQGUsBuVlFuO4/yrvkydmMeX3mEF/3KRZr09DxWpE8x2/mAnIiTFG9NCbiDQ7bFmNetN1bZ3ie0m+KOspDn5WfVnrsVWDzA6gvq7HtoGqjgtHGJGvId95d4KAPjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3230.eurprd08.prod.outlook.com (52.134.31.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Tue, 22 Oct 2019 13:32:09 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2367.022; Tue, 22 Oct 2019
 13:32:09 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "shashank.sharma@intel.com" <shashank.sharma@intel.com>
Subject: Re: [PATCH 1/3] drm: Introduce scaling filter mode property
Thread-Topic: [PATCH 1/3] drm: Introduce scaling filter mode property
Thread-Index: AQHViL+r8gMrqrpaJEmayeUXozTdHKdmpymAgAABiwA=
Date: Tue, 22 Oct 2019 13:32:09 +0000
Message-ID: <3814919.4a8fiZcgI0@e123338-lin>
References: <20191022095946.29354-1-shashank.sharma@intel.com>
 <20191022095946.29354-2-shashank.sharma@intel.com>
 <1738058.hDiTJb8QWX@e123338-lin>
In-Reply-To: <1738058.hDiTJb8QWX@e123338-lin>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.51]
x-clientproxiedby: LO2P265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::19) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0f974ae9-1173-4559-fee9-08d756f44189
X-MS-TrafficTypeDiagnostic: VI1PR08MB3230:|HE1PR0802MB2348:
X-MS-Exchange-PUrlCount: 2
X-Microsoft-Antispam-PRVS: <HE1PR0802MB2348A2EF89E4881ECD73D3B48F680@HE1PR0802MB2348.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 01986AE76B
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10001)(10009020)(4636009)(7916004)(346002)(366004)(136003)(376002)(396003)(39860400002)(40434004)(199004)(189003)(33716001)(6306002)(966005)(6486002)(66476007)(25786009)(9686003)(6512007)(2906002)(3846002)(2351001)(6116002)(64756008)(66446008)(5640700003)(14454004)(66946007)(66556008)(6436002)(478600001)(66066001)(6246003)(4326008)(8936002)(81166006)(8676002)(81156014)(305945005)(54906003)(86362001)(2501003)(6506007)(229853002)(486006)(102836004)(316002)(5660300002)(186003)(76176011)(99286004)(52116002)(6916009)(26005)(386003)(11346002)(446003)(256004)(71200400001)(71190400001)(14444005)(5024004)(476003)(7736002)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3230;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: fIia3jOkLrlPQQ86S9JgpjaiYw/ZndTWQQyZ7WzwUybaqgRRUYR/65kkvjamgi0dCQbRRNHV3DaR8SVJ61F5IwykNBNt7jD8sECdIDKa/6kx5Zhge7RhBlyI7nxJ0f3i5HxQ1+OtM+Tbv8F3m+1gAulzqwjG0w5kMXtf9+eKOOQ3aMZyBLZ3FKOkSy+3LNjw7gGgSaksX1ws6YLsTp13uHyZgY3TSCfhP4OJYl7OiLsIhM6mIij9mBbvAMN4ovchMnI2Xi6ZVnKOIshr49gH7Rrp7bR682jaMhNMkYyuNs0QvP2wmzyAC5iJTuaew35UpfmDbdaWVTQrcJIvDtsjcmAAmFuyFPSIrC+yujRkWfVcTTkokEk2QCNyqC3tAJmLGYe0pGfTKqt8aEV6EvcEKqKV4diFJHm8LDWPwZMNxAe73XTM+dw/wYfUyT7Dn4MrNraP1VCdcSwuQeCa6+A3uzNBwb73h3Dbc0dhoflfBU4=
x-ms-exchange-transport-forked: True
Content-ID: <421EA78C59BB7D498F2903CB98D49649@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3230
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10001)(10009020)(7916004)(4636009)(136003)(39860400002)(396003)(346002)(376002)(199004)(189003)(40434004)(76176011)(305945005)(25786009)(14444005)(5024004)(99286004)(7736002)(97756001)(450100002)(2906002)(11346002)(446003)(102836004)(26005)(486006)(63350400001)(386003)(6506007)(81166006)(8676002)(81156014)(186003)(8746002)(8936002)(126002)(476003)(336012)(23726003)(2501003)(356004)(3846002)(5660300002)(6116002)(2351001)(6862004)(47776003)(4326008)(316002)(66066001)(9686003)(54906003)(6246003)(5640700003)(6512007)(6306002)(22756006)(6486002)(14454004)(966005)(229853002)(33716001)(46406003)(76130400001)(70586007)(70206006)(26826003)(478600001)(50466002)(86362001)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0802MB2348;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 932859be-5be6-42fe-bc46-08d756f43d4a
NoDisclaimer: True
X-Forefront-PRVS: 01986AE76B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sj20a0oiHKcZZC/fT16oHoKdRKtT1dw7VhRf9q9O5FjimAuefP6qeSBLBR3Q2j/oUTvf2QlKqBRrN1ZFoRAQWYwmI8NEngnkYBXtnGJJBK1yMFwcYTEnDJNuYYMMW1M5ZndzR/EqFq6/THSbN3j4Oc/w/EY0YR6UzUH2J/Ef/nhkFBv7HaV2GUwiTSFhk5pCQ86mLJ3gWEKZzJ5HaXdF5O5dp0n2F6jIR70q09EbjfS3J52WYnGgHYKAXod9/gZtE5Hy4Fn47TEXz9ITATxqesb0PFWKBuipXMz1tkUoTZ96Zh/zPQ5DsEMvr8+i1VsJlV/eT8cPK0hGnWO57tAs1mZwsm+JT+GP0wnCkijucCA0WDa1SWL7JD5GBvm1agBohxzwWcEfa8E5aEe0FY1U65XyOjwUyDW/cqUrEabQntuVXKqh8Pac6VkdpKKPILfl9TyxWyqd6r0/+jDwKsRagsrw0lUbMkYg/oWItKDYRf4=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2019 13:32:16.7105 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f974ae9-1173-4559-fee9-08d756f44189
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2348
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2O0BjeyggHR160FSrF3iODkFeKWGs16+CI7GdPXb+Y=;
 b=1EMmdtFnRMygXoUV1tht2Rz17q5k4tvfuUaIW/XpGUYwojH/uX+yt1ZOv5MldyMATU4KwsGg6Lg0oWpR71Q+jK0bxhxyY43pL63rdoQq4uo5IylZHdvXEBdUR4XX18hjyQVu47z6Cfly2DdME9MQfT7L/5Q9qY5pYW3TcehBEjk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2O0BjeyggHR160FSrF3iODkFeKWGs16+CI7GdPXb+Y=;
 b=1EMmdtFnRMygXoUV1tht2Rz17q5k4tvfuUaIW/XpGUYwojH/uX+yt1ZOv5MldyMATU4KwsGg6Lg0oWpR71Q+jK0bxhxyY43pL63rdoQq4uo5IylZHdvXEBdUR4XX18hjyQVu47z6Cfly2DdME9MQfT7L/5Q9qY5pYW3TcehBEjk=
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 nd <nd@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlc2RheSwgMjIgT2N0b2JlciAyMDE5IDE0OjI2OjM4IEJTVCBNaWhhaWwgQXRhbmFzc292
IHdyb3RlOgo+IEhpIFNoYXNoYW5rLAo+IAo+IE9uIFR1ZXNkYXksIDIyIE9jdG9iZXIgMjAxOSAx
MDo1OTo0NCBCU1QgU2hhc2hhbmsgU2hhcm1hIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBhZGRzIGEg
c2NhbGluZyBmaWx0ZXIgbW9kZSBwb3JwZXJ0eQo+ID4gdG8gYWxsb3c6Cj4gPiAtIEEgZHJpdmVy
L0hXIHRvIHNob3djYXNlIGl0J3Mgc2NhbGluZyBmaWx0ZXIgY2FwYWJpbGl0aWVzLgo+ID4gLSBB
IHVzZXJzcGFjZSB0byBwaWNrIGEgZGVzaXJlZCBlZmZlY3Qgd2hpbGUgc2NhbGluZy4KPiA+Cj4g
PiBUaGlzIG9wdGlvbiB3aWxsIGJlIHBhcnRpY3VsYXJseSB1c2VmdWwgaW4gdGhlIHNjZW5hcmlv
cyB3aGVyZQo+ID4gSW50ZWdlciBtb2RlIHNjYWxpbmcgaXMgcG9zc2libGUsIGFuZCBhIFVJIGNs
aWVudCB3YW50cyB0byBwaWNrCj4gPiBmaWx0ZXJzIGxpa2UgTmVhcmVzdC1uZWlnaGJvciBhcHBs
aWVkIGZvciBub24tYmx1cnJ5IG91dHB1dHMuCj4gPgo+ID4gVGhlcmUgd2FzIGEgUkZDIHBhdGNo
IHNlcmllcyBwdWJsaXNoZWQsIHRvIGRpc2N1cyB0aGUgcmVxdWVzdCB0byBlbmFibGUKPiA+IElu
dGVnZXIgbW9kZSBzY2FsaW5nIGJ5IHNvbWUgb2YgdGhlIGdhbWluZyBjb21tdW5pdGllcywgd2hp
Y2ggY2FuIGJlCj4gPiBmb3VuZCBoZXJlOgo+ID4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0
b3Aub3JnL3Nlcmllcy82NjE3NS8KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTaGFzaGFuayBTaGFy
bWEgPHNoYXNoYW5rLnNoYXJtYUBpbnRlbC5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9k
cm0vZHJtX2F0b21pY191YXBpLmMgfCAgNCArKysrCj4gPiAgaW5jbHVkZS9kcm0vZHJtX2NydGMu
aCAgICAgICAgICAgIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICBpbmNsdWRl
L2RybS9kcm1fbW9kZV9jb25maWcuaCAgICAgfCAgNiArKysrKysKPiA+ICAzIGZpbGVzIGNoYW5n
ZWQsIDM2IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9hdG9taWNfdWFwaS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfdWFwaS5jCj4g
PiBpbmRleCAwZDQ2NmQzYjA4MDkuLjg4MzMyOTQ1M2E4NiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9hdG9taWNfdWFwaS5jCj4gPiBAQCAtNDM1LDYgKzQzNSw4IEBAIHN0YXRpYyBpbnQgZHJtX2F0
b21pY19jcnRjX3NldF9wcm9wZXJ0eShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gPiAgICAgICAg
ICAgICAgIHJldHVybiByZXQ7Cj4gPiAgICAgICB9IGVsc2UgaWYgKHByb3BlcnR5ID09IGNvbmZp
Zy0+cHJvcF92cnJfZW5hYmxlZCkgewo+ID4gICAgICAgICAgICAgICBzdGF0ZS0+dnJyX2VuYWJs
ZWQgPSB2YWw7Cj4gPiArICAgICB9IGVsc2UgaWYgKHByb3BlcnR5ID09IGNvbmZpZy0+c2NhbGlu
Z19maWx0ZXJfcHJvcGVydHkpIHsKPiA+ICsgICAgICAgICAgICAgc3RhdGUtPnNjYWxpbmdfZmls
dGVyID0gdmFsOwo+ID4gICAgICAgfSBlbHNlIGlmIChwcm9wZXJ0eSA9PSBjb25maWctPmRlZ2Ft
bWFfbHV0X3Byb3BlcnR5KSB7Cj4gPiAgICAgICAgICAgICAgIHJldCA9IGRybV9hdG9taWNfcmVw
bGFjZV9wcm9wZXJ0eV9ibG9iX2Zyb21faWQoZGV2LAo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAmc3RhdGUtPmRlZ2FtbWFfbHV0LAo+ID4gQEAgLTUwMyw2ICs1MDUs
OCBAQCBkcm1fYXRvbWljX2NydGNfZ2V0X3Byb3BlcnR5KHN0cnVjdCBkcm1fY3J0YyAqY3J0YywK
PiA+ICAgICAgICAgICAgICAgKnZhbCA9IChzdGF0ZS0+Z2FtbWFfbHV0KSA/IHN0YXRlLT5nYW1t
YV9sdXQtPmJhc2UuaWQgOiAwOwo+ID4gICAgICAgZWxzZSBpZiAocHJvcGVydHkgPT0gY29uZmln
LT5wcm9wX291dF9mZW5jZV9wdHIpCj4gPiAgICAgICAgICAgICAgICp2YWwgPSAwOwo+ID4gKyAg
ICAgZWxzZSBpZiAocHJvcGVydHkgPT0gY29uZmlnLT5zY2FsaW5nX2ZpbHRlcl9wcm9wZXJ0eSkK
PiA+ICsgICAgICAgICAgICAgKnZhbCA9IHN0YXRlLT5zY2FsaW5nX2ZpbHRlcjsKPiA+ICAgICAg
IGVsc2UgaWYgKGNydGMtPmZ1bmNzLT5hdG9taWNfZ2V0X3Byb3BlcnR5KQo+ID4gICAgICAgICAg
ICAgICByZXR1cm4gY3J0Yy0+ZnVuY3MtPmF0b21pY19nZXRfcHJvcGVydHkoY3J0Yywgc3RhdGUs
IHByb3BlcnR5LCB2YWwpOwo+ID4gICAgICAgZWxzZQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
ZHJtL2RybV9jcnRjLmggYi9pbmNsdWRlL2RybS9kcm1fY3J0Yy5oCj4gPiBpbmRleCA1ZTliMTVh
MGU4YzUuLjk0YzU1MDk0NzRhOCAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jcnRj
LmgKPiA+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jcnRjLmgKPiA+IEBAIC01OCw2ICs1OCwyNSBA
QCBzdHJ1Y3QgZGV2aWNlX25vZGU7Cj4gPiAgc3RydWN0IGRtYV9mZW5jZTsKPiA+ICBzdHJ1Y3Qg
ZWRpZDsKPiA+Cj4gPiArZW51bSBkcm1fc2NhbGluZ19maWx0ZXJzIHsKPiA+ICsgICAgIERSTV9T
Q0FMSU5HX0ZJTFRFUl9ERUZBVUxULAo+ID4gKyAgICAgRFJNX1NDQUxJTkdfRklMVEVSX01FRElV
TSwKPiA+ICsgICAgIERSTV9TQ0FMSU5HX0ZJTFRFUl9CSUxJTkVBUiwKPiA+ICsgICAgIERSTV9T
Q0FMSU5HX0ZJTFRFUl9OTiwKPiA+ICsgICAgIERSTV9TQ0FMSU5HX0ZJTFRFUl9OTl9JU19PTkxZ
LAo+ID4gKyAgICAgRFJNX1NDQUxJTkdfRklMVEVSX0VER0VfRU5IQU5DRSwKPiAKPiBUaGlzIG9u
ZSBsb29rcyB0byBiZSBtaXNzaW5nIGEgc3RyaW5naWZpZWQgdmVyc2lvbiBiZWxvdy4gSnVzdCB3
YW50ZWQKPiB0byBqdW1wIGluIGVhcmx5IGFuZCBzdWdnZXN0IGRyb3BwaW5nIGl0IGZyb20gdGhl
IHNjYWxpbmcgZmlsdGVyIGVudW0uCj4gRWRnZSBlbmhhbmNlbWVudCBpcyBvcnRob2dvbmFsIHRv
IHRoZSBtb2RlIHVzZWQgZm9yIHNjYWxpbmcsIGF0IGxlYXN0Cj4gb24ga29tZWRhIEhXLCBzbyB3
ZSB3b3VsZG4ndCBiZSBhYmxlIHRvIG1ha2UgdGhlIGJlc3QgdXNlIG9mIHRoZQo+IHByb3BlcnR5
IGluIGl0cyBjdXJyZW50IGZvcm0uCj4gCj4gPiArICAgICBEUk1fU0NBTElOR19GSUxURVJfSU5W
QUxJRCwKPiA+ICt9Owo+ID4gKwo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3Byb3BfZW51
bV9saXN0IGRybV9zY2FsaW5nX2ZpbHRlcl9lbnVtX2xpc3RbXSA9IHsKPiA+ICsgICAgIHsgRFJN
X1NDQUxJTkdfRklMVEVSX0RFRkFVTFQsICJEZWZhdWx0IiB9LAo+ID4gKyAgICAgeyBEUk1fU0NB
TElOR19GSUxURVJfTUVESVVNLCAiTWVkaXVtIiB9LAo+ID4gKyAgICAgeyBEUk1fU0NBTElOR19G
SUxURVJfQklMSU5FQVIsICJCaWxpbmVhciIgfSwKPiA+ICsgICAgIHsgRFJNX1NDQUxJTkdfRklM
VEVSX05OLCAiTmVhcmVzdCBOZWlnaGJvciIgfSwKPiA+ICsgICAgIHsgRFJNX1NDQUxJTkdfRklM
VEVSX05OX0lTX09OTFksICJJbnRlZ2VyIE1vZGUgU2NhbGluZyIgfSwKPiA+ICsgICAgIHsgRFJN
X1NDQUxJTkdfRklMVEVSX0lOVkFMSUQsICJJbnZhbGlkIiB9LAo+ID4gK307Cj4gPiArCj4gPiAg
c3RhdGljIGlubGluZSBpbnQ2NF90IFU2NDJJNjQodWludDY0X3QgdmFsKQo+ID4gIHsKPiA+ICAg
ICAgIHJldHVybiAoaW50NjRfdCkqKChpbnQ2NF90ICopJnZhbCk7Cj4gPiBAQCAtMjgzLDYgKzMw
MiwxMyBAQCBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgewo+ID4gICAgICAgICovCj4gPiAgICAgICB1
MzIgdGFyZ2V0X3ZibGFuazsKPiA+Cj4gPiArICAgICAvKioKPiA+ICsgICAgICAqIEBzY2FsaW5n
X2ZpbHRlcjoKPiA+ICsgICAgICAqCj4gPiArICAgICAgKiBTY2FsaW5nIGZpbHRlciBtb2RlIHRv
IGJlIGFwcGxpZWQKPiA+ICsgICAgICAqLwo+ID4gKyAgICAgdTMyIHNjYWxpbmdfZmlsdGVyOwo+
ID4gKwo+ID4gICAgICAgLyoqCj4gPiAgICAgICAgKiBAYXN5bmNfZmxpcDoKPiA+ICAgICAgICAq
Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmggYi9pbmNsdWRl
L2RybS9kcm1fbW9kZV9jb25maWcuaAo+ID4gaW5kZXggM2JjYmUzMDMzOWYwLi5lZmQ2ZmQ1NTc3
MGYgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWcuaAo+ID4gKysr
IGIvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmgKPiA+IEBAIC05MTQsNiArOTE0LDEyIEBA
IHN0cnVjdCBkcm1fbW9kZV9jb25maWcgewo+ID4gICAgICAgICovCj4gPiAgICAgICBzdHJ1Y3Qg
ZHJtX3Byb3BlcnR5ICptb2RpZmllcnNfcHJvcGVydHk7Cj4gPgo+ID4gKyAgICAgLyoqCj4gPiAr
ICAgICAgKiBAc2NhbGluZ19maWx0ZXJfcHJvcGVydHk6IENSVEMgcHJvcGVydHkgdG8gYXBwbHkg
YSBwYXJ0aWN1bGFyIGZpbHRlcgo+IAo+IEEgc2NhbGluZyBmaWx0ZXIgb3B0aW9uIGNhbiBhbHNv
IGJlIHVzZWZ1bCBmb3Igc2NhbGluZyBpbmRpdmlkdWFsCj4gcGxhbmVzLCBkbyB5b3UgaGF2ZSBh
bnkgcGxhbnMgdG8gZXh0ZW5kIHRoZSBwcm9wZXJ0eSdzIGFwcGxpY2F0aW9ucwo+IGluIHRoYXQg
ZGlyZWN0aW9uPwo+IAo+ID4gKyAgICAgICogd2hpbGUgc2NhbGluZyBpbiBwYW5lbCBmaXR0ZXIg
bW9kZS4KPiA+ICsgICAgICAqLwo+ID4gKyAgICAgc3RydWN0IGRybV9wcm9wZXJ0eSAqc2NhbGlu
Z19maWx0ZXJfcHJvcGVydHk7Cj4gPiArCj4gPiAgICAgICAvKiBjdXJzb3Igc2l6ZSAqLwo+ID4g
ICAgICAgdWludDMyX3QgY3Vyc29yX3dpZHRoLCBjdXJzb3JfaGVpZ2h0Owo+ID4KPiA+Cj4gCj4g
Cj4gLS0KPiBNaWhhaWwKPiAKPiAKPiAKPiBJTVBPUlRBTlQgTk9USUNFOiBUaGUgY29udGVudHMg
b2YgdGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGFyZSBjb25maWRlbnRpYWwgYW5kIG1h
eSBhbHNvIGJlIHByaXZpbGVnZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGll
bnQsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQgZG8gbm90IGRpc2Ns
b3NlIHRoZSBjb250ZW50cyB0byBhbnkgb3RoZXIgcGVyc29uLCB1c2UgaXQgZm9yIGFueSBwdXJw
b3NlLCBvciBzdG9yZSBvciBjb3B5IHRoZSBpbmZvcm1hdGlvbiBpbiBhbnkgbWVkaXVtLiBUaGFu
ayB5b3UuCgpTb3JyeSBhYm91dCB0aGF0IG5vdGljZSwgbm90IGludGVudGlvbmFsIDotKAoKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiAKCgot
LSAKTWloYWlsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
