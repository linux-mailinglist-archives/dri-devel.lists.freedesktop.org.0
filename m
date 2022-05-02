Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7A75176E0
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 20:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBA010E582;
	Mon,  2 May 2022 18:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BB410E42D;
 Mon,  2 May 2022 18:51:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/f7b3wGnvol49z7H3KHKEKFIfGDvcGw3GpO3zjXAL17wEmzsjXkU1DTCQLBVZUIJQI0s9sBFaNneBTEXNmFcqZDPnulUXt1t6s3SsvlxJUttx0LHLCjxbszmXKywR71msY6gqdDC0kaEcc44MCx70N8AotxON3UYetFnW0mgdrEjlJ1h6MqOO5qNEhrqZ91h/q7/pdKzwGOAphOtUbdhgzIyMdsz0PI/fnBQSjzXx5e6hEVGdK8HO7ntH83nLx67y53+BFtrCivpOWkFqHgOgkVrHX4+59E7emzvohRpLWmt//6d2WdiomEUqr7phRvkrsW50qtfyHvn2tUI902cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twTRu+MrmbLjAGjPQDt69ZeHpgmvreqnpqltq47CBN4=;
 b=ampyWm5jEK/50ZuW4c/JfAJpJRdCQHC2MLScbq1CNEz2oWUiIjgE15Bv5zSygzyvV2lg31o0V29OP/xhLB3JMEpSrHXadjzCplK0zUlRVB6tokrtzWdK0DW1I5xpZP0iwJh9dMyUcF6g3WzPTAlC+Il7KXQDkl7JtCTQzUhrbl5auT2kjsw7aAG9Pgq3BHjdUG8L7d/WRiTkAxiv2+Egj/DDO790eH4R6/GM1aqKqVHkiePxdccuHAW4JCnUb3q4vAhI6M0mUvp2dFug3Ci8gdijfUpzcgoZ2+hWNqkUCkf94HWUO0gTUBQBppMDRIM7NsEveHqcC4Jvl1MnUPWF2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twTRu+MrmbLjAGjPQDt69ZeHpgmvreqnpqltq47CBN4=;
 b=fELBsiBWQziM4i7RomSs00eHyVpHxZAjBQtx7boiLlVlRblVRo6+6GZ2g4WuYlWJQfJ6BuoGjjYwh31+BzGrF52LI48TA8cCB5uMz641qyP+ngXJSrQ8pO9ncxrf91puTUXsY0LZOksl2YDOl2uY+XDplYm1TyLlJixghcPV+YY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH0PR12MB5606.namprd12.prod.outlook.com (2603:10b6:510:141::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Mon, 2 May
 2022 18:51:37 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::540e:d76a:bdf0:ed0d]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::540e:d76a:bdf0:ed0d%6]) with mapi id 15.20.5206.013; Mon, 2 May 2022
 18:51:37 +0000
Message-ID: <164a32d4-28ee-d722-ba03-b0c3e5d455b7@amd.com>
Date: Mon, 2 May 2022 14:51:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [V2 3/3] drm/amd/display: Move connector debugfs to drm
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, swati2.sharma@intel.com
References: <20220411095129.1652096-1-bhanuprakash.modem@intel.com>
 <20220411095129.1652096-4-bhanuprakash.modem@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220411095129.1652096-4-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::30) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b87c220-906d-4011-ab48-08da2c6cc968
X-MS-TrafficTypeDiagnostic: PH0PR12MB5606:EE_
X-Microsoft-Antispam-PRVS: <PH0PR12MB5606C8C2543EB2737292A4078CC19@PH0PR12MB5606.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZQ9fQ8pu0PYUhOT0xEyTucEg9kiwce38gKgLzBSlW8fat9U6v40rcrtaKC5aCdtTecsRd/00FY9P6U+4/dOOPNTTm1qaEptYUJILC0BqnZvkqJHobSZ0Jp2VWJz3C78hfCez1olfVc7zsvVICwfSsfg4+arSeYoGSl0i60re77xavSn4PeiN17CUAwmwoSn9NfPNOToDXLAOlTXjjxHchv0jJ1rahOOTK1wa/l6XLjyOhyn5uW4mEsSTzbY8g7yXF7LyKipJZGRRcG+8oiuIFCv0250CZ0UpSkjzn/Lxur2km1SyIWBdnZNGoPI0vIWucSDEzPqGO8ufFKfiIhNXFX7CfmZnx63+QukMPXD2xPLdEHMvIMxq6BMqWLh5KvkFyiS6V2/FoRGDwLC6IQx39jbmiNzf3fjKhsMsiuv5nd3LxNa2xknJU4mfiNQ9tBTrOqsxlmpctl3Ko0SeHCv3ghOX3gjN7rjMg66UXMT+o6DwDXTcJvIJ73h+E61dDvoexHUcAVGc/vAzyeiWHJfrR2egOFjw6nCoupfVkgS6WF9U4GsMlWiWzrdRZ1wDy/TZgQNXQsB8FYrjcTwiRMF89B06BzpVk5T5b1lNA/XWJ3nl0nlCVcjheFTHc0gMKVNl/Mr9duhjhqJ6dh0N0ay/FWaogq7nv8Z/kCjuH839Zh88vJFjxb8w9rni9UAcRCOC2uxnYHSCE/BkN8/obm4ch5QINqeoMPootuDlS8nTGrOuNby4NsOp2mKn6m3srQgY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(316002)(36756003)(54906003)(31686004)(83380400001)(5660300002)(38100700002)(26005)(44832011)(6512007)(6506007)(53546011)(6666004)(6486002)(508600001)(66476007)(66556008)(8676002)(4326008)(66946007)(86362001)(31696002)(8936002)(2616005)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDFwbWUweGZiaXhwNVFxNkRRTHZuZnJ2c25ZcUovT0FxRnFRWWFXTEZ1d0NG?=
 =?utf-8?B?YjhCWWVQSXdVbEZlK0UwYW9iRXNxRzJLdk9WREUvK0dxVHJIY0RCUkhmeHJh?=
 =?utf-8?B?Wi9RKzQ0SUNzazRySlV0TS83cDFPQU42SUZvTG91Ump2LzhEVjRDVzZKMFVX?=
 =?utf-8?B?cjZlallKYXoyVmYzMUZoRk16Q3MxdVByeXVqa0h1VXlkaFRLODJxUkdMbzd6?=
 =?utf-8?B?eG84WVU0SFk5alFEMUVjRkFnc3hZZWxWUlJMMkRuNXAzYmcrZStqb1BuS1pU?=
 =?utf-8?B?L3BJRzdTKzgrWUUrUmdhSDg4Z0RTQlVxWmJQS3R1cjBQdWNZSEN2L1VQQTNC?=
 =?utf-8?B?bGg2NW9jaHJNS2I1SVdaeWZ4bDYzeGUvNGJzakRMWTd3VVByeHpUVm1FdzhX?=
 =?utf-8?B?RHIrS1ZiRVVLOFNOempDUE1pK1J5bi8wZ1UzWHpuUEZDbGFLeVFETTA2NkFW?=
 =?utf-8?B?N0J3aVlXNkZUb0M5SStEeTNQOFJFREJhWXR0VnlnbFduNlJGZXFCT1BMWXJp?=
 =?utf-8?B?dUlXR2dKaXBnVlV3UUJDdTJCaGZXV1RZdWh1UEdxWDhvODIrMWYwUC9rajd2?=
 =?utf-8?B?VG5Ebnd5cTlQaVVqY1lSakpWN3Bnbk9SSVNUdlVGUXd6eSttaUNBTDVEK0cv?=
 =?utf-8?B?YXJhRXArV3lORm5Yb3AzUTRxV2FxTnJZVy9pdGZRbmRLb2kxeXRaaFVIR3JR?=
 =?utf-8?B?c3E0eDdOMDdFaUk5ek5BQ09EY2FhOHdXaFl5dWk4Y2oyMEZSVXRvemVJRmJj?=
 =?utf-8?B?RWhUWVpVNFRvUkVUSmFjMGxzT24rNUlYVzNvZTA2VzZDM2hQaUcvVkdHVVE4?=
 =?utf-8?B?TGFOLzF1N0wzMUhlbVRQUi9lcjdGRWFxWmJjdFJtTFFIYmZncUxsSWlLTjc4?=
 =?utf-8?B?ejZiakNPNDlrTVYrQ2xTclBiR01DQ0hjMHZTOHdFVmNBRWFPNytOengyTGZJ?=
 =?utf-8?B?eWxqQlJCNmNkZ0g3bkw5dU5jMjVZZFM5dWIxN1NwTFg0cWFMcDYwazVZWkcz?=
 =?utf-8?B?OTlySEl5RUh0M0lkdnBCdG5OMGgwaEFZbnFEcXQ0WXgwMWwwcVR3dkFGUWhZ?=
 =?utf-8?B?Qis1RWhpd1YybytoS3FmMS9tNTd6SkNKZ2sySjNTalVEZlQ3MTBxYmx5cVJa?=
 =?utf-8?B?c2NsdkUraGprU0dJbjZ4Rk0wd1ZORkpLMnRqVUphSzJTOUQ2NHVsTzJSV2ps?=
 =?utf-8?B?UmdwMUUrWE1aL0xpY3p0OVRZVEdRM21rR0dUTjNEQm82Qm0wWWhFZTdaQzJF?=
 =?utf-8?B?L3QwTjJ5V2NiMVNRM0l2YnpNeUlwVVpQaEZSY2FvNDR2WWROdU14UU1CUHBM?=
 =?utf-8?B?MSt6QzVNeDF3SU4zQmc4WXAzNEdZRm1xWEIwd0tQc0ZpMk42bHdVMGllZ2xw?=
 =?utf-8?B?R3pmRVdTWVZRekJRRGdHMWtNSWVoT01BYjFJWXVwajJQL3hlRm1OMUdlZjE5?=
 =?utf-8?B?emNoZTIweUpNYTNDNTFwWndUeW44ZklQdi9vVDRPcmMrMTgwOXR1dVdBRy8w?=
 =?utf-8?B?RHc5L2xNeXJXSTZWQnN3eUp0YXFidnBnbTYxbnhwL291Z0RESTJkdTVCNlNi?=
 =?utf-8?B?V29Kbml2dG5CRU1hUjBDbUNDMlpoTzRZak1IV3hJeENxY0ticU9EcEtndFEw?=
 =?utf-8?B?S0hMMG82SnUvRlpFVmExVjEvUXpJSU5LVVl1aGM3UEwwOU1IZ1R4NnBVQUdT?=
 =?utf-8?B?Q1lOWlVYRnNyeFZyWE5tVjdGdW8ySXFQZUNjZktlcXQyS1o1ZFBsb05BTmVD?=
 =?utf-8?B?bjBqbzlZL3lsNDRFelNHc2dzOFRtTi85UlZtdFlNbnFqaGlUdWtoaUFGR2Er?=
 =?utf-8?B?bm8xdlArNnhtdjNFZ1BPWjBrNlBZZDcySlNFOEZ4Z3l0N2x4Wi95ZGlFbDJM?=
 =?utf-8?B?aVVwSjRxdXd5Z3RZU1o4SUYzZ1Yxa3BuTEhpaDVGYmhqeFJkcTBkdm1udVZO?=
 =?utf-8?B?SFhVWFJuZUxFUTJFNTFjUlZIMmowUUl5TWxJNDdZV3ppaytwbUFrMDZsbjZk?=
 =?utf-8?B?REJLWlBrR1M5V0hoN2FSOTY5NngrT0hjanBzM1Z5QnJBNVFFMmwvTWRGVXQ2?=
 =?utf-8?B?LzRUQ3d0QzhubDF2T0ZHMXNXaWJVUkNHc2djU1lQN2VseCtSU0xBK21Tcis1?=
 =?utf-8?B?NXlsTmFnb2c2Nk5wOUpNaHlRNENnRkVpRENlRHQ1UENQSFJBbGlZb3ZUcTF0?=
 =?utf-8?B?VVZRb3doNXFsZ1FKSHdoV3EyY0t5VTVlWkYzRFUrNm9SN1BZeElJZFNGZDdK?=
 =?utf-8?B?QmdYb1lCSHRydm0zamticXdKRGlaYzg5RU9JK2ZLWUw4Wnp6aGdSL3BCVEVQ?=
 =?utf-8?B?enNPL3htWnQ3bkk5a1ZJcHp5cEhLUUZQMnFRaXdoa3l4cDZab0hxUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b87c220-906d-4011-ab48-08da2c6cc968
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 18:51:37.5859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bonTFATxQk2uX2uzeHBGmcirMAt+gw4DtUjm7vH57aj4tjvYgC9lxnxa8nVHv6fxYQ2vLgJrc50kwdDj7ffeMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5606
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
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-04-11 05:51, Bhanuprakash Modem wrote:
> As drm_connector already have the display_info, instead of creating
> "output_bpc" debugfs in vendor specific driver, move the logic to
> the drm layer.
> 
> This patch will also move "Current" bpc to the crtc debugfs from
> connector debugfs, since we are getting this info from crtc_state.
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Reported-by: kernel test robot <lkp@intel.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 --
>  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 38 +++++++------------
>  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.h |  2 -
>  3 files changed, 13 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 73423b805b54..f89651c71ec7 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6615,14 +6615,12 @@ dm_crtc_duplicate_state(struct drm_crtc *crtc)
>  	return &state->base;
>  }
>  
> -#ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
>  static int amdgpu_dm_crtc_late_register(struct drm_crtc *crtc)
>  {
>  	crtc_debugfs_init(crtc);
>  
>  	return 0;
>  }
> -#endif
>  
>  static inline int dm_set_vupdate_irq(struct drm_crtc *crtc, bool enable)
>  {
> @@ -6720,9 +6718,7 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
>  	.enable_vblank = dm_enable_vblank,
>  	.disable_vblank = dm_disable_vblank,
>  	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
> -#if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
>  	.late_register = amdgpu_dm_crtc_late_register,
> -#endif
>  };
>  
>  static enum drm_connector_status
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index da17ece1a2c5..3ee26083920b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -873,28 +873,18 @@ static int psr_capability_show(struct seq_file *m, void *data)
>  }
>  
>  /*
> - * Returns the current and maximum output bpc for the connector.
> - * Example usage: cat /sys/kernel/debug/dri/0/DP-1/output_bpc
> + * Returns the current bpc for the crtc.
> + * Example usage: cat /sys/kernel/debug/dri/0/crtc-0/amdgpu_current_bpc
>   */
> -static int output_bpc_show(struct seq_file *m, void *data)
> +static int amdgpu_current_bpc_show(struct seq_file *m, void *data)
>  {
> -	struct drm_connector *connector = m->private;
> -	struct drm_device *dev = connector->dev;
> -	struct drm_crtc *crtc = NULL;
> +	struct drm_crtc *crtc = m->private;
> +	struct drm_device *dev = crtc->dev;
>  	struct dm_crtc_state *dm_crtc_state = NULL;
>  	int res = -ENODEV;
>  	unsigned int bpc;
>  
>  	mutex_lock(&dev->mode_config.mutex);
> -	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
> -
> -	if (connector->state == NULL)
> -		goto unlock;
> -
> -	crtc = connector->state->crtc;
> -	if (crtc == NULL)
> -		goto unlock;
> -
>  	drm_modeset_lock(&crtc->mutex, NULL);
>  	if (crtc->state == NULL)
>  		goto unlock;
> @@ -924,18 +914,15 @@ static int output_bpc_show(struct seq_file *m, void *data)
>  	}
>  
>  	seq_printf(m, "Current: %u\n", bpc);
> -	seq_printf(m, "Maximum: %u\n", connector->display_info.bpc);
>  	res = 0;
>  
>  unlock:
> -	if (crtc)
> -		drm_modeset_unlock(&crtc->mutex);
> -
> -	drm_modeset_unlock(&dev->mode_config.connection_mutex);
> +	drm_modeset_unlock(&crtc->mutex);
>  	mutex_unlock(&dev->mode_config.mutex);
>  
>  	return res;
>  }
> +DEFINE_SHOW_ATTRIBUTE(amdgpu_current_bpc);
>  
>  /*
>   * Example usage:
> @@ -2541,7 +2528,6 @@ static int target_backlight_show(struct seq_file *m, void *unused)
>  DEFINE_SHOW_ATTRIBUTE(dp_dsc_fec_support);
>  DEFINE_SHOW_ATTRIBUTE(dmub_fw_state);
>  DEFINE_SHOW_ATTRIBUTE(dmub_tracebuffer);
> -DEFINE_SHOW_ATTRIBUTE(output_bpc);
>  DEFINE_SHOW_ATTRIBUTE(dp_lttpr_status);
>  #ifdef CONFIG_DRM_AMD_DC_HDCP
>  DEFINE_SHOW_ATTRIBUTE(hdcp_sink_capability);
> @@ -2788,7 +2774,6 @@ static const struct {
>  	const struct file_operations *fops;
>  } connector_debugfs_entries[] = {
>  		{"force_yuv420_output", &force_yuv420_output_fops},
> -		{"output_bpc", &output_bpc_fops},
>  		{"trigger_hotplug", &trigger_hotplug_debugfs_fops},
>  		{"internal_display", &internal_display_fops}
>  };
> @@ -3172,9 +3157,10 @@ static int crc_win_update_get(void *data, u64 *val)
>  
>  DEFINE_DEBUGFS_ATTRIBUTE(crc_win_update_fops, crc_win_update_get,
>  			 crc_win_update_set, "%llu\n");
> -
> +#endif
>  void crtc_debugfs_init(struct drm_crtc *crtc)
>  {
> +#ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
>  	struct dentry *dir = debugfs_lookup("crc", crtc->debugfs_entry);
>  
>  	if (!dir)
> @@ -3190,9 +3176,11 @@ void crtc_debugfs_init(struct drm_crtc *crtc)
>  				   &crc_win_y_end_fops);
>  	debugfs_create_file_unsafe("crc_win_update", 0644, dir, crtc,
>  				   &crc_win_update_fops);
> -
> -}
>  #endif
> +	debugfs_create_file("amdgpu_current_bpc", 0644, crtc->debugfs_entry,
> +			    crtc, &amdgpu_current_bpc_fops);
> +}
> +
>  /*
>   * Writes DTN log state to the user supplied buffer.
>   * Example usage: cat /sys/kernel/debug/dri/0/amdgpu_dm_dtn_log
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h
> index 3366cb644053..071200473c27 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h
> @@ -31,8 +31,6 @@
>  
>  void connector_debugfs_init(struct amdgpu_dm_connector *connector);
>  void dtn_debugfs_init(struct amdgpu_device *adev);
> -#if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
>  void crtc_debugfs_init(struct drm_crtc *crtc);
> -#endif
>  
>  #endif
