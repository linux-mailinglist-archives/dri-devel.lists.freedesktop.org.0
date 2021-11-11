Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C1A44DC6E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 21:18:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B314A6E0DB;
	Thu, 11 Nov 2021 20:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACAC6E0DB;
 Thu, 11 Nov 2021 20:18:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="232850902"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="232850902"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 12:18:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="492675466"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga007.jf.intel.com with ESMTP; 11 Nov 2021 12:18:41 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 11 Nov 2021 12:18:40 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 11 Nov 2021 12:18:40 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 11 Nov 2021 12:18:40 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 11 Nov 2021 12:18:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRAeLNG1j8sTAgNWPPAeLkeXbKVgGfADNdswP64xMfN+i4jUDCWJ07KFteqZ1m7y8aCesYx4Vv/oqS6p2icIgdX/zj8gAoiMexDABST/hvUcEncdG9gpOzQTX+Lv0Dt7pN4Ht5KUJf1+IW/yzUT0yTo3F0YJdMwk9rXdqX2wA88CuhqI80RDDo6+QxSvBoeSAc3lOg7nQT55FpfVzWddsZ/fGbnrsp8B52jPsC5mOW1aZjIHAPiW0Xq0VvVafEDFoyJSxtc+yvltnv7DaPjz7O4oPs5c8Ju8/WwHrQDH8wNbCc2VkD61EAHcfaMsKIYHlP0LDRUS5ZeZL9HAiF2HoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQ9UH4Qs5XV+8Rhy2ronIhV/JPXSneZAOwBsbqjvPUg=;
 b=g8/stHxGL6xmnD+b/tz3hDko80cPq0Mq+iWKoZ4vZjt10rfE0hZOikGxDedq8UvUzP+Sqe53ogzrJvlTMUMhkxOsPYYXrTIvqObcX5+jgqOnQ64GqwroCTYRW6+9zk5hOZrymB4hxnU9EyKxAtTNXO7OrCbMx+PJUcN3oVD9pChTNr0kQGdRlxsxac1IR/PkYEQ88KgeKN34RTgLUkk/kh+CHRv5HmwjxBK0HIh4Ip4P0if+nMGGU9ojRYxXfPstGO5qvb3sfA2MzY3UlYbkKXGZvWns4pGRCxn2T3rfumY/f333XW2HEq4d2X03OxB7g2t4NVBFAgEK5mpjU6D4Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQ9UH4Qs5XV+8Rhy2ronIhV/JPXSneZAOwBsbqjvPUg=;
 b=Y3s1quxCLR7h4Az/Cj3j0uqKcFW/cGrVH/6f03RGyOCwHZfy+xf9h/zSmBsxxAA7k7LZGcQnbl1YQORzCjZ+Z5V72LLK4G0QdnvPrVEn17pd8lWdCuxHPc/6h90FXaJfF73Y5n0rSodEdMFph1vS3YSQ4l+8ORBj30pLGvqEtYA=
Received: from BYAPR11MB3784.namprd11.prod.outlook.com (2603:10b6:a03:fe::10)
 by BY5PR11MB3928.namprd11.prod.outlook.com (2603:10b6:a03:188::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.18; Thu, 11 Nov
 2021 20:18:37 +0000
Received: from BYAPR11MB3784.namprd11.prod.outlook.com
 ([fe80::2d25:f356:ac1e:ff14]) by BYAPR11MB3784.namprd11.prod.outlook.com
 ([fe80::2d25:f356:ac1e:ff14%6]) with mapi id 15.20.4669.016; Thu, 11 Nov 2021
 20:18:37 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Brost, Matthew" <matthew.brost@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Drop stealing of bits from
 i915_sw_fence function pointer
Thread-Topic: [Intel-gfx] [PATCH] drm/i915: Drop stealing of bits from
 i915_sw_fence function pointer
Thread-Index: AQHXr8njimQtkFu4M0WBqK5fZLnxbqv/E1MA
Date: Thu, 11 Nov 2021 20:18:37 +0000
Message-ID: <db127308f71debac7d2b8ce5cf790dd726b0630b.camel@intel.com>
References: <20210922154713.1109-1-matthew.brost@intel.com>
In-Reply-To: <20210922154713.1109-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d577813-aa6e-4615-e577-08d9a5507206
x-ms-traffictypediagnostic: BY5PR11MB3928:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BY5PR11MB392818FF5D9563837D96AD668A949@BY5PR11MB3928.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pHecpdtoouDyhFRMmpcj9Wa12amy2Uqbv7ralALmXAmffyxl7IP7m/j4mlO3BWo7EQJo8+3oyJsxsIf1ioPASB6Fs0EpqzP65LFJZJrflBEqo5Ye7wmP73QAGS7bl3CsL0/vZN88kFetayvvM4kG+qJ2ybSWvG5yj8PunHKadHCPWQNetku6FsnVZta/lwuo9dvhr2DND61L0aVdKdBV2+po3NdfBp6W6yKlIXs6Pf/XORB8nrYt+/Py3PxktH/4E4zuDLI57Kq63gBAd6tJn5oNQ3YrlCdnjXhZ6XSqI/QCDTeA9qtdZNOG9mDze5SVBTFBc1Czc5q57FeQeMN9LCSY5xJT2wKWip4DoFX+DBK0BOPDGhkiu/n+kFG51byQlm75IyJCxLXf5Cki4CGZ6yMne5Ni/hLDRUVr2XZwOcxiVXy4ENpz1lti9BDWYAQ/Esai9IZ+nelw8zA5y3tdVRLx64G5eBHnNuDurLoa4pXNjv/sh8xe58RQpgSQ/HuaTXd3j2ijxmb3ldBbbD+winss9NQWvHo8IvQPFAcIzdypx+H8wuvAjiZWMaYw5B0Gsz6zbdHIKXwH1mwO6XLXVLqqECSSEunPU7FrRpGB1QcLuJpvfqAgt+hwwZbqkz8QeRVbRANPutCdGZw1rh/HQQRye5TCBwR89Hv3XdclemMQBIDcM2yyqhJuJuTjUOa4wFbLmj0Fiqytoig9/X5Xag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3784.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(83380400001)(71200400001)(76116006)(38100700002)(6486002)(122000001)(2616005)(8676002)(4326008)(8936002)(26005)(186003)(2906002)(36756003)(508600001)(5660300002)(6512007)(6506007)(110136005)(66476007)(64756008)(66556008)(66946007)(66446008)(54906003)(316002)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXlrTjFHNU1aYTJTMFNJQzVuWmg1Z0tDMXh3VXozandyK1J3c0VwdTJFdVg0?=
 =?utf-8?B?d1RIS0pZMlQ2dytkOFVCZTFHUk1qVnN2VDNCVVpmVmxOdjV2K21ZQXRPSWVI?=
 =?utf-8?B?SlV2YnRaeTBBY0VZNStwNFBwbTFkNFl4aWN6VlRWZ1NUWS9qNmxNb0gya3py?=
 =?utf-8?B?VHZ6YkoyMmlCVEpPbk11Rlh6Sk5WUDBQWlBzT3ZJanZHZjB0WW1RRVlGUk5H?=
 =?utf-8?B?bnVYMzhwdXdQamdiNXkrRXZVUktGV1ZFRDFQK3dtY0ZPWldvZDU2U0JBZzUr?=
 =?utf-8?B?ZHhMQURsVEx0aC9VQjlXemVxaG9NVzljZUFtMGlIbHpCRy9oREs3REdhM21r?=
 =?utf-8?B?eDZOdEJlajBmSnV4d0l4bFNPYkdPSEptb1o5cVRCYmZvV0ltMThnZ1Nzd2xt?=
 =?utf-8?B?WllZYjhtandrOTZsN0xiUThnSU9YQkZHaVhzeXloQ29PZTFkeWRXdVZpcHhW?=
 =?utf-8?B?NExjUDBwOGpUWGJhaEdQWVJ4N2ZhQityU0djdFR0czNyYmN0UGRTZ0U2YjFD?=
 =?utf-8?B?U2N5N0JvOHdCT0pNTWN5N2Y4Vyt2cEJhUkVNMkJuYUNWN1ZaMTlWNk9JWmZH?=
 =?utf-8?B?TXpVNDRJSk0xeThwV0NGTlhOOFhuVUtwYWJRZTA1Y1BTYWFNWmRWWTZWbVhr?=
 =?utf-8?B?bXZCSzc5ZlJaNE9oNGpPUWNPZjBYeTJZWS9FZUxLVm53cGs2ZkVHN0R6clJI?=
 =?utf-8?B?WURRRzJHVWQraE1vWXdUZFlJMDI4Y3BaSVdmVVFXSFBFYWRsSktpU3ZQbVZH?=
 =?utf-8?B?SmYyeWh6MjZxd2VLVjJuMXVCdjdOSmM2bzA4VGEwMlFxdkR1b2lSL2lqTFMz?=
 =?utf-8?B?VWdoMHdnZVd5OUtnSTBGN29UNkw0YWRBN3ZITzRLNUE0VlNndDJuZGNHT0U0?=
 =?utf-8?B?ZjAvbkNQeWt5THRuRmNvdEEzOVRjWlFvczhwZFFidUFNYm5aY3VpeFkybFE3?=
 =?utf-8?B?bHF3TEp4VDZsQndCTjIwL0RockFFckVyN0R2cnZyT0dic1dqYUs2ZHpXWksy?=
 =?utf-8?B?dmozYmRjaXE4VmxZYXpFdGkzY25OSStvT3BhSDA3WEVITnJqN0NRWWlGM25Q?=
 =?utf-8?B?aHZLaXZJV0o5UEtZTG5LZW1jVmtQUENORC9KYnVQUG5RRS9EaDY5b2N3bFBB?=
 =?utf-8?B?MFFkR0Q1cGNURjRDdDRXUWxlZ2lpaTU1QUpqSUl0QjVLVWdBQ3hoTFMwSW14?=
 =?utf-8?B?cll3K0ZmaWJVWWJCT2FZa0I4R2VmV1dFMWUwM1pjTFJJdjBHN2o5UHhTZWk3?=
 =?utf-8?B?SmhRQnJFcW84T3hRZnNPOXdtbi90Y1ZuUHpkUHFkRXVWSlJOa3ZuYUdpdk9y?=
 =?utf-8?B?Q1c4b0RXZEcrRlJIN01raHlWcUgrYXhDWi96STlGTzE2b29NeHNiMlQvMnQ2?=
 =?utf-8?B?T2pWQnNxYWllaWtqNXIyNkFZTlE5Um1qSkxHTFdaT3kzc1RDZVhsRU1aUnVI?=
 =?utf-8?B?b1E2NkNSUnZNSEU2cHA4ZXFvVXpDVm90MTFjaGpvWVY0MExLdDBjK0FiY1lv?=
 =?utf-8?B?WGx6N1ZmTjBVaDBYbTR6RGYyMHpkaE82Z2VzbDdxMG12L2NBSlI4VEcyK0M1?=
 =?utf-8?B?VkgrbUJNQ1FwVHpFays3UkVVdE91allYaXlCelkzc25oZ1ZuVWhkMUU2R3Yz?=
 =?utf-8?B?QW9GYmdUcUlBN2htUVBLb2V1ZG0ycDl5MmlhTU8waHp6SFV0TXlLSXUvd29Z?=
 =?utf-8?B?cWVzcnVscG1OczBHM3FPeklpMlJvTG00dFlvc0pVMVA4RFRJeUowYkhzcmM5?=
 =?utf-8?B?SXNldVZNV3RKN2R4K1h2TzNsZW9jVWkwUytIWHlvZFFEUEZHbEVxcWFDSU9i?=
 =?utf-8?B?WUVXWlpnUlNXbFJORGRBaEc0bGs3emdrK0d1REZSWG9qSjllVW9jUzl4dkhE?=
 =?utf-8?B?MTUvdy83UTl6aWlaMkRINHZkTkpuc1dkeGRCVE9JeFE4VkNLZERBakVOM2V6?=
 =?utf-8?B?czZsamU0RkVIZDJMQXRxVENvZU1JMU41dVlhbU9jbVlReDhsVlV6WXQ0WEtp?=
 =?utf-8?B?VlA4L1ZNNGN0RFEzTG9iVkcxZ3VTS3RZYUVWSThoUzV6SWNKcXQ2eXFMY3RE?=
 =?utf-8?B?VHIxWW84Z2tmTFBQMkhHdGNJSmRuVHUydGRpR3IvejY4Q0VqVnZrNTFWdVd3?=
 =?utf-8?B?czVzTGFMeWcyK1NQRGlOS3pxSzRkdlIzU21iUXNHSnNYQUhyb2dlNW1PYXFt?=
 =?utf-8?B?V1Jsb25kRFk5bDNITW5YQXRoSE5uTTNqaDl0eU5zQTV3cGwwY21oSkJpV1RP?=
 =?utf-8?B?KzdzaWQrZkxIQWZaT0dDekV6c01zNzVHN290NUN6bEFZMUlTMkE4Kzc3aDNH?=
 =?utf-8?B?V3dIUTl6OExJN3UrOC9jakduWnFCV3drenl5U053SlltOThsTXR3dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EEDC6BCF4381C346BBDB3FC3D6D58A06@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3784.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d577813-aa6e-4615-e577-08d9a5507206
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2021 20:18:37.7058 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oBboyzVmI8iDkilJv29QKuoidsX4T2G/VhIBmXDV0XRDBpMUBBxkbmKo874aUbj0z0BHs4GBlP96ogxkcVQyh+t0Lbgx7tzbjN7GTBp3/8eNaktGewSW2dodHkj8hywH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3928
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
Cc: "De Marchi,
 Lucas" <lucas.demarchi@intel.com>, "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5IE1hdHQsIGFwb2xvZ2llcyBmb3IgdGhlIGRlbGF5LCB3ZW50IHRocnUgYWxsIHRoZSBjb2Rl
LCBMR1RNLg0KDQpSZXZpZXdlZC1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFs
ZXhpc0BpbnRlbC5jb20+DQoNClAuUy4gLSBBcyBhIHNpZGUgbm90ZSwgd291bGQgYmUgaW50ZXJl
c3RpbmcgdG8gcmVwbGF5IHRoZSBvcmlnaW5hbCByZWFzb24gYmVoaW5kIHRoZSBvdmVybG9hZGlu
ZyBvZiB0aGUNCmZ1bmMgcHRyIGJpdHMgdG8gYmVnaW4gd2l0aC4uLiB0byBzZWUgd2hhdCB0aGUg
aW5pdGlhbCBpbnRlbnRpb24gd2FzLg0KDQoNCi4uLmFsYW4NCg0KT24gV2VkLCAyMDIxLTA5LTIy
IGF0IDA4OjQ3IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0KPiBSYXRoZXIgdGhhbiBzdGVh
bGluZyBiaXRzIGZyb20gaTkxNV9zd19mZW5jZSBmdW5jdGlvbiBwb2ludGVyIHVzZQ0KPiBzZXBl
cmF0ZSBmaWVsZHMgZm9yIGZ1bmN0aW9uIHBvaW50ZXIgYW5kIGZsYWdzLiBJZiB1c2luZyB0d28g
ZGlmZmVyZW50DQo+IGZpZWxkcywgdGhlIDQgYnl0ZSBhbGlnbm1lbnQgZm9yIHRoZSBpOTE1X3N3
X2ZlbmNlIGZ1bmN0aW9uIHBvaW50ZXIgY2FuDQo+IGFsc28gYmUgZHJvcHBlZC4NCj4gDQo+IHYy
Og0KPiAgKENJKQ0KPiAgIC0gU2V0IG5ldyBmdW5jdGlvbiBmaWVsZCByYXRoZXIgdGhhbiBmbGFn
cyBpbiBfX2k5MTVfc3dfZmVuY2VfaW5pdA0KPiB2MzoNCj4gIChUdnJ0a28pDQo+ICAgLSBSZW1v
dmUgQlVHX09OKCFmZW5jZS0+ZmxhZ3MpIGluIHJlaW5pdCBhcyB0aGF0IHdpbGwgbm93IGJsb3cg
dXANCj4gICAtIE9ubHkgZGVmaW5lIGZlbmNlLT5mbGFncyBpZiBDT05GSUdfRFJNX0k5MTVfU1df
RkVOQ0VfQ0hFQ0tfREFHIGlzDQo+ICAgICBkZWZpbmVkDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBN
YXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gQWNrZWQtYnk6IEphbmkg
TmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgIHwgIDIgKy0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2dlbS9pOTE1X2dlbV9jb250ZXh0LmMgICB8ICAyICstDQo+ICBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9pOTE1X3JlcXVlc3QuYyAgICAgICAgICAgfCAgNCArLS0NCj4gIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTVfc3dfZmVuY2UuYyAgICAgICAgICB8IDI4ICsrKysrKysrKysrLS0tLS0t
LS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfc3dfZmVuY2UuaCAgICAgICAgICB8IDIz
ICsrKysrKystLS0tLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9zd19mZW5jZV93
b3JrLmMgICAgIHwgIDIgKy0NCj4gIC4uLi9ncHUvZHJtL2k5MTUvc2VsZnRlc3RzL2k5MTVfc3df
ZmVuY2UuYyAgICB8ICAyICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9zZWxmdGVzdHMvbGli
X3N3X2ZlbmNlLmMgfCAgOCArKystLS0NCj4gIDggZmlsZXMgY2hhbmdlZCwgMzkgaW5zZXJ0aW9u
cygrKSwgMzIgZGVsZXRpb25zKC0pDQo+IA0KPiAgDQo+IC0tIA0KPiAyLjMyLjANCj4gDQoNCg==
