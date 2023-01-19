Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF36672E7C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 02:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7EB10E88B;
	Thu, 19 Jan 2023 01:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903CA10E88A;
 Thu, 19 Jan 2023 01:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674093020; x=1705629020;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0xgZhlVGmQK24Mggg3N6mb16zsYqbkaHfJQtOseUwnw=;
 b=dn2YPMZISktNVicPxTQVB9CoM+k7VWYYfwf+AmWkF1qaQrR1Cd7/+3Ep
 sALvVw3PRKBtW/styNlNhzu/XtUSVbtACIvQi0t8bztJsxAMKKVW7QHod
 axbHKEpxh3M1bsP8mnufcIQ02Ejkm1gpYNZPtMth7RaE0u9W/D4/fEICS
 ukwpz9Qn8d3e3hKrlG/T4ni7N7m8tvpz4bBSDew8iPUqC3qS3khGDgaVF
 8mf8eKheFpwz0EKObTwEw6UeSMQiL3S+pIkbvcMXql+yS6bNnyrXkOsUX
 Y8xVZXfCrezZ2tLG/taSNAbOz4jXUDoLSwrVahfJPUC9lmx5RTELGwnSG A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="411402902"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="411402902"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 17:50:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="728472597"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="728472597"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 18 Jan 2023 17:50:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 17:50:19 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 17:50:19 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 17:50:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8RaVbfTcrOxfONNyja8z+RxMiWNapuyDzNMopfq0D6PDdVb//dF1ghQ5WoF/XEcpx+PkTnE3EE/8guYoush27BDisHTSULO9WpuWcxbv2SmI8KzFTrqPRlL+xIDluMfXEcWdmUMNo06XTJnxmbN1KtI04faiikVY0KdaTidXvpgdxDE2yoYmW7fapbgyy2Qtqhjnx6Fw8rbxA7F9l9cTC0C+uxyXk8L3ZIuTRmAv9zXh687yg0er4qX7aNBGLJq1u6QDFKXFmCw7Z2VIc2GdneOMHLQXiz+jzc3Ld1q2D6OsZYaKIiXk6TqCtNHOIZG4m6d77vKIrUt3bK4afJUyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GY4RyLoFdoCCMS3psUa2+1JOlXQzK4uoKfBuT1xnNLo=;
 b=PSi/AeYnNHCyZ57/PB4vWRimYCnjiW6tbwU4tKDPTyf321WhsWp3+WLi/ngnTlYIygmr1jWdI3FNFVSzUp+l04ifSV1CgNwNMzLdOSV2tSWl8AnbMyUHOL1KrKoR9s6SniN3Sp0C5wsQBTn1YclrA2o8bv//Lj2MTYvwK6+hi88BGjZaTiNFAL/QwW41h/y5yfabvPL7KlaTh4JbiFX1xcRB+VjpqaUO+HeMNskMK+oDqkBgt+VFmdxBU5j1aJyDv0RqE/30FgX8ukMRuWb9zChg62+r4RlqIgk9lBQ43oGFQ+vECz/eMoUwoskMutV37bxMSogtlCI4m+OKlHB6Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SJ0PR11MB5183.namprd11.prod.outlook.com (2603:10b6:a03:2d9::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.24; Thu, 19 Jan 2023 01:50:17 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::62c1:155c:1857:167a]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::62c1:155c:1857:167a%9]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 01:50:17 +0000
Message-ID: <913d9c30-daa5-debc-a8ae-25f085663c44@intel.com>
Date: Wed, 18 Jan 2023 17:50:14 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/9] drm/i915/pxp: Add ARB session creation with new
 PXP API Ver4.3
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230111214226.907536-1-alan.previn.teres.alexis@intel.com>
 <20230111214226.907536-7-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230111214226.907536-7-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0100.namprd05.prod.outlook.com
 (2603:10b6:a03:334::15) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SJ0PR11MB5183:EE_
X-MS-Office365-Filtering-Correlation-Id: b9aceb78-9e05-4d33-7cfa-08daf9bf83bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gWYnrI2fHlXpGY+QBqS8jATl7LDriquCi8I5wiW4LVWifiS9VgCHBT5uolJLL16B2KjyVy8ItPX58xlf0GVzp5MOXaeexvLTO99kvIo17D99rRZ7n/4gEGPaPJ+82XrDpZ1RaUYVKsksJ9puyMKcYfk2OlUJDV4ZX5PYyLdNEx8sHSTjzFkl2mSGdGM0EURcU09DNQ1ZC5G0Y5BYF+delPPvjuFss0qAKOYJiECGw7G8R6pZzynTQ5IMkXtKYik2veZ6mofRRu5MIsk9AuiOk5WgK0QsMuBP6w/819eOH6IK440YZKY2UMMi1bWc4wgKcnZmvyuwHztM1bEYb5D6OuloCfnSNyxrUpc0AQzWRTx6dLxCPuYDXEEu1MUr28vshOGFtL4tvO9SNKyhc47f0DssdzXB6Hhegz2MTzolotpDvV34u8kvXbWU9axrTGZv9CMo7IBgdMroKJypN+VYbEUV0UPpAKZHXc5/omGAnr1Cil7qW4pSzuf+Qh/zeqGNY9T2+zG7EbgY87aJZum8aPDtGTZ0FzzrZgvWHqnJiAtxOaKb4re1KQLHgQfNx8FjhIBObpaFtFcGDDx85WU9D6t2Y1BNOK+d/cAVPtFGaelI0AfF45MqkR22/a6a48BIFYBdGWvsoKygylf9M7+9TVGpl4aUX53G6tnymAffcsODZopgudfzoIcwAgce9Mv+el1A5TqXrwASJl6heSfF/+wsg/OXV/0lYPKYLwSaPtk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(136003)(366004)(39860400002)(346002)(396003)(451199015)(6506007)(53546011)(6486002)(26005)(186003)(6512007)(478600001)(31686004)(2616005)(6666004)(66476007)(66556008)(66946007)(8676002)(4326008)(41300700001)(83380400001)(316002)(5660300002)(8936002)(2906002)(31696002)(38100700002)(86362001)(82960400001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2RBRDdjUGRZTW9SSHBVYm5uYkhTc1BHTndkbzRUenAxMFZUSkh2MlZjOE1o?=
 =?utf-8?B?L2w1dTM5K2pUbVc5aHFjUEJ6SitSYVFGay9aVEtvb3l3dFhobkxzQUNrU1dz?=
 =?utf-8?B?NWpLYTJJVm5lc00ra2RPRVN6dGVCdm5tUWtNSzYwWFJJQ1FSc0p5di9scklM?=
 =?utf-8?B?dklyOVp5ZGRhdFhiYzd3R3dhVkVScWFXNks1Q0VGQ1ZjcndlNWdSVTZLTUhl?=
 =?utf-8?B?eVdKVXpVMGNQM1ZRWDlsYW9FTWlrcmM1dm5zRGJGVjlHR1JYUVU1ckhGcUVR?=
 =?utf-8?B?WE12ZUN0NGYyQnRCREUzOXhVbWdveDVJdHZaZEtWbDcwblNZYm43QkptRldP?=
 =?utf-8?B?cTZQd05WREFSM05UQ1Vic1NJaGZ5TUFWVVM5Rk1kcFl2MzVCYW1VSk9SbW0y?=
 =?utf-8?B?KzFkNGx5akI1bW9nSXJnQzFXVFBZbE1wTTd0T2hua0k2V2VZSWp1Vnl6Y3dv?=
 =?utf-8?B?NzlUdmxIelFxSHJvUVBxa3RYTkhsai83dDBJaFJBSElLeHVKTHk3Mmx5bEVv?=
 =?utf-8?B?N3J4ckJUMEtMaEI0TEdEYnR6TWxxQXhEYVltWHpUTS9sZTJPNzNBSy9xNHJl?=
 =?utf-8?B?ZHhXd0NYTlZjYXlyUzFSQ0pKZ1ZpaDdocVg3TTFtS2gybW45eUVyZUhEUXk1?=
 =?utf-8?B?dk41ellkZ1hHWENWVmNrK1l4RjdKUnBOZUlDbzhWaUtpL1R1Z1BSWUQvbHZm?=
 =?utf-8?B?MlBsV1hSakRFcUlFNjdGWlBoZi9SYnE3UUpuaWdaZkx6by9GYVU5VExDYjF4?=
 =?utf-8?B?RWxYZlhrWEdUN3V4VkpSKzN0azNHWnA2TFF1ajhOdVFrVmRUb3NXaHgrTmZo?=
 =?utf-8?B?SHZNNSs0dG02bVF3NlA5UEZqNzBSZWQ5M1R6NHdPNkhiQUFXN3ZQZXFoelBR?=
 =?utf-8?B?ZGFyNFVEMGdveCt0ejluM3lkSE5Vd3ZjRGNxbFREeFdCbDFSeDdER2h2OHNu?=
 =?utf-8?B?czlCR0QzOTZHVjFBY095bGI3b0lFS3NrVGpRSnhOOHFBbU8xV2dPZW0vc0ht?=
 =?utf-8?B?QlhTVGkyMVA4dkFRV21RZ3dLUnBtMUFZWlMvM0poSWd0aGY5eWxJbi82TWxk?=
 =?utf-8?B?S25uYU42Y1dacktCaStQNEpsQmFTZUR3TkxaaHdYOE9sQTRyS09JQ1lRZkM2?=
 =?utf-8?B?eExtSnZDc0ZDY3ZFK3loSnNGelVOaWlOcW5JMDhjWnhZNUtNbEtlOHk4Zis3?=
 =?utf-8?B?dzFFQWRYVkdOczJCeHNYMXQ1MGtlbk5xQzNUWEM3cnV4a0NHVWxxenVncndt?=
 =?utf-8?B?b2Frc1J3eGlkSVZ3R25sNDhLWm5uNFhSelRUTXJUcUJEeVJxNDFaN3JZTTNV?=
 =?utf-8?B?TGtJSzNXTnk1dWhqaVJnSjNQVmlJNjk3OUhqdHZPdHRaZlEyUUNuY2Ezengy?=
 =?utf-8?B?N0ZPUGpFTElJWUUzSDQ5VXZzdHU3SEovUGxwMHVGcnVtQVc3THFwWjVwb0gv?=
 =?utf-8?B?VC8wdjJmNFNZOGpOaE1vbkxrVzgzQmNoOGhDZWI4Y3NlZXNjYllhN09EYXhk?=
 =?utf-8?B?TU5KWXA4ajBQcmt4cjBtdU1lQU9TTTBVaUk0aThZZ3Q0b21tOTlOTFB6eG1v?=
 =?utf-8?B?T1M0QzdLeHBSeldhSm1TelZ3MnpQZWNweElxR2FMOE1tanFoQ1UyYzU3SEE1?=
 =?utf-8?B?b0pPY2NxeER6UnNIR1VHS05nczRjbThCVyt6enZmMjlzdHNkYkdxTm9BcXlQ?=
 =?utf-8?B?Q2NtMUltbXJnbmFVSkx1WE9YRmVVdGpDb3NESXF1OTZ4T0g5Z2ZSUHVuams1?=
 =?utf-8?B?cmZCY0huRzkydXQ3aGJ1WjArUy9FVTM1Zy9yMU9idS9WODYyR1dXbkFleXYy?=
 =?utf-8?B?MUNRL1R2dHNvT0xPeVNqU1JsVUplRmFGN1RhRGpVOWg0d2RPTFd1TS9vWU1x?=
 =?utf-8?B?SHBJNFhuNzVzL3Nta0xvQUlHbnZKVUtmTkl5V3VndmVhLytIYmZqU2lZSWpt?=
 =?utf-8?B?WTl6N1ZTeHhBam5XSko1SWxyblFJaDk2TWdySmhMdzl5U1h5U3QzREh5WjdI?=
 =?utf-8?B?aWFZTytra0hKVXEwbExSMEI3Ujh3ZFpSbDZFekNDbzdxbjB2dUtlK2I4TXRW?=
 =?utf-8?B?SWZRZWM0c3FHbEE4TXlDc0V0TWZzOWtmajFJdXpxSWJ4TTNueXJQdkNOS1F3?=
 =?utf-8?B?aTNxQjhWZDZDUHQyd3lzaDlTdU52eFFISnlsYUFDMXdHZUZKZ2xpaUZKNC9R?=
 =?utf-8?Q?RvJiM8UPRDwquYMc9RTThg0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9aceb78-9e05-4d33-7cfa-08daf9bf83bf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 01:50:17.2669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IS0W4VtbVjo+aCUNnpu73kjS3d6yNo5rOwVLDbU0iGNW7xL69yXgTWtQd3cpDqrYCCIhGkxAR2IhqyocADk/IHgApGxe0ejANgP5ooiCRrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5183
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
Cc: Juston Li <justonli@chromium.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/11/2023 1:42 PM, Alan Previn wrote:
> Add MTL's function for ARB session creation using PXP firmware
> version 4.3 ABI structure format.
>
> Before checking the return status, look at the GSC-CS-Mem-Header's
> pending-bit which means the GSC firmware is busy and we should
> resubmit.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   .../drm/i915/pxp/intel_pxp_cmd_interface_43.h | 21 +++++++
>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c    | 56 ++++++++++++++++++-
>   2 files changed, 74 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
> index 52b9a61bcdd4..ee78c0817ba1 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
> @@ -11,6 +11,7 @@
>   
>   /* PXP-Cmd-Op definitions */
>   #define PXP43_CMDID_START_HUC_AUTH	0x0000003A
> +#define PXP43_CMDID_INIT_SESSION	0x00000036
>   
>   /* PXP-Packet sizes for MTL's GSCCS-HECI instruction */
>   #define PXP43_MAX_HECI_IN_SIZE		(SZ_32K)
> @@ -27,4 +28,24 @@ struct pxp43_start_huc_auth_out {
>   	struct pxp_cmd_header header;
>   } __packed;
>   
> +/* PXP-Input-Packet: Init PXP session */
> +struct pxp43_create_arb_in {
> +	struct pxp_cmd_header header;
> +		/* header.stream_id fields for vesion 4.3 of Init PXP session: */
> +		#define PXP43_INIT_SESSION_VALID GENMASK(0, 0)

GENMASK(0, 0) -> BIT(0) ? same for (1, 1)

> +		#define PXP43_INIT_SESSION_APPTYPE GENMASK(1, 1)
> +		#define PXP43_INIT_SESSION_APPID GENMASK(17, 2)
> +	u32 protection_mode;
> +		#define PXP43_INIT_SESSION_PROTECTION_ARB 0x2
> +	u32 sub_session_id;
> +	u32 init_flags;
> +	u32 rsvd[12];
> +} __packed;
> +
> +/* PXP-Input-Packet: Init PXP session */
> +struct pxp43_create_arb_out {
> +	struct pxp_cmd_header header;
> +	u32 rsvd[8];
> +} __packed;
> +
>   #endif /* __INTEL_PXP_FW_INTERFACE_43_H__ */
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> index ff235822743e..1b06629ac16e 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> @@ -43,7 +43,8 @@ static inline struct gsccs_teelink_priv *pxp_to_gsccs_priv(struct intel_pxp *pxp
>   static int gsccs_send_message(struct intel_pxp *pxp,
>   			      void *msg_in, size_t msg_in_size,
>   			      void *msg_out, size_t msg_out_size_max,
> -			      size_t *msg_out_len)
> +			      size_t *msg_out_len,
> +			      u64 *gsc_msg_handle_retry)
>   {
>   	struct intel_gt *gt = pxp->ctrl_gt;
>   	struct drm_i915_private *i915 = gt->i915;
> @@ -75,6 +76,9 @@ static int gsccs_send_message(struct intel_pxp *pxp,
>   					      msg_in_size + sizeof(*header),
>   					      exec->host_session_handle);
>   
> +	/* copy caller provided gsc message handle if this is polling for a prior msg completion */
> +	header->gsc_message_handle = *gsc_msg_handle_retry;
> +
>   	memcpy(exec->pkt_vaddr + sizeof(*header), msg_in, msg_in_size);
>   
>   	pkt.addr_in = i915_vma_offset(exec->pkt_vma);
> @@ -91,7 +95,7 @@ static int gsccs_send_message(struct intel_pxp *pxp,
>   		goto unlock;
>   	}
>   
> -	/* we keep separate location for reply, so get the response header loc first */
> +	/* we keep separate location for reply, so go to the response header now */

Any reason to update the comment in this patch and not directly in the 
original one?

>   	header = exec->pkt_vaddr + PXP43_MAX_HECI_IN_SIZE;
>   
>   	/* Response validity marker, status and busyness */
> @@ -108,6 +112,13 @@ static int gsccs_send_message(struct intel_pxp *pxp,
>   	}
>   	if (header->flags & GSC_HECI_FLAG_MSG_PENDING) {
>   		drm_dbg(&i915->drm, "gsc PXP reply is busy\n");
> +		/*
> +		 * When the GSC firmware replies with pending bit, it means that the requested
> +		 * operation has begun but the completion is pending and the caller needs
> +		 * to re-request with the gsc_message_handle that was returned by the firmware.
> +		 * until the pending bit is turned off.
> +		 */
> +		*gsc_msg_handle_retry = header->gsc_message_handle;
>   		ret = -EAGAIN;
>   		goto unlock;
>   	}
> @@ -135,7 +146,46 @@ static int gsccs_send_message(struct intel_pxp *pxp,
>   int intel_pxp_gsccs_create_session(struct intel_pxp *pxp,
>   				   int arb_session_id)
>   {
> -	return -ENODEV;
> +	struct gsccs_session_resources *exec = &pxp_to_gsccs_priv(pxp)->arb_exec_res;
> +	struct pxp43_create_arb_in msg_in = {0};
> +	struct pxp43_create_arb_out msg_out = {0};
> +	u64 gsc_session_retry = 0;
> +	int insize, outsize, ret, tries = 0;
> +	void *inptr, *outptr;
> +
> +	/* get a unique host-session-handle (used later in HW cmds) at time of session creation */
> +	get_random_bytes(&exec->host_session_handle, sizeof(exec->host_session_handle));
> +
> +	msg_in.header.api_version = PXP_APIVER(4, 3);
> +	msg_in.header.command_id = PXP43_CMDID_INIT_SESSION;
> +	msg_in.header.stream_id = (FIELD_PREP(PXP43_INIT_SESSION_APPID, arb_session_id) |
> +				   FIELD_PREP(PXP43_INIT_SESSION_VALID, 1) |
> +				   FIELD_PREP(PXP43_INIT_SESSION_APPTYPE, 0));
> +	msg_in.header.buffer_len = sizeof(msg_in) - sizeof(msg_in.header);
> +	msg_in.protection_mode = PXP43_INIT_SESSION_PROTECTION_ARB;
> +
> +	inptr = &msg_in;
> +	outptr = &msg_out;
> +	insize = sizeof(msg_in);
> +	outsize = sizeof(msg_out);

Are those local vars required? Can't you just pass the values directly? 
it doesn't look like you're saving many characters.

> +
> +	/*
> +	 * Keep sending request if GSC firmware was busy.
> +	 * Based on test data, we expects a worst case delay of 250 milisecs.
> +	 */
> +	do {
> +		ret = gsccs_send_message(pxp,
> +					 inptr, insize,
> +					 outptr, outsize, NULL,
> +					 &gsc_session_retry);
> +		/* Only try again if gsc says so */
> +		if (ret != -EAGAIN)
> +			break;
> +
> +		msleep(20);

I seem to remember that the recommended sleep time was 50ms, but can't 
find that in the specs now.

> +	} while (++tries < 12);

Found a note in the specs that says we should give up retrying after 2 
secs, so should probably adjust the retry count accordingly.

Daniele

> +
> +	return ret;
>   }
>   
>   static void

