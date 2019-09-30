Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EFCC1F0E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 12:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54706E23F;
	Mon, 30 Sep 2019 10:36:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40077.outbound.protection.outlook.com [40.107.4.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8E56E23F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 10:36:48 +0000 (UTC)
Received: from VI1PR08CA0172.eurprd08.prod.outlook.com (2603:10a6:800:d1::26)
 by AM0PR08MB3300.eurprd08.prod.outlook.com (2603:10a6:208:65::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15; Mon, 30 Sep
 2019 10:36:44 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by VI1PR08CA0172.outlook.office365.com
 (2603:10a6:800:d1::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15 via Frontend
 Transport; Mon, 30 Sep 2019 10:36:44 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 30 Sep 2019 10:36:43 +0000
Received: ("Tessian outbound e4042aced47b:v33");
 Mon, 30 Sep 2019 10:36:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bde6d61795fd5f44
X-CR-MTA-TID: 64aa7808
Received: from ee54bc317598.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.6.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0AC95A4E-366C-4092-888C-25D1C19A9EC0.1; 
 Mon, 30 Sep 2019 10:36:32 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ee54bc317598.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Mon, 30 Sep 2019 10:36:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hNAurmxlNkMWtG8Wy+GwR4noc9Gzu+EDQaeI3WtZJLhOnUpN0yGY7iBn2nlfRr9lCZNQ3XMJTE10h1hp1IiXV0XAFNUjWiWPB05xVNNorpBFKsXRL2UfOR6G4FD8fRtAb2Ro1/cDc/5WDghUAwMHMlk8gzVWk7idLxiRekC3QRW6vSDaC28vcXDK1mifnJc/HdaUUDRlQY6apVstiJ/NlquKZM0W/bPSfiAp2L4hH4yamnrwhA3/RvLN522LHlm1JJwfMoevSFjU6r7pazTz77BGyGHjR+hzLPAGX4Yeuo4N3naKnoIpOvuVgfe97srIcBoJaR7rbNZGLFZCQUOHjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qONRKqBvkt1IpQ+h599hAArEKDB2e2sWBruuLP6md+k=;
 b=jUma4CIANX66t0xmIu+9pBJS1BvTJJ+zUOgf+H0WFOLF8UDFJ5no8RQfjnGxXEWwfcqD8AarSxMVq3U2X8JIoyZyUwHWSzUJqDeMCk6HCukYmI1ZC6Syyc4IH1J1PvPq8EW+J34qt8HFkH321/qaZOOogqUxe+4EGDlBcAjmnqRD2OKT+uqg4s/bmT3dC99LKvIq5+/DSm3Ou5nxnKeGsfc2s5Es8gL4nVMGrVfXxWRkOGJYYFDfq9OjlCkbwYeT5I3pUPYE9WK7e3986cNJ6X1Yxez8XD613pc9LPRIykBM0TlnNEgGnnkn4QZDQDeNRnwfR/vNXBgYREwZovQ/8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB3301.eurprd08.prod.outlook.com (52.135.164.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 10:36:27 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::3d72:3e6c:cb97:8976]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::3d72:3e6c:cb97:8976%7]) with mapi id 15.20.2284.028; Mon, 30 Sep 2019
 10:36:27 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH] drm/komeda: Adds output-color format/depth support
Thread-Topic: [PATCH] drm/komeda: Adds output-color format/depth support
Thread-Index: AQHVb5fml3iiEtk+MEOqXjNduhm+kKc5MiiAgADp5ICAAhFyAIACqBcAgAVBDQA=
Date: Mon, 30 Sep 2019 10:36:27 +0000
Message-ID: <20190930103626.de3p6rbowyerjbks@DESKTOP-E1NTVVP.localdomain>
References: <20190920094329.17513-1-lowry.li@arm.com>
 <20190923121604.jqi6ewln27yvdajw@DESKTOP-E1NTVVP.localdomain>
 <20190924021313.GA15776@jamwan02-TSP300>
 <20190925094810.fbeyt7fxvyhaip33@DESKTOP-E1NTVVP.localdomain>
 <20190927022218.GA11732@jamwan02-TSP300>
In-Reply-To: <20190927022218.GA11732@jamwan02-TSP300>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.49]
x-clientproxiedby: LO2P265CA0428.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::32) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6a0436e8-2ff6-402e-2b34-08d7459215e2
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM6PR08MB3301:|AM6PR08MB3301:|AM0PR08MB3300:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB33002BE9C00F9010595F29B4F0820@AM0PR08MB3300.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 01762B0D64
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(189003)(199004)(11346002)(8676002)(476003)(478600001)(446003)(386003)(86362001)(8936002)(316002)(81166006)(81156014)(71190400001)(58126008)(4326008)(71200400001)(54906003)(1076003)(99286004)(486006)(6506007)(6636002)(256004)(2906002)(76176011)(6436002)(6486002)(5660300002)(186003)(9686003)(6512007)(44832011)(3846002)(102836004)(66446008)(64756008)(7736002)(66556008)(6862004)(66946007)(66476007)(66066001)(6246003)(229853002)(14454004)(52116002)(26005)(6116002)(305945005)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3301;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: fDQ22QzaEYltZYthtlgv262dWvnhzxDtjO9JFEeLc4VUx7Uebyuamx0cOEcuDhgDU59cKGGski/F/Nhup+6rUK7/NkZduizNdUi+CScBsy0I2H9Zslj8KITXoG/bQqL8cdDe7uQPADZZLxGyCbA8WHxXmlb4CWdwOQPu1+yrO3gtdif/qehFPYFb1159WOGS8jEPsKZb8QTs+01ri+FuR4hMaldLXcazFPotug/6y4ilXw2PkW1bKx0JWdH3HvbVpWO1F854ZZnWKoD3rZPp9Q+WdOjumNsm855L4gqxY67z9NalpcZSzPrcSMs0hpdm/MoWKK+gtFDJfc7CQ5bXkdyomRzhtRc6kWZYFBP3/sXCx+ycrywy770HoDX7zgMkzxld8Zqp2sj07gu9dVbwytfFpIcsjwJmwYKeIgwFXHY=
Content-ID: <FEC1E22EAEC731408B0F44E2F806E6AB@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3301
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(346002)(199004)(189003)(50466002)(102836004)(6862004)(54906003)(4326008)(23726003)(336012)(58126008)(5660300002)(3846002)(6116002)(1076003)(99286004)(2906002)(229853002)(6512007)(9686003)(6506007)(186003)(6486002)(66066001)(47776003)(76176011)(386003)(76130400001)(6636002)(86362001)(305945005)(356004)(81166006)(81156014)(8936002)(8676002)(6246003)(11346002)(70206006)(14454004)(46406003)(7736002)(446003)(97756001)(36906005)(478600001)(26826003)(486006)(70586007)(126002)(26005)(22756006)(476003)(8746002)(63350400001)(316002)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3300;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: fc49b9e9-aaac-410a-52bd-08d745920c42
NoDisclaimer: True
X-Forefront-PRVS: 01762B0D64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U+kYeES0qcc1CMqKYAcGIhY/z4ToYO6Zc1ST4pyBdExDDrS3OYqK3b/glMla6vMOT2URQdA6oI+oEVZvyYxBZfroATT42XeUnN93T4Xl/zkXVRi8hTLL+vBBb/E6z8UBhlB0vMR7XrjEmyZjiUSPAq66x+gA1fUgrz9YA+eOaFt4OloYm96i99SCJmOdXMcueyfvioOzgZGmJNWC+o0Gs1hiJOBP8iArAG7WcAgl20wNcy6luql+do8F/z4w5OaxOKb+7Y2thaiccWKe0/yY8zCkT3U5DIEYJmW6bZi5uDC2yvtgQ05CfWGk/uGWv9lKRKTFFki/+eI5GmI7GhBoZDedYB5tF1XaHV/t4tQEXjRn4zLJta3DcIddcV8MBaYbbvWVEvnNtBYeV5y3vg/rsnqah5Exfzlf7BjbuQNBxXM=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2019 10:36:43.0339 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0436e8-2ff6-402e-2b34-08d7459215e2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3300
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qONRKqBvkt1IpQ+h599hAArEKDB2e2sWBruuLP6md+k=;
 b=LDnc57QrkKqRSDnhkf0iy+IdTw3KN5dlKsxWB5eUQPgi/Bj99YTqBFVxsEeTYs9RJU4ffA0yBA2GtilRUjNhGcX7TKOh6nHYyKl/M0h7FPpGIHR4qWeXoEc+mGA2SBB1Qwrm0uKx7GbnAc6UP4ashSKDk9GOAFtnfwLYewmw4Fk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qONRKqBvkt1IpQ+h599hAArEKDB2e2sWBruuLP6md+k=;
 b=LDnc57QrkKqRSDnhkf0iy+IdTw3KN5dlKsxWB5eUQPgi/Bj99YTqBFVxsEeTYs9RJU4ffA0yBA2GtilRUjNhGcX7TKOh6nHYyKl/M0h7FPpGIHR4qWeXoEc+mGA2SBB1Qwrm0uKx7GbnAc6UP4ashSKDk9GOAFtnfwLYewmw4Fk=
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
Cc: nd <nd@arm.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMDI6MjI6MjRBTSArMDAwMCwgamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gT24gV2VkLCBTZXAgMjUsIDIwMTkgYXQg
MDk6NDg6MTFBTSArMDAwMCwgQnJpYW4gU3RhcmtleSB3cm90ZToKPiA+IEhpIEphbWVzLAo+ID4g
Cj4gPiBPbiBUdWUsIFNlcCAyNCwgMjAxOSBhdCAwMjoxMzoyN0FNICswMDAwLCBqYW1lcyBxaWFu
IHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiA+ID4gCj4gPiA+IEhpIEJyaWFu
Ogo+ID4gPiAKPiA+ID4gU2luY2Ugb25lIG1vbml0b3IgY2FuIHN1cHBvcnQgbXV0aXBsZSBjb2xv
ci1mb3JtYXRzLCB0aGlzIERUIHByb3BlcnR5Cj4gPiA+IHN1cHBseSBhIHdheSBmb3IgdXNlciB0
byBzZWxlY3QgYSBzcGVjaWZpYyBvbmUgZnJvbSB0aGlzIHN1cHBvcnRlZAo+ID4gPiBjb2xvci1m
b3JtYXRzLgo+ID4gCj4gPiBNb2RpZnlpbmcgRFQgaXMgYSBfcmVhbGx5XyB1c2VyLXVuZnJpZW5k
bHkgd2F5IG9mIHNwZWNpZnlpbmcKPiA+IHByZWZlcmVuY2VzLiBJZiB3ZSB3YW50IGEgdXNlciB0
byBiZSBhYmxlIHRvIHBpY2sgYSBwcmVmZXJyZWQgZm9ybWF0LAo+ID4gdGhlbiBpdCBzaG91bGQg
cHJvYmFibHkgYmUgdmlhIHRoZSBhdG9taWMgQVBJIGFzIFZpbGxlIG1lbnRpb25lZC4KPiA+Cj4g
Cj4gSGkgQnJpYW46Cj4gCj4gQWdyZWUsIGEgZHJtIFVQQUkgbWlnaHQgYmUgdGhlIGJlc3QgJiBy
aWdodCB3YXkgZm9yIHRoaXMuCj4gCj4gSSBjYW4gcmFpc2UgYSBuZXcgdGhyZWFkL3RvcGljIHRv
IGRpc2N1c3MgdGhlICJIT1cgVE8iLCBtYXliZSBhZnRlciB0aGUKPiBDaGluZXNlIG5hdGlvbmFs
IGRheS4KPiAKPiBMQVNUOgo+IHdoYXQgZG8geW91IHRoaW5rIGFib3V0IHRoaXMgcGF0Y2g6Cj4g
LSBKdXN0IGRyb3AgaXQsIHdhaXRpbmcgZm9yIHRoZSBuZXcgdWFwaQo+IC0gb3Iga2VlcCBpdCwg
YW5kIHJlcGxhY2UgaXQgb25jZSBuZXcgdWFwaSBpcyByZWFkeS4KClRoZSBiaXQtZGVwdGggc3R1
ZmYgaXMgY2xlYXIgYW5kIG5vbi1jb250cm92ZXJzaWFsLCBzbyB5b3UgY291bGQgc3BsaXQKdGhh
dCBvdXQgYW5kIG1lcmdlIGl0LgoKRm9yIHRoZSBZVVYgc3R1ZmYsIEkgdGhpbmsgaXQgd291bGQg
YmUgZmluZSB0byBtZXJnZSB0aGUKaW1wbGVtZW50YXRpb24gdGhhdCB3ZSBkaXNjdXNzZWQgaGVy
ZSAtIGZvcmNlIFlVViBmb3IgbW9kZXMgd2hpY2ggbXVzdApiZSBZVVYsIGFuZCBsZWF2ZSB0aGUg
dXNlci1wcmVmZXJlbmNlIHN0dWZmIGZvciBhIGxhdGVyIFVBUEkuCgpUaGFua3MsCi1CcmlhbgoK
PiAKPiBUaGFua3MKPiBKYW1lcwo+IAo+ID4gQ2hlZXJzLAo+ID4gLUJyaWFuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
