Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AFBDAA41
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 12:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DA86EA45;
	Thu, 17 Oct 2019 10:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10065.outbound.protection.outlook.com [40.107.1.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4EB6EA45
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 10:48:26 +0000 (UTC)
Received: from DB6PR0802CA0038.eurprd08.prod.outlook.com (2603:10a6:4:a3::24)
 by AM6PR08MB4536.eurprd08.prod.outlook.com (2603:10a6:20b:bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Thu, 17 Oct
 2019 10:48:22 +0000
Received: from VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::204) by DB6PR0802CA0038.outlook.office365.com
 (2603:10a6:4:a3::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Thu, 17 Oct 2019 10:48:22 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT052.mail.protection.outlook.com (10.152.19.173) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Thu, 17 Oct 2019 10:48:20 +0000
Received: ("Tessian outbound 0939a6bab6b1:v33");
 Thu, 17 Oct 2019 10:48:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 15e5672419524f75
X-CR-MTA-TID: 64aa7808
Received: from 2c004cea8bcb.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.1.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 81EA1DB6-7CE7-4915-9F28-35F5476F86ED.1; 
 Thu, 17 Oct 2019 10:48:14 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2056.outbound.protection.outlook.com [104.47.1.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2c004cea8bcb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 17 Oct 2019 10:48:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUR4N41EDlxfhuMSPv2vrL9EduXW3L8lgACckjDkkgyC0QLarwgvtcUX16un4UItt5TIyRP81ALBzMgzOd2KuDA14YQJ/4Yq0owOvxsdbrKKkMKojiqW9Ova2t+3H7e5cnmfASnP1KB2EtwjJVOF/1mTJeRtW7yAbAqWLMTkofJ+pTPwiby+bdhQqIUYrDuBiW0RXHoRnajgpbU9qsy6R5pI3AoWn3xquXEsp0tgkhjtt8/5Wf1Vz9qwnJ+w7th4XK6OpBQwWpBrTW4oUAV55r4Njc3PBMDftIH0JtXf03gXID14sCoqlxYHBArQU/I3oZDSC8+JYGnrYkCUcxE3CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hl3sMsX0c+XxnqBP0DW1fAeOGamt9J9H22Xo7e7LUFs=;
 b=f/JQY9+kHR0LaWY9uGrRmNOiLNLH2Q8lrL7g+wRWZEVHF/NiBqfPivlJXzEqMSmoOWyqf1PQMLvdnFIGWdIsYCbLAMFhzls0j3TzCILYWmROWDqlIEnMsvnFjRVZNJpRwPzLH7W2UfCzMjMZyYcSAciPBarbjWDdso8Re6FR3OFlmYjojds/ejL43+t3uENGZ9XLeDzgSFWiDnMDEWoQrimRWfvtbBhYnn2qYeul9AKfeDeRyDOm/lekBN55/yMp8qc2dzXZk+Nuc50W+NeF2xpnHs86kcWU8eeO+R4fxdx8XW9XfhrzJK2aZEOrrkP7Yi2Nv20Hcue4JqRfAJF5Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB4769.eurprd08.prod.outlook.com (10.255.99.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Thu, 17 Oct 2019 10:48:13 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a%5]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 10:48:13 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [RFC,3/3] drm/komeda: Allow non-component drm_bridge only
 endpoints
Thread-Topic: [RFC,3/3] drm/komeda: Allow non-component drm_bridge only
 endpoints
Thread-Index: AQHVhDme1+iX/Utgt0y74txJGijIlKddc0AAgAC0dYCAAFdhgIAAIZ6AgAAHlgA=
Date: Thu, 17 Oct 2019 10:48:12 +0000
Message-ID: <20191017104812.6qpuzoh5bx5i2y3m@DESKTOP-E1NTVVP.localdomain>
References: <20191004143418.53039-4-mihail.atanassov@arm.com>
 <20191009055407.GA3082@jamwan02-TSP300> <5390495.Gzyn2rW8Nj@e123338-lin>
 <20191016162206.u2yo37rtqwou4oep@DESKTOP-E1NTVVP.localdomain>
 <20191017030752.GA3109@jamwan02-TSP300>
 <20191017082043.bpiuvfr3r4jngxtu@DESKTOP-E1NTVVP.localdomain>
 <20191017102055.GA8308@jamwan02-TSP300>
In-Reply-To: <20191017102055.GA8308@jamwan02-TSP300>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.52]
x-clientproxiedby: LO2P265CA0287.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::35) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b9b1802f-3c56-4715-b87f-08d752ef86ae
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM6PR08MB4769:|AM6PR08MB4769:|AM6PR08MB4536:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB45369FDCFB145D9806A60B41F06D0@AM6PR08MB4536.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 01930B2BA8
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(189003)(199004)(6436002)(316002)(76176011)(6486002)(186003)(54906003)(66556008)(66446008)(229853002)(64756008)(66946007)(26005)(66476007)(25786009)(6116002)(52116002)(66066001)(14454004)(478600001)(58126008)(99286004)(3846002)(386003)(6506007)(102836004)(6246003)(9686003)(6512007)(6862004)(14444005)(8676002)(4326008)(71190400001)(86362001)(1076003)(256004)(8936002)(5660300002)(2906002)(71200400001)(6636002)(81156014)(486006)(44832011)(476003)(11346002)(446003)(7736002)(305945005)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4769;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: cVQXy2esuDoVcWYLosK3wSNIXonJm13oxjMRTTNEYLIkFiu5JawqJAtmKGYWSJ/a6R2WdUdBYlSj3ZpRtdve0BFmBDm5nYFrBuRkDSshqWsKKT8LcnWPkPMY+eJzxjZe294XunrGUS7/SZZBvJkD4RQlfHjlAuzj+iRbYaS0GjS2713JIA5vzFMS8EWQHB2zsHx1D/EBfMLqKwGU0WSvQLDYnjg4R2YA7tQyYdL1QLPAk3Oph4tLgs7d7L12orfbqzhY8e+Io0h5fcRUVbkHnaVu1d0037iL3UGQsrOh74o6aTwvFgfakNLnaKGOExlwE7isHpSSznloealRVfzX9NeGyrX3veIRlPD8OT03qpVjAtU++w/DcR59wrVY4lGSqm/1sJRGIDa9sYlheHttVBlB/rxuuGJ85xY9aaH1dFc=
Content-ID: <992E23AC5D263B4886484E3F786F8871@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4769
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(189003)(199004)(6246003)(76176011)(107886003)(356004)(229853002)(70586007)(6116002)(5660300002)(6636002)(7736002)(4326008)(26826003)(478600001)(3846002)(6506007)(81156014)(36906005)(2906002)(26005)(70206006)(102836004)(97756001)(6862004)(8676002)(186003)(81166006)(99286004)(23726003)(8936002)(386003)(8746002)(1076003)(25786009)(76130400001)(14454004)(50466002)(126002)(316002)(86362001)(58126008)(47776003)(63350400001)(9686003)(446003)(6512007)(336012)(14444005)(66066001)(305945005)(486006)(11346002)(476003)(54906003)(22756006)(46406003)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4536;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: ac3aacb7-a725-4acc-caaa-08d752ef8200
NoDisclaimer: True
X-Forefront-PRVS: 01930B2BA8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y+00wDQoNrezcPwqWD6EF7Tv+3ivFlAfCm/p0E1Hnli3kYmOXff4axe5tInBbkzGY3HmbEjBiyKQjrx1veb0TFyxbdCuTujsAcN41YF3o6NzvQ+LnxFShb0J1KmfR1UKu1IyHoxIReDZD/vdlaWjib7dApWvIEx0108Idc269nDztl5GOg3Fpz+3eXDryINSGrWcI5xIVxXPKR18ELeh2aOcjuHCi5pGI3JmWnII+9i2YAM9oRIXWRJUfdYXljshcsUADbDy/CHxERiKgEmVxstBhDfKdPNb5vfL+sBb8wVUgoj75rZo8fxwVQSLuCPgL/3mykfjrr6FaLHaDyuIGAniCytUuXQby+GI6m5c9LNgCRU3Ze/kp4pHWYv33MXRac3paS5BQwh+3DrAGHEv+Psk8aFe4KYq9R+I5Wy3uBU=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 10:48:20.5082 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b1802f-3c56-4715-b87f-08d752ef86ae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4536
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hl3sMsX0c+XxnqBP0DW1fAeOGamt9J9H22Xo7e7LUFs=;
 b=qhS9Cg+ru0VhuqvfEL3cbiVyxjoo3V7/gbh0rRlky/xMKH7SRKflhfsimaVc8+b9Mw/dUEGUi6/qh9U3dxiqiVauVxVeLXwb7dj0c4YYfdotQu5nHbuoedBA8bWog3+wGhws4NB0dP/sOfix72FzphUqY149xmBCiXCwXqLQn9Q=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hl3sMsX0c+XxnqBP0DW1fAeOGamt9J9H22Xo7e7LUFs=;
 b=qhS9Cg+ru0VhuqvfEL3cbiVyxjoo3V7/gbh0rRlky/xMKH7SRKflhfsimaVc8+b9Mw/dUEGUi6/qh9U3dxiqiVauVxVeLXwb7dj0c4YYfdotQu5nHbuoedBA8bWog3+wGhws4NB0dP/sOfix72FzphUqY149xmBCiXCwXqLQn9Q=
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

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTA6MjE6MDNBTSArMDAwMCwgamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gT24gVGh1LCBPY3QgMTcsIDIwMTkgYXQg
MDg6MjA6NTZBTSArMDAwMCwgQnJpYW4gU3RhcmtleSB3cm90ZToKPiA+IE9uIFRodSwgT2N0IDE3
LCAyMDE5IGF0IDAzOjA3OjU5QU0gKzAwMDAsIGphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xv
Z3kgQ2hpbmEpIHdyb3RlOgo+ID4gPiBPbiBXZWQsIE9jdCAxNiwgMjAxOSBhdCAwNDoyMjowN1BN
ICswMDAwLCBCcmlhbiBTdGFya2V5IHdyb3RlOgo+ID4gPiA+IAo+ID4gPiA+IElmIEphbWVzIGlz
IHN0cm9uZ2x5IGFnYWluc3QgbWVyZ2luZyB0aGlzLCBtYXliZSB3ZSBqdXN0IHN3YXAKPiA+ID4g
PiB3aG9sZXNhbGUgdG8gYnJpZGdlPyBCdXQgZm9yIG1lLCB0aGUgcHJhZ21hdGljIGFwcHJvYWNo
IHdvdWxkIGJlIHRoaXMKPiA+ID4gPiBzdG9wLWdhcC4KPiA+ID4gPgo+ID4gPiAKPiA+ID4gVGhp
cyBpcyBhIGdvb2QgaWRlYSwgYW5kIEkgdm90ZSArVUxPTkdfTUFYIDopCj4gPiA+IAo+ID4gPiBh
bmQgSSBhbHNvIGNoZWNrZWQgdGRhOTk4eCBkcml2ZXIsIGl0IHN1cHBvcnRzIGJyaWRnZS4gc28g
c3dhcCB0aGUKPiA+ID4gd2hvbGVzYWxlIHRvIGJyaWdlIGlzIHBlcmZlY3QuIDopCj4gPiA+IAo+
ID4gCj4gPiBXZWxsLCBhcyBNaWhhaWwgd3JvdGUsIGl0J3MgZGVmaW5pdGVseSBub3QgcGVyZmVj
dC4KPiA+IAo+ID4gVG9kYXksIGlmIHlvdSBybW1vZCB0ZGE5OTh4IHdpdGggdGhlIERQVSBkcml2
ZXIgc3RpbGwgbG9hZGVkLAo+ID4gZXZlcnl0aGluZyB3aWxsIGJlIHVuYm91bmQgZ3JhY2VmdWxs
eS4KPiA+IAo+ID4gSWYgd2Ugc3dhcCB0byBicmlkZ2UsIHRoZW4gcm1tb2QnaW5nIHRkYTk5OHgg
KG9yIGFueSBvdGhlciBicmlkZ2UKPiA+IGRyaXZlciB0aGUgRFBVIGlzIHVzaW5nKSB3aXRoIHRo
ZSBEUFUgZHJpdmVyIHN0aWxsIGxvYWRlZCB3aWxsIHJlc3VsdAo+ID4gaW4gYSBjcmFzaC4KPiAK
PiBJIGhhdmVuJ3QgcmVhZCB0aGUgYnJpZGdlIGNvZGUsIGJ1dCBzZWVtcyB0aGlzIGlzIGEgYnVn
IG9mIGRybV9icmlkZ2UsCj4gc2luY2UgaWYgdGhlIGJyaWRnZSBpcyBzdGlsbCBpbiB1c2luZyBi
eSBvdGhlcnMsIHRoZSBybW1vZCBzaG91bGQgZmFpbAo+IAoKQ29ycmVjdCwgYnV0IHRoZXJlJ3Mg
bm8gZml4IGZvciB0aGF0IHRvZGF5LiBZb3UgY2FuIGFsc28gdGFrZSBhIGxvb2sKYXQgdGhlIHRo
cmVhZCBsaW5rZWQgZnJvbSBNaWhhaWwncyBjb3ZlciBsZXR0ZXIuCgo+IEFuZCBwZXJzb25hbGx5
IG9waW5pb24sIGlmIHRoZSBicmlkZ2UgZG9lc24ndCBoYW5kbGUgdGhlIGRlcGVuZGVuY2UuCj4g
Zm9yIHVzOgo+IAo+IC0gYWRkIHN1Y2ggc3VwcG9ydCB0byBicmlkZ2UKClRoYXQgd291bGQgY2Vy
dGFpbmx5IGJlIGhlbHBmdWwuIEkgZG9uJ3Qga25vdyBpZiB0aGVyZSdzIGNvbnNlbnN1cyBvbgpo
b3cgdG8gZG8gdGhhdC4KCj4gICBvcgo+IC0ganVzdCBkbyB0aGUgaW5zbW9kL3JtbW9kIGluIGNv
cnJlY3Qgb3JkZXIuCj4gCj4gPiBTbywgdGhlcmUgcmVhbGx5IGFyZSBwcm9wZXIgYmVuZWZpdHMg
dG8gc3RpY2tpbmcgd2l0aCB0aGUgY29tcG9uZW50Cj4gPiBjb2RlIGZvciB0ZGE5OTh4LCB3aGlj
aCBpcyB3aHkgSSdkIGxpa2UgdG8gdW5kZXJzdGFuZCB3aHkgeW91J3JlIHNvCj4gPiBhZ2FpbnN0
IHRoaXMgcGF0Y2g/Cj4gPgo+IAo+IFRoaXMgY2hhbmdlIGhhbmRsZXMgdHdvIGRpZmZlcmVudCBj
b25uZWN0b3JzIGluIGtvbWVkYSBpbnRlcm5hbGx5LCBjb21wYXJlCj4gd2l0aCBvbmUgaW50ZXJm
YWNlLCBpdCBpbmNyZWFzZXMgdGhlIGNvbXBsZXhpdHksIG1vcmUgcmlzayBvZiBidWcgYW5kIG1v
cmUKPiBjb3N0IG9mIG1haW50YWluYW5jZS4KPiAKCldlbGwsIGl0J3Mgb25seSBhYm91dCBob3cg
dG8gYmluZCB0aGUgZHJpdmVycyAtIHR3byBkaWZmZXJlbnQgbWV0aG9kcwpvZiBiaW5kaW5nLCBu
b3QgdHdvIGRpZmZlcmVudCBjb25uZWN0b3JzLiBJIHdvdWxkIGFyZ3VlIHRoYXQgY2FycnlpbmcK
b3VyIG91dC1vZi10cmVlIHBhdGNoZXMgdG8gc3VwcG9ydCBib3RoIHBsYXRmb3JtcyBpcyBhIGxh
cmdlcgptYWludGVuYW5jZSBidXJkZW4uCgpIb25lc3RseSB0aGlzIGxvb2tzIGxpa2UgYSB3aW4t
d2luIHRvIG1lLiBXZSBnZXQgdGhlIHN1cGVyaW9yIGFwcHJvYWNoCndoZW4gaXRzIHN1cHBvcnRl
ZCwgYW5kIHN0aWxsIGdldCB0byBzdXBwb3J0IGJyaWRnZXMgd2hpY2ggYXJlIG1vcmUKY29tbW9u
LgoKQXMvd2hlbiBpbXByb3ZlbWVudHMgYXJlIG1hZGUgdG8gdGhlIGJyaWRnZSBjb2RlIHdlIGNh
biByZW1vdmUgdGhlCmNvbXBvbmVudCBiaXRzIGFuZCBub3QgbG9zZSBhbnl0aGluZy4KCj4gU28g
bXkgc3VnZ2VzdGlvbiBpcyBrZWVwaW5nIG9uIG9uZSBzaW5nbGUgaW50ZXJmYWNlIGluIGtvbWVk
YSwgbm8KPiBtYXR0ZXIgaXQgaXMgYnJpZGdlIG9yIGNvbXBvbmVudCwgYnV0IEknZCBsaWtlIGl0
IG9ubHkgb25lLCBidXQgbm90Cj4gdGhlbSBib3RoIGluIGtvbWVkYS4KCklmIHdlIGNhbiBwdXQg
dGhlIGVmZm9ydCBpbnRvIGZpeGluZyBicmlkZ2VzIHRoZW4gSSBndWVzcyB0aGF0J3MgdGhlCmJl
c3QgYXBwcm9hY2ggZm9yIGV2ZXJ5b25lIDotKSBNaWdodCBub3QgYmUgZWFzeSB0aG91Z2ghCgot
QnJpYW4KCj4gCj4gVGhhbmtzCj4gSmFtZXMKPiAKPiA+IFRoYW5rcywKPiA+IC1CcmlhbgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
