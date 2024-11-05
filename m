Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122CE9BD1D5
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 17:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6AAD10E5EC;
	Tue,  5 Nov 2024 16:11:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DDeDIlwU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CBC10E40A;
 Tue,  5 Nov 2024 16:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730823118; x=1762359118;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=shAUlx3iKCpL+LV4u2sdBpvBAlohjrrxHV2ZxS6D9ew=;
 b=DDeDIlwUUDDBG87Gd+0LDDiTRkQ9U0ErM8FQmqIsuKNsL6dYVJZeHvCo
 d/3JJUqUjmuLhj/EH55hJTTV4btt/1apE2QCSvCp8qpDX3EaEd1pTVvnc
 9ki5rFvLD/T+U83gxtsp3laf/a/xdytHJRJqkIzQgWYVPlpeaC9/b1sSi
 aRE6VCUVxKqs+Pe3Bs7E0NRZQ17Mzb+juSGqS2zOxO8ZpEW4DNLlFwvlO
 LlNTDxeQ9pkkNSUJIcnvdUyWUhcOvQ5JDosAP1o6pV+bYHlWCLLsz3ujV
 jyBUdiOeeP7AxXKsiwAqdSyOUMj5S85Dkca+M8ym/JrFbuyQEIouddQ/+ A==;
X-CSE-ConnectionGUID: +HrTrCGATmi80kqX/+n01A==
X-CSE-MsgGUID: jIJ69kGQQ4itfZLNuQH6og==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30806333"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="30806333"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 08:11:58 -0800
X-CSE-ConnectionGUID: 9dyMBtdxROK/0HBdek+FfQ==
X-CSE-MsgGUID: N7ZRgq4mSaexb2dnQyacgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="88007018"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 08:11:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 08:11:56 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 08:11:56 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 08:11:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wak2Eapxbo8aSGUs986kUzFsLOznq+L1nME+38kdM9qUayGBN2rrvwF/6aoN7LGAyFjtPBk59g6seA45BDLM/kresup+SBKq4YJpc+4sdcIFx11P5QmS+PPBSp1V0wRfeio8WlED16v52X0lUZ66ZrNV2tCPUZREwPu59SvhLtx5QIxpht3Sb5gwHF55wZ2v60tEHEf1MmG7HqdcJx4N9o4zC5hhFvuGIs8CsBw+Qmqb1niC51XEcLeXpEhlySN8NdW47j0gRqh0V/quPsBfDgaBz0mrVuTyJ3glgH88Csa8aEeEn51+P76E4kXjqfWB+mHRXKIKUwnk8rFiYuJH1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICeL6EK9Pw0huNS3eEewn/wuV8ToFrtL44YXNUMbYJg=;
 b=NXitT7QSra2xS+3c+aAJdNuOekKGPNAsi9kq4tTPvMDVc302dUIwjMq9pqzzxFFjdYhAo+GEu/LByEJ5S7an0Leqjpe5FIeJGQIwQSK5cUuu+SiVoLMuTngHHi6VltvjLjjCRzbHT6leAXnynd7ZEM95lImq/T0tFYpzIRf3KNLufHMeeai76P9F41T0v1etwuKX9/G3sBHa7K2YkWQgsp4y/CF+wvVYXs4Q87EgEuIyaB17saWPS5n+N/wBvTjA8L94htmFI2iF9gA7DwzQOl5+v/d/Oz70+woNC9bJIOukqnR9pW8Ngo8A/dvcuAR+RP45H1CKu40WECDygjGybA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4610.namprd11.prod.outlook.com (2603:10b6:5:2ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 16:11:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 16:11:48 +0000
Date: Tue, 5 Nov 2024 08:12:19 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 05/29] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
Message-ID: <ZypD4/Q91FjghR+u@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-6-matthew.brost@intel.com>
 <4162aad194d52983035a7e2a5453e394ff84fb11.camel@linux.intel.com>
 <ZykCmAJEUIv+nzwz@lstrano-desk.jf.intel.com>
 <4acf3ea6edd0a856c5614d25b5a54d6a1c3f6194.camel@linux.intel.com>
 <ZylTmvdEMQXxftgi@lstrano-desk.jf.intel.com>
 <38c69f6205ca80c5da9ae7cde2d669399bbdce64.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38c69f6205ca80c5da9ae7cde2d669399bbdce64.camel@linux.intel.com>
X-ClientProxiedBy: MW2PR16CA0020.namprd16.prod.outlook.com (2603:10b6:907::33)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4610:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ee9e434-1ea6-4314-1568-08dcfdb48cd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?LKnvffjyD8bURchKQTqA/2RJBIQy5ZTD5ohsKWpmbkCCPgcQafUeyFD6Zq?=
 =?iso-8859-1?Q?irDtk0aMAmHlsLn5/Fivmh4dsUdP+OdvNlm+UMn9T6GKrXWM+THpZSN3Hb?=
 =?iso-8859-1?Q?keWG2cdADFHx/XCZpYdbxz7JkswuajrVRB1i/D7Gw8wQmEJGCvjDyNKjzB?=
 =?iso-8859-1?Q?Bf4SstsrOEMpduebYGF103SXVuH0J8nFabmufCoklXGSpK/HdbsuD3ehZU?=
 =?iso-8859-1?Q?48/fxhgYKiIejKu0DN6aPhMwsroQIWMB+cfKVaK+HWwGdDINdIpn564BNh?=
 =?iso-8859-1?Q?iH6h7CAJIHn9LB6FvVBOGtijjnaKBTtpmp4BKf6Ly/KdlGjSp5ueC3AG5+?=
 =?iso-8859-1?Q?Sqp6MbPN/bilx4kCZ7gg18U8nY6SRJWJuRvhGj3Io1yMqQ0eRAXNMw7XX3?=
 =?iso-8859-1?Q?i4k665flumgqQLmyB8AqPcuuBgJzabD5y8fQyUHfLDQ5c+6xr2TWqLRPxs?=
 =?iso-8859-1?Q?7gZZg71gFL1tXiWZegTXPyc7ZV7v/YMecyvLGcRNZ5E/XKLrqpj15x4jmV?=
 =?iso-8859-1?Q?CCceZJw+DkqUdMuCsnkO276ihwdc53skXLAu+Z3b+ZA2QvC8pZfkyl4D7q?=
 =?iso-8859-1?Q?rMsZ12SJazJimXvwt4oMuj1IiOx0I7+46sj+uOZMimLBNByru0pBTdUTJH?=
 =?iso-8859-1?Q?J8vLxuRlmEilRnN9OatdEQJLNfWGoHPF2kFL8QBHyqeDPeARdOfBxX+0fz?=
 =?iso-8859-1?Q?9q8kE4fF9sYDabGojwGtjNx6bIWcTgIpusnlWQCZCooXnBOnb02C5UVX09?=
 =?iso-8859-1?Q?S2rg76QM+OSyl5mFBAXbHzLAvALJ2taMys6V5OZt+BE/pJui0oInY9zE6p?=
 =?iso-8859-1?Q?95YZN++FSeZ9WjMfKYYe4ZZciRMNwHJnwd+2fsSDp3lMXN6SFe5ROQN2nH?=
 =?iso-8859-1?Q?P+gQmJcLCXHMLxMJ9fHetjiTc9FiSPHLjXY7QWAjFXalLrgV62jQEqeoHv?=
 =?iso-8859-1?Q?zQXVhGYtT/PCUwkO7bCEAm50ZwLaMKLZtEJoLngEFdb6y9H12G86oCcH+u?=
 =?iso-8859-1?Q?wWvW/L3MjLAH3ljzOalp7aRpnTCqy4GaWCIuooQornaudRkZTdbiucyPtU?=
 =?iso-8859-1?Q?qTDtJw7wat4aOFUU80imgS3nAYq4VlrUTVdYzVdokXxl1CfvOXGIJ6PmBy?=
 =?iso-8859-1?Q?SNyIGzJc7GNDIIpJhZ+sOwFG8eVK1JxNzmz++/xQfYEPRJJexfmS4aS8x3?=
 =?iso-8859-1?Q?sSu5U89hqICrAoG/yy8gyxh4OQoP49b6FdI4Xmjucn26ABm4ZANeTFSzkC?=
 =?iso-8859-1?Q?EsM6I9/KaCjbunwWbhENbTff4cKS6oEtnkSyYfCGg3CeWYMJfkGKDkJywb?=
 =?iso-8859-1?Q?ZuO2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?c7OmEHNmavjdJrrYRm2v3pH2avSl+6uPH4S7NmIFtdNY/O2epC+VwwzVko?=
 =?iso-8859-1?Q?P9eQMjPkbc0pvv4ohB8T6xVxSsEnXQIZTtpv0FhW3/h+TPXy89wIIxMifQ?=
 =?iso-8859-1?Q?8l0cWgeVgynB1VWAHf/LuEB2dp57bOMa5BBlsc+UDDZwyIrC4Ea9DKKD9u?=
 =?iso-8859-1?Q?UkA1iiQeVDCmUDlY9sC2LPWZ2aU3ph/uiDc5NVy3K7UqA3VWSHGe8+3J91?=
 =?iso-8859-1?Q?TwSL6NyJJwyvV8lp9n0J4BTJT6V/1omyjw2Gm1sg0j7nKXzvGmeYs2l3z/?=
 =?iso-8859-1?Q?D+D1kkjHAx0laXYuIQDIYDBIaTU0Aueq7sWz78zMdlrVVyEd7HJNn+5UrA?=
 =?iso-8859-1?Q?0IbHn1LpU/aZwAN+CYQXB5iCSchp+DBUHhvre6GTrA2oWaI7J/gAqJLlD4?=
 =?iso-8859-1?Q?qeaS4AO8KtNDinkwOsyLrHqVLoi8wETUKOblvY4QIxkHgcrumFux5j3QuS?=
 =?iso-8859-1?Q?7ESrqyNIVEyaS1TrtBtF7b34fCXq2GuNn3z+6tMgpkTOnw722R5xpliQpM?=
 =?iso-8859-1?Q?v3fiExMLCB+efn+SJt2Kn651tW1LYijVL82DACSayAqlVDiIBC1cGcDWGR?=
 =?iso-8859-1?Q?E8TnlHpUBRDiX3tPA/jVEKl2+W5HLdWCrOcYjM+XiIHJAxF7z0Mnlh3YuV?=
 =?iso-8859-1?Q?n4DNzBAcsNxkecFjt1jtAEEjWq8MVmmY04P22lbVdT2b4iVmBEOiJUDET9?=
 =?iso-8859-1?Q?M9ZZMb8UBqLeoimiP8rOPt6wOaJB+P6p25ewErrAlllWfIhjkxZ2A4/WvT?=
 =?iso-8859-1?Q?+E5JrDrDtl4Aqbi4DqHP2EW6BesXlMyD/NT3qWw0wa6nAex4QwCeOFZexk?=
 =?iso-8859-1?Q?pmqGy95TMSMmepTJnyO4SOwsejpH9LlQukbvx1AYNHQ8LImXJCF7qu4Gff?=
 =?iso-8859-1?Q?/iACZJecYFXXll7Ik2ciwdpUtIvUbTvCpamyeBNCZSIyK1VJOfBkNP/Wax?=
 =?iso-8859-1?Q?MTIVtKiu260+wa1BKSNAvWbG0YQfX+PWFOtaNXiU3b+IDm+IqOSOu3oGzI?=
 =?iso-8859-1?Q?cH2fXF4hf1/2zSo1Lk1cjLz8B6UaXuwSbmyKFIs09i/rtx9JZUXZfy8106?=
 =?iso-8859-1?Q?gspebbQwhKoa0XEo2wmUBOlq9xTCqDqfyT/T6KeK0SzZOlxgKB75n7t9GA?=
 =?iso-8859-1?Q?qvcdklJ+haxxEHoy8/1wsqNrokiwTsgSqvsZRAQ+A7UYwN9BDG6zwhU1j/?=
 =?iso-8859-1?Q?UxfbErLVcPZElARjxohbiTumfoJulS9vUnrGdu1j9vVQOjn7yYneLtIdKH?=
 =?iso-8859-1?Q?AJVRCszxiytYBYFjyzziJNUk1qNEVTf/CRS6HbXePCSxnbfX+c4bcIjd7p?=
 =?iso-8859-1?Q?WyKrb4FaSm9x61fxqzydyNDfo9sA1hq5TUY5Yd3j5uUumeKdmOMIl6Bxaa?=
 =?iso-8859-1?Q?qVoi3cFe8ZDWIktmNd6WG0mm9MzmePQspmd6Kvk1sOzMZr27CA85gT9Bur?=
 =?iso-8859-1?Q?oC/F4/lf9nOwoj59KxSGt0Hs+KG9HLmV0M7y3ztZKnHm1JX42YOBGHlMlF?=
 =?iso-8859-1?Q?/OAX4e5xcvPrHuJtJXs16gCqNGPruwKHSMZGD+005TP5SmQmSct6lRgv/8?=
 =?iso-8859-1?Q?3sNDe+z2w4Pi9Wzjyf6rQqWqUrBZs4/EvjxIJgIsm+WWkQZtMAw0lU1V+d?=
 =?iso-8859-1?Q?gVHFwr77rvZculCWM2eQRVRYnkNhG9hUzQiAJEl6OjklFUeA6V1uIvRw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee9e434-1ea6-4314-1568-08dcfdb48cd5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 16:11:47.9795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kiLcIXg5yFpYhpd/z7nCOeFJyU4VhP5dFHG35b1zfY2FQYArWbitGevoh8A2kQ+cSwph6uwqTISt45eK8tPrqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4610
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

On Tue, Nov 05, 2024 at 11:22:12AM +0100, Thomas Hellström wrote:
> On Mon, 2024-11-04 at 15:07 -0800, Matthew Brost wrote:
> > > We
> > > have
> > > https://elixir.bootlin.com/linux/v6.12-rc6/source/include/linux/int
> > > erval_tree_generic.h#L24
> > > 
> > > to relate to. Now GPUVM can't use the generic version since it
> > > needs
> > > u64 intervals. These trees need unsigned long only so it should be
> > > ok.
> > > And safe removal, isn't that possible to implement without the
> > > list?
> > > Then it's really only the linked list as a perf optimization I
> > > guess,
> > > but we have a lot of those pending...
> > > 
> > 
> > See my other comments. Let me just follow on using a maple tree and
> > perhaps a
> > list isn't required if we use that. Will have definite answer in my
> > next rev.
> 
> Note, though, that IIRC maple trees do not allow overlapping ranges,
> and If we need to support multiple svm VMAs with different offsets,
> like Christian suggests, we will likely have overlapping ranges for the
> range tree but not for the notifier tree.
> 

I don't think that is how overlapping ranges would look though. We'd
have multiple GPU VMAs / GPU ptes to pointing the same SVM range. The
SVM ranges speak in the CPU address space - we'd attach multiple GPU
VMAs to the SVM so in the notifier we can find all the GPU pages to
invalidate. At least I think it would look this way - can cross that
bridge if / when we get to it though.

> Thinking a bit more about this, my concern is mostly around needlessly
> instantiating new interval trees instead of using the generic
> instantiation, because that is clearly against recommended practice. 
> 

Ok, so with this statement then I think both the interval trees in GPU
VM / xe_range_fence are going again the recommended practice too?

> But the list could probably be added anyway if needed, and it does
> indeed AFAICT reduce the traversal complexity from O(N ln N) to O(N).
> 

I think this will show in the notifier. We currently walk the notifier's
range tree twice - once to do the invalidate, once to unmap the pages /
add to the garbage collector. I even optimize this so the 2nd walk
doesn't have to lookup first range again making the complexity O(ln N +
2 * N) vs (2 * N * ln N) without a list.

Matt

> /Thomas
>  
