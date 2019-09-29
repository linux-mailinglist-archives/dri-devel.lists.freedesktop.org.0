Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61949C1392
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2019 08:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D9F6E2C8;
	Sun, 29 Sep 2019 06:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150040.outbound.protection.outlook.com [40.107.15.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21DC6E2C8
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2019 06:19:18 +0000 (UTC)
Received: from VI1PR0802CA0035.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::21) by AM6PR08MB4279.eurprd08.prod.outlook.com
 (2603:10a6:20b:bb::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.21; Sun, 29 Sep
 2019 06:19:15 +0000
Received: from VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::209) by VI1PR0802CA0035.outlook.office365.com
 (2603:10a6:800:a9::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.16 via Frontend
 Transport; Sun, 29 Sep 2019 06:19:14 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT052.mail.protection.outlook.com (10.152.19.173) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Sun, 29 Sep 2019 06:19:14 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Sun, 29 Sep 2019 06:19:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 72a203cab4710ca1
X-CR-MTA-TID: 64aa7808
Received: from ed6bda481be6.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.2.54]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 16C1A047-E96A-43B2-8E73-6A983D2D6621.1; 
 Sun, 29 Sep 2019 06:18:57 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ed6bda481be6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Sun, 29 Sep 2019 06:18:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7Q1Es/t3PBsoFS4hTX4j9JMtoLNiyPVc1mwNSUi8Ux0Ks1GIFvknSLnDpSdlNTmqqohjVf8XosLEq36NH1uYdI8Z3imilut2km+4wLY8ccgzRG0Gpggewp+tMsT5BSlP75LzeuZ4PhcYBH2XTnz0TD2ujHY7B0JQzIN5rMuXlUJCa5hyzbF9cEna5yIdVemmvT8UJIM9WKBdKrNmn6dec7TFxiB8/ZyRCF9ojfSXLXKHN8YOUGDgBybeiKx5dX2esB9xRJFkDGsZuiNM08P2cEoPum9+My37Q8VrxYQaaosP+07zxack9UZ0XsDOL3/GgmauqbYyDC1yR+3Shi27Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1i66CD8zMe2VMNNH4WML4pyxCs7cKHEBPw/SKU1qXlE=;
 b=XyCX/VFjk9styitS8xje6up4o1fBLR6tGzZwXjE8P0ARYSa9usQjzkmhNaQhpeKEL4qUp1PiNmumevDNnxAYSd8q+m1S6DNPKykMJz8rHSFd+2RipXPiTwFD8jpO9vG1iNObN+1uCkJ8+FYKTYr1kNXjUYXoV7sUPEzw+wdPcijUq5vpGnwSeLAOTYvhDm5jG/ZCaUSdeZ0F95W0Jf3zelPrTfLMiAeOJDJDr109s2Gs92zG/8LSv99v9vLLoE4DeAWok0lQbdNaSP0C7vOzcxFUOK0Kt4vk32UW+2jwyJGnl7S/LkiHYXCObAX5PZ9X+K7coWUpuf24HaXTHB7f7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5245.eurprd08.prod.outlook.com (20.179.31.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Sun, 29 Sep 2019 06:18:56 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879%5]) with mapi id 15.20.2284.028; Sun, 29 Sep 2019
 06:18:56 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [v2] drm/komeda: Workaround for broken FLIP_COMPLETE timestamps
Thread-Topic: [v2] drm/komeda: Workaround for broken FLIP_COMPLETE timestamps
Thread-Index: AQHVdo3GfdMAC9qVAUSxM4QfhIA3AQ==
Date: Sun, 29 Sep 2019 06:18:56 +0000
Message-ID: <20190929061849.GA29382@jamwan02-TSP300>
References: <20190923101017.35114-1-mihail.atanassov@arm.com>
In-Reply-To: <20190923101017.35114-1-mihail.atanassov@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0P153CA0040.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::28) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 28fd185e-c433-4acb-4674-08d744a4f347
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB5245:|VE1PR08MB5245:|AM6PR08MB4279:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4279A55E76DC208D14B315FBB3830@AM6PR08MB4279.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
x-forefront-prvs: 017589626D
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(376002)(136003)(366004)(396003)(39850400004)(189003)(199004)(54906003)(305945005)(66446008)(66556008)(6486002)(6636002)(58126008)(81156014)(7736002)(81166006)(229853002)(6116002)(3846002)(64756008)(66946007)(6512007)(6436002)(14454004)(66476007)(8936002)(8676002)(486006)(476003)(11346002)(478600001)(2906002)(33716001)(9686003)(316002)(446003)(14444005)(256004)(186003)(6246003)(26005)(25786009)(86362001)(6862004)(76176011)(1076003)(52116002)(99286004)(102836004)(5660300002)(66066001)(71190400001)(6306002)(71200400001)(4326008)(55236004)(6506007)(386003)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5245;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ffU22a7RCFoK0CFZI8vnpPjhul7uEqnMgneAG8zjTZdzTYwFGuwATqWBnmZ2kZRtUX1kqJsDtT5r1XVZfmm9qjyEQv0dGM//VJOUYeI2SVY1gDb95XFFSie3eq0B2kUJwF0JIytMpl3jH19iEuEskYocCX6xOooRzpLKZB43+vcxnhw54uvnNN7NU0Mwijvwv/crSQS8X7JvmABN0cR+PYAWzYYXWuqk6K0/EmVi3UO8FOGSLROV7NbEuEiCobrRsSx/HJPHHsIlBImYMrQK5zGj6Mwj3YA4WwXqaJc+tdfsZoGJy80tMryc7Ze0iKfPVRIdvBaTbWkwp+s33pkISJBO5vQHaa7/jbO2IrpCX574p6npcwnwqazQR2gUtjfRM+3xB51/6laqZ+VZMiFX/g0CYuS92wV2u5Nnd8RBQ36WWqxER1EJPNBxWQuT48jhW21t0ljj5uhj9iLrDZId6A==
Content-ID: <19F74D5288858D4B93C4CCB2292F0DAD@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5245
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39850400004)(376002)(346002)(136003)(396003)(199004)(189003)(4326008)(486006)(97756001)(11346002)(446003)(107886003)(33716001)(86362001)(476003)(478600001)(50466002)(126002)(22756006)(63350400001)(305945005)(54906003)(76130400001)(356004)(186003)(1076003)(26005)(336012)(102836004)(386003)(6506007)(229853002)(6862004)(6246003)(76176011)(6116002)(2906002)(23726003)(25786009)(99286004)(33656002)(6512007)(9686003)(14444005)(70586007)(6636002)(6306002)(70206006)(5660300002)(47776003)(6486002)(36906005)(26826003)(3846002)(66066001)(8936002)(8746002)(46406003)(14454004)(58126008)(81166006)(316002)(81156014)(8676002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4279;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 167f86c9-d66f-4ff4-a913-08d744a4e882
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM6PR08MB4279; 
NoDisclaimer: True
X-Forefront-PRVS: 017589626D
X-Microsoft-Antispam-Message-Info: AmIRaWguYcpaB3Ce3rEuqH3r0XFRpsqTo24twLKpI+YU8+YbeAqTFAhJTkKzku16lNgPzacy9ao2i6HbMJozcKev+i8adJQRzx7+vWSQ/a2BqHyKHezu7wyETgp8ShDgPnqnRlSiZz5v2CtvX23h4I7EYiapdZHNLQ9suOrTRNFlwqwhdrREMWLUkSIk6m7a7hcttF4+ZSjbWRbzHc78abi2rngH9Eftj6JFMbLnr4CCILYKPAXfvf88t6zk/5cHDQp7ummZ0okBEP8ZuXQ2ctLJyRQ5s9JcCLFEbu2T1Pcz7G2hM5aXZjFMszm58cC82lFVddqbfQLEd4XjLMOAPoRiVcImGrolWueAwUENyImZbmdn6rFjUpXZAd2l949B5eA4p82ZKQ5kqMt2LvboOLw2wpbbCK4yueFD5kf7aoHeqrg5XBYhHEEqXQvk+TBBu1goPx+QRV2ezomU9S2ixQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2019 06:19:14.1993 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28fd185e-c433-4acb-4674-08d744a4f347
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4279
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1i66CD8zMe2VMNNH4WML4pyxCs7cKHEBPw/SKU1qXlE=;
 b=ob5wViHFYBi8JYZ8aL3EGcfzwCtoTxEnTmenrkfoXrgsnL9A52HzZ87qwgXLNZbVztsQ7WOiOwWMbLR4/k+YNW2nPsKjao4+KnDfBNUH3htl8ap33ppk8fRL4cZDscXn4N4LaaswjPKQj/PcQvowuyBY5GGz8ryJXuf8TZJ/dQg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1i66CD8zMe2VMNNH4WML4pyxCs7cKHEBPw/SKU1qXlE=;
 b=ob5wViHFYBi8JYZ8aL3EGcfzwCtoTxEnTmenrkfoXrgsnL9A52HzZ87qwgXLNZbVztsQ7WOiOwWMbLR4/k+YNW2nPsKjao4+KnDfBNUH3htl8ap33ppk8fRL4cZDscXn4N4LaaswjPKQj/PcQvowuyBY5GGz8ryJXuf8TZJ/dQg=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, nd <nd@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMTA6MTA6MjZBTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBXaGVuIGluaXRpYWxseSB0dXJuaW5nIGEgY3J0YyBvbiwgZHJtX3Jlc2V0X3Zi
bGFua190aW1lc3RhbXAgd2lsbAo+IHNldCB0aGUgdmJsYW5rIHRpbWVzdGFtcCB0byAwIGZvciBh
bnkgZHJpdmVyIHRoYXQgZG9lc24ndCBwcm92aWRlCj4gYSAtPmdldF92YmxhbmtfdGltZXN0YW1w
KCkgaG9vay4KPiAKPiBVbmZvcnR1bmF0ZWx5LCB0aGUgRkxJUF9DT01QTEVURSBldmVudCBkZXBl
bmRzIG9uIHRoYXQgdGltZXN0YW1wLAo+IGFuZCB0aGUgb25seSB3YXkgdG8gcmVnZW5lcmF0ZSBh
IHZhbGlkIG9uZSBpcyB0byBoYXZlIHZibGFuawo+IGludGVycnVwdHMgZW5hYmxlZCBhbmQgaGF2
ZSBhIHZhbGlkIGluLUlTUiBjYWxsIHRvCj4gZHJtX2NydGNfaGFuZGxlX3ZibGFuay4KPiAKPiBB
ZGRpdGlvbmFsbHksIGlmIHRoZSB1c2VyIGRvZXNuJ3QgcmVxdWVzdCB2YmxhbmtzIGJ1dCBfZG9l
c18gcmVxdWVzdAo+IEZMSVBfQ09NUExFVEUgZXZlbnRzLCB3ZSBzdGlsbCBkb24ndCBoYXZlIGEg
Z29vZCB0aW1lc3RhbXA6IGl0J2xsIGJlIHRoZQo+IHNhbWUgc3RhbXAgYXMgdGhlIGxhc3QgdmJs
YW5rIG9uZS4KPiAKPiBXb3JrIGFyb3VuZCB0aGUgaXNzdWUgYnkgYWx3YXlzIGVuYWJsaW5nIHZi
bGFua3Mgd2hlbiB0aGUgQ1JUQyBpcyBvbi4KPiBSZWR1Y2luZyB0aGUgYW1vdW50IG9mIHRpbWUg
dGhhdCBQTDAgaGFzIHRvIGJlIHVubWFza2VkIHdvdWxkIGJlIG5pY2UgdG8KPiBmaXggYXQgYSBs
YXRlciB0aW1lLgo+IAo+IENoYW5nZXMgc2luY2UgdjEgW2h0dHBzOi8vcGF0Y2h3b3JrLmZyZWVk
ZXNrdG9wLm9yZy9wYXRjaC8zMzE3MjcvXToKPiAgLSBtb3ZlZCBkcm1fY3J0Y192YmxhbmtfcHV0
IGNhbGwgdG8gdGhlIC0+YXRvbWljX2Rpc2FibGUoKSBob29rCj4gCj4gQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogTGl2aXUgRHVkYXUgPExpdml1LkR1ZGF1QGFybS5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogTWloYWlsIEF0YW5hc3NvdiA8bWloYWlsLmF0YW5hc3NvdkBh
cm0uY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9jcnRjLmMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0
Yy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4g
aW5kZXggMzRiYzczY2ExOGJjLi5kMDY2NzlhZmIyMjggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gQEAgLTQ4OSw2ICs0ODks
NyBAQCBrb21lZGFfY3J0Y19hdG9taWNfZW5hYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiAg
CXBtX3J1bnRpbWVfZ2V0X3N5bmMoY3J0Yy0+ZGV2LT5kZXYpOwo+ICAJa29tZWRhX2NydGNfcHJl
cGFyZSh0b19rY3J0YyhjcnRjKSk7Cj4gIAlkcm1fY3J0Y192Ymxhbmtfb24oY3J0Yyk7Cj4gKwlX
QVJOX09OKGRybV9jcnRjX3ZibGFua19nZXQoY3J0YykpOwo+ICAJa29tZWRhX2NydGNfZG9fZmx1
c2goY3J0Yywgb2xkKTsKPiAgfQo+ICAKPiBAQCAtNTgxLDYgKzU4Miw3IEBAIGtvbWVkYV9jcnRj
X2F0b21pY19kaXNhYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiAgCQlrb21lZGFfY3J0Y19m
bHVzaF9hbmRfd2FpdF9mb3JfZmxpcF9kb25lKGtjcnRjLCBkaXNhYmxlX2RvbmUpOwo+ICAJfQo+
ICAKPiArCWRybV9jcnRjX3ZibGFua19wdXQoY3J0Yyk7Cj4gIAlkcm1fY3J0Y192Ymxhbmtfb2Zm
KGNydGMpOwo+ICAJa29tZWRhX2NydGNfdW5wcmVwYXJlKGtjcnRjKTsKPiAgCXBtX3J1bnRpbWVf
cHV0KGNydGMtPmRldi0+ZGV2KTsKCkxvb2tzIGdvb2QgdG8gbWUuCgpSZXZpZXdlZC1ieTogSmFt
ZXMgUWlhbiBXYW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0u
Y29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
