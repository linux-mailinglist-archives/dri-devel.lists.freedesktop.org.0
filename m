Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF5BE04F3
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 15:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7F76E7AD;
	Tue, 22 Oct 2019 13:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00055.outbound.protection.outlook.com [40.107.0.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03ABD8933C;
 Tue, 22 Oct 2019 13:26:51 +0000 (UTC)
Received: from VI1PR08CA0245.eurprd08.prod.outlook.com (2603:10a6:803:dc::18)
 by DBBPR08MB4870.eurprd08.prod.outlook.com (2603:10a6:10:f6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Tue, 22 Oct
 2019 13:26:48 +0000
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::203) by VI1PR08CA0245.outlook.office365.com
 (2603:10a6:803:dc::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.21 via Frontend
 Transport; Tue, 22 Oct 2019 13:26:48 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.23 via Frontend Transport; Tue, 22 Oct 2019 13:26:46 +0000
Received: ("Tessian outbound 0939a6bab6b1:v33");
 Tue, 22 Oct 2019 13:26:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 19f1bcfb1c7cd8b6
X-CR-MTA-TID: 64aa7808
Received: from e3ba1ca9c421.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.13.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 424233E6-9B3A-46DE-8013-EF9AC23D4D08.1; 
 Tue, 22 Oct 2019 13:26:40 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e3ba1ca9c421.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Oct 2019 13:26:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJiEHH59oKFFlTA8cDExnsNI8KjRnRHOZ9TboFhuBE7i/t1CM4NE1rRRrN6sdEqkRKCT9G7GmxhDwe1+Z05acWjcEH3KWoZ7ZjsLphGQ2HE+U8PSBiSrWRaOPY9bl/63b4A2HRTz1dPB+fT9CHCZisdDnf0SaAmK46qrNqJpsd0SthfNZwlqfvZ+hw1vd3FNPIGDEL2S38fImt7NB+dARI5vbuadY2fCiATPUyCDVRsgnjJwQBfBB+3I6ZVvkrC07VTCeJWfE2UlgGkYLa/vuDsAHieLuw451KQACvu1Q5AyCujxt8Lej+k2z84JgM5U6Q5+zaT+g7cz0LNea30DwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/uRtiHoQn5ynFzt7ny6g7i2eFwL9YGCKPY/G7UtoUo=;
 b=d181lHig61ZCDLsw8DelfI+k2so4mUT01g8KG/+R3H7bgStZORdXSyTt2I8eSHRjOeVf63r8M+qCDJzwNJXGy0lucVN8QQ6enxTV3TukUTWUYLjmCiQbirPOs2bLTSNLhP0MZfJx8IA2vjl/gdKZCTKTDFqrPIH1Re8ghSkr3nyE7NwqbwfBy/jS1e3uZ7zqKHcHkXDXRiVZgGmrTujJ7BNUnbhtuQliKKuohnKO+xso+QfMiF/Hk6xtRaoGKw74xUrY1uclP90vPksTHC5zpvuUggOwaBam3Lg+R3PXvITeV8g1y12fpHNgsB0v2/s9WMvAcxycB46e+fzwR8Nl/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3327.eurprd08.prod.outlook.com (10.171.182.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 22 Oct 2019 13:26:38 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2367.022; Tue, 22 Oct 2019
 13:26:38 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm: Introduce scaling filter mode property
Thread-Topic: [PATCH 1/3] drm: Introduce scaling filter mode property
Thread-Index: AQHViL+r8gMrqrpaJEmayeUXozTdHKdmpymA
Date: Tue, 22 Oct 2019 13:26:38 +0000
Message-ID: <1738058.hDiTJb8QWX@e123338-lin>
References: <20191022095946.29354-1-shashank.sharma@intel.com>
 <20191022095946.29354-2-shashank.sharma@intel.com>
In-Reply-To: <20191022095946.29354-2-shashank.sharma@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.51]
x-clientproxiedby: LO2P265CA0365.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::17) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8e6c0a8b-50d9-4abc-7609-08d756f37c95
X-MS-TrafficTypeDiagnostic: VI1PR08MB3327:|DBBPR08MB4870:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <DBBPR08MB48700709F3048A46E64251868F680@DBBPR08MB4870.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 01986AE76B
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10001)(10009020)(7916004)(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(189003)(199004)(14444005)(76176011)(99286004)(316002)(6486002)(11346002)(33716001)(2501003)(229853002)(6436002)(2351001)(476003)(486006)(446003)(14454004)(5640700003)(6506007)(386003)(26005)(186003)(102836004)(52116002)(71200400001)(256004)(25786009)(71190400001)(6246003)(86362001)(2906002)(7736002)(66066001)(305945005)(5660300002)(4326008)(6916009)(478600001)(3846002)(6116002)(8676002)(81156014)(81166006)(8936002)(64756008)(966005)(9686003)(6306002)(66556008)(6512007)(66946007)(54906003)(66476007)(66446008)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3327;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: h7WunGXqnY6ulL+5N63eKFHLrZP6pnddzJq1GG/lemJDVs+TBvzcV77K5uq8ZzGPNeE6r5Zw0TbbmnqPdpMkCY8+ObPrrVmJyDjv/zdUwtyj12My3u2B1KnYxRMY6OFWQIB4yrq6NVR4cm17bpJWMpZ1fVVQzkPSbCteNmDDwP/KAAsCVgQva4c53jZNBjBvqghOfFIQeiwDQS+m1nL2NuNjP4wl4ACNtPDdPz3Tv0J3eo8i9DkgYk44/26vR6vj/bqjhPbrg5YAnRzJsUfTYfoWqLlNURtLPmBbYMnPPSQEMHyG3XG5wYYr63m61+5xsrXZRpBRcwRTHIzDJT9Hq2j8fSwreMxmuv6Dz0qavVvQlAj6QbA9iIo3L3TfLz0XWpZIaKF7lW7DTj+rH6+Zv5mjAbk3PuBKf6vnZ/G5EcA+YH1VARt3PwJ+EjOQNXtfp9CfqsrljbjeF9m7EOEPsXUm4PS+c3LquXv067wHmEM=
x-ms-exchange-transport-forked: True
Content-ID: <5EA368D94D0FBA4F8FFB5A36F1AB1DFD@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3327
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10001)(10009020)(7916004)(4636009)(136003)(39860400002)(396003)(376002)(346002)(189003)(199004)(40434004)(9686003)(5660300002)(126002)(446003)(6306002)(25786009)(229853002)(66066001)(2906002)(6486002)(450100002)(2501003)(102836004)(336012)(486006)(26005)(4326008)(47776003)(63350400001)(2351001)(11346002)(356004)(5640700003)(6916009)(6512007)(186003)(6246003)(476003)(22756006)(36906005)(46406003)(14444005)(8676002)(99286004)(54906003)(8936002)(76130400001)(76176011)(70586007)(86362001)(50466002)(97756001)(3846002)(26826003)(81166006)(305945005)(81156014)(8746002)(316002)(7736002)(6506007)(33716001)(966005)(386003)(70206006)(5024004)(14454004)(478600001)(23726003)(6116002)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4870;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: d73218e7-8be2-4443-81ed-08d756f377c7
X-Forefront-PRVS: 01986AE76B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PJXSQc7nI4/7IrxziWsyZPM3bBb1hGakQSlBNRd4JLGhOWszCjGp8cOlBGpsthFS/qt27xZLnw9a2v7g34a6XW0O9tgbOZh/D2Ble8ZfUWgfdbwiGQrKW8X15wJEb3CC4uYLCBRQOn10Y3FTe6IxhmkWi4GnmM0SRGm2Luoi5792w5dZcyNA4Xxr2CaynRgVbEz6ZITKjgBAQiUoHf33flgAcw09yJe4ZYY12icXODAYO5FNheMDyTk0iymv8e0Rd566AW/lzRx580c1hg4JScG4jvR9lurb4vcnsCd90Dbmd6vfWzSZPLH0g8V3ssIo4al7X7JL9pzQx//E2k6MH9qgzlc+xyKAJcgdRQFwCbRjP4TlMTs/3bjQ4OEYq9hPA2xccxeCB5CcrbVHGjBwR/k7XqdQJbkcinsnQmrSepd/kwQviRZwjWuO3z1WvmGGR++fCuU6+bh+KtkXk1d7UbnvwZ+TTIQJdeVIeFyXU9s=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2019 13:26:46.1624 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e6c0a8b-50d9-4abc-7609-08d756f37c95
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4870
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0z4pB9kk0t/OP/6MX9lguIE0NYANG5tYd4N2/Iwq+E8=;
 b=qF/ALluwzOo7VK7yozU6/+bGUG/Qe2lGtWKvl75E8dafRQXVven9SL2aGwEsVE3YmeuRdxsNyI/0hToS7kVQFUxsGsJYH0SRzVx4QFkxIbxRofUQVVbqR1BoAO0AB4r8YLpNWfTx0HO/x0wlVgUnRZuFoECmGp+BRAXLJU1aAng=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/uRtiHoQn5ynFzt7ny6g7i2eFwL9YGCKPY/G7UtoUo=;
 b=1NLHSUEBgVPS0hTBx5FatZBbQ3xJ5MrMMr4B8bDm/PDE9uPnWROSUAdUul+6n2Wjz1sapThYUmfM0oI62oiCa7A8JTfsI9lg+0UX89RA/CYKgA/EfARg38d2uyHbU8IlYD1IjOUf/k/GnPO39maSEHaqTIW/ZLMGUh5YeXFt1BA=
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2hhc2hhbmssCgpPbiBUdWVzZGF5LCAyMiBPY3RvYmVyIDIwMTkgMTA6NTk6NDQgQlNUIFNo
YXNoYW5rIFNoYXJtYSB3cm90ZToKPiBUaGlzIHBhdGNoIGFkZHMgYSBzY2FsaW5nIGZpbHRlciBt
b2RlIHBvcnBlcnR5Cj4gdG8gYWxsb3c6Cj4gLSBBIGRyaXZlci9IVyB0byBzaG93Y2FzZSBpdCdz
IHNjYWxpbmcgZmlsdGVyIGNhcGFiaWxpdGllcy4KPiAtIEEgdXNlcnNwYWNlIHRvIHBpY2sgYSBk
ZXNpcmVkIGVmZmVjdCB3aGlsZSBzY2FsaW5nLgo+Cj4gVGhpcyBvcHRpb24gd2lsbCBiZSBwYXJ0
aWN1bGFybHkgdXNlZnVsIGluIHRoZSBzY2VuYXJpb3Mgd2hlcmUKPiBJbnRlZ2VyIG1vZGUgc2Nh
bGluZyBpcyBwb3NzaWJsZSwgYW5kIGEgVUkgY2xpZW50IHdhbnRzIHRvIHBpY2sKPiBmaWx0ZXJz
IGxpa2UgTmVhcmVzdC1uZWlnaGJvciBhcHBsaWVkIGZvciBub24tYmx1cnJ5IG91dHB1dHMuCj4K
PiBUaGVyZSB3YXMgYSBSRkMgcGF0Y2ggc2VyaWVzIHB1Ymxpc2hlZCwgdG8gZGlzY3VzIHRoZSBy
ZXF1ZXN0IHRvIGVuYWJsZQo+IEludGVnZXIgbW9kZSBzY2FsaW5nIGJ5IHNvbWUgb2YgdGhlIGdh
bWluZyBjb21tdW5pdGllcywgd2hpY2ggY2FuIGJlCj4gZm91bmQgaGVyZToKPiBodHRwczovL3Bh
dGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzY2MTc1Lwo+Cj4gU2lnbmVkLW9mZi1ieTog
U2hhc2hhbmsgU2hhcm1hIDxzaGFzaGFuay5zaGFybWFAaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMgfCAgNCArKysrCj4gIGluY2x1ZGUvZHJtL2Ry
bV9jcnRjLmggICAgICAgICAgICB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGlu
Y2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oICAgICB8ICA2ICsrKysrKwo+ICAzIGZpbGVzIGNo
YW5nZWQsIDM2IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2F0b21pY191YXBpLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMKPiBp
bmRleCAwZDQ2NmQzYjA4MDkuLjg4MzMyOTQ1M2E4NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2F0b21pY191YXBpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21p
Y191YXBpLmMKPiBAQCAtNDM1LDYgKzQzNSw4IEBAIHN0YXRpYyBpbnQgZHJtX2F0b21pY19jcnRj
X3NldF9wcm9wZXJ0eShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gICAgICAgICAgICAgICByZXR1
cm4gcmV0Owo+ICAgICAgIH0gZWxzZSBpZiAocHJvcGVydHkgPT0gY29uZmlnLT5wcm9wX3Zycl9l
bmFibGVkKSB7Cj4gICAgICAgICAgICAgICBzdGF0ZS0+dnJyX2VuYWJsZWQgPSB2YWw7Cj4gKyAg
ICAgfSBlbHNlIGlmIChwcm9wZXJ0eSA9PSBjb25maWctPnNjYWxpbmdfZmlsdGVyX3Byb3BlcnR5
KSB7Cj4gKyAgICAgICAgICAgICBzdGF0ZS0+c2NhbGluZ19maWx0ZXIgPSB2YWw7Cj4gICAgICAg
fSBlbHNlIGlmIChwcm9wZXJ0eSA9PSBjb25maWctPmRlZ2FtbWFfbHV0X3Byb3BlcnR5KSB7Cj4g
ICAgICAgICAgICAgICByZXQgPSBkcm1fYXRvbWljX3JlcGxhY2VfcHJvcGVydHlfYmxvYl9mcm9t
X2lkKGRldiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZzdGF0ZS0+
ZGVnYW1tYV9sdXQsCj4gQEAgLTUwMyw2ICs1MDUsOCBAQCBkcm1fYXRvbWljX2NydGNfZ2V0X3By
b3BlcnR5KHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiAgICAgICAgICAgICAgICp2YWwgPSAoc3Rh
dGUtPmdhbW1hX2x1dCkgPyBzdGF0ZS0+Z2FtbWFfbHV0LT5iYXNlLmlkIDogMDsKPiAgICAgICBl
bHNlIGlmIChwcm9wZXJ0eSA9PSBjb25maWctPnByb3Bfb3V0X2ZlbmNlX3B0cikKPiAgICAgICAg
ICAgICAgICp2YWwgPSAwOwo+ICsgICAgIGVsc2UgaWYgKHByb3BlcnR5ID09IGNvbmZpZy0+c2Nh
bGluZ19maWx0ZXJfcHJvcGVydHkpCj4gKyAgICAgICAgICAgICAqdmFsID0gc3RhdGUtPnNjYWxp
bmdfZmlsdGVyOwo+ICAgICAgIGVsc2UgaWYgKGNydGMtPmZ1bmNzLT5hdG9taWNfZ2V0X3Byb3Bl
cnR5KQo+ICAgICAgICAgICAgICAgcmV0dXJuIGNydGMtPmZ1bmNzLT5hdG9taWNfZ2V0X3Byb3Bl
cnR5KGNydGMsIHN0YXRlLCBwcm9wZXJ0eSwgdmFsKTsKPiAgICAgICBlbHNlCj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHJtL2RybV9jcnRjLmggYi9pbmNsdWRlL2RybS9kcm1fY3J0Yy5oCj4gaW5k
ZXggNWU5YjE1YTBlOGM1Li45NGM1NTA5NDc0YTggMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0v
ZHJtX2NydGMuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jcnRjLmgKPiBAQCAtNTgsNiArNTgs
MjUgQEAgc3RydWN0IGRldmljZV9ub2RlOwo+ICBzdHJ1Y3QgZG1hX2ZlbmNlOwo+ICBzdHJ1Y3Qg
ZWRpZDsKPgo+ICtlbnVtIGRybV9zY2FsaW5nX2ZpbHRlcnMgewo+ICsgICAgIERSTV9TQ0FMSU5H
X0ZJTFRFUl9ERUZBVUxULAo+ICsgICAgIERSTV9TQ0FMSU5HX0ZJTFRFUl9NRURJVU0sCj4gKyAg
ICAgRFJNX1NDQUxJTkdfRklMVEVSX0JJTElORUFSLAo+ICsgICAgIERSTV9TQ0FMSU5HX0ZJTFRF
Ul9OTiwKPiArICAgICBEUk1fU0NBTElOR19GSUxURVJfTk5fSVNfT05MWSwKPiArICAgICBEUk1f
U0NBTElOR19GSUxURVJfRURHRV9FTkhBTkNFLAoKVGhpcyBvbmUgbG9va3MgdG8gYmUgbWlzc2lu
ZyBhIHN0cmluZ2lmaWVkIHZlcnNpb24gYmVsb3cuIEp1c3Qgd2FudGVkCnRvIGp1bXAgaW4gZWFy
bHkgYW5kIHN1Z2dlc3QgZHJvcHBpbmcgaXQgZnJvbSB0aGUgc2NhbGluZyBmaWx0ZXIgZW51bS4K
RWRnZSBlbmhhbmNlbWVudCBpcyBvcnRob2dvbmFsIHRvIHRoZSBtb2RlIHVzZWQgZm9yIHNjYWxp
bmcsIGF0IGxlYXN0Cm9uIGtvbWVkYSBIVywgc28gd2Ugd291bGRuJ3QgYmUgYWJsZSB0byBtYWtl
IHRoZSBiZXN0IHVzZSBvZiB0aGUKcHJvcGVydHkgaW4gaXRzIGN1cnJlbnQgZm9ybS4KCj4gKyAg
ICAgRFJNX1NDQUxJTkdfRklMVEVSX0lOVkFMSUQsCj4gK307Cj4gKwo+ICtzdGF0aWMgY29uc3Qg
c3RydWN0IGRybV9wcm9wX2VudW1fbGlzdCBkcm1fc2NhbGluZ19maWx0ZXJfZW51bV9saXN0W10g
PSB7Cj4gKyAgICAgeyBEUk1fU0NBTElOR19GSUxURVJfREVGQVVMVCwgIkRlZmF1bHQiIH0sCj4g
KyAgICAgeyBEUk1fU0NBTElOR19GSUxURVJfTUVESVVNLCAiTWVkaXVtIiB9LAo+ICsgICAgIHsg
RFJNX1NDQUxJTkdfRklMVEVSX0JJTElORUFSLCAiQmlsaW5lYXIiIH0sCj4gKyAgICAgeyBEUk1f
U0NBTElOR19GSUxURVJfTk4sICJOZWFyZXN0IE5laWdoYm9yIiB9LAo+ICsgICAgIHsgRFJNX1ND
QUxJTkdfRklMVEVSX05OX0lTX09OTFksICJJbnRlZ2VyIE1vZGUgU2NhbGluZyIgfSwKPiArICAg
ICB7IERSTV9TQ0FMSU5HX0ZJTFRFUl9JTlZBTElELCAiSW52YWxpZCIgfSwKPiArfTsKPiArCj4g
IHN0YXRpYyBpbmxpbmUgaW50NjRfdCBVNjQySTY0KHVpbnQ2NF90IHZhbCkKPiAgewo+ICAgICAg
IHJldHVybiAoaW50NjRfdCkqKChpbnQ2NF90ICopJnZhbCk7Cj4gQEAgLTI4Myw2ICszMDIsMTMg
QEAgc3RydWN0IGRybV9jcnRjX3N0YXRlIHsKPiAgICAgICAgKi8KPiAgICAgICB1MzIgdGFyZ2V0
X3ZibGFuazsKPgo+ICsgICAgIC8qKgo+ICsgICAgICAqIEBzY2FsaW5nX2ZpbHRlcjoKPiArICAg
ICAgKgo+ICsgICAgICAqIFNjYWxpbmcgZmlsdGVyIG1vZGUgdG8gYmUgYXBwbGllZAo+ICsgICAg
ICAqLwo+ICsgICAgIHUzMiBzY2FsaW5nX2ZpbHRlcjsKPiArCj4gICAgICAgLyoqCj4gICAgICAg
ICogQGFzeW5jX2ZsaXA6Cj4gICAgICAgICoKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJt
X21vZGVfY29uZmlnLmggYi9pbmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWcuaAo+IGluZGV4IDNi
Y2JlMzAzMzlmMC4uZWZkNmZkNTU3NzBmIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9t
b2RlX2NvbmZpZy5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmgKPiBAQCAt
OTE0LDYgKzkxNCwxMiBAQCBzdHJ1Y3QgZHJtX21vZGVfY29uZmlnIHsKPiAgICAgICAgKi8KPiAg
ICAgICBzdHJ1Y3QgZHJtX3Byb3BlcnR5ICptb2RpZmllcnNfcHJvcGVydHk7Cj4KPiArICAgICAv
KioKPiArICAgICAgKiBAc2NhbGluZ19maWx0ZXJfcHJvcGVydHk6IENSVEMgcHJvcGVydHkgdG8g
YXBwbHkgYSBwYXJ0aWN1bGFyIGZpbHRlcgoKQSBzY2FsaW5nIGZpbHRlciBvcHRpb24gY2FuIGFs
c28gYmUgdXNlZnVsIGZvciBzY2FsaW5nIGluZGl2aWR1YWwKcGxhbmVzLCBkbyB5b3UgaGF2ZSBh
bnkgcGxhbnMgdG8gZXh0ZW5kIHRoZSBwcm9wZXJ0eSdzIGFwcGxpY2F0aW9ucwppbiB0aGF0IGRp
cmVjdGlvbj8KCj4gKyAgICAgICogd2hpbGUgc2NhbGluZyBpbiBwYW5lbCBmaXR0ZXIgbW9kZS4K
PiArICAgICAgKi8KPiArICAgICBzdHJ1Y3QgZHJtX3Byb3BlcnR5ICpzY2FsaW5nX2ZpbHRlcl9w
cm9wZXJ0eTsKPiArCj4gICAgICAgLyogY3Vyc29yIHNpemUgKi8KPiAgICAgICB1aW50MzJfdCBj
dXJzb3Jfd2lkdGgsIGN1cnNvcl9oZWlnaHQ7Cj4KPgoKCi0tCk1paGFpbAoKCgpJTVBPUlRBTlQg
Tk9USUNFOiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGFy
ZSBjb25maWRlbnRpYWwgYW5kIG1heSBhbHNvIGJlIHByaXZpbGVnZWQuIElmIHlvdSBhcmUgbm90
IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlh
dGVseSBhbmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0byBhbnkgb3RoZXIgcGVyc29u
LCB1c2UgaXQgZm9yIGFueSBwdXJwb3NlLCBvciBzdG9yZSBvciBjb3B5IHRoZSBpbmZvcm1hdGlv
biBpbiBhbnkgbWVkaXVtLiBUaGFuayB5b3UuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
