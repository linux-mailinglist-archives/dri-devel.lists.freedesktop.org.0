Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F036FF546
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 16:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4281D10E4F5;
	Thu, 11 May 2023 14:58:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE0610E4F9;
 Thu, 11 May 2023 14:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683817093; x=1715353093;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bVWp/RqFrpp4fcwOslIeAfMx8agpZ15QtAIlvmUSM9o=;
 b=HczSjpGaiHr3bKPaFfvGUhiqNGB9U1IK9cRKCoRgaeL2h7XPlt12ikKP
 +Ij4A9/6ekhDuxMYy7Une4qcMUV4Y5+U9qSZOhXzknaYwPk5m5AyToDSZ
 NfQeI2u0gKghWmIWpGRMizOAXOh9QGoqKNf/Est/PGIt3SLrLsXlsDKWj
 729qqRwOqvKCsPm5Vxs2CluqKYNc5sMy1aDBBG1zrmyS4isjyefY8C0TD
 qmAlLQdlnBus4dzjmolqkqT4eDiWe9dQYrr5VDVI+XAXxoTNqdT3LMERn
 prAgUDGmghEXghd5+hS+pfiytL+kfiSulc4byjgIAq+3aRjqDxNeYFJkb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="378646414"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="378646414"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 07:58:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="789415013"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="789415013"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 11 May 2023 07:58:09 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 07:58:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 07:58:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 07:58:08 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 07:58:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAe/buzJhEnvkuTiadcQztnMRVAh0sJfKWFJ33OtkxBeNEmTWxHS3ZnJqBWgpkJuF/DIMEOKsn49neCcgpuIB7+Xh/Et/ZvRLX0FvD7biIqUfV0QGGBVqIMpOkdSnCZmuPgHrL4sFTYSji4prtVzHTjJbyGWMHxkdh/X2NechofQfe3drhVpDsWxzJlC9bnFR3OKL1S/Hvlaqtf5m5c84owdgh5oV1I1zcromYt6VXd1buoRYrjm05hxiscpR6jhXaNe1NqyCOjU/mRBojSmQiZ4+YXc0LOF+ho8U9Ntg/L+vOp7QNvRLDkgjzGf7GZoJPadmV/xk6KJ28JGZ+ia3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9A2rOcO0u9cmi9MUsS6i3syaEssAFxMOif5ntiwcwKI=;
 b=a0uZjb+IKhyuhLLxQmfetq6pI8s0JQa81SXKKpRI+1JAJKeYDjfjDruMndmPrJbW/R7LjTy7z69x4bySOV/7s9GBXdnAp8TR8prxpdVHe/vEyJZmgH+hc8Otz8e677dTPntVxDUBvA7o7eopYgZhPLu0u7tTHn+mmRDC4t8DT36wY+MMIOdV9lnR0nhk3NTd4B0EAlJYgkYbOxRHnWeY/SpTS1J4jIYnDy3TXzjjEQqgIPphSVe+nDmpDztL1K5cRFfReVpI++Ii3ea8Z5WWWQI6ksqFFZFRtuOygCyhUjwdXEETAJroNbLQvjkxzjvaIQXiJO9kBWg7HT7dOWnmvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH3PR11MB8237.namprd11.prod.outlook.com (2603:10b6:610:154::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 14:57:56 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::f76e:7b88:5465:5f5f]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::f76e:7b88:5465:5f5f%7]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 14:57:55 +0000
Date: Thu, 11 May 2023 14:57:13 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Fix unlocked access of the
 vma::rebind_link
Message-ID: <ZF0CSVdc5VDpnhaG@DUT025-TGLU.fm.intel.com>
References: <20230510141932.413348-1-thomas.hellstrom@linux.intel.com>
 <20230510141932.413348-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230510141932.413348-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0102.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::43) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH3PR11MB8237:EE_
X-MS-Office365-Filtering-Correlation-Id: 927d7da5-853a-4194-c0b2-08db52301a1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vnrt3SGFliQH4/ACx/dm9yrcgBQ7orliLe3wBf2E48RRW3mAtnN4Vw2qCAigiNCZrpe4EMJw7jFnIyHvmE30mdO8ST0470ZFWt2fCekQ0ratbWfujl6y8QrqJJjzVSiFrKr7GmWJS/+IX3hULYzlHyE9oyHSou96PbTIqbATO4f23OCimyqHdlp3/D1/rvIgTbcqJL5K2vRynvrplsdIJnkE9gh7rhvtPZfl7JBQPV2jz6e6sNL26UzI4Df/9Aa3/2SU8Y0pag0h2Wi37EAbyBbo3FMixVW+gGPPryBNOEi2XiSTJq180fsvKPxUN93II6NaJaQLzh2o7JlVgBV7VuUA5xysPU1d6PsNtntJbcXO3FRu067cHVzjGgyvdFHQqEnIPW1JIPlK0m5USNnkRQvEmqBEm76Q7c/sgl19WPq9/30Rk4L0wxQuR/E4IpisIu71lNuoiDR1dldrhU0E/OEVmGnmqruXcp1MaGvW/5PhQ1fhFeT91SXHlJUmYjwmPop17bmZeOQvqIc16F35D9pidz3OEEqzjvwCimGwRE4Bt9a9kkruB9KSeKcvROrg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(66476007)(66556008)(478600001)(86362001)(66946007)(41300700001)(6666004)(6486002)(4326008)(6916009)(8676002)(8936002)(38100700002)(82960400001)(5660300002)(83380400001)(44832011)(2906002)(316002)(186003)(26005)(6512007)(6506007)(66574015);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NXlzdV8cFN/kTcL4KHKQnu6aGn52qCq2AFigsZZtksoPJDsfvm0aRKAp7I?=
 =?iso-8859-1?Q?Vuwsq7JtjcJdEn8VkirPCKc/fQM7/7lVk/rNaAuVIKUSfCv4uz9Oy1iJmu?=
 =?iso-8859-1?Q?KDQ4qGoBolKhnh99UCkcCvl5EcIYLvHSsfLOPWuyq/SvI6c34kp+PV1yTL?=
 =?iso-8859-1?Q?s4X6o7SBLQeIG+jE8uqH8TvsExnOVrcUlKaHZxyzhs4HgXnd8Rl1ScZ3l2?=
 =?iso-8859-1?Q?b/E399i487a/YfH6/hQtgO29pco/bQC55tDL54mCYKs+yV8mxqbndEYDMq?=
 =?iso-8859-1?Q?CNYcEVvxplGaG1bVRdxop0F7YkcNV/XMPGrpF8Ax3MUxJLBW1L+x0m9H8I?=
 =?iso-8859-1?Q?PYsYHNLJBnoSwTvy/oaVzKLrjz+W0A28RTcfBrp/AqnWH5sEZkQIHLz4QE?=
 =?iso-8859-1?Q?9TD0nCd/+o0dqx5zzg52OGjv28zN3fIRUT/TOS8Rp9rXdqbCFjQraoTY9e?=
 =?iso-8859-1?Q?dEOtUpYrw72wcEWbh6B121sQjAuxQgB9TMwOdpHycnqO8zBJa/jIOJXGt0?=
 =?iso-8859-1?Q?TEg4HaPc6c3E3Ww4TGLFyPn14A38jJ+37TlYJCukIfm0wIO4moqJBB2VT2?=
 =?iso-8859-1?Q?LeW6Xxkft3Xyxbrcp5INQD2DCkeIW9aFWBgUVDu3wpjeBgXpcDAjVzwWwJ?=
 =?iso-8859-1?Q?jbIBOij9ifRHxVcBDnRQo9+nWIAJeN+PxE+EmzQH/1zvv8lxckkPYNgKIR?=
 =?iso-8859-1?Q?OrzeR6ko/kMx6Ne4FhjYeAyVuSxRfdoIOQGkyDcXzAkRA36mwQWm1xR1U5?=
 =?iso-8859-1?Q?3eZhInmDWXAgtrZYG9SmadS9vSdPst2GTy12exe4LmTu0dfz9b+gPPI/fR?=
 =?iso-8859-1?Q?IaFO491iUrkMZtM4mITCqBCbH9axtZalSD/oNBrQ4Oq7wEh/Px68e2gn2K?=
 =?iso-8859-1?Q?WMx1SQANwUDIU7u1Gjm6JyrVGv04VbQXZzdaS6CKkCSrIir0+kDIIK+lee?=
 =?iso-8859-1?Q?TM5dGmhhuYDkFI8mYgy4XEjYwdA7tG/q42YXIf86vxHx4GYRS0nfcRBqUG?=
 =?iso-8859-1?Q?dqFsZNvEMIZg8dg6ZCfrbcYlqXiCo5YQmZMa7xKBDlUnaeCKor4Xu+9z4c?=
 =?iso-8859-1?Q?mlYyfUrRTihR/OFpQxFjTHTAtdmkLh+e0YehGfgwvxemQDOJzfqwQVRhgP?=
 =?iso-8859-1?Q?kt92IlwfW6B4q4BkSA+6fJ9hylacjpRuA1qemJ/y9Vnf3ivDhjc3lQKm0I?=
 =?iso-8859-1?Q?gmeughSxuDT26U884KyK3lohIl1kAkUay7Bpnta7Nb4ScFyYlUVfgRArTe?=
 =?iso-8859-1?Q?Mb5xRPQjjHVKTXPoKRROjmYMd/fglH/tk5wA4C4O5bc1pJJtMIzGFBPJuE?=
 =?iso-8859-1?Q?P0myML+8Dht2CjXM4sH19iNrk6xRNyRsK0C51gUL51VPxvOkSeyyc/4Dli?=
 =?iso-8859-1?Q?1t5X084dS50UJAnP0CBvubbcNZUeb26ypsI4sbzAhSaX57J0dQam/GAyfL?=
 =?iso-8859-1?Q?3eE9CNEg4vZiEUSr9LMrqvXL12Sg7HGiU/xhQs/vIUdm7nBqsHzNUpTzJw?=
 =?iso-8859-1?Q?oaP2EANhIwsgD++upiUSkX2ENNmlx4SKSTcjUi4+y2sMvDWp6v9twLeNvt?=
 =?iso-8859-1?Q?N4K//RYY1eyUtwtJAQPWnSiL0bHD/ewhv/GkR54Nqjy7AbeJqHAY4HfXhY?=
 =?iso-8859-1?Q?OJ8uU1ALisSafXiNtne1sgJmxdDKNJVbDmX0Z/oPMkUpWciMBpKA9gdQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 927d7da5-853a-4194-c0b2-08db52301a1c
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 14:57:55.8313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EmliNnz6DaAj0watzrLfrmKIQsbUccmLfARKYC+zWcraJd3Tm3mFDn5iKopPqPghBma1n1Ipa2TSlONWAQIUeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8237
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 10, 2023 at 04:19:31PM +0200, Thomas Hellström wrote:
> the vma::rebind_link is protected by the vm's resv, but we was
> modifying it without. Fix this by use the vma::userptr_link instead
> for the tmp_evict list. The vma::userptr_link is protected by the
> vm lock.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 0a4becdf4675..5f93d78c2e58 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -764,8 +764,7 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>  		if (err < 0)
>  			goto out_err;
>  
> -		list_del_init(&vma->userptr_link);
> -		list_move_tail(&vma->rebind_link, &tmp_evict);
> +		list_move_tail(&vma->userptr_link, &tmp_evict);
>  	}
>  
>  	/* Take lock and move to rebind_list for rebinding. */
> @@ -773,16 +772,17 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>  	if (err)
>  		goto out_err;
>  
> -	list_splice_tail(&tmp_evict, &vm->rebind_list);
> +	list_for_each_entry_safe(vma, next, &tmp_evict, userptr_link) {
> +		list_del_init(&vma->userptr_link);
> +		list_move_tail(&vma->rebind_link, &vm->rebind_list);
> +	}
> +
>  	dma_resv_unlock(&vm->resv);
>  
>  	return 0;
>  
>  out_err:
> -	list_for_each_entry_safe(vma, next, &tmp_evict, rebind_link) {
> -		list_del_init(&vma->rebind_link);
> -		list_add_tail(&vma->userptr_link, &vm->userptr.repin_list);
> -	}
> +	list_splice_tail(&tmp_evict, &vm->userptr.repin_list);
>  
>  	return err;
>  }
> -- 
> 2.39.2
> 
