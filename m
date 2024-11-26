Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C76C59D9CDC
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 18:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED4510E19F;
	Tue, 26 Nov 2024 17:48:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a637WLAd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DAF10E19F;
 Tue, 26 Nov 2024 17:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732643328; x=1764179328;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ykes25MpEqeVZH8fXAeTPllwMy6wRSXefgtJtBC8JXA=;
 b=a637WLAdZ2T8tT1nB4xZZONncjxcLm6iVZdI3mr8tcBVAavi8zCTshV+
 Z3+sN2lp3Z3hQ1o5OiOkt8dPAS7NiXNqDi22ibn/hxmwDMEBXZOjWENRb
 sAY9ZRH4JHcbA83gXuu6uJGKEIcHs2r+z/DAZ/7JNwuMIV4t4nAdRQ+7Q
 1uoPkCYG5ae8/jdTx1FDQTHp7hX/pZaKs2B5TldWxvI3FaSy5TyToZWVW
 19C18/cBJP/t9LDB1T1FUzI0Ae+PH3vy5VhjAZAmV7GiBDNsr6xq3r1nv
 /vSXnw/+O+7Tq7EG7vY6PrnedBDN9hVopKf5vzxTnTQSGeIgvQ5Frx+8z w==;
X-CSE-ConnectionGUID: 7W8jVxM2Seio7Er5HwHncg==
X-CSE-MsgGUID: +E7bshZ2R9+z7me3Ulhc6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43480518"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="43480518"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 09:48:47 -0800
X-CSE-ConnectionGUID: SWMlzdMPS3G/zh+rGz8piQ==
X-CSE-MsgGUID: v0yYP8kjSnCze39dvtVA8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="91850865"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2024 09:48:48 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 26 Nov 2024 09:48:47 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 26 Nov 2024 09:48:47 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 09:48:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=moblZK4BwH/Mi5SkSMC6M2P93SIqHdqGW/8wUToUyMiz6xefyGlohKTucL5Za177trQAmSMddwAMn38qsZ4o2VlKAc7SoLrRvTR8IBbXdRRtSkRpE0KYXDui2zEpIiF/uJoWWymVNzf6OI+RQhgGu+neP8Kywjx33BeYLo2/N883RyI0+iCXpp5S/S9oIgvyL1/D3CY1e98OnzRMMPpOig+zQUC59bYxph/sQAexZPRwj1HfHeOXWiqapkpThU5VMnQaBYoQA7j+IMVSnmws9mdhdW5YInyLC19pjCiUCaTRbWFMfysFu5Ja+uTDkCeG9nc0f8hgzI+j7GT8lSpYHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WeR7C6eSaVSLNLK/jLFYrhPf964f/ayiabwMGJ1Ujgk=;
 b=tTowMRlu4Ligw60UwnPppgyT4xG3FyduLYtEvALnJXvlPHg9+DcK89sru63QjspecYwglfv/EVNYkKW9JnUs5U+JQi2TuY84AcjRuCtkWgzSziPX+JVzIlZl6f0rWg5dUCi8EH8QSW+RNZWi4j0auXklj0ZAyP6FaQnCAj0e0IjpfBDH1mEf4MnkX/1WB9w7ZY9g/SZQn0XW/FcPXsRDWE7BmvbJCiTvLk63LztO+2WQaOQM5Glc2NHyqJgLD7xxP4gUSJDoeUDRIu/CaIufjdwthtKkKUFixkwLBCj0JW2gJ12+cqnSVgEdUud7Svkzdm0L5rQIB5/TtfWnStW6Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6821.namprd11.prod.outlook.com (2603:10b6:806:29d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 17:48:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 17:48:43 +0000
Date: Tue, 26 Nov 2024 09:49:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Huang Rui
 <ray.huang@amd.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <matthew.auld@intel.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
Message-ID: <Z0YKIGToB3pE+uZz@lstrano-desk.jf.intel.com>
References: <c62e5298-1ca6-4cd0-a558-3d2a91175fa0@amd.com>
 <d469ab3509a1b875ad0c44d01569675682d6c61c.camel@linux.intel.com>
 <6ab9e754-6f4a-48ec-b143-02585bc40291@amd.com>
 <5a16ef4ff06a530c52df7633833db19aaa15b33e.camel@linux.intel.com>
 <8d17a8a2-9a44-4f80-92b5-a8aa3efe6bf2@amd.com>
 <ZzeSr5ut6GVEwSJY@lstrano-desk.jf.intel.com>
 <Z0SX8WJCPADGLVE5@lstrano-desk.jf.intel.com>
 <634b07dd-aa5a-410e-8f62-0a96567c7932@amd.com>
 <Z0SzddLDzR8NDWmV@lstrano-desk.jf.intel.com>
 <18681d07-beb4-41c5-a935-11b8ec231c27@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18681d07-beb4-41c5-a935-11b8ec231c27@gmail.com>
X-ClientProxiedBy: BYAPR21CA0011.namprd21.prod.outlook.com
 (2603:10b6:a03:114::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6821:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c3150f4-52b5-4962-6f02-08dd0e4291ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?fqztwX4N/x+vjpO61Cgr8fHM+MQlVVTYirAePykyo8i0dH9bV9fVSRu6Zq?=
 =?iso-8859-1?Q?BghL4rTvFR5I9vLChvA6aN+9RF37joNDZc/XSbg8Pks+LWvf1/h/vKDrIS?=
 =?iso-8859-1?Q?5vWhXwRqyXCDUIarRKPROIEFyrUNuMMxUhTrtD3ixe2wOsnlzMM3TLbbgQ?=
 =?iso-8859-1?Q?DPtYZSQOtNft9mbxcOLK7htR9VNKPrBr7ZcQ3J2UmKrM4yuhWSd5TNciJe?=
 =?iso-8859-1?Q?pjvJMNMo4+kzB14GPslXw6KqbENP8f0yaTlP2aPqIIHiLVDS3AAFHfCL44?=
 =?iso-8859-1?Q?Xcb8Of+jrgG98RyRJ6/RRuhT/FFBNwUtii7JqlXf1sXVphZoumxAEK89As?=
 =?iso-8859-1?Q?adMiuhR1AXYzis6OsdIdPVkmkUPKV24xH8NAj08wmdno00tsi8dlnmGqjQ?=
 =?iso-8859-1?Q?h6qTWuMaWlIe3p3m71q3b0atjQNC1n6M/3L+1L4Kg6XHZf9PM9MvdCCOvi?=
 =?iso-8859-1?Q?ux+waUFK6hraK/SsfIV0InXI4H4k0BcFSoMRr5TuDYTBEXbus2mIljwK6T?=
 =?iso-8859-1?Q?27jn2V0FxoSCKN8jhozZw2dK10LJYBFfqfOFKTO/GdY5Iwo3DIZcAKdKi5?=
 =?iso-8859-1?Q?Zl/E97Su4drWYhqCjHCLMt3fsgnhD8wpcZiHw+FwrML7jV3Umupa8gELBn?=
 =?iso-8859-1?Q?4T3DAo6S+wvNmlrahbXzINld2FCfM8tLu4CbghQ1izRcvgNn0YPWYfw+VS?=
 =?iso-8859-1?Q?oW5cMG5j8t9dWaoo6Dy/NVPYfyMSzNOvIkc5i/CRzE5yCRIu4VywHEBQFm?=
 =?iso-8859-1?Q?X9ppSCSxPgS6x2F4WtLbaqt4Y58+JXOPqpWTMnLp9M4RSIu8WGZGhAg0kW?=
 =?iso-8859-1?Q?OwPjr/AGmGIQqAAbZ1CCKfQoS1JN0fG7Fs2eVP/H91kgrICt4dBGQkWpix?=
 =?iso-8859-1?Q?FlKfy4I8MA7rwHxegSBKQEIcTa1hVf8iwm+/voYN+Sh5KbAeX0bWbWdYP3?=
 =?iso-8859-1?Q?2S2cpe7rBWGDeK0+hiR8WyQPlX13t7bPAjm7xZ4BGAUlZrwhOHGJj/IAkg?=
 =?iso-8859-1?Q?pYzYfyl07MIELYB7hDOQ7/GR6xGBLfA9M829m56SY0UlwTDrUpvQwDHArY?=
 =?iso-8859-1?Q?R7no8VFUt/nvmCPdeXmp9J7EkhNC0dxpIEqPrVefq3x1+hsS01B+LJy8J/?=
 =?iso-8859-1?Q?W/XVE/7j40lMtUfQooKPk3Js5kj78Y43CH7UcUafBa014CRkSGSmngh+9P?=
 =?iso-8859-1?Q?Rjjb7VhGPTuoQoxH4hy8eI5Yv1+D8CGxdbPlyMPVJoru7PEp181f94vCt0?=
 =?iso-8859-1?Q?WAosbWLR6c/NMx8b+8Cwvgdp3UK2eNHvxqgAaNuy1zyMHxcHf9vmkq90ZN?=
 =?iso-8859-1?Q?FrWiKYxuyFO7dAPSXxNnPLt5Ex2sd1xAZNY8J3dYef3UwTzSXM+Pa8BFfx?=
 =?iso-8859-1?Q?KVEE9Yn5hPj8igYRNnYVaHq+Yhb3g0bw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QdNJ2WdV33CbE6n3tCVeUv9BKuJBVHX4UXvt9fsc+C5zLlnUylVyxCTIzo?=
 =?iso-8859-1?Q?DMCmrRpiMe8vGye6Z/FXTaU6OvT1P3ceZM2DQT9j33JgyzH5MIwc6bunnY?=
 =?iso-8859-1?Q?tdJuCNDQ34G5pi3zoYer855Bh42ed9JbRMZeQJWF0/omuLQFNi1pPQJJ8A?=
 =?iso-8859-1?Q?2cBrKwiNXpnfSMIL0OtzypD+l3RkHfRbpUJpHJ2LCyF+xJoFazm+ma3tCE?=
 =?iso-8859-1?Q?0SeYgRN44dPuI2bx39TQ3KSk3Hc3mY8Cqtfk7eugjwktpFuAiy1xBfpaM6?=
 =?iso-8859-1?Q?t5/SVCappQ8zhwnj+hdPnnUb/45zUqQ0QsSsuix0Ojm7Sa4ITxl3u6XWE4?=
 =?iso-8859-1?Q?ozGTDa4SW7QWX+A9sKaThNvgawiqeHxeAvGj58ZMhFUHC0x7FLpSVYfPPs?=
 =?iso-8859-1?Q?xbO5Azar/7iGtJhYqtpIlsFkoBwPm7EEzSe8uKRLhX02D91ZAVTdtK5KdU?=
 =?iso-8859-1?Q?tLnFSzm+T9SgiwzJIyoBmRxnTLsJ4cIViUn5A396qivcuy2uxZIeXfzsXY?=
 =?iso-8859-1?Q?uDdAueOwJ3ZMDhtQ0HjLXB2V7whVF5NR1xO2rzI0lsU6d8ge4zOUGv/h3z?=
 =?iso-8859-1?Q?EuBoBmGbXQkMt58wcNRK2Z7ZbJSMaIRLRJKwmigto0KSbUsmENA4lZD7ZG?=
 =?iso-8859-1?Q?bqaAb1rujCXPR4fwJi8Me5IaVO8I6zjAoy02HswoknY7xRdBQjlrO7u8Hs?=
 =?iso-8859-1?Q?KeSE20qdup1DtM/ke8QdEgytr5wJg5Xo/oM6RL8iqwQ5ugJOpK8GdmE1qI?=
 =?iso-8859-1?Q?UTkaRVl3Z3/wLo8y/DU1egb+bjjWtWgNtQm8nH8X9vIqMddsbHh8nyMnVI?=
 =?iso-8859-1?Q?hY0Wt1LaCSRM6pSgqJ7xPuY+hktJ8qwWwMPSBu006S/4lv4SzyL/XzN3Nl?=
 =?iso-8859-1?Q?WIIOiimsTbUuKfvIaGhZoXp4zV5+Uu+dLMy14VmPyKZ1bXXvD21UYxNALt?=
 =?iso-8859-1?Q?9XLKf+gm+NfRYOuh01cC6iwuU+J5qBMVayw71MEbNC5xKxOnOT0FK/1AEI?=
 =?iso-8859-1?Q?WkDVpwrvMpZ9W08iq04G9aJoMYuS6rd4FMVNt79bRTrkxH3mjDWFbNjZ3A?=
 =?iso-8859-1?Q?t6m6YIJi6UKhJPnwVUglJf/lFgxVJ8BSEB6Z6sv1xpvCp5A0h0J/n7JNMy?=
 =?iso-8859-1?Q?Ucf7WHSQsIQ013ZjH+k6/fQWUVGJgCtYLgFrUr0m4qlXvDu2P24ZPcatep?=
 =?iso-8859-1?Q?G8HiDieyMkascDxt2iBjl+pxT+hEKWKuKpFPRTrc26HE8JMIHD7gifLbO2?=
 =?iso-8859-1?Q?cxJs5ShzzumPPNt7b5jMCyB0XclUThG3sjEehK9SH+xYSGtNvN7jCfADcO?=
 =?iso-8859-1?Q?8N7IX9e/l7d2Pkf/1uH5hMTDNVuiblVybFlX8cVO0/vA9X2Br4scwxlfoa?=
 =?iso-8859-1?Q?uuLuOUcwyiC4tuMfW+djsixjk9EDkFMSQ+seRq9dZVBbHOsCt2TW6AYIpV?=
 =?iso-8859-1?Q?hEqA5faUu2JR8A8EjoIXsGS6RsgC2SZKrLaXweSp7VMsKlwkRwe3sjGr53?=
 =?iso-8859-1?Q?3GLHobspR9pwHZ3YcpbeehAR+hJONYNn8FasAAchwO44m6eNpB72ng4/k+?=
 =?iso-8859-1?Q?JCgf0mxncR0YLigf3UVBO1e8Mi7+ogf1dUMEpjT3F76VoBUZHrm+rXvbRt?=
 =?iso-8859-1?Q?WYxiwcjnLEhLdJWaK4TpVZvyjP2edfgBmbMle7ndY957/KV0CWuW8v0w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c3150f4-52b5-4962-6f02-08dd0e4291ce
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 17:48:43.5937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WdXGFKCF0cLQH4UpO2X5sGBH5g0jpNBjQLv4ahrKy9Yy/Jz2GheGl0UF16JjACBdzrB0pDiK+IXa8nuISc+smA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6821
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

On Tue, Nov 26, 2024 at 09:19:47AM +0100, Christian König wrote:
> Am 25.11.24 um 18:27 schrieb Matthew Brost:
> > On Mon, Nov 25, 2024 at 05:19:54PM +0100, Christian König wrote:
> > > Am 25.11.24 um 16:29 schrieb Matthew Brost:
> > > > On Fri, Nov 15, 2024 at 10:27:59AM -0800, Matthew Brost wrote:
> > > > > [SNIP]
> > > > > We use this interface to read a BO marked with a dumpable flag during a
> > > > > GPU hang in our error capture code. This is an internal KMD feature, not
> > > > > directly exposed to user space. Would adding this helper be acceptable
> > > > > for this use case? I can add kernel indicating the current restrictions
> > > > > of the helper (do not directly expose to user space) too if that would
> > > > > help.
> > > > > 
> > > > Christian - ping on above.
> > > Sorry, I will try to give those mailing list tasks a bit more time in before
> > > the xmas holidays.
> > > 
> > > That is an acceptable use case, but the problem is that this helper won't
> > > work for that.
> > > 
> > > See during a GPU hang you can't lock BOs, so how do you want to look into
> > > their content with the peek helper?
> > > 
> > Agree we cannot lock BO directly in GPU hang path (TDR). Our error
> > capture code takes a snapshot of some the GPU state which is small and
> > safe to capture in TDR and kicks a worker which opportunistically
> > captures the VM state which has been marked to be captured. This is
> > where the helper is called and it is safe to lock the BO.
> 
> Yeah that sounds like it should work.
> 
> No objections from my side for that use case, but I would rather like to
> keep the code inside ttm_bo_vm.c.
>

Thanks, reposted with code inside ttm_bo_vm.c. Any objection to merging
entire series through drm-xe-next and then backporting single TTM patch
drm-misc-next?

Matt

> Crash dumping is usually something associated with the VMA even if it's a
> bit special here for the VM state.
> 
> Regards,
> Christian.
> 
> > 
> > Matt
> > 
> > > The only thing you could potentially do is to trylock the BO and then dump,
> > > but that would most likely be a bit unreliable.
> > > 
> > > Regards,
> > > Christian.
> > > 
> > > > > Matt
> 
