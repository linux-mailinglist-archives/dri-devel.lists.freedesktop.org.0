Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B6DCA1A43
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 22:13:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCCC10E815;
	Wed,  3 Dec 2025 21:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b38kGDRi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE15010E80B;
 Wed,  3 Dec 2025 21:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764796390; x=1796332390;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XPjdgE59+iBtD5S2H3q5NRqw1ApZtKdvlV/Be1vOOGo=;
 b=b38kGDRijqwWFVOXKVOef4egm8tb42V6adMAXBLUm/1ygDhhfU8z/ZNr
 YoSua91mrfkz5sGJ3L1BWRwjYynu3i4RAa4GZ3F2q5/dAow6DGfaIlLU1
 EZ5bIJGcyyOabY6BTthzoq2EfDmBx1pWtHyBx3oReG7Z897mFn6KaKlAJ
 SmUipR0SLkjE/rkvRgKUXXjlPaLNLWDKoguv+pxtDjsk6aYUDs9attych
 C/+KtRxOP29RmIZ8OtUunP5ET/cJjNtMp18FyDv8r4U5m3RkCLHGiVMQo
 YecIAMzeZDyXu39MF1hmCtntvF9KBlRGlxioP+QnGDOGCoSXA162YTOQl w==;
X-CSE-ConnectionGUID: yR2fcmneR4K4PfOmJCx4mQ==
X-CSE-MsgGUID: Xos6a3ikQnyhuPWHFszE0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66881310"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="66881310"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 13:13:09 -0800
X-CSE-ConnectionGUID: sbki9ayeRcWqEVYZwdXd4Q==
X-CSE-MsgGUID: N01RGACFQlubYnSmhqvxWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="194616072"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 13:13:09 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 13:13:07 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 13:13:07 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 13:13:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXSXXHW9dp5Dd2Iy/R8pqsWSfYcv+nxluxCNkQ6jnrrVQRJifrUhoMr10vEvaMgMFs0ZqWLGnA2u5Q0anaeijF7o1BFsUkuche9L6baxMfRGC52JDr4szPUqGPyDcXJ5kO96BGAAgrXz0Sk+BrCFRvIppjgf+i53UpMNfuDjmQKryNeUX531Iz0ebEi1EWxfuuwZ+hnGraJ81NqY6rJPnyXcNm4U9xLHEMLdB5CB4mDCGLtLqLK/NUfzj5cTsRbKqXfp0VOHf+uB8N4ptDwjiK7OxN75q+lRqgbAmGx+gokdZnj4PJ1TbVh6Su5EZBDnXUn4x/AFTBbWmpPMmugMww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yebNK4gRGmNbNb/NGUF925hRotOFf7FlUF5W82x4HFk=;
 b=oHYmo+n8Q1KFJN9XujlgrBz9/npZsGhS0AZBqL2ZB9Hbsja7EUxBKOVGxSSodux8UNcXXmFhFXQKx7lziQEI7pR1rmO7mrcsJNPVwcg3u6C+G6dHTx6ZlzeEX/vZKQ1kw5HSu0XCvew19XLw4KUefNbbeD/P5bqxkjILIXuqOI4Gm5mywvujQuK1MhsDfqGaD7uL+c3EzwVZtoYbh8opPDfo0vwmGLag9HWg5ldZRuMzFQsORskcskhhXkTUyYm5R6KHxnmMJV68600k9VgqO6+yk4mHooSYzxepJ7clAmnr9iicUcBOamGe9XmhWbAhLOGbKoOjfQnp0CSPB/4c1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA1PR11MB7085.namprd11.prod.outlook.com (2603:10b6:806:2ba::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 21:13:04 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 21:13:04 +0000
Date: Wed, 3 Dec 2025 16:12:57 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 <phasta@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 8/8] drm/xe: Use dma_fence_test_signaled_flag()
Message-ID: <aTCn2btBMfJxNckv@intel.com>
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-10-phasta@kernel.org>
 <e67b12d1-111f-484a-8374-4152d3b9f328@amd.com>
 <a4655788feddd883f70aa374e4315cfaee59a88c.camel@mailbox.org>
 <d7b6efe8-5343-45a7-b16e-441da15145cd@amd.com>
 <aTBz7UTCoPvzyJcA@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aTBz7UTCoPvzyJcA@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ2PR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:a03:505::12) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA1PR11MB7085:EE_
X-MS-Office365-Filtering-Correlation-Id: 6604d44c-9cb9-47e0-840a-08de32b0bfa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?rcUlimW3vNjMmtStkVsetqyWQraM6CS+AnhmNjfcMVHuiG2Q/j8AS6HINv?=
 =?iso-8859-1?Q?wUed/61FzodXif99a84F4l+Wj8+HwoFqTz39qZ7DhlyBWDpE7TOFf+e/bi?=
 =?iso-8859-1?Q?VrKyS9AWVhWPZOxisCu4XE0vzBP3JwrhklAq4Z1NzoTv9thHQyq8E21iye?=
 =?iso-8859-1?Q?XEb2zo2Cg21QmfgYsBBvGP+AHYW/aAePN+AzMAWcaTzrtY0/osswxGg365?=
 =?iso-8859-1?Q?fVqmAmQriLHqpyPTLlNOkqZpFgRTPftjQK2IllWyWgq4F6bbeqNembMYRm?=
 =?iso-8859-1?Q?a1Ku0JTXN+CWGnyxZIalYRpqR1ETjTPIxBNaxIudfPyDmlMftebAXbszje?=
 =?iso-8859-1?Q?W+25vVOttWA8Qj0js0FOfknpNbi9i0NWrerGQhGy4/uasQqrHQ0JDAuJ5P?=
 =?iso-8859-1?Q?x3J4/YdgHaR+Q5zAF8wmmI5bHtCF50FGx22sRBidUknQShbXz7FI4wHg3O?=
 =?iso-8859-1?Q?HdAviRcPil2q4Qn/mZgRXMQXUXzXMukBgGywaYr8IlFOzKb2oSdw6wsSkn?=
 =?iso-8859-1?Q?eXFyJlFhI1obk1B0Hy604HpqF1n7l94J6l3mzE0+TsLOLoqjrkDCs57rq1?=
 =?iso-8859-1?Q?T0NESl3g9D1/TRL67wPCUk1DHhIeTHsrrEvL5EzgiOPBj6TFlKEF0VzMc2?=
 =?iso-8859-1?Q?nCQcET9GuKeavrN8AL0A9DtHavBz9BsISAMlCqPa3YDaWRRi0475vzI1jY?=
 =?iso-8859-1?Q?ofX0FbTrdUw6Xf4PRVdn3jZqkVvJg8Z2qcsiBfuE4o4cXqmHkF8uBWQlx1?=
 =?iso-8859-1?Q?JTkSJU99xX65UuhJj2F2BPdrMCBN6WDvuv6Rmn5bz+3SimXkijbWgFLZB/?=
 =?iso-8859-1?Q?0US5i4uJRkhgv2nzFwaujfxPsp8bW9mt57VwhZlPWmzapMPYelit5xz6ht?=
 =?iso-8859-1?Q?y9KbX/yJgvqKhgRgYMsITkQneeOAQvKzp+BC5SBN69LyKMbzV8u+MToSRk?=
 =?iso-8859-1?Q?N1+3rtuJTni+FZ7GCs3y4z3rpc0nzesY9QkTgSTONy0p3zLsLSomT8lQph?=
 =?iso-8859-1?Q?/03s6V6wAkP3uJ77ml5Ml3w7Gyi7AUMAc8GOmyhbPOvqKi/viNZTCMCC2G?=
 =?iso-8859-1?Q?9menawkfrtkLPCvI/r7jK8CstXR79yx/F9SuDno95OQE9/4RA9cHhkuQ8r?=
 =?iso-8859-1?Q?09ZZiFhhuMYNEoX9KJ0dZK0wdbyRfGMfC1KYNdI5oJrJfNMJrbBjG5QzKg?=
 =?iso-8859-1?Q?r79pf4GOd0E5FigSE9hPtYFIPe9Ys7wj1E/3ydI8J06KLhDtohGsD8hLZ0?=
 =?iso-8859-1?Q?hoFZOCbyxr9hrW2vKqJG9BWp3CAm+G4DSMEuqQREgbYvxWzezxXW8B3XHI?=
 =?iso-8859-1?Q?dmJDp0IXxbnMp7QYnmCvdWpj5Med4ppB6X1jMdGyYXc1ellSbrjueZILkV?=
 =?iso-8859-1?Q?LwAvu614ISkuUYPummPxntvUgTTcX8W1aTofLd87i2SxYjBTq1eIJJeesZ?=
 =?iso-8859-1?Q?JNxEdFxhqSDtirgALDe2OosxSQckVhWjrU25+TS6T/JnAwXNmPBY3WFNA8?=
 =?iso-8859-1?Q?4SSq9EtSxMXFK68e7tnkQA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?v4HYbaLclRQcGyP8TX13NiqpkvPWllR6A/+MnHMX/sJOJNfrhIm79Ipxc4?=
 =?iso-8859-1?Q?RD7vcIWmgXV36poqXzNh8L7jLLM7w/meV1E2I1G0NnVEImxMunv9rbGznO?=
 =?iso-8859-1?Q?z0EMvzfVlubRGTSQ7mimfW/c1F6KKAMO46JF6ZWQiN7S13Dmmd/n3ZTxuK?=
 =?iso-8859-1?Q?UfZ4Fh+L9kBM+bnmsfi1s5LQbY1pLovxWcwss5edUiwpEyCycnJ8Fhg33I?=
 =?iso-8859-1?Q?GIONOUsWpohDHRHatTpO0+5r7h/hIDcbllDdnRotc553wS12cq1mo1P7vT?=
 =?iso-8859-1?Q?m6r4/WD41R96LjeYKkxU/vvhJ+3NFW2kNI1M7FxIM90ytG3nMpEBxrLNVg?=
 =?iso-8859-1?Q?i2ugcebnrZTtP47rFfC8ZsEJjR/B4vzc0H0JsBQrpcH3zs2V35u2kwEFrF?=
 =?iso-8859-1?Q?dVyzUkLJzZU+5zZGCT0bZm+RVugWIjaE5wRkAkJD4kebFyI0S8lAbcHCDl?=
 =?iso-8859-1?Q?84F4tkhsiN+SwguNvJydRBXY8gcB1y9nC350Gd08pbFSu7DStns+3+FbRc?=
 =?iso-8859-1?Q?yQM71DEl6lg8E78RfueoP//khH6Z3DaYQl5kdbrzpcHaRwP+L0Oh78RZae?=
 =?iso-8859-1?Q?ERMGGNaXl47beYYzKOVr27bE4otlEklyb5Nnv5D2yVUAgE2pOThBbA/k3m?=
 =?iso-8859-1?Q?66kmdpKRJ9fypG7c/2UzjfnVcBv3aQAV1U++sAbwSD2qbh0hTAIeisFlyU?=
 =?iso-8859-1?Q?hor79g3NN5w6R+8kGQIH9zBRwdqpdA+jdoENTpGrwCA08OnKtihgEzpbDC?=
 =?iso-8859-1?Q?nML8Q4ZH7tEDYWlDgIp3eg9Z5Zi0bvZ36/gzkXsUWAJyhaooHPLUO0dRQd?=
 =?iso-8859-1?Q?eHDY9DbJpo5WRegxDt+qutljxEJviKIZ9k83ryA9RQqvshNM3fFNGvZ3nV?=
 =?iso-8859-1?Q?VhhkXfp0qd1mbvwztWWN8CGMWJtFlfBD3G+tncvuHO4UCnXs7MdhbbzbGT?=
 =?iso-8859-1?Q?AE82SBOYW3emg5Q8wL29UFyJ6vndIe1DTADkCnV/HK7HC6v2y+xMV0A5DN?=
 =?iso-8859-1?Q?vhAxvNhX7c9jb1Ts28MHIMNQJu2knfbUoLTN3WHkdouqrLI/5xYR1Icr+S?=
 =?iso-8859-1?Q?77z9ZB2YCKtnDYYpswMTx9x5vWle7XjQb9kTXmXWFz5QdOYN8r8aZuXWH2?=
 =?iso-8859-1?Q?nmUIJnmjNpzsACaNqvlaDebU31o4hT/gHdVzG5o7xV5DlyOebz3bdgeioS?=
 =?iso-8859-1?Q?EN7WynEv6Mkm5NSJ49ALaBMtbPt+FkdJV2PxL6QXU6pEvghEBQY4MAtNJK?=
 =?iso-8859-1?Q?EPYHOLEVwdlvIXkklHo4itObJRAf4YArUf3OWfy5UjMFNeIENCfWsixYfn?=
 =?iso-8859-1?Q?wljGQfY3MepAjNNUGSU4IDkBUg5xE7SOJvMWDB18gGlK1XFb5cWgaFIByr?=
 =?iso-8859-1?Q?R8NwYQMN521MKzEpKZoG7wxNGf0BbbJPNMNDHSnZLA6a+QWHWRtSb0yVeX?=
 =?iso-8859-1?Q?vlr1tqHqGf18hEvNPD79vF1Fyo5ixYIdMNlt4LIcJ0LgPXA5qDuW2KOUiP?=
 =?iso-8859-1?Q?d/mRlGHn4cAjTlWNb1OLQqueAk0JKE7xubT+htXINfivYK3zi726BoPhPV?=
 =?iso-8859-1?Q?6bMwiVRu2aO7Gwho2X1cgOb0aDzdxt297QgZQp4GBgWAabdqDz1dDXECbI?=
 =?iso-8859-1?Q?ao/mTjBJRz303B0npn1a8SUc55IJ0cyye/ZEwcvOEnLeLXW1cc/8lLLg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6604d44c-9cb9-47e0-840a-08de32b0bfa0
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 21:13:04.6068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OvNf2DTi9L2wH5gXBnFwvgIfKbJ0hkWxgg8GEt1QtC4Ai3Z9Ue3EJ9Uj18lg5/ibew8NfF1luNAAas9RnU36gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7085
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

On Wed, Dec 03, 2025 at 09:31:25AM -0800, Matthew Brost wrote:
> On Wed, Dec 03, 2025 at 04:24:26PM +0100, Christian König wrote:
> > On 12/3/25 16:18, Philipp Stanner wrote:
> > > On Wed, 2025-12-03 at 14:15 +0100, Christian König wrote:
> > >> On 12/1/25 11:50, Philipp Stanner wrote:
> > >>> There is a new dma_fence helper which simplifies testing for a fence's
> > >>> signaled_flag. Use it in xe.
> > >>>
> > >>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > >>
> > >> Acked-by: Christian König <christian.koenig@amd.com>
> > > 
> > > This series would then be completely reviewed, it seems. So one could
> > > push it. Question is just who and where, and what to do about the merge
> > > conflict with intel.
> > 
> > I think as long as it isn't a major merge conflict push it to drm-misc-next and make sure that drm-tip had the correct conflict resolution.
> > 
> > > Matthew?
> > 
> > Should have the last word on this when it's an XE merge conflict.
> > 
> 
> It isn't pressing to get this patch into Xe as it is just an addition
> compared to patch 4 which I believe is actually required for
> functionality in Xe. So to avoid conflicts maybe just push the first 7
> and for patch 8 once these patches propagate to drm-xe-next, I'll rebase
> the last patch and push it into our tree.

If that can wait good, but if not I don't believe it will be hard conflicts.

in case it is needed to ge to other trees:
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Matt
> 
> > Christian.
> > 
> > > 
> > > 
> > > P.
> > > 
> > >>
> > >>> ---
> > >>>  drivers/gpu/drm/xe/xe_exec_queue.c | 9 +++------
> > >>>  drivers/gpu/drm/xe/xe_pt.c         | 3 +--
> > >>>  drivers/gpu/drm/xe/xe_sched_job.c  | 2 +-
> > >>>  3 files changed, 5 insertions(+), 9 deletions(-)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > >>> index cb5f204c08ed..06736f52fbaa 100644
> > >>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > >>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > >>> @@ -1037,8 +1037,7 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
> > >>>  
> > >>>  	xe_exec_queue_last_fence_lockdep_assert(q, vm);
> > >>>  
> > >>> -	if (q->last_fence &&
> > >>> -	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags))
> > >>> +	if (q->last_fence && dma_fence_test_signaled_flag(q->last_fence))
> > >>>  		xe_exec_queue_last_fence_put(q, vm);
> > >>>  
> > >>>  	fence = q->last_fence ? q->last_fence : dma_fence_get_stub();
> > >>> @@ -1064,8 +1063,7 @@ struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *
> > >>>  
> > >>>  	lockdep_assert_held_write(&q->hwe->hw_engine_group->mode_sem);
> > >>>  
> > >>> -	if (q->last_fence &&
> > >>> -	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags))
> > >>> +	if (q->last_fence && dma_fence_test_signaled_flag(q->last_fence))
> > >>>  		xe_exec_queue_last_fence_put_unlocked(q);
> > >>>  
> > >>>  	fence = q->last_fence ? q->last_fence : dma_fence_get_stub();
> > >>> @@ -1106,8 +1104,7 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
> > >>>  
> > >>>  	fence = xe_exec_queue_last_fence_get(q, vm);
> > >>>  	if (fence) {
> > >>> -		err = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) ?
> > >>> -			0 : -ETIME;
> > >>> +		err = dma_fence_test_signaled_flag(fence) ? 0 : -ETIME;
> > >>>  		dma_fence_put(fence);
> > >>>  	}
> > >>>  
> > >>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > >>> index 07f96bda638a..1ca2dec18e51 100644
> > >>> --- a/drivers/gpu/drm/xe/xe_pt.c
> > >>> +++ b/drivers/gpu/drm/xe/xe_pt.c
> > >>> @@ -1208,8 +1208,7 @@ static bool no_in_syncs(struct xe_sync_entry *syncs, u32 num_syncs)
> > >>>  	for (i = 0; i < num_syncs; i++) {
> > >>>  		struct dma_fence *fence = syncs[i].fence;
> > >>>  
> > >>> -		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > >>> -				       &fence->flags))
> > >>> +		if (fence && !dma_fence_test_signaled_flag(fence))
> > >>>  			return false;
> > >>>  	}
> > >>>  
> > >>> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> > >>> index d21bf8f26964..1c9ba49a325b 100644
> > >>> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > >>> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > >>> @@ -188,7 +188,7 @@ static bool xe_fence_set_error(struct dma_fence *fence, int error)
> > >>>  	bool signaled;
> > >>>  
> > >>>  	spin_lock_irqsave(fence->lock, irq_flags);
> > >>> -	signaled = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
> > >>> +	signaled = dma_fence_test_signaled_flag(fence);
> > >>>  	if (!signaled)
> > >>>  		dma_fence_set_error(fence, error);
> > >>>  	spin_unlock_irqrestore(fence->lock, irq_flags);
> > >>
> > > 
> > 
