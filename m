Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168E48169D
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 12:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC0E6E3D6;
	Mon,  5 Aug 2019 10:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::613])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CD46E3D3
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 10:13:48 +0000 (UTC)
Received: from AM4PR08CA0052.eurprd08.prod.outlook.com (2603:10a6:205:2::23)
 by DB6PR0801MB1846.eurprd08.prod.outlook.com (2603:10a6:4:35::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.17; Mon, 5 Aug
 2019 10:13:44 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::200) by AM4PR08CA0052.outlook.office365.com
 (2603:10a6:205:2::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.13 via Frontend
 Transport; Mon, 5 Aug 2019 10:13:44 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 5 Aug 2019 10:13:43 +0000
Received: ("Tessian outbound a1fd2c3cfdb0:v26");
 Mon, 05 Aug 2019 10:13:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b20d286513b3dfb5
X-CR-MTA-TID: 64aa7808
Received: from 46d34bccf823.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.58]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C089A12F-4DDA-4ED4-A5F0-8F48D515BF2A.1; 
 Mon, 05 Aug 2019 10:13:37 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2058.outbound.protection.outlook.com [104.47.4.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 46d34bccf823.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Aug 2019 10:13:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMiPS47X8K+KpprTBGqV4+rXvgtSVjNKwmoaczTewlVaKKcMjHndD7P3s2gA5najIeJy4luNSF35u2Ttv/yOspUXM7rwQDGQQ6u1ng2eQhyH5seMaqGfqWoznH1LwKxuFhIDLN3NIP/9mo9FMe23oUmACFHQ981Pt0YogPHrCOFvYKZJqtC4Gllv8h24jwwE9hQvX6umf6g9NO1cRXFA+X/OfqHpGawjv1O2cR3dHFF9Pc6uG86cBopMmsLEABuABUUFmp/WP67WHwupnO2MGSeafPRF25pOX7N15kEKQ/tTvxnUPiHLMcsnslwBpj6OaRQ9TH6Dw5smemsQQb+1Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnKkDQoeygPs5m6UATFQGs8f4tiOJVzK3YjQlOVYBYQ=;
 b=nxoDm6mUwPrTDyq+w8zxf3LJktt+iyY+Xv91TDgdbo7hbx2lpy298luizO+X2AUr1gJUnsh3sDFtU21QtaXQf4fya9ufltCRsRSArAWd2AcpaibbXIXjkGaRZn+MWN/qPf+Y9zx8/nHkD8skPIHrmy3sNv0zupN+8/trWPDWapwmrP+hzt5VtIhClIaIE7Tp1T4ToBAl3xBOY4VHTWniEUP5XdmHqGwvDjbjhJGy0ec1Qgf0hsOEVlfipDbIUvLpOsTYh7mvoAyFbRem9PfqJYM6Tcw46Nm3InwLbamH0kX/aXBkSAxg5s0QExeguEdvIdWFPDBeztncfZHAfxeTPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4990.eurprd08.prod.outlook.com (10.255.158.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.15; Mon, 5 Aug 2019 10:13:35 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134%6]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 10:13:35 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH v2.1] drm/komeda: Add support for 'memory-region' DT node
 property
Thread-Topic: [PATCH v2.1] drm/komeda: Add support for 'memory-region' DT node
 property
Thread-Index: AQHVS3QM1TQJ/XVHokO2F4Ib3nbRwKbsVfKA
Date: Mon, 5 Aug 2019 10:13:35 +0000
Message-ID: <20190805101329.GA26357@jamwan02-TSP300>
References: <20190802143951.4436-1-mihail.atanassov@arm.com>
 <20190805095408.21285-1-mihail.atanassov@arm.com>
In-Reply-To: <20190805095408.21285-1-mihail.atanassov@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0194.apcprd02.prod.outlook.com
 (2603:1096:201:21::30) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: cad74f2b-3c2f-4b25-b4c0-08d7198d983c
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4990; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4990:|DB6PR0801MB1846:
X-Microsoft-Antispam-PRVS: <DB6PR0801MB1846A960A43B546873E39BC9B3DA0@DB6PR0801MB1846.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:568;OLM:568;
x-forefront-prvs: 01208B1E18
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(376002)(396003)(136003)(366004)(346002)(199004)(189003)(76176011)(9686003)(6246003)(6436002)(6116002)(99286004)(58126008)(6512007)(86362001)(81166006)(81156014)(68736007)(53936002)(33656002)(25786009)(486006)(1076003)(6862004)(476003)(8676002)(229853002)(186003)(4326008)(5660300002)(66066001)(71200400001)(71190400001)(66946007)(8936002)(64756008)(66446008)(52116002)(305945005)(6486002)(7736002)(256004)(2906002)(316002)(66476007)(14454004)(55236004)(11346002)(6506007)(386003)(478600001)(26005)(6636002)(66556008)(446003)(54906003)(102836004)(33716001)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4990;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: kx2j+QcQI0+cAgUjxfN+EiB3pTJnDGIt3L+1gOmXIy6A4Gbh7s0C1TPSD7gCl48eUavDWjj4Cy3XEAUz0pjesBuTboCM3nBLliZb7lWurmCAua6Ycbe9RsPaFMpgot5WpKVeQt/c8FBrQULcM+lSBLUzuZxgjbMZgpIBqCEjfU4K6LRT8TsijOWbwEpKfHaMgXSNpRjbRGkPEsmaMxUMKwdLxkFhjWSlE2andBS2gX+bf09vOIio8V9TFLVMBIpqNUo03XmyekZZfAWWXZR1FWTi8hvh22GpdYuL7M0dEMajJdHrTPHaSrMWzrBbNQYGiYHd/6tivYiGHWvXpBtiZNJFQQ4yZTuNP3rSXa/Yty81Uw9Jcaz6plLkv19Kkd4RcWAS/DmtrKM9evFahk6v2y8UccFqgXyiiEzDjFohAtw=
Content-ID: <6ADE09C3D72D084489D86BAC215FC774@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4990
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(346002)(136003)(39860400002)(396003)(2980300002)(199004)(189003)(6246003)(1076003)(23726003)(229853002)(2906002)(76130400001)(26005)(66066001)(6862004)(25786009)(26826003)(478600001)(70586007)(6512007)(8936002)(47776003)(50466002)(107886003)(81166006)(5660300002)(22756006)(81156014)(6486002)(6116002)(3846002)(70206006)(8746002)(9686003)(446003)(11346002)(63370400001)(63350400001)(316002)(33656002)(7736002)(305945005)(76176011)(4326008)(54906003)(126002)(386003)(6506007)(102836004)(336012)(476003)(186003)(8676002)(33716001)(58126008)(486006)(97756001)(356004)(99286004)(6636002)(36906005)(46406003)(86362001)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB1846;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 573274d8-6632-4bea-3df2-08d7198d9373
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB6PR0801MB1846; 
NoDisclaimer: True
X-Forefront-PRVS: 01208B1E18
X-Microsoft-Antispam-Message-Info: nqHRzeZcOJNktOampGIqjn9su65YHH5TToDsJepVPoH4Pvjf3OkuY9/zRgaV2eX+ssd1YAAs3ytFJFzTq0PJAVGGli39FVs/SwifsMrAKnJ7unkLQLk0DpQU25ACIwFzXvZZmFWzlMkgaFz5Az8AOE+YdPBBzdlV26tdQ+ALyddTNrXqGqlTQRyJ84+GorXIPeME8EUlFaud9aAaZwLyi7Oy+GVqKEm6YcYcOZeNLx4+DBbMVNwL8YIeDOEiWkusOCo7/jc56e4EXKSGrA1J+UUAsch0Xyh5Tlo3b6XbI9JDZgd7ReikIuvYosQ7w72AkN3URTd1sg76G6jQkLCK8Ci09V9UxSlcI6AmICHbSHQ2diOZoU4lFYZTrazAHXBL4Whp8nGx46+JWElkyOQAe+98YWM+BQUOUJVBL4LtOLQ=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2019 10:13:43.0101 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cad74f2b-3c2f-4b25-b4c0-08d7198d983c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1846
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnKkDQoeygPs5m6UATFQGs8f4tiOJVzK3YjQlOVYBYQ=;
 b=fxy8s4IRqUPgr37CQK1PrcthaYqTFx+OpHNrFzohybNePmeMWqrtbUDPdglheUWBJnnaMoMxePYEhXTegxFhigbuJ9X3rFWqPxpDZcv//mjeToO83Alzw64g7qYS1OzBetr27BmLJg2t2TKLuVxYOmA1RvNkZH84ijXnLpN5r9E=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnKkDQoeygPs5m6UATFQGs8f4tiOJVzK3YjQlOVYBYQ=;
 b=fxy8s4IRqUPgr37CQK1PrcthaYqTFx+OpHNrFzohybNePmeMWqrtbUDPdglheUWBJnnaMoMxePYEhXTegxFhigbuJ9X3rFWqPxpDZcv//mjeToO83Alzw64g7qYS1OzBetr27BmLJg2t2TKLuVxYOmA1RvNkZH84ijXnLpN5r9E=
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMDU6NTY6MjVQTSArMDgwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBUaGUgJ21lbW9yeS1yZWdpb24nIHByb3BlcnR5IG9mIHRoZSBrb21lZGEgZGlz
cGxheSBkcml2ZXIgRFQgYmluZGluZwo+IGFsbG93cyB0aGUgdXNlIG9mIGEgJ3Jlc2VydmVkLW1l
bW9yeScgbm9kZSBmb3IgYnVmZmVyIGFsbG9jYXRpb25zLiBBZGQKPiB0aGUgcmVxdWlzaXRlIG9m
X3Jlc2VydmVkX21lbV9kZXZpY2Vfe2luaXQscmVsZWFzZX0gY2FsbHMgdG8gYWN0dWFsbHkKPiBt
YWtlIHVzZSBvZiB0aGUgbWVtb3J5IGlmIHByZXNlbnQuCj4gCj4gQ2hhbmdlcyBzaW5jZSB2MToK
PiAgLSBNb3ZlIGhhbmRsaW5nIGluc2lkZSBrb21lZGFfcGFyc2VfZHQKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jIHwgOSArKysr
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jCj4gaW5kZXggMWZmN2Y0
YjJjNjIwLi4wMTQyZWU5OTE5NTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwo+IEBAIC04LDYgKzgsNyBAQAo+ICAjaW5jbHVkZSA8
bGludXgvaW9tbXUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvb2ZfZ3JhcGguaD4KPiArI2luY2x1ZGUgPGxpbnV4L29mX3Jlc2VydmVkX21lbS5o
Pgo+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51
eC9kbWEtbWFwcGluZy5oPgo+ICAjaWZkZWYgQ09ORklHX0RFQlVHX0ZTCj4gQEAgLTE0Niw2ICsx
NDcsMTIgQEAgc3RhdGljIGludCBrb21lZGFfcGFyc2VfZHQoc3RydWN0IGRldmljZSAqZGV2LCBz
dHJ1Y3Qga29tZWRhX2RldiAqbWRldikKPiAgCQlyZXR1cm4gbWRldi0+aXJxOwo+ICAJfQo+ICAK
PiArCS8qIEdldCB0aGUgb3B0aW9uYWwgZnJhbWVidWZmZXIgbWVtb3J5IHJlc291cmNlICovCj4g
KwlyZXQgPSBvZl9yZXNlcnZlZF9tZW1fZGV2aWNlX2luaXQoZGV2KTsKPiArCWlmIChyZXQgJiYg
cmV0ICE9IC1FTk9ERVYpCj4gKwkJcmV0dXJuIHJldDsKPiArCXJldCA9IDA7Cj4gKwo+ICAJZm9y
X2VhY2hfYXZhaWxhYmxlX2NoaWxkX29mX25vZGUobnAsIGNoaWxkKSB7Cj4gIAkJaWYgKG9mX25v
ZGVfY21wKGNoaWxkLT5uYW1lLCAicGlwZWxpbmUiKSA9PSAwKSB7Cj4gIAkJCXJldCA9IGtvbWVk
YV9wYXJzZV9waXBlX2R0KG1kZXYsIGNoaWxkKTsKPiBAQCAtMjkyLDYgKzI5OSw4IEBAIHZvaWQg
a29tZWRhX2Rldl9kZXN0cm95KHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQo+ICAKPiAgCW1kZXYt
Pm5fcGlwZWxpbmVzID0gMDsKPiAgCj4gKwlvZl9yZXNlcnZlZF9tZW1fZGV2aWNlX3JlbGVhc2Uo
ZGV2KTsKPiArCj4gIAlpZiAoZnVuY3MgJiYgZnVuY3MtPmNsZWFudXApCj4gIAkJZnVuY3MtPmNs
ZWFudXAobWRldik7Cj4gIAo+IC0tIAo+IDIuMjIuMAoKClRoYW5rIHlvdS4KClJldmlld2VkLWJ5
OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5n
QGFybS5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
