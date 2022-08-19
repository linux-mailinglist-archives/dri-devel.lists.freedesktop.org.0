Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7969759A6AE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 21:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B032510E12C;
	Fri, 19 Aug 2022 19:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B2910E11A;
 Fri, 19 Aug 2022 19:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660938402; x=1692474402;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=laQ2r0EURf+wp5gf0tFZDKmSSib10I7X5BaHYkV4rMQ=;
 b=GuA2cH14PZ/IImROj3ZL1s6AMa0JLAA7SdHdzx7ObzigM8q37MeM+yep
 CWTbylNrCydOvAtJjfEi9k1YXsckPkQCu3e6P4giO1EjbyORD4LV5xzq7
 NDIURMeuvjqU9mRu+jxk9C4//hCWiKv1is1oGFlz9FQj0FCUZd3Ds0SUH
 VU2LMVkz/gZJJeoJ7gTXteDWFJ6DeEWINzKqysrAmmMpjKazTBT2u6zK1
 gxT8wWKfvenzkZ6jh3Iaf7pzQ+TPFFwF34u/5UfsU0GE99NEa4S7OKMhp
 R0+G4NxU4L87319ocAs2JgMoIlK//GHr6HBlXcEY+0IGEMSEmarJv4zGt g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="276125097"
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; d="scan'208";a="276125097"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 12:46:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; d="scan'208";a="641366307"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 19 Aug 2022 12:46:41 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 19 Aug 2022 12:46:40 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 19 Aug 2022 12:46:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 19 Aug 2022 12:46:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Fri, 19 Aug 2022 12:46:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XahVWREO7uGM+fQEWnbvKQFriDG95M3wrkCTMEhIYT1z3a2LGzdR1Y8eSvAG5kY4WKlIMjXP22YKZfhcZR0xMklCbi3ZvqK3HoZOAt5PPXL9M24sojXiZenQHjqwCJPOo7tMoAtovSpBw1GJ64AkiuxCQS1V3tgbHHWgRn2Mx8CpBLmd/onUtNBnKkPgl0BtI3QrXVi4JuLjdj7dpjTxf/iGvWp4YzTuwUYEm9Z7Vi2+0bo+t9JUxhMuqk3fg2vxD4l1vmk0gbDDGMyHLJ6NpOjvtnnc3jkGN+fcV90brYe4gXCDR8oK046h8OURYSxVHCqim+HUjOEX9rF2KMaEtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/kXXzBeAsPjDAUhuk5t7s71qEeRoSky1hzK3E6EdME=;
 b=DV7BqFEu5uRUzzC+6AIgsKe3TvHGxjnSMw+MxXEfcG7C0o7Xw5IfydcDPdC/p9HZKCQ4ctcct+J9i/IHtxcwDv+JmZ3mUfhpIbD8JkK39yROhzGYes2oRIMgtdToirgzDqaHJWdzWLQbmV75YeCdXJbmrB4T+jnlbvCgzzh/ywwuhbR7OW6il3StodgvN5S0nL+UZptpjSPm6Ji941//0CrgjE0B7aK/Z0+yi1BO44ijyDCvrEsKZEVF3LI8pyImnmm4M3h+0OPJZ3cs2J5WT+SbYaN9XCHPvXpHUe6ZgatkyDMlCLZvQLjX9gidiN3Ty2WZ+Nzf5GtvKEfJgHrc6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by DM6PR11MB3468.namprd11.prod.outlook.com (2603:10b6:5:5c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Fri, 19 Aug
 2022 19:46:33 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5525.019; Fri, 19 Aug
 2022 19:46:33 +0000
Date: Fri, 19 Aug 2022 12:46:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 21/21] drm/i915/mtl: Do not update GV
 point, mask value
Message-ID: <Yv/olicUB1O3UX5C@mdroper-desk1.amr.corp.intel.com>
References: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
 <20220818234202.451742-22-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220818234202.451742-22-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: SJ0PR13CA0155.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::10) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c128cb7-e08c-43b9-4035-08da821b84f6
X-MS-TrafficTypeDiagnostic: DM6PR11MB3468:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m/ds4Hl7LIcvdd2yxybCGc1gl6zvfWuZg6DZ4p5B7mtfhyak0oS15qOzvjukJoUd1XmFTXviLCrRw7tYOkUitLJOCEA4fmBPV5gC7xHnmXIFiENrQRacet70DtyOylguQtZeVmqy3Jpr0PKyFyk57X+W/IkKOMemPumGZd5jBj9jNpCVkh07RjM62i9eRLzfMz1bDG3pimnJwm7XmpxyP3kOsB6SVJZtni0S4e9pklUKf5gXnT4le0t7p+ZPT9VQU9ff+Hhcge03stldVHAXyh3g+HF3pvlhXo6ruX30tX0CurYbhZYA4nSHxVbU/GQ8sAhA4pzTt7NV9k3E8/GbCB11UtYy3k8fH9JCU57xI4tK4/eHksO18vV6FM68IlU9jq1ruXMClzQqwUR83covGZ+BL3r5o4Gn6dvO8zCxnbP9DeGlCQzONBAyOEz8BrQ5tglEuBtH3Ha5PcaFj+FMmgMeRzMB+an0nWe9Im3V4aPmAFqiKC5Lmq/pRboI6smyStIuU31KEVUyrwdegbadlOzOemsFE6kKEbjqB13BzdlKldUit7iCW6+gYkX0dYgxoksRnmGbPTcrTZB93D0P4lJJGvIeKfVKdkYQMgE12pyZ1GvUnIEUfgoGLmET8b+uN8s3I46q6IEgLCHtifC15ixotUfrEGFLSBGaxnewqB0D0QP65ifxjH99qpUByOckY7+olx9RCAkjd10JBF8Mxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(376002)(136003)(346002)(39860400002)(396003)(26005)(2906002)(316002)(478600001)(5660300002)(66946007)(8676002)(450100002)(66476007)(4326008)(6512007)(66556008)(41300700001)(38100700002)(6486002)(6862004)(15650500001)(8936002)(6636002)(82960400001)(83380400001)(86362001)(186003)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r992wS8Q3UClP7rq2Hl9TpwxgmePx1pyO5kXbTRJYZET+zs1/UfCV08t8MTq?=
 =?us-ascii?Q?U4D0pvS+F+zRY+QCtSiOhmD3SkP0+vQV8En0IVH2mPt1DVLGHVOBE5FS0Ndr?=
 =?us-ascii?Q?yR2NnHZWrmaqNTYWrcBas7MmpvRTMZ+5O5ZjSu5d2AgwF4elMndesma0vIJ7?=
 =?us-ascii?Q?HQZpopl55QdHKEoNK6UWtd7jWaXOCvXIu2pozffxLL7jPlprTBt6IR0+Fh0h?=
 =?us-ascii?Q?gqu1usql5uDJHTXoCetIHqdP8PJo/Z3i/x+WLNIr/lBz8GRANX5XJ/bYcsBN?=
 =?us-ascii?Q?0KQThLvyucUozHJN5wNpnMStmRvYFGAGqIBDTeRNUSive9t9GIHSv1qg1kJX?=
 =?us-ascii?Q?g+oV8BLeZk73jBQMaCQ6f2taq9nE+QoYiT287+g8WkF7vfLir1Q8yt5aVPg+?=
 =?us-ascii?Q?id8lcLWoxrp2RC/u8byUCjYGltZBWeBREXmwi91mcJLlPaNCNhjDpF8V73VK?=
 =?us-ascii?Q?/frFLM4JMBpks1jrcICZjZUKtX4+7ZQaKlch6nI17FoE6f4OBPZVxNLkKSWM?=
 =?us-ascii?Q?IEHpsq0TxDjtNEjnjJvF8uTj39B5x88S3+Art/PGoq5t7vYMKECfGaQr+68Z?=
 =?us-ascii?Q?DIrhsjqGG6/eJg7JKG9ES4jK6Dgzz+IaaKpcfrmbrlxDox2KmL0vE6of2R8h?=
 =?us-ascii?Q?burxQI02Rg3EkywD6H4vadK8F3T8kzfH4SG/UkNqIcQ1eUmTBbOzwV0y8tyn?=
 =?us-ascii?Q?NX4UfIJ1eKYrpm7YoIkmYbbrjc9tUeKKtTfST8FCqKNU5xJhu5vrc7xiFeBu?=
 =?us-ascii?Q?jJ6kZi/kZqrhu/xnLVLfAePjQxkmrJmAwZx6mfwhZoEkH1KtXPCcJPExsVTY?=
 =?us-ascii?Q?FjwrcK2sofl6RHOfnGNH642JvUiSyJog9i6ha98PLWJY4tHUR9KIvMmfAVKt?=
 =?us-ascii?Q?0sMJBBWcXk9hBNUSgUbwg50mxjSvKkInEVMIa7EAaYfE52AQH8Q0XwsSC7i+?=
 =?us-ascii?Q?6wxLOkBVcK2RqneNwglawMT5TIKpAvDfiMHwbCF9RaMPARRQyCobOxRSRdpm?=
 =?us-ascii?Q?HcQ6f4aqZNS2z4/TAWORC6NOzTUXjlAuQlC40ojrIv8d20fZx2LgymePgzcA?=
 =?us-ascii?Q?FCf7YOGC+lEahHgfKwcJu1rsrhQIuMUzVJOf3UC5CUA2AwDLfS96mMP8F1aN?=
 =?us-ascii?Q?9TjPnB/q3rT/mU7NvSpi/U0BdugJIyUvA8F0d7a4BGRY+PfZYPXndMrKYbrh?=
 =?us-ascii?Q?vLTRPKc6wG0MRz747NFTehfcBpTvt6SNf4I6+NOje7i9GusYAuoEzyiIGj81?=
 =?us-ascii?Q?MuadeFgcksLfxdmpgEdnYe5qURv1F7hcj0Q8dmiYrJ8KcnOhYX9kpeEBk9ID?=
 =?us-ascii?Q?Ky5BY/gtq6zKqmX7qXCXn4e0DvbotEadJ2ubHzVXSKHX+sofe4rsxfJoraey?=
 =?us-ascii?Q?1sIoIpakGe/D33QA+zUVW1auH/UwNayNcYAsPlOYlJbtueaodyXFtJzemOkA?=
 =?us-ascii?Q?lFYVrdXuC2A+AxuzFIP4Gl9To8EU6hN/os4OKg27x0+PR1+katF8Cp8sz0y8?=
 =?us-ascii?Q?804kv44yx0cwxNuRCGvdnYe1KNH6clD7mHJE9bcJ5ejVnHJD6lO1CbQrG4U1?=
 =?us-ascii?Q?uMB4H8FuyehMQiUBvPURCuvaL6DSzyHd3FP9Z269cGPJcUTIdHgQI56B3YkS?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c128cb7-e08c-43b9-4035-08da821b84f6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 19:46:33.4055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9h4fnseAcC/5dLG6t7I0CEZ4MYVSY7kuBT4PqhoBgjfAXusNcrCv1/gaei28E8NdNx0BS8uFBcE7O850WCyRcZyUsAL7jFtqxOP9yLS74A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3468
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 18, 2022 at 04:42:02PM -0700, Radhakrishna Sripada wrote:
> No need to update mask value/restrict because
> "Pcode only wants to use GV bandwidth value, not the mask value."
> for Display version greater than 14.

While the code changes might be correct, I can't decipher what the
commit message here is trying to tell us.  I'm not sure what the source
or context of the quote is, but the description in the commit message
should be more focused on why it's correct for our driver to skip these
operations.  I assume it has something to do with the new pm_demand
interfaces we'll be using to program this information into the hardware
in a future series?  If so, maybe this patch (with a modified commit
message) is better suited for inclusion in that future series where the
context makes more sense.

> 
> Bspec: 646365

This page number seems to be incorrect too.


Matt

> Cc: Matt Roper <matthew.d.roper@intel.com>
> Original Author: Caz Yokoyama
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/i915/intel_pm.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
> index d09e9e5f4481..47869fe964ba 100644
> --- a/drivers/gpu/drm/i915/intel_pm.c
> +++ b/drivers/gpu/drm/i915/intel_pm.c
> @@ -3924,6 +3924,14 @@ void intel_sagv_pre_plane_update(struct intel_atomic_state *state)
>  {
>  	struct drm_i915_private *i915 = to_i915(state->base.dev);
>  
> +	/*
> +	 * No need to update mask value/restrict because
> +	 * "Pcode only wants to use GV bandwidth value, not the mask value."
> +	 * for DISPLAY_VER() >= 14.
> +	 */
> +	if (DISPLAY_VER(i915) >= 14)
> +		return;
> +
>  	/*
>  	 * Just return if we can't control SAGV or don't have it.
>  	 * This is different from situation when we have SAGV but just can't
> @@ -3944,6 +3952,16 @@ void intel_sagv_post_plane_update(struct intel_atomic_state *state)
>  {
>  	struct drm_i915_private *i915 = to_i915(state->base.dev);
>  
> +	/*
> +	 * No need to update mask value/restrict because
> +	 * "Pcode only wants to use GV bandwidth value, not the mask value."
> +	 * for DISPLAY_VER() >= 14.
> +	 *
> +	 * GV bandwidth will be set by intel_pmdemand_post_plane_update()
> +	 */
> +	if (DISPLAY_VER(i915) >= 14)
> +		return;
> +
>  	/*
>  	 * Just return if we can't control SAGV or don't have it.
>  	 * This is different from situation when we have SAGV but just can't
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
