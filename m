Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF2D70826A
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 15:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3FD10E0A7;
	Thu, 18 May 2023 13:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C9710E0A1;
 Thu, 18 May 2023 13:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684415687; x=1715951687;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bGLrHo7+J8DPrrehwdIk6FP6zOI0ahYzyYnw9im5FX0=;
 b=BGp9rMzUjy0EVEmwj4tUVH5QT7wN9kPidvgMJnBqynSR7FsfjJuAxdnF
 /ZrZtx+JaiCR8oJLMaqCgryidkgAr9x4xmPAb3+q2RaAwfhhbXr/Gh7x5
 xSwGx3zUdRjPsOxiZDm+QdZI/sQPt1gvQAbQKjGPi+xS1i6scdcE/hTk3
 RUpdjYimLbs36YziUwU4KEAKGtsVo90krq7pfrSH0zdt83VZge82CGY67
 SqN9yTs7nq3mjdpdqZiuHM/pnzlcqnFXOYMBSJx7CawaXFs41uHg1fagP
 JXuQxV1BRVZWFYX9EovQsfZ8LZR96WzWqZthl1e9F1w6V/u3X3uS9TmM/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="349573593"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; d="scan'208";a="349573593"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 06:14:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="679669659"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; d="scan'208";a="679669659"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 18 May 2023 06:14:46 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 06:14:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 06:14:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 18 May 2023 06:14:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPxKE0oXQUXrOlcsjsIxSnEk5Gm9gyqc+hBgzQiaRnKryNY3lwnrJVkCrCYkRBrzUmwRt9JTJEhDHj48sWyedlWel/mXP/6dRX//8KAZezYou+9eWNV0viqnPNHwua8To2ZMwBSM2k6Gc7q8A+PJhQVZNJl3IZX6DSh0htHdVM/ZImWAa9BQxhsviylSqM1nr1JyQDkWHbb9V3X1b7+DrvU3vNFYmIJ0qTYTNQxqUkWuUTDhenKTul8gqqfj455WE0uHK5l/+NlTuBxSJBC5AD5BWhH/oE1WdPBpaLY5qikCOI6GLzXZL/7VHI7RIbwjYl7EoLYQOxXix17FgTxKRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=juL+fajpPpUyd3LYndpxxH7rA63vM363ALIsm5m2buA=;
 b=C2QFWM0wSbYpJrtf1LoY+7oClAtFBCTrPqmWkwbe+53aqrdypT3f3sMF5rVPAG1YJ5zt6xRtn2Jl4Jh942s4MiPo/yIJ9hPO94ie6CAyKbK5IqnSjZgG26rsl89Er05ymxyarm+tn3D5e/5JGuJ9hisz/yAsDDeJ62MQPwRGETWc87D4B5S/G4q9sOgdlYMOtZv9ZbEX+Ott5EXcqeBUiM44tMugbM8aSgV8gAelpFlJg7ZIUKNQch21Vg5WcoKCky0ydEk+gPAk115xpjYgIFl2Ru2HnzRypnXLLU53A6i1/EMByKQ0oyd+4KVtjy04tZw2TmF0euAw5b/pJkvbyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 13:14:44 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::d1b9:3221:bc0d:1a9b]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::d1b9:3221:bc0d:1a9b%7]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 13:14:44 +0000
Message-ID: <d04d4176-437b-8776-639a-a5a287e61839@intel.com>
Date: Thu, 18 May 2023 18:44:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 05/13] drm/i915/intel_cdclk: Add vdsc with bigjoiner
 constraints on min_cdlck
Content-Language: en-US
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230512062417.2584427-1-ankit.k.nautiyal@intel.com>
 <20230512062417.2584427-6-ankit.k.nautiyal@intel.com>
 <ZGJFYziCKeW-vfpF@intel.com> <ZGNWnP1/vWckkAkA@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <ZGNWnP1/vWckkAkA@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::12) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CY8PR11MB7777:EE_
X-MS-Office365-Filtering-Correlation-Id: c09f573c-e1b1-4da3-2eb7-08db57a1d857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wOYmshyNikiAp5owpQbqkGqt5mQ6gecJCfPV/trlImql1SX/s1aFougukqKlBbJP/cbt2USH0Ob7a9uY5dHI3z/xbL6KEltFDO1h7ppUU2+oyLS896Zb4waMlLK7GAFcde4Q7oGbo2MUn/G4SfqHSH2th+hJmjb09cDq9K1Hqmz7wAqUrTqlK2u0FOBu2ccKFyb4L6bH1UOSH5wp4+VgWPQRISYINpIY6uHOD0+DLMF+qMGo7QtJfM5Jd2J8m40nBRjsUHJFfoDP11C9TGUhNl+YGEXJ1puilv0ywoFUjFSOqw9enNPlsh4Xm1MMJOg0VrHtS4hB445olzKo68C1Do/pLqXZfScUJJH4OeUIGGb/avwM1fWhK7dg9kOlYn90Ztnkgsx6YOK+xn7+ee5hyebMEErJbwdibrsxUXwyxZtPa2t/54/FgdRvjgIRUFdJ2xysMNZYGSQ5oN9e3b91tcDKcuLjhWfa+bnSVadjUKjHzXNjIqCCxg0JB8AILgRB1owVwmtZBKt4OFOOALVNQ7Gfkz25KeogjEwcEOOY9XHXe+vhz5r4NZKdT68zzNO9Ww8NFp4JbcqDZliPfswBe3cu5jB4GphzyvqbDDoX8OJTr49fFr0LITQbqug5RMIOjEjidKjY44wR9kizJmvLNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(136003)(346002)(366004)(396003)(451199021)(66476007)(6666004)(66946007)(66556008)(110136005)(31686004)(55236004)(53546011)(6486002)(316002)(4326008)(478600001)(41300700001)(5660300002)(186003)(8936002)(26005)(8676002)(6506007)(6512007)(83380400001)(66574015)(36756003)(2906002)(2616005)(38100700002)(82960400001)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnBYZlZzRHZIcTF2R3NYMXJTTnA1RGpPWFlBUFlWeGc0N3R0Zm5LNkNDdlBn?=
 =?utf-8?B?ODBoMS90a1lQVkNiZFRicHppZHhFcFFGdUp2NzFEaVk1NVA1ZFk3a1FXOFhZ?=
 =?utf-8?B?NWV6eFE5MVFsSFJxbHQvVkxSTmw5b29TalNLa25nQTNsQ2lscmV1bTZxZ0JX?=
 =?utf-8?B?aUp0SFhHSW5OSVZ3VkpieHhSbVh2WXR5b1k2bURzM3VpcFQ5Ulh4SEdXYm5x?=
 =?utf-8?B?Wi9BS0cyT1pVRmJESjB1S21ZYjJhTmQ3Sm9xK2c5YlRyVUoxWnY0VUdGQWND?=
 =?utf-8?B?Mkswc2pqOU9XODJSL042K1NOYUMvMnhwc0hraC9YSkpjNG5Bcjg3Q3dsUnZ6?=
 =?utf-8?B?dEtodkQ0NEVWL1FxM0hXZkY0Ri9UMDkzVGFHaEtTemR5ZkdFV2NZSmZ4WHpr?=
 =?utf-8?B?QzhDZkt0djlqaThTUkx4cUo2WjQ4L2h4VkFFZk1MUjRSYkI3am04M0VjV0Y1?=
 =?utf-8?B?TW52YUl5OFVsWXh0b0lxM2IwVSt4TnpldGZqM2NuVUUyanpEWGZncTIya0k3?=
 =?utf-8?B?U3dsUDBzY3F6NzlJR1hGTEhHcVVBaXlEMDgxeGdPSG5BL3VMNkZ4eUtIb3JV?=
 =?utf-8?B?SnBBY3dzV0w4NjQ0Z05XYURNa2hhakExOVhJYXhnN1dMSVYvMGlhZlNpTVFa?=
 =?utf-8?B?VUJ1UUZ6QlZVY2dlM3dlalp4bHQ1WTVhK0x5V1hTSVlNNm5vRk5VaGhqTFlG?=
 =?utf-8?B?VGtxNEZwMU5zbXc0RGF6TlZtVWNYMU5KdDh1TFo4cUJSRm5tMFdnYjhKNExt?=
 =?utf-8?B?Q2RQK0VZRURycDk0U29lQUg4RmphMW9kOTY3R3k0dzlNR1dudmJSSHZaMVJa?=
 =?utf-8?B?dHFVWFo1ZzNwbFc5emZuNHVHUy9QamtOc0ZZeVJMcTJOM1hjUUI5dVE1a255?=
 =?utf-8?B?MXJ0eW84bmdOMi9TVitBOERUajFGRGlJTE9BbVBUdFl6MVVQU0JmNGQ2Nytw?=
 =?utf-8?B?dXNoRFFBWlBacUsrSkZteWZTdlk0UDBEeW0xK0pqQ2V3bGpMaVJlbmszdzUw?=
 =?utf-8?B?OFZqNk9WSzVwYlc3UUtrU3JibzFEaWtLeXdoN2owbXhQNWRpQjJuYWJkNyt2?=
 =?utf-8?B?dlZtNmVmRVdka1Z2VkR1Vzh5bExReUV6NmhlNWVJNVBqMGQyNUw2LzdXZ1pL?=
 =?utf-8?B?SVlBVHZlK2s5MFREb0ZwVmYvZCtUUUU5T3RFUDRudUxiMlZ0bTh5bXpXbXp3?=
 =?utf-8?B?K21TTEIxRHA2L0orTjB6bWIzWWJ5SFpIdG1yQzZ1WjdlZ3lwSWQ4SXZxdUtl?=
 =?utf-8?B?elNSakVHSEJCMFJNeENaREtMM00vWm42ZCtTZ2JHZ0tCZGZGaWp3NWR1eElS?=
 =?utf-8?B?dDJDTVJzVjUzYkhTaHcvSTIzdFMrRGFFbmtvdlA3VEFmQXRsNENGMlAzYys0?=
 =?utf-8?B?aFlDQllsWWVBVVFVS0hVeFF0M2xubk0xM2FucHJRamVXUzM1Y1R0V0NacE9X?=
 =?utf-8?B?dUdkUFhZMTI2SEFwNk9PSjZOUGZ2TjNhc0YvdUlvY0VIaW9BdlozU1llSGFt?=
 =?utf-8?B?R2pZbXd3cEhZdGpLbWN5amhMdjFDSEoydTlyNy81WVVNUjJCQXZraVNsZjlq?=
 =?utf-8?B?ZjlQOVVNU2VobE9kQnlITDVzMUVIKzJRQ0ZYcExLUWd1d0pJSGFUQ0txcVdI?=
 =?utf-8?B?MXBUT1IxUzRRbG9RS3EyanJoN2NSdXBRN09MWWdNTVJoMFpXMkt6TkdkMlo2?=
 =?utf-8?B?RjdITXVhRENBK2tpUXVSZXU4MHYxZzFhWnNXemV6U0hxZFZ3UXE3MVA1azNs?=
 =?utf-8?B?ZjFxb1dBUWxXZDI1UnE3K1hPUkpJNkh3bHF6Z0RyTk9xR2ZFZlZJTTVaNzZN?=
 =?utf-8?B?Yy9LYWRoWGpPN3BBL2gyWk9wSVRrNmdMY2ZjWjFBWHQwRjc3dnhOVWU3OUlK?=
 =?utf-8?B?d3JzVnZ0UmU4NXczY01rR1JGZnFyNU82UUhycVRaeVdyUzBka1gvV1dncUlP?=
 =?utf-8?B?cE1Ld1U0cHg3djJtcm5XNnZsN2VNdC9OZUNINkJWQkJ2SVA0UEYvcHBteGk0?=
 =?utf-8?B?VkZ6Umw3emwxOE1nVS9lM3lVY2xBTEZyckVrcFp6VVVhVkVFZXB6TEFUVm82?=
 =?utf-8?B?V3hucTF1Z0ZHazNZZURnTTdqSXFnUTdibTNzNWFoSjJsdHBJZUFMTjBCMWFL?=
 =?utf-8?B?N21KN05FTHFlT3hOeUJFNkJocGRoZFY4c1VRU1JMbE5SMXFwTTU0OGhCZVRP?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c09f573c-e1b1-4da3-2eb7-08db57a1d857
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 13:14:43.9055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qUTMyNZDtX1waWK/V0T5RuJSMCdRorqz84CWHrRYpaUhQ1xfYilA0Jt8YNC9j7PtDgHf6LuZD9URXgifK+Xy9TuRp6FvVNLCuQlSlLWMC6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7777
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
Cc: intel-gfx@lists.freedesktop.org, anusha.srivatsa@intel.com,
 navaremanasi@google.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Ville and Stan for the comments.

I agree with the changes in _plane_min_cdclk and 
intel_pixel_rate_to_cdclk regarding PPC.

But I am a little confused for about the pixel clock.

Please find my comments inline:


On 5/16/2023 3:41 PM, Lisovskiy, Stanislav wrote:
> On Mon, May 15, 2023 at 05:44:51PM +0300, Ville Syrjälä wrote:
>> On Fri, May 12, 2023 at 11:54:09AM +0530, Ankit Nautiyal wrote:
>>> As per Bsepc:49259, Bigjoiner BW check puts restriction on the
>>> compressed bpp for a given CDCLK, pixelclock in cases where
>>> Bigjoiner + DSC are used.
>>>
>>> Currently compressed bpp is computed first, and it is ensured that
>>> the bpp will work at least with the max CDCLK freq.
>>>
>>> Since the CDCLK is computed later, lets account for Bigjoiner BW
>>> check while calculating Min CDCLK.
>>>
>>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/display/intel_cdclk.c | 49 ++++++++++++++++++----
>>>   1 file changed, 42 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
>>> index 6bed75f1541a..3532640c5027 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
>>> @@ -2520,6 +2520,46 @@ static int intel_planes_min_cdclk(const struct intel_crtc_state *crtc_state)
>>>   	return min_cdclk;
>>>   }
>>>   
>>> +static int intel_vdsc_min_cdclk(const struct intel_crtc_state *crtc_state)
>>> +{
>>> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
>>> +	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
>>> +	int min_cdclk = 0;
>>> +
>>> +	/*
>>> +	 * When we decide to use only one VDSC engine, since
>>> +	 * each VDSC operates with 1 ppc throughput, pixel clock
>>> +	 * cannot be higher than the VDSC clock (cdclk)
>>> +	 */
>>> +	if (!crtc_state->dsc.dsc_split)
>>> +		min_cdclk = max(min_cdclk, (int)crtc_state->pixel_rate);
>>> +
>>> +	if (crtc_state->bigjoiner_pipes) {
>>> +		/*
>>> +		 * According to Bigjoiner bw check:
>>> +		 * compressed_bpp <= PPC * CDCLK * Big joiner Interface bits / Pixel clock
>>> +		 *
>>> +		 * We have already computed compressed_bpp, so now compute the min CDCLK that
>>> +		 * is required to support this compressed_bpp.
>>> +		 *
>>> +		 * => CDCLK >= compressed_bpp * Pixel clock / (PPC * Bigjoiner Interface bits)
>>> +		 *
>>> +		 * Since Num of pipes joined = 2, and PPC = 2 with bigjoiner
>>> +		 * => CDCLK >= compressed_bpp * pixel_rate  / Bigjoiner Interface bits
>>> +		 *
>>> +		 * #TODO Bspec mentions to account for FEC overhead while using pixel clock.
>>> +		 * Check if we need to use FEC overhead in the above calculations.
>>> +		 */
>>> +		int bigjoiner_interface_bits = DISPLAY_VER(i915) > 13 ? 36 : 24;
>>> +		int min_cdclk_bj = crtc_state->dsc.compressed_bpp * crtc_state->pixel_rate /
>>> +				   bigjoiner_interface_bits;
>> pixel_rate is the downscale adjusted thing, so it doesn't seem
>> like the correct thing to use here.
>>
>> Hmm. Assuming that the single VDSC engine really throttles the entire
>> pipe to 1 PPC then we should probably account for the 1 vs. 2 PPC
>> difference in *_plane_min_cdclk() and intel_pixel_rate_to_cdclk()
>> directly. Currently all of those assume 2 PPC.

Hmm alright,  I do see in plane_min_cdclk and intel_pixel_rate_to_cdclk 
we assume 2 PPC.

So I can add a check for the dsc_split and use 1 PPC/2PPC  in the two 
functions as a separate patch perhaps.


> Main thing is to properly align that one you propose above with that check,
> where we decide how many VDSC engines to use:
>
>          /*
>           * VDSC engine operates at 1 Pixel per clock, so if peak pixel rate
>           * is greater than the maximum Cdclock and if slice count is even
>           * then we need to use 2 VDSC instances.
>           */
>          if (adjusted_mode->crtc_clock > dev_priv->max_cdclk_freq) {
>                  if (pipe_config->dsc.slice_count > 1) {
>                          pipe_config->dsc.dsc_split = true;
>                  } else {
>                          drm_dbg_kms(&dev_priv->drm,
>                                      "Cannot split stream to use 2 VDSC instances\n");
>                          return -EINVAL;
>                  }
>          }
>
> Otherwise I agree that we should do that check preferrably in *_plane_min_cdclk
> and use plane data rate which is adjusted after scaling is applied(I think we even have correspondent function there)
> It is strange that scaling wasn't mentioned in BSpec formula.
> I would also say that we should account for number of slices(i.e VDSC engines) now only in Bigjoiner case, but always, as I understand that number can be different not only for Bigjoiner cases.
>
> Stan
>
Hmm does it mean:

if (!crtc_state->dsc.dsc_split) {

         if (bigjoiner)

             min_cdclk = compressed_bpp * Pixel clock / (PPC * Bigjoiner 
Interface bits);

     else

             min_cdclk = compressed_bpp * Pixel clock;

}

For Pixel clock, should it not be crtc_state->hw.adjusted_mode->clock ?

Regards,

Ankit


>>> +
>>> +		min_cdclk = max(min_cdclk, min_cdclk_bj);
>>> +	}
>>> +
>>> +	return min_cdclk;
>>> +}
>>> +
>>>   int intel_crtc_compute_min_cdclk(const struct intel_crtc_state *crtc_state)
>>>   {
>>>   	struct drm_i915_private *dev_priv =
>>> @@ -2591,13 +2631,8 @@ int intel_crtc_compute_min_cdclk(const struct intel_crtc_state *crtc_state)
>>>   	/* Account for additional needs from the planes */
>>>   	min_cdclk = max(intel_planes_min_cdclk(crtc_state), min_cdclk);
>>>   
>>> -	/*
>>> -	 * When we decide to use only one VDSC engine, since
>>> -	 * each VDSC operates with 1 ppc throughput, pixel clock
>>> -	 * cannot be higher than the VDSC clock (cdclk)
>>> -	 */
>>> -	if (crtc_state->dsc.compression_enable && !crtc_state->dsc.dsc_split)
>>> -		min_cdclk = max(min_cdclk, (int)crtc_state->pixel_rate);
>>> +	if (crtc_state->dsc.compression_enable)
>>> +		min_cdclk = max(min_cdclk, intel_vdsc_min_cdclk(crtc_state));
>>>   
>>>   	/*
>>>   	 * HACK. Currently for TGL/DG2 platforms we calculate
>>> -- 
>>> 2.25.1
>> -- 
>> Ville Syrjälä
>> Intel
