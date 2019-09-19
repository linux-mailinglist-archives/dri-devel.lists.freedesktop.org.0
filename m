Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 555C8B7D1D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 16:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BEED6F72C;
	Thu, 19 Sep 2019 14:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50048.outbound.protection.outlook.com [40.107.5.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07196F72C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 14:43:48 +0000 (UTC)
Received: from VE1PR08CA0035.eurprd08.prod.outlook.com (2603:10a6:803:104::48)
 by AM6PR08MB3910.eurprd08.prod.outlook.com (2603:10a6:20b:6f::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.23; Thu, 19 Sep
 2019 14:43:44 +0000
Received: from AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::208) by VE1PR08CA0035.outlook.office365.com
 (2603:10a6:803:104::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.21 via Frontend
 Transport; Thu, 19 Sep 2019 14:43:44 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT035.mail.protection.outlook.com (10.152.16.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20 via Frontend Transport; Thu, 19 Sep 2019 14:43:43 +0000
Received: ("Tessian outbound d5a1f2820a4f:v31");
 Thu, 19 Sep 2019 14:43:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f985572841a05ff6
X-CR-MTA-TID: 64aa7808
Received: from f75c82ad0c16.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.8.58]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3538D5D3-4880-4593-9DF2-03AAEBFD2C93.1; 
 Thu, 19 Sep 2019 14:43:37 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2058.outbound.protection.outlook.com [104.47.8.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f75c82ad0c16.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 Sep 2019 14:43:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ka0OKV2pdlb7aueWSmOx4zBuO8MLmsylyz/2OFZiLJg2R34K4q6D1R9aVWRPev/B2PqAoMRjI2u4alB5JXRc26ue0Uo1KxGivxt2R8Pav2YUcDVvKp+KAPV6DBkbh2ufVFLy3qPj0eNBfDmTJNMpEok+BQIbUcg9DC3uImi0RL484LBNK8R0/l8NmPmRnEzPOK+cbv/T1OcjP/yd/Zz2Pj1ebCpKLtErFiokMM+XJoqnfFjQVcVZgz1sql8R1dzPGMeeNy8QKgZ8Da6xbqeQceofIpwN7JihtSEe8IDasTzdCuAVPaBsHLV2QPAx4GAYKlDMWw/6/sty1VdSCLDt3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEVWTGLbSwNUJqcuIjqq7IqSQBK1jSMGipGpujHsPRA=;
 b=aH98PUTow9puKowVYYOR814PZo59TMDuskDThNCTgjWSQWg7YNFzklZsNuDBAPZk/tmIK9PnaeDFadwxaOH9VvrTFcyLPc0grFAt/qzvBo+PtbeJS0q9OrOUbuQTaWxP+aNWwQt27Z0J3occuxlUXCISoGb6LgHj3UD2738qXGdmgCf4KkpyoL2karfxolhWaI25uYSNJgPlOlA6wz8/3EkeNlEkdDWOyCMzbDCjxG4nbzyILK/TnWE3lsPiv0B+WXKyfQgPoXUQ2xHHmUyPx7rt5DTHHXw5pKDh4XITSYT6/1vsLKLA++taO2yoL1TAjD2g9IkcYPq4HPJtVrzG2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4206.eurprd08.prod.outlook.com (20.178.205.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 19 Sep 2019 14:43:36 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::f164:4d79:79f:dc6f]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::f164:4d79:79f:dc6f%7]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 14:43:36 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/komeda: Fix FLIP_COMPLETE timestamp on CRTC enable
Thread-Topic: [PATCH] drm/komeda: Fix FLIP_COMPLETE timestamp on CRTC enable
Thread-Index: AQHVbu5XybbezBNH+kaEyHcWelehf6czE10A
Date: Thu, 19 Sep 2019 14:43:35 +0000
Message-ID: <1731001.VqgqlKjhFN@e123338-lin>
References: <20190919132759.18358-1-mihail.atanassov@arm.com>
In-Reply-To: <20190919132759.18358-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0255.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::27) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f80c17fb-705b-4e8e-4f8e-08d73d0fc4e9
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB4206; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB4206:|VI1PR08MB4206:|AM6PR08MB3910:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB39104C4A010B13B5A35839C88F890@AM6PR08MB3910.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 016572D96D
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(366004)(346002)(39860400002)(396003)(136003)(376002)(189003)(199004)(256004)(6916009)(81156014)(81166006)(7736002)(8676002)(54906003)(8936002)(478600001)(14454004)(486006)(11346002)(305945005)(2351001)(86362001)(476003)(71190400001)(64756008)(3846002)(25786009)(102836004)(6486002)(229853002)(6436002)(5640700003)(99286004)(4326008)(6246003)(66556008)(5660300002)(76176011)(33716001)(66476007)(66066001)(446003)(71200400001)(2501003)(386003)(6116002)(6506007)(66946007)(6512007)(66446008)(26005)(52116002)(2906002)(186003)(9686003)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4206;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: Buht71Y+RSTNYcfHzmMTQyCAc91Ht9wmJyNCscTA+sIfCqwpp7aV2FuXVU3DGh49vIC3PSSZxhcAF4zkYxppy0jQ/GJcTP2kGhd71FIcnIDz1lQ/+7xxJVSXXMjGHdslRy5jn2e6Fi5t427Wt19X2AflV3mN47pzEsNRKLlEmaEhVucJFdO8yJRIii1zHvkB69ikB0criqDQ0Q+n4EmOAOPM05XE2QLe6KZ3BE/JJzv5LmlL1NNcjfapYUNGUwotE4kIRbS6dgE89l+yS6cxpS31WThAcn+7YUoXKZ9hL5zx6P018xMODU8eYjl8yZ9V9D4vm/seE1Trgk/Br3Pt5sxCKb0FqxuSSQrxA8hqnGfCI2qLJYoqtIbZO10qlE+uin9lJkBQ0AqiMVlg35n9unzlAg/5dwaDljPVaX1IrFg=
Content-ID: <DD02967929B48648A4B3100FECF50639@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4206
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(346002)(396003)(376002)(136003)(39860400002)(189003)(199004)(81166006)(316002)(2501003)(9686003)(6506007)(6916009)(6486002)(4326008)(81156014)(486006)(33716001)(8936002)(46406003)(5640700003)(356004)(478600001)(25786009)(36906005)(26826003)(8676002)(47776003)(7736002)(14454004)(22756006)(66066001)(6512007)(446003)(99286004)(86362001)(6246003)(305945005)(63350400001)(97756001)(50466002)(70206006)(186003)(76176011)(5660300002)(229853002)(76130400001)(8746002)(54906003)(70586007)(3846002)(6116002)(336012)(11346002)(102836004)(26005)(126002)(2906002)(107886003)(23726003)(476003)(386003)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3910;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: deb039be-0761-4974-8241-08d73d0fc05d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM6PR08MB3910; 
NoDisclaimer: True
X-Forefront-PRVS: 016572D96D
X-Microsoft-Antispam-Message-Info: VSC+x8JhaUB+gy34ShEa4qOYx2ya56CWfROSONnEKd68lxuVYLOW7hbDMPueV69aFzdJAUrVN3r0767Jm93On3KjT4J8Qab9VJKw52jwwKvmtZCRwA8nfJVxb4sVcCtgaqWocbWEJHjTUf7HXZA5wcOlfhyWIz2nX0VSShS8rucf5i+yCxy8l1vlDAPDpE4YPnUyr1J4S7RNBaFMQF9rINKUOTMotRyx8gxlnHjv+R3Ej1e7VgXziJ5k4q1y/lHS3EtiwIF3ZOSdCKs5HYAct9tfOE7JqhaPGSjk0f47DIty68T2tP+WfO2cW8Dyejh+8AEGLc6LdrRB2Rs+kTt3VB2UgnF5l/d9C9HHL0AwtpdspRGtHVbytW85t/zbQbNfUfXwBD0z2hBwLo1pC5ZVpfB1eTwF4P7pEsSnhRkwyJI=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2019 14:43:43.3072 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f80c17fb-705b-4e8e-4f8e-08d73d0fc4e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3910
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEVWTGLbSwNUJqcuIjqq7IqSQBK1jSMGipGpujHsPRA=;
 b=JDnZKZQBLg+m0d+oYRTBdyjNVSXRqwhd4/jUCDTHChp/FrxvVFckE7AiXYQl6wAudeOuvJflKvM+PYr9hW1PnAr0u+l0CYlK+NReN6sLmKYSg7+aGv0X7Uvv2tPbTFm/VIXHEjyHoz1/EN+epvAMKBH09fMdvyEN8Sd5AZ8DV2c=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEVWTGLbSwNUJqcuIjqq7IqSQBK1jSMGipGpujHsPRA=;
 b=JDnZKZQBLg+m0d+oYRTBdyjNVSXRqwhd4/jUCDTHChp/FrxvVFckE7AiXYQl6wAudeOuvJflKvM+PYr9hW1PnAr0u+l0CYlK+NReN6sLmKYSg7+aGv0X7Uvv2tPbTFm/VIXHEjyHoz1/EN+epvAMKBH09fMdvyEN8Sd5AZ8DV2c=
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1cnNkYXksIDE5IFNlcHRlbWJlciAyMDE5IDE0OjMwOjAyIEJTVCBNaWhhaWwgQXRhbmFz
c292IHdyb3RlOgo+IFdoZW4gaW5pdGlhbGx5IHR1cm5pbmcgYSBjcnRjIG9uLCBkcm1fcmVzZXRf
dmJsYW5rX3RpbWVzdGFtcCB3aWxsCj4gc2V0IHRoZSB2YmxhbmsgdGltZXN0YW1wIHRvIDAgZm9y
IGFueSBkcml2ZXIgdGhhdCBkb2Vzbid0IHByb3ZpZGUKPiBhIC0+Z2V0X3ZibGFua190aW1lc3Rh
bXAoKSBob29rLgo+IAo+IFVuZm9ydHVuYXRlbHksIHRoZSBGTElQX0NPTVBMRVRFIGV2ZW50IGRl
cGVuZHMgb24gdGhhdCB0aW1lc3RhbXAsCj4gYW5kIHRoZSBvbmx5IHdheSB0byByZWdlbmVyYXRl
IGEgdmFsaWQgb25lIGlzIHRvIGhhdmUgdmJsYW5rCj4gaW50ZXJydXB0cyBlbmFibGVkIGFuZCBo
YXZlIGEgdmFsaWQgaW4tSVNSIGNhbGwgdG8KPiBkcm1fY3J0Y19oYW5kbGVfdmJsYW5rLgo+IAo+
IFdyYXAgdGhlIGNhbGwgdG8ga29tZWRhX2NydGNfZG9fZmx1c2ggaW4gLT5hdG9taWNfZW5hYmxl
KCkgd2l0aCBhCj4gZHJtX2NydGNfdmJsYW5rX3tnZXQscHV0fSBwYWlyIHNvIHdlIGNhbiBoYXZl
IGEgdmJsYW5rIElTUiBwcmlvciB0bwo+IHRoZSBGTElQX0NPTVBMRVRFIElTUiAob3IgbW9yZSBs
aWtlbHksIHRoZXknbGwgZ2V0IGhhbmRsZWQgaW4gdGhlIHNhbWUKPiBJU1IsIHdoaWNoIGlzIGVx
dWFsbHkgdmFsaWQpLgo+IAo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4g
Q2M6IExpdml1IER1ZGF1IDxMaXZpdS5EdWRhdUBhcm0uY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1p
aGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jIHwgMiArKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+IGluZGV4IGY0NDAwNzg4YWI5NC4uODc0
MjBhNzY3YmM0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2NydGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2NydGMuYwo+IEBAIC0yNTgsNyArMjU4LDkgQEAga29tZWRhX2NydGNfYXRvbWlj
X2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gIHsKPiAgCWtvbWVkYV9jcnRjX3ByZXBh
cmUodG9fa2NydGMoY3J0YykpOwo+ICAJZHJtX2NydGNfdmJsYW5rX29uKGNydGMpOwo+ICsJV0FS
Tl9PTihkcm1fY3J0Y192YmxhbmtfZ2V0KGNydGMpKTsKPiAgCWtvbWVkYV9jcnRjX2RvX2ZsdXNo
KGNydGMsIG9sZCk7Cj4gKwlkcm1fY3J0Y192YmxhbmtfcHV0KGNydGMpOwo+ICB9Cj4gIAo+ICBz
dGF0aWMgdm9pZAo+IAoKUGxlYXNlIGlnbm9yZSwgdGhpcyBkb2Vzbid0IHdvcmsgKHBhZ2UgZmxp
cHMgYWZ0ZXIgNSBzZWNvbmRzIGRvbid0IGdldAphbiB1cGRhdGVkIHRpbWVzdGFtcCBiZWNhdXNl
IG9mIHRoZSBkZWxheWVkIHZzeW5jIGRpc2FibGUpLiBJJ2xsIHB1c2gKYSB2MiBzb29uIHdoZXJl
IHZzeW5jIG9uL29mZiB0cmFja3MgY3J0YyBlbmFibGUvZGlzYWJsZS4KCi0tIApNaWhhaWwKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
