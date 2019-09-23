Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ADDBBE4D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 00:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA376E9A5;
	Mon, 23 Sep 2019 22:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10078.outbound.protection.outlook.com [40.107.1.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111E26E9A5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 22:09:15 +0000 (UTC)
Received: from VI1PR0802CA0020.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::30) by DB6PR08MB2823.eurprd08.prod.outlook.com
 (2603:10a6:6:21::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.25; Mon, 23 Sep
 2019 22:09:10 +0000
Received: from AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::207) by VI1PR0802CA0020.outlook.office365.com
 (2603:10a6:800:aa::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.23 via Frontend
 Transport; Mon, 23 Sep 2019 22:09:10 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT049.mail.protection.outlook.com (10.152.17.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20 via Frontend Transport; Mon, 23 Sep 2019 22:09:08 +0000
Received: ("Tessian outbound 55d20e99e8e2:v31");
 Mon, 23 Sep 2019 22:09:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f8cd07ef4be39880
X-CR-MTA-TID: 64aa7808
Received: from c5da9443c0cf.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.57]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E92ADA13-9602-42E0-92AB-084ADA34C547.1; 
 Mon, 23 Sep 2019 22:08:58 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c5da9443c0cf.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 Sep 2019 22:08:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NdAUw8m/5H+Lw6dsyoeI/eai/qaQmzATkd5+8Ebfb47X2hGtOmRlTFsVWGmzr9PxMZc+2S3jaNY2zZmLAbaX/0lyc8B9ggWgOEMbbtaD09gII/WacB3rSbhhOxGANRtpFYe5hSt6Qldwleq/3FaNNRByde12Ar/KaLsx/CrzRk954bLksxCoxKkw/Zkv1SOu4cjBr28D5kP6liceaZhGYcGkMDtCXnw0ogz7yNJ520yL9V8Q+19mClazt9W/DU7J1cF+WLFdvwnWUc/9PwL6ZMCx83c+Ua1YgGqqgJa79iaDZwikoTN2rwRA/BM7DqKV/gdVHMORgfgPxsCP6VQL2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fs0uLQ+7ayo72lsps0s5J4WoZOy8kgBAOwtwOVbbh28=;
 b=bsv4qFuDFTGRK9xJhgyvqfgqNXgVN9pZ/8zFlm+z+LdOK+e7fI/SBRuS1BfijJYeF7NRxOlz24yWicKzpRT1Y3Rlp+AzE1Bahls6sYKeqrsVnW1oiSHK2pQb5Puf77+hOWqQe5K7W2e2YTZhqeIofja60WsVZOOrOOmd6KfdSrjgQrwti87r2MIpH7Gk9p+japBleuIqMXSJuF95rfZtz3gC9sGvqANcgtK+t6oeqd+KRHHcAi6ZF6JzQJkTEDURVI9gXBK5qnFqEdHrrwm9fTfLu49KihyLBMg73uw4V4SA1EVrOEzamaEjPAlYJrzbOszMuRt2lmi4n9+1m9gYxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Mon, 23 Sep 2019 22:08:56 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::3d72:3e6c:cb97:8976]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::3d72:3e6c:cb97:8976%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 22:08:56 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RESEND][PATCH v8 2/5] dma-buf: heaps: Add heap helpers
Thread-Topic: [RESEND][PATCH v8 2/5] dma-buf: heaps: Add heap helpers
Thread-Index: AQHVZOOG1jZpePfnXUe2Ard5pOa+Bqc57SyA
Date: Mon, 23 Sep 2019 22:08:55 +0000
Message-ID: <20190923220849.ttwmt2xohptzznme@DESKTOP-E1NTVVP.localdomain>
References: <20190906184712.91980-1-john.stultz@linaro.org>
 <20190906184712.91980-3-john.stultz@linaro.org>
In-Reply-To: <20190906184712.91980-3-john.stultz@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [195.233.151.104]
x-clientproxiedby: DB8PR03CA0018.eurprd03.prod.outlook.com
 (2603:10a6:10:be::31) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 1d894d83-d59f-4234-9d73-08d74072a813
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM6PR08MB3829; 
X-MS-TrafficTypeDiagnostic: AM6PR08MB3829:|AM6PR08MB3829:|DB6PR08MB2823:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR08MB28237D7B6EDF48C6851BE6E3F0850@DB6PR08MB2823.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 0169092318
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(39850400004)(346002)(376002)(189003)(199004)(6506007)(26005)(7736002)(81166006)(186003)(52116002)(316002)(99286004)(64756008)(66476007)(66446008)(229853002)(66946007)(4326008)(25786009)(66556008)(446003)(9686003)(386003)(76176011)(6512007)(6246003)(102836004)(7416002)(58126008)(305945005)(476003)(6436002)(11346002)(5660300002)(2906002)(14454004)(71200400001)(71190400001)(54906003)(5024004)(14444005)(6486002)(486006)(81156014)(256004)(44832011)(1076003)(6916009)(8676002)(6116002)(478600001)(8936002)(66066001)(86362001)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3829;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: Y4jR+8DFizkCVsPS6PW8R370yk4F4GGZqDg9RKY4+wd4HoprXA3Fy9CdmmiLRylXJikSFzrccHTyh/MKGQ+OtBlOWHuPhoxB+am5cHhoSsZyCzqaQfEfzwfXWuCXsqKplt650Gkyz7AAAG+C652rAPL2vFrNKFDMJNAYnrVpke5+GNZrnq4nSwKUbfePdMfBzZUK2Lg0ZX+2vJxHsEnLKOFRBOlEnGcshX8txEQXScxkumz++wBKthsMw9hVpSc6oI/JruP05Kdu9oXuyZLLT2Qbb6TR3NRKkeBPIvSouRmoBvWnjxsSY9f40tn1MGF4+VEZzoL63n2xmlZcOP0D8JqdGqRZ/8wYtwnRPtkkBKq3HQxCXe7+i/PVvE6qS5MvGuGfS9r9n+INp0rAmoETqadLMjvwnUQMt6pqAAQMgcI=
Content-ID: <5A12B407184C0A438128F946138711EE@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3829
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(39860400002)(136003)(199004)(189003)(76130400001)(54906003)(8936002)(6116002)(58126008)(36906005)(14454004)(5024004)(86362001)(316002)(3846002)(102836004)(186003)(229853002)(26005)(14444005)(2906002)(25786009)(23726003)(6506007)(386003)(99286004)(486006)(76176011)(478600001)(26826003)(336012)(126002)(476003)(11346002)(50466002)(63350400001)(446003)(1076003)(356004)(5660300002)(66066001)(47776003)(6246003)(305945005)(7736002)(22756006)(46406003)(6862004)(4326008)(81166006)(81156014)(97756001)(6512007)(9686003)(6486002)(8676002)(8746002)(70206006)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR08MB2823;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: af97c941-664c-458d-8146-08d74072a019
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB6PR08MB2823; 
NoDisclaimer: True
X-Forefront-PRVS: 0169092318
X-Microsoft-Antispam-Message-Info: kphWjHY1Q9MxWm1TolNNbxuBR4joP3exsudvacpxqZGg2dHHs/CdziY+fg7tJRD8p3UBFj4B0zz91S+qkQSPJilf6tF1t/BMZ/UZa1gxPQOg3YzirT3//zTJO1dhJXlKBWgKANk3hXyDKFAc/d4N25J/5/XP/IvaKoyYYTQqagXMthL1WKb0AxfnCJbmlv95C92RQr5ipJvqUHO0xLND0mE4D9n3RXpOt7kn4Q8vjE6jTg7DIcCD0toinKpPwiN3GuMumzIbLU0zplQwZZsdhEWbwtxPAZO421Nj1KpTTrA7GWe/MHupbifAkF/wB8L8WVSboGqhGg5AN6COiY3IcboT/6DUN8Rg47MQB5GJ1mB6HgJUP7Huz7viuz2L4grEpm7NO6h/am7yRorf/thSsLUHYYkjbtG7x7ONRT/fbtc=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2019 22:09:08.5989 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d894d83-d59f-4234-9d73-08d74072a813
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2823
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fs0uLQ+7ayo72lsps0s5J4WoZOy8kgBAOwtwOVbbh28=;
 b=3jXIUaGHcyCo4itqvseaAp0FH2tFsfy3Iv6X8UUCzxgmeMAA9P1IiC6i84t5rBA6pNjagCXDIESwwJG19HPDu1fRNZSEOzHCTxpHLCrJ7PcMqfQ7JHig69SR4rbMpCFoUNW+ZDfqrJqSOGsRj4TNwpAYO8jmmpRNRWQd4Hto1B8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fs0uLQ+7ayo72lsps0s5J4WoZOy8kgBAOwtwOVbbh28=;
 b=3jXIUaGHcyCo4itqvseaAp0FH2tFsfy3Iv6X8UUCzxgmeMAA9P1IiC6i84t5rBA6pNjagCXDIESwwJG19HPDu1fRNZSEOzHCTxpHLCrJ7PcMqfQ7JHig69SR4rbMpCFoUNW+ZDfqrJqSOGsRj4TNwpAYO8jmmpRNRWQd4Hto1B8=
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
Cc: nd <nd@arm.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F . Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 Alistair Strachan <astrachan@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9obiwKCk9uIEZyaSwgU2VwIDA2LCAyMDE5IGF0IDA2OjQ3OjA5UE0gKzAwMDAsIEpvaG4g
U3R1bHR6IHdyb3RlOgo+IEFkZCBnZW5lcmljIGhlbHBlciBkbWFidWYgb3BzIGZvciBkbWEgaGVh
cHMsIHNvIHdlIGNhbiByZWR1Y2UKPiB0aGUgYW1vdW50IG9mIGR1cGxpY2F0aXZlIGNvZGUgZm9y
IHRoZSBleHBvcnRlZCBkbWFidWZzLgo+IAo+IFRoaXMgY29kZSBpcyBhbiBldm9sdXRpb24gb2Yg
dGhlIEFuZHJvaWQgSU9OIGltcGxlbWVudGF0aW9uLCBzbwo+IHRoYW5rcyB0byBpdHMgb3JpZ2lu
YWwgYXV0aG9ycyBhbmQgbWFpbnRhaW50ZXJzOgo+ICAgUmViZWNjYSBTY2h1bHR6IFphdmluLCBD
b2xpbiBDcm9zcywgTGF1cmEgQWJib3R0LCBhbmQgb3RoZXJzIQo+IAo+IENjOiBMYXVyYSBBYmJv
dHQgPGxhYmJvdHRAcmVkaGF0LmNvbT4KPiBDYzogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWlu
LmdhaWduYXJkQGxpbmFyby5vcmc+Cj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxp
bmFyby5vcmc+Cj4gQ2M6IExpYW0gTWFyayA8bG1hcmtAY29kZWF1cm9yYS5vcmc+Cj4gQ2M6IFBy
YXRpayBQYXRlbCA8cHJhdGlrcEBjb2RlYXVyb3JhLm9yZz4KPiBDYzogQnJpYW4gU3RhcmtleSA8
QnJpYW4uU3RhcmtleUBhcm0uY29tPgo+IENjOiBWaW5jZW50IERvbm5lZm9ydCA8VmluY2VudC5E
b25uZWZvcnRAYXJtLmNvbT4KPiBDYzogU3VkaXB0byBQYXVsIDxTdWRpcHRvLlBhdWxAYXJtLmNv
bT4KPiBDYzogQW5kcmV3IEYuIERhdmlzIDxhZmRAdGkuY29tPgo+IENjOiBDaHJpc3RvcGggSGVs
bHdpZyA8aGNoQGluZnJhZGVhZC5vcmc+Cj4gQ2M6IENoZW5ibyBGZW5nIDxmZW5nY0Bnb29nbGUu
Y29tPgo+IENjOiBBbGlzdGFpciBTdHJhY2hhbiA8YXN0cmFjaGFuQGdvb2dsZS5jb20+Cj4gQ2M6
IEhyaWR5YSBWYWxzYXJhanUgPGhyaWR5YUBnb29nbGUuY29tPgo+IENjOiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gUmV2aWV3ZWQtYnk6IEJlbmphbWluIEdhaWduYXJkIDxiZW5q
YW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6IDxq
b2huLnN0dWx0ekBsaW5hcm8ub3JnPgoKVHdvIG1pbm9yIHRoaW5ncyBiZWxvdy4KCj4gLS0tCj4g
djI6Cj4gKiBSZW1vdmVkIGNhY2hlIG1hbmFnZW1lbnQgcGVyZm9ybWFuY2UgaGFjayB0aGF0IEkg
aGFkCj4gICBhY2NpZGVudGFsbHkgZm9sZGVkIGluLgo+ICogUmVtb3ZlZCBzdGF0cyBjb2RlIHRo
YXQgd2FzIGluIGhlbHBlcnMKPiAqIExvdHMgb2YgY2hlY2twYXRjaCBjbGVhbnVwcwo+IHYzOgo+
ICogVW5pbmxpbmUgSU5JVF9IRUFQX0hFTFBFUl9CVUZGRVIgKHN1Z2dlc3RlZCBieSBDaHJpc3Rv
cGgpCj4gKiBTd2l0Y2ggdG8gV0FSTiBvbiBidWZmZXIgZGVzdHJveSBmYWlsdXJlIChzdWdnZXN0
ZWQgYnkgQnJpYW4pCj4gKiBidWZmZXItPmttYXBfY250IGRlY3JlbWVudGluZyBjbGVhbnVwIChz
dWdnZXN0ZWQgYnkgQ2hyaXN0b3BoKQo+ICogRXh0cmEgYnVmZmVyLT52YWRkciBjaGVja2luZyBp
biBkbWFfaGVhcF9kbWFfYnVmX2ttYXAKPiAgIChzdWdnZXN0ZWQgYnkgQnJpYW4pCj4gKiBTd2l0
Y2ggdG9faGVscGVyX2J1ZmZlciBmcm9tIG1hY3JvIHRvIGlubGluZSBmdW5jdGlvbgo+ICAgKHN1
Z2dlc3RlZCBieSBCZW5qYW1pbikKPiAqIFJlbmFtZSBrbWFwLT52bWFwIChmb2xkZWQgaW4gZnJv
bSBBbmRyZXcpCj4gKiBVc2Ugdm1hcCBmb3Igdm1hcHBpbmcgLSBub3QgYmVnaW5fY3B1X2FjY2Vz
cyAoZm9sZGVkIGluIGZyb20KPiAgIEFuZHJldykKPiAqIERyb3Aga21hcCBmb3Igbm93LCBhcyBp
dHMgb3B0aW9uYWwgKGZvbGRlZCBpbiBmcm9tIEFuZHJldykKPiAqIEZvbGQgZG1hX2hlYXBfbWFw
X3VzZXIgaW50byB0aGUgc2luZ2xlIGNhbGxlciAoZm9sZWQgaW4gZnJvbQo+ICAgQW5kcmV3KQo+
ICogRm9sZGVkIGluIHBhdGNoIGZyb20gQW5kcmV3IHRvIHRyYWNrIHBhZ2UgbGlzdCBwZXIgaGVh
cCBub3QKPiAgIHNnbGlzdCwgd2hpY2ggc2ltcGxpZmllcyB0aGUgdHJhY2tpbmcgbG9naWMKPiB2
NDoKPiAqIE1vdmVkIGRtYS1oZWFwLmggY2hhbmdlIG91dCB0byBwcmV2aW91cyBwYXRjaAo+IHY2
Ogo+ICogTWlub3IgY2xlYW51cHMgYW5kIHR5cG8gZml4ZXMgc3VnZ2VzdGVkIGJ5IEJyaWFuCj4g
djc6Cj4gKiBSZW1vdmVkIHN0cmF5IDsKPiAqIE1ha2UgaW5pdF9oZWFwX2hlbHBlcl9idWZmZXIg
bG93ZXJjYXNlLCBhcyBzdWdnZXN0ZWQgYnkgQ2hyaXN0b3BoCj4gKiBBZGQgZG1hYnVmIGV4cG9y
dCBoZWxwZXIgdG8gcmVkdWNlIGJvaWxlcnBsYXRlIGNvZGUKPiB2ODoKPiAqIFJlbW92ZSB1bnVz
ZWQgcHJpdmF0ZV9mbGFncyB2YWx1ZQo+ICogQ29uZGVuc2UgZG1hX2hlYXBfYnVmZmVyIGFuZCBo
ZWFwX2hlbHBlcl9idWZmZXIgKHN1Z2dlc3RlZCBieQo+ICAgQ2hyaXN0b3BoKQo+ICogRml4IGlu
ZGVudGF0aW9uIGJ5IHVzaW5nIHNob3J0ZXIgYXJndW1lbnQgbmFtZXMgKHN1Z2dlc3RlZCBieQo+
ICAgQ2hyaXN0b3BoKQo+ICogQWRkIGZsdXNoX2tlcm5lbF92bWFwX3JhbmdlL2ludmFsaWRhdGVf
a2VybmVsX3ZtYXBfcmFuZ2UgY2FsbHMKPiAgIChzdWdnZXN0ZWQgYnkgQ2hyaXN0b3BoKQo+ICog
Q2hlY2twYXRjaCB3aGl0ZXNwYWNlIGZpeHVwcwo+IC0tLQoKLi4uCgo+ICsKPiArc3RhdGljIHZv
aWQgKmRtYV9oZWFwX2J1ZmZlcl92bWFwX2dldChzdHJ1Y3QgaGVhcF9oZWxwZXJfYnVmZmVyICpi
dWZmZXIpCj4gK3sKPiArCXZvaWQgKnZhZGRyOwo+ICsKPiArCWlmIChidWZmZXItPnZtYXBfY250
KSB7Cj4gKwkJYnVmZmVyLT52bWFwX2NudCsrOwo+ICsJCXJldHVybiBidWZmZXItPnZhZGRyOwo+
ICsJfQo+ICsJdmFkZHIgPSBkbWFfaGVhcF9tYXBfa2VybmVsKGJ1ZmZlcik7Cj4gKwlpZiAoV0FS
Tl9PTkNFKCF2YWRkciwKPiArCQkgICAgICAiaGVhcC0+b3BzLT5tYXBfa2VybmVsIHNob3VsZCBy
ZXR1cm4gRVJSX1BUUiBvbiBlcnJvciIpKQoKTG9va3MgbGlrZSB0aGUgbWVzc2FnZSBpcyBvdXQt
b2YtZGF0ZSBoZXJlLgoKLi4uCgo+ICsKPiArLyoqCj4gKyAqIHN0cnVjdCBoZWFwX2hlbHBlcl9i
dWZmZXIgLSBoZWxwZXIgYnVmZmVyIG1ldGFkYXRhCj4gKyAqIEBoZWFwOgkJYmFjayBwb2ludGVy
IHRvIHRoZSBoZWFwIHRoZSBidWZmZXIgY2FtZSBmcm9tCj4gKyAqIEBkbWFidWY6CQliYWNraW5n
IGRtYS1idWYgZm9yIHRoaXMgYnVmZmVyCj4gKyAqIEBzaXplOgkJc2l6ZSBvZiB0aGUgYnVmZmVy
Cj4gKyAqIEBmbGFnczoJCWJ1ZmZlciBzcGVjaWZpYyBmbGFncwo+ICsgKiBAcHJpdl92aXJ0CQlw
b2ludGVyIHRvIGhlYXAgc3BlY2lmaWMgcHJpdmF0ZSB2YWx1ZQo+ICsgKiBAbG9jawkJbXV0ZXh0
IHRvIHByb3RlY3QgdGhlIGRhdGEgaW4gdGhpcyBzdHJ1Y3R1cmUKPiArICogQHZtYXBfY250CQlj
b3VudCBvZiB2bWFwIHJlZmVyZW5jZXMgb24gdGhlIGJ1ZmZlcgo+ICsgKiBAdmFkZHIJCXZtYXAn
ZWQgdmlydHVhbCBhZGRyZXNzCj4gKyAqIEBwYWdlY291bnQJCW51bWJlciBvZiBwYWdlcyBpbiB0
aGUgYnVmZmVyCj4gKyAqIEBwYWdlcwkJbGlzdCBvZiBwYWdlIHBvaW50ZXJzCj4gKyAqIEBhdHRh
Y2htZW50CQlsaXN0IG9mIGRldmljZSBhdHRhY2htZW50cwoKcy9hdHRhY2htZW50L2F0dGFjaG1l
bnRzLwoKV2l0aCB0aG9zZSBmaXhlZCwgZmVlbCBmcmVlIHRvIGFkZDoKClJldmlld2VkLWJ5OiBC
cmlhbiBTdGFya2V5IDxicmlhbi5zdGFya2V5QGFybS5jb20+CgpUaGFua3MsCi1CcmlhbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
