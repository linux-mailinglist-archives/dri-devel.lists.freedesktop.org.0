Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA1D61A68A
	for <lists+dri-devel@lfdr.de>; Sat,  5 Nov 2022 02:04:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285C410E060;
	Sat,  5 Nov 2022 01:03:51 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3214F10E060;
 Sat,  5 Nov 2022 01:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667610227; x=1699146227;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VKuHflzbIHwYL0gUN2ekeWQI3QOpwq2Qeg+WIcydp5E=;
 b=eoUBOBsKTyn+Fz12Yurw3O0KOsbrr0Kx1nBsaSpVaN9froVABzx8C7Ma
 I/15qtsPjBNdQm49cmDOsMISgtYBJFvQ1AVucbFBKuclGXaV6PvdNXKHF
 LarWp+KHKU47QDO58oHpWLDvnBBz38pG/O4QF3YcIUdYW6zWDy865VpDv
 SBaPC0msbnXlLTRLMjc9iVFVJuiHK+4YoOM5Ub9OcllYHrXih3oqU34/8
 YSQsRYI9UmJ6V0KeqvWzVThTQ4cQ2S6guhvrwgt1s/ZqviZl/jPR48V+j
 rA21hCagl87HXwMoUHHGHK1Jx3h1fiaZ04N3T3Peb/l4ieDyRYu7oXVt5 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="289834400"
X-IronPort-AV: E=Sophos;i="5.96,139,1665471600"; d="scan'208";a="289834400"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 18:03:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="613259351"
X-IronPort-AV: E=Sophos;i="5.96,139,1665471600"; d="scan'208";a="613259351"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 04 Nov 2022 18:03:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 4 Nov 2022 18:03:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 4 Nov 2022 18:03:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 4 Nov 2022 18:03:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 4 Nov 2022 18:03:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3l+kAEH2XolgRWRtEef4fhBbwEieBp9ui+D+jmh/kH8+OsH3n5/IECryFn4vmMcHvfzSlWMaAIZL680AZl7Yjm5/qEaeXy68Hhy302ZemoO5xBeiZemjqT3etgFpMUOR7utGNRBID3EC91yEnKRri10zPoX/SIGecsrytESE+Yi/1ycH1yMcRM1JHpRAQSYANTSqgbKr3cf1UPAAYd89zkBxnuuA6vo9spz03z4FeTP41uzxiOAIAre7Iid0gRgX/o5VR7dbfeY7hZqw7q49aMXCxTNyoP+VxoAwmM7EmobMMoCx+CU+jyYrAlf2+R0onHYNn+HBbB7+ysqCHYj+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgQqMRk345DhsEoZxl1rboygZjPwkZpsmIi574isPks=;
 b=LnTwGV9aM/La45DWcs4YDWW7y2FFzjJ3Zu35BNJiVxScM8InLVbkVAIK9JJZ6HjcVnTsQuQoDwB0Ki4U69wU/i0mS7QEyemzmadEeAIknH0OvRrv+SMCQDL3UGr1oZcN+YoHJ2OlTuNOLySqP0D9acQ2S5/O45qZDtFIkYUCRD7KRlRgT3Aew0AXKVbyGM69sTuXfxN/qQeXRQLtaPTVWNczeXKtjyhv2Lc17nu6koa3fvAMXld7HHQMDL8F5mmML/vraAvKHBYZDkbgkjIrL52wzVonMQNO4gRzd+X2EwzFr2fniGWOgBrrKAaF1DG+W5cQrdN8Jjq4PfeQ69lnzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB4690.namprd11.prod.outlook.com (2603:10b6:5:2ae::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.24; Sat, 5 Nov 2022 01:03:43 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095%6]) with mapi id 15.20.5791.022; Sat, 5 Nov 2022
 01:03:43 +0000
Message-ID: <6a4d1ac0-a1a0-e1d4-7d83-54b43d226371@intel.com>
Date: Fri, 4 Nov 2022 18:03:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/gt: Add GT oriented dmesg output
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221104172525.569913-1-John.C.Harrison@Intel.com>
 <20221104172525.569913-2-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20221104172525.569913-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0068.namprd08.prod.outlook.com
 (2603:10b6:a03:117::45) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|DM6PR11MB4690:EE_
X-MS-Office365-Filtering-Correlation-Id: d4e01ccd-da27-4f78-f5fe-08dabec99571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hq1jm4WKCKQKLN7Mhvi9j70HXcHb82MX7v5ePa2jtUOLw6gKjpzSriPz4SAAvx40aILTsfpui2PIYaQ/fqMYJeGt/BRiyS7n2aAtOltQu6lr+iUnMzy6DypmD09Bcv2vkNi/9APpGtz0tbIfruv3cvGuUPGiTW8CoYqLF3LO94k7DyJcfuKS/AviWGfMUeBhZNbhO7tZ2vFKABTJnDXLvpMQTSxA22Tk+ROZT00rN79h8KSEgyFwlUiidcF7O5lI7VjpHETCa8ga33uOgkeSCz4FtwlSqd4asgSJsKB1KR+TI+rbTVEEh72nFkIaJU9H4K/hJduZTO+wgOErM69Lpd7wPnuiFqYCpTPxWuLqbt79Mr8nxKe+1PP/cbgFOdTKfe3l7TBhCGR5U4uNH6HxFYzrFG0OYiMN5bGsNr7bI/6ovQiQAnlD7y/ny6Twk/jr+toECrpLe9GM3uJP9k2/0RMo4Sbo2fGpVuX9vi8WbLpi8xlZ0KUlxdj8BBGvEJfnqpB9YhXaT7TDnQiQbYgCRkjOxNrfdrLkqJ/TAmzcbmDN0upljk1kyKUwUMy/vN5Fd3vafOUp29u2o+wLHRbCo+JPRDYd9S9vzgNlfV5gDKrJMTulRBDN8JHX4XsOQCiy3DjwexSwiyvKtjuKYnSb6pDc6NHzYxqh5cHvOhEY+yvtODng420nfBM1LFAMGemYIrrssjtX0xQtIkN/jUCwkYkO+4TRmYP8HPADzPxe60ape0LVRGcstuK44A9ClEPnWfl7s1Irn1Ky/pn+Lqu4SjJ26OYEnnW3kuVwAGUz7B0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(396003)(136003)(39860400002)(346002)(451199015)(186003)(83380400001)(31686004)(2616005)(2906002)(36756003)(38100700002)(316002)(8936002)(41300700001)(53546011)(6506007)(6512007)(26005)(478600001)(6486002)(31696002)(86362001)(5660300002)(4326008)(8676002)(450100002)(66556008)(66476007)(66946007)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDczOGhxR2lacWtDcHRtb1N4TmtXZWJqZFZCNThUcy9RNVB6bFo5NWQ3WG52?=
 =?utf-8?B?NHJvdWFXSG16WW5sdklTTTVSSVhPSXBvd3owQ0czSm84Zk5HN3RDdGNXR0xZ?=
 =?utf-8?B?QTZ5Z1ZlUzRGUXFETlJEcmdMWnMwSWFNQytITXRZdkpBdUxBNSs3Y1Fub0p3?=
 =?utf-8?B?K0VnbWJsMVROS2FjbTQrNy9tV01RSTYzSUhhUm82ZXVac25FY05vaUFMYmFB?=
 =?utf-8?B?eGFtcFVXaW04U21ZUWJFMVRDMFFSdndSb1ZyTjJUbXhieWFCVFB5aHNML2Yx?=
 =?utf-8?B?N05yWUVxcEFVZnZPQy9waWd3Uzhzc1pmOFBxM2hNNHVwbGJZcFRhMng0VUFZ?=
 =?utf-8?B?VFBSVVBBY01rTElUUDZDUkhudTJPalVLbDRiV3I2azhsV1ZpNkYrMWxmZ1dI?=
 =?utf-8?B?bStmRG9XZ0tQMzlZU2V3VEw1c2RNOUFZeGVJS2o5MlNqWStJSjNjY3dkK25t?=
 =?utf-8?B?U2d1VEJxeEdqbEFmNlhVL0dWWm5OL3ljSU5qVkJrUTJIQ3lBWVV4bkpwOWhv?=
 =?utf-8?B?aVoybnE4eFJwci8xMnBqMkRyRGJ2cjFCMndkVnZKb1V6YkphdnAzQi93ZzVi?=
 =?utf-8?B?dEg1MlplbVZrb3owa2IzTys5NWI4SVMyanpwTnlKdlJSdWEyVzg0OEQ3TGtH?=
 =?utf-8?B?M0J2ZEV3OWhXL1RvckYxbXJRU1pJaTI2Mml3aTM0eFpWSnhuVUQzYW9ZTWNa?=
 =?utf-8?B?eVE2cFErSmFhRkV4WkpBUVFTbmRjZ2ZkMXpHc2VTWEFxa1lVZG1jekZ6TVdr?=
 =?utf-8?B?N3NSY09UbVI5RElHcU5jblR6dXkrOUxJSHBjemNKNm94dUlPTjludDhiRnk2?=
 =?utf-8?B?L05Fd0N2aHdZMWJtUmdmYmd6QkloMjBMUnRieXlxTG84Q3ZZaXdzUGVwSzJP?=
 =?utf-8?B?U3VsazcwMU5vbUpQL3pad29URU9RS0t0eFl5UjN0cGVyTDhFZzNUTktkQjd0?=
 =?utf-8?B?UTlrKzB5ckFwYi9BaHl3S3R3b25zazZVNWI1bmJ5MENrdHFxUktBTjlRQzJV?=
 =?utf-8?B?R3J5eXFTTjFnYjgxUzRBb0x3U0RvNEtJcGlObUdHNndYWFRqcTFOaytSOUly?=
 =?utf-8?B?WjRIM0lkVnphcVZmaVZVZ21SQkd0ZnIrc05hVzk0WDB5WjhpOGx1eDhHY25P?=
 =?utf-8?B?WWFnYUJKYzh3QmtybE14U2I4RDU0b3lBZUM3TTVHN0Q0bTBsOGVrZHQrcHly?=
 =?utf-8?B?ZHI5NjRjNktPN09YS3BJVFRIZ0EvUU9jVmFEU3MrbDlSSExqNWRSNTdheWJD?=
 =?utf-8?B?cndZa05SaUxUeS9zVHdCZ3ZOVjBxZVdxVW1qTCtvL1A4cWFqRktkbWdNVmxs?=
 =?utf-8?B?RGpvOVZrZ3UxWXZDWmdXc1ErbFNyMWI3dXI5QVEyZ1NIOTI0SHhLNE0xR1F0?=
 =?utf-8?B?aFRCRE9WbWU3REQ4dWZsMmhuMnI3dWNaYmpMaWtHWThpZlB6ZnBpQzdvMjQy?=
 =?utf-8?B?MXZQMGpnNTlPSmtNSXh0TDFzVzYybStpZ3NkTm1wbm1RRmtyV2hrUnhWZ1Jv?=
 =?utf-8?B?dDZmQVJma3NwY3MybXh2MzdsQjlJNTBQR1IrejJ1eWJsWk1xNkpuNUhuY201?=
 =?utf-8?B?dVU2WUtTU1VzQjBLWFhBUlJSZG9SdSsxRnBHV08yRGRQUTZDcUhwV3FiNENq?=
 =?utf-8?B?RW9pNnhHTUYyYW5iVGpqSTlLdGhJWkNOOC9RdVZaNGpibDQ1WWIvOHJJemxk?=
 =?utf-8?B?cHFsTktQbElKeG1oTnVtMEF6eHBnWnluZFltRjI2dEtra2o2MGJaNXVNV3Qy?=
 =?utf-8?B?TVBsMFp1cE9UVXBXUUtNUzBXWkk4OUFmb1pseG5nNVcrc3FXTW9JbVdvUmRH?=
 =?utf-8?B?aStIYkVlSUEvMHZGWjd5M1Zia3hmUXYrRFhTNTR6bUo5cjlzMURKcGlRR2JR?=
 =?utf-8?B?cDVrSFo3dHBXYlZPWmFtVmx6M0c4ZElRN3FBZ2pDd0lNNkttYmtwUFh1Z0xl?=
 =?utf-8?B?VlFkWnRLQXc5VGcreThkVlFobndHTis3ZjlhRC9LK0tSOWlXbkgyQ2FvSGlt?=
 =?utf-8?B?aWN3VmgrUjdpOVZHQnlJUFcxSGZXZ3B2VUVhWDBCNVlGa0pQOUwxSDlxODRL?=
 =?utf-8?B?a1VIdjBRWVRkdDN0QUVaUllzTzNJM1VXNDJ0cG90RjBlWitSZkd3SUdZL3F4?=
 =?utf-8?B?YlNtaEwxZVZXQkVmdnhyV05tZUw4YzNmRFZzNGdCNXJnYUJRaVUxUUlMNWw1?=
 =?utf-8?Q?Ow+rH5F+heGmhgSkgq81n6Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e01ccd-da27-4f78-f5fe-08dabec99571
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2022 01:03:43.6651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v7jk6iMem0qQgvQABuPQfC59GuzZqqOtYMtouOMEGJqfDWkbrmZ9zJZNLR/cMJyVMvMYgi0QN5QdIsj6qtvkgvB1OxSB0NtwUrhM6aSzBcg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4690
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



On 11/4/2022 10:25 AM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> When trying to analyse bug reports from CI, customers, etc. it can be
> difficult to work out exactly what is happening on which GT in a
> multi-GT system. So add GT oriented debug/error message wrappers. If
> used instead of the drm_ equivalents, you get the same output but with
> a GT# prefix on it.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

The only downside to this is that we'll print "GT0: " even on single-GT 
devices. We could introduce a gt->info.name and print that, so we could 
have it different per-platform, but IMO it's not worth the effort.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

I think it might be worth getting an ack from one of the maintainers to 
make sure we're all aligned on transitioning to these new logging macro 
for gt code.

Daniele

> ---
>   drivers/gpu/drm/i915/gt/intel_gt.h | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
> index e0365d5562484..1e016fb0117a4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -13,6 +13,21 @@
>   struct drm_i915_private;
>   struct drm_printer;
>   
> +#define GT_ERR(_gt, _fmt, ...) \
> +	drm_err(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +
> +#define GT_WARN(_gt, _fmt, ...) \
> +	drm_warn(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +
> +#define GT_NOTICE(_gt, _fmt, ...) \
> +	drm_notice(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +
> +#define GT_INFO(_gt, _fmt, ...) \
> +	drm_info(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +
> +#define GT_DBG(_gt, _fmt, ...) \
> +	drm_dbg(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +
>   #define GT_TRACE(gt, fmt, ...) do {					\
>   	const struct intel_gt *gt__ __maybe_unused = (gt);		\
>   	GEM_TRACE("%s " fmt, dev_name(gt__->i915->drm.dev),		\

