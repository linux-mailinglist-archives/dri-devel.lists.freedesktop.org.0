Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4E25A9C0E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 17:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147D510E030;
	Thu,  1 Sep 2022 15:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3AA10E030;
 Thu,  1 Sep 2022 15:47:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mj06FHVf3A3rLgOQGcIHUtWGyxWyRZvzqP6FY2GXWn2gJFOC2cjlOTXc9HbxS+gYmPdj5sfw/Lo/eLNgU46DmWzfCDuijjXdtCo5ArLpwrNFQwa8BleuoybaJnxfzpCY2aXtOyPEGpuUKq06yuzbgQVZ/VH5n066qs2DXU4s6wvVllUxtBp1pIKpZJhJmgCiMNpViBlrcorainodPLYHKPA0jE3iIcY9dcdV7DM/y8tpscM/m+/Nc8wKh9t3jInFAGXhQD9CflzFk7ALUjfc92zUmnENmWzPppB47rUiwN+6XkPkkE6R+cxWgghERgbUewJ2ZAnvX+HIY6EtgQWsJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nm2koDhh0FzDtbI2IrxTygDXSEhEBP7sAK+QsY+APkQ=;
 b=Jh7vX8ttNi5ecMiv7ffNAjcthiofWgff+qPfh1TeVm9QrHoE4ySxf77XykX2jHtPZsEt4Q5ClN1JpMZkU47lZ58vzVB83pjjsuOTYukTt8La/H6P/VZKkAjKLqGPneIOiR+nFDXnWv9x+eggs9H+velnfkfBQNAh9Huaqb8ZrFQcXWYanFQJqcYM+J9tCwmS5ZK7URG4NzGXMMxYrFsN38q7HPR2I+iCxBhAgqOosiiN2R5ASkzlCJgMRtQwTewr4kFaPuvdY+qgbcK1Q85KnLhU5QKVG9/Vwz5xOd3cgDiFD8hxtaLpuFmRNgha3eP0tIUXjv5qWOT3D3uBZ59ggA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nm2koDhh0FzDtbI2IrxTygDXSEhEBP7sAK+QsY+APkQ=;
 b=jjloz3/CpXJcoqSsZhx8b8fadtEcaUQeEouZ9nmBKvzXuE51BFRCHErbJWZzfxVyBVlFgpUj/TROiprvG1LRRheeyHcZqSDnQ4XepOW2aev9N7ensvYzXYg6PscVMDcorWFAvRGUzDYcEbugCNIkRQ/CtxchN2lQfYH18E1owcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by BY5PR12MB4244.namprd12.prod.outlook.com (2603:10b6:a03:204::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 15:47:19 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588c:ac12:d318:bfee]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588c:ac12:d318:bfee%7]) with mapi id 15.20.5588.011; Thu, 1 Sep 2022
 15:47:19 +0000
Message-ID: <417bdb98-e22b-5316-7f71-5797ac001a53@amd.com>
Date: Thu, 1 Sep 2022 11:47:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2] drm/amd/display: fix indentation in
 commit_planes_for_stream()
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, linux-kernel@vger.kernel.org
References: <20220901141511.50523-1-hamza.mahfooz@amd.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20220901141511.50523-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR11CA0010.namprd11.prod.outlook.com
 (2603:10b6:208:23b::15) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6b9bbde-69ee-4403-e9c5-08da8c31406d
X-MS-TrafficTypeDiagnostic: BY5PR12MB4244:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gsVkDNw20XPNCratGdmH9Ftuwo3Pxj8jm29vka0QIiM6irJt4fowfHr0roGtpvXEoHOBoeH6NKrUSuRpRxIQJmDqRn2QQktKxM79e3TF1UJjtUQpbXc+ftB3it55h0REeys/RupmQQiD8KTqnpnfvQ9iqbENUztSpUK/bx1LS+vGJkkYSCbOl++I6F/lpKNMFjeQbCqK3nWR1Nww8wpt1r/YuqLjPFqwDEdb7Xuy9YssbtdRriZg/YrhG/TFt4gC5z2BMT9IdLKXlf6GkKnAG3sWgZxOLNzdDYaUEFv112eN7TTbnlsqxUaHHAQ+9GB9N040xRyxzfTYQ/0JiG9JqjAHmPrHEJSNdaYrf0eJE7C2IJ4IZDJwmTzLC443Mv3JsQJYzrI7hNzJ5SZOPkDtSrcMJ0OhNNmGo18Z35rS4J9VxnUEMC+a4GEpofEPSKE6Wy3jjQ72hD+06fEmnReQKH/nknEWyUSm4DgMNOxEZWa/ReEqcSY7sjp/dDSPnhZU7Iz5zpOclesgL2t53zuyH4aJl/5gzTAVrnXeA66djv6VFI+bLh9+In+1/UyiXSSJPPw20JgWVHqRwkI+rFaBEXlvke2R6mDI6UAwZlodt/OBuNQVyOdAqIgOvJlA6fG6Ymu31F9kN2ekodd46ukU4ijzV0/q8yvIgyFD7v93W0Z2PdtJXsaCkouXvCDNsBL6OKShllssn9uFSSRO50e6TQ1Tf4j+htCKUfJBSamWDVh2ECJj/5aEwHuzixe9/nv2kdTKmgXzHXQPr5SGkZzNZs/FCWNmexO0vE0ug5fcbsI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(346002)(136003)(366004)(376002)(41300700001)(86362001)(53546011)(36756003)(31696002)(38100700002)(83380400001)(6506007)(26005)(6512007)(31686004)(2616005)(186003)(478600001)(66946007)(6486002)(66476007)(316002)(66556008)(4326008)(2906002)(8676002)(5660300002)(54906003)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVdUMXFvRlhmTjhVNGtaNEVxM1l0b054L1dqeTBTZGNlV1NIbW9TVnNDWlNk?=
 =?utf-8?B?ZTZNY1lLU29XVEdIUUJSb2U1eTRiMGU3TTlLR2cwa29KSk56dk9PMEY2MFJT?=
 =?utf-8?B?dWhNS1I3QWF0bytnS3JyUjBmNWxkbDlXVmZrcTE0U01EczFOYlR2U29VSzQ3?=
 =?utf-8?B?d21hVkdmNE02UWtwNVE5RWpPazkvNkJoT0pvNS9qbXBsc2pZY0MvQkZuRzUv?=
 =?utf-8?B?MVBTL0ZsOUQ5Q0FlVTBDN1BiWUk0MndjYWpSV2ZPNGdqWWsrdFhLNFdES2NE?=
 =?utf-8?B?a25walh5SWFTVFNuQUVycUNHbXRYVmU0clEvN09pK3lvcExBRmdiUEMrTWV6?=
 =?utf-8?B?dHM4VTNYbzNjcHlDQjhtSDIzU2pIZEVCTnpEUnhIdzV6TDA3aVdkMGNQNzU5?=
 =?utf-8?B?SzNrRitRR2VoZTY0T1RPR1NHVk83SjMwbGhHM042REdTY0wyU1F5SHM3TExi?=
 =?utf-8?B?dEVBaElJZmRHSzYyZWMvanZSQUw0a2NlRVpYTThRWWRuSDh5ZVFvN09FOTBC?=
 =?utf-8?B?NTVyM0dNNGoyMm1LNkJ6bWJVQy81Z1FzUkpzOE9PcU00NHpaS3M3VTZ3K3la?=
 =?utf-8?B?Nk9ZZ1gxNVpIbnJCTVRxSDRrSFRRTmFpeW8rMXBZVmhTU0hkVVp2T3FzWEl6?=
 =?utf-8?B?L0R5azd6UXBaTC9MOGkzUVZ5b0JaNVN1UUpUTUpqeGNPUnFrbGticTVOV3Rz?=
 =?utf-8?B?U1pybU9lK1NQMGZ2MytaV3JQbGpnK01IMm9mT3hVckI4UmVRQlBWUFBKdmNH?=
 =?utf-8?B?a1JhQ2VGTC9YWEN1WUNUTDExQnlGbUFtdU93U0kvSHVzWm5IWmg1NnhseitX?=
 =?utf-8?B?SmQ4eE0zTmZuQzBZeHRmTnNxZ2c5R3Q3K2hYQWlnSmlvaCtMQ000SldlQ3ll?=
 =?utf-8?B?S1VSK2dCMGI2a1NRNXhwcEFhS1VHbXRSQUJPdENsQk9RcVE0Y1VKOXVkTHp6?=
 =?utf-8?B?Ylo4VWJJUkRkRC9jdmRydi9YbU9lSWVmNHZoOVN3dFMreEJGcmJIdU5WSHBv?=
 =?utf-8?B?Z1BiZHBIWEZSOXRpQ0RORjFkTWJzdDcrWVdQWXp6czlWTkxqdHl0dER0VGM1?=
 =?utf-8?B?Zk1pajVIVUZ6dXhuSzBqS25UYjdvNVJBT0VsRXVQbXltc0p3STltVUFiRjFa?=
 =?utf-8?B?NjFBWlBnMGdDUEFya2p6dld5NERWRlFMMnNNVm04Y0loS3dGTG5PVWhpWU9K?=
 =?utf-8?B?UkR1ekpVSm9YSFdPTzczeVk3emNjY3VTazlVUmJQUWtVOVIzblZIZGJyS3pw?=
 =?utf-8?B?LzlTMWhzblNTK2lNZWR6TGtoc3FKS2RnTzZsL3BleTkveEE4SmZLVFNrdmdY?=
 =?utf-8?B?USt0d1h2STBMR2JOWmVmRktMWnBWdktsRUdWOHdhTGZEa2ZyQ3E2NE9kRjRw?=
 =?utf-8?B?NFVNZHVrdGlTc2NrbDNHNUMzTHlOYUtxUjFWbXVXcXNJV0gxNGcyOGN4TDNJ?=
 =?utf-8?B?M2VMWlN3akVWTGxHZUhFcG4rbkd1aW1YK0pzVkdXZ3p0NVV4T1hmTGs4K04y?=
 =?utf-8?B?dzNIbEtJamZQTEI3cC9meXV2eHVSSGxiWXNRcWZUWlhGb0N3dW5KMXVIY0hF?=
 =?utf-8?B?VXA1WEpnZGg3eUhHU1ZLNFBjb3pXSTBrVm96c2k3amszZjBrYzc5MS81UXdB?=
 =?utf-8?B?dEVLWjBQN015Z0dUYlNOTHo4NTJFVFE3SlNpTTIyMUZWaG10dkNmQXpXTEY5?=
 =?utf-8?B?eUU0UENIaDlrK2JEckFvTGN3NU52SmdNODVlU04rbk1MVVhYeWlWZlB6Q2VM?=
 =?utf-8?B?TTdNdFdGUWNZdTBsc3phWGFZMlZnckd3L0k1YUVIczIyTUxKaEt2d01ML1Ro?=
 =?utf-8?B?RkVKZXc1WFNJZHhGQkR0ZVI2M0lidWJMTFk5c2JmVWNLc2VHdy9lNTNBWmhx?=
 =?utf-8?B?NmpuN1VKWUcra1E4ZnFkRmQ5TzVGUkNWT1k3ODQyUXM3WVd2NFI2d0ZLMTlK?=
 =?utf-8?B?TmFGdmJjdkF4MEt3VS9CempVck5scFFZa0NqMFFkREwxaDVxdXkzODJ5WGtk?=
 =?utf-8?B?T2F6K1ErTXk2ZnQ4YmVpUW1Rd3gzTllQcjRPd21vM3FpQi9BbDlBbEUzQzVL?=
 =?utf-8?B?MWIvaFpqdW9GbE84Sk13cDgwZ1NTMEsrampmQmpmR2VFSGFZdGVkVEpHR0tQ?=
 =?utf-8?Q?gK//emWgp5iwSHxQgkU4yJH/r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b9bbde-69ee-4403-e9c5-08da8c31406d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 15:47:19.0765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kOi2yCDz9r8RcMnEf8sYfpWXTZDwvNTBzIGnk1UXmpMPoHzxmXaJRn3v0KGuN4gyRT2tpjOiQCqZdWWIVrjONw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4244
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
Cc: Joshua Aberback <joshua.aberback@amd.com>, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Samson Tam <Samson.Tam@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 David Airlie <airlied@linux.ie>, Alex Hung <alex.hung@amd.com>,
 Alvin Lee <Alvin.Lee2@amd.com>, Martin Leung <martin.leung@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-09-01 10:15, Hamza Mahfooz wrote:
> Address the following warning:
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3508:9: warning: this ‘if’ clause does not guard... [-Wmisleading-indentation]
>   3508 |         if (update_type != UPDATE_TYPE_FAST)
>        |         ^~
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3510:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the ‘if’
>   3510 |                 if (update_type != UPDATE_TYPE_FAST)
>        |                 ^~
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
> v2: implement feedback from Alvin
> ---
>   drivers/gpu/drm/amd/display/dc/core/dc.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index b49237390cce..9860bf38c547 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -3507,9 +3507,10 @@ static void commit_planes_for_stream(struct dc *dc,
>   
>   	if (update_type != UPDATE_TYPE_FAST)
>   		dc->hwss.post_unlock_program_front_end(dc, context);
> -		if (update_type != UPDATE_TYPE_FAST)
> -			if (dc->hwss.commit_subvp_config)
> -				dc->hwss.commit_subvp_config(dc, context);
> +
> +	if (update_type != UPDATE_TYPE_FAST)
> +		if (dc->hwss.commit_subvp_config)
> +			dc->hwss.commit_subvp_config(dc, context);
>   
>   	/* Since phantom pipe programming is moved to post_unlock_program_front_end,
>   	 * move the SubVP lock to after the phantom pipes have been setup

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
and applied to amd-staging-drm-next.

Thanks
Siqueira
