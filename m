Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E964A704D5
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 16:20:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D4110E034;
	Tue, 25 Mar 2025 15:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JAmAgElq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A1B10E034;
 Tue, 25 Mar 2025 15:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742916005; x=1774452005;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FpuhXkP/q9/IivHG1fVrtkwyysiamz4iQ4yWYsspANY=;
 b=JAmAgElqdm4bSSih5SimBbQXmFjOohVJEC7fYPt+M2x0zyK8h/UwWKP6
 /Is/ojSSHXOqEt3uhw+NGtiyAs5Fdo9Pjy3OL/mDIDkDsRVrcAdfkJ1I3
 zgRYhpV7UBuhOzTsHNYctEsO7QZJwoWcNmECYjtxKZu2WGUbDNuLHkZ4F
 8m4hEiV8aHJGXGnlO8ce09FU9iwkxwXW/qZHcDXh3vYYD46FuEf8NkGzJ
 9VtiaI9CLuWLhDuBSZZ92xUKBb+k39yb3EAl+xq4HkfGurZceZlRKToaM
 Llb3tpNYBQu1mJ9Wo/k2zfqGeuXhekzHpwVfzRVgFdLAUg68GzE8uzlBb A==;
X-CSE-ConnectionGUID: yInJst0lRnCj06Js/iGS1w==
X-CSE-MsgGUID: ffJNxzmxToGIZxquphiYig==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="31772363"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="31772363"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 08:20:01 -0700
X-CSE-ConnectionGUID: MhUgZdBQS92W11OkliA/dw==
X-CSE-MsgGUID: Bk8v7cyiTE+chjEwuWImtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="129591462"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 08:20:00 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 25 Mar 2025 08:20:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Mar 2025 08:20:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 08:19:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVqOPgxuQIo8N7CqQQmy3fGmT3dVZ+succE4Bp6LoyvveUhaPm37DoY//T6kH0FJSmnh/bjEJKtDWDkJkJYW8jiyj3E+V7eCEN0hm7W9P2CfNDeDZRA7QCtkim2qVulwICSzMwGnZHktRfo/3Hcaa62EtQnAo75wj76j0J7iyE5B+uhpAIZCQnrBAfQ/xCV6WLqdxV5AsvMVOqFdRSazj4a8nUSXmjz4eUWHE1iVDliZxAWW9OOQmcGwY2VLL13jqq9rLpOBw9KFn1F9s/6jXz6ebo6jeLaBI5CENxw/3AopuMOjDoH75aLMi0x8V03Ji683eHQ+/SUhXB4pXZbSuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QmUQ+uapAMq7imD7UVzpFdrJclAZkkGBxdceVXXK+YM=;
 b=kBBEmcnoSiYedpnd2+o+BZvF5W/XqEb+qgaHZEtCeC8t+DyCHlNT+Q8fLihcqOGRzi7WXsY0OP5JccRyeM79vNtClqsxf5SHmmcNc3f9chG7/LoQH9gie2CNbxX8MS6qslkNHkVIiV/MoWeWQzHT4MLlZ5TTpdVQrWb2YaBHaJyyXBOpvsGi7Zbkk/h+UDEU66uSAAHiXBqmkggl1FJZGUVLS+UmBGNvjGDScYApkXglxI2RmMlk75ZjAKgCkJUVOm0aoBm30p2+Z3t1I+Lm/DrdYKMZgUtDDqEiaB0jlD7JJ7gcbY3qm2bpUeHhT4IcJ81mb0SD3PBXYPxFY3AduQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8413.namprd11.prod.outlook.com (2603:10b6:610:170::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Tue, 25 Mar
 2025 15:19:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 15:19:57 +0000
Date: Tue, 25 Mar 2025 10:19:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: Chris Wilson <chris.p.wilson@linux.intel.com>, dri-devel
 <dri-devel@lists.freedesktop.org>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, Arshad Mehmood <arshad.mehmood@intel.com>
Subject: Re: [PATCH] drm/i915/gt: Avoid duplicating CCS mode workaround
Message-ID: <67d46monf24hohzznjfzlbuwslcd2b6b3kce6gn55co5izpave@q3ae33cawecp>
References: <20250325120137.1302748-1-andi.shyti@linux.intel.com>
 <174290746252.1245393.5239853097693701739@DEV-409>
 <Z-K9EKc3v3rYdZhK@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Z-K9EKc3v3rYdZhK@ashyti-mobl2.lan>
X-ClientProxiedBy: MW4PR02CA0012.namprd02.prod.outlook.com
 (2603:10b6:303:16d::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: d600eb62-0ef5-4a4c-97d8-08dd6bb080a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XPVigXN7Ed1sFLvYKAOJID9j7k4QYI1wY2omwi8g89ESNSgFBmVfJQFSGD0K?=
 =?us-ascii?Q?4hDXc1JFPngmnTHWZRaG1m8h0AWwPyO0M2RKFar/0L1+EEHGho77T4f8cNZP?=
 =?us-ascii?Q?p6cL50axcDzhlHjRDnBj6NgCKByExOkpq8ivdKryEa0lWG+HyccPJFG2DJkG?=
 =?us-ascii?Q?tENmAkqRnNLp+NmSU0ftGwF6g9FIqWHx0MrXAa3biDfy/EUgWnsgDPpHBv1N?=
 =?us-ascii?Q?9ZQgzLapKrcrPHDgtOyxVQ/UNp2vpgXgCJpy0dyNDrfpD4eOgyPZJmpoKW0U?=
 =?us-ascii?Q?7KQzkHUzeaa0q19d+GDdiPFdd5yrvGhHZPF+PSaERRLo5OtHp6MRFxifVx+Z?=
 =?us-ascii?Q?h8UcOOgJm03j9S+GBjbLSo0qyBcMP/aybkG+KBcOvwbDV6vdZ3DyJZyoSZF+?=
 =?us-ascii?Q?7QqdpavOuw2UzPFIxeR02jqOZZTVOcAsPPSTA5JFuW008+bJpiddaH6YjGWv?=
 =?us-ascii?Q?l8VHzr3ic+XlxU+t0WVs21R5kHmMeZsm01u+QOgUZUOhs/P//sOgXRXYcfum?=
 =?us-ascii?Q?tPwXaoy3iBKwJ0ymGTYQI1uWRZnvy8DOcvNQ9JRMzk1QAJPYx5c8OsLNLhEg?=
 =?us-ascii?Q?U1suXWtaT7Z3aN4B3TPCe8i5XqDTclRrOAuDTUEId975khgpYBuSNRVj0mx4?=
 =?us-ascii?Q?1qvNPBSPmyYueCyA17MH5Seik/HTvIU44po4zV4Bg8gT5suqZuLPKMWdOOpy?=
 =?us-ascii?Q?4pEpe4SSB+nc/rpKCLVDTUSR0bYjCVniZ16cO6fLaTyMY2Vyey+LidrU94PN?=
 =?us-ascii?Q?/JaOBLitzQCFfSrQMozBjV6qb2TUiyQT11HvdHypEbl5WiU/eBuvViYSRjK5?=
 =?us-ascii?Q?sXIld/XNYuvveuzvvS12YJ0rf3u9vylM+OEAo80KjjZ3afBvWd25UvSSQYI5?=
 =?us-ascii?Q?TcF/B64KVqZVMSVVYPjME4mKvQED+l0nSQ6oBN6mdjPi4FzH+fqyr/wCwINW?=
 =?us-ascii?Q?Vt9aeoEvGKgkWDYZ/PDJrPmy2S0lE3z9PASoqk+4Exk214tu1YQnDFNpSkg2?=
 =?us-ascii?Q?SAjTwIzYytMfXgbSPkPhgKF1yrtcJf4laq86Rkcm4jipVPU7umlEmJKAT3hJ?=
 =?us-ascii?Q?d26jZUz8c2qJFf3dsBy6GTcmjUmVNs4QlM9s5krJqvdzt5oDh3RcfPDp/xPA?=
 =?us-ascii?Q?4fAe3ehsSttqxmy9M4wYCa37x2FAPok50NXTARHBo4wEp4d1Ga1CGretBkOu?=
 =?us-ascii?Q?8sSMDJH9+FIk3lQ4hah6+1kpZrswwNirus9wHAqXbEPBOQAJ/3VdQ5zQ5Q5/?=
 =?us-ascii?Q?SC+qlItQdjN/WANAEg7q7VWyII0O5TzHJfpOnV9S1ms9t70kUe7uS56EGYhp?=
 =?us-ascii?Q?HyE1PHE0ZYBg7pAxcm4XuLSfrfm5Q6u6phxqdxfUqy1PNrs3k2n3V1LLBg61?=
 =?us-ascii?Q?k4DTPyCi93DLCZkasuMi9eHb+Mml?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yZRBREweXAcxRovK02MT8/1DeawgyCZSkS+CQBAFSXb3ic/B46OVsWZ/xxDw?=
 =?us-ascii?Q?MDGq2wLHt8NY7KVpgM5IXSQdKbbbOenpxsHCo7QhOlYlbC0fio1reE2F3Rnw?=
 =?us-ascii?Q?KPwMTQzIztwZCawM1k0Z+zV8A3sKcAZp2M08IFKXkH4ldcG265trj0Kik1D3?=
 =?us-ascii?Q?Lzhkj3MeG9r+YRTaQgo3blEZdM2zkKt54VjIKbqSjmcPJ17zQECQAWtco2RQ?=
 =?us-ascii?Q?ec1RenZ7IEp2/VhSI+ZaooVKdpfOTnTotCTJ7pShHMhAczTlMfM4cUN0Xe3W?=
 =?us-ascii?Q?/gFKUTpdRDtGq8lVzK+53wh6LhBIko0FQBHvD11dsNdjm1dTTyvJltHo/+Pz?=
 =?us-ascii?Q?50AAJBuc1wemHH+XiBEzXVbxHH3gdJC5gZrA0gGBSQCN8EDnupN90UT9oiW+?=
 =?us-ascii?Q?J9Diyzihiy+G6xK7LOjNQrfr4hU7mcws9dPvjGFPGzoETVFBbhAxJlOKB5ya?=
 =?us-ascii?Q?0jjtG0FiBBsBn2RcEVluamWH9WEJQTAmXEDfOaKuiGbAeWFaAJk1/sTHrhAM?=
 =?us-ascii?Q?T4RCep23fnrpg39T8Bqx+jDykbORVCWjlOgvhQknlNxD9os8KnzXvHa1aSE3?=
 =?us-ascii?Q?uzKJndweqAmGTJ5A8Ce05kAp12/uq05+SEQn88RZnEAR96+BGPNAZFgiHwL3?=
 =?us-ascii?Q?+L4u1iYIx8W2RzFsgimkKETZ89EjsANmapgNPi+nCrh3j1sFy7/y5SudaaD0?=
 =?us-ascii?Q?wllqvDVbMjuelvQN/iWHIpgJKVL/JfoVzoj2PO+jURxfvsnuO4y7YkSFUo/l?=
 =?us-ascii?Q?JygFI3H2BOHu6is1EirM9EQ0egbv69m++1tSneJaEzqp09q1jxCiZsNQYrTP?=
 =?us-ascii?Q?w2aYlzTwLqzZ9pB5Vt0y4/Wf2r6jC30b2AY/RIdmuyxQXAaTnpgK6+cKraiF?=
 =?us-ascii?Q?7UBJkSN2KFspBfy+rJTWvYOHEviJeaEcizrRS/biAs8zRCoqMrZsSBbreMXQ?=
 =?us-ascii?Q?BPgArfsZWC1Z/0taKXwMqXR5SQmTmm0TP8WapJk3kK0WAyuYYNbaJhjVndxf?=
 =?us-ascii?Q?d5HlYkGyywX7nNDwJDrOI+WT5KjMDxVUlj2pCI5YTFOCOu/PQai1kN4z4CGx?=
 =?us-ascii?Q?B5izURNQXz/hGnr2XyxNCwJu3zZGaWE/BcJrXz5GEIqJre4CzErXLJD+UOeb?=
 =?us-ascii?Q?36A+fNnbJdpwhgMl1sMo99+7YCWPfWb7LSENbEtU97n1itwZZJzaAXjs/MAn?=
 =?us-ascii?Q?OsBMNOrkjxz0xnV+hbSAAxRniDq+okU403QzpbNLc9mbFDtVBXzVzHrgnSuU?=
 =?us-ascii?Q?sKUhkVXsAyegF9/1MfTnODq1BTip1Ik9TtgAiD+3mIMpyS59F+GnbWkWGcBD?=
 =?us-ascii?Q?wpIgsFKR45DI0cdlMvCTzZt2NypZsBeImkD5FIpjeeWj7JXAVoyE/xljkXkL?=
 =?us-ascii?Q?eCvZcskSHVpoCu1qRO+VnKHfhizr6ikmXymx1qqtO+5udY5Rqvyl5HB0t3n1?=
 =?us-ascii?Q?NGJH2kFVpJCPMuCCA6SqVqZ6LJWUzEY5TTgc4EDhvs7MgkaFG4g9CEEpJQkk?=
 =?us-ascii?Q?BW9n2/uPlO7SXBjivdpuBf7nuksLZeY7fZN+BtNaAN/NfHFFsoEYdZ++QMWd?=
 =?us-ascii?Q?bBHr4vY27d2NsjNoVTqHcmLpI+yef8wnj8hzdy+zuoLk0u7sLHfwBJfkXJfP?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d600eb62-0ef5-4a4c-97d8-08dd6bb080a6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 15:19:57.4830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQu56wQTMH0DOfV/5di61A6WDVuOXNZyKgO5QmE5UXeKurETrrpI3QIp/Ik4NaNub3EZjQt8eUJ1nvIWvcmzExMU44R8yx0VnVjBnzhkXdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8413
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 25, 2025 at 03:26:24PM +0100, Andi Shyti wrote:
>On Tue, Mar 25, 2025 at 01:57:42PM +0100, Chris Wilson wrote:
>> Quoting Andi Shyti (2025-03-25 13:01:37)
>> > When generating workarounds for the CCS engine, specifically for
>> > setting the CCS mode related to compute load balancing, the
>> > function 'ccs_engine_wa_mode()' is called twice: once for the
>> > render engine and once for the compute engine.
>> >
>> > Add a check to ensure the engine class is compute before applying
>> > the workaround to avoid redundant programming.
>> >
>> > Suggested-by: Arshad Mehmood <arshad.mehmood@intel.com>
>> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>> > ---
>> >  drivers/gpu/drm/i915/gt/intel_workarounds.c | 4 +++-
>> >  1 file changed, 3 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> > index 116683ebe074..37251546b755 100644
>> > --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> > +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> > @@ -2897,7 +2897,9 @@ engine_init_workarounds(struct intel_engine_cs *engine, struct i915_wa_list *wal
>> >          */
>> >         if (engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE) {
>> >                 general_render_compute_wa_init(engine, wal);
>> > -               ccs_engine_wa_mode(engine, wal);
>> > +
>> > +               if (engine->class == COMPUTE_CLASS)
>> > +                       ccs_engine_wa_mode(engine, wal);
>>
>> FIRST_RENDER_COMPUTE is meant to only be on the first engine of either
>> rcs or ccs (which share certain register domains), one engine.
>>
>> It looks like that was broken by
>>
>> 	commit 1bfc03b1375244f9029bb448ee8224b3b6dae99f
>> 	Author: Lucas De Marchi <lucas.demarchi@intel.com>

yep, my bad.

>> 	Date:   Tue Mar 19 23:03:03 2024 -0700
>>
>> 	    drm/i915: Remove special handling for !RCS_MASK()
>
>Aha! So the logic here[*] breaks the meaning of
>I915_ENGINE_FIRST_RENDER_COMPUTE, becasue, other than PVC, we
>forgot that we have DG2 that needs the special check that uses
>!RCS_MASK().

no, that would mean a DG2 without render engine.

The previous check to enable I915_ENGINE_FIRST_RENDER_COMPUTE was:

	if ((engine->class == COMPUTE_CLASS && !RCS_MASK(engine->gt) &&
	     __ffs(CCS_MASK(engine->gt)) == engine->instance) ||
	     engine->class == RENDER_CLASS)

i.e. if render is fused off, it enables it in the first compute engine.
Otherwise it enables it in the render.

And assuming we don't have platforms with render fused off (which still
holds true as far as I'm aware), that became:

	if ((engine->class == COMPUTE_CLASS || engine->class == RENDER_CLASS) &&
	    __ffs(CCS_MASK(engine->gt) | RCS_MASK(engine->gt)) == engine->instance)

It was supposed to mean the same thing... but doesn't as engine->instance
starts from 0 for each class.

Just checking for RENDER_CLASS and eventually even removing the
I915_ENGINE_FIRST_RENDER_COMPUTE flag would be better. See
https://lore.kernel.org/all/20240314205746.GG2837363@mdroper-desk1.amr.corp.intel.com/#t

Lucas De Marchi

>
>I need then to restore the original check.
>
>Thanks Chris!
>Andi
>
>[*]
>-       if ((engine->class == COMPUTE_CLASS && !RCS_MASK(engine->gt) &&
>-            __ffs(CCS_MASK(engine->gt)) == engine->instance) ||
>-            engine->class == RENDER_CLASS)
>+       if ((engine->class == COMPUTE_CLASS || engine->class == RENDER_CLASS) &&
>+           __ffs(CCS_MASK(engine->gt) | RCS_MASK(engine->gt)) == engine->instance)
