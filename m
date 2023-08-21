Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA65782CEA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 17:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639D710E0FA;
	Mon, 21 Aug 2023 15:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC03A10E0FA;
 Mon, 21 Aug 2023 15:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692630428; x=1724166428;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LUY0fFnmX69zeT3iz/sLDzpkRbGD11P8Zne1l/EDI9o=;
 b=lJ7OLtBmlSL4DQpH6GiYJ4X1zelkZ8bH0/ynkKm41kqEZLOJRkHjtQ9X
 owybIaE5GWA4AHeeS3ipmXOZsSS2D7X8OldlqV71JZdP2hUXRJH/jazBa
 /xfCbFVkqj619+8GLY/qyRm6V7q00J0A/u7KjGLOBzOvoeEB98QW20jXA
 ftTiYCnGN1uPsRxf80VSvDNRD3cCDiMurk9nJ7p90bVmL3klc6IaMpZZt
 N/SwoG9G2vd+TaVFf+S9fkxNYEQkJ2qGiybLg2H/Av9mAcOKUU1lMm25V
 cf3Rl1nmR+txPb0ejr7vydQ05jIEN4W2jyQW5O6Ew5KqGcMULZiSyliAO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="376361913"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="376361913"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 08:06:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="712823088"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="712823088"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 21 Aug 2023 08:06:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 08:06:39 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 08:06:38 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 08:06:38 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 08:06:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfRihBSDqFMqEj0y0tdKWg6SUQ7CsDKEyTbunSlkD7nCmIEMr2hlgsp3h0dnUk0ruf4z0Z9iMZWw2v4VvaQaOW53wDJdfpdEyTsR38lc6iTxBgoipkBLHT3o3ycbEVmjlvhCa0XQzLz9QKgIJ6E8WclNW2uWhjiFOYnuYMZQB6I0HrZvwyaCszyFIL2jYtibA1XQaUqlgXhS6jl3Itx1ZIztODtsSolhKolg2RGqjZgkOe3eCxrhTkAn0pzlweIOTzyFHzh2rZyVFZJqkO1eT2hTedD/OG8lECaPPw14Ayz4AZvDdPsB1ViCl843Ucl9nWbI0u+GrhEffMd4H7WD6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUY0fFnmX69zeT3iz/sLDzpkRbGD11P8Zne1l/EDI9o=;
 b=CRxCATD4qyMIj9+78Ps1IOKLdIJMVGfQnJfM/z9f4sRoazuEYZ8YtoVndMkt0dNTYLuAUsouwHIw55luE2SALvfiehThjleFCMt4twX5M7YZ/O9Ffqk6l2FASK2MXRyDkqKdydOICuGk3CXVafR4OY1/sdjI0uvNZm3zHsW0aXVkD+o/7ORjLAAVfaVoNOl1zSP37+U+hEHmheqGSpbvrB6LE7kx0omGFNZigcj64WZQmvgV9ICvhFPg+abvrmnkMKBovIyJBHSdPtRBU/wYIbxcdthpE9H2hUBYkI1dfLH2cTq+3K6iCkuen0hvjXj8LlWSfL9ZLdxXI34udE52/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by LV8PR11MB8748.namprd11.prod.outlook.com (2603:10b6:408:200::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 15:06:34 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::27f1:a7a0:b6db:6c99]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::27f1:a7a0:b6db:6c99%3]) with mapi id 15.20.6699.020; Mon, 21 Aug 2023
 15:06:34 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: Dave Airlie <airlied@gmail.com>
Subject: RE: Implement svm without BO concept in xe driver
Thread-Topic: Implement svm without BO concept in xe driver
Thread-Index: AdnPImk6MOYV1wEITTKbUW99JKTN8AAlN1TAAAO9foAACdAN4AAGjR0AABKlsyAADoTWgAAB+b6AAAYiLxAAwfeKgAAgzF1w
Date: Mon, 21 Aug 2023 15:06:33 +0000
Message-ID: <SA1PR11MB69911D8AB895EEC13A64EBCE921EA@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <SA1PR11MB699192A66D7A2CC7305A59569214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <SA1PR11MB6991F9E3107C963BDF95E04E9214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <e0d7d6a2-5c9d-6e17-4b4b-be03deb6c130@amd.com>
 <SA1PR11MB69918E5603E286961789DE6D9215A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <3c125b60-df60-2037-c23f-918734e4973f@amd.com>
 <SA1PR11MB69916E51CE5A9217D447B91C9215A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <7ae5f112-d0e9-cc52-2b22-7265ea435cc2@amd.com>
 <CAPM=9tyots9C8wEU0TgGnFmLOkfqn62ngaYYjV2yuTf7jwDGFw@mail.gmail.com>
 <SA1PR11MB6991D7E239EAB23CC8A9A36B921AA@SA1PR11MB6991.namprd11.prod.outlook.com>
 <CAPM=9tw3wGhZ3ByfizM8+G4Ny5wQLwf4fw8pD4sySVk08355tg@mail.gmail.com>
In-Reply-To: <CAPM=9tw3wGhZ3ByfizM8+G4Ny5wQLwf4fw8pD4sySVk08355tg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|LV8PR11MB8748:EE_
x-ms-office365-filtering-correlation-id: 247ad074-2583-4cf5-bbb2-08dba2583569
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8FopB3GhtrlxA4NTZVYpXpbJmTGdFSBroIpPRiZ+z3+f7hnMcfmZKkXBOLx81bieYBJpSZExdZoILEMsYs7ZDG7FcZesiWF2idBFB/0Iov47TVyJVJKQREh1TeJpyDk/zbrU5xm238jO9ZL2ktO14OojxHXv4SZBIVg0X9l9guxvjUIlZ+uDzf3LhgI6QgjZMfkTFqM4Bap9+AtahFyc07qKPhKl5onYvRZWB5iX6g4DzRJtN0Vj+ynDvtEBA5IF+FVjgAQurPMQr8onMfPcRGpwQCBbWAtplO7+ZlkUu9w7EjdQToBiJ+ld3wPJHlxYX2SWWNNflVadbcnxBg6xKo5KFXv5nuESzfQw+kCAppP/GEeue7FI27YU4YRFPCWx1QuBka/ZRfeWSbpzwDsQdtaUy21ZbPdmmbcVaU5WIOiwJyYNWJzubHNZyawLBw6ZpR5UMPLge/bzig2P37Lpg3rglYbxR+EL0nZVmi7jNNeD5FLBeOqnjGXcdLxo/VPZw14KFVuLkSF/mJ4adykJvwUIUVYJ+VERAbrwpMLEGElJRgiwJdnwRKin2V8PWUqXTUACE0iw/TPr6qzJzhemHRdbeX6B1A7w9E59kAXrEgULKq80Sfqp0vstHajTGIYs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199024)(186009)(1800799009)(66574015)(2906002)(53546011)(38100700002)(38070700005)(6506007)(83380400001)(5660300002)(52536014)(33656002)(26005)(7696005)(86362001)(8676002)(8936002)(4326008)(316002)(9686003)(66946007)(64756008)(54906003)(6916009)(66446008)(66556008)(76116006)(66476007)(82960400001)(478600001)(122000001)(55016003)(71200400001)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTk3SytMaFdkcXhDVUxLb0orbDlaMnVQYVNwSjA4NmFiblM4S1FYWktCN2cv?=
 =?utf-8?B?WFVtd1hOUHJaZzIxNVljMDVRbVdqemkrY0lpWVhZTE5ZNnY2eDc3S2RCZXZa?=
 =?utf-8?B?a2x4VUV2SVB2V2ZZWFd3YWhmM3piczNDNEZZamx5MURYY0EyTFR2bDdPazU1?=
 =?utf-8?B?Z2MzNTBsLy96SEIrREpncjFSQjFYWkhvMElyY3ZSU0Q5cGtrYVJaQ3pwNGdu?=
 =?utf-8?B?NStQWG1CZWVycU1HNlc5dlZzRit5MldQU0lvTDRORk8vVkFla2lwcWg0MTUw?=
 =?utf-8?B?bmZHL3h2TGIzVUpPbElhU1UxQ2E4VUQ5dlhQVGZnV0JtVGE1TGphYkNscnBC?=
 =?utf-8?B?UFZSZkU1WkZFNjFzS3duRzRnMllDT0RNTkpVaVd1TG1HcVVFTFlROGQyVXEy?=
 =?utf-8?B?d2ZKN0c1RU5VajR5Mzc4SGxzbTZKU0t6WDViQkMxNDk4dEFXTDEzNXRXaHA4?=
 =?utf-8?B?WFE2akNVUnZVTTdicDR3RGxqTTFIYjBDclpTc3RRWU1DUndwLzhXWG9SMi9E?=
 =?utf-8?B?aGNURDBIT0c4Y1c2Z01tVVFMK3N0aVMwME8zbzhFenpwT2VGaFdQamJhUlZT?=
 =?utf-8?B?K3JFWkduUUhRb0d4bGlZbi9wU2VxdGRHUXFVb3RIU3UwTmVDd2twemlmSlRj?=
 =?utf-8?B?NlBuSTAwbnd1Nmw1N1JhUENNZGszRHVjMk0vMXhiRVY4Y0I1WUU4andhRmpS?=
 =?utf-8?B?bHVrZE91VHVjSUdDVnNVazB1NlJtcW1RakRkbVptOW5uYnRTYW53d0VVakdr?=
 =?utf-8?B?Ly84NVlGOGp2eENCaFVNQ2VrZkdNL0lyRkw1YXcxK29QZWR1S0RhNVRKMjZJ?=
 =?utf-8?B?SXRvamw3L2dsYjdNbjBQSW1xZktBem1XYUloUkFKL2JUcTduMmRpMS8xaGVL?=
 =?utf-8?B?SEpEZ0pQanppaW91bVhFc1U5aGVTcEY3VXRqWlpIWmx6QVNIVjhjb0U4S2FS?=
 =?utf-8?B?MUtPcUFMamtmSlZFVEFEQWF6ay9ReERhUlJzeDNNWWw2SU5UR1psSDl5ZjV4?=
 =?utf-8?B?Mm1kcGtPc2JJRHRxMWNoUDBZV1BHZnRjSHZkLzJkeVB2NmlHbzI3UzU1Q1du?=
 =?utf-8?B?YU14SklCeitMZjhzclZkNDZKaDIyN3NIQzVham4xT0JvTUUxaEUyVERBVFJB?=
 =?utf-8?B?R1AwZEdjSC9LcW5WNmE4ZzNtcWxtUGxYbi8vRkt5c05WVTBPZWdvS1hYUVlN?=
 =?utf-8?B?NTlqK3Z4VXhOc3VKby9MOVRGeHBZQmUvdkhqbTdYY1VyNFFLOHZkUlArNkRI?=
 =?utf-8?B?Nm0zdGdFTFhtdmpzbGlKTkxmZDY1YjdCVVZ5eHZPbE5YTGhhSldZcW1TK0Jo?=
 =?utf-8?B?aGplaWtSZUJIeDhOZUxtOUFpeXF0OElMblJvUG55OGRYVENIR3JRb1RteGRa?=
 =?utf-8?B?QlZTVldhU0N0VERkVEl5d1NvRjNBdmVSZzN2ZU56WkRqdjV3aEwzc0h3bU9h?=
 =?utf-8?B?c2MxbkdGeHJ2akQ1cm5rbnMzazJKbUVlU2NjdWgvZWlPWGFPY0c3MmRoeDdl?=
 =?utf-8?B?eGxnWHA1dDVMZXRld0pGbWwzMVh2dVV0ZktZazJsTDlEQXQzY3VTZVRKNVZ1?=
 =?utf-8?B?WkNtSXlHSnlXcktjU2J4Ti9UQU1aUGh4eFZudHVLdm9USHVhRHZub0wwV2NG?=
 =?utf-8?B?elo3OExlUXhXcmpuaVV5TUZXODVxSjBRN2c4cnFmRTExeUlLWWFpb2xnUEZr?=
 =?utf-8?B?L0NBN0JRcVRrK3lvZ3d2Q3hueER6S2JOSEJ1Yy9RK3RRQlZGRzk5cmY0RHBC?=
 =?utf-8?B?Vm5ZVis4dUd1RGxTMVlTTHMwWWljcGM3ZGJBcGFqd1JjUE0wR2xtdEV4WGFk?=
 =?utf-8?B?VEY3aW9zazhOVFJWc1V6UmthdW5VNW1SbWRkRnNIM1V3YzZJWWJ2VE9UNEcz?=
 =?utf-8?B?Rzl3ZnFxK3NVdVF4dG92SjR5TkcyY0FJR2RFakh6TTRHV3hacjlEZ2NyNDNy?=
 =?utf-8?B?b2pTQ010S0hUNm5zSnNtN2NYMjUzcDUranVJZVZwbTBoVHdIMWNETy8yakVt?=
 =?utf-8?B?Z0creU5Qd0V6Zi9hRVd0c2hSQnF1R2cxMEtoQlYzUS9HTkRGVU1PYlFlUHla?=
 =?utf-8?B?Qi8vNlcxTUZDODZtWG4zV0VkK2JKOVl6Y3hTYzM5cHQwQWhIL2hzK05rMWxI?=
 =?utf-8?Q?DNfA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 247ad074-2583-4cf5-bbb2-08dba2583569
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2023 15:06:33.9743 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BTGA9IN7FPQMeWmZGQ6aZLeEY/a/wfNSeVU8joGDA3hWILHteq5rqrhWsV5js084xtuxqWyAT4Atza5GDr22pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8748
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 Philip Yang <Philip.Yang@amd.com>, Felix Kuehling <felix.kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBkcmktZGV2ZWwgPGRyaS1kZXZl
bC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIERhdmUNCj4gQWly
bGllDQo+IFNlbnQ6IEF1Z3VzdCAyMCwgMjAyMyA2OjIxIFBNDQo+IFRvOiBaZW5nLCBPYWsgPG9h
ay56ZW5nQGludGVsLmNvbT4NCj4gQ2M6IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGlu
dGVsLmNvbT47IFRob21hcyBIZWxsc3Ryw7ZtDQo+IDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4Lmlu
dGVsLmNvbT47IFBoaWxpcCBZYW5nIDxQaGlsaXAuWWFuZ0BhbWQuY29tPjsgRmVsaXgNCj4gS3Vl
aGxpbmcgPGZlbGl4Lmt1ZWhsaW5nQGFtZC5jb20+OyBXZWx0eSwgQnJpYW4gPGJyaWFuLndlbHR5
QGludGVsLmNvbT47IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC14
ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFZpc2h3YW5hdGhhcHVyYSwNCj4gTmlyYW5qYW5hIDxu
aXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbT47IENocmlzdGlhbiBLw7ZuaWcNCj4g
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gU3ViamVjdDogUmU6IEltcGxlbWVudCBzdm0g
d2l0aG91dCBCTyBjb25jZXB0IGluIHhlIGRyaXZlcg0KPiANCj4gT24gVGh1LCAxNyBBdWcgMjAy
MyBhdCAxMjoxMywgWmVuZywgT2FrIDxvYWsuemVuZ0BpbnRlbC5jb20+IHdyb3RlOg0KPiA+DQo+
ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogRGF2ZSBBaXJsaWUg
PGFpcmxpZWRAZ21haWwuY29tPg0KPiA+ID4gU2VudDogQXVndXN0IDE2LCAyMDIzIDY6NTIgUE0N
Cj4gPiA+IFRvOiBGZWxpeCBLdWVobGluZyA8ZmVsaXgua3VlaGxpbmdAYW1kLmNvbT4NCj4gPiA+
IENjOiBaZW5nLCBPYWsgPG9hay56ZW5nQGludGVsLmNvbT47IENocmlzdGlhbiBLw7ZuaWcNCj4g
PiA+IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+OyBUaG9tYXMgSGVsbHN0csO2bQ0KPiA+ID4g
PHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPjsgQnJvc3QsIE1hdHRoZXcNCj4gPiA+
IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT47IG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVs
LmNvbTsNCj4gPiA+IFZpc2h3YW5hdGhhcHVyYSwgTmlyYW5qYW5hIDxuaXJhbmphbmEudmlzaHdh
bmF0aGFwdXJhQGludGVsLmNvbT47IFdlbHR5LA0KPiA+ID4gQnJpYW4gPGJyaWFuLndlbHR5QGlu
dGVsLmNvbT47IFBoaWxpcCBZYW5nIDxQaGlsaXAuWWFuZ0BhbWQuY29tPjsgaW50ZWwtDQo+ID4g
PiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4gPiA+IFN1YmplY3Q6IFJlOiBJbXBsZW1lbnQgc3ZtIHdpdGhvdXQgQk8gY29uY2VwdCBp
biB4ZSBkcml2ZXINCj4gPiA+DQo+ID4gPiBPbiBUaHUsIDE3IEF1ZyAyMDIzIGF0IDA4OjE1LCBG
ZWxpeCBLdWVobGluZyA8ZmVsaXgua3VlaGxpbmdAYW1kLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiA+
DQo+ID4gPiA+IE9uIDIwMjMtMDgtMTYgMTM6MzAsIFplbmcsIE9hayB3cm90ZToNCj4gPiA+ID4g
PiBJIHNwb2tlIHdpdGggVGhvbWFzLiBXZSBkaXNjdXNzZWQgdHdvIGFwcHJvYWNoZXM6DQo+ID4g
PiA+ID4NCj4gPiA+ID4gPiAxKSBtYWtlIHR0bV9yZXNvdXJjZSBhIGNlbnRyYWwgcGxhY2UgZm9y
IHZyYW0gbWFuYWdlbWVudCBmdW5jdGlvbnMNCj4gc3VjaCBhcw0KPiA+ID4gZXZpY3Rpb24sIGNn
cm91cCBtZW1vcnkgYWNjb3VudGluZy4gQm90aCB0aGUgQk8tYmFzZWQgZHJpdmVyIGFuZCBCTy1s
ZXNzDQo+IFNWTQ0KPiA+ID4gY29kZXMgY2FsbCBpbnRvIHR0bV9yZXNvdXJjZV9hbGxvYy9mcmVl
IGZ1bmN0aW9ucyBmb3IgdnJhbSBhbGxvY2F0aW9uL2ZyZWUuDQo+ID4gPiA+ID4gICAgICAqVGhp
cyB3YXkgQk8gZHJpdmVyIGFuZCBTVk0gZHJpdmVyIHNoYXJlcyB0aGUgZXZpY3Rpb24vY2dyb3Vw
IGxvZ2ljLCBubw0KPiA+ID4gbmVlZCB0byByZWltcGxtZW50IExSVSBldmljdGlvbiBsaXN0IGlu
IFNWTSBkcml2ZXIuIENncm91cCBsb2dpYyBzaG91bGQgYmUgaW4NCj4gPiA+IHR0bV9yZXNvdXJj
ZSBsYXllci4gK01hYXJ0ZW4uDQo+ID4gPiA+ID4gICAgICAqdHRtX3Jlc291cmNlIGlzIG5vdCBh
IHBlcmZlY3QgbWF0Y2ggZm9yIFNWTSB0byBhbGxvY2F0ZSB2cmFtLiBJdCBpcyBzdGlsbA0KPiBh
DQo+ID4gPiBiaWcgb3ZlcmhlYWQuIFRoZSAqYm8qIG1lbWJlciBvZiB0dG1fcmVzb3VyY2UgaXMg
bm90IG5lZWRlZCBmb3IgU1ZNIC0NCj4gdGhpcw0KPiA+ID4gbWlnaHQgZW5kIHVwIHdpdGggaW52
YXNpdmUgY2hhbmdlcyB0byB0dG0uLi5uZWVkIHRvIGxvb2sgaW50byBtb3JlIGRldGFpbHMNCj4g
PiA+ID4NCj4gPiA+ID4gT3ZlcmhlYWQgaXMgYSBwcm9ibGVtLiBXZSdkIHdhbnQgdG8gYmUgYWJs
ZSB0byBhbGxvY2F0ZSwgZnJlZSBhbmQgZXZpY3QNCj4gPiA+ID4gbWVtb3J5IGF0IGEgc2ltaWxh
ciBncmFudWxhcml0eSBhcyBvdXIgcHJlZmVycmVkIG1pZ3JhdGlvbiBhbmQgcGFnZQ0KPiA+ID4g
PiBmYXVsdCBncmFudWxhcml0eSwgd2hpY2ggZGVmYXVsdHMgdG8gMk1CIGluIG91ciBTVk0gaW1w
bGVtZW50YXRpb24uDQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAyKSBz
dm0gY29kZSBhbGxvY2F0ZSBtZW1vcnkgZGlyZWN0bHkgZnJvbSBkcm0tYnVkZHkgYWxsb2NhdG9y
LCBhbmQNCj4gZXhwb3NlDQo+ID4gPiBtZW1vcnkgZXZpY3Rpb24gZnVuY3Rpb25zIGZyb20gYm90
aCB0dG0gYW5kIHN2bSBzbyB0aGV5IGNhbiBldmljdCBtZW1vcnkNCj4gPiA+IGZyb20gZWFjaCBv
dGhlci4gRm9yIGV4YW1wbGUsIGV4cG9zZSB0aGUgdHRtX21lbV9ldmljdF9maXJzdCBmdW5jdGlv
bg0KPiBmcm9tDQo+ID4gPiB0dG0gc2lkZSBzbyBobW0vc3ZtIGNvZGUgY2FuIGNhbGwgaXQ7IGV4
cG9zZSBhIHNpbWlsYXIgZnVuY3Rpb24gZnJvbSBzdm0gc2lkZQ0KPiBzbw0KPiA+ID4gdHRtIGNh
biBldmljdCBobW0gbWVtb3J5Lg0KPiA+ID4gPg0KPiA+ID4gPiBJIGxpa2UgdGhpcyBvcHRpb24u
IE9uZSB0aGluZyB0aGF0IG5lZWRzIHNvbWUgdGhvdWdodCB3aXRoIHRoaXMgaXMgaG93DQo+ID4g
PiA+IHRvIGdldCBzb21lIHNlbWJsYW5jZSBvZiBmYWlybmVzcyBiZXR3ZWVuIHRoZSB0d28gdHlw
ZXMgb2YgY2xpZW50cy4NCj4gPiA+ID4gQmFzaWNhbGx5IGhvdyB0byBjaG9vc2Ugd2hhdCB0byBl
dmljdC4gQW5kIHdoYXQgc2hhcmUgb2YgdGhlIGF2YWlsYWJsZQ0KPiA+ID4gPiBtZW1vcnkgZG9l
cyBlYWNoIHNpZGUgZ2V0IHRvIHVzZSBvbiBhdmVyYWdlLiBFLmcuIGFuIGlkbGUgY2xpZW50IG1h
eSBnZXQNCj4gPiA+ID4gYWxsIGl0cyBtZW1vcnkgZXZpY3RlZCB3aGlsZSBhIGJ1c3kgY2xpZW50
IG1heSBnZXQgYSBiaWdnZXIgc2hhcmUgb2YgdGhlDQo+ID4gPiA+IGF2YWlsYWJsZSBtZW1vcnku
DQo+ID4gPg0KPiA+ID4gSSdkIGFsc28gbGlrZSB0byBzdWdnZXN0IHdlIHRyeSB0byB3cml0ZSBh
bnkgbWFuYWdlbWVudC9nZW5lcmljIGNvZGUNCj4gPiA+IGluIGRyaXZlciBhZ25vc3RpYyB3YXkg
YXMgbXVjaCBhcyBwb3NzaWJsZSBoZXJlLiBJIGRvbid0IHJlYWxseSBzZWUNCj4gPiA+IG11Y2gg
aHcgZGlmZmVyZW5jZSBzaG91bGQgYmUgaW5mbHVlbmNpbmcgaXQuDQo+ID4gPg0KPiA+ID4gSSBk
byB3b3JyeSBhYm91dCBoYXZpbmcgZWZmZWN0aXZlbHkgMiBMUlVzIGhlcmUsIHlvdSBjYW4ndCBy
ZWFsbHkgaGF2ZQ0KPiA+ID4gdHdvICJsZWFzdHMiLg0KPiA+ID4NCj4gPiA+IExpa2UgaWYgd2Ug
aGl0IHRoZSBzaHJpbmtlciBwYXRocyB3aG8gZ29lcyBmaXJzdD8gZG8gd2Ugc2hyaW5rIG9uZQ0K
PiA+ID4gb2JqZWN0IGZyb20gZWFjaCBzaWRlIGluIHR1cm4/DQo+ID4NCj4gPiBPbmUgd2F5IHRv
IHNvbHZlIHRoaXMgZmFpcm5lc3MgcHJvYmxlbSBpcyB0byBjcmVhdGUgYSBkcml2ZXIgYWdub3N0
aWMNCj4gZHJtX3ZyYW1fbWdyLiBNYWludGFpbiBhIHNpbmdsZSBMUlUgaW4gZHJtX3ZyYW1fbWdy
LiBNb3ZlIHRoZSBtZW1vcnkNCj4gZXZpY3Rpb24vY2dyb3VwcyBtZW1vcnkgYWNjb3VudGluZyBs
b2dpYyBmcm9tIHR0bV9yZXNvdXJjZSBtYW5hZ2VyIHRvDQo+IGRybV92cmFtX21nci4gQm90aCBC
Ty1iYXNlZCBkcml2ZXIgYW5kIFNWTSBkcml2ZXIgY2FsbHMgdG8gZHJtX3ZyYW1fbWdyIHRvDQo+
IGFsbG9jYXRlL2ZyZWUgbWVtb3J5Lg0KPiA+DQo+ID4gSSBhbSBub3Qgc3VyZSB3aGV0aGVyIHRo
aXMgbWVldHMgdGhlIDJNIGFsbG9jYXRlL2ZyZWUvZXZpY3QgZ3JhbnVsYXJpdHkNCj4gcmVxdWly
ZW1lbnQgRmVsaXggbWVudGlvbmVkIGFib3ZlLiBTVk0gY2FuIGFsbG9jYXRlIDJNIHNpemUgYmxv
Y2tzLiBCdXQgQk8NCj4gZHJpdmVyIHNob3VsZCBiZSBhYmxlIHRvIGFsbG9jYXRlIGFueSBhcmJp
dHJhcnkgc2l6ZWQgYmxvY2tzIC0gU28gdGhlIGV2aWN0aW9uIGlzIGFsc28NCj4gYXJiaXRyYXJ5
IHNpemUuDQo+ID4NCj4gPiA+DQo+ID4gPiBBbHNvIHdpbGwgd2UgaGF2ZSBzeXN0ZW1zIHdoZXJl
IHdlIGNhbiBleHBvc2Ugc3lzdGVtIFNWTSBidXQgdXNlcnNwYWNlDQo+ID4gPiBtYXkgY2hvb3Nl
IHRvIG5vdCB1c2UgdGhlIGZpbmUgZ3JhaW5lZCBTVk0gYW5kIHVzZSBvbmUgb2YgdGhlIG9sZGVy
DQo+ID4gPiBtb2Rlcywgd2lsbCB0aGF0IHBhdGggZ2V0IGVtdWxhdGVkIG9uIHRvcCBvZiBTVk0g
b3IgdXNlIHRoZSBCTyBwYXRocz8NCj4gPg0KPiA+DQo+ID4gSWYgYnkgIm9sZGVyIG1vZGVzIiB5
b3UgbWVhbnQgdGhlIGdlbV9ib19jcmVhdGUgKHN1Y2ggYXMgeGVfZ2VtX2NyZWF0ZSBvcg0KPiBh
bWRncHVfZ2VtX2NyZWF0ZSksIHRoZW4gdG9kYXkgYm90aCBhbWQgYW5kIGludGVsIGltcGxlbWVu
dCB0aG9zZQ0KPiBpbnRlcmZhY2VzIHVzaW5nIEJPIHBhdGguIFdlIGRvbid0IGhhdmUgYSBwbGFu
IHRvIGVtdWxhdGUgdGhhdCBvbGQgbW9kZSBvbiB0b3BlDQo+IG9mIFNWTSwgYWZhaWN0Lg0KPiAN
Cj4gSSdtIG5vdCBzdXJlIGhvdyB0aGUgb2xkZXIgbW9kZXMgbWFuaWZlc3QgaW4gdGhlIGtlcm5l
bCBJIGFzc3VtZSBhcyBibw0KPiBjcmVhdGVzIChidXQgdGhleSBtYXkgdXNlIHVzZXJwdHIpLCBT
Vk0gaXNuJ3QgYSBzcGVjaWZpYyB0aGluZywgaXQncyBhDQo+IGdyb3VwIG9mIDMgdGhpbmdzLg0K
PiANCj4gMSkgY29hcnNlLWdyYWluZWQgU1ZNIHdoaWNoIEkgdGhpbmsgaXMgQk8NCj4gMikgZmlu
ZS1ncmFpbmVkIFNWTSB3aGljaCBpcyBwYWdlIGxldmVsDQo+IDMpIGZpbmUtZ3JhaW5lZCBzeXN0
ZW0gU1ZNIHdoaWNoIGlzIEhNTQ0KPiANCj4gSSBzdXBwb3NlIEknbSBhc2tpbmcgYWJvdXQgdGhl
IHByZXZpb3VzIHZlcnNpb25zIGFuZCBob3cgdGhleSB3b3VsZA0KPiBvcGVyYXRlIGluIGEgc3lz
dGVtIFNWTSBjYXBhYmxlIHN5c3RlbS4NCg0KSSBnb3QgeW91ciBxdWVzdGlvbiBub3cuIA0KDQpB
cyBJIHVuZGVyc3RhbmQgaXQsIHRoZSBzeXN0ZW0gU1ZNIHByb3ZpZGVzIHNpbWlsYXIgZnVuY3Rp
b25hbGl0eSBhcyBCTy1iYXNlZCBTVk0gKGkuZS4sIHNoYXJlIHZpcnR1YWwgYWRkcmVzcyBzcGFj
ZSBiL3QgY3B1IGFuZCBncHUgcHJvZ3JhbSwgbm8gZXhwbGljaXQgbWVtb3J5IHBsYWNlbWVudCBm
b3IgZ3B1IHByb2dyYW0pLCBidXQgdGhleSBoYXZlIGRpZmZlcmVudCB1c2VyIGludGVyZmFjZSAo
bWFsbG9jLCBtbWFwIHZzIGJvIGNyZWF0ZSwgdm0gYmluZCkuDQoNCkZyb20gZnVuY3Rpb25hbGl0
eSBwZXJzcGVjdGl2ZSwgb24gYSBzeXN0ZW0gU1ZNIGNhcGFibGUgc3lzdGVtLCB3ZSBkb24ndCBu
ZWVkICMxLyMyLiBPbmNlICMzIGlzIGltcGxlbWVudGVkIGFuZCB0dXJuZWQgb3V0IGJlIGFzIHBl
cmZvcm1hbnQgYXMgIzEvIzIsIHdlIGNhbiBhc2sgdXNlciBzcGFjZSB0byBzd2l0Y2ggdG8gIzMu
DQoNCkFzIGZhciBhcyBJIGtub3csIEFNRCBkb2Vzbid0IGhhdmUgIzEvIzIgLSB0aGVpciBCTy1i
YXNlZCBkcml2ZXIgKnJlcXVpcmVzKiBhbGwgdmFsaWQgR1BVIHZpcnR1YWwgYWRkcmVzcyBiZSBt
YXBwZWQgdG8gR1BVIHBhZ2UgdGFibGUgKmJlZm9yZSogR1BVIGtlcm5lbCBzdWJtaXNzaW9uLCBh
a2EgYSBHUFUgcGFnZSBmYXVsdCBpcyB0cmVhdGVkIGFzIGZhdGFsLiBGZWxpeCBwbGVhc2UgZml4
IG1lLCBhcyBteSBBTUQga25vd2xlZGdlIGlzIGZhZGluZyBhd2F5Li4uDQoNCkZyb20gaW50ZXJm
YWNlIHBlcnNwZWN0aXZlLCBpLmUuLCB0byBrZWVwIFVNRCB3aGljaCB1c2luZyAjMS8jMiBjb250
aW51ZSB0byBydW4gd2l0aG91dCBtb2RpZmljYXRpb24sIHdlIG5lZWQgIzEvIzIgdG8gY29udGlu
dWUgZXhpc3QuDQoNClNob3VsZCB3ZSBlbXVsYXRlICMxLyMyIG9uIHRvcCBvZiAjMz8gSSBmZWVs
IHRoZSBCTy1iYXNlZCBtZW1vcnkgbWFuYWdlbWVudCBhbmQgdGhlIHN0cnVjdCBwYWdlL2htbSBi
YXNlZCBtZW1vcnkgbWFuYWdlbWVudCBhcmUgcXVpdGUgZGlmZmVyZW50IGRlc2lnbiBwaGlsb3Nv
cGh5LiBUcnlpbmcgdG8gZW11bGF0ZSBvbmUgb24gdG9wIG9mIGFub3RoZXIgY2FuIHJ1biBpbnRv
IHNlcmlvdXMgZGlmZmljdWx0eS4gRm9yIGV4YW1wbGUsIGhvdyBkbyB3ZSBlbXVsYXRlIGEgdm1f
YmluZCBvbiB0b3Agb2YgIzM/IFJlbWVtYmVyIGZvciAjMS8jMiB2aXJ0dWFsIGFkZHJlc3Mgc3Bh
Y2UgaXMgbWFuYWdlZCBieSB1c2VyIHNwYWNlIHdoaWxlICMzIHZpcnR1YWwgYWRkcmVzcyBzcGFj
ZSBpcyBtYW5hZ2VkIGJ5IGtlcm5lbCBjb3JlIG1tICh2bWEgc3RydWN0Li4uKS4gSXQgaXMgYSBo
YXJkIGNvbmZsaWN0IGhlcmUuLi4NCg0KVGhhbmtzIGFnYWluIGZvciB0aGUgZ3JlYXQgcXVlc3Rp
b24hDQpPYWsgDQoNCj4gDQo+IERhdmUuDQo+ID4NCj4gPiBUaGFua3MsDQo+ID4gT2FrDQo+ID4N
Cj4gPiA+DQo+ID4gPiBEYXZlLg0K
