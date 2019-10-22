Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD51ADFB62
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 04:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306D26E1F7;
	Tue, 22 Oct 2019 02:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40068.outbound.protection.outlook.com [40.107.4.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160CD6E1F7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 02:08:23 +0000 (UTC)
Received: from AM6PR08CA0033.eurprd08.prod.outlook.com (2603:10a6:20b:c0::21)
 by DB7PR08MB3177.eurprd08.prod.outlook.com (2603:10a6:5:26::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Tue, 22 Oct
 2019 02:08:20 +0000
Received: from AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by AM6PR08CA0033.outlook.office365.com
 (2603:10a6:20b:c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.20 via Frontend
 Transport; Tue, 22 Oct 2019 02:08:20 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT017.mail.protection.outlook.com (10.152.16.89) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.23 via Frontend Transport; Tue, 22 Oct 2019 02:08:18 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Tue, 22 Oct 2019 02:08:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a26d323599904e58
X-CR-MTA-TID: 64aa7808
Received: from c36084a998ff.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.0.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E81ACF25-D81E-4C88-A515-D29E7257342C.1; 
 Tue, 22 Oct 2019 02:08:11 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c36084a998ff.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Oct 2019 02:08:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rn7ngodZve/YJuI7lYY+gadxiX5tGkXk4zTmJBOD96KfGYq7jR392KVh9nGMNnZLFIjrvYSeBYsh2MSjVc+PVSsWgxlBoRPniqQgw3Yi6KYVm1ujE8d/4FRTJ4t+KmO20WW2ryT6oVeJttVlN7SRvYdGYVpiauZV5wk3ARRjb7onGFoWGgYKvWj2C9qTuKGOfp00jqehBd6ffwUcjb56WvuRmZkDbqeCXHyUarjMGBzbUfRBfYrWA5wOwOjGXxF+lI3wikpLn1B1HSaaJYGkJlAeRemWbLgwl4RHhwwGhn9o16Ti7gYIaepYekqJ/23rq/jia0wiZ7bakqD7IOZqBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fR8iV/tyMbIIJ8GiB9jNBi5ecWSfy1bS6qo6urZ7LF0=;
 b=c+GFwiH2XUrknIj7DgjbvZnmwsiQ4CvVhsYWBA5VtnabBGrVjh7ANAyywKi7LJJ1q8vFG4J3C3T85KIMxod9Wd49ekPP5CN0BPLpx1B+Z5LUFcpaJxo7DM28o2/SmLEQytxFNAlnokvsqFBQNquoG+Y1LaMM6acp+FpIzdzyrQ8wz3Sb11evzak47eNGSDLioIH1VGkSYwnuxkeKGhsPaRr6fzSC8kDXXKfOXD+91rIJ7RFMXmHwNVtuuEmUMIAvEeHxc/R9TinLOiafTWYn4nTyTZgUDAdLAMTPe89JmlmRshjp7OK+p/zFQgZYMYP00SVIoDqrHnyKY/Tef4hS+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5037.eurprd08.prod.outlook.com (10.255.158.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 22 Oct 2019 02:08:08 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2367.022; Tue, 22 Oct 2019
 02:08:08 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] MAINTAINERS: Add Mihail to Komeda DRM driver
Thread-Topic: [PATCH] MAINTAINERS: Add Mihail to Komeda DRM driver
Thread-Index: AQHViCB7QBCpqKK/Z0mgls76GftRf6dlX0SAgACLioA=
Date: Tue, 22 Oct 2019 02:08:08 +0000
Message-ID: <20191022020801.GA25296@jamwan02-TSP300>
References: <20191021150123.19570-1-mihail.atanassov@arm.com>
 <20191021174835.GD85762@art_vandelay>
In-Reply-To: <20191021174835.GD85762@art_vandelay>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR06CA0008.apcprd06.prod.outlook.com
 (2603:1096:202:2e::20) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eb568e27-c786-4991-f96a-08d75694b4ce
X-MS-TrafficTypeDiagnostic: VE1PR08MB5037:|VE1PR08MB5037:|DB7PR08MB3177:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB31771B352913953F606F180AB3680@DB7PR08MB3177.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1468;OLM:1468;
x-forefront-prvs: 01986AE76B
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(136003)(396003)(366004)(346002)(376002)(39860400002)(189003)(199004)(33716001)(81156014)(305945005)(52116002)(76176011)(386003)(26005)(6506007)(66556008)(3846002)(486006)(66946007)(4326008)(476003)(6116002)(102836004)(55236004)(99286004)(8676002)(316002)(6512007)(9686003)(4744005)(14454004)(64756008)(8936002)(66446008)(81166006)(66476007)(7736002)(5660300002)(6246003)(58126008)(25786009)(66066001)(71190400001)(186003)(71200400001)(6436002)(54906003)(446003)(86362001)(33656002)(1076003)(6486002)(2906002)(6916009)(256004)(229853002)(11346002)(7416002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5037;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: qe56CWEp7dWpMDb9FB1lop+X+Wb6ydA2vhcEt4kuCO8QixrO1EWVjl0LbOlllHOA8ZZXWosWs/uu2RUnyr+hNI0PmDvDwtq1/iF2ZJ2egtb9p65f5dKEEr3DmhMurBSsUDmsXq9TKMfDItunpCkgB2J34oRnArw+FmnXvVVcGGFJrqd+ARzUNHbCIwsW1JWXZ9j0glExutwFg6uGINyKWUVfu9EbP3AItZ+/BOow7nHs1C3ja0C2NUmpHDFpYGyPyzQ2fyDKStoK98tHtpl8IQP+8mEACpCRcIwtYmLVZLmnxwrgmFie4RfeZE84VL0qvUlFCz5+2AW9pL0g6hM0VukDpZ5eXs4aRspE8209a1FRf9N3iGFLUpaLAxTGHSyyDEs0nN4asFvOXVgduQd7BQ6n1ARYxslaebIe4PCAaIwnPzga6gz1yOn8uSfRFhHb
Content-ID: <E5731EEF4BEB554ABCE63D26A2759993@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5037
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(136003)(346002)(376002)(39860400002)(396003)(199004)(189003)(33716001)(336012)(50466002)(386003)(8676002)(446003)(11346002)(70206006)(70586007)(476003)(81166006)(5660300002)(356004)(1076003)(26826003)(478600001)(26005)(14454004)(25786009)(81156014)(47776003)(76130400001)(66066001)(186003)(9686003)(22756006)(486006)(6512007)(102836004)(6506007)(6862004)(86362001)(126002)(6116002)(76176011)(8746002)(316002)(46406003)(8936002)(23726003)(6246003)(229853002)(7736002)(4326008)(33656002)(36906005)(99286004)(58126008)(2906002)(3846002)(63350400001)(6486002)(97756001)(54906003)(305945005)(107886003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3177;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 49dd79d8-e8cf-4235-0982-08d75694aeb4
NoDisclaimer: True
X-Forefront-PRVS: 01986AE76B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eE/B0nhWjynsmf8obr5XHuKthAnIQtN1R8MT2qmd39KIjXRoD4aSf3f6a8i5MYhK9VEFB/USyK6CLkTLILzBX+Pla8m6FCuQipaazIr9IGCHJdG0VWruNUrgVIVCwpcl5isIHe1eccmiLR3//LCVXkfLEkeH4yV75xYEmaBzD2YFmnBJjFWSlL4wGQu9kLOomDij4BemW5B0qptumWeRpSCI5Mf76JgFRPej3CMTDXVmcQhMr753NA23YA7WOHvry+I5Mbb2BQlLgMAGc6xjFFdN+JBUYWxb05pYxcfyHEvAByIAycZf2yzRTFiQeqcUJmpZjjk8+kTinYlPi93eTvxsPaaN4tFOXmTKaOgJeKdY+wssRIg+p9oEBsaWlx5AvfFjqK1+8ceqRNrmwajpIfqznHKpNKT/f5SuGt4jyHo=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2019 02:08:18.4245 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb568e27-c786-4991-f96a-08d75694b4ce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3177
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fR8iV/tyMbIIJ8GiB9jNBi5ecWSfy1bS6qo6urZ7LF0=;
 b=ZgIuiV9CML5+OviTXbo+GXcUbupE3Q0q+zYqkTBvaQ5MmrLwsQsIQ3zBAMif3KRJswfVF8Fjwe/FKWGVpLNJSG9CQ3hkS/UEilUhHGupWNdMNindXtKt1b4aSu/A9mhv8F+m4jsKmUL76IgO6Jb71PrWYFWoC/kXI1fUJEj92B4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fR8iV/tyMbIIJ8GiB9jNBi5ecWSfy1bS6qo6urZ7LF0=;
 b=ZgIuiV9CML5+OviTXbo+GXcUbupE3Q0q+zYqkTBvaQ5MmrLwsQsIQ3zBAMif3KRJswfVF8Fjwe/FKWGVpLNJSG9CQ3hkS/UEilUhHGupWNdMNindXtKt1b4aSu/A9mhv8F+m4jsKmUL76IgO6Jb71PrWYFWoC/kXI1fUJEj92B4=
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, nd <nd@arm.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDE6NDg6MzVQTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IE9uIE1vbiwgT2N0IDIxLCAyMDE5IGF0IDAzOjAxOjU2UE0gKzAwMDAsIE1paGFpbCBBdGFu
YXNzb3Ygd3JvdGU6Cj4gPiBJJ2xsIGJlIHRoZSBtYWluIHBvaW50IG9mIGNvbnRhY3QuCj4gPiAK
PiA+IENjOiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlh
bi53YW5nQGFybS5jb20+Cj4gPiBDYzogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5jb20+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFy
bS5jb20+Cj4gCj4gQWNrZWQtYnk6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgoKUmV2aWV3
ZWQtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFu
LndhbmdAYXJtLmNvbT4KCj4gPiAtLS0KPiA+ICBNQUlOVEFJTkVSUyB8IDEgKwo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5F
UlMgYi9NQUlOVEFJTkVSUwo+ID4gaW5kZXggOTRmYjA3N2MwODE3Li5kMzJmMjYzZjAwMjIgMTAw
NjQ0Cj4gPiAtLS0gYS9NQUlOVEFJTkVSUwo+ID4gKysrIGIvTUFJTlRBSU5FUlMKPiA+IEBAIC0x
MjUxLDYgKzEyNTEsNyBAQCBGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9hcm0saGRsY2QudHh0Cj4gPiAgQVJNIEtPTUVEQSBEUk0tS01TIERSSVZFUgo+ID4gIE06
CUphbWVzIChRaWFuKSBXYW5nIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KPiA+ICBNOglMaXZp
dSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KPiA+ICtNOglNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Cj4gPiAgTDoJTWFsaSBEUCBNYWludGFpbmVycyA8bWFs
aWRwQGZvc3MuYXJtLmNvbT4KPiA+ICBTOglTdXBwb3J0ZWQKPiA+ICBUOglnaXQgZ2l0Oi8vYW5v
bmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjCj4gPiAtLSAKPiA+IDIuMjMuMAo+ID4g
Cj4gCj4gLS0gCj4gU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21p
dW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
