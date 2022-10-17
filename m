Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB276013EF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 18:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A5210EDA6;
	Mon, 17 Oct 2022 16:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C45C10EDA7;
 Mon, 17 Oct 2022 16:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666025517; x=1697561517;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jTSRDPpkxXDfHLjXi/kwPMEC5OgYjC7bZJT0FTxgUmg=;
 b=B5wczVGH+J+FT3ukv2ipJMMgTaO9tvUAK6jdCPRfTgfAXTz7EXneLsJP
 VLzkdQ4k1FGagUvNT7IPvU4nZgCIuCOY31F8Tr2rEVdG4AYicdgZCXr95
 LHGEglu3KBaQ8zuijAARtWB362VKb9QahjRo6rfx1gVZB/D4Q7yLADEE3
 u6K2hUwBqf/LUCTKKe1717nMFPr5eeLqfANwIGAKb/dAecHxzUMDqtYTe
 O5Loxk2xslgXPrF62TeLneJHObTAPUekrd8nNLLl/UoIACQLYBMaYOecw
 dkAQpCDXkJlnnMztbHlCaaEhS58JaSgINvnPCK5Q6cN6DcsuZL1MCptxN w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="305843592"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="305843592"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 09:51:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="753699023"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="753699023"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 17 Oct 2022 09:51:51 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 09:51:50 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 17 Oct 2022 09:51:50 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 17 Oct 2022 09:51:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RngICQH5jQsHbLPFapVn67NfDoA8nTUQzvdzwwC+pPR+ECQ/XOUhHuqCqAxkShCYdVPz7IRNVt7vmHRN7mnNC2oS5+2J0s5BbtHqW9ml8eCudF5mhvceVhjOwWU2bTT5lizh+ghp2LkE1HRPYu9qT4cV2mJoyq4ORIZf/p1r3aa+UI585U2pTN90DGLFMDrHJPwEOoSV/vVZFXWGQEpz7gihh0tq4C3NUr8vkbn+v6Vk6FA1lloya5ftJKti4TQL3L/JrsIfxMPm6nqQbrubzGkXjVl5xOrL0ZsWphjKq39ueEMule+/tJK1Wil2Z47tT+5CkUwR9fz0t2sYYktGVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIliCAc8blv3NiBn2V/jcEh1h0O3Q47vtMn8U0vK2g0=;
 b=TzFE3Dw3VeqDOemgnsed6eeN5FH8k/33fMyUh6OWH9X7djYGuzwwNXiqdtc3BJ9cQge00nmOXe7NXKEzSiLevWPaHNBr4NclOBf6K2JMjXQxGvxsK6kvou2dOSB7fW0jL3t169mv+Bj+0fAVGrh30hyzbVnrcNJEQgs2VBJOzf3ei+/LIobclUfX6yNSwgnMJbN2P/2E5ysDFcXU72PjoQX9YcmWUlUduCYBb44P5d3Qi+LOy81ef9ZQMmWu+mTOY2cfLftQy3O2Q0fEm43415BFBkv/tayi+lAdbZZzMFxElHWMjDhIX/MRWN3HcGdn2dSOcmUvWQ9yi99HSnmJxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 IA1PR11MB6443.namprd11.prod.outlook.com (2603:10b6:208:3a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 16:51:48 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67%3]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 16:51:48 +0000
Date: Mon, 17 Oct 2022 22:21:39 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 05/14] drm/i915/gt: Add intel_gt_mcr_multicast_rmw()
 operation
Message-ID: <Y02IG+pYLG2qVH8D@bala-ubuntu>
References: <20221014230239.1023689-1-matthew.d.roper@intel.com>
 <20221014230239.1023689-6-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20221014230239.1023689-6-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN2PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::35) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|IA1PR11MB6443:EE_
X-MS-Office365-Filtering-Correlation-Id: 07714ad3-a8b5-4009-f7f2-08dab05fe1ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tkk1vy0+AdONhav+o9K+hjFr+2bNDFS9egs5cdKMXh5Q2CbaCk8OTZVDZKZWOEqFviA8iprDHrGck3qudVuS60Zyuejhhm9GddhXSyFBU4r+lVS4rCsbopvxBESSSSSwalCfooeuYQB4PRsfpBnMws8m2FaAy4gExnb8yQGlhQt6tiI+AuNZ9qwa1NqNO6c1B7uLHdUSlBJwq+gmoKPJ0BnxmiSYguzvipNc4zgOf05kD/1TeIcDMs5cSwZw0Fz/vZMZjQTgnPfusP6vdmZSbM/1mV8s77hmbn2+9MCqu6m+lU0mAMVcY9Eq6qbiX3gzfN1O0AJz8REolm7F76CzdpUdD7EfqvwwXdnqYbWU2Pmlwutmg21X21GgOS3tCQoPcAHs28gASpDaYjFEIqpVAh93I2Mx3WrOAMfI/Syp5vqX+dDfCLeqh2ozlJ3h2Xk2gH8dVYVmQb5y2pQu1plpsQHpl7rt3O3d6dNloHXdAeJRt9Ddoijcbuuh0DV9soYF0lZdWGZMv38xll0kGA3gcmFfzSXP36B39k7xiU5Z1pbpuukK3QoTtY5Az6fodIyTI/4AzbWrlCNJUgnh2PBNPsA/QFiW+xzDO2VEMFfo8nML80ZqxFC1MMoCYEnNsabHFg9Umo7N5li63RebXWRDPt4VSspUxTKr8+ff7JGspSIg4RJ1Lck0N6OzVN3/JQn2TV9un0Mp0Y7/Muc9NApk2ROw4YLu0M7B4mCLqnWVPXM6NpJCQxlUPFK/7nWQq8f8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199015)(5660300002)(44832011)(66946007)(66556008)(316002)(6512007)(478600001)(6506007)(53546011)(41300700001)(9686003)(4326008)(26005)(8676002)(6486002)(2906002)(8936002)(186003)(66476007)(82960400001)(33716001)(6666004)(38100700002)(450100002)(86362001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVZDMGlNRm4zeUdTK05oQmpkSS9RaFRMTXBkMGlJTDgzQjdxaHhUV2J3SG0v?=
 =?utf-8?B?aVFYV3I3NmxlNjFXd3RPSndqamcvVDlsWnJuS25Fb3RrdDkwRlZraURBRkp1?=
 =?utf-8?B?UkxpdlVxZlQvUkFWOXFOUVh2eHA4cENva0tHK083RW1jYkxTMUZUcURVTWtj?=
 =?utf-8?B?L3FVK2VHWXFYWExPK3pFU2VzTVlHUjh4Myt2NFVQRzVOc0JmVU80bE5BaW93?=
 =?utf-8?B?cmV3OVlFV200REhWY3BsVTRjY3A5dVQ1cWIyVzhxQldWNXFTT0ZIeE5neGZx?=
 =?utf-8?B?N1VxSnREVHZYUEFTYUV3MFJZUHFLU2hDMlEzME95VVN2UTZUZVd3Tjc5aHVm?=
 =?utf-8?B?WEVXM1pNWVdHUmZPR3FwUmVGT0YyaHk4U0JQNldQRFdsaXUraEY1VGV5bGdD?=
 =?utf-8?B?TUJNdzUrMUFpaTl3Mzk1QWVkYWdPaTVLYUtxdSs5ZWZ3SmxxMU9xaEFnam9D?=
 =?utf-8?B?RGFGN1IxM3M5S2VydlFzb0Q1MWJoN2l0WUJ1TXBTOGZ0L3FnTTArUldIRUI4?=
 =?utf-8?B?TytiZy9IcmJkSWo1LzFSK2E3b3hEOHh3SHlhOTlrcDcyUmlsT3B6dUV1elMz?=
 =?utf-8?B?ejNPLzdaY1lvMDBQZnRMaTJ1TXRsaUdZc2oyR0U0Rkp5YmdnSUN6SThQcEJD?=
 =?utf-8?B?RmpidjdoZHZBM24yaksvdjZlYmkvaVBaeWRtVGJSTkc1S0p3aHdQVVFyYi9v?=
 =?utf-8?B?S0JWbm1mNzhvRG43SDhlVys5eEJLRVFYcnQ4K3cwY2loRjRZYnQrTTZlS2xo?=
 =?utf-8?B?UTlYTFpBb3VJUWtSYUtZYkNLekpGL1RWRTE0QVhuSXk5a1dxalE2MTdKMFEz?=
 =?utf-8?B?S2txOUdUVGRBMVFNNkZuL3RianBzdmJ5Vnh5Sk1xZ01tbEQ1Z2pOSGVQWmlK?=
 =?utf-8?B?TnMyVHVVT0lFYW9qUkJyV2xHOHpMNmw4cU1lTlNEM1ZEWUFNVGY0QlVFZk1v?=
 =?utf-8?B?M080T05QUG1oZVF5SjlZYnhXeFJrbHhBdUM2SGkya1QxV1hna1hXQjNaa2tW?=
 =?utf-8?B?VEhScE43eTRJOXdNU2w5N3VDWXlDVHlUdURZUGh6T2xuK1ZBN1dGZkVDZjNx?=
 =?utf-8?B?cVc3L1NYRm52L1BYZzB0SHNCUmJ6NEZjd3Z6SEd4VGVaZ0hTWkMrblU1YW9P?=
 =?utf-8?B?NmRGL2ZhWGthQkttaEpMNzZMd3FwRFNjNTN3SWNzdjN1OXFLYkkzOGEvSUR6?=
 =?utf-8?B?QjBNOWRFcWM1T3pNVTA4ZTBQakVDc1dJNkx3QmJHUERmZVgvR0U2NlhnR3hn?=
 =?utf-8?B?ODFUenBuWGZwVkpHdlhoQ1BYSTNVUFNOb1pFV1dxUE5td2hsR2phZlpWUWdD?=
 =?utf-8?B?czFnZXhnamF1cDUvU05MVlJ6dmdTK25vU0kyTTVGUDcwQlJ5bU5nMlp5dURQ?=
 =?utf-8?B?THkyM2FTc0xwVWlnOFViYUFZNC9YUVlBaVN4Qi9sVHBPTmdYZEIxcDl1NzBn?=
 =?utf-8?B?TEZSUTFUMVRCZ2hreThNN3ptclN3MlFEejAyN1pEazFHalA4TmViZkw4bmtP?=
 =?utf-8?B?bEo5UHMvOXJDT3B2MlZBQWI5dVFCSnpKalpOQWdEbGtGaWVtS3p2OTZLRDdr?=
 =?utf-8?B?ckJHTDVmNzQyRm1jK3FGeU5XZ21MbFBmSXNES1ZHZTNXejNmeFR6Zk84aUVk?=
 =?utf-8?B?VDBiYmw3SE85emIrbEdPcUJFRFNrSE5JWlY3YW9rZWRITUpXeDRYb0V1c2V2?=
 =?utf-8?B?cXRvU2VCdHhIakh5YkJGRDQ0c1ZDUDMyK1UyTytjNWRBODlGcGxKS2pKRkhH?=
 =?utf-8?B?Sklrb1NFQ1NXMlNQeDcrbnRsaXNrOTFJbVN2aUJ4Q0hhN2VTS0ZvOUFOb3lK?=
 =?utf-8?B?bEtadERnOFhvSDRxODQwSHBKdUxscWFiaG51SndERWpzNTZjVFRoa1BaNnJX?=
 =?utf-8?B?Vlh5V25kWkYxVWF0WjBtNXFyYmdxU3hqNXA1bkVBU0c4TURpNENDbTJnKzZa?=
 =?utf-8?B?eHhId3UzelNaR0xlQzBITXVpanVUR3ZuU2QrZVU4d1JYMHdLNkFHMGp6SDNl?=
 =?utf-8?B?SFVkanBjNGVGV1p5dmlzWFZadHQ0L3ZSZHdyYjI4U2hjWWJQYzNPYVhGSGNt?=
 =?utf-8?B?eXZBUVB3MnBkQWVWUVZBV01PV3RwUHExV3o4TGZPcU5HanlQOXJFWlc0Ukln?=
 =?utf-8?B?NWo2V3Vzamx1NmE0WGhkKzFGMjBndkdDa0NBam9WNWowVXh1K2ZqcEdpZXAy?=
 =?utf-8?Q?YBqanevkZ1r+0oscOEhfIlM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07714ad3-a8b5-4009-f7f2-08dab05fe1ad
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 16:51:48.3346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a61tsRNldyg+nIEItMIIncX9COInDnTsBNp7FdlIC0/vOUIZWWsSz/w8XXPn92V29rT7drJMPUoSIumugc92f/P8nKrZqkw/QN2vCQ3azqVt15e86pOM/yoA15kIomiO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6443
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14.10.2022 16:02, Matt Roper wrote:
> There are cases where we wish to read from any non-terminated MCR
> register instance (or the primary instance in the case of GAM ranges),
> clear/set some bits, and then write the value back out to the register
> in a multicast manner.  Adding a "multicast RMW" will avoid the need to
> open-code this.
> 
> v2:
>  - Return a u32 to align with the recent change to intel_uncore_rmw.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 28 ++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_gt_mcr.h |  3 +++
>  2 files changed, 31 insertions(+)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> index a2047a68ea7a..4dc360f4e344 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> @@ -302,6 +302,34 @@ void intel_gt_mcr_multicast_write_fw(struct intel_gt *gt, i915_reg_t reg, u32 va
>  	intel_uncore_write_fw(gt->uncore, reg, value);
>  }
>  
> +/**
> + * intel_gt_mcr_multicast_rmw - Performs a multicast RMW operations
> + * @gt: GT structure
> + * @reg: the MCR register to read and write
> + * @clear: bits to clear during RMW
> + * @set: bits to set during RMW
> + *
> + * Performs a read-modify-write on an MCR register in a multicast manner.
> + * This operation only makes sense on MCR registers where all instances are
> + * expected to have the same value.  The read will target any non-terminated
> + * instance and the write will be applied to all instances.
> + *
> + * This function assumes the caller is already holding any necessary forcewake
> + * domains; use intel_gt_mcr_multicast_rmw() in cases where forcewake should
> + * be obtained automatically.
> + *
> + * Returns the old (unmodified) value read.
> + */
> +u32 intel_gt_mcr_multicast_rmw(struct intel_gt *gt, i915_reg_t reg,
> +			       u32 clear, u32 set)
> +{
> +	u32 val = intel_gt_mcr_read_any(gt, reg);
> +
> +	intel_gt_mcr_multicast_write(gt, reg, (val & ~clear) | set);
> +
> +	return val;
> +}
> +
>  /*
>   * reg_needs_read_steering - determine whether a register read requires
>   *     explicit steering
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
> index 77a8b11c287d..781b267478db 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
> @@ -24,6 +24,9 @@ void intel_gt_mcr_multicast_write(struct intel_gt *gt,
>  void intel_gt_mcr_multicast_write_fw(struct intel_gt *gt,
>  				     i915_reg_t reg, u32 value);
>  
> +u32 intel_gt_mcr_multicast_rmw(struct intel_gt *gt, i915_reg_t reg,
> +			       u32 clear, u32 set);
> +
>  void intel_gt_mcr_get_nonterminated_steering(struct intel_gt *gt,
>  					     i915_reg_t reg,
>  					     u8 *group, u8 *instance);
> -- 
> 2.37.3
> 
