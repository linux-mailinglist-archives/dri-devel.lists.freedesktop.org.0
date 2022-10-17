Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC65601424
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 19:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E8C10E0E2;
	Mon, 17 Oct 2022 17:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD04310EB79;
 Mon, 17 Oct 2022 17:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666026014; x=1697562014;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=p/R76o9cUbN7xAx1/vQIpFGNY/ES8wJGgLhNEa8JXNA=;
 b=KcjId3weukEey04pFnTUrOywoMAKxHUOkCuPHsEU5MOfAJ/aAnjuOM0g
 Qiy/By/HqcvQpZKoVMj1Vpm6D1WAV5Z/L+LhtMTyrFR2nesVY1bqNXLxo
 1v1CKc6raczFyXQE0V9j1ZQohv1QQCoitE41wBvC+Nj8BtAPmfsaeUe9Q
 9Ftj+N5w719TdzDVs44s30NRuzQV/elyWFAW+fXtMDYvWiEQA00o2ztdA
 pX7WwO4xx21sxyv9QDxYovbcuGaqzeGklOQY/N/Y9b9SyBdGo/8o/LtCf
 PT1QccCZumnsyVYuvgQIFv9EryVEOZRbExqe4Bw0x2g5dBO6m4Muv0yTo g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="286250475"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="286250475"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 10:00:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="697127002"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="697127002"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 17 Oct 2022 10:00:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 10:00:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 10:00:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 17 Oct 2022 10:00:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 17 Oct 2022 10:00:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ih9xWR7fRyC4Vwb5ZBZXegTlTcJQnH06N4cK5DHbTM2nZMFvNA56XDk29Wvx0HZ8XQQfSKfcHxSNLqVUBHKO63KmxgZt+iAqpCCLVw+cp8nLOgV+gwRacnVDnoULGSue/uu3oSs33NMjOsw5c2hPbNGx3kwyAXzloCRcBRNsaQ5fpq00SmvljOvDsim/7jxucj9YPOTCB2XtID3NwTI0X6+kvK1jCdUPlectBSIaH2bEzOeY5gIIgfN6JDs11D9E2e2rkMTQgx/atQCqo6yTeiBA+hI5D3NCFYMpr5lNlTqeF6cdJfokqH4drjxqecCTicNKfseu8Y+co1khKtqTcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52o3ZtXYyp5ttbotso+n9PXZASEg6cFQN2yMpAEneDE=;
 b=YJLqIA0JjqAN9NxLHwjBdJcm0pvVyUUw4xizIMlBl4nijGm5xqOXA+vu6W0VL7h2SqjvnsvBvkk1j+K0LiPmHOrZ5GubZxse09JfXahHHpEZ0fFHsdXHuQZ8PaXgAQFGp5Uh+mkq4boIIk4XBZVApJIMd07cd7euzqTrg+InievJqH+DwBaIrHsw2t8T/WLnXSbTx4JJVEUEVXF2W4LTkgfe1oX7T93YdzzFAZvG2tkl6jFZocRrovjNjYld2FP/FQLuMqugXM6SVu06oscMjlg6bd7OonxJRb5+j7K580j4tUUi2JakQVTf8PYsHbG7l45JVQfgvPBLOAgAF67uog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 SA1PR11MB5804.namprd11.prod.outlook.com (2603:10b6:806:237::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Mon, 17 Oct
 2022 17:00:09 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67%3]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 17:00:09 +0000
Date: Mon, 17 Oct 2022 22:29:59 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v3 12/14] drm/i915: Define multicast
 registers as a new type
Message-ID: <Y02KD37IyUr4whX5@bala-ubuntu>
References: <20221014230239.1023689-1-matthew.d.roper@intel.com>
 <20221014230239.1023689-13-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20221014230239.1023689-13-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN3PR01CA0169.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::13) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|SA1PR11MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: 26dcc0bf-92c4-4418-bfe2-08dab0610c45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6dyXD4axpQ9FeE7/afWb16NNSvigZ+rPsi72JQ37AEEJV4VA21tz1XOrgWBo7okF5+T0mi1UhtdHg4xZQnwEl/M5lvCVfP/9JdBhzhXFbujwRQtpNUNd2tqc32qQbCVKTHRlSLaRHQyjDhN0rIJS96PUhIjMtFOikAAeSzGs99AE12E4QQqnB9SuIhk2l3UUCMsHQbFr/cS4zF/7KEt9Wkt1Pkbl8ZVfxCQTmFXbamQuetK80xPpHvyZu2kJm8fSXt8pLpAxbmhA6mpyeh4xNbkG0Ye6VGvdQipwSVxp5IjuPZkWxbcabyrr7no8EPtTGzqMk52erZ2VMZj/G9hzkk2aDXfsN92OXVaUEOP/JUmOiw+EButMEoNixqtHRNPNphsclUD1iUGINswQv6NTvf05vPoOXwBB32XIghzJCZX90LDHRkS22Lb+3k/nxRrs+sFkrtBqF+vuR2gXJ3jJbUiH0XfVrCmVgSsruJ1s+xZR30TyQU1NFrX8SUsk0qPkhaQV9CzXcMYa/OkpUKN5Yyo5tZ9pZaks+O9UIDNJ1+E6q6o4SKasp2KjnyWZmNS50O64AmCvEggjg4IV1HHguhE2UYHuHtYpozw1OVs2WwoR0HecF/cpex6KWe4fSxsL2ROHAuob83tO99Gkcu9O6TfJclcyYl+ppzNl82diUS9e0ZzM0kS+g2GILc2vaffOEpQb6SYkEfBNYfU2FAJU8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(376002)(396003)(346002)(136003)(366004)(39860400002)(451199015)(44832011)(41300700001)(30864003)(5660300002)(450100002)(26005)(478600001)(4326008)(6506007)(6666004)(66946007)(33716001)(38100700002)(82960400001)(86362001)(8936002)(316002)(2906002)(9686003)(53546011)(8676002)(83380400001)(6486002)(66556008)(6512007)(66476007)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0ZNbk5zNW80WEtTdENrWlpxUkxsall3MGpvRUNVL3g0OHNPcVE2cW1PV3NC?=
 =?utf-8?B?NW9pV3VLdDUvQXlSQ0RQUWYyOTFRb285eFJJVng0VXZSdnFjUEpqYmY0MzFS?=
 =?utf-8?B?RTBYaVhyWGtVRDdaRmFZSzNWdGEwY1Eva2x1ZWJIWXVhOFdpT0xSdHYvQ2hr?=
 =?utf-8?B?OVNSY3hsY1ZsL3RBMm1LM3VnRFlmeGx2UnV4Sk85cnE4YUVuUEJsSzZLNTJ4?=
 =?utf-8?B?NGQ2bWw2eFNQaUFpd2xxVGNtMi9LWDArdTUvS1IvL1plMzk1TVdoS2d3WEVx?=
 =?utf-8?B?NVlBa29hdm9VbGRDY2xGTkxVakdxZjc0SEw3VWZmSlRYVUJ3a2pDdU5vK0o0?=
 =?utf-8?B?NElZd0lLOXNSV3JGVWdna25YbmNmdGtuVU0vM1BXMmM3K2RaQUZXbHM2b2xy?=
 =?utf-8?B?cCtGU0hiajBpbVhEZW1HcnVhb0FxZ0J5TUlKaTJVRUV0d3QwL1RodHRvalA5?=
 =?utf-8?B?dzh1Nm9RbHEycGl1Q0M4VzdOUitucnlkMFUrL2lpS0hlUVVTeTRLNjM3TFdQ?=
 =?utf-8?B?N1QvZlg3TURoOUYyM2pHNEdGNjErdlFjMUQ2NTRjZVFmVXZXNnJQVm9qNHVh?=
 =?utf-8?B?a2JaKzhiVGtvU21OL2ZhaS9heUtzVjhjRVFoLzBiQXJRVnJuMDBFbDN5V1BY?=
 =?utf-8?B?dFc4SFZHYXJLVU94Lyt4Q25rZFRmYzRMcUZFUWt0NGlLMk5tTzF3SS81TjVL?=
 =?utf-8?B?ZjhDZURuYUdwR2xxaWRqVnI2RHk4Y1MrSnJYdHJ0ZXp6clpuVjBOZDRoQlBn?=
 =?utf-8?B?ekxESUtYdmhjamdnUGk3cXp3c3RNTFUzSTFscXdETWJaUENpckUwc2xsL1lG?=
 =?utf-8?B?RDZFa3BoRjdJZ1VEYUFWSGJMV0ttMkdHT3FUODI0bzFqNVVPZFQrckVKU3Uz?=
 =?utf-8?B?STZVeE9iY3Vob0F5OXdJcXRjWU5rZVVvVUxBUGRsRHhNeFhQOU9McFcyQVg2?=
 =?utf-8?B?VzdFbWtKcVdrc01aakVOdDBJdXc4S0pjYjJUbk9rMWU0ZEM0ZTV2Tit3R1lw?=
 =?utf-8?B?Z0tmYm1kS2J6UXZoKzk4QWltaGVtQzhGT0tyMUhxb0loOFZCbVpaNU0rM1ph?=
 =?utf-8?B?N2Q5UXdhS2s1bHp2dnRRSmVINTRLQWhYQ3J5ZHZvMlVUMkZia29qblEwSTZl?=
 =?utf-8?B?NDVXb29ZbVJhQWV1MjB1Y0QvZlFVSk03aGFtYkJmTGlaQ3NnOVJjSWYwZTZU?=
 =?utf-8?B?cHNDRmJKR291aXY2UDJLYmptTHJnZWpZTENWajI2c3A2eVc2NzdGREJ2Uy9z?=
 =?utf-8?B?cC91aEVaTUZVWTN5ekVwdm15UG5XaFF1R05xYjduUnMzVi9vSXBuM1Nxd3dk?=
 =?utf-8?B?eGU5QXl6TjQ1enhQWHcyUUh3UFhRR3FOZHdYM2hOWEN6TDVISWkrNlo4cUh2?=
 =?utf-8?B?ZDhEbGlscSsydDBVeGV5bUVCU3pWSWxxeGQ5WFdCSlIraVpFMURHSFRQQUNQ?=
 =?utf-8?B?YjFKUUd6NmFLb2pzNDVIM3EyV2RROGtTRTIxZFR3K2FWR3BPaS9ITzR1eUdJ?=
 =?utf-8?B?Sk5UTjd2d3gvQm9kam5USUZ1Rk1PNTJLZ2YzWXE2TENCOHMvNHdDQlJQeGFC?=
 =?utf-8?B?MmxQTDRuRHU2djloWkFvNWh1aEN2ZmxlZnBFbUswbW9WTUhTV3M1eVdxN1hK?=
 =?utf-8?B?QVROMXNpTURmNHZmQ0ozcWJrRXpZTE9FK0szbVM1alR5Y1FjZW1raGJ5TjNj?=
 =?utf-8?B?MllMWW5QWWtZcFhCUEdhdkRLQ21rNG9DSlN3Y20yOWtESWphTHFBUUJVMnZy?=
 =?utf-8?B?TzV5RldPOVI5ZTBxTGlKd2ZKVUlsbWRTL1ZRcjlYbXlPMng4QllKS2lNTTFI?=
 =?utf-8?B?SEJWNGpLaEluS2dCRmY1S0Vpak4xZXVPTDIzZ29SK1h3L1JQdnFFVHpPR2Zq?=
 =?utf-8?B?K0lQUGh3Wk0xVTNCcm52d21SeTFqck90UjF4eTRCMHdPem02OEg2aURlRXM4?=
 =?utf-8?B?N3R1SkEva1ZxSzdRWUtVSHpYdzBOLzlMbFF2elJyZnZuSFNrWEVXdlRIbEJK?=
 =?utf-8?B?YnlyQ1BCc0daWHJrWUs4T1U1VXpNK0xZRFFmbHZUNTJxUUlPOWgxUDNsNHo0?=
 =?utf-8?B?Z0hoV25remwzS3V3M3AzbDVMVnFhQW0yYzViLzNqVVBFQks0NFQwZDhYTjBN?=
 =?utf-8?B?S3VjNm5nZEhwalc1cFdFZHdDZTZkajRWdmd1Z2l2WE54a1JmS25CN0RxRndO?=
 =?utf-8?Q?+Ha0WFqOleIhr3q6R627GqCkFeMRZFgSVALW5RcoEHaE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26dcc0bf-92c4-4418-bfe2-08dab0610c45
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 17:00:09.4153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0c1TAnRQJ+SKQz036UawiNiASnYaIg2uvJAcLerAMwg+jRBvGbAVTkLzebElLIhQoK4Xc6z25JDe39jj3V44R7N1wuEjarr0B9A7EX6xvPjlliwFMjuFf8EBmNsmBJE7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5804
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14.10.2022 16:02, Matt Roper wrote:
> Rather than treating multicast registers as 'i915_reg_t' let's define
> them as a completely new type.  This will allow the compiler to help us
> make sure we're using multicast-aware functions to operate on multicast
> registers.
> 
> This plan does break down a bit in places where we're just maintaining
> heterogeneous lists of registers (e.g., various MMIO whitelists used by
> perf, GVT, etc.) rather than performing reads/writes.  We only really
> care about the offset in those cases, so for now we can "cast" the
> registers as non-MCR, leaving us with a list of i915_reg_t's, but we may
> want to look for better ways to store mixed collections of i915_reg_t
> and i915_mcr_reg_t in the future.
> 
> v2:
>  - Add TLB invalidation registers
> v3:
>  - Make type checking of i915_mmio_reg_offset() stricter.  It will
>    accept either i915_reg_t or i915_mcr_reg_t, but will now raise a
>    compile error if any other type is passed, even if that type contains
>    a 'reg' field.  (Jani)
>  - Drop a ton of GVT changes; allowing i915_mmio_reg_offset() to take
>    either an i915_reg_t or an i915_mcr_reg_t means that the huge lists
>    of MMIO_D*() macros used in GVT will continue to work without
>    modification.  We need only make changes to structures that have an
>    explicit i915_reg_t in them now.
> 
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c            | 16 ++++--
>  drivers/gpu/drm/i915/gt/intel_gt_mcr.c        | 51 ++++++++++++-------
>  drivers/gpu/drm/i915/gt/intel_gt_mcr.h        | 18 +++----
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h       | 27 +++++++---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c   | 32 ++++++------
>  .../gpu/drm/i915/gt/intel_workarounds_types.h |  5 +-
>  .../gpu/drm/i915/gt/selftest_workarounds.c    |  2 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  2 +-
>  .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |  4 +-
>  drivers/gpu/drm/i915/gvt/handlers.c           |  2 +-
>  drivers/gpu/drm/i915/gvt/mmio_context.c       | 14 ++---
>  drivers/gpu/drm/i915/i915_reg_defs.h          | 27 +++++-----
>  12 files changed, 117 insertions(+), 83 deletions(-)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 3df0d0336dbc..27dbb9e4bd6c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -991,7 +991,10 @@ void intel_gt_info_print(const struct intel_gt_info *info,
>  }
>  
>  struct reg_and_bit {
> -	i915_reg_t reg;
> +	union {
> +		i915_reg_t reg;
> +		i915_mcr_reg_t mcr_reg;
> +	};
>  	u32 bit;
>  };
>  
> @@ -1033,7 +1036,7 @@ get_reg_and_bit(const struct intel_engine_cs *engine, const bool gen8,
>  static int wait_for_invalidate(struct intel_gt *gt, struct reg_and_bit rb)
>  {
>  	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 50))
> -		return intel_gt_mcr_wait_for_reg_fw(gt, rb.reg, rb.bit, 0,
> +		return intel_gt_mcr_wait_for_reg_fw(gt, rb.mcr_reg, rb.bit, 0,
>  						    TLB_INVAL_TIMEOUT_US,
>  						    TLB_INVAL_TIMEOUT_MS);
>  	else
> @@ -1058,7 +1061,7 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>  		[COPY_ENGINE_CLASS]		= GEN12_BLT_TLB_INV_CR,
>  		[COMPUTE_CLASS]			= GEN12_COMPCTX_TLB_INV_CR,
>  	};
> -	static const i915_reg_t xehp_regs[] = {
> +	static const i915_mcr_reg_t xehp_regs[] = {
>  		[RENDER_CLASS]			= XEHP_GFX_TLB_INV_CR,
>  		[VIDEO_DECODE_CLASS]		= XEHP_VD_TLB_INV_CR,
>  		[VIDEO_ENHANCEMENT_CLASS]	= XEHP_VE_TLB_INV_CR,
> @@ -1131,7 +1134,12 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>  	for_each_engine_masked(engine, gt, awake, tmp) {
>  		struct reg_and_bit rb;
>  
> -		rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
> +		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> +			rb.mcr_reg = xehp_regs[engine->class];
> +			rb.bit = BIT(engine->instance);
> +		} else {
> +			rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
> +		}
>  
>  		if (wait_for_invalidate(gt, rb))
>  			drm_err_ratelimited(&gt->i915->drm,
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> index 1ed9bc4dccfd..349074bf365f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> @@ -150,6 +150,19 @@ void intel_gt_mcr_init(struct intel_gt *gt)
>  	}
>  }
>  
> +/*
> + * Although the rest of the driver should use MCR-specific functions to
> + * read/write MCR registers, we still use the regular intel_uncore_* functions
> + * internally to implement those, so we need a way for the functions in this
> + * file to "cast" an i915_mcr_reg_t into an i915_reg_t.
> + */
> +static i915_reg_t mcr_reg_cast(const i915_mcr_reg_t mcr)
> +{
> +	i915_reg_t r = { .reg = mcr.reg };
> +
> +	return r;
> +}
> +
>  /*
>   * rw_with_mcr_steering_fw - Access a register with specific MCR steering
>   * @uncore: pointer to struct intel_uncore
> @@ -164,7 +177,7 @@ void intel_gt_mcr_init(struct intel_gt *gt)
>   * Caller needs to make sure the relevant forcewake wells are up.
>   */
>  static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
> -				   i915_reg_t reg, u8 rw_flag,
> +				   i915_mcr_reg_t reg, u8 rw_flag,
>  				   int group, int instance, u32 value)
>  {
>  	u32 mcr_mask, mcr_ss, mcr, old_mcr, val = 0;
> @@ -201,9 +214,9 @@ static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
>  	intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, mcr);
>  
>  	if (rw_flag == FW_REG_READ)
> -		val = intel_uncore_read_fw(uncore, reg);
> +		val = intel_uncore_read_fw(uncore, mcr_reg_cast(reg));
>  	else
> -		intel_uncore_write_fw(uncore, reg, value);
> +		intel_uncore_write_fw(uncore, mcr_reg_cast(reg), value);
>  
>  	mcr &= ~mcr_mask;
>  	mcr |= old_mcr & mcr_mask;
> @@ -214,14 +227,14 @@ static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
>  }
>  
>  static u32 rw_with_mcr_steering(struct intel_uncore *uncore,
> -				i915_reg_t reg, u8 rw_flag,
> +				i915_mcr_reg_t reg, u8 rw_flag,
>  				int group, int instance,
>  				u32 value)
>  {
>  	enum forcewake_domains fw_domains;
>  	u32 val;
>  
> -	fw_domains = intel_uncore_forcewake_for_reg(uncore, reg,
> +	fw_domains = intel_uncore_forcewake_for_reg(uncore, mcr_reg_cast(reg),
>  						    rw_flag);
>  	fw_domains |= intel_uncore_forcewake_for_reg(uncore,
>  						     GEN8_MCR_SELECTOR,
> @@ -249,7 +262,7 @@ static u32 rw_with_mcr_steering(struct intel_uncore *uncore,
>   * group/instance.
>   */
>  u32 intel_gt_mcr_read(struct intel_gt *gt,
> -		      i915_reg_t reg,
> +		      i915_mcr_reg_t reg,
>  		      int group, int instance)
>  {
>  	return rw_with_mcr_steering(gt->uncore, reg, FW_REG_READ, group, instance, 0);
> @@ -266,7 +279,7 @@ u32 intel_gt_mcr_read(struct intel_gt *gt,
>   * Write an MCR register in unicast mode after steering toward a specific
>   * group/instance.
>   */
> -void intel_gt_mcr_unicast_write(struct intel_gt *gt, i915_reg_t reg, u32 value,
> +void intel_gt_mcr_unicast_write(struct intel_gt *gt, i915_mcr_reg_t reg, u32 value,
>  				int group, int instance)
>  {
>  	rw_with_mcr_steering(gt->uncore, reg, FW_REG_WRITE, group, instance, value);
> @@ -281,9 +294,9 @@ void intel_gt_mcr_unicast_write(struct intel_gt *gt, i915_reg_t reg, u32 value,
>   * Write an MCR register in multicast mode to update all instances.
>   */
>  void intel_gt_mcr_multicast_write(struct intel_gt *gt,
> -				i915_reg_t reg, u32 value)
> +				  i915_mcr_reg_t reg, u32 value)
>  {
> -	intel_uncore_write(gt->uncore, reg, value);
> +	intel_uncore_write(gt->uncore, mcr_reg_cast(reg), value);
>  }
>  
>  /**
> @@ -297,9 +310,9 @@ void intel_gt_mcr_multicast_write(struct intel_gt *gt,
>   * domains; use intel_gt_mcr_multicast_write() in cases where forcewake should
>   * be obtained automatically.
>   */
> -void intel_gt_mcr_multicast_write_fw(struct intel_gt *gt, i915_reg_t reg, u32 value)
> +void intel_gt_mcr_multicast_write_fw(struct intel_gt *gt, i915_mcr_reg_t reg, u32 value)
>  {
> -	intel_uncore_write_fw(gt->uncore, reg, value);
> +	intel_uncore_write_fw(gt->uncore, mcr_reg_cast(reg), value);
>  }
>  
>  /**
> @@ -320,7 +333,7 @@ void intel_gt_mcr_multicast_write_fw(struct intel_gt *gt, i915_reg_t reg, u32 va
>   *
>   * Returns the old (unmodified) value read.
>   */
> -u32 intel_gt_mcr_multicast_rmw(struct intel_gt *gt, i915_reg_t reg,
> +u32 intel_gt_mcr_multicast_rmw(struct intel_gt *gt, i915_mcr_reg_t reg,
>  			       u32 clear, u32 set)
>  {
>  	u32 val = intel_gt_mcr_read_any(gt, reg);
> @@ -345,7 +358,7 @@ u32 intel_gt_mcr_multicast_rmw(struct intel_gt *gt, i915_reg_t reg,
>   * for @type steering too.
>   */
>  static bool reg_needs_read_steering(struct intel_gt *gt,
> -				    i915_reg_t reg,
> +				    i915_mcr_reg_t reg,
>  				    enum intel_steering_type type)
>  {
>  	const u32 offset = i915_mmio_reg_offset(reg);
> @@ -428,7 +441,7 @@ static void get_nonterminated_steering(struct intel_gt *gt,
>   * steering.
>   */
>  void intel_gt_mcr_get_nonterminated_steering(struct intel_gt *gt,
> -					     i915_reg_t reg,
> +					     i915_mcr_reg_t reg,
>  					     u8 *group, u8 *instance)
>  {
>  	int type;
> @@ -457,7 +470,7 @@ void intel_gt_mcr_get_nonterminated_steering(struct intel_gt *gt,
>   *
>   * Returns the value from a non-terminated instance of @reg.
>   */
> -u32 intel_gt_mcr_read_any_fw(struct intel_gt *gt, i915_reg_t reg)
> +u32 intel_gt_mcr_read_any_fw(struct intel_gt *gt, i915_mcr_reg_t reg)
>  {
>  	int type;
>  	u8 group, instance;
> @@ -471,7 +484,7 @@ u32 intel_gt_mcr_read_any_fw(struct intel_gt *gt, i915_reg_t reg)
>  		}
>  	}
>  
> -	return intel_uncore_read_fw(gt->uncore, reg);
> +	return intel_uncore_read_fw(gt->uncore, mcr_reg_cast(reg));
>  }
>  
>  /**
> @@ -484,7 +497,7 @@ u32 intel_gt_mcr_read_any_fw(struct intel_gt *gt, i915_reg_t reg)
>   *
>   * Returns the value from a non-terminated instance of @reg.
>   */
> -u32 intel_gt_mcr_read_any(struct intel_gt *gt, i915_reg_t reg)
> +u32 intel_gt_mcr_read_any(struct intel_gt *gt, i915_mcr_reg_t reg)
>  {
>  	int type;
>  	u8 group, instance;
> @@ -498,7 +511,7 @@ u32 intel_gt_mcr_read_any(struct intel_gt *gt, i915_reg_t reg)
>  		}
>  	}
>  
> -	return intel_uncore_read(gt->uncore, reg);
> +	return intel_uncore_read(gt->uncore, mcr_reg_cast(reg));
>  }
>  
>  static void report_steering_type(struct drm_printer *p,
> @@ -599,7 +612,7 @@ void intel_gt_mcr_get_ss_steering(struct intel_gt *gt, unsigned int dss,
>   * Return: 0 if the register matches the desired condition, or -ETIMEDOUT.
>   */
>  int intel_gt_mcr_wait_for_reg_fw(struct intel_gt *gt,
> -				 i915_reg_t reg,
> +				 i915_mcr_reg_t reg,
>  				 u32 mask,
>  				 u32 value,
>  				 unsigned int fast_timeout_us,
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
> index 548f922cd9fa..3fb0502bff22 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
> @@ -11,24 +11,24 @@
>  void intel_gt_mcr_init(struct intel_gt *gt);
>  
>  u32 intel_gt_mcr_read(struct intel_gt *gt,
> -		      i915_reg_t reg,
> +		      i915_mcr_reg_t reg,
>  		      int group, int instance);
> -u32 intel_gt_mcr_read_any_fw(struct intel_gt *gt, i915_reg_t reg);
> -u32 intel_gt_mcr_read_any(struct intel_gt *gt, i915_reg_t reg);
> +u32 intel_gt_mcr_read_any_fw(struct intel_gt *gt, i915_mcr_reg_t reg);
> +u32 intel_gt_mcr_read_any(struct intel_gt *gt, i915_mcr_reg_t reg);
>  
>  void intel_gt_mcr_unicast_write(struct intel_gt *gt,
> -				i915_reg_t reg, u32 value,
> +				i915_mcr_reg_t reg, u32 value,
>  				int group, int instance);
>  void intel_gt_mcr_multicast_write(struct intel_gt *gt,
> -				  i915_reg_t reg, u32 value);
> +				  i915_mcr_reg_t reg, u32 value);
>  void intel_gt_mcr_multicast_write_fw(struct intel_gt *gt,
> -				     i915_reg_t reg, u32 value);
> +				     i915_mcr_reg_t reg, u32 value);
>  
> -u32 intel_gt_mcr_multicast_rmw(struct intel_gt *gt, i915_reg_t reg,
> +u32 intel_gt_mcr_multicast_rmw(struct intel_gt *gt, i915_mcr_reg_t reg,
>  			       u32 clear, u32 set);
>  
>  void intel_gt_mcr_get_nonterminated_steering(struct intel_gt *gt,
> -					     i915_reg_t reg,
> +					     i915_mcr_reg_t reg,
>  					     u8 *group, u8 *instance);
>  
>  void intel_gt_mcr_report_steering(struct drm_printer *p, struct intel_gt *gt,
> @@ -38,7 +38,7 @@ void intel_gt_mcr_get_ss_steering(struct intel_gt *gt, unsigned int dss,
>  				  unsigned int *group, unsigned int *instance);
>  
>  int intel_gt_mcr_wait_for_reg_fw(struct intel_gt *gt,
> -				 i915_reg_t reg,
> +				 i915_mcr_reg_t reg,
>  				 u32 mask,
>  				 u32 value,
>  				 unsigned int fast_timeout_us,
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index ad9985015b0e..754c27dd1e82 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -8,7 +8,18 @@
>  
>  #include "i915_reg_defs.h"
>  
> -#define MCR_REG(offset)	_MMIO(offset)
> +#define MCR_REG(offset)	((const i915_mcr_reg_t){ .reg = (offset) })
> +
> +/*
> + * The perf control registers are technically multicast registers, but the
> + * driver never needs to read/write them directly; we only use them to build
> + * lists of registers (where they're mixed in with other non-MCR registers)
> + * and then operate on the offset directly.  For now we'll just define them
> + * as non-multicast so we can place them on the same list, but we may want
> + * to try to come up with a better way to handle heterogeneous lists of
> + * registers in the future.
> + */
> +#define PERF_REG(offset)			_MMIO(offset)
>  
>  /* RPM unit config (Gen8+) */
>  #define RPM_CONFIG0				_MMIO(0xd00)
> @@ -1116,8 +1127,8 @@
>  #define   FLOAT_BLEND_OPTIMIZATION_ENABLE	REG_BIT(4)
>  #define   ENABLE_PREFETCH_INTO_IC		REG_BIT(3)
>  
> -#define EU_PERF_CNTL0				MCR_REG(0xe458)
> -#define EU_PERF_CNTL4				MCR_REG(0xe45c)
> +#define EU_PERF_CNTL0				PERF_REG(0xe458)
> +#define EU_PERF_CNTL4				PERF_REG(0xe45c)
>  
>  #define GEN9_ROW_CHICKEN4			MCR_REG(0xe48c)
>  #define   GEN12_DISABLE_GRF_CLEAR		REG_BIT(13)
> @@ -1154,16 +1165,16 @@
>  #define   STACKID_CTRL				REG_GENMASK(6, 5)
>  #define   STACKID_CTRL_512			REG_FIELD_PREP(STACKID_CTRL, 0x2)
>  
> -#define EU_PERF_CNTL1				MCR_REG(0xe558)
> -#define EU_PERF_CNTL5				MCR_REG(0xe55c)
> +#define EU_PERF_CNTL1				PERF_REG(0xe558)
> +#define EU_PERF_CNTL5				PERF_REG(0xe55c)
>  
>  #define XEHP_HDC_CHICKEN0			MCR_REG(0xe5f0)
>  #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
>  #define ICL_HDC_MODE				MCR_REG(0xe5f4)
>  
> -#define EU_PERF_CNTL2				MCR_REG(0xe658)
> -#define EU_PERF_CNTL6				MCR_REG(0xe65c)
> -#define EU_PERF_CNTL3				MCR_REG(0xe758)
> +#define EU_PERF_CNTL2				PERF_REG(0xe658)
> +#define EU_PERF_CNTL6				PERF_REG(0xe65c)
> +#define EU_PERF_CNTL3				PERF_REG(0xe758)
>  
>  #define LSC_CHICKEN_BIT_0			MCR_REG(0xe7c8)
>  #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 7671994d5b7a..dadb60e6a58f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -166,11 +166,11 @@ static void wa_add(struct i915_wa_list *wal, i915_reg_t reg,
>  	_wa_add(wal, &wa);
>  }
>  
> -static void wa_mcr_add(struct i915_wa_list *wal, i915_reg_t reg,
> +static void wa_mcr_add(struct i915_wa_list *wal, i915_mcr_reg_t reg,
>  		       u32 clear, u32 set, u32 read_mask, bool masked_reg)
>  {
>  	struct i915_wa wa = {
> -		.reg  = reg,
> +		.mcr_reg = reg,
>  		.clr  = clear,
>  		.set  = set,
>  		.read = read_mask,
> @@ -188,7 +188,7 @@ wa_write_clr_set(struct i915_wa_list *wal, i915_reg_t reg, u32 clear, u32 set)
>  }
>  
>  static void
> -wa_mcr_write_clr_set(struct i915_wa_list *wal, i915_reg_t reg, u32 clear, u32 set)
> +wa_mcr_write_clr_set(struct i915_wa_list *wal, i915_mcr_reg_t reg, u32 clear, u32 set)
>  {
>  	wa_mcr_add(wal, reg, clear, set, clear, false);
>  }
> @@ -206,7 +206,7 @@ wa_write_or(struct i915_wa_list *wal, i915_reg_t reg, u32 set)
>  }
>  
>  static void
> -wa_mcr_write_or(struct i915_wa_list *wal, i915_reg_t reg, u32 set)
> +wa_mcr_write_or(struct i915_wa_list *wal, i915_mcr_reg_t reg, u32 set)
>  {
>  	wa_mcr_write_clr_set(wal, reg, set, set);
>  }
> @@ -218,7 +218,7 @@ wa_write_clr(struct i915_wa_list *wal, i915_reg_t reg, u32 clr)
>  }
>  
>  static void
> -wa_mcr_write_clr(struct i915_wa_list *wal, i915_reg_t reg, u32 clr)
> +wa_mcr_write_clr(struct i915_wa_list *wal, i915_mcr_reg_t reg, u32 clr)
>  {
>  	wa_mcr_write_clr_set(wal, reg, clr, 0);
>  }
> @@ -241,7 +241,7 @@ wa_masked_en(struct i915_wa_list *wal, i915_reg_t reg, u32 val)
>  }
>  
>  static void
> -wa_mcr_masked_en(struct i915_wa_list *wal, i915_reg_t reg, u32 val)
> +wa_mcr_masked_en(struct i915_wa_list *wal, i915_mcr_reg_t reg, u32 val)
>  {
>  	wa_mcr_add(wal, reg, 0, _MASKED_BIT_ENABLE(val), val, true);
>  }
> @@ -253,7 +253,7 @@ wa_masked_dis(struct i915_wa_list *wal, i915_reg_t reg, u32 val)
>  }
>  
>  static void
> -wa_mcr_masked_dis(struct i915_wa_list *wal, i915_reg_t reg, u32 val)
> +wa_mcr_masked_dis(struct i915_wa_list *wal, i915_mcr_reg_t reg, u32 val)
>  {
>  	wa_mcr_add(wal, reg, 0, _MASKED_BIT_DISABLE(val), val, true);
>  }
> @@ -266,7 +266,7 @@ wa_masked_field_set(struct i915_wa_list *wal, i915_reg_t reg,
>  }
>  
>  static void
> -wa_mcr_masked_field_set(struct i915_wa_list *wal, i915_reg_t reg,
> +wa_mcr_masked_field_set(struct i915_wa_list *wal, i915_mcr_reg_t reg,
>  			u32 mask, u32 val)
>  {
>  	wa_mcr_add(wal, reg, 0, _MASKED_FIELD(mask, val), mask, true);
> @@ -1692,19 +1692,19 @@ wa_list_apply(struct intel_gt *gt, const struct i915_wa_list *wal)
>  		/* open-coded rmw due to steering */
>  		if (wa->clr)
>  			old = wa->is_mcr ?
> -				intel_gt_mcr_read_any_fw(gt, wa->reg) :
> +				intel_gt_mcr_read_any_fw(gt, wa->mcr_reg) :
>  				intel_uncore_read_fw(uncore, wa->reg);
>  		val = (old & ~wa->clr) | wa->set;
>  		if (val != old || !wa->clr) {
>  			if (wa->is_mcr)
> -				intel_gt_mcr_multicast_write_fw(gt, wa->reg, val);
> +				intel_gt_mcr_multicast_write_fw(gt, wa->mcr_reg, val);
>  			else
>  				intel_uncore_write_fw(uncore, wa->reg, val);
>  		}
>  
>  		if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)) {
>  			u32 val = wa->is_mcr ?
> -				intel_gt_mcr_read_any_fw(gt, wa->reg) :
> +				intel_gt_mcr_read_any_fw(gt, wa->mcr_reg) :
>  				intel_uncore_read_fw(uncore, wa->reg);
>  
>  			wa_verify(wa, val, wal->name, "application");
> @@ -1738,7 +1738,7 @@ static bool wa_list_verify(struct intel_gt *gt,
>  
>  	for (i = 0, wa = wal->list; i < wal->count; i++, wa++)
>  		ok &= wa_verify(wa, wa->is_mcr ?
> -				intel_gt_mcr_read_any_fw(gt, wa->reg) :
> +				intel_gt_mcr_read_any_fw(gt, wa->mcr_reg) :
>  				intel_uncore_read_fw(uncore, wa->reg),
>  				wal->name, from);
>  
> @@ -1786,10 +1786,10 @@ whitelist_reg_ext(struct i915_wa_list *wal, i915_reg_t reg, u32 flags)
>  }
>  
>  static void
> -whitelist_mcr_reg_ext(struct i915_wa_list *wal, i915_reg_t reg, u32 flags)
> +whitelist_mcr_reg_ext(struct i915_wa_list *wal, i915_mcr_reg_t reg, u32 flags)
>  {
>  	struct i915_wa wa = {
> -		.reg = reg,
> +		.mcr_reg = reg,
>  		.is_mcr = 1,
>  	};
>  
> @@ -1799,7 +1799,7 @@ whitelist_mcr_reg_ext(struct i915_wa_list *wal, i915_reg_t reg, u32 flags)
>  	if (GEM_DEBUG_WARN_ON(!is_nonpriv_flags_valid(flags)))
>  		return;
>  
> -	wa.reg.reg |= flags;
> +	wa.mcr_reg.reg |= flags;
>  	_wa_add(wal, &wa);
>  }
>  
> @@ -1810,7 +1810,7 @@ whitelist_reg(struct i915_wa_list *wal, i915_reg_t reg)
>  }
>  
>  static void
> -whitelist_mcr_reg(struct i915_wa_list *wal, i915_reg_t reg)
> +whitelist_mcr_reg(struct i915_wa_list *wal, i915_mcr_reg_t reg)
>  {
>  	whitelist_mcr_reg_ext(wal, reg, RING_FORCE_TO_NONPRIV_ACCESS_RW);
>  }
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds_types.h b/drivers/gpu/drm/i915/gt/intel_workarounds_types.h
> index f05b37e56fa9..7c8b01d00043 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds_types.h
> @@ -11,7 +11,10 @@
>  #include "i915_reg_defs.h"
>  
>  struct i915_wa {
> -	i915_reg_t	reg;
> +	union {
> +		i915_reg_t	reg;
> +		i915_mcr_reg_t	mcr_reg;
> +	};
>  	u32		clr;
>  	u32		set;
>  	u32		read;
> diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> index 67a9aab801dd..21b1edc052f8 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> @@ -991,7 +991,7 @@ static bool pardon_reg(struct drm_i915_private *i915, i915_reg_t reg)
>  	/* Alas, we must pardon some whitelists. Mistakes already made */
>  	static const struct regmask pardon[] = {
>  		{ GEN9_CTX_PREEMPT_REG, 9 },
> -		{ GEN8_L3SQCREG4, 9 },
> +		{ _MMIO(0xb118), 9 }, /* GEN8_L3SQCREG4 */
>  	};
>  
>  	return find_reg(i915, reg, pardon, ARRAY_SIZE(pardon));
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index de923fb82301..34ef4f36e660 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -328,7 +328,7 @@ static long __must_check guc_mmio_reg_add(struct intel_gt *gt,
>  
>  static long __must_check guc_mcr_reg_add(struct intel_gt *gt,
>  					 struct temp_regset *regset,
> -					 i915_reg_t reg, u32 flags)
> +					 i915_mcr_reg_t reg, u32 flags)
>  {
>  	u8 group, inst;
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> index 9495a7928bc8..d5c03e7a7843 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> @@ -240,7 +240,7 @@ static void guc_capture_free_extlists(struct __guc_mmio_reg_descr_group *reglist
>  
>  struct __ext_steer_reg {
>  	const char *name;
> -	i915_reg_t reg;
> +	i915_mcr_reg_t reg;
>  };
>  
>  static const struct __ext_steer_reg xe_extregs[] = {
> @@ -252,7 +252,7 @@ static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
>  			   const struct __ext_steer_reg *extlist,
>  			   int slice_id, int subslice_id)
>  {
> -	ext->reg = extlist->reg;
> +	ext->reg = _MMIO(i915_mmio_reg_offset(extlist->reg));
>  	ext->flags = FIELD_PREP(GUC_REGSET_STEERING_GROUP, slice_id);
>  	ext->flags |= FIELD_PREP(GUC_REGSET_STEERING_INSTANCE, subslice_id);
>  	ext->regname = extlist->name;
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
> index 700cc9688f47..1cb388484bf0 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -734,7 +734,7 @@ static i915_reg_t force_nonpriv_white_list[] = {
>  	_MMIO(0x770c),
>  	_MMIO(0x83a8),
>  	_MMIO(0xb110),
> -	GEN8_L3SQCREG4,//_MMIO(0xb118)
> +	_MMIO(0xb118),
>  	_MMIO(0xe100),
>  	_MMIO(0xe18c),
>  	_MMIO(0xe48c),
> diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i915/gvt/mmio_context.c
> index d177884d8f7d..200c1162daa3 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio_context.c
> +++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
> @@ -106,15 +106,15 @@ static struct engine_mmio gen9_engine_mmio_list[] __cacheline_aligned = {
>  	{RCS0, GEN8_CS_CHICKEN1, 0xffff, true}, /* 0x2580 */
>  	{RCS0, COMMON_SLICE_CHICKEN2, 0xffff, true}, /* 0x7014 */
>  	{RCS0, GEN9_CS_DEBUG_MODE1, 0xffff, false}, /* 0x20ec */
> -	{RCS0, GEN8_L3SQCREG4, 0, false}, /* 0xb118 */
> -	{RCS0, GEN9_SCRATCH1, 0, false}, /* 0xb11c */
> +	{RCS0, _MMIO(0xb118), 0, false}, /* GEN8_L3SQCREG4 */
> +	{RCS0, _MMIO(0xb11c), 0, false}, /* GEN9_SCRATCH1 */
>  	{RCS0, GEN9_SCRATCH_LNCF1, 0, false}, /* 0xb008 */
>  	{RCS0, GEN7_HALF_SLICE_CHICKEN1, 0xffff, true}, /* 0xe100 */
> -	{RCS0, HALF_SLICE_CHICKEN2, 0xffff, true}, /* 0xe180 */
> -	{RCS0, GEN8_HALF_SLICE_CHICKEN3, 0xffff, true}, /* 0xe184 */
> -	{RCS0, GEN9_HALF_SLICE_CHICKEN5, 0xffff, true}, /* 0xe188 */
> -	{RCS0, GEN9_HALF_SLICE_CHICKEN7, 0xffff, true}, /* 0xe194 */
> -	{RCS0, GEN8_ROW_CHICKEN, 0xffff, true}, /* 0xe4f0 */
> +	{RCS0, _MMIO(0xe180), 0xffff, true}, /* HALF_SLICE_CHICKEN2 */
> +	{RCS0, _MMIO(0xe184), 0xffff, true}, /* GEN8_HALF_SLICE_CHICKEN3 */
> +	{RCS0, _MMIO(0xe188), 0xffff, true}, /* GEN9_HALF_SLICE_CHICKEN5 */
> +	{RCS0, _MMIO(0xe194), 0xffff, true}, /* GEN9_HALF_SLICE_CHICKEN7 */
> +	{RCS0, _MMIO(0xe4f0), 0xffff, true}, /* GEN8_ROW_CHICKEN */
>  	{RCS0, TRVATTL3PTRDW(0), 0, true}, /* 0x4de0 */
>  	{RCS0, TRVATTL3PTRDW(1), 0, true}, /* 0x4de4 */
>  	{RCS0, TRNULLDETCT, 0, true}, /* 0x4de8 */
> diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
> index 8f486f77609f..f1859046a9c4 100644
> --- a/drivers/gpu/drm/i915/i915_reg_defs.h
> +++ b/drivers/gpu/drm/i915/i915_reg_defs.h
> @@ -104,22 +104,21 @@ typedef struct {
>  
>  #define _MMIO(r) ((const i915_reg_t){ .reg = (r) })
>  
> -#define INVALID_MMIO_REG _MMIO(0)
> -
> -static __always_inline u32 i915_mmio_reg_offset(i915_reg_t reg)
> -{
> -	return reg.reg;
> -}
> +typedef struct {
> +	u32 reg;
> +} i915_mcr_reg_t;
>  
> -static inline bool i915_mmio_reg_equal(i915_reg_t a, i915_reg_t b)
> -{
> -	return i915_mmio_reg_offset(a) == i915_mmio_reg_offset(b);
> -}
> +#define INVALID_MMIO_REG _MMIO(0)
>  
> -static inline bool i915_mmio_reg_valid(i915_reg_t reg)
> -{
> -	return !i915_mmio_reg_equal(reg, INVALID_MMIO_REG);
> -}
> +/*
> + * These macros can be used on either i915_reg_t or i915_mcr_reg_t since they're
> + * simply operations on the register's offset and don't care about the MCR vs
> + * non-MCR nature of the register.
> + */
> +#define i915_mmio_reg_offset(r) \
> +	_Generic((r), i915_reg_t: (r).reg, i915_mcr_reg_t: (r).reg)
> +#define i915_mmio_reg_equal(a, b) (i915_mmio_reg_offset(a) == i915_mmio_reg_offset(b))
> +#define i915_mmio_reg_valid(r) (!i915_mmio_reg_equal(r, INVALID_MMIO_REG))
>  
>  #define VLV_DISPLAY_BASE		0x180000
>  
> -- 
> 2.37.3
> 
