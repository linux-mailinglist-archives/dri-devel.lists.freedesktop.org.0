Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFCE606A21
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 23:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265D710E1A8;
	Thu, 20 Oct 2022 21:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85A610E1A8;
 Thu, 20 Oct 2022 21:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666300855; x=1697836855;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mrG77d8XeioxvT1W521xLfZNljPh/WAzHPonzM1AkV8=;
 b=TEMzarYHwzB3gwV1sO/ZWOA/4My3eolWF09U+Tlrj3N6grpROjL85Dt5
 n/tmXr9uCuKTYJRUdFpcbhWTEEnUXVI2vIAzfOIvfKqBlRo+ZlBG0cSqR
 a7hAP0Ep0jfAXncBb6rtYQB0hx9/by68EA0FswH4Sn+PtoqMrbV7kIOIV
 7vOmPwW9sSZ3Li7FAQhCaBfZS/dH6g0IDcMIbqkFKiFZyLwotiHxPDo0l
 qMEY5Uf3dT2xHh/ka07uaSMQK0lPQprPY3fXecSxxBvXaXm52hLatzNtI
 3HA4xiCBy1P02HtbzSC2bQre/xQK8tDeos96lNcHgIOJuTHPglviy8YSk Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="333411527"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="333411527"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 14:20:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="663310995"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="663310995"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 20 Oct 2022 14:20:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 14:20:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 20 Oct 2022 14:20:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 20 Oct 2022 14:20:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlE5qo5jqcJ5ogEpEsvc2wRq9UY59HpzINMz7nL26PtL9Y6pQH+zwpFJzSyJziwXnKrsHWXKPzRKZ3N2KaBw+Pov7n0yzK8i9vMLAWTIcjugXGeahfqzEUbdn1detZlJhjDYOn0gp5o7/oeDR+fXjz2ziOufmWh3IHnO53SvqLtYiFYFBSR7+tEFHR/zD49OQIOhlbbW6qClqsWuYEAy83nr5JfnCI2EFCZMYBB/WNenZSxgCOWyvQ+gSnn89K5b90WdKvhHuMvrfxRCDVy9ofXGeqHu4bHyTN8xsayoLdk1Kg7L7G1J2lSVgna0nRlJ4kf//IquJvCdYRmAYjrnCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5JxFdMZipAbJRwVzJfIBEORGEoaX/jLm5ua0lp1gWrs=;
 b=INpKHZ/YI/OpickCKmwvn60RVP09SVEqbfQ/ZC+IOzVL8f6TqKe9bAb3e4Im+LaZGdC90al4CP1d4gnbca0e7WX7d/9FmojcdmG0RvUTwXDDgnh+YW2IrlHbRU6iolJr/vff8l/VPaalTQy3NCnSyRBa5UVuXSP/wp5yGLJeXCrg2jov63KVl0p0+bjoqnkVB/SaE1JiY8TezSxMHLRG2wKiJjRzR9RMMXRvpr/zsiAqWZGreDrIqydK+YFDt1hPUI51TzQhRA3M2nuDrPwnfoM1DyjwhIH1thsvnjPpIVYZ/njzvv8NPuCdCMhN7TF54rd9w8eDFpFjSq3dYGBYtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SA2PR11MB5114.namprd11.prod.outlook.com (2603:10b6:806:114::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Thu, 20 Oct
 2022 21:20:52 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d%3]) with mapi id 15.20.5723.033; Thu, 20 Oct 2022
 21:20:52 +0000
Date: Thu, 20 Oct 2022 14:20:49 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v4 16/17] drm/i915/vm_bind: userptr dma-resv
 changes
Message-ID: <Y1G7sZNFgcMgps4M@nvishwa1-DESK>
References: <20221018071630.3831-1-niranjana.vishwanathapura@intel.com>
 <20221018071630.3831-17-niranjana.vishwanathapura@intel.com>
 <Y1Fa2k/Xk4s5V1ip@ashyti-mobl2.lan>
 <Y1GcA+BdZUTwZl7i@nvishwa1-DESK>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Y1GcA+BdZUTwZl7i@nvishwa1-DESK>
X-ClientProxiedBy: BYAPR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::36) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SA2PR11MB5114:EE_
X-MS-Office365-Filtering-Correlation-Id: 6448cc40-3359-4906-12f4-08dab2e0f762
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9yNt9qsXrR7ariQT0eWPG1Yg8neSpP8rrMHRp2VXyefjFulqVfqtAMYhP3QPD960zXmabKVXq5JmUDvZGV9xPvba+COpHZ5jGLUUsuwPyeT3QSybWcYxf/6ipRqum06KOMENHIIvZhfq0lsWpjOUI7EgMJyQ6H5iXsYhevhXOHQBRrbXMloMGzqdi6gfXhbiNT4VOnrQHSoVOo7+IbJQ6Mhy4WfWhmWYh8b2xTEP898gmARxg8HfZBXgTu9pwqSkE+0Pz2DxH4Vq2RKoY1MpcaXgr2Jsep75XQ/7Fp/v6iybT2+jqxHMCXr69HGpxuSbb5z9LqTj30jNZTUHVA4GtXCt/8CGjUWnlRzlwc/AlXN+GExqUYOMg1WaO3GIbySTXeH7FjcYiLAjW/MhhBWitrsG4uDB7CmczDWYb3UEhrIDonGXoqJcrhOjcxFfAXE04dV+Y+hd4TJhEfpNzdaGWsp2UIzMOfzZmgUCaAyQ25hQQufjxWLLhD+ZCe+hKX0DI37Gboqk6ldgeASOzUZIUk7YKHUbTCvONqPlJfHu4q6OH9vTcInnA2hxCB0gXLZjJJBigUMdQNhRshixm1t5umV9AfcU9cwKaU4VA7cBHUJvzKkKUZ4KB5Jp3tGWCqbSaErUgcyT/mLyszlqU1qXZpyUdLpTaBzbNucw0KINvNW+cXrZwnqiPDEJUkTEDqbGGvk4pQDziap3HPlR4ETEoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199015)(33716001)(5660300002)(82960400001)(41300700001)(44832011)(38100700002)(2906002)(6506007)(8936002)(6666004)(6486002)(66946007)(6916009)(8676002)(66556008)(66476007)(4326008)(4744005)(316002)(478600001)(83380400001)(26005)(6512007)(9686003)(86362001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Wj6XQBIH6592cACxbheaQsVxcM0W9IYyxjm5mH3SMfZRiytFOvfDGWoJsmi?=
 =?us-ascii?Q?Al5tErqsTow/cRI8A9GKGe8GRkEZC0ijDaQfBrHG6L89ej7+homUU/yhdXIW?=
 =?us-ascii?Q?tmWrcat5ZED5faMjIPSd6aFE0QYgUi/LUAgFFiX5YnTSIOO1nUXrN9GfaaIl?=
 =?us-ascii?Q?ZSCZrr5/dUAqunGeUbzs/tZaS9HoxJ82P++xf3dhFQeYpq/Q3OoURDZ8HuiT?=
 =?us-ascii?Q?2Ptbm/MdSf1WSe9pf70eWap/uJM34b7WLTfHrlEfXVe+UB64LSNRRfgZZJ8+?=
 =?us-ascii?Q?r1flbvWaXJWE19X8FPGdgeED/tmIPzySzoDf+nKTZIE1JkPVPzQCrPy0Okme?=
 =?us-ascii?Q?3ntJ6T0xBz9a+qMBqpgmP4UVGvMO3dX1afqHPtZq1E7wcfOR1E5UqYC/tHtp?=
 =?us-ascii?Q?Sd0ZyIPy3HUOFwEOZJ5q5ksVsRHLqwhuMMh+81DcfT3Wv/yprGdkuWlEVIGZ?=
 =?us-ascii?Q?99yuN+LHgEQbMUrOsjLaMdQr+nZz7dx0QKiby1qeoo/YU5JfEjtQNkJ7WAUY?=
 =?us-ascii?Q?/UWHRGBJi6KLGiHzRBveATT/+vtc8y+NTKwaBILTjuBHdHJf1/9ufvcPFVIA?=
 =?us-ascii?Q?RQE6VxIuhz9VRTeucCVTpAP6RFvJlPGE9sz14DyY2+N2YiyLypz3Vi80AVKE?=
 =?us-ascii?Q?CoxnW8ezQ9kuQFGPsJYm3Vwcjt/A+sLa8GWCZwuuKGtdraKY8KGAO8thhV0l?=
 =?us-ascii?Q?NS5n38fa9pZeAwF2uXhiCZvzBUD7374LeRY+/Lk7k1A7vg7f+iy2kKOLpioO?=
 =?us-ascii?Q?sedVI++gnn6kkLD5/s1HgqGewmuo7H1JfwXU59nR6+4kzSf8BvUiBRIfS8Ng?=
 =?us-ascii?Q?RM3TNx5EUivIGK+2e92UwFh4uX4uflUsnGzFM7HE0NuHq19qzr03esxz05fz?=
 =?us-ascii?Q?CkKrcTWsv5t5D8VWV/Em0DnYicbyNIjf4u2YViJyoF4Jw3oXfFhb8fYA6HGQ?=
 =?us-ascii?Q?0ksej1PUlBO0FcdghYrZQ60iS0oXw3xX3K5+2Gf5jgcjp4X6cCgdh3xRkg0p?=
 =?us-ascii?Q?ZuINhgFUUDoYJY/S8IHL7HApBgKphibmnE+80TtVbJpnix7chAzW4uCfi6Yw?=
 =?us-ascii?Q?VeBQJr5dZ1ghMid3Ym/evN3kPnVwepM9hi8gH3/2qy+6FKxcb4xvXRxfEaV2?=
 =?us-ascii?Q?InKTVZJSTlm+msb1jvYc3OMcmw3KlINlL7627efUY0uNhxeYoE4Pgf2YiKU7?=
 =?us-ascii?Q?eI0nnj1uXSmiKu5DHriFcet3vAlO9bfQoTRWXFoYelEkmxLGBt2ikeZRQVku?=
 =?us-ascii?Q?WYGYJIC5htUA3SZaMTrdSjte2TvhofryWeV8Jn46QgVIKTygxEiUliVL3V1y?=
 =?us-ascii?Q?i6rBAWSKlsVdu/RwJtystWCkaf16TIDFAO+pKjgT89SldS4Nh9nqwstNLSKw?=
 =?us-ascii?Q?8t/dF6u+QRmZxgHGz8ggHXpQnroPKMxA1I0uaYxbhxC0rr7MXL6mw+bgx5b1?=
 =?us-ascii?Q?9UBK6yn282lc0W9+rnKu13euj5A1iHnpIczcSG1PHDhM6ODpgg5n7hQWX21B?=
 =?us-ascii?Q?e+0Zn4kTRbdo6s/vc25aOdYVpQ5l3tmCly2QSoFFRx04wTN9LvAZXNDIvgVm?=
 =?us-ascii?Q?si5QbsSwDy13voURE0dns7DWROZuA0KnwRvMs5dc8dVt3+CfvMAgAAAAFCVD?=
 =?us-ascii?Q?K4Ag1U+xckTun48JcbPlZtE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6448cc40-3359-4906-12f4-08dab2e0f762
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 21:20:52.0727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fipjGgJIQNkBBn18AcRUvfj/a4ppX1G8eWPoTrR8tbOImSAC3jAZNlfpmxY6aHFzdPd7jwShjR8XakZwbFRZPP1dG58jO/p1APiXuF9Or+2n7wgwtiymffiDln4w87eh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5114
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
Cc: paulo.r.zanoni@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, daniel.vetter@intel.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 20, 2022 at 12:05:39PM -0700, Niranjana Vishwanathapura wrote:
>On Thu, Oct 20, 2022 at 04:27:38PM +0200, Andi Shyti wrote:
>>Hi Niranjana,
>>
>>[...]
>>
>>>@@ -307,6 +307,8 @@ struct i915_vma {
>>> 	struct list_head non_priv_vm_bind_link;
>>> 	/* @vm_rebind_link: link to vm_rebind_list and protected by vm_rebind_lock */
>>> 	struct list_head vm_rebind_link; /* Link in vm_rebind_list */
>>>+	/*@userptr_invalidated_link: link to the vm->userptr_invalidated_list */
>>
>>nit: add a space here
>>
>
>Andi, I am keeping all vm_bind related fields together here.
>Just following the other examples in this file.
>

Ah the space after the asterisk, ok, will fix.
Also, these comments were not a kernel-doc, will fix them.

Thanks,
Niranjana

>Niranjana
>
>>Andi
