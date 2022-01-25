Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A2549B393
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 13:17:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A3010F3E6;
	Tue, 25 Jan 2022 12:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0A610F3E5;
 Tue, 25 Jan 2022 12:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643113067; x=1674649067;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KaW1D8f5/+7ZTwuHAURvGRj8/S+mSZIGmECoaXl3t4I=;
 b=V6EbWAzagty9xpQyMGRyK2zu7AhE+tClk0cJwjXhbs651Z/8mUuLiwN5
 kIJ7AFVcgbuWhgJg+svX1Ddre8HqfS0RFQ9nS75+CTZSy1RD0039nqi34
 WFRq+V44vjjsrHLCRulYHKiWULfd00YUwCO75jeXJRt1Oed2zX5t5fXQS
 CB3RCuCN4bkAnO6UMW/WVu2r3fHj8O3vICeh3fZLmM2n6snxV9NGX+GQu
 uoMTRfsKIrw8diZ1Kf9jSTMKXSo8Kh/P9nGqvYzWr/12EsbEAzPW8TkuX
 qKeAtq7nxrK87IxNDwjBC9c8/3eV3E7/LzGuCs9Tt00YGLEEW/Itzlo01 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="229861533"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="229861533"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 04:17:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="769016402"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga005.fm.intel.com with ESMTP; 25 Jan 2022 04:17:45 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 25 Jan 2022 04:17:44 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 25 Jan 2022 04:17:44 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 25 Jan 2022 04:17:44 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 25 Jan 2022 04:17:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itFFn9fa7BD0jSfk9rUAjfOetYOEtb8ioAECxMkYwDVD56TtjDiOLH/PQRmbI/6aBa+DyhdRLHl5PSJy0/tKYe99Zs1n4uDcZ0AR9otpw89KP6CkD5dY/f5/WdSWQ0Yhvnpnc+/bX8CiG5zykgvMfHIqU+7e2MmU+Rn4bU9TeOxEiAt6mlV1nfXRtB/qzLJEVeTsfbj9pZA0ArNx5W2W1+cafb/sivlo2NiLhQKHHVaUlWOh3W79lKg4iWb5HY2iByKKgKgZUoPf1JnUc7LQ1bZelCCQbtTBctMysLOSGilUQiWPmm4FzrjkkP6SGfNcXx0o4EherrKLsp0OnzA+gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GrGHUSar8qZX70ILA6YLT1V+LBkOQPbwaQS/G4J35AU=;
 b=bkjke1r8txLzL3awGkLnijX78BKLF3fBmAVaLNapU+rEWBu+12vVOjB37hQ1iayS6y0+AFERpxThiWQBRqc6UaFuN2HRwOMQlxjC1F0N/GVY8DYJsdeEXvryPh4yrfl1qS7ju/IFXzG89nkNJScSxE+oZxhS/rm6ftN4LTfQBfpVLOWpAFcOmYsUqFSYyYor5FsbeySuoKohMjHz9nsWB8BKxu9v+CpHrGOwNax/nvbanOQeZZD7k7DXv8Y2/YLWgpFUNPgaubjDoO0IoewdoxS+00/Fdn/i3sUyBJLvMRJxdp9Z7gZVZDgZaG8DvXWVr+RSJXmd61AA47qr5tmNhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DM5PR11MB1628.namprd11.prod.outlook.com (2603:10b6:4:c::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.12; Tue, 25 Jan 2022 12:17:40 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::8989:c0bd:dd1f:a432]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::8989:c0bd:dd1f:a432%5]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 12:17:40 +0000
Message-ID: <ca068756-0d7c-1925-12ff-c218e81e78a2@intel.com>
Date: Tue, 25 Jan 2022 17:47:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [PATCH 1/3] drm/i915_hdmi: Fix the definition of
 intel_hdmi_dsc_get_bpp
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20220125085801.1025521-1-ankit.k.nautiyal@intel.com>
 <20220125085801.1025521-2-ankit.k.nautiyal@intel.com>
 <87fspc173e.fsf@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <87fspc173e.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::24) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4245aa03-fabe-4cba-3e04-08d9dffcae4b
X-MS-TrafficTypeDiagnostic: DM5PR11MB1628:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR11MB16282C590C815466C8747432CE5F9@DM5PR11MB1628.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OqxmqRn8kTzX6ktVH/oESLpS8Xm0elAPuO68FM40p5arma/rAJ5Pzno7T/8Q+00edtbLxVSrR6UNeQO0xaPBHXnOA2Oe0DLtDsKFR4qPBSSTRXXdP7i936eMXNGAahPUg/YW6yqUJe+mF16mGwwuO/AngMLjRaCaIrw/hLJ0C+j8LwEdQxOjIZKm+HV49uAp0xuGw5GerQ/k8m3pw4lVMxlbgnJlqQbdK60Rx5yygVp4xpO38fNMNc5kqwlEKsG4B8JbS0jFnSxAQSK+NfockGDWwuObIKhHL5vuG5UcZXKLmoTRJexvMfYuZxy68mTMsLSwZj5Mz3gc/e+ync5ckJfYdZCJ9NOvG7/CSpJUM8Jq9lFdsCduXmrbdfBBRt7BF/W5hWMk3451XPBdOYn/BW/sjVdZlh7ds6qE7gcfJUfTKJCJaQQdBLyXUUbgnyhkuXSK3isyGndF3Z6+UAQrl284vgmNqr2sRwuay4dUUQ7XKx0KS2hNUoRZHjITxtjnhrkMRatuHB6hSfKYajUNAKn7enj9hWwbS9ZdR19w8rMenvTr/yJn+ybqYBxL+zrZqmtIUO5sQLNzOklxNHl85ln4t45GqhxYd58RM3VQDNf3nE9BcrZiopnT9jXg9qU4ctReYgLeWuacHZl9EZKYwxmKvllbqXz4qjZHjSh/4LyagajtxnEAt4kYuXD4rySkO7JayuoECKPH7nIaRJ39jIuAso1IFJF2cF4uvkR3Mgw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(2906002)(6506007)(316002)(31696002)(2616005)(66946007)(66476007)(66556008)(186003)(31686004)(4326008)(8936002)(38100700002)(82960400001)(508600001)(36756003)(6666004)(83380400001)(5660300002)(26005)(6486002)(6512007)(8676002)(55236004)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHRNTkhZZXcvUmdCeFQ4a1l0VHNHYTFyYjhhY2NRcy9ObEJZQ3ZidWxMOTEw?=
 =?utf-8?B?UXdpeldKYWlzOTVDMFhnUTQybHZ0T2JMMStSZW1rMU0xbmtnWEdZaFI1dGdq?=
 =?utf-8?B?VWdRKzA1UWU5YnJZMkwzeFFsR3NTbFB0WFlRS0R1YTNEOFRtZHpUdVpLejFM?=
 =?utf-8?B?TTdKM3N4OS9QU240MFJJT1FmWEkwUUxQZnBGaVRUakplY2pITGRnc3Y4Kzcz?=
 =?utf-8?B?Y3VReGxWUTR2c1Z2cDlNWHp5OGRmUVY0UGF1dHhNeFFMRGxaSHJ2Ry9Gc3Rv?=
 =?utf-8?B?OWdsY1NRVUdpS2hoT2d5WFZPSllXMHZOdldIK3dPQXlNMWFWSHA3UmwzQ2tT?=
 =?utf-8?B?MDRwNDRxS0FFQTQzT3c4Q3NaZ0pTQmNjc0FYMUdqd3ZoU3l2T1Rodkhpc2Vs?=
 =?utf-8?B?SlpEbGtmNkIxeDU5UTQ3ZmpURDZPWmhHNjJYa1lubWxNQ0xPSmtFOXpBZEU4?=
 =?utf-8?B?RXRSNGpjaTFiazRzbUtsQXl5VEJHakFscGk3TEVFcFRRcTBnbERwMitvSUp5?=
 =?utf-8?B?Z3YzSlZlanVtckNNMVpNSVBUM3hoRGQ3a1JCWDJ3VTZNQ2o3VTc5MXBKS09F?=
 =?utf-8?B?eXhjZmpHSHZmTHowN1dkdUFZU3h0OCsvOTZQaHhKek4zRE96NW1odml0SDVx?=
 =?utf-8?B?cWhQazJOc1czNXUrUnBsWHQrYUc2MjZlY0NNMDRhV1daaXdVaUV5NiswY2Rs?=
 =?utf-8?B?dlBiUDRkZGdmcXdMUmhaMFQ4T0p0S2d2RTR2eTdINlVQcnkxc1dHaXZ5aE44?=
 =?utf-8?B?QndjSEtjbDRBdXdlcmlScHVnVW5UYURDWDF6MmVPS1VtaHF4UnJpczZDWU5O?=
 =?utf-8?B?NHF6REVzb3NWeW5GZE5aMGNtS2d3a3lRVEtsZG1XU21uQ09hQUxkZThPNXhj?=
 =?utf-8?B?blBrK21zTCtyMkdoUVIyMnk1MTdVUTl3cTZlaXlEa1h1dzJEakJJZ1hGWkZm?=
 =?utf-8?B?M0xkQjdRTFk1QlU5MWhQV3NNcTRSU3RTQkFKS2YrVVdYRmo1SWRQcXIvTzZn?=
 =?utf-8?B?NEpGeEdGNXZnS1ZJS2NhNEdiNGtzeXRlQ0h1WlRpUnpnSnM5cENpa3lUYVl2?=
 =?utf-8?B?ZXdMbjRZbnpRclkxUTA4c3FRUGNhdDh4VU5yOUVudUh1VkFxN3J5bDFmTTRj?=
 =?utf-8?B?QW00R1ZpTnlOZ3V6S0NWL003K09HUTdDWjQwZmlsZHAycSt6OEs3QVRTd3Jw?=
 =?utf-8?B?N3BDYnpnSjhDcWViM2syTWtqcVRsT05yV3pRUEU0aGdxUm5PMitLbC9pVDBx?=
 =?utf-8?B?WFo5ck53RXljbDQxRlJjUUsvQXRzRlhjQzNINjB5bjNYSk1aZjRHdXdja2gy?=
 =?utf-8?B?bU5Zb0dEd3RSNU0vV20rOVB1TDNmTUZaNmtLOS9MamZidG8zZVRldGptNVo3?=
 =?utf-8?B?ZG5mcFE5T1kyd0pWcG5vYzdDSFNFQ1NEMlUzSTJDUDA4Z2poN0RySUs3d2c1?=
 =?utf-8?B?RW5wdmhNWWNtQ0d0dHd1QmV1UGw0WXNlejF3OGpnSHcrTnMwUklkeTlWanlz?=
 =?utf-8?B?WUQ5VHpReE1IYUxiRlZMVUdiZURYNjR1OUIzdWdlV0U3T1o3YTFzSEFIaGE2?=
 =?utf-8?B?TlBpZUVvSmFWNFNtaTJQRHhlbUdRS2pVQmxaalBJNmFSWWJhTytxbXpPVE41?=
 =?utf-8?B?VFViZ2d0SjZWbkZyOFBoN0ZDb3QyRjlObGJhTjNhSWgzZXdIN2pQK1Yyc2dy?=
 =?utf-8?B?cUhzWEZFYkF0TVBkdkR0S0IxTU1MZGh2cUsrOUtDNTBIaTJGOCs2WkFYQ1d2?=
 =?utf-8?B?cjZLWEdveVNPOEVJeXpGV2lEUFkrdEtEQk1PQnpoWlVVRm5tOUtkQ3puSzlI?=
 =?utf-8?B?TkkxLzN1eWx3d3YyMUdNOEVmd0F6em13MXRqK2E3SVhwMEc0bFFIc2w4Z2hO?=
 =?utf-8?B?aTBWV2NBZHBhMXZ3KzRhbldyZW9KelVVQmRWUXJVOFptTmdFTFphdS9LRVFM?=
 =?utf-8?B?MFlTT0U5Qy9JWHVId2RXUFZueG1FczBBL0haWWVINk96VytvMklJOG13WTkx?=
 =?utf-8?B?dXBvRzdNeWVMUHdCVnlxWlN4UGlFVVViOFBOZ2dHRlBoc01iOXFhZWNRUzl1?=
 =?utf-8?B?WmwrSlZjejkwSVpUazl1aVpSdFRZdW5pVUF5b1B1UGhNQ2ltWEFwM0N0eGZM?=
 =?utf-8?B?RkVxRlNvMVo4VlJ3MjV4QUp1ejVBcE5mTG00UTBVK2g4eG1kUHU4SnJaZGxK?=
 =?utf-8?B?S1JJSGFyL0srTGhGbGZGZlRTc3NyKzNxOTNDNDVQNGE4Y2ErUnpFUXEzdzdi?=
 =?utf-8?B?ajR1L2FRMjZ0MlZZU3NoRWIvYzdRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4245aa03-fabe-4cba-3e04-08d9dffcae4b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 12:17:40.1992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/dSGWmO793ofusEpEr4i4+XYjfaLXAlaZRY7q5MVH//Foq/2rvZMcxQA9Kc//PMKYkPOVcJ4kMDp7IJs5dU3NZf22v3zLu7dKyW4E+kd3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1628
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/25/2022 3:15 PM, Jani Nikula wrote:
> On Tue, 25 Jan 2022, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
>> Fix the data-type of the argument output_format to enum, for the
>> function intel_hdmi_dsc_get_bpp.
> The subject prefix should be "drm/i915/hdmi:".
Thanks for pointing it out. Will fix this.
>
>> Fixes: 6e6cb758e035 ("drm/i915: Add helper functions for calculating DSC
>> parameters for HDMI2.1")
> The Fixes: tag should not be wrapped.
Noted.
>
> Superfluous blank line.

I think I just copy pasted from drm fixes, without taking care of this. 
Will fix this.

>
>> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: "Ville Syrj_l_" <ville.syrjala@linux.intel.com>
>> Cc: "Jos_ Roberto de Souza" <jose.souza@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Werner Sembach <wse@tuxedocomputers.com>
>> Cc: Aditya Swarup <aditya.swarup@intel.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Please consider trimming the Cc lines manually, this is quite excessive
> for a patch this simple.
Noted. Will take care in next version.
>
>> Cc: <stable@vger.kernel.org> # v5.12+
> No, we don't really want to backport this stuff to stable. There's no
> functional impact here.
Got it.
> Superfluous blank line.
Thanks for catching this, will remove.
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_hdmi.c | 4 ++--
>>   drivers/gpu/drm/i915/display/intel_hdmi.h | 5 +++--
>>   2 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
>> index 45cf0ab04009..381a9de3a015 100644
>> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
>> @@ -3126,8 +3126,8 @@ intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
>>    */
>>   int
>>   intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
>> -		       int output_format, bool hdmi_all_bpp,
>> -		       int hdmi_max_chunk_bytes)
>> +		       enum intel_output_format output_format,
>> +		       bool hdmi_all_bpp, int hdmi_max_chunk_bytes)
>>   {
>>   	int max_dsc_bpp, min_dsc_bpp;
>>   	int target_bytes;
>> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h b/drivers/gpu/drm/i915/display/intel_hdmi.h
>> index b577c38fa90c..fe40e49d2962 100644
>> --- a/drivers/gpu/drm/i915/display/intel_hdmi.h
>> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
>> @@ -10,6 +10,7 @@
>>   #include <linux/types.h>
>>   
>>   #include "i915_reg.h"
>> +#include "intel_display_types.h"
> Please avoid including headers from other headers if at all possible.
>
> Here we can forward declare
>
> enum intel_output_format;
>
> along with the other forward declarations below. Strictly speaking it's
> not standards compliant to forward declare enums but it does work and we
> use it all over the place.
>
> BR,
> Jani.

Right that make sense, will get rid of the header-file and forward 
declare the enum.

Thanks for the inputs Jani. Will address all of these in the next version.

Regards,

Ankit

>
>>   
>>   struct drm_connector;
>>   struct drm_encoder;
>> @@ -49,8 +50,8 @@ bool intel_hdmi_limited_color_range(const struct intel_crtc_state *crtc_state,
>>   bool intel_hdmi_bpc_possible(const struct intel_crtc_state *crtc_state,
>>   			     int bpc, bool has_hdmi_sink, bool ycbcr420_output);
>>   int intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width,
>> -			   int num_slices, int output_format, bool hdmi_all_bpp,
>> -			   int hdmi_max_chunk_bytes);
>> +			   int num_slices, enum intel_output_format output_format,
>> +			   bool hdmi_all_bpp, int hdmi_max_chunk_bytes);
>>   int intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
>>   				  int src_max_slices, int src_max_slice_width,
>>   				  int hdmi_max_slices, int hdmi_throughput);
