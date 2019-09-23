Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6584BBE4A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 00:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643DA89FC9;
	Mon, 23 Sep 2019 22:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140053.outbound.protection.outlook.com [40.107.14.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B75289FC9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 22:08:36 +0000 (UTC)
Received: from VI1PR08CA0188.eurprd08.prod.outlook.com (2603:10a6:800:d2::18)
 by AM7PR08MB5527.eurprd08.prod.outlook.com (2603:10a6:20b:de::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20; Mon, 23 Sep
 2019 22:08:30 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::208) by VI1PR08CA0188.outlook.office365.com
 (2603:10a6:800:d2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.21 via Frontend
 Transport; Mon, 23 Sep 2019 22:08:30 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20 via Frontend Transport; Mon, 23 Sep 2019 22:08:29 +0000
Received: ("Tessian outbound 5061e1b5386c:v31");
 Mon, 23 Sep 2019 22:08:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6733263cbfd8902e
X-CR-MTA-TID: 64aa7808
Received: from a350a2b54642.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.12.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E3E7A4FC-3CBD-4EE3-BBEF-73A80B84B68B.1; 
 Mon, 23 Sep 2019 22:08:15 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a350a2b54642.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 Sep 2019 22:08:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2EfnDbYmH7wtnD6Wr940xLmnyi0geXBp4MZqHXYWNXOXvo5AxbeUzfWQwyyWJ7EyP+/VQhq/vvxNSDSum+JnzaBjDolJz8OQ0kp9DEjiFD0HUsngWRGHMEmvDOea46sxOjyJc2LUN5GLXN9+OIe0/tvJvEtqP/kFA0T/VTcj8CaxZaTrTEo4hhbXYLjaD0fr1nAXFqoKhbGtKWJ69D6/DbRNUmZiutkyGDFH3Rr0ws31JIbZUcvzUuP+HW7fuPakbg2vDQLIsv/gP2Qg1kRzQ4fns0K+Pcaw1WPsJI3az7gTMO/IyBHB1fb2ZJeKJs5kVnU4E4X3UtBpeg7TsrddQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AzploTuVwFsMI06k76KZYFgDdpT9L7tfPDQCifWLUo=;
 b=n9ATfWoXXh/7Z9pYLE08xFbjrJu+pGeILxgsIqH9cl0NNiNyOSgfePIZzt4JPkpMpC7s1JKA0Wk3LsZIfXa5tBmD0MZ6AwPsb/m5I2C2HPnyRVDCkWmJgO3s9eCQ5zcHKPMM7Z2D7pirBmbYk0jCZ/Gv8KljieVExakcY80ue7XSQ3H7s/e0n1a7mvUMu3miSjuCGTvs5BRjiaA6VbnlcJo0a55ny2C9WJKFCHCR/fN8EPaIz1lV6AdVxE891pffT7xq2JN2GT6bLBBvOrg/QGsNPEdamAbpQ7IGx579Dw/uemRor/K0u2qvi+HGab+qLfhoqazuABT6iG0mchMD0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Mon, 23 Sep 2019 22:08:14 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::3d72:3e6c:cb97:8976]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::3d72:3e6c:cb97:8976%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 22:08:14 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RESEND][PATCH v8 1/5] dma-buf: Add dma-buf heaps framework
Thread-Topic: [RESEND][PATCH v8 1/5] dma-buf: Add dma-buf heaps framework
Thread-Index: AQHVZOOEQkMSgLmukEqMxYT6yyq9FKc57PqA
Date: Mon, 23 Sep 2019 22:08:13 +0000
Message-ID: <20190923220807.zuqxthydxybjgoog@DESKTOP-E1NTVVP.localdomain>
References: <20190906184712.91980-1-john.stultz@linaro.org>
 <20190906184712.91980-2-john.stultz@linaro.org>
In-Reply-To: <20190906184712.91980-2-john.stultz@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [195.233.151.100]
x-clientproxiedby: AM3PR07CA0090.eurprd07.prod.outlook.com
 (2603:10a6:207:6::24) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 047dc1cf-ae38-48f9-c8c6-08d7407290a1
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM6PR08MB3829; 
X-MS-TrafficTypeDiagnostic: AM6PR08MB3829:|AM6PR08MB3829:|AM7PR08MB5527:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5527EB8B3AEBB441134FC83BF0850@AM7PR08MB5527.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 0169092318
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(39850400004)(346002)(376002)(189003)(199004)(6506007)(26005)(7736002)(81166006)(186003)(52116002)(316002)(99286004)(64756008)(66476007)(66446008)(229853002)(66946007)(4326008)(25786009)(66556008)(446003)(9686003)(386003)(76176011)(6512007)(6246003)(102836004)(7416002)(58126008)(305945005)(476003)(6436002)(11346002)(5660300002)(2906002)(14454004)(71200400001)(3716004)(71190400001)(54906003)(6486002)(486006)(81156014)(256004)(44832011)(1076003)(6916009)(8676002)(6116002)(478600001)(8936002)(66066001)(86362001)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3829;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: nEwgbpN0NOJiiVlt9QBL1//niqJdFMYbxGi5V04Y6rfEZjxKU1Uz5hE9Mb5z/VzkZoFvIXHyK2R9RFDJ3WASQTymDcbzY2mnfD6ELWu2woRifxAwHaTxgT5bSd2ZnPI15lfPxb6tFbMZz+4VMMXYCBbpdczHmpmto9VTYQhCDYjV9O90+x4EtY/SW8oOML3r3UKxHItTSsrWhe5hy0X/xXl6CTdumKbmJKF+sbO5iaQPpnzkr0RFqACSg5gQpgVl8Wd9lpfdRJ9F+lQMJ4Lr0ts3slfG4xG2FWUI/uwQMpxaI04frihZ/oZbPY6rj1IG0RxwX5CWTi/F4UQWEUpot/u6C7H81ADXSdb/b6DTTa0Fbl2R7MEJJV45ptxT1vX3VHk4TeaNTse6bLMhGCo9nk1Kj8pHv7UUNhdaq2aMzlg=
Content-ID: <A34E9C70F7D03F4E84E34DE9823550B8@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3829
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(376002)(346002)(189003)(199004)(3716004)(5660300002)(9686003)(7736002)(6512007)(81166006)(66066001)(316002)(26005)(186003)(102836004)(356004)(6506007)(386003)(70206006)(70586007)(99286004)(47776003)(23726003)(3846002)(54906003)(8746002)(46406003)(58126008)(76130400001)(8936002)(305945005)(97756001)(6116002)(26826003)(14454004)(63350400001)(446003)(476003)(86362001)(126002)(336012)(1076003)(22756006)(36906005)(478600001)(486006)(81156014)(11346002)(4326008)(229853002)(2906002)(25786009)(6246003)(6486002)(6862004)(76176011)(8676002)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM7PR08MB5527;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 65efa81c-4923-4505-b938-08d7407286e9
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM7PR08MB5527; 
NoDisclaimer: True
X-Forefront-PRVS: 0169092318
X-Microsoft-Antispam-Message-Info: 1xA2rJr+xyTojcoi+CKvoqTho6C9NOnLL6diZP7ofpcCjTwcbzfVKmMsLELqvuIJxQ3PzRbau/MP97swKVskFr4iNGJY32cvVjHnbB/eMpPKV72xToMIsVzEJRLPIJ30NrkKnAz7CIx199zBPR8w0SOZlnBWJN970QdJ5E/62YxfGofsY+994eTmfyZ8c2hnNfBqWJ9Kqe/JGT+AUaYU3J0aiEpu9vwyITw1rNK60SGFlEsX6u46pj4Nlr2iXlkNBeCNfzxC62lfQtOa5gZSbiFyOmxLLSnul0Vta9NyER5OuCltc3beKjZ6kptRUYzNfikhHErcYJEwCrg9TXl+0YZlRJ5WR67FD1SwwubnWdARyeAnpByulM77J+9K5CFK46X2q4rwFlYJd62j14+lsfQr+3zRc45AD+OCLL/FRgo=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2019 22:08:29.1847 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 047dc1cf-ae38-48f9-c8c6-08d7407290a1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5527
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AzploTuVwFsMI06k76KZYFgDdpT9L7tfPDQCifWLUo=;
 b=5f3IB297/v9a06qvH4USM1PIruWZ2G4XyDxvgRkOJiTn6dKnh4ajOgWgNO1NR5HK94JCYv/EyAR/fe7SfYLtWIgnh2jrd1COarl2jFD/W6jbb+cIcon1n4txYLc7KRz5/Q21JBiJZOcHQB0EJfe3JYHCi0rbijXglhEPntpjHVc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AzploTuVwFsMI06k76KZYFgDdpT9L7tfPDQCifWLUo=;
 b=5f3IB297/v9a06qvH4USM1PIruWZ2G4XyDxvgRkOJiTn6dKnh4ajOgWgNO1NR5HK94JCYv/EyAR/fe7SfYLtWIgnh2jrd1COarl2jFD/W6jbb+cIcon1n4txYLc7KRz5/Q21JBiJZOcHQB0EJfe3JYHCi0rbijXglhEPntpjHVc=
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
 "Andrew F. Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 Alistair Strachan <astrachan@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9obiwKCk9uIEZyaSwgU2VwIDA2LCAyMDE5IGF0IDA2OjQ3OjA4UE0gKzAwMDAsIEpvaG4g
U3R1bHR6IHdyb3RlOgo+IEZyb206ICJBbmRyZXcgRi4gRGF2aXMiIDxhZmRAdGkuY29tPgo+IAo+
IFRoaXMgZnJhbWV3b3JrIGFsbG93cyBhIHVuaWZpZWQgdXNlcnNwYWNlIGludGVyZmFjZSBmb3Ig
ZG1hLWJ1Zgo+IGV4cG9ydGVycywgYWxsb3dpbmcgdXNlcmxhbmQgdG8gYWxsb2NhdGUgc3BlY2lm
aWMgdHlwZXMgb2YgbWVtb3J5Cj4gZm9yIHVzZSBpbiBkbWEtYnVmIHNoYXJpbmcuCj4gCj4gRWFj
aCBoZWFwIGlzIGdpdmVuIGl0cyBvd24gZGV2aWNlIG5vZGUsIHdoaWNoIGEgdXNlciBjYW4gYWxs
b2NhdGUKPiBhIGRtYS1idWYgZmQgZnJvbSB1c2luZyB0aGUgRE1BX0hFQVBfSU9DX0FMTE9DLgo+
IAo+IFRoaXMgY29kZSBpcyBhbiBldm9sdWl0b24gb2YgdGhlIEFuZHJvaWQgSU9OIGltcGxlbWVu
dGF0aW9uLAo+IGFuZCBhIGJpZyB0aGFua3MgaXMgZHVlIHRvIGl0cyBhdXRob3JzL21haW50YWlu
ZXJzIG92ZXIgdGltZQo+IGZvciB0aGVpciBlZmZvcnQ6Cj4gICBSZWJlY2NhIFNjaHVsdHogWmF2
aW4sIENvbGluIENyb3NzLCBCZW5qYW1pbiBHYWlnbmFyZCwKPiAgIExhdXJhIEFiYm90dCwgYW5k
IG1hbnkgb3RoZXIgY29udHJpYnV0b3JzIQo+IAo+IENjOiBMYXVyYSBBYmJvdHQgPGxhYmJvdHRA
cmVkaGF0LmNvbT4KPiBDYzogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxp
bmFyby5vcmc+Cj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4g
Q2M6IExpYW0gTWFyayA8bG1hcmtAY29kZWF1cm9yYS5vcmc+Cj4gQ2M6IFByYXRpayBQYXRlbCA8
cHJhdGlrcEBjb2RlYXVyb3JhLm9yZz4KPiBDYzogQnJpYW4gU3RhcmtleSA8QnJpYW4uU3Rhcmtl
eUBhcm0uY29tPgo+IENjOiBWaW5jZW50IERvbm5lZm9ydCA8VmluY2VudC5Eb25uZWZvcnRAYXJt
LmNvbT4KPiBDYzogU3VkaXB0byBQYXVsIDxTdWRpcHRvLlBhdWxAYXJtLmNvbT4KPiBDYzogQW5k
cmV3IEYuIERhdmlzIDxhZmRAdGkuY29tPgo+IENjOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGlu
ZnJhZGVhZC5vcmc+Cj4gQ2M6IENoZW5ibyBGZW5nIDxmZW5nY0Bnb29nbGUuY29tPgo+IENjOiBB
bGlzdGFpciBTdHJhY2hhbiA8YXN0cmFjaGFuQGdvb2dsZS5jb20+Cj4gQ2M6IEhyaWR5YSBWYWxz
YXJhanUgPGhyaWR5YUBnb29nbGUuY29tPgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gUmV2aWV3ZWQtYnk6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFy
ZEBsaW5hcm8ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBGLiBEYXZpcyA8YWZkQHRpLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4K
Ck9uZSBtaW5pc2N1bGUgbml0IGZyb20gbWUgYmVsb3csIGJ1dCB3aGV0aGVyIHlvdSBjaGFuZ2Ug
aXQgb3Igbm90LCB5b3UKY2FuIGFkZCBteSByLWI6CgpSZXZpZXdlZC1ieTogQnJpYW4gU3Rhcmtl
eSA8YnJpYW4uc3RhcmtleUBhcm0uY29tPgoKVGhhbmtzIGZvciBwdXNoaW5nIHRoaXMgdGhyb3Vn
aCEKCi1CcmlhbgoKPiAtLS0KCi4uLgoKPiArCj4gKwlkZXZfcmV0ID0gZGV2aWNlX2NyZWF0ZShk
bWFfaGVhcF9jbGFzcywKPiArCQkJCU5VTEwsCj4gKwkJCQloZWFwLT5oZWFwX2RldnQsCj4gKwkJ
CQlOVUxMLAo+ICsJCQkJaGVhcC0+bmFtZSk7Cj4gKwlpZiAoSVNfRVJSKGRldl9yZXQpKSB7Cj4g
KwkJcHJfZXJyKCJkbWFfaGVhcDogVW5hYmxlIHRvIGNyZWF0ZSBkZXZpY2VcbiIpOwo+ICsJCWVy
cl9yZXQgPSAoc3RydWN0IGRtYV9oZWFwICopZGV2X3JldDsKClRpbnkgbml0OiBFUlJfQ0FTVCgp
IHdvdWxkIGJlIG1vcmUgb2J2aW91cyBmb3IgbWUgaGVyZS4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
