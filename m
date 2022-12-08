Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCD26474DC
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 18:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D3610E1C7;
	Thu,  8 Dec 2022 17:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0839F10E1C6;
 Thu,  8 Dec 2022 17:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670519323; x=1702055323;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=TdHcSGVS7t8SQm4lwBrOtm+zsC1c/zMqjLxv9pbe6js=;
 b=FaAd3misYbPjQG/+rpwj9X7yIAB6Yz4lGxkP9gd3U50AycGtCx8cc7aF
 /Ugh13pAXNv6V3MS9ZkY0nLg4E9LTLVRWLWac5XSVSUcZBJ1bi5CHdL8S
 9x44UwD8ijLNQ5YMbk0Y58QyLF/PELI2wMLX7+2cIB9jAU7u75bnkyvk6
 uo48h31OYfyprzn+S1f3JCsidrxr5H2h2pH4rEka8+6O+0BE8nPtQhy+h
 FENbXX8pFPlqFwDuSuJuiA1KFhlEEC6lST/wQXPovaPX7SwXwf2bc5EnV
 4xws6E7ZsFOkmfteeFJmYeokp729vU0vgqhTkqKVDOrAK4NMObf6iJnI3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="381541086"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="381541086"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 09:04:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="715682733"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="715682733"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 08 Dec 2022 09:04:51 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 8 Dec 2022 09:04:50 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 8 Dec 2022 09:04:50 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 8 Dec 2022 09:04:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmAjbxs4OmCkmTJJUq+HnjMQ7mXQ3rfP7ivwW+4TxD8qSnUTs4Go36kMkQOHMu4EA2i4gIaWgb8M84eJSBCxn37yAMze/j+5QcNgEVCo89OyhZJsQY0FN4Cll67vbTni2E1WVgiKMQsji6Ua9uZZtFbVRGgkieEhFXt19/lHsou6+tb7vTlyIbjUV8c7YP65flKE1U1J5sBCyvcj1+ewOfvQwxFEkQ8vi71SMHLGNXWhYnXKAABqwHFzy1R2pICWBi4LZBGEaIRoN2/yo3MZbu05tgmiln7bRYKxyhf8EbSBG9SDQ8dXAjMY6eyzdR1WQHG3AZU6FUga13hqyz6gPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdHcSGVS7t8SQm4lwBrOtm+zsC1c/zMqjLxv9pbe6js=;
 b=c4XugRAFzjWI4YeMX2uaXCkQos+8XFpHfFg0A8VCI90GJWiEtklJt28558Jy0Gg0pOG9En6UVGOZdQfSgEfXWP/HqhghOPuTVnDFjs3nBPpfoHbCPTYFTcW5II4XPU/8zUNwcI5GBEXH68tv1gpjoPpyrvuHHec4vebxOBewAvG2algnImR3uUaspIvf8gxfA0X04+f8iB0juzCdWbEqFoBdOTqQddCGJh0lCLCz0k7AIkKS/XdF8z9oEmoFp9RXASAuVFmhF5kHm33l8xtZqFF+2kZNnwww7bXynBtTyJWhLwus4pP3Q5cYZFR6pM6j/LzBG+oSBCHGWylXdkJqfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SA2PR11MB4858.namprd11.prod.outlook.com (2603:10b6:806:f9::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.14; Thu, 8 Dec 2022 17:04:48 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6%4]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 17:04:47 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v11 1/1] drm/i915/pxp: Promote pxp subsystem
 to top-level of i915
Thread-Topic: [Intel-gfx] [PATCH v11 1/1] drm/i915/pxp: Promote pxp subsystem
 to top-level of i915
Thread-Index: AQHZCsHFDTEBNrk3kUS47liEH71aLq5juY4AgACAE4A=
Date: Thu, 8 Dec 2022 17:04:47 +0000
Message-ID: <4c1ce3ccee3fbb708fa71e008991f4ca0ed0f6fb.camel@intel.com>
References: <20221208050136.950597-1-alan.previn.teres.alexis@intel.com>
 <24e4cf79-4807-6097-028c-a0f915221f53@linux.intel.com>
In-Reply-To: <24e4cf79-4807-6097-028c-a0f915221f53@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SA2PR11MB4858:EE_
x-ms-office365-filtering-correlation-id: 2fbd270f-a8cf-4c72-f6cc-08dad93e4fe8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5BIoT1qsXKGYsI0tzstVDJKZ2vqOZVgSuicTSEoG63brghMFrTux3UCYB1APD52fKJGbmQfhdwZEzSygRnoWwJRAqYG4V6oS15c8u9WYMAmeWyKW17c7LgJLeloNIjSrz86WF+GHHghp4z2DFdZhd3yu6y6wqdwg2V+ZfAcVEgSDUB9DxTG84ZzZAHWqVnqTrcB8Msz15fG7okK8U9PHrbhD8QxxcXupCzinnY+R4XFt3cKNy8oy5UuUprpyLK7weNdQb2XI75XMBzDe70B7OrNhFjsJvLZfdELqaH+CSj7EB5ehrq57d2Kf1UA28etluWy7vHmrZa5/5eAjYlirhio00PhA4ZYnvkWtqD+BCuQXrWZ6pkiIm4TAnpnwTkPrqwHiweJSC25dUJO46llhcpt2eWnfYWete1BprvpRi6O6vSJu1nRuhbM9LLKp7SDxC7rbVflwBjOxlbr6S1ItHFHUmVLxDMOsG+oYuV8hHXoCK7ibhQXliHED35n4Hd2wuuSlzSXmzyswmWdplQzS9thi8mLsPEkU3fzsfxYlBZSb1M4KPVpS65FNMFDW2mFHlp2ivRyyzf1x/N9gGsxQy+kvH+vRFn4xIJu+VwOIpdq1evziLHD1X/Ri15mOPzv75sEpzJEtJImUxOvFijb266yhmPqloRe4krc9Kg/Q6XElgl9dxYcOQOTFVQZhus6L
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(39860400002)(396003)(346002)(136003)(451199015)(4744005)(110136005)(76116006)(66556008)(66946007)(5660300002)(8936002)(54906003)(6506007)(91956017)(26005)(6512007)(186003)(478600001)(41300700001)(2906002)(36756003)(2616005)(4326008)(8676002)(53546011)(66446008)(71200400001)(82960400001)(6486002)(122000001)(66476007)(64756008)(38100700002)(38070700005)(316002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rk1rUFd2cUJVYnFJMUxVZXc2TjI5YSs0SGFnT3gvN1FVYXc1ZlZaZU54Tnda?=
 =?utf-8?B?Zyt3UVVYMStQV3NOUjBLbGZ3SVFrM0h3VDJkTVN6ZWwyZnNqRGxrTFRKRWQ1?=
 =?utf-8?B?NXV2TC9YZll4dmw1L3BlMk1wM0ZyMlliSWtJUFYyUkVIM2xqYndIbHBqWmlI?=
 =?utf-8?B?d3VCYVB4WFVyWGlIS1pSVFZyK0xrbWFLdSsxYy9ISXBOcmg3YTQrN2JRdDJm?=
 =?utf-8?B?b1pnM0c2bUEzbS8vMGEyNWl0bVFrUm55R2hSLy94TkcrVVp1dzN4VHBKRTE2?=
 =?utf-8?B?ZUdRNzVHdllxZmtSS25sYjJZRVJweC9BWjdLNHZmdm9IeHBBdVdVTjNTdmtN?=
 =?utf-8?B?SU5ZWGZEUHRiSGQyUS9vUGV0Q0l1Z09SamRMVXUxRmtzZ1pHeEZOaVNTSU1v?=
 =?utf-8?B?dHN0N1M0OHh6ZjBhM0ZEL0hjWkROUXRrRWxPYzZtTW9NbXlMMUd4dXA5ZWll?=
 =?utf-8?B?aVYvS0JqTzd5T3ptT0Q0ZXZ0VTFpRUYxUmlmNWcwS2JKQkh2RjI3aDZQdWdG?=
 =?utf-8?B?eDRuOVdQQVUwZmRDcXA0bm9ZRGl2Wkh4NlJSdlBJNFNKNXN6MFZsSjJlVHln?=
 =?utf-8?B?djBSU3pjenFRVm5FV3lScGRvcVo1VTIvWTA3cjZ5ckxiOVQwdmhpVGtMaW1Y?=
 =?utf-8?B?Y1pvbGpxa21hOG41Sy8zdzdMRmxXcHhSeDNxTDZQYmZrNnI3UmxYRVI5WWRZ?=
 =?utf-8?B?TGxobDl6LzZuOHRyamY4SUdKWXN6dzA0VVFvVFgvVWpBa3Y2YlBYVWdzMkht?=
 =?utf-8?B?R0pzYUVheGY3My92V2NWb3JzZmhOSzlxMjc2ZDN1WVptc2NqcE1Mc0Y2clJl?=
 =?utf-8?B?OU9TdTVIdmlmQ05zclNmWDgyQ05RMDVsVGpnWHZ1eUh6T1pnMWJYdHNmalR0?=
 =?utf-8?B?Umk5QVRkc25yRkdjWmRpVVdoS1pkUExXTnZvUFVaSXcwUWZtcSs2Rnp4Z0xm?=
 =?utf-8?B?NUltRndRZDEvSTVnR01SRUYwOVkzQWp4WEdzRkhYM3BndGR4MnQyTXVHUDRw?=
 =?utf-8?B?NUE5ZHdvdjV0WjdjckRadVJHTG9pYmhVNmhQSXhIeS8wSXdBOHZtVVd2Njl3?=
 =?utf-8?B?SVZiRDlBcHZvVTk4R2liczBWc2U4SzRjU2htTXZ3ZjNYYWo5aDB4S0hHamRu?=
 =?utf-8?B?UnRaUFpBMFdIRUlpODF5ZkdHeUdPK1ovSndyQ1M3UWZSREM3ZVNDU2RVcTBw?=
 =?utf-8?B?Z2R5UlZwSW41K3RTbnZGRVFOeWtTR3hLdEFrMDZBY2hsTVdFTk84OGxqSXNi?=
 =?utf-8?B?WGVuNCtaZHNvWndiRVBBZEdsTVdDcXlkSnh0aUJRb25OeTMveDhsS3RJSlpj?=
 =?utf-8?B?MDd4SExuWVlFVkh3YnBXSmZ0K3ZOcWRFWG5NOUd2cFBCdWFhQWFlaU4zS3Zw?=
 =?utf-8?B?Qk13VVY2V3AvSityL3kxOW5YSWgzV1YrRnZzbFVKa3o1cnFsMk42UXBkSmd5?=
 =?utf-8?B?R3MvRWN1QVhxZjc1VEVnRHVuTjZabHI1THNnV3N2RStSMHQzeGtIeVRINTlR?=
 =?utf-8?B?UzloL2ZvSkZiMFdXYzR2MEY0RXNQVE85QUcxc2JHSFY0ZHo2bG1lUmtRVEhV?=
 =?utf-8?B?S2NBTkRSc3c4QWxqajFIUDIwQ0J3VCt1TFNlYjgvc3VmYjRpMER3VGRjUHUy?=
 =?utf-8?B?L05uYWlmZ0hWTDdGNzNLN2U3amVqanpibnpTQkFzaFVXTkg3Q3NPaHg2Smtq?=
 =?utf-8?B?ZzV3akFpTFk3TUo3Q2lET1ZFK2tmbWRQNDdsN2plemh3eUdBdnRiYU5MQi8x?=
 =?utf-8?B?a1JwTE1TK3JWQkFTcXhsMWFlb2dRcVk0YmpPdEVWd2ZwckJjOWgrdlpJN2Iz?=
 =?utf-8?B?dnBac1VCV1ByR2ROaitjZUViYUZBcCsyb2FaQUQ3WVdIalBaZDR6aUhtUzJm?=
 =?utf-8?B?TlhtQXFMRCs1c212M0hRNUd1dUhsV2h6NFJzMm5SNXd5bitPTEg1M2ZKWmZ1?=
 =?utf-8?B?OGdEaUIvd1JGeWhJa3Fzam9HSkdYSXV3QlNhUE1zaGVoYk9nMWs5KzlhVkVk?=
 =?utf-8?B?Vmh3eTlzU3pobHh6b1ZyUi9Wa050RFBiOU1ibU1GU0YvSHl6aUxab2VQRXZi?=
 =?utf-8?B?S21ORkxpWnI5NUNnVWlwWmhSVVEyWkRWVktHbXRLb1pyVy9zOENQQU9HN0J1?=
 =?utf-8?B?SWFibXRtU05SZm96NmdzakxETVhpYnY2SVpMRHhxMzlzNVA1QzZXc29PTU9l?=
 =?utf-8?Q?o4ONzZC9773Jn80qo1uict4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4B141D95E8E074BA2F15A448230572A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fbd270f-a8cf-4c72-f6cc-08dad93e4fe8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2022 17:04:47.8057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lK+qi2YdJ3qr0jRrrdkTjcrqXrdd+Ea4s/Q9+zGr/bD3nWD0jWYDqVJHoVk/wn6CrptmMWiqijswxIcSWXsOyjHzmEKppdKUkePt7hJiOHYH+dS+u0KZhZgeIWCQA+B0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4858
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
Cc: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIFRodSwgMjAyMi0xMi0wOCBhdCAwOToyOSArMDAwMCwgVHZydGtvIFVyc3VsaW4gd3Jv
dGU6DQo+IEp1c3Qgc29tZSBzbWFsbCBjb21tZW50cyBhbmQgcXVlc3Rpb25zIGJlbG93Lg0KPiAN
Cj4gT24gMDgvMTIvMjAyMiAwNTowMSwgQWxhbiBQcmV2aW4gd3JvdGU6DQo+ID4gU3RhcnRpbmcg
d2l0aCBNVEwsIHRoZXJlIHdpbGwgYmUgdHdvIEdULXRpbGVzLCBhIHJlbmRlciBhbmQgbWVkaWEN
Cj4gPiANCkFsYW46W3NuaXBdDQo+IElNTyB0aGlzIGxvb2tzIGdyZWF0IG5vdyAtIHByZXR0eSBz
ZWxmLWRvY3VtZW50aW5nLCBhbGwgdGhlIGNvbXBsaWNhdGVkIA0KPiBjaGVja3MgYXJlIGNvbnRh
aW5lZCB0byB0aGUgaW5pdCBwaGFzZSwgYW5kIHRoZSBjb21tZW50cyBhcmUgcmVhbGx5IGdvb2Qu
DQo+IA0KPiBIb3BlZnVsbHkgc29tZW9uZSB3aG8ga25vd3MgdGhlIGZsb3dzIGNhbiBjcm9zcy1j
aGVjayB0aGlzIGFwcHJvYWNoIGFuZCANCj4gci1iLCBEYW5pZWxlIEkgc3VzcGVjdCAoY29waWVk
KT8gRnJvbSBtZSBpdHMgYW4gYWNrLg0KPiANCj4gQWNrZWQtYnk6IFR2cnRrbyBVcnN1bGluIDx0
dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+DQo+IA0KDQpBbGFuOiBUaGFua3MgVHZydGtvLiBBcyBw
ZXIgb2ZmbGluZSBlbWFpbCwgaSBjcmVhdGVkIGFuIGludGVybmFsIEpJUkEgdG8gdHJhY2sgdGhl
IG90aGVyIGZvbGxvdyB1cHMgKGludGVsX3B4cF9mb28ocHhwKSAtPiBpbnRlbF9weHBfZm9vKGk5
MTUpIGFuZCBpbmxpbmVzIHRoYXQgY291bGQgdXNlDQpDT05GSUdfSTkxNV9QWFAgLSBzb21ldGhp
bmcgdGhhdCB3YXMgdGhlcmUgYmVmb3JlIGJ1dCB3YXMgcmVtb3ZlZCBmb3IgREcyIC0gcGVyaGFw
cyBjb3VsZCBiZSBhZGRlZCBiYWNrIGluIHdpdGggYWNjb21tb2RhdGlvbiBvbiB0aGUgaW50ZXJu
YWwgZnVuY3Rpb25zKS4gDQpJIHdpbGwgcmV2IHYxMiB0byBmaXggdGhlIGNvbW1lbnRzIGFuZCBE
YW5pZWxlIGhhcyBhZ3JlZWQgdG8gcmV2aWV3IHRoZSBjaGFuZ2VzIGZyb20gdjkgKHByaW9yIFJC
IHBvaW50KS4NCg==
