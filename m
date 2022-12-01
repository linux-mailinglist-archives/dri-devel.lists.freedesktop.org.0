Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC9063F807
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 20:20:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC0310E153;
	Thu,  1 Dec 2022 19:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABFA710E153;
 Thu,  1 Dec 2022 19:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669922414; x=1701458414;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wTaWH+iea7CtqzLVMYcEhoE6IJxqrBsQg7urc+kvmnY=;
 b=jZFnEY2Mf2+Q1xQXbC3Gk8fgNY00/nzrAET29tszZLfmPGxJJ2SbQ68L
 IPWEocce09ePfVp72qrfZfOptmJE8XZ4942GZQpPSDdp5oEd6DrKhcUWc
 lOx0mn//Tschyk1Yez3A+HC/KO5L/8ErPg6djRkG7XnLlcoxTS1hg65rz
 o52XZxqVbQlOv7RNxiT81wO3M/jstFrnumuAqWGk5b4vnHfeQWOxYv9g+
 rIA8Gs1rC4N3tWna/sm+FYYvH5D15NRunNNYwmhZlV85eoGiKgqFLV59Z
 lk3UB5vBkzLwYYyPvmsHv3ILaMDGy5Uubv7Tlw1fqcIxNO9IBiRMPaFNr g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="295472001"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="295472001"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 11:20:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="819166215"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="819166215"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 01 Dec 2022 11:20:13 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 1 Dec 2022 11:20:12 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 1 Dec 2022 11:20:12 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 1 Dec 2022 11:20:12 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 1 Dec 2022 11:20:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLLTkGLNQZyoCTFY1x8HOSpYbfcRqAGOlLx4OL8txmQ1GUoEEDtCkXQ8K0OA/z/5l9XAwUKc9GyPQ2gdw5AC3+WQAZ54NB7DBrfd0IR2MFL0c8+XCoCh8z/GZEezoEaNoZ6IAZpvR6pB/CjN395Y4fXdgdLrYj99vEKo6jGeQ+BqByuHrWhbCsExy771ZdTcHxE8dTHd473PsachKQGoa7HFX9/na6gcvrx3QojaRC9Ad7NcmO6I7yz+YXqsSl/f5ZVAbEWuT2ls+haNVgihnThdHSZLN9xhfsP/D6CJ9NirTq75Ijx99Ux0zcrBMm6zhdl0SCIHB0voNzUeskqEnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTaWH+iea7CtqzLVMYcEhoE6IJxqrBsQg7urc+kvmnY=;
 b=OTDmfMYKsQfccLbP2ngz/EEW3aasHgDrwdbSUz5ErgfrEBNegwk6we6BhA6+ERvs9L/Bg1oIIRIDnO6yo6w31+7D/2fwbpHikjaevvBit8D1SCVeQqvxyFp2WdXDDawAEpkYrZIdSPmCrXE3iPI8/TvJ03AuVbVFyNc5WyOH/LFHjYAgLTUZXE+LcjVHEc5ZLBuTB1OMsyt0MLqYSOykytsOLeSDN2yKvqAzmR7WBdRacrzyaESXTgu3tqOBI+STwM1jH40TNr0IPpUtFHsMQ4hG43Qh8tkm4nP4iqy2s9WTz+9OV43+UyFv3SNJSTwtRMRBKC+aKbkKNUeBubTFSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DM4PR11MB6384.namprd11.prod.outlook.com (2603:10b6:8:8a::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Thu, 1 Dec 2022 19:20:08 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6%4]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 19:20:08 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH v6 1/1] drm/i915/pxp: Promote pxp subsystem to
 top-level of i915
Thread-Topic: [Intel-gfx] [PATCH v6 1/1] drm/i915/pxp: Promote pxp subsystem
 to top-level of i915
Thread-Index: AQHZBF+GpXTTTK3BYE6Y7lb4YlTCSK5XuqOAgAAC0wCAAa5UAA==
Date: Thu, 1 Dec 2022 19:20:08 +0000
Message-ID: <860bdb16f2aa72423d5ffcdc81810f6918dabf96.camel@intel.com>
References: <20221130020245.3909555-1-alan.previn.teres.alexis@intel.com>
 <Y4eTobptLTXXfqGF@mdroper-desk1.amr.corp.intel.com>
 <1c4cd3873756ee417391d0354f2646a031cdf2b6.camel@intel.com>
In-Reply-To: <1c4cd3873756ee417391d0354f2646a031cdf2b6.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DM4PR11MB6384:EE_
x-ms-office365-filtering-correlation-id: 0032ea76-0808-417c-49a7-08dad3d10f86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0/vi1T2heSm7Q55+R8Wp7b3gbTtGI/JsR6BsuTFiP1PWpYlgw/PMb2Zy34UK9QhllfAabBWEp2S22KUUcBX6SA+OWuLoH5aT9tBCKAjUWhhRPiDgdHgqfitMEaUss0pFKShV0oeT5G90fe2FHEEMr8xFUQ53HlblaQ8AEzKjfhZvVHaL+NosAXmlf4Y02vf6owr1o9vRrAxCVknCUkyixO/TOOCnU36HorcAnDDn/k6/ov92GVQxww5uLFBgXJCfHbkWi8jrJ1WzSwdsB86QrCrRqtf2xfKCILXUutOzJJLd9BxNxIbvfykQO+ayrcr9FAasJHJm6g3vBn7dTa53MuKpiANa/EM2MZJqrs5w9+WmfEiKCOpBQOfCcW0prpnReQDsrGsfOQJGwpG5bXwVfS/iZpxdrNMj6yVyTTwonzg8J9NPQissnfsyNrvMkNrC31qHlljYjMnK86iwQJA8+0C4FySkf02bEDJ5bq7qeGFBUwLHMpKIJXzbBnYJHJka0jYtEjgTdXG7aSnqWloVghVOL1+X9YUhCidq8DduqR47EIW/f3E+q28CDtWj2oXE8lfGofKoF74Y5l63t8q6XSIQhUQNN31baPfKjFQPlPwTeTYDB00Ho48w+J79IuiYAgUUx4Mhv9Glr8/IRj3Na1BudtnAiAVF2wyO6LqDOxkBvVntRalAkM53eL9LmVxyzGb7vrpUN/+qES/fpTlvcA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(346002)(136003)(396003)(366004)(376002)(451199015)(478600001)(6486002)(4001150100001)(83380400001)(2906002)(86362001)(71200400001)(5660300002)(54906003)(6636002)(122000001)(38100700002)(110136005)(38070700005)(66946007)(66556008)(36756003)(8936002)(66446008)(6506007)(41300700001)(2616005)(66476007)(8676002)(4326008)(82960400001)(64756008)(26005)(450100002)(91956017)(76116006)(6512007)(316002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGc3UCtXYkJ4RG9KdUpYNll5Y01QMkxRZnhOdVlqVWJJeisyMGlINmZYbCsv?=
 =?utf-8?B?Sm43c24zT0ZrN0hIL0RiZm9PTm9TbS9IWFZ5OEZCVm13VGx6eFFLRzNpb0lG?=
 =?utf-8?B?a3kvUCs1RkZIckNvcHhLazdIemJ3dXJ5TXhLYXBjcEZINjVYYmhjOGQ1RUNI?=
 =?utf-8?B?OWFRUkIzcGp4TndZNnVDQk51NHg3b1IrbWt6MGk1WlAreWdDa1o4cm9vWmVv?=
 =?utf-8?B?MFNBaDF0cG1vRTJ1SEh5YVlzbC9Ma3ZTeUR0Z1RMQm1IWlhEOVN3bWxvZnYz?=
 =?utf-8?B?cHZZTzd4YURydHU2cmUwTm1vOWJmajRaQUlPdHRyYUtvcThXRVY5OUNUcHpV?=
 =?utf-8?B?WkdVVjdxN3ZrYUJJbFFYVDVFZlE5ZmZJWTlYaGxuRllITGNSd0Jqbkg0aVhC?=
 =?utf-8?B?MHErd0VUU25MK2FWTVZMMjBlWWxETUVlNUs5V1YvM0lBU3NuUzVjaTd0RERS?=
 =?utf-8?B?WXdJMXVTY0ZEbDlrY0lXZXhUSnVVRGJmNlVJS2g5UGFKZGZBR3RYMlFOS29h?=
 =?utf-8?B?RStXT2hvcEFlSjlFNlVxanpscDZqaFFqZlNEWmZsVFV6ZXlPOWljK3c0a1dJ?=
 =?utf-8?B?VW5wN29ZaWI4dW1VOHVMYlR5MERaTzNtUlJLdnFDRWhVdGRXcGNaNW9aMm1x?=
 =?utf-8?B?TWk2WTFCSzFKd0krSVZCeUpDZmN5OENrS0hteVlQU1lPT1dMaWxoeE5QalFh?=
 =?utf-8?B?dkZnNHBtdkJySHBLY1RQdkVNa3pOcENyVzl1NjdoTjRKOWRoYmI4VlZSR1Zk?=
 =?utf-8?B?VG9EOTNOemFCK1ZLYjJHWEtlRVJ1N1YvNzNzMU54VVR4TFMzTFdoWXIrcVAz?=
 =?utf-8?B?RGc4QjJRQ2RLdlF5UlhaVWY2QzM4UldYMzFra21JYzl5azBQRzlEd2tLVVIz?=
 =?utf-8?B?Wm96eWhEVVR0ZjJnVWxVQ2RSamFTaXJDUFdQeVMxRFlZeVJMMUFZZ0JBMEJV?=
 =?utf-8?B?cGcwL0hwSmtlb05QRVc1NmJjdHY3dlNRckVzZUp2UmI1WitIVUF0Q25KdkRK?=
 =?utf-8?B?ZFozc0FNdllQL3EyMi9vNmorSmlWTTFCYjVhb2NQQjZaQXkrS0pBUlpDeWpi?=
 =?utf-8?B?Vm9YajNoRjhBV0QzQUQxRXE0L2RuSDkzcjRKdXNqa2JmU0NpbFNhV3NmMmFM?=
 =?utf-8?B?aGJ6RHNwVEJuQmsvV1FEdGU0T1F2aUNqSHBiODRieC92N2hBN043MExVcUJ4?=
 =?utf-8?B?N0x1U1hZSWp5aDRhV05JWGMycDgwTlBSVCtNQjRiYzdFTzVzV1pwVS9SbFVq?=
 =?utf-8?B?c2pGdHRkVGNXR1c3ZXA1bjB3cUZJdE5XbU14cXRLeXJpMFgvdE5hMVRqV2xT?=
 =?utf-8?B?eUxzVUE4RlY3OWVKMzZTakpBamM3UERnODR3ZWdMN3VyU1dvK21GclBLbmhU?=
 =?utf-8?B?TjhaaVNpYVJiSXpnMnhWeFFZQVZEekZDNU94Z0Z1ZkhubEhtRmE3VFd6VnNn?=
 =?utf-8?B?NmpUUVFHbHExQWE4b1dXejRtYjZkZHVhVmZTRjdLK202SkVZbEhYdk96T0oz?=
 =?utf-8?B?UFNsSktuTHZhaEFiR21NRDJXMzh5bjZaY0VsTklPQ1hkNHV5VkF4YlZhdzVr?=
 =?utf-8?B?YmNFNWR0Qjl0bWlabkFhNVNPellLQm0va0s2V1NxbEsyOUJlMFErRGp4aEVW?=
 =?utf-8?B?ckxhTDh1T0NRc3ErTkNvUTBYd2pScTI3ekZ6SEJJTnNQcUhjZThYcHowWURs?=
 =?utf-8?B?M0V0cVN0MGwzTXQyM0lzY2NMUkYyYklBU3R6WHpyK29FSjQ0RG1tSU5EZURV?=
 =?utf-8?B?Z3FnZ1FOQ2lrRE5wWXZLdUdWOCtqcVZRSmw4ZGhUZE9CYW9rUjUxRkt3QTdp?=
 =?utf-8?B?UnB2bmovdExHRktYK3NMUDdtQWx1bDJON0VFTWc0ZFY3OCtMMXAyYzZxcERh?=
 =?utf-8?B?WW1obnNuVUtwNHNycnVEU0lrRHc5MUNNc2IzamovRUl0MTBSQVNuNHZlRW9m?=
 =?utf-8?B?clFmS2VEdlI0cDE0TXZNOTFJOHVuSFEwL0UreUlQN3RpbVc5bDMwdFJIVnJK?=
 =?utf-8?B?Sk96ZEpuYjZFYjZwaGdJZmFyRGUwdUVaSThvcklwSVhhblVJWXdDSFg2Y3dP?=
 =?utf-8?B?SjI0SmJtb0NFZEFObXhDRXlKcE4zeFVOdGJJK002cnZDNzJlK1R3a2hSRjUx?=
 =?utf-8?B?ZTBVL05COXFnRGtUMlRZNnBlYlEvSFVaRCt5Y0xaK1llYVFqL000cnhudUhl?=
 =?utf-8?Q?nfNW9UDy3pVaJSc/0tD82Wo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <21B6CBC5AE5BE24192AA263C9B2FF77A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0032ea76-0808-417c-49a7-08dad3d10f86
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 19:20:08.7962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FiCRI+RAoez78poEVgpt3sOawdLG0pH2iekYzngfZlD8rHORVTjHoRNpdHVyjWUt9kzNgc/WRfBraJW1evCDc587RZpv5u3LJKxgeCS5eyc2ZLiY+eHN3NLYDuvXwoMw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6384
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIFdlZCwgMjAyMi0xMS0zMCBhdCAxNzo0MiArMDAwMCwgVml2aSwgUm9kcmlnbyB3cm90
ZToNCj4gT24gV2VkLCAyMDIyLTExLTMwIGF0IDA5OjMyIC0wODAwLCBNYXR0IFJvcGVyIHdyb3Rl
Og0KPiA+IE9uIFR1ZSwgTm92IDI5LCAyMDIyIGF0IDA2OjAyOjQ1UE0gLTA4MDAsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiA+ID4gU3RhcnRpbmcgd2l0aCBNVEwsIHRoZXJlIHdpbGwgYmUgdHdvIEdU
LXRpbGVzLCBhIHJlbmRlciBhbmQgbWVkaWENCj4gPiA+IHRpbGUuIFBYUCBhcyBhIHNlcnZpY2Ug
Zm9yIHN1cHBvcnRpbmcgd29ya2xvYWRzIHdpdGggcHJvdGVjdGVkDQo+ID4gDQo+ID4gRHJpdmUt
YnkgY29tbWVudDrCoCB3ZSd2ZSBiZWVuIGEgYml0IGluY29uc2lzdGVudCBhYm91dCB0ZXJtaW5v
bG9neSBpbg0KPiA+IHRoZSBwYXN0LCBidXQgbXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHdlJ3Jl
IHRyeWluZyB0byBzdGFuZGFyZGl6ZSBvbg0KPiA+ICJHVCIgZm9yIHRoZSB1bml0IHRoYXQgTVRM
IGhhcyB0d28gb2YsIGFuZCBrZWVwaW5nIHRoZSB0ZXJtICJ0aWxlIg0KPiA+IGZvcg0KPiA+IHRo
ZSBQVkMtc3R5bGUgdW5pdCB0aGF0IGlzIGEgY29tYmluYXRpb24gb2YgKEdUK2xtZW0pLg0KPiAN
Cj4gSSBhZ3JlZSB0aGF0IHRoaXMgZ2V0cyByZWFsbHkgY29uZnVzaW5nLi4uIGJ1dCBpdCB3aWxs
IGJlIGhhcmQgdG8NCj4gc3RhbmRhcmRpemUgdGhpcyBJJ20gYWZyYWlkLiBTcGVjaWFsbHkgd2hl
biB3ZSBkbyB0aGUgUFZDLXN0eWxlLXRpbGUgYQ0KPiBpbnRlbF9ndCBzdHJ1Y3QgYW5kIHdlIGFw
cGFyZW50bHkgYXJlIGRvaW5nIHRoZSBzYW1lIG9uIE1UTCwgbm8/IQ0KPiANCj4gU28sIHVubGVz
cyB0aGUgdG9wb2xvZ3kgZ2V0cyBvcmdhbml6ZWQgaW4gdGhlIGNvZGUgd2l0aCBhIHN0YW5kYXJk
DQo+IG5hbWUsIGl0IGlzIGhhcmQgdG8gZGVtYW5kIGV2ZXJ5b25lIHRvIHVzZSB0aGUgc2FtZSBv
bmUuDQo+IA0KPiBCZXNpZGVzIHRoYXQgd2hlbmV2ZXIgd2Ugd2VyZSBkaXNjdXNzaW5nIHRoZSBw
dmMncyBvbmUgd2UgYWxsIGhhZA0KPiBhZ3JlZWQgdGhhdCB0aGUgdGVybSAidGlsZSIgd2FzIGJh
ZCwgaGVuY2Ugd2UgZm9jdXNlZCBvbiBrZWVwIHRoZQ0KPiBpbnRlbF9ndCByZWFkeSBmb3IgdGhh
dC4NCj4gDQo+IFdoZW5ldmVyIEkgaGVhciB0aWxlIEkgdGhpbmsgb2YgdGhlIGRpc3BsYXkgYnVm
ZmVyIG9yZ2FuaXphdGlvbi4uLg0KPiBhbmQgdGhlcmUgYXJlIG90aGVyICJ0aWxlcyIgZXhhbXBs
ZXMgaWlyYy4NCj4gDQo+IA0KWWVhaC4uLiBHUFUgaXMgc28gY29tcGxleCB0aGVzZSBkYXlzLCBh
IHNpbmdsZSBzdWJzc3l0ZW0gaXMgbGlrZSBhIHdob2xlIFNPQyBiYWNrIGluIHRoZSBkYXkgLi4u
IGJlc2lkZSBkaXNwbGF5IHRpbGluZw0KZm9ybWF0cywgbWVkaWEncyBIRVZDIGhhcyAidGlsZXMi
IHRoYXQgaXMga2luZGEgbGlrZSBtYWNyby1ibG9ja3MgYW5kIHdobyBjYW4gZm9yZ2V0IHJlbmRl
cidzIHRpbGVkLXJlbmRlcmluZyAoYWxsIDMNCnNpbWlsYXIgYnV0IGNhbiBiZSBjb21wbGV0ZWx5
IG9ydGhvZ29uYWwgZGVwZW5kaW5nIG9uIHRoZSBodyBjb25maWcgLyBidWZmZXIgc3RhdGUgLyB1
c2FnZSkuIEknbSBhc3N1bWluZyB0aGlzDQpjb252ZXJzYXRpb24gaXMgYSBuaXQuIFBsZWFzZSBj
b3JyZWN0IG1lIG90aGVyd2lzZS4NCg==
