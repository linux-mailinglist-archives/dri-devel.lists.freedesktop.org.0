Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCEC618810
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 19:59:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C97810E7C6;
	Thu,  3 Nov 2022 18:59:24 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C7910E7C6;
 Thu,  3 Nov 2022 18:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667501960; x=1699037960;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ahrx7mYnZ0FfGBX+y1TlvaWTDxIrtCYGoDZqJ3Y86aM=;
 b=N5dqg53fur/zFPGvlmaBs2Jc3rIEWeNTW04ExYKkyt4nl/4oJre1Kc6M
 AbSX8QmPUphsJAlC0HKTkQdCi+ZmaYdNNq2e8X16jjVO+AzThmCnMz2N6
 WBsglWC7Vp6nMTQKfzx1ceP7IW/AfS2sWU1W2TcXGOrqbgwCbhPgoBMPw
 LiOaOGmMmES+cNZe5RbGEShLjJJ8ohPH90g/vhFLXw6/zUmZRtZgKZA+7
 Pcx7ChvZk48gQ+mnaOwihdai4vFRlv0dwN+fVY2eV8ttWUS9/ubnSNJ+a
 fGnQgTRDj3+vdpqomUK//zjETubHnS28Gw332BMtXd2LtfRS9EXz8DEce g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="289495005"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; d="scan'208";a="289495005"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 11:59:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="698346569"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; d="scan'208";a="698346569"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 03 Nov 2022 11:59:20 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 3 Nov 2022 11:59:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 3 Nov 2022 11:59:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 3 Nov 2022 11:59:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+n8KKS+NkPwol4hd0AbQrhXa2uyGxp54mv6tlvJn5v0xgH3CdxZwH5BOOfnST3KyAEqjYT0iUwTf5xLAAOiy896WoFhfuRR/eFxXOdZ0pt5nxL8Jm3H2B1S++nSbNn31mqVnuRN6MLK1lcdk6jauo8XhBSlq10cZKFpiYIla5HiVYk2dD7+3/dh8E9uuNsoBHhR1/ld7M+3Q7fPBbLHcUHv3axyyTIT0QqHsW3wDTsid0MqJD51XnTBRqAm0Apd95dUqBo91KYmfZ/uV4R10clbBbzXeuIOm+QFF6McJnmvLAgIlN7F7bFeOlUABc87Z+cMk5PXYNSk9B6ChNMcjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LialQALnj84TC1uzbgpUKebUHNH4Vfh8OEAJ4g94Djs=;
 b=lLPhFDoEWlFib9mFw+5LAbBkG8GJ/tKkbCaxMB0XkqgZljVBMsCMgK4VOkF5aDdUs2nyxklThQ9LCY8CWYZAW97bA2Z75KuO+z/S2rp6bkg0rp4/HrmaSsiDKPQ3UXDELIhRTGHUNTt2v9o84il5wUdXzNVW1EFc/vtXfGmRJPJ5+GR0qirqEYDlnbqEfLlLD2GZe5vVpffOqdJAKNKE3V18mrf5qaZcSpV8K1/kPGlpIKmx4bztESnEALcKm7lpWiRc5YAfHZi6lFe8+4kzE7T8FXJY0NweQhCq0QHW3tfIHZqv1+ZKjmGOGGJrnLSmKxp8OKruhD9fAp5w4DoIDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SA1PR11MB6869.namprd11.prod.outlook.com (2603:10b6:806:29c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Thu, 3 Nov
 2022 18:59:18 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::78e2:5141:1238:973a]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::78e2:5141:1238:973a%4]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 18:59:18 +0000
Date: Thu, 3 Nov 2022 11:59:16 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <John.C.Harrison@intel.com>
Subject: Re: [PATCH] drm/i915/guc: Remove excessive line feeds in state dumps
Message-ID: <Y2QPhMih97F1KK1N@unerlige-ril>
References: <20221031220007.4176835-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221031220007.4176835-1-John.C.Harrison@Intel.com>
X-ClientProxiedBy: SJ0PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::34) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SA1PR11MB6869:EE_
X-MS-Office365-Filtering-Correlation-Id: b046a21f-5ae3-4cfa-5277-08dabdcd8268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yoDpfEOoplLSV7fzoLqU4MVZ+LNQBCbXhGX++oKekn4eESQgAA+9HvL6amc22WyduquERJrqSt4ota2XqD0fry3RhkZYNI9iVpb7vo+vpDclGrZiO0XnHT07YNnwRJcu3DqgjeVcAj2YPaxaZeX5Ncct1bctrJ7rHAlb4eMiT26cmMsqarhfLzK2oZF6BletIyDGySJo0O1r9lrQgWZW1gKM+lmhN8FiannmL6Z/Wg7ApNBzjJejJMlxfCuzBrNn/7aB3KO/Gic7hpL0duF6MWt2aYaQC24gke5/jU8B8PpoUQHutjjYIOZbvBi102HP9GuFAaUVhBlfDovRfQzWegNxJhLf8at8mFHxzkeWBspbv3aQKtgbv8IpRC+U5wTTat/0fHJF8EMBwzjF7QhmLWAOVGjFJ+u1mVKb46K+dT8LwBAEzobfgsBxkqOu0i/D/+uxgg7TLj8VVWZIufycmjCYhlBKCV8ljwunGtcGifKc8p7AlG2AplmVMg7DapMQCvfN2WcBC/e/kObNrgYztRCbSHW1XMKd0BROm2v4HHLTWxw+AD6ZHcyb7u+o4E5gxHbx6nKyt5xTYJR5LqDel62xk3h6ujQbaUgtLVYohDol1UCypsYUOUOp0hQMCIBuLA6clYX8a+7grG+IpUpW+tsPK5uwCgk7n1Pl2lGGaa5sL6sAEPuuo/i783zqjVuXzxi4Dpb8j7ouHpm5E1WADw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(39860400002)(396003)(136003)(376002)(366004)(346002)(451199015)(6512007)(82960400001)(26005)(33716001)(8936002)(9686003)(41300700001)(83380400001)(186003)(38100700002)(5660300002)(34206002)(2906002)(6486002)(478600001)(450100002)(4326008)(6636002)(66946007)(66476007)(316002)(8676002)(86362001)(66556008)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlpnSzNadkRRb3pJbzAyeDlkTnUzYkdLamdpdUc0MHNFcXlkTkNoL2ovNVRz?=
 =?utf-8?B?QURhOEpTYlB3SG1zSzFxY2FjWjlBMWU4WnhQcnBLcEZTa01RdUdSbEhwSFBV?=
 =?utf-8?B?OWNuVnFMWThCYnJXRVJIalZzMHhhdUtsRENYSVJLYkJybVVpSXBHMExnYjRJ?=
 =?utf-8?B?a2dSM0J6OGRjM3hkZ1M1SStuV0xCekRjbjQrZSsxY1NsT0NZbUdhYVFOYzN2?=
 =?utf-8?B?UlB1WDhNTXRxcm5yZ2VReGlXSGxhRmlsSUZFL1M3YkxtTzM1L1ZPRTkwV29H?=
 =?utf-8?B?WFZWVis0QmNaNlFnSWRTTzhHUndCcVJ6MnQzc2pJbUpDZWNycC9mMUVGQ3Uv?=
 =?utf-8?B?Vm5UU2JYbkxTVU9xUDU0enRrQTZVZU4raXlNT2pZcWlRN29HK3BCWjFteGhE?=
 =?utf-8?B?cENkUWwrRnUySE9Ib05zeU5iOWo3ajc3WUpZOVBXa0ZGN09tV3djcHg0Tnpx?=
 =?utf-8?B?ZnpxdFEwRVBWT2hLV3JVeisydUdKeERHOW9ldHRaem13RlJXVUd2eitMVE9K?=
 =?utf-8?B?ODlsek5DNkpOdUx5eU80ZXAydGpMbnh3RitaanpyS1Noa3N2akZ0WDFwd2sy?=
 =?utf-8?B?b0NEMDNuZFNpVVV4VW1wQWJaTVJWWlE5ZDZzQXZzcng5V1hmbjNtNkU5bG9Z?=
 =?utf-8?B?aUhsaXloNXlmMHR3b3djVjVMVTJRcFFoTkNUcGtrNVR0d1BWK3pzQWpORjhH?=
 =?utf-8?B?Zk9NTVZsR1FRaERWWEVvS3BrSlBrUlZkU3haMVhJREJLOVFNZ2RNU3lpcktR?=
 =?utf-8?B?cEgzSkZwSGZUa2FqMUpUY2VBd0JIZjZIeFZ0SExKRTd2dTBsZDNzOEZ2bHN3?=
 =?utf-8?B?UFZhL25LcWlkeWs4ZUUzYkk0UjA1aTI4a0IrRXp5Vzh6SG5PQksyMzcyTkpV?=
 =?utf-8?B?YVBnbkh6TEI1Ly9YNlFjN080SXMxdXhWL0krR0lNbnpRWVVmRmF3NHQzTCtV?=
 =?utf-8?B?WjcwVVBkS0E5VmFqeGhTOUtMNndEaU5tSWl1dVB1bzdXdUw5d3lQTlZ5ZjBq?=
 =?utf-8?B?d1h2V1JQODRmSlA3K1pMYTJ6OHlpbG0yN3IzQkk4bEZ2R1VRdGRiamsxK0dw?=
 =?utf-8?B?T1FWeGhiZU5KSTQ4VUF1RFBWVTNrc0duaHlwRE9HVW9EVi9XOXV1MVNQdTkz?=
 =?utf-8?B?K0pPTUV2RzJINEs4RlNRTC9pUzhMRWEvTVVnenIvdU02QjNUQ3ZXWW16cSsx?=
 =?utf-8?B?U1QyQVVvd1JzdGFIaHYvOGNUeExWL2RRY1ZHTlFJNVhsc3UwSmhkRGlrSHN3?=
 =?utf-8?B?TUdxS2ZRRjQvdUx2bVRHRFM1MjRDU1AvR1VzYm9IRUI2Qjh4VWx3Q1R0WXlB?=
 =?utf-8?B?dGdoNWtxR0FDVTU1UkJaUUVpSy9WdnVCZnBaYjB3Yk9CMkJmYUtDNTdPV3Vw?=
 =?utf-8?B?OXIvMlFBWE9IQlExZXZrSlYvK3BIRG1tSHFSajU4L0VGNFJRdS9nTzNkU1Nr?=
 =?utf-8?B?bWlROUVpWEtrQitWSTlRQlkrdld4NU5WV2pvWGNqWWtnNVU4RzF5V1NIRnYw?=
 =?utf-8?B?cVJUUDc0RXhFRHE2MEF3NENnNHM2UUZsRUZib1dvdW43Z21WR0V1dktrSisz?=
 =?utf-8?B?a0w4dENuL1ZhR1NuaDdoSk0wNGpTSDVweHhSbXRwUE9vOHRhTUFBSmt1RDJS?=
 =?utf-8?B?K2JydG1pZk13WmdHUmFGSmQwSXdEaENTT1dzNmt2RmN3Y0lPd0JMMVJ5ZVNL?=
 =?utf-8?B?M1owcDdUWXMxbHV1L2twN1JEWGZIaUF4bW1UcDFPTTh1Vlh6a2dUbnpMU20z?=
 =?utf-8?B?bXA0VEowOTVBdWJaaWNSb3ZLMmpzYUZzSlNhb3JoNVdXUE1jZTdXRkVQaGlD?=
 =?utf-8?B?ajBKZ3E0M0NMdFV1Q3RzcW4vTlFWQU5XSUlja25YczVZd1hUTVVIa0I4Wkp1?=
 =?utf-8?B?N3NYT2Fab3owelZFRnB2TUNjL0l3U1M4dC9GQ2NjT3JYVkZiaFNadlEzQWtl?=
 =?utf-8?B?VVlvY0dpTHRBLzZyMzRXYVZPUkRmeW9TM2RRZU5VR3JsekQzRVo0L3JtSldB?=
 =?utf-8?B?dFpIU09GeGcvaFFaOEZYN2ZGYTJyUDlxQzFIVlhFVzZIZmkxeE91K3FydlpG?=
 =?utf-8?B?azluZkhsc2Q1bmJOUFdkRm9IMkJHNS9zVzgzQ09qMnRGVTRjSlAvTE14MkQ1?=
 =?utf-8?B?ejlpTGF6RW95RlNuOHFsSW80a09mTGM3UWZrUE52T2tER2h4VUI0dnFNL3VD?=
 =?utf-8?Q?XLT0I1TOm1G49mEdBP9KnEQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b046a21f-5ae3-4cfa-5277-08dabdcd8268
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 18:59:18.2197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NtJifWjD/r22LFYsJckpcgqJV7WWU9ReRzE9p2Fo4gFuT/W+LwnSMKzXwn94XTu4BVLM+G1SCewMteM87HrABn2azzTV3fpItvgJm+fVec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6869
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 31, 2022 at 03:00:07PM -0700, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>Some of the GuC state dump messages were adding extra line feeds. When
>printing via a DRM printer to dmesg, for example, that messes up the
>log formatting as it loses any prefixing from the printer. Given that
>the extra line feeds are just in the middle of random bits of GuC
>state, there isn't any real need for them. So just remove them
>completely.
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

lgtm,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/i915/gt/uc/intel_guc.c            | 4 ++--
> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 8 ++++----
> 2 files changed, 6 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>index 27b09ba1d295f..1bcd61bb50f89 100644
>--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>@@ -871,14 +871,14 @@ void intel_guc_load_status(struct intel_guc *guc, struct drm_printer *p)
> 		u32 status = intel_uncore_read(uncore, GUC_STATUS);
> 		u32 i;
>
>-		drm_printf(p, "\nGuC status 0x%08x:\n", status);
>+		drm_printf(p, "GuC status 0x%08x:\n", status);
> 		drm_printf(p, "\tBootrom status = 0x%x\n",
> 			   (status & GS_BOOTROM_MASK) >> GS_BOOTROM_SHIFT);
> 		drm_printf(p, "\tuKernel status = 0x%x\n",
> 			   (status & GS_UKERNEL_MASK) >> GS_UKERNEL_SHIFT);
> 		drm_printf(p, "\tMIA Core status = 0x%x\n",
> 			   (status & GS_MIA_MASK) >> GS_MIA_SHIFT);
>-		drm_puts(p, "\nScratch registers:\n");
>+		drm_puts(p, "Scratch registers:\n");
> 		for (i = 0; i < 16; i++) {
> 			drm_printf(p, "\t%2d: \t0x%x\n",
> 				   i, intel_uncore_read(uncore, SOFT_SCRATCH(i)));
>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>index 4ccb29f9ac55c..4dbdac8002e32 100644
>--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>@@ -4901,7 +4901,7 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
>
> 	drm_printf(p, "GuC Number Outstanding Submission G2H: %u\n",
> 		   atomic_read(&guc->outstanding_submission_g2h));
>-	drm_printf(p, "GuC tasklet count: %u\n\n",
>+	drm_printf(p, "GuC tasklet count: %u\n",
> 		   atomic_read(&sched_engine->tasklet.count));
>
> 	spin_lock_irqsave(&sched_engine->lock, flags);
>@@ -4949,7 +4949,7 @@ static inline void guc_log_context(struct drm_printer *p,
> 		   atomic_read(&ce->pin_count));
> 	drm_printf(p, "\t\tGuC ID Ref Count: %u\n",
> 		   atomic_read(&ce->guc_id.ref));
>-	drm_printf(p, "\t\tSchedule State: 0x%x\n\n",
>+	drm_printf(p, "\t\tSchedule State: 0x%x\n",
> 		   ce->guc_state.sched_state);
> }
>
>@@ -4978,7 +4978,7 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
> 					   READ_ONCE(*ce->parallel.guc.wq_head));
> 				drm_printf(p, "\t\tWQI Tail: %u\n",
> 					   READ_ONCE(*ce->parallel.guc.wq_tail));
>-				drm_printf(p, "\t\tWQI Status: %u\n\n",
>+				drm_printf(p, "\t\tWQI Status: %u\n",
> 					   READ_ONCE(*ce->parallel.guc.wq_status));
> 			}
>
>@@ -4986,7 +4986,7 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
> 			    emit_bb_start_parent_no_preempt_mid_batch) {
> 				u8 i;
>
>-				drm_printf(p, "\t\tChildren Go: %u\n\n",
>+				drm_printf(p, "\t\tChildren Go: %u\n",
> 					   get_children_go_value(ce));
> 				for (i = 0; i < ce->parallel.number_children; ++i)
> 					drm_printf(p, "\t\tChildren Join: %u\n",
>-- 
>2.37.3
>
