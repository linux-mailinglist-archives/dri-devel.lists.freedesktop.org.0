Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0013390DF01
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 00:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9F710E7DC;
	Tue, 18 Jun 2024 22:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DmPsREOz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31E910E7DC;
 Tue, 18 Jun 2024 22:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718748722; x=1750284722;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BbmvMTafuRlcJmw+n7elmvDBAJu8wFhJGTEzO/bCBmc=;
 b=DmPsREOzDTLj6KQHiLhK0dYaw6qKfAyavpnUQkcDkWeKZ9CZwIs4VGtA
 CMGSbvz82WVePILBjViInUdsorgYCyNtlOF22uWcaiq5uI6bC+h8WZpkc
 u/asjgeFufR/gvCUYB4PPrlAGrmWMkEGUeIueGonUdxQtudG2s5DHxz37
 QCYW1LB2mtjDiiXquK1Di61nfNmsPpV0d0rMafq0mqCzCFHhlQnLy0Bq9
 V4OOSPYW8DDXRocRVAOR7cK3L80w5ONDm7L0io45C8xFFZJQthfVGUqWL
 hYvNTERqRKJ6JTfHDQfwsAxt27SjQtysMA+l+P31BDwHUolY2veogSanT A==;
X-CSE-ConnectionGUID: aeRMq3EMTuyvYtFfYVghfQ==
X-CSE-MsgGUID: fJgVmAu7TZq4mDKJw2PO8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="26784185"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="26784185"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 15:11:53 -0700
X-CSE-ConnectionGUID: L+dKSsV3TB6WaCzd4jt2vA==
X-CSE-MsgGUID: XykA8MrcSBeKzb2/+QKBTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="64939085"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jun 2024 15:11:53 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 15:11:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 18 Jun 2024 15:11:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 15:11:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ot4213XmjzyJzCkCrV7/iotTRBqD0UWrce128Mafejy4Qqba/6zrs3a/cMspE18DZCdK5wkOXC0BiEyZ1UQOxaebafcC+K3bPwauzkPgBOpKggT+1iLtfAZLkuKPrNT7+3e70c2hVySRR8n018mje2Iu9VJVBaFgy6JWgDx23cXrupxIJ7i6IaMgwc1vP6l+nNmWr8SOFVYzvXQhf9aKPDNaKX4osCK0ox2my133q6t+4dfihHwqr/REzp/kgW4WW8O1zx8TP2vHzicA72xCgGlgZSgXNOt2+XfHNgCVuh3/YuhOZPaOTo3/YrGA8QRA4Jb3DsKiTdG/1pi00NEmGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdHGuczSTbLR6V4vf4U/Df82NwzvQbJn/ZOV1/h5hJg=;
 b=fH/97kARsM00le3HvL7RZj6YIAUXqBshVs8D8b/cejGkGXBPNRvy0u9dydarHwP8cf8gI8DRCuSCfh+xZZs1mPuh8PTBxJtJ7xhXYTkLpDUvPHY/9CuYj+jevFj8XmhSp9fgDg5iIXwrPcIGzZ+L9jBHRHQ4313X+m6bIUjStHwFVdwfURTgMxKGz7YlguCQrfqAN87Xvsdh/7qHGWbrorUYFh8d+m1GnQzK2RpHhEx4bYiI+iw7vHtX452MdNUQT+drBUeFaZdvku131a5I7sPS6zlTvSLZ+Ro+kg70xkf60y7B47B/eFoMsTu/mkvh3u/9MZiG45xv7Tn/R6dkRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7280.namprd11.prod.outlook.com (2603:10b6:8:108::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Tue, 18 Jun
 2024 22:11:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7677.027; Tue, 18 Jun 2024
 22:11:50 +0000
Date: Tue, 18 Jun 2024 22:11:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 05/12] drm/ttm: Provide a generic LRU walker helper
Message-ID: <ZnIGBea3S5fquc32@DUT025-TGLU.fm.intel.com>
References: <20240618071820.130917-1-thomas.hellstrom@linux.intel.com>
 <20240618071820.130917-6-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240618071820.130917-6-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0173.namprd03.prod.outlook.com
 (2603:10b6:a03:338::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: d4a905a3-2497-4578-cead-08dc8fe3a6f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?YD6MxmiDLtqQP4OMRLrfH5r/wXWjPmFJ0VbaEf/9NTeKY6lnMxq5sonEb/?=
 =?iso-8859-1?Q?y+MFinsRNMqHRmxQNZJuNANJ2WjCoqxaP2RyDOYUgrF/vbtTh91ayvUydb?=
 =?iso-8859-1?Q?y8jaDMGKXc+klZqGWEZvTORZmvw2BiGul5x8/EH9iT+DiJCd3bQ/Rx2nr4?=
 =?iso-8859-1?Q?D1v3GLLwi3rnXR5NZ/r/CRn3ubQ9B9s7Q9hWHUuDG5IgkDFuFwcE0A1erH?=
 =?iso-8859-1?Q?Nb5CllrkurxZr6lixKccG8/wAIUmlsd0I3Z+qskGktDcDRpeIl5pd6vJ8r?=
 =?iso-8859-1?Q?dVd1nJm2o1NMrKp+Zvd2DnEJie5YDD2GIPkWqDrCm9l247VHSnkfIrw0ik?=
 =?iso-8859-1?Q?EKMfoYMWPx6+x9LTzA+HSPqEqsI9NrMdfg/pii/zwDY7zasu1zsRdin4bx?=
 =?iso-8859-1?Q?GwOth/IXa3EiE7o7/BDMjEGdRHU+4bCm9hWivmupfKALYoPY9EOfvzC2MP?=
 =?iso-8859-1?Q?O9a5CTFyQQdwoqhJOIjDSX3ulBNbW3PCAA1OFGbOnXyMQODSNQAbzP5m16?=
 =?iso-8859-1?Q?TXCeUuwRm3dV3OrVBRIhJbbo2y/WGNpldHcgWIwlk+9GT7f/eSGFyeIFbt?=
 =?iso-8859-1?Q?eUs/9lcr3QRH/H0GcvRXf51liDEJz2LbmrOPP3de5411z7db2SA6MrLd+B?=
 =?iso-8859-1?Q?LBw9A5b7pOVJue/XqgXVzvh6qRkxuVo3ucdflh9Vi6b92fsQEWYImdqDLH?=
 =?iso-8859-1?Q?BQzJBuT1HTX9aKfRlxhpX1zjYbHCVimmsufAubcDXw5Pk9WPeRl/X57Its?=
 =?iso-8859-1?Q?46hJxNBA2dkV5/289L0q8qePjj/cWFDk+XwLGvtxlbjELunkoOv+0ob388?=
 =?iso-8859-1?Q?3yitnkDkaAlm23CapEDxXZHNeS0HAtN7z7JQk5wTxNJFsP/MYIt27+AjGh?=
 =?iso-8859-1?Q?TkzIHjDgM1rJfDNF+/nF+vxYnCurvODzv946f1PVFTwd5Umdbb1+HgE7yW?=
 =?iso-8859-1?Q?9m49GHK3eFsl60Pu+QCPii32mpT0adP3MRKlcjOgQEQjcrW/C6hEfQqmUP?=
 =?iso-8859-1?Q?Kct9Aewh8+RS5ip1Hem3aCYV6EQD+et3t96aS3e8/GqOYDekYIN6Vdx308?=
 =?iso-8859-1?Q?93MP50kt8rn+xxpzwC2fwjzIlaQFum0QMOr03Jaqa1rFHem2Eg4MWeX5rA?=
 =?iso-8859-1?Q?O7M84Xgur69VdI5sDegRKwWfr/JsCbUtTFUK8sSnXN6pfs0YeaPbh4XvsY?=
 =?iso-8859-1?Q?bUQ40k/ZyXFs542DvQPYzqzokbaKxmERhtdZYdZdLjqKa96IYYWKXFr93j?=
 =?iso-8859-1?Q?kxPJqttjw+1A1dR8IaV6PJbqCXEsM5RqwJxCO/RnUs+2jqA/++z7+x2UhD?=
 =?iso-8859-1?Q?3PbWix7kyYkUzq2OuWdt2eW1gofo8VpeopXt/AyWTr6KshIbzg/CMQi4g3?=
 =?iso-8859-1?Q?tGornKqhjM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?09XHHQqrd3PuSDGhjTOd9awDNIoRaRDwA3H7CXLpBWgxDf11cm3fLcjBiw?=
 =?iso-8859-1?Q?PVXhyoN4YgRQxvZOaRiCOgfV5gHO4TFRuUOp69Ch6+Vpoe03+8BIwUHruX?=
 =?iso-8859-1?Q?QCqG9t34LjrPIPobQSMXQpol8ybxHy2qFa4tKytOgXqlLZ8et1yGAbDfI4?=
 =?iso-8859-1?Q?CY3jkzCGvM1J0gAT5rPLz8x4qyz8CG/Ay273rfZlTsw9nWa2fkYDG+a52q?=
 =?iso-8859-1?Q?P+2nENyeAgDwdm3r7DtgYUOwU2NsgeFohnNmawdQOqdwdch1nv6JpnJ2cW?=
 =?iso-8859-1?Q?rO7v+4yo9fW/H1cTwZUpxmK/ha4hnBU1SOyeG4lgapAFK1FfaydnjOhWYa?=
 =?iso-8859-1?Q?fFr1bbCb0ddUcMb+O7h/HwVM8OPwyPcLEBedHI14Q5P644M4mS4C3qdrgg?=
 =?iso-8859-1?Q?F9wyYD76C3SI7qUXGgABWIkl4OyJZrzTgolqQqbTufX6y5qjQbhv68Yepb?=
 =?iso-8859-1?Q?DR1m9hLMmtBi2KC8aC0wncl0lzAmXi1ev/kWUOmOfWmx9JlpApEzpCh11/?=
 =?iso-8859-1?Q?xkBJevwLW4v/QbFTnWJugEcXpnbXEZdeX1TR6K8St7gFplNyuUO6HcqUOW?=
 =?iso-8859-1?Q?6L6piKtMLw4yNIQz0SJ8bhaXup/nSYHrBNWfnOdyY4xQB7uDY/NPfmmuN8?=
 =?iso-8859-1?Q?IXu0Y6hrKHxsqMLAXA4gKbItnleQGg9M+z73rZSUR6R7dF7AJ57WNG2DY+?=
 =?iso-8859-1?Q?MQNKueO6f5gjJtTMSDFSdBKIjca/mL3a/68DLC1k8fSbnZwcSaov0yV1ej?=
 =?iso-8859-1?Q?fFppAijMPc6ZQOivtsGcWD2EyqI8YcDXHHTBsRXbpE0O2zYoDTb6BWMQ30?=
 =?iso-8859-1?Q?j3Xc3hh7DNFBKQ5FIaJqwy5jB/0eBXgkhdUMIZBclpuYJyvYXRwuBvHyKH?=
 =?iso-8859-1?Q?88OyjsnFhRFSC0tXfCF2sRAwc3m9gz95aINyX0rZCUZiq1akysj/xQjBbp?=
 =?iso-8859-1?Q?mG+bHIIx/xB5zesDno5WPuMimGcg0btKlYbqu6/FRaGjG8XFaplzQwhf0Y?=
 =?iso-8859-1?Q?wSxpIkX4ZzK98VPfI2kZr3Vk5suP/VAdoGPg+6TYBSA1Ew0YsqR63nFhWl?=
 =?iso-8859-1?Q?ctiElRJohNdZLR3LbGUJ8djfA8+jMDqGyoLeLBGHJ0cBnehhKZrAifBdn5?=
 =?iso-8859-1?Q?Uwx1Ckxc8ojStX3NbySNj98hJ/QQHYr32086PQXaIrU6nhjMiTMxTVAaif?=
 =?iso-8859-1?Q?KUP6uVioQJ/YiWEKeLZa6CgYtzUTlbH7RZYf+z7zwlZDUX9rMtgNYGq0gR?=
 =?iso-8859-1?Q?T+LpqQXU1KvNtcqSFXT5/mJUFnmqyY94ccmsXW4DkZsnvU3dbIml3UXPbJ?=
 =?iso-8859-1?Q?4pH4fdvnBywH29Woa1NAy4tvWyYFCqFf8jreN+gIWlg/nFGEv6zmkm+0K8?=
 =?iso-8859-1?Q?bcQODKszbDN9NAwdhYn2y4GZuKOsZuXkeakEFjaAYQSdNDRfnA1FxXCBGH?=
 =?iso-8859-1?Q?u94Fcy1cpZ8M0tRL5FAV2VrtDNwhYoH779kVxZsXnYim6PLGLCDypWejCa?=
 =?iso-8859-1?Q?1GPIoJTAiS5lw2+Xeap4zKUhxdW29x1IMUlW53IPqONUH0IcdTZgK+WmXu?=
 =?iso-8859-1?Q?OXlts5eP/Vryt1gZgddzFznSBepHnM8UOhHrgxjAxFxtd5zCmVwZqyS+4Q?=
 =?iso-8859-1?Q?C6keeHgx1Co/nVH8mnY1vrnLVVL4/SZJrnvf4nlqIj88qI0KKNBEJYhQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a905a3-2497-4578-cead-08dc8fe3a6f0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 22:11:50.2374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQVOHU1mj8MzQnVvZWhp4M0mpD8ORTmDR2G4EiXljIW8Vd/nFg5qQFpRVBLVbivEinWgVGoTn1Aw4yWSZjvWpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7280
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

On Tue, Jun 18, 2024 at 09:18:13AM +0200, Thomas Hellström wrote:

Replying to correct version...

> Provide a generic LRU walker in TTM, in the spirit of drm_gem_lru_scan()
> but building on the restartable TTM LRU functionality.
> 
> The LRU walker optionally supports locking objects as part of
> a ww mutex locking transaction, to mimic to some extent the
> current functionality in ttm. However any -EDEADLK return
> is converted to -ENOMEM, so that the driver will need to back
> off and possibly retry without being able to keep the
> ticket.
>

Wouldn't the backoff be unlock everything but keep the ticket?

> v3:
> - Move the helper to core ttm.
> - Remove the drm_exec usage from it for now, it will be
>   reintroduced later in the series.
> v4:
> - Handle the -EALREADY case if ticketlocking.
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo_util.c | 145 ++++++++++++++++++++++++++++++
>  include/drm/ttm/ttm_bo.h          |  32 +++++++
>  2 files changed, 177 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 0b3f4267130c..45fcaf6f8644 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -768,3 +768,148 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
>  	ttm_tt_destroy(bo->bdev, ttm);
>  	return ret;
>  }
> +
> +static bool ttm_lru_walk_trylock(struct ttm_lru_walk *walk,
> +				 struct ttm_buffer_object *bo,
> +				 bool *needs_unlock)
> +{
> +	struct ttm_operation_ctx *ctx = walk->ctx;
> +
> +	*needs_unlock = false;
> +
> +	if (dma_resv_trylock(bo->base.resv)) {
> +		*needs_unlock = true;
> +		return true;
> +	}
> +
> +	if (bo->base.resv == ctx->resv && ctx->allow_res_evict) {
> +		dma_resv_assert_held(bo->base.resv);
> +		return true;
> +	}
> +i

Any reason this is done after the try lock? Just kinda goofy as if this
statement is true the dma_resv_trylock will always fail.

> +	return false;
> +}
> +
> +static int ttm_lru_walk_ticketlock(struct ttm_lru_walk *walk,
> +				   struct ttm_buffer_object *bo,
> +				   bool *needs_unlock)
> +{
> +	struct dma_resv *resv = bo->base.resv;
> +	int ret;
> +

I suppose we don't have asserts here like in Xe but if we did,
assert(walk->ticket)?

> +	if (walk->ctx->interruptible)
> +		ret = dma_resv_lock_interruptible(resv, walk->ticket);
> +	else
> +		ret = dma_resv_lock(resv, walk->ticket);
> +
> +	if (!ret) {
> +		*needs_unlock = true;
> +		/* Only a single ticketlock per loop. */
> +		walk->ticket = NULL;

Can you explain this a bit more? I see that once the walk->ticket is set
to NULL this function will not be called again (i.e. only try locking
will be used). I want to understand the reasoning for this.

It might be helpful for a more lengthly explaination in the comments of
the code too.

> +	} else if (ret == -EDEADLK) {
> +		/* Caller needs to exit the ww transaction. */
> +		ret = -ENOSPC;

The commit message says -ENOMEM.

> +	}
> +
> +	return ret;
> +}
> +
> +static void ttm_lru_walk_unlock(struct ttm_buffer_object *bo, bool locked)
> +{
> +	if (locked)
> +		dma_resv_unlock(bo->base.resv);
> +}
> +
> +/**
> + * ttm_lru_walk_for_evict() - Perform a LRU list walk, with actions taken on
> + * valid items.
> + * @walk: describe the walks and actions taken
> + * @bdev: The TTM device.
> + * @man: The struct ttm_resource manager whose LRU lists we're walking.
> + * @target: The end condition for the walk.
> + *
> + * The LRU lists of @man are walk, and for each struct ttm_resource encountered,
> + * the corresponding ttm_buffer_object is locked and taken a reference on, and
> + * the LRU lock is dropped. the LRU lock may be dropped before locking and, in
> + * that case, it's verified that the item actually remains on the LRU list after
> + * the lock, and that the buffer object didn't switch resource in between.
> + *
> + * With a locked object, the actions indicated by @walk->process_bo are
> + * performed, and after that, the bo is unlocked, the refcount dropped and the
> + * next struct ttm_resource is processed. Here, the walker relies on
> + * TTM's restartable LRU list implementation.
> + *
> + * Typically @walk->process_bo() would return the number of pages evicted,
> + * swapped or shrunken, so that when the total exceeds @target, or when the
> + * LRU list has been walked in full, iteration is terminated. It's also terminated
> + * on error. Note that the definition of @target is done by the caller, it
> + * could have a different meaning than the number of pages.
> + *
> + * Note that the way dma_resv individualization is done, locking needs to be done
> + * either with the LRU lock held (trylocking only) or with a reference on the
> + * object.
> + *
> + * Return: The progress made towards target or negative error code on error.
> + */
> +long ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
> +			    struct ttm_resource_manager *man, long target)
> +{
> +	struct ttm_resource_cursor cursor;
> +	struct ttm_resource *res;
> +	long sofar = 0;

s/sofar/evicted?

> +	long lret;
> +
> +	spin_lock(&bdev->lru_lock);
> +	ttm_resource_manager_for_each_res(man, &cursor, res) {
> +		struct ttm_buffer_object *bo = res->bo;
> +		bool bo_needs_unlock = false;
> +		bool bo_locked = false;
> +		int mem_type;
> +
> +		if (!bo || bo->resource != res)
> +			continue;
> +
> +		if (ttm_lru_walk_trylock(walk, bo, &bo_needs_unlock))
> +			bo_locked = true;
> +		else if ((!walk->ticket) || walk->ctx->no_wait_gpu ||

Nit - (!walk->ticket) could just be !walk->ticket.

> +			 walk->trylock_only)
> +			continue;
> +
> +		if (!ttm_bo_get_unless_zero(bo)) {
> +			ttm_lru_walk_unlock(bo, bo_needs_unlock);
> +			continue;
> +		}
> +

This kinda goofy pattern too, typically in code a get_unless_zero is
done before trying to lock the object not after. Even odder here, the
could or could not be locked depending on the outcome of
ttm_lru_walk_trylock. This is covering individualization case? Would it
make more sense to move ttm_bo_get_unless_zero before the try lock or is
that to avoid a put on try lock failure + continue?

> +		mem_type = res->mem_type;
> +		spin_unlock(&bdev->lru_lock);
> +
> +		lret = 0;
> +		if (!bo_locked && walk->ticket)

As above could you explain the ticket usage a bit more?

Also you shouldn't need to check the ticket here there is !walk->ticket
above which triggers a continue.

> +			lret = ttm_lru_walk_ticketlock(walk, bo, &bo_needs_unlock);
> +
> +		/*
> +		 * Note that in between the release of the lru lock and the
> +		 * ticketlock, the bo may have switched resource,
> +		 * and also memory type, since the resource may have been
> +		 * freed and allocated again with a different memory type.
> +		 * In that case, just skip it.
> +		 */
> +		if (!lret && bo->resource == res && res->mem_type == mem_type)
> +			lret = walk->ops->process_bo(walk, bo);
> +
> +		ttm_lru_walk_unlock(bo, bo_needs_unlock);
> +		ttm_bo_put(bo);
> +		if (lret == -EBUSY || lret == -EALREADY)
> +			lret = 0;

What is usage of these error codes?

-EALREADY means the resv is locked with the current ticket, right?
Wouldn't we want to call process_bo in this case too?

-EBUSY I need some help figuring out.

> +		sofar = (lret < 0) ? lret : sofar + lret;
> +		if (sofar < 0 || sofar >= target)
> +			goto out;
> +

Here we have dropped the BO unlock. What prevents the BO from being
moved back to the resource we just evicted it from resulting in sofar
not being accurate?

Matt

> +		cond_resched();
> +		spin_lock(&bdev->lru_lock);
> +	}
> +	spin_unlock(&bdev->lru_lock);
> +out:
> +	ttm_resource_cursor_fini(&cursor);
> +	return sofar;
> +}
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 6ccf96c91f3a..8b032298d66e 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -190,6 +190,38 @@ struct ttm_operation_ctx {
>  	uint64_t bytes_moved;
>  };
>  
> +struct ttm_lru_walk;
> +
> +/** struct ttm_lru_walk_ops - Operations for a LRU walk. */
> +struct ttm_lru_walk_ops {
> +	/**
> +	 * process_bo - Process this bo.
> +	 * @walk: struct ttm_lru_walk describing the walk.
> +	 * @bo: A locked and referenced buffer object.
> +	 *
> +	 * Return: Negative error code on error, Number of processed pages on
> +	 * success. 0 also indicates success.
> +	 */
> +	long (*process_bo)(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo);
> +};
> +
> +/**
> + * struct ttm_lru_walk - Structure describing a LRU walk.
> + */
> +struct ttm_lru_walk {
> +	/** @ops: Pointer to the ops structure. */
> +	const struct ttm_lru_walk_ops *ops;
> +	/** @ctx: Pointer to the struct ttm_operation_ctx. */
> +	struct ttm_operation_ctx *ctx;
> +	/** @ticket: The struct ww_acquire_ctx if any. */
> +	struct ww_acquire_ctx *ticket;
> +	/** @tryock_only: Only use trylock for locking. */
> +	bool trylock_only;
> +};
> +
> +long ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
> +			    struct ttm_resource_manager *man, long target);
> +
>  /**
>   * ttm_bo_get - reference a struct ttm_buffer_object
>   *
> -- 
> 2.44.0
> 
