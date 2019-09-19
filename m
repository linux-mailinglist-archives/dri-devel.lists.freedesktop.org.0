Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7909B7B80
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 16:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEBEA6F7C1;
	Thu, 19 Sep 2019 14:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130081.outbound.protection.outlook.com [40.107.13.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E306A6F7C1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 14:03:47 +0000 (UTC)
Received: from AM6PR08CA0036.eurprd08.prod.outlook.com (2603:10a6:20b:c0::24)
 by AM6PR08MB3687.eurprd08.prod.outlook.com (2603:10a6:20b:90::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.17; Thu, 19 Sep
 2019 14:03:43 +0000
Received: from VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::207) by AM6PR08CA0036.outlook.office365.com
 (2603:10a6:20b:c0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.18 via Frontend
 Transport; Thu, 19 Sep 2019 14:03:43 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT033.mail.protection.outlook.com (10.152.18.147) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20 via Frontend Transport; Thu, 19 Sep 2019 14:03:41 +0000
Received: ("Tessian outbound d5a1f2820a4f:v31");
 Thu, 19 Sep 2019 14:03:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 59fe04fe57f35db1
X-CR-MTA-TID: 64aa7808
Received: from a6aaa50599c3.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.2.58]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 923AE822-DA90-4D61-ACB4-74500B72BE7E.1; 
 Thu, 19 Sep 2019 14:03:25 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2058.outbound.protection.outlook.com [104.47.2.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a6aaa50599c3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 Sep 2019 14:03:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xti6Rdraway7ikWTNWm1eZFjkRGMBNnqTmIxUdmY1JtGUeDqLFDORbsw3AykVpSSGKM3cOBy+QPnA0uBgr6Yy6BrUZlJUmsa9+2YXhbk260/OEHZNRB1rRJZItEXrxF5jLXiskowtJnMSKiJBb5F6oDsDuzRHAkRRR49WT7ntgyhK05GgYFhHNw5rfVgWRClEW+f3H0EgsoD8hkHbUiFSTXA/6rfK/kNCB5cV4V8tMulkL2W0N5ir2UcAUCKSaDT9HT3YFnAAtUSrQaBYQxQ0pryTkVmiTIN6wNN4u2qS2HY2I+GAZtYFhNi6fpf/5MSixypXCb/fra1wX5HyWUKSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VV9r3NqvjYe5KgnxzsMtlnnFgb0PAkx3/8wo4YY6kdU=;
 b=Su4oc8zSnxIfG/0XZKAGl35n8FASvzeByvLnSflJKQmvFcKQZalOSRGkmAT42PToMsYBPzVQmdCmrL3bwstoe1BjtaSbJpuDDrrKOPZaBv0jMMv+hN7eznWhTNudhNTJ0P/gnHerVIc/neKQclzeZ0ZimSHt+cwoGJWyEzPmXld6I/GQ2anixo1EQrMh4rxdYCH5Y7a1UrZagS31oRU54zql+XATahETPn7BM1RAcpeA5cJz9TsrYLV2SNUKgdMEkc4pSyKy8vFksVyGXWbOo/0nruL07Fy7QdvULnBgwWACJss+8AtFILPBhjnMEHQ4RRWM+gEmmhHV7wT+zf/+LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM7PR08MB5352.eurprd08.prod.outlook.com (10.141.172.139) by
 AM7PR08MB5479.eurprd08.prod.outlook.com (10.141.174.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Thu, 19 Sep 2019 14:03:24 +0000
Received: from AM7PR08MB5352.eurprd08.prod.outlook.com
 ([fe80::c81a:63b1:5826:cf74]) by AM7PR08MB5352.eurprd08.prod.outlook.com
 ([fe80::c81a:63b1:5826:cf74%2]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 14:03:24 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [RFC PATCH] drm:- Add a modifier to denote 'protected' framebuffer
Thread-Topic: [RFC PATCH] drm:- Add a modifier to denote 'protected'
 framebuffer
Thread-Index: AQHVZxR6T7KOwVbC3kmqPMMH1PUhIKcv34OAgAFOWACAADZTAIAAnioAgAEVfoA=
Date: Thu, 19 Sep 2019 14:03:24 +0000
Message-ID: <20190919140323.GA3456@arm.com>
References: <20190909134241.23297-1-ayan.halder@arm.com>
 <20190917125301.GQ3958@phenom.ffwll.local>
 <CAPj87rPKp1ogZhk_fMrsX885zkAh1PB4usNQUd4KxNFUv4vsFw@mail.gmail.com>
 <20190918120406.2ylkxx2rqsbhn2te@e110455-lin.cambridge.arm.com>
 <CAPj87rOc3MvkjrX1qHpGuVUaGLuZiC7QYBO9v3T2NS+dicLC1g@mail.gmail.com>
In-Reply-To: <CAPj87rOc3MvkjrX1qHpGuVUaGLuZiC7QYBO9v3T2NS+dicLC1g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::31) To AM7PR08MB5352.eurprd08.prod.outlook.com
 (2603:10a6:20b:106::11)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.54]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: de380f8d-5b50-4e4c-cae4-08d73d0a2d69
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM7PR08MB5479; 
X-MS-TrafficTypeDiagnostic: AM7PR08MB5479:|AM7PR08MB5479:|AM6PR08MB3687:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB368793AFFD99B4CEF89CCE32E4890@AM6PR08MB3687.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 016572D96D
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(366004)(39860400002)(346002)(53754006)(189003)(199004)(478600001)(25786009)(256004)(66066001)(2906002)(44832011)(14444005)(316002)(86362001)(6486002)(6436002)(6246003)(7736002)(54906003)(229853002)(476003)(305945005)(5660300002)(486006)(6512007)(76176011)(11346002)(446003)(102836004)(8936002)(6506007)(386003)(6916009)(2616005)(81156014)(186003)(26005)(81166006)(33656002)(8676002)(52116002)(1076003)(99286004)(71190400001)(71200400001)(64756008)(36756003)(66446008)(66556008)(3846002)(6116002)(4326008)(66946007)(66476007)(14454004)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM7PR08MB5479;
 H:AM7PR08MB5352.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 45UjFLmTktj259ut57z1uLTKD+CGDsYNRUcDQivsE/3y3+NIz/czy46iemAKfx0tkKW4U9akJGfOMG4sm8E+v8Yp0tvHn/vE0bcjXuTgPVpBgKwqUjlc+i2gISHUxSc7vUN5YavcxTJ7CZikkuSKPTot0CovYCi0ryT4P/pVgVL6KhMwPh4MFsNCWyi2YenGI3idRY8cbjC/AQtwEQ4Q+sKcGEETd0Cv/bGuc7paXtJnWQD378+pVJJyoo1UM/1fXQ7xT+pXiYyBxVOZxFe04SXNYxihEvSgBeHcky4HBFV97zIVTcmBYzLPazmUY/NbEFpmzxeTRphLgz42sjeXNU9z8VxEnhCYFXEjyC/In7etjdgx31WcRgGOTaJO8qwjjv6iC472cGIahiloE8Nx1Gc2mcYcnaBrT/QlzHmojqY=
Content-ID: <BAF5456A58E7B847A350984515AACE6E@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5479
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(136003)(346002)(53754006)(189003)(199004)(386003)(22756006)(476003)(4326008)(47776003)(25786009)(316002)(14454004)(26826003)(336012)(6512007)(3846002)(8676002)(23726003)(97756001)(26005)(6116002)(81156014)(2906002)(86362001)(81166006)(478600001)(8746002)(76176011)(186003)(8936002)(99286004)(36906005)(126002)(66066001)(6506007)(486006)(229853002)(356004)(14444005)(54906003)(36756003)(5660300002)(107886003)(6486002)(6246003)(7736002)(46406003)(1076003)(33656002)(102836004)(305945005)(446003)(11346002)(2616005)(63350400001)(76130400001)(50466002)(6862004)(70206006)(70586007)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3687;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: df64c9cb-2e2f-4767-6392-08d73d0a22fe
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM6PR08MB3687; 
NoDisclaimer: True
X-Forefront-PRVS: 016572D96D
X-Microsoft-Antispam-Message-Info: KlV4ajMMK5EWRnffHxXGi9BDW40xnOVEFPD4NrbNVixshLpjcvCUcX0QiWc7Pfzwy1J3XYEk42OQ5vTwMesdbDd1Mr3NAf/7xUTQUlOTOsvMHGiqEPB2oqJfY0kVIx+pFbCFYXg58XXzbaHFb46wH0cSiTAq7xaAtqlbiW45esf5NsYYTriCA/eGpDZCmigQiyDW+/kQ9Fxfhvmk5hJyr+DnwHYkb3y9pvwm+9kpWLmaUfBxEJgGd8GQG4Oe+6/NZSyWWkk0hCkiBoxzuyZn7YCqHiuYAxtGtgaxK+hX14FCgITuLxhODc+S02XAccrqrY5DX1wi/P6y8tyCTKVaosCAVanzmzHdtMX4wDnLp47ibxBCucGOKvg68Av2ssflBlnloGpWyiXBB0kdwMDH7nDkg+ffDzRmerZfREvbtTU=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2019 14:03:41.6088 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de380f8d-5b50-4e4c-cae4-08d73d0a2d69
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3687
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VV9r3NqvjYe5KgnxzsMtlnnFgb0PAkx3/8wo4YY6kdU=;
 b=9mruijbh/mHAllWMod4LBSaeXJlEosK2Cf+NfM4Wgwj0qE09FiM+OMeM1oa2KBx0Nb22e/FudzeQKh6c5gPOQf6odHSv+fx13Y04TzodfgfmJqBbLnYNDVAOHhXIZSsdgaDMgszBufXCThPuDotRjaCSfbVH+u2L+byV7jAaZG8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VV9r3NqvjYe5KgnxzsMtlnnFgb0PAkx3/8wo4YY6kdU=;
 b=9mruijbh/mHAllWMod4LBSaeXJlEosK2Cf+NfM4Wgwj0qE09FiM+OMeM1oa2KBx0Nb22e/FudzeQKh6c5gPOQf6odHSv+fx13Y04TzodfgfmJqBbLnYNDVAOHhXIZSsdgaDMgszBufXCThPuDotRjaCSfbVH+u2L+byV7jAaZG8=
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

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMTA6MzA6MTJQTSArMDEwMCwgRGFuaWVsIFN0b25lIHdy
b3RlOgoKSGkgQWxsLApUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbnMuCgo+IEhpIExpdml1LAo+
IAo+IE9uIFdlZCwgMTggU2VwIDIwMTkgYXQgMTM6MDQsIExpdml1IER1ZGF1IDxMaXZpdS5EdWRh
dUBhcm0uY29tPiB3cm90ZToKPiA+IE9uIFdlZCwgU2VwIDE4LCAyMDE5IGF0IDA5OjQ5OjQwQU0g
KzAxMDAsIERhbmllbCBTdG9uZSB3cm90ZToKPiA+ID4gSSB0b3RhbGx5IGFncmVlLiBGcmFtZWJ1
ZmZlcnMgYXJlbid0IGFib3V0IHRoZSB1bmRlcmx5aW5nIG1lbW9yeSB0aGV5Cj4gPiA+IHBvaW50
IHRvLCBidXQgYWJvdXQgaG93IHRvIF9pbnRlcnByZXRfIHRoYXQgbWVtb3J5OiBpdCBkZWNvcmF0
ZXMgYQo+ID4gPiBwb2ludGVyIHdpdGggd2lkdGgsIGhlaWdodCwgc3RyaWRlLCBmb3JtYXQsIGV0
YywgdG8gYWxsb3cgeW91IHRvIG1ha2UKPiA+ID4gc2Vuc2Ugb2YgdGhhdCBtZW1vcnkuIEkgc2Vl
IGNvbnRlbnQgcHJvdGVjdGlvbiBhcyBiZWluZyB0aGUgc2FtZSBhcwo+ID4gPiBwaHlzaWNhbCBj
b250aWd1aXR5LCB3aGljaCBpcyBhIHByb3BlcnR5IG9mIHRoZSB1bmRlcmx5aW5nIG1lbW9yeQo+
ID4gPiBpdHNlbGYuIFJlZ2FyZGxlc3Mgb2YgdGhlIHdpZHRoLCBoZWlnaHQsIG9yIGZvcm1hdCwg
eW91IGp1c3QgY2Fubm90Cj4gPiA+IGFjY2VzcyB0aGF0IG1lbW9yeSB1bmxlc3MgaXQncyB1bmRl
ciB0aGUgYXBwcm9wcmlhdGUgKCdzZWN1cmUgZW5vdWdoJykKPiA+ID4gY29uZGl0aW9ucy4KPiA+
ID4KPiA+ID4gU28gSSB0aGluayBhIGRtYWJ1ZiBhdHRyaWJ1dGUgd291bGQgYmUgbW9zdCBhcHBy
b3ByaWF0ZSwgc2luY2UgdGhhdCdzCj4gPiA+IHdoZXJlIHlvdSBoYXZlIHRvIGRvIGFsbCB5b3Vy
IE1NVSBoYW5kbGluZywgYW5kIGV2ZXJ5dGhpbmcgZWxzZSB5b3UKPiA+ID4gbmVlZCB0byBkbyB0
byBhbGxvdyBhY2Nlc3MgdG8gdGhhdCBidWZmZXIsIGFueXdheS4KPiA+Cj4gPiBJc24ndCBpdCBo
b3cgQU1EIGN1cnJlbnRseSBpbXBsZW1lbnRzIHByb3RlY3RlZCBidWZmZXJzIGFzIHdlbGw/Cj4g
Cj4gTm8gaWRlYSB0byBiZSBob25lc3QsIEkgaGF2ZW4ndCBzZWVuIGFueXRoaW5nIHVwc3RyZWFt
Lgo+IAo+ID4gPiBUaGVyZSdzIGEgbG90IG9mIGNvbXBsZXhpdHkgYmV5b25kIGp1c3QgJ2l0J3Mg
cHJvdGVjdGVkJzsgZm9yCj4gPiA+IGluc3RhbmNlLCBzb21lIENQIHByb3ZpZGVycyBtYW5kYXRl
IHRoYXQgdGhlaXIgY29udGVudCBjYW4gb25seSBiZQo+ID4gPiBzdHJlYW1lZCBvdmVyIEhEQ1Ag
Mi4yIFR5cGUtMSB3aGVuIGdvaW5nIHRocm91Z2ggYW4gZXh0ZXJuYWwKPiA+ID4gY29ubmVjdGlv
bi4gT25lIHdheSB5b3UgY291bGQgZG8gdGhhdCBpcyB0byB1c2UgYSBzZWN1cmUgd29ybGQKPiA+
ID4gKGV4dGVybmFsIGNvbnRyb2xsZXIgbGlrZSBJbnRlbCdzIE1FLCBvciBDUFUtaW50ZXJuYWwg
ZW5jbGF2ZSBsaWtlIFNHWAo+ID4gPiBvciBURUUpIHRvIGV4YW1pbmUgdGhlIGRpc3BsYXkgcGlw
ZSBjb25maWd1cmF0aW9uLCBhbmQgb25seSB0aGVuIGFsbG93Cj4gPiA+IGFjY2VzcyB0byB0aGUg
YnVmZmVycyBhbmQvb3Iga2V5cy4gU3R1ZmYgbGlrZSB0aGF0IGlzIGFsd2F5cyBnb2luZyB0bwo+
ID4gPiBiZSBvdXQgaW4gdGhlIHJlYWxtIG9mIHZlbmRvciAmIHByb2R1Y3QtcG9saWN5LXNwZWNp
ZmljIGFkZC1vbnMsIGJ1dAo+ID4gPiBpdCBzaG91bGQgYmUgcG9zc2libGUgdG8gYWdyZWUgb24g
YXQgbGVhc3QgdGhlIGJhc2ljIG1lY2hhbmljcyBhbmQKPiA+ID4gZXhwZWN0YXRpb25zIG9mIGEg
c2VjdXJlIHBhdGggd2l0aG91dCB0aGluZ3MgbGlrZSB0aGF0Lgo+ID4KPiA+IEkgYWxzbyBleHBl
Y3QgdGhhdCBnb2luZyB0aHJvdWdoIHRoZSBzZWN1cmUgd29ybGQgd2lsbCBiZSBwcmV0dHkgbXVj
aCB0cmFuc3BhcmVudCBmb3IKPiA+IHRoZSBrZXJuZWwgZHJpdmVyLCBhcyB0aGUgbW9zdCBsaWtl
bHkgaGFyZHdhcmUgaW1wbGVtZW50YXRpb25zIHdvdWxkIGVuYWJsZQo+ID4gYWRkaXRpb25hbCBz
aWduYWxpbmcgdGhhdCB3aWxsIGdldCB0cmFwcGVkIGFuZCBoYW5kbGVkIGJ5IHRoZSBzZWN1cmUg
T1MuIEknbSBub3QKPiA+IHRyeWluZyB0byBzaW1wbGlmeSB0aGluZ3MsIGp1c3QgdGFraW5nIHRo
ZSBzdGFuY2UgdGhhdCBpdCBpcyB1c2Vyc3BhY2UgdGhhdCBpcwo+ID4gY29vcmRpbmF0aW5nIGFs
bCB0aGlzLCB3ZSdyZSB0cnlpbmcgb25seSB0byBmaW5kIGEgY29tbW9uIGdyb3VuZCBvbiBob3cg
dG8gaGFuZGxlCj4gPiB0aGlzIGluIHRoZSBrZXJuZWwuCj4gCj4gWWVhaCwgbWFrZXMgc2Vuc2Uu
Cj4gCj4gQXMgYSBzdHJhd21hbiwgaG93IGFib3V0IGEgbmV3IGZsYWcgdG8gZHJtUHJpbWVIYW5k
bGVUb0ZEKCkgd2hpY2ggc2V0cwo+IHRoZSAncHJvdGVjdGVkJyBmbGFnIG9uIHRoZSByZXN1bHRp
bmcgZG1hYnVmPwoKVG8gYmUgaG9uZXN0LCBkdXJpbmcgb3VyIGludGVybmFsIGRpc2N1c3Npb24g
amFtZXMucWlhbi53YW5nQGFybS5jb20gaGFkIGEKc2ltaWxhciBzdWdnZXN0aW9uIG9mIGFkZGlu
ZyBhIG5ldyBmbGFnIHRvIGRtYV9idWYgYnV0IEkgZGVjaWRlZAphZ2FpbnN0IGl0LgoKQXMgcGVy
IG15IHVuZGVyc3RhbmRpbmcsIGFkZGluZyBjdXN0b20gZG1hIGJ1ZiBmbGFncyAobGlrZQpBTURH
UFVfR0VNX0NSRUFURV9YWFgsIGV0YykgaXMgcG9zc2libGUgaWYgd2UoQXJtKSBoYWQgb3VyIG93
biBhbGxvY2F0b3IuIFdlCnJlbHkgb24gdGhlIGR1bWIgYWxsb2NhdG9yIGFuZCBpb24gYWxsb2Nh
dG9yIGZvciBmcmFtZWJ1ZmZlciBjcmVhdGlvbi4KCkkgd2FzIGxvb2tpbmcgYXQgYW4gYWxsb2Nh
dG9yIGluZGVwZW5kZW50IHdheSBvZiB1c2Vyc3BhY2UKY29tbXVuaWNhdGluZyB0byB0aGUgZHJt
IGZyYW1ld29yayB0aGF0IHRoZSBmcmFtZWJ1ZmZlciBpcyBwcm90ZWN0ZWQuCgpUaHVzLCBpdCBs
b29rZWQgdG8gbWUgdGhhdCBmcmFtZWJ1ZmZlciBtb2RpZmllciBpcyB0aGUgYmVzdCAob3IgdGhl
IGxlYXN0CmNvcnJ1cHQpIHdheSBvZiBnb2luZyBmb3J0aC4KCldlIHVzZSBpb24gYW5kIGR1bWIg
YWxsb2NhdG9yIGZvciBmcmFtZWJ1ZmZlciBvYmplY3QgY3JlYXRpb24uIFRoZSB3YXkKSSBzZWUg
aXQgaXMgYXMgZm9sbG93cyA6LQoKMS4gRm9yIGlvbiBhbGxvY2F0b3IgOi0KVXNlcnNwYWNlIGNh
biBzcGVjaWZ5IHRoYXQgaXQgd2FudHMgdGhlIGJ1ZmZlciBmcm9tIGEgc2VjdXJlIGhlYXAgb3Ig
YW55IG90aGVyCnNwZWNpYWwgcmVnaW9uIG9mIGhlYXAuIFRoZSBpb24gZHJpdmVyIHdpbGwgZWl0
aGVyIGZhdWx0IGludG8gdGhlIHNlY3VyZSBvcyB0bwpjcmVhdGUgdGhlIGJ1ZmZlcnMgb3IgaXQg
d2lsbCBkbyBzb21lIG90aGVyIG1hZ2ljLiBIb25lc3RseSwgSSBoYXZlIHN0aWxsIG5vdApmaWd1
cmVkIHRoYXQgb3V0LiBCdXQgaXQgd2lsbCBiZSBhZ25vc3RpYyB0byB0aGUgZHJtIGNvcmUuCgpU
aGUgdXNlcnNwYWNlIGdldHMgYSBoYW5kbGUgdG8gdGhlIGJ1ZmZlciBhbmQgdGhlbiBpdCBjYWxs
cyBhZGRGQjIgd2l0aApEUk1fRk9STUFUX01PRF9BUk1fUFJPVEVDVEVELCBzbyB0aGF0IHRoZSBk
cml2ZXIgY2FuIGNvbmZpZ3VyZSB0aGUKZHB1J3MgcHJvdGVjdGlvbiBiaXRzICh0byBhY2Nlc3Mg
dGhlIG1lbW9yeSB3aXRoIHNwZWNpYWwgc2lnbmFscykuCgoyLiBGb3IgZHVtYiBhbGxvY2F0b3Ig
Oi0KSSBhbSBjdXJpb3VzIHRvIGtub3cgaWYgd2UgY2FuIGFkZCAnSVNfUFJPVEVDVEVEJyBmbGFn
IHRvCmRybV9tb2RlX2NyZWF0ZV9kdW1iLmZsYWdzLiBUaGlzIGNhbi9taWdodCBiZSB1c2VkIHRv
IHNldCBkbWFfYnVmCmZsYWdzLiBMZXQgbWUga25vdyBpZiB0aGlzIGlzIGFuIGluY29ycmVjdC9m
b3JiaWRkZW4gcGF0aC4KCkluIGEgbnV0c2hlbGwsIG15IG9iamVjdGl2ZSBpcyB0byBmaWd1cmUg
b3V0IGlmIHRoZSB1c2Vyc3BhY2UgaXMgYWJsZQp0byBjb21tdW5pY2F0ZSB0byB0aGUgZHJtIGNv
cmUgYWJvdXQgdGhlICdwcm90ZWN0aW9uJyBzdGF0dXMgb2YgdGhlCmJ1ZmZlciB3aXRob3V0IGlu
dHJvZHVjaW5nIEFybSBzcGVjaWZpYyBidWZmZXIgYWxsb2NhdG9yLgoKVGhhbmtzLApBeWFuCgo+
IENoZWVycywKPiBEYW5pZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
