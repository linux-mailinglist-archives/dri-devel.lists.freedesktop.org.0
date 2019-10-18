Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1F4DC36F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 13:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F392B6E0DA;
	Fri, 18 Oct 2019 11:01:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30079.outbound.protection.outlook.com [40.107.3.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668966E0DA
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 11:01:29 +0000 (UTC)
Received: from VI1PR0801CA0085.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::29) by DB8PR08MB4089.eurprd08.prod.outlook.com
 (2603:10a6:10:a7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Fri, 18 Oct
 2019 11:01:24 +0000
Received: from AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::202) by VI1PR0801CA0085.outlook.office365.com
 (2603:10a6:800:7d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 18 Oct 2019 11:01:24 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT058.mail.protection.outlook.com (10.152.17.48) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 18 Oct 2019 11:01:22 +0000
Received: ("Tessian outbound 851a1162fca7:v33");
 Fri, 18 Oct 2019 11:01:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a1a28f31e63a18ae
X-CR-MTA-TID: 64aa7808
Received: from a8bae19f48b7.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.12.54]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 27147B68-3D26-477E-98FD-58D3D7925E70.1; 
 Fri, 18 Oct 2019 11:01:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a8bae19f48b7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Oct 2019 11:01:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TskExcp+oRkqUSOjF8oczvBP7BSVzCAH2EtfR+os99ZgIeFIglhI7v6txAr2bqAogaQ1hq7+IFrv3yo9k5/65eYube4k+mEmVB0nXafLomH7TU/HER5yfLPI+paMdo5H5nh1yA8lQYcElwzU5nIf6RNqZzQlxC+95HToPmTmHFwpC7jrghp1gOSIvUmJAC4PikqO50IBs5+Qqb8v3blthmroiwGHVxZCs6atD1AwAzr4s2aRy8+9DxMCoLX6fBgDq0rl7WDCg1jR5KYlipjHsssqZWbU7nbur+ES7GZEkbe/i1KvQk+iUfCGviMz1HpDZZFLG0Pnf5EPPQNziMQwNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pzusbNj7NuLcs6S/MEsIssznSoIGv9jIXqpEYts4Lg=;
 b=Jmlq9R3EUifg7biK1NhPftZRR4Y3lOIcy43/PWcqtfhmd+jUw63kc+26A9ZLW0nWdqjnyIZKZ48QOU9fcFBThtyO4B9jB794kOjXZpFg++cYD2QY1dtY47eGWa0dlpf6w2igCkBHlnGK59u2AFNxhNtpLr6GcTh925YxJ9kBW8btbvsyBM1sd3wcTIbe6zMi4dCtb/BUI5dAqXT01EnjuQ5XSZTSOWmzlcpHNJwDQWWDb0uxO9Qn+A12d2JnfdcD8Vcog3/+Hk3eqLC9bhC3+o/wyYwi5VzOtkWlFddhIbZK/F5JiRSTZ/fnhhky3j8iqNTnWgUpV94oC0LAv7BYfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3888.eurprd08.prod.outlook.com (20.178.80.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Fri, 18 Oct 2019 11:01:13 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2347.024; Fri, 18 Oct 2019
 11:01:13 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [RFC,3/3] drm/komeda: Allow non-component drm_bridge only
 endpoints
Thread-Topic: [RFC,3/3] drm/komeda: Allow non-component drm_bridge only
 endpoints
Thread-Index: AQHVfmYCVHmeR23TD0SRvLooFH2IJKddhx2A///3y4CAALR0gIAAV3AAgAAhkICAAAeWAIABTLOAgABJQoA=
Date: Fri, 18 Oct 2019 11:01:12 +0000
Message-ID: <1762076.f1XlaKvzUH@e123338-lin>
References: <20191004143418.53039-4-mihail.atanassov@arm.com>
 <20191017104812.6qpuzoh5bx5i2y3m@DESKTOP-E1NTVVP.localdomain>
 <20191018063851.GA18702@jamwan02-TSP300>
In-Reply-To: <20191018063851.GA18702@jamwan02-TSP300>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.51]
x-clientproxiedby: LO2P265CA0355.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::31) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 1578c827-bae6-47fe-638b-08d753ba832c
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB3888:|VI1PR08MB3888:|DB8PR08MB4089:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB4089DAC01CE81E08ABD1771E8F6C0@DB8PR08MB4089.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 01949FE337
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(136003)(396003)(366004)(39860400002)(346002)(376002)(189003)(199004)(54906003)(229853002)(316002)(14454004)(2906002)(76176011)(4326008)(186003)(478600001)(6506007)(386003)(52116002)(6436002)(6486002)(6862004)(9686003)(71200400001)(71190400001)(6512007)(3846002)(6116002)(25786009)(486006)(11346002)(446003)(99286004)(476003)(256004)(14444005)(5660300002)(6636002)(33716001)(305945005)(66946007)(66476007)(66556008)(64756008)(66446008)(81156014)(81166006)(7736002)(8936002)(8676002)(6246003)(102836004)(26005)(66066001)(86362001)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3888;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 2EKjCu1Hc8wnpZMlIlY9l84S1yVNK6dZ3rVjrFRBfgwVN60At6EJY3rJXmBsu2lH7Q7fmyV+XPx0dtd5AmvI0a01jOY5qldEdGRN6Uxpx6UhTAIhzZNx1PYcMJuGI1++INRho1Rw/88ZcYRvCF51FsbIva2/5VsPU5WwwLEzk8cRH3fDPCJXiLDOHc6tzYIl6qXaT8wIWEcMmX/xIz46rXUwr6bLYxFZTKRtSpGto2Y894o1ymqgE1ywMy+O5koLVlRH1KICh89TLosfsnP4GeXatVva2eBO8hnQgXPQnBnfBZcuQG7opc4fRIrnj7BFwXqpmKRmgiNsvYoh9M2mYP/CPeQYIb4YshjE5VfVicKBuS745j0QouAantOsYPzChkVK2M6+akmiWM9fhAyjiL8k4iIsFYAAvxqxtIzft2k=
Content-ID: <AF04E6F538BF7742924B072225422630@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3888
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(396003)(136003)(346002)(39860400002)(199004)(189003)(229853002)(6512007)(9686003)(476003)(356004)(33716001)(107886003)(14454004)(11346002)(47776003)(6246003)(126002)(70206006)(7736002)(102836004)(22756006)(70586007)(6862004)(305945005)(8746002)(8936002)(446003)(81166006)(8676002)(63350400001)(81156014)(86362001)(99286004)(186003)(3846002)(6116002)(76130400001)(23726003)(2906002)(4326008)(336012)(76176011)(316002)(97756001)(36906005)(6636002)(25786009)(46406003)(14444005)(6506007)(26005)(26826003)(66066001)(6486002)(5660300002)(478600001)(50466002)(54906003)(486006)(386003)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB4089;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: b5c247a0-2418-4560-df7f-08d753ba7d4e
NoDisclaimer: True
X-Forefront-PRVS: 01949FE337
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ptY9egVjbnil7Fo7jFsZBqOddwAxzM8ZMJLUpeUm8/ToPwwY4gy/wCtRKSbpizrkA83veZ4Ba8jKkTW7yQamMs5o4PPJGwKMoqUjaOVI0J4jC0Ll6vkhJCZ/5to4/1vNPOneMCsAHmBZKwZHWjMrnKg77zVCx7CRT7trpuQFPltHkvHHYR38RVPM/9vvRryVQ0N6mtrD3bOaz1sDl6ShnPedH7BFrN1kHDLi8JvYhyNHd/72oV4+DHf/Or6TzscgdnaiZKCGQXQqKBt5moFFK7smyvPF2SSVy6XqVhooyocifa784IsrJtjcFPNBUQWaRMGv3XV+jzp/pHJmUuM3wlbQ6PF2moTl7I6T1copH2Ok1H6bMUGy9qaJRfGlfQ3u9Tin6ktw6RujtxMOlW5Hx6ZnteIcr1HqKTTRRmyVmCg=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2019 11:01:22.4530 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1578c827-bae6-47fe-638b-08d753ba832c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4089
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pzusbNj7NuLcs6S/MEsIssznSoIGv9jIXqpEYts4Lg=;
 b=Bxc1Pa+FkrcA6WfZpYSNuLW4YgMGVdaGrhnv6nSspIZpaKzwse6CSgpGKeIln85JNm8wiYJBQXKpIFfkDvo+WyntpfHzZWDPadhe+Eik8TfRjWgW0DLEmoj3meVNQqgHjV7OCDiyJMhtCIS2uIfkv1OppkjGrAs3aJAfjF///YU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pzusbNj7NuLcs6S/MEsIssznSoIGv9jIXqpEYts4Lg=;
 b=Bxc1Pa+FkrcA6WfZpYSNuLW4YgMGVdaGrhnv6nSspIZpaKzwse6CSgpGKeIln85JNm8wiYJBQXKpIFfkDvo+WyntpfHzZWDPadhe+Eik8TfRjWgW0DLEmoj3meVNQqgHjV7OCDiyJMhtCIS2uIfkv1OppkjGrAs3aJAfjF///YU=
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
 Russell King <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpZGF5LCAxOCBPY3RvYmVyIDIwMTkgMDc6Mzg6NTkgQlNUIGphbWVzIHFpYW4gd2FuZyAo
QXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+IE9uIFRodSwgT2N0IDE3LCAyMDE5IGF0IDEw
OjQ4OjEyQU0gKzAwMDAsIEJyaWFuIFN0YXJrZXkgd3JvdGU6Cj4gPiBPbiBUaHUsIE9jdCAxNywg
MjAxOSBhdCAxMDoyMTowM0FNICswMDAwLCBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5
IENoaW5hKSB3cm90ZToKPiA+ID4gT24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMDg6MjA6NTZBTSAr
MDAwMCwgQnJpYW4gU3RhcmtleSB3cm90ZToKPiA+ID4gPiBPbiBUaHUsIE9jdCAxNywgMjAxOSBh
dCAwMzowNzo1OUFNICswMDAwLCBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5h
KSB3cm90ZToKPiA+ID4gPiA+IE9uIFdlZCwgT2N0IDE2LCAyMDE5IGF0IDA0OjIyOjA3UE0gKzAw
MDAsIEJyaWFuIFN0YXJrZXkgd3JvdGU6Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBJZiBKYW1l
cyBpcyBzdHJvbmdseSBhZ2FpbnN0IG1lcmdpbmcgdGhpcywgbWF5YmUgd2UganVzdCBzd2FwCj4g
PiA+ID4gPiA+IHdob2xlc2FsZSB0byBicmlkZ2U/IEJ1dCBmb3IgbWUsIHRoZSBwcmFnbWF0aWMg
YXBwcm9hY2ggd291bGQgYmUgdGhpcwo+ID4gPiA+ID4gPiBzdG9wLWdhcC4KPiA+ID4gPiA+ID4K
PiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhpcyBpcyBhIGdvb2QgaWRlYSwgYW5kIEkgdm90ZSArVUxP
TkdfTUFYIDopCj4gPiA+ID4gPiAKPiA+ID4gPiA+IGFuZCBJIGFsc28gY2hlY2tlZCB0ZGE5OTh4
IGRyaXZlciwgaXQgc3VwcG9ydHMgYnJpZGdlLiBzbyBzd2FwIHRoZQo+ID4gPiA+ID4gd2hvbGVz
YWxlIHRvIGJyaWdlIGlzIHBlcmZlY3QuIDopCj4gPiA+ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiBX
ZWxsLCBhcyBNaWhhaWwgd3JvdGUsIGl0J3MgZGVmaW5pdGVseSBub3QgcGVyZmVjdC4KPiA+ID4g
PiAKPiA+ID4gPiBUb2RheSwgaWYgeW91IHJtbW9kIHRkYTk5OHggd2l0aCB0aGUgRFBVIGRyaXZl
ciBzdGlsbCBsb2FkZWQsCj4gPiA+ID4gZXZlcnl0aGluZyB3aWxsIGJlIHVuYm91bmQgZ3JhY2Vm
dWxseS4KPiA+ID4gPiAKPiA+ID4gPiBJZiB3ZSBzd2FwIHRvIGJyaWRnZSwgdGhlbiBybW1vZCdp
bmcgdGRhOTk4eCAob3IgYW55IG90aGVyIGJyaWRnZQo+ID4gPiA+IGRyaXZlciB0aGUgRFBVIGlz
IHVzaW5nKSB3aXRoIHRoZSBEUFUgZHJpdmVyIHN0aWxsIGxvYWRlZCB3aWxsIHJlc3VsdAo+ID4g
PiA+IGluIGEgY3Jhc2guCj4gPiA+IAo+ID4gPiBJIGhhdmVuJ3QgcmVhZCB0aGUgYnJpZGdlIGNv
ZGUsIGJ1dCBzZWVtcyB0aGlzIGlzIGEgYnVnIG9mIGRybV9icmlkZ2UsCj4gPiA+IHNpbmNlIGlm
IHRoZSBicmlkZ2UgaXMgc3RpbGwgaW4gdXNpbmcgYnkgb3RoZXJzLCB0aGUgcm1tb2Qgc2hvdWxk
IGZhaWwKPiA+ID4gCj4gPiAKPiA+IENvcnJlY3QsIGJ1dCB0aGVyZSdzIG5vIGZpeCBmb3IgdGhh
dCB0b2RheS4gWW91IGNhbiBhbHNvIHRha2UgYSBsb29rCj4gPiBhdCB0aGUgdGhyZWFkIGxpbmtl
ZCBmcm9tIE1paGFpbCdzIGNvdmVyIGxldHRlci4KPiA+IAo+ID4gPiBBbmQgcGVyc29uYWxseSBv
cGluaW9uLCBpZiB0aGUgYnJpZGdlIGRvZXNuJ3QgaGFuZGxlIHRoZSBkZXBlbmRlbmNlLgo+ID4g
PiBmb3IgdXM6Cj4gPiA+IAo+ID4gPiAtIGFkZCBzdWNoIHN1cHBvcnQgdG8gYnJpZGdlCj4gPiAK
PiA+IFRoYXQgd291bGQgY2VydGFpbmx5IGJlIGhlbHBmdWwuIEkgZG9uJ3Qga25vdyBpZiB0aGVy
ZSdzIGNvbnNlbnN1cyBvbgo+ID4gaG93IHRvIGRvIHRoYXQuCj4gPiAKPiA+ID4gICBvcgo+ID4g
PiAtIGp1c3QgZG8gdGhlIGluc21vZC9ybW1vZCBpbiBjb3JyZWN0IG9yZGVyLgo+ID4gPiAKPiA+
ID4gPiBTbywgdGhlcmUgcmVhbGx5IGFyZSBwcm9wZXIgYmVuZWZpdHMgdG8gc3RpY2tpbmcgd2l0
aCB0aGUgY29tcG9uZW50Cj4gPiA+ID4gY29kZSBmb3IgdGRhOTk4eCwgd2hpY2ggaXMgd2h5IEkn
ZCBsaWtlIHRvIHVuZGVyc3RhbmQgd2h5IHlvdSdyZSBzbwo+ID4gPiA+IGFnYWluc3QgdGhpcyBw
YXRjaD8KPiA+ID4gPgo+ID4gPiAKPiA+ID4gVGhpcyBjaGFuZ2UgaGFuZGxlcyB0d28gZGlmZmVy
ZW50IGNvbm5lY3RvcnMgaW4ga29tZWRhIGludGVybmFsbHksIGNvbXBhcmUKPiA+ID4gd2l0aCBv
bmUgaW50ZXJmYWNlLCBpdCBpbmNyZWFzZXMgdGhlIGNvbXBsZXhpdHksIG1vcmUgcmlzayBvZiBi
dWcgYW5kIG1vcmUKPiA+ID4gY29zdCBvZiBtYWludGFpbmFuY2UuCj4gPiA+IAo+ID4gCj4gPiBX
ZWxsLCBpdCdzIG9ubHkgYWJvdXQgaG93IHRvIGJpbmQgdGhlIGRyaXZlcnMgLSB0d28gZGlmZmVy
ZW50IG1ldGhvZHMKPiA+IG9mIGJpbmRpbmcsIG5vdCB0d28gZGlmZmVyZW50IGNvbm5lY3RvcnMu
IEkgd291bGQgYXJndWUgdGhhdCBjYXJyeWluZwo+ID4gb3VyIG91dC1vZi10cmVlIHBhdGNoZXMg
dG8gc3VwcG9ydCBib3RoIHBsYXRmb3JtcyBpcyBhIGxhcmdlcgo+ID4gbWFpbnRlbmFuY2UgYnVy
ZGVuLgo+ID4gCj4gPiBIb25lc3RseSB0aGlzIGxvb2tzIGxpa2UgYSB3aW4td2luIHRvIG1lLiBX
ZSBnZXQgdGhlIHN1cGVyaW9yIGFwcHJvYWNoCj4gPiB3aGVuIGl0cyBzdXBwb3J0ZWQsIGFuZCBz
dGlsbCBnZXQgdG8gc3VwcG9ydCBicmlkZ2VzIHdoaWNoIGFyZSBtb3JlCj4gPiBjb21tb24uCj4g
Pgo+IAo+IE15IGNvbnNpZGVyYXRpb24gaXM6IGlmIHdlIHN1cHBvcnQgYm90aCBsaW5rIG1ldGhv
ZHMsIHdlIG1heSBzdWZmZXJpbmcKPiAKPiAtIDEuIGJyaWRnZSByZWZlcmVuY2UgY250IHByb2Js
ZW0KPiAtIDIuIG1haW50YW5jZSB0d28gbGluayBtZXRob2RzLgo+IAo+IHRoZSAxKSBzZWVtcyB1
bmF2b2lkYWJsZSwgc28gc3dhcCBhbGwgdG8gYnJpZGFnZSBhdCBsZWFzdCBjYW4gYXZvaWQKPiB0
aGUgcGFpbiBvZiAyKS4gdGhhdCdzIHdoeSBJIHRob3VnaHQgeW91ciBpZGVhICJzd2FwIGFsbCB0
byBicmlkYWdlIgo+IGlzIGdvb2QuCj4gCj4gVGhhbmtzCj4gSmFtZXMuCj4gCgpKdXN0IHRvIG1h
a2Ugc3VyZSBteSB1bmRlcnN0YW5kaW5nIGlzIGNsZWFyOiBJZiBJIHJlc3BpbiB0aGUgcGF0Y2gg
dG8Kb25seSB1c2UgdGhlIGRybV9icmlkZ2UgaS9mLCB5b3UnZCBiZSBoYXBwaWVyIHdpdGggaXQg
YW5kIHdlIGNhbiBnZXQgaXQKbWVyZ2VkPwoKPiA+IEFzL3doZW4gaW1wcm92ZW1lbnRzIGFyZSBt
YWRlIHRvIHRoZSBicmlkZ2UgY29kZSB3ZSBjYW4gcmVtb3ZlIHRoZQo+ID4gY29tcG9uZW50IGJp
dHMgYW5kIG5vdCBsb3NlIGFueXRoaW5nLgo+ID4gCj4gPiA+IFNvIG15IHN1Z2dlc3Rpb24gaXMg
a2VlcGluZyBvbiBvbmUgc2luZ2xlIGludGVyZmFjZSBpbiBrb21lZGEsIG5vCj4gPiA+IG1hdHRl
ciBpdCBpcyBicmlkZ2Ugb3IgY29tcG9uZW50LCBidXQgSSdkIGxpa2UgaXQgb25seSBvbmUsIGJ1
dCBub3QKPiA+ID4gdGhlbSBib3RoIGluIGtvbWVkYS4KPiA+IAo+ID4gSWYgd2UgY2FuIHB1dCB0
aGUgZWZmb3J0IGludG8gZml4aW5nIGJyaWRnZXMgdGhlbiBJIGd1ZXNzIHRoYXQncyB0aGUKPiA+
IGJlc3QgYXBwcm9hY2ggZm9yIGV2ZXJ5b25lIDotKSBNaWdodCBub3QgYmUgZWFzeSB0aG91Z2gh
Cj4gPiAKPiA+IC1Ccmlhbgo+ID4gCj4gPiA+IAo+ID4gPiBUaGFua3MKPiA+ID4gSmFtZXMKPiA+
ID4gCj4gPiA+ID4gVGhhbmtzLAo+ID4gPiA+IC1Ccmlhbgo+IAoKCi0tIApNaWhhaWwKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
