Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B426B73A8D1
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 21:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D4B10E058;
	Thu, 22 Jun 2023 19:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BEC010E028;
 Thu, 22 Jun 2023 19:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687461013; x=1718997013;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=a8TZXOkVAzARevSHwvTQ/j9HklPfaqvc2V9syDaQm4A=;
 b=XtK/AYsZQF2k09vRa2v9BPUhkyaDAJ7X1A6LpecggKlmi37qQGVc5CpK
 SHhII1VagobiGiXqRW/exwM0z13CWOolJb1B65VERCv/tBJNOjX6/b7ud
 VTos0KWUukYft7xVstW7l4WbW0NriGRRKQ8Ql6tsvewXpOIMwIf5CHBNh
 sQYxSDXBMKOgZ8YZQuL4ZbCr+xzCMl+i83wjZ0iNfyScGFc7ZWyPWI5Pa
 dLnfTJerqtENg+QpqTOqeU6wWXhANfu8HBtaOKX9BMrXkBjYjAYsFID7i
 kPuSWDFlfYGV9rie1Dvek/IqLrJgkvNJaK2w4lqESCQ+0yPDEn+qWQOl3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="364030811"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="364030811"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 12:10:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="1045340602"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="1045340602"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 22 Jun 2023 12:10:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 22 Jun 2023 12:10:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 22 Jun 2023 12:10:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 22 Jun 2023 12:10:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KHYm8qXCrrV2feJfJ3ZIXvkeYr+SRMMZtsOLYUBdFnQoRXEP/xUrL4W8Wi9KB7zZZDBdqI/Q7m6cxV9DIpT8pEOjdUsBbVjC38ZFfSIZz9Bqn4HlwyfnJpFGPGHXj5kdS8RFohM0PnspVZTckIuhLbpv1ed/57o3O4PlEignDibQC1+mHbW3mkHEeB4n7lBzEA/YTRBv2YBED8vUAGKShJmCO2ohcCe/EguNloQ+aF3dD7oGrsUX4paFTj35ul7UbJV1JlvYCR+YRj1zK6AbYmJeLYYC2yHSD7bMbf3fRGlOfRuOzpSdfjaoKtgBTqc6kVJxtlPuKViBbXxv57wgWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CWcxpx+nnqXD7XV+MEgtVr1xxZQ8J3YwP/Zr6HAUHM=;
 b=V9t+oZFrx1lVYjEJwZFmfpe6HoZZ4NcCuC30DaKLBMRbhMYGMaIsviZ1ZvgpI88Eduk6caoMjS3NHPPS5D7UkomphVyn5HeMmlekJp8sQryHzzQlurshs3Adjeu/QhTud2f09TJJpydZDL7yMpr3kZhFNIZaLyNdZcsYVJuhFymaKU4g0wfOoy3VigyKFd8dbjOitIFCVfBNoJA8g12Pq8rKKmXYV1CNi2WM+vrXDy+b0PWaJks1NmEv2tktxQGXXWv+CbQ14NJ/rD7Str6j8wA6QNPUwt+uMfyuwYOVj1wZj1QTH+HHo/3zp9BSk54cyju2jOgE25E8Zv2+BrfA5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5086.namprd11.prod.outlook.com (2603:10b6:a03:2d1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 19:10:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 19:10:09 +0000
Date: Thu, 22 Jun 2023 19:09:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v2] drm/xe/guc: Fix h2g_write usage of GUC_CTB_MSG_MAX_LEN
Message-ID: <ZJScV37DpVFmnmWv@DUT025-TGLU.fm.intel.com>
References: <20230622162714.396367-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230622162714.396367-1-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: SJ0PR03CA0125.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5086:EE_
X-MS-Office365-Filtering-Correlation-Id: af511ac6-aac4-4a07-eb73-08db73544bc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +wwrY1VepM4ezhSQa+9zYe7TfHjo1E/xjurlltA6+T5cXd9RXH+orIBkjQXqx1OXWn1KkDxvjcZMGvZ9Uiih5Jndwr8Zor/7m4hGZQnBJ2jSE9RlIey2Eb6+DgXBtJsoVPUG//K5b3P9d1yBVo/fEaT+e9hgPzPA5NKk+Puo7iWuB31Hsdez1HfuMdpYKhl1dlqQ7WXwdcbgChQH7GFYJ158TExxuAtUKG8SWoEOPvY6KCT5W42rYPg9KfHUa38An4DLQLDZRVZDp1FLY2uqsROIGMaUMIj0GCuY0+7GyGxgxrl9TMaHM1j+vzob22NfJss6VrhiGby7SaYcTm1oYF+CDWr/IUMVsd2M8r9gtwlYuy7H2ZHxjheVd4sVUqiHFkaTcdl7mF9xDXKi7ez5/6NVFPH0su54cxiCR7uuypWRpx0WbqzzMfHSPaMclMelLyjc0L45QNxFwoDSMIjycnPu3A1WQnr6d2Ort+eYJ4RA3Z4EhtnBpC2aIlg5vGTtrwtV/0hEQf5xrEh86Wam/ErS9Cql4V5fv98RpOtbxnLCA/tyAEX4TbWE2sE2msV7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(39860400002)(346002)(376002)(136003)(451199021)(2906002)(86362001)(186003)(6486002)(38100700002)(82960400001)(6666004)(107886003)(83380400001)(6512007)(6506007)(41300700001)(26005)(478600001)(5660300002)(6862004)(66556008)(66946007)(66476007)(316002)(8936002)(8676002)(4326008)(6636002)(450100002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZTcb/CuXqDUdLQb5P1za6H+ggAbE0d3maT6exgKuZYmefhNxTL9JTiKvXMX+?=
 =?us-ascii?Q?6PIwUXq1ApjgtnSuTjzUOlVW7UcCYEDsOa7b5jojeztLnaSPbAWk3u1qanAx?=
 =?us-ascii?Q?/Sago6BE6iby9/SAxJ/RpTazzVAre7Cbsi9EnK/CJecIjP0HDymTSisr2ulX?=
 =?us-ascii?Q?Muypxe01hKBQ0BT3soEDa/Pm+2jA/Z602U5CQ0FA+MgDouAk52iG7931ZccO?=
 =?us-ascii?Q?qqrBPsu4Kdpl52PubpZnCCCSSJwV888y0K/9GYEbynoyEEdSSx0AgMP9Zm7u?=
 =?us-ascii?Q?3XSHGPjiw7uteTZqTprF3VqrsTKFrwS6GdgXZzJaELKCzQ/DoDKEAnQoYcsI?=
 =?us-ascii?Q?R6UnJE0xKYhWZITprtNotUqJO44yBTZXsjkk33wlw+q0xCqKUnJ7yh3F7QnH?=
 =?us-ascii?Q?0dnNI42sqHLEN4t3CGW3AbJcXxeV0pKDFlYhKOfBwvvMnqCD4h3Y25FYXWH1?=
 =?us-ascii?Q?UqyKqeXFLfOWCBYpBJOeOJ3loi+73QfYUP8SqXzzpNIloDANkWQlhxKfuf4I?=
 =?us-ascii?Q?00QMg2ssjwlsJDLL9NQxjqzTta5y3e26EBecYg0yoYX4JxPcDmKADgWlFQpr?=
 =?us-ascii?Q?hws/9tedYadwMA5j0kDm+j5akuy1R9El3A5XGYXRvaYJpk+qYgMdY1U9s1kj?=
 =?us-ascii?Q?rRGWcHaU9QH0WpRrNEJF3j8qbFfUVrUKkX/mCZzJAGqlkqw3GyKsh4MB+cHa?=
 =?us-ascii?Q?DgUzfEYe48vAZClOc5uJj9C4kiPSvx6jiBZ5N/3ZxQpUfrZtuW91o5r6DwuP?=
 =?us-ascii?Q?zZnRuBgmwoEYybcLUaTGKSIVKQluN4YadI20NKeIDrEmh8tD3KwlDCdPPPcd?=
 =?us-ascii?Q?EhHyNPbdQCIcOwFB8naIQ8mV77aK2gy8ngbC4nwKcIBzgi4TeahbPtwOey3l?=
 =?us-ascii?Q?pmx30rgMJytYSnuIa9qQH4WykQMA8fpbT7AVKK94eQ9H6NYsmN2HP/PLo8fy?=
 =?us-ascii?Q?jzxBTFedxg8XZHepHBLg7yMd4bOPnmjHCQlTg36+79HIMawHj949faZrsJLR?=
 =?us-ascii?Q?YyFolBAiyha55iKjM1giYmbIT7R384z/pSN92/CrRNq7HcTkErlKjJ6STln4?=
 =?us-ascii?Q?XA2/UW0yoAqi1NwgcJ8EUrPnqTt388hJHyufqpDdDZF7mnGl8b6DufH5Lfdf?=
 =?us-ascii?Q?bQJEBpz3MHKkEiKFok0R5zYfmD/hIARebkvxX4YLAcGZGCbIdolY0faSqvlN?=
 =?us-ascii?Q?CiHf7wYfaMBZNarmVgRs/dbeq/TKZAYEI31HkPdm8kF1LYlxiA/uH54JFLfl?=
 =?us-ascii?Q?raojodURFbCBR5NxG82JLpcOYQyXl22yudNwHuEOuYQgtCJ38sdlprsHPpRd?=
 =?us-ascii?Q?R0Ar3QxMCHlFePa4FHyCcAIUiTSsclcD8pvaP9p5gRGfBeINhxZkHAVjS6Bi?=
 =?us-ascii?Q?v9awrUPWSOS8+9R/1iLo8XFhYAZMI9HoNNmFOL1g7vrjHiTtb5szMZoDYEnh?=
 =?us-ascii?Q?EIJBnt/ElHL1E7VTOwK3OxOUDfTOsuqBKWKoln2z0f6dgCa0qxlGJzpJ1lia?=
 =?us-ascii?Q?DNhDzIxvpC9g70iZAUE3va2JoILSZHTa7zio7N4vzG3OZJ3fOZV129SZOncd?=
 =?us-ascii?Q?jmM0z+8iUHY/NV33VeEr3wn7M16m4fbXAHC4tBAXwoz+3HVOtO2Uzfw7AC1i?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af511ac6-aac4-4a07-eb73-08db73544bc1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 19:10:09.1221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: blkcU9JSHnYzOOaewWfAfXjxO9dSneAC3X26iwqETg14FvLPVLyvjHDtXLtcQxrpsbn95Q1/qEcm2zUWkXIV3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5086
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

On Thu, Jun 22, 2023 at 09:27:14AM -0700, Alan Previn wrote:
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
>  drivers/gpu/drm/xe/xe_guc_ct.c | 29 ++++++++++++++++-------------
>  1 file changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 22bc9ce846db..45fdc0ebcc0e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -401,19 +401,22 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  	struct guc_ctb *h2g = &ct->ctbs.h2g;
> -	u32 cmd[GUC_CTB_MSG_MAX_LEN / sizeof(u32)];
> -	u32 cmd_len = len + GUC_CTB_HDR_LEN;
> -	u32 cmd_idx = 0, i;
> +#define H2G_CT_HEADERS 2  /* one for CTB header and one for HxG header */

Can you move this define above the function h2g_write? We have been
asked to avoid using defines in the middle of functions.

> +	u32 cmd[H2G_CT_HEADERS];
>  	u32 tail = h2g->info.tail;
> +	u32 full_len;
>  	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&h2g->cmds,
>  							 tail * sizeof(u32));
>  
> +	--len; /* cmd[1] replaces action[0], so len is one dw less */
> +	full_len = len + H2G_CT_HEADERS;
> +
>  	lockdep_assert_held(&ct->lock);
> -	XE_BUG_ON(len * sizeof(u32) > GUC_CTB_MSG_MAX_LEN);
> +	XE_BUG_ON(len > (GUC_CTB_MSG_MAX_LEN - H2G_CT_HEADERS));
>  	XE_BUG_ON(tail > h2g->info.size);
>  
>  	/* Command will wrap, zero fill (NOPs), return and check credits again */
> -	if (tail + cmd_len > h2g->info.size) {
> +	if (tail + H2G_CT_HEADERS + len > h2g->info.size) {
>  		xe_map_memset(xe, &map, 0, 0,
>  			      (h2g->info.size - tail) * sizeof(u32));
>  		h2g_reserve_space(ct, (h2g->info.size - tail));
> @@ -428,30 +431,30 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
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
> +	++action;

NIT move this next to --len as it makes sense to me these operations are
next to each other.

Otherwise LGTM.

Matt

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
> base-commit: f0727faae3ac98601f3f4299a967f26542b3e482
> -- 
> 2.39.0
> 
