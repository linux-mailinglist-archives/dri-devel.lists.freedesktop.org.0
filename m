Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5D77CE281
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 18:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E41A10E179;
	Wed, 18 Oct 2023 16:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC67310E16B;
 Wed, 18 Oct 2023 16:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697645750; x=1729181750;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h7WhN1OkoQDfDV0FCLh9zlagg4UTmqA8kiR8FZscIm8=;
 b=d0SJkm2UsvBMqzBaRG0/TXqaAHuDt1lGwbUlSD7Ax9bqZhalYoLRRetq
 bBxrVSUdswl6RvOpLo/c2tt56EtvLcg2Ytj2a6YNb0ScYjvv26KmyPkLe
 dLb4ep/Xs/8VnfaH5NU3AcZjopGata/t3F/nYMtj52PGx62ybhMilkzH4
 t3DJrEp6KZUZMLBKFbJRPKaJKyZNxxqg1g1rCHAu9bA9HblR/EG8gmSfv
 I5yiz9HZlX26XhwxKLqbdifS5gNzyPTOFu/hnv+EUPYKpKUftaeMCBqHd
 6Rb2U+9MExuM1LCGVQgiWXgDpSFfO0z/TnTE1fR8CfftDGc0AT1PSbBvl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="366304446"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="366304446"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 09:15:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="756641050"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="756641050"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2023 09:15:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 09:15:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 09:15:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 09:15:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 09:15:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YsPILJF8Y/or3CwTWp38AWIeAN6jVzV0DuS9lf4qPVDroWjeicWntb/jGKcm939KtfoAhz4PkT+KgSHQ14EYzNauRsp2N+f/Q8gkbyk4Mn3FVx1LGOjuZuB13cvEVnMDgoJJ2ZIeBtwN9MgoNqXk5JkZ5gGSKvFWvIU2n8NDgSWXYrrHALFGKebP0G/Giq5i/fKIofaQ8v/n6d7CSHwRIFcXQRxuxo/jtz1iGH9rG+TucKedRXi8IoMW0VgBLG8T8k7BlHguebKfaR1MsNppWIu++vZzW6dH8C02ZOow47e9Nbu7gKbfKKvOPiTxmMfvLVVvGk9QOVxswWdPZ9Vh1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiXwenx3q2GJZW22VlmY8iIVm6awo9Sodz0pT40syhk=;
 b=OLZuXoEawsujUGk68spCbuaJivES0h5t0EhyLNXxrballnnI3zix0lwYEyDXeplvnmIrNfdLAYtb34824rj7as2fcpAQ2/Jy4qIpYMcJufcBbhuMxM/AOHK4weK3vf8zrxQIAx013unzkBkII9B2W5t0pfW3wYttALP4a6HOaprUbBTbFCaSO1SZEhEqQU7qG0zxlczNyt8hBM6F0UnbmYF3IFR9LXkbJMNWd5gE2POl+Sp2IDZIurulc5hDB5SlrezmfuAk9BqxiBobpWCo0OPma7Mqlpc8dXDM9sh2XaOw7h7Iwr62yp+8UY5DD5m4eWArJVdU/w7vC7+oC9LS6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by IA0PR11MB7356.namprd11.prod.outlook.com (2603:10b6:208:432::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 16:15:46 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::413:a622:bff4:bdd6]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::413:a622:bff4:bdd6%4]) with mapi id 15.20.6863.043; Wed, 18 Oct 2023
 16:15:46 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v5 2/3] drm/i915/guc: Close deregister-context race
 against CT-loss
Thread-Topic: [PATCH v5 2/3] drm/i915/guc: Close deregister-context race
 against CT-loss
Thread-Index: AQHZ/jpdxFVLHhLq90eAeDgTzjj9/bBPv/2A
Date: Wed, 18 Oct 2023 16:15:46 +0000
Message-ID: <CY5PR11MB6211EF265A589553D02C42A595D5A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231014010413.256468-1-alan.previn.teres.alexis@intel.com>
 <20231014010413.256468-3-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20231014010413.256468-3-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|IA0PR11MB7356:EE_
x-ms-office365-filtering-correlation-id: 3a777000-4100-4f55-1ba2-08dbcff57c3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lf2vDwjsQB/n32sc/WULmqEM6JFXAeYRnRITJzpfgE5Rc0LthDD8lm9PaLUYoo837ewHHIJRHZHsKga/fX4GHm4zvTZfGSN5TfJquFU7udcFd0BIfeUgTGRfvUZ5/2hn6MOCzNE1lGVijVIGep9fVu2wY/igvthPZYOa/jdMjjp1Fina3MQHXLInCUW3qLHemO3jycpwIwckBiK5AnbDwJ++aeoIxYvAkqdvJZtXB8yAaol6BfL0EbpaRADfCkaedAhxGPSfe1zFSdAUUWSEO/MRUrKozK+d0qPRJJboWOLytEazajhyC8dpR0mJbY54/D98OjqyXuk0eT5d8ec7A7e4G5iHrYjKi7u+XPQtPDIUUorc/g0pWLZaZhVYjFyqYgn6n6AiQULtcAQp+fF637KhfkVjTJWrURrCuHxnjJvcfNBgwyOPJWgCSVm8V4vjREWAhPGKp8KKJQpm0JoVdusTBWxPiB7KyjhGA4arUDEG5bUCqbvYvXEQxWik7qO2sd5BnMk2aaOwgaDfkWLB/fgyeOxsRQ4d1iE4ZGLgNu3nt82JBcWSjkyeIYYgaJTUQHgRWzH1ygQdpXDnybTrDdYPXH7WpfTKogj0AStGZG3jPYlpBI+uhWH9xErY6cPe
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(346002)(376002)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(9686003)(33656002)(55016003)(450100002)(316002)(64756008)(66556008)(54906003)(38100700002)(110136005)(66476007)(8936002)(86362001)(122000001)(82960400001)(38070700005)(66946007)(66446008)(53546011)(83380400001)(76116006)(26005)(107886003)(71200400001)(7696005)(6506007)(2906002)(478600001)(52536014)(41300700001)(4326008)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?q0i91voUqdv8NqMRCbsADfYyAtDcc0Z7Mqxg+nsS1UWi91XLKHaYw1mOCGHG?=
 =?us-ascii?Q?lsicmd8pKT1qWs/ixJHv1jTxX3/JlBhQs2Xult45zMMLPnKPX84zEzGK94kY?=
 =?us-ascii?Q?6BnmlDW9z73KydRJCEo4DR4BiRVdr7l3W8iTKWLzZnl9GFwCXJDNW60kmoC0?=
 =?us-ascii?Q?zitv3VndYUJtyytm9ZPrqmmzYYJT8puYMDKArRr11Ftl7i7+wNllpI6popPe?=
 =?us-ascii?Q?1mLdV/ilHUTed+kFVA2d3aCVz49UJ4jmI4YCWeLyJqqesbN/o7ECDjZ3xREo?=
 =?us-ascii?Q?yOba4L0FTTwswRSfobP6X7iUEoq6WvzXiAz/r/Dh3tTvR/1tnytsyDJYId1i?=
 =?us-ascii?Q?z/x/hJtrb4N6+DI4eM0wkwB7PhwGmhA7L9SXpC4eStBr059fJErIr+W53FAS?=
 =?us-ascii?Q?3BgZzfNNf1CAjX2dlMv+ZXf6Q7BeWFZjv+uYMA9RTStqfjJnijKHyTLDVcqc?=
 =?us-ascii?Q?MLPIC94CjT/fAbzNNLRNgTHbeUh0Ts0UHPuXudJEE9ka3BJRbK9i0/Be5iGK?=
 =?us-ascii?Q?FeUnKk4hWGPiLqA8taWevcfuDNvMruC6vprWyqwDuQBTlsDesCKkS7vG5IJW?=
 =?us-ascii?Q?3L/vQjMO3fQ3bZ+ejVBuEfoMryzEVS0cOcdJ9jUJK9pHgX5GFgR/DrrlVMTK?=
 =?us-ascii?Q?I8gpUl6d+zB2dyF045tIA+5UkaEOb0U5Bhl6t2N2WODnxIZuuAy11k+rYEXZ?=
 =?us-ascii?Q?nviMEc0C4/5fGSbu+C3hMlRxzErOPwre+qDTLgn5BOIbmCEGgAVumEzg0MXU?=
 =?us-ascii?Q?THI976iN56D3cCtj+yFgGWlZaT7rNr/7R3Nvx+rzSN2nzYCCrOvm7kFn6s1C?=
 =?us-ascii?Q?WGEQ+EFTfBmEWAwdDntmzUKECeWn5w+2Ap689LEiuLFEec3lxBTp12AuIgse?=
 =?us-ascii?Q?xZ6MM64wIuoJh3PIEqrJ5i0qZYJszGqL6j7cIg7N1JBeNxulzv4RdU9/Kjvs?=
 =?us-ascii?Q?58jUTwJmyjHTuSFswXoTA1njuwuzwZE8xMBtwbZxVIK1/urIXnRzvnrmwFpV?=
 =?us-ascii?Q?LImgz2Ze4tQU2EzsnP7lZv6jztryQHnec1v9NYCLV1wLSjUeOM3lZhf94S5D?=
 =?us-ascii?Q?6zpWVxdrLMPuEMjdLb4HtmD63Mii+XquHl9hVaPF+bycSHMtKSHcMQ5QXcR8?=
 =?us-ascii?Q?Ux/nYWMBiEC9k/9Y3DbVR4JFSPX+G1Edc9w0GRF1DOmXAvLxlZ6ABPqDBhrr?=
 =?us-ascii?Q?6vLGrFL05TqsT+Z7smiW0r4E3F65JXXMWtLT2sTOK8/VtVD1/IZs7bxW8Wrg?=
 =?us-ascii?Q?1odjz0K7XjKD6f0KD8qYroYuvpCzZwOA5BIVbn4R4kWYSB/giAEVyMQLcDC+?=
 =?us-ascii?Q?O9ueg/i34xNh3P+QTPh7eBHIDtpp9rQ9sWOTNiSTT6UZvQF0syyHi00SVTXh?=
 =?us-ascii?Q?BnI/EeBH31R1Az4iCXrfgcC/PCgqB4oEnvKBq+vvdZscyT+3SNrDDm0mrNWI?=
 =?us-ascii?Q?i3kIPJQ5QZwi0o+9Q0o2mg8lvcvx28IDfFKYAuZUBgXXFZJ/h+0uOaHzZSJi?=
 =?us-ascii?Q?bImcTiAOaEkbzfPC02mo2CHWVEw7nf80KH8S+XiUU3JKQuqGaVWMLYCrzTYp?=
 =?us-ascii?Q?MtKSUnB3pITRfQ8wcMhT/99oIpHEASH9gCNKx8wV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a777000-4100-4f55-1ba2-08dbcff57c3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 16:15:46.0966 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: txwsb4bqi+Wl4lR7HOvMwRt3umzpUgc3mlpk3cJ6Sgbej99+UzAdoCt5CizV5F64kX4VnoM/tCXkFJtdHTzfxR9jezo6N/HT3mpxu0i1Efk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7356
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
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Jana, Mousumi" <mousumi.jana@intel.com>,
 "Harrison, John C" <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>
> Sent: Saturday, October 14, 2023 6:34 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; dri-
> devel@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Cera=
olo
> Spurio, Daniele <daniele.ceraolospurio@intel.com>; Harrison, John C
> <john.c.harrison@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Ursulin, Tvrtko <tvrtko.ursulin@intel.com>;
> Jana, Mousumi <mousumi.jana@intel.com>
> Subject: [PATCH v5 2/3] drm/i915/guc: Close deregister-context race again=
st
> CT-loss
>=20
> If we are at the end of suspend or very early in resume its possible an a=
sync
> fence signal (via rcu_call) is triggered to free_engines which could lead=
 us to
> the execution of the context destruction worker (after a prior worker flu=
sh).
>=20
> Thus, when suspending, insert rcu_barriers at the start of i915_gem_suspe=
nd
> (part of driver's suspend prepare) and again in i915_gem_suspend_late so
> that all such cases have completed and context destruction list isn't mis=
sing
> anything.
Acked-by: Anshuman Gupta <anshuman.gupta@intel.com>
For rcu barrier usage.
>=20
> In destroyed_worker_func, close the race against CT-loss by checking that=
 CT is
> enabled before calling into deregister_destroyed_contexts.
>=20
> Based on testing, guc_lrc_desc_unpin may still race and fail as we traver=
se the
> GuC's context-destroy list because the CT could be disabled right before =
calling
> GuC's CT send function.
>=20
> We've witnessed this race condition once every ~6000-8000 suspend-resume
> cycles while ensuring workloads that render something onscreen is
> continuously started just before we suspend (and the workload is small
> enough to complete and trigger the queued engine/context free-up either
> very late in suspend or very early in resume).
>=20
> In such a case, we need to unroll the entire process because guc-lrc-unpi=
n
> takes a gt wakeref which only gets released in the G2H IRQ reply that nev=
er
> comes through in this corner case. Without the unroll, the taken wakeref =
is
> leaked and will cascade into a kernel hang later at the tail end of suspe=
nd in this
> function:
>=20
>    intel_wakeref_wait_for_idle(&gt->wakeref)
>    (called by) - intel_gt_pm_wait_for_idle
>    (called by) - wait_for_suspend
>=20
> Thus, do an unroll in guc_lrc_desc_unpin and deregister_destroyed_- conte=
xts
> if guc_lrc_desc_unpin fails due to CT send falure.
> When unrolling, keep the context in the GuC's destroy-list so it can get =
picked
> up on the next destroy worker invocation (if suspend aborted) or get full=
y
> purged as part of a GuC sanitization (end of suspend) or a reset flow.
>=20
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Tested-by: Mousumi Jana <mousumi.jana@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_pm.c        | 10 +++
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 81 ++++++++++++++++---
>  2 files changed, 80 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> index 0d812f4d787d..3b27218aabe2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> @@ -28,6 +28,13 @@ void i915_gem_suspend(struct drm_i915_private
> *i915)
>  	GEM_TRACE("%s\n", dev_name(i915->drm.dev));
>=20
>  	intel_wakeref_auto(&i915->runtime_pm.userfault_wakeref, 0);
> +	/*
> +	 * On rare occasions, we've observed the fence completion triggers
> +	 * free_engines asynchronously via rcu_call. Ensure those are done.
> +	 * This path is only called on suspend, so it's an acceptable cost.
> +	 */
> +	rcu_barrier();
> +
>  	flush_workqueue(i915->wq);
>=20
>  	/*
> @@ -160,6 +167,9 @@ void i915_gem_suspend_late(struct
> drm_i915_private *i915)
>  	 * machine in an unusable condition.
>  	 */
>=20
> +	/* Like i915_gem_suspend, flush tasks staged from fence triggers */
> +	rcu_barrier();
> +
>  	for_each_gt(gt, i915, i)
>  		intel_gt_suspend_late(gt);
>=20
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index a5b68f77e494..9806b33c8561 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -235,6 +235,13 @@ set_context_destroyed(struct intel_context *ce)
>  	ce->guc_state.sched_state |=3D SCHED_STATE_DESTROYED;  }
>=20
> +static inline void
> +clr_context_destroyed(struct intel_context *ce) {
> +	lockdep_assert_held(&ce->guc_state.lock);
> +	ce->guc_state.sched_state &=3D ~SCHED_STATE_DESTROYED; }
> +
>  static inline bool context_pending_disable(struct intel_context *ce)  {
>  	return ce->guc_state.sched_state &
> SCHED_STATE_PENDING_DISABLE; @@ -612,6 +619,8 @@ static int
> guc_submission_send_busy_loop(struct intel_guc *guc,
>  					 u32 g2h_len_dw,
>  					 bool loop)
>  {
> +	int ret;
> +
>  	/*
>  	 * We always loop when a send requires a reply (i.e. g2h_len_dw > 0),
>  	 * so we don't handle the case where we don't get a reply because we
> @@ -622,7 +631,11 @@ static int guc_submission_send_busy_loop(struct
> intel_guc *guc,
>  	if (g2h_len_dw)
>  		atomic_inc(&guc->outstanding_submission_g2h);
>=20
> -	return intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
> +	ret =3D intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
> +	if (ret)
> +		atomic_dec(&guc->outstanding_submission_g2h);
> +
> +	return ret;
>  }
>=20
>  int intel_guc_wait_for_pending_msg(struct intel_guc *guc, @@ -3205,12
> +3218,13 @@ static void guc_context_close(struct intel_context *ce)
>  	spin_unlock_irqrestore(&ce->guc_state.lock, flags);  }
>=20
> -static inline void guc_lrc_desc_unpin(struct intel_context *ce)
> +static inline int guc_lrc_desc_unpin(struct intel_context *ce)
>  {
>  	struct intel_guc *guc =3D ce_to_guc(ce);
>  	struct intel_gt *gt =3D guc_to_gt(guc);
>  	unsigned long flags;
>  	bool disabled;
> +	int ret;
>=20
>  	GEM_BUG_ON(!intel_gt_pm_is_awake(gt));
>  	GEM_BUG_ON(!ctx_id_mapped(guc, ce->guc_id.id)); @@ -3220,19
> +3234,38 @@ static inline void guc_lrc_desc_unpin(struct intel_context *c=
e)
>  	/* Seal race with Reset */
>  	spin_lock_irqsave(&ce->guc_state.lock, flags);
>  	disabled =3D submission_disabled(guc);
> -	if (likely(!disabled)) {
> -		__intel_gt_pm_get(gt);
> -		set_context_destroyed(ce);
> -		clr_context_registered(ce);
> -	}
> -	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>  	if (unlikely(disabled)) {
> +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>  		release_guc_id(guc, ce);
>  		__guc_context_destroy(ce);
> -		return;
> +		return 0;
>  	}
>=20
> -	deregister_context(ce, ce->guc_id.id);
> +	/* GuC is active, lets destroy this context,
> +	 * but at this point we can still be racing with
> +	 * suspend, so we undo everything if the H2G fails
> +	 */
> +
> +	/* Change context state to destroyed and get gt-pm */
> +	__intel_gt_pm_get(gt);
> +	set_context_destroyed(ce);
> +	clr_context_registered(ce);
> +
> +	ret =3D deregister_context(ce, ce->guc_id.id);
> +	if (ret) {
> +		/* Undo the state change and put gt-pm if that failed */
> +		set_context_registered(ce);
> +		clr_context_destroyed(ce);
> +		/*
> +		 * Dont use might_sleep / ASYNC verion of put because
> +		 * CT loss in deregister_context could mean an ongoing
> +		 * reset or suspend flow. Immediately put before the unlock
> +		 */
> +		__intel_wakeref_put(&gt->wakeref, 0);
> +	}
> +	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +
> +	return ret;
>  }
>=20
>  static void __guc_context_destroy(struct intel_context *ce) @@ -3300,7
> +3333,22 @@ static void deregister_destroyed_contexts(struct intel_guc
> *guc)
>  		if (!ce)
>  			break;
>=20
> -		guc_lrc_desc_unpin(ce);
> +		if (guc_lrc_desc_unpin(ce)) {
> +			/*
> +			 * This means GuC's CT link severed mid-way which
> could happen
> +			 * in suspend-resume corner cases. In this case, put
> the
> +			 * context back into the destroyed_contexts list which
> will
> +			 * get picked up on the next context deregistration
> event or
> +			 * purged in a GuC sanitization event
> (reset/unload/wedged/...).
> +			 */
> +			spin_lock_irqsave(&guc->submission_state.lock,
> flags);
> +			list_add_tail(&ce->destroyed_link,
> +				      &guc-
> >submission_state.destroyed_contexts);
> +			spin_unlock_irqrestore(&guc->submission_state.lock,
> flags);
> +			/* Bail now since the list might never be emptied if
> h2gs fail */
> +			break;
> +		}
> +
>  	}
>  }
>=20
> @@ -3311,6 +3359,17 @@ static void destroyed_worker_func(struct
> work_struct *w)
>  	struct intel_gt *gt =3D guc_to_gt(guc);
>  	int tmp;
>=20
> +	/*
> +	 * In rare cases we can get here via async context-free fence-signals
> that
> +	 * come very late in suspend flow or very early in resume flows. In
> these
> +	 * cases, GuC won't be ready but just skipping it here is fine as these
> +	 * pending-destroy-contexts get destroyed totally at GuC reset time at
> the
> +	 * end of suspend.. OR.. this worker can be picked up later on the next
> +	 * context destruction trigger after resume-completes
> +	 */
> +	if (!intel_guc_is_ready(guc))
> +		return;
> +
>  	with_intel_gt_pm(gt, tmp)
>  		deregister_destroyed_contexts(guc);
>  }
> --
> 2.39.0

