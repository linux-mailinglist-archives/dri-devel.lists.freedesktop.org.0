Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9625679D16
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 16:13:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE73F10E6A6;
	Tue, 24 Jan 2023 15:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542F010E6A6;
 Tue, 24 Jan 2023 15:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674573206; x=1706109206;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iJTEorSh32hBVGMn0tnrZPf5bBa44uiIQGraPUf0Bew=;
 b=JzTGOcHw0jS1aWQMZIGuOisSfziEQKm+4R4dFxzpard3MSC4NBPlX2mj
 s0XDxdLVf2nDJamw2kcMSp4NhOwXoEjLFqs+OvnrhRqsu00qGEuNkgj7P
 kdq6mhHG7XbaosaYGyTTtwzguZZ7p8US6KPgX1ySH0YOZs+/hhzvuMFpL
 em5rPe4qZ88eGN/03fJdqFO2TWPHyt6xnrpBkgwyvafcbxoLVEuMh1ndR
 6JwGZdRszcTIQ8RJRcmh1axkMI4IqA3sswMbrro7FVEZzgeaI9FHrdW1S
 0NzZImKA3GZPbN7NMPIJPpWjS/ot6QBT+KVH+1Opq3ApvwiWHb8j5Zfsi g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="306668086"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="306668086"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 07:10:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="907520982"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="907520982"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 24 Jan 2023 07:10:40 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 24 Jan 2023 07:10:40 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 24 Jan 2023 07:10:40 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 24 Jan 2023 07:10:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0G5xz/cIedMr0YAYBqzcK0DIkJtKV0sSjLxI2m34AG5htwyf/Pa4H4rg9aoEYVKEm8urediSIT6Hswvo8NEUgTyBAr9ZAhYDi7C/+9+s1NBdCBeS0bnroc0Qycp9U6LxufznXB4FLzEvwNYPLsAnW1VwVKiruwv/0pDtxNfU/cYAdzzfAq9igMh821vT0n67K1ID5upfRrUP0g19RjIN7g8i9Rv1UlSe+QSBA5n2iClmEc0mtuZrqKjC9fbrx5mgJI9/81NGKBqNWQissBTXFQnctFX39GLT8Ho+pI+e2RtyPQCVJFH9P0JgfX12EChjxcfkk6eRHI5I4ch/Vy94g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAxR+uIIhIu1kQfqfcUfrXtRi6DfdzJPxjBEQI+kudY=;
 b=YyO0IKeR7rtCD7s8DZce6vFKfNRYAJXtDKH1FHkGjJzEJ5PwpLP60cadm/qdC/dyIJlffyPtdlDi1p3eXov1oivasPBLxzGUfR3W0SmGkh9BTTUHXVpTBnVTZ4P4Dk4TAxWPpxNXz7yxUyBlOHXQKMnzkwBpuQjIsFb8Ohi/V5FJ8cxKjItl+NNr9cFj6ITICaLgGTV+iSEhyQ3vOinHtVMgj5mIIEeIfyE1KyQeB3l/RZmXwN7wXXaIvimdz0g0BBROsh3IA25hcC2vzRdI4JT1vLGfxZkE2gJpKulhGhEAIzyj7gk0YAt/inyYX55b+j9LG3qzxhJNgSNfk8Ycew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 15:10:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 15:10:37 +0000
Date: Tue, 24 Jan 2023 10:10:31 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v6 2/6] drm/i915/pxp: add device link between i915 and
 mei_pxp
Message-ID: <Y8/056lQW0dJpnYV@intel.com>
References: <20230124053150.3543928-1-alan.previn.teres.alexis@intel.com>
 <20230124053150.3543928-3-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230124053150.3543928-3-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: SJ0PR03CA0067.namprd03.prod.outlook.com
 (2603:10b6:a03:331::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4806:EE_
X-MS-Office365-Filtering-Correlation-Id: c7aef8b0-ec17-465c-5b53-08dafe1d25df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 78lqz3LPzzUG7FbI4mN8bWOJMVafu+QmmRcykTtjdd+BWlPi+JCoL3QAE2Vp6clu6pBpGW1btWseRgPUS5DjEP9M3vnC6A7vrJo9DDFnXaFwPXg16J8Xge6D7EaVd78fsXOlobha+gUvtAlD9KKLkVMJyDyj17RMnft/0mJjS+AxM0vzVklARr9tSAwR//FB/vUvtA/4LHhft5f3mTvfyGK4r4wQ/8dYZr4ZAQcpOS4bZz9pzWSfwIu2q/G8wG+MLIVIJ9eSikLXYcZScRlDpOXX9j9ViSVnnNbViZd9R6EfWTPNBH3NtbEw9c7lEAIw2dDOo4Z4+YO0QCZQ7SJw2/fLa+zraVcW415KwMykRBeLiV/LB9I5QDLxTdi18LHbOlwjoNiMGpb8qI08H5ruBl/qiSpOJ+YJoYN5PFkVgTua9xIfp5QJgsHCUHtvjAjZ6n2Wbo7N0liBZYx+ofsO6k+kCmvECrqNXM+N1VK9Atiq7sulWqgoFDiCUxYh6920cQSM3/lKZZbVg3yNAIj1mUrqjuNvUHqTRUu+8Nz9zy1XuIpxGYIZuFxVfTSQV7fX0TLh/CBRxZQYg9uWOudWrtyPXU8I5NTy9pNlAxtbmHDIfBFmHk7oG6rga/+HphMHyi41M4VIFbFfbiZ+u+QEVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199015)(2616005)(38100700002)(2906002)(82960400001)(41300700001)(6862004)(8936002)(44832011)(5660300002)(6636002)(8676002)(6506007)(54906003)(37006003)(316002)(4326008)(36756003)(83380400001)(66476007)(86362001)(66556008)(66946007)(478600001)(6486002)(107886003)(6666004)(26005)(186003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BRec1gKj2W9DRcLYkGzKakKjoy82M4+FX+mJicRRpgl/O/8Iz4yPf0autWuw?=
 =?us-ascii?Q?uL6fCCyrd//SQVhndkEzJCR+3HiJ2LYCTPy97+VCd6irQMC+UymRnVAlaqS4?=
 =?us-ascii?Q?Rzkb4JVpUVZMW3uun1TVVU447Fzg6qFdFSoMD7lS/Im0Lud4Tdn0d12CXTMt?=
 =?us-ascii?Q?u7I8M0fu6UB1cjyyeD+VNkmBCybr9POIA9khXn4NHpQ7H2k85jFGhKsJkWdB?=
 =?us-ascii?Q?wDoU8xFhDyQv9wbQ3MnlayapqJ3usLDDz2n4xi+BW8jJpRDGVJe+KU/itDnx?=
 =?us-ascii?Q?ImgbeAYIP8v8Eo+VPcwgpq8fQJzcu8FshC0DPGuri0vVoGvv2yQ4P2ZwzrVB?=
 =?us-ascii?Q?8vIKaO+c7ug2gLaMSPtCOWqg47loIEz3jPA+7MeczaAfKFFZ5prQ+2fA2zL0?=
 =?us-ascii?Q?QPgOF5P2TBNfLbKFbPOO14TGPnlcK4yEZpiMIioPukwED5CWKdtPmfWYUFuO?=
 =?us-ascii?Q?OAWl6rqRM0bgvjoIWqTCRd+uvQJk9uoaniSVaBvaWuHgif+4LB6qmVeW0pK/?=
 =?us-ascii?Q?fHCWx5ofbMIyHdCsJXlBGtpQWMJnMmnn/cXP9MruMSCIY0l6Tv+Lpv7RzV41?=
 =?us-ascii?Q?Z5+cBJmgIIRR6G843mbh9lw0LKNMgNbai64x0vFdGb46eg9k21oTZKXczbD9?=
 =?us-ascii?Q?uZQofP5P20Tv+6dj4Qtkr74Q4ytvsKKqO1aPKZ8mTyLm07J2nvvsrxcJMCv0?=
 =?us-ascii?Q?W88joHVxXmf2feByDCKnPzJIsyX8F2rgKXqqqE20/P9UKSnP0iroLul7Makl?=
 =?us-ascii?Q?8lJnHzwMvM4aHxAH1ovhNYsssFFWE0FHyQCBDGRF57nhN3ye6CqEp/Glcaov?=
 =?us-ascii?Q?pyicPnGPXtOEj/r/2t/e5sYv0UVKppI3RQ3YRKV5MwzaOVsJVAotFUCybtw0?=
 =?us-ascii?Q?DHE52DODE9LCjKqEimhGFX3wn1dPvyEUfCVmRCLA5yoQuD8oDKsZw6HeOanJ?=
 =?us-ascii?Q?Niwv/W3PPYxrJCRmOD02MZHXgXAZF4XjtI86W6dcM3hUaOEkocDe/TrW1W3L?=
 =?us-ascii?Q?3cej5r9DhFR8JAn9iX/0rl1X7Y96S9RuN6JI4FaPrW09ZS973GBBIqut0XWH?=
 =?us-ascii?Q?um+gmKx4luRCOO05oMCOXr7+B1R/BQPTkNV7UMSS/viRfrcFRqWkN35VvSnb?=
 =?us-ascii?Q?hezG6wJMKJQfFeC0gHJB5hL4OmguKQ9MHtCasjyluMsRZIKC4jjjW3Szr8Rt?=
 =?us-ascii?Q?EBKkPWq4HQlOX0hnuIf25TmcEL5L/NHbJErmCHsiZxr2Oc2la70aSF8+JU4R?=
 =?us-ascii?Q?Z0at2tfnDlLfDk7G8mIVpqle0Hk9A6gJQTieiBA8yMRGnu92mS63sbglm3OM?=
 =?us-ascii?Q?amzV2YsMy7U99iAY1WQ/0tdhQVBznC1qE/0UUODI+GlqQujT43Cok7Csj//V?=
 =?us-ascii?Q?XkpwsAySGIcEkVFC2g6Ekk0R26gp9eGgC4gGsY1DQRJU9gZPoDGcmttjY54v?=
 =?us-ascii?Q?ZFV/VNffMT4CwNWQrmuksN8rcdcTxnyYuiekKYH5lOB4WoZvaiyaV7dyYMdG?=
 =?us-ascii?Q?bpIaUkpfzUAmONCfMDGSzVJ9nBf3+pW4gaDFTWs8YtcpUYSYcq6mJXtAjDoP?=
 =?us-ascii?Q?+yACVqyBGmNSZYFM1Bcy/HXNkr78LZeU/yOgg8CcKUq9X3aSMlh8UXWEZBkS?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7aef8b0-ec17-465c-5b53-08dafe1d25df
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 15:10:37.3622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WlAqtRARigPSl69EoXW2kGbfgvmJNokPGnAcqCyZXETRzyrTyCizAwHkShARvFXDjcTHZ67omIcjT/FD9pTZVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4806
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, Vivi@intel.com,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Juston Li <justonli@chromium.org>, Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 23, 2023 at 09:31:46PM -0800, Alan Previn wrote:
> From: Alexander Usyskin <alexander.usyskin@intel.com>
> 
> Add device link with i915 as consumer and mei_pxp as supplier
> to ensure proper ordering of power flows.
> 
> V2: condition on absence of heci_pxp to filter out DG
> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/gpu/drm/i915/pxp/intel_pxp_tee.c   | 11 +++++++++++
>  drivers/gpu/drm/i915/pxp/intel_pxp_types.h |  6 ++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> index 73aa8015f828..cd5b86216506 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> @@ -127,6 +127,12 @@ static int i915_pxp_tee_component_bind(struct device *i915_kdev,
>  	intel_wakeref_t wakeref;
>  	int ret = 0;
>  
> +	if (!HAS_HECI_PXP(i915)) {
> +		pxp->component_dev_link = device_link_add(i915_kdev, tee_kdev, DL_FLAG_STATELESS);
> +		if (drm_WARN_ON(&i915->drm, !pxp->component_dev_link))
> +			return -ENODEV;
> +	}
> +
>  	mutex_lock(&pxp->tee_mutex);
>  	pxp->pxp_component = data;
>  	pxp->pxp_component->tee_dev = tee_kdev;
> @@ -169,6 +175,11 @@ static void i915_pxp_tee_component_unbind(struct device *i915_kdev,
>  	mutex_lock(&pxp->tee_mutex);
>  	pxp->pxp_component = NULL;
>  	mutex_unlock(&pxp->tee_mutex);
> +
> +	if (pxp->component_dev_link) {
> +		device_link_remove(i915_kdev, tee_kdev);
> +		pxp->component_dev_link = NULL;
> +	}

use the 'del' version instead of the 'remove' one.

if (pxp->dev_link)
	device_link_del(pxp->dev_link);

>  }
>  
>  static const struct component_ops i915_pxp_tee_component_ops = {
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> index 7dc5f08d1583..efd2f3915abe 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> @@ -32,6 +32,12 @@ struct intel_pxp {
>  	 * which are protected by &tee_mutex.
>  	 */
>  	struct i915_pxp_component *pxp_component;
> +
> +	/**
> +	 * @component_dev_link: device link of the pxp-component enforcing i915 as the
> +	 * consumer. This is needed for legacy platform (TGL/ADL) full-feature usage.

No need to add platform information here.

What about something shorter:

/* @dev_link: Enforce module relationship for power management ordering. */

> +	 */
> +	struct device_link *component_dev_link;

What about
     struct device_link *dev_link;

'component' is already part of the pxp struct.

>  	/**
>  	 * @pxp_component_added: track if the pxp component has been added.
>  	 * Set and cleared in tee init and fini functions respectively.
> -- 
> 2.39.0
> 
