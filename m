Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2315656D59
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 18:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC80810E163;
	Tue, 27 Dec 2022 17:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF8C10E163;
 Tue, 27 Dec 2022 17:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672161248; x=1703697248;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pyu5M35zQN01hXPUqWatuRrmKFr9K+2FFGt8nTIemGE=;
 b=jMyfxMj1cfux0Z1AUmdhzcgseuXaLwYLlm3PLMHce4tX5RygUPex8JnW
 gGqVardTowHryv95EpRJt2WZHtO3I4zzCcm+snwrR+IT9WX1W9n/edi0Y
 lF/smAjAyiSgiSFHUFmkiqsSFWb1V7ijkRZWKHG11b3uhccVP95se4rKl
 5io4zxGhNneIY4EgaqpIv1CAZjv9HC0pzEwqeZhRDC1pYjltf6ld/+TpJ
 K9HSivZ8uBOcMAuZbCclc/UoWW9jH8h/ujPva/LyMlw5Q8oAcpmoArTQ8
 W06Vm7NHIKsQQI+5hE2CTCX+21Bp9CyGn4pfEGHXrm+XATyqyJ/z6wZCw g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="304233281"
X-IronPort-AV: E=Sophos;i="5.96,278,1665471600"; d="scan'208";a="304233281"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2022 09:14:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="716388068"
X-IronPort-AV: E=Sophos;i="5.96,278,1665471600"; d="scan'208";a="716388068"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 27 Dec 2022 09:14:06 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 27 Dec 2022 09:14:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 27 Dec 2022 09:14:05 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 27 Dec 2022 09:14:05 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 27 Dec 2022 09:14:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMT2yNr+i2h9qY4qi/AH1xcgT91BCzmTf0o6k3ZwB+y7Dfrv1FlmFeFErbeCMVDdoVSu68fCUmfEdOupmZGEI1e70BRLxGcvSZBCL2Pvt/l/E/y8H/91L7KiOyVA+DX45ufsibCdl5aPDDhmYHhFekjRXzbqDABmdSZQK15Tl+fTkBUxAUxFjGTxHtgSoslGO8We6UJXdywpGC945u/CFRzwZMbutFNJhsBXSSfIEQdJPInShl3/L0BwrmxZPYClOrt1PME/9jiFybK9yMbIUxuk6TvPD+NmJhZ7pM3f7xonf25QuwipDLxPOmFtA2UQV8vVBB94IrNsYSGaVnZb6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NyNthrvMKRoSGcTxw9DBzjOfKbIC5ZtkqQgYY58ePVQ=;
 b=JbEM5l16lSPCUIFikbSnA9kCrW/AspLCNtFGWLt2cSvdjLqrWIh825xTTfI/ebi1Yq3up1IkZccxcpMqFlO6GF3FqOQ/rTsLhDVvkk3Hjwad2tX5iq+ZVh1mZX8j4e4tcG3Dr3JZhigtIYxf05BUkDPKPt0lfl4TRRVqBUisZ7d94vZCex4ZTExUYxxUqj/B5EShe2uw9mRhM+YANhvQ+adNcT0iKKMA6lpKWSmU5PRH7NMjLMZjmU3V3UngnuHrpg32Kx6nJT8moZWaAcDbGCm4Lt61SxkWHCLODYelg0kycA4+qSjb1bs2YTfF3dn2vSAnQNZXg57vAKePlrTQ7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 27 Dec
 2022 17:14:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808%9]) with mapi id 15.20.5944.013; Tue, 27 Dec 2022
 17:14:02 +0000
Date: Tue, 27 Dec 2022 12:13:56 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Deepak R Varma <drv@mailo.com>
Subject: Re: [PATCH] drm/i915/fbc: Avoid full proxy f_ops for FBC debug
 attributes
Message-ID: <Y6sn1BmhFJFssW0h@intel.com>
References: <Y6qmNW6cOHjGwn03@qemulion>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y6qmNW6cOHjGwn03@qemulion>
X-ClientProxiedBy: BYAPR05CA0069.namprd05.prod.outlook.com
 (2603:10b6:a03:74::46) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: 13e12e56-f4f9-4026-fe66-08dae82dc02c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y+Vj3Uk3S9EflgmhKEbiG1y1NnNJKKgqvnfNK0NgAFVzFovR7JDk+4lmkh/ExBBbK+nQ3CdAUC7N26TGc6gULsEPVlbRMoAWNQQAcalQazL+KJSeDarpRmYq1qELiKood+rac0atMxUBeDx1qAZe+k8SViPPAuv5HgmeCTQ6/XOxXFmOW67JY9pNaI8JkXC6uktczTWXRpWlI3Wr/6qM56RT8OzNA1WeV8pukLTpxlfuxzsfAr+lDSSjOUmSLjvo3DyFgzZvLs2y1KnV0w4otBe6RHILZtIEF9oxSIaq+obp5CxT1y31+hoLDbKvYksu69gr+Q5q+HBhrvKqfsxyQ6J+iOOYgrzTMzTtnf4y0Pw7zhMjQO/PgoyXAvpwDbr9ufEUji6Fc15QgHuNMoMKfl/kNcksIMPMfG0DcSMkhrFyGjvuJ9oemhtpIguOE8fa7aVMCtQMPgZ0zj910mx1t4lHBavNH7lRv5rNnZ/HABVDZgLJ0Gj38gXDwMnvJ1qQKWpE3O8mEnXnNdZA4/cZgEeHkgkXOB4aIF5NuuDKLHQjXv/Ho30jrcHA7dPoW0ldh+Gbeo3YErIBtdE4xnF+WSgzrzjg9AWc/bKgIeveMX/aLTQ2UCfmYDikGK0JKHM/p+rwyJzysKeEX4+ppZZSFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(376002)(396003)(346002)(136003)(451199015)(6506007)(41300700001)(316002)(8936002)(2906002)(5660300002)(66556008)(66476007)(86362001)(8676002)(6916009)(7416002)(44832011)(66946007)(54906003)(4326008)(26005)(6512007)(82960400001)(186003)(38100700002)(6666004)(36756003)(83380400001)(2616005)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q2Im8FNB1d/hn72bwPJIj8XMGJsH45M/rMV8Tv0X+M7loNn8/SlPiWVHLPWB?=
 =?us-ascii?Q?NP4DIESQQG5q9kjxR4VSa3fW/o5orJkBTrUF4Wjw4FSFkpJU2iHgr/ynmdv+?=
 =?us-ascii?Q?WEr3sVRQ8ZJRBolfw8t1QEhIQGFgdY/Rd7DYDa0jF+DT52+iqLDhKaGUnW+w?=
 =?us-ascii?Q?5Icw493kABr+Y++hF60IKTcoM6ifHB7c/E230TkHsWDKuCKm/INDZzzO4crq?=
 =?us-ascii?Q?8CyuWs2JkG7vro6Yoq5q0BQgBsTJdKPVLYAZWRcj3bN8ITSk5AH9o7MzlQY7?=
 =?us-ascii?Q?YzY+70Zn015eyWD46cB9HSFgW5ZksDBpiWeTX2JciAEVe10mLcXn+QMywHxh?=
 =?us-ascii?Q?k9v95TzT0fz9gVsLgQHLm39Va3kwimyczzqqdXQfd2Mdub9J+rEZEcCzp52q?=
 =?us-ascii?Q?mIivXfSqxDYUQ/M2bEJckKS+dmGHP0picLtfIIV3JerjUJn56QszK94a7G+j?=
 =?us-ascii?Q?MH6gkljbJNZwBDaliLL4yGZ4VS1cxEKtdQLah/FPOEjZx/R9nY9Rp8tRLSOM?=
 =?us-ascii?Q?ycTHbTp2AScQK5m13amWiUU02y3rlVXe/vh1OZW3+xAb2Ci50+Y9rqGBj0jH?=
 =?us-ascii?Q?cTaxE5lpxdnftw9BU3JWogh+8Nf9No7T8i487jpyDO+sA/eDXiKI2sR6wl0Q?=
 =?us-ascii?Q?yOSKx/MehXVZBkpj/Ly/v1XytnAuxM6F08+PNkDLR58OvoSDoFF32uYog924?=
 =?us-ascii?Q?i4xwBYrzK7TLxlRyLMA1wbYm6Vc+ExWeti/eYVKS7yduEcko5HPXrAI1KbIv?=
 =?us-ascii?Q?c7RcmPMx00KZxCoE5Y5yRXtOzycmHRYDcmF3Ph6karsGCHWdKgGnyp1TK9Iv?=
 =?us-ascii?Q?1ajqwJzSZJ+Kd7Gefsz/8ZQGDBlituii6mkhuUL9nzjESgL2Xb88KrC3uxWH?=
 =?us-ascii?Q?v5HrSGba5NPmK59AN52oL/+F1XkVmO+0XhQP2W3GJwWWxaV5V8FHkPOe5lIr?=
 =?us-ascii?Q?IL1y5UugytETevN7OGhDxxs2XcPm+OKMSWWVp9RXwl1sDT66N1rWYR4nSRtV?=
 =?us-ascii?Q?ME4kiHxK4pwE2Pd3d/o6kIoDYUNBOHhJCEToQeO0q8DHFtBmC8jo8c1H2apR?=
 =?us-ascii?Q?/13G84djme/ca+PGJl6h5WPJ/yuFDpAtLt+G84fWvB87M6Jwg69A4yR6OYKG?=
 =?us-ascii?Q?Z/aXH7udpyNBA9Kz1FUsuScj6EBppK3bUcRNPlbg/sdXncneVAvwWQdHlbaD?=
 =?us-ascii?Q?AlXTtm8ahn569c+SeqKkcWUjw4jSijbBKq3bzkvQ4g986P/73HcafG4CFcnd?=
 =?us-ascii?Q?6DXUyaJ2jDeAzmuJfClB1RwQKl3CTqbznMoP5zKKcomCxB+GjZXN4l1pxLaA?=
 =?us-ascii?Q?YzmrWYB3ier78IM0zdq4lpBuq/+EME2/uX2L27U256P22JkHUHT+Q5XbZgK8?=
 =?us-ascii?Q?s3BD4qUb3ThSF2NN3OwnG02l2lV0Baris+3CgsbKku/wPoxPkZOE1LSla95I?=
 =?us-ascii?Q?kdFqkt+orP1V3iwOk2LDmaZO/0ImqshwPjbkW6Q+HnDvHqAgn0WxRR4WPLD4?=
 =?us-ascii?Q?I+RIkgnyB73u4pJCr3501ZRRpzqJHRNrFqTPvEx0/+D0yl1Kbucj0doCbeCU?=
 =?us-ascii?Q?zLZ97UsYYAFDZPD4G+3n+Y+c7GRB4qBZU1F8FZ0rhhOvU6wiqs3fr/vtIVSu?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e12e56-f4f9-4026-fe66-08dae82dc02c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2022 17:14:02.4986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ey3nvggNnmHCCW3NJe5sZWhc2/SDFKwPwaWC3I1kdgV9eUg3f7yFGSx2BwvQHqvGFn8nbgpt0qmC6XQVLI8ZOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5818
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Saurabh
 Singh Sengar <ssengar@microsoft.com>,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 27, 2022 at 01:30:53PM +0530, Deepak R Varma wrote:
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
> 
> This Change is reported by the debugfs_simple_attr.cocci Coccinelle
> semantic patch.

I just checked here with
$ make coccicheck M=drivers/gpu/drm/i915/ MODE=context COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci

The part reported by the this script is the s/SIMPLE/DEBUGFS
but the change to the unsafe option is not.

This commit message is not explaining why the unsafe is the suggested
or who suggested it.

If you remove the unsafe part feel free to resend adding:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
(to both patches, this and the drrs one.

Also, it looks like you could contribute with other 2 patches:
drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c:64:0-23: WARNING: pxp_terminate_fops should be defined with DEFINE_DEBUGFS_ATTRIBUTE
drivers/gpu/drm/i915/gvt/debugfs.c:150:0-23: WARNING: vgpu_scan_nonprivbb_fops should be defined with DEFINE_DEBUGFS_ATTRIBUTE

> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fbc.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
> index b5ee5ea0d010..4b481e2f908b 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> @@ -1809,10 +1809,10 @@ static int intel_fbc_debugfs_false_color_set(void *data, u64 val)
>  	return 0;
>  }
> 
> -DEFINE_SIMPLE_ATTRIBUTE(intel_fbc_debugfs_false_color_fops,
> -			intel_fbc_debugfs_false_color_get,
> -			intel_fbc_debugfs_false_color_set,
> -			"%llu\n");
> +DEFINE_DEBUGFS_ATTRIBUTE(intel_fbc_debugfs_false_color_fops,
> +			 intel_fbc_debugfs_false_color_get,
> +			 intel_fbc_debugfs_false_color_set,
> +			 "%llu\n");
> 
>  static void intel_fbc_debugfs_add(struct intel_fbc *fbc,
>  				  struct dentry *parent)
> @@ -1821,8 +1821,8 @@ static void intel_fbc_debugfs_add(struct intel_fbc *fbc,
>  			    fbc, &intel_fbc_debugfs_status_fops);
> 
>  	if (fbc->funcs->set_false_color)
> -		debugfs_create_file("i915_fbc_false_color", 0644, parent,
> -				    fbc, &intel_fbc_debugfs_false_color_fops);
> +		debugfs_create_file_unsafe("i915_fbc_false_color", 0644, parent,
> +					   fbc, &intel_fbc_debugfs_false_color_fops);
>  }
> 
>  void intel_fbc_crtc_debugfs_add(struct intel_crtc *crtc)
> --
> 2.34.1
> 
> 
> 
