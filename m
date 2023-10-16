Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DFF7CAD14
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 17:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B97A10E21E;
	Mon, 16 Oct 2023 15:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A25510E21E;
 Mon, 16 Oct 2023 15:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697469244; x=1729005244;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AKKHvMEdIFw2m+4xbpgiaHPd9nAQEfslEyMeE99mSuc=;
 b=msY8pkfy5QNxmeJbQzisI2LX5kmt4sgeQsSydXUVWTE6G5Nz/HDdKtDd
 dDQlmkViNMUt7cdXdWJTEnaAFTe1LYnVJwpWhJt6nDbafS9d6Pf/TafLF
 eS0gVfJdj6GBVt+LomzGQ3ozRKWlS/59OqEfwn1CggjdnNFu1oBH5ZOKu
 jTuZhCKPCHDCnyU+eZ1QrqTW0nETwPIAHpBxOxTKD1R5NjGR7wfZot5jV
 /UFVI29dBeIaxqiQKhJnzCzkgq+sArkoBUEAgUJe9MChJ1X7+mge6iTYA
 k930/sUUuHlB3IEx3HddeoO7nnPnbrZCFWiSm6cXliAZ5jZnJg5v6A7qA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="384423605"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="384423605"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 08:13:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="899533802"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="899533802"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 08:11:37 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 08:13:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 08:13:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 08:13:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLIgs+mxparIf7DhbzkmxdcXSi5zXenz44G7LwfEFJWA278jQTqUyVmjnKIkRp9feeOxTV5Co85dezt9D50BjVlzqFcVEv21oaGNC1nYGTGHBrYy/I6QqzaBDlCYYBvMBZ23a6Mml1rGqj0STJnwqpdqcFTOm1rKnSRgy3tG+d1tTX7AyTAPobeOc4jFV7qNRi++0Gnl50tt7JfhnMzrn51DsdAmrDL3SxZD5mUopuMMRf9D2lJn63ImXKwDOX58k6TpCuyy3EQnrsznS3TS2JubBybcKbEbXsvPCn8OKowWMbLqfR6lbGYUpGCK/zSB4CZnkBqG4Q19jlEzs+9+vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kP6Of0yC3Vp7JKqd2QAY54fECS0n3NL/uAZxFECMJJ0=;
 b=ij1TIZUQ6pnxVkgLZrvxe7VL4Xn/3eMoFfotZxtmsgbqW9k+rfcSenJgsJ8802zV70rbW1HBtmMOSsBYlGVYLW3KKfJfBXEGGi4IQPVC9rffJLf/c7Pygy1roXTScTciqtzoiAleRv7q7qeCg9AND6rQjN5p/uXfDV3O4flP/kOfg/tjQ8mwIFcatuk1ZPfhyAyhtcXhPSB2hpKhZvIqFVa3uKOqbu7D+pCsZmeSwbwJqjCTMHvFfIW7Y4/0D3lzEjKelTb4btUvHtdcfTNUMatTSxnQELP2lb1JvbC0NNlTZKaAboH+dJnHuVPl8gjwk6wGBQogUhxfDnzI3VAhVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5031.namprd11.prod.outlook.com (2603:10b6:510:33::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Mon, 16 Oct
 2023 15:13:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:13:34 +0000
Date: Mon, 16 Oct 2023 15:12:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v5 5/7] drm/sched: Split free_job into own work item
Message-ID: <ZS1SyZUvMLJFEEbB@DUT025-TGLU.fm.intel.com>
References: <20231011235826.585624-1-matthew.brost@intel.com>
 <20231011235826.585624-6-matthew.brost@intel.com>
 <23cceeb8-5d86-4923-a072-b9e72b74d36b@amd.com>
 <c91d3a47-df4a-4be8-8f27-c850289df281@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c91d3a47-df4a-4be8-8f27-c850289df281@amd.com>
X-ClientProxiedBy: SJ0PR03CA0237.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5031:EE_
X-MS-Office365-Filtering-Correlation-Id: f5910b4d-44a5-4853-44ea-08dbce5a770b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Osv45wJqB7jYRfFD5Azp5zqNmKP+BqEkmF+sqcZxqSTVQnmjQtMQbczXewS+qFKo7n0MqxsWVK/9C9mSNgcAxNdiBONnP87p9gaMwxIgQX/fLLrzfuFIU2Uj81CvlmW5qArGEGgxsO4VgdiKErZfjHXU1zMPR2QMXtqSJV6pnc7haMylpDA74XJzRc25dR0cheS5NFzcPPMpSFZ6+NPd9AHNtFmzDQz2IDQzGhGcrjL9HxkWakMl35IwRQKe/sWSKF2BhZy9q2GAFeY3HpyocUBJZ7k5cQPof+n7jbWyaTjSuU8oODfu6lbG9j2tY2WDLXbbYKZGR6CmAx2OBwS+W8cmH+mTe2rrPfaNoYTKos7QVW/fmE882KtQg9rk3GdW3R/D6dOsyDJFUmqqoblylDgoK6K1e1iCjkTRgqsUGK5GYSVYQOPDkk6uxAnkLWrt67X3ZrDB3aJ/Sl0gzbBwlvmEn7BO0kmPF4Xgu/DjaooQ5ylSDVQYNPtwbEVPY64FpFbO/vCzFY6F7rvJIF2Y5tf1l6SmBp1/EqDRzKn+6rBKNLNNijujprW2fuPvLXjQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(376002)(39860400002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(4001150100001)(6916009)(83380400001)(4326008)(26005)(82960400001)(38100700002)(8676002)(8936002)(44832011)(316002)(41300700001)(6486002)(66556008)(66946007)(53546011)(6512007)(478600001)(2906002)(6666004)(7416002)(5660300002)(6506007)(66476007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?poWtjMa4zQgiE9deZ8SzZ17xTrtNOC5PJdsYYRlbgWUmuFLMMUv2LzdkO6U1?=
 =?us-ascii?Q?bCnP5LTcJfDq6glIQCvVs3oGdrfje5oCTUCKxc+iO0E1DT0c+36f7s6YWSMv?=
 =?us-ascii?Q?6aUfoI8/JE62r4BmNp1XvSto/hrQtg9qxn9zKoHfiPereZkWp40nZ8XAZA74?=
 =?us-ascii?Q?8oOyGtxy1pOaCt/dPYPSbP3nnkn5GDDjZ92jXW0sUWaCEjn4cRxzKgWLQH1z?=
 =?us-ascii?Q?+tNfFmx9RVubPumIvMQURKvFJ565Aju5TnR1UOYx7MXwh/ruadu6ui6Rk/K1?=
 =?us-ascii?Q?rfxFjpqO8KKnlDTGk4U4quWPo3DdG+Vnrk1MZSxIUYWA9GLzXMHkZ0BzyOpD?=
 =?us-ascii?Q?D5ORZYw4KCRw8lwa8CN4463/9N4cgyZCC9kL1vOQbWV1i/xEs+OlvsIpCPsd?=
 =?us-ascii?Q?cEmMVs/I4tZYDvDfjoAe1UnjPLr9rPzwRu9DX5XxgOaIYg4AKAxywrV6a/SK?=
 =?us-ascii?Q?Sjo5NCeXynd6izwo47yYUrBhJxPcz9GP8/7aAW6Mj6Fmf8BIypO6f2vVyk/Q?=
 =?us-ascii?Q?Nqzs/luBbdI2sCyT6SggtqD64iig2phxx08CgOhmiWPmZNCtQtHHc/hpx4hr?=
 =?us-ascii?Q?Wn1uUF4PyzH4OkE920ED/yhrgYmu6XjJOCgnAeEHC/nDVLhytlNvgLNm8Llk?=
 =?us-ascii?Q?SR00MmCVgWsIKj5khz7OPvD+oDugYOiFEElH2K26AmskgONV3HWWtsWuwtI3?=
 =?us-ascii?Q?mT4a4VPQ287ZijCl2vMal5CpU3gUgZ1+HL5kKWRpyLOwKtgsEejF0FdMPi2/?=
 =?us-ascii?Q?Nm8E9SviZ8Z+2fZPCy9uEOt7pydwAOegL4oXG0Z8jAaAAwpBh6Pi6K57+QKz?=
 =?us-ascii?Q?CeXpiGoqw/wxb+vkHuygdpA6TqtAOuQw/jwlUcAfAfRf+iYwNvqBZf2zhN1b?=
 =?us-ascii?Q?ArFlieoYicT3jU4pQeckz0fnQyAUAZqLzPzEASg9/3gVPCZYPWnHWpnJDXsS?=
 =?us-ascii?Q?1fR8Dk+lETROZUf2Jx4aoi5W9okAkdVVhn396NSGQDkpPStqdGsJaq8SmEyj?=
 =?us-ascii?Q?rXdyP4F8UwZap7ULDU5AQoyF5yROnyG8/hrCMeDfAGC9YQugjN3bKl6hLtHh?=
 =?us-ascii?Q?nfXOLKMWwDqqhPqOCblWEukwUfIFsKD9tNJBAotiszU18h2+NLeTNRBelCLY?=
 =?us-ascii?Q?Th6jvcJhEvX0i+YiXyUx6VLQtREK/kh5WqiliYR3PSFNvwp2ZTyspUnmuLtu?=
 =?us-ascii?Q?LYQM4cPjUs1BZhNivMIKeSsJvgbQebZ0bzqDKWmZA23NX4DzApTAZZaFNzIK?=
 =?us-ascii?Q?nFUOjqjnUqGfBT6o5wxqDSpHFNzKpyarJ6/mlVbf8huFrmvny84mFy4Xgyfb?=
 =?us-ascii?Q?xd8701MOmkq4HK4F+JT1EmYsvZe1yYZKezKlgka56rg0pbOO8PEZom2CclgO?=
 =?us-ascii?Q?M6abzfLjqIgpgqFcpaLNGHDf5ZlynOM8xLGvo9kaH8mZgLTBpoJswLqbCDmH?=
 =?us-ascii?Q?VtXOwHYRzlkGKr9Hqqs2P+edXRq3FPIm4/9paU/LrT4onsDtG9zsmfkmqJ6T?=
 =?us-ascii?Q?A0pznzjsUIT2tTXVyKUuttF0rEYF1hQPbLMwZuIcyujZJ9BxKx+QtlOINLFg?=
 =?us-ascii?Q?gFTC6N1ycUwcgny604cUzCgOMjO0lHNjrXMwhpkIxg1gAOmL5xpdAEvKR6So?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5910b4d-44a5-4853-44ea-08dbce5a770b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:13:34.4449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iRSM9qS/4Wn9qEY2vuw4M9vATu2HDqcGhYaSajS4sLFE59i71/WtGjCvRX2gQz8BgGXvtx3xVAT+NxNETrz1HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5031
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

On Sat, Oct 14, 2023 at 08:09:31PM -0400, Luben Tuikov wrote:
> On 2023-10-13 22:49, Luben Tuikov wrote:
> > On 2023-10-11 19:58, Matthew Brost wrote:
> >> Rather than call free_job and run_job in same work item have a dedicated
> >> work item for each. This aligns with the design and intended use of work
> >> queues.
> >>
> >> v2:
> >>    - Test for DMA_FENCE_FLAG_TIMESTAMP_BIT before setting
> >>      timestamp in free_job() work item (Danilo)
> >> v3:
> >>   - Drop forward dec of drm_sched_select_entity (Boris)
> >>   - Return in drm_sched_run_job_work if entity NULL (Boris)
> >> v4:
> >>   - Replace dequeue with peek and invert logic (Luben)
> >>   - Wrap to 100 lines (Luben)
> >>   - Update comments for *_queue / *_queue_if_ready functions (Luben)
> >>
> >> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > I wasn't able to apply this patch on top of drm-misc-next at a48e2cc92835fa.
> > 
> > Create a branch off of a *clean* drm-misc-next and rebase/reapply/cherry-pick all
> > 7 patches on top of that clean drm-misc-next branch. You should also run
> > scripts/checkpatch.pl --strict on all your patches, or integrate it into the precommit
> > hook, see githooks(5), so you don't have to run it manually.
> > 
> > Set format.useAutobase to whenAble somewhere in your Git configs (global/local),
> > or use --base=auto to git-format-patch when you format your patches before
> > git-send-email-ing them.
> > 
> > Repost your patches.
> > 
> > The base commit will be added to the bottom of the cover letter. It should
> > be an ancestor (or tip) of drm-misc-next (git branch --contains <base> --list etc.).
> > If it is not, your base tree wasn't clean, and you should redo this process.
> 
> Poking around I found out that this patch set is based off of drm-misc-fixes.
> Had the base been included, it would've made this easier.

I believe I based this off of drm-tip. Will follow the flow mentioned above in next rev.

Matt

> -- 
> Regards,
> Luben
> 
