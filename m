Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 864194F800B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 15:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A97910EBF4;
	Thu,  7 Apr 2022 13:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6F210EBF1
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 13:06:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TrXIbY3ceU/4BIlowXljMSWpTd8wD0fZugls2DCCPbAGYoRqRi/3ma7dJm85rIvxI9+wb3ekRkEg+m4YVF6NKhIlWCXjY5WHO3J90Basg2fcubelfBwnM5GixCQnMUj/k0hq4TS3DifiH46aoUUHwbJGp/TX7nf2LZJsVghHafCTDlwaNbNZ3dW1YvZKfJIUOCtB5/QjuXsnwqRxfB9UpcfjbuJKo2KMNrKIThwTfV6DKeVQS6qw6HtewQr01M2oJYtsOsUOJ0vLUb799t/bD+tV1xsTqw11gYsWfoYfVz/JhUy39gw6/llpiB5x4qIc6OU1iwEGYHsYymn3PnObiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7b9qIDpllQZS+zdhs+iW3lY2Jx0PJgQAQ7dpI7KgR0=;
 b=BKIAq8sw7Ez8i01aGSyC+e6ujhWJleJjW2iqjD6f4xfzXyQDRw6oXDkiYKiLqcRyfY8nxgWUx8nyLG5/N6TVVaOwI3ArdPO9cba6OQLa1utHW/UtHsAygo9JR4z05e7Nda9LO9msB2UNOrS4wHHLDsZDGkOEexp5WItbUVBWWCBhfGV5bGQVa5T8sJ/4337Lhio5/CXQQ6CmMPp+kk2XFoheV1lKeJZ1JeOdo3TU5FE3p+KUwlRep5XSVmxsjR+0CwttaTA5JKSbiGJtRROY43hfOus1+2koV8hBLH9iVog+qC0Nm0FYd71fnsZcRzXo9RB7AvPqdhuRGf3zoLIi+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7b9qIDpllQZS+zdhs+iW3lY2Jx0PJgQAQ7dpI7KgR0=;
 b=p5ZAZ5U/jfV3gdyO892eq7+IaSQDegi8M3lMlR/RE/S5m90TFi1Ijn43LSOaWJH8NIPa/EaE/UYziq13XmHFdax4ng5iAumJfyykI7YldLO3M2YsFnRD4PXhbtMWkprojTQSmzPx9mehsvyAMNaA17XyyE3vJrwG6kRhjD/ANsc=
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by CH2PR12MB3749.namprd12.prod.outlook.com (2603:10b6:610:2a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 13:06:26 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::6985:8f5:c1dc:5540]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::6985:8f5:c1dc:5540%6]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 13:06:26 +0000
From: "Sharma, Shashank" <Shashank.Sharma@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "peterz@infradead.org" <peterz@infradead.org>, "daniel.vetter@ffwll.ch"
 <daniel.vetter@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] futex: add missing rtmutex.h include
Thread-Topic: [PATCH] futex: add missing rtmutex.h include
Thread-Index: AQHYSnUdAbcmlvR9FkSC4cpVDhmrr6zkazzw
Date: Thu, 7 Apr 2022 13:06:26 +0000
Message-ID: <MW4PR12MB5667F5ABA21F6261D635AAC4F2E69@MW4PR12MB5667.namprd12.prod.outlook.com>
References: <20220407114619.961750-1-christian.koenig@amd.com>
In-Reply-To: <20220407114619.961750-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51ec5140-2091-4245-3f6b-08da18976c8f
x-ms-traffictypediagnostic: CH2PR12MB3749:EE_
x-microsoft-antispam-prvs: <CH2PR12MB3749866253607DBF2653F166F2E69@CH2PR12MB3749.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O9B6/rcugwVlrB43MbP3kAUTU1eDX1r6igsDAxQ/j25iZA+p5mzvQG6YbarR20ZbBceTuNngsj6YNeQ4dNf2EwOIuwl6zGBtQcWd+WZ7aq24lg0l/wbtQ4ldGdZ0fekYfeuA2yDUbqZ06cVpqOyxqErB2qg999tODwaHgOU4FlVAcyZcbEJU2o6recOiJ00MLiED52nY+uqL6gApBcr7Od6TCNxN/soAAK9Uh6AFQjxJQlMJ+YD+iS2C8SuyoPF5tHI67bxW05WstVwwNwk6M88aibWTbxdyazsL7o/wqo4cHsCnK/GqblqSNvy2B0HlfURaLFM3XbuWGWZ6eeAc0ri8QrD+LE7bRlaq48ODC7uHdOFMlCw6HidUIypJlleEwrSxiXWZRpIPn46cWaL9TwlZC0rDQ4rHSPLOR9VxsrvhhEe9C7Ev1H92bADJsnvC6exZSu2s0KhJl/eacYntszuaAw57PNGuTmPgTn5h7VZ5/jGWSxuOxJnXKN+ZH/8NhkUIHsAHzq0hL5bSqPfYOXxcz82mx6GOKdgn4TK7rz6yPIFrTIiBph6/XSYFOQB0Q7R8PCO4GC1BRhT5Bb+IRI0TtukD4NP68c2YU0fO/2klYnvsiDw6jZVTP6YPe/A7Hrolh+sG4lYPTINj7MB/NQ5EoUZzCSuqTcx1sHAjg/CjZGojlDK4AiTKx5hSuQ+PrWQi7LqS+E76nyvUcvAcmw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(9686003)(83380400001)(55016003)(38070700005)(186003)(26005)(4744005)(2906002)(122000001)(7696005)(6506007)(508600001)(53546011)(33656002)(8936002)(71200400001)(5660300002)(86362001)(316002)(76116006)(8676002)(4326008)(52536014)(110136005)(64756008)(38100700002)(66476007)(66556008)(66446008)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlZGcFQ0ZmMwbzlES2NtUWt6OFpJVGNVeE9GeGFXbE94OENsOStGNFQ2YjV4?=
 =?utf-8?B?bFVRZlBoR2trMng4RDlKb09RVno4NXEyblVsZHZ3bndTRGNZS09ZMmM0UC9B?=
 =?utf-8?B?aGJUQUZPL1UwNW80OEtXZHErZUU1bWZKdzc4OFJ2eGp4S3pmSWMwQmtZcTVp?=
 =?utf-8?B?OGhURHo1NGI3dC9nQTlaNUlsTzYrclc5cHdIenoxenNvdHNBNzl6OFRWOXV4?=
 =?utf-8?B?M3M5TkJxWTZxaDZOVlhEcW51bnl2cHVBMnpaZHVaSDc3VDA4SGVPTWxXSnIr?=
 =?utf-8?B?N2VJL3JRdVYxYlR3Z1UrNlJlUkhVdnloRWpRYmF6VEROTXJXa0N0SmE1SHo2?=
 =?utf-8?B?VnVUcFhUTU9JZHoyRUc3L1pvTDVaUS9VR3VEeUR4TUhLcVlIU2NJOXFLaGI2?=
 =?utf-8?B?S0IvaEVJSkc0b2o2VVZObUJyTXFLZ0hmSy9qK0UzdjVvM2pVVTRJSStaNFZR?=
 =?utf-8?B?b1BwRmVjeUJTUWtUZEhES3R0aUtXcUwrck02MUxZUVVhUDNDVkNrN0F0T1ov?=
 =?utf-8?B?bnROVVZjeWtqMlZLdjM5b1RsY0I4MkhwWE92WlhPTHBOQk56WlY0UHN3NXpi?=
 =?utf-8?B?T0ZVdS9HaDdjRVJUbjNNWTh2YlAvcGFqeUR0NTNUYStHdzdOelRNOFd3YS9D?=
 =?utf-8?B?Q3dOdGFLSk8zQ1hkdG1wTytjdGltbXVnYjFqYVJPcW1iT3NXNFN0QjdHSWRV?=
 =?utf-8?B?Qm01dEFuWUdHRndPMVM5Qk01U3dSS0lLNDk5S3VpQUxlYzBucjRDelUwRlRv?=
 =?utf-8?B?Zm1qWUF4RkZsdDB2cFFOYXJZMHVnZDJrTWdiZjdNQUhlV3BwMnJPdGdZdWY5?=
 =?utf-8?B?SHRtak9kVm1Yc0FuakZhSGI4Tm1wSGwyMEU4bWNIdjBYM2dpQXE2Z0c2ZWF1?=
 =?utf-8?B?bjFycHF4ekFvTlFialU1Smo2MzRzQTlRMzMzbitUcFFpUHo1am9PU003dUVo?=
 =?utf-8?B?b000c2E5ck44bENtS1hwcnUwR21HNkhPTFhRdmNJY0VPR1c1T0N5ejFNaHpy?=
 =?utf-8?B?TlJzN2hRTHRSeTI5WTRGUWNsNlllckR1d1huekRNeGF4TGJPNzlVbjJvY1Ry?=
 =?utf-8?B?cUYvUDJJajNwcG00NXk2RklBNm5kQ3FyVVNJSXEvVFVEclF6L0d2ZFduZ1NR?=
 =?utf-8?B?M08yRTc3cW9uU2QvcVpTV1NNdXl0bnpCbzUvQVdsUUY4c1l6cTh1emtQcEFp?=
 =?utf-8?B?cUxFMzgxNjlEWTloK2t1cWErS1JmRUxhMFo3bkJmZXVKTHlPSmszcStYbkpJ?=
 =?utf-8?B?KzRzbGNMZEl6QW9sTElXYnp4VVNlN093ODdST2FnQW1wS0I4dVdvT2U2bUx3?=
 =?utf-8?B?NWh3K0R3S0dJT2dZeURsUGkrWVJvNmV3WGdRSFJOMDBxeVhGY0djdjhiamFp?=
 =?utf-8?B?THI3dWpJVGRiSSthOWVOU3BuV2o3LzRReDhkbmE5LzVvV1NRbnQ0NzVEaStY?=
 =?utf-8?B?WU5zcUVpWE5DWmwvblFPMUNJaDJTRm9SbEVRRDF4MDNpQS9FOVdwUkhwVUZr?=
 =?utf-8?B?K0crd3BwVUw4K2xORmt1b0t5ZC81TlVYdGxNWHFvQTlXNlczYjk3c0Q1NXN2?=
 =?utf-8?B?clZnbXpmS2pCdHZaWHFxNCtPMmZuckE4d1pXS0N0a1oxMUIxdFpkamU5Smgz?=
 =?utf-8?B?UnZ1a3hTajJVb1VxcUsyNUw5aVozSHV0Y0Rzek5FMk53Y2xzQjZFSFZFckdw?=
 =?utf-8?B?RGdIRkl4cUFmTWY5ZUExbXVKZWg0L2s4RkpTNndRSnFJa2k5T2FRSHR2WkRy?=
 =?utf-8?B?N2x3MVBZSjlVZEJNeWVzQ2h1VXFRNnZEdzZUS2FyeG1YN3k2MENOb0svRW00?=
 =?utf-8?B?S3BSZFkzQnhoMXRtaTB2eFNYWTY0ZlJ3akRGTFpyTVZqc0ZTc3FVVDRrNENR?=
 =?utf-8?B?RDlnZWpXS3pNbURCbXNFMzBydFNnVVZHSHN5TVNqUzRwendZT05lQzBEVlRH?=
 =?utf-8?B?ZFI4MnFWL3RNaW5rcnRxM2RMZDdzVkZUdnMzb3BqRU1LMkRlSmpGYlp2M3ln?=
 =?utf-8?B?QlJnUUhZaXlvakRuZ0VsZzhUUWFzcHE1UVNUdnJaVWJPTnQ3b09WaFY2L2Y0?=
 =?utf-8?B?WStJNllFSEtGNVJBYVZSMW1Fbko5TDlMRDJCRndkNC83ZmcwcUJkRlIyZ0pT?=
 =?utf-8?B?amRuRm11cjRhazUxQVh4R0hSVXhYd3NqTXFqamNlN28xTVFPUkN3cm54YUdK?=
 =?utf-8?B?V2o0anhmVHo2NEd4OGswSzBabjdxL2N4bVBZSzJTQVNsTHdqc1gzQkpjWlpj?=
 =?utf-8?B?eVRIWXhUTkllT0xmVVI1WXFqOGdsS0x0ajlKWDVGbnFHN0dlKzI1VDNlRzJK?=
 =?utf-8?Q?MsJ4r33YyBzDBot4sm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ec5140-2091-4245-3f6b-08da18976c8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 13:06:26.5083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8GEqumBik30AFSF+X4ujeO1WO8oopqen8CkGUdyHd9oLc8bJQXdtXxaOSy4Uh4Gm+/ZPbIGeF7ciqXcgrDyBbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3749
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWNrZWQtYnk6IFNoYXNoYW5rIFNoYXJtYSA8c2hhc2hhbmsuc2hhcm1hQGFtZC5jb20+DQoNClJl
Z2FyZHMNClNoYXNoYW5rDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogZHJpLWRl
dmVsIDxkcmktZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBP
ZiBDaHJpc3RpYW4gS8O2bmlnDQpTZW50OiBUaHVyc2RheSwgQXByaWwgNywgMjAyMiAxOjQ2IFBN
DQpUbzogcGV0ZXJ6QGluZnJhZGVhZC5vcmc7IGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g7IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0
aWFuLktvZW5pZ0BhbWQuY29tPg0KU3ViamVjdDogW1BBVENIXSBmdXRleDogYWRkIG1pc3Npbmcg
cnRtdXRleC5oIGluY2x1ZGUNCg0KU2luY2UgdGhpcyBpc24ndCBpbmNsdWRlZCBoZXJlIGFueSBt
b3JlIHNpbmNlIHRoZSByZW1vdmFsIG9mIHd3X211dGV4LmggZnJvbSBzZXFsb2NrLmggd2hpY2gg
Y2F1c2VzIGEgYnVpbGQgYnJlYWsuDQoNClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCkZpeGVzOiA2M2U4NzY4YjJhZDkgKCJzZXFsb2Nr
OiBkcm9wIHNlcWNvdW50X3d3X211dGV4X3QiKQ0KLS0tDQoga2VybmVsL2Z1dGV4L2Z1dGV4Lmgg
fCAxICsNCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCg0KZGlmZiAtLWdpdCBhL2tl
cm5lbC9mdXRleC9mdXRleC5oIGIva2VybmVsL2Z1dGV4L2Z1dGV4LmggaW5kZXggYzI2NGNiZWFi
NzFjLi5iNTM3OWMwZTZkNmQgMTAwNjQ0DQotLS0gYS9rZXJuZWwvZnV0ZXgvZnV0ZXguaA0KKysr
IGIva2VybmVsL2Z1dGV4L2Z1dGV4LmgNCkBAIC0zLDYgKzMsNyBAQA0KICNkZWZpbmUgX0ZVVEVY
X0gNCiANCiAjaW5jbHVkZSA8bGludXgvZnV0ZXguaD4NCisjaW5jbHVkZSA8bGludXgvcnRtdXRl
eC5oPg0KICNpbmNsdWRlIDxsaW51eC9zY2hlZC93YWtlX3EuaD4NCiANCiAjaWZkZWYgQ09ORklH
X1BSRUVNUFRfUlQNCi0tDQoyLjI1LjENCg0K
