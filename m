Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A976717D9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 10:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229B810E700;
	Wed, 18 Jan 2023 09:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4FD10E6D7;
 Wed, 18 Jan 2023 09:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674034493; x=1705570493;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uwz7y9tJxSRo/r3Y03vBnj4Y6AcFKW/8RPiz230JRuc=;
 b=k2/GpFC1IZUc7vf0nvAf4bcrrEmiB1xVZFGbPAMTYfVWIsg1rZobIXnZ
 kMQSLvWe3FghZU4kMfy3mj7exl3m1IPb3gTImVMSRtF/MCf0dFqo8usXs
 Uui5e0jCCXqranBD4qTHZcwOVO2JlNjCWKbWoraPSNU99ACZDzeR1QtAn
 mBCewN15PJO2j2EG56JH1+fYPDhXWEmK4ruBNXhTuYSyLjA3awnVS9VNZ
 Sqx97TxxO+sBW/8HXtl9ROTlvo2PXTmXiFiNNuAIcsxKL1cDW+jdenGKb
 zkMFZsbB0qmwYfVwwM2IMOiEyCAAgu3AJRKootrI9gV8SvU3upO6mhnFo g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="304624208"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="304624208"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 01:34:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="637209597"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="637209597"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 18 Jan 2023 01:34:50 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 01:34:51 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 01:34:51 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 01:34:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qbm/YQ5beauU1Kmt+u5Bm341N3eIpfiCUSlVr1geincXNsY/ItEXOeI5s/5jYd796tFbbpHKVim3OCnNQztV/idY8ixCUS7DJtqlmdu6FM2H4/dF1fx51zMHtSvRunCxIhXCyk/cVKlpI35Y12I4aHJhJ42UyRmBruPGLoCoXq347kkAfJZjMMo9Jt45lueMpTnXQtvOIOn/wSvTrglKqX9WeNR84dqzVct23dW0ID4/iA/IQrfxgCQimxq5u+WAuLjzqGim7VgnyEsYqf7K6NXjoG2jR7faaNXW+abTetaJpKgkfn/gA0V1wfRMT+79ZVlOmIbYvT5gUZB+GFNTyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+B/BljeVAiDJ9SWhfz5DGeYMpZs0/KXVbz6MXoROHI=;
 b=Svb/t5IrtsB/0PUEeZHTZPbgwpcghGlL4REkGgZum+H1oSBm2/O2tq1js9n+rIwEgFjpvfAILC6ufSrRDlWR7D017EB2+bzkDS8vuFraFTDhXGF/uP7GseYv1pcUToyX0PsFQKiGj924OMXVwFgbnDPhYQP1KatPVHIndj/aZRiFjCz9vXUmCeakXmRFwhH3Fpy4Z1zMFIzbx5W7hdW9m+7ysy4HU/OnuEBiP8NaDLvuXEANHDDQXkVfm3fMPp5poFYzCluAbqosm4xBhjgkPSVCEUvSNJyx84Cwa6AhfiQFv7E3znhl5hv12wwO7ZbWpjVJDY0mvS2qIq1JdHzzTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Wed, 18 Jan
 2023 09:34:49 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::755:cc4:8c46:509f]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::755:cc4:8c46:509f%6]) with mapi id 15.20.6002.013; Wed, 18 Jan 2023
 09:34:48 +0000
Message-ID: <6265210d-83b0-140e-2207-c40701ffa443@intel.com>
Date: Wed, 18 Jan 2023 10:34:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] drm_print: Remove deprecated
 DRM_DEBUG_KMS_RATELIMITED()
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>, "Alex
 Deucher" <alexdeucher@gmail.com>
References: <20230117180417.21066-1-nirmoy.das@intel.com>
 <20230117180417.21066-2-nirmoy.das@intel.com>
 <CADnq5_NY9B4dtswNzowG_KrPuSSFdtpsonY_7wNhtzW0G7uJXQ@mail.gmail.com>
 <982599d1-2480-72ff-1515-425b2693e3b5@intel.com>
 <bf60d3dc-1d6b-4f74-79f2-878cd61ba3bd@gmail.com>
From: "Das, Nirmoy" <nirmoy.das@intel.com>
In-Reply-To: <bf60d3dc-1d6b-4f74-79f2-878cd61ba3bd@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::18) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|CY5PR11MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: c3df67fb-8fc9-4ee7-e33e-08daf9373dc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GNTTzDM6EhH9z+ptQLAQAdbBUnf+/+KOyfiolIrxHcA+e+Edy8y6BOyNLoLv5bPSyGcG8hoO6VSVq69jw/PE1fIaybE4js9ijfAJJLn9s3wm+3NEplWneGs85SrI4MnOOg2Jnx7cOkwjoYcBA31AHJx5IE91Gn55iX0nC3rmn0WHpltZBLO85FEPTGxiP/70dYWPSSuZ0yBpnuVCshIbZdj3f1LcV+UWNI1cJ/G4KZm68xq7gL088aKinXhSOwnPw+VEzaoRCmWax5FFT+cW48kH0CYHrniyIUwQ1TrXLGWfF0Spm522PZMvgBYHDLF8TKc72dbL+04ySd7lojfvNqINJUM5vLmYXQ7TSv4c93sXs3Geyvg7Rem7E4YRySddJN6IGmEeZR+BaiqgPBOPh6mmkCjF+52KXuE4QbWPKKYPRge3q2QHEor0z29Fgeb55zAoW2E1kAt1nC+tS6Ifiic2SeInQXLNAPYpdDf4kKRrKtY5cq13hbS8KqSxndTjX7e59HQ1NQ0lY7yCiCRRWjflE9nXhVS0XMu0zKWcJkHcWp+LwTQ9xN7FTlbBrOWdlFZMmPouUmDXDHepOCGbDIAfhs3tvQSiXiHri3tlX0HDOMT/AlbsORGmFnulZjRkV5nRK6AB9a17hprR6g5XzlrPYXVow1uJAXxeMCbgQFTvjMd78dj3HbJUsPafefA/k7tlR4B2GCSb2tuvJBP3V4YJfW2CkrUBQpKhzy2C7Dw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199015)(6512007)(2906002)(54906003)(26005)(186003)(66476007)(6486002)(66946007)(8676002)(66556008)(4326008)(2616005)(316002)(66574015)(83380400001)(31696002)(110136005)(41300700001)(86362001)(478600001)(8936002)(36756003)(6666004)(31686004)(5660300002)(82960400001)(38100700002)(6506007)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXV2SXN0bWYvNlpDMk5wdHJ2MS9PVUpJQzVtUkhRbnRXOTFheE5lSmxOL1h0?=
 =?utf-8?B?Y3BKZVNWbmpPenVwdGsyUVJ3eEtHT21XZDZvRjk4ZkhidXpEcWNYNGdVdC9T?=
 =?utf-8?B?OUlnSWc3ZGZZaWR2YTVJWnE5bWVLUHNNSzBYTWFWN0RGUnNiNnVBS1lTZTVB?=
 =?utf-8?B?SER0b3F6ODZYZ0doQlozcWZqcVBmQ2VKaXNBamdzMnhMWjA1WGh0T1RVcmZw?=
 =?utf-8?B?Mi93aWx6OUZRM1hKUUY5bUNLam1UVWhuQXZ0aHVNNEVmaHJnM3hMN0pGYnVV?=
 =?utf-8?B?SzVoK3hwcU8xYkcxMmczWkFNMDlzeHE0enRWUnh2Mm5jTXRwT1g4M2gzRDd2?=
 =?utf-8?B?bFVVVlZxelEvdWdXb2M3UE8wcSs0am9LUWxXaGQ1bTJMY0dIclhsUDBaNld4?=
 =?utf-8?B?N21wN3B1cUh1dHVGUlprU0M4M00vczNhdjlLTzR1dDY2aGV0M0lLMWs1eHcz?=
 =?utf-8?B?U2xaeXArL0NvSzl6UUFoMDZVNWw5V2cwUkFrK1hJSlhDTmxZaURLQ0JvVVNi?=
 =?utf-8?B?WjNFVFF6eHRQNHlRQmZBVlZ5SENUY09DRDIzbDhQUmoxUjhQd0Y2OWp4dWE1?=
 =?utf-8?B?bktPMWd3Sy85WlNTbjBQaWlydlAwMWFMb09zeFVzQzJLYm94TmlvM283NjhV?=
 =?utf-8?B?RnYwV25KMXV6OGZ0UDdUSW9KUThNbnJMUHBNZGVQYnBtN2tmd3BCTEpzMEFV?=
 =?utf-8?B?Z0FhUnAxSkxGN0pkNytsZ0JLOVFZb1dJc3B4TnN1anJESlhtQm11NjJ4SFNo?=
 =?utf-8?B?c1k1R2N6clRiSUxyaDhwcGJ2a3M3dmtEYkpvaExrMHBvVXN0amJnRno4NCtH?=
 =?utf-8?B?OWU5K2NSZzNyRTFoQlI3ay9YOUR5SkRqNDAzQi9OZFBiL0pYNFJLK1AxZmNr?=
 =?utf-8?B?N3c5eXNZZ3RVb1M3NXFKOWVWQzM0T2VHMmJ2eXo3NzJuSFV4KzJFT1B2bFps?=
 =?utf-8?B?NWtseGJ6dEcrT3hvNEcyc05LR3U1VkdNREoyWGhwWGhwbzcraUwwZjVjVnFF?=
 =?utf-8?B?THBDc2cvaEsxdTIrT0hzem5WajBPYWpVWkE5RVJUcnZ6M2ZQSXpVcTQxSitz?=
 =?utf-8?B?WkZBSnorb3RrenJKblRab0x4R2ZtcmEwSy9BSDJpSmtOaWNDWFhCMVF4MFFK?=
 =?utf-8?B?YjNrOFJOVWJWR01icW9mSDBmWC85eFY0ajNOWGJTS2xwZXdNaGJOTmtSc2dr?=
 =?utf-8?B?TTZUaW14b0N3ZG1pbmttellJZXhWQnhjeFg4RDcvaGswU1RRcS95NGF5VE52?=
 =?utf-8?B?dk5BMHN4NVJQL3duei8wWDFnVnlna0VETEFaNm80VndoUjJmNXlrNkpRUXdM?=
 =?utf-8?B?My9UMVNiZ1V0NFJuVVRQenpkV0RsdHZ5UFRaZFJhVFh1QWVCdU1qUWVGTC9J?=
 =?utf-8?B?ZWtQTnVVQ0JqLzV5YkhUUlVHZXQxQmE4RmkyT2lDN0IvU3ZjaHlqU01LVnp2?=
 =?utf-8?B?OTl6UkRNV3N1REdKNlhnVzhjdmVta2Y3MklhdlhlSnk2Zk9WS1YzWDdBNVBt?=
 =?utf-8?B?VXZxZWtPZk4yQ1JtWk5jMmVPdDA5QitRWnR0TnlCV0lSK2tYVkptV2pjd1cr?=
 =?utf-8?B?eERJMjhPWEZuUUU0anRDSk42bUhidkpwcVNFNWZSYXdGdyswQW5EWThQczJo?=
 =?utf-8?B?NUhkL01XSkNvaGRTcERLUnlGdnIzRVF2Z0VwYlJTSHYyMmZROVR6QWt6V2VG?=
 =?utf-8?B?aFJIbXE4YzhneW93YVBnblBlSUw4V3o1NTEvWU5heWRKczRKb2dGckZMRjFx?=
 =?utf-8?B?RGxqcjdIWTRCcDhSOEgxRUQ3RVI1NzRtUUVhQ0Q5RHE4TGFIRXd3M3cvMzhj?=
 =?utf-8?B?UU45ZzNjRFk5dVFFaVVkKzFtakR1NE9UUXZjNjhmNEJ1RW9kMVhORXdWRkFj?=
 =?utf-8?B?Mi9wUXVWSUg5a1cwbExhVHhqdGNzTCtkSEp4NGczU0RGUDdiemtscFMvNXRL?=
 =?utf-8?B?ajZLNGIzUTFVMlJ2c0gvUjJOQnRDQ3A4bUtYTVZOT3NqUkhnK2FnMnFkM2Ex?=
 =?utf-8?B?eXA3eDhmb1E3SU45UnVhemtDR3F6bHFwYzFEWGJPSGRnYy9NU0wvTkJmZHlT?=
 =?utf-8?B?Y0NmMlczdTVOeWY3aEIrcHZxMXU2UEd3WEdzdHdWZVlOVUFjaVdGcERMaXhm?=
 =?utf-8?Q?NQAQvMdOqGmw8wV8bIQfkGowl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3df67fb-8fc9-4ee7-e33e-08daf9373dc5
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 09:34:48.3274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vfPRztDzqzAQc/AYDR1x7ukFGBkTJqj1KX9Ib9TtaVyPjh128QiRWfVbIQA0ZDCCCwY1wb4JZp9pn++brVsfFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6391
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
Cc: dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/18/2023 7:27 AM, Christian König wrote:
>
>
> Am 17.01.23 um 19:12 schrieb Das, Nirmoy:
>> Hi Alex,
>>
>> On 1/17/2023 7:06 PM, Alex Deucher wrote:
>>> On Tue, Jan 17, 2023 at 1:05 PM Nirmoy Das <nirmoy.das@intel.com> 
>>> wrote:
>>>> There are no current users of DRM_DEBUG_KMS_RATELIMITED()
>>>> so remove it.
>>>>
>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Cc: David Airlie <airlied@gmail.com>
>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>>>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>>> Series is:
>>> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>>>
>>> Feel free to take the patches through whatever tree you want.
>>
>>
>> Please help me with this, I don't have committer rights for any tree.
>
> Going to push that into drm-misc-next later today.


Thanks, Christian.


>
> Thanks,
> Christian.
>
>>
>>
>> Nirmoy
>>
>>
>>>
>>> Alex
>>>
>>>> ---
>>>>   include/drm/drm_print.h | 3 ---
>>>>   1 file changed, 3 deletions(-)
>>>>
>>>> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
>>>> index a44fb7ef257f..c3753da97c4e 100644
>>>> --- a/include/drm/drm_print.h
>>>> +++ b/include/drm/drm_print.h
>>>> @@ -605,9 +605,6 @@ void __drm_err(const char *format, ...);
>>>>   #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
>>>>          __DRM_DEFINE_DBG_RATELIMITED(KMS, drm, fmt, ## __VA_ARGS__)
>>>>
>>>> -/* NOTE: this is deprecated in favor of 
>>>> drm_dbg_kms_ratelimited(NULL, ...). */
>>>> -#define DRM_DEBUG_KMS_RATELIMITED(fmt, ...) 
>>>> drm_dbg_kms_ratelimited(NULL, fmt, ## __VA_ARGS__)
>>>> -
>>>>   /*
>>>>    * struct drm_device based WARNs
>>>>    *
>>>> -- 
>>>> 2.39.0
>>>>
>
