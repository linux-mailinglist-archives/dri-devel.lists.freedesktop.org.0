Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE78C9A07
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 10:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C5F89745;
	Thu,  3 Oct 2019 08:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe05::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C3689745
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 08:39:45 +0000 (UTC)
Received: from VI1PR08CA0118.eurprd08.prod.outlook.com (2603:10a6:800:d4::20)
 by HE1PR0802MB2348.eurprd08.prod.outlook.com (2603:10a6:3:c5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Thu, 3 Oct
 2019 08:39:41 +0000
Received: from DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::200) by VI1PR08CA0118.outlook.office365.com
 (2603:10a6:800:d4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.20 via Frontend
 Transport; Thu, 3 Oct 2019 08:39:40 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT018.mail.protection.outlook.com (10.152.20.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Thu, 3 Oct 2019 08:39:39 +0000
Received: ("Tessian outbound 0cf06bf5c60e:v33");
 Thu, 03 Oct 2019 08:39:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 23d9141348d62267
X-CR-MTA-TID: 64aa7808
Received: from 3594177c2351.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0E4398E1-065A-4D33-A7E2-EBD4CF1C95A0.1; 
 Thu, 03 Oct 2019 08:39:25 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3594177c2351.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Oct 2019 08:39:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQqd9L/560LWhgUNRd2Trh50NIwafQMFf5/epXbeJQWbPycLpoq0nMrJEZSoN3R7NpiQnmyxhObAHvM8Gvl02k+jBI7PBHFUOb3d1NQ0TjNZSEPJUicx7ne6B5CgLg/aYiM9ETyaG5IVbygjEdeFgRYF2cpkbNpuXbu2SZAwTzmE/FoSaVoXOBiY1dhOHy0BnOVnWfr3ZWYRzBcQ/ZSei5rozW+4G6Ee0sct/sHiFecpGgaVF5V7zG8DPcknHf316amR8tgaRyp95BrJPHdKS6A2GknNUQOnHAPwkv4O0kajARBs9U+N0OSLz5zQEn6WKd0E/LhK0LRZyVFajCd50Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3oK1Edr1Gq/FQtLRfSlO65CEqu9rJoosIIX2im8TFIY=;
 b=MQDmMyu6pvdNecZuNNiiqmQybBnBs5E6opS1vqP9NiJ81zYW9dfGNgw5zPDJyxuvVqYyrHO0lhi/2SU1gy77fmLnB4ZhKRMx1Py6c0Wpc9X4D8iIJfli06UUNcn/D5+HkrkQIa4DlXErZfkT08hHZVeA+urZRBuunLXbkJfURc4uP8/KQ6FnMHfnS81TTVB7gdJ0d05sjW9E0vr3I1dbFNNRDzeq9zSFz7ECIaxQpQyTSOtKEzEG2A28r/iQpB3+zobMQnszs4W3ssB5nL5Q2bTYhqD65irI53V+TVo3FCPuTdX7f8i4ZZf92C4WxGrnIHtEapYC8U213Bq3a92PAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB3013.eurprd08.prod.outlook.com (52.135.168.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 3 Oct 2019 08:39:23 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a%5]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 08:39:22 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v9 0/5] DMA-BUF Heaps (destaging ION)
Thread-Topic: [PATCH v9 0/5] DMA-BUF Heaps (destaging ION)
Thread-Index: AQHVeU5uJZ+g71n3wUCMjQwSMwttGKdImX4A
Date: Thu, 3 Oct 2019 08:39:22 +0000
Message-ID: <20191003083922.coty5zobkrku27bc@DESKTOP-E1NTVVP.localdomain>
References: <20191002182255.21808-1-john.stultz@linaro.org>
In-Reply-To: <20191002182255.21808-1-john.stultz@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.52]
x-clientproxiedby: LNXP265CA0063.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::27) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ecb512e2-975c-4200-0d81-08d747dd3ab0
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM6PR08MB3013:|AM6PR08MB3013:|HE1PR0802MB2348:
X-MS-Exchange-PUrlCount: 2
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0802MB234824BF5F606C05F40373FFF09F0@HE1PR0802MB2348.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 01792087B6
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(39840400004)(396003)(136003)(346002)(199004)(189003)(316002)(54906003)(6512007)(305945005)(58126008)(6916009)(3846002)(6116002)(1076003)(386003)(99286004)(6506007)(66946007)(102836004)(26005)(71190400001)(71200400001)(2906002)(6246003)(66476007)(76176011)(6436002)(186003)(6486002)(52116002)(256004)(229853002)(6306002)(66446008)(64756008)(66556008)(8676002)(9686003)(81156014)(81166006)(44832011)(476003)(66066001)(8936002)(4326008)(5660300002)(966005)(486006)(86362001)(11346002)(14454004)(446003)(7416002)(25786009)(7736002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3013;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 1W0TwyONWtAR6Z3vYDfswbxqy3ZEyfpKC7+KgrRSCxqkaEApbzH9S0blY87OkQ0QHNJHRmL4pEdx1tmKuVhqkV4UIgjTFtemTVD12RpnF/+/OwEJrxZhliCV88dr+j4a1DxqBzDYYEqGsfLtokH9DoN1l2c7oOXJJBnH9emtar+wHcmXnEz18bbE2WcU5EOAUUioNrxvBKUTex+vSXmK1zVMRH8B3PmCYDwHAGVJ85kKOHpYeplrIYjVmteOVkMt0a+UNy49MGWKSaDj4UeuxElDDKjnW4FTWarwZAWx8lA5haLq4zGA5auGvIxJZQ9l+xVrnso7j51I9Abvz7tDyJXZp8A6612QGF0M8mRveM1RItffVBlf9mnuvSiYZC+hcHD/ED6nwQlwTJvkhs9Veq/USmzlZvVJGxVMEijfub+f/USGJ8nENDEQfrWfbinlRCbImKuarW/OCLpA8nUPSA==
Content-ID: <A6F494B1BEFFCA499F1EABD7FAD3D198@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3013
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(346002)(396003)(189003)(199004)(86362001)(356004)(50466002)(25786009)(6506007)(316002)(6246003)(14454004)(81166006)(186003)(446003)(11346002)(2906002)(8746002)(6862004)(46406003)(58126008)(99286004)(8936002)(336012)(7736002)(4326008)(5660300002)(8676002)(76130400001)(305945005)(54906003)(66066001)(63350400001)(47776003)(70206006)(386003)(102836004)(22756006)(1076003)(6512007)(9686003)(6306002)(229853002)(966005)(76176011)(486006)(478600001)(3846002)(70586007)(23726003)(26005)(6116002)(97756001)(476003)(126002)(26826003)(6486002)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0802MB2348;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 73a1b691-34f1-438d-af8b-08d747dd309f
NoDisclaimer: True
X-Forefront-PRVS: 01792087B6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 674rTIGWXsBKEbmjSaJxoYXsUSZ2jtV8DoqtGsB3ae60hnuF16Gr7Ha87fMmtfz9XvLKOMN4pGPtH/8fAG6P32bTcH0KLqMxBtfa9eZTzx2W6N8RcT8A9exCVZ4d1zO9vz/2tigKxaCFH4eFI/gPqmhJ7yW55MiMles/Avt3MH2V65swDc9Ovjz91/0xCZCUUG35Q+ga2nAYOtn6v6MuETjdHc2xIzXsufNklJBpiArInrWNU85LNqImUoVmukbnZfxjVRXr7mhkDJNXn4mdbfwkAQnEUvT4uNY7/YdczVNTVjpv82UlHKY6F8pMM5mijGaY5e5E3d53+kJ5UY//4UemZARcaQo6i6pZ1j5FX+LlIZByh7rDoMulsUyDTavZcShdjZ9gT2bVfXR9rBm3wQBYFC8vP/12tVKBIOWOJQNRkVY36BMNIHFsKAMNNRzFjWkMKWsHuUsBbN2Ts+jhfQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2019 08:39:39.3474 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb512e2-975c-4200-0d81-08d747dd3ab0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2348
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3oK1Edr1Gq/FQtLRfSlO65CEqu9rJoosIIX2im8TFIY=;
 b=tiAKq/iyI3N8krCRwGrOJrP2wqG79tlAmzJli9LgHpCukojyc/R78+C8tshLeImk1wgMQ5IMeLYApcUnCE4Hoy5GnSk1xorsbNYRA2KcfeT7UWyY/fkXiaw6ADiZd9EjBb/4DOhJBNMTgPaOAt0VIV2S4L2W5cgA4bKqHrcNNPM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3oK1Edr1Gq/FQtLRfSlO65CEqu9rJoosIIX2im8TFIY=;
 b=tiAKq/iyI3N8krCRwGrOJrP2wqG79tlAmzJli9LgHpCukojyc/R78+C8tshLeImk1wgMQ5IMeLYApcUnCE4Hoy5GnSk1xorsbNYRA2KcfeT7UWyY/fkXiaw6ADiZd9EjBb/4DOhJBNMTgPaOAt0VIV2S4L2W5cgA4bKqHrcNNPM=
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
Cc: Hillf Danton <hdanton@sina.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F . Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 nd <nd@arm.com>, Alistair Strachan <astrachan@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9obiwKCk9uIFdlZCwgT2N0IDAyLCAyMDE5IGF0IDA2OjIyOjUwUE0gKzAwMDAsIEpvaG4g
U3R1bHR6IHdyb3RlOgo+IEhlcmUgaXMgeWV0IGFub3RoZXIgcGFzcyBhdCB0aGUgZG1hLWJ1ZiBo
ZWFwcyBwYXRjaHNldCBBbmRyZXcKPiBhbmQgSSBoYXZlIGJlZW4gd29ya2luZyBvbiB3aGljaCB0
cmllcyB0byBkZXN0YWdlIGEgZmFpciBjaHVuawo+IG9mIElPTiBmdW5jdGlvbmFsaXR5Lgo+IAo+
IFRoZSBwYXRjaHNldCBpbXBsZW1lbnRzIHBlci1oZWFwIGRldmljZXMgd2hpY2ggY2FuIGJlIG9w
ZW5lZAo+IGRpcmVjdGx5IGFuZCB0aGVuIGFuIGlvY3RsIGlzIHVzZWQgdG8gYWxsb2NhdGUgYSBk
bWFidWYgZnJvbSB0aGUKPiBoZWFwLgo+IAo+IFRoZSBpbnRlcmZhY2UgaXMgc2ltaWxhciwgYnV0
IG11Y2ggc2ltcGxlciB0aGVuIElPTnMsIG9ubHkKPiBwcm92aWRpbmcgYW4gQUxMT0MgaW9jdGwu
Cj4gCj4gQWxzbywgSSd2ZSBwcm92aWRlZCByZWxhdGl2ZWx5IHNpbXBsZSBzeXN0ZW0gYW5kIGNt
YSBoZWFwcy4KPiAKPiBJJ3ZlIGJvb3RlZCBhbmQgdGVzdGVkIHRoZXNlIHBhdGNoZXMgd2l0aCBB
T1NQIG9uIHRoZSBIaUtleTk2MAo+IHVzaW5nIHRoZSBrZXJuZWwgdHJlZSBoZXJlOgo+ICAgaHR0
cHM6Ly9naXQubGluYXJvLm9yZy9wZW9wbGUvam9obi5zdHVsdHovYW5kcm9pZC1kZXYuZ2l0L2xv
Zy8/aD1kZXYvZG1hLWJ1Zi1oZWFwCj4gCj4gQW5kIHRoZSB1c2Vyc3BhY2UgY2hhbmdlcyBoZXJl
Ogo+ICAgaHR0cHM6Ly9hbmRyb2lkLXJldmlldy5nb29nbGVzb3VyY2UuY29tL2MvZGV2aWNlL2xp
bmFyby9oaWtleS8rLzkwOTQzNgo+IAo+IENvbXBhcmVkIHRvIElPTiwgdGhpcyBwYXRjaHNldCBp
cyBtaXNzaW5nIHRoZSBzeXN0ZW0tY29udGlnLAo+IGNhcnZlb3V0IGFuZCBjaHVuayBoZWFwcywg
YXMgSSBkb24ndCBoYXZlIGEgZGV2aWNlIHRoYXQgdXNlcwo+IHRob3NlLCBzbyBJJ20gdW5hYmxl
IHRvIGRvIG11Y2ggdXNlZnVsIHZhbGlkYXRpb24gdGhlcmUuCj4gQWRkaXRpb25hbGx5IHdlIGhh
dmUgbm8gdXBzdHJlYW0gdXNlcnMgb2YgY2h1bmsgb3IgY2FydmVvdXQsCj4gYW5kIHRoZSBzeXN0
ZW0tY29udGlnIGhhcyBiZWVuIGRlcHJlY2F0ZWQgaW4gdGhlIGNvbW1vbi9hbmRvaWQtKgo+IGtl
cm5lbHMsIHNvIHRoaXMgc2hvdWxkIGJlIG9rLgo+IAo+IEkndmUgYWxzbyByZW1vdmVkIHRoZSBz
dGF0cyBhY2NvdW50aW5nLCBzaW5jZSBhbnkgc3VjaCBhY2NvdW50aW5nCj4gc2hvdWxkIGJlIGlt
cGxlbWVudGVkIGJ5IGRtYS1idWYgY29yZSBvciB0aGUgaGVhcHMgdGhlbXNlbHZlcy4KPiAKPiBO
ZXcgaW4gdjk6Cj4gKiBSZW1vdmluZyBuZWVkbGVzcyBjaGVjayBpbiBjbWEgaGVhcCAobm90ZWQg
YnkgQnJpYW4gU3RhcmtleSkKPiAqIFJlbmFtZSBkbWFfaGVhcF9nZXRfZGF0YS0+ZG1hX2hlYXBf
Z2V0X2RydmRhdGEgKHN1Z2dlc3RlZCBieQo+ICAgSGlsZiBEYW50b24pCj4gKiBDaGVjayBzaWdu
YWxzIGFmdGVyIGNsZWFyaW5nIG1lbW9yeSBwYWdlcyB0byBhdm9pZCBkb2luZwo+ICAgbmVlZGxl
c3Mgd29yayBpZiB0aGUgdGFzayBpcyBraWxsZWQgKHN1Z2dlc3RlZCBieSBIaWxmKQo+ICogQmV0
dGVyIHRlc3QgZXJyb3IgcmVwb3J0aW5nIChzdWdnZXN0ZWQgZCBieSBCcmlhbikKPiAqIE90aGVy
IG1pbm9yIGNsZWFudXBzIChzdWdnZXN0ZWQgYnkgQnJpYW4pCj4gCj4gVGhvdWdodHMgYW5kIGZl
ZWRiYWNrIHdvdWxkIGJlIGdyZWF0bHkgYXBwcmVjaWF0ZWQhCgpMb29rcyBnb29kIHRvIG1lISBQ
bGVhc2UgZmVlbCBmcmVlIHRvIGFkZCBteSByLWIgdG8gdGhlIHJlbWFpbmluZwpwYXRjaGVzLgoK
VGhhbmtzIGFnYWluIGZvciBtb3ZpbmcgdGhpcyBmb3J3YXJkcy4KCi1CcmlhbgoKPiAKPiB0aGFu
a3MKPiAtam9obgo+IAo+IENjOiBMYXVyYSBBYmJvdHQgPGxhYmJvdHRAcmVkaGF0LmNvbT4KPiBD
YzogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+Cj4gQ2M6
IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gQ2M6IExpYW0gTWFyayA8
bG1hcmtAY29kZWF1cm9yYS5vcmc+Cj4gQ2M6IFByYXRpayBQYXRlbCA8cHJhdGlrcEBjb2RlYXVy
b3JhLm9yZz4KPiBDYzogQnJpYW4gU3RhcmtleSA8QnJpYW4uU3RhcmtleUBhcm0uY29tPgo+IENj
OiBWaW5jZW50IERvbm5lZm9ydCA8VmluY2VudC5Eb25uZWZvcnRAYXJtLmNvbT4KPiBDYzogU3Vk
aXB0byBQYXVsIDxTdWRpcHRvLlBhdWxAYXJtLmNvbT4KPiBDYzogQW5kcmV3IEYuIERhdmlzIDxh
ZmRAdGkuY29tPgo+IENjOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGluZnJhZGVhZC5vcmc+Cj4g
Q2M6IENoZW5ibyBGZW5nIDxmZW5nY0Bnb29nbGUuY29tPgo+IENjOiBBbGlzdGFpciBTdHJhY2hh
biA8YXN0cmFjaGFuQGdvb2dsZS5jb20+Cj4gQ2M6IEhyaWR5YSBWYWxzYXJhanUgPGhyaWR5YUBn
b29nbGUuY29tPgo+IENjOiBIaWxsZiBEYW50b24gPGhkYW50b25Ac2luYS5jb20+Cj4gQ2M6IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiAKPiBBbmRyZXcgRi4gRGF2aXMgKDEpOgo+
ICAgZG1hLWJ1ZjogQWRkIGRtYS1idWYgaGVhcHMgZnJhbWV3b3JrCj4gCj4gSm9obiBTdHVsdHog
KDQpOgo+ICAgZG1hLWJ1ZjogaGVhcHM6IEFkZCBoZWFwIGhlbHBlcnMKPiAgIGRtYS1idWY6IGhl
YXBzOiBBZGQgc3lzdGVtIGhlYXAgdG8gZG1hYnVmIGhlYXBzCj4gICBkbWEtYnVmOiBoZWFwczog
QWRkIENNQSBoZWFwIHRvIGRtYWJ1ZiBoZWFwcwo+ICAga3NlbGZ0ZXN0czogQWRkIGRtYS1oZWFw
IHRlc3QKPiAKPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDE4ICsrCj4gIGRyaXZlcnMvZG1hLWJ1Zi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAg
ICB8ICAxMSArCj4gIGRyaXZlcnMvZG1hLWJ1Zi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAg
ICB8ICAgMiArCj4gIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtaGVhcC5jICAgICAgICAgICAgICAgICAg
ICB8IDI1MCArKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9LY29uZmln
ICAgICAgICAgICAgICAgICB8ICAxNCArCj4gIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9NYWtlZmls
ZSAgICAgICAgICAgICAgICB8ICAgNCArCj4gIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9jbWFfaGVh
cC5jICAgICAgICAgICAgICB8IDE2OSArKysrKysrKysrKwo+ICBkcml2ZXJzL2RtYS1idWYvaGVh
cHMvaGVhcC1oZWxwZXJzLmMgICAgICAgICAgfCAyNjYgKysrKysrKysrKysrKysrKysrCj4gIGRy
aXZlcnMvZG1hLWJ1Zi9oZWFwcy9oZWFwLWhlbHBlcnMuaCAgICAgICAgICB8ICA1NSArKysrCj4g
IGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jICAgICAgICAgICB8IDEyMiArKysr
KysrKwo+ICBpbmNsdWRlL2xpbnV4L2RtYS1oZWFwLmggICAgICAgICAgICAgICAgICAgICAgfCAg
NTkgKysrKwo+ICBpbmNsdWRlL3VhcGkvbGludXgvZG1hLWhlYXAuaCAgICAgICAgICAgICAgICAg
fCAgNTUgKysrKwo+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9kbWFidWYtaGVhcHMvTWFrZWZp
bGUgfCAgIDkgKwo+ICAuLi4vc2VsZnRlc3RzL2RtYWJ1Zi1oZWFwcy9kbWFidWYtaGVhcC5jICAg
ICAgfCAyMzggKysrKysrKysrKysrKysrKwo+ICAxNCBmaWxlcyBjaGFuZ2VkLCAxMjcyIGluc2Vy
dGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZG1hLWJ1Zi9kbWEtaGVhcC5j
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2RtYS1idWYvaGVhcHMvS2NvbmZpZwo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9kbWEtYnVmL2hlYXBzL01ha2VmaWxlCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2RtYS1idWYvaGVhcHMvY21hX2hlYXAuYwo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9kbWEtYnVmL2hlYXBzL2hlYXAtaGVscGVycy5jCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2RtYS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmgKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L2RtYS1oZWFwLmgKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGluY2x1ZGUvdWFwaS9saW51eC9kbWEtaGVhcC5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9kbWFidWYtaGVhcHMvTWFrZWZpbGUKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2RtYWJ1Zi1oZWFwcy9kbWFidWYt
aGVhcC5jCj4gCj4gLS0gCj4gMi4xNy4xCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
