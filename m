Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13879AD556
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 22:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363E610E859;
	Wed, 23 Oct 2024 20:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HgMgLFr1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469EE10E859;
 Wed, 23 Oct 2024 20:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729714296; x=1761250296;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xD0MOMePHfx2blUxJwxL/6/57jE5FG/B7w5FZb0omAs=;
 b=HgMgLFr1rUR3DtJDytZ9giE+92F5QDNoJziu/zxZhNzO5KM05GJeGAj7
 KD+wpU01nYBMiT+flNynOJU+X/p4bNvf5SRtlt8glxbpInCu3cNHz0jxi
 McexY4DkvAkk+1b4U0Cy9eFP2BbW6IWKairU51T8Fa1RcBGRhpm345uvn
 HO6khp2Eo2QLXTV8sW4Om8ZV1ODavoAy+a5cPUVxRkFp5FN9ic8B2HkhW
 /xe7KpzBWJWHM9NPDi4h1kZD5XUiarByv9NSAvMaLuZIqlsziIIafKNpv
 FIeRkqglVXi9puvcA/kgxAx8xiQxwKf04mr6SXQ3s8lZqvc11guvasnSS Q==;
X-CSE-ConnectionGUID: wt3PRJ1eTVOO84ChmL5TWg==
X-CSE-MsgGUID: pObe5AeqQp21qSXCAyx8gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29486276"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29486276"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 13:11:36 -0700
X-CSE-ConnectionGUID: zXSAucJeTxqG4IfyPhljcg==
X-CSE-MsgGUID: E4mxY9XjS96AEL9lCTyJbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="84961370"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 13:11:34 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 13:11:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 13:11:34 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 13:11:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iaJJjU6wUtOWA8Fr4tLAgW+UAKTQ3wG/9HYllnNqflft/lDn7hEFIZYd78tvMTES2aQ5gYf+gIv8b5UYZULlZSWwzHC4q476dvfI9SwqMxP/ZviXwrg+5mByh1Y9muPLvKYptUKnof1HBaM44Q3GRCb0D3fu4vbsOhgr6nCgmqpmEtVPy/DmRf1SG3GYjFQNhMd29rQMoS7UH4eHf5zFcfVy6AJVBJKPGQAtCrZKIGf1cUSmk8fmuzp/BGhV4Swckmle9puF/n1Uwin4/UIxg+8RLL+DbUhiOi4lAweUOColESUt20QF2Dsj/0VXFKS41/d5FedJr19QQFH1Yna8ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/Rjg/eu3peaJ3frb/dG4gfc0ZCk6EJIER20m4z4FAI=;
 b=GG7f1Nc1cboJmQ/PwI/M6Ic9ci6dnBvREgxk+KqUkmbAudB8+Tfb7PY8ZiBn+SZR2fdkJQVV8XDm+9Tz2Po/LKG4jG6PLHDWuSi8qwS0k9x4YNTvClmJPVLztRHMm6aqrNYhshRdnV0ZL7euQJIqL70EjVemXXwVhrwTgvUQURlLzbvk/VmCurzpbDQS20fQIWGx0kP7WRNtfRjCtjeklzAV3yEDkiC1k24Zp7+7pDLpDRbic0KcHFoIdSB29IvT4i9HCVlSQs2b7tcwS9c1LKakk7P3ig463LKnkDko++oK//VaSP7S1qfQBzHwWTxKXZ6oxEQFMFGVeqY18755rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB5957.namprd11.prod.outlook.com (2603:10b6:510:1e0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 20:11:31 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8069.020; Wed, 23 Oct 2024
 20:11:31 +0000
Date: Wed, 23 Oct 2024 16:11:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Everest K.C. <everestkc@everestkc.com.np>
CC: <lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <skhan@linuxfoundation.org>, <dan.carpenter@linaro.org>,
 <michal.wajdeczko@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <kernel-janitors@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V4] drm/xe/guc: Fix dereference before NULL check
Message-ID: <ZxlYbVOLPQv-oWrv@intel.com>
References: <20241010165801.3913-1-everestkc@everestkc.com.np>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241010165801.3913-1-everestkc@everestkc.com.np>
X-ClientProxiedBy: MW4P223CA0003.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::8) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB5957:EE_
X-MS-Office365-Filtering-Correlation-Id: c4f16b68-7f3b-4b8f-0dfb-08dcf39ee265
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rcF7fOIUk1YjHD3IY1VAawH6RoL110luDMt3RrUP6JVfmVffEnZHtUKdecaQ?=
 =?us-ascii?Q?Xb+dSH8SoTTSdEnpSszH9KSVYduh3yfKHngzrvEyQcpAnMWQdewJJHJl0QIp?=
 =?us-ascii?Q?k8Upa5HYDTQAV9kpocwpELmrl5INzzxaa/D1TvNGDdSRFqqfCIRKhU6ZB2w7?=
 =?us-ascii?Q?ucc8cJE95tflK1gLFS7vk8aqLWlg/P2LLWM0Ekg/j/CQs95/i9uxfmf5KzDk?=
 =?us-ascii?Q?jb2gSJ0ejaaIXaNd88lrYT4qJnC9HRdtAR7+OqW5giMEwhC3p7YGhZbUR1dU?=
 =?us-ascii?Q?UadA7aBO1qY2yM/Rkwo1zDIFfJZY37G5d5jjHAY8nOpj5DNHqQgh/GFhGwBj?=
 =?us-ascii?Q?ApTJwS9nHWTJ3qZ/CfcH5ESAzLQXne/IzpADW8xV7z3ZRWwDxq5UMrtL4j2f?=
 =?us-ascii?Q?BC/P5Cles7ZtnqdrKUm/wp9XMXsjP8Pje+rU18ELqbG2CGgJSyd5SvIQUXlJ?=
 =?us-ascii?Q?ke/DtUz0NIlDe2k8I/0yDPQQ8/JsCpRhSCPJVhIU1HXAIioYhptRRIKpsSvx?=
 =?us-ascii?Q?+UahM347k1/qsfrktPbRbHZPSh3iQ6Nt15SDvqODzqtvvk/kj9NUHS7vy1my?=
 =?us-ascii?Q?zL1aViNN+R3grXVL0I6PTWWIJl1irBLVLGMGp/AYAuZyFXAZqNCWw2eHI4ws?=
 =?us-ascii?Q?aZ1NANBSW6usBlKjZ0QZcfXgugORW9tN+yRFwBUuSYg8JExo+AmHenveCHgv?=
 =?us-ascii?Q?Z3FufqDj70R8r5s0VNaCVcvqRX3BtNBkItjwYD28qwh3nsZvPHS06TEVUEiT?=
 =?us-ascii?Q?blsCJlyoNvG7rnWypD78wfH0ygJT0GDPWdjhtpZ9fZ7Gn6wp050Lsrj3YVZY?=
 =?us-ascii?Q?rzs9oBMzfro7sbbypH5zzrj/SdJiWtmU1LAsvc6kyVEy3OPyze9dSm4auFUh?=
 =?us-ascii?Q?1X5hLvCn2JDDnA5HDl0r/OtJeD32Xr++mkiYUOiDskirKfo3r5P+K00yQ5l+?=
 =?us-ascii?Q?l3UjYE7v0FgHf3Nhvwv6dCeP+kvpYRS7Q+rOGRl7r88Y8qeCAnRGQRjFia8r?=
 =?us-ascii?Q?lG5W5QnAeJj9Ubck5dFi7FVN4nVR3V1YQfFjgK3JzOLMIX9EtvXEk3P5IJVg?=
 =?us-ascii?Q?g9t8a1Ql0x/nOuttd25XIQitdKfCGG+ZA4SM9wtEuZFQJ78JFALMJ1jEUcpU?=
 =?us-ascii?Q?LE+AJuLxe9O7ndI1zXBEcZWGNxq8+xB/Ncngfb38ZGs9dJwGhEvnRuOWXYKz?=
 =?us-ascii?Q?fTIxzQagqbb+qwl5oD/++4LC7lR4qecbcfeemUU0IDPR9VoU+rG8rEUtBuBy?=
 =?us-ascii?Q?P+JcNGL7h0oOcZkiFuYx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CXetvDhbZbtAaYWKwSNpBGtCmUjaChf4Vg+h2RDFIpL5snrlh5U85bMZsbKw?=
 =?us-ascii?Q?GJEn01q2FAG5qgCw0JOkQvLVKSf2Mt+bM5lVcYy+UBc47p4h/6lp5zawcKtO?=
 =?us-ascii?Q?PTnsHDccAHcwCpCdgOXvTpMFOJB/woKc3C7IRkBfxoG0AlEf0hARCLV/p/uE?=
 =?us-ascii?Q?wFrAGU77olj/lBCgVds9Zu4v1L/FBd/yL7BJdsAyCvmTTKzI5zyaoQxUISmI?=
 =?us-ascii?Q?DB3fAx+rEXgQ171BtzW8FOEY1/c+ITwJsaIaPGHzgfwU1927Xr1cjM8UrrnO?=
 =?us-ascii?Q?bSzBdwPrEgFov9XSwufi5PwU9oVYkT4gl35Arjuh4SGX8FHRZkhzVzKK6Z3y?=
 =?us-ascii?Q?AwEzJASst0bxTlrZAHKiXGPqn89+7emWZ9ZI+nu30UkwbxKOOdNH+uYTxWqb?=
 =?us-ascii?Q?EQT+z3l5m1rR5YqAKLeNeLEZkClspF/Px9DhTa/HO2e2cZN5tIY8dQFfL8W2?=
 =?us-ascii?Q?cTJvrEWMAiIqVRyVO7htbFZiZ+bbqx+S04tZBJzaep20n1+HI+y32YoZlcBZ?=
 =?us-ascii?Q?uNUrDP3PGG6zFcsvEsstYEJjkvfsdCL4fbN46HlrFpT6tcokUa83eW3iG892?=
 =?us-ascii?Q?EhCR9WO/wKL8eXhoVMClPkKiv9Xy090ZefghrY72ChJwmiJw5xukQc+C43lH?=
 =?us-ascii?Q?MrUXbRlHPwYWPqP2F3Hj+krA5sF0etEc+7B0cLMOGW0x87Y/NbtjHtWsF1VA?=
 =?us-ascii?Q?os+0vJEc019V6QfymuVT24B5UbAgGdqAyzGtX76gB6lvKTna6vgZSKS5/JsR?=
 =?us-ascii?Q?/u3YOthtTaINH8XTRgLclFLD69Nqd2gAYHyE05i9VXp6ZdQMOEbRW+04uv3F?=
 =?us-ascii?Q?iZqfHT0UtdWM6Vl4SkAnS3dsRbxtMhdLpTw4LgWIldxp1saouXxJIF8xmfky?=
 =?us-ascii?Q?+y7LS0O0PyR7CkjCZ5lY3WV7F2vMWCCJfZ7HkOuRN33qeQ4HRx4ptTYjk+C+?=
 =?us-ascii?Q?3+ilCeTxXGO4XDd+cn65U2dkCR9q/HZsBP3KyFJlVk+QlDpVR+TQba32X+Xp?=
 =?us-ascii?Q?Vc8eb+0T8CO7WXLdKdqyLeT4exGw/7GNQ0BaMjYEkNurA4WUTuZbKjbb/Uxv?=
 =?us-ascii?Q?AwRfO/fVC+7QCiiiUs0iXaxstzOKLGevSCkCTOhZm6u1kFSBcyqJMMfpQgtM?=
 =?us-ascii?Q?OoWhqcjZc5iSfLY0d4oxk3SFJS3zYOVWc2PE89qVNXdfVb8isxIZkHcJgQDl?=
 =?us-ascii?Q?0lgPJo+rI2ModV+9XziamjFeTB1lJNPTLVBAOKv9sIjUprlbBhT9v/8U84ru?=
 =?us-ascii?Q?YEMTIOElFQy621wwf7BDqRPGdBPjrqp/cTrZ/qg2LT4DFUmy1JkXtVvaAPT2?=
 =?us-ascii?Q?5f+2QlNZfMSX78hpFmmiXda7YXz1dK8vh6wIXcBiSOmGGVyMw89RebTVL+BF?=
 =?us-ascii?Q?AFCML7RzJAaAZZ15ql5loLCACKHg1FNzLmHdsOv5EdxJ/levQD2rsGdjbkuv?=
 =?us-ascii?Q?ovI1bOoeH9mXaPJim0VrbLWMQApOONoEm/SEN1Au6Q6iWXXZCV22ogB9KJlx?=
 =?us-ascii?Q?XhkGBTXUEBjOtchU3xs6PD4VfOWFE5+JstBcrPx01HBM4wB2Oo2olYf+PEF3?=
 =?us-ascii?Q?jDwn5rjygKfEUy2IPchUF16xZ0KZtn0N/LMtLSw6yMBs5QtgStUDtD0ZMbma?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f16b68-7f3b-4b8f-0dfb-08dcf39ee265
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 20:11:31.1885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgrsL888fO3WBr550i7IvTRAzBnaHFpcOcZ6ESHC00zkji1KAjRJ1WKfcSlCOINaKDpm0kPQqdu54l7rgc5SsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5957
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

On Thu, Oct 10, 2024 at 10:57:59AM -0600, Everest K.C. wrote:
> The pointer list->list is dereferenced before the NULL check.
> Fix this by moving the NULL check outside the for loop, so that
> the check is performed before the dereferencing.
> The list->list pointer cannot be NULL so this has no effect on runtime.
> It's just a correctness issue.
> 
> This issue was reported by Coverity Scan.
> https://scan7.scan.coverity.com/#/project-view/51525/11354?selectedIssue=1600335
> 
> Fixes: 0f1fdf559225 ("drm/xe/guc: Save manual engine capture into capture list")
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> V3 -> V4: - Corrected the Fixes tag
>           - Added Reviewed-by tag

For some reason it looks like nor CI nor lore has this v4 version.

could you please resubmit it?

> V2 -> V3: - Changed Null to NULL in the changelog
>           - Corrected typo in the changelong
>           - Added more description to the changelong
> 	  - Fixed the link for Coverity Report
> 	  - Removed the space after the Fixes tag
> V1 -> V2: - Combined the `!list->list` check in preexisting if statement
> 	  - Added Fixes tag 
> 	  - Added the link to the Coverity Scan report 
> 
>  drivers/gpu/drm/xe/xe_guc_capture.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 41262bda20ed..947c3a6d0e5a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1531,7 +1531,7 @@ read_reg_to_node(struct xe_hw_engine *hwe, const struct __guc_mmio_reg_descr_gro
>  {
>  	int i;
>  
> -	if (!list || list->num_regs == 0)
> +	if (!list || !list->list || list->num_regs == 0)
>  		return;
>  
>  	if (!regs)
> @@ -1541,9 +1541,6 @@ read_reg_to_node(struct xe_hw_engine *hwe, const struct __guc_mmio_reg_descr_gro
>  		struct __guc_mmio_reg_descr desc = list->list[i];
>  		u32 value;
>  
> -		if (!list->list)
> -			return;
> -
>  		if (list->type == GUC_STATE_CAPTURE_TYPE_ENGINE_INSTANCE) {
>  			value = xe_hw_engine_mmio_read32(hwe, desc.reg);
>  		} else {
> -- 
> 2.43.0
> 
