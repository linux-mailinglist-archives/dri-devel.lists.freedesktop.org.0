Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 408CFD72C5
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 12:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCC189FD1;
	Tue, 15 Oct 2019 10:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10057.outbound.protection.outlook.com [40.107.1.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1688089FA6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 10:06:30 +0000 (UTC)
Received: from VI1PR08CA0100.eurprd08.prod.outlook.com (2603:10a6:800:d3::26)
 by AM5PR0802MB2467.eurprd08.prod.outlook.com (2603:10a6:203:a0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Tue, 15 Oct
 2019 10:06:25 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::206) by VI1PR08CA0100.outlook.office365.com
 (2603:10a6:800:d3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Tue, 15 Oct 2019 10:06:25 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 15 Oct 2019 10:06:23 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Tue, 15 Oct 2019 10:06:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 83e296d17dcb401e
X-CR-MTA-TID: 64aa7808
Received: from eac64756631c.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.2.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 03D616CD-62E2-41DE-AF9C-8FAFEF5249D2.1; 
 Tue, 15 Oct 2019 10:06:14 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eac64756631c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Oct 2019 10:06:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkqLGvspB/hYaUsJ9ulhp2mw9vh91iz3YQhBTP9mrDRWv8Nzf6VoKLSwGsi9fOtDgGK2Tcj63knO9Ue7HmzIMOopTNeEDL9JXVIyGw/DKNxicTv+aIxcvUvu6xUU19WCqybzQdGRuLdZlBLxP+7nWYRiZ5I3KzQy2gWbtb8Zz5dTBQiZOKzqOSyjXwu6NlfMrExCJUJZBmLQIBeAqFnvBffyHLhK6fNK2xFCNIBWnaX9hKqmKQCShmAVyzlNq9AqQp7dDX6ofjkGHLiMn7hDJS6DVsV7HKwKbqf2xQsETkjaD3MA86y28OUpWnz5ud43zJcW2ml8Te12PRsupEF04Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJjFVD/1IUqcd1WEqRaflOr0mBmZvSltw5iQOvjQDe4=;
 b=JY41AfQHKQde7gNznDHWoERRYQCR5dY8/Rv4y/ptE4varAQ5KhqK0WXlwUIadl7QYzb9cjMByWRdC0INIh0dfiEYFi46HCgi2A9lQF4XLyw4+ceGsyAWIhv246P/j0QCCDxTXNVKngeer3Q1OfzZCZ8YZIQNn1s7BleHQLssFh6fQD790PgYU6guBrlhmd20SoLjVsPG00ixaQbjHybU70syQTl6caHNfVj+vqcRzD+7JIMyjtOq7p6w7OF7xm14rzTNOShlmDXJnC5TX6HTsJDEkefihx6yig1CIXemUTBU4tqeG1YN6bb/fwpXLSRic9FLaDRyqi7BdEAcZoggHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5182.eurprd08.prod.outlook.com (20.179.31.89) by
 VE1PR08MB5184.eurprd08.prod.outlook.com (20.179.29.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.19; Tue, 15 Oct 2019 10:06:12 +0000
Received: from VE1PR08MB5182.eurprd08.prod.outlook.com
 ([fe80::a54d:cc87:644c:e3ba]) by VE1PR08MB5182.eurprd08.prod.outlook.com
 ([fe80::a54d:cc87:644c:e3ba%6]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 10:06:12 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Brian Starkey <Brian.Starkey@arm.com>
Subject: Re: [PATCH] drm/komeda: Adds output-color format/depth support
Thread-Topic: [PATCH] drm/komeda: Adds output-color format/depth support
Thread-Index: AQHVb5fml3iiEtk+MEOqXjNduhm+kKc5MiiAgADp5ICAAhFyAIACqBcAgAVBDQCAF4p+gA==
Date: Tue, 15 Oct 2019 10:06:12 +0000
Message-ID: <20191015100605.GA26326@lowli01-ThinkStation-P300>
References: <20190920094329.17513-1-lowry.li@arm.com>
 <20190923121604.jqi6ewln27yvdajw@DESKTOP-E1NTVVP.localdomain>
 <20190924021313.GA15776@jamwan02-TSP300>
 <20190925094810.fbeyt7fxvyhaip33@DESKTOP-E1NTVVP.localdomain>
 <20190927022218.GA11732@jamwan02-TSP300>
 <20190930103626.de3p6rbowyerjbks@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20190930103626.de3p6rbowyerjbks@DESKTOP-E1NTVVP.localdomain>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0039.apcprd03.prod.outlook.com
 (2603:1096:203:2f::27) To VE1PR08MB5182.eurprd08.prod.outlook.com
 (2603:10a6:803:10c::25)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 1fc9d155-1d64-4d26-2580-08d7515755ad
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB5184:|VE1PR08MB5184:|AM5PR0802MB2467:
X-MS-Exchange-PUrlCount: 2
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB246728CB1A91F872CD649C499F930@AM5PR0802MB2467.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 01917B1794
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(136003)(346002)(376002)(366004)(396003)(189003)(199004)(55236004)(256004)(66446008)(66556008)(8676002)(6636002)(81156014)(14454004)(8936002)(33656002)(64756008)(66476007)(66946007)(66066001)(81166006)(71190400001)(71200400001)(305945005)(99286004)(7736002)(33716001)(4326008)(186003)(26005)(76176011)(52116002)(102836004)(6506007)(6246003)(1076003)(5660300002)(9686003)(6512007)(25786009)(6436002)(6306002)(229853002)(478600001)(6862004)(476003)(6486002)(11346002)(446003)(2906002)(6116002)(3846002)(486006)(966005)(316002)(54906003)(58126008)(86362001)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5184;
 H:VE1PR08MB5182.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Wlht+9gGzV2O5vQezxOuzER5+clz5CYUMog981J9LIADpH1BTo0LjNhTK4iC4eiB8BSKXxOI3jLtNaBLeMndlDSYBQhX3cLxDawAKKhJBI1ruFg/AgmbOs+R7cfNj4YUNHiKkYlanv9MiyRGTnaemJVagqF42TrBKiVA+oH2Hj1CDUCkIKhNuHSewBXuGJg+++VHXalXwStSiK2BnQZrX0FSx1rcepPBhNtarFLXHHMjhAQfsaJ2+5vG90nnpkfnDxp6+qnoKbK8WmfrMZ2/BxNZluYRj1ritUArC7eM1fbLKeiCqzGVfpTgA6jrBAXpR2k4ud9qzWlBPr9b2uTCoKtAmysHsFk57EEkbNPeVxRIFCCZ7F8UZJ3bO7pYBnZi2cFhbgi1768m6PkdMI2aRJaLMicfKDFyzOkebapQdGGRhBg+SNDWg1Q1iGTOVJEyuy4VoDCTgd5gbqAMnN1g8A==
Content-ID: <221E5282F0F9EB42B7A16C6296309758@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5184
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(346002)(376002)(39860400002)(396003)(136003)(189003)(199004)(70206006)(33656002)(966005)(305945005)(2906002)(6862004)(1076003)(26005)(26826003)(478600001)(5660300002)(386003)(6506007)(102836004)(6116002)(6636002)(22756006)(33716001)(6486002)(70586007)(186003)(3846002)(7736002)(46406003)(6246003)(23726003)(76176011)(14454004)(66066001)(47776003)(76130400001)(50466002)(486006)(99286004)(4326008)(6512007)(446003)(336012)(8936002)(8746002)(81156014)(356004)(11346002)(476003)(81166006)(8676002)(316002)(25786009)(9686003)(36906005)(126002)(229853002)(54906003)(58126008)(86362001)(97756001)(6306002)(63350400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0802MB2467;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 64ea690a-ff94-4401-7635-08d751574ede
NoDisclaimer: True
X-Forefront-PRVS: 01917B1794
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MRbcgnyI1TEXPwPSOARhJdwSCcc2QBXJ4iMH008accy/SC2Li9Se3R4bAVH1LjS3dteeaHBPdPyK/Ee211MIk+vfF0aqERb8kpcYR2N1uv2Xop34HvzQjHyAeamkAGXbJufVBOSUXafB1czC+f5MeUKXdCw6ZFFJBNRu67QQnKHSSduOJfVyF9SjWUPwdB+/2CTwrtI+2VijkWCqAtYymWr8TMJ992t8v46mYovU54HGPDknW9KR8hROXggBlvQIcMFWaXhmDu+Vv3J55yFtKLJFWR6nTJSjQGfOm/CapooB7sV6I0DS3CTF59L/JELTr8Wc1IbK4T1qHfoPU/zQsixBZyXWi+FMtR+yVZgnuyhvzFMrnIG/GooXcCaO07ezbi4pHWfKJwp0+kXrc8oXlEHBPsiXJvsfJZuTK04ZgyenE+IAB+yUk9vazIi2pRakpeb7WWJYwRQC0BhfniyQlQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2019 10:06:23.6418 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc9d155-1d64-4d26-2580-08d7515755ad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2467
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJjFVD/1IUqcd1WEqRaflOr0mBmZvSltw5iQOvjQDe4=;
 b=dNSlLZPBpcLVA6TDfRCHYPpKVEMGxHg923HOYFPYubxYNjwE4lnNiNx1E+6SmV7QCK0TGHK6wcYOGxCdjD6GBr4usiB2Ftroek00WgNpom5oxMDhqb0iEb4uIQ/mPN7JS+miTvBo2kdwC7GRHde7I0mudE8MZpBY8nH/SBSIrFA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJjFVD/1IUqcd1WEqRaflOr0mBmZvSltw5iQOvjQDe4=;
 b=dNSlLZPBpcLVA6TDfRCHYPpKVEMGxHg923HOYFPYubxYNjwE4lnNiNx1E+6SmV7QCK0TGHK6wcYOGxCdjD6GBr4usiB2Ftroek00WgNpom5oxMDhqb0iEb4uIQ/mPN7JS+miTvBo2kdwC7GRHde7I0mudE8MZpBY8nH/SBSIrFA=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQnJpYW4sCk9uIE1vbiwgU2VwIDMwLCAyMDE5IGF0IDEwOjM2OjI3QU0gKzAwMDAsIEJyaWFu
IFN0YXJrZXkgd3JvdGU6Cj4gT24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMDI6MjI6MjRBTSArMDAw
MCwgamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gPiBPbiBX
ZWQsIFNlcCAyNSwgMjAxOSBhdCAwOTo0ODoxMUFNICswMDAwLCBCcmlhbiBTdGFya2V5IHdyb3Rl
Ogo+ID4gPiBIaSBKYW1lcywKPiA+ID4gCj4gPiA+IE9uIFR1ZSwgU2VwIDI0LCAyMDE5IGF0IDAy
OjEzOjI3QU0gKzAwMDAsIGphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdy
b3RlOgo+ID4gPiA+IAo+ID4gPiA+IEhpIEJyaWFuOgo+ID4gPiA+IAo+ID4gPiA+IFNpbmNlIG9u
ZSBtb25pdG9yIGNhbiBzdXBwb3J0IG11dGlwbGUgY29sb3ItZm9ybWF0cywgdGhpcyBEVCBwcm9w
ZXJ0eQo+ID4gPiA+IHN1cHBseSBhIHdheSBmb3IgdXNlciB0byBzZWxlY3QgYSBzcGVjaWZpYyBv
bmUgZnJvbSB0aGlzIHN1cHBvcnRlZAo+ID4gPiA+IGNvbG9yLWZvcm1hdHMuCj4gPiA+IAo+ID4g
PiBNb2RpZnlpbmcgRFQgaXMgYSBfcmVhbGx5XyB1c2VyLXVuZnJpZW5kbHkgd2F5IG9mIHNwZWNp
ZnlpbmcKPiA+ID4gcHJlZmVyZW5jZXMuIElmIHdlIHdhbnQgYSB1c2VyIHRvIGJlIGFibGUgdG8g
cGljayBhIHByZWZlcnJlZCBmb3JtYXQsCj4gPiA+IHRoZW4gaXQgc2hvdWxkIHByb2JhYmx5IGJl
IHZpYSB0aGUgYXRvbWljIEFQSSBhcyBWaWxsZSBtZW50aW9uZWQuCj4gPiA+Cj4gPiAKPiA+IEhp
IEJyaWFuOgo+ID4gCj4gPiBBZ3JlZSwgYSBkcm0gVVBBSSBtaWdodCBiZSB0aGUgYmVzdCAmIHJp
Z2h0IHdheSBmb3IgdGhpcy4KPiA+IAo+ID4gSSBjYW4gcmFpc2UgYSBuZXcgdGhyZWFkL3RvcGlj
IHRvIGRpc2N1c3MgdGhlICJIT1cgVE8iLCBtYXliZSBhZnRlciB0aGUKPiA+IENoaW5lc2UgbmF0
aW9uYWwgZGF5Lgo+ID4gCj4gPiBMQVNUOgo+ID4gd2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdGhp
cyBwYXRjaDoKPiA+IC0gSnVzdCBkcm9wIGl0LCB3YWl0aW5nIGZvciB0aGUgbmV3IHVhcGkKPiA+
IC0gb3Iga2VlcCBpdCwgYW5kIHJlcGxhY2UgaXQgb25jZSBuZXcgdWFwaSBpcyByZWFkeS4KPiAK
PiBUaGUgYml0LWRlcHRoIHN0dWZmIGlzIGNsZWFyIGFuZCBub24tY29udHJvdmVyc2lhbCwgc28g
eW91IGNvdWxkIHNwbGl0Cj4gdGhhdCBvdXQgYW5kIG1lcmdlIGl0Lgo+IAo+IEZvciB0aGUgWVVW
IHN0dWZmLCBJIHRoaW5rIGl0IHdvdWxkIGJlIGZpbmUgdG8gbWVyZ2UgdGhlCj4gaW1wbGVtZW50
YXRpb24gdGhhdCB3ZSBkaXNjdXNzZWQgaGVyZSAtIGZvcmNlIFlVViBmb3IgbW9kZXMgd2hpY2gg
bXVzdAo+IGJlIFlVViwgYW5kIGxlYXZlIHRoZSB1c2VyLXByZWZlcmVuY2Ugc3R1ZmYgZm9yIGEg
bGF0ZXIgVUFQSS4KPiAKPiBUaGFua3MsCj4gLUJyaWFuClRoaXMgcGF0Y2ggaGFzIGJlZW4gc3Bs
aXQgdG8gdHdvIHBhdGNoZXMgYW5kIHRoaXMgd2lsbCBiZSBkcm9wcGVkLgpPdXRwdXQgYml0LWRl
cHRoIDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82NzczMC8KT3V0
cHV0IGNvbG9yIGZvcm1hdDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmll
cy82ODAxMi8KClJlZ2FyZHMsCkxvd3J5Cj4gPiAKPiA+IFRoYW5rcwo+ID4gSmFtZXMKPiA+IAo+
ID4gPiBDaGVlcnMsCj4gPiA+IC1CcmlhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
