Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1877556C5A2
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 03:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5538710E164;
	Sat,  9 Jul 2022 01:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD1910E0AD;
 Sat,  9 Jul 2022 01:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657329298; x=1688865298;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cgoViD8rfjKMPEomH1xXRoNjBqeADAOjMJkmnN3O3/o=;
 b=HIfPst7rrAeoj/eAI83cCSQ1OAxe8bnqsYpfOKsUHsVjcOXzfjSXDHEp
 4iehwJYBMlCSfagbimWWN9Hb3631N+3TotkzNGygjfXu2sTv4UHGlYk+B
 vtcwQL/Re8Zf71RN2XBuLSrhau+Ycz81JHyLt9HGWwEsoWJacMK//8xMS
 mze/ZrpbkChea+ASozTgm9nu1L6UPK8UvA3sRJbZqi6UoUcQyiLWdN6Or
 b9Z4hrCGmchfhEWDJI4ZPh0Bs/ymL70Gc3bnE7PRnWM79aDiZ5IBu1YUQ
 /t5vmNmt6bKVLOJOk0GHNIJZh5l6tHiUhVQlKMY/SjT5ppx6M+mQFxNyL A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="309985048"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; d="scan'208";a="309985048"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 18:14:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; d="scan'208";a="621434230"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 08 Jul 2022 18:14:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Jul 2022 18:14:57 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Jul 2022 18:14:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 8 Jul 2022 18:14:56 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 8 Jul 2022 18:14:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKLLg6/NiEI1TU5ctF4Zj4o6LbinphkkbYaokabjg/KbhYQRAdZyo6hu8vjjmHjvJ0FtmhnSd44PzZf11Jw+VwZhgX/CwRHiYwxr1h0UR5CPfTIvwwzUtLvVw1WPelSMM5yB35FLrLLQPl7bpRvWXFIM0ld8Gl1NF88vdZIe3pqiCdUlFJkw8mjSYWomsxJWELH1BEgSW6Kca+HE0qknqJvrV5TdKQS8e0cCov4+OEnUwsMmbLOM8o8VbfB0WrL8aYG+MRLpz0pInvyWka3jUf65q8hhwYCSipzKflF2eRIswqz1hsHkVdb4O+5egFokcjgZjAdPeTW1OgkoEttOqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lxMha7VADHIKOkHtwMnb3tf/ZRaghcA5WPQJdP3ixk=;
 b=R4EOfNFdcnxecGf2PbXaE78+eGcbh8a1Ah1u+4VqaRvBien1vv76YdqyrsjV2EbF9lejJl/RWeoeoeiUZ9cOFvWTcEfglKo+J+Vab/s0qJicvG65uPF40xD/ioXPsvrBNfIUPiXmj5ALJOHagGIl5agkYben877FDibZpXLUjiR5+H6tjOlUpDjRjiPXe6E72bbiaw4OUtAN+bIRZHutAfcJloGhlEZt0jVw5XDq+4/f9sfSz+V5c1GJYZOPnCyrlThknJCUE/P2zKUHL43bNI33EAJZ5XPf6DNXii3YQT6jRlGe9+G3+k9vwEa+OB+1qCxbaHdef+3YtRr1/jjSCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4514.namprd11.prod.outlook.com (2603:10b6:5:2a3::17)
 by CH0PR11MB5361.namprd11.prod.outlook.com (2603:10b6:610:b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Sat, 9 Jul
 2022 01:14:54 +0000
Received: from DM6PR11MB4514.namprd11.prod.outlook.com
 ([fe80::427:3e51:a2cb:fb00]) by DM6PR11MB4514.namprd11.prod.outlook.com
 ([fe80::427:3e51:a2cb:fb00%6]) with mapi id 15.20.5417.016; Sat, 9 Jul 2022
 01:14:54 +0000
Message-ID: <00202645-2a89-aa99-16a0-fd2692d7afbf@intel.com>
Date: Fri, 8 Jul 2022 18:14:51 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC] drm/i915/huc: better define HuC status getparam possible
 return values.
Content-Language: en-US
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220708234841.941229-1-daniele.ceraolospurio@intel.com>
From: "Ye, Tony" <tony.ye@intel.com>
In-Reply-To: <20220708234841.941229-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::46) To DM6PR11MB4514.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f628ca9b-d97c-4f62-fe8f-08da61486e2a
X-MS-TrafficTypeDiagnostic: CH0PR11MB5361:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XryHOD5ykQjXq3RqUC7eSsQ27wmi5fRZMTUqPZ9JsLcxsVe5UZKhL8Djgjg/QZftCmQs4/wxo+3W/zf4ekQrgqPguFUM1p3kF84LAqbwM+Ci5iWN6ksXRwJN93HSZFkOYlNoO+Mwt53lsUHIZWHZyn32KmrtKHODN1z+vjBTtiu7rNFK/jm78jZhplaLJfd8HjS4GeJB9a8VEB4qbBL8QWXjAwsORdnuRh7f2Tu/6jCJHyMAMby+UC1ZMu9fw3yWrwZq3QLmq5kctE5WQoU65KrYpRsZADV+cfRt/PUv8F7pP2aVeOkkwvh8hfFNoncPij9zkjOSTgRGc99krRLnkdkJja35jI9xQqVdhCNtOyEJwF+sIJL6fykgmWEjGoZDqCy2kWiuUsM3xPrHflnnkcVzY1CgCV1i/Uo+y00EzConLn06lf/oR7/SJfcj2jFD5zXGTUVtjZHJDwVN2J/j3q7LfFE4KiUXL477zcuZLQl2JpEqbAZq3eKnn3ez0eQBuN0RNedFq/6lTV/cI2Pl48pbJEmlsgMudaGIUwERzjWybvKIsJffw47/itWTdEDDQ0+kQk9F8iEFuUMUVjUNztF44H8BPts48PpxnsdZOzG9JIw0piRW787BXlvKVNbCaxy+Bfix4UN25MobyyS274ISu0vH7v5t5R7YsKtNfjMP3nyW9wlZzCx1KlKYUeVx/oYfzb6+lffPMINsCiq23dOWlh1cnNm5qGwNT9H9TqnGs135swOEpDkce/niQBR90rDaWOaaUg9aoq+jZ/PRLjhpbhMvwaEk91LmKinumqY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4514.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(376002)(396003)(39860400002)(366004)(136003)(31686004)(41300700001)(83380400001)(38100700002)(86362001)(36756003)(8936002)(5660300002)(478600001)(6512007)(6666004)(6506007)(966005)(53546011)(6486002)(2906002)(8676002)(4326008)(54906003)(66556008)(66476007)(82960400001)(26005)(186003)(2616005)(66946007)(316002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1NUT2hIUFF4YUZ4cCs0QmpnOGlGdHYwNXNsY3N6TWwvaDlIWW16dFF0ckE4?=
 =?utf-8?B?V0FjZWFqUDNESEYyOFdXclFZVGJDWnlsNXU4V1RtRHpKdXZ2RnFnTVg4Ry9O?=
 =?utf-8?B?Q3pzQzVjT21aOUdETG0weVQ2bkZlYXRpeHNPY1gxdHFhcFpDTTgrTVNPUkhJ?=
 =?utf-8?B?SjhjNmxhTTJhTEJJaDRvNUt5ZWI4RTNBWEY4bzIzTElHNXNuTG02bFA0dVhu?=
 =?utf-8?B?TjBwUkY4WlI0aFBUTWJzMUVmeUJ3WEVRNmJZdGszNXlQaW1KTnpjYkRGaDc5?=
 =?utf-8?B?M1ZId1g2cUh6NktXd1laQ2x6SHR6eExmdDdYdnBoNmM4UFA4OUVRa0VpOGEx?=
 =?utf-8?B?Y09jbkYwc1RiR0ZmQkFaV2psWWpiYlNWNGpZekdpcXdqelJ0R0hZV2FsUlB6?=
 =?utf-8?B?MCsyamgyZk1OUVA2MmU0QnR1Rm11NVVsSnh0WlJISCtYU3IyeHkrTWhINmp6?=
 =?utf-8?B?bk04ZzhPcFdQaC9HMmh2SmM4MXFOVmZwRk9iSkNidXNMY0hCOXBmaXlpYnlK?=
 =?utf-8?B?cGZrWU1VQjJHRCtXTHAzdnFuS2h3Zy84V1hDMUxuWjJVcGM0L1V4enY3R2VN?=
 =?utf-8?B?aWU0UGhiNEpCL1EzTDQ1NFhNMFJlaHVYYjZDNlVoc2xJcmZ0bVBHYnNIY0dP?=
 =?utf-8?B?NmxDODIvZVlIRVd0SVJvSU56M0FIVEZRSWIwT1Rjakh2eVNKWGlKRUcyY1dy?=
 =?utf-8?B?b0RLV3crRC8xdzZWLzFsNGpXVTBuUXczek1lRldHS0I2Wk51OUVKKzl6L3d0?=
 =?utf-8?B?d05PNVFhYkF5ejI0QkYvaG9udVhaQzNtTlV1RGRxc2RUWFRjK09EZi9KK3Zv?=
 =?utf-8?B?RFUzTXp4ekgvTFdGeGpUd1AwWjlzQ2Nvcjk2TEJyYTQ5cDFaS25XMnF6Tzd6?=
 =?utf-8?B?dGxyTWlDbDFPQnNVT0M2RjBCZU9EMXBGWUFxZTZPM2V3cUFkMTNJNzN4bnph?=
 =?utf-8?B?TUNrbW0rR1pMRytBNE1FL3F4Q2NJTkwxQVZLRFJTYmNNMkUxMzNXZm9mdnpy?=
 =?utf-8?B?Z09LNW5TVHp4L091MzJpUmJQMm41Ump3VVhQZ2U3K0toQjFRTmhFSy94eVpI?=
 =?utf-8?B?NGs5UG9WTDdWR1lUYWMramxXVXB5OEFjdWNnamh4OG9kZlBQeUQ0OFNXQjVF?=
 =?utf-8?B?OUxqNW45eU9JVktNSnBuazRSUHduR3h3eVhhRXB2Y3ZYK25LOGR1Tlg1NTJ6?=
 =?utf-8?B?SlhRSjVRbUExQ2cyTEZaamJhR0IxaDBBcGRWSUhIbHNweHpMajlwWjVmeHlG?=
 =?utf-8?B?OE1NNnVQdFozK3NUYzQ2cFZjaHlBVUIvQnNMbjhaa2lIeURJYXRQVk1ZUURX?=
 =?utf-8?B?b25tc1J4TmtnQzdrNkhzOG1MVGFXQUNKWERwRXp2dUVkV3hodTdCR3FjbFBu?=
 =?utf-8?B?TXFYbFJRUW1tcW9LTzkzOGhjS1ZpbDRRZ29HSGNncFY4WU1MWlRaTzJjMEpz?=
 =?utf-8?B?T1hWK2VyaGZWUjFUeElVVFl0a3RQRlhuYmpTMDBEcmxHWTlOMzIvZzRuVkdh?=
 =?utf-8?B?Qm9XVUVLVVNNNzNzWWFPcS9MbjBVaHk5bVdaWFF5OHNwaVN0ZzhXN2NzQWJW?=
 =?utf-8?B?bG84bGFJd0NyOHNRVTZHQTBWTWxXT3FPTnFFTGoyazlNN2VOcTZSdFVaZGNZ?=
 =?utf-8?B?WGRraXZyNkZlYTBqYy9sbWg2NForRGt6cHNta0hHTkUvQjBVc1dsNGoyM3du?=
 =?utf-8?B?RCtvZ25FQitOY2t0UWZ1eUxkQkpXMHFBaGI2QjlIMjF6UHExMS84Z2dib0Jm?=
 =?utf-8?B?a0ZsMHJOS2ttWEFqanR2QTUwd29kWmN2RnJJZ3lUeFU4eHJtZkRvZmo4M3g1?=
 =?utf-8?B?bEs3aWhGcGVSMkpzS21vcVJnOXpFWjZqSEJTSlBSNkdvL1Ezc0orL2o2QWdJ?=
 =?utf-8?B?VEVtQnBPbVcxK3EwdUs1SG5Ka0FTR1dpTXFQMHl5aE80WWxOUFF2MndxTDNm?=
 =?utf-8?B?bDJhT0kyQktzNDB6TnZyUW41cEpMQjhocjdtQmNnVkVmUHllRzJyZzlVQmVN?=
 =?utf-8?B?WStnYXpBQTNsLzFDOEkxM3A4eEVRS3NJaDFTeFh5SndDUVpJZ2RIemNlcXgr?=
 =?utf-8?B?L3BFMWVzejZVODJSakhjVWZsTG03SFF0QkJpU2UwTlZWdFdJeTBrcUtCbnhl?=
 =?utf-8?Q?zEGaEnixWQ0xVJmQwrU4gF1Bg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f628ca9b-d97c-4f62-fe8f-08da61486e2a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2022 01:14:54.1772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+9THQb+VjXlc9k+Wze4WhXDmNpgH+75YFUPdFxeXfNz1AZoljFysmsIGyxqxnz1uzobDv677c5nuuuHrwMAzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5361
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
 dri-devel@lists.freedesktop.org, "Zhang, Carl" <carl.zhang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/8/2022 4:48 PM, Daniele Ceraolo Spurio wrote:
> The current HuC status getparam return values are a bit confusing in
> regards to what happens in some scenarios. In particular, most of the
> error cases cause the ioctl to return an error, but a couple of them,
> INIT_FAIL and LOAD_FAIL, are not explicitly handled and neither is
> their expected return value documented; these 2 error cases therefore
> end up into the catch-all umbrella of the "HuC not loaded" case, with
> this case therefore including both some error scenarios and the load
> in progress one.
>
> The updates included in this patch change the handling so that all
> error cases behave the same way, i.e. return an errno code, and so
> that the HuC load in progress case is unambiguous.
>
> The patch also includes a small change to the FW init path to make sure
> we always transition to an error state if something goes wrong.
>
> This is an RFC because this is a minor change in behavior for an ioctl.
> I'm arguing that this is not an API breakage because the expected return
> for the cases I've changed was not well defined, but I want to make sure
> no one is in opposition to this. From comments from media driver devs
> on a different patch [1], it sounds like the media driver already
> expected an errno value for all errors cases and is therefore already
> compatible with the proposed changes.
>
> [1] https://lists.freedesktop.org/archives/intel-gfx/2022-July/300990.html
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Tony Ye <tony.ye@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c   |  1 +
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c   | 14 +++++++-------
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c |  1 -
>   include/uapi/drm/i915_drm.h              | 16 ++++++++++++++++
>   4 files changed, 24 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 2706a8c65090..42cb244587f1 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -455,6 +455,7 @@ int intel_guc_init(struct intel_guc *guc)
>   err_fw:
>   	intel_uc_fw_fini(&guc->fw);
>   out:
> +	intel_uc_fw_change_status(&guc->fw, INTEL_UC_FIRMWARE_INIT_FAIL);
>   	i915_probe_error(gt->i915, "failed with %d\n", ret);
>   	return ret;
>   }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index 3bb8838e325a..bddcd3242ad0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -113,6 +113,7 @@ int intel_huc_init(struct intel_huc *huc)
>   	return 0;
>   
>   out:
> +	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_INIT_FAIL);
>   	drm_info(&i915->drm, "HuC init failed with %d\n", err);
>   	return err;
>   }
> @@ -200,13 +201,8 @@ static bool huc_is_authenticated(struct intel_huc *huc)
>    * This function reads status register to verify if HuC
>    * firmware was successfully loaded.
>    *
> - * Returns:
> - *  * -ENODEV if HuC is not present on this platform,
> - *  * -EOPNOTSUPP if HuC firmware is disabled,
> - *  * -ENOPKG if HuC firmware was not installed,
> - *  * -ENOEXEC if HuC firmware is invalid or mismatched,
> - *  * 0 if HuC firmware is not running,
> - *  * 1 if HuC firmware is authenticated and running.
> + * The return values match what is expected for the I915_PARAM_HUC_STATUS
> + * getparam.
>    */
>   int intel_huc_check_status(struct intel_huc *huc)
>   {
> @@ -219,6 +215,10 @@ int intel_huc_check_status(struct intel_huc *huc)
>   		return -ENOPKG;
>   	case INTEL_UC_FIRMWARE_ERROR:
>   		return -ENOEXEC;
> +	case INTEL_UC_FIRMWARE_INIT_FAIL:
> +		return -ENOMEM;
> +	case INTEL_UC_FIRMWARE_LOAD_FAIL:
> +		return -EIO;
>   	default:
>   		break;
>   	}
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 27363091e1af..007401397935 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -707,7 +707,6 @@ int intel_uc_fw_init(struct intel_uc_fw *uc_fw)
>   out_unpin:
>   	i915_gem_object_unpin_pages(uc_fw->obj);
>   out:
> -	intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_INIT_FAIL);
>   	return err;
>   }
>   
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 094f6e377793..0950ef0d598c 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -645,6 +645,22 @@ typedef struct drm_i915_irq_wait {
>    */
>   #define   I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP	(1ul << 5)
>   
> +/*
> + * Query the status of HuC load.
> + *
> + * The query can fail in the following scenarios with the listed error codes:
> + *  -ENODEV if HuC is not present on this platform,
> + *  -EOPNOTSUPP if HuC firmware usage is disabled,
> + *  -ENOPKG if HuC firmware fetch failed,
> + *  -ENOEXEC if HuC firmware is invalid or mismatched,
> + *  -ENOMEM if i915 failed to prepare the FW objects for transfer to the uC,
> + *  -EIO if the FW transfer or the FW authentication failed.
> + *
> + * If the IOCTL is successful, the returned parameter will be set to one of the
> + * following values:
> + *  * 0 if HuC firmware load is not complete,
> + *  * 1 if HuC firmware is authenticated and running.
> + */
Acked-by: Tony Ye <tony.ye@intel.com>
>   #define I915_PARAM_HUC_STATUS		 42
>   
>   /* Query whether DRM_I915_GEM_EXECBUFFER2 supports the ability to opt-out of
