Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE666E326
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 11:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E4E89483;
	Fri, 19 Jul 2019 09:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150088.outbound.protection.outlook.com [40.107.15.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B731D89483
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 09:09:48 +0000 (UTC)
Received: from DB6PR0801CA0046.eurprd08.prod.outlook.com (2603:10a6:4:2b::14)
 by DB8PR08MB4955.eurprd08.prod.outlook.com (2603:10a6:10:38::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Fri, 19 Jul
 2019 09:09:44 +0000
Received: from DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::201) by DB6PR0801CA0046.outlook.office365.com
 (2603:10a6:4:2b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2094.12 via Frontend
 Transport; Fri, 19 Jul 2019 09:09:44 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT016.mail.protection.outlook.com (10.152.20.141) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Fri, 19 Jul 2019 09:09:43 +0000
Received: ("Tessian outbound 96ba4cc141ab:v24");
 Fri, 19 Jul 2019 09:09:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4ac02340fa17c092
X-CR-MTA-TID: 64aa7808
Received: from a267e056f77a.2 (cr-mta-lb-1.cr-mta-net [104.47.0.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EE7EE0DD-E828-491B-89E0-038A54CD5E26.1; 
 Fri, 19 Jul 2019 09:09:33 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a267e056f77a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 19 Jul 2019 09:09:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1YnKYqHRpwPcUqpuC0xUF0O+OzVdYS0dztydqlVWE0OEkQ8laEAg9PAHhKbMz8nEhI78OZ7q8M3tCKPTm4RCcPwN59OR0ZOSzwToX/1/NEie6Z6z3POdViNm1PWUe84CklRzt1UwxetWOVCznf/6gHVFx2PLvUf8J35k8CZPEIepJb0DjChbuw+fSAQOyvxmUZK+iqnASX/jdjF2QTUxoucC2jJBYQqd+UO62M7wgXCMDmpCzI2udIZM9SX4ch5WNHF6n8OjpuX2iA234igaPGhBtaPhXTaTW5QwIKfUGZrXpBuNUAELbNYOUseQEu4qoSSU9O+Q50h0ZERvhIHJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwJLvZaih+kxKr1qdqlQee+TjeWFZw/pEJefL3n6rdg=;
 b=YWkcWa4Z/GRgxC97F2EmXy+Zpno6ZeW1R64AYEkEKZwsgpj1avjjpB9LJj9UTFUpqdxOJC7mNOM1zIHd5Ia1MMY0gyCgnsez3tMuzxcIicTCtfuSHJ0rD/F40+RCZI1N3UnAggHYMdHucqCsYHaUIuVgS8L5B2pNFJDePbMfpo6Gzy66bsaXogWGUKtatyKYuMb/HmDH8Gw2CTCcqgah0W8gakvtm16k938S/a7g0jmP5aDW8uEm7eRJVGJgDAho7tpRWOVMGBDM9j+mVOT2jzV2mxcbhVaIj7J8Yj8+tUerjUo9ZwFdFX/sZpir1J1YBG08kZSan0RcoRhE4co2VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB2799.eurprd08.prod.outlook.com (10.170.236.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Fri, 19 Jul 2019 09:09:30 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::390b:b8a9:542b:9ef9]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::390b:b8a9:542b:9ef9%3]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 09:09:30 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH] drm/komeda: Adds error event print functionality
Thread-Topic: [PATCH] drm/komeda: Adds error event print functionality
Thread-Index: AQHVLJXktogmbqKelUWXSXQXvsiyYKbQfSqAgAFMq4A=
Date: Fri, 19 Jul 2019 09:09:30 +0000
Message-ID: <20190719090816.GA4133@lowry.li@arm.com>
References: <1561604994-26925-1-git-send-email-lowry.li@arm.com>
 <20190718131737.GD5942@e110455-lin.cambridge.arm.com>
In-Reply-To: <20190718131737.GD5942@e110455-lin.cambridge.arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.5.21 (2010-09-15)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0071.apcprd03.prod.outlook.com
 (2603:1096:203:52::35) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 735920cc-54f4-4a97-ff1a-08d70c28d690
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB2799; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB2799:|DB8PR08MB4955:
X-Microsoft-Antispam-PRVS: <DB8PR08MB4955F68C5A7282281DAFC8769FCB0@DB8PR08MB4955.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 01039C93E4
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(189003)(199004)(71200400001)(71190400001)(8936002)(486006)(4326008)(36756003)(99286004)(1076003)(86362001)(6246003)(81166006)(58126008)(316002)(256004)(54906003)(14444005)(53936002)(6862004)(5660300002)(476003)(81156014)(66476007)(66946007)(66556008)(229853002)(11346002)(446003)(66446008)(64756008)(61793004)(9686003)(6512007)(6436002)(7736002)(14454004)(186003)(2906002)(305945005)(3846002)(6636002)(66066001)(6486002)(386003)(6506007)(26005)(55236004)(25786009)(52116002)(76176011)(8676002)(33656002)(68736007)(6116002)(478600001)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2799;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: BdvebxRBQ8S2oaYKwx0NbZx5AZk05CCh0W+aME+l+ZTlxHWxCVCR8dcsUu0bi3KHmuu4i/BxKHsIUv4HMJU1leRtARGsoX93S/FOfkPDw+eVL1RDZ8skzRKucDFN69SSdkmXE+1eefiKI6+NLDp7mJlWXCkV25VDl/xwZ82i5Yh/2z0xYuIBT/PIR/8zcCil4/EOGsp3BcsPEnVO9/51ixvfSYKYK7PRjiGAvmlCU9skb6gIImZczcFx3uibXozRkmKVrZ8si7PzBD//hG7K9cwNPp7pL6ZN1DrSZaGNZBXa/4MxlL5XASn3eOLshCL3OqP2J2pzLol1ZXpDhlJeEuZr0V6pqEJ4kyq0Lzn3Nft0qwogXE+v2HmElSeee9W7utKd8CYhjn7yrmmbkGVnNLkBv4Me5ORdFVGOzZ6I0g0=
Content-ID: <9926BB263276374CBA283DEA31D47ED8@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2799
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(376002)(346002)(2980300002)(199004)(189003)(476003)(446003)(11346002)(70206006)(66066001)(61793004)(70586007)(478600001)(54906003)(14454004)(47776003)(26826003)(8676002)(7736002)(76130400001)(8936002)(25786009)(14444005)(6486002)(126002)(6512007)(3846002)(99286004)(6116002)(6246003)(5660300002)(9686003)(50466002)(336012)(86362001)(2906002)(386003)(81156014)(102836004)(6862004)(26005)(6506007)(316002)(23676004)(58126008)(4326008)(76176011)(229853002)(33656002)(2486003)(81166006)(63350400001)(1076003)(186003)(356004)(22756006)(36756003)(486006)(63370400001)(436003)(305945005)(6636002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB4955;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7127d882-d777-445e-46c7-08d70c28ceba
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB8PR08MB4955; 
NoDisclaimer: True
X-Forefront-PRVS: 01039C93E4
X-Microsoft-Antispam-Message-Info: w/kG0C0b+KPhDkq7UtMv1sLRPqsHGQX1gPkXIpm8d3HCBK/2L+E6UDvEmlgXaoyIqF1BPi4MvJKRtvsYdM/cmMpYtz7yvzj/KbG/PDb0VC0jHgnQInt4DL7YqzXUeYNHgjmHca5FBx35sQH2ZH/Z7C61X2pcCMutR6gPa39qctVc+gkJ+Axdfni2qAQ3IXOD/gvDveBvGk7AsWNn/wMpEer2uVxcNUsA3jT6HTrrTUcwoCI5e3uX2fAVOjFPEL5Ax3iPxvORRtdK7P3iCgWJUmC4kryR1mgBmhzkkaPyvjdfqyABNxTWQX6vK1GoOm/js5Ej7KQEIq8kwu5IzO9wckjMLsDmpP5I+EBdJfvjUPh7iEK/ej8GzLO0gsM4qbB9w7g6IenoGVh4sib16TJnD0W2jYx929q7msGAUXLt7aU=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2019 09:09:43.3505 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 735920cc-54f4-4a97-ff1a-08d70c28d690
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4955
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwJLvZaih+kxKr1qdqlQee+TjeWFZw/pEJefL3n6rdg=;
 b=wdzuFcRZs8JJTgx8aBYuJNvZTLWXplG9LxO1/01XXkidOwDAGI2d4EaE1D8LIo/b7wSyOiQrwC1U359S+6wBdP5jTwUA7y9tJmYLB5eVa4DEnoeBbZMISwkumMX+5Qg0MChqS8lHen/5NfnApRssAyB/AtF8/S6wDGbRQVK7Le8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwJLvZaih+kxKr1qdqlQee+TjeWFZw/pEJefL3n6rdg=;
 b=wdzuFcRZs8JJTgx8aBYuJNvZTLWXplG9LxO1/01XXkidOwDAGI2d4EaE1D8LIo/b7wSyOiQrwC1U359S+6wBdP5jTwUA7y9tJmYLB5eVa4DEnoeBbZMISwkumMX+5Qg0MChqS8lHen/5NfnApRssAyB/AtF8/S6wDGbRQVK7Le8=
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
Cc: nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGl2aXUsDQoNCk9uIFRodSwgSnVsIDE4LCAyMDE5IGF0IDAxOjE3OjM3UE0gKzAwMDAsIExp
dml1IER1ZGF1IHdyb3RlOg0KPiBPbiBUaHUsIEp1biAyNywgMjAxOSBhdCAwNDoxMDozNkFNICsw
MTAwLCBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOg0KPiA+IEFkZHMgdG8g
cHJpbnQgdGhlIGV2ZW50IG1lc3NhZ2Ugd2hlbiBlcnJvciBoYXBwZW5zIGFuZCB0aGUgc2FtZSBl
dmVudA0KPiA+IHdpbGwgbm90IGJlIHByaW50ZWQgdW50aWwgbmV4dCB2c3luYy4NCj4gPiANCj4g
PiBTaWduZWQtb2ZmLWJ5OiBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxsb3dyeS5s
aUBhcm0uY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL01ha2VmaWxlICAgICAgIHwgICAxICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfZGV2LmggICB8ICAxMyArKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9ldmVudC5jIHwgMTQ0ICsrKysrKysrKysrKysrKysr
KysrKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21z
LmMgICB8ICAgMiArDQo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMTYwIGluc2VydGlvbnMoKykNCj4g
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2V2ZW50LmMNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEvTWFrZWZpbGUNCj4gPiBpbmRleCAzOGFhNTg0Li4zZjUzZDJkIDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvTWFrZWZpbGUNCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL01ha2VmaWxlDQo+ID4gQEAgLTcs
NiArNyw3IEBAIGNjZmxhZ3MteSA6PSBcDQo+ID4gIGtvbWVkYS15IDo9IFwNCj4gPiAgCWtvbWVk
YV9kcnYubyBcDQo+ID4gIAlrb21lZGFfZGV2Lm8gXA0KPiA+ICsJa29tZWRhX2V2ZW50Lm8gXA0K
PiA+ICAJa29tZWRhX2Zvcm1hdF9jYXBzLm8gXA0KPiA+ICAJa29tZWRhX2NvZWZmcy5vIFwNCj4g
PiAgCWtvbWVkYV9jb2xvcl9tZ210Lm8gXA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oDQo+ID4gaW5kZXggMDk2ZjlmNy4uZTg2M2VjMyAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9kZXYuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2Rldi5oDQo+ID4gQEAgLTQwLDYgKzQwLDE3IEBADQo+ID4gICNkZWZpbmUgS09NRURBX0VS
Ul9UVE5HCQkJQklUX1VMTCgzMCkNCj4gPiAgI2RlZmluZSBLT01FREFfRVJSX1RURgkJCUJJVF9V
TEwoMzEpDQo+ID4gIA0KPiA+ICsjZGVmaW5lIEtPTUVEQV9FUlJfRVZFTlRTCVwNCj4gPiArCShL
T01FREFfRVZFTlRfVVJVTgl8IEtPTUVEQV9FVkVOVF9JQlNZCXwgS09NRURBX0VWRU5UX09WUiB8
XA0KPiA+ICsJS09NRURBX0VSUl9URVRPCQl8IEtPTUVEQV9FUlJfVEVNUgl8IEtPTUVEQV9FUlJf
VElUUiB8XA0KPiA+ICsJS09NRURBX0VSUl9DUEUJCXwgS09NRURBX0VSUl9DRkdFCXwgS09NRURB
X0VSUl9BWElFIHxcDQo+ID4gKwlLT01FREFfRVJSX0FDRTAJCXwgS09NRURBX0VSUl9BQ0UxCXwg
S09NRURBX0VSUl9BQ0UyIHxcDQo+ID4gKwlLT01FREFfRVJSX0FDRTMJCXwgS09NRURBX0VSUl9E
UklGVFRPCXwgS09NRURBX0VSUl9GUkFNRVRPIHxcDQo+ID4gKwlLT01FREFfRVJSX1pNRQkJfCBL
T01FREFfRVJSX01FUlIJfCBLT01FREFfRVJSX1RDRiB8XA0KPiA+ICsJS09NRURBX0VSUl9UVE5H
CQl8IEtPTUVEQV9FUlJfVFRGKQ0KPiA+ICsNCj4gPiArI2RlZmluZSBLT01FREFfV0FSTl9FVkVO
VFMJS09NRURBX0VSUl9DU0NFDQo+ID4gKw0KPiA+ICAvKiBtYWxpZHAgZGV2aWNlIGlkICovDQo+
ID4gIGVudW0gew0KPiA+ICAJTUFMSV9ENzEgPSAwLA0KPiA+IEBAIC0yMDcsNiArMjE4LDggQEAg
c3RydWN0IGtvbWVkYV9kZXYgew0KPiA+ICANCj4gPiAgc3RydWN0IGtvbWVkYV9kZXYgKmRldl90
b19tZGV2KHN0cnVjdCBkZXZpY2UgKmRldik7DQo+ID4gIA0KPiA+ICt2b2lkIGtvbWVkYV9wcmlu
dF9ldmVudHMoc3RydWN0IGtvbWVkYV9ldmVudHMgKmV2dHMpOw0KPiA+ICsNCj4gPiAgaW50IGtv
bWVkYV9kZXZfcmVzdW1lKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KTsNCj4gPiAgaW50IGtvbWVk
YV9kZXZfc3VzcGVuZChzdHJ1Y3Qga29tZWRhX2RldiAqbWRldik7DQo+ID4gICNlbmRpZiAvKl9L
T01FREFfREVWX0hfKi8NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfZXZlbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2V2ZW50LmMNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4
IDAwMDAwMDAuLjMwOWRiZTINCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZXZlbnQuYw0KPiA+IEBAIC0wLDAgKzEs
MTQ0IEBADQo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4gKy8q
DQo+ID4gKyAqIChDKSBDT1BZUklHSFQgMjAxOSBBUk0gTGltaXRlZC4gQWxsIHJpZ2h0cyByZXNl
cnZlZC4NCj4gPiArICogQXV0aG9yOiBKYW1lcy5RaWFuLldhbmcgPGphbWVzLnFpYW4ud2FuZ0Bh
cm0uY29tPg0KPiA+ICsgKg0KPiA+ICsgKi8NCj4gPiArI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQu
aD4NCj4gPiArDQo+ID4gKyNpbmNsdWRlICJrb21lZGFfZGV2LmgiDQo+ID4gKw0KPiA+ICtzdHJ1
Y3Qga29tZWRhX3N0ciB7DQo+ID4gKwljaGFyICpzdHI7DQo+ID4gKwl1MzIgc3o7DQo+ID4gKwl1
MzIgbGVuOw0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArLyogcmV0dXJuIDAgb24gc3VjY2VzcywgIDwg
MCBvbiBubyBzcGFjZS4NCj4gPiArICovDQo+ID4gK3N0YXRpYyBpbnQga29tZWRhX3NwcmludGYo
c3RydWN0IGtvbWVkYV9zdHIgKnN0ciwgY29uc3QgY2hhciAqZm10LCAuLi4pDQo+ID4gK3sNCj4g
PiArCXZhX2xpc3QgYXJnczsNCj4gPiArCWludCBudW0sIGZyZWVfc3o7DQo+ID4gKwlpbnQgZXJy
Ow0KPiA+ICsNCj4gPiArCWZyZWVfc3ogPSBzdHItPnN6IC0gc3RyLT5sZW47DQo+ID4gKwlpZiAo
ZnJlZV9zeiA8PSAwKQ0KPiA+ICsJCXJldHVybiAtRU5PU1BDOw0KPiA+ICsNCj4gPiArCXZhX3N0
YXJ0KGFyZ3MsIGZtdCk7DQo+ID4gKw0KPiA+ICsJbnVtID0gdnNucHJpbnRmKHN0ci0+c3RyICsg
c3RyLT5sZW4sIGZyZWVfc3osIGZtdCwgYXJncyk7DQo+ID4gKw0KPiA+ICsJdmFfZW5kKGFyZ3Mp
Ow0KPiA+ICsNCj4gPiArCWlmIChudW0gPD0gZnJlZV9zeikgew0KPiA+ICsJCXN0ci0+bGVuICs9
IG51bTsNCj4gPiArCQllcnIgPSAwOw0KPiA+ICsJfSBlbHNlIHsNCj4gPiArCQlzdHItPmxlbiA9
IHN0ci0+c3o7DQo+ID4gKwkJZXJyID0gLUVOT1NQQzsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwly
ZXR1cm4gZXJyOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9pZCBldnRfc3ByaW50Zihz
dHJ1Y3Qga29tZWRhX3N0ciAqc3RyLCB1NjQgZXZ0LCBjb25zdCBjaGFyICptc2cpDQo+ID4gK3sN
Cj4gPiArCWlmIChldnQpDQo+ID4gKwkJa29tZWRhX3NwcmludGYoc3RyLCBtc2cpOw0KPiA+ICt9
DQo+IA0KPiBXaHkgZG8gd2UgbmVlZCB0aGlzIHdyYXBwZXI/DQpUaGUga29tZWRhX3NwcmludGYg
aXMgYSBnZW5lcmljIGZ1bmN0aW9uIGFuZCB3aWxsIGJlIHVzZWQgYnkgb3RoZXINCnBsYWNlcywg
d2hpbGUgZXZ0X3NwcmludGYgaXMgd29ya2luZyBmb3IgdGhlIGRldGFpbCBldmVudCBtc2cuDQoN
Cj4gPiArDQo+ID4gK3N0YXRpYyB2b2lkIGV2dF9zdHIoc3RydWN0IGtvbWVkYV9zdHIgKnN0ciwg
dTY0IGV2ZW50cykNCj4gPiArew0KPiA+ICsJaWYgKGV2ZW50cyA9PSAwVUxMKSB7DQo+ID4gKwkJ
ZXZ0X3NwcmludGYoc3RyLCAxLCAiTm9uZSIpOw0KPiA+ICsJCXJldHVybjsNCj4gPiArCX0NCj4g
PiArDQo+ID4gKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FVkVOVF9WU1lOQywg
IlZTWU5DfCIpOw0KPiA+ICsJZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBLT01FREFfRVZFTlRf
RkxJUCwgIkZMSVB8Iik7DQo+ID4gKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9F
VkVOVF9FT1csICJFT1d8Iik7DQo+ID4gKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVE
QV9FVkVOVF9NT0RFLCAiT1AtTU9ERXwiKTsNCj4gPiArDQo+ID4gKwlldnRfc3ByaW50ZihzdHIs
IGV2ZW50cyAmIEtPTUVEQV9FVkVOVF9VUlVOLCAiVU5ERVJSVU58Iik7DQo+ID4gKwlldnRfc3By
aW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FVkVOVF9PVlIsICJPVkVSUlVOfCIpOw0KPiA+ICsN
Cj4gPiArCS8qIEdMQiBlcnJvciAqLw0KPiA+ICsJZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBL
T01FREFfRVJSX01FUlIsICJNRVJSfCIpOw0KPiA+ICsJZXZ0X3NwcmludGYoc3RyLCBldmVudHMg
JiBLT01FREFfRVJSX0ZSQU1FVE8sICJGUkFNRVRPfCIpOw0KPiA+ICsNCj4gPiArCS8qIERPVSBl
cnJvciAqLw0KPiA+ICsJZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBLT01FREFfRVJSX0RSSUZU
VE8sICJEUklGVFRPfCIpOw0KPiA+ICsJZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBLT01FREFf
RVJSX0ZSQU1FVE8sICJGUkFNRVRPfCIpOw0KPiA+ICsJZXZ0X3NwcmludGYoc3RyLCBldmVudHMg
JiBLT01FREFfRVJSX1RFVE8sICJURVRPfCIpOw0KPiA+ICsJZXZ0X3NwcmludGYoc3RyLCBldmVu
dHMgJiBLT01FREFfRVJSX0NTQ0UsICJDU0NFfCIpOw0KPiA+ICsNCj4gPiArCS8qIExQVSBlcnJv
cnMgb3IgZXZlbnRzICovDQo+ID4gKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9F
VkVOVF9JQlNZLCAiSUJTWXwiKTsNCj4gPiArCWV2dF9zcHJpbnRmKHN0ciwgZXZlbnRzICYgS09N
RURBX0VSUl9BWElFLCAiQVhJRXwiKTsNCj4gPiArCWV2dF9zcHJpbnRmKHN0ciwgZXZlbnRzICYg
S09NRURBX0VSUl9BQ0UwLCAiQUNFMHwiKTsNCj4gPiArCWV2dF9zcHJpbnRmKHN0ciwgZXZlbnRz
ICYgS09NRURBX0VSUl9BQ0UxLCAiQUNFMXwiKTsNCj4gPiArCWV2dF9zcHJpbnRmKHN0ciwgZXZl
bnRzICYgS09NRURBX0VSUl9BQ0UyLCAiQUNFMnwiKTsNCj4gPiArCWV2dF9zcHJpbnRmKHN0ciwg
ZXZlbnRzICYgS09NRURBX0VSUl9BQ0UzLCAiQUNFM3wiKTsNCj4gPiArDQo+ID4gKwkvKiBMUFUg
VEJVIGVycm9ycyovDQo+ID4gKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJf
VENGLCAiVENGfCIpOw0KPiA+ICsJZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBLT01FREFfRVJS
X1RUTkcsICJUVE5HfCIpOw0KPiA+ICsJZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBLT01FREFf
RVJSX1RJVFIsICJUSVRSfCIpOw0KPiA+ICsJZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBLT01F
REFfRVJSX1RFTVIsICJURU1SfCIpOw0KPiA+ICsJZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBL
T01FREFfRVJSX1RURiwgIlRURnwiKTsNCj4gPiArDQo+ID4gKwkvKiBDVSBlcnJvcnMqLw0KPiA+
ICsJZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBLT01FREFfRVJSX0NQRSwgIkNPUFJPQ3wiKTsN
Cj4gPiArCWV2dF9zcHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VSUl9aTUUsICJaTUV8Iik7
DQo+ID4gKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfQ0ZHRSwgIkNGR0V8
Iik7DQo+ID4gKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfVEVNUiwgIlRF
TVJ8Iik7DQo+ID4gKw0KPiA+ICsJaWYgKHN0ci0+bGVuID4gMCAmJiAoc3RyLT5zdHJbc3RyLT5s
ZW4gLSAxXSA9PSAnfCcpKSB7DQo+ID4gKwkJc3RyLT5zdHJbc3RyLT5sZW4gLSAxXSA9IDA7DQo+
ID4gKwkJc3RyLT5sZW4tLTsNCj4gPiArCX0NCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGJv
b2wgaXNfbmV3X2ZyYW1lKHN0cnVjdCBrb21lZGFfZXZlbnRzICphKQ0KPiA+ICt7DQo+ID4gKwly
ZXR1cm4gKGEtPnBpcGVzWzBdIHwgYS0+cGlwZXNbMV0pICYgS09NRURBX0VWRU5UX0ZMSVA7DQo+
ID4gK30NCj4gPiArDQo+ID4gK3ZvaWQga29tZWRhX3ByaW50X2V2ZW50cyhzdHJ1Y3Qga29tZWRh
X2V2ZW50cyAqZXZ0cykNCj4gPiArew0KPiA+ICsJdTY0IHByaW50X2V2dHMgPSBLT01FREFfRVJS
X0VWRU5UUzsNCj4gPiArCXN0YXRpYyBib29sIGVuX3ByaW50ID0gdHJ1ZTsNCj4gPiArDQo+ID4g
KwkvKiByZWR1Y2UgdGhlIHNhbWUgbXNnIHByaW50LCBvbmx5IHByaW50IHRoZSBmaXJzdCBldnQg
Zm9yIG9uZSBmcmFtZSAqLw0KPiA+ICsJaWYgKGV2dHMtPmdsb2JhbCB8fCBpc19uZXdfZnJhbWUo
ZXZ0cykpDQo+ID4gKwkJZW5fcHJpbnQgPSB0cnVlOw0KPiA+ICsJaWYgKCFlbl9wcmludCkNCj4g
PiArCQlyZXR1cm47DQo+IA0KPiBXaGVuIGRvZXMgZW5fcHJpbnQgZXZlciBnZXQgZmFsc2U/DQpP
bmNlIHRoZSBldmVudHMgcHJpbnRlZCwgaXQgd2lsbCBiZSBzZXQgZmFsc2UgKHBscyBmaW5kIGF0
IHRoZSBsYXN0DQpsaW5lIG9mIHRoaXMgZnVuY3Rpb24pLg0KPiA+ICsNCj4gPiArI2lmZGVmIERF
QlVHDQo+ID4gKwlwcmludF9ldnRzIHw9IEtPTUVEQV9XQVJOX0VWRU5UUzsNCj4gPiArI2VuZGlm
DQo+ID4gKw0KPiA+ICsJaWYgKChldnRzLT5nbG9iYWwgfCBldnRzLT5waXBlc1swXSB8IGV2dHMt
PnBpcGVzWzFdKSAmIHByaW50X2V2dHMpIHsNCj4gPiArCQkjZGVmaW5lIFNUUl9TWgkJMTI4DQo+
ID4gKwkJY2hhciBtc2dbU1RSX1NaXTsNCj4gDQo+IEkndmUgY291bnRlZCBhYm91dCAyNyBldnRf
c3ByaW50ZigpIGNhbGxzIGluIGV2dF9zdHIoKSBmdW5jdGlvbiwgd2l0aCBhbg0KPiBhdmVyYWdl
IG9mIDUgY2hhcmFjdGVycyBlYWNoLCBzbyB0aGF0cyAxMzUgY2hhcmFjdGVycyBwcmludGVkIGlu
dG8gYSBidWZmZXINCj4gdGhhdCBpcyBvbmx5IDEyOCBieXRlcy4gUGxlYXNlIGRvbid0IGRvIHRo
aXMhDQprb21lZGFfc3ByaW50ZigpIHdpbGwgY2hlY2sgdGhlIHNpemUgYW5kIGFsc28gSSB0aG91
Z2h0IHRob3NlIGV2dA0Kd2lsbCBub3QgcG9wdWxhdCB0b2dldGhlci4gQnV0IHllcywgSSdkIGJl
dHRlciBjaGFuZ2UgdGhpcyB0byAyNTYuDQpXaWxsIGNoYW5nZSB0aGlzLg0KDQo+ID4gKwkJc3Ry
dWN0IGtvbWVkYV9zdHIgc3RyOw0KPiA+ICsNCj4gPiArCQlzdHIuc3RyID0gbXNnOw0KPiA+ICsJ
CXN0ci5zeiAgPSBTVFJfU1o7DQo+ID4gKwkJc3RyLmxlbiA9IDA7DQo+ID4gKw0KPiA+ICsJCWtv
bWVkYV9zcHJpbnRmKCZzdHIsICJnY3U6ICIpOw0KPiA+ICsJCWV2dF9zdHIoJnN0ciwgZXZ0cy0+
Z2xvYmFsKTsNCj4gPiArCQlrb21lZGFfc3ByaW50Zigmc3RyLCAiLCBwaXBlc1swXTogIik7DQo+
ID4gKwkJZXZ0X3N0cigmc3RyLCBldnRzLT5waXBlc1swXSk7DQo+ID4gKwkJa29tZWRhX3Nwcmlu
dGYoJnN0ciwgIiwgcGlwZXNbMV06ICIpOw0KPiA+ICsJCWV2dF9zdHIoJnN0ciwgZXZ0cy0+cGlw
ZXNbMV0pOw0KPiA+ICsNCj4gPiArCQlEUk1fRVJST1IoImVyciBkZXRlY3Q6ICVzXG4iLCBtc2cp
Ow0KPiA+ICsNCj4gPiArCQllbl9wcmludCA9IGZhbHNlOw0KPiA+ICsJfQ0KPiA+ICt9DQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2tt
cy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMNCj4g
PiBpbmRleCA2NDdiY2U1Li4xNDYyYmFjIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMNCj4gPiBAQCAtNDcsNiArNDcsOCBA
QCBzdGF0aWMgaXJxcmV0dXJuX3Qga29tZWRhX2ttc19pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lk
ICpkYXRhKQ0KPiA+ICAJbWVtc2V0KCZldnRzLCAwLCBzaXplb2YoZXZ0cykpOw0KPiA+ICAJc3Rh
dHVzID0gbWRldi0+ZnVuY3MtPmlycV9oYW5kbGVyKG1kZXYsICZldnRzKTsNCj4gPiAgDQo+ID4g
Kwlrb21lZGFfcHJpbnRfZXZlbnRzKCZldnRzKTsNCj4gDQo+IENhbGxpbmcgdGhpcyBmdW5jdGlv
biBmcm9tIHRoZSBJUlEgaGFuZGxlciBpcyBhIGJhZCBpZGVhLiBXZSBzaG91bGQgdXNlIGRlYnVn
ZnMNCj4gaWYgeW91IHJlYWxseSB3YW50IHRvIGhhdmUgYSB0cmFjZSBvZiB0aGUgZXZlbnRzLCBi
dXQgSSBwZXJzb25hbGx5IGRvbid0IHNlZQ0KPiB2YWx1ZSBpbiBoYXZpbmcgdGhpcyBmdW5jdGlv
bmFsaXR5IGluIHRoZSBrZXJuZWwgYXQgYWxsLiBZb3UgY2FuIGV4cG9zZSB0aGUNCj4gdmFsdWUg
b2YgdGhlIGV2dHMtPmdsb2JhbCBhbmQgZXZ0cy0+cGlwZXNbXSBhcyBpbnRlZ2VycyBhbmQgZGVj
b2RlIHRoYXQgaW4NCj4gdXNlcnNwYWNlIG9yIGFzIGEgZGVidWdmcyBlbnRyeS4NCj4gDQo+IEJl
c3QgcmVnYXJkcywNCj4gTGl2aXUNCg0KVGhlIG5hbWUgb2YgdGhpcyBmdW5jdGlvbiBpcyBtaXNs
ZWFkaW5nLCBidXQgdGhpcyBpcyBwcmludGluZyBvdXQgdGhlDQpoYXJkd2FyZSBkZXRlY3RlZCBl
cnJvcnMsIGZyb20gd2hpY2ggd2UgY2FuIGtub3cgZGlyZWN0bHkgb25jZSB0aGUNCmVycm9ycyBo
YXBwZW5lZCBvbiB0aGUgaGFyZHdhcmUuIExpa2UgaWYgdGhlIGRyaXZlciBjb2RlIHdhcyBhdA0K
YnJpbmctdXAgc3RhZ2UsIHRoZSBsb2dzIGZyb20gdGhpcyBsYXllciBpcyBoZWxwZnVsLiBTbyBj
YW4gd2Uga2VlcA0KdGhpcz8NCg0KQmVzdCByZWdhcmRzLA0KTG93cnkNCg0KPiA+ICsNCj4gPiAg
CS8qIE5vdGlmeSB0aGUgY3J0YyB0byBoYW5kbGUgdGhlIGV2ZW50cyAqLw0KPiA+ICAJZm9yIChp
ID0gMDsgaSA8IGttcy0+bl9jcnRjczsgaSsrKQ0KPiA+ICAJCWtvbWVkYV9jcnRjX2hhbmRsZV9l
dmVudCgma21zLT5jcnRjc1tpXSwgJmV2dHMpOw0KPiA+IC0tIA0KPiA+IDEuOS4xDQo+ID4gDQo+
IA0KPiAtLSANCj4gPT09PT09PT09PT09PT09PT09PT0NCj4gfCBJIHdvdWxkIGxpa2UgdG8gfA0K
PiB8IGZpeCB0aGUgd29ybGQsICB8DQo+IHwgYnV0IHRoZXkncmUgbm90IHwNCj4gfCBnaXZpbmcg
bWUgdGhlICAgfA0KPiAgXCBzb3VyY2UgY29kZSEgIC8NCj4gICAtLS0tLS0tLS0tLS0tLS0NCj4g
ICAgIMKvXF8o44OEKV8vwq8NCg0KLS0gDQpSZWdhcmRzLA0KTG93cnkNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
