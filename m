Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 889F6D5E55
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 11:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D90C6E172;
	Mon, 14 Oct 2019 09:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00043.outbound.protection.outlook.com [40.107.0.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3456E172
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 09:11:33 +0000 (UTC)
Received: from VI1PR08CA0238.eurprd08.prod.outlook.com (2603:10a6:802:15::47)
 by AM6PR08MB3446.eurprd08.prod.outlook.com (2603:10a6:20b:45::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Mon, 14 Oct
 2019 09:11:29 +0000
Received: from DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::204) by VI1PR08CA0238.outlook.office365.com
 (2603:10a6:802:15::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.21 via Frontend
 Transport; Mon, 14 Oct 2019 09:11:29 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT048.mail.protection.outlook.com (10.152.21.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 14 Oct 2019 09:11:27 +0000
Received: ("Tessian outbound 851a1162fca7:v33");
 Mon, 14 Oct 2019 09:11:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 994d7611a012e7e5
X-CR-MTA-TID: 64aa7808
Received: from e5e1c407e1df.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.0.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6CBB3DE1-F7B3-414A-9C6C-FD4DD896163A.1; 
 Mon, 14 Oct 2019 09:11:19 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e5e1c407e1df.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Oct 2019 09:11:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPIxwD6NXAUu8XAxoNv7wk/JMPrtkt0KYa09HaPLcy6L7ag4xt9JSBYdvY/riCvwRQnEXM1WH6pxjUj4aS+k5gOJlS21qbEkPtpSeXGovI7bHhcRir5eqiYiA7YIyueU8ElYqV4S2TqjpYSCWhbaMDU1WD1PoRJSRDKcxRjAa0N6ugokQGynqdek006IWjDSgm0O48H2AnBbkUSk3O+4uBLzisgbWjj8wbc7R6y0b90ZY46Y23/mbbKuWFPZ+enKfqlO44rmLL2tmmGLMeZyg/aPEmYx8WQBg8zvasdQWIyPyq7hVKCrFjH1iDbV/JSWCSkcYAh7hT7HcxmfM7zfSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/jpIgQFllFyMHQq2H2LhZ1I0vqNckVJ2Zh1zMexvaA=;
 b=KZ65bsmsEoiZdS97Ju6jJvGVQcSJH9aU8uQ0CJarH0QLZN2HYXmIXrXnO3jXytoOtqrfFDiyN+7RniIl75r+cmo1qJj0JeXZzd8gIjaklibZ1ka1FJQIEcs4g3qjcjQfZ6z/qdxVMadrSskQw5RotLeX1miGtBBbE4VjRMP3+k24V2HL/fze9VPRsO4V2nZ+wGIFnUGmZvN9OroacrmsWPYfUS/2GDlXn6i5LBlGFaJ45Md4ac/2g8/lJaQLeewvViBVEvAoYq2sEyYNEIJc0N7aqaNHxxkKU8AFW+okbRsd8jpWtSFvW8P6fJIG4RMwpM9qv1Ds3BqtFOM75Z4B9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB4899.eurprd08.prod.outlook.com (10.255.99.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Mon, 14 Oct 2019 09:11:17 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a%5]) with mapi id 15.20.2347.023; Mon, 14 Oct 2019
 09:11:17 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 4/7] drm/meson: plane: add support for AFBC mode for OSD1
 plane
Thread-Topic: [PATCH 4/7] drm/meson: plane: add support for AFBC mode for OSD1
 plane
Thread-Index: AQHVgA+hW0YpyPd1Sk22upjR9Lo04KdVKIOAgAAcS4CAAGyzAIAELQwA
Date: Mon, 14 Oct 2019 09:11:17 +0000
Message-ID: <20191014091118.jfa7xxh2e7kxu4ff@DESKTOP-E1NTVVP.localdomain>
References: <20191010092526.10419-1-narmstrong@baylibre.com>
 <20191010092526.10419-5-narmstrong@baylibre.com>
 <20191010132601.GA10110@arm.com>
 <44f1771f-d640-f23d-995f-7bfcadd213bc@baylibre.com>
 <20191011084108.i7lfh2d7asfmcdk4@DESKTOP-E1NTVVP.localdomain>
 <c9d4f840-a3da-0f40-3a1c-c4aa522daf0f@baylibre.com>
 <20191011105559.clttghy52wfdmb34@DESKTOP-E1NTVVP.localdomain>
 <CAKMK7uHEWQiXYE7RE7TffHEHMys=LTYcNeK+iAX3qiS-c2PNjQ@mail.gmail.com>
In-Reply-To: <CAKMK7uHEWQiXYE7RE7TffHEHMys=LTYcNeK+iAX3qiS-c2PNjQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0157.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::25) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2c0be8bc-d4d7-4af8-5f26-08d750867eab
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM6PR08MB4899:|AM6PR08MB4899:|AM6PR08MB3446:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3446ABC69E7BD3341F748868F0900@AM6PR08MB3446.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 01901B3451
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(199004)(189003)(305945005)(7736002)(6436002)(11346002)(71200400001)(26005)(6916009)(186003)(9686003)(71190400001)(53546011)(6506007)(386003)(6246003)(102836004)(6512007)(6306002)(966005)(8936002)(2906002)(14454004)(446003)(86362001)(66066001)(66446008)(64756008)(66556008)(66476007)(478600001)(66946007)(4326008)(52116002)(76176011)(486006)(6486002)(256004)(6116002)(99286004)(14444005)(476003)(229853002)(44832011)(3846002)(1076003)(81156014)(81166006)(8676002)(25786009)(54906003)(316002)(58126008)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4899;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: KdODC7451N+wzxHOEjS4r56Sfb4RbICwFa1ouCg1gUq8ugP3WR67rvHbHF5x+/nlzD53IHZukRelMTvOjpacpQjRaCsMOlmi/1ltE9bQQp33sF9aO6NlMigDtx+hGj84em8tXC8WAnmj/1P1cO0QJUu+8lgfvF6dctdvUkb6dy4NWd78IC3TtgBxs7V0CfB3XHenHqusV9vbm2+HrxY4oB51mp3AI8qwVP1NOA7lZf5UdWaSac1gb/G68RPX0uoI8hytisT1w0JjmJTNf7T2BCNB45rBBfYx9AZ/doNeK0HC0DTHdVbSid5zMT9AI6tEbspBb+5bm/AHfpoUI2TXfLfZeV9nJOlXJgcfZIpPcMybVmJHPLMV6f9vgPcLD8cCwmNJBsY+moxfsvnf0ULw1opeQGhvh8+2xikcTVZi44/KeGQ/kKzngL/+wHfaB1AJ1NJzUF15+bRdK6ENETeODw==
Content-ID: <DCDAC56867E76D4CB7A7F109AC081236@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4899
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(136003)(346002)(189003)(199004)(97756001)(11346002)(336012)(63350400001)(446003)(26005)(102836004)(50466002)(53546011)(14444005)(22756006)(386003)(6506007)(186003)(70586007)(76130400001)(70206006)(14454004)(966005)(26826003)(478600001)(66066001)(476003)(47776003)(126002)(486006)(25786009)(2906002)(5660300002)(356004)(46406003)(6862004)(4326008)(86362001)(1076003)(229853002)(6486002)(6246003)(107886003)(6306002)(6512007)(9686003)(54906003)(8676002)(23726003)(316002)(76176011)(7736002)(8936002)(58126008)(99286004)(6116002)(81166006)(8746002)(3846002)(81156014)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3446;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e9d317f3-76f0-4147-5b4e-08d750867875
NoDisclaimer: True
X-Forefront-PRVS: 01901B3451
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uumg68Oh3bMh/EYPCt/gltre0zvl/H5CQg5N/9xq529ccBbXO65PpaU3i7S2PZVnjlOC9/ZrJQvt2GWJcrHH/zv4E15ydNmiAGHzWYrKbrU62nQzgs/qpXKcOsqhfgAW+GyPXzenVYt+Eq+wqpAzq0miuKba2ISXueMkMAK7jgWIL26iQgflobfMdk1bd8d861RqE0r2D0UHBy2FhNc1uUJPQMMrAwcgSPzWu0dQpoKv9jAdIOBtIW0r+y77r68AcrUBblRTAZBk+zqP9RYC9D0oLrPvB0dxw2mTzjW6YR0AoD7NTl5N7N/vV97fKPEJXTDMB/3ZcoTDl+/4h5ktbfIHcGeLqDSiEpxKq6EXBvMdwq9U9I9GIZ+5qGhuzuf2HYzO3qRsk0LB3tgCFCSo+2a4T53WljyNLXOG4Ri+r5uAKDyHle0pTd8NsL8UamZDdEbwXfEc7zWJxY4uTe+UwQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2019 09:11:27.6694 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0be8bc-d4d7-4af8-5f26-08d750867eab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3446
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/jpIgQFllFyMHQq2H2LhZ1I0vqNckVJ2Zh1zMexvaA=;
 b=5QDJLermoxSu10zDZIeb84LfzOdZ28JbrqHqsAKucEE96j4kxoowa1jLyFaLgO5vOd2AS2GdvhE1PmrZANUjWgCy0poPpUOS6mwG8qLsQqb+y8NynkkytU1du0myIVQxEZUJGF+0LsBFvFVx9efnD4fHs0jxO+ItKZfro0ynwg4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/jpIgQFllFyMHQq2H2LhZ1I0vqNckVJ2Zh1zMexvaA=;
 b=5QDJLermoxSu10zDZIeb84LfzOdZ28JbrqHqsAKucEE96j4kxoowa1jLyFaLgO5vOd2AS2GdvhE1PmrZANUjWgCy0poPpUOS6mwG8qLsQqb+y8NynkkytU1du0myIVQxEZUJGF+0LsBFvFVx9efnD4fHs0jxO+ItKZfro0ynwg4=
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
Cc: nd <nd@arm.com>, Neil Armstrong <narmstrong@baylibre.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 Ayan Halder <Ayan.Halder@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMDc6MjU6MDJQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIE9jdCAxMSwgMjAxOSBhdCAxMjo1NiBQTSBCcmlhbiBTdGFya2V5IDxC
cmlhbi5TdGFya2V5QGFybS5jb20+IHdyb3RlOgo+ID4KPiA+IEhpLAo+ID4KPiA+IE9uIEZyaSwg
T2N0IDExLCAyMDE5IGF0IDExOjE0OjQzQU0gKzAyMDAsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+
ID4gPiBIaSBCcmlhbiwKPiA+ID4KPiA+ID4gT24gMTEvMTAvMjAxOSAxMDo0MSwgQnJpYW4gU3Rh
cmtleSB3cm90ZToKPiAKPiA+ID4gPiBBcmUgeW91IHN1cmUgdGhlIEdQVSBzdXBwb3J0cyBvdGhl
ciBvcmRlcnM/IEkgdGhpbmsgYW55IEFybSBkcml2ZXIKPiA+ID4gPiB3aWxsIG9ubHkgYmUgcHJv
ZHVjaW5nIERSTV9GT1JNQVRzIHdpdGggIkJHUiIgb3JkZXIgZS5nLiBBQkdSODg4Pgo+ID4gPiA+
IEknbSBub3QgY29udmluY2VkIHRoZSBHUFUgSFcgYWN0dWFsbHkgc3VwcG9ydHMgYW55IG90aGVy
IG9yZGVyLCBidXQKPiA+ID4gPiBpdCdzIGFsbCByYXRoZXIgY29uZnVzaW5nIHdpdGggdGV4dHVy
ZSBzd2l6emxpbmcuIFdoYXQgSSBjYW4gdGVsbCB5b3UKPiA+ID4gPiBmb3Igc3VyZSBpcyB0aGF0
IGl0IF9kb2VzXyBzdXBwb3J0IEJHUiBvcmRlciAoaW4gRFJNIG5hbWluZwo+ID4gPiA+IGNvbnZl
bnRpb24pLgo+ID4gPgo+ID4gPiBXZWxsLCBzaW5jZSB0aGUgQmlmcm9zdCBNYWxpIGJsb2JzIGFy
ZSBjbG9zZWQtc291cmNlIGFuZCBkZWxpdmVyZWQKPiA+ID4gYnkgbGljZW5zZWVzLCBpdCdzIGhh
cmQgdG8gZGVmaW5lIHdoYXQgaXMgc3VwcG9ydGVkIGZyb20gYSBjbG9zZWQKPiA+ID4gR1BVIEhX
LCBjbG9zZWQgU1cgaW1wbGVtZW50YXRpb24gdG8gYSBjbG9zZWQgcGl4ZWwgZm9ybWF0IGltcGxl
bWVudGF0aW9uLgo+ID4gPgo+ID4KPiA+IEkgaGVhciB5b3UuIElNTyB0aGUgb25seSB3YXkgdG8g
bWFrZSBhbnkgb2YgdGhpcyBjbGVhciBpcyB0byBwdWJsaXNoCj4gPiByZWZlcmVuY2UgZGF0YSBh
bmQgdGVzdHMgd2hpY2ggbWFrZSBzdXJlIGltcGxlbWVudGF0aW9ucyBtYXRjaCBlYWNoCj4gPiBv
dGhlci4gSXQncyBzb21ldGhpbmcgSSdtIHRyeWluZyB0byBtYWtlIGhhcHBlbi4KPiAKPiAqY291
Z2gqIGlndCB0ZXN0IHdpdGggY3JjL3dyaXRlYmFjayB2YWxpZGF0aW9uICpjb3VnaCoKPiAKPiBB
bmQgeW91IGRvbid0IGV2ZW4gbmVlZCBhbnl0aGluZyB0aGF0IGFjdHVhbGx5IGNvbXByZXNzZXMu
IEFsbCB5b3UKPiBuZWVkIGlzIHRoZSBtaW5pbWFsIGVub3VnaCBBRkJDIGtub3dsZWRnZSB0byBz
ZXQgdXAgdGhlIG1ldGFkYXRhIHRoYXQKPiBldmVyeXRoaW5nIGlzIHVuY29tcHJlc3NlZC4gV2Un
cmUgZG9pbmcgdGhhdCBmb3Igb3VyIGludGVsIGNvbXByZXNzaW9uCj4gZm9ybWF0cyBhbHJlYWR5
LCBhbmQgaXQgd29ya3MgZ3JlYXQgaW4gbWFraW5nIHN1cmUgdGhhdCB3ZSBoYXZlCj4gZW5kLXRv
LWVuZCBhZ3JlZW1lbnQgb24gYWxsIHRoZSBiaXRzIGFuZCBvcmRlcmluZyBhbmQgZXZlcnl0aGlu
Zy4KClllYWggdGhpcyB3YXMgbXkgb3JpZ2luYWwgdGhpbmtpbmcgdG9vLiBTYWRseSwgYSBkZWNl
bnQgbnVtYmVyIG9mIHRoZQpBRkJDIHBhcmFtZXRlcnMgY2FuJ3QgYmUgdGVzdGVkIHdpdGggdW5j
b21wcmVzc2VkIGRhdGEsIGFzIHRoZSBjb2RlYwpraWNrcyBpbnRvIGEgZGlmZmVyZW50IG1vZGUg
dGhlcmUuCgo+IE9mYwo+IGl0IGRvZXNuJ3QgdmFsaWRhdGUgdGhlIGRlY29kZXIsIGJ1dCB0aGF0
J3Mgbm90IHJlYWxseSBpZ3RzIGpvYi4KPiBTaG91bGQgYmUgcG9zc2libGUgdG8gY29udmluY2Ug
QVJNIHRvIHJlbGVhc2UgdGhhdCAoYXMgb3BlbiBzb3VyY2UsIGluCj4gaWd0KSwgc2luY2UgaXQg
d291bGQgYmUgZmFpcmx5IHZhbHVhYmxlIGZvciB0aGUgZW50aXJlIGVjb3N5c3RlbSBoZXJlCj4g
Li4uCgpJIGZ1bGx5IGFncmVlIGFib3V0IHRoZSB2YWx1ZSBwcm9wb3NpdGlvbi4KCi1CcmlhbgoK
PiAtRGFuaWVsCj4gCj4gLS0gCj4gRGFuaWVsIFZldHRlcgo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJ
bnRlbCBDb3Jwb3JhdGlvbgo+ICs0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3
bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
