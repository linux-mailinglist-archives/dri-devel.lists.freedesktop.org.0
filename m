Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 379438530FD
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 13:56:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEA010E02C;
	Tue, 13 Feb 2024 12:56:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FhhLc3Kv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1BE10E02C;
 Tue, 13 Feb 2024 12:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707828974; x=1739364974;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4cb0HXo0cVMo34bkztgMIYQWbtDXzcyqe3KUuvbdhsA=;
 b=FhhLc3Kvtdt6VHneNGP5/UggkIDNj4rNd57vqKzzhWxAkSqBD6bLJezs
 egRVKWktwdFR2reV4icfPji8qqWCA59wdYagDZvAhtarqeXWIyW7rwEcZ
 mz8VGOyP71+PH4rlpIMre6hLfH94vkS3rMQ1SyL+Ic6RdldGNSla5gOaJ
 vF6hCTCBr7jWwVrbMZc4G9NCgromuRAzUyMLIVCJWTWvK3PKZUCq77wck
 oulUOz1nkqedD694kMX3IYlfdmJcdxLp4NASgMrNWVW0oa5Okf96NeMRG
 /6WB2RStBYF96QNrRVVa3I9pV0XwwifIzyfVWg2Y0z7gp8FAOuNVC4l8e g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="24304978"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; d="scan'208";a="24304978"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 04:56:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; d="scan'208";a="26056522"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2024 04:56:12 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 04:56:11 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 04:56:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 13 Feb 2024 04:56:10 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 13 Feb 2024 04:56:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NCYQqrwNAwYOTBcPFqx02PQqboig6Ny3is79E1Q75oRiRBB2IlYnVEx+U8QE/g5n+6Gn2eEowLH3vICHIJa6bQoG0Y6thnwpagKmCg1eRUyawFeQGeXVBP2wCg3EZ/bRJs3cE+TTBVw0NVKTC8e6+YUEnN+9GOtbY/AfLZ644RUcA2yjzBuG3Wg4ebi5CsoImd263RmcoK76Srs2nERzNSBBTwvbkorkKoBeW6EIkDfJTTytczD0aZfw/ikfLj93WemeOiuEH6z2V1Y3GYyZoezTtysB5N/E+KQuG1n4kQCdpkYrlEVE/Bqb3B729K0h7Aqxh9ALi34dN0z9stJyjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cb0HXo0cVMo34bkztgMIYQWbtDXzcyqe3KUuvbdhsA=;
 b=GRRIJpjn8afsmMhg4MyLU6xHiX2IGBXdshpduiQ/qM0rHdEPAeS3vVWmaN48BmBQMX8vV+IPz3IYbIy+oicyvQ/zJ4szbgj+0Pw4NiScTm6CtTWBElT9CEvWrB02i0xcqInfTtfY6UoV8ZuFgS56u0fXyMfBcULH6dvG3j1mGyibfDq78HoI/1OrHsXVyCd7o54OQlPo7BMen8FFxEyozIFF9NPI9BAtMa/s9+9juOhZLDPuhm891BGLg90zQl0Z5a37Z3bUBdOTtsng77jylAaMTpGlEJf0Os1HNnWFrM4PmvZf2oIc+VA0hTjQNsV9RZjmt/CjL0TZySy3lC7b4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DS0PR11MB6496.namprd11.prod.outlook.com (2603:10b6:8:c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38; Tue, 13 Feb
 2024 12:56:09 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::34a4:c9b4:7991:39b5]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::34a4:c9b4:7991:39b5%4]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 12:56:08 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH v2 1/6] drm/mst: read sideband messaging cap
Thread-Topic: [PATCH v2 1/6] drm/mst: read sideband messaging cap
Thread-Index: AQHaXnAq7gccbqHs9kWkf4qrZDKzarEIOWVw
Date: Tue, 13 Feb 2024 12:56:08 +0000
Message-ID: <IA0PR11MB7307E7130A93748F85E2CBB8BA4F2@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <cover.1707823736.git.jani.nikula@intel.com>
 <507901114b7e4f0e4149747c8052747a22fe8ead.1707823736.git.jani.nikula@intel.com>
In-Reply-To: <507901114b7e4f0e4149747c8052747a22fe8ead.1707823736.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DS0PR11MB6496:EE_
x-ms-office365-filtering-correlation-id: 15c10fd5-8daa-4f28-9333-08dc2c9325d6
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nm5GinQnN1rFg7hwgrpp1VeCt7WFIkig4DLgdHFu66ZpcsJoHXz/KyShefmSDAvP9Dx4UKKBe4DZxe1j40qLrjcUZhUGbxr+tKsHTE2TlIi5cKNmoCqg2eQhJ3lBrgoRkqDwE2EL6VIwHhcjZsMz3qQ2WcU9jIzMf240hOHQrqooR8MyZo/phjImM6t7OS0Ogm5EQ7i7CP+uUqbsDGyI6u5tDW9no+Kmobi3wns6NZzmjdUyj97C8po6hhM/PXmhJ+OWQVD19kSO7bw8iNL1zfmblNDRhv/I2XpFXvWgC0lyneGLO13HlLTkL7w+9Ttkw2I/UxRqAReMxqbN1BOK/tk3ypoU+xXNPzx608PD+F6BLyw1cI/47oJnZHIWotXOp5rV7P16/Axx+VXfAa0Kwh9fiNbk8T44VrmWHhCbtXVyMaNTiJZty90m1sE/CB0LtTnCEjDdIgZczB5mAtLmV1NYCBCm2LVgfLyOS0/5gYURER9rwT+JPrXlzmyHZ2gNjiPpUctcmzriV9xRxDwl+brSCxK+irY53k/f6cNnASzBykGnoOJZWwJaqFZOWbFi0Dg/sZzBb+em2T7kANWf4iFHDW47tmEBBtubPyIpu+aYxC6FuUBXlcPomqKFil4v
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(82960400001)(83380400001)(86362001)(316002)(478600001)(6506007)(54906003)(122000001)(66446008)(66556008)(26005)(66946007)(9686003)(53546011)(66476007)(7696005)(71200400001)(33656002)(66574015)(64756008)(76116006)(110136005)(38070700009)(38100700002)(4326008)(52536014)(55016003)(8936002)(2906002)(5660300002)(8676002)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0ZSRzJxaXVLcnJoVnZXYy9udVNOSUsyeS9Wb0RwaHVCSHlkMDdZbVJIMCty?=
 =?utf-8?B?V09qMGZrTTljNjJBTldpbkcraytEb0dIdkRsMDFoa0hzUDRxVGZFcERtUDNr?=
 =?utf-8?B?SFVmUDVoRG5rSXMyUFlRN2daUkxuNjdnYmxMN0tGTEtsa0FPRHR4VlhqMmkw?=
 =?utf-8?B?UnJobjJLM1JDSGZrSXJNc3NMWUJ6MWtxa29WWk52MmV3bDd0WjNFVGZlOE1a?=
 =?utf-8?B?MTZxYXE4VnY0d096YkNDZE45QjQrak9OdVladjUrbnQyVDdBcGNITG5Camph?=
 =?utf-8?B?cWNBZVJLV2xBUVl4UUhxYXlpckJJUWh2Z1QyQUprT1k4OE53VE5uYzRlSnJQ?=
 =?utf-8?B?b2owRjNYREhkYm5rc2JHeXZWN0Q4dGJQRE5HRzgxZlR5VkdXR1laOURFcE9Y?=
 =?utf-8?B?N3A4SmYrY1ZsZHVFTkl2NEV6MzB3bmM2eFljQ0h2RVJWK2w0eXBxd2NaTVRD?=
 =?utf-8?B?WjBEcGxXWWFTTjI1TG9wR1lJeUM5dWRzS0ZWVFNDNWpFZWRkR1grNk5FQk80?=
 =?utf-8?B?SmVTK3YxRGRTTjMxSENZVGl3YXM4Y2FNc2F6b09PTU5IT1ovVnMwMys2RTVi?=
 =?utf-8?B?clkwSGZQT2RoWjgvaWNiekZ1cEgyVzlGYkR1YkRMbVQ2ci8vUG9sOGlvakt2?=
 =?utf-8?B?UEEvRjRscGwyNFQ5TklxY0ZOOE53N3pUR0dlTFNkdmJqZiszbVNYdHRtQkpH?=
 =?utf-8?B?NGo1dGcvZ0pLenB6VThxWTh1Y1U0SHpKeHlSbyswYXBTUFhhOHlGZVdVNFRp?=
 =?utf-8?B?RFBPcmdOWFRmTjcrQkI5aUJ4VlpKZGJLbnMwOXplSjNuZmVqU2YvamZibzBi?=
 =?utf-8?B?b0lrV0dDM0djTm5EeWRLN2UvZlNIbEhZbXBjUG5BZEJYL2lBaFplT0lzUkF0?=
 =?utf-8?B?a1IyYlg0eXFUOGEwVDlnZ242VnlIMnBxbThHNjFscTFMSStSa09KbUdGVDk0?=
 =?utf-8?B?SmhORkYzKzV1U1Ftc1hrQ0ZETzlhZWFhUHdQOHQvM1dwU0RvRjVoazBCTUpM?=
 =?utf-8?B?MFdpSGcvcE8yM09GZjZiaXA4bk54NXc5L3FHNGN5amEzYnBXK0tzSjFzVDdy?=
 =?utf-8?B?RXFkc0l1RHZnNlRzN0gyblVRcldaMzZDUEJxWVl4TkFUMkFzT3lpaGpwRXNT?=
 =?utf-8?B?OU9GVmVMOE1VcWhDcCtlK1FITFVaWHNMQXBZdmo3MkpwV1cxTHBxSGxHdXdD?=
 =?utf-8?B?eXcySVcwVW5FVE9JWUNwTnFJZUtsR2l5dGE1M3Rka1kyd052MVV1TU9Cc0VC?=
 =?utf-8?B?RTI3dHAvRTEzbUQzVlBkbGtmUDJwZXVxMDVpR2xrb2lQSkg1cElOaHNuaW5s?=
 =?utf-8?B?Mzgzd09LQkphelRoZlU1c1g2UlQvcEk3RWFIbGVsSTBFQTNWSmROZXRVZ2Mr?=
 =?utf-8?B?MnlXRHpsaGpTcXFhS1JIVzljZUJEUzFxZzM2YkdhTElSYzllM1ZEbTRQaXA0?=
 =?utf-8?B?ZFdlSm5IbXNQUzljMThmZ1k3dGRPMFJPWW4wR2k0cnppTDNlMkdIMlBFWUQ5?=
 =?utf-8?B?cFpoRzFSVDUxUVpXVTlVTGl2UG9yVHpSSnhJN1A4c1gxaVp6dGZqZ0NUMHds?=
 =?utf-8?B?Mjd0VjhNNkVoR3FZc0N3R2F5YnlrZWwyMXd3UGNiU3RET2ljZ1JLOFpsSTlE?=
 =?utf-8?B?WEx0Y3lMOXIzUDJTZGNMb21kdDRSSll3d2Nubjh1NldGN05qamNMRkFkZDFj?=
 =?utf-8?B?QVNSQlRRU1JwT0FPZjBWQ3JsQWQ2V01aUHJOWlV6TU1kOVQ1WG0xOFMyaE51?=
 =?utf-8?B?QTJWRi9hNW9PVHgzdUJpWHg1YlQ4MmVmanJOTXprS2lvMDk5RGRwZ3JVOHJD?=
 =?utf-8?B?cmJxRmh1MGRGdHRNRGlIcG1IK3FNUUVveENsVVBMZjhad3U4ZVp2azRIQ0ZQ?=
 =?utf-8?B?cks1QXd4bnVKamVPdmZPTFFGemhZMTA1U2ZxeDNWdzBoUllVUnorSzVoRVV1?=
 =?utf-8?B?UHFsM3B4NzRyb0pIK2JHelV6YlN0QXhGUkhxQVg5WFpCYW5FOUpiaXFyMXRB?=
 =?utf-8?B?SGpsT0JWdWZLSE04enEvNzJTNHNpY243eUhuUWdvb215Z3dGZUdJaHAwaTVX?=
 =?utf-8?B?UUMxalZmWHJaZzB0cmRkaUs4c2tIelA2cTdzeVVEQXpvS0dDSkkzSFp2SzNN?=
 =?utf-8?Q?LagDrcBCNxiDT9vK5iOI8xPHn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c10fd5-8daa-4f28-9333-08dc2c9325d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2024 12:56:08.5936 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Uyqh0n3887rmAEUxlxVxfHZgJ2fl45fFUsgBMkntX0ExksmoHMOVDCVo7aotpSNeVstgehpZjIgMu8+mxOyZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6496
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE5pa3VsYSwgSmFuaSA8amFu
aS5uaWt1bGFAaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAxMywgMjAyNCA1
OjAxIFBNDQo+IFRvOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IE5pa3VsYSwgSmFuaQ0KPiA8amFuaS5uaWt1bGFAaW50ZWwuY29tPjsgTXVydGh5LCBBcnVu
IFIgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPjsgVmlsbGUNCj4gU3lyasOkbMOkIDx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHYyIDEvNl0gZHJtL21z
dDogcmVhZCBzaWRlYmFuZCBtZXNzYWdpbmcgY2FwDQo+IA0KPiBBbWVuZCBkcm1fZHBfcmVhZF9t
c3RfY2FwKCkgdG8gcmV0dXJuIGFuIGVudW0sIGluZGljYXRpbmcgIlNTVCIsICJTU1Qgd2l0aA0K
PiBzaWRlYmFuZCBtZXNzYWdpbmciLCBvciAiTVNUIi4gTW9kaWZ5IGFsbCBjYWxsIHNpdGVzIHRv
IHRha2UgdGhlIG5ldyByZXR1cm4NCj4gdmFsdWUgaW50byBhY2NvdW50Lg0KPiANCj4gdjI6DQo+
IC0gUmVuYW1lIGVudW1lcmF0b3JzIChWaWxsZSkNCj4gDQo+IENjOiBBcnVuIFIgTXVydGh5IDxh
cnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5p
Lm5pa3VsYUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJt
X2RwX21zdF90b3BvbG9neS5jIHwgMjAgKysrKysrKysrKy0tLS0tLQ0KPiAgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jICAgICAgIHwgIDQgKystLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcC5jICAgICAgICAgIHwgIDIgKy0NCj4gIGluY2x1ZGUv
ZHJtL2Rpc3BsYXkvZHJtX2RwX21zdF9oZWxwZXIuaCAgICAgICB8IDIzICsrKysrKysrKysrKysr
KysrKy0NCj4gIDQgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX21z
dF90b3BvbG9neS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX21zdF90b3Bv
bG9neS5jDQo+IGluZGV4IDAzZDUyODIwOTQyNi4uYzE5M2JlMzU3N2Y3IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZGlzcGxheS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX21zdF90b3BvbG9neS5jDQo+IEBAIC0zNjA4
LDI0ICszNjA4LDMwIEBAIGZpeGVkMjBfMTIgZHJtX2RwX2dldF92Y19wYXlsb2FkX2J3KGNvbnN0
DQo+IHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLA0KPiBFWFBPUlRfU1lNQk9M
KGRybV9kcF9nZXRfdmNfcGF5bG9hZF9idyk7DQo+IA0KPiAgLyoqDQo+IC0gKiBkcm1fZHBfcmVh
ZF9tc3RfY2FwKCkgLSBjaGVjayB3aGV0aGVyIG9yIG5vdCBhIHNpbmsgc3VwcG9ydHMgTVNUDQo+
ICsgKiBkcm1fZHBfcmVhZF9tc3RfY2FwKCkgLSBSZWFkIHRoZSBzaW5rJ3MgTVNUIG1vZGUgY2Fw
YWJpbGl0eQ0KPiAgICogQGF1eDogVGhlIERQIEFVWCBjaGFubmVsIHRvIHVzZQ0KPiAgICogQGRw
Y2Q6IEEgY2FjaGVkIGNvcHkgb2YgdGhlIERQQ0QgY2FwYWJpbGl0aWVzIGZvciB0aGlzIHNpbmsN
Cj4gICAqDQo+IC0gKiBSZXR1cm5zOiAlVHJ1ZSBpZiB0aGUgc2luayBzdXBwb3J0cyBNU1QsICVm
YWxzZSBvdGhlcndpc2UNCj4gKyAqIFJldHVybnM6IGVudW0gZHJtX2RwX21zdF9tb2RlIHRvIGlu
ZGljYXRlIE1TVCBtb2RlIGNhcGFiaWxpdHkNCj4gICAqLw0KPiAtYm9vbCBkcm1fZHBfcmVhZF9t
c3RfY2FwKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsDQo+IC0JCQkgY29uc3QgdTggZHBjZFtEUF9S
RUNFSVZFUl9DQVBfU0laRV0pDQo+ICtlbnVtIGRybV9kcF9tc3RfbW9kZSBkcm1fZHBfcmVhZF9t
c3RfY2FwKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsDQo+ICsJCQkJCSBjb25zdCB1OA0KPiBkcGNk
W0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSkNCj4gIHsNCj4gIAl1OCBtc3RtX2NhcDsNCj4gDQo+ICAJ
aWYgKGRwY2RbRFBfRFBDRF9SRVZdIDwgRFBfRFBDRF9SRVZfMTIpDQo+IC0JCXJldHVybiBmYWxz
ZTsNCj4gKwkJcmV0dXJuIERSTV9EUF9TU1Q7DQo+IA0KPiAgCWlmIChkcm1fZHBfZHBjZF9yZWFk
YihhdXgsIERQX01TVE1fQ0FQLCAmbXN0bV9jYXApICE9IDEpDQo+IC0JCXJldHVybiBmYWxzZTsN
Cj4gKwkJcmV0dXJuIERSTV9EUF9TU1Q7DQo+ICsNCj4gKwlpZiAobXN0bV9jYXAgJiBEUF9NU1Rf
Q0FQKQ0KPiArCQlyZXR1cm4gRFJNX0RQX01TVDsNCj4gKw0KPiArCWlmIChtc3RtX2NhcCAmIERQ
X1NJTkdMRV9TVFJFQU1fU0lERUJBTkRfTVNHKQ0KPiArCQlyZXR1cm4gRFJNX0RQX1NTVF9TSURF
QkFORF9NU0c7DQpCaXRbMV0gb2YgTVNUTV9DQVAgaW5kaWNhdGVzIHNpZGViYW5kIG1lc3NhZ2lu
ZyBpcyBzdXBwb3J0ZWQgb3Igbm90IGFuZCBub3RoaW5nIHRvIGRvIHdpdGggTVNUL1NTVC4gU28g
d291bGQgaXQgbWFrZSBtb3JlIHNlbnNlIHRvIGhhdmUgaXQgYXMgRFJNX0RQX1NJREVCQU5EX01T
Rz8NCg0KVGhhbmtzIGFuZCBSZWdhcmRzLA0KQXJ1biBSIE11cnRoeQ0KLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCj4gDQo+IC0JcmV0dXJuIG1zdG1fY2FwICYgRFBfTVNUX0NBUDsNCj4gKwlyZXR1cm4g
RFJNX0RQX1NTVDsNCj4gIH0NCj4gIEVYUE9SVF9TWU1CT0woZHJtX2RwX3JlYWRfbXN0X2NhcCk7
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
cC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jDQo+IGluZGV4
IDUwNDVjMzRhMTZiZS4uYTFjMzA0ZjQ1MWJkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kcC5jDQo+IEBAIC00MDE0LDcgKzQwMTQsNyBAQCBpbnRlbF9kcF9jYW5f
bXN0KHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApDQo+IA0KPiAgCXJldHVybiBpOTE1LT5kaXNw
bGF5LnBhcmFtcy5lbmFibGVfZHBfbXN0ICYmDQo+ICAJCWludGVsX2RwX21zdF9zb3VyY2Vfc3Vw
cG9ydChpbnRlbF9kcCkgJiYNCj4gLQkJZHJtX2RwX3JlYWRfbXN0X2NhcCgmaW50ZWxfZHAtPmF1
eCwgaW50ZWxfZHAtPmRwY2QpOw0KPiArCQlkcm1fZHBfcmVhZF9tc3RfY2FwKCZpbnRlbF9kcC0+
YXV4LCBpbnRlbF9kcC0+ZHBjZCkgPT0NCj4gRFJNX0RQX01TVDsNCj4gIH0NCj4gDQo+ICBzdGF0
aWMgdm9pZA0KPiBAQCAtNDAyMyw3ICs0MDIzLDcgQEAgaW50ZWxfZHBfY29uZmlndXJlX21zdChz
dHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKQ0KPiAgCXN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpp
OTE1ID0gZHBfdG9faTkxNShpbnRlbF9kcCk7DQo+ICAJc3RydWN0IGludGVsX2VuY29kZXIgKmVu
Y29kZXIgPQ0KPiAgCQkmZHBfdG9fZGlnX3BvcnQoaW50ZWxfZHApLT5iYXNlOw0KPiAtCWJvb2wg
c2lua19jYW5fbXN0ID0gZHJtX2RwX3JlYWRfbXN0X2NhcCgmaW50ZWxfZHAtPmF1eCwgaW50ZWxf
ZHAtDQo+ID5kcGNkKTsNCj4gKwlib29sIHNpbmtfY2FuX21zdCA9IGRybV9kcF9yZWFkX21zdF9j
YXAoJmludGVsX2RwLT5hdXgsDQo+ICtpbnRlbF9kcC0+ZHBjZCkgPT0gRFJNX0RQX01TVDsNCj4g
DQo+ICAJZHJtX2RiZ19rbXMoJmk5MTUtPmRybSwNCj4gIAkJICAgICJbRU5DT0RFUjolZDolc10g
TVNUIHN1cHBvcnQ6IHBvcnQ6ICVzLCBzaW5rOiAlcywNCj4gbW9kcGFyYW06ICVzXG4iLCBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcC5jDQo+IGIvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcC5jDQo+IGluZGV4IDdkZTc3MDdlYzZhOC4uZmIw
NmVlMTdkOWU1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X2RwLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcC5jDQo+IEBA
IC0xODEsNyArMTgxLDcgQEAgbm91dmVhdV9kcF9wcm9iZV9kcGNkKHN0cnVjdCBub3V2ZWF1X2Nv
bm5lY3Rvcg0KPiAqbnZfY29ubmVjdG9yLA0KPiAgCWlmIChub3V2ZWF1X21zdCkgew0KPiAgCQlt
c3RtID0gb3V0cC0+ZHAubXN0bTsNCj4gIAkJaWYgKG1zdG0pDQo+IC0JCQltc3RtLT5jYW5fbXN0
ID0gZHJtX2RwX3JlYWRfbXN0X2NhcChhdXgsIGRwY2QpOw0KPiArCQkJbXN0bS0+Y2FuX21zdCA9
IGRybV9kcF9yZWFkX21zdF9jYXAoYXV4LCBkcGNkKQ0KPiA9PSBEUk1fRFBfTVNUOw0KPiAgCX0N
Cj4gDQo+ICAJaWYgKG5vdXZlYXVfZHBfaGFzX3NpbmtfY291bnQoY29ubmVjdG9yLCBvdXRwKSkg
eyBkaWZmIC0tZ2l0DQo+IGEvaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHBfbXN0X2hlbHBlci5o
DQo+IGIvaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHBfbXN0X2hlbHBlci5oDQo+IGluZGV4IDli
MTlkOGJkNTIwYS4uM2M5ZTEyOGM0NDRhIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9kaXNw
bGF5L2RybV9kcF9tc3RfaGVscGVyLmgNCj4gKysrIGIvaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1f
ZHBfbXN0X2hlbHBlci5oDQo+IEBAIC04MTgsNyArODE4LDI4IEBAIGludCBkcm1fZHBfbXN0X3Rv
cG9sb2d5X21ncl9pbml0KHN0cnVjdA0KPiBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLA0K
PiANCj4gIHZvaWQgZHJtX2RwX21zdF90b3BvbG9neV9tZ3JfZGVzdHJveShzdHJ1Y3QgZHJtX2Rw
X21zdF90b3BvbG9neV9tZ3INCj4gKm1ncik7DQo+IA0KPiAtYm9vbCBkcm1fZHBfcmVhZF9tc3Rf
Y2FwKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsIGNvbnN0IHU4DQo+IGRwY2RbRFBfUkVDRUlWRVJf
Q0FQX1NJWkVdKTsNCj4gKy8qKg0KPiArICogZW51bSBkcm1fZHBfbXN0X21vZGUgLSBzaW5rJ3Mg
TVNUIG1vZGUgY2FwYWJpbGl0eSAgKi8gZW51bQ0KPiArZHJtX2RwX21zdF9tb2RlIHsNCj4gKwkv
KioNCj4gKwkgKiBARFJNX0RQX1NTVDogVGhlIHNpbmsgZG9lcyBub3Qgc3VwcG9ydCBNU1Qgbm9y
IHNpbmdsZSBzdHJlYW0NCj4gc2lkZWJhbmQNCj4gKwkgKiBtZXNzYWdpbmcuDQo+ICsJICovDQo+
ICsJRFJNX0RQX1NTVCwNCj4gKwkvKioNCj4gKwkgKiBARFJNX0RQX01TVDogU2luayBzdXBwb3J0
cyBNU1QsIG1vcmUgdGhhbiBvbmUgc3RyZWFtIGFuZA0KPiBzaW5nbGUNCj4gKwkgKiBzdHJlYW0g
c2lkZWJhbmQgbWVzc2FnaW5nLg0KPiArCSAqLw0KPiArCURSTV9EUF9NU1QsDQo+ICsJLyoqDQo+
ICsJICogQERSTV9EUF9TU1RfU0lERUJBTkRfTVNHOiBTaW5rIHN1cHBvcnRzIG9ubHkgb25lIHN0
cmVhbSBhbmQNCj4gc2luZ2xlDQo+ICsJICogc3RyZWFtIHNpZGViYW5kIG1lc3NhZ2luZy4NCj4g
KwkgKi8NCj4gKwlEUk1fRFBfU1NUX1NJREVCQU5EX01TRywNCj4gK307DQo+ICsNCj4gK2VudW0g
ZHJtX2RwX21zdF9tb2RlIGRybV9kcF9yZWFkX21zdF9jYXAoc3RydWN0IGRybV9kcF9hdXggKmF1
eCwNCj4gY29uc3QNCj4gK3U4IGRwY2RbRFBfUkVDRUlWRVJfQ0FQX1NJWkVdKTsNCj4gIGludCBk
cm1fZHBfbXN0X3RvcG9sb2d5X21ncl9zZXRfbXN0KHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5
X21ncg0KPiAqbWdyLCBib29sIG1zdF9zdGF0ZSk7DQo+IA0KPiAgaW50IGRybV9kcF9tc3RfaHBk
X2lycV9oYW5kbGVfZXZlbnQoc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyDQo+ICptZ3Is
DQo+IC0tDQo+IDIuMzkuMg0KDQo=
