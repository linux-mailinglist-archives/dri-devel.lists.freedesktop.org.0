Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 142FE8D137
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 12:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386FF6E48C;
	Wed, 14 Aug 2019 10:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40048.outbound.protection.outlook.com [40.107.4.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2346E48C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:47:58 +0000 (UTC)
Received: from DB7PR08CA0021.eurprd08.prod.outlook.com (2603:10a6:5:16::34) by
 DB6PR0801MB1848.eurprd08.prod.outlook.com (2603:10a6:4:38::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.21; Wed, 14 Aug 2019 10:47:54 +0000
Received: from DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::205) by DB7PR08CA0021.outlook.office365.com
 (2603:10a6:5:16::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.13 via Frontend
 Transport; Wed, 14 Aug 2019 10:47:54 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT060.mail.protection.outlook.com (10.152.21.231) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.18 via Frontend Transport; Wed, 14 Aug 2019 10:47:53 +0000
Received: ("Tessian outbound 71602e13cd49:v26");
 Wed, 14 Aug 2019 10:47:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e6b88f94a6873e97
X-CR-MTA-TID: 64aa7808
Received: from 98599fccbc79.1 (cr-mta-lb-1.cr-mta-net [104.47.6.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 602B7353-70E0-4F9D-9EF3-E6FD3BA545B5.1; 
 Wed, 14 Aug 2019 10:47:44 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 98599fccbc79.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Wed, 14 Aug 2019 10:47:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrZbkP/H+7uBTXtonKtVibHZmBKUmSaOIC4AwCCgdJZaihAlcW1Y2iAaBy/ab/FeyzeVfwbjxSfbopQZo04/z1mDM9mKQDNgNph5FP3uCgHf+3VJULcOPge7lCaFipPyoSFre1D9OlG1gic6x/Rlc5QN/8KoyEPvK6r0AGky6uhSxy1ixWnSOTgViWxwXCJnHcxqQp++9lZwL2GSElWvQ9mnIItbpgak23GnGfihGYKhl0EQAKg61t17OYxctX8xN//Ud2vH4eUmk5+vyPFEwG4CoHMxWXhUpCVqe1ggEMbOJETXv1HBhRh+IirtfXIZ3n7qw19wt+0edjcWJZm/RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhe9nDNfqtB/9Recaju4J/8R1X9wFIn1C012+Fx8Yr0=;
 b=dnlWV5LrHIOyQxdaZY+HIk+f03Nx9Qr8NHaOWfui5fUs85an+LpW4t394V3VPbQvBZawQhUzdhzz+OG4l3BVfhL6f071InoRO5L7AaNw7HKD0Cxa9MDr4rG/T/TQWlOdpdCvMonLG8QN2gfmvgjRgRpFirQLlH69HwSSL/aUjQvCQB8Wwk9fdAJ0i1ubE5P+o9mut70lovUbIqvmPwm2mU54/6+419PdqFU8FBtwW7JpUvlQmjMdiQZQNjL7AnZrGjYeKqwnrSC0MxCuwyDQuDyFWU5X5QfWQoLao19vD078hpQjUAgAY7aaHDhfcHPr4OJMRs81Q+P3b2zi233bFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4302.eurprd08.prod.outlook.com (20.179.25.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Wed, 14 Aug 2019 10:47:41 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::2001:a268:ba50:fa51]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::2001:a268:ba50:fa51%3]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 10:47:40 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH v2 2/4] drm/komeda: Introduce komeda_color_manager/state
Thread-Topic: [PATCH v2 2/4] drm/komeda: Introduce komeda_color_manager/state
Thread-Index: AQHVUZN2ECag5jvL6k2i3zNMwO/wrKb45t6AgAFgXgCAADD+gA==
Date: Wed, 14 Aug 2019 10:47:40 +0000
Message-ID: <1949712.9lhcy9HeBp@e123338-lin>
References: <20190813045536.28239-1-james.qian.wang@arm.com>
 <3902025.BCtzpz6JhW@e123338-lin> <20190814075210.GA24984@jamwan02-TSP300>
In-Reply-To: <20190814075210.GA24984@jamwan02-TSP300>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.50]
x-clientproxiedby: LO2P265CA0185.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::29) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: cee86481-7ef7-4c50-6115-08d720a4dc12
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB4302; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB4302:|DB6PR0801MB1848:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB18481F153797FE0BBB8E68A48FAD0@DB6PR0801MB1848.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
x-forefront-prvs: 01294F875B
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(199004)(189003)(81156014)(64756008)(446003)(2906002)(66476007)(66446008)(66556008)(8936002)(66946007)(7736002)(5660300002)(53936002)(6636002)(476003)(25786009)(6862004)(305945005)(66066001)(6116002)(486006)(3846002)(11346002)(6436002)(256004)(6246003)(14444005)(4326008)(81166006)(71200400001)(54906003)(71190400001)(316002)(33716001)(26005)(186003)(6486002)(478600001)(99286004)(9686003)(86362001)(6506007)(386003)(102836004)(52116002)(8676002)(76176011)(6512007)(229853002)(14454004)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4302;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 4dU++MoOOV9LEA5rftlj4PwfTbczZKfryHFEXnbjBtQHmiZ2kBpsdmAJx7VdCCEbobWbFWLmkSX+ai2Ea9yCsiZqHxsCzZ0E43IIMajvcD8mx7fKrUKIYYA3NWgkhOHUbiJlGHD2lPIWzMuM7EihEywmHSGVrB0MMIhpODor10OIJjy5pWKt8O2LjYX9Ft7bt4MBd2+xNY9f4OeJ2hl2C0Vr4Mv99kgc7Xu+uMumcb7IH6dCqqNi9GG/z8G3JgDnbEij3auT0xLisJ9yrFdsoTcdJ5rShOavrEUB6hk1xFf/V3sBwmXFhr9TnVd8boiCqytQ1/7ahQ0hWch5GY7JcFDXAmFAr9kizPgEEubyF6M9aMYiE+ZYB0F4E3HMTyY2gUGEcIFuRRyv5pnCpn3rkfJbYbUmoP4K5srPfhetwFs=
Content-ID: <52FC38613245E64C92730C8445838E27@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4302
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(396003)(376002)(346002)(39860400002)(136003)(2980300002)(189003)(199004)(3846002)(76130400001)(97756001)(23726003)(8936002)(8746002)(81156014)(81166006)(356004)(6116002)(6512007)(9686003)(8676002)(22756006)(46406003)(86362001)(2906002)(6486002)(336012)(478600001)(476003)(186003)(63370400001)(6636002)(386003)(6506007)(63350400001)(50466002)(316002)(5660300002)(25786009)(14454004)(14444005)(70206006)(126002)(54906003)(486006)(229853002)(70586007)(47776003)(66066001)(26826003)(6862004)(99286004)(4326008)(305945005)(7736002)(33716001)(446003)(26005)(102836004)(6246003)(76176011)(11346002)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB1848;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2ed06a30-939c-4cab-702a-08d720a4d461
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB6PR0801MB1848; 
NoDisclaimer: True
X-Forefront-PRVS: 01294F875B
X-Microsoft-Antispam-Message-Info: RrozVab3FhREUs9HXtLLaMOoR1kcCSvAYZP7j99EbekYQI28LSm5PbiJWdVKfLfLYgw95fh5aAV4Zryz494XKr2ny6o9jSBbwPwoFMNoCmvKmqqNP0oBYinZzBBCd6E/tb5Q+3+2Ps5t5kGmFtr5GYe1IRUsTNuHeQHbRePYAjdVmW1BAlbP9LNjSsnIGm2KzkfEtpc1SJu1X3gTL2uWfKm8HqEKaV04jwWzAOZTz0WPwBFRxIO4aALlBtZS45CqkXglSj+TmXvItVT0bAxG4+JDEl+bp6RSW1+5HmksnxuQPmT0YAYsuqO11ZCIt5FU0MdbqkI/hyI8U8oK6fYVaaqKmyOplskus2ElxG8ZyXg/EP72TYdUDkAgUH2F5+jrP8mtqKvHYHRgmRSYYiCEc8WBdT9r6B7YAEfxmg2aXA0=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2019 10:47:53.4431 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cee86481-7ef7-4c50-6115-08d720a4dc12
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1848
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhe9nDNfqtB/9Recaju4J/8R1X9wFIn1C012+Fx8Yr0=;
 b=VQhycVMdlobbz5AKVtgNeMDbVKMoNYwunu9OZSItqd7sk9AVyM/ISH/pvKFiNkaVsMuAY/AIW09ELwPZnGargtvNIMCb8hLjaESb/G27Pgd9wkXAp6JzR41L6cy5qnFrieTFNckM89li+T10+zdn+iL48OvVNWClshdK8xxFYoc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhe9nDNfqtB/9Recaju4J/8R1X9wFIn1C012+Fx8Yr0=;
 b=VQhycVMdlobbz5AKVtgNeMDbVKMoNYwunu9OZSItqd7sk9AVyM/ISH/pvKFiNkaVsMuAY/AIW09ELwPZnGargtvNIMCb8hLjaESb/G27Pgd9wkXAp6JzR41L6cy5qnFrieTFNckM89li+T10+zdn+iL48OvVNWClshdK8xxFYoc=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin
 \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>, Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkbmVzZGF5LCAxNCBBdWd1c3QgMjAxOSAwODo1MjoxOCBCU1QgamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gT24gVHVlLCBBdWcgMTMsIDIwMTkgYXQg
MDk6NTE6MDhBTSArMDAwMCwgTWloYWlsIEF0YW5hc3NvdiB3cm90ZToKPiA+IEhpIEphbWVzLAo+
ID4gCj4gPiBPbiBUdWVzZGF5LCAxMyBBdWd1c3QgMjAxOSAwNTo1NjowNyBCU1QgamFtZXMgcWlh
biB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gPiA+IE1hbnkga29tZWRhIGNv
bXBvbmVudCBzdXBwb3J0IGNvbG9yIG1hbmFnZW1lbnQgbGlrZSBsYXllciBhbmQgSVBTLCBzbwo+
ID4gPiBrb21lZGFfY29sb3JfbWFuYWdlci9zdGF0ZSBhcmUgaW50cm9kdWNlZCB0byBtYW5hZ2Vy
IGdhbW1hLCBjc2MgYW5kIGRlZ2FtbWEKPiA+ID4gdG9nZXRoZXIgZm9yIGVhc2lseSBzaGFyZSBp
dCB0byBtdWx0aXBsZSBjb21wb25wZW50Lgo+ID4gPiAKPiA+ID4gQW5kIGZvciBrb21lZGFfY29s
b3JfbWFuYWdlciB3aGljaDoKPiA+ID4gLSBjb252ZXJ0IGRybSAzZCBnYW1tYSBsdXQgdG8ga29t
ZWRhIHNwZWNpZmljIGdhbW1hIGNvZWZmcwo+ID4gPiAtIGdhbW1hIHRhYmxlIG1hbmFnZW1lbnQg
YW5kIGhpZGUgdGhlIEhXIGRpZmZlcmVuY2UgZm9yIGtvbWVkYS1DT1JFCj4gPiA+IAo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFt
ZXMucWlhbi53YW5nQGFybS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgLi4uL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfY29sb3JfbWdtdC5jICAgIHwgMTI2ICsrKysrKysrKysrKysrKysrKwo+ID4g
PiAgLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5oICAgIHwgIDMyICsr
KystCj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDE1NiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuYwo+ID4gPiBpbmRleCA5ZDE0YTkyZGJiMTcuLmJm
MjM4OGQ2NDFiOSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuYwo+ID4gPiBAQCAtNCw3ICs0LDkg
QEAKPiA+ID4gICAqIEF1dGhvcjogSmFtZXMuUWlhbi5XYW5nIDxqYW1lcy5xaWFuLndhbmdAYXJt
LmNvbT4KPiA+ID4gICAqCj4gPiA+ICAgKi8KPiA+ID4gKyNpbmNsdWRlIDxkcm0vZHJtX3ByaW50
Lmg+Cj4gPiA+ICAKPiA+ID4gKyNpbmNsdWRlICJtYWxpZHBfdXRpbHMuaCIKPiA+ID4gICNpbmNs
dWRlICJrb21lZGFfY29sb3JfbWdtdC5oIgo+ID4gPiAgCj4gPiA+ICAvKiAxMGJpdCBwcmVjaXNp
b24gWVVWMlJHQiBtYXRyaXggKi8KPiA+ID4gQEAgLTY1LDMgKzY3LDEyNyBAQCBjb25zdCBzMzIg
KmtvbWVkYV9zZWxlY3RfeXV2MnJnYl9jb2VmZnModTMyIGNvbG9yX2VuY29kaW5nLCB1MzIgY29s
b3JfcmFuZ2UpCj4gPiA+ICAKPiA+ID4gIAlyZXR1cm4gY29lZmZzOwo+ID4gPiAgfQo+ID4gPiAr
Cj4gPiA+ICtzdHJ1Y3QgZ2FtbWFfY3VydmVfc2VjdG9yIHsKPiA+ID4gKwl1MzIgYm91bmRhcnlf
c3RhcnQ7Cj4gPiA+ICsJdTMyIG51bV9vZl9zZWdtZW50czsKPiA+ID4gKwl1MzIgc2VnbWVudF93
aWR0aDsKPiA+ID4gK307Cj4gPiA+ICsKPiA+ID4gK3N0cnVjdCBnYW1tYV9jdXJ2ZV9zZWdtZW50
IHsKPiA+ID4gKwl1MzIgc3RhcnQ7Cj4gPiA+ICsJdTMyIGVuZDsKPiA+ID4gK307Cj4gPiA+ICsK
PiA+ID4gK3N0YXRpYyBzdHJ1Y3QgZ2FtbWFfY3VydmVfc2VjdG9yIHNlY3Rvcl90YmxbXSA9IHsK
PiA+ID4gKwl7IDAsICAgIDQsICA0ICAgfSwKTWF4IExVVCBwcmVjaXNpb24gKHNlZSBmdWxsIHJl
c3BvbnNlIGJlbG93KSBpcyBkZXRlcm1pbmVkIGJ5IHlvdXIKc21hbGxlc3Qgc2VnbWVudCwgd2hp
Y2ggaXMgNC4KPiA+ID4gKwl7IDE2LCAgIDQsICA0ICAgfSwKPiA+ID4gKwl7IDMyLCAgIDQsICA4
ICAgfSwKPiA+ID4gKwl7IDY0LCAgIDQsICAxNiAgfSwKPiA+ID4gKwl7IDEyOCwgIDQsICAzMiAg
fSwKPiA+ID4gKwl7IDI1NiwgIDQsICA2NCAgfSwKPiA+ID4gKwl7IDUxMiwgIDE2LCAzMiAgfSwK
PiA+ID4gKwl7IDEwMjQsIDI0LCAxMjggfSwKPiA+ID4gK307Cj4gPiA+ICsKPiA+ID4gK3N0YXRp
YyBzdHJ1Y3QgZ2FtbWFfY3VydmVfc2VjdG9yIGlnYW1tYV9zZWN0b3JfdGJsW10gPSB7Cj4gPiA+
ICsJezAsIDY0LCA2NH0sCj4gPiA+ICt9Owo+ID4gPiArCj4gPiA+ICtzdGF0aWMgdm9pZAo+ID4g
PiArZHJtX2x1dF90b19jb2VmZnMoc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpsdXRfYmxvYiwg
dTMyICpjb2VmZnMsCj4gPiA+ICsJCSAgc3RydWN0IGdhbW1hX2N1cnZlX3NlY3RvciAqc2VjdG9y
X3RibCwgdTMyIG51bV9zZWN0b3JzKQo+ID4gPiArewo+ID4gPiArCXN0cnVjdCBkcm1fY29sb3Jf
bHV0ICpsdXQ7Cj4gPiA+ICsJdTMyIGksIGosIGluLCBudW0gPSAwOwo+ID4gPiArCj4gPiA+ICsJ
aWYgKCFsdXRfYmxvYikKPiA+ID4gKwkJcmV0dXJuOwo+ID4gPiArCj4gPiA+ICsJbHV0ID0gbHV0
X2Jsb2ItPmRhdGE7Cj4gPiA+ICsKPiA+ID4gKwlmb3IgKGkgPSAwOyBpIDwgbnVtX3NlY3RvcnM7
IGkrKykgewo+ID4gPiArCQlmb3IgKGogPSAwOyBqIDwgc2VjdG9yX3RibFtpXS5udW1fb2Zfc2Vn
bWVudHM7IGorKykgewo+ID4gPiArCQkJaW4gPSBzZWN0b3JfdGJsW2ldLmJvdW5kYXJ5X3N0YXJ0
ICsKPiA+ID4gKwkJCSAgICAgaiAqIHNlY3Rvcl90YmxbaV0uc2VnbWVudF93aWR0aDsKPiA+ID4g
Kwo+ID4gPiArCQkJY29lZmZzW251bSsrXSA9IGRybV9jb2xvcl9sdXRfZXh0cmFjdChsdXRbaW5d
LnJlZCwKPiA+ID4gKwkJCQkJCUtPTUVEQV9DT0xPUl9QUkVDSVNJT04pOwo+ID4gPiArCQl9Cj4g
PiA+ICsJfQo+ID4gPiArCj4gPiA+ICsJY29lZmZzW251bV0gPSBCSVQoS09NRURBX0NPTE9SX1BS
RUNJU0lPTik7Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4gK3ZvaWQgZHJtX2x1dF90b19pZ2FtbWFf
Y29lZmZzKHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqbHV0X2Jsb2IsIHUzMiAqY29lZmZzKQo+
ID4gPiArewo+ID4gPiArCWRybV9sdXRfdG9fY29lZmZzKGx1dF9ibG9iLCBjb2VmZnMsCj4gPiA+
ICsJCQkgIGlnYW1tYV9zZWN0b3JfdGJsLCBBUlJBWV9TSVpFKGlnYW1tYV9zZWN0b3JfdGJsKSk7
Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4gK3ZvaWQgZHJtX2x1dF90b19mZ2FtbWFfY29lZmZzKHN0
cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqbHV0X2Jsb2IsIHUzMiAqY29lZmZzKQo+ID4gPiArewo+
ID4gPiArCWRybV9sdXRfdG9fY29lZmZzKGx1dF9ibG9iLCBjb2VmZnMsCj4gPiA+ICsJCQkgIHNl
Y3Rvcl90YmwsIEFSUkFZX1NJWkUoc2VjdG9yX3RibCkpOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+
ICt2b2lkIGRybV9jdG1fdG9fY29lZmZzKHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqY3RtX2Js
b2IsIHUzMiAqY29lZmZzKQo+ID4gPiArewo+ID4gPiArCXN0cnVjdCBkcm1fY29sb3JfY3RtICpj
dG07Cj4gPiA+ICsJdTMyIGk7Cj4gPiA+ICsKPiA+ID4gKwlpZiAoIWN0bV9ibG9iKQo+ID4gPiAr
CQlyZXR1cm47Cj4gPiA+ICsKPiA+ID4gKwljdG0gPSBjdG1fYmxvYi0+ZGF0YTsKPiA+ID4gKwo+
ID4gPiArCWZvciAoaSA9IDA7IGkgPCBLT01FREFfTl9DVE1fQ09FRkZTOyArK2kpIHsKPiA+ID4g
KwkJLyogQ29udmVydCBmcm9tIFMzMS4zMiB0byBRMy4xMi4gKi8KPiA+ID4gKwkJczY0IHYgPSBj
dG0tPm1hdHJpeFtpXTsKPiA+ID4gKwo+ID4gPiArCQljb2VmZnNbaV0gPSBjbGFtcF92YWwodiwg
MSAtICgxTEwgPDwgMzQpLCAoMUxMIDw8IDM0KSAtIDEpID4+IDIwOwo+ID4gQ1RNIG1hdHJpeCB2
YWx1ZXMgYXJlIFMzMS4zMiwgaS5lLiBzaWduLW1hZ25pdHVkZSwgc28gY2xhbXBfdmFsIHdvbid0
Cj4gPiBnaXZlIHlvdSB0aGUgcmlnaHQgcmVzdWx0IGZvciBuZWdhdGl2ZSBjb2VmZnMuIFNlZQo+
ID4gbWFsaWRwX2NydGNfYXRvbWljX2NoZWNrX2N0bSBmb3IgdGhlIHNpZ24tbWFnIC0+IDIncyBj
b21wbGVtZW50Cj4gPiBjb252ZXJzaW9uLgo+IAo+IFRoYW5rIHlvdSBNaWhhaWwgZm9yIHBvaW50
aW5nIHRoaXMgb3V0Lgo+IAo+IE5vIG1hdHRlciBvdXIgdXNlciBvciBrZXJuZWwgYWxsIGFzc3Vt
ZSB0aGlzIHMzMS4zMiBhcyAyJ3MgY29tcGxlbWVudC4gCj4gd2UgbmVlZCB0byBjb3JyZWN0IHRo
ZW0gYm90aC4KPiAKPiA+ID4gKwl9Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4gK3ZvaWQga29tZWRh
X2NvbG9yX2R1cGxpY2F0ZV9zdGF0ZShzdHJ1Y3Qga29tZWRhX2NvbG9yX3N0YXRlICpuZXcsCj4g
PiA+ICsJCQkJICBzdHJ1Y3Qga29tZWRhX2NvbG9yX3N0YXRlICpvbGQpCj4gPiBbYmlrZXNoZWRd
IG5vdCByZWFsbHkgYSBfZHVwbGljYXRlX3N0YXRlIGlmIGFsbCBpdCBkb2VzIGlzIHJlZmNvdW50
cy4KPiA+IGttZW1kdXAgaGVyZSBhbmQgcmV0dXJuIGEgcG9pbnRlciAod2l0aCBFUlJfUFRSIG9u
IGZhaWwpLCBvciBtZW1jcHkgaWYKPiA+IHlvdSB3YW50IHRvIGtlZXAgdGhlIHNpZ25hdHVyZT8K
PiAKPiBZZXMsIHRoZSBkdXAgbW9zdGx5IHNob3VsZCByZXR1cm4gYSBuZXcgcHRyIGZyb20gYSBv
bGQsIHRoZSBkdXAgbmFtZSBoZXJlCj4gaXMgbm90IGFjY3VyYXRlLgo+IHRoZSByZWFzb24gaXMg
dGhlIGNvbG9yX3N0YXRlIGlzIG5vdCBhIHNlcGFyYXRlZCBzdHJ1Y3R1cmUgYnV0IGFsd2F5cwo+
IGVtYmVkZGVkIGludG8gbGF5ZXJfc3RhdGUsIGJ1dCBJIHdhbnQgdG8gbWFrZSBhbGwgY29sb3Jf
c3RhdGUgb3BlcmF0aW9uCj4gaW50byBhIGZ1bmMuCj4gRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rp
b24gPwo+IApBZnRlciBsb29raW5nIGF0IHRoZSBmb2xsb3ctdXAgcGF0Y2gsIG5vdCByZWFsbHkg
KGF0IGxlYXN0IG5vdCBhbnkKZ29vZCBvbmVzKS4gSSBkaWQgdGFnIGl0IHdpdGggW2Jpa2VzaGVk
XSBhZnRlciBhbGwsIGl0J3Mgbm90IHRoYXQKYmlnIGEgZGVhbC4KCj4gPiA+ICt7Cj4gPiA+ICsJ
bmV3LT5pZ2FtbWEgPSBrb21lZGFfY29lZmZzX2dldChvbGQtPmlnYW1tYSk7Cj4gPiA+ICsJbmV3
LT5mZ2FtbWEgPSBrb21lZGFfY29lZmZzX2dldChvbGQtPmZnYW1tYSk7Cj4gPiA+ICt9Cj4gPiA+
ICsKPiA+ID4gK3ZvaWQga29tZWRhX2NvbG9yX2NsZWFudXBfc3RhdGUoc3RydWN0IGtvbWVkYV9j
b2xvcl9zdGF0ZSAqY29sb3Jfc3QpCj4gPiA+ICt7Cj4gPiA+ICsJa29tZWRhX2NvZWZmc19wdXQo
Y29sb3Jfc3QtPmlnYW1tYSk7Cj4gPiA+ICsJa29tZWRhX2NvZWZmc19wdXQoY29sb3Jfc3QtPmZn
YW1tYSk7Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4gK2ludCBrb21lZGFfY29sb3JfdmFsaWRhdGUo
c3RydWN0IGtvbWVkYV9jb2xvcl9tYW5hZ2VyICptZ3IsCj4gPiA+ICsJCQkgIHN0cnVjdCBrb21l
ZGFfY29sb3Jfc3RhdGUgKnN0LAo+ID4gPiArCQkJICBzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2Ig
KmlnYW1tYV9ibG9iLAo+ID4gPiArCQkJICBzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmZnYW1t
YV9ibG9iKQo+ID4gPiArewo+ID4gPiArCXUzMiBjb2VmZnNbS09NRURBX05fR0FNTUFfQ09FRkZT
XTsKPiA+ID4gKwo+ID4gPiArCWtvbWVkYV9jb2xvcl9jbGVhbnVwX3N0YXRlKHN0KTsKPiA+ID4g
Kwo+ID4gPiArCWlmIChpZ2FtbWFfYmxvYikgewo+ID4gPiArCQlkcm1fbHV0X3RvX2lnYW1tYV9j
b2VmZnMoaWdhbW1hX2Jsb2IsIGNvZWZmcyk7Cj4gPiA+ICsJCXN0LT5pZ2FtbWEgPSBrb21lZGFf
Y29lZmZzX3JlcXVlc3QobWdyLT5pZ2FtbWFfbWdyLCBjb2VmZnMpOwo+ID4gPiArCQlpZiAoIXN0
LT5pZ2FtbWEpIHsKPiA+ID4gKwkJCURSTV9ERUJVR19BVE9NSUMoInJlcXVlc3QgaWdhbW1hIHRh
YmxlIGZhaWxlZC5cbiIpOwo+ID4gPiArCQkJcmV0dXJuIC1FQlVTWTsKPiA+ID4gKwkJfQo+ID4g
PiArCX0KPiA+ID4gKwo+ID4gPiArCWlmIChmZ2FtbWFfYmxvYikgewo+ID4gPiArCQlkcm1fbHV0
X3RvX2ZnYW1tYV9jb2VmZnMoZmdhbW1hX2Jsb2IsIGNvZWZmcyk7Cj4gPiA+ICsJCXN0LT5mZ2Ft
bWEgPSBrb21lZGFfY29lZmZzX3JlcXVlc3QobWdyLT5mZ2FtbWFfbWdyLCBjb2VmZnMpOwo+ID4g
PiArCQlpZiAoIXN0LT5mZ2FtbWEpIHsKPiA+ID4gKwkJCURSTV9ERUJVR19BVE9NSUMoInJlcXVl
c3QgZmdhbW1hIHRhYmxlIGZhaWxlZC5cbiIpOwo+ID4gPiArCQkJcmV0dXJuIC1FQlVTWTsKPiA+
ID4gKwkJfQo+ID4gPiArCX0KPiA+ID4gKwo+ID4gPiArCXJldHVybiAwOwo+ID4gPiArfQo+ID4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
Y29sb3JfbWdtdC5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
Y29sb3JfbWdtdC5oCj4gPiA+IGluZGV4IGEyZGYyMThmNThlNy4uNDFhOTZiM2I1NDBmIDEwMDY0
NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9j
b2xvcl9tZ210LmgKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfY29sb3JfbWdtdC5oCj4gPiA+IEBAIC00LDE0ICs0LDQyIEBACj4gPiA+ICAgKiBB
dXRob3I6IEphbWVzLlFpYW4uV2FuZyA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cj4gPiA+ICAg
Kgo+ID4gPiAgICovCj4gPiA+IC0KPiA+ID4gICNpZm5kZWYgX0tPTUVEQV9DT0xPUl9NR01UX0hf
Cj4gPiA+ICAjZGVmaW5lIF9LT01FREFfQ09MT1JfTUdNVF9IXwo+ID4gPiAgCj4gPiA+ICAjaW5j
bHVkZSA8ZHJtL2RybV9jb2xvcl9tZ210Lmg+Cj4gPiA+ICsjaW5jbHVkZSAia29tZWRhX2NvZWZm
cy5oIgo+ID4gPiAgCj4gPiA+ICAjZGVmaW5lIEtPTUVEQV9OX1lVVjJSR0JfQ09FRkZTCQkxMgo+
ID4gPiArI2RlZmluZSBLT01FREFfTl9SR0IyWVVWX0NPRUZGUwkJMTIKPiA+ID4gKyNkZWZpbmUg
S09NRURBX0NPTE9SX1BSRUNJU0lPTgkJMTIKPiA+ID4gKyNkZWZpbmUgS09NRURBX05fR0FNTUFf
Q09FRkZTCQk2NQo+ID4gPiArI2RlZmluZSBLT01FREFfQ09MT1JfTFVUX1NJWkUJCUJJVChLT01F
REFfQ09MT1JfUFJFQ0lTSU9OKQo+IAo+ID4gSSBkb24ndCBzZWUgaG93IHRoZSBudW1iZXIgb2Yg
TFVUIGVudHJpZXMgaGFzIGFueXRoaW5nIHRvIGRvIHdpdGggdGhlCj4gPiBiaXQtcHJlY2lzaW9u
IG9mIGVhY2ggZW50cnkuCj4gCj4gQmVjYXVzZSBvdXIga29tZWRhIGNvbG9yIGlzIDEyLWJpdCBw
cmVjaXNvbiwgYW5kIGZvciAxIHZzIDEgbG9vcHVwCj4gdGFibGUsIHdlIG5lZWQgQklUKDEyKSBl
bnRyaWVzLgo+IAo+IFRoYW5rIHlvdQo+IEphbWVzCj4gCkJ1dCB5b3VyIG1heGltdW0gcG9zc2li
bGUgcHJlY2lzaW9uIGluIEhXIGlzIDQgdGltZXMgbGVzcy4gWW91IG9ubHkKcmVhbGx5IG5lZWQg
b25lIExVVCBlbnRyeSBwZXIgc2VnbWVudCAoaXRzIHN0YXJ0KSBpbiBvcmRlciB0bwpkZWZpbmUg
aXQgKGFuZCB0aGUgc2xvcGUsIGJ1dCB5b3UgZ2V0IHRoZSBpZGVhKS4gSS5lLiBhdCB5b3VyIGN1
cnJlbnQKNEstc2l6ZWQgTFVUIHRhYmxlLCB0aGUgY29udmVyc2lvbiB0byB0aGUgaW50ZXJuYWwg
cmVwcmVzZW50YXRpb24gb25seQpfcmVhbGx5XyBuZWVkcyB0byBhY2Nlc3Mgb2Zmc2V0cyAwLCA0
LCBldGMuIGFuZCBldmVuIGxlc3Mgb2Z0ZW4gYXMKaXQgZ29lcy4gSWYgeW91IG1ha2UgeW91ciB0
YWJsZSAxSyBlbnRyaWVzIGluc3RlYWQsIHlvdSBzYXZlIHlvdXJzZWxmCjI0S2lCIGV2ZXJ5IHRp
bWUgdGhlIChpKWdhbW1hIGNoYW5nZXMuCgpUTDtEUjogeW91IGRvbid0IG5lZWQgMToxIGxvb2t1
cCwgeW91IG5lZWQgYSBsb3NzbGVzcyBjb252ZXJzaW9uIGZyb20KdGhlIExVVCB0byB0aGUgSFcg
Zm9ybWF0LgoKPiA+ID4gKyNkZWZpbmUgS09NRURBX05fQ1RNX0NPRUZGUwkJOQo+ID4gPiArCj4g
PiA+ICtzdHJ1Y3Qga29tZWRhX2NvbG9yX21hbmFnZXIgewo+ID4gPiArCXN0cnVjdCBrb21lZGFf
Y29lZmZzX21hbmFnZXIgKmlnYW1tYV9tZ3I7Cj4gPiA+ICsJc3RydWN0IGtvbWVkYV9jb2VmZnNf
bWFuYWdlciAqZmdhbW1hX21ncjsKPiA+ID4gKwlib29sIGhhc19jdG07Cj4gPiA+ICt9Owo+ID4g
PiArCj4gPiA+ICtzdHJ1Y3Qga29tZWRhX2NvbG9yX3N0YXRlIHsKPiA+ID4gKwlzdHJ1Y3Qga29t
ZWRhX2NvZWZmc190YWJsZSAqaWdhbW1hOwo+ID4gPiArCXN0cnVjdCBrb21lZGFfY29lZmZzX3Rh
YmxlICpmZ2FtbWE7Cj4gPiA+ICt9Owo+ID4gPiArCj4gPiA+ICt2b2lkIGtvbWVkYV9jb2xvcl9k
dXBsaWNhdGVfc3RhdGUoc3RydWN0IGtvbWVkYV9jb2xvcl9zdGF0ZSAqbmV3LAo+ID4gPiArCQkJ
CSAgc3RydWN0IGtvbWVkYV9jb2xvcl9zdGF0ZSAqb2xkKTsKPiA+ID4gK3ZvaWQga29tZWRhX2Nv
bG9yX2NsZWFudXBfc3RhdGUoc3RydWN0IGtvbWVkYV9jb2xvcl9zdGF0ZSAqY29sb3Jfc3QpOwo+
ID4gPiAraW50IGtvbWVkYV9jb2xvcl92YWxpZGF0ZShzdHJ1Y3Qga29tZWRhX2NvbG9yX21hbmFn
ZXIgKm1nciwKPiA+ID4gKwkJCSAgc3RydWN0IGtvbWVkYV9jb2xvcl9zdGF0ZSAqc3QsCj4gPiA+
ICsJCQkgIHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqaWdhbW1hX2Jsb2IsCj4gPiA+ICsJCQkg
IHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqZmdhbW1hX2Jsb2IpOwo+ID4gPiArCj4gPiA+ICt2
b2lkIGRybV9sdXRfdG9faWdhbW1hX2NvZWZmcyhzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmx1
dF9ibG9iLCB1MzIgKmNvZWZmcyk7Cj4gPiA+ICt2b2lkIGRybV9sdXRfdG9fZmdhbW1hX2NvZWZm
cyhzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmx1dF9ibG9iLCB1MzIgKmNvZWZmcyk7Cj4gPiA+
ICt2b2lkIGRybV9jdG1fdG9fY29lZmZzKHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqY3RtX2Js
b2IsIHUzMiAqY29lZmZzKTsKPiA+ID4gIAo+ID4gPiAgY29uc3QgczMyICprb21lZGFfc2VsZWN0
X3l1djJyZ2JfY29lZmZzKHUzMiBjb2xvcl9lbmNvZGluZywgdTMyIGNvbG9yX3JhbmdlKTsKPiA+
ID4gIAo+ID4gPiAtI2VuZGlmCj4gPiA+ICsjZW5kaWYgLypfS09NRURBX0NPTE9SX01HTVRfSF8q
Lwo+ID4gPiAKPiA+IAo+ID4gQlIsCj4gPiBNaWhhaWwKPiA+IAo+ID4gCj4gCgpCUiwKTWloYWls
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
