Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9D3517050
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 15:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7219110E91F;
	Mon,  2 May 2022 13:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1FD10E554;
 Mon,  2 May 2022 13:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651498137; x=1683034137;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jdU0l8k+kDnC1WDsAs7nQrtZ6E20Cy/7R/0o6oQB0rU=;
 b=ZHsZhOPAQHwKhnytkKCSCTa0wcQhWID91Iu/3aVcX33WWVBSjqHdYZQx
 Q5hninQE6o6+457t+29slDuNix6RouU5Z6HjD+jOH7jx1BOmo94WyTZ/q
 s1ft57P55Cl23YGABa9mbEw99dxr6FxlVljHjTwHpC/fCuuTqNfnrFs4w
 ukZMnzqKJWUrM0jYGUhwVlZKlQWxq5gf7GJAGu7DUj4f91tT598vpUdHw
 tXQ7QG25U8wFbuvAJvRL6YIhgv8PPBXDOL2fMTTbe9mVpxWCzmORaLap6
 b5H0cl8LunTYa6o1J3Hm/ji0VPhISf7/QZxgSiBjRDfdNfxdpxUQlp+Je A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="353641042"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="353641042"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 06:28:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="546330329"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 02 May 2022 06:28:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 2 May 2022 06:28:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 2 May 2022 06:28:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 2 May 2022 06:28:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oabA+4PzUGKoro4VFBnP/MHxlp12KcBriSN90VwCT8q6rGirPMYCEu9g3AjDFHBKrmQPWaGB8rjBS+cYAmf9NNH+LYRi0CVAZEaFrlamplbj7fcm55CE1j89u0CLNEuacvbeo+aF10nXFcsmKZ8HFvIFKqApZaKKiLhjXXI7V+B82sXWL1QzSNDaTw5aZmi5OCAYN2DIzcgeXRTpKyJfuu33ClF4lZbb3Xqg2XHY/B6Wm+wJJu1CW03yYNb0G5pOkaSBqfNwm5Pz+lauPfNtR/2bjBYeGmIavcdQNHv55KyOzCIsN0Ly1qBUHpyNie2mD5xz50AcjfgH9PfgS5IB1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CnpF69ecwZK9ZSVvkTQwqCSVm1dTSDwHwkujn7La35c=;
 b=lxr+TzGWwKVHW1+5SOWhcwMm4+EvBBGIx3jGOfFjSalw5apS9iw2QWQ1gvMr4PD1UN3k7YcoV5NFvDzkEg9C/j6bsj43gQaVpIaMk7V0+WhE6hPGrQ9pOXDCOAb4WyyecOInHQR9xn+mNzK4U3vz3Bfgzkuzx/ipC5bxg/3dTk9CkbqtWARqHD80KnIVjgtMA4L7GjJWDzjkNkb8d/I0cV77xwZk1g6MOsWCRVpnCXHz40p0N7WFoVuCcgNOkK5TvEyiHd6YiDJF3BDPwT1+xFNTP1GTk5zNZ0ZWMR1UiKwd3pPWM1YUKgbTETxCluT45ZCMXpch0TdZGI5E1oyGOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 DM6PR11MB3916.namprd11.prod.outlook.com (2603:10b6:5:5::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Mon, 2 May 2022 13:28:52 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::905:c4c3:7416:d3e9]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::905:c4c3:7416:d3e9%8]) with mapi id 15.20.5206.024; Mon, 2 May 2022
 13:28:52 +0000
Message-ID: <29f40e83-a9a8-c0ac-1702-f9d0bf0f8861@intel.com>
Date: Mon, 2 May 2022 18:58:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [V2 3/3] drm/amd/display: Move connector debugfs to
 drm
Content-Language: en-US
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
References: <20220411095129.1652096-1-bhanuprakash.modem@intel.com>
 <20220411095129.1652096-4-bhanuprakash.modem@intel.com>
 <DM6PR11MB31778321FCA58010AE44D867BAFC9@DM6PR11MB3177.namprd11.prod.outlook.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Organization: Intel
In-Reply-To: <DM6PR11MB31778321FCA58010AE44D867BAFC9@DM6PR11MB3177.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::7) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd3206bd-707a-45d5-06b9-08da2c3fb2e6
X-MS-TrafficTypeDiagnostic: DM6PR11MB3916:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB39161995B58B7D62E2DE416E8DC19@DM6PR11MB3916.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UuiuK1J7oTUHT5X/drdRgoBOpoo8EEphXE7VBwrYx+0IbQn7k45q0vbokWTE6jvX7ye4slWuLR68COQeQsXtytQgFa8wCMWiFEI9Adw/xRoZ3i99wPyLBUcY81XEg3z0ZWKM/zpO5sdQM6QZCzjvWoP40HxTpferzH+z5B0z+PGhu61F2BRqh5dkge6LVRly3ZVV2ZSwYCUxeqTijCBo6G+V6js9E4zTaRpIQXTyFYEcYCJZZmMqMEX1HSmLMchlViNXisSVZzH+ldY10gCSwV/7RBbnETEjXxKWE3CoE35PXiobUxP7A1i/7uLsnhzh6y7fZgDygn4JrewNh8WJaFYcRJ+sjZQr6owDYqZKXH4kmgsagjpQP9kgDU1Mc7AmRInRKEWXXKRfoyVNw537W0ASI/pAuqTUHtTk1LoWKVHqL5m9zxDEFHM5Q78OAkwjL5kxwpkNmrMOJ+1Ewgs8WSjsnK/OA7xbJHJFPHfrNkWi76tfHy3sV2TO4M3McR15ua2mZVCQM1B7cJcbBRGZE3A1QoMjvp785uxkddeAiHi8k+Ah0qNbVIvosiDB/XEdb21tuZgxcvVCXTqt3og+JtA75Caqmow85S34u43K4N0Lx6YhXTbBJa8jY2mCrDRxxw0VGR4H/uMyy61agnsoQ3DVfQD+vsA2eUdzZpyP8HJyxFhBqhb5s2CuH/Sea+RUbklWr2IUzj6UeEyxDlzD7a4Fid6PzklXl6uQZVXS2Mt9BWSTjsuPHk8DdUZaFShn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(110136005)(31686004)(186003)(2616005)(2906002)(36756003)(83380400001)(8936002)(5660300002)(66946007)(31696002)(4326008)(86362001)(8676002)(6636002)(316002)(66556008)(921005)(66476007)(82960400001)(6512007)(26005)(38100700002)(6506007)(53546011)(508600001)(36916002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWpsemttQitHZlZPbmNFbzUwT1IrZStKdllTZkFDb3ppYy9EaG82eERNWFF5?=
 =?utf-8?B?RnlBd01heTRYcExwb3d6ZmZibFp4bWNvWTVPUzR6SHNyaFlRTEpOdjRRcS90?=
 =?utf-8?B?TnpQbWx5RWFzOWhncTNUMHllUGN6NnFNSE9iMjcyV1JwTkpEQWdHTWZIUCs2?=
 =?utf-8?B?aXJvb3BBcStWSk9mbldDcEtIbmdJRUJFSU9wQ2lsRW11b2VmdUVRdHlWY3Js?=
 =?utf-8?B?b1hpaDIybGtUUFljdlluM1RlSkVlcnVrU1NSUXM1Smx6TWV1QkF3S2dUQ0dP?=
 =?utf-8?B?ZE53Q0pHejVUYytVcElXWWI2bDBCZU5zTHhzQVEzRUdkYXZraU53NzNUS0JU?=
 =?utf-8?B?ejJGSHhwVGdHaFNwa3RwNm1DQk85L1FVc0swUjJ3d1BkaThtSnprcmJrVkRm?=
 =?utf-8?B?Q2tRS3J6RjBieHZIeDhva1FQd3dxUkVYWFdLVkRRd2FYSmhEcXhFUVJvZ1F4?=
 =?utf-8?B?YkhoejhhNGZUeE1qQ2gzbzNJK2pSdmE4WUhsaVNWOEhTSThHTm5nRkx6bXJu?=
 =?utf-8?B?SXBYTnRaNDdodWt5RnRxajUrdjdOWStyQk85dlFBejlsTUd6aTVDbVZ4dGo3?=
 =?utf-8?B?cVE2SWM3VUs3dFF2M1AyNnlCS2x4RERzcEsrR0NkWmtpQXJQUlRaVENveE41?=
 =?utf-8?B?ckt3Ukl3WHVBbi9nQkR2RHJteko1STc5ZitRUkhlYzRpb1BLUVFWNFp0dE9X?=
 =?utf-8?B?cStNQjl3eTNGSmdJeTJsWWN0T29xNGlpWkdWVVVzMisvVFUrSFovNUdySWFE?=
 =?utf-8?B?ZmFkUkFyR2RJa0FkY3d5NDRFUXppWTRkdUdIZDVLbGxaajE5bVhMQnZxWDBy?=
 =?utf-8?B?cldSemVuTlJEb05DYXRUWHJjY0FMZU9zVEhPWVdSV0VDT1FWb3VjbE1xYmFY?=
 =?utf-8?B?b25XZWcydWR4U2JGT005ZnlnS3JBdmkzWEdCbXVTNTB1c1JycUV6ckg2YVVY?=
 =?utf-8?B?dW15cXk5MFpneFp3NUV1eTdDYXFXV3czeDVWVUJIdGxGZXZxcWdpZGsrNWRw?=
 =?utf-8?B?aDJuN0NVZDJHZkVyNnZ5MW1zZlkrRHpFY1NzK1JsM1dVNHFJZC9nSm1sc3Bj?=
 =?utf-8?B?aFRNYmg2WEFTVVp5R3J6aEZGeXY3dzd6WUswNGNMOExIME84SWVsWXRma2lB?=
 =?utf-8?B?bVg0NXNVWTg0Kzh0b3VRV044YmhNVi9JeEN4WFpvUFcvWURLbnUwTmllQURV?=
 =?utf-8?B?cERtS0k0a1hwUFhGK2didmY4aWt1T1VMZjZmL0t2SC9MVzhHTGFnaG9Wb1hF?=
 =?utf-8?B?RGR1TmJNVTdSQkZ0N0VVZU9LMzN1OFVOdzBlVUdxZVkxT3AxYnBsZVlXQXly?=
 =?utf-8?B?NDEraVNmZ3cxRDFxUmdRMFRsYzVaL3pHQklSYktaSG5QSGdEZFlZWEJZRG1G?=
 =?utf-8?B?QW51MFBBQVNUdFpJbEdxV3VZRmpxMUl3cGF1R1FDM3FrVnRHMGJ4SzlXbjhn?=
 =?utf-8?B?MlJLaEZIZ3VMTndTMHU0S2NzM25ObW9UbDhVT0QwZ0xvUXVHQ2JVRC9lcTFq?=
 =?utf-8?B?VngvcTlzNTB5cEVFb2FCcXRoZ01WSnk3UllBbGpQZXpyTWdQVURleUpNVjQv?=
 =?utf-8?B?emhMWm1TWHlhSUtZdWVZSDdWV3J3WUV0b1gxbUhZd0pFYUl5NkJVSVV0bi9Y?=
 =?utf-8?B?WmJlQmZpUnRIZXN6a1AzLzBUdkFzYU8zTnc4bnVlNXpTTk9jenp2dVZaZXo5?=
 =?utf-8?B?cjc0aE8rRS85ME00dDFDRDRLZkpmbXVUZ0w5eXBnSjNCV1lVZFVSMjE5L2pX?=
 =?utf-8?B?S0Z1aW4vM0E2K2c2S0RlYWhWbUxSZjJ0eFQxdUYvN0dwQXBscjkwQmtxTTZW?=
 =?utf-8?B?Y1VnbU9mTFlKQlRGVVF1RnhvdUdCb0F3ZWxITFZnMU1YMnJvbGtvb3Z5VWty?=
 =?utf-8?B?OFFNanFsdGd6a0l2UWlmT2RvRGNtVmJLYkNqbnUycDArcEI4dFZpVThreE5a?=
 =?utf-8?B?SWdXZ1d5TmxpU3pJaUtmL05LdmNNV1U2b2c3QUxhY3VmVjNvbG5FS3A3V3hl?=
 =?utf-8?B?V2hPYWZLVHZndHFhdURraldJTldtSERubndQaURqRHBzVVdmUlhtRzlheXl2?=
 =?utf-8?B?NnRkKzZTRWQzQzBGcWhJRVlEZFlCcWNmc2U3bFE0SXJ0a05HQVIxQWJGK0Q0?=
 =?utf-8?B?VGx0aW5xeC8wQ1pxQTh2SlJ2YU5pS01XKzZHTlplVytrbXN2MnBHblBRVnZM?=
 =?utf-8?B?RVZ5TUFzckEwdUo1aFFjTnoyWWxFQ1lIK1EvejFrd1VyMHc2MTdYSWI4NWNj?=
 =?utf-8?B?YkkwVHNPNW9DWVI0azNBNUtWRlZBM3Bja2VKRXk0ZXI5V3IyYksrdVhONW1L?=
 =?utf-8?B?dVk2OEs2cGs0bFBjUEVZby81YzFkTHJVaGRzZ3JRKzFuRnZzcUR4Uno5dUtR?=
 =?utf-8?Q?zH4cqiwBW9F3LB8Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3206bd-707a-45d5-06b9-08da2c3fb2e6
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 13:28:52.6858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqYxuil5qAhlo4cCSfd9biMJmxP5qBPrN+VtZgEI9Jqf8RIpiVr4/h7fAbEiD/KzCq8cWiIyb2EzWmXmN6wB2mdUbcxVzVX1RB5oQTll8Us=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3916
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
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri-29-04-2022 08:02 pm, Murthy, Arun R wrote:
> 
> 
>> -----Original Message-----
>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
>> Bhanuprakash Modem
>> Sent: Monday, April 11, 2022 3:21 PM
>> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; amd-
>> gfx@lists.freedesktop.org; jani.nikula@linux.intel.com;
>> ville.syrjala@linux.intel.com; harry.wentland@amd.com; Sharma, Swati2
>> <swati2.sharma@intel.com>
>> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>> Subject: [Intel-gfx] [V2 3/3] drm/amd/display: Move connector debugfs to
>> drm
>>
>> As drm_connector already have the display_info, instead of creating
>> "output_bpc" debugfs in vendor specific driver, move the logic to the drm
>> layer.
>>
>> This patch will also move "Current" bpc to the crtc debugfs from connector
>> debugfs, since we are getting this info from crtc_state.
>>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> Reported-by: kernel test robot <lkp@intel.com>
>> ---
> Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks Arun,

@Harry/@Rodrigo, If this change sounds good to you, can you please help 
to push it?

- Bhanu

> 
> Thanks and Regards,
> Arun R Murthy
> --------------------

