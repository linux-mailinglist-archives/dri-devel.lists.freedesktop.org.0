Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9646896319A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 22:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0089210E5CC;
	Wed, 28 Aug 2024 20:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WjOB61S2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2262610E5CC;
 Wed, 28 Aug 2024 20:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724876237; x=1756412237;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9qz8ln11UJOj8kwQF/niST/tz2q37N3fVT4gEKGYYpQ=;
 b=WjOB61S2b9dOZULAt6ExYGWGGizxRpBoVn3GNxOLQ90O6SEBwQRxBV2I
 QD1/3xNX57WYz+Yqp45f078EqpBjxeF1MKHuwTjatRq4l72nQv9g7X2Qi
 115T6IGhuxMxsUWJrbfBrBG4nL9obsK5V4i0JQ4mWrFcbAioYu7J8kPUL
 pavCCUzKaN5DeUbjHJFLL5KBF858cT4BYJ+Ljqe4uCqLQhzdklEiUt6jr
 TviqNiVirQgqC1MQXh2216R4QK2u377yyoQqeGdeueQ2Pw+4E/jaC4XOg
 qWavQvNw4HlFeclzmvVUsQPlwNOYK7uG8BhV2RbJV10fa/uyTVnAL298U Q==;
X-CSE-ConnectionGUID: g91jIoesTUanLSbi10lBDg==
X-CSE-MsgGUID: KeHz/nRNQfi+R+RvEmFqEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23298551"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="23298551"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 13:17:16 -0700
X-CSE-ConnectionGUID: tPgtGkLYQe6IsWi1b3PNcQ==
X-CSE-MsgGUID: 4eC53VsrRkOcdAVwVTS3JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="63855317"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 13:17:15 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 13:17:15 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 13:17:15 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 13:17:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pfft8V7X88QpbCkkITsDsaK6i7G2VoBBZ18dElCd592ggkgznRhlUiG4pzu/qmD+hsn2W89JLV2NszHNIG5XQUV3Kh08LWqv56t8sI20pDVh7YLhB3L9Qo7rljzHXdhfzKF5iTq5Z3w00umndNB//NI74c9mLmfbUhEv3o//TOROy0zkd2UEoFpYXLWOa9k+3kZ09lyI/Ephx/XW0iXaIKb0p4s8ytTCqs0muXTT/rxO7ZoEYjuKEWEEMoC8Lzmdl1GzEZ2qWbYNcWfDQo9G/ey4aKMtpbq7ZNAcQmPZwa8EiImKelHyjmPKikS22aX/O1Hg5lvtlbOYd/wSDa+/tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpzeCRPsTpTCqSZlIPlvA5KoqTNwQ47pJommJryFO2E=;
 b=CdHcnbmzLkRexKtxIaB9LokRYUrJiP/jmB78zzhHU7yw71OI9/ACOziEdDdw00swMP2DQBp4+njpyD9fAHxb9rm070qgrEWcw7I+KNGuWRMN2ZotSkwduzGg6K0IQTJRxR1Suc6DNn6zJH/GYtPIscKIJIZ1+rJucDQ8LzHrCtIwOLADlCC/J0U/OGGrbOqsdF5OAradv+QnJwqXeSmeAMXhBZeaFNYdp+CAM3586MSwoXcUziX9ISOOgYmS1IHjP3359YGH++O1zdqg+u4HR3JrBsUgvJpD77POVBtXQevzRF63ti1xfqmPjBiyQq5nWiDjecTLk7blo8W8lpZG7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ1PR11MB6156.namprd11.prod.outlook.com (2603:10b6:a03:45d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Wed, 28 Aug
 2024 20:17:12 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7897.014; Wed, 28 Aug 2024
 20:17:12 +0000
Date: Wed, 28 Aug 2024 16:17:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gt: Continue creating engine sysfs files even
 after a failure
Message-ID: <Zs-Fw8DufuAIo_vq@intel.com>
References: <20240819113140.325235-1-andi.shyti@linux.intel.com>
 <Zs4HQR-gcZ_VHMMF@phenom.ffwll.local>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zs4HQR-gcZ_VHMMF@phenom.ffwll.local>
X-ClientProxiedBy: MW4PR04CA0095.namprd04.prod.outlook.com
 (2603:10b6:303:83::10) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ1PR11MB6156:EE_
X-MS-Office365-Filtering-Correlation-Id: 739cc469-7e56-45c7-3417-08dcc79e668a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gZAT9H3XO3JDnqFodNVX6sNQPLI5KiZTILp6qWL4S78O9eGC/026gJWvYkdK?=
 =?us-ascii?Q?2zlxLRGajCniUPuYdTsTfsU00Y2vNKywbN9fZShdvWTIRAwaIO22WPLRjQfB?=
 =?us-ascii?Q?k1+7rX7JCl4nSUtKYIKt5nR2JM3+yRn4U67I0UZKko68g2uXebO3QviKQbFr?=
 =?us-ascii?Q?fSZwAEseouYtWv8M875IwNuh/v9VS53y/OEuT1KkOZ4I4Cwcg/QcIYx9vu5i?=
 =?us-ascii?Q?5RaLoxSqzRdkX+lH+eHvsYiFN3To/3mMVOoWqu2qR2jQx3eWf45NlYl3lTbS?=
 =?us-ascii?Q?qiVN1S3XUKZ6g9ipG9VaqYJn3N5NrZWpXunXjs8VgUItBb8JZpDYZGJ2hBh9?=
 =?us-ascii?Q?ZbbZ+q98lpNd3uYpmQIO2lfPrZ2d8bBJdJLjmI6dL36OwY7XJjfGVc6bcsf+?=
 =?us-ascii?Q?LtFmXWQADngszDcDD6V+01NW+mdNzlEQk9/5Uz3t4Kn0ivvcZXPF817/h2PM?=
 =?us-ascii?Q?EUs3rmZfx2bInETeCQzD7+lP+irptVUD99GsDPwjYOd68vXKvyGU2JDHAZa6?=
 =?us-ascii?Q?C+2pkJwlUDvEbEd2cgk/lEe6wTRtlTpLH8v0ryILhszPgXq8I9KSvUXpLLgi?=
 =?us-ascii?Q?Na+c3cRcM/7JNAl9N35niLZROo27LKH1wPoNFQhtkgeZaXkI/4XDD6i7nSyT?=
 =?us-ascii?Q?Ij3jZlLaBKIdoPqJsz0zM2ebYM8XBs+H+OmjIe7L43wjhDUSpp9Jo45mSNPR?=
 =?us-ascii?Q?zDPGLJvrDumP6LK4Q/RsAmh+fOGoxDBLSAWfR4ubMK9o8WYERxZjQsS10CNB?=
 =?us-ascii?Q?h/19hx3HdXE5njd/F+e9IUkTKXKY+orYNlxks/vUIACrjr6EdiQ7rCXM+9Xz?=
 =?us-ascii?Q?1sGWEsb5E0iPJnpkf5GfKlMz1Gu9cFif4fl7tKD6T3OXaHvXsgN59mVeA9lY?=
 =?us-ascii?Q?61tKowJrVMO3FKov4Tmh+e6hRVbaK89wArXub4kfwCaH08sToWzEgO2KZE5t?=
 =?us-ascii?Q?ZeZ5fX2OUqVnDCFhsSCQoaLGsDGWTc7bJiqCnS3LeXGNSf+44YHvDTAuCQLj?=
 =?us-ascii?Q?GFixp37+Vzs+tAADFb/fBxUj2BGMPiD90MUQf/JZr5BanO0h+TWz3KXIx7bB?=
 =?us-ascii?Q?pCqeXI9lXiQey9tpBj2+vE0O5e78Tk0vgrdWqx82zdRyxtYeMt8OW7UUteld?=
 =?us-ascii?Q?7UVFC0q1gGiMQvrvIwNdbrjA7mRu5QfhMdw8MfVNvhEQyNLwAM6cTkLiaHtP?=
 =?us-ascii?Q?wBWBVXLzGwxsNA7dSCh2lF8zd+EkwBulYaX6hixD3xK/VKx2WBfgroU4c/Oh?=
 =?us-ascii?Q?py3lGhP7D5gZtOrIOpE1vwDzNfBzpWFY7yk3SFfmyXmmWUunUp/ox0OlnhPC?=
 =?us-ascii?Q?5Cs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WTHj/U/+ikIBQxcFc8bTV7Tf0UX0y/8XCRqLPQe2jlb5Z76HnapK/plqfTQT?=
 =?us-ascii?Q?5Any0bchv5qbBwQpn/de+Vs2mBJaUs4AHzEWQS2T8/ydwEWQVzedshxEuBE3?=
 =?us-ascii?Q?pacH/ff2NH5IMOV92B/7ocFFDSu+NvwA0H0Rpb2cLH1FOjWvQqbKMGWm4d1e?=
 =?us-ascii?Q?qDMHxYzLodF8Ii94NF0JCzQ23fqinzJTBfnHwqcNDiIxOXTlD3L4dctYscgM?=
 =?us-ascii?Q?JJVjT/QwiwitAQDpbsk0HgkTHoVPqmqT58DhjB4Nmz6JhBiMkUcIvKMw9P79?=
 =?us-ascii?Q?fgHBZ2NooJDXDS4kCuWyAqGEq5WDiEHWGFHz3qySh8TlkZbcpmV1eqbR99p4?=
 =?us-ascii?Q?7gJbtd6UGfE+NINnkmsr+QB/59AmLjlKJ+9tqoUwJc+nhXNEKRNNfWLko9CJ?=
 =?us-ascii?Q?Z1Fa/SQVybfbYJtyQA32K6fesvOgJcaGQx2zppysUJw0Ulya9ZbyS6d55/sl?=
 =?us-ascii?Q?b0cfGC1wMpMSPOJcl/4SCTfv/X0/Np9gITkc8ZNy2KZRpI/OyFMJ0b0nPzLz?=
 =?us-ascii?Q?ZANj2SZS4yHGPOFbiAbQK5mNQ0OyK0wxDqURfuTz2bSHmlFuvgbd8zVyQEHt?=
 =?us-ascii?Q?/nnqC8UwYc1wGobku971FlU/Gi00jGUk5r4l4YDFkhgH+CATXLEP5vRUFb83?=
 =?us-ascii?Q?mO5c8CGLTeEdHt8dzgLtyLJIw+DFs10aVbVvrWsQcap/2TO/lfQ9JY1V3qIn?=
 =?us-ascii?Q?n6NP9Zfbksgi6vsLtEejatOQZJhh7a96628KWE/cgWdpo2iQIlnxY4TpWIcZ?=
 =?us-ascii?Q?2vHTe8L2SPU6NqOJUQho/gosFotnivz/7DdrgdHcBDd5KgbN87vGh7IKOkTb?=
 =?us-ascii?Q?YX4w3/758Ytog6HwtVxxL17OHuRQ/p5eX/KoLJikTE9RmmeTvc0Gnb8gcw6P?=
 =?us-ascii?Q?bgAr8WpIxX2INp3oLlchYch+HNr40qj58dpgepxjU1EGSsu0ClO/lcAW6HCt?=
 =?us-ascii?Q?s4/mGFX4+HCB7F28sY7nmoSJUqSVx+FJmgKZ5412YAH3RPJ+KtBu6nJ6RWnh?=
 =?us-ascii?Q?kp3m+9NSJtJuk6qbYzdigZCk+m5lTZsZgf1hnz2u0ZyWuBv7LjM3ywZtIGaj?=
 =?us-ascii?Q?1ldKU1OTsE00REdb6zlCWcKKnKfFCiOm20Y/9UGhploSBFxuAPE8/oziWbby?=
 =?us-ascii?Q?gG/sxzDJnQS3hPSQ3nHecpU/p2srt9ijdMosRnwc+s/Lmm9b2x0RpZh/5knR?=
 =?us-ascii?Q?uGtAeY9IqW7c8VkAZnYh+h1kC7LyXBRN9HrSNAHaJnuBrb8V5+lM9MxSj95O?=
 =?us-ascii?Q?MYnnFPXyPhZ9loFnH5+pdxQAon3xY8vMzI/8nbTGJ8oZ7o0+QDm1jqgVgVlE?=
 =?us-ascii?Q?vJp3APBp6f+R2zpLy75JA4SCbrCXOo457TLIWfVTWjWxExQ9gV3BT6cvbWN4?=
 =?us-ascii?Q?rh9+mjjaf87pAN3h0w03H2w/h29sHiAPg3zUtxSjo+eVqim6BJjhSaTTalAU?=
 =?us-ascii?Q?lo+0MDW5D0uc+JyP4aomqus/w3luULmT3oetAqT55vRQuuSV7E5xKsB9guVo?=
 =?us-ascii?Q?uJn/q59WRJzLN6I7n9mwH/ypKye9gdlSH43dDMRcqz0RQQFg+Q+xNIjbapHo?=
 =?us-ascii?Q?j2M3s2wIDyRyMYoQFASuBRAZEQLWhwS8lUESXZg+lx1cU6wQQ8LzMt3AG027?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 739cc469-7e56-45c7-3417-08dcc79e668a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 20:17:12.2903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F8b+0KcbeDQsxnpYiDnt6GnBi0BNeKThoCm39kRr5NhIWz+vcL1Q59Ia0iIQ28Mb1AOuiBr+TAqO07PNfT9baA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6156
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

On Tue, Aug 27, 2024 at 07:05:05PM +0200, Daniel Vetter wrote:
> On Mon, Aug 19, 2024 at 01:31:40PM +0200, Andi Shyti wrote:
> > The i915 driver generates sysfs entries for each engine of the
> > GPU in /sys/class/drm/cardX/engines/.
> > 
> > The process is straightforward: we loop over the UABI engines and
> > for each one, we:
> > 
> >  - Create the object.
> >  - Create basic files.
> >  - If the engine supports timeslicing, create timeslice duration files.
> >  - If the engine supports preemption, create preemption-related files.
> >  - Create default value files.
> > 
> > Currently, if any of these steps fail, the process stops, and no
> > further sysfs files are created.
> > 
> > However, it's not necessary to stop the process on failure.
> > Instead, we can continue creating the remaining sysfs files for
> > the other engines. Even if some files fail to be created, the
> > list of engines can still be retrieved by querying i915.
> > 
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Uh, sysfs is uapi. Either we need it, and it _must_ be there, or it's not
> needed, and we should delete those files probably.
> 
> This is different from debugfs, where failures are consistently ignored
> because that's the conscious design choice Greg made and wants supported.
> Because debugfs is optional.
> 
> So please make sure we correctly fail driver load if these don't register.
> Even better would be if sysfs files are registered atomically as attribute
> blocks, but that's an entire different can of worms. But that would really
> clean up this code and essentially put any failure handling onto core
> driver model and sysfs code.

Indeed very good point. Sorry for having missed this perspective.

> -Sima
> 
> > ---
> > Hi,
> > 
> > It might make sense to create an "inv-<engine_name>" if something
> > goes wrong, so that the user is aware that the engine exists, but
> > the sysfs file is not present.
> > 
> > One further improvement would be to provide more information
> > about thei failure reason the dev_warn() message.
> > 
> > Andi
> > 
> >  drivers/gpu/drm/i915/gt/sysfs_engines.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i915/gt/sysfs_engines.c
> > index 021f51d9b456..aab2759067d2 100644
> > --- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
> > +++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
> > @@ -530,9 +530,8 @@ void intel_engines_add_sysfs(struct drm_i915_private *i915)
> >  err_object:
> >  			kobject_put(kobj);
> >  err_engine:
> > -			dev_err(kdev, "Failed to add sysfs engine '%s'\n",
> > -				engine->name);
> > -			break;
> > +			dev_warn(kdev, "Failed to add sysfs engine '%s'\n",
> > +				 engine->name);
> >  		}
> >  	}
> >  }
> > -- 
> > 2.45.2
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
