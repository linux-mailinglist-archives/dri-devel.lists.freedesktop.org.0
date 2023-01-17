Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B9D66E5B0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 19:13:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544BD10E5A6;
	Tue, 17 Jan 2023 18:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D812C10E320;
 Tue, 17 Jan 2023 18:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673979181; x=1705515181;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mrYl0ASZXOBff9lQgEZaSBq+/8jaHcB49+65WRgQYdw=;
 b=FwES/TD8PSAbhCDWikFM5IcxITxfgd+VsIVN5rwAFo7g+oJlHCnXQt4n
 8kgEYBiPTBRnsmDTqhHWB+KW2qYRI8YsEeTCNWOjas+hapgUDWnCZjYLw
 k4Vc5UAoRZTTr8f1CG9bxPGzmLM7QFZEaUhKWOduM9g3rIoAls311+MnD
 p+ep6rb3luOBuJJj0tpMntrPpYZEKnO9Se/eVVxmATc6gw3bJ8FUFmc2T
 5ak/c/tfmoVgrRkOIaBtMgt1vTV4/Lm2DNVHHgHmf07Y032h9LDDDfEBE
 BlKgnpOZ3NFyKgxJ/DfNIQHoHONyIm60BUIhA3iywmhJGsPd8ey5VxojM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="326846805"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="326846805"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 10:13:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="748129303"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="748129303"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Jan 2023 10:12:54 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 17 Jan 2023 10:12:53 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 17 Jan 2023 10:12:52 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 17 Jan 2023 10:12:52 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 17 Jan 2023 10:12:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdBBg/ikBkhQNaC76wnWGFMptroh62GeK6ehmPyLQhtDJFtigBky31TcU9R3mt4p24DBivWiWMp1R6I4l2So8tt4KbqQc4d63x020C+Y3ECwYRGG522A6qqpKYm1CwY0vwcb1lD36ElOynID+ZMBk4RlgBApiEik6nkFwHxrRbaVrMhN9GmnK7AsjLIU78SNwRTDdySsEWIhjEH99bsXw3iRTgD+c+JjRfuhThP5+lQW29Te32hen02uVDdQlHHqKXdo+uCvC/G0yRjsW8gWmp/85xtJzN17R4BzVRnMjfDzbyGLaW+3eAkXL+bYbgVpKpvPCBNps44xtyqqGySQeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AK0DSzS08nMHvmhsp0JD3fdXO8b1sMP/vxXmgXCfbWg=;
 b=S715F139ZPNGfUMNj2/fyT80sWfpm0Ot1H4jd5X6ctZQoaeVbgQyuxgMsG96lMESAP/5SMnuH+7Fyxxon4n8JNZSTlrHsGZiWYmbQb/PRJzvj4BFOyms+vlohJIjiflpIsjWVgrWg4dcQ8NpzNtWDQVRrc6CvbOTBV36SNknypqd1NAToohTBddA2k+8ucGTAMN6/r/3B55PXw7NG5ebhQSpUsNG/YWxWCmCcei9Llsqs83lCaWWQcY/67wE8h7BYk3W2FimQAb7Mxiom9HBypMdtDMFV+yI/Rzjl9lKmJd9k7GjSsqEpQ9/JFZWts8uRvcfUtMeGq0/cnZ+92ZRsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by PH7PR11MB5795.namprd11.prod.outlook.com (2603:10b6:510:132::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 18:12:49 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::755:cc4:8c46:509f]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::755:cc4:8c46:509f%6]) with mapi id 15.20.6002.013; Tue, 17 Jan 2023
 18:12:49 +0000
Message-ID: <982599d1-2480-72ff-1515-425b2693e3b5@intel.com>
Date: Tue, 17 Jan 2023 19:12:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] drm_print: Remove deprecated
 DRM_DEBUG_KMS_RATELIMITED()
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20230117180417.21066-1-nirmoy.das@intel.com>
 <20230117180417.21066-2-nirmoy.das@intel.com>
 <CADnq5_NY9B4dtswNzowG_KrPuSSFdtpsonY_7wNhtzW0G7uJXQ@mail.gmail.com>
From: "Das, Nirmoy" <nirmoy.das@intel.com>
In-Reply-To: <CADnq5_NY9B4dtswNzowG_KrPuSSFdtpsonY_7wNhtzW0G7uJXQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::20) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|PH7PR11MB5795:EE_
X-MS-Office365-Filtering-Correlation-Id: 89240092-de7b-4b4c-4fd9-08daf8b67140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ifyh85VHPTP2brFFkS24J60Xivoo46khQcFZ9XKl1nXHEVO5M3+gNv/vPWB1wrRJmzor2TANVmotWMS1w/qj7o5vI/2K7E75oLXExHNxhcf86Olt2UPrlSfeeqLhJXCIT1AGwUuUQ4SKWhUhq067ZrcYRR8ffs74Y4d/KoDgDl8t3B4fbroVk66QS7yCfm1wklROgjHuszN7/I2FG2d+hp2fKimiP0WdWWb0qx1o3BKCXJpmWbNqEeBZx9oqRxjw4kLbKSAClhh1DVnLzhSnsNUcC34d48e04nKr+8ZT5HHT1b5boHhn2rnfdCXX7z+jxHva8UeAEq6FZP+DhjcYs4G21pBey2xNLA5DrolvExKejMRzGKL7bN7SkBILTR/NqRsmrbiVnBoJw9IiLborBQnwAddHbT2NuyW7uikshPkLpeyoXZjDEvP+xeaLjMyIlsWSBoAc1L4xWk3bamWcZhJyKiOuX1QQw0IUqT+Bxga0PYHXbAmc7GMvWj+/uKXP0SJoaekgdDMrw5iNFq8UVle5iHDyiuU+BwSqL05Pgz+SyoRT/9Ui7x7p5qKcLtEhzG22b2HpCwzH5Rwy4kfmVkGmU/qx2MO4g8scAWYPNhEoBGhqIeaUkFe2cNNPNvI2cTKUIoxyZy73pAnCR4KxFr83hMZykisUpuKFTQZcPd8q7aI2aXEmFT74BRLtdootPPseCwQ1lRYhH9ye+tJtUcf5Rgv2+pzW68+W/TfzBUo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(376002)(136003)(366004)(346002)(451199015)(31686004)(66476007)(66946007)(86362001)(2616005)(66556008)(6512007)(26005)(53546011)(186003)(6916009)(4326008)(36756003)(31696002)(41300700001)(8676002)(83380400001)(5660300002)(82960400001)(8936002)(6666004)(54906003)(478600001)(6506007)(316002)(2906002)(38100700002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3hlYWpOeURqZURBR0FQLzlvTFdpbXBHenc2VTM0RkxtVTdsV2Y3UForMXEx?=
 =?utf-8?B?emtYbFIrL0daS2dqam1tMWxGODRFVGtValVTVjlFZmdmdUZXaHpUU3E0bnNJ?=
 =?utf-8?B?YmNpeXNWd0VkSXN4WGVWL3l4Q3V6eG9pdlluaTFHWjlTWnBWdGdWNmV1ckxu?=
 =?utf-8?B?dHJXQzloenMxYVMvdXhZVlo0T0RibVhIUDI1aS80M0VKNFptUEZYWXdrSUhJ?=
 =?utf-8?B?bDVTbXdMVGl3SGhYMVZWbHdXMDVKQTRrS1M2bzdMRk10YU1wQThjWXJ4MTIw?=
 =?utf-8?B?LzdRNG5PakxqaE10VU42eFVCTkpKdS9TNElwOGQrVVhZSVJkb3BNd3Vidlo0?=
 =?utf-8?B?dEFXTVFrL25MZlFDUUp0a2F5UkFheHR3QU9aN0xxTTgzdm9WTCs3VjNJU0h1?=
 =?utf-8?B?dVhHMzNNbHNxaWdUNUIrelpJUzBqTXpQR041eFhBS2p3Q3Q1TDIxem1wbTJ2?=
 =?utf-8?B?RjhHVDUyLzNOZ2pKZkZHc3ZCUm1sRkU1M3pNZW1JVGduVDFaT3FWUnN2Y1hF?=
 =?utf-8?B?c2ZhWm12VnR1MkY3S0Nxd1EybTFHZEJSLzNSVkd6bmZyOEVSSjZwQkZiZ2w1?=
 =?utf-8?B?V2VFTXN6QVFJVlFrZ2ZjUWpSOG9HejVpazNnRHR2MHk5eTQ3ZUtKZzZvUTdW?=
 =?utf-8?B?dkxjUkVSV3RQTDh6SGRxU0tHTUZvRmF2U1hvVFlPZHBqNTgzYi9tdDZmMEp6?=
 =?utf-8?B?K2xSNGU0cmdpb0dPclR4amJyd2xQVzRwZFNzRVM4QmZnWlF4bVpXSXZWZm9S?=
 =?utf-8?B?Ujg4ck0zdTB4RGdxZVRpS0dsbnprbk5ZVXRLZmp3MTYzWTg0c0NtTjF6eFZ0?=
 =?utf-8?B?aHRpT1B3bTVnc293VTRxaU40bDFqSW83VDFnZDZydGN4MkNSbWZWZDMzOFRn?=
 =?utf-8?B?aG9VcDlVTGZrUDJib1ZILytobjQ5V1lCQldpWm1nNjZOK1N2NXNnbVJENWFw?=
 =?utf-8?B?ZzRVSTh5Y2x0VHNPNXNrQ1d3NUE4VzFITTFlSHlkT2lyaUQ3dEJzbFpSYTNa?=
 =?utf-8?B?YndoVXp1eXIyZDc1QjhDSkNWMGV5MVFxRFhpc21FUVBBcHdNaEkwV3dHdTNO?=
 =?utf-8?B?Y3A5OWRjVDczRHlqdEY0Q0oyYlN3VGVJTHRJYUU1WVZpL2lqSExQQ2cvWFcx?=
 =?utf-8?B?M1RtUzRMbnF3Z0ZvVlpEQWxiUGsyamJLZk9xcDlWYy9oWU1pd2RmNFVzMWJw?=
 =?utf-8?B?R3hkSmdqN1dCRjVZSTZUeGFNZHBSaTB3Y0NFWGlZNVd0aSszY1hRZDNVNkpq?=
 =?utf-8?B?RlJzalM0azhYQnlKM3h3QnN6NVdybjJCazVNVXNXQjcvaVN5aHBENFpVdFRh?=
 =?utf-8?B?NjVreW9JZU1tN0h0TGlCWitlbktJem1TRVBLYytJZ3ZwaGs4Sk04VjVla1kv?=
 =?utf-8?B?VXU4REhERFVpZjdTTDc1QzY3dnZHUFBWWmlKbVNldEJJZGlIdkRvMVg3Qmtn?=
 =?utf-8?B?cGFFdFhUelY4bTM3Ylo2ZUxsc3A3cVkyb09xR28vd0FuWEZxMTFoTGt6QURL?=
 =?utf-8?B?d2c2WDRFbUc0WWwxWGwzN3ZGMC9jNHdvSlMyQitlbk9NaVJQdnpNbGZZclpO?=
 =?utf-8?B?Ry9OU2RuTVR4SmZUbVpBMjNGTU9vbUppMjU0TWgyZUlsdUdNYXpYcml2RElz?=
 =?utf-8?B?UlBrY0dJNktHdmlPWTJjM2ZrY0kzV0I2aHhmQ3J1eG44Zzh5SGM4R21NVm5S?=
 =?utf-8?B?Q2tleXJxalpreVIrcEZMeVJmazBFY0tpRUI5dUlKMWgyY1BYVE5HRjlzbm5p?=
 =?utf-8?B?azE0QnNWVHh6LzhTSEx4M2phUHNOeTBJeDdwYjBmSVplTVN3cFVOa2JkbmRC?=
 =?utf-8?B?UUE3OS9JYW02Tmd1bzI5TUYzOU9temxqaWpQdXBPK2VuaG84TDNqODk1R09N?=
 =?utf-8?B?WmFhTWlWRUVFbk5LbEFQNVhlRzNkYlN6K2ZJVVlncmNOMG5pZjNqNk5zRC83?=
 =?utf-8?B?SUJnYkxDTitXM2hXWU55b25ld1BDbEVwQUY4RGNqQUd3TTZUdGFCVDc3YUdT?=
 =?utf-8?B?U09QYXJIZWNuTDdKUUVIT0tHNWdMUjlhYk90dDBoQnNyYWdxL01CNE9FRFVq?=
 =?utf-8?B?RkRhQU5CeVNiMGlWclZ6ZWYxSk80V3I5c1N3Q1R5WWlORVl2RUorWHhyZnFj?=
 =?utf-8?Q?aKQi6K3zNfEe08XxEoRjr7JLP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89240092-de7b-4b4c-4fd9-08daf8b67140
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 18:12:49.7091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m19MSof0D8W8VIFTRzNwrk0frbQafr/laxdPyzAAJyhRJClN1NZomFsuvLWYCdQPIqOrYIvLbQjyMVZcCrJ8Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5795
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

On 1/17/2023 7:06 PM, Alex Deucher wrote:
> On Tue, Jan 17, 2023 at 1:05 PM Nirmoy Das <nirmoy.das@intel.com> wrote:
>> There are no current users of DRM_DEBUG_KMS_RATELIMITED()
>> so remove it.
>>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Series is:
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>
> Feel free to take the patches through whatever tree you want.


Please help me with this, I don't have committer rights for any tree.


Nirmoy


>
> Alex
>
>> ---
>>   include/drm/drm_print.h | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
>> index a44fb7ef257f..c3753da97c4e 100644
>> --- a/include/drm/drm_print.h
>> +++ b/include/drm/drm_print.h
>> @@ -605,9 +605,6 @@ void __drm_err(const char *format, ...);
>>   #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
>>          __DRM_DEFINE_DBG_RATELIMITED(KMS, drm, fmt, ## __VA_ARGS__)
>>
>> -/* NOTE: this is deprecated in favor of drm_dbg_kms_ratelimited(NULL, ...). */
>> -#define DRM_DEBUG_KMS_RATELIMITED(fmt, ...) drm_dbg_kms_ratelimited(NULL, fmt, ## __VA_ARGS__)
>> -
>>   /*
>>    * struct drm_device based WARNs
>>    *
>> --
>> 2.39.0
>>
