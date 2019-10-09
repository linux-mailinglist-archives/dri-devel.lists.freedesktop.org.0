Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E74D0A62
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 10:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5818F6E939;
	Wed,  9 Oct 2019 08:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150040.outbound.protection.outlook.com [40.107.15.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F506E939
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 08:57:26 +0000 (UTC)
Received: from VI1PR08CA0128.eurprd08.prod.outlook.com (2603:10a6:800:d4::30)
 by AM0PR08MB3218.eurprd08.prod.outlook.com (2603:10a6:208:5b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.25; Wed, 9 Oct
 2019 08:57:23 +0000
Received: from AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::203) by VI1PR08CA0128.outlook.office365.com
 (2603:10a6:800:d4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 9 Oct 2019 08:57:23 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT059.mail.protection.outlook.com (10.152.17.193) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Wed, 9 Oct 2019 08:57:21 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Wed, 09 Oct 2019 08:57:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9dad7964282252ec
X-CR-MTA-TID: 64aa7808
Received: from 00afeece4153.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.13.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 40D1C92B-17D4-4FA3-A7CA-2A1D2981EF7E.1; 
 Wed, 09 Oct 2019 08:57:13 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 00afeece4153.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Wed, 09 Oct 2019 08:57:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQ1R0ENa5YwivWG0a6eXQGEc235petWvVe/sSt6y7OWRoWEiqnupOgj8Fr5SC5jK5XkweAtumEUuulh8KaOVIgH/m5hDT8AqRjpQdaXQlH+QqezgxoBcY0dAalFuCdDvAiPS32Hj84hTN9VTT76af5XCM93I+TaOVLSHkT3oDfmCqotRPpi8eo2tbAOqYi6z4hdtOqhOhj2N/neCDVshpecnT4gaGqkoZgauzGv+wsMWPmUl1FAqqmdEpHrUzNZApFGAC0eSGT8+8FxvNeSwZzMcBtjDVo6xISe1oime1EqYCgt/frcRP1NM07kza6bAEfXaU0Ibjj6hNjQ2/4C7kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EoCjD4qCMe4MgrXzYbULyLrTEH+GD+vnMY4AexS2hzY=;
 b=g75Bi1CIysZqmWzW7QYZUV5qNgK/hOTQtHPuQphc324Dk+RcqbCibyntP9zy1B3AVdgG/u9IMUoVs3roRi61VNLWaM2zcaLwOq3a6iwYaNRP3SxugI6wa0gj9OkauVL8I1KEbd0yGFJJdt3tYVOGlFbKf847l73HO/Qzc0b08TNW4vpcnarIlP94m/BHpsAVDPzJNxtXjiTQnPzqhCpdg6LQNkwLnK2ZPI1njxqYBJUQmjL/jx1TXdNVkmK4nudEsEHOtMB2iJCL/C0yrZJcG0zqVk+4OdmcVnRkvgh7mHAUgLD5pYD3zr5oD6s4SSCK1bfd3tNz3zQVkl+ayg5ZBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5232.eurprd08.prod.outlook.com (10.255.27.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 9 Oct 2019 08:57:11 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2305.023; Wed, 9 Oct 2019
 08:57:11 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: drm/komeda: Use devm_platform_ioremap_resource() in
 komeda_dev_create()
Thread-Topic: drm/komeda: Use devm_platform_ioremap_resource() in
 komeda_dev_create()
Thread-Index: AQHVfn+JvQC/QoqWmUy+DBMQjxCdOg==
Date: Wed, 9 Oct 2019 08:57:11 +0000
Message-ID: <20191009085704.GA26615@jamwan02-TSP300>
References: <64a6ea39-3e4b-2ebe-74f7-98720e581e3e@web.de>
In-Reply-To: <64a6ea39-3e4b-2ebe-74f7-98720e581e3e@web.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3e::20) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d7a13167-9c89-4ef9-3753-08d74c96b23d
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB5232:|VE1PR08MB5232:|AM0PR08MB3218:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB32185A3EB1FBD16E5D97DFD7B3950@AM0PR08MB3218.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 018577E36E
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(199004)(189003)(5660300002)(54906003)(14454004)(58126008)(1076003)(66946007)(186003)(2906002)(478600001)(66066001)(66476007)(66556008)(64756008)(66446008)(386003)(6506007)(102836004)(99286004)(76176011)(52116002)(3846002)(55236004)(6116002)(71200400001)(71190400001)(33656002)(316002)(26005)(6916009)(256004)(14444005)(8936002)(8676002)(81166006)(81156014)(4326008)(11346002)(86362001)(476003)(446003)(6246003)(7736002)(229853002)(25786009)(486006)(9686003)(6512007)(6486002)(305945005)(33716001)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5232;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: FqncX2CMcD2ZgZwmC4oh2yeybjlDAIP7KWZKzi6QRChtVtyT87fLg/JIrVqFmT0KwN0TBYm1q4wPC9cuiSp/1vpbxjrcILuyFQFQ8pt9gKn6KAD8VR7+fh8J0tBoq6RXgmxR3b3uzZWv25dghNJqetJA8LaLloc+s15Fm9mjeAjIwwWwNIc/LrTuxZlZ3QgyCT3U/m2dUD4cF4blcJqSk3eLutL2gzzgKBCCSLtAZ9GGJe4MgbLLuFFhWZxBmksthwmWt/8bJg+mj80RCSPyZb3LjD8ya1yIjWCD5JJwtNVNjWj3iQfGRsgeGyyqkeOVXdidAv5T7owF1z4Ph6bmuSoCMAsNlozZWtK8M+UMM32kIL+CYLkecNABLK1Awu25Daw6Zm0X6cEJ5Dic8VocS0eO0lIQB68XPKvrQnVdbew=
Content-ID: <6224130653DB3F4D90F736A8E942E43B@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5232
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(136003)(346002)(39860400002)(376002)(396003)(189003)(199004)(36906005)(316002)(81156014)(8936002)(8746002)(54906003)(8676002)(58126008)(81166006)(14454004)(33656002)(47776003)(66066001)(478600001)(33716001)(26826003)(1076003)(46406003)(305945005)(97756001)(7736002)(86362001)(50466002)(22756006)(14444005)(26005)(186003)(446003)(11346002)(3846002)(102836004)(70206006)(70586007)(476003)(126002)(76130400001)(336012)(6862004)(63350400001)(5660300002)(6116002)(6246003)(23726003)(4326008)(99286004)(6486002)(229853002)(25786009)(2906002)(486006)(76176011)(6512007)(9686003)(386003)(6506007)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3218;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6ed1062f-feaa-4608-ad35-08d74c96abf5
NoDisclaimer: True
X-Forefront-PRVS: 018577E36E
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mxLNRgwfmSL/GKOY/4c2K8/gDbNLbfmsjxQKNekeGsu+lOCtItfR+n5xXHStp2P3oXQbTscWXfI35P1HPjCTPg2bRd9lbdeJbpvKjUk7f9E+TSESmpiQcINaJWUv1hvNhpqkLZkTmk/NHX/EcSSWTyyJKXwHNcMjEWmI0wjVDqZvB68QWvjfjNNVgW8d7OG31fnxxAKVR5F7A1lhRnNTyJdWhBiPhS6WMvh2olHmQJmqWOLXnRxOyynDlxFn0VpudpHOIauV1/1XHN8cJlVpx5YCgtZT1EpXvHU5sHYAJ1zhVv4qxD8UVR/Q4w5qdOLRUl9NZr2HC6gsqr0BbgJb0Mabyt1QTl4vOGBBvco2DkZ8Bd/VAbqmcAjAG1s3oNVAK1VroBybZY37cPnjpOGnOjj9GlDPOLW4xX+di4uAh3c=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 08:57:21.4735 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a13167-9c89-4ef9-3753-08d74c96b23d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3218
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EoCjD4qCMe4MgrXzYbULyLrTEH+GD+vnMY4AexS2hzY=;
 b=CWJSmCfPgbHwBM9QIneZbi4k6VE3yZKuZsE4SgTzqQaQY9IjI7aQqPDLkJchnfMrlYoStex/PgruWuYITyeNaEaYB2F/BAFCqkX4SDJOGdgm+GRTpEMedyhBiftoPxdF7/CzIMZXOSJ/s9hnby7MTF6ko2DirmgyymcjPTsgBXo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EoCjD4qCMe4MgrXzYbULyLrTEH+GD+vnMY4AexS2hzY=;
 b=CWJSmCfPgbHwBM9QIneZbi4k6VE3yZKuZsE4SgTzqQaQY9IjI7aQqPDLkJchnfMrlYoStex/PgruWuYITyeNaEaYB2F/BAFCqkX4SDJOGdgm+GRTpEMedyhBiftoPxdF7/CzIMZXOSJ/s9hnby7MTF6ko2DirmgyymcjPTsgBXo=
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBTZXAgMjEsIDIwMTkgYXQgMDc6NTA6NDZQTSArMDIwMCwgTWFya3VzIEVsZnJpbmcg
d3JvdGU6Cj4gRnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2Uu
bmV0Pgo+IERhdGU6IFNhdCwgMjEgU2VwIDIwMTkgMTk6NDM6NTEgKzAyMDAKPiAKPiBTaW1wbGlm
eSB0aGlzIGZ1bmN0aW9uIGltcGxlbWVudGF0aW9uIGJ5IHVzaW5nIGEga25vd24gd3JhcHBlciBm
dW5jdGlvbi4KPiAKPiBUaGlzIGlzc3VlIHdhcyBkZXRlY3RlZCBieSB1c2luZyB0aGUgQ29jY2lu
ZWxsZSBzb2Z0d2FyZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJrdXMgRWxmcmluZyA8ZWxmcmlu
Z0B1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+CgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCkxvb2tz
IGdvb2QgdG8gbWUuClJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5
IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyB8IDkgKy0tLS0tLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgOCBkZWxldGlvbnMoLSkKPiAKPiAtLQo+IDIuMjMu
MAo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9kZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rl
di5jCj4gaW5kZXggY2E2NGExMjljNTk0Li5hMzg3ZDkyMzk2MmUgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwo+IEBAIC0xNzIsMTkg
KzE3MiwxMiBAQCBzdHJ1Y3Qga29tZWRhX2RldiAqa29tZWRhX2Rldl9jcmVhdGUoc3RydWN0IGRl
dmljZSAqZGV2KQo+ICAJc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiA9IHRvX3BsYXRmb3Jt
X2RldmljZShkZXYpOwo+ICAJY29uc3Qgc3RydWN0IGtvbWVkYV9wcm9kdWN0X2RhdGEgKnByb2R1
Y3Q7Cj4gIAlzdHJ1Y3Qga29tZWRhX2RldiAqbWRldjsKPiAtCXN0cnVjdCByZXNvdXJjZSAqaW9f
cmVzOwo+ICAJaW50IGVyciA9IDA7Cj4gCj4gIAlwcm9kdWN0ID0gb2ZfZGV2aWNlX2dldF9tYXRj
aF9kYXRhKGRldik7Cj4gIAlpZiAoIXByb2R1Y3QpCj4gIAkJcmV0dXJuIEVSUl9QVFIoLUVOT0RF
Vik7Cj4gCj4gLQlpb19yZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJD
RV9NRU0sIDApOwo+IC0JaWYgKCFpb19yZXMpIHsKPiAtCQlEUk1fRVJST1IoIk5vIHJlZ2lzdGVy
cyBkZWZpbmVkLlxuIik7Cj4gLQkJcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7Cj4gLQl9Cj4gLQo+
ICAJbWRldiA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqbWRldiksIEdGUF9LRVJORUwpOwo+
ICAJaWYgKCFtZGV2KQo+ICAJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwo+IEBAIC0xOTIsNyAr
MTg1LDcgQEAgc3RydWN0IGtvbWVkYV9kZXYgKmtvbWVkYV9kZXZfY3JlYXRlKHN0cnVjdCBkZXZp
Y2UgKmRldikKPiAgCW11dGV4X2luaXQoJm1kZXYtPmxvY2spOwo+IAo+ICAJbWRldi0+ZGV2ID0g
ZGV2Owo+IC0JbWRldi0+cmVnX2Jhc2UgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoZGV2LCBpb19y
ZXMpOwo+ICsJbWRldi0+cmVnX2Jhc2UgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2Uo
cGRldiwgMCk7Cj4gIAlpZiAoSVNfRVJSKG1kZXYtPnJlZ19iYXNlKSkgewo+ICAJCURSTV9FUlJP
UigiTWFwIHJlZ2lzdGVyIHNwYWNlIGZhaWxlZC5cbiIpOwo+ICAJCWVyciA9IFBUUl9FUlIobWRl
di0+cmVnX2Jhc2UpOwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
