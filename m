Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B0B6329B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 10:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71543893A3;
	Tue,  9 Jul 2019 08:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130042.outbound.protection.outlook.com [40.107.13.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23DC893A3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 08:07:13 +0000 (UTC)
Received: from VI1PR08CA0153.eurprd08.prod.outlook.com (2603:10a6:800:d5::31)
 by DB6PR0802MB2600.eurprd08.prod.outlook.com (2603:10a6:4:a1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.16; Tue, 9 Jul
 2019 08:07:09 +0000
Received: from AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::205) by VI1PR08CA0153.outlook.office365.com
 (2603:10a6:800:d5::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via Frontend
 Transport; Tue, 9 Jul 2019 08:07:09 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT043.mail.protection.outlook.com (10.152.17.43) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 9 Jul 2019 08:07:07 +0000
Received: ("Tessian outbound 189fc018761e:v23");
 Tue, 09 Jul 2019 08:07:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 03f9709e15d7f2ef
X-CR-MTA-TID: 64aa7808
Received: from b6487b74b314.1 (cr-mta-lb-1.cr-mta-net [104.47.2.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5F44DE32-A8EC-4726-8B71-B980D5862E5F.1; 
 Tue, 09 Jul 2019 08:06:55 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2058.outbound.protection.outlook.com [104.47.2.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b6487b74b314.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 09 Jul 2019 08:06:55 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4943.eurprd08.prod.outlook.com (10.255.158.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Tue, 9 Jul 2019 08:06:53 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1%3]) with mapi id 15.20.2032.019; Tue, 9 Jul 2019
 08:06:53 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 1/5] drm/komeda: Remove clock ratio property
Thread-Topic: [PATCH 1/5] drm/komeda: Remove clock ratio property
Thread-Index: AQHVMyqZrg81oxgVjEKBQQTXQaH4dKbB9CsA
Date: Tue, 9 Jul 2019 08:06:53 +0000
Message-ID: <20190709080646.GA22276@jamwan02-TSP300>
References: <20190705121006.26085-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20190705121006.26085-1-daniel.vetter@ffwll.ch>
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
X-MS-Office365-Filtering-Correlation-Id: cd4870dc-3775-4cff-d2df-08d704446fc9
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4943; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4943:|DB6PR0802MB2600:
X-Microsoft-Antispam-PRVS: <DB6PR0802MB260086C76980A114B23255AEB3F10@DB6PR0802MB2600.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 0093C80C01
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(346002)(366004)(396003)(136003)(376002)(199004)(189003)(66066001)(68736007)(2906002)(5024004)(66946007)(305945005)(478600001)(486006)(25786009)(476003)(256004)(1076003)(33716001)(11346002)(66446008)(446003)(64756008)(5660300002)(66476007)(73956011)(66556008)(58126008)(54906003)(8936002)(6436002)(53936002)(81166006)(8676002)(81156014)(229853002)(6486002)(99286004)(6512007)(9686003)(6916009)(186003)(26005)(6246003)(7736002)(4326008)(14454004)(6116002)(3846002)(71200400001)(52116002)(71190400001)(386003)(6506007)(55236004)(33656002)(316002)(86362001)(102836004)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4943;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 96NRRQ0pzPmvwJqL1VWNJg2ibTpNK9MhaUK2+qlEzzev0kaMcatGRJ1PUZG39EW0yKWJEPZxeU21ZUGvCRfmhHIZTjvkJqN8FbC+WV3jxdkmXNtc6X2c0TeNK81WYevAS8lNXEqKvXVI8262i7gx/LlIrPMwXYGpWe90nECMtm8SmfXPFx4Xf/zfjEn+2nTDNJYBkAyzFl0GEdncby60OrUsAeR1ocB7ICXcmmGR8sDF30dLtBofL1iN56TbqM66NPYDcksE3HNqsLsRu+8FHX+kgoWE2GGgEdINaMQrygAHw+eE/BetYff8h3c+bxUNMk1zkRZgfg0hly9R9eM3x9JxG9f5vGFTS1VX1Vyo6FNfHVDzIrITcLHvKRG3YLtpMCE9G3Ni4OZL29z3022biZDy108t0Vy0B9D7do2i6tI=
Content-ID: <F6DE2689F88D26488BCA98DB17FC2BBD@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4943
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(39860400002)(136003)(396003)(346002)(2980300002)(189003)(199004)(316002)(36906005)(97756001)(229853002)(6486002)(14454004)(58126008)(2906002)(25786009)(46406003)(54906003)(9686003)(33656002)(22756006)(4326008)(6246003)(47776003)(6512007)(6116002)(6862004)(3846002)(23726003)(476003)(305945005)(99286004)(63370400001)(50466002)(7736002)(66066001)(336012)(76176011)(81166006)(26005)(186003)(102836004)(8746002)(8936002)(86362001)(81156014)(26826003)(33716001)(70206006)(5024004)(478600001)(386003)(76130400001)(5660300002)(6506007)(8676002)(11346002)(446003)(70586007)(1076003)(63350400001)(356004)(126002)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0802MB2600;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: dcd7ee3c-2c8a-4923-2129-08d704446754
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB6PR0802MB2600; 
NoDisclaimer: True
X-Forefront-PRVS: 0093C80C01
X-Microsoft-Antispam-Message-Info: tkw9AZtTZMB0WTBsE2GDBml9XOqWJ/lZczdCaDvC+UHvx/zFR3mcDqJEEwauxZPLRNFkxneqMedvdXoz+Ip0onvgRkTc/q4W14XAj0iful/q1RODtHgyJjDIiVTwC828/9pel8p+cwH8/UJ9YGSzLj8OjoVRHTSvNcmQ6RaPpeg51nJ8uSbT3+KjUDUW3Q41UWkvGBrVL8Ufj6MfrolYwTaSXPxANx2sSBO2ou3V8TF/w4xMIQ4tUjW/Fy/nOvqroG8Ml8YgcQso6ozX555kBaPpNTpKl1Z1wb6nzf0w90s7/r19Jr5XtG3kGlVYHlvEIp+r7bVg2RoXb+2+V1jYTsB4zgEVmommdJ9XLLWSsLJaCTr4PFUxFmCGpeHn9HThBPmX0FueBR3Dgwxvkfpx+fG5rTCHhufPv7Ym9FiLW7Q=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2019 08:07:07.5208 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4870dc-3775-4cff-d2df-08d704446fc9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2600
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dre+rfhTK9weA9W/GLKAGfPYfKXfYmXKOCEvz7f3lXw=;
 b=Nfm/RW6TeW/abr6Twvk5Yt+XOHwO4lv3IIoil5Djp60hxTz3A432AAWEZBDFFsZnOZC1i/Ca0/yOjoANsjIruunS2HCoxLzYlfbaAtl231judij2z2KmlDYcdcpfmClS+ytfAeeReOA9UXNg1iSn7n/0rE5GnfyrJXJ+L4hCd60=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dre+rfhTK9weA9W/GLKAGfPYfKXfYmXKOCEvz7f3lXw=;
 b=Nfm/RW6TeW/abr6Twvk5Yt+XOHwO4lv3IIoil5Djp60hxTz3A432AAWEZBDFFsZnOZC1i/Ca0/yOjoANsjIruunS2HCoxLzYlfbaAtl231judij2z2KmlDYcdcpfmClS+ytfAeeReOA9UXNg1iSn7n/0rE5GnfyrJXJ+L4hCd60=
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

T24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMDI6MTA6MDJQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBQcm9wZXJ0aWVzIGFyZSB1YXBpIGxpa2UgYW55dGhpbmcgZWxzZSwgd2l0aCBhbGwg
dGhlIHVzdWFsIHJ1bGVzCj4gcmVnYXJkaW5nIHJldmlldywgdGVzdGNhc2VzLCBvcGVuIHNvdXJj
ZSB1c2Vyc3BhY2UgLi4uIEZ1cnRoZXJtb3JlCj4gZHJpdmVyLXByaXZhdGUga21zIHByb3BlcnRp
ZXMgYXJlIGhpZ2hseSBkaXNjb3VyYWdlZCwgb3ZlciB0aGUgcGFzdAo+IGZldyB5ZWFycyB3ZSd2
ZSByZWFsaXplZCB3ZSBuZWVkIHRvIG1ha2UgYSBzZXJpb3VzIGVmZm9ydCBhdCBiZXR0ZXIKPiBz
dGFuZGFyZGl6aW5nIHRoaXMgc3R1ZmYuCj4gCj4gPkZyb20gdGhlIGRpc2N1c3Npb24gd2l0aCBM
aXZpdSB0aGUgc29sdXRpb24gZm9yIHRoZXNlIGhlcmUgbmVlZHMKPiBtdWx0aXBsZSBwaWVjZXM6
Cj4gCj4gLSBGb3IgYmVpbmcgYWJsZSB0byByZWxpYWJseSByZWFkIHRoZSBtZW1vcnkgY2xvY2sg
d2UgbmVlZCBhIERUCj4gICBwcm9wZXJ0eSwgcGx1cyBtYXliZSBEVCBvdmVycmlkZSBzbmlwcGV0
cyB0byBmaXggaXQgaWYgaXQncyB3cm9uZy4KPiAKPiAtIEZvciBleHBvc2luZyBwbGFuZSBsaW1p
dGF0aW9ucyB0byB1c2Vyc3BhY2UgdGhlcmUncyBURVNUX09OTFkuIFRoZXJlCj4gICBpcyBhIGJp
dCBhIGdhcCBpbiB0ZWxsaW5nIHVzZXJzcGFjZSBiZXR0ZXIgdGhhdCBzY2FsaW5nIGRvZXNuJ3Qg
d29yawo+ICAgZHVlIHRvIGxpbWl0cyAoYXRtIGEgZ29vZCBzdHJhdGVneSBpcyB0byByZXRyeSBh
Z2FpbiB3aXRob3V0IHNjYWxpbmcKPiAgIHdoZW4gYWRkaW5nIGEgcGxhbmUgZGlkbid0IHdvcmsg
dGhlIGZpcnN0IHRpbWUgYXJvdW5kKS4gQnV0IHRoYXQKPiAgIG5lZWRzIGEgbW9yZSBnZW5lcmlj
IHNvbHV0aW9uLCBub3QgZXhwb3Npbmcgc29tZXRoaW5nIGV4dHJlbWVseQo+ICAga29tZWRhIHNw
ZWNpZmljLgo+IAo+IC0gSWYgdGhpcyBpcyBuZWVkZWQgYnkgdmFsaWRhdGlvbiB0b29scywgeW91
IGNhbiBzdGlsbCBleHBvc2UgaXQgaW4KPiAgIGRlYnVnZnMuIFdlIGhhdmUgYW4gZW50aXJlIG5p
Y2UgaW5mcmFzdHJ1Y3R1cmUgZm9yIGRlYnVnIHByaW50aW5nIG9mCj4gICBrbXMgb2JqZWN0cyBh
bHJlYWR5LCBzZWUgdGhlIHZhcmlvdXMgYXRvbWljX3ByaW50X3N0YXRlIGNhbGxiYWNrcwo+ICAg
YW5kIGluZnJhc3RydWN0dXJlIGFyb3VuZCB0aGVtLgo+IAo+IEZpeGVzOiAxZjdmOWFiNzkwMGUg
KCJkcm0va29tZWRhOiBBZGQgZW5naW5lIGNsb2NrIHJlcXVpcmVtZW50IGNoZWNrIGZvciB0aGUg
ZG93bnNjYWxpbmciKQo+IENjOiBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxsb3dy
eS5saUBhcm0uY29tPgo+IENjOiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5h
KSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cj4gQ2M6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRh
dUBhcm0uY29tPgo+IENjOiBNYWxpIERQIE1haW50YWluZXJzIDxtYWxpZHBAZm9zcy5hcm0uY29t
Pgo+IENjOiBCcmlhbiBTdGFya2V5IDxicmlhbi5zdGFya2V5QGFybS5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CgpIaSBEYW5pZWw6
ClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoIQoKUmV2aWV3ZWQtYnk6IEphbWVzIFFpYW4gV2FuZyAo
QXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KCj4gLS0tCj4g
IC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jICB8IDM5IC0tLS0t
LS0tLS0tLS0tLS0tLS0KPiAgLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9r
bXMuaCAgIHwgIDMgLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0MiBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0
Yy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4g
aW5kZXggM2YyMjJmNDY0ZWIyLi5lODUyZGMyN2YxYjggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gQEAgLTQ1NCwyNCArNDU0
LDYgQEAgc3RhdGljIHZvaWQga29tZWRhX2NydGNfdmJsYW5rX2Rpc2FibGUoc3RydWN0IGRybV9j
cnRjICpjcnRjKQo+ICAJbWRldi0+ZnVuY3MtPm9uX29mZl92YmxhbmsobWRldiwga2NydGMtPm1h
c3Rlci0+aWQsIGZhbHNlKTsKPiAgfQo+ICAKPiAtc3RhdGljIGludAo+IC1rb21lZGFfY3J0Y19h
dG9taWNfZ2V0X3Byb3BlcnR5KHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiAtCQkJCWNvbnN0IHN0
cnVjdCBkcm1fY3J0Y19zdGF0ZSAqc3RhdGUsCj4gLQkJCQlzdHJ1Y3QgZHJtX3Byb3BlcnR5ICpw
cm9wZXJ0eSwgdWludDY0X3QgKnZhbCkKPiAtewo+IC0Jc3RydWN0IGtvbWVkYV9jcnRjICprY3J0
YyA9IHRvX2tjcnRjKGNydGMpOwo+IC0Jc3RydWN0IGtvbWVkYV9jcnRjX3N0YXRlICprY3J0Y19z
dCA9IHRvX2tjcnRjX3N0KHN0YXRlKTsKPiAtCj4gLQlpZiAocHJvcGVydHkgPT0ga2NydGMtPmNs
b2NrX3JhdGlvX3Byb3BlcnR5KSB7Cj4gLQkJKnZhbCA9IGtjcnRjX3N0LT5jbG9ja19yYXRpbzsK
PiAtCX0gZWxzZSB7Cj4gLQkJRFJNX0RFQlVHX0RSSVZFUigiVW5rbm93biBwcm9wZXJ0eSAlc1xu
IiwgcHJvcGVydHktPm5hbWUpOwo+IC0JCXJldHVybiAtRUlOVkFMOwo+IC0JfQo+IC0KPiAtCXJl
dHVybiAwOwo+IC19Cj4gLQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jcnRjX2Z1bmNzIGtv
bWVkYV9jcnRjX2Z1bmNzID0gewo+ICAJLmdhbW1hX3NldAkJPSBkcm1fYXRvbWljX2hlbHBlcl9s
ZWdhY3lfZ2FtbWFfc2V0LAo+ICAJLmRlc3Ryb3kJCT0gZHJtX2NydGNfY2xlYW51cCwKPiBAQCAt
NDgyLDcgKzQ2NCw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2NydGNfZnVuY3Mga29tZWRh
X2NydGNfZnVuY3MgPSB7Cj4gIAkuYXRvbWljX2Rlc3Ryb3lfc3RhdGUJPSBrb21lZGFfY3J0Y19h
dG9taWNfZGVzdHJveV9zdGF0ZSwKPiAgCS5lbmFibGVfdmJsYW5rCQk9IGtvbWVkYV9jcnRjX3Zi
bGFua19lbmFibGUsCj4gIAkuZGlzYWJsZV92YmxhbmsJCT0ga29tZWRhX2NydGNfdmJsYW5rX2Rp
c2FibGUsCj4gLQkuYXRvbWljX2dldF9wcm9wZXJ0eQk9IGtvbWVkYV9jcnRjX2F0b21pY19nZXRf
cHJvcGVydHksCj4gIH07Cj4gIAo+ICBpbnQga29tZWRhX2ttc19zZXR1cF9jcnRjcyhzdHJ1Y3Qg
a29tZWRhX2ttc19kZXYgKmttcywKPiBAQCAtNTE4LDIyICs0OTksNiBAQCBpbnQga29tZWRhX2tt
c19zZXR1cF9jcnRjcyhzdHJ1Y3Qga29tZWRhX2ttc19kZXYgKmttcywKPiAgCXJldHVybiAwOwo+
ICB9Cj4gIAo+IC1zdGF0aWMgaW50IGtvbWVkYV9jcnRjX2NyZWF0ZV9jbG9ja19yYXRpb19wcm9w
ZXJ0eShzdHJ1Y3Qga29tZWRhX2NydGMgKmtjcnRjKQo+IC17Cj4gLQlzdHJ1Y3QgZHJtX2NydGMg
KmNydGMgPSAma2NydGMtPmJhc2U7Cj4gLQlzdHJ1Y3QgZHJtX3Byb3BlcnR5ICpwcm9wOwo+IC0K
PiAtCXByb3AgPSBkcm1fcHJvcGVydHlfY3JlYXRlX3JhbmdlKGNydGMtPmRldiwgRFJNX01PREVf
UFJPUF9BVE9NSUMsCj4gLQkJCQkJICJDTE9DS19SQVRJTyIsIDAsIFU2NF9NQVgpOwo+IC0JaWYg
KCFwcm9wKQo+IC0JCXJldHVybiAtRU5PTUVNOwo+IC0KPiAtCWRybV9vYmplY3RfYXR0YWNoX3By
b3BlcnR5KCZjcnRjLT5iYXNlLCBwcm9wLCAwKTsKPiAtCWtjcnRjLT5jbG9ja19yYXRpb19wcm9w
ZXJ0eSA9IHByb3A7Cj4gLQo+IC0JcmV0dXJuIDA7Cj4gLX0KPiAtCj4gIHN0YXRpYyBpbnQga29t
ZWRhX2NydGNfY3JlYXRlX3NsYXZlX3BsYW5lc19wcm9wZXJ0eShzdHJ1Y3Qga29tZWRhX2NydGMg
KmtjcnRjKQo+ICB7Cj4gIAlzdHJ1Y3QgZHJtX2NydGMgKmNydGMgPSAma2NydGMtPmJhc2U7Cj4g
QEAgLTU5MCwxMCArNTU1LDYgQEAgc3RhdGljIGludCBrb21lZGFfY3J0Y19hZGQoc3RydWN0IGtv
bWVkYV9rbXNfZGV2ICprbXMsCj4gIAo+ICAJY3J0Yy0+cG9ydCA9IGtjcnRjLT5tYXN0ZXItPm9m
X291dHB1dF9wb3J0Owo+ICAKPiAtCWVyciA9IGtvbWVkYV9jcnRjX2NyZWF0ZV9jbG9ja19yYXRp
b19wcm9wZXJ0eShrY3J0Yyk7Cj4gLQlpZiAoZXJyKQo+IC0JCXJldHVybiBlcnI7Cj4gLQo+ICAJ
ZXJyID0ga29tZWRhX2NydGNfY3JlYXRlX3NsYXZlX3BsYW5lc19wcm9wZXJ0eShrY3J0Yyk7Cj4g
IAlpZiAoZXJyKQo+ICAJCXJldHVybiBlcnI7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgKPiBpbmRleCAyMTlmYTNmMGMzMzYuLjI3NzVmMzRi
ZjRhYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9rbXMuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2ttcy5oCj4gQEAgLTk1LDkgKzk1LDYgQEAgc3RydWN0IGtvbWVkYV9jcnRjIHsKPiAgCS8q
KiBAZGlzYWJsZV9kb25lOiB0aGlzIGZsaXBfZG9uZSBpcyBmb3IgdHJhY2luZyB0aGUgZGlzYWJs
ZSAqLwo+ICAJc3RydWN0IGNvbXBsZXRpb24gKmRpc2FibGVfZG9uZTsKPiAgCj4gLQkvKiogQGNs
b2NrX3JhdGlvX3Byb3BlcnR5OiBwcm9wZXJ0eSBmb3IgcmF0aW8gb2YgKGFjbGsgPDwgMzIpL3B4
bGNsayAqLwo+IC0Jc3RydWN0IGRybV9wcm9wZXJ0eSAqY2xvY2tfcmF0aW9fcHJvcGVydHk7Cj4g
LQo+ICAJLyoqIEBzbGF2ZV9wbGFuZXNfcHJvcGVydHk6IHByb3BlcnR5IGZvciBzbGF2ZXMgb2Yg
dGhlIHBsYW5lcyAqLwo+ICAJc3RydWN0IGRybV9wcm9wZXJ0eSAqc2xhdmVfcGxhbmVzX3Byb3Bl
cnR5Owo+ICB9Owo+IC0tIAo+IDIuMjAuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
