Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2E39E9DEF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 19:19:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A2610E4FD;
	Mon,  9 Dec 2024 18:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jndxc56L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A287910E4E8;
 Mon,  9 Dec 2024 18:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733768337; x=1765304337;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nNgZmasgK9cZAiFy9YkFYrAdTJRWuXPbIF/ZtPhqVVo=;
 b=Jndxc56LqyNsZbIsCo1fUcxSP1HTBQjznu5M1TZKjw3CiSY/1TEgMIlE
 J85TPug3WAQuu8AApZ6ltSLwg4MdhUFsftz3o8EygYzI/jLuHQJrloup1
 17L1FpLWg3ZUIcddIuuUrNU5OAluJ1csa1XnlY8+BBiXhVh/2qxDIFecO
 bQa9XpES4pxfG+KFnRSDJqbtNbgxd5EOkOxXmGAGE7aZxpi7MBvYDdUbS
 lbdGj3HjOuBDQFuN6hATh3JN9NlY5CazHXP+tIPJcUmwAirLpbT2PJkGF
 1VwASr1assAXxIPMEfzwmC09ovWqOeTlajAtbhkFSJI3Nc7m76XxZvFmv w==;
X-CSE-ConnectionGUID: O45SzJxVSmG+57W+Sglk3A==
X-CSE-MsgGUID: aFw0JNWlQjeag90JHVcgxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="37768344"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="37768344"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 10:18:56 -0800
X-CSE-ConnectionGUID: NM+0zatLS9SZ+VB+IBKIkA==
X-CSE-MsgGUID: Vb9uzOvvRhO7RqO6n/rk7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="95013234"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Dec 2024 10:18:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Dec 2024 10:18:56 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Dec 2024 10:18:56 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Dec 2024 10:18:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJQnDYY80KtmVmGLHOOhGystu3Z5eMvGmZsnHZ5w9ZhoZAVAo54f/rkHZjm+FT3xIby6aPUNqyCt04XJu5IrnfS6Dce9Wa36/QWa1wGltvwQ8Svs/MdiwT6xarV9VDH8Z96QrL3c0dGn3FyB8ouahUgu1kqyfD4Byz9+Q+6JOP4obCSaoA5MVNEwURhOZfi4Vq14s0gWNHT3K6HPX55nuSCSDhbprLy3xZUjW+KNQCU09Lm3jiDOpYE2ppVCYrA5iSmPs0OkJqXDg5xLkf6npTxy8tLAqboJzCjzPZsBdprTRg9y9DsOhYbH4k+ZgFgJ98naZhno4+duRWmb29fWtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DubeL/sOIWC9AsfrowUXp5F6lYhMyNhpBQ7+7jThKfA=;
 b=klZ76BnU967pCb2WHKCG3cI+Pj+nf0jwygmQemnoXUs5HG5QkOH0ucAx/vRWkVNHxcSr+z20/63xsn621Toja5KBRMyrq87OYAorTqEZwDdQ4U7jXFsbNr7sNEzVT/hN1VMCQ9FRp8MW9h/iqO/yN6riR95iNgPVb+VvbhvDPBpVMElnWGfjxaUV2rowDd6EREIIoUUnSnoNekKUsdA++e6AC+jm77Quhz6Js2fgnrouR6AgAS/pnrsNfVmvYiVZt7pdKBRNXAx0i2KND0w6EDBgwaY2PFmK+/veeCV1k/L8oDinsqONejP7UKJSDFtYdocLzJvdSz99bZ+cF8L1WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB4814.namprd11.prod.outlook.com (2603:10b6:a03:2d8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 18:18:45 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 18:18:44 +0000
Date: Mon, 9 Dec 2024 10:18:42 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Arun R Murthy <arun.r.murthy@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCHv10 00/10] Display Global Histogram
Message-ID: <20241209181842.GU5725@mdroper-desk1.amr.corp.intel.com>
References: <20241209162504.2146697-1-arun.r.murthy@intel.com>
 <20241209165756.GQ3224633@mdroper-desk1.amr.corp.intel.com>
 <Z1csWzRHDzU0pds9@black.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z1csWzRHDzU0pds9@black.fi.intel.com>
X-ClientProxiedBy: SJ0PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB4814:EE_
X-MS-Office365-Filtering-Correlation-Id: 15f75f64-bb75-4f65-6c4b-08dd187deadc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gTkq9iuP1hsIM+Gwloei1y1pCb+d0Nn6AHvKrg54obOnz3QQb2Za8aG/zWw+?=
 =?us-ascii?Q?8VX1GcW1rSTXqKutr8Hauv1JZkVipA3m47AuMRCH0sMsDawXCeGFyoadls0u?=
 =?us-ascii?Q?vBQJJpeVHNwRxZpC+ZXRY/OU1tPSSKc7aV1gka4tQSZ4JChfuOdwK3hZxS3/?=
 =?us-ascii?Q?JVSm4HTnDJxOR1SwmPo5D5xo2g6JfVudyvI8oN2IvQU9GTrkY/ZR3jjkQdgy?=
 =?us-ascii?Q?3qXUYzBGdv23N/0GLHknCw661bYm0+V5FJV/U5EOl8tPCnBBzqy+ROikbx1X?=
 =?us-ascii?Q?yBoU+k2/03msbLECYY/veQGSLt4f2IxMWy8EBWfTlIXWB+NKcsmAvCVu1iT6?=
 =?us-ascii?Q?4MqMgJSNr+idk+kwxHWsFCmZ+cjVKzAB5JtA/h3bC6JcfVrKqCOsWNB0xXbf?=
 =?us-ascii?Q?H7RsaqnUCZ1nEsys8e1EEt0ajoKS+zjZvkZvwp8FOCYpydos10hKQ982U2+8?=
 =?us-ascii?Q?tXQh8ya0VmbQyO2Bl4y4INK6QSDjVdviYh8J0AGnLjbk+YOVQm7SDmelOu44?=
 =?us-ascii?Q?xhpzVbLQzWGjHXaPDaERexv1lkIDj8w5r9QElEQw5dJjdRdzqsH8tpowq++Q?=
 =?us-ascii?Q?bCr6Q6h9CGDw/4OrTDYRamlptCN3HCH7mIDDrcwFRByfk21kTn/ftzBLwoAT?=
 =?us-ascii?Q?l9GeJzre/HYMcOy2lCe1igV2n9hn9ovDzFX6YQfFnI3zPiD8zsVaKH44lcYt?=
 =?us-ascii?Q?uOrpUCs0j9dRmzkGvIqurd/q9n6UGZME4iM4kILECUqMQbuEQInAdy4uRtE1?=
 =?us-ascii?Q?JuA7FAYG/Yr4RGCwe8QcW9F81Ntr5lxuaSxnt7htUCAfubi7BpcX3//KivUd?=
 =?us-ascii?Q?6107C9X79p7RpzvUshr8FbghY2pSXiJORK5bnZZTHhL+1NZiJ29hceQ2OmzI?=
 =?us-ascii?Q?i5QjAbyUBoyEfAyMWnJzxHWGHvbDp1f6cePNCfj8drtNaVJQzF25TBKAjmFA?=
 =?us-ascii?Q?dKO1c5+iUiwnrdRux1evHGrgVJOiYSCHEf6BrNZp6bNEOOC8KZ0C1G2yKEPj?=
 =?us-ascii?Q?bvUmjrctNkC7AnijAXlOi1KSkPk9gK7mRxr3HeG6atXLg9qw1Vv4oxKgHpLa?=
 =?us-ascii?Q?V+jQ0As8I4KtB0y4LxGGPe5JuW48WmheFpAQTrmmrIsCLyAmkgxvHsH6qmcn?=
 =?us-ascii?Q?kn7AYvmslLIcFmJs2SPQdZdnLXZgxg/WN22LK70xoBl5I4ZUzHJ8ulW4kmGu?=
 =?us-ascii?Q?iCR5TCSw4HpbPRXjepLDI2ZHEgOvugVhrGeH6W7iEHeiCDjdZ0uScdUj+fUc?=
 =?us-ascii?Q?bKlqMTWzBIbmQBxJhY1N9defruaX7FzAmi7FBoE2B/0BVK+EU8Hb/d8Lky+P?=
 =?us-ascii?Q?MJiSv0w6nBivBt1A8NXjJRUu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xm5MDVyFBd+C1ojjx68tPdC+6ojb1ym1CVdxFHSJQpVkvHn9BZtX3cLxl4zf?=
 =?us-ascii?Q?WrJbVGemqX9KSnYRafouhYr6I3dj+xrYDPRwAKmrB6Sr9gqiFG8GCHxlayLX?=
 =?us-ascii?Q?bZack2NQrd7X3685J6aB4zNsEa5bBzpdZR/vyCXcSpl7RmqgYI+znUmKg0QK?=
 =?us-ascii?Q?GfQxZH8Ke0x07YQDafqlMMaA3LKwXM/V7mhRiYI1zRk+XoRQ9RCF0OKSNU7b?=
 =?us-ascii?Q?hrt1LUWvinVntj0WiNI86djJV2n6G5jn94f9pmUYdw3q1MYpd30quLtUjFs4?=
 =?us-ascii?Q?r7vExBZ1lOldcSRvpb5QGcKqUoBuH8Xf4WidmmFmqszreforkeMIkQBAZ0Uy?=
 =?us-ascii?Q?epKXgOzrXfwKPIlN1sm6dQPS8u1h1mRskr1MAaglaNXeHxBsdoIISpRnYOnU?=
 =?us-ascii?Q?hkEl6qJG0MtWVmExAi6mWCyl2JHSzaKPj4raQ1tcFmarhK8Jyca+WvCty1ya?=
 =?us-ascii?Q?Q/Et2LKeEY/2r/tJIoQ+/pMWGpd7AAVub9D5YMT29bBEsh4eeM/dUXdtCGIH?=
 =?us-ascii?Q?eeovO5GigjAWPfsiwziyzVCOGoDrKmOK4ZOQKV7JEzvcgUAEdBI7RbVmXs4N?=
 =?us-ascii?Q?lGufUvrEljBdhJzcT1Te78NZ7XoxQa8LbrnWY64ZstoJpH43Ng8kfO2u96r9?=
 =?us-ascii?Q?OdOj+TKUq0WKTfsRFlRG3pjM4rJeRKZxvqtHV02rMa4vVVYGoiYgVdNaKGQn?=
 =?us-ascii?Q?L2FpEF0UubE4moNjFFVBHei2/+goulwMOydQZXA98k9LTL/wK8HPbl6xaEr6?=
 =?us-ascii?Q?sOVfpZzeCnaxw6NCXdoNaJWv6mQMEqZ57IZKF/pq6ggizXGNTrEZZItfdF9i?=
 =?us-ascii?Q?ADI+PoYbhTQdXzbSxlidcup4UiNbavCnNXfalPOs0R9ujY7hTDlfTDmqFi/T?=
 =?us-ascii?Q?THg+R8nXtFXXyxH7tbNhoBjUSq/nYVhIeOHhypr+rLWzmgtqBmHSg5IlH79g?=
 =?us-ascii?Q?Z64kCvovnfZOHYqR8fw2Rdm4SPe6il7qQ3O1JeA6jV5L5TRZX1GQXfZe9gAH?=
 =?us-ascii?Q?/C7GlDfs7b6BQuPOkLnbK5znA1EJ3Yv8KWiETeJDzagg2L7cSpJcFJcS2AeT?=
 =?us-ascii?Q?Au9Q6di2dFyOOiwmx5ZUR89wFjAshE1F5P3ocvoi4X8Q/NOfx9xBYq+61ltP?=
 =?us-ascii?Q?jCorRXejuAM+PsfTKboARj5jbve3U6r0ySq4kO/R3GlNCRdwu5Qmu2v3Nkiq?=
 =?us-ascii?Q?/wMy+s083KvhswIyc7zPZqSZEbwwBVqJReDLkXbxbaQwsIXQCTRKO6ZDXakP?=
 =?us-ascii?Q?eivgY6h/Mj/57f9kVsiowFXeilBrZ1q8gAM254lDkdY+v/NwkGdGpVLSYd2Z?=
 =?us-ascii?Q?ZgngQ+Dn+mA3V4nYB5FJO/aZJfb6muSocDV4KZvITMzrzEhXthr9CoVUTbrC?=
 =?us-ascii?Q?othxeMEfy/WmR/GMQ00CqHFN5UaO0wPVdYgzzrzqWOdZW+Hvn4WBL496XfSi?=
 =?us-ascii?Q?qg+hPM9Aca0jlH/+StbQyUsfiRoUCytisIW14X81aixx/cvVKHzkIGw2dVH9?=
 =?us-ascii?Q?a68wovoHqs/GgAZEZkIHwUj5/IlJbEBPjI5i05rx5Ui3zNKaUqPNus7KNlfc?=
 =?us-ascii?Q?Zda0KQ1lx1s1lyI2j8QCwon3EVKjESPmG5hhRsU2gZhtT+5acya6RvhrEBFU?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f75f64-bb75-4f65-6c4b-08dd187deadc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 18:18:44.8602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DY/90ewp9nx94GAMfqGTZmEfIte0PCvvWncoRc+ZPsPtfP4oHJHX7A1mF27h49jJHKNdG+RgBcMeOPe4FSgGzsimAjwRxFLZ507j+hyG1uY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4814
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

On Mon, Dec 09, 2024 at 07:43:55PM +0200, Raag Jadav wrote:
> On Mon, Dec 09, 2024 at 08:57:56AM -0800, Matt Roper wrote:
> > On Mon, Dec 09, 2024 at 09:54:54PM +0530, Arun R Murthy wrote:
> > > Display histogram is a hardware functionality where a statistics for 'x'
> > > number of frames is generated to form a histogram data. This is notified
> > > to the user via histogram event. Compositor will then upon sensing the
> > > histogram event will read the histogram data from KMD via crtc property.
> > > A library can be developed to take this generated histogram as an
> > > input and apply some algorithm to generate an Image EnhancemenT(IET).
> > > This is further fed back to the KMD via crtc property. KMD will use this
> > > IET as a multiplicand factor to multiply with the incoming pixels at the
> > > end of the pipe which is then pushed onto the display.
> > > 
> > > One such library Global Histogram Enhancement(GHE) will take the histogram
> > > as input and applied the algorithm to enhance the density and then
> > > return the enhanced factor. This library can be located @
> > > https://github.com/intel/ghe
> > > 
> > > The corresponding mutter changes to enable/disable histogram, read the
> > > histogram data, communicate with the library and write the enhanced data
> > > back to the KMD is also pushed for review at https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3873
> > > and https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3873/diffs?commit_id=270808ca7c8be48513553d95b4a47541f5d40206
> > > The IGT changes for validating the histogram event and reading the
> > > histogram is also pushed for review at https://patchwork.freedesktop.org/series/135789/
> > 
> > I think other people have already asked this on previous postings of
> > these patches, but please don't try to manually hack the version numbers
> > within a series.  What you just posted has "PATCHv10" on the cover
> > letter, "PATCHv2" on one patch, "PATCHv3" on three patches, and the rest
> > are unversioned "PATCH."  The general expectation these days is that
> > versioning in the subject applies to the series as a whole, not the
> > individual patches, so this causes a lot of confusion.  Posting like you
> > did here also wrecks havoc on a lot of the tools people use to manage
> > and compare series like the "b4" tool.
> > 
> > When generating and sending a new series, you should just do something
> > like "git format-patch -v10 ..." so that the proper "v10" numbering is
> > automatically applied to all the patches and we don't wind up with this
> > strange jumble.
> 
> Isn't that the starting point?
> 
> https://kernelnewbies.org/FirstKernelPatch -> "Versioning patchsets"

That section is explaining that the descriptive changelogs for updated
series can either be placed in the cover letter or in the individual
patches; I don't see anything about going back and editing the "[PATCH"
prefix of the subject line that was generated.  You generate the new
copy of all the patches (and the cover letter) with one execution of
"git format-patch," so whatever version number is generated should be
consistent and correct as a series-wide version without editing.  Also
note that even though that site suggests using "--subject-prefix" to
specify the version number, these days git's format-patch has a "-v"
option that's a bit more convenient for this purpose since it also
updates the filename of the patches generated and knows how to combine
the version number with other subject prefix rules for projects that use
them (e.g., IGT where patches use [PATCH i-g-t]).

Although sites like the one you linked can help with getting started,
it's worth noting that different kernel subsystems sometimes use
slightly different conventions so it's best to always check how things
are done in the area you're submitting patches to.  For example, unlike
many (most?) parts of the kernel, in the DRM subsystem we generally
prefer to place the per-patch changelogs directly into the commit
message rather than supplying them below the "---" line where they'd be
dropped when the patch is applied (i.e., our DRM convention runs counter
to what's stated earlier on the page you linked).  When in doubt it's
always best to read through other series on the mailing list to get a
sense of how other developers are crafting their series.


Matt

> 
> Raag

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
