Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EF846F3B9
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 20:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA8210E242;
	Thu,  9 Dec 2021 19:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E7310E226;
 Thu,  9 Dec 2021 19:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639077295; x=1670613295;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uEjp19aVaFg44o+mMiY8++qBoR0c/PfmhDFGpiQVaA8=;
 b=M07/z30/Z6/2LL3GNgHzABcFFhvScG/Vj0rbRjr7jqwmYd+uBlP7JI05
 rgEyJN1I1dPkbFLiq7Qvu6e90wDHKBtZKpaaJuJ6dFZgJYQ/1owYZrZFV
 +PEZvA62asXXOvQW4kAzmD3pOBHxiCG6s8Lt1jAr2UH9L32DmQGG1ILDu
 5zun1OQh0MG920aTY27KIfgBQ454QjBxHprAxY0CbObXhnhIbampN/D3I
 Wx3dP6/TUIjszns5TBKdUUSGEYwWEzzoAaGbX9pRk3lnyS5/oeQXM4Knp
 VJ4h9v7fKCL/5ZKgDYTWZ50xNnvfYeJQ6hokiFe3I2quYmE1D9ccR6jEi g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="218211976"
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="218211976"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 11:14:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="752677834"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga005.fm.intel.com with ESMTP; 09 Dec 2021 11:14:53 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 9 Dec 2021 11:14:53 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 9 Dec 2021 11:14:52 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 9 Dec 2021 11:14:52 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 9 Dec 2021 11:14:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QyQzJjZB179wHLgH+ORxhBG2zSSmhkmo29Jd/S9DTZBo1NMXVIPJTpLeJGs4rV/szBQSAzqz+eK0/qb5w2q4OvGdbBbm6IDj075/fzwLyOe35vBWBmMfgYgiPzDZN5DHKYNIva0BqH+TNl28KSFm+IoUHtXjMzyKFgFEwfkzQVPwUjwCRpgGguqoMfjcWscs9eEKOkDDw6J8DZWc1xmWUXan2Lul7I+GM/v7vo1WSgAUU7jvav+ovJJjeFQS3dT4eWnuIhrjX/+NXoib5VW0snKb19lDVOyOwJg7AyJa+LcL5kZDLiQgeZO32s84r8/bS6U22/vSUth5Obr6dVhrRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkL2udyV0VMZT+rEg7aqqnANUKd5p8vkAmtMPXi4JZE=;
 b=NyvlamUmvimFiSqAkAUYYFLRxVBQyeCp7nLZt9ygM2LivUj1ndF62EUDksp5jte2za804yeq7a+ygFm3RZ39ZjFxSCVA7TC//rdmjKFUg/0U6MtDf5i+OLK7dYN8qZEw9yCL7PtW3Q9ALPPAhDCcOG/DLlcJl1cK2/FNdTIvDTIfDSLn5mSj68hJSigUKmECV1CUd7nE0JjX4hDa/KGASrIms0nW86mak0WBigOC/pgy1N0lCzHagxV+6NhmmA6HnX7IMs2ubJiofIy27mmgnfCkNI9d2NFZk9imPn6/X9GLHiM4GDtBAUVMt/kMRmdeTlL/94Wy4hWhvDUj7M/yEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkL2udyV0VMZT+rEg7aqqnANUKd5p8vkAmtMPXi4JZE=;
 b=ZNA3LvYuk9bGP5jCQYsVFp3oirUZV429n8yitCfrJC9sF+M/HbBhLQeLG6mMNtehOACORXLoGSj58FlvTC26AiLxLsy6AyKY7Jy3RfQ+0I0ZoWkYxpPPao30zNwWORVUPaJaJJ2X6wI8O/IlHJQYklsMkC97Op4JGcoYAJPtFAE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB4577.namprd11.prod.outlook.com (2603:10b6:5:2a1::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.11; Thu, 9 Dec 2021 19:14:49 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::d91a:c903:855e:5f24]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::d91a:c903:855e:5f24%4]) with mapi id 15.20.4755.025; Thu, 9 Dec 2021
 19:14:49 +0000
Message-ID: <d1fb9875-4af7-301e-cd83-9aeb7e8a5b52@intel.com>
Date: Thu, 9 Dec 2021 11:14:46 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/i915/guc: Use correct context lock when callig
 clr_context_registered
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211209184814.21125-1-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20211209184814.21125-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0056.namprd08.prod.outlook.com
 (2603:10b6:a03:117::33) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
Received: from [192.168.1.65] (99.72.232.53) by
 BYAPR08CA0056.namprd08.prod.outlook.com (2603:10b6:a03:117::33) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 19:14:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d38030d-f10c-46ef-fccf-08d9bb482b39
X-MS-TrafficTypeDiagnostic: DM6PR11MB4577:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB4577D5FC6AAE5600C417801FF4709@DM6PR11MB4577.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p2FEdk43whYCDq8sXSdf3xSrmrkkEkxTrz9FYWvn6p6r66pgb45GMMOb/Vr6TeZH5EfUsEdH5ZQpYL8KGUGueDxJIGcTONpnaZKFpdv4tZjY5sAo25/A0Su0lQT45qeGo9FWxVGl20ii4VUhjK4rsh54YUXjHTjRdEyOi9VPWyntsxDq77Vwl3yskRyH/JBQ5vkP+sbX2a7mgO/82T+GXd2tpoWxkjcOoQ5KRLwnarhEW71L+R/E0IsDg4t0zk7ueViBDD2gD2zUK1I+uu9zYhX8Y0Kg2s516QH0Ceaji3uU0iLL4GhfrQ5WC926AaDUETf6SdB4tFIvX4D0R2hUFJwmNzcvSCWUU9FgvcIbcf46EMesbDatjWcPd1Ev2qJHmD70+DTMzEjzoRfbWT3T8hZfEDTPU3YZ2kpsj0lfjsiVSuzoJQSbI8sl3thZzmP7dVrjK3MQOgm5MmIAmlQS5o1tdEPGcOwyILkNBJyjGaZKLUyuWuO5zaVHrSDRycvfM8SeHXIZKb7diwlKNU2dTOQdXhNkXXnkFAgWhqQzsiTG4ymUbBcj2MpsTXpV7jIdDfmvf7gzIXHxELpCDfsp6I93R510VIrBir+/ACa8ygYM88HazXXzrdXbEWRxhwVbfUGfjA6ERZwZm+On5OXTz1Pez0r5Loa1gyJJsee/dCAnJEUBBb3RctHkup4jnFN/V+VTuOSc2hXw9AE5EJHKi4l7CrI4CRxCh/KRcOm5E2U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(31696002)(186003)(450100002)(82960400001)(38100700002)(316002)(8676002)(36756003)(5660300002)(8936002)(2616005)(508600001)(956004)(4326008)(31686004)(16576012)(53546011)(83380400001)(86362001)(26005)(66556008)(6486002)(66946007)(107886003)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmN5ekpsT1Z2RWxYTktaOFA5bVZxUG9KaThvMEtVZ1pyK3c5MVltcHlmUUNE?=
 =?utf-8?B?cmJZTlg5NlErQzZtYjJoUnVScVY0SGhkVnE5aGJiTUpiM3FXYjN4dThzbmJn?=
 =?utf-8?B?Z0xmV21jT09xWGdzazJ3azJvL1pxL2Y5N1JnM1YzUVg1dmlKUnhNNm40M1Ez?=
 =?utf-8?B?ZVZWZGpYLzFxcTRhVVo2TGROZmtISnlWOGRKK3ZlaGphTGlTUFpaaHNQc1V6?=
 =?utf-8?B?TU56d0pMRGtqVUhEalB5S3lJaHFyazRBS3JBL2NTMCtUc0IwQk9OOEtrVm1a?=
 =?utf-8?B?cXZqNkQzNzgvam9iUFVTeXJaZ3lhY0wxMU8rMWV4RVZvUlpJLzhldFpDckhv?=
 =?utf-8?B?L3RnaE9Xa3ZOSERBb1BCL3pPOGJtcHN4a2dlUkVxaFdydUN3Y0lUaUNNeXlr?=
 =?utf-8?B?OEZGeDJxOVlEN2lxUjd2Nzl4NmlMUzNqeTdDd0J3aTU1RysvRXV3VG05MFcv?=
 =?utf-8?B?Wm5FOGxGNlk1dXhlS1FkcGFiK29RWmhVQjc4amxuWGpLMGJZUkhwRmlKR3pk?=
 =?utf-8?B?bHRoMVd2TitBRE9sWXZxb05xODR1TEgvb1BqOGZkTnNFVE1FSFZWWGZnaTRV?=
 =?utf-8?B?YTdvTm1VSi9vcjdBMXhPMWJ2TnBEMEVDb2ZIUm4yb2kzanpzMFVhaFZQN0E3?=
 =?utf-8?B?a0xSRHh2cVRYQVhRY29xZENkTW5UTmJpTUEzSlgyK0ZCWmVDZjNmbUkxV2xu?=
 =?utf-8?B?VURpekp1RFc4VitUaHhWSGVUbGRlQk50cDFBbGVFSTZ4NTk0RTFpdlZXQmk3?=
 =?utf-8?B?NlFORXo1UlVaREZycU5oQnptd0RRcTBRWDFmRFVRU2NtaW05TmRsajNyWXky?=
 =?utf-8?B?RXJTSWxTWTRNcnNaM2RtSXlaKzZOdHFQeHJ5ZWFoMDRzN3NBVzJFSmpFaEZL?=
 =?utf-8?B?dzdTOVFXcEJnNklUR0FPTHJJdHp0TWh1MWVFajBVWUZiZWUvOTZkeTNHa2NH?=
 =?utf-8?B?MWtYK0ZCVmlDcmdveGFjV0hjbnNub0RndEdaVHY0dnBvaVdGVEdiSStyajNU?=
 =?utf-8?B?WXVIV0tGaGlCMjBUNXpUWVhFNGZESDBReENpSjFET21VVUxkbU9EbENqS1NE?=
 =?utf-8?B?Y2hCdlJ0a2JxeUI4bDZlRVpBaGsyR25aU2tueXMrYkdLeHNHSzhZK09IY2Q3?=
 =?utf-8?B?ZWVtaXB4Nk5mNWhjYWNIc3ZOOCt1cGIrQk9MVHBUc0VhYllDb0duYXRpYkRF?=
 =?utf-8?B?UHc3Nml6bURza1pUN3FuRWVBSGtrYlBBWDhMTFNWbU5GQ2RGMlpUa0NzRmtL?=
 =?utf-8?B?MjJpT0YxN3JWeUZjdWxFMkhjMW1hd3dUUmp2N280TEV6TTZxNFpScXZkZG8w?=
 =?utf-8?B?TmRHanBYSm10Mk93RW1UeG1TZkw4UWo2ZzJXQ25TQmdvbWlWaUR0NHhkRERp?=
 =?utf-8?B?TmhjVncrVi9lK3JVSnBrT2lCbFgyYUNuV2ROYzVQSE5QRHZpUmRzVGhSSmxM?=
 =?utf-8?B?OFRLcGJ4bHBTenI1cmhiMGMvYjBEN0lINFZIT09GTWtyV1Nsd3hmcmgvSzBS?=
 =?utf-8?B?SGozMXpQTVkwUks4Lyt6Wko5RWo5YTVTRUttSG1DbHd2RUVJWWRvVWVDUGxh?=
 =?utf-8?B?YWV5dFg4eXg3Q1NCMEtvaW1Za0ZNdmpwdjg3azJoNVpFbFpvdkMybU9SZlBr?=
 =?utf-8?B?b3BhckFKVjdlVGxKcFRYQzJSTXNhcHhXYnU4c3BvRlRTMGpyU3p3b1c1SVZi?=
 =?utf-8?B?UkxzSFphK203Rnpid0srZnJqcC96VlNVam1aV1ZWQlFpK1k0T1lPUDlNL2JJ?=
 =?utf-8?B?aGduNkpsaUZUaHN0YkNwR1NrSnhaenJiczZTSk1JNFNyamMvTlRtQTVObnNE?=
 =?utf-8?B?R1o2cXdiRnhrS1BFNjJkV254TDh1MzNRV2JMRkMra2MrWjkvV0hTdXMxN0ti?=
 =?utf-8?B?RlhFK2NmTTNESllqY0dLcU44ZHZOczBJV1o2TyttRHBJSFpyRXRHQ01VM1N1?=
 =?utf-8?B?VGdnOWluUW14a0NYdGtYcGYrcHdBQ3hlUUJmbnRqL01aUlM5bFFCeDByR0tT?=
 =?utf-8?B?bGhMQy90TEdmVjdReXpHSGZLVndPMmJIWlhheFZiMHdlSzI4Yk8vWkdHcnhL?=
 =?utf-8?B?bENYdU9JUUV3WWV3OGIzWDcxNytHQjdOQUY4b0R4TkZUSzFJNldqd0JBNHZE?=
 =?utf-8?B?UHF5MEpiYWZNOSsyTzBTeDhtUzZzZ2VZR3ppZWl6YzZ0Zk5vbDhPM2k3TkJI?=
 =?utf-8?B?RWg4czhiM2tmWVkxaUE1cCsybDNkMmNacGRZUmNRc2w0MWptU0dlc0NrVy9R?=
 =?utf-8?B?bFVML3pqT3B6dTFzT2FickRuM0NnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d38030d-f10c-46ef-fccf-08d9bb482b39
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 19:14:48.9395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jrMwBf/Shz2+qT1vi8K4YnESCV2VQ9XGwSa46mva3xnET64AgcZ+aUlP+acDAv6rPVnk9mfTuHWYiyzwXm4u1LaUiBT/e3GobtU7epkpXfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4577
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
Cc: john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/9/2021 10:48 AM, Matthew Brost wrote:
> s/ce/cn/ when grabbing guc_state.lock before calling
> clr_context_registered.
>
> Fixes: 0f7976506de61 ("drm/i915/guc: Rework and simplify locking")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

I'm assuming we didn't see any splat from the lockdep assert in 
clr_context_registered in our CI runs because we never hit this case as 
it requires 64k+ contexts. Maybe we can add a selftest to purposely 
exercise this path? Not a blocker for merging this fix.

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 1f9d4fde421f..9b7b4f4e0d91 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1937,9 +1937,9 @@ static int steal_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   		list_del_init(&cn->guc_id.link);
>   		ce->guc_id = cn->guc_id;
>   
> -		spin_lock(&ce->guc_state.lock);
> +		spin_lock(&cn->guc_state.lock);
>   		clr_context_registered(cn);
> -		spin_unlock(&ce->guc_state.lock);
> +		spin_unlock(&cn->guc_state.lock);
>   
>   		set_context_guc_id_invalid(cn);
>   

