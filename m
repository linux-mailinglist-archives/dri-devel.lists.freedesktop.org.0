Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 175EFB7DE1
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 17:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8120E6F516;
	Thu, 19 Sep 2019 15:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40079.outbound.protection.outlook.com [40.107.4.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE356F516
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 15:13:28 +0000 (UTC)
Received: from VI1PR08CA0147.eurprd08.prod.outlook.com (2603:10a6:800:d5::25)
 by VI1PR08MB3488.eurprd08.prod.outlook.com (2603:10a6:803:7c::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20; Thu, 19 Sep
 2019 15:13:25 +0000
Received: from AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::207) by VI1PR08CA0147.outlook.office365.com
 (2603:10a6:800:d5::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Thu, 19 Sep 2019 15:13:25 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT050.mail.protection.outlook.com (10.152.17.47) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20 via Frontend Transport; Thu, 19 Sep 2019 15:13:23 +0000
Received: ("Tessian outbound 968ab6b62146:v31");
 Thu, 19 Sep 2019 15:13:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f7e7bfd89acc9074
X-CR-MTA-TID: 64aa7808
Received: from d673e86a8d06.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.8.55]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3B291DE2-265F-4034-B709-10FD1FE2E296.1; 
 Thu, 19 Sep 2019 15:13:13 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d673e86a8d06.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 Sep 2019 15:13:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mwrZwFE5DXf88UhVN5ZYiE/ZLB50dVhSu4iN8CBSSVaZIFDuH6DsrlgKn9xApZKAbGEm/5f6mOaq1Br0M3IfMptaKtZJh+GcBUxxsmE//TE20ldhw8IbJZwaBfEut/8DIO/VEzBI1Qt2yh9I9Jai9+cNn6Wt59IyV+7Vr3uNe/gUCanfB2NGeGn/w3gCt4NOSqive4flv5oJfSBoRVzlWOk13D57tI/mp2i8BgM/GY+jMMCc3bS2mKmPG6ZB1NNfdIJ0+ublPVD8gC3kXaBGR8kjQgAHpQiD0WpDuF9ID8PQrH3vJS4qNObrr4OoD4IyHRNLa/OJr8RoRiIj0lxmmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDe4fnpdt0/NxxMC2o+OYJvDeNmXC4tvIz6hILWxmVo=;
 b=UNGr8pIOA2med0v4/RrLskn3Fe+TxrqbWvSoHzzBNbh1Y/VMw/UZXFgYHdgK4SQzMTYPg9kZMsA5IHkTjsvIHC1A8V3i4hKBURQrmi/hevRlmHQfKERUQTRJbLiLBs/z/DbyqmZ8PXqTbFxO9awO9YqKntBy56pGostER7Lfxze7qXsqHbuKY/eCIy/pV5M1d4GmXMuU/htzjEkgrH/KPsThwjbPunOrLt2sFoFCEHunU+II0BMObK+6X0ZYYYLi4KrW+c20RsrVQoldTm5ISIbPTDiJq31/6w+Fl0rc2VVx0d2C994dmDh1ZsEPwJEvosilaaky+YgiyUdJVAV+FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM7PR08MB5352.eurprd08.prod.outlook.com (10.141.172.139) by
 AM7PR08MB5334.eurprd08.prod.outlook.com (10.141.172.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 19 Sep 2019 15:13:12 +0000
Received: from AM7PR08MB5352.eurprd08.prod.outlook.com
 ([fe80::c81a:63b1:5826:cf74]) by AM7PR08MB5352.eurprd08.prod.outlook.com
 ([fe80::c81a:63b1:5826:cf74%2]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 15:13:12 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH] drm:- Add a modifier to denote 'protected' framebuffer
Thread-Topic: [RFC PATCH] drm:- Add a modifier to denote 'protected'
 framebuffer
Thread-Index: AQHVZxR6T7KOwVbC3kmqPMMH1PUhIKcv34OAgAFOWACAADZTAIAAnioAgAEVfoCAAAILAIAAEXQA
Date: Thu, 19 Sep 2019 15:13:11 +0000
Message-ID: <20190919151310.GA12236@arm.com>
References: <20190909134241.23297-1-ayan.halder@arm.com>
 <20190917125301.GQ3958@phenom.ffwll.local>
 <CAPj87rPKp1ogZhk_fMrsX885zkAh1PB4usNQUd4KxNFUv4vsFw@mail.gmail.com>
 <20190918120406.2ylkxx2rqsbhn2te@e110455-lin.cambridge.arm.com>
 <CAPj87rOc3MvkjrX1qHpGuVUaGLuZiC7QYBO9v3T2NS+dicLC1g@mail.gmail.com>
 <20190919140323.GA3456@arm.com>
 <CAKMK7uHYy9pfmqV_qE948QMPOaxHsJ2sy3+J4kQqixanLP_SUQ@mail.gmail.com>
In-Reply-To: <CAKMK7uHYy9pfmqV_qE948QMPOaxHsJ2sy3+J4kQqixanLP_SUQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0317.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::17) To AM7PR08MB5352.eurprd08.prod.outlook.com
 (2603:10a6:20b:106::11)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.54]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 95ff8f3f-6388-4199-b789-08d73d13ea1c
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM7PR08MB5334; 
X-MS-TrafficTypeDiagnostic: AM7PR08MB5334:|AM7PR08MB5334:|VI1PR08MB3488:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB34887D54B5C17288E4C77672E4890@VI1PR08MB3488.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 016572D96D
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(199004)(189003)(53754006)(478600001)(14444005)(229853002)(6306002)(2616005)(476003)(446003)(11346002)(66066001)(44832011)(305945005)(14454004)(486006)(6246003)(25786009)(71200400001)(6486002)(33656002)(6512007)(6916009)(6436002)(36756003)(966005)(71190400001)(7736002)(81156014)(8676002)(2906002)(4326008)(81166006)(8936002)(52116002)(256004)(66476007)(76176011)(99286004)(5660300002)(86362001)(3846002)(1076003)(66446008)(386003)(66556008)(26005)(64756008)(53546011)(102836004)(186003)(316002)(6506007)(54906003)(66946007)(6116002)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM7PR08MB5334;
 H:AM7PR08MB5352.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: +y+NAggt8WeTGhykNsLtoZ9pnmJG44l2ZxbnYO0esIZ5yOQWlq+KtRhPXbZc9a/NIe8K8u2/xZi9CQwad6jgMj/a0JZiEYBM1E8sJYjhOqjLdfzQbcaK4c7gouVHD+d2V1vXtZD+usw1mqLBrZ708vC5/8d8JomQXUJEe8EERn1BnudLw7o2XKeobnLUnFHA0q/1/0KO1cDVBobAE8GtB/1MRoUiC6yw0cGpq3xvm/AeG+TXdyu1Ui6ZUmJr2Ju5FTCiehc/AsYkHHIpRHDqeCBJLGFFP2a6R/Cq9t0cAN3hHpCzDEQ3W4k9q0WORYPtfi1U6xlEkVL4Yh6zccLK0gzqIPUQBwPU870VMq7zi5LnTVZEwfS8KfFRyreNBIdL8++uTsmYDY9CEn7pxT9fQ/WL6fCug4RxgI+H72vGL/A=
Content-ID: <DC2653E39A52E74F9CAB3ED1A53E7132@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5334
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(39860400002)(199004)(189003)(53754006)(81166006)(81156014)(5660300002)(486006)(8936002)(8746002)(6306002)(966005)(26826003)(6512007)(63350400001)(336012)(1076003)(6862004)(4326008)(22756006)(25786009)(76130400001)(70206006)(47776003)(33656002)(70586007)(2616005)(6246003)(2906002)(3846002)(11346002)(23726003)(6116002)(478600001)(446003)(476003)(50466002)(8676002)(66066001)(126002)(46406003)(186003)(26005)(14444005)(229853002)(76176011)(54906003)(386003)(107886003)(316002)(99286004)(102836004)(7736002)(53546011)(305945005)(6506007)(36906005)(14454004)(86362001)(36756003)(6486002)(356004)(97756001)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3488;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 32f70d15-19e2-46e7-c826-08d73d13e2b1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3488; 
NoDisclaimer: True
X-Forefront-PRVS: 016572D96D
X-Microsoft-Antispam-Message-Info: 0ltZem2/DHYmRKZBmQ0GdsgTSH2Vqwgyje+1d4Qgaf4781ixBATwXngBV6HsVoC7x6mF2W7fxGoHU6oc38cG2/Mi6Xp7+AiuHLD2ixwHnT/d9n92IUhoGIs+ea6MTr4RXiZ6YgI3TAZoCIxlXloWObQeaY2On9cm7jX/vJsxPSIKuPROdGO95zQYhlXsHwGEegocujSrFpV0sZdsEKXoETNh28iGvsB+y/b77mVRL7idryWyMBzrinY8u+W/pZBg6EDTL4l+BLQxDWylmhcyXcsttD0Wrv/b2wr2y9fK09egBYC2753VF061mfLJsKCBdjX6LHigYITYomD9nFJxb1QWeSo3kk17M4X/0gb0/f8I2qcvrwvjJX0r/y40ejTnI16vMq+388vaECaUAaUUYMphLOziVeWXXOgmrs63Dg8=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2019 15:13:23.7067 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ff8f3f-6388-4199-b789-08d73d13ea1c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3488
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDe4fnpdt0/NxxMC2o+OYJvDeNmXC4tvIz6hILWxmVo=;
 b=mHKvC3e4JsE5FGAYvzmK55HhRxMjxZPBkKN3nMB5TbS0mKyxyCev+EmytxSYiOevDkpHhczYw8ACviZt453IbFLmOoikOTAY0BaR+FO5XZ3GyAoVDqomyBkodeJpqNTNKoKTIPSLPbO44RNPT3KVOv8smWLByWEukZzzD5TCd50=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDe4fnpdt0/NxxMC2o+OYJvDeNmXC4tvIz6hILWxmVo=;
 b=mHKvC3e4JsE5FGAYvzmK55HhRxMjxZPBkKN3nMB5TbS0mKyxyCev+EmytxSYiOevDkpHhczYw8ACviZt453IbFLmOoikOTAY0BaR+FO5XZ3GyAoVDqomyBkodeJpqNTNKoKTIPSLPbO44RNPT3KVOv8smWLByWEukZzzD5TCd50=
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
Cc: "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>, nd <nd@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgMDQ6MTA6NDJQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUaHUsIFNlcCAxOSwgMjAxOSBhdCA0OjAzIFBNIEF5YW4gSGFsZGVyIDxBeWFu
LkhhbGRlckBhcm0uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIFNlcCAxOCwgMjAxOSBhdCAx
MDozMDoxMlBNICswMTAwLCBEYW5pZWwgU3RvbmUgd3JvdGU6Cj4gPgo+ID4gSGkgQWxsLAo+ID4g
VGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb25zLgo+ID4KPiA+ID4gSGkgTGl2aXUsCj4gPiA+Cj4g
PiA+IE9uIFdlZCwgMTggU2VwIDIwMTkgYXQgMTM6MDQsIExpdml1IER1ZGF1IDxMaXZpdS5EdWRh
dUBhcm0uY29tPiB3cm90ZToKPiA+ID4gPiBPbiBXZWQsIFNlcCAxOCwgMjAxOSBhdCAwOTo0OTo0
MEFNICswMTAwLCBEYW5pZWwgU3RvbmUgd3JvdGU6Cj4gPiA+ID4gPiBJIHRvdGFsbHkgYWdyZWUu
IEZyYW1lYnVmZmVycyBhcmVuJ3QgYWJvdXQgdGhlIHVuZGVybHlpbmcgbWVtb3J5IHRoZXkKPiA+
ID4gPiA+IHBvaW50IHRvLCBidXQgYWJvdXQgaG93IHRvIF9pbnRlcnByZXRfIHRoYXQgbWVtb3J5
OiBpdCBkZWNvcmF0ZXMgYQo+ID4gPiA+ID4gcG9pbnRlciB3aXRoIHdpZHRoLCBoZWlnaHQsIHN0
cmlkZSwgZm9ybWF0LCBldGMsIHRvIGFsbG93IHlvdSB0byBtYWtlCj4gPiA+ID4gPiBzZW5zZSBv
ZiB0aGF0IG1lbW9yeS4gSSBzZWUgY29udGVudCBwcm90ZWN0aW9uIGFzIGJlaW5nIHRoZSBzYW1l
IGFzCj4gPiA+ID4gPiBwaHlzaWNhbCBjb250aWd1aXR5LCB3aGljaCBpcyBhIHByb3BlcnR5IG9m
IHRoZSB1bmRlcmx5aW5nIG1lbW9yeQo+ID4gPiA+ID4gaXRzZWxmLiBSZWdhcmRsZXNzIG9mIHRo
ZSB3aWR0aCwgaGVpZ2h0LCBvciBmb3JtYXQsIHlvdSBqdXN0IGNhbm5vdAo+ID4gPiA+ID4gYWNj
ZXNzIHRoYXQgbWVtb3J5IHVubGVzcyBpdCdzIHVuZGVyIHRoZSBhcHByb3ByaWF0ZSAoJ3NlY3Vy
ZSBlbm91Z2gnKQo+ID4gPiA+ID4gY29uZGl0aW9ucy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBTbyBJ
IHRoaW5rIGEgZG1hYnVmIGF0dHJpYnV0ZSB3b3VsZCBiZSBtb3N0IGFwcHJvcHJpYXRlLCBzaW5j
ZSB0aGF0J3MKPiA+ID4gPiA+IHdoZXJlIHlvdSBoYXZlIHRvIGRvIGFsbCB5b3VyIE1NVSBoYW5k
bGluZywgYW5kIGV2ZXJ5dGhpbmcgZWxzZSB5b3UKPiA+ID4gPiA+IG5lZWQgdG8gZG8gdG8gYWxs
b3cgYWNjZXNzIHRvIHRoYXQgYnVmZmVyLCBhbnl3YXkuCj4gPiA+ID4KPiA+ID4gPiBJc24ndCBp
dCBob3cgQU1EIGN1cnJlbnRseSBpbXBsZW1lbnRzIHByb3RlY3RlZCBidWZmZXJzIGFzIHdlbGw/
Cj4gPiA+Cj4gPiA+IE5vIGlkZWEgdG8gYmUgaG9uZXN0LCBJIGhhdmVuJ3Qgc2VlbiBhbnl0aGlu
ZyB1cHN0cmVhbS4KPiA+ID4KPiA+ID4gPiA+IFRoZXJlJ3MgYSBsb3Qgb2YgY29tcGxleGl0eSBi
ZXlvbmQganVzdCAnaXQncyBwcm90ZWN0ZWQnOyBmb3IKPiA+ID4gPiA+IGluc3RhbmNlLCBzb21l
IENQIHByb3ZpZGVycyBtYW5kYXRlIHRoYXQgdGhlaXIgY29udGVudCBjYW4gb25seSBiZQo+ID4g
PiA+ID4gc3RyZWFtZWQgb3ZlciBIRENQIDIuMiBUeXBlLTEgd2hlbiBnb2luZyB0aHJvdWdoIGFu
IGV4dGVybmFsCj4gPiA+ID4gPiBjb25uZWN0aW9uLiBPbmUgd2F5IHlvdSBjb3VsZCBkbyB0aGF0
IGlzIHRvIHVzZSBhIHNlY3VyZSB3b3JsZAo+ID4gPiA+ID4gKGV4dGVybmFsIGNvbnRyb2xsZXIg
bGlrZSBJbnRlbCdzIE1FLCBvciBDUFUtaW50ZXJuYWwgZW5jbGF2ZSBsaWtlIFNHWAo+ID4gPiA+
ID4gb3IgVEVFKSB0byBleGFtaW5lIHRoZSBkaXNwbGF5IHBpcGUgY29uZmlndXJhdGlvbiwgYW5k
IG9ubHkgdGhlbiBhbGxvdwo+ID4gPiA+ID4gYWNjZXNzIHRvIHRoZSBidWZmZXJzIGFuZC9vciBr
ZXlzLiBTdHVmZiBsaWtlIHRoYXQgaXMgYWx3YXlzIGdvaW5nIHRvCj4gPiA+ID4gPiBiZSBvdXQg
aW4gdGhlIHJlYWxtIG9mIHZlbmRvciAmIHByb2R1Y3QtcG9saWN5LXNwZWNpZmljIGFkZC1vbnMs
IGJ1dAo+ID4gPiA+ID4gaXQgc2hvdWxkIGJlIHBvc3NpYmxlIHRvIGFncmVlIG9uIGF0IGxlYXN0
IHRoZSBiYXNpYyBtZWNoYW5pY3MgYW5kCj4gPiA+ID4gPiBleHBlY3RhdGlvbnMgb2YgYSBzZWN1
cmUgcGF0aCB3aXRob3V0IHRoaW5ncyBsaWtlIHRoYXQuCj4gPiA+ID4KPiA+ID4gPiBJIGFsc28g
ZXhwZWN0IHRoYXQgZ29pbmcgdGhyb3VnaCB0aGUgc2VjdXJlIHdvcmxkIHdpbGwgYmUgcHJldHR5
IG11Y2ggdHJhbnNwYXJlbnQgZm9yCj4gPiA+ID4gdGhlIGtlcm5lbCBkcml2ZXIsIGFzIHRoZSBt
b3N0IGxpa2VseSBoYXJkd2FyZSBpbXBsZW1lbnRhdGlvbnMgd291bGQgZW5hYmxlCj4gPiA+ID4g
YWRkaXRpb25hbCBzaWduYWxpbmcgdGhhdCB3aWxsIGdldCB0cmFwcGVkIGFuZCBoYW5kbGVkIGJ5
IHRoZSBzZWN1cmUgT1MuIEknbSBub3QKPiA+ID4gPiB0cnlpbmcgdG8gc2ltcGxpZnkgdGhpbmdz
LCBqdXN0IHRha2luZyB0aGUgc3RhbmNlIHRoYXQgaXQgaXMgdXNlcnNwYWNlIHRoYXQgaXMKPiA+
ID4gPiBjb29yZGluYXRpbmcgYWxsIHRoaXMsIHdlJ3JlIHRyeWluZyBvbmx5IHRvIGZpbmQgYSBj
b21tb24gZ3JvdW5kIG9uIGhvdyB0byBoYW5kbGUKPiA+ID4gPiB0aGlzIGluIHRoZSBrZXJuZWwu
Cj4gPiA+Cj4gPiA+IFllYWgsIG1ha2VzIHNlbnNlLgo+ID4gPgo+ID4gPiBBcyBhIHN0cmF3bWFu
LCBob3cgYWJvdXQgYSBuZXcgZmxhZyB0byBkcm1QcmltZUhhbmRsZVRvRkQoKSB3aGljaCBzZXRz
Cj4gPiA+IHRoZSAncHJvdGVjdGVkJyBmbGFnIG9uIHRoZSByZXN1bHRpbmcgZG1hYnVmPwo+ID4K
PiA+IFRvIGJlIGhvbmVzdCwgZHVyaW5nIG91ciBpbnRlcm5hbCBkaXNjdXNzaW9uIGphbWVzLnFp
YW4ud2FuZ0Bhcm0uY29tIGhhZCBhCj4gPiBzaW1pbGFyIHN1Z2dlc3Rpb24gb2YgYWRkaW5nIGEg
bmV3IGZsYWcgdG8gZG1hX2J1ZiBidXQgSSBkZWNpZGVkCj4gPiBhZ2FpbnN0IGl0Lgo+ID4KPiA+
IEFzIHBlciBteSB1bmRlcnN0YW5kaW5nLCBhZGRpbmcgY3VzdG9tIGRtYSBidWYgZmxhZ3MgKGxp
a2UKPiA+IEFNREdQVV9HRU1fQ1JFQVRFX1hYWCwgZXRjKSBpcyBwb3NzaWJsZSBpZiB3ZShBcm0p
IGhhZCBvdXIgb3duIGFsbG9jYXRvci4gV2UKPiA+IHJlbHkgb24gdGhlIGR1bWIgYWxsb2NhdG9y
IGFuZCBpb24gYWxsb2NhdG9yIGZvciBmcmFtZWJ1ZmZlciBjcmVhdGlvbi4KPiA+Cj4gPiBJIHdh
cyBsb29raW5nIGF0IGFuIGFsbG9jYXRvciBpbmRlcGVuZGVudCB3YXkgb2YgdXNlcnNwYWNlCj4g
PiBjb21tdW5pY2F0aW5nIHRvIHRoZSBkcm0gZnJhbWV3b3JrIHRoYXQgdGhlIGZyYW1lYnVmZmVy
IGlzIHByb3RlY3RlZC4KPiA+Cj4gPiBUaHVzLCBpdCBsb29rZWQgdG8gbWUgdGhhdCBmcmFtZWJ1
ZmZlciBtb2RpZmllciBpcyB0aGUgYmVzdCAob3IgdGhlIGxlYXN0Cj4gPiBjb3JydXB0KSB3YXkg
b2YgZ29pbmcgZm9ydGguCj4gPgo+ID4gV2UgdXNlIGlvbiBhbmQgZHVtYiBhbGxvY2F0b3IgZm9y
IGZyYW1lYnVmZmVyIG9iamVjdCBjcmVhdGlvbi4gVGhlIHdheQo+ID4gSSBzZWUgaXQgaXMgYXMg
Zm9sbG93cyA6LQo+ID4KPiA+IDEuIEZvciBpb24gYWxsb2NhdG9yIDotCj4gPiBVc2Vyc3BhY2Ug
Y2FuIHNwZWNpZnkgdGhhdCBpdCB3YW50cyB0aGUgYnVmZmVyIGZyb20gYSBzZWN1cmUgaGVhcCBv
ciBhbnkgb3RoZXIKPiA+IHNwZWNpYWwgcmVnaW9uIG9mIGhlYXAuIFRoZSBpb24gZHJpdmVyIHdp
bGwgZWl0aGVyIGZhdWx0IGludG8gdGhlIHNlY3VyZSBvcyB0bwo+ID4gY3JlYXRlIHRoZSBidWZm
ZXJzIG9yIGl0IHdpbGwgZG8gc29tZSBvdGhlciBtYWdpYy4gSG9uZXN0bHksIEkgaGF2ZSBzdGls
bCBub3QKPiA+IGZpZ3VyZWQgdGhhdCBvdXQuIEJ1dCBpdCB3aWxsIGJlIGFnbm9zdGljIHRvIHRo
ZSBkcm0gY29yZS4KPiAKPiBBbGxvY2F0aW5nIGJ1ZmZlcnMgZnJvbSBhIHNwZWNpYWwgaGVhcCBp
cyB3aGF0IEkgZXhwZWN0ZWQgdGhlCj4gaW50ZXJmYWNlIHRvIGJlLiBUaGUgaXNzdWUgaXMgdGhh
dCBpZiB3ZSBzcGVjaWZ5IHRoZSBzZWN1cmUgbW9kZSBhbnkKPiB0aW1lIGxhdGVyIG9uLCB0aGVu
IGl0IGNvdWxkIGJlIGNoYW5nZWQuIEUuZy4gd2l0aCBEYW5pZWwgU3RvbmUncyBpZGVhCj4gb2Yg
YSBoYW5kbGUyZmQgZmxhZywgeW91IGNvdWxkIGV4cG9ydCB0aGUgYnVmZmVyIHR3aWNlLCBvbmNl
IHNlY3VyZSwKPiBvbmNlIG5vbi1zZWN1cmUuIFRoYXQgc291bmRzIGxpa2UgYSBzaWxseSB0aGlu
ZyB0byBtZSwgYW5kIGJldHRlciB0bwo+IHByZXZlbnQgdGhhdCAtIG9yIGlzIHRoaXMgYWN0dWFs
bHkgcG9zc2libGUvd2FudGVkLCBpLmUuIGRvIHdlIHdhbnQgdG8KPiBjaGFuZ2UgdGhlIHNlY3Vy
ZSBtb2RlIGZvciBhIGJ1ZmZlciBsYXRlciBvbj8KPiAKPiA+IFRoZSB1c2Vyc3BhY2UgZ2V0cyBh
IGhhbmRsZSB0byB0aGUgYnVmZmVyIGFuZCB0aGVuIGl0IGNhbGxzIGFkZEZCMiB3aXRoCj4gPiBE
Uk1fRk9STUFUX01PRF9BUk1fUFJPVEVDVEVELCBzbyB0aGF0IHRoZSBkcml2ZXIgY2FuIGNvbmZp
Z3VyZSB0aGUKPiA+IGRwdSdzIHByb3RlY3Rpb24gYml0cyAodG8gYWNjZXNzIHRoZSBtZW1vcnkg
d2l0aCBzcGVjaWFsIHNpZ25hbHMpLgo+IAo+IElmIHdlIGFsbG9jYXRlIGEgc2VjdXJlIGJ1ZmZl
ciB0aGVyZSdzIG5vIG5lZWQgZm9yIGZsYWdzIGFueW1vcmUgSQo+IHRoaW5rIC0gaXQgd291bGQg
YmUgYSBwcm9wZXJ0eSBvZiB0aGUgdW5kZXJseWluZyBidWZmZXIgKGxpa2UgYQo+IGNvbnRpZ3Vv
dXMgYnVmZmVyKS4gQWxsIHdlIG5lZWQgYXJlIHR3byB0aGluZ3M6Cj4gLSBtYWtlIHN1cmUgc2Vj
dXJlIGJ1ZmZlcnMgY2FuIG9ubHkgYmUgaW1wb3J0ZWQgYnkgc2VjdXJlLWJ1ZmZlciBhd2FyZSBk
cml2ZXJzCj4gLSBzb21lIHdheSBmb3Igc3VjaCBkcml2ZXJzIHRvIGZpZ3VyZSBvdXQgd2hldGhl
ciB0aGV5IGRlYWwgd2l0aCBhCj4gc2VjdXJlIGJ1ZmZlciBvciBub3QuCgpJIGFtIHdpdGggeW91
IG9uIHRoaXMuIFllcywgd2UgbmVlZCB0byBjb21tdW5pY2F0ZSB0aGUgYWJvdmUgdHdvCnRoaW5n
cy4KCj4gCj4gVGhlcmUncyBubyBuZWVkIGZvciBhbnkgZmxhZ3MgYW55d2hlcmUgZWxzZSB3aXRo
IHRoZSBpb24vc2VjdXJlCj4gZG1hLWJ1ZiBoZWFwIHNvbHV0aW9uLiBFLmcuIGZvciBjb250aWcg
YnVmZmVyIHdlIGFsc28gZG9udCBwYXNzIGFyb3VuZAo+IGEgRFJNX0ZPUk1BVF9NT0RfUEhZU0lD
QUxMWV9DT05USUcgZm9yIGFkZGZiMi4KClNvcnJ5LCBJIGNvdWxkIG5vdCBmb2xsb3cgeW91IGhl
cmUuIEZvciB0aGUgZHJpdmVyIHRvIGtub3cgaWYgaXQgaXMgaW1wb3J0aW5nCmEgc2VjdXJlIGJ1
ZmZlciBvciB1c2luZyBhIHNlY3VyZSBidWZmZXIsIGl0IG5lZWRzIHNvbWUgZmxhZ3MsIHJpZ2h0
PwoKT3Igb24gYSBzZWNvbmQgdGhvdWdodCwgYXJlIHlvdSBzdWdnZXN0aW5nIHRoYXQgd2Ugc2hv
dWxkIHN0aWNrIHdpdGgKYSBkbWFfYnVmIGZsYWcgKElTX1BST1RFQ1RFRCkgb25seSA/Cgo+IAo+
ID4gMi4gRm9yIGR1bWIgYWxsb2NhdG9yIDotCj4gPiBJIGFtIGN1cmlvdXMgdG8ga25vdyBpZiB3
ZSBjYW4gYWRkICdJU19QUk9URUNURUQnIGZsYWcgdG8KPiA+IGRybV9tb2RlX2NyZWF0ZV9kdW1i
LmZsYWdzLiBUaGlzIGNhbi9taWdodCBiZSB1c2VkIHRvIHNldCBkbWFfYnVmCj4gPiBmbGFncy4g
TGV0IG1lIGtub3cgaWYgdGhpcyBpcyBhbiBpbmNvcnJlY3QvZm9yYmlkZGVuIHBhdGguCj4gCj4g
ZHVtYiBpcyBkdW1iLCB0aGlzIGRlZmluaXRlbHkgZmVlbHMgbGlrZSB0aGUgd3JvbmcgaW50ZXJm
YWNlIHRvIG1lLgo+IAo+ID4gSW4gYSBudXRzaGVsbCwgbXkgb2JqZWN0aXZlIGlzIHRvIGZpZ3Vy
ZSBvdXQgaWYgdGhlIHVzZXJzcGFjZSBpcyBhYmxlCj4gPiB0byBjb21tdW5pY2F0ZSB0byB0aGUg
ZHJtIGNvcmUgYWJvdXQgdGhlICdwcm90ZWN0aW9uJyBzdGF0dXMgb2YgdGhlCj4gPiBidWZmZXIg
d2l0aG91dCBpbnRyb2R1Y2luZyBBcm0gc3BlY2lmaWMgYnVmZmVyIGFsbG9jYXRvci4KPiAKPiBX
aHkgZG9lcyB1c2Vyc3BhY2UgbmVlZCB0byBjb21tdW5pY2F0ZSB0aGlzIGFnYWluPyBXaGF0J3Mg
dGhlIGlzc3VlCj4gd2l0aCB1c2luZyBhbiBBUk0gc3BlY2lmaWMgYWxsb2NhdG9yIGZvciB0aGlz
PwoKV2UgbmV2ZXIgZmVsdCB0aGUgbmVlZCB0byBjcmVhdGUgYW4gQXJtIHNwZWNpZmljIGFsbG9j
YXRvci4gRWl0aGVyCkR1bWIgb3IgSW9uIGFsbG9jYXRvciB3b3VsZCBhbHdheXMgc3VmZmljZSBv
dXIgcHVycG9zZS4KClRvIHVwc3RyZWFtICdwcm90ZWN0ZWQgbW9kZScgZmVhdHVyZSBvZiBvdXIg
a29tZWRhIGRyaXZlciwgaWYgd2UgbmVlZCB0bwp3cml0ZSBvdXIgb3duIGFsbG9jYXRvciwgaXQg
d2lsbCBiZSBhIGJpZyBvdmVyaGVhZC4gOikKCkFsc28gdG8gYW5zd2VyIHlvdXIgZWFybGllciBx
dWVzdGlvbgoKIkJ1dCBpZiBpdCdzIGEgZ2VuZXJpYyBmbGFnLCBob3cgZG8geW91IGNvbWJpbmUg
dGhhdCB3aXRoIG90aGVyCm1vZGlmaWVycz8gTGlrZSBpZiB5b3UgaGF2ZSBhIHRpbGVkIGJ1ZmZl
ciwgYnV0IGFsc28gZW5jcnlwdGVkPyBPcgphZmJjIGNvbXByZXNzZWQsIG9yIHdoYXRldmVyIGVs
c2UuIEknZCBleHBlY3QgZm9yIHlvdXIgaHcgZW5jcnlwdGlvbgppcyBvcnRob2dvbmFsIHRvIHRo
ZSBidWZmZXIvdGlsaW5nL2NvbXByZXNzaW9uIGZvcm1hdCB1c2VkPyIKClllcywgaHcgZW5jcnlw
dGlvbihwcm90ZWN0ZWQgbW9kZSkgaXMgb3J0aG9nb25hbC9pbmRlcGVuZGVudCB0byBBRkJDIGNv
bXByZXNzaW9uLgpUaHVzLCBhbnkvYWxsIEFGQkMgYnVmZmVycyBjYW4gYmUgc3VwcG9ydGVkIHdp
dGgvd2l0aG91dCBwcm90ZWN0ZWQKbW9kZS4KCj4gLURhbmllbAo+IC0tIAo+IERhbmllbCBWZXR0
ZXIKPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiArNDEgKDApIDc5IDM2
NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
