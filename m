Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B057DCED1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993326E0E5;
	Fri, 18 Oct 2019 18:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00086.outbound.protection.outlook.com [40.107.0.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D236E0E5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 18:57:49 +0000 (UTC)
Received: from DB6PR0801CA0062.eurprd08.prod.outlook.com (2603:10a6:4:2b::30)
 by HE1SPR00MB241.eurprd08.prod.outlook.com (2603:10a6:3:e2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.20; Fri, 18 Oct
 2019 18:57:43 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::207) by DB6PR0801CA0062.outlook.office365.com
 (2603:10a6:4:2b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 18 Oct 2019 18:57:42 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 18 Oct 2019 18:57:40 +0000
Received: ("Tessian outbound 851a1162fca7:v33");
 Fri, 18 Oct 2019 18:57:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d854c8622283f904
X-CR-MTA-TID: 64aa7808
Received: from 4ca6af9cd97e.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.13.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8C46B13C-AA42-4BBD-82B4-72C1D1A92CE1.1; 
 Fri, 18 Oct 2019 18:57:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4ca6af9cd97e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Oct 2019 18:57:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cj3LSgxAvIJ9+PxOVxaRoFqqkLStHj9XxcnAhzC40rPpc9+/oA/rJs1gf9dbXyN2t8JKgpjNW7CNipLwYFKYar0uwlH3Nzu0kQOrm91RRFHDuigRIvyjaeC3YfjgafRvLIYjUd3QI0b0I5vBpi6JceRc8hySR7iwdLgQAQSbdH4eBC+bIpl+YHoF/cnYVqxsNytXeIftXD/4DI3EQVVzunSvboxyou+iqP+6nr6mBOoTwwmoPsg7wApWuNwgO3ZyrPhH2c1YulV71f545iv9vSwkk6x2aWhzBu4jtY6WInT4ZULf/9VYxZBLgWYShdZabEODjwy4LqA/saNqIwkA6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYRKqjaac8RJ5BfUbH3QKR/LrWfycplJ9cHXAD53flk=;
 b=QJDyk4K8zTxRSVweY1003KbZl8YAR11Dr1lSzw03tOs4trsNCEA22/ovqyI92xW1f1EqR9IZdQcxocaPcDLaXTG6uVQxoi9XdVkn2SIdunKY3V44jk/cKbbBJe8n1V3E8jNY4MkODb5raxQNvgj1XhQnMAWhqjBdzjC+Acul6supF2kmO3RGtYKBxbfrzE8W9862+GG1p5Z1ZQKMB44BigjSd+t+teOyCZiDxx3v7zBqL7AmwZUidJyAQEbh28gIzb0F95edPMX6YxOJUiOQZ+z5dcbdQJFCSHHj6Fg3+YS70dSaHC+zoVJuOa5A2rDfNtxMi1HkPnfocWqqlwqF0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM7PR08MB5352.eurprd08.prod.outlook.com (10.141.172.139) by
 AM7PR08MB5366.eurprd08.prod.outlook.com (10.141.172.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.22; Fri, 18 Oct 2019 18:57:24 +0000
Received: from AM7PR08MB5352.eurprd08.prod.outlook.com
 ([fe80::84b1:861:46e8:7a4e]) by AM7PR08MB5352.eurprd08.prod.outlook.com
 ([fe80::84b1:861:46e8:7a4e%4]) with mapi id 15.20.2347.023; Fri, 18 Oct 2019
 18:57:24 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
Thread-Topic: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
Thread-Index: AQHVZOOF+0BJBq1hEUK86gknnLECMKczS0sAgAfTZICAF6gMgIAADdeAgAc/QoCAA7QPgIABrHYAgAAEJoCAABjGgIAA2T6AgACS/YCAAAI7AIAAAj6A
Date: Fri, 18 Oct 2019 18:57:24 +0000
Message-ID: <20191018185723.GA27993@arm.com>
References: <20191009173742.GA2682@arm.com>
 <f4fb09a5-999b-e676-0403-cc0de41be440@ti.com>
 <20191014090729.lwusl5zxa32a7uua@DESKTOP-E1NTVVP.localdomain>
 <a213760f-1f41-c4a3-7e38-8619898adecd@ti.com>
 <CALAqxLV6EBHKPEaEkyfhEYyw0TXayTeY_4AWXfuASLLyxZh5+Q@mail.gmail.com>
 <a3c66479-7433-ec29-fbec-81aef60cb063@ti.com>
 <CALAqxLWrsXG0XysL7RmhApbuZukDdG5VhdHOTS5odkG9f1ezwA@mail.gmail.com>
 <20191018095516.inwes5avdeixl5nr@DESKTOP-E1NTVVP.localdomain>
 <20191018184123.GA10634@arm.com>
 <CALAqxLXzOjyD1MpGeuZKLz+RNz1Utd8QpbvtSOodeqT-gCu6kA@mail.gmail.com>
In-Reply-To: <CALAqxLXzOjyD1MpGeuZKLz+RNz1Utd8QpbvtSOodeqT-gCu6kA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0373.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::25) To AM7PR08MB5352.eurprd08.prod.outlook.com
 (2603:10a6:20b:106::11)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.53]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e8b523c3-d7d8-4e2e-2f4e-08d753fd0cc4
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM7PR08MB5366:|AM7PR08MB5366:|HE1SPR00MB241:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1SPR00MB2419FF4A05451A51470FB42E46C0@HE1SPR00MB241.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 01949FE337
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(199004)(189003)(3846002)(6916009)(6116002)(1076003)(5660300002)(7416002)(7736002)(66446008)(66556008)(305945005)(66946007)(66476007)(64756008)(66066001)(86362001)(4326008)(229853002)(316002)(102836004)(54906003)(26005)(386003)(6506007)(53546011)(6486002)(14454004)(186003)(8936002)(6512007)(81166006)(8676002)(71190400001)(71200400001)(81156014)(99286004)(76176011)(256004)(14444005)(52116002)(44832011)(486006)(2616005)(25786009)(446003)(11346002)(6246003)(476003)(36756003)(33656002)(561944003)(2906002)(6436002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM7PR08MB5366;
 H:AM7PR08MB5352.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: QARJO7cP97IdgYB536jf3jTgdZtHOn/EiNSf7Kh2JNE0VVotv5eq/UvsrsPYaXqXuIc2q0sgjomJm2fxxwSqX2xiUoO0btTLvdlCAj1r+yBZpGf+h7NkwmJGaeOj8hjbGq+si4DMZCynjEK1oJhkh7FWpARGOzzK7Osqcaa+4SzZRLiQgg+dnwVfY1mLxRMFMEpBJMf505O9zGwfBFPVhsBdhA2WuhBpUNHZ1gnHhwqeE7llngQvnkJaZBTOVkL72CK4LwgB0wwAFHYTd9Mu0pi4Sd3dBN7EffXVqjT2cMrM2GG0QnKir0rZV8OhdovIU6aLZOEz/pGe94BMp4dO6KpTIJyNIoJXP2gC3bFTGn/ugVVRCnCu/Z6VESac9EqBe5lyjv9dIlsIlDfkrFr57aizRUG8kXxmmSoqlg3ziIk=
Content-ID: <A4E2AC8BAA4B7C4FBEFA11954460CCBD@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5366
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(346002)(136003)(189003)(199004)(53546011)(446003)(6506007)(386003)(11346002)(356004)(70586007)(70206006)(26005)(76130400001)(476003)(36906005)(126002)(2616005)(76176011)(316002)(336012)(99286004)(14444005)(102836004)(305945005)(63350400001)(1076003)(6246003)(8676002)(81156014)(81166006)(6512007)(107886003)(486006)(25786009)(7736002)(54906003)(6862004)(46406003)(4326008)(33656002)(86362001)(5660300002)(8936002)(229853002)(23726003)(561944003)(8746002)(6486002)(22756006)(97756001)(66066001)(186003)(6116002)(3846002)(36756003)(478600001)(26826003)(50466002)(2906002)(14454004)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1SPR00MB241;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 09b0b0dc-c150-42af-32bb-08d753fd0351
NoDisclaimer: True
X-Forefront-PRVS: 01949FE337
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KbgxNed58XusobEyH70iNYnFJztej7v1RDZuw4VlE2FWgQE+2ghmwtdNWtfcqHKloIpPjJPYNaQBO9pafq8r0JL249FacTm9Fr3p8B6YEkSV/77T4/Q1XEGSSvWxktkeA1OPcUPWiljbOrOuaSedW3lH1J6uxw94T2rjEBJy/uV5AP0FVzr1iOMX19BqqsGutR1SktrrOO1UI2+hBeqFDrJKS2TcJ9Y55V1vUb032fOfSvxfn/RbHkhZdrahSQeXK8zjXz7yZipy+SA5GOVu/i9BLAF0SvT+iUn3yj4yoXSxHvf8b4ePsl6L8ZLUOCqjfftNeYmgcmOaJzz4Rrl7RAYENE5khlIWh75nWhEUFKoN3pcwrjq4efJrA3H0MPY8ccqRNz6Lf55Ock/SXxYWMhCLgH5l8Ts54bbfP/wl59hEidrqCmBuFCcg+VxNiaug
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2019 18:57:40.1158 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b523c3-d7d8-4e2e-2f4e-08d753fd0cc4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1SPR00MB241
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYRKqjaac8RJ5BfUbH3QKR/LrWfycplJ9cHXAD53flk=;
 b=XT6m/grwtV1YJvSE7dBGKMnKZX+bnbv/sIYhVsDSE8yN2eZ1adJqg/0uJhwrFLPwbFwmB+fn9P1Y+SE8KYo21+65pdoFu3oBlvDeXb/d26Ozy9iJiA88QSFmO2Z0eSIJXcroKUzCwp9Lzho5s7sZGliGLGsrydZ7rew6Zcy2nlw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYRKqjaac8RJ5BfUbH3QKR/LrWfycplJ9cHXAD53flk=;
 b=XT6m/grwtV1YJvSE7dBGKMnKZX+bnbv/sIYhVsDSE8yN2eZ1adJqg/0uJhwrFLPwbFwmB+fn9P1Y+SE8KYo21+65pdoFu3oBlvDeXb/d26Ozy9iJiA88QSFmO2Z0eSIJXcroKUzCwp9Lzho5s7sZGliGLGsrydZ7rew6Zcy2nlw=
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
Cc: Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>,
 lkml <linux-kernel@vger.kernel.org>, Chenbo Feng <fengc@google.com>,
 Alistair Strachan <astrachan@google.com>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F. Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, nd <nd@arm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMTE6NDk6MjJBTSAtMDcwMCwgSm9obiBTdHVsdHogd3Jv
dGU6Cj4gT24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMTE6NDEgQU0gQXlhbiBIYWxkZXIgPEF5YW4u
SGFsZGVyQGFybS5jb20+IHdyb3RlOgo+ID4gT24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMDk6NTU6
MTdBTSArMDAwMCwgQnJpYW4gU3RhcmtleSB3cm90ZToKPiA+ID4gT24gVGh1LCBPY3QgMTcsIDIw
MTkgYXQgMDE6NTc6NDVQTSAtMDcwMCwgSm9obiBTdHVsdHogd3JvdGU6Cj4gPiA+ID4gT24gVGh1
LCBPY3QgMTcsIDIwMTkgYXQgMTI6MjkgUE0gQW5kcmV3IEYuIERhdmlzIDxhZmRAdGkuY29tPiB3
cm90ZToKPiA+ID4gPiA+IE9uIDEwLzE3LzE5IDM6MTQgUE0sIEpvaG4gU3R1bHR6IHdyb3RlOgo+
ID4gPiA+ID4gPiBCdXQgaWYgdGhlIG9iamVjdGlvbiBzdGFuZHMsIGRvIHlvdSBoYXZlIGEgcHJv
cG9zYWwgZm9yIGFuIGFsdGVybmF0aXZlCj4gPiA+ID4gPiA+IHdheSB0byBlbnVtZXJhdGUgYSBz
dWJzZXQgb2YgQ01BIGhlYXBzPwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gV2hlbiBpbiBzdGFnaW5n
IElPTiBoYWQgdG8gcmVhY2ggaW50byB0aGUgQ01BIGZyYW1ld29yayBhcyB0aGUgb3RoZXIKPiA+
ID4gPiA+IGRpcmVjdGlvbiB3b3VsZCBub3QgYmUgYWxsb3dlZCwgc28gY21hX2Zvcl9lYWNoX2Fy
ZWEoKSB3YXMgYWRkZWQuIElmCj4gPiA+ID4gPiBETUEtQlVGIGhlYXBzIGlzIG5vdCBpbiBzdGFn
aW5nIHRoZW4gd2UgY2FuIGRvIHRoZSBvcHBvc2l0ZSwgYW5kIGhhdmUKPiA+ID4gPiA+IHRoZSBD
TUEgZnJhbWV3b3JrIHJlZ2lzdGVyIGhlYXBzIGl0c2VsZiB1c2luZyBvdXIgZnJhbWV3b3JrLiBU
aGF0IHdheQo+ID4gPiA+ID4gdGhlIENNQSBzeXN0ZW0gY291bGQgZGVjaWRlIHdoYXQgYXJlYXMg
dG8gZXhwb3J0IG9yIG5vdCAobWF5YmUgYmFzZWQgb24KPiA+ID4gPiA+IGEgRFQgcHJvcGVydHkg
b3Igc2ltaWxhcikuCj4gPiA+ID4KPiA+ID4gPiBPay4gVGhvdWdoIHRoZSBDTUEgY29yZSBkb2Vz
bid0IGhhdmUgbXVjaCBzZW5zZSBvZiBEVCBkZXRhaWxzIGVpdGhlciwKPiA+ID4gPiBzbyBpdCB3
b3VsZCBwcm9iYWJseSBoYXZlIHRvIGJlIGRvbmUgaW4gdGhlIHJlc2VydmVkX21lbSBsb2dpYywg
d2hpY2gKPiA+ID4gPiBkb2Vzbid0IGZlZWwgcmlnaHQgdG8gbWUuCj4gPiA+ID4KPiA+ID4gPiBJ
J2QgcHJvYmFibHkgZ3Vlc3Mgd2Ugc2hvdWxkIGhhdmUgc29tZSBzb3J0IG9mIGR0IGJpbmRpbmcg
dG8gZGVzY3JpYmUKPiA+ID4gPiBhIGRtYWJ1ZiBjbWEgaGVhcCBhbmQgZnJvbSB0aGF0IG5vZGUg
bGluayB0byBhIENNQSBub2RlIHZpYSBhCj4gPiA+ID4gbWVtb3J5LXJlZ2lvbiBwaGFuZGxlLiBB
bG9uZyB3aXRoIG1heWJlIHRoZSBkZWZhdWx0IGhlYXAgYXMgd2VsbD8gTm90Cj4gPiA+ID4gZWFn
ZXIgdG8gZ2V0IGludG8gYW5vdGhlciBiaW5kaW5nIHJldmlldyBjeWNsZSwgYW5kIEknbSBub3Qg
c3VyZSB3aGF0Cj4gPiA+ID4gbm9uLURUIHN5c3RlbXMgd2lsbCBkbyB5ZXQsIGJ1dCBJJ2xsIHRh
a2UgYSBzaG90IGF0IGl0IGFuZCBpdGVyYXRlLgo+ID4gPiA+Cj4gPiA+ID4gPiBUaGUgZW5kIHJl
c3VsdCBpcyB0aGUgc2FtZSBzbyB3ZSBjYW4gbWFrZSB0aGlzIGNoYW5nZSBsYXRlciAoaXQgaGFz
IHRvCj4gPiA+ID4gPiBjb21lIGFmdGVyIERNQS1CVUYgaGVhcHMgaXMgaW4gYW55d2F5KS4KPiA+
ID4gPgo+ID4gPiA+IFdlbGwsIEknbSBoZXNpdGFudCB0byBtZXJnZSBjb2RlIHRoYXQgZXhwb3Nl
cyBhbGwgdGhlIENNQSBoZWFwcyBhbmQKPiA+ID4gPiB0aGVuIGFkZCBwYXRjaGVzIHRoYXQgYmVj
b21lcyBtb3JlIHNlbGVjdGl2ZSwgc2hvdWxkIGFueW9uZSBkZXBlbmQgb24KPiA+ID4gPiB0aGUg
aW5pdGlhbCBiZWhhdmlvci4gOi8KPiA+ID4KPiA+ID4gSG93IGFib3V0IG9ubHkgYXV0by1hZGRp
bmcgdGhlIHN5c3RlbSBkZWZhdWx0IENNQSByZWdpb24gKGNtYS0+bmFtZSA9PQo+ID4gPiAicmVz
ZXJ2ZWQiKT8KPiA+ID4KPiA+ID4gQW5kL29yIHRoZSBDTUEgYXV0by1hZGQgY291bGQgYmUgYmVo
aW5kIGEgY29uZmlnIG9wdGlvbj8gSXQgc2VlbXMgYQo+ID4gPiBzaGFtZSB0byBmdXJ0aGVyIGRl
bGF5IHRoaXMsIGFuZCB0aGUgQ01BIGhlYXAgaXRzZWxmIHJlYWxseSBpcyB1c2VmdWwuCj4gPiA+
Cj4gPiBBIGJpdCBvZiBhIGRldG91ciwgY29tbWluZyBiYWNrIHRvIHRoZSBpc3N1ZSB3aHkgdGhl
IGZvbGxvd2luZyBub2RlCj4gPiB3YXMgbm90IGdldHRpbmcgZGV0ZWN0ZWQgYnkgdGhlIGRtYS1i
dWYgaGVhcHMgZnJhbWV3b3JrLgo+ID4KPiA+ICAgICAgICAgcmVzZXJ2ZWQtbWVtb3J5IHsKPiA+
ICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsKPiA+ICAgICAgICAgICAgICAg
ICAjc2l6ZS1jZWxscyA9IDwyPjsKPiA+ICAgICAgICAgICAgICAgICByYW5nZXM7Cj4gPgo+ID4g
ICAgICAgICAgICAgICAgIGRpc3BsYXlfcmVzZXJ2ZWQ6IGZyYW1lYnVmZmVyQDYwMDAwMDAwIHsK
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic2hhcmVkLWRtYS1wb29s
IjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGxpbnV4LGNtYS1kZWZhdWx0Owo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgcmV1c2FibGU7IDw8PDw8PDw8PDw8PC0tLS0tLS0tLS0tVGhp
cyB3YXMgbWlzc2luZyBpbiBvdXIKPiA+IGVhcmxpZXIgbm9kZQo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgcmVnID0gPDAgMHg2MDAwMDAwMCAwIDB4MDgwMDAwMDA+Owo+ID4gICAgICAgICAg
ICAgICAgIH07Cj4gCj4gUmlnaHQuIEl0IGhhcyB0byBiZSBhIENNQSByZWdpb24gZm9yIHVzIHRv
IGV4cG9zZSBpdCBmcm9tIHRoZSBjbWEgaGVhcC4KPiAKPiAKPiA+IFdpdGggJ3JldXNhYmxlJywg
cm1lbV9jbWFfc2V0dXAoKSBzdWNjZWVkcyAsIGJ1dCB0aGUga2VybmVsIGNyYXNoZXMgYXMgZm9s
bG93cyA6LQo+ID4KPiA+IFsgICAgMC40NTA1NjJdIFdBUk5JTkc6IENQVTogMiBQSUQ6IDEgYXQg
bW0vY21hLmM6MTEwIGNtYV9pbml0X3Jlc2VydmVkX2FyZWFzKzB4ZWMvMHgyMmMKPiAKPiBJcyB0
aGUgdmFsdWUgMHg2MDAwMDAwMCB5b3UncmUgdXNpbmcgc29tZXRoaW5nIHlvdSBqdXN0IGd1ZXNz
ZWQgYXQ/IEl0Cj4gc2VlbXMgbGlrZSB0aGUgd2FybmluZyBoZXJlIGlzIHNheWluZyB0aGUgcGZu
IGNhbGN1bGF0ZWQgZnJvbSB0aGUgYmFzZQo+IGFkZHJlc3MgaXNuJ3QgdmFsaWQuCkl0IGlzIGEg
dmFsaWQgbWVtb3J5IHJlZ2lvbiB3ZSB1c2UgdG8gYWxsb2NhdGUgZnJhbWVidWZmZXJzLgo+IAo+
IHRoYW5rcwo+IC1qb2huCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
