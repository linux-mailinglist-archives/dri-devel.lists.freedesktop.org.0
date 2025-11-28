Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89229C93104
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 21:02:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4435B10E8E8;
	Fri, 28 Nov 2025 20:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fsJDp6AF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B3B10E84B;
 Fri, 28 Nov 2025 20:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764360126; x=1795896126;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MOBjPJBp8SAq5DpZ/ptjgHzbc8aAaAn/XdRwM5y7sCg=;
 b=fsJDp6AFjyFnOdmM+lLOzADwaedUYAc35L5YnJoyx8GmLwCBqGFozPcx
 eLGZ+YwM54ojNwP3aXbfQn3YxaFYZOTwhnDm/bLitSLGkTjqiwgNiBjhg
 SIZwTdNlNnH5e3P+sk8gJ2wjtAHPFQlMV9GCNCplTqGDsjkzPzT54olLJ
 mWlpK7CU52p4QZs8RqiTCHfguMh8XBxP3c4yK4iwzMjt1ZJwj480stbtr
 xbShzBgwhv22E0GE3cJdyyJjDCu675Pz03c6NbkTeTl08Dpl31LQaDr1s
 G2J6jeEmzAtnjYlXVAmxNWw2HX+SWft9xYwVxBO1H1XothfWqqk03TygR A==;
X-CSE-ConnectionGUID: wVofaivCQ4yo5qSXq89svQ==
X-CSE-MsgGUID: 1ynqi0n/Rd2TIOzFhWr3FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="70256207"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="70256207"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 12:02:06 -0800
X-CSE-ConnectionGUID: GJWcecTkSNy/62MQk2TKHw==
X-CSE-MsgGUID: Fh87YhBlQEWur9Vjuqz3hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="194311552"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 12:02:06 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 28 Nov 2025 12:02:04 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 28 Nov 2025 12:02:04 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 28 Nov 2025 12:02:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTzlSjRgHT7IKpAtpD+3DbBzfCOtmTKzoPnrd47yk6og2qNXkJUQtSYdtET7t/ThMfoWzZ6wsmpAhra9+des8ZnzYOnkEfK3Oms77D2QzbTJhFQ0lLVFDgg8NVnWN2FpIZ4dNf5uwRmSPbtOruu3B3NeXADfK2A3zbNZTbKGtAAMNe10deis3g3A8xUDioaEgJhfTHfZbjIgh3qDsa3pWWQwkwUeXQfkBsQXZSCWLC1omqRDON3QDvZNG0CaNej0BbQDvHPQdwx9m1Vm0mzyAmdt0vv51Xp6oMgyhci8JqUDCQmGX9gKmR6NbL1TFZ9spxoIIeDyXxvIhSFVewZpWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2d3ez9o/GwElTZfY/PA4LMjxfHttxv6lcraorXwl2vo=;
 b=yts1uDpRhckLk+dHjyx9cn4KxVNLcKrK/GRbDF0hS8KPLAYdHqIF8Lnx7+B1k6dXZ5eZ+Mt+L4ztW1rbudmveD0Fw/nq6ALahoHspVTtlwEYNWqAalj406K97BEFQnI58/E2xd67eMQyEgduP1oDGl2cCaQ32xaCicYqCDsWL3LGUCEItGLHafjLKhMAcEUsge8YaKwCN4j17DiFiBqDxdUmxCmyKXKRlNdIVIgQl2wQHlZWPCinU8iglRA2QOAJMwNAnYHK6X96I+JFRZIpf75saG6fq+MhFX7mExtcyTKTtL/LcKuHSK/ylU8j0uNuaZEjFLvaOjn+6i6lJJeZzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8455.namprd11.prod.outlook.com (2603:10b6:510:30d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 28 Nov
 2025 20:02:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 20:02:01 +0000
Date: Fri, 28 Nov 2025 12:01:57 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <phasta@kernel.org>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 "Matthew Auld" <matthew.auld@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH 1/6] dma-buf/dma-fence: Add dma_fence_test_signaled_flag()
Message-ID: <aSn/tXWKuA+y1A4a@lstrano-desk.jf.intel.com>
References: <20251126131914.149445-2-phasta@kernel.org>
 <20251126131914.149445-3-phasta@kernel.org>
 <aSctt3QFiEIB61Gr@lstrano-desk.jf.intel.com>
 <aScxGDYeNeN1WYja@lstrano-desk.jf.intel.com>
 <f1864f6d-8403-406d-81a0-00a71495cae8@amd.com>
 <35189892c0cb774155e2012d41371b4d3f8e7d0f.camel@mailbox.org>
 <adfd840e-fcc8-4cdb-8fd8-d0e48ee32247@amd.com>
 <89c04c8b3ca0fadf73452ca20ffd61cb106d762a.camel@mailbox.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89c04c8b3ca0fadf73452ca20ffd61cb106d762a.camel@mailbox.org>
X-ClientProxiedBy: MW4PR03CA0059.namprd03.prod.outlook.com
 (2603:10b6:303:8e::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8455:EE_
X-MS-Office365-Filtering-Correlation-Id: 2debb5b3-f71d-465c-051e-08de2eb8fe6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?R3nzNtkUIqE21La52wItEzAvfZahgIFBiZO94m9xhFcYxVISBQ4peN1jTj?=
 =?iso-8859-1?Q?mXbPFlflzA0FnyL7EBfWPVbBYmVNtnZLkMhf21kjC1/TBTBiTQsV2sj+tK?=
 =?iso-8859-1?Q?Lb7bkx4Rjh7TydkuD7j1t3ZSArLBVtGtn/W4ZaBac7B8O7HZAWeLU5O5KZ?=
 =?iso-8859-1?Q?eyKBRZEmhwpDJCsYCKJj1AGX8vhrhSoHObcXMZ24R3TKBwxerwqV9TYLfR?=
 =?iso-8859-1?Q?FL9Y/7uAy/Bq0UblOOI2ddcth6iait5rzQh5o+7EyBLO9dlZ3Q5TO86cEv?=
 =?iso-8859-1?Q?lO8OpdjRZTt+cwEP3ig0hKCEnzZQ67M7KKLOIbF3RVnkRl1VWLHmx/bD2U?=
 =?iso-8859-1?Q?+QsWduPU+c6EEtgvXj5XmVfw/alssFUwoXE2UydkMLXTJtJAPTl4aFh/Ov?=
 =?iso-8859-1?Q?eoWIEbv0PecX4JpHPGeqRVll4qWvhgQ8KlNnEMf/nW7s5flYgrxcEWvlvK?=
 =?iso-8859-1?Q?6VZdBPoQwHzGOqnJUuE38sG2M1SDJJFr9uwVT3zEWJBVmV9rfkOahVa3FB?=
 =?iso-8859-1?Q?waz0XxsuvL3FoFoIRlxP7zKeHKexTiUovqRcPi9E6d78eEeI2z9JhAeVQQ?=
 =?iso-8859-1?Q?8h4I8QaOeEyJTEChAvOITX/33PyDZ5JVVVU3BItHhneU+j5FQNJRj2RTYO?=
 =?iso-8859-1?Q?wFycmtvfB2FEzSRaeiByLlfswZYCUehqhu0SVoqijdvbCdCCxhAjyRlVNB?=
 =?iso-8859-1?Q?YltQGHNbD04UrdjQ+vk0aZemNucOejYrhzhhCEjd2KeGcjr8K4VUSIBHCM?=
 =?iso-8859-1?Q?jBqLxzxSACp32HjQ8hLc78BMFALIMtZpMAR2bk1mH6bkUidj/4AdBLzb28?=
 =?iso-8859-1?Q?aKCW2YfQbaiEoJ47Ts6HrPJCEWS9rP5W8j/TKr95T8Xb2AIjGc+/D17i0b?=
 =?iso-8859-1?Q?XVjsh1HEHONEfsWpYdbQHvBgPkJfEpCRWIBHzeU+djyMqoBJlaF4DgPgrw?=
 =?iso-8859-1?Q?NxX1GFYbWPJStCEza1ml7GLjoSnmZaCqFCnZYYP6h1gohF4fp4jSgU1xc/?=
 =?iso-8859-1?Q?qaendU5s5WlpNvcYbtDWbLWairI56i4enTAXaRkUufEkxZU3dKItaXhBWJ?=
 =?iso-8859-1?Q?oyeisJ4npGkxaMwtHuRtMqROdh0mWH6RaMXt1n398cf39EnJVHsw7lgygD?=
 =?iso-8859-1?Q?NcrnSQ/a6QLu1xbEd/CcFaOcEXIG9n3A18Vqvaxc0QnznFDJ2VoH8iK5kT?=
 =?iso-8859-1?Q?jrzxKWwqc29xWJ6tJz82NSzBu8H37hwLZmvtAYSLqEH06fPM7wtUBYNJ8v?=
 =?iso-8859-1?Q?eb+pFsanE/DseR71ejn3U/cAFvd1eWUX5tNEBPmQ6j9FWRPqgszV3yqJTa?=
 =?iso-8859-1?Q?XMS61/f0sr1xRKhWdp03YF10iX92p7un7LhaMFZ+Cjb0R7mVORq/ahHb/9?=
 =?iso-8859-1?Q?NLxegOKpexhhFG03vO+s/dZpsF6ZslCaFBTpkxELnipuafN3WM9WgYtMBq?=
 =?iso-8859-1?Q?Qkecflv/zJsOein5JgiDJFCZtl7vNwiX5AFJUQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2X+eT5NGI/2pB3SRvc31R4EWCgTys8N5yGsVBa4O3I242u3YMLJ5B+Vwer?=
 =?iso-8859-1?Q?3rVXem6P/tE9EmlWISEl0KDDo477U59nMs0/sPhv91u4athw5z/ymkb18B?=
 =?iso-8859-1?Q?d47BPILdwj5cIajyIoE1Vws3FRPZuIUO929yLPSA2EXfGNKHj0SQk2Q1HD?=
 =?iso-8859-1?Q?bxp7d5QEHw2xeMt+LErjqf8sDyuXhc8lJxmzAl3tSpbMdfKdSOwCnAFmD8?=
 =?iso-8859-1?Q?JWc/7eVkwysarQuk+mtsYnF7ShWG9j35sYmPntgKfvwQ9iW1hY3Yxq+VLx?=
 =?iso-8859-1?Q?KPErNpLh4odN/YK6c3FgWSjnAS4zPdgyvHAJ5sPsiImIhJGUP2SG+4oD6g?=
 =?iso-8859-1?Q?1e75NQFACi6MczASlFbk7I3/XI7pl5gjXQa9R+7gR5SRJg0Rgp8PNvngZx?=
 =?iso-8859-1?Q?XXIVgBxWmG3NjTK1/749t3Xi5JcFyPqlqvathIVOmMvalTJCGENyonPrOD?=
 =?iso-8859-1?Q?FdhYC0+A1TqQJI0YyTvYe49xz0gSI/1ZVHwZGF31GrpS2UHJ3I7iJ2/+SO?=
 =?iso-8859-1?Q?penSfyuhkFy7kQet0DAuII37WPqIlfDMg165zkAHeU1X0TKROkdpTPNUlq?=
 =?iso-8859-1?Q?BPrmq1Lcj2nUYWs1NCqMIRNEEYA87QuTIzCc/EoPirpvRIAgQ0q5zW4MoJ?=
 =?iso-8859-1?Q?vUnl2Dnkwd8yCDOZA+cHLd92x6NFWKAEhfSYx3Us8Wq1zwM68FusMPKWxB?=
 =?iso-8859-1?Q?Oml+Pja9Yyk0hcjCWJGz4HDr5KTW2ac4OIPT0daBaaNQdeBhIHxsBaRZG6?=
 =?iso-8859-1?Q?yQ2ES3iHQVXjP01I7KsSHcejzhJxZZNRUNka1ApyalwxAIXDvcAYZ8iF7l?=
 =?iso-8859-1?Q?r00tUKSC6B93cX8ZUSEPEOpS/Z3WA8xlKszsoBOv39O79LQOnyuQMSVCx5?=
 =?iso-8859-1?Q?LhPxbHKzjppZR+Yx5+B1XJq3zQfMRkfabuYOyh0qRNhvuyf4BE/87ROY1b?=
 =?iso-8859-1?Q?/Q1wbVtYW6YN6YW6FDMYrr/iBZZsEfcIHhu3hJdgmlGAThO5LgmDSI0/b1?=
 =?iso-8859-1?Q?tZogsl4W5uC6TQW1kTs0mSDgQoh4oHr7mqozIeRMhcfliBervyidIT1OWD?=
 =?iso-8859-1?Q?9aaKvcEjvlYLKpeMqqFiZWM0MAO1fXBIIntNtHXJS+HPKj1yWJMTjjkldo?=
 =?iso-8859-1?Q?uDZRTqt7aQi1ChS2bOelf2Ao4J2F0sc+whnlxF8KEbIieEztQxtGETJhfV?=
 =?iso-8859-1?Q?xYaZ5DPnKJEsjZGih6Mm5IkGvg7L/aw2lc9EUD8rmIacYqZSkyvUoHUKWK?=
 =?iso-8859-1?Q?Xf2Gpf66dTHjiQ9zbT6kRXmBtviIYhjltetcaiaHRxq4X8uask8kM8kH1A?=
 =?iso-8859-1?Q?M5ASp4ft3L4gC4+G80/XXZALIrUzEfxMR4sg5vCMb4mP3c6z2mgd26O3Ww?=
 =?iso-8859-1?Q?+vhLu6Jur7HJLBkDbLUCirvGit42BtFk6Q8Q9oTgyiJY7JyVKHDMsEztcc?=
 =?iso-8859-1?Q?G/rawMZG2E2JaUv8Zq7dG5+L1FSPSmtVN3c9+d/dl92upSvAB5gRsKqsYJ?=
 =?iso-8859-1?Q?TrWlPBUs2C8Nvp+g6I9Q9B0gfx5y7RiXIjLf2jknhWsRdRUcEhNs2O6xuX?=
 =?iso-8859-1?Q?bjinHLBCUK7pNrXkzpbe+/pqBBqHviK1MFmTW6cnT/oOe4BtToZpxoCWvS?=
 =?iso-8859-1?Q?5PECLuMCLThnK/u5IUzwOyrqjDKDyvThrfK3D6vTAFezKXacMnACEoBg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2debb5b3-f71d-465c-051e-08de2eb8fe6e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 20:02:01.7621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dt2fiaMkhQEKy3JZGkxgwpQbOk3SWPq+rUDLU5k6365ZHr/nwHb8d1emqBH4k1b8W5H9ZVMrlYseeX08vOnOBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8455
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

On Thu, Nov 27, 2025 at 11:16:26AM +0100, Philipp Stanner wrote:
> On Thu, 2025-11-27 at 11:01 +0100, Christian König wrote:
> > On 11/27/25 10:16, Philipp Stanner wrote:
> > > On Thu, 2025-11-27 at 09:11 +0100, Christian König wrote:
> > > > On 11/26/25 17:55, Matthew Brost wrote:
> > > > > On Wed, Nov 26, 2025 at 08:41:27AM -0800, Matthew Brost wrote:
> > > > > > On Wed, Nov 26, 2025 at 02:19:10PM +0100, Philipp Stanner wrote:
> > > > > > > The dma_fence framework checks at many places whether the signaled flag
> > > > > > > of a fence is already set. The code can be simplified and made more
> > > > > > > readable by providing a helper function for that.
> > > > > > > 
> > > > > > > Add dma_fence_test_signaled_flag(), which only checks whether a fence is
> > > > > > > signaled. Use it internally.
> > > > > > > 
> > > > > > > Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > > > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > > > > 
> > > > > > This is a nice cleanp:
> > > > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > 
> > > > > > > ---
> > > > > > >  drivers/dma-buf/dma-fence.c | 19 +++++++++----------
> > > > > > >  include/linux/dma-fence.h   | 24 ++++++++++++++++++++++--
> > > > > > >  2 files changed, 31 insertions(+), 12 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > > > > > > index 39e6f93dc310..25117a906846 100644
> > > > > > > --- a/drivers/dma-buf/dma-fence.c
> > > > > > > +++ b/drivers/dma-buf/dma-fence.c
> > > > > > > @@ -372,8 +372,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
> > > > > > >  
> > > > > > >  	lockdep_assert_held(fence->lock);
> > > > > > >  
> > > > > > > -	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > > > > > > -				      &fence->flags)))
> > > > > 
> > > > > I need to read a little better, I think this change isn't quite right.
> > > > > The original code is test and set, the updated code is test only (i.e.,
> > > > > you are missing the set step). So maybe just leave this line as is.
> > > > 
> > > > Oh, good point! I've totally missed that as well.
> > > 
> > > Oh dear; I also just saw it when opening the mail client ._.
> > > 
> > > > 
> > > > But that means that this patch set hasn't even been smoke tested.
> > > 
> > > I've built it and did some basic testing with my Nouveau system. Any
> > > suggestions? Do you have a CI that one can trigger?

Intel's Xe list will trigger CI - you are authorized to trigger that
flow. Navigate to Intel's list patchworks [1], find your series and see
the results. It is noisy, so also certainly to say failure but I let you
know if anything is actually a problem.

Matt

[1] https://patchwork.freedesktop.org/project/intel-xe/series/?ordering=-last_updated

> > 
> > DMA-buf has CONFIG_DMABUF_SELFTESTS which should be able to catch things like that.
> > 
> > But even running Nouveau should have found this since basically no fence at would signal any more.
> 
> They will signal and execute their callbacks, but all is_signaled()
> checks are then broken.
> 
> Thx for the feedback, I'll be more careful with changes like those and
> test more extensively.
> 
> P.
