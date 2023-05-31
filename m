Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FF271891B
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 20:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A2310E4FF;
	Wed, 31 May 2023 18:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8441A10E1E1;
 Wed, 31 May 2023 18:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685556790; x=1717092790;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=etPeP/vvJohdGTwasWvE6TrHX1tv3ZWbtHfRwo+znXs=;
 b=HCtNE/t48f0uGkccA6enz3ug4XIndaDk4ZOACI5RMru8EfRviInUSuB3
 xMa00Is9kmqXBDQu4bKsk5CpKJptveqByJYINV3ZwmBllhvPW/0cfkq+m
 itMlkR8g5o2DLxLo6UjE96dVgdxfsMKhxJ2NpyGBe2gfvZ7+f6mk07pz8
 EranTyQraRjYCrsJHMg+E/BnbuUAVDJKguvpxKslyBAewAOHemjEuLA1b
 vV+A+3It8Mqr8r+t1l1te44YYrAAprmDbRMcYM3q2KjUMwNDonzjp39u5
 Y/jCcc74xEXpFRbMUvsmELKFT0qoGICD0KL7UTbJVbcz6OhCq/BjX51Lz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="334942487"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="334942487"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 11:13:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="736754147"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="736754147"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 31 May 2023 11:13:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 11:13:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 11:13:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 31 May 2023 11:13:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 31 May 2023 11:13:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlJnPEZXO2ccSBrPw0lhh4pAOLL+S05nD6iHOoIcfugjjJckzBYJlc2aA5d4rmilJubRSI6Dpu9JInPDZHQkMOsvofwyKNuFzCsngoosJ3Kbie70yAsjRnJQvUB7nNTylDXlESaZo39sJkXIvgwKhOYff8xbckk97gzbOdiW13lKoYLU1fc05BTVbfrRg+OYH2O7TOywEzUMIs18eBFQLHbAzCTYJgrxY93LO48P4//XioPhxO1/Y2Ju1L/Qx+tZzINPWd+PAhWh+hgwYG42FdMDNlupSaWMv8ypAxNtcrBht80c3ecPK9pzT1XIOrYYBODZiq/3WGSsJMjBWUlctQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOG8iyfEFfqJ783v2gs5v7ZgJ1tuC5TxsRs/lxYx5KQ=;
 b=CLM00l4p0Te6VqANgVNx3a1Lca9nGFQXu98JsXDsjwYqmdkIhh05D265hy2fz/2xFISBdH3VLAgy3GbLLvgP6lMSKdD85xPZlQcIVTdcAWUdPxVwDGKWFHSbV3efGxO61W8EfFJm2xJIwF6Ym4WTWa+IoCeq47857ZpCM+p5gfoAzls8JtBcRXdef41xC07ym8PgxwuqivFfs/tL/zK91xJ4zD1iqfKezMhOs71/GvITGFckb0eyi5dZXoCr9JT0qxMpfzbE6h5TATFvfma2B7YAhUjVKMYSfTN/IjOCggNOzEV3pHiL4G+3EzTFJIwYOlJNCy9ryvAWChE3pgn6Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH8PR11MB7093.namprd11.prod.outlook.com (2603:10b6:510:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.18; Wed, 31 May
 2023 18:13:04 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::8e92:306d:7cc4:2953]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::8e92:306d:7cc4:2953%4]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 18:13:04 +0000
Message-ID: <019a9eee-c706-04df-e0ea-baa6820b49b5@intel.com>
Date: Wed, 31 May 2023 11:13:01 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 5/7] drm/i915/mtl/huc: auth HuC via GSC
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230527005242.1346093-1-daniele.ceraolospurio@intel.com>
 <20230527005242.1346093-6-daniele.ceraolospurio@intel.com>
 <22ff64c588c62d2161b4bb794364e1e8e207d2a7.camel@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <22ff64c588c62d2161b4bb794364e1e8e207d2a7.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::29) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|PH8PR11MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: 868f838d-68c5-4e7f-bf28-08db6202ad50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hw6bD09nUK4fzSyIaNSA8g7VSULKGpHx9gm0m+J7FVNNcwImC/3zczFf5Ew2auGTBInKb7JUUMcyzuyKNBtFOsrcCMW//wsTVb7pipu81+n6eCtEfh+9fnDBgN26ntZ00jHAR94SHE8SvWM42Eh0pai06w+/EaadfakHttaTwaAz5i6RxGQeV0UuVaB/xU/MmYkseaE4FFNSjriuJavRpgM9NT7rXrd+vcYqYQp/7nsm97baNlreYqygbAaW7srom9FjJSEGsmTO7tVwON2XH03OvI74eQPBvzT0eCWXR9VwsgU/CiIMMjCv210VGzcOgY4w1sAgcbRONz1COOPYj2kPaIHrXJs+CkrDcPj+NpsYYSKX6wMJz1aJ55rdLIauMNfrqXZYa10OZwt8+ZasdjhDFGOYLq1PiWnOtjhiTYgTxEly6Ml1fPMTtjcn5H3Kk8iNpMT/xu6cP3MK0yP0BMjn5YxdIPLmYqH1/qHhyC34a3Ss/tQ9fHfMwQObIXrdCmv87MouV6qcHB4yW7LX4T8Y2V2FL7G94aEShw3GA0F9CvpZESwH4OQPYuWNQ4TTO7jt4Ea/qgG2GKanbxj0VkWSeFOdp+7WNZGt89Sc0uJvvUBxecLNYZLvwOgAD2zNO/+eUQzPBWUhjh/WJnZXGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(39860400002)(376002)(346002)(366004)(451199021)(66476007)(4326008)(66556008)(66946007)(31686004)(110136005)(450100002)(82960400001)(478600001)(6666004)(6486002)(41300700001)(316002)(186003)(86362001)(6506007)(6512007)(8676002)(26005)(2906002)(5660300002)(31696002)(2616005)(38100700002)(83380400001)(53546011)(8936002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVJremdBS0pqbUNMenVuNHRPRThybnluUkdES1VlcnZFb2xGaTA1d3J3REp1?=
 =?utf-8?B?UXYxaksrd0pSU2daTnRiN255Ym5mNlVEZVVpMzVvbmJpNXdhVnh5SUlXYWNx?=
 =?utf-8?B?ZDA4MmxCdjNFbWYxMXVzbEpDTXFMUjdZN3R6MkZiYTNuME1wQWdEdFBEbjlQ?=
 =?utf-8?B?S2doM0xsWEdxaHowdU9SOHZyWXVkZG5zQ2tDbEQrR2tYb1ZXNWZJZDZCQzVT?=
 =?utf-8?B?MzByZUhTODBtVHY3Q1VVWDhhMVA0Z3haeHdMMUt0c1NOSVNpeDBJWkJSZnhr?=
 =?utf-8?B?RzlRNVgvTmRGTzVCdkpFSWZDNk4xVWpCMmJpbGpxT2tTbXR0bGFWdlR4bTNV?=
 =?utf-8?B?SGZCajNJMUpGWGRSUjBGUEFTL0RPUDIzV2ZERDZyZnVFNXJpTXczR2R6UWVC?=
 =?utf-8?B?UXlKVHJmVGxMYWxseFB1VzZZdldGTjlQaWEyb3RlSlNiNERSMFFJVFhEYnlt?=
 =?utf-8?B?dlhNVjJmMHh1YjFhbGx3cFhKS3F0VDhWNmR1SmF3WkF1VmcvblZZbmJJdVZV?=
 =?utf-8?B?K2pxckZLR0dqa0pJUWFGUWU5RVVuQS9GUGwxcUxWR3hlUG5yY3FlSEM4dlpN?=
 =?utf-8?B?VzFzUkdNMEwzbDZrWThrZ2xvRmJncE9PMWs4ZVA2dmpmT0R6VFMrdU9HS3gr?=
 =?utf-8?B?R3pGMCtEQml2RUpCY3prL1Z6U3FPSThSc2FPOWtpV0NraWZGR2tXaXBPMkVD?=
 =?utf-8?B?b2hISjFQUlFmZm8zMHZtQS91NC8ybjVHcFdDWjEzSURrcndkV1FPdmdrempW?=
 =?utf-8?B?OWc5OEgrN2xob1J4LzZDbkVYRHVqTUR6Q0xFc2FDbk1zNDI0ZFM2RzlaUDJi?=
 =?utf-8?B?MnhNdE1mQ3ZZYXVoVDBud0g1aWlrZ1RIZlpyc0pJd1dZbEhTOWdzMGdudWJl?=
 =?utf-8?B?NUlSdWtaTERFWnhWVUEySlI4Um9NenU0QU1HQzliMkNhWGRxbjdGajZKYmFW?=
 =?utf-8?B?L09peUhaM2t2VlJ5SkZuZWZNWjRBbWVqRGExV3JUbkExOWg0TFV2dXZyWTdU?=
 =?utf-8?B?ajVlakMyTFVId0d5YkpHMEVYbzdCTWZaYjNneS83aDZ5VnQxN3NCOGxRYnlC?=
 =?utf-8?B?b2NKR0JmYW4zM2l0cXpwYVRrNmphTzlncHkwYjlaNjdDNWZ5Wk9ZZHRHbWgr?=
 =?utf-8?B?TFArbjJ3ZElZSFl4THFlWjQvN3g3eFYyY0RyZVRsVDFNbHR2K2pkbWdCM2Zh?=
 =?utf-8?B?YkUvOHV2bU1JRGNRYmF1SkNMbnk2d2JOZldDdUI2RzY3TlI4b3ZlcTdYTC9s?=
 =?utf-8?B?TDc5MnFsN25QME13MjVZRm1pWGdXVzhzNjBKbHFSSzBkdzdQVzRFU1Ficjgr?=
 =?utf-8?B?cHk3K29mSERkczVWVkNHRGZ0ei91MUdveUNpbzgyV2FHcUYvMDhmWnBNd3Qz?=
 =?utf-8?B?eXJQZVJPN05kTjh3ajVNa0xNZXZsd2pnQnBRcmVMak9YYll1Vk0xemY0MkRC?=
 =?utf-8?B?Y2Jmbm5nVFF6ZnZBZ2F3N0d6TVBGRDQ2WXJHTE9LN20wdjVhUnN4azhRU1I2?=
 =?utf-8?B?bFRLVEt1WTJXdU9KRmF4dFAwbWdhbXovZXhPN0R2cXZ6a25TUmNKcVdFazh2?=
 =?utf-8?B?TUZic0RUbWtQRnAxWXUwcWFJZ0tzWFJoSVQyZXNPRCtCK2ZVdkovOWtkUVBj?=
 =?utf-8?B?c1BwbVlrUDFZTXYrRkIvRDRQYU8yaGQxdDVTRHA2OVo5QXA1WmI5WWhWWDVx?=
 =?utf-8?B?NFdOajRwc2cwcnhNL3d5bUs2MnlOSm9rVEpNckZnYUpSM0llZkhTTHl4UUQ0?=
 =?utf-8?B?dllxMjNzU0pRYmxDZ2NyaVo5bnFNdUdLMXM4TEVVS0w5SC8ySklCdTgrNmFy?=
 =?utf-8?B?cEJ1Y2lodXdkM1M4Tjl0NTM0M3RYYzk4ZXdEQkM5R2xLbnlFM3JvV21xVUgx?=
 =?utf-8?B?Q2JpQ2tGa21JQzJXVENkZWdQQnhJc0tad0ZyZTBoN29mQnUwREJwMHZtT1Nn?=
 =?utf-8?B?UTh6UHNwdE5HbldMTG54d09oSytEM3NwVmNSOUNMdkNkZFlKd2F6TTlJMkVU?=
 =?utf-8?B?akFzemp6TWpXdHRmWXdROU5GWjNRTVNOVEl6ckdpOEtNRm1nQkVJNVJHYlZF?=
 =?utf-8?B?N2hCbmVwTHFERmlVSGZ2cFd2S0RkSVlQUHpSNVA0akEwVU1iNHRUS2xSdm90?=
 =?utf-8?B?WFFrMEF1WnRTdGhqa0JGQUVjRStScVhpWjEwWndHYVAyWjVLRGRWVHliRFAw?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 868f838d-68c5-4e7f-bf28-08db6202ad50
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 18:13:04.2559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wiUmZKlIF4oRLc8Ra1jDZurjWjjgM4dDpIZ4Dw/67Jo8Ae8EnlYAezA2fF8lMr4OP4OH6W9LHYJ6y4DAo3tY+zIqJX+vWw6LA/ZcQlhiPio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7093
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/30/2023 5:33 PM, Teres Alexis, Alan Previn wrote:
> On Fri, 2023-05-26 at 17:52 -0700, Ceraolo Spurio, Daniele wrote:
>> The full authentication via the GSC requires an heci packet submission
>> to the GSC FW via the GSC CS. The GSC has new PXP command for this
>> (literally called NEW_HUC_AUTH).
>> The intel_huc_auth fuction is also updated to handle both authentication
>> types.
>>
>
> alan:snip
>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
>> index b26f493f86fa..c659cc01f32f 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
>> @@ -29,13 +29,32 @@ static void gsc_work(struct work_struct *work)
>>   
>>   	if (actions & GSC_ACTION_FW_LOAD) {
>>   		ret = intel_gsc_uc_fw_upload(gsc);
>> -		if (ret == -EEXIST) /* skip proxy if not a new load */
>> -			actions &= ~GSC_ACTION_FW_LOAD;
>> -		else if (ret)
>> +		if (!ret)
>> +			/* setup proxy on a new load */
>> +			actions |= GSC_ACTION_SW_PROXY;
>> +		else if (ret != -EEXIST)
>>   			goto out_put;
> alan: I realize that this worker doesnt print error values that
> come back from intel_gsc_uc_fw_upload - wonder if we should print
> it before goto out_put.

intel_gsc_uc_fw_upload prints the error, so no need to double it up.

>
>> +
>> +		/*
>> +		 * The HuC auth can be done both before or after the proxy init;
>> +		 * if done after, a proxy request will be issued and must be
>> +		 * serviced before the authentication can complete.
>> +		 * Since this worker also handles proxy requests, we can't
>> +		 * perform an action that requires the proxy from within it and
>> +		 * then stall waiting for it, because we'd be blocking the
>> +		 * service path. Therefore, it is easier for us to load HuC
>> +		 * first and do proxy later. The GSC will ack the HuC auth and
>> +		 * then send the HuC proxy request as part of the proxy init
>> +		 * flow.
>> +		 * Note that we can only do the GSC auth if the GuC auth was
>> +		 * successful.
>> +		 */
>> +		if (intel_uc_uses_huc(&gt->uc) &&
>> +		    intel_huc_is_authenticated(&gt->uc.huc, INTEL_HUC_AUTH_BY_GUC))
>> +			intel_huc_auth(&gt->uc.huc, INTEL_HUC_AUTH_BY_GSC);
>>   	}
>>   
>> -	if (actions & (GSC_ACTION_FW_LOAD | GSC_ACTION_SW_PROXY)) {
>> +	if (actions & GSC_ACTION_SW_PROXY) {
>>   		if (!intel_gsc_uc_fw_init_done(gsc)) {
>>   			gt_err(gt, "Proxy request received with GSC not loaded!\n");
>>   			goto out_put;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
>> index 579c0f5a1438..0ad090304ca0 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
>>
> alan:snip
>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> index ab5246ae3979..5a4058d39550 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>
> alan:snip
>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>> index d2b4176c81d6..8e538d639b05 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>>
> alan:snip
>
>
>> +int intel_huc_fw_auth_via_gsccs(struct intel_huc *huc)
>> +{
>> +	struct drm_i915_gem_object *obj;
>> +	void *pkt_vaddr;
>> +	u64 pkt_offset;
>> +	int retry = 5;
>> +	int err = 0;
>> +
>> +	if (!huc->heci_pkt)
>> +		return -ENODEV;
>> +
>> +	obj = huc->heci_pkt->obj;
>> +	pkt_offset = i915_ggtt_offset(huc->heci_pkt);
>> +
>> +	pkt_vaddr = i915_gem_object_pin_map_unlocked(obj,
>> +						     i915_coherent_map_type(i915, obj, true));
>> +	if (IS_ERR(pkt_vaddr))
>> +		return PTR_ERR(pkt_vaddr);
>> +
>> +	msg_in = pkt_vaddr;
>> +	msg_out = pkt_vaddr + SZ_4K;
> this 4K*2 (4k for input and 4K for output) seems to be hardcoded in two different locations.
> One is here in intel_huc_fw_auth_via_gsccs and the other location in intel_huc_init which was
> even in a different file. Perhaps its better to use a #define after to the definition of
> PXP43_CMDID_NEW_HUC_AUTH... maybe something like a "#define PXP43_NEW_HUC_AUTH_INOUT_PKT_SIZE (SZ_4K)"

I can add it in.

>> +
>> +	intel_gsc_uc_heci_cmd_emit_mtl_header(&msg_in->header,
>> +					      HECI_MEADDRESS_PXP,
>> +					      sizeof(*msg_in), 0);
>> +
>> +	msg_in->huc_in.header.api_version = PXP_APIVER(4, 3);
>> +	msg_in->huc_in.header.command_id = PXP43_CMDID_NEW_HUC_AUTH;
>> +	msg_in->huc_in.header.status = 0;
>> +	msg_in->huc_in.header.buffer_len = sizeof(msg_in->huc_in) -
>> +					   sizeof(msg_in->huc_in.header);
>> +	msg_in->huc_in.huc_base_address = huc->fw.vma_res.start;
>> +	msg_in->huc_in.huc_size = huc->fw.obj->base.size;
> alan: is this right?: fw.obj.base.size is the rounded up firmware size that was
> allocated from intel_uc_fw_fetch when it calls i915_gem_object_create_shmem_from_data
> That latter funcation populates obj with the "rounded up to 4K" size.
> So is it okay use the 4k rounded up number for the size of the firmware microcode that needs to be authenticated?
> (or, since this is a GSC FW command, does GSC FW parse the mei headers and extract the exact size to authenticate?)

Yes, the GSC parses the headers. The size is only so they know how much 
memory they can crawl while parsing to avoid going over. It is possible 
to just pass the size of the headers, but there is no benefit to doing 
so, given that the header size is variable and would need to be extracted.

Daniele

>
>
> alan:snip
>
>> +
>> +out_unpin:
>> +	i915_gem_object_unpin_map(obj);
>> +	return err;
>> +}
>>   
> alan:snip

