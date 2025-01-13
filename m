Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B82A0BD4E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 17:27:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3234810E709;
	Mon, 13 Jan 2025 16:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gZ+nKqn2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC0210E709;
 Mon, 13 Jan 2025 16:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736785645; x=1768321645;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KLBduyGF7TbhGBoLV7aeLMU+VPL51GX1jJK8MpGZwKs=;
 b=gZ+nKqn2ojJgLWr3P2v1w1thyvJtv3qAgdYBv88OI7Idd6JVMTj6NIHP
 /s27otrrG2spuQe4CCxadBPF/zUXc0r1XrfiLPDT7kqv2zHgDO5peCKKF
 jKDX0fOMRtCaQUeTbMVnAg4/F5rKT0yUHHpWD7IDBqRYfAkXEMJH4sPV9
 GoZGfzo4785ClJYSVUEL7MtoefMAxkPciXmoCgoMjI1QD+weknlhxncZP
 aqdJ65UkzSrq6MGBOUPLGRMfx6b+/tLx6SIACax2RGnQ756fOAR0/TJNK
 vHIJ+I6vnWdM+EiDZLXsgxA0c2kzMVDZvPalh0Rz+H9t8TxAmCGd6mzcE Q==;
X-CSE-ConnectionGUID: SeVdOHc9TQ2eRxWt+1wn8A==
X-CSE-MsgGUID: FgB9OvmjTNWT9mPTaKfWgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="54601446"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="54601446"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 08:27:24 -0800
X-CSE-ConnectionGUID: qD/Hn/c1QtS5747eESlm8g==
X-CSE-MsgGUID: RdgHriUiRkKvk52WTBrysg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="104708505"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 08:27:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 08:27:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 08:27:23 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 08:27:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nG8BxsNax3Lj7tu9jBr9tUSk5zRNnLu3+qEfSag4pRukLTsjh182glw5xwK6LFeuSdUntUktHXWHCyAJygqLSssfwJms0kOm61rTsOdyBUAS/iAs4TpWBWGRywFhLRwjUv/ZOb4uEW23tyLVgXxeJ6BaBcyQYXmE24hMSzdqhlzXiE7zuiOTVYhDuC/Z7s7ouOl4cm4LXwKi/vRaukoba2kX4/WMvO9Kz6omH1mkZICspx3Dz4MJEUGMl+An6vsKqXG0RNw5DZzqUWRofcPGGcNPfJw87gPwpf7vSvVqE7p5s1ETuX6Md5Wm9I9gI0XMbphPTOkym8R4GHXteOrw+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhVlQAytERZqdjl6PkeoNtA5Dqv3G58DPn856EtsPHo=;
 b=kXHdb5t+tOKIU+vy/SsGC6a18TqxeJxUcwe67AhsgNVWoPN2MUMmHHgNxGH2AVNAuhTsmDQQgNBEInAWVby6zl+Ge7eq5WwaE706bJpWCoJLTEbTPWjo7KNT2YyMj2mY5/sK8FbbDNkgJ4DZzf52EnHTq8TQTyq9eIhbTe2/uQceqsqKg97BrPzogB+WjdV/ufvzG2pUAjOY4enSHjPkHjM7MbU8FBDBQXy/xGpVnyCRsGcMHLqFv9aFDmlMwINgsemDcboYbEqz2dqtRFsomzuqJNO18ntBYObUmaEza6ROS4ilVQWz+WFJ2Ob8CQyVJxIG/ZfESPDBYzGRQjnk+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by CH2PR11MB8780.namprd11.prod.outlook.com (2603:10b6:610:284::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 16:26:39 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8335.011; Mon, 13 Jan 2025
 16:26:39 +0000
Date: Mon, 13 Jan 2025 11:26:34 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw.linux@gmail.com>
CC: "Dr. David Alan Gilbert" <linux@treblig.org>, <zhi.wang.linux@gmail.com>, 
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tursulin@ursulin.net>, <intel-gvt-dev@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] drm/i915/gvt: Deadcoding
Message-ID: <Z4U-umHuZ6-jfHyo@intel.com>
References: <20241222002043.173080-1-linux@treblig.org>
 <Z2dcZfW8eNMnxT0v@gallifrey> <Z3uGjO36tfhQsnfp@dell-wzy>
 <Z4A7QDtTrU6w2Yhv@intel.com> <Z4H9sSEnhLBbZSx7@dell-wzy>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z4H9sSEnhLBbZSx7@dell-wzy>
X-ClientProxiedBy: MW4PR04CA0362.namprd04.prod.outlook.com
 (2603:10b6:303:81::7) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|CH2PR11MB8780:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e2e3d0a-7d78-476e-a714-08dd33ef0e7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qsH2wXg0Fr7bYAc5C/9dnUW1tejVJebCyajOP2KenODt5xQ250+ljstyZyN+?=
 =?us-ascii?Q?PWkXpZHUGhteeDqXeDGPxhTpk8TkIan3Rk4AU0jBPvMeFW44kw3v2f6YQlt1?=
 =?us-ascii?Q?jNWNPfRkVd4d8jC+cIz7wyzKFnffLUEQStOc9sbzJ+Ycj6oFSpJ4/arM7PHt?=
 =?us-ascii?Q?g+U2jneQl/cTxD/SUu2VjnYr0pdCbKgqeOS/yRrunT2F4kx51isy7dff9Kt7?=
 =?us-ascii?Q?HiX/n0mruUsDDRvInNHzvuzsF9FKJWGq+yPG1j2ZvA11rQ6fstGoqiWDw17o?=
 =?us-ascii?Q?ymnvINxA4iV+Zlj4hd1C9KgCOzBtUJUkdFsx7JKBP2CGQP4WL3pXgozfx4VG?=
 =?us-ascii?Q?YhUBfxNzZwvDJ9CUCNR6utcHy8d+6F9fshDK15OjQKKjx/wu7IIVOTSmn+ws?=
 =?us-ascii?Q?Xvp6/1Oi4cMmSfQXY49Q9nIq+Lp0BepZob79rSMz4FD6pK5i6nwh6IoT3KdO?=
 =?us-ascii?Q?4aHxg9X2xkm3roeatkVT0ktROkCwKK8+P/FG9HD8InsGZVSchynKuA9T+vCY?=
 =?us-ascii?Q?RmRpIsP49qyosUthLAjCsCWJjywU69vadxo5DjEL3lqTWRrQFNv09aqLth7V?=
 =?us-ascii?Q?EYi/DS/J5FaQyJ0jYWUwnSv75lme3Kkm8n1D/0umUuRUecAs61yskgggmRXa?=
 =?us-ascii?Q?5CbDYmd6ZElYyD886FKhHaMPtl63pLnIPmotYLmlnj1YUPUrgnlAdj73MPll?=
 =?us-ascii?Q?fLb4Wd+PBVs0QYkFpdQIMv1QsFdWUyA7kKE8ERrfEVClpuKhBjzvzIxC0C+6?=
 =?us-ascii?Q?OTYVYtlux+iug5ngph1Z/NvwjQlvzJz+jKJT9fOx86ED+2m2eMMNQgNi/KHw?=
 =?us-ascii?Q?SONLOT99/sC5JmhkRLH25hX9/kzIy9SSkpVAs+djAtWv53yTMxOpDzpnmqsg?=
 =?us-ascii?Q?JKe4WCfmcH5+lT+hG6Zg+UKo7wGAqA1cFFKuILx4g6EXjZtQ8AFKGV24Sybl?=
 =?us-ascii?Q?r5IblWKpWhctupUTprSI4DVRRyrtia1WzULokfs6PgQHLSE7mVWDx4Zb6KT7?=
 =?us-ascii?Q?+uqWwmMbGyDv/LRcQ+ZGN+VR5GbLbLm3hL12QvwkPge2ce9lj0PxTURpD3bp?=
 =?us-ascii?Q?K8B3bXAAGs5KBs8SZhhOd3eErDYu/oXon+vGJ1eVrfnv8i0s3vZlgOsEzvPT?=
 =?us-ascii?Q?zCpmjUXtEmqMXDN8cePaT2DlePYTiqVP7gIdaEBYPfOF5qD8SiDyAmk1mrgr?=
 =?us-ascii?Q?xOG8Ly4eo9G9dyUwKAM6Hx7SFfI6pMD4QZfatBfrJk3JGgJh+DRKYyWWXQhE?=
 =?us-ascii?Q?zFpM57Nyq/SPmrkAf4rv6m6axmcGMClxTwuKqjrrVKhc3e73b2EHW9JXakE5?=
 =?us-ascii?Q?NqtO8BvVl0WJYmRfyCu0r9pAnvGvMatN2aOq+XHsGt3PPA7yeMc6XPeRJKYY?=
 =?us-ascii?Q?kEAqLFsI5hDafmEKVLUIM3pzE+hu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KxXr4oIt/xUPcD8Jc3K5UuIS9N7Zy7qWsngW5ngpn/NOqoOrUA6CvYquetyZ?=
 =?us-ascii?Q?hAHhvp4Xwq0hfqC9i6HaCpEzIzzQTj8oJhSGygJ5GA+PKbSPm04s9Ldd1TRt?=
 =?us-ascii?Q?n4NC1F+UvzdERqDQXXhxpj4Xy/Im54rjnC80FPZStVHIdGHdMHatFM3FDlEF?=
 =?us-ascii?Q?FM1JKsw/VAlE37r16Ah8u5G5z83cpGKDWN9y2NZlqjKRVEl1RwPSJsSWPzzK?=
 =?us-ascii?Q?18pum1a9A0JC5y4lhxsJrJN2FADi3ONXOQYn/D2JeOPW6pLo+Grh/diIuLL/?=
 =?us-ascii?Q?tX7jZqbyzWlPlGsIp42VbQlx2ICg6Ri7WCk6Bp8kVwajJnh9mChTbsW/1/tJ?=
 =?us-ascii?Q?t8bR98N7IKXa29cJcvcn0tMVO3mLkwyMZFZi6Zv8XIZRBrBnIl6O8A+JmZ5X?=
 =?us-ascii?Q?W4XOTpkUgXi8hgBG6dFV5Mz/RUHJRg+P6hDMfKffJNL3C+hEev0KmF3VE2r1?=
 =?us-ascii?Q?nmQ0YzfD4dGX2g23YcaO2g3tpEiOTa6HoNBuuejL1G87RGVGMM7kcYVyDpQ+?=
 =?us-ascii?Q?RS2ulefJWKFRU4gySvevvqMiY1iUkAVzH4mecVxhfFJGdYS3d+WJRZYBNQ48?=
 =?us-ascii?Q?Be9qjjcqk8/nt/eyeX6oR7mtdrw4cwvATVtZaHWPzlEMAPnmARfcJSmUeYFk?=
 =?us-ascii?Q?ewWsqNVjMGfvL3lEHQWcoCOA+GyfyZVn70z9o56HKwyuxUUlLGxR/pQQ/Ss1?=
 =?us-ascii?Q?IQB8H12e+JQFJJZ80S5ZY8FYkRcV72x0GaJYgN6Llp+R86n3uE58ZvjlOorE?=
 =?us-ascii?Q?/KdVxahrV06/bHM4JoOco3sgMRF5PsFpF/aY17/XA8G+ql1wds9rvm+kYKfo?=
 =?us-ascii?Q?7XTTgMFNdKOLKHQtZAHJ/jpWI154fM6bLXzh0u8sb9NXJDkWYFrXCAwjnOPN?=
 =?us-ascii?Q?ePZJTV044DMwwbQUORQCkFpe/cqJGiVo+ao/bXuSPZjNDEhgR1fvF4p+sppa?=
 =?us-ascii?Q?pNxy1FJvDaVvbGPqMf57CwlOwONDuyYnSctqEtI60rae9hJ9OUEWd3ilsTe8?=
 =?us-ascii?Q?5OC0gqgifzXuyVEnk4lkBNNUHCXHejjf7KRprcF9x1FUlYQUBR/wozw5i1++?=
 =?us-ascii?Q?q2AZ4clk3tUqj7ashQjyl+89EsxrLvuEi5EoRgbaHbpCAgkU140/n3n3Lt32?=
 =?us-ascii?Q?ren/w2XVpc6o7jYX1v1ytkqlgLFdSVA3w3/+A3ln8PxYiYZfq3FIDtlBnCWl?=
 =?us-ascii?Q?GevkOZg3Sg5+smeO7bC2kUi0ZTsrWHVVU+mfDU8HHDX12O7uTw0aRS+FHx5x?=
 =?us-ascii?Q?5reJhgPRlAH9Tef4zMkrOma4ngZ0n66eKCTOj30C2JuYQA+oJ2Q1GTU7lZhA?=
 =?us-ascii?Q?UC3Fqa61GgOTHvf3EVuR3HzaXS/BgQbJCkGUpsvGhUNF/NkoEZGQjisvUlRH?=
 =?us-ascii?Q?G6+Nsx9OF4gm3Q/Lyw8mitW3WtgHNnCCM2W3NzpD//M1q97WeuI/HLwSRdJa?=
 =?us-ascii?Q?CRdmOs6lh09IHwqnhFaAvAoe3W6+FBAlY0xU4NoJIsQvivvJLEeok/hX7GzP?=
 =?us-ascii?Q?HC795OVSlymR2okLKUh4z9Rfs4QIaL/nD0QGEtVlRPDS6bB9KRxMK9ZanrKU?=
 =?us-ascii?Q?7k26qzNKuSk31yvwAU+NzC1hLfsqHdk5zbp0R2GAJh7dryr6WXgyJUufbrQL?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2e3d0a-7d78-476e-a714-08dd33ef0e7e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 16:26:39.1785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tzLKxN40bUVtrtcL7sPiz970IgCh+ta/LRXLSYU6MjAUS5H0TVgGxBvrQz5JEjQMLoJNoEt1K3mTZGI7EwrkyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8780
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

On Sat, Jan 11, 2025 at 02:12:17PM +0900, Zhenyu Wang wrote:
> On Thu, Jan 09, 2025 at 04:10:24PM -0500, Rodrigo Vivi wrote:
> > On Mon, Jan 06, 2025 at 04:30:20PM +0900, Zhenyu Wang wrote:
> > > On Sun, Dec 22, 2024 at 12:25:09AM +0000, Dr. David Alan Gilbert wrote:
> > > > Note: zhenyuw@linux.intel.com's address bounces:
> > > > 
> > > 
> > > yeah, I've left Intel so can't use that box any more, looks Rodrigo hasn't
> > > queue up my address change patch yet. Rodrigo?
> > 
> > pushed to drm-intel-next now, although I was assuming this to come
> > on a gvt pull request...
> > 
> > what about this patch here? coming in a PR or should I take this
> > directly at drm-intel-next as well?
> > 
> 
> Please just include this directly. I don't really have plan to send extra PR
> for gvt changes but only help to review.

pushed to drm-intel-next. Thanks

> 
> Thanks!
