Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F60CF5F7
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 11:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D296E2B2;
	Tue,  8 Oct 2019 09:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20060.outbound.protection.outlook.com [40.107.2.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2596A6E2B2
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 09:26:17 +0000 (UTC)
Received: from DB6PR0801CA0059.eurprd08.prod.outlook.com (2603:10a6:4:2b::27)
 by AM6PR08MB3894.eurprd08.prod.outlook.com (2603:10a6:20b:90::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.24; Tue, 8 Oct
 2019 09:26:12 +0000
Received: from AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::208) by DB6PR0801CA0059.outlook.office365.com
 (2603:10a6:4:2b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2327.24 via Frontend
 Transport; Tue, 8 Oct 2019 09:26:12 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT034.mail.protection.outlook.com (10.152.16.81) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 8 Oct 2019 09:26:11 +0000
Received: ("Tessian outbound 851a1162fca7:v33");
 Tue, 08 Oct 2019 09:26:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 03db2b03ffff9e6e
X-CR-MTA-TID: 64aa7808
Received: from f3e08f20f2f5.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.58]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 89E31E92-160F-4EAD-A454-02A61646212D.1; 
 Tue, 08 Oct 2019 09:25:59 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2058.outbound.protection.outlook.com [104.47.4.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f3e08f20f2f5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Oct 2019 09:25:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jk4lCRAOEGg0xhUkJjaFiPVfg2IZ8qZn9akUwFgxl7flEzhkU4wWSm/td1i3R2ZSye/GiG1p2mj8L2RtW07ZdvQT6H1NrrcSg2rloF7a4aK3wJocIKlvX18yoIs2LIavZSdghi32dopDRcjfe4xfTqM2Hb4cqD6N55T4J3mi/nKTrdJMNgfEEhnT2BPrRYBkUIukF1fnJvLBXDYaIFxRU9fJiYalvse4F6ZkdOjGZVGpv2gTe8uXeGjuJDLZ1T9mxMRD/+TE+Sb6GVSI6N7eQt9Gpi0m9KH9SvXnGc2sYffcvQv3e+5bKPtY2vqp5YD/KkZduR24Zswfk5rYNIDwwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=et5jj9Pa/lqTdaeVe9uQpr0ARVsSQzejCF3aB4Qx17w=;
 b=FR7hLpB4SW++ZF27dhQerTzpW/XqaqDFsuk8DQWwUNRg1QX/4uESiFJP3YSgKIn1eKhHI8cIzjA5HF93XOv4o/GEXgu3K9PNg6TrN0eVy9KEjnE5d4uinzxc/XWWqxsAOsVQ70NmifmQx0JV0oUFsTAha/jzB0PRp032u97G6WKHZiLHte9VC/zBR8bquMDrsYdEnN2SXr3iTHyd8mP7JsiS90/U4RUfA2F6KSpRydwSLl917iRw/gaidr7S6QiTLZLL60vR5G19nqvbsbertGXlxDeWmiIbYQnIVAdMD/YqtLqhae/P3mBVXPUIuBnZbnga+Wgb5tPLO3FCva4fbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3246.eurprd08.prod.outlook.com (52.134.123.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Tue, 8 Oct 2019 09:25:57 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e52a:a540:75ae:ced9]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e52a:a540:75ae:ced9%4]) with mapi id 15.20.2327.026; Tue, 8 Oct 2019
 09:25:57 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Brian Starkey <Brian.Starkey@arm.com>
Subject: Re: [PATCH] drm/komeda: Adds output-color format/depth support
Thread-Topic: [PATCH] drm/komeda: Adds output-color format/depth support
Thread-Index: AQHVb5fml3iiEtk+MEOqXjNduhm+kKc5MiiAgADp5ICAAhFyAIACqBcAgAVBDQCADH7tAA==
Date: Tue, 8 Oct 2019 09:25:57 +0000
Message-ID: <20191008092550.GA19624@lowli01-ThinkStation-P300>
References: <20190920094329.17513-1-lowry.li@arm.com>
 <20190923121604.jqi6ewln27yvdajw@DESKTOP-E1NTVVP.localdomain>
 <20190924021313.GA15776@jamwan02-TSP300>
 <20190925094810.fbeyt7fxvyhaip33@DESKTOP-E1NTVVP.localdomain>
 <20190927022218.GA11732@jamwan02-TSP300>
 <20190930103626.de3p6rbowyerjbks@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20190930103626.de3p6rbowyerjbks@DESKTOP-E1NTVVP.localdomain>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR04CA0065.apcprd04.prod.outlook.com
 (2603:1096:202:14::33) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 81710892-af9e-4568-6e16-08d74bd18eee
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB3246:|VI1PR08MB3246:|AM6PR08MB3894:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB38943FA842FD58DB71BD53079F9A0@AM6PR08MB3894.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 01842C458A
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(189003)(199004)(55236004)(11346002)(446003)(476003)(486006)(86362001)(6862004)(6486002)(71200400001)(71190400001)(2906002)(14454004)(966005)(6636002)(229853002)(6506007)(8676002)(386003)(52116002)(33716001)(76176011)(26005)(186003)(102836004)(478600001)(1076003)(81156014)(81166006)(25786009)(8936002)(99286004)(66476007)(64756008)(66446008)(54906003)(58126008)(316002)(4326008)(66066001)(66556008)(5660300002)(66946007)(9686003)(6512007)(33656002)(6116002)(7736002)(3846002)(305945005)(6306002)(256004)(6436002)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3246;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ly6a7NRTfbwe/5SSajOsCFqm5gWiOhVvHqp1yqIQBgidhBgJScKfP0sgHwtQRQleKbxU3OryxtGb3zQcAaFUjsWPxj+ff07BpPwVuAd/vr3hJa7RJHCdfyowzgpszeE1uMeDdhg9ltmKHtNBOe11zk79Ck7Sl7uBCQveKUYYubaNLH3X8sT0Ic80/hJ9CXxSkwVLkv+BhLs4vdByfpuQ82nRBSYdbPyEMEtDg0T1Ag098UQw9YZm42RTTI5UJHFL0VaAnkQVXE16aZyzsE1WKtsPlUIP0NL1TrQaqjqAWECFkCju1JVCKQiDjLpwlwxlyJnmytKCbgn3lKcPS9m3o4vVLe18A+0aUVCqcVxRWlfXTdUdVWWPdA6tB3MNkgrzc34g4cj5q+mr3nNZ7oCLiMzN+xvUKpBB8gQ04JrODWKTv2ctH00j6NBmX/7kgmvrZ+eWUKjc+9RhpivDi//JVw==
Content-ID: <4C87069E1AE9174BAE683E117AF3A4AA@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3246
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(376002)(39860400002)(136003)(396003)(199004)(189003)(14454004)(97756001)(356004)(58126008)(76130400001)(76176011)(486006)(4326008)(6246003)(54906003)(966005)(478600001)(33716001)(46406003)(5660300002)(70586007)(2906002)(70206006)(26826003)(1076003)(99286004)(6862004)(386003)(6506007)(7736002)(33656002)(336012)(6512007)(23726003)(6636002)(229853002)(8936002)(6486002)(316002)(8746002)(25786009)(36906005)(3846002)(6116002)(86362001)(126002)(66066001)(476003)(11346002)(102836004)(9686003)(6306002)(26005)(63350400001)(446003)(22756006)(305945005)(81166006)(81156014)(186003)(47776003)(50466002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3894;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 36481227-7fa9-43b9-a5f6-08d74bd186a4
NoDisclaimer: True
X-Forefront-PRVS: 01842C458A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SgMSkpFdqloEUnisWSlWKF+9VlNIZdWRH0w0myw7nrNfGShQT0mIVxIuwcCQmjRFabzkk/msg7+1JK3siaKwMaTl7ptQ6X7noEPFtxhUho/UXuMJbopsynLQjyTI7eDXEgaTxRe5jF4ymXSXpC7tXfJkI+4cm9yq8l206A53HiaOIK14tyXGiMD8be7p8oTdEuU1R/Gc5MrtbCGu+luPJ/sZUwHufUYutRxHpYo9smCTS/tTw6VVfxvUAEyisIUCpJTzqatGuqbj3Yc0ajCQnRf3nCukh/Uvijc5etKYQkTVFD65wn1bQfXrbBCRfRJ2NXlF3a9y0HuqDq4ixqIpEWK18/LMz7XgjFSl1/N+WsfzL1zX3cQRcFIESyS3SSpECWfPmEdUdEOrZAcynfs1YV4JgLG7g7UHO0owRSXwlXrKwZlLjRdTzUiFi1D7ToyAmeNpEewiMFg792G4VZWkkg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2019 09:26:11.3712 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81710892-af9e-4568-6e16-08d74bd18eee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3894
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=et5jj9Pa/lqTdaeVe9uQpr0ARVsSQzejCF3aB4Qx17w=;
 b=WUWTjKZKkJzLuG08jyPF0GgTm+0eeimWX8xkPi+VM1bta+b293ZEof12pyxk980jevBmzHKwDwyr0Dn9oefZc5HLbUD1iNX8PVe0h//37W4KgZJXz5bBF3pNPaDPxdZ6rldJzR7JpIeGpTjG00VXSQ98Kaii/7S3tvJdtcpwGb0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=et5jj9Pa/lqTdaeVe9uQpr0ARVsSQzejCF3aB4Qx17w=;
 b=WUWTjKZKkJzLuG08jyPF0GgTm+0eeimWX8xkPi+VM1bta+b293ZEof12pyxk980jevBmzHKwDwyr0Dn9oefZc5HLbUD1iNX8PVe0h//37W4KgZJXz5bBF3pNPaDPxdZ6rldJzR7JpIeGpTjG00VXSQ98Kaii/7S3tvJdtcpwGb0=
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
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMTA6MzY6MjdBTSArMDAwMCwgQnJpYW4gU3RhcmtleSB3
cm90ZToKPiBPbiBGcmksIFNlcCAyNywgMjAxOSBhdCAwMjoyMjoyNEFNICswMDAwLCBqYW1lcyBx
aWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiA+IE9uIFdlZCwgU2VwIDI1
LCAyMDE5IGF0IDA5OjQ4OjExQU0gKzAwMDAsIEJyaWFuIFN0YXJrZXkgd3JvdGU6Cj4gPiA+IEhp
IEphbWVzLAo+ID4gPiAKPiA+ID4gT24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgMDI6MTM6MjdBTSAr
MDAwMCwgamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gPiA+
ID4gCj4gPiA+ID4gSGkgQnJpYW46Cj4gPiA+ID4gCj4gPiA+ID4gU2luY2Ugb25lIG1vbml0b3Ig
Y2FuIHN1cHBvcnQgbXV0aXBsZSBjb2xvci1mb3JtYXRzLCB0aGlzIERUIHByb3BlcnR5Cj4gPiA+
ID4gc3VwcGx5IGEgd2F5IGZvciB1c2VyIHRvIHNlbGVjdCBhIHNwZWNpZmljIG9uZSBmcm9tIHRo
aXMgc3VwcG9ydGVkCj4gPiA+ID4gY29sb3ItZm9ybWF0cy4KPiA+ID4gCj4gPiA+IE1vZGlmeWlu
ZyBEVCBpcyBhIF9yZWFsbHlfIHVzZXItdW5mcmllbmRseSB3YXkgb2Ygc3BlY2lmeWluZwo+ID4g
PiBwcmVmZXJlbmNlcy4gSWYgd2Ugd2FudCBhIHVzZXIgdG8gYmUgYWJsZSB0byBwaWNrIGEgcHJl
ZmVycmVkIGZvcm1hdCwKPiA+ID4gdGhlbiBpdCBzaG91bGQgcHJvYmFibHkgYmUgdmlhIHRoZSBh
dG9taWMgQVBJIGFzIFZpbGxlIG1lbnRpb25lZC4KPiA+ID4KPiA+IAo+ID4gSGkgQnJpYW46Cj4g
PiAKPiA+IEFncmVlLCBhIGRybSBVUEFJIG1pZ2h0IGJlIHRoZSBiZXN0ICYgcmlnaHQgd2F5IGZv
ciB0aGlzLgo+ID4gCj4gPiBJIGNhbiByYWlzZSBhIG5ldyB0aHJlYWQvdG9waWMgdG8gZGlzY3Vz
cyB0aGUgIkhPVyBUTyIsIG1heWJlIGFmdGVyIHRoZQo+ID4gQ2hpbmVzZSBuYXRpb25hbCBkYXku
Cj4gPiAKPiA+IExBU1Q6Cj4gPiB3aGF0IGRvIHlvdSB0aGluayBhYm91dCB0aGlzIHBhdGNoOgo+
ID4gLSBKdXN0IGRyb3AgaXQsIHdhaXRpbmcgZm9yIHRoZSBuZXcgdWFwaQo+ID4gLSBvciBrZWVw
IGl0LCBhbmQgcmVwbGFjZSBpdCBvbmNlIG5ldyB1YXBpIGlzIHJlYWR5Lgo+IAo+IFRoZSBiaXQt
ZGVwdGggc3R1ZmYgaXMgY2xlYXIgYW5kIG5vbi1jb250cm92ZXJzaWFsLCBzbyB5b3UgY291bGQg
c3BsaXQKPiB0aGF0IG91dCBhbmQgbWVyZ2UgaXQuCj4gCj4gRm9yIHRoZSBZVVYgc3R1ZmYsIEkg
dGhpbmsgaXQgd291bGQgYmUgZmluZSB0byBtZXJnZSB0aGUKPiBpbXBsZW1lbnRhdGlvbiB0aGF0
IHdlIGRpc2N1c3NlZCBoZXJlIC0gZm9yY2UgWVVWIGZvciBtb2RlcyB3aGljaCBtdXN0Cj4gYmUg
WVVWLCBhbmQgbGVhdmUgdGhlIHVzZXItcHJlZmVyZW5jZSBzdHVmZiBmb3IgYSBsYXRlciBVQVBJ
Lgo+IAo+IFRoYW5rcywKPiAtQnJpYW4KPiAKSGkgQnJpYW4sCldlJ3ZlIHNwbGl0IGNvbG9yIGRl
cHRoIG91dC4gVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLgpodHRwczovL3BhdGNod29yay5mcmVl
ZGVza3RvcC5vcmcvc2VyaWVzLzY3NzMwLwoKUmVnYXJkcywKTG93cnkKPiA+IAo+ID4gVGhhbmtz
Cj4gPiBKYW1lcwo+ID4gCj4gPiA+IENoZWVycywKPiA+ID4gLUJyaWFuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
