Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C88DEA45497
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 05:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DC510E207;
	Wed, 26 Feb 2025 04:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n5+er9mm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC1410E204;
 Wed, 26 Feb 2025 04:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740544952; x=1772080952;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YorurNPBSl2U/0YcVk0jkG7AvfEQ7iEny1jXVSXN4cU=;
 b=n5+er9mmd6iH1LinzvEgaiXrUQcVNI1XTDaK96ovywq1xTUV3GrH+pE9
 dgasG26wHALMJXg80VNTvF9ylNZ0ap+PXJ8z+TcwvBxhlJWFQaLVHLoA3
 ahgovO7GKbRr+nyvF0udUJa20YP4jrTp8/z49hlP2KVVJQZMI0Lo5CLMP
 eM1l602PLk4sUtvGLNMDpAmDOgawAixZwECx+bbSic6kPx7xTdbxeZUr7
 BkDvQjADyYqOKwBTZvM5ErN1S2ytTMNdaOCRggWuTcrDZQzhKhrLUCD4X
 NM5c+OA7IDXQVaw9IbxOhmWqg/o1QDebpzaLtUeLNWVnXA3bjfNMy9VKg Q==;
X-CSE-ConnectionGUID: afoMuXPdRxGH1IGMPVT4pA==
X-CSE-MsgGUID: DCtD5w8zS+C+uhdwX5DuNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="52375179"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="52375179"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 20:42:29 -0800
X-CSE-ConnectionGUID: u4fD/hMTRtCLxIn+FJyisg==
X-CSE-MsgGUID: j+t57KTYRCmS992j4HBWNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="116382598"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 20:42:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Feb 2025 20:42:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 20:42:28 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 20:42:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFayjxDnSUlHLNA5wKSQzjHMHA3TMipg1mTwa0QrzxvMZnxpBXXC6ryq15fNVAk9Ww2M+FpHufrEr5Z3ia4E1Jh6nkvYITskSgmPVB0WmA6ZfvgFM6qJ0dKtm2RTUgqBcGWqmxAJw2yWCiW/VcY6qljGDvVCOuN4XZ3vU1VQZwBgwbwwrtvXaSOZTmzNc7kqJ01pAkpOpM0ZuRZYUtVeMZRA4oZrIPRIKZd4ig1KrPY8121GnYZiLanXGPJ6MQDsoRnzdk9ZB8wEGsRrWrvPeoq1C1yoFRnCwCMJEBcJ+REPXObAL89lnyBubaof1TeNaN3UVrmwJprLeNZ390QqEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ZcfBlF9J5VhVCgt6CaKDbKgV4tUeSd99riRdR9dQZ4=;
 b=JhHGUN0cN6RvaT6M3URtt4nn4WNCcIa3QstRxX3ef3PCMG7HMPHiFPq9x/YI+bvVHTQJ/IywVKpW4QKk5pzqW8xCcJO2/C6WQZnjncixyvZoNoBF24Dr5nuvlgFA301mBSSJgpvqmi68LFNaLyebemMRf4QtgqZm7eBsnKdG29IRkiwRjxwWmdjj9OARKLnUK8SqvdAmWbuH4ZHqpBwp7aIOkEh6Trctb+XOPRNzhdvuNWvjienEWKY2We4JMm+ODTX6UbIPQYXO0Wpig3Xe6NLrKuZxNxjp31a4Q6MrVbO5YdxUNScw7wPrsEgWcNB3S/YtiKUo6zZlCoeb0twkpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB5804.namprd11.prod.outlook.com (2603:10b6:806:237::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 04:42:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 04:42:07 +0000
Date: Tue, 25 Feb 2025 20:43:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <jeffbai@aosc.io>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?iso-8859-1?Q?Jos=E9?= Roberto de Souza
 <jose.souza@intel.com>, Francois Dugast <francois.dugast@intel.com>, "Alan
 Previn" <alan.previn.teres.alexis@intel.com>, Zhanjun Dong
 <zhanjun.dong@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Mateusz
 Naklicki" <mateusz.naklicki@intel.com>, Mauro Carvalho Chehab
 <mauro.chehab@linux.intel.com>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Kexy
 Biscuit" <kexybiscuit@aosc.io>, Shang Yatsen <429839446@qq.com>,
 <stable@vger.kernel.org>, Haien Liang <27873200@qq.com>, Shirong Liu
 <lsr1024@qq.com>, Haofeng Wu <s2600cw2@126.com>
Subject: Re: [PATCH 5/5] drm/xe/query: use PAGE_SIZE as the minimum page
 alignment
Message-ID: <Z76b3lgScK2gbtnG@lstrano-desk.jf.intel.com>
References: <20250226-xe-non-4k-fix-v1-0-80f23b5ee40e@aosc.io>
 <20250226-xe-non-4k-fix-v1-5-80f23b5ee40e@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250226-xe-non-4k-fix-v1-5-80f23b5ee40e@aosc.io>
X-ClientProxiedBy: MW4PR02CA0029.namprd02.prod.outlook.com
 (2603:10b6:303:16d::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a71670f-d1ce-4bd9-495e-08dd561fecf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?luONlooYnFeorgcRstBuMc+VsO0yz3vh5Sw80CQIRSxccbrVnINAzYwEEV5C?=
 =?us-ascii?Q?ZadpBsaP0utBn1RRP65MJC2/5ErmBodXV8Wevunp42gCcFNJJ7kjCqcqvb4u?=
 =?us-ascii?Q?DOfBsEGeKRgB/3GQ5SNw5JV82IL3TqGC6vZVck36iz4b9M1qFiU4sW50X/Rh?=
 =?us-ascii?Q?n2uo3DJyJXeSRD8roYh+qBjYlGBBKPoDdTrQxby4qOb/18BY+ktu40KdSy8s?=
 =?us-ascii?Q?3NfXJ6tz7ic1KB645zUpaOntK8PQee2RD0zOhpnw48C//QOnnGApE8SI7qKJ?=
 =?us-ascii?Q?JpgTIXLbQcdjNqrCQLMVhZ7dRMUcbMK0KGI3yltIb72Vopi/rOwdzZCAn5ug?=
 =?us-ascii?Q?N4vew/ChlGtuGcrhghksJxOYT5frKYUq1gp3xfJpdR6CfWFDScBMenE3CzjZ?=
 =?us-ascii?Q?fe+s+g7VU+9jDPJp9xvctl3BFkI8x8IyfpwlMefRnFsCFH9oM+0Z8AbN/X2i?=
 =?us-ascii?Q?SobVuol+VKtLTL4KmeQ/3o0ZB1FAqdbZEt1FAobkxwp94U50ARe0xsJdo6kD?=
 =?us-ascii?Q?vQ5XNdgIC1F+vaxrsHO61nTjZGxqUu6Z+nHvIkBo9YK/jos3CTUXa2l3+P+f?=
 =?us-ascii?Q?Rh8UGaYoTNX1ENhSXW6Dns5BBoBYoMEMie7QCYYjv051t2yIqXt8+Kl9cde8?=
 =?us-ascii?Q?HjHJjIpGNan0sulJ3eyLdNLPVdPO0Qo8bPGVPyvblyGuiw+CbEEr8C8uxdGN?=
 =?us-ascii?Q?9QGBTFV1gaHr6TIhWekA6aqJvM+95fTT/VyTynvtdjPM08ZlfZ72iHgyo2s7?=
 =?us-ascii?Q?Ie7irZSm9/OQdEGFWCgtvsjdP3+JXsaCkpfGsRA9S904vIbQd3GffRiWCJ+h?=
 =?us-ascii?Q?SzhmVlAwq73LLpzZdqm9J84j1dJDaZAdLs+Rsz5V3wI0V6qWBkNxlP9/Hbnl?=
 =?us-ascii?Q?yRpWW1Gg2K6Jtqy9eDkWoevUO9I2Mploc8pJNxq5TzCxWzM/P0d8TDdn1VBq?=
 =?us-ascii?Q?ubkJo/la/sTVodGgk44EiNMdre+ycYWpsHKm7A9SK4rSN0sMTVoox4gkp9ZV?=
 =?us-ascii?Q?aK1aWQqc/wlATc0Nnrq8RqU2fCEOFwBpNRSfS78Tjv34kgyDUoMeFQ4qp0Cz?=
 =?us-ascii?Q?Bd9jgKRS9FN1B/DHycgX/Huyj8RSLc/IBQ3k01KEbBhLfpfCAVwJEhTvAlh9?=
 =?us-ascii?Q?KCFMp7ePKsoncq5f41ubWO8Gbt1nTiy7Q2BC7O2O4uBbfCncocOxE3O3w3RU?=
 =?us-ascii?Q?FQDsoYj0eTmJvkHNrayG28SPusyQkAILD6NsDJrMJ4zRt7UZt22EZcba4Y6V?=
 =?us-ascii?Q?ZUoZ8ASD/l0BATfptjLPozr33VQeBsO1zI4tqtMqJyVdOJlV4kK1tl/N3xHq?=
 =?us-ascii?Q?iiTxFcdJUWmxPFodEUdqu9GaWEkwP0I5p0phS9DuIhgy6Jl2rWvY2ToaGm4J?=
 =?us-ascii?Q?zf0q49BuTd6+CcFAUWGCD3IvOKju?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vq8twkFpB4JHZ9NRfa8wDz/jDZyo2hNIyQ7qRoETCbQvrRZnn0F2XsHxXwsU?=
 =?us-ascii?Q?ko+App89euUDpwU9vQfT6XQNq29Ed2B6i0zFn6772A2bkxGrzgCnsT7wcVxb?=
 =?us-ascii?Q?TchMCRNzPPJZUM4uQuZZrZxKOShDr+i9GGV6cVoMNt2n4fNfosUC1WJkUxE6?=
 =?us-ascii?Q?4kS4H/TRh34jV+mKn8wqSIySev2eGg8In+7ekAflfi4Y+nVIhlq3N33KT9vU?=
 =?us-ascii?Q?D/r0uO8cVdioJ1bUxarMw3znNMuxx+eFAzT5z7jZVld+IRP3DBs0fwBmTMq5?=
 =?us-ascii?Q?bksuvYiGZjZV9+yTTD9RP39A9zikaMUw6HtD7JFeaFq2zBbpFo0bi4E0rC3D?=
 =?us-ascii?Q?uFSWzZgdHkQbQVe+S4j9jYGA9IQeAFOhErdFFX+3igJlYmzAg8wLJHoq/TwK?=
 =?us-ascii?Q?dxjlvY8xaoTZhEAPtugH9rgCezkHWbzD95mW9owD2g00iGI2jIptgestd1mR?=
 =?us-ascii?Q?oLV57yNqfYHes0ywwZsbZkYFMFvF2OhRAr6hlUqaLP5rMPPC2xudm+p+g5ft?=
 =?us-ascii?Q?uJQ/pbDTK/wXnD6nydg/miAn9yewjFFOX6jRt9WqUF+RGj6O2MFGxEPX8jbY?=
 =?us-ascii?Q?T4uEgIcmPJ686hLSNDnBdKmVm7zgj8vDXBCsTfV+aj5TnMjvbe4E4/jYeG/p?=
 =?us-ascii?Q?ulECwbGVIAoeJRcouFfChkjObxXMdQMfSTaVagWC97XFAMSeBNNCPsfQZchs?=
 =?us-ascii?Q?q3jmQjoEvdA7LdSd+omV4em6PfWuBtV2E0jBRTCLBTB8fMwshz5d2krEH1zv?=
 =?us-ascii?Q?7q04ek/Cfbf8fTP3wJGXe7oFtCORlR1vqB5Khm3ofFB40GyVL9crsK2lN8J1?=
 =?us-ascii?Q?adU57ZnAx5Mny7t0TIUpYSZ44wyXPd5DkSuuvRtgdYHA+BGS+7CYMkHj1kOi?=
 =?us-ascii?Q?mOWYHlpXksPFFpAZl/HjPxqAz3G62ny6YJ49JLrogIwupJxVZbUVLaPDkYxu?=
 =?us-ascii?Q?9yXpKoTwzp+U3AdEn16O0lEf0zhxpJZNvb8DhayZ/E4XkLVQ+TAdRRm+O49Q?=
 =?us-ascii?Q?7XMRUzBBKfep1FbZlGXbg0d6K5QKf40tmqIkZtLwgSqgQa4jL+bhTLDwZttN?=
 =?us-ascii?Q?M4CjCdqmGuMnRvtquq1AcQiqR9sMi2ifPXWCtx65tcKWOTT2oMTgiBjPd42i?=
 =?us-ascii?Q?Dqo0qboPyMYbWKMyxwQ3WSfOuGLsGAhRJuoStOK+WKypAzDt9pF9NqhMXXGB?=
 =?us-ascii?Q?aVxs2Lt+lFvaC1ScTEoqXpxF+5j+mczr5FOwO3F9nxjRTL6sfq02b+6Gk9z4?=
 =?us-ascii?Q?1vefWmUWKFOkluN2QR8KsF7L+DNxBNIvpdwJ6g/yFXg4BqX22lmCmgiepRNT?=
 =?us-ascii?Q?EBm/xMb3YlNK9IP6QH6FIXevhEAK0xvl9flFIjdXhQyrpr+8yQgO6BEkjwXD?=
 =?us-ascii?Q?ZOiDolj6aehPANyWxfIQOJ86X7jKOi3ryHhbIQmHloXXXC0X6owp5FbiC7tp?=
 =?us-ascii?Q?Y2aum5Luwapns7bGuxNGgwRby4OhnIZx9IF2ZPXXSOtlONDdxAmQtDI7Fr4h?=
 =?us-ascii?Q?dNtOAG3yVnInahoMVJJFXpTgvqIM6/97SbcDXXyO/PmSzbzKGv9uEbVy6GGT?=
 =?us-ascii?Q?nSrpzNn+mkMzTWA+JvGhxhPOqzjPNHvpsYUbQFWkHVpT6WhlUhht56/WnSX0?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a71670f-d1ce-4bd9-495e-08dd561fecf1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 04:42:07.7183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0hXzWiNhENHhJoaFFW2KBo9wRiWKcxtDQPBeQKlkKdTj04BT8IU8Th3dANUM8+QuNdWi6fz5OmU18zmPXrZH9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5804
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

On Wed, Feb 26, 2025 at 10:00:22AM +0800, Mingcong Bai via B4 Relay wrote:
> From: Mingcong Bai <jeffbai@aosc.io>
> 
> As this component hooks into userspace API, it should be assumed that it
> will play well with non-4K/64K pages.
> 
> Use `PAGE_SIZE' as the final reference for page alignment instead.
> 
> Cc: stable@vger.kernel.org
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Fixes: 801989b08aff ("drm/xe/uapi: Make constant comments visible in kernel doc")
> Tested-by: Mingcong Bai <jeffbai@aosc.io>
> Tested-by: Haien Liang <27873200@qq.com>
> Tested-by: Shirong Liu <lsr1024@qq.com>
> Tested-by: Haofeng Wu <s2600cw2@126.com>
> Link: https://github.com/FanFansfan/loongson-linux/commit/22c55ab3931c32410a077b3ddb6dca3f28223360
> Co-developed-by: Shang Yatsen <429839446@qq.com>
> Signed-off-by: Shang Yatsen <429839446@qq.com>
> Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
> ---
>  drivers/gpu/drm/xe/xe_query.c | 2 +-
>  include/uapi/drm/xe_drm.h     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index c059639613f7b548c168f808b7b7b354f1cf3c94..8a017c526942d1f2b401e8b9a4244e6083d7b1e5 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -336,7 +336,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
>  			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
>  	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
> -		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
> +		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : PAGE_SIZE;

We should probably assert or build a bug somewhere to ensure SZ_64K >=
PAGE_SIZE for future-proofing. Otherwise, I think the patch makes sense.
One more comment below.

>  	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
>  	config->info[DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY] =
>  		xe_exec_queue_device_get_max_priority(xe);
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index f62689ca861a4673b885629460c11d6f3bc6523d..db7cf904926ebd6789a29d620161ac051e59f13f 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -394,7 +394,7 @@ struct drm_xe_query_mem_regions {
>   *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>   *      has usable VRAM
>   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
> - *    required by this device, typically SZ_4K or SZ_64K
> + *    required by this device, typically PAGE_SIZE.

So I think the kernel doc needs bit more updating here, how about:

Minimal memory alignment required by this device and the CPU. The
minimum page size for the device is usually SZ_4K or SZ_64K, while for
the CPU, it is PAGE_SIZE. This value is calculated by
max(min_gpu_page_size, PAGE_SIZE). This alignment is enforced on
buffer object allocations and VM binds.

Again welcome others CC'd suggestion on this updated kernel doc. 

Matt

>   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
>   *  - %DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY - Value of the highest
>   *    available exec queue priority
> 
> -- 
> 2.48.1
> 
> 
