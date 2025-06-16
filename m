Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA5DADBB4D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 22:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0E610E441;
	Mon, 16 Jun 2025 20:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N1TAeluh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB4710E43E;
 Mon, 16 Jun 2025 20:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750106435; x=1781642435;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z95e7EQixaPKIyK9NxrZ52fnQvt0dXvEsw4wyMpnDnk=;
 b=N1TAeluhismYDnR8Pa6tlDn8WwWnu0WZtrsF2SLzBXInPk7SlLz+RNDB
 DoHYr3WpIYT49Xmc/dJPcya8mCk/+7M9wDIbFKCGEKZHmg/thf+Srzfzs
 +QA55ycDMfABerc3tounhAPIXvcdJ1l26KfFxc/RYob85chC5ioeT3YWx
 dYQpuJkHRJFkxGePUjGVucIoiouT/bglJ3Q0nA6egchj2WJPKmpMfx/Ca
 /s3GRrrtAj1kHj+Hhr9JpXy7wupnS4gtqENWI5OdiDqeZxUqRdcHupqYX
 Pf1JHScdILij11qT4HxWuXs3xFzG8KVuMxcVDrpgqF5UqrM6ABX5jFAsr A==;
X-CSE-ConnectionGUID: p6nCKkLwSZuCeq9kujn4nA==
X-CSE-MsgGUID: OQqGLn+aQ9eKn2eJIKZ3KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="55940492"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="55940492"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 13:40:22 -0700
X-CSE-ConnectionGUID: oOrnFQa4S5m4n4nNFY3Pyg==
X-CSE-MsgGUID: Bkl1b7PqRwCp354FecEWvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="148406319"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 13:40:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 13:40:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 13:40:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.69)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 13:40:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bL+BQeaXhTqMzDJstoVLqn/M5lwfO5FX296o0iO6ZHbpPwByCDrrqWWjd+myuK2oC1KV8qwrvWbh5rF03LRZpXqbTvAFe8ECyFhXs+N6GivP60x32LEe83C8fIpNsyikIVhrOfRSr/8ALKsLJHJeUggjeQl5QRcWSQ37uNsJ8tjv1XqWuERkUSQJiP6/84g8nW9FsEtwZd5xVt8IGYTQMWdKpR4sSdwbWM7y0uPtSta0wx6YdcAvnAMcMlPNKo/ifaX5ETkDuHUkaUpjm6jP1mdljdjaHlZPIpY7ZpgHg4MhjhjFMr+ig1rGpVdKS4H0euHTpAywL1zRHIPqDbLKDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPneJWYNwFzkKV7iLp1j9hWJHR8gWDBRJxarHOalzZ0=;
 b=kv9vex0huqMHceyR/K3BhoNw/ncgklBd4e4+FLbciQvZ82LbuX0YzEHl890kQz1rnbd8osp9eWh2IMPgLQAQWIfFdQjkIEwJ/eedKpVu54FxmdpEscsKoX9GRMKBnE3/Yklo5+ZWeLFv40X0z5IbVo0U/gSyK88OFirTd+YZdCzilER6ZuF82cnSrk4HwWHJTWZonqqaRNva/JAU9345zJyVuvO0DftK7FrSy9XigrmX7tGnD5YNlH9Tq6t1+iFiqAVRGwtu8PV+5YCkNRoerbPewX4yBgq0kcRh/y7IyMbJbQacBtUCBaqlPXbK9RG4a0vxuf9s0ixggg5hnKWi1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB6882.namprd11.prod.outlook.com (2603:10b6:510:201::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 20:39:57 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 20:39:57 +0000
Date: Mon, 16 Jun 2025 16:39:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>, <frank.scarbrough@intel.com>,
 <andrealmeid@igalia.com>, <christian.koenig@amd.com>
Subject: Re: [PATCH 1/4] drm: Add a firmware flash method to device wedged
 uevent
Message-ID: <aFCBGOcQoSJUHFgc@intel.com>
References: <20250603081409.1509709-1-riana.tauro@intel.com>
 <20250603081409.1509709-2-riana.tauro@intel.com>
 <aEAjaGK9BYK89U3Z@black.fi.intel.com>
 <062a11d5-ada1-47e7-ad33-46c4b48da439@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <062a11d5-ada1-47e7-ad33-46c4b48da439@intel.com>
X-ClientProxiedBy: SJ0PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::35) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: 12aa3472-e8c2-4b06-3b08-08ddad15f50a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZqKuGHaf7/XGkLsIUxdZj335aZxnU9//UCmC/bRIzfrimv91HCQUcUve8Aky?=
 =?us-ascii?Q?RHuZ+QdeDWNZW+wAc93RHD8kRkFs8r/0JdtfDZNde04gZgyydtbUL2nAivDP?=
 =?us-ascii?Q?IqZZDPtQno8taWtvKv8ZBFbnAq+/ia7tBEy0uJAjiay6UeLBQeb867uqL/b9?=
 =?us-ascii?Q?ghO2cr5nsntqXpxX4ob1hPbmIwMAK5aVPY7Bf/To6IpAmMALaoO+EVMTeJ1m?=
 =?us-ascii?Q?AiVO9WwUTvqJrYXpJbNizFs0HCKYQ9LD20aDWxsD5ND51ne2bovSE+pBAw6K?=
 =?us-ascii?Q?F3VbsFCNnhxT62gIq7QrunaH4l4z4IFr34VMHRtO2K7M/lng9xJaqJJLdwL3?=
 =?us-ascii?Q?WYbPjrbORxXRgAOlC4sQCpvwLfMtzkJQNDPDpdJTFkCvKFLJ/IPIeDwemijg?=
 =?us-ascii?Q?AjMsFAi6bwxBnU/hiovU1t1N4lfcZl0+ENNuqVC//0LHjU7mHQkOGy5Ue6Gp?=
 =?us-ascii?Q?6X6/ZBsQhBL+46N+iK/DjZTRFP+auefkpmMTc5K4DTJbDsw/U5SrGR1wrEHJ?=
 =?us-ascii?Q?+0ofCuCislG4Vu4qm9yUOEO6pL4+QKQqW3/eOimU5G1QXcgZI7DKo+Hyqzat?=
 =?us-ascii?Q?p0XGcp9Gy0hgne8YoQ/q3sXJpMH9gNczw/FUxZsiBrNyLYUVzly64PGu+q16?=
 =?us-ascii?Q?tcXJzAf0nIa5bw8Is744TUAez587/s6hYnDd7WoEqLgwfRao/GEUKj1b68MO?=
 =?us-ascii?Q?uxIJ2Ot65+QU/13EqVgfG7mYz5/KCa1eKwVNSnaw8F8Voh9KIwbIOjYVhN2f?=
 =?us-ascii?Q?N+alaEqC9Ngl4AhApz0tdd0Er6JQLp4Aej4dJLIyLT1VpKz+8S5bxs2IPQ/A?=
 =?us-ascii?Q?hWKnEbRwFzQzXItTUyTTkest2sTOrXtOz9G3HwEKlca+vkQWEccL4ez5lgUU?=
 =?us-ascii?Q?QwttKzkL2u7TUsUZdUXDQuDc9FU1Ft0FpnO3dGSd3ExDxXInenbaeO93326i?=
 =?us-ascii?Q?hVP5vXSAW+fbqoUJaJokt/SABE2PL7al7Oy5iu2JICzFuDLkmRO3qG8EE8hX?=
 =?us-ascii?Q?wLNKMVpqWPijMal5OYsQCesmIzlAWsJu+QerIpDvGxzFgamct0gRNxY+MieC?=
 =?us-ascii?Q?S0/YnUQohUR4I/YDFG8jQLKdWJvBYr2WW6MTFbh8CLp2RxK2TAX8iYA0gtcK?=
 =?us-ascii?Q?2XjBfQphTf8H/jnwVHXTBM2ovVJRrhLsrBAePCHNHK5uiASy8ljniuiUaNrp?=
 =?us-ascii?Q?xgrwqxovjbO5oC5c4Naz6GZoOHhs8D0gPT7devNXol1faFnNALZU/DIiVJyy?=
 =?us-ascii?Q?wfclQAN9WlJr2A7QMfDx8j3n5aLsu+Ga7jE9/myeq/zevyAUzFOLrT3H6eCr?=
 =?us-ascii?Q?yKX24ymX5WSqVcH0C5qIVVzeXaBoeJf+VSHq1HAAC5U80Wb6LU5l8P1yP9+K?=
 =?us-ascii?Q?2sPcQtN/fytlpcFbd7RPHjEwCiPDft+adh6YGHY3oodPG/TcEDjDF+aABUd6?=
 =?us-ascii?Q?BEkldUizsCQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mAJH/HiISfJ/VqYaK+RrtW/cQ7uImQGbyNCi4vBhArSBJWhkR7IvBPyTxZWP?=
 =?us-ascii?Q?6NDjd6iQqLMe9eJFEZAE7BKgtDudZrigGZs2YWMs2FeJCtmE/iANTJ+xTcqD?=
 =?us-ascii?Q?9hN/M1cmTX7VDt1bLug3l8gndDNGCmnTBoplZPU+LNR+fycxhTxn0doSO99L?=
 =?us-ascii?Q?IecmkeRZfA6lGjwuMK7ucfwgsTDDlUSuWDo1mJeWdnPBDMoyvIacktNmpAry?=
 =?us-ascii?Q?UfD+zgWGdKdr7CNGsuYt/qaQe+Q6YTmcJuBiWShVCN+48J1oE1KlKVGdggAD?=
 =?us-ascii?Q?yjrE5OpA5h/sdoi/PMIXwfHw3RChVlnqztsz+LzL2MwbkL2NUMOPNUI+sPbd?=
 =?us-ascii?Q?c7n7aubcOSBsHyo1aFPhawg75JMLxIfx54aQtZqN8eLsY7CZdNf9vgcORsZ6?=
 =?us-ascii?Q?ZdjmuUruHdQQc9g8CpRMIUb/DlAnByjMfOoHb85zTOWrTbaSNHTeMASBwV67?=
 =?us-ascii?Q?5LjJiWvvW9wEvGXSrVbZNt8nikr7Qg8nedilFfF/3WsgMucniJfkB6A6zt1H?=
 =?us-ascii?Q?neyFxfirdZNCwnBOCMb7NaeqUk0MAKvrH2C7lZsJqV3RxsDPOlisYlGY5S9v?=
 =?us-ascii?Q?KbElh1mpyLLv/rr0gV8N5Dg9WPXdR6WKbB2I7SbMlNabVnyADvk6fujur3Pa?=
 =?us-ascii?Q?7c1iEC6Na+eHuy6mZZF05tn1nkn7oIUN3DupiJdm/OZGHuc3wkp7ni3HnI8m?=
 =?us-ascii?Q?7R8eyeh0zVdYI2rYgqSbJPjTa+gKOEt/ks1NJN3fFqUQyvRQhGYHAcs/ybTx?=
 =?us-ascii?Q?CGFCF7hswfouGXV7c0ClpkaTfW+H5FdBuyZr89rXgtYzIRkIgnSRydTiDth0?=
 =?us-ascii?Q?y2KnOZuZBOVsozipuQQ24KAPOM7v+PdvnjCmhrR19KUYUDGW/yLuqQciuSJR?=
 =?us-ascii?Q?wCX8RXxxSdqhW5USN8C4c+rEfMUHD9QXCbSQ1pLDzXIkOS1t5Mg738VoW1N5?=
 =?us-ascii?Q?D9NVk9phQlzcKfysa+aKGTVSROTp95CVz58bc8b/+uf33GoOBxO8kKTaI0M8?=
 =?us-ascii?Q?VQxPRNWwtkJWIfxdLB1M/S85KCYiLZVN4sjFKu5vcvZYqBGf7Xehatj1R1kY?=
 =?us-ascii?Q?Dw9C7M/ONYTpf29p87fYvR9srOxU2Ph5ZfEbMqGsX9jCJ2yoZ66pUz4CY+Xj?=
 =?us-ascii?Q?AV1H2LO6S5SHZnalZJxanrbKxfqIK4ncBJUcXM47ONqbNUBSkUEmxAkGO2UN?=
 =?us-ascii?Q?aFO0wnihmwdR9IiZTf9v8eM81DqNInhs7zQhM3wMeO39TiZ7SWKwO7s6C+YO?=
 =?us-ascii?Q?MiU8FVaUrz8xg4Kq0o6pQgdFriihbRsXdSDfr9xh28VgaGfKmXePgFIGLKRq?=
 =?us-ascii?Q?iJfw2ZJKExjrjv3uRAZuinYPcdtQFXx1VdBVOrgb99D8VYFUEzTaNLtk2upZ?=
 =?us-ascii?Q?AB09Zs7FOwH1Pin1OLUucxivk0S+giKUFR95nKqwz2CMuYkSHBISv28TNWy6?=
 =?us-ascii?Q?6PLJix9TxD7FEwTqP6BeWJT2JgYw2L2eIOvOxA3IqhDZb6Z0I5G1/NsMyEjm?=
 =?us-ascii?Q?3C5UvnWWW9KEKe/Qz12i7rdIWX02uawDtgW9R/miUxxJTdDTSvQfBjnpZvzY?=
 =?us-ascii?Q?eKnrpCiNByYHeA6LstX3z8u6uSy7ZSG8l546iyzN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12aa3472-e8c2-4b06-3b08-08ddad15f50a
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 20:39:57.5388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TyAKjJcqCs2fdskvt4xcXyPYPASkRos12wjKflSWvSYppXGFikDTdSU5Mhnm6r15o0Wx9fLx3GPCQHmJeUFakg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6882
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

On Thu, Jun 05, 2025 at 04:54:24PM +0530, Riana Tauro wrote:
> 
> Hi Raag
> 
> On 6/4/2025 4:13 PM, Raag Jadav wrote:
> > On Tue, Jun 03, 2025 at 01:43:57PM +0530, Riana Tauro wrote:
> > > A device is declared wedged when it is non-recoverable from
> > > the driver context. Some firmware errors can also cause
> > > the device to enter this state and the only method to recover
> > > from this would be to do a firmware flash
> > > 
> > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > ---
> > >   Documentation/gpu/drm-uapi.rst | 6 +++---
> > >   drivers/gpu/drm/drm_drv.c      | 2 ++
> > >   include/drm/drm_device.h       | 1 +
> > >   3 files changed, 6 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> > > index 4863a4deb0ee..524224afb09f 100644
> > > --- a/Documentation/gpu/drm-uapi.rst
> > > +++ b/Documentation/gpu/drm-uapi.rst
> > > @@ -422,9 +422,8 @@ Current implementation defines three recovery methods, out of which, drivers
> > >   can use any one, multiple or none. Method(s) of choice will be sent in the
> > >   uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
> > >   more side-effects. If driver is unsure about recovery or method is unknown
> > > -(like soft/hard system reboot, firmware flashing, physical device replacement
> > > -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
> > > -will be sent instead.
> > > +(like soft/hard system reboot, physical device replacement or any other procedure
> > > +which can't be attempted on the fly), ``WEDGED=unknown`` will be sent instead.
> > >   Userspace consumers can parse this event and attempt recovery as per the
> > >   following expectations.
> > > @@ -435,6 +434,7 @@ following expectations.
> > >       none            optional telemetry collection
> > >       rebind          unbind + bind driver
> > >       bus-reset       unbind + bus reset/re-enumeration + bind
> > > +    firmware-flash  unbind + firmware flash + bind
> > 
> > Can you guarantee this to be generic for all drivers?
> 
> 
> Firmware flash as a method was mentioned as unknown in the document. So if
> there is an error that requires firmware flash to recover, mentioning this
> as recovery method should be okay
> 
> Wanted to get some comments on unbind/bind. If this is not required will
> remove it.

Yeap, probably better to remove the unbind/bind and keep this generic.
Even in some of our cases we should need to unbind + config-survivability + rebind + flash firmware + unbind + delete configfs + bind.

> 
> Adding reviewers for inputs
> 
> Thanks
> Riana
> 
> 
> > 
> > Raag
> 
