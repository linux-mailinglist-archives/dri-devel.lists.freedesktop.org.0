Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC556013EC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 18:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1112110E69F;
	Mon, 17 Oct 2022 16:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2620110E69F;
 Mon, 17 Oct 2022 16:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666025502; x=1697561502;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iJKoDlL0rft5l0LOcRTBlpKoOAZFIJjIKJHiRA4kYA8=;
 b=OYAhDeCgZKX5plsspocTi+TJ0RpGC5stIIHc5geNshA8qWzH99mN+vt1
 mAE22ouAGlrukysfKsOVIEfMxAK1iS0HCRIjTB0pwtdHe86wODrtJToxJ
 YKbRRr7xMyLxnwaK7y8xyBTpyeviB5xGUkd33i8h44Dl/yqvAwa/L3bue
 ls/X4cUJfn1zSY+NFH3Ghgqrj16nChBxeKt2EiRIBlBJOCkaifZMm4pm7
 iE1gz/atgsebWzf6U+tA9zoQ9WgPchm2k+ceXJoKXqfRfNx63VxvxGZa3
 utSMEVR0FaI8NRYCowNZd9+hEziWS3QrQsDZBt279DWeSLQlFT4W6D/tK g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="285578051"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="285578051"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 09:51:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="630759323"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="630759323"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 17 Oct 2022 09:51:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 09:51:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 17 Oct 2022 09:51:19 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 17 Oct 2022 09:51:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+xAZRqKB7vAkERT3RTPzGTWWYJ4yKjaXZmxfi6uJdyIPFJW6HD7DOd62+mUYYyW5D/k68HwXR4DKYp2ImEgk2arGQDlFLLznPqMwCwmDj+c2CjC7yKgLCQMPWywZZi7SSOGzJrk9zM06ZevuKD2IR5wJUNjcRP6/2YbkavPhwx8JLwVNa9CUOpsK+d74rCKKJmblTQFCI5zNsIlQFDbtKGeUhJw1OYGYkS3xe9tDUrAvgTQNItinjxQvtLETaiSF4KfwzqUdvIGkyGjZxVsS2wSpzExyYmCEkpQOXqmlyCLhjaCUvO1Ux3gwY8mNMyO6UuGDQhzZuusdiN9jjkVdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ueajEzJjBQBZsT0tV/JjCJFqzPDbh6h8r0zB2FTe/Ks=;
 b=gEKVYlsIzsDXIZaigWFLDiiRNdqVa4PqTjijS6Cro9PV0Hub7lUFev4naQP/A0LCx/zQqMnjTGfzJ34FtWwMHFhZRqA/IoiWjqCj7z4EUAsNbBnsP+TJkvIgyWngcs8Se8B7XNbxu0DluPH1ju3i2szOJKuVF6VanGHFnOxGM5nynkWxU6LZdF677N0pLK6yhelsKqTG2i3EzpB3klD2/URZZ6704G3r4Ff77IxOmuqPWK5FHJgjDc5AT8LuDAOCqPVgjzS3r5htwKv7+w+CgAvEd5bSoy2Az7rYdW1PcsVyk/cuwQapHSp7K2EI1kT2DHCAPHyR+BwXJ9HDP1WDlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 IA1PR11MB6443.namprd11.prod.outlook.com (2603:10b6:208:3a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 16:51:16 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67%3]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 16:51:16 +0000
Date: Mon, 17 Oct 2022 22:21:07 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 04/14] drm/i915/gt: Correct prefix on a few registers
Message-ID: <Y02H+wuSK4ewSFqV@bala-ubuntu>
References: <20221014230239.1023689-1-matthew.d.roper@intel.com>
 <20221014230239.1023689-5-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20221014230239.1023689-5-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN3PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::17) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|IA1PR11MB6443:EE_
X-MS-Office365-Filtering-Correlation-Id: 386ae12c-4bab-4a77-a436-08dab05fceec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iQSfCJWjzheAJAI9XhLXLBOuL/9Fbt65z/X3BszQHZNOI75lT8fNo50uWFhYdwrviIzzV0jwRdbMefrqAKcAU2KoVxlVHsOspaoBKl0VdXK/lqc3KApQNmDl+ubCrB3QtaL+8lOm9HGRl6RcN3JEfOm+e9dngnKyE3nxFCWQQJcKF+27Mx23qCuyIWH2na/J3ZFBDBjaCoOGVP8kwY5QOPTCj0oePcsjNubCWgT0zNNbRjwax3priGkHZFc9ns/wuszMFB94OVQvUXSDYf2Ibe6AcVpS+VFgHrykkOLdCW4v7JJKWCjqbr1+wBSIpbHaPtxSqKge2isRlmKfhLrdgWmn/7GM9Q/C5gNpSRkgMeO59nRNIWt1hMbUkoJlpMN/o6RqYVYF2oWKBA2yvHY+b+T3XkzOjmo8ZZA/O8aWbfX+R/eyThtjenqxn9K/KQgo+BhNbr6XAfWe8PIYxV/n/yNUxUvlzPWhtTu6q7VChWYU9OUa2aFqhHexnsLGIzQKvHq857d64cycXEIg/IC7QMXK4znefvn2zbWj4Et7yp0/3FXTRohR6KrxR6/3yS7KrD1+PgEccJbp9J5g6mSMpG72OaMGEC2lWbuC8JAQkT2/vMjXr37mqydejDDLb0CWCXm88XURxQNraKIIh2/xQWiEGQ7YTpVsDoY4hbX/IfQ/GhbEYIpCzCaXMdJbA23upYWtDwKLqJC0918jx3cT4Lr/3aahC4bTEpuiO/J1+VH4v3xSUV8dEsJGRFj6ss9V
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199015)(5660300002)(44832011)(66946007)(66556008)(316002)(6512007)(478600001)(6506007)(53546011)(41300700001)(9686003)(4326008)(26005)(8676002)(6486002)(2906002)(8936002)(186003)(66476007)(82960400001)(33716001)(83380400001)(6666004)(38100700002)(450100002)(86362001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0xENnVrdGdTV3hWMUxKWld3Ly9FM3dPS3R3d3RSeVJsT1BHUWtkUkR1Zi91?=
 =?utf-8?B?eVZ3dUNEdHJJYlRDNC9nZkd1ZDRjeHBLSG51RDdkUmpWRWVPQkdFTUR0K0ZQ?=
 =?utf-8?B?Tm5raUc2QTJRK3dWeHJtNzIzc25RR1NtQ20rS3hTb3QvZUdRUXNsV0Y3NjU2?=
 =?utf-8?B?VFR6QkdyWFlqa1ovQkJadWFCVUV0aEFraWhzN1l0ek02ZjVpQitqaEhvK1dm?=
 =?utf-8?B?VVJVaWpucE5wbGptalNpUWdSZHM0YVRPUlVSM0VCdUI3OHhjcmF6WVh2aS9y?=
 =?utf-8?B?MWVvMWNhYlI4UHFXYWFNWUg1NDR3TkZ0cGkvc1Nmd2hXcmJWL0t4eXhDWXZN?=
 =?utf-8?B?UTAyQjZ0MUZRSjJwUmh4NnZiYkMvYzdXTzJOdXpRaHBYWFF1ajBLVTNzMmdt?=
 =?utf-8?B?Y1RCNnJCRUtuZm1JaW9PQkFOanRLeHpqbzRMaW5NM3ZtL3lyZXRxWHJrVkM1?=
 =?utf-8?B?Wks2dlN2M2hRVU5FdUtJOGVLZDRRTi9saW1qVGRWYWNMSEgzSzR6Rm1mSWEv?=
 =?utf-8?B?Vk4xR3dPcytLU0N3OE9aamRDZTdaNFd1NVhYdk1pSzU4aTN4c3RJbGpNVjNB?=
 =?utf-8?B?emFiM2E4QzdKd0JNTEErMGJLYVFhL29ReDF3d29iNEhDMW0wNUNVUWNpaVFS?=
 =?utf-8?B?SFZ1Ly9JejZEYW05STEvUVIvOHg5SzdNZHJOblgydFNieDBQUTdmNldFcXN3?=
 =?utf-8?B?c2VSaU5kYytudzNSUXp4M2tndjVBWUd0ejA0QUNPRkxObFp3WW0rZkY1Y2pO?=
 =?utf-8?B?VFREYzRXaURNaENXRWN2Zkp3WTlXUkFCRHEranMzaFBKL3A1M28ySDNuQkpn?=
 =?utf-8?B?OU5pSkxGMkZINEhUQ3RsckdBaTMyVm5EOHExeXNkVlFGMmVTS1dHMFplT09j?=
 =?utf-8?B?aVU5Mm5URGovd3J1TXgwcWpMWTFNNjJGVjY5SW5nT2pWbkE0UG4rTEZacHVQ?=
 =?utf-8?B?d0gwb29raU9QUWROUWdqZmNhREkwMENCNEthalRhUWtneVlwOWd3Z0JKb09E?=
 =?utf-8?B?ZHBCOTlwaWpBaUVvM2tkMXp5V1R3SzF5aGZkaXJvQzQyd0xqTTRvVXMvbkpZ?=
 =?utf-8?B?alBTZGI0U1hkM0lIcUhFNHdHYTdybnNIN1pLK1dMQW9Hb3UxV2JSdGFGSnk3?=
 =?utf-8?B?aXVkSE1LUHBFWUx2VzhaMlhyU0UzRkp2U0JNME9KNk9IZWRGZnF4TnIyM3lH?=
 =?utf-8?B?QTdwMGdDaUNZOVYxa1Y1R05xUjc2N1N4cEJoV3MzUnRzanZYZkh3YkFWU0U1?=
 =?utf-8?B?WEYxbjNsV2xjZWhZejF2dWl6RWdpcUIvMTFydGVDS0hXWXUvSVlacW9YMldQ?=
 =?utf-8?B?TEtNaTJQa3hTdXB3WTNhRzZvaFBCZ2xhd3NLMHAwQ3FtMEthNktyaE9ubGww?=
 =?utf-8?B?c2dQUGpCSG10R09VaGVQOXBVaWs2VnovQW9uTmI1R21kdit4cVJjTWlFZzdy?=
 =?utf-8?B?b1hyT0ltWEJCd0NJMmY4ZE5aOEdVMkd4ait4VERncWpQWDVTajhwUTVYZVZz?=
 =?utf-8?B?Q1cxSUtRVnFwVXQ4aEN5dWw1QmY2UURMNUlPWmNvWk14bUF6S1ViMmNtMXlv?=
 =?utf-8?B?VFU2WEdnODNwaU8xNmptQTEwV2VBQmlQZkFBcFZjWjVWcDM5aUdrcU84NVE0?=
 =?utf-8?B?RzJzQzBjbUZ5VUtEa1VkTUJ4ZzBNMWxvSGRhbStwMmFUSzJnNU9pQUpEaXZD?=
 =?utf-8?B?eUIrTWNzcEZyc2pubDgvVVhuRFZ4d0loSDdITjlsWDk1dzhqMjJJa0FUNEpV?=
 =?utf-8?B?bjhiSWRWTVdvMTA4VVhaV0o4N2J5VEgyYURaWk5FcFNKNGwxRXJsbDBDL0hp?=
 =?utf-8?B?eXhVN0xwdWwvYWN0Z3JBWGhMZTJYOUZ4Nm5ncjJwd2NYMTJVVHkyYlZPbGp2?=
 =?utf-8?B?N1FZVHJldnNHSnY5cTJSempYcDhxWmlkVVkzeVVsbktHUTE1akpFWFlWaUZU?=
 =?utf-8?B?R3U3WWF6cDRWZHl6SUN0K0FIZUU5VzdVcG9icWRTWlhQdWcwTVJydjNjVWlQ?=
 =?utf-8?B?dlVPMzBMUWNkSVNhakJhM0NrVVVzVDNDK2RSelIreHl1SzJNL24yQXpCWjhC?=
 =?utf-8?B?eEEyZlA4WkRRMFNVL0ViQkRiSEtrOG0yM0YyemtnNk9DV3JIRmY1cGgvMks4?=
 =?utf-8?B?TDY5YkhTZWdEalZkd1FtNEFrS1Y2YzhDNUVyQVplbDhzSzRjemptcmpPUVh6?=
 =?utf-8?Q?G1fqTbND3WrVnzQjKkLX2cg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 386ae12c-4bab-4a77-a436-08dab05fceec
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 16:51:16.7749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e22gnark12k4lb/5MrIEwlrmXTh7qAhxAAvi0vd2RT24VecHDv9LucxhJ4k3oLP5VlWClNqHAI1/v144TsixFW0WOQPs/XDELBp1J47MoNQ8u2b5D/HsFdf70OEu1jTW
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
> We have a few registers that have existed for several hardware
> generations, but are only used by the driver on Xe_HP and beyond.  In
> cases where the Xe_HP version of the register is now replicated and uses
> multicast behavior, but earlier generations were singleton, let's change
> the register prefix to "XEHP_" to help clarify that we're using the
> newer multicast form of the register.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  8 ++++----
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 10 +++++-----
>  2 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 71d8787230c1..890960b56b9e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -486,7 +486,7 @@
>  
>  #define GEN8_RC6_CTX_INFO			_MMIO(0x8504)
>  
> -#define GEN12_SQCM				_MMIO(0x8724)
> +#define XEHP_SQCM				_MMIO(0x8724)
>  #define   EN_32B_ACCESS				REG_BIT(30)
>  
>  #define HSW_IDICR				_MMIO(0x9008)
> @@ -989,7 +989,7 @@
>  #define GEN11_SCRATCH2				_MMIO(0xb140)
>  #define   GEN11_COHERENT_PARTIAL_WRITE_MERGE_ENABLE	(1 << 19)
>  
> -#define GEN11_L3SQCREG5				_MMIO(0xb158)
> +#define XEHP_L3SQCREG5				_MMIO(0xb158)
>  #define   L3_PWM_TIMER_INIT_VAL_MASK		REG_GENMASK(9, 0)
>  
>  #define MLTICTXCTL				_MMIO(0xb170)
> @@ -1053,7 +1053,7 @@
>  #define GEN12_COMPCTX_TLB_INV_CR		_MMIO(0xcf04)
>  #define XEHP_COMPCTX_TLB_INV_CR			_MMIO(0xcf04)
>  
> -#define GEN12_MERT_MOD_CTRL			_MMIO(0xcf28)
> +#define XEHP_MERT_MOD_CTRL			_MMIO(0xcf28)
>  #define RENDER_MOD_CTRL				_MMIO(0xcf2c)
>  #define COMP_MOD_CTRL				_MMIO(0xcf30)
>  #define VDBX_MOD_CTRL				_MMIO(0xcf34)
> @@ -1155,7 +1155,7 @@
>  #define EU_PERF_CNTL1				_MMIO(0xe558)
>  #define EU_PERF_CNTL5				_MMIO(0xe55c)
>  
> -#define GEN12_HDC_CHICKEN0			_MMIO(0xe5f0)
> +#define XEHP_HDC_CHICKEN0			_MMIO(0xe5f0)
>  #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
>  #define ICL_HDC_MODE				_MMIO(0xe5f4)
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 3056b099dd17..96b9f02a2284 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -569,7 +569,7 @@ static void dg2_ctx_gt_tuning_init(struct intel_engine_cs *engine,
>  				   struct i915_wa_list *wal)
>  {
>  	wa_masked_en(wal, CHICKEN_RASTER_2, TBIMR_FAST_CLIP);
> -	wa_write_clr_set(wal, GEN11_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
> +	wa_write_clr_set(wal, XEHP_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
>  			 REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f));
>  	wa_add(wal,
>  	       XEHP_FF_MODE2,
> @@ -1514,7 +1514,7 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  	 * recommended tuning settings documented in the bspec's
>  	 * performance guide section.
>  	 */
> -	wa_write_or(wal, GEN12_SQCM, EN_32B_ACCESS);
> +	wa_write_or(wal, XEHP_SQCM, EN_32B_ACCESS);
>  
>  	/* Wa_14015795083 */
>  	wa_write_clr(wal, GEN8_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
> @@ -2170,7 +2170,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  		 * Wa_22010960976:dg2
>  		 * Wa_14013347512:dg2
>  		 */
> -		wa_masked_dis(wal, GEN12_HDC_CHICKEN0,
> +		wa_masked_dis(wal, XEHP_HDC_CHICKEN0,
>  			      LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK);
>  	}
>  
> @@ -2223,7 +2223,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0) ||
>  	    IS_DG2_GRAPHICS_STEP(engine->i915, G11, STEP_A0, STEP_B0)) {
>  		/* Wa_14012362059:dg2 */
> -		wa_write_or(wal, GEN12_MERT_MOD_CTRL, FORCE_MISS_FTLB);
> +		wa_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
>  	}
>  
>  	if (IS_DG2_GRAPHICS_STEP(i915, G11, STEP_B0, STEP_FOREVER) ||
> @@ -2816,7 +2816,7 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
>  		}
>  
>  		/* Wa_14012362059:xehpsdv */
> -		wa_write_or(wal, GEN12_MERT_MOD_CTRL, FORCE_MISS_FTLB);
> +		wa_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
>  
>  		/* Wa_14014368820:xehpsdv */
>  		wa_write_or(wal, GEN12_GAMCNTRL_CTRL, INVALIDATION_BROADCAST_MODE_DIS |
> -- 
> 2.37.3
> 
