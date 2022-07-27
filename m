Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D214D58358B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 01:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190B1C81B9;
	Wed, 27 Jul 2022 23:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4BDC8135;
 Wed, 27 Jul 2022 23:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658963784; x=1690499784;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=geR9yoyLEQEMssrkTR8I2EwyLq8TMeN3J90RI86Z8kU=;
 b=PobROA3Y5p5iNalCePPY9OR5n+ll3ooNG0gF8NGubOynCbSH59oApwmT
 oDfT/QF+nsvNvhPjgjINg04xPIaxf0t4l8mYHIPnlEQ+t9vI8IAN4s/B2
 A1X1XV+tkiQPrgpCoDne1mkQxpXk2tU2VOUhSrvDXVzAyhi9cBcn9iE0V
 fQ/8vo3l+ewY1vO0IwxxwMh5f1Cd/0oa+i+XG4W/LtWckHN5L7dPW3U4m
 6r/OD8afGU6aLXvSA1/HUyozCeZc4c1odQ26CjQuqOLZJ4N6g73+AZykR
 F8fkgl5d8W3ZDIQlxLmxJXzNo8rhgcWrHi8IiLdFjrDMtgwa64eYbDBqW g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="314153933"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="314153933"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 16:16:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="604324289"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga007.fm.intel.com with ESMTP; 27 Jul 2022 16:16:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 27 Jul 2022 16:16:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 27 Jul 2022 16:16:23 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 27 Jul 2022 16:16:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IEUx3YKRRcZe9TnHIuqpaWabMBjjGY3sXImEnEyO1xJGfp2tjqaAmhOe9IM30lRIncxzzJlzmBsfvuY+sbNufM6o1wcnJz5piCOAFGo8r7HPhU2kgXUKsOBueFVQCmf7g+wHk4l6aeEHGWbTigmIGDWWVC1sKmWTN9Ez7crlzbP09EtSU5qKBlThUpziGptX6izU+mioDUsCsPjjBBMfSB1ARVMQVoYPvI0fK8AhTJaMnqXD1zm0N0wUwavEKT0DAdqEX6lENQuK3RcNlDGzhXTs4BGiC7EDi5wCxfeFHtjwFeFvZ6Y584AYtgy/KcY7dO2EfMOUiY9NlBQjux0mEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geR9yoyLEQEMssrkTR8I2EwyLq8TMeN3J90RI86Z8kU=;
 b=U8IPyWg9/dGIpuaQFKC3iTIxixYcxs4xSun78OVc/rlnrG2mJXgOLItzo1iefmzqEbXu/5YY2iCX2b3GJE6ESWSSV4ypoV1fSt21VEyss/WHXmiIZKH0aijWh1SYzJ0byws1eb+Rk6l3pz86hzuxCUWs0v1cF2cBGynNYZ3sgCMznrsjSt6TbVaYO3DVP76NqdTIbCeO+bu2uejlCKuQal2AJz9ccO/FLSVa9QKzT5yvP5WtDrexdN5tcSokwEgsm8XXKcPnmCUq0b3B05ljv/+kwBMju2zHDHQQcqwhX+uWnSm2UueT0bPnGS2jfYbnU/0AYRydkmJDgRIiaR55JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6043.namprd11.prod.outlook.com (2603:10b6:8:62::8) by
 MN2PR11MB3840.namprd11.prod.outlook.com (2603:10b6:208:ea::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.18; Wed, 27 Jul 2022 23:16:16 +0000
Received: from DM4PR11MB6043.namprd11.prod.outlook.com
 ([fe80::e1ac:cd2d:342c:6b94]) by DM4PR11MB6043.namprd11.prod.outlook.com
 ([fe80::e1ac:cd2d:342c:6b94%9]) with mapi id 15.20.5458.019; Wed, 27 Jul 2022
 23:16:16 +0000
From: "C, Ramalingam" <ramalingam.c@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/ttm: don't leak the ccs state
Thread-Topic: [PATCH] drm/i915/ttm: don't leak the ccs state
Thread-Index: AQHYodgUglQlj/9diEST93L1xSKjoK2S2JdA
Date: Wed, 27 Jul 2022 23:16:16 +0000
Message-ID: <DM4PR11MB6043DA030C0AED1295B0E6F09D979@DM4PR11MB6043.namprd11.prod.outlook.com>
References: <20220727164346.282407-1-matthew.auld@intel.com>
In-Reply-To: <20220727164346.282407-1-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ddd13c68-eac1-4f8e-e144-08da70260167
x-ms-traffictypediagnostic: MN2PR11MB3840:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZR94pzzYhlDYB/hj3iiBBKOn2ECndPWpWvTkpJ/ZG/id3iyky2x0pruhxnyztGXf5IDz0UkLV8EdMTTv+6JgemMX4f+o82qhHFzs78+6aRdtMMeXkdtpkQitPtVXUlYPBBsxffsCh9ILuxP/1zUnJP5hrd1eqJOhRq3kw6pfabqkyMxHERRNBVixp365i68HwNlhnnikzkKQRWqKOE6pRHCosYJuytO997/h8xpqewqTcNt7st6r196HYqlsjb60zAv3gLgth53OXsGBNXK705bESVjXSwYxQOBLZHf7Rpo4l89IMuCDUojM3QG5JAVKph8r7RDlGqxmjXdg6YQYyN2nvmBlxz3ILUpljjNYh2x5KAlQ0iYxJNiGWb9Wky7nuCJGTmFgFRcmq6XHu2u/b+ZdGQP8v4fjS679X2L53kwE9chQiHG1832XUbKmM5wnh7EfEzw8syU6wbgF9+K71pRKeVG2dlv3mD7gO50mB3bbbq0L5Ep0spl+me3CCljwYYdhT/+qJkdpI2RrBg+IGeoQ7iyMwzM1kfz6HUFZvr5Wc8TADK8NHhEbwdsGC1a2+9LeS3DUuyaO03AA7thNLpFZ7cMJ8drt59/i64HRmWsutW6ri2U1rA6pL6Rh/xVhK1sBDAF9h0CG1cB2NbBund00VVRYAdB9dJ5D5m0xc5DyuJ7CuNobrD+T3CRJ4qH2YwV161a7pNqxiNpEgV4QLcNn1OtQP/T4jE0RRWBrzDgVqo+DWU5sHeFh5CzGt4+AeOjPadHLt3EwIdm7DFvRD81CZHBbCk4lSGJJTaVRo8vj0dJLPhHgDKUnsLHJC+eD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6043.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(39860400002)(396003)(376002)(346002)(82960400001)(38070700005)(83380400001)(9686003)(122000001)(66574015)(186003)(66556008)(8936002)(52536014)(8676002)(5660300002)(26005)(478600001)(2906002)(38100700002)(6506007)(71200400001)(7696005)(53546011)(54906003)(41300700001)(316002)(66446008)(64756008)(110136005)(76116006)(66476007)(86362001)(4326008)(66946007)(33656002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZE1PRnF3WG5qVGgzTDFUd2xNbUhoMGNVYVZnUlNRblp5ZndMMndBdW5wNHZK?=
 =?utf-8?B?Z1dIajBOVWU0eTZobzRhM0Q3SGt1ejZPK0xVZGVkZ3hQTzdpaVVuR3JacW1K?=
 =?utf-8?B?NzZxTEp5RWNTR1lBSU1landZTHRaNXB1Q3ZXOVFDb0hTZmFNbmQzMUMwN1pQ?=
 =?utf-8?B?NlFyWHBrQU5zOWVOUnhoNUh2YldCeG9tTWc3Q3p6Z0N5dG1NVjhuaVRGT2dR?=
 =?utf-8?B?REVwL3NVWDNNRTYwWVJyWnk0MXc4V1pTbFdzdEhGcEdndzlXaW12VnRNUmR0?=
 =?utf-8?B?aXJkaWdHL3RqWnlMYU1IckozV3h5b1lZMEROcDJGS1A4QmZTVkJyL0xXcFho?=
 =?utf-8?B?TTRjTUZHZmpUYXh3N0llYVFGV1pPZDZva3lWZGpBWW1yazcvNGJ1SUZiVzhS?=
 =?utf-8?B?VFk0aEJvZ3VDOFpPOWlXSmx3a0UwWHZ3ZWU2TmRiaXUvUElhSlFHM0FPc1Fu?=
 =?utf-8?B?ZmdEVWduTGpjN1hsUTU4c3Z4U3IxOXNITkdNenhBdFpQMXNIeWthNitYYW9H?=
 =?utf-8?B?UVpib3Vid2FtOEF4YWZKV2wwZ2J3R25qbzlsR3I4TFpEaTJBdXl5OEZDcUlE?=
 =?utf-8?B?VjY1Wjl6SytDbVRLVHpDaXlLdUg2UlJyelFvM0JzTHFDUUZYTFkzTktlUm5T?=
 =?utf-8?B?UnZtS3R5OW1KNXJpbm9JemJ5a3FkaEtYWWpKWS9YbGxtMDVpYWNPMWtyVWU1?=
 =?utf-8?B?ZXlESTYwdkJPbHVBVVBKcFFnLzgzZzF6bzludHJMcHpHeGIra2RYME1pdTNS?=
 =?utf-8?B?R2h2bzlIRFBUZDhhQ2lBNEhWMFVUemV5V2ZuamxQbWJzc1hNa2RPSDdaeXEr?=
 =?utf-8?B?WmhFNVAzKy9zN1MreDVIZWY3MXVJVVRQajF2bkk0TlZ0YUJIWitHUkpSaU9P?=
 =?utf-8?B?dlEyZ3dFdlEvZ3l4NnB2czVxcUR2ZzhKQ0NIbkt1UHFHZnF1anBjTzZyREJk?=
 =?utf-8?B?M1VzQmRtbExGcUIyLy9KN2d6VEVLZmp5T3hSWXZKanNoQUlydmdHS21zU2Zm?=
 =?utf-8?B?dmZIbEFpTzAycXNHdVBmSHRKWjBkbUNDbStvMGlOWlpyZDN4Y3EwNXExTjI5?=
 =?utf-8?B?azFXNkp0QnVYakhTNHNkZnF5SGVxbndZbDRFTDUzcWJhcjJMR2Q5ZnQ0RnJI?=
 =?utf-8?B?SXc1aW5SZUtlc2pqWWprWEpLdUp4TmxwUnZ0VGhSMm1XS0VOT2s5SWNHaWFL?=
 =?utf-8?B?QTNWUnV5MCtWTENlQUVXNE90MUQvZDVpeEI2U3BKeENzYTVJSEkzbHRBaDZu?=
 =?utf-8?B?Wnk3Mzd4RjBxMm9QWkVDYnB0UzNmRkMyNTQzSzlCQjNXZysvT3lKc2pITWRR?=
 =?utf-8?B?RU9BU0xRWEkwRnpUcmZWWXBJVmNQdWlNcnQzckpXQS9CMjhQdWhmRFQ3aC9h?=
 =?utf-8?B?ZDFObWM2eUJ4NmQ2bnJmSzQ3eHJWMXgzdFR5bkw2bG1YVE5Vamh4MXY5ZW5J?=
 =?utf-8?B?c0l3cjlVRzFqSGdDWURYRk1nbjVyd1pGZHZpRGw5anh4b1doTkcrdnk5aGlT?=
 =?utf-8?B?bERSWjdPbFZyT1ZyajVQUGdQRmQ1b1I4Q3NacWg5MkZ4a0k0Wk5yQmpJZEpt?=
 =?utf-8?B?T2F6R3IxTy9FUDhSbmNSZmxpb2U4Ym1FbjBFdW8wVm5QTEJJS2t5eGNBQzVu?=
 =?utf-8?B?Z09ndzhDUU8ySUFJT3Y5UVJTandSZUtHMTBNVURqQ2h5U0dIemZIeTUzMTQ4?=
 =?utf-8?B?VDErQnNxbjZnVE8va2c4b0JCMW5DK1VSZ0dOT0w1SERFaGVsSnh0RERTUHFL?=
 =?utf-8?B?SE9qUFg1bm1wN3l4OVE5dVpLVjlVOFFuV1cwN1huMG9GdDAxY1NPd201dnBz?=
 =?utf-8?B?QWZiSlNMQ0l6TUlrVHNQcmtsQjJKMHdoTHR2eVhLeDVteFJDWm5IQ2UrWXFT?=
 =?utf-8?B?R3FMK0tpTkRJbncxL0pDcStOMTR4cllkYkV3RnovVWxuMFhIMXBBWnBwc0pn?=
 =?utf-8?B?UlBGYjBWaVY2YitZU01TeWIyRlBZZnBJNHdYc0diODVuRjg5SlRPbVhTRUZk?=
 =?utf-8?B?QUtBdSthRCtkMlJ4U3ovNGhkRUdGdXJaZ2FnbGMwWnVpM2pVOTVHY2UwSzFN?=
 =?utf-8?B?alZwK2laWVI2ZW1iNjlwWFlhWHNNemQ3VWQ4VytnTnVtVjlyYnkxRW1IK091?=
 =?utf-8?Q?rkQlvO1P0Cem0HaRvEHIdnxYP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6043.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd13c68-eac1-4f8e-e144-08da70260167
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 23:16:16.0531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EeMwvcj7d2Sd1RzH81AAidlBwJimLv/LkUjfd9eFhgvvqz0rIpw1N+CyqY0rn0CBO0zXfXMNQ04Ltt6P/BQ55Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3840
X-OriginatorOrg: intel.com
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
Cc: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBdWxkLCBNYXR0aGV3IDxtYXR0
aGV3LmF1bGRAaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bHkgMjcsIDIwMjIgMTA6
MTQgUE0NCj4gVG86IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVs
bHN0cm9tQGxpbnV4LmludGVsLmNvbT47IEMsDQo+IFJhbWFsaW5nYW0gPHJhbWFsaW5nYW0uY0Bp
bnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2k5MTUvdHRtOiBkb24ndCBsZWFrIHRo
ZSBjY3Mgc3RhdGUNCj4gDQo+IFRoZSBrZXJuZWwgb25seSBtYW5hZ2VzIHRoZSBjY3Mgc3RhdGUg
d2l0aCBsbWVtLW9ubHkgb2JqZWN0cywgaG93ZXZlciB0aGUga2VybmVsIHNob3VsZCBzdGlsbCB0
YWtlDQo+IGNhcmUgbm90IHRvIGxlYWsgdGhlIENDUyBzdGF0ZSBmcm9tIHRoZSBwcmV2aW91cyB1
c2VyLg0KPiANCj4gRml4ZXM6IDQ4NzYwZmZlOTIzYSAoImRybS9pOTE1L2d0OiBDbGVhciBjb21w
cmVzcyBtZXRhZGF0YSBmb3IgRmxhdC1jY3Mgb2JqZWN0cyIpDQo+IFNpZ25lZC1vZmYtYnk6IE1h
dHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gQ2M6IFRob21hcyBIZWxsc3Ry
w7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IFJhbWFsaW5nYW0g
QyA8cmFtYWxpbmdhbS5jQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndC9pbnRlbF9taWdyYXRlLmMgfCAyMyArKysrKysrKysrKysrKysrKysrKysrLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9taWdyYXRlLmMgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9taWdyYXRlLmMNCj4gaW5kZXggYTY5YjI0NGYxNGQwLi45
YTA4MTQ0MjJiYTQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVs
X21pZ3JhdGUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9taWdyYXRl
LmMNCj4gQEAgLTcwOCw3ICs3MDgsNyBAQCBpbnRlbF9jb250ZXh0X21pZ3JhdGVfY29weShzdHJ1
Y3QgaW50ZWxfY29udGV4dCAqY2UsDQo+ICAJdTggc3JjX2FjY2VzcywgZHN0X2FjY2VzczsNCj4g
IAlzdHJ1Y3QgaTkxNV9yZXF1ZXN0ICpycTsNCj4gIAlpbnQgc3JjX3N6LCBkc3Rfc3o7DQo+IC0J
Ym9vbCBjY3NfaXNfc3JjOw0KPiArCWJvb2wgY2NzX2lzX3NyYywgb3ZlcndyaXRlX2NjczsNCj4g
IAlpbnQgZXJyOw0KPiANCj4gIAlHRU1fQlVHX09OKGNlLT52bSAhPSBjZS0+ZW5naW5lLT5ndC0+
bWlncmF0ZS5jb250ZXh0LT52bSk7DQo+IEBAIC03NDksNiArNzQ5LDggQEAgaW50ZWxfY29udGV4
dF9taWdyYXRlX2NvcHkoc3RydWN0IGludGVsX2NvbnRleHQgKmNlLA0KPiAgCQkJZ2V0X2Njc19z
Z19zZ3QoJml0X2NjcywgYnl0ZXNfdG9fY3B5KTsNCj4gIAl9DQo+IA0KPiArCW92ZXJ3cml0ZV9j
Y3MgPSBIQVNfRkxBVF9DQ1MoaTkxNSkgJiYgIWNjc19ieXRlc190b19jcHkgJiYNCj4gK2RzdF9p
c19sbWVtOw0KPiArDQo+ICAJc3JjX29mZnNldCA9IDA7DQo+ICAJZHN0X29mZnNldCA9IENIVU5L
X1NaOw0KPiAgCWlmIChIQVNfNjRLX1BBR0VTKGNlLT5lbmdpbmUtPmk5MTUpKSB7IEBAIC04NTIs
NiArODU0LDI1IEBADQo+IGludGVsX2NvbnRleHRfbWlncmF0ZV9jb3B5KHN0cnVjdCBpbnRlbF9j
b250ZXh0ICpjZSwNCj4gIAkJCWlmIChlcnIpDQo+ICAJCQkJZ290byBvdXRfcnE7DQo+ICAJCQlj
Y3NfYnl0ZXNfdG9fY3B5IC09IGNjc19zejsNCj4gKwkJfSBlbHNlIGlmIChvdmVyd3JpdGVfY2Nz
KSB7DQo+ICsJCQllcnIgPSBycS0+ZW5naW5lLT5lbWl0X2ZsdXNoKHJxLCBFTUlUX0lOVkFMSURB
VEUpOw0KPiArCQkJaWYgKGVycikNCj4gKwkJCQlnb3RvIG91dF9ycTsNCj4gKw0KPiArCQkJLyoN
Cj4gKwkJCSAqIFdoaWxlIHdlIGNhbid0IGFsd2F5cyByZXN0b3JlL21hbmFnZSB0aGUgQ0NTIHN0
YXRlLA0KPiArCQkJICogd2Ugc3RpbGwgbmVlZCB0byBlbnN1cmUgd2UgZG9uJ3QgbGVhayB0aGUg
Q0NTIHN0YXRlDQo+ICsJCQkgKiBmcm9tIHRoZSBwcmV2aW91cyB1c2VyLCBzbyBtYWtlIHN1cmUg
d2Ugb3ZlcndyaXRlIGl0DQo+ICsJCQkgKiB3aXRoIHNvbWV0aGluZy4NCj4gKwkJCSAqLw0KPiAr
CQkJZXJyID0gZW1pdF9jb3B5X2NjcyhycSwgZHN0X29mZnNldCwgSU5ESVJFQ1RfQUNDRVNTLA0K
PiArCQkJCQkgICAgZHN0X29mZnNldCwgRElSRUNUX0FDQ0VTUywgbGVuKTsNCj4gKwkJCWlmIChl
cnIpDQo+ICsJCQkJZ290byBvdXRfcnE7DQo+ICsNCj4gKwkJCWVyciA9IHJxLT5lbmdpbmUtPmVt
aXRfZmx1c2gocnEsIEVNSVRfSU5WQUxJREFURSk7DQo+ICsJCQlpZiAoZXJyKQ0KPiArCQkJCWdv
dG8gb3V0X3JxOw0KVGhlIGNoYW5nZSBpcyBsb29raW5nIGdvb2QgdG8gdGhlIHB1cnBvc2UuIEJ1
dCBzaG91bGRuJ3QgdGhpcyBiZSB0aGUgcGFydCBvZiBsbWVtIGFsbG9jYXRpb24gaXRzZWxmPw0K
DQpSYW0uDQo+ICAJCX0NCj4gDQo+ICAJCS8qIEFyYml0cmF0aW9uIGlzIHJlLWVuYWJsZWQgYmV0
d2VlbiByZXF1ZXN0cy4gKi8NCj4gLS0NCj4gMi4zNy4xDQoNCg==
