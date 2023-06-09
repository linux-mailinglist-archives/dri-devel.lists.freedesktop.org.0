Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6817D72A09F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 18:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFF110E6CD;
	Fri,  9 Jun 2023 16:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF74A10E6C9;
 Fri,  9 Jun 2023 16:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686329413; x=1717865413;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nFrNuH1nr3bLGNcVeCXAdGZV5QWCAA3Q7qNI0ZYIG8I=;
 b=cK13tGrCXkHNll2LD76U/Rcx4bk3InqWR5RZXdUn2WCPY+q2J1HnLb/+
 f8GpMW7532qDy7AoZ1i1YR31qWGZFN3zoZa7IT0EVmZwMTNrIqO/QgRDk
 nd0YDAev2Fn2DYwbSpB3a2CgG47Jq6YGWfqbP+GeCgxzGtmc7CjhMkXGZ
 c0oRvD6LV+VXAEtQiTpl5LY/XRCcquwUg3OXzWlnSZnKm7leYZDF31aue
 JnqFniHI8FcwjXwHZd3zQ4XkF2sx+ePVvtXyYhByNrIeolK/fBL6EJjjW
 WFhBIIp62vF/fHVKAiOAdkqzO+K9r5ByWHDl/EMTCk53PgQxor3l6gaNf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="342318086"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="342318086"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 09:50:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="823128435"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="823128435"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2023 09:50:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 09:50:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 09:50:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 9 Jun 2023 09:50:11 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 9 Jun 2023 09:50:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IoO+2Zs6IrW3VzmRQ38gxSQoc2mgMtKkpZbaKoGivop9s8ubHJMffAsim0r6seKc6MkgoUDRmQMBon40p4OKhalsFTDpHJw8cCAog4kdeBGEQctRxNSHzxSHWYp+k+Z42WJXlwbB5GMenpwSYyoYKvsxklrP7f279D9oShke7h8lH3eadBgQs3BAz31qvcezgac0KqTZS/EUJZcWZGwRfIBFWV/8NacSQJrCcT4RYcy2uYqZlOb+8jTMrWCNA1eSQn3m/UsqxBfVix4eZUSHxhKf+GOeKLqH4a7xiTit0L2DL2SN4gAascVMPJZ3pY/fWMq9zY4gACBk93puy3ciZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBLl9+ShVzEsB3oMmMofbuSHp4d5QR/uNNH5JCK6dvM=;
 b=eTXgoEwP2OT9rVgaRj8hElKfi2jaZMOeD9NepGpF286xjOObeu5SmxXLZtXrftu/1Pk9nj4Bk6AeaCjQmnwgiBYlnufNYWCwbGRH4seZrGqpSId8Vk0wWi7Db3QFsRRSi86XCu99uK63VB5T8BguaL6d9mUKdFfozHGaPdT+MTGuGNw4vqfEplwHODwCLYuVNzDzTbsoGyzoWjJWRfpKI+ZsTqHtrpJj/CSDH4DH8OURGgLmMACP4N1owDCkuzC+ESGdw435owa3ovNpU3xEngdIxSnSon+k3bH49HpK/Owb0eoAfHTN+ow6UnyS6gPVg5fXls1nr5qVBSCdBWkwjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM4PR11MB6093.namprd11.prod.outlook.com (2603:10b6:8:b0::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.24; Fri, 9 Jun 2023 16:50:10 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::daac:2cbf:e20a:4f7d]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::daac:2cbf:e20a:4f7d%4]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 16:50:10 +0000
Message-ID: <c62ad5e3-1079-121a-848a-ec062233e709@intel.com>
Date: Fri, 9 Jun 2023 09:50:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/i915/gsc: take a wakeref for the
 proxy-init-completion check
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230608230716.3079594-1-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230608230716.3079594-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::24) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|DM4PR11MB6093:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f31257f-4d35-4f13-5de6-08db69099679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9M5cpkswzPgftR0H8R4b9h8tQzcJoijM0274ynpzbtn/9CK+UnTO7TsbucdeNMYLivWM8/PL89qqykQ05/wcZg+iYtyvH4vo0h1rJPhE+dNtc/ExvZ4KfEloDy0aJ/E4iKWsByI7iFM11g8Bk2Wl/PviNE6QDud8j4klgcvX7B5ej7ixx7JxUEUbAV7DpJGGrwapeuCpSWZ33dCfolVD/qQ2oUg5TxUdYorCQLGweXogNOmu8STpi3O2YKw6ploPAy62xK/igfo6ySu+Y7VTlNgytEsPyw+mtidxWtdR+gLEk8bzn/hSHqxoE4/s8C8wEmINmEHIUcExYdksyytF9P7mRAaAS4JwDvjyqaz/KFB1lVS6lihawe2en+w4OR88JVUU64ogYCWRFz1JZAHEeuMFOF/aLrnLAxbYieT+92Pv6CcT4GThMu3LF/p02pDz83hymT+VvjNxWf8Pq6TSbF5vhoXwwGUso5H9tEiEGY4yvMyLkzluf4wd3X8WxLLnoFeCjgzQiYNT2PtKYuanuNeQQbrEnUEX/U41JMq9qPX1c10q/MfubvOiA1u49EUF6cksrCggICm1N2TPTiu5Nku5MgOphEfHD0UwRNSbfdk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(4326008)(316002)(478600001)(36756003)(5660300002)(66946007)(66556008)(6666004)(31686004)(66476007)(8676002)(6486002)(41300700001)(38100700002)(450100002)(8936002)(82960400001)(86362001)(2616005)(53546011)(186003)(2906002)(83380400001)(6506007)(31696002)(26005)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3BneWtya3ZTZG5jRmRmRncwTGhWMGU2Kzd0YS9EdVdPNkk4WWE1dEIzNHhQ?=
 =?utf-8?B?Q2hDZHcvT3RBYXRjL1JMMjJ3RVhGeWcyRWtsalNtSkh4WVNvVG5IODlkYTVJ?=
 =?utf-8?B?RllDbXhVQzBlZFcyNGVsQTlscHl4di9ndllvRVZ3UnFpUWNCbE9VWDFhcCtO?=
 =?utf-8?B?RXkwaVFIRlVpMG9QRG8vK3E4ckxuaXp3M1p3K0pmTkxtb1F3c0dXc2hQU2Z2?=
 =?utf-8?B?eGlueHdxS3lPazJMQzd1MmhJYUo5TGZrWWVsY1lEV20rOU1kc0tQZnVsQmpE?=
 =?utf-8?B?SnBwd3RpOUVSdVBtN3dJbDRReG1GMmU4SGdxckJWb1IxcnNlL3ozdEZidU1y?=
 =?utf-8?B?WEhmNHdPVUl6NXdMcUpkMW8yQXd4M21yamtUc3VNL2x3NGRoVUZreEFiS1dE?=
 =?utf-8?B?Y1grcGJzMFE2WmJrZklJR0F1WjBUNkJvcGhlaHJnK1FJUXV6RDlJbmNEaGZx?=
 =?utf-8?B?NTFHa0lPcWFjdjZ5a2NUOWM3ZTh1WmlWN2VIN2txV04xdXoreEkzWUFhVmNS?=
 =?utf-8?B?Umd3bUtJcDhTYmp6dEQ1b1JhNTFRODU2RHRYa2hqUlMzeGFsMklXZUtjT09z?=
 =?utf-8?B?eXZhODRkdUJ5T0xmdUpVVHQ4REdkWC9RV1VrSzBlVUlYVVVHdlQzR1A4bmVn?=
 =?utf-8?B?OG1sOVRKTDFyUmFYN25lNjNjSWZTdlRLUThYYnRsdWVDQnF3MUpTdUJ0TDN5?=
 =?utf-8?B?QThuRlVvQkpVK0Q3VDlxVmp5VERKLzlyUU0xSG1ONVBnMzhzV1FEZTZBQUxu?=
 =?utf-8?B?eFhXMG55UnVqcG5RVVVwaDg1NHkwWm01cHNzemNkMXpOeTNvSzFxWDQ0MktG?=
 =?utf-8?B?UmNLR0lVSHBjWDdDQjRsb2N0VTJXU0RjU1B6RUdnb0FwTG9LaGpyU21rUkhk?=
 =?utf-8?B?cHZGSnVDSlViYVFucTBJSTNEc3F1N0ZpTlFRbFJvNjBvclh3ekZxR0NiWVIv?=
 =?utf-8?B?SzZWV0Yrai9oNW82a20wb2RsZlI2L0tJSWV5TlpxMTcxVStTY1RHV0k5NGNp?=
 =?utf-8?B?czdHSjFmVDRyV1pjWWlSWUZndlVIM3JIVERYU2RlMkZ6cmhSWHBuelJwRG1m?=
 =?utf-8?B?bnBGMmJyditVWk5yeDZrOGNseDlRYk9CSGhZYUZOdGRFdkU2UjdKRWtjS2x4?=
 =?utf-8?B?MjFZRVpDQ0dwMWhFRU1CYWM5SnhjWVpxTUo0WHpzZjVrRUViYnI3d2xqYVEx?=
 =?utf-8?B?akVxM1NCMkRoQUNuVk1nc1YvVEFpcS9XakdiL3lUL2tvUFJmSEJmWDhKY2RM?=
 =?utf-8?B?dGdMNjNlTExHYlFySEIveDcxZDhVV3kxalN4cDlPd1hzcFUzUEZ2K0V5UFdy?=
 =?utf-8?B?TGx3ZHhxRHhNZ0RqTzBrazZOZ1hnNXdWU00rZlpQSitxdmxRWEdSR1NhdXV6?=
 =?utf-8?B?QXNIL2c0b3VEVTFJRnQwcVRMdDgzeXlvYlhMYnIrRDdoSVpjMEwrQk9mQTly?=
 =?utf-8?B?SjlENU13QStWMkhMUmVtdTJEakdXQXY3SHlwbGVMVG1rVDUzWWpNNDR5dXBQ?=
 =?utf-8?B?RWFmcUEzT3l3MzdsZ2NxRjlDTk5ocTV5SnhEZTZidStidExIalRaYUtRV1lw?=
 =?utf-8?B?STdVTzJyMFRYeDA2OUpYOEduK0JXWUZSSjJmKzY4NmN6N2ZFaGVzUW1neDRV?=
 =?utf-8?B?YUtJWWw0TmxiR2hYc09tUUk2aFFuT2gxUVF2OU1LTEtmT1ZNN2s0WGxQUlIx?=
 =?utf-8?B?NXNyQVJjUHR5c3F3KzQ1czRQVzJ0R2YwalB5NTRSbDVleG9udVNkRVYva0gy?=
 =?utf-8?B?ckpHOGxxSjNlb1JtSVhSMHpZNjZyVDU5K1NjZnRWMisrcTViZ1lHZlAvNHh3?=
 =?utf-8?B?TWxHVjJNNU9hSG5YdzMwaHRneVA0eThwVlhpK0haY1dIRi9veFRteGpZUWU2?=
 =?utf-8?B?SFQ4Z3VwbFp6MDY5MUdscFRWZEpkMHFoQlZvZkZmYWhIUzNkbjNpTjc2cHE2?=
 =?utf-8?B?RFZMQVJMM1o4ZTU2UE51VzV1L1hrVU5BWFN3bEFnOG5QZ1BVUUk4RFhaZ3lt?=
 =?utf-8?B?ZUlGdTNyL1F4emdodElXeitVMit1UXY3dHhrY2sxV3IvUEdpV3U0SG8xai92?=
 =?utf-8?B?dE1xMnVtalZ6MnB4Z1Baa0FBdkRZQ2xrRzRDSzlsSmRvR01VQU1PaEZqcllv?=
 =?utf-8?B?T1FwdFIxWWNFTkI4amxYZEI0Rmh0Tm00UDhpWVRUT2dtQ3hUald4WUo4aUpW?=
 =?utf-8?Q?VzbbUAzGPEBIZsfBKfE7BN8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f31257f-4d35-4f13-5de6-08db69099679
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 16:50:10.4912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VLojU8l2nheYOEG2uSXS1MjNUSkipVuFh68T2MUkZSeY/+iB7eZEGuD0Zjc+h4hR91HHmwLSAHY/Ajb09X7edOh4z2GO5Os/gRZto2ufTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6093
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



On 6/8/2023 4:07 PM, Alan Previn wrote:
> Ensure intel_gsc_uc_fw_init_done and intel_gsc_uc_fw_proxy_init
> takes a wakeref before reading GSC Shim registers.
>
> NOTE: another patch in review also adds a call from selftest to
> this same function. (https://patchwork.freedesktop.org/series/117713/)
> which is why i am adding the wakeref inside the callee, not the
> caller.
>
> v2: - add a helper, 'gsc_uc_get_fw_status' for both callers
>        (Daniele Ceraolo)
>
> Fixes: 99afb7cc8c44 ("drm/i915/pxp: Add ARB session creation and cleanup")
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> index f46eb17a7a98..60e9c6c9e775 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> @@ -24,21 +24,27 @@ static bool gsc_is_in_reset(struct intel_uncore *uncore)
>   	       GSC_FW_CURRENT_STATE_RESET;
>   }
>   
> -bool intel_gsc_uc_fw_proxy_init_done(struct intel_gsc_uc *gsc)
> +static u32 gsc_uc_get_fw_status(struct intel_uncore *uncore)
>   {
> -	struct intel_uncore *uncore = gsc_uc_to_gt(gsc)->uncore;
> -	u32 fw_status = intel_uncore_read(uncore, GSC_FW_STATUS_REG);
> +	intel_wakeref_t wakeref;
> +	u32 fw_status = 0;
>   
> -	return REG_FIELD_GET(GSC_FW_CURRENT_STATE, fw_status) ==
> +	with_intel_runtime_pm(uncore->rpm, wakeref)
> +		fw_status = intel_uncore_read(uncore, GSC_FW_STATUS_REG);
> +
> +	return fw_status;
> +}
> +
> +bool intel_gsc_uc_fw_proxy_init_done(struct intel_gsc_uc *gsc)
> +{
> +	return REG_FIELD_GET(GSC_FW_CURRENT_STATE,
> +			     gsc_uc_get_fw_status(gsc_uc_to_gt(gsc)->uncore)) ==
>   	       GSC_FW_PROXY_STATE_NORMAL;
>   }
>   
>   bool intel_gsc_uc_fw_init_done(struct intel_gsc_uc *gsc)
>   {
> -	struct intel_uncore *uncore = gsc_uc_to_gt(gsc)->uncore;
> -	u32 fw_status = intel_uncore_read(uncore, GSC_FW_STATUS_REG);
> -
> -	return fw_status & GSC_FW_INIT_COMPLETE_BIT;
> +	return gsc_uc_get_fw_status(gsc_uc_to_gt(gsc)->uncore) & GSC_FW_INIT_COMPLETE_BIT;
>   }
>   
>   static int emit_gsc_fw_load(struct i915_request *rq, struct intel_gsc_uc *gsc)
>
> base-commit: 27187d09511e1d47dbaaf91c7332319551a8edab

