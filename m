Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1C74F98F1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 17:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8543410E3B3;
	Fri,  8 Apr 2022 15:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2053.outbound.protection.outlook.com [40.107.102.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF1410E68A;
 Fri,  8 Apr 2022 15:03:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAlQh7Nj/PAxZ8AXuUqYG5B6P/cwSigsjZ0pBOlaknscnfVO0efekKpveHHSSLOlma1dr/ETPCyugzXIx5PUbnyNUyQ2fYPYRTC3c3wmhhfaDF2T0zWkPtD5ZwrNn5f0Iz82jU7Z3t0C/aA7i2rnOxZJGl7VvQ43uFJMRfY5gvVYGvxshPtACrM+oEXmuBV/JejxLeimd1ESbttBu+n01bpS2iE9z3AthyFp4pss/W/I22LZpS50T/OR3pW1cl427up+Ty4pzJSt+tqYDGcVnI7ZiFwnLOgjyr4FkJq6V1cWyUOFlsDwWt1JtHqUhJAtV9VBRz1X8Yxchp1CvaAlyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fn3QdcMS8/scKMp4lLSIalSstB/7nr4ZfQLWNMV6xd4=;
 b=MGguyHCWxm/pZY+yw1SKFy6Ou+lOz5RA1fQLb3MtOOE4nnCxXWVK3iavtExtP76sObA7E0smAK/MyC/QXgCpoIK/dYz34QD/UFKOgufaffPDVdxaKxDCAJGk1rMj5GY6naOLkKDVgSE2iB3Pgkd+t5JMvVFXJaqTDG0reJA6JxfmuwkjAcaGlojfztVO6zS2DJaiEHLCREKCkoU5yf1KLpenQ+CCpdeWtA9Sk/Zs74VAgP3yIDIK/NhFSzl4fsX48NR4DwFfqpjyJwVGOqQer+2YuXRuNFT5mZ57B8/XViT2ixiso03w8UZtEAEer31Q526+58uhPOGSeHiUu2ZFpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fn3QdcMS8/scKMp4lLSIalSstB/7nr4ZfQLWNMV6xd4=;
 b=cPeUsQM4xP8NMNhlWkaaWSHXxG3gQODlzSvaqx1fYknG6v8Fc21S+YPLv9iLRVpQnSI4bztn0upfxwSOQe5yzrmS+kV8ehI9AKiH+SCLo72ftnxR8fZzSM3zGosxQzycQMNuSoWwukQ6wO9ZzdFw/S5zh+ZxQbj6Xfj1H05bx5Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BYAPR12MB2744.namprd12.prod.outlook.com (2603:10b6:a03:69::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 15:03:36 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::61e4:a6bf:9444:31f9]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::61e4:a6bf:9444:31f9%6]) with mapi id 15.20.5144.026; Fri, 8 Apr 2022
 15:03:36 +0000
Message-ID: <16c42991-7b44-3eab-261a-3c60f4d1fee3@amd.com>
Date: Fri, 8 Apr 2022 11:03:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 3/3] drm/amd/display: Move connector debugfs to drm
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, swati2.sharma@intel.com
References: <20220408065350.1485328-1-bhanuprakash.modem@intel.com>
 <20220408065350.1485328-4-bhanuprakash.modem@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220408065350.1485328-4-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::7) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55608c3a-c02d-458e-6307-08da1970f511
X-MS-TrafficTypeDiagnostic: BYAPR12MB2744:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB27449124D98EBFC9164A78FD8CE99@BYAPR12MB2744.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XkkBvKxpabwMXCWjKnf2xc8HCVX7dfrTuTgeD6cMPmlN5z89ly8S6QN2VdIt4A+QcGsi1Rn8cD8PiBYj9gtmvm6KJO0BST7luX5q+/3lHDeVxspOThRR7jsaj6+/Q+R37bBnoR+2FjJYJa5mMAkn6nJOE3iydStiW6DC/2trQH8fzD1JwzcfA1iMSyT+mIBzdQJpoQg1Q8OdHI9mfauaOILXYgfIXYMC0c2nTIe32cNYQ//K/L+eU3lZGRubmAelV/jBYWR+nibRlcqOdUgNiaE+TQeRlwOx9zEoj2N69NZMscY3F+wICmQqyT428R5s1ss2xO6HLzZtApGtS+N7U+UX71JLLiJHn39pzVl5nVb5Q3g3xEkxrptfSe3ghqQrIe6qW1AgQ3LI0Mh57cZdhFvKVez7B+29j6cR6IQytYuRXIuZ2A7LrK3tPPmkfX4Yj+lQ7c7KgqzNOzNtPJLlQRJZOeR2ay8APdsvuERrM78Z/mSmLzZO5Rg2i8CZL0UxziPD7/lE2ilqs+ujSjpPuLHlZj1T8pm6qEfZOQ+BmePUyAt2pcprVicaitj6IGr1hmQT62JVZT3PmKvHoO32w/FohgN0Ofj6KMUC7y3OgMcDtX+m1LvPFswjamBLkb2WbfH7PgSlsrjubAYKvp1YfadFp6KlxLrJvKHz+nYyb6ylT7Fe4oph1OVPZ8bG3AbPd0ZVf178J/plRGuPiiB0XKrTQA9LOnNvaVfSgwt7ffflyqXMdq98xO3qaVzV1bED
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(2906002)(6486002)(6506007)(31696002)(8676002)(4326008)(6512007)(66476007)(5660300002)(44832011)(186003)(26005)(8936002)(6666004)(53546011)(36756003)(86362001)(2616005)(66556008)(83380400001)(66946007)(31686004)(316002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUU3K3g2YXBRdVhROVNDSVVxb1p1SE5XM2tLSDRzK0xxbmM0ZGowN3gvcUFI?=
 =?utf-8?B?NElHa212S0o5Tk4zRGkwK0NkSWsvYytLdGdqcEFiZDFKa0xNOFFzTTBLMTYv?=
 =?utf-8?B?RHJQUFd2YktXVk1JSkg0cEpzNnZNOVdoWi9YKzBLNHFzY3d0VUhCMG5MdVhL?=
 =?utf-8?B?eVhYMk9RckQ2THJ1SHRGQlhSdi9lRFcvdmJuR3U1b0lyZ0R4TGN6S1gwMHFh?=
 =?utf-8?B?S2sxeHZLM3pCNklibHRELzBIRXBHMzYvNHRISlB2eHN2M1ZGN3JvWWZBUnEz?=
 =?utf-8?B?aUNmU0ZtUlliRFBkZUdCN0pmdW96bVFoKzVYVGdmU1dnTWpKV1BkWUpvZk5Z?=
 =?utf-8?B?R2J2VzY3a3FKN1UyanptTFFGSE8vRXZCWHloWDJSRGtPdnBqYmVweUxUZmt0?=
 =?utf-8?B?ZTIrVHBZKzdQRlBnQXdtNiszdEVuRFN4QVRxWEh1U1BXTkc1MlNGSGpYdll4?=
 =?utf-8?B?dFRQRVArVzFZdnJ3bG5ldFNoUVZKUEVOVm1YVUhnTUh6dEtOM0RCQUZlcEFE?=
 =?utf-8?B?SVJmd1NGVCtQcjlwajhEa0FLM3NjZXNUVlY0djA3R1NIRWhiUTRhMzBWajV4?=
 =?utf-8?B?Nm1sS0tWZDZsVGR2WmRyMU5pSkhicHdQVHpRMmE4c3IrWkU0QjRvT3dkb1o1?=
 =?utf-8?B?NVpnSHhDaXI3bVFYdDdoTGlPVURCUFNtRXBJellZSVVWMmhBZHJhL2N0aVBK?=
 =?utf-8?B?dExIN3NQMWgvUGhYQXF4NmNKR3luU3p1RS9aZ0d2NWlrU09MQVI5MGNIUUZL?=
 =?utf-8?B?aDJHeHVWM3JmWlJOalFIdEdNclp6SlZ2Z05NTStXcFBDYmZKM1B2cndqeHJQ?=
 =?utf-8?B?MzhZSVJ1T3lySTFaQUFXcWdYNFUxVEQ2Y3dqUjRUY2RQR3hIZ3JHdDJzMjIx?=
 =?utf-8?B?VlRSR3l0UTVKZzIwVk5KMGhHU2V0NHhBZEFmREdzcW8wUisrMVpqdm9ocWxn?=
 =?utf-8?B?YnRwQldHVTVES0QrTWJVNFMxZFA4U1BuOURHVHZWY3cxVW0za0tqRm12cFdl?=
 =?utf-8?B?RVkxV3picFh3dUtYdEIrMERhejFIVjFGUENiMWpWSUpoMEVXa0lWT1FzRXUz?=
 =?utf-8?B?WjNUME8rWUlKV0FiOXFVSEhBOExZb24weFREUmxIUGIwZlZwV3NUZ0ZkWVhG?=
 =?utf-8?B?TGpVeWxkS2grdTltSVVjOG1TUzZmbXBWOEhOa2pIaGR2SU1DbWorZ2RDdUFU?=
 =?utf-8?B?WWFVNTBTR2ZpTUx1TEJkd0RPVWoxMnpvTUh0MEUrKzZ2S3U1aC9KLzRsNnFq?=
 =?utf-8?B?R1JIVFNLZE1WYzRYQXZsVUx0c3Z3SUgrUHoyVmFtd1dSaEZUeGV6NXUzUU1T?=
 =?utf-8?B?cWFJdFp3UHY3bWZxbDZzTmg3NGc0V2ZQcmRWa2JnYWFuc2Q3Y3VRQ0haSmZ6?=
 =?utf-8?B?QjNvYmQvUkVxUlpLOU1KbTJHMGFBUFZLYnVja3dKMmd6WUpTdGNkdlVNckdp?=
 =?utf-8?B?TG9NQjhHVTlSbVhnMEdxaG0xMWRybS9vYkVrdU5Kby9kcGh3eHNsUE5ON2lX?=
 =?utf-8?B?NklvRVpPZGFFYVhMbDJTbEhUb2g3aEIxTWZaWEk1SXdycjVSb0NBVVBoci9m?=
 =?utf-8?B?czNjWFdYL21WNGpKZTVGOUQ1dktLaTMvTkllNTdmZ21sUDdtbzVWRTVuemQ3?=
 =?utf-8?B?RlJTTFVDYTFjdEJFZzRNU29Lb3FRS21nb3YvRnhtTlh1dU5jckROaWNpaUhm?=
 =?utf-8?B?dXI5bDZGdXFEYlVIZ2dQUnFPa0FUQUdSMGVNU0p2RXBuUm9XQlFIV0dmYlAr?=
 =?utf-8?B?WmFSeUl5SkVFRFlpRlRzRVFJRXE1OTBkWkM2L1ZoQ2FDMjNzZjFDWmx0eHFt?=
 =?utf-8?B?enphYmRwTjdLbFFJNW4yS0VuOUc2YnJuYnlFYlo0eXpwTmdUQ1lUL095ZDZi?=
 =?utf-8?B?ZU04ZnVGWEVTV1dycXRSNUVTeFlib2NjOGhNN3RFQm5QTU8xR0pKRGZDWTFl?=
 =?utf-8?B?KzJJZUFNcVRTaGQ2K3djelIwUVJ5em1aMUVFKzMyY0xpelhWbkRBYlNGcStK?=
 =?utf-8?B?NUl2d0dXMmt3elA1S3FFMXl1ek9FZnRPVHRhWEdaSnFENGpYWXdNOHI4eXRm?=
 =?utf-8?B?czEzdWFVNTBWeUphRjJVVTNxa3ZqdVUybldZN1JrcWVWeEk4N0diZ3B1NHZl?=
 =?utf-8?B?M1BHWHdabWdXZTFvOWlSSmhQVkNFV25Ub0kzTnRrcS9FTVc0ZytNclZZVEVD?=
 =?utf-8?B?L0Rudm5USnIwbUUxL0ZwZzZIY2xtSXppTkZFYXc4MzFYYXlGNzk3Ukh1bkFI?=
 =?utf-8?B?QnRLNFdzWmVjV1FBa2JUQ2NQOC9GUzBwSGdTT1hudEVUT2V4dkwxelFZODZY?=
 =?utf-8?B?Sk5tV2FOYjByQTY2RzQ0ODM3TzUrK1V3dXY1RDN6UmJ2NER0ZnF5UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55608c3a-c02d-458e-6307-08da1970f511
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 15:03:36.6653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lLK0/QIIYUd0o383bQOZqdFlJs0l9k6eSWJSX8f0hBYiD65U5RQeT3lmGaijSXxBTEJ1R0lO8ZcXiLTazfFu9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2744
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
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-04-08 02:53, Bhanuprakash Modem wrote:
> As drm_connector already have the display_info, instead of creating
> "output_bpc" debugfs in vendor specific driver, move the logic to
> the drm layer.
> 
> This patch will also move "Current" bpc to the crtc debugfs from
> connector debugfs, since we are getting this info from crtc_state.
> 

Does the amd_max_bpc test pass after this change?

Harry

> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
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

