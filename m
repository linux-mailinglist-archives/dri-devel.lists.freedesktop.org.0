Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3E8722CE6
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 18:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D5110E2F8;
	Mon,  5 Jun 2023 16:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25C610E2F8;
 Mon,  5 Jun 2023 16:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685983721; x=1717519721;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DwIUjyafca6BlItLre4noEink7NfUKggOQplyfJhkwA=;
 b=PY6iBIF5mexbbt7GXuB/PaCkjztjRQum6qYYFY9XYQcT+IsmDREcWbRF
 3K8AGDGfOvyR+hAHXHY7ik8CecQk/pgD0cVt7So9FyTzogTkCdn/DbVv2
 m9oxGmFnem7FEFr8htCELVqxRVMHOTLYT2FGM2GSTrbcMgI+fCWCLxv+Q
 vB2/NWzFi3cyuAUWS2GT4/GKhoozFnvXASBfYoSPnY3vYhZWv4516NLQW
 8C2JwNald18OHkaVt5VK4jjePw5cnto9vpqh6GjSi2iywoLiTNpljOOnK
 AvN+PDNYcuVB3oa1n/ELXrYJJAwTvaaT2wK+P7BTHrbBD5/leL44UiKFP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="336038382"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="336038382"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 09:48:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="741782271"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="741782271"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 05 Jun 2023 09:48:30 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 09:48:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 09:48:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 09:48:28 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 09:48:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qxa9QTFAiW07c1ZXVM3BagrYHMx0qilXYGZpnzgJ5m+JOnPtkhAp3lwaGqmCQJYKei2MWWfiPkN7ZqrQW2OR+FUhzHxXWG+yx+lGhHPk1fcKk4Zm82U089Tn/vff2PCIkLfS3c26d7bb87fSfPXH3rPjEaXFDH6Wu5VKEC/c5Y9NktgBrTX1OCS5oENo1wlFWFMq0iV2aC2I1aE+6EXGE4teVoANXP2xKcDPPaTvtxxH09z6atlLNhJ7L+lmYvVz3nMOo31W4aIlnxf9vZpE/GlBEHpFZ9coeadJwJEr/Ptj2Rw0NP0pg+vLVrQlxVhFSTOlggPnFin8MfuJmmW0Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEpBWhDfCjwdn/5/D30xag1FqVAeKw6o2pT0OZntBs4=;
 b=EQsb0ospYnlY7/TPbZ4IaZfA7Won6Vqda51FL4C2xz77I9vuRRpe+VNiRNv83IIAJf8NTnpkZ+BZ7h7dxRAmcEe4UGlZO/8koPWI/7Gewrnh8cIWhY21YHceiDKmb0tAghqHOfFVx0hHsAL6dS7QGszYrAds5HCF2lDxmO2te2NhLW6Z34onPKHz7AkxvL/3YKWeZvtrecCDM78IHCuNQw3bjHxCslIMCnKagu00dgkl+Hi/ebTuIOljXTVicd9flc72Zvj/h7WB/HdAv3nkXZ9oX2Qfjmu7o6sYIddn4lhJIdU/owgUqnBq3WI3RJk+XtKkeWgBM4nttsxFpffK5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7684.namprd11.prod.outlook.com (2603:10b6:8:dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 5 Jun
 2023 16:48:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 16:48:25 +0000
Date: Mon, 5 Jun 2023 16:47:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v1] drm/xe/guc: Fix h2g_write usage of GUC_CTB_MSG_MAX_LEN
Message-ID: <ZH4RjbvZ2YK2f0an@DUT025-TGLU.fm.intel.com>
References: <20230602185213.2635921-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230602185213.2635921-1-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: BYAPR05CA0090.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7684:EE_
X-MS-Office365-Filtering-Correlation-Id: ca3fd744-7312-4439-9e80-08db65e4ade3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oxJE1A1uZzQ/5cNkdnjkbRLQeLpu7CJOd2Fln+M4T3hIuXBBq7uZfXS7dNsF0mzzAquvar5nROFg/R9UoKDT4M9fsHUhy+dVLszWI4mcqdaGrtcxS6LOvLNuIlzatMA73DMYCQJO7ANcKVR4rSEjoqZ6/I6VLIVj0BvWbU7fQV8O9Zv1LW7UklHU+Lyd+QJvx6TLlC6J+LjJ9AD4TwLSI/ul6PG4V4lJDJ29Eke0saY1ntfJLqrCSd2ekK03EObyGw6qnoVxAQTe/b5/01/lEOk0XUnDU/Y0WOtHfuu0CIlAt+0ma/yAq7ILhpgZ1Mbue85D1+E41ibzg/HFs08k2+J8FigVp4gO9y0cKUCb/7s374r638V4AQUyveXdBGZ5KUB5ds8UzYjaY6bVclkxdGQajoKRy4piO97dgLZrTw0qUmErBLmrssOBTGSf64XCxI9fgbonbhy0jUMaBqQ3K+gkWozf0S/Nug1o3eLCoiJ3jh9tCQRgbm9T0jCdCOH/tMiedAjBWrMbnZ3l3Y/cOPrEJbvjgPUzWpexHOQfegaJ9F1oP0LAbBlVr8RHw+Lp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199021)(44832011)(6506007)(26005)(6512007)(107886003)(83380400001)(82960400001)(186003)(2906002)(316002)(5660300002)(86362001)(41300700001)(6862004)(8936002)(8676002)(450100002)(6666004)(38100700002)(66556008)(66946007)(66476007)(6636002)(4326008)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d6pZBcQkfyHwlo2SPQlc0xBQmhq77AF0YzsTE6KSzwxNh0xNcE5HLUKOp7Or?=
 =?us-ascii?Q?B0I81X8NUeUEQSyVMUDGYHCkB1b2KJ6dwq1HmMdM3P+AuLioLqJWMMzSVq5C?=
 =?us-ascii?Q?AUa5QV13oNMWozo+IWs7xuHrUgAJWCez6IC76zlpIXOpKM/y6S+Gp6HLxaKi?=
 =?us-ascii?Q?bOQOzjm+DFvTQ7ER/URganqSMlkm/eWDDsFM55T0xhLLneL8dj5DdDpA02y7?=
 =?us-ascii?Q?QAKRVMs7sAyObQri/1W0KJb9A0rOeIqpcpbforWWms6Tqz0ANU3gDUIoChef?=
 =?us-ascii?Q?Lzcv8rRGvfec0olFaHmrdORYIYAxYiW8Yv0zEQtj/7ci7qADKUtdIx4mf1rh?=
 =?us-ascii?Q?aMyM6sx23DnjolwqsrUeSe0dT4iCONqYbE+fx19OHVaqtKuuknY619bq7ThO?=
 =?us-ascii?Q?6d+10icjtu3mBEPJboI/nHYvO3Kg45tk/xTZOtxsJiH/7ac4y1UMuER/NbKs?=
 =?us-ascii?Q?3oVMH2sL0ybgjkQdEa6zbRe923SbuHUus3Ot/sz5rkaALnN0ES5LBQr6oi4r?=
 =?us-ascii?Q?IOizX4Ga+Gm/U238+sz1+uFbzZyVcpB9xd03KlxleHu2HBMGie+63aOW505w?=
 =?us-ascii?Q?g60zoyoeQ2WcU/RFp6hETPfII7GrasyadNZIozFZvBynY6mk+V70ALuC2Cvg?=
 =?us-ascii?Q?Qu78NjZsIVIUjpVU5Rx4ZNFRJg4OLZpC9M6Jg9SVuBvThaaUbtcrSVAP36z8?=
 =?us-ascii?Q?5PgHKx2/rTkK9MrOx8Z2jQMa9tgCYA8sliGDdAcbnlTAgLnGHqXHwqG3rGSv?=
 =?us-ascii?Q?pUHcOlvtKTHrdgSsoTa80+u0tLSFziaSaLbzSU4L0SIaT2okEjSBtfbPL+9P?=
 =?us-ascii?Q?nqT7Ri2Z1db3Z4dJ4Qn8HASSF/1WjQz8ycasnYDk83Nr1ubu+ZgzikyHG88Q?=
 =?us-ascii?Q?ZctzWFfzSFCg/vqRL7zsKacb/EPkqfAekahjpFFa7eP9Z9KpIc27B2Ef04ae?=
 =?us-ascii?Q?KRdxRJLxZKA/kJ0BNUKaicc3J/7tvto2RvIGzRtMgCp654ldhtZFjh2CY7yZ?=
 =?us-ascii?Q?ScFBIBIsWK/yAEMsyu4R9ACdy7kDku7+DX9uB4A+8brkcNK4z1MDhKKy3IFH?=
 =?us-ascii?Q?Cw3NmqU7h3OTG8kBq5tEr0Z5xnVV6RFejnJJ8Z+tjBJCMLjnORhEfc/ydth8?=
 =?us-ascii?Q?HgvcgCjvhReq5xtAywC71ytHa3JuAiAwoBjd14lSw+oE9NaNC0kUl72jAWYc?=
 =?us-ascii?Q?ts3J06CpOLn7Zn24uuOm8+tMpbEUDRL352otqQ1vD1cN8CsCv/2IxVNI7JSa?=
 =?us-ascii?Q?DZjfo9nMBJBwL8wvrYwznX1taaLhavjgQX2Ooc3T1nYGGknrYr3UAbtTvgGd?=
 =?us-ascii?Q?tPb3XmJF4CCWf8T5fA3dDJFGfYl9//Tr9bBQ+D9gr4gLGi9UszfdS6F7sf72?=
 =?us-ascii?Q?IEGC6nWPBHSfcFDpiXnmiXwk6Cyq9cdzeFiG6ZocZJCupV5vdgo2RwxNOylJ?=
 =?us-ascii?Q?RacgFeOY8ReVX1UNCEKyJE9X1Lf0Qphnn7vTDV4blqFByL4ehtappVuIXVu4?=
 =?us-ascii?Q?d8Avw3RevUwgliWMLv9Bn8jauZU2/vO91A69sGMx92XqFppB+eDQaq6kVVz6?=
 =?us-ascii?Q?VGDGsvlUKUo9hDjeIzpg9VdO2pBI38nav8E8yBd85XveqGxyKGG4FQiobthF?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca3fd744-7312-4439-9e80-08db65e4ade3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 16:48:24.9531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +szoxdsJD6r8qQMIYWG01NuyoWMEIay+H7KDvZApBdd2LztxcPElgrD/N3577mF8xTl4QDC6EtrNpxBshebcjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7684
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

On Fri, Jun 02, 2023 at 11:52:13AM -0700, Alan Previn wrote:
> In the ABI header, GUC_CTB_MSG_MIN_LEN is '1' because
> GUC_CTB_HDR_LEN is 1. This aligns with H2G/G2H CTB specification
> where all command formats are defined in units of dwords so that '1'
> is a dword. Accordingly, GUC_CTB_MSG_MAX_LEN is 256-1 (i.e. 255
> dwords). However, h2g_write was incorrectly assuming that
> GUC_CTB_MSG_MAX_LEN was in bytes. Fix this.
> 

The patch itself make sense but concerned about the value of
GUC_CTB_MSG_MAX_LEN. Is the max size of CTB really 256 DWs? That seems
way to large. Also I think some tools are going to complain with the
stack being this large too.

Matt

> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 137c184df487..8e9df6052b02 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -401,7 +401,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  	struct guc_ctb *h2g = &ct->ctbs.h2g;
> -	u32 cmd[GUC_CTB_MSG_MAX_LEN / sizeof(u32)];
> +	u32 cmd[GUC_CTB_MSG_MAX_LEN];
>  	u32 cmd_len = len + GUC_CTB_HDR_LEN;
>  	u32 cmd_idx = 0, i;
>  	u32 tail = h2g->info.tail;
> @@ -409,7 +409,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  							 tail * sizeof(u32));
>  
>  	lockdep_assert_held(&ct->lock);
> -	XE_BUG_ON(len * sizeof(u32) > GUC_CTB_MSG_MAX_LEN);
> +	XE_BUG_ON(len > GUC_CTB_MSG_MAX_LEN - 1);
>  	XE_BUG_ON(tail > h2g->info.size);
>  
>  	/* Command will wrap, zero fill (NOPs), return and check credits again */
> 
> base-commit: 9f49c413b187c00f223eaf1e8dbe2c1a97c9954b
> -- 
> 2.39.0
> 
