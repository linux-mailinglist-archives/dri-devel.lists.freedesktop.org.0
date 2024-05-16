Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBB28C7D7B
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 21:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312E210E3FF;
	Thu, 16 May 2024 19:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QoqOqfHQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE25610E3F7;
 Thu, 16 May 2024 19:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715889127; x=1747425127;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=O4VK1nT1bwyjEN3K+r0JMr1enTI4JYRe1HsKigzGZSg=;
 b=QoqOqfHQSwwvVnFe13emN8tIrD89Xcj1d2zn4zSEgI1a13Q2u2JmOppq
 zFgDLl6sDf3lBFO7bMaHnU3EebdY0Lqp+hHpoHIEXi5EVDA14dSApi4FM
 mICJIOVL57mVmRlEd4tpC3lvHapxpTgMIOeLKFT2C5yEpireClJidwCsD
 1EX4cm8zqwxpnYpHr0TXOuvEa4r++LD9qH0R6/pY/H5mNxVs+3DQ2ybBj
 EbMi74/ch1ns+4TEPoRuiYbG/qBzTzcFv+j0dl0FinOTPTPyHw0EDL/in
 lXvPoW56dWo24tKBeydB5idioSR3I3pwrwva8Ie7fXNhILh7CbtrqS5qq w==;
X-CSE-ConnectionGUID: qtIdNqFTSpSmm2E6ELCUcQ==
X-CSE-MsgGUID: VnUKO3RwQ++4BqMidNAWEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="34550265"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="34550265"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 12:52:06 -0700
X-CSE-ConnectionGUID: XwQWzdEUTde5x8gSJkCcNA==
X-CSE-MsgGUID: i8wMz8FaT0mw+TXyPTapsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="31372890"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 12:52:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 12:52:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 16 May 2024 12:52:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 12:52:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzeYwpX9ds+drJGEg1DZit3GCtoblmT0yerElwn8jeRc2wjPWOagFRPElEf3Tbxsf4Mkq74altBMSTB3xnao01UfVvyqfAv1EjGd1nfbVHOMnHHGf5dqFCejgF1BldgPpdeucSsfJArf/xn9FhXENDC7I3FLn8xI52YcpX7p1R5S/exV6aju9KdY1F2yOPLHTl2mWAmBlZoQtzQmE4DQhFdqkoLL8ifJ0mEgQ/Ty75lAUjpwQ7fO+z9SMyUbBd6Fz97SpE750p49ageOMFha6YCH/+4I59pH9EB7z8kLX+FpMDYTcywaWPeyrII1NPxf/I8qqVcvs5f8kHPA3JxsJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceR63/2e8OZMUdEHtcw2xeRxfgB9Uvz1Ol+XsBpr40s=;
 b=gczxamzKmROTD7c8aotWTjGoP9Vp3p/lWUKGJjE0twLXlent7vQz4kqh8h5/E3JdupLxzj0sYJSgNTTS4Og0N6Nt8y33wIoZ9Wfxn6bRL6Mn0wSpN/V9I9OYiDWi6cX85Qf1Uwa1RgMfnbh2/cPwyRYHdE9KK3E8LP0dCbPW7CDmJAVgy6X7RNmcODsK9SXIaKWgEXjRJj3vKQm8yIOxe5gR3Db9fQdK8B++8mruH7BpVvhoigozG9MA0pScxfH2x4k/HAV3BuppFev5FgiVcGCSh7PG8KpvbGfC8J9a2lGGiJJNykXmHs0MuZGu9iBEytjYL+HXocdBHI95bHhcMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5131.namprd11.prod.outlook.com (2603:10b6:806:116::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 19:52:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 19:52:03 +0000
Date: Thu, 16 May 2024 14:52:01 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 6/8] drm/xe: Cache data about user-visible engines
Message-ID: <ogiixrymyf5t3tvmm52ltvm6a5erz5njgnuuwuxfzhitw3y6me@okrskpnngkoy>
References: <20240515214258.59209-1-lucas.demarchi@intel.com>
 <20240515214258.59209-7-lucas.demarchi@intel.com>
 <ZkZRkhrAZ+0K6MZe@orsosgc001>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZkZRkhrAZ+0K6MZe@orsosgc001>
X-ClientProxiedBy: MW4PR04CA0104.namprd04.prod.outlook.com
 (2603:10b6:303:83::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5131:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e60ca92-d3b0-4107-ad45-08dc75e1a88b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007|27256008;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TsRYT4OrH9uoGCcrdi8GqPVxpPAoC0ixDpT4wosD8t/D6ab3tdsTz3LiNBC3?=
 =?us-ascii?Q?Mwx2X3wUC7u9v8WcVe4BJb4rK8tZituJkneRO75dhAUzMXr0svy2j7xXGLZf?=
 =?us-ascii?Q?yGORObAjSjxCsRGpk4YnhRKCxu+griZrK48kvCNUqCb33jdIdar5gJFnqBFj?=
 =?us-ascii?Q?QyndRpumRPIFjXZw+ZnjJedogRG0/SMyv48kEgiDg/0IUuIX5LcnpDxu4aKP?=
 =?us-ascii?Q?oteoAPPXnKeEnDR1PqKC0963V85KJlcf+h5xEBAnFrTxEGq1aib0Hl0BLyf7?=
 =?us-ascii?Q?U3isN27nnjHr8dkARNKc5fZ/HTxQxinzBy5y1VY0tCKMcvOQiDbQeBjvMNOw?=
 =?us-ascii?Q?ymStHUn0GGcN4+wlr4NKLLPzvEhw6ap4UVGkMtbwzXzbNVEbqrlkot2ib6nV?=
 =?us-ascii?Q?LEoet94SN3XrhSdTTaFwW14tVLxWpEGKUonT+d/2PHntVzd51vYQXnyk2N9W?=
 =?us-ascii?Q?6125s4IobnSBt2ZLh/OhoPukvdXA+oI4/SkVrOyR9rL3+oRfc7IvBBSIpcJR?=
 =?us-ascii?Q?zA4CuR7lNDKgEhLer9bIHDBhPzaiM1Hc1B5M2v1/Y2pXIxrqgKY4LeghQg2H?=
 =?us-ascii?Q?SuvAryflRElLCOP9fH3fCGedS8hx+WtaWIAp1/vV7OEH2aQA4i1lrUNW1+Dx?=
 =?us-ascii?Q?ujCsXIlI1mnDrbuFf0vDOWMLFxilBSDrKqF0GGG8Ask/+aUwTs2lykDXNTa/?=
 =?us-ascii?Q?ONV7AbIziaIycD+MFG47z33BDVGk9JhjdkGGdxhqzvY7Vlw1YaB2YIKLGyh6?=
 =?us-ascii?Q?ILLRV3zKM8tHAtZcyTb9qnvzbpqSYUvUJIUpoERetODrEaLn1Kq2DXcCfGsq?=
 =?us-ascii?Q?o8dS1cgMNqWKFZuUK+28PeiuVDHl6AM4XnzTQEdmzCYiS1qKNM3Yde1FCKna?=
 =?us-ascii?Q?eWWuNklPuiw7ih8+lF9qcJZ9OKTZ/g9ay904JCPywuRP7tBdHa2mn/chWMYt?=
 =?us-ascii?Q?RT2flakWMgVq2LDu9kg2hK4/Z0vgH9YFHovV100oTmryERo+HEcGw/kzqvj2?=
 =?us-ascii?Q?+fTlTSmpDLs0N+7CXhQ5oQph360PX+GpIlVBryHiY+S8iW9pWD24b495w+bg?=
 =?us-ascii?Q?U0K951QEPEEidU9FmYQ9/YG5NJAnIJvtfegbjA6zaANbOB0vHmvPOcByy8ny?=
 =?us-ascii?Q?RLuZs1tIw5OqisuteIk99kN5i9v71TDiL8XXoJfc9Q6d/ivBlvDNreNaW1eb?=
 =?us-ascii?Q?r+GE91Ma1GO5PuZW71Caaqt5wr3RX6paEaHlyOl2AyRX7x3WGly8B/w6R5WG?=
 =?us-ascii?Q?KX9K9Ro9DyiuTRD8YaemlWCawTbQwQzbAV0Y0MinZCK9R6+yAEHtLTwy/bsm?=
 =?us-ascii?Q?Z1aU0syOKCURauZzikmMCHp4n8WmlEFCHnCQjLob4gVjRA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(27256008); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LLjV98JsI0qGhH/Opx6R/Y0+N9jZ9IJhmOhljbBUqt/zmsRhp/rN6x9aR6Ye?=
 =?us-ascii?Q?q2Bqtj7Y33ss3ozumf1h5yjnoFqOiTAVvTEnUuKkq9VRAVmKrK6xJpbQxpz6?=
 =?us-ascii?Q?Pe1Dm5VYxiHf7auBZP6Qh8oanIu4ZsUpLyNLqsOsGZ1Mcevyy5K54/KWevdI?=
 =?us-ascii?Q?ox/NCFOgwhM3VaPUdIsPedyUyORjcckofpZp8srSi/7hlK5G0mjLpwmGiTCp?=
 =?us-ascii?Q?Q4OLWp30qQzM/mSP9ibxlFUbmN3cy0GOFvwXaf3sysSssiu6hqSy6Op6zGf5?=
 =?us-ascii?Q?xt1NsTf/EhpHIJOZYavuWhtQ5viqW8WB1H0LxGpieqhRSsLy8Em73hFSGugE?=
 =?us-ascii?Q?OlSFkuX1NgGnlCf+3ASK0TWRNOFjVQnHf7c/80oYtBlcfp1dwIlJXYvTc0gj?=
 =?us-ascii?Q?98qFfE2AIIWj1r8SWXK2ofZBE6PWSYvOhXUOfsaA08xXx14T8N0WgxtTcVwN?=
 =?us-ascii?Q?7HkwPr6nox6fGRqmnc/02YkxkpFiiSzo7VQdFyFZnaMZkw9nAAKrHBxxWxVh?=
 =?us-ascii?Q?MHMqXX8slfovUjETwYK9B9+hoqCO55JcqQOiMr/4MhyTZR4/Xen37feyX9Cd?=
 =?us-ascii?Q?LIpyEQIjYdj8sN0xr26TzTyiPSVrZ+bb6hsSNC9l5T+VDtpJedksQjGZOa+r?=
 =?us-ascii?Q?9ARpCwE5XoUL6ZIadjyqihzuBlOsazv8wPlwcjoF+81OjT/1+wVg6i2EYD0F?=
 =?us-ascii?Q?S7sUVHKSr9SG6pyLam4TS9MajhyCrtaUCYF4xRtM3WYj70g5F+C84+Jf8IkE?=
 =?us-ascii?Q?zE7zRo6vnn0wSaxLcWlBjwmJDPF+HSugO/QUOS3mIbTqTcA4pJtmLrjgYDRv?=
 =?us-ascii?Q?ulOHdhjas/CfwpTvh+sGjVJMtjL8qv6G8jCA7aBZaEILcQyTjxk6gObVGUDi?=
 =?us-ascii?Q?vjenrDU+Cp1QZKLlG1PESsm26/vtMUYRnHb+TfjjLnOl/+zWhtvcHgTVy+y6?=
 =?us-ascii?Q?DYB7RVjccnDKiSYlnnZsPJAAj1dShUPzoh6HFNGdifkp158br+xn5mF/NP2v?=
 =?us-ascii?Q?dZy/Kaj2kcra2WVlI2Rd0dQFNsJVq1bVttQBBsCnrzaSMBqTJlqU9MdmT3qo?=
 =?us-ascii?Q?kvSoRBci3J+dxJgkLJm/v/fm0UmUYex2fIoRw57Yr8/u60B1Yv1Jmssyxz07?=
 =?us-ascii?Q?cYau5p7/Sr/oQggkXVXxZzAfQ545exXDNnUsiIafwi93cHtJA7npG4URqUZe?=
 =?us-ascii?Q?3Y+HNzWVuWg1qcC13d9PzmutmoLRVSteM4NXVLfmqwzqPjZSs31HF/kADKeD?=
 =?us-ascii?Q?ZYM7BA3Y4/NCXAzlYRGwPKZTmewRD53o0GVhRwoDoaz8/udS8bchfFshDIKy?=
 =?us-ascii?Q?LqlN30DEv0k6jdPqWpII+7e7x1Q2V8wRzTNTudDbcK0CC5SFBYDzibjTQq0H?=
 =?us-ascii?Q?RU++MDLAjWA7XLsfELhP4qjDv9y4W7Gi45Tf/lLK2VwbD1iF6v7EUJqrrm1p?=
 =?us-ascii?Q?3nTFqiZmCJsdp6yDPHxbJIczp6CQ3nZ7y9KrWSiCVzF70NeRmcHYZwYAI3j4?=
 =?us-ascii?Q?cnDHpKmrKADF6aluutKW27DwdEoS79Wbuevlxh4HR5gAB8XMhyRoqpYJpwQD?=
 =?us-ascii?Q?CmEqYNV7s8P3BKzJwHB7SVUjp1axWE6cv+M8zbSnD28jzPANf7C8pa/pyASE?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e60ca92-d3b0-4107-ad45-08dc75e1a88b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 19:52:03.7383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gUIrprUTV6s36kboTX1Kqe33MDDrca4Fb1cZSLRjdw/KY5XV+mg3ZmQWAOGGxZa1eGkSG8i5Ew2VfDzNXPrjQACA4C+iq6upmWTEYJEB7YM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5131
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

On Thu, May 16, 2024 at 11:33:54AM GMT, Umesh Nerlige Ramappa wrote:
>On Wed, May 15, 2024 at 02:42:56PM -0700, Lucas De Marchi wrote:
>>gt->info.engine_mask used to indicate the available engines, but that
>>is not always true anymore: some engines are reserved to kernel and some
>>may be exposed as a single engine (e.g. with ccs_mode).
>>
>>Runtime changes only happen when no clients exist, so it's safe to cache
>>the list of engines in the gt and update that when it's needed. This
>>will help implementing per client engine utilization so this (mostly
>>constant) information doesn't need to be re-calculated on every query.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Just a few questions below, otherwise this looks good as is:
>
>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>>---
>>drivers/gpu/drm/xe/xe_gt.c          | 23 +++++++++++++++++++++++
>>drivers/gpu/drm/xe/xe_gt.h          | 13 +++++++++++++
>>drivers/gpu/drm/xe/xe_gt_ccs_mode.c |  1 +
>>drivers/gpu/drm/xe/xe_gt_types.h    | 21 ++++++++++++++++++++-
>>4 files changed, 57 insertions(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>index e69a03ddd255..5194a3d38e76 100644
>>--- a/drivers/gpu/drm/xe/xe_gt.c
>>+++ b/drivers/gpu/drm/xe/xe_gt.c
>>@@ -560,9 +560,32 @@ int xe_gt_init(struct xe_gt *gt)
>>	if (err)
>>		return err;
>>
>>+	xe_gt_record_user_engines(gt);
>>+
>>	return drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
>>}
>>
>>+void xe_gt_record_user_engines(struct xe_gt *gt)
>>+{
>>+	struct xe_hw_engine *hwe;
>>+	enum xe_hw_engine_id id;
>>+
>>+	gt->user_engines.mask = 0;
>>+	memset(gt->user_engines.instances_per_class, 0,
>>+	       sizeof(gt->user_engines.instances_per_class));
>>+
>>+	for_each_hw_engine(hwe, gt, id) {
>>+		if (xe_hw_engine_is_reserved(hwe))
>>+			continue;
>>+
>>+		gt->user_engines.mask |= BIT_ULL(id);
>>+		gt->user_engines.instances_per_class[hwe->class]++;
>>+	}
>>+
>>+	xe_gt_assert(gt, (gt->user_engines.mask | gt->info.engine_mask)
>>+		     == gt->info.engine_mask);
>
>I am not seeing a place where user_engines.mask is not a subset of 
>info.engine_mask in the driver, so the above check will always be 
>true.

that's why it's an assert. user_engines.mask should always be a
subset of info.engine_mask, otherwise something went terribly wrong.

>
>Did you mean to do and & instead of | above? That might make sense 
>since then you are making sure that the user_engines are a subset of 
>engine_mask.

no, what I'm trying to assert is that user_engines.mask never has an
engine that is not present in info.engine_mask. Example:

	engine_mask       == 0b01
	user_engines.mask == 0b11

That should never happen and it should fail the assert.

I decided to add the assert because I'm not deriving the
user_engines.mask directly from the mask, but indirectly. Early on probe
we setup the mask and create the hw_engine instances and we are
calculating the user_engines.mask from there. I just wanted to make sure
we don't screw up something in the middle that causes issues.

>
>>+}
>>+
>>static int do_gt_reset(struct xe_gt *gt)
>>{
>>	int err;
>>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>>index 8474c50b1b30..ad3fd31e0a41 100644
>>--- a/drivers/gpu/drm/xe/xe_gt.h
>>+++ b/drivers/gpu/drm/xe/xe_gt.h
>>@@ -38,6 +38,19 @@ int xe_gt_init_hwconfig(struct xe_gt *gt);
>>int xe_gt_init_early(struct xe_gt *gt);
>>int xe_gt_init(struct xe_gt *gt);
>>int xe_gt_record_default_lrcs(struct xe_gt *gt);
>>+
>>+/**
>>+ * @xe_gt_record_user_engines - save data related to engines available to
>>+ * usersapce
>>+ * @gt: GT structure
>>+ *
>>+ * Walk the available HW engines from gt->info.engine_mask and calculate data
>>+ * related to those engines that may be used by userspace. To be used whenever
>>+ * available engines change in runtime (e.g. with ccs_mode) or during
>
>After the driver loads, do we expect ccs_mode to change dynamically 
>based on some criteria OR is it a one time configuration at driver 
>load?
>
>If former, can you provide an example where ccs_mode would change 
>dynamically, just curious.

it can be set via sysfs, but it blocks changing it if there are clients.
For with display, it's easier to check by loading the driver with
enable_display=0. Trying that on a DG2:

	# modprobe xe enable_display=0
	# exec 3<> /dev/dri/card1
	# tail -n4 /proc/self/fdinfo/3
	drm-cycles-bcs: 0
	drm-total-cycles-bcs:   37728138157
	drm-cycles-ccs: 0
	drm-total-cycles-ccs:   37728138157
	#
	# exec 3<&-
	# echo 2 > /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/tile0/gt0/ccs_mode
	# exec 3<> /dev/dri/card1
	# tail -n4 /proc/self/fdinfo/3
	drm-total-cycles-bcs:   38260910526
	drm-cycles-ccs: 0
	drm-total-cycles-ccs:   38260910526
	drm-engine-capacity-ccs:        2

thanks
Lucas De Marchi

>
>Regards,
>Umesh
>
>>+ * initialization
>>+ */
>>+void xe_gt_record_user_engines(struct xe_gt *gt);
>>+
>>void xe_gt_suspend_prepare(struct xe_gt *gt);
>>int xe_gt_suspend(struct xe_gt *gt);
>>int xe_gt_resume(struct xe_gt *gt);
>>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>index a34c9a24dafc..c36218f4f6c8 100644
>>--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>@@ -134,6 +134,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>>	if (gt->ccs_mode != num_engines) {
>>		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
>>		gt->ccs_mode = num_engines;
>>+		xe_gt_record_user_engines(gt);
>>		xe_gt_reset_async(gt);
>>	}
>>
>>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>>index 5a114fc9dde7..aaf2951749a6 100644
>>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>@@ -112,7 +112,11 @@ struct xe_gt {
>>		enum xe_gt_type type;
>>		/** @info.reference_clock: clock frequency */
>>		u32 reference_clock;
>>-		/** @info.engine_mask: mask of engines present on GT */
>>+		/**
>>+		 * @info.engine_mask: mask of engines present on GT. Some of
>>+		 * them may be reserved in runtime and not available for user.
>>+		 * See @user_engines.mask
>>+		 */
>>		u64 engine_mask;
>>		/** @info.gmdid: raw GMD_ID value from hardware */
>>		u32 gmdid;
>>@@ -365,6 +369,21 @@ struct xe_gt {
>>		/** @wa_active.oob: bitmap with active OOB workaroudns */
>>		unsigned long *oob;
>>	} wa_active;
>>+
>>+	/** @user_engines: engines present in GT and available to userspace */
>>+	struct {
>>+		/**
>>+		 * @mask: like @info->engine_mask, but take in consideration
>>+		 * only engines available to userspace
>>+		 */
>>+		u64 mask;
>>+
>>+		/**
>>+		 * @instances_per_class: aggregate per class the number of
>>+		 * engines available to userspace
>>+		 */
>>+		u8 instances_per_class[XE_ENGINE_CLASS_MAX];
>>+	} user_engines;
>>};
>>
>>#endif
>>-- 
>>2.43.0
>>
