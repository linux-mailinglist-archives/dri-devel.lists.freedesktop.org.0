Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B44F265F5BE
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 22:28:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D5210E089;
	Thu,  5 Jan 2023 21:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB0510E089;
 Thu,  5 Jan 2023 21:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672954092; x=1704490092;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fZ99bQaTVhNvQqK5gqxNGZc/wrWJ1BHfid4gQvmpUyc=;
 b=kn61Lb3OG2LzYa0OoMFqrB0dIqJxtMt8Z8pogZDypdCfdNrQM1O+TxqF
 zEPKptRB0iOaYfeKXdZIEl0KtIYmQVrUOQTB/6EnxVL1hXxC89mGvu9t1
 hhffSbG27dLczd0alW7vF5dS7FcArT8xwHtQMSo4PSN5A7OGa+3ez1eUh
 QGc2R5E0JB5ep6Bh/zb5WzjDov5LbsrOLBBbroeFKVacstVsksHFkcbmy
 q1Ek24vOOH1iEUenMR83v7lRYpzZgzDU8c7gB29QWWGfqibTUtNOOmbQR
 7pj/WzCu3XDLCGuphXQ6i/6+YpmQbjCUH6mU2l5CQFCdCqJC5pFsytAd7 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="320035182"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; d="scan'208";a="320035182"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2023 13:28:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="657673808"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; d="scan'208";a="657673808"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 05 Jan 2023 13:28:11 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 5 Jan 2023 13:28:11 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 5 Jan 2023 13:28:10 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 5 Jan 2023 13:28:10 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 5 Jan 2023 13:28:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YtAAdfKU1OCrDRuXOLixO+6/gM7K0ELdwCXbq1Jfrvdzksjebe5PZnTa1XF95gOYl+FgJ4LjwCltVjS6TIZ7h54ysYiWvWsLL3zG+ebA1VgXR/HQEbfPwX4brGXSTPftzIDFMl04RiaKj64Lx1Ix6CFR1KACEagoMF+QrXpuQ1kvQx0HECiWxes5mQLYQnYTsqSr/o0KnNRg9pzzsGl8fSj8+7hfsykqytCDknQkdjKYD8yYx8kKvTyeQxCOOtIj1nv3g+JrP2SxkqDdnOGbVyw6s2nSRrZx6Or3+JuiCsjXJtDbPsnUP+I4ZjaJzTl8nkb5cXWC80jJG+NryfjuYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bozKD4trnQ7m4y6zeTpYkKBEtH7c8B1/rCxjkxkUeg=;
 b=UJFEz4n8wSpXe4kO8cDloVAfb+Vy4q5YQ6xFGP3yHhbmHgcw1US7LaVu3ZGrdpRsmtnGOjeSD+kzVbR3TvtLBAH8wXSiu5aTO5byc9YzASA2FpvfWSOj4u8BxZV5UphWnVCBJUX5aox9SGKT+2Rb6RS3KbGNDLDR/b435X5aYrhgPCNKXlWsGOjryh2Um6Hz5aThYLyyeXMuN+5ImJY72e/OMHDQofQj/2wbaL4O+fZi4erhgenw1+YGXT1uRENrfOJE/2gl7fZWtnqyLqvfNiddROsKBGS1ve8uB+ZMmAXP3T6du9I0IrniEsYtdg8UuBKC3GCk3JqVrObPONpUlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6554.namprd11.prod.outlook.com (2603:10b6:510:1a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 21:28:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc%5]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 21:28:08 +0000
Date: Thu, 5 Jan 2023 21:27:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 00/20] Initial Xe driver submission
Message-ID: <Y7dA3cfSfKDuGkXZ@DUT025-TGLU.fm.intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
 <cd0e2491-92d4-58df-628b-985768472157@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cd0e2491-92d4-58df-628b-985768472157@linux.intel.com>
X-ClientProxiedBy: BY5PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6554:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aed6e2f-9c2c-497b-012d-08daef63bd49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4xQgT1VrSBX2be9kozMxEA+29SuBfmzr6q/8QgX/pcuP/hw+lXtYEKhBMUMqGd+Os+068zqO0AQjFR++/I/YK8ugr9MyibBVmOfXAHPiplAGW1CRuzozoyQopCLQBIWoB6QajQVrHlYDQKHs6k235gMwy0o/yiUjCKch+OiqHHyOMwX3YgCrYoF8Aym2XisyqAI13hat66Na/DYN+ndhHl+5s9Qadn/RBZ7uT2k+ylbncAzfmLlRhKPcWFjgtpki5VWDL67AczFkNdasRTSqk/qv/BQlfv6fULbBxvjA1EBwxhWxA3j3kg+L4AgSLWvPH2nD0Xo9xTNaJEHLICqQFPUULRZ4jOP5Hhi9GBqO4izXlzPgKDF6NasLYHHQDTggga5URUu9J/E6fLUWYbM+DplnCqIfjzsxuM//3W+f0S83/kh3qaa5nue1AnW9futXvMFMxOJm8J2whr4xHP94u2+OtUGHoseCay2VGujPloKOiGJ6tTh13mv7ZIWJ4gKoIYBmNjkTnUBfN9laasckZ06shE1f7tJuzZKBjOYNiXgya9gbWRxi5+EoxbIl1VtDhIWxembucN71UZI3IvtqPcr6UwKksy7sjjScwwSNSZjefhKXb0vfnETPAcSG8V0q9QrO18PzQuDPl1Oenoinmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199015)(5660300002)(2906002)(41300700001)(44832011)(8936002)(6666004)(8676002)(4326008)(66476007)(66556008)(66946007)(316002)(6916009)(478600001)(6486002)(26005)(6512007)(83380400001)(186003)(82960400001)(38100700002)(53546011)(6506007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kmhLnz0jHjLHI0jJUYwa6Mp4gh0SkJAUlKlCnfb12cS5MbTU2AzyUefjaGp3?=
 =?us-ascii?Q?8U4JpdC/YmS8cWId099N7Z2UmmEHu+5e7pyXrQMhSogj7q1KmXIGF5objejD?=
 =?us-ascii?Q?V8KKk+k6NrZSDiX8vcoHoSQ/SVX7SoxJflD9+lTX2KP1ApCMNZ+nHpf1oW2e?=
 =?us-ascii?Q?u6GgZn9xAlmf/L5zB+e7lVyFAQf2xmdlLfuI5f8lra3g4OQpNgOmRGNd4Cs+?=
 =?us-ascii?Q?3pvnpEBsv4SILQtl1OwFSz7NWiHDsJm9b+3oXcrbBY8B78CJdWYOBxgU5JEz?=
 =?us-ascii?Q?KSD9/8bp4e2+KIcqBEOKCl2NDkX7yctiTVmw8lI+k6l3w0k8LXbG9DYq72OC?=
 =?us-ascii?Q?/S7plIFDkVzI71L2C7USki7/57ToOwtwB1NIBxFLsJxxrUzx6iQcHl1QEMXF?=
 =?us-ascii?Q?edpQdd41xURY887FNLASU8hGz+YcWFDThMTVVKVbw1hoZBv/Vr/JOWToLEXb?=
 =?us-ascii?Q?A4UonXqhtdZ4AEU/Q2QJzO5rYnfDaTe6rSC/jPdQZfw3PDRpXPq0rQLk23IS?=
 =?us-ascii?Q?PEV/K1+66g59UtwQEC5nOaEElJCPIidwNHwgUR3dfsTUmOBEQ68z9OPEKMU1?=
 =?us-ascii?Q?wfLfurRA5vIFyv4aO5GRv0iFw6rswxqMcQf7c1JNfT6PYTR9oBgFtawflp0G?=
 =?us-ascii?Q?T2Dq9DAU47E/upcR43g9+onrZTlNryuBdK9+uGCom3VCHy6Sg+sZjWamnB9w?=
 =?us-ascii?Q?EyaSPN4cSS7gvh5wWvBdEJF/Zp0+YyPrjLz852Ifa0hFuXCaoNls1rnR79L1?=
 =?us-ascii?Q?F22fnBvL00PFXeKwkBHq2/EKKErEU3qEkfDdYGw/QbUCulMzzoLOk0M8fYqo?=
 =?us-ascii?Q?LgS4U046SUha3botBzX/FojQ8FIGhA3zDv8L4FdQqfy8T3L5FGFu8cv/Lgr7?=
 =?us-ascii?Q?TbNzX63SQyQDgfjaZw2u27l2ZfrxWGwax1cH+RpgUdpcVG9sUAm1ctp9Md2T?=
 =?us-ascii?Q?K6NLaj+IXmzvbC6xD3B8dg1GQdcFhOSaNPC9bqFXPXU3IeGoCOjJWRTcObP4?=
 =?us-ascii?Q?BuNuIuYAa0AAY8yT/ZRoCLRMILjua4o+nrAlAFl657d0yrFY6OAjD618zt4K?=
 =?us-ascii?Q?qV6mZtZRhTXx5EmwAMSYtzK6NDyGny/N9dOoF5t/1BM3CVcfTPfXqFe09npl?=
 =?us-ascii?Q?MudGM+PHCi/9gUgQ+tluSiabqWMmJVw0e0PeKrIJLvvc9GldNH6c0e2n14Y2?=
 =?us-ascii?Q?KjiDYKqLMwPwqE53nm0Wu/7XdFlyu7JMMJKPQCpI3DJQ+7y6WdwhNlzJM+S7?=
 =?us-ascii?Q?63wrI1LmkF63goxZXpI7crNZrgI5xkKCPy+dltMKRQCFWHj/J6xj3ARik8GU?=
 =?us-ascii?Q?avAOfvk9+9QDLTClhx+MtuU4quhi7MyhuQHcEr7IH83r65CB9xKJh4BPoZzq?=
 =?us-ascii?Q?jvCxZ9dm3bcw1cI2eJsTp85nWnWz4qFVgpBYQSd1imK7BImmddJIac2G8Kk0?=
 =?us-ascii?Q?Fl6EpuupCd50/V24AoM1FB0YetfeP92Cpz9y7rBSAN14i4sdF7v5FoPuwG5h?=
 =?us-ascii?Q?Jb0UtEZCZVapsCBA2DYj86Mu02fMq4ZWsLJzyPmeu6tNLDFD1mrm5Tlk+1Z+?=
 =?us-ascii?Q?z+8ztu9Rxyhc/Xho3PHg7S+L4qfLA9cT771xyf7gONWDNOr64Rhs9ct5r53n?=
 =?us-ascii?Q?Gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aed6e2f-9c2c-497b-012d-08daef63bd49
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 21:28:08.3762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HhoW4LDXTY69X/VS8uVikk9UVctNNMoGilbKgdUxrxFmbO8ImEHCay/S3tdSUgNBDzfmT5kC+nc+kuNYyPvj6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6554
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

On Tue, Jan 03, 2023 at 12:21:08PM +0000, Tvrtko Ursulin wrote:
> 
> On 22/12/2022 22:21, Matthew Brost wrote:
> > Hello,
> > 
> > This is a submission for Xe, a new driver for Intel GPUs that supports both
> > integrated and discrete platforms starting with Tiger Lake (first platform with
> > Intel Xe Architecture). The intention of this new driver is to have a fresh base
> > to work from that is unencumbered by older platforms, whilst also taking the
> > opportunity to rearchitect our driver to increase sharing across the drm
> > subsystem, both leveraging and allowing us to contribute more towards other
> > shared components like TTM and drm/scheduler. The memory model is based on VM
> > bind which is similar to the i915 implementation. Likewise the execbuf
> > implementation for Xe is very similar to execbuf3 in the i915 [1].
> > 
> > The code is at a stage where it is already functional and has experimental
> > support for multiple platforms starting from Tiger Lake, with initial support
> > implemented in Mesa (for Iris and Anv, our OpenGL and Vulkan drivers), as well
> > as in NEO (for OpenCL and Level0). A Mesa MR has been posted [2] and NEO
> > implementation will be released publicly early next year. We also have a suite
> > of IGTs for XE that will appear on the IGT list shortly.
> > 
> > It has been built with the assumption of supporting multiple architectures from
> > the get-go, right now with tests running both on X86 and ARM hosts. And we
> > intend to continue working on it and improving on it as part of the kernel
> > community upstream.
> > 
> > The new Xe driver leverages a lot from i915 and work on i915 continues as we
> > ready Xe for production throughout 2023.
> > 
> > As for display, the intent is to share the display code with the i915 driver so
> > that there is maximum reuse there. Currently this is being done by compiling the
> > display code twice, but alternatives to that are under consideration and we want
> > to have more discussion on what the best final solution will look like over the
> > next few months. Right now, work is ongoing in refactoring the display codebase
> > to remove as much as possible any unnecessary dependencies on i915 specific data
> > structures there..
> > 
> > We currently have 2 submission backends, execlists and GuC. The execlist is
> > meant mostly for testing and is not fully functional while GuC backend is fully
> > functional. As with the i915 and GuC submission, in Xe the GuC firmware is
> > required and should be placed in /lib/firmware/xe.
> 
> What is the plan going forward for the execlists backend? I think it would
> be preferable to not upstream something semi-functional and so to carry
> technical debt in the brand new code base, from the very start. If it is for
> Tigerlake, which is the starting platform for Xe, could it be made GuC only
> Tigerlake for instance?
> 

A little background here. In the original PoC written by Jason and Dave,
the execlist backend was the only one present and it was in semi-working
state. As soon as myself and a few others started working on Xe we went
full in a on the GuC backend. We left the execlist backend basically in
the state it was in. We left it in place for 2 reasons.

1. Having 2 backends from the start ensured we layered our code
correctly. The layer was a complete disaster in the i915 so we really
wanted to avoid that.
2. The thought was it might be needed for early product bring up one
day.

As I think about this a bit more, we likely just delete execlist backend
before merging this upstream and perhaps just carry 1 large patch
internally with this implementation that we can use as needed. Final
decession TDB though.

Matt

> Regards,
> 
> Tvrtko
