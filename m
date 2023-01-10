Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9064C664B99
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 19:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C4C10E638;
	Tue, 10 Jan 2023 18:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E05710E1B6;
 Tue, 10 Jan 2023 18:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673376706; x=1704912706;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bEABDBrSvOU2hz0H4Sbu2Q1+VRrRKc/wz2aTwYnI6yg=;
 b=V1j8I+/tCPo9bCPYMMsmvEjk0YbyUs2IEUuBEa28vlSk8t6W/ShopMPa
 obE+GCgHiWwP60+CSHeX8jiMyplraqUSqQfR2qLiRiB0xfLyk/WJvF5hw
 nNiMzQNCE2ZsM4CxsDRoAo6V6wu8frAOKj37soJ9u2qLFL0QeKW/o/YJM
 nMc4+DWg8QrdedhiFKWaEG4nD8DajrnPvO1M69h0fP5Mf67sQ0lYAmwxK
 ko7O9O7g/O6+h1vWqyVsRSqjom84sj3qu6jpHm1iVFhWZhMYH8iHlsHOB
 3kZd/+hil/o3ZyqXpCBTwSaArG5t2aN2tnI7ovWIn+ZsFMOxXaxV6zCas A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="302931191"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="302931191"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 10:51:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="985876201"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="985876201"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 10 Jan 2023 10:51:44 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 10 Jan 2023 10:51:43 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 10 Jan 2023 10:51:43 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 10 Jan 2023 10:51:43 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 10 Jan 2023 10:51:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ON5aSvh7eD1M2CCDokfY4ubiYApEIXp2SpVDNzHnSWME8jsb/MSghkkBNI0pgWVs5jwLaPL2rTR2Ci6oTpvoLqYU+nZoddTw4CpWIwj+56xoLg1/NPQkeK+TigA6+DU54/uwTs8i7qx/RhEkIUU1o6mnuf6iBzGikLmDe8WbMI7kZdOLjjpanL4h+qyac9fhhgLYPvMIjwncI2qcbTuTyQ4cN5uBs9J6Eznt/JnfPLP8EqDCH76Kh+bIhJKMUiEesNaYPxf361I1xCnUBY+aPSU/NM7yCi1DuJoRSu6E+KNtdx6hdIiN3pro4XiKmulorFxXBdh+Ef5RgWS7adT86Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TsEpRcVEMpFRqXnKnuc5dxQgmyjNSRfCDjpG1Sshc0Q=;
 b=IGZeO2HbL/5qsOaFVHpdBKcerMJ8CbRWAwglwG09hPCKohIRMu36GkOKxjf1OXQVhrEXocDlkNUzyowd4KGmBv2D7bXbPXAgF35A0eE70rwhc2FNgsBSHCcF7eK1mlfB1mviULAmfW9mXze7CIJnn8WHcxykty8jCv4+dVu2N9C/5A1IIGWNoAWKcYh7YDfDuO+a+tbfea41kw0FCxCBDrIvKdB8RM6RORLZLa1N3Dbpa8QY1UXpawBpkkTu2QLVxG+8EIoI5sHYAk86gj4qnXa1hrjMAqmCRFf79NTk4qTjqi+vgjl2td8PXZ6/B6UbiFKTbWvsArJphcbger9Tzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 18:51:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 18:51:35 +0000
Date: Tue, 10 Jan 2023 13:51:30 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Deepak R Varma <drv@mailo.com>
Subject: Re: [Intel-gfx] [PATCH v2 1/2] drm/i915/display: Avoid full proxy
 f_ops for DRRS debug attributes
Message-ID: <Y72zsk1eAmROtU9B@intel.com>
References: <cover.1673343994.git.drv@mailo.com>
 <4f6ae3e9a1f674abd36295772e7ffd0aa3e4a30b.1673343994.git.drv@mailo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4f6ae3e9a1f674abd36295772e7ffd0aa3e4a30b.1673343994.git.drv@mailo.com>
X-ClientProxiedBy: SJ0PR03CA0388.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5341:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a9bbf82-b5e2-48a0-4b0d-08daf33bb2c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ym5KKrYzsRq+lrIz2TXFrA6psKDkZembVlW/VimIHxbp2sRyp/TkR34PB80Cfrk7UVhho5ZdOdlHN2owVRbQs90mJ5glzPwxA9jzy0aGet2bi9e7vWa71U9tU8LOMWw9OKqtrJcp6FHTgqD1OyLupxCQ+MVOrkGRYWIMxEs9hETRxyp6MwAJjy2YuY3dg8RqHtyNRR7S94AfIYAYrV2HPTr2IUxcAFtuh/fNCkPscCMAruSUoMo9HZVjlnf4RnoWd3PzF0iTdYqngMdZ6408+YUPx6AFQEpi2vYUmlpGSSFyfjb/WNvq0fvYtgYbjnGz2ICzuZuM9f3XLxay/rfgqEA9LJGOZab/DILXVNjkzga8sUNZhGAoW3q9DzJaGYATz1jNPVNkr//upjyadpNWeOTXhA0xAONqUrgYAlClIlDgyNtxJ7wf8Y3rTdezsjHivrNxMAE59pWQpG8pMTIfW+R7SOx+SaS1S/eEeuL0VbquWZNxb+FZ4CzsQWjc6lOW23AXZ6R1reFVsC/OG0A7IDT4pCeOY/trvz8QJupI9F+RZkXRSy/mhVMM8ofBuYTqPOy3eWdkvYimQ3dvJx8CyJ3fkAZDnqlPNZyxrPOlkXUXAFY/g4bsHRWFRgIrN7iPUt0Hdnyl/ha1RjA/Qkp+gQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(39860400002)(346002)(396003)(376002)(451199015)(36756003)(186003)(26005)(6666004)(8936002)(6512007)(6506007)(2616005)(66946007)(5660300002)(6916009)(66556008)(66476007)(7416002)(316002)(4326008)(86362001)(38100700002)(82960400001)(478600001)(6486002)(54906003)(41300700001)(8676002)(83380400001)(44832011)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9jD8OPRB8YYuGgeE61IwmTvfyBz7A85kXJfOGv0EZpDwWoWIc+LZCCdXTySl?=
 =?us-ascii?Q?LrUT819ZzYlJekF3cqldUyHKynRBD+r/WALYVBKqdTaNKQ9kkn+B05WuFsFL?=
 =?us-ascii?Q?xzofEmGvA2kuOfwYDB2SyfUMTP8XxWAdKjWaGvN35tSMkfJfOeuke9nhxU5U?=
 =?us-ascii?Q?6y+7AAUiScyBDZ1w2eFJJVRK3a4/7TuO1lzbTs4SvNUDl5c/KkoRjO0+jC60?=
 =?us-ascii?Q?dKSsbmr4D+K9AL5JYoPyXYtbtrUz/TcR95PZpVyWGsSRjm9WwNYDbar2QTfZ?=
 =?us-ascii?Q?ndrKPrXvxn8WQHzh+s3VNbOw3iaH6zf0hv64R1Gi4vVqrYLXUFzC0G5u0+Mh?=
 =?us-ascii?Q?tSfLDG4RRh1Dh3hEOrG1dN/CCbaD/VpQ5CZmH9zxeErZgaVdyBefkp9HNbbO?=
 =?us-ascii?Q?cOTy+cllPSBXK4g7MQZmE65Nps8j6L/AQHKiLDNbxoBupp762r8tM1KX0mp9?=
 =?us-ascii?Q?x46WZom0afnpT83We333j0G/yt6dVPqdJFjh1ylNq00moDc98Id2nT2ST6il?=
 =?us-ascii?Q?HVMAwh4bm9ufnG44IRygfF35cV7RioX6DgnZkIl0ULPB5beDT21fUDnI+Vtg?=
 =?us-ascii?Q?aTsLERhgzDcPlugiIhlDvi7fvRZKNA43EglQo2huK0tPOzgZWWwRxIVyVSsq?=
 =?us-ascii?Q?VzieaTz2nVLh/hPIK3XELZL2vCKyug7mawOvdytBPMM0aQ6jTKKgSjGzttTI?=
 =?us-ascii?Q?uwZP72W3y6aKu37rN6pw24k5vJ1ITu87wuEGf9iPWeqnMWBafVfQHvzX78ME?=
 =?us-ascii?Q?1k+h3+rphIrCwdCpCIAAR/0kMBeNmpa5J9RhpAc62F3pu3/hTxm/88cNFKN7?=
 =?us-ascii?Q?DH91aF9RKPYfyaiz5jCUozbIZfmisl7rn/4vZXaYtuqwDKCPpAx2k2PFNjNC?=
 =?us-ascii?Q?gT8yKJ6g5TmKYNVgGrZz47XRpRQHqoLTQyQYm9SKCbv7mRRIBsqzQul54vMX?=
 =?us-ascii?Q?/xSl9dycSYOJML4Q0XmC3XEB8F4F9Hp1eeDUKhltOd2d7AEvCB12/4bwifko?=
 =?us-ascii?Q?pB838B8Vt/pJS7S0aPsdYSkiO4Nzpqd6fNmD4/09jVaXBSCzv7JrghLoHBV4?=
 =?us-ascii?Q?cyyJVUPgpJlk6/3mCP69gOGGwkvnOelBHBEXuA4d5aF9SnnKa8UEn47lf4pq?=
 =?us-ascii?Q?+0AAf5acwrZ9VQDn71Nigh7Nzy9Nud2leZP4zc3yWqlMkYxQJBc+AjQ1/pvR?=
 =?us-ascii?Q?cHDSAKeoZ9U/Ib6P/lyu+WOmKo/2C/8YaDsjEXohBjvq3/Kj1zUYyn7Indxg?=
 =?us-ascii?Q?kbdkgKXJnlmrOSxhRfbUu3lCEgY+3mTsuyqz2p92n2GGMGUtk6Pkr9+TYpC7?=
 =?us-ascii?Q?5mdKHGEPrnlr33aqT2GLLdLaeYEb8wFtyRpVraJFByn7jOyM/o51VOO4BRN7?=
 =?us-ascii?Q?69DQqG/HdQOKgNylJcGTwhdmA24KXLdEFWa4bCwlW6zN8Nvt0B3tCcPmZiS+?=
 =?us-ascii?Q?bp7A3FquZDRIKqbIxJ3ADK7LUVmgauLV2skS9BB/RC35kHJsGxah0N1fMq5N?=
 =?us-ascii?Q?nLKvOOSTMTrMUd7Vi0RidYBbc2JHpVeom3BlTdbgvvoMoK+fuPIlKqXcHrzu?=
 =?us-ascii?Q?VQfILGSePQMpTP9pRLoptepp6DaV6F8m1UBT1GWQl1Ev1TMvcIoecgkHG2Og?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9bbf82-b5e2-48a0-4b0d-08daf33bb2c9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 18:51:35.7314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FPhzZJoPsT8Kk0rUsxKrl7C3OkzFAfVKJULAXdmYaOSuwFpGhQXAku0h8KPauBbLfycZciJUqDu9RXYlnjwJng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5341
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>, Praveen
 Kumar <kumarpraveen@linux.microsoft.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 10, 2023 at 11:45:02PM +0530, Deepak R Varma wrote:
> Using DEFINE_SIMPLE_ATTRIBUTE macro with the debugfs_create_file()
> function adds the overhead of introducing a proxy file operation
> functions to wrap the original read/write inside file removal protection
> functions. This adds significant overhead in terms of introducing and
> managing the proxy factory file operations structure and function
> wrapping at runtime.
> As a replacement, a combination of DEFINE_DEBUGFS_ATTRIBUTE macro paired
> with debugfs_create_file_unsafe() is suggested to be used instead.  The
> DEFINE_DEBUGFS_ATTRIBUTE utilises debugfs_file_get() and
> debugfs_file_put() wrappers to protect the original read and write
> function calls for the debug attributes. There is no need for any
> runtime proxy file operations to be managed by the debugfs core.
> Following coccicheck make command helped identify this change:
> 
> make coccicheck M=drivers/gpu/drm/i915/ MODE=patch COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> Changes in v2:
>    - Include coccicheck make command in the patch log message for clarity.
>      Suggested by Rodrigo Vivi <rodrigo.vivi@intel.com>

Thank you

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
>  drivers/gpu/drm/i915/display/intel_drrs.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_drrs.c b/drivers/gpu/drm/i915/display/intel_drrs.c
> index 5b9e44443814..84ba7379d6f8 100644
> --- a/drivers/gpu/drm/i915/display/intel_drrs.c
> +++ b/drivers/gpu/drm/i915/display/intel_drrs.c
> @@ -374,16 +374,16 @@ static int intel_drrs_debugfs_ctl_set(void *data, u64 val)
>  	return ret;
>  }
>  
> -DEFINE_SIMPLE_ATTRIBUTE(intel_drrs_debugfs_ctl_fops,
> -			NULL, intel_drrs_debugfs_ctl_set, "%llu\n");
> +DEFINE_DEBUGFS_ATTRIBUTE(intel_drrs_debugfs_ctl_fops,
> +			 NULL, intel_drrs_debugfs_ctl_set, "%llu\n");
>  
>  void intel_drrs_crtc_debugfs_add(struct intel_crtc *crtc)
>  {
>  	debugfs_create_file("i915_drrs_status", 0444, crtc->base.debugfs_entry,
>  			    crtc, &intel_drrs_debugfs_status_fops);
>  
> -	debugfs_create_file("i915_drrs_ctl", 0644, crtc->base.debugfs_entry,
> -			    crtc, &intel_drrs_debugfs_ctl_fops);
> +	debugfs_create_file_unsafe("i915_drrs_ctl", 0644, crtc->base.debugfs_entry,
> +				    crtc, &intel_drrs_debugfs_ctl_fops);
>  }
>  
>  static int intel_drrs_debugfs_type_show(struct seq_file *m, void *unused)
> -- 
> 2.34.1
> 
> 
> 
