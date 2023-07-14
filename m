Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B859975408B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 19:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B85E10E8CA;
	Fri, 14 Jul 2023 17:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC2110E8C6;
 Fri, 14 Jul 2023 17:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689356290; x=1720892290;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+jqLXPAaYGZJCW243OMEu80B3bJhNKcZ6Qu678VR44A=;
 b=Cxw2IvrVNkU2MVM1TqbecBurHne50m1R3PDnpLO0s+/JaT62PnUtk+D9
 kSImn5fRVN8YOub+6yikwdW3NrIbgGn6JTgNx3oHaPRtvdIJJ70sa1y1E
 /NJVSw+lRwPu+tXU+RIcY5DLU0RsNsUnsvUTQLTRZokeRxf116Bvcd9bp
 jJV/QtvWtLY/aX8O+UaTdS2crAd9qq6VdnwimTMAp66vU8ZxCw/ZTetCO
 K8Hf0d/2FFTRYGEub+XM1f8L7Y3AOnUz19JR3RzEBFD9+UVnJAFnrhmfy
 nFBvYvbgztwSdDEfaw9f/U7nlTEr5S1uZ/DoGALpDYR895wP40DtylVRD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="355471542"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; d="scan'208";a="355471542"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 10:38:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="699754718"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; d="scan'208";a="699754718"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 14 Jul 2023 10:38:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 10:38:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 10:38:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 14 Jul 2023 10:38:08 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 14 Jul 2023 10:38:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zk3gLEh1lszNLmiND6k4mFPaxhrZr13x+q8udP/Oe1nfvB3wPUdKIgmsmFG9PPfmRlO0qKLLDje5GzwSGXCVVNGXpGYdWNf/6q38GHvyEhIEt+r+wLEJOOtC85qRnOEHc0gfiUt/QIwe6hru1Fsrbr0lg1BYQxwq1E9M9WI71icsbvTPdwRHznNP40Gh/UGrvnK0fjpsvJrpAqOjNyAWt3b3Mkc+oRnzcbwAigaHO9NrI13OxG4UxlNsYLeKDJ2dTFa43DLAARwZAcT2YTSqEz63D8jSeowi8bkOWkgJ7tAvqglg/MBGqTa2xOnVF+GmGxgeVWJIQxsXCvOyJlUtOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jqLXPAaYGZJCW243OMEu80B3bJhNKcZ6Qu678VR44A=;
 b=mw+QZdnE7M954bgfAmtA+cp+GwfHcnCb8uBZD2dyfgI3ZlgqgYQdjE9lPvEE47Im1clnPFzyd4KOPwc8wt264kNruEAPa09dfx0+DCpMuJZ6iWJE5MfOdRJNMPn6xnMmiW0/1jSp3bpkbO8otpJPZhppI+i1nM3+lX0RM5MRUhiLANxpfUPHPvgjmXJt0IHzME/sdLlWWTHjQ1wAUFMFu6RexMYUkjLaONzUk0lNmPb1at1X52M71F7qxBGyyTFOs/AEnjsWJCAGpt6SiIEY2QXw0PWtLdn3xHYJB2L0/d+4M7yKeVy5qlimjcDcnpIfhEmQl9HGhpLj49JguxHCMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by PH8PR11MB6951.namprd11.prod.outlook.com (2603:10b6:510:225::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 17:38:06 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::28b4:ae85:a4f0:3f46]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::28b4:ae85:a4f0:3f46%4]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 17:38:06 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [RFC 2/2] drm/i915: Remove PAT hack from
 i915_gem_object_can_bypass_llc
Thread-Topic: [RFC 2/2] drm/i915: Remove PAT hack from
 i915_gem_object_can_bypass_llc
Thread-Index: AQHZtZ6PZtvICDXm90mKUClmafRLYK+4v26AgABMcgCAAHP54A==
Date: Fri, 14 Jul 2023 17:38:06 +0000
Message-ID: <BYAPR11MB2567719BC2C2AF43BA3D33B79A34A@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230713152718.645488-1-tvrtko.ursulin@linux.intel.com>
 <20230713152718.645488-2-tvrtko.ursulin@linux.intel.com>
 <BYAPR11MB25673D3525AF7C5A5FFB44129A34A@BYAPR11MB2567.namprd11.prod.outlook.com>
 <999114a1-e334-5de9-065e-9a5d3801e23e@linux.intel.com>
In-Reply-To: <999114a1-e334-5de9-065e-9a5d3801e23e@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|PH8PR11MB6951:EE_
x-ms-office365-filtering-correlation-id: c8570f5a-33d6-442c-10b0-08db84911510
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5lwgYQkTPAEjJqbNkKU+J6zIx9AEz4naXDOPAakUnKYYQgeJZgdDXmGDK8FaFj9xwrB6CZPsIje1u4oGe+b4diKEPU8Nhs4nYBlNKKOgI0cFKfaHlFIp0SGNO37iTnFaWaet/1mjyHdVWx1tiMB1aokdPtIMZQ2w1W9YugJsU3zqBSZHq6DKTMCzzCYAPFjnGr87DYfqL4t2Lf9YZpuybIbbelqtSyGmvT7LJdW7vKMOBHwe471n9Znfo0hS6LI/wucjlwNZEnQv/GH60Uv3rGbynN749zVz1WpUG/Xbx6u23OhvPbXCyVScgc9rmx0LMOI/OmDqYD/aNZ04Y538I79rGYNA2/Z9m9kOuvp1ELhK6YID4FrLe+hhqNr0u8XbAyCXNJQvhNiEu3VmHao7ISgfheHbH5yZ0tTXv12VcZxIML1F/V0vXoO5k9YiKdJEHB/Ct0RPQEB6myPQXu88a4NWM8b+Vm5nK5FVsNjwS2fJLgnSo/T/C9J0tT5BasJX7K7htlQ77r0xDV0vY9iDQ72jxGltcJVxaUc5KbBDDGm3nqFXP0yiD3qF5d/X4eFWtB1VwTuQukA+7zQ8WXkF3kDKNcYLM15k/fW46kttS6AQyIa2Mt5C5UvE9HRkEV+z
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199021)(7696005)(9686003)(71200400001)(33656002)(6506007)(186003)(83380400001)(53546011)(86362001)(38070700005)(38100700002)(82960400001)(122000001)(26005)(55016003)(4326008)(66476007)(66446008)(66556008)(64756008)(66946007)(76116006)(41300700001)(2906002)(316002)(52536014)(8936002)(8676002)(54906003)(5660300002)(110136005)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzFHZWRLZjdKenZ3QmZuNW0rNlJBT1pmZjR3aFNCcGRZeUt0ZmFUZFowZzJp?=
 =?utf-8?B?VmE4WkpwQ3lsZW05SFJRVThWbnEzaTM5UE9WQWtqSU1kR0t2d0JXTEJmY05B?=
 =?utf-8?B?WHNzcEhVb05Va08wVGZSVENMNHhtTVFyTEQvakpGaE1uditXYXNCaEMrM0l2?=
 =?utf-8?B?SjlEbm9USG5LWTFVR2E2enVqSXJXL3kwMXhzblJvaWJ5T2w5eDJpMTBUSzRu?=
 =?utf-8?B?Tzg3VXgra0lNWjhHSHZ3SG1IcWdFb2NPajNyUGJXY3NJWmhCUnF4cDVmZ2tZ?=
 =?utf-8?B?bVQrTGZCNVhkNWtVcmhvSERYdjNUc3A0L2lFanhmaVFFMldjV3V5elpsbkJB?=
 =?utf-8?B?akp2UFZDQ0pHemZRRlgwOWtRNWJHbGRFNll2dmJnZHowRDRPcnZ1SmFMRS9X?=
 =?utf-8?B?UUFmWEZqQUVHczgxMWIwMU5iN1dsQ3BITTUreVhhaVVOMzZpekI4cGpFTmtT?=
 =?utf-8?B?em1Ga1RueWFXdXptR2w0Wm45TFo5dlZaMG4yMkZSTStaaWlPOG5GY1VORTZJ?=
 =?utf-8?B?NnRIMzRHbE5XR0MwRTRjK0laZ0dtcXZxckhzTWhoa09XSU56WGU2V3E2eXh5?=
 =?utf-8?B?bTl1bUo5Yk01TGhzOUJzZnJZeGtzZXdUMGwxbTlBTFhJdGY3bzdOU3BMTVBm?=
 =?utf-8?B?VExLU2RvWDFya0FhRmFUa0dVWWt6R05nMWZVelFMWS9RNFFmS3RQQW5aSmhJ?=
 =?utf-8?B?RlpMdHlWUFNmUEdCRElxemRqTVVrUEZDUGVGQ0FFMjJwNWw2R2lJYVVTNlFH?=
 =?utf-8?B?L3g4R25Sa0Z4ZnlscnFCOXBNcytycDlyK3BHZFZsTkZqNStPZDFHVEticzh2?=
 =?utf-8?B?MDJ3TWtNeDlhRFVveVFmQlk2S3ZISFR3OE8xYTJlRm9nR1NKdnF3UDJTU3ds?=
 =?utf-8?B?SE1mbHJSbW0xRXpid0pMekkzVE5kRTQ5VGVHclpQL1Y4aUR5bHJka3VQSENT?=
 =?utf-8?B?YUhUNjJuUDBJUmNRY1RJY3pxcjZWMjRJM2R1WGJWUVVzbE5saVNJa2FJSmFk?=
 =?utf-8?B?MkxUQWJlRk01SS9RRzk3SVZuQUpsZG8ybU5kdTFvNEVoL29TeXFRZmRSZHh0?=
 =?utf-8?B?aXVVdytYdzgyUmg4NWRXZk1RbHNVRGhuMEd2WC9MUHZpZlEvbit3dE1vK3Ux?=
 =?utf-8?B?SDl6RFdMS0RmVmNNVm42MG9Qd2s4WG9kWDBBTTFzb0JHNlc3OWc2cHg4OUVt?=
 =?utf-8?B?Z0xyKzlrbWRWYW9UVlp3aDFFYmxtdXIyN0hYSVV1dWV1RmFLR2htdERPSlhK?=
 =?utf-8?B?Y1k1RFluV2x2SE5ONFFlenZLK1haY2NIOHYyUlNvNHUxTU4rTk9SNEJUaFY1?=
 =?utf-8?B?R2gyejVxbEd2d3RsRFUxcUJMWHo3L1pxSHVlY09WY1J2RytrR25Tdk1kendw?=
 =?utf-8?B?Z0Y4STBKM25hay8wRnN6Vy9iZ0pTVU52MHZVYmo0eituSHpoV3pxVzI3ZXRu?=
 =?utf-8?B?MEpBWUoxNktsTmcxc1JnTm5sSkg3Y3NLRVNaL3hIZGQ0Z0xRdXpvUDcyYlZ5?=
 =?utf-8?B?bDFNOW12U3FEQ3dkSEFHWUhPemlUZ3lQUHk1UU42anBsM09mQVM2dGFCU3Vt?=
 =?utf-8?B?UWRua0NkOFExU1Z1U1JRT3ZwSkhYUm9wQmpYUnhWZVRaNm1JTUJwWHlVT1V6?=
 =?utf-8?B?aE1IT1Zldm9JNG9QRU00NzhNWXIvTVhyaWF6ak0zOXFrZVBRdUgyRGhreE16?=
 =?utf-8?B?b21wRUFkSkhjQW9UNmFjQ1VSa3NSdm50Mzcyc2t0OUNHejJSdlFrQUYwcm9V?=
 =?utf-8?B?Q0p1bzRTc053ckZDUkhNMklTYXFvOFQ2UjlVWEs4dnhjZFlYRnhIMkdrSys3?=
 =?utf-8?B?cUV4b2NCNlZrMjlnN0l3WVluVlRmL2psNXR1eDhkRTFWbDNqWXdITU44YU9x?=
 =?utf-8?B?dk5iUExWYVIzTnhrNjV4V3p4bWFSWHFSbEJwUkhsOVh5amhFRmhlMnZWK1hi?=
 =?utf-8?B?V1Y5VkJpM1VVc1ByT2Z0Z1pxUktGOThKa2tHZTZ6WnNTdFo3emx3RGs4dEZT?=
 =?utf-8?B?aUxMT0Q1Ly9adWg0VFZ1bVhXK21wNzNqaTFaVm9zZmhrMW04TUdObkJnNHE1?=
 =?utf-8?B?ckVKTDZLS1pWalh2ZkRWVWdWb1g4MGNHc2pjRFFZei9hQmM2UUE0WWc3R1hv?=
 =?utf-8?Q?M3UQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8570f5a-33d6-442c-10b0-08db84911510
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 17:38:06.1479 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XTcPisRTKe+o5xC3Pnu4DY/ncq0XcUYm9EoM2T/WZ2o9vzBItsRGJISuqfTUaIjV7F1o3lDM5PqqIi13/zrvoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6951
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBPbiAxNC8wNy8yMDIzIDA2OjQzLCBZYW5nLCBGZWkgd3JvdGU6DQo+Pj4gRnJvbTogVHZydGtv
IFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4NCj4+Pg0KPj4+IEFjY29yZGluZyB0
byB0aGUgY29tbWVudCBpbiBpOTE1X2dlbV9vYmplY3RfY2FuX2J5cGFzc19sbGMgdGhlDQo+Pj4g
cHVycG9zZSBvZiB0aGUgZnVuY3Rpb24gaXMgdG8gcmV0dXJuIGZhbHNlIGlmIHRoZSBwbGF0Zm9y
bS9vYmplY3QgaGFzDQo+Pj4gYSBjYWNoaW5nIG1vZGUgd2hlcmUgR1BVIGNhbiBieXBhc3MgdGhl
IExMQy4NCj4+Pg0KPj4+IFNvIGZhciB0aGUgb25seSBwbGF0Zm9ybXMgd2hpY2ggYWxsZWdlZGx5
IGNhbiBkbyB0aGlzIGFyZSBKYXNwZXJsYWtlDQo+Pj4gYW5kIEVsa2hhcnRsYWtlLCBhbmQgdGhh
dCB2aWEgTU9DUyAobm90IFBBVCkuDQo+Pj4NCj4+PiBJbnN0ZWFkIG9mIGJsaW5kbHkgYXNzdW1p
bmcgdGhhdCBvYmplY3RzIHdoZXJlIHVzZXJzcGFjZSBoYXMgc2V0IHRoZQ0KPj4+IFBBVCBpbmRl
eCBjYW4gKGJ5cGFzcyB0aGUgTExDKSwgcXVlc3Rpb24gaXMgaXMgdGhlcmUgYSBzdWNoIFBBVCBp
bmRleA0KPj4+IG9uIGEgcGxhdGZvcm0uIFByb2JhYmx5IHN0YXJ0aW5nIHdpdGggTWV0ZW9ybGFr
ZSBzaW5jZSB0aGF0IG9uZSBpcw0KPj4+IHRoZSBvbmx5IG9uZSB3aGVyZSBzZXQgUEFUIGV4dGVu
c2lvbiBjYW4gYmUgY3VycmVudGx5IHVzZWQuIE9yIGlmDQo+Pj4gdGhlcmUgaXMgYSBNT0NTIGVu
dHJ5IHdoaWNoIGNhbiBhY2hpZXZlIHRoZSBzYW1lIHRoaW5nIG9uIE1ldGVvcmxha2UuDQo+Pj4N
Cj4+PiBJZiB0aGVyZSBpcyBzdWNoIFBBVCwgbm93IHRoYXQgaTkxNSBjYW4gYmUgbWFkZSB0byB1
bmRlcnN0YW5kIHRoZW0NCj4+PiBiZXR0ZXIsIHdlIGNhbiBtYWtlIHRoZSBjaGVjayBtb3JlIGZp
bmUgZ3JhaW5lZC4gT3IgaWYgdGhlcmUgaXMgYQ0KPj4+IE1PQ1MgZW50cnkgdGhlbiB3ZSBwcm9i
YWJseSBzaG91bGQgYXBwbHkgdGhlIGJsYW5rZXQgSVNfTUVURU9STEFLRSBjb25kaXRpb24uDQo+
Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50
ZWwuY29tPg0KPj4+IEZpeGVzOiA5Mjc1Mjc3ZDUzMjQgKCJkcm0vaTkxNTogdXNlIHBhdF9pbmRl
eCBpbnN0ZWFkIG9mDQo+Pj4gY2FjaGVfbGV2ZWwiKQ0KPj4+IENjOiBDaHJpcyBXaWxzb24gPGNo
cmlzLnAud2lsc29uQGxpbnV4LmludGVsLmNvbT4NCj4+PiBDYzogRmVpIFlhbmcgPGZlaS55YW5n
QGludGVsLmNvbT4NCj4+PiBDYzogQW5kaSBTaHl0aSA8YW5kaS5zaHl0aUBsaW51eC5pbnRlbC5j
b20+DQo+Pj4gQ2M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+Pj4g
LS0tDQo+Pj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fb2JqZWN0LmMgfCA2
IC0tLS0tLQ0KPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX29iamVjdC5jDQo+
Pj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fb2JqZWN0LmMNCj4+PiBpbmRl
eCAzM2ExZTk3ZDE4YjMuLjFlMzQxNzFjNDE2MiAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fb2JqZWN0LmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9nZW0vaTkxNV9nZW1fb2JqZWN0LmMNCj4+PiBAQCAtMjI5LDEyICsyMjksNiBAQCBi
b29sIGk5MTVfZ2VtX29iamVjdF9jYW5fYnlwYXNzX2xsYyhzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29i
amVjdCAqb2JqKQ0KPj4+ICAgICAgICBpZiAoIShvYmotPmZsYWdzICYgSTkxNV9CT19BTExPQ19V
U0VSKSkNCj4+PiAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7DQo+Pj4NCj4+PiAtICAgICAv
Kg0KPj4+IC0gICAgICAqIEFsd2F5cyBmbHVzaCBjYWNoZSBmb3IgVU1EIG9iamVjdHMgYXQgY3Jl
YXRpb24gdGltZS4NCj4+PiAtICAgICAgKi8NCj4+PiAtICAgICBpZiAob2JqLT5wYXRfc2V0X2J5
X3VzZXIpDQo+Pg0KPj4gSSdtIGFmcmFpZCB0aGlzIGlzIGdvaW5nIHRvIGJyZWFrIE1FU0EuIENh
biB3ZSBydW4gTUVTQSB0ZXN0cyB3aXRoIHRoaXMgcGF0Y2g/DQo+DQo+IEkgY2FuJ3QsIGJ1dCBx
dWVzdGlvbiBpcyB3aHkgaXQgd291bGQgYnJlYWsgTWVzYSB3aGljaCB3b3VsZCBuZWVkIGENCj4g
bmljZSBjb21tZW50IGhlcmU/DQoNCkZvciBvYmplY3RzIHdpdGggUEFUIGluZGV4IHNldCBieSB1
c2VyLCB0aGUgS01EIGRvZXNuJ3Qga25vdyB3aGV0aGVyIHRoZSB1c2VyDQpzcGFjZSB3b3VsZCBt
YXAgaXQgYXMgY2FjaGVhYmxlIG9yIG5vdCBmb3IgQ1BVIGFjY2Vzcy4gU28gd2Ugd2FudCB0byBl
bmZvcmNlDQphIGNhY2hlIGZsdXNoIGF0IEJPIGNyZWF0aW9uIHRpbWUgYmVmb3JlIGhhbmRpbmcg
dGhlIEJPIG92ZXIgdG8gdXNlciBzcGFjZS4NCkkgcmVtZW1iZXIgdGhlIGlzc3VlIHdlIGhhZCBi
ZWZvcmUgaXMgdGhhdCBNRVNBIHNlZXMgZ2FyYmFnZSBkYXRhIGluIGEgQk8NCnRoYXQgaXMgc3Vw
cG9zZWQgdG8gYmUgaW5pdGlhbGl6ZWQgd2l0aCB6ZXJvLg0KDQpJIHVuZGVyc3RhbmQgeW91ciBw
b2ludCwgY2hlY2tpbmcgZm9yIG9iai0+cGF0X3NldF9ieV91c2VyIGlzIG5vdCBzb21ldGhpbmcN
CnRvIGJlIGRvbmUgaW4gdGhpcyBmdW5jdGlvbi4gSSdtIGZpbmUgd2l0aCB0aGUgcmVtb3ZhbCBv
ZiB0aGVzZSBsaW5lcywgYnV0DQp0aGUgY2hlY2tpbmcgbmVlZHMgdG8gYmUgZG9uZSBzb21ld2hl
cmUsIG1heWJlIGp1c3Qgb25lIGxldmVsIHVwPw0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2RtYWJ1Zi5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2Vt
L2k5MTVfZ2VtX2RtYWJ1Zi5jDQppbmRleCAxZGY3NGY3YWEzZGMuLjM5Y2Q5MDNiYTIyMyAxMDA2
NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9kbWFidWYuYw0KKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2RtYWJ1Zi5jDQpAQCAtMjU4LDYg
KzI1OCw3IEBAIHN0YXRpYyBpbnQgaTkxNV9nZW1fb2JqZWN0X2dldF9wYWdlc19kbWFidWYoc3Ry
dWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iaikNCiAgICAgICAgICogdGhlIGRyaXZlci4NCiAg
ICAgICAgICovDQogICAgICAgIGlmIChpOTE1X2dlbV9vYmplY3RfY2FuX2J5cGFzc19sbGMob2Jq
KSB8fA0KKyAgICAgICAgICAgb2JqLT5wYXRfc2V0X2J5X3VzZXIgfHwNCiAgICAgICAgICAgICgh
SEFTX0xMQyhpOTE1KSAmJiAhSVNfREcxKGk5MTUpKSkNCiAgICAgICAgICAgICAgICB3YmludmRf
b25fYWxsX2NwdXMoKTsNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9p
OTE1X2dlbV9zaG1lbS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3NobWVt
LmMNCmluZGV4IDhmMTYzM2MzZmI5My4uNzcwZTAyYTg1MWY2IDEwMDY0NA0KLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3NobWVtLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2dlbS9pOTE1X2dlbV9zaG1lbS5jDQpAQCAtMjU0LDcgKzI1NCw4IEBAIHN0YXRpYyBp
bnQgc2htZW1fZ2V0X3BhZ2VzKHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmopDQogICAg
ICAgIGlmIChpOTE1X2dlbV9vYmplY3RfbmVlZHNfYml0MTdfc3dpenpsZShvYmopKQ0KICAgICAg
ICAgICAgICAgIGk5MTVfZ2VtX29iamVjdF9kb19iaXRfMTdfc3dpenpsZShvYmosIHN0KTsNCg0K
LSAgICAgICBpZiAoaTkxNV9nZW1fb2JqZWN0X2Nhbl9ieXBhc3NfbGxjKG9iaikpDQorICAgICAg
IGlmIChpOTE1X2dlbV9vYmplY3RfY2FuX2J5cGFzc19sbGMob2JqKSB8fA0KKyAgICAgICAgICAg
b2JqLT5wYXRfc2V0X2J5X3VzZXIpDQogICAgICAgICAgICAgICAgb2JqLT5jYWNoZV9kaXJ0eSA9
IHRydWU7DQoNCiAgICAgICAgX19pOTE1X2dlbV9vYmplY3Rfc2V0X3BhZ2VzKG9iaiwgc3QpOw0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV91c2VycHRyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fdXNlcnB0ci5jDQppbmRleCAxZDNl
YmRmNDA2OWIuLjllNjVlMzMyNDQyMiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2dlbS9pOTE1X2dlbV91c2VycHRyLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9p
OTE1X2dlbV91c2VycHRyLmMNCkBAIC0xNzAsNyArMTcwLDggQEAgc3RhdGljIGludCBpOTE1X2dl
bV91c2VycHRyX2dldF9wYWdlcyhzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqKQ0KICAg
ICAgICB9DQoNCiAgICAgICAgV0FSTl9PTl9PTkNFKCEob2JqLT5jYWNoZV9jb2hlcmVudCAmIEk5
MTVfQk9fQ0FDSEVfQ09IRVJFTlRfRk9SX1dSSVRFKSk7DQotICAgICAgIGlmIChpOTE1X2dlbV9v
YmplY3RfY2FuX2J5cGFzc19sbGMob2JqKSkNCisgICAgICAgaWYgKGk5MTVfZ2VtX29iamVjdF9j
YW5fYnlwYXNzX2xsYyhvYmopIHx8DQorICAgICAgICAgICBvYmotPnBhdF9zZXRfYnlfdXNlcikN
CiAgICAgICAgICAgICAgICBvYmotPmNhY2hlX2RpcnR5ID0gdHJ1ZTsNCg0KICAgICAgICBfX2k5
MTVfZ2VtX29iamVjdF9zZXRfcGFnZXMob2JqLCBzdCk7DQoNCi1GZWkNCg0KPiBGb3IgaW5zdGFu
Y2Ugc2hvdWxkIHRoZSBjaGVjayBiZSBJU19NRVRFT1JMQUtFPw0KPg0KPiBPciBzaG91bGQgaXQg
YmUgImlzIHdiIiAmJiAibm90IGhhcyAxLXdheSBjb2hlcmVudCI/DQo+DQo+IE9yIGJvdGg/DQo+
DQo+IE9yLCBnaXZlbiBob3cgTWV0ZW9ybGFrZSBkb2VzIG5vdCBoYXZlIExMQywgaG93IGNhbiBh
bnl0aGluZyBieXBhc3MgaXQNCj4gdGhlcmU/IE9yIGlzIGl0IGFib3V0IHNub29waW5nIG9uIE1l
dGVvcmxha2UgYW5kIGhvdz8NCj4NCj4gUmVnYXJkcywNCj4NCj4gVHZydGtvDQo+DQo+Pg0KPj4+
ICAgICAgICAvKg0KPj4+ICAgICAgICAgKiBFSEwgYW5kIEpTTCBhZGQgdGhlICdCeXBhc3MgTExD
JyBNT0NTIGVudHJ5LCB3aGljaCBzaG91bGQgbWFrZSBpdA0KPj4+ICAgICAgICAgKiBwb3NzaWJs
ZSBmb3IgdXNlcnNwYWNlIHRvIGJ5cGFzcyB0aGUgR1RUIGNhY2hpbmcgYml0cyBzZXQNCj4+PiBi
eSB0aGUNCj4+PiAtLQ0KPj4+IDIuMzkuMg0K
