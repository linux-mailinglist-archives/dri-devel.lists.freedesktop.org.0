Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84168CD0833
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 16:32:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF41C10F038;
	Fri, 19 Dec 2025 15:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hn5+0pdS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD3D10F030;
 Fri, 19 Dec 2025 15:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766158363; x=1797694363;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=42gLu1VOBrXBW/ag1M31Y2mzzqTlV7e5Dsiz+7igfs0=;
 b=Hn5+0pdScbVN2vpcXObYcKCIs4JVzhELoixNBgD09reJRh5bTQ992T0d
 xSVxwWEsBOCPInXXIOmxNB5sDKeBRnaYQO4pSi1NJIGoKakzOZAQsCwR+
 OkqYckj4c356NgHX+/2hWe52N/PiYrSUNIgFvqDR/1moXwVAFrd4+whW+
 8QNvhWMMiDK0YR3qgcvxC+ueGR6gaR3DQ8fUx3ojjxdBCjK0Lzmv6tIj8
 WbdaJTuaXT8MkDHD5sCDOUvRxFUZJPsvI1ujGAJhtllv/xyKsaDTBPsEB
 nyt5A0dsoGzdWVIzmbTSDJxSP3KTbvwd3hRdt32USmkeKAsobo3eqQQ96 Q==;
X-CSE-ConnectionGUID: LxRQIhulSqm81GNXOMy+ZA==
X-CSE-MsgGUID: Vshed6BXSXCipO7MWDJULA==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68196203"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="68196203"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 07:32:43 -0800
X-CSE-ConnectionGUID: 11lKmmxsSpC2VysQt797+A==
X-CSE-MsgGUID: eNRzFvOeTkaoQKCHUk+v7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="199708433"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 07:32:43 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 07:32:42 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 07:32:42 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.4) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 07:32:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9aN9Ad/1sdo93H06B+P5H1QI60JuPstt2prwHi/GGoWq3Fsj9uYOClfcZk459+UsNcn48uUE8Qj5HR2Eg+vdo3iHRhbXmJNKJ3RO0PJRmJam9iAmg1vaOveV7y64J2QunjPrnh+lHmUSfudFSboPswUKyu04RCU5GwORP6b9oVLMinOi+yiL92pxFzkN+ySQOdBBdnTivFFNLW0x0pj7wEJixSqGPLVBDOy9LWNZs7YaCEotSoYDDeOHFD4e4q6js6qEsiNwhrL0EYAyI9TDktyNZZc4Ern7Y6wFNLF2UGHYukxytrIkq6v06Ou2dkaPPniHfvQfZy/yiRv4tKyhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgN5d5VBcsPPYOI3iHO5TOsYVRtaahCztE+F+L+v+wo=;
 b=EsxIBfzOT+wo8mrLtcyxYHgQyI9enBTqiq8U1ZCGFBmo86hfUK0GgimP9fTfmNmM2Oss3bYHtxGj5LEIeVGXvzsSmmUECmCDf1o/w5O7Fg9EBHTLAPotJZJSobJgFkjtkbMsdVmIDe+fgscFp3Hua8AdFuTIDcqDpvAZYVe0wk/exiyp5VTIp+G5l8UHb9/5Y/9b95aousn5kQIYMMZVxNRQcabXys7vMoRtdf2RvRuC0oxzzFIU9s3yXNUkZ3FzxnOA9FSY1aJQvdSdIXOaVktWjCSkSBb7V76Px1fre3l95DAu9J8BxQhuHUMHU1FlgPcJ4C+FUg1DYGs5GfV81w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA2PR11MB4954.namprd11.prod.outlook.com (2603:10b6:806:11b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 15:32:38 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 15:32:37 +0000
Date: Fri, 19 Dec 2025 10:32:34 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Madhur Kumar <madhurkumar004@gmail.com>
CC: <lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] drm: xe: Replace sprintf() with sysfs_emit()
Message-ID: <aUVwEvQxNSRf18Qf@intel.com>
References: <20251214083659.2412218-1-madhurkumar004@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251214083659.2412218-1-madhurkumar004@gmail.com>
X-ClientProxiedBy: BY3PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:a03:254::6) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA2PR11MB4954:EE_
X-MS-Office365-Filtering-Correlation-Id: 049f2571-6c07-4aa6-8a0c-08de3f13d6f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?00yZFkh0QXdEgXi74Y4HCgPL6Q++WBzQOoN3Gp+HFO9CV28jTPZXthPG3PDF?=
 =?us-ascii?Q?cEaASSu79u1lg0pYA3BPUaxZhUitSRrbNnA34U8s1sL0QMvVAAHkH9qfDTzr?=
 =?us-ascii?Q?PHls1p2hd1Bo+vRuFp1NY0cLX+k+FNos0duSmwrhmHKwEkTrcHXgcqJQqBK9?=
 =?us-ascii?Q?15AM/7mTdsw/bY7GcO61lfHkIlBj+4tRIXcP2gJtzoTE6F4KEy7jCidpJXwL?=
 =?us-ascii?Q?XUyyop7JGgBQ1Gi768X43I+XLqCp6MjEkeMNcyFCFrvbhAE+chyXop+UbhWX?=
 =?us-ascii?Q?9OM580DOSDwnbK+bt4Vj5a+YtZ/XIDVmJlFIhML6XsZ4PPV40BnPPSa/dW4w?=
 =?us-ascii?Q?br1P5zQve2NwyA2vlJOUzhiRLWS+L123mOBNaWlM1CaGHbilz+f2XTgYq9eM?=
 =?us-ascii?Q?j1/DODyZ+zrl2nuag7E04ysOma3Qldc0hlwgL4iZWjRgJoKFSxEv3D9ssGTT?=
 =?us-ascii?Q?/aqSzuF2IKGoG4BdKyZPN5vejWorhVyFlEAbTKdc7w+CSpfnfYphDh8K7K0P?=
 =?us-ascii?Q?M9A2mHB4BSgq9+FMIYm9D1C+FFkMSZDNWF7fAFAqhW0PBSaJv7w+QkUSmy/K?=
 =?us-ascii?Q?gvXem3g4VtkzXySRL3VEglYUSXPNdFSvYCcbJq17U5yLYg7vieWJwMdpf0ok?=
 =?us-ascii?Q?3nCO1fSTZCHDMgZT5PkoYZfYd0d93eb5nosgfvTUXX9s409LITHj4irFC8Vh?=
 =?us-ascii?Q?/9yWl+304csG4Cu7liFGWK+QxyEz8HETzI+M+0eTVlR2aWTWnPwomOB7ZHVA?=
 =?us-ascii?Q?o+FRjNot8bN0Ubuf6WSorbQLKaTd/a4vkU/Al/eeWM407fqqyK2aiecy1N6l?=
 =?us-ascii?Q?8G8xiHXMOTGHBQzhpZGLNPlAPO9j4AUDjRdN6A3N+1oFTImPvtI94XsX3l1L?=
 =?us-ascii?Q?Tv/HEJfAiyzHx3o9xe+76LdngRFSO9r9AL+VurOc83zQncO4esGAw5r9mIeO?=
 =?us-ascii?Q?RmLbg4NoTDRuN0buUu6LqCkAdOLWABdHa8PG8I5z30kJiwMHexyXW5OeInr9?=
 =?us-ascii?Q?0ItUiE5pUI/TV8Jgso8sFo1vbBw2TA+NYkK3eoY+jcL0OIxsXXkxY2wMlmM/?=
 =?us-ascii?Q?J0lEptwMsqfy7ZkP51wtszVcsVDP/HQA8fU9kSuFvjXQYJKDHWXWYmsXIYEd?=
 =?us-ascii?Q?7tmSqeHgEpwX/gcQ0+aelpKpNacrvtio+3WWUdlhEbItKlUVJjKSZRQWyr9t?=
 =?us-ascii?Q?MSqVb7gdB6ZgYgcvB946Yp39q/1TLmZX82WnTmuSGRuFIGCJ5zrpmJQdlLY4?=
 =?us-ascii?Q?6hGcOIE8B3nr+RHuYa8X0lLgtT+BrcDUqXPRAz7DHuW6JZSArwQfadDNUGS6?=
 =?us-ascii?Q?7UXl8yWQJoTR3kTYTbGGH56Ofoo0CZcpVuBOvTQljcb7JjNSGOUt8bb0oitC?=
 =?us-ascii?Q?Lm3w5aqHVf7Z5eTqI4wq9/Z6XCrz6gV7VwowdD1LHsmVilAzDgAblOH/dmiU?=
 =?us-ascii?Q?+S/CneSBHDq7ZLfsT1PQsncGVy++r2/v?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AxxuDCeTBwwi4JW30jq1Fm7JgSgQDOyMVXzCCqZNUPPeY4vZX1+qEHRoqPhO?=
 =?us-ascii?Q?YYS33MqMp2KAkhlEsHvthd28xZu2NLkWxNcuQr3w3oDWCZy2TOFd4TvAPw1i?=
 =?us-ascii?Q?caVDDsdxXeU4WW/6PstRi4fBKKy8bV/EvqoA7wZrBZjrUgX5cWEqeGcc+GlD?=
 =?us-ascii?Q?bkdElkpfDxnsfCxVlfGLB/6V4GtDnE1psUbLzHbonlnk4rB1bld0ReA8bj/y?=
 =?us-ascii?Q?R7fObqMt5X4zWbbq8/DYTtyJsAZRP4OqZqDAbu/P27K1K8bnPF3mqjWNm8rx?=
 =?us-ascii?Q?onCCsU1TYPjZIdHuyTOhX27hWEnqfOOEN1/fDRswzN2TuVfjzyBw9cxEevZ3?=
 =?us-ascii?Q?tLKCehlqWdv5IqtsCRQ/BtICG7JFjSI/Dy3xiCv/YnIku7g7fcJyoWC1by4i?=
 =?us-ascii?Q?w9oHS+WdKdWBj4YRIRydlADho3LoYnvMWrbjFqcId49S2Al36HkOlt5L4BHZ?=
 =?us-ascii?Q?RYQm79I+yqeNhZEcWceNxel1u0hLO2ZOJTrIsa0xVucYbpVUgYP2OZsVsvB4?=
 =?us-ascii?Q?muuVghkZcf7NAakfeo6SBO66deG0Zy4QneSrAoLVdjVacfZDW4atWFZ4X3lz?=
 =?us-ascii?Q?4ZRF+2H+HdRQ9/8gX339MxAzNVb0vDJaKC08GdjuYOhcg8WyX6vfKU0eXRLL?=
 =?us-ascii?Q?IHmR3iUg9nptSXOO2TQggJ0L6k/QERyUCqZVMw0051c//PnR5bM8sG4ruj6d?=
 =?us-ascii?Q?6Qfjs9tcg7KgNSwy0oq9kKQcJcC+HfVU75S6ZHmYMzx1yg2wb5gEuNPKqgDU?=
 =?us-ascii?Q?YGBkAWt6V7mQx/t1/mKMDc4bYWwSysI+8IYcmvjwBLTJU8XzADTPjwtuiS8j?=
 =?us-ascii?Q?wXI0Lm7V89+TzodkRDn9zKzDDkjkwcuSet/54gaARDs4OnJb45JBL9ivpugY?=
 =?us-ascii?Q?1vG59XCkePLSdcEfavmtnZ++ZA4zqqu5eoLaULWOymhtoi3eu3pZLNp7jqgA?=
 =?us-ascii?Q?87K3pnDJ5OvJQ6BtmEPdVCJebcOUI9V9qf/q8DUQ1jhqcg+EZn9/6BjeNlIi?=
 =?us-ascii?Q?g6KUZjxn48ln5dlvrHiR76ASJsAgCb3SPxxXlztjYmbk5UjM2YaNSEYT+OLb?=
 =?us-ascii?Q?4b+I+w/1kcWDC5TuIS/YcNjn/j/nTaWgQbqvzMq8JTRd2bIXk8KaoLtgQgAD?=
 =?us-ascii?Q?n3tG40k8tJP+5pFLKF02fnLpyQ5yEzOrSl2iPJ4Xs1udnt1CQZkeunIfBqxF?=
 =?us-ascii?Q?Dj5YtXObh0CdhXv7PIuwjNqb8gMQSmmDNPpI8P4BiqhYCoe1PKwLDMP1QlJH?=
 =?us-ascii?Q?nTXUIKnSu/bxyOjU2K3hp/CrVfMI6IfcvMJPRFhJ31gYiEggrZ1YKek65Rzw?=
 =?us-ascii?Q?Yorw2QGF64AQqeJ2ETgZ1sOvbpAs8dCFHUE5borcEFl7z+oK8Og5Hbnpcu50?=
 =?us-ascii?Q?bkOh6chMpKgRTjmKtj5+TegWbDeelPajuxIxH2npBww95ray4jTf1I9ICX2O?=
 =?us-ascii?Q?zDx6Z9PAqlhTNBlrb8tZaj7T8bXxWgZavan4HCrw3RMKlWP9Ncg421DZNaO/?=
 =?us-ascii?Q?StoKWpSi9slYu/f1JGFcjb18OOhNl4zptU11V2VsVXsvenTUPTgs/pogomPT?=
 =?us-ascii?Q?UkYwRqba+6fYAIFgwjTkqST6snTskM3oQvBPaWVTcMEv18pVbXTZMPyG5631?=
 =?us-ascii?Q?5MFPJ4BnJhIC8nYnkQbb2e18xupK9lTiomworK1TnFLA9zgh6fWUN5owng3D?=
 =?us-ascii?Q?c9v4gvpg8SCYf7+eO2yG08i4fWrqWGrIYWwEJOk6J6cE0DD7sXEzOMJt62NF?=
 =?us-ascii?Q?9hidEnrQsw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 049f2571-6c07-4aa6-8a0c-08de3f13d6f4
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 15:32:37.8454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2TTPCcHAQIbDZ66P3lAO+8oCSSN7EnikSAjp+G90EyqvkTESvuXHSrmXBJQQVWB/hvoZ/PRyVanVVkr2lco1VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4954
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

On Sun, Dec 14, 2025 at 02:06:59PM +0530, Madhur Kumar wrote:
> Replace sprintf() calls with sysfs_emit() to follow current kernel
> coding standards.
> 
> sysfs_emit() is the preferred method for formatting sysfs output as it
> provides better bounds checking and is more secure.
> 
> Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>

Thanks for the patch.
I just did a small adjustment in the patch subject while getting it
pushed to drm-xe-next.

[drm-xe-next af90706f0eec] drm/xe/pmu: Replace sprintf() with sysfs_emit()

> ---
>  drivers/gpu/drm/xe/xe_pmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index cab51d826345..f016459c9904 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -425,7 +425,7 @@ static ssize_t event_attr_show(struct device *dev,
>  	struct perf_pmu_events_attr *pmu_attr =
>  		container_of(attr, struct perf_pmu_events_attr, attr);
>  
> -	return sprintf(buf, "event=%#04llx\n", pmu_attr->id);
> +	return sysfs_emit(buf, "event=%#04llx\n", pmu_attr->id);
>  }
>  
>  #define XE_EVENT_ATTR(name_, v_, id_)					\
> -- 
> 2.52.0
> 
