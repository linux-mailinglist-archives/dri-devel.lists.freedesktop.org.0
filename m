Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8392EAAEC2A
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 21:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA1710E882;
	Wed,  7 May 2025 19:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PeSPiQfr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D175910E878;
 Wed,  7 May 2025 19:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746646047; x=1778182047;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rJFXUrAGL2+pVHye7ptnHqK0JEcIKmY6s97IctZ98Ic=;
 b=PeSPiQfrLnV0e7kJW8UW3De0xeBBkC2GgQ8+rkKqTp5D34YwIbjJGck/
 luP8RNA1QTqMU2BqdhFmpTHtJ/r/WytS7bltbavUc1agTL2E4KBXx5t8e
 c/i8oc9Rd16BwSBf6OSxIjjXh3jwFwtOV7/NgHGEUA1THk5Df3uBe3Mja
 1Z2TDInA+SkrGHxz+ogFSVYD8s+U573aRG8WHGKqMA4/pmfHphQ6oD7Zf
 J65MUsvda6CLaSuKcIE08zVc25eVFOyDZyjcpWrk0al2XPNJAxUvNiUC5
 m7iy27PFRIJAh0WlOSYE7l0p4sTtlJ235ZwuDoHqwJU0K23q5IUoO1qqs A==;
X-CSE-ConnectionGUID: zi2jLALLTB+rWXp/zkl+EA==
X-CSE-MsgGUID: x5r5REhbRg+Z9Zdkxo7i8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59030342"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="59030342"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 12:27:27 -0700
X-CSE-ConnectionGUID: xe84FdZbQVSdaEXQiErnfQ==
X-CSE-MsgGUID: u1N0RxYUSCiG/HZAwLL5nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="141168695"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 12:27:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 12:27:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 12:27:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 12:27:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJs7lbowpA3qSFe5MqrF905SM9L8U/JcpqqQtHvoCobob+VB397eZoX7BHFUteRV1BS9xjNPQKKMF/2hseVhVyvB8tsa+gRbDusgp/DDMT+8tFwl6S7bpkR6hiBlPCDMecqOb973V5XXrcx9BYsQpJrB6Ih1MpwMyTrD/3646L4WiwI6gfI06kRUW86+5KNllpXkyofLvqY2ttnFgnTJVc+6n/B0PzujBAFH3vfUvu1DZWAaZcfkZMJmsun99FpaGk02VdHpB6OYYPoGKK1PTvWUS4s/vQSmKtqY7LXAHZSo50jAn472WmcZWovLEsVYb/Px33aByR83zKXKMC9rTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0QvhReEFJ4iZdeUTWyt0pC3kBMW9h9/m8SpLMOvXTg=;
 b=STsv0W8fpiDen0bvgmSpg2Fea834v/1Z+UZB1VCpiP2a53okC1bYhBTr5HU7ktbK+fAqO2mnYK4CF58E2f9294BM7NtpSUzZ5F5zf9lM91eAl6mxxMsQRpvDqNcJU+1rFYgO5n6su530ggpmYfh9X2XE4YVimR7bb9ACa50xqwN2KAPjn8MxCIyIucOgOluaok2KPtkv3DzPIM8lsAt2IrwKDD+cq8YGJuiIohcTUOWTwchhR+eVGZyrNWwcXVocrTHZ/TkwbGGxLiFAhIh/qAo0zC0MKpQKoSdXCSsT8p2KbfYDT1iNmood3CahvuTAmZnnTEcyYtbqGGabWh+eMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB7430.namprd11.prod.outlook.com (2603:10b6:510:274::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 19:27:15 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%3]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 19:27:15 +0000
Date: Wed, 7 May 2025 15:27:10 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <matthew.brost@intel.com>, <jianxun.zhang@intel.com>,
 <shuicheng.lin@intel.com>, <dri-devel@lists.freedesktop.org>,
 <Michal.Wajdeczko@intel.com>, <michal.mrozek@intel.com>,
 <raag.jadav@intel.com>, <john.c.harrison@intel.com>, <ivan.briano@intel.com>, 
 <matthew.auld@intel.com>, <dafna.hirschfield@intel.com>
Subject: Re: [PATCH v24 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Message-ID: <aBu0Dpewk75_rl8C@intel.com>
References: <20250507155727.130444-1-jonathan.cavitt@intel.com>
 <20250507155727.130444-6-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250507155727.130444-6-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:303:b5::14) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: 80192935-405a-49b9-d9c4-08dd8d9d2c3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6GAuP+vGCebdf1R/WJQ1dIuOt3ekJO52SST/sk1Z1zR+2VUO6vYuI1LSeA/8?=
 =?us-ascii?Q?apuBKXEEyJK7fJx95wQylhApN/E7dEnqqIvCetFKxmBDiE/jU4URQlJjjYTp?=
 =?us-ascii?Q?q0UKBCRGXB4lhhpb/3c3tn01JXdmZSf31sDhENejJIj5VZAwrEi+SBGQfk8a?=
 =?us-ascii?Q?ppALHh6Q9zY3xxT6JDzN04UH3q7khopujCYr/nmOBfsniL0vpKmezk3VGA0W?=
 =?us-ascii?Q?HudsYCo48OPJ31VWRz1mK7GjUJIB6d9TZU/KZJkKPvf+mKJfA2yzrcagjr8e?=
 =?us-ascii?Q?Ba+m8mjGosyj7mqaySQHaowMNZoFjKSfxIrGBiC1kvhUiuW1zHYLOG7GhtBT?=
 =?us-ascii?Q?pVX6B8KZhD9kFirYGfMq0q6w6Q/L3xdpPN03v/aHouirDPYK2QZRlLFNakVO?=
 =?us-ascii?Q?kRwBYU45po63GS0Ul8UVmPWJfmEwkp0cweBwkFgaNjYQWWE5rrmIPuD6oxmO?=
 =?us-ascii?Q?8AFeLFZ7Ss9gwGty5UxG8MbGh7F27ExO1aqJ0YgyZQ72WI0do4o9rlgJK3pe?=
 =?us-ascii?Q?M68FUsoHKQ/V2PzatU9MQY+V2XTyTjnLQM69BDLqmzk4HGdwvXIU1xLNJvQh?=
 =?us-ascii?Q?IWVzkRJqDPyG4SZS7U3dIVUyKMH7axSppphgX9Q5ArbyRg6jvOQBkoceXe6n?=
 =?us-ascii?Q?orDciZqMsxLrlRzPOCU3mR1hLwNS01xSHyTChFcFdp5d6g5Ps6uXbJU2sI+w?=
 =?us-ascii?Q?ETrvjIvcMg21m9aa2iiICXQw5NqIj5yU0MEpb/pHNvMdlDyRR03as5URLJCa?=
 =?us-ascii?Q?QYV30t98xLpguJNVZJNUgA8sTb+bJpHp632J2kc+q2uy9roCg7r+ncN5u8kP?=
 =?us-ascii?Q?bHSnLRYWxU3V7xIuFQ9sfF02QP4yyEb1Gp0geXkh5nYTx3vdF2QWBZXiQta9?=
 =?us-ascii?Q?UD72TWfvAg/KafVJXe7wfe1fHQGECc5Bh0qqW2XN1HB/LZHk5qwYbQzM+Wlt?=
 =?us-ascii?Q?Eismt4H3uTlKHXjYhPeDhDUnOTf154f2hGdo58Gfb5sZMO0XpU/lwfsGVy09?=
 =?us-ascii?Q?w0SNlb+71TTOQAWiq2Q+rHMO23gSeL/1yDvvGL2Qi5G3ykx6Y5kLjAKSmpC9?=
 =?us-ascii?Q?9zoKCwbtTislLvT3tYpipzFR9MY3qVSP+OOPnX7mpQPG4fjELxqDaF8L+74A?=
 =?us-ascii?Q?eJhkHgLfycPUb+ZnBkb1+TOOO0DhgOfg3pH3G0y1e4O1SkdTWR2EVGZtogM7?=
 =?us-ascii?Q?wstffTKD/bxy4avDkxW6xm5R6owwshgTD2bi/XLD4LRjqXwrIgZGk0MNliPj?=
 =?us-ascii?Q?daTjH+2ufPTAu8OKCq1ZheBt4DHdYxNMINmCsUD/OrDp6NYJ88gxyVSDzGH3?=
 =?us-ascii?Q?0U3F9s+QNeS+mmdVH9UaDzqXhlCFMWH+M2CJIGmdK45KTe1hTTcSXzZFrx8r?=
 =?us-ascii?Q?Uo9VrDS2IQILSDCzt9BgMWdLXwjx6cCpcL1JuzFjIOKreL9kqEXZfgFaw/oD?=
 =?us-ascii?Q?iOKk1Xv9u/c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8AI2XS0joY5a5BmyrM6erEhrQMRjd66Cz7w6k2nwpjcRUjWZPYxDeNAXTDTd?=
 =?us-ascii?Q?rpikGRYqfTzzCxp18vLVlQJ0e+A74Sg++PNY+OzkfzbVaY9vKoJ6uLRZCsNv?=
 =?us-ascii?Q?lyH6WItmQ4+zUueAI2B6s02h05X4TNiQp6AzM3Kg8eRHPJtwRypwv6SEVPVr?=
 =?us-ascii?Q?cvKhypLRgSuTKRY4px8biLCMcyhxky/GPI8J08BXDU1XCSdjqySGNe/FFQRH?=
 =?us-ascii?Q?BHGfSL4UMuNOL/ylYKg38JbG/ttE3Wrk0Nt6CKIRf7b4imG6V18EWNNVVhwg?=
 =?us-ascii?Q?8/t64L8ytUTu5vWO/iV1p298Vtqe8s41vHdHKbrqPEGqgYZaXhR4R2vi46R/?=
 =?us-ascii?Q?HflrbJY5GXPUd0eerDQesaWEZkukjqxOFD1verOHoa1Xr9XW/DzKn8dUTR30?=
 =?us-ascii?Q?6V3ss4lfLKgujKUFGaOdTDHRcSPKsqhdJnMIqTM0em7doMHHxLvtpWjl7GLu?=
 =?us-ascii?Q?4zv585iiUm/n1P/vPxDWOAy/0PVLzQsQ61gPYcKRdh5yv7tfGDtUVv0cN9DQ?=
 =?us-ascii?Q?Egr7QjI5Y3u4YVfALq4kFUWq7qV/b0w3DbDOdm1EvduGzbtiRxmQud5PKXMJ?=
 =?us-ascii?Q?oMncW/kjqLx+7ziYWSXOJXRAefzbNeIjj2ybo3AaF0Vsp16YhcXG2jH7w8nT?=
 =?us-ascii?Q?XC4kG/BcPrcuXatmAvUwucn7iUi67Hmypi55YmNXMKuI7z4XgsNidnU9/HG4?=
 =?us-ascii?Q?0U8saZzn8xFJ2YywClbEnFEC+c0MMerRzXws0TrqFv2g4YnFTru18rcHaDHO?=
 =?us-ascii?Q?h6aOrO9PO4+spcSOCSbFCyu57JV7+t89Fdkenv+4stJ8QmHIsuYHO55wbmos?=
 =?us-ascii?Q?XMI9OGFDGBjiFbpkj2K/ATkU2stjrqqRVydmxh3PI0VJ3VXZVMScSFeh4HKU?=
 =?us-ascii?Q?lZfB7T6uvLIPt8sjOVRuguollIcNTXe+5OafnrjZgZ080m61iS3iNl6x1r2a?=
 =?us-ascii?Q?bDXQFcpfH+J9P5RcnnkS0ffDoO/epl7zmkdFHhagP9mdsahORKBwl0fj+idn?=
 =?us-ascii?Q?nEZEbDX0cZlt+oex6+MbGklqc9nU3UwiCGD0aoyPd9bLICViWw988lOwBTbA?=
 =?us-ascii?Q?6za8cU4iejQbgohUDGUzo9m/JPNgcVGUMTGzx77Cc7FCVNiIpYucGprHsBQP?=
 =?us-ascii?Q?zHV0ENOlt5dNJfut3l+rt1+6xZ/i9dpYWtQ87fTZcFd5DZ2Z+mFJ3WbMOy6o?=
 =?us-ascii?Q?Cahd0tC3L85Mq27wbOOOOABkLfuiFNxjK7J/MmAyPlrnzEytXUFnXWoH/2KK?=
 =?us-ascii?Q?mPDCFq+TG/v2RgRkO6cUMRtb3lcd4uFbO6EoR0Y+SoUJ8u9lo8V+rYzJTaSY?=
 =?us-ascii?Q?rywT7OF2IxClPuE1M8YytY9o5wQB2as7s+IhAPYKLepEbHYrhZQfFa11UJDs?=
 =?us-ascii?Q?6a8m+ryoqjwTH7xRSaNtohtHbRbMTQBFRqbedYddreKHSd0ytFDLKX5/rYB3?=
 =?us-ascii?Q?7fmEbLNJBs2dOU/D/1hHJ8AIFjbCBv4Kpq6QGRUWjpNzzG/h6KpB8eiSAiiO?=
 =?us-ascii?Q?6NKkG+RU6Wm4bDqy99m1mFFc06UYovKnqk7LUPaNt9II/ZcAW+BD9jKECiVD?=
 =?us-ascii?Q?zfuyssqPJO5tQgKckuaepCDC15b9LMg9lwDeJi7we/DvVsmCjibY85ynJ8Y7?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80192935-405a-49b9-d9c4-08dd8d9d2c3e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 19:27:15.1179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bfm5mTXDN4K1pj8Lp8/tQVmpefbNzdcjgmxsWVnSy7ZaO6ytLVnDHZf7nwlz4bydI9F9rAb/MNzgzFxD8PvVKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7430
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

On Wed, May 07, 2025 at 03:57:26PM +0000, Jonathan Cavitt wrote:
> Add support for userspace to request a list of observed faults
> from a specified VM.
> 
> v2:
> - Only allow querying of failed pagefaults (Matt Brost)
> 
> v3:
> - Remove unnecessary size parameter from helper function, as it
>   is a property of the arguments. (jcavitt)
> - Remove unnecessary copy_from_user (Jainxun)
> - Set address_precision to 1 (Jainxun)
> - Report max size instead of dynamic size for memory allocation
>   purposes.  Total memory usage is reported separately.
> 
> v4:
> - Return int from xe_vm_get_property_size (Shuicheng)
> - Fix memory leak (Shuicheng)
> - Remove unnecessary size variable (jcavitt)
> 
> v5:
> - Rename ioctl to xe_vm_get_faults_ioctl (jcavitt)
> - Update fill_property_pfs to eliminate need for kzalloc (Jianxun)
> 
> v6:
> - Repair and move fill_faults break condition (Dan Carpenter)
> - Free vm after use (jcavitt)
> - Combine assertions (jcavitt)
> - Expand size check in xe_vm_get_faults_ioctl (jcavitt)
> - Remove return mask from fill_faults, as return is already -EFAULT or 0
>   (jcavitt)
> 
> v7:
> - Revert back to using xe_vm_get_property_ioctl
> - Apply better copy_to_user logic (jcavitt)
> 
> v8:
> - Fix and clean up error value handling in ioctl (jcavitt)
> - Reapply return mask for fill_faults (jcavitt)
> 
> v9:
> - Future-proof size logic for zero-size properties (jcavitt)
> - Add access and fault types (Jianxun)
> - Remove address type (Jianxun)
> 
> v10:
> - Remove unnecessary switch case logic (Raag)
> - Compress size get, size validation, and property fill functions into a
>   single helper function (jcavitt)
> - Assert valid size (jcavitt)
> 
> v11:
> - Remove unnecessary else condition
> - Correct backwards helper function size logic (jcavitt)
> 
> v12:
> - Use size_t instead of int (Raag)
> 
> v13:
> - Remove engine class and instance (Ivan)
> 
> v14:
> - Map access type, fault type, and fault level to user macros (Matt
>   Brost, Ivan)
> 
> v15:
> - Remove unnecessary size assertion (jcavitt)
> 
> v16:
> - Nit fixes (Matt Brost)

One of the oldest debates between the DRM community and other subsystems
is the inclusion of revision history in the commit message itself.

In general I defend the idea of history in the patch message, but
I believe this is becoming way to large to the point that it will
trigger the discussions over and over again...

Perhaps in cases like this we should consider cleaning things up.
Specially now with good lore in place and our links also using lore.

> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
> Acked-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Jainxun Zhang <jianxun.zhang@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Ivan Briano <ivan.briano@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |   2 +
>  drivers/gpu/drm/xe/xe_vm.c     | 108 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h     |   2 +
>  3 files changed, 112 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 75e753e0a682..319768733504 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -196,6 +196,8 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_VM_GET_PROPERTY, xe_vm_get_property_ioctl,
> +			  DRM_RENDER_ALLOW),
>  };
>  
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index cada6b9aadce..4758767eaed0 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3600,6 +3600,114 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	return err;
>  }
>  
> +/*
> + * Map access type, fault type, and fault level from current bspec
> + * specification to user spec abstraction.  The current mapping is
> + * 1-to-1, but if there is ever a hardware change, we will need
> + * this abstraction layer to maintain API stability through the
> + * hardware change.
> + */
> +static u8 xe_to_user_access_type(u8 access_type)
> +{
> +	return access_type;
> +}
> +
> +static u8 xe_to_user_fault_type(u8 fault_type)
> +{
> +	return fault_type;
> +}
> +
> +static u8 xe_to_user_fault_level(u8 fault_level)
> +{
> +	return fault_level;
> +}
> +
> +static int fill_faults(struct xe_vm *vm,
> +		       struct drm_xe_vm_get_property *args)
> +{
> +	struct xe_vm_fault __user *usr_ptr = u64_to_user_ptr(args->data);
> +	struct xe_vm_fault store = { 0 };
> +	struct xe_vm_fault_entry *entry;
> +	int ret = 0, i = 0, count, entry_size;
> +
> +	entry_size = sizeof(struct xe_vm_fault);
> +	count = args->size / entry_size;
> +
> +	spin_lock(&vm->faults.lock);
> +	list_for_each_entry(entry, &vm->faults.list, list) {
> +		if (i++ == count)
> +			break;
> +
> +		memset(&store, 0, entry_size);
> +
> +		store.address = entry->address;
> +		store.address_precision = entry->address_precision;
> +
> +		store.access_type = xe_to_user_access_type(entry->access_type);
> +		store.fault_type = xe_to_user_fault_type(entry->fault_type);
> +		store.fault_level = xe_to_user_fault_level(entry->fault_level);
> +
> +		ret = copy_to_user(usr_ptr, &store, entry_size);
> +		if (ret)
> +			break;
> +
> +		usr_ptr++;
> +	}
> +	spin_unlock(&vm->faults.lock);
> +
> +	return ret ? -EFAULT : 0;
> +}
> +
> +static int xe_vm_get_property_helper(struct xe_vm *vm,
> +				     struct drm_xe_vm_get_property *args)
> +{
> +	size_t size;
> +
> +	switch (args->property) {
> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> +		spin_lock(&vm->faults.lock);
> +		size = size_mul(sizeof(struct xe_vm_fault), vm->faults.len);
> +		spin_unlock(&vm->faults.lock);
> +
> +		if (args->size)
> +			/*
> +			 * Number of faults may increase between calls to
> +			 * xe_vm_get_property_ioctl, so just report the
> +			 * number of faults the user requests if it's less
> +			 * than or equal to the number of faults in the VM
> +			 * fault array.
> +			 */
> +			return args->size <= size ? fill_faults(vm, args) : -EINVAL;
> +
> +		args->size = size;
> +		return 0;
> +	}
> +	return -EINVAL;
> +}
> +
> +int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
> +			     struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(drm);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_vm_get_property *args = data;
> +	struct xe_vm *vm;
> +	int ret = 0;
> +
> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1] ||
> +			     args->reserved[2]))
> +		return -EINVAL;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -ENOENT;
> +
> +	ret = xe_vm_get_property_helper(vm, args);
> +
> +	xe_vm_put(vm);
> +	return ret;
> +}
> +
>  /**
>   * xe_vm_bind_kernel_bo - bind a kernel BO to a VM
>   * @vm: VM to bind the BO to
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 9bd7e93824da..63ec22458e04 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -196,6 +196,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file);
>  int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>  		     struct drm_file *file);
> +int xe_vm_get_property_ioctl(struct drm_device *dev, void *data,
> +			     struct drm_file *file);
>  
>  void xe_vm_close_and_put(struct xe_vm *vm);
>  
> -- 
> 2.43.0
> 
