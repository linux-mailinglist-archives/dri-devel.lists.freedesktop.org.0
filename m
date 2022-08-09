Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BAE58D72E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 12:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E52CE079;
	Tue,  9 Aug 2022 10:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6A6CE04A;
 Tue,  9 Aug 2022 10:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660039805; x=1691575805;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2qJyjHhhuBFnqFA6l5a3FhIyOMnn4jWfqXBTKLipnRk=;
 b=cEiUO+L5zY48wFMWXHpr9whjenZ3ksJiRLOWsqNhE3zSkwLF3Ke7dxKS
 zuydby/8ApFdp/ihSW3bB/9Drnx8ixRMH2EvjIJQVa/diu+dWa9E8Iq/q
 fl2ymVO7KhtsGn8UsgOArfMasyIfj5oUygAP00H0ugjffBgZMoujzyzZg
 1zw2DluEMm/yzJS7eayx7vUt0sOYfQmkZQKLDkbvL0TtDU2KEA+WyoV97
 ClSu4lUgVrsAqEvX88EH3vTKyH0YmoRFZL95M87ElvN+iDmZLfwF/7q/C
 yUzqpJ8UoxZZUQNlVBZ9OasSfNtaJ+dM/vHdp4qfBA92v6joSvlVol7v+ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="292041987"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="292041987"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 03:10:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="604706283"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 09 Aug 2022 03:10:03 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 03:10:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 9 Aug 2022 03:10:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 9 Aug 2022 03:10:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWsDWpJOITd1NWiPI/caj+/EaRJ330KOP6TrXYwK36PSGgO0hCQiDFx8lHyqaTeITpHNZEdS92r2U/POwRmu0caCzFqc4Hu2+5/1KWkttuyrUQXNmIy/ElkXfLDe89lAMVNqjtQrx7qik0rxd0M7zUpmSP08f18jgahMeHBIkExFBXQhqRc2qdolzm89XPkBzrf4uOzHilgd4NGvxJaErkG+8LyC4d5TRiMbmcCmEXLrmfK4lE0YXtDPF+kjSuVlDJR6Tox04KzW4ZhUh7c50WorUp8d1aIYNc7wcm3wGYLpOfufjiRMQIQ6jDQCuw+Oa44exWt+iWJPUtb0jXXVwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtyWFpduY1DeSQ6gVyer6vVMx1Z56wDZ+VtfkSWfIh8=;
 b=GUZ/CPsO40AmGurV9EqFc3plFCmqpOtTnuFrOlkmreaEH0unCCz/H6XUj5fQD4JruSSXA3wxTuFKCrRPabKtg8smPIxBeWHQ+M/rKJDt8GitxW9at7nxfO3OAOsNqaFa7/8dd1C24wtxOJ1FwJ/oucOIJgGt9ppsTgx2Weprt/RjFiCiS6kwMZziFWxIs6LJJWnBqVGkBFCrwS6PeaTOV0HkcqvMHbaOf1EEy2g9g5E9whCeYV32iNMYSbEtjIzYxUnM7g6BiyI7XtMujt7nwwr3phryjp6XLunNuj7hD3a+jOqSrD+5eNz3A2tn6tdugiAKP5CBsaIg1kM3C8DLeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN6PR11MB1393.namprd11.prod.outlook.com (2603:10b6:404:3c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 10:10:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.014; Tue, 9 Aug 2022
 10:10:01 +0000
Date: Tue, 9 Aug 2022 06:09:56 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 36/39] drm/i915 i915_gem_object_types.h: document
 struct i915_lut_handle
Message-ID: <YvIydIV6ozIabt3A@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <6bdbfc5a739deceba57175269cc8e129ca481ed9.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6bdbfc5a739deceba57175269cc8e129ca481ed9.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: SJ0PR13CA0149.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 636808cc-5237-495e-925f-08da79ef5269
X-MS-TrafficTypeDiagnostic: BN6PR11MB1393:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hGaTy8L+JOejAy3OlC2FlnVCgGbXxMhR+Bjh/foHxxSATjR8yCKbVaEbxTjcbaGAJDQpEBnZpVFJk4Vccty3x2Ol44/7/6oVsmcnEObmRbuVfooz5S6wp2uy9KlwOKz9vTg5On4mq09AZhMTHLSRLteRX7MTEqmJojHGVDkQ2gSef/UiYJ8IAzAg5rln+eP1LbWuTiWQE3+oOgu8xyA6fj1m2A+rVNJMXCv/gJtDilf5v+zm2iQ4Ncd207khpJ22CazbxQ1IorMku14XJM8mAOobLugpdEiKkv2cAQotyiYhCofD76hHXBSPn0ADY8Ykutdk58oNXOo8qvho0hCC2usGReSKFR4o4ta5W/N5XJ/BIRMp11XFB5ufbuvmkvEMC50OgHnwRS5hAdrJzOV82lmucC2eDgj8hso4kXfq8M8oyygPfThcPNd5PHEYE3JEOnqt7rv5zTvLMagKkZx+H5dXGNlj0GtQ8Q5KQ1Z5ZhVvpqVX7ihCOuycL4xYCF/MVDq/kN7DJZ/Lf+Dlo8TeN+FzzzpthgPrrmQlToFYthYapzRgCKggvb9t7NBTdg/I2zj1CRJ0AJpSdPG+DNdRJRMhh3ytC9626CYwrhne1/JUobR6G7ZsVuUwA9JLJote7fn8Pz1ZNyMCF5GEmd1BohjRo3MkBiyWSw/1hVOj+BHFzEk0Mdbo1C4FCfnL2/0JycOb2I2SlFB7cQyzTmQTCKlp7Uip0pIvl5BPUVLZryJ5J96YTAKzIeB3tf1HjLDbJ6bLDk9MlskwQLE8G0tgiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(376002)(366004)(396003)(346002)(136003)(36756003)(8676002)(66476007)(66556008)(66946007)(4326008)(44832011)(5660300002)(8936002)(966005)(6486002)(478600001)(316002)(2906002)(6916009)(54906003)(38100700002)(6666004)(41300700001)(26005)(86362001)(6512007)(6506007)(2616005)(82960400001)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oTobCZbZbW7FcNy8u6iBots5uqy508MGTeFWpL0s4ZPaTQb4VxjEV7SlLzaF?=
 =?us-ascii?Q?v0w08WC8SDcD/WX9j0s5vy/MZdU1ITCyTH+rC/EdSGjVwcOK3Gc7K9VDkCQi?=
 =?us-ascii?Q?ZMR+7m2i/ik5lO+kuhjKa9b2WsvV3U18E/Rmhi5XmNK72hK9mzNS3MxhO/Um?=
 =?us-ascii?Q?E+kf4vVMnhhyKTNWcy/65rvuqkG+rnGSXN8+2FwM+P7DPafYrknvyBrttUwf?=
 =?us-ascii?Q?RCjP4hLA07/FjEWREMo1AIah3EGf9C6FWWOzJ+Q8IlCukL3AL5RdA0TG+l25?=
 =?us-ascii?Q?/1I7kYaEZQo3VVCpB3yIJcn6ES8kreWcUHWTh3n/cAVgVrdeXd/SCkkbHjyr?=
 =?us-ascii?Q?dnMSlvGjRJJdpF470eqOqekM5/xxJbLYr+hD4CLWQUDTmxCmUqJcaXQfZQN7?=
 =?us-ascii?Q?Z5iV69cfnXGyFdVRv1E689amVEJxUHBhMB6qatkm3Aq8mH+5Xs2Z30j9LjMX?=
 =?us-ascii?Q?sTJDgae6pdphiScVkKsQfYfWIiPGMT2OVKIyBQe+yaIehD2NX9rFoZ4M/zPg?=
 =?us-ascii?Q?xFcWmBTprLWTzSG7het6u/lsrgtNKxeF6MI/U/gDTTAkzhNCGG+Y5uO4Olb0?=
 =?us-ascii?Q?E09udltlt+9eLNzUYhLKvMihJZNdXAZ9oTJnRunryzDvugSHJ4RFsbD5ADsd?=
 =?us-ascii?Q?66rk/T7yIgjcYEURsjxXyawtZl4mnz5wDzf5cWiz0ZQTrO56WAUCGj33Gacw?=
 =?us-ascii?Q?ezldsFoTnHOf4P0Dul0o+vQ+t2FHU6OEj14v+ICgWey55H3y5By8GmUXoQaO?=
 =?us-ascii?Q?3aj2wu2j1QY4ua6/lV9shgtDeI39xcXCuYw4KyFzs5R1OOnG7xOzsMWB1k0n?=
 =?us-ascii?Q?K+t9gf//spF9GT78+JpnmezwARg8Lh99oI4gkQPdXrHOdbeRe2je/mpV0eGn?=
 =?us-ascii?Q?11+ulesk8y0lYafnpsWWY24Z2JAtZ0CooKjou9GepZiyHVpQe7EtjYzNmTWv?=
 =?us-ascii?Q?mjcY+rBDHr4/LvXlAJJKqYFi/obpt4/CtaQcey9cIQ1zTX6GbOgUq3s7TRLY?=
 =?us-ascii?Q?5POYJzqb1C9yeRaYVgSftBHmYE7b7mRG0b7aDRMtELi1o+8uJ+EllOXAiCnJ?=
 =?us-ascii?Q?ZgN5MbwdfHUzCnb1usuBT7+Si2UqSbPLl5cd3QlaV7nv4guRArkzdEHllC+j?=
 =?us-ascii?Q?3vtlLAdrOUjNZYuW9F1iYs4xpQeATkpw/D+pateK05oD8qs3tRPkzhtImdwe?=
 =?us-ascii?Q?a+5fYq29cu3Mvjr2R3pDcpsS4e4uezAIYgYlEbDqGmSVTavMVyVW3y3xUOEy?=
 =?us-ascii?Q?PU68XIYy8wdt3xap7rHpRFQZcUG6VjqkcpT4omtKlOP3zNv+LPezeIFdIyer?=
 =?us-ascii?Q?8U7qC02hs/JOy9gP91b6RAZ6jrTQPXsqjgK0RTTp3oYS4ejflNfxuQ3qvgyP?=
 =?us-ascii?Q?zYWjw6HfYapMHKFn613Lur/lvmI3vJeeIgF5dmhWbNSBCFfBloVZ4mXQs0PJ?=
 =?us-ascii?Q?5CPT4DOse2Yq7HCSoCAqvS2g6wOuePK3I/1O4Pe62ZOYbCzy61TIL4l9tykI?=
 =?us-ascii?Q?BSQXT1hiVROwCQfdHu9BcCIFUNMqJZ4vx4aFJEOfOY7neiP3nINyVS4MTdlD?=
 =?us-ascii?Q?t2RgqfpZ+V0wX3uFYE3srXdrnaUZonnouZxPb/4I88M+Q48tVph3wk14UA+7?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 636808cc-5237-495e-925f-08da79ef5269
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 10:10:01.5484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s8A8mjFdTHUJ1w6NJo5/7Db+EcbFMPiZZQ3TNOJ0iiOfnGPFhgZu8BFsyzSfgik1N1prfZnwvpU1ESQEnrEUxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1393
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:12:24AM +0100, Mauro Carvalho Chehab wrote:
> commit d1b48c1e7184 ("drm/i915: Replace execbuf vma ht with an idr")
> added a rbtree list to allow searching for obj/ctx.
> 
> Document it.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/gem/i915_gem_object_types.h | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> index 5cf36a130061..ceed0d220ce3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -21,9 +21,15 @@ struct drm_i915_gem_object;
>  struct intel_fronbuffer;
>  struct intel_memory_region;
>  
> -/*
> - * struct i915_lut_handle tracks the fast lookups from handle to vma used
> - * for execbuf. Although we use a radixtree for that mapping, in order to
> +/**
> + * struct i915_lut_handle - tracks the fast lookups from handle to vma used
> + * for execbuf.
> + *
> + * @obj_link: link to the object associated with the @handle.
> + * @ctx: context associated with the @handle.
> + * @handle: a rbtree handle to lookup context for specific obj/vma.
> + *
> + * Although we use a radixtree for that mapping, in order to
>   * remove them as the object or context is closed, we need a secondary list
>   * and a translation entry (i915_lut_handle).
>   */
> -- 
> 2.36.1
> 
