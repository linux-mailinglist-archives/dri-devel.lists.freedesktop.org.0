Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D2A68E37B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 23:38:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8EBD10E2C9;
	Tue,  7 Feb 2023 22:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78CE10E294;
 Tue,  7 Feb 2023 22:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675809490; x=1707345490;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SMEHkxiJpWJek28a8MkZ1XetVlSh+RpTSJpjxVv7Asc=;
 b=gTbl/v1c+toXCDGBv0xo0dXkum6d0SFl/Q4qa8eoqPWhNLNz30SL4c5Y
 9FKsXy0MGdiAhjgLX3D/lB7sJi7zeeprocGnMwdh4zeGFvreQV4l1THWk
 dUjLGnq0Kwa0+ESBcz+LK/QK2DnrQ5MB/GJbBPgsJO/92R52UWvQJk+jK
 H+SHLRWM2f7kMeDUSFDAQfPrkP79qJ5WBK5VKIevhq0UZPNx4O2wZxkVQ
 eIxaGI5AsPc/UwI1yQGxmjbbLEEmCjBMvcA59uv5xRgwcihghrssjMZPx
 QHwn11kZnYBtuRHFG5r8ic5zHWCday3viLyxz5wdzICev76BE9Ak1mXWK A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="309295096"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; d="scan'208";a="309295096"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2023 14:38:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="660422044"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; d="scan'208";a="660422044"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 07 Feb 2023 14:38:09 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 7 Feb 2023 14:38:09 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 7 Feb 2023 14:38:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 7 Feb 2023 14:38:09 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 7 Feb 2023 14:38:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=REE7qouWY4ZDZP+qxbCa81XzJL5wgUkb2p+dHG7bwapzqYqoxqIMWsBtw+vmjEziVKJ6NoI1NACwUqBAgUDXqaNO55mabmKd9rs3Q4zfp1wptL418GHRkULiHZYKiTuBB5u9nA+WWm7fhKl8YFQM7P2r5e8f5JmKgyhtnDnxaX8E/yaX1d4M1uB9JCHK4X1IQ49OZj45AqlP8xGuPpGSwsRlY24N9KSyq+kZFnQvj9rINKhJUIV7AWme2ixgf2ahuYQqywzbh7lN607gE+BdermN8PX3flRAIm9TtjmZXRZj9HmAWro6i0eGxtAWcRmpTEaWkGy6wMGa9oO2oJdjqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ld3v8JR5T+MMgcuKfXnW2kF2yixL32kKp/CBlJ/xkz0=;
 b=MO16+P8sjlhVHaL4cy55vpw5bw2gIechmzVOMKR+FoWx2D6+NbtcGI7T2aBC1jzJmIlkdoVzNrRkzUG7HUu9WualDGUciHAmVtmi/bkWaSu4jgw8N3ZfypUZ55mnBRJxNXS8Pt/9/hjftreeGhHKvuVoeuZfKx7nHeSLhXnEgYuP+sadN2/6Od3si/pRnWf1oClP4+HgVcW8jClbXy08an3fjMeXOYeshFiPZYufaY5qJ+aRcWV0UxetjQhzfto6psVCHnWQeu3GNWuIw7Ap68c4VQXTOhnwi2PgtaK45xQVwjoV0ChFt2e9m0TpCcmDlkqX5RjDDfimk/N4SBtpAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by DS0PR11MB8206.namprd11.prod.outlook.com (2603:10b6:8:166::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Tue, 7 Feb
 2023 22:38:07 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::8808:cbc4:63f2:eb7e]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::8808:cbc4:63f2:eb7e%4]) with mapi id 15.20.6064.036; Tue, 7 Feb 2023
 22:38:07 +0000
Date: Tue, 7 Feb 2023 19:37:58 -0300
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915/selftest: Use forcewake to
 sanity check engine wa lists
Message-ID: <20230207223758.dzttji47phxgogp6@gjsousa-mobl2>
References: <20230201222831.608281-1-matthew.d.roper@intel.com>
 <20230201222831.608281-4-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230201222831.608281-4-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::15) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|DS0PR11MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: d41be6f9-25f6-42e0-448a-08db095bfb8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yq4YiKJaPUOjrQePN8nFUigY35XlhIFzpu3RaK1wizHrWxp1bGyv1oMijRI+8o+tjZw7zgPgIYf9PP4j2vuFv8yVFg0OlXJvUn2PuYjLb1cCZYuIrifHA26m51WASDYsbk50dDw6Ack+4IPRqsu0rTxUUwUnggCrlppawZVDC8HHB49qCgzfL3zgX1sX6FbyRQiYF0W4f+s2t5wCjaF+lZpgTM+dh2W7KHmNu2SqJ2SqSg+/30FEOBfsRec1Ox6YXmvyHbWuZNbpHnqqUjEYlybyMzlmyDogRp/Sn0OWfqVZf7uU6UJi4+5cfdzhmxZfIKka/TscayHV6HrQMLxwbRSGRV74PeyRnmyZff7AYoPAipVqQ/CboRfklu4M/+DBnLVqd+ua4DcX3Ffdp6qVe/VQC0XaY9fQZKuZswSpWQULqZKSzQNQW1Esz48PVuLD2EEc6rQYFnA1MEM0+WytdZ3LlbI7Rd3UtDm0Ep6aua29VdNwREeSTk8/M5Xp5lkEsHqZ9TZdA36zRSsB5pcNmT3LXAPPFkGnD7HaRt6Dzsx7JBVfk8T5TJYr4FujnIBTlGFhl+9LMmRisQXJjvfMj2q+aKRj9GxmneJT5GB25bbdFKSECkGzg82Q634MRFZAYMOqG8QwBQn4nemMlC2nyg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(346002)(136003)(366004)(39860400002)(396003)(376002)(451199018)(33716001)(86362001)(6512007)(8676002)(2906002)(44832011)(5660300002)(8936002)(41300700001)(66556008)(66476007)(4326008)(66946007)(9686003)(186003)(478600001)(26005)(1076003)(6666004)(6486002)(6506007)(38100700002)(82960400001)(450100002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YryZKlC4dWI/vVcXExMqg6ehUFlft6Oimmz7G8W8D5rHe5zeCyMPjfm5UlgI?=
 =?us-ascii?Q?zh+HK3kVUeHawtOL8n7P1gB//x0F2Jj1L7TxDjFhfkge5UahFVtx9HrQ8toA?=
 =?us-ascii?Q?73rTk1M7hx1zXKBnNe3FK1uR64P6W99UjgOsE+YoFnTg3AKbACLRa26tfqTa?=
 =?us-ascii?Q?eTs/zmU8P8ccdyoD/zYdwHPbl831TUVjGmnqmocnYux+1bGWbuBY+FSQ3ore?=
 =?us-ascii?Q?ZI44pHQT2oaqzMZsf6IhUBiXB3cvd1QN+OIUpuGzQ0fB9SbGz/2mYbuVmWoN?=
 =?us-ascii?Q?QDnEOvUThAP7WTvjWk6s0cfJBjFfpdv7stfXxyYuTOwVEaq83EdfhKkmzyCL?=
 =?us-ascii?Q?SAzRD6VCA10FQJvBXwnUFP2kTE9In+o9mXAjd6UnxLCBBMB2+M+Tvop1aiY6?=
 =?us-ascii?Q?Vlkd1IJgEZoHf7FM4poiWWMim02yZjkoC8cfCS01iCzwN4bpwKacyhRLg4q+?=
 =?us-ascii?Q?U0JT1iVCAcd63hyGpEe+CNao10qMsV6SQCIrcJYnr71XlVmreu3kpbdWr/PG?=
 =?us-ascii?Q?xAgERl6jVwfQBnDFIgTipQp9uYUow1WDYrfBOjyIjocLOhXTsn1J7UxafG8n?=
 =?us-ascii?Q?VXPU9sPkv9WgadXbFp75jaMAv8W1x1OFLLCh6SdjPxbq6SmPDaXesnlofoIx?=
 =?us-ascii?Q?nGMqmvJM0b69tRzheqAJMjsI2+lRq0oGmHbKNqxOfoBbGoAxvNFCCCFfc782?=
 =?us-ascii?Q?JIpoEEs6U0rPf83XYc6K4i3U/QpvL/IRprPFZiuRmK2ktNAMibtaf89d39OH?=
 =?us-ascii?Q?whNig8hAX6LC/SHTf8xYfnElaDDeRbo+SRT8/n/sCEj3GSZAukaXbleyHZiB?=
 =?us-ascii?Q?2o/GbW6nI5/nw7L/fOQVl7EHbjrQmzLoFUkJLQzy+kSCJHKAp2V6ivLrWi2m?=
 =?us-ascii?Q?YJI/eAr41+5ZRIfIdZWEEgwChj+B3bBowfFivsMGeZlJkhiRG0OvT3beCXXF?=
 =?us-ascii?Q?MO2t9ozXiDvZTdNDlY7yExiwRF6mVO6SRdvt8wJVYyMPK2pI5f0JIHt94Fyk?=
 =?us-ascii?Q?ngO1qmHZzObTYc0rZ1GgVi9ihd+M680LDlVXP0oRTlNbHMyT5z5gL5xaMXdO?=
 =?us-ascii?Q?ZJvuz6dtEgETJSreoKALHbOkAJJ4+wSKkjnvgSrpjslVNS3jiCcSvHmANb/d?=
 =?us-ascii?Q?rXpyQvizuAq/E4anEpgcC0jmLAxg4jtf4yd009JQQLJD/4EV3yOwUS2UlZt6?=
 =?us-ascii?Q?qwYQMOVCBa6lauG4GKKGoCRhDruB3SjlRJL2poX5GYayh/cCL0qkM2grUvZ/?=
 =?us-ascii?Q?8dHRDKQ4Iymc8esZUjQs6W6ZAhswMF05gGq5pJCDZzl+9ihNmN4wQYb4YBh8?=
 =?us-ascii?Q?4e/OA426dfYd/nkneNUa0DSi26RF5KF3QCpsN+POUOXyhTKUAQuaBw0t17Bw?=
 =?us-ascii?Q?A7r4QdN44c1LIj3Ea3HPg2d3kXuCDP2HLHnBvuuEYsabxnzBVjZqIv8H490r?=
 =?us-ascii?Q?LqYDP8UZ/mjdn6u8dFOs89cG2HArwZp5fGvu9wbEyQJljDVtqOGW86g8fJJp?=
 =?us-ascii?Q?6sakJCZ/sY3k0BEurU5jnU1tHeh5miQr+ShHOBun3D9+cHeVafgp3K/kzrg9?=
 =?us-ascii?Q?vMCXCGIo3WMrj3vZAH9ssKFRRb2GY6m7vH7B32csqX+9IMADfPrJtNh40kxu?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d41be6f9-25f6-42e0-448a-08db095bfb8e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 22:38:07.2635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Il2MDXV/KcOb2cK1E3Hm7e0c+Czyru1JnM6vCYTZB8WlCpP5HU+StLy9WLYIPon2ga3wADazck+EiZU7KoYq8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8206
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 01, 2023 at 02:28:31PM -0800, Matt Roper wrote:
> Although register information in the bspec includes a field that is
> supposed to reflect a register's reset characteristics (i.e., whether a
> register maintains its value through engine resets), it's been
> discovered that this information is incorrect for some register ranges
> (i.e., registers that are not affected by engine resets are tagged in a
> way that indicates they would be).
> 
> We can sanity check workaround registers placed on the RCS/CCS engine
> workaround lists (including those placed there via the
> general_render_compute_wa_init() function) by comparing against the
> forcewake table.  As far as we know, there's never a case where a
> register that lives outside the RENDER powerwell will be reset by an
> RCS/CCS engine reset.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  .../gpu/drm/i915/gt/selftest_workarounds.c    | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> index 14a8b25b6204..1bc8febc5c1d 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> @@ -1362,12 +1362,64 @@ live_engine_reset_workarounds(void *arg)
>  	return ret;
>  }
>  
> +/*
> + * The bspec's documentation for register reset behavior can be unreliable for
> + * some MMIO ranges.  But in general we do not expect registers outside the
> + * RENDER forcewake domain to be reset by RCS/CCS engine resets.  If we find
> + * workaround registers on an RCS or CCS engine's list, it likely indicates

I think "workaround registers" is too general and makes the sentence a bit
confusing. I believe you mean those registers mentioned in the previous
sentence, right? Maybe s/workaround registers/said registers/?

> + * the register is misdocumented in the bspec and the workaround implementation
> + * should be moved to the GT workaround list instead.
> + */
> +static int
> +live_check_engine_workarounds_fw(void *arg)
> +{
> +	struct intel_gt *gt = arg;
> +	struct intel_engine_cs *engine;
> +	struct wa_lists *lists;
> +	enum intel_engine_id id;
> +	int ret = 0;
> +
> +	lists = kzalloc(sizeof(*lists), GFP_KERNEL);
> +	if (!lists)
> +		return -ENOMEM;
> +
> +	reference_lists_init(gt, lists);
> +
> +	for_each_engine(engine, gt, id) {
> +		struct i915_wa_list *wal = &lists->engine[id].wa_list;
> +		struct i915_wa *wa;
> +		int i;
> +
> +		if (engine->class != RENDER_CLASS &&
> +		    engine->class != COMPUTE_CLASS)
> +			continue;
> +
> +		for (i = 0, wa = wal->list; i < wal->count; i++, wa++) {
> +			enum forcewake_domains fw;
> +
> +			fw = intel_uncore_forcewake_for_reg(gt->uncore, wa->reg,
> +							    FW_REG_READ | FW_REG_WRITE);
> +			if ((fw & FORCEWAKE_RENDER) == 0) {
> +				pr_err("%s: Register %#x not in RENDER forcewake domain!\n",
> +				       engine->name, i915_mmio_reg_offset(wa->reg));

I think it is safer to use the correct member (wa->reg vs wa->mcr_reg) according
to the value of wa->is_mcr. Coincidently the reg member for both types have the
same offset in the struct, but I do not think we should rely on that.

One issue is that, unlike i915_mmio_reg_offset(),
intel_uncore_forcewake_for_reg() is not implemented with generics and expects
i915_reg_t. A workaround here would be "converting" the wa->mcr_reg (when
wa->is_mcr holds) an i915_reg_t by copying the correct fields. While this is
trivial since both types have only one field, I think the proper way
(future-proof) of doing that is by having a dedicated function/macro to do the
transformation.

Thinking about an alternative approach, do you think we could say that
i915_mcr_reg_t will always have the same fields as i915_reg_t? In that case, we
could tweak the type definition (or at least formalize via code documentation)
to reflect that and then it would be okay to always use wa->reg here, as
i915_mcr_reg_t would be thought as a subclass of i915_reg_t.

> +				ret = -EINVAL;
> +			}
> +		}
> +	}
> +
> +	reference_lists_fini(gt, lists);
> +	kfree(lists);
> +
> +	return ret;
> +}
> +
>  int intel_workarounds_live_selftests(struct drm_i915_private *i915)
>  {
>  	static const struct i915_subtest tests[] = {
>  		SUBTEST(live_dirty_whitelist),
>  		SUBTEST(live_reset_whitelist),
>  		SUBTEST(live_isolated_whitelist),
> +		SUBTEST(live_check_engine_workarounds_fw),
>  		SUBTEST(live_gpu_reset_workarounds),
>  		SUBTEST(live_engine_reset_workarounds),
>  	};
> -- 
> 2.39.1
> 
