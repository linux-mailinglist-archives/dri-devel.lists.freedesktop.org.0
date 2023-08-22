Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B28783FCB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 13:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F057F10E320;
	Tue, 22 Aug 2023 11:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CA310E320;
 Tue, 22 Aug 2023 11:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692704628; x=1724240628;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vStywmuEb/M/+6meciON4OhrM6slOevPhzcThXsdlBM=;
 b=NStKFtdJrlPOrQYYZ36uOv9fWVOoySp3OM9RazWnv7vYeH2zw4l2cAd7
 c7eztSIKYmxojHEJO11rNdZjLQjR4GvzoodHk4BH9MgirI3KDjakSbaQl
 9WW8gIh2AAn6CrW6fMzQzZS1asliyFxn+P75UvkHhgxJYqjdD6GWff2DV
 egEwxfeCkvPWQTedvLs5pwAlaSCSGCB7ZJQaFfCHj+Zahgr6Lk/0etFYd
 Tl7IduYS0CjTEKoKzQFmakpTYTLlVD7ZV5FoJhSLs5ynQVXZu8g1I4GpS
 qSoQ4IqidPNpYglgxkbj5C66ZnQXCeWB2yJSiQoYcJ8MA+OXMICwQmlfB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="372751633"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="372751633"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 04:43:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="739277297"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="739277297"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 22 Aug 2023 04:43:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 04:43:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 04:43:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 04:43:46 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 04:43:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lit3LoEWexXztNy4S6Z20LfXd/5NuK/oRq285bjC3mkAiWc2Sqk2L8IfEBx5QnGePdl7xlHXlKZgAo4xy39lVUYjGByrgEmz9bHWCMmOoc2/ROtMMqgHSgx/6hu6Esgvvsnk0Ygvgrphin9Rt/YKZzQ8lUPIu/hygW+COWoyY0TofHNocj8uvQK89KQEN5mN8HNGaQDP6jeYxSU48IPL71ImlZsJzrfMoGZ0Dg3Ku/bBAjjf1iFQOyFhbAcXlJowfnenGW3bFTcZFFJc1JfY1JWuxbpipnQwY5Dwdf6h1/lc6NlOeDB1/JOz7gWBpXSfV2CdzCMTH+A//YW7AImh9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vStywmuEb/M/+6meciON4OhrM6slOevPhzcThXsdlBM=;
 b=JS2uG8Qw8vRD469YNmXE0BmGCa7U4oZt/2dO517ul4afwNMhWvgaWbZXci2k7Beq43dyfsebiXFbYL4GvqnExqXzmRRz8YSygZJCt3a3c9teXe46pOGzkRGZ/2eOc2z2yynxuYiM1Qz4v1RgrvewSNSA86K2/La+KonJ1BpVWLuCO9gsnBI9endq1d+Hvkh51dkOtPT0Vmh6zLJdiHxOiZxR6kh9cAbsYOko+4zEnti5THFIjk6Bz4/xA0J5tBPrnJ2HF+BIWtjHHIhideafmh0ZglhffA7F9vhb9cCTOeC0GolzPJpf0vWgVBawmeOhXEV+eThWErvm11/AuTyOBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 11:43:34 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::1b87:b80a:6e3b:c2af]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::1b87:b80a:6e3b:c2af%4]) with mapi id 15.20.6699.020; Tue, 22 Aug 2023
 11:43:34 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Felix Kuehling <felix.kuehling@amd.com>, "Zeng, Oak" <oak.zeng@intel.com>, 
 Dave Airlie <airlied@gmail.com>
Subject: RE: Implement svm without BO concept in xe driver
Thread-Topic: Implement svm without BO concept in xe driver
Thread-Index: AQHZ1Gd258IGt+Nx/E2q6Jp6mN86Ba/1O04AgAD2OBA=
Date: Tue, 22 Aug 2023 11:43:33 +0000
Message-ID: <IA1PR11MB64181677E779F3541701FB15C11FA@IA1PR11MB6418.namprd11.prod.outlook.com>
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
 <SA1PR11MB69911D8AB895EEC13A64EBCE921EA@SA1PR11MB6991.namprd11.prod.outlook.com>
 <SA1PR11MB69912B9C5363E40A50B74B35921EA@SA1PR11MB6991.namprd11.prod.outlook.com>
 <637ce3f5-a7a9-6a1f-812a-5987211f84f7@amd.com>
 <SA1PR11MB6991E632AFE2684CEC231321921EA@SA1PR11MB6991.namprd11.prod.outlook.com>
 <a9d08612-c402-68fe-b625-3148e4ce3841@amd.com>
In-Reply-To: <a9d08612-c402-68fe-b625-3148e4ce3841@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SJ0PR11MB4989:EE_
x-ms-office365-filtering-correlation-id: 2132c508-dc05-4773-3a63-08dba30503f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rff8YcJJGHP/W7RVIUoDz4K9tJzE07BhyXB7Zzhgc58bspQ0qGTyS4aaB5NtnkGjf1xOF4pXQ5+1nN65RKjaN5U0S4t9/b11n56R6oHYWVJXweqTTRYmbxsBnYQrpRbDjR9nt+EFREf85XDHU4gT4zBVWRMqj4AiqaetlnqfYlPQaWALzBKu9g4n4LLh9xiYr5q5cr/nGslRUECK+5B5uIeDIE7XcG2bI8U+q1rdpky5MY8gfdnym0y/XwL3yt4pzDtfmDDF+OIJhybLi14L+3eTNma4KHTE59UZCkslFMtHgOIRpHNSYwEEiSMoBeEpzVv10Y6+lbfPBIOAPuP2+A5LsLfygG9sqUG1VjD1P5QKiO/zuX5lWWB7woQDe2fn5VPlDe+d43qzZXxLfp0Quc+ujR/G917n7SLN2Ipjd/jZALxiyN/t+eZEna1HXee8klE8+9W6LFR1plwboB/PwE09+1wTjLRJnhVDJZ3NqGpfZ/enlw0nObIjKOE6YBGUslPMLLjAUQ+e7fT4aUwdvlPzvbo0RuRpQM4O2tgE/P/zEaNj76Ew4wQAd4FmCYmVQ4LUslf+D4xMsWgJRmLF9HHX2LdMaRIZWXk0PF/vV+ndAo/pVcb1IK/nHFSVMFnr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199024)(1800799009)(186009)(2906002)(66574015)(83380400001)(6506007)(38100700002)(7696005)(5660300002)(52536014)(26005)(33656002)(38070700005)(86362001)(8676002)(8936002)(82960400001)(4326008)(9686003)(76116006)(316002)(66476007)(66446008)(66556008)(54906003)(66946007)(64756008)(110136005)(478600001)(122000001)(55016003)(71200400001)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUt2UURFY2NEYWFWbGJuRStpOXJYZ1lFb3Vwc2xJdTEvYlJIRjlCNVd6SCtT?=
 =?utf-8?B?cTIyc0RWSFB3S2RJL3NDZTAvRDRlNHpBNVNzcEh2Q1VrNCs0L25MdVpvN2E2?=
 =?utf-8?B?RmM5RlF1bm4zMHV4bGVlaUpiR2YzbmhCNHlVMDNTM1R3YXJ3Z2dvSkJDSFFQ?=
 =?utf-8?B?WHg5cVN5R0ZtV0N0R1A0ejJkVUFncTQrV1Y1dzVFempXalNEZEpxWkEyN0JX?=
 =?utf-8?B?aVBaVlNmZUtGTFBQR2Z0WkRKaHJoTW1EbUsvRGpOY1dCTDJ0ek9TWm5KRml0?=
 =?utf-8?B?TFY0TDI5YjNheEJERjh4cHdWb0p5TE9OcFBWRlZwWVZOb1dWWW44THkvVkUw?=
 =?utf-8?B?UzUyOXU0WHV5ck9Ydzl3UjMwRm5KenJSU05lcExVbzFrM3NUZy9iMGhJVkNp?=
 =?utf-8?B?NENVdDJHdEhITUF1SWR4R1p0ZStoSXVzQnlYQnVWZ2dDam5EUUJ1RkdPSDN5?=
 =?utf-8?B?U3lQK1dJeGxRQVFkVkdNT0dsTVFMQS9CNWkyZzJ2cERqTlMxTEpQVWFqdFVT?=
 =?utf-8?B?VGwzUHFyb0l0d2tZbnRzaFNReWN5akdiSzg5YnIzOWlqZGdjWEFtSkE5NytJ?=
 =?utf-8?B?UVd1Q0lvTUtSOC95TFRaK3RFR1lWbGVXYkQ0V0lLUzlaQzA1bE52TjB3UE40?=
 =?utf-8?B?Z2x4TDV1Y2k0VmgxdXZvQ2hiVFdoN05BNEUwcUFqR05aZHBycG1DM0dod09r?=
 =?utf-8?B?WTBPVkNkZG9PQXNJUXlHNEswTFFhT05yczlCNkR5VUlJazRlRG5ITlVSdzVv?=
 =?utf-8?B?bkxGWDdyM2gxMWs4bTY4SnIzdG9RQVlPbHNtZ2NlbjRZT3o2WjQvUk9Kc2Ro?=
 =?utf-8?B?dTd3S3hFZ29XVnNFT1lJSThJcndpeEFleFc5aDBGYjRLUHFlbVJaOEtuVXhh?=
 =?utf-8?B?ZTVjLzd4ZDJHNHAwUW9keU5iNTBnb1hhMjJXeUxOT2ZabUU3OCttK2FGKzJ4?=
 =?utf-8?B?dkJLc1lPaWpzQWNGWENraG0rNHRSTjZrWThaM0dBSlhWS0lWVytHYjJrbjFt?=
 =?utf-8?B?S1ZkNmhBV0lXeU1HZS9iRnVONGZMelNwRWk4UFlRVWY5cUlBR2UxZWJRKzFD?=
 =?utf-8?B?SVpoWUZOZ081eXRxOWF6WHFsY3k4UjQwZm1PNjRlemJpS3lTOHM3NWhaRXJQ?=
 =?utf-8?B?SldsMlhQbVJneUJuL0dCVVZkV0d2Y01LNWhzSDUwOExjeEVacGFrbTgyU3dw?=
 =?utf-8?B?azE5RUpwR3M3S2o0TGdIKzRpcjBxWkU0Nmw3NWhHMGZpc3VvcGp2WkZ6bERR?=
 =?utf-8?B?c0ZIWkpzRk5iaXk4UllmSnVHRUVoTU1tWUpoTXY2Z1hQUWNldUV4RUJVODZQ?=
 =?utf-8?B?bUsveS9QbVhNeXJXcXdRWkQ5SCtIc0FWMjNTQ052dFpRYkVIeHZBY29CWHhi?=
 =?utf-8?B?R1ZvcUw2dzluT2xiZDUwdkVNaU9qS3VqdUJad3BtZTNmVnBET28rZldPK01p?=
 =?utf-8?B?RXpFREdwK3NiNjUzcVBQaXBVTi8xQ1RTNncxQVd3TlFGK3NOUDBtUzIzOHlq?=
 =?utf-8?B?K2dZVTZ6WEVHTGQ5TmNNdnIyWVArUGt4SGlHTkhZRGN3dEZ6UTRaVWdVaTh0?=
 =?utf-8?B?QjE3SG9aWmU2NkdocUJOYlFTWVkrdmxraFloNnNjaGJmOGRNUXQzc2FaeVlu?=
 =?utf-8?B?aXVuRVEvdmQ4YWFEUUowWW01MjBGWXliUmlXVE45SzlzRTd3dUFqL0tuUkdN?=
 =?utf-8?B?TXFVc0VMSXQ1VjRjcnE2dEMzYy85L3RBOTROVUp1M1lEMUs5U1o4ak5aWXla?=
 =?utf-8?B?QTlXZi9VOEN1Ky8zY0RBQmV3Nzd3d1JVN1JxcnFIWis3Zkphck5vSlVoUWdy?=
 =?utf-8?B?WjFWWitGWEtXNW54MloyektwWEhjdzE0dldoZWloUWlzbE9SOWlwNTlHR2s2?=
 =?utf-8?B?alFtNlBONFprMkNxL2ZmNERYSnNkUXBIV2wydGw1NTdScjJIc0xwZERHViti?=
 =?utf-8?B?R1NJTFNsa2Iya25xWWlkbWljejBNNnRXeTVGblZ3VG4vNHUvZ2s4Z1NZVXlh?=
 =?utf-8?B?djV1MEFLZDBWVHpIUXhlV1pwWWxYUVpGSVpoNFdtNXArMEl2c1pBcFZhUk9W?=
 =?utf-8?B?OVd4UDJuTVlsZk5rVFNFaXpTS3YySmZNTXRURnJmV0h4cUpadEM3aXlaWFFL?=
 =?utf-8?Q?g6P+g3RyZ+kwYq+0XeYH8wDIY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2132c508-dc05-4773-3a63-08dba30503f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 11:43:33.9168 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hH/VRQXsZ2wwkD/Jent/khvTbntBLE96gcgnd+f3AI1zip8RzxLBBgiRtTKLDVn0BmqIaYfkKuAbLRg8FjevApFl8U2LMtmUAwy9ue6FbSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4989
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
 Philip Yang <Philip.Yang@amd.com>, "Welty, Brian" <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogRmVsaXggS3VlaGxpbmcgPGZlbGl4
Lmt1ZWhsaW5nQGFtZC5jb20+DQo+U2VudDogTW9uZGF5LCBBdWd1c3QgMjEsIDIwMjMgNDo1NyBQ
TQ0KPlRvOiBaZW5nLCBPYWsgPG9hay56ZW5nQGludGVsLmNvbT47IERhdmUgQWlybGllIDxhaXJs
aWVkQGdtYWlsLmNvbT4NCj5DYzogQnJvc3QsIE1hdHRoZXcgPG1hdHRoZXcuYnJvc3RAaW50ZWwu
Y29tPjsgVGhvbWFzIEhlbGxzdHLDtm0NCj48dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5j
b20+OyBQaGlsaXAgWWFuZyA8UGhpbGlwLllhbmdAYW1kLmNvbT47DQo+V2VsdHksIEJyaWFuIDxi
cmlhbi53ZWx0eUBpbnRlbC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0K
PkNocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT47IFZpc2h3YW5hdGhh
cHVyYSwgTmlyYW5qYW5hDQo+PG5pcmFuamFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPjsg
aW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPlJ1aGwsIE1pY2hhZWwgSiA8bWljaGFl
bC5qLnJ1aGxAaW50ZWwuY29tPg0KPlN1YmplY3Q6IFJlOiBJbXBsZW1lbnQgc3ZtIHdpdGhvdXQg
Qk8gY29uY2VwdCBpbiB4ZSBkcml2ZXINCj4NCj4NCj5PbiAyMDIzLTA4LTIxIDE1OjQxLCBaZW5n
LCBPYWsgd3JvdGU6DQo+Pj4gSSBoYXZlIHRob3VnaHQgYWJvdXQgZW11bGF0aW5nIEJPIGFsbG9j
YXRpb24gQVBJcyBvbiB0b3Agb2Ygc3lzdGVtIFNWTS4NCj4+PiBUaGlzIHdhcyBpbiB0aGUgY29u
dGV4dCBvZiBLRkQgd2hlcmUgbWVtb3J5IG1hbmFnZW1lbnQgaXMgbm90IHRpZWQgaW50bw0KPj4+
IGNvbW1hbmQgc3VibWlzc2lvbnMgQVBJcywgd2hpY2ggd291bGQgYWRkIGEgd2hvbGUgb3RoZXIg
bGF5ZXIgb2YNCj4+PiBjb21wbGV4aXR5LiBUaGUgbWFpbiB1bnNvbHZlZCAodW5zb2x2YWJsZT8p
IHByb2JsZW0gSSByYW4gaW50byB3YXMsIHRoYXQNCj4+PiB0aGVyZSBpcyBubyB3YXkgdG8gc2hh
cmUgU1ZNIG1lbW9yeSBhcyBETUFCdWZzLiBTbyB0aGVyZSBpcyBubyBnb29kDQo+d2F5DQo+Pj4g
dG8gc3VwcG9ydCBhcHBsaWNhdGlvbnMgdGhhdCBleHBlY3QgdG8gc2hhcmUgbWVtb3J5IGluIHRo
YXQgd2F5Lg0KPj4gR3JlYXQgcG9pbnQuIEkgYWxzbyBkaXNjdXNzZWQgdGhlIGRtYWJ1ZiB0aGlu
ZyB3aXRoIE1pa2UgKGNjJ2VkKS4gZG1hYnVmIGlzIGENCj5wYXJ0aWN1bGFyIHRlY2hub2xvZ3kg
Y3JlYXRlZCBzcGVjaWFsbHkgZm9yIHRoZSBCTyBkcml2ZXIgKGFuZCBvdGhlciBkcml2ZXIpIHRv
DQo+c2hhcmUgYnVmZmVyIGIvdCBkZXZpY2VzLiBIbW0vc3lzdGVtIFNWTSBkb2Vzbid0IG5lZWQg
dGhpcyB0ZWNobm9sb2d5Og0KPm1hbGxvYydlZCBtZW1vcnkgYnkgdGhlIG5hdHVyZSBpcyBhbHJl
YWR5IHNoYXJlZCBiL3QgZGlmZmVyZW50IGRldmljZXMgKGluDQo+b25lIHByb2Nlc3MpIGFuZCBD
UFUuIFdlIGp1c3QgY2FuIHNpbXBseSBzdWJtaXQgR1BVIGtlcm5lbCB0byBhbGwgZGV2aWNlcw0K
PndpdGggbWFsbG9jJ2VkIG1lbW9yeSBhbmQgbGV0IGttZCBkZWNpZGUgdGhlIG1lbW9yeSBwbGFj
ZW1lbnQgKHN1Y2ggYXMNCj5tYXAgaW4gcGxhY2Ugb3IgbWlncmF0ZSkuIE5vIG5lZWQgb2YgYnVm
ZmVyIGV4cG9ydC9pbXBvcnQgaW4gaG1tL3N5c3RlbQ0KPlNWTSB3b3JsZC4NCj4NCj5JIGRpc2Fn
cmVlLiBETUFCdWYgY2FuIGJlIHVzZWQgZm9yIHNoYXJpbmcgbWVtb3J5IGJldHdlZW4gcHJvY2Vz
c2VzLiBBbmQNCj5pdCBjYW4gYmUgdXNlZCBmb3Igc2hhcmluZyBtZW1vcnkgd2l0aCAzcmQtcGFy
dHkgZGV2aWNlcyB2aWEgUENJZSBQMlANCj4oZS5nLiBhIE1lbGxhbm94IE5JQykuIFlvdSBjYW5u
b3QgZWFzaWx5IGRvIHRoYXQgd2l0aCBtYWxsb2MnZWQgbWVtb3J5Lg0KPlBPU0lYIElQQyByZXF1
aXJlcyB0aGF0IHlvdSBrbm93IHRoYXQgeW91J2xsIGJlIHNoYXJpbmcgdGhlIG1lbW9yeSBhdA0K
PmFsbG9jYXRpb24gdGltZS4gSXQgYWRkcyBvdmVyaGVhZC4gQW5kIGJlY2F1c2UgaXQncyBmaWxl
LWJhY2tlZCwgaXQncw0KPmN1cnJlbnRseSBpbmNvbXBhdGlibGUgd2l0aCBtaWdyYXRpb24uIEFu
ZCBITU0gY3VycmVudGx5IGRvZXNuJ3QgaGF2ZSBhDQo+c29sdXRpb24gZm9yIFAyUC4gQW55IGFj
Y2VzcyBieSBhIGRpZmZlcmVudCBkZXZpY2UgY2F1c2VzIGEgbWlncmF0aW9uIHRvDQo+c3lzdGVt
IG1lbW9yeS4NCg0KSGV5IE9haywNCg0KSSB0aGluayB3ZSB3ZXJlIGRpc2N1c3NpbmcgdGhpcyBz
b2x1dGlvbiBpbiB0aGUgY29udGV4dCBvZiB1c2luZyB0aGUgUDJQX0RNQQ0KZmVhdHVyZS4gIFRo
aXMgaGFzIGFuIGFsbG9jYXRpb24gcGF0aCBhbmQgYSBkZXZpY2UgMiBkZXZpY2UgY2FwYWJpbGl0
aWVzLg0KDQpNaWtlDQoNCg0KPlJlZ2FyZHMsDQo+IMKgIEZlbGl4DQo+DQo+DQo+Pg0KPj4gU28g
eWVzIGZyb20gYnVmZmVyIHNoYXJpbmcgcGVyc3BlY3RpdmUsIHRoZSBkZXNpZ24gcGhpbG9zb3Bo
eSBpcyBhbHNvIHZlcnkNCj5kaWZmZXJlbnQuDQo+Pg0KPj4gVGhhbmtzLA0KPj4gT2FrDQo+Pg0K
