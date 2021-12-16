Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F56347674D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 02:11:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59C810E324;
	Thu, 16 Dec 2021 01:11:33 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF6610E31F;
 Thu, 16 Dec 2021 01:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639617093; x=1671153093;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4sUt+2BscUM+NhBhPqf4x0cMyUjV09OSDqXRVEHNoIw=;
 b=EEP69vcZtNFieVa7yU3363pOT0y7Lg7OMQWJpSKYyXdEDzJzBkznf3dv
 Oa/1WiVkGyhr+6IWGOMhAQ8cfFKoy8uz5KFh6y373lxeqCB1ZNShaWA5L
 3gGrYCOogBNNejrMjvcs3fJ7lP7W/pCJuiAUvQsQ95PEL747ED/r9LuSR
 cXrgjvLjH7R+jGFWn4um+Ye569qQynp0Wmw/e26KAY0yOSSQNNyTAymds
 1knO+ChVlDK5/DDEitI6b/JoIPxvkDoz2Il2CA47onCNghtuhGk1h6iD4
 U8D3p9IuVb9Ybs06qFrr0IxYcZrEYc7TrN8JbrgWX6unTkt0jd1IOfEDv A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="238113852"
X-IronPort-AV: E=Sophos;i="5.88,210,1635231600"; d="scan'208";a="238113852"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 17:11:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,210,1635231600"; d="scan'208";a="482629379"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 15 Dec 2021 17:11:32 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 15 Dec 2021 17:11:32 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 15 Dec 2021 17:11:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 15 Dec 2021 17:11:31 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 15 Dec 2021 17:11:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IT0xIrcZhPzX8uf4IEQu7YSagu2Ua+TppnrHy1jcSSWNFwlqDAVrHPUGtZ3WYjsghtZbvYvQk7HVeujoqn7RzpVWS/IZy7yadvJqKMyGDToA89ZM5MR06101bCEFcWDke65eLKHoViDNFpP6g9pdS3peHNcrA+sMayH9l9iCxPMIZZ7erxeCjTDvl7QsB/srSzV/OEWqMQ/gvZzOaZmujG8An45c6HShAJQz7uuf1/y23DEw2t4Mwo2IQREaJwJwBg2LsHYmJrEIVdrDGQIbqKcQ4+sumTiE5Qy5a4oIRFYKmJQXjvSYbvi3CYxez6h6twv0SardrNVX/5NkZ3FzPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9V+A98rIq/3FrWalS8qy1FFVHbUYPK5vf076atmg9E=;
 b=hZYXRWwUOpqpSIKA03GpeHFHONeKveD72IAdS894/0RdX/jVUIeKG09Urfuq8VqIHo6DoT01uDV7K5MpMqnqs4OnIaMJJpKqqY6Qh/n2xBN3favmJaXEzTvb6nhvB5VWa5n++IUaIG3i/ynxyzycB47/+3FdQTaaj+5hJYhoeffAFkSwGUQG3tcVipcduFxVs2PIw5kWtkJGvZBIg9Orq+kXGStOy3oMy+77xR1H1oCl2o6JNSpcyGa6DlM+CPDluiVCIebPeZfpev6510EwD3o8syS9Y6v9eLDXRtKGLzx+i4/C3/0yyjEhYT9jyqcwVdAePCIrhHvwi3t8/V0h7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM5PR1101MB2235.namprd11.prod.outlook.com (2603:10b6:4:52::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.18; Thu, 16 Dec 2021 01:11:30 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::6891:cc9:565a:f331]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::6891:cc9:565a:f331%4]) with mapi id 15.20.4801.014; Thu, 16 Dec 2021
 01:11:30 +0000
Message-ID: <88875915-71be-9ce0-c62d-2a04c71369e4@intel.com>
Date: Wed, 15 Dec 2021 17:11:26 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915: Improve long running OCL w/a
 for GuC submission
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20211211065859.2248188-1-John.C.Harrison@Intel.com>
 <20211211065859.2248188-5-John.C.Harrison@Intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20211211065859.2248188-5-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0031.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::44) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 211be2ba-5964-4417-739b-08d9c030fdcd
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2235:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1101MB22353BD0ADC114A809251B17F4779@DM5PR1101MB2235.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oxPlG3zSqJ3EN9+RxIPfE/kQkfWNkH50hcR5zvJonL3dnifjDV3azLU5oOXDfG+uJRV0dH+hBJMFSIeXut9/oc3cgRwia2d+jvl3jHOi0WJ7NXaqQTk8W4l/OYVe+6WNoEAN9KtPw0hcIjYDirxHmNPviGeNh/wJQBdyIMIB5fjvVROsITpyzWua+68eGa+ECy2BmcLzW7jNCLp+bCY3XGsId1yLpIyeFW4szKTuUfRtEjeijAxneH6FTnZc72tjkyzzzmbGRJ/1fIeSTwx+eul440f2TjI7stH1ArkOZvY3Z+wo0ih8BrS5mYnmm7MhhsCDvbVGdxOu7q/+syjrxNUffujfxyXmvxkHLKK3MCUXPhpAAGVjBHPPI7fkJdDg7TT0hFE9p+S/7p/xci442AN6uX2TYw+FjSZsdd7ItbzPBHUO+JOHnzYzB07BRKdtDflePf/vaEl7PzdGcsuEH3EkGDxjjh7SMRRjiED4UtSbmfmsh1Ztigh2sMVQqBLklUgU1XekBtUWV5cpwbfucL6NGOuEkDEq9O/+OjcNV4wFfGRIvZ42zPrsNJ3RF/VbobFA4DYhaYie+oszMAvIsZ4RkQ1qUL2/X1sQWCWi2RvpGFwaoMaJ0rz2HQx9ZbkKqXX9iIZWpMsVw3nlhPIU4d/3AThkP4ROmDpgzG5fEJFm52TAJj8CgZOsuzZsfjC+SNvdWf0LX+6tevKdpzAS/M4ZYPgTnzEM18sRiwr7D8ONWoBB9X9HM9za1stjs4WZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(5660300002)(66556008)(66946007)(186003)(4326008)(8936002)(6486002)(6666004)(36756003)(6506007)(86362001)(53546011)(38100700002)(31696002)(26005)(450100002)(2616005)(316002)(6512007)(8676002)(82960400001)(31686004)(508600001)(66476007)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlZnRTNZVHZ2c0l1MzBkN0luUVZXWXpIbDFvMEZOUzdDYjJPQ01mdlBhdG1x?=
 =?utf-8?B?dW1MMy9JeWZzUGtMcmVwT2ZSbGZ1QUkwbUhUWjFhM2laekg3TkxmQm1CS005?=
 =?utf-8?B?VE4yTXpvL1JNTUs1WW1EZ2lDeTJIUXNjeVMrR1VuS0svdGc5eU1MY1ovbUJq?=
 =?utf-8?B?eEFwcVBLWHFteUMydVpTVVd5d2hhYTVNU2FWa1JlTU13b0t6WmtFNy9oNVp1?=
 =?utf-8?B?S29rbk5xL0Fia3VGV2lqMlBoOWJRb0Z3dDVTY0YwZFNDdUJ2QUxnWXA4YlFU?=
 =?utf-8?B?eWVFTVg1TWhFeEhxNDJxanZHK1FDdDFhOE4wYlhWU3RoRHFLUVZ1MnQwUjkw?=
 =?utf-8?B?a2Flblk3bFM1NDNQRWFUOWFWKzdDY1pianM0dUE0QzFQOEl1NndGL1RUcFUx?=
 =?utf-8?B?VTB2dU5aNE95NmkzZng2Z0JIUkpKMG8wbWhEMmVteVo2cDJPSmdIaStWdjIy?=
 =?utf-8?B?Yk9jSGtwWHBnUTZSZ2pUNW5iT29aUXFZS1hFUTN5Njg5cHlzWm1vNktzQ1Fh?=
 =?utf-8?B?dG5kKzZ4SGlIS0hnWms3U09VU0luNUpySmhEZTZEMjRZTmdNSjJWSjVFdENL?=
 =?utf-8?B?UHJPUXBJU0d6QWNBOEduSWtIaXdManM2N0lEblIyTU1IU3ZjUVNZajJxc1dx?=
 =?utf-8?B?L2dvczgySytCeWR1UnJUYlhha1NVeWdGK3ZZZXFrMHVUTWRhQXkyMTg1Mk03?=
 =?utf-8?B?blQ3QTVwQi9EZFVTQW5hSGFFZDJuUzRLV0p2cWxTSkpZMnkvWGRobkJOVHRW?=
 =?utf-8?B?SVljUm9PTW9sL2UrR2tDS2JRWm93bVJ4di9uQkJOaU1UNDRWc0ZHZ1FOdXE5?=
 =?utf-8?B?Qmx0bkh2NDh0TjhaOHNJZ3RYNE85bkxZcFFyc1Vyb2NKcGxJbU8wTmFabkZQ?=
 =?utf-8?B?YlhaZmxBVXVndDNwSTFha3NkYkZ5b2pxRXlKdVIyODlyQ1A4ZU9aR1JzZWFm?=
 =?utf-8?B?UVBSQ2lxNDRqdE84bjJ3Y0dZZHVGOHhNZnFOVkJFL3dLditRYUNyY0huRy9Z?=
 =?utf-8?B?UVNTNU52TjdnZkF1ZWhObk5LOW1BczZneXNNTW9UYWFKajRweDFNZ0NJMHBJ?=
 =?utf-8?B?RmYyYWJYTU8vVFhjRURiME8rUmJYRUlNWmVGKzV5K091Z2RRaUZoT3BzZDVF?=
 =?utf-8?B?UlZHd09XUVpqWGhNUGhYUUFpekVad1RpemhXQ0x1VlFoUCtZWDg1M081RnUv?=
 =?utf-8?B?NS9IenBENW8rU3hwVXk0VXBmUEdVcXBTNnF1cWkwZGgvZTdZdzdGeG1NR1pH?=
 =?utf-8?B?VmRSdmx4MnhpVTU5aHlJMUxidTI2Z2lEaU8wYVdkWS9paGUwY3hNSVRjVjBU?=
 =?utf-8?B?RURxOWlzWVhtQ1VUK0ZKN1BQeXdxM1ZHSDkrYlh1S0VPRVlRRlcyZjljZFkv?=
 =?utf-8?B?VEJJOGNmc1hiUHovZFdPQ3FCVlhuRjZiNEVkMk93eU1RNTNudVB1NUNicmtW?=
 =?utf-8?B?YUZEdWE4UDM4SVJJa0FWaHpWUHU5YjRaVkpBd3Z3dldJdkZITHJFczNaQnl6?=
 =?utf-8?B?UGhCd0c3MWVxWXU4Yzc5TE81VjZzcjY5cWdpdjNrdDZSMXlrUjlVdEtaQ3hw?=
 =?utf-8?B?M0xGanhpKzEwNTNOd1FqM2FHd0pjcmgyemRMeWg5WWMzT2FQN0hHZEtsMlV5?=
 =?utf-8?B?d29qTUtHb0JIQmhjcjhlS2x6Z2xSM1RhMlhXeHZxVFRJb3UwM0V1YUlGUWVK?=
 =?utf-8?B?ckdWUk56WGpmZlpnMkdEZWVWQSswMTY5d05pZ3lKTjhxK2c4RzdCWDhIcDNp?=
 =?utf-8?B?N3BFOEJlalZxdFpUdWYxQmEwOXl3UkJCYW1JcHQxMzRwcllMSHR6NGZWcnZv?=
 =?utf-8?B?VlBzWEVaclZtTlc3TUVhdG1XeUswUFJ0TWFLZzA1Ums3Z2gwc29HSEM1K3VM?=
 =?utf-8?B?d0ZkRUt2MG16RE0vU1RWWW9KOENmZU5KcmtwMU13OWluYmZGRmFmYk9SdUN3?=
 =?utf-8?B?K2pRZFh6M1ZiZ09abmhIOVdUcXhxSHlMaEo4Yk5YK1hiYzNIVzBuMGhZYU1k?=
 =?utf-8?B?Rzh3SjgvZk9yU2NtU1ljc1J5aFoveE5LNUNMM0txdFY4K3JhZHZGb0gyNzYr?=
 =?utf-8?B?WG5EanQ0RThUSjhMdVBoNENsWTVuSzRmNkF4UDRJVGk1aVkzQzZsMDUxekJM?=
 =?utf-8?B?eGN0YnBQOE90QWFVZTVEOURrRXVCUEJpOG1wNi9PM3BRTDVOby8zTnEwYkRM?=
 =?utf-8?B?U1dvaU1JTkRhT05qVDExbGQ0VG9ab2JJWTdLUGZGMS91YnlZcG5HSmJxZVRY?=
 =?utf-8?B?dEtROTJ1bGJyZFk0dFdTczVuajlRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 211be2ba-5964-4417-739b-08d9c030fdcd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 01:11:30.1522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ly8/8kP1Rp0+rKurI77eP6eEe8RiVceWRXlQM3A79ileVIbTVGwEiHCBJe4knn2cznmFm8nY8rTBweL45yZDbRQXiChEMgl0RVQ9/2IP4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2235
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/10/2021 10:58 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> A workaround was added to the driver to allow OpenCL workloads to run
> 'forever' by disabling pre-emption on the RCS engine for Gen12.
> It is not totally unbound as the heartbeat will kick in eventually
> and cause a reset of the hung engine.
>
> However, this does not work well in GuC submission mode. In GuC mode,
> the pre-emption timeout is how GuC detects hung contexts and triggers
> a per engine reset. Thus, disabling the timeout means also losing all
> per engine reset ability. A full GT reset will still occur when the
> heartbeat finally expires, but that is a much more destructive and
> undesirable mechanism.
>
> The purpose of the workaround is actually to give OpenCL tasks longer
> to reach a pre-emption point after a pre-emption request has been
> issued. This is necessary because Gen12 does not support mid-thread
> pre-emption and OpenCL can have long running threads.
>
> So, rather than disabling the timeout completely, just set it to a
> 'long' value. Likewise, bump the heartbeat interval. That gives the
> OpenCL thread sufficient time to reach a pre-emption point without
> being killed off either by the GuC or by the heartbeat.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

On the approach and the code:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Please get an ack from the interested parties on the actual numbers used 
for the timeouts (they look big enough to me, but I'm not familiar with 
the compute use-case).

Daniele

> ---
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c | 42 +++++++++++++++++++++--
>   1 file changed, 39 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 352254e001b4..26af8d60fe2b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -382,9 +382,45 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
>   	engine->props.timeslice_duration_ms =
>   		CONFIG_DRM_I915_TIMESLICE_DURATION;
>   
> -	/* Override to uninterruptible for OpenCL workloads. */
> -	if (GRAPHICS_VER(i915) == 12 && engine->class == RENDER_CLASS)
> -		engine->props.preempt_timeout_ms = 0;
> +	/*
> +	 * Mid-thread pre-emption is not available in Gen12. Unfortunately,
> +	 * some OpenCL workloads run quite long threads. That means they get
> +	 * reset due to not pre-empting in a timely manner.
> +	 * The execlist solution was to disable pre-emption completely.
> +	 * However, pre-emption timeouts are the way GuC detects hung contexts
> +	 * and triggers engine resets. Thus, without pre-emption, there is no
> +	 * per engine reset. And full GT reset is much more intrusive. So keep
> +	 * the timeout for GuC submission platforms and just bump it to be
> +	 * much larger. Also bump the heartbeat timeout to match, otherwise
> +	 * the heartbeat can expire before the pre-emption can timeout and
> +	 * thus trigger a full GT reset anyway.
> +	 */
> +	if (GRAPHICS_VER(i915) == 12 && engine->class == RENDER_CLASS) {
> +		if (intel_uc_wants_guc_submission(&gt->uc)) {
> +			const unsigned long min_preempt = 7500;
> +			const unsigned long min_beat = 5000;
> +
> +			if (engine->props.preempt_timeout_ms &&
> +			    engine->props.preempt_timeout_ms < min_preempt) {
> +				drm_info(&gt->i915->drm, "Bumping pre-emption timeout from %ld to %ld on %s to allow slow compute pre-emption\n",
> +					 engine->props.preempt_timeout_ms,
> +					 min_preempt, engine->name);
> +
> +				engine->props.preempt_timeout_ms = min_preempt;
> +			}
> +
> +			if (engine->props.heartbeat_interval_ms &&
> +			    engine->props.heartbeat_interval_ms < min_beat) {
> +				drm_info(&gt->i915->drm, "Bumping heartbeat interval from %ld to %ld on %s to allow slow compute pre-emption\n",
> +					 engine->props.heartbeat_interval_ms,
> +					 min_beat, engine->name);
> +
> +				engine->props.heartbeat_interval_ms = min_beat;
> +			}
> +		} else {
> +			engine->props.preempt_timeout_ms = 0;
> +		}
> +	}
>   
>   	engine->defaults = engine->props; /* never to change again */
>   

