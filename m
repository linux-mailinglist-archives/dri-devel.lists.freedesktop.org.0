Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4483656B981
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 14:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD1B112BDF;
	Fri,  8 Jul 2022 12:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45226112BC6;
 Fri,  8 Jul 2022 12:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657282677; x=1688818677;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=b35AmMYX8NdyS/GvEXEIXfjeVa1U/0Yrrm0N7qmvvMM=;
 b=DQYxIIrktOUTm52L37oX7StXPrOOfvUATYIQvFhRVd+gbVWIaq9Y1TNt
 nj7GSpmimFGh38eXpWouf/Ma8IPEOIpn6fM8haNJuI04fm7K3VKoeO70/
 +s2LrzC1T2NHkqg7SUZzLJtQerYJ8oSZ64LHGdC2It2wkNZzoOfFBsxeP
 xX0t7DPYN6IowYKJmgPUe1Nrhn3qEHEiglh1PsMWl2D7USm86j0dsKHrN
 fMfbOWmYbIHzOkfHGA1qDUfV8cR/t8R5K6qXL6qHNScETwuHsubwqTBl0
 qk1x8OjDQKo37Dwf+pkyC9pZ4cEMkWnakVMNcPikeD11gb7UO7S0C9zi5 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="264680877"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="264680877"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 05:17:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="626689429"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga001.jf.intel.com with ESMTP; 08 Jul 2022 05:17:56 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Jul 2022 05:17:55 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 8 Jul 2022 05:17:55 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 8 Jul 2022 05:17:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mnG2uO31gSkXtIyTBjaq30byuJ4PlOt0EfwtEmeYNGLMPLrJKNKwi7MSOLbVfrhVWrH/krt2TDr5nEku+nVW1lc5Liq9qM9/8lrKwOEtC09GEELXdd9sJiAzfgM30BG+t3t6iS+r6YGktJUTC5jSuwJIAGGqWC1ogfkrpV0XKKBQG5+m2MYsXrgn4V4XKrEEpIfcG6ISCAym9WxRZr4TiSIlfE4lq+jfyD/bViADzW8O2MNFNetWgfMBMuUEk61szcEob2wRW0snvGGjq2mrWHfgJF+D9NHWhyLZKjxoC/lVA/Ckbv9rD0szdo5yWPLPfVTnFB91hpT57YtCmpRjcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b35AmMYX8NdyS/GvEXEIXfjeVa1U/0Yrrm0N7qmvvMM=;
 b=ClAA4nh8wQVAXF7hkm97aa7fzzwSVi9cyG8Z7WXhb8ruUW/j00CDohuZVmna5l175kCu+8a+sNrAQWy5TBJU9Ee2rX4HcPTLrtHyJRHMd2eh90LJZqBAEG2EaEkiHut/kxB454/Cfadb4eTOflLHcZe+TGOKXXgnNOHzLxwe+gVU/iWUhqj1aYr/26zfdx9JvHua2qhilGaYdnGM5rtjmqEaUgBIwkaDLm+tbIaMkVI6BLTDf4bNDo4xwX+IcxOYQWorM7Sk3BooVwfhm9M1r4BTG5EoCXXoXeyJ065K8GWW/QNOy0Qe4z+6gmRS8HCA40OFR2tiK0q4kOHN9rDKsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3114.namprd11.prod.outlook.com (2603:10b6:5:6d::11) by
 BY5PR11MB4118.namprd11.prod.outlook.com (2603:10b6:a03:191::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Fri, 8 Jul
 2022 12:17:53 +0000
Received: from DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::3820:8a37:de8b:ccbd]) by DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::3820:8a37:de8b:ccbd%5]) with mapi id 15.20.5395.022; Fri, 8 Jul 2022
 12:17:53 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [RFC 08/10] drm/i915/vm_bind: userptr dma-resv changes
Thread-Topic: [RFC 08/10] drm/i915/vm_bind: userptr dma-resv changes
Thread-Index: AQHYjZ0bkJxl2ZwSGkOh5jrGh5tDbK10bkKA
Date: Fri, 8 Jul 2022 12:17:53 +0000
Message-ID: <cf5b29a58096cc2e3ab8233c126c01a94bf020b3.camel@intel.com>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-9-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20220701225055.8204-9-niranjana.vishwanathapura@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.3 (3.44.3-1.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03d3ea5a-2d71-48f9-fd8b-08da60dbe201
x-ms-traffictypediagnostic: BY5PR11MB4118:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d6IMH4fJdKVRwGRO4TRfcYh3Dnx3GKJT37EVGE2I6ZtPN0SReOH8pleojzNWhAr5JmIJe17u81MdDnN9ab4avvqv2vIpCUg40s9MjyE66KNZHmXqx1j0F25OfIgQrHOnD7S8g12ljiAj7lQkubhNltEuq4Pfyfx0W75HMIfKiyLt6DJDgQAotKjVQEeaDmv/n/bSnZrTJt/Flxd/6M+XIWHixufQppur1iCtUD5ALpqp1bkxZW9eZsF7bRU5W/5DlaR7OGL3P47u3F7eu8xrD4C/2XoQlc38yzTDcru4nMRTvkIh7w/trfe2Z4e0hsksWu6D3YsfuMIrMUYjAMYJYazlFEqnOCMBAIU02JCxtWNS13NF2mCbFxoL1fDDy3vDsgwgd1/+o8oBKpcR7ESTSbGXGP4TyGpu/6dXsSZjm8KXTNYursNUIRenW8hxDcgmzik/Tn/w2qs4+BRT8GMr+mVs8WnLKxZV+ie/Wv+JHe3fIuKGbkmkrd23yEXlD8b09QOPBPisp3UYnlHD0QiPcmm87Zhcur2V4QjZ5zxwefWsYiAykD0CCNBz4oYEwP6q3LTTtGVTFFkeA4tQIFBXw+HclJbSIbDJBmA03MOPulvBclLsTkfA13Qmcg8wTRtzolHISmXJAIIGeUUjTrsPlWq22/QrC11Oub6109IY7jzF9vrfK6szYSVFhftsmR8LcA+oTSTTsMDm5Jc/hiUk9nG663edF0VBVm2AKSSsymP47P1kz7krjKFITg//2i3c/8NiNLg0RG2zpZDohx/0TfISTt9ofr2KkZWveBdpLc9Lm2C0m42G4nMyspE3Pme3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3114.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(136003)(39860400002)(366004)(376002)(186003)(82960400001)(71200400001)(64756008)(83380400001)(8676002)(4326008)(66946007)(478600001)(86362001)(66476007)(26005)(66446008)(66556008)(91956017)(5660300002)(76116006)(38070700005)(4744005)(122000001)(6486002)(41300700001)(6506007)(38100700002)(2906002)(8936002)(2616005)(54906003)(110136005)(36756003)(6512007)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SzNMVjFFc1JMSUJNM0p5WlU3ZVpEdnI0NG15eWEvOURRY25ES0VHc2FWcmlz?=
 =?utf-8?B?TGpOMDl3cDVHV0Z6UzR3TWtTUTZKSDc2VWQwNVZ4ZGFHenkzVkZFcjFFZ3FK?=
 =?utf-8?B?ZnJqTnFod0JTcG9vc0xycVdWT3JLVStCVllTNHdXZDIzSFZtd3grSm96ck1Y?=
 =?utf-8?B?ZzFLOGt6dzVXb2p3c2NoVXQ0TG1ObkN1NzZBZnM4ZkpEWmpqWjZUOVo5NEp4?=
 =?utf-8?B?cFdyWTZJSzQyZXcxMWRSN0ozMG5YZFhXUUQ0OWEvcTZxMUMrVXhXREpDNjNT?=
 =?utf-8?B?OEVVeXFnd0Q0dlNkdUpDU2VzN2p5ZVRWcXhnUHJGWFNFZjNvdkxJSDhXd0FS?=
 =?utf-8?B?czdlV2ZyYlFhRVVUYUpDblJ3NmlPOXc5ZWREUXN3b0duTDNBSlFTWGVJSlZJ?=
 =?utf-8?B?YlcySEtYOU1zcHlvN1UrUU51VkhIc2dpbGwxTkV5TGNIT1luWk5LOUJGMnRk?=
 =?utf-8?B?OGFXN1RYWGhMTE1qWEpiM2NyMkpnTEtnNW8rWTF2YXNYQUNvR0NXbWlWSlRs?=
 =?utf-8?B?L2hzWEJwb0t1TnB5M3dsbkdvQjhuYzVXcE1ZOUE1Q1lWRW1ScTJhZFd4eUhY?=
 =?utf-8?B?UXNOVTV3UE9RbSs3bVoyKytCMzB6VUZUMXJwUkI3Vm9HSEpvcTNtcnpXYXky?=
 =?utf-8?B?WGpNdmlNcHZMdTQwUC83MUdCQklFOG1VS3RzQVpnRi9Jb0NJS3Qrak5na1Ux?=
 =?utf-8?B?OExqYnhPb0pyOG00NjRkK1I1NEdBZ3hod2xJWXFXRWFvTWFNK1U4T1pyTDVn?=
 =?utf-8?B?MEVJT09QS1FMT0phY0x3eC92Z29pMFJOTnV4K1NSTk8yUUlnSGlOYmI0a3JN?=
 =?utf-8?B?RTdmdzVveURpNHRRR2dYNmJ4cWlsbDRIUmUvVEk1dFVrMmI0WG9tZGJya1lq?=
 =?utf-8?B?MEV2S0RKYS9iRjBSSWl6ZzJVVGd5UjNNK29NREtVKzFzMjk2L0NLMnZyd0dy?=
 =?utf-8?B?cGdQMVd3d0dVZzFxOHhQVmFFMzVDSnFQT2ViWTJ0N1dQMlBNL1NveHVwZzZ3?=
 =?utf-8?B?eUpRL09iQUpEcnhhZE1uU09aWDd2dFNaaWNKVkV1STA5Rjk3YkdZbWF0dDNu?=
 =?utf-8?B?cjBSNnlUdXUzNlpsbytOMjl0SkI1bU5rYlppNlRWTmRSK0h6TVQzQ0lqK3VN?=
 =?utf-8?B?dVgyR1BFRkpWbzFaQjl4TXhSWitHdVEvc0hmRTZPLzJvWEEzeDgyQk9QTUxo?=
 =?utf-8?B?SmtXWTY2TDM1MXFNam53NGZkUjIxRjIrbFZ0Yk8vSkFvZENQZnZxZVpvVEtw?=
 =?utf-8?B?UFlMODhkQlNRSkZCK3RPeGNVeTVMN1Z6ZmxwbDdBK2lNalNxVC8xTk0xZFNm?=
 =?utf-8?B?TXY5Yk5QazVNQTB3b3hMaFgva2VRTkhETEJnU2lGVFNlS3AxbktzbStkRVZv?=
 =?utf-8?B?cm1oUWlvUUVUYmpSZUVwV0RxWFVwY1REYjYwNnNBck9IaHAycm8vWEtpd2pl?=
 =?utf-8?B?dDhwZkhJRXVRUFk5K1l3K21jRnEyMHFpYkFxZ01GRSthOXZVQVVHd2dBMElZ?=
 =?utf-8?B?bDhWRVRDTWVuMkhmeWdXS3BZSzdWZmJnd1dUcmxFSEpPSmRYdkVOS2w1bTRJ?=
 =?utf-8?B?aHcrM2ExSlhRMlhZaWJZNEFKT2l4UXR2VzlvcG1wcFN5eHRMK2hsWXYzeTNQ?=
 =?utf-8?B?ZlFPUC9MQXQ2RHloaWtVbFVVRWFzamgvaGk4VUpMa2JzNjZTY21xQnRHQlhC?=
 =?utf-8?B?c3RqMk1LRGNQZTMvMHI2R2M5WFBUSm9Ja2ZvTEd6NDJ5K3dTSlZqdTRLdTNN?=
 =?utf-8?B?TVRhanlmank0SW83UWg3N1FHU2RGUHRtRFNxcmgvbitIYXlyNWNlVFU0UVEr?=
 =?utf-8?B?K3REeXJmRlhhZE9WU0dONm1MYmlzMlV2U2RTVHF2NWtDNzJqTmxOODBVays4?=
 =?utf-8?B?WVE5ekF1N3h0WXkvWVUxVHZ2eXBWdXRnUTlsWHExSTRVbmxDZkxQQTVaNUcv?=
 =?utf-8?B?SndXWnRlYTAxYlFtcDgyVlZtNHNyWWtudlRreThqSGJxR2E3bEsvSlVNQmlY?=
 =?utf-8?B?TFBab3RXTXNtVUdXa3FUQ053TEE2MXMwRUZmQ0pad0QyRkhsL3FrTDN4RXpu?=
 =?utf-8?B?SnoxUmdvQVFFUjR6RjZHR3JuRG9McXdzZlhaZk9rNzN3OWJoOTE2VlJyNDRK?=
 =?utf-8?B?WCtVZ1FVWDNXRWxnNEJSQjZPKzN3M0lhV2N1eHd1OXRWbExiWVBWUllvQm9s?=
 =?utf-8?Q?1x6Mwi/oo2udujDx8U45h0c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5C7234C8297C2498B36FF186DA39080@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3114.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d3ea5a-2d71-48f9-fd8b-08da60dbe201
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 12:17:53.1607 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rLrbVgDY/HyoH9WJnnsTPuolPKuKzugAFnETxFKCYRVH80f40kMwbiAdBk+uVOzdx8hpQEEoZk3ueQzj6Ka48c0vSYF0WhXxTbZ82Te/7uQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4118
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>, "Zanoni,
 Paulo R" <paulo.r.zanoni@intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>, "Landwerlin,
 Lionel G" <lionel.g.landwerlin@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>,
 "jason@jlekstrand.net" <jason@jlekstrand.net>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIyLTA3LTAxIGF0IDE1OjUwIC0wNzAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOg0KPiBGb3IgcGVyc2lzdGVudCAodm1fYmluZCkgdm1hcyBvZiB1c2VycHRyIEJP
cywgaGFuZGxlIHRoZSB1c2VyDQo+IHBhZ2UgcGlubmluZyBieSB1c2luZyB0aGUgaTkxNV9nZW1f
b2JqZWN0X3VzZXJwdHJfc3VibWl0X2luaXQoKQ0KPiAvZG9uZSgpIGZ1bmN0aW9ucw0KPiANCj4g
U2lnbmVkLW9mZi1ieTogTmlyYW5qYW5hIFZpc2h3YW5hdGhhcHVyYQ0KPiA8bmlyYW5qYW5hLnZp
c2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoC4uLi9ncHUvZHJtL2k5MTUvZ2Vt
L2k5MTVfZ2VtX2V4ZWNidWZmZXIzLmPCoMKgIHwgNjcNCj4gKysrKysrKysrKysrKysrKysrKw0K
PiDCoC4uLi9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fdm1fYmluZF9vYmplY3QuY8KgwqDCoCB8IDE2
ICsrKysrDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ3R0LmPCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqAgMSArDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ3R0
LmjCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSArDQo+IMKgNCBmaWxlcyBjaGFuZ2VkLCA4NSBp
bnNlcnRpb25zKCspDQo+IA0KDQpIbW0uIEkgYWxzbyBtaXNzIHRoZSBjb2RlIGluIHVzZXJwdHIg
aW52YWxpZGF0ZSB0aGF0IHB1dHMgaW52YWxpZGF0ZWQNCnZtLXByaXZhdGUgdXNlcnB0ciB2bWFz
IG9uIHRoZSByZWJpbmQgbGlzdD8NCg0KL1Rob21hcw0KDQo=
