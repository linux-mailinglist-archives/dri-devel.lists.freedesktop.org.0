Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AEF93D2FF
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 14:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC7B10E25D;
	Fri, 26 Jul 2024 12:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HNs5188C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A7C10E0E8;
 Fri, 26 Jul 2024 12:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721997084; x=1753533084;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sXukmrGPJWonsGu442tKiH1gQARo5FXaYnJLWfVvxzE=;
 b=HNs5188Ci8nhL3rkVRH2N5QuPij69UOLd5GvPZ/NW+AAAqyUkXueXfnk
 DKGcQwFcCucLwaFVolc8QNq2L1kw9wm1u7kURbSm6QMMULWzECjrQkxeh
 XedkjGQXNJ5fLrwvGX/Ew6PCKqfhiu8k8xNc41KRFE+DNGa7ceDDapfTR
 1msRCSadD15J3/5O/+g1H/bNzyr913GDyFktdkk1dyNYV7R/037qlwdJ3
 vAMSMC0M2lgl2xuCgSEXZYSIpS6ulb30Tmv8f6b0H4iaLqOJQok269xrS
 V97H/QRvFb2NxBgH1wqNJiyy/nUx32FD7Wn+t1WEbEICqvJXHV55R9/Gf g==;
X-CSE-ConnectionGUID: q9hdLeFNTD2zUo9uRH/aew==
X-CSE-MsgGUID: c+5e6GWdRIO6/JrS0cMVWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19659432"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="19659432"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 05:31:24 -0700
X-CSE-ConnectionGUID: DSJxIkUERFaPOYiaDASFkQ==
X-CSE-MsgGUID: z6Co2R4tR1yzEWzduBc1sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="53275114"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 05:31:23 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 05:31:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 05:31:23 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 05:31:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SseI6pRfp5YQz7xCVpa9SQlvYNJckNGy00taxy/0JaQ0oCBgjgIifgj7aD3jfH5CCx182ThAvlqHKDWMg5rJL88g/HU7BQr1TXc7dJ60eIrAGiEuVsPqwr9mUrWbRXO+06Qpmhi7I98HFUN3u8/U/4wi15oSAKbgvF5K14PAo2E8llzSJO0IW1dsiq8Mahzxmga1B2HqQttE9+TvLgtdKo0tzGFB3O4IEea11qQma+WI3+LOL2Lx45GZjeefUeRhLGLfC7jVUXC48ErXnHw4rMSBwSYvBHLOAUaE/PlIzmH6UBHez5D7NoY8sXNFpe6JIsqMAL7C39tHxqwaiOXsuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8UGx24x3/fpag6S7mBn+6yhCB+LaLuT6Oy1cn93aj8=;
 b=AHFLgBXemj3uDrH2h0OSQdDKNhrO62mF8/BPxVIkyD1/c7Dmi2P/g1PvQHqY4RZzwIkAxPf57UitQELZaRZUKJ7Gd4k4kFGk5pDC8zGamzRVGd3pbtCXXbKL5YngtpSBbDqY9MDgw3oNGWL0/6537rxGMFgNLZGshE0Fl0mxkUbdCRR4VEpE+eaRketwtHE9qpz9q3wR3DAAt+syxMkc4nZTeRKrM4ceak0vdykGRc+iialFArSaTollkqqhJWBv/PCwpm/1fyHADaY0c3RZwKaz/QGNscdgthInH6lOv6bEmEM60K3toXVmBL1KL6lz+qonkGUu1YtOc2Mqa60a5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6293.namprd11.prod.outlook.com (2603:10b6:8:97::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 12:31:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 12:31:20 +0000
Date: Fri, 26 Jul 2024 12:30:29 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <alexander.deucher@amd.com>, <jesse.zhang@amd.com>, <vitaly.prosyak@amd.com>
Subject: Re: [PATCH] drm/sched: add optional errno to drm_sched_start()
Message-ID: <ZqOW5Q778UCkh7V7@DUT025-TGLU.fm.intel.com>
References: <20240726075550.1511-1-christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240726075550.1511-1-christian.koenig@amd.com>
X-ClientProxiedBy: BY5PR17CA0025.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6293:EE_
X-MS-Office365-Filtering-Correlation-Id: 9399afad-c2af-4078-3535-08dcad6eda3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?nhXvFkhoJzIWhZpB4B4qhOHaLqA+zcTp2l5I9jJxw974hu43ZseeogrUsy?=
 =?iso-8859-1?Q?gslR59HeYyLFqX+fRTGnDbpSaKX1oOWQKvLDu5bSLVzzo4gKL8yKVpSsE8?=
 =?iso-8859-1?Q?Km7CfRMb8KJHCIIPygTccn2AG89QWBClvBdI0N4JThOrIxxcJbyRxj1D2r?=
 =?iso-8859-1?Q?P8Toa1udXXnpTnQIBlpHd0bPDhQfCoKh2ap5PJIL+acjlCF5fOus3YzCQG?=
 =?iso-8859-1?Q?KtXFMfrQ2j9snRRwPYpoBuZQV5/gg/btQsDeFioYHe82J8U6iZbbAaVsR6?=
 =?iso-8859-1?Q?Cd7Fe/+x7V7PzOUvf/10E1WraNa0SJl5amt73wkPdnHfS5jdZOFwzBqr1k?=
 =?iso-8859-1?Q?6ulTA7GWUuvErw4evtcfddtHii5qU/aeYnj+1Ojf69PspgROdZBZhSATXV?=
 =?iso-8859-1?Q?g85HyMvMx4UKcOt3VkRcjzKWfL5iASZpiaRQ0XYkypVVs1botozmDQ+5TW?=
 =?iso-8859-1?Q?Ua8xQ2I0kPQJYcfTYptu/b4pvOoJeasU0xOwRvxeo/q0ik/ttiOD5Tb9Vo?=
 =?iso-8859-1?Q?EDo1fmUp5hoqbMuTxPt2nO18ryApHQEttY1ERzz7qUfA3Ozni5wJooeuKs?=
 =?iso-8859-1?Q?Rl5pZFHM9Jva1YK4ZEAPTxcMUgE26aKEoB4KF07//UwxDnevn4GjI4vGp2?=
 =?iso-8859-1?Q?/n9rkkZBSP3cNgNXJjU5CmAQgV6mUjHF5Ipi0Ju2/1qvpJiClpI62va3mH?=
 =?iso-8859-1?Q?7jt6l483QxlIOugmybKUCQalcHZM2b2sBjx0YbqjLnJjqEnUnwDl2XElzS?=
 =?iso-8859-1?Q?CzeZDjd8pTf9m8JYKBhVOiwgDaAYI0HG28WHWhp51s6dvTMZLpHXi9kGk+?=
 =?iso-8859-1?Q?PHn3iU1pWop/SHILS7K7wbRy3BMIiArgLKpUaNTVhFw1fOGYpkxYF0TopF?=
 =?iso-8859-1?Q?JLBX0RQzf28lpQJeN5rbPqTHu/5LOUlWD7FVD4voK8hx8357EanaCXVke+?=
 =?iso-8859-1?Q?LxROiMGFtAKASa8z4XxvOqFxFUlYlKC5CqKSKMdsCV7bkT14mpP6ptiMs2?=
 =?iso-8859-1?Q?lWXZxl6wHN47lhXwdZSjJzJZy6aMCRFeZY9yhIis6gbRktVXnN8R/pVAiz?=
 =?iso-8859-1?Q?LrZXfB9QMW8c1J7/GoHbixFhB5wk1wrgEwUjbNmVbVnOiEmVUsdfg8uYQr?=
 =?iso-8859-1?Q?oi/Whx2T1sJRdtjr1McZW20ecMpkeLObU4mdGARwIql+JYMZyNLdeOzaob?=
 =?iso-8859-1?Q?3H8OexLK5meGRiNSFY0NUljx9ee4G3+lAE6Cg2aQ45L5x+4pTReQmUbbXo?=
 =?iso-8859-1?Q?hxoVaS0HP4Tx/8Mo4vsDZCqCkD0T588sI4tvQbtpRTcVdpImkqRThHLT0+?=
 =?iso-8859-1?Q?xyhzFxuBGGvha0I393guoo1AH0bXuinbYTrV1MX1UJ0jW1cPA4r3g5WN0w?=
 =?iso-8859-1?Q?V5nOFcMP6ISLs6mCWk7k14kvsULXsEHg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TZ3sur9fyuniYCu9aF84YpZoPTO04eJiU3dUETwO1gc+q9f5SeIBkB9HOU?=
 =?iso-8859-1?Q?vMdqZE4nBWEnJLut/h+v6unBSTjq7cpzn6qahQ6Iz66N3sraeOdfeE9e1e?=
 =?iso-8859-1?Q?HiPL5WEMbSBR9anUi3BWn2ux1USVBPdXRMUPO65BT19ywQW1lq+TwUJziL?=
 =?iso-8859-1?Q?YPsp4r6g0nMUPB/Mq5badzBg5GBiwawftG38z1hSlvkNdK6qlZ4EIBlRjg?=
 =?iso-8859-1?Q?fjdK6lBfnplA82c/fIW/knIJ13wdZBU25sDwROzw0SRXbbtJbjYTGdb1Y8?=
 =?iso-8859-1?Q?8UFqIupKPMl7awZMK+kAQQ6qE66QPFEirOMzHOKs/GNGg/RTArfaeZgOb/?=
 =?iso-8859-1?Q?lXCXOt7Kp6c27MdgP7AEacEuA/aVClXI3MqtVlupb6TCSdTVrCxpDHeLg7?=
 =?iso-8859-1?Q?gDIeNObQN4C6sG3L/HG7N3bEU5gjPiaYkWQlvV65IpoTXGehJC976i8EVP?=
 =?iso-8859-1?Q?HeRMz7vq/ytprVJx8Gev89UMY6ydNJvhKHCk3z2W0WWFGUWY7CNYz2xTnu?=
 =?iso-8859-1?Q?yUPwgf6/MjSydlJozMM5Mr5OOYJ2W5npvbc++UzJz240V0oN1bgC8vK9f6?=
 =?iso-8859-1?Q?pIz5YqEBCVBSjT23WQs7zE41AulIq308WbhNSTWcgvhpPQaDHj/txXg9K7?=
 =?iso-8859-1?Q?bMGxN103HC05O+hxXDwAGSu1iSeD87vIe1+487ApX9b7+3WeGKEHPJLvP5?=
 =?iso-8859-1?Q?Pdzyi/Qw2H+sYnouY4TchxLxexM+3hlSCh0S2sMvZPbnUd3TBbcqjGjFiY?=
 =?iso-8859-1?Q?zE/1CdFuYXFguNfzZkD+FBPVU+A5oIsJ15jOTpD+hgE1wNUeCguiUVeCNH?=
 =?iso-8859-1?Q?SGe1jz+9brf7Ol1h5ZuN9jXB/aVtRgoS7HmU4WbIPZrA/0haA/roI235OE?=
 =?iso-8859-1?Q?HAIurdleQ7DRony5SQr0vk3bsv7hag246b61lO/69dQ286dVMaKpCv4+Pp?=
 =?iso-8859-1?Q?9smK9rAHo8Lep/c3KxUgLnYEVNchl/2FV6SgF4gSRAAT0nBBDvoiCFQ582?=
 =?iso-8859-1?Q?fp67UM5r5GEpgxk9BNC0QcQfCYXHAN25hQ+qV3ZJdmztL7z566UPnWTyv0?=
 =?iso-8859-1?Q?kfhSFlW8jQtbhUQ1St23YwOa+WEUTS1DWSxW703uWE7gBrfc313ZY1iUPK?=
 =?iso-8859-1?Q?PNt5uQHd+YUf/VVo8bF9c9CSvu7Zhta+HY6psEXmwjtd44C3LWj4issHbQ?=
 =?iso-8859-1?Q?Cv3bbk56Ukx3bj7x8T/BKqnhrpd6j4orgMRZyYQLdJyeIk6RldjUpiNKR6?=
 =?iso-8859-1?Q?qoX5Ua/SwJ3DGhFi9BdTcNzhg4TlJUeJhYP4mtoxIu2rBpzPpRrr1vDwfG?=
 =?iso-8859-1?Q?W7UPUie47qju33mwtx2xDUx507rVAYLhrxE6qzsmeA2wpOgdOwlRrGZWm1?=
 =?iso-8859-1?Q?slWV/FLJ1KtodQbCGcGLgdL4E9SHaiOXSmivjERoINpuU46AlVCnsdrULk?=
 =?iso-8859-1?Q?11QtVHJDfuIRq6KrJBEvadSAtxc8cq6YzqdvnlRF1Dl22mlKVxC5NWqYd7?=
 =?iso-8859-1?Q?9uLzpglOFPnWfiKRRCfo+xAFAxTuHp3xr2euxct65xS1BkjHKGMwYd3XQX?=
 =?iso-8859-1?Q?5TVNh5QoYdTuI9iSNv9g7G3/mWv8UdAFNjUVhoOY/6ywFXoyX3Yy+FTVcA?=
 =?iso-8859-1?Q?eILdn4BERfvBesk3EEwn8JiTsD775gUWcBXZYezrOtBaPoIpZ2jCU7HA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9399afad-c2af-4078-3535-08dcad6eda3c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 12:31:19.9917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WcIZhzQwDOwpY0JVitjctL1CCF7EDh5icu6mKii1gRLcIxEgJFpjKYwRmVkEtvS7s65ERTYZxkoAGGZlBxRe6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6293
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

On Fri, Jul 26, 2024 at 09:55:50AM +0200, Christian König wrote:
> The current implementation of drm_sched_start uses a hardcoded
> -ECANCELED to dispose of a job when the parent/hw fence is NULL.
> This results in drm_sched_job_done being called with -ECANCELED for
> each job with a NULL parent in the pending list, making it difficult
> to distinguish between recovery methods, whether a queue reset or a
> full GPU reset was used.
> 
> To improve this, we first try a soft recovery for timeout jobs and
> use the error code -ENODATA. If soft recovery fails, we proceed with
> a queue reset, where the error code remains -ENODATA for the job.
> Finally, for a full GPU reset, we use error codes -ECANCELED or
> -ETIME. This patch adds an error code parameter to drm_sched_start,
> allowing us to differentiate between queue reset and GPU reset
> failures. This enables user mode and test applications to validate
> the expected correctness of the requested operation. After a
> successful queue reset, the only way to continue normal operation is
> to call drm_sched_job_done with the specific error code -ENODATA.
> 
> v1: Initial implementation by Jesse utilized amdgpu_device_lock_reset_domain
>     and amdgpu_device_unlock_reset_domain to allow user mode to track
>     the queue reset status and distinguish between queue reset and
>     GPU reset.
> v2: Christian suggested using the error codes -ENODATA for queue reset
>     and -ECANCELED or -ETIME for GPU reset, returned to
>     amdgpu_cs_wait_ioctl.
> v3: To meet the requirements, we introduce a new function
>     drm_sched_start_ex with an additional parameter to set
>     dma_fence_set_error, allowing us to handle the specific error
>     codes appropriately and dispose of bad jobs with the selected
>     error code depending on whether it was a queue reset or GPU reset.
> v4: Alex suggested using a new name, drm_sched_start_with_recovery_error,
>     which more accurately describes the function's purpose.
>     Additionally, it was recommended to add documentation details
>     about the new method.
> v5: Fixed declaration of new function drm_sched_start_with_recovery_error.(Alex)
> v6 (chk): rebase on upstream changes, cleanup the commit message,
>           drop the new function again and update all callers,
>           apply the errno also to scheduler fences with hw fences
> 

Seems responablie to me, but all the caller pass in an errno of zero to
drm_sched_start. Going to change in a follow up?

Anyways, LGTM but will leave RB for a user a user of this interface.
Acked-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c          | 4 ++--
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c             | 4 ++--
>  drivers/gpu/drm/imagination/pvr_queue.c             | 4 ++--
>  drivers/gpu/drm/lima/lima_sched.c                   | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c             | 2 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c             | 2 +-
>  drivers/gpu/drm/panthor/panthor_mmu.c               | 2 +-
>  drivers/gpu/drm/scheduler/sched_main.c              | 7 ++++---
>  drivers/gpu/drm/v3d/v3d_sched.c                     | 2 +-
>  include/drm/gpu_scheduler.h                         | 2 +-
>  11 files changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> index 2320df51c914..18135d8235f9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> @@ -300,7 +300,7 @@ static int suspend_resume_compute_scheduler(struct amdgpu_device *adev, bool sus
>  			if (r)
>  				goto out;
>  		} else {
> -			drm_sched_start(&ring->sched);
> +			drm_sched_start(&ring->sched, 0);
>  		}
>  	}
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index c186fdb198ad..861827deb03f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5862,7 +5862,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>  			if (!amdgpu_ring_sched_ready(ring))
>  				continue;
>  
> -			drm_sched_start(&ring->sched);
> +			drm_sched_start(&ring->sched, 0);
>  		}
>  
>  		if (!drm_drv_uses_atomic_modeset(adev_to_drm(tmp_adev)) && !job_signaled)
> @@ -6360,7 +6360,7 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
>  		if (!amdgpu_ring_sched_ready(ring))
>  			continue;
>  
> -		drm_sched_start(&ring->sched);
> +		drm_sched_start(&ring->sched, 0);
>  	}
>  
>  	amdgpu_device_unset_mp1_state(adev);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index c53641aa146f..2c8666f8ec4a 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -72,12 +72,12 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
>  
>  	drm_sched_resubmit_jobs(&gpu->sched);
>  
> -	drm_sched_start(&gpu->sched);
> +	drm_sched_start(&gpu->sched, 0);
>  	return DRM_GPU_SCHED_STAT_NOMINAL;
>  
>  out_no_timeout:
>  	/* restart scheduler after GPU is usable again */
> -	drm_sched_start(&gpu->sched);
> +	drm_sched_start(&gpu->sched, 0);
>  	return DRM_GPU_SCHED_STAT_NOMINAL;
>  }
>  
> diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
> index 20cb46012082..c4f08432882b 100644
> --- a/drivers/gpu/drm/imagination/pvr_queue.c
> +++ b/drivers/gpu/drm/imagination/pvr_queue.c
> @@ -782,7 +782,7 @@ static void pvr_queue_start(struct pvr_queue *queue)
>  		}
>  	}
>  
> -	drm_sched_start(&queue->scheduler);
> +	drm_sched_start(&queue->scheduler, 0);
>  }
>  
>  /**
> @@ -842,7 +842,7 @@ pvr_queue_timedout_job(struct drm_sched_job *s_job)
>  	}
>  	mutex_unlock(&pvr_dev->queues.lock);
>  
> -	drm_sched_start(sched);
> +	drm_sched_start(sched, 0);
>  
>  	return DRM_GPU_SCHED_STAT_NOMINAL;
>  }
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index 1a944edb6ddc..b40c90e97d7e 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -463,7 +463,7 @@ static enum drm_gpu_sched_stat lima_sched_timedout_job(struct drm_sched_job *job
>  	lima_pm_idle(ldev);
>  
>  	drm_sched_resubmit_jobs(&pipe->base);
> -	drm_sched_start(&pipe->base);
> +	drm_sched_start(&pipe->base, 0);
>  
>  	return DRM_GPU_SCHED_STAT_NOMINAL;
>  }
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index eb6c3f9a01f5..4412f2711fb5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -379,7 +379,7 @@ nouveau_sched_timedout_job(struct drm_sched_job *sched_job)
>  	else
>  		NV_PRINTK(warn, job->cli, "Generic job timeout.\n");
>  
> -	drm_sched_start(sched);
> +	drm_sched_start(sched, 0);
>  
>  	return stat;
>  }
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index df49d37d0e7e..d140800606bf 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -727,7 +727,7 @@ panfrost_reset(struct panfrost_device *pfdev,
>  
>  	/* Restart the schedulers */
>  	for (i = 0; i < NUM_JOB_SLOTS; i++)
> -		drm_sched_start(&pfdev->js->queue[i].sched);
> +		drm_sched_start(&pfdev->js->queue[i].sched, 0);
>  
>  	/* Re-enable job interrupts now that everything has been restarted. */
>  	job_write(pfdev, JOB_INT_MASK,
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index d47972806d50..e630cdf47f99 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -827,7 +827,7 @@ static void panthor_vm_stop(struct panthor_vm *vm)
>  
>  static void panthor_vm_start(struct panthor_vm *vm)
>  {
> -	drm_sched_start(&vm->sched);
> +	drm_sched_start(&vm->sched, 0);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index ab53ab486fe6..f093616fe53c 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -674,9 +674,10 @@ EXPORT_SYMBOL(drm_sched_stop);
>   * drm_sched_start - recover jobs after a reset
>   *
>   * @sched: scheduler instance
> + * @errno: error to set on the pending fences
>   *
>   */
> -void drm_sched_start(struct drm_gpu_scheduler *sched)
> +void drm_sched_start(struct drm_gpu_scheduler *sched, int errno)
>  {
>  	struct drm_sched_job *s_job, *tmp;
>  
> @@ -691,13 +692,13 @@ void drm_sched_start(struct drm_gpu_scheduler *sched)
>  		atomic_add(s_job->credits, &sched->credit_count);
>  
>  		if (!fence) {
> -			drm_sched_job_done(s_job, -ECANCELED);
> +			drm_sched_job_done(s_job, errno ?: -ECANCELED);
>  			continue;
>  		}
>  
>  		if (dma_fence_add_callback(fence, &s_job->cb,
>  					   drm_sched_job_done_cb))
> -			drm_sched_job_done(s_job, fence->error);
> +			drm_sched_job_done(s_job, fence->error ?: errno);
>  	}
>  
>  	drm_sched_start_timeout_unlocked(sched);
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 42d4f4a2dba2..cac02284cd19 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -653,7 +653,7 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
>  
>  	/* Unblock schedulers and restart their jobs. */
>  	for (q = 0; q < V3D_MAX_QUEUES; q++) {
> -		drm_sched_start(&v3d->queue[q].sched);
> +		drm_sched_start(&v3d->queue[q].sched, 0);
>  	}
>  
>  	mutex_unlock(&v3d->reset_lock);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index fe8edb917360..a8d19b10f9b8 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -579,7 +579,7 @@ bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
>  void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
>  void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
>  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
> -void drm_sched_start(struct drm_gpu_scheduler *sched);
> +void drm_sched_start(struct drm_gpu_scheduler *sched, int errno);
>  void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
>  void drm_sched_increase_karma(struct drm_sched_job *bad);
>  void drm_sched_reset_karma(struct drm_sched_job *bad);
> -- 
> 2.34.1
> 
