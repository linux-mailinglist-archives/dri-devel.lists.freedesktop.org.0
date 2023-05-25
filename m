Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E27711895
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 22:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5D510E762;
	Thu, 25 May 2023 20:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DC810E762;
 Thu, 25 May 2023 20:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685048310; x=1716584310;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+Lo+woIZmQ7B1lGyHzgVW+4m/rHxyLJBz+yW94O8+Hk=;
 b=FX92SMBiJs4WrwWDAXU1avaOSKLpNOiK1nWDk9zQmRF0j+p2eYB3cIFn
 Wr6HBh3l+U7ZyudY5ON1/VyhsWXQEdJ99FwRDC/k7nHiUohF3np1dSstN
 Zagco9NjVKiPyOnhOWsw7oEuizW64cYeN87XTbX6OUrYw+VMhEgWH4MxP
 GKBSnVCv0PItFuqyhUXU9ujpfI7p6qkdgo+fpkvYy021i4IVJZrO6X83d
 qiU7HuWVJUdjPtM0Y3TpBoxTVAJZDxiB+gJpC5BXKethacsd6MzI7aZ+S
 Dft3YSrlGSVUbNPzx5/b3W8nDGf6cru14QTxY1WMBlqPNDGowFRokN0cv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="382271437"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="382271437"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 13:58:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="879283561"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="879283561"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 25 May 2023 13:58:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 13:58:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 13:58:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 13:58:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7yoX8YXMhkxYXpfI9EYX7edgb7A3iL9n/tNU9qUNjS9oLWuUY7dZNaxvHL1X7BZJPAS+wyv8fkvjQY1lSm8vgWOGmGYWAM9ZwVTf4ixnK8VaBV/M9Fv0ezHLoml2BqIxIt9xOb98ob08D2S7kVS/bP5MGEBT6fepB4U4PFnlsADH22ZchEcrhcT+4UiJqp1nXP1qjObcWkocnw5k7SdqHVM13s3kviC/Cp28jplyQXRh8aapoobfyaNur95ntQoyqXKoXXovxGzQsMQ9+2YrYo2vaQQ5IAqiCGsKt2XUn0HyhrV4ZQsYixRc/OiCJB3xwJ9yexCefkhknOKL7QTaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Lo+woIZmQ7B1lGyHzgVW+4m/rHxyLJBz+yW94O8+Hk=;
 b=d+DgSaclsDvwI82VHke/glLYMoLbawmhHMDR2pSMoEKoL5Un14DueAmqAV/HCJOXPmAISBySpo2L/sWZAlsKfZEyYvn1PqLFtXfBt8SQkD6nrO8cR/aqNM2XE4TlxFmDawS+z93/O05RjSNYnZLhWj8pbolTZ8ZUISIAq7yhESttIqsgCL0m+ueUmgJ5tXurAFElNH2Vw3lPiIralZbshqUrXVyO215/U0VyqJxXWnWANRKUuTS6vJkQYEPkyYfEQ93+FGbjf8GmYWXRR8FGc0uZYAKkPiwgVjE3Oew1l9WicPK5Md8/wYgVGLDm9IUBWt7Mo7V5O8febY1pLiHKoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 CH0PR11MB5561.namprd11.prod.outlook.com (2603:10b6:610:d4::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.28; Thu, 25 May 2023 20:58:27 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::5671:364e:5c39:3284]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::5671:364e:5c39:3284%5]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 20:58:27 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v2 4/7] drm/i915: Always enable CGM CSC on CHV
Thread-Topic: [Intel-gfx] [PATCH v2 4/7] drm/i915: Always enable CGM CSC on CHV
Thread-Index: AQHZbigI/DhokGStzEWM2616U2yywq9ruqOg
Date: Thu, 25 May 2023 20:58:27 +0000
Message-ID: <DM4PR11MB6360CCBB2934B0392C626CA4F4469@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230413164916.4221-1-ville.syrjala@linux.intel.com>
 <20230413164916.4221-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20230413164916.4221-5-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|CH0PR11MB5561:EE_
x-ms-office365-filtering-correlation-id: b8de8639-294d-44e4-170e-08db5d62c9ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oigj+18Vps70pbMF8kqCFm8wR3nUUigT1eYbnk1K6XrBeWx9rM5ygf2029pU/Wi0rRt82j6mAihrsGHMubYQAFPXDkAZcwiD0TlNqBpFk2EIgx+tDSf2ed5MmIngWl7VTKCakby09XG3izfNHWDiMTJ0GtgeB1syRJS33towHD4gd0Vf3ea3BFW3FodSZfy9Xj/d34jRLfxKdDrfaX0ZoLqkwiY6Y14ky/pA+PF+ZWG0OWxrpdlYsdnsMUIOJQSbbogfxa6TuiLqC51CXdPhnc2Bmx4i5kPeNC9E1d2yc25CvqT/2fNQD3qGbhtKOAz02HjoXZZatf8/XSySoVIH3vRIGoklLsn+8EXMCiediZOcz603sskYHXebT4aEV/dBdcBV1OPBnWylAsQfp0f4fFAyQ5KZ/SJwMuDtAaBpeqCUM3nCXVEZTCAtGEsj/VIV9syme2sScR845cxgd64IoQ63DxJTdAq94lrQigcWPkymraS1sHiGAdwLQZoTR2g0g30TIIsidZPqYE1s1KLQoGz6ZAs0WlHCgLo5KL0asDFkE2PAhQWwHCG1vATyVQN4/xndj00E4zq6LGMZAMHi3YBIN33EjN2ge7RbByg+AFNOXXTL8ou79PcMdQpbX2ex
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199021)(33656002)(2906002)(5660300002)(52536014)(122000001)(53546011)(186003)(6506007)(26005)(82960400001)(86362001)(38070700005)(83380400001)(38100700002)(9686003)(8676002)(4326008)(76116006)(478600001)(71200400001)(316002)(7696005)(8936002)(55016003)(66946007)(66476007)(41300700001)(66556008)(66446008)(64756008)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVMxQ3NQN2RtZlJjaytRNnVhNHFvNElwQjgzR0hLT3RTOFQxcktwOGpGd0Z0?=
 =?utf-8?B?eng0a0RLSGVkVkpyR2ZrZlhINlYyLzljdjNJS0lodXZmYkFrakVXeUo3K096?=
 =?utf-8?B?MHRLWDdkb1pOMndQcTJqUlJiOExjeDFTT0lSZXNKTDZVUWVyeHN3TlU2YTZr?=
 =?utf-8?B?ZitWc3JFSVhQdS9jT1NKaWVXQTdQanNkbHdkdnpVOU9aNS9jRHhha1gwVDRt?=
 =?utf-8?B?cmVaWTdCQ1NlQUhRVU5naHlnUGRHOVNBYjhRWmRoNFVlVjZSOWpTOVZtaGxT?=
 =?utf-8?B?ejBzQk1WT2liTkxRRThRT1F6bkNVbEhKbGhja3g1RUFzRDdlTkJBVG9lOTJw?=
 =?utf-8?B?dG9sVC9idmxFWllBb2FvREZVNVNMNHkwZDQ4NU95bnJqNkJmeGY1Z1JqaTlV?=
 =?utf-8?B?V3loZlZwQVY4TUt4cGVqSFZ6eE8zc2xvMzN0NEFBZkZ0RythN29qWVZoRmh6?=
 =?utf-8?B?TnJPMHc5eWhoSFp0MU04bUE4M0FxYUNNeFBYZVAzdkVCWDZqU0M4bVZZYnRu?=
 =?utf-8?B?STJ6OXdQWmNDWVNqQk90MXRGS2xjTTFzRk16KzdrNC9qOTZScitaeko4S1ND?=
 =?utf-8?B?bnc4bzNUcEhmYjBUaTZ0b21Sa05rNmttT2xmRU1jOFUzQnFtSjNrckRRRkIy?=
 =?utf-8?B?VHhNRGR2Yzd4UmprdE1wNkVwMHkyd1VQT09PR0ZNcTFXbmJLSkZyUHFEQ0tG?=
 =?utf-8?B?MzB0NEppZVNnQ1dvYVVkeGZLekJlZmRvL3NYVTRQWHNpTFJ1SXRFSWFWWlk2?=
 =?utf-8?B?SnhDK1JneW84SHpQdlY2Wm16cnJZRnNKdC90c2JUUHJHZnRUWVRMaDc4eU8y?=
 =?utf-8?B?NlBlNlNySXNlcGwzOVVFRnVxK1NkWm1mZkhMSFVIUWxRV2lpbnMwajBDTE9i?=
 =?utf-8?B?ck1uSGkxQnc4R1lwMTRITW1XNXAxZ25zbE5Wc0FyZStBTTdzaVcxajdLNEox?=
 =?utf-8?B?V3RSNDFQcldXdlpTWDZBM3Q0bCtXWTFTNVZvekVlOGlwdXZnZm9zMlNLdkpq?=
 =?utf-8?B?U1NLeGJ5L3lxekx1QjljMmtyUWYwZWh6aG9UeGlyb2NiaytjNG9wT1BraG9z?=
 =?utf-8?B?RTVMaEIrWFZvRjloQXN6RW9Dak1FRDhrTlZ5dHlia1hUL1lnZE9PaWx5WFAv?=
 =?utf-8?B?MlBSbE5SWWRQeDl3NlV6aUVRZjBDZkF2Nm5zREZvakdGcGhkRjBQS0pVR2tE?=
 =?utf-8?B?V0tVNDVseXNJS21Zb1poOXRIeEtKcS9vNm1BZUx1TWUzcGE4aXd5QzBYYkpG?=
 =?utf-8?B?TVp4MXUyeGRWV0JrSXV2RTg5bUJMR25Fa1RLa3lVTnhleEJESFZkallQR0pu?=
 =?utf-8?B?VUdtdkdBNHhvSERkb1pLMDB1T0FidkRZZmJOeTFFZGM0emxyYlJNVnJybDJZ?=
 =?utf-8?B?UTZxb1hrOWJXQUQ2QTRRR2t5M0E1YlpxOUtIMDlUVFd5dXJncGhlVHhxYW9U?=
 =?utf-8?B?R0UzOWhZWTFvNGNuaFh5Qm9qeUpEVXEzaWhoSHNzR3ZLUkdDUWJVWlBmZlBp?=
 =?utf-8?B?NUdKdzdmQ242MmpuY2pIZmtTQURnWFlJVS9OdkR3UXdFaUl4NFAxT3QzVndJ?=
 =?utf-8?B?dmpIbUhGdXZ3emNUQTRDTktKOGhFNUVVSzNwVlJsaGMxY01UNDMyNUl1Ykw4?=
 =?utf-8?B?eExOdHF5eC9Jeno3dEdmN2czYVA4RU9QUytZNU5laUJUQ1ZiQ1dBcDg0RGx5?=
 =?utf-8?B?MncrZGV2eWtzRllxWVRucW1pY1IzT1R1em5WTjVGWE82Ui9pRGhEVG5uUFZW?=
 =?utf-8?B?L3lDUFVGdWNUVGpic25ERlBKK3pMKzk4Yjh1TVkyeEliTXFlVUo3TGFoUDhy?=
 =?utf-8?B?amJHcmtjUk0xaW8wUmhTYllaeHpTQXgycnFlVkZsZWRYWDdKRjRxUWg5dDN4?=
 =?utf-8?B?N3BJbzQrVm4rTmtRS01uSGhscXAxY0k2VEl4N0NEajZUMXVHRCtSSDd3enhL?=
 =?utf-8?B?V3NPN0p2RHI5VUI5ZlJORlRZczdqemorR3pIQ0h2bWthWmFpY3g5S1hleEgr?=
 =?utf-8?B?WDFpeGtVV0hCcW9yVkhET1FjODBVb2szMVlLdEFRUUxnQnZSbXQ3L0oxRUxq?=
 =?utf-8?B?L0ZYS2xrVk52SDdqRkJxM1grWjhNenJxOU1wTnpZSDBRZ2R4UGpxa2lhM2ZB?=
 =?utf-8?Q?SjLOFTxQgVXiBmIxQ687SATSR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8de8639-294d-44e4-170e-08db5d62c9ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2023 20:58:27.4480 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MJV7pOazV3cq5U2fkq71fTaTodEOpZzOg7ntWWcrAch1DN5bJ9ieoehCXVuPO6aKCFpFRfIje+btF0sfbYDZqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5561
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRl
bC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBWaWxsZSBT
eXJqYWxhDQo+IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCAxMywgMjAyMyAxMDoxOSBQTQ0KPiBUbzog
aW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBbSW50ZWwtZ2Z4XSBbUEFUQ0ggdjIgNC83XSBkcm0v
aTkxNTogQWx3YXlzIGVuYWJsZSBDR00gQ1NDIG9uIENIVg0KPiANCj4gRnJvbTogVmlsbGUgU3ly
asOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gDQo+IE9uIENIViB0b2dn
bGluZyB0aGUgQ0dNIENTQyBvbi9vZmYgd2hpbGUgdGhlIHBpcGUgaXMgcnVubmluZyBsZWFkcyB0
byB1bmRlcnJ1bnMuDQo+IExvb2tzIGxpa2Ugd2UnZCBoYXZlIHRvIGRvIHRoZSB0b2dnbGluZyBz
dHJpY3RseSBpbnNpZGUgdGhlIHN0YXJ0X29mX3ZibGFuay0NCj4gZnJhbWVfc3RhcnQgd2luZG93
IHRvIGF2b2lkIHRoaXMsIGJ1dCB0aGF0IHdpbmRvdyBpcyBsZXNzIHRoYW4gYSBzY2FubGluZSBz
byB0aGVyZSdzDQo+IG5vIHdheSB3ZSBjYW4gZ3VhcmFudGVlIGhpdHRpbmcgaXQuDQo+IA0KPiBB
cyBhIHdvcmthcm91bmQgbGV0J3MganVzdCBsZWF2ZSB0aGUgQ0dNIENTQyBwZXJtYW5lbnRseSBl
bmFibGVkLg0KPiBGb3J0dW5hdGVseSB0aGUgQ0dNIGdhbW1hL2RlZ2FtbWEgdW5pdHMgZG9uJ3Qg
c2VlbSB0byBzdWZmZXIgZnJvbSB0aGlzIG1hbGFkeS4NCj4gDQo+IEkgYWxzbyB0cmllZCB0dXJu
aW5nIG9mZiBDR00gdW5pdCBjbG9jayBnYXRpbmcsIGJ1dCB0aGF0IGRpZCBub3QgaGVscC4NCg0K
TG9va3MgR29vZCB0byBtZS4NClJldmlld2VkLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJA
aW50ZWwuY29tPg0KDQo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9jb2xvci5jIHwgMjEgKysrKysrKysrKysrKysrKysrKy0tDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMNCj4gYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMNCj4gaW5kZXggNjMxNDFmNGVk
MzcyLi43YTcwNWU3ZDg3NzYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfY29sb3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2NvbG9yLmMNCj4gQEAgLTYwNSw2ICs2MDUsMTYgQEAgc3RhdGljIHZvaWQgY2h2X2Nn
bV9jc2NfY29udmVydF9jdG0oY29uc3Qgc3RydWN0DQo+IGludGVsX2NydGNfc3RhdGUgKmNydGNf
c3RhdGUsDQo+ICAJCWNzYy0+Y29lZmZbaV0gPSBjdG1fdG9fdHdvc19jb21wbGVtZW50KGN0bS0+
bWF0cml4W2ldLCA0LCAxMik7ICB9DQo+IA0KPiArI2RlZmluZSBDSFZfQ0dNX0NTQ19DT0VGRl8x
XzAgKDEgPDwgMTIpDQo+ICsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaW50ZWxfY3NjX21hdHJp
eCBjaHZfY2dtX2NzY19tYXRyaXhfaWRlbnRpdHkgPSB7DQo+ICsJLmNvZWZmID0gew0KPiArCQlD
SFZfQ0dNX0NTQ19DT0VGRl8xXzAsIDAsIDAsDQo+ICsJCTAsIENIVl9DR01fQ1NDX0NPRUZGXzFf
MCwgMCwNCj4gKwkJMCwgMCwgQ0hWX0NHTV9DU0NfQ09FRkZfMV8wLA0KPiArCX0sDQo+ICt9Ow0K
PiArDQo+ICBzdGF0aWMgdm9pZCBjaHZfbG9hZF9jZ21fY3NjKHN0cnVjdCBpbnRlbF9jcnRjICpj
cnRjLA0KPiAgCQkJICAgICBjb25zdCBzdHJ1Y3QgaW50ZWxfY3NjX21hdHJpeCAqY3NjKSAgeyBA
QCAtNjY3LDkgKzY3Nyw5DQo+IEBAIHN0YXRpYyB2b2lkIGNodl9hc3NpZ25fY3NjKHN0cnVjdCBp
bnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKQ0KPiANCj4gIAkJY2h2X2NnbV9jc2NfY29udmVy
dF9jdG0oY3J0Y19zdGF0ZSwgJmNydGNfc3RhdGUtPmNzYyk7DQo+ICAJfSBlbHNlIHsNCj4gLQkJ
ZHJtX1dBUk5fT04oJmk5MTUtPmRybSwgKGNydGNfc3RhdGUtPmNnbV9tb2RlICYNCj4gQ0dNX1BJ
UEVfTU9ERV9DU0MpICE9IDApOw0KPiArCQlkcm1fV0FSTl9PTigmaTkxNS0+ZHJtLCAoY3J0Y19z
dGF0ZS0+Y2dtX21vZGUgJg0KPiBDR01fUElQRV9NT0RFX0NTQykgPT0NCj4gKzApOw0KPiANCj4g
LQkJaW50ZWxfY3NjX2NsZWFyKCZjcnRjX3N0YXRlLT5jc2MpOw0KPiArCQljcnRjX3N0YXRlLT5j
c2MgPSBjaHZfY2dtX2NzY19tYXRyaXhfaWRlbnRpdHk7DQo+ICAJfQ0KPiAgfQ0KPiANCj4gQEAg
LTIwMzMsNiArMjA0MywxMyBAQCBzdGF0aWMgdTMyIGNodl9jZ21fbW9kZShjb25zdCBzdHJ1Y3Qg
aW50ZWxfY3J0Y19zdGF0ZQ0KPiAqY3J0Y19zdGF0ZSkNCj4gIAkgICAgIWx1dF9pc19sZWdhY3ko
Y3J0Y19zdGF0ZS0+aHcuZ2FtbWFfbHV0KSkNCj4gIAkJY2dtX21vZGUgfD0gQ0dNX1BJUEVfTU9E
RV9HQU1NQTsNCj4gDQo+ICsJLyoNCj4gKwkgKiBUb2dnbGluZyB0aGUgQ0dNIENTQyBvbi9vZmYg
b3V0c2lkZSBvZiB0aGUgdGlueSB3aW5kb3cNCj4gKwkgKiBiZXR3ZWVuIHN0YXJ0IG9mIHZibGFu
ayBhbmQgZnJhbWUgc3RhcnQgY2F1c2VzIHVuZGVycnVucy4NCj4gKwkgKiBBbHdheXMgZW5hYmxl
IHRoZSBDR00gQ1NDIGFzIGEgd29ya2Fyb3VuZC4NCj4gKwkgKi8NCj4gKwljZ21fbW9kZSB8PSBD
R01fUElQRV9NT0RFX0NTQzsNCj4gKw0KPiAgCXJldHVybiBjZ21fbW9kZTsNCj4gIH0NCj4gDQo+
IC0tDQo+IDIuMzkuMg0KDQo=
