Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0D2CF490
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 10:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164C989DB5;
	Tue,  8 Oct 2019 08:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80073.outbound.protection.outlook.com [40.107.8.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFDD89DB5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 08:06:55 +0000 (UTC)
Received: from VI1PR08CA0140.eurprd08.prod.outlook.com (2603:10a6:800:d5::18)
 by AM6PR08MB4613.eurprd08.prod.outlook.com (2603:10a6:20b:80::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.24; Tue, 8 Oct
 2019 08:06:51 +0000
Received: from AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::203) by VI1PR08CA0140.outlook.office365.com
 (2603:10a6:800:d5::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2327.24 via Frontend
 Transport; Tue, 8 Oct 2019 08:06:51 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT059.mail.protection.outlook.com (10.152.17.193) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 8 Oct 2019 08:06:49 +0000
Received: ("Tessian outbound 6481c7fa5a3c:v33");
 Tue, 08 Oct 2019 08:06:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b542d3dbdbb4a977
X-CR-MTA-TID: 64aa7808
Received: from 170c1393c5c0.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.55]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 11610660-6CF2-440C-ADA4-7D45A3E50944.1; 
 Tue, 08 Oct 2019 08:06:35 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2055.outbound.protection.outlook.com [104.47.10.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 170c1393c5c0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 08 Oct 2019 08:06:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZqCpZFpF/2R4ptk6Mzi0Uux555Oym0fqUa97Pr2qpR8DNtH+34mUS4Nh1REWi6zw2s725eaIIAQSMq8VEQ0nAfuHy4ja7Rx97B6eNRllAOtyH1n3LZnLled+asQXH3tsRvI5hhiDM9F0wzlIm2Qd2RF45Puvx5PLV5ytTjYZpzO8YzNKcLVwEjEeLwCQ6f55ZueZwQk5yZJHRGNphkl3nD9WLBbGwdtwIE6JiDX+ViwQwGUgG4uhSFqGLbSC0afGq3/tLYIdaktblIkw/GtEGz7L4qscaPMcduAwDFlqkzUc97HE8Yj9tT9m5gOQDwFSHIxoPg0KY60q6ME1Ga+lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drQ9hLzOpV9DsXFhX7lPjxUSGbfWmD+ZWz3Ew18XLK4=;
 b=LLm03ZEqwQHkNoKAtCESAz54nZoOCqYNGibg6kmBgCEqOGfC9bV7X9muWNVIKvM9eoL4SnHezE0kxjzabpJgIRKHrC6y1vWKA+55cfgjgsJwJiV/zYAg19NTiiqw3P94T+QnsvHX5wI/UGwjA9FZ126PQ1k8QNkBNQ4TgZ/QrFE+4reRAhwo1NOYcV7Sjkv7+rFAT81ss/7eHwd0oJFPG5TDxOE/PshtqQFkdnqpQvv4Lq8t7BXZZNxpGiOtxNBscUdypkueYcrwqqINdtf1sxC3o0/9Hokd/DVnP/XFrOj5mXYXI3ERWnDZQXrmZPmrw/mlMUeI/R+fUpV56m6Iiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5119.eurprd08.prod.outlook.com (10.255.159.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 8 Oct 2019 08:06:33 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2305.023; Tue, 8 Oct 2019
 08:06:33 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH][next] drm/komeda: remove redundant assignment to pointer
 disable_done
Thread-Topic: [PATCH][next] drm/komeda: remove redundant assignment to pointer
 disable_done
Thread-Index: AQHVes/ZUJmCrklP8UyDQux9AfFYh6dK3dyAgAAo5gCABCjhgIABOU0A
Date: Tue, 8 Oct 2019 08:06:33 +0000
Message-ID: <20191008080626.GA20953@jamwan02-TSP300>
References: <20191004162156.325-1-colin.king@canonical.com>
 <20191004192720.7eiqdvsm2yv62svg@e110455-lin.cambridge.arm.com>
 <35232014-f65a-f7a1-99db-8ed91f610a77@canonical.com>
 <20191007132505.GV22609@kadam>
In-Reply-To: <20191007132505.GV22609@kadam>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0162.apcprd02.prod.outlook.com
 (2603:1096:201:1f::22) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6fe9f1e8-7bb2-453c-e190-08d74bc67894
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB5119:|VE1PR08MB5119:|AM6PR08MB4613:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4613CBA351A098BB2AC94C77B39A0@AM6PR08MB4613.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 01842C458A
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(51914003)(189003)(199004)(1076003)(305945005)(52116002)(102836004)(6916009)(229853002)(33656002)(33716001)(71190400001)(71200400001)(25786009)(8936002)(76176011)(316002)(86362001)(53546011)(386003)(5660300002)(6506007)(66066001)(6246003)(14454004)(55236004)(4326008)(26005)(6486002)(9686003)(6512007)(66476007)(2906002)(7736002)(66446008)(64756008)(66556008)(6116002)(3846002)(66946007)(6436002)(8676002)(476003)(446003)(11346002)(58126008)(478600001)(486006)(81156014)(186003)(99286004)(81166006)(256004)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5119;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: wrKhIg88kw6f7joum39OZNMfGbAoeoP05o162+BTXP+KCjsUhXZmJ17HyaJf0cgHFfPegFWuaIxfK52AUrnVhbrDh/9zUsAheDcGJl5K9JPImseijDdQvktax1VvIo8Io1fg1+74yebi63mYHy+KJoyxWPFFerTipZFLbdX0e9F8SFsaUsykw/ae/aj9svYXiO2EdGkYUVJkQca7WN7FmuNMBiRthetyEbtjDahe1CFsCOol3arhocSrCeKPxtq8b7bB6uf6ySHg/J2f+7bA9ZOt8M7UALrTUJv7zuCVfZ1dsdHcVodmVtqU4DC/HuYvXw20qh1EKxhOQWCe5rDK2q4b5TNNSPmsrB6ITy3CNtC1JDQ9Y7zUTX/Ln87NwHyibLAjYFzzX67PCDrehPntKdmbAZpPNbmXsQLdBSUSYKM=
Content-ID: <280853445FFF80489C1A703653481D96@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5119
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(39860400002)(376002)(346002)(136003)(51914003)(189003)(199004)(6506007)(53546011)(76176011)(386003)(33656002)(76130400001)(70206006)(70586007)(7736002)(305945005)(26005)(102836004)(50466002)(47776003)(356004)(99286004)(33716001)(36906005)(25786009)(478600001)(6512007)(14454004)(9686003)(26826003)(6246003)(4326008)(316002)(54906003)(6862004)(58126008)(81156014)(81166006)(229853002)(86362001)(336012)(8676002)(66066001)(8746002)(46406003)(8936002)(186003)(3846002)(2906002)(1076003)(6116002)(23726003)(97756001)(476003)(486006)(126002)(63350400001)(6486002)(22756006)(5660300002)(11346002)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4613;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a82089e6-05cc-4e09-52d4-08d74bc66f19
NoDisclaimer: True
X-Forefront-PRVS: 01842C458A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: beVrFj7a1h5XY7Ww5vFtQZoShjzaIFvXKOydq7kPE+YUJXYxpI6PZYevw+pBFIR5iv4s5Js6X/cD9t/5teyvOiBre9OC+ziVPXpzhm2xMIiyRxIXukNlLTISUGmUTl6tCn5h1K3b/9diyvdgmKJocHvPHvCyiSGVcr4n++37r2e/V6isfKUDyF/Dxq03QwKHDRwLoMHcmEVmUI+OyTwfkSqtoaPLSFCAdXV/ucZrVu43qGVOO/89epD9UFnC2XnL8/HfaUVzhsn/nHg30QBtmRMLMxEYITh1xsgH78mbrwXlExD09DArcwyvb+aIgol0YrsiM2q4+A3pbvx9lOa1KQbeCC8DjrU+zxhCMZrTRsz8hPIsUszF6M3EFJ76nsXNQZlVptc6n0FMx46zTs/f3tTTCGyGouJjWsljCRZ895E=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2019 08:06:49.4044 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe9f1e8-7bb2-453c-e190-08d74bc67894
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4613
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drQ9hLzOpV9DsXFhX7lPjxUSGbfWmD+ZWz3Ew18XLK4=;
 b=I56+dAaUTkCHBbRnMfKI2KqFJQ5PS/YLN00+DI/5JfShqSdMRt5uNbtgk6J4rzGGlXfLG0wXK+GAyT0YcHj+vy56Ss2qeOLP6vuBXdgN68KUyynAv3deYEOmLMy4koBx6Q7mU7lU9pmLgm5EdyzxqoB0xSVscAmynN1mIK5WnVY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drQ9hLzOpV9DsXFhX7lPjxUSGbfWmD+ZWz3Ew18XLK4=;
 b=I56+dAaUTkCHBbRnMfKI2KqFJQ5PS/YLN00+DI/5JfShqSdMRt5uNbtgk6J4rzGGlXfLG0wXK+GAyT0YcHj+vy56Ss2qeOLP6vuBXdgN68KUyynAv3deYEOmLMy4koBx6Q7mU7lU9pmLgm5EdyzxqoB0xSVscAmynN1mIK5WnVY=
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
Cc: David Airlie <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Colin Ian King <colin.king@canonical.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMDcsIDIwMTkgYXQgMDQ6MjU6MDVQTSArMDMwMCwgRGFuIENhcnBlbnRlciB3
cm90ZToKPiBPbiBGcmksIE9jdCAwNCwgMjAxOSBhdCAxMDo1Mzo0NFBNICswMTAwLCBDb2xpbiBJ
YW4gS2luZyB3cm90ZToKPiA+IE9uIDA0LzEwLzIwMTkgMjA6MjcsIExpdml1IER1ZGF1IHdyb3Rl
Ogo+ID4gPiBPbiBGcmksIE9jdCAwNCwgMjAxOSBhdCAwNToyMTo1NlBNICswMTAwLCBDb2xpbiBL
aW5nIHdyb3RlOgo+ID4gPj4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25p
Y2FsLmNvbT4KPiA+ID4+Cj4gPiA+PiBUaGUgcG9pbnRlciBkaXNhYmxlX2RvbmUgaXMgYmVpbmcg
aW5pdGlhbGl6ZWQgd2l0aCBhIHZhbHVlIHRoYXQKPiA+ID4+IGlzIG5ldmVyIHJlYWQgYW5kIGlz
IGJlaW5nIHJlLWFzc2lnbmVkIGEgbGl0dGxlIGxhdGVyIG9uLiBUaGUKPiA+ID4+IGFzc2lnbm1l
bnQgaXMgcmVkdW5kYW50IGFuZCBoZW5jZSBjYW4gYmUgcmVtb3ZlZC4KPiA+ID4gCj4gPiA+IE5v
dCByZWFsbHkgdHJ1ZSwgaXNuJ3QgaXQ/IFRoZSByZS1hc3NpZ25tZW50IGlzIGRvbmUgdW5kZXIg
dGhlIGNvbmRpdGlvbiB0aGF0Cj4gPiA+IGNydGMtPnN0YXRlLT5hY3RpdmUgaXMgdHJ1ZS4gZGlz
YWJsZV9kb25lIHdpbGwgYmUgdXNlZCByZWdhcmRsZXNzIGFmdGVyIHRoZSBpZgo+ID4gPiBibG9j
aywgc28gd2UgY2FuJ3Qgc2tpcCB0aGlzIGluaXRpYWxpc2F0aW9uLgo+ID4gPiAKPiA+ID4gTm90
IHN1cmUgd2h5IENvdmVyaXR5IGZsYWdzIHRoaXMsIGJ1dCBJIHdvdWxkIE5BSyB0aGlzIHBhdGNo
Lgo+ID4gCj4gPiBJJ20gcGF0Y2hpbmcgYWdhaW5zdCB0aGUgZHJpdmVyIGZyb20gbGludXgtbmV4
dCBzbyBJIGJlbGlldmUgdGhpcyBpcyBPSwo+ID4gZm9yIHRoYXQuIEkgYmVsaWV2ZSB5b3VyIHN0
YXRlbWVudCBpcyB0cnVlIGFnYWluc3QgbGludXggd2hpY2ggZG9lcyBub3QKPiA+IGhhdmUgY29t
bWl0Ogo+ID4gCj4gPiBkNmNiMDEzNTc5ZTc0M2JjN2JjNTU5MGNhMzVhMTk0M2YyYjhmM2M4Cj4g
PiBBdXRob3I6IExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPExvd3J5LkxpQGFybS5j
b20+Cj4gPiBEYXRlOiAgIEZyaSBTZXAgNiAwNzoxODowNiAyMDE5ICswMDAwCj4gPiAKPiAKPiBJ
dCByZWFsbHkgZG9lcyBoZWxwIHJldmlld2luZyBwYXRjaGVzIHdoZW4gdGhpcyBpcyBtZW50aW9u
ZWQgaW4gdGhlCj4gY29tbWl0IG1lc3NhZ2UuCj4gCj4gVGhlcmUgaXMgc29tZSBkZWJhdGUgYWJv
dXQgd2hldGhlciB0aGlzIHNob3VsZCBiZSBtZW50aW9uZWQgYXMgYSBGaXhlcwo+IHNpbmNlIGl0
IGRvZXNuJ3QgZml4IGEgYnVnLiAgSSBpbml0aWFseSBmZWx0IGl0IHNob3VsZG4ndCBiZSwgYnV0
IG5vdwo+IEkgdGhpbmsgZW5vdWdoIHBlb3BsZSB0aGluayBpdCBzaG91bGQgYmUgbGlzdGVkIGFz
IEZpeGVzIHRoYXQgSSBtdXN0IGJlCj4gd3JvbmcuICBFaXRoZXIgd2F5LCBpdCdzIHZlcnkgdXNl
ZnVsIGluZm9ybWF0aW9uLgo+IAo+IFRoZSBvdGhlciB0aGluZyBpcyB0aGF0IHNvb24gZ2V0X21h
aW50YWluZXIucGwgd2lsbCBzdGFydCBDQydpbmcgcGVvcGxlCj4gZnJvbSB0aGUgRml4ZXMgdGFn
IGFuZCByaWdodCBub3cgTG93cnkgTGkgaXMgbm90IENDJ2Qgc28gdGhhdCdzCj4gdW5mb3J0dW5h
dGUuCj4gCj4gcmVnYXJkcywKPiBkYW4gY2FycGVudGVyCgpIaSBMaXZpdToKCkNvbGluJ3MgY29k
ZSBpcyByaWdodC4KCkZvbGxvd2luZyBjb2RlIEkgY29waWVkIGZyb20gbGludXgtbmV4dCwgYW5k
IEkgY2hlY2tlZCBkcm0tbWlzYywgdGhlCmNvZGUgYXJlIHNhbWUuIAoKICAgICAgICBzdHJ1Y3Qg
a29tZWRhX3BpcGVsaW5lICpzbGF2ZSAgPSBrY3J0Yy0+c2xhdmU7Ci8vLS0tLSBGaXJzdCBpbml0
aWFsaXphdGlvbi4KICAgICAgICBzdHJ1Y3QgY29tcGxldGlvbiAqZGlzYWJsZV9kb25lID0gJmNy
dGMtPnN0YXRlLT5jb21taXQtPmZsaXBfZG9uZTsKICAgICAgICBib29sIG5lZWRzX3BoYXNlMiA9
IGZhbHNlOwoKICAgICAgICBEUk1fREVCVUdfQVRPTUlDKCJDUlRDJWRfRElTQUJMRTogYWN0aXZl
X3BpcGVzOiAweCV4LCBhZmZlY3RlZDogMHgleFxuIiwKICAgICAgICAgICAgICAgICAgICAgICAg
IGRybV9jcnRjX2luZGV4KGNydGMpLAogICAgICAgICAgICAgICAgICAgICAgICAgb2xkX3N0LT5h
Y3RpdmVfcGlwZXMsIG9sZF9zdC0+YWZmZWN0ZWRfcGlwZXMpOwoKICAgICAgICBpZiAoc2xhdmUg
JiYgaGFzX2JpdChzbGF2ZS0+aWQsIG9sZF9zdC0+YWN0aXZlX3BpcGVzKSkKICAgICAgICAgICAg
ICAgIGtvbWVkYV9waXBlbGluZV9kaXNhYmxlKHNsYXZlLCBvbGQtPnN0YXRlKTsKCiAgICAgICAg
aWYgKGhhc19iaXQobWFzdGVyLT5pZCwgb2xkX3N0LT5hY3RpdmVfcGlwZXMpKQogICAgICAgICAg
ICAgICAgbmVlZHNfcGhhc2UyID0ga29tZWRhX3BpcGVsaW5lX2Rpc2FibGUobWFzdGVyLCBvbGQt
PnN0YXRlKTsKCi8vLS0tLSBTZWNvbmRhcnkgaW5pdGlhbGl6YXRpb24uCiAgICAgICAgZGlzYWJs
ZV9kb25lID0gKG5lZWRzX3BoYXNlMiB8fCBjcnRjLT5zdGF0ZS0+YWN0aXZlKSA/CiAgICAgICAg
ICAgICAgICAgICAgICAgTlVMTCA6ICZjcnRjLT5zdGF0ZS0+Y29tbWl0LT5mbGlwX2RvbmU7Cgov
Ly0tLSBGaXJzdCB1c2luZyBpcyBoZXJlLgogICAgICAgIC8qIHdhaXQgcGhhc2UgMSBkaXNhYmxl
IGRvbmUgKi8KICAgICAgICBrb21lZGFfY3J0Y19mbHVzaF9hbmRfd2FpdF9mb3JfZmxpcF9kb25l
KGtjcnRjLCBkaXNhYmxlX2RvbmUpOwoKU28gdGhlIGZpcnN0IGluaXRpYWxpemF0aW9uIHdpdGgg
dGhlIGRlbGNhcmF0aW9uIGlzIHVubmVjZXNzYXJ5LgoKQW5kIEkgYWxzbyBjaGVja2VkIG91ciBp
bnRlcm5hbCB0ZXN0aW5nIGJyYW5jaCB3aGljaCBhY3R1YWxseSBkb2Vzbid0IGhhdmUKdGhlIGZp
cnN0IGluaXRpYWxpemF0aW9uLiBzZWVtcyBzb21ldGhpbmdzIHdyb25nIHdoZW4gbG93cnkgc3Vi
bWl0IHRoaXMgdG8KdXBzdHJlYW0uCgpIaSBDb2xpbjoKClRoYW5rcyBmb3IgdGhlIGZpeC4gSSds
bCBwdXNoIGl0IHRvIGRybS1taXNjLWZpeGVzCgpSZXZpZXdlZC1ieTogSmFtZXMgUWlhbiBXYW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgoKQmVzdCBS
ZWdhcmRzCkphbWVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
