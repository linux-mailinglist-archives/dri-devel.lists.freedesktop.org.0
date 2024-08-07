Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF2994B3B2
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 01:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCF410E20D;
	Wed,  7 Aug 2024 23:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AfuMDDnb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DCD10E030;
 Wed,  7 Aug 2024 23:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723074005; x=1754610005;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BPQA+Q8n+4GeXstIOGKoXijmkqLZ3QIAULZw8k0zLGU=;
 b=AfuMDDnbndqxiYGn8Z8VG92kdHBNcjkjBohW58Xv10ZaiUCxH278nKsI
 hzZApotEBBaryfLrXutHZyYbA9zDxvlNalzVInouMD8dy1HI9Mv/V8q+G
 HfvmZ41kVUEsuunvqo9tzhzicXaXvEj4TaHODRE1OSji+zbGtBwt8m24Z
 PBiRC9v1KOrR2foGHaJXnsvpQk3yybeGi5kx7wj5le5Yr1wW9cwsWyl4A
 A5wcxdxf9lo7Gy2xad5rXPdYpdculrOBUex2uNvKm1d+wch2lznC1rm1K
 IR9DnOquhONAV4EeL2Td9TFNR9UqcIPIcrcQ+Fz96yMGf+XKhpeAmIcRR w==;
X-CSE-ConnectionGUID: TFDz8fdaS76lXJg3Z79Nqg==
X-CSE-MsgGUID: h/y8h1nQSfWQ/pzZ3o9PlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="20838745"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="20838745"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 16:40:04 -0700
X-CSE-ConnectionGUID: R3YVz4XtQmOYy6XA3qiHpw==
X-CSE-MsgGUID: VpLjLEY5RWyKWAufdx+sPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="87939983"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 16:40:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 16:40:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 16:40:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 16:40:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tzi1w01Y64JF8JlO0pwg0yfbQ3361q5KzO6JDsC9FnXR+5McLDtLRN3PbNoZJvyEvgDqQHgmGnL3SlIpC9gg3WAtU997ugWM5W7I3qDZTaOd5lW9DGwkiEkzXxVyyIgZcvjiu0MwjYqfUf3dcFEgY3kPWybGmNrPtdtOlorZN0+vyVPeyVWLYsoB4JG7WkNH21+IwhCXbZG9m3XU8dXvLXE7LDoxX6ZQGAH2pBqmWZ7BbbTXVNcqhN3pXXexKRMOwU9ek6wrzGxxXLVUIngOmVvFNzSNQk0DWM3nipZLvcEBfaQRqc/s/vwUaeHDo2RJbYirXwWk0oCErqHMG+viDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0isWbu3eO/F2FnVBTtM0V6r8b/0MJwfLPkcmQbe4vFc=;
 b=LxRiWRp1sS0XD9zzOREOBjYGC+pJOeyInSsRklonOy/3nmRbM7nmzNDzim5+WBxg1WLgQLRr5HBbsrism/usXOnYOgvX0h5TjXbzrMjm79bbTBWqw1Vh/bIUPxBJIkl1G7NVg4SfIv+QrsFZ9bir5YcfOtwKaCXZijYMg7mEPf+obhW1yN7GjRXcrxXeBvVqQipD7paJSUN3h1jZWW6+CH5hC4ZU9GGIoAhpWxTZfBBVtW92sJCUXMoD/7ZPevSgJzVDOrAhqORap/o7nqYHHjFu1UWd64O9LHS5SHqH30ZrA0nIdJVJ4f5XAY8za6a5MtPLO6O7MNzJDHTb6UsliQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW6PR11MB8310.namprd11.prod.outlook.com (2603:10b6:303:249::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Wed, 7 Aug
 2024 23:40:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 23:40:00 +0000
Date: Wed, 7 Aug 2024 23:38:42 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v6 09/12] drm/ttm/pool: Provide a helper to shrink pages
Message-ID: <ZrQFgmYPJuM24AVJ@DUT025-TGLU.fm.intel.com>
References: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
 <20240703153813.182001-10-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240703153813.182001-10-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:40::36) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW6PR11MB8310:EE_
X-MS-Office365-Filtering-Correlation-Id: a7604f84-a8ad-4300-fe88-08dcb73a40ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?dimfXUAPzd/sgAr5vr2pZGuBGDexy++tnZyv52bYt+wP/X7a/Vvv0/nxOG?=
 =?iso-8859-1?Q?nrT+Z4mh9IVcJLzKfPMf30W9qAkOME1Up8RKL9rDdIqGrXEfczBkDwp6y2?=
 =?iso-8859-1?Q?jONSS1TqAidmVs5ikKyaPnoFMRFKzcOO6Kc4G7gtUQ50tSZCh3dbWnWzxE?=
 =?iso-8859-1?Q?7xi54lGJgynn7yoePPia4SA1CzdI8est/fOOiLFRT1PNHSh09BtFOH/tBI?=
 =?iso-8859-1?Q?16DTrOLSo6M6DzO33jEyJ+najDAgX+8T23KrBkFu5CsNcVviZIT/p0F1A1?=
 =?iso-8859-1?Q?cXlBhBlkG4w2sTmYzvIkCmxJAyC7bRttWgcOqnhLKTjtqfaZJyLutPtFyx?=
 =?iso-8859-1?Q?NokfgSRxLTS8NsJ6G3Vn1QCvQ74jYtx07gUxHJzcXTcI3rbD5JdAVon2bP?=
 =?iso-8859-1?Q?+vtGfxiDK6TgVg/QQDeBQscogjg/hTV6+c+/oRBCcvVgH5Z4cbz0GFg13L?=
 =?iso-8859-1?Q?qbGdUc1zBl6Yd0FuQJ4NTCSV34SU/VhQzcOD0yHiIQtuVXzOFrrxIhELjv?=
 =?iso-8859-1?Q?3krCKuYgrkUVbtEL/AfVm9Aw/fvJ/vP84kqzugmw/SR2uyug50k4ZvpiEp?=
 =?iso-8859-1?Q?z6TuiLL8falMN3xqisWPoFyZyremXvMeQgPX1A47rYMMcbIgpWZ3BumP4m?=
 =?iso-8859-1?Q?8RRnoOHiC/EbHHtg9HTCMuzTjmE0tbq8mUiaz6wHdOosOzYQBUj0W6D774?=
 =?iso-8859-1?Q?IRgbf4h8ugIOptgy6MelCjzDv1lN1TFglowlj99RFQTGjcBvC5sj4oCAVg?=
 =?iso-8859-1?Q?/qL5uL/nBlBnshvK5cjTEglP4RKG7gI/Fo8XgAaMt2BIt4qdfCZhgY7gCn?=
 =?iso-8859-1?Q?aKWsIXDnKg/dc8hNnUFhq5Uz33aOa0AV2apa7hA0KQqjAGEGAHXmYGYUQQ?=
 =?iso-8859-1?Q?3iyWoV5fDH9MMIWgnsWLmTNBaaPseW2PSpMiHazd+blr2tGZX79rVl5++n?=
 =?iso-8859-1?Q?mGsWKU8iY+VK9RVl+wsEygFA4Vq++lyALdwVz0LXYY8vNCtrFXknyzSso4?=
 =?iso-8859-1?Q?hPVfs7e2xfSq+NVsBWCM47LoFwchNNQC7bzPVA1YGJie0SafsIrhjz+5uD?=
 =?iso-8859-1?Q?Ou21pqft5eZytpDucnOFw30O3is5UTyxjV7HZWCMhawsVGthKa/ADO9Smw?=
 =?iso-8859-1?Q?xcPx8BekbLqTWXfIiArUBo2VURxZQItW6++d9EGv0UqZWAqqgthMaJIaP8?=
 =?iso-8859-1?Q?d0W75P6EZ6HDtrslBcHIvBgwmv/Yq3SYg8aaOMOwpe5K1Mk9fsfKMMYmS0?=
 =?iso-8859-1?Q?6NlGErPOVoTcMPB/Jt/65Dg3ZL6YjYMck7dDrRUZYOPFWn3KrQuIhqKTtZ?=
 =?iso-8859-1?Q?dxVuzHRjgjAg5Q7m5jKMqXGRwjB48My3rL+a89SoNu+DW3qdRylBwiacWD?=
 =?iso-8859-1?Q?GBJR3LPk6WGDE1SDDw98kisSdV+b3vCw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IKKvuPqg0pM6Eg4pfWgLqL/5Lf0u/2IbEwU+DymXc6aVw6atVxVlw300PU?=
 =?iso-8859-1?Q?WjCb9oJXFoCPpYB8tmCxFywcgtn9FGJ1S13nBPfP1NnKgMVI2lM35Nos7P?=
 =?iso-8859-1?Q?O4kpPvYOknKLDUYt2bjwspSEnlJSJfpIbGbC6sZs/FuzG0P1v6efdQZWGQ?=
 =?iso-8859-1?Q?RG0lR4g1pmAuHBipoPKVCCvnZCxiGy83+BiPdRaBcjloA/5q9fOBOauDns?=
 =?iso-8859-1?Q?n7DTrTCSTBxYIOt0pBbpONprqmlY1Tp59ctdNaWMErVe2Bea62Ud475Z1e?=
 =?iso-8859-1?Q?hZPQZWTlaOUpj111GvY753gJah97X+UJEOvwnVNaW5XBn4mg4uR+tZtkGg?=
 =?iso-8859-1?Q?JPFQ4p/T+vSKMd+BEKqgd1Vbop/A+eZXgYM96ESuBqh/9vB3lWTr8CbZMI?=
 =?iso-8859-1?Q?q+KzX7J/54iDmTAodQvo6zAMk0nsZXErUwbH5qjT782Zvro3VZWnRLesSN?=
 =?iso-8859-1?Q?p/N1SZkkZaCfD1kwPDtYNGdATbEPzirAmtz9ZQPi4/g7vJQo0yskp5Ifyb?=
 =?iso-8859-1?Q?DHiSsgXxGi89SPNZ57Xr7CTXsjU5YtxWrRxVZQDaDcknAfrUX2nJmpf/BA?=
 =?iso-8859-1?Q?YpNmgZnXHEssmapGHmFLqxYosrlhYDhcZpT+FxtTeRr7vicm+0CKQW8/1o?=
 =?iso-8859-1?Q?QoYRGANoqvhJwItemNMy4/zam5q3MIFtfgEpkrWD9geb/pM3e8+2yK6IcO?=
 =?iso-8859-1?Q?HVO2k/Y9jZ1kOOMIhA8ZLBCx8ICwAiKPx9VOO2eg3BKAfMJoKnQQaB8QyQ?=
 =?iso-8859-1?Q?z13M9D77k8gKEpgne7Hwwi2FAWCvNGOhlcuwsNubReC6PT1aUSBk4VGIp3?=
 =?iso-8859-1?Q?Q6aGQy7ba8A4UX6zbvC0mCXIaBeNtZRjOLic5b9TXX4xfk1wJL6rywvNmO?=
 =?iso-8859-1?Q?Z6Wat6icRUecKut7Vn7L0i5ReCV5QqJCF3Wn9JrEHqDOddoJFNDtj8zthj?=
 =?iso-8859-1?Q?BOY1vzXDaPQtfKWQa5+VrmIV4FzEdbmp20OQNJKWDtjotlKePy7lQf4Cjj?=
 =?iso-8859-1?Q?OapDE0VYc9bfrmlh+UevIO/EuykTZspzP0+RfqDCHumVoydE6XIv243cRq?=
 =?iso-8859-1?Q?rY6sqKxYqBeAD5SwKDzl5BSABxYeYPWf3WSrNy3s4BaqBDjlOLG4zcwZM6?=
 =?iso-8859-1?Q?JryOh1oh0xAbZezizqanQszd0gKFhL+H5jvlJ2NBPXPLjggiJjk78GcpCO?=
 =?iso-8859-1?Q?2w8tRgCyzdy1qWYjdksEGRbgIwpNMKQ4Q9fzAjeDjCcTdQdAU3lD9vcBcy?=
 =?iso-8859-1?Q?sIwHzcvT6ZynIYTRYkV9EugGCNXnuhQ41Un46GSJi3giDmLwCt5LHqtiSd?=
 =?iso-8859-1?Q?SmPIyMSP1K2hLxHPhV75OFijpZ64IEKivS/kUzyYdBaX6rAu+NuOJJREz8?=
 =?iso-8859-1?Q?WTDX00yR3c5EyB8f/7ZuRWI7saFhJkYtbLmVWkhi6kCCAN0khzbUyiBec4?=
 =?iso-8859-1?Q?ttOuba2SWfJqvSO3DzCk7JaHwZPO+YIrH2X+5Tvr/+OXlIUbaUoCixkOUs?=
 =?iso-8859-1?Q?g/9eur8RNSd1gwDEf8dPLnGMlPiwyyHGZK9GACHzbesQqDt79NQctsA2Uo?=
 =?iso-8859-1?Q?054HNOWQuHEi7F/X3sHIn08fZoZHSQUZ+hGBsiKr5JuGgBSzaxGnVpBBAY?=
 =?iso-8859-1?Q?0d3ySpEp3xeeyyGH8ziiUk7OnorTi3hZwyYXLogN4chOAUfuT18zDAfg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7604f84-a8ad-4300-fe88-08dcb73a40ef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 23:40:00.6185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wyBPnrDSepB4xKX7FYOrju9ij3r2mKW6VdUHy/upPGoVGWcJ8PvSU2fnW4ldWz4FdjmaGVMSjhsgMiQnQGLStg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8310
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

On Wed, Jul 03, 2024 at 05:38:10PM +0200, Thomas Hellström wrote:
> Provide a helper to shrink ttm_tt page-vectors on a per-page
> basis. A ttm_backup backend could then in theory get away with
> allocating a single temporary page for each struct ttm_tt.
> 
> This is accomplished by splitting larger pages before trying to
> back them up.
> 
> In the future we could allow ttm_backup to handle backing up
> large pages as well, but currently there's no benefit in
> doing that, since the shmem backup backend would have to
> split those anyway to avoid allocating too much temporary
> memory, and if the backend instead inserts pages into the
> swap-cache, those are split on reclaim by the core.
> 
> Due to potential backup- and recover errors, allow partially swapped
> out struct ttm_tt's, although mark them as swapped out stopping them
> from being swapped out a second time. More details in the ttm_pool.c
> DOC section.
> 
> v2:
> - A couple of cleanups and error fixes in ttm_pool_back_up_tt.
> - s/back_up/backup/
> - Add a writeback parameter to the exported interface.
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 397 +++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/ttm/ttm_tt.c   |  37 +++
>  include/drm/ttm/ttm_pool.h     |   5 +
>  include/drm/ttm/ttm_tt.h       |  20 ++
>  4 files changed, 446 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 6e1fd6985ffc..38e50cf81b0a 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -41,6 +41,7 @@
>  #include <asm/set_memory.h>
>  #endif
>  
> +#include <drm/ttm/ttm_backup.h>
>  #include <drm/ttm/ttm_pool.h>
>  #include <drm/ttm/ttm_tt.h>
>  #include <drm/ttm/ttm_bo.h>
> @@ -58,6 +59,32 @@ struct ttm_pool_dma {
>  	unsigned long vaddr;
>  };
>  
> +/**
> + * struct ttm_pool_tt_restore - State representing restore from backup
> + * @alloced_pages: Total number of already allocated pages for the ttm_tt.
> + * @restored_pages: Number of (sub) pages restored from swap for this
> + *		     chunk of 1 << @order pages.
> + * @first_page: The ttm page ptr representing for @old_pages[0].
> + * @caching_divide: Page pointer where subsequent pages are cached.
> + * @old_pages: Backup copy of page pointers that were replaced by the new
> + *	       page allocation.
> + * @pool: The pool used for page allocation while restoring.
> + * @order: The order of the last page allocated while restoring.
> + *
> + * Recovery from backup might fail when we've recovered less than the
> + * full ttm_tt. In order not to loose any data (yet), keep information
> + * around that allows us to restart a failed ttm backup recovery.
> + */
> +struct ttm_pool_tt_restore {
> +	pgoff_t alloced_pages;
> +	pgoff_t restored_pages;
> +	struct page **first_page;
> +	struct page **caching_divide;
> +	struct ttm_pool *pool;
> +	unsigned int order;
> +	struct page *old_pages[];
> +};
> +
>  static unsigned long page_pool_size;
>  
>  MODULE_PARM_DESC(page_pool_size, "Number of pages in the WC/UC/DMA pool");
> @@ -354,11 +381,102 @@ static unsigned int ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
>  	return p->private;
>  }
>  
> +/*
> + * To be able to insert single pages into backup directly,
> + * we need to split multi-order page allocations and make them look
> + * like single-page allocations.
> + */
> +static void ttm_pool_split_for_swap(struct ttm_pool *pool, struct page *p)
> +{
> +	unsigned int order = ttm_pool_page_order(pool, p);
> +	pgoff_t nr;
> +
> +	if (!order)
> +		return;
> +
> +	split_page(p, order);
> +	nr = 1UL << order;
> +	while (nr--)
> +		(p++)->private = 0;
> +}
> +
> +/**
> + * DOC: Partial backup and restoration of a struct ttm_tt.
> + *
> + * Swapout using ttm_backup::ops::backup_page() and swapin using
> + * ttm_backup::ops::copy_backed_up_page() may fail.
> + * The former most likely due to lack of swap-space or memory, the latter due
> + * to lack of memory or because of signal interruption during waits.
> + *
> + * Backupfailure is easily handled by using a ttm_tt pages vector that holds
> + * both swap entries and page pointers. This has to be taken into account when
> + * restoring such a ttm_tt from backup, and when freeing it while backed up.
> + * When restoring, for simplicity, new pages are actually allocated from the
> + * pool and the contents of any old pages are copied in and then the old pages
> + * are released.
> + *
> + * For restoration failures, the struct ttm_pool_tt_restore holds sufficient state
> + * to be able to resume an interrupted restore, and that structure is freed once
> + * the restoration is complete. If the struct ttm_tt is destroyed while there
> + * is a valid struct ttm_pool_tt_restore attached, that is also properly taken
> + * care of.
> + */
> +
> +static bool ttm_pool_restore_valid(const struct ttm_pool_tt_restore *restore)
> +{
> +	return restore && restore->restored_pages < (1 << restore->order);
> +}
> +
> +static int ttm_pool_restore_tt(struct ttm_pool_tt_restore *restore,
> +			       struct ttm_backup *backup,
> +			       struct ttm_operation_ctx *ctx)
> +{
> +	unsigned int i, nr = 1 << restore->order;
> +	int ret = 0;
> +
> +	if (!ttm_pool_restore_valid(restore))
> +		return 0;
> +
> +	for (i = restore->restored_pages; i < nr; ++i) {
> +		struct page *p = restore->old_pages[i];
> +
> +		if (ttm_backup_page_ptr_is_handle(p)) {
> +			unsigned long handle = ttm_backup_page_ptr_to_handle(p);
> +
> +			if (handle == 0)
> +				continue;
> +
> +			ret = backup->ops->copy_backed_up_page
> +				(backup, restore->first_page[i],
> +				 handle, ctx->interruptible);
> +			if (ret)
> +				break;
> +
> +			backup->ops->drop(backup, handle);
> +		} else if (p) {
> +			/*
> +			 * We could probably avoid splitting the old page
> +			 * using clever logic, but ATM we don't care.
> +			 */
> +			ttm_pool_split_for_swap(restore->pool, p);
> +			copy_highpage(restore->first_page[i], p);
> +			__free_pages(p, 0);
> +		}
> +
> +		restore->restored_pages++;
> +		restore->old_pages[i] = NULL;
> +		cond_resched();
> +	}
> +
> +	return ret;
> +}
> +
>  /* Called when we got a page, either from a pool or newly allocated */
>  static int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned int order,
>  				   struct page *p, dma_addr_t **dma_addr,
>  				   unsigned long *num_pages,
> -				   struct page ***pages)
> +				   struct page ***pages,
> +				   struct ttm_pool_tt_restore *restore)
>  {
>  	unsigned int i;
>  	int r;
> @@ -369,6 +487,16 @@ static int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned int order,
>  			return r;
>  	}
>  
> +	if (restore) {
> +		memcpy(restore->old_pages, *pages,
> +		       (1 << order) * sizeof(*restore->old_pages));
> +		memset(*pages, 0, (1 << order) * sizeof(**pages));
> +		restore->order = order;
> +		restore->restored_pages = 0;
> +		restore->first_page = *pages;
> +		restore->alloced_pages += 1UL << order;
> +	}
> +
>  	*num_pages -= 1 << order;
>  	for (i = 1 << order; i; --i, ++(*pages), ++p)
>  		**pages = p;
> @@ -394,22 +522,39 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
>  				pgoff_t start_page, pgoff_t end_page)
>  {
>  	struct page **pages = &tt->pages[start_page];
> +	struct ttm_backup *backup = tt->backup;
>  	unsigned int order;
>  	pgoff_t i, nr;
>  
>  	for (i = start_page; i < end_page; i += nr, pages += nr) {
>  		struct ttm_pool_type *pt = NULL;
> +		struct page *p = *pages;
> +
> +		if (ttm_backup_page_ptr_is_handle(p)) {
> +			unsigned long handle = ttm_backup_page_ptr_to_handle(p);
> +
> +			nr = 1;
> +			if (handle != 0)
> +				backup->ops->drop(backup, handle);
> +			continue;
> +		}
> +
> +		if (pool) {
> +			order = ttm_pool_page_order(pool, p);
> +			nr = (1UL << order);
> +			if (tt->dma_address)
> +				ttm_pool_unmap(pool, tt->dma_address[i], nr);
>  
> -		order = ttm_pool_page_order(pool, *pages);
> -		nr = (1UL << order);
> -		if (tt->dma_address)
> -			ttm_pool_unmap(pool, tt->dma_address[i], nr);
> +			pt = ttm_pool_select_type(pool, caching, order);
> +		} else {
> +			order = p->private;
> +			nr = (1UL << order);
> +		}
>  
> -		pt = ttm_pool_select_type(pool, caching, order);
>  		if (pt)
> -			ttm_pool_type_give(pt, *pages);
> +			ttm_pool_type_give(pt, p);
>  		else
> -			ttm_pool_free_page(pool, caching, order, *pages);
> +			ttm_pool_free_page(pool, caching, order, p);
>  	}
>  }
>  
> @@ -453,9 +598,37 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  	else
>  		gfp_flags |= GFP_HIGHUSER;
>  
> -	for (order = min_t(unsigned int, MAX_PAGE_ORDER, __fls(num_pages));
> -	     num_pages;
> -	     order = min_t(unsigned int, order, __fls(num_pages))) {
> +	order = min_t(unsigned int, MAX_PAGE_ORDER, __fls(num_pages));
> +
> +	if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP) {
> +		if (!tt->restore) {
> +			gfp_t gfp = GFP_KERNEL | __GFP_NOWARN;
> +
> +			if (ctx->gfp_retry_mayfail)
> +				gfp |= __GFP_RETRY_MAYFAIL;
> +
> +			tt->restore =
> +				kvzalloc(struct_size(tt->restore, old_pages,
> +						     (size_t)1 << order), gfp);
> +			/* RFC: Possibly loop on -ENOMEM and reduce order. */

I'd say this is fine as is. If we can't allocate memory from an array of
pages here we likely pretty much screwed, right? e.g. We likely don't
have a chance of actually allocating new pages for the backing store
anyways. Also wouldn't the restart be broken if we can't fully track the
state of the restore?

> +			if (!tt->restore)
> +				return -ENOMEM;
> +		} else if (ttm_pool_restore_valid(tt->restore)) {
> +			struct ttm_pool_tt_restore *restore = tt->restore;
> +
> +			num_pages -= restore->alloced_pages;
> +			order = min_t(unsigned int, order, __fls(num_pages));
> +			pages += restore->alloced_pages;
> +			r = ttm_pool_restore_tt(restore, tt->backup, ctx);
> +			if (r)
> +				return r;
> +			caching = restore->caching_divide;
> +		}
> +
> +		tt->restore->pool = pool;
> +	}
> +
> +	for (; num_pages; order = min_t(unsigned int, order, __fls(num_pages))) {
>  		struct ttm_pool_type *pt;
>  
>  		page_caching = tt->caching;
> @@ -472,11 +645,19 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  				r = ttm_pool_page_allocated(pool, order, p,
>  							    &dma_addr,
>  							    &num_pages,
> -							    &pages);
> +							    &pages,
> +							    tt->restore);
>  				if (r)
>  					goto error_free_page;
>  
>  				caching = pages;
> +				if (ttm_pool_restore_valid(tt->restore)) {
> +					r = ttm_pool_restore_tt(tt->restore, tt->backup,
> +								ctx);
> +					if (r)
> +						goto error_free_all;
> +				}
> +
>  				if (num_pages < (1 << order))
>  					break;
>  
> @@ -496,9 +677,17 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  				caching = pages;
>  			}
>  			r = ttm_pool_page_allocated(pool, order, p, &dma_addr,
> -						    &num_pages, &pages);
> +						    &num_pages, &pages,
> +						    tt->restore);
>  			if (r)
>  				goto error_free_page;
> +
> +			if (ttm_pool_restore_valid(tt->restore)) {
> +				r = ttm_pool_restore_tt(tt->restore, tt->backup, ctx);
> +				if (r)
> +					goto error_free_all;
> +			}
> +
>  			if (PageHighMem(p))
>  				caching = pages;
>  		}
> @@ -517,12 +706,26 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  	if (r)
>  		goto error_free_all;
>  
> +	if (tt->restore) {
> +		kvfree(tt->restore);
> +		tt->restore = NULL;
> +	}
> +
> +	if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP)
> +		tt->page_flags &= ~(TTM_TT_FLAG_PRIV_BACKED_UP |
> +				    TTM_TT_FLAG_SWAPPED);
> +
>  	return 0;
>  
>  error_free_page:
>  	ttm_pool_free_page(pool, page_caching, order, p);
>  
>  error_free_all:
> +	if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP) {
> +		tt->restore->caching_divide = caching;
> +		return r;
> +	}
> +
>  	num_pages = tt->num_pages - num_pages;
>  	caching_divide = caching - tt->pages;
>  	ttm_pool_free_range(pool, tt, tt->caching, 0, caching_divide);
> @@ -549,6 +752,174 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
>  }
>  EXPORT_SYMBOL(ttm_pool_free);
>  
> +/**
> + * ttm_pool_release_backed_up() - Release content of a swapped-out struct ttm_tt
> + * @tt: The struct ttm_tt.
> + *
> + * Release handles with associated content or any remaining pages of
> + * a backed-up struct ttm_tt.
> + */
> +void ttm_pool_release_backed_up(struct ttm_tt *tt)
> +{
> +	struct ttm_backup *backup = tt->backup;
> +	struct ttm_pool_tt_restore *restore;
> +	pgoff_t i, start_page = 0;
> +	unsigned long handle;
> +
> +	if (!(tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP))
> +		return;
> +
> +	restore = tt->restore;
> +
> +	if (ttm_pool_restore_valid(restore)) {
> +		pgoff_t nr = 1UL << restore->order;
> +
> +		for (i = restore->restored_pages; i < nr; ++i) {
> +			struct page *p = restore->old_pages[i];
> +
> +			if (ttm_backup_page_ptr_is_handle(p)) {
> +				handle = ttm_backup_page_ptr_to_handle(p);
> +				if (handle == 0)
> +					continue;
> +
> +				backup->ops->drop(backup, handle);
> +			} else if (p) {
> +				ttm_pool_split_for_swap(restore->pool, p);
> +				__free_pages(p, 0);
> +			}
> +		}
> +	}
> +
> +	if (restore) {
> +		pgoff_t mid = restore->caching_divide - tt->pages;
> +
> +		start_page = restore->alloced_pages;
> +		/* Pages that might be dma-mapped and non-cached */
> +		ttm_pool_free_range(restore->pool, tt, tt->caching,
> +				    0, mid);
> +		/* Pages that might be dma-mapped but cached */
> +		ttm_pool_free_range(restore->pool, tt, ttm_cached,
> +				    mid, restore->alloced_pages);
> +	}
> +
> +	/* Shrunken pages. Cached and not dma-mapped. */
> +	ttm_pool_free_range(NULL, tt, ttm_cached, start_page, tt->num_pages);
> +
> +	if (restore) {
> +		kvfree(restore);
> +		tt->restore = NULL;
> +	}
> +
> +	tt->page_flags &= ~(TTM_TT_FLAG_PRIV_BACKED_UP | TTM_TT_FLAG_SWAPPED);
> +}
> +
> +/**
> + * ttm_pool_backup_tt() - Back up or purge a struct ttm_tt
> + * @pool: The pool used when allocating the struct ttm_tt.
> + * @ttm: The struct ttm_tt.
> + * @purge: Don't back up but release pages directly to system.
> + * @writeback: If !@purge, Try to write out directly to the
> + * underlying persistent media.
> + *
> + * Back up or purge a struct ttm_tt. If @purge is true, then
> + * all pages will be freed directly to the system rather than to the pool
> + * they were allocated from, making the function behave similarly to
> + * ttm_pool_free(). If @purge is false the pages will be backed up instead,
> + * exchanged for handles.
> + * A subsequent call to ttm_pool_alloc() will then read back the content and
> + * a subsequent call to ttm_pool_release_shrunken() will drop it.
> + * If backup of a page fails for whatever reason, @ttm will still be
> + * partially backed up, retaining those pages for which backup fails.
> + *
> + * Return: Number of pages actually backed up or freed, or negative
> + * error code on error.
> + */
> +long ttm_pool_backup_tt(struct ttm_pool *pool, struct ttm_tt *ttm, bool purge,
> +			bool writeback)
> +{
> +	struct ttm_backup *backup = ttm->backup;
> +	struct page *page;
> +	unsigned long handle;
> +	gfp_t alloc_gfp;
> +	gfp_t gfp;
> +	int ret = 0;
> +	pgoff_t shrunken = 0;
> +	pgoff_t i, num_pages;
> +
> +	if ((!get_nr_swap_pages() && !purge) ||
> +	    pool->use_dma_alloc ||
> +	    (ttm->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP))
> +		return -EBUSY;
> +
> +#ifdef CONFIG_X86
> +	/* Anything returned to the system needs to be cached. */
> +	if (ttm->caching != ttm_cached)
> +		set_pages_array_wb(ttm->pages, ttm->num_pages);
> +#endif
> +
> +	if (ttm->dma_address || purge) {
> +		for (i = 0; i < ttm->num_pages; i += num_pages) {
> +			unsigned int order;
> +
> +			page = ttm->pages[i];
> +			if (unlikely(!page)) {
> +				num_pages = 1;
> +				continue;
> +			}
> +
> +			order = ttm_pool_page_order(pool, page);
> +			num_pages = 1UL << order;
> +			if (ttm->dma_address)
> +				ttm_pool_unmap(pool, ttm->dma_address[i],
> +					       num_pages);
> +			if (purge) {
> +				shrunken += num_pages;
> +				page->private = 0;
> +				__free_pages(page, order);
> +				memset(ttm->pages + i, 0,
> +				       num_pages * sizeof(*ttm->pages));
> +			}
> +		}
> +	}
> +
> +	if (purge)

if (purge || !backup)?

> +		return shrunken;
> +
> +	if (pool->use_dma32)
> +		gfp = GFP_DMA32;
> +	else
> +		gfp = GFP_HIGHUSER;
> +
> +	alloc_gfp = GFP_KERNEL | __GFP_HIGH | __GFP_NOWARN | __GFP_RETRY_MAYFAIL;
> +
> +	for (i = 0; i < ttm->num_pages; ++i) {
> +		page = ttm->pages[i];
> +		if (unlikely(!page))
> +			continue;
> +
> +		ttm_pool_split_for_swap(pool, page);
> +
> +		handle = backup->ops->backup_page(backup, page, writeback, i,
> +						  gfp, alloc_gfp);
> +		if (handle) {
> +			ttm->pages[i] = ttm_backup_handle_to_page_ptr(handle);
> +			put_page(page);
> +			shrunken++;
> +		} else {
> +			/* We allow partially shrunken tts */
> +			ret = -ENOMEM;
> +			break;
> +		}
> +		cond_resched();
> +	}
> +
> +	if (shrunken)
> +		ttm->page_flags |= (TTM_TT_FLAG_PRIV_BACKED_UP |
> +				    TTM_TT_FLAG_SWAPPED);
> +
> +	return shrunken ? shrunken : ret;
> +}
> +
>  /**
>   * ttm_pool_init - Initialize a pool
>   *
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 4b51b9023126..98ce25197b38 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -40,6 +40,7 @@
>  #include <drm/drm_cache.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_util.h>
> +#include <drm/ttm/ttm_backup.h>
>  #include <drm/ttm/ttm_bo.h>
>  #include <drm/ttm/ttm_tt.h>
>  
> @@ -158,6 +159,7 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>  	ttm->swap_storage = NULL;
>  	ttm->sg = bo->sg;
>  	ttm->caching = caching;
> +	ttm->restore = NULL;

Set backup to NULL? Seems problematic if not set to NULL and driver
doesn't choose to set the backup.

>  }
>  
>  int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> @@ -182,6 +184,12 @@ void ttm_tt_fini(struct ttm_tt *ttm)
>  		fput(ttm->swap_storage);
>  	ttm->swap_storage = NULL;
>  
> +	ttm_pool_release_backed_up(ttm);
> +	if (ttm->backup) {

In patch 12 you don't set this to NULL on error. You will have to set it
to NULL their or change this too:

if (ttm->backup && !IS_ERR(ttm->backup))

> +		ttm->backup->ops->fini(ttm->backup);
> +		ttm->backup = NULL;
> +	}
> +
>  	if (ttm->pages)
>  		kvfree(ttm->pages);
>  	else
> @@ -253,6 +261,35 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
>  }
>  EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_swapin);
>  
> +/**
> + * ttm_tt_backup() - Helper to back up a struct ttm_tt.
> + * @bdev: The TTM device.
> + * @tt: The struct ttm_tt.
> + * @purge: Don't back up but release pages directly to system,
> + * bypassing any pooling.
> + * @writeback: If !@purge, try to write out directly to the
> + * underlying persistent media.
> + *
> + * Helper for a TTM driver to use from the bo_shrink() method to shrink
> + * a struct ttm_tt, after it has done the necessary unbinding. This function
> + * will update the page accounting and call ttm_pool_shrink_tt to free pages
> + * or move them to the swap cache.
> + *
> + * Return: Number of pages freed or swapped out, or negative error code on
> + * error.
> + */
> +long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt, bool purge,
> +		   bool writeback)
> +{
> +	long ret = ttm_pool_backup_tt(&bdev->pool, tt, purge, writeback);
> +
> +	if (ret > 0)
> +		tt->page_flags &= ~TTM_TT_FLAG_PRIV_POPULATED;
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(ttm_tt_backup);
> +
>  /**
>   * ttm_tt_swapout - swap out tt object
>   *
> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
> index 160d954a261e..4e4db369952b 100644
> --- a/include/drm/ttm/ttm_pool.h
> +++ b/include/drm/ttm/ttm_pool.h
> @@ -89,6 +89,11 @@ void ttm_pool_fini(struct ttm_pool *pool);
>  
>  int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
>  
> +void ttm_pool_release_backed_up(struct ttm_tt *tt);
> +
> +long ttm_pool_backup_tt(struct ttm_pool *pool, struct ttm_tt *ttm,
> +			bool purge, bool writeback);
> +
>  int ttm_pool_mgr_init(unsigned long num_pages);
>  void ttm_pool_mgr_fini(void);
>  
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 2b9d856ff388..6b990f1e7dd0 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -32,11 +32,13 @@
>  #include <drm/ttm/ttm_caching.h>
>  #include <drm/ttm/ttm_kmap_iter.h>
>  
> +struct ttm_backup;
>  struct ttm_device;
>  struct ttm_tt;
>  struct ttm_resource;
>  struct ttm_buffer_object;
>  struct ttm_operation_ctx;
> +struct ttm_pool_tt_restore;
>  
>  /**
>   * struct ttm_tt - This is a structure holding the pages, caching- and aperture
> @@ -85,6 +87,9 @@ struct ttm_tt {
>  	 * fault handling abuses the DMA api a bit and dma_map_attrs can't be
>  	 * used to assure pgprot always matches.
>  	 *
> +	 * TTM_TT_FLAG_PRIV_BACKED_UP: TTM internal only. This is set if the
> +	 * struct ttm_tt has been (possibly partially) backed up.
> +	 *
>  	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE. This is
>  	 * set by TTM after ttm_tt_populate() has successfully returned, and is
>  	 * then unset when TTM calls ttm_tt_unpopulate().
> @@ -96,6 +101,7 @@ struct ttm_tt {
>  #define TTM_TT_FLAG_DECRYPTED		BIT(4)
>  
>  #define TTM_TT_FLAG_PRIV_POPULATED	BIT(5)
> +#define TTM_TT_FLAG_PRIV_BACKED_UP	BIT(6)
>  	uint32_t page_flags;
>  	/** @num_pages: Number of pages in the page array. */
>  	uint32_t num_pages;
> @@ -105,11 +111,21 @@ struct ttm_tt {
>  	dma_addr_t *dma_address;
>  	/** @swap_storage: Pointer to shmem struct file for swap storage. */
>  	struct file *swap_storage;
> +	/**
> +	 * @backup: Pointer to backup struct for backed up tts.
> +	 * RFC: Could possibly be unified with @swap_storage.

I think longterm unifying with swap_storage is problably a good idea.
Kinda goofy having two backup mechanisms.

In the meantime, can you add a comment that is this is a driver owned
field? This confused me until I looked at the last patch in this series
where this field was being setup.

> +	 */
> +	struct ttm_backup *backup;
>  	/**
>  	 * @caching: The current caching state of the pages, see enum
>  	 * ttm_caching.
>  	 */
>  	enum ttm_caching caching;
> +	/**
> +	 * @restore: Partial restoration from backup state.
> +	 * RFC: Incorporate in struct ttm_backup?

I think having a standalone restore field makes sense. Also probably
mention is this a TTM private field and drivers shouldn't touch this.

Matt

> +	 */
> +	struct ttm_pool_tt_restore *restore;
>  };
>  
>  /**
> @@ -230,6 +246,10 @@ void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages);
>  struct ttm_kmap_iter *ttm_kmap_iter_tt_init(struct ttm_kmap_iter_tt *iter_tt,
>  					    struct ttm_tt *tt);
>  unsigned long ttm_tt_pages_limit(void);
> +
> +long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt, bool purge,
> +		   bool writeback);
> +
>  #if IS_ENABLED(CONFIG_AGP)
>  #include <linux/agp_backend.h>
>  
> -- 
> 2.44.0
> 
