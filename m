Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A91634AFB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 00:17:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6728789B78;
	Tue, 22 Nov 2022 23:17:46 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63CA289B78;
 Tue, 22 Nov 2022 23:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669159061; x=1700695061;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5e+8PkqLK7pTXGgA0wuiKZDFIYLkOYqfJQo/9ekDyAI=;
 b=Lr7F5IC8wwrzP9ZxgVaGvBd2SYrSf8GrUzDEDSfun5kHStmXBP7/7hHn
 Evu2Pn7n9B4W5crydX4O9KTPri+tlNBdNQkfpyBluu3JKMoevVhTGijBB
 QJvOoaHds5Meb6FGQq0Q0VBKw8Bu1jujmcfueF7FVoeXkC0o0p1y0IpMG
 3/Ui43Ncx/logmUpR1dwikan3WKYz9aucrqHqwm1qaINia0GabVCBDeBM
 OHU8xjCP4VxRg1GpA5Fd4SirILIpiWBRsDADTt81rBWgvijAermvrqHFI
 0cq5sBetINaGpv1Z9b9CaLmb8GdFP8A7pbQrQ+bYllj8v1ztELz+HBt9e Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="315088166"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="315088166"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 15:17:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="641583558"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="641583558"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 22 Nov 2022 15:17:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 15:17:40 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 22 Nov 2022 15:17:40 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 22 Nov 2022 15:17:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBJHgnGG/G2AJezUkJKFTdi2whYcvCarKrHw9lgIVQgdHAoseQuQCk1deaStrdQNNCbUXs27JS18tk9iMYMmduNRpkXrnjZkd9sYFUSJXIuJF+wl/XHp7Uhd2ZPXqtlnk3LdXPxgC1v4CXW0fEPSr0OgfhRjxj+SNEnaU6kZ5PIpv/yeFWZ7eNksU6ERJcJAuLLkWI9/BMtBBk6PdJQYWVz7ISGZO3SUmz0625uCEagcCPj0ZbjvMfTwmEwCEGkANr5uV2kcHCD0n0v7hznr6dp+IQWMyEY0B7cCRxbApXSHAWDOAexi9tsyJcNx2bjtit8UNz24wbDEdaJBU9Z97w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAG9vtGQLp/BYBmLR3PUgUmM2W29j+wk30UYK20CDIY=;
 b=fLKje6YW69P8kJTnarzd7UEJjSUetWp2tE1Es07MxjA8tLoST8t7aGngc8bQhoIjpKZiIahi0t/M0Cz7bibuF9dbYiZtCEkGu8yy9BktbtyxNstdmxxTu9M8tnUi3M83WtKQZmHw3K2BEGHh7eB7UM5HfsxUjeiefHBfPZftBBTQkWLgguLsjhuf5rW5sJpS8wd6otlfd19eIKCdWgMKkqSykUO3/7NDjfMw7CO4UyZY/oix+a1SuroJc7r4ks5bzNUe4hqUxvqlsqLlkf215AFdnp5OYnkBlZG7rBRaPWPHOJMnZbRK5jz8pG5l0nRg55x/8/Nm07J8hYnWxWpVcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM4PR11MB6382.namprd11.prod.outlook.com (2603:10b6:8:be::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.15; Tue, 22 Nov 2022 23:17:38 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd%5]) with mapi id 15.20.5834.009; Tue, 22 Nov 2022
 23:17:38 +0000
Message-ID: <dc7236e1-e6ec-0ffc-4e7d-9126fc436bf3@intel.com>
Date: Tue, 22 Nov 2022 15:17:35 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/3] drm/i915/uc: More refactoring of UC version numbers
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221122200915.680629-1-John.C.Harrison@Intel.com>
 <20221122200915.680629-3-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20221122200915.680629-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0063.namprd07.prod.outlook.com
 (2603:10b6:a03:60::40) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|DM4PR11MB6382:EE_
X-MS-Office365-Filtering-Correlation-Id: e6825da6-558f-4bd9-6bb6-08daccdfbefd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VH1FMx3tirSn4acm+cGuvM9Q2Ui59tkAzK54oQsTT85DTcyT2cq+lPCWZ0zO3I28T52LpsBGxbNuy4ByKD+xIMcx+lpnh3RxopVlPhsbZ3mRY0Is6TwOhRp68E5TxL6ElQOK7TkRo3MqO6CNQMtSBGRhFO0RVau3xm20wBl8hjBoycoP0osR3y4cm1jCzsajMMbbGLv+dKE7c3bcYTXHcpo3ibKxqgrw7gdm6CyYrILHWMkf4Gn1oXATyNul05CkAomUYrnrd0lyZ8Rmp8/EklziJZL/zFeT1hbRibxa55DM6Qt4dtQhg3j/n+QTzbgxQmGAxn9e9m7j1fQ/HUCPEAonTgEjK4QuVBMLm8lf8g1wM3MiVeWLjDQFU2ATslWuUxD1Np0mVxCqanVgIpibzCCL/48opi55LkbaNQeQfe/nuhI4oVKye4dwIRcmH431XyIFVmb1RWyXyzs5P3WMRzfYC+0cFr2tshsVxpjNUvVQErTtF71bPasgWwXkhZWx5HSxnO1KXwsFxvIt3rocSVymYzKlVP1NvZZ5TsirVPlCUTTcZsEu9F4aaSx9vqONUVIk6ivq6iIsLt9mauKA6Ay5nUo4U1bWwQ/SQHk/73/8mhrNfF+gtApvecuTqj44YNB28pV9qgMhHp2ocgRMgWItpLFdmOg6QCTz14+ogi4PzP4xoXOjpvoiTsvkR0998/R2YKGNfvDrDxlr+GJCgnDGZNi67z+EJicEG5TsMdM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(376002)(39860400002)(346002)(366004)(451199015)(31686004)(86362001)(31696002)(4326008)(2906002)(82960400001)(83380400001)(38100700002)(316002)(8936002)(66476007)(2616005)(478600001)(186003)(6486002)(36756003)(8676002)(26005)(41300700001)(66946007)(66556008)(5660300002)(6666004)(6512007)(6506007)(53546011)(450100002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVFtcFFBc1d5OW93aVlqZXgvSnI3anRjWE5pTXdIM1hDRnVtd1Fqa0NpcGov?=
 =?utf-8?B?VVR5YW1kTU9kd2hmUThReHhyckdnWUtuZ0I2OG4zemYvcms5MGRRQkpmdThr?=
 =?utf-8?B?VU9YUlcrRlBJSllkanpyeUhmamhkUFlhVWlMK1BidHZXOThONEFLZTdXVmlG?=
 =?utf-8?B?SWxEd0M5ZEFoU1pPdCtkVXYrb0xPUFZXMTBVZ2Z5TWxvOFVwaFYyNXFXV00r?=
 =?utf-8?B?a3ZtTTQxTEQvYmJDT1dCRFkvcWZCRFNablpOejdEbE11VVBScjlFMkNvRTFM?=
 =?utf-8?B?TXVrNXNaWE02L2loSkJwaHBiM2xmYWxLSU02NGRiQnovWnlReEpxRnM3SVZo?=
 =?utf-8?B?eE1pZnFHUmVoQnkwRFp3eW1EOFcyZ1VqZVBEWXpFMllkYVN4aEM3SVNDODcx?=
 =?utf-8?B?SWJhek5BWFpiK3Q1Wnh5cEhaaGFUcDFmdXZnYUlvL2pocGlxUjZzLzZiKzhH?=
 =?utf-8?B?SnBPU0d3RWtYTXd5MS82TkxQb09ZRUk3ZVR2UHBsekhUbzhSK1Y0L0p2Z2hQ?=
 =?utf-8?B?Znl1ZHpYM1hQS21ic3o0b2ZrRlFUNmJUYll0ampQRHZZdHJrQVZxRmhaRWRn?=
 =?utf-8?B?a0pDNnV6QVRvUVVzeXpSZkFJRWQ1ZTRyTU54R3VoSHNCbk0yMEx1cWttYkpx?=
 =?utf-8?B?eWlaKzFFdWJSZmMvcEdpRVNaeklxdlJ6dXBhMS95SXpKV0lCZytpZXVkVDZM?=
 =?utf-8?B?SWxyNWdhYkYzcHBrbml6QkE1a0o4ekh6WU0vK2J6czlDQWtlMTRTSGxNdWho?=
 =?utf-8?B?RHBQNWgxREgyUVFtcVBJUnZCZjF2N3phL0Qxd3VmdWlCRGFBZ0VpUEJvUk5H?=
 =?utf-8?B?ZzBoSUIrK3NIcHJoZ1BzWXRuQjRqZDdzL0M5YmJrUHllRFVPWGUvM1hhRUpn?=
 =?utf-8?B?eDBheWxqcmdORHVMTTQ3bWF5c0syN2lVZnA1YzBJZG95NWY0bjhsdEhHM05P?=
 =?utf-8?B?ZHF3d0tHS0xLOGlCWjFQUkh6cENxVnpoUE1TdUZoeS80K3ZXOHBaemk3cUFV?=
 =?utf-8?B?UGtpSDhvb3puZmVDODR0eHh5ejJuU0g4MjFRMldkUFRvTTJPNStCWTR1a0M0?=
 =?utf-8?B?WDZzSkxUZ0lTRzN5QTlQeG0xRWZ1a0JBMEE1VWp2NlpWL1BoZ3lyZ2FMVTRW?=
 =?utf-8?B?YjE1SVg4WHJteXhuaEYrZWg4VktpZkN1TVNjRFBrRFg1VXdVZlJyODVETUFt?=
 =?utf-8?B?dmRuVU0yek1Eei9BT1kyZXJUTi9hc3U0Z0Z6SU0zUUYyREVZS24rbEdpeHda?=
 =?utf-8?B?bFhTcnRSMzVTeTZqUkFZSVpSUDVTcndSOENNYjFKVlRZSWMxK2hrOUxLVkE3?=
 =?utf-8?B?NmpFZjdWcjBpTmd0S1BlbDlGZVNHMmFMREM1YkYvZHkvNSswTVpmU1BPWTV4?=
 =?utf-8?B?RzdCMUVmRlFsOWhSSUQ0ckd2WXhtZ0VQMHVPUW51ZzBMdXpLT09ZK3hoNmFK?=
 =?utf-8?B?MThJUDZDYVYrUm9Nd0p3M0dlbEtDN0VxSSsvTW8wd1hhYlBWYTc4ZWlmQWJx?=
 =?utf-8?B?VHdOVk90R3Y4L3B3LzNMUnd2bUdZTU1JQ2tSL3c5cFZnZitWQ1JtQjFkZlhW?=
 =?utf-8?B?VW4xdmd0eGxVQWphM2kxYVNVbkhjMktoMTVKWkJLTy9raHgwaVQveFhvMEVo?=
 =?utf-8?B?a0dtc1I0czBJM1p3RU5abGZ4eE01dHdhZS9LLy9VM2NheTJqRUs4T2p2NHhx?=
 =?utf-8?B?ZzBteXFRYkxpRHlJbUtFZWlQdkZMVk1GaVZmZ1hscGtwd3JON0I0bE8zTFA1?=
 =?utf-8?B?YzlFNkRDRGd4VTNzQ0wyelN0UWU5UTMyUGxkMlpMRkp1cER4L3JPUEY1dTRu?=
 =?utf-8?B?Mnp3ZExhbXB6REVscHBlMkR2K29wdUZFK2JBM3N1RExJUW5HekdQQkFWUTJR?=
 =?utf-8?B?UDlJQU1wd2VPMUtESTQ3eDFsdDI0UlQzTDRlU2taRkk0WXY3K0E1VlliVFBi?=
 =?utf-8?B?Qmxuc1NUNVZ1OUxoWTJpQ0RndktnZGNpeWpVbVU4ZHd2ZzdFblVaVmFhc0Vx?=
 =?utf-8?B?SGFOTWVITlErRXd6b29DazA5QzFYNFdBVUtJVWUya29KWHdXT1c2dmZYa1Rs?=
 =?utf-8?B?Q2xrUityZXNvZitMWXFtQ0ZiVk9PM1VMTmJhSGRYZnNFdERXTlNUSjdiaTFy?=
 =?utf-8?B?WjFrZXRqYXRlaDU0SEJFckFtZExTZEdIaThoQ0tYUmQ0aExoc2pwS3RuRXhL?=
 =?utf-8?Q?/frKmxoJO9//QhZPI5zdghU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6825da6-558f-4bd9-6bb6-08daccdfbefd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 23:17:38.2117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x0tK+YRT5T+Cml0D+jRj6VIGxFRqd6ZUIiLFxX86tw5CaLD4Am/aW8bH1ji4yDqcXkCE3mW/O+bln3eFG7+KzVAFKX1mmZvg5awXCgQLhhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6382
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/22/2022 12:09 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> As a precursor to a coming change (for adding a GuC submission API
> version), abstract the UC version number into its own private
> structure separate to the firmware filename.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c    |  6 +-
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 76 +++++++++++-------------
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h | 15 +++--
>   3 files changed, 48 insertions(+), 49 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 1d28286e6f066..e6edad6f8f9dd 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -437,9 +437,9 @@ static void print_fw_ver(struct intel_uc *uc, struct intel_uc_fw *fw)
>   
>   	drm_info(&i915->drm, "%s firmware %s version %u.%u.%u\n",
>   		 intel_uc_fw_type_repr(fw->type), fw->file_selected.path,
> -		 fw->file_selected.major_ver,
> -		 fw->file_selected.minor_ver,
> -		 fw->file_selected.patch_ver);
> +		 fw->file_selected.ver.major,
> +		 fw->file_selected.ver.minor,
> +		 fw->file_selected.ver.patch);
>   }
>   
>   static int __uc_init_hw(struct intel_uc *uc)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 774c3d84a4243..5e2ee1ac89514 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -278,8 +278,8 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   
>   		uc_fw->file_selected.path = blob->path;
>   		uc_fw->file_wanted.path = blob->path;
> -		uc_fw->file_wanted.major_ver = blob->major;
> -		uc_fw->file_wanted.minor_ver = blob->minor;
> +		uc_fw->file_wanted.ver.major = blob->major;
> +		uc_fw->file_wanted.ver.minor = blob->minor;
>   		uc_fw->loaded_via_gsc = blob->loaded_via_gsc;
>   		found = true;
>   		break;
> @@ -438,28 +438,28 @@ static void __force_fw_fetch_failures(struct intel_uc_fw *uc_fw, int e)
>   		uc_fw->user_overridden = user;
>   	} else if (i915_inject_probe_error(i915, e)) {
>   		/* require next major version */
> -		uc_fw->file_wanted.major_ver += 1;
> -		uc_fw->file_wanted.minor_ver = 0;
> +		uc_fw->file_wanted.ver.major += 1;
> +		uc_fw->file_wanted.ver.minor = 0;
>   		uc_fw->user_overridden = user;
>   	} else if (i915_inject_probe_error(i915, e)) {
>   		/* require next minor version */
> -		uc_fw->file_wanted.minor_ver += 1;
> +		uc_fw->file_wanted.ver.minor += 1;
>   		uc_fw->user_overridden = user;
> -	} else if (uc_fw->file_wanted.major_ver &&
> +	} else if (uc_fw->file_wanted.ver.major &&
>   		   i915_inject_probe_error(i915, e)) {
>   		/* require prev major version */
> -		uc_fw->file_wanted.major_ver -= 1;
> -		uc_fw->file_wanted.minor_ver = 0;
> +		uc_fw->file_wanted.ver.major -= 1;
> +		uc_fw->file_wanted.ver.minor = 0;
>   		uc_fw->user_overridden = user;
> -	} else if (uc_fw->file_wanted.minor_ver &&
> +	} else if (uc_fw->file_wanted.ver.minor &&
>   		   i915_inject_probe_error(i915, e)) {
>   		/* require prev minor version - hey, this should work! */
> -		uc_fw->file_wanted.minor_ver -= 1;
> +		uc_fw->file_wanted.ver.minor -= 1;
>   		uc_fw->user_overridden = user;
>   	} else if (user && i915_inject_probe_error(i915, e)) {
>   		/* officially unsupported platform */
> -		uc_fw->file_wanted.major_ver = 0;
> -		uc_fw->file_wanted.minor_ver = 0;
> +		uc_fw->file_wanted.ver.major = 0;
> +		uc_fw->file_wanted.ver.minor = 0;
>   		uc_fw->user_overridden = true;
>   	}
>   }
> @@ -471,9 +471,9 @@ static int check_gsc_manifest(const struct firmware *fw,
>   	u32 version_hi = dw[HUC_GSC_VERSION_HI_DW];
>   	u32 version_lo = dw[HUC_GSC_VERSION_LO_DW];
>   
> -	uc_fw->file_selected.major_ver = FIELD_GET(HUC_GSC_MAJOR_VER_HI_MASK, version_hi);
> -	uc_fw->file_selected.minor_ver = FIELD_GET(HUC_GSC_MINOR_VER_HI_MASK, version_hi);
> -	uc_fw->file_selected.patch_ver = FIELD_GET(HUC_GSC_PATCH_VER_LO_MASK, version_lo);
> +	uc_fw->file_selected.ver.major = FIELD_GET(HUC_GSC_MAJOR_VER_HI_MASK, version_hi);
> +	uc_fw->file_selected.ver.minor = FIELD_GET(HUC_GSC_MINOR_VER_HI_MASK, version_hi);
> +	uc_fw->file_selected.ver.patch = FIELD_GET(HUC_GSC_PATCH_VER_LO_MASK, version_lo);
>   
>   	return 0;
>   }
> @@ -532,11 +532,11 @@ static int check_ccs_header(struct intel_gt *gt,
>   	}
>   
>   	/* Get version numbers from the CSS header */
> -	uc_fw->file_selected.major_ver = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
> +	uc_fw->file_selected.ver.major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>   						   css->sw_version);
> -	uc_fw->file_selected.minor_ver = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
> +	uc_fw->file_selected.ver.minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>   						   css->sw_version);
> -	uc_fw->file_selected.patch_ver = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
> +	uc_fw->file_selected.ver.patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
>   						   css->sw_version);
>   
>   	if (uc_fw->type == INTEL_UC_FW_TYPE_GUC)
> @@ -621,19 +621,19 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   	if (err)
>   		goto fail;
>   
> -	if (uc_fw->file_wanted.major_ver) {
> +	if (uc_fw->file_wanted.ver.major) {
>   		/* Check the file's major version was as it claimed */
> -		if (uc_fw->file_selected.major_ver != uc_fw->file_wanted.major_ver) {
> +		if (uc_fw->file_selected.ver.major != uc_fw->file_wanted.ver.major) {
>   			drm_notice(&i915->drm, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
>   				   intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
> -				   uc_fw->file_selected.major_ver, uc_fw->file_selected.minor_ver,
> -				   uc_fw->file_wanted.major_ver, uc_fw->file_wanted.minor_ver);
> +				   uc_fw->file_selected.ver.major, uc_fw->file_selected.ver.minor,
> +				   uc_fw->file_wanted.ver.major, uc_fw->file_wanted.ver.minor);
>   			if (!intel_uc_fw_is_overridden(uc_fw)) {
>   				err = -ENOEXEC;
>   				goto fail;
>   			}
>   		} else {
> -			if (uc_fw->file_selected.minor_ver < uc_fw->file_wanted.minor_ver)
> +			if (uc_fw->file_selected.ver.minor < uc_fw->file_wanted.ver.minor)
>   				old_ver = true;
>   		}
>   	}
> @@ -646,9 +646,9 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   			   "%s firmware %s (%d.%d) is recommended, but only %s (%d.%d) was found\n",
>   			   intel_uc_fw_type_repr(uc_fw->type),
>   			   uc_fw->file_wanted.path,
> -			   uc_fw->file_wanted.major_ver, uc_fw->file_wanted.minor_ver,
> +			   uc_fw->file_wanted.ver.major, uc_fw->file_wanted.ver.minor,
>   			   uc_fw->file_selected.path,
> -			   uc_fw->file_selected.major_ver, uc_fw->file_selected.minor_ver);
> +			   uc_fw->file_selected.ver.major, uc_fw->file_selected.ver.minor);
>   		drm_info(&i915->drm,
>   			 "Consider updating your linux-firmware pkg or downloading from %s\n",
>   			 INTEL_UC_FIRMWARE_URL);
> @@ -1063,25 +1063,21 @@ void intel_uc_fw_dump(const struct intel_uc_fw *uc_fw, struct drm_printer *p)
>   			   intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_wanted.path);
>   	drm_printf(p, "\tstatus: %s\n",
>   		   intel_uc_fw_status_repr(uc_fw->status));
> -	ver_sel = MAKE_UC_VER(uc_fw->file_selected.major_ver,
> -			      uc_fw->file_selected.minor_ver,
> -			      uc_fw->file_selected.patch_ver);
> -	ver_want = MAKE_UC_VER(uc_fw->file_wanted.major_ver,
> -			       uc_fw->file_wanted.minor_ver,
> -			       uc_fw->file_wanted.patch_ver);
> +	ver_sel = MAKE_UC_VER_STRUCT(uc_fw->file_selected.ver);
> +	ver_want = MAKE_UC_VER_STRUCT(uc_fw->file_wanted.ver);
>   	if (ver_sel < ver_want)
>   		drm_printf(p, "\tversion: wanted %u.%u.%u, found %u.%u.%u\n",
> -			   uc_fw->file_wanted.major_ver,
> -			   uc_fw->file_wanted.minor_ver,
> -			   uc_fw->file_wanted.patch_ver,
> -			   uc_fw->file_selected.major_ver,
> -			   uc_fw->file_selected.minor_ver,
> -			   uc_fw->file_selected.patch_ver);
> +			   uc_fw->file_wanted.ver.major,
> +			   uc_fw->file_wanted.ver.minor,
> +			   uc_fw->file_wanted.ver.patch,
> +			   uc_fw->file_selected.ver.major,
> +			   uc_fw->file_selected.ver.minor,
> +			   uc_fw->file_selected.ver.patch);
>   	else
>   		drm_printf(p, "\tversion: found %u.%u.%u\n",
> -			   uc_fw->file_selected.major_ver,
> -			   uc_fw->file_selected.minor_ver,
> -			   uc_fw->file_selected.patch_ver);
> +			   uc_fw->file_selected.ver.major,
> +			   uc_fw->file_selected.ver.minor,
> +			   uc_fw->file_selected.ver.patch);
>   	drm_printf(p, "\tuCode: %u bytes\n", uc_fw->ucode_size);
>   	drm_printf(p, "\tRSA: %u bytes\n", uc_fw->rsa_size);
>   }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> index bc898ba5355dc..6501d6f1fbdff 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> @@ -65,6 +65,12 @@ enum intel_uc_fw_type {
>   };
>   #define INTEL_UC_FW_NUM_TYPES 2
>   
> +struct intel_uc_fw_ver {
> +	u16 major;
> +	u16 minor;
> +	u16 patch;
> +};
> +
>   /*
>    * The firmware build process will generate a version header file with major and
>    * minor version defined. The versions are built into CSS header of firmware.
> @@ -72,9 +78,7 @@ enum intel_uc_fw_type {
>    */
>   struct intel_uc_fw_file {
>   	const char *path;
> -	u16 major_ver;
> -	u16 minor_ver;
> -	u16 patch_ver;
> +	struct intel_uc_fw_ver ver;
>   };
>   
>   /*
> @@ -111,9 +115,8 @@ struct intel_uc_fw {
>   };
>   
>   #define MAKE_UC_VER(maj, min, pat)	((pat) | ((min) << 8) | ((maj) << 16))
> -#define GET_UC_VER(uc)			(MAKE_UC_VER((uc)->fw.file_selected.major_ver, \
> -						     (uc)->fw.file_selected.minor_ver, \
> -						     (uc)->fw.file_selected.patch_ver))
> +#define MAKE_UC_VER_STRUCT(ver)		MAKE_UC_VER((ver).major, (ver).minor, (ver).patch)
> +#define GET_UC_VER(uc)			(MAKE_UC_VER_STRUCT((uc)->fw.file_selected.ver))
>   
>   /*
>    * When we load the uC binaries, we pin them in a reserved section at the top of

