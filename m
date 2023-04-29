Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D756F217C
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 02:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3320C10EE0A;
	Sat, 29 Apr 2023 00:05:01 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9CB10E161;
 Sat, 29 Apr 2023 00:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682726699; x=1714262699;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pxUdYdTpgHrEzMuw0qWzn8hyQwjtdCMfywuSFITRKmM=;
 b=mxpyyA234aeDIYYXM0VCtoEypD0fAQxYTS8y7JUM8rHuvV0GbKPfjOvX
 K2Tkwk/12WalItjQMabohyk8jBXb6xwLFrr4EWguiPUmAT11UcIzyNpx6
 wdUusma+MJZpPCFy45kuPmA4x2rL9WLPlkCNcnrymh6ehnqSeFK2s84cD
 I/+zCVYpX6ZQCh6irjBKhB520CvDhQw2o2SguvoPk110r5Sww0bn6mY1S
 lT0O0znfmwNXYp9YZ3kR2CGtDQiCd/osVtFQTCHWr8igvewxfwWuEuRIA
 9zcUT9Rr816snoxZSMS9Mw55pe2goYgQloZ40z2e147qLFMwtxPUygSvg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="347910985"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="347910985"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 17:04:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="725528925"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="725528925"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 28 Apr 2023 17:04:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 17:04:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 28 Apr 2023 17:04:58 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 28 Apr 2023 17:04:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=We+4QEubK951Zw3eJQZ5MH1TSHWReyqyg0mOsSV4ukKkOj0N/IDKsGWboZZDvRVxV4FbFqpKcUUZ5nVgina4vEXVAu4OCiFWkbWiapeW3ssHIgo8jhf0VDyQf+Y3lJGbk24AAUWl6SSfK9QCP3LpvTQz5971Y9TgosRpZovD8T06AxixD0tUO+E7NLSaWwS7P8x7dC3eG05cD4onAOJ9SF1SNt5BKT8ru0gCELal1235l1i1Pf4VdBQiyx05UxCE7V1pZPdm1fzgevWHmLgvuiCRte36I2jIH8J+2pJ5c0cIOTsFZwpuxxmSI1gedM5daaa9vILCwdqD7oYQGW61Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkd4qAvol95X2le5ri9FfbRu4FcyNSdPtPvdRw54M5M=;
 b=DUblUB50q7WGaS53FGtqV84XUb8HG7UHUYVta85WbrNJ3MeZvuj+Zy/G6I1yfqlOKDIl4MubUkkMrMQ4hsegZZMSVx+duAdBWmYlnrUC9TG2rsk0E2jc+nzpvUhHM7zbaC7DE1bkkkWy3kaRYyGrPTfVjsH/xoRds6gFjD1rkjwc+GX/Yh1cvlItbKl8rZW8dw4zaW+3Ki8IhzAg+PbSL5RbR5XlmGiD2hl4jI03azmdXRhWFDgZZbvUxdYMoeWyGDQC+vahpUXZl0L5uewdeBIWpAKc7cTmhZ55KJcCeiBchkZa8QUu1HGYH/HcMnTsUIhH9VHESJXwy8/r3dbRxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 IA0PR11MB7353.namprd11.prod.outlook.com (2603:10b6:208:435::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Sat, 29 Apr
 2023 00:04:55 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%7]) with mapi id 15.20.6340.023; Sat, 29 Apr 2023
 00:04:55 +0000
Message-ID: <7716eaf2-41e8-9b28-3b87-70b5ff2962a3@intel.com>
Date: Fri, 28 Apr 2023 17:04:51 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 4/6] drm/i915/uc: Enhancements to firmware table validation
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230421011525.3282664-1-John.C.Harrison@Intel.com>
 <20230421011525.3282664-5-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230421011525.3282664-5-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0077.namprd05.prod.outlook.com
 (2603:10b6:a03:332::22) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|IA0PR11MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d1cf216-234e-42db-a93d-08db48455c59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7algaqzoyPgCRjatmTwDxq0l0uWXdmTeCQr/jfiiAzOH5mMevyKxnBps/FrkBDK7xZw57jOwAiRhStKAWgdbR49GJ8Z2IbO5bKqwgW69JWG/wgFI3eloEdqFaxJuQHKgETlfVI6WGNfRsJXzMXDylIwdD2iJjfytho1SCKMU2csNxuc4oSUleJk8bTVXoGTycCFoAbumoerbhTu+GpapyC0fG8361DEEsWJPYdeVfNuSD9PyaLYc5vsLzFTGHqnHvH9jLHP83FYYVbPhtN75JgzytA/wT8mpqLq5Af9LVmfASxkdR4ZqBDLSn0FZ0YvNs/BTsb91SmrrhqKK28h3OPAAEHJmVAzlQgf577rhjk/Q3lXY6AKw2SEqX/OgKBxC1ORosd2I7pi9otJw94la7NPizB2pr6PdRnjjX6Ir5s8TX4cqn26hAVD9ZYOZox7lw68vVD1pxSP/SF6ObZZWh6grMtsnkhlXJ8sisvO1jgVRSZ2Bda0MCKMmmI2IL0xejwkNrg2xJ7Jv6Xw5cWe5FTc1VySah2PLHyVGERxGXkAQU3XPSHlazxqhHsFGG6CFeZL/rKpG0KfM/LYvGnKGiLEUXXm0Ga7B/eV6RZ1ISFhTeQDP5aZtNY6EuquJpVlINKPaxSmvqqRBbbrv/15CXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199021)(4326008)(66556008)(66476007)(450100002)(5660300002)(66946007)(31686004)(316002)(41300700001)(2906002)(8676002)(8936002)(86362001)(31696002)(478600001)(38100700002)(6486002)(6666004)(2616005)(82960400001)(6512007)(36756003)(26005)(53546011)(83380400001)(6506007)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUcraVk5cGlSTi9IT2cvaGtkU1c5U1BDbWxCcXJva3FTZXZRUzRiZXdIWW9T?=
 =?utf-8?B?Mjl3RlV1Qmw4ZFJRbEhMS1JvN1VsL0NqQzQxYndER3o5MzJhYlh3N1ZEMWNy?=
 =?utf-8?B?eldIU3EzMGs4Q2kwZldPNGczRGFzZ1NyUUxrc21UU2cyUUZTcGIrYjRNVTZN?=
 =?utf-8?B?WTNORkpPcjM2Um5rMnNXclF3ZDFNOC9sYmtPdkhXbnJTcW5hWjZKMzd6dzg4?=
 =?utf-8?B?RGhyeUFGR3FMekRNS3ZCY3NFaVlOblM1cVc4cU9IQmpWdlpRT2RTdDNZZTYw?=
 =?utf-8?B?b08zWWNPVmZ6aHgxUmJCRGtuUklsU1dDdVRiU3ZlOWdIaU5iVjRvaGdhbm1l?=
 =?utf-8?B?OEc5UzRNTlNpNS8wS0pMaEFraWRXbGQzVkNtaDJTaUFaeHFTYnJHc2ZBRWE0?=
 =?utf-8?B?UmZUTEQ4cnd3VVByL0pocU1QMUVVSG9weWN0US9xU2VkMHY4bWtWMkVhckY5?=
 =?utf-8?B?cWpmVEtaUVNVMnhEZ0pEdzlTVnVrMnd0WVBLdHY4TEF2ZWlFZ2hQQklXaE83?=
 =?utf-8?B?cmJadFgvNWZONVE4NUVmajJsb3FBUTZkWXFoa29ObzhCbjV0WlJnendjVm9E?=
 =?utf-8?B?SUUwWmdMQWpadnk4enBQQVJoM0hubnJzTEo0ZXRWc3JiNC9ybEs3VzFCVHZO?=
 =?utf-8?B?SkpRSkJzeFNIU3JTM1pneXQwcXRWeUFYZklOWGNtTFZmM0VlVlRtSVhtWDlJ?=
 =?utf-8?B?TzNSTVF4OS9RQmJFUDN4OHUyekVQaytGdWlKUXZ1aVg2MjVSL3RER2dJdWk0?=
 =?utf-8?B?UjlzNGVLTENoQ05rTWJoRmtUMHB2cWplVWJNMmxVV1VwelJabVova3MzMzVm?=
 =?utf-8?B?cU9QbjJTM0syUXBkK3dsVWZyTkVyTXhsdUpndytwUjFRc3Rac1Z2YWk4dXpV?=
 =?utf-8?B?Y1VIdWlPcE4renI3Yk5iY3h5Z3FSOVMxemErd1NYZWJ3ZTIxYnRDWDJTL21t?=
 =?utf-8?B?UlhsSnlkS3ZyQ0MxWVdBcWZBMkl3VWM0bXhhcVJEUEphVURPS3BoSk00dWFh?=
 =?utf-8?B?ZHdhaUdwMFdXYmFYaHVhR3lubVd3R2Y3V3lOTnRkOFlPVDhFbnExUHU1Rm1C?=
 =?utf-8?B?b2xqUllNelB0VFZ6Z3VXM1lJK2pBU3FyYlNJRXdxaUZ4c0M4WlBUZjROekhI?=
 =?utf-8?B?NXgxOWp1U010VmV2WC9CQUFuenl4T3pYRWhyb21ZV09jSWhWWTB3MytObmtT?=
 =?utf-8?B?MEdDMGFtOVc0cjRHa09obVRFdkdoZG9PL2hBSnpOVlVsQVNiNmh2emlkU0do?=
 =?utf-8?B?dlg5d04vMDRqNzFkZzdFcnVCamhxb1Y5ck5FVnFSdnFqdEZwaEZZbmFhVlVo?=
 =?utf-8?B?TzAzRjdMcmVZc1d6TVZYZG5sQmZPRFRlU2pwekFwNXBReXdTeEFNMWQrQUlY?=
 =?utf-8?B?UFZCM2FxY21YRVl3Z2dRV0NOT3BmckgrY1liWm5odEM4Ty9WS2xDTzNteXho?=
 =?utf-8?B?cE5qOTQweDdheHkvQWhVQ2wxek1USUMzMjFrVTFldWRSalBpUllQOURPamdK?=
 =?utf-8?B?akgvL2x4cm9IeVdBdlZoclp5ZFg0Nk43cG91b3hnL3Y0WUNwTVM0di9Ed2Vu?=
 =?utf-8?B?bkt1bXorcWE0aUxNOGVEYkhxY3dWVWNicmlLa0dWSDVOSmk3Zm8zaSszZ2Fs?=
 =?utf-8?B?MEo5cnV3UDVXUGh4M2w4dDVoMHBjTUhlTW56SldTS0NlamlvRlBPbksvVVhV?=
 =?utf-8?B?RlN3MlgySmFzYjM1K3BZSGRRdTRDUzM2aUdVUXNIYjg4cVdtR2tJUzMvc0J6?=
 =?utf-8?B?VGN0YXBiU01SRHpKTXRFNWE0a3BKUU0wUUhGMHYvdTlSZ01rRUtpakEyOGw2?=
 =?utf-8?B?MkR6bmpkWDNKQWdPUndheWlmYWU0STFDRzVQYUo0bVpjbDAxY3VGaWdIbm8r?=
 =?utf-8?B?YUQ3ZUQyV1QrU0t5eCtaUlI1WkNPZTBmWTJDT1lBczYrTGhObW9LZzVGWjBz?=
 =?utf-8?B?Z3gxZ2t3M0UvZUlTYTh2eTlSUmJpSG9UbWNCc0lPQ0JFWDNuZjhyRTVMWnhm?=
 =?utf-8?B?eTh0QWd1bVdDK0dWYzdjWWNublZyUnBSMlgwbU05bSsrNnV4c1R3cVdnQnlq?=
 =?utf-8?B?UWNKR3RxWk9hZENHWUl1dXJmbVNPeUt5dHhDUk9hRFpDM0dqSFBoWXZJOEF6?=
 =?utf-8?B?SmhIdmJmUmJxcEl1QU4rM2k1blU3RUxFTWRzTlZ5M0o4T1ZLVlBLTU1zaXM5?=
 =?utf-8?Q?HOG2aCiTqGznr3Svj2C3RV0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1cf216-234e-42db-a93d-08db48455c59
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2023 00:04:54.4077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4YNu2N4a7HCbeYxcPqajkMz8JK025dWzg5cLjRVvlooVL3r472XFfIelgz+n2RpqVi3+BiSXARnS3vQsOjg3fqIW4FAuCTgNjCXJ37PK/tQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7353
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



On 4/20/2023 6:15 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The validation of the firmware table was being done inside the code
> for scanning the table for the next available firmware blob. Which is
> unnecessary. So pull it out into a separate function that is only
> called once per blob type at init time.
>
> Also, drop the CONFIG_SELFTEST requirement and make errors terminal.
> It was mentioned that potential issues with backports would not be
> caught by regular pre-merge CI as that only occurs on tip not stable
> branches. Making the validation unconditional and failing driver load
> on detecting of a problem ensures that such backports will also be
> validated correctly.
>
> v2: Change to unconditionally fail module load on a validation error
> (review feedback/discussion with Daniele).
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 157 +++++++++++++----------
>   1 file changed, 92 insertions(+), 65 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index c9cd9bb47577f..eb52e8db9ae0b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -233,20 +233,22 @@ struct fw_blobs_by_type {
>   	u32 count;
>   };
>   
> +static const struct uc_fw_platform_requirement blobs_guc[] = {
> +	INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB, GUC_FW_BLOB_MMP)
> +};
> +
> +static const struct uc_fw_platform_requirement blobs_huc[] = {
> +	INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, HUC_FW_BLOB_MMP, HUC_FW_BLOB_GSC)
> +};
> +
> +static const struct fw_blobs_by_type blobs_all[INTEL_UC_FW_NUM_TYPES] = {
> +	[INTEL_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
> +	[INTEL_UC_FW_TYPE_HUC] = { blobs_huc, ARRAY_SIZE(blobs_huc) },
> +};
> +
>   static void
>   __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   {
> -	static const struct uc_fw_platform_requirement blobs_guc[] = {
> -		INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB, GUC_FW_BLOB_MMP)
> -	};
> -	static const struct uc_fw_platform_requirement blobs_huc[] = {
> -		INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, HUC_FW_BLOB_MMP, HUC_FW_BLOB_GSC)
> -	};
> -	static const struct fw_blobs_by_type blobs_all[INTEL_UC_FW_NUM_TYPES] = {
> -		[INTEL_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
> -		[INTEL_UC_FW_TYPE_HUC] = { blobs_huc, ARRAY_SIZE(blobs_huc) },
> -	};
> -	static bool verified[INTEL_UC_FW_NUM_TYPES];
>   	const struct uc_fw_platform_requirement *fw_blobs;
>   	enum intel_platform p = INTEL_INFO(i915)->platform;
>   	u32 fw_count;
> @@ -286,6 +288,11 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   			continue;
>   
>   		if (uc_fw->file_selected.path) {
> +			/*
> +			 * Continuing an earlier search after a found blob failed to load.
> +			 * Once the previously chosen path has been found, clear it out
> +			 * and let the search continue from there.
> +			 */
>   			if (uc_fw->file_selected.path == blob->path)
>   				uc_fw->file_selected.path = NULL;
>   
> @@ -306,76 +313,91 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   		/* Failed to find a match for the last attempt?! */
>   		uc_fw->file_selected.path = NULL;
>   	}
> +}
>   
> -	/* make sure the list is ordered as expected */
> -	if (IS_ENABLED(CONFIG_DRM_I915_SELFTEST) && !verified[uc_fw->type]) {
> -		verified[uc_fw->type] = true;
> +static bool validate_fw_table_type(struct drm_i915_private *i915, enum intel_uc_fw_type type)
> +{
> +	const struct uc_fw_platform_requirement *fw_blobs;
> +	u32 fw_count;
> +	int i;
>   
> -		for (i = 1; i < fw_count; i++) {
> -			/* Next platform is good: */
> -			if (fw_blobs[i].p < fw_blobs[i - 1].p)
> -				continue;
> +	if (type >= ARRAY_SIZE(blobs_all)) {
> +		drm_err(&i915->drm, "No blob array for %s\n", intel_uc_fw_type_repr(type));
> +		return false;
> +	}
>   
> -			/* Next platform revision is good: */
> -			if (fw_blobs[i].p == fw_blobs[i - 1].p &&
> -			    fw_blobs[i].rev < fw_blobs[i - 1].rev)
> -				continue;
> +	fw_blobs = blobs_all[type].blobs;
> +	fw_count = blobs_all[type].count;
>   
> -			/* Platform/revision must be in order: */
> -			if (fw_blobs[i].p != fw_blobs[i - 1].p ||
> -			    fw_blobs[i].rev != fw_blobs[i - 1].rev)
> -				goto bad;
> +	if (!fw_count)
> +		return true;
>   
> -			/* Next major version is good: */
> -			if (fw_blobs[i].blob.major < fw_blobs[i - 1].blob.major)
> -				continue;
> +	/* make sure the list is ordered as expected */
> +	for (i = 1; i < fw_count; i++) {
> +		/* Next platform is good: */
> +		if (fw_blobs[i].p < fw_blobs[i - 1].p)
> +			continue;
>   
> -			/* New must be before legacy: */
> -			if (!fw_blobs[i].blob.legacy && fw_blobs[i - 1].blob.legacy)
> -				goto bad;
> +		/* Next platform revision is good: */
> +		if (fw_blobs[i].p == fw_blobs[i - 1].p &&
> +		    fw_blobs[i].rev < fw_blobs[i - 1].rev)
> +			continue;
>   
> -			/* New to legacy also means 0.0 to X.Y (HuC), or X.0 to X.Y (GuC) */
> -			if (fw_blobs[i].blob.legacy && !fw_blobs[i - 1].blob.legacy) {
> -				if (!fw_blobs[i - 1].blob.major)
> -					continue;
> +		/* Platform/revision must be in order: */
> +		if (fw_blobs[i].p != fw_blobs[i - 1].p ||
> +		    fw_blobs[i].rev != fw_blobs[i - 1].rev)
> +			goto bad;
>   
> -				if (fw_blobs[i].blob.major == fw_blobs[i - 1].blob.major)
> -					continue;
> -			}
> +		/* Next major version is good: */
> +		if (fw_blobs[i].blob.major < fw_blobs[i - 1].blob.major)
> +			continue;
>   
> -			/* Major versions must be in order: */
> -			if (fw_blobs[i].blob.major != fw_blobs[i - 1].blob.major)
> -				goto bad;
> +		/* New must be before legacy: */
> +		if (!fw_blobs[i].blob.legacy && fw_blobs[i - 1].blob.legacy)
> +			goto bad;
>   
> -			/* Next minor version is good: */
> -			if (fw_blobs[i].blob.minor < fw_blobs[i - 1].blob.minor)
> +		/* New to legacy also means 0.0 to X.Y (HuC), or X.0 to X.Y (GuC) */
> +		if (fw_blobs[i].blob.legacy && !fw_blobs[i - 1].blob.legacy) {
> +			if (!fw_blobs[i - 1].blob.major)
>   				continue;
>   
> -			/* Minor versions must be in order: */
> -			if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
> -				goto bad;
> -
> -			/* Patch versions must be in order: */
> -			if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
> +			if (fw_blobs[i].blob.major == fw_blobs[i - 1].blob.major)
>   				continue;
> +		}
> +
> +		/* Major versions must be in order: */
> +		if (fw_blobs[i].blob.major != fw_blobs[i - 1].blob.major)
> +			goto bad;
> +
> +		/* Next minor version is good: */
> +		if (fw_blobs[i].blob.minor < fw_blobs[i - 1].blob.minor)
> +			continue;
> +
> +		/* Minor versions must be in order: */
> +		if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
> +			goto bad;
> +
> +		/* Patch versions must be in order: */
> +		if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
> +			continue;
>   
>   bad:
> -			drm_err(&i915->drm, "Invalid %s blob order: %s r%u %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
> -				intel_uc_fw_type_repr(uc_fw->type),
> -				intel_platform_name(fw_blobs[i - 1].p), fw_blobs[i - 1].rev,
> -				fw_blobs[i - 1].blob.legacy ? "L" : "v",
> -				fw_blobs[i - 1].blob.major,
> -				fw_blobs[i - 1].blob.minor,
> -				fw_blobs[i - 1].blob.patch,
> -				intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
> -				fw_blobs[i].blob.legacy ? "L" : "v",
> -				fw_blobs[i].blob.major,
> -				fw_blobs[i].blob.minor,
> -				fw_blobs[i].blob.patch);
> -
> -			uc_fw->file_selected.path = NULL;
> -		}
> +		drm_err(&i915->drm, "Invalid %s blob order: %s r%u %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
> +			intel_uc_fw_type_repr(type),
> +			intel_platform_name(fw_blobs[i - 1].p), fw_blobs[i - 1].rev,
> +			fw_blobs[i - 1].blob.legacy ? "L" : "v",
> +			fw_blobs[i - 1].blob.major,
> +			fw_blobs[i - 1].blob.minor,
> +			fw_blobs[i - 1].blob.patch,
> +			intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
> +			fw_blobs[i].blob.legacy ? "L" : "v",
> +			fw_blobs[i].blob.major,
> +			fw_blobs[i].blob.minor,
> +			fw_blobs[i].blob.patch);
> +		return false;
>   	}
> +
> +	return true;
>   }
>   
>   static const char *__override_guc_firmware_path(struct drm_i915_private *i915)
> @@ -443,6 +465,11 @@ void intel_uc_fw_init_early(struct intel_uc_fw *uc_fw,
>   	uc_fw->type = type;
>   
>   	if (HAS_GT_UC(i915)) {
> +		if (!validate_fw_table_type(i915, type)) {
> +			intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_ERROR);

In our hierarchy of firmware statuses, INTEL_UC_FIRMWARE_ERROR includes 
the fact that the fw has been selected, which in turns implies that 
file_selected.path is valid. this means that even with enable_guc=0 the 
wants/uses_guc macro might end up returning true, which is not something 
we want.

Daniele

> +			return;
> +		}
> +
>   		__uc_fw_auto_select(i915, uc_fw);
>   		__uc_fw_user_override(i915, uc_fw);
>   	}

