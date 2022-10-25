Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F54960CECB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 16:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC89010E091;
	Tue, 25 Oct 2022 14:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB5210E091;
 Tue, 25 Oct 2022 14:20:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhtDk0rEfh2jTZtoGIcZLufEFXHX+qZnpIoKuHIpOXyDyT5z6iEN7OXDdk+UTd9AWQ/5eWqOl0nQVGk1BcPBWNs+FbHj4LY+PPQ3YQQ+nkSM+x/Yn+UEDwXvasnuVTAjPqw6ydPoo9Bms3/a3WPUdNt2J889qOOdbXFUvThm8tHZyFv5AHRJH8HbPHvPaCROKIcXfiXH09bkrK4eo25HXH1+Xr+KqU/huVR6ENLIl73jC2yxZiSMlV4sn3WkI8+IyaHtI0eHkWDCz3JNzJE7v5q8DPKq8S2OFRm5KiD/smrMySc+O89OhcmTxeq9wnIVNCh3RE+L+7uqusm6Hrdb/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ey1DDqcaBHDvDu28BkT4sxCxiEg7SdmeHI5KhMIfJjU=;
 b=UR1ByySsg33v4iC8Om5TPwxsanvl8nG5sKfvIp9HoRCvHtbNs1Xa0tp9oWfQgj/XlWQJrfLd7QHWqQur3o1M3fAmrYPaJXaWtfehd5xwp+O7fTFOrbfyIm9XJiAghtwEnm48b5rG9IQxUF5R47yi3p1whl4QLOb/uRUP0YGUvR9495MsCwW3JUUp+yU/+2YrCAekA/2drJHCJ5LOg6ydnkW5nQ98JHYvPY6y1NE99zsy2VUWKmFENsWUqZgLv+UKU6MeWJEvvfjmamo49CyOr2+PpqRBVeZX+VLXMPMR//5tzcpUF3QdTcQ1Fp7180kaL/4gDd/5giNbCtuQpXqIfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ey1DDqcaBHDvDu28BkT4sxCxiEg7SdmeHI5KhMIfJjU=;
 b=pJizr/34+Bs840Xj6FmoxpX5nKMtb7vUnHqp3xny1uhMjeLvyF6ongB2lj2fSXMbRMPAzmgeTx26wkq8hDkMgNAwBRdEMFieHEM/LK8XNct1ISJCcPFDUpJIFVbZXh3X3dRnesXhXu+swas+Gj7sSzSRtAXNJ56Zr48OjGadwuI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH2PR12MB4955.namprd12.prod.outlook.com (2603:10b6:610:68::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Tue, 25 Oct
 2022 14:20:46 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aef3:6aae:b904:e395]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aef3:6aae:b904:e395%7]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 14:20:46 +0000
Message-ID: <c6adc72b-690f-6752-784f-6ab0695705bd@amd.com>
Date: Tue, 25 Oct 2022 10:20:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 3/3] Revert "drm/amd/display: Limit max DSC target bpp for
 specific monitors"
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, linux-kernel@vger.kernel.org
References: <20221024192224.180507-1-hamza.mahfooz@amd.com>
 <20221024192224.180507-3-hamza.mahfooz@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20221024192224.180507-3-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0254.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::21) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH2PR12MB4955:EE_
X-MS-Office365-Filtering-Correlation-Id: f5a425c7-9e69-4c31-820f-08dab6941b7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DirKiSN0DSFOklWr+SEuO6Ngt8l/Udzt/cUfXeIvbYVwT+MS3Scem4FPoWKu6vCVZwoqIOuYLBOd1LJ1KezB+XWas3LMfBROgUKJfWHFuktLjf1JDhpXR5O/QJBbVe4eb3D17QIEUowdAz9F9LFWAcujudDtctkBFUXp/fk6zqUbBvkU84RVNpHnb72CRoRBRT8PTaGBa2UPlyl8NtUnFVWpnGwpcUHW1OeRimyawGOXF+kxDZP+yJuzf3zT1TJzz9FaxGqgTiz68RXYi7PTEg2DgL9XtmKMl8EDpLe+wY4PhCVr6pEQGqSsCYJ1pOcTIYmAH+96l1jr67c4V01tBGPsllnQnniKSt+3R8Ib1J9GVYVuvHNO99oVZrf0T75h1zUcMgE2Rr9/6Cu8PyDOqXI7jDwg8JOZgrXIkIy0FvL9MaXJ9yS24HFUm3GwVctP57R8956p+jpXhO3vIfU8v81LtCqmZky5EvJXRQnxsnPsUanGTcm4KjrgDZx2Hfq6zzRuf/JojiibpDDBc5xkjaFYUFRMb09JuI+MX9zEDWEtDF3huawb2F1wIUwOgG0vgUKo/c3IH+asJ0mP+SzRkVY7skkKEeD9Tut7/5Tl6TZd7EuHqYZmBiiZyPmlpt7ypEPNnuIH4vkJX7N86befoDXBAqAcjTbbjvu0T1b0OqAZgTpbEc4XEg2bgCMgsBNkikXKWjBxGiwgZ3qWxuEVo0YJu44Szs7Jb+34PaWLBEe4ZiNs0fSNca7eiQh7GBiMuEP+ncY9slhhVQBLOBFTQv1ohHIGeIBjYh5ZMzbrBCA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199015)(53546011)(54906003)(6486002)(8676002)(66556008)(4326008)(6506007)(66476007)(7416002)(186003)(66946007)(5660300002)(6666004)(41300700001)(86362001)(31696002)(8936002)(2906002)(4001150100001)(26005)(2616005)(36756003)(83380400001)(44832011)(316002)(6512007)(31686004)(478600001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXlDYWVCMDIvRUpDWm1rcmxVRGZXN1UrNkRBbWFmdkVuYkZOTFdjNjM5bnlt?=
 =?utf-8?B?TUF3SGVRaWowZXFWdzQ2UGh6ZnZiTEM5WTEvTWVKZlZVNXA3aklZRFc1TTFQ?=
 =?utf-8?B?aS8xQUdnd3ZZL3ZyU1lhUXhsYWFSY0hQelNwOHhwZG93QWV5OFc3L01tZ2hj?=
 =?utf-8?B?WlpXNC9TN2tEVlRTNDN1aStLaDExcysyOWJZdHZSNEJHSHN4a0FOSWkrUTBz?=
 =?utf-8?B?TzhHR2NKLzVQNXdhc2RtaFR1dzNTcm5nTlpXY1Y4anl2S2ZDb3hNc3ljbTZo?=
 =?utf-8?B?dlQ3U3dvWEg5QktvalBnajU1K0tsWnl5ZW9ZdU5ka1gyUldBN1czQkZUOHAv?=
 =?utf-8?B?c2kzOCs2amxqMy83WkttT3VUWUFjZXlnbzJ2b3A1R0lmL2dDL28zY3RXMW05?=
 =?utf-8?B?Yk5iYWQvME41TS8vUXZ0S0tQOG05SXVWc2kxN0F1THJta0RVNE9oRDF5bEt5?=
 =?utf-8?B?T0t2K2NFN2NTYWQrMzRSeXdCNnBQVVlwZm91b3M1WE5lMS8reSs3bHBRRFhD?=
 =?utf-8?B?ajVoZkxsVFlBTWVXb2ZTRjdXemhyak1lcGE2djRHUzd1VUVvc2lXTHRFc1ZV?=
 =?utf-8?B?ZzB5SWI5ME5STk1SdlgwYWxvSXpWaEJJQzRWeGh0b1FWTTR1ZEMzQWVDdmdx?=
 =?utf-8?B?QjJVV21IVCtQZzRQWDRoUVNHa0RzMWlIQThKSzNMbE1FaTFlVFgxanI5TThw?=
 =?utf-8?B?OERDWE84WVRmT2Zoc2U0YXM3Qm9lREs3WVcvOW5CSEZTNlVtWEQrelVHaEJv?=
 =?utf-8?B?c0w2bGFyYkZiL0ZuOXUwM2RvejdVSEdxQkxSTVAySkY2YW1TSk5DWWxrS012?=
 =?utf-8?B?cm1OUGpQZk54WTNqYmIyaVZpWDdYSUFwQVNlMHZwZU1YdjBZNUJmKzIrS3pG?=
 =?utf-8?B?bk9NakJDK3g0TTdKa2ZpR3lhLytwbUkxNURCN0U1VlZVblFPYk5veFVaZXdV?=
 =?utf-8?B?T0ZKSkpxaTNRakkyMDJBQmVpOG9VSHBEYWxhWHpCNjEyQlp5L3ZYcWxOSFQv?=
 =?utf-8?B?ZzNoSVZOang1RkdmQzJmSnEvb0ZXQXhKLytHL3BqSkwybXlXalRJNERBZHFH?=
 =?utf-8?B?OWxqZWIrSDZyNFRlcXlTSWZvVUZZL29LQjZYTy9SeVkxU3Z0MHNZdUFHYmYw?=
 =?utf-8?B?eDBRSjgwSVVRNXVLR2ZzMGJJRGdLVEdGZGZaRVVFMGluajhSdElhRlRtTjQ1?=
 =?utf-8?B?YVdLZ3diREl0RTZ3WFhYalFSQ1hpK0hydUhwNk8rQUpLMlNUZUVEcEE0OURD?=
 =?utf-8?B?WU1URVJ1VnJuaStqbEhpbStQbUU5SFJqNXQvTm04UlF5SkVrSHI3Mmx3aVoy?=
 =?utf-8?B?M3hzZ1N4VnpXbGlvSVV1T1NRem8zNFRuMUFEaTRlL0dKV201NWtFVWJPZkI2?=
 =?utf-8?B?Q2VQQXlEcUZUODM1OEVveW5rbkRTdjFXZ1M1dGpwU2VNMUxVdWtVVGJXMi80?=
 =?utf-8?B?azNOcExCQWowYmtTb0VGbkZxQ0ppS0hYaGU3RFAwdjJMRXdyZVZscm1oSlhp?=
 =?utf-8?B?K2ljcDRoRXd1bnJpVklaUnN2VEJBODh2aHF1LzY5eFdjSkQvSDVzTzJqck5N?=
 =?utf-8?B?TzJxY3VNTlU2Q2pNZGZMa2s4M1BUNzRQbUNYZUJva2pweWR5ak9FOERsMFFF?=
 =?utf-8?B?S0kwbUx5Z1Y3dXcyaVNUeHdYeHpFeGNPYSs0a3U2RTV0azNhUzJoSW8vUzA1?=
 =?utf-8?B?VTNxeUQwOTQyNG84aHpKZXFBK2E0QTNPcVF3QjE1bkRJVnJBRzBxOEdDaEN3?=
 =?utf-8?B?ZmhKelBwTUtBdXBUcVdmRkJtendzQy9aNkFma0VCaUo0TFpCZncwQnZJdSto?=
 =?utf-8?B?eGRqRy95RnpUUlRTanJIcjJ4eVhzY3pSRUxjSFdjVUo2UnFVMk5BOFgyeExG?=
 =?utf-8?B?b2VpZkk2S2pSN1NyL2cxSnpELzZON0ZGUlNERHhhamkxM3RabG1OSS9jUDZH?=
 =?utf-8?B?UHFmZzlpaXlIMk9GaWlBb3FKOUNmbFRCbDdLOExGU1BWOVFMa211ZGN1dXpp?=
 =?utf-8?B?dU9NajN2RHpmU3hRSnFPNi9lRk56aHozOVpXaU9hWnFvTmk1eEdnU1o5Zmx4?=
 =?utf-8?B?RmNUWk0vOWVObTlXejZGWUVhcG1oWDU0dTZxWlMwVGZoVFQ4N25haWZzYTBz?=
 =?utf-8?Q?QyDlvxh1hPAlbMdxBym13v5PN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a425c7-9e69-4c31-820f-08dab6941b7d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 14:20:46.2252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GeOQm1m73tUaK2XIdl6r6MEVsCIqGmzS42aTxSRrRUKMNzfatOkriX8zGBaON+W/GRyneDse/52ci187QyuyCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4955
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
Cc: Ian Chen <ian.chen@amd.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Leo Li <sunpeng.li@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Roman Li <roman.li@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Claudio Suarez <cssk@net-c.es>, Thomas Zimmermann <tzimmermann@suse.de>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@intel.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Series is

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

On 2022-10-24 15:22, Hamza Mahfooz wrote:
> This reverts commit 55eea8ef98641f6e1e1c202bd3a49a57c1dd4059.
> 
> This quirk is now handled in the DRM core, so we can drop all of
> the internal code that was added to handle it.
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 35 -------------------
>  1 file changed, 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 4956a0118215..a21e2ba77ddb 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -41,39 +41,6 @@
>  #include "dm_helpers.h"
>  #include "ddc_service_types.h"
>  
> -struct monitor_patch_info {
> -	unsigned int manufacturer_id;
> -	unsigned int product_id;
> -	void (*patch_func)(struct dc_edid_caps *edid_caps, unsigned int param);
> -	unsigned int patch_param;
> -};
> -static void set_max_dsc_bpp_limit(struct dc_edid_caps *edid_caps, unsigned int param);
> -
> -static const struct monitor_patch_info monitor_patch_table[] = {
> -{0x6D1E, 0x5BBF, set_max_dsc_bpp_limit, 15},
> -{0x6D1E, 0x5B9A, set_max_dsc_bpp_limit, 15},
> -};
> -
> -static void set_max_dsc_bpp_limit(struct dc_edid_caps *edid_caps, unsigned int param)
> -{
> -	if (edid_caps)
> -		edid_caps->panel_patch.max_dsc_target_bpp_limit = param;
> -}
> -
> -static int amdgpu_dm_patch_edid_caps(struct dc_edid_caps *edid_caps)
> -{
> -	int i, ret = 0;
> -
> -	for (i = 0; i < ARRAY_SIZE(monitor_patch_table); i++)
> -		if ((edid_caps->manufacturer_id == monitor_patch_table[i].manufacturer_id)
> -			&&  (edid_caps->product_id == monitor_patch_table[i].product_id)) {
> -			monitor_patch_table[i].patch_func(edid_caps, monitor_patch_table[i].patch_param);
> -			ret++;
> -		}
> -
> -	return ret;
> -}
> -
>  /* dm_helpers_parse_edid_caps
>   *
>   * Parse edid caps
> @@ -148,8 +115,6 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>  	kfree(sads);
>  	kfree(sadb);
>  
> -	amdgpu_dm_patch_edid_caps(edid_caps);
> -
>  	return result;
>  }
>  

