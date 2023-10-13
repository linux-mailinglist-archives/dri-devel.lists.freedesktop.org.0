Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E12617C8673
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 15:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A465310E0AB;
	Fri, 13 Oct 2023 13:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7992410E0AB;
 Fri, 13 Oct 2023 13:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697202838; x=1728738838;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+Wk2H0XkaHjhRn7sqLZjNgM++HxEqdkb4Z9RmHVNUn0=;
 b=g7ixc3xQYmdXI1i8S62oebgBzivzvaQfAyhG++kxEWBvpgtfpcQkFQ+r
 pALupITuZx/pzIdkVNK0fA3sv9i8DNqP1uQT1yPwx6kNutgvnbmy7pdfr
 BY9HdfzMbRY9Yn2indckDHRUopxumRq5hVD6jBMm1ssifkcDl4/WAbMtO
 T4zO1H/kTNXCtUp3d9PepO4eYT5DD4RklXbz67tYQyEMLdPtV41uPnP4z
 ab275xEUtyTkinxO0rMQxds80Uy5T2Mh5qHI5AMa8f4N8Y7L9L1T8+dqN
 K8OkIeMa+Gw7eMu+E2iKoe8j40o0Ihk+WZRztkWl62+QSqJCwdXLdFMVR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="385017923"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="385017923"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 06:13:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="1001947474"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="1001947474"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 06:13:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 06:13:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 06:13:57 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 06:13:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSPGvT+g8YHf3+mgim58RYzUBU8Rgzyww2ckjXw3Y17Oj704W8yZv90zaYnDoyMOyOlv1A+r14f9gyVshQETxNZZ7m8EvHObazxuZj+CoBz0o6v7ZIBAEd37nmtepRSOYy44gBpppL06HBOlZX3o8BbF3H53WMCGMz7iUIOJlU71U8Mp+KauB/0Vk6SPImXsl/MTqbfdfDa+6+cf1W4CWlDQ03rvInMFNxAJ236mmAvKbWyZ4wAvEhVeuCRtMqJ7Q81RyDYjwQB60IYHbKdYts9ekLOspnx0PTMh0SLiGOic7nq8n+WV0AxH2cOl4rEmxv0UxRTm7M0IovE5V0kbzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZsRnFD5ceIAFAokrRQZJ2tRuOD1LqDatiLebHVcnLQ=;
 b=ndkhgdLOU7EYvXDpr112AZvKzr0jduKu/2QU+v+tDFZR8wSctgwTgThOEYEI0rXWkSh8VDuqrHSsiY391SkBm7OMtm7NxakCYYv9pyBoOKNt6oHHnTkM1Je1EorUPckFDKEEUA0dQD/Qe4zkMqDKqIKU3oPGBOEhCXHN5WczSf4KIGWWpoq8cl+u2YLx7pDF+zRlzNShhuSHWHjg5jZC0nzOCEbhmHRb7+iTEetlgBqG1z+6E9asDH8hC8E92GFfLWbZIRorerGNxunzBlXBgrPwg87zaKdmV3Qxbug3vNMNihYRA7D/1AuCqEmizcf4jskfbrhcSNhgQL8MVtXVRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by BL3PR11MB6532.namprd11.prod.outlook.com (2603:10b6:208:38f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Fri, 13 Oct
 2023 13:13:49 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1d18:2488:73b2:e47d]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1d18:2488:73b2:e47d%7]) with mapi id 15.20.6863.046; Fri, 13 Oct 2023
 13:13:49 +0000
Message-ID: <b8d8f917-84f2-7982-a9db-b4832d8b0d51@intel.com>
Date: Fri, 13 Oct 2023 15:13:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/i915: Flush WC GGTT only on required platforms
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20231013103140.12192-1-nirmoy.das@intel.com>
 <ZSkg47slZ25rSQK4@intel.com> <ae8d62c9-ddfb-8913-6b67-681d9cf70978@intel.com>
 <ZSk-X7oe2eVqmuW3@intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZSk-X7oe2eVqmuW3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::16) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|BL3PR11MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e0230d4-ac4a-44a4-b6ad-08dbcbee3d32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: udUf2Y/9Kr+N7jBXgLGvJHdC9W89yElshyGzCs5CJZO92CYGyxH8K0xHKhXU2evxLHDgfDw4NsCNzoxdHGvcaEX5Dp0hhEg0pPRN0Nnt9tGdDkb+F6F+c40FqLchmGFFmRtn5ZyYvNVWrePnwEFV0/rhpxCgN39AuJZbqaezUqoLgIqm69OL+91LmlWnzFOy2gynBDccfX0tApBxXOJdGin6InlRC0/FDwycGWQd1vX7qS/LE/JCIff1OItYqs4FDr8ez+DsRtt5+LIy/rSp2lmdqWtgJFX1VSe5Tj0VVACPI2rgUsR9AdyGIBAxWWeUMqM+PYOoEeQ/4z+opGSN72/WVrDHzSTh978YUWwpFMnqrnpLqah1YbaOlJ9jBjTZO4ergqspKAfa8Qns2Z18K/2FJ98AvCeF9Sy+xh9sfF81+D9gSrEnaB8gQaEaGDFyBuvSgmNzCvCQdHXiBd1bu2vTu+BtDVNxo5OPKVOTueT56dDFjTdhKDOfCzKmKDeMS2ff2N2zPWhAORr74oOsub7j1dna7UsonOPAWh/T2ouGyIQ9mo6aBmNdyZyhPjL0noqKcYYUYtrqbe7pjGnbKz8l7644sNChiGoVNCI+nqMrhXmEX4PcY2MlWMdyLKNPTV1qHAelXuH+iISDjJCH/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(396003)(366004)(39860400002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(6506007)(6486002)(53546011)(44832011)(5660300002)(83380400001)(6666004)(478600001)(4326008)(41300700001)(26005)(66946007)(8676002)(66556008)(8936002)(66574015)(2906002)(54906003)(66476007)(6916009)(316002)(2616005)(38100700002)(31686004)(82960400001)(6512007)(36756003)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXp2STZ4QW1yOTkrdjYzNzNRc0hPbmt0SHdlR2JCeERydnI2QTdWc3lMVVBp?=
 =?utf-8?B?bkdZQjhKWGFWR2hyRjU0YStsZExyeEpveGEwWWZKcFhBWlZxSi9iMkNGR2wy?=
 =?utf-8?B?TnlsTjdhVmVzODE3V1FKK1JGTWdRYmVrVnBOaWNJL1Nlb3FFeDlYUnljeGNy?=
 =?utf-8?B?dkJ6blROWnNhU25GQzFUVzFOOGRtMUZHS3JjSlp3K1MrblFpWGV3Y3RtY2R4?=
 =?utf-8?B?TWtvYTlBY3R3SnY2dXRVNjIzbG9veVlobStVS3dtN29qY2ZoUHdEanJrN2hB?=
 =?utf-8?B?UXUwMU9pUDdORDhubE9DRDNKNEtSL21JaGlBL016MUU5V3NmYmk5YjFVTDM2?=
 =?utf-8?B?a2VDYVVBeUdtQzZPUm5aWktpZXlDZUY0V2QySXQ2K1JVOG1YeU1HVkxHck5O?=
 =?utf-8?B?dzNkTnkwNWRsMVhQRyt1RDJEYzF0WGRkYmtYalhweGZpZzdLV0NwV1V2T3Fq?=
 =?utf-8?B?cnI3NHo4MzVnN21MZENNR2VHU29tS0MxNGFnWjI2WTJUOG9QZEJlMGFYQTBz?=
 =?utf-8?B?MkVaNGZMenVUSlM1NFZRMVVvdC9qU3k2VGk5dXB0Q0hJK3ZZajZSc2tTL3kx?=
 =?utf-8?B?SVovMDNyQ1NhMXR6VHRCY3d1Tk5XYnExMUo1aWsxSERUT280MFpxVGUyUjlr?=
 =?utf-8?B?VWduYjJ0dUo3MnE1U3MwZjMvVDJkVlZVQW1yYlN3Tkc4YnR6NHI1UTRJY0hK?=
 =?utf-8?B?STJNcWR3MEx2ZlFsaDcyZGkyMDM4MEd2My9kYkN2enVsbFh4T0tiempEekJn?=
 =?utf-8?B?ZkFVYmtmWUN2V0RwVGliODF5V3RHSS9GT1NBbWtKWFlBanJlc3lBRHdTMUlT?=
 =?utf-8?B?TXFFMlBkYWJadHF6dlhMZi9rNzJzMEYxR09CU1hObDJHQk80TW1IbG1IUWdt?=
 =?utf-8?B?dyt5VHdZZUdwOGdTajd5RVdVYWtrVnVmZVZiOWtvQ3BQdzlJTERMTWV3MUlQ?=
 =?utf-8?B?cUdwYXhYTFlyOFpaRlphYnE4ckQrMU9RbkxUc1ZKaTB1eCtPVG5pMGFEZ2xw?=
 =?utf-8?B?VVRBUTlOU084UjZNSlhEU01nZjlVbjZ4OTdKbkVrV2FrSngvOU42NTZJRkVQ?=
 =?utf-8?B?T1BDNXV6R1pia0wySnh5dFNNSFBIdVFvT1IwU3lkSUhHbTJIK1E3bGRaSmlk?=
 =?utf-8?B?cFhKemZWL3NrYWp3dFkzNitYNTAyR1NieTdITVNIWUo3SW0rZlNZbzlFdjBR?=
 =?utf-8?B?c3MvVWxLL3NCc09Ba09OY2RqQmpxREpKS3JWajZBMHExc1k1citnWGlZVk5k?=
 =?utf-8?B?V2VTUnRXVU9PODZPQVpoOVZHdU5MVHAzQUl4WVVuRE5Ma3RTYjdVRkNxaWlF?=
 =?utf-8?B?NEhFRDFpQXV4TEVLOEEzWERPZ2NoZzBBc0ZyamhOQUYzV1laV0RCSjZqOFcr?=
 =?utf-8?B?OE1pVktIVUZxbU1vUDNKMTNBd3hDV0U2dkpoRVFWZDZvTU8xTkt4OXNDekRJ?=
 =?utf-8?B?bjhnWW5xT3dQb05hK3o3TkVicmk5YW9SVUtOSmRKSkpvVUV4bVNXblhabjF6?=
 =?utf-8?B?R21EYjJPMFVUUHVib1ZNc1lBSUJJcnR1Y3lhL3B3TENiQTRWZHk1aC82cnJS?=
 =?utf-8?B?aEVNVTM4TVVNVzZ0VVJwZ25OV2RGMXQydkd2U3AwUXViZVpMeHUvQi9SWUc3?=
 =?utf-8?B?NTdnUHlUckkxVC83WFpzbHBoRFkvc0JnNTV0VG1rVnRMWmNhcVhEeUUrdFVo?=
 =?utf-8?B?ZldjVHJyRzR5QVp4dG9OeDdCQXNFY0QyZDBMNDlqZTVSSWh4dXorMll1eHpS?=
 =?utf-8?B?a3VnK2hCRlVBcUVYeTd5NDJaTTdrazBEeXRPaUM0L2FLcGZIVGw2UDh5QUdS?=
 =?utf-8?B?UE55VlYyUUtoaVdwQXRKeTlFZURIV1RqUjBPcUltSTRucmZPT2pjNDlSOTF2?=
 =?utf-8?B?WlptM2UydjN0R0xmZGp4dmlEWkdwK2dKbW9YNUZySFpmejFZQTR2UTFuRnoz?=
 =?utf-8?B?aGRCR1FZeFZwTXdXRmk3QUEzQk4wQ2JDbGZKTnU1ZlpIc2dHcHFhMFBMUkgr?=
 =?utf-8?B?OWhZcHg0TkJ2MWJNOUN5L0l6MkY5OUkyUThUT0Q5QUkvemtiWVB5ZG1MeDVj?=
 =?utf-8?B?UG1wWjFhc2hsZzVQakdaQkN5VnhOYm9SZm94anlnWGx1UmNLNjl1bVNCdTBs?=
 =?utf-8?Q?dUcFfWAksnl1MMAf0fyt33vvn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0230d4-ac4a-44a4-b6ad-08dbcbee3d32
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 13:13:49.4992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uGNcDpar2rrYVV15B8fahG3FwhVJgDrp8SrE03vHWKmJ0sJx8FPW8D98zlf9RJE+ZAw2WwPmj3vbCa1R/i75/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6532
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, John
 Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/13/2023 2:55 PM, Ville Syrjälä wrote:
> On Fri, Oct 13, 2023 at 02:28:21PM +0200, Nirmoy Das wrote:
>> Hi Ville,
>>
>> On 10/13/2023 12:50 PM, Ville Syrjälä wrote:
>>> On Fri, Oct 13, 2023 at 12:31:40PM +0200, Nirmoy Das wrote:
>>>> gen8_ggtt_invalidate() is only needed for limitted set of platforms
>>>> where GGTT is mapped as WC
>>> I know there is supposed to be some kind hw snooping of the ggtt
>>> pte writes to invalidate the tlb, but are we sure GFX_FLSH_CNTL
>>> has no other side effects we depend on?
>> I spent some time searching through the gfxspec. This GFX_FLSH_CNTL
>> register only seems to be for
>>
>> invalidating TLB for GUnit  and (from git log ) we started to do that to
>> enable WC based GGTT updates.
>>
>>
>> So if I am not missing anything obvious then this should be safe.
> OK.
>
> The only code related complaint I have is that you are now duplicating
> that same platform check in two different places. It's always better to
> have a single point of truth instead of two or more, so that there is
> no risk of introducing bugs due to mismatches.

I agree. I will resend with a static helper function to detect that.


Thanks,

Nirmoy

>
>>
>> Regards,
>>
>> Nirmoy
>>
>>>> otherwise this can cause unwanted
>>>> side-effects on XE_HP platforms where GFX_FLSH_CNTL_GEN6 is not
>>>> valid.
>>>>
>>>> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>>>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>>> Cc: John Harrison <john.c.harrison@intel.com>
>>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>>> Cc: <stable@vger.kernel.org> # v6.2+
>>>> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gt/intel_ggtt.c | 6 +++++-
>>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>>> index 4d7d88b92632..c2858d434bce 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>>> @@ -197,13 +197,17 @@ void gen6_ggtt_invalidate(struct i915_ggtt *ggtt)
>>>>    
>>>>    static void gen8_ggtt_invalidate(struct i915_ggtt *ggtt)
>>>>    {
>>>> +	struct drm_i915_private *i915 = ggtt->vm.i915;
>>>>    	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
>>>>    
>>>>    	/*
>>>>    	 * Note that as an uncached mmio write, this will flush the
>>>>    	 * WCB of the writes into the GGTT before it triggers the invalidate.
>>>> +	 *
>>>> +	 * Only perform this when GGTT is mapped as WC, see ggtt_probe_common().
>>>>    	 */
>>>> -	intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6, GFX_FLSH_CNTL_EN);
>>>> +	if (!IS_GEN9_LP(i915) && GRAPHICS_VER(i915) < 11)
>>>> +		intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6, GFX_FLSH_CNTL_EN);
>>>>    }
>>>>    
>>>>    static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
>>>> -- 
>>>> 2.41.0
