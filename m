Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C197357898F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 20:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF0C10F38D;
	Mon, 18 Jul 2022 18:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 955F310EF74;
 Mon, 18 Jul 2022 18:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658168956; x=1689704956;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6n/eyTcoOVd8VjN4nK3mNcBXQPnOjtn4FrTkomZdfHk=;
 b=iht9yt8yIq3kNDcrJmVTo2629+fN+OE2wZgf7fixmeSO+oAXHtJFOzER
 ncKKRyslDwhK0QmPCkPFrQKtX+8oKIDLeN1Tj1RCBWKxj25ftl5p3YQ4v
 mEqAVFCmxmlVylLYmWvMSrVEzkKJCd4hIXUwF1JnerKaoSyS96DxhDZ+0
 Kh7sAU/UfgSj7E7JnjNvLl/Z942W7fVkpPjbu0xM/Y79v4rod8V80uMf3
 SNDMfEXe2VTF3WLP6TsPFpyaLwvdmZHLXxq7vqX80MOXiQ3oCwKYzo3mS
 8MVt6OO3oeYlAJ1BJ2QCSGBHz549bPal+kr+vBNTg4874K+2QN0MhIMbL g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="285049325"
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="285049325"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 11:29:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="655402383"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 18 Jul 2022 11:29:16 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 18 Jul 2022 11:29:15 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 18 Jul 2022 11:29:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 18 Jul 2022 11:29:15 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 18 Jul 2022 11:28:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YocqUAT4G/qil2rTZhZAuzXXtLMeeJvVoO7DtpqmIXhx4AAnhzl/dOYMyPIfXpAzFKopLBu5iPjMeyr3PYuBWWZBxYCTliF/c9uJ6GzBiNEDZfurxTDgXYV7y6DYPTELEjHfKNwu1dvG9b0YXxXqqVss0QiiaD27E2GtjCrxUAzCqC4qljp3ac3ef0U2Pka9FRij+aXM+3RxSO6JgaIR1CsMe8ZwKBrtOr5sqhqakRYZknNPtF2KYsd90ohLoa7gy5YFtNbx1xBdcUxQ404v4r1w69e5rOPitTOQ41NXk4YtcmWI3cl9Y9gFcGGS6nruQ4T/bF3eQiUciIpjtMgJEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggf+hs8wPpXGKMJza5d5UPYV5O/GMRUjFKR/70XEMr0=;
 b=emtwEGDNdbhV+qq0GJk58cvD8cLYaDdGAEbgp7SeDnkvF+BOUDuYitwDhiD5r1kfNY+040USwrTjD1x1O0BXdDImksrsMOvUHtYnuQrLEdjYOm6mNDQJxeKhlwyzSoeWeA6MRD7qMavdFCtqDG/e+YNptw6h1Tky/vsWkbTfYO1AUY0UGzRBOCsoIHi7TFTmbupwtuak7HabnOBYx8YNcAhIQBBzhxZOr7rqHaQXcghtkIE2G1TUeXjDPxPCRP6dkbXSau1JcqqVdzsDH3k2c/iArd7RC23/XcM2Oobp27m5DNYWgU/HFcuBTSWvXu9UAl2sB53G0k7jYB+B8XPXpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MWHPR11MB1599.namprd11.prod.outlook.com (2603:10b6:301:e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.19; Mon, 18 Jul
 2022 18:28:52 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 18:28:52 +0000
Date: Mon, 18 Jul 2022 14:28:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jason Wang <wangborong@cdjrlc.com>
Subject: Re: [PATCH] drm/i915/selftests: Fix comment typo
Message-ID: <YtWmXu10XZLSGy+w@intel.com>
References: <20220715051953.31424-1-wangborong@cdjrlc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220715051953.31424-1-wangborong@cdjrlc.com>
X-ClientProxiedBy: SJ0PR03CA0120.namprd03.prod.outlook.com
 (2603:10b6:a03:333::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7877208c-2113-4d61-11c5-08da68eb5dac
X-MS-TrafficTypeDiagnostic: MWHPR11MB1599:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QFszXU9W503iVchlzfCPhIyVImYR1RZwPGjin4uX/MO8u6dMTUokidbl4TGdFUbbcILmjb0wokMQO9Pwof6aePWOImFm9Uz3kiCXfSrNZ+mKE/ZPsiXyrhdV5mJOTsMxRT48/zTEGo3zQ+UVUlJFJ4qlQ+NkGmNtAi1YK8XDltuOGQAznLii7k3WxlDNmxeDgCVdZcvVkckbPGYzBXzPKLcdsw35PXFwNSihkn0RiSAQ/i5ba7BISKJ2cy14ZQJOfffQ4axtbrYajhScMqWoQ1PpVH7giA9LRVKQFhFcsIVi3l7pC5rO3glqLeJ2f0+1tVDzUB/BSelFDAUeByg0+A2hrrOUy4PIkSBzXeLYIcowbVni3BZ2xhbs3yNEdOFjKYI96mXjZFV6CGgAF2RsO0oQ8+qjI4lCFqykRAN7jPfdeO+WH5jcWDczC1aliYuW7D9/tketj+yIbWRaRFNZb2doRq8/MHUs5NGQ2xPhne5Eo21z7Rbq9E68a8RoavcOTpKtjYfNYvSR88W/FF+++fEVpNIHptf/hornJAIcdmlfEN0MByY69e2gqNxj6woepFSY1B6vI+SZiu+Ox4/l//jYvYMYiKE57PnxcV90+czv/OKzRTr1deK+8Zkd2su8yemXWzsUQUlq4BfoKgfC8vrJvyr6zI/Mng7OnIa4SvVNtfnkX/+EadmvoEJN2gjNcEqaJMpE6radDFJyTxaaYYEV33qCxLqC5DPuuwM5ZCxPsh/IfOwwndWSWwaQUuHsKLiJVj/DHqdprum4B6YNMqsSwqI/3ZHpD456DpObcCg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(39860400002)(376002)(346002)(136003)(366004)(2616005)(186003)(66946007)(66556008)(66476007)(4326008)(2906002)(8676002)(6506007)(41300700001)(6486002)(478600001)(5660300002)(83380400001)(8936002)(44832011)(7416002)(82960400001)(26005)(6916009)(86362001)(316002)(38100700002)(6666004)(36756003)(6512007)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zyH289lsOMEZWlJU5mzN3dhcosXJ9fQYLD221A6DEQ75FvZGi2eQTAgtT3q6?=
 =?us-ascii?Q?YLCbqTdnVYGm3V1+eghCXNt+LRrnc1uPa4Huk/nSyNQD81IN+auvBfNjm/57?=
 =?us-ascii?Q?D6f1V6lGvRQrmw27QKVXAH81VE6XQWKvCz+345FG9KqWhtTVmyDvQ53u7bNH?=
 =?us-ascii?Q?pX2u17hn9C8ttY4bCfgfbrEqiTxl1tlWQ0QB1Krpbdeztvr/HtNTSuihQn2k?=
 =?us-ascii?Q?ocEPW+heX7eiPMXhUNjH1OuxIHHNgvx04ITC15+utTQZWJ0F6/WshxFc89Xi?=
 =?us-ascii?Q?iNLaKoVR/iqsLJ9r7rpJ7ctLzhiUFd33HdndZPMPMh+zgIt3uW9RtywJVUvg?=
 =?us-ascii?Q?L+C4H1vXwkE8DPZlv2y3W6+u0u8Zg90/qztUBq/xzYPggq0/Qlg0GtSaR342?=
 =?us-ascii?Q?+tCRle65u9AR5Ef6Ja9ri080p54Jd6wmfWgAqfNWySDhlzFwFbvv+VUh96xF?=
 =?us-ascii?Q?PRvG8oSx8d6AErdP/+JTdwocrax6vljyIL0G+bRH+YTUjA+SQsdlAUEa+soz?=
 =?us-ascii?Q?A9UwlL3gkL/yGTZydWCHYeh1jZ53cnH+YMmWVlQAKC4qIE1Cxp8OshIRXj6M?=
 =?us-ascii?Q?rOBIlsL5H5Ll6Lntb7xz/e9xFURVDbSu4WWWUlZdHqzsnyUxNAXWJfsgvTbx?=
 =?us-ascii?Q?2wYKaPkklAGkMCPXgYeTUPaxwvYXWyGIGQGX6FXRYRTJfCRj8Mlp2209TJE7?=
 =?us-ascii?Q?afzYZJ7V7b2Lv+NzQ38SIiNrmH4EfMxL1GWGgyEUEYlV+hdrJECQShyhevTw?=
 =?us-ascii?Q?bw4Gbr0wkrDbD5gXbC+66BfcBFHlY1Ld4VmxYQ+JuGbMT64xh9WOHnM5+rTG?=
 =?us-ascii?Q?u92DEleAKmg2qo+1rWZmeMsRbn86/JyFkV1rV05DtmjLC++hYO8th9REzM8J?=
 =?us-ascii?Q?jObO1cZl7N/VCibcuI3umkBUnBBs00gBiC0wl8eNQeoJUVD8hMK5pLv2pLSu?=
 =?us-ascii?Q?2QWOoe7nZAvVpcshEKfYOgJ632FovYC7Xz8hm/oTAQNBSqBfWx875EQwvGwn?=
 =?us-ascii?Q?i0Y3Yo9JE4mZzhbi4iQFKzfZ4k3LdfL06/mcpfeED5EE+jMN5oxYYSNuQMmm?=
 =?us-ascii?Q?AXZM1ezPC+Iy+ZKC2JXHVw6/roIyLmsR5LzzPW7jaEqKrBdb48Q7vt+4/gZ2?=
 =?us-ascii?Q?pl+M/g6GDlYe/jgNaVbMWC5vI6zh+cmZW+LGzcpo+jdArcldtCfFscA8iImV?=
 =?us-ascii?Q?uRQZGsTR2fcGOk+nqGGjRNlMB7rddGlmu7RGQxhy05pnDsgnA+3VxZCbpVYU?=
 =?us-ascii?Q?Tv2XNBj38L3/IysRHv3hA4Qg6m2X4qqE4yNOlqSltijQDljYZBw2ZBLwr0iX?=
 =?us-ascii?Q?wWBpYi6kqJjHs554hNg8w6+xvz9fsOWKb8SVsu+UPd1ZKPm/G5D7KQCdQije?=
 =?us-ascii?Q?2mfJ9yb1IOzd8kUL2J5NQc/AcffjumCOcFNCI5/pltMQi1DcT2JXAcjdgfzF?=
 =?us-ascii?Q?spmqVI5SaRfAtX/EGgmevvPcsVVBxfP52cNc+bocPG0J6SaetEQvoAPqpTv/?=
 =?us-ascii?Q?XkbQj3GfdiiBWtCzf9jl/od1UCNUPGT3gTlAY/VXeLTE7DMNQbJ2Qmq2w32R?=
 =?us-ascii?Q?CiotiXBnZC+OY1BoUGRQDZbhSnQBr0lGc5sFvdo9roTSigNHu1yUkMMfovXY?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7877208c-2113-4d61-11c5-08da68eb5dac
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 18:28:52.6694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xts+Dz961AI0N+fXtjRLFXThKkSZ1j0eq5EAJOkJ3Gx55+60FDj2om/n6XUWKQ3790FKrVww1wTu8n2w1L8jpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1599
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@linux.intel.com,
 michal.winiarski@intel.com, andi.shyti@linux.intel.com, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhou1615@umn.edu, John.C.Harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 15, 2022 at 01:19:53PM +0800, Jason Wang wrote:
> The double `wait' is duplicated in line 974, remove one.

The line number changes... if you remove the "in line #"
the msg gets better.
With that changed:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>



> 
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
> ---
>  drivers/gpu/drm/i915/selftests/i915_request.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
> index c56a0c2cd2f7..ec05f578a698 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> @@ -971,7 +971,7 @@ static struct i915_vma *empty_batch(struct drm_i915_private *i915)
>  	if (err)
>  		goto err;
>  
> -	/* Force the wait wait now to avoid including it in the benchmark */
> +	/* Force the wait now to avoid including it in the benchmark */
>  	err = i915_vma_sync(vma);
>  	if (err)
>  		goto err_pin;
> -- 
> 2.35.1
> 
