Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8812FDC0A4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 11:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F426EB02;
	Fri, 18 Oct 2019 09:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30051.outbound.protection.outlook.com [40.107.3.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1C96EB02
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 09:12:32 +0000 (UTC)
Received: from VI1PR08CA0182.eurprd08.prod.outlook.com (2603:10a6:800:d2::12)
 by AM6PR08MB3621.eurprd08.prod.outlook.com (2603:10a6:20b:4b::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 18 Oct
 2019 09:12:25 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::200) by VI1PR08CA0182.outlook.office365.com
 (2603:10a6:800:d2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2367.20 via Frontend
 Transport; Fri, 18 Oct 2019 09:12:25 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT004.mail.protection.outlook.com (10.152.18.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 18 Oct 2019 09:12:24 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Fri, 18 Oct 2019 09:12:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0ae0b86be84cc997
X-CR-MTA-TID: 64aa7808
Received: from fdde536169ae.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.8.55]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7F56160A-8422-43FE-B781-BE4CC986E9AD.1; 
 Fri, 18 Oct 2019 09:12:16 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fdde536169ae.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Oct 2019 09:12:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TEGvfSZ9UMvUD7pjcuoRox6t+5y6DLBC6OKbrqKXDKLtdl7Gf3eAW4ZD+knhCHWk6oXCtxYavhcgmSnSn2rbyhT08WWJHHcYNSf+UShca/Ad/WQQj3BOKPCQhWIieOdGXzBbhkxk1MAaGYJd3/XEiIfNf0SzBSLy23Xs2L9Sft8IJ+38HEypEKq3ne6iyUQ7iZf+tZNnMzvLt/oJ1aqNhS4lJDBqh5yrhRXE1Jizchzdbe6mVrWy/gx7U/9JQtVYegdiJDWy0ABjcAf7ErMeACEuYvads1/DcG7doJVGO4YsbRKmaDa9k9IXOr/d2j6zkDD2mNU0Oema4pZoC0WstA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWR/Z4PQ4JtYsK6tzrgWRthab9Zpue1OMpZ4V/y1A34=;
 b=YksIR+6PQZ/g5awPPbTkeidKR4q9t/42RgGNEM5vQHOhATLi2MeYIhZHNhnPJ75ZVn3UrOFn427af9v3mRfp1NFux7QO3w80JEZYh2exx0YRawXprnKN60E86Cj7Y2XKEHPdE+/qeG0zNZ4y/24eX+5I7NQlzGmsFdsl85EocbHyLB2gjJ8zrJHPLGNuUtHmed8jSxuRB6FGva27+BoFh8swWE/hhjR4piUuW866w2wUBZFXIrX3U3yZw1DD1kbLZYzct3sUxyFsRHi8D1cehBtfGpw+EKrDhv1fgx0mLZm5ZSY9ogjfQdj0BoeMKdMAAzQFVCz0QWsei0lygBNdcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB3333.eurprd08.prod.outlook.com (52.135.163.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Fri, 18 Oct 2019 09:12:15 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a%5]) with mapi id 15.20.2347.023; Fri, 18 Oct 2019
 09:12:15 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [RFC,3/3] drm/komeda: Allow non-component drm_bridge only
 endpoints
Thread-Topic: [RFC,3/3] drm/komeda: Allow non-component drm_bridge only
 endpoints
Thread-Index: AQHVhDme1+iX/Utgt0y74txJGijIlKddc0AAgAC0dYCAAFdhgIAAIZ6AgAAHlgCAAA7tgIABQtWAgAAlwoA=
Date: Fri, 18 Oct 2019 09:12:15 +0000
Message-ID: <20191018091213.k6bka3tajy2vez6l@DESKTOP-E1NTVVP.localdomain>
References: <20191004143418.53039-4-mihail.atanassov@arm.com>
 <20191009055407.GA3082@jamwan02-TSP300> <5390495.Gzyn2rW8Nj@e123338-lin>
 <20191016162206.u2yo37rtqwou4oep@DESKTOP-E1NTVVP.localdomain>
 <20191017030752.GA3109@jamwan02-TSP300>
 <20191017082043.bpiuvfr3r4jngxtu@DESKTOP-E1NTVVP.localdomain>
 <20191017102055.GA8308@jamwan02-TSP300>
 <20191017104812.6qpuzoh5bx5i2y3m@DESKTOP-E1NTVVP.localdomain>
 <20191017114137.GC25745@shell.armlinux.org.uk>
 <20191018065657.GA19117@jamwan02-TSP300>
In-Reply-To: <20191018065657.GA19117@jamwan02-TSP300>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.52]
x-clientproxiedby: LO2P265CA0369.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::21) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 383711f1-ed60-4983-8c4d-08d753ab49fc
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM6PR08MB3333:|AM6PR08MB3333:|AM6PR08MB3621:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3621FA571434B27D36A26CBFF06C0@AM6PR08MB3621.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 01949FE337
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(199004)(189003)(14454004)(966005)(76176011)(386003)(478600001)(99286004)(186003)(52116002)(102836004)(8936002)(26005)(2906002)(66066001)(11346002)(446003)(8676002)(81166006)(81156014)(476003)(6506007)(44832011)(486006)(4744005)(66946007)(256004)(316002)(229853002)(66556008)(66476007)(6486002)(6436002)(71200400001)(66446008)(4326008)(6636002)(58126008)(64756008)(86362001)(5660300002)(9686003)(6306002)(6512007)(25786009)(3846002)(305945005)(6116002)(7736002)(6862004)(71190400001)(6246003)(1076003)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3333;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: LL61bUl2uiHTpeGFwp6+GwDBs/BFtM8BvDFCR8BZ7sTa7R7+tQMhKNQJo2fFXmNmBRGfTtdQCrjdxHZv6pW39YcQ1ByMBwHWnn0xsyQNJcU3drsrawUleIcM79s3N/TSGhTTLKYdxEzZ/bWi3tRyRXKTDrG3KOvc6TJIlMC/fR5p6KzRm7HL2WXIp5qfPqqO7Mjg4H7KVvsyLo6e25+LCbk9/2YO1wZxrZSCXvEBHrbeRNQWZbwX6f2NpsndRPXQWISlR29dflKOkvA91VomTJS94Pl3crLXNF3Spbhx09ERdsgmR3qghufOipdzKY8xefeVkzMGu0bBzKtN4rMnTwj+AY+SSj6RHqcY3gNC8m4v8oBAwfOYFuO1oWLX3YnBriAlDrTShvmxCFHG/VRLqTAxXCgTeyjuh969rasqIOhCe5ECYRginAm2dU837tdhUVf7E/YXlWPdbQGGHAPHAw==
Content-ID: <377373FC9EE9DA4D92BB84D26F6073F4@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3333
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(376002)(346002)(189003)(199004)(4744005)(63350400001)(14454004)(22756006)(1076003)(2906002)(99286004)(23726003)(6636002)(305945005)(336012)(5660300002)(7736002)(229853002)(54906003)(58126008)(6862004)(6306002)(11346002)(6246003)(25786009)(107886003)(6512007)(9686003)(446003)(8676002)(81166006)(81156014)(8746002)(316002)(8936002)(36906005)(6486002)(476003)(26826003)(356004)(478600001)(486006)(966005)(126002)(4326008)(50466002)(47776003)(46406003)(97756001)(386003)(70206006)(70586007)(102836004)(76176011)(66066001)(3846002)(6116002)(86362001)(26005)(186003)(76130400001)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3621;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8b270db4-aa36-43f2-6edf-08d753ab449d
NoDisclaimer: True
X-Forefront-PRVS: 01949FE337
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1lS1VQ8dL4tSinA3WP/8jdBBRIhfsRYe7oOL7HKvKZLa2UtEKTb9KIJ6HIRREGO/KMmpHKpj0qEooLjKb5pXlzTNZrzy59OahxJyGKByBEwFYqpWYrtEukeXShuIfOGV3zQbULZC/Fb/6sDM2miqkHo7qGgwfwySIsd4iV2l+OGiAEW/ZDeWoXWW0LXFjYvQiZ5+ZjH17um0VvVwSonkLuaURO5YcF78pRUlH14LS2fhqsHZhaVubiIhBXsTvvElnu1Kh/Xp0zt0iIHNMtWo6XaWjY399iti8Utyrra5rv4ySl2AtaBMBXzLdrCWoWGBoqBRWKK26v0oFrnN5xrIAdyRcBzZI7CdDXYDlzIj1b3M0n4QF72PU/MnXXkdkdKxG4r4Fx0lnXwYELaBClsU6LBTDn0TKzkLbA6UmcyV60b6w/yXJpFVc8Rgeof6zSzjaRR4p6uU2CcZNH0bId3fHg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2019 09:12:24.0914 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 383711f1-ed60-4983-8c4d-08d753ab49fc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3621
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWR/Z4PQ4JtYsK6tzrgWRthab9Zpue1OMpZ4V/y1A34=;
 b=Dl1IRMuTlgir2SPg8B3UR64pNs5tMTaqmUdKHiqOOLf6xxeV+WYepSr91Itvl7IYadxqCzpCApY9kD17BwrmQsMNE91VABSbhsdXv4kjCDkeb2cToDGdk2EMCmweSYHnRO7D+M6jYW6QWdc2cBpp7VoDGAySIoQPEZmnd729zpw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWR/Z4PQ4JtYsK6tzrgWRthab9Zpue1OMpZ4V/y1A34=;
 b=Dl1IRMuTlgir2SPg8B3UR64pNs5tMTaqmUdKHiqOOLf6xxeV+WYepSr91Itvl7IYadxqCzpCApY9kD17BwrmQsMNE91VABSbhsdXv4kjCDkeb2cToDGdk2EMCmweSYHnRO7D+M6jYW6QWdc2cBpp7VoDGAySIoQPEZmnd729zpw=
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
Cc: nd <nd@arm.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMDY6NTc6MDVBTSArMDAwMCwgamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gCj4gSGkgQnJpYW46Cj4gCj4gQ2FuIHRo
aXMgY29udmluY2UgeW91IHRvIGZ1bGx5IHN3YXAgdG8gYnJpZGdlID8KCk5vdCB1bnRpbCB0aG9z
ZSBwYXRjaGVzIG1hdGVyaWFsaXNlIGFuZCBsYW5kLCBubyA6LSkKCj4gCj4gQWN0dWFsbHkgZXZl
biB0aGVyZSBpcyBubyBmaXgsIHdlIHdvbid0IHJlYWwgZW5jb3VudGVyIHN1Y2ggcm1tb2QgcHJv
YmxlbSwKPiBzaW5jZSB3ZSBhbHdheXMgYnVpbGQgdGhlIGJyaWRnZS90ZGE5OTggKGJ5IFkpIGlu
dG8gdGhlIGltYWdlLgo+IAoKSWYgeW91IHNheSBzby4gSSB0aGluayB0aGUgZm9sa3MgaGVyZSBs
aWtlIGhhdmluZyBkcm0gYXMgYSBtb2R1bGUgdG8KbWFrZSBpdCBlYXN5IHRvIHBhdGNoIHRoaW5n
cyB3aXRob3V0IGEgcmVib290LgoKLUJyaWFuCgo+IFRoYW5rcwo+IEphbWVzCj4gPiAtLSAKPiA+
IFJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgub3JnLnVrL2RldmVsb3Bl
ci9wYXRjaGVzLwo+ID4gRlRUQyBicm9hZGJhbmQgZm9yIDAuOG1pbGUgbGluZSBpbiBzdWJ1cmJp
YTogc3luYyBhdCAxMi4xTWJwcyBkb3duIDYyMmticHMgdXAKPiA+IEFjY29yZGluZyB0byBzcGVl
ZHRlc3QubmV0OiAxMS45TWJwcyBkb3duIDUwMGticHMgdXAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
