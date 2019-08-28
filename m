Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AE6A047D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 16:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9212897C3;
	Wed, 28 Aug 2019 14:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150053.outbound.protection.outlook.com [40.107.15.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5C8897C3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 14:15:31 +0000 (UTC)
Received: from VE1PR08CA0034.eurprd08.prod.outlook.com (2603:10a6:803:104::47)
 by VE1PR08MB4960.eurprd08.prod.outlook.com (2603:10a6:803:110::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Wed, 28 Aug
 2019 14:15:28 +0000
Received: from AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::201) by VE1PR08CA0034.outlook.office365.com
 (2603:10a6:803:104::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.15 via Frontend
 Transport; Wed, 28 Aug 2019 14:15:27 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT012.mail.protection.outlook.com (10.152.16.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Wed, 28 Aug 2019 14:15:26 +0000
Received: ("Tessian outbound f83cc93ed55d:v27");
 Wed, 28 Aug 2019 14:15:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f6fd50135d310d0b
X-CR-MTA-TID: 64aa7808
Received: from d5fa0f03b023.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.13.55]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 42BE70C4-5852-4A8B-8BE1-86D65CF91CAD.1; 
 Wed, 28 Aug 2019 14:15:18 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d5fa0f03b023.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Aug 2019 14:15:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCaztgUMiYNXIdfgQ43le807idTIVgNTNu1fO/zdl9QhJs0idAgzKgBnb96b0ztNX8+zsRWK/n5CELWWCJGRCo6NFt8riYrYQ+br/CAJOzyKHJ78VjxrHO0OHKAc/60sT1+zk+muLXwBSb7QAUTMVo4SnWb2egbqA83HZEo1IR44wDUTXNBUVYwpAMd/g1d4vKCElvLfWcM1LmqopS7oCfBX5kR4Emcyo44rWGS0GHETyt73qqGTuEoMIOJWD2RjJtUVNUShlINdFBSz2mYMU60J8JLHU7GMgEypwrNK5N/i8CDDs8Y0ZGim79WfTkH1FrcrfVKxQ30vSjBqX/+Ikg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZqcVlCLan3/+bLPZskwRqac0IqP+LojW2MhkLBeCH0=;
 b=UHstXD2KJPih/AUbqrqC/vFcVakO+ps6N1hEb+ziAGzcVAdex+6olYW5HcIcRUAd+P9AtIoCBTsO8NGiPLjqSoEa3BFp8QtBuxgurPBfWfoBh0tZGpFySg6QrUmj6fF2l9B4gZB3B3iPv6uPOt9hpyzjPQJEgYriPnUPS+TUUeEyHPyT+FrCLlahZi5hd+Wc/bDV4J8HAMdjI2dE5jTvW7UOLe56OXPL17+tinQB1CkEJCv7LJunKT1mQsRw/MGC8NkhUQnpqdvr82XRo9PrIa1CyDGh9TPv8cWak3aOd7/DkBKbKOMcJ/YmHiyif+us90wxSJmsClt9TC32acnTbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4878.eurprd08.prod.outlook.com (10.255.113.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 28 Aug 2019 14:15:16 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::d9f5:7cb8:41e8:17af]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::d9f5:7cb8:41e8:17af%7]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 14:15:16 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH] drm/komeda: Add ACLK rate to sysfs
Thread-Topic: [PATCH] drm/komeda: Add ACLK rate to sysfs
Thread-Index: AQHVXZBFvBwgvZ1PNEmL4p2YP+CqdacQmt0A
Date: Wed, 28 Aug 2019 14:15:15 +0000
Message-ID: <20190828141508.GA6738@jamwan02-TSP300>
References: <20190828110342.45936-1-mihail.atanassov@arm.com>
In-Reply-To: <20190828110342.45936-1-mihail.atanassov@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0192.apcprd02.prod.outlook.com
 (2603:1096:201:21::28) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a35a7476-d122-46a0-da41-08d72bc22c7b
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4878; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4878:|VE1PR08MB4960:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB4960EB93BDA8EDA2DB63EE73B3A30@VE1PR08MB4960.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:478;OLM:478;
x-forefront-prvs: 014304E855
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(199004)(189003)(33656002)(71200400001)(6486002)(305945005)(5660300002)(186003)(2906002)(7736002)(81166006)(14454004)(25786009)(8936002)(33716001)(4326008)(76176011)(81156014)(8676002)(6246003)(486006)(476003)(446003)(99286004)(86362001)(6636002)(478600001)(11346002)(229853002)(52116002)(53936002)(26005)(316002)(6116002)(58126008)(386003)(66946007)(6862004)(102836004)(6506007)(55236004)(54906003)(1076003)(66066001)(6436002)(71190400001)(3846002)(6512007)(256004)(66556008)(66446008)(64756008)(9686003)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4878;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: lUkPCCvL738cnEv/3KMkyI4dEGJ6xwPuSKlPypqCwodRpVXO7PBH7zaufUrH94xTZXtcuBcIgpSFSveDaALBHC2qsjcoUdHN1XJDyptEVzhNLsrJszn+3RMkr+LoadLQfzYcWZdGCY/+5KfIBJzDArL4BcLMA8V3PRA3lbnd4f+5P93dlw5+q8NLLsJ9V7HexlvWl6RPDsh4wk80C/SbUeH7aycaDRKVJ88GYK3S0974BuwNgA78b0lEVdsIflPBzYlKbSaKbZFuIdjRs+fHwcmET/0IFtFdOfWgyFdOs4tMmNdT7ab6i6dxPFdakQxbAH5Hxah/t6kzgjrqXYAefNgExmH8xmtKKknOOYWONP+ebD+J7CmkVYmfUlgY607cOiV/0YILKPGQTvHiSIQwrg7k6YS1qAcySaAV8yTJ368=
Content-ID: <1C0F61E017C2E44C94A001AFC8D43881@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4878
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(376002)(346002)(396003)(136003)(2980300002)(199004)(189003)(97756001)(70206006)(486006)(6636002)(25786009)(46406003)(336012)(126002)(70586007)(11346002)(446003)(86362001)(63350400001)(386003)(5660300002)(6512007)(76130400001)(26826003)(6116002)(478600001)(2906002)(4326008)(23726003)(476003)(356004)(3846002)(63370400001)(9686003)(6506007)(81166006)(81156014)(8676002)(14454004)(76176011)(47776003)(8936002)(26005)(186003)(22756006)(102836004)(50466002)(66066001)(36906005)(305945005)(58126008)(316002)(7736002)(1076003)(99286004)(229853002)(33656002)(54906003)(33716001)(8746002)(6246003)(6862004)(107886003)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4960;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 10d378bc-9074-43a2-e6e5-08d72bc2257f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4960; 
NoDisclaimer: True
X-Forefront-PRVS: 014304E855
X-Microsoft-Antispam-Message-Info: AQbA0xb2fuUXmTVao74Ah0HahVqr/TNEz733k8zmGEN+RKrypRcbqvb7U1yphYC2jWq+liiIxRjMBGrghwj2YrZ+LWbwmThfNiBGU44O94zuCQMxzvd/pAsENByMsL80I6fhAceioja5nBGobGF9JJLp9Bkt5ChiK+skCOnn7RIhD68RmwyDLpzPflnLRkILq3mCYsmx25FHPaaumxxtbpQW+qSYtueR4HwWkcPo/xoqrXPyy7rOxzN5+jNWiDE7aLWDgV0ziWjlzwUXrIbsWfNnxhdMH+nPW3vCI21QhBuJ3Bv/hUx60qc3prZBW7KFNKDrHqWEUmee6QCmFfMytv8ke1B9IveXVjLxGpY5Kl7jSfZTckKaASWQczTmsfpHFweEmQq157biDaHcTdNDQ3BeaDeTKvk8HJDzL+T7cgY=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 14:15:26.5438 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a35a7476-d122-46a0-da41-08d72bc22c7b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4960
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZqcVlCLan3/+bLPZskwRqac0IqP+LojW2MhkLBeCH0=;
 b=qHOkV4LBeMliPdoNBluQIvr4xyhvvzJFziLmPi/oWXS/s7fs4j8laWZVc/jC/6m6hE+W1hke6+wgeIiM5314XWLN3DnzHMpKj47vV/xZxBH38etGqf6mj2z7RiB2/yt0hm3dJ/c5AzW/ZZqOeXyiBvj+zVaNhffJYal4BpQsQhE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZqcVlCLan3/+bLPZskwRqac0IqP+LojW2MhkLBeCH0=;
 b=qHOkV4LBeMliPdoNBluQIvr4xyhvvzJFziLmPi/oWXS/s7fs4j8laWZVc/jC/6m6hE+W1hke6+wgeIiM5314XWLN3DnzHMpKj47vV/xZxBH38etGqf6mj2z7RiB2/yt0hm3dJ/c5AzW/ZZqOeXyiBvj+zVaNhffJYal4BpQsQhE=
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

SGkgTWloYWlsOgoKTG9va3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdh
bmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+CgpKYW1l
cy4KCk9uIFdlZCwgQXVnIDI4LCAyMDE5IGF0IDExOjAzOjQ5QU0gKzAwMDAsIE1paGFpbCBBdGFu
YXNzb3Ygd3JvdGU6Cj4gRXhwb3NlIG5vZGUgd2l0aCB0aGUgbmFtZSAnYWNsa19oeicKPiAKPiBT
aWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5j
IHwgMTAgKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9k
ZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jCj4g
aW5kZXggMDE0MmVlOTkxOTU3Li5lOGQ2NzM5NWEzYjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwo+IEBAIC05MSw5ICs5MSwxOSBA
QCBjb25maWdfaWRfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmli
dXRlICphdHRyLCBjaGFyICpidWYpCj4gIH0KPiAgc3RhdGljIERFVklDRV9BVFRSX1JPKGNvbmZp
Z19pZCk7Cj4gIAo+ICtzdGF0aWMgc3NpemVfdAo+ICthY2xrX2h6X3Nob3coc3RydWN0IGRldmlj
ZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmKQo+ICt7Cj4g
KwlzdHJ1Y3Qga29tZWRhX2RldiAqbWRldiA9IGRldl90b19tZGV2KGRldik7Cj4gKwo+ICsJcmV0
dXJuIHNucHJpbnRmKGJ1ZiwgUEFHRV9TSVpFLCAiJWx1XG4iLCBjbGtfZ2V0X3JhdGUobWRldi0+
YWNsaykpOwo+ICt9Cj4gK3N0YXRpYyBERVZJQ0VfQVRUUl9STyhhY2xrX2h6KTsKPiArCj4gIHN0
YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICprb21lZGFfc3lzZnNfZW50cmllc1tdID0gewo+ICAJJmRl
dl9hdHRyX2NvcmVfaWQuYXR0ciwKPiAgCSZkZXZfYXR0cl9jb25maWdfaWQuYXR0ciwKPiArCSZk
ZXZfYXR0cl9hY2xrX2h6LmF0dHIsCj4gIAlOVUxMLAo+ICB9Owo+ICAKPiAtLSAKPiAyLjIyLjAK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
