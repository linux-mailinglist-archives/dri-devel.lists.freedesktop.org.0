Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D6E7CA6C5
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 13:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0CF10E1BC;
	Mon, 16 Oct 2023 11:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE99110E1BC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 11:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697455910; x=1728991910;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qLeCesLYJo12UeiZk2QYcqCo4pFc8zseHYrRfXXjmc4=;
 b=M2wSNd0pU16REfS+lpcPd0O5/rEgUJwGJ8IYefoV8ZtYsWeODvJxRRvV
 ru7hKlRz5H0uwf/0RGdoVQOAH/zzP2RFxAMJwByph/k8iKhLVpEQwMsD0
 VEy+6wHOhLFk1tFEbMqDLTi9sCPwFtMjiVoT+142Wwgqo9zn005jXYGNa
 m+NGhplFJJdjC2pjVEXe0udzkZLszHSdC5LX24MwMrZBWbLV2i7DFpvYZ
 vV1alV0u6LkC5p4G1ezL75JKD8+2b7V4W/odxLGmc3O4k9izDDMsOFL32
 6pvw8n0+kAIWFSFrWzjzF1CZTbZAxTGINbeUufoOPvZIWl6LsUEWgnCJy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="4115022"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="4115022"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 04:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="732271871"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="732271871"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 04:31:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 04:31:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 04:31:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 04:31:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GKMa3WY784stQAm52TLcwvQHIN6gEZeNmQDdOTUWKS4utYYs6qaua6mfpn4YnqZEFOcp/egPoEt+jFDogDEp2U4/VUs5a3VbS2XB+taIrcthYV+E0UoWVVhfn+XbtAWad3IO8wskJcBuR/0e2eOh2Hwx6qxGGl70HVzEb/qWnkQkbr2z4frS3JzhPDI0jAeJrHn2VdzxsDzkwIe3JTjrv3PwaJiuWfanmG6bv+0tnvqlZLVGFCuOr0lTgNY5ycGwg9laiL6FW96tSxrYXILhtel8/PH0LZIP2SVXbkqri4rOOLfaj4Q2KauyKgPWzSnJtJbcn4sGAmY9+a6Qr9CjJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibv8t7RB3t1wRraVanMP0b0SbJhMMyPnRG9y5lM3I/Q=;
 b=gyu0wGaDhoaG8wGMgO3aBZjzAfTp+aY3UcDQ/q1YURqjcwoZkslVphpsy6rIT0OcR/qqKdLmsi5DAlTMPbpx3CIBbvFtoqnSDeifX6Ilq1PRAmtP4i5AXHI1Rgt3sIZ416fcCEbIw5b7eeLoZy3tr82eIA5yusfEW/J6QVQtJepWzHJZo+CnPtHu+kzHxbnz/hLRfErogQC0kN7OBVim/mYwz3JKPL1tMwYR2EMSQPwjzNaQK1GrT6/3+VfcXDWz2QTKM7bDlo4RXAs4jYShREw7vTayl/nlT57LPwM8faWkBf4c1Ob6ygCa9Pl86j1Nh6/iQAtpGur1TiZF2N/jbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by DS7PR11MB7808.namprd11.prod.outlook.com (2603:10b6:8:ee::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.35; Mon, 16 Oct 2023 11:31:46 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::59cb:e244:fe8b:184d]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::59cb:e244:fe8b:184d%5]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 11:31:45 +0000
Message-ID: <6a38a952-8256-fdef-cceb-bed353baf3df@intel.com>
Date: Mon, 16 Oct 2023 13:31:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/ttm: Drain workqueue before sys manager release
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20231013143423.1503088-1-karolina.stolarek@intel.com>
 <1a210998-ec32-4012-a3de-f4f250e4b118@amd.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <1a210998-ec32-4012-a3de-f4f250e4b118@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::18) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|DS7PR11MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: 679a2dae-f668-40bd-cd7a-08dbce3b7a55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gi6lV5LLNeSjLlEfLaUlSQInpVPrqcu8UdWfzraQeBn5eiApPrIZUAgalclaRMKoJP5D9TCNPuruGxWD1QstLCD2fhNlbznoTQGWW922uw/kcQpsXBaVibbfLCDKC+scmRksxba5Hu/QKo2tCAvmD6bYEFuHBPHbnoZOnNOnPN2OTNfECGQsqlvvzoReINS+41zhQJksqvqWMIV14Jhh/yq0pfSgcbzJh14Qvl8QXGe/u1XWsy09FIJemoUR6d+aPa4q6Wa4udoDdFckiulwDM2DneqhtId0jGqIE+cypUDVyp/VWpY8rfVJ60O2u+1vqcWoF4GPnmDrdn6fKMi6SVkTB6i1dE2mgOn/gmbqq8mlQkbz9W/rv6CI0+jxz4i42p6JLc4QAZwNAZm4XWP0LZiAQKibD43SOUVOgq8lS8hM+VnEaQR/haMr/xF6xXKoooUo5kHjQ2QIPHrL51mrmfhHshfng4L47ximlTrEnwkUA2i6WQMLydAl1/8A/S3ce+qsMrH5sU/sd8WZ2v+TOCS6zzV/qWzSCDLfGk8iQIde8r/bzoW7CSXCo2nhBSgyESg0dFga8rOANWLTmWkv4zzpCYCn1c+T8WuGzaCbQ+h1Kdm+58hMVSz3w/BOQf4vjYyxbPfIKFf+04qLcDq2Mw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(376002)(136003)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6486002)(2616005)(478600001)(6916009)(66476007)(66556008)(66946007)(316002)(66574015)(26005)(53546011)(6512007)(36916002)(6506007)(5660300002)(8676002)(8936002)(4326008)(44832011)(2906002)(41300700001)(31696002)(86362001)(6666004)(36756003)(82960400001)(38100700002)(83380400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWpGOEc4eitTWU9QejFjRWFERTJLU21tSTRLZTZYZm5ZYnFNbHR4eWpCeHZ0?=
 =?utf-8?B?QkxqWmFnRGFQZWNDc2tuaHpBMnlVVkNiR0pSNzRxTDEyR2ZhYVRwYi82eHVG?=
 =?utf-8?B?akkrVS95dUNoV1kxWkRaenkxazBxNWVIaHhIMmd0djIvb0lyY3VhY0FTbzBJ?=
 =?utf-8?B?QzFlMWp3aTZUenlXU2NIdllwODBGbUk0dDlGcWhFLytFdkgwTmNNTjU4U3pF?=
 =?utf-8?B?SW1vV3VpaEZyNnBoTlZRbUF1dE9VcXRFVWV1Y3FqQndRWnlVd0ttRlF4SEtH?=
 =?utf-8?B?SHhFQ1lNS2g0L2kxRTBtUElNcWhOUjFLZW41bkg5bFR6SDdoMFJUUnlZbE1p?=
 =?utf-8?B?cHk3eDFjc0VvenRBYmt1TjdLMm1zUkdXSXMvbDhPZUcrdHhxaDBXRVhENFBX?=
 =?utf-8?B?Y0o0YU45S0p5U1p4RnFNaFdnODV1MndiOXhBcnlCY3hoN2ZnM08xL3dRcmk2?=
 =?utf-8?B?dFdkMXBEVkVHNnJZZDVQSnpSODZCakwzbDFGbFkxQ0l3ZnhwaVhJdFhEZlJn?=
 =?utf-8?B?WXMyRFc5bURlRFpjUlpuZ2ZOeXdYdUc4ZWtjYU5URUNKUTA2bXpTbVVYMWli?=
 =?utf-8?B?Wm9qZHl3K29KRklXYnY0M1JvMjlUTytZQStLa3Q5UXlLazZ5WWpONSt4bFJj?=
 =?utf-8?B?cFd5dFFYajhiajhLbDFZY3NLcmIwTGRoZ2MwY2R1RUFmNmhXaGRnTFh1Nmw1?=
 =?utf-8?B?QVFWckxkRHQ4aWVBc0RxWUczcUhUTXBWSFo1ckFmQUc0eEIxRXNVOTVPU1c4?=
 =?utf-8?B?TWhnamw0b0YyMHBLSHpMUUdERWs0RjlvNWVobGRXQXhXcmhWMWRscHdoSXlu?=
 =?utf-8?B?Rm5XU283SG03a1VucTdJTVFTZWJJNzNsSFpIOThnWHlBRUZQa2x6VnNwRmd5?=
 =?utf-8?B?MU1NWXUwL3FXcG04blFpN0xEMUszRUVOL1k1eDFxZVBrS1F3SnprQ1dSUEhj?=
 =?utf-8?B?VGE0Sm5FWHZCWmlYb3ovZVpQNkNtc3I2QlRxTytxc3FoNjF4enhlVk93Z2tJ?=
 =?utf-8?B?M1FQY2l5Sks1bHh1Y0VnUFpjSlJxY0tCUGw1Vkl2VE0vTGJSalhrNDhaNmQy?=
 =?utf-8?B?OStiNmRoQ3dDSktBZVRZWWo1UDFtUDA4NytMWVpHUytEMjNrOFFXNXduV3ky?=
 =?utf-8?B?WHNkLys0VmNCUnBuSTAwTjcrcElycFVUNDlwZ3F3c3R3cXFhQ1cxcVBRL3VF?=
 =?utf-8?B?WkhrWlV6THpFMThnRTdFM1VDaDU5WU8xVWczYVI2Mjk4bTYwclh0Vjh6WFVB?=
 =?utf-8?B?eTMrdEU4cmFoRXc1eHZBTHUwb0dGZURqQkxZd21ORnZSR0lUZ2ZSSFpGTGRr?=
 =?utf-8?B?T3pEeS9jdU9yb21LS1FLKyt6REZ0RDc2MXVteENNWEZOcGQ4dUs5WTFocDZ1?=
 =?utf-8?B?cWxyVG53aTVhQkdGSE9ITzRHTDExOVpNbGxQYS9lbjJYcitQTnpTbzJxN2hq?=
 =?utf-8?B?eTZ2SjhYT2tQcStySGwxVzhCNWNSTTFkL1FSbVpTb3hrRVA2dmdLLzhja2sw?=
 =?utf-8?B?eWxTdHhXWHZGbEVsd00rTmc0QU5ndlI5eGg4d0xWbWJhd0p0R3BIM3FOV3dq?=
 =?utf-8?B?MmZGdUxMMTgveHdFYVh6aStrUkYwRGY1eXhNYlRkei9KdWhEdUR2eHphalkz?=
 =?utf-8?B?Wm1GWEhTTXFzcWtzMW10MlVabm9EaUhEWGZXazNoUTVBTVltc1VCbUI5YUZU?=
 =?utf-8?B?ejBac1piams4Q0N6QlBsdEMwckhaRjh1YVQ1WENzSHBqeWFsZEVoRFBEUEM1?=
 =?utf-8?B?eUJkSmxIQW5scEFKbkR1eDFIbHM5MWlwZlFyVnB4OVMwNlpJejV1V2t1WE1Q?=
 =?utf-8?B?RzExT0xPNE1SeWFybVdQcGg5V0luQ2VmYk9YdWxvb3RmOGVPNEF1elFoenFz?=
 =?utf-8?B?K1pRVjVIUmhrSEx2RGdxeWQ4YlloUzd2V3oxL3BYTmtuQUxFTjRYQng5TW5l?=
 =?utf-8?B?US80S3FxTGRxUllFdzlMWmVvcFlJZlpGUDIzRkZjTUU2aFB6Rklod3ByRUZn?=
 =?utf-8?B?aEIvSkptYXZLbHRSWlhESEF3bE9RbWQ2RS8wV2VvWmpTSzJwT2hjaUlpclhx?=
 =?utf-8?B?Z2xyTnRHaFA2SkxPdWlqUUdEVzE0RVdyM0oxbHE0RGVVbnJhcVo0bzRBclZN?=
 =?utf-8?B?aWQ2MDU1bHdSUEVJRUhKZG4rQWVyQ3o1eHFDN09lS09aajRzYVFzM29KWit2?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 679a2dae-f668-40bd-cd7a-08dbce3b7a55
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 11:31:45.6958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqLa5+Z/uo6M/VzYCM8CoUFF5TBxgzTtyuKQPAqM3ONfJhpj0mUI/LmlwNpHDsmJ1Ot+lEPr8AKr85kaS/i2CZ1DUAseputrtxdFPzvav5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7808
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

On 16.10.2023 13:03, Christian König wrote:
> Am 13.10.23 um 16:34 schrieb Karolina Stolarek:
>> In rare cases, a delayed destruction of a BO with a system resource
>> could stay in the workqueue until drain_workqueue() is called in
>> ttm_device_fini(). An attempt to free a resource from an already
>> released manager results in NULL pointer dereference. Move the step
>> of draining and destroying the workqueue so it happens before the
>> ttm_sys_manager cleanup.
> 
> Good catch! But it's not only the drainage of the workqueue which is 
> at the wrong place here.
> 
> Removing the device from the device list should come before 
> destroying the system domain as well.

I wonder when this would cause problems. But of course, it makes sense
to fix both with one patch.

> So I think you should probably rather move the chunk:
> 
> man = ttm_manager_type(bdev, TTM_PL_SYSTEM); 
> ttm_resource_manager_set_used(man, false); 
> ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, NULL);
> 
> after the destroy_workqueue() instead of the other way around.>
> Apart from that looks good to me.

Thanks for taking a look and the suggestion, I'll send a v2 once I
finish testing the change. Also, I'll drop the Fixes tag, as it seems
the order issue has been there since the very beginning.

All the best,
Karolina

> 
> Thanks, Christian.
> 
>> 
>> Fixes: 9bff18d13473 ("drm/ttm: use per BO cleanup workers") 
>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com> ---
>>  Some background: I stumbled upon this issue when testing 
>> ttm_bo_pipeline_gutting() with BO with an active dma_resv fence.
>> In ~2% of the runs, the delayed destruction of the ghost wouldn't 
>> happen until the drain_queue() step. man->func->free(man, *res)
>> got called via ttm_bo_cleanup_memtype_use(), the manager and its 
>> functions were nowhere to be seen, resulting in a nulptr deref.
>> 
>> drivers/gpu/drm/ttm/ttm_device.c | 6 +++--- 1 file changed, 3 
>> insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c 
>> b/drivers/gpu/drm/ttm/ttm_device.c index
>> 7726a72befc5..753126581620 100644 ---
>> a/drivers/gpu/drm/ttm/ttm_device.c +++ 
>> b/drivers/gpu/drm/ttm/ttm_device.c @@ -232,6 +232,9 @@ void 
>> ttm_device_fini(struct ttm_device *bdev) struct 
>> ttm_resource_manager *man; unsigned i; + drain_workqueue(bdev->wq);
>> +    destroy_workqueue(bdev->wq); + man = ttm_manager_type(bdev,
>> TTM_PL_SYSTEM); ttm_resource_manager_set_used(man, false); 
>> ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, NULL); @@ -240,9
>> +243,6 @@ void ttm_device_fini(struct ttm_device *bdev) 
>> list_del(&bdev->device_list); mutex_unlock(&ttm_global_mutex); - 
>> drain_workqueue(bdev->wq); -    destroy_workqueue(bdev->wq); - 
>> spin_lock(&bdev->lru_lock); for (i = 0; i < TTM_MAX_BO_PRIORITY; 
>> ++i) if (list_empty(&man->lru[0]))
> 
