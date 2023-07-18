Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC9A757ADA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 13:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CCA410E318;
	Tue, 18 Jul 2023 11:48:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB1A10E318
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 11:48:06 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36IAxwgW026888; Tue, 18 Jul 2023 12:47:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=jr2ZbvEKV0NdvkXZQroO5jJXGVinaGUsJ8uNjE9BVg0=; b=
 ht2P7KRa5E8vCnBXolz7ZB9yMSdHIs53a6p8XKu3pEixGG/aWuYbKIoSvzA+NJh0
 sUhUsDPPm+1vjBEdlwD/zpa2Be7/FgPLd6o/JNuOBQoZ2ntYF1WqMVRYT5DI96cA
 /5H+iIadhkJ5IHomK/brgwkhFZ0obueRcOI4lzX+4mPXSKbsl57lgN1Y1fZDKd1z
 i8y0z/o3mHNOgIlyrZr8+wyyzdjwfTbznXfgwBBQAsbycnc3KB+xMMG1ND8ptAfE
 u413pGEP2/JZ5WtGSHdabEZqM8xgI31VmGXKjj8vaOxy6A7Ps6mMYizFxOdHzXum
 24oHiC+sE2HrLYyLgzBRzQ==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3rutdrt25k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 18 Jul 2023 12:47:48 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 12:47:47 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.59) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Tue, 18 Jul 2023 12:47:47 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cm0CPUU6+ix1S7UNcJyFd3jFW+E++tL7g0FwBQNIU4ffOai99OYO40pp4Z8Wht0kvUxxTTBQieFLY0ukq2aiSl/bBhp8QiR21+tYC2RWsYNCmX36i6w/3fnuEhoWt7+DlxUPTihKuUtQVN1FyC3U25SqKoczYFUpH0WciBn0Ia9o2VUIqt0gT5QWb2innNVRZ1r4+Hb7UG9SGVcMWmAeUrgQ8d4DLG30jURIjX6XsG3tCrvPRNYt9QpC2gccXWLu6/YUbYi6l22E7Tr3ck5pOgp4BEbsBongtyjDUg/forM/kd+qDF6x/JVPFznhXg+dO6xjO8oIj/pi4mOVOthFww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jr2ZbvEKV0NdvkXZQroO5jJXGVinaGUsJ8uNjE9BVg0=;
 b=SZYWbsAcN/l5NofPI6lcDnAJDZKmJMCQ3nIvdnbQ5Y70uV22yiJs389v/nER4011uj7evD9BFEOmfHy6opW+jUiWwHc3oQabtV1tbNJF7bTB2jj9JWxuKagx+q8sTmoydp/a0+o6EkVV0hlq4crsSL8vJVR0DCceseRoYNA6SrQiEDsMIQRCslKf28nwEtVK9NZs/Wl54V5yB95eOWu8h0HcKki7PN344JgYuMS2uv0oKx2UB8Po0AxmMf42N9jixNNeC8LypeoA/QHH05HGh4Wdx9WQ5CFDnOkrxxpm5KQ2rvDaMXIM8voGhDmTIzN6yS1IbGTcXeYuW8GYsC0Etw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jr2ZbvEKV0NdvkXZQroO5jJXGVinaGUsJ8uNjE9BVg0=;
 b=dA/rrCQjBLv5A4WABKduFFyEi5Lsp5rrPPMuZvOCBOtRUbiTVP2md4Zot0wRjkTI0Y7b+uDmp7vezpSYq4HMRlqE9IygKAsV23ij5NZysE8GTCNKL/FYz9k9WCMp/QZi6tVRQl6Pb+8+xGYr0sKDeAALoqQA7y8+h92pEmf2z4Y=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by LO0P265MB6242.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:249::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Tue, 18 Jul
 2023 11:47:45 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1871:e3c9:b5a7:a740]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1871:e3c9:b5a7:a740%3]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 11:47:43 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>, "Sarah
 Walker" <Sarah.Walker@imgtec.com>
Subject: Re: [PATCH v4 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Thread-Topic: [PATCH v4 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Thread-Index: AQHZtl8P3D36r4o1qUe5ZVQPQ0pfk6+/EyCAgABbdIA=
Date: Tue, 18 Jul 2023 11:47:43 +0000
Message-ID: <b6a83ff4ba6ac92af2ab573e200cbf0b5b2847f9.camel@imgtec.com>
References: <20230714142526.111569-1-sarah.walker@imgtec.com>
 <01f0cf88-4e85-0c92-9723-eb9198782d0d@linaro.org>
In-Reply-To: <01f0cf88-4e85-0c92-9723-eb9198782d0d@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|LO0P265MB6242:EE_
x-ms-office365-filtering-correlation-id: 45c6c19e-dffe-48bd-465c-08db8784cc76
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q+giAmGjyZOH1rEk51XdPWxJKk/Hm2fazMWmOQKgfjqwqNOuc30dccUeV1ZMhoaTb10i9+g2s277ZGd7VjrCW5q4IdJjiBr06Vkajkd9zllqowuTsOnkHlNgvR0eqhsNqoK+B7WKxrSxeTa+bGwdWAADIPFfZfC10XVaJClD+rxU9fhUAQSBxJmbjsTq6x4htbzrgjgcrQHc17XSZnHe4IVA7cH+cYBfiIS+L/yQMUhJWtUxuKoOTctolxqPhd7hV9SJaE7KrS/bp8euu+NkDHf2ZjgZ8CJC0pSNZh/5/2XAayVPs93qQv4xZ3run2LDRxIGllc1smbuxtpL1Rxq4IlpF/4Nnlkev8U7ckM42W06ZGbQvd+IL+aiMXoUvgGnIHVaBhGASm6RVETbR1YtFVxTaeoAuBV43T+1oceqPUp5m8F/ieB8bDvWk3SHJA14klynhw7BiKq+uNb07e/3QzxrFhWgZmCTvZrpOwWvH2suTdnEzfVq93hqeRjWZBtbGqBFl0+0bormD9iIlrBPD/6272a6jVkrINVV7k0BtHs105XrW9xxfOyuEc6BIgFDpPlw4tEHmpO8vuoNqEP1TygdHkCk8yCzlEeBjgzFIc4r5Kc8dmnhD7RISwDd8aHf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(366004)(136003)(39850400004)(376002)(451199021)(86362001)(4744005)(2906002)(36756003)(38070700005)(7416002)(6512007)(186003)(83380400001)(26005)(6506007)(53546011)(38100700002)(122000001)(6486002)(54906003)(110136005)(6636002)(66476007)(8936002)(66446008)(64756008)(66946007)(66556008)(316002)(2616005)(4326008)(478600001)(41300700001)(71200400001)(5660300002)(8676002)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUEwc1RSbGVzTjZNTnBYOTl4MXIrYnJkL0xsdkpjOVJiTGxWQmFxRUhDQWJN?=
 =?utf-8?B?a2lVVXBSeU5Fb0VLODhWNGgrOFVuZ2ZGekJFeVNRWWZUQXpYSEhISlJOTWdS?=
 =?utf-8?B?bzJZMDExZFFSOU9UQ2xiM1dmL1VwdjZNYTl6UmF2WGk4dUhFV1N3aERlWldS?=
 =?utf-8?B?Y2UzZFRIUGpEMDVXTm8rREdPSUdtT0djWFh4cEhlMVdrTlhqOTRlRnpadlBN?=
 =?utf-8?B?KzRETnRFY2RQUkFadmE1QXUwVVZ2b0J3M0dML3pDZDJRa0dkbVRKcVZmczN4?=
 =?utf-8?B?Ymp0dkVSaThVNGJaNzU2ODlCZ3dESG94NFZBRGw4UjhTeWo0d21PZlN5ck9U?=
 =?utf-8?B?QWszUFBTNDBDZEUvejc3bGxhS2lKR2VOQUhxZXY5SEtQbm9qQjdoYmlILzZw?=
 =?utf-8?B?d0JOWWFTTER3ZmNUSWhzS1ZYV2JKVHNOTGJva0ZDbWRXdVhZa3Q0RmtvTGR1?=
 =?utf-8?B?cnVBemFSelRFMzVSa2kzZ0pyK0I1YitwWW9xODI4bWU0NGczazU2WmIyWDls?=
 =?utf-8?B?RXA0MzBFcTZDMFIveExVeWR6VElSK1oxTzlXOS9sU24xSFZrNW5hZzRhdFEw?=
 =?utf-8?B?TlNMQzRXeUVoNmJQZVNJNkZxcVZWaFh5NjgzcnNVYVJnbWp1RnYrUDQrSnVT?=
 =?utf-8?B?M21KdGcrNGxOVXU3TmllMnA1dFNTTUxZeU52TXY0TVpiVjlSSWV3MWhsVld2?=
 =?utf-8?B?bEdGVFArenJaazZNTHVxb1N0emR1cEV1ZnJQbkNPaCt6bExMK2JxcXdGbC92?=
 =?utf-8?B?Y3U2U2lMdEQxMy9oa2FOWmNaR2g1cUc1eHVrTk0wQldZZjlwM2lncWxod3RY?=
 =?utf-8?B?aG1qV0I5a0NVbmdkSWxpUTliTTlQVDVBblhnSGFsYUJRNkRqayt6Z1doWmpm?=
 =?utf-8?B?ckxLWStGbkgwYkVlNEVvdXlQT3hZRlF2U0VBR1piSEpEcFEwS1dtb2V5VWs2?=
 =?utf-8?B?OWozREJka3JwbG1pcEdaMWlxMXlvbWZDNnBFaEY5MHNXR1I4WDFMZnN4Z3hO?=
 =?utf-8?B?MXltNTRxcStBd0U1S3o2M3NsdUQxNEJJM3VKNGFJaWloeFF0c0pEWGJGQVNU?=
 =?utf-8?B?dmFKTFJ0bmxUYVRzTXg4bTJKMnlJa29oZkVSbnY3bzh0TUF6aXNLRERYa2Zn?=
 =?utf-8?B?YWxuajhwRWZkOXZSem81Q0t3SjFJcytWNUFjS2lkbjVHc2lvbzJDNWVvRnlU?=
 =?utf-8?B?RmtVNkh2anRQWjJOWTduRVgwOTdxcEJzZHFuOVBIdU1xS2VudlZodlV2aFZ5?=
 =?utf-8?B?VHgrNmFxdzNRTUY0c2c4MVN2ZVpsN2xMZXk2LzljN1d5WE93OWNvZ3dES0Jx?=
 =?utf-8?B?SktvVlhyWHluN3FwbnF5VUtyRXNjSUZYWGJuczRMYzJWZ3k4Q1ZCemVqR3hD?=
 =?utf-8?B?bWd3Vnd5ZVhxdlZ5bVkxbEI3dHUzTmVSR09Uc2YrUnpWU0pseUsxZTAvaTFq?=
 =?utf-8?B?UlhGNFI4SDlGRlJGenBxOHpxY2w0Um5paFZSSkNQbU5xK25hOWcvVEQ4ejM5?=
 =?utf-8?B?UEl6dTlYWnJScFBsWU14d3FZNVBGazVzMHZpcnMxSWQ1S25LZkJiYUdzWlc2?=
 =?utf-8?B?a3JvMWVWbjIwT3hraUJ3VDlla2JzS05LdFo0UzBxM1F1eGZMK2ZveXJzcWtQ?=
 =?utf-8?B?VDVEQ1dxVEhycDQvZXRIL2FHdkoyZHJXK0wyZzZlYTNqTlRMbmdDa1lweHJT?=
 =?utf-8?B?WlZ4eFFRaUtjSlQvNVpuQU84aXI4VFhBeEFLamtGcENmYll5ZXIwMzBPcDhR?=
 =?utf-8?B?b0s1TzVTUjZNU1N4TGZ3MmdKLzUyS0hLVktHdnlIMVZOZ25mS0dUTXpDNkFz?=
 =?utf-8?B?b0pDTXdqdkFQUENOejRtL0dVV3J0dGNWWGlhOWpqQTFhWTJRM2swcFJoVEhp?=
 =?utf-8?B?Mzk4R3l3ZmExdExobU9jRWtrWHVoSk0vd0ZJeWpSUGF6WFU2ZEpSa1NocVcx?=
 =?utf-8?B?bFJOS2huY0I2K3lsRjUzem9NZjVMYnJ6VittSmpUOWdXZnE4Wi9wN01MMXdv?=
 =?utf-8?B?ZnhCcy9oY3M5bGlUclhOSU5kbTltTDUwUnZCb1lEWVB0S3dwTlVqRjRRRGZV?=
 =?utf-8?B?UXQxM0Y3THhmYnhVUlhQNm5XOWZvaVlFVE1lb1c0UWZsc2lMS1AwOEgxVDFk?=
 =?utf-8?B?VVROR3lzTnRrNXJlZG1SZi9DK2VBT0NCWGxZdm84NHNlenhUTVNvTnd5TTVh?=
 =?utf-8?B?NlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7DE9DF12289C544EB27767EB440D44E8@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c6c19e-dffe-48bd-465c-08db8784cc76
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2023 11:47:43.8615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QSNvbGeQ6bHy0vXPI8vCWVvbBs64nHYBHIP0xftGbBa5qjd7DjObUKHglYPnXs/FuQQC0nr8nCw0HeFx7B6DVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6242
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: H8vt7Z3F-P-tSPp90wmze4gfJp8wL1cW
X-Proofpoint-ORIG-GUID: H8vt7Z3F-P-tSPp90wmze4gfJp8wL1cW
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "hns@goldelico.com" <hns@goldelico.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>, "afd@ti.com" <afd@ti.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>, Donald Robson <Donald.Robson@imgtec.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS3J6eXN6dG9mLA0KDQpPbiBUdWUsIDIwMjMtMDctMTggYXQgMDg6MjAgKzAyMDAsIEtyenlz
enRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9uIDE0LzA3LzIwMjMgMTY6MjUsIFNhcmFoIFdhbGtl
ciB3cm90ZToNCj4gPiBBZGQgdGhlIGRldmljZSB0cmVlIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBm
b3IgdGhlIFNlcmllcyBBWEUgR1BVIHVzZWQgaW4NCj4gPiBUSSBBTTYyIFNvQ3MuDQo+ID4gDQo+
IA0KPiAuLi4NCj4gDQo+ID4gKw0KPiA+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4g
PiArDQo+ID4gK2V4YW1wbGVzOg0KPiA+ICsgIC0gfA0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJp
bmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPg0KPiA+ICsgICAgI2luY2x1ZGUgPGR0
LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4NCj4gPiArDQo+ID4gKyAg
ICBncHU6IGdwdUBmZDAwMDAwIHsNCj4gPiArICAgICAgICBjb21wYXRpYmxlID0gInRpLGFtNjIt
Z3B1IiwgImltZyxwb3dlcnZyLXNlcmllc2F4ZSI7DQo+ID4gKyAgICAgICAgcmVnID0gPDB4MGZk
MDAwMDAgMHgyMDAwMD47DQo+ID4gKyAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmc29tZV9wZHMg
MTg3PjsNCj4gPiArICAgICAgICBjbG9ja3MgPSA8JmszX2Nsa3MgMTg3IDA+Ow0KPiA+ICsgICAg
ICAgIGNsb2NrLW5hbWVzID0gImNvcmUiOw0KPiA+ICsgICAgICAgIGludGVycnVwdHMgPSA8R0lD
X1NQSSA4NiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gPiArICAgICAgICBpbnRlcnJ1cHQtbmFt
ZXMgPSAiZ3B1IjsNCj4gDQo+IFdoeSBkb2VzIGl0IGRpZmZlciBmcm9tIHlvdXIgRFRTPw0KDQpU
aGlzIGlzIGp1c3QgYW4gb3ZlcnNpZ2h0IG9uIG91ciBwYXJ0LiBXZSdsbCBtYWtlIHN1cmUgdGhl
eSBib3RoIG1hdGNoIGluIHRoZQ0KbmV4dCB2ZXJzaW9uLg0KDQpUaGFua3MNCkZyYW5rDQoNCj4g
DQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+IA0K
