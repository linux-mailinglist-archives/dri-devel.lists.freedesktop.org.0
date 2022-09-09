Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A21635B415B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 23:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE0F10EAAF;
	Fri,  9 Sep 2022 21:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0788B10EAAF;
 Fri,  9 Sep 2022 21:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662758428; x=1694294428;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GCrLv16/Qn+xsWe3W2RZiVPfjtrDNH6RyeP0rfIxfSA=;
 b=n6eDkap+1057JIJMMOW3BDP5dDxQhfEyuhGBgxIKVg48c8/Q0kajk2yL
 yDSt2lkXYXahw19T10d4ATH0xninPRv9pBmitjbGCh+hrqlCTTnOwrxx8
 EDK/FIzpQ+IOA0t/Z1D2RzJZOu6C2zBebRqln59Na1Jemk29hqLBQgylD
 iVYdLq+Br8VqfwE8r+8dd4iroFyG7X6sl2U/LxZKZeERxwk+TJ/K1bvwy
 t6wvK2D6Vk1AUcUHX2Q4+x2GlLw3RB2PhpVmkNtS1XyBiCZ+zjtzlr+j6
 mE3VBqmywHvYko5wKSQIXL+rOCKXwFmPd4NehKxllT1e/TdSSHm57nutG w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="295155489"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="295155489"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 14:20:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="683778792"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 09 Sep 2022 14:20:27 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 14:20:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 14:20:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 9 Sep 2022 14:20:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 9 Sep 2022 14:20:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTNlRhVoo8rToc6J3www0ML5DIhek+2b/+O3Ad3I6NsCOb8gbaWh4LnO7VWYglcYE6cG4jFxGZqOxMNqCHGD1tpjz5ddfUPejslRyXfT/in93hycbUSgwevgfa1EC5P97B8HAv2kElHHVKAX8tEo9Xs47r5yKR69D15sUwYe0/VCLess9K+vdwK97OtTw5UDcaBswxypS23BPoogXYXLWkMsUiYBknDPw6vbznH2aYDAvkBGPW9IIb7yE2uCIdEFoAkUTBp4/zr5QvI1si8LgM4rBH5GEBNIgDpoToHETkyMCCFcyHZnk2VRpW6nXlIyyTg8bC42+o6ZriR2y2eTug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcNwzwH5go6GvsGXHxsH9DDTAj7sbyqXqOFsoeyerMs=;
 b=geVoixbfGqJCSxcX/n/vrCpCpJ1ae7yCkEzzE9qI2ThMxYgxgrWrAZPHo+gY9pQwWQGe0kRIIw/nsmTvj4/9cEEwmExdUwU9eQQC3XtWQN3T8G6YtNdplMf2tjBguHU/GVnta8AuVRnOU22JA9OEES5j/NWsRwVSQp9b9RNgaEhHLzgWyle3AaUDHmZ9xsNhW8oqI3Hm/gRmuw/JRR6M0XprnA0fIlpmnwzyesGWvRTywIYEC5eQvaVdTAvZmUAygLC+pOzMgXp9c3BWIlLAOwrA+pJpWfYVRNW7qt8yBLg8Kv7euL61o4WgNfPyvIsb49s9u1ciWiZJfroG8ETyuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4514.namprd11.prod.outlook.com (2603:10b6:5:2a3::17)
 by PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Fri, 9 Sep
 2022 21:20:24 +0000
Received: from DM6PR11MB4514.namprd11.prod.outlook.com
 ([fe80::bc32:de12:5ffa:c4c5]) by DM6PR11MB4514.namprd11.prod.outlook.com
 ([fe80::bc32:de12:5ffa:c4c5%7]) with mapi id 15.20.5612.014; Fri, 9 Sep 2022
 21:20:24 +0000
Message-ID: <b270823d-70e0-cd30-629e-55ca59881fef@intel.com>
Date: Fri, 9 Sep 2022 14:20:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 14/15] drm/i915/huc: define gsc-compatible HuC fw for
 DG2
Content-Language: en-US
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
 <20220909001612.728451-15-daniele.ceraolospurio@intel.com>
From: "Ye, Tony" <tony.ye@intel.com>
In-Reply-To: <20220909001612.728451-15-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0199.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::24) To DM6PR11MB4514.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4514:EE_|PH8PR11MB6609:EE_
X-MS-Office365-Filtering-Correlation-Id: dac2b379-c12e-4e8f-ab0f-08da92a91bf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8KyJQ3JJhmZ1uVBbvi+yyZ9etrAxganAneEy1sM25j5t1atz3Zi5gxr7nCWqT9UG017WZ0/vOL6NO7HrEuS6Z7ZPcsx8OtRWCpO+56soLNDaQjwXEaYwdXzzNt5T8iImfrdWmMuETLhPxtZOGqKKhkuOZlpt2H2pHsuje9QWiFLFXL5BHVCOgbfrQc2Td4XR3YUQxUDLel3Y8Xa+BSBMdzGeZk3tWK1jJ+hZ7cEbmyo83IfShwePC+Vy31YSvDK6KSpCOXs5LqvAsZEX4hpdLJxa8rmsHf7S8WsxBQz07xg3OMQPpXuKRAsjY/OH8iuSXXBzUUez3wtcjtxb6n0WcyVpXYSyNE9YdxYzlP7sMHq37ly+qt4z3tksvl768gC2r3+Q/+bR+gMiTMrS2rvby1bV5h2jKDuvXbVXBhc+fC3ujkaL0fksk6j+vhdAP7sF30SPwvEf2lb42fOBT1/ZmZg0DYfSODTqHwcjJWpy42JEoZnKO+7aqCBIsj3jwKAojhB5ZkD13Ryx/slG4aA6PMe51QEqHs0FUGLrqfaBI0hL5c6+gnCmJbxUeJhZcZnbRJbfK0Q9ON17R7CSxny8LlWyCQN0f8WFwyzR6uIxVSFoSHh5JkCrmKYXceysSfvwua9IHcTZjkMjs9TBjO+JFCXLqEyZMjGqmRTXKYHkyYXmT+t2Nn8b+F8rKcY4d/Q8NYXs+2YPMGCkQUEObhHpg5QYzUm+3yOcp+i0JSMrW2puCzJdc4/pHDtSpNi1/Vc9spYsIxjJX7sBW39kzgwYKi01BROl9dFDMPIhYZcYerA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4514.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(366004)(396003)(136003)(376002)(346002)(6512007)(36756003)(8936002)(66476007)(66946007)(2906002)(450100002)(31686004)(8676002)(66556008)(41300700001)(86362001)(5660300002)(316002)(4326008)(82960400001)(31696002)(186003)(6486002)(38100700002)(478600001)(26005)(2616005)(6506007)(107886003)(6666004)(83380400001)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0QzWDRabWIrdFN3Z01YdnFydUZxUVRFLytjOGF0MXVpQkE4cmRVTURxK295?=
 =?utf-8?B?NnMyaTRKQi9mOVhsRG5idStVZDZxMUN1b0pJL0tlSldLWE9MUWU2TE9QS0xq?=
 =?utf-8?B?Wkc3and0cXl0V0l1SVFEN2w0QUlHd2ppeDg5Z1o4emlzRkwxb3hUcUY5RlBH?=
 =?utf-8?B?cjlsTjZIditKZEhUdURVMC9TWmNuVFBTdG5PbWFtZ0t5Y3N4Q2dFclNSRkdu?=
 =?utf-8?B?Zlk3SXI3SjFxNXVRVlpjS2VKcVhHc1NwOHNiWlZSUlpMYkQ0RWx1RkJKeXpT?=
 =?utf-8?B?QWNlQW1OdU5Ha2pFYUo1cHJWK1Y2MFRWS1NjYmhYamFWRW5xb05CMzhKZGJM?=
 =?utf-8?B?ZCszaWNqNVV4a0VBR0JCQzdzMllLQU1vVnhKWHl2cGs3TmhuVEh6QVB5T1Bu?=
 =?utf-8?B?MlpSWnpha05sRHdxdG1iVXkxamd6M3dOVVBneFFlL2dvYVVVOWorUkJOR0pq?=
 =?utf-8?B?RDBlaWthQUhkTHZKVmUxc2FncndHN3RrYmRhSDQ1R2o2OHBOUHpEMnZvNUJt?=
 =?utf-8?B?MHc0VGZ6MHNaUlROdThIUHZYOFF1a0dCL0RwRHNCdWE2ZGE3cC9CRXlSaWRO?=
 =?utf-8?B?Q2VtckUyTE5YNnY1R05odFRKMkRsNzRncTVYRGRVSkJqUzY2dzBWRG1qMkFX?=
 =?utf-8?B?bEVlM0M1REVTQi9XYWpBNnZHdXZqdHVKbkI3Q2d2cWlmRTNybUhEcVB1TE0x?=
 =?utf-8?B?Wm1CWCtkZTN6UDNCYmhCb0dTQkVtSVE3cXlnSUdEZ0lZTXdPZ1Z4ejZSc2pm?=
 =?utf-8?B?KzFqdzNVTmRkdFh5bEV3K0ZlS08yTlgxcjdvd0FvR2pacE5IbmluQ3QvMUl1?=
 =?utf-8?B?TlVDSHpPZk1EdlNUYURkV1JySkRQVWF1ZWtnY1V6c2QvaVFaOUxWb0s2RkM4?=
 =?utf-8?B?N00vZnNjQjFDbVFFWUpmR3NYb2RWazh3SzhOU0NwVGMwNTVLZGUxU251cEl2?=
 =?utf-8?B?ZlE1WENXL2o1bHI5SldGK3kxTXlRRjI5MEhpSGtta0hlR25OaUN6ckowRFhQ?=
 =?utf-8?B?VUdxUXVwYWoybGgrNEpzSTJ2MVdocmEvckZ0aDJ6ZSszUWhYVzFIaVN3UWRJ?=
 =?utf-8?B?bmN4MS90dW10RTJ0WFlmUG9UMmdJVS9mUUh2cWR4clY2MEowMnJma09ER05I?=
 =?utf-8?B?QUxLRG1tT2l0ZXZUOFF5LzZVaWRBNTZPbGVpRTJNdlkxQnF0OGN1VklZNkxv?=
 =?utf-8?B?aDF0bDRtYVpEM0N0UHV1UGNkUHBicDN5OTI5Wjh3eXRNQ0JsaHZiVWhkOGlu?=
 =?utf-8?B?NHJFNHJ0UG1XSWVSaTEwZmhUUno3d1kxemVNL0VnNzh2M3Rtc2htWG5MVXZv?=
 =?utf-8?B?bFdFNWRzRUd3WGtQeno3dFRSSE4zd0NGUmQwQWJVQW9vWVlLTVRXaWdKc0dm?=
 =?utf-8?B?WGdMczVTWGZIRC9jVTNjM1pOT0U5UDRUQUZmaW5zS2JrM1dKWCtraHZJc3N6?=
 =?utf-8?B?MHF5SFdzNWNRbVdSWHlqVGZxekdQT25lb1B5di9KdTRyTU93c1ZNWkg5ZXdC?=
 =?utf-8?B?RE1kWkNRdzFVRmZHcGJZeVFLOFFsZDcvcFFwR3UyMHNJY3pOQmhYbFhpNDBx?=
 =?utf-8?B?K1B6VndyalQxQUlzSVdnVFNwZERMeklKNzdkejZYVlUvU09KU3Jya1FLclRU?=
 =?utf-8?B?L2lSY0NrNEZtN0NYdWkzSTVPQ2FaMXBXc3hEZVVxNVJQZVJQeVk3dS9NTWxs?=
 =?utf-8?B?SFBZNlNYYUZCcWorK0JrMk9yNndoVS8vbUdsOGpreHpoQlRWR09JT3hVYjJ0?=
 =?utf-8?B?ZkpYMFZEaHQwRldhMnRLeEVKUi9pNDhPOE5HQmpSeTlBLzlvVnB1YTUwNmx0?=
 =?utf-8?B?ckZzd09kSWRUZkZjb0toTW1DVXdpT0ZxN2lsdWY1ZWJCUXJlNkVUTDRkTGtj?=
 =?utf-8?B?T1d4QlpRVDdSdFFwbWhpTUpiRDhNVmY5TzNYMTZOTXE3NlBUOWdrRnViRG9n?=
 =?utf-8?B?SEo3U3MrVnpBNE9xeWhtaW95WUVkckJkSFdFTGpXckw5aU1rMmVoVDhla3NZ?=
 =?utf-8?B?RTI1ZEZOcERQN0Y5RmNWc0Y0TlcwNENyTi9ia2hZaEsvOWFMd3d4QmU0dTBH?=
 =?utf-8?B?TkhTRDFWUXpXb1pPMmRnRnZubkZhenF0TWFWU053ZjVOSFJIUkhZMi9hVUtk?=
 =?utf-8?Q?1mho+m5P3lOki6QzyuVXa76GF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dac2b379-c12e-4e8f-ab0f-08da92a91bf8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 21:20:24.4646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/F34iBMr+IFyWSFbslaIGzMm8MWtYD2ggtyndWvRUs3aGWmn0uAknl+TEAuaEsRynoaGFi4XmJpTtbO/9I68g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6609
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/8/2022 5:16 PM, Daniele Ceraolo Spurio wrote:
> The fw name is different and we need to record the fact that the blob is
> gsc-loaded, so add a new macro to help.
>
> Note: A-step DG2 G10 does not support HuC loading via GSC and would
> require a separate firmware to be loaded the legacy way, but that's
> not a production stepping so we're not going to bother.
>
> v2: rebase on new fw fetch logic
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Tony Ye <tony.ye@intel.com>
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com> #v1
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 23 ++++++++++++++++-------
>   1 file changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 4792960d9c04..09e06ac8bcf1 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -91,7 +91,8 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>   	fw_def(BROXTON,      0, guc_mmp(bxt,  70, 1, 1)) \
>   	fw_def(SKYLAKE,      0, guc_mmp(skl,  70, 1, 1))
>   
> -#define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_raw, huc_mmp) \
> +#define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_raw, huc_mmp, huc_gsc) \
> +	fw_def(DG2,          0, huc_gsc(dg2)) \
>   	fw_def(ALDERLAKE_P,  0, huc_mmp(tgl,  7, 9, 3)) \
>   	fw_def(ALDERLAKE_S,  0, huc_mmp(tgl,  7, 9, 3)) \
>   	fw_def(DG1,          0, huc_mmp(dg1,  7, 9, 3)) \
> @@ -137,6 +138,9 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>   #define MAKE_HUC_FW_PATH_BLANK(prefix_) \
>   	__MAKE_UC_FW_PATH_BLANK(prefix_, "_huc")
>   
> +#define MAKE_HUC_FW_PATH_GSC(prefix_) \
> +	__MAKE_UC_FW_PATH_BLANK(prefix_, "_huc_gsc")
> +
>   #define MAKE_HUC_FW_PATH_MMP(prefix_, major_, minor_, patch_) \
>   	__MAKE_UC_FW_PATH_MMP(prefix_, "_huc_", major_, minor_, patch_)
>   
> @@ -149,7 +153,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>   	MODULE_FIRMWARE(uc_);
>   
>   INTEL_GUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_GUC_FW_PATH_MAJOR, MAKE_GUC_FW_PATH_MMP)
> -INTEL_HUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_HUC_FW_PATH_BLANK, MAKE_HUC_FW_PATH_MMP)
> +INTEL_HUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_HUC_FW_PATH_BLANK, MAKE_HUC_FW_PATH_MMP, MAKE_HUC_FW_PATH_GSC)
>   
>   /*
>    * The next expansion of the table macros (in __uc_fw_auto_select below) provides
> @@ -164,6 +168,7 @@ struct __packed uc_fw_blob {
>   	u8 major;
>   	u8 minor;
>   	u8 patch;
> +	bool loaded_via_gsc;
>   };
>   
>   #define UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
> @@ -172,16 +177,16 @@ struct __packed uc_fw_blob {
>   	.patch = patch_, \
>   	.path = path_,
>   
> -#define UC_FW_BLOB_NEW(major_, minor_, patch_, path_) \
> +#define UC_FW_BLOB_NEW(major_, minor_, patch_, gsc_, path_) \
>   	{ UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
> -	  .legacy = false }
> +	  .legacy = false, .loaded_via_gsc = gsc_ }
>   
>   #define UC_FW_BLOB_OLD(major_, minor_, patch_, path_) \
>   	{ UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
>   	  .legacy = true }
>   
>   #define GUC_FW_BLOB(prefix_, major_, minor_) \
> -	UC_FW_BLOB_NEW(major_, minor_, 0, \
> +	UC_FW_BLOB_NEW(major_, minor_, 0, false, \
>   		       MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_))
>   
>   #define GUC_FW_BLOB_MMP(prefix_, major_, minor_, patch_) \
> @@ -189,12 +194,15 @@ struct __packed uc_fw_blob {
>   		       MAKE_GUC_FW_PATH_MMP(prefix_, major_, minor_, patch_))
>   
>   #define HUC_FW_BLOB(prefix_) \
> -	UC_FW_BLOB_NEW(0, 0, 0, MAKE_HUC_FW_PATH_BLANK(prefix_))
> +	UC_FW_BLOB_NEW(0, 0, 0, false, MAKE_HUC_FW_PATH_BLANK(prefix_))
>   
>   #define HUC_FW_BLOB_MMP(prefix_, major_, minor_, patch_) \
>   	UC_FW_BLOB_OLD(major_, minor_, patch_, \
>   		       MAKE_HUC_FW_PATH_MMP(prefix_, major_, minor_, patch_))
>   
> +#define HUC_FW_BLOB_GSC(prefix_) \
> +	UC_FW_BLOB_NEW(0, 0, 0, true, MAKE_HUC_FW_PATH_GSC(prefix_))
> +
>   struct __packed uc_fw_platform_requirement {
>   	enum intel_platform p;
>   	u8 rev; /* first platform rev using this FW */
> @@ -220,7 +228,7 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   		INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB, GUC_FW_BLOB_MMP)
>   	};
>   	static const struct uc_fw_platform_requirement blobs_huc[] = {
> -		INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, HUC_FW_BLOB_MMP)
> +		INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, HUC_FW_BLOB_MMP, HUC_FW_BLOB_GSC)
>   	};
>   	static const struct fw_blobs_by_type blobs_all[INTEL_UC_FW_NUM_TYPES] = {
>   		[INTEL_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
> @@ -266,6 +274,7 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   		uc_fw->file_wanted.path = blob->path;
>   		uc_fw->file_wanted.major_ver = blob->major;
>   		uc_fw->file_wanted.minor_ver = blob->minor;
> +		uc_fw->loaded_via_gsc = blob->loaded_via_gsc;
>   		break;
>   	}
>   


Acked-by: Tony Ye <tony.ye@intel.com>

Thanks,

Tony

