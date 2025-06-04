Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66E7ACE68C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 00:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF5510E8E2;
	Wed,  4 Jun 2025 22:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GcfsNXJW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27EB10E7E5;
 Wed,  4 Jun 2025 22:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749074661; x=1780610661;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9xNUNdIii/R4QzO8HqwoOwSGAZrCb0q0KQGXcITrRQY=;
 b=GcfsNXJWXFav6VWAr1GTwyMhBux7hMzlozfmjkR9JnwxD0Pz+bYWL69E
 1EhYfqvuuTixNbgwU9bDvIy007xSFNfPrlItk3juDEiyNp1ym3FSF8h7a
 +KDPVpv251FCs4KnSxCdP+ITz4FbhtbTLcIjKCpUSN0i0M3QUfD1Gao+a
 kuYmB4+xjJrY1jilVqZWRBrOcAwFvUuj8sbiFa3m1j3ZKk+SA8AQB5unx
 /zOmo2K3QA11xLe5m7RI39G+JADZIMDF62rTxAO6pwQ4eic+0gfeZ4NP/
 r7fkjpnDorJMS5qIf67L0XXf3GGzLny3zRDllhbnwMNXd1MwULD6xQqX5 Q==;
X-CSE-ConnectionGUID: oAQR/+gvQTq/8kt0og96Tg==
X-CSE-MsgGUID: CLBnz6tcSsWZI6sXscQnlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="54976240"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="54976240"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 15:04:21 -0700
X-CSE-ConnectionGUID: dUabE9V2SWWvwBjUXUL1sw==
X-CSE-MsgGUID: csB0jyDJQz6iSamOl/tScA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="182519351"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 15:04:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 15:04:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 15:04:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.54) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 15:04:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qFHzIZDsx+B9jW2IEBoPDbdL5lS48uQRWLqMsfMEP+VHuIGPf36JmkfLNBCtl0YQUSspzQLZS81FQFVfYXyqZnulIVozkA7cgAE155eJhELIjrVvDCIiNrtC3qQd43GLVN1qPYpEEp4I5buAMWSbJEwOfAB0yqpwdwzdfZCIo6LTqo0+LcJPJkd+raNttM/LOb15VDKrnoJlHMmHqLhCT6v4rl529izwJqxtGDamESou8yv7SlErZsYkF5wqXl7cmNvWWBlKeH6L+JEeR3pVNeIpKajoEggMod22ROjexSljpL6VqR88JlJ0I9Z7Bs3zdVYTxd7+adJ5nYTvqeCChw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xadlyATQqZ9xX1BGJz1xURLJrR0GYE/hwRKPKCqjJnk=;
 b=ke3XY1EbNdmc04Ch039fYxwvxjdkWO5Yno2UkEjWtZFiMzviaKf8pCTwmQyugX0unSMWQcvKwfSIcHM/tDB5owGvlFPMTyXB0QW8WrbwlMd4nm0ySSNobIDBVwgXD9h+cYgCh7gYDcChlWfzmxAENkbXmvQTnb4H7lTYLwyTKOvlxYRE3Lo51BAsVCTSSq9CUGWMWZXjtTVZr6Kz4DhI7RGbkI3kmrFocx11a1PZDztjXjZOvFcjgAjTa66zNBAEYBRdiqsNJDSlPskQ8U/19SYqG580iZSRobac7XEQhEswpYy9wsb+1+mGtN9n9Wtqh9QeIqlnklt2r64cTbVdNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8569.namprd11.prod.outlook.com (2603:10b6:510:304::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 22:04:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Wed, 4 Jun 2025
 22:04:00 +0000
Date: Wed, 4 Jun 2025 15:05:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v2 2/3] drm/pagemap: Add a populate_mm op
Message-ID: <aEDDLUdBQNXwcjKm@lstrano-desk.jf.intel.com>
References: <20250604093536.95982-1-thomas.hellstrom@linux.intel.com>
 <20250604093536.95982-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250604093536.95982-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY5PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8569:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aa0ce4c-0c63-4f8b-6007-08dda3b3b613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?TKNxAaZJBa/8SiJx8SPP38quUPLFEm7SdlMJPYS2qzaxzgM7/3m7HIHTsk?=
 =?iso-8859-1?Q?d+M6Rxhd/9hQW9F7izU7zsuflZb/X1E+DTcrse1qryPxmAe2tObBLMzaWW?=
 =?iso-8859-1?Q?GQC3+MGlrPBDhG+s9cZNdYzZm/5cEbcxQXZVikVgfB5yNI363cdtS/Rnl3?=
 =?iso-8859-1?Q?Ws/8rrINkht/T9XPkui8FTi0xmfOaZLn4snAv9FXcjw7z9uZmzV6OwmgxC?=
 =?iso-8859-1?Q?4co+z4OfoaKhk4I5DBHTUABj+IKyZCmt7LXXxEk3ozahIdgCRboz16Ax+s?=
 =?iso-8859-1?Q?sZ3aAPHoiCodrmPEwIrbk48lCyoWhD7gAKc2NcaJ7i+PuNVhpJiqU0Vk1n?=
 =?iso-8859-1?Q?/yxgi3PWcJtgmG33Inj3Mu/MO4iAQpwgICJUoU/0SeGaS8J81MgXSAfBi/?=
 =?iso-8859-1?Q?4e08/c8+L9WEuQsiaOx+lO/2yBu0hc4W3Y0SG3OuwyC05fnLPIxqY64heu?=
 =?iso-8859-1?Q?NWxZuXRXA3OaFQ4Du4MnOX/s9c+sSJyL/4DgmO1y99e/7wJj4DXq1tLX7x?=
 =?iso-8859-1?Q?KR+CFdB89mZXfwJ0nVO1gzfdlJEORa4IIOkxBKlA5noTO+sx6td7FjihGq?=
 =?iso-8859-1?Q?7/Kj+xV1L7xCU1dHsZXEORPedcNwR+zgsnnfXoOIm+8zLNc10qy28iviyS?=
 =?iso-8859-1?Q?/tKWrVHzn1rhP0ZUh+7tfOO2PsSsAxpRdvjNmVmrqtbU4Oy+ESJ+CIPmry?=
 =?iso-8859-1?Q?nlVrEB2Dk0QwOfn0mZ4QR9Vn8tMQ8VBJ/L9CQun8L2zXRzIAq8BIji4vmR?=
 =?iso-8859-1?Q?rMr42OBA0MaEKAHNO31SMEDaWfVRBfuBTfqSbdTCO/nJuiHqoi8jMYq9xO?=
 =?iso-8859-1?Q?cvXAqmDyH+gyWr5DLHrCyDWZoZFyI3H9rSZFz6U3JLeaR7ty7p8R2fHqJa?=
 =?iso-8859-1?Q?9+wzTWtftjsHufRsh4wkSiK3wftE0gGizqIS4i9UEiD7/+2yjnaRIWNjnx?=
 =?iso-8859-1?Q?sExQcNNmHz8/i4bVdLQlgvlkR9VaoQGNb0wALtm+KnqDBwjLAqe09t+UGk?=
 =?iso-8859-1?Q?Q1jWZgoWpg951t6EjY8uQISPJ32L7DnOJj3rBl6Via1TBC9VpOSa9+4myP?=
 =?iso-8859-1?Q?mHTGe65rze5SZeZ2xHKGzNGd+O3oBIIhYfa+Z5SVKZ0QKIo60AqunoZ+P9?=
 =?iso-8859-1?Q?S4SBezrDTF06BxMPV1TehByG0pZsMY43htsOtjRc3Y9KnncJOc60GCD4T6?=
 =?iso-8859-1?Q?uxtaIZAWb+ZtoQxiojmsIzQR+IO3StFFACJ29OmMcF+4bHFSGWJ1fBmurd?=
 =?iso-8859-1?Q?SU+TZoKbDYbqDYL3Gb1ytPcPty+x1uDsluFyDB95zwX1xWEON9iuB9Lhkg?=
 =?iso-8859-1?Q?UsFEaZIpIIizAl+dFoG5pGrvc1TGMNsMJpxrO2h3CwFZRuSw9D5xSrFfrV?=
 =?iso-8859-1?Q?ViP1Kt6TE52y/Nm+LZ5i4HN8zy3X4SjTv2qeBe8rGSBu0ZJtOyyKxQNBxE?=
 =?iso-8859-1?Q?BTzTY7akJBFncaGCfSbz4cfGRuQyr8Nzd70uy3TQMAKTGjuPPizFK90ySr?=
 =?iso-8859-1?Q?s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ckPQRXwGm5Rp/B9VC8sBrgjbm+QU2CA2IkcEtNck5JGBs91641eSXL66Bj?=
 =?iso-8859-1?Q?WcliHpUiKpMJuE/WapZcDTRx6TB9yxyp/T2fxDEgXdCe/Tmgdwj9/AAChC?=
 =?iso-8859-1?Q?ElpV37YRAMUqjpTNsTZgV9JXlYBzjNEg+J8qjv1ObyH2E4nwaPdrN/wHmp?=
 =?iso-8859-1?Q?4kIjybj7HQhfexbHvXadsvbeDloA6aKjfTuZQiXhLv13CiU4TvYF3XYpTS?=
 =?iso-8859-1?Q?ocgFE1M5/fKD9gCu5QusE8ovcX4N2UBqH1sATqLlpaqJFE2H0CuuJA0Lcn?=
 =?iso-8859-1?Q?m+m2/t6ljEliWNqQIMTcK2EFX3sQHuAj5KFLI2TDYqKtghh4T9fJpEV3Y2?=
 =?iso-8859-1?Q?rJ91w4uzixzVsFeScBg8RYYj6PRrpWZHS/OfuQdTDO/e2+kcYvdunwLggG?=
 =?iso-8859-1?Q?9YZ9V5Jo4B7AYDq9NZ/TRgkoxp6k0D1DXs0Eh5ma7WBtXzFDsw9VWOWTm2?=
 =?iso-8859-1?Q?mQkIX5PwwymnsKPf9/lmZMvtsteX3BQ/x+de3rICBWqVPLzX/d2xUsJI31?=
 =?iso-8859-1?Q?h5QdhcuGBxRSv65Xx6RYq9CDC9ue2XGFMNQ0OP+RFp2fJDMgyMTIQZB8Nu?=
 =?iso-8859-1?Q?hZSE7RmNtRW/cpJPBZl7tzQCug9yHgv5Vz7ebO2hDYPtOErNZ1f0zs13Hi?=
 =?iso-8859-1?Q?ZjRODl1U0/jqUdduhaMtv0ke011MOfeSTofKerXzkuNLWwlok1lyW2A5C7?=
 =?iso-8859-1?Q?rFAKg+OO0DA6Nty8SABsB8LTc3w7aIDXjX5x81r9SybcSTTNILGZh9Toni?=
 =?iso-8859-1?Q?YaxucNdCkY65ml8fEPV8CqDMWkkvkxGoUqjYUOn+1fMBBhOtZf/6kFRM1k?=
 =?iso-8859-1?Q?J0ccqTvUatEyLDb7xvs37teOSl3HSYsMCvIBu++FkNqYuT+G6B7XN4KeyG?=
 =?iso-8859-1?Q?/ADrlgcisF8ZGfNjQFCxiQFqScdl37C+B3q6Pu0QxBhT2l1te8ciRMUEZ9?=
 =?iso-8859-1?Q?TLwaUoOUErl0JqmSgM3WHtY31muAgjdRQaetVBJRWbF4p8RnaxkvwHZTiO?=
 =?iso-8859-1?Q?Bdq8dKAyxBbdMXtvIF0ItxP/Vn2UemaBrxt507ylAfADacCYA5evDwS9qS?=
 =?iso-8859-1?Q?Q/Uagk3eAWk3TdfrN8Bewb4tTOd+NaTys9o0NlttUjAc9dwMlcC9laORk5?=
 =?iso-8859-1?Q?rlMxGowVgfff7/1fvnYag06t8vkRcgxiCSn8Hc7CGn/iq4s4cRjVrI5esl?=
 =?iso-8859-1?Q?YHXqr4v9W7pfNl/yVGSW3R+9UmpPThfjGphMHDa9lZnwCmoe34J8jIOnM7?=
 =?iso-8859-1?Q?GiCEOMjOZkBY+jmD5IZnP/9l7f4bmJbY3BUERzjrFDC154RUp+OjilZcQy?=
 =?iso-8859-1?Q?dFWHns4e0XReqLk17m0IDrZBeMbFRwrmTsJzyZ+/GA0LQtvFYe9H/eALdn?=
 =?iso-8859-1?Q?o8YiBx5W/rL8tBhE4C7aFqvmosQ24Q8ts+qNoh1vX3M1RNVpalIGH/8lbJ?=
 =?iso-8859-1?Q?tz6TUzP+egAal2ymsOYQe+VHPRafTn7jGH24JY9DPTW4y7M8SMOX5mpdYU?=
 =?iso-8859-1?Q?FmjOnX7h75rW8AVD8TAII01RFQvq5LcfiAivmShcYM8E48nwxaKXyVBPk/?=
 =?iso-8859-1?Q?5TYMe0jib3WUueAo0TVoVWUy6uwKZtw8Gr291m6FUzbHq7fFkntL5F//e/?=
 =?iso-8859-1?Q?9BtQ327Sj6/Bqlh9YFlTPD+/wlOEQN9vFauQavym3BImT6ABOiJvJ3Gw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa0ce4c-0c63-4f8b-6007-08dda3b3b613
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 22:04:00.7576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2uMxd4nwcaaIbrZQ5eq0pzNvprpnC2O5mN7CbWNmDY3HaQAYuI6/HNYej2W3jXFpPpjwrJcW8YHn4+1fEa03hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8569
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

On Wed, Jun 04, 2025 at 11:35:35AM +0200, Thomas Hellström wrote:
> Add an operation to populate a part of a drm_mm with device
> private memory.
> 

With the kernel doc fixed:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c  |  7 ++-----
>  drivers/gpu/drm/drm_pagemap.c | 34 ++++++++++++++++++++++++++++++++++
>  include/drm/drm_pagemap.h     | 34 ++++++++++++++++++++++++++++++++++
>  3 files changed, 70 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index ef81381609de..51afc8a9704d 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -175,11 +175,8 @@
>   *		}
>   *
>   *		if (driver_migration_policy(range)) {
> - *			mmap_read_lock(mm);
> - *			devmem = driver_alloc_devmem();
> - *			err = drm_pagemap_migrate_to_devmem(devmem, gpusvm->mm, gpuva_start,
> - *                                                          gpuva_end, driver_pgmap_owner());
> - *                      mmap_read_unlock(mm);
> + *			err = drm_pagemap_populate_mm(driver_choose_drm_pagemap(),
> + *                                                    gpuva_start, gpuva_end, gpusvm->mm);
>   *			if (err)	// CPU mappings may have changed
>   *				goto retry;
>   *		}
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 3551a50d7381..25395685a9b8 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -6,6 +6,7 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/migrate.h>
>  #include <linux/pagemap.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_pagemap.h>
>  
>  /**
> @@ -809,3 +810,36 @@ struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page)
>  	return zdd->devmem_allocation->dpagemap;
>  }
>  EXPORT_SYMBOL_GPL(drm_pagemap_page_to_dpagemap);
> +
> +/**
> + * drm_pagemap_populate_mm() - Populate a virtual range with device memory pages
> + * @dpagemap: Pointer to the drm_pagemap managing the device memory
> + * @start: Start of the virtual range to populate.
> + * @end: End of the virtual range to populate.
> + * @mm: Pointer to the virtual address space.
> + *
> + * Attempt to populate a virtual range with device memory pages,
> + * clearing them or migrating data from the existing pages if necessary.
> + * The function is best effort only, and implementations may vary
> + * in how hard they try to satisfy the request.
> + *
> + * Return: 0 on success, negative error code on error. If the hardware
> + * device was removed / unbound the function will return -ENODEV;
> + */
> +int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
> +			    unsigned long start, unsigned long end,
> +			    struct mm_struct *mm,
> +			    unsigned long timeslice_ms)
> +{
> +	int err;
> +
> +	if (!mmget_not_zero(mm))
> +		return -EFAULT;
> +	mmap_read_lock(mm);
> +	err = dpagemap->ops->populate_mm(dpagemap, start, end, mm,
> +					 timeslice_ms);
> +	mmap_read_unlock(mm);
> +	mmput(mm);
> +
> +	return err;
> +}
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index dabc9c365df4..e5f20a1235be 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -92,6 +92,35 @@ struct drm_pagemap_ops {
>  			     struct device *dev,
>  			     struct drm_pagemap_device_addr addr);
>  
> +	/**
> +	 * @populate_mm: Populate part of the mm with @dpagemap memory,
> +	 * migrating existing data.
> +	 * @dpagemap: The struct drm_pagemap managing the memory.
> +	 * @start: The virtual start address in @mm
> +	 * @end: The virtual end address in @mm
> +	 * @mm: Pointer to a live mm. The caller must have an mmget()
> +	 * reference.
> +	 *
> +	 * The caller will have the mm lock at least in read mode.
> +	 * Note that there is no guarantee that the memory is resident
> +	 * after the function returns, it's best effort only.
> +	 * When the mm is not using the memory anymore,
> +	 * it will be released. The struct drm_pagemap might have a
> +	 * mechanism in place to reclaim the memory and the data will
> +	 * then be migrated. Typically to system memory.
> +	 * The implementation should hold sufficient runtime power-
> +	 * references while pages are used in an address space and
> +	 * should ideally guard against hardware device unbind in
> +	 * a way such that device pages are migrated back to system
> +	 * followed by device page removal. The implementation should
> +	 * return -ENODEV after device removal.
> +	 *
> +	 * Return: 0 if successful. Negative error code on error.
> +	 */
> +	int (*populate_mm)(struct drm_pagemap *dpagemap,
> +			   unsigned long start, unsigned long end,
> +			   struct mm_struct *mm,
> +			   unsigned long timeslice_ms);
>  };
>  
>  /**
> @@ -205,4 +234,9 @@ void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
>  			     const struct drm_pagemap_devmem_ops *ops,
>  			     struct drm_pagemap *dpagemap, size_t size);
>  
> +int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
> +			    unsigned long start, unsigned long end,
> +			    struct mm_struct *mm,
> +			    unsigned long timeslice_ms);
> +
>  #endif
> -- 
> 2.49.0
> 
