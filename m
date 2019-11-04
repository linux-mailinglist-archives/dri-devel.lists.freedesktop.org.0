Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5D3EE66D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 18:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79A76E7AC;
	Mon,  4 Nov 2019 17:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8696E7AC
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 17:44:05 +0000 (UTC)
Received: from VI1PR08CA0177.eurprd08.prod.outlook.com (2603:10a6:800:d1::31)
 by DBBSPR01MB0008.eurprd08.prod.outlook.com (2603:10a6:10:de::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.24; Mon, 4 Nov
 2019 17:44:02 +0000
Received: from AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::201) by VI1PR08CA0177.outlook.office365.com
 (2603:10a6:800:d1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2408.24 via Frontend
 Transport; Mon, 4 Nov 2019 17:44:02 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT005.mail.protection.outlook.com (10.152.16.146) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2387.20 via Frontend Transport; Mon, 4 Nov 2019 17:44:02 +0000
Received: ("Tessian outbound e4042aced47b:v33");
 Mon, 04 Nov 2019 17:43:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dfdf986618b3fef9
X-CR-MTA-TID: 64aa7808
Received: from 29bfcbd2ad7b.2 (cr-mta-lb-1.cr-mta-net [104.47.12.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 92DA7124-E5F3-43DC-A178-6ECDE44F9952.1; 
 Mon, 04 Nov 2019 17:43:52 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 29bfcbd2ad7b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Nov 2019 17:43:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVedKjW5Ntc5maBcEMImOfwTSFE9WGCOphB1RLwceGTS8fqcUi/kJWvLo6NQCbOKj9m2M6ed/dk9fZv+aI1tZz6GLpVmlk2WIRwa5t0037UD0ZNH/iSdX0vaUQSSpmvSxz73WCl8QAqhIExoTPAqywePY96fKS2+W/1LclH3OadAZxMC7UD+32tYZuYUSe1aKAdYn16OGkKyAKo+5RVps/EiBLYr/K9rzCUfOU0Vy+Nuq/XPqdJ2MpW8fvmwUYRumhPVSHc7gksTkv61/6zeBnzTtQnHFKIgVGUr7njFxGiJ321wQHlgmy270V1Xq4/aH5wYEVUuTIe3408dyUgE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcVtBvQCtFbUqgEC4H2aJKM4AdSlID3VL+7XCiA8FAg=;
 b=l01nb1wG8AEzkNAjYcM1KJJ766sHiZNHTTZiZvz77xisrJrrDmGUBNzvL99pFEFewy5/29fHLs+SmnpKu9LoRB3IJiggXADqZCzh1QRwtCPUMgIwp617iiJtVqMhOrdZ+tNAtgMJnAyyYhjXRGF5Seumb7QUJ509VDnnbWfpHKtT9xAto2Qwe7AuE8RtDSk1FA9evPgZcdFu8BxcQG3aWGzsNeTnYGJD4rznCK4cksYluKhnSn9gjWMnbVqw7c7MMe/rQTJW0peH9m+fMJP7HnCwRC1PCfIm6aX5HrWHhOhJcSkWdTXFJ4WD0qVshIw0zwPIISeU1D2YBeUmQsJhyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB3190.eurprd08.prod.outlook.com (52.135.164.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Mon, 4 Nov 2019 17:43:51 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::6804:f05f:47c0:d9e]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::6804:f05f:47c0:d9e%4]) with mapi id 15.20.2408.024; Mon, 4 Nov 2019
 17:43:51 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH v14 1/5] dma-buf: Add dma-buf heaps framework
Thread-Topic: [PATCH v14 1/5] dma-buf: Add dma-buf heaps framework
Thread-Index: AQHVkP1N8JZOPDbdaESLvvbvV23eEqd60gMAgABuHYCAAAywgA==
Date: Mon, 4 Nov 2019 17:43:51 +0000
Message-ID: <20191104174341.m6hjzog2vibc3ek3@DESKTOP-E1NTVVP.localdomain>
References: <20191101214238.78015-1-john.stultz@linaro.org>
 <20191101214238.78015-2-john.stultz@linaro.org>
 <20191104102410.66wlyoln5ahlgkem@DESKTOP-E1NTVVP.localdomain>
 <CAPM=9tydXxV-6++HkkA+JX9GPWE1sN_8CGVCVn-Mwfgfzcn=hg@mail.gmail.com>
In-Reply-To: <CAPM=9tydXxV-6++HkkA+JX9GPWE1sN_8CGVCVn-Mwfgfzcn=hg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.51]
x-clientproxiedby: DM5PR15CA0047.namprd15.prod.outlook.com
 (2603:10b6:4:4b::33) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f77509dd-1045-4836-525a-08d7614e947f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3190:|AM6PR08MB3190:|DBBSPR01MB0008:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DBBSPR01MB00084708C890FB147F2283E2F07F0@DBBSPR01MB0008.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 0211965D06
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(199004)(189003)(99286004)(66946007)(6916009)(446003)(66476007)(64756008)(66556008)(6512007)(54906003)(86362001)(6246003)(6506007)(486006)(44832011)(305945005)(71190400001)(386003)(71200400001)(478600001)(186003)(6436002)(26005)(7736002)(4326008)(2906002)(3846002)(81156014)(81166006)(14454004)(8676002)(1411001)(76176011)(14444005)(1076003)(476003)(25786009)(7416002)(9686003)(66446008)(58126008)(11346002)(316002)(8936002)(102836004)(6486002)(229853002)(52116002)(66066001)(256004)(5660300002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3190;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: k+ncSp4ZXizGB7xEPil0t4W40NpcqwECtS4c930ret+J2RvYVEMBwXMx18//tlG0ua9IbwcjkOc/8X1m0ufhyVDA/gYDfmY3bIoVlCAMVRtexqY4FfS4iHlSv1KOYPh7u28+PHvzPGNPhvmwa/TAAoamyJQ9m8XvXpNOEI+1LBeIlXFKf2Nmnf98JSxyg3iWQa5lPjgAoSGeZpXRVrVhkd02Rtc8GUklv+SQWwhYJ+1lmuT2KdbWx5JlyqFBCbdVvOKyrN8CTADOpW8SiSygnacvk/KLftZtqlHE/Gxd3qSbpqHKJOFl50i0Yf0Xyp04nKEbYBi7z/exKdq3tWl79QEmNEpiNlQQq1SSMUnCCllPJbRW5Vu4GnxAY1D1vC/ernltUqubjEqrrDWzMrB2sQXzuyiGzvO3bR4Jd7+1/LPy+hbEMo3DZPQWWN7u5ClK
Content-ID: <E4653010D2069741BCCD1D0A03675369@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3190
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(1110001)(339900001)(189003)(199004)(2906002)(50466002)(99286004)(486006)(47776003)(26826003)(6246003)(70586007)(70206006)(1076003)(5660300002)(105606002)(9686003)(1411001)(6512007)(54906003)(25786009)(6862004)(316002)(6486002)(23726003)(3846002)(6116002)(356004)(386003)(6506007)(102836004)(46406003)(7736002)(478600001)(305945005)(22756006)(76130400001)(86362001)(76176011)(58126008)(26005)(36906005)(8936002)(4326008)(14444005)(81156014)(229853002)(81166006)(66066001)(8746002)(336012)(11346002)(8676002)(476003)(446003)(126002)(186003)(14454004)(97756001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBSPR01MB0008;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 075c4fbb-b71c-43c6-3291-08d7614e8da3
NoDisclaimer: True
X-Forefront-PRVS: 0211965D06
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5pCMHGHD7EibntmYtgjY9H1PgCnCM2pgIeLqlkbdhnQiPdwUqB4hC1/S2IG8vBPVMnIR/1ysd6fQ5dEsfRGCCgjs1sLSHAxpLjP+4tNjNzfb3XWBxiCCFq6hobSyXe4D5JPcc11kfyUXUtU5J8ib0bcIdpMC/Abz08EcvKx8exVybs93zApaKflzQgLEmuTwvvbXybW02g2jenQ1vVJvQxrGcjSdVof2/xHYm4g1tHoSlC17/kYth9trG62FzU1w0kBO92ataooNJfpRL9Z5d1IkgM30V42//54yLSvuJzO6FDDDpAOw4PQ0mPQg5Msj7hLO9ht1+v+2dGhK0FFu0xEFlmIue6FI6LGVacL+UTeUFNgmkbXRkMk1sW6pE+CIE9DvVfdJkrlhy1C4lZUNU2XZJ7dPaM6XxqIlknFluK3mhL6YiIEn6wczg4Xo/MhA
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2019 17:44:02.0898 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f77509dd-1045-4836-525a-08d7614e947f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBSPR01MB0008
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcVtBvQCtFbUqgEC4H2aJKM4AdSlID3VL+7XCiA8FAg=;
 b=L4cY8HfCjZbcbpjipyn+lJ3WVCEaKG8BOANNuADG0vqbF8xuW/Czm1HhOaj2BykGMagt8sRFEWM26XMBQQWtJ8VUq8OBwj5oj9XIClqPODaPENUc7ndk4z6f0fzkk7iy2Zo74XPkORGBrN2esbCZHgldCmQIBJKHhwj+mjUi4Fk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcVtBvQCtFbUqgEC4H2aJKM4AdSlID3VL+7XCiA8FAg=;
 b=L4cY8HfCjZbcbpjipyn+lJ3WVCEaKG8BOANNuADG0vqbF8xuW/Czm1HhOaj2BykGMagt8sRFEWM26XMBQQWtJ8VUq8OBwj5oj9XIClqPODaPENUc7ndk4z6f0fzkk7iy2Zo74XPkORGBrN2esbCZHgldCmQIBJKHhwj+mjUi4Fk=
X-Mailman-Original-Authentication-Results: spf=fail (sender IP is 63.35.35.123)
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
 Sandeep Patil <sspatil@google.com>, Alistair Strachan <astrachan@google.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F. Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 nd <nd@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwKCk9uIFR1ZSwgTm92IDA1LCAyMDE5IGF0IDAyOjU4OjE3QU0gKzEwMDAsIERhdmUg
QWlybGllIHdyb3RlOgo+IE9uIE1vbiwgNCBOb3YgMjAxOSBhdCAyMDoyNCwgQnJpYW4gU3Rhcmtl
eSA8QnJpYW4uU3RhcmtleUBhcm0uY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBKb2huLAo+ID4KPiA+
IE9uIEZyaSwgTm92IDAxLCAyMDE5IGF0IDA5OjQyOjM0UE0gKzAwMDAsIEpvaG4gU3R1bHR6IHdy
b3RlOgo+ID4gPiBGcm9tOiAiQW5kcmV3IEYuIERhdmlzIiA8YWZkQHRpLmNvbT4KPiA+ID4KPiA+
ID4gVGhpcyBmcmFtZXdvcmsgYWxsb3dzIGEgdW5pZmllZCB1c2Vyc3BhY2UgaW50ZXJmYWNlIGZv
ciBkbWEtYnVmCj4gPiA+IGV4cG9ydGVycywgYWxsb3dpbmcgdXNlcmxhbmQgdG8gYWxsb2NhdGUg
c3BlY2lmaWMgdHlwZXMgb2YgbWVtb3J5Cj4gPiA+IGZvciB1c2UgaW4gZG1hLWJ1ZiBzaGFyaW5n
Lgo+ID4gPgo+ID4gPiBFYWNoIGhlYXAgaXMgZ2l2ZW4gaXRzIG93biBkZXZpY2Ugbm9kZSwgd2hp
Y2ggYSB1c2VyIGNhbiBhbGxvY2F0ZQo+ID4gPiBhIGRtYS1idWYgZmQgZnJvbSB1c2luZyB0aGUg
RE1BX0hFQVBfSU9DX0FMTE9DLgo+ID4gPgo+ID4gPiBBZGRpdGlvbmFsbHkgc2hvdWxkIHRoZSBp
bnRlcmZhY2UgZ3JvdyBpbiB0aGUgZnV0dXJlLCB3ZSBoYXZlIGEKPiA+ID4gRE1BX0hFQVBfSU9D
X0dFVF9GRUFUVVJFUyBpb2N0bCB3aGljaCBjYW4gcmV0dXJuIGZ1dHVyZSBmZWF0dXJlCj4gPiA+
IGZsYWdzLgo+ID4KPiA+IFRoZSB1c2Vyc3BhY2UgcGF0Y2ggZG9lc24ndCB1c2UgdGhpcyAtIGFu
ZCB0aGVyZSdzIG5vIGluZGljYXRpb24gb2YKPiA+IHdoYXQgaXQncyBpbnRlbmRlZCB0byBhbGxv
dyBpbiB0aGUgZnV0dXJlLiBJIG1pc3NlZCB0aGUgZGlzY3Vzc2lvbgo+ID4gYWJvdXQgaXQsIGRv
IHlvdSBoYXZlIGEgbGluaz8KPiA+Cj4gPiBJIHRob3VnaHQgdGhlIHByZWZlcnJlZCBhcHByb2Fj
aCB3YXMgdG8gYWRkIHRoZSBuZXcgaW9jdGwgb25seSB3aGVuIHdlCj4gPiBuZWVkIGl0LCBhbmQg
bmV3IHVzZXJzcGFjZSBvbiBvbGQga2VybmVscyB3aWxsIGdldCAiRU5PU1lTIiB0byBrbm93Cj4g
PiB0aGF0IHRoZSBrZXJuZWwgZG9lc24ndCBzdXBwb3J0IGl0Lgo+IAo+IFRoaXMgd29ya3Mgb25j
ZSwgZXhwYW5kIHRoZSBpbnRlcmZhY2UgMyBvciA0IHRpbWVzIHdpdGggbm8gZmVhdHVyZXMKPiBp
b2N0bCwgYW5kIHlvdSBzdGFydCBiZWluZyBob3N0aWxlIHRvIHVzZXJzcGFjZSwgd2hpY2ggZmVh
dHVyZSBkb2VzCj4gRU5PU1lTIG1lYW4gaXNuJ3Qgc3VwcG9ydGVkIGV0Yy4KClNvcnJ5LCBwZXJo
YXBzIEkgd2Fzbid0IGNsZWFyIChvciBJIG1pc3VuZGVyc3RhbmQgd2hhdCB5b3UncmUgc2F5aW5n
CmFib3V0IHdvcmtpbmcgb25seSBvbmNlKS4gSSdtIG5vdCBhZ2FpbnN0IGFkZGluZyBhIGdldF9m
ZWF0dXJlcyBpb2N0bCwKSSBqdXN0IGRvbid0IHNlZSB3aHkgd2UnZCBhZGQgaXQgYmVmb3JlIHdl
IGhhdmUgYW55IGZlYXR1cmVzPwoKV2hlbiB3ZSBnYWluIHRoZSBmaXJzdCAiZmVhdHVyZSIsIGNh
bid0IHdlIGFkZCB0aGUgZ2V0X2ZlYXR1cmVzIGlvY3RsCnRoZW4/IEZvciBGdXR1cmUgU1cgdGhh
dCBrbm93cyBhYm91dCBGdXR1cmUgZmVhdHVyZXMsICJFTk9TWVMiIHdpbGwKYWx3YXlzIG1lYW4g
Im5vIGZlYXR1cmVzIi4gSWYgaXQgZG9lc24ndCBnZXQgRU5PU1lTLCB0aGVuIGl0IGNhbiB1c2UK
dGhlIGlvY3RsIHRvIGZpbmQgb3V0IHdoYXQgZmVhdHVyZXMgaXQgaGFzLgoKT3RoZXJ3aXNlIHdl
J3JlIGFkZGluZyBhbiBpb2N0bCB3aGljaCBkb2Vzbid0IGRvIGFueXRoaW5nLCBiYXNlZCBvbgp0
aGUgYXNzdW1wdGlvbiB0aGF0IGluIHRoZSBmdXR1cmUgaXQgX3dpbGxfIGRvIHNvbWV0aGluZy4u
LiBidXQgd2UKZG9uJ3Qga25vdyB0aGF0IHRoYXQgaXMgeWV0Li4uIGJ1dCB3ZSdyZSBwcmV0dHkg
c3VyZSB3aGF0ZXZlciBpdCB3aWxsCmRvIGNhbiBiZSBkZXNjcmliZWQgd2l0aCBhIHU2ND8KCldo
eSBub3Qgd2FpdCB1bnRpbCB3ZSBrbm93IHdoYXQgd2Ugd2FudCBpdCBmb3IsIGFuZCB0aGVuIGlt
cGxlbWVudCBpdAp3aXRoIGFuIGludGVyZmFjZSB3aGljaCB3ZSBrbm93IGlzIGFwcHJvcHJpYXRl
IGF0IHRoYXQgdGltZT8KCj4gCj4gTmV4dCB1c2Vyc3BhY2Ugc3RhcnRzIHRvIHJlbHkgb24ga2Vy
bmVsIHZlcnNpb24sIGJ1dCB0aGVuIHNvbWVvbmUKPiBiYWNrcG9ydHMgYSBmZWF0dXJlLCBkb3du
IHRoZSByYWJiaXQgaG9sZSB3ZSBnby4KPiAKCkkgc3VwcG9zZSB0aGF0IGFkZGluZyB0aGUgZmVh
dHVyZSBpb2N0bCBsYXRlciB3b3VsZCBtZWFuIHRoYXQgaXQgbWlnaHQKYmUgcG9zc2libGUgdG8g
YmFja3BvcnQgYSBmZWF0dXJlIHdpdGhvdXQgYWxzbyBiYWNrcG9ydGluZyB0aGUgaW9jdGwsCmRl
cGVuZGluZyBvbiBob3cgdGhlIHBhdGNoZXMgYXJlIHNwbGl0IHVwLiBJIHRoaW5rIGl0IHdvdWxk
IGJlIHByZXR0eQpoYXJkIHRvIGRvIGFjY2lkZW50YWxseSB0aG91Z2guCgpUaGFua3MsCi1Ccmlh
bgoKPiBCZSBuaWNlIHRvIHVzZXJzcGFjZSBnaXZlIHRoZW0gYSBmZWF0dXJlcyBpb2N0bCB0aGV5
IGNhbiB1c2UgdG8gZmlndXJlCj4gb3V0IGluIGFkdmFuY2Ugd2hpY2ggb2YgdGhlIDQgdWFwaXMg
dGhlIGtlcm5lbCBzdXBwb3J0cy4KPiAKPiBEYXZlLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
