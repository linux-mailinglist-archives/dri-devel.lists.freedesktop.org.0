Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7AD741B14
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 23:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5689310E39D;
	Wed, 28 Jun 2023 21:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8B810E39D;
 Wed, 28 Jun 2023 21:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687988700; x=1719524700;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q/CPTHLM54VZR58nHaFx0On2BGjfR0khZMTrS9YA6dA=;
 b=mYpxEB6Vkf0nQg5xk5Iavh9/fM6/c9jNHnfTfcv5bobZjMTHmPnIzXvJ
 QiO5QXmUfpsehpRDPJMvyHxn737FzNuEUPYOsv4+KERob2xWz2OTbDDlU
 9p3zh0ZjcJT7pnFWrYCMTmoN3EyITFWoiPYTqxoBsGEcQtksQezvJzwJI
 W0ez5ZDhe6DDm3lzMfhJNrOclkamyik6x/8Rx/7WQM8V1nHrOXoekVGqQ
 EyKbjMFy5q1x7OuLsdlX8EnBZVr5UbutNIpBOTBdF652n5yQ7UrNC6Aei
 KJPWyApvXnS8Y+fVGuxWwk/km3eq8w7yxacQWrTHv6tyy32s3leTiQsz5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="359457497"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="359457497"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 14:44:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="891188770"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="891188770"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 28 Jun 2023 14:44:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 14:44:51 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 14:44:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 14:44:51 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 14:44:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=clgvw/JSSrl7s9whIADtMHFO+CGQ09AvezyIMdO1LHQ6YtifJKK5AR8wPmrdHUzXIKsyXykxegpHdaoDpmGZF+Aep4vmgwXZkUz6iMnCk/fdziBP1Y+Y3m8H4ELXD9AgajUXYSPdbvmX2dQhlQVDJ/1aVGq60SNyGe4cow2ILA2ksJddv42fnwyCGSqkv3IqniZHYHY3A1DTZl9WQ8graP/dDgykvS/71hSvlCt6bdIuhOTAH3SJCdOf+UydwDW9jSSUtzk0G/mUawbQZ+cg2mBzqnWsDu8ZmC/wCB3dYG0YZymRzvjKx5c8BC244CGiYa26u7tTyMsPXoNbPnEmUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7uwam739pQGyFMR0T66SEc4BO0L7DAnQJK2g0GCXTw=;
 b=UBOR1Eu0KrDDS7QvMcqERB2OOOP1T3iDVz0KINt7trt1l1BVvXB3e6ml342ZbX7AZR1GlxwUM9KUPnuvbaH5ckGATBD+m1wyBSSIZVj2QCuj0NRi36ZGogS+K+gALdODwSbZpGB57b6aqkWPNGPzeEUuxdk2rjtOY6FgaD15Y9iOpt70NTy6sH2R6QFIadiafWxDzx02KbBp/RLlcTvbqLgd9bniD1rskNXcwdKfi+owdwvXiPHxYDa5Wibx5JdHJ+OTauKR0cO6zWLPgGEGURjfnqqiBXqYroF/eWFkCN1yfbbb9xN/4CffvfOhjD51PbM5h287bOA8tkehyfc89Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7880.namprd11.prod.outlook.com (2603:10b6:8:f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Wed, 28 Jun
 2023 21:44:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 21:44:49 +0000
Date: Wed, 28 Jun 2023 21:44:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v3] drm/xe/guc: Fix h2g_write usage of GUC_CTB_MSG_MAX_LEN
Message-ID: <ZJypqfa107jTQZn+@DUT025-TGLU.fm.intel.com>
References: <20230628181718.1023703-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230628181718.1023703-1-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: BYAPR07CA0074.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7880:EE_
X-MS-Office365-Filtering-Correlation-Id: 1884c664-ea21-4d45-2cb8-08db7820e578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: It7Ld/SlHLK1r1wJx5xzxyJm/Rk+mWr9WuQqRldJgaGDGExTx/HTSr8E3uGLb1KEhV2vQjHmcciYQYZ4VcPumNeXG7/S8G90eNtUblW+XK8Ek2OHjFCDOAEnq5R6SW4QDNbK0jHI0iMpNrX1UhZ4usFDMmk8BXoxaGPYKYJCD7zh6stLqzuuxLEBodfl3vD8J3yVktj1eAXp8n85mfZOu1gTO4LGFuerJA5PNQfStprWwE6ZAQTPXbij3VrHGqh7twdlPGdhUblsHNUOlASg6EYFJ/Iybe7joLGdXjBZ9iGTekZwHD5H2jZgRJ8Z7IpwiUOeTGVw0boDkjgDIoDSM8ToGcz8r0g8xErhhhu7YonnSPVHW7YyV+i49Z7MvnVIVjAmnhnInK9BgzUiaidWXrFb69ETVv2HVF8SGMPHa4ykamuOHlBFg0cROTd2EjBsDYZ5Vxu1GQbVJlBh52syo2vFQsi+L4cVK/Skzku8a2IjoqkfvNCP5n2vn9/SMMaXjmN6rJ9Gnig3Itm0fk4htm14e6pjgZf36GvmoidjjIl5ADujHLGz5xuqCYYTmJ3J
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(366004)(396003)(346002)(136003)(451199021)(6862004)(8676002)(66946007)(66476007)(8936002)(5660300002)(186003)(6506007)(6512007)(66556008)(26005)(44832011)(2906002)(107886003)(41300700001)(6636002)(6666004)(82960400001)(450100002)(316002)(4326008)(83380400001)(86362001)(478600001)(38100700002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?78Y6xj298NpGwQ2Dymq4pvJZuW59iwSwEMO3fnSnkI2CzlFUx+gkeFCe2r14?=
 =?us-ascii?Q?nfELwP3Mz618cf+85s1bErkPw6nKHDMWfon7ussiK4KeY4xQBvCaA9jPYkaZ?=
 =?us-ascii?Q?f0vFYQALS/Yh7xnkYIxykNcsAoiAcruOVY3AECHtttamkmuSdEnnQCF/QgUv?=
 =?us-ascii?Q?5bnov3QRoImiV1sJtirbAR5X0IqXQ5sE5lqsJ7RdHna7YYT5h1AAXhPX+yFi?=
 =?us-ascii?Q?pr2GjzL8uiGK9ZOK7oMWeF0lQOdmdsG4E6XvYix/G9MSjQjujlgk0tukG+QP?=
 =?us-ascii?Q?uLACc765fAqkS0InAWRSGqQ6fDxxO2LerLdDWcTDEe5GgCc4pWYzz9Q1HgIn?=
 =?us-ascii?Q?GpT8Fu3bIDxvQmYZyXPGceQjwQ8d+d2LvjgR2rB6+9BsLXqdtG0MkCr0oU0L?=
 =?us-ascii?Q?pODZIr04OcB6lFQkdY5ZG5D4Cy3PVKszGlmJHxJF28JZb90P2J7QKP1b/1o7?=
 =?us-ascii?Q?AtyZRSMe3VN5mSryKTFfJs2M8fRam2+dRgsAZPaBLmSxkK3MFj2LrMZR8s0C?=
 =?us-ascii?Q?/e9xPKu0101JaD9ycLBkMOR6V/XMO1InORuh811hyvZ4YRJ4hFNJYawXG5F/?=
 =?us-ascii?Q?0TiuDvmfSQJgLUN39qeAZrP56TnpAd84FMk1fxro2yO3ZAOp8npWPPjxuPcT?=
 =?us-ascii?Q?+rypITpI1spJ9NFu4wcwSN2tDpzZJhQr+hEIoNjUH6xACncFpl4XRkRCOC5m?=
 =?us-ascii?Q?DJFsHFVPPiM89drijaW21yXEKwvHuJh7XRuP598gdpx2ikRzBDh067DMlhod?=
 =?us-ascii?Q?/sR8cqHnOninQedPQVjPizhN8tZCyzo4nH4w3jt8vkbVOsl0WsiFvqq1/4yF?=
 =?us-ascii?Q?lKvtjumj0a3LqSzx37wgYis/JMUEDpnbxPh0i16Y5nHLvfobxzbPS11boYLR?=
 =?us-ascii?Q?JO+c18M11YAFK2+jzFhsVOtNZSF8ubW7cKwWHPM01OnFVPne0EFRBNr4LMKX?=
 =?us-ascii?Q?NOx64aY2FMlsRcZjAuBBE9VOeQk8yYD4qFbzF1or1nJJc7iIK0TZO3P3Rxhn?=
 =?us-ascii?Q?G30wy3iTnGL+lnf3/WnJia18uXTBobrUymuqhAl5XObDtlo2yEtA9GZXlwL0?=
 =?us-ascii?Q?zdGmnY2VhtFOq+hlMxuYlBMjr7+aKsLWcpYk+Mds9OYlITp2/NGMq8QB1Yq4?=
 =?us-ascii?Q?e6z3CRYH+0gMC/pa8dVfr4CnH2OLlxnkkXpTX+1Nj6rkju7dtro9GKEkLgQK?=
 =?us-ascii?Q?7owKcXMcqVxmKQpwxhA+1p1qvS4yJ1Nj63FyAGztxP3bTXziXwlFsdd2aJxq?=
 =?us-ascii?Q?A5+mpO7Y5NXiNZ22YxTi9mCyPg4DJyRqeuDGA1Nnv+1UxLp7MgmbczWfr3it?=
 =?us-ascii?Q?IHTIWf3N2c6+4jKC9UeC7WwdzUJ67DjpgzwHCDT+JmphdBf04fFME0NJE3AI?=
 =?us-ascii?Q?NGQUDp7hAD6Sj2Pfjcco4GY3I/OqZ43nsmDtIsysiuSSLqpFY23tf9KmsEVH?=
 =?us-ascii?Q?pB3Yq6jUKIoCSfK6Jh255SZmoltohyRB45+/Q+JZuYRoceXSKub9+UX/V2fz?=
 =?us-ascii?Q?0E6R1lTJoSEWw7aDLKdNiIAWwjFCGcKy4Lljgzpi5kbANECspHjZ1S3PVRR8?=
 =?us-ascii?Q?DpTH4LPlLrb/2IZiaA4sMUyYRncI+zFS415aNRD+ZWS1MbvFXq/gi7dLpvje?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1884c664-ea21-4d45-2cb8-08db7820e578
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 21:44:49.1347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k00NPVTRIfM+nQXy950oyfvDn10GPLEleSmbIHQBJMimzMVH9uo2+9b2Q381/O8Gi764UggWhsQxbtAsTpFohw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7880
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
Cc: John Harrison <john.c.harrison@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 28, 2023 at 11:17:18AM -0700, Alan Previn wrote:
> In the ABI header, GUC_CTB_MSG_MIN_LEN is '1' because
> GUC_CTB_HDR_LEN is 1. This aligns with H2G/G2H CTB specification
> where all command formats are defined in units of dwords so that '1'
> is a dword. Accordingly, GUC_CTB_MSG_MAX_LEN is 256-1 (i.e. 255
> dwords). However, h2g_write was incorrectly assuming that
> GUC_CTB_MSG_MAX_LEN was in bytes. Fix this.
> 
> v2: By correctly treating GUC_CTB_MSG_MAX_LEN as dwords, it causes
>     a local array to consume 4x the stack size. Rework the function
>     to avoid consuming stack even if the action size is large.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 31 ++++++++++++++++++-------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 22bc9ce846db..aa04b5c4822f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -401,19 +401,21 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  	struct guc_ctb *h2g = &ct->ctbs.h2g;
> -	u32 cmd[GUC_CTB_MSG_MAX_LEN / sizeof(u32)];
> -	u32 cmd_len = len + GUC_CTB_HDR_LEN;
> -	u32 cmd_idx = 0, i;
> +#define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */

Hate to nit pick but again this should be above the h2g_write per
feedback from Oden on Xe in general.

Otherwise LGTM.

With the nit addressed:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +	u32 cmd[H2G_CT_HEADERS];
>  	u32 tail = h2g->info.tail;
> +	u32 full_len;
>  	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&h2g->cmds,
>  							 tail * sizeof(u32));
>  
> +	full_len = len + GUC_CTB_HDR_LEN;
> +
>  	lockdep_assert_held(&ct->lock);
> -	XE_BUG_ON(len * sizeof(u32) > GUC_CTB_MSG_MAX_LEN);
> +	XE_BUG_ON(full_len > (GUC_CTB_MSG_MAX_LEN - GUC_CTB_HDR_LEN));
>  	XE_BUG_ON(tail > h2g->info.size);
>  
>  	/* Command will wrap, zero fill (NOPs), return and check credits again */
> -	if (tail + cmd_len > h2g->info.size) {
> +	if (tail + full_len > h2g->info.size) {
>  		xe_map_memset(xe, &map, 0, 0,
>  			      (h2g->info.size - tail) * sizeof(u32));
>  		h2g_reserve_space(ct, (h2g->info.size - tail));
> @@ -428,30 +430,33 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	 * dw1: HXG header (including action code)
>  	 * dw2+: action data
>  	 */
> -	cmd[cmd_idx++] = FIELD_PREP(GUC_CTB_MSG_0_FORMAT, GUC_CTB_FORMAT_HXG) |
> +	cmd[0] = FIELD_PREP(GUC_CTB_MSG_0_FORMAT, GUC_CTB_FORMAT_HXG) |
>  		FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
>  		FIELD_PREP(GUC_CTB_MSG_0_FENCE, ct_fence_value);
>  	if (want_response) {
> -		cmd[cmd_idx++] =
> +		cmd[1] =
>  			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
>  			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
>  				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
>  	} else {
> -		cmd[cmd_idx++] =
> +		cmd[1] =
>  			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_EVENT) |
>  			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
>  				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
>  	}
> -	for (i = 1; i < len; ++i)
> -		cmd[cmd_idx++] = action[i];
> +
> +	/* H2G header in cmd[1] replaces action[0] so: */
> +	--len;
> +	++action;
>  
>  	/* Write H2G ensuring visable before descriptor update */
> -	xe_map_memcpy_to(xe, &map, 0, cmd, cmd_len * sizeof(u32));
> +	xe_map_memcpy_to(xe, &map, 0, cmd, H2G_CT_HEADERS * sizeof(u32));
> +	xe_map_memcpy_to(xe, &map, H2G_CT_HEADERS * sizeof(u32), action, len * sizeof(u32));
>  	xe_device_wmb(ct_to_xe(ct));
>  
>  	/* Update local copies */
> -	h2g->info.tail = (tail + cmd_len) % h2g->info.size;
> -	h2g_reserve_space(ct, cmd_len);
> +	h2g->info.tail = (tail + full_len) % h2g->info.size;
> +	h2g_reserve_space(ct, full_len);
>  
>  	/* Update descriptor */
>  	desc_write(xe, h2g, tail, h2g->info.tail);
> 
> base-commit: abdb420db479bae28a2abd7ba2c66229b7e8cb77
> -- 
> 2.39.0
> 
