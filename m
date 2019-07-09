Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F22D6329E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 10:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79B9893CB;
	Tue,  9 Jul 2019 08:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F27D893CB
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 08:07:47 +0000 (UTC)
Received: from DB6PR0802CA0031.eurprd08.prod.outlook.com (2603:10a6:4:a3::17)
 by VI1PR0801MB1854.eurprd08.prod.outlook.com (2603:10a6:800:5c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.19; Tue, 9 Jul
 2019 08:07:42 +0000
Received: from VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::201) by DB6PR0802CA0031.outlook.office365.com
 (2603:10a6:4:a3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18 via Frontend
 Transport; Tue, 9 Jul 2019 08:07:42 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT056.mail.protection.outlook.com (10.152.19.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 9 Jul 2019 08:07:39 +0000
Received: ("Tessian outbound 8297bef43b9f:v23");
 Tue, 09 Jul 2019 08:07:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d9cebda94dd906d5
X-CR-MTA-TID: 64aa7808
Received: from 32f22c036a3d.1 (cr-mta-lb-1.cr-mta-net [104.47.1.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EEBE03C3-A810-4E8A-8C78-B9762763F41C.1; 
 Tue, 09 Jul 2019 08:07:30 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 32f22c036a3d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 09 Jul 2019 08:07:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVSKQzqb37MA+ZNgNZVZX6kBILuruFCdfFjTTkf8SuXLc9Nm8fwcMO2jJdieozkF4D7rPBjF6mJvUnoToIHTmzLn8Ydp6X4QPy57taY5srjGJm4m8NWbB29IhB2AnVUG21vw/srXL51eXZ/v8qyMLG1AaO1u7QcaFREi8to2nTnMlHYW8okEJ4etEOJUteaR0G6mHAgM16w+xQ038AmL9NRk8XjuW/v0iqyRT4JqKxdf6AaQJISxRVvif8nT412fKSayLbn/YJF9FlFbWdctJhiPlcsRKBVAzObOfBrN824b6rC9inmTHLi50+Ucu06Vl1DbhCsMPI9V7dBzO4B7yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=me4uNEUSk+u4S2yk4geMAojyRGSnbPLFYhb9YRwl9oo=;
 b=kniaAlJmSjUaO3yGSmMjUt7f9PSZqw3RotQtJZqDlfzJcob2kmzFqjfVImq0trCPlLfPVuK+VP7Ta6S7cwLgwzDsxWrHypveIsRWFyO0GL1qhZlBCd2XoDIILTMxqERW6DfDtjituHzAMrFDW9oYG2WIHG99rvKrmthydybVSUp6MoM09Hv+QODfDmtcl6QL3eEoHM3UnV6KRq2qgmvlitr+1STwZUs6/hEmkCShlYQXiY5lMUbYEC4eSVw5EGr4mEOTM5cdQKS/R2EGSL6iTHRNvbMJsiblt21I/TQVCMjcPpVwmbR5Ai0k/m1rFf+QHus4N79GorDyqrjhriMwdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5070.eurprd08.prod.outlook.com (20.179.29.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Tue, 9 Jul 2019 08:07:28 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1%3]) with mapi id 15.20.2032.019; Tue, 9 Jul 2019
 08:07:28 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/5] drm/komeda: remove slave_planes property
Thread-Topic: [PATCH 2/5] drm/komeda: remove slave_planes property
Thread-Index: AQHVMyqatjQzpi6qbk6kIxwc6ribxqbB9FWA
Date: Tue, 9 Jul 2019 08:07:28 +0000
Message-ID: <20190709080721.GB22276@jamwan02-TSP300>
References: <20190705121006.26085-1-daniel.vetter@ffwll.ch>
 <20190705121006.26085-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20190705121006.26085-2-daniel.vetter@ffwll.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0074.apcprd03.prod.outlook.com
 (2603:1096:203:72::14) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 697bf08e-88de-4a13-a227-08d7044482d2
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5070; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB5070:|VI1PR0801MB1854:
X-Microsoft-Antispam-PRVS: <VI1PR0801MB1854D6A6AB2D22581746CCD4B3F10@VI1PR0801MB1854.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 0093C80C01
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(189003)(199004)(1076003)(73956011)(52116002)(66556008)(66476007)(66946007)(64756008)(66446008)(66066001)(14454004)(33716001)(6916009)(6436002)(6506007)(386003)(102836004)(71200400001)(71190400001)(53936002)(68736007)(55236004)(5660300002)(25786009)(9686003)(86362001)(6512007)(316002)(58126008)(33656002)(11346002)(6246003)(5024004)(256004)(2906002)(446003)(8936002)(478600001)(26005)(229853002)(4326008)(76176011)(6486002)(486006)(7736002)(476003)(305945005)(54906003)(6116002)(99286004)(3846002)(8676002)(81166006)(186003)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5070;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: wuJNwzhaP5bYjisRJGitauhpN04zFgmRa5SAEHWMqubK4+wsFRaE13sgzRS7IPkbFWRuvxQcldua3aZtj7gfcvrzp7m8IVWeW+xk5MPxJtym4NC3yzCLvfO4KPuwmvnduzVZhUAn0BeTQocd4unlCTjJiAttCGWhTW6aFryQBQsJYG7FGf7yB14XXAFqEdTMCG22VsjyIaYcTN8ML62JIUhoLpYATHAi20br79SBNWghrDw7DeOBT05McrdAC1mOh6uYVyDLb9QoCP56XzAJbS8huB6Qn7h8ytpk6Bxc3eR+oRPJSufd90ChXyMEASw+CViH6gzzLMmy0NihHuDq+Bw4vr3T9XhCuZxbX/x3EhMlUC9OL9S3J5xxlWYwT9El27BoXXSRwEy9Ou3K58QZnNV9is+IuHRV6ZRetb5VHME=
Content-ID: <8342729C03AFCF48A5E31270DD6444AE@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5070
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(346002)(396003)(136003)(39860400002)(2980300002)(189003)(199004)(8676002)(81156014)(81166006)(8936002)(6512007)(9686003)(8746002)(2906002)(7736002)(33716001)(63370400001)(76130400001)(476003)(6486002)(305945005)(70586007)(229853002)(6246003)(97756001)(486006)(86362001)(46406003)(5660300002)(63350400001)(446003)(11346002)(126002)(70206006)(3846002)(33656002)(6862004)(336012)(25786009)(26005)(4326008)(102836004)(50466002)(66066001)(6506007)(58126008)(186003)(478600001)(386003)(54906003)(316002)(5024004)(36906005)(14454004)(76176011)(22756006)(99286004)(1076003)(23726003)(26826003)(356004)(47776003)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0801MB1854;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2e02e2eb-9b18-48f5-bf39-08d704447c2a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0801MB1854; 
NoDisclaimer: True
X-Forefront-PRVS: 0093C80C01
X-Microsoft-Antispam-Message-Info: 1rWpudGvRn2J504kjfBCeY/mQVHaOrBQ+z0Tqg5zYXX4C4tMZua8Ac5wsLF4Rt3bRwFrwn0o4yJDxWDTW7cmNWSvEjO2/YGZAODN7ocrEy7VkXF3xDNem99CbI9678tltbZwy+BuDETOeR5bJGbP0/Wwq7rkQ3//kXqKB/Qnp3m39RMzjFU30MWXxaiTUdwbpMWd7WxGKZh9FZkolACCRBztfbLNQ1BWwMK81lATVNYMzpkGWXxvOlKu4NtGZIFFBS1ubVJqBV4Sy7teP5VcS/HhOyyFooiM9Oj4pfEL9k2o63qx/YIIt34z/pMpF3h15AF+01iqNK3IfpsLiJl+KoT2Q+96Qymb+fh11Cm/vagQ8AJO1mEM5mFY/T+7xKtdCJOs3elM8mc1gkrXYrFL85BsYn27bLX7Q5a4F2Yl6DA=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2019 08:07:39.3992 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 697bf08e-88de-4a13-a227-08d7044482d2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1854
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=me4uNEUSk+u4S2yk4geMAojyRGSnbPLFYhb9YRwl9oo=;
 b=YLr3NYC30k9CwFTMKpVYXsqZ3OotvrmzpcXm7m3RJm9ismRH6rvatJ1OrIDSaM0LUaN3SHXESOlS/YFI65ZHlUkykuDguC8wPMG7FgVpFiQ4uxqMLsYC2Q7EIFlz85i0PWChH4Pu+T61nmwH1vJt/S/Ch+jWSoUUidDe6RThruM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=me4uNEUSk+u4S2yk4geMAojyRGSnbPLFYhb9YRwl9oo=;
 b=YLr3NYC30k9CwFTMKpVYXsqZ3OotvrmzpcXm7m3RJm9ismRH6rvatJ1OrIDSaM0LUaN3SHXESOlS/YFI65ZHlUkykuDguC8wPMG7FgVpFiQ4uxqMLsYC2Q7EIFlz85i0PWChH4Pu+T61nmwH1vJt/S/Ch+jWSoUUidDe6RThruM=
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
Cc: nd <nd@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Mali DP Maintainers <malidp@foss.arm.com>,
 Daniel Vetter <daniel.vetter@intel.com>, "Lowry Li \(Arm
 Technology China\)" <Lowry.Li@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMDI6MTA6MDNQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBQcm9wZXJ0aWVzIGFyZSB1YXBpIGxpa2UgYW55dGhpbmcgZWxzZSwgd2l0aCBhbGwg
dGhlIHVzdWFsIHJ1bGVzCj4gcmVnYXJkaW5nIHJldmlldywgdGVzdGNhc2VzLCBvcGVuIHNvdXJj
ZSB1c2Vyc3BhY2UgLi4uIEZ1cnRoZXJtb3JlCj4gZHJpdmVyLXByaXZhdGUga21zIHByb3BlcnRp
ZXMgYXJlIGhpZ2hseSBkaXNjb3VyYWdlZCwgb3ZlciB0aGUgcGFzdAo+IGZldyB5ZWFycyB3ZSd2
ZSByZWFsaXplZCB3ZSBuZWVkIHRvIG1ha2UgYSBzZXJpb3VzIGVmZm9ydCBhdCBiZXR0ZXIKPiBz
dGFuZGFyZGl6aW5nIHRoaXMgc3R1ZmYuCj4gCj4gQWdhaW4gdGhpcyBwcm9iYWJseSBuZWVkcyBt
dWx0aXBsZSBwaWVjZXMgdG8gc29sdmUgdGhpcyBwcm9wZXJseToKPiAKPiAtIFRvIG1ha2UgcGxh
bmUgY29uZmlndXJhdGlvbiBsZXNzIHN1cnByaXNpbmcgdG8gdXNlcnNwYWNlIHlvdQo+ICAgcHJv
cGFibHkgbmVlZCB0byB2aXJ0dWFsaXplIHBsYW5lcywgYW5kIHJlb3JkZXIgd2hpY2ggbG9naWNh
bCBwbGFuZQo+ICAgeW91IG1hcCB0byB3aGljaCBwaHlzaWNhbCBvbmUgZHluYW1pY2FsbHkuIElu
c3RlYWQgb2YgZXhwb3NpbmcgYQo+ICAga29tZWRhLXNwZWNpZmljIGxpbWl0YXRpb24gdG8gdXNl
cnNwYWNlIGFuZCBleHBlY3RpbmcgdGhlbSB0byBkdHJ0Lgo+ICAgSSB0aGluayBtc20gYW5kIHJj
YXItZHUgZG8gdGhhdCBhbHJlYWR5IChhbmQgb3RoZXJzKSwgaWYgeW91IG5lZWQKPiAgIHBlb3Bs
ZSB0byBjaGF0IHdpdGggb3IgZXhhbXBsZSBjb2RlLgo+IAo+IC0gSWYgdGhpcyBpcyBuZWVkZWQg
Zm9yIHZhbGlkYXRpb24sIGFnYWluIC0+YXRvbWljX3ByaW50X3N0YXRlIGFuZCB0aGUKPiAgIGlu
ZnJhc3RydWN0dXJlIGFyb3VuZCB0aGF0IGlzIHlvdXIgZnJpZW5kLgo+IAo+IEZpeGVzOiAzYjlk
ZmE0ZWYyOGMgKCJkcm0va29tZWRhOiBBZGQgc2xhdmUgcGlwZWxpbmUgc3VwcG9ydCIpCj4gQ2M6
IExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGxvd3J5LmxpQGFybS5jb20+Cj4gQ2M6
IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdA
YXJtLmNvbT4KPiBDYzogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5jb20+Cj4gQ2M6IE1h
bGkgRFAgTWFpbnRhaW5lcnMgPG1hbGlkcEBmb3NzLmFybS5jb20+Cj4gQ2M6IEJyaWFuIFN0YXJr
ZXkgPGJyaWFuLnN0YXJrZXlAYXJtLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KCkhpIERhbmllbDoKVGhhbmsgeW91IGZvciB0aGUg
cGF0Y2ghCgpSZXZpZXdlZC1ieTogSmFtZXMgUWlhbiBXYW5nIChBcm0gVGVjaG5vbG9neSBDaGlu
YSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgoKPiAtLS0KPiAgLi4uL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgIHwgMjQgLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAu
Li4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5oICAgfCAgMyAtLS0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCAyNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gaW5kZXggZTg1MmRjMjdmMWI4
Li5mNDQwMDc4OGFiOTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gQEAgLTQ5OSwyNiArNDk5LDYgQEAgaW50IGtvbWVkYV9r
bXNfc2V0dXBfY3J0Y3Moc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprbXMsCj4gIAlyZXR1cm4gMDsK
PiAgfQo+ICAKPiAtc3RhdGljIGludCBrb21lZGFfY3J0Y19jcmVhdGVfc2xhdmVfcGxhbmVzX3By
b3BlcnR5KHN0cnVjdCBrb21lZGFfY3J0YyAqa2NydGMpCj4gLXsKPiAtCXN0cnVjdCBkcm1fY3J0
YyAqY3J0YyA9ICZrY3J0Yy0+YmFzZTsKPiAtCXN0cnVjdCBkcm1fcHJvcGVydHkgKnByb3A7Cj4g
LQo+IC0JaWYgKGtjcnRjLT5zbGF2ZV9wbGFuZXMgPT0gMCkKPiAtCQlyZXR1cm4gMDsKPiAtCj4g
LQlwcm9wID0gZHJtX3Byb3BlcnR5X2NyZWF0ZV9yYW5nZShjcnRjLT5kZXYsIERSTV9NT0RFX1BS
T1BfSU1NVVRBQkxFLAo+IC0JCQkJCSAic2xhdmVfcGxhbmVzIiwgMCwgVTMyX01BWCk7Cj4gLQlp
ZiAoIXByb3ApCj4gLQkJcmV0dXJuIC1FTk9NRU07Cj4gLQo+IC0JZHJtX29iamVjdF9hdHRhY2hf
cHJvcGVydHkoJmNydGMtPmJhc2UsIHByb3AsIGtjcnRjLT5zbGF2ZV9wbGFuZXMpOwo+IC0KPiAt
CWtjcnRjLT5zbGF2ZV9wbGFuZXNfcHJvcGVydHkgPSBwcm9wOwo+IC0KPiAtCXJldHVybiAwOwo+
IC19Cj4gLQo+ICBzdGF0aWMgc3RydWN0IGRybV9wbGFuZSAqCj4gIGdldF9jcnRjX3ByaW1hcnko
c3RydWN0IGtvbWVkYV9rbXNfZGV2ICprbXMsIHN0cnVjdCBrb21lZGFfY3J0YyAqY3J0YykKPiAg
ewo+IEBAIC01NTUsMTAgKzUzNSw2IEBAIHN0YXRpYyBpbnQga29tZWRhX2NydGNfYWRkKHN0cnVj
dCBrb21lZGFfa21zX2RldiAqa21zLAo+ICAKPiAgCWNydGMtPnBvcnQgPSBrY3J0Yy0+bWFzdGVy
LT5vZl9vdXRwdXRfcG9ydDsKPiAgCj4gLQllcnIgPSBrb21lZGFfY3J0Y19jcmVhdGVfc2xhdmVf
cGxhbmVzX3Byb3BlcnR5KGtjcnRjKTsKPiAtCWlmIChlcnIpCj4gLQkJcmV0dXJuIGVycjsKPiAt
Cj4gIAlyZXR1cm4gZXJyOwo+ICB9Cj4gIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2ttcy5oCj4gaW5kZXggMjc3NWYzNGJmNGFiLi5jNTQ1Y2I5NjNk
NDAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfa21zLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9rbXMuaAo+IEBAIC05NCw5ICs5NCw2IEBAIHN0cnVjdCBrb21lZGFfY3J0YyB7Cj4gIAo+ICAJ
LyoqIEBkaXNhYmxlX2RvbmU6IHRoaXMgZmxpcF9kb25lIGlzIGZvciB0cmFjaW5nIHRoZSBkaXNh
YmxlICovCj4gIAlzdHJ1Y3QgY29tcGxldGlvbiAqZGlzYWJsZV9kb25lOwo+IC0KPiAtCS8qKiBA
c2xhdmVfcGxhbmVzX3Byb3BlcnR5OiBwcm9wZXJ0eSBmb3Igc2xhdmVzIG9mIHRoZSBwbGFuZXMg
Ki8KPiAtCXN0cnVjdCBkcm1fcHJvcGVydHkgKnNsYXZlX3BsYW5lc19wcm9wZXJ0eTsKPiAgfTsK
PiAgCj4gIC8qKgo+IC0tIAo+IDIuMjAuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
