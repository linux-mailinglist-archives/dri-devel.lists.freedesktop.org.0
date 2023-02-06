Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A957A68C3CF
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 17:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A3E10E41B;
	Mon,  6 Feb 2023 16:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D45810E417;
 Mon,  6 Feb 2023 16:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675702268; x=1707238268;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UufWoSgZq2+MPItLyPydW6vmKlDtiyP5LKJo22E94as=;
 b=Vfn5yLSJZ54UucGKeBvnz2y97NrPGb3tvRRT9PrOVLxZ8zdAYAFZx1I7
 7CC1xb9S3ZmpcEq+ERg33SSVj2qV6o57H2bJ7dE3fv747uokfLiFcF9lT
 JtGkJUdqsuHxPlsyqZhSeN2t7jgJnbwDUrjUU8iN8wWonRZTYT+weOsjq
 E4ZlkRep/zREe+lk7tUBShE2zhT3g/4piXF6BTpcR+ximYg4vES2fUsKx
 9E77l8mzRMjSjtaG7q+De5QryP+012m9bP40C7xJsJMkO/CZB24xaiJPm
 IobVXoN6M1dC64TfTDMYl4guSTsdtk28QXGG5KURdNdNFzJxgIWnYs4Ld w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="356612521"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="356612521"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 08:50:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="790484128"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="790484128"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 06 Feb 2023 08:50:53 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 6 Feb 2023 08:50:52 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 6 Feb 2023 08:50:52 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 6 Feb 2023 08:50:52 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 6 Feb 2023 08:50:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLs7WPZiYXWvCs/pq4K9LVQtebk9LZpJYDCj6ua1uyuo39NRDJWYYNssN7cu9WU9GFZbbrN8VrmjagnJSnb3vYxQKJrLzaiaZQMBkhP0AW9G6GD6axPmJ+Kyp85mQDIeRu/j37WYWO4yGSEBpthT16sivSQkHzw/pIRZ1iBFpRRb1XI5XDTnPZUd8p3CEQLH1z30OOK/u8atl54yOdjZmGPknDk7d4TXsYh554J2cw3ue/YJXqLQZbbYQ/ezlV4lWQx4xJIApo5Jsh595V3noWBQSWv/wJ++N3WThNEEYysu23ucXg8zmRrmRcYYuWQYmMGHCbI7W7zzjwnjLV3FTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+Wn7eHhzWXs52RTGuZPuRNGvzzJAv0EvQP9H7J67EE=;
 b=hq79wOfr6cUvqldAFBOBJrcnbGJv28fSkuFQ5j4qD7FXC2p0E4x9vHGKc5lOYcXirRFHMJrLnxmFjHMSt5n/9NoO1pzxsnOhReUu1LiV2l6sXOsgH3pN9z9W7GGYKTR+l+Qa479PfgbxGMVhgBi48JM+1BGxWUZcSwjoPu+hmyiSkXedA8+YvDaZhMjp38GNkespzGQ//gn1ueddjDCvWjF3LUg/7H8nK/22OO+YDgLyCrQrqzCG0Vesa45PpWnjfBcfULl5HKjNRlYCmc7RxiJDpHKd+ZL6A3iIdkCRYr337cJWGr+UvRlAbCCG1kZIPdUEqrfkYcRBo99Dq/Ofmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6267.namprd11.prod.outlook.com (2603:10b6:208:3e5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 16:50:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6064.031; Mon, 6 Feb 2023
 16:50:47 +0000
Date: Mon, 6 Feb 2023 11:50:39 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH 1/3] drm/i915/doc: Escape wildcard in method names
Message-ID: <Y+Ev3x7WJaKGluZb@intel.com>
References: <20230203100215.31852-1-bagasdotme@gmail.com>
 <20230203100215.31852-2-bagasdotme@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230203100215.31852-2-bagasdotme@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0039.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6267:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e753bb4-12c6-4aff-9581-08db08624bba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jMp3RtKevxWePesGSnDN2fOK6FrduwRSeRVLQgXWVBmrjZFgE3kD7fnm3NjCbOdtwitWnvpgA7kI+0iPAG17KSt17L1AZjNza4Ch7DSoXt9gZf9oqKHeO2T77q0T35DZWOUdBqhzsuWxJdP1uqOpom18ia9ACfRMFm/Uy96bQ1mgaKQiuYIY1Ri/f4qRyDumBictQNAbyqJugOqmR6DrK8OU4CfLbgjtZm0+wcec67XTIIGqe9BME/C3U6hp8pewnk24fXOc3ah7/FZ+Wrpdc4SRguWnKInru6ABTUmDQAa/gKS2pzwNFDZQX2CkOxg2/9o7cus3+z4UdsLHf3Ixv4Qn/qM3vfbFLtFn/1Y6QteuFBfUUtyR9uRMw1yhtblQoms+RUAno2rsVkVw+7gejUjrYOf3n7AZyTDq1VVFJdxCXqIOCp1ZthMAU3xl3bvMnuSURxbRukTFfP6ZnZoL5wGUVfe2br1moOlz7ZgVRQXZQL+UJGGgUPFHcoVYrQPa7az9yckGAwhh6Fm12fC2UyavNROQgsqXGP9QA0x7LaqAlTX5VIbv8HJJRwEXVLp2A5YDS9Mh9TLRlR+jkbzQhDbBe0wLvkFA4ZzJCTLgpcOlK5ZQhthr+5Abz540AvoUifxeJT8n7HoBzZpJOFoSenBcLY+cd12CSP+D15e67UeeRySxzGbE+HDnUk/wZwviEyAjuUMeM30BlcoBV0tfKhkaEw/C7VMIBbjMXIK+kEk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(376002)(136003)(39860400002)(366004)(451199018)(7416002)(5660300002)(8936002)(83380400001)(41300700001)(86362001)(38100700002)(82960400001)(36756003)(44832011)(2906002)(186003)(6512007)(26005)(54906003)(6506007)(6486002)(966005)(478600001)(66476007)(66946007)(66556008)(8676002)(6916009)(4326008)(2616005)(6666004)(316002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IJNY1pKsZcRXXnBsqsIJ5+iWP8cAmUfFuavElFdoU5vXd83iKaDhROgVhjqz?=
 =?us-ascii?Q?wI6tuNYaQXc2+QPNj5s9LGrt3cztSaCyoPV8uGM9kpBDE7SOHYO3oxi7ZfuE?=
 =?us-ascii?Q?SPWCNKWaQhHRIwLvXBLVubQVnZgIBj0tjehI08tagjkQhdkCoQZD/+Ux17iR?=
 =?us-ascii?Q?OdkmVjGxiAaceSyhSUfBYffUa3yVEj/db9hFyk3majzyqz3ArtGkdXhDtTxh?=
 =?us-ascii?Q?8lrxR/JNXPpu4UqnTiZ/KyFkvCoILzX9KtMKWN2oA0JlXrjxn7ukOAamKKA8?=
 =?us-ascii?Q?1MBNNhoRA5b3IHCVcBo/TCvo88u2GmdWm31u80q0KUWXbge+0aLfdXsAKv1U?=
 =?us-ascii?Q?39ZzTFOvFY/lhI2lHP43A4002yD4cn++QwhnqwjM2DMN73P1NkqhinzyCtVh?=
 =?us-ascii?Q?bdUF2tis0HkTMRN5JGC5D5m7kRqA6NkC3Ls6Izv1Av0pvu5cBzF5pX/qwMJb?=
 =?us-ascii?Q?GLdnsPfnA1fH2/gjoisW+1PWKynwGUUt8OyeOFS0MRDxYt41YOkI8+QswQaO?=
 =?us-ascii?Q?V3sRE616xpNOJGcXFo0Ykd3K1DWDAcGtsGupT+eHR7f1krYcVJ6NTAGLH58z?=
 =?us-ascii?Q?P6+y72WhURxVtRd+zcOcul0DyDYV/yZQaB0D92AqZ1Ay08W8I54njcLTbnHk?=
 =?us-ascii?Q?vhYS98owsVUKS2uiFlXRCnHgDCtUSVS5B1Ypo0NiQoAHlaWVUXyMkAkNQgZO?=
 =?us-ascii?Q?csEivY8tT/dOyzSaxyvQQkqZljOj9175y7ybfjmBDMkgns/C2iPnzmMp+Tev?=
 =?us-ascii?Q?elwMBOfqR50ORlkeCnH0WxtVC0bDnhD9ncWsYvjXp1x0YU637Ysdsj3EPMij?=
 =?us-ascii?Q?6SdfDl6wWHONAlQhKuYBHncXkIGDH1iXbM+jT2mPKJaQVgvIp1fgXD9saFyl?=
 =?us-ascii?Q?Hi08zGHckfr2egcvtDmlfg1cd2Pnb8nG8/8xZtizucwW1VLduUnIfK2fJjLY?=
 =?us-ascii?Q?PQGTisIV3TW3/WjE4n7TQLseD+obJahijwWqlEUK1jNn7JwrLjEsEA7L3Wk3?=
 =?us-ascii?Q?MWl+n95uDSjiiNgegXJaathtinH8tM2ITlEPc1NDfMqOK5OG8h3/IrFZxAxY?=
 =?us-ascii?Q?QmO4zyW+XVZ9xPblUshNzGL7DXdsvJdIpMNE94ldZZB+krcmb7z7FaXRmP3d?=
 =?us-ascii?Q?RTqceM+e1h/4d2xlLJYdfPoyFIADR/yf71S3JdJRRQrSw7YuvR4roDdBnwsk?=
 =?us-ascii?Q?7hkEZcbhmoTYKiBa+cJ+Ny+adnofAR1OhXST/ijBs6H1+m6udaOjYLQpt/uh?=
 =?us-ascii?Q?M+wwvwdk2ESXUI3HTqrfuuS1eB3vivya0vOfdITMCmdrpcEHdnzBt0Eh2PVM?=
 =?us-ascii?Q?Z3xaCc9vokE2/ADgPDKKgNZOZK1zY1uvsBm7bcIsT24kpeFtmPE1jMfCttsv?=
 =?us-ascii?Q?9qh/9VV24UKfdMXMcFVSCHgHj5dBJDBlH7+gqqlzCaI6sXjCenI87zGcs+OO?=
 =?us-ascii?Q?TST6LTIu+3HHFCVyboyd02FvXFWDcfgnhO84DIPu6PR6Pd1cg2GjlEO3LSn9?=
 =?us-ascii?Q?OqeXn1CVCdZelWM5lh7vd0HFf0U39qtNnK8u6tFHlZPUuLgP3fy78/zkF7eP?=
 =?us-ascii?Q?GAv8Y+U2HWm27Y4zAv85zlFmAIFXX7bmzL++oL6O44s2U+u4jTORfUCYIoOQ?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e753bb4-12c6-4aff-9581-08db08624bba
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 16:50:47.7694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qw1JyyQIaS09Rf4ifI4E4M5WXksmrIOzvjpqiVVbz5TYbGH8Z4Y+ibFWja1GxYrrNmKe1f+LYhGTYC10OmR5kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6267
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
Cc: Luben Tuikov <luben.tuikov@amd.com>,
 Srinivasan Shanmugam <srinivasan.s@intel.com>, DRI
 Development List <dri-devel@lists.freedesktop.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, Matt
 Atwood <matthew.s.atwood@intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Intel Graphics Development List <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 03, 2023 at 05:02:13PM +0700, Bagas Sanjaya wrote:
> Stephen Rothwell reported htmldocs warnings:
> 
> Documentation/gpu/i915:64: drivers/gpu/drm/i915/gt/intel_workarounds.c:32: WARNING: Inline emphasis start-string without end-string.
> Documentation/gpu/i915:64: drivers/gpu/drm/i915/gt/intel_workarounds.c:57: WARNING: Inline emphasis start-string without end-string.
> Documentation/gpu/i915:64: drivers/gpu/drm/i915/gt/intel_workarounds.c:66: WARNING: Inline emphasis start-string without end-string.
> 
> Escape wildcards in *_ctx_workarounds_init(), *_gt_workarounds_init(), and
> *_whitelist_build() to fix above warnings.
> 
> Link: https://lore.kernel.org/linux-next/20230203134622.0b6315b9@canb.auug.org.au/
> Fixes: 0c3064cf33fbfa ("drm/i915/doc: Document where to implement register workarounds")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

pushing this now.
thank you.

> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 3111df350f5722..a00ec692d980c0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -30,7 +30,7 @@
>   *   creation to have a "primed golden context", i.e. a context image that
>   *   already contains the changes needed to all the registers.
>   *
> - *   Context workarounds should be implemented in the *_ctx_workarounds_init()
> + *   Context workarounds should be implemented in the \*_ctx_workarounds_init()
>   *   variants respective to the targeted platforms.
>   *
>   * - Engine workarounds: the list of these WAs is applied whenever the specific
> @@ -55,7 +55,7 @@
>   * - GT workarounds: the list of these WAs is applied whenever these registers
>   *   revert to their default values: on GPU reset, suspend/resume [1]_, etc.
>   *
> - *   GT workarounds should be implemented in the *_gt_workarounds_init()
> + *   GT workarounds should be implemented in the \*_gt_workarounds_init()
>   *   variants respective to the targeted platforms.
>   *
>   * - Register whitelist: some workarounds need to be implemented in userspace,
> @@ -64,7 +64,7 @@
>   *   this is just a special case of a MMIO workaround (as we write the list of
>   *   these to/be-whitelisted registers to some special HW registers).
>   *
> - *   Register whitelisting should be done in the *_whitelist_build() variants
> + *   Register whitelisting should be done in the \*_whitelist_build() variants
>   *   respective to the targeted platforms.
>   *
>   * - Workaround batchbuffers: buffers that get executed automatically by the
> -- 
> An old man doll... just what I always wanted! - Clara
> 
