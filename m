Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA805AA3DC
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 01:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B569310E3AD;
	Thu,  1 Sep 2022 23:42:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155E710E39C;
 Thu,  1 Sep 2022 23:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662075762; x=1693611762;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pgZdJtdra/Y8ABJ3KmXwIWLZ4Xyt7DTmwY30wcbE3h8=;
 b=cRAn8FlA7X0iOz3c4vQXvZ1yFrOc7xWqfICd3JPZVTwE0JHITT1oJi49
 kD0nV/FmgVb9GUjFjjAr/GwsJpG89PpgP3w+o1yjYQpB7w9rRisYEANtv
 4eFMaarxFsqtL55/rfxWsOhaVlgrMkwf1Jf2FN7fyliyMJhs94Jws0YAQ
 uJ38YeOxbKVYpgmIvtOmJ+CMXTA+YTAbgPpdb+rmleSSpyI0m0MLBH8AI
 oLn9ME3rOTunxK3rEDSMKXsoSp3SE6y3Y5G9gkZJOaDcUv0V+ZgHMiy9l
 Fk9iL165ez2qh4tKE7xInQF134lYrxqmZGfA9y4dfIAFW5O/PnasSdJGT g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="297136178"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="297136178"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 16:42:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="674099829"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 01 Sep 2022 16:42:41 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Sep 2022 16:42:40 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Sep 2022 16:42:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 1 Sep 2022 16:42:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 1 Sep 2022 16:42:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jY2/O8d35L3alt6cLB3Qw/ON/1FKfumHFUlxewsrjeFAzZBRnaMHKTa9ojcNdBl8XnT2CSTfoJ3M7sI9duhaV8IjckvdEArosbkyV7uh/WSirVVWvKuxxEUP2XVeIMaSUjCsqTLcydtIGFBVO2BjctTsqOJ6RcuB2uhmCfaXu/sbrGdDN1TTeQrPei8HRNVoXo8q7QkNh3ykFmSmmBW5qlXeI+Oj9/O98G5muD1dFuUfwo/LXD2lTOe+70blYfQpA3fZ8I+0XG6rAz8DJvgD1Q1UFfh/yHkPrrZVwuab1K9L8jbyOTeW5CEf0lewMiJqxGQV2K2KkpDpStTTf9XD4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OT1Y4z6+7v8pPQ1ljU8idEj5PhW45KE4OYbXCS5uehk=;
 b=Isu3ZXQCWdQCuyJRYPsVrye+Xr2/IXPRsE7tJ2JfFOS58/EY/c42BGJUYWydenMR3uA+37Lvos0Bmmm1v7YBEDA4144W5xC1WgQFHkEa6Qi6B1AMSY6P6wguz69gD8CMVZqp30OtwiSyukrAInA++yATqtvqRTkbby970tU0kQvJaXWferrYfJhXCgJa6JGoo4C/X6gzAAXaGp0FaXY19uWx6ihnmfuAcmrWwfrF0LLfCHjPbv/ECiHLhLWJQaPaYCfXWqgDTPvsodKOHF90gWGeURPPRnT11OBeMmLuXS4gE6P5buXTGawBbu0RVHEyAJ7s+6rc1PKr9Xd8rMMIYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 BN8PR11MB3779.namprd11.prod.outlook.com (2603:10b6:408:8a::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Thu, 1 Sep 2022 23:42:38 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1%9]) with mapi id 15.20.5588.012; Thu, 1 Sep 2022
 23:42:38 +0000
Message-ID: <0e0a548e-cf04-582f-33a7-ef7d886aa1de@intel.com>
Date: Thu, 1 Sep 2022 16:42:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 8/8] drm/i915/mtl: Hook up interrupts for standalone media
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220829170238.969875-1-matthew.d.roper@intel.com>
 <20220829170238.969875-9-matthew.d.roper@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220829170238.969875-9-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::28) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acb972ba-b570-4c72-b9f0-08da8c73a730
X-MS-TrafficTypeDiagnostic: BN8PR11MB3779:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +8JsA2Iv7cU1jNCWolVHCjJ/7+riQtd3RFuFEuPEXcrm2cV0saSfmlnUP1NZt66f5miIqpPZbVKPwN+iQL+h8PzKfhf+YD2GaUMOM6kWXyRZqZHfoOJIB5GkYZr0jy3ry/D55uD5IPrYuQDPPB2C0uQIEwO8zXG1hYXr0rk383bqZECmqjUfHoS1/zGdL41F6EZuDSnuDmthPCeskEMsKCSI78e3jupParOKPu8MtLbQ1iA8Db0hrrhfUB0PlnslHruIA5IGc7mf/kFAs0rmLzBXR6yzdp8vT/QUp5COeOyml9WlDgWfJEh/7wMBJI4crG1UxiYhPZ2OGP+KWPsWhOXIjmHkZxIdYUYknBKdyv9YfDX9/pMDy3Ba3JW+WlPN2tVIrFNRetW9UL1ZO5v84LBr6xnRZer2XPeb5EJOFhrOBd4Lv77KZ3GKp8QadvM2WjEAGnQJ+plXI5HYmpG0NnU+MFRCDW+5Y7xFiEekofClco0c9XpsOkcBVSZ5fqUIUJfY3ouhp0GBbMlozvVqAZqWBZJeKWMXerI9Vsv4uLYcduTp/YPHSpHo3Uxpny5sCO+4t1+vref1xGPnvT179iA7HhZAEb3PTr2X3zsan27n5fHXtFn1+n3sj+hF7WAbFH1V2fMz4syjYDQQ0aFv8Zu4TlLb99t0r1V5t0ByXopbpLJb3/qVlp27qQ3MHh7R5s2iA2UzEewmPJ4K8BX6RtpzVSCAUP+FS4o+C49u6OY6H0XZa2uAvrEel8sa1IBGXRgaUMafa36fgo0rvFkJFm108e9I5icSHopMCIsQQPwA5dnVuPC/PeenV2zEdOTAMEaQecZv07pCEafwbWvEOcL3ZALWWKh0SA+Mzdlu4bA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(136003)(376002)(396003)(39860400002)(346002)(6486002)(6666004)(6512007)(6506007)(53546011)(107886003)(26005)(186003)(41300700001)(478600001)(83380400001)(316002)(8936002)(5660300002)(66476007)(2906002)(2616005)(8676002)(66946007)(82960400001)(4326008)(66556008)(450100002)(36756003)(86362001)(38100700002)(31696002)(31686004)(52103002)(158003001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2xaQlU1QUVCM1ZxTHI4Rkk2YzNqSGpKdzZnWkUweWFmQTNsK0lOSHgvYWpM?=
 =?utf-8?B?VytWTUtac2hTWDYybW9nSDJMQW0vOUVSWklMRy9mdzRSZnhheDRsSk0vRmFl?=
 =?utf-8?B?U04rclQ0VzJkYnNpczJ6Y3RTenVLZWNLeS9mbkpGWSt4K2dFTktJK2ExZERT?=
 =?utf-8?B?TWkxYnF0ejBxL0JXQjQyMEhTRzZ3WDdrL0NBb1IxM3RWRk5NTjk2eHh1MWN4?=
 =?utf-8?B?WXlQa2I4N01zd0FiZkVHTjVvVHM2b091MmZJQWdDYWwvWGp4N2U3V2dvZmZk?=
 =?utf-8?B?RG0xTUJ2NURDQ0lFZU5YekphZXA1Syt1dFBXa2xyYUxJOHlyWEJDZ2JkSXVZ?=
 =?utf-8?B?K0pydFJNVkRwWkEzbDg0NDI0aUl3UjlMOUExQlhwam1jd3o3MFVhczlsRFVE?=
 =?utf-8?B?aXo3ZVFXSnpkTi9HR2Q5Y201UlFBRFhnY3dvSmJGZ01FM3FoUnM1aTU5d3h2?=
 =?utf-8?B?NE93UnhNRUdLRU1PSTRwcEppdUdoTmhEdkxhVGFnRXFvRm1tMzN5S3BtVzg1?=
 =?utf-8?B?MlQ2V0cxUndEYUdjU0NSZFRQeFhreHVHWVQzbU5pK2FMVkR0a1FYUUVvZWZt?=
 =?utf-8?B?UWVpcmUrbFhIOVRpVkU0aHI3cXdIL0t0YjZOL0JhQk1uWG53WkRXT3laeTMv?=
 =?utf-8?B?R1BrK1o2WENDd3pMMWRuUGEvNVBUWUUzWWNwSlhEdE1NeGNHNWQza0p2U2g2?=
 =?utf-8?B?a2dlQ0gzVWVtVVVFRlhjZ29tVk1XUjBPTjNPL1h6eHV6Q3FhWUZjRU93aGJq?=
 =?utf-8?B?R2diWlNXSkVKMkM0dGV5Wk5sSThBQWVZZ2V3VnNCM0sydHBKaVhhRkFKZzlI?=
 =?utf-8?B?Rk9veVFzdWRJSUxNMHNuVVdyM1BhdnN4YVd3bGRxeS83RjFCd0xabzY2WVNE?=
 =?utf-8?B?Q1VMZHRxcVlnclhJUEwvZ2g4eStSTXRmTUJ3MXNmdGpTa0poSG9tWkJCMlM3?=
 =?utf-8?B?aENsQW4yNGR1dXVqdENXRkw5ZTRrMVNlQTZ4RWlYRHhtQWtONnhZYUhzS2Nw?=
 =?utf-8?B?SDRCRGpYSzdzS01ibXhXa1VGczJrTTUxaTlnQUdNKzlOd0tqTFZHckt4VTk0?=
 =?utf-8?B?UEtuWk55d1p0QWtMcUNIUTJ6K0ErVGozMUFueEl0b3JsSzdMNXhJaFhDWnhG?=
 =?utf-8?B?dVVhMERrN0xvMnl0d0NVWENaeEx0QjhoZG9QVWhaQ1o4eWs3Vy9xVHhDZnh1?=
 =?utf-8?B?bTZpNkhwOGJLanBJNHpiYUtZL3JGNnkxY2xmMHdmUUlKcVM1ZTk1V2V2ZVhT?=
 =?utf-8?B?ZmJydHNWcXgwZ2hSRzZtY3lma3c1TDFUOXNLVVg4OUl2NUQ2WEtjSnVwbS9o?=
 =?utf-8?B?aW9aaEhlYWE4Z3lpaHNBWk56cXBhdW9pZzRGdzMzWEE0cVFpUG9NL1ZBQVBK?=
 =?utf-8?B?dTNIZWo4bUQvdFNkcm52Vm9CSElSRDhzTDZoRDJXTmY4Y0FTMVYwdGVVaXFw?=
 =?utf-8?B?Nkx2Mm8xb3ZXb3FVQUtZd1o4eWZvRmhhdG5TZkpQSTA2aFJ4a0xtbVRvODdN?=
 =?utf-8?B?cVJOb1hhdklMNlBZK25idUNYcnkwMGgvUFpOVjdBb3libEpFR1lNNnc0WUhP?=
 =?utf-8?B?bjZLM3lrdlRoVVNFS2ptT0l6bUg5OWdMVVo5eWFVOEgzN0cxODF6aWNjWVda?=
 =?utf-8?B?UXZXOFFid1JUNzJ3NmhhNCt2VXR2V3AxeDR3QlpGYnNLcjl0eW82a0l4cGVq?=
 =?utf-8?B?VGpJSTFQTkVKTTlFMHNaRzZqREo4bC9CTGplMFM4Y2ZRZFpDZXRndHNtNUFu?=
 =?utf-8?B?Y0JVRWdUV292aTNVY3JSelBiVHVYcDlvYlhRcEQ2bkJIbWNkWnc5TytYSTVO?=
 =?utf-8?B?OE1UY2tiQ3hkSjFEckJRUHdnRzg2ZTdleHBXbDlSOEZObXluU1lQbkdWU3ow?=
 =?utf-8?B?RHJ1bDVBcGZwRzBOOHBpRUN5bjlvMFVDZURnSWRBdm5QbjlEUWlscEpVRzlt?=
 =?utf-8?B?L0h5V0pQTVREZmVEb2twdHdjV293Q1VjNzFiRlRpcWlaUDU1M29oTmZqTTRv?=
 =?utf-8?B?YXZWRDBaZUNvZkUwOTlNbWNMTW12blkraEJ1VFppNk96ZVlvV05oaHJ3Rmds?=
 =?utf-8?B?cWNyb2JaS1pZQTlkdnpPaDAza2lyK2YyQitEOTNVMG8zUUZMUXBLNFJFSW5F?=
 =?utf-8?B?YXMxUWlnRlpXWjg3Skg4YS9QaHRpUFNGZHA3TTRxVkhoMjc1L1liNWRWbytH?=
 =?utf-8?Q?icw6O8pKrtGsZXui1F2rOFs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: acb972ba-b570-4c72-b9f0-08da8c73a730
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 23:42:38.2337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJuJDI+BpH5Ve4gqZHdvL1kJMfrzC0o5N8j8xe8ev/F+RlyBpd5ZPzt0hRLi4n3so2gWF+wRPi6r89DrotgolRnEVXkNOhB/Z2tEgDn7Zw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3779
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 dri-devel@lists.freedesktop.org, radhakrishna.sripada@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/29/2022 10:02 AM, Matt Roper wrote:
> Top-level handling of standalone media interrupts will be processed as
> part of the primary GT's interrupt handler (since primary and media GTs
> share an MMIO space, unlike remote tile setups).  When we get down to
> the point of handling engine interrupts, we need to take care to lookup
> VCS and VECS engines in the media GT rather than the primary.
>
> There are also a couple of additional "other" instance bits that
> correspond to the media GT's GuC and media GT's power management
> interrupts; we need to direct those to the media GT instance as well.
>
> Bspec: 45605
> Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/intel_gt_irq.c   | 19 +++++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h  |  2 ++
>   drivers/gpu/drm/i915/gt/intel_sa_media.c |  7 +++++++
>   drivers/gpu/drm/i915/i915_drv.h          |  3 +++
>   4 files changed, 31 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> index 0dfd0c42d00d..f26882fdc24c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> @@ -59,11 +59,17 @@ static void
>   gen11_other_irq_handler(struct intel_gt *gt, const u8 instance,
>   			const u16 iir)
>   {
> +	struct intel_gt *media_gt = gt->i915->media_gt;
> +
>   	if (instance == OTHER_GUC_INSTANCE)
>   		return guc_irq_handler(&gt->uc.guc, iir);
> +	if (instance == OTHER_MEDIA_GUC_INSTANCE && media_gt)
> +		return guc_irq_handler(&media_gt->uc.guc, iir);
>   
>   	if (instance == OTHER_GTPM_INSTANCE)
>   		return gen11_rps_irq_handler(&gt->rps, iir);
> +	if (instance == OTHER_MEDIA_GTPM_INSTANCE && media_gt)
> +		return gen11_rps_irq_handler(&media_gt->rps, iir);
>   
>   	if (instance == OTHER_KCR_INSTANCE)
>   		return intel_pxp_irq_handler(&gt->pxp, iir);
> @@ -81,6 +87,18 @@ gen11_engine_irq_handler(struct intel_gt *gt, const u8 class,
>   {
>   	struct intel_engine_cs *engine;
>   
> +	/*
> +	 * Platforms with standalone media have their media engines in another
> +	 * GT.
> +	 */
> +	if (MEDIA_VER(gt->i915) >= 13 &&
> +	    (class == VIDEO_DECODE_CLASS || class == VIDEO_ENHANCEMENT_CLASS)) {
> +		if (!gt->i915->media_gt)
> +			goto err;
> +
> +		gt = gt->i915->media_gt;
> +	}
> +
>   	if (instance <= MAX_ENGINE_INSTANCE)
>   		engine = gt->engine_class[class][instance];
>   	else
> @@ -89,6 +107,7 @@ gen11_engine_irq_handler(struct intel_gt *gt, const u8 class,
>   	if (likely(engine))
>   		return intel_engine_cs_irq(engine, iir);
>   
> +err:
>   	WARN_ONCE(1, "unhandled engine interrupt class=0x%x, instance=0x%x\n",
>   		  class, instance);
>   }
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 05a40ef33258..21c7a225157f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1552,6 +1552,8 @@
>   #define   OTHER_GTPM_INSTANCE			1
>   #define   OTHER_KCR_INSTANCE			4
>   #define   OTHER_GSC_INSTANCE			6
> +#define   OTHER_MEDIA_GUC_INSTANCE		16
> +#define   OTHER_MEDIA_GTPM_INSTANCE		17
>   
>   #define GEN11_IIR_REG_SELECTOR(x)		_MMIO(0x190070 + ((x) * 4))
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_sa_media.c b/drivers/gpu/drm/i915/gt/intel_sa_media.c
> index cf3053710bbf..41c270f103cf 100644
> --- a/drivers/gpu/drm/i915/gt/intel_sa_media.c
> +++ b/drivers/gpu/drm/i915/gt/intel_sa_media.c
> @@ -36,5 +36,12 @@ int intel_sa_mediagt_setup(struct intel_gt *gt, phys_addr_t phys_addr,
>   	gt->uncore = uncore;
>   	gt->phys_addr = phys_addr;
>   
> +	/*
> +	 * For current platforms we can assume there's only a single
> +	 * media GT and cache it for quick lookup.
> +	 */
> +	drm_WARN_ON(&i915->drm, i915->media_gt);
> +	i915->media_gt = gt;
> +
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index d45dca70bfa6..917958d42805 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -497,6 +497,9 @@ struct drm_i915_private {
>   
>   	struct kobject *sysfs_gt;
>   
> +	/* Quick lookup of media GT (current platforms only have one) */
> +	struct intel_gt *media_gt;
> +
>   	struct {
>   		struct i915_gem_contexts {
>   			spinlock_t lock; /* locks list */

