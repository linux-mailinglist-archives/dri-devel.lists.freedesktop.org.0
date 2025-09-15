Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3687B582BA
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 19:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD2810E50F;
	Mon, 15 Sep 2025 17:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zkreus1j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE5710E10E;
 Mon, 15 Sep 2025 17:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757955906; x=1789491906;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YYPaZypjXf3qByJ+LKoiVVb9R2e6NekpAthPZCIJLyQ=;
 b=Zkreus1js/q0GpQvoaiFiDVHRljY7EYKyhKmr0M4QwApN3LYdSPWzJ/Y
 0WWbGRCzWdjMrzoOwTgxnBL8cvfkom4bt0jTUdb1sMDMQtRKYdgrYfGyD
 ufPEUo2de3KOjIGBFN4uOALRGSqNjofNn3JV3RwJpeABEYoUViHmH4DoX
 Edfk1JrB1FToEb7FpW/vMt2872haBofZvzBs5H//hOcxr6JE/jR2e9v8h
 khW+aeZ9Z+pB7sX5V9at1L3tD8hDK0fragIEbRhJ5/lx4UmA1UFW4Odlp
 o5XRvcLZYU3kCZR9C+33g6JqVhbloZoy5kBeULBATXnjx15FIjtvSjvmi g==;
X-CSE-ConnectionGUID: e5mQXjlASWm8JQxP1BCAiA==
X-CSE-MsgGUID: KMZLsQ6GQjivDslnzDImyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="62853984"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="62853984"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 10:05:05 -0700
X-CSE-ConnectionGUID: TNv6z3SbRQG4wdqwKlnnmw==
X-CSE-MsgGUID: 7I1xWa1UTSev0rldURMGHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="175094701"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 10:05:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 10:05:03 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 10:05:03 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 10:05:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LHQ+M+dzs1uQDFXOX7AAGLXM0w0aaYyvadL+sx9HDhKvDLROkwItnm9mogqRwpBv4BC4nG2dxAxBrL7Fq1Yi9AgTh0/eXoi5GIxvWD7tYEp33gVg2TEccIKy12/VeGyBDwhRTkDhPKt9wPQQlX2zvpfGrvM6dmr99dIJNUshqkdxKLf60VL3ek2hD9sCyLFdADU1TUH4J3R657cPaR9PdNpMjO1A+TYHNsndLoLhlRYck3iEo5D23f8yhTqaQW8hrxh+NJazl30Syuxr9GV8uvv3IqI71hmGEpcmZtpLY8hV2D65Nu7Ju6k8ORM+Y44Xl0alSooT+gWsx6TkmTk1VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLmkSb/5Ky/zgmIEirYXEVVW36LIrdBtsC2Pso4hxR4=;
 b=ChUDs9XMGHneHYcK15g/sEfEn/Atn8FP5TAroQUKUBzhHVErY68OMMts0jSDpGw12ZmzEbRDB+lfGWEnwU2KKpTU/0YZTHMSHRTc/cFF5IXWJqtdWh3Os6GCzN4cmjR+9Ti86sYJr9BiLqbTrsxtTMLdarNzL4GszbFMgsS7ecEZLS3my2yHzXjTDG8lCPkYFGoFWH359lT6PPQTJCnSeU4VNbyWlp+89J+skDpyy69QjyxB+0JPWWzLqU+nZ4OR9igXeG1Fr+5+6M+jYzxGjovisSAObMn1YCkZKoTMDAl+x7zjio20YS3tbUYVGaktRchUMI7qj1ycAutsbeTcsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB8805.namprd11.prod.outlook.com (2603:10b6:8:254::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 15 Sep
 2025 17:04:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 17:04:58 +0000
Date: Mon, 15 Sep 2025 12:04:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Christian
 =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, "=?utf-8?Q?Micha=C5=82?=
 Winiarski" <michal.winiarski@intel.com>, Alex Deucher
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>, David Airlie
 <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 ?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Michael J . Ruhl" <mjruhl@habana.ai>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 00/11] PCI: Resizable BAR improvements
Message-ID: <wqukxnxni2dbpdhri3cbvlrzsefgdanesgskzmxi5sauvsirsl@xor663jw2cdw>
References: <20250915091358.9203-1-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250915091358.9203-1-ilpo.jarvinen@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0071.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB8805:EE_
X-MS-Office365-Filtering-Correlation-Id: 75239d60-9000-4494-64b2-08ddf479ffd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?vGNjZM28kr6V8JI11y4MvKGGBOdfTgmV6gl3EW7UOJAKYTwTiQkKsV5ykz?=
 =?iso-8859-1?Q?5lG/RIaMDTbXM/7iveYuNd9H9c5LgdHr8g6H9eGKv9MUo2ZCsCk5CVoOee?=
 =?iso-8859-1?Q?+KLlt7I9kh+aufMnUHbR0rDlBa7u0gx2apeErSCw4wyQHaCtxbJpVx4Wvq?=
 =?iso-8859-1?Q?GDw3WZqXHiU6R2EjAMd0goO2G0yG/7Zs3SrsJc+8XJ9vK9XC+PJQ0ieVo6?=
 =?iso-8859-1?Q?GDC6KDcv5SzM7Au71IkSxVWARoysEc75VyBKIiAEyHNUwPyWqOClEHGD1f?=
 =?iso-8859-1?Q?QnV/glostv/xAxP4MQHww0rQJTdhEIADvit53gjLfzE4v2GK7hZy41Eop1?=
 =?iso-8859-1?Q?BwidtMAq0VxdqaEBv0uBdV0GeeUtHHLSV5AZl5Ce1plA1kL3m72D65xj6p?=
 =?iso-8859-1?Q?QsOxaKs/BZOX91e7vilpAd+KqarrzhtG+EO389bEw2Ei0ds9xQjE4V6Pdp?=
 =?iso-8859-1?Q?8vxPcQMzfv/qdbD5nKtLBf0IO05AUWHem0HDge+K//H/cyT4dI4E9iOQQ9?=
 =?iso-8859-1?Q?aFWzSxZXdFwHOrx542mWmRQfE7tQay3/r/Y3/HbMGH+fbtwbMiSAG4BT4C?=
 =?iso-8859-1?Q?K4w0di0NmxDp4ATYvHu8D8Y1VGmAsxRug015EVniA7L9BGRX3v5I2FYL9/?=
 =?iso-8859-1?Q?1p4ei8jfEvT0UhrjV1unL/laMwGL8XC3LILmcPFyOwdl+8wuyZbLM3wMr6?=
 =?iso-8859-1?Q?2L+vF7hEEWz6vvQyQIsFKmTTgCj3L+E23hTiWEPKY9HtLsutSl1D42/HH6?=
 =?iso-8859-1?Q?j3D21OMKahBTdcgiC6gxX3h5TLn2CTHR4pnupdQjBPgpIyM72FRNpiL/0b?=
 =?iso-8859-1?Q?gPHKs24ZtkdJfYbU4Cyv0vri2vmkyXzldu4l8F2GlXeq1R8EXLEVHqHTee?=
 =?iso-8859-1?Q?6MloO+dEEE5M8MiI4kp02d+wHRFPEymeQ4wWybJSZJcRtaozkgKvjK9N9N?=
 =?iso-8859-1?Q?Z5cwdvZNPe7OmGg+Eb9WZnbFjw0qLt7RSVvMdguLThQ2Lwe/ZgojYSDwmk?=
 =?iso-8859-1?Q?JGS4zu/2VoXESniESVuICyaONL3bKstnaz4+EANH1OeSL7wTbuSO+FfMY+?=
 =?iso-8859-1?Q?nF7f3Tdx0r245bXwntW5s3zmPnDHqAszRIYFWIXRyokS+AP6nPN58KFy4+?=
 =?iso-8859-1?Q?WF+8WvfkFPsQIXi9Dba8jUIe02NysroYszw6SnMYVCfIkKnhh3foLi+Gel?=
 =?iso-8859-1?Q?8mZahW581sFC7hgaQLZtGv729KE0oHHFGP1/MUcYLDj+/WvvZwVE2qDrkD?=
 =?iso-8859-1?Q?6ebD3P/G532pyFgXzsV9OQP42DRBRCpRER38Tt906elJklgxoV8ZIScVDJ?=
 =?iso-8859-1?Q?V/KapgUBnapHllrmVjcmtrv1LBe7gTYoXPB2590WeQXcvXbNXZeYDlntmx?=
 =?iso-8859-1?Q?6VABHcyq1dF+CSf5fKp5vy4Nfzn6qSgxIDYQ0dCpeatxmE/OPBlxB7tkQI?=
 =?iso-8859-1?Q?r84mPdw0mmnvvUfmeiXID/6ZWZj0QwhvFwRDd4kgwvCN3GbBvNOxfi9lVu?=
 =?iso-8859-1?Q?s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FXCviziYuhehGS/3hFYtW3r+HiP8Z66uio2ofNm4S0hcZ0oRzfrFAjzv4u?=
 =?iso-8859-1?Q?+OBtgx8SFDXGsbbPWQcEgkFve4N2ISRT4SZtSeS/JeBBxvLzYNbRf/7gOl?=
 =?iso-8859-1?Q?mNuNdR0RJn3y+hY+oZCXpgyuqH6N85aSKKHUqKfSM8KOGu24vN57vZr/zc?=
 =?iso-8859-1?Q?GzEbJ2vzFkTAIJl56lLu9Y/zCxoaEqQBZr3cVFyUk7RDCnngvzrIlSsGZb?=
 =?iso-8859-1?Q?jgbVOMT2vmsi3h8iNV0CR4wuzvU4xoCNqYrn8oy8K9ifW+UInMBaD3S7eq?=
 =?iso-8859-1?Q?oqc9bPb1GwO9/TDgsfDny5upJpmnaeBjwR5AGC/MaFGU38Rxu1Rhi9WKl3?=
 =?iso-8859-1?Q?ekAAZocb+WXDWt3uDdXqU0VwH+kqlKxsmEgbSNum1BBOIrgZqiICsNvsrw?=
 =?iso-8859-1?Q?6TNdJzsmVM7jI+hFQpN9Z288eiAa/7gYM9BGSloK8y4iMD5TWV7mhRpD8h?=
 =?iso-8859-1?Q?iNjTNVjRU8Ow4Yr7aDGpYNV32RiWn16Aa4DWofgduIaNufR+QkUkGpCu2A?=
 =?iso-8859-1?Q?pqVcGArcHy0j3yA6HLxUBHZ6UKqSQTG15UxGh2853ekSV3Jf4cRKU78OKN?=
 =?iso-8859-1?Q?BbmJ1qg7rc5CWEH54es2lEORzvf06arq8wgpY8rox7nsr31GoxAetk1FB2?=
 =?iso-8859-1?Q?P8DJ8KWokX1xMM7NC/jtNXtYa9TUOKuPRcrSJ+QMvt/23PHwrDB83lKmR4?=
 =?iso-8859-1?Q?HQQLWCoPiSQf4SiEpMCOTbA+bCFPhvquggB476yDsbWbt5fj/vw591rfw7?=
 =?iso-8859-1?Q?SGPx324TqzAmXZJ3tgf7dartcpvyX+9DeG47J44Bc/iS4EOU7eFlgLHxZa?=
 =?iso-8859-1?Q?aMWwg4nOAeMFC3rriXffRDByfI4Zz50zjFrcCwqe6icUKndE9uXVTsNL9y?=
 =?iso-8859-1?Q?ZAHZu1+Y5frjTuo+glIA5C6gl0Cy3oWC6P73yf3h3VFwPItyXHE07umRIb?=
 =?iso-8859-1?Q?OkVHmUXtU2W9T+1yANYXDRicSgekrv9qz5UGwOZZ+f4wLGdLOTI5liRdBZ?=
 =?iso-8859-1?Q?+MwgzBZlCHnFD6s8jjNmSt4LkopHcKPmJe0DQS5nQ3nyN0jjeJgk9Aa7x+?=
 =?iso-8859-1?Q?aQyOjotOrzpEFYxfSrbKo9gMIBUepVYyllziwppCSzgbDI1nfykB/Fk+Ou?=
 =?iso-8859-1?Q?i41oOoTvZRkW7zcfkuBZes7+b+2VHmtKbGL/sCcdELjRefU12FEkOqmIa1?=
 =?iso-8859-1?Q?jDj+uTVxf++VRoM8hz9ewhjRpyhgVcw4VlL0pX+U5ajD3q2PgkKNlNvvg1?=
 =?iso-8859-1?Q?3AxugZBZt2fDUDcmNflZ2XcOjmJ09msy7o5OZGsnQ8q9hggUSVIn9vsDIB?=
 =?iso-8859-1?Q?Vgo7xW9QdTnZ62RMWOMCy86UqKgxBD0J1FVPIItG3/mkc70hhmiy0XGEAW?=
 =?iso-8859-1?Q?Hdwyf0U1L46G61BRAvDQIyK9X4QbOz4bstOf+ij1r9RmJt42fdTfVf5rnb?=
 =?iso-8859-1?Q?KV+cZ07MewRCJO8YD3FjYT46ZYZ+gtgNmnYT94NzO47vn8r3AS2mwVylOP?=
 =?iso-8859-1?Q?cE5x8S6V8HzC9pBlmu00pvlAwlW8h1LyHbGn5uRNJjUP9BTadVXojJipK3?=
 =?iso-8859-1?Q?5WZX6XSErKdM8ZaDlANBvFBPjoFvUgaR8agBJexGzc9yFOf7/Un3hcdTUf?=
 =?iso-8859-1?Q?zHJGeAuNiC57CGx4aGYtXq1idmTJhz8UEINyzjvFiA828inlqeIYOQug?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75239d60-9000-4494-64b2-08ddf479ffd3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 17:04:58.4007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YpbCg1oYSXht8JUcr/fWXHvf0xEIdpCKAyRl814ifbydikPJI0K7nN6SHfuC5II9NRJ/hGIkPvcTvshJFFQKRMbM+Jd6ZNWwHyF51q8faZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8805
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

On Mon, Sep 15, 2025 at 12:13:47PM +0300, Ilpo Järvinen wrote:
>pci.c has been used as catch everything that doesn't fits elsewhere
>within PCI core and thus resizable BAR code has been placed there as
>well. Move Resizable BAR related code to a newly introduced rebar.c to
>reduce size of pci.c. After move, there are no pci_rebar_*() calls from
>pci.c indicating this is indeed well-defined subset of PCI core.
>
>Endpoint drivers perform Resizable BAR related operations which could
>well be performed by PCI core to simplify driver-side code. This
>series adds a few new API functions to that effect and converts the
>drivers to use the new APIs (in separate patches).
>
>While at it, also convert BAR sizes bitmask to u64 as PCIe spec already
>specifies more sizes than what will fit u32 to make the API typing more
>future-proof. The extra sizes beyond 128TB are not added at this point.
>
>These are based on pci/main plus a simple "adapter" patch to add the
>include for xe_vram_types.h that was added by a commit in drm-tip.
>Hopefully that is enough to avoid the within context conflict with
>BAR_SIZE_SHIFT removal to let the xe CI tests to be run for this
>series.
>
>There are two minor conflicts with the work in pci/resource but I'm
>hesitant to base this on top of it as this is otherwise entirely
>independent (and would likely prevent GPU CI tests as well). If we end
>up having to pull the bridge window select changes, there should be no
>reason why this does have to become collateral damage (so my
>suggestion, if this is good to go in this cycle, to take this into a
>separate branch than pci/resource and deal with those small conflicts
>while merging into pci/next).
>
>I've tested sysfs resize, i915, and xe BAR resizing functionality. In
>the case of xe, I did small hack patch as its resize is anyway broken
>as is because BAR0 pins the bridge window so resizing BAR2 fails. My
>hack caused other problems further down the road (likely because BAR0
>is in use by the driver so releasing it messed assumptions xe driver
>has) but the BAR resize itself was working which was all I was

is the hack you mention here to release all BARs before attempting the
resize?

>interested to know. I'm not planning to pursue fixing the pinning
>problem within xe driver because the core changes to consider maximum
>size of the resizable BARs should take care of the main problem by
>different means.

I'd actually like to pursue that myself as that could be propagated to
stable since we do have some resize errors in xe with BMG that I wasn't
understanding. It's likely due to xe_mmio_probe_early() taking a hold of
BAR0 and not expecting it to be moved. We could either remap if we have
have to resize or just move the resize logic early on.

thanks
Lucas De Marchi

>
>Some parts of this are to be used by the resizable BAR changes into the
>resource fitting/assingment logic but these seem to stand on their own
>so sending these out now to reduce the size of the other patch series.
>
>v2:
>- Kerneldoc:
>  - Improve formatting of errno returns
>  - Open "ctrl" -> "control"
>  - Removed mislead "bit" words (when referring to BAR size)
>  - Rewrote pci_rebar_get_possible_sizes() kernel doc to not claim the
>    returned bitmask is defined in PCIe spec as the capability bits now
>    span across two registers in the spec and are not continuous (we
>    don't support the second block of bits yet, but this API is expected
>    to return the bits without the hole so it will not be matching with
>    the spec layout).
>- Dropped superfluous zero check from pci_rebar_size_supported()
>- Small improvement to changelog of patch 7
>
>Ilpo Järvinen (11):
>  PCI: Move Resizable BAR code into rebar.c
>  PCI: Cleanup pci_rebar_bytes_to_size() and move into rebar.c
>  PCI: Move pci_rebar_size_to_bytes() and export it
>  PCI: Improve Resizable BAR functions kernel doc
>  PCI: Add pci_rebar_size_supported() helper
>  drm/i915/gt: Use pci_rebar_size_supported()
>  drm/xe/vram: Use PCI rebar helpers in resize_vram_bar()
>  PCI: Add pci_rebar_get_max_size()
>  drm/xe/vram: Use pci_rebar_get_max_size()
>  drm/amdgpu: Use pci_rebar_get_max_size()
>  PCI: Convert BAR sizes bitmasks to u64
>
> Documentation/driver-api/pci/pci.rst        |   3 +
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |   8 +-
> drivers/gpu/drm/i915/gt/intel_region_lmem.c |  10 +-
> drivers/gpu/drm/xe/xe_vram.c                |  32 +-
> drivers/pci/Makefile                        |   2 +-
> drivers/pci/iov.c                           |   9 +-
> drivers/pci/pci-sysfs.c                     |   2 +-
> drivers/pci/pci.c                           | 145 ---------
> drivers/pci/pci.h                           |   5 +-
> drivers/pci/rebar.c                         | 314 ++++++++++++++++++++
> drivers/pci/setup-res.c                     |  78 -----
> include/linux/pci.h                         |  15 +-
> 12 files changed, 350 insertions(+), 273 deletions(-)
> create mode 100644 drivers/pci/rebar.c
>
>
>base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
>prerequisite-patch-id: 35bd3cd7a60ff7d887450a7fdde73b055a76ae24
>-- 
>2.39.5
>
