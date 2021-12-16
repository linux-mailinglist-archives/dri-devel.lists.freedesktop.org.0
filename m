Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DD647675E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 02:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E3210E8DC;
	Thu, 16 Dec 2021 01:17:01 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2995E10E5A4;
 Thu, 16 Dec 2021 01:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639617419; x=1671153419;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j2k5bFGbQ+omY7zCHX56BSnF698rysXWIIMndXwIe/U=;
 b=RnyQQHil4FWGGjPNuGOuWEEFW20BnY4CFc9mgRbxnNTSiIJK6+SLq10y
 IvGBan9gWDJVhkf+JxKuKz/KesnBENkisPkylk3ebrU+LV/T+spl5JtWR
 XfY6GjuJ+jlE+tp89z/YVnXuciX1vtD8/k+MOSu7mzDItbONS/gO8FAVD
 j1mpMD3u+G5/ZMEDIywVPpQ0xCLH6OieDl0rUGad7FcDerdhnx+wJpuDM
 vhCmu1LrkoVkTQPoxkSwCd8adtfLX9/87TJl7XmWCuKkXslLnb+4VDOpu
 NtcralPOBe0yy8XM1i7Tkwhybefoj7DMo7165qyaWUDpkDxNj6llXZlgs w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="325655386"
X-IronPort-AV: E=Sophos;i="5.88,210,1635231600"; d="scan'208";a="325655386"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 17:16:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,210,1635231600"; d="scan'208";a="662173638"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 15 Dec 2021 17:16:53 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 15 Dec 2021 17:16:52 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 15 Dec 2021 17:16:52 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 15 Dec 2021 17:16:52 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 15 Dec 2021 17:16:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+CC8xO3Ww/3C/eJbWeuE8u4HNItLzGyM+w2mAbgbIraSfuJnSGeXcQl9dDyJRVd2XWL9PYYWeBCzeTn5TPXmydSBs2WXOm5tIaBM9o3+tuUnG6OMO3s1k+FFhgaj1Z/9Yyq1YrLCWEzzclDLh1YFGPvg556n72HHBQYl2guQvobaE0vw82QaDYfOe0cSoZJvKz0WOfX4IYLD1+lRZFkSX0vfdrMqFaVP1lj3OZFzyglSV1UAFU/o36wCYQWFhP1YBhIH221XpB9hrWpY9p0l3ha9QdqJkuEUEVRYnhfKVWXK50vDzFbeIiVhx6lc1p/e4GYmwHn+7C5c58m+NX/Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSIH9KnvaUGdjNs2eQTxzkEAmlgpCpbnywa9oqFShWo=;
 b=GVUm4ucW7xaPh1ZHzY6eZn1mQfSBFwirrKjlwPnvX1RNTXs6ami1JInjAAm3Btt1gikHoZauJY/k8+siarswsq3nzchYFI3pIdzZvtKMFqZuya5+4/bf92t3QhS094MAOy50f6G0rAqfmNOnpTnJ4oWMF+q+N9Zk29AV7nr7CKbbta4Yu4gl40MBRHJpKOeBrUbjBU81eWWu7r0VSN4YgsYZs9W4QBaN0Rxmm6UD/R8GI76qvs3JvZtIihZXpYcaTQN5FSBLE3N7TATOLwTkkqRWmzx4+Q6mnR5t2UFopMOMDk4TNloxMD+O0C52NGqwABWmJiYg8h53FC0daqhvYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM5PR11MB1946.namprd11.prod.outlook.com (2603:10b6:3:10c::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14; Thu, 16 Dec 2021 01:16:50 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::6891:cc9:565a:f331]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::6891:cc9:565a:f331%4]) with mapi id 15.20.4801.014; Thu, 16 Dec 2021
 01:16:50 +0000
Message-ID: <6a6090cd-753c-eb2f-c34c-e9aadf4aece3@intel.com>
Date: Wed, 15 Dec 2021 17:16:47 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915/guc: Flag an error if an engine
 reset fails
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20211211065859.2248188-1-John.C.Harrison@Intel.com>
 <20211211065859.2248188-4-John.C.Harrison@Intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20211211065859.2248188-4-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0054.namprd11.prod.outlook.com
 (2603:10b6:a03:80::31) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6f4c2b0-b58f-4b16-0b0a-08d9c031bce9
X-MS-TrafficTypeDiagnostic: DM5PR11MB1946:EE_
X-Microsoft-Antispam-PRVS: <DM5PR11MB19462353E557BFF64D5198B0F4779@DM5PR11MB1946.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GdCLU7oalgzQfA8Z8aYVZfDfyc3dsjMNV+D0hAj8FRsoD6iGWq00zSMaAXHrQXu+UvgHTyp9yGQK1oMu2cLBKeU/RRdN/7ESqCT/SIknCTveOP7XJCGwaLCPlepA3asDm8D7vsBkRXyvf/yTv4+FJ+kDp2xYgrq8nlCWjJGt20INC6RYAm8nvM3S2UbQ9SKhtPRflYYtMGqLhfGSSqn8iYehVH++9JUrZaItKOVd0fIYI4di+4pMhN/bhkOrs5WHoKEoIpPag2OF+cFtgElpeWb/QzOq5KsJH4vbo8ET5bvna1D8IXIjEQRBxEqkVd5BNC6gQgYGGARSlm3GESbEoGinO3A/6ZazJGW0PWqpXtdr4Y/g1/HaD+GHUvFKBAP5L/laK0eIt/kYhmzx6nuXUWwgLwpf18RccefV5YkWNyZs5/6VOcpV0Ye2cK0SD2jU17EuExKHCsfgFajWTwBs8tJEVw+YJ263C+ZipLA7a5k9Ok2m6mVeQctH0rbq+nmEWp5PiQhVxMSbFrlQyh63YKn6WS3+jQDk79aJeNcumP1c4Yq+/j8YcLkDwXeOBQ9d1yY3SV/RMdtQ82sjt9mbqTNfdfPUkGxazlqKqDxq1ZUt5apb4Gxz6vj/k5G9uvMfYvqpGwNfyhTt9V3Zlf0eQNQtbGxZ7UXwsn56fJKACymXm35TeYztTfsBCwiEQU+jxdhIKG1Mz2WdATZaIvjVj7EnfE6z78/HKf4chunKbhKfSaUL9DbjrveUybluaJa/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(82960400001)(508600001)(2906002)(6506007)(36756003)(5660300002)(31686004)(8676002)(86362001)(6512007)(38100700002)(6666004)(31696002)(4326008)(83380400001)(6486002)(450100002)(2616005)(186003)(26005)(66556008)(66476007)(53546011)(66946007)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUJxeituaHd5Wng3N25oZ2s5RHFBRW1ybS96VW1sak1hS2thUkZ1ZjNOMlNU?=
 =?utf-8?B?TTNjVy9LQzI1UEFsL2o2SG9QTjJSZ2YwZHJQQ2xjMXQvQ0FoOU42NXJrbjVI?=
 =?utf-8?B?b0xKa0R1THlKREFiM3FIYWNHalB1bEFHSDBvZ2UyUzYrbnF1d3hUdDVkZmpX?=
 =?utf-8?B?S3V6R3BsOEkyZ2ZkK3luaDQzVUJpV1dlcUwzRnRqQ3pUcXRqcU1zbWJKSEZP?=
 =?utf-8?B?MmQyb2pQTUtHZjVIck96MjFEUkY2emJUdFQ0YjlRZ2dMbFovMll4M1lkQ3c0?=
 =?utf-8?B?Y3VnOGtqaW5MZVFwNDJDZXo0ZE4rQ3JFRWtKWXZmbUdvNjN0WWJ4ZXc5VDIx?=
 =?utf-8?B?NkVsLy9mSTdvZ05LbndaNnlHdmd3TVF3aXdNSkJOcUViREdKYjMrWG93U2w3?=
 =?utf-8?B?WXBXKzlTK0VYSVBXeC9Sem9WSkN2c3hsUyszaVYrTWRTb2Z0NXA1TlNMeTZk?=
 =?utf-8?B?b0lZWEU2TXJQV2t0Qi9VcFpYSDF1UTM5ZWM3dE1CSHZjRVFjbkVYN21jSTBq?=
 =?utf-8?B?cFQwNlpGUTdLSXk3RXV6WHgrN0Uxd3k1UWFhc0p2MW12NFJuZEIzNlFPNDJK?=
 =?utf-8?B?YXFQRm5zZFJOMU1sVXp4RXNoSFNSOTdYM3RoMkVudkJ6MVV6bWNacG9RT1Jl?=
 =?utf-8?B?UytqZ3VQY2MvaXA0cWhCRkxRQ01PTkEyRTl1MXUrRnY3TGcwd25sRlg4a2l3?=
 =?utf-8?B?WTQyT3hLMWEwa21adHo4WGtNcWhUSDJtb0xkQmFId2RYdTBVSXNaNXA1MmhE?=
 =?utf-8?B?ME1CeVpNL0NzRWROcHFNanMybFc2UUhsdHZLZVc5L2UrU250Z24xYXB6M3hn?=
 =?utf-8?B?MlJCVUlxYkgyNnhta0YybktJc2hEQ2xjamwzY1dyYy9iMjZPS0RQT3k4NFhW?=
 =?utf-8?B?NVMzYlp6bWw1Z25aZ2JNREhWSDdNS1JJbG1xaXNteGJTcXZ4Q0lKMVRsV0Zv?=
 =?utf-8?B?RHFmMXVpSzlPeHlTdFpIajlNSEJJWFo5TXlhNnhpVHJGMGg2QlQxTjhReVRC?=
 =?utf-8?B?VkVtY2NiYkIrKy9lMklWMVRCU2hsSFpMWnpNWXV2bysweWhYVGxaekEvMlo3?=
 =?utf-8?B?dWt2Vy82dnM4MFhORXRKWS9kVS85MlA3YjI5SnRIUkZyM0JhZGNJWmZsVVIx?=
 =?utf-8?B?N25YcFU2Yis0MFpNL3c0c2hVdVpibHEvSnpFbGFET3A2L2lSUGxaaFRIZVlO?=
 =?utf-8?B?SzdreTl0YWNvRHFYbDhKU2RrSEY3NThGNjJnbkxXQzZrWjVDajAwaHhodW9M?=
 =?utf-8?B?YmhJY21lR0VhdlRTa2F0cnZPVmdWOHVDbGdnVlJVdWF2clE4NXJRNkxDLzYr?=
 =?utf-8?B?NFV2dDFXSUkwTDRGbkg1S1Rzd05mSEFyU3R0QnpEMEY3cVJ5bWNEYVFISDNm?=
 =?utf-8?B?VGJINmZBbWF6V09yZ3FWRDVoVG9JYzllRkNwc3h3MHdtY1NNUVZQQnZDRkZJ?=
 =?utf-8?B?bkxOUk1kYzlieGU5MDVNOGE5TXVPMDRmM3F3MjdnK2EveHdrZ0VLTlB0OE92?=
 =?utf-8?B?bHVzZzhlOGZVOUpQSlRtWHZoS0d0cCt0b1gxSE1zeXIxYkRodG1QNFFRYjU2?=
 =?utf-8?B?TGhrK0tOdFdLZFBnUjV2SkpEVmZvQlJwSnpLS3FJbGNOWVcvaGp0WFYweXlU?=
 =?utf-8?B?V1NjZyt2UG41blVjK0VhMkhFRXd5ZUQ0Y1IzajlmUjlPeUIwR1E4YkpOaXo5?=
 =?utf-8?B?dXhhelBSa1hENjl2cXJCTVRocHZiQXFQQW9maEdjbzZldkUxMXFBa0docktV?=
 =?utf-8?B?SkFqK3VveTdlUXdQVDloSXBpMnhKS1FXZXZTL2NCdkZwQzE5SG9HdzY4ZXJQ?=
 =?utf-8?B?T3lFbmFoOTgrLzh0WXN1SmlBR1dPNTRWTVMyZjZKbUYzQ2dUNlorU1RVK2Iw?=
 =?utf-8?B?eW9keU1pY3FYZGxXS2lORjRPZGQrM1hWc1MxV0FjSTgrdHQzbW0rTmFNa3B3?=
 =?utf-8?B?OFQyWnNpZXdVajRGZlM5U2VLNG5IK0dOU2J0c2lJeU4xaFlObVRHQzE4ZERq?=
 =?utf-8?B?OVlUOEhRQ01HVC9SdVA5Y09nNndoWHdoUUh1b3NxK1hybXpoZHMyVm5BQUg5?=
 =?utf-8?B?YVVGRlhhczJjaDJqblphSTFOT1ZKbzZUSzNUQnNoTmFHUmZXUHd3emJqa2RT?=
 =?utf-8?B?RFl1TkZZbzJ4SjhCVW5mNFJaME41ZlpQMlYzMmxsZ0ZjUHlJVGtZZWRVVE5W?=
 =?utf-8?B?UHBqeWYvck1POXJtRy8zcE12ano2QUl5SmNNV3daalhvT0c3OU5PV05wczll?=
 =?utf-8?B?ZFRQZ2ZpcERyTDZudjlFZjV4d0NnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f4c2b0-b58f-4b16-0b0a-08d9c031bce9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 01:16:50.6689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2tEB/qemUWgFwLeniLrXXbZGfAlyIW74ETaGJFUaeFpuK/uWINqPB3VuHnnS9jBy8u8njdurDGFK+OinRAuX4a2kmBbOADfzADwfrvCWtu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1946
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
> If GuC encounters an error during engine reset, the i915 driver
> promotes to full GT reset. This includes an info message about why the
> reset is happening. However, that is not treated as a failure by any
> of the CI systems because resets are an expected occurrance during
> testing. This kind of failure is a major problem and should never
> happen. So, complain more loudly and make sure CI notices.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 97311119da6f..6015815f1da0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4018,11 +4018,12 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>   					 const u32 *msg, u32 len)
>   {
>   	struct intel_engine_cs *engine;
> +	struct intel_gt *gt = guc_to_gt(guc);
>   	u8 guc_class, instance;
>   	u32 reason;
>   
>   	if (unlikely(len != 3)) {
> -		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
> +		drm_err(&gt->i915->drm, "Invalid length %u", len);
>   		return -EPROTO;
>   	}
>   
> @@ -4032,12 +4033,19 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>   
>   	engine = guc_lookup_engine(guc, guc_class, instance);
>   	if (unlikely(!engine)) {
> -		drm_err(&guc_to_gt(guc)->i915->drm,
> +		drm_err(&gt->i915->drm,
>   			"Invalid engine %d:%d", guc_class, instance);
>   		return -EPROTO;
>   	}
>   
> -	intel_gt_handle_error(guc_to_gt(guc), engine->mask,
> +	/*
> +	 * This is an unexpected failure of a hardware feature. So, log a real
> +	 * error message not just the informational that comes with the reset.
> +	 */
> +	drm_err(&gt->i915->drm, "GuC engine reset request failed on %d:%d (%s) because %d",

In the error handling called below, the reason is logged as 0x%08x, so 
IMO we should do the same here for consistency.
With that:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +		guc_class, instance, engine->name, reason);
> +
> +	intel_gt_handle_error(gt, engine->mask,
>   			      I915_ERROR_CAPTURE,
>   			      "GuC failed to reset %s (reason=0x%08x)\n",
>   			      engine->name, reason);

