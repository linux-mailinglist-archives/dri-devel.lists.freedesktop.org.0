Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1D26AD849
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 08:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A821A10E372;
	Tue,  7 Mar 2023 07:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A679D10E368;
 Tue,  7 Mar 2023 07:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678173647; x=1709709647;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c9K+brZF4deDF5NrnX39Depr2ISjn79hHslux35PZbU=;
 b=a6OExhtYmcOvxTbVhCLaa6y7RGY0hAGGY8/3q/Lse648kMMH1EbBctRY
 fXnm5ZkB1pThvZYLftX85qC9k3ahbJh++25hvoIiDLxc8LNm8wWei6Fgj
 3C3utAOI9f3jYTThQA+1+glzMjSFQoV/EPbBYOsgld7hJPY7ZwjrTO5BW
 j6Yj10aSvWP1658oASrC598ochYy9dc2rW/OywEweo+TdKgbtRzHIoxMw
 76YysnJ21cm1f3/b6U4Fl1/qY1Qh3vfgipFBqLwN8bQN2McdNRZcZkCQi
 F3pVJuSZvjqGGP7OI7zRtpzw0h9/yZTisy3odbhAEZsVh5frAMOouEBbp w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316184018"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="316184018"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 23:20:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="786584133"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="786584133"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 06 Mar 2023 23:20:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Mar 2023 23:20:46 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 6 Mar 2023 23:20:46 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 6 Mar 2023 23:20:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBmmS5JBCosVo5tmAzvRsmlzgUgmQ49hW8qkkpG1Q9kT1aOSw1EJOYAkbVo517gh9MyaRSngaunjxJy5SrqY34BubmZIc6IN2pMR6iDysPeBEplWFUX31vGpddeJCMrWxa/qXg5zSEaiaGh2hFV9thHhOR+6FBiJ8i/AZcHxvGMvjb985AGao7jw3Skn3hwkmbiDaK3qlv/qtVQQV8vR1pvwOR8on0SCl3NHzoayAjZWfl30UPXzP16cls554lvXnEfFeRc1g/6riWoP316+VR7M6avUJXCUCFr551CbJhx36fqqsXpZg1frsTYBCLOELXFIQYQlfSX12Os/KmQxQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmZZrgGLSmeQsa2cZgvi6E0BFZ6NZQgs0v4EM8TxTjo=;
 b=fm6rPdKBNlbR7Iq6x0r8II9AeaqO4euE3pTNVV/DyDUA1LhGRdLXqYYFFYQEJWVgojuwNLKtQLbD/2WdM0YNoxKTIvzdckzhbRkAs3bNZcIo3yX5isiws44XyN+szxOWaL4cwM53O/hMLzN7uMhGbPXMkGaOjYO4tb6b7L4i7m5GAyHx4+1B56lCquxPYISEDM5D/r2/umtuq8YBtfd3X4z66xF9U3ve1SkVEjRj1TVIEzEg5/W4zssBIXQrarhYs6nVAU2tEGaZqlWBEJ/HDB9s4ddisFgyVY6hAbUCdMW0x3IYHZXuXV2yz+/wTaMVmSbZagNoEV1CWQeULGhjdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by PH7PR11MB6354.namprd11.prod.outlook.com (2603:10b6:510:1fe::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 07:20:38 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::cc58:aa84:72be:b4fa]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::cc58:aa84:72be:b4fa%7]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 07:20:38 +0000
Message-ID: <adabb4f5-6b05-c7d6-8546-1a85375d24ae@intel.com>
Date: Tue, 7 Mar 2023 08:20:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915: Set I915_BO_ALLOC_USER for
 framebuffer
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230306102850.18299-1-nirmoy.das@intel.com>
 <ZAX20lg5ieMrQIr/@intel.com> <c7e9521a-cf7b-fd7d-630b-a6bac4784b2d@intel.com>
 <ZAYjTCgyYbBtbE+N@intel.com>
From: "Das, Nirmoy" <nirmoy.das@intel.com>
In-Reply-To: <ZAYjTCgyYbBtbE+N@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::12) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|PH7PR11MB6354:EE_
X-MS-Office365-Filtering-Correlation-Id: c07dd9c6-34d7-45fa-ba9f-08db1edc72c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Be63DkDiZB1oPsUs1gLHJyvqvTA6jZiFDkuDhtY7+0ooEMpMzU6ZdgeK2nl/VyA7Dn0bdlINTtYk6tT8ieNzGZFQUXW1SfFbhxlN00MUSOWpcIYQAXh4W24cVkN9+42BSvCfTQny0PZsy8mbKqqYki7gTbN6FeRRpBsC9ySk7u9hMm4ZQHQaaepm2NU/DLAkJk8zRvjsqAymQzycPlTRbp1YkU2dfrulpImvmSeONJIlC2Ec1Wq6SVhArpyUKsOcnzda+Pp2IqfuA438iL/zvLBzcQsQiec7yLXJZnGdg76BItkjwDeVWuF25mUcZwuQl+Gt0mIjOl8rda68wf5EJE/fJp65vkQ+Kl7nAYejdPa8o9xCeZIMxZ+97J1fdxkV8UcuUYIaprm5vqp2mxqEFE+abg6RYIYTW5B7rGrGh87JNL18mmgGMy+sbsYBqITsCYZboUJSVRrBlvn/IKDC0civOLj41FXig8d1w4iZdJHPL4SDEv5ATu/DrS7gk4+S8oC1hcCSIzWbyPRzV9x/OfiHQA15zwm3hzPJ8QkKH9cwPPpteTMLD/Nt36/G89PbqHP2pEZ3p0GYv/Fkj/Jtd/hZUltXzj7EyySLva2JURGoCMDpe2T1+fuPzeD3hgn34hJFIAJ26XJWLMNk7rerpL/ZqeGrlerfq9vMe11ZzhX1CC7oZ9mGVBVD3dZsuhCIB6M0+g3i3CropjUa+cYu/BluLV2kvrj0UI9R0/HZh0I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(366004)(376002)(136003)(39860400002)(451199018)(31686004)(36756003)(41300700001)(66556008)(4326008)(8676002)(8936002)(6916009)(2906002)(5660300002)(66946007)(82960400001)(31696002)(86362001)(38100700002)(66476007)(6486002)(6666004)(316002)(478600001)(6512007)(83380400001)(66574015)(6506007)(186003)(2616005)(53546011)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clk2b3ZzRWJIcHZOc0JDRFlzTjBLUmd5MTFhdFRBM2xHYnZUQ2xvYThVS2ha?=
 =?utf-8?B?YkIyaHB6S3BPYVFHWnU4RUY0OFB2TFEvWFkwRkRuR3loSEpJa3pXRWFWTTV6?=
 =?utf-8?B?MEVHUVRrMzZ2Mmc1MGZZMGl0cnZIM2JOa05vYWduSmg5eldhb1NnZTNpb3Y1?=
 =?utf-8?B?STd3bFJYMHY5OVU2N1JCaFpBVm1jVDFoTlpHdll6SWtTbHhrMUhhbVNieFhn?=
 =?utf-8?B?TXpFSUpXcDFtTzZNNGZkOWpoVmlidU5sUCtsK1ZXamxzM1JYK1FFS2ZEbXVx?=
 =?utf-8?B?V0s3aU13UmZKWktlWmhiTkk0d3BRTzI1T05CaGRhc0xub0w1OEo5dlVwcVMw?=
 =?utf-8?B?ZEtobm9oUmVoMVZsRVNXbnJ5bkpaMWlQOEZtUVJFc0FielJNSkdWSXN5ZUtX?=
 =?utf-8?B?Q25EK09mWnJmREVmeTJQSURVOUxPQmJ6Qm50SzQ4K3JleXFLRG9EMFlIbUYw?=
 =?utf-8?B?ZHJXMGN2VVZQQlo3c0pGVnJsckdMQ1dHZGdIM1J1WjIweWFoY2Rtb0lYKy9y?=
 =?utf-8?B?QTlwM0lRRzY0RzJ1Y21CN1Y0K1h1UkFOVGE0WVpVRUJCUW9qeXhCOUFkK0NU?=
 =?utf-8?B?djc2clBoZ2s5ZjdvRkc2V0I0SVBTdVJwQ0FRZlFteWhzOUtuazZabEYyRVlV?=
 =?utf-8?B?aUZzbDhwNUFRNlIyYkZxTjhFWlAyTlNVbzdodWxSL0tleUhWSmxRbkNwM2cr?=
 =?utf-8?B?bm9MVE56YllmMis2NnFpYkc0a1NBaWZsWjZhNHpKcGdIREFybTlkQ05mbFkx?=
 =?utf-8?B?UTQrOUo5ellscHZKOUNCTXFIQUxiV3k3YXpWZ0tBREZEOVRWSFV1U0tLWGVD?=
 =?utf-8?B?ams0WERzY21VdUFFeUxJTjh4UFBMNXBTVS9PT0tZTlluUnUxVmVjcVMreHBB?=
 =?utf-8?B?TzN2QytjeFBRMk5MWEIwRDQyMjRMcjZ2WjJuT1l6cFBRRnhyUkRzenBMZ1pw?=
 =?utf-8?B?Rmc3NlZNbVorZ2J2V3R2SjFrdDRDajh3UGtuRzl2QWdYNm5ZTDFJSk1lcDhr?=
 =?utf-8?B?QWRjNWd4RmJTUGRrRVJSVm5GQXRPTzZETVB6dUpuL1kyVWUvMDNFUVJvUU4r?=
 =?utf-8?B?TGd0MDJaWDhxa2w1dWU0Q2N1NWVKRG5lTzJZOHorZnZUR1M0Uzhmei90R3hK?=
 =?utf-8?B?N1JBb0tUUFllYitOL3l3N3czMVhpNGxiN1YrMEtaL2NPMVYweFhyN2toMXZ4?=
 =?utf-8?B?bWtBeVFmNEJWRTVJNTYvc0pzQlJXbnNFTk91ZzAxdXRKbHZ4SzZCajM2enBS?=
 =?utf-8?B?U1k3MzE0MzJkeVd6MUtTRnVOa0VKK2V1VXA3L3NCQlFXU1l0ejZ3UHRPbjlX?=
 =?utf-8?B?d3prVUYyUUZpVkhHdFZEN3daQ1VEQ1czVU5KL3pSMUlqOGM4c1plME1LbW1x?=
 =?utf-8?B?dXV0TVBpT25uMDQ1WWsvWmc0Ri9YRUhlZkFwbTRMWEZQUS8zc2dTdjNqYXY0?=
 =?utf-8?B?VFB0SCtxYUN3bnBpNG9IV2JHYXN5U1hldEk0TEhIK285OTRyWVdsRTUreEU1?=
 =?utf-8?B?QUZmVFFLS0tDL3QwNDk0bmhZNklwaXVXSHo4UFZEVUtZMEtEc0I5bFFVc29H?=
 =?utf-8?B?by9GNmZXaUVMUWhpTXcyUVFtaGVqYjQ3amNmSmhUNVZxNnRyb3dOZk9NaTVs?=
 =?utf-8?B?MURxZWlETnhPNU9ONW8zWUd2MGFZVGtYeWl1TlNld3RydEtPMXNKbFV1UHJN?=
 =?utf-8?B?T1pUVEx0NlFPOUVwZ2xCejZyTFNvYnhnR25VSmt3WDZkY09RQndFRHhnendv?=
 =?utf-8?B?T0Jya2pEalh0WkxsZlp1OFlPUEJtZW5jRk9jMXNERjFmNUxWNm1sWUJtTkpU?=
 =?utf-8?B?WDBldzBXbGtaMWMxT0pSanI0QW5WeGJOdU4xN0VqajVsUkFFeDZCWjBBRzF2?=
 =?utf-8?B?ejNTSXZuWGh6N3JLTkc5SUNJdVNsODY0RlVWeVJQNEo2ZmVEZGtRWnAzM0tG?=
 =?utf-8?B?UFJhY21VY1I4Y1pkNmVTdDJLY3pkTy93U0ZsbHpreFdIcDJ5OW5xTFEzNzdZ?=
 =?utf-8?B?RUt5N3NLekhtYWl5RkVSY0hnSzhhNmJvdzZJT2kwY1BWQkdNR3hoZVhpQ0Nx?=
 =?utf-8?B?cEM0SzJCQlNrMzNWWVBGRWhsQnZFVFl0TVRER3JENmN4OUhJME84NmxvRkpW?=
 =?utf-8?Q?yZZGmm/a1F+X4/XcBFTiZpjjY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c07dd9c6-34d7-45fa-ba9f-08db1edc72c3
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 07:20:37.7468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jqAOsK+M7S3RCGcaSVV5gRV/Hfl3DIV8j3R/spw+XIn+4bN9MafIPvFZwClx7Z02gaf5gXeIV8tjjfMiYcA2Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6354
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/6/2023 6:30 PM, Ville Syrjälä wrote:
> On Mon, Mar 06, 2023 at 05:22:19PM +0100, Das, Nirmoy wrote:
>> On 3/6/2023 3:21 PM, Ville Syrjälä wrote:
>>> On Mon, Mar 06, 2023 at 11:28:48AM +0100, Nirmoy Das wrote:
>>>> Framebuffer is exposed to userspace so set I915_BO_ALLOC_USER
>>>> flag for it. This also make sure that ttm allocates offset
>>>> for lmem objects.
>>> I have no idea what that means.
>> Sorry for poor explanation.
>>
>> Without I915_BO_ALLOC_USER, ttm will assume the obj as kernel buffer and
>> will not allocate fake offset which I needed for fb_mmap callback to work.
> So that's the fake vm_pgoff thing? Doesn't that exist just so
> mmap() through /dev/dri* can be passed a "gem handle"?
> With fbdev mmap we already know which BO we want to map so
> why would any of that stuff even be needed?


I was mainly concentrating on  using drm mmap API to achieve fb_mmap 
which eventually will call i915_gem_mmap()

and expects a  fake offset for the obj. I see your point: fb_mmap can be 
done without using drm mmap API which should be much simple . I will 
look into this and resend.


Thanks,

Nirmoy

>> Regards,
>> Nirmoy
>>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/display/intel_dpt.c           | 4 +++-
>>>>    drivers/gpu/drm/i915/display/intel_fbdev.c         | 3 ++-
>>>>    drivers/gpu/drm/i915/display/intel_plane_initial.c | 3 ++-
>>>>    3 files changed, 7 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
>>>> index ad1a37b515fb..2e6238881860 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_dpt.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
>>>> @@ -254,7 +254,9 @@ intel_dpt_create(struct intel_framebuffer *fb)
>>>>    
>>>>    	size = round_up(size * sizeof(gen8_pte_t), I915_GTT_PAGE_SIZE);
>>>>    
>>>> -	dpt_obj = i915_gem_object_create_lmem(i915, size, I915_BO_ALLOC_CONTIGUOUS);
>>>> +	dpt_obj = i915_gem_object_create_lmem(i915, size,
>>>> +					      I915_BO_ALLOC_CONTIGUOUS |
>>>> +					      I915_BO_ALLOC_USER);
>>>>    	if (IS_ERR(dpt_obj) && i915_ggtt_has_aperture(to_gt(i915)->ggtt))
>>>>    		dpt_obj = i915_gem_object_create_stolen(i915, size);
>>>>    	if (IS_ERR(dpt_obj) && !HAS_LMEM(i915)) {
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
>>>> index 3659350061a7..98ae3a3a986a 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
>>>> @@ -163,7 +163,8 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
>>>>    	obj = ERR_PTR(-ENODEV);
>>>>    	if (HAS_LMEM(dev_priv)) {
>>>>    		obj = i915_gem_object_create_lmem(dev_priv, size,
>>>> -						  I915_BO_ALLOC_CONTIGUOUS);
>>>> +						  I915_BO_ALLOC_CONTIGUOUS |
>>>> +						  I915_BO_ALLOC_USER);
>>>>    	} else {
>>>>    		/*
>>>>    		 * If the FB is too big, just don't use it since fbdev is not very
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
>>>> index bb6ea7de5c61..4a3680f6a3f5 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
>>>> @@ -110,7 +110,8 @@ initial_plane_vma(struct drm_i915_private *i915,
>>>>    	    size * 2 > i915->dsm.usable_size)
>>>>    		return NULL;
>>>>    
>>>> -	obj = i915_gem_object_create_region_at(mem, phys_base, size, 0);
>>>> +	obj = i915_gem_object_create_region_at(mem, phys_base, size,
>>>> +					       I915_BO_ALLOC_USER);
>>>>    	if (IS_ERR(obj))
>>>>    		return NULL;
>>>>    
>>>> -- 
>>>> 2.39.0
