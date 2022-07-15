Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 929B3576F22
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9774510FF51;
	Sat, 16 Jul 2022 14:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A4210E153;
 Fri, 15 Jul 2022 21:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657921125; x=1689457125;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CfJhMpO08KhSocJOGlgUicFU+/JDW4/d5YqvF91XIow=;
 b=SQTZit/+mtt7aEV4f4P6q7/fuql6JZpaTPGuwfZiC+rbIcEMf60kipYt
 PMykxgGCsUhYLdoYbEOZfwXo9H25BB6x/IguQJ7IwRdBdSJ3jisj5B9NE
 74aYmJ/T5K0+o95fapmfrxJY3me9VJLJUCP6OkAeozDLJbvaZLkldwq+K
 6bNrpMRSLOo8gjXZXTWIP4+SqHAdpsvtjpq4k+j9NJhDRiwwo/t+f6lrR
 XR4RI6o/ooZrI3CRL+Qi18zSnxSj6qWWZAolp1HlRhU64gcOvYcQ+aGPR
 oyT/uQJvFYjZ013ieYEw618ouDpJ7Pj4FLdHlWQ5OahEGQQtI7s7sPkrQ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="347592792"
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; d="scan'208";a="347592792"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 14:38:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; d="scan'208";a="596613616"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga002.jf.intel.com with ESMTP; 15 Jul 2022 14:38:44 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 15 Jul 2022 14:38:43 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 15 Jul 2022 14:38:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 15 Jul 2022 14:38:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 15 Jul 2022 14:38:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kq57mQi8xiDIzhUmQvNNlnt+Avn4bhE/lkwbuN3NVlw7UhMWEbi3qxO02Py/CYfDATVD06aS5jHt0S4NrvztmLnN/OMG9H/vHqGus81KA2KjMDPtnYSHD1jdFYtlYMV6FiFRzfe4mSdc17Tzb6W1gxEhCcTFQ4qRmyhDIzZWV7WIh9uRlEVBxf/G5gnEW7QiErAqKb78NgkZhDeZbGh5lGnncdnQMr0+oNLrV7JQfm5qHrRRXyk98hSxl4EanDB96+dDr1nR6rL70YwDznum7OGR4Ma4tedgKq8cDrQauNEXFOR8agZw/ifSnrpwm1C+rf8vr/NfnxKz/6dbLalq6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+o5bnB4A32fjv9z6Kq/ZfB/yQ5BttUrSYQiyFz+J4M=;
 b=mxKgVKhGkcq4LOnwAk694dfAJaHiSnZhjbwPBUjgM3x9u3DJATmbqxBqU/W9FYW7nPWuB76paJCBNGc740PzxDL2LHVdCNAQCi512ysyifbm2jxF2MGUd/kUXDhWOgB8hyp/Umj+ZJJEA4bYkbWEBVF4fdbY9CrAZLtEBxmPdQoBLk65LvGQq7kycQkTyLDGLqw0xbMQS0xQZXcQhP0bbD+do7aIG7kT6oImQY4oNZfGyIpLONLSG/l4MXb9VxyK4yFZ31RzpN/IvJPcdeFl7JLkTrJ6hRjBqgn2L9Rby3QA6Y+fHtLLn8pFAIV1HbxXDAfQTwhk/21kvEVE8rs+Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4707.namprd11.prod.outlook.com (2603:10b6:5:2a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Fri, 15 Jul
 2022 21:38:41 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5417.026; Fri, 15 Jul 2022
 21:38:41 +0000
Date: Fri, 15 Jul 2022 17:38:36 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v2 13/39] drm/i915: i915_gpu_error.c:
 document dump_flags
Message-ID: <YtHeXF2lG9kyQAQP@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <bbebefd789a7038661783ceb13fad8fdbd440f54.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bbebefd789a7038661783ceb13fad8fdbd440f54.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0226.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc07a4b7-e819-48c7-ed5d-08da66aa6271
X-MS-TrafficTypeDiagnostic: DM6PR11MB4707:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QP7i08VvzlBHdp9OPUiHMTVSq2TjI9pcPWbasGudaTy1lr6CmMZvQZf+2nQ9WV8k2oEcWgGrXCvlpDA9o6Lur+4vZolJxTL7N64lm71g8dFV5W/BpHeAPnmST/qOBTkz01gy/2nLN1cPUVDspcNXJ04PfnHOcySHvqNvfbwNPKuaTYOY4ePHre6Q9VKzqI7F3s7uQSquRGk0hbhJ9Yx5Pk+VUcKhWKu9oETm0gRAji+okGmS1Rirc5M4pfwnJvtoExwYFJA2ptd/abbTDvaTOQUjPVXUfdCtl+ZNijQ//HNQ5flSwLBzU0dpaDNu73Prw1LDTZ/kaq8uIh5984LOFlYMcMdCiGiR/HCxNdwkoGHUj/1t7Qday//Ckwl5gUcIVjntG4fuHsI+xs7KJFlOOsNWt79+aQ2R3zSwSVZgVzo3vs9/8pj4WMDGVSMkCf3Bd0XrDmFZEIG4UYwJQUy7ftZuhYsE0FgSL8VU5+UVzLtu9hqXaeLKJjWSiNIXiLmoLgvrGZ/BegnJbk6z48KgKiD+CZb17F8WD4QYBuPpJp6Xfl1thaQpq5K13Oupr37meU/gQUwFL8LUa7fLvhl3i7uIIdH7f/tVABF7G35Ab6Bd/3cgyUveP7j8OUc9+g1QO+3reI+6YRJ3tygF6Y5nHJ921bRhN7g5ghZvzChQlzLT4I3wbC4ehpXhAdDpS/B8VN+85B0x6H7Ayn3Z1G6S4RC9itE+1jbLGy+4skYa7DulblceRk9OCHsCY8mPP6NDY0ImfTGbCRdEbiiUsjvgUuP5CF2koTPBBPon6Vgwx/A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(136003)(366004)(376002)(39860400002)(346002)(54906003)(186003)(83380400001)(82960400001)(41300700001)(38100700002)(6666004)(26005)(6512007)(6506007)(316002)(6916009)(66946007)(6486002)(44832011)(478600001)(2906002)(8936002)(4326008)(5660300002)(66556008)(8676002)(66476007)(86362001)(2616005)(36756003)(966005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2Sw1i7FQP0rZs0IX77yUZsY9AQkwDoS1JI0XgYDbmk8XNRc3Pxor/UyWALKb?=
 =?us-ascii?Q?i3qxjTzLbtDhbWZsEGtOMco712Xs64+Vtlesp9pQrRf3n60C8MEcMksedJVO?=
 =?us-ascii?Q?vT4z45WARkiGEnXCRsYGBp+QOfRZ48XF0cV9VC0XBnOKaTYuVn7hYChR0fxK?=
 =?us-ascii?Q?EogML8fSrNLt0dn7xi6Wk0fdLvOV/pEn5LemCNmrf2UdZ3EiLfkm0WVRCFQt?=
 =?us-ascii?Q?0REtrXf2oE/u27nrd0Bzk/96pxHpOPYDUOrTRtgJRr3pd3LByhLlgmku6ne3?=
 =?us-ascii?Q?11SvZpxLiz9ptxHFnDAAnaQja7DTFsn48veP27qP6yZDh+n5GbtqU5rl3JNE?=
 =?us-ascii?Q?dAeQ0M4IAXOqvHPRqdK7KgrjzSoGQeYiXvItDxevjka4SQJk7T3X68p4G/f9?=
 =?us-ascii?Q?jPfRycb/t6uS8P7qj7BVRjNZRi/ywFfdeDBQrrsyQ7e8tepJJp1+oaBoyb9q?=
 =?us-ascii?Q?INswu24an/RXSQ10OFVmJ1QEoEZNzb3PPi3EPAyv3S2C8Hlq7AYbW8XWaDec?=
 =?us-ascii?Q?NaFhlH8Ss4DWXXBiD3D5Wt1xM2J7pnowFjb62/fEoNGljvo3bxpMThZMPhXe?=
 =?us-ascii?Q?ijckU/SQb47c7KDlK9t/bfjadynI7SkMtXp+ODx5/KtGN0WUVY9r9vv+OJbD?=
 =?us-ascii?Q?cgl/XBY3bFM7RoevLc9nYjSYPrGjgOzjI5FgoCHZ7sDG6k0E7tO4Qk0QrgjL?=
 =?us-ascii?Q?r9xt2kVt7KbCUNSSTiBL29/jhiOmIMK6IllOHD7J3BdnBwmi1IG9jBr1SC9M?=
 =?us-ascii?Q?cXC5pAyen0k9i3E/ox4BvMra7lZI6hoXi+gNM4lvc37XviTVclfu/DzWpm4e?=
 =?us-ascii?Q?SnbI7w3uKNaolpULIYKMj8YVCoQFn6q+gYK6U6dOScWfh6d9yBz00E7Tr633?=
 =?us-ascii?Q?GM7Bo41W4Foiu7t4NXSU6hijVg5a67H6JfN7vUgMg4B+4kP89zzdlCeo8oPL?=
 =?us-ascii?Q?56LJl6cy+u6txMlJe2XIabWwlWdPtOoDV8TSUfm2Xvya0YZZI9jBgZ6LJiFJ?=
 =?us-ascii?Q?iWweAwn1kn/7XAOOdoPNUaR12A1FB7F0WlATMEaPlzUI1hRlrm7E6fsFTxEh?=
 =?us-ascii?Q?m+sUw+MbU7k3asyVJ2vcuLFlPyDb75gbV59OMwQ6zN1QFN9QN0tqYn+jQM9a?=
 =?us-ascii?Q?D4WIbqz6BgO6kdlnmfFPM4dRKj8mLqb2LsxSxgwYZxrdnNEXVfhEU5T4kVci?=
 =?us-ascii?Q?tD9X9jDlRRVmiEP64CTRNFKMnfukgTsGZBaAaUKiSqYuQJqFz170DmmFKMHE?=
 =?us-ascii?Q?SfiUwvO0ZH+B3U9VuxdfbAerEW2R7unKnW60hiO6uzACxRU09C94MKHn09vE?=
 =?us-ascii?Q?bUvxtHqgQ18PozCn38jpagYezggZF/pJbsdyyJp/Xqobap6lbuy3P6PoEAop?=
 =?us-ascii?Q?n7L9kvVQZVdqLxUQSZaK+woPEwblsH60W9DpPl7tQ9usPfmjffGYkj77guPU?=
 =?us-ascii?Q?mBOjZovV3fpAYa+HRLyoVkEpiw5XO7KXjCKAIx3N/OfoDIZ0OuzGuPzw1L3l?=
 =?us-ascii?Q?hrGazf0hZa33y11gW+2MaGnJoun3ebwqmwRLXgr+wWhCpr3QPDa3lvzTlnAc?=
 =?us-ascii?Q?qsdEDw8D6IQfYnt2u1eWdiqDrdmpBnLaGCVUTENnetPY0HjoSwlZquPWGSQZ?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc07a4b7-e819-48c7-ed5d-08da66aa6271
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 21:38:41.0640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOJPJSVvISkhpCFi9LdxU/hdxMV36NLVcDWPb14vlvNqV+GFcH3afz35ximaM2EAMcBWOf8gVVEsWZ31PLAcfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4707
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:12:01AM +0100, Mauro Carvalho Chehab wrote:
> Kernel-doc dump_flags parameter is missing at i915_capture_error_state().
> Document it.
> 
> Fixes: a6f0f9cf330a ("drm/i915/guc: Plumb GuC-capture into gpu_coredump")

Why the fix here and not in the i915_vma_destroy_locked one?
That was also a new introduction. Should we bother with the Fixes
anyway since there were many broken already? And if we do, shouldn't
we add to the others?

But anyway, just trying to understand the differences and reasons,
because the patch is correct:


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>



> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/i915_gpu_error.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 32e92651ef7c..7790f97b26db 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -2096,7 +2096,8 @@ void i915_error_state_store(struct i915_gpu_coredump *error)
>   * i915_capture_error_state - capture an error record for later analysis
>   * @gt: intel_gt which originated the hang
>   * @engine_mask: hung engines
> - *
> + * @dump_flags: bitmap flags. When %CORE_DUMP_FLAG_IS_GUC_CAPTURE is used,
> + *	dump engine record registers and execlists.
>   *
>   * Should be called when an error is detected (either a hang or an error
>   * interrupt) to capture error state from the time of the error.  Fills
> -- 
> 2.36.1
> 
