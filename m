Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 118645F6EAA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 22:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B6D10E88A;
	Thu,  6 Oct 2022 20:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C7F10E88A;
 Thu,  6 Oct 2022 20:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665086990; x=1696622990;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dFxKap3ZISCfWD2OMjz6kohRe2puVTym6zvCp8hZrBI=;
 b=bUAEriMZ31YvMrKvUiHe/bNRtdAdGiF53D+wHysG6no+aRuHGYe1527V
 rxsG1uMWGSiKCzzdvx2/8/BbcW+8I7El5PElIfb6YTwPPnBPGlyzQNtMQ
 GM3A+fbKmEhrQvbb+eLUWdbuigTKeqiTp/My4sKsIhZt8vVtFPFfdTljh
 +iYBSrRAdKAQ4RKjx09Sqrhr11iwwSm/zFlJncc41gqJuRHud7YhkjhQY
 R0Juyx/vm++XSenhrbURN1/vJHjQTedZaxjrO4ETdQDwsgyS0CKdp4377
 khJ031kHqAJKrwg35usSBq6hW8vuOVTTbu/Wg+kBlnDk/2+7Bzdf+27Yz Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="283275348"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; d="scan'208";a="283275348"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2022 13:09:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="627150868"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; d="scan'208";a="627150868"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 06 Oct 2022 13:09:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 6 Oct 2022 13:09:48 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 6 Oct 2022 13:09:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 6 Oct 2022 13:09:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 6 Oct 2022 13:09:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/LQiWoFBrBXb1hGi9D/nB3WteWnNTJjZhUxFC+utoMPbaNisd7ccfqGmNaAXmIRMzENK5MctEFeTz/3snClltZAjJyJ9ePRnZ0qjdHeUN8zy5xhSvCBfT6p9TPSfwfyyLVQAtE9ndXk5SRbel+zjM+6MShdN6B5OkZc3rHoAxoXY0uuZhLmkd+93Y/vTlJpVvd0ck9FEKGiyFTOFNmisuz1oZYPjK6dK+v0DitUfuHsql1H294Gr6ieMjjJbzufSGJKs2QPBh1DEnrRHe4YRjxQ7z+XQl7IBNGMgILByEvlJklr7agmG3LxExm1rbC2wo+btGbFaqG7VSeHkIoGXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cllS2iQQWxcJ9iO+/RTD9FVuc+ntUyF7yUB0r6YolaQ=;
 b=Q1UydTWuouRf/lFNfMZx8ozZJBmqCMpqOLErYHUaax6JptkZg0KkahB+GK4GmQ/UePkrQYCrE0tQ8hI0IMOy/Y+OxPqRAX2wkdTu57p8yZrwBVQB4u87x9Doqlj/BCPBco8BuDZ5TD4ByJ/8FZTX9ZMcWcfBESQH+WafsiNC5qzKgLQB5IGj8szeSqgAWRADEFERPdBCu9ezWTWxMeBzdESwHWGBIne2HdjuBgxdC2oA2AnDMPDdu708SzHJFG1qtlnYx4qwM1S0GttQKb46HoZZZnMmIgAQeGg147IRrgZu6+N4yotJta7z9AhxM8eKQSVwZvDahmbIKIfemXFEMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ1PR11MB6275.namprd11.prod.outlook.com (2603:10b6:a03:456::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 6 Oct
 2022 20:09:46 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::7750:dd86:4ef:afc6]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::7750:dd86:4ef:afc6%7]) with mapi id 15.20.5676.036; Thu, 6 Oct 2022
 20:09:46 +0000
Message-ID: <ab07d4f9-84e9-461e-d9a5-20ea852d30ca@intel.com>
Date: Thu, 6 Oct 2022 13:09:44 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [Intel-gfx] [PATCH] drm/i915/huc: bump timeout for delayed load
 and reduce print verbosity
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221006172056.1381588-1-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20221006172056.1381588-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0215.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::10) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SJ1PR11MB6275:EE_
X-MS-Office365-Filtering-Correlation-Id: 417c34f8-1657-45be-6cd4-08daa7d6b6d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V2Tu91aJLlfAKYG5rBdkLwLEfN8vrbiBAHl9eE25yjv4PCdLJZguSoxWonsv8ZPU88dYPEM1gjeXp+pE5BUFmt5CgL/Vz8ca3q5yXKlEsaVHgUOvPxWe6mqE8vlxsIUHV2JUa74zYM5vbLCHD6+ohk1D8phYD3XdSk/dmlMJcXft0ukLizkOCDIMpDo5242BCY8eBskoZaVsXGPA7v4q0d0us1FjvV6m4M+Eg3O/bL5Yxc75xHzsC0YqlfMaZ9yEqw9w09IeUkDuojR99eGKTqTe7X7hI22DgD7TLRH5DfQ+bbhQR1tRA7LFeUuIKXSmui6YE/MQrvY7VNxPN45IMOdRWual730x3nZgj47meG7qRiQ6sfvchox0NzMDRBzYQcSvV/76SfcS10Sa/xId2urD39Ce/t85Vs+dQrZ/A35TxEeZ7TTNE67NR5gK6MUKSGKWogicsdMJMojpFOeHGdZAGt4mnWnYuYxGttsEVXSU5VuF4XHzeMH6VMo2QVuJLAkOTscEF5euvECdG6d9RhE2MoBo/dOZhA11iTKO1kHz5VaMOPkxRlUNYVKPdV0uy6VWCYEqSTt1zZY22T5Wmin3O1VDYj2MPRzck66otBiwwslYaB1Zg3CZLK/mJVKuxUhLZC79NcN+2mV7Olb5kUWUhuYxUZgQH6DId+GAxHHjE6Hl026cO8PhJDXw77vuiTII3VGzn3sWHnIQkh5EjGZLa4A+UjvP4cE/gWrUxCwtuRCO3c21nMwh/o4VoO9s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199015)(6486002)(316002)(53546011)(82960400001)(36756003)(38100700002)(83380400001)(6506007)(450100002)(66946007)(5660300002)(966005)(478600001)(41300700001)(8676002)(31696002)(66556008)(8936002)(2906002)(86362001)(26005)(31686004)(4326008)(66476007)(186003)(2616005)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1BCTm42RE9jQXBlazVaQzZWSXNWVzNodXkzYmtJbjJOTXRUQU1rdEZ4M3Yx?=
 =?utf-8?B?VDlhRTVvQmxNVzF5NGNWYnQ3TXdibGcxU3JmM2RkVUpaR2hNN25wcENZMnFQ?=
 =?utf-8?B?MVlSemR4OVYxZkE3NDBWUllsbDRQbFpkbzQ3cVVPOEFKV2Q2NUtydThSRXZo?=
 =?utf-8?B?SWRrUTZ2UXY5MzRYRnJCS25SQU1UOTFEZVRiNzJrTkw4ckgwWTJpTWN0ZjdQ?=
 =?utf-8?B?T1lwQ09qUTl1MFd6K2gxSVlrYWEwSHhibTVZK0pTOTgrbDRBRWt6RnRoZUlC?=
 =?utf-8?B?UUxpc0drazhLZzB1czRWSStOMmQ1blVTcmg1MjErUlFuYU9WSFBUelVycTBX?=
 =?utf-8?B?ZGkvQVpiWFFIM0FKM2UzMVE4VlJZTUQ0NFNWT0w4YUhGcHlrQ0pMcmtXT0pm?=
 =?utf-8?B?TkkxYzNsbXZLOGVMc092ZEpsSFJwKzYvVmFUeHRUR0hwd2V6MUdYamVieTBM?=
 =?utf-8?B?V2N1djBYUGZEd05xelQ4R2xwamFQL0pMTDVENEY5MCs4bEhudGxzemliKy9h?=
 =?utf-8?B?K0NEZDlubDB6cWJ3cXEveDRTTWlFbUk0S0pWWjRWa0FVbktraHhCcHIzZnl6?=
 =?utf-8?B?WTJBYW1xcE1XaDg2N3F1MC9WU29IUjh1NXRhSm1JWnljZjE3Y1ptNS9xaFFS?=
 =?utf-8?B?Y1VNSkY0elJNNnp1V2lVdldPL0VZbXhoNkpRK1gzSGNZU05iQVA4aDJ1dXpi?=
 =?utf-8?B?VWlGbCtqSlJYU3pwWGhMdWRsdW5obHJDQ0VTekh5ZDFIdTZuc29YeWJ6WFho?=
 =?utf-8?B?OEZMa0RiNmxDd3ovTTRuNFhjV1UxdkxXbm5tWUxVVlJrUjErT2xUeFNmWEQz?=
 =?utf-8?B?dnkrdlEvZmZtT0hiNEtXWENVaEVTcnZQMGU3UHJlaFdadDFXVFRERHVuNFR1?=
 =?utf-8?B?cUhncnphcERvZ2VPbktYNERMSzB0V3RsS1VUSEI2OVk2RytiUDRwaExhMUpX?=
 =?utf-8?B?QkFVRU9aY0xmdjBSN0Rwalo3dnNQNDU2cU9qdnpYUDd4VFkrT0ZjaFV4ZUNo?=
 =?utf-8?B?akt0NUIzVHNWc2lON25COWxURmtENFVaQ01KU1Z6RSswcDRXZ29tQUMxNTBw?=
 =?utf-8?B?MGdWUlRxd3pqVFgvZ2xsUWplU0daOXdHSlQyNVV5K0hSMXJYWHFtUlVTNzVX?=
 =?utf-8?B?Z0tqZzk0YnNlNzRIRHRYems1eFE0WkJvNjRpSk9HaVRaaFlwQ3NvVVdOZUhU?=
 =?utf-8?B?QzJGVjRVL0NXRmlyVjV6WHZIblI3amt4clBvMTQ3Mk5YOHRGTkxwbVJtNDZK?=
 =?utf-8?B?Q2MxWWlGazlsV1h4ZHZTMGJRZ3N2UEpKaS92Ty92UWxhb0htL2Z2VXh0QzRV?=
 =?utf-8?B?b1FPYldBcnREeXNTOXlMZE1ORHFyZWhLbk8yaXJDUUVNTVVJZy9BQ0tMb3FM?=
 =?utf-8?B?ZEQ1OER6bkpvVGFSQ1FQRkVRYm5NZVp5NkFPZHFqcmJpMzJ6Wm1GY1o5blZs?=
 =?utf-8?B?UDEvKzVqS0Y2dk1TS0VEV1RBZVNOZzF0aTFDR1VSUGVSQm1oOGk3eUlkNUh5?=
 =?utf-8?B?Nmg2R0p5YkY1MXdKSWt4eHBIZy9uL25uQnl3T2dESEpQNStxcU1XRk1GSk9F?=
 =?utf-8?B?am1RM2lLTjFEbFphWm4wdHMvVTJtaE4wOTdLckIrazR1MUR6VElIQjR3L09y?=
 =?utf-8?B?UGRZQXJvUzlEWEdYaFR6U0NqU2Q1YjFiYmNpRmVwaXBMUjk0T0lKTUkyNTlU?=
 =?utf-8?B?OHU4V3FxYVd2RzR1OXJ4WGVkR1ArV05qL1UxcFY0clB5UlZJWlNPbXZ3dUZQ?=
 =?utf-8?B?bmlpV3dKMk9xMjA5UU5pTHJ2bURxWWVsQno5cXdJbnZZR29zMGJaMDltM0NY?=
 =?utf-8?B?MWVGZmFmMTBvUW9ERUEzTk9TQUpQTzZnRy84azBWd1pFMkdKV0djUmVoM0dB?=
 =?utf-8?B?eFNBYjZIT1B0eVh2Wk9ON3lEU3VTRzF6YUJtOXVxMmUyZGhjcThEREJsOWhF?=
 =?utf-8?B?Kzg2MXZUdkszZGxGMmRnZ3dvWE9aRytXVW00SURRZHRna01ON0d3R0RUcDBw?=
 =?utf-8?B?cnVrNFNmYlQ1bk5FN1ZKekhTMDRTNk5UTEZESUpWTzhTd1RCZUZyR2U0NmNs?=
 =?utf-8?B?Z3FpQXhXbytVWUNZekR6MUNCdStMUTU3dEJjTU43cTRSK2h1dS9ZNzN4TGdL?=
 =?utf-8?B?Z0dRcFQ2MnBZdG43OUhFZm01ZnlldldwV2EyVjRhZU1ma3VwOFI4NnNCWGpX?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 417c34f8-1657-45be-6cd4-08daa7d6b6d5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 20:09:45.9876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nBZAjgXB4gZPDNI+SqI78e2gBE1JFVY7P8ItylyvGDqap092IZf2xPmi3/qT4VkUZknQDPI01ojWlNuLfXJKrnD+1CdBkPEM/ouUiu667g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6275
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

On 10/6/2022 10:20, Daniele Ceraolo Spurio wrote:
> We're observing sporadic HuC delayed load timeouts in CI, due to mei_pxp
> binding completing later than we expected. HuC is still still loaded
still still

> when the bind occurs, but in the meantime i915 has started allowing
> submission to the VCS engines even if HuC is not there.
> In most of the cases I've observed, the timeout was due to the
> init/resume of another driver between i915 and mei hitting errors and
> thus adding an extra delay, but HuC was still loaded before userspace
> could submit, because the whole resume process time was increased by the
> delays.
>
> Given that there is no upper bound to the delay that can be introduced
> by other drivers, I've reached the following compromise with the media
> team:
>
> 1) i915 is going to bump the timeout to 5s, to reduce the probability
> of reaching it. We still expect HuC to be loaded before userspace
> starts submitting, so increasing the timeout should have no impact on
> normal operations, but in case something weird happens we don't want to
> stall video submissions for too long.
>
> 2) The media driver will cope with the failing submissions that manage
> to go through between i915 init/resume complete and HuC loading, if any
> ever happen. This could cause a small corruption of video playback
> immediately after a resume (we should be safe on boot because the media
> driver polls the HUC_STATUS ioctl before starting submissions).
>
> Since we're accepting the timeout as a valid outcome, I'm also reducing
> the print verbosity from error to notice.
>
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/7033
> Fixes: 27536e03271d ("drm/i915/huc: track delayed HuC load with a fence")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Tony Ye <tony.ye@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index 4d1cc383b681..73a6a2fae637 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -52,10 +52,12 @@
>    * guaranteed for this to happen during boot, so the big timeout is a safety net
>    * that we never expect to need.
>    * MEI-PXP + HuC load usually takes ~300ms, but if the GSC needs to be resumed
> - * and/or reset, this can take longer.
> + * and/or reset, this can take longer. Note that the kernel might schedule
> + * other work between the i915 init/resume and the MEI one, which can add to
> + * the delay.
>    */
>   #define GSC_INIT_TIMEOUT_MS 10000
> -#define PXP_INIT_TIMEOUT_MS 2000
> +#define PXP_INIT_TIMEOUT_MS 5000
If we already have the GSC timeout at 10s, why not just use 10s for PXP 
as well?

>   
>   static int sw_fence_dummy_notify(struct i915_sw_fence *sf,
>   				 enum i915_sw_fence_notify state)
> @@ -104,8 +106,8 @@ static enum hrtimer_restart huc_delayed_load_timer_callback(struct hrtimer *hrti
>   	struct intel_huc *huc = container_of(hrtimer, struct intel_huc, delayed_load.timer);
>   
>   	if (!intel_huc_is_authenticated(huc)) {
> -		drm_err(&huc_to_gt(huc)->i915->drm,
> -			"timed out waiting for GSC init to load HuC\n");
> +		drm_notice(&huc_to_gt(huc)->i915->drm,
> +			   "timed out waiting for GSC init to load HuC\n");
If the failure is that the MEI PXP module hasn't loaded yet, why is the 
error message 'waiting for GSC init'? Or can we not distinguish between 
GSC load timeout and PXP load timeout? In which case should the message 
refer to 'GSC/PXP'?

John.

>   
>   		__gsc_init_error(huc);
>   	}

