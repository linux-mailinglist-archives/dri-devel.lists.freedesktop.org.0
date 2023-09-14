Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2138B7A107B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 00:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74AD10E585;
	Thu, 14 Sep 2023 22:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35D410E585
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 22:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694728995; x=1726264995;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KPqwZ8J1zGwwtcvxDu0MDlMTFbZfGEYrrQ5J+enLY2g=;
 b=BTdbKhM8H6R7yMknb1erNmPGoZvja0Jac/rAyLG6htBqAaXJI//VlcBA
 te81Mo5ox35WWRlaSxslH8xYo9jwZby+24uyLwNwsf/E/MnFE9MDKzuMW
 b78UTN/b6Iv8rfIcWuURbtKmR5zG8crpwkcsCx8A6ZwSbweSP3XsHgRqD
 Wp1wJHpIkA+9qCOWstnkyjcSZf7ZZuI/mxtdRVklcNrnhEJvexgIqRebt
 A9lhwXtqBSAHIh/hncKZBHeHAgVFL6HHwUfoQe6Y1M35a0H5rFC7oXwAq
 91C8kbQkNhTWopt58zH8oSIQXFkInvdmmjAeMR+hRrmf00IkHaBzb6gOi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="376423890"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; d="scan'208";a="376423890"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 15:03:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="1075549113"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; d="scan'208";a="1075549113"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2023 15:03:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 15:03:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 15:03:14 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 15:03:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqHBrxY5oJSPRhKgnTESpmt8OPkm0Ha2UaB0hGRaZ6R+R0NiUX1v1t6poM2q+LiPTKsOI2ikbUxBSX1AVNmZ4fQDCSJ00Kmr8K5F6XzOEn3dvaFo7kgncUShxfFj9g6iKsfdWgprPfRNBc3mD6nVrPIbZRqNrUVCf+0braH30EKKr+XfLAXkq1j2D+Nq4rXlCUAlikXXFyYOz/+geOyrkpnOdBSNorYEUhp/D13887CVls+5/aPl4ypLTrDq89zGHtsL7R4GPovhaQlyVYTEATEtoinov6vrL3FbAIge2iOddTd8T6q4SM7/NmWDxVXSxGD1Dx2tX1aek1TF8ugsaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fN1xahaxeDCXwJ3RNUbMyGT6u86V21mFNUPyRKgSDVc=;
 b=dvarjm34YzGvXHY8v/Ps/ywK8Awt7TZcetVKH2241tIhKONKnfZujcBYFJhj3aG33vlqDaeUztMWeUq0B5YDcUIS8YXAp31ejPsQRwqIY0yz5mpA9ZDRIy8eNKncEk5OIVJBE/+xu///jy2e3datajVGEIcpUiEFht87LJxPUx+NGIzjMEAd7QDPf7oJw0SWZdF/GGNdP4LP2Z1sTE9Nr7Ogsot5SMgfxFuTUHQBWo4fYovgFkj9WaZFwdf9T7fRtUwTvwL5s5kp8rfCJW/QM67eDTq4yw+2Txkm4vmGenH+yPMhGJ0ymFwNVqWlDhfBF10OV5nVrqyhIJeg3l+brA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3398.namprd11.prod.outlook.com (2603:10b6:a03:19::19)
 by IA0PR11MB7837.namprd11.prod.outlook.com (2603:10b6:208:406::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Thu, 14 Sep
 2023 22:03:12 +0000
Received: from BYAPR11MB3398.namprd11.prod.outlook.com
 ([fe80::110f:4bac:8cd9:c359]) by BYAPR11MB3398.namprd11.prod.outlook.com
 ([fe80::110f:4bac:8cd9:c359%4]) with mapi id 15.20.6792.021; Thu, 14 Sep 2023
 22:03:12 +0000
Message-ID: <a28eca84-3a55-0e00-6287-48a24de28b94@intel.com>
Date: Thu, 14 Sep 2023 15:03:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/1] drm/i915/pxp: Add drm_dbgs for critical PXP events.
Content-Language: en-US
To: <dri-devel@lists.freedesktop.org>
References: <20230913225714.877627-1-alan.previn.teres.alexis@intel.com>
From: "Balasubrawmanian, Vivaik" <vivaik.balasubrawmanian@intel.com>
In-Reply-To: <20230913225714.877627-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0284.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::19) To BYAPR11MB3398.namprd11.prod.outlook.com
 (2603:10b6:a03:19::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3398:EE_|IA0PR11MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: 3141f579-8def-4308-ced2-08dbb56e633a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Aqq5tcv5AWBGRicI1d9TsNt6LQEZm5zIs+U21HDc5CiWeCcFmBEvnr6wB48cQ71CTYWsmxp/Iio0H2w7HZKnhzk3787gaMo8AKm7cUsa7du14LTdRYIJW4JwsRr4aCzSnabpTvoYNfCXa1Xd/H5YJM2yrcJSJZizF10akD5AHnewPQQCZz3HSr5Dj1ETOSm+nvjyomAgSPQQWzgyFi59kk07QVOKnNNJKkY3La0WEsgOk1JzgL3W0tpCgT/N74vmh2RRR7BpxrmqL+DBHZuMZsKPuFArq2Swt7h4bfeOJ1UY2N9WPzv/zdT9W0N8b3vVtxVJWDEMyXLoPjuZBUbpsBggbZkrjqzPfOVGqUvWRsgk87JHCDrZiQG95kr1EPQQzjn/h4RvNjshFI2MYFscPp68AJHYUF8bONQ+yxDE1/8ni4Eu9/QTneWPdwANVrwtobZjgyIFQ2UhNpy6RypszRjbrSuqM2eWVrBo2anf878GDWBhisARwXW6RWz04GJHPPb5VNQxShSouLhEX9o6s5A0+BWEAYDLtWrTa5JnldXiZpThibXCPrTqWG8LsUl9ulLYgs56+pFWwWLYMRVg3yeAph/JBzZkytkCJ5139XeF2rtksaBNkZSwyh3X/LNESWhGJaRqGuO4AGDhWEvdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3398.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(396003)(39860400002)(346002)(451199024)(1800799009)(186009)(2906002)(8676002)(66556008)(6486002)(53546011)(6916009)(41300700001)(83380400001)(66476007)(66946007)(2616005)(6512007)(478600001)(26005)(6666004)(6506007)(8936002)(31696002)(5660300002)(316002)(82960400001)(38100700002)(86362001)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXU3Y2xjRkFVUjhUT0MvUEZXRWFFSVlLaGRVaFh2dEMzMXFTeUg0d1hweHlM?=
 =?utf-8?B?UTBGaW4yL1hTOFFWMnpsNkt5U0NzR0tRc24rUGJFR3RiM0hYSEUwNUlUcjFP?=
 =?utf-8?B?emxLY3NTUHJOQW5ESThMVGp1djJOaVFFcUJQVWNmcHhIYkxidjc3MXhqS0F4?=
 =?utf-8?B?d0Q2U1pYUlozeC94TW1TUmpMdWVGK3FoOW5TbU5PZlF1SElkYm80bVI1WlhR?=
 =?utf-8?B?ejQ3QkJBUVlmQ2Q5bFAvYmxTZmlqc0xGZk9zNzU4d09sSVRvLzZiME1yTGpC?=
 =?utf-8?B?SCsrRDUwS0pWMFlZZWxCOURhZTFTdUtuODJOV0srbGF1Q3FPY3VQWXFDTGtM?=
 =?utf-8?B?R00vaTJQcEtPQkNuYUxYTkF5WGNlUUFwRWUvYzUvZzY1dm5NbjVQM2s1WVJP?=
 =?utf-8?B?eU1yeDJ4S2VUa3BobklNSk1HTFR3NUxjTFV4bGVaYXpsMUltOUZ6YzRLM0E3?=
 =?utf-8?B?THBZd3JDU1d4TVhkMEw3Z3UyRUtVQXBLaUFTUG1vRnJzR2Y5Q3QyekdaRkJq?=
 =?utf-8?B?cE5nc3BLZ0N6ZDZwazVGUTY2T0xYWjhjUFVqVDd2N3J6Yys5Y1VvNElBQ1lk?=
 =?utf-8?B?Z1dpQkdrRXlhY1lPaUN4d2YyRlZVSUlWVm9kRXVKakJxOW55Tnh3TWFKN25z?=
 =?utf-8?B?MW5oV3hVeURKbEx2SnFCUnRUQ08xRW96RWZVTkZTRnAxa3FzczJWeEEzU2V2?=
 =?utf-8?B?M0dBQlNYbWJvNDA0WCtoNkU5dlNnaG90VWZNN1BHTFJQQ2c2dWNFQkNxUmVR?=
 =?utf-8?B?bUhMa04zcEFEZ2NCWVpFUDRuci9BS0p5NE5ObmNjQlVQU1JGQkhBbk5KUC9H?=
 =?utf-8?B?TTFXVTErY2I1VW9mMjd2OFB0aUVzTTlHZVRTRFRvWFVKemhlMkhnbnZCMDYz?=
 =?utf-8?B?RjF3OUQycWVlQzVzcENMdmU1MUY0cnlrUXZOU2c5QytwaThZT29yZEtLWkxu?=
 =?utf-8?B?VnZaRWxpbzZhWW5iN0pSekpTR3NWM2Z0bE1jaklPVWJRYWRBZjljRkNUbFlr?=
 =?utf-8?B?MXBwclBuYW9KRFlPNWlEd3VJQTNDWjhRZS9uK3V0dCt5WWhhYWN4QjVjYXdQ?=
 =?utf-8?B?OTBqRFZpZUJPVXN0V0dCZVo4TmlHMU9qUkY3U0pJSW13TVpvdk5ha0F0ZEN2?=
 =?utf-8?B?c2JBVjhaUXpSQnYvMVQxTG5BUkQvbnM2U0ttUFBNMzBMZnh3aFdLc0pnRC9y?=
 =?utf-8?B?UDJ2SmF3NnZzSFlwSUlFbzdXNHBPczRQUmJDNFNzdHNNL3k0KzJoWmhLa01J?=
 =?utf-8?B?WERPR0t1MEM4ZEFJak5FTGllVW1EcC9LRm0rM1Uwa25WNWVEYjBCNk1LbDJY?=
 =?utf-8?B?SWhta2paUW13OTJtdzdCc0tuQlpJNXF0bEYxb2l6Mk9YVWxaWUMwd1FwZHRR?=
 =?utf-8?B?S0VVVFZTTnA5UFdFY1JsbWpoTFdGNXcwbU9LOXhma3B1MzVNa2ttYURMa0dD?=
 =?utf-8?B?VFlKVTg1ZC9uN1d0OUdoaGlqY295V08vOVRPZGZmZDRkUmJLVWNycE91QW51?=
 =?utf-8?B?VWl5ZEd2OWtzUll2MmtMc2xsMGVNQWwyUUdQL2d3S01EUFJyMUxYbnJ5cVcv?=
 =?utf-8?B?dXhxb1NoOXVtVmRTMHF6a2h5ODliL01PWk9yQWg5UjlFZVhTYTBBaElvWkor?=
 =?utf-8?B?S3VDc1lBVm9mS0NBTkpucURWcnYrVU9vSFVwSW9LdlJIbmMyLzJENVUzV1JJ?=
 =?utf-8?B?QkZpcFkzTjlVRFhlRTB6T2tEb1M1cUlXWlZCSytjMTI5MjI0TG1pSFo2a0Vl?=
 =?utf-8?B?ZklOb0VtTFROM3kxWWRKeUZGdGdGVjYyMldGUTV1anJzT0I0UDFVSDU0VXNQ?=
 =?utf-8?B?Qy9YMkxMbFdkR0RJeStpa3BVcktiaVQ4WTE5RU1TKzNKMEFTNDRaQktkSkhl?=
 =?utf-8?B?aEkvT0c0em1YZzVTdmJTQ25md1FNdDUyZkphUWNVNUhuYzNUZ2hHZll5TStV?=
 =?utf-8?B?NmtYWC9KNmJWcjErd292WDFzNW8wbktQSndKb1JwMzBlUGxpc3FXU2xhTWZp?=
 =?utf-8?B?TGJEazliMnFKNFdtS1hjbFdiWVNBbnJ3b3d2bFJQaU5vVmMxRXA5dVJ2c2FE?=
 =?utf-8?B?TEN4TnJNUm9sNVJYeGZJbmJKdk9TZnlleTJzWndFV3piVG1oZWtPQkU5eFNV?=
 =?utf-8?B?aWdzdFJtcjUxaWdJQ3g4QWJRVU5hbjFvZy8zZGFWMlJXQzhsVytPMldlNWpq?=
 =?utf-8?Q?hVrOFZVVeNU5sFQGHUo5XOM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3141f579-8def-4308-ced2-08dbb56e633a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3398.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 22:03:12.0664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MUOXxBIEzliGIztLKgR8/mEd9lAG4NMC+PMzB/2Khuq6pZaHfWDF4+YPSCqFwYaEPE3OvhyiXbspv9r20jrx12HHfvMheFUCvmPyE2S9nkO3HGmKecHpTpoF59oPKTh1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7837
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

On 9/13/2023 3:57 PM, Alan Previn wrote:
> Debugging PXP issues can't even begin without understanding precedding
> sequence of events. Add drm_dbg into the most important PXP events.
>
>   v2 : - remove __func__ since drm_dbg covers that (Jani).
>        - add timeout of the restart from front-end (Alan).
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c |  2 ++
>   drivers/gpu/drm/i915/pxp/intel_pxp.c         | 15 ++++++++++++---
>   drivers/gpu/drm/i915/pxp/intel_pxp_irq.c     |  4 ++--
>   drivers/gpu/drm/i915/pxp/intel_pxp_session.c |  6 +++++-
>   drivers/gpu/drm/i915/pxp/intel_pxp_types.h   |  1 +
>   5 files changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
> index 5f138de3c14f..61216c4abaec 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
> @@ -321,6 +321,7 @@ static int i915_gsc_proxy_component_bind(struct device *i915_kdev,
>   	mutex_lock(&gsc->proxy.mutex);
>   	gsc->proxy.component = data;
>   	gsc->proxy.component->mei_dev = mei_kdev;
> +	gt_dbg(gt, "GSC proxy mei component bound\n");
>   	mutex_unlock(&gsc->proxy.mutex);
>   
> <snip>

Can we move the debug print to outside the mutex block?

review complete conditional to the above fix.

Reviewed-by: Balasubrawmanian, Vivaik 
<vivaik.balasubrawmanian@intel.com> 
<mailto:vivaik.balasubrawmanian@intel.com>

<snip>

> base-commit: 45460a37f9be43072b509ca6044b215648f56221


