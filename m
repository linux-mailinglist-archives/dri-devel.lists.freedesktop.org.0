Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D644BBD0C88
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 23:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D02710E13B;
	Sun, 12 Oct 2025 21:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="itde610m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C0110E061;
 Sun, 12 Oct 2025 21:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760303231; x=1791839231;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x3B7NmRkDUC8ZOutb85y3FuUq4LrqgscmvCgzx94DC0=;
 b=itde610mCTBRLDuAijnUphwCpNp0I7lAF5GJp/FFjcz69WlPWW7qnVP7
 us2v9FvGDaANRHl+fKQuB/1hMXpdLhqSOOH7o9WILQbLMCdP0Pn8uJyTm
 1gMM/4e6FvybvVT6oxFH/mbVmavDXSlioY82gjbmUL7GA8Jm0GQOMHkV5
 MTjYMASI/Mpi3iOvITiqQjoZNUXv604rgFyGVec4ByK5+6PQpOzvWShl8
 od92Niz54Swsod4P+/jVr3zD6g106oBRmwiMrqoNYqHn+L9HCfkxc0FDm
 Uux1U2CShnhhsoOM5AOc9f3wExFwaIw1BagAajaG4umGZzv98nRAe3R2q A==;
X-CSE-ConnectionGUID: I6HMZ0GpRrqsMVMvx88tZg==
X-CSE-MsgGUID: gonnClUzRzyJ35YLAcG+sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62334893"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="62334893"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 14:07:10 -0700
X-CSE-ConnectionGUID: Kwwp4abbSTSng2YXwed4ew==
X-CSE-MsgGUID: mgu6wMa0TL62eW2mmw1row==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="212400717"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 14:07:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 14:07:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 12 Oct 2025 14:07:08 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.41) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 14:07:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sK1d5QHuDWEoiKfmMHfkPWanjR3mpkk2m5Nx6UfUTKqTRXcTPjFJ2LMT+494cFgfn4ubLyNbjO/RAv7JZEM+TQSEgYJ7rQbBH8SuNkIZjpZDMtIj7FDnlxdovevAu7jq8ZQWfL3pdnvpcfE0ldoKu//zsg4eTtAQ4F3weZJPu16Y+SXvqFcopKEfcg+LQH0EaS/lG50tU68k5e8c9jpOoqHaHOG6kEyCiUwMETwQq2mDmlE0rsLECwh1jC0aeK+VJZQ1zxM5k8UahZqJxsDKF7alERfPFsYVcU9uqTBXpjlA6b7sLjN9OsEj4hLPuXB1OSKIgLi0+weWhOOIShRtCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fq4C6JkwE/mCNDFqJWktSVTQhrT4yFzR9X/UpCDuueI=;
 b=PJETcgVLTcodUXZYhekhAJGRssRwtnRMM+qdZxjVJEm1Jcpxzygx63NOvp4rRXeAedLa9fLSTUZ31U0reUD2ExI0hPmvKqyeeRc/KElw/6aQz5peFvmFIExt6bhpdwmrrVdfO33xORZZRHSyDfg/Y5A8BT6lT/XY1LB6CTMGPbMAdHp+sDqanANCdJ31AtbzzSJ0kJHRqtEEiNo+GZvG2MfQHRLippgZAb0dzy4RKP1RLJ08/580psf6eTjEbbtSbMCRIup3GCdwAPj0SeU6Zy0Mtm+cdY9URRYlpxCLvIULedo6kwDb+mlI3nVjDFkeAxvoH9ZUPa7MwGT4wLt2cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM4PR11MB6096.namprd11.prod.outlook.com (2603:10b6:8:af::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Sun, 12 Oct
 2025 21:07:06 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9203.009; Sun, 12 Oct 2025
 21:07:06 +0000
Message-ID: <2f39ed42-57b0-41fc-8577-d7a73814bb95@intel.com>
Date: Sun, 12 Oct 2025 23:06:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/26] drm/xe/pf: Add data structures and handlers for
 migration rings
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-6-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251011193847.1836454-6-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIZP296CA0017.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a8::9) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM4PR11MB6096:EE_
X-MS-Office365-Filtering-Correlation-Id: 30885973-40ba-45fc-46d0-08de09d34ca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RC9YU1FVMjVlQmRPV1BsdHo3dkFURnYrWndIQVpTRXZWYk41Ly9kNlRVREQv?=
 =?utf-8?B?ZDJIWUlYbWx4OVlDWmRZdmJEU0dLTzFUNjJhck5PbkFVRDJLYVFuSGt1eXNQ?=
 =?utf-8?B?SGwxVmdOZHhGUVU0cTVzQ1prVXVGWExNQkxCUyttWWpUVkdWU3I4NEV4RUo3?=
 =?utf-8?B?ZE9JQ3dYdXE0WGdTUUMvRzlYblFJclN0ekpBbWxNOHpDUkFDTVEvYzUvNlQr?=
 =?utf-8?B?ZmpZVjcxRVp5cUxZSXVna1VEWDZQSk5RcmEzRW1pdGhRNW4yRFlFaTl5QVdQ?=
 =?utf-8?B?Y05zaUc5OVRHbU56QjdpOUFwMEVYejkxbWJ6ZmxHSFRDMTgwV093YU1xRUNE?=
 =?utf-8?B?eVFlOG5Ub0YveEtjcUp1WjR4Si9ZMGh4TGttY0J6QzZ4WFoySmhPeG1TZ3hM?=
 =?utf-8?B?WlZ3MWM4WmJSQXQxeVY3Q3FYeVFKemtGOGlycHptaU1UT1A3RFJQbGEwczE3?=
 =?utf-8?B?TGhaMmNuWmZmeER0ejZ5L09Cb1ZJTGZMeDFubitUWkZWYzBDRkZHaTdKdlBI?=
 =?utf-8?B?WXNnREFmdWVYU2tyd01QbFJoRmhuY3NydzFUUjl0N3VWZ2dGbUpLYnQ3akJJ?=
 =?utf-8?B?VDgzbWJ2cVVlL21RRDFJeElwbFh2SDFMSVNSNXZFNWVvSEl2Wkk5cWlTaXhB?=
 =?utf-8?B?b3E1NkwwM3hLT1hFQWtNM1FiSzJVSHJjVkQrVGIwMlB1b0VCYnRzb1RTUDk0?=
 =?utf-8?B?Mk1rRjAyZEVkM0ZxZklxR0RPTFA2ZXYzYy80d0xTT3VYK05mMnZGSkVtU2x4?=
 =?utf-8?B?bnVNWFAzc052VVRkZ0F4UVZENFJmOTlJUXNabWtWanU0ZktBMlJMWCtFQlFK?=
 =?utf-8?B?VDRXa2ZXQUYrV0VndTVDbml4MVlXVlRyckIxRDlLNnZUOTBocGFLQ1NRVkpP?=
 =?utf-8?B?V2VRYmhTaUZHaTJFc3Zxa081VlpWdS9pTHB3WHdmSi9FZ29FYmhWSkZBWWJC?=
 =?utf-8?B?aURCeER0enA5S3pNQXdYcWJLbGk4VllZR3gxRlUzNzRVMWFGZ1pPWldsSG5p?=
 =?utf-8?B?VDJ4RkFuTVhRNDVHYmNuck82Z3paWnFEaHNrRFdrUm85M1B1M0M0d0QzemlK?=
 =?utf-8?B?ZXVPU2dvZ2FyQTd0R0Q4bzQ0OVdGekRqL0RmYXNpdHNlekFKUzNTak5PM3VB?=
 =?utf-8?B?L1FkTUcvYVBncUFZN0EzaEVWdVpUWnNYbFF0UFVlaEJVNWlSZEhPZkJXUy9T?=
 =?utf-8?B?UkpuanZodFAyZmtUNjk2anVlTjdMWVpFYmlsZWgrbmZyRkpqbG8veFM1SnJC?=
 =?utf-8?B?S3ZZc2lweXZPbmFESURqeEJJWE9vclQwWjN3VTU3ZDN1RnZhZkszcWZXb2c3?=
 =?utf-8?B?cjUvWkxIV1g1L09PVHVBb3BSNHFBajBxUXNBcnhRYUZMY3NSRGxKd2Zxd0h0?=
 =?utf-8?B?Wm1pSUp1MFhwQUhDRldhTWZDbHBtWDBGZ3VEV2ZLbERiWHdBMEpuWERMTWFy?=
 =?utf-8?B?RFhTdGUwbThFZmRnVnhVY1NNcVZNYWNaWWJTaXd3cVZWYUhiOUxmRElUc21k?=
 =?utf-8?B?a0hxUzF2UUNzSUZnNDNEcGNYbHI5WnJxckw4cWNsdXRYZmlIUmlyTnVIRkRR?=
 =?utf-8?B?MzNFTzdjMVNWUzlqT1VkdGQxMHlnSHUvWHV1TUVRajhRUk05NWoxZWNBWDBZ?=
 =?utf-8?B?c25BVXl0TG5Dc1g4VXJQVS82Y2ZKODdGNEYybFpkbHVDWVJienFjM1FHS3VC?=
 =?utf-8?B?VUJ4cytiaEwvZk5VMGpXZ3FicGlsV1JaSHJ3NzViN1lUZUlVaGdPZWNKSGRV?=
 =?utf-8?B?UFRXdjByTWNUdXhIa1RkQXhXWFJOVHlscVNTMEdYdHRQN1orTWNDUE9qMXRS?=
 =?utf-8?B?SG5rQkVlTDZlTi96RlJVbEE1RnpJT3ltbCtWRzluSUI2Wkprcm9GRWJnOVdD?=
 =?utf-8?B?dkV4RXQ2WWlmdU1KNlV2Umwwd3BQc3JnWU1pazBUaENkenNUTnRmTlo1STRQ?=
 =?utf-8?B?Q0p5K1lHNytwZ25sUURYOE1pL2ROZnY2bWtHendoTmZ1U2NhQWxvZm9YMWtX?=
 =?utf-8?Q?4Yl/Z4fl5Ug6fKfDv/BqL7LnC5HUCg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUtPdjJOZytiS0JJbWsrVlVYbkRMNzVwTHY4TnV5TlB6STg3VlJONG5jZDBk?=
 =?utf-8?B?dlBKY08vY1QxOWJSUk5wS0taYWFlVFNkbVAzaG1wdXJIRVpJOGhoMWtLdkFX?=
 =?utf-8?B?M3RPbDd3dCtIM0N1dHl4aTNjQUJzOFdjbWFDeVdrWmhRWEcrWUZvaXNJR1JS?=
 =?utf-8?B?RC8yWjl1MW0xaGVFRkJkZ01YbEtObTBVNjBhSWh4Yit6QU1GSUZOelJOQTBZ?=
 =?utf-8?B?c2VkVFZMdHpsNGtjUVZPZmtwNjRMREZSbkJueU5ScGpwR3ZOQTViTGxReUxO?=
 =?utf-8?B?OTFFTE9JdHZYM3JPVzd2TWgzOHhzeDlEVUNRUTFFdzlWOTZJRWt2bFZlV002?=
 =?utf-8?B?VWdyRHdzdU5rSUQ2dkdseEt6NWN2SVRQRnNBQ0Z3cktSVHhCbU5sNHQxWHNt?=
 =?utf-8?B?S2w5SFU2WjV3QzN2RVI4T1UyY1l5cFViMzk4VlRtVElIdUhLOHltdTlzekZ1?=
 =?utf-8?B?OFBrRStTNlVkbkNwaWs4bmllc3F3bFVwRDdONHdNS3lOU1d2RnlnZTdrUXZn?=
 =?utf-8?B?Y0EwTm5wQ0ZvNU9jMldYY0QvL3k5MExlL2dVa2VDV2h0b1JwT3pWQUtzYnZa?=
 =?utf-8?B?aVBlamllNFN6YWpvZHUrbGFLRldpdkxheXU0Vm5YSjR3akRhYlY0YThZTDF1?=
 =?utf-8?B?eklMUXd4dS9Jc3NpbFNYSlQ4VnBEWjY1TU9xaHJ0NmFJTHBvTEk5aFg3MWpL?=
 =?utf-8?B?UEJ6bWc4dGRaYmUxbmpNaG5seUE3eG5ZYzB4OEQ2am9FSDFMZEVlOGF0eGk2?=
 =?utf-8?B?UitoZE5tY0p1bTlIRUtZN083ZUlyeFFmRTBFSnBmVm55STJ0TVU0OXhFSXht?=
 =?utf-8?B?YlhLRFM2MzBrVnNUSUtYUXdJT3VVbjFWK0xLTm80NE41azJTR05OQ1FEV3RJ?=
 =?utf-8?B?QmlRTjBwQWZlUk9vbktQSXMwTExHSFNQU2ZaR0E1VFBtMUlGYnhVaUt1cXdG?=
 =?utf-8?B?dkhDVzlQajJSQzZlQ2ViN0FsVGJ2S3dBMXZZdVpGOFAyS1UxMWRUVkRjVldw?=
 =?utf-8?B?Q3dJRk9OYXlVeE1tVzh5MkRFU1A1aEk2cS9YYjA4alRUUWRGdldFUmhVZnZh?=
 =?utf-8?B?U3hKcDVpU2dpNmZBRjc5aCtTeG5vM2tqdmNmYndzbzlxMkdlUStabEhHR3ZG?=
 =?utf-8?B?V2hFZmFFR2Vlb1lEUEFjaEtIMFZ4UG13UTV2SnBJVXZFQ2ljczVsNUZZMXVD?=
 =?utf-8?B?ejVOaG9QR0hUOU1XOW4yVjFjUzAvT1M3cFFhV0hocjJhWEVtVTVLY2Rsc3Fs?=
 =?utf-8?B?eGI1UStuQk1yYTl5M3VwcThBai9ucW1TZ3ErL2FuSjhjU3FGOWNOL0JLaDJ2?=
 =?utf-8?B?S1NFUzhaemQ4UkRzSHJGWUN2a21CUVBtUU5nTHVZc1dZQkl4a3ZvWTlrL0xa?=
 =?utf-8?B?djM2Y0NZVStNSzEvS3prRmpPK1RGd0hKR29xeXk0L2Q3azZUelUzWUhVMTlB?=
 =?utf-8?B?b1ZlaHg1NmJWeGoxOW9mSVQ3WDFjZGpUbUZKQysxcHFqUEZab2Z4U1MzbW9k?=
 =?utf-8?B?NzJjdjJZVG0zbCtEZTZFOXU4aDMwZ0FuaXlBTXhDbEJvWHA5cXhPUVNEbmtk?=
 =?utf-8?B?a0kvTDh2WTZNYXZhcEhzc0kwSENHOUpva1hBYlAxUTNWb1Mrb3BFWWpEWHlY?=
 =?utf-8?B?d0wybC8xMVBZQ0UyZWpuOG5hY1FOVDNRYjdlVUJnMUdEcFFtTGRqbm5aSjBZ?=
 =?utf-8?B?OUp1WVJSK1VDRDE2bThnbzFHdnJYek9FbHJpNnc0S1lyN2w1ZkFxdEUvNGRm?=
 =?utf-8?B?a0RaVFhmRXVlNFNwN0JmSElCdENmQ0dZT0hDOEhycTVmRVBGdmVvVzdHWnVO?=
 =?utf-8?B?aTNmYnpSQVVMQ2FsZW1zc3QwSU0xV3A0dkgyS05sSEpzLzZCUFhOOE5uT3JX?=
 =?utf-8?B?UWNlWjBvTFh6MzA4QXprbHVhVVBOU2RrREZqZ251cVp3MVgyZ1c3OGMrYnlp?=
 =?utf-8?B?K1pWclc3STlKNkhTL29QUlhEUEhXNzhsckFLZDZOdWJ2TXVSaTZBdlVjSTJH?=
 =?utf-8?B?Q2Noc1hESmtORjZ1UWxpc3FlTDIzTkwvUGQyNVVhMFh2aXNMcTNNYXFaNmYy?=
 =?utf-8?B?YXE2TUYwaHBiRXZZN0tXYUZhWldMUG9XbG9JSWdCWjRWNVRBQ3dFLzJKUWNa?=
 =?utf-8?B?aVUzb2NSa0pPRTMwV3VsbzByZi9WYnU2clQrcXBzVjRqTmVpM2lYcUQ5cGhm?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30885973-40ba-45fc-46d0-08de09d34ca0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 21:07:06.3009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yMg5+fC1RNFjeZz0egSJPMhP9Z2h5JHG4331eII7Vgbs2xdvCxf3sSOd3Cy+wbWYM56fXYkCqHl5vSgvV7JP/LIq9MCe8vsZzqDWTa1TNbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6096
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



On 10/11/2025 9:38 PM, Michał Winiarski wrote:
> Migration data is queued in a per-GT ptr_ring to decouple the worker
> responsible for handling the data transfer from the .read()/.write()
> syscalls.

... from the .read() and .write() syscalls.

> Add the data structures and handlers that will be used in future
> commits.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |   4 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 163 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   9 +
>  .../drm/xe/xe_gt_sriov_pf_migration_types.h   |   5 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   3 +
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 147 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |  20 +++
>  .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |  37 ++++
>  drivers/gpu/drm/xe/xe_sriov_pf_types.h        |   3 +
>  9 files changed, 390 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index 44df984278548..16a88e7599f6d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -19,6 +19,7 @@
>  #include "xe_guc_ct.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf_control.h"
> +#include "xe_sriov_pf_migration.h"
>  #include "xe_sriov_pf_service.h"
>  #include "xe_tile.h"
>  
> @@ -388,6 +389,8 @@ static bool pf_enter_vf_wip(struct xe_gt *gt, unsigned int vfid)
>  
>  static void pf_exit_vf_wip(struct xe_gt *gt, unsigned int vfid)
>  {
> +	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
> +
>  	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_WIP)) {
>  		struct xe_gt_sriov_control_state *cs = pf_pick_vf_control(gt, vfid);

we can declare wq here

>  
> @@ -399,6 +402,7 @@ static void pf_exit_vf_wip(struct xe_gt *gt, unsigned int vfid)
>  		pf_exit_vf_resume_wip(gt, vfid);
>  
>  		complete_all(&cs->done);
> +		wake_up_all(wq);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index f8604b172963e..af5952f42fff1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -7,6 +7,7 @@
>  
>  #include "abi/guc_actions_sriov_abi.h"
>  #include "xe_bo.h"
> +#include "xe_gt_sriov_pf_control.h"
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_migration.h"
>  #include "xe_gt_sriov_printk.h"
> @@ -15,6 +16,17 @@
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf_migration.h"
>  
> +#define XE_GT_SRIOV_PF_MIGRATION_RING_TIMEOUT (HZ * 20)
> +#define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
> +
> +static struct xe_gt_sriov_pf_migration *pf_pick_gt_migration(struct xe_gt *gt, unsigned int vfid)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> +
> +	return &gt->sriov.pf.vfs[vfid].migration;
> +}
> +
>  /* Return: number of dwords saved/restored/required or a negative error code on failure */
>  static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
>  				      u64 addr, u32 ndwords)
> @@ -382,6 +394,142 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
>  }
>  #endif /* CONFIG_DEBUG_FS */
>  
> +/**
> + * xe_gt_sriov_pf_migration_ring_empty() - Check if a migration ring is empty
> + * @gt: the &struct xe_gt
> + * @vfid: the VF identifier
> + *
> + * Return: true if the ring is empty, otherwise false.
> + */
> +bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return ptr_ring_empty(&pf_pick_gt_migration(gt, vfid)->ring);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_produce() - Add migration data packet to migration ring
> + * @gt: the &struct xe_gt
> + * @vfid: the VF identifier
> + * @data: &struct xe_sriov_pf_migration_data packet
> + *
> + * If the ring is full, wait until there is space in the ring.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_migration_ring_produce(struct xe_gt *gt, unsigned int vfid,
> +					  struct xe_sriov_pf_migration_data *data)
> +{
> +	struct xe_gt_sriov_pf_migration *migration = pf_pick_gt_migration(gt, vfid);
> +	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
> +	unsigned long timeout = XE_GT_SRIOV_PF_MIGRATION_RING_TIMEOUT;
> +	int ret;
> +
> +	xe_gt_assert(gt, data->tile == gt->tile->id);
> +	xe_gt_assert(gt, data->gt == gt->info.id);
> +
> +	while (1) {
> +		ret = ptr_ring_produce(&migration->ring, data);
> +		if (ret == 0) {

		if (!ret)
			break;
> +			wake_up_all(wq);
> +			break;
> +		}
> +
> +		if (!xe_gt_sriov_pf_control_check_vf_data_wip(gt, vfid))
> +			return -EINVAL;
> +
> +		ret = wait_event_interruptible_timeout(*wq,
> +						       !ptr_ring_full(&migration->ring),
> +						       timeout);
> +		if (ret == 0)
> +			return -ETIMEDOUT;
> +
> +		timeout = ret;
> +	}
> +

	wake_up_all(wq);
	return 0;

> +	return ret;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_consume() - Get migration data packet from migration ring
> + * @gt: the &struct xe_gt
> + * @vfid: the VF identifier
> + *
> + * If the ring is empty, wait until there are new migration data packets to process.
> + *
> + * Return: Pointer to &struct xe_sriov_pf_migration_data on success,
> + *	   ERR_PTR(-ENODATA) if ring is empty and no more migration data is expected,
> + *	   ERR_PTR value in case of error.
> + */
> +struct xe_sriov_pf_migration_data *
> +xe_gt_sriov_pf_migration_ring_consume(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_pf_migration *migration = pf_pick_gt_migration(gt, vfid);
> +	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
> +	unsigned long timeout = XE_GT_SRIOV_PF_MIGRATION_RING_TIMEOUT;
> +	struct xe_sriov_pf_migration_data *data;
> +	int ret;
> +
> +	while (1) {
> +		data = ptr_ring_consume(&migration->ring);
> +		if (data) {
> +			wake_up_all(wq);
> +			break;
> +		}
> +
> +		if (!xe_gt_sriov_pf_control_check_vf_data_wip(gt, vfid))
> +			return ERR_PTR(-ENODATA);
> +
> +		ret = wait_event_interruptible_timeout(*wq,
> +					 !ptr_ring_empty(&migration->ring) ||
> +					 !xe_gt_sriov_pf_control_check_vf_data_wip(gt, vfid),
> +					 timeout);
> +		if (ret == 0)
> +			return ERR_PTR(-ETIMEDOUT);
> +
> +		timeout = ret;
> +	}
> +
> +	return data;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_consume_nowait() - Get migration data packet from migration ring
> + * @gt: the &struct xe_gt
> + * @vfid: the VF identifier
> + *
> + * Similar to xe_gt_sriov_pf_migration_consume(), but doesn't wait until more data is available.
> + *
> + * Return: Pointer to &struct xe_sriov_pf_migration_data on success,
> + *	   ERR_PTR(-EAGAIN) if ring is empty but migration data is expected,
> + *	   ERR_PTR(-ENODATA) if ring is empty and no more migration data is expected,
> + *	   ERR_PTR value in case of error.
> + */
> +struct xe_sriov_pf_migration_data *
> +xe_gt_sriov_pf_migration_ring_consume_nowait(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_pf_migration *migration = pf_pick_gt_migration(gt, vfid);
> +	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
> +	struct xe_sriov_pf_migration_data *data;
> +
> +	data = ptr_ring_consume(&migration->ring);
> +	if (data) {
> +		wake_up_all(wq);
> +		return data;
> +	}
> +
> +	if (!xe_gt_sriov_pf_control_check_vf_data_wip(gt, vfid))
> +		return ERR_PTR(-ENODATA);
> +
> +	return ERR_PTR(-EAGAIN);
> +}
> +
> +static void pf_gt_migration_cleanup(struct drm_device *dev, void *arg)

no need for the "pf" prefix

and if this is only about ptr_ring, then it could be:

static void action_ring_cleanup(...)
{
	struct ptr_ring *r = arg;

	ptr_ring_cleanup(r, NULL);
}

> +{
> +	struct xe_gt_sriov_pf_migration *migration = arg;
> +
> +	ptr_ring_cleanup(&migration->ring, NULL);
> +}
> +
>  /**
>   * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
>   * @gt: the &xe_gt
> @@ -393,6 +541,7 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
>  int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int n, totalvfs;
>  	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> @@ -404,5 +553,19 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> +	totalvfs = xe_sriov_pf_get_totalvfs(xe);
> +	for (n = 0; n <= totalvfs; n++) {
> +		struct xe_gt_sriov_pf_migration *migration = pf_pick_gt_migration(gt, n);
> +
> +		err = ptr_ring_init(&migration->ring,
> +				    XE_GT_SRIOV_PF_MIGRATION_RING_SIZE, GFP_KERNEL);
> +		if (err)
> +			return err;
> +
> +		err = drmm_add_action_or_reset(&xe->drm, pf_gt_migration_cleanup, migration);
> +		if (err)
> +			return err;
> +	}
> +
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> index 09faeae00ddbb..1e4dc46413823 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> @@ -9,11 +9,20 @@
>  #include <linux/types.h>
>  
>  struct xe_gt;
> +struct xe_sriov_pf_migration_data;
>  
>  int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
>  int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
>  
> +bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_migration_ring_produce(struct xe_gt *gt, unsigned int vfid,
> +					  struct xe_sriov_pf_migration_data *data);
> +struct xe_sriov_pf_migration_data *
> +xe_gt_sriov_pf_migration_ring_consume(struct xe_gt *gt, unsigned int vfid);
> +struct xe_sriov_pf_migration_data *
> +xe_gt_sriov_pf_migration_ring_consume_nowait(struct xe_gt *gt, unsigned int vfid);
> +
>  #ifdef CONFIG_DEBUG_FS
>  ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
>  						char __user *buf, size_t count, loff_t *pos);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> index fdc5a31dd8989..8434689372082 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> @@ -7,6 +7,7 @@
>  #define _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
>  
>  #include <linux/mutex.h>
> +#include <linux/ptr_ring.h>
>  #include <linux/types.h>
>  
>  /**
> @@ -27,9 +28,11 @@ struct xe_gt_sriov_state_snapshot {
>  /**
>   * struct xe_gt_sriov_pf_migration - GT-level data.
>   *
> - * Used by the PF driver to maintain non-VF specific per-GT data.
> + * Used by the PF driver to maintain per-VF migration data.

we try to match struct name with the sub-component name, not use it as per-VF name

if you want to have struct for the per-VF data, pick a different name, maybe:

	struct xe_gt_sriov_pf_migration_state

or just reuse one that you plan to remove later:

	struct xe_gt_sriov_state_snapshot

>   */
>  struct xe_gt_sriov_pf_migration {
> +	/** @ring: queue containing VF save / restore migration data */
> +	struct ptr_ring ring;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> index 9a856da379d39..fbb08f8030f7f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> @@ -33,6 +33,9 @@ struct xe_gt_sriov_metadata {
>  
>  	/** @snapshot: snapshot of the VF state data */
>  	struct xe_gt_sriov_state_snapshot snapshot;
> +
> +	/** @migration: */

missing description

> +	struct xe_gt_sriov_pf_migration migration;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> index cf6a210d5597a..347682f29a03c 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> @@ -4,7 +4,35 @@
>   */
>  
>  #include "xe_sriov.h"
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt_sriov_pf_control.h"
> +#include "xe_gt_sriov_pf_migration.h"
> +#include "xe_pm.h"
> +#include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_pf_migration.h"
> +#include "xe_sriov_printk.h"
> +
> +static struct xe_sriov_pf_migration *pf_pick_migration(struct xe_device *xe, unsigned int vfid)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> +
> +	return &xe->sriov.pf.vfs[vfid].migration;
> +}
> +
> +/**
> + * xe_sriov_pf_migration_waitqueue - Get waitqueue for migration
> + * @xe: the &struct xe_device
> + * @vfid: the VF identifier
> + *
> + * Return: pointer to the migration waitqueue.
> + */
> +wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid)
> +{
> +	return &pf_pick_migration(xe, vfid)->wq;
> +}
>  
>  /**
>   * xe_sriov_pf_migration_supported() - Check if SR-IOV VF migration is supported by the device
> @@ -35,9 +63,128 @@ static bool pf_check_migration_support(struct xe_device *xe)
>   */
>  int xe_sriov_pf_migration_init(struct xe_device *xe)
>  {
> +	unsigned int n, totalvfs;
> +
>  	xe_assert(xe, IS_SRIOV_PF(xe));
>  
>  	xe->sriov.pf.migration.supported = pf_check_migration_support(xe);
> +	if (!xe_sriov_pf_migration_supported(xe))
> +		return 0;
> +
> +	totalvfs = xe_sriov_pf_get_totalvfs(xe);
> +	for (n = 1; n <= totalvfs; n++) {
> +		struct xe_sriov_pf_migration *migration = pf_pick_migration(xe, n);
> +
> +		init_waitqueue_head(&migration->wq);
> +	}
>  
>  	return 0;
>  }
> +
> +static bool pf_migration_empty(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_gt *gt;
> +	u8 gt_id;
> +
> +	for_each_gt(gt, xe, gt_id) {
> +		if (!xe_gt_sriov_pf_migration_ring_empty(gt, vfid))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
> +static struct xe_sriov_pf_migration_data *
> +pf_migration_consume(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_sriov_pf_migration_data *data;
> +	struct xe_gt *gt;
> +	u8 gt_id;
> +	bool no_data = true;
> +
> +	for_each_gt(gt, xe, gt_id) {
> +		data = xe_gt_sriov_pf_migration_ring_consume_nowait(gt, vfid);
> +
> +		if (!IS_ERR(data))
> +			return data;
> +		else if (PTR_ERR(data) == -EAGAIN)
> +			no_data = false;
> +	}
> +
> +	if (no_data)
> +		return ERR_PTR(-ENODATA);
> +
> +	return ERR_PTR(-EAGAIN);
> +}
> +
> +/**
> + * xe_sriov_pf_migration_consume() - Consume a SR-IOV VF migration data packet from the device
> + * @xe: the &struct xe_device
> + * @vfid: the VF identifier
> + *
> + * If there is no migration data to process, wait until more data is available.
> + *
> + * Return: Pointer to &struct xe_sriov_pf_migration_data on success,
> + *	   ERR_PTR(-ENODATA) if ring is empty and no more migration data is expected,

can we use NULL as indication of no data ? then all ERR_PTR will be errors

> + *	   ERR_PTR value in case of error.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +struct xe_sriov_pf_migration_data *
> +xe_sriov_pf_migration_consume(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_sriov_pf_migration *migration = pf_pick_migration(xe, vfid);
> +	unsigned long timeout = HZ * 5;
> +	struct xe_sriov_pf_migration_data *data;
> +	int ret;
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return ERR_PTR(-ENODEV);

this is "PF" function, we shouldn't get here if we are not a PF

use assert here, and make sure the caller verifies the PF mode

> +
> +	while (1) {
> +		data = pf_migration_consume(xe, vfid);
> +		if (!IS_ERR(data) || PTR_ERR(data) != -EAGAIN)
> +			goto out;
> +
> +		ret = wait_event_interruptible_timeout(migration->wq,
> +						       !pf_migration_empty(xe, vfid),
> +						       timeout);
> +		if (ret == 0) {
> +			xe_sriov_warn(xe, "VF%d Timed out waiting for migration data\n", vfid);
> +			return ERR_PTR(-ETIMEDOUT);
> +		}
> +
> +		timeout = ret;
> +	}
> +
> +out:
> +	return data;
> +}
> +
> +/**
> + * xe_sriov_pf_migration_produce() - Produce a SR-IOV VF migration data packet for device to process
> + * @xe: the &struct xe_device
> + * @vfid: the VF identifier
> + * @data: VF migration data
> + *
> + * If the underlying data structure is full, wait until there is space.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_migration_produce(struct xe_device *xe, unsigned int vfid,
> +				  struct xe_sriov_pf_migration_data *data)
> +{
> +	struct xe_gt *gt;
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return -ENODEV;
> +
> +	gt = xe_device_get_gt(xe, data->gt);
> +	if (!gt || data->tile != gt->tile->id) {
> +		xe_sriov_err_ratelimited(xe, "VF%d Unknown GT - tile_id:%d, gt_id:%d\n",
> +					 vfid, data->tile, data->gt);
> +		return -EINVAL;
> +	}
> +
> +	return xe_gt_sriov_pf_migration_ring_produce(gt, vfid, data);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> index d3058b6682192..f2020ba19c2da 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> @@ -7,12 +7,18 @@
>  #define _XE_SRIOV_PF_MIGRATION_H_
>  
>  #include <linux/types.h>
> +#include <linux/wait.h>
>  
>  struct xe_device;
>  
>  #ifdef CONFIG_PCI_IOV
>  int xe_sriov_pf_migration_init(struct xe_device *xe);
>  bool xe_sriov_pf_migration_supported(struct xe_device *xe);
> +struct xe_sriov_pf_migration_data *
> +xe_sriov_pf_migration_consume(struct xe_device *xe, unsigned int vfid);
> +int xe_sriov_pf_migration_produce(struct xe_device *xe, unsigned int vfid,
> +				  struct xe_sriov_pf_migration_data *data);
> +wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid);
>  #else
>  static inline int xe_sriov_pf_migration_init(struct xe_device *xe)
>  {
> @@ -22,6 +28,20 @@ static inline bool xe_sriov_pf_migration_supported(struct xe_device *xe)
>  {
>  	return false;
>  }
> +static inline struct xe_sriov_pf_migration_data *
> +xe_sriov_pf_migration_consume(struct xe_device *xe, unsigned int vfid)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +static inline int xe_sriov_pf_migration_produce(struct xe_device *xe, unsigned int vfid,
> +						struct xe_sriov_pf_migration_data *data)
> +{
> +	return -ENODEV;
> +}
> +wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid)
> +{
> +	return ERR_PTR(-ENODEV);
> +}

didn't fully check, but do we really need all these stubs?
likely those functions will be called from other real PF-only functions

>  #endif
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> index e69de29bb2d1d..80fdea32b884a 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_PF_MIGRATION_TYPES_H_
> +#define _XE_SRIOV_PF_MIGRATION_TYPES_H_
> +
> +#include <linux/types.h>
> +#include <linux/wait.h>
> +

add kernel-doc

> +struct xe_sriov_pf_migration_data {
> +	struct xe_device *xe;
> +	void *vaddr;
> +	size_t remaining;
> +	size_t hdr_remaining;
> +	union {
> +		struct xe_bo *bo;
> +		void *buff;
> +	};
> +	__struct_group(xe_sriov_pf_migration_hdr, hdr, __packed,
> +		u8 version;
> +		u8 type;
> +		u8 tile;
> +		u8 gt;
> +		u32 flags;
> +		u64 offset;
> +		u64 size;
> +	);
> +};
> +
> +struct xe_sriov_pf_migration {
> +	/** @wq: waitqueue used to avoid busy-waiting for snapshot production/consumption */
> +	wait_queue_head_t wq;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> index 2d2fcc0a2f258..b3ae21a5a0490 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> @@ -9,6 +9,7 @@
>  #include <linux/mutex.h>
>  #include <linux/types.h>
>  
> +#include "xe_sriov_pf_migration_types.h"
>  #include "xe_sriov_pf_service_types.h"
>  
>  /**
> @@ -17,6 +18,8 @@
>  struct xe_sriov_metadata {
>  	/** @version: negotiated VF/PF ABI version */
>  	struct xe_sriov_pf_service_version version;
> +	/** @migration: migration data */
> +	struct xe_sriov_pf_migration migration;
>  };
>  
>  /**

