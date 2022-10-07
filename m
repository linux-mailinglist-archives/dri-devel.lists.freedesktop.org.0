Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B6F5F72B6
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 04:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63DD10E6C2;
	Fri,  7 Oct 2022 02:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-westcentralusazon11010006.outbound.protection.outlook.com
 [40.93.198.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE5B10E143
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 02:16:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C02ueujayuH3O/cXFkvkWa7Qy+n0GcYGT9ziLOCVnc8Dr6xuR7utTuZ9LVY0vGdR2rqFx0XMM1QXjTXOEvxfGIENGGWF5IOPAMjgQIzaxnCrPIwvwRO4lr4+NgQ/peLx0J5IhRJIGEjFTcyDKkFZARmtEDeJgxaGkv5IqGDoaq95awJlcmAK3kPwONGZfzJtBWLLzUdwEEqF/jp3InFCSpE1O34IfsL9YzVmAWuc8S276IYiXDwLLHYHO8I3v5pPhLP47H20wKgmXvfUN/yeciVkxYQZbSh+j4MPf9y5DjZvTjzwZavMIdJPDbh4pfThhGcHiAcOQK2rcJzwjt6lSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8N9dZfNMFbO7smU12PHH/1Hb/ggyKlaz0RIxgUXevc=;
 b=FgAVPcHsoMqacubCdKK1ZM27PoqZxDHOeKhZ1neSwmpt+4O/5UTusFKRXwHPKHWxZb1nYAoRNdO7dd7mKLpax/YNYLo1PQzUDNz1TMjjVWB7o98Kr0n9RzOWHmcv8bTVhM+dFNDG46vOhrMnUlC0pWzfCOdoUteQEvtBisD83L39gNYmxgPCpcMbCn6x45Y3owCuWD+/7COCy8jgft6AZwLe/QEoPQrSKD2FO9ROu08cIVb/lMxBJuw/y9gZ9dlqlrVSmrVWlbDLAAOzhMwClWAYcY50M1dqkwYQo1MXu3ncu/PJvAk1kz8yrdfxHJ/4V4DQfxPbk+fRGxWGWQw18A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8N9dZfNMFbO7smU12PHH/1Hb/ggyKlaz0RIxgUXevc=;
 b=QseZ61ElDRTj3FNW0ZfB66gvT9dcmziQ5Ry2SQaXdXi9P+KNFynk1t/3B0F4DKxBYvj4A/rcE8PbDgvB4w/u6NIuKfhWTqNtAtotHQ7DlRzpddMDPkIX8i0Le15RYCZ074jc3hjMxYQvrOMyXEAnOulj4/DDYRBP0qzfV72BWyQ=
Received: from CY4PR05MB3047.namprd05.prod.outlook.com (2603:10b6:903:f4::7)
 by PH8PR05MB9266.namprd05.prod.outlook.com (2603:10b6:510:1c1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.4; Fri, 7 Oct
 2022 02:16:55 +0000
Received: from CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::d893:b27e:529:35ae]) by CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::d893:b27e:529:35ae%7]) with mapi id 15.20.5709.009; Fri, 7 Oct 2022
 02:16:54 +0000
From: Zack Rusin <zackr@vmware.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>
Subject: Re: drm fb helpers hotplug/resize
Thread-Topic: drm fb helpers hotplug/resize
Thread-Index: AQHY2PONgaPiyFyXo0CBzirg/4P2Z64BAc6AgAEyBwA=
Date: Fri, 7 Oct 2022 02:16:54 +0000
Message-ID: <a3f7176eb7ae321f939d906adb1873cef7fe01ce.camel@vmware.com>
References: <9884c2f0daeccbaeaa9995bd8bdb25b98838b980.camel@vmware.com>
 <8fc0e4de-2448-1d04-d1b0-16f87498fe98@suse.de>
In-Reply-To: <8fc0e4de-2448-1d04-d1b0-16f87498fe98@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR05MB3047:EE_|PH8PR05MB9266:EE_
x-ms-office365-filtering-correlation-id: 6102ea89-560b-4f7d-2296-08daa80a010b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kT2NNppeALnkH7Swm4k+Zk2bNLd6lwRaXKpGP7OIxdEe3fB3A9zim3emDwGSTWBF/DREcdNC3gyljplU9qYBJsrpeOorKDVp8Z50R9bISiUqGOmZTnozADiCcla/c6yFnL3pF167TDg+Oh/m8QKm3XxLEJk5Kq5Gs7ng28Yg/Jv6sw1VS9yXeVlOGiUCoQ8UFB4TIHwkD2Em+Kgcu0aWeR0qddzAh3RxslRYs3rz1ZEYZjDJQSCn+uDdEneL32FKo92+L30JPWJpTK2NCWF4M3J49adNkmOqggBZuP4ePnoeCSXpYbzysQNLK3iVrDNPLhHkWRipqhV8LJb1fHqDocIqAIPoimj0BhLisXPU/324bMWSow76EtqCSIYyVhDmZjq6NJRwPJJhPwnq4417RS3qnRHl/7p+4EbCNMmH64/Qyz0BHHg/3pQDF0qLMon+qxYjypvtmMlqLAiORuDhpTxNwWhnC0flwJRHUr81CvcabuvbOmOCz/THZlQHeQfLJtFJvaChENfpnXyy0epU0k/IQQudG0cm2jRm3tE0J/qSoPmFVt097RltFqDsXbSUQXt7eccobbfXQJWx7rOWRY3QxW98IB8lRMxZ0Swt2zQG/czYTMFszMDNt3xQP/WFhKSc0ZXTYe07u9fFmkmbk4zBCRBJPq4SA3FDrk/jw0PyOjid7UFw2uZptN+6DavRl021f9+jKZSvGHL+CCXyEaIcLqReWe8s8BfljID/JY2cCqRaPvKjbo/V7X7GbdZXv7B7vK6fHvfNPLuCgh8g91qY7mlcmlKVEdaoO3eWmsAqbQT3+Qbabr8kWidTNZm23vM3UDsHnfc9SQb9YhK8I0vWYQQePefC8IwVdhuif5hN5bgeyr5zcQmqLHF368BF88fk1gMB68fQmvy5ELDiIg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR05MB3047.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(451199015)(6512007)(8936002)(83380400001)(122000001)(26005)(41300700001)(6486002)(38070700005)(478600001)(316002)(76116006)(66946007)(6506007)(38100700002)(66446008)(36756003)(8676002)(91956017)(4326008)(66476007)(6916009)(66556008)(966005)(64756008)(2906002)(71200400001)(66899015)(5660300002)(86362001)(186003)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aC9UODhNTmMwbGZvMU02R3Y0YzJCd3VLN1RCK2EvMWJUdkllcGhMWXJFa0px?=
 =?utf-8?B?cC92TElERFlneE9HK0xpZnBGYlNJRHpXMTNkancraUNVOHR1VndaZFhzT3U2?=
 =?utf-8?B?OWVVTHlKaGFsYW85YU1SWThqZmx6RXZSS3lFQmxmRzVXWXdraG1NL1JXcUky?=
 =?utf-8?B?cVZMMlBYQWRjYlMvZDFxemhoRVFIeVBmaW1yMnVKTEZzKzdkZEJ1b0tRR2k5?=
 =?utf-8?B?YVh3NXhHL1RoOTRYWWl4T0Rrdy9rR2M0dXNWNE9Idm9PVkNlOGhLaW1lQ1ht?=
 =?utf-8?B?dHlLOEgyVDVYa2kzSVhyaEJKd05RM0s1bUp1RlBNd3pzSFZSVTJRNlZFUE5r?=
 =?utf-8?B?M2poQU5ySUcwU1BQSURBZXlCWStPWXhrd2JsSUl5M3dJMVZiaG00dUp1NEFm?=
 =?utf-8?B?cmMvYU5RVmZVOVdWVHR4RlF0QWE5NlB5Ykw3TGJnUHo5c1RFUzRnQldNZTR3?=
 =?utf-8?B?bFpmMzd6S1hCbUNOcWU2NWw5UkdYZ0I1cTVBMFh4Z3l0dGpqQmNsQU9XTGJE?=
 =?utf-8?B?WTBmZ21yeVZSdjFRWG5PRHY2WTJqeDdHNjdpR0NGSWczUUtNQmhCN3VKSmE0?=
 =?utf-8?B?YXVXZjhjWHpLRnV5UHpRaFFZZUxGVUFyL2Q3cGNHTytSTkp4a1NvMXBnVGc0?=
 =?utf-8?B?Q3RHVUl3aXN5eXFFenJFdHZYdXVpcGJoZEtZVXBjYkxDZS92ZGJ2dXd6WEVI?=
 =?utf-8?B?a1p0N3hQc2tQRXc4RWNQNjlDNElqSTdPVmFTMlc4SkhXc2N6Qm1WTHF6Y1pn?=
 =?utf-8?B?MXpyZVlUbE5CQ244dlVKeXpxZ2krK3JGMjk3ZGhlUEVNYysrZUpSNVhlM3pr?=
 =?utf-8?B?WWtRTlJHYlNrZXZ1S0RQMWtLaFNzSS9ObSswcnJNdlJxUnZ1elJ3MlVTQ05n?=
 =?utf-8?B?Z0FRU2tmcDRCMzdTMWE5V0lDNVB5TXpwRTQrak9KVzJYaURjMXN4SDV0dWM4?=
 =?utf-8?B?UGZHN3Q0cmh6UlpKb1cxeHlkcDU3bWFsV091RkJFSnBVc0pZM2lRM2Y5NFNQ?=
 =?utf-8?B?Q2V2Z2JaMkoxN0VhMTU4cXlMMm1YMEhMR3RkajNmOFAwQmdMYXJoU01rcTlN?=
 =?utf-8?B?WnlCL3B2NVpLampMRjRuN0txZUlTWG1NdEtlUENoU0V0bkFjVlpPclZOV2hL?=
 =?utf-8?B?ajdMUWlHSXlVdjREUnVTN2xqRUhqSnVkTUpjM0dzU1JVR0toZUJ3c1BtUEFS?=
 =?utf-8?B?N2lNWVZ3RkxRK3ViR24vYTRNSnpxR3RFcVZvdCtJUGZZM1ZKWXkxNC83UnVH?=
 =?utf-8?B?Q083c3kvMUJCdTJJeXpqeW1WQU9TV3ZDNUxjU3BzdENRaGl5WVdDU0djNnRI?=
 =?utf-8?B?V3FQa2U4WWJNSm1lUlpYMGtuS1B1OWpIb2pQejlVNEdRZDVEOW45bXU1bGg4?=
 =?utf-8?B?OEg3TThqRExDc3cwNEhkRmtkRFRuTkY0cnRpNkJHcjNKWFo0d05JTnEyM01J?=
 =?utf-8?B?R3NTSTJsTWhhNEpDcEhOQndIRHhDZjNWNXJsUkxPb3pEUGk3dkZMK2ZUQkIv?=
 =?utf-8?B?ek5uMUpsYnFQU29GY21lRnBlbHRSVGVncU1yL3ppNGNEcG96NWF1Q290ZVdB?=
 =?utf-8?B?QnB2RGtlbkJEYlR2Vjhldjd3ZkhlaW1lMW5IVEVKb2tEUlIyVWg3OHVxSXRl?=
 =?utf-8?B?UzE1ZnN1cnJyeEdTYlJPSzdnUkFONFlBTE5SdGJYWmt1bVRBbkFhZzFsWnY1?=
 =?utf-8?B?UUF4WmxVaHNnYzBFUmlLaThvd3RtNHVoNHQyTWZEaGVzR3JjUklUUnlwZXhS?=
 =?utf-8?B?eHFndmdpL2QzR3hGb1BsSGd1RmQwMlQzYmZaU0VCQytJdnNaajdWQjkyUEJL?=
 =?utf-8?B?RG9SWXRyeSt6R0NrbE9rcTlESGl2YkNOWDh3ODUyMzlYdVBncGliSTVzL0Jh?=
 =?utf-8?B?dVZ0WktoZEhuSkp2NlRaZzV6MDhSZ25sNkJ3ajBKS3JjMlladitZQjhCUWZt?=
 =?utf-8?B?ZzZTYmdtWFUrZHIwS2w0NmdtdmlCbFhTTzhVZHowMDFLWFI0Wi9uTnVFTFpI?=
 =?utf-8?B?bGRWQkJ3eFIzRllXY2lhdWNJYVg2UEl0RFExb2NBZGwrNHArUUhoaU9qeDgw?=
 =?utf-8?B?R3p0Y1ZURXB5R3lJTzNMT2pFaVU0aVJsMkw5S3hGbHl2L3c0UXV1ZXVsTDlw?=
 =?utf-8?Q?auoIrGa5ga2TdP2x3ElxQ/Xa8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3F0199C8192E64F906A7B9F45A30A85@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR05MB3047.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6102ea89-560b-4f7d-2296-08daa80a010b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 02:16:54.6524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zn0It9fgafCBsdPGVem5RISSstpYnfHOuHPZv7UJXK5HyO51mMHuo2fn9Zjb28Mc+OHzLRmhS+n2NMvVDflTew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR05MB9266
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIyLTEwLTA2IGF0IDEwOjAxICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4gSGkgWmFjaw0KPiANCj4gQW0gMDUuMTAuMjIgdW0gMjE6NDkgc2NocmllYiBaYWNrIFJ1
c2luOg0KPiA+IEhpLCBUaG9tYXMuDQo+ID4gDQo+ID4gQmVjYXVzZSB5b3UndmUgYmVlbiB0aGUg
b25lIHdobydzIGJlZW4gd29ya2luZyBvbiBkcm1fZmJfaGVscGVyLmMgdGhlIG1vc3QgdGhlIGxh
c3QNCj4gPiBmZXcgeWVhcnMgSSB3YW50ZWQgdG8gcGljayB5b3VyIGJyYWluIGEgYml0Lg0KPiA+
IA0KPiA+IEkgd2FzIHBvcnRpbmcgdm13Z2Z4IHRvIGRybV9mYl9oZWxwZXIgY29kZSB3aGljaCBp
cyBsYXJnZWx5IHRyaXZpYWwsIGp1c3QgcmVtb3ZpbmcNCj4gPiBhbGwgb2Ygdm13Z2Z4X2ZiLmMg
YW5kIHJlcGxhY2luZyBpdCB3aXRoIGEgY2FsbCB0byBkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cC4g
QnV0DQo+IA0KPiBUaGFua3MgYSBsb3QgZm9yIHRoaXMgd29yay4gSSBoYXZlIGJlZW4gbG9va2lu
ZyBpbnRvIGRvaW5nIHRoaXMgDQo+IGNvbnZlcnNpb24gbXlzZWxmIGF0IHNvbWUgcG9pbnQsIGJ1
dCBuZXZlciBmb3VuZCB0aGUgdGltZSB0byBhY3R1YWxseSBkbyANCj4gaXQuDQo+IA0KPiA+IGRy
bV9mYl9oZWxwZXIuYyBjb2RlIG5ldmVyIGRlYWxzIHdpdGggcmVzaXplcyB3aGljaCBpcyBhIGJp
dCBvZiBhIHByb2JsZW0uDQo+ID4gDQo+ID4gZS5nLiByZXBsYWNpbmcgdGhlIGRybV9zeXNmc19o
b3RwbHVnX2V2ZW50KCkgY2FsbCBmcm9tDQo+ID4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20v
bGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuYyNM
MjI1NQ0KPiA+IHdpdGggZHJtX2ttc19oZWxwZXJfaG90cGx1Z19ldmVudCB3aWxsIGNhbGwgZHJt
X2ZiZGV2X2NsaWVudF9ob3RwbHVnIGFuZCBlbmQgdXAgaW4NCj4gPiBkcm1fZmJfaGVscGVyX2hv
dHBsdWdfZXZlbnQ6DQo+ID4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0
L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jI0wyMDAzDQo+ID4gDQo+ID4g
Tm93IGRybV9mYl9oZWxwZXJfaG90cGx1Z19ldmVudCBkb2VzIGRybV9jbGllbnRfbW9kZXNldF9w
cm9iZSBidXQgaXQgbmV2ZXIgcmVzaXplcw0KPiA+IGRybV9mYl9oZWxwZXI6OmJ1ZmZlciBhbmQg
ZHJtX2ZiX2hlbHBlcjo6ZmIgc28gdGhleSdyZSBib3RoIGluY29ycmVjdGx5IHNpemVkLg0KPiA+
IA0KPiA+IEluIGdlbmVyYWwgSSBkb24ndCBzZWUgZHJtX2ZiX2hlbHBlciBjb2RlIGV2ZXIgYmVp
bmcgYWJsZSB0byBkZWFsIHdpdGggcmVzaXplcy4gSW4NCj4gPiBwYXJ0aWN1bGFyIGJlY2F1c2Ug
dGhlIGZiZGV2J3MgeHJlc192aXJ0dWFsL3lyZXNfdmlydHVhbCBhcmUgc2l6ZWQgZXhhY3RseSB0
byB0aGUNCj4gPiBpbml0aWFsIHhyZXMveXJlcy4NCj4gPiANCj4gPiBJdCdzIGRlZmluaXRlbHkg
YSBsb3QgYmlnZ2VyIGlzc3VlIG9uIHZpcnR1YWxpemVkIGVudmlyb25tZW50cyB3aGVyZSBhdCBi
b290IHdlJ2xsDQo+ID4gaGF2ZSBzb21lIHZlcnkgY29uc2VydmF0aXZlIHNpemUgKDgwMHg2MDAp
IG9uIHZtd2dmeCB3aGljaCBpcyB0aGVuIHVzdWFsbHkgcmVzaXplZA0KPiA+IHRvIHRoZSBzaXpl
IG9mIHRoZSB3aW5kb3cuIGRybV9mYl9oZWxwZXIgYnJlYWtzIHByZXR0eSBiYWQgaW4gdGhhdCBj
YXNlIGJlY2F1c2UgaXQNCj4gPiBjYW4ndCBkZWFsIHdpdGggdGhvc2UgcmVzaXplcyBhdCBhbGwu
DQo+ID4gDQo+ID4gSXMgdGhpcyBzY2VuYXJpbyBzb21ldGhpbmcgdGhhdCBkcm1fZmJfaGVscGVy
IHNob3VsZCBiZSBhYmxlIHRvIGhhbmRsZSBvciBpcyBpdCBub3QNCj4gPiB3b3J0aCBwdXJzdWlu
ZyBpdD8gSSBkb24ndCB0aGluayB0aGVyZSdzIGEgdHJpdmlhbCB3YXkgb2YgaGFuZGxpbmcgaXQg
c28gbXkgZ3Vlc3MgaXMNCj4gPiB0aGF0IGl0IHdvdWxkIG1ha2UgZHJtX2ZiX2hlbHBlciBxdWl0
ZSBhIGJpdCBtb3JlIGNvbXBsaWNhdGVkLg0KPiANCj4gSSdtIGF3YXJlIHRoYXQgcmVzaXppbmcg
aXMgbWlzc2luZy4gSXQncyBvbmUgb2YgdGhlIGZldyB0aGluZ3MgSSdkIGxpa2UgDQo+IHRvIHNl
ZSBiZWluZyBhZGRlZCB0byBnZW5lcmljIGZiZGV2IGVtdWxhdGlvbi4gQnV0IGFzIHlvdSBzYXks
IGl0J3Mgbm90IA0KPiBlYXN5LiBUaGUgZ2VuZXJpYyBmYmRldiBlbXVsYXRpb24gaGFzIGFsbCBr
aW5kcyBvZiBjb2RlIHBhdGhzIGZvciB0aGUgDQo+IHZhcmlvdXMgZHJpdmVycycgbWVtb3J5IG1h
bmFnZXJzLiBUaGF0IG1ha2VzIGl0IGNvbXBsaWNhdGVkLg0KPiANCj4gVGhlIHByb2JsZW0gaXMg
dGhhdCBmYmRldidzIG1tYXAnZWQgbWVtb3J5IGNhbm5vdCBiZSByZWFsbG9jYXRlZC4gSXQgaXMg
DQo+IGV4cGVjdGVkIHRvIGJlaGF2ZSBsaWtlICdyZWFsIHZpZGVvIG1lbW9yeS4nIFNvIGVpdGhl
ciByZXNlcnZlIGEgY2h1bmsgDQo+IG9mIHRoZSB2aWRlbyByYW0gZm9yIGZiZGV2J3MgR0VNIG9i
amVjdHMgb3IgdXNlIGRlZmVycmVkIEkvTywgd2hpY2ggDQo+IHByb3ZpZGVzIG1tYXBlZCBwYWdl
cyBmcm9tIGEgc2hhZG93IGJ1ZmZlciBpbiBzeXN0ZW0gbWVtb3J5LiB2bXdnZnggdXNlcyANCj4g
dGhlIGxhdHRlciBJSVJDLg0KPiANCj4gQnV0IGlkZWFsbHksIHdlJ2QgZ2V0IHJpZCBvZiBtb3N0
IG9mIHRoZSBzaGFkb3cgYnVmZmVyaW5nIGFuZCB0cnkgdG8gDQo+IG1tYXAgcGFnZXMgZGlyZWN0
bHkgZnJvbSBHRU0gb2JqZWN0cy4gRm9yIG1vZGVzZXR0aW5nLCB0aGlzIG1lYW5zIHRoYXQgDQo+
IHRoZSBuZXcgbW9kZSdzIGZyYW1lYnVmZmVyIGhhcyB0byBpbmhlcml0IHRoZSBvbGQgZnJhbWVi
dWZmZXIncyBidWZmZXIgDQo+IG9iamVjdHMuIFByb2JhYmx5IHRoZSBlYXNpZXN0IHNvbHV0aW9u
IGlzIHRvIGFsbG9jYXRlIGEgZnJhbWVidWZmZXIgb25jZSANCj4gYW5kIHJlY29uZmlndXJlIGl0
cyBwYXJhbWV0ZXJzICh3aWR0aCwgaGVpZ2h0LCBwaXRjaCkgb24gZWFjaCBtb2Rlc2V0IA0KPiBv
cGVyYXRpb24uDQo+IA0KPiBTd2l0Y2hpbmcgdG8gYSBoaWdoZXIgcmVzb2x1dGlvbiB3b3VsZCBy
ZXF1aXJlIG1vcmUgdmlkZW8gbWVtb3J5LiANCj4gQWx0aG91Z2ggd2UgY2Fubm90IHJlYWxsb2Nh
dGUsIHRoaXMgcHJvYmxlbSBjYW4gYmUgc29sdmVkIHdpdGggdGhlIA0KPiBkcm1fZmJkZXZfb3Zl
cmFsbG9jIHBhcmFtZXRlci4gSXQgZ2l2ZXMgdGhlIHBlcmNlbnRhZ2Ugb2YgYWxsb2NhdGVkIA0K
PiB2aWRlbyBtZW1vcnkuIElmIHlvdSBzdGFydCB3aXRoIDgwMHg2MDAgd2l0aCBvdmVyYWxsb2Mg
YXQgNDAwLCB5b3UnZCBnZXQgDQo+IGVub3VnaCB2aWRlbyBtZW1vcnkgZm9yIDI0MDAgc2Nhbmxp
bmVzLiBUaGlzIGFsbG93cyBmb3IgZmJkZXYgcGFubmluZyANCj4gKGkuZS4sIHBhZ2VmbGlwcGlu
ZykuIFdpdGggdGhhdCBleHRyYSBtZW1vcnkgZmJkZXYgY291bGQgc3dpdGNoIHRvIA0KPiBhbm90
aGVyIGRpc3BsYXkgbW9kZSB3aXRoIGEgaGlnaGVyIHJlc29sdXRpb24uIEZvciBleGFtcGxlLCBj
aGFuZ2luZyB0byANCj4gMTAyNHg3ODYgd291bGQgcmVzdWx0IGluIDE4NzUgc2NhbmxpbmVzIGF0
IHRoZSBnaXZlbiBvdmVyYWxsb2Mgb2YgNDAwLg0KPiANCj4gVG8gaW1wbGVtZW50IHRoaXMsIEkg
Z3Vlc3MgdGhhdCBzb21lIG9mIGZiZGV2J3MgbWVtb3J5IGFsbG9jYXRpb24gbmVlZHMgDQo+IHRv
IGJlIGNoYW5nZWQuIFRoZSBjaGVja192YXIgYW5kIHNldF9wYXIgY29kZSBuZWVkcyBhbiB1cGRh
dGUgdG8gaGFuZGxlIA0KPiB0aGUgbW9kZXNldC4gQW5kIEkgc3VzcGVjdCB0aGF0IHRoZXJlIGFy
ZSBvdGhlciBkYXJrIGNvcm5lcnMgdGhhdCBuZWVkIA0KPiB0byBiZSByZXdvcmtlZCBhcyB3ZWxs
Lg0KDQpUaGF0IHNvdW5kcyBnb29kLiBJbiBhIHNpbWlsYXIgZmFzaGlvbiB0byBkcm1fZmJkZXZf
b3ZlcmFsbG9jIGFub3RoZXIsIHJhdGhlciBoYWNreQ0KYnV0IHZhc3RseSBzaW1wbGVyIGFwcHJv
YWNoLCB3b3VsZCBiZSB0byBiYXNpY2FsbHkgYWxsb3cgdGhlIGRyaXZlcnMgdG8gc3BlY2lmeSB0
aGUNCm1heGltdW0gc2l6ZSBvZiBmYiB0byBzdXBwb3J0IGluIGRybV9mYmRldl9nZW5lcmljX3Nl
dHVwLiBUaGlzIHdvdWxkIGp1c3QgZGlyZWN0bHkNCnNldCB0aGUgZHJtX2ZiX2hlbHBlcl9zdXJm
YWNlX3NpemU6OnN1cmZhY2Vfd2lkdGggYW5kIHN1cmZhY2VfaGVpZ2h0IHdpdGggdGhlIGVuZA0K
cmVzdWx0IGJlaW5nIHRoYXQgZHJtX2NsaWVudF9mcmFtZWJ1ZmZlcl9jcmVhdGUgd291bGQgYmUg
Y2FsbGVkIHdpdGggdGhvc2UgdmFsdWVzDQphbmQgeHJlc192aXJ0dWFsL3lyZXNfdmlydHVhbCB3
b3VsZCBiZSBzZXQgdG8gdGhlbS4gUmVzaXppbmcgd291bGQgYmFzaWNhbGx5IGp1c3QNCndvcmsg
dGhlbiwgcmlnaHQ/IE9mIGNvdXJzZSBhdCB0aGUgY29zdCBvZiBwb3NzaWJseSBsYXJnZSBhbGxv
Y2F0aW9uLCBlLmcuIDRrIGZiDQpldmVuIHdoZW4gb25seSA4MDB4NjAwIGlzIGFjdHVhbGx5IHVz
ZWQuDQoNCkVpdGhlciB3YXkgSSdsbCBzZW5kIG91dCB0aGUgcGF0Y2ggdGhhdCBwb3J0cyB2bXdn
ZnggdG8gZHJtX2ZiX2hlbHBlcnMgYmVjYXVzZSBldmVuDQp3aXRob3V0IHJlc2l6aW5nIHN1cHBv
cnQsIGl0IHJlbW92ZXMgfjEwMDBsb2MgZnJvbSB2bXdnZnggYW5kIEkgdGhpbmsgaXMgd2VsbCB3
b3J0aA0KaXQgYW5kIHdlIGNhbiBmaWd1cmUgb3V0IGhvdyB0byBoYW5kbGUgZHJtX2ZiX2hlbHBl
cnMgbGF0ZXIuDQoNCnoNCg==
