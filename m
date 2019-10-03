Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA32BCA80D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 19:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C096F6EA2A;
	Thu,  3 Oct 2019 17:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20044.outbound.protection.outlook.com [40.107.2.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6616EA2A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 17:06:11 +0000 (UTC)
Received: from VI1PR0802CA0008.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::18) by AM0PR08MB3314.eurprd08.prod.outlook.com
 (2603:10a6:208:60::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Thu, 3 Oct
 2019 17:06:07 +0000
Received: from DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::208) by VI1PR0802CA0008.outlook.office365.com
 (2603:10a6:800:aa::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.17 via Frontend
 Transport; Thu, 3 Oct 2019 17:06:07 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT022.mail.protection.outlook.com (10.152.20.171) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Thu, 3 Oct 2019 17:06:05 +0000
Received: ("Tessian outbound 0cf06bf5c60e:v33");
 Thu, 03 Oct 2019 17:05:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3994401ae3fb81dd
X-CR-MTA-TID: 64aa7808
Received: from 1a0d2422a4c2.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.1.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 33EC2563-45B6-452A-B168-075759C08DE9.1; 
 Thu, 03 Oct 2019 17:05:44 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1a0d2422a4c2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Thu, 03 Oct 2019 17:05:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mes9NSRPlhbxpRxVRFtIqd582fa211j++rWsGNMyOn2NXPqsQ2gL2QlMffSAhYw75UACw8vTkTgBAn7aFoyBfLtx9vx1ZBa6M5cqkK8YzEkjVdim+Q/Jxo/3yQs93NebPp++PZIHpNy4hYZ39vhwc/9M9Co0xmunpOY5ZCtLFY3dF76b4eWInc3eDx4diJ2Bc5lHHpK+yILlIYm6y9jhK5x9xZrKP4qO2WykBeXvp72kO/roiYNSxrNJE3aqfZGsMv5EBNZbuUf2kVnumEwRImWd7XGZ+aG74T/TXTIe/c5chd5vd9q8OQ2rHyVY3/YM0qRgpWnZW/Fq5tfznO0Anw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wndwPiRj3/bmYLqEY1Y2INAsP+KJCyQHFshBbIPiols=;
 b=jDsJ2OKoeBhan9KXBdh26FdoZaDzuihaesTCWEpyc8o6xCGtp+P3KqOLbDl7MunXXDiaOA3DRurv/xMpe0yVGM4ACysqEPi9vgjFJjecJtWkKzD+E5CKiYKce+wRAp7oJPVOgPZgL25sEg/W6zWkNOUAi3VplA1z9exFE+N9bq9n5zI1TYqrGEZDT+j02vn2Q9kf7tArTHKNTJDy0/Qzh51MDqF/vG/oD4ZFF1x+cWXpO5mXLpAlPtmTfSyh//0FHk6qptjLDGCQsmtOM0yp/WPr7N/jlX+OlA5icwFS7biFkEAhsl1LLa3wg+GkQzEb2jLFbIc2GDAO7RkbxFGlYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2653.eurprd08.prod.outlook.com (10.170.237.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 3 Oct 2019 17:05:41 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 17:05:41 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [PATCH] drm/komeda: Adds more check in mode_valid
Thread-Topic: [PATCH] drm/komeda: Adds more check in mode_valid
Thread-Index: AQHVQ4j/fedIk6fUkkilpyBPPcwKladJkn2A
Date: Thu, 3 Oct 2019 17:05:40 +0000
Message-ID: <13323280.1D6Sk5SDY4@e123338-lin.cambridge.arm.com>
References: <1564128364-23055-1-git-send-email-lowry.li@arm.com>
In-Reply-To: <1564128364-23055-1-git-send-email-lowry.li@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.52]
x-clientproxiedby: LO2P265CA0080.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::20) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 26bac565-71ac-4e40-705b-08d74823fa3f
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB2653:|VI1PR08MB2653:|AM0PR08MB3314:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB3314073C45E2E0B9B20B62E98F9F0@AM0PR08MB3314.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2449;OLM:2449;
x-forefront-prvs: 01792087B6
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39850400004)(366004)(346002)(376002)(136003)(199004)(189003)(6862004)(446003)(6512007)(86362001)(6246003)(4326008)(52116002)(99286004)(2906002)(478600001)(76176011)(316002)(8936002)(14454004)(81166006)(3846002)(6116002)(81156014)(8676002)(6486002)(66556008)(6436002)(66476007)(26005)(64756008)(66066001)(229853002)(54906003)(11346002)(6506007)(186003)(486006)(305945005)(386003)(66446008)(25786009)(102836004)(71190400001)(66946007)(7736002)(71200400001)(5660300002)(476003)(6636002)(256004)(14444005)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2653;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: zD7xfUnZeas9Hg542XE8Pp936Lj8os/pyzGCnq45670Uo4/nJNpmkP1JCm94HqeabjbvEyRbxIrlqp9Xy8xWJ/E5rKrPqjhcPW/Z5fSx7U4wmXhqzKqyfn7N6QDK/8QrHnfn50vbZUwTiOzXNFVuD9HuqqpfuzWvugCEZOuq71fLGXzffB601Lg3DjiqFxdzZsQ4jPMzz7fxnkwH6pmpadLRmRIbXM9tKcSVh5erQqt1QTZ3mqqHCFEzjvj9/2Vv4AaHgeeovyx8DURMJ694qleL51BaoN6CgWGiQm/EjjCrf9T33pmtBZfUuV7b0XPAN/2n8SP/B+URpHo7XdATKnTuAGJ/fnvHXa54Yj51VRKOF49y5IE++I+zQSCe4z4HtJTYHOgN6tjWxfIyalYXmbWQE829WKbwZ2AOyxX6qtw=
Content-ID: <FBC78ACD0000F04F8E820804631F031D@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2653
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(199004)(189003)(14444005)(66066001)(63350400001)(22756006)(356004)(47776003)(46406003)(99286004)(6246003)(305945005)(102836004)(6506007)(386003)(26005)(76176011)(6636002)(4326008)(6862004)(25786009)(5660300002)(7736002)(3846002)(6116002)(23726003)(86362001)(498600001)(476003)(26826003)(97756001)(76130400001)(186003)(70206006)(70586007)(229853002)(2906002)(14454004)(8936002)(81166006)(81156014)(8676002)(6486002)(336012)(486006)(50466002)(11346002)(8746002)(54906003)(446003)(6512007)(126002)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3314;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 558c4d4e-5e03-44ab-b4a7-08d74823eb2c
NoDisclaimer: True
X-Forefront-PRVS: 01792087B6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2XjGxrAjt40q/VItVcAertagSd6MijDSFgAxYmPvfxWNaPE59jg19M+wJMqWSj+UCQu5/h3JDWWeW0M6IObKsRfCdZqC8VVMtUhLfjtLCnyFfMKrKm5xpWSFW7DrFnIpjo/eHrEB2F8mxchD1qbLsgkSmvbWEPorA2wo1ryO9eqAmWP0hoRHkTlSWP553UUJhM5Le71Pnps6IyNDr/uVhq5IXNrFgxlYB96Aoww/tyJoxoK2/JgQo5vJmXuIDWXGEE/Wk+z+wiXhLbL61rZOZqGczDIVMg+sIYISHqnWSj1gP/b9KwIvR6ffSq7vDDjFDy4qN1xhJjBFEW1lluGj9d7IJM8nPb1vOhl5jDDppIUQ5+c+K15Ro6MkFohJakITiuuz7DOvj20qe7CcCtebQi2zUD6JvBaS5u9YAId2QJk=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2019 17:06:05.5150 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26bac565-71ac-4e40-705b-08d74823fa3f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3314
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wndwPiRj3/bmYLqEY1Y2INAsP+KJCyQHFshBbIPiols=;
 b=XB5zr7q9lIrPsCtSYVtDv0f/y54z7bM9CpuIzTbReVH2vLLyDuxNpAJGdiuxEzjsB591/wASKVU94YhNhjyg6kXcNcSeJD8xZ8ybpdi1x74jwGvxPx1JwiR1LDPAiy3/BZci1H3W4C+N+O2xNEqGFudGyIXAe9eVT6gDgW4qUQw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wndwPiRj3/bmYLqEY1Y2INAsP+KJCyQHFshBbIPiols=;
 b=XB5zr7q9lIrPsCtSYVtDv0f/y54z7bM9CpuIzTbReVH2vLLyDuxNpAJGdiuxEzjsB591/wASKVU94YhNhjyg6kXcNcSeJD8xZ8ybpdi1x74jwGvxPx1JwiR1LDPAiy3/BZci1H3W4C+N+O2xNEqGFudGyIXAe9eVT6gDgW4qUQw=
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
Cc: nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpZGF5LCAyNiBKdWx5IDIwMTkgMDk6MDY6MTYgQlNUIExvd3J5IExpIChBcm0gVGVjaG5v
bG9neSBDaGluYSkgd3JvdGU6Cj4gVGhpcyBwYXRjaCBhZGRzIHRoZSBjaGVja3MgZm9yIHZyZWZy
ZXNoLCBjcnRjX2hkaXNwbGF5IGFuZCBjcnRjX3ZkaXNwbGF5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGxvd3J5LmxpQGFybS5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyB8IDI4
ICsrKysrKysrKysrKysrKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9jcnRjLmMKPiBpbmRleCAyZmVkMWY2Li4wMTdmNmI2IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+
IEBAIC00MDMsMTEgKzQwMywzNyBAQCB1bnNpZ25lZCBsb25nIGtvbWVkYV9jcnRjX2dldF9hY2xr
KHN0cnVjdCBrb21lZGFfY3J0Y19zdGF0ZSAqa2NydGNfc3QpCj4gIAlzdHJ1Y3Qga29tZWRhX2Rl
diAqbWRldiA9IGNydGMtPmRldi0+ZGV2X3ByaXZhdGU7Cj4gIAlzdHJ1Y3Qga29tZWRhX2NydGMg
KmtjcnRjID0gdG9fa2NydGMoY3J0Yyk7Cj4gIAlzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICptYXN0
ZXIgPSBrY3J0Yy0+bWFzdGVyOwo+IC0JdW5zaWduZWQgbG9uZyBtaW5fcHhsY2xrLCBtaW5fYWNs
azsKPiArCXN0cnVjdCBrb21lZGFfY29tcGl6ICpjb21waXogPSBtYXN0ZXItPmNvbXBpejsKPiAr
CXVuc2lnbmVkIGxvbmcgbWluX3B4bGNsaywgbWluX2FjbGssIGRlbHRhLCBmdWxsX2ZyYW1lOwo+
ICsJaW50IGhkaXNwbGF5ID0gbS0+aGRpc3BsYXk7Cj4gIAo+ICAJaWYgKG0tPmZsYWdzICYgRFJN
X01PREVfRkxBR19JTlRFUkxBQ0UpCj4gIAkJcmV0dXJuIE1PREVfTk9fSU5URVJMQUNFOwo+ICAK
PiArCWZ1bGxfZnJhbWUgPSBtLT5odG90YWwgKiBtLT52dG90YWw7Cj4gKwlkZWx0YSA9IGFicyht
LT5jbG9jayAqIDEwMDAgLSBtLT52cmVmcmVzaCAqIGZ1bGxfZnJhbWUpOwo+ICsJaWYgKG0tPnZy
ZWZyZXNoICYmIChkZWx0YSA+IGZ1bGxfZnJhbWUpKSB7Cj4gKwkJRFJNX0RFQlVHX0FUT01JQygi
bW9kZSBjbG9jayBjaGVjayBlcnJvciFcbiIpOwo+ICsJCXJldHVybiBNT0RFX0NMT0NLX1JBTkdF
Owo+ICsJfQo+ICsKPiArCWlmIChrY3J0Yy0+c2lkZV9ieV9zaWRlKQo+ICsJCWhkaXNwbGF5IC89
IDI7Cj4gKwo+ICsJaWYgKCFpbl9yYW5nZSgmY29tcGl6LT5oc2l6ZSwgaGRpc3BsYXkpKSB7Cj4g
KwkJRFJNX0RFQlVHX0FUT01JQygiaGRpc3BsYXlbJXVdIGlzIG91dCBvZiByYW5nZVsldSwgJXVd
IVxuIiwKPiArCQkJCSBoZGlzcGxheSwgY29tcGl6LT5oc2l6ZS5zdGFydCwKPiArCQkJCSBjb21w
aXotPmhzaXplLmVuZCk7Cj4gKwkJcmV0dXJuIE1PREVfQkFEX0hWQUxVRTsKPiArCX0KPiArCj4g
KwlpZiAoIWluX3JhbmdlKCZjb21waXotPnZzaXplLCBtLT52ZGlzcGxheSkpIHsKPiArCQlEUk1f
REVCVUdfQVRPTUlDKCJ2ZGlzcGxheVsldV0gaXMgb3V0IG9mIHJhbmdlWyV1LCAldV0hXG4iLAo+
ICsJCQkJIG0tPnZkaXNwbGF5LCBjb21waXotPnZzaXplLnN0YXJ0LAo+ICsJCQkJIGNvbXBpei0+
dnNpemUuZW5kKTsKPiArCQlyZXR1cm4gTU9ERV9CQURfVlZBTFVFOwo+ICsJfQo+ICsKPiAgCW1p
bl9weGxjbGsgPSBtLT5jbG9jayAqIDEwMDA7Cj4gIAlpZiAobWFzdGVyLT5kdWFsX2xpbmspCj4g
IAkJbWluX3B4bGNsayAvPSAyOwo+IApMR1RNLAoKUmV2aWV3ZWQtYnk6IE1paGFpbCBBdGFuYXNz
b3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KCi0tIApNaWhhaWwKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
