Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E10DBAE78
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 09:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9486E147;
	Mon, 23 Sep 2019 07:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70044.outbound.protection.outlook.com [40.107.7.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8896E147
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 07:25:56 +0000 (UTC)
Received: from VE1PR08CA0030.eurprd08.prod.outlook.com (2603:10a6:803:104::43)
 by AM0PR08MB4466.eurprd08.prod.outlook.com (2603:10a6:208:141::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20; Mon, 23 Sep
 2019 07:25:52 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::204) by VE1PR08CA0030.outlook.office365.com
 (2603:10a6:803:104::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.21 via Frontend
 Transport; Mon, 23 Sep 2019 07:25:52 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20 via Frontend Transport; Mon, 23 Sep 2019 07:25:50 +0000
Received: ("Tessian outbound 968ab6b62146:v31");
 Mon, 23 Sep 2019 07:25:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dbd8fe14646136a0
X-CR-MTA-TID: 64aa7808
Received: from b3a8755af1cf.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.2.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FE654876-060F-458D-BFAA-76941B9F5D99.1; 
 Mon, 23 Sep 2019 07:25:39 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b3a8755af1cf.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 Sep 2019 07:25:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HaLvxJNEOiIyg4mKSOFcxpFhC3thUNmIfwbprBmMrbWsZuN74OxuaG+18keXKw81ADkzTEq9T6L+vFAay6wVXVcMhGymCDcGwItQySRSMAA8T5zfAbIinmoDDeGQ45uQVa4t0AbOmc/Lt/07NU+T5aIxRhcG6CJ64qXovk/B8Y/LMZc5myIq7l8AuS6WUm9D3KcYCOmKPd/WTQ/qohG4gmTHhOPYefBzBifhsoCrRSYwe2dnzouNkbABSIUSPXjJC5+uY4n9/0zXkkv6teZWCVX7ublVlk8YDiHV3jNAl5lH1E3Cl9RkDA3h9A66KXwq7VL1UPP/YD0/5hMzqI1eWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pc42HqrnBDTHHOdm2avo1PTMFLRBmaQg1yiBLhpLYGk=;
 b=k+mHraDy6k1m7IIoaY8Z5l4Gc+dm4OrRFh5dr8UouMDSx0o4nl/3VDikf4c2XfO6494AxuIN2f3VoeWHdaoDS/0968M0nKCPEfpGfcLL4Mymr2BF+dSJYbfjco+y8FXfv2OoZRJbzJhEiZzo0ozVdrBuodbuFpypo6TuODNKMllvCKhrfx5xoN+Bt3eVNl62/hVx+zuMK9mEHy0tl3kwsRhNhd4kwE0B+RMQkXjRP2ZbrmTZlpcVv/49P0s+H+fCuV51xPxrhVy6XQeyg2/xUS2UmAMgwoMnhnvrRE+XlOQiALTas6VqxUrhskxq9Ro2G+cmPkcsy0GkwIQgYnZN1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4799.eurprd08.prod.outlook.com (10.255.115.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Mon, 23 Sep 2019 07:25:37 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879%5]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 07:25:37 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [v1, 2/2] drm: Clear the fence pointer when writeback job signaled
Thread-Topic: [v1,2/2] drm: Clear the fence pointer when writeback job signaled
Thread-Index: AQHVceAYuYsxZ6juH0uAeBdpCl+Fkg==
Date: Mon, 23 Sep 2019 07:25:37 +0000
Message-ID: <20190923072529.GA17154@jamwan02-TSP300>
References: <1564571048-15029-3-git-send-email-lowry.li@arm.com>
In-Reply-To: <1564571048-15029-3-git-send-email-lowry.li@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0202.apcprd02.prod.outlook.com
 (2603:1096:201:20::14) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a0fd9ac0-8036-4e83-1588-08d73ff742dd
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VE1PR08MB4799; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4799:|VE1PR08MB4799:|AM0PR08MB4466:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB44661909262A74A8D100333CB3850@AM0PR08MB4466.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2958;OLM:2958;
x-forefront-prvs: 0169092318
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(136003)(396003)(366004)(39850400004)(376002)(346002)(199004)(189003)(14444005)(386003)(66066001)(4326008)(229853002)(478600001)(33656002)(6436002)(26005)(6636002)(6486002)(1076003)(25786009)(8936002)(186003)(316002)(7736002)(305945005)(58126008)(86362001)(81166006)(446003)(5660300002)(7416002)(6512007)(81156014)(476003)(11346002)(8676002)(486006)(9686003)(71190400001)(71200400001)(54906003)(66946007)(6116002)(3846002)(66556008)(66446008)(66476007)(52116002)(76176011)(33716001)(64756008)(14454004)(6246003)(99286004)(6506007)(55236004)(6862004)(256004)(102836004)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4799;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: ewhaOac6Azo+aYxhiG2WNz/lJFJWsunsw/YcI0vS6bMFEPNOu1Bv4oe2tz8YsUwAYYtvsPD8L3JliF7iBfplW5pmtKaG85RlhSTHqp2K0JMhkdn+6tNzVXHzLp2OQxuzZiU+JtIkn2WFFCA+YSyhTO0K6h922An+QL5ZBfZRVCUBsL/KJfimJ+K89uMzEZA8JtqlAdl0Z5D7nODO6OO9prZd64mMRKOxrU4788XlrnCcm3J+K7MxELIFBhkG1KqFMZ2tPvX/dzMzHjJFVrReOHLqnZAFP+cYwgJRKU3sOJNKKkVFVP1TLyA57e4q+q0LT5OwhocgBJ3k9onZFf5srGXAeCh89m1Rb3zyLe7N+zFJZEYALyqwrCHYXK78zIjOJFfNfWJY4RqXG7rMM5FOKYFs2ZYRpAVeqlyjbQBPqXI=
Content-ID: <B4ACF590EAAC004082B04121BF49F3A2@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4799
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(136003)(346002)(396003)(376002)(39860400002)(199004)(189003)(81156014)(126002)(6512007)(9686003)(356004)(47776003)(70586007)(11346002)(2906002)(476003)(14444005)(66066001)(6862004)(76130400001)(486006)(33656002)(46406003)(8676002)(336012)(22756006)(33716001)(6246003)(7736002)(14454004)(70206006)(26826003)(478600001)(305945005)(1076003)(446003)(50466002)(8746002)(5660300002)(316002)(76176011)(97756001)(6636002)(6486002)(63350400001)(107886003)(186003)(386003)(6506007)(102836004)(26005)(229853002)(8936002)(54906003)(23726003)(25786009)(86362001)(58126008)(81166006)(36906005)(99286004)(3846002)(4326008)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4466;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a7c5bf11-e077-406b-8ee2-08d73ff73a95
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB4466; 
NoDisclaimer: True
X-Forefront-PRVS: 0169092318
X-Microsoft-Antispam-Message-Info: BzWhUaPwbs82NWZ/e/Z9IQIRus/wzPYWkMoSMhWYj4cEYZAV+fM0HqGo6abAbkw6iz9fe7le0fTJOdUcUnwHSvAtsUtjAxzBhGfD3Xx8vO5VWujZbm5b2+k4B6WpNK0p+oAa11yWBZzFU6WHOpYQ0iiCw5M1GZrY6cfjCGz80Jk+17Lu2VgbtiVRfw2J/QqpsQUa/+ZXNhNoLY6Z9qlLXWeRS1IiVvEiOnrSagRrmm/zV57xdLEbyB8IJN3ouuMOpdRVkFNJEE5PLbbwGnPtpRHxZ1evNWuI9BivdTp7DIJlcq2xZPbu4/2iuFDBda5tPHAYe/sd76aR+O7RuVv8sWqMxkPfERzgGQwZpdnNhI1B+XvOTOkhoSIq+HTF2EN1gDEKG7UFf8erDj2VshTLxuBb1FWzGagmZ7le4Nf8sao=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2019 07:25:50.6070 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0fd9ac0-8036-4e83-1588-08d73ff742dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4466
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pc42HqrnBDTHHOdm2avo1PTMFLRBmaQg1yiBLhpLYGk=;
 b=3Utr1eS2cQqR9FhvbB2msaGvTmRJ1A48IFbMGiNkuYDrtbSigLYjqJ12qlSjr0Ps93MVbpggz7s/T/5ZAnNneJmyfsGkyNVt8qsw8huEvDp093b4plFuxNJecf3+0xd+zp9nqPMX5GhNTzmIAToa3W0dr/QWgndgKJh88KfqAjE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pc42HqrnBDTHHOdm2avo1PTMFLRBmaQg1yiBLhpLYGk=;
 b=3Utr1eS2cQqR9FhvbB2msaGvTmRJ1A48IFbMGiNkuYDrtbSigLYjqJ12qlSjr0Ps93MVbpggz7s/T/5ZAnNneJmyfsGkyNVt8qsw8huEvDp093b4plFuxNJecf3+0xd+zp9nqPMX5GhNTzmIAToa3W0dr/QWgndgKJh88KfqAjE=
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
Cc: "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 nd <nd@arm.com>, "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMTE6MDQ6NDVBTSArMDAwMCwgTG93cnkgTGkgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBEdXJpbmcgaXQgc2lnbmFscyB0aGUgY29tcGxldGlv
biBvZiBhIHdyaXRlYmFjayBqb2IsIGFmdGVyIHJlbGVhc2luZwo+IHRoZSBvdXRfZmVuY2UsIHdl
J2QgY2xlYXIgdGhlIHBvaW50ZXIuCj4gCj4gQ2hlY2sgaWYgZmVuY2UgbGVmdCBvdmVyIGluIGRy
bV93cml0ZWJhY2tfY2xlYW51cF9qb2IoKSwgcmVsZWFzZSBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxsb3dyeS5saUBhcm0uY29tPgo+IFJl
dmlld2VkLWJ5OiBCcmlhbiBTdGFya2V5IDxicmlhbi5zdGFya2V5QGFybS5jb20+CgpMb29rcyBn
b29kIHRvIG1lLgoKUmV2aWV3ZWQtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kg
Q2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KCndpbGwgcHVzaCBpdCB0byBkcm0tbWlz
Yy1maXhlcwoKSmFtZXMKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMg
fCAyMyArKysrKysrKysrKysrKystLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0
aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV93cml0ZWJhY2suYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMKPiBpbmRl
eCBmZjEzOGI2Li40M2Q5ZTNiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fd3Jp
dGViYWNrLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3dyaXRlYmFjay5jCj4gQEAgLTMy
NCw2ICszMjQsOSBAQCB2b2lkIGRybV93cml0ZWJhY2tfY2xlYW51cF9qb2Ioc3RydWN0IGRybV93
cml0ZWJhY2tfam9iICpqb2IpCj4gIAlpZiAoam9iLT5mYikKPiAgCQlkcm1fZnJhbWVidWZmZXJf
cHV0KGpvYi0+ZmIpOwo+ICAKPiArCWlmIChqb2ItPm91dF9mZW5jZSkKPiArCQlkbWFfZmVuY2Vf
cHV0KGpvYi0+b3V0X2ZlbmNlKTsKPiArCj4gIAlrZnJlZShqb2IpOwo+ICB9Cj4gIEVYUE9SVF9T
WU1CT0woZHJtX3dyaXRlYmFja19jbGVhbnVwX2pvYik7Cj4gQEAgLTM2NiwyNSArMzY5LDI5IEBA
IHN0YXRpYyB2b2lkIGNsZWFudXBfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4gIHsK
PiAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gIAlzdHJ1Y3QgZHJtX3dyaXRlYmFja19qb2IgKmpv
YjsKPiArCXN0cnVjdCBkbWFfZmVuY2UgKm91dF9mZW5jZTsKPiAgCj4gIAlzcGluX2xvY2tfaXJx
c2F2ZSgmd2JfY29ubmVjdG9yLT5qb2JfbG9jaywgZmxhZ3MpOwo+ICAJam9iID0gbGlzdF9maXJz
dF9lbnRyeV9vcl9udWxsKCZ3Yl9jb25uZWN0b3ItPmpvYl9xdWV1ZSwKPiAgCQkJCSAgICAgICBz
dHJ1Y3QgZHJtX3dyaXRlYmFja19qb2IsCj4gIAkJCQkgICAgICAgbGlzdF9lbnRyeSk7Cj4gLQlp
ZiAoam9iKSB7Cj4gKwlpZiAoam9iKQo+ICAJCWxpc3RfZGVsKCZqb2ItPmxpc3RfZW50cnkpOwo+
IC0JCWlmIChqb2ItPm91dF9mZW5jZSkgewo+IC0JCQlpZiAoc3RhdHVzKQo+IC0JCQkJZG1hX2Zl
bmNlX3NldF9lcnJvcihqb2ItPm91dF9mZW5jZSwgc3RhdHVzKTsKPiAtCQkJZG1hX2ZlbmNlX3Np
Z25hbChqb2ItPm91dF9mZW5jZSk7Cj4gLQkJCWRtYV9mZW5jZV9wdXQoam9iLT5vdXRfZmVuY2Up
Owo+IC0JCX0KPiAtCX0KPiArCj4gIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZ3Yl9jb25uZWN0
b3ItPmpvYl9sb2NrLCBmbGFncyk7Cj4gIAo+ICAJaWYgKFdBUk5fT04oIWpvYikpCj4gIAkJcmV0
dXJuOwo+ICAKPiArCW91dF9mZW5jZSA9IGpvYi0+b3V0X2ZlbmNlOwo+ICsJaWYgKG91dF9mZW5j
ZSkgewo+ICsJCWlmIChzdGF0dXMpCj4gKwkJCWRtYV9mZW5jZV9zZXRfZXJyb3Iob3V0X2ZlbmNl
LCBzdGF0dXMpOwo+ICsJCWRtYV9mZW5jZV9zaWduYWwob3V0X2ZlbmNlKTsKPiArCQlkbWFfZmVu
Y2VfcHV0KG91dF9mZW5jZSk7Cj4gKwkJam9iLT5vdXRfZmVuY2UgPSBOVUxMOwo+ICsJfQo+ICsK
PiAgCUlOSVRfV09SSygmam9iLT5jbGVhbnVwX3dvcmssIGNsZWFudXBfd29yayk7Cj4gIAlxdWV1
ZV93b3JrKHN5c3RlbV9sb25nX3dxLCAmam9iLT5jbGVhbnVwX3dvcmspOwo+ICB9Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
