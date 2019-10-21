Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4B4DE7D4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 11:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A12D89D5C;
	Mon, 21 Oct 2019 09:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40065.outbound.protection.outlook.com [40.107.4.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A805A89D5B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 09:18:29 +0000 (UTC)
Received: from VI1PR08CA0144.eurprd08.prod.outlook.com (2603:10a6:800:d5::22)
 by DB6PR0802MB2230.eurprd08.prod.outlook.com (2603:10a6:4:85::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.20; Mon, 21 Oct
 2019 09:18:26 +0000
Received: from AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::202) by VI1PR08CA0144.outlook.office365.com
 (2603:10a6:800:d5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.20 via Frontend
 Transport; Mon, 21 Oct 2019 09:18:25 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT040.mail.protection.outlook.com (10.152.17.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 21 Oct 2019 09:18:24 +0000
Received: ("Tessian outbound 851a1162fca7:v33");
 Mon, 21 Oct 2019 09:18:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 639a4823cea47f54
X-CR-MTA-TID: 64aa7808
Received: from c2e11027cb6c.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.58]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CB7DDA56-75A2-4779-8D32-AEE5385FA42E.1; 
 Mon, 21 Oct 2019 09:18:09 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2058.outbound.protection.outlook.com [104.47.10.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c2e11027cb6c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Mon, 21 Oct 2019 09:18:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYFDeE444yUtGlgtfSZ29cuBpo//Njj8AB7IHhqbzdvpdW7kunBPcLMEjYpQDWVHTl0ywXy9GeDzo5ONLBmwolX64Highr1s2lJ5GEm6g51sjHUZP51vRH3vgJ7TIHHmH6U3S/hhmi0R72ObS2YBpVTvYZnVTjBVcidyrQAnvXyirJSIm0Po6OuptcAOjZzWSp27Xkd0CegIT+QuBNMvqBLsu1HGy5hCpa6gq72z9mV7q1xUmbYVvfdzuS7uJKReB43hYCxQMgbzFmytELQGCjJO4AxyfHJ07CFaMBuphx1jO1akjjj/8oO/G/OTiibeb6ugdn4niTMqMblg3KdWng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bVTZpYM9yLx/bzDzCEuoQcIPT5HKjy7OtR5DvjhQxQ=;
 b=bHLWmeP550h4ygy1YiK8IQN8vVF0Ivo2ST13UnJ7WvUz+H52TIscZcKiZIT5ZNl+4jlxJwpP9vbTaAwCggSJqc47GyI2eKmlov8Ib5azwEFaTDiJmJlo049+KrQqOFe3mNwLl1s7sByydO1pSk9DXHl0RM6EiO/xkmVfPOAPxTddqG5lJXO00XVyRA/JCv1E+M6ySIcpCbBizPb6bA8Jbd16qQqa3e/0uFNjj0IZpwTFT3OeiDHRV+N66xhIubiJIa/lDb4Xr2EZoD+LKGCATFzX1w+iGHeUDfUpG0Ay6ivEFWGvdc91AZp6QQfYLswbfgv2DBZkd8sDid/HlBu1pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB3525.eurprd08.prod.outlook.com (20.177.115.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Mon, 21 Oct 2019 09:18:08 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a%5]) with mapi id 15.20.2347.029; Mon, 21 Oct 2019
 09:18:08 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
Thread-Topic: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
Thread-Index: AQHVZOOE06vVhxy1kU6dQZ4T2LR+p6ddx+OAgAGsdgCAAAQmgIAAGMaAgADZPACAAJMAAIAAAjoAgAACPwCAAToOgIAC2xUA
Date: Mon, 21 Oct 2019 09:18:07 +0000
Message-ID: <20191021091806.v2buuugck5maxah5@DESKTOP-E1NTVVP.localdomain>
References: <20191014090729.lwusl5zxa32a7uua@DESKTOP-E1NTVVP.localdomain>
 <a213760f-1f41-c4a3-7e38-8619898adecd@ti.com>
 <CALAqxLV6EBHKPEaEkyfhEYyw0TXayTeY_4AWXfuASLLyxZh5+Q@mail.gmail.com>
 <a3c66479-7433-ec29-fbec-81aef60cb063@ti.com>
 <CALAqxLWrsXG0XysL7RmhApbuZukDdG5VhdHOTS5odkG9f1ezwA@mail.gmail.com>
 <20191018095516.inwes5avdeixl5nr@DESKTOP-E1NTVVP.localdomain>
 <20191018184123.GA10634@arm.com>
 <CALAqxLXzOjyD1MpGeuZKLz+RNz1Utd8QpbvtSOodeqT-gCu6kA@mail.gmail.com>
 <20191018185723.GA27993@arm.com>
 <2c60496c-d536-05e7-bbf6-ca718b8142bd@ti.com>
In-Reply-To: <2c60496c-d536-05e7-bbf6-ca718b8142bd@ti.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.51]
x-clientproxiedby: LNXP265CA0022.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::34) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: dd15f990-f76a-4391-b3f3-08d756079fdf
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM6PR08MB3525:|AM6PR08MB3525:|DB6PR0802MB2230:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0802MB223012E4F448E1A59E23382FF0690@DB6PR0802MB2230.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0197AFBD92
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(189003)(199004)(7416002)(8936002)(86362001)(478600001)(9686003)(6512007)(256004)(66946007)(44832011)(66066001)(14444005)(99286004)(6246003)(561944003)(26005)(3846002)(6116002)(2906002)(1076003)(229853002)(71200400001)(71190400001)(6436002)(66446008)(66476007)(6916009)(64756008)(66556008)(4326008)(6486002)(7736002)(476003)(305945005)(102836004)(58126008)(316002)(81166006)(81156014)(14454004)(52116002)(8676002)(386003)(6506007)(53546011)(76176011)(446003)(5660300002)(54906003)(486006)(186003)(11346002)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3525;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: uup2dbjxtD/8zUIk4LVn0i4eF76auvFiBucQtjsWyNsdaLJt8gnmCbuXxjIoVaSWXRcKBaBFB+WwDUaop+odJR8flqa8JkeivgqbIO5+VcyRmP8jn0XphFgraDXYKKHZqdtBkXTdLDZvectnPMLt26YvcirrTsvTF/QBSkVJHP2W9K2YP6I+elRjF/LtAlyasXiRbLnNR+aYLBnffuiZgvkHlZqkYxC0vCrcStknqpp/LdtJ6lpN9HqNmdjjJ6K7BlbsRZi68ZXJd0KPIeOmjiN8XHIAZHmu8wZJes663LZk9rePg8BeamcN9uY76N1DCk2NnqjimuTldVKt2ArKRwt7KUiYMIjNpnVzvH5SX7ofATEP1ZHQqARV8J7ow7dBCXNMvfNZtbUAKGPfQFz0wNeo2UMrNQxq92P6D4qQUbv6mIfXtMDTxT4pbSK86P2S
Content-ID: <53269AB746B4B841A88527E6E90F7700@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3525
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(346002)(199004)(189003)(5660300002)(6246003)(4326008)(7736002)(386003)(107886003)(63350400001)(53546011)(561944003)(1076003)(99286004)(229853002)(186003)(14444005)(54906003)(36906005)(6512007)(6506007)(305945005)(9686003)(336012)(22756006)(102836004)(6486002)(316002)(26005)(58126008)(356004)(486006)(66066001)(97756001)(81166006)(476003)(6116002)(6862004)(3846002)(8936002)(8746002)(81156014)(2906002)(50466002)(76130400001)(23726003)(126002)(76176011)(70206006)(70586007)(46406003)(11346002)(86362001)(478600001)(26826003)(14454004)(446003)(47776003)(25786009)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0802MB2230;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1dfdd2fa-9b8b-40c1-4f32-08d756079606
NoDisclaimer: True
X-Forefront-PRVS: 0197AFBD92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gw0owmBSNkiQd4rUN4uKk/9sD6KunMmKrBzvLioYamoeo1iiSjwuSnch7ffUtezESRzh2Y0sY0nB8r6KziseKY4r8RsnsY880u9whqYCVI8JLvtWigBmEET6xjJnlGTatz0PkH+yqDGlsLFzfn2mjYFMIY3TghXTzREwcZXdQZvmUgRCRehAdarGS1Vfc+2FxAiYo7PNSJY5IZqGjUrkorFv2MiUxGxYRkG1Lgz/Eia7MQ9s4vwq43syr0WoS6Z4UTqAd63bymRtCGX67grNMSjpToI0fAI58WVMsqMmDVYx8f2RnQo8ycYTz7r0L+TfepRl9qb9mwgA9sbWNs+dbT+68vnntqZ1Er7lyYtfXRSlzUhGCR+Up4M18XcvZGT5wt5oY+QEdCrqDH0B5AGx7km2ZUKgq/rOWkEntdA9JrntZI0pcWPjFAYPhK6liP3D
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2019 09:18:24.2641 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd15f990-f76a-4391-b3f3-08d756079fdf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2230
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bVTZpYM9yLx/bzDzCEuoQcIPT5HKjy7OtR5DvjhQxQ=;
 b=wfNfsFI0+ikkCvq8Uuoh+XCtiRx3+PyX35RMj/KMlWvjVRLxo4DK6ogs8SnLj88y9c+xMG2h2OZClU24uDwAJ0n1n6PSG4/IW2j1VgFHzNQq+8a+AtfaacQihS6kMIp36FJDttWtSPF5UuxWbn65EcB2EjSE+t0ddWpliMq6QpY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bVTZpYM9yLx/bzDzCEuoQcIPT5HKjy7OtR5DvjhQxQ=;
 b=wfNfsFI0+ikkCvq8Uuoh+XCtiRx3+PyX35RMj/KMlWvjVRLxo4DK6ogs8SnLj88y9c+xMG2h2OZClU24uDwAJ0n1n6PSG4/IW2j1VgFHzNQq+8a+AtfaacQihS6kMIp36FJDttWtSPF5UuxWbn65EcB2EjSE+t0ddWpliMq6QpY=
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 Alistair Strachan <astrachan@google.com>, Liam Mark <lmark@codeaurora.org>,
 lkml <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, nd <nd@arm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBPY3QgMTksIDIwMTkgYXQgMDk6NDE6MjdBTSAtMDQwMCwgQW5kcmV3IEYuIERhdmlz
IHdyb3RlOgo+IE9uIDEwLzE4LzE5IDI6NTcgUE0sIEF5YW4gSGFsZGVyIHdyb3RlOgo+ID4gT24g
RnJpLCBPY3QgMTgsIDIwMTkgYXQgMTE6NDk6MjJBTSAtMDcwMCwgSm9obiBTdHVsdHogd3JvdGU6
Cj4gPj4gT24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMTE6NDEgQU0gQXlhbiBIYWxkZXIgPEF5YW4u
SGFsZGVyQGFybS5jb20+IHdyb3RlOgo+ID4+PiBPbiBGcmksIE9jdCAxOCwgMjAxOSBhdCAwOTo1
NToxN0FNICswMDAwLCBCcmlhbiBTdGFya2V5IHdyb3RlOgo+ID4+Pj4gT24gVGh1LCBPY3QgMTcs
IDIwMTkgYXQgMDE6NTc6NDVQTSAtMDcwMCwgSm9obiBTdHVsdHogd3JvdGU6Cj4gPj4+Pj4gT24g
VGh1LCBPY3QgMTcsIDIwMTkgYXQgMTI6MjkgUE0gQW5kcmV3IEYuIERhdmlzIDxhZmRAdGkuY29t
PiB3cm90ZToKPiA+Pj4+Pj4gT24gMTAvMTcvMTkgMzoxNCBQTSwgSm9obiBTdHVsdHogd3JvdGU6
Cj4gPj4+Pj4+PiBCdXQgaWYgdGhlIG9iamVjdGlvbiBzdGFuZHMsIGRvIHlvdSBoYXZlIGEgcHJv
cG9zYWwgZm9yIGFuIGFsdGVybmF0aXZlCj4gPj4+Pj4+PiB3YXkgdG8gZW51bWVyYXRlIGEgc3Vi
c2V0IG9mIENNQSBoZWFwcz8KPiA+Pj4+Pj4+Cj4gPj4+Pj4+IFdoZW4gaW4gc3RhZ2luZyBJT04g
aGFkIHRvIHJlYWNoIGludG8gdGhlIENNQSBmcmFtZXdvcmsgYXMgdGhlIG90aGVyCj4gPj4+Pj4+
IGRpcmVjdGlvbiB3b3VsZCBub3QgYmUgYWxsb3dlZCwgc28gY21hX2Zvcl9lYWNoX2FyZWEoKSB3
YXMgYWRkZWQuIElmCj4gPj4+Pj4+IERNQS1CVUYgaGVhcHMgaXMgbm90IGluIHN0YWdpbmcgdGhl
biB3ZSBjYW4gZG8gdGhlIG9wcG9zaXRlLCBhbmQgaGF2ZQo+ID4+Pj4+PiB0aGUgQ01BIGZyYW1l
d29yayByZWdpc3RlciBoZWFwcyBpdHNlbGYgdXNpbmcgb3VyIGZyYW1ld29yay4gVGhhdCB3YXkK
PiA+Pj4+Pj4gdGhlIENNQSBzeXN0ZW0gY291bGQgZGVjaWRlIHdoYXQgYXJlYXMgdG8gZXhwb3J0
IG9yIG5vdCAobWF5YmUgYmFzZWQgb24KPiA+Pj4+Pj4gYSBEVCBwcm9wZXJ0eSBvciBzaW1pbGFy
KS4KPiA+Pj4+Pgo+ID4+Pj4+IE9rLiBUaG91Z2ggdGhlIENNQSBjb3JlIGRvZXNuJ3QgaGF2ZSBt
dWNoIHNlbnNlIG9mIERUIGRldGFpbHMgZWl0aGVyLAo+ID4+Pj4+IHNvIGl0IHdvdWxkIHByb2Jh
Ymx5IGhhdmUgdG8gYmUgZG9uZSBpbiB0aGUgcmVzZXJ2ZWRfbWVtIGxvZ2ljLCB3aGljaAo+ID4+
Pj4+IGRvZXNuJ3QgZmVlbCByaWdodCB0byBtZS4KPiA+Pj4+Pgo+ID4+Pj4+IEknZCBwcm9iYWJs
eSBndWVzcyB3ZSBzaG91bGQgaGF2ZSBzb21lIHNvcnQgb2YgZHQgYmluZGluZyB0byBkZXNjcmli
ZQo+ID4+Pj4+IGEgZG1hYnVmIGNtYSBoZWFwIGFuZCBmcm9tIHRoYXQgbm9kZSBsaW5rIHRvIGEg
Q01BIG5vZGUgdmlhIGEKPiA+Pj4+PiBtZW1vcnktcmVnaW9uIHBoYW5kbGUuIEFsb25nIHdpdGgg
bWF5YmUgdGhlIGRlZmF1bHQgaGVhcCBhcyB3ZWxsPyBOb3QKPiA+Pj4+PiBlYWdlciB0byBnZXQg
aW50byBhbm90aGVyIGJpbmRpbmcgcmV2aWV3IGN5Y2xlLCBhbmQgSSdtIG5vdCBzdXJlIHdoYXQK
PiA+Pj4+PiBub24tRFQgc3lzdGVtcyB3aWxsIGRvIHlldCwgYnV0IEknbGwgdGFrZSBhIHNob3Qg
YXQgaXQgYW5kIGl0ZXJhdGUuCj4gPj4+Pj4KPiA+Pj4+Pj4gVGhlIGVuZCByZXN1bHQgaXMgdGhl
IHNhbWUgc28gd2UgY2FuIG1ha2UgdGhpcyBjaGFuZ2UgbGF0ZXIgKGl0IGhhcyB0bwo+ID4+Pj4+
PiBjb21lIGFmdGVyIERNQS1CVUYgaGVhcHMgaXMgaW4gYW55d2F5KS4KPiA+Pj4+Pgo+ID4+Pj4+
IFdlbGwsIEknbSBoZXNpdGFudCB0byBtZXJnZSBjb2RlIHRoYXQgZXhwb3NlcyBhbGwgdGhlIENN
QSBoZWFwcyBhbmQKPiA+Pj4+PiB0aGVuIGFkZCBwYXRjaGVzIHRoYXQgYmVjb21lcyBtb3JlIHNl
bGVjdGl2ZSwgc2hvdWxkIGFueW9uZSBkZXBlbmQgb24KPiA+Pj4+PiB0aGUgaW5pdGlhbCBiZWhh
dmlvci4gOi8KPiA+Pj4+Cj4gPj4+PiBIb3cgYWJvdXQgb25seSBhdXRvLWFkZGluZyB0aGUgc3lz
dGVtIGRlZmF1bHQgQ01BIHJlZ2lvbiAoY21hLT5uYW1lID09Cj4gPj4+PiAicmVzZXJ2ZWQiKT8K
PiA+Pj4+Cj4gPj4+PiBBbmQvb3IgdGhlIENNQSBhdXRvLWFkZCBjb3VsZCBiZSBiZWhpbmQgYSBj
b25maWcgb3B0aW9uPyBJdCBzZWVtcyBhCj4gPj4+PiBzaGFtZSB0byBmdXJ0aGVyIGRlbGF5IHRo
aXMsIGFuZCB0aGUgQ01BIGhlYXAgaXRzZWxmIHJlYWxseSBpcyB1c2VmdWwuCj4gPj4+Pgo+ID4+
PiBBIGJpdCBvZiBhIGRldG91ciwgY29tbWluZyBiYWNrIHRvIHRoZSBpc3N1ZSB3aHkgdGhlIGZv
bGxvd2luZyBub2RlCj4gPj4+IHdhcyBub3QgZ2V0dGluZyBkZXRlY3RlZCBieSB0aGUgZG1hLWJ1
ZiBoZWFwcyBmcmFtZXdvcmsuCj4gPj4+Cj4gPj4+ICAgICAgICAgcmVzZXJ2ZWQtbWVtb3J5IHsK
PiA+Pj4gICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Owo+ID4+PiAgICAgICAg
ICAgICAgICAgI3NpemUtY2VsbHMgPSA8Mj47Cj4gPj4+ICAgICAgICAgICAgICAgICByYW5nZXM7
Cj4gPj4+Cj4gPj4+ICAgICAgICAgICAgICAgICBkaXNwbGF5X3Jlc2VydmVkOiBmcmFtZWJ1ZmZl
ckA2MDAwMDAwMCB7Cj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
c2hhcmVkLWRtYS1wb29sIjsKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgbGludXgsY21h
LWRlZmF1bHQ7Cj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldXNhYmxlOyA8PDw8PDw8
PDw8PDwtLS0tLS0tLS0tLVRoaXMgd2FzIG1pc3NpbmcgaW4gb3VyCj4gPj4+IGVhcmxpZXIgbm9k
ZQo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MCAweDYwMDAwMDAwIDAgMHgw
ODAwMDAwMD47Cj4gPj4+ICAgICAgICAgICAgICAgICB9Owo+ID4+Cj4gPj4gUmlnaHQuIEl0IGhh
cyB0byBiZSBhIENNQSByZWdpb24gZm9yIHVzIHRvIGV4cG9zZSBpdCBmcm9tIHRoZSBjbWEgaGVh
cC4KPiA+Pgo+ID4+Cj4gPj4+IFdpdGggJ3JldXNhYmxlJywgcm1lbV9jbWFfc2V0dXAoKSBzdWNj
ZWVkcyAsIGJ1dCB0aGUga2VybmVsIGNyYXNoZXMgYXMgZm9sbG93cyA6LQo+ID4+Pgo+ID4+PiBb
ICAgIDAuNDUwNTYyXSBXQVJOSU5HOiBDUFU6IDIgUElEOiAxIGF0IG1tL2NtYS5jOjExMCBjbWFf
aW5pdF9yZXNlcnZlZF9hcmVhcysweGVjLzB4MjJjCj4gPj4KPiA+PiBJcyB0aGUgdmFsdWUgMHg2
MDAwMDAwMCB5b3UncmUgdXNpbmcgc29tZXRoaW5nIHlvdSBqdXN0IGd1ZXNzZWQgYXQ/IEl0Cj4g
Pj4gc2VlbXMgbGlrZSB0aGUgd2FybmluZyBoZXJlIGlzIHNheWluZyB0aGUgcGZuIGNhbGN1bGF0
ZWQgZnJvbSB0aGUgYmFzZQo+ID4+IGFkZHJlc3MgaXNuJ3QgdmFsaWQuCj4gPiBJdCBpcyBhIHZh
bGlkIG1lbW9yeSByZWdpb24gd2UgdXNlIHRvIGFsbG9jYXRlIGZyYW1lYnVmZmVycy4KPiAKPiAK
PiBCdXQgZG9lcyBpdCBoYXZlIGEgdmFsaWQga2VybmVsIHZpcnR1YWwgbWFwcGluZz8gTW9zdCBB
Uk0gc3lzdGVtcyAoanVzdAo+IGFzc3VtaW5nIHlvdSBhcmUgd29ya2luZyBvbiBBUk0gOikpIHRo
YXQgSSdtIGZhbWlsaWFyIHdpdGggaGF2ZSB0aGUgRFJBTQo+IHNwYWNlIHN0YXJ0aW5nIGF0IDB4
ODAwMDAwMDAgYW5kIHNvIGRvbid0IHN0YXJ0IGhhdmluZyB2YWxpZCBwZm5zIHVudGlsCj4gdGhh
dCBwb2ludC4gSXMgdGhpcyBhZGRyZXNzIHlvdSBhcmUgcmVzZXJ2aW5nIGFuIFNSQU0/Cj4gCgpZ
ZWFoLCBJIHRoaW5rIHlvdSd2ZSBnb3QgaXQuCgpUaGlzIHJlZ2lvbiBpcyBEUkFNIG9uIGFuIEZQ
R0EgZXhwYW5zaW9uIHRpbGUsIGJ1dCBhcyB5b3UgaGF2ZSBub3RpY2VkCml0cyAiYmVsb3ciIHRo
ZSBzdGFydCBvZiBtYWluIFJBTSwgYW5kIEkgZXhwZWN0IGl0J3Mgbm90IGluIGFueSBvZiB0aGUK
ZGVjbGFyZWQgL21lbW9yeS8gbm9kZXMuCgpXaGVuICJyZXVzYWJsZSIgaXNuJ3QgdGhlcmUsIEkg
dGhpbmsgd2UnbGwgZW5kIHVwIGdvaW5nIHRoZSBjb2hlcmVudC5jCnJvdXRlLCB3aXRoIGRtYV9p
bml0X2NvaGVyZW50X21lbW9yeSgpIHNldHRpbmcgdXAgc29tZSBwYWdlcy4KCklmICJyZXVzYWJs
ZSIgaXMgdGhlcmUsIHRoZW4gSSB0aGluayB3ZSdsbCBlbmQgdXAgaW4gY29udGlndW91cy5jIGFu
ZAp0aGF0IGV4cGVjdHMgdXMgdG8gYWxyZWFkeSBoYXZlIHBhZ2VzLgoKU28sIEBBeWFuLCB5b3Ug
Y291bGQgcGVyaGFwcyB0cnkgYWRkaW5nIHRoaXMgcmVnaW9uIGFzIGEgL21lbW9yeS8gbm9kZQph
cy13ZWxsLCB3aGljaCBzaG91bGQgbWVhbiB0aGUga2VybmVsIHNldHMgdXAgc29tZSBwYWdlcyBm
b3IgaXQgYXMKbm9ybWFsIG1lbW9yeS4gQnV0LCBJIGhhdmUgc29tZSBhbmNpZW50IHJlY29sbGVj
dGlvbiB0aGF0IHRoZSBhcm02NAprZXJuZWwgY291bGRuJ3QgaGFuZGxlIHN5c3RlbSBSQU0gYXQg
YWRkcmVzc2VzIGJlbG93IDB4ODAwMDAwMDAgb3IKc29tZXRoaW5nLiBUaGF0IG1pZ2h0IGJlIGRp
ZmZlcmVudCBub3csIEknbSB0YWxraW5nIGFib3V0IHNldmVyYWwKeWVhcnMgYWdvLgoKVGhhbmtz
LAotQnJpYW4KCj4gQW5kcmV3Cj4gCj4gCj4gPj4KPiA+PiB0aGFua3MKPiA+PiAtam9obgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
