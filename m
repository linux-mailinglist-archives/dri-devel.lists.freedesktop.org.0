Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D381D8587EA
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 22:20:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AB310E3F3;
	Fri, 16 Feb 2024 21:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vkbyeD9W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59BD810E1BC;
 Fri, 16 Feb 2024 21:20:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOsyaM9F7ncv4//czucJdCWyQa+IjX8UhP3/kQ8IsGj1J9XtjTGFADtmv/XOXVDasi2E8IicTxO2CWhHK4ttsMVCDfx45/KuCHrexQDxz0BeW2NLerI8OHR0chM4QUCL3JQHcWwu90yLGGiWMWacELKDj6V9ZPp8Xk6aGD+axmuQF+PD3fPDdJfBPqM1ShpY/2k9QCK/mj1l/RNZRV80syZD6BlH6SJJlrCyiYOSdyXTNo0VJ36SqP8ZdcCRJZP+AK9j9IicMA218qCLaWxqRqvZOWJz5ttZOVaNXTEk3js9vXb9re8DVLeciqbSUPdbSiE1jDjlyyQAJ7fe1iPQMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qg9QDudX9SHC3jfWANdlwR6vDrBZJnmzz6+KY8AmYHk=;
 b=Xu10uYlSlbli9UV8ahdllYPSkVLg/t1rFIguB30nk61DHs4FW6uHV87M+MhZ8D4mP5oLQ7LMkxJKfUvzH/Vj5A2sqjpzRNg4XTWcHzF97JE+ZDnqXazebGstJSEvvxjExRFO2wZ51x+VzmGJps8+AIFr1rIHQpQKO2d1Husa4hT+L8j569wMvCFgKJ1u9s7yQhyrPKmWTAQoVr00tc6n3VkNAkZDSCbAd09f+ypX5z1r7nGwBcgRDpPF+91cxS5tGCXLUa0BsYpFsZMiJI08to/Rjj4GsxWy4TM5W6ochH7rGC2Q8uLu0BB8hFA50kKOINyYCB5uU2O4mdjSGIoAuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qg9QDudX9SHC3jfWANdlwR6vDrBZJnmzz6+KY8AmYHk=;
 b=vkbyeD9W2Yvd/NA74gnHV5oaL1gBAqLsyYgtGmfMlXGUoPCkVZkBU4Qvcrb1h9mm5sZe7rEs1cvAWTOWVZUP0fhO5Rs9qYbOYRgeLvLU/O4Ylt16Uqjkft9sHqeBYAtnEgFL+5pUHzIQJ9Hek3tVUlao9aweyau0YThn7UHTcmA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA1PR12MB7365.namprd12.prod.outlook.com (2603:10b6:806:2ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Fri, 16 Feb
 2024 21:20:09 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3f6b:792d:4233:f994]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3f6b:792d:4233:f994%6]) with mapi id 15.20.7316.012; Fri, 16 Feb 2024
 21:20:08 +0000
Message-ID: <0974e16a-9303-46a4-8a4d-374171e6be87@amd.com>
Date: Fri, 16 Feb 2024 16:20:05 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd: Drop abm_level property
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Hamza Mahfooz <Hamza.Mahfooz@amd.com>,
 Sun peng Li <Sunpeng.Li@amd.com>
References: <20240216153334.83372-1-mario.limonciello@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20240216153334.83372-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0052.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::7) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA1PR12MB7365:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a86119f-e895-462a-e96d-08dc2f350d86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 90wM6EW5DGAFPyMZM4j/fJrA/s5MOHNaYDdepVw/5zvDNlN1ccLWsD3mdknKvBx1lCdMdoFuLhhgHaxsHwh3ST+bGkoQ+X4pOoVM/qpoibDN7KRvaoNNOMW1kx+arx5wifINJRdn7EI8N+RhfP7XrnHYt5sLzQWG4gAChKL/c6cGUX2owe4t0EmBIjJDJhLpq73/pq2m90uCVOOKo0AZFf28KICSS4X9DkQvORqEX98A4jBeN3OEHmm8wbGOlRWmyusAuO2pgTQCWuH6AlF6seTd3OZycidWKo4gqEByVUt+LGfgdbo+rxmS/XeMmYjdbxAIj+rxTJgQm/2Tbkesa6MfegB+2AVZPg6F5k9M41HQxupdCzGYjipy+mKw85xwSMobNXn1yqn+9Y5oh+f6rf+S8W/3bFHJR5Lw+mg1V0JX6npYZNio6NCMmipG0FDRmnub93igMmcDwHi/6pOTXiHvAQ9MXN+2uUcqAju1yqBXJ5KYhW1ZE5JecIofYjYVAiRbCj20IMKWIRE47T0kO1rwtMBeMw8Z+Llyji/0McM4G+2plVpLm8KISiDUrXuR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(450100002)(8936002)(36756003)(8676002)(4326008)(66946007)(5660300002)(66476007)(316002)(54906003)(2906002)(6666004)(2616005)(38100700002)(26005)(6486002)(53546011)(83380400001)(478600001)(31696002)(6512007)(6506007)(44832011)(86362001)(66556008)(41300700001)(31686004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2QxbHlJTTJrQUpFZ2hXZXR2c2dYSlJVWERBSHVFTEFjaU1XWGllTkhFLy9q?=
 =?utf-8?B?K1VReVVPVVNkTnJhUkdEQjVLb0U4T3FrYVJFWkZ3dUlmUmYwYkZBL0k1Vkda?=
 =?utf-8?B?ZTVSSXZwVThHWCt4NUNUWk9VRWFseWExRndMK2ZzTEQ2YXJxRWxPcG5VNmx5?=
 =?utf-8?B?QytFc2tTNGp4VEZYZDBTeU1UcU0xRU1iVXZZU1JEbEVYME0yVDdlMWFvT1dH?=
 =?utf-8?B?UTl6dEIrZ0J0RXlnWHc0WUt0dVh3K205K05CY210SG5xRDluSnB0RloxTUI5?=
 =?utf-8?B?RDdOWXFoRGlSMUoxRnZRdnNTeGQ0MjB3M3I4SWdTMVdNcGlBcWE2SFlKU2pH?=
 =?utf-8?B?V2JyQUZncnRiZFQzYXF4YU9vemc3cTljOXowSTF6bmZlMFJPUFV6M1dKdXNT?=
 =?utf-8?B?ZzlSZDJEamkrT1FFM2xpM3VnRksyWWtQdGhGMk5uZlgzMlRqdHRhRkJ5bS9W?=
 =?utf-8?B?bThYbjRRR21mS2dtaVNjcExHajkzYkRoSzFNT2wwclVyendoYjV2aVpEbGth?=
 =?utf-8?B?RVFSVWpJQmliOTEzdXo3elN5YUNXV29wd2YxalFNTERFTFUwS2hZSDREM0I3?=
 =?utf-8?B?L0c1M1FndlhvTDFVT1gvMjA1UnlsNFlDQmFKcFFZYS93YWJKMmN0MnBBcERz?=
 =?utf-8?B?TTd6SXlJUW54K1JOMi85Q0tvN1IyQkdhaDFiamV0NGlwQmU1OXpiMWpHTTFo?=
 =?utf-8?B?Um5OVVpQM1FJZUUxclQxcnBzNk5VNUJVUDdvTU1Hc1RoMndmaXhQYytuYS9I?=
 =?utf-8?B?VXNhcm11cloybVBLM0xjWStNU0ZDRmlpaUlYMFA0b3VNd1BiRnpBQ1FrS1Ew?=
 =?utf-8?B?aTJzdXUvTkYxYXA5eFNmaWZvZzlDMld1Z0NXbjc2Ynk5Tmo4YStXYkVVeWFK?=
 =?utf-8?B?bEx1ci8rcldySE1POHhTQWRxUVVremJ0SjRaaUVWUzIxZnpmTTZUVXNET0lJ?=
 =?utf-8?B?UVp4Y3V1dUtMcWJ0cUhFWXNsSWxvcmMranh1WVMwV3JKWlNqc1FqdHF1VDVL?=
 =?utf-8?B?NExDY0NSMzBZNHpWQjJFR3k1MnlNakpONUI4WTR1VHR0Ulh0bUJaSEs4Rm1Z?=
 =?utf-8?B?ZHp6RmtMZnZ5Myt4Rm9HeHltL0tNeDBETXBoaU1oQ09QeHU3VGJGdXcyK2VR?=
 =?utf-8?B?aXB6ZnI1WmhqMDFaU3EvQnpWNEZaS0VqeThpTGcvaHBmaGJHU0NWQktNbkRR?=
 =?utf-8?B?Qitlay8weXU4TFNqemxkci9DbDB2a3dxWXRvRVdWVHA0Z0FMaTZGNWRLdUNl?=
 =?utf-8?B?WXo3ZWhJQS95bTZlK2gwVTRUOVE4YnFkUHAvMVpFVFo4WFVwblU1OTMyRFFU?=
 =?utf-8?B?QkFQeHlhdit0VFlvMXZGQlJUZDlFejNGUnRaZXp0cmxIa3NOUW1naWhrdFZP?=
 =?utf-8?B?S2plM1psNTA1SThwb3BjMW5uV3cyUkFQK2JFUXlJSERObHU1ejJJWHJDdDNs?=
 =?utf-8?B?WElzeUh1N1FKalg3UXNCQ1U4MWFxRGNjd0FTTEd5UHVkOHFPeStXaWhQVTZM?=
 =?utf-8?B?eWRRTFE3TWRaZlNYeVg1TEZ5eFNGOEErNW8yUWt6c3ZQa3R2cEM3eUZXVmJZ?=
 =?utf-8?B?b0FDZWZkRU93M3FCb2dHYXB3cnBHVlkyc0VSQUlrVnU0SkpvQytJZ29HTDNi?=
 =?utf-8?B?RGtibjRtVE9Yb2w2eitxejJPWWxlS1IyejBlZkwyK1NBcTBpVEtyWWh0bFNs?=
 =?utf-8?B?bk5GemZ2UlRLQmJTNUpGU042Tk81TE9jSWtqUjRYN3l6Q0dtSDBpZWlqNFZN?=
 =?utf-8?B?Z05jS0kyYm10M01GQ0NQSVRrWUtUYmxZTXFwZlNEdzM4L1EwV1dZLzlIam5L?=
 =?utf-8?B?QUZ6TmFLSmkxNC9zdnMyNWRxb3U3MWxQYmpKeFA2Mm54S1lCWS9NRWE5Nmc2?=
 =?utf-8?B?YkJLbjNFUkwzZm1jVzJGQmZ5a1VHMXhMMnlnWXV3ek0xelZNeENDU1M3KzA3?=
 =?utf-8?B?ZWl5cWExV1FZKzF6cjM5QXFWTjYwSkdXNnRMakYrNUxNbWxwQ0FaVjY0N2N2?=
 =?utf-8?B?RUtiMTVOaGV6Si9taCtBeGVtVUVuQXBaSE9rVkhJV2dTeHNJcmRJeVJjWDdD?=
 =?utf-8?B?akdlaDVtNkZCbStWeEhKMzVSbHFTZmdUaUE4c1UxcXkyQlRTSnlxRThQV09n?=
 =?utf-8?Q?bXr/E5f/ZfQRnGDYhty7kgGde?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a86119f-e895-462a-e96d-08dc2f350d86
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 21:20:08.8067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dd1qVM5u9AuVt/gD0KARKtD/90XTLmFjAOTXLApoDMMYo0RL5aGfY00PRbc+3iAEgRt/wRAYwuy7O3t0/gs3jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7365
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



On 2024-02-16 10:33, Mario Limonciello wrote:
> This vendor specific property has never been used by userspace
> software and conflicts with the panel_power_savings sysfs file.
> That is a compositor and user could fight over the same data.
> 
> Fixes: f97e4303da16 ("drm/amd/display: add panel_power_savings sysfs entry to eDP connectors")
> Suggested-by: Harry Wentland <Harry.Wentland@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> --
> Cc: Hamza Mahfooz <Hamza.Mahfooz@amd.com>
> Cc: Sun peng (Leo) Li <Sunpeng.Li@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       |  8 --------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h          |  2 --
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 --------------
>  3 files changed, 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index b8fbe97efe1d..3ecc7ef95172 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -1350,14 +1350,6 @@ int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
>  					 "dither",
>  					 amdgpu_dither_enum_list, sz);
>  
> -	if (adev->dc_enabled) {
> -		adev->mode_info.abm_level_property =
> -			drm_property_create_range(adev_to_drm(adev), 0,
> -						  "abm level", 0, 4);
> -		if (!adev->mode_info.abm_level_property)
> -			return -ENOMEM;
> -	}
> -
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index 2e4911050cc5..1fe21a70ddd0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -324,8 +324,6 @@ struct amdgpu_mode_info {
>  	struct drm_property *audio_property;
>  	/* FMT dithering */
>  	struct drm_property *dither_property;
> -	/* Adaptive Backlight Modulation (power feature) */
> -	struct drm_property *abm_level_property;
>  	/* hardcoded DFP edid from BIOS */
>  	struct edid *bios_hardcoded_edid;
>  	int bios_hardcoded_edid_size;
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index b9ac3d2f8029..e3b32ffba85a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6388,9 +6388,6 @@ int amdgpu_dm_connector_atomic_set_property(struct drm_connector *connector,
>  	} else if (property == adev->mode_info.underscan_property) {
>  		dm_new_state->underscan_enable = val;
>  		ret = 0;
> -	} else if (property == adev->mode_info.abm_level_property) {
> -		dm_new_state->abm_level = val ?: ABM_LEVEL_IMMEDIATE_DISABLE;
> -		ret = 0;
>  	}
>  
>  	return ret;
> @@ -6433,10 +6430,6 @@ int amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
>  	} else if (property == adev->mode_info.underscan_property) {
>  		*val = dm_state->underscan_enable;
>  		ret = 0;
> -	} else if (property == adev->mode_info.abm_level_property) {
> -		*val = (dm_state->abm_level != ABM_LEVEL_IMMEDIATE_DISABLE) ?
> -			dm_state->abm_level : 0;
> -		ret = 0;
>  	}
>  
>  	return ret;
> @@ -7652,13 +7645,6 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
>  	aconnector->base.state->max_bpc = 16;
>  	aconnector->base.state->max_requested_bpc = aconnector->base.state->max_bpc;
>  
> -	if (connector_type == DRM_MODE_CONNECTOR_eDP &&
> -	    (dc_is_dmcu_initialized(adev->dm.dc) ||
> -	     adev->dm.dc->ctx->dmub_srv) && amdgpu_dm_abm_level < 0) {
> -		drm_object_attach_property(&aconnector->base.base,
> -				adev->mode_info.abm_level_property, 0);
> -	}
> -
>  	if (connector_type == DRM_MODE_CONNECTOR_HDMIA) {
>  		/* Content Type is currently only implemented for HDMI. */
>  		drm_connector_attach_content_type_property(&aconnector->base);

