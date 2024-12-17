Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FA89F3EC5
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 01:26:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1683C10E068;
	Tue, 17 Dec 2024 00:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mUixRHHR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6701E10E068;
 Tue, 17 Dec 2024 00:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734395194; x=1765931194;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=S8eF9Plkl4sA+SaU42TOGGCsYn6Ktr+s1nzOXJYQhhA=;
 b=mUixRHHRhnNSRDhz7ZXWD2e9S9mViW+L6k/+p2v8didmtFOSZCJgtgep
 6Phcfw8HFcKBztmOzWFlf8O2NwIkPx1QHjLNhj6uRyPKwfbhoRCs7GVcm
 XXhN3y+u2sPjpXzYid33eo0lNuI6nBI0E2hr0g8ibA+hMWrzuKSEodfRV
 QUhAZ9QM9hvUf7vw35qWKOJPNZ6nQtmidFBdTuxEeKjduDW56xxQdE2/v
 cPAB3IMqNGd75P85ommryfiJy52oVsKzuIWF0KdsNXw2HvIQd/R0Qq4LD
 z+N9MX0CSqjuJJSzysqgpgOkbUx+M0p+iAvYwGxPjR8oi44XqDu8s251s w==;
X-CSE-ConnectionGUID: MTiAblt+Tq6B8Y6IHAtyDw==
X-CSE-MsgGUID: jU8oFTxaRgivHwziIAZZzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34714797"
X-IronPort-AV: E=Sophos;i="6.12,240,1728975600"; d="scan'208";a="34714797"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 16:26:32 -0800
X-CSE-ConnectionGUID: 5kMjbyqUTw+JEAg4EOOGfg==
X-CSE-MsgGUID: xuxQ0yMLSie8/KCMwj2EkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,240,1728975600"; d="scan'208";a="97142246"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Dec 2024 16:26:17 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 16 Dec 2024 16:26:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 16 Dec 2024 16:26:16 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 16 Dec 2024 16:26:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NENcBeyHLhn8GePPey3jNh+ofepFKHIi7rnFEqSNFAzwOrvNOxJVTeAxsTCWiezWKmqgt+POFnfKTXscnngKxoyk892pKpj/Hopv40FZ9oYqwVvdmdYuyvQkKTP96V76toS9Jr5rC6a4kvj+sCtKIucZaQHk7i55uQL9kCiJ3s0MHMyhddeeGFogot9stqrO/e09CHsEzz2L9NsTmyJ7CGikQiTQxg1Z6THJHwxnLX0YocDnjemAsC0eDWw5+cY6yoL8YvC4I3BfMiNVn2Fg30jaPqb17eS9DLqwuAibt7b1EKhBxnwGPPuxJzNg+mFxGczeCeCgcqJQ8FLcZc5tHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lPtBu/QBTrpzdB4UU4J8xefv+/Zy0CTyKTvHXmkf9o=;
 b=rZBfNd9dydqAR/GYBHbO0Wx4JaNb+uEge2OVBfZkwVMpQ3tiw0r7Fz9yq4JUMFSM+9exX2DrPPLmA5AUW/N47eAAf2TfbiNyuwet9htKZcwwEtmcTAWJMYRXWv04d6iZ3O7cUPjHun67ElwxFj4Z38hbi7sB1+8lXyPaixBaK8phDbO9GOMCyh6SiL/ieRn77a6bx3ftskM4wERHU49sSaIQeO1jR4wEd7qhIQTUUylOe48ne9O32ArszkHfbGayzJq5sRZKmA7szDHBlPTQD9hoRy4GCulXOXVMM3O2G6HFoT3Pwqst1dKoky72hZktG9THoa3ccp6kfeymVO0R6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5187.namprd11.prod.outlook.com (2603:10b6:303:94::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 00:25:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 00:25:34 +0000
Date: Mon, 16 Dec 2024 16:26:17 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "Tvrtko
 Ursulin" <tursulin@igalia.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <kernel-dev@igalia.com>,
 <stable@vger.kernel.org>, Danilo Krummrich <dakr@kernel.org>, Philipp Stanner
 <pstanner@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, Tejun Heo
 <tj@kernel.org>
Subject: Re: [PATCH] drm/amdgpu: Make the submission path memory reclaim safe
Message-ID: <Z2DFKfqzhlyHOjpd@lstrano-desk.jf.intel.com>
References: <20241113134838.52608-1-tursulin@igalia.com>
 <e30428ce-a4d1-43e0-89d3-1487f7af2fde@amd.com>
 <154641d9-be2a-4018-af5e-a57dbffb45d5@igalia.com>
 <61ad957b-34be-4ee5-944f-261c7a412962@igalia.com>
 <14e6e7a3-4077-4074-aaae-3be4b6fd071d@amd.com>
 <0af583a5-85d0-4c33-84e9-3856bde9fb4b@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0af583a5-85d0-4c33-84e9-3856bde9fb4b@igalia.com>
X-ClientProxiedBy: MW4PR03CA0042.namprd03.prod.outlook.com
 (2603:10b6:303:8e::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5187:EE_
X-MS-Office365-Filtering-Correlation-Id: a09c95eb-817b-4b03-5e7b-08dd1e315247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ntteOQkm007CLXVhhLi467xvU3kFF4SvJ5PBNcoTkzD7DmlidMFa81PkzU?=
 =?iso-8859-1?Q?gyZWpW8PzfXDXZzbVqBSlLYr+geT66/SadbYsnIPDjT45ePQ/wiZ0lgYuo?=
 =?iso-8859-1?Q?PC1NhNhBZku0hF1wiVTrAErzQWfzSvez2dfqDa5a4HkK6cwClyp8q5F7jp?=
 =?iso-8859-1?Q?DpsAo4dIN7sZZuu6UVNuP0NcMtTehbzh0O1U5xpCUbokk4ekf3ZFtBt56I?=
 =?iso-8859-1?Q?9KMtwJnvisjecOr7hYvovLOrOGCIvAKxOvJu6LYCtpraqGC+m0WtlJJfoA?=
 =?iso-8859-1?Q?VqqHBACEpidgbX+T+CIAcfH0WFCuOo7VZcdYMLq6qPwz1Sw+ctDPUR8gWw?=
 =?iso-8859-1?Q?6j+Ek/SUtxacvG1BKfiLvxU6OY/Py+9JeNWuc142Nf2FPcBhATq+wp2jX1?=
 =?iso-8859-1?Q?f0efPGD4ymTqjpS8nh2vRK+p9+cCsyXj3AeEtgpaNRenv3HZ8tEnyTRncG?=
 =?iso-8859-1?Q?WUa85bWttiLD4YeOlcrg/Xeq1qfBqMmsY3Km0QBNAGurwhgKAiz6ih+poT?=
 =?iso-8859-1?Q?ae3XYu7PoPOI3220SZ32+LBGsZc+OniZ6SsfOO+Ejs/DCy2PO9rZmxH4vg?=
 =?iso-8859-1?Q?Cp7QQiHY937XX0NFXzhTskchV873cPAKiO5CFjvB93yh+C9LgcwOPjkWAE?=
 =?iso-8859-1?Q?EqztH9gufziAO9wXFGxpbHAO5058BSps2Vj0Y79sq4TZ/iJ3l9e9dN+O3+?=
 =?iso-8859-1?Q?0hE+aZvx97o7pfVh3cPXGgxq8qwXxhrnaYsBPxCFfIgT9KJJUUeq+9peiq?=
 =?iso-8859-1?Q?XZzyqOz9vPMDKOPP6wl90wxAbejdOE6Tj1U85b3nfXt8a4RULi5WbfxCrO?=
 =?iso-8859-1?Q?g/MAWjzvECvCHAIEjUx/pVYm40jHB9jyLTBAuX+NZX8+Ps/edFg71am+Y9?=
 =?iso-8859-1?Q?GC3L4pBIpbwWrlzZ//8O1Ha87vvuy0LwEFCOMn/lGU/YuhSQW/LjF/3O33?=
 =?iso-8859-1?Q?ReoPe1mu0ISSmcBM4jHPLuXYIYM1Fu8zP6WWwGQR3x5jqduri7m13Httl9?=
 =?iso-8859-1?Q?81u2b6RjcIztWTrJyLSka9n31CAil9JdRUygKRuASi/tFejbKvQZ8DLZwa?=
 =?iso-8859-1?Q?SWVi/8xewHmkjQymFDRhylU/jq8NFYLnSVMaas1fBceDB1sEQrF3S12D6V?=
 =?iso-8859-1?Q?s/gpvmCfOt8KcNAWVTUjisA4hbIC5AgCnh4YCgMd+RGWvF9h0u6WDM1Rk4?=
 =?iso-8859-1?Q?KTGvc6gHNUPvoBpO1ZujKjPMdnpvxv3mY88VdU68Uu7vk6WzKWu28/6rSh?=
 =?iso-8859-1?Q?lVEkjeub8s2tiqbMd8JPoeq2p2Tpit7xHHRX06bTAVQWnWV2zabg6rOsjQ?=
 =?iso-8859-1?Q?3SoefAsU0yLYK16xn3oLwTxpRSs6dEwIwNmC+37Fdrn4DB5APDEcgf0EFX?=
 =?iso-8859-1?Q?pNtMI1N8cGIMoLEpByfauexvYgc606Mkbfn8R6NNaDL0w+BMufJEdYXnjA?=
 =?iso-8859-1?Q?BT4JQn+h3VN90gWr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QWqJNx+SDRMR99awDNP0/lA87fJtDXKpZ5wc4hakKhLuQD1Jh1VOSLkHjb?=
 =?iso-8859-1?Q?69kvxXYgJMY6UF4mdL/a5yp5OGgmwQ/xtOWOpDu4irNl2+XLl+cTrv8boN?=
 =?iso-8859-1?Q?uSGLoYSYrGqAD+FZ1aW23pOq8NjrwjVakO6htf448xJ/x6jBnJAKY9aAMw?=
 =?iso-8859-1?Q?q95yUaVBnzseSBDrUGJzHDFn1dS9yGVsQrIJxVWkzgx31T8rkb4gfarOnu?=
 =?iso-8859-1?Q?Fo4axYyUmsSgVEos5CCCyg99nzTVMkB/I9M2g6qTS3vfE1zBhdHgtzgD87?=
 =?iso-8859-1?Q?vGSqC3bImDZhPB0WA2aYiMo0aBo6O2Dr6hbSUJozgTZ6nKmGtX4Mo+VWjP?=
 =?iso-8859-1?Q?k2zvZ954mUFo0tpyiGIjg7F69/HTZpbiX0alwmb+pf+N3o+Slzcww5OQdP?=
 =?iso-8859-1?Q?L1OlfO7SAaYA3Vtnl1Hf/af/t3jAvMjRlKoLacsHCxujgTtha4ok1ILC9U?=
 =?iso-8859-1?Q?r2RPD+HRhr7UIFAo24qX36Rc55asHCQ9ZnFuC9wwIXO2q5JFuXunTqKE6d?=
 =?iso-8859-1?Q?Dwqt8HGmXYEtp4+FN9tUVv0+UJhJ49HUXn36hi3CSGe1lPFueF6sEYziA9?=
 =?iso-8859-1?Q?F6RS+mZV2xz+Lh8qEVcjkcMw8+lNJX5HyUKNYg+Tzy1rozb6L6Pkl8XHrG?=
 =?iso-8859-1?Q?KqCyr4zKzB8GEj0hR2F6CKbpDTLDR+KHDlHnJABAGDb/Xd0bHQyc5fLMy6?=
 =?iso-8859-1?Q?nz9G2E7+5DQX6VVxSe89oLXKcPEeGOjV2axR2Fdtts3RBTDZUAA7Qihzk3?=
 =?iso-8859-1?Q?QtnApUhaFrszuX4aHPCXusDH2WHXHfNQKk4WN19HcD5E5HnOJw05aObJ53?=
 =?iso-8859-1?Q?oiAdT01Bx+umq6e5gqBoAIWi6BpTCQNArPyqjQ3IT5gDDCZPFWbDKXuTl8?=
 =?iso-8859-1?Q?ZnBNlAPg799XyHOlQJk6g/jB1spfx3coZjDmSqGFcZgftN3c6UNXKlApCI?=
 =?iso-8859-1?Q?RUV4hmlhYFxNcY/jk5Fqz/YI5Tx0tTv9InmJnjLXYtCPUlzqE3G4sXX65n?=
 =?iso-8859-1?Q?xSK5Lvv3P4mA9FjElsPOrIHtFZKFnXBHa3YrWUZMHjMg/irHtWIUh4nU5L?=
 =?iso-8859-1?Q?j3PDML56q1vpdRzrnB4LI1Tavg047tX/iGiPCjC1/m/BppOAyb4Eb6YmZC?=
 =?iso-8859-1?Q?gPWILYfXdrr/fK04WRL5weGq4ON79X3luz0wBfXZQeN1QuzzDGKllp57x3?=
 =?iso-8859-1?Q?N8yhVQqwZjVG2wD8Iv+iigAZbJc/EylzHZLzuZAcoprU3Oj4c2pMkCZmAR?=
 =?iso-8859-1?Q?z1KXfpvwhq8n6zgML7GQifDprfiAcRneL4xfprjb2VJYs5NmGFTxkgMsZl?=
 =?iso-8859-1?Q?GOd0D+ZC2I6UKA4FOS3kO0CEoJTkPGEnrOgkoPo+ppmdy/zWuW7QOenXLU?=
 =?iso-8859-1?Q?ZlXK55odWc31zs9UlLf0cVYzv74AAYtYIzM84cdH3VMPcLGbCqdkGdMY+u?=
 =?iso-8859-1?Q?34I0twmKU4n1FTFLaK3yn1rih4ofdxZ0c3bBDFyXa4MWUxBey+L+cAfDio?=
 =?iso-8859-1?Q?ddzWzKmWf3DnRkFO5AKg031wTpeLv9aaJfS+kYcJOWkTD2jX4u4xMPj/I1?=
 =?iso-8859-1?Q?gsaV+FQQamANxgrpvPNpMTr6tPWUr95h+ioxPNeHGapvIzISJSY2DPRaVQ?=
 =?iso-8859-1?Q?Ob6+KW6ePjoah8Ex+pNLPwBP7qfl+LVdcWXAurMA31Fn8wne4GXqz6cA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a09c95eb-817b-4b03-5e7b-08dd1e315247
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 00:25:34.2180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kijoe58l+O1ylCFiaXiFqu3rdwgjkZdP/YGAI1sBrEMYjjXZt8ezEgDCERbN/8xJm2DFmskLmaA6BTOWHOwhFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5187
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

On Fri, Nov 22, 2024 at 02:36:59PM +0000, Tvrtko Ursulin wrote:
> 
> On 22/11/2024 13:46, Christian König wrote:
> > Am 22.11.24 um 12:34 schrieb Tvrtko Ursulin:
> > > On 13/11/2024 14:42, Tvrtko Ursulin wrote:
> > > > On 13/11/2024 14:26, Christian König wrote:
> > > > > Am 13.11.24 um 14:48 schrieb Tvrtko Ursulin:
> > > > > > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > > > 
> > > > > > As commit 746ae46c1113 ("drm/sched: Mark scheduler work
> > > > > > queues with WQ_MEM_RECLAIM")
> > > > > > points out, ever since
> > > > > > a6149f039369 ("drm/sched: Convert drm scheduler to use a
> > > > > > work queue rather than kthread"),
> > > > > > any workqueue flushing done from the job submission path must only
> > > > > > involve memory reclaim safe workqueues to be safe against reclaim
> > > > > > deadlocks.
> > > > > > 
> > > > > > This is also pointed out by workqueue sanity checks:
> > > > > > 
> > > > > >   [ ] workqueue: WQ_MEM_RECLAIM
> > > > > > sdma0:drm_sched_run_job_work [gpu_sched] is flushing
> > > > > > !WQ_MEM_RECLAIM
> > > > > > events:amdgpu_device_delay_enable_gfx_off [amdgpu]
> > > > > > ...
> > > > > >   [ ] Workqueue: sdma0 drm_sched_run_job_work [gpu_sched]
> > > > > > ...
> > > > > >   [ ] Call Trace:
> > > > > >   [ ]  <TASK>
> > > > > > ...
> > > > > >   [ ]  ? check_flush_dependency+0xf5/0x110
> > > > > > ...
> > > > > >   [ ]  cancel_delayed_work_sync+0x6e/0x80
> > > > > >   [ ]  amdgpu_gfx_off_ctrl+0xab/0x140 [amdgpu]
> > > > > >   [ ]  amdgpu_ring_alloc+0x40/0x50 [amdgpu]
> > > > > >   [ ]  amdgpu_ib_schedule+0xf4/0x810 [amdgpu]
> > > > > >   [ ]  ? drm_sched_run_job_work+0x22c/0x430 [gpu_sched]
> > > > > >   [ ]  amdgpu_job_run+0xaa/0x1f0 [amdgpu]
> > > > > >   [ ]  drm_sched_run_job_work+0x257/0x430 [gpu_sched]
> > > > > >   [ ]  process_one_work+0x217/0x720
> > > > > > ...
> > > > > >   [ ]  </TASK>
> > > > > > 
> > > > > > Fix this by creating a memory reclaim safe driver
> > > > > > workqueue and make the
> > > > > > submission path use it.
> > > > > 
> > > > > Oh well, that is a really good catch! I wasn't aware the
> > > > > workqueues could be blocked by memory reclaim as well.
> > > > 
> > > > Only credit I can take is for the habit that I often run with
> > > > many kernel debugging aids enabled.
> > > 
> > > Although this one actually isn't even under "Kernel hacking".
> > > 
> > > > > Do we have system wide workqueues for that? It seems a bit
> > > > > overkill that amdgpu has to allocate one on his own.
> > > > 
> > > > I wondered the same but did not find any. Only ones I am aware
> > > > of are system_wq&co created in workqueue_init_early().
> > > 
> > > Gentle ping on this. I don't have any better ideas that creating a
> > > new wq.
> > 
> > It took me a moment to realize, but I now think this warning message is
> > a false positive.
> > 
> > What happens is that the code calls cancel_delayed_work_sync().
> > 
> > If the work item never run because of lack of memory then it can just be
> > canceled.
> > 
> > If the work item is running then we will block for it to finish.
> > 

Apologies for the late reply. Alex responded to another thread and CC'd
me, which reminded me to reply here.

The execution of the non-reclaim worker could have led to a few scenarios:

- It might have triggered reclaim through its own memory allocation.
- It could have been running and then context-switched out, with reclaim
  being triggered elsewhere in the mean time, pausing the execution of
  the non-reclaim worker.

In either case, during reclaim, if you wait on a DMA fence that depends
on the DRM scheduler worker, and that worker attempts to flush the above
non-reclaim worker, it will result in a deadlock.

The annotation appears correct to me, and I believe Tvrtko's patch is
indeed accurate. For what it's worth, we encountered several similar
bugs in Xe that emerged once we added the correct work queue
annotations.

> > There is no need to use WQ_MEM_RECLAIM for the workqueue or do I miss
> > something?
> > 
> > If I'm not completely mistaken you stumbled over a bug in the warning
> > code instead :)
> 
> Hmm your thinking sounds convincing.
> 
> Adding Tejun if he has time to help brainstorm this.
> 

Tejun could likely provide insight into whether my above assessment is
correct.

Matt

> Question is - does check_flush_dependency() need to skip the !WQ_MEM_RECLAIM
> flushing WQ_MEM_RECLAIM warning *if* the work is already running *and* it
> was called from cancel_delayed_work_sync()?
> 
> Regards,
> 
> Tvrtko
> 
> > > > > Apart from that looks good to me.
> > > > > 
> > > > > Regards,
> > > > > Christian.
> > > > > 
> > > > > > 
> > > > > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > > > References: 746ae46c1113 ("drm/sched: Mark scheduler
> > > > > > work queues with WQ_MEM_RECLAIM")
> > > > > > Fixes: a6149f039369 ("drm/sched: Convert drm scheduler
> > > > > > to use a work queue rather than kthread")
> > > > > > Cc: stable@vger.kernel.org
> > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > > > > Cc: Philipp Stanner <pstanner@redhat.com>
> > > > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > > > Cc: Christian König <christian.koenig@amd.com>
> > > > > > ---
> > > > > >   drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  2 ++
> > > > > >   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 25
> > > > > > +++++++++++++++++++++++++
> > > > > >   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c |  5 +++--
> > > > > >   3 files changed, 30 insertions(+), 2 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > > > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > > > > > index 7645e498faa4..a6aad687537e 100644
> > > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > > > > > @@ -268,6 +268,8 @@ extern int amdgpu_agp;
> > > > > >   extern int amdgpu_wbrf;
> > > > > > +extern struct workqueue_struct *amdgpu_reclaim_wq;
> > > > > > +
> > > > > >   #define AMDGPU_VM_MAX_NUM_CTX            4096
> > > > > >   #define AMDGPU_SG_THRESHOLD            (256*1024*1024)
> > > > > >   #define AMDGPU_WAIT_IDLE_TIMEOUT_IN_MS            3000
> > > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > > > > index 38686203bea6..f5b7172e8042 100644
> > > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > > > > @@ -255,6 +255,8 @@ struct amdgpu_watchdog_timer
> > > > > > amdgpu_watchdog_timer = {
> > > > > >       .period = 0x0, /* default to 0x0 (timeout disable) */
> > > > > >   };
> > > > > > +struct workqueue_struct *amdgpu_reclaim_wq;
> > > > > > +
> > > > > >   /**
> > > > > >    * DOC: vramlimit (int)
> > > > > >    * Restrict the total amount of VRAM in MiB for
> > > > > > testing. The default is 0 (Use full VRAM).
> > > > > > @@ -2971,6 +2973,21 @@ static struct pci_driver
> > > > > > amdgpu_kms_pci_driver = {
> > > > > >       .dev_groups = amdgpu_sysfs_groups,
> > > > > >   };
> > > > > > +static int amdgpu_wq_init(void)
> > > > > > +{
> > > > > > +    amdgpu_reclaim_wq =
> > > > > > +        alloc_workqueue("amdgpu-reclaim", WQ_MEM_RECLAIM, 0);
> > > > > > +    if (!amdgpu_reclaim_wq)
> > > > > > +        return -ENOMEM;
> > > > > > +
> > > > > > +    return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static void amdgpu_wq_fini(void)
> > > > > > +{
> > > > > > +    destroy_workqueue(amdgpu_reclaim_wq);
> > > > > > +}
> > > > > > +
> > > > > >   static int __init amdgpu_init(void)
> > > > > >   {
> > > > > >       int r;
> > > > > > @@ -2978,6 +2995,10 @@ static int __init amdgpu_init(void)
> > > > > >       if (drm_firmware_drivers_only())
> > > > > >           return -EINVAL;
> > > > > > +    r = amdgpu_wq_init();
> > > > > > +    if (r)
> > > > > > +        goto error_wq;
> > > > > > +
> > > > > >       r = amdgpu_sync_init();
> > > > > >       if (r)
> > > > > >           goto error_sync;
> > > > > > @@ -3006,6 +3027,9 @@ static int __init amdgpu_init(void)
> > > > > >       amdgpu_sync_fini();
> > > > > >   error_sync:
> > > > > > +    amdgpu_wq_fini();
> > > > > > +
> > > > > > +error_wq:
> > > > > >       return r;
> > > > > >   }
> > > > > > @@ -3017,6 +3041,7 @@ static void __exit amdgpu_exit(void)
> > > > > >       amdgpu_acpi_release();
> > > > > >       amdgpu_sync_fini();
> > > > > >       amdgpu_fence_slab_fini();
> > > > > > +    amdgpu_wq_fini();
> > > > > >       mmu_notifier_synchronize();
> > > > > >       amdgpu_xcp_drv_release();
> > > > > >   }
> > > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> > > > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> > > > > > index 2f3f09dfb1fd..f8fd71d9382f 100644
> > > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> > > > > > @@ -790,8 +790,9 @@ void amdgpu_gfx_off_ctrl(struct
> > > > > > amdgpu_device *adev, bool enable)
> > > > > >                           AMD_IP_BLOCK_TYPE_GFX, true))
> > > > > >                       adev->gfx.gfx_off_state = true;
> > > > > >               } else {
> > > > > > - schedule_delayed_work(&adev->gfx.gfx_off_delay_work,
> > > > > > -                          delay);
> > > > > > +                queue_delayed_work(amdgpu_reclaim_wq,
> > > > > > + &adev->gfx.gfx_off_delay_work,
> > > > > > +                           delay);
> > > > > >               }
> > > > > >           }
> > > > > >       } else {
> > > > > 
> > 
