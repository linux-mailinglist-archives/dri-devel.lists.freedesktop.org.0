Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9D9966C5E
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 00:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D83110EB06;
	Fri, 30 Aug 2024 22:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FYaNrt2e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABBA10EB06
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 22:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725057005; x=1756593005;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NqpX9QM/BG30GoqiIgOaFK20xZ56aWNy7i6UeR2G0vU=;
 b=FYaNrt2e8e9S/ZYMedk67BoOrBzX2tCjtddAg7xRg2V1uJujD2wRrOsz
 I0pp1rHUcYjcO9gtjT5TCTisz5tCeerMewxsdIq85/3fiLkGaM4U8J/xu
 T3QvorogQT0+jsXhOg2DX5rQ3XLtMQLXXzwpkpXOPocyaZz1hdr86+Xvn
 w2InaKLDvvxgO/DHZeUuZzPObJBmB/YTrd/7X6LgvnEeLsh+hzydqDJZE
 ljGrzlNZ2npcx4JA298sadCz5jygNA2iIttOMdrYJFm43SjKDOfBsBGE5
 jLN1yUWPSQhYiRO4ptAfi3vfkaq1gRQQ2E+8STjtcCdSFeDVcNBbxBdjR w==;
X-CSE-ConnectionGUID: rX6AepulRwqxxFeGYe2PXg==
X-CSE-MsgGUID: EwV1V1h+SoGtDzWIu3Fv0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="35124494"
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; d="scan'208";a="35124494"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 15:30:04 -0700
X-CSE-ConnectionGUID: lMLx/qc7SBSPXNv40hF0gg==
X-CSE-MsgGUID: DNixGp0gQFSPRnnRPhnsDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; d="scan'208";a="101517581"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Aug 2024 15:29:57 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 15:29:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 30 Aug 2024 15:29:53 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 30 Aug 2024 15:29:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NnhVhYIdl+4SLp8jxBEwAgugIbCd424at7isxnL8iihqmft91lY6w6qavznHUzrdgrM4YRzJIn+yOWekSxTEKfRst/RkCVgTwz9AVmmdfaV6l2N2kTRJ1tZc4IFQu3LY51AHLvjVNytEh5BLkrbovR/ju5DpJYBhffU5/Z8++dFF9fmrUEYyJXWQUC8dp4zj7qH8/iiZv0rBRiU2tpjH3athoVFzLAIiTgmmxbdG/bTZGftisASJG1PLFvbk6jstuLcIqS6ytYWcjgF3gtIFSo2A44xFt/LJ6A3PC3CYFibNwIK1tKSGoRXzIamjaaLEj3m8gTV37SMdUmg9pcJFNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rw9Dn86BK/YfSJ92hqHZcqa4vABdaUzwfkYTsGqTWL8=;
 b=FbkGW0WWyTklllku4ku4LfdyiymHI+exdPWJOPXysW2ovElFNwgpWMsruJLGz73eV0Pk2M2ipb2gY3hOhyQn4pO3WWq+xhj3SfXQ1ExTPksDRoXU4R44Xu4UQC/Dn8l5YasyWei/vo2tsen7OY1NI6nhSXCSHKkUx7nHPti8n02OsTdddld+X6E4E2wOAzkcnlcVI2FMwx5hKTarLOVYRS8s+ug3hse3yR+TzzHKRgNclFjzP20GxnSVK1Ys4ledHSdlQYjj3J4zMRTjXt2grrGkmOK2OQVwq4Vgc38JQcNQQ/hXqwUovLRIC2W0BVPPbV+7ndlbhyVEovwU1vH5aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7436.namprd11.prod.outlook.com (2603:10b6:806:307::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 22:29:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Fri, 30 Aug 2024
 22:29:51 +0000
Date: Fri, 30 Aug 2024 22:28:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
CC: <dri-devel@lists.freedesktop.org>, <kernel@collabora.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@redhat.com>
Subject: Re: [RFC PATCH] drm/sched: Make sure drm_sched_fence_ops don't vanish
Message-ID: <ZtJHg8JOPi7CVme+@DUT025-TGLU.fm.intel.com>
References: <20240830104057.1479321-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240830104057.1479321-1-boris.brezillon@collabora.com>
X-ClientProxiedBy: SJ0PR03CA0388.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: fce3da1d-7db6-4653-7921-08dcc9434365
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?lINm1CV3l+6x4IKm3cnHZ4T3sCeh2Ozxdb0jAJH0ztePpsaVu7FCPIv3pu?=
 =?iso-8859-1?Q?gxn/otoPGtVCKnaiBF597v0CgfOPB+eZbZVNOrXVNgoor0Y24Sj7IOJ3VU?=
 =?iso-8859-1?Q?Afj8I1ExIliH99D653P5z+NqiaFIgzL4uPZai+kbpLDy+BbHF31GPL9ZDO?=
 =?iso-8859-1?Q?UC4NFcV1gY2RWqDp9DJe9Yujmnf1wiTWCo666OFIyfkQgAHfZTjX5rQEDu?=
 =?iso-8859-1?Q?ACAagzpnQq3FBukH22S63isZ2WsoBl1T9DFZsO4rgOjMKYTf3aEg2lbFJ/?=
 =?iso-8859-1?Q?ZAtPzHqMq9FFbltoSG75OVBqk8L5IcKAOHShAs6+deFuYTrO18IdIxhc6s?=
 =?iso-8859-1?Q?WkZ2Cprvft7BhoIklSrpt+9mgdMl7W7fjys2Z/8ZPkBc6ugxwhaKTMbEId?=
 =?iso-8859-1?Q?LPrXLDirZNplJmHJ8Kob/caoUHpNtdwZgSkpSx7X+He0M1TSKpuLa3mFKl?=
 =?iso-8859-1?Q?Qxbll/G+Bg1DCMGCsg4lMYYwIyx/sSkqweSky6uhRWLv2dZn9dRkjcvmrr?=
 =?iso-8859-1?Q?XAo6BBTeyezIRqF+YrMoD0/1xh7HtKa2URA0XpSYVQ9F2S0xzGGSnLVXL1?=
 =?iso-8859-1?Q?VqOB1iS2d6iWJYD9m9GjZMlhCznVXZLtJT6Auq5Y/2iiOhFyki2RJZV9uG?=
 =?iso-8859-1?Q?9DigdFG9pT++6aLrSxgemsogJ+QHdQS9h8K9QmGoCdZKnzNCtKB4fivZcU?=
 =?iso-8859-1?Q?6mBu401i9o34TCu6DyWEaYPhjLXZSGOhWDo8uMR3VNllN0pcV5OAYZnZ3o?=
 =?iso-8859-1?Q?rpp9D++/y/jaVMXQaiIYTRgJ286cKYjQI+iwv61TmgnGgiEjuUCy3kSm8j?=
 =?iso-8859-1?Q?9v/yUUUN/JiaAYTF41KzCkZYwQSGgJimnSCEgzRQ+c8hwIvJsyEcOM0phK?=
 =?iso-8859-1?Q?4nTzzRzePLX9E78lpvcEdSrUfTEYKWOMFI7CNmi8gDxgBMSo2FViJ4GTIQ?=
 =?iso-8859-1?Q?Vq07nzdcF51zAAOgIFX/nSvSl8ZqE/M5IR0++3VXCtrHrsHDgriV5LUbCg?=
 =?iso-8859-1?Q?tO6R9cEMGro4Jk00/BF8B32BKxqoNqg+eH0lTVRbIVfap7+y8tlM/dxeZP?=
 =?iso-8859-1?Q?v3h0eHm93uxB0X84Wo6r+RprBrGVNdjIrc/OYomff06f3udtC7kmkSIWAR?=
 =?iso-8859-1?Q?NxNRqJiwPmD/xohI98nA4OaduV+653jGGSyVx3gV6uFTCjatCfNjYDJKc0?=
 =?iso-8859-1?Q?AIhEcABx+a68khfY47E7jI893zyHQm6uZiMYYlev2sB056dDKKallrHvf+?=
 =?iso-8859-1?Q?X1InkEd5a3A01mIpJzAA3G5w3TvEIwNtsD9zefSqEMZeaJ06oaL1B351VV?=
 =?iso-8859-1?Q?XDZk9V/XndMQHQMkgasDiQCuN/NSoX1bi4ISB8C3NlQGMqreBcccSyFgg5?=
 =?iso-8859-1?Q?NxdXOrNh6MPhTn/oFPwEyJYyMPCwenyQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?093X0+ahHax11RxIQccH9JRI4lLXWC8D3kPgj2HyuhVhbxZbCFH3HkUhqz?=
 =?iso-8859-1?Q?Ne5wB21NwVPq0uvQ+yk3R6lQdalJPHKHZBJE3eiS15XPR2u4uWlM8Kvsm0?=
 =?iso-8859-1?Q?lu4crHHeus+3re1MeRd1whpjBgIEZizpGuBjr5nY8ZKdsF6gKT7V3UPhRm?=
 =?iso-8859-1?Q?g0p3jYFVtIMfw//8tJHjjmJ95/nz9gy5n0fxt5yTpe39SadsB6n1KeAsqC?=
 =?iso-8859-1?Q?fCksg331bIgfU71q80y7zb9o61x5In5/EQ+RQYjd3uMED+pdZlw+KpOFq/?=
 =?iso-8859-1?Q?qy3dQS2islokWbbYiFV46Plcl3mb2P6kDz3HJGOIqA9sPQuEqp/nrKkI4M?=
 =?iso-8859-1?Q?yFzyVpWWWqLeg+1Z1dLRY/GnylHBxtsw9N3+tFcdWdQQ8c2/92j3s9rrW5?=
 =?iso-8859-1?Q?r5FmpJbX9qu/W93ZxyLkUfmyQSG5QgIWLCC49BIFqqzCN7Bxh8Q2Wvsg2K?=
 =?iso-8859-1?Q?xD0GMiPX6Pzg7mxOv+fpHeZgyjrYCDWIKoVvq2xci+LbnuvveH37EuIDtm?=
 =?iso-8859-1?Q?bcBx4hdAGnllR4AaqAAyKeAN2M5LbGjky3+G/0hMx48ne7a5xrGcQtszm9?=
 =?iso-8859-1?Q?5ZyHa8nLUTm8EEmleSNVQLr3Ix5GTCx4fOyBWwYvHuQrFA8vPw7MyvpaqR?=
 =?iso-8859-1?Q?xJOZEM1H0px2KE2uVFFI6cRmLUz0VCux0lEIonDd0JsdbISk24fFutwx39?=
 =?iso-8859-1?Q?4a5T4WcUWCultfLdSBP4MNHRkrfi8uRsVObz6Km1/lSVoxOz5jb7fTBsg6?=
 =?iso-8859-1?Q?2IOy0Mz2BC3dNFNvjHqdrsKImuisJbN+fGDCNkZ/Ms2kfmQxxl+IrcD6aa?=
 =?iso-8859-1?Q?iFRrHA0VVFKiMOfDSc+abD1Ixik0Ezdtt5xKV57GMWaieoZnYujo/odS88?=
 =?iso-8859-1?Q?raSsfxuaghw7aectIoW1bz2oK3rYYqo2rEZPpFzdmMrJi9vy++P+LSjBMP?=
 =?iso-8859-1?Q?U8HBwp/yXxWGuXcsud01yzDtxGfj1dKTjnwibHOuyfGGw5vJzgfwGzjNA6?=
 =?iso-8859-1?Q?jLT/ZCF+HrjPWBu3XKxi+XWGZ0Gy7QGb+EY9+fWPuLWOdYWNEiUPZj4uaL?=
 =?iso-8859-1?Q?IyUcGTiTqyyWmjw1j2zCY8nNwVOS29V5LhuNTwvw15FXjwho3U14QJwsEf?=
 =?iso-8859-1?Q?7t1H7QMDfeYTWGmU6cShDfstXeJeegklg1UNBprjEbO6+EgbfkjmLT0RdE?=
 =?iso-8859-1?Q?aoPnWulZu8plTOsm7H7s80pLyatLHqiuBO98TG9yTktYPGdTJzWhtcXsk4?=
 =?iso-8859-1?Q?T2wWieZ9qWkUzJSZk9ky23yfRFe3dpIy9REwaC+eaARdMNFXz+mq+rlZ1N?=
 =?iso-8859-1?Q?3nnYIfvHOFnnSbccnvVQf9RpJOLw95wa/FP+A1XQUL+nqTpl6hislCBoYU?=
 =?iso-8859-1?Q?4lbaJsH5xKZaI7In6mBFgxggxIziQsd1b0x0SaPV7cdA86t5XWIjJDDN/J?=
 =?iso-8859-1?Q?JWX86v56/KBu6lKFiHQ7xGaXhQhnEK4tN7SgQQAbgwzw94VvoGwpYNfpk7?=
 =?iso-8859-1?Q?TZgsLGlJNkrolSL9pUyAg22H3+fbuZrM2ycXQQPraaAgH6NGsGs5johjHa?=
 =?iso-8859-1?Q?//hi66BRp1pPtVWtp4T6wC0nV5NRF43XBZOgw/yAH5yGnit59qK/YzYGv4?=
 =?iso-8859-1?Q?P8ekP8UTwglsnIXLla4/sF17oP1bQ0t8rym1KEP+caM3cBiLKGvInTsg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fce3da1d-7db6-4653-7921-08dcc9434365
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 22:29:51.1443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gn1TofrbyzJhSnwkOatOuT/AFnZHR8UhsnEhQswPJ6Os5NB3HvDQSt95/5Pn6lRqykGQ8eWSorDASrnLaUmEiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7436
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

On Fri, Aug 30, 2024 at 12:40:57PM +0200, Boris Brezillon wrote:
> dma_fence objects created by drm_sched might hit other subsystems, which
> means the fence object might potentially outlive the drm_sched module
> lifetime, and at this point the dma_fence::ops points to a memory region
> that no longer exists.
> 
> In order to fix that, let's make sure the drm_sched_fence code is always
> statically linked, just like dma-fence{-chain}.c does.
> 
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Just like for the other UAF fix, this is an RFC, as I'm not sure that's
> how we want it fixed. The other option we have is to retain a module ref
> for each initialized fence and release it when the fence is freed.

So this is different than your other patch. From Xe PoV the other patch
is referencing an object which is tied to an IOCTL rather than a module
whereas this referencing a module. If a module can disappear when fence
tied to the module, well that is a bit scary and Xe might have some
issues there - I'd have audit our of exporting internally created
fences.

Based on Christian's feedback we really shouldn't be allowing this but
also don't really love the idea of a fence holding a module ref either.

Seems like we need a well defined + documented rule - exported fences
need to be completely decoupled from the module upon signaling or
exported fences must retain a module ref. I'd probably lean towards the
former. One reason to support the former is fences can be released in
IRQ contexts and dropping a module ref in IRQ context seems a bit
problematic. Also because some oher part of kernel holds on to fence ref
lazily block a module unload just seems wrong.

Sorry if above we have well defined rule and I'm just not aware.

Matt 

> ---
>  drivers/gpu/drm/Makefile                |  2 +-
>  drivers/gpu/drm/scheduler/Makefile      |  7 ++++++-
>  drivers/gpu/drm/scheduler/sched_fence.c | 21 +++++++++------------
>  drivers/gpu/drm/scheduler/sched_main.c  |  3 +++
>  4 files changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 68cc9258ffc4..b97127da58b7 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -158,7 +158,7 @@ obj-$(CONFIG_DRM_MIPI_DSI) += drm_mipi_dsi.o
>  obj-y			+= arm/
>  obj-y			+= display/
>  obj-$(CONFIG_DRM_TTM)	+= ttm/
> -obj-$(CONFIG_DRM_SCHED)	+= scheduler/
> +obj-y			+= scheduler/
>  obj-$(CONFIG_DRM_RADEON)+= radeon/
>  obj-$(CONFIG_DRM_AMDGPU)+= amd/amdgpu/
>  obj-$(CONFIG_DRM_AMDGPU)+= amd/amdxcp/
> diff --git a/drivers/gpu/drm/scheduler/Makefile b/drivers/gpu/drm/scheduler/Makefile
> index 53863621829f..bc18d26f27a1 100644
> --- a/drivers/gpu/drm/scheduler/Makefile
> +++ b/drivers/gpu/drm/scheduler/Makefile
> @@ -20,6 +20,11 @@
>  # OTHER DEALINGS IN THE SOFTWARE.
>  #
>  #
> -gpu-sched-y := sched_main.o sched_fence.o sched_entity.o
> +
> +# sched_fence.c contains dma_fence_ops that can't go away, so make sure it's
> +# statically linked when CONFIG_DRM_SCHED=m
> +obj-y += $(if $(CONFIG_DRM_SCHED),sched_fence.o,)
> +
> +gpu-sched-y := sched_main.o sched_entity.o
>  
>  obj-$(CONFIG_DRM_SCHED) += gpu-sched.o
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index efa2a71d98eb..ac65589476dd 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -39,12 +39,7 @@ static int __init drm_sched_fence_slab_init(void)
>  
>  	return 0;
>  }
> -
> -static void __exit drm_sched_fence_slab_fini(void)
> -{
> -	rcu_barrier();
> -	kmem_cache_destroy(sched_fence_slab);
> -}
> +subsys_initcall(drm_sched_fence_slab_init);
>  
>  static void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
>  				       struct dma_fence *fence)
> @@ -74,6 +69,7 @@ void drm_sched_fence_scheduled(struct drm_sched_fence *fence,
>  
>  	dma_fence_signal(&fence->scheduled);
>  }
> +EXPORT_SYMBOL(drm_sched_fence_scheduled);
>  
>  void drm_sched_fence_finished(struct drm_sched_fence *fence, int result)
>  {
> @@ -81,6 +77,7 @@ void drm_sched_fence_finished(struct drm_sched_fence *fence, int result)
>  		dma_fence_set_error(&fence->finished, result);
>  	dma_fence_signal(&fence->finished);
>  }
> +EXPORT_SYMBOL(drm_sched_fence_finished);
>  
>  static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
>  {
> @@ -118,6 +115,7 @@ void drm_sched_fence_free(struct drm_sched_fence *fence)
>  	if (!WARN_ON_ONCE(fence->timeline))
>  		kmem_cache_free(sched_fence_slab, fence);
>  }
> +EXPORT_SYMBOL(drm_sched_fence_free);
>  
>  /**
>   * drm_sched_fence_release_scheduled - callback that fence can be freed
> @@ -210,6 +208,9 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>  {
>  	struct drm_sched_fence *fence = NULL;
>  
> +	if (unlikely(!sched_fence_slab))
> +		return NULL;
> +
>  	fence = kmem_cache_zalloc(sched_fence_slab, GFP_KERNEL);
>  	if (fence == NULL)
>  		return NULL;
> @@ -219,6 +220,7 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>  
>  	return fence;
>  }
> +EXPORT_SYMBOL(drm_sched_fence_alloc);
>  
>  void drm_sched_fence_init(struct drm_sched_fence *fence,
>  			  struct drm_sched_entity *entity)
> @@ -234,9 +236,4 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>  	dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
>  		       &fence->lock, entity->fence_context + 1, seq);
>  }
> -
> -module_init(drm_sched_fence_slab_init);
> -module_exit(drm_sched_fence_slab_fini);
> -
> -MODULE_DESCRIPTION("DRM GPU scheduler");
> -MODULE_LICENSE("GPL and additional rights");
> +EXPORT_SYMBOL(drm_sched_fence_init);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 1e31a9c8ce15..eaaf086eab30 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1467,3 +1467,6 @@ void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
>  	queue_work(sched->submit_wq, &sched->work_free_job);
>  }
>  EXPORT_SYMBOL(drm_sched_wqueue_start);
> +
> +MODULE_DESCRIPTION("DRM GPU scheduler");
> +MODULE_LICENSE("GPL and additional rights");
> -- 
> 2.46.0
> 
