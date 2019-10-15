Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD50D74C3
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 13:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7196E364;
	Tue, 15 Oct 2019 11:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe08::60c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB316E364
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 11:18:31 +0000 (UTC)
Received: from DB7PR08CA0050.eurprd08.prod.outlook.com (2603:10a6:10:26::27)
 by VE1PR08MB4782.eurprd08.prod.outlook.com (2603:10a6:802:ae::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Tue, 15 Oct
 2019 11:18:24 +0000
Received: from VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::206) by DB7PR08CA0050.outlook.office365.com
 (2603:10a6:10:26::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Tue, 15 Oct 2019 11:18:24 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT029.mail.protection.outlook.com (10.152.18.107) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 15 Oct 2019 11:18:22 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Tue, 15 Oct 2019 11:18:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 48a4bf864b8954b0
X-CR-MTA-TID: 64aa7808
Received: from 65593cc4097a.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3995909D-7D98-49E9-8BB7-851603195AAD.1; 
 Tue, 15 Oct 2019 11:18:15 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 65593cc4097a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Oct 2019 11:18:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbviVeAp6O6ryxh/MMRkbs1tgtCXWRh4rgds5bwoOGfHpi1M2bh60POChjV+uGqNztwze1a6fwV59QXQdIlUB9kp+dZKdB1vv8SLYIVoNIFAcYEW7hMIBkHHND8vAQIJ5dYmfvbX53nFMXajy+mnOU2vAbbXI6/e1J2oOljM8K6+TAwNi2reQTtxVh/KmIzpsE6on3HdR8HCOPiGCjadL3tPjMzdF4/MJHzCWRlJq/KkpLc0jopyBqCpJE67yt39HB9jD0597YsgyrhPGmZgiCXOq5mtRa/pPFXrBdA3rDohC5Enmbgnmjq7pBfx5W7apODJEmWFn/arCbXaE8qHFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0vPqjce6ZcJDsAEQRbhJWoMd3QVNqcmEfaYD2v7/Nc=;
 b=ktCobPVa8DvIR65iofN6hK4esRVjGXoqCtDcU8Uh0IT49xHG08ywoSZkSjSnec+OUt4TjcdYozKkLIWL1UaQIC/w9mi1rU8Q6i4+J8rr2SlQ9ENdmBNG4zXtqYJFAtxO/c/pnjQVgVX5EG/0HncCMiOpvU/ryDLaq4QcxzPGTCgrWAQKwQZyk4bnB/Z7cFEY2nHR6LhHmEatpYNvkybA1ixvviVPKRmnK0c9rPfZDXcX4i7XFxPeA5hbesSAdRAficalXStPfUxHDF3bSMh0Gkd1Y6HWWp8qPlyRYtfKlpfl1HPBsIGoF3jR+P/RGndnCG4KilXUVwyiSomXJocCQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB5126.eurprd08.prod.outlook.com (10.255.123.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 15 Oct 2019 11:18:14 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a%5]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 11:18:14 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 4/7] drm/meson: plane: add support for AFBC mode for OSD1
 plane
Thread-Topic: [PATCH 4/7] drm/meson: plane: add support for AFBC mode for OSD1
 plane
Thread-Index: AQHVgA+hW0YpyPd1Sk22upjR9Lo04KdVKIOAgAAcS4CAABPZgIAGO68A
Date: Tue, 15 Oct 2019 11:18:13 +0000
Message-ID: <20191015111812.vl2yabdoncz77xh6@DESKTOP-E1NTVVP.localdomain>
References: <20191010092526.10419-1-narmstrong@baylibre.com>
 <20191010092526.10419-5-narmstrong@baylibre.com>
 <20191010132601.GA10110@arm.com>
 <44f1771f-d640-f23d-995f-7bfcadd213bc@baylibre.com>
 <20191011084108.i7lfh2d7asfmcdk4@DESKTOP-E1NTVVP.localdomain>
 <c9d4f840-a3da-0f40-3a1c-c4aa522daf0f@baylibre.com>
 <20191011105559.clttghy52wfdmb34@DESKTOP-E1NTVVP.localdomain>
 <d1010021-cbd8-4328-4b21-7481cba5485e@baylibre.com>
In-Reply-To: <d1010021-cbd8-4328-4b21-7481cba5485e@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.54]
x-clientproxiedby: AM0PR05CA0096.eurprd05.prod.outlook.com
 (2603:10a6:208:136::36) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c84def4e-45e8-4171-bb66-08d75161642b
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM6PR08MB5126:|AM6PR08MB5126:|VE1PR08MB4782:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB47829ACFBCAACAD12CD646B5F0930@VE1PR08MB4782.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 01917B1794
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(189003)(199004)(52116002)(86362001)(76176011)(476003)(316002)(5660300002)(6436002)(66066001)(6486002)(6512007)(9686003)(3846002)(11346002)(6116002)(446003)(99286004)(186003)(102836004)(54906003)(6916009)(14454004)(256004)(58126008)(26005)(71200400001)(71190400001)(386003)(6506007)(486006)(53546011)(44832011)(1076003)(7736002)(305945005)(478600001)(25786009)(8676002)(81166006)(8936002)(64756008)(66946007)(66556008)(66476007)(81156014)(66446008)(4326008)(6246003)(2906002)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB5126;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: TDcTlSQVF24D1ye7xoF113V9jZBLaTsM/xELOPW+oMLNvcVH1USXyB88rqLZizanv/YriAMORoLUqOlkasvSGYU0Xs9dmiVgulLeZkFfBY/gFPuE9Pv9DwLItb84g3u2CiVhcLlUOpglEkG6pg54ad6xxHfc/km6yYFlU9bhVGxcfvf7lX4vr5IX9WWJ/Nd8hf63kQ2eNdf+pFHz5qvdi9500lPStnjsV7xCzAgalf6F1vaeUmaNv+VAdMMwgdUKlund/pUhJ9/xIL2DI6OB7iklfsGN+bIn5YqFM9oH4eniGzqIaLu0z1/5tYcf45bueYMrNCOIexLYXc0PfFsSX5C1Kmf0Qh9xfN+Q4O8O/ysnfEDk3O5e4mZhs3KgS3q3txwoVo9bDf0HRqBTho0r96JY3lo0nmlq5+EkqhmvEYc=
Content-ID: <F672DD3E59A7584AA0C7DBBD971FB605@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5126
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(39860400002)(346002)(199004)(189003)(356004)(8746002)(8936002)(7736002)(102836004)(76176011)(81166006)(8676002)(53546011)(6506007)(386003)(86362001)(6486002)(76130400001)(5660300002)(6246003)(107886003)(9686003)(23726003)(46406003)(6512007)(6116002)(3846002)(99286004)(2906002)(305945005)(4326008)(70586007)(1076003)(70206006)(229853002)(81156014)(486006)(63350400001)(11346002)(66066001)(446003)(126002)(6862004)(476003)(47776003)(97756001)(25786009)(50466002)(22756006)(58126008)(14454004)(478600001)(316002)(26826003)(336012)(26005)(54906003)(186003)(36906005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4782;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: d6674c05-e824-4e82-0301-08d751615e3c
NoDisclaimer: True
X-Forefront-PRVS: 01917B1794
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EgJinvtSVNRWaRnioIGdJo5nHGR0l/z1sfAl7gXnUofemPxMLRacc7tYF3k7Zd5+N1yX4Xc9kAgFr/xOK7frboY0zu2CPBR7CLK0iYqGEHKJ96ATVVeV7Ast79OTO6hUUMLpPvSIp6nLbF1p27Qrjl8e6h3KRnvMkB96jwLLprr6PLgpAhE4QFEdvxZXgFWsfwVUxq/tSD1A6Gm3NkQQ62+1fRbNnCuNfH5wfFuU0go/2aD2O4qGn7NJiKKQs4YpYVXZRSQj2JNEtc/8fk3p2aFKunHKRYBNjChtJ6e54CK7sVCx7zHRBUBWAV8letRCbm9dYoy9b5b3gS8WFin16G2+C15dlysRz9XxMJTspIBUJEjKd4wtp/WfJmr2OIllypccPC2Zd79dHn6DrUXMUr4H0AE7FGi1bZhl2PNtO/Y=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2019 11:18:22.9428 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c84def4e-45e8-4171-bb66-08d75161642b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4782
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0vPqjce6ZcJDsAEQRbhJWoMd3QVNqcmEfaYD2v7/Nc=;
 b=RgPaPB/o5p8LNuJnBgczAn+83CkU6ZucNTHvx450z8Pntb+LhcZT62ViLArUjZPZj7d6dZU2CzSpRpEvbLjjtqbf6YLQiEQAicn4CwtHU+mtYFwnX0Oeo5qeWXojKo3ONNeIkadqA2t6JZcvTxHlqgghB4ZRP2onlHOZOOBfq7M=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0vPqjce6ZcJDsAEQRbhJWoMd3QVNqcmEfaYD2v7/Nc=;
 b=RgPaPB/o5p8LNuJnBgczAn+83CkU6ZucNTHvx450z8Pntb+LhcZT62ViLArUjZPZj7d6dZU2CzSpRpEvbLjjtqbf6YLQiEQAicn4CwtHU+mtYFwnX0Oeo5qeWXojKo3ONNeIkadqA2t6JZcvTxHlqgghB4ZRP2onlHOZOOBfq7M=
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
Cc: Ayan Halder <Ayan.Halder@arm.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 nd <nd@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmVpbCwKCk9uIEZyaSwgT2N0IDExLCAyMDE5IGF0IDAyOjA3OjAxUE0gKzAyMDAsIE5laWwg
QXJtc3Ryb25nIHdyb3RlOgo+IE9uIDExLzEwLzIwMTkgMTI6NTYsIEJyaWFuIFN0YXJrZXkgd3Jv
dGU6Cj4gPiBIaSwKPiA+IAo+ID4gT24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMTE6MTQ6NDNBTSAr
MDIwMCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gPj4gSGkgQnJpYW4sCj4gPj4KPiA+PiBPbiAx
MS8xMC8yMDE5IDEwOjQxLCBCcmlhbiBTdGFya2V5IHdyb3RlOgo+ID4+PiBIaSBOZWlsLAo+ID4+
Pgo+ID4+PiBPbiBUaHUsIE9jdCAxMCwgMjAxOSBhdCAwMzo0MToxNVBNICswMjAwLCBOZWlsIEFy
bXN0cm9uZyB3cm90ZToKCltzbmlwXQoKPiA+PiBZb3UnbGwgaGF2ZSB0byB0ZWxsIHVzIGlmIHRo
ZSBjbG9zZWQgbGliTWFsaSBoYW5kbGluZyBBRkJDIHdvdWxkIGFjY2VwdAo+ID4+IEFSR0I4ODg4
IGFzIGZvcm1hdCB0byByZW5kZXIgd2l0aCBBRkJDIGVuYWJsZWQsIGlmIG5vdCB5b3UncmUgcmln
aHQKPiA+PiBJJ2xsIGRpc2NhcmQgWFJHQjg4ODgvQVJHQjg4ODggZm9yIEFGQkMgYnVmZmVycyBj
b21wbGV0ZWx5Lgo+ID4+Cj4gPj4gQnV0IGl0IHRoZSBsaWJNYWxpIGNob29zZXMgdHQgZ2VuZXJh
dGUgYW4gQVJHQjg4ODggYnVmZmVyIHdoYXRldmVyCj4gPj4gQVJHQjg4ODgvWFJHQjg4ODgvQUJH
Ujg4OC9YQkdSODg4IGlzIGFza2VkLCB0aGVuIG5vIEknbGwga2VlcCBpdCB0aGF0IHdheS4KPiA+
Pgo+ID4gCj4gPiBZZWFoLCBJJ2xsIHRyeSBhbmQgZ2V0IGNsYXJpdHkgb24gdGhpcy4gSXQncyBu
b3QgYXQgYWxsIGNsZWFyIHRvIG1lCj4gPiBlaXRoZXIuIFdoZW4geW91IHNheSAiYWNjZXB0IEFS
R0I4ODg4IGFzIGZvcm1hdCB0byByZW5kZXIgd2l0aCBBRkJDCj4gPiBlbmFibGVkIiwgd2hpY2gg
QVBJIGFyZSB5b3UgcmVmZXJyaW5nIHRvLCBqdXN0IHNvIEkgY2FuIGJlIGNsZWFyPyBEbwo+ID4g
eW91IGhhdmUgYW4gZXhhbXBsZSBvZiBzb21lIGNvZGUgeW91J3JlIHVzaW5nIHRvIHJlbmRlciBB
RkJDIHdpdGggdGhlCj4gPiBHUFUgYmxvYj8KPiAKPiBMZXQncyB0YWtlIGttc2N1YmUgdXNpbmcg
RUdMIGFuZCBHQk0uCj4gCj4gVGhlIGJ1ZmZlciBpcyBhbGxvY2F0ZWQgdXNpbmcgZ2JtX3N1cmZh
Y2VfY3JlYXRlX3dpdGhfbW9kaWZpZXJzKCksCj4gYnV0IHRoZSBnYm0gaW1wbGVtZW50YXRpb24g
aXMgdmVuZG9yIHNwZWNpZmllZC4KPiAKPiBUaGVuIHRoZSBzdXJmYWNlIGlzIHBhc3NlZCB0byBl
Z2xDcmVhdGVXaW5kb3dTdXJmYWNlKCkuCj4gVGhlbiB0aGUgZm9ybWF0IGlzIG1hdGNoZWQgdXNp
bmcgZWdsR2V0Q29uZmlnQXR0cmliKCkgd2l0aCB0aGUKPiByZXR1cm5lZCBjb25maWdzLgo+IAo+
IEhlcmUgc3VwcG9ydCBvbiB0aGUgZ2JtIGFuZCBFR0wgaW1wbGVtZW50YXRpb24uCj4gCgpJcyB0
aGlzIGEgdXNlLWNhc2UgdGhhdCB3b3JrcyBvbiB5b3VyIHBsYXRmb3JtIHRvZGF5PwoKSSB3ZW50
IGFuZCBhc2tlZCBhcm91bmQuIEFuIEFybSBnYm0gaW1wbGVtZW50YXRpb24gc3VwcG9ydGluZyBB
RkJDCndpbGwgcmVqZWN0IEFGQkMgYWxsb2NhdGlvbnMgZm9yIG9yZGVycyBvdGhlciB0aGFuIChE
Uk0tY29udmVudGlvbikKQkdSLgoKVGhhbmtzLAotQnJpYW4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
