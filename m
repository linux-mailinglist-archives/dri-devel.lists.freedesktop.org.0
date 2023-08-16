Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 787B877D93C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 05:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6313A10E2B7;
	Wed, 16 Aug 2023 03:48:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2002C10E2B7;
 Wed, 16 Aug 2023 03:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692157683; x=1723693683;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=dBBmEgZbPUUDQqqfb0TgrXbvVrxoExa+O6MtObhlKyU=;
 b=mLS2TrLa9v59MWUceTdp/kzWFqF34DhRPW7/C+44EpD7JQNTtGVrvcoC
 kqvF9EQR8coTZ4SPd4Gh1UXxW5bp7elwOenrNgqsBPMkZI0VvVfMGcnpr
 7eIFo0fa3nchrXbrV61tfN9P3+Wmu3CXddXYBWqV+cphMUUjVuxx27g2t
 ePJW395xyo6mVfmSbZKgdSWm0nPp5fEH7YR3BvjPFVAW56k8VOnC4pz6p
 AlAkU01qOShTORf8CmigIGBq4u3CIf0VxG0VG9GTENsN+wBCndpACworL
 n3mHymudf8bWU/cZh1OdJPEumPqmLIR6L5Yv9beC2RbKrf1SucqCivkdr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="362584636"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="362584636"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 20:48:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="710961525"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="710961525"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 15 Aug 2023 20:48:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 20:48:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 15 Aug 2023 20:48:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 15 Aug 2023 20:48:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XoezrryJZWMMgblP44/QEDYfdBfT1F/5wrU4CyuRXVYtpYNmJHbBeNiDYzP7kLTdQ3SzLldlEAoMfhb8LPDw9Jk4ZEb873rC5ZW/Y7ybT8lzHkzIy9oF1adDndhxch1abf7wlQnZsCABn0PmpHoPBDMbiK2D4DbCpezvO3FnH7Ph2kiKKEWCk0b41K2J8TBUue7WAR//5Qq6zCdrxkwm34U4zipgViUTubxEo3gWrepYy/uGwjQ7VpJnr1lye23B7s62Rv51yXrqKO8GiSl5/cJ6ibeNWuceXefmmif2UB3wddY/tGCDYemHnvUFUe3SmeDha4q46/gaKKVhR0f9rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBBmEgZbPUUDQqqfb0TgrXbvVrxoExa+O6MtObhlKyU=;
 b=DJZ/8jLfRy7Y0dc8ma8JjN3iacUTKstwz0iOU8v7rWH16aDDXQnv9l7s5R+taKU5cToQ977s+jEb4TGnFfHzogsLDA4wo90G6HHQwov5e4nId9LFYBFSVR97Pfm1teVMrkSIx7MayrNH8Af08hOt42FJ3UT0RM+fXLA/hM5rlAQsw+Cy3e4KBWrlfpO3mMc8vG9vtmjIVinuxC3CE8M2uYtlERS0b97O2ZADxl5X9ze80njFihmoMB+cAqJseNf2Osi9GKuxIteAtndTAYSaIoTSsM4wcgWnMRk4xV2T9SEHWHAiu4DNRDFgXMWKiqe7h2yWp46ike0gDFm6Y2N9wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by DS7PR11MB7807.namprd11.prod.outlook.com (2603:10b6:8:e3::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.23; Wed, 16 Aug 2023 03:48:00 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::27f1:a7a0:b6db:6c99]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::27f1:a7a0:b6db:6c99%3]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 03:47:59 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: Felix Kuehling <felix.kuehling@amd.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, "Welty, Brian"
 <brian.welty@intel.com>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: Implement svm without BO concept in xe driver
Thread-Topic: Implement svm without BO concept in xe driver
Thread-Index: AdnPImk6MOYV1wEITTKbUW99JKTN8AAlN1TAAAO9foAACdAN4A==
Date: Wed, 16 Aug 2023 03:47:58 +0000
Message-ID: <SA1PR11MB69918E5603E286961789DE6D9215A@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <SA1PR11MB699192A66D7A2CC7305A59569214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <SA1PR11MB6991F9E3107C963BDF95E04E9214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <e0d7d6a2-5c9d-6e17-4b4b-be03deb6c130@amd.com>
In-Reply-To: <e0d7d6a2-5c9d-6e17-4b4b-be03deb6c130@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|DS7PR11MB7807:EE_
x-ms-office365-filtering-correlation-id: d93c734b-2e0e-4f31-00fb-08db9e0b954a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aL+1/MlIkod5QMWLMdDeGb6WbQZuotXMVd4aGEDy4zYBTvJP7PHL2yRvDob5mcefPdB+puuCR9vNXIRM+GhZTXIykf44DnPqzfvcbdipf4+1zzmuYCM4C9f0lfKFjN3Jj8VkY5C1K50o1iB9wwBtiCMu5k7gcXLa6HZKr5mtgdLE444DURzUDBbu1QhJDF+AqmWxeo9KjJVc7IZph8RmQ7BlssBVgSu0k/cTrfTVOxorhKLAjEyQ3uES3LPRlgMC2EGOHiCV9KEeR7wsrGzMRvke/hP6+3Pq7LDFrlmGwB649bCcBMwm3HuG2GBYx/Zl2yBgKZQNS/oy0mRLtsXdGhQ+CgL7v8vFrYq0cNQGwOgTxJHqzaE9UTlr+BNGV+6qfF7GGn+j/g7hJAksEACKUndvlJRqXTpM/0VttmPKxkgMD27yyrT8+FCuDHLvoHjFS8D+qXdYGZD+NKpcou2hDzasTEUBnTVH9SCf6gmmwsBV8tvRglnc7YhWjHhMCNm55AAz1JmZbHbvM8KGVvaY4gthOSfP6nJpoqp6/ClL7pO9RenyGTKCQACo6v+SK3Qy1sel0FFegVENKwf+XBgrN+bWeyJ1P07kkgIL97UKj6elRtJVw9DXdDssoaK+sDxZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(376002)(396003)(366004)(1800799009)(186009)(451199024)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(66899024)(110136005)(86362001)(9686003)(26005)(478600001)(7696005)(6506007)(53546011)(33656002)(71200400001)(82960400001)(83380400001)(921005)(122000001)(38070700005)(38100700002)(66574015)(55016003)(8676002)(8936002)(52536014)(5660300002)(41300700001)(2906002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WkxrKzd1dXlSZkNjMzB3bW94eGRkSGVDNnFxY3kzNndkM3ZOSXI1T2t0UmJN?=
 =?utf-8?B?NmpxcWhlcUhXaDkvdUtxS2hxRDVxMng0Q0FFRHI3cm9DUWo0SnJhNDBrenJy?=
 =?utf-8?B?SlI3KzlrVWF6Z2JvL2FPdklQMUozVFJpRWpBWEdQRHJkdjRGcjgxdHQxcWhR?=
 =?utf-8?B?TUJ2UDFUVWgyZEwxK3BjZUVlVWZSa1dxZFZyN0k0S3ZaeUJTSHN0WjdudzJB?=
 =?utf-8?B?dXJqRnhVN3RsSWZqeWgyQmNxZXd4Nit1NHhmQTErQUV4S3NVZVRWQWluUy8y?=
 =?utf-8?B?KzV1Q0JJOEp5QkttTTlPU3JZVmRZNWViTGJ3SzNnN296S1VoNHFsMXhDby9p?=
 =?utf-8?B?N1BhMmFxemZPZmdNTFQ2YVhzSEVLOWNHKzVYNHIwV0RpTGVwdWZrOHQrOTNt?=
 =?utf-8?B?UkZicE5ua3cveE9BV1VDd3hjRThySTd3UmpEUExPWWUvclNkT0dxMFhDODFZ?=
 =?utf-8?B?SnZtYW1DMUZOTVJQZVRkRS9LQ1c1R0p3SEJoYllhK0RESmRhT0ZnVmR6eWww?=
 =?utf-8?B?UTdrQWJZYU1qY2NwcVpscE45b21xMThxT3pxU3JWZzhEcDdXOXVsZllYanF6?=
 =?utf-8?B?M0YzaEdhbVpncGswUXNrdGRRbFFYTGMyWlRKS0lMMzF5QytJRFJBeGZULzEv?=
 =?utf-8?B?S25kSWE5Y0N4eWd6LzZ6VkN1QUM3N2VycnFaVGFNVHN0NitDSVFjQkN5RVlR?=
 =?utf-8?B?VDVxVEJDNURRZ3lJcWxZLzV6NFFOYzBmTU9ES256d0svM2pLMU1CQjBBbm42?=
 =?utf-8?B?anFwbWE4SjM1aG5TNWNMSzFFU1NSSmpqNlNuUXJ6Z2hoZlJVQmoxVHBTWlVJ?=
 =?utf-8?B?L21haVZqK2NTSkthcjRuNWxsU05jL0NRMHZWNzZaVWF5ems4SXZockFFTmEz?=
 =?utf-8?B?TmQ4dXg2UmxjZm1YRHk1Z1BpTkFhRXNiaThHSHpMYXhKRmpXNGgrMy96Ujdz?=
 =?utf-8?B?OHN2TlRXYklmTkZwekVDVktzNXY3eUJxa0NjbXFtOTRLQ2VlRVlENVFMVUlL?=
 =?utf-8?B?dTgzcllIK0FrRzNEYiszTkN5K3FWZ2FXQWpWYlBCRkVHOWJwN3VpbElYNlk1?=
 =?utf-8?B?REw2TnNCTE9pWXNSMjBZcEh0d3dPZTlZQm8yOXNGRXJERkZ2c0U2MTdsd1dO?=
 =?utf-8?B?UUE1YjZCT1U3emQ0WERlNm55dEhZUTh5R1crNlpKTTVWSTZCTWlRaXhJYm0y?=
 =?utf-8?B?QUdEOGRPN1NNUC9WWGp1YkExcEZremlRaDhoSGtFMlkwdkRzVldHRFBqR2c2?=
 =?utf-8?B?MXJlenNsblVqTXN4My9ySS9Nbkc2dlhPY1VCVFBWNzE4UTFVRnc2SGE5WHRi?=
 =?utf-8?B?VzVUZ3lveFJFQkFXUGxBYTZmWkE1TGFsejBGQmJYNy9tdHlnakpuSCtmTEFW?=
 =?utf-8?B?WU1TcnpwaytYYjVRK1FDVUI2Y2FMdGxPUFd4aklIZjhEMFhlZWZ2Q1VXMS9E?=
 =?utf-8?B?VGMyOThGQXFBWENBYnhXYzNBdWU5ZGZxT0FwQmthNW1uYlF4TitnOXNQbU1F?=
 =?utf-8?B?M0VNVWRzSDh0dTltV1BVaXcxSUFPR0xZT3NrZzdTVHNiRk85ellISjIwS2w0?=
 =?utf-8?B?Z015dEpPLy83L09kWlRoRitRNTFhd2t3TldoZ1BwdFhIMWdZSnVKVWhXSzF6?=
 =?utf-8?B?VkRzYXN1cHdYeEcyUDlnZmZ0SmkrbElrbUFIQ1hFVG00WWc4bk1oZit2YmZq?=
 =?utf-8?B?VzJCQUt2T3M0RC9maXFUUzNrVDVNaGJOalV4azJjeFh1TWJvL2xpUkE4akNM?=
 =?utf-8?B?Q3BURUExTk52UXpuRUhkczUzWDAxd1VYS2NVUkZFTzRTZ2xtdXN6RTRzaGh6?=
 =?utf-8?B?L2N2QUxiWDV1anpWa2lCVDN1MG94eEZDZmJSeEN2MC9KWWxVZWRCMXdrbjla?=
 =?utf-8?B?Y25vdGYzR0V6K3BJYURFTW5QVlh0RXZaNk5aODhXaFdsem5SR0ZqNysyVW0x?=
 =?utf-8?B?Ylp3dHVWT1dUcVdFa0FiVUhqUGk3UkF2M1ZYSUdoVjNrNFo4Nk5nRThLTEZH?=
 =?utf-8?B?cklCSlljOE1nR0ludUl3RHgyWWlBdDM2ODc2dGtQZUFONVNqR2JHTnFvN2Vt?=
 =?utf-8?B?RTZZMXZEbnhRYXh4WXJjU0kzS0FTOWNxRkhiNE9vUVNLZHlxTXlMejNWTFdq?=
 =?utf-8?Q?FqLM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d93c734b-2e0e-4f31-00fb-08db9e0b954a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2023 03:47:58.9047 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5jhowfWOerg44l1iE49miD6CIjsiaB5kspskMzut7yIam6p6KLoBAbebBm3PJgb65qmUMeqR8eV7QxNdiC3PvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7807
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmVsaXgsDQoNCkl0IGlzIGdyZWF0IHRvIGhlYXIgZnJvbSB5b3UhDQoNCldoZW4gSSBpbXBs
ZW1lbnQgdGhlIEhNTS1iYXNlZCBTVk0gZm9yIGludGVsIGRldmljZXMsIEkgZm91bmQgdGhpcyBp
bnRlcmVzdGluZyBwcm9ibGVtOiBITU0gdXNlcyBzdHJ1Y3QgcGFnZSBiYXNlZCBtZW1vcnkgbWFu
YWdlbWVudCBzY2hlbWUgd2hpY2ggaXMgY29tcGxldGVseSBkaWZmZXJlbnQgYWdhaW5zdCB0aGUg
Qk8vVFRNIHN0eWxlIG1lbW9yeSBtYW5hZ2VtZW50IHBoaWxvc29waHkuIFdyaXRpbmcgU1ZNIGNv
ZGUgdXBvbiB0aGUgQk8vVFRNIGNvbmNlcHQgc2VlbXMgb3ZlcmtpbGwgYW5kIGF3a3dhcmQuIFNv
IEkgdGhvdWdodCB3ZSBiZXR0ZXIgbWFrZSB0aGUgU1ZNIGNvZGUgQk8tbGVzcyBhbmQgVFRNLWxl
c3MuIEJ1dCBvbiB0aGUgb3RoZXIgaGFuZCwgY3VycmVudGx5IHZyYW0gZXZpY3Rpb24gYW5kIGNn
cm91cCBtZW1vcnkgYWNjb3VudGluZyBhcmUgYWxsIGhvb2tlZCB0byB0aGUgVFRNIGxheWVyLCB3
aGljaCBtZWFucyBhIFRUTS1sZXNzIFNWTSBkcml2ZXIgd29uJ3QgYmUgYWJsZSB0byBldmljdCB2
cmFtIGFsbG9jYXRlZCB0aHJvdWdoIFRUTS9ncHVfdnJhbV9tZ3IuDQoNCklkZWFsbHkgSE1NIG1p
Z3JhdGlvbiBzaG91bGQgdXNlIGRybS1idWRkeSBmb3IgdnJhbSBhbGxvY2F0aW9uLCBidXQgd2Ug
bmVlZCB0byBzb2x2ZSB0aGlzIFRUTS9ITU0gbXV0dWFsIGV2aWN0aW9uIHByb2JsZW0gYXMgeW91
IHBvaW50ZWQgb3V0IChJIGFtIHdvcmtpbmcgd2l0aCBhcHBsaWNhdGlvbiBlbmdpbmVlcnMgdG8g
ZmlndXJlIG91dCB3aGV0aGVyIG11dHVhbCBldmljdGlvbiBjYW4gdHJ1bHkgYmVuZWZpdCBhcHBs
aWNhdGlvbnMpLiBNYXliZSB3ZSBjYW4gaW1wbGVtZW50IGEgVFRNLWxlc3MgdnJhbSBtYW5hZ2Vt
ZW50IGJsb2NrIHdoaWNoIGNhbiBiZSBzaGFyZWQgYi90IHRoZSBITU0tYmFzZWQgZHJpdmVyIGFu
ZCB0aGUgQk8tYmFzZWQgZHJpdmVyOg0KICAgKiBhbGxvY2F0ZS9mcmVlIG1lbW9yeSBmcm9tIGRy
bS1idWRkeSwgYnVkZHktYmxvY2sgYmFzZWQNCiAgICogbWVtb3J5IGV2aWN0aW9uIGxvZ2ljcywg
YWxsb3cgZHJpdmVyIHRvIHNwZWNpZnkgd2hpY2ggYWxsb2NhdGlvbiBpcyBldmljdGFibGUNCiAg
ICogbWVtb3J5IGFjY291bnRpbmcsIGNncm91cCBsb2dpYw0KDQpNYXliZSBzdWNoIGEgYmxvY2sg
Y2FuIGJlIHBsYWNlZCBhdCBkcm0gbGF5ZXIgKHNheSwgY2FsbCBpdCBkcm1fdnJhbV9tZ3IgZm9y
IG5vdyksIHNvIGl0IGNhbiBiZSBzaGFyZWQgYi90IGFtZCBhbmQgaW50ZWwuIFNvIEkgaW52b2x2
ZWQgYW1kIGZvbGtzLiBUb2RheSBib3RoIGFtZCBhbmQgaW50ZWwteGUgZHJpdmVyIGltcGxlbWVu
dGVkIGEgVFRNLWJhc2VkIHZyYW0gbWFuYWdlciB3aGljaCBkb2Vzbid0IHNlcnZlIGFib3ZlIGRl
c2lnbiBnb2FsLiBPbmNlIHRoZSBkcm1fdnJhbV9tZ3IgaXMgaW1wbGVtZW50ZWQsIGJvdGggYW1k
IGFuZCBpbnRlbCdzIEJPLWJhc2VkL1RUTS1iYXNlZCB2cmFtIG1hbmFnZXIsIGFuZCB0aGUgSE1N
LWJhc2VkIHZyYW0gbWFuYWdlciBjYW4gY2FsbCBpbnRvIHRoaXMgZHJtLXZyYW0tbWdyLg0KDQpU
aGFua3MgYWdhaW4sDQpPYWsNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBGZWxpeCBLdWVobGluZyA8ZmVsaXgua3VlaGxpbmdAYW1kLmNvbT4NCj4gU2VudDogQXVndXN0
IDE1LCAyMDIzIDY6MTcgUE0NCj4gVG86IFplbmcsIE9hayA8b2FrLnplbmdAaW50ZWwuY29tPjsg
VGhvbWFzIEhlbGxzdHLDtm0NCj4gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPjsg
QnJvc3QsIE1hdHRoZXcNCj4gPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPjsgVmlzaHdhbmF0aGFw
dXJhLCBOaXJhbmphbmENCj4gPG5pcmFuamFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPjsg
V2VsdHksIEJyaWFuIDxicmlhbi53ZWx0eUBpbnRlbC5jb20+Ow0KPiBDaHJpc3RpYW4gS8O2bmln
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+OyBQaGlsaXAgWWFuZw0KPiA8UGhpbGlwLllhbmdA
YW1kLmNvbT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLQ0KPiBkZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IEltcGxlbWVudCBzdm0gd2l0aG91
dCBCTyBjb25jZXB0IGluIHhlIGRyaXZlcg0KPiANCj4gSGkgT2FrLA0KPiANCj4gSSdtIG5vdCBz
dXJlIHdoYXQgeW91J3JlIGxvb2tpbmcgZm9yIGZyb20gQU1EPyBBcmUgd2UganVzdCBDQydlZCBG
WUk/IE9yDQo+IGFyZSB5b3UgbG9va2luZyBmb3IgY29tbWVudHMgYWJvdXQNCj4gDQo+ICAgKiBP
dXIgcGxhbnMgZm9yIFZSQU0gbWFuYWdlbWVudCB3aXRoIEhNTQ0KPiAgICogT3VyIGV4cGVyaWVu
Y2Ugd2l0aCBCTy1iYXNlZCBWUkFNIG1hbmFnZW1lbnQNCj4gICAqIFNvbWV0aGluZyBlbHNlPw0K
PiANCj4gSU1PLCBoYXZpbmcgc2VwYXJhdGUgbWVtb3J5IHBvb2xzIGZvciBITU0gYW5kIFRUTSBp
cyBhIG5vbi1zdGFydGVyIGZvcg0KPiBBTUQuIFdlIG5lZWQgYWNjZXNzIHRvIHRoZSBmdWxsIFZS
QU0gaW4gZWl0aGVyIG9mIHRoZSBBUElzIGZvciBpdCB0byBiZQ0KPiB1c2VmdWwuIFRoYXQgYWxz
byBtZWFucywgd2UgbmVlZCB0byBoYW5kbGUgbWVtb3J5IHByZXNzdXJlIGluIGJvdGgNCj4gZGly
ZWN0aW9ucy4gVGhhdCdzIG9uZSBvZiB0aGUgbWFpbiByZWFzb25zIHdlIHdlbnQgd2l0aCB0aGUg
Qk8tYmFzZWQNCj4gYXBwcm9hY2ggaW5pdGlhbGx5LiBJIHRoaW5rIGluIHRoZSBsb25nIHJ1biwg
dXNpbmcgdGhlIGJ1ZGR5IGFsbG9jYXRvciwNCj4gb3IgdGhlIGFtZGdwdV92cmFtX21nciBkaXJl
Y3RseSBmb3IgSE1NIG1pZ3JhdGlvbnMgd291bGQgYmUgYmV0dGVyLA0KPiBhc3N1bWluZyB3ZSBj
YW4gaGFuZGxlIG1lbW9yeSBwcmVzc3VyZSBpbiBib3RoIGRpcmVjdGlvbnMgYmV0d2VlbiBITU0N
Cj4gYW5kIFRUTSBzaGFyaW5nIHRoZSBzYW1lIHBvb2wgb2YgcGh5c2ljYWwgbWVtb3J5Lg0KPiAN
Cj4gUmVnYXJkcywNCj4gIMKgIEZlbGl4DQo+IA0KPiANCj4gT24gMjAyMy0wOC0xNSAxNjozNCwg
WmVuZywgT2FrIHdyb3RlOg0KPiA+DQo+ID4gQWxzbyArIENocmlzdGlhbg0KPiA+DQo+ID4gVGhh
bmtzLA0KPiA+DQo+ID4gT2FrDQo+ID4NCj4gPiAqRnJvbToqSW50ZWwteGUgPGludGVsLXhlLWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiAqT24gQmVoYWxmIE9mDQo+ID4gKlplbmcsIE9h
aw0KPiA+ICpTZW50OiogQXVndXN0IDE0LCAyMDIzIDExOjM4IFBNDQo+ID4gKlRvOiogVGhvbWFz
IEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPjsgQnJvc3QsDQo+
ID4gTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+OyBWaXNod2FuYXRoYXB1cmEsIE5p
cmFuamFuYQ0KPiA+IDxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbT47IFdlbHR5
LCBCcmlhbg0KPiA+IDxicmlhbi53ZWx0eUBpbnRlbC5jb20+OyBGZWxpeCBLdWVobGluZyA8ZmVs
aXgua3VlaGxpbmdAYW1kLmNvbT47DQo+ID4gUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5j
b20+OyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+ID4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KPiA+ICpTdWJqZWN0OiogW0ludGVsLXhlXSBJbXBsZW1lbnQgc3Zt
IHdpdGhvdXQgQk8gY29uY2VwdCBpbiB4ZSBkcml2ZXINCj4gPg0KPiA+IEhpIFRob21hcywgTWF0
dCBhbmQgYWxsLA0KPiA+DQo+ID4gVGhpcyBjYW1lIHVwIHdoZW4gSSBwb3J0IGk5MTUgc3ZtIGNv
ZGVzIHRvIHhlIGRyaXZlci4gSW4gaTkxNQ0KPiA+IGltcGxlbWVudGF0aW9uLCB3ZSBoYXZlIGk5
MTVfYnVkZHkgbWFuYWdlIGdwdSB2cmFtIGFuZCBzdm0gY29kZXMNCj4gPiBkaXJlY3RseSBjYWxs
IGk5MTVfYnVkZHkgbGF5ZXIgdG8gYWxsb2NhdGUvZnJlZSB2cmFtLiBUaGVyZSBpcyBubw0KPiA+
IGdlbV9iby90dG0gYm8gY29uY2VwdCBpbnZvbHZlZCBpbiB0aGUgc3ZtIGltcGxlbWVudGF0aW9u
Lg0KPiA+DQo+ID4gSW4geGUgZHJpdmVyLCDCoHdlIGhhdmUgZHJtX2J1ZGR5LCB4ZV90dG1fdnJh
bV9tZ3IgYW5kIHR0bSBsYXllciB0bw0KPiA+IG1hbmFnZSB2cmFtLiBEcm1fYnVkZHkgaXMgaW5p
dGlhbGl6ZWQgZHVyaW5nIHhlX3R0bV92cmFtX21ncg0KPiA+IGluaXRpYWxpemF0aW9uLiBWcmFt
IGFsbG9jYXRpb24vZnJlZSBpcyBkb25lIHRocm91Z2ggeGVfdHRtX3ZyYW1fbWdyDQo+ID4gZnVu
Y3Rpb25zIHdoaWNoIGNhbGwgaW50byBkcm1fYnVkZHkgbGF5ZXIgdG8gYWxsb2NhdGUgdnJhbSBi
bG9ja3MuDQo+ID4NCj4gPiBJIHBsYW4gdG8gaW1wbGVtZW50IHhlIHN2bSBkcml2ZXIgdGhlIHNh
bWUgd2F5IGFzIHdlIGRpZCBpbiBpOTE1LA0KPiA+IHdoaWNoIG1lYW5zIHRoZXJlIHdpbGwgbm90
IGJlIGJvIGNvbmNlcHQgaW4gdGhlIHN2bSBpbXBsZW1lbnRhdGlvbi4NCj4gPiBEcm1fYnVkZHkg
d2lsbCBiZSBwYXNzZWQgdG8gc3ZtIGxheWVyIGR1cmluZyB2cmFtIGluaXRpYWxpemF0aW9uIGFu
ZA0KPiA+IHN2bSB3aWxsIGFsbG9jYXRlL2ZyZWUgbWVtb3J5IGRpcmVjdGx5IGZyb20gZHJtX2J1
ZGR5LCBieXBhc3NpbmcNCj4gPiB0dG0veGVlIHZyYW0gbWFuYWdlci4gSGVyZSBhcmUgYSBmZXcg
Y29uc2lkZXJhdGlvbnMvdGhpbmdzIHdlIGFyZQ0KPiA+IGF3YXJlIG9mOg0KPiA+DQo+ID4gIDEu
IFRoaXMgYXBwcm9hY2ggc2VlbXMgbWF0Y2ggaG1tIGRlc2lnbiBiZXR0ZXIgdGhhbiBibyBjb25j
ZXB0LiBPdXINCj4gPiAgICAgc3ZtIGltcGxlbWVudGF0aW9uIHdpbGwgYmUgYmFzZWQgb24gaG1t
LiBJbiBobW0gZGVzaWduLCBlYWNoIHZyYW0NCj4gPiAgICAgcGFnZSBpcyBiYWNrZWQgYnkgYSBz
dHJ1Y3QgcGFnZS4gSXQgaXMgdmVyeSBlYXN5IHRvIHBlcmZvcm0gcGFnZQ0KPiA+ICAgICBncmFu
dWxhcml0eSBtaWdyYXRpb25zIChiL3QgdnJhbSBhbmQgc3lzdGVtIG1lbW9yeSkuIElmIEJPIGNv
bmNlcHQNCj4gPiAgICAgaXMgaW52b2x2ZWQsIHdlIHdpbGwgaGF2ZSB0byBzcGxpdC9yZW1lcmdl
IEJPcyBkdXJpbmcgcGFnZQ0KPiA+ICAgICBncmFudWxhcml0eSBtaWdyYXRpb25zLg0KPiA+DQo+
ID4gIDIuIFdlIGhhdmUgYSBwcm92ZSBvZiBjb25jZXB0IG9mIHRoaXMgYXBwcm9hY2ggaW4gaTkx
NSwgb3JpZ2luYWxseQ0KPiA+ICAgICBpbXBsZW1lbnRlZCBieSBOaXJhbmphbmEuIEl0IHNlZW1z
IHdvcmsgYnV0IGl0IG9ubHkgaGFzIGJhc2ljDQo+ID4gICAgIGZ1bmN0aW9uYWxpdGllcyBmb3Ig
bm93LiBXZSBkb27igJl0IGhhdmUgYWR2YW5jZWQgZmVhdHVyZXMgc3VjaCBhcw0KPiA+ICAgICBt
ZW1vcnkgZXZpY3Rpb24gZXRjLg0KPiA+DQo+ID4gIDMuIFdpdGggdGhpcyBhcHByb2FjaCwgdnJh
bSB3aWxsIGRpdmlkZWQgaW50byB0d28gc2VwYXJhdGUgcG9vbHM6IG9uZQ0KPiA+ICAgICBmb3Ig
eGVfZ2VtX2NyZWF0ZWQgQk9zIGFuZCBvbmUgZm9yIHZyYW0gdXNlZCBieSBzdm0uIFRob3NlIHR3
bw0KPiA+ICAgICBwb29scyBhcmUgbm90IGNvbm5lY3RlZDogbWVtb3J5IHByZXNzdXJlIGZyb20g
b25lIHBvb2wgd29u4oCZdCBiZQ0KPiA+ICAgICBhYmxlIHRvIGV2aWN0IHZyYW0gZnJvbSBhbm90
aGVyIHBvb2wuIEF0IHRoaXMgcG9pbnQsIHdlIGRvbuKAmXQNCj4gPiAgICAgd2hldGhlciB0aGlz
IGFzcGVjdCBpcyBnb29kIG9yIG5vdC4NCj4gPg0KPiA+ICA0LiBBbWRrZmQgc3ZtIHdlbnQgZGlm
ZmVyZW50IGFwcHJvYWNoIHdoaWNoIGlzIEJPIGJhc2VkLiBUaGUgYmVuZWZpdA0KPiA+ICAgICBv
ZiB0aGlzIGFwcHJvYWNoIGlzIGEgbG90IG9mIGV4aXN0aW5nIGRyaXZlciBmYWNpbGl0aWVzIChz
dWNoIGFzDQo+ID4gICAgIG1lbW9yeSBldmljdGlvbi9jZ3JvdXAvYWNjb3VudGluZykgY2FuIGJl
IHJldXNlZA0KPiA+DQo+ID4gRG8geW91IGhhdmUgYW55IGNvbW1lbnQgdG8gdGhpcyBhcHByb2Fj
aD8gU2hvdWxkIEkgY29tZSBiYWNrIHdpdGggYQ0KPiA+IFJGQyBvZiBzb21lIFBPQyBjb2Rlcz8N
Cj4gPg0KPiA+IFRoYW5rcywNCj4gPg0KPiA+IE9haw0KPiA+DQo=
