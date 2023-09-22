Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A53497AB9BA
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 21:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF79E10E6FD;
	Fri, 22 Sep 2023 19:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC72810E700;
 Fri, 22 Sep 2023 19:01:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHWwS73P6qEd+Hn5BcLzTc8akiH9qCIT+sLa7IsMiKCfxQ5z8q0Abo4o9JmzwH7gZt3lUFxdNfFyRIbNo15WE7KbozCT61bVMlGuFccmIE1G0wqqoDn3n6bW7sWQJU1HVWLRXVbvhuymmul0zbL8IpKjEH1cc1LPAcYoepI/N2hTa1dGY33X3lAQ0kTSh4lSl4m78ENnJICJUPQXjD1nOzwd+qsxcXbGvLrus+kqZ1BWa0pBlax5Eog4F01NFl4p9JT01g97uc1gXKZj1ThEZdYw9juLqEk9ge6Rx+i3rejgedVylK+BKptftdVNbTiuGWTdrAW/72alPLbi/AqkfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODYJTWPLRK2impet3Gv5DoRLtqmaRQQXCGv0MjfBPJs=;
 b=IJrI9RS3PfQA0o07djnOVNMOrhw/6EcbjdeY8rSNmiptevsAxHVzJnaop1lJSowzRAh9BCqn3lFFb0RuOmw2q7mtVWJ0nYX68zLlY3NtSXeSPzbHRqEy2xvw5DswTtFtIjpUXZWyfEgXwrtXIP2nRaXbGIziOyhRoL/oQRkEVzIxaq0IeA2ts1symmBzfUlwHCwXekNudeYCb19GADi4OkP5samA4ntiVxFcXq1oSp70J0dVPs2YjVm+752AovwkOi1JNFFdaykusRgwNjTQJItpjwJndtNMUeZLTXHIliVC/1nfXJ6kxlS2P8siQFpN6p0UtHrV5qgS18cwSpOCzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODYJTWPLRK2impet3Gv5DoRLtqmaRQQXCGv0MjfBPJs=;
 b=lEbcMbwlaAoD6NKMlnMniJM0zJE7MIffLkwyehkL+7MnFpQ+AItFwjI5+OUVFp2/gyasq6kBCU1ppTxqoPmO4UQx3bfIYn4P7YdIyLvil8ezb41T0ZLX2d+5IIDvOVceSThZ0GxaCJRsYBnLkuF2L0ufczrFDjh1dBIqRFwzLBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB8415.namprd12.prod.outlook.com (2603:10b6:8:fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Fri, 22 Sep
 2023 19:01:10 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4%3]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 19:01:10 +0000
Message-ID: <fa4f1a5b-5ea1-4884-aafe-36696b491654@amd.com>
Date: Fri, 22 Sep 2023 14:01:06 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] platform/x86/amd/pmf: dump policy binary data
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 markgross@kernel.org, basavaraj.natikar@amd.com, jikos@kernel.org,
 benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-12-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20230922175056.244940-12-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR16CA0042.namprd16.prod.outlook.com
 (2603:10b6:805:ca::19) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB8415:EE_
X-MS-Office365-Filtering-Correlation-Id: f6f762cb-aab5-4da9-42b4-08dbbb9e4894
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n3zJnFXoMGXhLid/e+rLFPxK6HBsAncS31ZdYZyBLt2ec1zHs626e75bPo8bVApn2Xumk0kkF4JfS0UCaxWCpOOtwVAmGCNPwQXKvwIttFew+tahPhRUATSpd8TGxwefLpTHcMq9p08NLE/0rKTggauY8xjZZpnE3M3R9ADc0yYxJeHrABeUf0L/MI7b3qErW3I33pFK4PCtO1wwRfmJsNr+mZeKNKwKifecCM5RWGJNg7e0MTJUx1B7Rr/KUM+ftrZUbVtJaslUIvTrnb6YZmi5pQZtwsxU7eg5zwj1/2yzTwhO0Qp65SGWya2PFHjflUceeiRH8hJgiDtB0MOItvExTL0/fCLuH0OK1ADTWxALo/YtFDuusquY/E3SKBPq9J/YZIt6PB1m3N798pVYkYTVmrcACXP7jjE0FGiCMbuHfo/RoepWYXnDuE/1buELGngLnnzn4p6dHQpnEcm8UpwhW8ywkyyJIfYyScnanMo3AbpiaavMNt2ao27NjFf7Zv13J87avAgsI1S7LWBcrW+zmOz7DfpPMhEQgLgo7dEvAbvTEG/5z/XXuPl0loX5X0QaqkEDAahHI2CHtYfYQPvS4JR6McRgLC/8JyevlvmuQuqvRqbLcDgWy9NENM/m/LQAaky7x57JCYw114g546fR33I9qbwfq6c5XdVgZo8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199024)(186009)(1800799009)(478600001)(53546011)(8676002)(44832011)(31686004)(66946007)(66476007)(6512007)(6506007)(8936002)(6486002)(6666004)(66556008)(316002)(5660300002)(31696002)(38100700002)(36756003)(4326008)(86362001)(2906002)(7416002)(41300700001)(26005)(2616005)(921005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDlPTzM4Q0xNcWNKckZFT1ZBWlhhNFJER0R6M0ovL1YveWZTdnBaN2Z4R3NN?=
 =?utf-8?B?UXJYaE9BUnU0RHN4dmEyNVlwRDlCNWg1V1NuWUxQZzJmV2RXWERRckRJcnNn?=
 =?utf-8?B?a1VVZFhlUjVWdUhsZnFQMHR3M2VWeWZkeVMxdDhQNmJ4QVFiZW1xNHNwWXlU?=
 =?utf-8?B?Qk1WN0Iwb1JJUTVvR2k0bWlHZWtBVnJVSDg4SUFPTjFPTDhFNE9BWXh6Y25M?=
 =?utf-8?B?SitOR3NOeldYaks1QUFYVldWSXhNOG1FV0piRDZ5aHIvUkdjWWVkTXZ1SUNI?=
 =?utf-8?B?WEJFd3l1c2NDdERDSW9NVzN2czFFcXNKQkJCaTNLdmhmSDRRNjhOZU9mMGU5?=
 =?utf-8?B?N2d4Q3QzaDRlaUpxeEFwcG8rbjFNc2dmcldHL2ZkazkxZkxvRm9ldXZxa25p?=
 =?utf-8?B?Yi9MK1hseXdLLzNBVU9lWm5HTEMxVUpjQ3lETW5RN0pnV2l3c0JYZkRvYmtW?=
 =?utf-8?B?dU40Y2dVY09BelhIZWlyWVFZR0d3Zk51MVdZWHVKblIvYU5OOTczMXNsRTdw?=
 =?utf-8?B?bksyMUFubnYrQmVveFRZNTVkS1lHYVB2Q0FBOVU1MnJlaDk1VnFnc2drQkJJ?=
 =?utf-8?B?dUJXRnBLZ2d5TEdMbGhCUnQ1c1JWaWdkV0IvSnowTFg4SXIvZ2h2NStRbjlr?=
 =?utf-8?B?NDh4R0Jsa050WFdCVklxdGplRzZwcWIyRXNlNVY4aW9LQS83ZEFWM0ZuTHJn?=
 =?utf-8?B?Y1hRTUFkSU11WjlaVXVRMm8xL000ZThkb2NpV2ppR3ZyQUl0bTBwZURubWlT?=
 =?utf-8?B?ZkNPOUxIdGhKRElZcWQyOTc4eWJDUmppc2xnSjBsQ3BQRUU0MnFGc1AyUHJo?=
 =?utf-8?B?R0JISDdtenlGUEU1VXNQUUpKa05LVk5mY1hXN2xQZGtXRHNCaWJmSnlCUDdN?=
 =?utf-8?B?MWEvUExMKzNaUVNjb2dlRlFCSXRuZ085TjdKaVc2NzBuL2hBQy82Q01PRitJ?=
 =?utf-8?B?bWJXR2NKRHNkRzNKQ3hDUnBBY3RKWmI5U2FvNXVWK3hUZFNXVHo0NzdDbWQx?=
 =?utf-8?B?YTFwUUpCVm9JelBXQ1RkUDhQTHVIN2xBY0p5WW9JQXl2R21COXFJZGdLQ1Fw?=
 =?utf-8?B?OTVkVFZTeklqMThnb3Y5T3BhSDVDUWNXVTNUUVpTeWhHZVo2NXR0WEZkYjVY?=
 =?utf-8?B?bWduR1pMTi9KMXlKbVNramFzdjIvQjZBNmlmak15d1RZR2VKSXFDK3RXR0NO?=
 =?utf-8?B?cnQ1NldnMmt4a29pc3Erb0k0WjhGM1NEZXdieFFDQ1RVOGlQM0RCTjl5Sm9w?=
 =?utf-8?B?SFd0RE9KMFA1NnI0bDhXMXdSNVRONnZTR3lMai8rYUg3cUtRTHZ2N2w0L1No?=
 =?utf-8?B?emg4bDZNTkVIcEpzZ1dMS1lidURoM2trQjBmeW4yTHFZU0VjekQwbWRkYkRw?=
 =?utf-8?B?a05nYzNwckJaNmxyWDlnMG41WktJYkNka1V1UXpIVUJIbitQOE85VU1kZzhz?=
 =?utf-8?B?YjdhQXFLT0hQd1ZZNkl5Sk1mQzkvY1R0Yi9MSGNPY1htdlJzRlVCRFArbFdB?=
 =?utf-8?B?dXRIbi9NSWZsZzAxSEN6cEszbElxbGpOQ09uaFdaWnpmRjkrWVd4ZDRTbVgy?=
 =?utf-8?B?cXFpYUVINStmbXJRM1BhbGtMRUZnMHgrblBkTGZOZXZWYVhRWm4vU0hQZk4v?=
 =?utf-8?B?bTFjNzdJMW5teXg5Wm1Ec0Nhd1NKWjdaQmFybTdtekZ1dm5pWTJoYjdOUlpD?=
 =?utf-8?B?TE1lZXZlb0h2eldyS0JFQ3J5bkpFNE9qUHJ4K21XWlplb1BabEN2YmI1d2t1?=
 =?utf-8?B?VXQ1V05RR3QvVmpwcTJsSncrMkVydkJlWWl4M0tmTllvSDZUMUhXSEVncGhI?=
 =?utf-8?B?QlpyN2ExbnNreFRQZHVzbGZLTjUzTTlIRjFWYVE0RmJyTGhRejR3clcyWnpr?=
 =?utf-8?B?NW1JQnZYSytaYWprYWJXWjBSTGRKa05tR0ttQ1loQXhNcXB6ckxtYzlyZzFw?=
 =?utf-8?B?eUpqa0IxU0F4NHRxODdoSDQvcFJtWjR4ZVM3eUJwaDRFRE9PKzhSR1ZpZ0VZ?=
 =?utf-8?B?eU1LV25NNERQVFpkWWlzT2xjWm4zZ0dvYTlzTTJrRkt5Zzdpd2V3cGR1NjhB?=
 =?utf-8?B?bHQ1bmVvY1AzVW1hcm8xb1piRm1INXVnYzl0MmtNL1lsMEV1ZzlLdHE1dWlw?=
 =?utf-8?Q?sshaVZPPRMqOpcfaAEFgYt5Gh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f762cb-aab5-4da9-42b4-08dbbb9e4894
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 19:01:10.1546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oabk+HvPB3Th+DZSZhk9wnC/SGCq7qyuV8sKiOTKZfoosO5Y0S+5cMCWZKOvgfLNLJXGhoopTKWJzdQ3mE5prw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8415
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
Cc: dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Patil.Reddy@amd.com,
 platform-driver-x86@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/22/2023 12:50, Shyam Sundar S K wrote:
> Sometimes policy binary retrieved from the BIOS maybe incorrect that can
> end up in failing to enable the Smart PC solution feature.
> 
> Use print_hex_dump_debug() to dump the policy binary in hex, so that we
> debug the issues related to the binary even before sending that to TA.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/platform/x86/amd/pmf/tee-if.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index fa37cfab2dc7..3daa122f35d5 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -290,6 +290,9 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
>   	if (copy_from_user(dev->policy_buf, buf, dev->policy_sz))
>   		return -EFAULT;
>   
> +	print_hex_dump_debug("(pb):  ", DUMP_PREFIX_OFFSET, 16, 1, dev->policy_buf,
> +			     dev->policy_sz, false);
> +

Should this one also be guarded by CONFIG_AMD_PMF_DEBUG or no?

>   	ret = amd_pmf_start_policy_engine(dev);
>   	if (ret)
>   		return -EINVAL;
> @@ -329,6 +332,10 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
>   		return -ENOMEM;
>   
>   	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +	print_hex_dump_debug("(pb):  ", DUMP_PREFIX_OFFSET, 16, 1, dev->policy_buf,
> +			     dev->policy_sz, false);
> +#endif
>   
>   #ifdef CONFIG_AMD_PMF_DEBUG
>   	if (pb_side_load)

It looks like you can combine the two #ifdef from the previous patches.
