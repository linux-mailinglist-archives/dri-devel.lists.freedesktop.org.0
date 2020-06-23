Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CF0204EEB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 12:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B326E137;
	Tue, 23 Jun 2020 10:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2076.outbound.protection.outlook.com [40.107.20.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452F06E137
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 10:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qb5iC21Vd0cBtAyaIv7jxaj5gCKTZTJ/z+UwVOq3pAs=;
 b=HH6Uu4+Sv2pA7HAqAbGAcsa9pPRGmyLC+oZA3DSsKm37PVTvQcKJ0SXoUDzuvVB06RmPQeY9iV7g5uujEcH20nfOCC5oVAjSLFDzaMmiyXlbluGxrPArrfW+hd0iiFtxw3WnKLvxzeYjnomgEUBt13dQQ+H3gQVotXZtTJQ5IBg=
Received: from DB8PR04CA0029.eurprd04.prod.outlook.com (2603:10a6:10:110::39)
 by DB7PR08MB3594.eurprd08.prod.outlook.com (2603:10a6:10:4e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Tue, 23 Jun
 2020 10:18:32 +0000
Received: from DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::8b) by DB8PR04CA0029.outlook.office365.com
 (2603:10a6:10:110::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Tue, 23 Jun 2020 10:18:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT059.mail.protection.outlook.com (10.152.21.175) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Tue, 23 Jun 2020 10:18:32 +0000
Received: ("Tessian outbound 839770a6d413:v59");
 Tue, 23 Jun 2020 10:18:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3cb550fa096f7f4d
X-CR-MTA-TID: 64aa7808
Received: from 9970e61ab3a9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 200D6390-2A36-4674-A7D8-FD954EFBC371.1; 
 Tue, 23 Jun 2020 10:18:26 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9970e61ab3a9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 Jun 2020 10:18:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6JEBjTfcF4b8qbGNBZKcI7Jv0C3CSdp3X3UppM2U/SRqmCBHeFv8ozCBe5zj+5mvH0VIFfZtv1WNr4z1Hsgcs096QvdtDrAie/vOfW71IPL/yTtaCYxO29lvoQv8pKwO4El5ptSYj7Uf1tNVsoDQ1OCiUC3YeX4H/5yBK9i3fCV/sQSGWWuUdcDNyQ2XUDfLHCBFUpArzJsskgdTlX2oVbCMx8yAV6YxLbzC9TEImQDzL1+KM7qFV0CLDM7Ta4mq7vBaJ6d9bGHXXbf6t9mRI6ibZweYAAGl+YzOJrkT/ts79HYA0cVf6YPaFQ6IRBCSQu5PtidnBJsKngFzSpbTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qb5iC21Vd0cBtAyaIv7jxaj5gCKTZTJ/z+UwVOq3pAs=;
 b=SdQVgGR3/UOpg9MXDvKd69sXwpznLh8YjnqHoaLm20/Oa3aKKZ5QK3l+2owy7VBPutDN/HcMJMcLJQ/0eeBQz9lrMge3ec4AmX3MkjfgL46TOxP4hSkG/On/KWhNKVWbbEwqFX4+0BzQcX0N/cWGdPdJw4xGEZu/SWCfwA5GFYzGqm0Iq69D35q5ynAvfHyp7aaqYlMezTsAJQ/h0DopjCQhoUclwsHhoGFoFMpZR06XZRwd8m7Zhi7SF37eyRBSuYGsOIak+lZBY5bRs3itnIkICBKylPYvNamXsSyQ3M5yutuR2vFwVY4yI4tcFc2ugWySwe3McVAVcEQF1xcqiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qb5iC21Vd0cBtAyaIv7jxaj5gCKTZTJ/z+UwVOq3pAs=;
 b=HH6Uu4+Sv2pA7HAqAbGAcsa9pPRGmyLC+oZA3DSsKm37PVTvQcKJ0SXoUDzuvVB06RmPQeY9iV7g5uujEcH20nfOCC5oVAjSLFDzaMmiyXlbluGxrPArrfW+hd0iiFtxw3WnKLvxzeYjnomgEUBt13dQQ+H3gQVotXZtTJQ5IBg=
Authentication-Results-Original: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=arm.com;
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com (2603:10a6:7:36::11) by
 HE1PR08MB2633.eurprd08.prod.outlook.com (2603:10a6:7:37::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.25; Tue, 23 Jun 2020 10:18:15 +0000
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::18de:2773:77b4:4ce2]) by HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::18de:2773:77b4:4ce2%7]) with mapi id 15.20.3109.027; Tue, 23 Jun 2020
 10:18:15 +0000
Date: Tue, 23 Jun 2020 11:18:13 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v4] drm/fourcc: document modifier uniqueness requirements
Message-ID: <20200623101813.gpxzj4x2luxndia6@DESKTOP-E1NTVVP.localdomain>
References: <vlSGwy1E6HtqHtZVsFs1gEiN4t9ofmU-YtyumzN0U0DjbusaQj7C3pTFcd0uI9oN_zMCkh0Wb7FxqK6RGtFgGXwHXflBG6bEE-DvjB1vuAI=@emersion.fr>
 <20200619123934.m6mul3sul5rvumfh@DESKTOP-E1NTVVP.localdomain>
 <20200619163617.GU20149@phenom.ffwll.local>
 <20200622102051.ltixr7wchk7npscf@DESKTOP-E1NTVVP.localdomain>
 <20200623084551.GI20149@phenom.ffwll.local>
Content-Disposition: inline
In-Reply-To: <20200623084551.GI20149@phenom.ffwll.local>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: LO2P265CA0459.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::15) To HE1PR08MB2890.eurprd08.prod.outlook.com
 (2603:10a6:7:36::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (82.1.208.173) by
 LO2P265CA0459.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a2::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.21 via Frontend Transport; Tue, 23 Jun 2020 10:18:14 +0000
X-Originating-IP: [82.1.208.173]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 13e71d30-c080-4b25-e9c3-08d8175ec7ed
X-MS-TrafficTypeDiagnostic: HE1PR08MB2633:|DB7PR08MB3594:
X-Microsoft-Antispam-PRVS: <DB7PR08MB359461D7E3E1C716B5ACED04F0940@DB7PR08MB3594.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-Forefront-PRVS: 04433051BF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: C+wAnSFBbFa6+YYzKiSC4AFBvHZIhBt5mearrFanCmmxJJ23K39rHwmU8YZ0hC6W1Qdorh8eWNX48Qp/Wryab9+3tDAU+s7cGoJokDOMVCKnmyv5olgpwbtS8Wpm9CWtlmvyO3bE6M1cZ6iw/zMa3ZbibnP/4eDxgCldKFp+XOhU84QxJnn9sBtKGiMYKfssZe0qDWwxmj2jnK3mMyeIGDAoXOdRFvA2yF8Oud9Fg+66SHJGKBDLYH/4rHYZyOG1rmleii5u8YE02+tjAgS0MTYpHJPTQ+TwTsILUH6NFpAtwSEZs2ij/EW5AEo//GKzy6F8uZ4J9vD3rmQYTfCircMhRjil7TcQsWgB/S6C8FoGa5aAGRL3iS+MvqSLdVgBlWnvTxv0o7f8zJ66i4yNyA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HE1PR08MB2890.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(6506007)(83080400001)(5660300002)(83380400001)(2906002)(44832011)(66476007)(66946007)(66556008)(956004)(7416002)(966005)(86362001)(478600001)(186003)(1076003)(26005)(16526019)(316002)(6916009)(8936002)(9686003)(8676002)(55016002)(66574015)(4326008)(7696005)(52116002)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: P3gbapKDBo4ZMUORKcudE+TeuKXZaGX8kZD5to3TxcTeDkYtCKvQC1E0BuyHmBuPEU8s01h7u1kit6IbADoDAMUzm/mGDRa0AAEyXQAr0Xdh7AmNeznO9AofCiHJr++HS+WccMQIL3hwl+DC/qnAeihq+SVgY7KD0NZ8gq+2/dSaKiU9ulrz0XVhJ2Bq2uD4eJwVVQ+VSe0cALfrxesYNu54IOnA55q8ZaXEtLnDqvf8Yhmi/2QjygkHsNiuPdrKGa5vlj+iK8pFGt1yyaP9eUiLkEDnRETX8+HZXT3Ta4rvm26jONnerBFELDfOpbTQHv96JES4frVKngQ62FhzB2TszhZCl3EvZp63CSS1huzcvrZlOCISKWK/hMLZYW7MbnoPJkhDIWapD90kTJwAP2nGIg0YtpNKSKCcH8P6/kLA61QKFqr10Q2Gr6mMtcC2ap1VIRb2fyIVnQ4oa+beqzXU6F6M3JHh9pdo2p1t6pc=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2633
Original-Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(46966005)(82740400003)(70206006)(956004)(81166007)(83080400001)(5660300002)(8936002)(54906003)(1076003)(2906002)(4326008)(6862004)(336012)(83380400001)(55016002)(70586007)(9686003)(8676002)(47076004)(16526019)(478600001)(966005)(82310400002)(44832011)(186003)(66574015)(86362001)(7696005)(26005)(356005)(6506007)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: b66b3480-07d0-4058-7d28-08d8175ebda2
X-Forefront-PRVS: 04433051BF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WRozcWDt2i7mG11imZXlrUluQwk46HpYKeJ/QeOh++FJzCVIQQ0DQGKEOIszCUkE6eK4q6aUkcO9LKqgcP9Phy7Y+EmCkihJ25uQ5oVkOXluGMNawB6tGoi+veOM7TZ7pOoxptF46zwN2b/syIENukqXBZqiUxEVolTskSISQXe4VBd20Dmwte/4hYahM+U6hPGcTsbdTbWeVLJ8cIpH7IhPksa3PyG8xsGQNu+oALwyu8PwOOuvSGO6sya7rS5DX092WSyVG6QsfVaoG6HiU3a8pcKfI98+4p7PxUg6KfRpesth+MzVFAZPPT/0uNPMZQ6x5lN2ePOHbuaRqO8LneBMpd2wOhgkDRVAUSr5Ajb7iPs8O4KluHu2i1/nld5L2MFL551UKQSG1OvJ8ALl710H2Y1BfqJZxlonBnjLZJ/YgyE6iGbvjTNKM1B2NtGS5Disrw+WK9o0Sb432rCB6iWST78+S14hTJ6y35+Ay5I=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2020 10:18:32.1477 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e71d30-c080-4b25-e9c3-08d8175ec7ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3594
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nd@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjMsIDIwMjAgYXQgMTA6NDU6NTFBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBNb24sIEp1biAyMiwgMjAyMCBhdCAxMToyMDo1MUFNICswMTAwLCBCcmlhbiBT
dGFya2V5IHdyb3RlOgo+ID4gT24gRnJpLCBKdW4gMTksIDIwMjAgYXQgMDY6MzY6MTdQTSArMDIw
MCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4gT24gRnJpLCBKdW4gMTksIDIwMjAgYXQgMDE6
Mzk6MzRQTSArMDEwMCwgQnJpYW4gU3RhcmtleSB3cm90ZToKPiA+ID4gPiBIaSBTaW1vbiwKPiA+
ID4gPiAKPiA+ID4gPiBPbiBGcmksIEp1biAxOSwgMjAyMCBhdCAxMToxMjoyNUFNICswMDAwLCBT
aW1vbiBTZXIgd3JvdGU6Cj4gPiA+ID4gPiBUaGVyZSBoYXZlIHN1Z2dlc3Rpb25zIHRvIGJha2Ug
cGl0Y2ggYWxpZ25tZW50LCBhZGRyZXNzIGFsaWduZW1lbnQsCj4gPiA+ID4gPiBjb250aWd1b3Vz
IG1lbW9yeSBvciBvdGhlciBwbGFjZW1lbnQgKGhpZGRlbiBWUkFNLCBHVFQvQkFSLCBldGMpCj4g
PiA+ID4gPiBjb25zdHJhaW50cyBpbnRvIG1vZGlmaWVycy4gTGFzdCB0aW1lIHRoaXMgd2FzIGJy
b3VnaHQgdXAgaXQgc2VlbWVkCj4gPiA+ID4gPiBsaWtlIHRoZSBjb25zZW5zdXMgd2FzIHRvIG5v
dCBhbGxvdyB0aGlzLiBEb2N1bWVudCB0aGlzIGluIGRybV9mb3VyY2MuaC4KPiA+ID4gPiA+IAo+
ID4gPiA+ID4gVGhlcmUgYXJlIHNldmVyYWwgcmVhc29ucyBmb3IgdGhpcy4KPiA+ID4gPiA+IAo+
ID4gPiA+ID4gLSBFbmNvZGluZyBhbGwgb2YgdGhlc2UgY29uc3RyYWludHMgaW4gdGhlIG1vZGlm
aWVycyB3b3VsZCBleHBsb2RlIHRoZQo+ID4gPiA+ID4gICBzZWFyY2ggc3BhY2UgcHJldHR5IHF1
aWNrbHkgKHdlIG9ubHkgaGF2ZSA2NCBiaXRzIHRvIHdvcmsgd2l0aCkuCj4gPiA+ID4gPiAtIE1v
ZGlmaWVycyBuZWVkIHRvIGJlIHVuYW1iaWd1b3VzOiBhIGJ1ZmZlciBjYW4gb25seSBoYXZlIGEg
c2luZ2xlCj4gPiA+ID4gPiAgIG1vZGlmaWVyLgo+ID4gPiA+ID4gLSBNb2RpZmllciB1c2VycyBh
cmVuJ3QgZXhwZWN0ZWQgdG8gcGFyc2UgbW9kaWZpZXJzIChleGNlcHQgZHJpdmVycykuCj4gPiA+
ID4gPiAKPiA+ID4gPiA+IHYyOiBhZGQgcGFyYWdyYXBoIGFib3V0IGFsaWFzZXMgKERhbmllbCkK
PiA+ID4gPiA+IAo+ID4gPiA+ID4gdjM6IGZpeCB1bnJlbGF0ZWQgY2hhbmdlcyBzZW50IHdpdGgg
dGhlIHBhdGNoCj4gPiA+ID4gPiAKPiA+ID4gPiA+IHY0OiBkaXNhbWJpZ3VhdGUgdXNlcnMgYmV0
d2VlbiBkcml2ZXIgYW5kIGhpZ2hlci1sZXZlbCBwcm9ncmFtcyAoQnJpYW4sCj4gPiA+ID4gPiBE
YW5pZWwpCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFNpbW9uIFNlciA8Y29u
dGFjdEBlbWVyc2lvbi5mcj4KPiA+ID4gPiA+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+ID4gPiA+ID4gQ2M6IERhbmllbCBTdG9uZSA8ZGFuaWVs
QGZvb2lzaGJhci5vcmc+Cj4gPiA+ID4gPiBDYzogQmFzIE5pZXV3ZW5odWl6ZW4gPGJhc0BiYXNu
aWV1d2VuaHVpemVuLm5sPgo+ID4gPiA+ID4gQ2M6IERhdmUgQWlybGllIDxhaXJsaWVkQGdtYWls
LmNvbT4KPiA+ID4gPiA+IENjOiBNYXJlayBPbMWhw6FrIDxtYXJhZW9AZ21haWwuY29tPgo+ID4g
PiA+ID4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPgo+ID4gPiA+ID4g
Q2M6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPiA+ID4gPiA+IENj
OiBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRhZW56ZXIubmV0Pgo+ID4gPiA+ID4gQ2M6IEJyaWFu
IFN0YXJrZXkgPGJyaWFuLnN0YXJrZXlAYXJtLmNvbT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4g
IGluY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIHwgMjIgKysrKysrKysrKysrKysrKysrKysr
Kwo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCj4gPiA+ID4gPiAK
PiA+ID4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaCBiL2lu
Y2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4gPiA+ID4gPiBpbmRleCA0OTAxNDM1MDBhNTAu
LjRkM2Y4MTlkY2EwYiAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJt
X2ZvdXJjYy5oCj4gPiA+ID4gPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+
ID4gPiA+ID4gQEAgLTU4LDYgKzU4LDI4IEBAIGV4dGVybiAiQyIgewo+ID4gPiA+ID4gICAqIG1h
eSBwcmVzZXJ2ZSBtZWFuaW5nIC0gc3VjaCBhcyBudW1iZXIgb2YgcGxhbmVzIC0gZnJvbSB0aGUg
Zm91cmNjIGNvZGUsCj4gPiA+ID4gPiAgICogd2hlcmVhcyBvdGhlcnMgbWF5IG5vdC4KPiA+ID4g
PiA+ICAgKgo+ID4gPiA+ID4gKyAqIE1vZGlmaWVycyBtdXN0IHVuaXF1ZWx5IGVuY29kZSBidWZm
ZXIgbGF5b3V0LiBJbiBvdGhlciB3b3JkcywgYSBidWZmZXIgbXVzdAo+ID4gPiA+ID4gKyAqIG1h
dGNoIG9ubHkgYSBzaW5nbGUgbW9kaWZpZXIuIEEgbW9kaWZpZXIgbXVzdCBub3QgYmUgYSBzdWJz
ZXQgb2YgbGF5b3V0cyBvZgo+ID4gPiA+ID4gKyAqIGFub3RoZXIgbW9kaWZpZXIuIEZvciBpbnN0
YW5jZSwgaXQncyBpbmNvcnJlY3QgdG8gZW5jb2RlIHBpdGNoIGFsaWdubWVudCBpbgo+ID4gPiA+
ID4gKyAqIGEgbW9kaWZpZXI6IGEgYnVmZmVyIG1heSBtYXRjaCBhIDY0LXBpeGVsIGFsaWduZWQg
bW9kaWZpZXIgYW5kIGEgMzItcGl4ZWwKPiA+ID4gPiA+ICsgKiBhbGlnbmVkIG1vZGlmaWVyLiBU
aGF0IHNhaWQsIG1vZGlmaWVycyBjYW4gaGF2ZSBpbXBsaWNpdCBtaW5pbWFsCj4gPiA+ID4gPiAr
ICogcmVxdWlyZW1lbnRzLgo+ID4gPiA+ID4gKyAqCj4gPiA+ID4gPiArICogRm9yIG1vZGlmaWVy
cyB3aGVyZSB0aGUgY29tYmluYXRpb24gb2YgZm91cmNjIGNvZGUgYW5kIG1vZGlmaWVyIGNhbiBh
bGlhcywKPiA+ID4gPiA+ICsgKiBhIGNhbm9uaWNhbCBwYWlyIG5lZWRzIHRvIGJlIGRlZmluZWQg
YW5kIHVzZWQgYnkgYWxsIGRyaXZlcnMuIEFuIGV4YW1wbGUKPiA+ID4gPiA+ICsgKiBpcyBBRkJD
LCB3aGVyZSBib3RoIEFSR0IgYW5kIEFCR1IgaGF2ZSB0aGUgZXhhY3Qgc2FtZSBjb21wcmVzc2Vk
IGxheW91dC4KPiA+ID4gPiAKPiA+ID4gPiBJIHN0aWxsIGRvbid0IGFncmVlIHdpdGggdGhpcyBz
ZW50ZW5jZS4gQVJHQiBhbmQgQUJHUiBoYXZlIGRpZmZlcmVudAo+ID4gPiA+IGNvbXByZXNzZWQg
bGF5b3V0cyBpbiBBRkJDLgo+ID4gPiAKPiA+ID4gSG0gdGhlbiBtYXliZSBJIGdvdCBjb25mdXNl
ZCBmb3IgdGhlIGV4YWN0IHJlYXNvbiB3aHkgYWZiYyBoYXMgZGVmaW5lZAo+ID4gPiBjYW5vbmlj
YWwgZm91cmNjIGNvZGVzIGluIERvY3VtZW50YXRpb24vZ3B1L2FmYmMucnN0PyBUaGV5IGFsbCB1
c2UgdGhlCj4gPiA+IEJHUiB2ZXJzaW9ucywgbm8gUkdCIGFueXdoZXJlIHRvIGJlIGZvdW5kLgo+
ID4gPiAKPiA+ID4gV2hhdCdzIHRoZSByZWFzb24gdGhlbiBiZWhpbmQgdGhlICJGb3JtYXRzIHdo
aWNoIGFyZSBub3QgbGlzdGVkIHNob3VsZCBiZQo+ID4gPiBhdm9pZGVkLiIgaW4gdGhhdCBkb2M/
IFRoYXQncyB0aGUgY2FzZSBJIHdhbnRlZCB0byByZWZlciB0byBoZXJlLgo+ID4gCj4gPiBCYXNp
Y2FsbHkgdGhlcmUncyBoYXJkd2FyZSB3aGljaCBzdXBwb3J0cyBvbmx5IEJHUiwgaGFyZHdhcmUg
d2hpY2gKPiA+ICJpZ25vcmVzIiBzd2l6emxlICh0cmVhdHMgYWxsIGFzIEJHUiksIGFuZCBoYXJk
d2FyZSB3aGljaCBzdXBwb3J0cwo+ID4gYm90aCBCR1IgYW5kIFJHQi4gRXZlbiBhbW9uZ3N0IGZp
cnN0LXBhcnR5IGltcGxlbWVudGF0aW9ucyBpdCdzCj4gPiBpbmNvbnNpc3RlbnQuCj4gPiAKPiA+
IFRoaXMgbGVhZHMgdG8gYSBwb3RlbnRpYWxseSBjb25mdXNpbmcgc2l0dWF0aW9uIHdoZXJlIHNv
bWVvbmUgd2l0aAo+ID4gaGFyZHdhcmUgd2hpY2ggImlnbm9yZXMiIHN3aXp6bGUgYXNzdW1lcyB0
aGF0J3MgYWx3YXlzIHRoZSBjYXNlLgo+ID4gCj4gPiBUbyBhdm9pZCB0aGF0LCB3ZSB3YW50ZWQg
dG8gYmUgZXhwbGljaXQgdGhhdCBvcmRlcmluZyBpcyBpbXBvcnRhbnQ6Cj4gPiAKPiA+ICB8IFRo
ZSBhc3NpZ25tZW50IG9mIGlucHV0L291dHB1dCBjb2xvciBjaGFubmVscyBtdXN0IGJlIGNvbnNp
c3RlbnQKPiA+ICB8IGJldHdlZW4gdGhlIGVuY29kZXIgYW5kIHRoZSBkZWNvZGVyIGZvciBjb3Jy
ZWN0IG9wZXJhdGlvbiwgb3RoZXJ3aXNlCj4gPiAgfCB0aGUgY29uc3VtZXIgd2lsbCBpbnRlcnBy
ZXQgdGhlIGRlY29kZWQgZGF0YSBpbmNvcnJlY3RseS4KPiA+ICB8IC4uLgo+ID4gIHwgVGhlIGNv
bXBvbmVudCBvcmRlcmluZyBpcyBjb21tdW5pY2F0ZWQgdmlhIHRoZSBmb3VyY2MgY29kZSBpbiB0
aGUKPiA+ICB8IGZvdXJjYzptb2RpZmllciBwYWlyLiBJbiBnZW5lcmFsLCBjb21wb25lbnQgJzAn
IGlzIGNvbnNpZGVyZWQgdG8KPiA+ICB8IHJlc2lkZSBpbiB0aGUgbGVhc3Qtc2lnbmlmaWNhbnQg
Yml0cyBvZiB0aGUgY29ycmVzcG9uZGluZyBsaW5lYXIKPiA+ICB8IGZvcm1hdC4gRm9yIGV4YW1w
bGUsIENPTVAoYml0cyk6Cj4gPiAKPiA+IEFuZCwgdG8gdHJ5IGFuZCBlbnN1cmUgYmVzdCBjcm9z
cyBjb21wYXRpYmlsaXR5LCB3ZSB3YW50IEJHUiB0byBiZQo+ID4gdXNlZCBtb3N0IG9mdGVuLiBX
ZSBleHBlY3QgdGhhdCB0byBiZSBzdXBwb3J0ZWQgYnkgdGhlIG1vc3QgaGFyZHdhcmU6Cj4gPiAK
PiA+ICB8IEZvciBtYXhpbXVtIGNvbXBhdGliaWxpdHkgYWNyb3NzIGRldmljZXMsIHRoZSB0YWJs
ZSBiZWxvdyBkZWZpbmVzCj4gPiAgfCBjYW5vbmljYWwgZm9ybWF0cyBmb3IgdXNlIGJldHdlZW4g
QUZCQy1lbmFibGVkIGRldmljZXMuIEZvcm1hdHMgd2hpY2gKPiA+ICB8IGFyZSBsaXN0ZWQgaGVy
ZSBtdXN0IGJlIHVzZWQgZXhhY3RseSBhcyBzcGVjaWZpZWQgd2hlbiB1c2luZyB0aGUgQUZCQwo+
ID4gIHwgbW9kaWZpZXJzLiBGb3JtYXRzIHdoaWNoIGFyZSBub3QgbGlzdGVkIHNob3VsZCBiZSBh
dm9pZGVkLgo+IAo+IE9rLCBzbyBub3Qgc3VjaCBhbiBleGFtcGxlLiBTaW1vbiwgbWF5YmUgd2Ug
Y291bGQgZ28gd2l0aCBzb21ldGhpbmcgbGlrZToKPiAKPiAgKiBGb3IgbW9kaWZpZXJzIHdoZXJl
IHRoZSBjb21iaW5hdGlvbiBvZiBmb3VyY2MgY29kZSBhbmQgbW9kaWZpZXIgY2FuIGFsaWFzLAo+
ICAqIGEgY2Fub25pY2FsIHBhaXIgbmVlZHMgdG8gYmUgZGVmaW5lZCBhbmQgdXNlZCBieSBhbGwg
ZHJpdmVycy4gUHJlZmVycmVkCj4gICogY29tYmluYXRpb25zIGFyZSBhbHNvIGVuY291cmFnZSB3
aGVyZSBhbGwgY29tYmluYXRpb25zIG1pZ2h0Cj4gICogbGVhZCB0byBjb25mdXNpb24gYW5kIHVu
ZWNlc3NhcmlseSByZWR1Y2VkIGludGVyb3BlcmFiaWxpdHkuIEFuIGV4YW1wbGUKPiAgKiBmb3Ig
dGhlIGxhdHRlciBpcyBBRkJDLCB3aGVyZSB0aGUgQUJHUiBsYXlvdXRzIGFyZSBwcmVmZXJyZWQg
b3ZlciBBUkdCCj4gICogbGF5b3V0cy4KPiAKPiBCcmlhbiwgd291bGQgdGhhdCBiZSBjbGVhciBm
cm9tIHlvdXIgc2lkZSB0b28/CgpZZXAsIExHVE0uIFRoYW5rcyEKCj4gCj4gVGhhbmtzLCBEYW5p
ZWwKPiAKPiA+IAo+ID4gQ2hlZXJzLAo+ID4gLUJyaWFuCj4gPiAKPiA+ID4gLURhbmllbAo+ID4g
PiAKPiA+ID4gPiAKPiA+ID4gPiBUaGFua3MsCj4gPiA+ID4gLUJyaWFuCj4gPiA+ID4gCj4gPiA+
ID4gPiArICoKPiA+ID4gPiA+ICsgKiBUaGVyZSBhcmUgdHdvIGtpbmRzIG9mIG1vZGlmaWVyIHVz
ZXJzOgo+ID4gPiA+ID4gKyAqCj4gPiA+ID4gPiArICogLSBLZXJuZWwgYW5kIHVzZXItc3BhY2Ug
ZHJpdmVyczogZm9yIGRyaXZlcnMgaXQncyBpbXBvcnRhbnQgdGhhdCBtb2RpZmllcnMKPiA+ID4g
PiA+ICsgKiAgIGRvbid0IGFsaWFzLCBvdGhlcndpc2UgdHdvIGRyaXZlcnMgbWlnaHQgc3VwcG9y
dCB0aGUgc2FtZSBmb3JtYXQgYnV0IHVzZQo+ID4gPiA+ID4gKyAqICAgZGlmZmVyZW50IGFsaWFz
ZXMsIHByZXZlbnRpbmcgdGhlbSBmcm9tIHNoYXJpbmcgYnVmZmVycyBpbiBhbiBlZmZpY2llbnQK
PiA+ID4gPiA+ICsgKiAgIGZvcm1hdC4KPiA+ID4gPiA+ICsgKiAtIEhpZ2hlci1sZXZlbCBwcm9n
cmFtcyBpbnRlcmZhY2luZyB3aXRoIEtNUy9HQk0vRUdML1Z1bGthbi9ldGM6IHRoZXNlIHVzZXJz
Cj4gPiA+ID4gPiArICogICBzZWUgbW9kaWZpZXJzIGFzIG9wYXF1ZSB0b2tlbnMgdGhleSBjYW4g
Y2hlY2sgZm9yIGVxdWFsaXR5IGFuZCBpbnRlcnNlY3QuCj4gPiA+ID4gPiArICogICBUaGVzZSB1
c2VycyBtdXNuJ3QgbmVlZCB0byBrbm93IHRvIHJlYXNvbiBhYm91dCB0aGUgbW9kaWZpZXIgdmFs
dWUKPiA+ID4gPiA+ICsgKiAgIChpLmUuIHRoZXkgYXJlIG5vdCBleHBlY3RlZCB0byBleHRyYWN0
IGluZm9ybWF0aW9uIG91dCBvZiB0aGUgbW9kaWZpZXIpLgo+ID4gPiA+ID4gKyAqCj4gPiA+ID4g
PiAgICogVmVuZG9ycyBzaG91bGQgZG9jdW1lbnQgdGhlaXIgbW9kaWZpZXIgdXNhZ2UgaW4gYXMg
bXVjaCBkZXRhaWwgYXMKPiA+ID4gPiA+ICAgKiBwb3NzaWJsZSwgdG8gZW5zdXJlIG1heGltdW0g
Y29tcGF0aWJpbGl0eSBhY3Jvc3MgZGV2aWNlcywgZHJpdmVycyBhbmQKPiA+ID4gPiA+ICAgKiBh
cHBsaWNhdGlvbnMuCj4gPiA+ID4gPiAtLSAKPiA+ID4gPiA+IDIuMjcuMAo+ID4gPiA+ID4gCj4g
PiA+ID4gPiAKPiA+ID4gCj4gPiA+IC0tIAo+ID4gPiBEYW5pZWwgVmV0dGVyCj4gPiA+IFNvZnR3
YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+ID4gPiBodHRwOi8vYmxvZy5mZndsbC5j
aAo+IAo+IC0tIAo+IERhbmllbCBWZXR0ZXIKPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KPiBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
