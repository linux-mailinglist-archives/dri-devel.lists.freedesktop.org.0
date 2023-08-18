Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D09DE780434
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 05:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC34610E427;
	Fri, 18 Aug 2023 03:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7C710E427;
 Fri, 18 Aug 2023 03:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692328194; x=1723864194;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VCnwzy/UdLCXjN0gAcWU2sPnqwdSESVYbAaz1y7HJ3Q=;
 b=jqS6c8vgEOWLc8iv+GQQp/xGjMNakdPV8JN38irCy8tsntic/ysMDdye
 z5x+QeA3JnoC6sOzR3tPiW/ndywIsFq2kPB7+qk9IHCc+iPgBJcJuwMut
 lmiTGQh/BYFW3k3RN7CpnWnYK5qrGhlI5m3adzkOYbdEd6b0t8ymEk0t3
 DGERk33TIGf01F4jOIzwRLwJhRqvFvGJqOyx2OPw8zKifO1OsV+FBOnjC
 oLkXJp2rTt6AJI31jy5TpJW3ptd3v3m0R6NeLMZWgVaybg7WUvET1srmk
 dCiNJQ9sAotUEGdUU8PasLi/gDqV7/AELwOyPsf04aM6QyAEHWqkXxNB6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="376754943"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="376754943"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 20:09:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="734920122"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="734920122"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 17 Aug 2023 20:09:53 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 20:09:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 20:09:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 20:09:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EfQWW9qtyXh8ubccTZ7qf4cgH9KWKnY9tzsfm265FwTWmXBgfD0wSTOqmMt+TUiZ9hvJ4iTRwZHHeN3eUaGxBaTGBDcrDUO1tS/Ae73K3z+HE7M85p7wqjbfBRkQdAVnuBdEx3Pg1nP/LI4b8spoWKnx1zbzY5ZkPOuG4u2qSFnN44LtgEpEzmpAsdwYST/gCfjVKNCIKkplK/G4qXQ8mrBTTyg5x5G2lxnJLtA09KQHrj3XEdkx2f1Rsn0WPp5jrFDbDuwrraOpNuDd55Ha4w3cMukOSzaZOoELT2mmGvvbDwMTVROFAE1U5+8YuJ67+AdRkBtRnhVTxuZUgddb0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDMv9LW6asxjmvUjM+ifGMuWEbKwyZkwhqkD0LZ6cFw=;
 b=NvVZPjvTt5qIs6xpCYQbH90II/qZTuxr+Z9ltxhFmpoTkDWxGXKlxpvvn9jS90hxa2vbybeaIzrLD/cJl5AgnifUxN8Q2FWdzVKb9Ew2tM5eX0qb0SeHJF4MoLiAtEV0VMHUG5+PH372bJYDNYe462gek4fVIIxo6OxMgVxTT6PPxQZGNfBBjys2bLEKS86PanHI09H2Zw77K6jNHDcQ9m7YybH9HL3v5EYHS42uwVO4pSHr72hgWcX9aWBZpFDoD0mDxpjSVwz+0Xla+9ABUGqIOtmd2XRJcgql5+K7JDckEUggBLI12VRKZS7TA9rCYKMgehoxM/8yB4bDBRbwPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6062.namprd11.prod.outlook.com (2603:10b6:8:75::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 03:09:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69%5]) with mapi id 15.20.6678.031; Fri, 18 Aug 2023
 03:09:48 +0000
Date: Fri, 18 Aug 2023 03:08:52 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH v2 1/9] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
Message-ID: <ZN7gxBpnZD8OW9ZW@DUT025-TGLU.fm.intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-2-matthew.brost@intel.com>
 <69b648f8-c6b3-5846-0d03-05a380d010d8@redhat.com>
 <069e6cd0-abd3-fdd9-217d-173e8f8e1d29@amd.com>
 <b9a6493c-243b-1078-afbc-d9270cac904a@redhat.com>
 <982800c1-e7d3-f276-51d0-1a431f92eacb@amd.com>
 <5fdf7d59-3323-24b5-a35a-bd60b06b4ce5@redhat.com>
 <0bf839df-db7f-41fa-8b34-59792d2ba8be@amd.com>
 <e8fa305a-0ac8-ece7-efeb-f9cec2892d44@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8fa305a-0ac8-ece7-efeb-f9cec2892d44@redhat.com>
X-ClientProxiedBy: SJ0PR05CA0082.namprd05.prod.outlook.com
 (2603:10b6:a03:332::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: ff27e8a3-36cb-43dd-ee08-08db9f989503
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HttwPoiHYT5CUmFvB6gY1kL6gCSKx8p6DfqlCQz1TO4Njpirigsz66j/bBOp8ev/EFnvzUUOvuyfO8Gve/XIzq5+3GuX9zsrfPQn590LasUTFvM2OD9zVn/YmtTcc12EkVOlGeGcykmS/QzVFOIx4Fdq1vRbThpITzjnuAvh533QceXitCOoJKyAb2smBiUREMy3b3CIf5hjNl5v66yk7Jw6IQxtUtYHBTRptpkI/CDgdfe7RFmSJqLDX11T1cQxqEZ2hv+RkA6Gu6VARyRNs2wTT/faaqRZ3yXukgJqc2iXz/Lf1HAkjt16gtHqvuLnCNMmst86PMQijpS43yDkD8oRRfRA4xBq88KKH6TOtio5NJvn/sf9NoX8uMg6tQfd6nwR3uCFA7HJAD7ajEYR6SH2AVrkdbZaxzp1pB5d+yBHs1HHrH97z7YBk9eO4YFwlpMEAu6X/dp8EuzdK+eEoX48tNmoSVRjfonljK7gwbS9yEdQ8Vvox/jmzVDT9FWKsj/CLjRcwLKnHf6AxLSePb8tpovA19W++7URDd/Kh7h6teZv/cRxzUaWr4ijXBk9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199024)(1800799009)(186009)(86362001)(82960400001)(38100700002)(5660300002)(44832011)(66556008)(478600001)(6506007)(66946007)(66476007)(53546011)(6666004)(6486002)(316002)(6916009)(26005)(6512007)(4326008)(8676002)(8936002)(41300700001)(66574015)(66899024)(83380400001)(7416002)(30864003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/jBUkqoZt5MR4ty9flwWSt+aXEWKoOotF0f8FUEPpCi0IB8kXQJ/9Yl7cq?=
 =?iso-8859-1?Q?odd+EzH1oVkENg8y7axYtXIQZsTQ14/MtszI3pm0zA4UmZBxA+lgr7acWW?=
 =?iso-8859-1?Q?gXOmr4wwy+11MQcm7iXUIPgEi5mpZICxwtjOV0KLpGGJ+2me5gL8GOWnGA?=
 =?iso-8859-1?Q?n3RW+YCsd7L/ZV+Gl5I5moWd4k32BHvqI6FPiKAVGt5YLpheNWBtMcfBqA?=
 =?iso-8859-1?Q?N6twt9d/1MnS8SP5SJVR4PFz6HTcZVxRdi8pn+BaxcME0AbtEx5ueCH0x6?=
 =?iso-8859-1?Q?VKvyw3XuYeIifmuR6hr/Q/b8P+96i0l5MpLRthHvheJbv1rs6CRTqdmhn/?=
 =?iso-8859-1?Q?fu1pnGqWcXOnvLf2LjH7NRjrdFu6r3XuC/eKoXvB7O0TihqnyLBNRkRFkN?=
 =?iso-8859-1?Q?Kuz8/8RM5L0JSdF3V+h7oOHWg7chjyTFQ4hbwPSD933VlSg4993nKmBbSM?=
 =?iso-8859-1?Q?G4lJiB26nCv8EzKhHim2ndH2ZUChaDFrSy436pouY382xn7kn/8vhHL+tq?=
 =?iso-8859-1?Q?FRs2IsvMvzjkl7aPX+teRVYH4OjpyZlcU70wT1+jtLKPrVCxw8pZcle1nc?=
 =?iso-8859-1?Q?XflQyqexX0wg56uFnyQ26/k2zMkUBHYs0vA2kyKU2TosZBsepT9YDYm9ge?=
 =?iso-8859-1?Q?P001wcWobufzpj8fG0iZ/Ov9y2rVRFWgidH8VB+NWhfRiVdRJuiyDQkFrq?=
 =?iso-8859-1?Q?+F5FuAuzqRc6ANSlUbOj4qV52tiAVg/YJrV+Jx/5hC3dpTPOJEBRcD7hM/?=
 =?iso-8859-1?Q?MuMkl8i6Ee7urLIYmpPHw1FlrIjusQg8G+hl7awa6MgPMRZQfg6v8lEfci?=
 =?iso-8859-1?Q?T2+FWpkXjZ9lIUXH6JxRxYZyUitlF1GFfeK/yhFQJ5b60uHc/KmmcRJ+9W?=
 =?iso-8859-1?Q?z6VRaGCb8zLozQptXgmKacjo3AWkRssgPtMPuRtoN+6z5i+1iJyxXWEbZB?=
 =?iso-8859-1?Q?wymjoOyNbRd3feh2riIhGS2qHF01kXYKU880e4+BApUY6Xk1a/9zUdGXOo?=
 =?iso-8859-1?Q?mDvuBFFqbBrs/OIjish3xBm9jc976p+S1uzqmiDlL4DymkJaAtw+iBOSCJ?=
 =?iso-8859-1?Q?FKdCwcuWYjr8ZI2GZoaqQyMnzuD3BKEZOroNc6IRWlRdiYRLWBZ5csd70X?=
 =?iso-8859-1?Q?VKS8jYm1bMzFuj/WhtY/4INtL7BhUIA3Qw/1FIjL2emsINIeJxfAjJVXbS?=
 =?iso-8859-1?Q?wwbxvEbmv2U3rFkBctNI8JluN59NShLQM40GceYkuVZPSAHoq1UeOUaxf9?=
 =?iso-8859-1?Q?rBysgc+hcq0Gm/4fQ1H75W+L5RGgajKsNISDepkpcyKwlUATsq/MCEEpzX?=
 =?iso-8859-1?Q?NY7pwZ213utgiExlOwJAy6tAM3ki28PSsnjG/lEDy0il/EY5o4pHH6HICM?=
 =?iso-8859-1?Q?YYq7S0O60q17ICjMPkBwZ2BbPI9VLnRjzvQoVD/YoO5eJWihmNNkBdNqf2?=
 =?iso-8859-1?Q?hDNk6N0BF76fhUPWpwxiBmsbj7DysQzfhlBMLKT5qy9+6EYvVCjMXufqmh?=
 =?iso-8859-1?Q?A3LD93hqT8fhiPV38+lLBq4h6Bk/PKs8kvxd8UdkeYHiCaxcs15C90L10I?=
 =?iso-8859-1?Q?HvFils9+fS7P8xApTnqSv0G3ktMaUVidlSy6FuCFstQ0gerI3xx9Wa6my2?=
 =?iso-8859-1?Q?yhV6K2PoBMHgws5+yeTFX4GhstOuGO82oc78Pza8g9GHFRWBX/5ddZmw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff27e8a3-36cb-43dd-ee08-08db9f989503
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 03:09:48.8755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2lpZCES2GcL0PqgYNd5gojCP3UuYf2l/PfLZ1LUBofZdwbqyf1NfMzQ/qEvXRakjDg3KiJWb65wTUnN/DgZmrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6062
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
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, luben.tuikov@amd.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 17, 2023 at 01:13:31PM +0200, Danilo Krummrich wrote:
> On 8/17/23 07:33, Christian König wrote:
> > Am 16.08.23 um 18:33 schrieb Danilo Krummrich:
> > > On 8/16/23 16:59, Christian König wrote:
> > > > Am 16.08.23 um 14:30 schrieb Danilo Krummrich:
> > > > > On 8/16/23 16:05, Christian König wrote:
> > > > > > Am 16.08.23 um 13:30 schrieb Danilo Krummrich:
> > > > > > > Hi Matt,
> > > > > > > 
> > > > > > > On 8/11/23 04:31, Matthew Brost wrote:
> > > > > > > > In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
> > > > > > > > mapping between a drm_gpu_scheduler and
> > > > > > > > drm_sched_entity. At first this
> > > > > > > > seems a bit odd but let us explain the reasoning below.
> > > > > > > > 
> > > > > > > > 1. In XE the submission order from multiple drm_sched_entity is not
> > > > > > > > guaranteed to be the same completion even if
> > > > > > > > targeting the same hardware
> > > > > > > > engine. This is because in XE we have a firmware scheduler, the GuC,
> > > > > > > > which allowed to reorder, timeslice, and preempt
> > > > > > > > submissions. If a using
> > > > > > > > shared drm_gpu_scheduler across multiple
> > > > > > > > drm_sched_entity, the TDR falls
> > > > > > > > apart as the TDR expects submission order ==
> > > > > > > > completion order. Using a
> > > > > > > > dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
> > > > > > > > 
> > > > > > > > 2. In XE submissions are done via programming a
> > > > > > > > ring buffer (circular
> > > > > > > > buffer), a drm_gpu_scheduler provides a limit on
> > > > > > > > number of jobs, if the
> > > > > > > > limit of number jobs is set to RING_SIZE /
> > > > > > > > MAX_SIZE_PER_JOB we get flow
> > > > > > > > control on the ring for free.
> > > > > > > 
> > > > > > > In XE, where does the limitation of MAX_SIZE_PER_JOB come from?
> > > > > > > 
> > > > > > > In Nouveau we currently do have such a limitation as
> > > > > > > well, but it is derived from the RING_SIZE, hence
> > > > > > > RING_SIZE / MAX_SIZE_PER_JOB would always be 1.
> > > > > > > However, I think most jobs won't actually utilize
> > > > > > > the whole ring.
> > > > > > 
> > > > > > Well that should probably rather be RING_SIZE /
> > > > > > MAX_SIZE_PER_JOB = hw_submission_limit (or even
> > > > > > hw_submission_limit - 1 when the hw can't distinct full
> > > > > > vs empty ring buffer).
> > > > > 
> > > > > Not sure if I get you right, let me try to clarify what I
> > > > > was trying to say: I wanted to say that in Nouveau
> > > > > MAX_SIZE_PER_JOB isn't really limited by anything other than
> > > > > the RING_SIZE and hence we'd never allow more than 1 active
> > > > > job.
> > > > 
> > > > But that lets the hw run dry between submissions. That is
> > > > usually a pretty horrible idea for performance.
> > > 
> > > Correct, that's the reason why I said it seems to be more efficient
> > > to base ring flow control on the actual size of each incoming job
> > > rather than the maximum size of a job.
> > > 
> > > > 
> > > > > 
> > > > > However, it seems to be more efficient to base ring flow
> > > > > control on the actual size of each incoming job rather than
> > > > > the worst case, namely the maximum size of a job.
> > > > 
> > > > That doesn't sounds like a good idea to me. See we don't limit
> > > > the number of submitted jobs based on the ring size, but rather
> > > > we calculate the ring size based on the number of submitted
> > > > jobs.
> > > > 
> > > 
> > > My point isn't really about whether we derive the ring size from the
> > > job limit or the other way around. It's more about the job size (or
> > > its maximum size) being arbitrary.
> > > 
> > > As mentioned in my reply to Matt:
> > > 
> > > "In Nouveau, userspace can submit an arbitrary amount of addresses
> > > of indirect bufferes containing the ring instructions. The ring on
> > > the kernel side takes the addresses of the indirect buffers rather
> > > than the instructions themself. Hence, technically there isn't
> > > really a limit on the amount of IBs submitted by a job except for
> > > the ring size."
> > > 
> > > So, my point is that I don't really want to limit the job size
> > > artificially just to be able to fit multiple jobs into the ring even
> > > if they're submitted at their "artificial" maximum size, but rather
> > > track how much of the ring the submitted job actually occupies.
> > > 
> > > > In other words the hw_submission_limit defines the ring size,
> > > > not the other way around. And you usually want the
> > > > hw_submission_limit as low as possible for good scheduler
> > > > granularity and to avoid extra overhead.
> > > 
> > > I don't think you really mean "as low as possible", do you?
> > 
> > No, I do mean as low as possible or in other words as few as possible.
> > 
> > Ideally the scheduler would submit only the minimum amount of work to
> > the hardware to keep the hardware busy. >
> > The hardware seems to work mostly the same for all vendors, but you
> > somehow seem to think that filling the ring is somehow beneficial which
> > is really not the case as far as I can see.
> 
> I think that's a misunderstanding. I'm not trying to say that it is *always*
> beneficial to fill up the ring as much as possible. But I think it is under
> certain circumstances, exactly those circumstances I described for Nouveau.
> 
> As mentioned, in Nouveau the size of a job is only really limited by the
> ring size, which means that one job can (but does not necessarily) fill up
> the whole ring. We both agree that this is inefficient, because it
> potentially results into the HW run dry due to hw_submission_limit == 1.
> 
> I recognize you said that one should define hw_submission_limit and adjust
> the other parts of the equation accordingly, the options I see are:
> 
> (1) Increase the ring size while keeping the maximum job size.
> (2) Decrease the maximum job size while keeping the ring size.
> (3) Let the scheduler track the actual job size rather than the maximum job
> size.
> 
> (1) results into potentially wasted ring memory, because we're not always
> reaching the maximum job size, but the scheduler assumes so.
> 
> (2) results into more IOCTLs from userspace for the same amount of IBs and
> more jobs result into more memory allocations and more work being submitted
> to the workqueue (with Matt's patches).
> 
> (3) doesn't seem to have any of those draw backs.
> 
> What would be your take on that?
> 
> Actually, if none of the other drivers is interested into a more precise way
> of keeping track of the ring utilization, I'd be totally fine to do it in a
> driver specific way. However, unfortunately I don't see how this would be
> possible.
> 
> My proposal would be to just keep the hw_submission_limit (maybe rename it
> to submission_unit_limit) and add a submission_units field to struct
> drm_sched_job. By default a jobs submission_units field would be 0 and the
> scheduler would behave the exact same way as it does now.
> 
> Accordingly, jobs with submission_units > 1 would contribute more than one
> unit to the submission_unit_limit.
> 
> What do you think about that?
> 

This seems reasonible to me and a very minimal change to the scheduler.

Matt 

> Besides all that, you said that filling up the ring just enough to not let
> the HW run dry rather than filling it up entirely is desirable. Why do you
> think so? I tend to think that in most cases it shouldn't make difference.
> 
> - Danilo
> 
> > 
> > Regards,
> > Christian.
> > 
> > > Because one really is the minimum if you want to do work at all, but
> > > as you mentioned above a job limit of one can let the ring run dry.
> > > 
> > > In the end my proposal comes down to tracking the actual size of a
> > > job rather than just assuming a pre-defined maximum job size, and
> > > hence a dynamic job limit.
> > > 
> > > I don't think this would hurt the scheduler granularity. In fact, it
> > > should even contribute to the desire of not letting the ring run dry
> > > even better. Especially for sequences of small jobs, where the
> > > current implementation might wrongly assume the ring is already full
> > > although actually there would still be enough space left.
> > > 
> > > > 
> > > > Christian.
> > > > 
> > > > > 
> > > > > > 
> > > > > > Otherwise your scheduler might just overwrite the ring
> > > > > > buffer by pushing things to fast.
> > > > > > 
> > > > > > Christian.
> > > > > > 
> > > > > > > 
> > > > > > > Given that, it seems like it would be better to let
> > > > > > > the scheduler keep track of empty ring "slots"
> > > > > > > instead, such that the scheduler can deceide whether
> > > > > > > a subsequent job will still fit on the ring and if
> > > > > > > not re-evaluate once a previous job finished. Of
> > > > > > > course each submitted job would be required to carry
> > > > > > > the number of slots it requires on the ring.
> > > > > > > 
> > > > > > > What to you think of implementing this as
> > > > > > > alternative flow control mechanism? Implementation
> > > > > > > wise this could be a union with the existing
> > > > > > > hw_submission_limit.
> > > > > > > 
> > > > > > > - Danilo
> > > > > > > 
> > > > > > > > 
> > > > > > > > A problem with this design is currently a drm_gpu_scheduler uses a
> > > > > > > > kthread for submission / job cleanup. This doesn't scale if a large
> > > > > > > > number of drm_gpu_scheduler are used. To work
> > > > > > > > around the scaling issue,
> > > > > > > > use a worker rather than kthread for submission / job cleanup.
> > > > > > > > 
> > > > > > > > v2:
> > > > > > > >    - (Rob Clark) Fix msm build
> > > > > > > >    - Pass in run work queue
> > > > > > > > v3:
> > > > > > > >    - (Boris) don't have loop in worker
> > > > > > > > v4:
> > > > > > > >    - (Tvrtko) break out submit ready, stop,
> > > > > > > > start helpers into own patch
> > > > > > > > 
> > > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > 
> > > > > > 
> > > > > 
> > > > 
> > > 
> > 
> 
