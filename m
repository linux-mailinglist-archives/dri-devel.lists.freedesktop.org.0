Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4699C73E0F2
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 15:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FC710E209;
	Mon, 26 Jun 2023 13:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962BE10E209
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 13:45:48 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 35QBPoDL030512; Mon, 26 Jun 2023 14:45:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=VfXwmZFj1ahOXf/xyjuVHtomlwGRcfSew3HQvOSz1TA=; b=
 oXUqu5bnQP/S93VSpN6PaNg0dTTY3KuNF3HknFk/0oVqllOnCPaYn5z3iUWbe3Yw
 ycsQQethmhqlYd69rWx06c2B5gVwEgazdRYUtwyG2LgGd40+2EeOhqfe7SiKfbyy
 Lv2UpRYsTwXoCJsgOEeRRNO9CvaeMv5f30DrItW6xfKqREdKRk44rBkTbBUvUVRe
 fsbgnjZMCuB9CF7NF7/8hgn+pRMFgbeIqaPH96bw6J1Z6+M9eFnbrAFxFZfWdRML
 TyrAXMMGBH9iC9gmGIB8r1gzzcLSFS+a/hrqZ0QBIGOaXqM21O6F8ZqUKrta2chA
 NDKFpjaSYU5VchQTbBsGwA==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3rdrju1hxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 26 Jun 2023 14:45:31 +0100 (BST)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 26 Jun 2023 14:45:27 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.57) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23 via Frontend
 Transport; Mon, 26 Jun 2023 14:45:27 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NptWMVlmAizwv/GWCJIH0F4/3vvaBAsCx77rukAefBN8lznpwPAqDeeTHLUwy36yVVY9knfprQ+4U6vUsjDbx2o8j4Y2P5ue8VV4XmliowGX4OZQ5xEA/pWG6GMopNAIgGQHnoQ9CC57/yOZbz7DxSUlabCNG/tp6wyrdQaF4GBorlta0FIWBdsuv88cXmbhet1mei/gFQ9Wz0B6g64kmCj+AfvTM0MXBtJKfZitYZkwRMk1RXKqnoN8RLipNTnX2XdGK9DgPP0uO1Q+7tcKEs2Td5BF+kDmJfSI04x34NUCNeAdyph1P0T08O/rjh3hVPRJZrGatRZJsHqFKZzrTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfXwmZFj1ahOXf/xyjuVHtomlwGRcfSew3HQvOSz1TA=;
 b=SriTA5l8wr2MzGUJZY3/6fTkbaCKF6Ey3GGqb62cJjMYVE6rPgB3UfiO1IyNkCOboXaioY0lEPDP3nmTE+r1SMWQaguMMJnkmoxo70c7LJN/dQR2yoCesqdaNRddh+2iZhoOsYxl6/0Kud+WJTwf5jCBDB26tFIqf1TkzAfcRoh3L9NZ5r92lddilKh80PPxffP0f+M3shIR2tucfi3bU61DCLD3v20Dk48wnHIdTazsoyTBHT9A+9VbUUaaC1uWuIXx4/ybQNxDmooHoh2U+EispCsbarHZ3aNVlZArsOetQzhnBCyM38ICj8OmcUSxU9tV8ij9Us7sAsQ5YRWpqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfXwmZFj1ahOXf/xyjuVHtomlwGRcfSew3HQvOSz1TA=;
 b=nANa13w7lMM2dXGDtSKXZhhHgVxO9/gReZ0thT68MiNcm3I3bqauwkMD5J+b6uyLEo+Hn1+/Aq21WA9tFRndzGdQ3rnFcKgdNA12GWCd2NyQ8FX5/xoRf8njZftNv4xUBTbQAehZv+6iAvxyD/RHXK1kB0h2odWiie+KGhGGyuc=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by LO0P265MB6662.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:30b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 13:45:26 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d3b4:38d6:d07b:2c1c]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d3b4:38d6:d07b:2c1c%3]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 13:45:26 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "hns@goldelico.com" <hns@goldelico.com>, "linus.walleij@linaro.org"
 <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 00/17] Imagination Technologies PowerVR DRM driver
Thread-Topic: [PATCH v3 00/17] Imagination Technologies PowerVR DRM driver
Thread-Index: AQHZngYUAoHFWBW9YEaEPwaoHR+3kK+NYHoAgAAbCoCAD7FbgA==
Date: Mon, 26 Jun 2023 13:45:26 +0000
Message-ID: <e4ec5cff0044ca307cfa71a20bc0a07c6a8123a2.camel@imgtec.com>
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
 <CACRpkdYAAxvHLfEGFwaHQYvZRNhySNo7gSVEBSgGP-pusBwBnQ@mail.gmail.com>
 <CC39D823-AAE1-4D23-8BFE-70823E737DC2@goldelico.com>
In-Reply-To: <CC39D823-AAE1-4D23-8BFE-70823E737DC2@goldelico.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|LO0P265MB6662:EE_
x-ms-office365-filtering-correlation-id: 8143b738-23d0-4272-3c0b-08db764b990f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LjsBhocH3NHziky0x+KxC/jFOnH+PwgdjXJAsRElw/glEm4w896BEI/y9MBGcgi9VIQlv9Cr0nJXry7WNqsydY+JqaRGodJGDNZ8wBeIc06wDb0I9rXbtzvjw/MqXb4I+LRz/gZwLP1TMwMn+YHVdWMTQwrFyIPKlgEFT7PWqbsEayn4IVv6uKv2977+tDRG6zWyBhGfFK1I48Mr0pD+heVgrJUbReOJ4vJ8dnYO9p1kLliFai+0RGq9LAs7nPieGoDTAftYM6t2PC3aOvD/anU04ryz6b0fe628+nnsNqJ62iI19RGPe6bGh1gBcZrcHF/gxWsPSlForroDvatrh0hcgd40s166U4uPVfwyiokeTPRZ1V8JTTUX193aEvCMWrq0jnCVy7Q4IGEzyBLVmTosQxgtElbkgYZeenlLPweUPwKvKos3wOx60yV8B46PCTCBnrWSh2XzU36FsVkh1Vk6XwbppUnTzGa+q8//ig6zhA1NHmrXl7KFr610iwOksFM/cCNhvrs7ANeZbewxOWJ7IuXVw5EqV3Y/ITVKGIM6kp4kXQ80aRTyATj9YXK/86Fqu4H0cYKC4OWIeNPWCb/7Fj/hC8MQnm+0DSwxH0E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(376002)(136003)(39850400004)(366004)(451199021)(2906002)(6486002)(71200400001)(38100700002)(122000001)(2616005)(83380400001)(53546011)(26005)(186003)(966005)(41300700001)(86362001)(110136005)(54906003)(478600001)(38070700005)(66556008)(66476007)(66446008)(64756008)(76116006)(66946007)(36756003)(4326008)(316002)(6506007)(6512007)(7416002)(8936002)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QlB3dXpSaWp0OFpWR3ZVVTlYQWVvNnlkZitQcXV2MGVpUjVKRHdGVXdxQ0ZR?=
 =?utf-8?B?TGJTam4zWElzVmNyNlJsQ0FjdXVhdG1majU1WWgzY3JBc3NIMDN0dWMrMUNB?=
 =?utf-8?B?WkR0Y25SNzlTb0RUdE1ESTlyV0c0N2RKZHRYMlhZZGpJblBMTDlidGdnZGRz?=
 =?utf-8?B?a21qci9RYTNaL1NvYS9wVXk1TUxiVnRzMCtTMldncjVKVDFmYUdPajU2SWlr?=
 =?utf-8?B?TThQLzBhNnV1bE92dzdHMkNER3lLQkxiYVpYalhjVjdDRVJzdDFqTDZIb0tN?=
 =?utf-8?B?Rk5oUzF3V2txRTIzZy9UZVBWMlNKMDlmZGNXNzBGL0tlSlRReFU0VjF5VFpB?=
 =?utf-8?B?cWcvYzQzT2x6MFJ3RWk2b1E2YjF4djRpdVZiZmFYYk5GQkdoeGluR1NyMnhu?=
 =?utf-8?B?QjhZSjR6bFZJeUpDb2FlcnZiUkFsYyt3QzVUdTFhcTk0RncyQzN4WE1lZCt1?=
 =?utf-8?B?NE5mTStSenA3K21admpxakVnY240ZzdkTHdQY1RpRWFmUGZaZVZ0d21hSC9n?=
 =?utf-8?B?S0FmTE1JQTVCYm5oUC96MGF2WEFvWFl6Q1NEMlp0RVcvbyt3L05Pclg2cE9J?=
 =?utf-8?B?QWJWUE9DQkxxOCt2czg0ZUEzcWJTV21xTE02TlFBMmpBRXlubllRQTkveFhH?=
 =?utf-8?B?aUsyNGtPTGU1YUg5c0JoTFZBaWpJeFdod283aGtnRk5ZQjFkU0pnQmV4T0lE?=
 =?utf-8?B?blkvMUpFT2RNY09FZkdIcE9QaU5MRGlFWDFnTk52SGZHR3RGKzZxVXlMWDR2?=
 =?utf-8?B?YXJTSEx2aUU1QTNVUGJESGNJN2JGU0lINml0Vk9Pb09wSXBxQUpKSEJGTEtj?=
 =?utf-8?B?K2VCQzI3TDRrcUdwNURrY0VoMDdkajR3VGVRYXlYWURPYWdPSk9kSnFTSjgr?=
 =?utf-8?B?Q0dEL0JpTFZ2UnA5Si9NVURha3ArQng3TGZFTFliSkZZZ0o2S0NwQ3poSDJS?=
 =?utf-8?B?YXY1Q1p1TzdDUlJCRHcrVnliTTQ0aHJQU1Z2dXdIbHBINW9oang4dXloblVD?=
 =?utf-8?B?TUU3amg5RkluU3NFS2gxWU5reU5ZdFlnVVZ2bktDbk8vaXBQMnl6bmVLTVYr?=
 =?utf-8?B?TWJHNURQb1J1eXFxY3FuM2tXU3FDM2VySHVnd2hsOFFFVXVsL0hSMlJHYng4?=
 =?utf-8?B?Y01QL3pVdmhlU0pwMnJuQS82K01vN2Nvd0E3MFhLbEV1blRTQXlVbXpiWkRx?=
 =?utf-8?B?Yy8wMmpiMnNWSFN1RGV6USt0RmU5MGVENk5weDZYcHRIUDZzbE9jVFFIa0ht?=
 =?utf-8?B?bjdSL1hQbFZZQUJpeEp2ZWt0a243MGl6cE1QNEpzRjdpRGxrd0lRNm4xZnQ1?=
 =?utf-8?B?UjhLOWVHVDBmOU52QmRBWXdQL3cvcTZoNFRxVEQ3Tm9VZVdCM2lDQXFRaFY5?=
 =?utf-8?B?bG8ySCtHcEY0K0UySzNyMEEwdENhM0pFNFdPYW95ZEdBRWJvUzlYeURFQkVx?=
 =?utf-8?B?OFNiNXBlOEtzTW82SXpVR25kcmxRQXZaa2QxZk1uQUYzZVdoNmJZT3IwYllU?=
 =?utf-8?B?Y0tYcGlMNzlGZWFVNURZRmpVTnUwZnl6U29VbTlkZnYzam43K3FQODlPekha?=
 =?utf-8?B?WURFRGpDZDBHRGlsSVUzT1dCbWtLdkk1ZUlmTGxxbjA3NG5VcmVmNFl0NFk0?=
 =?utf-8?B?MldvengrMVZpZGIyRlFmT2tEbE03RHp6RlB5TDdpcThCbmg0aXdTMlcrUGFC?=
 =?utf-8?B?NzhoclU5SEJEQVlZZEN1bUllQTBWTzg0bXVRUmEyaXkrNU5TS1pSbGV1Y0pR?=
 =?utf-8?B?VnRzTlduQ3ZIWTBsanFBWVRJanZYdVNIMzdDdENxNGp4SWhwclJRaTZ1U1Q0?=
 =?utf-8?B?enRzdlFENDJnM29BRlFhVkwrakY3Z1Nvb0pWSVVzdVJlMDlLRGdvZmtVWFhG?=
 =?utf-8?B?OHN1QkdIa2pya0N5VFJGNUNQMzV0dUpYTk5HK2FrckhyZWVOenA0TWJWbHc3?=
 =?utf-8?B?QVZvQU1zU1Bxd0luRy9qK01Lcm8zbU90QnJZSVVsb0FocG02amhxQVJqeGM4?=
 =?utf-8?B?SWFXdzZIdUJvbnZZUWMrYXdEL2ZSekkyQ2Q0NWFFVWJ5T2RhTW9XcHRFZjNS?=
 =?utf-8?B?TS9HTVRKUXJRUDRuUlJxOVhHZjVhdjRJWmwzaTBEUHNwS1QwRkg4VjdmQ2VN?=
 =?utf-8?B?TXVXQW5zKzVBS0ZackJzL0RmSjhEZ1BGQ0UzaE82TWNnYUNCODRBaVUvVWdF?=
 =?utf-8?B?Ync9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <36C1F080C3D1194FBAB31582DBCB8AA7@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8143b738-23d0-4272-3c0b-08db764b990f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2023 13:45:26.5147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fH/xT4qGd4j++ssKbwWAJ1T5941qS/rLo6Kskn6TizULawXrRDCngtK0bNARCIWWXEwVit0DV6Xhj3B8UUeAVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6662
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: ERfkI_AWhDHcNhIbhRe3XX4CsfNPP_ea
X-Proofpoint-GUID: ERfkI_AWhDHcNhIbhRe3XX4CsfNPP_ea
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: "matthew.brost@intel.com" <matthew.brost@intel.com>,
 Sarah Walker <Sarah.Walker@imgtec.com>,
 "openpvrsgx-devgroup-bounces@letux.org"
 <openpvrsgx-devgroup-bounces@letux.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>, Donald Robson <Donald.Robson@imgtec.com>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmlrb2xhdXMsDQoNCk9uIEZyaSwgMjAyMy0wNi0xNiBhdCAxNjowNiArMDIwMCwgSC4gTmlr
b2xhdXMgU2NoYWxsZXIgd3JvdGU6DQo+IEhpIExpbnVzLA0KPiB0aGFua3MgZm9yIHNoYXJpbmcg
dGhpcyBjb252ZXJzYXRpb24gd2l0aCBtZS4NCj4gDQo+ID4gQW0gMTYuMDYuMjAyMyB1bSAxNDoy
OSBzY2hyaWViIExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz46DQo+ID4g
DQo+ID4gSGkgU2FyYWgsDQo+ID4gDQo+ID4gdGhhbmtzIGZvciBzdGFydGluZyB0aGlzIGxvbmcg
YXdhaXRlZCB3b3JrIQ0KPiA+IA0KPiA+IE9uIFR1ZSwgSnVuIDEzLCAyMDIzIGF0IDU6MjDigK9Q
TSBTYXJhaCBXYWxrZXIgPHNhcmFoLndhbGtlckBpbWd0ZWMuY29tPiB3cm90ZToNCj4gPiANCj4g
PiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgdGhlIGluaXRpYWwgRFJNIGRyaXZlciBmb3IgSW1h
Z2luYXRpb24gVGVjaG5vbG9naWVzIFBvd2VyVlINCj4gPiA+IEdQVXMsIHN0YXJ0aW5nIHdpdGgg
dGhvc2UgYmFzZWQgb24gb3VyIFJvZ3VlIGFyY2hpdGVjdHVyZS4gSXQncyB3b3J0aCBwb2ludGlu
Zw0KPiA+ID4gb3V0IHRoYXQgdGhpcyBpcyBhIG5ldyBkcml2ZXIsIHdyaXR0ZW4gZnJvbSB0aGUg
Z3JvdW5kIHVwLCByYXRoZXIgdGhhbiBhDQo+ID4gPiByZWZhY3RvcmVkIHZlcnNpb24gb2Ygb3Vy
IGV4aXN0aW5nIGRvd25zdHJlYW0gZHJpdmVyIChwdnJzcnZrbSkuDQo+IA0KPiBHcmVhdCENCj4g
DQo+ID4gVGhpcyBzZWVtcyB0byBiZSBhIGZhaXJseSBnb29kIHN0YXJ0aW5nIHBvaW50LCBhIGJp
dCBvZiB0cmFkZS1vZmYNCj4gPiBiZXR3ZWVuIGxhdGVzdC1hbmQtZ3JlYXRlc3QNCj4gPiBhbmQg
cmVjZW50IGVub3VnaCBkZXZpY2VzIHRoYXQgbmVlZCBhZnRlcm1hcmtldCBzdXBwb3J0Lg0KPiA+
IA0KPiA+IEkgYXNzdW1lIHlvdSBhcmUgYXdhcmUgb2YgdGhlIGNvbW11bml0eSBleGlzdGluZyBh
cm91bmQgU2VyaWVzIDUNCj4gPiAoc2hvdWxkIGJlIHRoZSBpbW1lZGlhdGUNCj4gPiBwcmVkZWNl
c3NvciB0byBSb2d1ZT8pOg0KPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVucHZyc2d4LWRldmdy
b3VwL2xpbnV4X29wZW5wdnJzZ3gNCj4gPiANCj4gPiBJIGRvbid0IGtub3cgaG93IGFjdGl2ZSB0
aG9zZSBwZW9wbGUgYXJlIHRoZXNlIGRheXMsIGJ1dCBJIGNhbiBzZWUgdGhhdCBhIGJyYW5jaA0K
PiANCj4gV2VsbCwgdGhlcmUgaGFzbid0IGJlZW4gbXVjaCBwcm9ncmVzcyBkdWUgdG8gbGFjayBv
ZiBkb2N1bWVudGF0aW9uIGFuZCBjb21wYXRpYmlsaXR5DQo+IGlzc3VlcyBvZiB1c2VyLXNwYWNl
IGNvZGUuIEp1c3Qga2VlcGluZyB0aGUgY29kZSBjb21wYXRpYmxlIHRvIGxhdGVzdCB1cHN0cmVh
bSBrZXJuZWxzLg0KPiANCj4gQnV0IGF0IGxlYXN0IGZvciBPTUFQMyBhbmQgT01BUDUgcHJvY2Vz
c29ycyBwZW9wbGUgYXJlIGFjdGl2ZWx5IHVzaW5nIHRoaXMgd29yay4NCj4gDQo+IFRoZXJlIGlz
IGV2ZW4gYSBnYW1pbmcgY29uc29sZSAod3d3LnB5cmEtaGFuZGhlbGQuY29tKSBpbiBhY3RpdmUg
cHJvZHVjdGlvbg0KPiB3aXRoIGEgc3Ryb25nIG5lZWQgZm9yIGFuIHVwLXRvLWRhdGUgU0dYNTQ0
IGRyaXZlciBydW5uaW5nIG9uIE9NQVA1Lg0KPiANCj4gPiB3YXMgdXBkYXRlZCBmb3IgdjYuNC1y
YzMganVzdCB0aHJlZSB3ZWVrcyBhZ28uDQo+ID4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5wdnJz
Z3gtZGV2Z3JvdXAvbGludXhfb3BlbnB2cnNneC90cmVlL3B2cnNydmttLTYuNC1yYzMNCj4gPiAN
Cj4gPiBJIHRoaW5rIGl0IHdvdWxkIGJlIGdvb2QgZm9yIGNvbW11bml0eSBidWlsZGluZyB0byBt
YWtlIHN1cmUgdGhhdCB5b3UgZ2V0IHRoZXNlDQo+ID4gcGVvcGxlIGludm9sdmVkIGluIHJldmll
d2luZywgZXNwZWNpYWxseSBuZXV0cmFsIHN0dWZmIGxpa2UgZGV2aWNlIHRyZWUgYmluZGluZ3MN
Cj4gPiBidXQgYWxzbyB0byBtYWtlIHN1cmUgbm8gYXJjaGl0ZWN0dXJhbCBjaG9pY2VzIGFyZSBk
b25lIHRoYXQgd2lsbCBtYWtlIGl0IGhhcmQNCj4gPiB0byByZXRyb2ZpdCBhIHByb3BlciBkcml2
ZXIgZm9yIHRoZSBvbGRlciBlbmdpbmVzIGlmIHRoaXMgY29tbXVuaXR5DQo+ID4gZGVjaWRlIHRv
IHdvcmsNCj4gPiBvbiBpdC4NCj4gDQo+IFNvbWUgcXVlc3Rpb25zIHRvIHRoZSBhdXRob3Igb2Yg
dGhlIG5ldyBkcml2ZXI6DQo+IC0gYXJlIHRoZXJlIHBsYW5zIHRvIHN1cHBvcnQgU0dYNSAodGhl
IHByZWRlY2Vzc29yIG9mIFJvZ3VlNik/DQoNCldlIGRvbid0IGN1cnJlbnRseSBoYXZlIGFueSBw
bGFucyB0byBzdXBwb3J0IFNHWC4gT3VyIG1haW4gZm9jdXMgaXMgY3VycmVudGx5IG9uDQpSb2d1
ZSBhbmQgdGhlbiB3ZSdsbCBtb3ZlIG9udG8gVm9sY2FuaWMuDQoNCj4gLSB3aWxsIHRoaXMgYmUg
YWJsZSB0byBydW4gdGhlIGV4aXN0aW5nIGZpcm13YXJlIGFuZCB1c2VyLXNwYWNlIGNvZGUgb2Yg
cHZyc3J2a20/DQoNCkknbSBhZnJhaWQgbm90LiBUaGUgaW50ZXJmYWNlIGZvciBleGlzdGluZyBm
aXJtd2FyZSBhbmQgdXNlcnNwYWNlIGNvZGUgd2VyZQ0KZGVzaWduZWQgd2l0aCBkaWZmZXJlbnQg
cmVxdWlyZW1lbnRzIGluIG1pbmQgYW5kIGRvbid0IGNhdGVyIHRvIHRoZSBrZXJuZWwncw0Kc3Ry
aWN0IGNvbXBhdGliaWxpdHkgZ3VhcmFudGVlcy4gQXMgc3VjaCwgdGhlIHVhcGkgZm9yIHRoaXMg
bmV3IGRyaXZlciBpcw0KdmVyeSBkaWZmZXJlbnQgdG8gcHZyc3J2a20ncywgYWx0aG91Z2ggbmF0
dXJhbGx5IHRoZXJlIGFyZSBzaW1pbGFyaXRpZXM6DQpodHRwczovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvc2FyYWgtd2Fsa2VyLWltZ3RlYy9wb3dlcnZyLy0vYmxvYi9kZXYvdjMvaW5jbHVkZS91
YXBpL2RybS9wdnJfZHJtLmgNCg0KV2UndmUgYWxzbyB3b3JrZWQgd2l0aCBvdXIgZmlybXdhcmUg
dGVhbSB0byBtYWtlIGNoYW5nZXMgdG8gdGhlIGZpcm13YXJlDQppbnRlcmZhY2UgdG8gYmV0dGVy
IHN1cHBvcnQgdGhpcyBuZXcgZHJpdmVyLiBTcGVjaWZpY2FsbHksIHBhcnRzIG9mIHRoZSBmaXJt
d2FyZQ0KaW50ZXJmYWNlIGFyZSBubyBsb25nZXIgY29uZGl0aW9uYWwgb24gdGhlIEdQVSBmZWF0
dXJlIHNldCAvIGhhcmR3YXJlDQp3b3JrYXJvdW5kcywgbWVhbmluZyB3ZSBub3cgaGF2ZSBhIHNp
bmdsZSBpbnRlcmZhY2Ugd2hpY2ggY2FuIHdvcmsgYWNyb3NzIGFsbA0KZXhpc3RpbmcgUm9ndWUg
R1BVcywgd2hpY2ggbWFrZXMgdGhpbmdzIGEgbG90IGVhc2llciBmb3IgdGhpcyBuZXcga2VybmVs
IGRyaXZlci4NCg0KPiAtIG9yIHdpbGwgaXQgaGF2ZSBuZXcgZmlybXdhcmUgYW5kIHVzZXItc3Bh
Y2UgY29kZSBmb3IgdGhlc2Ugb2xkZXIgY2hpcHM/DQo+IC0gb3Igd2lsbCB0aGVyZSBiZSBvcGVu
IHVzZXItc3BhY2UgY29kZSBmb3IgU0dYIChhbmQgUm9ndWUpPw0KDQpXZSdyZSB1c2luZyB0aGUg
c2FtZSBSb2d1ZSBmaXJtd2FyZSBhcyBvdXIgY2xvc2VkIHNvdXJjZSBkcml2ZXIsIGp1c3Qgd2l0
aA0KbW9kaWZpY2F0aW9ucyB0byB0aGUgaW50ZXJmYWNlIHRvIGNhdGVyIGZvciB0aGlzIG5ldyBr
ZXJuZWwgZHJpdmVyLiBJbiB0ZXJtcyBvZg0KdXNlcnNwYWNlLCB3ZSBhbHJlYWR5IGhhdmUgYSBW
dWxrYW4gZHJpdmVyIHVwc3RyZWFtZWQgdG8gTWVzYToNCmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9tZXNhL21lc2EvLS90cmVlL21haW4vc3JjL2ltYWdpbmF0aW9uL3Z1bGthbg0KDQph
bmQgd2lsbCBiZSB3b3JraW5nIHRvIGVuYWJsZSBHTEVTIHN1cHBvcnQgdmlhIE1lc2EncyBaaW5r
IEdMKEVTKS10by1WdWxrYW4NCnRyYW5zbGF0aW9uIGxheWVyLiBUaGlzIG5hdHVyYWxseSBsaW1p
dHMgc3VwcG9ydCB0byBTZXJpZXMgNiBvbndhcmRzLCBhcw0KYW55dGhpbmcgb2xkZXIgaXNuJ3Qg
Y2FwYWJsZSBvZiBzdXBwb3J0aW5nIFZ1bGthbi4NCg0KPiANCj4gPiBTcGVjaWZpY2FsbHkgSSB3
b3VsZCBhc2sgdGhhdCB0aGUgRFQgYmluZGluZ3MgaW5jbHVkZSBhbGwgb2xkIGFuZCBuZXcgUG93
ZXJWUg0KPiA+IGhhcmR3YXJlIGluIG9uZSBnbywgdW5sZXNzIHRoZXkgaGF2ZSB2ZXJ5IHNwZWNp
ZmljIGhhcmR3YXJlIGRlZmluaXRpb24gbmVlZHMsDQo+ID4gd2hpY2ggSSBkb3VidC4NCj4gDQo+
IE91ciBjdXJyZW50IGJpbmRpbmdzIGZvciBhbGwgU29DIHdpdGggYSBTR1g1IEdQVSBpbnNpZGUg
YW5kIHdoaWNoIGhhdmUgYXQgbGVhc3QNCj4gc29tZSBvZmZpY2lhbCBMaW51eCBzdXBwb3J0IGFy
ZSBoZXJlOg0KPiANCj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5wdnJzZ3gtZGV2Z3JvdXAvbGlu
dXhfb3BlbnB2cnNneC9ibG9iL2xldHV4L29tYXAtcHZyLXNvYy1nbHVlLXY4L0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvaW1nJTJDcHZyc2d4LnlhbWwNCj4gDQo+IFRoZXJl
IHdhcyBhbiBhdHRlbXB0IHRvIHVwc3RyZWFtIGF0IGxlYXN0IHRoaXMgcGx1cyBnbHVlIGNvZGUg
KGkuZS4gZGV2aWNlIHRyZWUNCj4gc291cmNlcykgc29tZSB5ZWFycyBhZ28gYnV0IHRoZXJlIHdh
cyBubyBjb25zZW5zdXMgYWJvdXQgdGhlIG51bWJlciBhbmQgbmFtZXMgb2YNCj4gY2xvY2tzIHRo
YXQgc2hvdWxkIGJlIGluY2x1ZGVkIGluIHN1Y2ggYSBiaW5kaW5ncyBkb2N1bWVudC4NCg0KSSd2
ZSB0YWtlbiBhIGxvb2sgYW5kIHlvdXIgYmluZGluZ3MgbG9vayB2ZXJ5IHNpbWlsYXIgdG8gdGhl
IG9uZXMgd2UndmUgY29tZSB1cA0Kd2l0aC4gSWYgeW91IGRlY2lkZSB0byBhdHRlbXB0IHRvIHVw
c3RyZWFtIHRoZXNlIGFnYWluLCBwbGVhc2UgZmVlbCBmcmVlIHRvIENDDQptZSwgU2FyYWggYW5k
IERvbmFsZCAoYWxsIG9uIHRoaXMgZW1haWwgY2hhaW4pIHNvIHdlIGNhbiBwcm92aWRlIHNvbWUg
ZmVlZGJhY2suDQoNCj4gDQo+ID4gQWxzbyBJIHRoaW5rIHRoZXkgY291bGQgdXNlIHlvdXIgaGVs
cCB0byBnZXQgdGhlIHByb3BlciBmaXJtd2FyZSBmb3IgdGhlIG9sZGVyDQo+ID4gaGFyZHdhcmUg
bGljZW5zZWQgcHJvcGVybHkgZnJvbSBJbWFnaW5hdGlvbiBhbmQgaW5jbHVkZWQgaW50byBsaW51
eC1maXJtd2FyZQ0KPiA+IHNvIHRoZXkgZG8gbm90IG5lZWQgdG8gc2hpcCBmaWxlcyBvbiB0aGUg
c2lkZS4NCj4gDQo+IEluZGVlZCwgdGhpcyBhbmQgc29tZSAidW5pdmVyc2FsIiB1c2VyLXNwYWNl
IGNvZGUgd291bGQgaGVscCBhIGxvdC4gQ3VycmVudGx5DQo+IHdlIGhhdmUgY29sbGVjdGVkIGEg
bG90IG9mIGJpbmFyaWVzIGZvciBzZXZlcmFsIGFyY2hpdGVjdHVyZXMgKGUuZy4gSW50ZWwsIE9N
QVAsIEpaNDc4MCksDQo+IGJ1dCBhbGwgZnJvbSBkaWZmZXJlbnQgRERLIHZlcnNpb25zIGFuZCB2
ZXJ5IGRpZmZlcmVudCBhc3N1bXB0aW9ucyBhYm91dCBzeXN0ZW0NCj4gbGlicmFyeSB2ZXJzaW9u
cy4NCg0KVGhlIHdheSB0aGUgU0dYIGRyaXZlciB3YXMgZGVzaWduZWQgbWVhbnMgdGhhdCBpdCBo
YXMgdG8gYmUgYnVpbHQgZm9yIGEgc3BlY2lmaWMNCkdQVSwgdGhlIHZlcnNpb24gb2YgdGhlIGZp
cm13YXJlLCB1c2Vyc3BhY2UgZHJpdmVyKHMpICYga2VybmVsIGRyaXZlciBoYXZlIHRvDQpleGFj
dGx5IG1hdGNoIGFuZCB0aGUgYnVpbGQgY29uZmlndXJhdGlvbiBoYXMgdG8gbWF0Y2ggYXMgd2Vs
bC4gRXNzZW50aWFsbHksIHdlDQpkb24ndCBoYXZlICJ1bml2ZXJzYWwiIHVzZXJzcGFjZSBjb2Rl
IG91cnNlbHZlcy4gV2l0aCBvdXIgZm9jdXMgYmVpbmcgb24gUm9ndWUNCmFuZCBiZXlvbmQsIHdl
IGRvbid0IGN1cnJlbnRseSBoYXZlIGFueSBwbGFucyB0byB3b3JrIG9uIHRoaXMuDQoNClRoYW5r
cw0KRnJhbmsNCg0KPiANCj4gPiBZb3VycywNCj4gPiBMaW51cyBXYWxsZWlqDQo+IA0KPiBCZXN0
IHJlZ2FyZHMsDQo+IE5pa29sYXVzIFNjaGFsbGVyDQo+IA0K
