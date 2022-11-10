Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CACCF62380D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 01:16:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B6510E638;
	Thu, 10 Nov 2022 00:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFDB10E634;
 Thu, 10 Nov 2022 00:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668039389; x=1699575389;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9ubGuHXQCFcKqEzrF9aXwIifjmWjfanlTp7gotmcQdQ=;
 b=MlqINU9LtqSK/HHw+g0LBhjVwqtJ0yN2trTNpbQRVf/RKamqpmIj0VSB
 /SD1M8tzyifZ/+yWxRbhcN3CH6zgI7EN/FCltyYbD+taDbPVvW5o6kzey
 I9Zez6haT3NoES+ci/PFHFEq6vl4PN9Px0Q8w5taET7cnQvSGT2EzaQw8
 0BiOuTMmui9FFdCfcxDKo+re94i/bHze/wVHIQXy7cL+uoXKy1/AwDkuI
 yCcsFZrOH18zUXzInMgzrboYpXexaPth501+CcJiIYdqb8QD3/7c/p/N1
 wohMbVkH71hE4PHSkC3YuT/jYh88UEyN6vi/jnswTON+iEoweVJYh/Ad2 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="373274524"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; d="scan'208";a="373274524"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 16:16:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="636951768"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; d="scan'208";a="636951768"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 09 Nov 2022 16:16:29 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 16:16:28 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 16:16:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 9 Nov 2022 16:16:27 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 9 Nov 2022 16:16:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ka66a2uEADztX0ZUOnU6cG6eHVpstTziiB4qRvOxerioketBAOHNJpwQ8Ir1VZjR6OEzR+xu/UN8LXt5L8IsaLFlKW44DJ/IfzxCDu12iOR3879HRn2BWe9m8E1vEzRo4aiuKnYmBo7nMr7lQ8t3eYmYAA/0+YARqzLcfz66x6vjW6c/Jug+iWWvMUQ+M36k3VHIKKsRrra2tTHD6VrLWZx/3QiYM57xaVoF3w+xPTdtx7sxeXWmor5+llQ5kpaN5J4kfhizbd7P1BHmmTFKkUebON8V0+IF8uWmq2wVbHxqHXeCDbclJutAn/0aCnMx6kL0g1oVOVixyr0UWHkSsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ubGuHXQCFcKqEzrF9aXwIifjmWjfanlTp7gotmcQdQ=;
 b=Hg1/BS3vjgHti1gZw+V4G614/Cguf1whBAZXjTl9SZ6iycAk711v2mMHc72+5rf5AJp1s/ygaD5DkIl8WpRRA9vK2MC9yAWP8jv2F2FL6Z7crnflXWENx6uic7X5Ibpt3LTimqLxREzplbfHuWJdQ/13A1v1Vj6IwuvkPD5GQd8KWXqe9RvA+pRNNiWksG3e22uWJLzXPV76HzAN8rPjvFFEqYKCy8Hen1zVDmIDHs1zkjX76YSjQc7SqGURtMz0BxO9iHWJTXKKnSLXKzLs7zq3ZpwxKETgE849qFSC7/9lnL23EWTykclyalAlD74gP2aZXWQ6AvKnscQvl1k0Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17)
 by CY8PR11MB7033.namprd11.prod.outlook.com (2603:10b6:930:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Thu, 10 Nov
 2022 00:16:25 +0000
Received: from CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::bd11:c577:72ab:57ed]) by CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::bd11:c577:72ab:57ed%8]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 00:16:25 +0000
From: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v6 00/20] drm/i915/vm_bind: Add VM_BIND functionality
Thread-Topic: [PATCH v6 00/20] drm/i915/vm_bind: Add VM_BIND functionality
Thread-Index: AQHY8oZGcORUHTvlFU2Bok+yfjaDA643TkqA
Date: Thu, 10 Nov 2022 00:16:25 +0000
Message-ID: <7a1c8c8ba83e3e7ba286e636de0074516a099d68.camel@intel.com>
References: <20221107085210.17221-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20221107085210.17221-1-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5620:EE_|CY8PR11MB7033:EE_
x-ms-office365-filtering-correlation-id: e66abf3c-4bfe-4e97-6ea2-08dac2b0ce4f
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +4NdRcQXxaKIpdrMmoQjLJsVzJuAnyUaKcbrvKEyAuXSv/itsF4yBQ5t0Uw4XqeBIB0zCNC5CfRQKh0Po0C5j4NvP0rx/utTc0yniiSYN3i23jS26EbUpfc9iPNdg6afpsCYGUJ/UnSntlMRoPVqTSIaWvqduU4PtQIWISfyX6C9Pmj1obQFyNH8X27MG/EsZFipYX7uR+B6F6HbAcdCfQN9gt89+YCI98SJNQVsjQv1slkgq4BodrDCapv6EKjz2koPjLazn3NpVQHUvTAsGlRY/LNXjidw/v2Pi3Jj+EPBcvmFshNNoQ+NeOEYapTPcU7i8GC8zfC1yKYVrEIA7rih52xUJjO2a9df00gDDUTyJcV8yFpYLEravdynNyQBZp+3UupbLqxr67lF/7Z9LkZNQTXJdfSHB0pqs4ERLy8Z8yQEXKIcR5Jkuc9he+YP+H55DDjjGMOLkgb60BvCm5WyAYU1roCoXLiVNGqtl9LxDRjqZWFE6/W92CtI63a2EyumUlfN2mwUNyQbKwjCuunQzzQwKCLAMHlOSHZkRLS+aTdG0X0magTnnIArVrZxFv5+c6FbhGXRkWzGbtOaIfM3KCvkVRc5LdJl30c1IMLdjvAwvkLECN/VHtbFP2HV/4J4XFt8/14w9DEEVh3sl0HcxT1KttdWgCzmTS+rwIlMKgfmcNIqKWAVDbQLwYN+o7BKMZoOHVO/azaopbFLyCamM7YEoqoMY2PqvDJ3iElDhn5RcamsFiJIrj/ZOPvxJriDKU/cTv1a04N1E+OD7g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(376002)(366004)(346002)(396003)(451199015)(66899015)(36756003)(86362001)(64756008)(66446008)(54906003)(91956017)(66556008)(8676002)(76116006)(4326008)(110136005)(41300700001)(66946007)(316002)(66476007)(82960400001)(83380400001)(38100700002)(38070700005)(6506007)(71200400001)(478600001)(5660300002)(6486002)(8936002)(122000001)(6512007)(186003)(2616005)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1F3bVJram9TWWNaK2JkYkVpZFVzWW1VR3BaS21JZXYzMVRBcWNXazUya0V6?=
 =?utf-8?B?Z08za0ZoT09EejEralN3ZHY3NGRyNGN5aFVlWXByVk04b2h5ZEM1YUJBelE5?=
 =?utf-8?B?bE52T3BiWG1kTnBGRGFBSFg3UHYrYXB1RWJDcC9tL3lsSjlqZFF4UjZuMWlG?=
 =?utf-8?B?c3FoWVB0WnQvOVhlVXNzeEd4WC85bGY1bG5maFJBSVBoV29UUHhKZEtxSzBD?=
 =?utf-8?B?dzRsSnZ2eWJpM1VnSW91L3JqYVRqZWtmdUNVdThOeU5FVmhGQlZaRzh0MHoz?=
 =?utf-8?B?RlptMWlPS1VIcm1wenZ3L01Qc3hCUDZtYXlIak1yRFRTVWd1Mm9WOTFHcHYy?=
 =?utf-8?B?QXRVRGhvNE1EZ2l5TjBuNktGWjZ0aU5pbDdZSTFXekFHYnF1NkNtRmwrSnEz?=
 =?utf-8?B?NHI0cXRDM3VWWDUzTysvOC9pS1dqRFhXTUJaV0tmQWtDR2NmMGxiMXlmdFkx?=
 =?utf-8?B?ZnVFODJpYWRRNVJGV3N4Q25abWJUa1RCMFZBYk9mWEpRcVI0MkNsZVpaWDNj?=
 =?utf-8?B?bE1OWkJ0eGdzSHErR1ZTNVQzUDRXYUFla1ZKV1ZIL2hrK1QyV0ZQSkUzZ01V?=
 =?utf-8?B?RjVXdTZBZFJpeG5sQXdJREdQWEZVdStJNXVjbVJPWFJnbGVEd1cvazByWG9V?=
 =?utf-8?B?TUJ6NWIvV1FPcUwrZGRIUWVKS3NvQXhYZk1KTmNuYmoxVDNTNHRDSlZoc2ZF?=
 =?utf-8?B?S2FTcm9iTitzdWFld2JLeCtGV2Z0RnhhUlgxZzBVeEJrUkhRaVkzdVBsdCtw?=
 =?utf-8?B?RGZIS2JQNDgrTENGY0VCUzRkSVdVYlM1Z09kWUJjMmFGejllaXpibERTOW9z?=
 =?utf-8?B?L3NPTmxucG4xK1E0dFQySS9qMGdpUjAwb3VUVm4zUDlaTWExbDdvYWVnR1BY?=
 =?utf-8?B?UmpCdHhkdmxVaGtTeTRFQ1dtTzJwQ3E0b1l0d1JHSUVpSXA3TS9EMHNJQ1N4?=
 =?utf-8?B?MDNONUllK3ZMRkFHQnFXOVhReUlsUjB0ditBRDlSblFWVGVCaUdLa1kwSHBC?=
 =?utf-8?B?S20yOTE5aHJaNWRrVXBNSXRGVVA3eUR0ckNVdm9ja3A2K2lDck1RNFp2T1cy?=
 =?utf-8?B?OTJEb2hEck5IaVd4aVdZNGtVN095Y1dVMmVhRGNGQktNZENGRDdxdFQ4YkRz?=
 =?utf-8?B?Yjd3TnR1Z3JuTGZSVHRHVmc0dmt4dEcrMVRtUk5POTJxMGlZSlZqL0M0d1Rt?=
 =?utf-8?B?dStNbWVCZmpDQnRhMWNZZGh6MHBodDRiODIxYWNBMHZmMVpJNG9MY01ZRGxL?=
 =?utf-8?B?Vy9DdGJtbE9MTkoyR21FWVBqbDdSeFRPRkVzbXFDTE1qQWxoMENWeEJvdDlF?=
 =?utf-8?B?ZElmcUhBdTgvR1BGcHRpUTdsWHdTZEJLWmJFdHlFRmMrNTNJOUJkdU9TZHRj?=
 =?utf-8?B?RWdDNWxCZTRaZVRLNFpzbFBNNlhYRllQWGdzdEZDZCtKYmdNVzZtaGhpTUVV?=
 =?utf-8?B?YzAzRS9POG90TllwVWpIblVIdk5iUC9GZE0wSWpvU0dzZnRwY2YxZjRESDVE?=
 =?utf-8?B?Mm0wTzl4RDJpeVhJNW9ZVTNNbEVsZHZnOS93ZlFGQ21GNnY4OGNRL2ljVkJn?=
 =?utf-8?B?UVNqUjRydGM5VXZVNjNWUWhuV0xiZlk2c1JpcUhzZmdHVlhSdE5Ja3Q0UXVs?=
 =?utf-8?B?UzFaZmQ4TmtOT3dJNW0xeVg5ODNyMlNBQWZwWE5reEJ2WVRDcVpOUDUxcmJa?=
 =?utf-8?B?K2NoVUtaUDd3UmExQnluMW9WdlBLWFQ2cDFPVkkyVng5Tk9xaVQ2dDJEclNN?=
 =?utf-8?B?MnRUeVMzUTJpOUI4UWlKVm9VL3BESXdqeUdQc0lnVEszWllGTjBKVU9RblU4?=
 =?utf-8?B?M1ZVd29TclVwRkwybXQ3WU9oNVR6SWh3Ri96dkJmL3JrMzdSQmh5d0ZoODF4?=
 =?utf-8?B?NXd6bWNpNkxtWEx0R3JsdjhMT216eDQ2M3ZWWkt6T2cyZ2FKRm9VZ3N3Nlho?=
 =?utf-8?B?VGNSbGRXYnYzMFlMY2p0R2NGbG95dDVybkpSRExYaW1qUlpFcWo5N1kybDhi?=
 =?utf-8?B?eWJnMk15WFFzNGpLVUVyQitDTEQ3TWV5a0VZWk50dm1rSm9mZ2NZOG80dkJr?=
 =?utf-8?B?M1V5Wm8vWTV2TTlCaFUrbGZDWkZBMDg3MU1jVnZzS1lCTGh0bWFWOGc4cGZq?=
 =?utf-8?B?U2tOWE9wanZtMUpidy9TUng2NWprZHJrejdSOStwa2NwUGhScy9xVnJ1UDY3?=
 =?utf-8?B?clV2OFptUVR4WXZsbCt4OU5MbW1UbWloMjM5YXBoa1lRbXBiV3RkSU4xVkpr?=
 =?utf-8?B?c045d29yMTJqT0RhNEpCTTRrdEx3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C10ABCEA9FCFAC4A8989B219616AB263@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e66abf3c-4bfe-4e97-6ea2-08dac2b0ce4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 00:16:25.7378 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G0ubkpFuiAHXxNKEvI9v0ypABVmg4CgI8l2A+CvOv5eM+bIY53nuCZoUGxlzmh3aofTWCrxU2H7wpjuSwLDegs53rcoTSy8SZKUcpUdJwPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7033
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
 "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>, "Ursulin, 
 Tvrtko" <tvrtko.ursulin@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>, "Hellstrom,
 Thomas" <thomas.hellstrom@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "jason@jlekstrand.net" <jason@jlekstrand.net>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIyLTExLTA3IGF0IDAwOjUxIC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOg0KPiBEUk1fSTkxNV9HRU1fVk1fQklORC9VTkJJTkQgaW9jdGxzIGFsbG93cyBV
TUQgdG8gYmluZC91bmJpbmQgR0VNDQo+IGJ1ZmZlciBvYmplY3RzIChCT3MpIG9yIHNlY3Rpb25z
IG9mIGEgQk9zIGF0IHNwZWNpZmllZCBHUFUgdmlydHVhbA0KPiBhZGRyZXNzZXMgb24gYSBzcGVj
aWZpZWQgYWRkcmVzcyBzcGFjZSAoVk0pLiBNdWx0aXBsZSBtYXBwaW5ncyBjYW4gbWFwDQo+IHRv
IHRoZSBzYW1lIHBoeXNpY2FsIHBhZ2VzIG9mIGFuIG9iamVjdCAoYWxpYXNpbmcpLiBUaGVzZSBt
YXBwaW5ncyAoYWxzbw0KPiByZWZlcnJlZCB0byBhcyBwZXJzaXN0ZW50IG1hcHBpbmdzKSB3aWxs
IGJlIHBlcnNpc3RlbnQgYWNyb3NzIG11bHRpcGxlDQo+IEdQVSBzdWJtaXNzaW9ucyAoZXhlY2J1
ZiBjYWxscykgaXNzdWVkIGJ5IHRoZSBVTUQsIHdpdGhvdXQgdXNlciBoYXZpbmcNCj4gdG8gcHJv
dmlkZSBhIGxpc3Qgb2YgYWxsIHJlcXVpcmVkIG1hcHBpbmdzIGR1cmluZyBlYWNoIHN1Ym1pc3Np
b24gKGFzDQo+IHJlcXVpcmVkIGJ5IG9sZGVyIGV4ZWNidWYgbW9kZSkuDQo+IA0KPiBUaGlzIHBh
dGNoIHNlcmllcyBzdXBwb3J0IFZNX0JJTkQgdmVyc2lvbiAxLCBhcyBkZXNjcmliZWQgYnkgdGhl
IHBhcmFtDQo+IEk5MTVfUEFSQU1fVk1fQklORF9WRVJTSU9OLg0KPiANCj4gQWRkIG5ldyBleGVj
YnVmMyBpb2N0bCAoSTkxNV9HRU1fRVhFQ0JVRkZFUjMpIHdoaWNoIG9ubHkgd29ya3MgaW4NCj4g
dm1fYmluZCBtb2RlLiBUaGUgdm1fYmluZCBtb2RlIG9ubHkgd29ya3Mgd2l0aCB0aGlzIG5ldyBl
eGVjYnVmMyBpb2N0bC4NCj4gVGhlIG5ldyBleGVjYnVmMyBpb2N0bCB3aWxsIG5vdCBoYXZlIGFu
eSBleGVjbGlzdCBzdXBwb3J0IGFuZCBhbGwgdGhlDQo+IGxlZ2FjeSBzdXBwb3J0IGxpa2UgcmVs
b2NhdGlvbnMgZXRjLiwgYXJlIHJlbW92ZWQuDQo+IA0KPiBOT1RFczoNCj4gKiBJdCBpcyBiYXNl
ZCBvbiBiZWxvdyBWTV9CSU5EIGRlc2lnbit1YXBpIHJmYy4NCj4gwqDCoERvY3VtZW50YXRpb24v
Z3B1L3JmYy9pOTE1X3ZtX2JpbmQucnN0DQoNCkhpDQoNCk9uZSBkaWZmZXJlbmNlIGZvciBleGVj
YnVmMyB0aGF0IEkgbm90aWNlZCB0aGF0IGlzIG5vdCBtZW50aW9uZWQgaW4gdGhlDQpSRkMgZG9j
dW1lbnQgaXMgdGhhdCB3ZSBub3cgZG9uJ3QgaGF2ZSBhIHdheSB0byBzaWduYWwNCkVYRUNfT0JK
RUNUX1dSSVRFLiBXaGVuIGxvb2tpbmcgYXQgdGhlIEtlcm5lbCBjb2RlLCBzb21lIHRoZXJlIGFy
ZSBzb21lDQpwaWVjZXMgdGhhdCBjaGVjayBmb3IgdGhpcyBmbGFnOg0KDQotIHRoZXJlJ3MgY29k
ZSB0aGF0IGRlYWxzIHdpdGggZnJvbnRidWZmZXIgcmVuZGVyaW5nIA0KLSB0aGVyZSdzIGNvZGUg
dGhhdCBkZWFscyB3aXRoIGZlbmNlcw0KLSB0aGVyZSdzIGNvZGUgdGhhdCBwcmV2ZW50cyBzZWxm
LW1vZGlmeWluZyBiYXRjaGVzDQotIGFub3RoZXIgdGhhdCBzZWVtcyByZWxhdGVkIHRvIHdhaXRp
bmcgZm9yIG9iamVjdHMNCg0KQXJlIHRoZXJlIGFueSBuZXcgcnVsZXMgcmVnYXJkaW5nIGZyb250
YnVmZmVyIHJlbmRlcmluZyB3aGVuIHdlIHVzZQ0KZXhlY2J1ZjM/IEFueSBvdGhlciBiZWhhdmlv
ciBjaGFuZ2VzIHJlbGF0ZWQgdG8gdGhlIG90aGVyIHBsYWNlcyB0aGF0DQp3ZSBzaG91bGQgZXhw
ZWN0IHdoZW4gdXNpbmcgZXhlY2J1ZjM/DQoNClRoYW5rcywNClBhdWxvDQoNCj4gDQo+ICogVGhl
IElHVCBSRkMgc2VyaWVzIGlzIHBvc3RlZCBhcywNCj4gwqDCoFtQQVRDSCBpLWctdCB2NSAwLzEy
XSB2bV9iaW5kOiBBZGQgVk1fQklORCB2YWxpZGF0aW9uIHN1cHBvcnQNCj4gDQo+IHYyOiBBZGRy
ZXNzIHZhcmlvdXMgcmV2aWV3IGNvbW1lbnRzDQo+IHYzOiBBZGRyZXNzIHJldmlldyBjb21tZW50
cyBhbmQgb3RoZXIgZml4ZXMNCj4gdjQ6IFJlbW92ZSB2bV91bmJpbmQgb3V0IGZlbmNlIHVhcGkg
d2hpY2ggaXMgbm90IHN1cHBvcnRlZCB5ZXQsDQo+IMKgwqDCoMKgcmVwbGFjZSB2bS0+dm1fYmlu
ZF9tb2RlIGNoZWNrIHdpdGggaTkxNV9nZW1fdm1faXNfdm1fYmluZF9tb2RlKCkNCj4gdjU6IFJl
bmRlciBrZXJuZWwtZG9jLCB1c2UgUElOX05PRVZJQ1QsIGxpbWl0IHZtX2JpbmQgc3VwcG9ydCB0
bw0KPiDCoMKgwqDCoG5vbi1yZWNvdmVyYWJsZSBmYXVsdHMNCj4gdjY6IFJlYmFzZWQsIG1pbm9y
IGZpeGVzLCBhZGQgcmVzZXJ2ZWQgZmllbGRzIHRvIGRybV9pOTE1X2dlbV92bV9iaW5kLA0KPiDC
oMKgwqDCoGFkZCBuZXcgcGF0Y2ggZm9yIGFzeW5jIHZtX3VuYmluZCBzdXBwb3J0DQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhIDxuaXJhbmphbmEudmlzaHdh
bmF0aGFwdXJhQGludGVsLmNvbT4NCj4gDQo+IE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmEgKDIw
KToNCj4gwqDCoGRybS9pOTE1L3ZtX2JpbmQ6IEV4cG9zZSB2bSBsb29rdXAgZnVuY3Rpb24NCj4g
wqDCoGRybS9pOTE1L3ZtX2JpbmQ6IEFkZCBfX2k5MTVfc3dfZmVuY2VfYXdhaXRfcmVzZXJ2YXRp
b24oKQ0KPiDCoMKgZHJtL2k5MTUvdm1fYmluZDogRXhwb3NlIGk5MTVfZ2VtX29iamVjdF9tYXhf
cGFnZV9zaXplKCkNCj4gwqDCoGRybS9pOTE1L3ZtX2JpbmQ6IEFkZCBzdXBwb3J0IHRvIGNyZWF0
ZSBwZXJzaXN0ZW50IHZtYQ0KPiDCoMKgZHJtL2k5MTUvdm1fYmluZDogSW1wbGVtZW50IGJpbmQg
YW5kIHVuYmluZCBvZiBvYmplY3QNCj4gwqDCoGRybS9pOTE1L3ZtX2JpbmQ6IFN1cHBvcnQgZm9y
IFZNIHByaXZhdGUgQk9zDQo+IMKgwqBkcm0vaTkxNS92bV9iaW5kOiBBZGQgc3VwcG9ydCB0byBo
YW5kbGUgb2JqZWN0IGV2aWN0aW9ucw0KPiDCoMKgZHJtL2k5MTUvdm1fYmluZDogU3VwcG9ydCBw
ZXJzaXN0ZW50IHZtYSBhY3RpdmVuZXNzIHRyYWNraW5nDQo+IMKgwqBkcm0vaTkxNS92bV9iaW5k
OiBBZGQgb3V0IGZlbmNlIHN1cHBvcnQNCj4gwqDCoGRybS9pOTE1L3ZtX2JpbmQ6IEFic3RyYWN0
IG91dCBjb21tb24gZXhlY2J1ZiBmdW5jdGlvbnMNCj4gwqDCoGRybS9pOTE1L3ZtX2JpbmQ6IFVz
ZSBjb21tb24gZXhlY2J1ZiBmdW5jdGlvbnMgaW4gZXhlY2J1ZiBwYXRoDQo+IMKgwqBkcm0vaTkx
NS92bV9iaW5kOiBJbXBsZW1lbnQgSTkxNV9HRU1fRVhFQ0JVRkZFUjMgaW9jdGwNCj4gwqDCoGRy
bS9pOTE1L3ZtX2JpbmQ6IFVwZGF0ZSBpOTE1X3ZtYV92ZXJpZnlfYmluZF9jb21wbGV0ZSgpDQo+
IMKgwqBkcm0vaTkxNS92bV9iaW5kOiBFeHBvc2UgaTkxNV9yZXF1ZXN0X2F3YWl0X2JpbmQoKQ0K
PiDCoMKgZHJtL2k5MTUvdm1fYmluZDogSGFuZGxlIHBlcnNpc3RlbnQgdm1hcyBpbiBleGVjYnVm
Mw0KPiDCoMKgZHJtL2k5MTUvdm1fYmluZDogdXNlcnB0ciBkbWEtcmVzdiBjaGFuZ2VzDQo+IMKg
wqBkcm0vaTkxNS92bV9iaW5kOiBMaW1pdCB2bV9iaW5kIG1vZGUgdG8gbm9uLXJlY292ZXJhYmxl
IGNvbnRleHRzDQo+IMKgwqBkcm0vaTkxNS92bV9iaW5kOiBBZGQgdWFwaSBmb3IgdXNlciB0byBl
bmFibGUgdm1fYmluZF9tb2RlDQo+IMKgwqBkcm0vaTkxNS92bV9iaW5kOiBSZW5kZXIgVk1fQklO
RCBkb2N1bWVudGF0aW9uDQo+IMKgwqBkcm0vaTkxNS92bV9iaW5kOiBBc3luYyB2bV91bmJpbmQg
c3VwcG9ydA0KPiANCj4gwqBEb2N1bWVudGF0aW9uL2dwdS9pOTE1LnJzdCAgICAgICAgICAgICAg
ICAgICAgfCAgNzggKy0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9NYWtlZmlsZSAgICAgICAg
ICAgICAgICAgfCAgIDMgKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9j
b250ZXh0LmMgICB8ICA0MyArLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dl
bV9jb250ZXh0LmggICB8ICAxNyArDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVf
Z2VtX2NyZWF0ZS5jICAgIHwgIDcyICstDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5
MTVfZ2VtX2RtYWJ1Zi5jICAgIHwgICA2ICsNCj4gwqAuLi4vZ3B1L2RybS9pOTE1L2dlbS9pOTE1
X2dlbV9leGVjYnVmZmVyLmMgICAgfCA1MTYgKy0tLS0tLS0tLS0NCj4gwqAuLi4vZ3B1L2RybS9p
OTE1L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyMy5jICAgfCA4NzEgKysrKysrKysrKysrKysrKysr
DQo+IMKgLi4uL2RybS9pOTE1L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyX2NvbW1vbi5jIHwgNjY2
ICsrKysrKysrKysrKysNCj4gwqAuLi4vZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2V4ZWNidWZmZXJf
Y29tbW9uLmggfCAgNzQgKysNCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1f
aW9jdGxzLmggICAgfCAgIDIgKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dl
bV9vYmplY3QuYyAgICB8ICAgMyArDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVf
Z2VtX29iamVjdC5oICAgIHwgICAyICsNCj4gwqAuLi4vZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dl
bV9vYmplY3RfdHlwZXMuaCAgfCAgIDYgKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9p
OTE1X2dlbV91c2VycHRyLmMgICB8ICAxOSArDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2Vt
L2k5MTVfZ2VtX3ZtX2JpbmQuaCAgIHwgIDMwICsNCj4gwqAuLi4vZHJtL2k5MTUvZ2VtL2k5MTVf
Z2VtX3ZtX2JpbmRfb2JqZWN0LmMgICAgfCA0NDkgKysrKysrKysrDQo+IMKgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3QvaW50ZWxfZ3R0LmMgICAgICAgICAgIHwgIDE3ICsNCj4gwqBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndC9pbnRlbF9ndHQuaCAgICAgICAgICAgfCAgMjEgKw0KPiDCoGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfZHJpdmVyLmMgICAgICAgICAgICB8ICAgNCArDQo+IMKgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaCAgICAgICAgICAgICAgIHwgICAyICsNCj4gwqBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dlbV9ndHQuYyAgICAgICAgICAgfCAgMzkgKw0KPiDCoGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2d0dC5oICAgICAgICAgICB8ICAgMyArDQo+IMKg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZXRwYXJhbS5jICAgICAgICAgIHwgICAzICsNCj4g
wqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3N3X2ZlbmNlLmMgICAgICAgICAgfCAgMjggKy0N
Cj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3N3X2ZlbmNlLmggICAgICAgICAgfCAgMjMg
Ky0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3ZtYS5jICAgICAgICAgICAgICAgfCAx
ODYgKysrLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdm1hLmggICAgICAgICAgICAg
ICB8ICA2OCArLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdm1hX3R5cGVzLmggICAg
ICAgICB8ICAzOSArDQo+IMKgaW5jbHVkZS91YXBpL2RybS9pOTE1X2RybS5oICAgICAgICAgICAg
ICAgICAgIHwgMjY0ICsrKysrLQ0KPiDCoDMwIGZpbGVzIGNoYW5nZWQsIDMwMDggaW5zZXJ0aW9u
cygrKSwgNTQ2IGRlbGV0aW9ucygtKQ0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZlcjMuYw0KPiDCoGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZlcl9jb21tb24u
Yw0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9n
ZW1fZXhlY2J1ZmZlcl9jb21tb24uaA0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fdm1fYmluZC5oDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV92bV9iaW5kX29iamVjdC5jDQo+IA0K
DQo=
