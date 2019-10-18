Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDD0DCE79
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47D26EBA7;
	Fri, 18 Oct 2019 18:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60052.outbound.protection.outlook.com [40.107.6.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46806EBA7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 18:41:40 +0000 (UTC)
Received: from VI1PR0802CA0033.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::19) by VI1PR08MB2800.eurprd08.prod.outlook.com
 (2603:10a6:802:1b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 18 Oct
 2019 18:41:36 +0000
Received: from AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::203) by VI1PR0802CA0033.outlook.office365.com
 (2603:10a6:800:a9::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.18 via Frontend
 Transport; Fri, 18 Oct 2019 18:41:36 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT035.mail.protection.outlook.com (10.152.16.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 18 Oct 2019 18:41:34 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Fri, 18 Oct 2019 18:41:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f03efda94cfecb87
X-CR-MTA-TID: 64aa7808
Received: from 3bac919f61c3.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.1.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5E78617D-4262-43BF-86D1-0B8EEFC95CF7.1; 
 Fri, 18 Oct 2019 18:41:27 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2051.outbound.protection.outlook.com [104.47.1.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3bac919f61c3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Oct 2019 18:41:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdfZ7GYR3uwEpZinpNKIAeHXBwozmbyxwBspJpK3UH8zpGWQbXHJAKw6GWEZ8qIchiFIJOsShoTyHrlWmcxL6Twwv79sSi/Wg6OYZ8yZeE6jE7eTtxhUYKuf2uegJdJirGkFImJhn8lKqSartdWjzQg+o+8Jqc8ofnBxtaPH5ytRG/hUfbnB90Pp2kuFNonYK6LtmSc/7DkmqBF/DgCfxOV7fFfWV3uc/Rz4r0tgY1GwFSLsfGYsi9n3JUF6w8fR0FR0IBcR94zkATjObh6oeuKeIS4R3EmJJQCzIo7NP13bdNYWpUJCQxdpYVtHi+6XakyCInmgQLn4qEp2iZfZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LKiKGvUEeQKuI/myhpX1qfiB1ta7qzm+3umrb2aVzwM=;
 b=d/PBIuOf9fXyMKkFPO9D10THur+usWvx6xBXEESwDnOJer3o3YJbeeowd2bv3UdCLF/zjWas0AI0phM9PjLkv2c8OXsJVW79bihvXNOwOiZgWPP05CxzOMBjAzgOQQ0JwDXbPKEcDOizYVxX0sNfFPLL+Vby4ooSnNUx6OnrrVMUU9cKmDgntQvCFvTCM/LLrR2GYniQ4+kIqc+q87fWCmnLkKDTULft/71VWYwUeTCOsehEBoNYNdkXZ6I/kI57hvluyUFlkMOILqeM+DU7nkrrEzyuI9XPgkx+IDR64n/qGZPDVyHlf0Txl/Cu1NKezprn0TIedaB4+kaK7CgyTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com (52.132.215.213) by
 AM0PR08MB3011.eurprd08.prod.outlook.com (52.134.125.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Fri, 18 Oct 2019 18:41:24 +0000
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::f009:c530:6569:cf6f]) by AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::f009:c530:6569:cf6f%4]) with mapi id 15.20.2347.023; Fri, 18 Oct 2019
 18:41:24 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: Brian Starkey <Brian.Starkey@arm.com>
Subject: Re: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
Thread-Topic: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
Thread-Index: AQHVZOOF+0BJBq1hEUK86gknnLECMKczS0sAgAfTZICAF6gMgIAADdeAgAc/QoCAA7QPgIABrHYAgAAEJoCAABjGgIAA2T6AgACS/YA=
Date: Fri, 18 Oct 2019 18:41:24 +0000
Message-ID: <20191018184123.GA10634@arm.com>
References: <CAO_48GFHx4uK6cWwJ4oGdJ8HNZNZYDzdD=yR3VK0EXQ86ya9-g@mail.gmail.com>
 <20190924162217.GA12974@arm.com> <20191009173742.GA2682@arm.com>
 <f4fb09a5-999b-e676-0403-cc0de41be440@ti.com>
 <20191014090729.lwusl5zxa32a7uua@DESKTOP-E1NTVVP.localdomain>
 <a213760f-1f41-c4a3-7e38-8619898adecd@ti.com>
 <CALAqxLV6EBHKPEaEkyfhEYyw0TXayTeY_4AWXfuASLLyxZh5+Q@mail.gmail.com>
 <a3c66479-7433-ec29-fbec-81aef60cb063@ti.com>
 <CALAqxLWrsXG0XysL7RmhApbuZukDdG5VhdHOTS5odkG9f1ezwA@mail.gmail.com>
 <20191018095516.inwes5avdeixl5nr@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20191018095516.inwes5avdeixl5nr@DESKTOP-E1NTVVP.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0017.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::29) To AM0PR08MB5345.eurprd08.prod.outlook.com
 (2603:10a6:208:18c::21)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.53]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 83493e0f-51a1-4694-ab59-08d753facd2e
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM0PR08MB3011:|AM0PR08MB3011:|VI1PR08MB2800:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB280026873A02337A4DE46578E46C0@VI1PR08MB2800.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 01949FE337
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(189003)(199004)(66446008)(64756008)(66556008)(66476007)(66946007)(54906003)(2616005)(316002)(446003)(37006003)(476003)(2906002)(6486002)(11346002)(3846002)(6116002)(99286004)(6862004)(186003)(4326008)(6436002)(86362001)(8936002)(44832011)(66066001)(256004)(14444005)(81156014)(8676002)(81166006)(6636002)(25786009)(486006)(6246003)(478600001)(229853002)(1076003)(305945005)(45080400002)(53546011)(6506007)(386003)(7416002)(6512007)(561944003)(5660300002)(52116002)(76176011)(33656002)(14454004)(7736002)(36756003)(71200400001)(71190400001)(26005)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3011;
 H:AM0PR08MB5345.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: BXI0O8Gu0sUw5+ERwlaW6h3uLF+TVCxnOcH+/zy43q4nV4+M8c8ku36k0Un9dOiF1GWvYC05Ed8JQ9miBzwlgPQQED9wWMjueuCJNfQtOA5JfyfAw1s5sZFmoWK9zK4ElpUlhiLmzMRr0/KxsLv23zY8x82n9yOA/f2YBzBYzCJATtZXVwMQ/EJoI8w4KbqxjHH/ts1ZKVkM+5xhy7sozDvQAF/gsGYNLYb1EE6g4KENjuImo0RfIth7mUtw3qc6zwwbqmwW3fDb+lhjXwhdccXs5lgzJfr8mq1Oy2UARixQJxDVwGNjKlNvtPsRJbuGWOo54+fCQ9nHknbaERibAqDKYNB+x0Wt/1+1oNMpsPn9NSjPqpOy3ZZgmwdvy5JC+0GibPGHb9YBjUpr39tcRas1NwYHpVrGwiLPiozEYzc=
Content-ID: <78D4CAEB9234634B94A2C5395A2F7577@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3011
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(189003)(199004)(22756006)(66066001)(36906005)(4326008)(1076003)(3846002)(126002)(2616005)(11346002)(6862004)(229853002)(47776003)(63350400001)(81156014)(486006)(446003)(336012)(478600001)(37006003)(45080400002)(26826003)(476003)(26005)(316002)(186003)(70586007)(14454004)(54906003)(70206006)(25786009)(97756001)(14444005)(50466002)(8676002)(76176011)(53546011)(386003)(6506007)(6246003)(36756003)(86362001)(6636002)(81166006)(305945005)(76130400001)(7736002)(8746002)(46406003)(23726003)(6512007)(2906002)(102836004)(6116002)(33656002)(99286004)(6486002)(5660300002)(356004)(561944003)(8936002)(107886003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2800;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8560c100-a46b-41bc-1b11-08d753fac721
NoDisclaimer: True
X-Forefront-PRVS: 01949FE337
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0/JpE2OkbpDdIaA/bb9MeGJJ62WzUxhf+uGI4cxPD+LUsg22y3MrH+e9RO8FEnSk4z2I3ZGq2e0pZUXJzuIQc/DZ259V3kjqvSgYUKQKZSrmBL4qkDh1j7E08sw8TtiyEFfQqxpCl9pZSe1fIA0xDtuLghYH6KKk8pI2QGMg6vNHeVJoAcNPLHGb5sNg0+azPTBC85mOZZJxVidpZomHSteV/bpy1qxVwD5QFa5MXgVD+/ogd9QspmmnHakCM8ki0uj4Zib3AhOzPaFJX3nmuMnQc3j00Jb5p9EzIET4FiDoq+4RYIrgyx2ZnBlyJWi07vWenwkCBDiYyMnAan0TghxSzELBZPuMgGzQsTkZ0wh0ESAc2dxLkZPbaSaF4LYKPGiI1rjuDgyQ2GkYF3vO2ONsfAunVptvECRRdRrlNhM=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2019 18:41:34.4951 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83493e0f-51a1-4694-ab59-08d753facd2e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2800
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LKiKGvUEeQKuI/myhpX1qfiB1ta7qzm+3umrb2aVzwM=;
 b=WBm+RP64aAvRK3xi3gSB8GI/G5Hbg8/6IfR8FGj3fbTtvGgou5YF2XXl5znmacBevekbK54Wnm79Cjknh30EfNnVTTbU10Gi6t/bLt73NXsYQemgsEekP4yleF20LE17VJc99+0et+z2RRt4jauu3iKYBu5g3qON2WSGGRKySNk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LKiKGvUEeQKuI/myhpX1qfiB1ta7qzm+3umrb2aVzwM=;
 b=WBm+RP64aAvRK3xi3gSB8GI/G5Hbg8/6IfR8FGj3fbTtvGgou5YF2XXl5znmacBevekbK54Wnm79Cjknh30EfNnVTTbU10Gi6t/bLt73NXsYQemgsEekP4yleF20LE17VJc99+0et+z2RRt4jauu3iKYBu5g3qON2WSGGRKySNk=
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

T24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMDk6NTU6MTdBTSArMDAwMCwgQnJpYW4gU3RhcmtleSB3
cm90ZToKPiBPbiBUaHUsIE9jdCAxNywgMjAxOSBhdCAwMTo1Nzo0NVBNIC0wNzAwLCBKb2huIFN0
dWx0eiB3cm90ZToKPiA+IE9uIFRodSwgT2N0IDE3LCAyMDE5IGF0IDEyOjI5IFBNIEFuZHJldyBG
LiBEYXZpcyA8YWZkQHRpLmNvbT4gd3JvdGU6Cj4gPiA+IE9uIDEwLzE3LzE5IDM6MTQgUE0sIEpv
aG4gU3R1bHR6IHdyb3RlOgo+ID4gPiA+IEJ1dCBpZiB0aGUgb2JqZWN0aW9uIHN0YW5kcywgZG8g
eW91IGhhdmUgYSBwcm9wb3NhbCBmb3IgYW4gYWx0ZXJuYXRpdmUKPiA+ID4gPiB3YXkgdG8gZW51
bWVyYXRlIGEgc3Vic2V0IG9mIENNQSBoZWFwcz8KPiA+ID4gPgo+ID4gPiBXaGVuIGluIHN0YWdp
bmcgSU9OIGhhZCB0byByZWFjaCBpbnRvIHRoZSBDTUEgZnJhbWV3b3JrIGFzIHRoZSBvdGhlcgo+
ID4gPiBkaXJlY3Rpb24gd291bGQgbm90IGJlIGFsbG93ZWQsIHNvIGNtYV9mb3JfZWFjaF9hcmVh
KCkgd2FzIGFkZGVkLiBJZgo+ID4gPiBETUEtQlVGIGhlYXBzIGlzIG5vdCBpbiBzdGFnaW5nIHRo
ZW4gd2UgY2FuIGRvIHRoZSBvcHBvc2l0ZSwgYW5kIGhhdmUKPiA+ID4gdGhlIENNQSBmcmFtZXdv
cmsgcmVnaXN0ZXIgaGVhcHMgaXRzZWxmIHVzaW5nIG91ciBmcmFtZXdvcmsuIFRoYXQgd2F5Cj4g
PiA+IHRoZSBDTUEgc3lzdGVtIGNvdWxkIGRlY2lkZSB3aGF0IGFyZWFzIHRvIGV4cG9ydCBvciBu
b3QgKG1heWJlIGJhc2VkIG9uCj4gPiA+IGEgRFQgcHJvcGVydHkgb3Igc2ltaWxhcikuCj4gPiAK
PiA+IE9rLiBUaG91Z2ggdGhlIENNQSBjb3JlIGRvZXNuJ3QgaGF2ZSBtdWNoIHNlbnNlIG9mIERU
IGRldGFpbHMgZWl0aGVyLAo+ID4gc28gaXQgd291bGQgcHJvYmFibHkgaGF2ZSB0byBiZSBkb25l
IGluIHRoZSByZXNlcnZlZF9tZW0gbG9naWMsIHdoaWNoCj4gPiBkb2Vzbid0IGZlZWwgcmlnaHQg
dG8gbWUuCj4gPiAKPiA+IEknZCBwcm9iYWJseSBndWVzcyB3ZSBzaG91bGQgaGF2ZSBzb21lIHNv
cnQgb2YgZHQgYmluZGluZyB0byBkZXNjcmliZQo+ID4gYSBkbWFidWYgY21hIGhlYXAgYW5kIGZy
b20gdGhhdCBub2RlIGxpbmsgdG8gYSBDTUEgbm9kZSB2aWEgYQo+ID4gbWVtb3J5LXJlZ2lvbiBw
aGFuZGxlLiBBbG9uZyB3aXRoIG1heWJlIHRoZSBkZWZhdWx0IGhlYXAgYXMgd2VsbD8gTm90Cj4g
PiBlYWdlciB0byBnZXQgaW50byBhbm90aGVyIGJpbmRpbmcgcmV2aWV3IGN5Y2xlLCBhbmQgSSdt
IG5vdCBzdXJlIHdoYXQKPiA+IG5vbi1EVCBzeXN0ZW1zIHdpbGwgZG8geWV0LCBidXQgSSdsbCB0
YWtlIGEgc2hvdCBhdCBpdCBhbmQgaXRlcmF0ZS4KPiA+IAo+ID4gPiBUaGUgZW5kIHJlc3VsdCBp
cyB0aGUgc2FtZSBzbyB3ZSBjYW4gbWFrZSB0aGlzIGNoYW5nZSBsYXRlciAoaXQgaGFzIHRvCj4g
PiA+IGNvbWUgYWZ0ZXIgRE1BLUJVRiBoZWFwcyBpcyBpbiBhbnl3YXkpLgo+ID4gCj4gPiBXZWxs
LCBJJ20gaGVzaXRhbnQgdG8gbWVyZ2UgY29kZSB0aGF0IGV4cG9zZXMgYWxsIHRoZSBDTUEgaGVh
cHMgYW5kCj4gPiB0aGVuIGFkZCBwYXRjaGVzIHRoYXQgYmVjb21lcyBtb3JlIHNlbGVjdGl2ZSwg
c2hvdWxkIGFueW9uZSBkZXBlbmQgb24KPiA+IHRoZSBpbml0aWFsIGJlaGF2aW9yLiA6Lwo+IAo+
IEhvdyBhYm91dCBvbmx5IGF1dG8tYWRkaW5nIHRoZSBzeXN0ZW0gZGVmYXVsdCBDTUEgcmVnaW9u
IChjbWEtPm5hbWUgPT0KPiAicmVzZXJ2ZWQiKT8KPiAKPiBBbmQvb3IgdGhlIENNQSBhdXRvLWFk
ZCBjb3VsZCBiZSBiZWhpbmQgYSBjb25maWcgb3B0aW9uPyBJdCBzZWVtcyBhCj4gc2hhbWUgdG8g
ZnVydGhlciBkZWxheSB0aGlzLCBhbmQgdGhlIENNQSBoZWFwIGl0c2VsZiByZWFsbHkgaXMgdXNl
ZnVsLgo+CkEgYml0IG9mIGEgZGV0b3VyLCBjb21taW5nIGJhY2sgdG8gdGhlIGlzc3VlIHdoeSB0
aGUgZm9sbG93aW5nIG5vZGUKd2FzIG5vdCBnZXR0aW5nIGRldGVjdGVkIGJ5IHRoZSBkbWEtYnVm
IGhlYXBzIGZyYW1ld29yay4KCiAgICAgICAgcmVzZXJ2ZWQtbWVtb3J5IHsKICAgICAgICAgICAg
ICAgICNhZGRyZXNzLWNlbGxzID0gPDI+OwogICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8
Mj47CiAgICAgICAgICAgICAgICByYW5nZXM7CgogICAgICAgICAgICAgICAgZGlzcGxheV9yZXNl
cnZlZDogZnJhbWVidWZmZXJANjAwMDAwMDAgewogICAgICAgICAgICAgICAgICAgICAgICBjb21w
YXRpYmxlID0gInNoYXJlZC1kbWEtcG9vbCI7CiAgICAgICAgICAgICAgICAgICAgICAgIGxpbnV4
LGNtYS1kZWZhdWx0OwogICAgICAgICAgICAgICAgICAgICAgICByZXVzYWJsZTsgPDw8PDw8PDw8
PDw8LS0tLS0tLS0tLS1UaGlzIHdhcyBtaXNzaW5nIGluIG91cgplYXJsaWVyIG5vZGUKICAgICAg
ICAgICAgICAgICAgICAgICAgcmVnID0gPDAgMHg2MDAwMDAwMCAwIDB4MDgwMDAwMDA+OwogICAg
ICAgICAgICAgICAgfTsKIApRdW90aW5nIHJlc2VydmVkLW1lbW9yeS50eHQgOi0KIlRoZSBvcGVy
YXRpbmcgc3lzdGVtIGNhbiB1c2UgdGhlIG1lbW9yeSBpbiB0aGlzIHJlZ2lvbiB3aXRoIHRoZSBs
aW1pdGF0aW9uIHRoYXQKIHRoZSBkZXZpY2UgZHJpdmVyKHMpIG93bmluZyB0aGUgcmVnaW9uIG5l
ZWQgdG8gYmUgYWJsZSB0byByZWNsYWltIGl0IGJhY2siCgpUaHVzIGFzIHBlciBteSBvYnNlcnZh
dGlvbiwgd2l0aG91dCAncmV1c2FibGUnLCBybWVtX2NtYV9zZXR1cCgpCnJldHVybnMgLUVJTlZB
TCBhbmQgdGhlIHJlc2VydmVkLW1lbW9yeSBpcyBub3QgYWRkZWQgYXMgYSBjbWEgcmVnaW9uLgoK
V2l0aCAncmV1c2FibGUnLCBybWVtX2NtYV9zZXR1cCgpIHN1Y2NlZWRzICwgYnV0IHRoZSBrZXJu
ZWwgY3Jhc2hlcyBhcyBmb2xsb3dzIDotCgpbICAgIDAuNDUwNTYyXSBXQVJOSU5HOiBDUFU6IDIg
UElEOiAxIGF0IG1tL2NtYS5jOjExMCBjbWFfaW5pdF9yZXNlcnZlZF9hcmVhcysweGVjLzB4MjJj
ClsgICAgMC40NTg0MTVdIE1vZHVsZXMgbGlua2VkIGluOiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKWyAgICAwLjQ2MTQ3MF0gQ1BVOiAyIFBJRDog
MSBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50ZWQgNS4zLjAtcmM0LTAxMzc3LWc1MWRiY2YwMzg4
NGMtZGlydHkgIzE1ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IApbICAgIDAuNDcwMDE3XSBIYXJkd2FyZSBuYW1lOiBBUk0gSnVubyBkZXZlbG9wbWVudCBib2Fy
ZCAocjApIChEVCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClsgICAgMC40NzU5NTNdIHBzdGF0ZTogODAw
MDAwMDUgKE56Y3YgZGFpZiAtUEFOIC1VQU8pICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAKWyAgICAwLjQ4MDc1NV0gcGMgOiBjbWFfaW5pdF9yZXNlcnZlZF9hcmVhcysweGVjLzB4MjJj
ICAKWyAgICAwLjQ4NTY0M10gbHIgOiBjbWFfaW5pdF9yZXNlcnZlZF9hcmVhcysweGU4LzB4MjJj
IAo8LS0tLXNuaXAgcmVnaXN0ZXIgZHVtcCAtLS0+CgpbICAgIDAuNjAwNjQ2XSBVbmFibGUgdG8g
aGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBhdCB2aXJ0dWFsIGFkZHJlc3MgZmZmZjdkZmZm
ZjgwMDAwMApbICAgIDAuNjA4NTkxXSBNZW0gYWJvcnQgaW5mbzoKWyAgICAwLjYxMTM4Nl0gICBF
U1IgPSAweDk2MDAwMDA2CjwtLS1zbmlwIHVuaW50ZXJlc3RpbmcgYml0cyAtLS0+ClsgICAgMC42
ODEwNjldIHBjIDogY21hX2luaXRfcmVzZXJ2ZWRfYXJlYXMrMHgxMTQvMHgyMmMKWyAgICAwLjY4
NjA0M10gbHIgOiBjbWFfaW5pdF9yZXNlcnZlZF9hcmVhcysweGU4LzB4MjJjCgoKSSBhbSBsb29r
aW5nIGludG8gdGhpcyBub3cuIE15IGZpbmFsIG9iamVjdGl2ZSBpcyB0byBnZXQgIi9kZXYvZG1h
X2hlYXAvZnJhbWVidWZmZXIiCihhcyBhIGNtYSBoZWFwKS4KQW55IGxlYWRzPwoKPiBDaGVlcnMs
Cj4gLUJyaWFuCj4gCj4gPiAKPiA+IFNvLCA8c2lnaD4sIEknbGwgc3RhcnQgb24gdGhlIHJld29y
ayBmb3IgdGhlIENNQSBiaXRzLgo+ID4gCj4gPiBUaGF0IHNhaWQsIEknbSBkZWZpbml0ZWx5IHdh
bnRpbmcgdG8gbWFrZSBzb21lIHByb2dyZXNzIG9uIHRoaXMgcGF0Y2gKPiA+IHNlcmllcywgc28g
bWF5YmUgd2UgY2FuIHN0aWxsIG1lcmdlIHRoZSBjb3JlL2hlbHBlcnMvc3lzdGVtIGhlYXAgYW5k
Cj4gPiBqdXN0IGhvbGQgdGhlIGNtYSBoZWFwIGZvciBhIHJld29yayBvbiB0aGUgZW51bWVyYXRp
b24gYml0cy4gVGhhdCB3YXkKPiA+IHdlIGNhbiBhdCBsZWFzdCBnZXQgb3RoZXIgZm9sa3Mgd29y
a2luZyBvbiBzd2l0Y2hpbmcgdGhlaXIgdmVuZG9yCj4gPiBoZWFwcyBmcm9tIElPTi4KPiA+IAo+
ID4gU3VtaXQ6IERvZXMgdGhhdCBzb3VuZCBvaz8gQXNzdW1pbmcgbm8gb3RoZXIgb2JqZWN0aW9u
cywgY2FuIHlvdSB0YWtlCj4gPiB0aGUgdjExIHNldCBtaW51cyB0aGUgQ01BIGhlYXAgcGF0Y2g/
Cj4gPiAKPiA+IHRoYW5rcwo+ID4gLWpvaG4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
