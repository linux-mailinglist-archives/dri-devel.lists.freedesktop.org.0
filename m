Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BA7B5F66
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 10:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E7C6EE55;
	Wed, 18 Sep 2019 08:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140074.outbound.protection.outlook.com [40.107.14.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97166EE59
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 08:46:02 +0000 (UTC)
Received: from VI1PR0802CA0024.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::34) by AM6PR08MB4168.eurprd08.prod.outlook.com
 (2603:10a6:20b:aa::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.23; Wed, 18 Sep
 2019 08:45:59 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::202) by VI1PR0802CA0024.outlook.office365.com
 (2603:10a6:800:aa::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.17 via Frontend
 Transport; Wed, 18 Sep 2019 08:45:59 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.14 via Frontend Transport; Wed, 18 Sep 2019 08:45:57 +0000
Received: ("Tessian outbound 96594883d423:v31");
 Wed, 18 Sep 2019 08:45:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 68d02fd94812b779
X-CR-MTA-TID: 64aa7808
Received: from d8a1bdaed9dc.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.1.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A09BE950-8DEE-4FDC-886D-8D096D840428.1; 
 Wed, 18 Sep 2019 08:45:47 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d8a1bdaed9dc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Wed, 18 Sep 2019 08:45:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oc26Yb90ZZttYDX1xQruNJIui8+5rtS/FkJZ/Phrw/LjFrid87t4DOFiNgSNM9Mcew48b/fT0l2VrB2pK2Oi1q/aSWsvsfTAS8A/uilCW1PCzqKMawzXXX7qzwzgcl8VO1UC4nfNWXcKMn9CI4WtyrP/X3VDmOn7YEE9LOBF6aEQzzryd3AKb1pbdvEaF19AUOg+dWnc+nBEdAMokvHR7lsOXNDIsz+XbolxYXtVK2yR5Rn9JHVL0bfsOce31GeVKrZmSmS7nzyXRAwj8M1Q0btbwd6Hd/7osD1refrWGj4kFQiv3wdoCzsOzFxjG0VtkM+gyaohqcDZubAa+0t0RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uozPW9wrGG1To1OhWRGdh4X8h8OqnA3+3yV9hyszeC8=;
 b=JCYuciJ/0wTm5IO2g+SpavU6n/MHS/LiXRg8oO4rgsnbL2/2/Mmw7delruklmAskRNENOHd3j+7iQyXqnYPpN55CCLWYJuoh5l4KC1vHuLS6OSUyTLi/3ySP4G9EJ7dbCdnDoJ1hJvGrIYsGwjr5hl3Us+yizjdbNl7SyUSRNB3ZoAJvevmrmbFgOAXMhGSWchZsxsupA/BBslJTXQAuKc97sSLt9uBew8wYj/VwxNawdtoiJPVQk4klDlhuTQ97lp+37MNuYU7ehAELLEuAIlwLdWSLmYGNqA/HjaKRn6I2ErGW4il5EElDVEpLrQ+OBm1JrQ/B3f21ArP11Xk9iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4861.eurprd08.prod.outlook.com (10.255.113.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.23; Wed, 18 Sep 2019 08:45:45 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879%5]) with mapi id 15.20.2284.009; Wed, 18 Sep 2019
 08:45:45 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: drm/komeda: Adds register dump support for gcu, lup and dou
Thread-Topic: drm/komeda: Adds register dump support for gcu, lup and dou
Thread-Index: AQHVbf12PeRzgf9iNUSXCU4D645PPw==
Date: Wed, 18 Sep 2019 08:45:45 +0000
Message-ID: <20190918084538.GA21336@jamwan02-TSP300>
References: <20190917112525.25490-1-lowry.li@arm.com>
In-Reply-To: <20190917112525.25490-1-lowry.li@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0208.apcprd02.prod.outlook.com
 (2603:1096:201:20::20) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6d000c43-faf7-469f-3c14-08d73c149fce
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4861; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4861:|VE1PR08MB4861:|AM6PR08MB4168:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4168236CBEF6C90837FF5B01B38E0@AM6PR08MB4168.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1332;OLM:1247;
x-forefront-prvs: 01644DCF4A
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(136003)(396003)(39860400002)(346002)(366004)(189003)(199004)(6486002)(33656002)(66066001)(6636002)(446003)(305945005)(14454004)(7736002)(4326008)(25786009)(478600001)(54906003)(476003)(11346002)(26005)(58126008)(81166006)(81156014)(8936002)(3846002)(5660300002)(1076003)(186003)(33716001)(102836004)(6862004)(8676002)(6116002)(66446008)(66946007)(6246003)(2906002)(66476007)(486006)(316002)(86362001)(229853002)(66556008)(64756008)(256004)(55236004)(52116002)(9686003)(71200400001)(6512007)(71190400001)(99286004)(76176011)(386003)(6506007)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4861;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: E7TbXTQn4YaHtDKgioczpfSCXq8zF63nQpJodZlhDsVhIoJluQs4BR3zosQHpweJiyJUoS1ky06N5SHOx5gPNSHaGT9zBCFRlcwRgF8oze3OvF6UY9ngAmBSEke1cH2spLvbWsQx58bPxsn1PHGdeiMgIbPJLBUFqA8CgOPKAQqRhK4fDF1KpdQi/wQ37Yq/UYYClZgpg9d1Ov63hYsYcLcWD3R2Rloc9iGuh+tC0rc+YvsHoQgqePX8EfVrlJd3kdthFZN++YUDtEiuGVU3V/sWrSDdzZJ8Vb4Hcn+fde2pz6QpWHAJTp4jypf7X+4I8nL3AXdpIXs2jZUBUeJKqb3KCl69DuBHB+6R9+yr7nROorKXH3vDgc+pPEOga5eyz4quvPinzsvl7AmUwqAvtUmHML3qnOH0uFA6uidyzGU=
Content-ID: <A1DCF1D3733E0B4A9B27A4105951E9DC@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4861
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(136003)(346002)(376002)(396003)(39860400002)(199004)(189003)(58126008)(5660300002)(316002)(47776003)(70586007)(70206006)(97756001)(76130400001)(7736002)(36906005)(54906003)(356004)(486006)(305945005)(66066001)(33716001)(476003)(86362001)(126002)(14454004)(4326008)(446003)(33656002)(81166006)(11346002)(229853002)(26826003)(50466002)(3846002)(2906002)(8746002)(8936002)(26005)(46406003)(8676002)(186003)(81156014)(63350400001)(76176011)(23726003)(6862004)(6246003)(99286004)(6506007)(336012)(22756006)(1076003)(6116002)(478600001)(6486002)(9686003)(386003)(6512007)(102836004)(6636002)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4168;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: aea5e035-1758-4759-73c1-08d73c149893
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM6PR08MB4168; 
NoDisclaimer: True
X-Forefront-PRVS: 01644DCF4A
X-Microsoft-Antispam-Message-Info: R1ZmIWeeHUd/GYusHwvk/XN8ysG62SRQ+yCbDFRtaWtqKm6gOZecGbCDi9/KIYMsNLahI8rpkU8dbABTF9FldJB79MSDiqIGoaU8UBJOzjyG1JlWGkR0cofWt4OZpoC7nX73drSvVWoka3Q5f0I565TZ5R7Mbv0aP/zDdwBbJvVYOFqrrsb+RRkodMs1p+wS0/SO6THgONnzDjz9ITP+roZnc32pJLc8HIzz1Z8mOAixesCky2KMTEaxUG1FjONvkySuCub3+h0UspnIkGXTR9hs5EYrXyRktsADqJMSm7Au3+rRXoQHgFBg3s18d3i+Bj95mUZWbbWNDvtyZ+JeKat5C8Zkrmo8R4LQPng5tyikWCO3PSDDWjGI0deT9ZQP6rT/WHy2AxcZyQ8vtUwlcPbqigEr1fZ4H08uM9p4WTY=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2019 08:45:57.3329 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d000c43-faf7-469f-3c14-08d73c149fce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4168
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uozPW9wrGG1To1OhWRGdh4X8h8OqnA3+3yV9hyszeC8=;
 b=yIIQuX1/c7fgwh1rl3dAlSSKbCtYsFTL2kHpPZEdvEo1kXx3dcgiNrNnmXAX0yt7foTZYRquOURhgSUEG2U/LijSxXoHToPRoS/PqxbbejZ/zpvk1yPSdJlkmPqEjvoVzL8tl51qlljSIYhQCFJcYWKnmN4wGH0WvsZQtkAgw/4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uozPW9wrGG1To1OhWRGdh4X8h8OqnA3+3yV9hyszeC8=;
 b=yIIQuX1/c7fgwh1rl3dAlSSKbCtYsFTL2kHpPZEdvEo1kXx3dcgiNrNnmXAX0yt7foTZYRquOURhgSUEG2U/LijSxXoHToPRoS/PqxbbejZ/zpvk1yPSdJlkmPqEjvoVzL8tl51qlljSIYhQCFJcYWKnmN4wGH0WvsZQtkAgw/4=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMTE6MjU6NDRBTSArMDAwMCwgTG93cnkgTGkgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBGcm9tOiAiTG93cnkgTGkgKEFybSBUZWNobm9sb2d5
IENoaW5hKSIgPExvd3J5LkxpQGFybS5jb20+Cj4gCj4gQWRkcyB0byBzdXBwb3J0IHJlZ2lzdGVy
IGR1bXAgb24gbHB1IGFuZCBkb3Ugb2YgcGlwZWxpbmUgYW5kIGdjdSBvbiBENzEKPiAKPiBDaGFu
Z2VzIHNpbmNlIHYxOgo+IC0gRm9yIGEgY29uc3RhbnQgZm9ybWF0IHdpdGhvdXQgYWRkaXRpb25h
bCBhcmd1bWVudHMsIHVzZSBzZXFfcHV0cygpCj4gaW5zdGVhZCBvZiBzZXFfcHJpbnRmKCkuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8bG93cnku
bGlAYXJtLmNvbT4KPiAtLS0KPiAgLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBv
bmVudC5jICAgIHwgODYgKysrKysrKysrKysrKysrKysrLQo+ICAuLi4vZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYyAgfCAyMyArKy0tLQo+ICAuLi4vZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuaCAgfCAgMiArCj4gIC4uLi9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMgICB8ICAyICsKPiAgNCBmaWxlcyBjaGFuZ2VkLCAx
MDEgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwo+IGluZGV4
IDQwNzNhNDUyZTI0YS4uN2JhM2MxMzUxNDJjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwo+IEBAIC0xMjA2
LDYgKzEyMDYsOTAgQEAgaW50IGQ3MV9wcm9iZV9ibG9jayhzdHJ1Y3QgZDcxX2RldiAqZDcxLAo+
ICAJcmV0dXJuIGVycjsKPiAgfQo+ICAKPiArc3RhdGljIHZvaWQgZDcxX2djdV9kdW1wKHN0cnVj
dCBkNzFfZGV2ICpkNzEsIHN0cnVjdCBzZXFfZmlsZSAqc2YpCj4gK3sKPiArCXUzMiB2WzVdOwo+
ICsKPiArCXNlcV9wdXRzKHNmLCAiXG4tLS0tLS0gR0NVIC0tLS0tLVxuIik7Cj4gKwo+ICsJZ2V0
X3ZhbHVlc19mcm9tX3JlZyhkNzEtPmdjdV9hZGRyLCAwLCAzLCB2KTsKPiArCXNlcV9wcmludGYo
c2YsICJHTEJfQVJDSF9JRDpcdFx0MHglWFxuIiwgdlswXSk7Cj4gKwlzZXFfcHJpbnRmKHNmLCAi
R0xCX0NPUkVfSUQ6XHRcdDB4JVhcbiIsIHZbMV0pOwo+ICsJc2VxX3ByaW50ZihzZiwgIkdMQl9D
T1JFX0lORk86XHRcdDB4JVhcbiIsIHZbMl0pOwo+ICsKPiArCWdldF92YWx1ZXNfZnJvbV9yZWco
ZDcxLT5nY3VfYWRkciwgMHgxMCwgMSwgdik7Cj4gKwlzZXFfcHJpbnRmKHNmLCAiR0xCX0lSUV9T
VEFUVVM6XHRcdDB4JVhcbiIsIHZbMF0pOwo+ICsKPiArCWdldF92YWx1ZXNfZnJvbV9yZWcoZDcx
LT5nY3VfYWRkciwgMHhBMCwgNSwgdik7Cj4gKwlzZXFfcHJpbnRmKHNmLCAiR0NVX0lSUV9SQVdf
U1RBVFVTOlx0MHglWFxuIiwgdlswXSk7Cj4gKwlzZXFfcHJpbnRmKHNmLCAiR0NVX0lSUV9DTEVB
UjpcdFx0MHglWFxuIiwgdlsxXSk7Cj4gKwlzZXFfcHJpbnRmKHNmLCAiR0NVX0lSUV9NQVNLOlx0
XHQweCVYXG4iLCB2WzJdKTsKPiArCXNlcV9wcmludGYoc2YsICJHQ1VfSVJRX1NUQVRVUzpcdFx0
MHglWFxuIiwgdlszXSk7Cj4gKwlzZXFfcHJpbnRmKHNmLCAiR0NVX1NUQVRVUzpcdFx0MHglWFxu
Iiwgdls0XSk7Cj4gKwo+ICsJZ2V0X3ZhbHVlc19mcm9tX3JlZyhkNzEtPmdjdV9hZGRyLCAweEQw
LCAzLCB2KTsKPiArCXNlcV9wcmludGYoc2YsICJHQ1VfQ09OVFJPTDpcdFx0MHglWFxuIiwgdlsw
XSk7Cj4gKwlzZXFfcHJpbnRmKHNmLCAiR0NVX0NPTkZJR19WQUxJRDA6XHQweCVYXG4iLCB2WzFd
KTsKPiArCXNlcV9wcmludGYoc2YsICJHQ1VfQ09ORklHX1ZBTElEMTpcdDB4JVhcbiIsIHZbMl0p
Owo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBkNzFfbHB1X2R1bXAoc3RydWN0IGQ3MV9waXBlbGlu
ZSAqcGlwZSwgc3RydWN0IHNlcV9maWxlICpzZikKPiArewo+ICsJdTMyIHZbNl07Cj4gKwo+ICsJ
c2VxX3ByaW50ZihzZiwgIlxuLS0tLS0tIExQVSVkIC0tLS0tLVxuIiwgcGlwZS0+YmFzZS5pZCk7
Cj4gKwo+ICsJZHVtcF9ibG9ja19oZWFkZXIoc2YsIHBpcGUtPmxwdV9hZGRyKTsKPiArCj4gKwln
ZXRfdmFsdWVzX2Zyb21fcmVnKHBpcGUtPmxwdV9hZGRyLCAweEEwLCA2LCB2KTsKPiArCXNlcV9w
cmludGYoc2YsICJMUFVfSVJRX1JBV19TVEFUVVM6XHQweCVYXG4iLCB2WzBdKTsKPiArCXNlcV9w
cmludGYoc2YsICJMUFVfSVJRX0NMRUFSOlx0XHQweCVYXG4iLCB2WzFdKTsKPiArCXNlcV9wcmlu
dGYoc2YsICJMUFVfSVJRX01BU0s6XHRcdDB4JVhcbiIsIHZbMl0pOwo+ICsJc2VxX3ByaW50Zihz
ZiwgIkxQVV9JUlFfU1RBVFVTOlx0XHQweCVYXG4iLCB2WzNdKTsKPiArCXNlcV9wcmludGYoc2Ys
ICJMUFVfU1RBVFVTOlx0XHQweCVYXG4iLCB2WzRdKTsKPiArCXNlcV9wcmludGYoc2YsICJMUFVf
VEJVX1NUQVRVUzpcdFx0MHglWFxuIiwgdls1XSk7Cj4gKwo+ICsJZ2V0X3ZhbHVlc19mcm9tX3Jl
ZyhwaXBlLT5scHVfYWRkciwgMHhDMCwgMSwgdik7Cj4gKwlzZXFfcHJpbnRmKHNmLCAiTFBVX0lO
Rk86XHRcdDB4JVhcbiIsIHZbMF0pOwo+ICsKPiArCWdldF92YWx1ZXNfZnJvbV9yZWcocGlwZS0+
bHB1X2FkZHIsIDB4RDAsIDMsIHYpOwo+ICsJc2VxX3ByaW50ZihzZiwgIkxQVV9SQVhJX0NPTlRS
T0w6XHQweCVYXG4iLCB2WzBdKTsKPiArCXNlcV9wcmludGYoc2YsICJMUFVfV0FYSV9DT05UUk9M
Olx0MHglWFxuIiwgdlsxXSk7Cj4gKwlzZXFfcHJpbnRmKHNmLCAiTFBVX1RCVV9DT05UUk9MOlx0
MHglWFxuIiwgdlsyXSk7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIGQ3MV9kb3VfZHVtcChzdHJ1
Y3QgZDcxX3BpcGVsaW5lICpwaXBlLCBzdHJ1Y3Qgc2VxX2ZpbGUgKnNmKQo+ICt7Cj4gKwl1MzIg
dls1XTsKPiArCj4gKwlzZXFfcHJpbnRmKHNmLCAiXG4tLS0tLS0gRE9VJWQgLS0tLS0tXG4iLCBw
aXBlLT5iYXNlLmlkKTsKPiArCj4gKwlkdW1wX2Jsb2NrX2hlYWRlcihzZiwgcGlwZS0+ZG91X2Fk
ZHIpOwo+ICsKPiArCWdldF92YWx1ZXNfZnJvbV9yZWcocGlwZS0+ZG91X2FkZHIsIDB4QTAsIDUs
IHYpOwo+ICsJc2VxX3ByaW50ZihzZiwgIkRPVV9JUlFfUkFXX1NUQVRVUzpcdDB4JVhcbiIsIHZb
MF0pOwo+ICsJc2VxX3ByaW50ZihzZiwgIkRPVV9JUlFfQ0xFQVI6XHRcdDB4JVhcbiIsIHZbMV0p
Owo+ICsJc2VxX3ByaW50ZihzZiwgIkRPVV9JUlFfTUFTSzpcdFx0MHglWFxuIiwgdlsyXSk7Cj4g
KwlzZXFfcHJpbnRmKHNmLCAiRE9VX0lSUV9TVEFUVVM6XHRcdDB4JVhcbiIsIHZbM10pOwo+ICsJ
c2VxX3ByaW50ZihzZiwgIkRPVV9TVEFUVVM6XHRcdDB4JVhcbiIsIHZbNF0pOwo+ICt9Cj4gKwo+
ICtzdGF0aWMgdm9pZCBkNzFfcGlwZWxpbmVfZHVtcChzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICpw
aXBlLCBzdHJ1Y3Qgc2VxX2ZpbGUgKnNmKQo+ICt7Cj4gKwlzdHJ1Y3QgZDcxX3BpcGVsaW5lICpk
NzFfcGlwZSA9IHRvX2Q3MV9waXBlbGluZShwaXBlKTsKPiArCj4gKwlkNzFfbHB1X2R1bXAoZDcx
X3BpcGUsIHNmKTsKPiArCWQ3MV9kb3VfZHVtcChkNzFfcGlwZSwgc2YpOwo+ICt9Cj4gKwo+ICBj
b25zdCBzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lX2Z1bmNzIGQ3MV9waXBlbGluZV9mdW5jcyA9IHsK
PiAtCS5kb3duc2NhbGluZ19jbGtfY2hlY2sgPSBkNzFfZG93bnNjYWxpbmdfY2xrX2NoZWNrLAo+
ICsJLmRvd25zY2FsaW5nX2Nsa19jaGVjawk9IGQ3MV9kb3duc2NhbGluZ19jbGtfY2hlY2ssCj4g
KwkuZHVtcF9yZWdpc3RlcgkJPSBkNzFfcGlwZWxpbmVfZHVtcCwKPiAgfTsKPiArCj4gK3ZvaWQg
ZDcxX2R1bXAoc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYsIHN0cnVjdCBzZXFfZmlsZSAqc2YpCj4g
K3sKPiArCXN0cnVjdCBkNzFfZGV2ICpkNzEgPSBtZGV2LT5jaGlwX2RhdGE7Cj4gKwo+ICsJZDcx
X2djdV9kdW1wKGQ3MSwgc2YpOwo+ICt9Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYwo+IGluZGV4IGQ1NjdhYjdlZDMxNC4uMGI3NjNlYTU0
M2FjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcx
L2Q3MV9kZXYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcx
L2Q3MV9kZXYuYwo+IEBAIC01NjEsMTcgKzU2MSwxOCBAQCBzdGF0aWMgaW50IGQ3MV9kaXNjb25u
ZWN0X2lvbW11KHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQo+ICB9Cj4gIAo+ICBzdGF0aWMgY29u
c3Qgc3RydWN0IGtvbWVkYV9kZXZfZnVuY3MgZDcxX2NoaXBfZnVuY3MgPSB7Cj4gLQkuaW5pdF9m
b3JtYXRfdGFibGUgPSBkNzFfaW5pdF9mbXRfdGJsLAo+IC0JLmVudW1fcmVzb3VyY2VzCT0gZDcx
X2VudW1fcmVzb3VyY2VzLAo+IC0JLmNsZWFudXAJPSBkNzFfY2xlYW51cCwKPiAtCS5pcnFfaGFu
ZGxlcgk9IGQ3MV9pcnFfaGFuZGxlciwKPiAtCS5lbmFibGVfaXJxCT0gZDcxX2VuYWJsZV9pcnEs
Cj4gLQkuZGlzYWJsZV9pcnEJPSBkNzFfZGlzYWJsZV9pcnEsCj4gLQkub25fb2ZmX3ZibGFuawk9
IGQ3MV9vbl9vZmZfdmJsYW5rLAo+IC0JLmNoYW5nZV9vcG1vZGUJPSBkNzFfY2hhbmdlX29wbW9k
ZSwKPiAtCS5mbHVzaAkJPSBkNzFfZmx1c2gsCj4gLQkuY29ubmVjdF9pb21tdQk9IGQ3MV9jb25u
ZWN0X2lvbW11LAo+IC0JLmRpc2Nvbm5lY3RfaW9tbXUgPSBkNzFfZGlzY29ubmVjdF9pb21tdSwK
PiArCS5pbml0X2Zvcm1hdF90YWJsZQk9IGQ3MV9pbml0X2ZtdF90YmwsCj4gKwkuZW51bV9yZXNv
dXJjZXMJCT0gZDcxX2VudW1fcmVzb3VyY2VzLAo+ICsJLmNsZWFudXAJCT0gZDcxX2NsZWFudXAs
Cj4gKwkuaXJxX2hhbmRsZXIJCT0gZDcxX2lycV9oYW5kbGVyLAo+ICsJLmVuYWJsZV9pcnEJCT0g
ZDcxX2VuYWJsZV9pcnEsCj4gKwkuZGlzYWJsZV9pcnEJCT0gZDcxX2Rpc2FibGVfaXJxLAo+ICsJ
Lm9uX29mZl92YmxhbmsJCT0gZDcxX29uX29mZl92YmxhbmssCj4gKwkuY2hhbmdlX29wbW9kZQkJ
PSBkNzFfY2hhbmdlX29wbW9kZSwKPiArCS5mbHVzaAkJCT0gZDcxX2ZsdXNoLAo+ICsJLmNvbm5l
Y3RfaW9tbXUJCT0gZDcxX2Nvbm5lY3RfaW9tbXUsCj4gKwkuZGlzY29ubmVjdF9pb21tdQk9IGQ3
MV9kaXNjb25uZWN0X2lvbW11LAo+ICsJLmR1bXBfcmVnaXN0ZXIJCT0gZDcxX2R1bXAsCj4gIH07
Cj4gIAo+ICBjb25zdCBzdHJ1Y3Qga29tZWRhX2Rldl9mdW5jcyAqCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuaCBiL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuaAo+IGluZGV4IDg0ZjE4Nzhi
NjQ3ZC4uYzczNTdjMmI5ZTYyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuaAo+IEBAIC00OSw0ICs0OSw2IEBAIGludCBkNzFfcHJv
YmVfYmxvY2soc3RydWN0IGQ3MV9kZXYgKmQ3MSwKPiAgCQkgICAgc3RydWN0IGJsb2NrX2hlYWRl
ciAqYmxrLCB1MzIgX19pb21lbSAqcmVnKTsKPiAgdm9pZCBkNzFfcmVhZF9ibG9ja19oZWFkZXIo
dTMyIF9faW9tZW0gKnJlZywgc3RydWN0IGJsb2NrX2hlYWRlciAqYmxrKTsKPiAgCj4gK3ZvaWQg
ZDcxX2R1bXAoc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYsIHN0cnVjdCBzZXFfZmlsZSAqc2YpOwo+
ICsKPiAgI2VuZGlmIC8qICFfRDcxX0RFVl9IXyAqLwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jCj4gaW5kZXggOWQ0ZDUwNzVjYzY0Li40YWEz
MjRkNDY0MDkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfZGV2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9kZXYuYwo+IEBAIC0yNSw2ICsyNSw4IEBAIHN0YXRpYyBpbnQga29tZWRhX3JlZ2lz
dGVyX3Nob3coc3RydWN0IHNlcV9maWxlICpzZiwgdm9pZCAqeCkKPiAgCXN0cnVjdCBrb21lZGFf
ZGV2ICptZGV2ID0gc2YtPnByaXZhdGU7Cj4gIAlpbnQgaTsKPiAgCj4gKwlzZXFfcHV0cyhzZiwg
IlxuPT09PT09IEtvbWVkYSByZWdpc3RlciBkdW1wID09PT09PT09PVxuIik7Cj4gKwo+ICAJaWYg
KG1kZXYtPmZ1bmNzLT5kdW1wX3JlZ2lzdGVyKQo+ICAJCW1kZXYtPmZ1bmNzLT5kdW1wX3JlZ2lz
dGVyKG1kZXYsIHNmKTsKPiAgCgpSZXZpZXdlZC1ieTogSmFtZXMgUWlhbiBXYW5nIChBcm0gVGVj
aG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgoKQW5kIEknbGwgcHVzaCBp
dCB0byBkcm0tbWlzYwoKQmVzdCBSZWdhcmRzLgpKYW1lcwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
