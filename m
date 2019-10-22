Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 083CDE0A02
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 19:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3226A6E891;
	Tue, 22 Oct 2019 17:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130073.outbound.protection.outlook.com [40.107.13.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0366E891
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 17:02:53 +0000 (UTC)
Received: from VI1PR0802CA0014.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::24) by DB7PR08MB3610.eurprd08.prod.outlook.com
 (2603:10a6:10:44::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Tue, 22 Oct
 2019 17:02:49 +0000
Received: from VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::207) by VI1PR0802CA0014.outlook.office365.com
 (2603:10a6:800:aa::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.20 via Frontend
 Transport; Tue, 22 Oct 2019 17:02:49 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT059.mail.protection.outlook.com (10.152.19.60) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.23 via Frontend Transport; Tue, 22 Oct 2019 17:02:47 +0000
Received: ("Tessian outbound e4042aced47b:v33");
 Tue, 22 Oct 2019 17:02:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dd19a59ab2625ea9
X-CR-MTA-TID: 64aa7808
Received: from 6d8bf17f9f19.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.6.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F27C06D3-0F00-495A-850E-7EFF846D86FC.1; 
 Tue, 22 Oct 2019 17:02:41 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6d8bf17f9f19.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 22 Oct 2019 17:02:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUL7uWVkd9Fh0bs55LgX9K7fwQ0Rg8YEADp25tP+y6xbf16upg5esPEpg1ow/kTeuZAZTs3xquMPqF6yXWTaJOS2so6py3wT9Yd5Ej1Ba+hNMRnz0RHArVikIM2BmQIl6MU1H5JfUEgbBqvzOebKuEM5UFki0e2D3012pjWkPZEVDaLDG+1AlXpHDFMtRsIkVWPyupk3F93KHhcJRd7rUdJkfrNITLpTJx3R13YE2yCqTx/2d2Dt1C1pHofkFICUis38+SEhBLzfNLfdX3be7BZIjKMv3NjkW3PiXP2/FNCAGCofhtHI1rn9U1Zoe8fix2epKSapXRNSH4Rna55J2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMsxkBlwIxBMwWzyFJoguuqQqc6zi2oiGZeS9KEX2nY=;
 b=O5RTdOrj11QUUjVH/bgQmOlaK152Q3Jl+0i7wvVLPtqxxhX/Be9wZkBHuKEwkK9izuR5FrsaNEq8YCe8PgSygFg0D0RUQUM9vOmCxgPcCxgY6pAWUvHFQuHFBjsyhwPEtmufElT+GXoX2Glx8lmbPTJGp/zEGRrsAzbQbbn8PorWZgBKJekuiXuSaOIATu2+iObCXF2rsjRBm+S5dHBX+nTMkJZ5eeOYeh8lLsE7Kkl+Ks4g25FDd2eb0iVXAPEV9iYjTNHel4S9fQgTkwQ+NuVSPPXqjtUls37wR0GZD47EhMG7V31HbCRbgwdznT7aGi0IVFKsRYcfuFKR3TZqWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB5424.eurprd08.prod.outlook.com (52.133.245.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.26; Tue, 22 Oct 2019 17:02:40 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2367.022; Tue, 22 Oct 2019
 17:02:40 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/doc: Drop misleading comment on
 drm_mode_config_cleanup
Thread-Topic: [PATCH] drm/doc: Drop misleading comment on
 drm_mode_config_cleanup
Thread-Index: AQHViPb8mSY9oISSYkestn8hD3+TCKdm4xeA
Date: Tue, 22 Oct 2019 17:02:40 +0000
Message-ID: <2276700.SQSDhaYmJ8@e123338-lin>
References: <20191022163717.1064-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20191022163717.1064-1-daniel.vetter@ffwll.ch>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.51]
x-clientproxiedby: LO2P265CA0330.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::30) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4d254fcb-92c9-4d80-cd86-08d75711aa28
X-MS-TrafficTypeDiagnostic: VI1PR08MB5424:|DB7PR08MB3610:
X-Microsoft-Antispam-PRVS: <DB7PR08MB3610DF9149CB4998C67065588F680@DB7PR08MB3610.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3044;OLM:3044;
x-forefront-prvs: 01986AE76B
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(199004)(189003)(81156014)(478600001)(6916009)(11346002)(2906002)(7736002)(66066001)(305945005)(4326008)(26005)(25786009)(316002)(33716001)(81166006)(5660300002)(6506007)(71190400001)(71200400001)(386003)(256004)(14444005)(52116002)(486006)(8936002)(446003)(14454004)(66446008)(476003)(102836004)(64756008)(6436002)(66476007)(66946007)(54906003)(76176011)(6116002)(9686003)(6512007)(66556008)(8676002)(3846002)(99286004)(6246003)(229853002)(186003)(86362001)(6486002)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB5424;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: rwJuigH2kqHBttp5wbGaBEiQzyZjT1IeMw9IeqOGxq+YBdWgOgTNGO7upnUKCdw4Pbu4+NkVJetZ+npcAZOOv658LkgubpHjM8n/2x1+H7dmdKE4ZI6Og/ia3nnZs36Utc50G+2FjNVbvzC294GyG1ZpyR79EnIKwVjLhmSY7sq94iTnpEdy7sv54nt1pyT9SBpDf5W5xKNJYb0hnglFLaP7ywIeEqAHWXd2x1ZVvjt9t7mu0DErKyEOrUaS1khw4stPzMsqrqsQ7Brg8LxYAtK0lUX8zIcVh2tzRh6+vMdg3IQx9qbUbMUBnZSoVo1n7N3IzU0IwqVSHJ8qQtfzVyXz0u4rMkZGub01zJGNQlLtaHaFozWo0mvOfButZarumGNWPqvsMhv28H/p8I6QYeMa1ww9DqtB5jHk5WH47ak=
x-ms-exchange-transport-forked: True
Content-ID: <5B7FED7115B4A141A89018BF8C2BAD4D@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5424
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(396003)(136003)(346002)(376002)(39860400002)(199004)(189003)(33716001)(336012)(8676002)(386003)(70206006)(476003)(81166006)(446003)(11346002)(126002)(70586007)(5660300002)(356004)(50466002)(26826003)(478600001)(14454004)(25786009)(26005)(47776003)(81156014)(76130400001)(66066001)(186003)(9686003)(22756006)(486006)(6512007)(102836004)(6506007)(6862004)(86362001)(8746002)(23726003)(107886003)(76176011)(46406003)(99286004)(4326008)(97756001)(36906005)(316002)(6246003)(6116002)(229853002)(7736002)(2906002)(3846002)(63350400001)(8936002)(14444005)(6486002)(54906003)(305945005)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3610;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 88ad41a1-84a4-41b8-f7ea-08d75711a5cb
NoDisclaimer: True
X-Forefront-PRVS: 01986AE76B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8gfBWwDCFTkZpL4/umeZTHzIEd9AYwAB1tzzbyuUy2SWCxOzyNP1JkOdl7uuTVdiBwIBnFV/nSQd40zJdhO11MUI0Rgl5Har3eZ1w6BDrjuY8XkYi0onr9jnzaBjcai9XxlLIu+OGJOxPJJARAnnCS2JdJ/99z3o8wIuxsQFimuc/7pEo4xnxMFNuHshxyLKkS+rtXnhPUfJ3Zzjf7X62XgbClahHGmiivEyZnjK0JPXED42vRNre7zrnszVLVRw9fjs4Kr1tloGHqMXrU/K5YV5Ca4HK3t2IA5R8PLLvBVWsrAT5x+5HKx98jbwGNQ7dkqzUAtH+V21GUUJ1eM2hZ9dYIrZgx54gdSVDu/EO0B1eHqXiqLwiqQuGYS3FqnUzHvSmyxhiSMfmMb3Rw2adZf60k0RCrz3t//Lpg4QZzMIhiAo4fJ6yHa/zL7yfTxk
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2019 17:02:47.5984 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d254fcb-92c9-4d80-cd86-08d75711aa28
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3610
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMsxkBlwIxBMwWzyFJoguuqQqc6zi2oiGZeS9KEX2nY=;
 b=SNOgEEKwqO0mA1pkDyrNBiw0qrxAYR0bEwzdnps24s/i5WW9qL3UvmdIg8RDXkmKDz3YHc2SgOrLPDk7x5fzz5rGAORzxWAOoxE4/A5Zo7Krk6jYdGmVSmTD6MN8mmSergDYSHXogkH5muqeq8CxQCAx5b6ZA0uQISjEfdLlBdI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMsxkBlwIxBMwWzyFJoguuqQqc6zi2oiGZeS9KEX2nY=;
 b=SNOgEEKwqO0mA1pkDyrNBiw0qrxAYR0bEwzdnps24s/i5WW9qL3UvmdIg8RDXkmKDz3YHc2SgOrLPDk7x5fzz5rGAORzxWAOoxE4/A5Zo7Krk6jYdGmVSmTD6MN8mmSergDYSHXogkH5muqeq8CxQCAx5b6ZA0uQISjEfdLlBdI=
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, nd <nd@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlc2RheSwgMjIgT2N0b2JlciAyMDE5IDE3OjM3OjE3IEJTVCBEYW5pZWwgVmV0dGVyIHdy
b3RlOgo+IFRoaXMgaXMgbm90IHNvbWV0aGluZyB3ZSdsbCBmaXgsIGJlY2F1c2UgZmFpbGluZyB0
byBjbGVhbiB1cCBzdHVmZiAob3IKPiBkb2luZyBpdCBpbiB0aGUgd3Jvbmcgb3JkZXIpIGlzIGEg
ZHJpdmVyIGJ1Zy4gVGhlIG9mZmVuZGluZyBGSVhNRSBnb2VzCj4gYWxsIHRoZSB3YXkgYmFjayB0
byB0aGUgb3JpZ2luYWwgbW9kZXNldCBtZXJnZS4KPiAKPiBXZSd2ZSBhZGRlZCBhIFdBUk5fT04g
aW4KPiAKPiBjb21taXQgMmI2NzdlOGMwOGVlZDExZTRlYmU2NmE3YzMzNGYwM2UzODlhMTlhMwo+
IEF1dGhvcjogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBEYXRlOiAg
IE1vbiBEZWMgMTAgMjE6MTY6MDUgMjAxMiArMDEwMAo+IAo+ICAgICBkcm06IHJlZmVyZW5jZSBm
cmFtZWJ1ZmZlcnMgd2hpY2ggYXJlIG9uIHRoZSBpZHIKPiAKPiBpbmNsdWRpbmcgYSBjb21tZW50
IGJsYW1pbmcgZHJpdmVycyBvbiB0aGlzLiBSaWdodCB0aGluZyB0byBkbyBpcyBtb3N0Cj4gbGlr
ZWx5IGRybV9hdG9taWNfaGVscGVyX3NodXRkb3duIHBsdXMgbWFraW5nIHN1cmUgdGhhdAo+IGRy
bV9tb2RlX2NvbmZpZ19jbGVhbnVwIGlzIG5vdCBjYWxsZWQgdG9vIGVhcmx5IChpLmUuIG5vdCBp
biBkcml2ZXIKPiB1bmxvYWQsIGJ1dCBvbmx5IGluIHRoZSBmaW5hbCBkcm1fZGV2aWNlIHJlbGVh
c2UgY2FsbGJhY2spLgo+IAo+IENjOiBNaWhhaWwgQXRhbmFzc292IDxNaWhhaWwuQXRhbmFzc292
QGFybS5jb20+Cj4gUmVwb3J0ZWQtYnk6IE1paGFpbCBBdGFuYXNzb3YgPE1paGFpbC5BdGFuYXNz
b3ZAYXJtLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGludGVsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX2NvbmZpZy5jIHwg
MiAtLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX2NvbmZpZy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9t
b2RlX2NvbmZpZy5jCj4gaW5kZXggN2JjMDNjM2MxNTRmLi4zYjU3MGE0MDQ5MzMgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX2NvbmZpZy5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9tb2RlX2NvbmZpZy5jCj4gQEAgLTQyOCw4ICs0MjgsNiBAQCBFWFBPUlRfU1lN
Qk9MKGRybV9tb2RlX2NvbmZpZ19pbml0KTsKPiAgICogTm90ZSB0aGF0IHNpbmNlIHRoaXMgL3No
b3VsZC8gaGFwcGVuIHNpbmdsZS10aHJlYWRlZCBhdCBkcml2ZXIvZGV2aWNlCj4gICAqIHRlYXJk
b3duIHRpbWUsIG5vIGxvY2tpbmcgaXMgcmVxdWlyZWQuIEl0J3MgdGhlIGRyaXZlcidzIGpvYiB0
byBlbnN1cmUgdGhhdAo+ICAgKiB0aGlzIGd1YXJhbnRlZSBhY3R1YWxseSBob2xkcyB0cnVlLgo+
IC0gKgo+IC0gKiBGSVhNRTogY2xlYW51cCBhbnkgZGFuZ2xpbmcgdXNlciBidWZmZXIgb2JqZWN0
cyB0b28KPiAgICovCj4gIHZvaWQgZHJtX21vZGVfY29uZmlnX2NsZWFudXAoc3RydWN0IGRybV9k
ZXZpY2UgKmRldikKPiAgewo+IAoKVGhhbmtzLAoKUmV2aWV3ZWQtYnk6IE1paGFpbCBBdGFuYXNz
b3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KCi0tIApNaWhhaWwKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
