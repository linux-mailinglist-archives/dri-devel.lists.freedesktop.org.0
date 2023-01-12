Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1CC667C85
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 18:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5C610E313;
	Thu, 12 Jan 2023 17:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1090F10E313;
 Thu, 12 Jan 2023 17:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673544513; x=1705080513;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FkyNocVUsZCXsdDHXsb1cdf+K4Hv5y0cX91FrgZ4UKc=;
 b=MWJOEGh/sgQOBQ9YmQreodYiyN1MIVeejUUKjx0jGdaIdX0+eAUBfjlM
 op81COU5lh08maNtlP5LywPwVcrB1quIP7kQmOX0vycTNrRs/JQVku6QX
 k24i6F9Q/yrJ8r4ZpKtUFLoGevWfR5MR1KARZSa1c9lQFvbLFKCwXwMRy
 +GQKt4veI4pAFYtqJ/PNpg5yQqP00gyHYS4qCT1S3sPFBbmjSrIG4YR6R
 MNCInxRrhZ1iGbVoZup/pTmWyKN9bDNBApodcCYj6JPW9Ssw2eFZsYC7h
 hAczOiVu6GQ5XOV+YDGAOqREuqtXvhXP9SeoTskYkkBlCqKSBwEEAQavU g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="304147967"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="304147967"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 09:28:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="651241284"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="651241284"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 12 Jan 2023 09:28:32 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 09:28:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 09:28:31 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 12 Jan 2023 09:28:31 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 12 Jan 2023 09:28:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMBFmlVbcNgYOWPTb8mSJZpgQ8AKarnYAkgIEkfSmkf32AWdNGQbnS1CuL4VtHXr5qv51859z67itTwGrTUkHEU0EoufF6A2OykNc8XF4dS1BQDqPr9eb0cQP9EFrFkZehjdwT15eBsfJf5gGKCKx4yT+Srq/x9CgrCKhMb2XnzmABSPmYiy+K+hnsiM7PqI1IvLKHQP5MEt+HKUIFFrqkcfpDNcxfKhn9xKxKYZyxHbHbffyCRjSJCwYdCQMhg1nX3W0l0npJ7X0HDpg7kDubzBO7xrKb20QZfLn3bLiRpGdXdz4G9dyPuNzameHDW/gbH7Wh+Mf8uL7fL3JbGRfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ac6GLeFEaFlxmeQujZNLFvrdF26SweYLR34RGa/cNM8=;
 b=Kb6eGJarD+49zkEtSw6RP/BiFXFNXva4J9rkTB831zUuZagRjpvo0RxLvhURp75BR3TDgdxGE2CTeDy6RtEf9ATRZuseDjYQ2l4Yc0qCV6dBAheZLgSJ7fJ2bovcpr0vN4gjUkVl6BklqKX8K5Cg1QEajBAMn5hMS3WpLIs6JUnX465b8n+KekZjk5P0LidQjTczohxVizI/oN1sXM9l15XY8p959iv5dv8QvWZwpFfNyxI5RcYJclxjKbHAigmhfSWyRiYJv0NGo50o46phS+6sbItV0k7KWXitRCCNsM0jielekc5+LYCfBjbwwF2zVrEk6omqVOVUH0WuYGvmgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 BL3PR11MB6505.namprd11.prod.outlook.com (2603:10b6:208:38c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 17:28:29 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1209:b438:8e6b:509]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1209:b438:8e6b:509%9]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 17:28:29 +0000
Message-ID: <e4ff93f1-25ed-5476-e147-d70c93261615@intel.com>
Date: Thu, 12 Jan 2023 09:28:25 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 6/6] drm/i915/pxp: Pxp hw init should be in
 resume_complete
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230112003706.950931-1-alan.previn.teres.alexis@intel.com>
 <20230112003706.950931-7-alan.previn.teres.alexis@intel.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230112003706.950931-7-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0027.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::18) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|BL3PR11MB6505:EE_
X-MS-Office365-Filtering-Correlation-Id: 859a83ef-48b5-40c8-d685-08daf4c26b50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iVFJW1zO4cUcx3JVMFz9gkBcM+1Tl3/hveJUflH2kHO6PZGkGE8c0hMgNl2yy+IzYaV0avZmdKpkWuUy1DahqOr4ay7Z3M1QKcOVX+11eaijT9zyppmdmPirNL/MEl9uGVtzkid06z9PJ5hDS2ovJdaGgFlZntMdoDy+cG6OWAgxQ4btRtOsO9YBQZDT0nZpNBP2U3bjBubQNgFz3K5O38dn/XJUSyT8KVffsu2YfpF0mLjrbZcXwJeVmcLEJsfux4zTptbU5L6inerdzlICfONHcPRFwdw0Nqt25UBNm3z3MXuxnzki/B6cblDRxyL2B7L7YJ2AZ/gYYpkF8dJzi9yxpOA4If+5u3saIbynGWs/kfwT/r9eb/jEmuDbKYunOk2VeF+pS9SQ/hD31G99mTGuBvDpcWxwmmVpB3ZRg+i2cOTx48SSXRpyWeCj0BL+K3mDQX7k6AHcbi6XXR/pvB36nhAgdN4MT/Ge1NxvVQu7VB+pbcmo4jK3hc0H7K++tMA6KPKs4VDfiGr65EwNM6LszXvCMIkAG+HeJKmj8W2obLIwhNtwIH0WpMMCrVAy7BpgC7vFevfezO6MoJ4aS48d2rMCAWHwqXwY+c027mLxRoLnxv4Ud7FSupl6VsVIWR1GE1FR/2P5wSbDsK625Al8q8OBJBu9NAm5PF+SI0MNvu9IMEcrJKh5kI1g0jr9pvtAdVPs5pu2pQBk7apFO7agfxaTyAgHjRKzxJ7z+D0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199015)(26005)(6666004)(36756003)(186003)(8936002)(53546011)(107886003)(6512007)(2616005)(31686004)(6486002)(6506007)(478600001)(66946007)(66556008)(5660300002)(66476007)(316002)(4326008)(31696002)(41300700001)(38100700002)(82960400001)(86362001)(54906003)(8676002)(83380400001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjlzLzZsMGpHdExNUVN5Mjl4d3I3ZkNWN3dmeko5RE8wbTkza3F2RW96Yk5I?=
 =?utf-8?B?YzFyMTk5VmMzY0FxNEt5RDBySUlISTFNQU9YbXlUa1FuUXk3VjBQemdzbmFN?=
 =?utf-8?B?SVl1S1JSdVdScTl2L2RLS3F3aURGK2tZSTNkS3Q1dmFWQ3lXME91djJXTGdQ?=
 =?utf-8?B?MHNDcXFTLzM0OGFOQTVxK3krRFNUSUJrYnIrdVU3N293STJFVVRNcjU1WnJC?=
 =?utf-8?B?Q0dPRngxaXRWZDhYZ0lNNlV2bDhPenRBUWFjTk9xVXFJQ2pTVTBQK2NZeDRS?=
 =?utf-8?B?ZUM1bjFYT2JjVXl6bmlrMHg0QjhpMVR1eVdhWndzZEVRN3I2YU1EM1k3NzE5?=
 =?utf-8?B?L0Z0VDBzcWtxSTVnQWorV3pNWUwrdW1VdGdPb2FCQW50S0x4REs5cWJUZW96?=
 =?utf-8?B?NWZnV3g4bTA3bHREOG1MUW1SUkUxR0FKazFkZC9qMGN2ZEpRaThuR052bUZU?=
 =?utf-8?B?YW9NLzkvUnJOaGQyYUpGNm9VR2hWMnJjRFN3YWV4dU96MW4vdUl0NWYyOXJ2?=
 =?utf-8?B?dnJMUEJwWlpRVk5meG1YMnJ4YkM2d0M1Vm1aemFMSVU2VFR2UTc5YWRWRW5R?=
 =?utf-8?B?OUcrYnYwS2IzcTJuZmFYczdxK0ZkQUpLQjlVOXJyemhQdHF6U3VWWjFNNU9C?=
 =?utf-8?B?OW0yYm9RQ0ZscnhQU3pTQURIWlNhMVJrQ3N6dUFyckV2dHh4MTlrNUF3UUVy?=
 =?utf-8?B?NlBPcTZXanU5Wk8xdnBVRVI2Yk15KzR6QlpENVpIVmRFMnVNNkMyRzJKajBv?=
 =?utf-8?B?RDczb2cvajVjL2w0ZGwwWjlyMHQ4RXhreUFsaXQ3aWwxVUxISFB6SGwrNjJ6?=
 =?utf-8?B?QmRUMFd0Uk5wdUpUcll1aVErbHVGSWhGdHhxZE5QdDRJalJlNGdVOVRKMHRV?=
 =?utf-8?B?VVVkUWI0WDZ1TkJJMmdpcUJMUzUvbW9zdldTZ01OdjlqdjJzUlBLekZTZEFX?=
 =?utf-8?B?VWZqL1BPL1BEaTJheGoyYnZqSVRaNHNrcGRLWmFrTS91a2lJbmZrQWE1dHRt?=
 =?utf-8?B?Tk5ObDBsV3lsUkZtSFdrY0I5cFlLUlAwTjAxcU5MUnhuVElUcExVaHdlS0py?=
 =?utf-8?B?eHg5QWk1Q1dKdVhhVDhKVzk3ZWNDaXRadmdqNFh6N3d4UGdxTHVCRGh3UnZ2?=
 =?utf-8?B?dURTMXZHYSs0ZTlrNDI0b2FtTWZaWC9vV3R5ekZFYlVkOVlnSWZyWXN2cXBp?=
 =?utf-8?B?dU0rSWVhdTBvZEVETWprcklZOEJueERuUk16d1RmYXBKZXJnMnpuRDJKWlpT?=
 =?utf-8?B?VEtIS3EwWjdobng5c1B2L2g4M2lSRzNiUUlUbFB1VmwyckJJSERsOEM2RnpZ?=
 =?utf-8?B?VHExcnlHR1pCUzBwQktWZHV6dy81NVd5Sk9GOGFKYkQ2M3J4NlhPYU9pdXAz?=
 =?utf-8?B?TEtPRWtzV1hPUTJXejkxTC9QMGovejBsTFgvVks3MG9IR1pGNk11cC9xQmkv?=
 =?utf-8?B?VFRXb3dyWTN1clBIMGg5TXI3TExLdkxhaUZUcG56WitZVUFlYXFEOUY0dXUw?=
 =?utf-8?B?MGNwM2p1QnJ6ajJYSjg4Z0g3VVZMRklsVldTNXVFUnlPQjRWMUV6ZDlVRk5l?=
 =?utf-8?B?ekc4ZGREeHlmT1FMQkloYjdmYlp5NVpkajJtZ3VsRGxscXNpTFYwV1BkYTZZ?=
 =?utf-8?B?NlEwRkJqTUtPTG5FRTlDQ0tsVHYxelNpck1IdlFLVW02RFV5N0VmSmpYZWxI?=
 =?utf-8?B?OE0xNXNLUU02dFNKZnFTdVVTZTVnV2E2UEpWS04wM0I4c3kxREV5OGd6K0Y0?=
 =?utf-8?B?Rnd0MlJIZkY1ekcvenJjNG9jVlRNQjd2dTdEK1V6bHdWM3ZVZ0RKSmhpQ29T?=
 =?utf-8?B?MHVHbXF2dzRoMHI0amFXZEpLRE1QYXBvbXRGMnlERVF6U0hKSmw0cFhkMUJS?=
 =?utf-8?B?a2tKZDh1ZXN3bHVCRjNINnhVSEg0V25mcU82ZWRtWE1hWXF3OVQ1TkYzcGxv?=
 =?utf-8?B?SkJnTFBjbEtRU1FGM2dJb0E5dnJBTE5nTFRnZjh6RksxWXErNXlMSHV4YkNs?=
 =?utf-8?B?M2IrWjVMTG9JQWhienNnSlVhdW5reUN5YkZWMVdnVS9uZlduOStiWU9PdE10?=
 =?utf-8?B?MG01SnA4Sml0YXVrdXdhS0VqRlFRMmdxaXo2WmZGRG1NUGZpTnUybHlkSFVs?=
 =?utf-8?B?YUlrdXZKazY3empwK2UvQVJNVHV6ZEtoK0F3Z2tNSlE0c3lKYU1pWld6TnlC?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 859a83ef-48b5-40c8-d685-08daf4c26b50
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 17:28:29.1076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVPc8kh9UN4RV6rvdcOhYCJX5d9XElWT8a9AUYGX5UcardOs7hzPe0tQYHS2aix2RUcpng5S213Sw94Vbb75yJdNvVl7YyuUoOdFpYlZzjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6505
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
 Alexander Usyskin <alexander.usyskin@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo <rodrigo.vivi@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>, Juston Li <justonli@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/11/2023 4:37 PM, Alan Previn wrote:
> During suspend flow, i915 currently achors' on the pm_suspend_prepare
> callback as the location where we quiesce the entire GPU and perform
> all necessary cleanup in order to go into suspend. PXP is also called
> during this time to perform the arbitration session teardown (with
> the assurance no additional GEM IOCTLs will come after that could
> restart the session).
>
> However, if other devices or drivers fail their suspend_prepare, the
> system will not go into suspend and i915 will be expected to resume
> operation. In this case, we need to re-initialize the PXP hardware
> and this really should be done within the pm_resume_complete callback
> which is the correct opposing function in the resume sequence to
> match pm_suspend_prepare of the suspend sequence.
>
> Because this callback is the last thing at the end of resuming
> we expect little to no impact to the rest of the i915 resume sequence
> with this change.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_pm.h   |  1 +
>   drivers/gpu/drm/i915/i915_driver.c      | 20 ++++++++++++++++++--
>   drivers/gpu/drm/i915/pxp/intel_pxp_pm.c |  2 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp_pm.h |  6 +++---
>   4 files changed, 23 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> index 6c9a46452364..fd1a23621222 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> @@ -77,6 +77,7 @@ void intel_gt_pm_fini(struct intel_gt *gt);
>   
>   void intel_gt_suspend_prepare(struct intel_gt *gt);
>   void intel_gt_suspend_late(struct intel_gt *gt);
> +
>   int intel_gt_resume(struct intel_gt *gt);
>   
>   void intel_gt_runtime_suspend(struct intel_gt *gt);
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index c1e427ba57ae..c3e7c40daaeb 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -1170,6 +1170,13 @@ static bool suspend_to_idle(struct drm_i915_private *dev_priv)
>   	return false;
>   }
>   
> +static void i915_drm_complete(struct drm_device *dev)
> +{
> +	struct drm_i915_private *i915 = to_i915(dev);
> +
> +	intel_pxp_resume_complete(i915->pxp);
> +}
> +
>   static int i915_drm_prepare(struct drm_device *dev)
>   {
>   	struct drm_i915_private *i915 = to_i915(dev);
> @@ -1370,8 +1377,6 @@ static int i915_drm_resume(struct drm_device *dev)
>   
>   	i915_gem_resume(dev_priv);
>   
> -	intel_pxp_resume(dev_priv->pxp);
> -
>   	intel_modeset_init_hw(dev_priv);
>   	intel_init_clock_gating(dev_priv);
>   	intel_hpd_init(dev_priv);
> @@ -1484,6 +1489,16 @@ int i915_driver_resume_switcheroo(struct drm_i915_private *i915)
>   	return i915_drm_resume(&i915->drm);
>   }
>   
> +static void i915_pm_complete(struct device *kdev)

nit: this function should probably be moved to after pm_resume to keep 
the order of the PM functions (currently they're in the order they're 
called in a full suspend flow)

> +{
> +	struct drm_i915_private *i915 = kdev_to_i915(kdev);
> +
> +	if (!i915)
> +		dev_err(kdev, "DRM not initialized, aborting suspend.\n");

This is a resume call, so you're not aborting suspend. The other 2 
resume calls don't check for i915, any reason you have to do so here? 
Also, any reason not to check for DRM_SWITCH_POWER_OFF ?

Daniele

> +
> +	i915_drm_complete(&i915->drm);
> +}
> +
>   static int i915_pm_prepare(struct device *kdev)
>   {
>   	struct drm_i915_private *i915 = kdev_to_i915(kdev);
> @@ -1779,6 +1794,7 @@ const struct dev_pm_ops i915_pm_ops = {
>   	 * PMSG_RESUME]
>   	 */
>   	.prepare = i915_pm_prepare,
> +	.complete = i915_pm_complete,

Same as above, I'd move this to after .resume to keep the call order.

Daniele

>   	.suspend = i915_pm_suspend,
>   	.suspend_late = i915_pm_suspend_late,
>   	.resume_early = i915_pm_resume_early,
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> index e427464aa131..4f836b317424 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> @@ -34,7 +34,7 @@ void intel_pxp_suspend(struct intel_pxp *pxp)
>   	}
>   }
>   
> -void intel_pxp_resume(struct intel_pxp *pxp)
> +void intel_pxp_resume_complete(struct intel_pxp *pxp)
>   {
>   	if (!intel_pxp_is_enabled(pxp))
>   		return;
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h
> index 586be769104f..06b46f535b42 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h
> @@ -11,7 +11,7 @@ struct intel_pxp;
>   #ifdef CONFIG_DRM_I915_PXP
>   void intel_pxp_suspend_prepare(struct intel_pxp *pxp);
>   void intel_pxp_suspend(struct intel_pxp *pxp);
> -void intel_pxp_resume(struct intel_pxp *pxp);
> +void intel_pxp_resume_complete(struct intel_pxp *pxp);
>   void intel_pxp_runtime_suspend(struct intel_pxp *pxp);
>   #else
>   static inline void intel_pxp_suspend_prepare(struct intel_pxp *pxp)
> @@ -22,7 +22,7 @@ static inline void intel_pxp_suspend(struct intel_pxp *pxp)
>   {
>   }
>   
> -static inline void intel_pxp_resume(struct intel_pxp *pxp)
> +static inline void intel_pxp_resume_complete(struct intel_pxp *pxp)
>   {
>   }
>   
> @@ -32,6 +32,6 @@ static inline void intel_pxp_runtime_suspend(struct intel_pxp *pxp)
>   #endif
>   static inline void intel_pxp_runtime_resume(struct intel_pxp *pxp)
>   {
> -	intel_pxp_resume(pxp);
> +	intel_pxp_resume_complete(pxp);
>   }
>   #endif /* __INTEL_PXP_PM_H__ */

