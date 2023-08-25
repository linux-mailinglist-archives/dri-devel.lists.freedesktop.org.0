Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD4E788EFE
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 20:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42E910E6E3;
	Fri, 25 Aug 2023 18:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D68E10E6DE;
 Fri, 25 Aug 2023 18:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692989707; x=1724525707;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=761wOV4GMcSoM0XMZGvlip7mVhP5XULnlwOeU5t8qPE=;
 b=RElJ3UMXsCWIQd1nW6+KeO4SqKfFkDdB62mSqv6CZgOZ9k5W11VkJfq7
 YXoZOtr4qitC4mU8TsWi51/SKj9a7B+l6NZAwygxfhjLTLsF9Ygjz2y8+
 FxJFcWyPywwEysSz7cfF+aKrM8mBC4OHJ+J54qyVNWusScTTqK/vlvZj6
 f1uBEpEsIqBbj0Cjb/+fKZaySY8JxOKoT33yymwTCdjJKDtbu0kWr3XXv
 IqQ7mu8C2snNsYczUvYjUsoMZofnjshG1lCbwdOrnYdm1pUypvCF5w/0b
 C2G6r5IomB6gxBPj0Mk2laNsbJ4f1rYuO8VWwrVtwAysFtIZmorJ5mkmG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="461143974"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; d="scan'208";a="461143974"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 11:55:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="772580658"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; d="scan'208";a="772580658"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 25 Aug 2023 11:55:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 25 Aug 2023 11:55:05 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 25 Aug 2023 11:55:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 25 Aug 2023 11:55:05 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 25 Aug 2023 11:55:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DoZmr+o7x/8Q3M0sovEGEYzz6shn0wLsXglC+hiKjm9ZpljFjenjBIuzR/ez9K922iINuiXf3X5D+PuRtIE0gEM3BnGrl/QrS/5aPSX1owRZWBlVUKXjWWx4wfhshWVfZOOvkZC99rBz3L9k3jeqiik4n3UR2yAH5HztBHzRSTeTzkrAKEOVvJTjZcR/8Blh3wDxe0c6z21eNQytD1jHBFwx6ON1RTs4GX68PiisUvyDxdEQKDLMiPcD6Nlw1ommKpt+DVV/KNeAandk8/vfvkBz/LyEuLCeKwzJOZE7HrGqZdQDMuR4szjkHRx1kDJLFRkKPzQWVE6bSJfU79EnoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=761wOV4GMcSoM0XMZGvlip7mVhP5XULnlwOeU5t8qPE=;
 b=O3aRhOvOaK2CNniCQShDdJ83XA21vE/eCe78m3/xvIYd5cdWtLkSX1kdNSPY41qvw8zTZ5vnZ/VefImDR6Roj1/bpQOfINQkFRvfNxMJXHPhHm7IApkEmgIU+FWZvynAvUeuki7FYTkE/rjwkqOhoVuY6FN/Xi/iLu1I1IYraiwN/ScxcxaVLw8bqOxjI8fkXUsqrdtcbq7+6uccApyqqcCVeXoWAKRM/wtfUiumwWk7BnVlykPocUr+7YLzBnZ1rPbBI5t2Zb+j/axFIY+PeNYmBcJDWJYoVXvmokacjIIywyNojO5A/Dd2O8TsSbxZ1KWTgv6hsS2NlMkR2bGP7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SA2PR11MB4891.namprd11.prod.outlook.com (2603:10b6:806:11e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 18:54:58 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 18:54:58 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 2/3] drm/i915/guc: Close deregister-context race
 against CT-loss
Thread-Topic: [PATCH v2 2/3] drm/i915/guc: Close deregister-context race
 against CT-loss
Thread-Index: AQHZzxWOM6RDYlL2zU2EXxVkEb9vJ6/rYksAgABXNoCAD7ObAA==
Date: Fri, 25 Aug 2023 18:54:58 +0000
Message-ID: <423d81f9849c589bceedbcd383570aa42bc8c6c9.camel@intel.com>
References: <20230815011210.1188379-1-alan.previn.teres.alexis@intel.com>
 <20230815011210.1188379-3-alan.previn.teres.alexis@intel.com>
 <ZNuD9JdmoYhYJ+G5@intel.com>
 <c890d7338f2c30818d313b34a02eee1ba0842261.camel@intel.com>
In-Reply-To: <c890d7338f2c30818d313b34a02eee1ba0842261.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SA2PR11MB4891:EE_
x-ms-office365-filtering-correlation-id: 228febd6-0cd5-4cf3-5522-08dba59cc77c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q9e9AuEP91xBB+Lv2J+3ZEFM4+dBRK2auengMkilVzgwggtpmXcv/oWWdh5fFvjwnv3OMcD4eq4s46996AWe9g6wHiHxVflw4Xj+fLMVKggH/PT/mw+oxI+kRzPrH81yOtMoEUHW2qsCZdmnPR4N52wi92jlBDXupYUMl8Nn4H7egJ9FhOZiEmu2mpP0UU6DRjFDjMtcvS/F4slixj6zZJW7y/OPuWDUeiZk8V+fdSSjFN5HKW4RFCppW/fPPuz+MOWKHwrQXhsjB664gqIlgiTrnAGa0CkwsegXAPsnCfzUfkfY9D22v+2B+AwcWPn6CqZYAr2wpfnHcrdZhkBmeyAEea5SnLgxirpsQobpQUcofOgdmy8KJNXXqA0fpGv5OaRz2fTb+dkv10mASgKKh4/kAhFpVsQXArwsoxsMI4UJTsegnksdieKGQyF4SZKWQc0q0yBiaOGsWEH88cRULnRrCTzf7OygbDpMTAWGcX3Xmv734a41X9DHcJWB0Z3qZvcjXjZzilZAL8+2N/vDYLaYej0JhZTyCG7OcYmY9RJNlb7akL4E9feP25N5jdZSs1EIFLEboZXpPnTS5uC4cFJV6XNO9ZyKwRnGSm5IoZI3dKeJAHZmIwo7gK1duEJf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(136003)(396003)(376002)(186009)(451199024)(1800799009)(66446008)(54906003)(66476007)(64756008)(37006003)(66946007)(66556008)(76116006)(316002)(6636002)(82960400001)(122000001)(478600001)(91956017)(26005)(38070700005)(38100700002)(71200400001)(41300700001)(86362001)(6486002)(6506007)(6512007)(2906002)(4744005)(4326008)(8676002)(450100002)(8936002)(83380400001)(2616005)(107886003)(6862004)(5660300002)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MkxnTm05TmwzaHJFSUVwRUVwc21kOGNjZ1g4N1VaRnRyZHhwV0ZJWUhZSEdy?=
 =?utf-8?B?Ym03bGFBSTVRUzFTVWFmWFQzN3MxV2l2QlBya0E3N3lTcm84dG9yVGxpbmxB?=
 =?utf-8?B?Q1luSGpGL2l5NE0rVnpKSmh2dCtMM2FoSmFBMzdCNjVxZzhzZE8wWXkvUUdG?=
 =?utf-8?B?NThFR0VxTDYxVU1UbHBXSlpkSllUU2Z5SURiQjVYY0tnK0tBN0tnUndDUStF?=
 =?utf-8?B?SDkwMkdGU2JJdXExYzdNVzBTbUpncFhaa3VIVnJQSE9XWHNsK24zUHRndDBx?=
 =?utf-8?B?b21oMDBXNk01OW83LzdPcWVoMVFmRVlxSHFKRlVkemlMT2FTVU1EbFcvMGEy?=
 =?utf-8?B?TTVOT3NSNUtObVRKaS82RllKWmdHUURvRWN6cXEvMU4veFlZM1M2Yml1VjVY?=
 =?utf-8?B?eWgrL05HU3RBTVl0U3cxTHd0OFRFK05UMW1ydUhFR1B0QllFbGtpTEhjeVpP?=
 =?utf-8?B?TXFTeUtKQWNMMk9lcUtYWVFBNjk0Q1dNT1NvREZOMGNxdDF5SlltSkVGdjZJ?=
 =?utf-8?B?NVo2MC8yUFZpWFZBREpNd2J3aHR1VUxaNWF4U0Q0Wnd3MVBzZTNienFRN1lm?=
 =?utf-8?B?b1U3Zm1ib1U2eHVIRzB0MFlpRm8wSnlsUDRLZ0p5Q2l1U3JXQnpNNElQNlZv?=
 =?utf-8?B?Zm41cXVKS080dGVmUmVpTnV4YWZNcTdsUVJvR0NjT1IrVGdmdy9JNGVPdjhS?=
 =?utf-8?B?OHQwdlJmWms3RVNkR2IvSmpsck5CenB2eEZvemc5SnRzeEdwMTJob3l3bjRh?=
 =?utf-8?B?NFNyTUlmMVg0ejdraUFqQkxnd21LbWlhQ0dGSHVmckYwZDhZZ0EwVWxUTHFp?=
 =?utf-8?B?cUJpL3ZZY29KTkpSRW9zU1R1Z2pPdXNaM1dZMStDVW11NnJwTHdYcjBJSWtU?=
 =?utf-8?B?dW1KT0tqTEY4T0ZWVGJHK3FQekJWbms2OEV4N2gzZThoak4wOWJvM0x5aXZr?=
 =?utf-8?B?YjhaRGYrL21SOG14U2JjNmkzOG0xY0V6NHpnVU03aUQ5YjZUSkg5YVVoVjNE?=
 =?utf-8?B?akRidS9GQW5aMWg3RTZyTndWTEV4OUMyWmtFYkE5QkdlenpZWFJjaXVCTjlI?=
 =?utf-8?B?U3o2b2lnVUcxaTRCUjJ0MnpWSHVZUWI2R3RnZ1NSYytVeWRQVHRKUHBUZWtW?=
 =?utf-8?B?bEZoTTRxMnFCdTJBVGRHYXlxeFVwQ08wOVJ6NUNMb1dGWTFWVzJtNjc3S2pG?=
 =?utf-8?B?K3V2Wm1Icnoyak5CUWVMbFdhazY4SjRqdVdMUjNlSTNUWHByN3hHOFczVWw0?=
 =?utf-8?B?UzRQdXNHeC83KzFKRy9BQTdZL1dLNExsZlpJcFVxT05UelVUQS80T2pnbjJm?=
 =?utf-8?B?d3Y1TVpZaFRzSXhrYnJjSU1pRTRDYms4dEZQcFdiclhvZ1Q2eEtkeXU2SDlU?=
 =?utf-8?B?THpKKzg0SjdBUWlpVGNlK3d3ZWdjZ0h6aFgwM09lcFFsU0ZVcTlLZVZQcC9i?=
 =?utf-8?B?VzlhVU5waHp1dFoyamxEb0ppQUVyQjRmZGxMZjBnNnZXbkFEMEJhaTJ1VFBC?=
 =?utf-8?B?SGE0cUd2ek5ZeUNva3FGeDBoNlAxVkc2aE5qMUJ3VktCTFdlK000ZFpSQlNl?=
 =?utf-8?B?aDlzN3RhR2dHekFHRHY5T3hIYUlGQ3JWeE9iVk5qcHdhcHRZUitOQzhFMFNR?=
 =?utf-8?B?SkFlWk9BTW5rRThXazlqZFdXMERwMUE2UG1zOG1FWVoxbG5VeDFDMFJaeC9X?=
 =?utf-8?B?SWk2ZXVtcjNSd0lwd1JjQk9xTjRDeHlmRFlLTk96N3BVQWdRQjV2ZHg1MEVw?=
 =?utf-8?B?TWxUbXNxbDkyUjA1TkxQR3NEMkEzSHREUUZGVXFtcW9RWVhkU0orOWF6d1R1?=
 =?utf-8?B?dXBvbGhGYU1sSmU2QVZXcGlpVTFTaTdVUFhEWjlFRTgyaVhqSWQ2bzZpWTVt?=
 =?utf-8?B?ckowOU8rT1VGZXptRFAvN0RveUYxK0k2S3dqTEFGSjJraXhaYjRqS2k3amxl?=
 =?utf-8?B?a2pvUjE5OW1NNG8zcndvRVp5bHg1enhLZmN6Vk9LU0hkenZtSlhRRzJaQkZL?=
 =?utf-8?B?eGxCOTJIT2lydE1OUWY3T0Fpa1dZZlRyYVcrOHJRN2RGdlY1NURlUlhSRzQ3?=
 =?utf-8?B?azlRWlVBQWVnblV4MEUxa1pkcTdZNGZpRUJsZUJBL1dxbXdRK0xTZm5NVFNR?=
 =?utf-8?B?NVAwbnV4ZTdjb0xNN1Y2VjdEQ3JNa0d3WDJBd3gwZjBVN2VCNysyOWlRandk?=
 =?utf-8?Q?OhUQgsaYuIF3skWHRc5bev8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2586F960904495478C294090D3416B4E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 228febd6-0cd5-4cf3-5522-08dba59cc77c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2023 18:54:58.2907 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 59pPjVnV7Cxzh8pLqvcirVzGIVDa2SE95CbboX2RY5JydD7rRhogD/cNCCAxpEtncTAVnR4bE9mbgqqCzqiHzxcnL9WpUfSWO2t7zGraPHlS9D56chBaligqogap/1tH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4891
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

anVzdCBhIGZvbGxvdyB1cCBub3RlLXRvLXNlbGY6DQoNCk9uIFR1ZSwgMjAyMy0wOC0xNSBhdCAx
MjowOCAtMDcwMCwgVGVyZXMgQWxleGlzLCBBbGFuIFByZXZpbiB3cm90ZToNCj4gT24gVHVlLCAy
MDIzLTA4LTE1IGF0IDA5OjU2IC0wNDAwLCBWaXZpLCBSb2RyaWdvIHdyb3RlOg0KPiA+IE9uIE1v
biwgQXVnIDE0LCAyMDIzIGF0IDA2OjEyOjA5UE0gLTA3MDAsIEFsYW4gUHJldmluIHdyb3RlOg0K
PiA+ID4gDQpbc25pcF0NCg0KaW4gZ3VjX3N1Ym1pc3Npb25fc2VuZF9idXN5X2xvb3AsIHdlIGFy
ZSBpbmNyZW1lbnRpbmcgdGhlIGZvbGxvd2luZw0KdGhhdCBuZWVkcyB0byBiZSBkZWNyZW1lbnRl
ZCBpZiB0aGUgZnVuY3Rpb24gZmFpbHMuDQoNCmF0b21pY19pbmMoJmd1Yy0+b3V0c3RhbmRpbmdf
c3VibWlzc2lvbl9nMmgpOw0KDQphbHNvLCBpdCBzZWVtcyB0aGF0IGV2ZW4gd2l0aCB0aGllIHVu
cm9sbCBkZXNpZ24gLSB3ZSBhcmUgc3RpbGwNCmxlYWtpbmcgYSB3YWtlcmVmIGVsc2V3aGVyZS4g
dGhpcyBpcyBkZXNwaXRlIGEgY2xlYW5lciByZWRlc2lnbiBvZg0KZmxvd3MgaW4gZnVuY3Rpb24g
Imd1Y19scmNfZGVzY191bnBpbiINCihkaXNjdXNzZWQgZWFybGllciB0aGF0IHdhc250IHZlcnkg
cmVhZGlibGUpLg0KDQp3aWxsIHJlLXJldiB0b2RheSBidXQgd2lsbCBwcm9iYWJseSBuZWVkIG1v
cmUgZm9sbG93IHVwcw0KdHJhY2tpbmcgdGhhdCBvbmUgbW9yZSBsZWFraW5nIGd0LXdha2VyZWYg
KG9uZSBpbiB0aG91c2FuZHMtY3ljbGVzKQ0KYnV0IGF0IGxlYXN0IG5vdyB3ZSBhcmUgbm90IGhh
bmdpbmcgbWlkLXN1c3BlbmQuLiB3ZSBiYWlsIGZyb20gc3VzcGVuZA0Kd2l0aCB1c2VmdWwga2Vy
bmVsIG1lc3NhZ2VzLg0KDQoNCg0KDQo=
