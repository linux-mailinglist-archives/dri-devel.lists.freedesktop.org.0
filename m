Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C8EFD1C6
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 01:01:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D9B6F382;
	Fri, 15 Nov 2019 00:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130073.outbound.protection.outlook.com [40.107.13.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB386F382
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 00:01:10 +0000 (UTC)
Received: from VI1PR08CA0180.eurprd08.prod.outlook.com (2603:10a6:800:d1::34)
 by AM0PR08MB3971.eurprd08.prod.outlook.com (2603:10a6:208:132::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.26; Fri, 15 Nov
 2019 00:01:08 +0000
Received: from AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::202) by VI1PR08CA0180.outlook.office365.com
 (2603:10a6:800:d1::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Fri, 15 Nov 2019 00:01:08 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT059.mail.protection.outlook.com (10.152.17.193) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23 via Frontend Transport; Fri, 15 Nov 2019 00:01:07 +0000
Received: ("Tessian outbound 6481c7fa5a3c:v33");
 Fri, 15 Nov 2019 00:01:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4f9ff1f8aeed800c
X-CR-MTA-TID: 64aa7808
Received: from c360b9969126.2 (cr-mta-lb-1.cr-mta-net [104.47.9.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3C77F4EB-0F3A-4702-9BE0-0891BABC113E.1; 
 Fri, 15 Nov 2019 00:01:01 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c360b9969126.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Nov 2019 00:01:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZEJ//z6pLOiP4o2rPLAHqr73IDCj/CR2EMSlF0WawvO5Em7QLVtQgstWxnYiCpMKWMQHhS3jQSXfPGGP7Jmgytw3mz4zWQIeIyY3XwuubmfNfsrLpM3a7PjLIntJSfmx8b2NuQzI097XQ31ksCQkmkhobVC3wkI3ESPDc5MGjfa6hmRz/P6R82f64UZqcYOQ51MQL0i74+xbFN/rLfcGoI3xRODTLfVxRZ9a0782EzTWonO0GlM8ZFqFE856McLs4DaXI08uZxmIUwQ2fBy1GIPT/9Bza9m4Af3rbLQcltkFnikVvfmfoTZvU91l1jsMLKp+PuvOKuT9Vwc+Z70WbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzGC0DqsM/3LF52XQ0H3D1A0+kd7gBAbikqvwdXvVZg=;
 b=CtAuLcsXvMzP8IB+1XWqpsgVX4pyJNxZu2dt9nptnOIEphVhpf2nrCedafvNVn7++KgxChf3yCJQ9opXsAFJjTrMoZQqN7ok6jnrMX555sgVyyNnjH5L1doQ97NKTrBU9d1I/7wwa5P9RNy5wR671iiL+Jhyh3ByvwhBAXzPn4qakAP1xzF0Fqr2G9E4+W2F6y4OV7a127Fer5s6erzxhuIuJmR3QcXAB/ee52C6Fqq751JL9x55ihgZ1L7lgft10t2rspXkHSQ8UAjlfB7Ups/lODNe2PMZvLbtmWajjbN4pJemDKavppozQjarF/2xSFOXoyu123kxhqdj9C3mIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4383.eurprd08.prod.outlook.com (20.179.28.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Fri, 15 Nov 2019 00:01:00 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2451.027; Fri, 15 Nov 2019
 00:01:00 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: =?utf-8?B?UmU6IFtQQVRDSF0gZHJtL2tvbWVkYTogQ2xlYW4gd2FybmluZ3M6IGNhbmRp?=
 =?utf-8?B?ZGF0ZSBmb3IgJ2dudV9wcmludGbigJkgZm9ybWF0IGF0dHJpYnV0ZQ==?=
Thread-Topic: =?utf-8?B?W1BBVENIXSBkcm0va29tZWRhOiBDbGVhbiB3YXJuaW5nczogY2FuZGlkYXRl?=
 =?utf-8?B?IGZvciAnZ251X3ByaW50ZuKAmSBmb3JtYXQgYXR0cmlidXRl?=
Thread-Index: AQHVmtLsTLvLo3Z9SUGqMMXb28Jv4aeLWd+A
Date: Fri, 15 Nov 2019 00:01:00 +0000
Message-ID: <3596931.2M0sqJgrhf@e123338-lin>
References: <20191114100421.30510-1-james.qian.wang@arm.com>
In-Reply-To: <20191114100421.30510-1-james.qian.wang@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P123CA0045.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::33)
 To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6c658049-e1e7-4ff5-5669-08d7695eea97
X-MS-TrafficTypeDiagnostic: VI1PR08MB4383:|VI1PR08MB4383:|AM0PR08MB3971:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB397173E35699E07D7C9201868F700@AM0PR08MB3971.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3276;OLM:3276;
x-forefront-prvs: 02229A4115
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(189003)(199004)(5660300002)(76176011)(66476007)(3846002)(6116002)(2906002)(81166006)(81156014)(9686003)(6512007)(14454004)(54906003)(6436002)(71200400001)(71190400001)(316002)(64756008)(99286004)(8936002)(66446008)(229853002)(66946007)(6486002)(486006)(26005)(476003)(25786009)(6636002)(102836004)(52116002)(66556008)(478600001)(66066001)(6246003)(386003)(256004)(7736002)(305945005)(6506007)(4326008)(446003)(11346002)(186003)(6862004)(86362001)(33716001)(14444005)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4383;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: uKJfjLOPIk1ZbZzDVcRcNj0FG62DBRGNXIV7WQd1D0OwNCDHcYMtfOTcy2/6WR6fUkA5Q/fXIgJMVaHR+cpJADXs0F5ajl7znf40xUGIRcaoVQ8pBAFz5EVJ/Ro1HciFBEBiKW3l88x8ydaX2dl2j1+i5MstjRv+DXzqE1is1H8JCve0YYYBkrMa2XeqtzF7kjFAmox5N5IIBdvFQQCKW0uiFu7/F2HsOMjAIFNxuwaoOVRoSzziw0ljauOkC6qMWDsngjeQZkG5i8PlGgXeYircOYkjsZjQynvwQm48uK9ZexIGoCkVVO9rkze2ZLwHtT8+qdhmNVkNRhFDjI4yZ5MICC1GjuUYntxwbBkCU3CwJ5a6sesF1R81mC02GLtB3AXSTboVKSTcf+wEmPPG8xgeA683MLf8Y4Vavyk4lCyt6IHk0X9CZMBx6LVRCJGv
Content-ID: <AEF0B555DCB0BA4C813E0AF9D863D3B8@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4383
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(346002)(376002)(396003)(136003)(39860400002)(1110001)(339900001)(199004)(189003)(47776003)(66066001)(22756006)(356004)(305945005)(105606002)(99286004)(6862004)(436003)(4326008)(7736002)(486006)(81156014)(81166006)(6246003)(25786009)(86362001)(126002)(476003)(446003)(11346002)(8936002)(23676004)(2486003)(229853002)(76176011)(26826003)(102836004)(26005)(336012)(6506007)(478600001)(14454004)(386003)(6486002)(50466002)(9686003)(36906005)(6512007)(2906002)(76130400001)(316002)(5660300002)(54906003)(14444005)(6116002)(3846002)(6636002)(33716001)(70586007)(70206006)(186003)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3971;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a3fd4af1-da83-4101-f533-08d7695ee5f8
NoDisclaimer: True
X-Forefront-PRVS: 02229A4115
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TUdIJz0L4rQTzS4I490D6O0SBwNeJDLRWfVcLvEjpMEb345QzUd4HJKpQIerjAoo+x3YgIVqLZncZ1q7FC3tqSnmEM0cA3V8XVVxtyYN21zuaiQHMusSDPALr6J6fpfRgbxQGrFE7WyiIwqSwGvNJI2Qh+/uvYZcEbCZqnDdMu7JkDZ6uHMFpY1ps9fhMbOwxHLatwuHl3uWvaGG9LH15DpLOVE+Af4ZkShkgykH9LM6+R5lLbsdcVm2s/S75OoLpIPWfMFg6B+ivLsIF+CK9gzvpzUeh8E4gPVckfctrzEpse3bItzVDfrs8stL+RasIQHo6HkrCBrIIrNMeuev5kq7CG3yTYOAAsVhNBikvMBtmuk3Whknf/oj4cI7bPotrS3nKTG3hF6PQIt8yKVEiAmsszI8w52Xkx/szJilAM57h1+bk6LXe8JCXhEOntz7
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2019 00:01:07.9242 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c658049-e1e7-4ff5-5669-08d7695eea97
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3971
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzGC0DqsM/3LF52XQ0H3D1A0+kd7gBAbikqvwdXvVZg=;
 b=bJH8RdujgxZXSvi+dR1a7z4Gd2cFGKaj7xyTJpRbnYiHriW7axlNRVnhoBlDUPYi0cK2nHqLkKQ40zsoPS1NV8trVePnRcvmlEeit4z61CIsAPyknDynFBv6vGWz5HisX204OYW/kK+p73lK9vq+Rn5+EVUm28ePMqLxt4H6/nM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzGC0DqsM/3LF52XQ0H3D1A0+kd7gBAbikqvwdXvVZg=;
 b=bJH8RdujgxZXSvi+dR1a7z4Gd2cFGKaj7xyTJpRbnYiHriW7axlNRVnhoBlDUPYi0cK2nHqLkKQ40zsoPS1NV8trVePnRcvmlEeit4z61CIsAPyknDynFBv6vGWz5HisX204OYW/kK+p73lK9vq+Rn5+EVUm28ePMqLxt4H6/nM=
X-Mailman-Original-Authentication-Results: spf=fail (sender IP is 63.35.35.123)
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
Cc: "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>, nd <nd@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1cnNkYXksIDE0IE5vdmVtYmVyIDIwMTkgMTA6MDQ6MzcgR01UIGphbWVzIHFpYW4gd2Fu
ZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOg0KPiBrb21lZGEva29tZWRhX2V2ZW50LmM6
IEluIGZ1bmN0aW9uIOKAmGtvbWVkYV9zcHJpbnRm4oCZOg0KPiBrb21lZGEva29tZWRhX2V2ZW50
LmM6MzE6Mjogd2FybmluZzogZnVuY3Rpb24g4oCYa29tZWRhX3NwcmludGbigJkgbWlnaHQgYmUg
YSBjYW5kaWRhdGUgZm9yIOKAmGdudV9wcmludGbigJkgZm9ybWF0IGF0dHJpYnV0ZSBbLVdzdWdn
ZXN0LWF0dHJpYnV0ZT1mb3JtYXRdDQo+ICAgbnVtID0gdnNucHJpbnRmKHN0ci0+c3RyICsgc3Ry
LT5sZW4sIGZyZWVfc3osIGZtdCwgYXJncyk7DQo+IA0KPiB2MjogVXBkYXRlIHRoZSBjb21tZW50
IG1zZy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IGphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xv
Z3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9ldmVudC5jIHwgMSArDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9ldmVudC5jIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZXZlbnQuYw0KPiBpbmRleCBiZjI2OTY4M2Y4MTEuLjk3
N2MzOGQ1MTZkYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfZXZlbnQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9ldmVudC5jDQo+IEBAIC0xNyw2ICsxNyw3IEBAIHN0cnVjdCBrb21lZGFf
c3RyIHsNCj4gIA0KPiAgLyogcmV0dXJuIDAgb24gc3VjY2VzcywgIDwgMCBvbiBubyBzcGFjZS4N
Cj4gICAqLw0KPiArX19wcmludGYoMiwgMykNCj4gIHN0YXRpYyBpbnQga29tZWRhX3NwcmludGYo
c3RydWN0IGtvbWVkYV9zdHIgKnN0ciwgY29uc3QgY2hhciAqZm10LCAuLi4pDQo+ICB7DQo+ICAJ
dmFfbGlzdCBhcmdzOw0KPiAtLSANCj4gMi4yMC4xDQo+IA0KPiANCg0KUmV2aWV3ZWQtYnk6IE1p
aGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4NCg0KLS0gDQpNaWhhaWwN
Cg0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
