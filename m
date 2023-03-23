Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C176C5B5D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 01:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CA410E2A0;
	Thu, 23 Mar 2023 00:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E80D10E29E;
 Thu, 23 Mar 2023 00:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679531230; x=1711067230;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Ym7ZVNIWu8/tNp7qxBQiDrJEnCO/Iwwc1RYGCdfSsSM=;
 b=HHFqQU8DsTD8C1nOnu0rdo/4WQFCg7124aVfRa0cgpHyPANPhrf4Kqgi
 mPUrv+Gq5ihbB1YC0Rp09FoW0L4r0SCYGboQa+TJd9Ek64OoBfEj+g4gn
 BJU8Qo/uL7VJCs7HJeU/0Fm3qA2J6S4KHQT93M1n+UW1TdW0JxMQ6CBjW
 W2odE9LUhe2iQZwGF5+Z1DAY7gZ/wGRVmcsY/7Hdp4CY9i34EqTQ1x+ad
 0Kj5l2XaUM+5PFauo/VL+OfRSb71Lop9NEJzm6Ey1bx66a9+uHo6xKbeT
 YBrLkH/nw1k2mxhma2dkelbntRGDTEWas9ZFhOUsjKPpUU8+NMzoPvx7v A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="367102404"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="367102404"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 17:27:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="714596215"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="714596215"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 22 Mar 2023 17:27:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 17:27:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 17:27:09 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 17:27:09 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 17:27:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fuwmtRFqDj3RDXQNMetZ+nN8N+Vo+x22XqcPjH6WgQTQ2fY26uLRACzQ+epwvUaDX4PyAn23pHGDdsYW+FMQftXQNcQDcIfYxWHdokLC8n34kra179/pCXk33v7c55w9aTLdvyQ93/6MO9nXUAH1bOW5/7w7fIX1A91TulMZvzPW+EpGa5h0NJIC82G5NXUhWWMcRNk9XwfnIGo1aC2t6AZehrH1uOqT7uWRCgIdKRARu5N0UeKmbH2Y36Iz2Ov07ydOlkhVbHpGme27L2OjZ9plVDtg6SOCkcOr3eTV3LoBqWQ2Vag56ebUN+ss35QknmtXgEwv0vF2eznbWZii/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ym7ZVNIWu8/tNp7qxBQiDrJEnCO/Iwwc1RYGCdfSsSM=;
 b=R3Cz+0rEw9EspH+Nciu3GKiXbRoKTvo88Nz/+JxF5Emer4m8X5Mm85BI4W5UoMWKGCPrGSLeKva/XUstfOuwV/RB5EaCjR6k44sLbDwFZUVfU7g21BLMefijgrJiLX4KFbxqmFaz7Tnb4Q1XitFF1nOuQk4tAL0LH1Ch7ywq7kcRzMq7FatUYhOijGGHhCiltGBN1JKrlO1xf6Pc1by2zhuO3c94CCDrcDIRoXix9yRUtTYZ15rmBIaIWolgsGbIoWsiyDXjAq/q9UVWp8CMg/z4eKeDQoZ58P+32IfO74cEqEz7E8o6SZJBR28fRs7uO09rLENN40B590jLnna4uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18)
 by IA1PR11MB7293.namprd11.prod.outlook.com (2603:10b6:208:42a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 00:27:02 +0000
Received: from BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::c37:b830:663:44ec]) by BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::c37:b830:663:44ec%9]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 00:27:02 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Tamminen, Eero T" <eero.t.tamminen@intel.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/pxp: limit drm-errors or warning
 on firmware API failures
Thread-Topic: [Intel-gfx] [PATCH v3] drm/i915/pxp: limit drm-errors or warning
 on firmware API failures
Thread-Index: AQHZVp6bZUKYMA457Uqqs0Zo8fgKSa77kFkAgAGLLACAAcEGgIAIspSA
Date: Thu, 23 Mar 2023 00:27:01 +0000
Message-ID: <38deebc090105826da9c85172392b10b93e99801.camel@intel.com>
References: <20230314175832.1506427-1-alan.previn.teres.alexis@intel.com>
 <6cff8c19-0ab6-4b03-d778-ad57aa207b98@intel.com>
 <cc56d923-4021-3423-bfdf-986e7b73283f@linux.intel.com>
 <3841da5b-06df-eacf-ebd1-0e7885e6c9cb@intel.com>
In-Reply-To: <3841da5b-06df-eacf-ebd1-0e7885e6c9cb@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5758:EE_|IA1PR11MB7293:EE_
x-ms-office365-filtering-correlation-id: dd4e879a-06b1-4f6b-df2a-08db2b35527c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qhog8xv1i2XliJyqmOTsmskr69ocFGO0s8QtMEZukSpBH0RhLQjZGm3AFXVHTE5aJGgTWPJK6CSrNzr9dAOA7fkM5/KA8x3ApLFwgHRzw+5Vgsfu94ZaXAkANehvZK66JRq9toPUXT5OShUpcJaR/bCUuuONfPg0TILuADNVo5+ctZhRRk3A7sRUc1jIPLnnn51lQGu8SjzqNqDTa/ZaQi0YSTHoZPLBvNwGWrWPmw4ZwkIArlMmiCMJ29S3ZxkIbpZUhfrWLHezpmpG8P7aF9XlLf4MF983B7mYxv2bqM07JXURjx45xiKOJfDdbOTN58zQKGXY2Y+F0AbkJpwjDidnI8qyN4O/a4e7Os2fTvynH85Iym2d5G49W2cpf6QvBjyzGBZVsX0kq9JEmMMPignDmJjj0GyoJN39bFBWmGROZOFjsFnwUipyqvndqkFT+XJp1I8iDQQD8c5mflZLHhKrDwgQSo4ztQKYyhP81KbZzqlRpZTflfhOssJ44G09HMNKET0NNrs+vB55rQovLmO6PsTgupIVwHF96vDpZXih2eoZHXF0cd1gJT1IKfz8Hv99h3gnl0QyVcEqSU7FswxnGpDzj8AZM2GMZ4B5/rwMLKzmcVaESPxxN8rsTDG501wnJd/CgCKb3E3yZOe0cYiZolTp0RMj0hvOhfy4gEhAB+8fqFg1nVaA/gz22aTLs+r2rpOKm5XQpMu0R2+ptA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5758.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199018)(36756003)(86362001)(83380400001)(4326008)(71200400001)(66476007)(8676002)(64756008)(316002)(110136005)(76116006)(66946007)(478600001)(2616005)(91956017)(6506007)(66446008)(26005)(6512007)(6486002)(66556008)(186003)(38070700005)(38100700002)(41300700001)(4744005)(5660300002)(8936002)(82960400001)(2906002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWRQbFBhQ2k3WTFnaTZRcDRUZHFoZXBCUUgyd21nbnBpaVdWYko0ak55T21l?=
 =?utf-8?B?Ukx0TE4yb2tSNlRGSGs5R0Vsa3BtYkZzWmxMSDJKREtuQ1U3eU1YYTRMdGJU?=
 =?utf-8?B?ZlBEd1lGU1dobThGK2JKZDRNVXIzV3hGN3p1NUsvOXY2UitRU2wrMlB2VkRN?=
 =?utf-8?B?NzFGdnBuM1BENW1YNk91ODliN3lnclBEeTk0b2t3S1pkY0FiVlZFRTFiUUxO?=
 =?utf-8?B?Q1FINVdLWERZYzAzL1BhZmR5SGMxNElMdUNnWlhkU3I3aGNmSkxxT2tKZy9L?=
 =?utf-8?B?Vy9jQkpTbW10bzZBVE9GUFNrMUlVUEJzTk56VWZTZCs1ejNyMmlGdUttMFgr?=
 =?utf-8?B?bE9wMWxTcXFHSlhkTURlTjRrOHkvVE5qNEtQUWkrM0cvamhDTjRFa3hLelVW?=
 =?utf-8?B?dUMxWkRiRlJyMUdDRHhUUGROYVBNZjhleGMzK2VEakhhLzJZZXZmOXh5WXRy?=
 =?utf-8?B?cEVVNXp1RXJFcGFFdjlEcXNmSFdBYzY2ZVV4MWNUVjBUTElBT00wNTNTbnU3?=
 =?utf-8?B?aHZjS3NWL1hUMTk5UWg4SWxlMjc4YkVjWkMzeFVPbFhWcitlcG9CS0dOaXlX?=
 =?utf-8?B?NjVJK3YremJmTmJhdzFTRytxMzJnZHdFVTZnRHZUYTdFdUJDSTgrYXo3clgx?=
 =?utf-8?B?Sk9wSHBTbXNKdlhVNTlCZnVWVHpIekEzbGl2MkR0YjV2TDc3Z0dHeW5uZDFj?=
 =?utf-8?B?b0ZINmdLNDU1azF3NGpFMXkvcWhvdDYzMmdtNjVHVnVkdTN3OHdpd080dXo4?=
 =?utf-8?B?d2tMSm1OZEw0VU0xcHVsU0lxT2tNcURvY2xtWUR4UTVUbUNPcloycGFKcEVK?=
 =?utf-8?B?K29KN1g0a0c2ODh4alQxRzNmZllHUVRIbmRBdWJwWFFHVkF5N0pEUVd1SDBt?=
 =?utf-8?B?QkRjcVUxcHVpZEVEdUsrM2RSaVhyeFlPRzVrTEUvdXBZNDQrL0NwamNIYkoz?=
 =?utf-8?B?ZERKRWI2UCtZS3BaWEp1YlJJRGMrc203RjI4WFViaHg0S1NHY2l5ZVh3VW94?=
 =?utf-8?B?L3RXSFUrUFdEYWhzNTZ1OURsa3dZMitSZk5HK3dZNFBWcU9NcnNBOUxzcHNw?=
 =?utf-8?B?NGpkT0FabHl3ZHNnc00zQ1gwUmR6OVpJdXFlWUJMWnlhcVo0UWRkbXRGY01Y?=
 =?utf-8?B?SGRsZnBMdlUvaTBubkI0QkhpK1lUSnhIOEVyMFdCZ29zYnFRZlZtMTRQM1Vh?=
 =?utf-8?B?N1dLQ2hkMStCT1IwWlhkWEdmVGJiL1hKWGlUKzhUam1OS2lKQ1lHNFRxbTR0?=
 =?utf-8?B?UVlENXB6c04zWFBjSFNxUXU4b3J4U3JEd29qMmQ5VW1TUHRTZEFoYlhrY2hP?=
 =?utf-8?B?d2hjNkZmWHk2UERLWWMxYmdJMHRVdGNvM1pVZGVJMldobUl1NkE2ZlpMYWhJ?=
 =?utf-8?B?TGNjampnc0lzS01UdEtOYWVNUjVOYjcwcGI5TVdJZ1hoVmFFVWt3REE2cjhm?=
 =?utf-8?B?VlZYT1RJZkdINkt2NDFDQ29pckVRQlhMTkM5QUZVRDRpNG1NVUJJUnN4WXl2?=
 =?utf-8?B?dXB5Q2FZdmN2T1RVcWIzQk1LNGFLOC8zdUk3LzBMbGkxT2lEUzlsVThvMHBF?=
 =?utf-8?B?b3FiYTNFZE1iMUdsdEJmTVQrVkR5WjhkYWFXQ0NoeDAxWEpSZHB0WXprRUNF?=
 =?utf-8?B?ZkRiTEkyTzhqbWxmVkdwSG0vd0MxdmJQdFQwMWxMcU5Od01zdTRRTmNNUXVO?=
 =?utf-8?B?ekZiV3l0djljNmtYY21peXFHVFF5YlRDZFg5NmoraHF1cUtMUS9WM2pyUzB3?=
 =?utf-8?B?ZUVtbEszaUpYd0hRNUlWNVVqT0tDYm1qZ3ROY0VrWVoyOUMzVWJZRzAzQm5t?=
 =?utf-8?B?NGhDQldZbzRWd3RqQTdLMWVKMlVORjJKVldqSEVJam9WQ2hSbWljVzB6SkZa?=
 =?utf-8?B?VDQwbTBHN3I1SnIyZVhmZ1FvSzNkRW1rRFJySGVHQjI2LzFNNFFoWER2NlJ3?=
 =?utf-8?B?OG5tTXVRUVVPZVV1dWwvRTdrR1lCZExCTGkvbDl0c2s3TmxIVkZoTk9Ib0Zw?=
 =?utf-8?B?d3NIdzdjU3prL0NiM3RhcWRBWG1YeGN1Vk52OXV2R0EyV3NEN3JTclJEalF1?=
 =?utf-8?B?cXJyeHVBMEpJS09uUk5ZNys3N1dTc1JPR21PaVg0S1RaeU00TlNRTlYwMlNE?=
 =?utf-8?B?VWZxeko5LzVnUHE3azJDOGpJQTkreEwvWXBnTzc2eHZwejQzU0RBc01TSEFr?=
 =?utf-8?Q?2VC1CRsGoT+Eu30IQLoAxOE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3EDFEA9643A5CB44A62074776128DF65@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4e879a-06b1-4f6b-df2a-08db2b35527c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2023 00:27:01.9764 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n025cFQMtqxtOnqh2Y1Cw6Fqtnt1DPeouFH9guN43joKnJ7nrVGkqFyaNmo2x8d8OffuiY/zm4TmZVOnUhkLv4GW+HEyv4n556P/EDu16pTuNSC93X55jCCi4y4fKIyQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7293
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

T24gRnJpLCAyMDIzLTAzLTE3IGF0IDEzOjM3ICswMjAwLCBUYW1taW5lbiwgRWVybyBUIHdyb3Rl
Og0KPiBIaSwNCj4gDQo+IE9uIDE2LjMuMjAyMyAxMC41MCwgVHZydGtvIFVyc3VsaW4gd3JvdGU6
DQo+ID4gPiBbwqDCoCAxMS42NzQxODNdIGk5MTUgMDAwMDowMDowMi4wOiBQWFAgaW5pdC1hcmIt
c2Vzc2lvbi0xNSBmYWlsZWQgZHVlIA0KPiA+ID4gdG8gQklPUy9TT0M6MHgwMDAwMTAxYTpFUlJf
UExBVEZPUk1fQ09ORklHDQo+IC4uLg0KPiA+IEFsYW4gLSBpcyB0aGlzIGV4cGVjdGVkIGR1cmlu
ZyBub3JtYWwgb3BlcmF0aW9uIG9uIHNvbWUgcGFydHMsIG9yIGl0J3MgDQo+ID4gc29tZXRoaW5n
IHRydWx5IHVuZXhwZWN0ZWQvdW5leHBsYWluZWQ/IElmIHRoZSBmb3JtZXIgdGhlbiBJIHRoaW5r
IGl0IA0KPiA+IHdvdWxkIGJlIGdvb2QgdG8gZG93bmdyYWRlIGF3YXkgZnJvbSBkcm1fV0FSTiBz
byBpdCBpcyBsZXNzIHNjYXJ5Lg0KPiA+IA0KPiA+IENvbW1pdCBtZXNzYWdlIHRhbGtzIGFib3V0
ICJIVy9wbGF0Zm9ybSBnYXBzIiAtIGlmIGl0IGlzIGxpa2UgYSBtaXNzaW5nIA0KPiA+IEJJT1Mg
c3VwcG9ydCBvciBzbyB0aGVuIEkgdGhpbmsgV0FSTl9PTiBpcyB0b28gbXVjaC4NCj4gDQo+IE5v
dGUgdGhhdCB0aGlzIHdhcyBvbiBwcmUtcHJvZHVjdGlvbiBUR0wtSCBIVyB3aXRoIEJJT1MgZnJv
bSBBcHJpbCAyMDIxLg0KPiANCj4gKEkgZG9uJ3Qga25vdyB3aGVyZSB0byBnZXQgdXBkYXRlLCBu
b3IgaW50ZXJlc3RlZCB0byB1cGRhdGUgaXQuKQ0KPiANCj4gDQo+IAktIEVlcm8NCg0KQWxhbjrC
oEhpIFR2cnRrbywgdGhhbmtzIGZvciB0aGUgZmVlZGJhY2sgLWkgc2hhbGwgY2hhbmdlIGZyb20g
V0FSTl9PTkNFIHRvIGRybV9pbmZvX29uY2UuDQpBbGFuOiBzbmlwDQoNCg==
