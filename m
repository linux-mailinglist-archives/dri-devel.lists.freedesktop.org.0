Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF2255556B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 22:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D5B10EDB4;
	Wed, 22 Jun 2022 20:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E8B10EDB4;
 Wed, 22 Jun 2022 20:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655929828; x=1687465828;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dpWLxHsYEH1IeL4OPRbxEqUyBTjpYZUxRWcyqXPjI1w=;
 b=Oo0QEe6MjVC4Qy54HgN06O31bStnjb4l5CxXmoWPP+ubPZXTBuFx9uiT
 TJah+Ytyo6Tkz/hVfX32sxXkhfDaHgbwdkw4YNgNfQ2FJQwgiT4TW32ox
 K4FX1XxXErzjh6/QflT7ulIF6pqbMQQvS77SDfpYYF60F1c5FpShFXHC1
 IgkdJ+VtBTp2id55lLnQ39xYxFmD6vhL5qV95R+6k72EsW/2MVTed4b3u
 6WUcEDSPbVADmYfXnMsRLUoEDp8YgNJ2j/pGKaKPluig3rAzwg+CKE+6P
 2/4vBKvmMC4H/f25BmHWQiyAtbj1tpc3Mp42idUhJ9Kq04wei4WZ8aVwt A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="260972264"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="260972264"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 13:30:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="588346552"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga002.jf.intel.com with ESMTP; 22 Jun 2022 13:30:28 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 22 Jun 2022 13:30:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 22 Jun 2022 13:30:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 22 Jun 2022 13:30:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6e1yPaR3otIY0ejRysWDDHoLdDI0m2NGDP7MWMP6ljwN8P86za3R9JgEDhMlL9Klp0caNicw2YYtLQomsDuJtLwgIRlvVYAScPDmLWlYl+TsKSVhk70rdQv7RhqAMsD04aFLB9MHLJA5dx+43keq+dNG5a6X0uj/K+G1tOZg+VJkZstRqnCXerzRDcKGQqIN/ZYxx5N7UpoDV+qRUac0mIPikUiIKgXyAlAbVZ/AQ3FQBR3NVHbxV+EHmkSfIFLY7SKMH2hWARn9fh7hDBmGsg9sK79Y/SSfe3UYP7tH5Thp/tv0ZrktedjW9bmA7Ca5LjIufQZRwFDxoZ5d7MtZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TG6FPuVoy3UmaSGA57lijpHHgUByijAuM8a5Ei4UUQE=;
 b=ncZVs4uUtLtXNbBIj/Yw+yLO9JKPBUA+V9q1N5DO95cqhD/+EeMiFPJWvTPtBoTmmh3dsgreGViHaaGOVfSkhpU5H6+Xj/67KRuk0xnx+OuY7HcZvfTArQW/xR7huXiHkHOZJYIlovXUMidAN6zNK98K8W9AA34RXV3OvcLhyqUURhFP1PMoPJSIPGIm12b8kTMfNxykNMaVkV90VYSK4I/sVtD0L+8yKmtGuPu0YZpP5QU75P0Wb4gxVg5q23iRLaRMLct04A1iHFHVvCoDi8+n13vrxdvTwTARZGzXGU3YDvXwhiqDrCO8nk1khxwnJoLL3r3+NRYRlVlM2VjhfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by BL0PR11MB3218.namprd11.prod.outlook.com (2603:10b6:208:60::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Wed, 22 Jun
 2022 20:30:25 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::f440:6688:c682:21e7]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::f440:6688:c682:21e7%2]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 20:30:25 +0000
Message-ID: <c7849ab9-2d41-5172-5fe7-0d8726a11b81@intel.com>
Date: Wed, 22 Jun 2022 13:30:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/i915/guc/slpc: Use non-blocking H2G for waitboost
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20220515060506.22084-1-vinay.belgaumkar@intel.com>
 <87pmj11r2i.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87pmj11r2i.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::18) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8670f1ab-33bc-4fca-989a-08da548e09e9
X-MS-TrafficTypeDiagnostic: BL0PR11MB3218:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BL0PR11MB32189EDDB4EF711EFB1B4C5C85B29@BL0PR11MB3218.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eBH+km5Vq6tQC9ZJF7y4ESO7hpk5Qs8E8/+MvgLvIQjRpI3n/aaz2LutuOiAy0zmtYA/jUDXQt6ZI5FrfIpZLg9c/GkA31Rc8Wp3WCUSw2P/mLUZH3P1IcoURuBAnsWsCsDtr27vswaIPlTMYoUSmJ/NaanF4/nSHhZf4VPwFRgJQvcX6Ts4JQu4cvLOnXNIt3cOc3X2RcRnjJd+5pJBVnyGmenChedr08oYkJ7dAI4dsNlS2zkuaOlADPoMUJ7qld42WMgAg5MzrX2Ts7bdya7JeFIE93g5EDVlLst5bkLR88dBB/mYIOGSRvrFm4Ll4mDfe4RpRmV5oZ+pmGTO7ebATTEj0EQ6bYYCnctFkx4YtH25byxH8E1DBHwVPuyVpghCfKMta85f+pF/yZVDDdtJueI3kbRyAs2/4sN+j838ak9gyrMTGH7pTmY2YeILzESMBOeAcpT8yZyy+seBXt59M0bEaED7dS3jeGH1Q1qhTqtOhWwgIfw3rnAy3t0pFQY1t731slsGU72fFc30pqMj3NWbx8SkkJdBcUcIo0oL6o545LOV11GTR86vlCkPTBgsa5OQUsCvqLzIkd5WINT6AIVwUKlbon/P/KqJ7WNVXfFyYV/dcZSR4Vt/qSzXqW0P3klPw1RCvDDay6fgqdnSMYTbSijpeExT77VS62d/2/0KjCtaSIOOWy3xdOeRlldhMrdC0wjXki0BRCGMrZdaXe+PM2iJ5I1/K7OiS5X8yZ/1Zd/+oeSJwntnaGJg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(346002)(376002)(396003)(366004)(136003)(316002)(6862004)(66946007)(186003)(478600001)(2616005)(31686004)(66556008)(41300700001)(83380400001)(36756003)(8936002)(5660300002)(38100700002)(86362001)(53546011)(66476007)(966005)(37006003)(6506007)(31696002)(54906003)(4326008)(6486002)(26005)(82960400001)(2906002)(8676002)(6636002)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmJ4RXRXT1dEeVZzZXkrZ1NFdVBaSE96bHIxdFZDZHVhWmRlK1F6Y09KM3Av?=
 =?utf-8?B?VTNEejlUQlEzT1N0bG02SjJuSWMzd21JbEpKNEJpbTB2amRWbkNOVDhmRWUr?=
 =?utf-8?B?ZGxYaEJUbzNJTm02MkdpR3JiNDRWZi84bldPMGR5Y2FSTmZrQ3N1a09CYTZu?=
 =?utf-8?B?bTMrZG1CTXRWandkbUNpK1poZDk2OUNVOFVRTnJDQnZwMlpKR3hJY01VMHln?=
 =?utf-8?B?TS94K0doQ0lhNWwzcVpMZFBKbGdrQkpNQ0JnUUI3SW10S2hJVTJxOVhIYnRW?=
 =?utf-8?B?bVZXNzdIVWczS0NWNFNZL1VaL1d3Ulc5WUFya3dSQjU4OGd4aWlKci9oUSs1?=
 =?utf-8?B?Z2xjVURIQk1HMENDWFdYaXZzNkxLTlZPZlJOSDBpYjRRc29YdUpycFVxZTBQ?=
 =?utf-8?B?eTN5RWJvK0Ivend6R3hnWGNjeVVnb1VBN1dVaXRMSGk4Yk9ua2NOR3JPWE9H?=
 =?utf-8?B?Q0F2TnZIM3dwd1FtRVJaVzdwSGxOKyt2dUFxcHFpRVJJOWc0Y1ovSUoxNEJ5?=
 =?utf-8?B?eW9nV2tGdk9iWklyODZqcW56MnJ1dDZUZUlQQUxjUlcxM2xzQmtxS1JwN0tH?=
 =?utf-8?B?Zll4Tk1FTDNFckdPTXZnaEQ2RHhhdFkyRndrcVlIVVlORFluaVhHODZqNHJF?=
 =?utf-8?B?S2FvdnJVa1BxU1Q2U1kyRGF0ODBudlIwWEcyZFMxMHBrOE81RnZDeUZMclpa?=
 =?utf-8?B?SHRFK1dxQUNTcTdwOEtDVG8ydkxiVGdSeVlHTC9vVlVkeE9tc041Tmc4RS9L?=
 =?utf-8?B?Q3pSSjkyUkVCL3h3K2tNZjZTK1FMRTY2cDBGclc1eGQrSGVNUFVoK1YyZDJP?=
 =?utf-8?B?cEpCazhtWG9kL2d6LzU0QUZDUnUwQ2hPcjl2WEhHSTdBZGE4YUg2Zyt3c0xO?=
 =?utf-8?B?a1NTKzdCTG95eFZWK3d6Z1BveUc4b1l4TjNzb3IvNERCbkp1MFVtRlBFSU8y?=
 =?utf-8?B?UlczWUpTbUVMaTdhWEhTZks0VVVva0NrNllTYk44eS9FKzFaN2k0TGxZRVlm?=
 =?utf-8?B?OU12bDQwQzRSQm1pM2lrbkFtbUJjelZHVlBRMGtyMEZ1QVRhUmF2bGU5WWRp?=
 =?utf-8?B?NlM3TEVRVllDV1R3Mm9GWEpWdWo4Z24yZVZBZ2dQYzBHelhKZE5FdlFwV0Y4?=
 =?utf-8?B?NDU4cEUyWlNhbm40YnZsY3NpejBEU0h1bU5DUGpLaFhGSmZ0OGsxalYyU0dN?=
 =?utf-8?B?L2YwMUlBNGhjZVVyNmJYUGdYUHo2V0tXdkMrYjNFa0I2T3dHZFI1M1V0WUU1?=
 =?utf-8?B?OXN3K215Q3YwYjBmR1Y3SDRyaXFtQ1RGMld3QmRyWWlnbTFYbzFFRHRHRHA0?=
 =?utf-8?B?dUhRR0ErTXJtK0k0cXpHeE5lQ2VhTldNL2dkSXlHbWFCTFRPWW5ZdC9ReVZ5?=
 =?utf-8?B?bWwzalZIUE5ZMmFSa3lIc3NYMnVsczVUV3h2UFNsYnZ6dEpRbnhLYThPWFFh?=
 =?utf-8?B?STFNSTdpNE1TSGpPY0NobWY1VEZSZ1U3WWVYTnY2YmxRUlpQMDBWd2FteE5t?=
 =?utf-8?B?WjhvdHRJVTFqWU5IRmdTR0E0NFJLMnd3NGJCdW1aZXRhbkhoc0RrRGMyUzR0?=
 =?utf-8?B?V1JvTHlXdkN1dk5YQXJxdHljelhqQ0RFTGJ1NGZ3anY1YnhuRnptczBqR1NI?=
 =?utf-8?B?YnIvTjBUbmk2T3Zyakl6U3ZZd1lmWEQ5WnUreFBHSDhYUTNCbit0aHpSSHNh?=
 =?utf-8?B?SlFaYzNiYjloOEZYcjE3K3dSMVpPUzdxMjc0NDVmUVFRYWwrTUU5TXJQanor?=
 =?utf-8?B?Y1JTRm4zZFRNdTlPNFNSb3dnaysxcFU3b1FUWEZ0T3I5dUJWa2RCRzA4aHQw?=
 =?utf-8?B?U3ZRMG1Ub3R1VDFPeGlzVDRTWHgzbUJ4dkJkSGtFNDIreGl5T28yTFZtcGh2?=
 =?utf-8?B?aVY0Wm5vcDE3MENHT2dwVGxFRzdGb3Z1anVIeU9FSWY5RTBkUm1pTVpNdVFw?=
 =?utf-8?B?VWwycWFWRUhoekMwRUUzeEF2YU01TFlqNHNCTXlIRnprWURVZWNTZ3BhdXNJ?=
 =?utf-8?B?TjB1cTlyaUpadXZvQjJoYWFCN0ZCY3FkbURtNkkvZFpvM3ZVWEp5S1V5ZVJK?=
 =?utf-8?B?RmMwbk5nTTJLR2hGT0xuVktVVElLMUdKTldHeHhsYndUcURvVjg2MmxGSU40?=
 =?utf-8?B?VzJHZDRoQXN2bjJYYzRTcmxVUHBUS2lXSlFRTnhkR2Z1WHlkZW9Zc1lUS2h6?=
 =?utf-8?B?dnVYRmc5a1ltMEhuTlFCWG4yenVZR1Y0bk9ScmtXTjZuNEllaHAvWkd2bTVF?=
 =?utf-8?B?NFlueEJiYmowUHQvSmM0OFBGYW95cTBHakQyUVI1OWZQYTlzU1d1dGVZZUdV?=
 =?utf-8?B?cURlMm1qMGovSWJSV3BCWk1GT2dXNEpWcStJTmlWNjZ4ZW9iS3BPMGZKS0Fn?=
 =?utf-8?Q?UyYXFpDnbupHv7Ro=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8670f1ab-33bc-4fca-989a-08da548e09e9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 20:30:25.6458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJ1Ajlnqph8CuFuHYGTlYmUeb3+Z8z4oanLWZpJj6mLfI6D/+3djb1uOu6WgGDj3e5GUm9fmEgtsmvdqCBillddLTv+RH241u9aVIQ2r/Wo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3218
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
 intel-gfx@lists.freedesktop.org, John Harrison <john.c.harrison@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/21/2022 5:26 PM, Dixit, Ashutosh wrote:
> On Sat, 14 May 2022 23:05:06 -0700, Vinay Belgaumkar wrote:
>> SLPC min/max frequency updates require H2G calls. We are seeing
>> timeouts when GuC channel is backed up and it is unable to respond
>> in a timely fashion causing warnings and affecting CI.
>>
>> This is seen when waitboosting happens during a stress test.
>> this patch updates the waitboost path to use a non-blocking
>> H2G call instead, which returns as soon as the message is
>> successfully transmitted.
> Overall I am ok moving waitboost to use the non-blocking H2G. We can
> consider increasing the timeout in wait_for_ct_request_update() to be a
> separate issue for blocking cases and we can handle that separately.
>
> Still there a couple of issues with this patch mentioned below.
>
>> v2: Use drm_notice to report any errors that might occur while
>> sending the waitboost H2G request (Tvrtko)
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 44 +++++++++++++++++----
>>   1 file changed, 36 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index 1db833da42df..e5e869c96262 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -98,6 +98,30 @@ static u32 slpc_get_state(struct intel_guc_slpc *slpc)
>> 	return data->header.global_state;
>>   }
>>
>> +static int guc_action_slpc_set_param_nb(struct intel_guc *guc, u8 id, u32 value)
>> +{
>> +	u32 request[] = {
>> +		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
>> +		SLPC_EVENT(SLPC_EVENT_PARAMETER_SET, 2),
>> +		id,
>> +		value,
>> +	};
>> +	int ret;
>> +
>> +	ret = intel_guc_send_nb(guc, request, ARRAY_SIZE(request), 0);
>> +
>> +	return ret > 0 ? -EPROTO : ret;
>> +}
>> +
>> +static int slpc_set_param_nb(struct intel_guc_slpc *slpc, u8 id, u32 value)
>> +{
>> +	struct intel_guc *guc = slpc_to_guc(slpc);
>> +
>> +	GEM_BUG_ON(id >= SLPC_MAX_PARAM);
>> +
>> +	return guc_action_slpc_set_param_nb(guc, id, value);
>> +}
>> +
>>   static int guc_action_slpc_set_param(struct intel_guc *guc, u8 id, u32 value)
>>   {
>> 	u32 request[] = {
>> @@ -208,12 +232,10 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
>> 	 */
>>
>> 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>> -		ret = slpc_set_param(slpc,
>> -				     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> -				     freq);
>> -		if (ret)
>> -			i915_probe_error(i915, "Unable to force min freq to %u: %d",
>> -					 freq, ret);
>> +		/* Non-blocking request will avoid stalls */
>> +		ret = slpc_set_param_nb(slpc,
>> +					SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> +					freq);
>> 	}
>>
>> 	return ret;
>> @@ -222,6 +244,8 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
>>   static void slpc_boost_work(struct work_struct *work)
>>   {
>> 	struct intel_guc_slpc *slpc = container_of(work, typeof(*slpc), boost_work);
>> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>> +	int err;
>>
>> 	/*
>> 	 * Raise min freq to boost. It's possible that
>> @@ -231,8 +255,12 @@ static void slpc_boost_work(struct work_struct *work)
>> 	 */
>> 	mutex_lock(&slpc->lock);
>> 	if (atomic_read(&slpc->num_waiters)) {
>> -		slpc_force_min_freq(slpc, slpc->boost_freq);
>> -		slpc->num_boosts++;
>> +		err = slpc_force_min_freq(slpc, slpc->boost_freq);
>> +		if (!err)
>> +			slpc->num_boosts++;
>> +		else
>> +			drm_notice(&i915->drm, "Failed to send waitboost request (%d)\n",
>> +				   err);
> The issue I have is what happens when we de-boost (restore min freq to its
> previous value in intel_guc_slpc_dec_waiters()). It would seem that that
> call is fairly important to get the min freq down when there are no pending
> requests. Therefore what do we do in that case?
>
> This is the function:
>
> void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc)
> {
>          mutex_lock(&slpc->lock);
>          if (atomic_dec_and_test(&slpc->num_waiters))
>                  slpc_force_min_freq(slpc, slpc->min_freq_softlimit);
>          mutex_unlock(&slpc->lock);
> }
>
>
> 1. First it would seem that at the minimum we need a similar drm_notice()
>     in intel_guc_slpc_dec_waiters(). That would mean we need to put the
>     drm_notice() back in slpc_force_min_freq() (replacing
>     i915_probe_error()) rather than in slpc_boost_work() above?
Sure.
>
> 2. Further, if de-boosting is important then maybe as was being discussed
>     in v1 of this patch (see the bottom of
>     https://patchwork.freedesktop.org/patch/485004/?series=103598&rev=1) do
>     we need to use intel_guc_send_busy_loop() in the
>     intel_guc_slpc_dec_waiters() code path?

Using a busy_loop here would essentially be the same as blocking, right? 
And it could still fail/timeout with blocking as well (which is the 
problem we are trying to solve here). De-boosting is important, but in 
the worst case scenario, lets say this request was not processed by GuC. 
This would happen only if the system were really busy, which would mean 
there is a high likelihood we would boost/de-boost again anyways and it 
would probably go through at that point.

Thanks,

Vinay.

>
> At least we need to do 1. But for 2. we might as well just put
> intel_guc_send_busy_loop() in guc_action_slpc_set_param_nb()? In both cases
> (boost and de-boost) intel_guc_send_busy_loop() would be called from a work
> item so looks doable (the way we were previously doing the blocking call
> from the two places). Thoughts?
>
> Thanks.
> --
> Ashutosh
