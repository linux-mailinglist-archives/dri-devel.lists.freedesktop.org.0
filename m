Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C986344BD
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 20:39:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61AC10E457;
	Tue, 22 Nov 2022 19:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F7C10E12C;
 Tue, 22 Nov 2022 19:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669145980; x=1700681980;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FcyITQJI3WoF2ob4biTxdizU2yhjhhIz6vkV5Vh15hQ=;
 b=JOgRtIAvBNdDZB9lg88yqbWr5uU+rlip+Qiy+HZ5qnLitDyQqBMXrjyt
 VGWesC8DsBUyPNtGurDfOloZpJEXsy7EWprsQQiADJ5IU+b9Ei+cCml47
 igB71sZR35QsDUnzsqcL+EXRFNFDNKic6Jj+YWm4hj7Br1/4uMkjxWgwJ
 FYA/Dzmp1VfzUs/E3YXVS9AicOryc+5oeomXfChBPN6SnQQgkhgkfzDfY
 knpebdIm47oMDk1BcIBgCfDXB5wB7/W8CWR4jzEC3UNYOw98s2nNOR7xY
 ++Ol7qN7j0WImn92akcAD8XrHlB1MRkQ9pRem2+Za0x72yCzVf1TwXFsV Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="313932609"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="313932609"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 11:39:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="592257833"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="592257833"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 22 Nov 2022 11:39:39 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 11:39:39 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 22 Nov 2022 11:39:39 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 22 Nov 2022 11:39:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=loPcs8FMsw7gNnsPsjoQjCqx436mkeUCMN8yCCgYc9mlw4dLKmteXXoq/Q9aVgUEqwaVcTfScV5+oo8oXYre+8vyncnAxDM9FkD1YTcFcy8+7oRdnTUTXHKjw9W8gsjfJ8k7Bh+xLtVz+2ZNpfk5A8z2ASAUP5kpmpdojGvj28b3DasasIyjAOFcoBpUJSMVN4imJvx0eGzVOZTr3yvA4SKINgQNB3DFtkXCNbkiY+Ccb9XH7XuoZ+v4yWTgCThe16bzgaXPxtiSe7O9fWjnqQx6N2nLEsdjmrykiSk4xHBCeupwIod0hEDgictINFibgAfCFewiiGPOzpTeQzeevg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6zxPV1r3IF3QNVDEAmAxzSwfrpXBN0/SS1ltoPsBes=;
 b=QG+IBYm3X8Et1M+ckCdjrdsHZLZndaFuZRca5DpR9d9bVn5VciXx9OxaKgflId4IaQinUJTOGWlb1TN8xlSWFw1m59Awu0fQ7+LkdptsoP4S1MCc192lFE9FVQmbQb+A4bcNMxqwGXQNLZa5j+wwQbrJoW2Rl99WA+m5rA/VgtJSP8TRiCrickKgB0NpJQDIPqYAfX8Q78v/jX9vzqifeL4Fq4zU4QDR5wlbKCgfy2OCTJKqMV13c2Y3+GDWvvAZdyLjmasTr/cpipQIGt6LeT9k0+lgb3Jfl4UMKErH8njf3Ffps4tgCzEh+y1jAA/361ORorSDuv7+YzHji+Ot6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 19:39:35 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd%5]) with mapi id 15.20.5834.009; Tue, 22 Nov 2022
 19:39:35 +0000
Message-ID: <7f38f8c7-bd67-8d4e-fdea-5b3d71b1a561@intel.com>
Date: Tue, 22 Nov 2022 11:39:31 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [Intel-gfx] [PATCH 3/6] drm/i915/gsc: GSC firmware loading
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20221121231617.1110329-1-daniele.ceraolospurio@intel.com>
 <20221121231617.1110329-4-daniele.ceraolospurio@intel.com>
 <Y30chrH244Go7FO2@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <Y30chrH244Go7FO2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0098.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::13) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SJ1PR11MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: 668c3d73-059f-4ee9-7dfc-08daccc1485e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cvCTpvrh2W8kh59nBOwz79aBUSs0fuEx51s8r9P/C8Sqj/dQLv4nasu28HzGX2UQwtVIIemjPbCsvlpm7Afy6lI8Otf4s7rDCsQpsnfVpDica1DLaRiXLGaGwoCygOP/nWbsIhxSxnWDl17kOXlf09IfgEEzkCFVgqCGOMRCaUDF58jDel1ZGhyhp/KJXAVEADW9PoZvZKPvCRLyfbOYbnEAMXaP6QFPgWVSMnlP1HIJYFxrnlJ2Ru00uI4YS/XJ5xPULhvJY8LGVhp3QXrpga6vEoAz3qLasOVE4W99ufhvyo6tcAd8Tu7d1Gdv/aVF3frL7zFEYVnv/3qz26hfJA1LF+YvV6nk6iQN3PUgSbIYDV/k0vKIDKu3CPUiHE3SBmT+oaJqXoSkj1f5HJTkpu4RfGmRQMHvQQiEJMUpoUBkrrsnurmCGmJrScU3U5b7dY3Gez+DZGEXOjbvk4AWSdOtHVjIDF8mnYXp+wWyBKoDx3mXr5LvXS3daRYEYYiqL5UE/h6hJQSk6cwPeMrRCM8pPLIeUa/D5Xtgj/fAHSpjS2OX0X0YzCX6iyALDoLlGYlwfk4sXxeTYRPSgUdQE7cZjLxSnhP1YAPM6JZmzKHwA+V0J4Bb6FBuA3FRrhK+x+u8tO+rbkPuWMahEh6ZjBMppCrAH3IZsN2VsNaHK5+Ztc8o1UIbsKNQn6H81660Fu2MIyN3c5/JdPBMrUOvN/vlfm5doC4pqnm/c4GHb1I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199015)(6862004)(5660300002)(36756003)(8676002)(6506007)(450100002)(41300700001)(4326008)(66476007)(26005)(53546011)(30864003)(66946007)(6512007)(6666004)(31696002)(86362001)(186003)(83380400001)(2616005)(37006003)(38100700002)(6636002)(66556008)(8936002)(478600001)(6486002)(316002)(82960400001)(2906002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzRKcEE5V2cxdDFGZEh1SzBsSytTakxtMlhNeG9NUjBkMlZMVE02SG1xaW9h?=
 =?utf-8?B?bjdZUXlwNHpOVG9vKzJKaElTZlNER01QTzNiekNtbkRRRWhIcnpXZFdPNVdR?=
 =?utf-8?B?Si9DZFB1Ti8wb1VUSEUyQlRaNnVObFF4OS9oTVBwNVpxWWQ5cmNOZy9XeTFk?=
 =?utf-8?B?bTdKUTVnbGdiVm1JQTkrOTJzVkwyU2xTdTJkM21OYTNQV2NvSTdYWldYeDVs?=
 =?utf-8?B?T0pNVldHL3B2R3BEUlJiRDVOZDR5MjgvZmQ4Z2lBai9scGZpVmNITWR3K1Zm?=
 =?utf-8?B?TGk3UlYwaTB0QVcvQkxTUE1BZFI2UWhEOHRmR00xalhmY0pzc1IyWGJGaFRX?=
 =?utf-8?B?Q3hUY2FzODhpdWg3S28reHBnclNXemNJd1R2N1NqeUVNVHY5bGlBd282Tk13?=
 =?utf-8?B?eHZSRlpYOWZyT1dzUjlmbnFYTU1EVEJzU3NlZG1VZDJqTURBVFU5VmZ3djkx?=
 =?utf-8?B?VzMrN3pIS3pGTlFWU2NnWW1HbkdneERGYW5mZTE1M3V0MHhwSU13YnJyV3VV?=
 =?utf-8?B?U2NDNkJaeDMweGJPc1Voa0FnMjQweldETE15QTIrdG1aVzlISiswb1ZxNzhK?=
 =?utf-8?B?dmJxa3pJempGSkpleEpQc1czVS9kOFdGTTg1K1NRTGpTWXNoSEFSUlNablJL?=
 =?utf-8?B?aE5EVUZPblM3ZENsK0xEVUNkUmdvZTNjY09KdndnQ0xTRWw2QXhmZFRLMS93?=
 =?utf-8?B?bzVqTURVcU5FTC9ldnduMTVUQlRMdldHNWxKQUozL1llTHZQZ1ZpdGtCVEEv?=
 =?utf-8?B?Sm5vNmRKakhaVkNuUXIra1pBNmlHY0dodXBpSTMvSFRTUlRDVFoyQzFkRXND?=
 =?utf-8?B?dmwxMk9PVnRkNCtOTmVXTWpWc1czTDMveGQyRzFzM0UxcUl3MzVpYlozUWYr?=
 =?utf-8?B?NEp0QXFna3daN3hON0FOU1BtU2NFcmxQWS9NUWkzbG01a21uYmpnZ0ZncGQ0?=
 =?utf-8?B?b2U1aWYvWlBqb2paZTRBZTZpdWt6YkNCVVVhNmRwWTBNbElSSDY0VmtNa2Fy?=
 =?utf-8?B?Z3hrSFYzOHNwRjVheEtyU3laN1M1c2RzRWgxNG1MZDNzSmJsL1VxaGtEanhq?=
 =?utf-8?B?RUVqdDJPVU12WGRKcUZNVWdYU0Z6VVhpVkwvQ3Vhbjk3ampVOGRxRXRwcXVl?=
 =?utf-8?B?QUdNRGZXOXZBYTc4QnlCNEpteGlSUkVRdDZnZ0xyNTA5N1VXWUVpWnNIMys5?=
 =?utf-8?B?Mm40Y1FoNGhObitHNG1FcVVhVEJxbjZieWZ1THpQTjhtL0tzcWtwVUhEcVdL?=
 =?utf-8?B?TVgyYTlTSU5OZVdxdlBjTU1heldFM2NyZDBSbzYreWN5RGdmRXZPREZpQVlI?=
 =?utf-8?B?OU1BUXhPUDB6QmdJVUVkUUhvNHdjSldtN1lIdy9sQ1dTK2E0bU5RTFhlNVlC?=
 =?utf-8?B?VTJKVTVOTFlmSks2RFdPZEFtY3ptL1RUaU5GYVdMcXdTRUo5TTdZRUd3RTE4?=
 =?utf-8?B?UTFJVDA3VnB6Y1hpTm1uM0hQb1VxNjczaHhVTG02eEhqZVova2JzakI2Tjg0?=
 =?utf-8?B?NHNQZmZUNWVESFFUbEJQNEdSRW9KN0JnNC92WXpNRVBVZDNwSzJqSXhVWnE4?=
 =?utf-8?B?eDdPSDhpaHMvZkxuekJuRWJBMGdCYW4wdllNd3Zud2M4emJGcnBXRDdxc3B1?=
 =?utf-8?B?bTBrbjdDZnFkRHNZSU1ZdmpuK1dmZFNDU01qN25ONUpQTHoyWHZteHdpTU45?=
 =?utf-8?B?bTVpOVROMXFaOFNMYXF0cElYUlVzOGJKUzl3a3VMMGFIZTIxVGtDU2tzYzc1?=
 =?utf-8?B?TXRyZkRVMUh5bVRYZ2RyRFVvUlVXQlJXekZnNkJvbUFydUYxaVVYNGNGdTdl?=
 =?utf-8?B?SlZIOGUweWtHQWpKczF4aXBqV3ZaaVB1eDRIS3RuWnY0QkF5S1JhT01qYzF4?=
 =?utf-8?B?ZmJENWwzQlZoUVpGNTRFNnRyMXJ3QzEyNXNUN3kzVUF5SlhWNUs5TmE3RXhy?=
 =?utf-8?B?aFB5eGhUbFdGOEdRYmFZbk1kZ0F5QjVIckl4NG9sVkNhWHJ1WVVabUU0Tm1u?=
 =?utf-8?B?c3FpcW54UHlDQnFOeWVNYU1hdXhEOXFiYU9IeWtkSmFUamJlekxrQ0U3SFk4?=
 =?utf-8?B?TVQzdFlvcFBMRWxENjRYazhJUlo4R2FVc2lOYlVvSXZlUTJwQ0N1SlV6R01Z?=
 =?utf-8?B?NFlaVWNUUkVUSnhsTDNlYzhIOHlKcEVOZHBya1cydTJDc1BZbTlERURIOU5i?=
 =?utf-8?Q?5XIwsseoqjuoVia2ZJ5Ql9I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 668c3d73-059f-4ee9-7dfc-08daccc1485e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 19:39:35.7045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lL/NddcYi6zB1zN9NZoLeQkPGQTnwJWgjZKWzEAv96eqr1RvVly/7QeosrCKE29k0TZkWEOxHySvY5Cn5LDhXwrLj16eax9tA7tBloz+lko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6129
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/22/2022 11:01 AM, Rodrigo Vivi wrote:
> On Mon, Nov 21, 2022 at 03:16:14PM -0800, Daniele Ceraolo Spurio wrote:
>> GSC FW is loaded by submitting a dedicated command via the GSC engine.
>> The memory area used for loading the FW is then re-purposed as local
>> memory for the GSC itself, so we use a separate allocation instead of
>> using the one where we keep the firmware stored for reload.
>>
>> The GSC is not reset as part of GT reset, so we only need to load it on
>> first boot and S3/S4 exit.
>>
>> Note that the GSC load takes a lot of time (up to a few hundred ms).
>> This patch loads it serially as part of driver init/resume, but, given
>> that GSC is only required for PM and content-protection features
>> (media C6, PXP, HDCP), we could move the load to a worker thread to unblock
>> non-CP userspace submissions earlier. This will be done as a follow up
>> step, because there are extra init steps required to actually make use of
>> the GSC (including a mei component) and it will be cleaner (and easier to
>> review) if we implement the async load once all the pieces we need for GSC
>> to work are in place. A TODO has been added to the code to mark this
>> intention.
>>
>> Bspec: 63347, 65346
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/Makefile                |   1 +
>>   drivers/gpu/drm/i915/gem/i915_gem_pm.c       |  14 +-
>>   drivers/gpu/drm/i915/gt/intel_engine.h       |   2 +
>>   drivers/gpu/drm/i915/gt/intel_gpu_commands.h |   7 +
>>   drivers/gpu/drm/i915/gt/intel_gt.c           |  11 ++
>>   drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c    | 186 +++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h    |  13 ++
>>   drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c    |  35 +++-
>>   drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h    |   7 +
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c        |  15 ++
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.h        |   2 +
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c     |  20 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h     |   1 +
>>   13 files changed, 307 insertions(+), 7 deletions(-)
>>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
>>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
>>
>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>> index 92d37cf71e16..1d45a6f451fa 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -206,6 +206,7 @@ i915-y += gt/uc/intel_uc.o \
>>   	  gt/uc/intel_huc.o \
>>   	  gt/uc/intel_huc_debugfs.o \
>>   	  gt/uc/intel_huc_fw.o \
>> +	  gt/uc/intel_gsc_fw.o \
>>   	  gt/uc/intel_gsc_uc.o
>>   
>>   # graphics system controller (GSC) support
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
>> index 0d812f4d787d..f77eb4009aba 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
>> @@ -232,10 +232,22 @@ void i915_gem_resume(struct drm_i915_private *i915)
>>   	 * guarantee that the context image is complete. So let's just reset
>>   	 * it and start again.
>>   	 */
>> -	for_each_gt(gt, i915, i)
>> +	for_each_gt(gt, i915, i) {
>>   		if (intel_gt_resume(gt))
>>   			goto err_wedged;
>>   
>> +		/*
>> +		 * TODO: this is a long operation (up to ~200ms) and we don't
>> +		 * need to complete it before driver load/resume is done, so it
>> +		 * should be handled in a separate thread to unlock userspace
>> +		 * submission. However, there are a couple of other pieces that
>> +		 * are required for full GSC support that will complicate things
>> +		 * a bit, and it is easier to move everything to a worker at the
>> +		 * same time, so keep it here for now.
>> +		 */
>> +		intel_uc_init_hw_late(&gt->uc);
>> +	}
>> +
>>   	ret = lmem_restore(i915, I915_TTM_BACKUP_ALLOW_GPU);
>>   	GEM_WARN_ON(ret);
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
>> index cbc8b857d5f7..0e24af5efee9 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
>> @@ -172,6 +172,8 @@ intel_write_status_page(struct intel_engine_cs *engine, int reg, u32 value)
>>   #define I915_GEM_HWS_MIGRATE		(0x42 * sizeof(u32))
>>   #define I915_GEM_HWS_PXP		0x60
>>   #define I915_GEM_HWS_PXP_ADDR		(I915_GEM_HWS_PXP * sizeof(u32))
>> +#define I915_GEM_HWS_GSC		0x62
>> +#define I915_GEM_HWS_GSC_ADDR		(I915_GEM_HWS_GSC * sizeof(u32))
>>   #define I915_GEM_HWS_SCRATCH		0x80
>>   
>>   #define I915_HWS_CSB_BUF0_INDEX		0x10
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
>> index f50ea92910d9..49ebda141266 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
>> @@ -21,6 +21,7 @@
>>   #define INSTR_CLIENT_SHIFT      29
>>   #define   INSTR_MI_CLIENT       0x0
>>   #define   INSTR_BC_CLIENT       0x2
>> +#define   INSTR_GSC_CLIENT      0x2 /* MTL+ */
>>   #define   INSTR_RC_CLIENT       0x3
>>   #define INSTR_SUBCLIENT_SHIFT   27
>>   #define INSTR_SUBCLIENT_MASK    0x18000000
>> @@ -432,6 +433,12 @@
>>   #define COLOR_BLT     ((0x2<<29)|(0x40<<22))
>>   #define SRC_COPY_BLT  ((0x2<<29)|(0x43<<22))
>>   
>> +#define GSC_INSTR(opcode, data, flags) \
>> +	(__INSTR(INSTR_GSC_CLIENT) | (opcode) << 22 | (data) << 9 | (flags))
>> +
>> +#define GSC_FW_LOAD GSC_INSTR(1, 0, 2)
>> +#define   HECI1_FW_LIMIT_VALID (1<<31)
>> +
>>   /*
>>    * Used to convert any address to canonical form.
>>    * Starting from gen8, some commands (e.g. STATE_BASE_ADDRESS,
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>> index b5ad9caa5537..a12e74a1fe5d 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>> @@ -750,6 +750,17 @@ int intel_gt_init(struct intel_gt *gt)
>>   
>>   	intel_pxp_init(&gt->pxp);
>>   
>> +	/*
>> +	 * TODO: this is a long operation (up to ~200ms) and we don't need
>> +	 * to complete it before driver load/resume is done, so it should
>> +	 * be handled in a separate thread to unlock userspace submission.
> shouldn't we already add an workqueue for this?

My main reason to not add it immediately was to avoid code trashing, 
considering that GSC is still off by default and the workqueue 
management would have to be reworked when the SW proxy comes along, 
which will have to happen before we enable GSC. SW proxy requires a 
workqueue to handle messages between GSC and CSME (the flow is triggered 
by an interrupt, but it takes too long to process within the interrupt 
handler) and my plan was to therefore have a single combined WQ to 
handle all GSC-related operations, with HuC authentication also being 
added later on. SW proxy also adds a new mei component (similar to the 
PXP one) which is required for full GSC functionality, so I was also 
planning to move all the GSC init to the component bind function.

If you still think it is better to add a WQ immediately and replace it 
later with the full solution, I'll do that.

Daniele

>
>> +	 * However, there are a couple of other pieces that are required
>> +	 * for full GSC support that will complicate things a bit, and it
>> +	 * is easier to move everything to a worker at the same time, so
>> +	 * keep it here for now.
>> +	 */
>> +	intel_uc_init_hw_late(&gt->uc);
>> +
>>   	goto out_fw;
>>   err_gt:
>>   	__intel_gt_disable(gt);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
>> new file mode 100644
>> index 000000000000..510fb47193ec
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
>> @@ -0,0 +1,186 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2022 Intel Corporation
>> + */
>> +
>> +#include "gt/intel_engine_pm.h"
>> +#include "gt/intel_gpu_commands.h"
>> +#include "gt/intel_gt.h"
>> +#include "gt/intel_ring.h"
>> +#include "intel_gsc_fw.h"
>> +
>> +#define GSC_FW_STATUS_REG			_MMIO(0x116C40)
>> +#define GSC_FW_CURRENT_STATE			GENMASK(3, 0)
>> +#define   GSC_FW_CURRENT_STATE_RESET		0
>> +#define GSC_FW_INIT_COMPLETE_BIT		BIT(9)
> let's prefer the REG_GENMASK AND REG_BIT as documented in i915_reg.h

ok

>
>> +
>> +static bool gsc_is_in_reset(struct intel_uncore *uncore)
>> +{
>> +	u32 fw_status = intel_uncore_read(uncore, GSC_FW_STATUS_REG);
>> +
>> +	return REG_FIELD_GET(GSC_FW_CURRENT_STATE, fw_status) ==
>> +	       GSC_FW_CURRENT_STATE_RESET;
>> +}
>> +
>> +static bool gsc_init_done(struct intel_uncore *uncore)
>> +{
>> +	u32 fw_status = intel_uncore_read(uncore, GSC_FW_STATUS_REG);
>> +
>> +	return fw_status & GSC_FW_INIT_COMPLETE_BIT;
>> +}
>> +
>> +static int emit_gsc_fw_load(struct i915_request *rq, struct intel_gsc_uc *gsc)
>> +{
>> +	u32 offset = i915_ggtt_offset(gsc->local);
>> +	u32 *cs;
>> +
>> +	cs = intel_ring_begin(rq, 4);
>> +	if (IS_ERR(cs))
>> +		return PTR_ERR(cs);
>> +
>> +	*cs++ = GSC_FW_LOAD;
>> +	*cs++ = lower_32_bits(offset);
>> +	*cs++ = upper_32_bits(offset);
>> +	*cs++ = (gsc->local->size / SZ_4K) | HECI1_FW_LIMIT_VALID;
>> +
>> +	intel_ring_advance(rq, cs);
>> +
>> +	return 0;
>> +}
>> +
>> +static int gsc_fw_load(struct intel_gsc_uc *gsc)
>> +{
>> +	struct intel_context *ce = gsc->ce;
>> +	struct i915_request *rq;
>> +	int err;
>> +
>> +	if (!ce)
>> +		return -ENODEV;
>> +
>> +	rq = i915_request_create(ce);
>> +	if (IS_ERR(rq))
>> +		return PTR_ERR(rq);
>> +
>> +	if (ce->engine->emit_init_breadcrumb) {
>> +		err = ce->engine->emit_init_breadcrumb(rq);
>> +		if (err)
>> +			goto out_rq;
>> +	}
>> +
>> +	err = emit_gsc_fw_load(rq, gsc);
>> +	if (err)
>> +		goto out_rq;
>> +
>> +	err = ce->engine->emit_flush(rq, 0);
>> +
>> +out_rq:
>> +	i915_request_get(rq);
>> +
>> +	if (unlikely(err))
>> +		i915_request_set_error_once(rq, err);
>> +
>> +	i915_request_add(rq);
>> +
>> +	if (!err && i915_request_wait(rq, 0, msecs_to_jiffies(500)) < 0)
>> +		err = -ETIME;
>> +
>> +	i915_request_put(rq);
>> +
>> +	if (err)
>> +		drm_err(&gsc_uc_to_gt(gsc)->i915->drm,
>> +			"Request submission for GSC load failed (%d)\n",
>> +			err);
>> +
>> +	return err;
>> +}
>> +
>> +static int gsc_fw_load_prepare(struct intel_gsc_uc *gsc)
>> +{
>> +	struct intel_gt *gt = gsc_uc_to_gt(gsc);
>> +	struct drm_i915_private *i915 = gt->i915;
>> +	struct drm_i915_gem_object *obj;
>> +	void *src, *dst;
>> +
>> +	if (!gsc->local)
>> +		return -ENODEV;
>> +
>> +	obj = gsc->local->obj;
>> +
>> +	if (obj->base.size < gsc->fw.size)
>> +		return -ENOSPC;
>> +
>> +	dst = i915_gem_object_pin_map_unlocked(obj,
>> +					       i915_coherent_map_type(i915, obj, true));
>> +	if (IS_ERR(dst))
>> +		return PTR_ERR(dst);
>> +
>> +	src = i915_gem_object_pin_map_unlocked(gsc->fw.obj,
>> +					       i915_coherent_map_type(i915, gsc->fw.obj, true));
>> +	if (IS_ERR(src)) {
>> +		i915_gem_object_unpin_map(obj);
>> +		return PTR_ERR(src);
>> +	}
>> +
>> +	memset(dst, 0, obj->base.size);
>> +	memcpy(dst, src, gsc->fw.size);
>> +
>> +	i915_gem_object_unpin_map(gsc->fw.obj);
>> +	i915_gem_object_unpin_map(obj);
>> +
>> +	return 0;
>> +}
>> +
>> +static int gsc_fw_wait(struct intel_gt *gt)
>> +{
>> +	return intel_wait_for_register(gt->uncore,
>> +				       GSC_FW_STATUS_REG,
>> +				       GSC_FW_INIT_COMPLETE_BIT,
>> +				       GSC_FW_INIT_COMPLETE_BIT,
>> +				       500);
>> +}
>> +
>> +int intel_gsc_fw_upload(struct intel_gsc_uc *gsc)
>> +{
>> +	struct intel_gt *gt = gsc_uc_to_gt(gsc);
>> +	struct intel_uc_fw *gsc_fw = &gsc->fw;
>> +	int err;
>> +
>> +	/* check current fw status */
>> +	if (gsc_init_done(gt->uncore)) {
>> +		if (GEM_WARN_ON(!intel_uc_fw_is_loaded(gsc_fw)))
>> +			intel_uc_fw_change_status(gsc_fw, INTEL_UC_FIRMWARE_TRANSFERRED);
>> +		return 0;
>> +	}
>> +
>> +	if (!intel_uc_fw_is_loadable(gsc_fw))
>> +		return -ENOEXEC;
>> +
>> +	/* FW blob is ok, so clean the status */
>> +	intel_uc_fw_sanitize(&gsc->fw);
>> +
>> +	if (!gsc_is_in_reset(gt->uncore))
>> +		return -EIO;
>> +
>> +	err = gsc_fw_load_prepare(gsc);
>> +	if (err)
>> +		goto fail;
>> +
>> +	err = gsc_fw_load(gsc);
>> +	if (err)
>> +		goto fail;
>> +
>> +	err = gsc_fw_wait(gt);
>> +	if (err)
>> +		goto fail;
>> +
>> +	/* FW is not fully operational until we enable SW proxy */
>> +	intel_uc_fw_change_status(gsc_fw, INTEL_UC_FIRMWARE_TRANSFERRED);
>> +
>> +	drm_info(&gt->i915->drm, "Loaded GSC firmware %s\n",
>> +		 gsc_fw->file_selected.path);
>> +
>> +	return 0;
>> +
>> +fail:
>> +	return intel_uc_fw_mark_load_failed(gsc_fw, err);
>> +}
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
>> new file mode 100644
>> index 000000000000..d714e5e69a6d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2022 Intel Corporation
>> + */
>> +
>> +#ifndef _INTEL_GSC_FW_H_
>> +#define _INTEL_GSC_FW_H_
>> +
>> +struct intel_gsc_uc;
>> +
>> +int intel_gsc_fw_upload(struct intel_gsc_uc *gsc);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
>> index 65cbf1ce9fa1..dd985a0f0613 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
>> @@ -45,17 +45,46 @@ void intel_gsc_uc_init_early(struct intel_gsc_uc *gsc)
>>   
>>   int intel_gsc_uc_init(struct intel_gsc_uc *gsc)
>>   {
>> -	struct drm_i915_private *i915 = gsc_uc_to_gt(gsc)->i915;
>> +	static struct lock_class_key gsc_lock;
>> +	struct intel_gt *gt = gsc_uc_to_gt(gsc);
>> +	struct drm_i915_private *i915 = gt->i915;
>> +	struct intel_engine_cs *engine = gt->engine[GSC0];
>> +	struct intel_context *ce;
>> +	struct i915_vma *vma;
>>   	int err;
>>   
>>   	err = intel_uc_fw_init(&gsc->fw);
>>   	if (err)
>>   		goto out;
>>   
>> +	vma = intel_guc_allocate_vma(&gt->uc.guc, SZ_8M);
>> +	if (IS_ERR(vma)) {
>> +		err = PTR_ERR(vma);
>> +		goto out_fw;
>> +	}
>> +
>> +	gsc->local = vma;
>> +
>> +	ce = intel_engine_create_pinned_context(engine, engine->gt->vm, SZ_4K,
>> +						I915_GEM_HWS_GSC_ADDR,
>> +						&gsc_lock, "gsc_context");
>> +	if (IS_ERR(ce)) {
>> +		drm_err(&gt->i915->drm,
>> +			"failed to create GSC CS ctx for FW communication\n");
>> +		err =  PTR_ERR(ce);
>> +		goto out_vma;
>> +	}
>> +
>> +	gsc->ce = ce;
>> +
>>   	intel_uc_fw_change_status(&gsc->fw, INTEL_UC_FIRMWARE_LOADABLE);
>>   
>>   	return 0;
>>   
>> +out_vma:
>> +	i915_vma_unpin_and_release(&gsc->local, 0);
>> +out_fw:
>> +	intel_uc_fw_fini(&gsc->fw);
>>   out:
>>   	i915_probe_error(i915, "failed with %d\n", err);
>>   	return err;
>> @@ -66,5 +95,9 @@ void intel_gsc_uc_fini(struct intel_gsc_uc *gsc)
>>   	if (!intel_uc_fw_is_loadable(&gsc->fw))
>>   		return;
>>   
>> +	if (gsc->ce)
>> +		intel_engine_destroy_pinned_context(fetch_and_zero(&gsc->ce));
>> +
>> +	i915_vma_unpin_and_release(&gsc->local, 0);
>>   	intel_uc_fw_fini(&gsc->fw);
>>   }
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
>> index ea2b1c0713b8..6fdb54243372 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
>> @@ -8,9 +8,16 @@
>>   
>>   #include "intel_uc_fw.h"
>>   
>> +struct i915_vma;
>> +struct intel_context;
>> +
>>   struct intel_gsc_uc {
>>   	/* Generic uC firmware management */
>>   	struct intel_uc_fw fw;
>> +
>> +	/* GSC-specific additions */
>> +	struct i915_vma *local; /* private memory for GSC usage */
>> +	struct intel_context *ce; /* for submission to GSC FW via GSC engine */
>>   };
>>   
>>   void intel_gsc_uc_init_early(struct intel_gsc_uc *gsc);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> index 622935770aa1..b2c2512a3391 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> @@ -7,6 +7,7 @@
>>   
>>   #include "gt/intel_gt.h"
>>   #include "gt/intel_reset.h"
>> +#include "intel_gsc_fw.h"
>>   #include "intel_gsc_uc.h"
>>   #include "intel_guc.h"
>>   #include "intel_guc_ads.h"
>> @@ -593,6 +594,19 @@ static void __uc_fini_hw(struct intel_uc *uc)
>>   	__uc_sanitize(uc);
>>   }
>>   
>> +/*
>> + * Firmwares loaded via the GSC engine require the submission back-end to have
>> + * been initialized, so can only be loaded late in the probe/resume process.
>> + * TODO move to worker
>> + */
>> +static int __uc_init_hw_late(struct intel_uc *uc)
>> +{
>> +	if (!intel_uc_uses_gsc_uc(uc))
>> +		return 0;
>> +
>> +	return intel_gsc_fw_upload(&uc->gsc);
>> +}
>> +
>>   /**
>>    * intel_uc_reset_prepare - Prepare for reset
>>    * @uc: the intel_uc structure
>> @@ -751,5 +765,6 @@ static const struct intel_uc_ops uc_ops_on = {
>>   	.fini = __uc_fini,
>>   
>>   	.init_hw = __uc_init_hw,
>> +	.init_hw_late = __uc_init_hw_late,
>>   	.fini_hw = __uc_fini_hw,
>>   };
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> index 5d0f1bcc381e..39993ba6c24e 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> @@ -23,6 +23,7 @@ struct intel_uc_ops {
>>   	int (*init)(struct intel_uc *uc);
>>   	void (*fini)(struct intel_uc *uc);
>>   	int (*init_hw)(struct intel_uc *uc);
>> +	int (*init_hw_late)(struct intel_uc *uc);
>>   	void (*fini_hw)(struct intel_uc *uc);
>>   };
>>   
>> @@ -112,6 +113,7 @@ intel_uc_ops_function(cleanup_firmwares, fini_fw, void, );
>>   intel_uc_ops_function(init, init, int, 0);
>>   intel_uc_ops_function(fini, fini, void, );
>>   intel_uc_ops_function(init_hw, init_hw, int, 0);
>> +intel_uc_ops_function(init_hw_late, init_hw_late, int, 0);
>>   intel_uc_ops_function(fini_hw, fini_hw, void, );
>>   #undef intel_uc_ops_function
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index 3df52fd59edc..dcec115209de 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -836,6 +836,20 @@ static int uc_fw_xfer(struct intel_uc_fw *uc_fw, u32 dst_offset, u32 dma_flags)
>>   	return ret;
>>   }
>>   
>> +int intel_uc_fw_mark_load_failed(struct intel_uc_fw *uc_fw, int err)
>> +{
>> +	struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
>> +
>> +	GEM_BUG_ON(!intel_uc_fw_is_loadable(uc_fw));
>> +
>> +	i915_probe_error(gt->i915, "Failed to load %s firmware %s (%d)\n",
>> +			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
>> +			 err);
>> +	intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
>> +
>> +	return err;
>> +}
>> +
>>   /**
>>    * intel_uc_fw_upload - load uC firmware using custom loader
>>    * @uc_fw: uC firmware
>> @@ -872,11 +886,7 @@ int intel_uc_fw_upload(struct intel_uc_fw *uc_fw, u32 dst_offset, u32 dma_flags)
>>   	return 0;
>>   
>>   fail:
>> -	i915_probe_error(gt->i915, "Failed to load %s firmware %s (%d)\n",
>> -			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
>> -			 err);
>> -	intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
>> -	return err;
>> +	return intel_uc_fw_mark_load_failed(uc_fw, err);
>>   }
>>   
>>   static inline bool uc_fw_need_rsa_in_memory(struct intel_uc_fw *uc_fw)
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> index 5d2a8965a592..05760fb85fff 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> @@ -290,6 +290,7 @@ int intel_uc_fw_upload(struct intel_uc_fw *uc_fw, u32 offset, u32 dma_flags);
>>   int intel_uc_fw_init(struct intel_uc_fw *uc_fw);
>>   void intel_uc_fw_fini(struct intel_uc_fw *uc_fw);
>>   size_t intel_uc_fw_copy_rsa(struct intel_uc_fw *uc_fw, void *dst, u32 max_len);
>> +int intel_uc_fw_mark_load_failed(struct intel_uc_fw *uc_fw, int err);
>>   void intel_uc_fw_dump(const struct intel_uc_fw *uc_fw, struct drm_printer *p);
>>   
>>   #endif
>> -- 
>> 2.37.3
>>

