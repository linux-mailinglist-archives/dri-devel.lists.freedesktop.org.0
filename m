Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A3A4C93A2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 19:56:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAD310E72F;
	Tue,  1 Mar 2022 18:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4F110E72F;
 Tue,  1 Mar 2022 18:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646160957; x=1677696957;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KiYPc5CVJnTri+4jbPVZJWw96F40gwH7dwYlL+D68tc=;
 b=PGSPdtvHC/80USQihREGuwCVpfbdpXiW3bXZ2A1D8hECIJJ8+V4j7Dk6
 I+2tpx7wvMLavwuavyryQivR8qxzR5l3sM50sDdXwjxsINAEZXXkKGJZH
 VapUY+mrRdDy42rvFqXo98o8O2wcUZ8vWeOSkigRxaNs5GqBxqTvdW2Mi
 1VjTCmGAA1dAOlB90buApXXI6LN7fcrNIO1ewG0e2ISOoJR4xsM4ziZ+U
 zGDPOe4JosiHnpXj/5CIH8ZHvdJIlOYUpzaEVxavaKLKrErNuPLM1wx/B
 Ebrwck9HslZVcd3UTotLJfuU6f+pve13TXpGYeIKQC6ib+NTnO9ka80TY g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="250792486"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="250792486"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 10:55:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="535015584"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 01 Mar 2022 10:55:54 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Mar 2022 10:55:47 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Mar 2022 10:55:47 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 1 Mar 2022 10:55:47 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 1 Mar 2022 10:55:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SB9lSq/F3N87MyZCI1zKagTQoR1wj+0Fw8J8Nf9QJXde+mwR5yulGdhbDrU18D8+wiuvm2q7wR1zgi5o5CxFZfsT0MefCEgnmgA4lmzMIeGeqnM2v/f+4vslNbe9U1kCTtk2+m5RbEEiZ0jiLUcpn7FFvT0KqKWaZzB0xNGkIwFcYJlAUgaWT09VBTQjAU1ce8dtMpAqqHj2JHzLM62OlzWQ/LeVZaiI2jb9J8ITq3Z3LD0O3CFLbiK2eLcOenSI0qjZccwCkzUwaj/4QhVPHYpo3ArXzwFAjTB1x2i1bZ9zGQSBoZnRG0+rDwawdu7ruNeTkGNNA/8FwKlx1E+4rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPDdS9EKx0epQVoSbY0be52t8gOZY3Yapr9V6+GqhBw=;
 b=NAkWE0NQFKC0v4cDFqumXeoVQRWPQH7MWyM7P7vFN4FuALiJuvF1yisvNG87R8JkIuxzs6egb1p9oOUOUtJFPvIGxwgcCMTDSV44HdaKHEe1mygSPXnCU+vGIFQU0nl9HxdTHtCqaskDXv/aNEdO8U2JAgAyESnCxaY9/fboWwzbGMcO4NoL3nffb3fW5DLRoXGy3QOu3pVfc3wCS8N9Awlq2EpfitP8kVTtmcJJQDRnhwJ8klaWRNIMc0jGy/WZ/lM3Yw2Fw3+u/UnoJXnT0s4sQwzuYBdabOweK4TnVTHAqWbV7UFJp5kk72bGctitHWI10yw7484Zdj47HltSWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 BN6PR1101MB2209.namprd11.prod.outlook.com (2603:10b6:405:50::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Tue, 1 Mar
 2022 18:55:42 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869%4]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 18:55:42 +0000
Message-ID: <055877c8-b99b-e8c0-d56b-c02ffd9d15c5@intel.com>
Date: Tue, 1 Mar 2022 10:55:39 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 08/13] drm/i915/xehp/guc: enable compute engine inside
 GuC
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220228174245.1569581-1-matthew.d.roper@intel.com>
 <20220228174245.1569581-9-matthew.d.roper@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220228174245.1569581-9-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0165.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::20) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78ed5112-504a-44d9-00cf-08d9fbb515e6
X-MS-TrafficTypeDiagnostic: BN6PR1101MB2209:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN6PR1101MB2209073BB50471B80344C774F4029@BN6PR1101MB2209.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EY0Nb6VBYYZZUojIIJyPufq32V+4Fc7jTOnEHM6jOcKyyVJJLYufUuVPsMRt1Q4FFFH1Z85389JYfALr+YA2YpEvFUnWoSbMwv1elvAPBU6jUQOBHcClOFMVJHWLFOPoYgwEhb+CXLSiE43slU1DHJfRvBIk5t3jq9qOAX//NR9SbTSJnhGiwaZJj9tubSkc0+UhtLfv+fdpG6JS9PXnLzt063fM7Us3GoZQ3rOYfUBdDxBwP7kgsrd9X2YlYYvhL0hMILgVPdKlB2itPytJyzsx5OqQ3EuVqd8wO56D4i43Ks+XNN9NIu6kQAW7ptEY49fcKbaK9JRxcMEaxw6ftwtASTwnW4mQrPU6cQ4l5fQh0CH7PfWrUsR4RpN147vVKlveL/77l/fB2P9W8nljkNYfdBOHWaH26moJkXfbaf1ctEmdKH1nJ6od8Cdgrjjh/1UZw6RXtU68owNJLElEl8bwQHZV756MQ8rZCOO/CYK70XtUbot3allAlNojEFcEIJh41nRJhjHN1LpubOc53VyfWI47bnjVzeMGjhTYApwvo9btn2M4nanINDFoJiJO4Nl6Z7ehlPqVK8UeSjfwfRtjgyRsVY+Iedjsvym2a7Lg8Km23IEvY/z4uxsZ9dLO7b6gHy2eF7pe2VJJZXVwM6BR2397jdJZywj5wyTj87rbn6uD7EWIMcKffP2XbeNLiHW6SJtbEaWqP1GLeryOVRV/HsJL18D7TwJV6FsogSgfWDwmeQ6ssJXGHdLwavMd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(38100700002)(31686004)(86362001)(53546011)(2616005)(316002)(6666004)(6506007)(6512007)(186003)(26005)(83380400001)(107886003)(66476007)(4326008)(8676002)(66556008)(2906002)(31696002)(508600001)(82960400001)(66946007)(6486002)(5660300002)(450100002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEhWdVkvbExUM2FSVU1xRmkvbElJUXNDRmJIWEpOSUhPT2RrUlRuODZzZGJF?=
 =?utf-8?B?Wk1yWGZvakE4RncrWEZxd29DQnpEaW56NytBS2VYa3hLNS8zTUVvUnJrQ1JU?=
 =?utf-8?B?SUlNaW9GaTR4TktxOTBkLzdCVUpZbU1RYjhlZlBKWVJGYkViQ0pXbU9WL0ZY?=
 =?utf-8?B?a1B6cFIrbDR0UjFnSlcyQXhhTGVvZU5mSDNsNUhXYmFqQ1JDdXdEd0kwVGdV?=
 =?utf-8?B?UE9sQXp5bURwaklMUHlqM3JrUG1EbnJTZUw3NDhMQ3ZzVDAzMHF5NVdEUU5x?=
 =?utf-8?B?MmNlWGcreFE2Z2NzejExZW1JL1FtOGk5eUlrRjVjV3FTMG9Wckd3azNzQnc4?=
 =?utf-8?B?bnQxc2oxN1NWekQ3SmxoK3Bwdkd2a0xUV2VaVEJBL0NiV3F2bnl5V29XZ3NL?=
 =?utf-8?B?L2hqNFBCYy9yVGNlU1RTK09tMVJrUER6elBaeHhNbUhDMm4yaTFhQ2tJdWhK?=
 =?utf-8?B?ZkxsRFVBc0poRitVVkZTR3JWblJJcU5jeG5SdGhLM05UMDl3ZmdsMFVQT1hI?=
 =?utf-8?B?SkgvS2tLbHRzYTIyWEVTb0xHNDJ2UHQxN2E1V1B4dHU3NTN3UVRoTExpQ3Bk?=
 =?utf-8?B?Wjh0UkRlZ0dMYjRSdG1hZUhPdW9BakJSTTBhM1hhb205NmxjVzRvenZUZTdw?=
 =?utf-8?B?Z3BzTlNuQzJxWUJLMTFtQ25qcU5SMXpTVVhvUVhKWHFRRXlvU3FjOEk2U2VJ?=
 =?utf-8?B?dzJwN2lmV3p4VkZCUitBTFhsT0c0Um03L1N5WkxoSVpLMC9jOHBybXhiNGdJ?=
 =?utf-8?B?TFlKdWVRWDZ6S3NQZExQbkhhOTFxdmYwVTFzcGF1dDdRV1Nvbmpoci9VN3RM?=
 =?utf-8?B?WFNMRDg3WWU2bWVEYW04aWlvRElEcWJ4cm1wUWJTd2JPODVMb3RvdXoxaXJY?=
 =?utf-8?B?UzBlc1BSb09EN0Yyazg5MUxFNGdyS1A2TzRoZDdzcVlSclZTTlZrc3pmYk1E?=
 =?utf-8?B?QlRuRVFjZlFKamwwL0lyWC9UalJNQVBMVDBTUHRrV3BSYVFkdERYL1ptbFIv?=
 =?utf-8?B?Y01LcUM0SWk4YjlLQXB2UG1hTUhFVURDQ1lIdkxhTjdNdmp4MGRISmk2QjBs?=
 =?utf-8?B?WCtNNDR3dlJVcGZGelp2NG9qa1FXcWJZWWpVbUdqRVNoMkowRXVnaUpWdjFT?=
 =?utf-8?B?ZDZibUhxb3hvZFRGNjFXK1FxSUsyRmt1bnBiN203ZmVLbmpndUZpOEp0N2o1?=
 =?utf-8?B?MUkvUjZETDhWcjJYVVZEdnFPS011YnVQRFE2OHJ2TUwvMWFPbWVoY01xZkZU?=
 =?utf-8?B?bWo0UjNveCtUQTE5UTFRb3FrU3oySTNJeENzY29VWEVIMktISHowNzdxTFJG?=
 =?utf-8?B?aFIwdzlPVDNRaXlOTVZtb2lUQVVZZXdLSFUwUEpHQXcwSjJNQ2JnaDZPcVYr?=
 =?utf-8?B?UGdsZXBpdC9qcERaTmZxZURneUJGNkMyQUVZenI4aVBoU2V6MGUxZDRpQlEr?=
 =?utf-8?B?MnE3VWtTMktDSXdIb1Vzci9vQkYwU2lFOXR0SUdMSDdaQmMwRzdPSGM3dnVC?=
 =?utf-8?B?ekw5RWQwdStNekU0N20wNk5zcUgwRXFxYUp3c0VzWi9UbmJSMU56aDYrY1d5?=
 =?utf-8?B?TUZrb2N2TEFxZDZyd1FxOUhHNGpqQUNFaTRlT2xNdEdlNnhHcnRCVEhPeDVZ?=
 =?utf-8?B?VkFEUGRQRm1oazZZUEFDQ1dBRlBpcnAxdEsyZ3N3a05pUk1MTExKTzhFcGd3?=
 =?utf-8?B?ZzNmMVlyRm5TMzVTc20xRnorbW5zbjR0TUhtay9xQkxzZDZoQ2szZXlvQWRi?=
 =?utf-8?B?L0orNHBPTWJpRld6M2grSkZ5U1NIQ09KamF0UnpaUld6TWphRzUyYkFqRG9y?=
 =?utf-8?B?Nm9FWE9MUmlNZk1TWGIwVGtxLzdqSkF4Wm1ienEyb1EySHdLN3poNEFoUE1F?=
 =?utf-8?B?K05GdmxkZUU1T25adGpORk1BR2k5enVGWG4wVE9mUzZtQnkvRjFURGVWVHRj?=
 =?utf-8?B?dnpiNXJnNzlJQ2Zrdk5sUmJTcUVnemtrdHNqZW40NkxBbWRFVDVJbHhrWlh3?=
 =?utf-8?B?YmYrbDdvbzA3OU1reWJyeTc0cEtFdXNzcU1vejh1TkNvSURlc1hIWmNzRm1L?=
 =?utf-8?B?VVVwRGZGS1Vzd0V5QWE0NlRVQkhtRHJ2b1FBSWxGdmJmWXNTYVBvOEhsdThZ?=
 =?utf-8?B?Z1lqUE56eDR3OE9LNExhcTNwNldFMXlJTEVxRkRVZm5LaFFuRG5KcXRrSjE2?=
 =?utf-8?B?NXo5SHBBbUY4Ri94akpiODBlV0lWdWE4RVRYY00vek1lZW9xN2tSTEltL1cy?=
 =?utf-8?B?VjVIN3pzMFBadytEZ1daVHljZUl3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ed5112-504a-44d9-00cf-08d9fbb515e6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 18:55:42.7339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iOOkbrBAQIhATlEqoCYUrG6BM1YS3ab0akooKPYcPFFU9UPC7rJGmaU+Sx/9Wcve/eM7VEMXzk/sEHzO7DVOunubk3PYdtWOoqBGGinmWEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2209
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/28/2022 9:42 AM, Matt Roper wrote:
> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> Tell GuC that CCS is enabled by setting a bit in its ADS.
>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Original-author: Michel Thierry
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h    | 3 +++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 5 +++++
>   2 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 84f189738a68..e629443e07ae 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1327,6 +1327,9 @@
>   #define   ECOBITS_PPGTT_CACHE64B		(3 << 8)
>   #define   ECOBITS_PPGTT_CACHE4B			(0 << 8)
>   
> +#define GEN12_RCU_MODE				_MMIO(0x14800)
> +#define   GEN12_RCU_MODE_CCS_ENABLE		REG_BIT(0)

Having the definition of this register in this patch is a bit weird, 
because we're save/restoring a register we're not programming. Maybe 
flip the order of this patch and the next one and move the register 
definition to that?

Daniele

> +
>   #define CHV_FUSE_GT				_MMIO(VLV_DISPLAY_BASE + 0x2168)
>   #define   CHV_FGT_DISABLE_SS0			(1 << 10)
>   #define   CHV_FGT_DISABLE_SS1			(1 << 11)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 847e00390b00..9bb551b83e7a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -335,6 +335,10 @@ static int guc_mmio_regset_init(struct temp_regset *regset,
>   	ret |= GUC_MMIO_REG_ADD(regset, RING_HWS_PGA(base), false);
>   	ret |= GUC_MMIO_REG_ADD(regset, RING_IMR(base), false);
>   
> +	if (engine->class == RENDER_CLASS &&
> +	    CCS_MASK(engine->gt))
> +		ret |= GUC_MMIO_REG_ADD(regset, GEN12_RCU_MODE, true);
> +
>   	for (i = 0, wa = wal->list; i < wal->count; i++, wa++)
>   		ret |= GUC_MMIO_REG_ADD(regset, wa->reg, wa->masked_reg);
>   
> @@ -430,6 +434,7 @@ static void fill_engine_enable_masks(struct intel_gt *gt,
>   				     struct iosys_map *info_map)
>   {
>   	info_map_write(info_map, engine_enabled_masks[GUC_RENDER_CLASS], 1);
> +	info_map_write(info_map, engine_enabled_masks[GUC_COMPUTE_CLASS], CCS_MASK(gt));
>   	info_map_write(info_map, engine_enabled_masks[GUC_BLITTER_CLASS], 1);
>   	info_map_write(info_map, engine_enabled_masks[GUC_VIDEO_CLASS], VDBOX_MASK(gt));
>   	info_map_write(info_map, engine_enabled_masks[GUC_VIDEOENHANCE_CLASS], VEBOX_MASK(gt));

