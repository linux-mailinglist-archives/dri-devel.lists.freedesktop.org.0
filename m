Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF9AFA065
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 02:43:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5FB89DC5;
	Wed, 13 Nov 2019 01:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20089.outbound.protection.outlook.com [40.107.2.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894D689DC5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 01:43:08 +0000 (UTC)
Received: from VI1PR0802CA0043.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::29) by DB8PR08MB4204.eurprd08.prod.outlook.com
 (2603:10a6:10:b1::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20; Wed, 13 Nov
 2019 01:43:05 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::205) by VI1PR0802CA0043.outlook.office365.com
 (2603:10a6:800:a9::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.23 via Frontend
 Transport; Wed, 13 Nov 2019 01:43:04 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.21 via Frontend Transport; Wed, 13 Nov 2019 01:43:04 +0000
Received: ("Tessian outbound 0cf06bf5c60e:v33");
 Wed, 13 Nov 2019 01:43:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 99c3a3a104a1d6f9
X-CR-MTA-TID: 64aa7808
Received: from 3fbf6d4a83b9.2 (cr-mta-lb-1.cr-mta-net [104.47.4.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D6344E60-39AE-400C-AF8D-24E5C18C4F0B.1; 
 Wed, 13 Nov 2019 01:42:57 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2055.outbound.protection.outlook.com [104.47.4.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3fbf6d4a83b9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Nov 2019 01:42:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CU6VG+yMnocGlyo2zSS6ePsOa+FdujKihqZJjmbtfyupd6LKpKbsUQw1uzHiqKrXt5D6cyehAT+hMYL/BQz03VQ1ppYHP12lt2d09T1QS54fSwBqD+r/r4Ypf4znDg2TCOl7nQxgZ/SmlECu9aAIX/FBExR9mIqVoQPLvx+Trp8l03tWmq+HTZ0o4wml8ID4SneaBAmLto5o6uQiXR1qF1ATa9srPFC+FOeUz1ZxRSLDN/fGVJFDA5NSe6Q/1EB6SXf6BdRmOTB2gKKIy1zuKxTCJ5BV0TstCwOsRmEZzpYFdjQ6yBlLGzCo0pIwXpqi+fZeFFo2w9BLGgIuc/0ZyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkG1ImhIGiNFuKJ4N1wJzCLC3ucWKoiBHe9I+25KRqU=;
 b=OW0kFITBt+pHHIRQsmLWHsm9gyFil9Cisv+YCu4Jlt8HyUUQTVIko7FGK6+37chyBBDExxCmp7FV+imXgkm9QGBs7eL+0o3Pj4yk4mDptr9jL3+59R1HULqHwXVPvgjzRBd5cf1qiSY5SnRBbhqTupx766XjSKrd4aAgtD61mpCflzs5UCMJJ3IPk3iNbuPNccJ80N2dZE3C72dungfwIMb+NLmZUDQrCanMELzbDoQhfA1gKS10WMNgm8NV2WiEnowHf+Yqq8Ib60l+sWG0xfv17bD0TfZ4FGMFju+NIRmY4ddQzjfiYz+Y2rCl45YV059jaW3TbCdbaHwOwZUdvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5038.eurprd08.prod.outlook.com (10.255.159.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Wed, 13 Nov 2019 01:42:56 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2451.023; Wed, 13 Nov 2019
 01:42:56 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 5/5] drm/komeda: add rate limiting disable to
 err_verbosity
Thread-Topic: [PATCH v2 5/5] drm/komeda: add rate limiting disable to
 err_verbosity
Thread-Index: AQHVlWB9P8i6ygR2EU2LzpskSypZZ6eGJX8AgAFh7gCAAFqaAIAAeoeA
Date: Wed, 13 Nov 2019 01:42:56 +0000
Message-ID: <20191113014249.GA2746@jamwan02-TSP300>
References: <20191107114155.54307-1-mihail.atanassov@arm.com>
 <20191107114155.54307-6-mihail.atanassov@arm.com>
 <20191111155313.iiz37se2f7526ehp@e110455-lin.cambridge.arm.com>
 <39367348.R9gcQaf2xt@e123338-lin>
 <CAKMK7uHB-mHmuBA-VkKuhUSRHQRu0wvHHJA+a=Q1fXSXaJgrpw@mail.gmail.com>
In-Reply-To: <CAKMK7uHB-mHmuBA-VkKuhUSRHQRu0wvHHJA+a=Q1fXSXaJgrpw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0058.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::22) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a390edac-c5fb-4ad5-b69a-08d767dad3b9
X-MS-TrafficTypeDiagnostic: VE1PR08MB5038:|VE1PR08MB5038:|DB8PR08MB4204:
X-MS-Exchange-PUrlCount: 2
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB4204F0B828ECA7829A374EB5B3760@DB8PR08MB4204.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3631;OLM:3631;
x-forefront-prvs: 0220D4B98D
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(366004)(396003)(136003)(39860400002)(346002)(376002)(199004)(189003)(446003)(2906002)(966005)(478600001)(1076003)(66946007)(25786009)(64756008)(71200400001)(71190400001)(6486002)(66476007)(66556008)(66446008)(99286004)(8936002)(11346002)(256004)(14444005)(6506007)(76176011)(386003)(52116002)(33716001)(4326008)(53546011)(55236004)(102836004)(186003)(6916009)(6116002)(305945005)(14454004)(7736002)(6436002)(3846002)(58126008)(6246003)(26005)(6306002)(6512007)(476003)(9686003)(316002)(54906003)(86362001)(81166006)(33656002)(486006)(66066001)(8676002)(229853002)(81156014)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5038;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: qX1KD/e/sL2gIkO9A5kWxGsEbVyxV7LLu8bm845JPjflI/PcwZGUTQB7hl7AXQ9KQixrXv8j2vmd8efKXrcigmjE8ZPjZ4mGeV5SbMmNffA9luMX0GUhaOt5Q97Luc6OiRJptGYL5Q/gUSK0f1wcICpUr+rXZK6a4gPw0AZ6+ffMNd/sJTdxiKO7n+ZMw9Pi1Jec5Cv2M32HQPeP0eMEy3fVdKVE/qeCr58A5X1yIPVkaxm5vSCdxWcFu0snfpfReTTcvVvrgaYvE4a7xyhYJNGttv5Zku03uhvTNU/AYcOSfdRA3ZJG2sygnaF5UQ+btw5BqKCEvgrhkxHihx+V3UtxOSUUf06q4iZjr+sUHNzwzCY3pzDYMa4ndKFYfOqItpMCaW3OSxFW5A7s8jHcFF3/iIx2d9GpfUadEKkTdsRX5hYREI6O6F0TgfS4JuLXg/eCxUDtJQZSIRfawkd2rKDw4NEbPTYnXQHme2TanSw=
Content-ID: <B15CFA683B12444AA0EB40E6D119BFCA@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5038
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(136003)(346002)(376002)(39860400002)(396003)(1110001)(339900001)(199004)(189003)(76130400001)(54906003)(86362001)(186003)(105606002)(107886003)(6486002)(6116002)(305945005)(66066001)(70586007)(53546011)(316002)(102836004)(6862004)(36906005)(14444005)(58126008)(229853002)(26826003)(356004)(23676004)(33716001)(22756006)(6246003)(70206006)(478600001)(7736002)(50466002)(336012)(2486003)(25786009)(446003)(8936002)(6512007)(1076003)(76176011)(9686003)(81166006)(6506007)(6306002)(33656002)(476003)(99286004)(11346002)(4326008)(126002)(966005)(47776003)(5660300002)(386003)(14454004)(8676002)(26005)(436003)(486006)(3846002)(2906002)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB4204;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: da975b25-0ef9-4d23-f793-08d767dace56
NoDisclaimer: True
X-Forefront-PRVS: 0220D4B98D
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1+p7YmI5ye+EIpKYm/EoiuSDOCclGDUZlbTFitv0HnWMkUB8UgWP48z66z0OH3TtTs43//YEyBfLGBWURGkeQRZuAdAIXQhuqp7dgPthEBRrrJwRGly9/z1xcJcE9SNKZR3sCZJn0+QzuPiIqoamhW88o28fhrZxrslnrwVzaxsTYn7qsGc2UOK9SxXCL5DVyIy6je4n5/Vdq0WEza+7JO+Ip6GyzbDnCmiiDJDYx4c/GnJoV1HHk1i3UUD1SxfbyDBKdVBELsLVG9H40z2TuuarmEV+El0nAUq7RrrlfVVZrXBWHwm30jAPz+J1DZZHY2WZ8oju9JJPyJ+05Lk9c/6a5Sr0yHqa5R/I03ozBd3ULMwClBpm/cJBEZ5gR9umW0M3FR5yHggud4lrJysTLGDVt/X8uCz2d0qPw/OMPEkmOxwKHLrTbC4T9e4CmWUpb//1veWUNuD468XIHf9OdRhLWx3ESVoHNA92az5c43k=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2019 01:43:04.7828 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a390edac-c5fb-4ad5-b69a-08d767dad3b9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4204
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkG1ImhIGiNFuKJ4N1wJzCLC3ucWKoiBHe9I+25KRqU=;
 b=TXPjPMP9Bj9gY52R2W0nH4pFH+TLQyDaZeH3yYp0vw8nmup2NRIcVSWTSBzOhxayHyTQ0KvoKT6wm0CArJxstw8qSQFJWGJMkkURf4JaNI14rAXnSXtqgXXzzdulKfi3zyTbGHpmHx4PuZ6izkN7rXI7VbZYzL5G0bTeGDaYN/8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkG1ImhIGiNFuKJ4N1wJzCLC3ucWKoiBHe9I+25KRqU=;
 b=TXPjPMP9Bj9gY52R2W0nH4pFH+TLQyDaZeH3yYp0vw8nmup2NRIcVSWTSBzOhxayHyTQ0KvoKT6wm0CArJxstw8qSQFJWGJMkkURf4JaNI14rAXnSXtqgXXzzdulKfi3zyTbGHpmHx4PuZ6izkN7rXI7VbZYzL5G0bTeGDaYN/8=
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>, nd <nd@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMDc6MjQ6MTZQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToNCj4gT24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMjowMCBQTSBNaWhhaWwgQXRhbmFzc292
DQo+IDxNaWhhaWwuQXRhbmFzc292QGFybS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gT24gTW9uZGF5
LCAxMSBOb3ZlbWJlciAyMDE5IDE1OjUzOjE0IEdNVCBMaXZpdSBEdWRhdSB3cm90ZToNCj4gPiA+
IE9uIFRodSwgTm92IDA3LCAyMDE5IGF0IDExOjQyOjQ0QU0gKzAwMDAsIE1paGFpbCBBdGFuYXNz
b3Ygd3JvdGU6DQo+ID4gPiA+IEl0J3MgcG9zc2libGUgdG8gZ2V0IG11bHRpcGxlIGV2ZW50cyBp
biBhIHNpbmdsZSBmcmFtZS9mbGlwLCBzbyBhZGQgYW4NCj4gPiA+ID4gb3B0aW9uIHRvIHByaW50
IHRoZW0gYWxsLg0KPiA+ID4gPg0KPiA+ID4gPiBSZXZpZXdlZC1ieTogSmFtZXMgUWlhbiBXYW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPg0KPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFybS5j
b20+DQo+ID4gPg0KPiA+ID4gRm9yIHRoZSB3aG9sZSBzZXJpZXM6DQo+ID4gPg0KPiA+ID4gQWNr
ZWQtYnk6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPg0KPiA+DQo+ID4gVGhhbmtz
LCBhcHBsaWVkIHRvIGRybS1taXNjLW5leHQuDQo+IA0KPiBBbmQgbm93IGtvbWVkYSBkb2Vzbid0
IGV2ZW4gY29tcGlsZSBhbnltb3JlLiBJJ20gLi4uIGltcHJlc3NlZC4NCj4gDQo+IEkgbWVhbiBn
ZW5lcmFsbHkgcGVvcGxlIGJyZWFrIG90aGVyIHBlb3BsZSdzIGRyaXZlciwgbm90IHRoZWlyIG93
bi4NCj4gLURhbmllbA0KDQpIaSBEYW5pZWw6DQoNClJlYWwgUmVhbCBzb3JyeSwgd2Ugd2lsbCBm
aW5kIGEgd2F5IHRvIGF2b2lkIHN1Y2ggc3R1cGlkIHByb2JsZW0uDQoNCkFuZCB0aGUgZml4IGlz
OiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzY5Mzg2Lw0KDQpCZXN0
IHJlZ2FyZHMsDQpKYW1lcw0KPiA+ID4NCj4gPiA+IEJlc3QgcmVnYXJkcywNCj4gPiA+IExpdml1
DQo+ID4gPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4NCj4gPiA+ID4gIHYyOiBDbGVhbiB1cCBjb250
aW51YXRpb24gbGluZSB3YXJuaW5nIGZyb20gY2hlY2twYXRjaC4NCj4gPiA+ID4NCj4gPiA+ID4g
IGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oICAgfCAyICsr
DQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9ldmVu
dC5jIHwgMiArLQ0KPiA+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmgNCj4gPiA+ID4gaW5kZXggZDlmYzljNDg4NTlhLi4x
NWY1MmUzMDRjMDggMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2Rldi5oDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oDQo+ID4gPiA+IEBAIC0yMjQsNiArMjI0LDgg
QEAgc3RydWN0IGtvbWVkYV9kZXYgew0KPiA+ID4gPiAgI2RlZmluZSBLT01FREFfREVWX1BSSU5U
X0lORk9fRVZFTlRTIEJJVCgyKQ0KPiA+ID4gPiAgICAgLyogRHVtcCBEUk0gc3RhdGUgb24gYW4g
ZXJyb3Igb3Igd2FybmluZyBldmVudC4gKi8NCj4gPiA+ID4gICNkZWZpbmUgS09NRURBX0RFVl9Q
UklOVF9EVU1QX1NUQVRFX09OX0VWRU5UIEJJVCg4KQ0KPiA+ID4gPiArICAgLyogRGlzYWJsZSBy
YXRlIGxpbWl0aW5nIG9mIGV2ZW50IHByaW50cyAobm9ybWFsbHkgb25lIHBlciBjb21taXQpICov
DQo+ID4gPiA+ICsjZGVmaW5lIEtPTUVEQV9ERVZfUFJJTlRfRElTQUJMRV9SQVRFTElNSVQgQklU
KDEyKQ0KPiA+ID4gPiAgfTsNCj4gPiA+ID4NCj4gPiA+ID4gIHN0YXRpYyBpbmxpbmUgYm9vbA0K
PiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfZXZlbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2V2ZW50LmMNCj4gPiA+ID4gaW5kZXggN2ZkNjI0NzYxYTJiLi5iZjI2OTY4M2Y4MTEgMTAwNjQ0
DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2V2ZW50LmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfZXZlbnQuYw0KPiA+ID4gPiBAQCAtMTE5LDcgKzExOSw3IEBAIHZvaWQga29tZWRh
X3ByaW50X2V2ZW50cyhzdHJ1Y3Qga29tZWRhX2V2ZW50cyAqZXZ0cywgc3RydWN0IGRybV9kZXZp
Y2UgKmRldikNCj4gPiA+ID4gICAgIC8qIHJlZHVjZSB0aGUgc2FtZSBtc2cgcHJpbnQsIG9ubHkg
cHJpbnQgdGhlIGZpcnN0IGV2dCBmb3Igb25lIGZyYW1lICovDQo+ID4gPiA+ICAgICBpZiAoZXZ0
cy0+Z2xvYmFsIHx8IGlzX25ld19mcmFtZShldnRzKSkNCj4gPiA+ID4gICAgICAgICAgICAgZW5f
cHJpbnQgPSB0cnVlOw0KPiA+ID4gPiAtICAgaWYgKCFlbl9wcmludCkNCj4gPiA+ID4gKyAgIGlm
ICghKGVycl92ZXJib3NpdHkgJiBLT01FREFfREVWX1BSSU5UX0RJU0FCTEVfUkFURUxJTUlUKSAm
JiAhZW5fcHJpbnQpDQo+ID4gPiA+ICAgICAgICAgICAgIHJldHVybjsNCj4gPiA+ID4NCj4gPiA+
ID4gICAgIGlmIChlcnJfdmVyYm9zaXR5ICYgS09NRURBX0RFVl9QUklOVF9FUlJfRVZFTlRTKQ0K
PiA+ID4gPiAtLQ0KPiA+ID4gPiAyLjIzLjANCj4gPiA+ID4NCj4gPiA+DQo+ID4gPiAtLQ0KPiA+
ID4gPT09PT09PT09PT09PT09PT09PT0NCj4gPiA+IHwgSSB3b3VsZCBsaWtlIHRvIHwNCj4gPiA+
IHwgZml4IHRoZSB3b3JsZCwgIHwNCj4gPiA+IHwgYnV0IHRoZXkncmUgbm90IHwNCj4gPiA+IHwg
Z2l2aW5nIG1lIHRoZSAgIHwNCj4gPiA+ICBcIHNvdXJjZSBjb2RlISAgLw0KPiA+ID4gICAtLS0t
LS0tLS0tLS0tLS0NCj4gPiA+ICAgICDCr1xfKOODhClfL8KvDQo+ID4gPg0KPiA+DQo+ID4NCj4g
PiAtLQ0KPiA+IE1paGFpbA0KPiA+DQo+ID4NCj4gPg0KPiANCj4gDQo+IC0tIA0KPiBEYW5pZWwg
VmV0dGVyDQo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbg0KPiArNDEgKDAp
IDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
