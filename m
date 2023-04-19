Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F386E738C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 08:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4B810E099;
	Wed, 19 Apr 2023 06:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B2010E18B;
 Wed, 19 Apr 2023 06:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681887483; x=1713423483;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=aAZ7Wy7lVebBPbigOr8n0krHIiwK0/qocuDb+bx+Zd0=;
 b=OrSY2G+ucc5AAO3XaERUkXGi23jAchncmoh29MN9zrphEot8l58RDpKa
 dYAYsDi+DG8otiZkB17D4w6EpG6kCaxc+ApMwUO13dRdVG9vYRPdE9TMA
 vGTuT/w/VV38dlXTE+sPrDqVKo799MHOVYg+8Z56IjkUzOGG9klRtqKWn
 V4Vl0vmRx6nBAZDTtDMBiefLjAVf59Pu7gWGHvnH1xc6nDr9ljT+BqnMj
 7lVk5ALnWnd0QyVgFOuJfjYMr7FMwnIo5cdMXaOCiWej4JW3dsZCg2wXj
 N7gJ55oZjdYDSEE8AlECLZ7RO7UOWXVrfhDYQzsN9lmGxTnOAXIY4Q3k2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="408279430"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="408279430"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 23:58:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="815523565"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="815523565"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 18 Apr 2023 23:58:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 18 Apr 2023 23:58:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 18 Apr 2023 23:58:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 18 Apr 2023 23:58:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiUN54XPTiJe0uuov7nyK10D3mNNm18m2ubVq06jxhE3Tm+5+hZft00loaWbbcFeMBwZGnRH11JZ3p6tJ2ZYKIDCRd/0dkc8PYUHXfrHq7bn8BVPoTEBMGYmy98I7AsL/KIlZZswLJEDjAtDG2zVtavX7Ji+jXH1uwxJ8YrsJvBDurSE0za5jtGkylRoRO6FFJhoqTBZEFXn38KE6nXZapOR2sLIZ8ZIRSU0OE4c3W70qzrR5yFXfAaXKby8EBfniOwq8bVbGtflGaenEb7ID/tZlf3x0vdDIAK71BNAI+nvyLZHMHjgeNLG7iC8Fz10ga2zeK2Gc+GFvfsiyUynPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aAZ7Wy7lVebBPbigOr8n0krHIiwK0/qocuDb+bx+Zd0=;
 b=SXsZVoOcTLrdw6IsEY6QyDm7K7TTuMlLT8GmkZ9U03/6YHhZ+FM2syxYEZp3zQV2h6YU9TzXVgPJGuBDJyTx2z3CxnlYK0D8Ivg7cO0RHYp6cw7dogtSFHYYsqvB5HTGP4Lpu3g7LlS/fI2iGWGIfoDSaDKIyuQO/PWNs8+3bpaOb6sJeN/qpKfVZmV1vRFxWLcjSpqigOCiPDpKIEUu9ty9H2ZskT4IFN+YHAenJEfmDcsgCnB0NZHi7AYojTfuCi8c1bqmPnEXKqTpCD4P+j4O/1evw2KNGPheLWn2m/S5il0Xcw7cXfb83dfA5g6F/qa9UPsejVAQMaXIm9R8xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CY8PR11MB7361.namprd11.prod.outlook.com (2603:10b6:930:84::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.45; Wed, 19 Apr 2023 06:57:59 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%6]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 06:57:59 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/4] mei: gsc_proxy: add gsc proxy driver
Thread-Topic: [PATCH 2/4] mei: gsc_proxy: add gsc proxy driver
Thread-Index: AQHZYl+LdvZWWA8yYk2tzJ5AqOH2La8yU8uA
Date: Wed, 19 Apr 2023 06:57:58 +0000
Message-ID: <612b04c9c35f1f67083ce5cb889f909fb89bb066.camel@intel.com>
References: <20230329165658.2686549-1-daniele.ceraolospurio@intel.com>
 <20230329165658.2686549-3-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230329165658.2686549-3-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CY8PR11MB7361:EE_
x-ms-office365-filtering-correlation-id: 2933b9a2-49be-458b-8ea3-08db40a3690f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iy9Nc8OPV6VQ0EewPysbmzV9W+Y4IodEnQ9/LO3p9hj6mPRwB/br9Lpg3awZWBPl0TWXu7CAC05zgCEjWqgh3qttL1bxApn5mgzBsIMTNN/trlF4og7UEDQG9wWrpVR9ZiJk44574yu9P46Vg0ZeBbJMpvXheKj0f8uewIXrceED8xEkm8+pVq+R1L1LeoxXQYDxh+SM/MMuuv8EX8QpKw8BPgu+a3zcVi18utXYAsPjFC/rqQbVdzbc0WgnMjq0sxRnx0Y+UgX15Ars45C7YUHy9MSrnmfOeLve7dzVAveipDpdgDoZZqk+G5mNPZmD9GNpP2PkqwOCvZB9G8mZ78mhMDTWzSrqGrY6cyN3VKwfZqAjjBXJxWGivrr3qWRX8jM4qeLyhD/Z9DRV1d92K6ABp/98nCUk2FvyXty4ENHM3io3Hy90y3mkbvBKal0WqMnqe7oxfnW6JTUOYBd8FuDLvCjDr4xpCLt+FRM4cKGLCmOGkjU5a+7qNOBn1zKuQt45AmPXFteoXYf1Ye6J3Vhny81+BqQPO/uf4POvjhanaEBczap0inuRPVhsPaY5FZEBM9Myptd2G9V+70MwkFbjyW7/zvaNx1z4UK+q3pxF7tmwcykBw0HD9i9Q/WEG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199021)(36756003)(186003)(4326008)(110136005)(54906003)(316002)(66556008)(76116006)(91956017)(66446008)(64756008)(66946007)(66476007)(478600001)(71200400001)(6486002)(8936002)(41300700001)(8676002)(5660300002)(82960400001)(2906002)(86362001)(38070700005)(38100700002)(122000001)(2616005)(6512007)(26005)(107886003)(6506007)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmI3S1ZYNEVQZXRzT3pCVzBOTDFSeUpCRXIvV04zMENVbm43V2ZralQ0clJa?=
 =?utf-8?B?QVdHZ1ROTDdLRHF3TW8wcy9pM2lrOXM3MUdIV3VzaUpZVGw3WjRPYzlDNlJr?=
 =?utf-8?B?bGc0aGJ3QjhjazIvSDZDdHZHSWFqT1dVRTZQWWhaRmdaa1BzU1lLcGtNdXFv?=
 =?utf-8?B?UnNxTXpkWEFrMjJZbS9qWnhEMy9SRzBBLzZUMmlvaDlOVlZja2tUbDBRZWla?=
 =?utf-8?B?NGxkUks1RzNGemhqM09yb2JPRkNMTDByZzIxU1N5RW1ZSFdyS0hVTkZ1VCsz?=
 =?utf-8?B?UG9ZUEE0SVhJY2V6UzNwOW03Kzk3YWNLL0R2anFRanYrYnlyL013bWxBWDlL?=
 =?utf-8?B?LzNzMmJGUlUyQndpVUUxSC85Nis2ZlMxcUVCSERXOVdmZWt3K2JXRUNKU1M4?=
 =?utf-8?B?S005M0c4dGNXcHV6R3Q4WGZNaXVSc0JFaFZrN2Z1elFyT3lBQ2JSelNnOURZ?=
 =?utf-8?B?NTVPejgvWks0a0VueHdlWGMyOVZzUk5EbHBTWHZ4dkZkK2RvcjRGWEFyeUtC?=
 =?utf-8?B?SnhRNGtCWllURGdhZVRoQnhrczJiYjR4TTAwbWlLME1vaGNrVmZtZXo5QkRm?=
 =?utf-8?B?VjR2cWNmVVlpV1NPUEM0WUc1ZVJXenRRV295UmZuZzNMN25La1lObFBBYmNr?=
 =?utf-8?B?LzRMRU1CQVRsblpTUnVoREJoRmtTR2oveElwRVVNNlk3d0dIS08vK0VmRXB4?=
 =?utf-8?B?bFZnQWhYSG9UTWRKSVB3S2VuNkRPQzRmWEprUFVTazZ4UU5hbG5nRUhpcXc2?=
 =?utf-8?B?cnQyUVJpb2plMHdZNnFwZm1ZVlliTElBYnBhTEZRVlRBQlNPQk5aTDNRenRq?=
 =?utf-8?B?dVpJQXhvWHB6aWFjd2ZLSkdUZDFPQldFVW9IM2NBU2FrMnoyY2tVOUQ3Q3Ro?=
 =?utf-8?B?aDJYRkl3cDlGazZnTFYxbmRqaVN6ckN4aWE5a1d1R3p2MFU5b1dXM0lua0tz?=
 =?utf-8?B?N0d4eEVzYjJGL2hjWGo3citjZVZ1cDJ5UUdlU2ZNWUxad1VpQlNVc1ZOUVFt?=
 =?utf-8?B?TDZJOHdmUkxLN28zWmJMYy9Cd2JlWEFxNHZuSWVUdmpTbHpvSUpMVjZudVNh?=
 =?utf-8?B?VW5kUG5xcGppbE56OTFVd3UxUTIvY2ozT1FqTHp4ZFY0NVlVVXo4c2krQ245?=
 =?utf-8?B?SG9qSUpDYStsSWxkOGFCajhqbVQ1eUhJOWRMMUpFb0lwNlVkemxQZFBBblNz?=
 =?utf-8?B?a3dEbmt0aHVzQk5aKzBIQXhaN1FvMUFVZHkrd0F5RzV2S3RjM3BEM1VkWVJh?=
 =?utf-8?B?cjgyNkZsaDVPUkp4WmpRcGFkZjhxM0xWWmNQNG5QQWRjbnIxeHE0bFF5elRa?=
 =?utf-8?B?R2thTDYrdGk3Rm9IcHFWSXpsN2R3Q1ZuclJRdlAxUWtZc0U3c0duak1VUnZi?=
 =?utf-8?B?WnRiNlZHMGFCdklCczhFWlhOZzBkNDVpeElId20xVWVvTUZPUjdTMmwwYWZq?=
 =?utf-8?B?ejJIQW9jY2RibGdxeU16QkJkY3hXaW11bWs4QnZnU3lBTVFRM0lDQXQzWmlT?=
 =?utf-8?B?eUhhK0xiL0xRbEpWWHhVaWp6b3VIOTdvSllhZHRXR1pOSzY5VjBtRHpHVnh6?=
 =?utf-8?B?NWpYSXVyTzlxVENjZEo5dzI0N1UyZFczSjJ4WEM1SjhkR1hqY2ZJNVBCY1U4?=
 =?utf-8?B?R2RGUkdvQmwwZ3VlS3JFTnBpT0Z5c0xaY1pVNnlGVzdqS0Z3T3RycTZlQkx3?=
 =?utf-8?B?ZS9TaDBWYXdTUzIxUmlUSnZCaE5WdjJpS0liLy9DRExIVVBId2VQUnUyZ1gv?=
 =?utf-8?B?WkF2M2MxNDYrNTJWOHhaUnErV0dFY3ZCc29jM3dFQmFQNkVzMUdtMXJRT09x?=
 =?utf-8?B?NkUzbmdZWDRUOVFKU0hLV1RzUDl5Ky9xUWhFQlZqVzA5OFViMDcxditYeWl3?=
 =?utf-8?B?WTAwbmR4ZENhRHR1WUFMWHRsVWk1Q1BSU29CdnozV0FNT0NRYkdKRzVXcUlU?=
 =?utf-8?B?L21nRDhlRXlwd3cwbDlRVHhOZVhqNUFzcW45TFBEYnBZOC9KaHZ5Zm5Rb2xS?=
 =?utf-8?B?ODhYS05iOWlBZThtQnBtMEVTTVMxTWx0TDlnbGZDVUticG9Qc2RTWU5VQ1dG?=
 =?utf-8?B?b3A2eXpLUTBOUm1XTXM3TGJFMFdKZ0xPdHlheHdreEtNMXhKQTdITUt5ZndE?=
 =?utf-8?B?aUtYcy9ROG01V0xvQTMxa3BYMGVrZjBSOVJxcEpXVWFhSStwU2cvRFRHOHhU?=
 =?utf-8?Q?reuU1dbcrDo2xY0JbSwgT8g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E30F29E4882DDD45A341628A1BBA5034@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2933b9a2-49be-458b-8ea3-08db40a3690f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2023 06:57:58.9021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AAiCdDQDdOfyKxj1Ynpg5CySPE0COLVqB1LNmPsG1N80xH74AJ31ooTgImv+mHXj3q02BWGHD99JFePvMTzEXYDvWErj+EDy0zH+eH6IFZ826ApjqhRbQfUVYRpWhJQY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7361
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>, "Winkler,
 Tomas" <tomas.winkler@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTAzLTI5IGF0IDA5OjU2IC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gRnJvbTogQWxleGFuZGVyIFVzeXNraW4gPGFsZXhhbmRlci51c3lza2luQGlu
dGVsLmNvbT4NCj4gDQo+IEFkZCBHU0MgcHJveHkgZHJpdmVyLiBJdCB0byBhbGxvd3MgbWVzc2Fn
aW5nIGJldHdlZW4gR1NDIGNvbXBvbmVudA0KPiBvbiBJbnRlbCBvbiBib2FyZCBncmFwaGljcyBj
YXJkIGFuZCBDU0UgZGV2aWNlLg0KYWxhbjpuaXQ6IGlzbid0ICJJbnRlbCBpbnRlZ3JhdGVkIEdQ
VSIgY2xlYXJlciB0aGFuICJJbnRlbCBvbi1ib2FyZCBncmFwaGljcyBjYXJkIj8NClNhbWUgdGhp
bmcgZm9yIHRoZSBLY29uZmlnIGRlc2NyaXB0aW9uIGxhdGVyIChvciBhbSBpIG1pc3Npbmcgc29t
ZXRoaW5nIGVsc2UgaGVyZSkuDQoNCmFsYW46c25pcA0KDQoNCg0KPiArICAgICAgICAgTUVJIEdT
QyBwcm94eSBlbmFibGVzIG1lc3NhZ2luZyBiZXR3ZWVuIEdTQyBzZXJ2aWNlIG9uDQo+ICsgICAg
ICAgICBJbnRlbCBncmFwaGljcyBvbi1ib2FyZCBjYXJkIGFuZCBzZXJ2aWNlcyBvbiBDU0UgKE1F
SSkNCmFsYW46bml0OiBzYW1lIGFzIGFib3ZlDQoNCg0KDQoNCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbWlzYy9tZWkvZ3NjX3Byb3h5L21laV9nc2NfcHJveHkuYyBiL2RyaXZlcnMvbWlzYy9tZWkv
Z3NjX3Byb3h5L21laV9nc2NfcHJveHkuYw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRl
eCAwMDAwMDAwMDAwMDAuLjk1M2VkYTFhMTZmYg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2Ry
aXZlcnMvbWlzYy9tZWkvZ3NjX3Byb3h5L21laV9nc2NfcHJveHkuYw0KPiBAQCAtMCwwICsxLDIw
OCBAQA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gKy8qDQo+ICsg
KiBDb3B5cmlnaHQgKGMpIDIwMjItMjAyMyBJbnRlbCBDb3Jwb3JhdGlvbg0KPiArICovDQo+ICsN
Cj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9wY2kuaD4N
Cj4gKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvdXVpZC5oPg0K
PiArI2luY2x1ZGUgPGxpbnV4L21laV9jbF9idXMuaD4NCmFsYW46IFtuaXQ/XSBpIHRob3VnaHQg
d2UgbmVlZCB0byBoYXZlIHRoZSBoZWFkZXJzIGFscGhhYmV0aWNhbGx5IG9yZGVyZWQ/IChiZWxv
dyB0b28pDQo+ICsjaW5jbHVkZSA8bGludXgvY29tcG9uZW50Lmg+DQo+ICsjaW5jbHVkZSA8ZHJt
L2RybV9jb25uZWN0b3IuaD4NCj4gKyNpbmNsdWRlIDxkcm0vaTkxNV9jb21wb25lbnQuaD4NCj4g
KyNpbmNsdWRlIDxkcm0vaTkxNV9nc2NfcHJveHlfbWVpX2ludGVyZmFjZS5oPg0KDQo+ICsNCj4g
Ky8qKg0KPiArICogbWVpX2dzY19wcm94eV9zZW5kIC0gU2VuZHMgYSBwcm94eSBtZXNzYWdlIHRv
IE1FIEZXLg0KPiArICogQGRldjogZGV2aWNlIGNvcnJlc3BvbmRpbmcgdG8gdGhlIG1laV9jbF9k
ZXZpY2UNCj4gKyAqIEBidWY6IGEgbWVzc2FnZSBidWZmZXIgdG8gc2VuZA0KPiArICogQHNpemU6
IHNpemUgb2YgdGhlIG1lc3NhZ2UNCj4gKyAqIFJldHVybjogYnl0ZXMgc2VudCBvbiBTdWNjZXNz
LCA8MCBvbiBGYWlsdXJlDQo+ICsgKi8NCj4gK3N0YXRpYyBpbnQgbWVpX2dzY19wcm94eV9zZW5k
KHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3Qgdm9pZCAqYnVmLCBzaXplX3Qgc2l6ZSkNCj4gK3sN
Cj4gKwlzc2l6ZV90IHJldDsNCj4gKw0KPiArCWlmICghZGV2IHx8ICFidWYpDQphbGFuOiBuaXQ6
IG5vdCBzdXJlIGlmIHdlIHNob3VsZCBiZSBjaGVja2luZyBmb3IgIXNpemUgaGVyZSAtIGkgZG8g
c2VlIHRoYXQgbmV4dCBwYXRjaA0KaXMgY2hlY2tpbmcgZm9yIHRoaXMgZnJvbSBpOTE1IHNpZGUg
b2YgdGhlIGludGVyZmFjZS4uLiBidXQganVzdCB3YXNudCBzdXJlIHdoaWNoIGlzIHRoZSBwcmVm
ZXJlZCBzdHlsZQ0KKGluIHRlcm1zIG9mIHdoZXJlIHRvIGNoZWNrIGZvciB0aGlzIGNvbmRpdGlv
bikuIEVpdGhlciB3YXksIGl0cyBhIG5pdCBmb3IgbWUgc2luY2UgaSB0cmFjZWQgZG93bg0KYWxs
IHRoZSB3YXkgdG8gbWVpX2NsX2FsbG9jX2NiIGFuZCBpdCBsb29rcyBsaWtlIG1laSBidXMgY2Fu
IHRvbGVyYXRlIHplcm8gc2l6ZWQgbWVzc2FnZXMuDQo+ICsJCXJldHVybiAtRUlOVkFMOw0KYWxh
bjpzbmlwDQoNCj4gK3N0YXRpYyBpbnQgbWVpX2dzY19wcm94eV9yZWN2KHN0cnVjdCBkZXZpY2Ug
KmRldiwgdm9pZCAqYnVmLCBzaXplX3Qgc2l6ZSkNCj4gK3sNCj4gKwlzc2l6ZV90IHJldDsNCj4g
Kw0KPiArCWlmICghZGV2IHx8ICFidWYpDQphbGFuOiBuaXQ6IHNhbWUgYXMgaW4gdGhlICdzZW5k
JyBhYm92ZSwuLiBub3Qgc3VyZSBpZiB3ZSBzaG91bGQgYmUgY2hlY2tpbmcgZm9yICFzaXplIGhl
cmUuLi4NCm9yIHBlcmhhcHMgMCBzaXplZCByZWN2IGlzIHN1cHBvcnRlZC4NCg0KPiArCQlyZXR1
cm4gLUVJTlZBTDsNCmFsYW46c25pcA0KDQo+ICtzdGF0aWMgaW50IG1laV9nc2NfcHJveHlfY29t
cG9uZW50X21hdGNoKHN0cnVjdCBkZXZpY2UgKmRldiwgaW50IHN1YmNvbXBvbmVudCwNCj4gKwkJ
CQkJIHZvaWQgKmRhdGEpDQo+ICt7DQo+ICsJc3RydWN0IHBjaV9kZXYgKnBkZXY7DQo+ICsNCj4g
KwlpZiAoIWRldl9pc19wY2koZGV2KSkNCj4gKwkJcmV0dXJuIDA7DQo+ICsNCj4gKwlwZGV2ID0g
dG9fcGNpX2RldihkZXYpOw0KPiArDQo+ICsJaWYgKHBkZXYtPmNsYXNzICE9IChQQ0lfQ0xBU1Nf
RElTUExBWV9WR0EgPDwgOCkgfHwNCj4gKwkgICAgcGRldi0+dmVuZG9yICE9IFBDSV9WRU5ET1Jf
SURfSU5URUwpDQo+ICsJCXJldHVybiAwOw0KPiArDQo+ICsJaWYgKHN1YmNvbXBvbmVudCAhPSBJ
OTE1X0NPTVBPTkVOVF9HU0NfUFJPWFkpDQo+ICsJCXJldHVybiAwOw0KPiArDQo+ICsJcmV0dXJu
IGNvbXBvbmVudF9jb21wYXJlX2RldihkZXYtPnBhcmVudCwgKChzdHJ1Y3QgZGV2aWNlICopZGF0
YSktPnBhcmVudCk7DQphbGFuOiBkbyB3ZSBjYXJlIGlmIGJvdGggdGhlc2UgcGFyZW50cyBhcmUg
bm9uLW51bGw/IGkgbm90aWNlIGluIG90aGVyIG1laSBjb21wb25lbnQNCmRyaXZlcnMgbWF0Y2gg
ZnVuY3Rpb25zIHdlIGRvIGNoZWNrIHRoYXQuDQoNCj4gK30NCj4gKw0KYWxhbjpzbmlwDQoNCj4g
KyNkZWZpbmUgTUVJX1VVSURfR1NDX1BST1hZIFVVSURfTEUoMHhmNzNkYjA0LCAweDk3YWIsIDB4
NDEyNSwgXA0KPiArCQkJCSAgIDB4YjgsIDB4OTMsIDB4ZTksIDB4NCwgMHhhZCwgMHhkLCAweDU0
LCAweDY0KQ0KDQphbGFuOiBhcG9sb2dpZXMgZm9yIHRoZSBuZXdiaWUgcXVlc3Rpb24sIGJ1dCB3
aHkgYXJlIHdlIHVzaW5nIFVVSUQgZm9yIHRoZSBnc2NfcHJveHkNCmFzIG9wcG9zZWQgdG8gR1VJ
RCBsaWtlIHRoZSBvdGhlciBtZWkgY29tcG9uZW50cz8gaSBhbSBub3Qgc3VyZSBpZiBpIHJlYWQg
dGhlIHJpZ2h0DQphcmNoaXZlZCBwYXRjaCByZXZpZXcgYnV0IGl0IHNvdW5kZWQgbGlrZSBHVUlE
IGlzIGZvciBpbnRlcm5hbCB0byBrZXJuZWwgb25seSB3aGVyZWFzDQpVVUlEIGlzIGZvciBleHRl
cm5hbCB0b28/IChpbiB3aGljaCBjYXNlIHdoeSBhcmUgd2Ugbm90IHVzaW5nIEdVSUQgZm9yIGdz
Yy1wcm94eT8pDQpDb25zaWRlciB0aGlzIGEgbm9uLWJsb2NraW5nIGlucXVpcnkgc2luY2UgaSBh
c3N1bWUgbWVpIGZvbGtzIGhhdmUgcmV2aWV3ZWQgdGhpcw0KcHJpb3IgYW5kIHRoaXMgaXMgYW4g
ZXhwbGljaXQgZGVzaWduIGRlY2lzaW9uIHRoYXQgSSdtIGp1c3Qgbm90IHZlcnNlZCBvbi4NCg0K
YWxhbjpzbmlwDQo=
