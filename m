Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF57FC1D2
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:48:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB4E6E4AD;
	Thu, 14 Nov 2019 08:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::609])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6796A6E4AB
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 08:48:09 +0000 (UTC)
Received: from VI1PR08CA0122.eurprd08.prod.outlook.com (2603:10a6:800:d4::24)
 by AM0PR08MB3362.eurprd08.prod.outlook.com (2603:10a6:208:dc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23; Thu, 14 Nov
 2019 08:48:07 +0000
Received: from DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::201) by VI1PR08CA0122.outlook.office365.com
 (2603:10a6:800:d4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2451.23 via Frontend
 Transport; Thu, 14 Nov 2019 08:48:07 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT047.mail.protection.outlook.com (10.152.21.232) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2451.23 via Frontend Transport; Thu, 14 Nov 2019 08:48:06 +0000
Received: ("Tessian outbound 0939a6bab6b1:v33");
 Thu, 14 Nov 2019 08:48:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1f833470eb5f628c
X-CR-MTA-TID: 64aa7808
Received: from cda5dac97c07.3 (cr-mta-lb-1.cr-mta-net [104.47.6.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C0849A38-67DE-495A-9583-626BD1EE7208.1; 
 Thu, 14 Nov 2019 08:48:00 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cda5dac97c07.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Nov 2019 08:48:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZX7Jty7aAcHdccI/iK88cN1F+hkAjX0SZQ/ruezeKHnJYb05KCT1QmLZbEEYfFkE/HNEA12szS7+CQWnDJsBEtnV0U7e0TK1mgv7R4Cl7Qqg7ZJJtKN/wqzTpMYof+JztDjcarauqEAqT3fYrW2F66f/MzoeiZuyU/LWt22mnY+Yx4LevKSqMpLRY+gioWvTClnkd/QkszWTUoXAD0WVyhACMJQOtykkGki1xXGchLe3X4obLHKPTUWlFdq9zsP2ib2UA5LQMMhgmTC0q8+R0obrYz9hKClnhC6SaQtV5MVQ/jmiXt0I9XQGvOeAVndoR6bQ9jmGBzcIy9FpokdSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwQpB5M03zd/1yvci1oyGQfVtpTZ6fOvFZJ4F58GzQ4=;
 b=cgX853Yl4WsV6BoWxu3xE9J86Zv3euah75ecNV090ib8XvYCMo6+maNbGmZ+t7/U76tYoc2LMvp2l/qXlgw25JAvxcu11/0ONy6xBFAznF6WaPByczZJ7D3YC42rzz+K5r+lEefza7IH3enly/J2KBXJhvWAxFUHcIEe88t8dW5GCDV+SciBx3SOy5MPBIkurfUEq8E7n/bDGhXQ0P5vjmZLHzu20a9QnREX+rIVX/AsyA55iI2h1kVpsF25s0u+4XsxL+0vzydcZ7Iy+5Abxta54cQoQbERUqQhblFYAMOO0UX5GEvl8nA3ZSA3VDBx52GlFEPZgKTdqwP2i5atWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3630.eurprd08.prod.outlook.com (20.177.61.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Thu, 14 Nov 2019 08:47:58 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2430.028; Thu, 14 Nov 2019
 08:47:58 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: =?utf-8?B?UmU6IFtQQVRDSF0gZHJtL2tvbWVkYTogQ2xlYW4gd2FybmluZ3M6IGNhbmRp?=
 =?utf-8?B?ZGF0ZSBmb3IgJ2dudV9wcmludGbigJkgZm9ybWF0IGF0dHJpYnV0ZQ==?=
Thread-Topic: =?utf-8?B?W1BBVENIXSBkcm0va29tZWRhOiBDbGVhbiB3YXJuaW5nczogY2FuZGlkYXRl?=
 =?utf-8?B?IGZvciAnZ251X3ByaW50ZuKAmSBmb3JtYXQgYXR0cmlidXRl?=
Thread-Index: AQHVmrvHSAACMS3tME+zvG9PBSu3eaeKWvSA
Date: Thu, 14 Nov 2019 08:47:58 +0000
Message-ID: <2335872.DMSfzqFJN1@e123338-lin>
References: <20191114071839.29120-1-james.qian.wang@arm.com>
In-Reply-To: <20191114071839.29120-1-james.qian.wang@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0211.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::31) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a514f7b0-a806-4e2c-b7fb-08d768df5e6d
X-MS-TrafficTypeDiagnostic: VI1PR08MB3630:|VI1PR08MB3630:|AM0PR08MB3362:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB3362239A5DCE36633C8782618F710@AM0PR08MB3362.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4502;OLM:4502;
x-forefront-prvs: 02213C82F8
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(189003)(199004)(3846002)(71190400001)(99286004)(486006)(6862004)(386003)(102836004)(6506007)(476003)(7736002)(446003)(26005)(2906002)(25786009)(66066001)(305945005)(4326008)(86362001)(6116002)(6436002)(76176011)(66556008)(64756008)(66476007)(71200400001)(11346002)(478600001)(316002)(14454004)(14444005)(8936002)(186003)(9686003)(229853002)(81166006)(256004)(6246003)(66446008)(54906003)(5660300002)(33716001)(66946007)(6486002)(6512007)(81156014)(6636002)(52116002)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3630;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: spXYwku6wBI6n664psi4+GlYqFZYTVgo2luU+SKIG1PW8ybR6isf+bXd+vARzFVVPr+QnFFvUbdAsIMzxUYuvNcZM+Yt3mS+DybW9y0hLmG1fxw7JgkvjMIM2I22/uHMh3GYxRBSdxO0kz1En0TSHQ6+kyDkCLgDfRcm0e7FXhbaqmNSPoXzUndES+zixxoKCcox6hsyPIzwqlwOPWlWOwmokG9wDCFbuAoIJdr/k80VbOR7tQSAldOmWh1cOwkR0WNHrn/44BpgC+1YEr+fdR7oQs3qhAQfo2vD79qTQaS756m4krp6U7gzFas6j5HyxsqvAHx+v1DuFCi11OwbTZPRGJ47CyFPk2hsir1a8biAOVBXQsaGgyjA/1ayJrBSWlFlzO/APmAzdPOYTBBbcQFDKhIOtkqnCPmOEy4GU4rB39mXCIJgrwJa9tJNvSlx
Content-ID: <BDB58EB501773C4382ED964973DFB844@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3630
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(396003)(136003)(346002)(376002)(39850400004)(1110001)(339900001)(199004)(189003)(11346002)(102836004)(6116002)(8936002)(3846002)(5660300002)(336012)(186003)(229853002)(26005)(6486002)(6506007)(14454004)(2906002)(86362001)(76176011)(386003)(14444005)(316002)(7736002)(305945005)(6636002)(66066001)(47776003)(25786009)(54906003)(478600001)(81156014)(2486003)(23676004)(50466002)(26826003)(81166006)(33716001)(4326008)(99286004)(476003)(356004)(126002)(6246003)(6862004)(70586007)(76130400001)(70206006)(6512007)(9686003)(436003)(446003)(22756006)(105606002)(486006)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3362;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a41f0f54-b788-47a1-0950-08d768df5970
NoDisclaimer: True
X-Forefront-PRVS: 02213C82F8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kX06l0SEOWAFYKuaLba6Ore3pA1eh2eDr4khyIkpJoSVwB9S/VW1BWIf1WicHG/Oh4QF44+35LLjVu7z7jVTkLOz0QI3KaDKjcspR5ntdgbmJyjm915iTTDKCv115d/88Tj95SDTfU6bI5nKJVOcL59iTEOkixPczkgJeBCPMRnu7LrfC4JUleMFMnbJVRuGKgWKCEbjiMt4d4uyVVYGdfpnd8+Ly+pbFPQ6zVphInnZ03dPu4yB0tMojJea0JZ9SakvpbGHHOLEuFfrNw7vkw5VD6Ldf3NkDwcCc5TNjngPsxRQWtjmpH0KJVy/R2M5L1dKkodTw6s0JVb/mt/zH+yfGjAPmPSzTBiHxKXKzMPC+8Wa9+0INjgsxGJz2vUzluh/+nPvfw5gCfpN4dogyDfIYGo4fr3+U8k+AteBzjlmq6ZalMigGy9i9rL1qn9R
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2019 08:48:06.6698 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a514f7b0-a806-4e2c-b7fb-08d768df5e6d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3362
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwQpB5M03zd/1yvci1oyGQfVtpTZ6fOvFZJ4F58GzQ4=;
 b=0wjWfBwiZkX8eAfmSM8WFccRtfpFC6pvbLTlKjX8eiu3rJAwiPtiDZDRMaTZP4Zj+8o9vfTTeS+ygAkfu1xBnK9Ru7flF8uxA0HMXgMpHHTbYqWDrgVSknQnQg3+XGpTe0R4OYA5xiwLDo6P6OjmKfEfB8DmdeItprXUjrUmdEw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwQpB5M03zd/1yvci1oyGQfVtpTZ6fOvFZJ4F58GzQ4=;
 b=0wjWfBwiZkX8eAfmSM8WFccRtfpFC6pvbLTlKjX8eiu3rJAwiPtiDZDRMaTZP4Zj+8o9vfTTeS+ygAkfu1xBnK9Ru7flF8uxA0HMXgMpHHTbYqWDrgVSknQnQg3+XGpTe0R4OYA5xiwLDo6P6OjmKfEfB8DmdeItprXUjrUmdEw=
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
Cc: "lowryli@arm.com" <lowryli@arm.com>, nd <nd@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFtZXMsDQoNCk9uIFRodXJzZGF5LCAxNCBOb3ZlbWJlciAyMDE5IDA3OjE4OjU2IEdNVCBq
YW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToNCj4ga29tZWRhL2tv
bWVkYV9waXBlbGluZS5jOiBJbiBmdW5jdGlvbiDigJhrb21lZGFfY29tcG9uZW50X2FkZOKAmToN
Cj4ga29tZWRhL2tvbWVkYV9waXBlbGluZS5jOjIxMzozOiB3YXJuaW5nOiBmdW5jdGlvbiDigJhr
b21lZGFfY29tcG9uZW50X2FkZOKAmSBtaWdodCBiZSBhIGNhbmRpZGF0ZSBmb3Ig4oCYZ251X3By
aW50ZuKAmSBmb3JtYXQgYXR0cmlidXRlIFstV3N1Z2dlc3QtYXR0cmlidXRlPWZvcm1hdF0NCj4g
ICAgdnNucHJpbnRmKGMtPm5hbWUsIHNpemVvZihjLT5uYW1lKSwgbmFtZV9mbXQsIGFyZ3MpOw0K
PiAgICBefn5+fn5+fn4NCg0KVGhlIGZpeCBmb3IgdGhpcyBvbmUgaXNuJ3QgaW4gdGhlIHBhdGNo
IGJlbG93Lg0KDQo+IA0KPiBrb21lZGEva29tZWRhX2V2ZW50LmM6IEluIGZ1bmN0aW9uIOKAmGtv
bWVkYV9zcHJpbnRm4oCZOg0KPiBrb21lZGEva29tZWRhX2V2ZW50LmM6MzE6Mjogd2FybmluZzog
ZnVuY3Rpb24g4oCYa29tZWRhX3NwcmludGbigJkgbWlnaHQgYmUgYSBjYW5kaWRhdGUgZm9yIOKA
mGdudV9wcmludGbigJkgZm9ybWF0IGF0dHJpYnV0ZSBbLVdzdWdnZXN0LWF0dHJpYnV0ZT1mb3Jt
YXRdDQo+ICAgbnVtID0gdnNucHJpbnRmKHN0ci0+c3RyICsgc3RyLT5sZW4sIGZyZWVfc3osIGZt
dCwgYXJncyk7DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNo
bm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZXZlbnQuYyB8IDEgKw0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZXZlbnQuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2V2ZW50LmMNCj4gaW5kZXggYmYyNjk2ODNmODEx
Li45NzdjMzhkNTE2ZGEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2V2ZW50LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfZXZlbnQuYw0KPiBAQCAtMTcsNiArMTcsNyBAQCBzdHJ1Y3Qga29t
ZWRhX3N0ciB7DQo+ICANCj4gIC8qIHJldHVybiAwIG9uIHN1Y2Nlc3MsICA8IDAgb24gbm8gc3Bh
Y2UuDQo+ICAgKi8NCj4gK19fcHJpbnRmKDIsIDMpDQo+ICBzdGF0aWMgaW50IGtvbWVkYV9zcHJp
bnRmKHN0cnVjdCBrb21lZGFfc3RyICpzdHIsIGNvbnN0IGNoYXIgKmZtdCwgLi4uKQ0KPiAgew0K
PiAgCXZhX2xpc3QgYXJnczsNCj4gLS0gDQo+IDIuMjAuMQ0KPiANCj4gDQoNCg0KLS0gDQpNaWhh
aWwNCg0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
