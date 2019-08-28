Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 363EBA06D0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 17:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF3789CF1;
	Wed, 28 Aug 2019 15:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10077.outbound.protection.outlook.com [40.107.1.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E4A89CF1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 15:58:33 +0000 (UTC)
Received: from VI1PR0801CA0067.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::11) by VI1PR0801MB1854.eurprd08.prod.outlook.com
 (2603:10a6:800:5c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.18; Wed, 28 Aug
 2019 15:58:27 +0000
Received: from DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::204) by VI1PR0801CA0067.outlook.office365.com
 (2603:10a6:800:7d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 28 Aug 2019 15:58:27 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT013.mail.protection.outlook.com (10.152.20.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Wed, 28 Aug 2019 15:58:26 +0000
Received: ("Tessian outbound eec90fc31dfb:v27");
 Wed, 28 Aug 2019 15:58:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0ae999a15fb73dcf
X-CR-MTA-TID: 64aa7808
Received: from f28fddc466e7.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.58]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E0489B90-4A2C-448A-89DA-398B96FAAC05.1; 
 Wed, 28 Aug 2019 15:58:15 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2058.outbound.protection.outlook.com [104.47.9.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f28fddc466e7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Wed, 28 Aug 2019 15:58:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FM28+jiYOj323zil1qb8Vj6tM9gfTR8SRieJsbQwqVT9KAsp6Q5diEh5vxIvaE3lff2pql/xUR6KIRSBP5SBa/r78R1gd7ammJhqW5w9a/lUWH8s8p4v0w0XmNxNSEVPVvm//CQ33pG0Are3iO0i5pZLlxg0wtyGmCveIgGENTJFNxh7/CJDrU8Msyl7eiAL/gwEi4xBfJI3GuftEvPGhVBA+VtKNzmo5pVBbNFFzIA/Y5Acu3SM2GnhKzkvkAmar/3mFGpldW6Av0dmLxgHVdO5BKrx5SnkjuwJRiWMY/k/YAPLco2Yh++VkpGbi14cbJp3mYh3SMPOy/kOxL0FGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93unK/ykfx9sj9ufmO4dtMU8a+6HUj0AVW7MCTEcu1w=;
 b=gSPOapkVt3mzWukS4SXqgLomjkgfkCeDDHVJ4DB3hJZhg0yxQI5xXIZ9qYjsA4eKfYQ8B0+ukFCLDDgGTmazG0yzgoQ2aeNg9DrgALYw3wr1chzqi1VO4cLl4EbgZdmvoR4lXnwQkA77jZaZWvU3CA1W8W9Eu1ex9s3I2ghZrOJaNoTzKv+/u5/xzDq7+meRTeBeqTR1kmQhsXA3bXLzovsM9wU97zHXX7UCafJENx0YJgb9u+LfyQ7ZZfHXqk/aei4j6xhuVzCYH7jG64oX65pRvFYzrTijKZM1fSC6KlJa2Iznjf1JRKrEO0a3uuTj5ZkCQx7vvPfNvAh5/8Aqkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4941.eurprd08.prod.outlook.com (10.255.158.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 28 Aug 2019 15:58:13 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::d9f5:7cb8:41e8:17af]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::d9f5:7cb8:41e8:17af%7]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 15:58:13 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Ayan Halder <Ayan.Halder@arm.com>
Subject: Re: [PATCH v2] drm/komeda: Reordered the komeda's de-init functions
Thread-Topic: [PATCH v2] drm/komeda: Reordered the komeda's de-init functions
Thread-Index: AQHVXbFOPtkOyMBO7Em37TZu77ub2acQt18A
Date: Wed, 28 Aug 2019 15:58:12 +0000
Message-ID: <20190828155806.GA7020@jamwan02-TSP300>
References: <20190828145945.15904-1-ayan.halder@arm.com>
In-Reply-To: <20190828145945.15904-1-ayan.halder@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0214.apcprd02.prod.outlook.com
 (2603:1096:201:20::26) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 380840c1-fe37-4343-b966-08d72bd08fb7
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4941; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4941:|VI1PR0801MB1854:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB18544F1F553CF9ECC8C43018B3A30@VI1PR0801MB1854.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:480;OLM:480;
x-forefront-prvs: 014304E855
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(366004)(346002)(396003)(136003)(376002)(199004)(189003)(2906002)(5660300002)(6486002)(71200400001)(1076003)(6862004)(6246003)(6506007)(99286004)(86362001)(256004)(476003)(5024004)(55236004)(486006)(14454004)(6436002)(386003)(14444005)(7736002)(446003)(11346002)(71190400001)(33716001)(6636002)(53936002)(186003)(64756008)(8676002)(102836004)(478600001)(229853002)(66066001)(26005)(66946007)(33656002)(81156014)(81166006)(6116002)(3846002)(9686003)(305945005)(58126008)(52116002)(66446008)(66556008)(8936002)(316002)(6512007)(76176011)(54906003)(4326008)(66476007)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4941;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: RSMrLT8B3xilQ27XUZF0r2Bum5GQ7gIjpMOuti2yibhMmgqvx1r4B6xjz4jp7Ls2RqBuIRHix4yIIaR0GbObDZEDzfeMEZ4DZFdjLBSgE4i9wp+CSW9hJXmVCcKl/JHzn7wh01LCRPI6Ykd+6fIwfEKw9PkwinEQfjwUSGVekmwqOjlXt7J0Sy1lDzx157TzdXyTFhjanvYus60NQbzyvQU/x3GV/yjxfnmKprLrWL7oCx4f/RoXYNL43DAL9Y/j/n4I9TvIxlpok/75n00kgP0ZcAz13qtSByPt6vPiMv8Hu8uZuB3lw40sP669qkAIL4z8AKgdu9MttLKNsc2SL6okW3rX612GXywMxt88LH/j15B/WAgleFjsf8qOJcpp7vLXr+ksnIjVVv1KBl86UaJm+MjQdXhqcHQAdy3GdbU=
Content-ID: <9FF1DCB4C259C34FB1CE18D447440577@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4941
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(136003)(39860400002)(376002)(396003)(2980300002)(189003)(199004)(23726003)(5660300002)(8936002)(2906002)(305945005)(81156014)(8676002)(8746002)(3846002)(6116002)(7736002)(81166006)(66066001)(47776003)(70206006)(70586007)(14454004)(1076003)(26826003)(22756006)(478600001)(33656002)(76130400001)(46406003)(6506007)(386003)(316002)(33716001)(6636002)(486006)(58126008)(54906003)(336012)(11346002)(446003)(63370400001)(63350400001)(229853002)(126002)(76176011)(99286004)(186003)(102836004)(26005)(476003)(86362001)(14444005)(5024004)(97756001)(50466002)(356004)(25786009)(6486002)(6862004)(4326008)(6512007)(9686003)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0801MB1854;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7f83286c-c64c-452a-bd70-08d72bd087bd
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0801MB1854; 
NoDisclaimer: True
X-Forefront-PRVS: 014304E855
X-Microsoft-Antispam-Message-Info: x/WfVae54rjiQJMdekBT/YxKcfuDHrxzGW769bHgckiL3XV3oPQe6NSDjzbgvt+FBLWgxTLfO7kuDm8pEJZPFukFyuJxEsLGvMjn8D8z0gl9OeebsCAB0+q63Y3+OCpNOkjN9/f9QDJJVSnLeQ89V/SF6w0QkUfahwM7gh7eGpCfrLRkgHM5Eq7zbPE4D8DrWCsj+6Mt84pkbO7psuCSrIEsh+jMSYuTQIER14f6FFsE5nV0e4ijeZReIf5XwzdTnqEpBAzjPiabBvENoEzpis3PIP9N/DWmBpOCuEsOLu/X9ejmgmr1qdknK/P7hmM9W0Xrhc4VChfk5pnqdaZLhLWbCgiPySI0lhjRQLa5t7FqZjB8404xm9oBv/VZwpFx8Fdjv8q1jWx4zcFjUvodQVLYYtv6ZW2OwolybN96dB8=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 15:58:26.0048 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 380840c1-fe37-4343-b966-08d72bd08fb7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1854
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93unK/ykfx9sj9ufmO4dtMU8a+6HUj0AVW7MCTEcu1w=;
 b=qV/GynHFUxNQgHbBCLjPovrEVYzB9pAy4m78PBnlPtY0y/+1n3UYL7CgJzUujTX7W7BsrkYDdR1gta9zTNQTUXC3XNgevHdxB2kXs3BAubhHCFakH+8wbq6jkK7bV4msq+0Dc6ZLvGmQd2OCFxFMIJyyS08VJdqLvlnmOMYtYWo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93unK/ykfx9sj9ufmO4dtMU8a+6HUj0AVW7MCTEcu1w=;
 b=qV/GynHFUxNQgHbBCLjPovrEVYzB9pAy4m78PBnlPtY0y/+1n3UYL7CgJzUujTX7W7BsrkYDdR1gta9zTNQTUXC3XNgevHdxB2kXs3BAubhHCFakH+8wbq6jkK7bV4msq+0Dc6ZLvGmQd2OCFxFMIJyyS08VJdqLvlnmOMYtYWo=
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "malidp@foss.arm.com" <malidp@foss.arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMDM6MDA6MTlQTSArMDAwMCwgQXlhbiBIYWxkZXIgd3Jv
dGU6Cj4gRnJvbTogQXlhbiBIYWxkZXIgPEF5YW4uSGFsZGVyQGFybS5jb20+Cj4gCj4gVGhlIGRl
LWluaXQgcm91dGluZSBzaG91bGQgYmUgZG9pbmcgdGhlIGZvbGxvd2luZyBpbiBvcmRlcjotCj4g
MS4gVW5yZWdpc3RlciB0aGUgZHJtIGRldmljZQo+IDIuIFNodXQgZG93biB0aGUgY3J0Y3MgLSBm
YWlsaW5nIHRvIGRvIHRoaXMgbWlnaHQgY2F1c2UgYSBjb25uZWN0b3IgbGVha2FnZQo+IFNlZSB0
aGUgJ2NvbW1pdCAxMDljNGQxOGU1NzQgKCJkcm0vYXJtL21hbGlkcDogRW5zdXJlIHRoYXQgdGhl
IGNydGNzIGFyZQo+IHNodXRkb3duIGJlZm9yZSByZW1vdmluZyBhbnkgZW5jb2Rlci9jb25uZWN0
b3IiKScKPiAzLiBEaXNhYmxlIHRoZSBpbnRlcnJ1cHRzCj4gNC4gVW5iaW5kIHRoZSBjb21wb25l
bnRzCj4gNS4gRnJlZSB1cCBEUk0gbW9kZV9jb25maWcgaW5mbwo+IAo+IENoYW5nZXMgZnJvbSB2
MTotCj4gMS4gUmUtb3JkZXJlZCB0aGUgaGVhZGVyIGZpbGVzIGluY2x1c2lvbgo+IDIuIFJlYmFz
ZWQgb24gdG9wIG9mIHRoZSBsYXRlc3QgZHJtLW1pc2MtZml4ZXMKPiAKPiBTaWduZWQtb2ZmLWJ5
OiBBeWFuIEt1bWFyIEhhbGRlciA8YXlhbi5oYWxkZXJAYXJtLmNvbT4KPiBSZXZpZXdlZC1ieTog
TWloYWlsIEF0YW5hc3NvdiA8bWloYWlsLmF0YW5hc3NvdkBhcm0uY29tPgoKTG9va3MgZ29vZCB0
byBtZS4KClJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5h
KSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cgo+IC0tLQo+ICAuLi4vZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2ttcy5jICAgfCAyMyArKysrKysrKysrKystLS0tLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCj4gaW5kZXgg
MWYwZTNmNGU4ZDc0Li42OWQ5ZTI2YzYwYzggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYwo+IEBAIC0xNCw4ICsxNCw4IEBACj4gICNp
bmNsdWRlIDxkcm0vZHJtX2dlbV9jbWFfaGVscGVyLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX2dl
bV9mcmFtZWJ1ZmZlcl9oZWxwZXIuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1faXJxLmg+Cj4gLSNp
bmNsdWRlIDxkcm0vZHJtX3ZibGFuay5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxw
ZXIuaD4KPiArI2luY2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+Cj4gIAo+ICAjaW5jbHVkZSAia29t
ZWRhX2Rldi5oIgo+ICAjaW5jbHVkZSAia29tZWRhX2ZyYW1lYnVmZmVyLmgiCj4gQEAgLTMwNiwx
MSArMzA2LDExIEBAIHN0cnVjdCBrb21lZGFfa21zX2RldiAqa29tZWRhX2ttc19hdHRhY2goc3Ry
dWN0IGtvbWVkYV9kZXYgKm1kZXYpCj4gIAkJCSAgICAgICBrb21lZGFfa21zX2lycV9oYW5kbGVy
LCBJUlFGX1NIQVJFRCwKPiAgCQkJICAgICAgIGRybS0+ZHJpdmVyLT5uYW1lLCBkcm0pOwo+ICAJ
aWYgKGVycikKPiAtCQlnb3RvIGNsZWFudXBfbW9kZV9jb25maWc7Cj4gKwkJZ290byBmcmVlX2Nv
bXBvbmVudF9iaW5kaW5nOwo+ICAKPiAgCWVyciA9IG1kZXYtPmZ1bmNzLT5lbmFibGVfaXJxKG1k
ZXYpOwo+ICAJaWYgKGVycikKPiAtCQlnb3RvIGNsZWFudXBfbW9kZV9jb25maWc7Cj4gKwkJZ290
byBmcmVlX2NvbXBvbmVudF9iaW5kaW5nOwo+ICAKPiAgCWRybS0+aXJxX2VuYWJsZWQgPSB0cnVl
Owo+ICAKPiBAQCAtMzE4LDE1ICszMTgsMjEgQEAgc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprb21l
ZGFfa21zX2F0dGFjaChzdHJ1Y3Qga29tZWRhX2RldiAqbWRldikKPiAgCj4gIAllcnIgPSBkcm1f
ZGV2X3JlZ2lzdGVyKGRybSwgMCk7Cj4gIAlpZiAoZXJyKQo+IC0JCWdvdG8gY2xlYW51cF9tb2Rl
X2NvbmZpZzsKPiArCQlnb3RvIGZyZWVfaW50ZXJydXB0czsKPiAgCj4gIAlyZXR1cm4ga21zOwo+
ICAKPiAtY2xlYW51cF9tb2RlX2NvbmZpZzoKPiArZnJlZV9pbnRlcnJ1cHRzOgo+ICAJZHJtX2tt
c19oZWxwZXJfcG9sbF9maW5pKGRybSk7Cj4gIAlkcm0tPmlycV9lbmFibGVkID0gZmFsc2U7Cj4g
KwltZGV2LT5mdW5jcy0+ZGlzYWJsZV9pcnEobWRldik7Cj4gK2ZyZWVfY29tcG9uZW50X2JpbmRp
bmc6Cj4gKwljb21wb25lbnRfdW5iaW5kX2FsbChtZGV2LT5kZXYsIGRybSk7Cj4gK2NsZWFudXBf
bW9kZV9jb25maWc6Cj4gIAlkcm1fbW9kZV9jb25maWdfY2xlYW51cChkcm0pOwo+ICAJa29tZWRh
X2ttc19jbGVhbnVwX3ByaXZhdGVfb2JqcyhrbXMpOwo+ICsJZHJtLT5kZXZfcHJpdmF0ZSA9IE5V
TEw7Cj4gKwlkcm1fZGV2X3B1dChkcm0pOwo+ICBmcmVlX2ttczoKPiAgCWtmcmVlKGttcyk7Cj4g
IAlyZXR1cm4gRVJSX1BUUihlcnIpOwo+IEBAIC0zMzcsMTMgKzM0MywxNCBAQCB2b2lkIGtvbWVk
YV9rbXNfZGV0YWNoKHN0cnVjdCBrb21lZGFfa21zX2RldiAqa21zKQo+ICAJc3RydWN0IGRybV9k
ZXZpY2UgKmRybSA9ICZrbXMtPmJhc2U7Cj4gIAlzdHJ1Y3Qga29tZWRhX2RldiAqbWRldiA9IGRy
bS0+ZGV2X3ByaXZhdGU7Cj4gIAo+IC0JZHJtLT5pcnFfZW5hYmxlZCA9IGZhbHNlOwo+IC0JbWRl
di0+ZnVuY3MtPmRpc2FibGVfaXJxKG1kZXYpOwo+ICAJZHJtX2Rldl91bnJlZ2lzdGVyKGRybSk7
Cj4gIAlkcm1fa21zX2hlbHBlcl9wb2xsX2ZpbmkoZHJtKTsKPiArCWRybV9hdG9taWNfaGVscGVy
X3NodXRkb3duKGRybSk7Cj4gKwlkcm0tPmlycV9lbmFibGVkID0gZmFsc2U7Cj4gKwltZGV2LT5m
dW5jcy0+ZGlzYWJsZV9pcnEobWRldik7Cj4gIAljb21wb25lbnRfdW5iaW5kX2FsbChtZGV2LT5k
ZXYsIGRybSk7Cj4gLQlrb21lZGFfa21zX2NsZWFudXBfcHJpdmF0ZV9vYmpzKGttcyk7Cj4gIAlk
cm1fbW9kZV9jb25maWdfY2xlYW51cChkcm0pOwo+ICsJa29tZWRhX2ttc19jbGVhbnVwX3ByaXZh
dGVfb2JqcyhrbXMpOwo+ICAJZHJtLT5kZXZfcHJpdmF0ZSA9IE5VTEw7Cj4gIAlkcm1fZGV2X3B1
dChkcm0pOwo+ICB9Cj4gLS0gCj4gMi4yMS4wCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
