Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E97C8B6AE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 19:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FADB10E6B0;
	Wed, 26 Nov 2025 18:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c5OP9HpM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0050E10E2BF;
 Wed, 26 Nov 2025 18:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764181346; x=1795717346;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=asY0ItH8cPKne5DCmOlwolugzqueDePxhr32Clj1Grk=;
 b=c5OP9HpMaj8KdfGzsfflZbxrOS3PYmZ+z10VA16J8NU0IbCvg2oCjokL
 3v4s1BsA31mvohcdZuq/heQIDwAKi39T2gHVcXZ6Qgq0kGP7puQczqyYR
 GiqAGcfgM2tTK3QeDXH37oohQWJnm5WgmBHDFjt0ur7zMULnu4aW45gK+
 SF6UlH+7RjuzxcvJwgvNmoyqaymgRk5Q+8Yn2FRxtXBPHJmEW+QBYIQJZ
 tcryrxVjA6HqMSXn7hDMgfIrE4tGrsfVJb/PrlbCd0irT9nXjjq5u1IIo
 ca6WXKUCIcYZuEmDu3D8hjJEa268u1jN3Nu7pE+qKwWRoq7YKwqMk8pyM g==;
X-CSE-ConnectionGUID: u7vja4rXS/CRclExH8mKBQ==
X-CSE-MsgGUID: 8nK+IADxQCix48Re5ZKaRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76913253"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="76913253"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:22:25 -0800
X-CSE-ConnectionGUID: T4PjQE58Sh2Dnfkd4jii/w==
X-CSE-MsgGUID: WBt/y5jBSXSX1nJ1321dSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="193242147"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:21:57 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 10:21:56 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 10:21:56 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.54) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 10:21:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPmVbCcXKvzidGUzTc4xeb0rt3YuEobhrNHd+I6l7lQbWe74yvy4vjgKIJZSzLbvagwTuLSNPFfr7DbbJ3ugXhPLrTwWyi3KH0IP1JEmVRtpj71pisQRyNTa/azbr2+2r5QdJ523R2TAUFTQkaC8FqlFFuvCLGIJfUafQxUkYY3cA1mcbHfzUndXe0f8TWMADnM4+Bx/GtqPQOTes6gomuIpUKt1bMN+BAPdmv6HImZboK8Stmzh2teo26+3UAGr6eZdQWygbaKb6wmwqkAdtT8MQlrJFqce2hp+0V+Bc9SQ4WFtGJvu57V2UbeOjNaVg+8vb6YgG8lYdc7NkIHe7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55mDq+SMOnrJMKzU734yj5/GBseC0f3SsZniscZse+o=;
 b=Vn3fTQC9P3TDMKjqXw+A5QKDc2pQ8dTrsDvG9GGTvMI6B++D8psHicS3hWxMX6RjQ4MNDQ+C+KOQOcwLX70x0outR2fSH/ZiqYehZySCEXmwqKrCSVjWlNHUPeo9dJWE9p+2/2L5BM3HwX0GtyQX6VRA1mto71ZsFv+h7Jo0qOjW9flzx5wkugUJbEfp806ppo6djc0bVO6ny/pimYXC5hBdXZFj9MTMrdeM5dECvGxe26JDQQlu33v7KtM5ngJzsyX0wXqMQgjcl3RcQEK6n5S+7r42TiH41sSafxLziag2LksFerlEw6vdVBk6U8K0P/P0M4SRrnCQsM2lOTvjaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5365.namprd11.prod.outlook.com (2603:10b6:208:308::18)
 by SA1PR11MB5802.namprd11.prod.outlook.com (2603:10b6:806:235::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 18:21:54 +0000
Received: from BL1PR11MB5365.namprd11.prod.outlook.com
 ([fe80::9e84:1ac6:7813:4af3]) by BL1PR11MB5365.namprd11.prod.outlook.com
 ([fe80::9e84:1ac6:7813:4af3%6]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 18:21:54 +0000
Date: Wed, 26 Nov 2025 19:21:50 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas
 <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Shameer Kolothum
 <skolothumtho@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>, Christoph Hellwig
 <hch@infradead.org>
Subject: Re: [PATCH v6 3/4] drm/xe/pf: Export helpers for VFIO
Message-ID: <7i7dbkht3y2cqjtv6ojabph34c5o7s6qmddgax2wf2iv2hk4fl@35smvs5brdld>
References: <20251124230841.613894-1-michal.winiarski@intel.com>
 <20251124230841.613894-4-michal.winiarski@intel.com>
 <20251125113403.6156f03a.alex@shazbot.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251125113403.6156f03a.alex@shazbot.org>
X-ClientProxiedBy: VIZP296CA0005.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a1::13) To BL1PR11MB5365.namprd11.prod.outlook.com
 (2603:10b6:208:308::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5365:EE_|SA1PR11MB5802:EE_
X-MS-Office365-Filtering-Correlation-Id: ac2dcb46-40b6-405b-de59-08de2d18ace3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkM2ZTBUTmRWZG9wOTA4Z3lqclpzRWF5Mmswc3FGWUMwbHFCQy96WVI5bmlG?=
 =?utf-8?B?dFhaVUo4Wng5b0gyYW4wMmJxemxXcFhscW8vM3ZWTlhEOThGV1RscVc5ZTlR?=
 =?utf-8?B?TE9rK0VKdGFZcmg3dEVxckhQTmhLRXlHNGFIS1lRcFdob2N3ai9GSUU2c2VV?=
 =?utf-8?B?eEJTUnpGcWxZNUQwemNkRkZFb3VubXVZV05rV2tOeGYxSEloWCtIVjBkWEo4?=
 =?utf-8?B?MHBZRk0xTk9QUTlDNUsycXBkdUVlcDJYd1NNR3Zna3czYWFsbE0rWUtlVTBl?=
 =?utf-8?B?anBRVlBkdGpNazUzajdaSERySGJGdk1waG5kekk0R2JFbnpoVEU5STEvNk04?=
 =?utf-8?B?dEUyTzQ1ZTZDcGRFcGV2b0hnV0dyWVAveSs1cjVVT0FBaGlPckttWkxmRmxi?=
 =?utf-8?B?S3JUUDd2b2cySDBpRkpXUGV6c3VMSnFqTnFkYzVBL1k0cGlxYUhFVkgyVWk5?=
 =?utf-8?B?TUlPSjRWYTJja2N6SW1QZUZzRTdKaldEa1VYTjJrK3U2WWZ6bVZDMHYxWElL?=
 =?utf-8?B?M29CVkpKNTI3WSsxOGI2N3FjYUtoTzJjNW5aZTI0Q2x1WHZ2b3BOV0pEMmZT?=
 =?utf-8?B?SkxXQTJYY21BdmxKcVp5bldRUGJwaGpLcC8rZE9MNTRVdWtMVHVwdzR3VUVh?=
 =?utf-8?B?eW1jM0swVlhYUkJJVFd0WjF1MmgrUDJqbGhUaXArZGE3VWl3bFBCalBON0tj?=
 =?utf-8?B?L3R6djlmWU90eXhPZ1RaNUNpYU9OS3JybzRGZ1Y5V2Y3cXpaT1g5ZzJnZXVn?=
 =?utf-8?B?ajE1RGpGZjFId1JVRlJjNGxaeUpPZzR3anVZYkZ4RENlNnJuQ3ZpaFo4bXVR?=
 =?utf-8?B?Tk1jOTJLeStEMFJ1QkU0RFl4L3lTSGFnc004SWVBVVhkVFY1aXIvYVdISmZP?=
 =?utf-8?B?eUtaUXphd3NEZHlYMGNpYmR5NXFQNXZ2WEE2VlBhdHNrRk1VZmJSdGlieVdS?=
 =?utf-8?B?N1dxTHBqQUlxWTB1a1duWHQxK0NHaFdqQXpyZkN2WEJXNEpKUUlyTG16VjJR?=
 =?utf-8?B?WG51cnBoK1Y5b0pOckNXU204VU9HalZ6elJ1QloyRldLa1lheWtLaU1JWTJP?=
 =?utf-8?B?ejdDNFVyZXdxMlZWeXVMdjZPVzc1WTBsSGJxMlFSVG9VZUFEUjYyV292K3Ja?=
 =?utf-8?B?T2xZbkpmR3dBUXlXUzJFSHpDOXA1b09SR2E2Nm1VL2tuWktlNmI3NEtrdGNs?=
 =?utf-8?B?UXI0SFltZzhJa2YrMTI5SHVsVjh0U0Q3MFVOVG5SanlsTHlBTVRrRys0WFhE?=
 =?utf-8?B?aEJEUGxqRlFxaTFLei9nVTAvYm91SXpGT2d5WmgrcXB3aU8vUkM4ZTRLOHpV?=
 =?utf-8?B?aHM0OU1pdVVmSUkrR0lJNXVkai9vYXJLa3IzckZxeTRIcE5jWUNxM0hzWUZX?=
 =?utf-8?B?eHlPMHdRTytaMkpEL1ZOd0VpTCtma1IvL1FGeUs0dHJHMkd0NVBzRm1qLzN6?=
 =?utf-8?B?WEpUVitlM201MXQvOGtuRzRxemRQTndYYlJ2b3FxemI1MVJINzg4M0tLaWF6?=
 =?utf-8?B?WDFHZm1UQktKSWxGWCt0SVlCRkhlVHFYMEJNYUNuVVlxU2ZobTQrRE81L3ky?=
 =?utf-8?B?MEtRYnlWSkl6d3ZDM2paT25rWFAxUlBVZFdpSHUwM213RlNXT2pVWWJSSXBk?=
 =?utf-8?B?RU5Qc0ZRUGtBb2ZhelBDMmlHM2VnS0pvSTBMMVRvNmY2TzJ4cVlYTWZ2VDQx?=
 =?utf-8?B?WitUSE5mdjBUZHN3WkMxdStKUU1rcjNNQjVCRmMxM2dkcjlQUlJlMWZvNHpS?=
 =?utf-8?B?Z3ZBZFAydGR3YzZDZHQyUzhyYVdrRjZIQTNCNGd0WmFya1N4SWlzb1AyM3lv?=
 =?utf-8?B?MW0yOGgwUldMVVh1S0h2RGU1SlZmR0xvSHNheUhpaVp2VERnVDR6TmFBdXRz?=
 =?utf-8?B?c2Q0WWltOVl2RGJMVmdBUmwvMGV3OWVHRXFkWStMWlJoV1FwQ2pKTEM3Y2tR?=
 =?utf-8?Q?/2+dODJS7W73CN8sprX+VCHRjVHZWac3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5365.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aG9INC9TKzY1RTRUeXZwL0hxY1RPS2JhMXZURGJzeFJlc3JweTRwYTFBN255?=
 =?utf-8?B?TlhnZDU0bS9GOC9VRjh5alJvekczSXk0bWpnK25WVmVmR2Z1aWY2NUpsRTNG?=
 =?utf-8?B?b29aQUJTUE1VUXdaRVl0ODRabXN6Mm9ZY3ZqdVczbmFoREVUaFpmUy9KU2xt?=
 =?utf-8?B?bzJrbHpJU2Ywd2VycXV1ZHQvV1lMVjVkSFFYOEkrNG54SVZibkNqRUNaRjgv?=
 =?utf-8?B?Q0lxc0VXTlc1bU9wanNNQWlubjlZaXlvbGhjT0xLdndaOE5hd085Mmh3aTJP?=
 =?utf-8?B?QzlRTVAvSkYwTXVneFdMMVVpdlpGa2dZQURqbGxzL01PVTV0SGJ4bGM2SnFr?=
 =?utf-8?B?cyt4MkVLdzQ3WHJKa2pJRmgwL3hYTFZJQVZhczBWekFJK0hUNUtBNVMrVjJZ?=
 =?utf-8?B?a1dZU0IzcUl1cXhtcDNNVGVBL0t6eXFCSk53TGlPbXhGQmtGeHUwcmRmeWlu?=
 =?utf-8?B?OGNycjZqZUxWYUoyajh2YTRtdU16b2xGYm1pRDVmZFQ1QzdEL3lRSmJQRHVy?=
 =?utf-8?B?aHRlUnJtbWNsbldrSzgxdG5pTWlEei85SmZpRW9FMFRwR05HdCtoQTgvNkgy?=
 =?utf-8?B?THovR3JnQ0JhSkEwNkJ0aGIrOGQ3TEkzK3RtQ2V1T1NrclFDNWM0Q2FyOGNE?=
 =?utf-8?B?NHVlRnRKNGp5Um9EeXJBSGFoWm9FQlFFbGNBVldVK3lPaW5lNEdrZWx0REdF?=
 =?utf-8?B?WXdRTm9lTnhxU296K1BIaEYvOFJDa2IzUE9OWHQ2S0haQjBydkJLZ1hFVkJO?=
 =?utf-8?B?akJJSHpBOTdvcVcrdlhkQTFOTnJqemE4YzhiRThpTnB1RmUxWWVHdUVvaEtz?=
 =?utf-8?B?QXl0T2JENlcvTUdqeVYwb0J0M1N6bHZOZVZ5eFJ0cTdBbjNwbXZQWW5CazMr?=
 =?utf-8?B?OVJIcitTUmwxS3VBM0ZHRzFvVmlLZXJTdTNmQ0lFUS9MclhDY0RVOC91NEVO?=
 =?utf-8?B?R3M4eGUyT1pYMVYvMG82RThheUpYOGNhZTg5WGdTeTRXVWtNdDJqL2RpZmZR?=
 =?utf-8?B?Tnd4YmFKdTZuNTY5eGxMR1hxaW42OVZiajFMajRmMmd2RWI1bjRnbjMxQUJY?=
 =?utf-8?B?ZEJtZExhVmZ1bzRMNGMyWDFsVnQ1N0J2SXVqSW5IYVhHcEFFVkpZRFdLYU41?=
 =?utf-8?B?ZTcwdjM4cEtUdTJ1WEMyTEhXS0I1T0t1VDlLaXVydVdTVWxjc0FKVTBJYzh3?=
 =?utf-8?B?TEpCd0N3Q1Q0WUtocWR4OGFreG5uWTdGUSthNDJJU0J1YThzU3hBSFFLbHRS?=
 =?utf-8?B?anlhWkx5SDNjdFh2SS8zZ3M2YkswenJNVGRSL1ltVlVLUUZLdlI2aituU2VY?=
 =?utf-8?B?YXVQbXlvbm9namQ1Q0tWYVExTmNEOGZ4WWNXY1Y2MWZJK1JBY3pRRGFrNlhx?=
 =?utf-8?B?NEcrZ1Mxb1hOLzdSWHhWOUxhWGNUZy8vb2RuME5FV1UySUVBUlVjWHhqTzdB?=
 =?utf-8?B?bGN6cUtGUXBINVo5SkVTSTExekh1NFhIQ2FHYnU5SjVyeEg4ZHJZd0YzYVhY?=
 =?utf-8?B?WTlrZDAyRXdsMmZ4TXB5S2U1LytFRERsZzhQMHBqUE5pT0t1cXRMUWIwSmxi?=
 =?utf-8?B?WW1TZDhsejFqdDNkdDJ0YjdMenEydDdSdkEzYWZsNk9RVzhkQlV6eC9ySnc4?=
 =?utf-8?B?M1Y4Zi9JT3RqWW1QUm1kZ0RxUjJ3N2d5alAwOXVCcFhxa3lDdWdJUW1LbHFS?=
 =?utf-8?B?M2t2dTQ1ZVJ4RGgzaUkrZWc2aFpxeXZWdXQwMkZ0dGlBZE42N1hwQ2JUTnYx?=
 =?utf-8?B?VHNsdjkycTI5d1B1QjVCaC9oYW1iSEl6cno1SlhrakhHTUhzM3YrWktoditV?=
 =?utf-8?B?WFAyNDZvejJ5RWgvYmtWQ0ljei8zZER5US9aVG1jSUtxUEV2Z3h1MXB1Rm1x?=
 =?utf-8?B?QjdxWjZRZFpmNHorN2dzQ0REbEJWRkVqbGRBcnpwQTB3YnRSZUtlTTBBVk1h?=
 =?utf-8?B?azlGK1NWODFrVExNcHcxMlJjVTRHSFZvT2VYVnVRWS9HUnVGeEZTeU1FUW5y?=
 =?utf-8?B?cDlCR1JPdWJxNFpuVlJZWm42b0dJWU5xTlBFQ3NqZnBQcEY1T3paZkI3eVJR?=
 =?utf-8?B?SmFUUHpnNmpvOHhrZjFxNUZsQ0syQWloOFg2R3REd1IweSttTGFBQys3RFpO?=
 =?utf-8?B?VldpWXVMaFdTdnAwcUFrdS9PbDdiZDkrT2FMM1ZBdXU5TS93eEJXMC9ZNnlv?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2dcb46-40b6-405b-de59-08de2d18ace3
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5365.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 18:21:54.0090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yLXUfHzZHLTRnZAEhBwdnYvklnQnujuBpE2edImclmq4kotMQyWEQqQkWYNgj9TuIVFNhJBcd3mjJwpMriux47zdAUVFKxjlloRqsPOccUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5802
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

On Tue, Nov 25, 2025 at 11:34:03AM -0700, Alex Williamson wrote:
> On Tue, 25 Nov 2025 00:08:40 +0100
> Michał Winiarski <michal.winiarski@intel.com> wrote:
> > +/**
> > + * xe_sriov_vfio_wait_flr_done() - Wait for VF FLR completion.
> > + * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
> > + * @vfid: the VF identifier (can't be 0)
> > + *
> > + * This function will wait until VF FLR is processed by PF on all tiles (or
> > + * until timeout occurs).
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_vfio_wait_flr_done(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -EPERM;
> > +	if (vfid == PFID || vfid > xe_sriov_pf_num_vfs(xe))
> > +		return -EINVAL;
> > +
> > +	guard(xe_pm_runtime_noresume)(xe);
> > +
> > +	return xe_sriov_pf_control_wait_flr(xe, vfid);
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_wait_flr_done, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_suspend_device() - Suspend VF.
> > + * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
> > + * @vfid: the VF identifier (can't be 0)
> > + *
> > + * This function will pause VF on all tiles/GTs.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_vfio_suspend_device(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -EPERM;
> > +	if (vfid == PFID || vfid > xe_sriov_pf_num_vfs(xe))
> > +		return -EINVAL;
> > +
> > +	guard(xe_pm_runtime_noresume)(xe);
> > +
> > +	return xe_sriov_pf_control_pause_vf(xe, vfid);
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_suspend_device, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_resume_device() - Resume VF.
> > + * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
> > + * @vfid: the VF identifier (can't be 0)
> > + *
> > + * This function will resume VF on all tiles.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_vfio_resume_device(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -EPERM;
> > +	if (vfid == PFID || vfid > xe_sriov_pf_num_vfs(xe))
> > +		return -EINVAL;
> > +
> > +	guard(xe_pm_runtime_noresume)(xe);
> > +
> > +	return xe_sriov_pf_control_resume_vf(xe, vfid);
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_device, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_stop_copy_enter() - Initiate a VF device migration data save.
> > + * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
> > + * @vfid: the VF identifier (can't be 0)
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_vfio_stop_copy_enter(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -EPERM;
> > +	if (vfid == PFID || vfid > xe_sriov_pf_num_vfs(xe))
> > +		return -EINVAL;
> > +
> > +	guard(xe_pm_runtime_noresume)(xe);
> > +
> > +	return xe_sriov_pf_control_trigger_save_vf(xe, vfid);
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_enter, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_stop_copy_exit() - Finish a VF device migration data save.
> > + * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
> > + * @vfid: the VF identifier (can't be 0)
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_vfio_stop_copy_exit(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -EPERM;
> > +	if (vfid == PFID || vfid > xe_sriov_pf_num_vfs(xe))
> > +		return -EINVAL;
> > +
> > +	guard(xe_pm_runtime_noresume)(xe);
> > +
> > +	return xe_sriov_pf_control_finish_save_vf(xe, vfid);
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_exit, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_resume_data_enter() - Initiate a VF device migration data restore.
> > + * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
> > + * @vfid: the VF identifier (can't be 0)
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_vfio_resume_data_enter(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -EPERM;
> > +	if (vfid == PFID || vfid > xe_sriov_pf_num_vfs(xe))
> > +		return -EINVAL;
> > +
> > +	guard(xe_pm_runtime_noresume)(xe);
> > +
> > +	return xe_sriov_pf_control_trigger_restore_vf(xe, vfid);
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_data_enter, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_resume_data_exit() - Finish a VF device migration data restore.
> > + * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
> > + * @vfid: the VF identifier (can't be 0)
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_vfio_resume_data_exit(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -EPERM;
> > +	if (vfid == PFID || vfid > xe_sriov_pf_num_vfs(xe))
> > +		return -EINVAL;
> > +
> > +	guard(xe_pm_runtime_noresume)(xe);
> > +
> > +	return xe_sriov_pf_control_finish_restore_vf(xe, vfid);
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_data_exit, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_error() - Move VF device to error state.
> > + * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
> > + * @vfid: the VF identifier (can't be 0)
> > + *
> > + * Reset is needed to move it out of error state.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_vfio_error(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -EPERM;
> > +	if (vfid == PFID || vfid > xe_sriov_pf_num_vfs(xe))
> > +		return -EINVAL;
> > +
> > +	guard(xe_pm_runtime_noresume)(xe);
> > +
> > +	return xe_sriov_pf_control_stop_vf(xe, vfid);
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_error, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_data_read() - Read migration data from the VF device.
> > + * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
> > + * @vfid: the VF identifier (can't be 0)
> > + * @buf: start address of userspace buffer
> > + * @len: requested read size from userspace
> > + *
> > + * Return: number of bytes that has been successfully read,
> > + *	   0 if no more migration data is available, -errno on failure.
> > + */
> > +ssize_t xe_sriov_vfio_data_read(struct xe_device *xe, unsigned int vfid,
> > +				char __user *buf, size_t len)
> > +{
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -EPERM;
> > +	if (vfid == PFID || vfid > xe_sriov_pf_num_vfs(xe))
> > +		return -EINVAL;
> > +
> > +	guard(xe_pm_runtime_noresume)(xe);
> > +
> > +	return xe_sriov_pf_migration_read(xe, vfid, buf, len);
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_data_read, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_data_write() - Write migration data to the VF device.
> > + * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
> > + * @vfid: the VF identifier (can't be 0)
> > + * @buf: start address of userspace buffer
> > + * @len: requested write size from userspace
> > + *
> > + * Return: number of bytes that has been successfully written, -errno on failure.
> > + */
> > +ssize_t xe_sriov_vfio_data_write(struct xe_device *xe, unsigned int vfid,
> > +				 const char __user *buf, size_t len)
> > +{
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -EPERM;
> > +	if (vfid == PFID || vfid > xe_sriov_pf_num_vfs(xe))
> > +		return -EINVAL;
> > +
> > +	guard(xe_pm_runtime_noresume)(xe);
> > +
> > +	return xe_sriov_pf_migration_write(xe, vfid, buf, len);
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_data_write, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_stop_copy_size() - Get a size estimate of VF device migration data.
> > + * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
> > + * @vfid: the VF identifier (can't be 0)
> > + *
> > + * Return: migration data size in bytes or a negative error code on failure.
> > + */
> > +ssize_t xe_sriov_vfio_stop_copy_size(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -EPERM;
> > +	if (vfid == PFID || vfid > xe_sriov_pf_num_vfs(xe))
> > +		return -EINVAL;
> > +
> > +	guard(xe_pm_runtime_noresume)(xe);
> > +
> > +	return xe_sriov_pf_migration_size(xe, vfid);
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_size, "xe-vfio-pci");
> 
> The duplicated testing and identical structure of most of the above
> functions suggests a helper, if not full on definition by macro.
> Thanks,
> 
> Alex

I'll convert it to use macro definition for everything except
xe_sriov_vfio_data_write/xe_sriov_vfio_data_read.

Thanks,
-Michał
