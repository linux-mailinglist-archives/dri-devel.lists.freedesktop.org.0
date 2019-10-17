Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2529ADA721
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 10:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5EB6E409;
	Thu, 17 Oct 2019 08:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50061.outbound.protection.outlook.com [40.107.5.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9056E89FF9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 08:21:10 +0000 (UTC)
Received: from VI1PR08CA0233.eurprd08.prod.outlook.com (2603:10a6:802:15::42)
 by DBBPR08MB4425.eurprd08.prod.outlook.com (2603:10a6:10:cc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Thu, 17 Oct
 2019 08:21:06 +0000
Received: from DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::206) by VI1PR08CA0233.outlook.office365.com
 (2603:10a6:802:15::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.18 via Frontend
 Transport; Thu, 17 Oct 2019 08:21:06 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT007.mail.protection.outlook.com (10.152.20.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Thu, 17 Oct 2019 08:21:04 +0000
Received: ("Tessian outbound 6481c7fa5a3c:v33");
 Thu, 17 Oct 2019 08:21:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 129d90b1f67939b3
X-CR-MTA-TID: 64aa7808
Received: from 09eb9d269ea1.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.13.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 93DAE767-1A7E-47E2-A7DB-49974FE94D2C.1; 
 Thu, 17 Oct 2019 08:20:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 09eb9d269ea1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 17 Oct 2019 08:20:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GjXJTkadL2vYWL58H05CG4iHsG1Pk6BUOpI+YUm6E1SGl3aUYMNy75bY0yXyGZjYrwn+knVHmZ70ST8YgvX56Y9px/Gov9Ek1uxhkjT5TRYgpZIFPBjmgcktwPShW55IgedMNlJjBYBMWPpW2MpBveOCc1z02OunJycW7plfq9v1WFFWYh5gji2gXiruKazD07W1RM6jixcbME8dx+Gj61P0IMN7nvhmWgC8BeUZPgZDQOJgBh2hNhXjXd2XyPXrwzS+r+JHdRtV+JVISWFKLE2rUtDr74UGLMyMWe0u0mx1uW/hVZQEgrjTotwr2DERGDNDiedHgDLeCl9mhmv2hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukV8AqxmvlgoHHVMd6rm6b4oZHLxc7mlDUHP9wxrEiw=;
 b=eIScW3pBFA33TzK988msWtg/RMObnbppn2Ujg138Bre5FznOKm0ZbArpMdJkH3deCQ0KdqkyK/TxLtt+kZoxfXfCwVTA6r9Or2IlIdERmKXLIHwy9BV5TdYrd5g9l+NvAyH+Lu+9aiNCvupuWollTdq3zG4Qc3ELLBOQf8wZmxK1I5wpHJUfum7f0crC1Xllrhs0twF2WXuKfzyMSrqFtz1QemptVyavsoVJGIL8Qk6Qh1PA5RLfA5MZAwtta9l9Tp4Nw0VwGCh9DKZOwItnt190IXdOIcYJpFcBsf3YqDS8JeUeWDI3PLhXGTNC8H2L56QCa1omilIE41bSj4LJgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB3736.eurprd08.prod.outlook.com (20.178.89.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 17 Oct 2019 08:20:56 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a%5]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 08:20:56 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [RFC,3/3] drm/komeda: Allow non-component drm_bridge only
 endpoints
Thread-Topic: [RFC,3/3] drm/komeda: Allow non-component drm_bridge only
 endpoints
Thread-Index: AQHVhDme1+iX/Utgt0y74txJGijIlKddc0AAgAC0dYCAAFdhgA==
Date: Thu, 17 Oct 2019 08:20:56 +0000
Message-ID: <20191017082043.bpiuvfr3r4jngxtu@DESKTOP-E1NTVVP.localdomain>
References: <20191004143418.53039-4-mihail.atanassov@arm.com>
 <20191009055407.GA3082@jamwan02-TSP300> <5390495.Gzyn2rW8Nj@e123338-lin>
 <20191016162206.u2yo37rtqwou4oep@DESKTOP-E1NTVVP.localdomain>
 <20191017030752.GA3109@jamwan02-TSP300>
In-Reply-To: <20191017030752.GA3109@jamwan02-TSP300>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.52]
x-clientproxiedby: SN6PR01CA0024.prod.exchangelabs.com (2603:10b6:805:b6::37)
 To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d94f6d57-d09d-42b0-587a-08d752daf3ff
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM6PR08MB3736:|AM6PR08MB3736:|DBBPR08MB4425:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB44255A4F34F5310CEF0962C2F06D0@DBBPR08MB4425.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 01930B2BA8
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(189003)(199004)(58126008)(54906003)(6436002)(6486002)(9686003)(6512007)(316002)(66066001)(44832011)(4326008)(6246003)(6862004)(486006)(476003)(11346002)(446003)(229853002)(4744005)(66946007)(66556008)(64756008)(66446008)(66476007)(81156014)(81166006)(8676002)(8936002)(25786009)(478600001)(14454004)(71190400001)(71200400001)(256004)(1076003)(186003)(26005)(6506007)(386003)(102836004)(2906002)(52116002)(76176011)(5660300002)(99286004)(86362001)(6636002)(6116002)(3846002)(305945005)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3736;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Y2O0NzFGt0o6CHOL4BeVPrG7DbZc66UBB5oAFCiVX64rnHERVGtcvvjEgRPeoWY3UixsAcZORUh7yL6hLeZKHFKlBFEq/H/1Nd5iTucL1UJJtl8EbQ2Nr//0PK2BkqL7AhMNfHLXtlcmBAi/TQYqGtdvkGKmmVnG4MWYpJ3Z7NXhifVFEVljRyJV6PFS/eBRHBTio1+/WzglZP4CsWv4+8QP+iKmUd/Lj3RPjDswNtoA+C6JsF/ttCZSf9J0KYf4vUb6FMARfdVqozUH1jHr/rkyMB4bnQdXsP3/uhWwFGiTMnGx3neI4jUkhAQZYstXyqnSEvFEWjrNv2O24F01tj+cTw5ee9Zie++8tQi2Ua2L2+ONig8cFBc4wwToYQrxDxPIAbqhoTuWfubJQodVESFmH9QAmWHwCQ1VsXr/Ypk=
Content-ID: <3A65F37C6D7B304F98C90FAE55DDAA36@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3736
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(346002)(136003)(199004)(189003)(8676002)(58126008)(23726003)(6486002)(6512007)(54906003)(9686003)(7736002)(316002)(99286004)(6116002)(3846002)(76130400001)(22756006)(186003)(25786009)(70586007)(6246003)(70206006)(76176011)(107886003)(386003)(6506007)(102836004)(86362001)(47776003)(26005)(356004)(4744005)(305945005)(486006)(66066001)(6862004)(81156014)(81166006)(14454004)(8936002)(336012)(1076003)(46406003)(11346002)(478600001)(50466002)(229853002)(6636002)(26826003)(5660300002)(476003)(2906002)(126002)(446003)(4326008)(97756001)(8746002)(63350400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4425;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 24df4abc-381c-4ecb-167d-08d752daeef2
NoDisclaimer: True
X-Forefront-PRVS: 01930B2BA8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bcN/2qhH46RBixTolWX7a19rNVOVMxZKwyJIUol35s2v8X4v8n2OL9o46dVCXzgnXHu7Z4VDoITg4f3qPaV8eeEf3pKWQ7KGddxJTWQumNN6MpCyP8y55KLOrrBuK0YFBquw9WE2gsbdC9+zgm48vwfNOa/hy8JPgokQmBd/og3qg9huOGGB0cdP67xdyVkUsCmAp5UmAtHmXDLjADMFM2obGcfrvSQnNI24Zwqi3XDQ2YJjnccn+5YJzNtPx3lBAK9x3NP9qcxv8numtt5Tje6g5L+Jo9jbkfQMEomaKxAhPE+zPhyk7i1qthqYN+WHCgvIe29MJl9WDkKpTJvUSfX1Frk3sRdGFsJlG5Qhc50TVCa8oshtjY1RwdVT6rBVD4SR3t0ScXcgu4ZbDytuYZEj8t5I5aUGyBuWe9XUOoQ=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 08:21:04.5670 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d94f6d57-d09d-42b0-587a-08d752daf3ff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4425
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukV8AqxmvlgoHHVMd6rm6b4oZHLxc7mlDUHP9wxrEiw=;
 b=GBdhjIO/eyNcoTfaQ3jkZZkbEAcYAMD+Bs+hiC+hCH61GjIs1swvJqxHkNZzGQLvemmzb1DOcTYeok03NrgNljFiObVCrSEhImr4lUN0SEGR64bSInOSwotnC37rrp3MdN4ryTHYwMNfCtdVKYwIS4wE8JVHog/JsAD7aI1lzFM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukV8AqxmvlgoHHVMd6rm6b4oZHLxc7mlDUHP9wxrEiw=;
 b=GBdhjIO/eyNcoTfaQ3jkZZkbEAcYAMD+Bs+hiC+hCH61GjIs1swvJqxHkNZzGQLvemmzb1DOcTYeok03NrgNljFiObVCrSEhImr4lUN0SEGR64bSInOSwotnC37rrp3MdN4ryTHYwMNfCtdVKYwIS4wE8JVHog/JsAD7aI1lzFM=
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
 Liviu Dudau <Liviu.Dudau@arm.com>, Russell King <linux@armlinux.org.uk>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMDM6MDc6NTlBTSArMDAwMCwgamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gT24gV2VkLCBPY3QgMTYsIDIwMTkgYXQg
MDQ6MjI6MDdQTSArMDAwMCwgQnJpYW4gU3RhcmtleSB3cm90ZToKPiA+IAo+ID4gSWYgSmFtZXMg
aXMgc3Ryb25nbHkgYWdhaW5zdCBtZXJnaW5nIHRoaXMsIG1heWJlIHdlIGp1c3Qgc3dhcAo+ID4g
d2hvbGVzYWxlIHRvIGJyaWRnZT8gQnV0IGZvciBtZSwgdGhlIHByYWdtYXRpYyBhcHByb2FjaCB3
b3VsZCBiZSB0aGlzCj4gPiBzdG9wLWdhcC4KPiA+Cj4gCj4gVGhpcyBpcyBhIGdvb2QgaWRlYSwg
YW5kIEkgdm90ZSArVUxPTkdfTUFYIDopCj4gCj4gYW5kIEkgYWxzbyBjaGVja2VkIHRkYTk5OHgg
ZHJpdmVyLCBpdCBzdXBwb3J0cyBicmlkZ2UuIHNvIHN3YXAgdGhlCj4gd2hvbGVzYWxlIHRvIGJy
aWdlIGlzIHBlcmZlY3QuIDopCj4gCgpXZWxsLCBhcyBNaWhhaWwgd3JvdGUsIGl0J3MgZGVmaW5p
dGVseSBub3QgcGVyZmVjdC4KClRvZGF5LCBpZiB5b3Ugcm1tb2QgdGRhOTk4eCB3aXRoIHRoZSBE
UFUgZHJpdmVyIHN0aWxsIGxvYWRlZCwKZXZlcnl0aGluZyB3aWxsIGJlIHVuYm91bmQgZ3JhY2Vm
dWxseS4KCklmIHdlIHN3YXAgdG8gYnJpZGdlLCB0aGVuIHJtbW9kJ2luZyB0ZGE5OTh4IChvciBh
bnkgb3RoZXIgYnJpZGdlCmRyaXZlciB0aGUgRFBVIGlzIHVzaW5nKSB3aXRoIHRoZSBEUFUgZHJp
dmVyIHN0aWxsIGxvYWRlZCB3aWxsIHJlc3VsdAppbiBhIGNyYXNoLgoKU28sIHRoZXJlIHJlYWxs
eSBhcmUgcHJvcGVyIGJlbmVmaXRzIHRvIHN0aWNraW5nIHdpdGggdGhlIGNvbXBvbmVudApjb2Rl
IGZvciB0ZGE5OTh4LCB3aGljaCBpcyB3aHkgSSdkIGxpa2UgdG8gdW5kZXJzdGFuZCB3aHkgeW91
J3JlIHNvCmFnYWluc3QgdGhpcyBwYXRjaD8KClRoYW5rcywKLUJyaWFuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
