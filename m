Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 252B258A439
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 02:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1D8A3191;
	Fri,  5 Aug 2022 00:40:42 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4088AABC90;
 Fri,  5 Aug 2022 00:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659660026; x=1691196026;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=QfbuYeIGWDn1LfdD3t3st6DQ2PMc1pHNRl99gbrprfE=;
 b=al49dfmEA453YUfE9077JhKPVVpPj3QVUPhXXsVnyhMGgOIAphHc9Z8i
 fwGDmNobDVTIUfKwY/RuI92nHtST18/L5mCLXEskFiekKK0Rs5Y/slKHq
 zg0ASYs1Vqf57AuKkIZLgU48MSflearvcUcYvh5GVqK6umSZvFRpjUWPy
 U1GUe682i9Xw2Yh2uHugmLKg0WEAPcLVh5ZqLPPI1XmRfa6KbETj3JI5G
 t7j8vXU3RRKtgfEOcSMVg/6Ce7Md4bBDZTGXXb5RU2bTtQ5iT7fV69sdO
 dcmNFss5Q6k5qprc0QuWah7kc1dpcNTxlN2lcQ3y+8XbGaQGjGpPlSw8M g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10429"; a="273134381"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="273134381"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 17:40:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="636308282"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 04 Aug 2022 17:40:24 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 4 Aug 2022 17:40:24 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 4 Aug 2022 17:40:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 4 Aug 2022 17:40:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 4 Aug 2022 17:40:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLFoioOy6yGzBPyuKJ9K5tBrXh+2Mqv/kUhtIvHokCFOibLnVY+vS/Q5+8ZtHFTntcqmxi+G6u6BaNO29i+7/Patj4cJ4oXcDQJzq5qLsLhOx4Pn8f7jqkgJBNecngIHeEJllPk2TTYOIA2mZ4tGZjjgkvwg7enGqv7PseEAbRPtZ9H6xYydvTVAnCbZs09228wW8ELamDhe8YalzQbCPecly46nOz3t5pl277xkUxCVAHlRqWJaolVGBtHHkbPw50xyhn0TofLKRlnEHirF2AnDdzPlzNK5vYCuN/UbBZUq+iGCcs6hNyJy++a1yeTRU2LbDEkjXIZNPbeWxUUTzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfbuYeIGWDn1LfdD3t3st6DQ2PMc1pHNRl99gbrprfE=;
 b=Ze34s+c+3XlaAi4jXE3EzhWl3zysTm48QPBaPqjk+cfQrxUB+/Gnf8F9Fyq6TnGVpI4nqy/sYN+QgMWkQ2tRwR4UFdXHaXm+nLZBhJSnX8yyDBYqNsAwisZ8mkPuTGMwMSbYkB7UF0lWNSrjQZmrTvLT3LPQjQcn/hVJ060Xucf/uJCuLACxyp6VjJJDxfXCi35g/z+/I35X5kVnEveeMDcyA1JXLxSQYKH0jihhlEw+HoTCNmMyBc0HjQjAalvSHmBHvQUHniAVn72SyN2NAG2vsYkhwYHYHDQPcK9z5BnJU+IGeZTMAMpRyEspypP+8LkEvmYjEAqi6dhOp0Uxrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 BY5PR11MB4498.namprd11.prod.outlook.com (2603:10b6:a03:1c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Fri, 5 Aug
 2022 00:40:02 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::fdd1:18b1:3e9c:b03e]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::fdd1:18b1:3e9c:b03e%5]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 00:40:02 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
Subject: Re: [Intel-gfx] [PATCH 3/7] drm/i915/guc: Add GuC <-> kernel time
 stamp translation information
Thread-Topic: [Intel-gfx] [PATCH 3/7] drm/i915/guc: Add GuC <-> kernel time
 stamp translation information
Thread-Index: AQHYoikMsVf/doc2k0CksYIgyCdh1a2fg8YA
Date: Fri, 5 Aug 2022 00:40:01 +0000
Message-ID: <f1c122a1babf75c8fb0910ee5e2e48d9f52e9722.camel@intel.com>
References: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
 <20220728022028.2190627-4-John.C.Harrison@Intel.com>
In-Reply-To: <20220728022028.2190627-4-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 067685da-0126-4a20-512f-08da767b087e
x-ms-traffictypediagnostic: BY5PR11MB4498:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kLyF+kB1Ioyb5OY0T4/SDyLlLsZwViq66Pyfhf0tPxteXv6aPqhgydwGwXbI8N71NW+2n2unbC93PBU6eR5TqSa/fCteNQ62ydiVDyJ3QZcAra1pdofLYb8/rrYVtAEUX/RZ/YZS2JNgBaPQjtnyTcTtfU1w5G+E1H9OUpuW7prD0wJJBn9wx1VkAP7RJp6Tf3VpSpDqRCZ1okmZ6uTfujRl1AZ/wrYb4EohzVv+okTC0WO/w/ai7IlmifyyGkBQpj+KnI7WcrUNFCzN7hpitYGH9cyzcmas7on92JjeiEdmYnYNjaNMYcUIVVYX26aR3iOmRGDGQ8EMqYXJxS1yVni2THcgKiOwo5zuE4wIO6C2bLJ/HdTFBWITMJ1qoQZ1VdBgzZ1ZtJ9WLYacMwjjDEsIiiacul4san90VobdhVQA3nihVjjcBnUbs0qOrSveHemyUkXteLQJwGKF5VTH7lkoycm+hIcFSa2DUH2TwrsVpDLxtyo/zGcM61CJ+6dqxZHnZnbGl6T2MbiB4RU6S/VbIB/aNnE6FMPNEn9m8C7gac1QxYYes+EKvSf3T37rlO3zH+UbIGrn+G6AC0GGzSAN68LWTqK0Pc7fR9hSFJdq2DqPzlTE/TT1x+ZS9o/k8+UIlKwon5QgxaZ3y5wqBDKmJBGd/XT9X78sulubitWRkjPAiX/u/bMtJrnKpRdZGWjlQjGJ5fShpQoxrLwjZDnnrHvb4u+2uBISa7CPsX+EFfJoVlk3kr0PWyy2WIF+xKJ5hTNVPp4aiRqIxill8psPvMYYQK/F76+z8SdfLdw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(346002)(366004)(39860400002)(136003)(396003)(83380400001)(2906002)(186003)(82960400001)(478600001)(8936002)(41300700001)(2616005)(36756003)(5660300002)(8676002)(91956017)(122000001)(76116006)(26005)(66946007)(38100700002)(71200400001)(66476007)(450100002)(6506007)(66446008)(66556008)(4326008)(64756008)(6486002)(316002)(38070700005)(110136005)(6512007)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVNObU9ic3dyYU1UR2VyRVE1eGprVWZWN0MzdHAwL1RyRGJJSVcrWGRHNWU0?=
 =?utf-8?B?WVBsb2tJMjdIMWo5Z2toZFdVRnNRbE9RZXVldys2cTFYK1FPdXBHQi8xNTRY?=
 =?utf-8?B?bnJDY0FuZVhnbkNYUHFCWHNZQzZZK3gvUk1xU1lpNG1pckljZlZmeHcvd2Vp?=
 =?utf-8?B?NStNaDlkSWFMeGZIYVZVMHNZNFdWUSs0RDN2K2JZSHlUYzlUN2dLaElnMk04?=
 =?utf-8?B?NHNKRFhrK0hUbzdWd2pkZjE5Vm9lMk9ZbldqRnNrTldKRm1LOE1YcytyREc0?=
 =?utf-8?B?NjAvSTZYdVdtZ3B6MkNyMUUyK2Q3QWVUTi94VTFkWTJvVS80ZEIyYy9sU20r?=
 =?utf-8?B?cFhXQ09Uek12MTJ0bmhmTzBwaGpVMEJJeEYxOG5QeWtHTnRET09yTUxDbUxS?=
 =?utf-8?B?UXBlT3lkUDRUb3o0OEJDQXFRak92SlpHOWZjbEE2WkNNZU9oUkFMTjJUeWk5?=
 =?utf-8?B?UitCUGdWYnlscHJLSS9Ndyt1L3VyK2ZqVkxDQTZ6QmN1SDg3NjlVZ2ZRM3Fl?=
 =?utf-8?B?MWpMTVZsUVIxMXA3WnRxdmxZcjRGQnRTYUUxdU1ObzBXZnUzSG1CZENuT0Zn?=
 =?utf-8?B?Ynd6dklET2hBVkgzMCtBOTliNmtxUGszV21Lc1NTV21UUjlpVkQwS096R0tr?=
 =?utf-8?B?VlJHb0Q5ZlF2ZDZ3ZUljM0V0LzN4Z2NtOGlLMGpKUmc0bFpleDM3KzJOazlz?=
 =?utf-8?B?WE5wSHBLUHZZVUhFWVUybGtGUW5hT2V2d1lMdm1ka1FIeGorRkpKdHRuSzNS?=
 =?utf-8?B?aTZSNkdTZTV4THpMdjRtTW0zbHArbUM3ekVyY1F3em1JQlAyeXFYcmxGUHNI?=
 =?utf-8?B?dXZjU3JvMjV2R21lRitYVnBIRitnQUtlTGJqajhGazFWN2R5TCtLSUN0aTNr?=
 =?utf-8?B?dDZwYVdXRUp2YXdJZWIvaGpsNDNFQitvQzVmdDM5TjMxaEtNWjBZbkR6RzRh?=
 =?utf-8?B?YmErektSSWExVFZoY2VHc1Y3TExIN1JLS1RsY3I3WlB3WEFlbDJVbFdRQmRh?=
 =?utf-8?B?Y3JQem1yZ0Vqd3pleElnWnpQdUxxQkgrM3J2VVllbm5hcm96KzJueHdodzkv?=
 =?utf-8?B?cTVLUUptMC95YUExTFk3YWhSNC9GV05pM3ByQW1FaDlXTVNiZklvSkErTG1P?=
 =?utf-8?B?ZzhYcTE4MUtFQkFXcHBPTld6RnMvTTU3aVk2aTVjTUZlb3M3SFJySlJvK09w?=
 =?utf-8?B?WlpCZ3UvMThBZE83OEVYYzhHRTBLQTVSSVVOZ3hLa1VvRWxVQzhKMjRGUlBP?=
 =?utf-8?B?cjQzMU9Na0pUVGxwNGMzUVBpUk9iWGFQMTFQazlsOXQxWUhmMlN3WHlCb0Rt?=
 =?utf-8?B?b2pybjl4aFJSUzlFcE9WdW5BdWZRWVIvczF6b3k2c25QNVJ2U2dXc3IrNUNF?=
 =?utf-8?B?TTNRSXppdTF6V1ZwT0dXUjNSbVVsSnJZMDRvS3BRQXhjMzlDVU02ZmVLa1dN?=
 =?utf-8?B?VEJxQ1RIMGl4TjNGbDNZTVBtVGYydUY0MEwwRDR2R3lwRTlSWk5YWU5TZFJz?=
 =?utf-8?B?Um4wTjdaODZmc0ZmaG9LbVY3VTh6clB0RE52QzFLY0MwRFQ5a1U3TCt1cXZN?=
 =?utf-8?B?elZvMDRqRXl1TlZhUjFaMlFjM2ZOYU1jUENERjNYWTRJWmt2ZFVweHcvTFd6?=
 =?utf-8?B?dVp2ZUd2UTFrMFZ2RHVJSFdHRXM1U3FwREI3c1A5OE1tL2oweU5LK3diZW55?=
 =?utf-8?B?NVBVbmxUcVlJMEVvU0VUUDk4L0o0LzV3Sml0Zlc5Y3o0MFhCeDB5UStKWHA2?=
 =?utf-8?B?Skk0UnZ6UlZrd0pjWWcwZnd6R3pmcDF3VUFMU3RiL2I1ZFg0ZEZlWEc3YXZr?=
 =?utf-8?B?eHREZkp2ME1FREI2bGNHQ2UyazJ2SkQ3TVA5c2RVNkJhWnFyTVFuYWNDVk9C?=
 =?utf-8?B?a1dxK3VUK0dOYlBmSUJVU3RKUlBIVDBIZlg1cy9oSDFIS1hnRkw2MXFybnlt?=
 =?utf-8?B?NkROVDBuL3IvUnhESHJPQ2phTGcvcFdSRGdBVVViVEFoeVhXbDhHWTIyb0p5?=
 =?utf-8?B?NTNpT2NESGtsbWkvdDNxaDhPRGlBb3htSFlSZXM1L3ZSL2Fvcy9YbnBKcXVj?=
 =?utf-8?B?ZG9OV2JnWUV0Q25PTVBidy84SFpDUTJmR0xUYlRNVkV6NHNuZUZROWdIRUhr?=
 =?utf-8?B?RGM4VGd0OXJLSy95cVJoYk4rUVFDY3hCVERYT1RkSnhZa3BqM2NJYit3b2U2?=
 =?utf-8?Q?fcFtn1HDyQoapWxihwMRPHo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <083C5884F0EBB9498A2A3073FBA65159@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 067685da-0126-4a20-512f-08da767b087e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2022 00:40:02.1272 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CNmyGJJtrf1NJcmtnGKFYhjZ//EmByQxF4zp/HHg3VndnPbJSS2nz+G11RCJsI8jLPvVaeyGtAzg3RYc43WDds2EyOk589S/6qP/Y64CirqUoaJahXZGXXEHLIe4mi1J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4498
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
Cc: "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSBoYXZlIGEgcXVlc3Rpb24gb24gYmVsb3cgY29kZS4gRXZlcnl0aGluZyBlbHNlIGxvb2tlZCBn
b29kLg0KV2lsbCByLWIgYXMgc29vbiBhcyB3ZSBjYW4gY2xvc2Ugb24gYmVsb3cgcXVlc3Rpb24N
Ci4uLmFsYW4NCg0KDQpPbiBXZWQsIDIwMjItMDctMjcgYXQgMTk6MjAgLTA3MDAsIEpvaG4uQy5I
YXJyaXNvbkBJbnRlbC5jb20gd3JvdGU6DQo+IEZyb206IEpvaG4gSGFycmlzb24gPEpvaG4uQy5I
YXJyaXNvbkBJbnRlbC5jb20+DQo+IA0KPiBJdCBpcyB1c2VmdWwgdG8gYmUgYWJsZSB0byBtYXRj
aCBHdUMgZXZlbnRzIHRvIGtlcm5lbCBldmVudHMgd2hlbg0KPiBsb29raW5nIGF0IHRoZSBHdUMg
bG9nLiBUaGF0IHJlcXVpcmVzIGJlaW5nIGFibGUgdG8gY29udmVydCBHdUMNCj4gdGltZXN0YW1w
cyB0byBrZXJuZWwgdGltZS4gU28sIHdoZW4gZHVtcGluZyBlcnJvciBjYXB0dXJlcyBhbmQvb3Ig
R3VDDQo+IGxvZ3MsIGluY2x1ZGUgYSBzdGFtcCBpbiBib3RoIHRpbWUgem9uZXMgcGx1cyB0aGUg
Y2xvY2sgZnJlcXVlbmN5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSm9obiBIYXJyaXNvbiA8Sm9o
bi5DLkhhcnJpc29uQEludGVsLmNvbT4NCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkx
NV9ncHVfZXJyb3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dwdV9lcnJv
ci5jDQo+IEBAIC0xNjc1LDYgKzE2NzgsMTMgQEAgZ3RfcmVjb3JkX3VjKHN0cnVjdCBpbnRlbF9n
dF9jb3JlZHVtcCAqZ3QsDQo+ICAJICovDQo+ICAJZXJyb3JfdWMtPmd1Y19mdy5wYXRoID0ga3N0
cmR1cCh1Yy0+Z3VjLmZ3LnBhdGgsIEFMTE9XX0ZBSUwpOw0KPiAgCWVycm9yX3VjLT5odWNfZncu
cGF0aCA9IGtzdHJkdXAodWMtPmh1Yy5mdy5wYXRoLCBBTExPV19GQUlMKTsNCj4gKw0KPiArCS8q
DQo+ICsJICogU2F2ZSB0aGUgR3VDIGxvZyBhbmQgaW5jbHVkZSBhIHRpbWVzdGFtcCByZWZlcmVu
Y2UgZm9yIGNvbnZlcnRpbmcgdGhlDQo+ICsJICogbG9nIHRpbWVzIHRvIHN5c3RlbSB0aW1lcyAo
aW4gY29uanVuY3Rpb24gd2l0aCB0aGUgZXJyb3ItPmJvb3R0aW1lIGFuZA0KPiArCSAqIGd0LT5j
bG9ja19mcmVxdWVuY3kgZmllbGRzIHNhdmVkIGVsc2V3aGVyZSkuDQo+ICsJICovDQo+ICsJZXJy
b3JfdWMtPnRpbWVzdGFtcCA9IGludGVsX3VuY29yZV9yZWFkKGd0LT5fZ3QtPnVuY29yZSwgR1VD
UE1USU1FU1RBTVApOw0KDQpBbGFuOnRoaXMgcmVnaXN0ZXIgaXMgaW4gdGhlIEdVQy1TSElNIGRv
bWFpbiBhbmQgc28gdW5sZXNzIGkgYW0gbWlzdGFrZW4gdSBtaWdodCBuZWVkIHRvIGVuc3VyZSB3
ZSBob2xkIGEgd2FrZXJlZiBzbw0KdGhhdCBhcmUgZ2V0dGluZyBhIGxpdmUgdmFsdWUgb2YgdGhl
IHJlYWwgdGltZXN0YW1wIHJlZ2lzdGVyIHRoYXQgdGhpcyByZWdpc3RlciBpcyBtaXJyb3ItaW5n
IGFuZCBub3QgYSBzdGFsZSBzbmFwc2hvdC4NCk9yIHdhcyB0aGlzIGFscmVhZHkgZG9uZSBmYXJ0
aGVyIHVwIHRoZSBzdGFjaz8gT3IgYXJlIHdlIGRvaW5nIHRoZSBvcHBvc2l0ZSAtIGluIHdoaWNo
IGNhc2Ugd2Ugc2hvdWxkIGVuc3VyZSB3ZSBkcm9wIGFsDQogd2FrZXJlZiBwcmlvciB0byB0aGlz
IHBvaW50LiAod2hpY2ggaSBhbSBub3Qgc3VyZSBpcyBhIHJlbGlhYmxlIG1ldGhvZCBzaW5jZSB3
ZSB3b3VsZG50IGtub3cgd2hhdCBHdUMgcmVmIHdhcyBhdCkuIA0KPiAgCWVycm9yX3VjLT5ndWNf
bG9nID0gY3JlYXRlX3ZtYV9jb3JlZHVtcChndC0+X2d0LCB1Yy0+Z3VjLmxvZy52bWEsDQo+ICAJ
CQkJCQkiR3VDIGxvZyBidWZmZXIiLCBjb21wcmVzcyk7DQo+ICANCg==
