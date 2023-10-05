Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D1F7B9A2A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 05:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295D110E165;
	Thu,  5 Oct 2023 03:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C3910E165;
 Thu,  5 Oct 2023 03:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696475565; x=1728011565;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NvctrxlA35ZvJ0aMr3MR6tdi2w4fNE7vHlx7q8Se5Nk=;
 b=KiSdPUzj5DG5MhEej1HqZ6R3aay7z+wWg61yBeBAxz9EIWQL3ov0jvDU
 F2UDegX0EiEsqz2YTve8UbwyLdjCPAddMCvj5xSE8J/RAlMbWM259wGLz
 R7HWschYOVOmzHwIuk60lGVhL+Wl0ugOSgNmesxxAljj0lO1yFvEr8UeV
 hOXBcH9SUT9Cg8kbjC6hyE1N8HguHc7ahOsdL16TRoGeXskfezkAOzJZI
 A0UstSTv7qm1fkF4G6kbmFSiOmDCdrsklEu/wNUbbAt2x+jk9tzJU5FRo
 +jRdKTx/1OEs8Kon7JV2rwjqhrqdddgXzHeK/fNvhNYPv83c+0m0zjMcX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="380660757"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="380660757"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 20:12:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="925423033"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="925423033"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 20:12:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 20:12:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 20:12:43 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 20:12:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYQC0HyaimZEHXXs49SQn2ZhlqWQuFj9wZAD5EgI+7wf+yoRN8xp2CyeQWOnRbRzeYO9AAx1ZwSO4T9cFEphadj1Go7mf8gb8alwO2j00a3Vmt74C9wpVs5rZXS7fpyoX/86b/twTUfPuio1jYt4t2scXMf9o0hzXlhtIz3ECiR0QxZ3I1Quu+y7oBr70SJCrb3xpKr/myX83MXiaT7oXlU2lsQCaVjroNq/bSZKY04ciXJVsjjwm7O7DiS3t+nUuS+kUSZTk5qSv/BK7u9Zka9mzVLdXkN/yObY/2SzVPMsQ69CLBw+CsPmLP/5gz0GYGpPwx6y9eQlgi7Uw/xQ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mgZfmP2YljXkCNtHmwzEUq7ZWdirAg37MluwzOr1lo=;
 b=BEFBlmh45CVu7k5vX8KzPdpa4Ec9djDMMTRHdC2vkNX/ml7ZTZrMmSWjt21dr1nOUJ1AM95cR7B8/N12jdg2DH31uCJLq2r9a6SxhCdYZMEsZ/ywHKxj54qE7T+GhhIp5fAdT0Yb6IzvbAB20VySxf9qt9ziAzN+pDWXU11pRk2V8BMnKkWIKb/BEb6RIffFAErYMZWRN4wWOR8rbwx1p+YdpIP7jOJu32M7VdpQ+fvkeyGJm2zhIj92LSomWvpaCkD8NZ3ZYPdaAWsl/UIVyfVPOMEmmasgurFnow1bjtAO4Y8V+zM5TGY4ZR2mfFQ9kKg01NwsNADUFd96ge+htg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8598.namprd11.prod.outlook.com (2603:10b6:510:2fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 5 Oct
 2023 03:12:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 03:12:40 +0000
Date: Thu, 5 Oct 2023 03:11:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v4 07/10] drm/sched: Start submission before TDR in
 drm_sched_start
Message-ID: <ZR4pW6XaNdjkokr7@DUT025-TGLU.fm.intel.com>
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-8-matthew.brost@intel.com>
 <24bc965f-61fb-4b92-9afa-360ca85a53af@amd.com>
 <352c6ddd-86f3-41bd-b0c7-cfe3e0cdc04e@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <352c6ddd-86f3-41bd-b0c7-cfe3e0cdc04e@amd.com>
X-ClientProxiedBy: MW4PR03CA0123.namprd03.prod.outlook.com
 (2603:10b6:303:8c::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8598:EE_
X-MS-Office365-Filtering-Correlation-Id: efbc600f-9942-4c0f-88fc-08dbc550ef1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uVGHCQsipO9BHwJbCgztpOCP3ibjCcb0wA9nIGKBNxzTKjGl/gYOPKARULbBnv+DCIGvGyvl64hroTKDf5FEviDMqZj/bRpdkN3YvYu66ZrG0GEViZswAleAyzMsk0F95slQg2OyrVspEPOa+lxTLKiQM0twoIojMoZdP7LNj/29iRb4tdycCTAh8EHxMpLO8p8mfhiobV6P4a4H0p/ACWGZdJinN2wvHzo9hb2L/V+3lJE45zUXZkVpRbnLui6xlBAXZCKoIwfftZX1nvTQwmcxL/v02KuQJh/dd9jqtM7drZSadeZUiTWskEBi10lan8IBZ7Zib/r+NWt05J1Ui/S/a/4cxKGDG5ua/sXzlLVSUIszAz5q90ANhAFVhVS5JzXEtgI00FKwhUQATysDNtiTJHhVQTp3Mi1RzDPxuim1pUXUkDyRNJqFnKTHIr5gCB/dQpKmIjftTaHZG5KjflKk8o99+6YQQ6ysJh5UwiybaX/HYul8/QBlb2vaB9cNHe6gbXRdgTLL5VNH4btDRL6F6X9nmu/BUOwTuaJG40PCcGsk4tcBzVNFX9+S1mp9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(39860400002)(366004)(136003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(8676002)(6506007)(4326008)(8936002)(53546011)(6486002)(6512007)(38100700002)(82960400001)(41300700001)(26005)(478600001)(66946007)(6916009)(66476007)(66556008)(316002)(6666004)(5660300002)(83380400001)(44832011)(7416002)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?36fgWnzYQJNSt/eW9WDz66F2gR12BBmyVv9AxfaWIsV4vlWKXSmzBxXwxMAZ?=
 =?us-ascii?Q?lbRuA70u7rHSEx8ijlPmXDiUgqjSgmaJsBSsGHa9op1cX9X7TSDCDvxm5uy8?=
 =?us-ascii?Q?foFsYe21KOwKq77mvt1q73wCa26BOGmpkH0ZOQ+mkGbEzHtbyNI88TbxZV3l?=
 =?us-ascii?Q?DJCHEJGtKzDHGc8FmfnE6Vxgplnq0OOA7fSV7m5G8TUfBKhiahjAblVcYmdY?=
 =?us-ascii?Q?o5wCKMQv13CeU0xfRFFb4x12oe12JlBnc/as8NwB1LhlK6QFGR2/EwJ2qkOB?=
 =?us-ascii?Q?PTPtdJ0KCC3a4hikItruuUyUWEEjdstFUIPcF36rf3COwKy2GhEyl969IjVi?=
 =?us-ascii?Q?7U2bYNKW4X792elgMF6FvbSXUj5LPl1dNqAgjRAhyGB7FyFbr0BQgHjb6kxr?=
 =?us-ascii?Q?MJmT9jwPwQoC4c8DVvl1L5Uct3vTARHl9sPRoAyYhCXpAHsrsBDVYInkHtgL?=
 =?us-ascii?Q?n6tlWJCVWMjB+AtKzqBGgrVQPOFdort3mtTPp/f18Rf+rjV80WfQALVPEFQu?=
 =?us-ascii?Q?8jp6grI8OcXgFoo7Mq6RHxHCOLmfeOj8iiN0BTY2+W1vdVS9IWRQCLMOLe9G?=
 =?us-ascii?Q?VVrNJfS6uOLfTXTHVh7Lv5u+totmMIXCUv1w23VdUNv2/JA4AQPbwqtimQVz?=
 =?us-ascii?Q?qlvn+Cr1IyVKfSgn9s5a7hzBSvnnt9y2BHKYzzIDiSWyBIchJQa58SVKRQ5Q?=
 =?us-ascii?Q?5UV6F0/88pmayzDwhBS4r9+aBDNbWbyEl2p0zt/2xTFR4xoVVnuEYtIcyekv?=
 =?us-ascii?Q?2VrcmnLEbR0U+3+srCAbK4+7Xnrr+ELquL7MhhG1JUo9K9L3ChizrYpbJfCI?=
 =?us-ascii?Q?1OCaCyvgMj9pw2hr+lkjYnYBypFayJ+xtxkKIghq2sIKI7bsAI/t0OeWs8Eu?=
 =?us-ascii?Q?zyGxdB8AeVIQAEBAJxoinCtuuBEx3ysolXWCoDVb9nkL1dLtTHHh13FBP4R9?=
 =?us-ascii?Q?FFyOc1fQTrto/ECHIGc4EZTDbZw0ApnJvmLVNjyP239Qs4Pho5rvRQZagfYb?=
 =?us-ascii?Q?ttFwAkON7v4JAxsb/SBrAEOVz7zgh3O5AgGhppFUq2AW46bTGIsFFkcXrXjs?=
 =?us-ascii?Q?4B23iqRaWpge6bFJfJGskttxWympljy5ifyFBaxLtjTvPfm6wYWPdgn+mSZg?=
 =?us-ascii?Q?aPj89G4ORASL2C4aLxMZDs+wwGGZz/0yHEGIctPKmNueY/A14ueBrm+EjNEO?=
 =?us-ascii?Q?isZ4G7PwRtWDcwp7rN+pw1sJ66iJwG8bCTxxw5N0dTb5VJEtN2EiQPYboAxS?=
 =?us-ascii?Q?o9kXZWtjeTyW/3lLHHGeq+Zzphbrv8A7pDlkuT7z52RSgKZWZEyWU1FkGaDN?=
 =?us-ascii?Q?BN9BrUvGRzlhthfLKySIPVvGBglznrOB2Qt7VvwcMIL0EslotqYf1iMAKhKG?=
 =?us-ascii?Q?6StYoRNK+2fyEI/QUlycKbjdvOLlM1M8ZOtiRFkZwfyVqAB2tVzU7TMjyfTU?=
 =?us-ascii?Q?j7d6mtiE1C6zoMFwfZFKKoJWYOvluD9elc1qmrBhK/c+5NDsBtUJl90a9GvI?=
 =?us-ascii?Q?jaQM3NcwKpq71MwelM1o+CbyQSxfp0AFwnJ6zl8Vv5yADvq6C6JbGno1l5g1?=
 =?us-ascii?Q?5AWfnCigLfvbN0hOlb9gu8cj/9wnlKVCC12drBx7gCZaOVrUMrZC/Hau5Jjd?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efbc600f-9942-4c0f-88fc-08dbc550ef1e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 03:12:40.6109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eltAGFoghtGxpPlNYZUsbWQRYeYslSYfc6azop5k0V7elM2B8mXgCL6X87bX/dPhg7hePHd+JoLQTk7XRX3kJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8598
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 lina@asahilina.net, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Sep 30, 2023 at 03:48:07PM -0400, Luben Tuikov wrote:
> On 2023-09-29 17:53, Luben Tuikov wrote:
> > Hi,
> > 
> > On 2023-09-19 01:01, Matthew Brost wrote:
> >> If the TDR is set to a very small value it can fire before the
> >> submission is started in the function drm_sched_start. The submission is
> >> expected to running when the TDR fires, fix this ordering so this
> >> expectation is always met.
> >>
> >> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >> ---
> >>  drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> >> index 09ef07b9e9d5..a5cc9b6c2faa 100644
> >> --- a/drivers/gpu/drm/scheduler/sched_main.c
> >> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> >> @@ -684,10 +684,10 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
> >>  			drm_sched_job_done(s_job, -ECANCELED);
> >>  	}
> >>  
> >> +	drm_sched_submit_start(sched);
> >> +
> >>  	if (full_recovery)
> >>  		drm_sched_start_timeout_unlocked(sched);
> >> -
> >> -	drm_sched_submit_start(sched);
> >>  }
> >>  EXPORT_SYMBOL(drm_sched_start);
> > 
> > No.
> > 

I don't think we will ever agree on this but I pulled out this patch and
the next in Xe. It seems to work without these changes, I believe
understand why and think it should actually work without this change. If
for some reason it didn't work, I know how I can work around this in the
Xe submission backend.

With this, I will drop these in the next rev.

But more on why I disagree below...

> > A timeout timer should be started before we submit anything down to the hardware.
> > See Message-ID: <ed3aca10-8a9f-4698-92f4-21558fa6cfe3@amd.com>,
> > and Message-ID: <8e5eab14-9e55-42c9-b6ea-02fcc591266d@amd.com>.
> > 
> > You shouldn't start TDR at an arbitrarily late time after job
> > submission to the hardware. To close this, the timer is started
> > before jobs are submitted to the hardware.
> > 
> > One possibility is to increase the timeout timer value.

No matter what the timeout value is there will always be a race of TDR
firing before run_job() is called.

> 
> If we went with this general change as we see here and in the subsequent patch--starting
> the TDR _after_ submitting jobs for execution to the hardware--this is what generally happens,
> 1. submit one or many jobs for execution;
> 2. one or many jobs may execute, complete, hang, etc.;
> 3. at some arbitrary time in the future, start TDR.
> Which means that the timeout doesn't necessarily track the time allotted for a job to finish
> executing in the hardware. It ends up larger than intended.

Yes, conversely it can be smaller the way it is coded now. Kinda just a
matter of opinion on which one to prefer.

Matt

> -- 
> Regards,
> Luben
> 
