Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEE5573AAC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 17:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86489B9AB;
	Wed, 13 Jul 2022 15:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0039B9A8;
 Wed, 13 Jul 2022 15:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657727820; x=1689263820;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=u+HvZMTDJ4rcG6CmdsZ7yPIK9U6kpBIpWhTByT4q1Lg=;
 b=UxLsq0AePtk/QILAMWbyqcREEFFM8he5sZCkTOFUk1tEmELPXZp9KGq4
 s48qDQtNrqovvWJQ942LN3Y6qsd6yiVV/i+Tg82mM/oOEGLMyqh1ZT8aZ
 ybCqnWpSLEOmJpu8fwKvJP3Ttk97aiFfUe5Gus2n1dxDqIrkQdft7A26+
 F1rVOkduQ8vOrgLgD2OVMfhiuygjGCRP4IkyuJ6KtaNWxvNS7Q2+hqQc2
 3P2Sxi6xlsdc4bd0M1qMDCIZr7oZTWP0c+ZObkIWSDMzwhZygwRL2rnFe
 OEq/BdrQt6MaXXMlVYg4+Q6dcLEGNkaL7MuVi5dvBPO05BJwWCu6x2Gcu w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="346945158"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="346945158"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 08:47:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="685212283"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Jul 2022 08:47:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Jul 2022 08:47:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Jul 2022 08:47:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Jul 2022 08:47:41 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Jul 2022 08:47:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVMf9keglOgNeKYtQ3gaP9ALyqxdUQ0WRIodupa0phx6Qy+uVaDMzG4TnQtvrqa43hbH5IYSuzVG7fIs7Xyk4cGGvgfMG9U7gqPw/6KASMa69vyFGQtckhwDyDgD11kSvxecOvtF9M4RH3+P+NC9tXk1mZtRap9d9vY6SreUdYLH/rsaEZztrtp2Nop1c+vmxMl4i+EIVgfm+0pLvpCqtVvS1ozWOYISpvmZ7mGeCeLsBqo4M07xR49SC4Gsl7u3VdT0uFyZcZSNgH10SDIpxGlpEgHIg+jRWskLJyrQem9HVFKPkuufps38IUrK1KJYT46Pd+Kf8zRAk3kkCE8FbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wNOcae7OfTmwG9zj10l6zTKQvwGMTJxitto5/4kL0k=;
 b=VavfBQ6wVuGcPNiSNHeHby9ZuUHgnDHiBRn8PHjZ0mKIugZLSIRRQfhSkfnpDXTCIwFlaPkz1P7zRnpYt7vgGy6ph0clnAKjFjhnBw+yZdf4AGAnskNlr+X34kjTwmPt9+fvpgvrMNVmZ8SJ6QEpQUjgQ6SvMy+5SkQna7F9ZnFhZcDorSBSd/RM1XEFpqYa/u1/Y8vW9Ub4ZsydI1nupPTWzSUMo1YDgi6ZxfRq+xdKbCLkn92JTIpiv/35y9w8oeKWrdqnKqjoi+kReWGzb4W0qzLJnr20CCcmQRVg/VSPuwy+kzwDC/6fjl/k3+jeY+jxSwT7glHAVHoZW7esmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5522.namprd11.prod.outlook.com (2603:10b6:610:d5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Wed, 13 Jul
 2022 15:47:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::a012:82da:5edb:513]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::a012:82da:5edb:513%8]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 15:47:39 +0000
Date: Wed, 13 Jul 2022 12:47:33 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 2/7] drm: Add drm_memcpy_from_wc() variant
 which accepts destination address
Message-ID: <20220713154443.4c2qljbqdlrbaft5@ldmartin-desk2>
References: <20220426165148.1784-1-balasubramani.vivekanandan@intel.com>
 <20220426165148.1784-3-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20220426165148.1784-3-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BYAPR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:a03:40::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35dfb0f8-5174-4f71-8e98-08da64e70401
X-MS-TrafficTypeDiagnostic: CH0PR11MB5522:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d6fa23RV8bY95NnpOLLN8vUYIQwsyElDAuo5qdj1URwTygv9MhyCvNVo1uPzfz0Wp+MhaP9MgBj8yO3NdOuXEDPjceHugZYJw7VR3+0Nz8gVh1S3jfBg5QjwjzryWAWG9da9nJYz/KyyPUp81uRzIsjD1H+PfFFPjcJ8tte5o+q/0I2N6apLBm8qTCvB3moFvFIW8yYc3sNt3BfVDYheO/lcSQRC9YuA6t3l85lv+VYEbU0boF/d+8ZWnXLZ915F0Ll2sXie8oix5q0Ep4YnTdYaS1lrcli7FHVtFeutA/dyE3xEr6/DC5mKaMWyxYYkGp7MEMXWAOJhvkKLkqrzY3hf70pTOJeRutLtQTwpIyygCI2iEipAGLwHw/AK+PqEgiTKNcnAAJI8NueY14y3CGjiRJ0RqKBpL9EkgAnlgiaNSyfoJ2jeiSunGJEZ3NnAikSMHRMFYF1YxG1PPCdhSd0YvATO9QjNC9MvQsboMiCP/QpZjg32NL9czcFKcKbpKt14C6+Gajgd/nfYmMn0Y+KCsyakdsPGHQYC5SDUWbSweg7BGI1+8Le3P2OikUOVYxSN8QIqpGzawj+m/zrX39Z69j6h28u2zOqWCe5mlLFvgs8k6RGQ/nmzLaARyPpaJri/DPpoPh5BQ6ReTd++LOdHR4eeF7orp6Dl7ZuqbMUsS4cNPOBOeiYL4r3TKiXVmq8TXSCTpykuSgVoQG6xFAER/FbtfJIDMtSuIaNgvA8bGfnxPaG8fqQFEQs5aCCU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(346002)(39860400002)(136003)(366004)(376002)(396003)(6486002)(4326008)(478600001)(38100700002)(82960400001)(6666004)(41300700001)(6512007)(9686003)(316002)(54906003)(6636002)(66556008)(66946007)(8676002)(66476007)(186003)(1076003)(33716001)(6506007)(2906002)(83380400001)(6862004)(5660300002)(86362001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OoiYDfHi5nHwALkodVkkAP9H4zK84anMu5Toqus0Rm6he0n4MBMxPBDAofEm?=
 =?us-ascii?Q?YrgwFY9Rgy8h4qWABxANINWFM85fhDWOwsWzOM7Pc1da54Er3CSk4xpiH8w8?=
 =?us-ascii?Q?84GMh7+LGkkPcjhbXOCjwA/XbF74ctt8hLgxdgSnNv3pJ4HNNML8KcvzPd8+?=
 =?us-ascii?Q?1o2DuLW+KIkl0My34remele+5fQ6gFH1OJoyASqZz5BXlxnKkKKBwOYXlLVQ?=
 =?us-ascii?Q?wgHNSqEm7pUuB0DzPgN2y6KN64T1lKj5/VtWn4OCeSxo3OjIJNfL6cfpSuVF?=
 =?us-ascii?Q?2lsfg2uIPrpvW1HnhRn9eSEUF84aj7y85F2SimoEVXg/bD9ndUXzn0Hb+Pm5?=
 =?us-ascii?Q?p8JxXlbUS4XoKUQ+0Aioi9nazXVAtVjYdHwHJPBE+kzS9bVzEuaiphhVrIEC?=
 =?us-ascii?Q?eAo3LyB5Rl8yJb4RhKceK5maik0GRcSOY7BIfo4bgbpTG4y0a0+pFTVqiPXQ?=
 =?us-ascii?Q?qciTaGSpFJUkIYm3E5nXHV6YBMelW0ApFgZWhIVAwsm6GlUAGjpNUJ+H4BvL?=
 =?us-ascii?Q?YIc4zifWC3dDb5MsPaKJQqCDIGForEVf+bWn4C4HoZ86p1bKhDoHEox7SSmk?=
 =?us-ascii?Q?i4Su/cC3nKgOb18PofDzdsxAO73jaSvUk7tPrN08ln7UrqBG70q0ZQh93C76?=
 =?us-ascii?Q?jIYppAqQFtfd5vNfRnh4nit4XGA8OyJDAGqmLLFiJV3oQ91/2a/HsfKMyBZu?=
 =?us-ascii?Q?4++Ix5qe7YcWvQauNmAnT3yFR2H4+XeRNi7fyywvx9ZhfZvPsVmABeIdsiZ4?=
 =?us-ascii?Q?F/Piy7VXYar2CT8AMdzT7ht5js7GXJDKvzHIMqqsXhWaEwJeb6iQVZvxKU8u?=
 =?us-ascii?Q?SBujtQHv+3pZN1OOZ1cZxjyTuaEeikooFtRSvNEgnUolsljEsMeaZsm95NZo?=
 =?us-ascii?Q?2kj+v0jfpNS2oma2J5GuDFrlDTG/+PI7GdMNIIbK6eeSNU0S8W5mtg3SD99Q?=
 =?us-ascii?Q?fgoTY0uYNIVc7hXZS0jduX1hoE2MHWtQzcrNxZ5uPK/ruKqUr4hyx0Od1oGV?=
 =?us-ascii?Q?uB2FCVv4hAgTlCQPSlNkRlTsRsJD18dl+aGo6ZQkvhw44Y8vmlr6GpzeMZER?=
 =?us-ascii?Q?J3u8JEorsnpjvQ9ZaL6NkwrQfKf5/K2UzPkYeCs7c1ZgjNqrNkf7XdjrFFAU?=
 =?us-ascii?Q?WrFQdGC77dwwRAkJKykSFWfz4kcjCnzvXkcBU1K5tjmq6obHpUn57TGYQFcK?=
 =?us-ascii?Q?Y5sosRrg+HPrCDDMgHxOIRsc/90oNdH1bo/JBlbSN3nEQ8PsW3dkyo/u5bJo?=
 =?us-ascii?Q?lBZSIEXH0qN1DZV1QdnkfEBuY9ozx+RSq8VUO5qijUCzkaxoYrBNtOA+D5hz?=
 =?us-ascii?Q?mOijJva4YjgwS85otdTN9kmn3ngJdg40FAX+T0LdnK0FXnJy9jIiJ7Hr0FDv?=
 =?us-ascii?Q?FwL6sxRgeIF6tIZr6AOCr9dVOOMtN8ec68A15ZOrsjBOhWMp7RiO9PzTVFTC?=
 =?us-ascii?Q?8p955X21QjXmfdomaO6VaX3g7anEfDVeWkHLt7O2QDdKZ2lk8dwYdv/gUK0+?=
 =?us-ascii?Q?++drgZTam/0bSHRqk6lf1UvH8MXXVHQ2KQVEq7jcg4rEMYflwvkZCponRgqC?=
 =?us-ascii?Q?T2Z08Iyj+TR2zxoDvn8dlW7RexNz0QPZ+r4S/5z0BExtqeuKJKZyf4hhtXLd?=
 =?us-ascii?Q?yODmeiUsksr22fLrdQr+TynOJfaPr2zJrGo65J/aAvJoAFzMtwwLU93q4kfx?=
 =?us-ascii?Q?/v6CDg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35dfb0f8-5174-4f71-8e98-08da64e70401
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 15:47:39.6904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ay5Gk9ZP3HdbOYpgh9Hd1OyU6i/UqccNeEIpwKnE6E/osKCWYk3c3D+hWd3oMptIioMdVrglctrf1PiIixRHuLJghEekMPDZvzNFYUCql34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5522
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
Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 siva.mullati@intel.com, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, christian.koenig@amd.com,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 26, 2022 at 10:21:43PM +0530, Balasubramani Vivekanandan wrote:
>Fast copy using non-temporal instructions for x86 currently exists at two
>locations. One is implemented in i915 driver at i915/i915_memcpy.c and
>another copy at drm_cache.c. The plan is to remove the duplicate
>implementation in i915 driver and use the functions from drm_cache.c.
>
>A variant of drm_memcpy_from_wc() is added in drm_cache.c which accepts
>address as argument instead of iosys_map for destination. It is a very
>common scenario in i915 to copy from a WC memory type, which may be an
>io memory or a system memory to a destination address pointing to system
>memory. To avoid the overhead of creating iosys_map type for the
>destination, new variant is created to accept the address directly.
>
>Also a new function is exported in drm_cache.c to find if the fast copy
>is supported by the platform or not. It is required for i915.
>
>v2: Added a new argument to drm_memcpy_from_wc_vaddr() which provides
>the offset into the src address to start copy from.
>
>Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>Cc: Maxime Ripard <mripard@kernel.org>
>Cc: Thomas Zimmermann <tzimmermann@suse.de>
>Cc: David Airlie <airlied@linux.ie>
>Cc: Daniel Vetter <daniel@ffwll.ch>
>Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>

		   ^ utf-8 error?

>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
>---
> drivers/gpu/drm/drm_cache.c | 55 +++++++++++++++++++++++++++++++++++++
> include/drm/drm_cache.h     |  3 ++
> 2 files changed, 58 insertions(+)
>
>diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
>index 2e2545df3310..8c7af755f7bc 100644
>--- a/drivers/gpu/drm/drm_cache.c
>+++ b/drivers/gpu/drm/drm_cache.c
>@@ -358,6 +358,55 @@ void drm_memcpy_from_wc(struct iosys_map *dst,
> }
> EXPORT_SYMBOL(drm_memcpy_from_wc);
>
>+/**
>+ * drm_memcpy_from_wc_vaddr - Perform the fastest available memcpy from a source
>+ * that may be WC to a destination in system memory.
>+ * @dst: The destination pointer
>+ * @src: The source pointer
>+ * @src_offset: The offset from which to copy
>+ * @len: The size of the area to transfer in bytes
>+ *
>+ * Same as drm_memcpy_from_wc except destination is accepted as system memory
>+ * address. Useful in situations where passing destination address as iosys_map
>+ * is simply an overhead and can be avoided.
>+ */
>+void drm_memcpy_from_wc_vaddr(void *dst, const struct iosys_map *src,
>+			      size_t src_offset, unsigned long len)
>+{
>+	const void *src_addr = src->is_iomem ?
>+				(void const __force *)src->vaddr_iomem :
>+				src->vaddr;

checking this again... this is a layer violation. We do have some in
the codebase, but it'd be good not to add more.

later I'd like these memcpy variants to be moved iosys-map. I'm not sure
if Thomas Zimmermann or Christian agree. Cc'ing them here.

Maybe we could scan the codebase and add a function in iosys-map like:

	void *iosys_map_get_ptr(struct iosys_map *map, bool is_lmem)

... which is similar to the ttm_kmap_obj_virtual() function we have in
ttm.

so the cases where the layer is violated at least they come from a
single function call in iosys_map API rather than directly accessing
is_iomem/vaddr_iomem/vaddr. Thomas/Christian, any opinion here?

Lucas De Marchi

>+
>+	if (WARN_ON(in_interrupt())) {
>+		iosys_map_memcpy_from(dst, src, src_offset, len);
>+		return;
>+	}
>+
>+	if (static_branch_likely(&has_movntdqa)) {
>+		__drm_memcpy_from_wc(dst, src_addr + src_offset, len);
>+		return;
>+	}
>+
>+	iosys_map_memcpy_from(dst, src, src_offset, len);
>+}
>+EXPORT_SYMBOL(drm_memcpy_from_wc_vaddr);
>+
>+/*
>+ * drm_memcpy_fastcopy_supported - Returns if fast copy using non-temporal
>+ * instructions is supported
>+ *
>+ * Returns true if platform has support for fast copying from wc memory type
>+ * using non-temporal instructions. Else false.
>+ */
>+bool drm_memcpy_fastcopy_supported(void)
>+{
>+	if (static_branch_likely(&has_movntdqa))
>+		return true;
>+
>+	return false;
>+}
>+EXPORT_SYMBOL(drm_memcpy_fastcopy_supported);
>+
> /*
>  * drm_memcpy_init_early - One time initialization of the WC memcpy code
>  */
>@@ -382,6 +431,12 @@ void drm_memcpy_from_wc(struct iosys_map *dst,
> }
> EXPORT_SYMBOL(drm_memcpy_from_wc);
>
>+bool drm_memcpy_fastcopy_supported(void)
>+{
>+	return false;
>+}
>+EXPORT_SYMBOL(drm_memcpy_fastcopy_supported);
>+
> void drm_memcpy_init_early(void)
> {
> }
>diff --git a/include/drm/drm_cache.h b/include/drm/drm_cache.h
>index 22deb216b59c..d1b57c84a659 100644
>--- a/include/drm/drm_cache.h
>+++ b/include/drm/drm_cache.h
>@@ -77,4 +77,7 @@ void drm_memcpy_init_early(void);
> void drm_memcpy_from_wc(struct iosys_map *dst,
> 			const struct iosys_map *src,
> 			unsigned long len);
>+bool drm_memcpy_fastcopy_supported(void);
>+void drm_memcpy_from_wc_vaddr(void *dst, const struct iosys_map *src,
>+			      size_t src_offset, unsigned long len);
> #endif
>-- 
>2.25.1
>
