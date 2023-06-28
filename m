Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AC074191F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 21:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759E710E0DA;
	Wed, 28 Jun 2023 19:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11011008.outbound.protection.outlook.com [52.101.47.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8956710E0DA
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 19:54:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzmsYZqW1tCMxwKW9pl30FGzFWLg6AunjsumlwFlL/1knLogTC+9i85eEedR1D9P56fIfIzbM/LrxaHxIAW/NmY1mHmGOEtuFEUMzgGXLB1pCwv28Xt2lW4bjz/3dCw+3ntA7Enx/n+0NWR5wdlcN8ppsO1wwk19Zfjd1+Pc8XWxnv/+PODsNU4upC9/XOp/K7WgLa0iR/d0YGHDpwLePepIlwB9s2QbqVSAZbXjG25eXnW0pYYrOu8d52elqhjZr95ZzfZzBofRZFt6Jgn/oXAZoWmww4l21rxaqqsi1HzNUyzeZVKunG97DHLk3l8Md5l4X9MalVpo3AyUoqmPQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=py9+YB4z9Kd6lwDrmUIJy8Hry2bxvvgc1YpEBDJGT+c=;
 b=kk3ibXmqnqhHV+Hu3TJcswJXSoQ1sRq8OWjQQXMS5XCEB1dU6BmNDQrPl7vuv4PXzm/ScspRB3yiDjS1ZA9Mqp+rDyxlMJL8XccwHXMeRy/FcwAN9yc2hloFXG1xQZC1QqgEC/p9DD/txg321hsvuVtQ0cxIUi259IXDXPGX0NNSR4Z3R2qPzJf33O4rCfWPMrCu+ucnPU+PfQtpSt9iUseAglfwC4ttk2VfOE118WKypqjMDbBmiNge9XXAQAKdh0N+TAMr3O6/1W2s0G9kyVseZUwmTZBpVzLeRFw1hs+anjSWXAscPIdgehE7FKul7J3EXlBWYKlaPdfDGuaVEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=py9+YB4z9Kd6lwDrmUIJy8Hry2bxvvgc1YpEBDJGT+c=;
 b=E5G9hXeVFtmXQGhhKQddnRlNpRQRfwh6qBmcowFEgky+R8AKIOzImez2gV1ISLtO/OdojheIlWvgExVm78RksphdhR090cxMEZ6731MJflT8umg81mtwTZyhEeVzW2nBRjl4su2QVVs61kaTeCmIBT0j9DpXb6a+q0am0fBmV/c=
Received: from IA0PR05MB9832.namprd05.prod.outlook.com (2603:10b6:208:404::6)
 by CO1PR05MB7894.namprd05.prod.outlook.com (2603:10b6:303:fa::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 19:54:49 +0000
Received: from IA0PR05MB9832.namprd05.prod.outlook.com
 ([fe80::ae06:b40c:b514:83fa]) by IA0PR05MB9832.namprd05.prod.outlook.com
 ([fe80::ae06:b40c:b514:83fa%7]) with mapi id 15.20.6500.036; Wed, 28 Jun 2023
 19:54:49 +0000
From: Zack Rusin <zackr@vmware.com>
To: "ppaalanen@gmail.com" <ppaalanen@gmail.com>, "zack@kde.org" <zack@kde.org>
Subject: Re: [PATCH v4 2/8] drm/atomic: Add support for mouse hotspots
Thread-Topic: [PATCH v4 2/8] drm/atomic: Add support for mouse hotspots
Thread-Index: AQHZqYB0IAa7YmGt/0WC41DxXOpPjK+f1MoAgAADtwCAAMlHAA==
Date: Wed, 28 Jun 2023 19:54:49 +0000
Message-ID: <2fb2f3985df4d6710e5ad33f6e618a52004714df.camel@vmware.com>
References: <20230628052133.553154-1-zack@kde.org>
 <20230628052133.553154-3-zack@kde.org> <20230628104106.30360b55@eldfell>
 <20230628105424.11eb45ec@eldfell>
In-Reply-To: <20230628105424.11eb45ec@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR05MB9832:EE_|CO1PR05MB7894:EE_
x-ms-office365-filtering-correlation-id: b8fcc93d-f640-4604-3ce6-08db781187c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IAwAm2igpnvrRpUXa82rBPDPd084/O54tmJfSHWtOsTurWRpeoIrgfJ0TVkhURZK/9nVnKbV9VveNF3qxvXHcRYQ24nfs0amfh2J//lJ+2OPZXEMMc4tPQtb0dmmg2xe0DtNwcAk/zB/W8TMF4i8rJlZ7gfokFapkW1DX7Cnmuv55IK9qqDPppKnTY2UfQ69CSIydZ3qJlzhrzFHgPpNDT4+7BLIE1P6d/hWXdvKLcHV8l6iFnBncqNRw8Yfw5ucdBQVGsR8H6JajnXP+lohaa/d80UPQxEw/jmsST862yGMmhOdg/EGusttTEOPCA5N8Y4XLmFthFCUQ2IO0X8g+wt9dWPqBjUencE+v+z8d5Mqb+9PKGGFXliP7toozlJ1u41SltndyKvVX6CSsh8jRi5ZKhqvBoVRgw9E5aX30pu92vn/DV4dC0N57JI4LgrQruutbYx8/rMGUla6xLKbuMkHvOBcfABBrm6TtFJ4j9syiyNPX+SUqqiuYpDtIzR4lWl/nq0zioZ+zKP2XKY2aSFjLSRq6N7YkkR+7ZprSp9PQmvv9Lv1gZU8bBY4PKsYDycwCuPSnSMAL+xJVrcIjg4yuBZ4fPWK0AewafdDZJGcvvzj/MNRE0DvkPdy0WlRCICiMlt1lxS3Jw7lB93S8njpqfYVY9fSJaz5Z5nvfws=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR05MB9832.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199021)(66446008)(54906003)(6486002)(110136005)(71200400001)(83380400001)(26005)(2906002)(6512007)(2616005)(478600001)(6506007)(186003)(5660300002)(64756008)(36756003)(7416002)(38070700005)(4326008)(316002)(76116006)(66946007)(38100700002)(8936002)(66556008)(8676002)(86362001)(66476007)(122000001)(41300700001)(66899021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUdZZ2ZrV3E4YjNtVHhEWmY0K0lsYkg3WExKL015ekIwVUpKN3RHbXR6bEFt?=
 =?utf-8?B?ZXhiNStZV0o2TXBXVXpjUnFDWDV1a2FHaDYvVUhhbGp5Zm9RbDdFSFVKcVIv?=
 =?utf-8?B?Tzh3RWFLbEdRbjBHU2xmbk5CL1F2Z3Rzc0t6MEJWbW8wRG9UMERzRmMwckgy?=
 =?utf-8?B?eWwxUUpGbDFaSzhSR2RWT3pZaG9lRnloOVdDSUpyTWd0WEpsTS91NmlnZU5N?=
 =?utf-8?B?MHR6STNDaHhuOXgvU2pIVHFmTWdEb2hmbVhPYThUQkFFRHJEdkZFMnp0bVNz?=
 =?utf-8?B?K3JnMXIxY1VBTkxFZkw0dE1SaDN6RG1YTTVqRGFPZXdQdmRuQVNtMktCQ2lB?=
 =?utf-8?B?WHlCLzV0KzB0eXdrVENqcWlUblZER2pWUnBLb3hMYnR6b2ZzTFNiNGNvSUVR?=
 =?utf-8?B?RUNsQldrLzJhY0lmaDhEUTBlcC9NclJ0QnVPbVdmLzRtUzZ5WW5ZaUFGendv?=
 =?utf-8?B?TkNybTdYbWZ2eWdSMkZEMWtPL3FzUHVUMXQ1dWFHRTk0NUp4RFdiclJsaHNj?=
 =?utf-8?B?aW9yTUJpRUQwVWZabmdqZlVHK0k4b1JHdWpFMjlZU0c2dE9hL3JkQjNZODFM?=
 =?utf-8?B?Q1d0Z3F0UHpCT1laVmJrQVlRcm1OcGJUajdYaDVCbFF6VXh3T2Z1WG5HcEZQ?=
 =?utf-8?B?dGloVWNiZS9KbnlJMG5FZ0RmWGlTbXh6c1llMEMvZFNoUDJTTHlTZExTdTJI?=
 =?utf-8?B?U0g1bXdFSUdRd2Z4cjVDR2FxcWxlSkRvVHkxS2hGWGNWcWc2ZzlHQnhudmtR?=
 =?utf-8?B?ZThtVmZmSU0ydjE5L3U2bWM5WUdOZ0JWMHh2eWFxd3VPOFN6VDFFNDdaUEVC?=
 =?utf-8?B?T3VwNXBFaytlaXRTaEpZbWZHb000d3gwM3Z3b1lsTHVWMVB2a1RkSlcraWZB?=
 =?utf-8?B?djcyenh0VFArYldvQlBkSUUvZ2tZbWRnUzViamI1QzFjdGFidWZrYWtSNTFS?=
 =?utf-8?B?S0RiQVN6L3NjYWxXS0NzVkU2bVJBK3Q2S0U0OFVEQjUyNjY4VnpxVm9DdmdM?=
 =?utf-8?B?OVAzalB1UUt1SExTZ2FzdXRLSm16WDMzRHdFS3JxNWZkUEkrdFBhVE9makJi?=
 =?utf-8?B?ZVI4bCtmVHc2NEp5YW9UUzJ6R1lTQUpZcFB0anlWZjF3amlxem9HQmd2R3d1?=
 =?utf-8?B?S0J3ckpGbWtVTTNlSTVmNFpESEdydXM2dDcwd2Q4Zlc3MFl5TWVJTk1LMWZT?=
 =?utf-8?B?NDZSTXNDNW9xdTJJYkxqbVlNaGFwbklOMjNaOExod2hMOUdVVDA1TzRkc3FX?=
 =?utf-8?B?SkNvcGJKeGU0NXhVaVFIWkxaeFBYd3AyVFNsRTVDNUtVYlVxN2E0RlFWY2h5?=
 =?utf-8?B?NDlOTnNrQ0p5U3crYmw1eEJ2MXBISExWWlY4WXBieEZtc2o3UDhRbyszbGZ0?=
 =?utf-8?B?RlUzc1RWVXZvYlZ1dW9PZ0FiRXhXaEFiaDZlclpMckNLVUpoMWtaTm5GT05I?=
 =?utf-8?B?YXc0SlpQNzNoczEwNjZaWm5BYWtWT09OSkhLdzhlRjNiOHFFNWI2TGhCcEp5?=
 =?utf-8?B?V1VXMWUrbDg1TGVLMFJwZkFRRStsWFh1Sll6Mzc1WHRBdXdYRVBGTGRyYzJq?=
 =?utf-8?B?cmxVQmRqdVg5bmlQNXJLc0hjRi9lSE9DRnFTM2NCZC9HS3JmRjhvanFtOFpE?=
 =?utf-8?B?bjkxV3lwMldmQUJVRXEzK2lyRm5QbEpRTU5KdEpJOW41b1VRcmd2RWlYNkE3?=
 =?utf-8?B?Q2l0ZFcydGN1eDB2bmxScXRHRU5UVVhSWEdxSlpHbTNXUHM4Vy9hODlsbDV4?=
 =?utf-8?B?ZWpiZHJORkNrVlZZeGdlY0pFQzhWMkk4Mk9vQ2RCU1dNdi9IdmtKVXVUb0JD?=
 =?utf-8?B?Ri80VXlQeGNacXNzbTZMTC9US3lQeTlTZWp5KzNVYU5rRVMza0FjcThNZnJD?=
 =?utf-8?B?aGVaMFZrQmtjT0pQVEpPWVQ5SFZGTk1lYTJxbVNrSTRuaU02d3JiYU81S01n?=
 =?utf-8?B?VFB4VUluZWFlRWIrOEIyL0hONUp2cHVQOEIvN2pUTENFc2ZxOGNvRFgxU3JT?=
 =?utf-8?B?MHBlUVo5VUJlYjJIMkx1YlFUb3IvU25yRTlEaWRicE5JZzd3Qk5nQVRJM2E3?=
 =?utf-8?B?Q253VG5Qc000WExzcTJNcG5ZMlQvdTltUnU4ZC9kWHd4VGIzQitreDA4ZHFl?=
 =?utf-8?Q?e6u3Uu4SFttjst7146QfRI3s3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B0B551A71F26F499633ADFF2DC51910@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR05MB9832.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8fcc93d-f640-4604-3ce6-08db781187c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2023 19:54:49.0231 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QLbmdFX35Iou81E/3um5igOvgweIq3gjqL6sjiBQGMcSZ3JsDrsm4gnFnqhLxt13X4KY+EB1LN1P4nK6D98K0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR05MB7894
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
Cc: "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Martin Krastev <krastevm@vmware.com>, Michael Banack <banackm@vmware.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, Ian Forbes <iforbes@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTA2LTI4IGF0IDEwOjU0ICswMzAwLCBQZWtrYSBQYWFsYW5lbiB3cm90ZToN
Cj4gT24gV2VkLCAyOCBKdW4gMjAyMyAxMDo0MTowNiArMDMwMA0KPiBQZWtrYSBQYWFsYW5lbiA8
cHBhYWxhbmVuQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiA+IE9uIFdlZCwgMjggSnVuIDIwMjMg
MDE6MjE6MjcgLTA0MDANCj4gPiBaYWNrIFJ1c2luIDx6YWNrQGtkZS5vcmc+IHdyb3RlOg0KPiA+
IA0KPiA+ID4gRnJvbTogWmFjayBSdXNpbiA8emFja3JAdm13YXJlLmNvbT4NCj4gPiA+IA0KPiA+
ID4gQXRvbWljIG1vZGVzZXR0aW5nIGNvZGUgbGFja2VkIHN1cHBvcnQgZm9yIHNwZWNpZnlpbmcg
bW91c2UgY3Vyc29yDQo+ID4gPiBob3RzcG90cy4gVGhlIGxlZ2FjeSBrbXMgRFJNX0lPQ1RMX01P
REVfQ1VSU09SMiBoYWQgc3VwcG9ydCBmb3Igc2V0dGluZw0KPiA+ID4gdGhlIGhvdHNwb3QgYnV0
IHRoZSBmdW5jdGlvbmFsaXR5IHdhcyBub3QgaW1wbGVtZW50ZWQgaW4gdGhlIG5ldyBhdG9taWMN
Cj4gPiA+IHBhdGhzLg0KPiA+ID4gDQo+ID4gPiBEdWUgdG8gdGhlIGxhY2sgb2YgaG90c3BvdHMg
aW4gdGhlIGF0b21pYyBwYXRocyB1c2Vyc3BhY2UgY29tcG9zaXRvcnMNCj4gPiA+IGNvbXBsZXRl
bHkgZGlzYWJsZSBhdG9taWMgbW9kZXNldHRpbmcgZm9yIGRyaXZlcnMgdGhhdCByZXF1aXJlIGl0
IChpLmUuDQo+ID4gPiBhbGwgcGFyYXZpcnR1YWxpemVkIGRyaXZlcnMpLg0KPiA+ID4gDQo+ID4g
PiBUaGlzIGNoYW5nZSBhZGRzIGhvdHNwb3QgcHJvcGVydGllcyB0byB0aGUgYXRvbWljIGNvZGVw
YXRocyB0aHJvdWdodG91dA0KPiA+ID4gdGhlIERSTSBjb3JlIGFuZCB3aWxsIGFsbG93IGVuYWJs
aW5nIGF0b21pYyBtb2Rlc2V0dGluZyBmb3IgdmlydHVhbGl6ZWQNCj4gPiA+IGRyaXZlcnMgaW4g
dGhlIHVzZXJzcGFjZS4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogWmFjayBSdXNpbiA8
emFja3JAdm13YXJlLmNvbT4NCj4gPiA+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5s
YW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiA+ID4gQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBh
cmRAa2VybmVsLm9yZz4NCj4gPiA+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4NCj4gPiA+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+DQo+ID4g
PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPg0KPiA+ID4gUmV2aWV3ZWQtYnk6
IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPsKgIA0KPiA+IA0K
PiA+IEhpIFphY2ssDQo+ID4gDQo+ID4gSSBzdGlsbCBkbyBub3Qgc2VlIGFueSBVQVBJIGRvY3Mg
Zm9yIHRoZSBuZXcgcHJvcGVydGllcyBpbiB0aGlzIHBhdGNoPw0KPiANCj4gSWYgeW91IGFyZSB3
b25kZXJpbmcgd2hhdCB0aGVyZSBjb3VsZCBiZSB0byB3cml0ZSBhYm91dCwgbWF5YmUgdGhpcyBj
YW4NCj4gZ2l2ZSBhIGdvb2QgbWluZHNldDoNCj4gDQo+IExldCdzIGFzc3VtZSB0aGF0IEkgYW0g
YSBXYXlsYW5kIGNvbXBvc2l0b3IgZGV2ZWxvcGVyIHdobyBoYXMgbmV2ZXIgdXNlZA0KPiAiaG90
c3BvdHMiIHdpdGggS01TIFVBUEkgYmVmb3JlLiBBcyBJIGhhdmUgbmV2ZXIgdGVzdGVkIGFueXRo
aW5nIGluIGENCj4gVk0sIEkgaGF2ZSBubyBpZGVhIHdoeSB0aGUga2VybmVsIHdvdWxkIGV2ZXIg
d2FudCB0byBrbm93IGFib3V0IGN1cnNvcg0KPiBob3RzcG90cy4gRGlzcGxheSBoYXJkd2FyZSBu
ZXZlciBkb2VzIGFueXRoaW5nIHdpdGggdGhhdCwgaXQganVzdCBwdXRzDQo+IHRoZSBjdXJzb3Ig
cGxhbmUgd2hlcmUgSSB0ZWxsIGl0IHRvIGFuZCBjb21wb3NlcyBhIHNpbmdsZSBpbWFnZSB0byBi
ZQ0KPiBzZW50IHRvIHRoZSBzaW5rLiBUaGUgdmlydHVhbCBkcml2ZXIgVktNUyBkb2VzIHRoZSBz
YW1lLiBUbyBtZSwgYQ0KPiBjdXJzb3IgcGxhbmUgaXMganVzdCBhbm90aGVyIHVuaXZlcnNhbCBw
bGFuZSB0aGF0IG1heSBoYXZlIHdlaXJkDQo+IHN0YWNraW5nIG9yZGVyLCBwaXhlbCBmb3JtYXQs
IGFuZCBzaXplIGxpbWl0YXRpb25zLg0KPiANCj4gSWRlYWxseSB0aGUgZG9jIGZvciBIT1RTUE9U
X1ggYW5kIEhPVFNQT1RfWSBkb2N1bWVudHMgbm90IG9ubHkgdGhlaXINCj4gcG9zc2libGUgZXhp
c3RlbmNlIGFuZCBhbGxvd2VkL2V4cGVjdGVkIHZhbHVlcywgYnV0IGFsc28gdGhlIHJlYXNvbnMN
Cj4gdG8gaGF2ZSB0aGVtIGFuZCB3aGF0IHRoZXkgYXJlIHVzZWQgZm9yLCBhbmQgdGhhdCBpZiB0
aGUgcHJvcGVydGllcw0KPiBhcmUgZXhwb3NlZCB0aGV5IGFyZSBtYW5kYXRvcnkgdG8gcHJvZ3Jh
bSBpbiBvcmRlciB0byB1c2UgdGhlIHBsYW5lLg0KDQpJbnN0ZWFkIG9mIHJlc2VuZGluZyB0aGUg
ZW50aXJlIHNlcmllcyBtYXliZSBJIGNhbiBkcmFmdCBhIHBvc3NpYmxlIGRvYyBiZWxvdyBhbmQN
CnNlZSBpZiB3ZSBsaWtlIGl0IChvbmNlIHdlJ3JlIG9rIHdpdGggSSdsbCBzZW5kIG91dCB2NSB3
aGljaCBob3BlZnVsbHkgd2lsbCBiZQ0KZ29vZCkuIEhvdyBhYm91dDoNCg0KLyoqDQogKiBAaG90
c3BvdF94X3Byb3BlcnR5OiBwcm9wZXJ0eSB0byBzZXQgbW91c2UgaG90c3BvdCB4IG9mZnNldC4N
CiAqDQogKiBIb3RzcG90IGlzIHRoZSBwb2ludCB3aXRoaW4gdGhlIGN1cnNvciBpbWFnZSB0aGF0
J3MgYWN0aXZhdGluZw0KICogdGhlIGNsaWNrIGUuZy4gaW1hZ2luZSBhbiBhcnJvdyBjdXJzb3Ig
cG9pbnRpbmcgdG8gYm90dG9tIHJpZ2h0IC0NCiAqIHRoZSBvcmlnaW4gY29vcmRpbmF0ZSBmb3Ig
dGhhdCBpbWFnZSB3b3VsZCBiZSB0b3AgbGVmdA0KICogYnV0IHRoZSBwb2ludCB3aGljaCB3b3Vs
ZCBiZSBwcm9wYWdhdGluZyB0aGUgY2xpY2sgd291bGQgYmUNCiAqIHRoZSBib3R0b20gcmlnaHQg
Y3Vyc29yIHBvc2l0aW9uIChjcnRjX3gsIGNydGNfeSkgKyBob3RzcG90DQogKiBjb29yZGluYXRl
cyB3aGljaCBmb3IgYm90dG9tIHJpZ2h0IGZhY2luZyBhcnJvdyB3b3VsZCBwcm9iYWJseQ0KICog
YmUgKGN1cnNvcl93aWR0aCwgY3Vyc29yX2hlaWdodCkuDQogKg0KICogVGhpcyBpbmZvcm1hdGlv
biBpcyBvbmx5IHJlbGV2YW50IGZvciBkcml2ZXJzIHdvcmtpbmcgb24gdG9wDQogKiBvZiBwYXJh
LXZpcnR1YWxpemVkIGhhcmR3YXJlLiBUaGUgcmVhc29uIGZvciB0aGF0IGlzIHRoYXQNCiAqIHRo
ZSBob3RzcG90IGlzIGZhaXJseSBlbmNhcHN1bGF0ZWQgaW4gdGhlIHN5c3RlbSBidXQgaW1hZ2lu
ZSBoYXZpbmcNCiAqIG11bHRpcGxlIHdpbmRvd3Mgd2l0aCB2aXJ0dWFsIG1hY2hpbmVzIHJ1bm5p
bmcgb24gc2VydmVycw0KICogYWNyb3NzIHRoZSBnbG9iZSwgYXMgeW91IG1vdmUgdGhlIG1vdXNl
IGFjcm9zcyB0aGUgc2NyZWVuDQogKiBhbmQgdGhlIGN1cnNvciBtb3ZlcyBvdmVyIHRob3NlIG11
bHRpcGxlIHdpbmRvd3MgeW91IHdvdWxkbid0DQogKiB3YW50IHRvIGJlIHNlbmRpbmcgdGhvc2Ug
bW91c2UgZXZlbnRzIHRvIHRob3NlIG1hY2hpbmVzLCBzbyB2aXJ0dWFsDQogKiBtYWNoaW5lIG1v
bml0b3JzIGltcGxlbWVudCBhbiBvcHRpbWl6YXRpb24gd2hlcmUgdW5sZXNzIHRoZSBtb3VzZQ0K
ICogaXMgbG9ja2VkIHRvIHRoZSBWTSB3aW5kb3cgKGUuZy4gdmlhIGEgY2xpY2spIGluc3RlYWQg
b2YgcHJvcGFnYXRpbmcNCiAqIHRob3NlIG1vdXNlIGV2ZW50cyB0byB0aG9zZSBWTSdzIHRoZXkg
Y2hhbmdlIHRoZSBpbWFnZSBvZiB0aGUgbmF0aXZlDQogKiBjdXJzb3IgdG8gd2hhdCdzIGluc2lk
ZSB0aGUgbW91c2UgY3Vyc29yIHBsYW5lIGFuZCBkbyBub3QgaW50ZXJhY3QNCiAqIHdpdGggdGhl
IFZNIHdpbmRvdyB1bnRpbCBtb3VzZSBpcyBjbGlja2VkIGluIGl0Lg0KICoNCiAqIEluIG9yZGVy
IGZvciB0aGF0IGNsaWNrIHRvIGNvcnJlY3RseSBhbmQgc2VhbWxlc3NseSBwcm9wYWdhdGUNCiAq
IGJldHdlZW4gdGhlIG5hdGl2ZSBhbmQgdmlydHVhbCBtYWNoaW5lLCBub3Qgb25seSB0aGUgY3Vy
c29yIGltYWdlDQogKiBidXQgYWxzbyB0aGUgaG90c3BvdCBpbmZvcm1hdGlvbiBoYXMgdG8gbWF0
Y2ggYmV0d2VlbiB0aGVtLg0KICoNCiAqIE1ha2Ugc3VyZSB0byBzZXQgdGhpcyBwcm9wZXJ0eSBv
biB0aGUgY3Vyc29yIHBsYW5lIGlmIHlvdSdkIGxpa2UNCiAqIHlvdXIgYXBwbGljYXRpb24gdG8g
YmVoYXZlIGNvcnJlY3RseSB3aGVuIHJ1bm5pbmcgb24NCiAqIHBhcmEtdmlydHVhbGl6ZWQgZHJp
dmVycyAocXhsLCB2Ym94LCB2aXJ0aW8gb3Igdm13Z2Z4KS4NCiAqIC8NCg0Keg0K
