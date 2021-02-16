Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9D131CA59
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 13:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7FD6E417;
	Tue, 16 Feb 2021 12:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5196E0ED;
 Tue, 16 Feb 2021 12:05:26 +0000 (UTC)
IronPort-SDR: qXRDWNLVWeRmFfXERln1iN9AuEW+ZfONqIDrSMnPy8Jw0D9GzKdOV6mM6cJL3URg1cS/6k/LON
 Lhq/rhq2rx1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="202055947"
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; d="scan'208";a="202055947"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 04:05:26 -0800
IronPort-SDR: MwzKjOTH03Oojy8j7+5rDHIMR618fIum2tCJpLfY9mpsu8Xj34tLvOVEqYCJ7pgYxBqiWg4xZr
 bikurw3zXlKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; d="scan'208";a="384363736"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 16 Feb 2021 04:05:26 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 16 Feb 2021 04:05:26 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 16 Feb 2021 04:05:25 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Tue, 16 Feb 2021 04:05:25 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Tue, 16 Feb 2021 04:05:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bANKErFtWmqDE/clx8ztopZ3GTT+2RhOrq+yzZ4FJFvvG3ARcRy6Jxn93owi7BeObOpIw+XY6RYNMxfeFoh1BAeSfj+flutf2A96j8W2MFG8sYYRHKikKhBIZZzDKk/Znq1cU6fyUwGTbciuuewnMcfcUTdmy1b+jMbgEROzbOQDfWYmCUGCghqbhvj3K+kOynm5JLi0nd4uOOUTC0Sdin/ahPanCR66lQlvLYB+ufuNr1lMAdO45p89H0BgsvhiP+4PHpEtGgX5qJ39VBJBXJQvAvUvP2EoH8Rrs09y85eY5y//bTpig8GHk75ynqgoJJn1zBWoCtT3iCJia9d8Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8C6xk9jgJNW4+D8XxEOcOofoTIBIjn3O4zvZlkjWgzE=;
 b=QGFHs58Q1ySBqlpen1wmYc45NGWIarDNWaGipndiK9zwTeGHCiWoKWJBEEcLJOO/2YPyusTcqCg2Tyr+pbjZ+47tDhYZac41faMnvgBbmr2Fw3EdZN2CVc2wtjdLSXiextx7BdnN1ecN2gbPZEEjjiV/yYlrhBWceqlNDpXtjojNdHSzctUbFUN5YZR1jgY+D/tPiApBYWjgWTm0uef0Q8Bmb9yqCgnuofLSmM0Ljhtkz8TP78Q0vUtRqqb/pXaEG0PP7C6YWFnSkJVk1BQZWQv0cTwYzWpQEHA3jfE5IL/yIAFnXkD8SRKu0TA2F5loBhoJY8QO/C2fJZyC0wMhVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8C6xk9jgJNW4+D8XxEOcOofoTIBIjn3O4zvZlkjWgzE=;
 b=xKBsHLIF7mTeUd1NX+Y4LEw3Je52k/s20OhTMtC8BRj14CFH28+duCHgoay3Sq5kh1V1bGVVtxIDHQaPcTOeWQuWt5mNxXBcsrEB335WeEYdovwbAObelQS8ZkUFCW1cbLNrCFDXCXgOzC6q/LIA8RPFYmhRqGH9j9YlAP6NWPE=
Received: from SA2PR11MB5068.namprd11.prod.outlook.com (2603:10b6:806:116::10)
 by SN6PR11MB2702.namprd11.prod.outlook.com (2603:10b6:805:60::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Tue, 16 Feb
 2021 12:05:23 +0000
Received: from SA2PR11MB5068.namprd11.prod.outlook.com
 ([fe80::d9fb:7552:f19b:402b]) by SA2PR11MB5068.namprd11.prod.outlook.com
 ([fe80::d9fb:7552:f19b:402b%3]) with mapi id 15.20.3846.042; Tue, 16 Feb 2021
 12:05:23 +0000
From: "Ram Moon, AnandX" <anandx.ram.moon@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "Auld, Matthew"
 <matthew.auld@intel.com>, "Surendrakumar Upadhyay, TejaskumarX"
 <tejaskumarx.surendrakumar.upadhyay@intel.com>, "Ursulin, Tvrtko"
 <tvrtko.ursulin@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH] drm/i915/gem: Add a check for object size for
 corner cases
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/gem: Add a check for object size
 for corner cases
Thread-Index: AQHW/4J/Nd6KBDswokSBXoZffqgcW6pRNJEAgAFwhmCABosygIABhu4Q
Date: Tue, 16 Feb 2021 12:05:23 +0000
Message-ID: <SA2PR11MB5068A706257864219AF6F727AE879@SA2PR11MB5068.namprd11.prod.outlook.com>
References: <20210210075929.5357-1-anandx.ram.moon@intel.com>
 <161295390650.6673.18431407043692596805@build.alporthouse.com>
 <SA2PR11MB50685BFD01D8C6318437AD59AE889@SA2PR11MB5068.namprd11.prod.outlook.com>
 <161339279139.27357.6733884217281880617@build.alporthouse.com>
In-Reply-To: <161339279139.27357.6733884217281880617@build.alporthouse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: chris-wilson.co.uk; dkim=none (message not signed)
 header.d=none;chris-wilson.co.uk; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [103.51.72.91]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ae26498-8bb4-4f42-f099-08d8d2732381
x-ms-traffictypediagnostic: SN6PR11MB2702:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB27022306D8978C2E3197FA80AE879@SN6PR11MB2702.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:534;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0MDqAFefZGeSMM2aCVn6kch7319PucWBU/9k0NkOkdy+tcIt5ZrdlEUh7hnvd+5BXtPR0Mvn6m7uYg7GaXoSNFdsY8fNbmU67/RdeNsj7NcMRNpD2wE/XdEkzS4yqk5lOw0y/tTXLupvFCeJ09wWKmFf2rlRmNjhlvWpHdTrJpWKL5WOZbKSdOmn2QWW2B1W9zPxQIQvbo4rYxcIQRspFyhwUTwhJNGE2oKPgaWTcJHvQLcVOhi9UU7+VNP+veQSK5NLjML5JpDG/eZ/28pnZsbaHMklZwnQ1q9jzW+YrSQHGG84bYv8aUCmDhtM6BGsUT240BKwTHTyikxCxm2jLvFTgxNmKwwCwGZg5H9N8J0TeMNeVy2F5tCiYObdgshpsOzPJsg7fUe5eFUF0+A1PpH1oCYWbYrAEi5dy+v///H1fIMrR78fUQbktOeMPUnP60v6jz/T/lH/UikbeUm8nclboEVi3I/9+i114+rIPq5vx3FNz2u00W8BUgFJOI7c0/8PDWpy7Lku8grsZabOU5LhWGgS2C9g/+JT7N7eD+UyWvXKID/z9bDy3+Ogyp/bJWDC4AfPfU9ITxGHfOxhKZENDXXPTgxzX70XjRBNO90=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5068.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(136003)(39860400002)(396003)(376002)(33656002)(8936002)(186003)(76116006)(64756008)(66446008)(66556008)(66946007)(7696005)(71200400001)(8676002)(921005)(2906002)(86362001)(66476007)(83380400001)(966005)(110136005)(478600001)(316002)(55016002)(6506007)(45080400002)(5660300002)(9686003)(53546011)(26005)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?wOw61dB1ZnLVr2B7N6Rfg7wd9JmpWOvC6pcfxJzkmea8aCEbc2DSs25FiVSv?=
 =?us-ascii?Q?t3EmAwQHPLTGpcNXkJEOvpVsU5me5OfO8lK0HQeeJxxqND/JaRAR5vjYtyd0?=
 =?us-ascii?Q?TjBVivTd/ESdH0bVOlSKUQUf6kCtiAS3xYGmIrN99UsgSHAOQ02bnsI7bUyg?=
 =?us-ascii?Q?UnCvTegNP3im0n4PQaiybK1+duPCs5xOJ9NtBkpAVf1Yc3ZHo7v7s0vjKbsL?=
 =?us-ascii?Q?SCK8OLD+5vx03Mdlocuj1r0OAKtCUv+zxFfbbSfkIEeUioh/CHjpVVASJtYj?=
 =?us-ascii?Q?Q8vxIfnALJfAv9EujPsoP8rECtZuGrPru2xdG0/cMqCVMoWh/WzAksi4A0FK?=
 =?us-ascii?Q?aaEfEIu7QDh48bAR3U7v/ErHZAFhOz8JV8Zf7z10auUyanLCWs9sTZMDEwCp?=
 =?us-ascii?Q?134xby8N4Rmc//Hp3Iy2CSRkPQL1NcBJF7GxWCZEYWQI06gVM9pAecuT1Rfr?=
 =?us-ascii?Q?aPAWUuctlL3MKIzyplOCvxIWDpqLcXjb99+U6CBqkd46Qs9GSLvDoo/meT2a?=
 =?us-ascii?Q?TTiWGSbpOy80s2k01NCHDCI0lhtWLxdFDGG5oc6/9zkF0Xri6YG6ikUF+Asa?=
 =?us-ascii?Q?dqwnMmPPyWIXfrqZenl8LfL9aPud0c5xLoY9OTJ/oMpkZ2MqDMFNE3kG03Z5?=
 =?us-ascii?Q?56lGp6TuXS5lhi2bmmzrmnPxK26JB/oGax8khehZr3jRU05Ny6YqL7TdNuGV?=
 =?us-ascii?Q?XiWYnmXt4ZGTLt/5YqRWCTF3GbkDG5BXX3a95lq6REihywSO2gA1lgx1qqzc?=
 =?us-ascii?Q?+SXCL78WmnxrEtBSUShCX/uPWWIJeUYGXYJYWM4pELiHl6/9SI9AuaAZ21Bl?=
 =?us-ascii?Q?H4BD3W1jYZf+psxIGcW2MXcPpcENPDI6QzqBepj4mx4i+R97BP3Oyj3hD8sU?=
 =?us-ascii?Q?r9Ifhgv3NupEXkrvdBjHVTZcUU7tIK5ER/Ve1VhvFmAx3HLyyd8bQYL9Ompg?=
 =?us-ascii?Q?9HlVVJRrhSW6PG2AEOD/9qDmFSj4VcHPczz9KS2fThT5jzxBi83raRVrTzU5?=
 =?us-ascii?Q?/Rb4UerOL3bgU6a6AdzplRxV8z3/YkuWoJIQ6TTJhAalsHMm7GN4xmsrDejb?=
 =?us-ascii?Q?J8aFjJl8wsLa747C7FtEoUloSSMNJA5xKTGX73ZE8xPD8xdCGi9MR+Fyylbz?=
 =?us-ascii?Q?g0FIB5TK0OFvRRHdbeVknqEQiZVRbxKtuyvppMduT4EbyPbKA8ByNEuA2SO6?=
 =?us-ascii?Q?Wapib0TBUMOXwB9wE6l4Z1oNKFODxNXoBqz9ZBrZprgrQJymUdZwONuwrJBz?=
 =?us-ascii?Q?StmMHhsAXoKt4MA7h0czHXibRJoR1vKQpoxUKgkY5P2Nbi//XYjSnW7sE/mQ?=
 =?us-ascii?Q?MUQ=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5068.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae26498-8bb4-4f42-f099-08d8d2732381
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2021 12:05:23.0729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TL4GeMR0OR7l37OZdGYkYYR7FkGIWDsRhyzF40WeoQw+JyHljAT/JixW68QB208dKQQJ2CrXLgdVfLbiUx7auvnbp4tOUqJhQivR0wjCspc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2702
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris,

-----Original Message-----
From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Chris Wilson
Sent: Monday, February 15, 2021 6:10 PM
To: Auld, Matthew <matthew.auld@intel.com>; Ram Moon, AnandX <anandx.ram.moon@intel.com>; Surendrakumar Upadhyay, TejaskumarX <tejaskumarx.surendrakumar.upadhyay@intel.com>; Ursulin, Tvrtko <tvrtko.ursulin@intel.com>; Jani Nikula <jani.nikula@linux.intel.com>; dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gem: Add a check for object size for corner cases

Quoting Ram Moon, AnandX (2021-02-15 12:29:17)
> Hi Chris,
> 
> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of 
> Chris Wilson
> Sent: Wednesday, February 10, 2021 4:15 PM
> To: Ram Moon, AnandX <anandx.ram.moon@intel.com>; Jani Nikula 
> <jani.nikula@linux.intel.com>; Auld, Matthew <matthew.auld@intel.com>; 
> Surendrakumar Upadhyay, TejaskumarX 
> <tejaskumarx.surendrakumar.upadhyay@intel.com>; Ursulin, Tvrtko 
> <tvrtko.ursulin@intel.com>; dri-devel@lists.freedesktop.org; 
> intel-gfx@lists.freedesktop.org
> Cc: Ram Moon, AnandX <anandx.ram.moon@intel.com>
> Subject: Re: [Intel-gfx] [PATCH] drm/i915/gem: Add a check for object 
> size for corner cases
> 
> Quoting Anand Moon (2021-02-10 07:59:29)
> > Add check for object size to return appropriate error -E2BIG or 
> > -EINVAL to avoid WARM_ON and successful return for some testcase.
> 
> No. You miss the point of having those warnings. We need to inspect the code to remove the last remaining "int pagenum", and then we can remove the GEM_WARN_ON((sz) >> PAGE_SHIFT > INT_MAX). These are not emitted for users, only for us to motivate us into finally fixing the code.
> -Chris
> 
> Yes, I got your point these check are meant to catch up integer overflow.
> 
> I have check with the IGT testcase case  _gem_create_ and 
> _gem_userptr_blits_ which fails pass size *-1ull << 32*  left shift 
> and *0~* which leads to integer overflow ie  _negative_ size passed to create  i915_gem_create via ioctl  this leads to GM_WARN_ON.
> 
> Can we drop these testcase so that we don't break the kernel ?

The kernel rejects the ioctl with the expected errno. We leave a warning purely for the benefit of CI, only when compiled for debugging and not by default, so that we have a persistent reminder to do the code review.
What's broken?
-Chris

All though the testcase return with appropriate error we observe kernel taint see below.

Thanks
-Anand

IGT-Version: 1.25-g2982c998a (x86_64) (Linux: 5.11.0-rc7-CI-CI_DRM_9755+ x86_64)
Starting subtest: create-massive
Subtest create-massive: SUCCESS (0.001s)
Err	
Starting subtest: create-massive
Subtest create-massive: SUCCESS (0.001s)
Dmesg

Scroll to first warning
<6> [245.057395] Console: switching to colour dummy device 80x25
<6> [245.057684] [IGT] gem_create: executing
<6> [245.062015] [IGT] gem_create: starting subtest create-massive
<4> [245.062063] ------------[ cut here ]------------
<4> [245.062065] WARN_ON((size) >> 12 > ((int)(~0U >> 1)))
<4> [245.062089] WARNING: CPU: 1 PID: 1414 at drivers/gpu/drm/i915/gem/i915_gem_object.h:36 i915_gem_object_create_region+0x132/0x1b0 [i915]
<4> [245.062196] Modules linked in: vgem snd_hda_codec_hdmi i915 mei_hdcp x86_pkg_temp_thermal coretemp crct10dif_pclmul crc32_pclmul snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep snd_hda_core ghash_clmulni_intel cdc_ether usbnet snd_pcm mii e1000e ptp mei_me pps_core mei intel_lpss_pci prime_numbers
<4> [245.062233] CPU: 1 PID: 1414 Comm: gem_create Tainted: G     U            5.11.0-rc7-CI-CI_DRM_9755+ #1
<4> [245.062236] Hardware name: Intel Corporation Tiger Lake Client Platform/TigerLake U DDR4 SODIMM RVP, BIOS TGLSFWI1.R00.3197.A00.2005110542 05/11/2020
<4> [245.062238] RIP: 0010:i915_gem_object_create_region+0x132/0x1b0 [i915]
<4> [245.062313] Code: 65 ff 0d 21 1c d5 5f 0f 85 79 ff ff ff e8 05 c7 d3 e0 e9 6f ff ff ff 48 c7 c6 70 6d 4e a0 48 c7 c7 0f fc 51 a0 e8 d7 4d 78 e1 <0f> 0b 49 c7 c4 f9 ff ff ff e9 65 ff ff ff 65 ff 05 e9 1b d5 5f 48
<4> [245.062315] RSP: 0018:ffffc9000230fd68 EFLAGS: 00010286
<4> [245.062319] RAX: 0000000000000000 RBX: ffffffff00000000 RCX: 0000000000000001
<4> [245.062320] RDX: 0000000080000001 RSI: ffffffff8235aaf7 RDI: 00000000ffffffff
<4> [245.062322] RBP: ffff88812922a800 R08: 0000000000000001 R09: 0000000000000001
<4> [245.062324] R10: 0000000000000001 R11: 0000000000000000 R12: ffff88811a8bb400
<4> [245.062325] R13: 0000000000000000 R14: ffffc9000230fe58 R15: ffffc9000230fe58
<4> [245.062327] FS:  00007f7fbd88c300(0000) GS:ffff8884a0280000(0000) knlGS:0000000000000000
<4> [245.062329] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4> [245.062331] CR2: 00007f7fbd262be0 CR3: 00000001240b2001 CR4: 0000000000770ee0
<4> [245.062332] PKRU: 55555554
<4> [245.062334] Call Trace:
<4> [245.062338]  i915_gem_create+0xc4/0x160 [i915]
<4> [245.062411]  ? i915_gem_dumb_create+0xc0/0xc0 [i915]
<4> [245.062591]  drm_ioctl_kernel+0xaa/0xf0
<4> [245.062600]  drm_ioctl+0x1e8/0x390
<4> [245.062604]  ? i915_gem_dumb_create+0xc0/0xc0 [i915]
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
