Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BCA83EE06
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jan 2024 16:44:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1DED10F27A;
	Sat, 27 Jan 2024 15:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D700110F27A;
 Sat, 27 Jan 2024 15:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706370236; x=1737906236;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OAkCPf3tAbv9WNEQ/P+yrdyfmPXytWXc/0ZFtoZpHJU=;
 b=HH2kaWTyEnennwOi1QHafeU4h9yEedrs/zJfHVV3lBUUYcucUwNbfD5V
 Me5wfhxfWB8r8iG1AaErrJ25O9mklMBOQ0CpdxHclT4l/HdrVstS3Ak2k
 o76tzYbwVicn8mVlokTmQJtLTMFQK0fcyxpbQPXX+zPvq4eQZM9NNIRns
 lTlHGM7sUPImqPrnvkuWFp3agz6JfHsJkZhZR9QKT/xLD3Z+9SX0QxWFe
 rHO2brzCEopQMo0m0olPvrRm55etnYansAp51aCnWdyzNR3ZLbFWQjZu7
 xMWqtGAgrKZRmZGBKJymtFkcvNOfxOfU9qb2WPr8Yw5/ueZPqoW1inwOZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9804525"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="9804525"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2024 07:43:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2970339"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2024 07:43:55 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 27 Jan 2024 07:43:54 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 27 Jan 2024 07:43:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sat, 27 Jan 2024 07:43:53 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 27 Jan 2024 07:43:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fvbWdRzrbdg1OR08lwJ8Xxiy0Wjy57zRrzCrrKyB3JuErUJvQ6Cq6XbX+MmV0hIgn50VW2TPtzRbmCI4M/+YRqXtaLXcVop/PYTzrrp2jA5d+LWG7dFO5SmG+q+Ipjl/YeiJeFnzqvB66+RhkZjUvSb1imb29Z/k0LdRLD9hBtCT4wRgXtEibii+LMcUZJo7zwgKiRovrtAEPyqlRPxicXwzBSRBcl4Z6wR1npXf1o3aDq+l42RoOupafq6nYK7d3oPduj5E9q4UD2odSQHEaZIdhLwQIsrl1zjDT/6c96QJvHe8slvDwBqVTeYFOx+40k+s+Tf4bT/V4bXesRlNaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAkCPf3tAbv9WNEQ/P+yrdyfmPXytWXc/0ZFtoZpHJU=;
 b=hm0Yf80z90qQAElUXOYtGtp+E6/MyzoAVpAFdFBpMYYI2XsVp7jS2szZrT+DWswOxw70gFQwZAUgbOXbC2jPqB4QuIKXrKeBixHd+bx5HP7vTa1vkRc52qQd0q8odeFMgYAisG19pK8oTExwlp8G45KQlXTWXJ2/aGXnIyWbcbhMu/L1ekNDgvo1Ba+SrvdLhNbRhOgBYhIUgjeJLcX7Bxeqkokik6vCkA2eUSrgaTB0+MbwPYyTkSHOVqS9cx8wkwfpvDvzrRbnf0WQ1kL/9nl6lBZWqO6+RDuapEAie3g8ZRy7Rrxmn6o8LB3rDUJeOxlUu3bgC7Bi06zj6Ipd7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by PH7PR11MB7514.namprd11.prod.outlook.com (2603:10b6:510:276::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.24; Sat, 27 Jan
 2024 15:43:46 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::b8db:cc2d:d64f:f7de]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::b8db:cc2d:d64f:f7de%5]) with mapi id 15.20.7202.035; Sat, 27 Jan 2024
 15:43:46 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>
Subject: RE: Re: Re: [PATCH 3/5] drm/ttm: replace busy placement with flags v6
Thread-Topic: Re: Re: [PATCH 3/5] drm/ttm: replace busy placement with flags v6
Thread-Index: AQHaRVY2Au+E+9iHw0i9k+i4xWifv7Dd2oQAgAAb04CAAdh1AIAM8UgAgAABpACAASKZEA==
Date: Sat, 27 Jan 2024 15:43:46 +0000
Message-ID: <SA1PR11MB6991FAE38ECE92AE3C9DCF2C92782@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240112125158.2748-1-christian.koenig@amd.com>
 <20240112125158.2748-4-christian.koenig@amd.com>
 <0049f12e-ce96-4320-8158-c5a23164261f@linux.intel.com>
 <fe9875a1-1cd5-4b2d-bfbc-9d779e79823a@linux.intel.com>
 <835b15e7-a2c8-4c03-9789-13f78078a024@linux.intel.com>
 <4a2hta7mv3mu4eoobtqtv4kmmdbrlowzbbrwjht73bzb2aoziw@awfcv5vhhnly>
 <gvhkoky553gdmbtllaiyesejzg3xrgmxkoptnk23pev53uacsp@vvm3uh2v5kds>
In-Reply-To: <gvhkoky553gdmbtllaiyesejzg3xrgmxkoptnk23pev53uacsp@vvm3uh2v5kds>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|PH7PR11MB7514:EE_
x-ms-office365-filtering-correlation-id: cd4e7b90-50f7-4f80-9634-08dc1f4ebfaa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dixOSCX21pj+TYGj4VQcksli1ihEy827T0vJEcBj6i1/Ap5N5HYMXMQJs6EkISYQz44293+UH6NXEBf8bnmzAMn5Cq0p0jEBDDqmYVLWS2ZUjNbT7FS7IKD6g+gyI3D6XNsVNuCkjtXg437tDuHQYb92543A03RRNs85PXskn0ccW9CMEoOadJ8sdWxE6eI/qqot2fHJd1Vfv7Ydf+sIfE+gmoLhDqPoYQkX4E9944VV9H5t+fif5sOoVCJrwF0BrCFFCj7iRXHt6OeXvhP65b//ed8zzSGxvEsTskP+1vXm56u+3q2i31ghJLWch3BY5mtwHNhrzf14E3D1KzGur6+YOEBWqiEuSiGQFjeaXKDLm5JEM4LcaZmIFAsqjp7FTBk6x4Y8p/ZOuOG4IpCLA/uSuLN6vI2CxvZXNNj2kODNnYmPA/eiRsWaVR37Rrg+v4SqomOq6+DZJXin7oYsTRPC8kmlO4iJANNm+asIygBA0ndEa8cJTT/6rTG50qbhxgm8VbaqUNSkCp6WaTG69/zFX9dZ2gICNqGNaJp/nzLgGMNaZ8/8w/H5GVco6p22BVOZBS6NhdVrvJBK6D37glRZO1ke4CWiemDss5BSes86P5RpVb8EghyaXfvwMXV7brL/QtqmzTqjTnIMawtGVLIRT/WvoEzcVWfXX82Gfjs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(39860400002)(376002)(346002)(396003)(230922051799003)(230173577357003)(230273577357003)(1800799012)(64100799003)(186009)(451199024)(26005)(53546011)(38100700002)(122000001)(2906002)(52536014)(5660300002)(38070700009)(8676002)(82960400001)(33656002)(86362001)(4326008)(41300700001)(71200400001)(6506007)(66574015)(7696005)(66476007)(83380400001)(54906003)(66556008)(8936002)(66946007)(9686003)(64756008)(110136005)(66446008)(478600001)(76116006)(316002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDJGTzZ0cExVekxCbHlBUzdId1FlZ0FYNGdqRnk5Z1JIVUx0czlvQlgzNXVQ?=
 =?utf-8?B?TWQyZ2NGbVk4dnVpMnYrY09oZDRVaFYvdTRia1JKdVJ3QjlMeis1bUxSM1h6?=
 =?utf-8?B?ejVYNGkzTEVaeFo4dFp0TmdEQmt0NGVqaDkxT1hRZ09VK1BSaEpGU2k5cmZm?=
 =?utf-8?B?aTRaTUJHVmIweEh3SGJaaEVUK0lZVlNzd0dOUitFQy9rR2xKZTgzenZ5d3Jj?=
 =?utf-8?B?cUNrL0xCeTd1Yi9VakhOb1BsQ2xSUDg3Q2kxTWNuZ1h1bDlmbG5JVFg0ejkw?=
 =?utf-8?B?SjUzZ1M1MWZJZThxVXZIalVCcFo2SVQ2QUhwN1Ixc0k1bnYvK0FYeGZuUVFt?=
 =?utf-8?B?ZGFoa3c5RS9la2pvY3pRb2JZWS9TOXJON2YxOER6MkdRdGFzVTBGcVptOFQw?=
 =?utf-8?B?UVZlZUF1QmJrNnZwOHREZnorSGs2S3ZaZjE3Qm9SV1ZrQnI1ZFkwRUtOMGtO?=
 =?utf-8?B?aTZSNXJWTC94ckVTMVRicWJ5SlJCcmRqODhVbVloZVhwOVR5Z0xtVnJVVFVH?=
 =?utf-8?B?TEQ3SGMveEhORHBkWWd1UnpEd1pTRGtnaFJGR0k1emw1VW9rcTJ3cFUvZDJs?=
 =?utf-8?B?MCtJdEZFK2hTYjBZQldvaTlqS2hrVEdFdWtUdVVMSTlYbHFNSnR3WElGa2dJ?=
 =?utf-8?B?Tld5Um1jSEZ2MkVLc1diaVVlaWFOVEFqTHFPRHdBZno0aDJxdDBhTUhpcHFh?=
 =?utf-8?B?bjNUcVoyLzJtdS9CSWJxT1JRMlBzTTN1QTlsdTZXVUQ4MUFsN1YxN1JOT2hR?=
 =?utf-8?B?ZVVCd3JVa0d2OVpodmlMaDU1N0c3NW14SVUwMm8rT0tndHV6b2hZNjJ2ZDVv?=
 =?utf-8?B?ZWtISVlDc1JsejhLdHM3Y0kwNGF6dnUrWXcwNnlhRExDRlp3RGlMOWJzQmV4?=
 =?utf-8?B?KzhKZ1N4VTI5bE9oTHpCL0VLK21xeEQzc1krSmFibHF1Zlp4MW84TU1SbDB3?=
 =?utf-8?B?cXdBNHNwSUpiWnhWcjdkcGg0NVhSejN5QWxTanhjb1BheWtKMEl1KzJwVGdS?=
 =?utf-8?B?ZnhXL0RBVTV5WnJSVDBMVlJjb0xZcG01cDlhWXJ5VGRlU1JYNEwvSW5qYkhL?=
 =?utf-8?B?VDh5clMydGJyREQ5T0Q4OHJVV3lxWEp2bEt6N1F2M3JLQ0QxOHlTNm9wREww?=
 =?utf-8?B?TWpmZ0pTdXZudndVdlNSRVNsMlNMbzRGYkx0YnpqTlJTR2NEZTlUeTNWSGQz?=
 =?utf-8?B?WmpUcWJLb2YzNUFNZHVWbXBlMmtzVmk5UEltY2ZJUXRObEhHb1UzbG1qNE9X?=
 =?utf-8?B?YSs3L09RUzgrdG5obE9CVmFmNFpUdWdYREwxUHRiRGtjSndOdjBsZ2VlV3dC?=
 =?utf-8?B?RUZuRDFyY2lKN2tUdDdIZjMyYm50UHNTQkJSVkRyL21BdVpXL2x5a3g0S3p2?=
 =?utf-8?B?NXYzcjdYQjFZRWd6UEZSdXpPY3JzSnVYT29UVklLYUZWcDJQN3NxUXhoa0Rp?=
 =?utf-8?B?ZDR1VEg3dHk3bnVJQURheTVqd2hLRitveDNmSDNNQmcwS1M4eG9aSGlndStS?=
 =?utf-8?B?SmpvU21WM0VaNW5QZWxwVXhhQ3E3ODQ3T0wrZ0JVeHpwaU1BakZJTmFrM1Bl?=
 =?utf-8?B?bUVrTnAxMCtBVmZMYlovODQ2VStnNktJUTJmelRQZnRqeGVQU3JMQTkrSDhv?=
 =?utf-8?B?YWIxRHVxcnNadUM0RE1tckJiaVBGL1RRZGhYbFYwZ2M1SEUvd0xqb0d4VEFP?=
 =?utf-8?B?ZENodGgyNStaMWJYMWJ4S3dEanNJY3N2V2JCUlN2TEl3NVpYRHBvUHgrNU9t?=
 =?utf-8?B?cDlZQmNDMkRNc201OE16bUEycC80dDNJVjZFVXZ6Z3VaNnI3QURTV0lRa29h?=
 =?utf-8?B?SFRNOEc2NWxyV3RpRWRCZ0lVRkJ1LzJsWXdHeHBxNExjL1VQU1VPU3dQd3p5?=
 =?utf-8?B?N3Y0NDdQZWdWWUJIUFhrbXRaT2pseE5MZTVHU013M3hReW8vSVZrV29SVEFl?=
 =?utf-8?B?ZGhEUTdqR1BZbVlwdC94U2QzZ3NnWnhrQkhLY3AwblpjMXpPNTNGeXBuVFhV?=
 =?utf-8?B?UjJicGJQZE05a01QNUhJUmR6a2tQUDBiRFM5dm1iT0JXTm9LZVpGV3phOFNV?=
 =?utf-8?B?a3pTTXdRT2NjeVdNczVteTY3bGhBdDRxbEZLMCtWclJDNTdjUlR2Ry9ncHUr?=
 =?utf-8?Q?hPng=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4e7b90-50f7-4f80-9634-08dc1f4ebfaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2024 15:43:46.3154 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A4xbnxXzvMT0KQ/FMFGXxr9omD1Y3vveiA3nu4ejfB6xW6u7m0HD5p8frtF9fd7iRe/8xnbRmsPk7lCpfGc8HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7514
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
Cc: "kherbst@redhat.com" <kherbst@redhat.com>,
 "michel.daenzer@mailbox.org" <michel.daenzer@mailbox.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "zackr@vmware.com" <zackr@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTHVjYXMsDQoNCkkgZW5jb3VudGVyZWQgdGhpcyBidWlsZCBpc3N1ZSBhcyB3ZWxsLiBJIHN1
Ym1pdHRlZCBhIGZpeCBmb3IgZHJtLXRpcC4NCg0KT2FrDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVl
ZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBMdWNhcw0KPiBEZSBNYXJjaGkNCj4gU2VudDogRnJp
ZGF5LCBKYW51YXJ5IDI2LCAyMDI0IDU6MjMgUE0NCj4gVG86IFRob21hcyBIZWxsc3Ryw7ZtIDx0
aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IGtoZXJic3RAcmVkaGF0LmNv
bTsgbWljaGVsLmRhZW56ZXJAbWFpbGJveC5vcmc7DQo+IG5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOyBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktDQo+IGRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsgQ2hyaXN0aWFuIEvDtm5pZw0KPiA8Y2tvZW5pZy5sZWljaHR6
dW1lcmtlbkBnbWFpbC5jb20+OyB6YWNrckB2bXdhcmUuY29tDQo+IFN1YmplY3Q6IFJlOiBSZTog
UmU6IFtQQVRDSCAzLzVdIGRybS90dG06IHJlcGxhY2UgYnVzeSBwbGFjZW1lbnQgd2l0aCBmbGFn
cyB2Ng0KPiANCj4gT24gRnJpLCBKYW4gMjYsIDIwMjQgYXQgMDQ6MTY6NThQTSAtMDYwMCwgTHVj
YXMgRGUgTWFyY2hpIHdyb3RlOg0KPiA+T24gVGh1LCBKYW4gMTgsIDIwMjQgYXQgMDU6Mzg6MTZQ
TSArMDEwMCwgVGhvbWFzIEhlbGxzdHLDtm0gd3JvdGU6DQo+ID4+DQo+ID4+T24gMS8xNy8yNCAx
MzoyNywgVGhvbWFzIEhlbGxzdHLDtm0gd3JvdGU6DQo+ID4+Pg0KPiA+Pj5PbiAxLzE3LzI0IDEx
OjQ3LCBUaG9tYXMgSGVsbHN0csO2bSB3cm90ZToNCj4gPj4+PkhpLCBDaHJpc3RpYW4NCj4gPj4+
Pg0KPiA+Pj4+WGUgY2hhbmdlcyBsb29rIGdvb2QuIFdpbGwgc2VuZCB0aGUgc2VyaWVzIHRvIHhl
IGNpIHRvIGNoZWNrIGZvcg0KPiA+Pj4+cmVncmVzc2lvbnMuDQo+ID4+Pg0KPiA+Pj5IbW0sIHRo
ZXJlIGFyZSBzb21lIGNoZWNrcGF0Y2ggd2FybmluZ3MgYWJvdXQgYXV0aG9yIC8gU09CIGVtYWls
DQo+ID4+Pm1pc21hdGNoLA0KPiA+Pg0KPiA+PldpdGggdGhvc2UgZml4ZWQsIHRoaXMgcGF0Y2gg
aXMNCj4gPj4NCj4gPj5SZXZpZXdlZC1ieTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxs
c3Ryb21AbGludXguaW50ZWwuY29tPg0KPiA+DQo+ID4NCj4gPml0IGFjdHVhbGx5IGJyb2tlIGRy
bS10aXAgbm93IHRoYXQgdGhpcyBpcyBtZXJnZWQ6DQo+ID4NCj4gPi4uL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9iby5jOjQxOjEwOiBlcnJvcjog4oCYc3RydWN0IHR0bV9wbGFjZW1lbnTigJkgaGFz
IG5vDQo+IG1lbWJlciBuYW1lZCDigJhudW1fYnVzeV9wbGFjZW1lbnTigJk7IGRpZCB5b3UgbWVh
biDigJhudW1fcGxhY2VtZW504oCZDQo+ID4gICA0MSB8ICAgICAgICAgLm51bV9idXN5X3BsYWNl
bWVudCA9IDEsDQo+ID4gICAgICB8ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fg0KPiA+ICAg
ICAgfCAgICAgICAgICBudW1fcGxhY2VtZW50DQo+ID4uLi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Ym8uYzo0MTozMTogZXJyb3I6IGV4Y2VzcyBlbGVtZW50cyBpbiBzdHJ1Y3QgaW5pdGlhbGl6ZXIN
Cj4gWy1XZXJyb3JdDQo+ID4gICA0MSB8ICAgICAgICAgLm51bV9idXN5X3BsYWNlbWVudCA9IDEs
DQo+ID4gICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4NCj4gPg0KPiA+DQo+
ID5BcHBhcmVudGx5IGEgY29uZmxpY3Qgd2l0aCBhbm90aGVyIHBhdGNoIHRoYXQgZ290IGFwcGxp
ZWQgYSBmZXcgZGF5cw0KPiA+YWdvOiBhMjAxYzZlZTM3ZDYgKCJkcm0veGUvYm86IEV2aWN0IFZS
QU0gdG8gVFQgcmF0aGVyIHRoYW4gdG8gc3lzdGVtIikNCj4gDQo+IG9oLCBuby4uLiBhcHBhcmVu
dGx5IHRoYXQgY29tbWl0IGlzICBmcm9tIGEgbG9uZyB0aW1lIGFnby4gVGhlIHByb2JsZW0NCj4g
d2FzIHRoYXQgZHJtLW1pc2MtbmV4dCB3YXMgbm90IHlldCBpbiBzeW5jIHdpdGggZHJtLW5leHQu
IFRob21hcywgZG8geW91DQo+IGhhdmUgYSBmaXh1cCBmb3IgdGhpcyB0byBwdXQgaW4gcmVyZXJl
Pw0KPiANCj4gTHVjYXMgRGUgTWFyY2hpDQo=
