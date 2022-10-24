Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C5760B88D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 21:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2274610E78D;
	Mon, 24 Oct 2022 19:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 344E710E787;
 Mon, 24 Oct 2022 19:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666641044; x=1698177044;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ry7QxIab6r6maYx3wgQ1yO5AWpXIjDjX22jzHEtSg6Y=;
 b=d3qThHLhTqESWXZfKWYQ07W1KitkDfVLdRli2XiqiH4T+IFwM5M0PJxy
 Enc8D/I8goPCJ1cOWfrpMSotFzRvIUl8RzPPQmu9z+3zBqdnPysy+pkwZ
 aHT2ItdLmvUft69QfwAff6jrrpFR1N97PqvwwVMmSdBvRVx2RtdjXa0et
 lnmXQ4qms098jDQgsDpeXmd+OBLgAQeklGnUhX3Wdy8tt/tfjt71v55pt
 Yr4MncPNdcfCagmPd5xzGTyV/eap8u8LUzNBv1dnPYp1vr5bUWy76Snsb
 g/U6Hmje+GHzEvRNywxktAoItROqVfL5tz4nQ4ZAWlu8xDrezJvCfcn8o w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="393823453"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; d="scan'208";a="393823453"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 12:50:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="582523229"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; d="scan'208";a="582523229"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 24 Oct 2022 12:50:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 12:50:42 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 12:50:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 24 Oct 2022 12:50:42 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 24 Oct 2022 12:50:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMozpx+9B6xZfG8Tk8UwZ5zgcxTFtxLS73ZShrxZ1Paysjf7A11bCCJH1QSB81QRYk6VkuDclCOG+aR0mGkM6RHbnAzyf7s0pAskZsEeiCpNXbq7dExv1hqHj6SXnOROHHRbFzqSvxkIq7bQeeWw4SWlUHG/S1m5uGdG3rXWqDPhjkNYHJzzdtzGjJn7tk/o3OZZJ8wGO+h/n2wJKZyfEalY3c9TccaDzo5MOTG/oN3iQcEepmrYjQmsvb5KOCyM9wOZCvODRYxgGTa7f7DimkF79LNRtLk0rWXTClx6naNsvihr0GxXgqSSRrxpGgaO6z4932qhBp2ZjdweDuSZ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNg945xbr6+AnfI8e1x+hQ1DypqiFnp3XL5Wg0l2WuA=;
 b=oCydb06kxgm5t6mkM8HPuKzjkzo8RzosZZAX1FrkBud91bVzqM9vc//3uJJRAo+C0NKqtNrD0Nq8o6cTI/ojUAre/PnB8ZBV8YrSwPcdHvbCJT2FC6gGQ1ZgPKDFy7KFqJw+IHMbLmwus5CAdSJdHfISa3btcQfDbfmVwI6uBMetZ1lZYqUOUMQpLgBfN0qdSOsyz0ZaCVsUTgOVJt0XK0cagC2hYQKCVYKJdIwurzj+/GNNpLlEVARR5IQI/oyiX2IWdiapYH4Isde24lowAH5ssrxS2mzwlCRCWLv2qf3AHZYKN3na/Kgc+DhzbWHnrMXawZpcghQuuESSoBXmiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4530.namprd11.prod.outlook.com (2603:10b6:5:2a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Mon, 24 Oct
 2022 19:50:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::29e1:56c3:823b:45d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::29e1:56c3:823b:45d%4]) with mapi id 15.20.5746.023; Mon, 24 Oct 2022
 19:50:40 +0000
Date: Mon, 24 Oct 2022 15:50:36 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 5/5] drm/i915/mtl: C6 residency and C state type for MTL
 SAMedia
Message-ID: <Y1bsjGJeLmHdZeFU@intel.com>
References: <20221024191313.3840311-1-ashutosh.dixit@intel.com>
 <20221024191313.3840311-6-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221024191313.3840311-6-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4530:EE_
X-MS-Office365-Filtering-Correlation-Id: 1461cb99-0248-4b76-552f-08dab5f90774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cMzt/ccugJUMKsU6iXbmdzV2JXapHaGbUT15saME9k9BnOzBCrsCszBNmOf3Zqa6OWyg6UaKBEa436+1zGh1l/PJhTiOR7PYye6D2AVgFWJTKTyUNxUm1YZ2Ga5oGlDCPgnLyOdb0wELMiro/RDzstU5xBxSwEo25ZmzvroYJ1FNsbpQjqU9EdGuHYef3+j68A/Z+I1rr4Ih+JpJnE6dPRNwtCXWqDgbwOEzSEsPbQNLL1gMyPjScvJzGXoO5ZcS6d/rF3wbASDjAgQERTh2B52uf1bU+7doiTT7n/x5PlI1iUF2ytE3FOSpkvLgfpUcfAFV4vchD/yqZ7q1VBuGNtAsP4BjcWH59v0ZtPddLSnwxv/QJ33HO8HUpqjrSSbmQ/+uEkyQyzzHi+Dtxfq+qOUF2fu9xtbJenEh5xB8ieth20txtCvU4Gs7CDO5HzDOrEaC27F9UwMQgvjlszSiHFVN8MB2kb0mQZ9mmcjd824c+w7GGFMDF3Qmns28QaQNz/RqO6ehcn8Wz2xDF3T8P9JOncMXMFIf9SS3kPORyGHFqjgNzsBNHJcYr3I4Rplza5Tv/5kKcQ7oAqJT60vdur+yiFYbP/X5N5qniBIcX+bHdKRYKbPJAL35V1HLYmzv6rLiy7faBh2Dc06WLPjYWMRSNj9vfuOdvmk7dwR2W8WK7pL8aEYq6HZRV8ZdiQcpUfoq8DAtSm89WGz3LN2e2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(136003)(366004)(346002)(39860400002)(451199015)(4326008)(66946007)(26005)(66476007)(8936002)(66556008)(2616005)(86362001)(478600001)(6486002)(6862004)(186003)(450100002)(6666004)(2906002)(5660300002)(83380400001)(36756003)(6512007)(107886003)(6506007)(6636002)(37006003)(44832011)(41300700001)(8676002)(54906003)(316002)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q6Zh+Dw8Uv+/Izf8rH/xKFAqnbqEt9AKct6NvQzyJoA3LDQPh30fPqxAgL+B?=
 =?us-ascii?Q?B8swr1w+iTRi/WEiRWrI2dWOTXmDVHN7aEgQRDe94WUoo3hJwenn123qxOrA?=
 =?us-ascii?Q?uDRS1KPD+/B2+noo+ESY3Ni6kANJEkeUmMPcM32QL5LZesjZ6qvCG4Gz1cbL?=
 =?us-ascii?Q?1qizHEVKr1uRVoxqcTYFI+gU7NxmaM0eaNid9NzrsmDldIJfKBlJioFYBroz?=
 =?us-ascii?Q?NF3DSVHwZO9WebHXn9d/3wHTsE4wNFSfqioRlpdgdmyH60ZnYUJfoPLLgqQ0?=
 =?us-ascii?Q?WglDBEj+bnBThPy0Brr2+8i0oT9dYUmHEHaDhhY6a2Cg88snGI+JPGEYbKXV?=
 =?us-ascii?Q?SlYK7f3pn7R/Ri4Qw/jnbwAAbd4VJDU07u9jvE771YB0mWmAOn3A3Or2+YKB?=
 =?us-ascii?Q?MsEaf2BiNAFBsPY4OjbG4+NT5CmlH2wFwp4QqhOghRaEWfVYmQ4QnkkStLLE?=
 =?us-ascii?Q?q98llUl6aHMvgXu3zr7DsTpnUwDd647PTpEoGM21qzPdm2ekXwr7qcLCfcrz?=
 =?us-ascii?Q?u7DjkmNk/LFzxMkaAT6SjyxTo8ENyNMLl6PaOXoEDZKwCA7FAqcq7OAZVqck?=
 =?us-ascii?Q?pb7MgRh5pi31aG8DDZTd1EpJ+pwNWiuyUTmCgCrxoYLN666Hco5wYQUbhrgM?=
 =?us-ascii?Q?3+oQLwgFqu+nn66bo+/30/mVMGlFsXVezuPhZ0s5LY1jcKH5sYTvgN/YFIEs?=
 =?us-ascii?Q?Sm4DLsT42uncVNBVqDwhikabEnywARiN4e/LFV6F8eddwagvgRB0wspKqIM1?=
 =?us-ascii?Q?EGnKnMwnG9zbiQftrt4zFnHeJ5Ymv5KRk63K9KDkfyYK3lSwr11fMJvONlaX?=
 =?us-ascii?Q?elGz086eEHppsMD2lLW6T1CBpsWLGRGDMsjAEcaRIfr0xXqXDJoL3VKx23Ew?=
 =?us-ascii?Q?3yyqm8SYWPRRBLBrg7qlwnPI1GxiwlUZotgPbD+v3gvIer0bFGQ7hA/oJQHj?=
 =?us-ascii?Q?jQe/jhyJCexOdgU4wF3qjjQYGAIgCmDa31EBSMxcXusSW7qmDTeE2hqTS0zi?=
 =?us-ascii?Q?N9pPMw+drCmB1eGMOkKw7Sv9NSDaGan5k8ZO7RHcmTn/wHTTqc+Cz6znCIwc?=
 =?us-ascii?Q?h76IIPuMHytjRceLHdj+lUfbu0NPEr9jx2VdsB9xQp2cRP9qcJ+LqkH0pdXR?=
 =?us-ascii?Q?FeTtnxY5ZFaeSJ/lbv3juKVsFH9oHqKhDkGP/eXzVjEYXmCI5u30RuIKJ7v0?=
 =?us-ascii?Q?/AVgxEBRIW3vuqU5naeUwkzx0urWnXZeDdwtrvcdBpKMWpoND/iieIhZ3NtV?=
 =?us-ascii?Q?36E523Uqz2N/bEXoRkvn5Tz41pt6kvYvzLyXUUaXBdzTwshx8gcL/cFTVB5T?=
 =?us-ascii?Q?o8Eojeu4Z//C8WS7rj1u18SQaiGjJCfmBaXy/627rfkpZN2yXl/B4Uhlb9Vs?=
 =?us-ascii?Q?EIIpScgXH/0KA2ImTUn5eJx2g90B5Izy3Wq2mvikXuFHBB75SvvWjYgu4o+L?=
 =?us-ascii?Q?LJniXxfXztpbRrMaXxL3YMwgwbmf4nj9s4flskSIAJoIxyuvyy5N4rp0wJG2?=
 =?us-ascii?Q?yifLQhrrCLEd3gdfJtlcFkvDjaOVB7ylJlTQ6SjPlFG5wRBqM2lZYv445Yv4?=
 =?us-ascii?Q?pmv9RPnabXDjdaPbJRg2jkqDwLLGmOQXQTEUy/zBHgQ8KnCi7qyuMKJPfZSC?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1461cb99-0248-4b76-552f-08dab5f90774
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 19:50:40.4926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: szQ+vKr/x/NOTVr/VlfFBFBc3axHk3eyGZ5cL+voSf/JfaFqq8rXQahqhE2EFh9IHGiaHndpLl2lLWSQ7Wn8BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4530
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>, intel-gfx@lists.freedesktop.org,
 Badal Nilawar <badal.nilawar@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 24, 2022 at 12:13:13PM -0700, Ashutosh Dixit wrote:
> From: Badal Nilawar <badal.nilawar@intel.com>
> 
> Add support for C6 residency and C state type for MTL SAMedia. Also add
> mtl_drpc.
> 
> v2: Fixed review comments (Ashutosh)
> v3: Sort registers and fix whitespace errors in intel_gt_regs.h (Matt R)
>     Remove MTL_CC_SHIFT (Ashutosh)
>     Adapt to RC6 residency register code refactor (Jani N)
> v4: Move MTL branch to top in drpc_show
> v5: Use FORCEWAKE_MT identical to gen6_drpc (Ashutosh)
> v6: Add MISSING_CASE for gt_core_status switch statement (Rodrigo)
>     Change state name for MTL_CC0 to C0 (from "on") (Rodrigo)
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 59 ++++++++++++++++++-
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  5 ++
>  drivers/gpu/drm/i915/gt/intel_rc6.c           | 17 ++++--
>  3 files changed, 76 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> index 5d6b346831393..522049f053e8a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> @@ -256,6 +256,61 @@ static int ilk_drpc(struct seq_file *m)
>  	return 0;
>  }
>  
> +static int mtl_drpc(struct seq_file *m)
> +{
> +	struct intel_gt *gt = m->private;
> +	struct intel_uncore *uncore = gt->uncore;
> +	u32 gt_core_status, rcctl1, mt_fwake_req;
> +	u32 mtl_powergate_enable = 0, mtl_powergate_status = 0;
> +
> +	mt_fwake_req = intel_uncore_read_fw(uncore, FORCEWAKE_MT);
> +	gt_core_status = intel_uncore_read(uncore, MTL_MIRROR_TARGET_WP1);
> +
> +	rcctl1 = intel_uncore_read(uncore, GEN6_RC_CONTROL);
> +	mtl_powergate_enable = intel_uncore_read(uncore, GEN9_PG_ENABLE);
> +	mtl_powergate_status = intel_uncore_read(uncore,
> +						 GEN9_PWRGT_DOMAIN_STATUS);
> +
> +	seq_printf(m, "RC6 Enabled: %s\n",
> +		   str_yes_no(rcctl1 & GEN6_RC_CTL_RC6_ENABLE));
> +	if (gt->type == GT_MEDIA) {
> +		seq_printf(m, "Media Well Gating Enabled: %s\n",
> +			   str_yes_no(mtl_powergate_enable & GEN9_MEDIA_PG_ENABLE));
> +	} else {
> +		seq_printf(m, "Render Well Gating Enabled: %s\n",
> +			   str_yes_no(mtl_powergate_enable & GEN9_RENDER_PG_ENABLE));
> +	}
> +
> +	seq_puts(m, "Current RC state: ");
> +	switch (REG_FIELD_GET(MTL_CC_MASK, gt_core_status)) {
> +	case MTL_CC0:
> +		seq_puts(m, "C0\n");

RC0, then

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> +		break;
> +	case MTL_CC6:
> +		seq_puts(m, "RC6\n");
> +		break;
> +	default:
> +		MISSING_CASE(REG_FIELD_GET(MTL_CC_MASK, gt_core_status));
> +		seq_puts(m, "Unknown\n");
> +		break;
> +	}
> +
> +	seq_printf(m, "Multi-threaded Forcewake Request: 0x%x\n", mt_fwake_req);
> +	if (gt->type == GT_MEDIA)
> +		seq_printf(m, "Media Power Well: %s\n",
> +			   (mtl_powergate_status &
> +			    GEN9_PWRGT_MEDIA_STATUS_MASK) ? "Up" : "Down");
> +	else
> +		seq_printf(m, "Render Power Well: %s\n",
> +			   (mtl_powergate_status &
> +			    GEN9_PWRGT_RENDER_STATUS_MASK) ? "Up" : "Down");
> +
> +	/* Works for both render and media gt's */
> +	intel_rc6_print_residency(m, "RC6 residency since boot:", INTEL_RC6_RES_RC6);
> +
> +	return fw_domains_show(m, NULL);
> +}
> +
>  static int drpc_show(struct seq_file *m, void *unused)
>  {
>  	struct intel_gt *gt = m->private;
> @@ -264,7 +319,9 @@ static int drpc_show(struct seq_file *m, void *unused)
>  	int err = -ENODEV;
>  
>  	with_intel_runtime_pm(gt->uncore->rpm, wakeref) {
> -		if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
> +		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
> +			err = mtl_drpc(m);
> +		else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
>  			err = vlv_drpc(m);
>  		else if (GRAPHICS_VER(i915) >= 6)
>  			err = gen6_drpc(m);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index d8dbd0ac3b064..a0ddaf243593c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -24,6 +24,9 @@
>  /* MTL workpoint reg to get core C state and actual freq of 3D, SAMedia */
>  #define MTL_MIRROR_TARGET_WP1			_MMIO(0xc60)
>  #define   MTL_CAGF_MASK				REG_GENMASK(8, 0)
> +#define   MTL_CC0				0x0
> +#define   MTL_CC6				0x3
> +#define   MTL_CC_MASK				REG_GENMASK(12, 9)
>  
>  /* RPM unit config (Gen8+) */
>  #define RPM_CONFIG0				_MMIO(0xd00)
> @@ -1512,6 +1515,8 @@
>  #define FORCEWAKE_MEDIA_VLV			_MMIO(0x1300b8)
>  #define FORCEWAKE_ACK_MEDIA_VLV			_MMIO(0x1300bc)
>  
> +#define MTL_MEDIA_MC6				_MMIO(0x138048)
> +
>  #define GEN6_GT_THREAD_STATUS_REG		_MMIO(0x13805c)
>  #define   GEN6_GT_THREAD_STATUS_CORE_MASK	0x7
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
> index 6db4e60d5fba5..2ee4051e4d961 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rc6.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
> @@ -553,10 +553,19 @@ static void __intel_rc6_disable(struct intel_rc6 *rc6)
>  
>  static void rc6_res_reg_init(struct intel_rc6 *rc6)
>  {
> -	rc6->res_reg[INTEL_RC6_RES_RC6_LOCKED] = GEN6_GT_GFX_RC6_LOCKED;
> -	rc6->res_reg[INTEL_RC6_RES_RC6] = GEN6_GT_GFX_RC6;
> -	rc6->res_reg[INTEL_RC6_RES_RC6p] = GEN6_GT_GFX_RC6p;
> -	rc6->res_reg[INTEL_RC6_RES_RC6pp] = GEN6_GT_GFX_RC6pp;
> +	memset(rc6->res_reg, INVALID_MMIO_REG.reg, sizeof(rc6->res_reg));
> +
> +	switch (rc6_to_gt(rc6)->type) {
> +	case GT_MEDIA:
> +		rc6->res_reg[INTEL_RC6_RES_RC6] = MTL_MEDIA_MC6;
> +		break;
> +	default:
> +		rc6->res_reg[INTEL_RC6_RES_RC6_LOCKED] = GEN6_GT_GFX_RC6_LOCKED;
> +		rc6->res_reg[INTEL_RC6_RES_RC6] = GEN6_GT_GFX_RC6;
> +		rc6->res_reg[INTEL_RC6_RES_RC6p] = GEN6_GT_GFX_RC6p;
> +		rc6->res_reg[INTEL_RC6_RES_RC6pp] = GEN6_GT_GFX_RC6pp;
> +		break;
> +	}
>  }
>  
>  void intel_rc6_init(struct intel_rc6 *rc6)
> -- 
> 2.38.0
> 
